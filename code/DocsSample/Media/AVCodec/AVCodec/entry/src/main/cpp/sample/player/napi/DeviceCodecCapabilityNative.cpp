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

#include "DeviceCodecCapabilityNative.h"
#include <multimedia/player_framework/native_avcapability.h>
#include <cmath>
#include <string>

namespace {
constexpr OH_AVCodecType CODEC_TYPES[] = {
    OH_AVCODEC_TYPE_VIDEO_DECODER,
    OH_AVCODEC_TYPE_VIDEO_ENCODER,
    OH_AVCODEC_TYPE_AUDIO_DECODER,
    OH_AVCODEC_TYPE_AUDIO_ENCODER
};

bool SetString(napi_env env, napi_value object, const char *key, const char *value)
{
    napi_value property = nullptr;
    return napi_create_string_utf8(env, value, NAPI_AUTO_LENGTH, &property) == napi_ok &&
        napi_set_named_property(env, object, key, property) == napi_ok;
}

bool SetInteger(napi_env env, napi_value object, const char *key, int32_t value)
{
    napi_value property = nullptr;
    return napi_create_int32(env, value, &property) == napi_ok &&
        napi_set_named_property(env, object, key, property) == napi_ok;
}

bool SetBoolean(napi_env env, napi_value object, const char *key, bool value)
{
    napi_value property = nullptr;
    return napi_get_boolean(env, value, &property) == napi_ok &&
        napi_set_named_property(env, object, key, property) == napi_ok;
}

bool SetRange(napi_env env, napi_value object, const char *key, const OH_AVRange &range)
{
    napi_value property = nullptr;
    return napi_create_object(env, &property) == napi_ok &&
        SetInteger(env, property, "min", range.minVal) &&
        SetInteger(env, property, "max", range.maxVal) &&
        napi_set_named_property(env, object, key, property) == napi_ok;
}

bool SetIntegerArray(napi_env env, napi_value object, const char *key, const int32_t *values, uint32_t count)
{
    napi_value property = nullptr;
    if (napi_create_array_with_length(env, count, &property) != napi_ok) {
        return false;
    }
    for (uint32_t index = 0; index < count; ++index) {
        napi_value value = nullptr;
        if (napi_create_int32(env, values[index], &value) != napi_ok ||
            napi_set_element(env, property, index, value) != napi_ok) {
            return false;
        }
    }
    return napi_set_named_property(env, object, key, property) == napi_ok;
}

bool SetRangeArray(napi_env env, napi_value object, const char *key, OH_AVRange *ranges, uint32_t count)
{
    napi_value property = nullptr;
    if (napi_create_array_with_length(env, count, &property) != napi_ok) {
        return false;
    }
    for (uint32_t index = 0; index < count; ++index) {
        napi_value range = nullptr;
        if (napi_create_object(env, &range) != napi_ok ||
            !SetInteger(env, range, "min", ranges[index].minVal) ||
            !SetInteger(env, range, "max", ranges[index].maxVal) ||
            napi_set_element(env, property, index, range) != napi_ok) {
            return false;
        }
    }
    return napi_set_named_property(env, object, key, property) == napi_ok;
}

bool SetProfileCapabilities(napi_env env, napi_value object, OH_AVCapability *capability)
{
    const int32_t *profiles = nullptr;
    uint32_t profileCount = 0;
    if (OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileCount) != AV_ERR_OK) {
        return SetIntegerArray(env, object, "profiles", nullptr, 0) &&
            SetIntegerArray(env, object, "profileLevels", nullptr, 0);
    }
    if (!SetIntegerArray(env, object, "profiles", profiles, profileCount)) {
        return false;
    }

    napi_value profileLevels = nullptr;
    if (napi_create_array_with_length(env, profileCount, &profileLevels) != napi_ok) {
        return false;
    }
    for (uint32_t index = 0; index < profileCount; ++index) {
        const int32_t *levels = nullptr;
        uint32_t levelCount = 0;
        OH_AVCapability_GetSupportedLevelsForProfile(capability, profiles[index], &levels, &levelCount);
        napi_value item = nullptr;
        if (napi_create_object(env, &item) != napi_ok ||
            !SetInteger(env, item, "profile", profiles[index]) ||
            !SetIntegerArray(env, item, "levels", levels, levelCount) ||
            napi_set_element(env, profileLevels, index, item) != napi_ok) {
            return false;
        }
    }
    return napi_set_named_property(env, object, "profileLevels", profileLevels) == napi_ok;
}

