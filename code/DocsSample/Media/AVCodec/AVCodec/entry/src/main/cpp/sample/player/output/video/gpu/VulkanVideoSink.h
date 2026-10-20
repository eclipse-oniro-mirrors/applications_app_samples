/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#ifndef AVCODEC_SAMPLE_VULKAN_VIDEO_SINK_H
#define AVCODEC_SAMPLE_VULKAN_VIDEO_SINK_H

#ifndef VK_USE_PLATFORM_OHOS
#define VK_USE_PLATFORM_OHOS 1
#endif
#include <chrono>
#include <cstdint>
#include <vulkan/vulkan.h>
#include <native_buffer/native_buffer.h>
#include <native_image/native_image.h>
#include <array>
#include <atomic>
#include <condition_variable>
#include <mutex>
#include <vector>

#include "../sink/BufferVideoSink.h"
#include "VideoPresentationGeometry.h"
#include "plugin_manager.h"

class VulkanVideoSink final : public VideoSink {
public:
    VulkanVideoSink() = default;
    ~VulkanVideoSink() override;

    int32_t Present(const VideoPresentRequest &request) override;
    void BeginPlayback() override;
    bool Quiesce() override;
    void DiscardPendingFrames() override;
    OHNativeWindow *PrepareForPlayback(const SampleInfo &sampleInfo) override;
    bool UsesSurfaceDecoder() const override
    {
        return surfaceDecoderReady_;
    }
    bool IsHdrVividConfirmed() const override
    {
        return hdrVividConfirmed_;
    }
    VideoSinkDiagnostics GetDiagnostics() const override;
    void Reset() override;

private:
    struct ExternalBufferCacheEntry;
    static constexpr size_t externalBufferCacheCapacity = 4;
    enum class VulkanDiagnosticStage {
        NATIVE_IMAGE_WAIT,
        NATIVE_IMAGE_ACQUIRE,
        ACQUIRE_FENCE_WAIT,
        IMPORT,
        GPU_WAIT,
        COMMAND_RECORD,
        SUBMIT
    };
    static constexpr uint32_t externalShaderStageCount = 2;
    static constexpr uint32_t externalAttributeCount = 2;
    static constexpr uint32_t externalDynamicStateCount = 2;

    struct UploadFrame {
        const std::vector<uint8_t> *data = nullptr;
        int32_t width = 0;
        int32_t height = 0;
    };

    struct PresentRegion {
        int32_t left = 0;
        int32_t top = 0;
        int32_t width = 0;
        int32_t height = 0;
    };

