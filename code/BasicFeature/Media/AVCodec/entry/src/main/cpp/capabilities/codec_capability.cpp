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

#include "codec_capability.h"

#include <algorithm>
#include <cmath>
#include <limits>

#include "av_codec_sample_log.h"

#undef LOG_TAG
#define LOG_TAG "CodecCapability"

namespace {
bool IsHardwareCodecType(int32_t codecType)
{
    return codecType == VIDEO_HW_DECODER || codecType == VIDEO_HW_ENCODER;
}

bool IsSoftwareCodecType(int32_t codecType)
{
    return codecType == VIDEO_SW_DECODER || codecType == VIDEO_SW_ENCODER;
}

bool ContainsValue(const int32_t *values, uint32_t valueCount, int32_t value)
{
    return values != nullptr && std::find(values, values + valueCount, value) != values + valueCount;
}

bool ValidateVideoSizeAndFrameRate(OH_AVCapability *capability, const VideoSampleInfo &video)
{
    if (!OH_AVCapability_IsVideoSizeSupported(capability, video.videoWidth, video.videoHeight)) {
        AVCODEC_SAMPLE_LOGE("Unsupported video size: %{public}d x %{public}d", video.videoWidth, video.videoHeight);
        return false;
    }
    if (video.frameRate <= 0.0 || video.frameRate > std::numeric_limits<int32_t>::max()) {
        AVCODEC_SAMPLE_LOGW("Skip frame rate capability check for unavailable frame rate: %{public}f", video.frameRate);
        return true;
    }
    int32_t frameRate = static_cast<int32_t>(std::lround(video.frameRate));
    if (!OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability, video.videoWidth,
        video.videoHeight, frameRate)) {
        AVCODEC_SAMPLE_LOGE("Unsupported video size/frame rate: %{public}d x %{public}d at %{public}f fps",
            video.videoWidth, video.videoHeight, video.frameRate);
        return false;
    }
    return true;
}

bool ValidateVideoPixelFormat(OH_AVCapability *capability, OH_AVPixelFormat pixelFormat)
{
    const int32_t *pixelFormats = nullptr;
    uint32_t pixelFormatCount = 0;
    OH_AVErrCode ret = OH_AVCapability_GetVideoSupportedPixelFormats(capability, &pixelFormats, &pixelFormatCount);
    if (ret != AV_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Query supported video pixel formats failed, ret: %{public}d", ret);
        return false;
    }
    if (!ContainsValue(pixelFormats, pixelFormatCount, static_cast<int32_t>(pixelFormat))) {
        AVCODEC_SAMPLE_LOGE("Unsupported video pixel format: %{public}d", static_cast<int32_t>(pixelFormat));
        return false;
    }
    return true;
}

bool ValidateVideoEncoderParameters(OH_AVCapability *capability, const VideoSampleInfo &video)
{
    if (!OH_AVCapability_IsEncoderBitrateModeSupported(capability, static_cast<OH_BitrateMode>(video.bitrateMode))) {
        AVCODEC_SAMPLE_LOGE("Unsupported video bitrate mode: %{public}u", video.bitrateMode);
        return false;
    }
    OH_AVRange bitrateRange = {};
    OH_AVErrCode ret = OH_AVCapability_GetEncoderBitrateRange(capability, &bitrateRange);
    if (ret != AV_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Query video bitrate range failed, ret: %{public}d", ret);
        return false;
    }
    if (video.bitrate < bitrateRange.minVal || video.bitrate > bitrateRange.maxVal) {
        AVCODEC_SAMPLE_LOGE("Unsupported video bitrate: %{public}" PRId64 ", supported range: [%{public}d, %{public}d]",
            video.bitrate, bitrateRange.minVal, bitrateRange.maxVal);
        return false;
    }
    const int32_t *profiles = nullptr;
    uint32_t profileCount = 0;
    ret = OH_AVCapability_GetSupportedProfiles(capability, &profiles, &profileCount);
    if (ret != AV_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Query supported video profiles failed, ret: %{public}d", ret);
        return false;
    }
    if (!ContainsValue(profiles, profileCount, video.hevcProfile)) {
        AVCODEC_SAMPLE_LOGE("Unsupported video profile: %{public}d", video.hevcProfile);
        return false;
    }
    return true;
}
} // namespace

