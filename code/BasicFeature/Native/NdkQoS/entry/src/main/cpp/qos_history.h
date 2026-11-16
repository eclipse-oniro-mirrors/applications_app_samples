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

#ifndef NDK_QOS_HISTORY_H
#define NDK_QOS_HISTORY_H

#include "napi/native_api.h"

namespace QosHistory {
// appendRunRecord(dirPath, level, duration, setResult, queryLevel, resetResult, bindResult)
//   -> { code, count, capacity, dropped }
napi_value AppendRunRecord(napi_env env, napi_callback_info info);

napi_value ReadRunRecords(napi_env env, napi_callback_info info);

// clearRunRecords(dirPath) -> { code, removed }
napi_value ClearRunRecords(napi_env env, napi_callback_info info);

// getRecordStats(dirPath)
//   -> { code, total, successCount, failureCount, avgDuration, minDuration, maxDuration, levelCounts[] }
napi_value GetRecordStats(napi_env env, napi_callback_info info);

// parseRunRecordLine(text) -> { code, level, duration, setResult, queryLevel, resetResult, bindResult }
napi_value ParseRunRecordLine(napi_env env, napi_callback_info info);
} // namespace QosHistory

#endif // NDK_QOS_HISTORY_H
