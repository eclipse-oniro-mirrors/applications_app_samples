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

#include "TranscodeJob.h"
#include <algorithm>
#include <cerrno>
#include <cmath>
#include <sys/statvfs.h>
#include <multimedia/player_framework/native_averrors.h>

namespace {
constexpr int32_t AUDIO_MODE_AAC = 1;
constexpr int32_t MAX_AUDIO_CHANNELS = 2;
constexpr int32_t MAX_AUDIO_SAMPLE_RATE = 96000;
constexpr int64_t FALLBACK_AUDIO_BITRATE = 192000;
constexpr int64_t STORAGE_RESERVE_BYTES = 64LL * 1024 * 1024;
constexpr int64_t US_PER_SECOND = 1000000;
constexpr double BITS_PER_BYTE = 8;
constexpr double STORAGE_ESTIMATE_MARGIN = 1.15;
} // namespace

bool TranscodeJob::InspectCodecs()
{
    const char *sourceMime = nullptr;
    if (!OH_AVFormat_GetStringValue(videoFormat_.get(), OH_MD_KEY_CODEC_MIME, &sourceMime)) {
        return Fail("Read source video MIME");
    }
    OH_AVCapability *capability = options_.encoderCategory == 0 ?
        OH_AVCodec_GetCapability(options_.mime.c_str(), true) :
        OH_AVCodec_GetCapabilityByCategory(options_.mime.c_str(), true,
            options_.encoderCategory == 1 ? HARDWARE : SOFTWARE);
    OH_AVCapability *decoderCapability = OH_AVCodec_GetCapability(sourceMime, false);
    if (!ValidateEncoder(capability) || decoderCapability == nullptr) {
        return Fail("Video codec capability unavailable");
    }
    const char *decoderName = OH_AVCapability_GetName(decoderCapability);
    const char *encoderName = OH_AVCapability_GetName(capability);
    if (decoderName == nullptr || encoderName == nullptr) { return Fail("Read codec names"); }
    if (!OH_AVCapability_AreVideoSizeAndFrameRateSupported(decoderCapability, sourceWidth_, sourceHeight_,
        static_cast<int32_t>(std::ceil(frameRate_)))) {
        return Fail("Decoder does not support the source size/frame-rate combination");
    }
    if (options_.audioMode == AUDIO_MODE_AAC && audioFormat_ != nullptr && !InspectAudio()) { return false; }
    {
        std::lock_guard<std::mutex> lock(snapshotMutex_);
        snapshot_.decoderName = decoderName;
        snapshot_.encoderName = encoderName;
    }
    return true;
}

bool TranscodeJob::ValidateEncoder(OH_AVCapability *capability)
{
    if (capability == nullptr || !OH_AVCapability_AreVideoSizeAndFrameRateSupported(capability,
        targetWidth_, targetHeight_, static_cast<int32_t>(std::ceil(frameRate_)))) {
        return Fail("Encoder does not support the selected size/frame-rate combination");
    }
    OH_AVRange range {};
    if (OH_AVCapability_GetEncoderBitrateRange(capability, &range) != AV_ERR_OK ||
        options_.bitrate < range.minVal || options_.bitrate > range.maxVal) {
        return Fail("Encoder bitrate is outside its supported range");
    }
    {
        std::lock_guard<std::mutex> lock(snapshotMutex_);
        snapshot_.minBitrate = range.minVal;
        snapshot_.maxBitrate = range.maxVal;
    }
    if (!options_.surface) {
        const int32_t *formats = nullptr;
        uint32_t count = 0;
        if (OH_AVCapability_GetVideoSupportedPixelFormats(capability, &formats, &count) != AV_ERR_OK ||
            formats == nullptr || std::find(formats, formats + count, AV_PIXEL_FORMAT_NV12) == formats + count) {
            return Fail("Encoder does not support NV12 Buffer input");
        }
    }
    return true;
}

bool TranscodeJob::CheckStorage(bool initial)
{
    const auto now = TranscodeMetrics::Clock::now();
    if (!initial && now - storageCheckedAt_ < std::chrono::seconds(1)) { return true; }
    struct statvfs space {};
    if (fstatvfs(options_.outputFd, &space) != 0) { return Fail("Query output storage", errno); }
    const uint64_t freeBytes = static_cast<uint64_t>(space.f_bavail) * space.f_frsize;
    const double seconds = durationUs_ > 0 ? static_cast<double>(durationUs_) / US_PER_SECOND : -1;
    int64_t audioBitrate = 0;
    if (audioFormat_ != nullptr) { OH_AVFormat_GetLongValue(audioFormat_.get(), OH_MD_KEY_BITRATE, &audioBitrate); }
    const double estimate = seconds > 0 ? seconds * (options_.bitrate + std::max<int64_t>(audioBitrate,
        audioTrack_ >= 0 ? FALLBACK_AUDIO_BITRATE : 0)) / BITS_PER_BYTE * STORAGE_ESTIMATE_MARGIN : -1;
    {
        std::lock_guard<std::mutex> lock(snapshotMutex_);
        snapshot_.availableBytes = static_cast<int64_t>(freeBytes);
        snapshot_.estimatedBytes = estimate > 0 && estimate < static_cast<double>(INT64_MAX) ?
            static_cast<int64_t>(estimate) : -1;
    }
    storageCheckedAt_ = now;
    if (freeBytes < STORAGE_RESERVE_BYTES ||
        (initial && estimate > 0 && estimate + STORAGE_RESERVE_BYTES > freeBytes)) {
        return Fail("Insufficient output storage (64 MiB reserve; VBR size is estimated)");
    }
    return true;
}

bool TranscodeJob::InspectAudio()
{
    const char *mime = nullptr;
    int32_t rate = 0;
    int32_t channels = 0;
    if (!OH_AVFormat_GetStringValue(audioFormat_.get(), OH_MD_KEY_CODEC_MIME, &mime) || mime == nullptr ||
        !OH_AVFormat_GetIntValue(audioFormat_.get(), OH_MD_KEY_AUD_SAMPLE_RATE, &rate) ||
        !OH_AVFormat_GetIntValue(audioFormat_.get(), OH_MD_KEY_AUD_CHANNEL_COUNT, &channels) ||
        channels < 1 || channels > MAX_AUDIO_CHANNELS || rate <= 0 || rate > MAX_AUDIO_SAMPLE_RATE ||
        OH_AVCodec_GetCapability(mime, false) == nullptr) {
        return Fail("AAC transcode requires an available decoder and a valid mono/stereo source");
    }
    OH_AVCapability *encoder = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    OH_AVRange range {};
    const int32_t *rates = nullptr;
    uint32_t count = 0;
    if (encoder == nullptr || OH_AVCapability_GetAudioChannelCountRange(encoder, &range) != AV_ERR_OK ||
        channels < range.minVal || channels > range.maxVal ||
        OH_AVCapability_GetAudioSupportedSampleRates(encoder, &rates, &count) != AV_ERR_OK || rates == nullptr ||
        std::find(rates, rates + count, rate) == rates + count ||
        OH_AVCapability_GetEncoderBitrateRange(encoder, &range) != AV_ERR_OK ||
        TranscodeAudioPipeline::TargetBitrate() < range.minVal ||
        TranscodeAudioPipeline::TargetBitrate() > range.maxVal) {
        return Fail("AAC encoder does not support the source sample rate/channels or 128 kbps");
    }
    return true;
}
