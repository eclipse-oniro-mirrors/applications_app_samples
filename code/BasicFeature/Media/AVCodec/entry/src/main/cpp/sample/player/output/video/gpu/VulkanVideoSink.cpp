/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#include "VulkanVideoSink.h"

#include <algorithm>

#include "../renderer/HdrMetadataHelper.h"
#include "VideoFrameConverter.h"
#include "av_codec_sample_log.h"
#include "dfx/error/av_codec_sample_error.h"
#include "plugin_manager.h"

#undef LOG_TAG
#define LOG_TAG "VulkanVideoSink"

namespace {
constexpr char APP_NAME[] = "AVCodecVideoSample";
constexpr char DEVICE_SWAPCHAIN_EXTENSION[] = VK_KHR_SWAPCHAIN_EXTENSION_NAME;
constexpr VkClearColorValue BLACK = { { 0.0F, 0.0F, 0.0F, 1.0F } };
constexpr uint64_t FRAME_READY_WAIT_NS = 2ULL * 1000ULL * 1000ULL;
constexpr uint64_t IMAGE_ACQUIRE_WAIT_NS = 2ULL * 1000ULL * 1000ULL;
constexpr int64_t VULKAN_UPLOAD_MAX_PIXELS = 960LL * 540LL;
constexpr int64_t VULKAN_PORTRAIT_UPLOAD_MAX_PIXELS = 640LL * 360LL;
constexpr uint32_t PREFERRED_SWAPCHAIN_IMAGE_COUNT = 2;
constexpr uint32_t INSTANCE_EXTENSION_COUNT = 2;
constexpr uint32_t SURFACE_EXTENT_UNDEFINED = UINT32_MAX;
constexpr uint32_t IMAGE_EXTENT_DEPTH = 1;
constexpr int32_t CENTER_DIVISOR = 2;
constexpr uint32_t IMAGE_SUBRESOURCE_LEVEL_COUNT = 1;
constexpr uint32_t IMAGE_SUBRESOURCE_LAYER_COUNT = 1;
constexpr int32_t DEGREES_PER_TURN = 360;
constexpr int32_t ROTATION_90_DEGREES = 90;
constexpr int32_t ROTATION_180_DEGREES = 180;
constexpr int32_t ROTATION_270_DEGREES = 270;
constexpr size_t RGBA_BLUE_COMPONENT_OFFSET = 2;
constexpr size_t RGBA_ALPHA_COMPONENT_OFFSET = 3;
constexpr size_t RGBA_BYTES_PER_PIXEL = 4;

double DivideByPositive(double numerator, int32_t denominator)
{
    double quotient = 0.0;
    if (denominator > 0) {
        quotient = numerator / denominator;
    }
    return quotient;
}

struct ImageTransition {
    VkImage image = VK_NULL_HANDLE;
    VkImageLayout oldLayout = VK_IMAGE_LAYOUT_UNDEFINED;
    VkImageLayout newLayout = VK_IMAGE_LAYOUT_UNDEFINED;
    VkAccessFlags sourceAccess = 0;
    VkAccessFlags destinationAccess = 0;
    VkPipelineStageFlags sourceStage = VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT;
    VkPipelineStageFlags destinationStage = VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT;
};

bool ConfigureWindowForGpu(OHNativeWindow *window, int32_t width, int32_t height)
{
    if (window == nullptr || width <= 0 || height <= 0) {
        return false;
    }
    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(window, SET_BUFFER_GEOMETRY, width, height);
    if (ret != 0) {
        AVCODEC_SAMPLE_LOGW("Set Vulkan window geometry failed: %{public}d", ret);
        return false;
    }
    ret = OH_NativeWindow_NativeWindowHandleOpt(window, SET_FORMAT, NATIVEBUFFER_PIXEL_FMT_RGBA_8888);
    if (ret != 0) {
        AVCODEC_SAMPLE_LOGW("Set Vulkan window format failed: %{public}d", ret);
        return false;
    }
    const uint64_t usage = NATIVEBUFFER_USAGE_HW_RENDER | NATIVEBUFFER_USAGE_HW_TEXTURE;
    ret = OH_NativeWindow_NativeWindowHandleOpt(window, SET_USAGE, usage);
    if (ret != 0) {
        AVCODEC_SAMPLE_LOGW("Set Vulkan window usage failed: %{public}d", ret);
        return false;
    }
    ret = OH_NativeWindow_NativeWindowHandleOpt(window, SET_TRANSFORM, NATIVEBUFFER_ROTATE_NONE);
    if (ret != 0) {
        AVCODEC_SAMPLE_LOGW("Reset Vulkan window transform failed: %{public}d", ret);
        return false;
    }
    return OH_NativeWindow_NativeWindowSetScalingModeV2(window, OH_SCALING_MODE_SCALE_FIT_V2) == 0;
}

bool ContainsExtension(const std::vector<VkExtensionProperties> &extensions, const char *name)
{
    return std::any_of(extensions.begin(), extensions.end(), [name](const VkExtensionProperties &extension) {
        return std::strcmp(extension.extensionName, name) == 0;
    });
}

bool IsHdrOrTenBit(const VideoPresentRequest &request)
{
    if (request.sampleInfo.codec.convertHdrVividToBt709) {
        return false;
    }
    const bool hevcTenBit = IsTenBitHevcOutput(request.sampleInfo.video);
    return request.sampleInfo.video.hdrVividContainerSignaled || request.sampleInfo.video.isHDRVivid != 0 ||
        hevcTenBit ||
        request.context.outputPixelFormat == AV_PIXEL_FORMAT_RGBA1010102 ||
        HdrMetadataHelper::IsHdrVivid(request.bufferInfo.buffer);
}

int32_t NormalizeRotation(int32_t rotation)
{
    int32_t normalized = rotation % DEGREES_PER_TURN;
    if (normalized < 0) {
        normalized += DEGREES_PER_TURN;
    }
    return normalized == ROTATION_90_DEGREES || normalized == ROTATION_180_DEGREES ||
        normalized == ROTATION_270_DEGREES ? normalized : 0;
}

void TransitionImage(VkCommandBuffer commandBuffer, const ImageTransition &transition)
{
    VkImageMemoryBarrier barrier {};
    barrier.sType = VK_STRUCTURE_TYPE_IMAGE_MEMORY_BARRIER;
    barrier.srcAccessMask = transition.sourceAccess;
    barrier.dstAccessMask = transition.destinationAccess;
    barrier.oldLayout = transition.oldLayout;
    barrier.newLayout = transition.newLayout;
    barrier.srcQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED;
    barrier.dstQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED;
    barrier.image = transition.image;
    barrier.subresourceRange.aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
    barrier.subresourceRange.levelCount = IMAGE_SUBRESOURCE_LEVEL_COUNT;
    barrier.subresourceRange.layerCount = IMAGE_SUBRESOURCE_LAYER_COUNT;
    vkCmdPipelineBarrier(commandBuffer, transition.sourceStage, transition.destinationStage, 0,
        0, nullptr, 0, nullptr, 1, &barrier);
}
}