    bool EnsureContext(NativeXComponentSample::PluginManager::PluginWindowLease &&windowLease);
    bool Initialize(OHNativeWindow *window, int32_t width, int32_t height);
    bool CreateInstance();
    bool CreateSurface(OHNativeWindow *window);
    bool SelectDevice();
    bool IsDeviceSuitable(VkPhysicalDevice device, uint32_t &queueFamilyIndex) const;
    bool CreateDevice();
    bool CreateSwapchain(int32_t width, int32_t height);
    static bool ConfigureWindowForGpu(OHNativeWindow *window, int32_t width, int32_t height, bool hdrOutput);
    bool ConfigureWindowForSwapchain(int32_t width, int32_t height);
    bool QuerySwapchainCapabilities(VkSurfaceCapabilitiesKHR &capabilities) const;
    bool ValidateSwapchainUsage(const VkSurfaceCapabilitiesKHR &capabilities, VkImageUsageFlags requiredUsage) const;
    bool ConfigureSwapchainWindowColor(int32_t width, int32_t height);
    bool SelectSwapchainFormat(VkSurfaceFormatKHR &format);
    bool ConfigureSelectedSwapchainFormat(const VkSurfaceCapabilitiesKHR &capabilities,
        const VkSurfaceFormatKHR &surfaceFormat, int32_t width, int32_t height);
    bool CreateConfiguredSwapchain(const VkSurfaceCapabilitiesKHR &capabilities,
        const VkSurfaceFormatKHR &surfaceFormat);
    VkExtent2D ResolveSwapchainExtent(const VkSurfaceCapabilitiesKHR &capabilities, int32_t width,
        int32_t height) const;
    VkCompositeAlphaFlagBitsKHR SelectCompositeAlpha(const VkSurfaceCapabilitiesKHR &capabilities) const;
    VkPresentModeKHR SelectPresentMode() const;
    bool LoadSwapchainImages();
    bool RecreateSwapchain(int32_t width, int32_t height);
    bool CreateCommandResources();
    bool CreateExternalRenderResources();
    bool CreateExternalRenderPass();
    bool CreateExternalFramebuffers();
    bool CreateExternalPipeline();
    bool CreateExternalGraphicsPipeline(
        const std::array<VkPipelineShaderStageCreateInfo, externalShaderStageCount> &stages);
    bool LoadExternalShaderStages(VkShaderModule &vertexShader, VkShaderModule &fragmentShader,
        std::array<VkPipelineShaderStageCreateInfo, externalShaderStageCount> &stages);
    bool CreateExternalPipelineLayout();
    void DestroyShaderModules(VkShaderModule &vertexShader, VkShaderModule &fragmentShader);
    void ConfigureExternalVertexInput(VkVertexInputBindingDescription &binding,
        std::array<VkVertexInputAttributeDescription, externalAttributeCount> &attributes,
        VkPipelineVertexInputStateCreateInfo &vertexInput) const;
    void ConfigureExternalDynamicState(VkPipelineViewportStateCreateInfo &viewportState,
        std::array<VkDynamicState, externalDynamicStateCount> &dynamicStates,
        VkPipelineDynamicStateCreateInfo &dynamicState) const;
    bool CreateExternalVertexBuffer();
    bool CreateExternalUniformBuffer();
    bool CreateExternalDescriptorResources();
    bool LoadShaderModule(const uint32_t *code, size_t wordCount, VkShaderModule &module);
    bool CreateNativeImage(int32_t width, int32_t height);
    void DestroyNativeImage();
    static void OnNativeImageFrameAvailable(void *context);
    bool WaitForNativeImageFrame();
    bool RenderNativeImageFrame();
    bool RefreshSurfaceForRendering(NativeXComponentSample::PluginManager::PluginWindowLease &windowLease);
    bool WaitForPreviousExternalFrame();
    bool RebuildPresentationSurface(NativeXComponentSample::PluginManager::PluginWindowLease &windowLease);
    bool RebuildSwapchainForWindow(NativeXComponentSample::PluginManager::PluginWindowLease &windowLease,
        bool windowChanged, int32_t width, int32_t height, uint64_t generation);
    bool AcquireAndPrepareNativeFrame(PresentRegion &region);
    void SyncNativeFrameMetadata();
    bool ValidateAcquiredExternalImage(VkResult acquire, uint32_t imageIndex);
    bool IsRecoverableAcquireResult(VkResult acquire) const;
    bool RecordAndSubmitNativeFrame(uint32_t imageIndex, const PresentRegion &region);
    bool BeginNativeFrameCommands();
    void RecordNativeImageDraw(uint32_t imageIndex, const PresentRegion &region);
    bool UpdateExternalTransform();
    bool AcquireNativeImageBuffer();
    bool WaitForAcquireFence(OHNativeWindowBuffer *buffer, int &fenceFd);
    void RecordNativeImageAcquireDuration(std::chrono::steady_clock::time_point startedAt);
    bool ImportNativeBuffer();
    bool CreateAndCacheExternalBuffer(uint32_t sequenceNumber, const OH_NativeBuffer_Config &config);
    void ActivateExternalBufferCacheEntry(int32_t cacheIndex);
    bool FailExternalBufferImport(std::chrono::steady_clock::time_point startedAt);
    void DestroyExternalBufferCache();
    int32_t FindExternalBufferCacheEntry(uint32_t sequenceNumber, const OH_NativeBuffer_Config &config) const;
    bool CacheActiveExternalBuffer(uint32_t sequenceNumber, const OH_NativeBuffer_Config &config,
        const VkNativeBufferPropertiesOHOS &properties);
    size_t SelectExternalBufferCacheSlot() const;
    void EvictExternalBufferCacheEntry(size_t cacheIndex, const ExternalBufferCacheEntry &replacement);
    void SaveActiveExternalImageState();
    void RecordVulkanStage(VulkanDiagnosticStage stage, uint64_t durationNs);
    bool QueryExternalBufferProperties(VkNativeBufferPropertiesOHOS &properties);
    bool CreateImportedExternalImage(const VkNativeBufferPropertiesOHOS &properties,
        const OH_NativeBuffer_Config &config);
    bool EnsureExternalSampler();
    bool CreateExternalImageView();
    bool AllocateExternalImageMemory(const VkNativeBufferPropertiesOHOS &properties);
    bool CreateExternalSampler(bool useYcbcrConversion);
    bool EnsureExternalPipelineResources();
    void UpdateExternalDescriptorSet();
    void ReleaseCurrentNativeBuffer();
    void DestroyExternalImage();
    void DestroyExternalRenderResources();
    void DestroyExternalImageAndMemory();
    void DestroyExternalSamplerResources();
    void DestroyExternalPipelineResources();
    void DestroyExternalGeometryResources();
    void DestroyExternalUniformBuffer();
    void DestroyExternalVertexBuffer();
    void DestroyExternalFramebuffers();
    bool SubmitExternalFrame(uint32_t imageIndex);
    bool CreateStagingBuffer(size_t size, VkBuffer &buffer, VkDeviceMemory &memory);
    bool EnsureStagingBuffer(size_t size);
    bool EnsureUploadImage(uint32_t width, uint32_t height);
    bool CreateUploadImage(uint32_t width, uint32_t height);
    bool AllocateUploadImageMemory();
    void ReleaseUploadImage();
    bool PrepareUploadData(const std::vector<uint8_t> &rgba, int32_t width, int32_t height, int32_t rotation,
        UploadFrame &frame);
    bool UploadStagingData(const std::vector<uint8_t> &uploadData);
    bool RecordUploadCommands(int32_t uploadWidth, int32_t uploadHeight);
    bool RecordPresentCommands(uint32_t imageIndex, int32_t uploadWidth, int32_t uploadHeight);
    bool CalculatePresentRegion(int32_t uploadWidth, int32_t uploadHeight, PresentRegion &region) const;
    bool CalculateExternalPresentRegion(PresentRegion &region) const;
    bool SubmitFrame(uint32_t imageIndex);
    bool RenderFrame(const std::vector<uint8_t> &rgba, int32_t width, int32_t height, int32_t rotation);
    void PresentBlackFrame();
    bool CanClearCurrentSwapchain() const;
    bool WaitForVulkanDeviceForClear();
    bool EnsureBlackFramebuffers();
    bool AcquireBlackFrameImage(uint32_t &imageIndex);
    bool RecordAndSubmitBlackFrame(uint32_t imageIndex);
    void RecordBlackClearPass(uint32_t imageIndex);
    uint32_t FindMemoryType(uint32_t filter, VkMemoryPropertyFlags properties) const;
    void ReleaseVulkanResources();
    void DestroyFrameResources();
    void DestroyStagingBuffer();
    void ResetContextState();
    void DestroySwapchain();

