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

#ifndef CLOUDDISKDEMO_CAPI_UTILS_H
#define CLOUDDISKDEMO_CAPI_UTILS_H

#include <cstdlib>
#include <cstring>
#include <napi/native_api.h>
#include "common/logger_common.h"

char* GetStringParam(napi_env env, napi_value value);

char* GetStringParam(napi_env env, napi_callback_info info, int32_t index = 0);

int64_t GetNumberParam(napi_env env, napi_value value);

int64_t GetNumberParam(napi_env env, napi_callback_info info, int32_t index = 0);

char* CharToHex(char* input);

#endif // CLOUDDISKDEMO_CAPI_UTILS_H
