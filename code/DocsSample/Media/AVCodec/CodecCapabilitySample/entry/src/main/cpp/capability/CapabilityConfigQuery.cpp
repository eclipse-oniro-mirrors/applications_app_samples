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

std::string CapabilityQuery::BitrateModeCbr()
{
    SAMPLE_LOGI("Run BitrateModeCbr.");
    // [Start capability_bitrate_mode_cbr_vbr]
    OH_BitrateMode bitrateMode = BITRATE_MODE_CBR;
    int32_t bitrate = 3000000;
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true);
    if (capability == nullptr) {
       // 异常处理。
    }
    // 1. 确认待配置码控模式是否支持。
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(capability, bitrateMode);
    if (!isSupported) {
       // 异常处理。
    }
    // 2. 获取码率范围，判断待配置码率参数是否在范围内。
    OH_AVRange bitrateRange = {-1, -1};
    int32_t ret = OH_AVCapability_GetEncoderBitrateRange(capability, &bitrateRange);
    if (ret != AV_ERR_OK || bitrateRange.maxVal <= 0) {
       // 异常处理。
    }
    if (bitrate > bitrateRange.maxVal || bitrate < bitrateRange.minVal) {
       // 3.（可选）调整待配置码率参数。
    }
    // 4. 配置编码参数。
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    if (videoEnc == nullptr) {
       // 异常处理。
    }
    OH_AVFormat *format = OH_AVFormat_CreateVideoFormat(OH_AVCODEC_MIMETYPE_VIDEO_AVC, 1920, 1080);
    if (format == nullptr) {
       // 异常处理。
    }
    if (!OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, bitrateMode) ||
       !OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, static_cast<int64_t>(bitrate))) {
       // 异常处理。
    }
    if (OH_VideoEncoder_Configure(videoEnc, format) != AV_ERR_OK) {
       // 异常处理。
    }
    OH_AVFormat_Destroy(format);
    // [End capability_bitrate_mode_cbr_vbr]
    std::string result = "控制编码质量（CBR/VBR）：";
    if (capability == nullptr) {
        return result + "未获取到推荐的H.264编码器。";
    }
    result += "CBR码控模式支持情况: " + std::string(isSupported ? "支持" : "不支持");
    result += "\n支持码率范围: " + RangeToString(bitrateRange.minVal, bitrateRange.maxVal);
    result += "\n待配置码率 " + std::to_string(bitrate) + "，编码器";
    result += videoEnc == nullptr ? "创建失败。" : "创建并配置完成（示例验证后已销毁实例）。";
    if (videoEnc != nullptr) {
        OH_VideoEncoder_Destroy(videoEnc);
    }
    return result;
}

std::string CapabilityQuery::BitrateModeCq()
{
    SAMPLE_LOGI("Run BitrateModeCq.");
    // [Start capability_bitrate_mode_cq]
    OH_BitrateMode bitrateMode = BITRATE_MODE_CQ;
    int32_t quality = 0;
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true);
    if (capability == nullptr) {
       // 异常处理。
    }
    // 1. 确认待配置码控模式是否支持。
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(capability, bitrateMode);
    if (!isSupported) {
       // 异常处理。
    }
    // 2. 获取质量范围，判断待配置质量参数是否在范围内。
    OH_AVRange qualityRange = {-1, -1};
    int32_t ret = OH_AVCapability_GetEncoderQualityRange(capability, &qualityRange);
    if (ret != AV_ERR_OK || qualityRange.maxVal < 0) {
       // 异常处理。
    }
    if (quality > qualityRange.maxVal || quality < qualityRange.minVal) {
       // 3.（可选）调整待配置质量参数。
    }
    // 4. 配置编码参数。
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    if (videoEnc == nullptr) {
       // 异常处理。
    }
    OH_AVFormat *format = OH_AVFormat_CreateVideoFormat(OH_AVCODEC_MIMETYPE_VIDEO_AVC, 1920, 1080);
    if (format == nullptr) {
       // 异常处理。
    }
    if (!OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, bitrateMode) ||
       !OH_AVFormat_SetIntValue(format, OH_MD_KEY_QUALITY, quality)) {
       // 异常处理。
    }
    if (OH_VideoEncoder_Configure(videoEnc, format) != AV_ERR_OK) {
       // 异常处理。
    }
    OH_AVFormat_Destroy(format);
    // [End capability_bitrate_mode_cq]
    std::string result = "控制编码质量（CQ）：";
    if (capability == nullptr) {
        return result + "未获取到推荐的H.264编码器。";
    }
    result += "CQ码控模式支持情况: " + std::string(isSupported ? "支持" : "不支持");
    result += "\n支持质量范围: " + RangeToString(qualityRange.minVal, qualityRange.maxVal);
    result += "\n待配置质量参数 " + std::to_string(quality) + "，编码器";
    result += videoEnc == nullptr ? "创建失败。" : "创建并配置完成（示例验证后已销毁实例）。";
    if (videoEnc != nullptr) {
        OH_VideoEncoder_Destroy(videoEnc);
    }
    return result;
}

