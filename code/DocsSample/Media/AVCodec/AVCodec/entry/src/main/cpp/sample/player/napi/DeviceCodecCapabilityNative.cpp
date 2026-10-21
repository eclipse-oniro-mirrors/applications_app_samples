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

bool SetCodecProperties(napi_env env, napi_value item, OH_AVCodecType codecType, const char *codecName,
    const char *mimeType, OH_AVCapability *capability)
{
    if (!SetInteger(env, item, "codecType", static_cast<int32_t>(codecType)) ||
        !SetString(env, item, "codecName", codecName) ||
        !SetString(env, item, "mimeType", mimeType) ||
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
            !SetCodecProperties(env, item, codecType, codecName, mimeType, capability) ||
            napi_set_element(env, result, resultIndex, item) != napi_ok) {
            return false;
        }
        ++resultIndex;
    }
    return true;
}
} // namespace

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
