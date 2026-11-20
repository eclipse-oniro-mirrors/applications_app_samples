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

#ifndef NATIVE_XCOMPONENT_PLUGIN_MANAGER_H
#define NATIVE_XCOMPONENT_PLUGIN_MANAGER_H

#include <cstdint>
#include <ace/xcomponent/native_interface_xcomponent.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <napi/native_api.h>
#include <memory>
#include <mutex>
#include <shared_mutex>
#include <string>
#include <unordered_map>
#include "native_window/external_window.h"

#include "plugin_render.h"

namespace NativeXComponentSample {
class PluginManager {
public:
    class PluginWindowLease {
    public:
        // 租约通过 NativeObjectReference 保持窗口在异步渲染期间有效；仅可移动，析构时自动解除引用。
        PluginWindowLease() = default;
        ~PluginWindowLease();

        PluginWindowLease(const PluginWindowLease &) = delete;
        PluginWindowLease &operator=(const PluginWindowLease &) = delete;
        PluginWindowLease(PluginWindowLease &&other) noexcept;
        PluginWindowLease &operator=(PluginWindowLease &&other) noexcept;

        explicit operator bool() const
        {
            return window_ != nullptr;
        }

        OHNativeWindow *GetWindow() const
        {
            return window_;
        }

        int32_t GetWidth() const
        {
            return width_;
        }

        int32_t GetHeight() const
        {
            return height_;
        }

        uint64_t GetGeneration() const
        {
            return generation_;
        }

    private:
        friend class PluginManager;

        PluginWindowLease(OHNativeWindow *window, int32_t width, int32_t height, uint64_t generation);
        void Reset();

        OHNativeWindow *window_ = nullptr;
        int32_t width_ = 0;
        int32_t height_ = 0;
        uint64_t generation_ = 0;
    };

    ~PluginManager();

    static PluginManager* GetInstance()
    {
        return &PluginManager::pluginManager_;
    }

    static napi_value GetContext(napi_env env, napi_callback_info info);

    void SetNativeXComponent(const std::string& id, OH_NativeXComponent* nativeXComponent);
    std::shared_ptr<PluginRender> GetRender(const std::string& id);
    void ReleaseRender(const std::string& id);
    void SetPluginWindow(OHNativeWindow *window, int32_t width, int32_t height);
    PluginWindowLease AcquirePluginWindow();
    void ClearPluginWindow(OHNativeWindow *window);
    void Export(napi_env env, napi_value exports);

private:
    static PluginManager pluginManager_;

    // XComponent 由 ArkUI 框架持有，此映射表只记录非拥有指针。销毁回调到达后必须立即移除，
    // 不能把其中的地址交给异步任务长期保存。
    std::unordered_map<std::string, OH_NativeXComponent*> nativeXComponentMap_;
    std::unordered_map<std::string, std::shared_ptr<PluginRender>> pluginRenderMap_;
    // 当前 XComponent 的借用窗口指针。需要跨出 mutex 或跨线程使用时，必须通过 AcquirePluginWindow() 获取租约。
    OHNativeWindow *pluginWindow_ = nullptr;
    int32_t pluginWindowWidth_ = 0;
    int32_t pluginWindowHeight_ = 0;
    uint64_t pluginWindowGeneration_ = 0;
    mutable std::shared_mutex mutex_;
};
}
#endif