std::string CapabilityQuery::BitrateModeSqr()
{
    SAMPLE_LOGI("Run BitrateModeSqr.");
    // [Start capability_bitrate_mode_sqr]
    OH_BitrateMode bitrateMode = BITRATE_MODE_SQR;
    int32_t sqrFactor = 30; // 质量稳定码率因子。
    int32_t maxBitrate = 20000000; // 最大码率。
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true);
    if (capability == nullptr) {
       // 异常处理。
    }
    // 1. 确认待配置码控模式是否支持。
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(capability, bitrateMode);
    if (!isSupported) {
       // 异常处理。
    }
    // 2. 获取码率范围，判断待配置最大码率参数是否在范围内。
    OH_AVRange bitrateRange = {-1, -1};
    // 最大码率参数的取值范围同码率参数，故复用OH_AVCapability_GetEncoderBitrateRange获取取值范围。
    int32_t ret = OH_AVCapability_GetEncoderBitrateRange(capability, &bitrateRange);
    if (ret != AV_ERR_OK || bitrateRange.maxVal <= 0) {
       // 异常处理。
    }

    // 质量稳定码率因子取值范围为[0, 51]（同编码量化参数QP）。
    if (sqrFactor > 51 || sqrFactor < 0) {
       // 3.（可选）调整待配置质量稳定码率因子参数。
    }

    if (maxBitrate > bitrateRange.maxVal || maxBitrate < bitrateRange.minVal) {
       // 4.（可选）调整待配置最大码率参数。
    }

    // 5. 配置编码参数。
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
    if (videoEnc == nullptr) {
       // 异常处理。
    }
    OH_AVFormat *format = OH_AVFormat_CreateVideoFormat(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, 1920, 1080);
    if (format == nullptr) {
       // 异常处理。
    }
    if (!OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, bitrateMode) ||
       !OH_AVFormat_SetIntValue(format, OH_MD_KEY_SQR_FACTOR, sqrFactor) ||
       !OH_AVFormat_SetLongValue(format, OH_MD_KEY_MAX_BITRATE, maxBitrate)) {
       // 异常处理。
    }
    if (OH_VideoEncoder_Configure(videoEnc, format) != AV_ERR_OK) {
       // 异常处理。
    }
    OH_AVFormat_Destroy(format);

    // 6. 启动编码器，开始编码。
    ret = OH_VideoEncoder_Prepare(videoEnc);
    if (ret != AV_ERR_OK) {
       // 异常处理。
    }
    ret = OH_VideoEncoder_Start(videoEnc);
    if (ret != AV_ERR_OK) {
       // 异常处理。
    }

    // 7.（可选）OH_VideoEncoder_SetParameter()在运行过程中动态配置质量稳定码率因子参数和最大码率参数。
    OH_AVFormat *dynamicFormat = OH_AVFormat_Create();
    // SQR码控支持动态配置最大码率参数和质量稳定码率因子参数。
    sqrFactor = 25; // 更新质量稳定码率因子。
    maxBitrate = 10000000; // 更新最大码率参数。
    OH_AVFormat_SetLongValue(dynamicFormat, OH_MD_KEY_MAX_BITRATE, maxBitrate);
    OH_AVFormat_SetIntValue(dynamicFormat, OH_MD_KEY_SQR_FACTOR, sqrFactor);
    ret = OH_VideoEncoder_SetParameter(videoEnc, dynamicFormat);
    if (ret != AV_ERR_OK) {
       // 异常处理。
    }
    OH_AVFormat_Destroy(dynamicFormat);
    // [End capability_bitrate_mode_sqr]
    std::string result = "控制编码质量（SQR）：";
    if (capability == nullptr) {
        return result + "未获取到推荐的H.265编码器。";
    }
    result += "SQR码控模式支持情况: " + std::string(isSupported ? "支持" : "不支持");
    result += "\n支持码率范围: " + RangeToString(bitrateRange.minVal, bitrateRange.maxVal);
    result += "\n质量稳定码率因子: " + std::to_string(sqrFactor) + "，最大码率: " + std::to_string(maxBitrate);
    result += videoEnc == nullptr ? "\n编码器创建失败。" : "\n编码器已启动并完成动态参数配置（示例验证后已停止并销毁实例）。";
    if (videoEnc != nullptr) {
        OH_VideoEncoder_Stop(videoEnc);
        OH_VideoEncoder_Destroy(videoEnc);
    }
    return result;
}

