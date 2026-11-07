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

#include "CapabilityQuery.h"
#include "SampleLog.h"

namespace {
// 校验待配置档次是否在支持的档次列表中。
bool IsProfileSupported(const int32_t *profiles, uint32_t profileNum, OH_AVCProfile profile)
{
    for (int i = 0; i < profileNum; i++) {
        if (profiles[i] == profile) {
            return true;
        }
    }
    return false;
}

// 取指定档次支持的级别中的最大级别。
OH_AVCLevel GetMaxSupportedLevel(const int32_t *levels, uint32_t levelNum)
{
    OH_AVCLevel maxLevel = static_cast<OH_AVCLevel>(levels[0]);
    for (int32_t i = 1; i < levelNum; i++) {
        OH_AVCLevel tmp = static_cast<OH_AVCLevel>(levels[i]);
        if (tmp > maxLevel) {
            maxLevel = tmp;
        }
    }
    return maxLevel;
}

// 组装档次和级别查询场景的结果文本，并释放示例编码器实例。
std::string BuildProfileAndLevelResult(const OH_AVCapability *capability, bool isMatched, OH_AVCLevel maxLevel,
    OH_AVCodec *videoEnc)
{
    std::string result = "查询编解码档次和级别支持情况：";
    if (capability == nullptr) {
        return result + "未获取到推荐的H.264编码器。";
    }
    result += "AVC_PROFILE_MAIN档次支持情况: " + std::string(isMatched ? "支持" : "不支持");
    result += "\n该档次支持的最大级别: " + std::to_string(maxLevel);
    if (videoEnc != nullptr) {
        OH_VideoEncoder_Destroy(videoEnc);
        result += "\n档次参数配置完成（示例验证后已销毁实例）。";
    } else {
        result += "\n编码器创建失败。";
    }
    return result;
}

// 拼接长期参考帧特性支持情况及支持的最大个数文本。
std::string BuildFeatureLtrResult(OH_AVCapability *capability, bool isSupported)
{
    std::string result = "长期参考帧特性支持情况: " + std::string(isSupported ? "支持" : "不支持");
    if (isSupported) {
        OH_AVFormat *properties = OH_AVCapability_GetFeatureProperties(capability, VIDEO_ENCODER_LONG_TERM_REFERENCE);
        if (properties != nullptr) {
            int32_t maxLTRCount = -1;
            [[maybe_unused]] bool getRet =
                OH_AVFormat_GetIntValue(properties, OH_FEATURE_PROPERTY_KEY_VIDEO_ENCODER_MAX_LTR_FRAME_COUNT,
                                        &maxLTRCount);
            result += "\n支持的最大长期参考帧个数: " + std::to_string(maxLTRCount);
            OH_AVFormat_Destroy(properties);
        }
    }
    return result;
}
} // namespace

std::string CapabilityQuery::QueryProfileAndLevel()
{
    SAMPLE_LOGI("Run QueryProfileAndLevel.");
    // [Start capability_profile_and_level]
    OH_AVCProfile profile = AVC_PROFILE_MAIN;
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true);
    if (capability == nullptr) {
        // 异常处理。
    }
    // 1. 确认待配置档次是否支持。
    const int32_t *profiles = nullptr;
    uint32_t profileNum = 0;
    int32_t ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileNum);
    if (ret != AV_ERR_OK || profiles == nullptr || profileNum == 0) {
        // 异常处理。
    }
    bool isMatched = IsProfileSupported(profiles, profileNum, profile);
    // 2. 查询待配置档次能支持的级别范围。
    const int32_t *levels = nullptr;
    uint32_t levelNum = 0;
    ret = OH_AVCapability_GetSupportedLevelsForProfile(capability, profile, &levels, &levelNum);
    if (ret != AV_ERR_OK || levels == nullptr || levelNum == 0) {
        // 异常处理。
    }
    OH_AVCLevel maxLevel = GetMaxSupportedLevel(levels, levelNum);
    // 3.（可选）基于支持的最大级别做业务逻辑区分。
    if (maxLevel >= AVC_LEVEL_51) {
        // level5.1以上，宽、高可配置3840x2160。
    } else if (maxLevel >= AVC_LEVEL_4) {
        // level4.0以上，宽、高可配1920x1080。
    } else if (maxLevel >= AVC_LEVEL_31) {
        // level3.1以上，宽、高可配1280x720。
    } else {
        // 报错，不做编码。
    }
    // 4. 配置档次参数。
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    OH_AVFormat *format = OH_AVFormat_CreateVideoFormat(OH_AVCODEC_MIMETYPE_VIDEO_AVC, 1920, 1080);
    if (!OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, profile)) {
        // 异常处理。
    }
    if (OH_VideoEncoder_Configure(videoEnc, format) != AV_ERR_OK) {
        // 异常处理。
    }
    OH_AVFormat_Destroy(format);
    // [End capability_profile_and_level]
    // 结果文本组装与示例实例清理由辅助函数完成。
    return BuildProfileAndLevelResult(capability, isMatched, maxLevel, videoEnc);
}

