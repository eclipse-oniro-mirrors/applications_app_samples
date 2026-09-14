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

namespace {
constexpr size_t LEGACY_PLAY_ARG_COUNT = 9;
constexpr size_t STRUCTURED_PLAY_ARG_COUNT = 2;

bool IsFunction(napi_env env, napi_value value)
{
    napi_valuetype type = napi_undefined;
    return napi_typeof(env, value, &type) == napi_ok && type == napi_function;
}

bool GetRequiredProperty(napi_env env, napi_value object, const char *name, napi_value &value)
{
    bool hasProperty = false;
    if (napi_has_named_property(env, object, name, &hasProperty) != napi_ok || !hasProperty ||
        napi_get_named_property(env, object, name, &value) != napi_ok) {
        std::string message = "Missing play option: " + std::string(name);
        napi_throw_type_error(env, nullptr, message.c_str());
        return false;
    }
    return true;
}

bool ReadInt32Property(napi_env env, napi_value object, const char *name, int32_t &result)
{
    napi_value value = nullptr;
    if (!GetRequiredProperty(env, object, name, value)) {
        return false;
    }
    if (napi_get_value_int32(env, value, &result) != napi_ok) {
        napi_throw_type_error(env, nullptr, "Play option must be a number");
        return false;
    }
    return true;
}

bool ReadInt64Property(napi_env env, napi_value object, const char *name, int64_t &result)
{
    napi_value value = nullptr;
    if (!GetRequiredProperty(env, object, name, value)) {
        return false;
    }
    if (napi_get_value_int64(env, value, &result) != napi_ok) {
        napi_throw_type_error(env, nullptr, "Play option must be a number");
        return false;
    }
    return true;
}

bool ReadBoolProperty(napi_env env, napi_value object, const char *name, bool &result)
{
    napi_value value = nullptr;
    if (!GetRequiredProperty(env, object, name, value)) {
        return false;
    }
    if (napi_get_value_bool(env, value, &result) != napi_ok) {
        napi_throw_type_error(env, nullptr, "Play option must be a boolean");
        return false;
    }
    return true;
}

bool ReadOptionalBoolProperty(napi_env env, napi_value object, const char *name, bool &result)
{
    bool hasProperty = false;
    if (napi_has_named_property(env, object, name, &hasProperty) != napi_ok || !hasProperty) {
        return true;
    }
    return ReadBoolProperty(env, object, name, result);
}

bool ReadOptionalInt32Property(napi_env env, napi_value object, const char *name, int32_t &result)
{
    bool hasProperty = false;
    if (napi_has_named_property(env, object, name, &hasProperty) != napi_ok || !hasProperty) {
        return true;
    }
    napi_value value = nullptr;
    if (napi_get_named_property(env, object, name, &value) != napi_ok ||
        napi_get_value_int32(env, value, &result) != napi_ok) {
        napi_throw_type_error(env, nullptr, "Play option must be a number");
        return false;
    }
    return true;
}

bool ReadOptionalDoubleProperty(napi_env env, napi_value object, const char *name, double &result)
{
    bool hasProperty = false;
    if (napi_has_named_property(env, object, name, &hasProperty) != napi_ok || !hasProperty) {
        return true;
    }
    napi_value value = nullptr;
    if (napi_get_named_property(env, object, name, &value) != napi_ok ||
        napi_get_value_double(env, value, &result) != napi_ok) {
        napi_throw_type_error(env, nullptr, "Play option must be a number");
        return false;
    }
    return true;
}

bool ParsePlayOptions(napi_env env, napi_value options, SampleInfo &sampleInfo)
{
    napi_valuetype type = napi_undefined;
    if (napi_typeof(env, options, &type) != napi_ok || type != napi_object) {
        napi_throw_type_error(env, nullptr, "Play options must be an object");
        return false;
    }
    double audioVolume = sampleInfo.audioPlayback.volume;
    const bool parsed = ReadInt32Property(env, options, "inputFileFd", sampleInfo.source.inputFd) &&
        ReadInt64Property(env, options, "inputFileOffset", sampleInfo.source.inputFileOffset) &&
        ReadInt64Property(env, options, "inputFileSize", sampleInfo.source.inputFileSize) &&
        ReadInt32Property(env, options, "videoDecoderType", sampleInfo.codec.codecType) &&
        ReadInt32Property(env, options, "videoDecoderRunMode", sampleInfo.codec.codecRunMode) &&
        ReadInt32Property(env, options, "videoDecoderSyncMode", sampleInfo.codec.codecSyncMode) &&
        ReadBoolProperty(env, options, "isSmartFluencySupported", sampleInfo.codec.isSmartFluencySupported) &&
        ReadBoolProperty(env, options, "enableVideoDump", sampleInfo.output.enableVideoDump) &&
        ReadOptionalBoolProperty(env, options, "retainLastFrame", sampleInfo.codec.retainLastFrame) &&
        ReadOptionalBoolProperty(env, options, "enableLowLatency", sampleInfo.codec.enableLowLatency) &&
        ReadOptionalBoolProperty(env, options, "outputInDecodingOrder", sampleInfo.codec.outputInDecodingOrder) &&
        ReadOptionalBoolProperty(env, options, "convertHdrVividToBt709", sampleInfo.codec.convertHdrVividToBt709) &&
        ReadOptionalInt32Property(env, options, "audioTrackIndex", sampleInfo.codec.audioTrackIndex) &&
        ReadOptionalDoubleProperty(env, options, "audioVolume", audioVolume) &&
        ReadOptionalBoolProperty(env, options, "enableAudioLowLatency", sampleInfo.audioPlayback.enableLowLatency);
    if (!parsed || audioVolume < 0.0 || audioVolume > 1.0) {
        if (parsed) {
            napi_throw_range_error(env, nullptr, "audioVolume must be in the range [0, 1]");
        }
        return false;
    }
    sampleInfo.audioPlayback.volume = static_cast<float>(audioVolume);
    return true;
}
} // namespace

