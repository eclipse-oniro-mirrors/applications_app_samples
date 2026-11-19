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

#ifndef QOS_SYSINFO_H
#define QOS_SYSINFO_H

#include "napi/native_api.h"

namespace QosSysInfo {
// getCpuTopology() -> { code, cpuCount, selectedCpu, affinityCount, affinityCpus }
napi_value GetCpuTopology(napi_env env, napi_callback_info info);

// bindCurrentThread(cpu) -> { code, cpu, bindResult, affinityCount, affinityCpus }
napi_value BindCurrentThread(napi_env env, napi_callback_info info);

// resetThreadAffinity() -> { code, bindResult, affinityCount, affinityCpus }
napi_value ResetThreadAffinity(napi_env env, napi_callback_info info);
} // namespace QosSysInfo

#endif // QOS_SYSINFO_H