std::string CapabilityQuery::CheckProfileAndLevel()
{
    SAMPLE_LOGI("Run CheckProfileAndLevel.");
    // [Start capability_profile_level_supported]
    // 1. 获取H.264编码器能力实例。
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true);
    if (capability == nullptr) {
        // 异常处理。
    }
    // 2. 查询编码档次和级别是否支持。
    bool isSupported = OH_AVCapability_AreProfileAndLevelSupported(capability, AVC_PROFILE_MAIN, AVC_LEVEL_51);
    // [End capability_profile_level_supported]
    std::string result = "直接查询档次和级别组合支持情况：";
    if (capability == nullptr) {
        return result + "未获取到H.264编码器能力实例。";
    }
    result += "AVC_PROFILE_MAIN + AVC_LEVEL_51组合支持情况: " + std::string(isSupported ? "支持" : "不支持");
    return result;
}

std::string CapabilityQuery::CheckVideoSize()
{
    SAMPLE_LOGI("Run CheckVideoSize.");
    // [Start capability_video_size_check]
    int32_t width = 1920;
    int32_t height = 1080;
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true);
    if (capability == nullptr) {
        // 异常处理。
    }
    // 1. 确认视频宽高是否支持。
    bool isSupported = OH_AVCapability_IsVideoSizeSupported(capability, width, height);
    if (!isSupported) {
        // 2. (可选) 按已知视频高或已知视频宽查询详细限制，并调整。
    }
    // [End capability_video_size_check]
    std::string result = "校验视频宽高是否支持：";
    if (capability == nullptr) {
        return result + "未获取到推荐的H.264编码器。";
    }
    result += std::to_string(width) + "x" + std::to_string(height) + " 组合支持情况: " +
        std::string(isSupported ? "支持" : "不支持");
    return result;
}

std::string CapabilityQuery::QuerySizeForWidth()
{
    SAMPLE_LOGI("Run QuerySizeForWidth.");
    // [Start capability_video_size_for_width]
    int32_t width = 1920;
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true);
    if (capability == nullptr) {
        // 异常处理。
    }
    // 1. 确认视频宽符合宽对齐要求。
    int32_t widthAlignment = 0;
    int32_t ret = OH_AVCapability_GetVideoWidthAlignment(capability, &widthAlignment);
    if (ret != AV_ERR_OK || widthAlignment <= 0) {
        // 异常处理。
    }
    // 2. (可选) 对齐视频宽（对齐值有效时才计算，避免除零）。
    if (widthAlignment > 0 && width % widthAlignment != 0) {
        width = (width + widthAlignment - 1) / widthAlignment * widthAlignment;
    }
    // 3. 确认视频宽处在可支持宽范围内。
    OH_AVRange widthRange = {-1, -1};
    ret = OH_AVCapability_GetVideoWidthRange(capability, &widthRange);
    if (ret != AV_ERR_OK || widthRange.maxVal <= 0) {
        // 异常处理。
    } else if (width < widthRange.minVal || width > widthRange.maxVal) {
        // 4. (可选) 调整视频宽。
        width = std::min(std::max(width, widthRange.minVal), widthRange.maxVal);
    }
    // 5. 基于视频宽，获取可选视频高的范围。
    OH_AVRange heightRange = {-1, -1};
    ret = OH_AVCapability_GetVideoHeightRangeForWidth(capability, width, &heightRange);
    if (ret != AV_ERR_OK || heightRange.maxVal <= 0) {
        // 异常处理。
    }
    // 6. 从可选高度范围中挑选合适的高度配置。
    // [End capability_video_size_for_width]
    std::string result = "已知视频宽度查询可选高度范围：";
    if (capability == nullptr) {
        return result + "未获取到推荐的H.264编码器。";
    }
    result += "对齐后视频宽: " + std::to_string(width) + "，宽对齐: " + std::to_string(widthAlignment);
    result += "\n支持宽度范围: " + RangeToString(widthRange.minVal, widthRange.maxVal);
    if (heightRange.maxVal > 0) {
        result += "\n基于该宽度支持的高度范围: " + RangeToString(heightRange.minVal, heightRange.maxVal);
    }
    return result;
}

