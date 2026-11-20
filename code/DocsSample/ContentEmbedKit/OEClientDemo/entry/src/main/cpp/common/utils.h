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

#ifndef OEDEMO_UTILS_H
#define OEDEMO_UTILS_H

#include <cstdint>
#include <string>

#include <napi/native_api.h>
#include <hilog/log.h>

// Reads a UTF-8 string from a napi_value. Returns a heap-allocated, NUL-terminated
// buffer owned by the caller (must delete[] it), or nullptr on failure.
char* GetStringParam(napi_env env, napi_value value);

#endif //OEDEMO_UTILS_H
