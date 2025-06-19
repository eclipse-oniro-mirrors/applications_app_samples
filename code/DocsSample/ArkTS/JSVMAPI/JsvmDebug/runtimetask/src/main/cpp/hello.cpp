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
#include "hilog/log.h"
#include "ark_runtime/jsvm.h"

// [Start runtime_task]
#include <map>
#include <mutex>
#include <deque>
using namespace std;
// 定义map管理每个独立vm环境
static map<int, JSVM_VM *> g_vmMap;
static map<int, JSVM_Env *> g_envMap;
static map<int, JSVM_CallbackStruct *> g_callBackStructMap;
static uint32_t g_envtagNumber = 0;
static std::mutex g_envMapLock;
// [StartExclude runtime_task]

#define LOG_DOMAIN 0x3200
#define LOG_TAG "APP"

static int g_aa = 0;

#define CHECK_RET(theCall)                                                                                             \
    do {                                                                                                               \
        JSVM_Status cond = theCall;                                                                                    \
        if ((cond) != JSVM_OK) {                                                                                       \
            const JSVM_ExtendedErrorInfo *info;                                                                        \
            OH_JSVM_GetLastErrorInfo(env, &info);                                                                      \
            OH_LOG_ERROR(LOG_APP, "jsvm fail file: %{public}s line: %{public}d ret = %{public}d message = %{public}s", \
                         __FILE__, __LINE__, cond, info != nullptr ? info->errorMessage : "");                         \
            return -1;                                                                                                 \
        }                                                                                                              \
    } while (0)

#define CHECK(theCall)                                                                                                 \
    do {                                                                                                               \
        JSVM_Status cond = theCall;                                                                                    \
        if ((cond) != JSVM_OK) {                                                                                       \
            OH_LOG_ERROR(LOG_APP, "jsvm fail file: %{public}s line: %{public}d ret = %{public}d", __FILE__, __LINE__,  \
                         cond);                                                                                        \
            return -1;                                                                                                 \
        }                                                                                                              \
    } while (0)

// 用于调用theCall并检查其返回值是否为JSVM_OK。
// 如果不是，则调用OH_JSVM_GetLastErrorInfo处理错误并返回retVal。
#define JSVM_CALL_BASE(env, theCall, retVal)                                                                           \
    do {                                                                                                               \
        JSVM_Status cond = theCall;                                                                                    \
        if (cond != JSVM_OK) {                                                                                         \
            const JSVM_ExtendedErrorInfo *info;                                                                        \
            OH_JSVM_GetLastErrorInfo(env, &info);                                                                      \
            OH_LOG_ERROR(LOG_APP, "jsvm fail file: %{public}s line: %{public}d ret = %{public}d message = %{public}s", \
                         __FILE__, __LINE__, cond, info != nullptr ? info->errorMessage : "");                         \
            return retVal;                                                                                             \
        }                                                                                                              \
    } while (0)

// JSVM_CALL_BASE的简化版本，返回nullptr
#define JSVM_CALL(theCall) JSVM_CALL_BASE(env, theCall, nullptr)
// [EndExclude runtime_task]

#define CHECK_COND(cond)                                                                                          \
    do {                                                                                                          \
        if (!(cond)) {                                                                                            \
            OH_LOG_ERROR(LOG_APP, "jsvm fail file: %{public}s line: %{public}d ret = false", __FILE__, __LINE__); \
            return -1;                                                                                            \
        }                                                                                                         \
    } while (0)

class Task {
public:
    virtual ~Task() = default;
    virtual void Run() = 0;
};
static map<int, deque<Task *>> g_taskQueueMap;

// 自定义Consoleinfo方法
static JSVM_Value Consoleinfo(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value args[1];
    #define MAX_LOG_LENGTH 255
    char log[MAX_LOG_LENGTH + 1] = "";
    size_t logLength = 0;
    JSVM_CALL(OH_JSVM_GetCbInfo(env, info, &argc, args, NULL, NULL));

    JSVM_CALL(OH_JSVM_GetValueStringUtf8(env, args[0], log, MAX_LOG_LENGTH, &logLength));
    log[MAX_LOG_LENGTH] = 0;
    OH_LOG_INFO(LOG_APP, "JSVM API TEST: %{public}s", log);
    return nullptr;
}