VulkanVideoSink::~VulkanVideoSink()
{
    Reset();
}

bool VulkanVideoSink::CreateInstance()
{
    uint32_t extensionCount = 0;
    if (vkEnumerateInstanceExtensionProperties(nullptr, &extensionCount, nullptr) != VK_SUCCESS) {
        return false;
    }
    std::vector<VkExtensionProperties> extensions(extensionCount);
    if (vkEnumerateInstanceExtensionProperties(nullptr, &extensionCount, extensions.data()) != VK_SUCCESS ||
        !ContainsExtension(extensions, VK_KHR_SURFACE_EXTENSION_NAME) ||
        !ContainsExtension(extensions, VK_OHOS_SURFACE_EXTENSION_NAME)) {
        AVCODEC_SAMPLE_LOGW("Required Vulkan surface extensions are unavailable");
        return false;
    }
    VkApplicationInfo applicationInfo{};
    applicationInfo.sType = VK_STRUCTURE_TYPE_APPLICATION_INFO;
    applicationInfo.pApplicationName = APP_NAME;
    applicationInfo.applicationVersion = VK_MAKE_VERSION(1, 0, 0);
    applicationInfo.pEngineName = APP_NAME;
    applicationInfo.engineVersion = VK_MAKE_VERSION(1, 0, 0);
    applicationInfo.apiVersion = VK_API_VERSION_1_0;
    const char *instanceExtensions[] = { VK_KHR_SURFACE_EXTENSION_NAME, VK_OHOS_SURFACE_EXTENSION_NAME };
    VkInstanceCreateInfo createInfo{};
    createInfo.sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
    createInfo.pApplicationInfo = &applicationInfo;
    createInfo.enabledExtensionCount = INSTANCE_EXTENSION_COUNT;
    createInfo.ppEnabledExtensionNames = instanceExtensions;
    return vkCreateInstance(&createInfo, nullptr, &instance_) == VK_SUCCESS;
}

bool VulkanVideoSink::CreateSurface(OHNativeWindow *window)
{
    VkSurfaceCreateInfoOHOS createInfo{};
    createInfo.sType = VK_STRUCTURE_TYPE_SURFACE_CREATE_INFO_OHOS;
    createInfo.window = window;
    return vkCreateSurfaceOHOS(instance_, &createInfo, nullptr, &surface_) == VK_SUCCESS;
}

bool VulkanVideoSink::SelectDevice()
{
    uint32_t deviceCount = 0;
    if (vkEnumeratePhysicalDevices(instance_, &deviceCount, nullptr) != VK_SUCCESS || deviceCount == 0) {
        return false;
    }
    std::vector<VkPhysicalDevice> devices(deviceCount);
    if (vkEnumeratePhysicalDevices(instance_, &deviceCount, devices.data()) != VK_SUCCESS) {
        return false;
    }
    for (VkPhysicalDevice device : devices) {
        uint32_t extensionCount = 0;
        vkEnumerateDeviceExtensionProperties(device, nullptr, &extensionCount, nullptr);
        std::vector<VkExtensionProperties> extensions(extensionCount);
        vkEnumerateDeviceExtensionProperties(device, nullptr, &extensionCount, extensions.data());
        if (!ContainsExtension(extensions, DEVICE_SWAPCHAIN_EXTENSION)) {
            continue;
        }
        uint32_t familyCount = 0;
        vkGetPhysicalDeviceQueueFamilyProperties(device, &familyCount, nullptr);
        std::vector<VkQueueFamilyProperties> families(familyCount);
        vkGetPhysicalDeviceQueueFamilyProperties(device, &familyCount, families.data());
        for (uint32_t index = 0; index < familyCount; ++index) {
            VkBool32 supportsPresent = VK_FALSE;
            vkGetPhysicalDeviceSurfaceSupportKHR(device, index, surface_, &supportsPresent);
            if ((families[index].queueFlags & VK_QUEUE_GRAPHICS_BIT) != 0 && supportsPresent == VK_TRUE) {
                physicalDevice_ = device;
                queueFamilyIndex_ = index;
                return true;
            }
        }
    }
    return false;
}

bool VulkanVideoSink::CreateDevice()
{
    constexpr float queuePriority = 1.0F;
    VkDeviceQueueCreateInfo queueInfo{};
    queueInfo.sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO;
    queueInfo.queueFamilyIndex = queueFamilyIndex_;
    queueInfo.queueCount = 1;
    queueInfo.pQueuePriorities = &queuePriority;
    VkPhysicalDeviceFeatures features{};
    VkDeviceCreateInfo createInfo{};
    createInfo.sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;
    createInfo.pQueueCreateInfos = &queueInfo;
    createInfo.queueCreateInfoCount = 1;
    createInfo.pEnabledFeatures = &features;
    createInfo.enabledExtensionCount = 1;
    const char *deviceExtension = DEVICE_SWAPCHAIN_EXTENSION;
    createInfo.ppEnabledExtensionNames = &deviceExtension;
    if (vkCreateDevice(physicalDevice_, &createInfo, nullptr, &device_) != VK_SUCCESS) {
        return false;
    }
    vkGetDeviceQueue(device_, queueFamilyIndex_, 0, &queue_);
    return queue_ != VK_NULL_HANDLE;
}

