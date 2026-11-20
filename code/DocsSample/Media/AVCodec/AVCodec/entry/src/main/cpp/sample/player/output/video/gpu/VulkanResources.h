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

#ifndef AVCODEC_VULKAN_RESOURCES_H
#define AVCODEC_VULKAN_RESOURCES_H

#include <vector>
#include <vulkan/vulkan.h>

// 调用方先停止提交并等待GPU完成，再Reset；析构只归还句柄，不等待GPU。
class VulkanFrameResources {
public:
    explicit VulkanFrameResources(const VkDevice &device) : device_(device)
    {
    }
    ~VulkanFrameResources()
    {
        Reset();
    }
    VulkanFrameResources(const VulkanFrameResources &) = delete;
    VulkanFrameResources &operator=(const VulkanFrameResources &) = delete;

    void Reset()
    {
        if (fence != VK_NULL_HANDLE) {
            vkDestroyFence(device_, fence, nullptr);
            fence = VK_NULL_HANDLE;
        }
        if (imageAvailable != VK_NULL_HANDLE) {
            vkDestroySemaphore(device_, imageAvailable, nullptr);
            imageAvailable = VK_NULL_HANDLE;
        }
        if (commandPool != VK_NULL_HANDLE) {
            vkDestroyCommandPool(device_, commandPool, nullptr);
            commandPool = VK_NULL_HANDLE;
        }
        commandBuffer = VK_NULL_HANDLE;
    }

    VkCommandPool commandPool = VK_NULL_HANDLE;
    VkCommandBuffer commandBuffer = VK_NULL_HANDLE;
    VkSemaphore imageAvailable = VK_NULL_HANDLE;
    VkFence fence = VK_NULL_HANDLE;

private:
    const VkDevice &device_;
};

class VulkanSwapchainResources {
public:
    explicit VulkanSwapchainResources(const VkDevice &device) : device_(device)
    {
    }
    ~VulkanSwapchainResources()
    {
        Reset();
    }
    VulkanSwapchainResources(const VulkanSwapchainResources &) = delete;
    VulkanSwapchainResources &operator=(const VulkanSwapchainResources &) = delete;

    void Reset()
    {
        for (VkSemaphore semaphore : renderFinished) {
            if (semaphore != VK_NULL_HANDLE) {
                vkDestroySemaphore(device_, semaphore, nullptr);
            }
        }
        renderFinished.clear();
        if (handle != VK_NULL_HANDLE) {
            vkDestroySwapchainKHR(device_, handle, nullptr);
            handle = VK_NULL_HANDLE;
        }
        images.clear();
        layouts.clear();
    }

    VkSwapchainKHR handle = VK_NULL_HANDLE;
    std::vector<VkImage> images;
    std::vector<VkImageLayout> layouts;
    // 图像再次acquire后才能复用该图像的present等待信号量。
    std::vector<VkSemaphore> renderFinished;

private:
    const VkDevice &device_;
};

class VulkanUploadResources {
public:
    explicit VulkanUploadResources(const VkDevice &device) : device_(device)
    {
    }
    ~VulkanUploadResources()
    {
        Reset();
    }
    VulkanUploadResources(const VulkanUploadResources &) = delete;
    VulkanUploadResources &operator=(const VulkanUploadResources &) = delete;

    void Reset()
    {
        if (image != VK_NULL_HANDLE) {
            vkDestroyImage(device_, image, nullptr);
            image = VK_NULL_HANDLE;
        }
        if (memory != VK_NULL_HANDLE) {
            vkFreeMemory(device_, memory, nullptr);
            memory = VK_NULL_HANDLE;
        }
        extent = {};
        layout = VK_IMAGE_LAYOUT_UNDEFINED;
    }

    VkImage image = VK_NULL_HANDLE;
    VkDeviceMemory memory = VK_NULL_HANDLE;
    VkExtent2D extent {};
    VkImageLayout layout = VK_IMAGE_LAYOUT_UNDEFINED;

private:
    const VkDevice &device_;
};

#endif
