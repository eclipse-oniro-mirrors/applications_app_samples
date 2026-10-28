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

#include "hilog/log.h"
#include "napi/native_api.h"

static constexpr int INT_ARG_0 = 0; // 入参索引
static constexpr int INT_ARG_1 = 1; // 入参索引
static constexpr int INT_ARG_2 = 2; // 入参索引

// [Start napi_is_promise]
// napi_is_promise
static napi_value IsPromise(napi_env env, napi_callback_info info)
{
    napi_value argv[1] = {nullptr};
    size_t argc = 1;
    napi_status status;
    // 获取传入的参数
    napi_get_cb_info(env, info, &argc, argv, nullptr, nullptr);
    bool isPromise = false;
    // 检查给定的入参是否为Promise对象，将结果保存在isPromise变量中
    status = napi_is_promise(env, argv[0], &isPromise);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Node-API napi_is_promise failed");
        return nullptr;
    }
    napi_value result = nullptr;
    // 将isPromise的值转换为napi_value中的类型返回
    napi_get_boolean(env, isPromise, &result);
    return result;
}
// [End napi_is_promise]

// [Start napi_resolve_reject_deferred]
// napi_resolve_deferred & napi_reject_deferred
static napi_value CreatePromise(napi_env env, napi_callback_info info)
{
    // deferred是与Promise对象关联的对象，用于控制Promise的状态 (resolve或reject)
    napi_deferred deferred = nullptr;
    napi_value promise = nullptr;
    // 调用接口创建Promise对象
    napi_status status = napi_create_promise(env, &deferred, &promise);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Create promise failed");
        return nullptr;
    }
    // 调用napi_is_promise判断napi_create_promise接口创建的是不是Promise对象
    bool isPromise = false;
    napi_value returnIsPromise = nullptr;
    status = napi_is_promise(env, promise, &isPromise);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "napi_is_promise failed");
        return nullptr;
    }
    // 将布尔值转为可以返回的napi_value
    napi_get_boolean(env, isPromise, &returnIsPromise);
    return returnIsPromise;
}

static napi_value ResolveRejectDeferred(napi_env env, napi_callback_info info)
{
    // 获得并解析参数
    size_t argc = 3;
    napi_value args[3] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // 第一个参数为向resolve传入的信息，第二个参数为向reject传入的信息，第三个参数为Promise的状态
    bool promiseStatus;
    napi_status status = napi_get_value_bool(env, args[INT_ARG_2], &promiseStatus);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "napi_get_value_bool failed");
        return nullptr;
    }

    // 创建Promise对象
    napi_deferred deferred = nullptr;
    napi_value promise = nullptr;
    status = napi_create_promise(env, &deferred, &promise);
    if (status != napi_ok) {
        napi_throw_error(env, nullptr, "Create promise failed");
        return nullptr;
    }
    // 根据第三个参数设置resolve或reject
    if (promiseStatus) {
        napi_resolve_deferred(env, deferred, args[INT_ARG_0]);
    } else {
        napi_reject_deferred(env, deferred, args[INT_ARG_1]);
    }
    // 返回设置了resolve或reject的Promise对象
    return promise;
}
// [End napi_resolve_reject_deferred]

// [Start napi_open_microtask_scope]
// napi_open_microtask_scope & napi_close_microtask_scope
// 使用C++的RAII机制管理微任务作用域，避免遗漏关闭
// 仅用作示例，也可以通过其他方式进行封装，或直接使用原始接口
class MyMicrotaskScope {
    napi_env env_{};
    napi_microtask_scope scope_{};

public:
    explicit MyMicrotaskScope(napi_env env) : env_(env)
    {
        if (napi_open_microtask_scope(env_, &scope_) != napi_ok) {
            // 失败时，进行一些必要的错误处理，此处省略。
            // 常见失败原因：
            // 1. env不是有效的Node-API执行上下文（如：env参数为nullptr）。
            // 2. 已存在打开的微任务作用域，微任务作用域不支持嵌套打开。
        }
    }

    // 查询微任务作用域是否成功打开
    bool IsValid() const { return scope_ != nullptr; }

    ~MyMicrotaskScope()
    {
        Close();
    }