namespace CodecCapability {
OH_AVCapability *GetCapability(const std::string &mime, bool isEncoder, int32_t codecType)
{
    if (mime.empty()) {
        AVCODEC_SAMPLE_LOGE("Cannot query capability with an empty mime, encoder: %{public}d", isEncoder);
        return nullptr;
    }
    if (IsHardwareCodecType(codecType)) {
        return OH_AVCodec_GetCapabilityByCategory(mime.c_str(), isEncoder, HARDWARE);
    }
    if (IsSoftwareCodecType(codecType)) {
        return OH_AVCodec_GetCapabilityByCategory(mime.c_str(), isEncoder, SOFTWARE);
    }
    return OH_AVCodec_GetCapability(mime.c_str(), isEncoder);
}

bool ValidateVideoConfiguration(const SampleInfo &sampleInfo, bool isEncoder)
{
    OH_AVCapability *capability = GetCapability(sampleInfo.video.videoCodecMime, isEncoder, sampleInfo.codec.codecType);
    if (capability == nullptr) {
        AVCODEC_SAMPLE_LOGE("No %{public}s capability for mime: %{public}s, codec type: %{public}d",
            isEncoder ? "encoder" : "decoder", sampleInfo.video.videoCodecMime.c_str(), sampleInfo.codec.codecType);
        return false;
    }
    if (!ValidateVideoSizeAndFrameRate(capability, sampleInfo.video) ||
        !ValidateVideoPixelFormat(capability, sampleInfo.video.pixelFormat)) {
        return false;
    }
    return !isEncoder || ValidateVideoEncoderParameters(capability, sampleInfo.video);
}

bool ValidateVideoFeatureConfiguration(const SampleInfo &sampleInfo)
{
    if (!sampleInfo.codec.enableLowLatency && !sampleInfo.codec.outputInDecodingOrder) {
        return true;
    }
    OH_AVCapability *capability = GetCapability(sampleInfo.video.videoCodecMime, false, sampleInfo.codec.codecType);
    if (capability == nullptr) {
        AVCODEC_SAMPLE_LOGE("No video decoder capability for feature query, mime: %{public}s",
            sampleInfo.video.videoCodecMime.c_str());
        return false;
    }
    if (sampleInfo.codec.enableLowLatency &&
        !OH_AVCapability_IsFeatureSupported(capability, VIDEO_LOW_LATENCY)) {
        AVCODEC_SAMPLE_LOGE("Video decoder does not support low-latency mode, mime: %{public}s",
            sampleInfo.video.videoCodecMime.c_str());
        return false;
    }
    if (sampleInfo.codec.outputInDecodingOrder &&
        !OH_AVCapability_IsFeatureSupported(capability, VIDEO_DECODER_OUTPUT_IN_DECODING_ORDER)) {
        AVCODEC_SAMPLE_LOGE("Video decoder does not support decoding-order output, mime: %{public}s",
            sampleInfo.video.videoCodecMime.c_str());
        return false;
    }
    return true;
}

bool ValidateAudioConfiguration(const SampleInfo &sampleInfo, bool isEncoder)
{
    OH_AVCapability *capability = GetCapability(sampleInfo.audio.audioCodecMime, isEncoder, AUTO);
    if (capability == nullptr) {
        AVCODEC_SAMPLE_LOGE("No %{public}s capability for mime: %{public}s", isEncoder ? "encoder" : "decoder",
            sampleInfo.audio.audioCodecMime.c_str());
        return false;
    }
    const int32_t *sampleRates = nullptr;
    uint32_t sampleRateCount = 0;
    OH_AVErrCode ret = OH_AVCapability_GetAudioSupportedSampleRates(capability, &sampleRates, &sampleRateCount);
    if (ret != AV_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Query supported audio sample rates failed, ret: %{public}d", ret);
        return false;
    }
    if (!ContainsValue(sampleRates, sampleRateCount, sampleInfo.audio.audioSampleRate)) {
        AVCODEC_SAMPLE_LOGE("Unsupported audio sample rate: %{public}d", sampleInfo.audio.audioSampleRate);
        return false;
    }
    OH_AVRange channelCountRange = {};
    ret = OH_AVCapability_GetAudioChannelCountRange(capability, &channelCountRange);
    if (ret != AV_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Query audio channel count range failed, ret: %{public}d", ret);
        return false;
    }
    if (sampleInfo.audio.audioChannelCount < channelCountRange.minVal ||
        sampleInfo.audio.audioChannelCount > channelCountRange.maxVal) {
        AVCODEC_SAMPLE_LOGE("Unsupported audio channel count: %{public}d, supported range: [%{public}d, %{public}d]",
            sampleInfo.audio.audioChannelCount, channelCountRange.minVal, channelCountRange.maxVal);
        return false;
    }
    return true;
}

} // namespace CodecCapability