bool VulkanVideoSink::CreateSwapchain(int32_t width, int32_t height)
{
    VkSurfaceCapabilitiesKHR capabilities{};
    if (vkGetPhysicalDeviceSurfaceCapabilitiesKHR(physicalDevice_, surface_, &capabilities) != VK_SUCCESS ||
        (capabilities.supportedUsageFlags & VK_IMAGE_USAGE_TRANSFER_DST_BIT) == 0) {
        AVCODEC_SAMPLE_LOGW("Vulkan surface does not support transfer-to-present images");
        return false;
    }
    VkSurfaceFormatKHR surfaceFormat{};
    if (!SelectSwapchainFormat(surfaceFormat)) {
        return false;
    }
    swapchainFormat_ = surfaceFormat.format;
    VkFormatProperties formatProperties {};
    vkGetPhysicalDeviceFormatProperties(physicalDevice_, swapchainFormat_, &formatProperties);
    constexpr VkFormatFeatureFlags requiredFeatures = VK_FORMAT_FEATURE_BLIT_DST_BIT;
    if ((formatProperties.optimalTilingFeatures & requiredFeatures) != requiredFeatures) {
        AVCODEC_SAMPLE_LOGW("Vulkan swapchain format does not support linear blit");
        return false;
    }
    swapRedBlue_ = swapchainFormat_ == VK_FORMAT_B8G8R8A8_UNORM;
    swapchainExtent_ = ResolveSwapchainExtent(capabilities, width, height);
    VkSwapchainCreateInfoKHR createInfo{};
    createInfo.sType = VK_STRUCTURE_TYPE_SWAPCHAIN_CREATE_INFO_KHR;
    createInfo.surface = surface_;
    createInfo.minImageCount = std::max(capabilities.minImageCount, PREFERRED_SWAPCHAIN_IMAGE_COUNT);
    if (capabilities.maxImageCount > 0) {
        createInfo.minImageCount = std::min(createInfo.minImageCount, capabilities.maxImageCount);
    }
    createInfo.imageFormat = swapchainFormat_;
    createInfo.imageColorSpace = surfaceFormat.colorSpace;
    createInfo.imageExtent = swapchainExtent_;
    createInfo.imageArrayLayers = 1;
    createInfo.imageUsage = VK_IMAGE_USAGE_TRANSFER_DST_BIT;
    createInfo.imageSharingMode = VK_SHARING_MODE_EXCLUSIVE;
    createInfo.preTransform = capabilities.currentTransform;
    createInfo.compositeAlpha = SelectCompositeAlpha(capabilities);
    if (createInfo.compositeAlpha == 0) {
        AVCODEC_SAMPLE_LOGW("Vulkan surface has no supported composite alpha mode");
        return false;
    }
    createInfo.presentMode = SelectPresentMode();
    createInfo.clipped = VK_TRUE;
    if (vkCreateSwapchainKHR(device_, &createInfo, nullptr, &swapchain_) != VK_SUCCESS) {
        return false;
    }
    return LoadSwapchainImages();
}

bool VulkanVideoSink::SelectSwapchainFormat(VkSurfaceFormatKHR &surfaceFormat)
{
    uint32_t formatCount = 0;
    if (vkGetPhysicalDeviceSurfaceFormatsKHR(physicalDevice_, surface_, &formatCount, nullptr) != VK_SUCCESS ||
        formatCount == 0) {
        return false;
    }
    std::vector<VkSurfaceFormatKHR> formats(formatCount);
    if (vkGetPhysicalDeviceSurfaceFormatsKHR(physicalDevice_, surface_, &formatCount, formats.data()) != VK_SUCCESS) {
        return false;
    }
    // RGBA avoids a full CPU red/blue channel swap before every upload when both formats are present.
    auto formatIt = std::find_if(formats.begin(), formats.end(), [](const VkSurfaceFormatKHR &format) {
        return format.format == VK_FORMAT_R8G8B8A8_UNORM;
    });
    if (formatIt == formats.end()) {
        formatIt = std::find_if(formats.begin(), formats.end(), [](const VkSurfaceFormatKHR &format) {
            return format.format == VK_FORMAT_B8G8R8A8_UNORM;
        });
    }
    if (formatIt == formats.end()) {
        return false;
    }
    surfaceFormat = *formatIt;
    return true;
}

VkExtent2D VulkanVideoSink::ResolveSwapchainExtent(const VkSurfaceCapabilitiesKHR &capabilities, int32_t width,
    int32_t height) const
{
    VkExtent2D extent = capabilities.currentExtent;
    if (extent.width == SURFACE_EXTENT_UNDEFINED) {
        extent.width = static_cast<uint32_t>(width);
        extent.height = static_cast<uint32_t>(height);
    }
    extent.width = std::clamp(extent.width, capabilities.minImageExtent.width, capabilities.maxImageExtent.width);
    extent.height = std::clamp(extent.height, capabilities.minImageExtent.height, capabilities.maxImageExtent.height);
    return extent;
}

VkCompositeAlphaFlagBitsKHR VulkanVideoSink::SelectCompositeAlpha(const VkSurfaceCapabilitiesKHR &capabilities) const
{
    constexpr VkCompositeAlphaFlagBitsKHR candidates[] = {
        VK_COMPOSITE_ALPHA_OPAQUE_BIT_KHR,
        VK_COMPOSITE_ALPHA_PRE_MULTIPLIED_BIT_KHR,
        VK_COMPOSITE_ALPHA_POST_MULTIPLIED_BIT_KHR,
        VK_COMPOSITE_ALPHA_INHERIT_BIT_KHR
    };
    for (const VkCompositeAlphaFlagBitsKHR candidate : candidates) {
        if ((capabilities.supportedCompositeAlpha & candidate) != 0) {
            return candidate;
        }
    }
    return static_cast<VkCompositeAlphaFlagBitsKHR>(0);
}

VkPresentModeKHR VulkanVideoSink::SelectPresentMode() const
{
    uint32_t presentModeCount = 0;
    const VkResult queryResult = vkGetPhysicalDeviceSurfacePresentModesKHR(physicalDevice_, surface_,
        &presentModeCount, nullptr);
    if (queryResult != VK_SUCCESS || presentModeCount == 0) {
        return VK_PRESENT_MODE_FIFO_KHR;
    }
    std::vector<VkPresentModeKHR> presentModes(presentModeCount);
    if (vkGetPhysicalDeviceSurfacePresentModesKHR(physicalDevice_, surface_, &presentModeCount,
        presentModes.data()) != VK_SUCCESS) {
        return VK_PRESENT_MODE_FIFO_KHR;
    }
    return std::find(presentModes.begin(), presentModes.end(), VK_PRESENT_MODE_MAILBOX_KHR) != presentModes.end() ?
        VK_PRESENT_MODE_MAILBOX_KHR : VK_PRESENT_MODE_FIFO_KHR;
}

