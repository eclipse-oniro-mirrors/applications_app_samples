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

#include <algorithm>
#include "TestCheck.h"
#include <cstdlib>
#include <iostream>
#include <limits>
#include <vector>
#include "sample/player/napi/PlayerNapiParser.h"

struct napi_value__ {
    napi_valuetype type;
    double number;
    bool flag;
};
struct napi_callback_info__ {
    std::vector<napi_value> args;
};

namespace {
constexpr double UNCHANGED_NUMBER = 7.0;
constexpr double PLAYBACK_SPEED = 1.5;
constexpr double RETENTION_RATIO = 0.3;
constexpr double FRACTIONAL_POSITION = 0.5;
constexpr double UNSAFE_INTEGER = 9007199254740992.0;
constexpr int32_t TRACK_INDEX = 2;
constexpr int32_t UNKNOWN_TRANSFORM = 12;
int g_errors = 0;
using TestSupport::Require;

void TestNumericControls()
{
    napi_value__ value { napi_number, 1, false };
    napi_callback_info__ info { { &value } };
    double speed = UNCHANGED_NUMBER;
    const std::vector<double> invalidSpeeds { 0.0, -1.0, std::numeric_limits<double>::quiet_NaN(),
        std::numeric_limits<double>::infinity(), std::numeric_limits<double>::max(),
        std::numeric_limits<double>::denorm_min() };
    for (double invalid : invalidSpeeds) {
        value.number = invalid;
        Require(!PlayerNapiParser::ParseSpeed(nullptr, &info, speed) && speed == UNCHANGED_NUMBER,
            "Invalid speed never reaches the player");
    }
    value.number = PLAYBACK_SPEED;
    Require(PlayerNapiParser::ParseSpeed(nullptr, &info, speed) && speed == PLAYBACK_SPEED, "Accept finite speed");
    double ratio = UNCHANGED_NUMBER;
    Require(!PlayerNapiParser::ParseThermalRatio(nullptr, &info, ratio) && ratio == UNCHANGED_NUMBER,
        "Reject ratio above one");
    value.number = RETENTION_RATIO;
    Require(PlayerNapiParser::ParseThermalRatio(nullptr, &info, ratio) && ratio == RETENTION_RATIO,
        "Accept retention ratio");
    double volume = UNCHANGED_NUMBER;
    value.number = std::numeric_limits<double>::quiet_NaN();
    Require(!PlayerNapiParser::ParseVolume(nullptr, &info, volume) && volume == UNCHANGED_NUMBER, "Reject NaN volume");
    value.number = 0;
    Require(PlayerNapiParser::ParseVolume(nullptr, &info, volume) && volume == 0, "Accept mute");
}

void TestIntegerControls()
{
    napi_value__ value { napi_number, 0, false };
    napi_callback_info__ info { { &value } };
    int32_t index = -1;
    int64_t position = -1;
    for (double invalid : { -1.0, FRACTIONAL_POSITION, UNSAFE_INTEGER }) {
        value.number = invalid;
        Require(!PlayerNapiParser::ParseSeekPosition(nullptr, &info, position) && position == -1,
            "Reject negative, fractional and unsafe Seek positions");
        Require(
            !PlayerNapiParser::ParseTrackIndex(nullptr, &info, index) && index == -1, "Reject invalid track indices");
    }
    value.number = TRACK_INDEX;
    Require(PlayerNapiParser::ParseTrackIndex(nullptr, &info, index) && index == TRACK_INDEX, "Accept track index");
    Require(PlayerNapiParser::ParseTransform(nullptr, &info, index) && index == TRACK_INDEX, "Accept transform");
    value.number = UNKNOWN_TRANSFORM;
    Require(
        !PlayerNapiParser::ParseTransform(nullptr, &info, index) && index == TRACK_INDEX, "Reject unknown transform");
}

void TestTypesAndArity()
{
    napi_value__ value { napi_string, 1, true };
    napi_callback_info__ info { { &value } };
    double speed = UNCHANGED_NUMBER;
    bool enabled = false;
    Require(!PlayerNapiParser::ParseSpeed(nullptr, &info, speed) && speed == UNCHANGED_NUMBER, "Reject nonnumber");
    Require(!PlayerNapiParser::ParseEnabled(nullptr, &info, enabled) && !enabled, "Reject nonboolean");
    value.type = napi_boolean;
    Require(PlayerNapiParser::ParseEnabled(nullptr, &info, enabled) && enabled, "Accept boolean");
    info.args.clear();
    Require(!PlayerNapiParser::ParseSpeed(nullptr, &info, speed), "Reject missing argument");
    info.args = { &value, &value };
    Require(!PlayerNapiParser::ParseEnabled(nullptr, &info, enabled), "Reject extra arguments");
}
} // namespace

extern "C" napi_status napi_get_cb_info(
    napi_env, napi_callback_info info, size_t *count, napi_value *args, napi_value *, void **)
{
    const size_t copied = std::min(*count, info->args.size());
    std::copy_n(info->args.begin(), copied, args);
    *count = info->args.size();
    return napi_ok;
}
extern "C" napi_status napi_get_value_double(napi_env, napi_value value, double *result)
{
    if (value == nullptr || value->type != napi_number) {
        return napi_number_expected;
    }
    *result = value->number;
    return napi_ok;
}
extern "C" napi_status napi_get_value_bool(napi_env, napi_value value, bool *result)
{
    if (value == nullptr || value->type != napi_boolean) {
        return napi_boolean_expected;
    }
    *result = value->flag;
    return napi_ok;
}
extern "C" napi_status napi_throw_type_error(napi_env, const char *, const char *)
{
    ++g_errors;
    return napi_ok;
}
extern "C" napi_status napi_throw_range_error(napi_env, const char *, const char *)
{
    ++g_errors;
    return napi_ok;
}

int main()
{
    TestNumericControls();
    TestIntegerControls();
    TestTypesAndArity();
    Require(g_errors > 0, "Invalid controls report explicit errors");
    std::cout << "Player control parser: types, finite ranges and unchanged outputs passed" << std::endl;
}
