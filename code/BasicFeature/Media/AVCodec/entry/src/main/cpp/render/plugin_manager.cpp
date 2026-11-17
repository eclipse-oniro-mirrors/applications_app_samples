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

#include "plugin_manager.h"

#include <ace/xcomponent/native_interface_xcomponent.h>
#include <cstdint>
#include <cstdio>
#include <hilog/log.h>
#include <string>

#undef LOG_TAG
#define LOG_TAG "PLUGINMANAGER"

namespace NativeXComponentSample {
constexpr uint32_t LOG_PRINT_DOMAIN = 0xFF00;
PluginManager PluginManager::pluginManager_;

PluginManager::PluginWindowLease::PluginWindowLease(OHNativeWindow *window, int32_t width, int32_t height,
    uint64_t generation)
    : window_(window), width_(width), height_(height), generation_(generation)
{
}

PluginManager::PluginWindowLease::~PluginWindowLease()
{
    Reset();
}

PluginManager::PluginWindowLease::PluginWindowLease(PluginWindowLease &&other) noexcept
    : window_(other.window_), width_(other.width_), height_(other.height_), generation_(other.generation_)
{
    other.window_ = nullptr;
    other.width_ = 0;
    other.height_ = 0;
    other.generation_ = 0;
}

PluginManager::PluginWindowLease &PluginManager::PluginWindowLease::operator=(PluginWindowLease &&other) noexcept
{
    if (this == &other) {
        return *this;
    }
    Reset();
    window_ = other.window_;
    width_ = other.width_;
    height_ = other.height_;
    generation_ = other.generation_;
    other.window_ = nullptr;
    other.width_ = 0;
    other.height_ = 0;
    other.generation_ = 0;
    return *this;
}

void PluginManager::PluginWindowLease::Reset()
{
    if (window_ != nullptr) {
        // NativeWindow 的引用计数操作不是线程安全的。这里只与窗口替换、销毁串行化解除引用；
        // 租约在送显期间保持有效，不会因等待栅栏或 CPU 拷贝而阻塞 UI 线程。
        auto *manager = PluginManager::GetInstance();
        std::unique_lock<std::shared_mutex> lock(manager->mutex_);
        (void)OH_NativeWindow_NativeObjectUnreference(window_);
        window_ = nullptr;
    }
    width_ = 0;
    height_ = 0;
    generation_ = 0;
}

PluginManager::~PluginManager()
{
    OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "Callback", "~PluginManager");
    std::unique_lock<std::shared_mutex> lock(mutex_);
    nativeXComponentMap_.clear();
    pluginRenderMap_.clear();
    pluginWindow_ = nullptr;
}

napi_value PluginManager::GetContext(napi_env env, napi_callback_info info)
{
    if ((env == nullptr) || (info == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "GetContext env or info is null");
        return nullptr;
    }

    size_t argCnt = 1;
    napi_value args[1] = { nullptr };
    if (napi_get_cb_info(env, info, &argCnt, args, nullptr, nullptr) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "GetContext napi_get_cb_info failed");
    }

    if (argCnt != 1) {
        napi_throw_type_error(env, NULL, "Wrong number of arguments");
        return nullptr;
    }

    napi_valuetype valuetype;
    if (napi_typeof(env, args[0], &valuetype) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_typeof failed");
        return nullptr;
    }

    if (valuetype != napi_number) {
        napi_throw_type_error(env, NULL, "Wrong type of arguments");
        return nullptr;
    }

    int64_t value;
    if (napi_get_value_int64(env, args[0], &value) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_get_value_int64 failed");
        return nullptr;
    }

    napi_value exports;
    if (napi_create_object(env, &exports) != napi_ok) {
        napi_throw_type_error(env, NULL, "napi_create_object failed");
        return nullptr;
    }

    return exports;
}

