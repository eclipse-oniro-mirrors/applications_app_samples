/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// [Start ui_timer]
// UITimer.h
// 定时器模块。

#ifndef MYAPPLICATION_UITIMER_H
#define MYAPPLICATION_UITIMER_H

#include <hilog/log.h>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <node_api.h>
#include <node_api_types.h>
#include <memory>
#include <string>
#include <thread>
#include <uv.h>

namespace NativeModule {

class ArkUIMixedRefresh;

using TimerCallback = void (*)(const std::shared_ptr<ArkUIMixedRefresh> &refresh, int32_t count);

struct UIData {
    std::weak_ptr<ArkUIMixedRefresh> refresh;
    int32_t count = 0;
    int32_t totalCount = 0;
    TimerCallback func = nullptr;
    napi_threadsafe_function threadSafeFunction = nullptr;
};

static void DeleteTimerHandle(uv_handle_t *handle)
{
    delete reinterpret_cast<uv_timer_t *>(handle);
}

static void CloseTimer(uv_timer_t *timer)
{
    uv_timer_stop(timer);
    uv_close(reinterpret_cast<uv_handle_t *>(timer), DeleteTimerHandle);
}

static void CallRefreshOnUI(napi_env, napi_value, void *, void *data)
{
    auto *callbackData = reinterpret_cast<UIData *>(data);
    auto refresh = callbackData->refresh.lock();
    if (refresh != nullptr && callbackData->func != nullptr) {
        callbackData->func(refresh, callbackData->count);
    }
    delete callbackData;
}

static napi_status CreateTimerThreadSafeFunction(napi_env env, UIData *customData)
{
    napi_value name = nullptr;
    const std::string callbackName = "UICallback";
    auto status = napi_create_string_utf8(env, callbackName.c_str(), callbackName.size(), &name);
    if (status != napi_ok) {
        return status;
    }
    return napi_create_threadsafe_function(env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr,
                                           CallRefreshOnUI, &customData->threadSafeFunction);
}

static void OnTimer(uv_timer_t *timer)
{
    OH_LOG_INFO(LOG_APP, "on timeout");
    auto *customData = reinterpret_cast<UIData *>(timer->data);
    auto *callbackData = new UIData(*customData);
    if (napi_call_threadsafe_function(customData->threadSafeFunction, callbackData,
                                      napi_tsfn_blocking) != napi_ok) {
        delete callbackData;
    }
    customData->count++;
    if (customData->count <= customData->totalCount) {
        return;
    }
    CloseTimer(timer);
}

static void ReleaseTimerData(UIData *customData)
{
    napi_release_threadsafe_function(customData->threadSafeFunction, napi_tsfn_release);
    delete customData;
}

static void RunTimer(UIData *customData)
{
    uv_loop_t *loop = uv_loop_new();
    if (loop == nullptr) {
        ReleaseTimerData(customData);
        return;
    }
    auto *timer = new uv_timer_t();
    if (uv_timer_init(loop, timer) != 0) {
        delete timer;
        ReleaseTimerData(customData);
        uv_loop_delete(loop);
        return;
    }
    timer->data = customData;
    constexpr uint64_t timeout = 4000;
    constexpr uint64_t repeat = 4000;
    if (uv_timer_start(timer, OnTimer, timeout, repeat) != 0) {
        CloseTimer(timer);
    }
    uv_run(loop, UV_RUN_DEFAULT);
    ReleaseTimerData(customData);
    uv_loop_delete(loop);
}

static void CreateNativeTimer(napi_env env, const std::weak_ptr<ArkUIMixedRefresh> &refresh, int32_t totalCount,
                              TimerCallback func)
{
    auto *customData = new UIData {refresh, 0, totalCount, func, nullptr};
    if (CreateTimerThreadSafeFunction(env, customData) != napi_ok) {
        delete customData;
        return;
    }
    // 启动定时器，模拟数据变化。
    std::thread timerThread(RunTimer, customData);
    timerThread.detach();
}
} // namespace NativeModule

#endif // MYAPPLICATION_UITIMER_H
// [End ui_timer]
