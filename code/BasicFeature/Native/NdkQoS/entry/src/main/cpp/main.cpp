/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

#include <hilog/log.h>
#include "napi/native_api.h"

#include "qos/qos.h"

#include "qos_bench.h"
#include "qos_core.h"
#include "qos_history.h"
#include "qos_napi_util.h"
#include "qos_sysinfo.h"

namespace {
const unsigned int LOG_PRINT_DOMAIN = 0xFF00;
constexpr int INVALID_RESULT = QosCore::INVALID_RESULT;
constexpr double INVALID_DURATION = QosCore::INVALID_DURATION;

struct QosAsyncContext {
    napi_async_work work = nullptr;
    napi_deferred deferred = nullptr;
    int level = QosCore::MIN_LEVEL;
    double duration = INVALID_DURATION;
};

void ExecuteQosAsync(napi_env env, void* data)
{
    auto* context = static_cast<QosAsyncContext*>(data);
    if (context == nullptr) {
        return;
    }
    context->duration = QosCore::RunWithLevel(context->level);
}

napi_value RejectWithMessage(napi_env env, napi_deferred deferred, const char* message)
{
    napi_value text = QosNapi::CreateString(env, message);
    napi_value error = nullptr;
    napi_create_error(env, nullptr, text, &error);
    napi_reject_deferred(env, deferred, error);
    napi_value undefined = nullptr;
    napi_get_undefined(env, &undefined);
    return undefined;
}

void CompleteQosAsync(napi_env env, napi_status status, void* data)
{
    auto* context = static_cast<QosAsyncContext*>(data);
    if (context == nullptr) {
        return;
    }
    if (status == napi_ok) {
        napi_resolve_deferred(env, context->deferred, QosNapi::CreateNumber(env, context->duration));
    } else {
        RejectWithMessage(env, context->deferred, "qos async work is cancelled");
    }
    napi_delete_async_work(env, context->work);
    delete context;
}

napi_value HighQosCalculate(napi_env env, napi_callback_info info)
{
    return QosNapi::CreateNumber(env, QosCore::RunWithLevel(QosCore::MAX_LEVEL));
}

napi_value LowQosCalculate(napi_env env, napi_callback_info info)
{
    return QosNapi::CreateNumber(env, QosCore::RunWithLevel(QosCore::MIN_LEVEL));
}

napi_value UseQos(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    int level = QosCore::MIN_LEVEL;
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < 1 ||
        !QosNapi::ReadIntArg(env, args[0], &level)) {
        return QosNapi::CreateNumber(env, INVALID_DURATION);
    }
    if (level < QosCore::MIN_LEVEL || level > QosCore::MAX_LEVEL) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "QoS", "invalid qos level: %{public}d", level);
        return QosNapi::CreateNumber(env, INVALID_DURATION);
    }
    return QosNapi::CreateNumber(env, QosCore::RunWithLevel(level));
}

napi_value UseQosAsync(napi_env env, napi_callback_info info)
{
    napi_value promise = nullptr;
    napi_deferred deferred = nullptr;
    napi_create_promise(env, &deferred, &promise);

    size_t argc = 1;
    napi_value args[1] = {nullptr};
    int level = QosCore::MIN_LEVEL;
    bool valid = (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) == napi_ok) && argc >= 1 &&
        QosNapi::ReadIntArg(env, args[0], &level) && level >= QosCore::MIN_LEVEL && level <= QosCore::MAX_LEVEL;
    if (!valid) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_PRINT_DOMAIN, "QoS", "async task rejected: invalid qos level");
        RejectWithMessage(env, deferred, "invalid qos level");
        return promise;
    }

    auto* context = new QosAsyncContext();
    context->level = level;
    context->deferred = deferred;
    napi_value resourceName = QosNapi::CreateString(env, "QosAsyncWork");
    if (napi_create_async_work(env, nullptr, resourceName, ExecuteQosAsync, CompleteQosAsync, context,
        &context->work) != napi_ok) {
        RejectWithMessage(env, deferred, "create async work failed");
        delete context;
        return promise;
    }
    if (napi_queue_async_work(env, context->work) != napi_ok) {
        napi_delete_async_work(env, context->work);
        RejectWithMessage(env, deferred, "queue async work failed");
        delete context;
        return promise;
    }
    return promise;
}

napi_value GetLastQosInfo(napi_env env, napi_callback_info info)
{
    QosCore::RunInfo snapshot = QosCore::LastRunInfo();
    napi_value object = nullptr;
    napi_create_object(env, &object);
    QosNapi::SetNamedInt(env, object, "setResult", snapshot.setResult);
    QosNapi::SetNamedInt(env, object, "queryLevel", snapshot.queryLevel);
    QosNapi::SetNamedInt(env, object, "resetResult", snapshot.resetResult);
    QosNapi::SetNamedInt(env, object, "bindResult", snapshot.bindResult);
    QosNapi::SetNamedDouble(env, object, "duration", snapshot.duration);
    return object;
}

napi_value GetLevelRange(napi_env env, napi_callback_info info)
{
    napi_value range = nullptr;
    napi_create_object(env, &range);
    QosNapi::SetNamedInt(env, range, "minLevel", QosCore::MIN_LEVEL);
    QosNapi::SetNamedInt(env, range, "maxLevel", QosCore::MAX_LEVEL);
    QosNapi::SetNamedInt(env, range, "levelCount", QosCore::LEVEL_COUNT);
    QosNapi::SetNamedInt(env, range, "invalidResult", INVALID_RESULT);
    QosNapi::SetNamedDouble(env, range, "invalidDuration", INVALID_DURATION);
    return range;
}
} // namespace

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"useHighQos", nullptr, HighQosCalculate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"useLowQos", nullptr, LowQosCalculate, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"useQos", nullptr, UseQos, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"useQosAsync", nullptr, UseQosAsync, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getLastQosInfo", nullptr, GetLastQosInfo, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getLevelRange", nullptr, GetLevelRange, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"runLevelBenchmarkAsync", nullptr, QosBench::RunBenchmarkAsync, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"runConcurrentAsync", nullptr, QosBench::RunConcurrentAsync, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"compareLevels", nullptr, QosBench::CompareLevels, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getRunSummary", nullptr, QosBench::GetRunSummary, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"resetRunSummary", nullptr, QosBench::ResetRunSummary, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getCpuTopology", nullptr, QosSysInfo::GetCpuTopology, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"bindCurrentThread", nullptr, QosSysInfo::BindCurrentThread, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"resetThreadAffinity", nullptr, QosSysInfo::ResetThreadAffinity, nullptr, nullptr, nullptr, napi_default,
            nullptr},
        {"appendRunRecord", nullptr, QosHistory::AppendRunRecord, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"readRunRecords", nullptr, QosHistory::ReadRunRecords, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"clearRunRecords", nullptr, QosHistory::ClearRunRecords, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getRecordStats", nullptr, QosHistory::GetRecordStats, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"parseRunRecordLine", nullptr, QosHistory::ParseRunRecordLine, nullptr, nullptr, nullptr, napi_default,
            nullptr}};
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