void PluginManager::Export(napi_env env, napi_value exports)
{
    if ((env == nullptr) || (exports == nullptr)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "Export: env or exports is null");
        return;
    }

    napi_value exportInstance = nullptr;
    if (napi_get_named_property(env, exports, OH_NATIVE_XCOMPONENT_OBJ, &exportInstance) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "Export: napi_get_named_property fail");
        return;
    }

    OH_NativeXComponent* nativeXComponent = nullptr;
    if (napi_unwrap(env, exportInstance, reinterpret_cast<void**>(&nativeXComponent)) != napi_ok) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "Export: napi_unwrap fail");
        return;
    }

    char idStr[OH_XCOMPONENT_ID_LEN_MAX + 1] = { '\0' };
    uint64_t idSize = OH_XCOMPONENT_ID_LEN_MAX + 1;
    if (OH_NativeXComponent_GetXComponentId(nativeXComponent, idStr, &idSize) != OH_NATIVEXCOMPONENT_RESULT_SUCCESS) {
        OH_LOG_Print(
            LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "PluginManager", "Export: OH_NativeXComponent_GetXComponentId fail");
        return;
    }

    std::string id(idStr);
    auto context = PluginManager::GetInstance();
    if ((context != nullptr) && (nativeXComponent != nullptr)) {
        context->SetNativeXComponent(id, nativeXComponent);
        auto render = context->GetRender(id);
        if (render != nullptr) {
            render->RegisterCallback(nativeXComponent);
            render->Export(env, exports);
        }
    }
}

void PluginManager::SetNativeXComponent(const std::string& id, OH_NativeXComponent* nativeXComponent)
{
    if (nativeXComponent == nullptr) {
        return;
    }

    std::unique_lock<std::shared_mutex> lock(mutex_);
    // XComponent 从 ArkUI 解包得到，所有权仍归框架；这里只记录其地址，不能销毁或长期跨线程使用。
    nativeXComponentMap_[id] = nativeXComponent;
}

std::shared_ptr<PluginRender> PluginManager::GetRender(const std::string& id)
{
    std::unique_lock<std::shared_mutex> lock(mutex_);
    auto iter = pluginRenderMap_.find(id);
    if (iter == pluginRenderMap_.end()) {
        auto render = std::make_shared<PluginRender>(id);
        pluginRenderMap_.emplace(id, render);
        return render;
    }
    return iter->second;
}

void PluginManager::ReleaseRender(const std::string& id)
{
    std::unique_lock<std::shared_mutex> lock(mutex_);
    pluginRenderMap_.erase(id);
    nativeXComponentMap_.erase(id);
}

void PluginManager::SetPluginWindow(OHNativeWindow *window, int32_t width, int32_t height)
{
    std::unique_lock<std::shared_mutex> lock(mutex_);
    if (pluginWindow_ == window && pluginWindowWidth_ == width && pluginWindowHeight_ == height) {
        return;
    }
    // 该地址来自 XComponent 生命周期回调，所有权仍归框架。异步送显必须通过 AcquirePluginWindow() 增加引用。
    pluginWindow_ = window;
    pluginWindowWidth_ = width;
    pluginWindowHeight_ = height;
    pluginWindowGeneration_++;
}

PluginManager::PluginWindowLease PluginManager::AcquirePluginWindow()
{
    std::unique_lock<std::shared_mutex> lock(mutex_);
    // 在锁内增加 NativeWindow 引用，确保窗口不会在租约使用期间被 Surface 销毁回调释放。
    if (pluginWindow_ == nullptr || OH_NativeWindow_NativeObjectReference(pluginWindow_) != 0) {
        return {};
    }
    return PluginWindowLease(pluginWindow_, pluginWindowWidth_, pluginWindowHeight_, pluginWindowGeneration_);
}

void PluginManager::ClearPluginWindow(OHNativeWindow *window)
{
    std::unique_lock<std::shared_mutex> lock(mutex_);
    // 销毁回调可能不携带窗口句柄；Surface 一旦销毁，当前句柄仍然失效，必须一并清除。
    if (window == nullptr || pluginWindow_ == window) {
        pluginWindow_ = nullptr;
        pluginWindowWidth_ = 0;
        pluginWindowHeight_ = 0;
        pluginWindowGeneration_++;
    }
}
} // NativeXComponentSample 命名空间
