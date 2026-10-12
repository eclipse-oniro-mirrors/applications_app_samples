/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#include "VulkanVideoSink.h"

#include <algorithm>
#include <array>
#include <chrono>
#include <memory>
#include <utility>

#include <native_fence/native_fence.h>

#include "../renderer/HdrMetadataHelper.h"
#include "VideoFrameConverter.h"
#include "VideoPresentationGeometry.h"
#include "VulkanVideoShaders.h"
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
constexpr uint32_t EXTERNAL_VERTEX_COUNT = 4;
// 资源 shader 使用 vec2 位置 + vec2 纹理坐标。两组坐标各自占用两个 float，
// 避免把顶点位置和纹理坐标复用同一内存，防止部分 GPU 读取到错误的裁剪范围。
constexpr uint32_t EXTERNAL_VERTEX_COMPONENTS = 4;
constexpr uint32_t EXTERNAL_DESCRIPTOR_COUNT = 2;
constexpr uint32_t EXTERNAL_TEXCOORD_COMPONENT_OFFSET = 2;
constexpr size_t COLOR_ALPHA_COMPONENT_INDEX = 3;
constexpr float OPAQUE_ALPHA_VALUE = 1.0F;
constexpr uint64_t NATIVE_IMAGE_WAIT_NS = 16ULL * 1000ULL * 1000ULL;
constexpr uint32_t NATIVE_BUFFER_FENCE_WAIT_MS = 16;
constexpr char EXTERNAL_MEMORY_EXTENSION[] = VK_OHOS_EXTERNAL_MEMORY_EXTENSION_NAME;
constexpr char YCBCR_EXTENSION[] = VK_KHR_SAMPLER_YCBCR_CONVERSION_EXTENSION_NAME;
constexpr std::array<float, VideoPresentationGeometry::MATRIX_ELEMENT_COUNT> IDENTITY_MATRIX = {
    1.0F, 0.0F, 0.0F, 0.0F,
    0.0F, 1.0F, 0.0F, 0.0F,
    0.0F, 0.0F, 1.0F, 0.0F,
    0.0F, 0.0F, 0.0F, 1.0F
};

struct ImageTransition {
    VkImage image = VK_NULL_HANDLE;
    VkImageLayout oldLayout = VK_IMAGE_LAYOUT_UNDEFINED;
    VkImageLayout newLayout = VK_IMAGE_LAYOUT_UNDEFINED;
    VkAccessFlags sourceAccess = 0;
    VkAccessFlags destinationAccess = 0;
    VkPipelineStageFlags sourceStage = VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT;
    VkPipelineStageFlags destinationStage = VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT;
};

bool ContainsExtension(const std::vector<VkExtensionProperties> &extensions, const char *name)
{
    return std::any_of(extensions.begin(), extensions.end(), [name](const VkExtensionProperties &extension) {
        return std::strcmp(extension.extensionName, name) == 0;
    });
}

double DivideByPositive(double numerator, double denominator)
{
    return denominator > 0.0 ? numerator / denominator : 0.0;
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

bool VulkanVideoSink::ConfigureWindowForGpu(OHNativeWindow *window, int32_t width, int32_t height, bool hdrOutput)
{
    if (window == nullptr || width <= 0 || height <= 0) {
        return false;
    }
    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(window, SET_BUFFER_GEOMETRY, width, height);
    if (ret != 0) {
        AVCODEC_SAMPLE_LOGW("Set Vulkan window geometry failed: %{public}d", ret);
        return false;
    }
    const int32_t format = hdrOutput ? NATIVEBUFFER_PIXEL_FMT_RGBA_1010102 : NATIVEBUFFER_PIXEL_FMT_RGBA_8888;
    ret = OH_NativeWindow_NativeWindowHandleOpt(window, SET_FORMAT, format);
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
    std::vector<const char *> instanceExtensions = { VK_KHR_SURFACE_EXTENSION_NAME, VK_OHOS_SURFACE_EXTENSION_NAME };
    // HDR 色彩空间枚举属于实例扩展。未启用该扩展时，即使设备支持 HDR，
    // vkGetPhysicalDeviceSurfaceFormatsKHR 也不会返回 HDR10/PQ 色彩空间。
    if (ContainsExtension(extensions, VK_EXT_SWAPCHAIN_COLOR_SPACE_EXTENSION_NAME)) {
        instanceExtensions.push_back(VK_EXT_SWAPCHAIN_COLOR_SPACE_EXTENSION_NAME);
    }
    if (ContainsExtension(extensions, VK_KHR_GET_PHYSICAL_DEVICE_PROPERTIES_2_EXTENSION_NAME)) {
        // Vulkan 1.0 实例通过该扩展查询 YCbCr 特性；Vulkan 1.1 设备则使用同名核心入口。
        instanceExtensions.push_back(VK_KHR_GET_PHYSICAL_DEVICE_PROPERTIES_2_EXTENSION_NAME);
    }
    VkInstanceCreateInfo createInfo{};
    createInfo.sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO;
    createInfo.pApplicationInfo = &applicationInfo;
    createInfo.enabledExtensionCount = static_cast<uint32_t>(instanceExtensions.size());
    createInfo.ppEnabledExtensionNames = instanceExtensions.data();
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
        uint32_t queueFamilyIndex = 0;
        if (IsDeviceSuitable(device, queueFamilyIndex)) {
            physicalDevice_ = device;
            queueFamilyIndex_ = queueFamilyIndex;
            return true;
        }
    }
    return false;
}