std::string CapabilityQuery::BitrateModeCbrhq()
{
    SAMPLE_LOGI("Run BitrateModeCbrhq.");
    // [Start capability_bitrate_mode_cbrhq]
    OH_BitrateMode bitrateMode = BITRATE_MODE_CBR_HIGH_QUALITY;
    int32_t bitrate = 3000000;
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true);
    if (capability == nullptr) {
       // 异常处理。
    }
    // 1. 确认待配置码控模式是否支持。
    bool isSupported = OH_AVCapability_IsEncoderBitrateModeSupported(capability, bitrateMode);
    if (!isSupported) {
       // 异常处理。
    }
    // 2. 获取码率范围，判断待配置最大码率参数是否在范围内。
    OH_AVRange bitrateRange = {-1, -1};
    // 最大码率参数的取值范围同码率参数，故复用OH_AVCapability_GetEncoderBitrateRange获取取值范围。
    int32_t ret = OH_AVCapability_GetEncoderBitrateRange(capability, &bitrateRange);
    if (ret != AV_ERR_OK || bitrateRange.maxVal <= 0) {
       // 异常处理。
    }

    if (bitrate > bitrateRange.maxVal || bitrate < bitrateRange.minVal) {
       // 3.（可选）调整待配置最大码率参数。
    }

    // 4. 配置编码参数。
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
    if (videoEnc == nullptr) {
       // 异常处理。
    }
    OH_AVFormat *format = OH_AVFormat_CreateVideoFormat(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, 1920, 1080);
    if (format == nullptr) {
       // 异常处理。
    }
    if (!OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, bitrateMode) ||
       !OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, static_cast<int64_t>(bitrate))) {
       // 异常处理。
    }
    if (OH_VideoEncoder_Configure(videoEnc, format) != AV_ERR_OK) {
       // 异常处理。
    }
    OH_AVFormat_Destroy(format);
    // [End capability_bitrate_mode_cbrhq]
    std::string result = "控制编码质量（CBRHQ）：";
    if (capability == nullptr) {
        return result + "未获取到推荐的H.265编码器。";
    }
    result += "CBRHQ码控模式支持情况: " + std::string(isSupported ? "支持" : "不支持");
    if (!isSupported) {
        result += "（不支持时平台会自动使用CBR码控模式替代）";
    }
    result += "\n支持码率范围: " + RangeToString(bitrateRange.minVal, bitrateRange.maxVal);
    result += "\n待配置码率 " + std::to_string(bitrate) + "，编码器";
    result += videoEnc == nullptr ? "创建失败。" : "创建并配置完成（示例验证后已销毁实例）。";
    if (videoEnc != nullptr) {
        OH_VideoEncoder_Destroy(videoEnc);
    }
    return result;
}

std::string CapabilityQuery::QueryComplexityRange()
{
    SAMPLE_LOGI("Run QueryComplexityRange.");
    // [Start capability_complexity_range]
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    if (capability == nullptr) {
       // 异常处理。
    }
    // 确认支持的编码复杂度范围。
    OH_AVRange complexityRange = {-1, -1};
    int32_t ret = OH_AVCapability_GetEncoderComplexityRange(capability, &complexityRange);
    // [End capability_complexity_range]
    std::string result = "查询编码器支持复杂度范围：";
    if (capability == nullptr) {
        return result + "未获取到推荐的AAC编码器。";
    }
    if (ret != AV_ERR_OK) {
        return result + "复杂度范围查询失败，错误码: " + std::to_string(ret);
    }
    if (complexityRange.minVal == 0 && complexityRange.maxVal == 0) {
        result += "当前编码器不支持复杂度等级配置。";
    } else {
        result += "支持的复杂度等级范围: " + RangeToString(complexityRange.minVal, complexityRange.maxVal);
    }
    return result;
}