// 自定义创建Promise方法用以在JS代码中创建Promise
static JSVM_Value CreatePromise(JSVM_Env env, JSVM_CallbackInfo info)
{
    OH_LOG_INFO(LOG_APP, "JSVM API TEST: CreatePromise start");
    int envID = -1;
    // 通过当前env获取envID
    for (auto it = g_envMap.begin(); it != g_envMap.end(); ++it) {
        if (*it->second == env) {
            envID = it->first;
            break;
        }
    }
    if (envID == -1) {
        OH_LOG_ERROR(LOG_APP, "JSVM API TEST: CreatePromise envID failed");
        return nullptr;
    }
    JSVM_Value promise;
    JSVM_Deferred deferred;
    JSVM_CALL(OH_JSVM_CreatePromise(env, &deferred, &promise));
    // 设计ReadTask类用以将promise对象的deferred加入执行队列
    class ReadTask : public Task {
    public:
        ReadTask(JSVM_Env env, JSVM_Deferred deferred, int envNum) : env_(env), envID_(envNum), deferred_(deferred) {}
        void Run() override
        {
            // string str = "TEST RUN OH_JSVM_ResolveDeferred";
            int envID = 0;
            for (auto it = g_envMap.begin(); it != g_envMap.end(); ++it) {
                if (*it->second == env_) {
                    envID = it->first;
                    break;
                }
            }
            OH_LOG_INFO(LOG_APP, "JSVM API TEST: CreatePromise %{public}d", envID);
            JSVM_Value result;
            if (OH_JSVM_CreateInt32(env_, envID, &result) != JSVM_OK) {
                return;
            }
            if (OH_JSVM_ResolveDeferred(env_, deferred_, result) != JSVM_OK) {
                return;
            }
        }

    private:
        JSVM_Env env_;
        int envID_;
        JSVM_Deferred deferred_;
    };
    g_taskQueueMap[envID].push_back(new ReadTask(env, deferred, envID));
    OH_LOG_INFO(LOG_APP, "JSVM API TEST: CreatePromise end");
    return promise;
}

// 自定义Add方法
static JSVM_Value Add(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value args[2];
    JSVM_CALL(OH_JSVM_GetCbInfo(env, info, &argc, args, NULL, NULL));
    double num1 = 0;
    double num2 = 0;
    JSVM_CALL(OH_JSVM_GetValueDouble(env, args[0], &num1));
    JSVM_CALL(OH_JSVM_GetValueDouble(env, args[1], &num2));
    JSVM_Value sum = nullptr;
    JSVM_CALL(OH_JSVM_CreateDouble(env, num1 + num2, &sum));
    return sum;
}

// 自定义AssertEqual方法
static JSVM_Value AssertEqual(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 2;
    JSVM_Value args[2];
    JSVM_CALL(OH_JSVM_GetCbInfo(env, info, &argc, args, NULL, NULL));

    bool isStrictEquals = false;
    JSVM_CALL(OH_JSVM_StrictEquals(env, args[0], args[1], &isStrictEquals));

    if (isStrictEquals) {
        OH_LOG_INFO(LOG_APP, "JSVM API TEST RESULT: PASS");
    } else {
        OH_LOG_INFO(LOG_APP, "JSVM API TEST RESULT: FAILED");
    }
    return nullptr;
}

static int fromOHStringValue(JSVM_Env &env, JSVM_Value &value, std::string &result)
{
    size_t size = 0;
    CHECK_RET(OH_JSVM_GetValueStringUtf8(env, value, nullptr, 0, &size));
    char resultStr[size + 1];
    CHECK_RET(OH_JSVM_GetValueStringUtf8(env, value, resultStr, size + 1, &size));
    result = resultStr;
    return 0;
}