bool VulkanVideoSink::LoadSwapchainImages()
{
    uint32_t imageCount = 0;
    if (vkGetSwapchainImagesKHR(device_, swapchain_, &imageCount, nullptr) != VK_SUCCESS || imageCount == 0) {
        return false;
    }
    swapchainImages_.resize(imageCount);
    const bool loaded =
        vkGetSwapchainImagesKHR(device_, swapchain_, &imageCount, swapchainImages_.data()) == VK_SUCCESS &&
        !swapchainImages_.empty();
    if (loaded) {
        swapchainImageLayouts_.assign(imageCount, VK_IMAGE_LAYOUT_UNDEFINED);
    }
    return loaded;
}

bool VulkanVideoSink::CreateCommandResources()
{
    VkCommandPoolCreateInfo poolInfo{};
    poolInfo.sType = VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO;
    poolInfo.queueFamilyIndex = queueFamilyIndex_;
    poolInfo.flags = VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT;
    if (vkCreateCommandPool(device_, &poolInfo, nullptr, &commandPool_) != VK_SUCCESS) {
        return false;
    }
    VkCommandBufferAllocateInfo allocationInfo{};
    allocationInfo.sType = VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO;
    allocationInfo.commandPool = commandPool_;
    allocationInfo.level = VK_COMMAND_BUFFER_LEVEL_PRIMARY;
    allocationInfo.commandBufferCount = 1;
    if (vkAllocateCommandBuffers(device_, &allocationInfo, &commandBuffer_) != VK_SUCCESS) {
        return false;
    }
    VkSemaphoreCreateInfo semaphoreInfo{};
    semaphoreInfo.sType = VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO;
    if (vkCreateSemaphore(device_, &semaphoreInfo, nullptr, &imageAvailable_) != VK_SUCCESS ||
        vkCreateSemaphore(device_, &semaphoreInfo, nullptr, &renderFinished_) != VK_SUCCESS) {
        return false;
    }
    VkFenceCreateInfo fenceInfo{};
    fenceInfo.sType = VK_STRUCTURE_TYPE_FENCE_CREATE_INFO;
    fenceInfo.flags = VK_FENCE_CREATE_SIGNALED_BIT;
    return vkCreateFence(device_, &fenceInfo, nullptr, &frameFence_) == VK_SUCCESS;
}

bool VulkanVideoSink::Initialize(OHNativeWindow *window, int32_t width, int32_t height)
{
    if (window == nullptr || width <= 0 || height <= 0 || !CreateInstance() || !CreateSurface(window) ||
        !SelectDevice() || !CreateDevice() || !CreateSwapchain(width, height) || !CreateCommandResources()) {
        ReleaseVulkanResources();
        return false;
    }
    window_ = window;
    width_ = width;
    height_ = height;
    windowGeneration_ = NativeXComponentSample::PluginManager::GetInstance()->GetPluginWindowGeneration();
    initialized_ = true;
    AVCODEC_SAMPLE_LOGI("Vulkan video sink initialized");
    return true;
}

uint32_t VulkanVideoSink::FindMemoryType(uint32_t filter, VkMemoryPropertyFlags properties) const
{
    VkPhysicalDeviceMemoryProperties memoryProperties{};
    vkGetPhysicalDeviceMemoryProperties(physicalDevice_, &memoryProperties);
    for (uint32_t index = 0; index < memoryProperties.memoryTypeCount; ++index) {
        if ((filter & (1U << index)) != 0 &&
            (memoryProperties.memoryTypes[index].propertyFlags & properties) == properties) {
            return index;
        }
    }
    return UINT32_MAX;
}

bool VulkanVideoSink::CreateStagingBuffer(size_t size, VkBuffer &buffer, VkDeviceMemory &memory)
{
    VkBufferCreateInfo bufferInfo{};
    bufferInfo.sType = VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO;
    bufferInfo.size = size;
    bufferInfo.usage = VK_BUFFER_USAGE_TRANSFER_SRC_BIT;
    bufferInfo.sharingMode = VK_SHARING_MODE_EXCLUSIVE;
    if (vkCreateBuffer(device_, &bufferInfo, nullptr, &buffer) != VK_SUCCESS) {
        return false;
    }
    VkMemoryRequirements requirements{};
    vkGetBufferMemoryRequirements(device_, buffer, &requirements);
    const uint32_t memoryType = FindMemoryType(requirements.memoryTypeBits,
        VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT | VK_MEMORY_PROPERTY_HOST_COHERENT_BIT);
    if (memoryType == UINT32_MAX) {
        vkDestroyBuffer(device_, buffer, nullptr);
        buffer = VK_NULL_HANDLE;
        return false;
    }
    VkMemoryAllocateInfo allocationInfo{};
    allocationInfo.sType = VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO;
    allocationInfo.allocationSize = requirements.size;
    allocationInfo.memoryTypeIndex = memoryType;
    if (vkAllocateMemory(device_, &allocationInfo, nullptr, &memory) != VK_SUCCESS) {
        vkDestroyBuffer(device_, buffer, nullptr);
        buffer = VK_NULL_HANDLE;
        return false;
    }
    if (vkBindBufferMemory(device_, buffer, memory, 0) != VK_SUCCESS) {
        vkFreeMemory(device_, memory, nullptr);
        memory = VK_NULL_HANDLE;
        vkDestroyBuffer(device_, buffer, nullptr);
        buffer = VK_NULL_HANDLE;
        return false;
    }
    return true;
}

bool VulkanVideoSink::EnsureStagingBuffer(size_t size)
{
    if (stagingBuffer_ != VK_NULL_HANDLE && stagingCapacity_ >= size) {
        return true;
    }
    if (device_ == VK_NULL_HANDLE) {
        return false;
    }
    if (stagingBuffer_ != VK_NULL_HANDLE) {
        vkDestroyBuffer(device_, stagingBuffer_, nullptr);
        stagingBuffer_ = VK_NULL_HANDLE;
    }
    if (stagingMemory_ != VK_NULL_HANDLE) {
        vkFreeMemory(device_, stagingMemory_, nullptr);
        stagingMemory_ = VK_NULL_HANDLE;
    }
    stagingCapacity_ = 0;
    if (!CreateStagingBuffer(size, stagingBuffer_, stagingMemory_)) {
        return false;
    }
    stagingCapacity_ = size;
    return true;
}

