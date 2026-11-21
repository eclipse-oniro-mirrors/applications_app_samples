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

#include "PlayerNapiParser.h"
#include <cmath>
#include <limits>
#include <native_buffer/buffer_common.h>

namespace {
constexpr double MAX_SAFE_JS_INTEGER = 9007199254740991.0;

bool ReadArgument(napi_env env, napi_callback_info info, napi_value &argument)
{
    size_t count = 2;
    napi_value args[2] = {nullptr, nullptr};
    if (napi_get_cb_info(env, info, &count, args, nullptr, nullptr) != napi_ok || count != 1) {
        napi_throw_type_error(env, nullptr, "Exactly one control argument is required");
        return false;
    }
    argument = args[0];
    return true;
}

bool ReadNumber(napi_env env, napi_callback_info info, double &number)
{
    napi_value argument = nullptr;
    double parsed = 0;
    if (!ReadArgument(env, info, argument)) { return false; }
    if (napi_get_value_double(env, argument, &parsed) != napi_ok) {
        napi_throw_type_error(env, nullptr, "Control argument must be a number");
        return false;
    }
    if (!std::isfinite(parsed)) {
        napi_throw_range_error(env, nullptr, "Control argument must be finite");
        return false;
    }
    number = parsed;
    return true;
}

bool ReadInteger(napi_env env, napi_callback_info info, double maximum, double &number)
{
    if (!ReadNumber(env, info, number)) { return false; }
    if (number < 0 || number > maximum || std::trunc(number) != number) {
        napi_throw_range_error(env, nullptr, "Control argument must be a nonnegative integer in range");
        return false;
    }
    return true;
}
} // namespace

bool PlayerNapiParser::ParseSpeed(napi_env env, napi_callback_info info, double &speed)
{
    double number = 0;
    if (!ReadNumber(env, info, number)) { return false; }
    if (number <= 0 || number > std::numeric_limits<float>::max() || static_cast<float>(number) == 0) {
        napi_throw_range_error(env, nullptr, "Playback speed must be positive and representable");
        return false;
    }
    speed = number;
    return true;
}

bool PlayerNapiParser::ParseTransform(napi_env env, napi_callback_info info, int32_t &transform)
{
    double number = 0;
    if (!ReadInteger(env, info, NATIVEBUFFER_FLIP_V_ROT270, number)) { return false; }
    transform = static_cast<int32_t>(number);
    return true;
}

bool PlayerNapiParser::ParseVolume(napi_env env, napi_callback_info info, double &volume)
{
    double number = 0;
    if (!ReadNumber(env, info, number)) { return false; }
    if (number < 0 || number > 1) {
        napi_throw_range_error(env, nullptr, "Volume must be in [0, 1]");
        return false;
    }
    volume = number;
    return true;
}

bool PlayerNapiParser::ParseEnabled(napi_env env, napi_callback_info info, bool &enabled)
{
    napi_value argument = nullptr;
    bool parsed = false;
    if (!ReadArgument(env, info, argument)) { return false; }
    if (napi_get_value_bool(env, argument, &parsed) != napi_ok) {
        napi_throw_type_error(env, nullptr, "Control argument must be a boolean");
        return false;
    }
    enabled = parsed;
    return true;
}

bool PlayerNapiParser::ParseThermalRatio(napi_env env, napi_callback_info info, double &ratio)
{
    double number = 0;
    if (!ReadNumber(env, info, number)) { return false; }
    if (number <= 0 || number > 1) {
        napi_throw_range_error(env, nullptr, "Frame retention ratio must be in (0, 1]");
        return false;
    }
    ratio = number;
    return true;
}

bool PlayerNapiParser::ParseTrackIndex(napi_env env, napi_callback_info info, int32_t &index)
{
    double number = 0;
    if (!ReadInteger(env, info, std::numeric_limits<int32_t>::max(), number)) { return false; }
    index = static_cast<int32_t>(number);
    return true;
}

bool PlayerNapiParser::ParseSeekPosition(napi_env env, napi_callback_info info, int64_t &positionUs)
{
    double number = 0;
    if (!ReadInteger(env, info, MAX_SAFE_JS_INTEGER, number)) { return false; }
    positionUs = static_cast<int64_t>(number);
    return true;
}
