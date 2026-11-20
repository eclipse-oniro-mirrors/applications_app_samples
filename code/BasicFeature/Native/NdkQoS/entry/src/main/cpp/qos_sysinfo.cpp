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

#include "qos_sysinfo.h"

#include <sched.h>

#include "qos_core.h"
#include "qos_napi_util.h"

namespace {
constexpr int MAX_AFFINITY_CPUS = 64;
constexpr int INVALID_RESULT = QosCore::INVALID_RESULT;

int ReadAffinity(int* cpus, int capacity)
{
    return QosCore::ReadThreadAffinity(cpus, capacity);
}

void WriteAffinity(napi_env env, napi_value object, const int* cpus, int count)
{
    if (count < 0) {
        count = 0;
    }
    napi_value array = nullptr;
    napi_create_array_with_length(env, static_cast<size_t>(count), &array);
    for (int index = 0; index < count; index++) {
        napi_set_element(env, array, static_cast<uint32_t>(index), QosNapi::CreateInt(env, cpus[index]));
    }
    napi_set_named_property(env, object, "affinityCpus", array);
    QosNapi::SetNamedInt(env, object, "affinityCount", count);
}
} // namespace

namespace QosSysInfo {
napi_value GetCpuTopology(napi_env env, napi_callback_info info)
{
    int cpus[MAX_AFFINITY_CPUS] = {0};
    int count = ReadAffinity(cpus, MAX_AFFINITY_CPUS);

    napi_value report = nullptr;
    napi_create_object(env, &report);
    QosNapi::SetNamedInt(env, report, "code", count >= 0 ? QosNapi::CODE_OK : QosNapi::CODE_INVALID_ARG);
    QosNapi::SetNamedInt(env, report, "cpuCount", QosCore::CpuCount());
    QosNapi::SetNamedInt(env, report, "selectedCpu", QosCore::SelectedCpu());
    WriteAffinity(env, report, cpus, count);
    return report;
}

napi_value BindCurrentThread(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_value report = nullptr;
    napi_create_object(env, &report);

    int cpu = 0;
    int cpuCount = QosCore::CpuCount();
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc < 1 ||
        !QosNapi::ReadIntArg(env, args[0], &cpu) || cpu < 0 || cpu >= cpuCount) {
        QosNapi::SetNamedInt(env, report, "code", QosNapi::CODE_INVALID_ARG);
        QosNapi::SetNamedInt(env, report, "cpu", INVALID_RESULT);
        QosNapi::SetNamedInt(env, report, "bindResult", INVALID_RESULT);
        WriteAffinity(env, report, nullptr, 0);
        return report;
    }

    int bindResult = QosCore::BindCurrentThread(cpu);
    int cpus[MAX_AFFINITY_CPUS] = {0};
    int count = ReadAffinity(cpus, MAX_AFFINITY_CPUS);

    QosNapi::SetNamedInt(env, report, "code", bindResult == 0 ? QosNapi::CODE_OK : QosNapi::CODE_INVALID_ARG);
    QosNapi::SetNamedInt(env, report, "cpu", cpu);
    QosNapi::SetNamedInt(env, report, "bindResult", bindResult);
    WriteAffinity(env, report, cpus, count);
    return report;
}

napi_value ResetThreadAffinity(napi_env env, napi_callback_info info)
{
    cpu_set_t cpuMask;
    CPU_ZERO(&cpuMask);
    int cpuCount = QosCore::CpuCount();
    for (int cpu = 0; cpu < cpuCount && cpu < CPU_SETSIZE; cpu++) {
        CPU_SET(cpu, &cpuMask);
    }
    int bindResult = sched_setaffinity(0, sizeof(cpuMask), &cpuMask);

    int cpus[MAX_AFFINITY_CPUS] = {0};
    int count = ReadAffinity(cpus, MAX_AFFINITY_CPUS);

    napi_value report = nullptr;
    napi_create_object(env, &report);
    QosNapi::SetNamedInt(env, report, "code", bindResult == 0 ? QosNapi::CODE_OK : QosNapi::CODE_INVALID_ARG);
    QosNapi::SetNamedInt(env, report, "bindResult", bindResult);
    WriteAffinity(env, report, cpus, count);
    return report;
}
} // namespace QosSysInfo