std::string CapabilityQuery::QuerySizeForHeight()
{
    SAMPLE_LOGI("Run QuerySizeForHeight.");
    // [Start capability_video_size_for_height]
    int32_t height = 1080;
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true);
    if (capability == nullptr) {
        // 异常处理。
    }
    // 1. 确认视频高符合高对齐要求。
    int32_t heightAlignment = 0;
    int32_t ret = OH_AVCapability_GetVideoHeightAlignment(capability, &heightAlignment);
    if (ret != AV_ERR_OK || heightAlignment <= 0) {
        // 异常处理。
    }
    // 2. (可选) 对齐视频高（对齐值有效时才计算，避免除零）。
    if (heightAlignment > 0 && height % heightAlignment != 0) {
        height = (height + heightAlignment - 1) / heightAlignment * heightAlignment;
    }
    // 3. 确认视频高处在可支持高范围内。
    OH_AVRange heightRange = {-1, -1};
    ret = OH_AVCapability_GetVideoHeightRange(capability, &heightRange);
    if (ret != AV_ERR_OK || heightRange.maxVal <= 0) {
        // 异常处理。
    } else if (height < heightRange.minVal || height > heightRange.maxVal) {
        // 4. (可选) 调整视频高。
        height = std::min(std::max(height, heightRange.minVal), heightRange.maxVal);
    }
    // 5. 基于视频高，获取可选视频宽的范围。
    OH_AVRange widthRange = {-1, -1};
    ret = OH_AVCapability_GetVideoWidthRangeForHeight(capability, height, &widthRange);
    if (ret != AV_ERR_OK || widthRange.maxVal <= 0) {
        // 异常处理。
    }
    // 6. 从可选宽度范围中挑选合适的宽度配置。
    // [End capability_video_size_for_height]
    std::string result = "已知视频高度查询可选宽度范围：";
    if (capability == nullptr) {
        return result + "未获取到推荐的H.264编码器。";
    }
    result += "对齐后视频高: " + std::to_string(height) + "，高对齐: " + std::to_string(heightAlignment);
    result += "\n支持高度范围: " + RangeToString(heightRange.minVal, heightRange.maxVal);
    if (widthRange.maxVal > 0) {
        result += "\n基于该高度支持的宽度范围: " + RangeToString(widthRange.minVal, widthRange.maxVal);
    }
    return result;
}

std::string CapabilityQuery::CheckFrameRateRange()
{
    SAMPLE_LOGI("Run CheckFrameRateRange.");
    // [Start capability_frame_rate_check]
    int32_t frameRate = 120;
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true);
    if (capability == nullptr) {
        // 异常处理。
    }
    // 1. 获取支持的帧率范围。
    OH_AVRange frameRateRange = {-1, -1};
    int32_t ret = OH_AVCapability_GetVideoFrameRateRange(capability, &frameRateRange);
    if (ret != AV_ERR_OK || frameRateRange.maxVal <= 0) {
        // 异常处理。
    }
    // 2. 判断是否在可选帧率范围内。
    bool isSupported = frameRate >= frameRateRange.minVal && frameRate <= frameRateRange.maxVal;
    // [End capability_frame_rate_check]
    std::string result = "校验视频帧率是否在可选范围内：";
    if (capability == nullptr) {
        return result + "未获取到推荐的H.264编码器。";
    }
    result += "支持帧率范围: " + RangeToString(frameRateRange.minVal, frameRateRange.maxVal);
    result += "\n目标帧率 " + std::to_string(frameRate) + " 支持情况: " + std::string(isSupported ? "支持" : "不支持");
    return result;
}