bool VulkanVideoSink::EnsureUploadImage(uint32_t width, uint32_t height)
{
    if (uploadImage_ != VK_NULL_HANDLE && uploadImageExtent_.width == width && uploadImageExtent_.height == height) {
        return true;
    }
    if (device_ == VK_NULL_HANDLE || width == 0 || height == 0) {
        return false;
    }
    ReleaseUploadImage();
    if (!CreateUploadImage(width, height) || !AllocateUploadImageMemory()) {
        ReleaseUploadImage();
        return false;
    }
    uploadImageExtent_ = { width, height };
    uploadImageLayout_ = VK_IMAGE_LAYOUT_UNDEFINED;
    return true;
}

bool VulkanVideoSink::CreateUploadImage(uint32_t width, uint32_t height)
{
    VkFormatProperties formatProperties {};
    vkGetPhysicalDeviceFormatProperties(physicalDevice_, swapchainFormat_, &formatProperties);
    constexpr VkFormatFeatureFlags uploadFeatures = VK_FORMAT_FEATURE_BLIT_SRC_BIT |
        VK_FORMAT_FEATURE_BLIT_DST_BIT | VK_FORMAT_FEATURE_SAMPLED_IMAGE_FILTER_LINEAR_BIT;
    if ((formatProperties.optimalTilingFeatures & uploadFeatures) != uploadFeatures) {
        AVCODEC_SAMPLE_LOGW("Vulkan upload format does not support linear blit");
        return false;
    }
    VkImageCreateInfo imageInfo {};
    imageInfo.sType = VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO;
    imageInfo.imageType = VK_IMAGE_TYPE_2D;
    imageInfo.format = swapchainFormat_;
    imageInfo.extent = { width, height, IMAGE_EXTENT_DEPTH };
    imageInfo.mipLevels = IMAGE_SUBRESOURCE_LEVEL_COUNT;
    imageInfo.arrayLayers = IMAGE_SUBRESOURCE_LAYER_COUNT;
    imageInfo.samples = VK_SAMPLE_COUNT_1_BIT;
    imageInfo.tiling = VK_IMAGE_TILING_OPTIMAL;
    imageInfo.usage = VK_IMAGE_USAGE_TRANSFER_DST_BIT | VK_IMAGE_USAGE_TRANSFER_SRC_BIT;
    imageInfo.sharingMode = VK_SHARING_MODE_EXCLUSIVE;
    imageInfo.initialLayout = VK_IMAGE_LAYOUT_UNDEFINED;
    return vkCreateImage(device_, &imageInfo, nullptr, &uploadImage_) == VK_SUCCESS;
}

bool VulkanVideoSink::AllocateUploadImageMemory()
{
    VkMemoryRequirements requirements {};
    vkGetImageMemoryRequirements(device_, uploadImage_, &requirements);
    const uint32_t memoryType = FindMemoryType(requirements.memoryTypeBits, VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT);
    if (memoryType == UINT32_MAX) {
        return false;
    }
    VkMemoryAllocateInfo allocationInfo {};
    allocationInfo.sType = VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO;
    allocationInfo.allocationSize = requirements.size;
    allocationInfo.memoryTypeIndex = memoryType;
    return vkAllocateMemory(device_, &allocationInfo, nullptr, &uploadImageMemory_) == VK_SUCCESS &&
        vkBindImageMemory(device_, uploadImage_, uploadImageMemory_, 0) == VK_SUCCESS;
}

void VulkanVideoSink::ReleaseUploadImage()
{
    if (device_ == VK_NULL_HANDLE) {
        return;
    }
    if (uploadImage_ != VK_NULL_HANDLE) {
        vkDestroyImage(device_, uploadImage_, nullptr);
        uploadImage_ = VK_NULL_HANDLE;
    }
    if (uploadImageMemory_ != VK_NULL_HANDLE) {
        vkFreeMemory(device_, uploadImageMemory_, nullptr);
        uploadImageMemory_ = VK_NULL_HANDLE;
    }
    uploadImageExtent_ = {};
    uploadImageLayout_ = VK_IMAGE_LAYOUT_UNDEFINED;
}

bool VulkanVideoSink::RenderFrame(const std::vector<uint8_t> &rgba, int32_t width, int32_t height,
    int32_t rotation)
{
    if (!initialized_ || rgba.empty() || width <= 0 || height <= 0) {
        return false;
    }
    UploadFrame uploadFrame;
    if (!PrepareUploadData(rgba, width, height, rotation, uploadFrame) ||
        !EnsureUploadImage(static_cast<uint32_t>(uploadFrame.width), static_cast<uint32_t>(uploadFrame.height)) ||
        !EnsureStagingBuffer(uploadFrame.data->size()) || !UploadStagingData(*uploadFrame.data)) {
        return false;
    }
    uint32_t imageIndex = 0;
    const VkResult acquire = vkAcquireNextImageKHR(device_, swapchain_, IMAGE_ACQUIRE_WAIT_NS, imageAvailable_,
        VK_NULL_HANDLE, &imageIndex);
    if (acquire == VK_NOT_READY || acquire == VK_TIMEOUT) {
        return true;
    }
    if (acquire == VK_ERROR_OUT_OF_DATE_KHR) {
        swapchainRecreatePending_ = true;
        return true;
    }
    if ((acquire != VK_SUCCESS && acquire != VK_SUBOPTIMAL_KHR) || imageIndex >= swapchainImageLayouts_.size()) {
        return false;
    }
    vkResetCommandBuffer(commandBuffer_, 0);
    VkCommandBufferBeginInfo beginInfo{};
    beginInfo.sType = VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO;
    if (vkBeginCommandBuffer(commandBuffer_, &beginInfo) != VK_SUCCESS) {
        return false;
    }
    if (!RecordUploadCommands(uploadFrame.width, uploadFrame.height) ||
        !RecordPresentCommands(imageIndex, uploadFrame.width, uploadFrame.height) || !SubmitFrame(imageIndex)) {
        return false;
    }
    return true;
}

