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

#include "napi/native_api.h"
#include <native_fence/native_fence.h>

#include <chrono>
#include <cstring>
#include <cerrno>
#include <fcntl.h>
#include <iostream>
#include <linux/sync_file.h>
#include <signal.h>
#include <sys/ioctl.h>
#include <sys/signalfd.h>
#include <thread>
#include <unistd.h>
#include "common/log_common.h"

constexpr int INVALID_FD = -1;
// [Start wait_fence]
constexpr uint32_t TIMEOUT_MS = 5000;
// [StartExclude wait_fence]

static napi_value Add(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};

    napi_get_cb_info(env, info, &argc, args , nullptr, nullptr);

    napi_valuetype valuetype0;
    napi_typeof(env, args[0], &valuetype0);

    napi_valuetype valuetype1;
    napi_typeof(env, args[1], &valuetype1);

    double value0;
    napi_get_value_double(env, args[0], &value0);

    double value1;
    napi_get_value_double(env, args[1], &value1);

    napi_value sum;
    napi_create_double(env, value0 + value1, &sum);

    return sum;
}

static napi_value SyncFenceWait(napi_env env, napi_callback_info info)
{
    bool result = OH_NativeFence_Wait(INVALID_FD, TIMEOUT_MS);
    // [End wait_fence]
    // [Start check_fence_invalid]
    bool isValid = OH_NativeFence_IsValid(INVALID_FD);
    if (!isValid) {
        DRAWING_LOGW("fenceFd is invalid");
    }
    // [End check_fence_invalid]

    std::atomic<bool> signaled(false);
    // [Start create_fencefd]
    sigset_t mask;
    sigemptyset(&mask);
    sigaddset(&mask, SIGINT); // Monitor SIGINT signal (Ctrl C)
    sigaddset(&mask, SIGURG); // Generated when urgent data or out of band data arrives at the socket
    sigprocmask(SIG_BLOCK, &mask, NULL);
    int sfd = signalfd(-1, &mask, 0);
    // [End create_fencefd]
    if (sfd == -1) {
        perror("SyncFenceWait signalfd failed");
        exit(1);
    }
    isValid = OH_NativeFence_IsValid(sfd);
    std::thread waitThread([&]() {
        // [EndExclude wait_fence]
        bool result2 = false;
        auto startTime = std::chrono::steady_clock::now();
        result2 = OH_NativeFence_Wait(sfd, TIMEOUT_MS);
        auto endTime = std::chrono::steady_clock::now();
        auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(endTime - startTime).count();
        if (result2) {
            DRAWING_LOGI("SyncFenceWait has an event occurring result2 %{public}d, cost_time: %{public}d",
                result2, duration);
        } else {
            DRAWING_LOGI("SyncFenceWait timeout with no event occurrence result2 %{public}d, cost_time: %{public}d",
                result2, duration);
        }
        // [End wait_fence]
        signaled.store(true);
    });
    std::this_thread::sleep_for(std::chrono::seconds(3)); // 3 means main thread sleep 3 seconds.
    pid_t target_pid = getpid();
    int ret = kill(target_pid, SIGURG);
    if (ret < 0) {
        DRAWING_LOGI("SyncFenceWait kill failed: %{public}d", strerror(errno));
    }
    // Waiting for waitThread to complete
    waitThread.join();
    OH_NativeFence_Close(sfd);
    napi_value funcResult = nullptr;
    napi_create_int32(env, result ? 1 : 0, &funcResult);

    return funcResult;
}

static napi_value SyncFenceWaitForever(napi_env env, napi_callback_info info)
{
    bool result = OH_NativeFence_WaitForever(INVALID_FD);

    std::atomic<bool> signaled(false);
    sigset_t mask;
    sigemptyset(&mask);
    sigaddset(&mask, SIGINT); // Monitor SIGINT signal (Ctrl C)
    sigaddset(&mask, SIGURG); // Generated when urgent data or out of band data arrives at the socket
    sigprocmask(SIG_BLOCK, &mask, NULL);
    int sfd = signalfd(-1, &mask, 0);
    if (sfd == -1) {
        perror("SyncFenceWaitForever signalfd failed");
        exit(1);
    }
    std::thread waitThread([&]() {
        // [Start wait_fence_forever]
        bool result2 = false;
        auto startTime = std::chrono::steady_clock::now();
        result2 = OH_NativeFence_WaitForever(sfd);
        auto endTime = std::chrono::steady_clock::now();
        auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(endTime - startTime).count();
        if (result2) {
            DRAWING_LOGI("SyncFenceWaitForever has an event occurring result2 %{public}d, cost_time: %{public}d",
                result2, duration);
        } else {
            DRAWING_LOGI("SyncFenceWaitForever timeout with no event occurrence"
                "result2 %{public}d, cost_time: %{public}d", result2, duration);
        }
        // [End wait_fence_forever]
        signaled.store(true);
    });
    std::this_thread::sleep_for(std::chrono::seconds(2)); // 2 means main thread sleep 2 seconds.
    pid_t target_pid = getpid();
    int ret = kill(target_pid, SIGURG);
    if (ret < 0) {
        DRAWING_LOGI("SyncFenceWaitForever kill failed: %{public}d", strerror(errno));
    }
    // Waiting for waitThread to complete
    waitThread.join();
    // [Start close_fence]
    OH_NativeFence_Close(sfd);
    // [End wait_fence_forever]
    napi_value funcResult = nullptr;
    napi_create_int32(env, result ? 1 : 0, &funcResult);

    return funcResult;
}

// EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "add", nullptr, Add, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "syncFence_wait", nullptr, SyncFenceWait, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "syncFence_waitForever", nullptr, SyncFenceWaitForever, nullptr, nullptr, nullptr, napi_default, nullptr }
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
// EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}