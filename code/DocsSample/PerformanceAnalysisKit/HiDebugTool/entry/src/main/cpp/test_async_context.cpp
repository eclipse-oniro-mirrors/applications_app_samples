/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

// [Start TestHidebugNdk_AsyncContext]
#include "test_async_context.h"
#include "hidebug/hidebug.h"
#include "hilog/log.h"
#include <cstdlib>
#include <thread>
#include <chrono>

#undef LOG_TAG
#define LOG_TAG "testTag"

// IsDebuggableHap() 与 DfxInvokeHiDebugCallback（hiprofiler注入buffer时调用）均检查
// 环境变量 HAP_DEBUGGABLE；setenv 须早于注入，故用 constructor 在 libentry.so 加载时设置。
__attribute__((constructor)) static void SetHapDebuggableEnv()
{
    setenv("HAP_DEBUGGABLE", "true", 1);
}

// 模拟异步任务耗时(ms)
static constexpr int ASYNC_TASK_DURATION_MS = 500;

// 三方异步任务上下文，用于在线程间透传异步上下文句柄
struct AsyncTaskCtx {
    uint64_t asyncCtx;
};

// B：三方异步任务，使用std::thread模拟三方异步框架。
static void ThirdPartyAsyncTask(AsyncTaskCtx *ctx)
{
    if (ctx == nullptr) {
        return;
    }
    // 步骤2：异步任务执行时，将异步上下文压入当前线程运行上下文，建立异步调用链。
    OH_HiDebug_PushAsyncContext(ctx->asyncCtx);
    OH_LOG_INFO(LogType::LOG_APP, "[Async-B] Third-party async task start, push context %{public}llu",
        (unsigned long long)ctx->asyncCtx);
    std::this_thread::sleep_for(std::chrono::milliseconds(ASYNC_TASK_DURATION_MS)); // 模拟三方异步耗时
    OH_LOG_INFO(LogType::LOG_APP, "[Async-B] Third-party async task done");
    // 步骤3：异步任务完成时，将异步上下文弹出，解除异步调用链。
    OH_HiDebug_PopAsyncContext(ctx->asyncCtx);
    delete ctx;
}

// A：提交方，在独立线程执行以避免阻塞napi调用线程。
static void OuterTaskFunc()
{
    // 步骤1：异步任务提交前，获取一个异步上下文。
    uint64_t asyncCtx = OH_HiDebug_AcquireAsyncContext();
    OH_LOG_INFO(LogType::LOG_APP, "[Async-A] Acquired context: %{public}llu", (unsigned long long)asyncCtx);

    // 提交三方异步任务B，透传异步上下文句柄。
    OH_LOG_INFO(LogType::LOG_APP, "[Async-A] Submit third-party async task B");
    auto *ctx = new (std::nothrow) AsyncTaskCtx{asyncCtx};
    if (ctx == nullptr) {
        OH_HiDebug_ReleaseAsyncContext(asyncCtx);
        return;
    }
    std::thread worker(ThirdPartyAsyncTask, ctx);
    worker.join(); // 等待B完成，保证Release在Push/Pop之后

    // 步骤4：异步任务结束后，释放异步上下文资源，防止资源泄漏。
    OH_HiDebug_ReleaseAsyncContext(asyncCtx);
    OH_LOG_INFO(LogType::LOG_APP, "[Async-A] Released context");
}

// 构造A->B单层异步调用链，演示管理异步上下文的四个接口。
void TestAsyncContextChain()
{
    // 在独立线程执行A，避免阻塞napi调用线程。
    std::thread(OuterTaskFunc).detach();
}
// [End TestHidebugNdk_AsyncContext]