    inline void Close()
    {
        if (scope_ == nullptr) {
            return;
        }
        // 关闭微任务作用域，并统一执行作用域打开期间累积的微任务
        if (napi_close_microtask_scope(env_, scope_) != napi_ok) {
            // 失败时，进行一些必要的错误处理，此处省略。
            // 常见失败原因：
            // 1. 没有处于打开状态的微任务作用域（如：重复关闭）。
            // 2. env不是有效的Node-API执行上下文（如：空指针）。
            // 3. scope不是有效的微任务作用域句柄（如：空指针）。
            // 4. 调用该接口前或调用过程中出现未捕获的ArkTS异常（此时作用域已完成关闭，异常仍保留在环境中，可按需处理）。
        }
        scope_ = nullptr;
    }
};

// Promise的then回调，执行时通过data指针置位调用方传入的标记
static napi_value OnFulfilled(napi_env env, napi_callback_info info)
{
    // 取出创建回调时传入的data指针（指向调用方的bool标记）
    void* data = nullptr;
    napi_get_cb_info(env, info, nullptr, nullptr, nullptr, &data);
    if (data != nullptr) {
        *static_cast<bool*>(data) = true;
    }
    return nullptr;
}

// returnCode位含义：bit0=1 作用域打开期间then回调未执行（被限制执行）
//                   bit1=1 作用域关闭后then回调已执行
static constexpr int32_t BIT_REACTION_NOT_CALLED_IN_SCOPE = 1 << 0;
static constexpr int32_t BIT_REACTION_CALLED_AFTER_CLOSE = 1 << 1;

static napi_value DeferredMicrotask(napi_env env, napi_callback_info info)
{
    int32_t returnCode = 0;
    // then回调是否已执行的标记，经napi_create_function的data参数传给回调，避免使用全局状态
    bool reactionCalled = false;

    // 创建Promise并注册then回调
    napi_deferred deferred = nullptr;
    napi_value promise = nullptr;
    napi_create_promise(env, &deferred, &promise);

    napi_value callback = nullptr;
    napi_create_function(env, "onFulfilled", NAPI_AUTO_LENGTH, OnFulfilled, &reactionCalled, &callback);
    napi_value key = nullptr;
    napi_value thenFunction = nullptr;
    napi_create_string_utf8(env, "then", NAPI_AUTO_LENGTH, &key);
    napi_get_property(env, promise, key, &thenFunction);

    {
        // 打开微任务作用域，期间触发的微任务被限制执行
        MyMicrotaskScope scope(env);
        // 打开失败（如嵌套打开）时，微任务作用域未生效，示例语义不成立，直接返回错误
        if (!scope.IsValid()) {
            napi_throw_error(env, nullptr, "napi_open_microtask_scope failed");
            return nullptr;
        }

        napi_value callResult = nullptr;
        napi_call_function(env, promise, thenFunction, 1, &callback, &callResult);
        napi_value resolution = nullptr;
        napi_create_int32(env, 1, &resolution);
        napi_resolve_deferred(env, deferred, resolution);

        // 微任务作用域打开期间，then回调不会随接口返回被立即执行
        if (!reactionCalled) {
            returnCode |= BIT_REACTION_NOT_CALLED_IN_SCOPE;
        }
        OH_LOG_INFO(LOG_APP, "in microtask scope: reactionCalled = %{public}d, returnCode = %{public}d",
            reactionCalled, returnCode);

        // 关闭微任务作用域，累积的微任务统一执行
        scope.Close();
    }

    // 作用域关闭后，then回调已被执行
    if (reactionCalled) {
        returnCode |= BIT_REACTION_CALLED_AFTER_CLOSE;
    }
    OH_LOG_INFO(LOG_APP, "after scope closed: reactionCalled = %{public}d, returnCode = %{public}d",
        reactionCalled, returnCode);

    // 预期返回3（二进制0b11）：bit0与bit1同时置位，证明then回调在作用域打开期间被限制、关闭后统一执行
    napi_value returnResult = nullptr;
    napi_create_int32(env, returnCode, &returnResult);
    return returnResult;
}
// [End napi_open_microtask_scope]

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"isPromise", nullptr, IsPromise, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"createPromise", nullptr, CreatePromise, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resolveRejectDeferred", nullptr, ResolveRejectDeferred, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"deferredMicrotask", nullptr, DeferredMicrotask, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
