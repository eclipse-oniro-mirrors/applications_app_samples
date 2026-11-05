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

#include "CodecList.h"
#include "SampleLog.h"
#include <sstream>

namespace {
OH_AVCodecType MapCategory(int32_t category)
{
    switch (category) {
        case CATEGORY_VIDEO_ENCODER:
            return OH_AVCODEC_TYPE_VIDEO_ENCODER;
        case CATEGORY_AUDIO_DECODER:
            return OH_AVCODEC_TYPE_AUDIO_DECODER;
        case CATEGORY_AUDIO_ENCODER:
            return OH_AVCODEC_TYPE_AUDIO_ENCODER;
        case CATEGORY_VIDEO_DECODER:
        default:
            return OH_AVCODEC_TYPE_VIDEO_DECODER;
    }
}

bool IsEncoderCategory(int32_t category)
{
    return category == CATEGORY_VIDEO_ENCODER || category == CATEGORY_AUDIO_ENCODER;
}

bool IsVideoCategory(int32_t category)
{
    return category == CATEGORY_VIDEO_ENCODER || category == CATEGORY_VIDEO_DECODER;
}

std::string JsonEscape(const std::string &value)
{
    std::string escaped;
    escaped.reserve(value.size());
    for (char c : value) {
        if (c == '\\' || c == '"') {
            escaped.push_back('\\');
        }
        escaped.push_back(c);
    }
    return escaped;
}

std::string AvcProfileLabel(int32_t profile)
{
    switch (profile) {
        case AVC_PROFILE_BASELINE:
            return "AVC_PROFILE_BASELINE";
        case AVC_PROFILE_HIGH:
            return "AVC_PROFILE_HIGH";
        case AVC_PROFILE_MAIN:
            return "AVC_PROFILE_MAIN";
        default:
            return std::to_string(profile);
    }
}

void AppendVideoInfo(std::string &detail, OH_AVCapability *capability)
{
    int32_t widthAlignment = 0;
    int32_t heightAlignment = 0;
    if (OH_AVCapability_GetVideoWidthAlignment(capability, &widthAlignment) == AV_ERR_OK && widthAlignment > 0) {
        detail += "\n宽对齐: " + std::to_string(widthAlignment);
    }
    if (OH_AVCapability_GetVideoHeightAlignment(capability, &heightAlignment) == AV_ERR_OK && heightAlignment > 0) {
        detail += "\n高对齐: " + std::to_string(heightAlignment);
    }
    OH_AVRange range = {-1, -1};
    if (OH_AVCapability_GetVideoWidthRange(capability, &range) == AV_ERR_OK && range.maxVal > 0) {
        detail += "\n宽度范围: " + RangeToString(range.minVal, range.maxVal);
    }
    range = {-1, -1};
    if (OH_AVCapability_GetVideoHeightRange(capability, &range) == AV_ERR_OK && range.maxVal > 0) {
        detail += "\n高度范围: " + RangeToString(range.minVal, range.maxVal);
    }
    range = {-1, -1};
    if (OH_AVCapability_GetVideoFrameRateRange(capability, &range) == AV_ERR_OK && range.maxVal > 0) {
        detail += "\n帧率范围: " + RangeToString(range.minVal, range.maxVal);
    }
    const int32_t *pixFormats = nullptr;
    uint32_t pixFormatNum = 0;
    if (OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixFormats, &pixFormatNum) == AV_ERR_OK &&
        pixFormats != nullptr && pixFormatNum > 0) {
        std::string formats;
        for (uint32_t i = 0; i < pixFormatNum; i++) {
            formats += std::to_string(pixFormats[i]);
            if (i + 1 < pixFormatNum) {
                formats += "、";
            }
        }
        detail += "\n像素格式: " + formats;
    }
}