std::string CapabilityQuery::QueryAudioParams()
{
    SAMPLE_LOGI("Run QueryAudioParams.");
    // [Start capability_audio_params]
    int32_t sampleRate = 44100;
    int32_t channelCount = 2;
    int32_t bitrate = 261000;
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    if (capability == nullptr) {
       // 异常处理。
    }
    // 1. 确认待配置采样率是否支持。
    OH_AVRange *sampleRateRanges = nullptr;
    uint32_t rangesNum = 0;
    int32_t ret = OH_AVCapability_GetAudioSupportedSampleRateRanges(capability, &sampleRateRanges, &rangesNum);
    if (ret != AV_ERR_OK || sampleRateRanges == nullptr || rangesNum == 0) {
       // 异常处理。
    }
    bool isMatched = false;
    for (uint32_t i = 0; i < rangesNum; i++) {
       if (sampleRate >= sampleRateRanges[i].minVal && sampleRate <= sampleRateRanges[i].maxVal) {
          isMatched = true;
          break;
       }
    }
    if (!isMatched) {
       // 2.（可选）调整待配置采样率。
    }
    // 3. 获取通道数范围，判断待配置通道数参数是否在范围内。
    OH_AVRange channelRange = {-1, -1};
    ret = OH_AVCapability_GetAudioChannelCountRange(capability, &channelRange);
    if (ret != AV_ERR_OK || channelRange.maxVal <= 0) {
       // 异常处理。
    }
    if (channelCount > channelRange.maxVal || channelCount < channelRange.minVal ) {
       // 4.（可选）调整待配置通道数。
    }
    // 5. 获取码率范围，判断待配置码率参数是否在范围内。
    OH_AVRange bitrateRange = {-1, -1};
    ret = OH_AVCapability_GetEncoderBitrateRange(capability, &bitrateRange);
    if (ret != AV_ERR_OK || bitrateRange.maxVal <= 0) {
       // 异常处理。
    }
    if (bitrate > bitrateRange.maxVal || bitrate < bitrateRange.minVal ) {
       // 6.（可选）调整待配置码率值。
    }
    // 7. 配置编码参数。
    OH_AVCodec *audioEnc = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    if (audioEnc == nullptr) {
       // 异常处理。
    }
    OH_AVFormat *format = OH_AVFormat_Create();
    if (format == nullptr) {
       // 异常处理。
    }
    if (!OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, sampleRate) ||
       !OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, channelCount) ||
       !OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, static_cast<int64_t>(bitrate))) {
       // 异常处理。
    }
    if (OH_AudioCodec_Configure(audioEnc, format) != AV_ERR_OK) {
       // 异常处理。
    }
    OH_AVFormat_Destroy(format);
    // [End capability_audio_params]
    std::string result = "设置正确的音频编解码参数：";
    if (capability == nullptr) {
        return result + "未获取到推荐的AAC编码器。";
    }
    if (sampleRateRanges != nullptr && rangesNum > 0) {
        result += "\n支持的采样率范围: ";
        for (uint32_t i = 0; i < rangesNum; i++) {
            result += RangeToString(sampleRateRanges[i].minVal, sampleRateRanges[i].maxVal);
            if (i + 1 < rangesNum) {
                result += "、";
            }
        }
        result += "\n采样率 " + std::to_string(sampleRate) + " 匹配情况: " + std::string(isMatched ? "支持" : "不支持");
    }
    result += "\n支持通道数范围: " + RangeToString(channelRange.minVal, channelRange.maxVal);
    result += "\n支持码率范围: " + RangeToString(bitrateRange.minVal, bitrateRange.maxVal);
    result += audioEnc == nullptr ? "\n音频编码器创建失败。" : "\n音频编码器创建并配置完成（示例验证后已销毁实例）。";
    if (audioEnc != nullptr) {
        OH_AudioCodec_Destroy(audioEnc);
    }
    return result;
}
