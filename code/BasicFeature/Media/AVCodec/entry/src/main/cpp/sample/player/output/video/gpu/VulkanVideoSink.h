/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#ifndef AVCODEC_SAMPLE_VULKAN_VIDEO_SINK_H
#define AVCODEC_SAMPLE_VULKAN_VIDEO_SINK_H

#ifndef VK_USE_PLATFORM_OHOS
#define VK_USE_PLATFORM_OHOS 1
#endif
#include <vulkan/vulkan.h>
#include <vector>

#include "../sink/BufferVideoSink.h"
#include "plugin_manager.h"

class VulkanVideoSink final : public VideoSink {
public:
    VulkanVideoSink() = default;
    ~VulkanVideoSink() override;

    int32_t Present(const VideoPresentRequest &request) override;
    void BeginPlayback() override;
    OHNativeWindow *PrepareForPlayback(const SampleInfo &sampleInfo) override;
    void Reset() override;

private:
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
    bool CreateDevice();
    bool CreateSwapchain(int32_t width, int32_t height);
    bool SelectSwapchainFormat(VkSurfaceFormatKHR &format);
    VkExtent2D ResolveSwapchainExtent(const VkSurfaceCapabilitiesKHR &capabilities, int32_t width,
        int32_t height) const;
    VkCompositeAlphaFlagBitsKHR SelectCompositeAlpha(const VkSurfaceCapabilitiesKHR &capabilities) const;
    VkPresentModeKHR SelectPresentMode() const;
    bool LoadSwapchainImages();
    bool RecreateSwapchain(int32_t width, int32_t height);
    bool CreateCommandResources();
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
    bool SubmitFrame(uint32_t imageIndex);
    bool RenderFrame(const std::vector<uint8_t> &rgba, int32_t width, int32_t height, int32_t rotation);
    void PresentBlackFrame();
    uint32_t FindMemoryType(uint32_t filter, VkMemoryPropertyFlags properties) const;
    void ReleaseVulkanResources();
    void DestroyFrameResources();
    void DestroyStagingBuffer();
    void ResetContextState();
    void DestroySwapchain();

    // VkSurfaceKHR 的生命周期依赖 NativeWindow；销毁 Vulkan Surface 前持续持有窗口引用。
    NativeXComponentSample::PluginManager::PluginWindowLease windowLease_;
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
    VkSemaphore renderFinished_ = VK_NULL_HANDLE;
    VkFence frameFence_ = VK_NULL_HANDLE;
    VkBuffer stagingBuffer_ = VK_NULL_HANDLE;
    VkDeviceMemory stagingMemory_ = VK_NULL_HANDLE;
    size_t stagingCapacity_ = 0;
    VkImage uploadImage_ = VK_NULL_HANDLE;
    VkDeviceMemory uploadImageMemory_ = VK_NULL_HANDLE;
    VkExtent2D uploadImageExtent_{};
    VkImageLayout uploadImageLayout_ = VK_IMAGE_LAYOUT_UNDEFINED;
    bool swapRedBlue_ = false;
    bool swapchainRecreatePending_ = false;
    bool initialized_ = false;
    bool fallbackOnly_ = false;
    BufferVideoSink fallback_;
    std::vector<uint8_t> rgbaCache_;
    std::vector<uint8_t> uploadCache_;
};

#endif // AVCODEC_SAMPLE_VULKAN_VIDEO_SINK_H