void AppendEncoderInfo(std::string &detail, OH_AVCapability *capability, bool isVideo)
{
    OH_AVRange range = {-1, -1};
    if (OH_AVCapability_GetEncoderBitrateRange(capability, &range) == AV_ERR_OK && range.maxVal > 0) {
        detail += "\n码率范围: " + RangeToString(range.minVal, range.maxVal);
    }
    range = {-1, -1};
    if (OH_AVCapability_GetEncoderQualityRange(capability, &range) == AV_ERR_OK && range.maxVal >= 0) {
        detail += "\n质量范围: " + RangeToString(range.minVal, range.maxVal);
    }
    range = {-1, -1};
    if (OH_AVCapability_GetEncoderComplexityRange(capability, &range) == AV_ERR_OK &&
        !(range.minVal == 0 && range.maxVal == 0)) {
        detail += "\n复杂度范围: " + RangeToString(range.minVal, range.maxVal);
    }
    std::string modes;
    const OH_BitrateMode modesToCheck[] = {BITRATE_MODE_CBR, BITRATE_MODE_VBR, BITRATE_MODE_CQ, BITRATE_MODE_SQR,
        BITRATE_MODE_CBR_HIGH_QUALITY};
    const std::string modeNames[] = {"CBR", "VBR", "CQ", "SQR", "CBRHQ"};
    for (size_t i = 0; i < sizeof(modesToCheck) / sizeof(modesToCheck[0]); i++) {
        modes += modeNames[i] + (OH_AVCapability_IsEncoderBitrateModeSupported(capability, modesToCheck[i]) ? "(支持)" :
            "(不支持)");
        if (i + 1 < sizeof(modesToCheck) / sizeof(modesToCheck[0])) {
            modes += " ";
        }
    }
    detail += "\n码控模式: " + modes;
    if (isVideo && OH_AVCapability_IsFeatureSupported(capability, VIDEO_ENCODER_LONG_TERM_REFERENCE)) {
        detail += "\n长期参考帧特性: 支持";
        OH_AVFormat *properties = OH_AVCapability_GetFeatureProperties(capability, VIDEO_ENCODER_LONG_TERM_REFERENCE);
        if (properties != nullptr) {
            int32_t maxLTRCount = -1;
            [[maybe_unused]] bool ret = OH_AVFormat_GetIntValue(properties,
                OH_FEATURE_PROPERTY_KEY_VIDEO_ENCODER_MAX_LTR_FRAME_COUNT, &maxLTRCount);
            detail += "（最大 " + std::to_string(maxLTRCount) + " 个）";
            OH_AVFormat_Destroy(properties);
        }
    }
}

void AppendAudioInfo(std::string &detail, OH_AVCapability *capability)
{
    OH_AVRange *sampleRateRanges = nullptr;
    uint32_t rangesNum = 0;
    if (OH_AVCapability_GetAudioSupportedSampleRateRanges(capability, &sampleRateRanges, &rangesNum) == AV_ERR_OK &&
        sampleRateRanges != nullptr && rangesNum > 0) {
        std::string ranges;
        for (uint32_t i = 0; i < rangesNum; i++) {
            ranges += RangeToString(sampleRateRanges[i].minVal, sampleRateRanges[i].maxVal);
            if (i + 1 < rangesNum) {
                ranges += "、";
            }
        }
        detail += "\n采样率范围: " + ranges;
    }
    OH_AVRange range = {-1, -1};
    if (OH_AVCapability_GetAudioChannelCountRange(capability, &range) == AV_ERR_OK && range.maxVal > 0) {
        detail += "\n通道数范围: " + RangeToString(range.minVal, range.maxVal);
    }
}

void AppendProfiles(std::string &detail, OH_AVCapability *capability)
{
    std::string mime = SafeName(OH_AVCapability_GetMimeType(capability));
    bool isAvc = mime.find("avc") != std::string::npos;
    bool isHevc = mime.find("hevc") != std::string::npos;
    if (!isAvc && !isHevc) {
        return;
    }
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    if (OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum) != AV_ERR_OK || profiles == nullptr ||
        profileNum == 0) {
        return;
    }
    std::string profileText;
    for (uint32_t i = 0; i < profileNum; i++) {
        if (isAvc) {
            profileText += AvcProfileLabel(profiles[i]);
        } else {
            profileText += std::to_string(profiles[i]);
        }
        if (i + 1 < profileNum) {
            profileText += "、";
        }
    }
    detail += "\n支持的档次: " + profileText;
    const int32_t *levels = nullptr;
    uint32_t levelNum = 0;
    if (OH_AVCapability_GetSupportedLevelsForProfile(capability, profiles[0], &levels, &levelNum) == AV_ERR_OK &&
        levels != nullptr && levelNum > 0) {
        int32_t maxLevel = levels[0];
        for (uint32_t i = 1; i < levelNum; i++) {
            maxLevel = std::max(maxLevel, levels[i]);
        }
        detail += "\n最大级别（" + (isAvc ? std::string("首档位") : std::string("首档位")) + "）: " +
            std::to_string(maxLevel);
    }
}
} // namespace