    // VkSurfaceKHR 的生命周期依赖 NativeWindow；销毁 Vulkan Surface 前持续持有窗口引用。
    NativeXComponentSample::PluginManager::PluginWindowLease windowLease_;
    OH_NativeImage *nativeImage_ = nullptr;
    OHNativeWindow *decoderWindow_ = nullptr;
    std::atomic<uint32_t> availableFrameCount_ { 0 };
    std::mutex nativeImageMutex_;
    std::condition_variable nativeImageCondition_;
    OHNativeWindowBuffer *currentNativeWindowBuffer_ = nullptr;
    OH_NativeBuffer *currentNativeBuffer_ = nullptr;
    OHNativeWindow *window_ = nullptr;
    int32_t width_ = 0;
    int32_t height_ = 0;
    uint64_t windowGeneration_ = 0;
    VkInstance instance_ = VK_NULL_HANDLE;
    VkSurfaceKHR surface_ = VK_NULL_HANDLE;
    VkPhysicalDevice physicalDevice_ = VK_NULL_HANDLE;
    VkDevice device_ = VK_NULL_HANDLE;
    VkQueue queue_ = VK_NULL_HANDLE;
    uint32_t queueFamilyIndex_ = 0;
    VkSwapchainKHR swapchain_ = VK_NULL_HANDLE;
    VkFormat swapchainFormat_ = VK_FORMAT_UNDEFINED;
    VkExtent2D swapchainExtent_{};
    std::vector<VkImage> swapchainImages_;
    std::vector<VkImageLayout> swapchainImageLayouts_;
    VkCommandPool commandPool_ = VK_NULL_HANDLE;
    VkCommandBuffer commandBuffer_ = VK_NULL_HANDLE;
    VkSemaphore imageAvailable_ = VK_NULL_HANDLE;
    // 图像再次 acquire 后，才能确定上一次 present 已消费其等待信号量。
    std::vector<VkSemaphore> renderFinishedSemaphores_;
    VkFence frameFence_ = VK_NULL_HANDLE;
    VkRenderPass externalRenderPass_ = VK_NULL_HANDLE;
    std::vector<VkImageView> externalFrameBufferViews_;
    std::vector<VkFramebuffer> externalFramebuffers_;
    VkPipeline externalPipeline_ = VK_NULL_HANDLE;
    VkPipelineLayout externalPipelineLayout_ = VK_NULL_HANDLE;
    VkDescriptorSetLayout externalDescriptorSetLayout_ = VK_NULL_HANDLE;
    VkDescriptorPool externalDescriptorPool_ = VK_NULL_HANDLE;
    VkDescriptorSet externalDescriptorSet_ = VK_NULL_HANDLE;
    VkSamplerYcbcrConversion externalYcbcrConversion_ = VK_NULL_HANDLE;
    VkSampler externalSampler_ = VK_NULL_HANDLE;
    VkImageView externalImageView_ = VK_NULL_HANDLE;
    VkImage externalImage_ = VK_NULL_HANDLE;
    VkDeviceMemory externalImageMemory_ = VK_NULL_HANDLE;
    VkImageLayout externalImageLayout_ = VK_IMAGE_LAYOUT_UNDEFINED;
    VkBuffer externalVertexBuffer_ = VK_NULL_HANDLE;
    VkDeviceMemory externalVertexMemory_ = VK_NULL_HANDLE;
    VkBuffer externalUniformBuffer_ = VK_NULL_HANDLE;
    VkDeviceMemory externalUniformMemory_ = VK_NULL_HANDLE;
    void *externalUniformMapped_ = nullptr;
    bool externalResourcesReady_ = false;
    VkExternalFormatOHOS externalFormat_ {};
    VkNativeBufferFormatPropertiesOHOS externalFormatProperties_ {};
    std::array<float, VideoPresentationGeometry::MATRIX_ELEMENT_COUNT> externalTransform_ {};
    struct ExternalBufferCacheEntry {
        bool valid = false;
        uint32_t sequenceNumber = 0;
        uint64_t lastUse = 0;
        OH_NativeBuffer *nativeBuffer = nullptr;
        OH_NativeBuffer_Config config {};
        VkNativeBufferPropertiesOHOS properties {};
        VkNativeBufferFormatPropertiesOHOS formatProperties {};
        VkExternalFormatOHOS externalFormat {};
        VkImage image = VK_NULL_HANDLE;
        VkDeviceMemory memory = VK_NULL_HANDLE;
        VkImageView view = VK_NULL_HANDLE;
        VkImageLayout layout = VK_IMAGE_LAYOUT_UNDEFINED;
        bool usesYcbcrConversion = false;
    };
    std::array<ExternalBufferCacheEntry, externalBufferCacheCapacity> externalBufferCache_ {};
    int32_t activeExternalBufferCacheIndex_ = -1;
    uint64_t externalBufferCacheUse_ = 0;
    std::atomic<uint64_t> vulkanDiagnosticFrames_ { 0 };
    std::atomic<uint64_t> vulkanDiagnosticFailures_ { 0 };
    std::atomic<uint64_t> vulkanDiagnosticCacheHits_ { 0 };
    std::atomic<uint64_t> vulkanDiagnosticCacheMisses_ { 0 };
    std::atomic<uint64_t> vulkanDiagnosticFrameNs_ { 0 };
    std::atomic<uint64_t> vulkanDiagnosticNativeImageWaitNs_ { 0 };
    std::atomic<uint64_t> vulkanDiagnosticNativeImageAcquireNs_ { 0 };
    std::atomic<uint64_t> vulkanDiagnosticFenceWaitNs_ { 0 };
    std::atomic<uint64_t> vulkanDiagnosticImportNs_ { 0 };
    std::atomic<uint64_t> vulkanDiagnosticGpuWaitNs_ { 0 };
    std::atomic<uint64_t> vulkanDiagnosticCommandRecordNs_ { 0 };
    std::atomic<uint64_t> vulkanDiagnosticSubmitNs_ { 0 };
    VkImageView externalDescriptorImageView_ = VK_NULL_HANDLE;
    VkBuffer stagingBuffer_ = VK_NULL_HANDLE;
    VkDeviceMemory stagingMemory_ = VK_NULL_HANDLE;
    size_t stagingCapacity_ = 0;
    VkImage uploadImage_ = VK_NULL_HANDLE;
    VkDeviceMemory uploadImageMemory_ = VK_NULL_HANDLE;
    VkExtent2D uploadImageExtent_{};
    VkImageLayout uploadImageLayout_ = VK_IMAGE_LAYOUT_UNDEFINED;
    bool swapRedBlue_ = false;
    bool swapchainTransferSupported_ = false;
    bool swapchainRecreatePending_ = false;
    bool frameInFlight_ = false;
    bool initialized_ = false;
    bool surfaceOutputRequested_ = false;
    bool surfaceDecoderReady_ = false;
    // HDR Surface 输出需要 10-bit swapchain；该提示来自解码后的轨道配置，
    // 首帧 NativeBuffer 元数据到达后还会再次同步窗口元数据。
    bool preferHdrSwapchain_ = false;
    // 设备可能声明了 HDR 轨道，但 XComponent 不一定提供 HDR 色彩空间。
    // 该标记记录实际创建成功的 swapchain 格式，避免窗口仍按 10-bit 配置而
    // swapchain 已回退到 8-bit，造成色彩错误或画面不送显。
    bool hdrSwapchainActive_ = false;
    bool outputMetadataInitialized_ = false;
    bool metadataWarningLogged_ = false;
    bool hdrVividConfirmed_ = false;
    bool fallbackOnly_ = false;
    int32_t externalVideoWidth_ = 0;
    int32_t externalVideoHeight_ = 0;
    int32_t externalVideoRotation_ = 0;
    BufferVideoSink fallback_;
    std::vector<uint8_t> rgbaCache_;
    std::vector<uint8_t> uploadCache_;
};

#endif // AVCODEC_SAMPLE_VULKAN_VIDEO_SINK_H