bool VulkanVideoSink::PrepareUploadData(const std::vector<uint8_t> &rgba, int32_t width, int32_t height,
    int32_t rotation, UploadFrame &frame)
{
    const int32_t normalizedRotation = NormalizeRotation(rotation);
    const bool swapsDimensions = normalizedRotation == ROTATION_90_DEGREES ||
        normalizedRotation == ROTATION_270_DEGREES;
    frame.width = swapsDimensions ? height : width;
    frame.height = swapsDimensions ? width : height;
    if (normalizedRotation != 0 &&
        !VideoFrameConverter::RotateRgba(rgba, {{width, height}, normalizedRotation}, uploadCache_)) {
        return false;
    }
    frame.data = normalizedRotation == 0 ? &rgba : &uploadCache_;
    if (swapRedBlue_) {
        if (frame.data != &uploadCache_) {
            uploadCache_ = *frame.data;
            frame.data = &uploadCache_;
        }
        for (size_t offset = 0; offset + RGBA_ALPHA_COMPONENT_OFFSET < uploadCache_.size();
            offset += RGBA_BYTES_PER_PIXEL) {
            std::swap(uploadCache_[offset], uploadCache_[offset + RGBA_BLUE_COMPONENT_OFFSET]);
        }
    }
    return true;
}

bool VulkanVideoSink::UploadStagingData(const std::vector<uint8_t> &uploadData)
{
    void *mapped = nullptr;
    if (vkMapMemory(device_, stagingMemory_, 0, uploadData.size(), 0, &mapped) != VK_SUCCESS || mapped == nullptr) {
        return false;
    }
    std::copy_n(uploadData.data(), uploadData.size(), static_cast<uint8_t *>(mapped));
    vkUnmapMemory(device_, stagingMemory_);
    return true;
}

bool VulkanVideoSink::RecordUploadCommands(int32_t uploadWidth, int32_t uploadHeight)
{
    const VkPipelineStageFlags sourceStage = uploadImageLayout_ == VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL ?
        VK_PIPELINE_STAGE_TRANSFER_BIT : VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT;
    const VkAccessFlags sourceAccess = uploadImageLayout_ == VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL ?
        VK_ACCESS_TRANSFER_READ_BIT : 0;
    TransitionImage(commandBuffer_, { uploadImage_, uploadImageLayout_, VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL,
        sourceAccess, VK_ACCESS_TRANSFER_WRITE_BIT, sourceStage, VK_PIPELINE_STAGE_TRANSFER_BIT });
    VkBufferImageCopy copy {};
    copy.imageSubresource.aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
    copy.imageSubresource.layerCount = IMAGE_SUBRESOURCE_LAYER_COUNT;
    copy.imageExtent = { static_cast<uint32_t>(uploadWidth), static_cast<uint32_t>(uploadHeight), IMAGE_EXTENT_DEPTH };
    vkCmdCopyBufferToImage(commandBuffer_, stagingBuffer_, uploadImage_, VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, 1,
        &copy);
    TransitionImage(commandBuffer_, { uploadImage_, VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL,
        VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL, VK_ACCESS_TRANSFER_WRITE_BIT, VK_ACCESS_TRANSFER_READ_BIT,
        VK_PIPELINE_STAGE_TRANSFER_BIT, VK_PIPELINE_STAGE_TRANSFER_BIT });
    return true;
}

bool VulkanVideoSink::RecordPresentCommands(uint32_t imageIndex, int32_t uploadWidth, int32_t uploadHeight)
{
    PresentRegion region;
    if (!CalculatePresentRegion(uploadWidth, uploadHeight, region)) {
        return false;
    }
    const VkImageLayout swapchainLayout = swapchainImageLayouts_[imageIndex];
    const VkPipelineStageFlags sourceStage = swapchainLayout == VK_IMAGE_LAYOUT_PRESENT_SRC_KHR ?
        VK_PIPELINE_STAGE_BOTTOM_OF_PIPE_BIT : VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT;
    const VkAccessFlags sourceAccess = swapchainLayout == VK_IMAGE_LAYOUT_PRESENT_SRC_KHR ?
        VK_ACCESS_MEMORY_READ_BIT : 0;
    TransitionImage(commandBuffer_, { swapchainImages_[imageIndex], swapchainLayout,
        VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, sourceAccess, VK_ACCESS_TRANSFER_WRITE_BIT, sourceStage,
        VK_PIPELINE_STAGE_TRANSFER_BIT });
    VkImageSubresourceRange colorRange {};
    colorRange.aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
    colorRange.levelCount = IMAGE_SUBRESOURCE_LEVEL_COUNT;
    colorRange.layerCount = IMAGE_SUBRESOURCE_LAYER_COUNT;
    vkCmdClearColorImage(commandBuffer_, swapchainImages_[imageIndex], VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, &BLACK,
        1, &colorRange);
    VkImageBlit blit {};
    blit.srcSubresource.aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
    blit.srcSubresource.layerCount = IMAGE_SUBRESOURCE_LAYER_COUNT;
    blit.srcOffsets[1] = { uploadWidth, uploadHeight, IMAGE_EXTENT_DEPTH };
    blit.dstSubresource.aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
    blit.dstSubresource.layerCount = IMAGE_SUBRESOURCE_LAYER_COUNT;
    blit.dstOffsets[0] = { region.left, region.top, 0 };
    blit.dstOffsets[1] = { region.left + region.width, region.top + region.height, IMAGE_EXTENT_DEPTH };
    vkCmdBlitImage(commandBuffer_, uploadImage_, VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL, swapchainImages_[imageIndex],
        VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL, 1, &blit, VK_FILTER_LINEAR);
    TransitionImage(commandBuffer_, { swapchainImages_[imageIndex], VK_IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL,
        VK_IMAGE_LAYOUT_PRESENT_SRC_KHR, VK_ACCESS_TRANSFER_WRITE_BIT, 0, VK_PIPELINE_STAGE_TRANSFER_BIT,
        VK_PIPELINE_STAGE_BOTTOM_OF_PIPE_BIT });
    return vkEndCommandBuffer(commandBuffer_) == VK_SUCCESS;
}

