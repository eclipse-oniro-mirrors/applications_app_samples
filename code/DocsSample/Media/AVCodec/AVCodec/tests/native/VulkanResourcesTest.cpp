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

#include "TestCheck.h"
#include "sample/player/output/video/gpu/VulkanResources.h"
#include <cstdint>
#include <type_traits>
#include <vector>
#include <iostream>

namespace {
using TestSupport::Require;
std::vector<int> g_destroyed;
constexpr int FENCE = 1;
constexpr int SEMAPHORE = 2;
constexpr int COMMAND_POOL = 3;
constexpr int SWAPCHAIN = 4;
constexpr int IMAGE = 5;
constexpr int MEMORY = 6;

template<class Handle> Handle MakeHandle()
{
    constexpr uintptr_t identity = 1;
    if constexpr (std::is_pointer_v<Handle>) {
        return reinterpret_cast<Handle>(identity);
    } else {
        return static_cast<Handle>(identity);
    }
}

void TestFramePartialInitialization()
{
    VkDevice device = MakeHandle<VkDevice>();
    for (int count = 0; count <= COMMAND_POOL; ++count) {
        g_destroyed.clear();
        VulkanFrameResources resources(device);
        if (count >= FENCE) { resources.commandPool = MakeHandle<VkCommandPool>(); }
        if (count >= SEMAPHORE) { resources.imageAvailable = MakeHandle<VkSemaphore>(); }
        if (count >= COMMAND_POOL) { resources.fence = MakeHandle<VkFence>(); }
        resources.Reset();
        const std::vector<std::vector<int>> expected { {}, { COMMAND_POOL },
            { SEMAPHORE, COMMAND_POOL }, { FENCE, SEMAPHORE, COMMAND_POOL } };
        Require(g_destroyed == expected[count], "Partial frame resources release in dependency order");
        resources.Reset();
        Require(g_destroyed == expected[count], "Frame reset is idempotent");
    }
}

void TestSwapchainPartialInitialization()
{
    VkDevice device = MakeHandle<VkDevice>();
    constexpr size_t imageCount = 3;
    for (size_t created = 0; created <= imageCount; ++created) {
        g_destroyed.clear();
        {
            VulkanSwapchainResources resources(device);
            resources.handle = MakeHandle<VkSwapchainKHR>();
            resources.images.resize(imageCount, MakeHandle<VkImage>());
            resources.layouts.resize(imageCount, VK_IMAGE_LAYOUT_UNDEFINED);
            resources.renderFinished.resize(imageCount, VK_NULL_HANDLE);
            for (size_t index = 0; index < created; ++index) {
                resources.renderFinished[index] = MakeHandle<VkSemaphore>();
            }
            std::vector<int> expected(created, SEMAPHORE);
            expected.push_back(SWAPCHAIN);
            resources.Reset();
            Require(g_destroyed == expected && resources.images.empty() && resources.layouts.empty(),
                "Partial semaphore initialization releases only created resources before the swapchain");
            resources.Reset();
            Require(g_destroyed == expected, "Swapchain reset is idempotent");
        }
        Require(g_destroyed.size() == created + 1, "Explicit reset followed by destruction releases once");
    }
}

void TestUploadPartialInitialization()
{
    VkDevice device = MakeHandle<VkDevice>();
    for (int count = 0; count <= SEMAPHORE; ++count) {
        g_destroyed.clear();
        {
            VulkanUploadResources resources(device);
            if (count >= FENCE) { resources.image = MakeHandle<VkImage>(); }
            if (count >= SEMAPHORE) { resources.memory = MakeHandle<VkDeviceMemory>(); }
        }
        const std::vector<std::vector<int>> expected { {}, { IMAGE }, { IMAGE, MEMORY } };
        Require(g_destroyed == expected[count], "Unbound or bound upload resources release image before memory");
    }
}
} // namespace

extern "C" VKAPI_ATTR void VKAPI_CALL FakeDestroyFence(VkDevice, VkFence, const VkAllocationCallbacks *)
    __asm__("vkDestroyFence");
extern "C" VKAPI_ATTR void VKAPI_CALL FakeDestroyFence(VkDevice, VkFence, const VkAllocationCallbacks *)
{
    g_destroyed.push_back(FENCE);
}
extern "C" VKAPI_ATTR void VKAPI_CALL FakeDestroySemaphore(VkDevice, VkSemaphore, const VkAllocationCallbacks *)
    __asm__("vkDestroySemaphore");
extern "C" VKAPI_ATTR void VKAPI_CALL FakeDestroySemaphore(VkDevice, VkSemaphore, const VkAllocationCallbacks *)
{
    g_destroyed.push_back(SEMAPHORE);
}
extern "C" VKAPI_ATTR void VKAPI_CALL FakeDestroyCommandPool(VkDevice, VkCommandPool, const VkAllocationCallbacks *)
    __asm__("vkDestroyCommandPool");
extern "C" VKAPI_ATTR void VKAPI_CALL FakeDestroyCommandPool(VkDevice, VkCommandPool, const VkAllocationCallbacks *)
{
    g_destroyed.push_back(COMMAND_POOL);
}
extern "C" VKAPI_ATTR void VKAPI_CALL FakeDestroySwapchainKHR(VkDevice, VkSwapchainKHR, const VkAllocationCallbacks *)
    __asm__("vkDestroySwapchainKHR");
extern "C" VKAPI_ATTR void VKAPI_CALL FakeDestroySwapchainKHR(VkDevice, VkSwapchainKHR, const VkAllocationCallbacks *)
{
    g_destroyed.push_back(SWAPCHAIN);
}
extern "C" VKAPI_ATTR void VKAPI_CALL FakeDestroyImage(VkDevice, VkImage, const VkAllocationCallbacks *)
    __asm__("vkDestroyImage");
extern "C" VKAPI_ATTR void VKAPI_CALL FakeDestroyImage(VkDevice, VkImage, const VkAllocationCallbacks *)
{
    g_destroyed.push_back(IMAGE);
}
extern "C" VKAPI_ATTR void VKAPI_CALL FakeFreeMemory(VkDevice, VkDeviceMemory, const VkAllocationCallbacks *)
    __asm__("vkFreeMemory");
extern "C" VKAPI_ATTR void VKAPI_CALL FakeFreeMemory(VkDevice, VkDeviceMemory, const VkAllocationCallbacks *)
{
    g_destroyed.push_back(MEMORY);
}

int main()
{
    TestFramePartialInitialization();
    TestSwapchainPartialInitialization();
    TestUploadPartialInitialization();
    std::cout << "Vulkan resource groups: partial initialization, ordering and repeated cleanup passed\n";
}
