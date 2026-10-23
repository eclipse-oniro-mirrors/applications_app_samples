/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "VulkanVideoSink.h"

#include <algorithm>
#include <array>
#include <chrono>

#include <native_fence/native_fence.h>

#include "../renderer/HdrMetadataHelper.h"
#include "VulkanVideoShaders.h"
#include "av_codec_sample_log.h"
#include "dfx/error/av_codec_sample_error.h"
#include "plugin_manager.h"

#undef LOG_TAG
#define LOG_TAG "VulkanVideoSink"

namespace {
constexpr uint64_t FRAME_READY_WAIT_NS = 2ULL * 1000ULL * 1000ULL;
constexpr uint64_t IMAGE_ACQUIRE_WAIT_NS = 2ULL * 1000ULL * 1000ULL;
constexpr uint32_t IMAGE_SUBRESOURCE_LEVEL_COUNT = 1;
constexpr uint32_t IMAGE_SUBRESOURCE_LAYER_COUNT = 1;
constexpr uint32_t EXTERNAL_VERTEX_COUNT = 4;
constexpr uint32_t EXTERNAL_VERTEX_COMPONENTS = 4;
constexpr uint32_t EXTERNAL_DESCRIPTOR_COUNT = 2;
constexpr uint32_t EXTERNAL_TEXCOORD_COMPONENT_OFFSET = 2;
constexpr size_t COLOR_ALPHA_COMPONENT_INDEX = 3;
constexpr float OPAQUE_ALPHA_VALUE = 1.0F;
constexpr uint64_t NATIVE_IMAGE_WAIT_NS = 16ULL * 1000ULL * 1000ULL;
constexpr uint32_t NATIVE_BUFFER_FENCE_WAIT_MS = 16;
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

void TransitionImage(VkCommandBuffer commandBuffer, const ImageTransition &transition)
{
    VkImageMemoryBarrier barrier{};
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

} // namespace

bool VulkanVideoSink::CreateExternalRenderPass()
{
    VkAttachmentDescription attachment{};
    attachment.format = swapchainFormat_;
    attachment.samples = VK_SAMPLE_COUNT_1_BIT;
    attachment.loadOp = VK_ATTACHMENT_LOAD_OP_CLEAR;
    attachment.storeOp = VK_ATTACHMENT_STORE_OP_STORE;
    attachment.stencilLoadOp = VK_ATTACHMENT_LOAD_OP_DONT_CARE;
    attachment.stencilStoreOp = VK_ATTACHMENT_STORE_OP_DONT_CARE;
    attachment.initialLayout = VK_IMAGE_LAYOUT_UNDEFINED;
    attachment.finalLayout = VK_IMAGE_LAYOUT_PRESENT_SRC_KHR;
    VkAttachmentReference colorReference{};
    colorReference.attachment = 0;
    colorReference.layout = VK_IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL;
    VkSubpassDescription subpass{};
    subpass.pipelineBindPoint = VK_PIPELINE_BIND_POINT_GRAPHICS;
    subpass.colorAttachmentCount = 1;
    subpass.pColorAttachments = &colorReference;
    VkRenderPassCreateInfo renderPassInfo{};
    renderPassInfo.sType = VK_STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO;
    renderPassInfo.attachmentCount = 1;
    renderPassInfo.pAttachments = &attachment;
    renderPassInfo.subpassCount = 1;
    renderPassInfo.pSubpasses = &subpass;
    if (vkCreateRenderPass(device_, &renderPassInfo, nullptr, &externalRenderPass_) != VK_SUCCESS) {
        return false;
    }
    return CreateExternalFramebuffers();
}

bool VulkanVideoSink::CreateExternalFramebuffers()
{
    externalFrameBufferViews_.reserve(swapchainImages_.size());
    externalFramebuffers_.reserve(swapchainImages_.size());
    for (VkImage image : swapchainImages_) {
        VkImageViewCreateInfo viewInfo{};
        viewInfo.sType = VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO;
        viewInfo.image = image;
        viewInfo.viewType = VK_IMAGE_VIEW_TYPE_2D;
        viewInfo.format = swapchainFormat_;
        viewInfo.subresourceRange.aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
        viewInfo.subresourceRange.levelCount = 1;
        viewInfo.subresourceRange.layerCount = 1;
        VkImageView view = VK_NULL_HANDLE;
        if (vkCreateImageView(device_, &viewInfo, nullptr, &view) != VK_SUCCESS) {
            return false;
        }
        externalFrameBufferViews_.push_back(view);
        VkFramebufferCreateInfo frameInfo{};
        frameInfo.sType = VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO;
        frameInfo.renderPass = externalRenderPass_;
        frameInfo.attachmentCount = 1;
        frameInfo.pAttachments = &externalFrameBufferViews_.back();
        frameInfo.width = swapchainExtent_.width;
        frameInfo.height = swapchainExtent_.height;
        frameInfo.layers = 1;
        VkFramebuffer framebuffer = VK_NULL_HANDLE;
        if (vkCreateFramebuffer(device_, &frameInfo, nullptr, &framebuffer) != VK_SUCCESS) {
            return false;
        }
        externalFramebuffers_.push_back(framebuffer);
    }
    return !externalFramebuffers_.empty();
}

bool VulkanVideoSink::CreateExternalVertexBuffer()
{
    constexpr std::array<float, EXTERNAL_VERTEX_COUNT * EXTERNAL_VERTEX_COMPONENTS> vertices = {
        -1.0F, -1.0F, 0.0F, 1.0F,
        1.0F, -1.0F, 1.0F, 1.0F,
        -1.0F, 1.0F, 0.0F, 0.0F,
        1.0F, 1.0F, 1.0F, 0.0F
    };
    VkBufferCreateInfo bufferInfo{};
    bufferInfo.sType = VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO;
    bufferInfo.size = sizeof(vertices);
    bufferInfo.usage = VK_BUFFER_USAGE_VERTEX_BUFFER_BIT;
    bufferInfo.sharingMode = VK_SHARING_MODE_EXCLUSIVE;
    if (vkCreateBuffer(device_, &bufferInfo, nullptr, &externalVertexBuffer_) != VK_SUCCESS) {
        return false;
    }
    VkMemoryRequirements requirements{};
    vkGetBufferMemoryRequirements(device_, externalVertexBuffer_, &requirements);
    const uint32_t type = FindMemoryType(requirements.memoryTypeBits,
        VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT | VK_MEMORY_PROPERTY_HOST_COHERENT_BIT);
    if (type == UINT32_MAX) {
        return false;
    }
    VkMemoryAllocateInfo allocation{};
    allocation.sType = VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO;
    allocation.allocationSize = requirements.size;
    allocation.memoryTypeIndex = type;
    if (vkAllocateMemory(device_, &allocation, nullptr, &externalVertexMemory_) != VK_SUCCESS ||
        vkBindBufferMemory(device_, externalVertexBuffer_, externalVertexMemory_, 0) != VK_SUCCESS) {
        return false;
    }
    void *mapped = nullptr;
    if (vkMapMemory(device_, externalVertexMemory_, 0, sizeof(vertices), 0, &mapped) != VK_SUCCESS ||
        mapped == nullptr) {
        return false;
    }
    std::copy(vertices.begin(), vertices.end(), static_cast<float *>(mapped));
    vkUnmapMemory(device_, externalVertexMemory_);
    return true;
}

bool VulkanVideoSink::CreateExternalUniformBuffer()
{
    VkBufferCreateInfo bufferInfo{};
    bufferInfo.sType = VK_STRUCTURE_TYPE_BUFFER_CREATE_INFO;
    bufferInfo.size = sizeof(float) * externalTransform_.size();
    bufferInfo.usage = VK_BUFFER_USAGE_UNIFORM_BUFFER_BIT;
    bufferInfo.sharingMode = VK_SHARING_MODE_EXCLUSIVE;
    if (vkCreateBuffer(device_, &bufferInfo, nullptr, &externalUniformBuffer_) != VK_SUCCESS) {
        return false;
    }
    VkMemoryRequirements requirements{};
    vkGetBufferMemoryRequirements(device_, externalUniformBuffer_, &requirements);
    const uint32_t type = FindMemoryType(requirements.memoryTypeBits,
        VK_MEMORY_PROPERTY_HOST_VISIBLE_BIT | VK_MEMORY_PROPERTY_HOST_COHERENT_BIT);
    if (type == UINT32_MAX) {
        return false;
    }
    VkMemoryAllocateInfo allocation{};
    allocation.sType = VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO;
    allocation.allocationSize = requirements.size;
    allocation.memoryTypeIndex = type;
    if (vkAllocateMemory(device_, &allocation, nullptr, &externalUniformMemory_) != VK_SUCCESS ||
        vkBindBufferMemory(device_, externalUniformBuffer_, externalUniformMemory_, 0) != VK_SUCCESS) {
        return false;
    }
    if (vkMapMemory(device_, externalUniformMemory_, 0, sizeof(float) * externalTransform_.size(), 0,
        &externalUniformMapped_) != VK_SUCCESS || externalUniformMapped_ == nullptr) {
        return false;
    }
    std::copy(IDENTITY_MATRIX.begin(), IDENTITY_MATRIX.end(), static_cast<float *>(externalUniformMapped_));
    return true;
}

bool VulkanVideoSink::CreateExternalDescriptorResources()
{
    VkDescriptorSetLayoutBinding uniformBinding{};
    uniformBinding.binding = 0;
    uniformBinding.descriptorType = VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER;
    uniformBinding.descriptorCount = 1;
    uniformBinding.stageFlags = VK_SHADER_STAGE_VERTEX_BIT;
    VkDescriptorSetLayoutBinding imageBinding{};
    imageBinding.binding = 1;
    imageBinding.descriptorType = VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER;
    imageBinding.descriptorCount = 1;
    imageBinding.stageFlags = VK_SHADER_STAGE_FRAGMENT_BIT;
    // YCbCr 转换要求采样器作为不可变采样器写入布局。一个播放会话内所有解码
    // 输出 Buffer 使用同一格式，后续帧只替换外部图像和图像视图。
    imageBinding.pImmutableSamplers = &externalSampler_;
    const std::array<VkDescriptorSetLayoutBinding, EXTERNAL_DESCRIPTOR_COUNT> bindings = {
        uniformBinding, imageBinding
    };
    VkDescriptorSetLayoutCreateInfo layoutInfo{};
    layoutInfo.sType = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_LAYOUT_CREATE_INFO;
    layoutInfo.bindingCount = static_cast<uint32_t>(bindings.size());
    layoutInfo.pBindings = bindings.data();
    if (vkCreateDescriptorSetLayout(device_, &layoutInfo, nullptr, &externalDescriptorSetLayout_) != VK_SUCCESS) {
        return false;
    }
    const std::array<VkDescriptorPoolSize, EXTERNAL_DESCRIPTOR_COUNT> poolSizes = {
        VkDescriptorPoolSize { VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER, 1 },
        VkDescriptorPoolSize { VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER, 1 }
    };
    VkDescriptorPoolCreateInfo poolInfo{};
    poolInfo.sType = VK_STRUCTURE_TYPE_DESCRIPTOR_POOL_CREATE_INFO;
    poolInfo.maxSets = 1;
    poolInfo.poolSizeCount = static_cast<uint32_t>(poolSizes.size());
    poolInfo.pPoolSizes = poolSizes.data();
    if (vkCreateDescriptorPool(device_, &poolInfo, nullptr, &externalDescriptorPool_) != VK_SUCCESS) {
        vkDestroyDescriptorSetLayout(device_, externalDescriptorSetLayout_, nullptr);
        externalDescriptorSetLayout_ = VK_NULL_HANDLE;
        return false;
    }
    VkDescriptorSetAllocateInfo allocateInfo{};
    allocateInfo.sType = VK_STRUCTURE_TYPE_DESCRIPTOR_SET_ALLOCATE_INFO;
    allocateInfo.descriptorPool = externalDescriptorPool_;
    allocateInfo.descriptorSetCount = 1;
    allocateInfo.pSetLayouts = &externalDescriptorSetLayout_;
    if (vkAllocateDescriptorSets(device_, &allocateInfo, &externalDescriptorSet_) != VK_SUCCESS) {
        vkDestroyDescriptorPool(device_, externalDescriptorPool_, nullptr);
        externalDescriptorPool_ = VK_NULL_HANDLE;
        vkDestroyDescriptorSetLayout(device_, externalDescriptorSetLayout_, nullptr);
        externalDescriptorSetLayout_ = VK_NULL_HANDLE;
        return false;
    }
    return true;
}

bool VulkanVideoSink::CreateExternalPipeline()
{
    VkShaderModule vertexShader = VK_NULL_HANDLE;
    VkShaderModule fragmentShader = VK_NULL_HANDLE;
    std::array<VkPipelineShaderStageCreateInfo, externalShaderStageCount> stages{};
    if (!LoadExternalShaderStages(vertexShader, fragmentShader, stages) || !CreateExternalPipelineLayout()) {
        DestroyShaderModules(vertexShader, fragmentShader);
        return false;
    }
    const bool created = CreateExternalGraphicsPipeline(stages);
    DestroyShaderModules(vertexShader, fragmentShader);
    if (!created) {
        vkDestroyPipelineLayout(device_, externalPipelineLayout_, nullptr);
        externalPipelineLayout_ = VK_NULL_HANDLE;
    }
    return created;
}

bool VulkanVideoSink::CreateExternalGraphicsPipeline(
    const std::array<VkPipelineShaderStageCreateInfo, externalShaderStageCount> &stages)
{
    VkVertexInputBindingDescription binding{};
    std::array<VkVertexInputAttributeDescription, externalAttributeCount> attributes{};
    VkPipelineVertexInputStateCreateInfo vertexInput{};
    ConfigureExternalVertexInput(binding, attributes, vertexInput);
    VkPipelineInputAssemblyStateCreateInfo inputAssembly{};
    inputAssembly.sType = VK_STRUCTURE_TYPE_PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO;
    inputAssembly.topology = VK_PRIMITIVE_TOPOLOGY_TRIANGLE_STRIP;
    VkPipelineViewportStateCreateInfo viewportState{};
    std::array<VkDynamicState, externalDynamicStateCount> dynamicStates{};
    VkPipelineDynamicStateCreateInfo dynamicState{};
    ConfigureExternalDynamicState(viewportState, dynamicStates, dynamicState);
    VkPipelineRasterizationStateCreateInfo rasterization{};
    rasterization.sType = VK_STRUCTURE_TYPE_PIPELINE_RASTERIZATION_STATE_CREATE_INFO;
    rasterization.polygonMode = VK_POLYGON_MODE_FILL;
    rasterization.cullMode = VK_CULL_MODE_NONE;
    rasterization.frontFace = VK_FRONT_FACE_CLOCKWISE;
    rasterization.lineWidth = 1.0F;
    VkPipelineMultisampleStateCreateInfo multisample{};
    multisample.sType = VK_STRUCTURE_TYPE_PIPELINE_MULTISAMPLE_STATE_CREATE_INFO;
    multisample.rasterizationSamples = VK_SAMPLE_COUNT_1_BIT;
    VkPipelineColorBlendAttachmentState blendAttachment{};
    blendAttachment.colorWriteMask = VK_COLOR_COMPONENT_R_BIT | VK_COLOR_COMPONENT_G_BIT |
        VK_COLOR_COMPONENT_B_BIT | VK_COLOR_COMPONENT_A_BIT;
    VkPipelineColorBlendStateCreateInfo blend{};
    blend.sType = VK_STRUCTURE_TYPE_PIPELINE_COLOR_BLEND_STATE_CREATE_INFO;
    blend.attachmentCount = 1;
    blend.pAttachments = &blendAttachment;
    VkGraphicsPipelineCreateInfo pipelineInfo{};
    pipelineInfo.sType = VK_STRUCTURE_TYPE_GRAPHICS_PIPELINE_CREATE_INFO;
    pipelineInfo.stageCount = externalShaderStageCount;
    pipelineInfo.pStages = stages.data();
    pipelineInfo.pVertexInputState = &vertexInput;
    pipelineInfo.pInputAssemblyState = &inputAssembly;
    pipelineInfo.pViewportState = &viewportState;
    pipelineInfo.pRasterizationState = &rasterization;
    pipelineInfo.pMultisampleState = &multisample;
    pipelineInfo.pColorBlendState = &blend;
    pipelineInfo.pDynamicState = &dynamicState;
    pipelineInfo.layout = externalPipelineLayout_;
    pipelineInfo.renderPass = externalRenderPass_;
    pipelineInfo.subpass = 0;
    return vkCreateGraphicsPipelines(device_, VK_NULL_HANDLE, 1, &pipelineInfo, nullptr, &externalPipeline_) ==
        VK_SUCCESS;
}

bool VulkanVideoSink::LoadExternalShaderStages(VkShaderModule &vertexShader, VkShaderModule &fragmentShader,
    std::array<VkPipelineShaderStageCreateInfo, externalShaderStageCount> &stages)
{
    if (!LoadShaderModule(VulkanVideoShaders::K_VULKAN_VERTEX_SHADER_SPV,
        VulkanVideoShaders::K_VULKAN_VERTEX_SHADER_SPV_WORD_COUNT, vertexShader) ||
        !LoadShaderModule(VulkanVideoShaders::K_VULKAN_FRAGMENT_SHADER_SPV,
            VulkanVideoShaders::K_VULKAN_FRAGMENT_SHADER_SPV_WORD_COUNT, fragmentShader)) {
        DestroyShaderModules(vertexShader, fragmentShader);
        return false;
    }
    stages[0] = { VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO, nullptr, 0, VK_SHADER_STAGE_VERTEX_BIT,
        vertexShader, "main", nullptr };
    stages[1] = { VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO, nullptr, 0, VK_SHADER_STAGE_FRAGMENT_BIT,
        fragmentShader, "main", nullptr };
    return true;
}

void VulkanVideoSink::DestroyShaderModules(VkShaderModule &vertexShader, VkShaderModule &fragmentShader)
{
    if (vertexShader != VK_NULL_HANDLE) {
        vkDestroyShaderModule(device_, vertexShader, nullptr);
        vertexShader = VK_NULL_HANDLE;
    }
    if (fragmentShader != VK_NULL_HANDLE) {
        vkDestroyShaderModule(device_, fragmentShader, nullptr);
        fragmentShader = VK_NULL_HANDLE;
    }
}

bool VulkanVideoSink::CreateExternalPipelineLayout()
{
    VkPipelineLayoutCreateInfo layoutInfo{};
    layoutInfo.sType = VK_STRUCTURE_TYPE_PIPELINE_LAYOUT_CREATE_INFO;
    layoutInfo.setLayoutCount = 1;
    layoutInfo.pSetLayouts = &externalDescriptorSetLayout_;
    return vkCreatePipelineLayout(device_, &layoutInfo, nullptr, &externalPipelineLayout_) == VK_SUCCESS;
}

void VulkanVideoSink::ConfigureExternalVertexInput(VkVertexInputBindingDescription &binding,
    std::array<VkVertexInputAttributeDescription, externalAttributeCount> &attributes,
    VkPipelineVertexInputStateCreateInfo &vertexInput) const
{
    binding.binding = 0;
    binding.stride = EXTERNAL_VERTEX_COMPONENTS * sizeof(float);
    binding.inputRate = VK_VERTEX_INPUT_RATE_VERTEX;
    attributes[0] = { 0, 0, VK_FORMAT_R32G32_SFLOAT, 0 };
    attributes[1] = { 1, 0, VK_FORMAT_R32G32_SFLOAT, EXTERNAL_TEXCOORD_COMPONENT_OFFSET * sizeof(float) };
    vertexInput.sType = VK_STRUCTURE_TYPE_PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO;
    vertexInput.vertexBindingDescriptionCount = 1;
    vertexInput.pVertexBindingDescriptions = &binding;
    vertexInput.vertexAttributeDescriptionCount = static_cast<uint32_t>(attributes.size());
    vertexInput.pVertexAttributeDescriptions = attributes.data();
}

void VulkanVideoSink::ConfigureExternalDynamicState(VkPipelineViewportStateCreateInfo &viewportState,
    std::array<VkDynamicState, externalDynamicStateCount> &dynamicStates,
    VkPipelineDynamicStateCreateInfo &dynamicState) const
{
    viewportState.sType = VK_STRUCTURE_TYPE_PIPELINE_VIEWPORT_STATE_CREATE_INFO;
    viewportState.viewportCount = 1;
    viewportState.scissorCount = 1;
    // XComponent 尺寸可变，每帧更新 viewport；清屏仍覆盖整个窗口。
    dynamicStates = { VK_DYNAMIC_STATE_VIEWPORT, VK_DYNAMIC_STATE_SCISSOR };
    dynamicState.sType = VK_STRUCTURE_TYPE_PIPELINE_DYNAMIC_STATE_CREATE_INFO;
    dynamicState.dynamicStateCount = static_cast<uint32_t>(dynamicStates.size());
    dynamicState.pDynamicStates = dynamicStates.data();
}

bool VulkanVideoSink::CreateExternalRenderResources()
{
    if (!CreateExternalRenderPass() || !CreateExternalVertexBuffer() || !CreateExternalUniformBuffer()) {
        DestroyExternalRenderResources();
        return false;
    }
    return true;
}

bool VulkanVideoSink::CreateNativeImage(int32_t width, int32_t height)
{
    nativeImage_ = OH_ConsumerSurface_Create();
    if (nativeImage_ == nullptr || OH_ConsumerSurface_SetDefaultSize(nativeImage_, width, height) != 0) {
        AVCODEC_SAMPLE_LOGW("Create Vulkan NativeImage consumer failed");
        DestroyNativeImage();
        return false;
    }
    // NativeImage 作为 Vulkan 采样端，只声明纹理读取用途；生产用途由解码器 Surface 管理。
    const uint64_t usage = NATIVEBUFFER_USAGE_HW_TEXTURE;
    if (OH_ConsumerSurface_SetDefaultUsage(nativeImage_, usage) != 0) {
        AVCODEC_SAMPLE_LOGW("Configure Vulkan NativeImage usage failed");
        DestroyNativeImage();
        return false;
    }
    OH_OnFrameAvailableListener listener {};
    listener.context = this;
    listener.onFrameAvailable = &VulkanVideoSink::OnNativeImageFrameAvailable;
    if (OH_NativeImage_SetOnFrameAvailableListener(nativeImage_, listener) != 0) {
        AVCODEC_SAMPLE_LOGW("Set Vulkan NativeImage listener failed");
        DestroyNativeImage();
        return false;
    }
    decoderWindow_ = OH_NativeImage_AcquireNativeWindow(nativeImage_);
    if (decoderWindow_ == nullptr) {
        AVCODEC_SAMPLE_LOGW("Acquire Vulkan NativeImage producer window failed");
        DestroyNativeImage();
        return false;
    }
    availableFrameCount_.store(0);
    return true;
}

void VulkanVideoSink::DestroyNativeImage()
{
    if (nativeImage_ != nullptr) {
        (void)OH_NativeImage_UnsetOnFrameAvailableListener(nativeImage_);
    }
    ReleaseCurrentNativeBuffer();
    if (nativeImage_ != nullptr) {
        OH_NativeImage_Destroy(&nativeImage_);
    }
    decoderWindow_ = nullptr;
    availableFrameCount_.store(0);
    nativeImageCondition_.notify_all();
}

void VulkanVideoSink::OnNativeImageFrameAvailable(void *context)
{
    auto *sink = static_cast<VulkanVideoSink *>(context);
    if (sink == nullptr) {
        return;
    }
    sink->availableFrameCount_.fetch_add(1);
    sink->nativeImageCondition_.notify_one();
}

bool VulkanVideoSink::WaitForNativeImageFrame()
{
    const auto startedAt = std::chrono::steady_clock::now();
    bool available = false;
    if (availableFrameCount_.load() > 0) {
        available = true;
    } else {
        std::unique_lock<std::mutex> lock(nativeImageMutex_);
        nativeImageCondition_.wait_for(lock, std::chrono::nanoseconds(NATIVE_IMAGE_WAIT_NS), [this]() {
            return availableFrameCount_.load() > 0 || nativeImage_ == nullptr;
        });
        available = availableFrameCount_.load() > 0;
    }
    RecordVulkanStage(VulkanDiagnosticStage::NATIVE_IMAGE_WAIT,
        static_cast<uint64_t>(std::chrono::duration_cast<std::chrono::nanoseconds>(
            std::chrono::steady_clock::now() - startedAt).count()));
    return available;
}

bool VulkanVideoSink::AcquireNativeImageBuffer()
{
    const auto startedAt = std::chrono::steady_clock::now();
    if (nativeImage_ == nullptr) {
        RecordNativeImageAcquireDuration(startedAt);
        return false;
    }
    OHNativeWindowBuffer *buffer = nullptr;
    int fenceFd = -1;
    // Vulkan 消费速度低于解码速度时只取最新帧，主动丢弃过期帧，避免 NativeImage 队列积压。
    // 用 exchange 清除已观察到的通知；如果回调在 AcquireLatest 调用期间到达，
    // 新通知会保留下来，下一次送显仍会继续消费，不会因为竞态漏掉唤醒。
    (void)availableFrameCount_.exchange(0);
    const int32_t ret = OH_NativeImage_AcquireLatestNativeWindowBuffer(nativeImage_, &buffer, &fenceFd);
    if (ret != 0 || buffer == nullptr) {
        if (fenceFd >= 0) {
            OH_NativeFence_Close(fenceFd);
        }
        RecordNativeImageAcquireDuration(startedAt);
        return false;
    }
    // 解码器可能在 GPU 生产完成前就触发帧回调。导入外部内存前必须等待 acquire fence，
    // 否则 Vulkan 采样到的是未完成的 YUV buffer，表现为绿边、花屏或偶发卡住。
    if (!WaitForAcquireFence(buffer, fenceFd)) {
        RecordNativeImageAcquireDuration(startedAt);
        return false;
    }
    if (OH_NativeWindow_NativeObjectReference(buffer) != 0) {
        (void)OH_NativeImage_ReleaseNativeWindowBuffer(nativeImage_, buffer, -1);
        RecordNativeImageAcquireDuration(startedAt);
        return false;
    }
    currentNativeWindowBuffer_ = buffer;
    if (OH_NativeBuffer_FromNativeWindowBuffer(buffer, &currentNativeBuffer_) != 0 ||
        currentNativeBuffer_ == nullptr) {
        ReleaseCurrentNativeBuffer();
        RecordNativeImageAcquireDuration(startedAt);
        return false;
    }
    RecordNativeImageAcquireDuration(startedAt);
    return true;
}

bool VulkanVideoSink::WaitForAcquireFence(OHNativeWindowBuffer *buffer, int &fenceFd)
{
    if (fenceFd < 0) {
        return true;
    }
    // 不在解码输出线程上无限等待生产者 fence。超时帧交回队列时携带原 fence，
    // 由 NativeImage 在生产完成后再复用槽位，避免 fence 异常时把播放器卡死。
    const auto startedAt = std::chrono::steady_clock::now();
    const bool fenceSignaled = OH_NativeFence_Wait(fenceFd, NATIVE_BUFFER_FENCE_WAIT_MS);
    const auto durationNs = static_cast<uint64_t>(std::chrono::duration_cast<std::chrono::nanoseconds>(
        std::chrono::steady_clock::now() - startedAt).count());
    RecordVulkanStage(VulkanDiagnosticStage::ACQUIRE_FENCE_WAIT, durationNs);
    if (!fenceSignaled) {
        (void)OH_NativeImage_ReleaseNativeWindowBuffer(nativeImage_, buffer, fenceFd);
        fenceFd = -1;
        return false;
    }
    OH_NativeFence_Close(fenceFd);
    fenceFd = -1;
    return true;
}

void VulkanVideoSink::RecordNativeImageAcquireDuration(std::chrono::steady_clock::time_point startedAt)
{
    const auto durationNs = std::chrono::duration_cast<std::chrono::nanoseconds>(
        std::chrono::steady_clock::now() - startedAt).count();
    RecordVulkanStage(VulkanDiagnosticStage::NATIVE_IMAGE_ACQUIRE, static_cast<uint64_t>(durationNs));
}

void VulkanVideoSink::ReleaseCurrentNativeBuffer()
{
    if (activeExternalBufferCacheIndex_ >= 0) {
        SaveActiveExternalImageState();
        externalImageView_ = VK_NULL_HANDLE;
        externalImage_ = VK_NULL_HANDLE;
        externalImageMemory_ = VK_NULL_HANDLE;
        externalImageLayout_ = VK_IMAGE_LAYOUT_UNDEFINED;
        activeExternalBufferCacheIndex_ = -1;
    } else {
        DestroyExternalImage();
    }
    if (currentNativeBuffer_ != nullptr) {
        // FromNativeWindowBuffer 返回的是当前 NativeWindowBuffer 的转换句柄，不是通过
        // OH_NativeBuffer_Alloc/Reference 获得的独立引用。它只在下方的窗口 Buffer 引用
        // 有效期间使用，不能在这里额外调用 Unreference，避免减少系统持有的引用计数。
        currentNativeBuffer_ = nullptr;
    }
    if (currentNativeWindowBuffer_ != nullptr) {
        // 先归还应用持有的 NativeWindowBuffer 引用，再把消费槽位交回 NativeImage。
        // 这样与 AcquireNativeWindowBuffer 的引用约定一致，避免槽位在回收时仍被应用引用。
        (void)OH_NativeWindow_NativeObjectUnreference(currentNativeWindowBuffer_);
        if (nativeImage_ != nullptr) {
            (void)OH_NativeImage_ReleaseNativeWindowBuffer(nativeImage_, currentNativeWindowBuffer_, -1);
        }
        currentNativeWindowBuffer_ = nullptr;
    }
}

bool VulkanVideoSink::ImportNativeBuffer()
{
    const auto startedAt = std::chrono::steady_clock::now();
    if (device_ == VK_NULL_HANDLE || currentNativeBuffer_ == nullptr) {
        return FailExternalBufferImport(startedAt);
    }
    OH_NativeBuffer_Config config{};
    OH_NativeBuffer_GetConfig(currentNativeBuffer_, &config);
    if (config.width <= 0 || config.height <= 0) {
        return FailExternalBufferImport(startedAt);
    }
    const uint32_t sequenceNumber = OH_NativeBuffer_GetSeqNum(currentNativeBuffer_);
    const int32_t cacheIndex = FindExternalBufferCacheEntry(sequenceNumber, config);
    if (cacheIndex >= 0) {
        ActivateExternalBufferCacheEntry(cacheIndex);
    } else if (!CreateAndCacheExternalBuffer(sequenceNumber, config)) {
        return FailExternalBufferImport(startedAt);
    }
    if (!EnsureExternalSampler() || !EnsureExternalPipelineResources()) {
        return FailExternalBufferImport(startedAt);
    }
    if (externalDescriptorImageView_ != externalImageView_) {
        UpdateExternalDescriptorSet();
        externalDescriptorImageView_ = externalImageView_;
    }
    externalResourcesReady_ = true;
    RecordVulkanStage(VulkanDiagnosticStage::IMPORT,
        static_cast<uint64_t>(std::chrono::duration_cast<std::chrono::nanoseconds>(
            std::chrono::steady_clock::now() - startedAt).count()));
    return true;
}

void VulkanVideoSink::ActivateExternalBufferCacheEntry(int32_t cacheIndex)
{
    ExternalBufferCacheEntry &entry = externalBufferCache_[static_cast<size_t>(cacheIndex)];
    activeExternalBufferCacheIndex_ = cacheIndex;
    entry.lastUse = ++externalBufferCacheUse_;
    externalImage_ = entry.image;
    externalImageMemory_ = entry.memory;
    externalImageView_ = entry.view;
    externalImageLayout_ = entry.layout;
    externalFormatProperties_ = entry.formatProperties;
    externalFormatProperties_.pNext = nullptr;
    externalFormat_ = entry.externalFormat;
    externalFormat_.pNext = nullptr;
    vulkanDiagnosticCacheHits_.fetch_add(1);
}

bool VulkanVideoSink::CreateAndCacheExternalBuffer(uint32_t sequenceNumber, const OH_NativeBuffer_Config &config)
{
    VkNativeBufferPropertiesOHOS properties{};
    if (!QueryExternalBufferProperties(properties)) {
        return false;
    }
    if (!CreateImportedExternalImage(properties, config) || !EnsureExternalSampler() ||
        !CreateExternalImageView() || !EnsureExternalPipelineResources()) {
        DestroyExternalImage();
        return false;
    }
    externalImageLayout_ = VK_IMAGE_LAYOUT_UNDEFINED;
    vulkanDiagnosticCacheMisses_.fetch_add(1);
    if (!CacheActiveExternalBuffer(sequenceNumber, config, properties)) {
        DestroyExternalImage();
        return false;
    }
    return true;
}

bool VulkanVideoSink::FailExternalBufferImport(std::chrono::steady_clock::time_point startedAt)
{
    const auto durationNs = std::chrono::duration_cast<std::chrono::nanoseconds>(
        std::chrono::steady_clock::now() - startedAt).count();
    RecordVulkanStage(VulkanDiagnosticStage::IMPORT, static_cast<uint64_t>(durationNs));
    return false;
}

int32_t VulkanVideoSink::FindExternalBufferCacheEntry(uint32_t sequenceNumber,
    const OH_NativeBuffer_Config &config) const
{
    for (size_t index = 0; index < externalBufferCache_.size(); ++index) {
        const ExternalBufferCacheEntry &entry = externalBufferCache_[index];
        if (entry.valid && entry.sequenceNumber == sequenceNumber &&
            entry.config.width == config.width && entry.config.height == config.height &&
            entry.config.format == config.format && entry.config.usage == config.usage &&
            entry.config.stride == config.stride) {
            return static_cast<int32_t>(index);
        }
    }
    return -1;
}

bool VulkanVideoSink::CacheActiveExternalBuffer(uint32_t sequenceNumber, const OH_NativeBuffer_Config &config,
    const VkNativeBufferPropertiesOHOS &properties)
{
    if (OH_NativeBuffer_Reference(currentNativeBuffer_) != 0) {
        return false;
    }
    const size_t cacheIndex = SelectExternalBufferCacheSlot();
    ExternalBufferCacheEntry replacement{};
    replacement.valid = true;
    replacement.sequenceNumber = sequenceNumber;
    replacement.lastUse = ++externalBufferCacheUse_;
    replacement.nativeBuffer = currentNativeBuffer_;
    replacement.config = config;
    replacement.properties = properties;
    replacement.properties.pNext = nullptr;
    replacement.formatProperties = externalFormatProperties_;
    replacement.formatProperties.pNext = nullptr;
    replacement.externalFormat = externalFormat_;
    replacement.externalFormat.pNext = nullptr;
    replacement.image = externalImage_;
    replacement.memory = externalImageMemory_;
    replacement.view = externalImageView_;
    replacement.layout = externalImageLayout_;
    replacement.usesYcbcrConversion = externalFormatProperties_.format == VK_FORMAT_UNDEFINED;
    EvictExternalBufferCacheEntry(cacheIndex, replacement);
    return true;
}

size_t VulkanVideoSink::SelectExternalBufferCacheSlot() const
{
    size_t cacheIndex = externalBufferCache_.size();
    for (size_t index = 0; index < externalBufferCache_.size(); ++index) {
        if (!externalBufferCache_[index].valid) {
            return index;
        }
    }
    for (size_t index = 0; index < externalBufferCache_.size(); ++index) {
        if (cacheIndex == externalBufferCache_.size() ||
            externalBufferCache_[index].lastUse < externalBufferCache_[cacheIndex].lastUse) {
            cacheIndex = index;
        }
    }
    return cacheIndex;
}

void VulkanVideoSink::EvictExternalBufferCacheEntry(size_t cacheIndex,
    const ExternalBufferCacheEntry &replacement)
{
    ExternalBufferCacheEntry &evicted = externalBufferCache_[cacheIndex];
    if (evicted.valid) {
        // 当前帧 fence 已完成。先解除描述符对旧 view 的引用，再释放被淘汰的导入资源。
        externalImage_ = replacement.image;
        externalImageMemory_ = replacement.memory;
        externalImageView_ = replacement.view;
        externalImageLayout_ = replacement.layout;
        activeExternalBufferCacheIndex_ = static_cast<int32_t>(cacheIndex);
        // 若本次尚未创建 pipeline/descriptor，延后更新；ImportNativeBuffer 会在资源就绪后补齐。
        if (externalDescriptorSet_ != VK_NULL_HANDLE) {
            UpdateExternalDescriptorSet();
            externalDescriptorImageView_ = externalImageView_;
        }
        if (evicted.view != VK_NULL_HANDLE) {
            vkDestroyImageView(device_, evicted.view, nullptr);
        }
        if (evicted.image != VK_NULL_HANDLE) {
            vkDestroyImage(device_, evicted.image, nullptr);
        }
        if (evicted.memory != VK_NULL_HANDLE) {
            vkFreeMemory(device_, evicted.memory, nullptr);
        }
        if (evicted.nativeBuffer != nullptr) {
            (void)OH_NativeBuffer_Unreference(evicted.nativeBuffer);
        }
    }
    evicted = replacement;
    activeExternalBufferCacheIndex_ = static_cast<int32_t>(cacheIndex);
}

void VulkanVideoSink::SaveActiveExternalImageState()
{
    if (activeExternalBufferCacheIndex_ < 0 ||
        static_cast<size_t>(activeExternalBufferCacheIndex_) >= externalBufferCache_.size()) {
        return;
    }
    ExternalBufferCacheEntry &entry = externalBufferCache_[static_cast<size_t>(activeExternalBufferCacheIndex_)];
    entry.image = externalImage_;
    entry.memory = externalImageMemory_;
    entry.view = externalImageView_;
    entry.layout = externalImageLayout_;
}

void VulkanVideoSink::DestroyExternalBufferCache()
{
    if (device_ != VK_NULL_HANDLE) {
        for (ExternalBufferCacheEntry &entry : externalBufferCache_) {
            if (entry.view != VK_NULL_HANDLE) {
                vkDestroyImageView(device_, entry.view, nullptr);
            }
            if (entry.image != VK_NULL_HANDLE) {
                vkDestroyImage(device_, entry.image, nullptr);
            }
            if (entry.memory != VK_NULL_HANDLE) {
                vkFreeMemory(device_, entry.memory, nullptr);
            }
            if (entry.nativeBuffer != nullptr) {
                (void)OH_NativeBuffer_Unreference(entry.nativeBuffer);
            }
            entry = {};
        }
    }
    activeExternalBufferCacheIndex_ = -1;
    externalImage_ = VK_NULL_HANDLE;
    externalImageMemory_ = VK_NULL_HANDLE;
    externalImageView_ = VK_NULL_HANDLE;
    externalImageLayout_ = VK_IMAGE_LAYOUT_UNDEFINED;
    externalDescriptorImageView_ = VK_NULL_HANDLE;
}

bool VulkanVideoSink::QueryExternalBufferProperties(VkNativeBufferPropertiesOHOS &properties)
{
    externalFormatProperties_ = {};
    externalFormatProperties_.sType = VK_STRUCTURE_TYPE_NATIVE_BUFFER_FORMAT_PROPERTIES_OHOS;
    properties = {};
    properties.sType = VK_STRUCTURE_TYPE_NATIVE_BUFFER_PROPERTIES_OHOS;
    properties.pNext = &externalFormatProperties_;
    const VkResult result = vkGetNativeBufferPropertiesOHOS(device_, currentNativeBuffer_, &properties);
    if (result != VK_SUCCESS) {
        AVCODEC_SAMPLE_LOGW("Get Vulkan NativeBuffer properties failed: %{public}d", static_cast<int32_t>(result));
        return false;
    }
    return true;
}

bool VulkanVideoSink::CreateImportedExternalImage(const VkNativeBufferPropertiesOHOS &properties,
    const OH_NativeBuffer_Config &config)
{
    externalFormat_ = {};
    externalFormat_.sType = VK_STRUCTURE_TYPE_EXTERNAL_FORMAT_OHOS;
    // VK_FORMAT_UNDEFINED 才使用 OHOS externalFormat；普通 Vulkan 格式必须传 0。
    externalFormat_.externalFormat = externalFormatProperties_.format == VK_FORMAT_UNDEFINED ?
        externalFormatProperties_.externalFormat : 0;
    VkExternalMemoryImageCreateInfo externalMemory{};
    externalMemory.sType = VK_STRUCTURE_TYPE_EXTERNAL_MEMORY_IMAGE_CREATE_INFO;
    externalMemory.pNext = &externalFormat_;
    externalMemory.handleTypes = VK_EXTERNAL_MEMORY_HANDLE_TYPE_OHOS_NATIVE_BUFFER_BIT_OHOS;
    VkImageCreateInfo imageInfo{};
    imageInfo.sType = VK_STRUCTURE_TYPE_IMAGE_CREATE_INFO;
    imageInfo.pNext = &externalMemory;
    imageInfo.imageType = VK_IMAGE_TYPE_2D;
    imageInfo.format = externalFormatProperties_.format;
    imageInfo.extent = { static_cast<uint32_t>(config.width), static_cast<uint32_t>(config.height), 1 };
    imageInfo.mipLevels = 1;
    imageInfo.arrayLayers = 1;
    imageInfo.samples = VK_SAMPLE_COUNT_1_BIT;
    imageInfo.tiling = VK_IMAGE_TILING_OPTIMAL;
    imageInfo.usage = VK_IMAGE_USAGE_SAMPLED_BIT;
    imageInfo.sharingMode = VK_SHARING_MODE_EXCLUSIVE;
    imageInfo.queueFamilyIndexCount = 1;
    imageInfo.pQueueFamilyIndices = &queueFamilyIndex_;
    imageInfo.initialLayout = VK_IMAGE_LAYOUT_UNDEFINED;
    if (vkCreateImage(device_, &imageInfo, nullptr, &externalImage_) != VK_SUCCESS) {
        AVCODEC_SAMPLE_LOGW("Create Vulkan external image failed");
        return false;
    }
    return AllocateExternalImageMemory(properties);
}

bool VulkanVideoSink::AllocateExternalImageMemory(const VkNativeBufferPropertiesOHOS &properties)
{
    VkMemoryRequirements requirements{};
    vkGetImageMemoryRequirements(device_, externalImage_, &requirements);
    const uint32_t memoryType = FindMemoryType(properties.memoryTypeBits & requirements.memoryTypeBits,
        VK_MEMORY_PROPERTY_DEVICE_LOCAL_BIT);
    if (memoryType == UINT32_MAX || properties.allocationSize < requirements.size) {
        AVCODEC_SAMPLE_LOGW("NativeBuffer Vulkan memory requirements are unsupported");
        DestroyExternalImage();
        return false;
    }
    VkImportNativeBufferInfoOHOS importInfo{};
    importInfo.sType = VK_STRUCTURE_TYPE_IMPORT_NATIVE_BUFFER_INFO_OHOS;
    importInfo.buffer = currentNativeBuffer_;
    VkMemoryDedicatedAllocateInfo dedicated{};
    dedicated.sType = VK_STRUCTURE_TYPE_MEMORY_DEDICATED_ALLOCATE_INFO;
    dedicated.pNext = &importInfo;
    dedicated.image = externalImage_;
    VkMemoryAllocateInfo allocation{};
    allocation.sType = VK_STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO;
    allocation.pNext = &dedicated;
    allocation.allocationSize = properties.allocationSize;
    allocation.memoryTypeIndex = memoryType;
    if (vkAllocateMemory(device_, &allocation, nullptr, &externalImageMemory_) != VK_SUCCESS ||
        vkBindImageMemory(device_, externalImage_, externalImageMemory_, 0) != VK_SUCCESS) {
        DestroyExternalImage();
        return false;
    }
    return true;
}

bool VulkanVideoSink::EnsureExternalSampler()
{
    if (externalSampler_ != VK_NULL_HANDLE) {
        return true;
    }
    const bool useYcbcrConversion = externalFormatProperties_.format == VK_FORMAT_UNDEFINED;
    VkSamplerYcbcrConversionCreateInfo conversionInfo{};
    conversionInfo.sType = VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_CREATE_INFO;
    conversionInfo.format = externalFormatProperties_.format;
    conversionInfo.ycbcrModel = externalFormatProperties_.suggestedYcbcrModel;
    conversionInfo.ycbcrRange = externalFormatProperties_.suggestedYcbcrRange;
    conversionInfo.components = externalFormatProperties_.samplerYcbcrConversionComponents;
    conversionInfo.xChromaOffset = externalFormatProperties_.suggestedXChromaOffset;
    conversionInfo.yChromaOffset = externalFormatProperties_.suggestedYChromaOffset;
    conversionInfo.chromaFilter = VK_FILTER_LINEAR;
    if (useYcbcrConversion) {
        conversionInfo.pNext = &externalFormat_;
        const VkResult result = vkCreateSamplerYcbcrConversion(device_, &conversionInfo, nullptr,
            &externalYcbcrConversion_);
        if (result != VK_SUCCESS) {
            return false;
        }
    }
    return CreateExternalSampler(useYcbcrConversion);
}

bool VulkanVideoSink::CreateExternalSampler(bool useYcbcrConversion)
{
    VkSamplerYcbcrConversionInfo conversionInfo{};
    conversionInfo.sType = VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_INFO;
    conversionInfo.conversion = externalYcbcrConversion_;
    VkSamplerCreateInfo samplerInfo{};
    samplerInfo.sType = VK_STRUCTURE_TYPE_SAMPLER_CREATE_INFO;
    samplerInfo.pNext = useYcbcrConversion ? &conversionInfo : nullptr;
    samplerInfo.magFilter = VK_FILTER_LINEAR;
    samplerInfo.minFilter = VK_FILTER_LINEAR;
    samplerInfo.mipmapMode = VK_SAMPLER_MIPMAP_MODE_NEAREST;
    samplerInfo.addressModeU = VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE;
    samplerInfo.addressModeV = VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE;
    samplerInfo.addressModeW = VK_SAMPLER_ADDRESS_MODE_CLAMP_TO_EDGE;
    samplerInfo.maxLod = 1.0F;
    return vkCreateSampler(device_, &samplerInfo, nullptr, &externalSampler_) == VK_SUCCESS;
}

bool VulkanVideoSink::CreateExternalImageView()
{
    const bool useYcbcrConversion = externalFormatProperties_.format == VK_FORMAT_UNDEFINED;
    VkSamplerYcbcrConversionInfo conversionInfo{};
    conversionInfo.sType = VK_STRUCTURE_TYPE_SAMPLER_YCBCR_CONVERSION_INFO;
    conversionInfo.conversion = externalYcbcrConversion_;
    VkImageViewCreateInfo viewInfo{};
    viewInfo.sType = VK_STRUCTURE_TYPE_IMAGE_VIEW_CREATE_INFO;
    viewInfo.pNext = useYcbcrConversion ? &conversionInfo : nullptr;
    viewInfo.image = externalImage_;
    viewInfo.viewType = VK_IMAGE_VIEW_TYPE_2D;
    viewInfo.format = externalFormatProperties_.format;
    viewInfo.subresourceRange.aspectMask = VK_IMAGE_ASPECT_COLOR_BIT;
    viewInfo.subresourceRange.levelCount = 1;
    viewInfo.subresourceRange.layerCount = 1;
    return vkCreateImageView(device_, &viewInfo, nullptr, &externalImageView_) == VK_SUCCESS;
}

bool VulkanVideoSink::EnsureExternalPipelineResources()
{
    if (externalResourcesReady_) {
        return true;
    }
    if (!CreateExternalDescriptorResources() || !CreateExternalPipeline()) {
        DestroyExternalPipelineResources();
        return false;
    }
    return true;
}

void VulkanVideoSink::UpdateExternalDescriptorSet()
{
    VkDescriptorBufferInfo uniformInfo{};
    uniformInfo.buffer = externalUniformBuffer_;
    uniformInfo.range = sizeof(float) * externalTransform_.size();
    VkDescriptorImageInfo imageInfo{};
    imageInfo.sampler = externalSampler_;
    imageInfo.imageView = externalImageView_;
    imageInfo.imageLayout = VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;
    std::array<VkWriteDescriptorSet, EXTERNAL_DESCRIPTOR_COUNT> writes{};
    writes[0].sType = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
    writes[0].dstSet = externalDescriptorSet_;
    writes[0].dstBinding = 0;
    writes[0].descriptorCount = 1;
    writes[0].descriptorType = VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER;
    writes[0].pBufferInfo = &uniformInfo;
    writes[1].sType = VK_STRUCTURE_TYPE_WRITE_DESCRIPTOR_SET;
    writes[1].dstSet = externalDescriptorSet_;
    writes[1].dstBinding = 1;
    writes[1].descriptorCount = 1;
    writes[1].descriptorType = VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER;
    writes[1].pImageInfo = &imageInfo;
    vkUpdateDescriptorSets(device_, static_cast<uint32_t>(writes.size()), writes.data(), 0, nullptr);
}

void VulkanVideoSink::DestroyExternalImage()
{
    if (device_ == VK_NULL_HANDLE) {
        externalImage_ = VK_NULL_HANDLE;
        externalImageMemory_ = VK_NULL_HANDLE;
        externalImageView_ = VK_NULL_HANDLE;
        externalSampler_ = VK_NULL_HANDLE;
        externalYcbcrConversion_ = VK_NULL_HANDLE;
        return;
    }
    if (externalImageView_ != VK_NULL_HANDLE) {
        vkDestroyImageView(device_, externalImageView_, nullptr);
        externalImageView_ = VK_NULL_HANDLE;
    }
    if (externalImage_ != VK_NULL_HANDLE) {
        vkDestroyImage(device_, externalImage_, nullptr);
        externalImage_ = VK_NULL_HANDLE;
    }
    if (externalImageMemory_ != VK_NULL_HANDLE) {
        vkFreeMemory(device_, externalImageMemory_, nullptr);
        externalImageMemory_ = VK_NULL_HANDLE;
    }
    externalImageLayout_ = VK_IMAGE_LAYOUT_UNDEFINED;
    // Sampler 和 YCbCr 转换由播放会话复用，直到描述符布局销毁时再释放。
}

void VulkanVideoSink::DestroyExternalRenderResources()
{
    if (device_ == VK_NULL_HANDLE) {
        return;
    }
    (void)vkDeviceWaitIdle(device_);
    ReleaseCurrentNativeBuffer();
    DestroyExternalBufferCache();
    DestroyExternalPipelineResources();
    DestroyExternalGeometryResources();
    DestroyExternalFramebuffers();
    if (externalRenderPass_ != VK_NULL_HANDLE) {
        vkDestroyRenderPass(device_, externalRenderPass_, nullptr);
        externalRenderPass_ = VK_NULL_HANDLE;
    }
    externalDescriptorSet_ = VK_NULL_HANDLE;
    externalResourcesReady_ = false;
}

void VulkanVideoSink::DestroyExternalPipelineResources()
{
    if (externalPipeline_ != VK_NULL_HANDLE) {
        vkDestroyPipeline(device_, externalPipeline_, nullptr);
        externalPipeline_ = VK_NULL_HANDLE;
    }
    if (externalPipelineLayout_ != VK_NULL_HANDLE) {
        vkDestroyPipelineLayout(device_, externalPipelineLayout_, nullptr);
        externalPipelineLayout_ = VK_NULL_HANDLE;
    }
    if (externalDescriptorPool_ != VK_NULL_HANDLE) {
        vkDestroyDescriptorPool(device_, externalDescriptorPool_, nullptr);
        externalDescriptorPool_ = VK_NULL_HANDLE;
    }
    if (externalDescriptorSetLayout_ != VK_NULL_HANDLE) {
        vkDestroyDescriptorSetLayout(device_, externalDescriptorSetLayout_, nullptr);
        externalDescriptorSetLayout_ = VK_NULL_HANDLE;
    }
    DestroyExternalSamplerResources();
}

void VulkanVideoSink::DestroyExternalSamplerResources()
{
    if (externalSampler_ != VK_NULL_HANDLE) {
        vkDestroySampler(device_, externalSampler_, nullptr);
        externalSampler_ = VK_NULL_HANDLE;
    }
    if (externalYcbcrConversion_ != VK_NULL_HANDLE) {
        vkDestroySamplerYcbcrConversion(device_, externalYcbcrConversion_, nullptr);
        externalYcbcrConversion_ = VK_NULL_HANDLE;
    }
}

void VulkanVideoSink::DestroyExternalGeometryResources()
{
    if (externalUniformMapped_ != nullptr) {
        vkUnmapMemory(device_, externalUniformMemory_);
        externalUniformMapped_ = nullptr;
    }
    DestroyExternalUniformBuffer();
    DestroyExternalVertexBuffer();
}

void VulkanVideoSink::DestroyExternalUniformBuffer()
{
    if (externalUniformBuffer_ != VK_NULL_HANDLE) {
        vkDestroyBuffer(device_, externalUniformBuffer_, nullptr);
        externalUniformBuffer_ = VK_NULL_HANDLE;
    }
    if (externalUniformMemory_ != VK_NULL_HANDLE) {
        vkFreeMemory(device_, externalUniformMemory_, nullptr);
        externalUniformMemory_ = VK_NULL_HANDLE;
    }
}

void VulkanVideoSink::DestroyExternalVertexBuffer()
{
    if (externalVertexBuffer_ != VK_NULL_HANDLE) {
        vkDestroyBuffer(device_, externalVertexBuffer_, nullptr);
        externalVertexBuffer_ = VK_NULL_HANDLE;
    }
    if (externalVertexMemory_ != VK_NULL_HANDLE) {
        vkFreeMemory(device_, externalVertexMemory_, nullptr);
        externalVertexMemory_ = VK_NULL_HANDLE;
    }
}

void VulkanVideoSink::DestroyExternalFramebuffers()
{
    for (VkFramebuffer framebuffer : externalFramebuffers_) {
        vkDestroyFramebuffer(device_, framebuffer, nullptr);
    }
    externalFramebuffers_.clear();
    for (VkImageView view : externalFrameBufferViews_) {
        vkDestroyImageView(device_, view, nullptr);
    }
    externalFrameBufferViews_.clear();
}

bool VulkanVideoSink::SubmitExternalFrame(uint32_t imageIndex)
{
    if (imageIndex >= renderFinishedSemaphores_.size()) {
        return false;
    }
    if (vkResetFences(device_, 1, &frameFence_) != VK_SUCCESS) {
        return false;
    }
    constexpr VkPipelineStageFlags waitStage = VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT;
    VkSubmitInfo submit{};
    submit.sType = VK_STRUCTURE_TYPE_SUBMIT_INFO;
    submit.waitSemaphoreCount = 1;
    submit.pWaitSemaphores = &imageAvailable_;
    submit.pWaitDstStageMask = &waitStage;
    submit.commandBufferCount = 1;
    submit.pCommandBuffers = &commandBuffer_;
    submit.signalSemaphoreCount = 1;
    submit.pSignalSemaphores = &renderFinishedSemaphores_[imageIndex];
    if (vkQueueSubmit(queue_, 1, &submit, frameFence_) != VK_SUCCESS) {
        frameInFlight_ = false;
        swapchainRecreatePending_ = true;
        return false;
    }
    frameInFlight_ = true;
    VkPresentInfoKHR present{};
    present.sType = VK_STRUCTURE_TYPE_PRESENT_INFO_KHR;
    present.waitSemaphoreCount = 1;
    present.pWaitSemaphores = &renderFinishedSemaphores_[imageIndex];
    present.swapchainCount = 1;
    present.pSwapchains = &swapchain_;
    present.pImageIndices = &imageIndex;
    const VkResult result = vkQueuePresentKHR(queue_, &present);
    // SUBOPTIMAL 仍表示当前图像已经成功送显，不需要每帧重建 swapchain；只有
    // OUT_OF_DATE 才必须等待下一帧执行重建，否则高帧率视频会反复销毁并创建渲染资源。
    if (result == VK_ERROR_OUT_OF_DATE_KHR) {
        swapchainRecreatePending_ = true;
    }
    if (result != VK_SUCCESS && result != VK_SUBOPTIMAL_KHR) {
        swapchainRecreatePending_ = true;
    }
    return result == VK_SUCCESS || result == VK_SUBOPTIMAL_KHR || result == VK_ERROR_OUT_OF_DATE_KHR;
}

bool VulkanVideoSink::RenderNativeImageFrame()
{
    if (!WaitForPreviousExternalFrame()) {
        return false;
    }
    ReleaseCurrentNativeBuffer();
    auto windowLease = NativeXComponentSample::PluginManager::GetInstance()->AcquirePluginWindow();
    if (!windowLease) {
        AVCODEC_SAMPLE_LOGW("Vulkan XComponent NativeWindow is unavailable");
        return true;
    }
    if (!RefreshSurfaceForRendering(windowLease)) {
        return false;
    }
    PresentRegion region{};
    if (!AcquireAndPrepareNativeFrame(region)) {
        return true;
    }
    uint32_t imageIndex = 0;
    const VkResult acquire = vkAcquireNextImageKHR(device_, swapchain_, IMAGE_ACQUIRE_WAIT_NS, imageAvailable_,
        VK_NULL_HANDLE, &imageIndex);
    if (!ValidateAcquiredExternalImage(acquire, imageIndex)) {
        ReleaseCurrentNativeBuffer();
        return IsRecoverableAcquireResult(acquire);
    }
    return RecordAndSubmitNativeFrame(imageIndex, region);
}

bool VulkanVideoSink::WaitForPreviousExternalFrame()
{
    const auto startedAt = std::chrono::steady_clock::now();
    if (!frameInFlight_ || frameFence_ == VK_NULL_HANDLE) {
        return true;
    }
    const VkResult result = vkWaitForFences(device_, 1, &frameFence_, VK_TRUE, FRAME_READY_WAIT_NS);
    if (result == VK_TIMEOUT) {
        // GPU 仍在读取该 Buffer，暂不归还；下一次送显继续等待，避免阻塞回调线程。
        RecordVulkanStage(VulkanDiagnosticStage::GPU_WAIT,
            static_cast<uint64_t>(std::chrono::duration_cast<std::chrono::nanoseconds>(
                std::chrono::steady_clock::now() - startedAt).count()));
        return false;
    }
    if (result != VK_SUCCESS) {
        AVCODEC_SAMPLE_LOGW("Wait previous Vulkan Surface frame failed, ret: %{public}d",
            static_cast<int32_t>(result));
        RecordVulkanStage(VulkanDiagnosticStage::GPU_WAIT,
            static_cast<uint64_t>(std::chrono::duration_cast<std::chrono::nanoseconds>(
                std::chrono::steady_clock::now() - startedAt).count()));
        return false;
    }
    frameInFlight_ = false;
    RecordVulkanStage(VulkanDiagnosticStage::GPU_WAIT,
        static_cast<uint64_t>(std::chrono::duration_cast<std::chrono::nanoseconds>(
            std::chrono::steady_clock::now() - startedAt).count()));
    return true;
}

bool VulkanVideoSink::RefreshSurfaceForRendering(
    NativeXComponentSample::PluginManager::PluginWindowLease &windowLease)
{
    const bool windowChanged = windowLease.GetWindow() != window_;
    if (windowChanged && !RebuildPresentationSurface(windowLease)) {
        return false;
    }
    if (!windowLease_ || windowLease_.GetWindow() != window_) {
        AVCODEC_SAMPLE_LOGW("Vulkan window lease is unavailable after surface rebuild");
        return false;
    }
    const auto &activeLease = windowChanged ? windowLease_ : windowLease;
    int32_t surfaceWidth = activeLease.GetWidth();
    int32_t surfaceHeight = activeLease.GetHeight();
    if (surfaceWidth <= 0 || surfaceHeight <= 0) {
        surfaceWidth = width_;
        surfaceHeight = height_;
    }
    if (width_ == surfaceWidth && height_ == surfaceHeight && !swapchainRecreatePending_) {
        return true;
    }
    return RebuildSwapchainForWindow(windowLease, windowChanged, surfaceWidth, surfaceHeight,
        activeLease.GetGeneration());
}

bool VulkanVideoSink::RebuildPresentationSurface(
    NativeXComponentSample::PluginManager::PluginWindowLease &windowLease)
{
    AVCODEC_SAMPLE_LOGI("Vulkan XComponent NativeWindow changed, rebuild presentation surface");
    if (device_ != VK_NULL_HANDLE) {
        (void)vkDeviceWaitIdle(device_);
    }
    DestroyExternalRenderResources();
    ReleaseUploadImage();
    DestroySwapchain();
    DestroyFrameResources();
    if (instance_ != VK_NULL_HANDLE && surface_ != VK_NULL_HANDLE) {
        vkDestroySurfaceKHR(instance_, surface_, nullptr);
        surface_ = VK_NULL_HANDLE;
    }
    window_ = windowLease.GetWindow();
    if (!CreateSurface(window_) || !CreateSwapchain(windowLease.GetWidth(), windowLease.GetHeight()) ||
        !CreateCommandResources() || !CreateExternalRenderResources()) {
        AVCODEC_SAMPLE_LOGW("Rebuild Vulkan presentation surface failed");
        return false;
    }
    windowLease_ = std::move(windowLease);
    windowGeneration_ = windowLease_.GetGeneration();
    width_ = windowLease_.GetWidth();
    height_ = windowLease_.GetHeight();
    swapchainRecreatePending_ = false;
    return true;
}

bool VulkanVideoSink::RebuildSwapchainForWindow(
    NativeXComponentSample::PluginManager::PluginWindowLease &windowLease, bool windowChanged,
    int32_t width, int32_t height, uint64_t generation)
{
    if (!ConfigureWindowForGpu(window_, width, height, hdrSwapchainActive_) || !RecreateSwapchain(width, height)) {
        AVCODEC_SAMPLE_LOGW("Recreate Vulkan Surface swapchain failed");
        return false;
    }
    if (!windowChanged) {
        windowLease_ = std::move(windowLease);
    }
    windowGeneration_ = generation;
    width_ = width;
    height_ = height;
    swapchainRecreatePending_ = false;
    return true;
}

bool VulkanVideoSink::AcquireAndPrepareNativeFrame(PresentRegion &region)
{
    if (!WaitForNativeImageFrame() || !AcquireNativeImageBuffer()) {
        AVCODEC_SAMPLE_LOGW("No Vulkan NativeImage frame available");
        return false;
    }
    if (!ImportNativeBuffer()) {
        ReleaseCurrentNativeBuffer();
        return false;
    }
    SyncNativeFrameMetadata();
    if (!UpdateExternalTransform() || !CalculateExternalPresentRegion(region)) {
        ReleaseCurrentNativeBuffer();
        return false;
    }
    return true;
}

void VulkanVideoSink::SyncNativeFrameMetadata()
{
    // 以 NativeImage 实际取得的解码 Buffer 为准，不把容器标记当作 HDR 实测结果。
    const bool synced = !preferHdrSwapchain_ ||
        HdrMetadataHelper::SetNativeWindowMetadataFromBuffer(window_, currentNativeBuffer_);
    if (HdrMetadataHelper::IsHdrVividNativeBuffer(currentNativeBuffer_)) {
        hdrVividConfirmed_ = true;
    }
    if (preferHdrSwapchain_ && !synced && !outputMetadataInitialized_ && !metadataWarningLogged_) {
        AVCODEC_SAMPLE_LOGW("Sync Vulkan NativeImage color metadata to window failed");
        metadataWarningLogged_ = true;
    }
    outputMetadataInitialized_ = outputMetadataInitialized_ || synced;
}

bool VulkanVideoSink::ValidateAcquiredExternalImage(VkResult acquire, uint32_t imageIndex)
{
    if ((acquire == VK_SUCCESS || acquire == VK_SUBOPTIMAL_KHR) && imageIndex < externalFramebuffers_.size()) {
        return true;
    }
    if (acquire == VK_ERROR_OUT_OF_DATE_KHR || acquire == VK_ERROR_SURFACE_LOST_KHR ||
        acquire == VK_ERROR_DEVICE_LOST) {
        swapchainRecreatePending_ = true;
    }
    return false;
}

bool VulkanVideoSink::IsRecoverableAcquireResult(VkResult acquire) const
{
    return acquire == VK_TIMEOUT || acquire == VK_NOT_READY || acquire == VK_ERROR_OUT_OF_DATE_KHR;
}

bool VulkanVideoSink::RecordAndSubmitNativeFrame(uint32_t imageIndex, const PresentRegion &region)
{
    const auto commandStartedAt = std::chrono::steady_clock::now();
    if (!BeginNativeFrameCommands()) {
        swapchainRecreatePending_ = true;
        ReleaseCurrentNativeBuffer();
        return false;
    }
    RecordNativeImageDraw(imageIndex, region);
    RecordVulkanStage(VulkanDiagnosticStage::COMMAND_RECORD,
        static_cast<uint64_t>(std::chrono::duration_cast<std::chrono::nanoseconds>(
            std::chrono::steady_clock::now() - commandStartedAt).count()));
    const auto submitStartedAt = std::chrono::steady_clock::now();
    if (vkEndCommandBuffer(commandBuffer_) == VK_SUCCESS && SubmitExternalFrame(imageIndex)) {
        externalImageLayout_ = VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL;
        RecordVulkanStage(VulkanDiagnosticStage::SUBMIT,
            static_cast<uint64_t>(std::chrono::duration_cast<std::chrono::nanoseconds>(
                std::chrono::steady_clock::now() - submitStartedAt).count()));
        return true;
    }
    RecordVulkanStage(VulkanDiagnosticStage::SUBMIT,
        static_cast<uint64_t>(std::chrono::duration_cast<std::chrono::nanoseconds>(
            std::chrono::steady_clock::now() - submitStartedAt).count()));
    swapchainRecreatePending_ = true;
    // 若提交已经进入 GPU 队列，必须等 fence 完成后再归还 NativeImage Buffer。
    if (!frameInFlight_) {
        ReleaseCurrentNativeBuffer();
    }
    return false;
}

bool VulkanVideoSink::BeginNativeFrameCommands()
{
    if (vkResetCommandBuffer(commandBuffer_, 0) != VK_SUCCESS) {
        return false;
    }
    VkCommandBufferBeginInfo beginInfo{};
    beginInfo.sType = VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO;
    return vkBeginCommandBuffer(commandBuffer_, &beginInfo) == VK_SUCCESS;
}

void VulkanVideoSink::RecordNativeImageDraw(uint32_t imageIndex, const PresentRegion &region)
{
    TransitionImage(commandBuffer_, { externalImage_, externalImageLayout_,
        VK_IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL, 0, VK_ACCESS_SHADER_READ_BIT,
        VK_PIPELINE_STAGE_TOP_OF_PIPE_BIT, VK_PIPELINE_STAGE_FRAGMENT_SHADER_BIT });
    VkClearValue clearValue{};
    clearValue.color.float32[COLOR_ALPHA_COMPONENT_INDEX] = OPAQUE_ALPHA_VALUE;
    VkRenderPassBeginInfo renderPassInfo{};
    renderPassInfo.sType = VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO;
    renderPassInfo.renderPass = externalRenderPass_;
    renderPassInfo.framebuffer = externalFramebuffers_[imageIndex];
    renderPassInfo.renderArea.extent = swapchainExtent_;
    renderPassInfo.clearValueCount = 1;
    renderPassInfo.pClearValues = &clearValue;
    vkCmdBeginRenderPass(commandBuffer_, &renderPassInfo, VK_SUBPASS_CONTENTS_INLINE);
    vkCmdBindPipeline(commandBuffer_, VK_PIPELINE_BIND_POINT_GRAPHICS, externalPipeline_);
    const VkViewport viewport{ static_cast<float>(region.left), static_cast<float>(region.top),
        static_cast<float>(region.width), static_cast<float>(region.height), 0.0F, 1.0F };
    VkRect2D scissor{};
    scissor.extent = swapchainExtent_;
    vkCmdSetViewport(commandBuffer_, 0, 1, &viewport);
    vkCmdSetScissor(commandBuffer_, 0, 1, &scissor);
    constexpr VkDeviceSize vertexOffset = 0;
    vkCmdBindVertexBuffers(commandBuffer_, 0, 1, &externalVertexBuffer_, &vertexOffset);
    vkCmdBindDescriptorSets(commandBuffer_, VK_PIPELINE_BIND_POINT_GRAPHICS, externalPipelineLayout_, 0, 1,
        &externalDescriptorSet_, 0, nullptr);
    vkCmdDraw(commandBuffer_, EXTERNAL_VERTEX_COUNT, 1, 0, 0);
    vkCmdEndRenderPass(commandBuffer_);
}