bool VulkanVideoSink::CalculatePresentRegion(int32_t uploadWidth, int32_t uploadHeight, PresentRegion &region) const
{
    if (uploadWidth == 0 || uploadHeight == 0 || swapchainExtent_.width == 0 || swapchainExtent_.height == 0) {
        return false;
    }
    if (uploadWidth < 0 || uploadHeight < 0) {
        return false;
    }
    const double scale = std::min(DivideByPositive(static_cast<double>(swapchainExtent_.width), uploadWidth),
        DivideByPositive(static_cast<double>(swapchainExtent_.height), uploadHeight));
    region.width = std::max(1, static_cast<int32_t>(uploadWidth * scale));
    region.height = std::max(1, static_cast<int32_t>(uploadHeight * scale));
    region.left = (static_cast<int32_t>(swapchainExtent_.width) - region.width) / CENTER_DIVISOR;
    region.top = (static_cast<int32_t>(swapchainExtent_.height) - region.height) / CENTER_DIVISOR;
    return true;
}

bool VulkanVideoSink::SubmitFrame(uint32_t imageIndex)
{
    if (vkResetFences(device_, 1, &frameFence_) != VK_SUCCESS) {
        return false;
    }
    constexpr VkPipelineStageFlags waitStage = VK_PIPELINE_STAGE_TRANSFER_BIT;
    VkSubmitInfo submit{};
    submit.sType = VK_STRUCTURE_TYPE_SUBMIT_INFO;
    submit.waitSemaphoreCount = 1;
    submit.pWaitSemaphores = &imageAvailable_;
    submit.pWaitDstStageMask = &waitStage;
    submit.commandBufferCount = 1;
    submit.pCommandBuffers = &commandBuffer_;
    submit.signalSemaphoreCount = 1;
    submit.pSignalSemaphores = &renderFinished_;
    const bool submitted = vkQueueSubmit(queue_, 1, &submit, frameFence_) == VK_SUCCESS;
    VkPresentInfoKHR present{};
    present.sType = VK_STRUCTURE_TYPE_PRESENT_INFO_KHR;
    present.waitSemaphoreCount = 1;
    present.pWaitSemaphores = &renderFinished_;
    present.swapchainCount = 1;
    present.pSwapchains = &swapchain_;
    present.pImageIndices = &imageIndex;
    const VkResult presentResult = submitted ? vkQueuePresentKHR(queue_, &present) : VK_ERROR_DEVICE_LOST;
    if (presentResult == VK_ERROR_OUT_OF_DATE_KHR) {
        swapchainRecreatePending_ = true;
    }
    const bool presented = submitted && (presentResult == VK_SUCCESS || presentResult == VK_SUBOPTIMAL_KHR ||
        presentResult == VK_ERROR_OUT_OF_DATE_KHR);
    if (presented) {
        uploadImageLayout_ = VK_IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL;
        swapchainImageLayouts_[imageIndex] = VK_IMAGE_LAYOUT_PRESENT_SRC_KHR;
    }
    return presented;
}

void VulkanVideoSink::PresentBlackFrame()
{
    if (!initialized_ || device_ == VK_NULL_HANDLE || swapchain_ == VK_NULL_HANDLE) {
        return;
    }
    // Destroying a swapchain does not replace its last image in the compositor. Present a black
    // image first so the preceding video's last frame is not kept visible while the next decoder
    // is being prepared.
    if (vkDeviceWaitIdle(device_) != VK_SUCCESS) {
        AVCODEC_SAMPLE_LOGW("Wait Vulkan device before clearing the previous frame failed");
        return;
    }
    const std::vector<uint8_t> blackFrame = { 0U, 0U, 0U, 255U };
    if (!RenderFrame(blackFrame, 1, 1, 0)) {
        AVCODEC_SAMPLE_LOGW("Present Vulkan black frame failed");
    }
}

bool VulkanVideoSink::EnsureContext(OHNativeWindow *window, int32_t width, int32_t height)
{
    const uint64_t generation = NativeXComponentSample::PluginManager::GetInstance()->GetPluginWindowGeneration();
    const bool generationChanged = initialized_ && windowGeneration_ != generation;
    if (initialized_ && window_ == window && !generationChanged) {
        const bool sizeChanged = width_ != width || height_ != height;
        if (sizeChanged && !ConfigureWindowForGpu(window, width, height)) {
            return false;
        }
        if ((sizeChanged || swapchainRecreatePending_) && !RecreateSwapchain(width, height)) {
            AVCODEC_SAMPLE_LOGE("Recreate Vulkan swapchain after XComponent resize failed");
            return false;
        }
        width_ = width;
        height_ = height;
        windowGeneration_ = generation;
        swapchainRecreatePending_ = false;
        return true;
    }
    if (initialized_) {
        // A same-size XComponent refresh can retain the NativeWindow address while replacing its
        // underlying surface. A new Vulkan surface is required; recreating only the swapchain keeps
        // the old extent and can offset the video inside the current XComponent.
        ReleaseVulkanResources();
    }
    if (!ConfigureWindowForGpu(window, width, height)) {
        return false;
    }
    return Initialize(window, width, height);
}

bool VulkanVideoSink::RecreateSwapchain(int32_t width, int32_t height)
{
    if (device_ == VK_NULL_HANDLE) {
        return false;
    }
    (void)vkDeviceWaitIdle(device_);
    // The selected surface format may change with the XComponent configuration.
    // Recreate the upload image together with the swapchain to keep their formats consistent.
    ReleaseUploadImage();
    DestroySwapchain();
    return CreateSwapchain(width, height);
}

