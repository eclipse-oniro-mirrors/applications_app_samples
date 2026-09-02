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

struct UIData {
    std::weak_ptr<ArkUIMixedRefresh> refresh;
    int32_t count = 0;
    int32_t totalCount = 0;
    void (*func)(const std::shared_ptr<ArkUIMixedRefresh> &refresh, int32_t count) = nullptr;
    napi_threadsafe_function threadSafeFunction = nullptr;
};

void CreateNativeTimer(
    napi_env env, const std::weak_ptr<ArkUIMixedRefresh> &refresh, int32_t totalCount,
    void (*func)(const std::shared_ptr<ArkUIMixedRefresh> &refresh, int32_t count))
{
    napi_value name = nullptr;
    std::string str = "UICallback";
    if (napi_create_string_utf8(env, str.c_str(), str.size(), &name) != napi_ok) {
        return;
    }
    auto *customData = new UIData {refresh, 0, totalCount, func, nullptr};
    // UI主线程回调函数。
    auto status = napi_create_threadsafe_function(
        env, nullptr, nullptr, name, 0, 1, nullptr, nullptr, nullptr,
        [](napi_env env, napi_value value, void *context, void *data) {
            auto *callbackData = reinterpret_cast<UIData *>(data);
            auto refresh = callbackData->refresh.lock();
            if (refresh != nullptr && callbackData->func != nullptr) {
                callbackData->func(refresh, callbackData->count);
            }
            delete callbackData;
        },
        &customData->threadSafeFunction);
    if (status != napi_ok) {
        delete customData;
        return;
    }
    // 启动定时器，模拟数据变化。
    std::thread timerThread([customData]() {
        uv_loop_t *loop = uv_loop_new();
        if (loop == nullptr) {
            napi_release_threadsafe_function(customData->threadSafeFunction, napi_tsfn_release);
            delete customData;
            return;
        }
        uv_timer_t *timer = new uv_timer_t();
        if (uv_timer_init(loop, timer) != 0) {
            delete timer;
            napi_release_threadsafe_function(customData->threadSafeFunction, napi_tsfn_release);
            delete customData;
            uv_loop_delete(loop);
            return;
        }
        timer->data = customData;
        uint64_t timeout = 4000;
        uint64_t repeat = 4000;
        auto timerResult = uv_timer_start(
            timer,
            [](uv_timer_t *handle) {
                OH_LOG_INFO(LOG_APP, "on timeout");
                auto *customData = reinterpret_cast<UIData *>(handle->data);
                // 创建回调数据。
                auto *callbackData = new UIData(*customData);
                if (napi_call_threadsafe_function(customData->threadSafeFunction, callbackData,
                                                  napi_tsfn_blocking) != napi_ok) {
                    delete callbackData;
                }
                customData->count++;
                if (customData->count > customData->totalCount) {
                    uv_timer_stop(handle);
                    uv_close(reinterpret_cast<uv_handle_t *>(handle), [](uv_handle_t *closedHandle) {
                        delete reinterpret_cast<uv_timer_t *>(closedHandle);
                    });
                }
            },
            timeout, repeat);
        if (timerResult != 0) {
            uv_close(reinterpret_cast<uv_handle_t *>(timer), [](uv_handle_t *closedHandle) {
                delete reinterpret_cast<uv_timer_t *>(closedHandle);
            });
        }
        uv_run(loop, UV_RUN_DEFAULT);
        napi_release_threadsafe_function(customData->threadSafeFunction, napi_tsfn_release);
        delete customData;
        uv_loop_delete(loop);
    });
    timerThread.detach();
}
} // namespace NativeModule

#endif // MYAPPLICATION_UITIMER_H
// [End ui_timer]