bool VulkanVideoSink::IsDeviceSuitable(VkPhysicalDevice device, uint32_t &queueFamilyIndex) const
{
    uint32_t extensionCount = 0;
    vkEnumerateDeviceExtensionProperties(device, nullptr, &extensionCount, nullptr);
    std::vector<VkExtensionProperties> extensions(extensionCount);
    vkEnumerateDeviceExtensionProperties(device, nullptr, &extensionCount, extensions.data());
    VkPhysicalDeviceProperties deviceProperties{};
    vkGetPhysicalDeviceProperties(device, &deviceProperties);
    const bool supportsCoreYcbcr = VK_VERSION_MAJOR(deviceProperties.apiVersion) > 1 ||
        (VK_VERSION_MAJOR(deviceProperties.apiVersion) == 1 && VK_VERSION_MINOR(deviceProperties.apiVersion) >= 1);
    // NativeBuffer 导入依赖 VK_OHOS_external_memory；只有交换链扩展而没有该扩展时，
    // 只能创建普通 Vulkan 窗口，不能完成 Surface 到外部纹理的送显。
    if (!ContainsExtension(extensions, DEVICE_SWAPCHAIN_EXTENSION) ||
        !ContainsExtension(extensions, EXTERNAL_MEMORY_EXTENSION) ||
        (!ContainsExtension(extensions, YCBCR_EXTENSION) && !supportsCoreYcbcr)) {
        AVCODEC_SAMPLE_LOGW("Vulkan device lacks swapchain, external-memory, or YCbCr support");
        return false;
    }
    VkPhysicalDeviceSamplerYcbcrConversionFeatures ycbcrFeatures{};
    ycbcrFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES;
    VkPhysicalDeviceFeatures2 deviceFeatures{};
    deviceFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2;
    deviceFeatures.pNext = &ycbcrFeatures;
    auto getFeatures2 = reinterpret_cast<PFN_vkGetPhysicalDeviceFeatures2>(
        vkGetInstanceProcAddr(instance_, "vkGetPhysicalDeviceFeatures2"));
    if (getFeatures2 == nullptr) {
        getFeatures2 = reinterpret_cast<PFN_vkGetPhysicalDeviceFeatures2>(
            vkGetInstanceProcAddr(instance_, "vkGetPhysicalDeviceFeatures2KHR"));
    }
    if (getFeatures2 == nullptr) {
        AVCODEC_SAMPLE_LOGW("Vulkan feature query is unavailable");
        return false;
    }
    getFeatures2(device, &deviceFeatures);
    if (ycbcrFeatures.samplerYcbcrConversion != VK_TRUE) {
        return false;
    }
    uint32_t familyCount = 0;
    vkGetPhysicalDeviceQueueFamilyProperties(device, &familyCount, nullptr);
    std::vector<VkQueueFamilyProperties> families(familyCount);
    vkGetPhysicalDeviceQueueFamilyProperties(device, &familyCount, families.data());
    for (uint32_t index = 0; index < familyCount; ++index) {
        VkBool32 supportsPresent = VK_FALSE;
        vkGetPhysicalDeviceSurfaceSupportKHR(device, index, surface_, &supportsPresent);
        if ((families[index].queueFlags & VK_QUEUE_GRAPHICS_BIT) != 0 && supportsPresent == VK_TRUE) {
            queueFamilyIndex = index;
            return true;
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
    VkPhysicalDeviceSamplerYcbcrConversionFeatures ycbcrFeatures{};
    ycbcrFeatures.sType = VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES;
    ycbcrFeatures.samplerYcbcrConversion = VK_TRUE;
    VkDeviceCreateInfo createInfo{};
    createInfo.sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO;
    createInfo.pQueueCreateInfos = &queueInfo;
    createInfo.queueCreateInfoCount = 1;
    createInfo.pEnabledFeatures = &features;
    createInfo.pNext = &ycbcrFeatures;
    uint32_t extensionCount = 0;
    std::vector<VkExtensionProperties> extensions;
    if (vkEnumerateDeviceExtensionProperties(physicalDevice_, nullptr, &extensionCount, nullptr) == VK_SUCCESS) {
        extensions.resize(extensionCount);
        (void)vkEnumerateDeviceExtensionProperties(physicalDevice_, nullptr, &extensionCount, extensions.data());
    }
    std::vector<const char *> deviceExtensions = { DEVICE_SWAPCHAIN_EXTENSION };
    if (ContainsExtension(extensions, EXTERNAL_MEMORY_EXTENSION)) {
        deviceExtensions.push_back(EXTERNAL_MEMORY_EXTENSION);
    }
    if (ContainsExtension(extensions, YCBCR_EXTENSION)) {
        deviceExtensions.push_back(YCBCR_EXTENSION);
    }
    createInfo.enabledExtensionCount = static_cast<uint32_t>(deviceExtensions.size());
    createInfo.ppEnabledExtensionNames = deviceExtensions.data();
    if (vkCreateDevice(physicalDevice_, &createInfo, nullptr, &device_) != VK_SUCCESS) {
        return false;
    }
    vkGetDeviceQueue(device_, queueFamilyIndex_, 0, &queue_);
    return queue_ != VK_NULL_HANDLE;
}

bool VulkanVideoSink::CreateSwapchain(int32_t width, int32_t height)
{
    if (!ConfigureWindowForSwapchain(width, height)) {
        return false;
    }
    VkSurfaceCapabilitiesKHR capabilities{};
    if (!QuerySwapchainCapabilities(capabilities)) {
        return false;
    }
    VkSurfaceFormatKHR surfaceFormat{};
    if (!SelectSwapchainFormat(surfaceFormat)) {
        return false;
    }
    return ConfigureSelectedSwapchainFormat(capabilities, surfaceFormat, width, height) &&
        CreateConfiguredSwapchain(capabilities, surfaceFormat);
}

bool VulkanVideoSink::ConfigureWindowForSwapchain(int32_t width, int32_t height)
{
    if (window_ == nullptr) {
        return true;
    }
    bool configured = ConfigureWindowForGpu(window_, width, height, preferHdrSwapchain_);
    const OH_NativeBuffer_ColorSpace requestedColorSpace = preferHdrSwapchain_ ? OH_COLORSPACE_BT2020_PQ_LIMIT :
        OH_COLORSPACE_BT709_LIMIT;
    (void)OH_NativeWindow_SetColorSpace(window_, requestedColorSpace);
    if (!configured && preferHdrSwapchain_) {
        AVCODEC_SAMPLE_LOGW("Configure Vulkan HDR window failed, retry with SDR format");
        configured = ConfigureWindowForGpu(window_, width, height, false);
        (void)OH_NativeWindow_SetColorSpace(window_, OH_COLORSPACE_BT709_LIMIT);
    }
    if (!configured) {
        AVCODEC_SAMPLE_LOGW("Configure Vulkan window before format query failed");
    }
    return configured;
}

bool VulkanVideoSink::QuerySwapchainCapabilities(VkSurfaceCapabilitiesKHR &capabilities) const
{
    constexpr VkImageUsageFlags colorAttachmentUsage = VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT;
    const VkImageUsageFlags requiredUsage = surfaceOutputRequested_ ? colorAttachmentUsage :
        colorAttachmentUsage | VK_IMAGE_USAGE_TRANSFER_DST_BIT;
    if (vkGetPhysicalDeviceSurfaceCapabilitiesKHR(physicalDevice_, surface_, &capabilities) != VK_SUCCESS) {
        AVCODEC_SAMPLE_LOGW("Query Vulkan surface capabilities failed");
        return false;
    }
    return ValidateSwapchainUsage(capabilities, requiredUsage);
}

bool VulkanVideoSink::ValidateSwapchainUsage(const VkSurfaceCapabilitiesKHR &capabilities,
    VkImageUsageFlags requiredUsage) const
{
    if ((capabilities.supportedUsageFlags & requiredUsage) != requiredUsage) {
        AVCODEC_SAMPLE_LOGW("Vulkan surface does not support required swapchain image usage");
        return false;
    }
    return true;
}

bool VulkanVideoSink::ConfigureSelectedSwapchainFormat(const VkSurfaceCapabilitiesKHR &capabilities,
    const VkSurfaceFormatKHR &surfaceFormat, int32_t width, int32_t height)
{
    if (!ConfigureSwapchainWindowColor(width, height)) {
        AVCODEC_SAMPLE_LOGW("Configure Vulkan window for selected swapchain format failed");
        return false;
    }
    swapchainFormat_ = surfaceFormat.format;
    VkFormatProperties formatProperties{};
    vkGetPhysicalDeviceFormatProperties(physicalDevice_, swapchainFormat_, &formatProperties);
    constexpr VkFormatFeatureFlags transferFeatures = VK_FORMAT_FEATURE_BLIT_DST_BIT;
    swapchainTransferSupported_ = (capabilities.supportedUsageFlags & VK_IMAGE_USAGE_TRANSFER_DST_BIT) != 0 &&
        (formatProperties.optimalTilingFeatures & transferFeatures) == transferFeatures;
    swapRedBlue_ = swapchainFormat_ == VK_FORMAT_B8G8R8A8_UNORM;
    swapchainExtent_ = ResolveSwapchainExtent(capabilities, width, height);
    return true;
}

bool VulkanVideoSink::ConfigureSwapchainWindowColor(int32_t width, int32_t height)
{
    if (window_ == nullptr) {
        return true;
    }
    if (!ConfigureWindowForGpu(window_, width, height, hdrSwapchainActive_)) {
        return false;
    }
    const OH_NativeBuffer_ColorSpace colorSpace = hdrSwapchainActive_ ? OH_COLORSPACE_BT2020_PQ_LIMIT :
        OH_COLORSPACE_BT709_LIMIT;
    if (OH_NativeWindow_SetColorSpace(window_, colorSpace) != 0) {
        AVCODEC_SAMPLE_LOGW("Set Vulkan window color space for selected format failed");
    }
    return true;
}

bool VulkanVideoSink::CreateConfiguredSwapchain(const VkSurfaceCapabilitiesKHR &capabilities,
    const VkSurfaceFormatKHR &surfaceFormat)
{
    constexpr VkImageUsageFlags colorAttachmentUsage = VK_IMAGE_USAGE_COLOR_ATTACHMENT_BIT;
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
    createInfo.imageUsage = colorAttachmentUsage;
    if (swapchainTransferSupported_ && !surfaceOutputRequested_) {
        createInfo.imageUsage |= VK_IMAGE_USAGE_TRANSFER_DST_BIT;
    }
    createInfo.imageSharingMode = VK_SHARING_MODE_EXCLUSIVE;
    createInfo.preTransform = capabilities.currentTransform;
    createInfo.compositeAlpha = SelectCompositeAlpha(capabilities);
    if (createInfo.compositeAlpha == 0) {
        AVCODEC_SAMPLE_LOGW("Vulkan surface has no supported composite alpha mode");
        return false;
    }
    createInfo.presentMode = SelectPresentMode();
    createInfo.clipped = VK_TRUE;
    return vkCreateSwapchainKHR(device_, &createInfo, nullptr, &swapchain_) == VK_SUCCESS && LoadSwapchainImages();
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
    if (preferHdrSwapchain_) {
        // HDR Surface 使用 10-bit UNORM 承载解码器输出的 PQ 数值。窗口元数据在首帧
        // 读取后再同步为 HDR Vivid，避免把容器声明误当成真实 HDR 内容。
        auto hdrFormatIt = std::find_if(formats.begin(), formats.end(), [](const VkSurfaceFormatKHR &format) {
            return (format.format == VK_FORMAT_A2B10G10R10_UNORM_PACK32 ||
                format.format == VK_FORMAT_A2R10G10B10_UNORM_PACK32) &&
                format.colorSpace == VK_COLOR_SPACE_HDR10_ST2084_EXT;
        });
        if (hdrFormatIt != formats.end()) {
            surfaceFormat = *hdrFormatIt;
            hdrSwapchainActive_ = true;
            AVCODEC_SAMPLE_LOGI("Use Vulkan HDR swapchain format: %{public}d, color space: %{public}d",
                static_cast<int32_t>(surfaceFormat.format), static_cast<int32_t>(surfaceFormat.colorSpace));
            return true;
        }
        AVCODEC_SAMPLE_LOGW("HDR swapchain format count: %{public}u", formatCount);
        AVCODEC_SAMPLE_LOGW("HDR Vulkan surface format is unavailable, use 8-bit output");
    }
    hdrSwapchainActive_ = false;
    // 同时支持两种格式时使用 RGBA，可避免每次上传前在 CPU 上完整交换红蓝通道。
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
        renderFinishedSemaphores_.assign(imageCount, VK_NULL_HANDLE);
        VkSemaphoreCreateInfo semaphoreInfo{};
        semaphoreInfo.sType = VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO;
        for (VkSemaphore &semaphore : renderFinishedSemaphores_) {
            if (vkCreateSemaphore(device_, &semaphoreInfo, nullptr, &semaphore) != VK_SUCCESS) {
                return false;
            }
        }
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
    if (vkCreateSemaphore(device_, &semaphoreInfo, nullptr, &imageAvailable_) != VK_SUCCESS) {
        return false;
    }
    VkFenceCreateInfo fenceInfo{};
    fenceInfo.sType = VK_STRUCTURE_TYPE_FENCE_CREATE_INFO;
    fenceInfo.flags = VK_FENCE_CREATE_SIGNALED_BIT;
    return vkCreateFence(device_, &fenceInfo, nullptr, &frameFence_) == VK_SUCCESS;
}

bool VulkanVideoSink::LoadShaderModule(const uint32_t *code, size_t wordCount, VkShaderModule &module)
{
    module = VK_NULL_HANDLE;
    if (code == nullptr || wordCount == 0) {
        return false;
    }
    VkShaderModuleCreateInfo createInfo{};
    createInfo.sType = VK_STRUCTURE_TYPE_SHADER_MODULE_CREATE_INFO;
    createInfo.codeSize = wordCount * sizeof(uint32_t);
    createInfo.pCode = code;
    return vkCreateShaderModule(device_, &createInfo, nullptr, &module) == VK_SUCCESS;
}

bool VulkanVideoSink::Initialize(OHNativeWindow *window, int32_t width, int32_t height)
{
    window_ = window;
    width_ = width;
    height_ = height;
    if (window == nullptr || width <= 0 || height <= 0 || !CreateInstance() || !CreateSurface(window) ||
        !SelectDevice() || !CreateDevice() || !CreateSwapchain(width, height) || !CreateCommandResources()) {
        ReleaseVulkanResources();
        return false;
    }
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
    // mapped 指针只在 vkMapMemory 与 vkUnmapMemory 之间有效，拷贝后立即解除映射。
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

bool VulkanVideoSink::CalculateExternalPresentRegion(PresentRegion &region) const
{
    VideoPresentationGeometry::Region fit{};
    const VideoPresentationGeometry::FitRegionRequest request {
        externalVideoWidth_, externalVideoHeight_, externalVideoRotation_,
        static_cast<int32_t>(swapchainExtent_.width), static_cast<int32_t>(swapchainExtent_.height) };
    if (!VideoPresentationGeometry::CalculateFitRegion(request, fit)) {
        return false;
    }
    region = { fit.left, fit.top, fit.width, fit.height };
    return true;
}

bool VulkanVideoSink::UpdateExternalTransform()
{
    if (currentNativeBuffer_ == nullptr || externalUniformMapped_ == nullptr) {
        AVCODEC_SAMPLE_LOGW("Vulkan NativeBuffer is unavailable for transform");
        return false;
    }
    // Vulkan 使用 AcquireLatestNativeWindowBuffer 消费 NativeImage。该接口不能与
    // UpdateSurfaceImage/GetBufferMatrix 混用，因此裁剪信息从当前 acquired Buffer 的
    // 配置计算，而不是读取可能属于另一帧的 last-flushed 矩阵。
    OH_NativeBuffer_Config config{};
    OH_NativeBuffer_GetConfig(currentNativeBuffer_, &config);
    const int32_t bufferWidth = config.width > 0 ? config.width : externalVideoWidth_;
    const int32_t bufferHeight = config.height > 0 ? config.height : externalVideoHeight_;
    std::array<float, VideoPresentationGeometry::MATRIX_ELEMENT_COUNT> contentMatrix{};
    if (!VideoPresentationGeometry::BuildContentCropMatrix(bufferWidth, bufferHeight, externalVideoWidth_,
        externalVideoHeight_, contentMatrix)) {
        AVCODEC_SAMPLE_LOGW("Invalid Vulkan NativeBuffer content size: buffer %{public}d x %{public}d, content "
            "%{public}d x %{public}d", bufferWidth, bufferHeight, externalVideoWidth_, externalVideoHeight_);
        return false;
    }
    // decoder rotation 固定为 0，容器方向在裁剪之前应用一次，避免生产端再次旋转。
    externalTransform_ = VideoPresentationGeometry::RotateTextureMatrix(contentMatrix, externalVideoRotation_);
    std::copy(externalTransform_.begin(), externalTransform_.end(), static_cast<float *>(externalUniformMapped_));
    return true;
}

bool VulkanVideoSink::SubmitFrame(uint32_t imageIndex)
{
    if (imageIndex >= renderFinishedSemaphores_.size()) {
        return false;
    }
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
    submit.pSignalSemaphores = &renderFinishedSemaphores_[imageIndex];
    const bool submitted = vkQueueSubmit(queue_, 1, &submit, frameFence_) == VK_SUCCESS;
    frameInFlight_ = submitted;
    VkPresentInfoKHR present{};
    present.sType = VK_STRUCTURE_TYPE_PRESENT_INFO_KHR;
    present.waitSemaphoreCount = 1;
    present.pWaitSemaphores = &renderFinishedSemaphores_[imageIndex];
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
    if (!CanClearCurrentSwapchain() || !WaitForVulkanDeviceForClear()) {
        return;
    }
    frameInFlight_ = false;
    if (!EnsureBlackFramebuffers()) {
        return;
    }
    uint32_t imageIndex = 0;
    if (!AcquireBlackFrameImage(imageIndex) || !RecordAndSubmitBlackFrame(imageIndex)) {
        return;
    }
    frameInFlight_ = false;
    if (swapchainRecreatePending_) {
        AVCODEC_SAMPLE_LOGW("Vulkan black frame submitted but present is out of date");
        return;
    }
    if (!HdrMetadataHelper::ResetNativeWindowSdrMetadata(window_)) {
        AVCODEC_SAMPLE_LOGW("Reset Vulkan window metadata after clearing failed");
    }
}

bool VulkanVideoSink::CanClearCurrentSwapchain() const
{
    if (!initialized_ || device_ == VK_NULL_HANDLE || swapchain_ == VK_NULL_HANDLE) {
        return false;
    }
    if (swapchainRecreatePending_) {
        AVCODEC_SAMPLE_LOGW("Skip Vulkan black frame because swapchain recreation is pending");
        return false;
    }
    return true;
}

bool VulkanVideoSink::WaitForVulkanDeviceForClear()
{
    if (vkDeviceWaitIdle(device_) == VK_SUCCESS) {
        return true;
    }
    AVCODEC_SAMPLE_LOGW("Wait Vulkan device before clearing the previous frame failed");
    return false;
}

bool VulkanVideoSink::EnsureBlackFramebuffers()
{
    const bool framebuffersMatch = externalFramebuffers_.size() == swapchainImages_.size() &&
        externalFrameBufferViews_.size() == swapchainImages_.size();
    if (externalRenderPass_ != VK_NULL_HANDLE && framebuffersMatch) {
        return true;
    }
    // Framebuffer 绑定具体的 swapchain image，重建交换链后必须一并更新。
    if (externalRenderPass_ != VK_NULL_HANDLE || !externalFramebuffers_.empty()) {
        DestroyExternalFramebuffers();
        if (externalRenderPass_ != VK_NULL_HANDLE) {
            vkDestroyRenderPass(device_, externalRenderPass_, nullptr);
            externalRenderPass_ = VK_NULL_HANDLE;
        }
    }
    return CreateExternalRenderPass();
}

bool VulkanVideoSink::AcquireBlackFrameImage(uint32_t &imageIndex)
{
    const VkResult result = vkAcquireNextImageKHR(device_, swapchain_, NATIVE_IMAGE_WAIT_NS, imageAvailable_,
        VK_NULL_HANDLE, &imageIndex);
    if ((result == VK_SUCCESS || result == VK_SUBOPTIMAL_KHR) && imageIndex < externalFramebuffers_.size()) {
        return true;
    }
    AVCODEC_SAMPLE_LOGW("Acquire Vulkan image for clearing failed: %{public}d", static_cast<int32_t>(result));
    if (result == VK_SUCCESS || result == VK_SUBOPTIMAL_KHR || result == VK_ERROR_OUT_OF_DATE_KHR ||
        result == VK_ERROR_SURFACE_LOST_KHR || result == VK_ERROR_DEVICE_LOST) {
        swapchainRecreatePending_ = true;
    }
    return false;
}

bool VulkanVideoSink::RecordAndSubmitBlackFrame(uint32_t imageIndex)
{
    if (vkResetCommandBuffer(commandBuffer_, 0) != VK_SUCCESS) {
        swapchainRecreatePending_ = true;
        return false;
    }
    VkCommandBufferBeginInfo beginInfo{};
    beginInfo.sType = VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO;
    if (vkBeginCommandBuffer(commandBuffer_, &beginInfo) != VK_SUCCESS) {
        swapchainRecreatePending_ = true;
        return false;
    }
    RecordBlackClearPass(imageIndex);
    const bool recorded = vkEndCommandBuffer(commandBuffer_) == VK_SUCCESS;
    if (!recorded) {
        swapchainRecreatePending_ = true;
    }
    const bool submitted = recorded && SubmitExternalFrame(imageIndex);
    const bool idle = vkDeviceWaitIdle(device_) == VK_SUCCESS;
    if (!submitted || !idle) {
        AVCODEC_SAMPLE_LOGW("Present Vulkan black frame failed");
        return false;
    }
    return true;
}

void VulkanVideoSink::RecordBlackClearPass(uint32_t imageIndex)
{
    // 使用颜色附件清屏；HDR packed 格式不能用 RGBA8888 整数值代替黑色。
    VkClearValue clearValue{};
    clearValue.color = BLACK;
    VkRenderPassBeginInfo passInfo{};
    passInfo.sType = VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO;
    passInfo.renderPass = externalRenderPass_;
    passInfo.framebuffer = externalFramebuffers_[imageIndex];
    passInfo.renderArea.extent = swapchainExtent_;
    passInfo.clearValueCount = 1;
    passInfo.pClearValues = &clearValue;
    vkCmdBeginRenderPass(commandBuffer_, &passInfo, VK_SUBPASS_CONTENTS_INLINE);
    vkCmdEndRenderPass(commandBuffer_);
}

bool VulkanVideoSink::Quiesce()
{
    if (device_ == VK_NULL_HANDLE) {
        return true;
    }
    const VkResult ret = vkDeviceWaitIdle(device_);
    if (ret != VK_SUCCESS) {
        AVCODEC_SAMPLE_LOGW("Wait Vulkan output before codec reset failed: %{public}d", static_cast<int32_t>(ret));
        return false;
    }
    frameInFlight_ = false;
    ReleaseCurrentNativeBuffer();
    // Quiesce 只负责让 GPU 和当前 NativeImage buffer 达到静止状态。
    // 交换链尺寸变化和 Seek 都可能紧接着销毁 framebuffer，清屏必须由
    // Reset/新播放阶段执行，避免在过期交换链上重复 Acquire/Present。
    return true;
}

void VulkanVideoSink::DiscardPendingFrames()
{
    if (nativeImage_ == nullptr) {
        return;
    }
    // 此时 codec 已 Flush，应用输出线程也已退出，不会继续提交旧时间轴的帧。
    // 不等待生产者 fence、不采样，直接把 fence 随 Buffer 交回队列即可。
    availableFrameCount_.exchange(0);
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd = -1;
    const int32_t ret = OH_NativeImage_AcquireLatestNativeWindowBuffer(nativeImage_, &buffer, &fenceFd);
    if (ret == 0 && buffer != nullptr) {
        (void)OH_NativeImage_ReleaseNativeWindowBuffer(nativeImage_, buffer, fenceFd);
    } else if (fenceFd >= 0) {
        OH_NativeFence_Close(fenceFd);
    }
}

bool VulkanVideoSink::EnsureContext(NativeXComponentSample::PluginManager::PluginWindowLease &&windowLease)
{
    if (!windowLease) {
        return false;
    }
    OHNativeWindow *window = windowLease.GetWindow();
    const int32_t width = windowLease.GetWidth();
    const int32_t height = windowLease.GetHeight();
    const uint64_t generation = windowLease.GetGeneration();
    const bool windowChanged = initialized_ && window_ != window;
    if (initialized_ && !windowChanged) {
        const bool sizeChanged = width_ != width || height_ != height;
        if (sizeChanged && !ConfigureWindowForGpu(window, width, height, preferHdrSwapchain_)) {
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
        // 尺寸未变的 XComponent 刷新也可能保留 NativeWindow 地址却替换底层 Surface。此时必须新建 Vulkan
        // Surface；只重建 swapchain 会保留旧 extent，使视频在当前 XComponent 内发生偏移。
        ReleaseVulkanResources();
    }
    if (!ConfigureWindowForGpu(window, width, height, preferHdrSwapchain_)) {
        return false;
    }
    if (!Initialize(window, width, height)) {
        return false;
    }
    // VkSurfaceKHR 会在整个播放期间访问该 NativeWindow；成功创建后由 sink 接管窗口租约。
    windowLease_ = std::move(windowLease);
    windowGeneration_ = generation;
    return true;
}

bool VulkanVideoSink::RecreateSwapchain(int32_t width, int32_t height)
{
    if (device_ == VK_NULL_HANDLE) {
        return false;
    }
    if (!Quiesce()) {
        return false;
    }
    if (surfaceDecoderReady_ || externalRenderPass_ != VK_NULL_HANDLE ||
        !externalFramebuffers_.empty()) {
        DestroyExternalRenderResources();
    }
    // XComponent 配置变化时，选中的 Surface 格式也可能改变。
    // 需连同 swapchain 一起重建上传图像，确保两者格式一致。
    ReleaseUploadImage();
    DestroySwapchain();
    DestroyFrameResources();
    if (!CreateSwapchain(width, height) || !CreateCommandResources()) {
        return false;
    }
    return !surfaceDecoderReady_ || CreateExternalRenderResources();
}

int32_t VulkanVideoSink::Present(const VideoPresentRequest &request)
{
    if (!surfaceDecoderReady_) {
        // Vulkan 链路固定使用 Surface 输出。异常情况下只归还 codec Buffer，
        // 不能让旧的 BufferRenderer 接管当前播放。
        const int32_t freeRet = request.decoder.FreeOutputBuffer(request.bufferInfo.bufferIndex, false);
        AVCODEC_SAMPLE_LOGE("Vulkan Surface decoder is unavailable, skip frame");
        return freeRet == AVCODEC_SAMPLE_ERR_OK ? AVCODEC_SAMPLE_ERR_ERROR : freeRet;
    }
    externalVideoWidth_ = request.context.width > 0 ? request.context.width : request.sampleInfo.video.videoWidth;
    externalVideoHeight_ = request.context.height > 0 ? request.context.height : request.sampleInfo.video.videoHeight;
    // 解码器只负责把帧提交到 NativeImage 生产者；Vulkan 消费者在归还 codec Buffer 后
    // 获取同一帧的 NativeWindowBuffer，并通过 OHOS 外部内存导入到 Vulkan 图像。
    const int32_t freeRet = request.decoder.FreeOutputBuffer(request.bufferInfo.bufferIndex, request.render,
        request.renderTimestamp);
    if (freeRet != AVCODEC_SAMPLE_ERR_OK || !request.render) {
        return freeRet;
    }
    if (!RenderNativeImageFrame()) {
        AVCODEC_SAMPLE_LOGW("Vulkan NativeImage frame presentation failed; drop frame");
    }
    return AVCODEC_SAMPLE_ERR_OK;
}

OHNativeWindow *VulkanVideoSink::PrepareForPlayback(const SampleInfo &sampleInfo)
{
    // Surface 解码和 Vulkan Buffer 渲染不能同时占用同一个 XComponent 窗口。
    // 切换到 Surface 前先清理上一轮 Vulkan 生产者，避免旧 swapchain 持有窗口或残留最后一帧。
    if (initialized_ || windowLease_) {
        PresentBlackFrame();
        ReleaseVulkanResources();
    }
    // 解码器输出先进入 NativeImage consumer，再由 Vulkan 以 OHOS 外部内存方式采样。
    surfaceOutputRequested_ = true;
    surfaceDecoderReady_ = false;
    preferHdrSwapchain_ = (sampleInfo.video.hdrVividContainerSignaled || sampleInfo.video.isHDRVivid != 0) &&
        !sampleInfo.codec.convertHdrVividToBt709;
    outputMetadataInitialized_ = false;
    metadataWarningLogged_ = false;
    hdrVividConfirmed_ = false;
    auto outputWindowLease = NativeXComponentSample::PluginManager::GetInstance()->AcquirePluginWindow();
    if (!outputWindowLease || !EnsureContext(std::move(outputWindowLease))) {
        AVCODEC_SAMPLE_LOGW("Vulkan output Surface is unavailable");
        surfaceOutputRequested_ = false;
        return nullptr;
    }
    if (!preferHdrSwapchain_) {
        outputMetadataInitialized_ = HdrMetadataHelper::ResetNativeWindowSdrMetadata(window_);
    }
    const int32_t videoWidth = sampleInfo.video.videoWidth > 0 ? sampleInfo.video.videoWidth : width_;
    const int32_t videoHeight = sampleInfo.video.videoHeight > 0 ? sampleInfo.video.videoHeight : height_;
    externalVideoWidth_ = videoWidth;
    externalVideoHeight_ = videoHeight;
    externalVideoRotation_ = sampleInfo.video.rotation;
    if (!CreateExternalRenderResources() || !CreateNativeImage(videoWidth, videoHeight)) {
        AVCODEC_SAMPLE_LOGW("Vulkan external NativeImage resources are unavailable");
        DestroyNativeImage();
        ReleaseVulkanResources();
        surfaceOutputRequested_ = false;
        return nullptr;
    }
    surfaceDecoderReady_ = true;
    AVCODEC_SAMPLE_LOGI("Vulkan mode uses Surface to NativeImage external-memory output");
    return decoderWindow_;
}

void VulkanVideoSink::DestroySwapchain()
{
    for (VkSemaphore semaphore : renderFinishedSemaphores_) {
        if (semaphore != VK_NULL_HANDLE) {
            vkDestroySemaphore(device_, semaphore, nullptr);
        }
    }
    renderFinishedSemaphores_.clear();
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
    surfaceOutputRequested_ = false;
    outputMetadataInitialized_ = false;
    metadataWarningLogged_ = false;
    hdrVividConfirmed_ = false;
    if (device_ != VK_NULL_HANDLE) {
        (void)vkDeviceWaitIdle(device_);
        frameInFlight_ = false;
        DestroyNativeImage();
        DestroyExternalRenderResources();
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
    // 所有依赖 NativeWindow 的 Vulkan 对象均已销毁，随后才解除窗口引用。
    windowLease_ = {};
    ResetContextState();
}

void VulkanVideoSink::DestroyFrameResources()
{
    if (frameFence_ != VK_NULL_HANDLE) {
        vkDestroyFence(device_, frameFence_, nullptr);
        frameFence_ = VK_NULL_HANDLE;
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
    swapchainTransferSupported_ = false;
    window_ = nullptr;
    width_ = 0;
    height_ = 0;
    windowGeneration_ = 0;
    swapchainRecreatePending_ = false;
    frameInFlight_ = false;
}

void VulkanVideoSink::Reset()
{
    // Surface 解码器由 Player 在此之前销毁；此时才能解除 decoder 使用的窗口租约。
    surfaceDecoderReady_ = false;
    PresentBlackFrame();
    ReleaseVulkanResources();
    fallbackOnly_ = false;
    fallback_.Reset();
    rgbaCache_.clear();
    uploadCache_.clear();
}

void VulkanVideoSink::BeginPlayback()
{
    // Vulkan 设备有意跨任务保留，但 BufferRenderer 回退状态只属于前一条已解码流，
    // 不能影响下一个文件。
    if (initialized_ || windowLease_) {
        PresentBlackFrame();
        ReleaseVulkanResources();
    }
    fallbackOnly_ = false;
    surfaceDecoderReady_ = false;
    fallback_.Reset();
    rgbaCache_.clear();
    uploadCache_.clear();
}
