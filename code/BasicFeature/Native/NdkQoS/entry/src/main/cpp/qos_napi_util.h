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

#ifndef NDK_QOS_NAPI_UTIL_H
#define NDK_QOS_NAPI_UTIL_H

#include <string>

#include "napi/native_api.h"

namespace QosNapi {
constexpr int CODE_OK = 0;
constexpr int CODE_INVALID_ARG = 401;

inline napi_value CreateInt(napi_env env, int value)
{
    napi_value result = nullptr;
    napi_create_int32(env, value, &result);
    return result;
}

inline napi_value CreateNumber(napi_env env, double value)
{
    napi_value result = nullptr;
    napi_create_double(env, value, &result);
    return result;
}

inline napi_value CreateBoolean(napi_env env, bool value)
{
    napi_value result = nullptr;
    napi_get_boolean(env, value, &result);
    return result;
}

inline napi_value CreateString(napi_env env, const std::string& value)
{
    napi_value result = nullptr;
    napi_create_string_utf8(env, value.c_str(), value.size(), &result);
    return result;
}

inline void SetNamedInt(napi_env env, napi_value object, const char* name, int value)
{
    napi_set_named_property(env, object, name, CreateInt(env, value));
}

inline void SetNamedDouble(napi_env env, napi_value object, const char* name, double value)
{
    napi_set_named_property(env, object, name, CreateNumber(env, value));
}

inline void SetNamedString(napi_env env, napi_value object, const char* name, const std::string& value)
{
    napi_set_named_property(env, object, name, CreateString(env, value));
}

inline bool ReadIntArg(napi_env env, napi_value value, int* out)
{
    napi_valuetype type = napi_undefined;
    if (napi_typeof(env, value, &type) != napi_ok || type != napi_number || out == nullptr) {
        return false;
    }
    double raw = 0.0;
    if (napi_get_value_double(env, value, &raw) != napi_ok) {
        return false;
    }
    if (!(raw >= -2147483648.0 && raw <= 2147483647.0)) {
        return false;
    }
    int converted = static_cast<int>(raw);
    if (static_cast<double>(converted) != raw) {
        return false;
    }
    *out = converted;
    return true;
}

inline bool ReadDoubleArg(napi_env env, napi_value value, double* out)
{
    napi_valuetype type = napi_undefined;
    if (napi_typeof(env, value, &type) != napi_ok || type != napi_number || out == nullptr) {
        return false;
    }
    return napi_get_value_double(env, value, out) == napi_ok;
}

inline bool ReadStringArg(napi_env env, napi_value value, std::string* out)
{
    napi_valuetype type = napi_undefined;
    if (napi_typeof(env, value, &type) != napi_ok || type != napi_string || out == nullptr) {
        return false;
    }
    size_t length = 0;
    if (napi_get_value_string_utf8(env, value, nullptr, 0, &length) != napi_ok) {
        return false;
    }
    std::string buffer(length, '\0');
    size_t copied = 0;
    if (napi_get_value_string_utf8(env, value, &buffer[0], length + 1, &copied) != napi_ok) {
        return false;
    }
    *out = buffer.substr(0, copied);
    return true;
}
} // namespace QosNapi

#endif // NDK_QOS_NAPI_UTIL_H