bool PlayerNapiParser::ParseLegacyPlayArguments(napi_env env, napi_callback_info info,
    SampleInfo &sampleInfo, napi_value &callback)
{
    size_t argc = LEGACY_PLAY_ARG_COUNT;
    napi_value args[LEGACY_PLAY_ARG_COUNT] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok ||
        argc != LEGACY_PLAY_ARG_COUNT || !IsFunction(env, args[LEGACY_PLAY_ARG_COUNT - 1])) {
        napi_throw_type_error(env, nullptr, "playNative requires eight options and a callback");
        return false;
    }
    const bool parsed = napi_get_value_int32(env, args[0], &sampleInfo.source.inputFd) == napi_ok &&
        napi_get_value_int64(env, args[1], &sampleInfo.source.inputFileOffset) == napi_ok &&
        napi_get_value_int64(env, args[2], &sampleInfo.source.inputFileSize) == napi_ok &&
        napi_get_value_int32(env, args[3], &sampleInfo.codec.codecType) == napi_ok &&
        napi_get_value_int32(env, args[4], &sampleInfo.codec.codecRunMode) == napi_ok &&
        napi_get_value_int32(env, args[5], &sampleInfo.codec.codecSyncMode) == napi_ok &&
        napi_get_value_bool(env, args[6], &sampleInfo.codec.isSmartFluencySupported) == napi_ok &&
        napi_get_value_bool(env, args[7], &sampleInfo.output.enableVideoDump) == napi_ok;
    if (!parsed) {
        napi_throw_type_error(env, nullptr, "Invalid playNative argument type");
        return false;
    }
    callback = args[LEGACY_PLAY_ARG_COUNT - 1];
    return true;
}

bool PlayerNapiParser::ParseStructuredPlayArguments(napi_env env, napi_callback_info info,
    SampleInfo &sampleInfo, napi_value &callback)
{
    size_t argc = STRUCTURED_PLAY_ARG_COUNT;
    napi_value args[STRUCTURED_PLAY_ARG_COUNT] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok ||
        argc != STRUCTURED_PLAY_ARG_COUNT || !IsFunction(env, args[1])) {
        napi_throw_type_error(env, nullptr, "play requires an options object and a callback");
        return false;
    }
    if (!ParsePlayOptions(env, args[0], sampleInfo)) {
        return false;
    }
    callback = args[1];
    return true;
}

bool PlayerNapiParser::ParseSeekPosition(napi_env env, napi_callback_info info, int64_t &positionUs)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok || argc != 1 ||
        napi_get_value_int64(env, args[0], &positionUs) != napi_ok) {
        napi_throw_type_error(env, nullptr, "seekTo requires a position in microseconds");
        return false;
    }
    return true;
}