// 提供创建JSVM运行环境的对外接口并返回对应唯一ID
static int CreateJsCore(uint32_t *result)
{
    OH_LOG_INFO(LOG_APP, "JSVM CreateJsCore START");
    g_taskQueueMap[g_envtagNumber] = deque<Task*> {};

    if (g_aa == 0) {
        JSVM_InitOptions init_options;
        memset(&init_options, 0, sizeof(init_options));
        CHECK(OH_JSVM_Init(&init_options));
        g_aa++;
    }
    std::lock_guard<std::mutex> lock_guard(g_envMapLock);

    // 虚拟机实例
    g_vmMap[g_envtagNumber] = new JSVM_VM;
    JSVM_CreateVMOptions options;
    JSVM_VMScope vmScope;
    memset(&options, 0, sizeof(options));
    CHECK(OH_JSVM_CreateVM(&options, g_vmMap[g_envtagNumber]));
    CHECK(OH_JSVM_OpenVMScope(*g_vmMap[g_envtagNumber], &vmScope));

    // 新环境
    g_envMap[g_envtagNumber] = new JSVM_Env;
    g_callBackStructMap[g_envtagNumber] = new JSVM_CallbackStruct[4];

    // 注册用户提供的本地函数的回调函数指针和数据，通过JSVM-API暴露给js
    constexpr int kLoopCount = 4;
    for (int i = 0; i < kLoopCount; i++) {
        g_callBackStructMap[g_envtagNumber][i].data = nullptr;
    }
    const int consoleinfoIndex = 0;
    const int addIndex = 1;
    const int assertEqualIndex = 2;
    const int createPromiseIndex = 3;
    g_callBackStructMap[g_envtagNumber][consoleinfoIndex].callback = Consoleinfo;
    g_callBackStructMap[g_envtagNumber][addIndex].callback = Add;
    g_callBackStructMap[g_envtagNumber][assertEqualIndex].callback = AssertEqual;
    g_callBackStructMap[g_envtagNumber][createPromiseIndex].callback = CreatePromise;
    JSVM_PropertyDescriptor descriptors[] = {
        { "consoleinfo", NULL, &g_callBackStructMap[g_envtagNumber][consoleinfoIndex], NULL, NULL, NULL, JSVM_DEFAULT },
        { "add", NULL, &g_callBackStructMap[g_envtagNumber][addIndex], NULL, NULL, NULL, JSVM_DEFAULT },
        { "assertEqual", NULL, &g_callBackStructMap[g_envtagNumber][assertEqualIndex], NULL, NULL, NULL, JSVM_DEFAULT },
        { "createPromise", NULL, &g_callBackStructMap[g_envtagNumber][createPromiseIndex], NULL, NULL, NULL,
            JSVM_DEFAULT },
    };
    CHECK(OH_JSVM_CreateEnv(
        *g_vmMap[g_envtagNumber], sizeof(descriptors) / sizeof(descriptors[0]), descriptors, g_envMap[g_envtagNumber]));
    CHECK(OH_JSVM_CloseVMScope(*g_vmMap[g_envtagNumber], vmScope));

    OH_LOG_INFO(LOG_APP, "JSVM CreateJsCore END");
    *result = g_envtagNumber;
    g_envtagNumber++;
    return 0;
}

// 对外提供释放JSVM环境接口，通过envId释放对应环境
static int ReleaseJsCore(uint32_t coreEnvId)
{
    OH_LOG_INFO(LOG_APP, "JSVM ReleaseJsCore START");
    CHECK_COND(g_envMap.count(coreEnvId) != 0 && g_envMap[coreEnvId] != nullptr);

    std::lock_guard<std::mutex> lock_guard(g_envMapLock);

    CHECK(OH_JSVM_DestroyEnv(*g_envMap[coreEnvId]));
    g_envMap[coreEnvId] = nullptr;
    g_envMap.erase(coreEnvId);
    CHECK(OH_JSVM_DestroyVM(*g_vmMap[coreEnvId]));
    g_vmMap[coreEnvId] = nullptr;
    g_vmMap.erase(coreEnvId);
    delete[] g_callBackStructMap[coreEnvId];
    g_callBackStructMap[coreEnvId] = nullptr;
    g_callBackStructMap.erase(coreEnvId);
    g_taskQueueMap.erase(coreEnvId);

    OH_LOG_INFO(LOG_APP, "JSVM ReleaseJsCore END");
    return 0;
}

