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

#ifndef NDK_QOS_BENCH_H
#define NDK_QOS_BENCH_H

#include "napi/native_api.h"

namespace QosBench {
napi_value RunBenchmarkAsync(napi_env env, napi_callback_info info);

napi_value RunConcurrentAsync(napi_env env, napi_callback_info info);

napi_value CompareLevels(napi_env env, napi_callback_info info);

napi_value GetRunSummary(napi_env env, napi_callback_info info);

// resetRunSummary() -> { code, runCount }
napi_value ResetRunSummary(napi_env env, napi_callback_info info);
} // namespace QosBench

#endif // NDK_QOS_BENCH_H
