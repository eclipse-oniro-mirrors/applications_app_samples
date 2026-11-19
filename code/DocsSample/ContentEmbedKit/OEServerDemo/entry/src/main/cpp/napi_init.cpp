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

#include "napi/native_api.h"
#include <ContentEmbedKit/content_embed/content_embed_common.h>
#include <cstdint>
#include <vector>

extern "C" {
int32_t NAPI_DocumentSave(const char* id);
int32_t NAPI_DocumentUpdate(const char* id);
int32_t NAPI_DocumentStart(const char* id);
int32_t NAPI_DocumentStop(const char* id);
int32_t NAPI_IsObjectAlive(const char* id);
}

static napi_value DispatchById(napi_env env, napi_callback_info info, int32_t (*fn)(const char*))
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    if (argc < 1) {
        napi_value result;
        napi_create_int32(env, CE_ERR_PARAM_INVALID, &result);
        return result;
    }
    size_t len = 0;
    if (napi_get_value_string_utf8(env, args[0], nullptr, 0, &len) != napi_ok) {
        napi_value result;
        napi_create_int32(env, CE_ERR_PARAM_INVALID, &result);
        return result;
    }
    std::vector<char> buf(len + 1);
    size_t written = 0;
    if (napi_get_value_string_utf8(env, args[0], buf.data(), buf.size(), &written) != napi_ok) {
        napi_value result;
        napi_create_int32(env, CE_ERR_PARAM_INVALID, &result);
        return result;
    }
    buf[written] = '\0';

    int32_t code = fn(buf.data());
    napi_value result;
    napi_create_int32(env, code, &result);
    return result;
}

static napi_value Save(napi_env env, napi_callback_info info)
{
    return DispatchById(env, info, NAPI_DocumentSave);
}

static napi_value Update(napi_env env, napi_callback_info info)
{
    return DispatchById(env, info, NAPI_DocumentUpdate);
}

static napi_value Start(napi_env env, napi_callback_info info)
{
    return DispatchById(env, info, NAPI_DocumentStart);
}

static napi_value Stop(napi_env env, napi_callback_info info)
{
    return DispatchById(env, info, NAPI_DocumentStop);
}

static napi_value IsObjectAlive(napi_env env, napi_callback_info info)
{
    return DispatchById(env, info, NAPI_IsObjectAlive);
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"save", nullptr, Save, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"update", nullptr, Update, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"start", nullptr, Start, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"stop", nullptr, Stop, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isObjectAlive", nullptr, IsObjectAlive, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
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
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