static std::mutex g_mutexLock;
// 对外提供执行JS代码接口，通过coreID在对应的JSVN环境中执行JS代码
static int EvaluateJS(uint32_t envId, const char *source, std::string &res)
{
    OH_LOG_INFO(LOG_APP, "JSVM EvaluateJS START");

    CHECK_COND(g_envMap.count(envId) != 0 && g_envMap[envId] != nullptr);

    JSVM_Env env = *g_envMap[envId];
    JSVM_VM vm = *g_vmMap[envId];
    JSVM_VMScope vmScope;
    JSVM_EnvScope envScope;
    JSVM_HandleScope handleScope;
    JSVM_Value result;

    std::lock_guard<std::mutex> lock_guard(g_mutexLock);
    {
        // 创建JSVM环境
        CHECK_RET(OH_JSVM_OpenVMScope(vm, &vmScope));
        CHECK_RET(OH_JSVM_OpenEnvScope(*g_envMap[envId], &envScope));
        CHECK_RET(OH_JSVM_OpenHandleScope(*g_envMap[envId], &handleScope));

        // 通过script调用测试函数
        JSVM_Script script;
        JSVM_Value jsSrc;
        CHECK_RET(OH_JSVM_CreateStringUtf8(env, source, JSVM_AUTO_LENGTH, &jsSrc));
        CHECK_RET(OH_JSVM_CompileScript(env, jsSrc, nullptr, 0, true, nullptr, &script));
        CHECK_RET(OH_JSVM_RunScript(env, script, &result));

        JSVM_ValueType type;
        CHECK_RET(OH_JSVM_Typeof(env, result, &type));
        OH_LOG_INFO(LOG_APP, "JSVM API TEST type: %{public}d", type);
        // Execute tasks in the current env event queue
        while (!g_taskQueueMap[envId].empty()) {
            auto task = g_taskQueueMap[envId].front();
            g_taskQueueMap[envId].pop_front();
            task->Run();
            delete task;
        }

        if (type == JSVM_STRING) {
            CHECK_COND(fromOHStringValue(env, result, res) != -1);
        } else if (type == JSVM_BOOLEAN) {
            bool ret = false;
            CHECK_RET(OH_JSVM_GetValueBool(env, result, &ret));
            ret ? res = "true" : res = "false";
        } else if (type == JSVM_NUMBER) {
            int32_t num;
            CHECK_RET(OH_JSVM_GetValueInt32(env, result, &num));
            res = std::to_string(num);
        } else if (type == JSVM_OBJECT) {
            JSVM_Value objResult;
            CHECK_RET(OH_JSVM_JsonStringify(env, result, &objResult));
            CHECK_COND(fromOHStringValue(env, objResult, res) != -1);
        }
    }
    {
        bool aal = false;
        CHECK_RET(OH_JSVM_PumpMessageLoop(*g_vmMap[envId], &aal));
        CHECK_RET(OH_JSVM_PerformMicrotaskCheckpoint(*g_vmMap[envId]));
        CHECK_RET(OH_JSVM_CloseHandleScope(*g_envMap[envId], handleScope));
        CHECK_RET(OH_JSVM_CloseEnvScope(*g_envMap[envId], envScope));
        CHECK_RET(OH_JSVM_CloseVMScope(*g_vmMap[envId], vmScope));
    }
    OH_LOG_INFO(LOG_APP, "JSVM EvaluateJS END");
    return 0;
}

static int32_t TestJSVM()
{
    const char source1[] = "{\
      let a = \"hello World\";\
      consoleinfo(a);\
      const mPromise = createPromise();\
      mPromise.then((result) => {\
        assertEqual(result, 0);\
      });\
      a;\
  };";

    const char source2[] = "{\
      let a = \"second hello\";\
      consoleinfo(a);\
      let b = add(99, 1);\
      assertEqual(100, b);\
      assertEqual(add(99, 1), 100);\
      createPromise().then((result) => {\
          assertEqual(result, 1);\
      });\
      a;\
  };";

    // 创建首个运行环境，并绑定TS回调
    uint32_t coreId1 = 0;
    CHECK_COND(CreateJsCore(&coreId1) == 0);
    OH_LOG_INFO(LOG_APP, "TEST coreId: %{public}d", coreId1);
    // 在首个运行环境中执行JS代码
    std::string result1;
    CHECK_COND(EvaluateJS(coreId1, source1, result1) == 0);
    OH_LOG_INFO(LOG_APP, "TEST evaluateJS: %{public}s", result1.c_str());

    // 创建第二个运行环境，并绑定TS回调
    uint32_t coreId2 = 0;
    CHECK_COND(CreateJsCore(&coreId2) == 0);
    OH_LOG_INFO(LOG_APP, "TEST coreId: %{public}d", coreId2);
    // 在第二个运行环境中执行JS代码
    std::string result2;
    CHECK_COND(EvaluateJS(coreId2, source2, result2) == 0);
    OH_LOG_INFO(LOG_APP, "TEST evaluateJS: %{public}s", result2.c_str());

    // 释放首个运行环境
    CHECK_COND(ReleaseJsCore(coreId1) == 0);
    // 释放第二个运行环境
    CHECK_COND(ReleaseJsCore(coreId2) == 0);
    OH_LOG_INFO(LOG_APP, "Test NAPI end");

    return 0;
}
// [End runtime_task]

static napi_value RunTest(napi_env env, napi_callback_info info)
{
    TestJSVM();
    return nullptr;
}

// 模块注册信息，供arkts侧调用
EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {{"runTest", nullptr, RunTest, nullptr, nullptr, nullptr, napi_default, nullptr}};
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "runtimetask",
    .nm_priv = ((void *)0),
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void) { napi_module_register(&demoModule); }