bool SetVideoCapabilities(napi_env env, napi_value object, OH_AVCapability *capability)
{
    OH_AVRange widthRange{};
    OH_AVRange heightRange{};
    OH_AVRange frameRateRange{};
    if (OH_AVCapability_GetVideoWidthRange(capability, &widthRange) == AV_ERR_OK &&
        !SetRange(env, object, "videoWidthRange", widthRange)) {
        return false;
    }
    if (OH_AVCapability_GetVideoHeightRange(capability, &heightRange) == AV_ERR_OK &&
        !SetRange(env, object, "videoHeightRange", heightRange)) {
        return false;
    }
    if (OH_AVCapability_GetVideoFrameRateRange(capability, &frameRateRange) == AV_ERR_OK &&
        !SetRange(env, object, "videoFrameRateRange", frameRateRange)) {
        return false;
    }

    int32_t widthAlignment = 0;
    int32_t heightAlignment = 0;
    if (OH_AVCapability_GetVideoWidthAlignment(capability, &widthAlignment) == AV_ERR_OK &&
        !SetInteger(env, object, "videoWidthAlignment", widthAlignment)) {
        return false;
    }
    if (OH_AVCapability_GetVideoHeightAlignment(capability, &heightAlignment) == AV_ERR_OK &&
        !SetInteger(env, object, "videoHeightAlignment", heightAlignment)) {
        return false;
    }

    const int32_t *pixelFormats = nullptr;
    uint32_t pixelFormatCount = 0;
    if (OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixelFormats, &pixelFormatCount) == AV_ERR_OK) {
        if (!SetIntegerArray(env, object, "videoPixelFormats", pixelFormats, pixelFormatCount)) {
            return false;
        }
    } else if (!SetIntegerArray(env, object, "videoPixelFormats", nullptr, 0)) {
        return false;
    }
    return SetProfileCapabilities(env, object, capability);
}

bool SetAudioCapabilities(napi_env env, napi_value object, OH_AVCapability *capability)
{
    const int32_t *sampleRates = nullptr;
    uint32_t sampleRateCount = 0;
    if (OH_AVCapability_GetAudioSupportedSampleRates(capability, &sampleRates, &sampleRateCount) == AV_ERR_OK) {
        if (!SetIntegerArray(env, object, "audioSampleRates", sampleRates, sampleRateCount)) {
            return false;
        }
    } else if (!SetIntegerArray(env, object, "audioSampleRates", nullptr, 0)) {
        return false;
    }

    OH_AVRange *sampleRateRanges = nullptr;
    uint32_t sampleRateRangeCount = 0;
    if (OH_AVCapability_GetAudioSupportedSampleRateRanges(capability, &sampleRateRanges, &sampleRateRangeCount) ==
        AV_ERR_OK) {
        if (!SetRangeArray(env, object, "audioSampleRateRanges", sampleRateRanges, sampleRateRangeCount)) {
            return false;
        }
    } else if (!SetRangeArray(env, object, "audioSampleRateRanges", nullptr, 0)) {
        return false;
    }

    OH_AVRange channelCountRange{};
    if (OH_AVCapability_GetAudioChannelCountRange(capability, &channelCountRange) == AV_ERR_OK &&
        !SetRange(env, object, "audioChannelCountRange", channelCountRange)) {
        return false;
    }
    return true;
}

bool SetEncoderCapabilities(napi_env env, napi_value object, OH_AVCapability *capability)
{
    OH_AVRange bitrateRange{};
    return OH_AVCapability_GetEncoderBitrateRange(capability, &bitrateRange) != AV_ERR_OK ||
        SetRange(env, object, "encoderBitrateRange", bitrateRange);
}

bool SetCodecProperties(napi_env env, napi_value item, OH_AVCodecType codecType, OH_AVCapability *capability)
{
    if (!SetInteger(env, item, "codecType", static_cast<int32_t>(codecType)) ||
        !SetBoolean(env, item, "hardware", OH_AVCapability_IsHardware(capability)) ||
        !SetInteger(env, item, "maxInstances", OH_AVCapability_GetMaxSupportedInstances(capability))) {
        return false;
    }

    const bool isVideo = codecType == OH_AVCODEC_TYPE_VIDEO_DECODER || codecType == OH_AVCODEC_TYPE_VIDEO_ENCODER;
    if (!(isVideo ? SetVideoCapabilities(env, item, capability) : SetAudioCapabilities(env, item, capability))) {
        return false;
    }

    const bool isEncoder = codecType == OH_AVCODEC_TYPE_VIDEO_ENCODER || codecType == OH_AVCODEC_TYPE_AUDIO_ENCODER;
    return !isEncoder || SetEncoderCapabilities(env, item, capability);
}

bool AppendCodecCapabilitiesForType(napi_env env, napi_value result, OH_AVCodecType codecType, uint32_t &resultIndex)
{
    uint32_t capabilityCount = 0;
    OH_AVCapability **capabilities = OH_AVCodec_GetCapabilityList(codecType, &capabilityCount);
    if (capabilities == nullptr) {
        return true;
    }

    for (uint32_t index = 0; index < capabilityCount; ++index) {
        OH_AVCapability *capability = capabilities[index];
        if (capability == nullptr) {
            continue;
        }
        const char *codecName = OH_AVCapability_GetName(capability);
        const char *mimeType = OH_AVCapability_GetMimeType(capability);
        if (codecName == nullptr || mimeType == nullptr) {
            continue;
        }

        napi_value item = nullptr;
        if (napi_create_object(env, &item) != napi_ok ||
            !SetString(env, item, "codecName", codecName) ||
            !SetString(env, item, "mimeType", mimeType) ||
            !SetCodecProperties(env, item, codecType, capability) ||
            napi_set_element(env, result, resultIndex, item) != napi_ok) {
            return false;
        }
        ++resultIndex;
    }
    return true;
}
struct VideoCapabilityRequest {
    std::string name;
    std::string mime;
    int32_t type = OH_AVCODEC_TYPE_VIDEO_DECODER;
    int32_t width = 0;
    int32_t height = 0;
    double frameRate = 0;
};