std::string CapabilityQuery::ConfigSizeAndFrameRate()
{
    SAMPLE_LOGI("Run ConfigSizeAndFrameRate.");
    // [Start capability_size_frame_rate_config]
    constexpr int32_t width = 1920;
    constexpr int32_t height = 1080;
    int32_t frameRate = 120;
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true);
    if (capability == nullptr) {
        // 异常处理。
    }
    // 1. 确认待配置尺寸是否能达到理想帧率。
    bool isSupported = OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, width, height, frameRate);
    if (!isSupported) {
        // 2. 基于待配置视频尺寸，查询支持的帧率范围，并基于查询到的帧率调整待配置帧率。
        OH_AVRange frameRateRange = {-1, -1};
        int32_t ret = OH_AVCapability_GetVideoFrameRateRangeForSize(capability, width, height, &frameRateRange);
        if (ret != AV_ERR_OK || frameRateRange.maxVal <= 0) {
            // 异常处理。
        }
        frameRate = std::min(std::max(frameRate, frameRateRange.minVal), frameRateRange.maxVal);
    }

    // 3. 配置尺寸和帧率参数。
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    if (videoEnc == nullptr) {
        // 异常处理。
    }
    OH_AVFormat *format = OH_AVFormat_CreateVideoFormat(OH_AVCODEC_MIMETYPE_VIDEO_AVC, width, height);
    if (format == nullptr) {
        // 异常处理。
    }
    if (!OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, static_cast<double>(frameRate))) {
        // 异常处理。
    }
    if (OH_VideoEncoder_Configure(videoEnc, format) != AV_ERR_OK) {
        // 异常处理。
    }
    OH_AVFormat_Destroy(format);
    // [End capability_size_frame_rate_config]
    std::string result = "配置尺寸和帧率参数：";
    if (capability == nullptr) {
        return result + "未获取到推荐的H.264编码器。";
    }
    result += std::to_string(width) + "x" + std::to_string(height) + " 实现 " + std::to_string(frameRate) +
        "fps 组合支持情况: " + std::string(isSupported ? "支持" : "不支持");
    if (!isSupported) {
        result += "（已按支持的帧率范围调整）";
    }
    result += videoEnc == nullptr ? "\n编码器创建失败。" : "\n尺寸和帧率参数配置完成（示例验证后已销毁实例）。";
    if (videoEnc != nullptr) {
        OH_VideoEncoder_Destroy(videoEnc);
    }
    return result;
}

std::string CapabilityQuery::QueryPixelFormats()
{
    SAMPLE_LOGI("Run QueryPixelFormats.");
    // [Start capability_pixel_formats]
    constexpr OH_AVPixelFormat DEFAULT_PIXELFORMAT = AV_PIXEL_FORMAT_NV12;
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true);
    if (capability == nullptr) {
        // 异常处理。
    }
    // 1. 获取当前视频编解码器支持的像素格式。
    const int32_t *pixFormats = nullptr;
    uint32_t pixFormatNum = 0;
    int32_t ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixFormats, &pixFormatNum);
    // 如需查询OH_NativeBuffer格式支持情况，可调用OH_AVCapability_GetVideoSupportedNativeBufferFormats接口，使用方式相同。
    if (ret != AV_ERR_OK || pixFormats == nullptr || pixFormatNum == 0) {
        // 异常处理。
    }
    // 2. 校验是否支持对应像素格式。
    bool isMatched = false;
    for (int i = 0; i < pixFormatNum; i++) {
        if (pixFormats[i] == DEFAULT_PIXELFORMAT) {
            isMatched = true;
            break;
        }
    }
    if (!isMatched) {
        // 3. 替换其他像素格式输入或选择其他编解码器。
    }
    // [End capability_pixel_formats]
    std::string result = "查询视频像素格式支持情况：";
    if (capability == nullptr) {
        return result + "未获取到推荐的H.264编码器。";
    }
    if (pixFormats != nullptr && pixFormatNum > 0) {
        result += "支持的像素格式: ";
        for (uint32_t i = 0; i < pixFormatNum; i++) {
            result += std::to_string(pixFormats[i]);
            if (i + 1 < pixFormatNum) {
                result += "、";
            }
        }
    }
    result += "\nAV_PIXEL_FORMAT_NV12 匹配情况: " + std::string(isMatched ? "支持" : "不支持");
    return result;
}

