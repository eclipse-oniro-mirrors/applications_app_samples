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

#include "napi/native_api.h"
#include <js_native_api.h>
#include <string>

#include "drm_sample.h"

namespace {
constexpr size_t NAME_BUF_LEN = 128;
constexpr size_t MIME_BUF_LEN = 64;

std::string GetStringArg(napi_env env, napi_value value)
{
    char buf[NAME_BUF_LEN] = {0};
    size_t len = 0;
    napi_get_value_string_utf8(env, value, buf, NAME_BUF_LEN, &len);
    return std::string(buf, len);
}

napi_value CreateString(napi_env env, const std::string &str)
{
    napi_value result = nullptr;
    napi_create_string_utf8(env, str.c_str(), str.length(), &result);
    return result;
}

napi_value IsSupported(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string name = GetStringArg(env, args[0]);

    bool supported = IsMediaKeySystemSupported(name.c_str());

    napi_value result = nullptr;
    napi_get_boolean(env, supported, &result);
    return result;
}

napi_value MediaKeySystemFlowWrapper(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string name = GetStringArg(env, args[0]);

    std::string log = MediaKeySystemFlow(name.c_str());
    return CreateString(env, log);
}

napi_value MediaKeySessionFlowWrapper(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string name = GetStringArg(env, args[0]);
    char mimeBuf[MIME_BUF_LEN] = {0};
    size_t mimeLen = 0;
    napi_get_value_string_utf8(env, args[1], mimeBuf, MIME_BUF_LEN, &mimeLen);

    std::string log = MediaKeySessionFlow(name.c_str(), mimeBuf);
    return CreateString(env, log);
}

napi_value GetMediaKeySystemsWrapper(napi_env env, napi_callback_info info)
{
    std::string log = GetMediaKeySystemsFlow();
    return CreateString(env, log);
}

napi_value IsSupported3Wrapper(napi_env env, napi_callback_info info)
{
    size_t argc = 2;
    napi_value args[2] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    std::string name = GetStringArg(env, args[0]);
    char mimeBuf[MIME_BUF_LEN] = {0};
    size_t mimeLen = 0;
    napi_get_value_string_utf8(env, args[1], mimeBuf, MIME_BUF_LEN, &mimeLen);

    std::string log = IsSupported3Flow(name.c_str(), mimeBuf);
    return CreateString(env, log);
}
} // namespace

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        {"isSupported", nullptr, IsSupported, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mediaKeySystemFlow", nullptr, MediaKeySystemFlowWrapper, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"mediaKeySessionFlow", nullptr, MediaKeySessionFlowWrapper, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"getMediaKeySystems", nullptr, GetMediaKeySystemsWrapper, nullptr, nullptr, nullptr, napi_default, nullptr},
        {"isSupported3", nullptr, IsSupported3Wrapper, nullptr, nullptr, nullptr, napi_default, nullptr},
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module drmSampleModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "libdrmsample",
    .nm_priv = nullptr,
    .reserved = {0},
};

extern "C" __attribute__((constructor)) void RegisterDrmSampleModule(void)
{
    napi_module_register(&drmSampleModule);
}