bool ReadText(napi_env env, napi_value object, const char *key, std::string &text)
{
    napi_value property = nullptr;
    char buffer[256] = {};
    size_t length = 0;
    if (napi_get_named_property(env, object, key, &property) != napi_ok ||
        napi_get_value_string_utf8(env, property, buffer, sizeof(buffer), &length) != napi_ok ||
        length == 0 || length >= sizeof(buffer) - 1) {
        return false;
    }
    text.assign(buffer, length);
    return true;
}

bool ReadNumber(napi_env env, napi_value object, const char *key, int32_t &number)
{
    napi_value property = nullptr;
    return napi_get_named_property(env, object, key, &property) == napi_ok &&
        napi_get_value_int32(env, property, &number) == napi_ok;
}

bool ReadVideoRequest(napi_env env, napi_value object, VideoCapabilityRequest &request)
{
    napi_value rate = nullptr;
    return ReadText(env, object, "codecName", request.name) &&
        ReadText(env, object, "mimeType", request.mime) &&
        ReadNumber(env, object, "codecType", request.type) &&
        ReadNumber(env, object, "width", request.width) &&
        ReadNumber(env, object, "height", request.height) &&
        napi_get_named_property(env, object, "frameRate", &rate) == napi_ok &&
        napi_get_value_double(env, rate, &request.frameRate) == napi_ok &&
        request.width > 0 && request.height > 0 && std::isfinite(request.frameRate) &&
        request.frameRate > 0 && (request.type == OH_AVCODEC_TYPE_VIDEO_DECODER ||
            request.type == OH_AVCODEC_TYPE_VIDEO_ENCODER);
}

OH_AVCapability *FindVideoCapability(const VideoCapabilityRequest &request)
{
    uint32_t count = 0;
    OH_AVCapability **list = OH_AVCodec_GetCapabilityList(static_cast<OH_AVCodecType>(request.type), &count);
    for (uint32_t index = 0; list != nullptr && index < count; ++index) {
        const char *name = OH_AVCapability_GetName(list[index]);
        const char *mime = OH_AVCapability_GetMimeType(list[index]);
        if (name != nullptr && mime != nullptr && request.name == name && request.mime == mime) {
            return list[index];
        }
    }
    return nullptr;
}
} // 匿名命名空间

napi_value DeviceCodecCapabilityNative::CheckVideo(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    VideoCapabilityRequest request;
    if (napi_get_cb_info(env, info, &argc, args, nullptr, nullptr) != napi_ok ||
        argc != 1 || !ReadVideoRequest(env, args[0], request)) {
        napi_throw_type_error(env, nullptr, "Invalid video capability request");
        return nullptr;
    }
    OH_AVCapability *capability = FindVideoCapability(request);
    const bool sizeSupported = capability != nullptr &&
        OH_AVCapability_IsVideoSizeSupported(capability, request.width, request.height);
    const bool supported = sizeSupported &&
        OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, request.width, request.height, request.frameRate);
    OH_AVRange range{};
    const bool rangeAvailable = sizeSupported &&
        OH_AVCapability_GetVideoFrameRateRangeForSize(capability, request.width, request.height, &range) == AV_ERR_OK;
    const char *reason = capability == nullptr ? "codec 不存在或 MIME 不匹配" :
        (!sizeSupported ? "不支持该宽高组合" : (!supported ? "该尺寸不支持所选帧率" :
            "尺寸与帧率组合符合能力声明；Profile、HDR、前处理及多实例资源仍以 Configure 为准"));
    napi_value result = nullptr;
    if (napi_create_object(env, &result) != napi_ok ||
        !SetBoolean(env, result, "supported", supported) ||
        !SetBoolean(env, result, "sizeSupported", sizeSupported) ||
        !SetBoolean(env, result, "frameRateRangeAvailable", rangeAvailable) ||
        !SetRange(env, result, "frameRateRange", range) ||
        !SetString(env, result, "reason", reason)) {
        napi_throw_error(env, nullptr, "Serialize video check failed");
        return nullptr;
    }
    return result;
}

napi_value DeviceCodecCapabilityNative::GetAll(napi_env env, napi_callback_info info)
{
    (void)info;
    napi_value result = nullptr;
    if (napi_create_array(env, &result) != napi_ok) {
        napi_throw_error(env, nullptr, "Create codec capability array failed");
        return nullptr;
    }

    uint32_t resultIndex = 0;
    for (const OH_AVCodecType codecType : CODEC_TYPES) {
        if (!AppendCodecCapabilitiesForType(env, result, codecType, resultIndex)) {
            napi_throw_error(env, nullptr, "Serialize codec capability failed");
            return nullptr;
        }
    }
    return result;
}