std::vector<CodecBriefInfo> CodecList::CollectCodecs(int32_t category)
{
    std::vector<CodecBriefInfo> result;
    uint32_t count = 0;
    OH_AVCapability **capabilityList = OH_AVCodec_GetCapabilityList(MapCategory(category), &count);
    if (capabilityList == nullptr) {
        SAMPLE_LOGW("GetCapabilityList returns nullptr, category: %{public}d", category);
        return result;
    }
    for (uint32_t i = 0; i < count; i++) {
        CodecBriefInfo info;
        info.name = SafeName(OH_AVCapability_GetName(capabilityList[i]));
        info.mime = SafeName(OH_AVCapability_GetMimeType(capabilityList[i]));
        info.isHardware = OH_AVCapability_IsHardware(capabilityList[i]);
        info.isSecure = OH_AVCapability_IsSecure(capabilityList[i]);
        info.maxInstances = OH_AVCapability_GetMaxSupportedInstances(capabilityList[i]);
        result.push_back(info);
    }
    return result;
}

std::string CodecList::GetCodecListJson(int32_t category)
{
    std::vector<CodecBriefInfo> codecs = CollectCodecs(category);
    std::string json = "[";
    for (size_t i = 0; i < codecs.size(); i++) {
        json += "{\"name\":\"" + JsonEscape(codecs[i].name) + "\",\"mime\":\"" + JsonEscape(codecs[i].mime) +
            "\",\"isHardware\":" + (codecs[i].isHardware ? "true" : "false") + ",\"isSecure\":" +
            (codecs[i].isSecure ? "true" : "false") + ",\"maxInstances\":" + std::to_string(codecs[i].maxInstances) +
            "}";
        if (i + 1 < codecs.size()) {
            json += ",";
        }
    }
    json += "]";
    SAMPLE_LOGI("GetCodecListJson, category: %{public}d, size: %{public}zu", category, codecs.size());
    return json;
}

OH_AVCapability *CodecList::FindCodec(int32_t category, const std::string &name)
{
    uint32_t count = 0;
    OH_AVCapability **capabilityList = OH_AVCodec_GetCapabilityList(MapCategory(category), &count);
    if (capabilityList == nullptr) {
        return nullptr;
    }
    for (uint32_t i = 0; i < count; i++) {
        if (name == SafeName(OH_AVCapability_GetName(capabilityList[i]))) {
            return capabilityList[i];
        }
    }
    return nullptr;
}

std::string CodecList::BuildDetail(OH_AVCapability *capability, int32_t category)
{
    std::string detail = "编解码器名称: " + SafeName(OH_AVCapability_GetName(capability));
    detail += "\nMIME类型: " + SafeName(OH_AVCapability_GetMimeType(capability));
    detail += std::string("\n类别: ") + (OH_AVCapability_IsHardware(capability) ? "硬件" : "软件");
    detail += std::string("\n安全解码器(DRM): ") + (OH_AVCapability_IsSecure(capability) ? "是" : "否");
    detail += "\n最大实例数: " + std::to_string(OH_AVCapability_GetMaxSupportedInstances(capability));
    bool isVideo = IsVideoCategory(category);
    bool isEncoder = IsEncoderCategory(category);
    if (isVideo) {
        AppendVideoInfo(detail, capability);
        AppendProfiles(detail, capability);
    } else {
        AppendAudioInfo(detail, capability);
    }
    if (isEncoder) {
        AppendEncoderInfo(detail, capability, isVideo);
    }
    return detail;
}

std::string CodecList::GetCodecDetail(int32_t category, const std::string &name)
{
    SAMPLE_LOGI("GetCodecDetail, category: %{public}d, name: %{public}s", category, name.c_str());
    if (name.empty()) {
        return "编解码器名称为空。";
    }
    OH_AVCapability *capability = FindCodec(category, name);
    if (capability == nullptr) {
        return "未查询到编解码器: " + name;
    }
    return BuildDetail(capability, category);
}