int32_t VulkanVideoSink::Present(const VideoPresentRequest &request)
{
    if (!request.render) {
        return request.decoder.FreeOutputBuffer(request.bufferInfo.bufferIndex, false);
    }
    if (fallbackOnly_) {
        return fallback_.Present(request);
    }
    if (IsHdrOrTenBit(request)) {
        // Do not leave a Vulkan producer attached while BufferRenderer reconfigures this window.
        fallbackOnly_ = true;
        ReleaseVulkanResources();
        return fallback_.Present(request);
    }
    OHNativeWindow *window = NativeXComponentSample::PluginManager::GetInstance()->GetPluginWindow();
    const int32_t frameWidth = request.context.width > 0 ? request.context.width : request.sampleInfo.video.videoWidth;
    const int32_t frameHeight = request.context.height > 0 ? request.context.height :
        request.sampleInfo.video.videoHeight;
    int32_t surfaceWidth = 0;
    int32_t surfaceHeight = 0;
    NativeXComponentSample::PluginManager::GetInstance()->GetPluginWindowSize(surfaceWidth, surfaceHeight);
    if (surfaceWidth <= 0 || surfaceHeight <= 0) {
        surfaceWidth = frameWidth;
        surfaceHeight = frameHeight;
    }
    VideoFrameConverter::FrameSize uploadSize = {frameWidth, frameHeight};
    const bool contextReady = window != nullptr && EnsureContext(window, surfaceWidth, surfaceHeight);
    if (contextReady && frameFence_ != VK_NULL_HANDLE &&
        vkWaitForFences(device_, 1, &frameFence_, VK_TRUE, FRAME_READY_WAIT_NS) != VK_SUCCESS) {
        // Do not hold a codec output buffer indefinitely when composition is temporarily behind.
        return request.decoder.FreeOutputBuffer(request.bufferInfo.bufferIndex, false);
    }
    if (contextReady) {
        uploadSize = VideoFrameConverter::GetScaledFrameSize({{frameWidth, frameHeight},
            {static_cast<int32_t>(swapchainExtent_.width), static_cast<int32_t>(swapchainExtent_.height)},
            request.sampleInfo.video.rotation, VULKAN_UPLOAD_MAX_PIXELS, VULKAN_PORTRAIT_UPLOAD_MAX_PIXELS});
    }
    const bool ready = contextReady && VideoFrameConverter::ToRgbaScaled(request.bufferInfo, request.sampleInfo,
        request.context, uploadSize, rgbaCache_) &&
        RenderFrame(rgbaCache_, uploadSize.width, uploadSize.height, request.sampleInfo.video.rotation);
    if (!ready) {
        AVCODEC_SAMPLE_LOGW("Vulkan presentation unavailable, use BufferRenderer fallback");
        fallbackOnly_ = true;
        ReleaseVulkanResources();
        return fallback_.Present(request);
    }
    return request.decoder.FreeOutputBuffer(request.bufferInfo.bufferIndex, false);
}

OHNativeWindow *VulkanVideoSink::PrepareForPlayback(const SampleInfo &sampleInfo)
{
    (void)sampleInfo;
    OHNativeWindow *window = NativeXComponentSample::PluginManager::GetInstance()->GetPluginWindow();
    int32_t width = 0;
    int32_t height = 0;
    NativeXComponentSample::PluginManager::GetInstance()->GetPluginWindowSize(width, height);
    if (window == nullptr || width <= 0 || height <= 0 || !EnsureContext(window, width, height)) {
        AVCODEC_SAMPLE_LOGW("Vulkan prewarm skipped: XComponent window is unavailable");
        return nullptr;
    }
    // Clear the previous producer's image before decoder initialization. This also moves Vulkan
    // instance/device/swapchain creation out of the first decoded-frame path.
    PresentBlackFrame();
    return nullptr;
}

void VulkanVideoSink::DestroySwapchain()
{
    if (swapchain_ != VK_NULL_HANDLE) {
        vkDestroySwapchainKHR(device_, swapchain_, nullptr);
        swapchain_ = VK_NULL_HANDLE;
    }
    swapchainImages_.clear();
    swapchainImageLayouts_.clear();
}

void VulkanVideoSink::ReleaseVulkanResources()
{
    initialized_ = false;
    if (device_ != VK_NULL_HANDLE) {
        (void)vkDeviceWaitIdle(device_);
        DestroyFrameResources();
        DestroyStagingBuffer();
        ReleaseUploadImage();
        DestroySwapchain();
        vkDestroyDevice(device_, nullptr);
        device_ = VK_NULL_HANDLE;
    }
    if (instance_ != VK_NULL_HANDLE) {
        if (surface_ != VK_NULL_HANDLE) {
            vkDestroySurfaceKHR(instance_, surface_, nullptr);
            surface_ = VK_NULL_HANDLE;
        }
        vkDestroyInstance(instance_, nullptr);
        instance_ = VK_NULL_HANDLE;
    }
    ResetContextState();
}

void VulkanVideoSink::DestroyFrameResources()
{
    if (frameFence_ != VK_NULL_HANDLE) {
        vkDestroyFence(device_, frameFence_, nullptr);
        frameFence_ = VK_NULL_HANDLE;
    }
    if (renderFinished_ != VK_NULL_HANDLE) {
        vkDestroySemaphore(device_, renderFinished_, nullptr);
        renderFinished_ = VK_NULL_HANDLE;
    }
    if (imageAvailable_ != VK_NULL_HANDLE) {
        vkDestroySemaphore(device_, imageAvailable_, nullptr);
        imageAvailable_ = VK_NULL_HANDLE;
    }
    if (commandPool_ != VK_NULL_HANDLE) {
        vkDestroyCommandPool(device_, commandPool_, nullptr);
        commandPool_ = VK_NULL_HANDLE;
    }
    commandBuffer_ = VK_NULL_HANDLE;
}

void VulkanVideoSink::DestroyStagingBuffer()
{
    if (stagingBuffer_ != VK_NULL_HANDLE) {
        vkDestroyBuffer(device_, stagingBuffer_, nullptr);
        stagingBuffer_ = VK_NULL_HANDLE;
    }
    if (stagingMemory_ != VK_NULL_HANDLE) {
        vkFreeMemory(device_, stagingMemory_, nullptr);
        stagingMemory_ = VK_NULL_HANDLE;
    }
    stagingCapacity_ = 0;
}

void VulkanVideoSink::ResetContextState()
{
    physicalDevice_ = VK_NULL_HANDLE;
    queue_ = VK_NULL_HANDLE;
    queueFamilyIndex_ = 0;
    swapchainFormat_ = VK_FORMAT_UNDEFINED;
    swapchainExtent_ = {};
    swapRedBlue_ = false;
    window_ = nullptr;
    width_ = 0;
    height_ = 0;
    windowGeneration_ = 0;
    swapchainRecreatePending_ = false;
}

void VulkanVideoSink::Reset()
{
    PresentBlackFrame();
    ReleaseVulkanResources();
    fallbackOnly_ = false;
    fallback_.Reset();
    rgbaCache_.clear();
    uploadCache_.clear();
}

void VulkanVideoSink::BeginPlayback()
{
    // The Vulkan device is deliberately retained between tasks, but a BufferRenderer fallback is
    // specific to the previous decoded stream and must not affect the next file.
    fallbackOnly_ = false;
    fallback_.Reset();
    rgbaCache_.clear();
    uploadCache_.clear();
}
