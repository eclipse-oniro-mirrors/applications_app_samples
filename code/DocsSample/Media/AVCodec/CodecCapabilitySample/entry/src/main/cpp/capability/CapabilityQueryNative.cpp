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

#include <cstdint>
#include <string>
#include "CapabilityQuery.h"
#include "CodecList.h"
#include "SampleLog.h"
#include "napi/native_api.h"

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0xFF01
#define LOG_TAG "CapabilityNative"

namespace {
constexpr size_t NAPI_ARG_COUNT_TWO = 2;

struct ScenarioContext {
    napi_env env = nullptr;
    napi_async_work asyncWork = nullptr;
    napi_deferred deferred = nullptr;
    int32_t scenarioId = -1;
    std::string result;
};

napi_value CreateStringValue(napi_env env, const std::string &value)
{
    napi_value result = nullptr;
    napi_create_string_utf8(env, value.c_str(), value.size(), &result);
    return result;
}
} // namespace

static napi_value GetCodecList(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t category = 0;
    if (argc < 1 || napi_get_value_int32(env, args[0], &category) != napi_ok) {
        napi_throw_type_error(env, nullptr, "Expected a codec category argument.");
        return nullptr;
    }
    return CreateStringValue(env, CodecList::GetCodecListJson(category));
}

static napi_value GetCodecDetail(napi_env env, napi_callback_info info)
{
    size_t argc = NAPI_ARG_COUNT_TWO;
    napi_value args[NAPI_ARG_COUNT_TWO] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t category = 0;
    char name[256] = {0};
    size_t nameLength = 0;
    if (argc < NAPI_ARG_COUNT_TWO || napi_get_value_int32(env, args[0], &category) != napi_ok ||
        napi_get_value_string_utf8(env, args[1], name, sizeof(name), &nameLength) != napi_ok) {
        napi_throw_type_error(env, nullptr, "Expected category and codec name arguments.");
        return nullptr;
    }
    return CreateStringValue(env, CodecList::GetCodecDetail(category, std::string(name)));
}

static void ExecuteScenario(napi_env env, void *data)
{
    auto *context = static_cast<ScenarioContext *>(data);
    context->result = CapabilityQuery::RunScenario(context->scenarioId);
}

static void CompleteScenario(napi_env env, napi_status status, void *data)
{
    auto *context = static_cast<ScenarioContext *>(data);
    napi_value result = CreateStringValue(env, context->result);
    if (status == napi_ok && result != nullptr) {
        napi_resolve_deferred(env, context->deferred, result);
    } else {
        napi_value errorCode = nullptr;
        napi_create_int32(env, -1, &errorCode);
        napi_reject_deferred(env, context->deferred, errorCode);
    }
    if (context->asyncWork != nullptr) {
        napi_delete_async_work(env, context->asyncWork);
    }
    delete context;
}

static napi_value RunScenario(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int32_t scenarioId = -1;
    if (argc < 1 || napi_get_value_int32(env, args[0], &scenarioId) != napi_ok) {
        napi_throw_type_error(env, nullptr, "Expected a scenario id argument.");
        return nullptr;
    }
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_create_promise(env, &deferred, &promise);
    auto *context = new ScenarioContext();
    context->env = env;
    context->deferred = deferred;
    context->scenarioId = scenarioId;

    napi_value resourceName = nullptr;
    napi_create_string_utf8(env, "runScenario", NAPI_AUTO_LENGTH, &resourceName);
    napi_status status = napi_create_async_work(env, nullptr, resourceName, ExecuteScenario, CompleteScenario,
        context, &context->asyncWork);
    if (status == napi_ok) {
        status = napi_queue_async_work(env, context->asyncWork);
    }
    if (status != napi_ok) {
        context->result = "场景任务提交失败。";
        CompleteScenario(env, napi_ok, context);
    }
    return promise;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"getCodecList", nullptr, GetCodecList, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getCodecDetail", nullptr, GetCodecDetail, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"runScenario", nullptr, RunScenario, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module CapabilityModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "capability",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterCapabilityModule(void)
{
    napi_module_register(&CapabilityModule);
}