std::string CapabilityQuery::QueryFeatureLtr()
{
    SAMPLE_LOGI("Run QueryFeatureLtr.");
    // [Start capability_feature_ltr]
    constexpr int32_t NEEDED_LTR_NUM = 2;
    OH_AVFormat *format = OH_AVFormat_CreateVideoFormat(OH_AVCODEC_MIMETYPE_VIDEO_AVC, 1920, 1080);
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true);
    if (capability == nullptr) {
        // 异常处理。
    }
    // 1. 查询是否支持长期参考帧特性。
    bool isSupported = OH_AVCapability_IsFeatureSupported(capability, VIDEO_ENCODER_LONG_TERM_REFERENCE);
    if (isSupported) {
        // 2. 查询支持的长期参考帧个数。
        OH_AVFormat *properties = OH_AVCapability_GetFeatureProperties(capability, VIDEO_ENCODER_LONG_TERM_REFERENCE);
        if (properties == nullptr) {
            // 异常处理。
        }
        int32_t maxLTRCount = -1;
        bool ret = OH_AVFormat_GetIntValue(properties,
                                           OH_FEATURE_PROPERTY_KEY_VIDEO_ENCODER_MAX_LTR_FRAME_COUNT, &maxLTRCount);
        if (ret && maxLTRCount >= NEEDED_LTR_NUM) {
            if (!OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_LTR_FRAME_COUNT, NEEDED_LTR_NUM)) {
                // 异常处理。
            }
        }
        OH_AVFormat_Destroy(properties);
    }
    // 3. 编码器创建和配置。
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    if (OH_VideoEncoder_Configure(videoEnc, format) != AV_ERR_OK) {
        // 异常处理。
    }
    // [End capability_feature_ltr]
    std::string result = "查询长期参考帧特性支持情况：";
    if (capability == nullptr) {
        if (format != nullptr) {
            OH_AVFormat_Destroy(format);
        }
        return result + "未获取到推荐的H.264编码器。";
    }
    result += BuildFeatureLtrResult(capability, isSupported);
    result += videoEnc == nullptr ? "\n编码器创建失败。" : "\n编码器创建并配置完成（示例验证后已销毁实例）。";
    if (format != nullptr) {
        OH_AVFormat_Destroy(format);
    }
    if (videoEnc != nullptr) {
        OH_VideoEncoder_Destroy(videoEnc);
    }
    return result;
}

std::string CapabilityQuery::FindSecureDecoder()
{
    SAMPLE_LOGI("Run FindSecureDecoder.");
    // [Start capability_secure_decoder]
    // 1. 定义期望的MIME类型。
    const char *targetMime = OH_AVCODEC_MIMETYPE_VIDEO_AVC;
    uint32_t count = 0;

    // 2. 获取所有视频解码器的能力列表。
    OH_AVCapability **capabilityList = OH_AVCodec_GetCapabilityList(OH_AVCODEC_TYPE_VIDEO_DECODER, &count);

    // 3. 遍历能力列表，筛选目标MIME类型的安全解码器并创建实例。
    OH_AVCodec *secureVideoDec = nullptr;
    for (uint32_t i = 0; capabilityList != nullptr && i < count; i++) {
        OH_AVCapability *cap = capabilityList[i];
        // 4. 检查是否为目标的MIME类型，且必须是安全解码器。
        if (!OH_AVCapability_CheckMimeType(cap, targetMime) || !OH_AVCapability_IsSecure(cap)) {
            continue;
        }
        // 5. 找到符合条件的解码器，获取其名称用于创建实例。
        secureVideoDec = OH_VideoDecoder_CreateByName(OH_AVCapability_GetName(cap));
        if (secureVideoDec != nullptr) {
            // 6. 成功创建安全解码器，跳出循环执行后续业务。
            break;
        }
    }
    // [End capability_secure_decoder]
    // 说明：示例按文档完成安全解码器的查询与创建，创建的实例由业务方在使用完毕后调用OH_VideoDecoder_Destroy释放。
    std::string result = "筛选特定MIME类型的安全解码器（DRM播放场景）：";
    if (capabilityList == nullptr || count == 0) {
        return result + "未查询到视频解码器能力列表。";
    }
    const char *secureName = nullptr;
    for (uint32_t i = 0; i < count; i++) {
        if (OH_AVCapability_CheckMimeType(capabilityList[i], targetMime) &&
            OH_AVCapability_IsSecure(capabilityList[i])) {
            secureName = OH_AVCapability_GetName(capabilityList[i]);
            break;
        }
    }
    if (secureName != nullptr) {
        result += "已找到H.264安全解码器: " + SafeName(secureName);
    } else {
        result += "当前设备不存在H.264安全解码器（普通设备通常不提供DRM安全解码链路）。";
    }
    return result;
}
