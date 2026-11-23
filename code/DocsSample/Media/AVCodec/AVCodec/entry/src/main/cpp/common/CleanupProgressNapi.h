/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef AVCODEC_CLEANUP_PROGRESS_NAPI_H
#define AVCODEC_CLEANUP_PROGRESS_NAPI_H
#include <napi/native_api.h>
#include "CleanupProgress.h"

inline bool SetCleanupProgress(napi_env env, napi_value parent, const CleanupProgressInfo &info)
{
    napi_value object = nullptr;
    napi_value stage = nullptr;
    napi_value active = nullptr;
    napi_value elapsed = nullptr;
    napi_value total = nullptr;
    napi_value revision = nullptr;
    return napi_create_object(env, &object) == napi_ok &&
        napi_create_string_utf8(env, info.stage.c_str(), NAPI_AUTO_LENGTH, &stage) == napi_ok &&
        napi_get_boolean(env, info.active, &active) == napi_ok &&
        napi_create_int64(env, info.elapsedMs, &elapsed) == napi_ok &&
        napi_create_int64(env, info.totalMs, &total) == napi_ok &&
        napi_create_int64(env, static_cast<int64_t>(info.revision), &revision) == napi_ok &&
        napi_set_named_property(env, object, "stage", stage) == napi_ok &&
        napi_set_named_property(env, object, "active", active) == napi_ok &&
        napi_set_named_property(env, object, "elapsedMs", elapsed) == napi_ok &&
        napi_set_named_property(env, object, "totalMs", total) == napi_ok &&
        napi_set_named_property(env, object, "revision", revision) == napi_ok &&
        napi_set_named_property(env, parent, "cleanupProgress", object) == napi_ok;
}
#endif
