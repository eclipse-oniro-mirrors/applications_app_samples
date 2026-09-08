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

#include "demuxer.h"
#include <cstdint>
#include <cstring>

#undef LOG_TAG
#define LOG_TAG "Demuxer"

namespace {
constexpr size_t CODEC_CONFIG_LOG_BYTES = 2;
using namespace std;
constexpr size_t MAX_CODEC_CONFIG_SIZE = 1024 * 1024;

string CopyFormatDump(OH_AVFormat *format)
{
    const char *dump = OH_AVFormat_DumpInfo(format);
    return dump == nullptr ? "" : dump;
}
}

Demuxer::~Demuxer() { Release(); }

int32_t Demuxer::Create(SampleInfo &info)
{
    videoTrackId_ = -1;
    audioTrackId_ = -1;
    info.audio.trackIndex = -1;
    /**
     * // Need request Internet Permission first in module.json.
     * const char *url = "https://hd.ijycnd.com/play/Ddw1W2Ra/index.m3u8";
     * source_ = OH_AVSource_CreateWithURI(const_cast<char *>(url));
     */
    source_ = OH_AVSource_CreateWithFD(info.source.inputFd, info.source.inputFileOffset, info.source.inputFileSize);
    CHECK_AND_RETURN_RET_LOG(source_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR,
        "Create demuxer source failed, fd: %{public}d, offset: %{public}" PRId64", file size: %{public}" PRId64,
        info.source.inputFd, info.source.inputFileOffset, info.source.inputFileSize);
    demuxer_ = OH_AVDemuxer_CreateWithSource(source_);
    CHECK_AND_RETURN_RET_LOG(demuxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Create demuxer failed");

    auto sourceFormat = std::shared_ptr<OH_AVFormat>(OH_AVSource_GetSourceFormat(source_), OH_AVFormat_Destroy);
    CHECK_AND_RETURN_RET_LOG(sourceFormat != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Get source format failed");

    // Validate an explicitly requested audio track before scanning tracks. If
    // it is not an audio track, retain the historical first-audio fallback.
    if (info.codec.audioTrackIndex >= 0) {
        auto requestedFormat = GetTrackFormat(info.codec.audioTrackIndex);
        if (requestedFormat == nullptr || GetTrackType(requestedFormat) != MEDIA_TYPE_AUD) {
            AVCODEC_SAMPLE_LOGW("Requested audio track is unavailable, fallback to first audio track: %{public}d",
                info.codec.audioTrackIndex);
            info.codec.audioTrackIndex = -1;
        }
    }

    int32_t ret = GetTrackInfo(sourceFormat, info);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Get video track info failed");

    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Demuxer::ReadSample(int32_t trackId, OH_AVBuffer *buffer, OH_AVCodecBufferAttr &attr)
{
    std::lock_guard<std::mutex> lock(demuxerMutex_);
    CHECK_AND_RETURN_RET_LOG(demuxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Demuxer is null");
    int32_t ret = OH_AVDemuxer_ReadSampleBuffer(demuxer_, trackId, buffer);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Read sample failed");
    ret = OH_AVBuffer_GetBufferAttr(buffer, &attr);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "GetBufferAttr failed");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Demuxer::SelectAudioTrack(int32_t trackIndex, SampleInfo &info)
{
    std::lock_guard<std::mutex> lock(demuxerMutex_);
    CHECK_AND_RETURN_RET_LOG(demuxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Demuxer is null");
    auto trackFormat = GetTrackFormat(trackIndex);
    CHECK_AND_RETURN_RET_LOG(trackFormat != nullptr, AVCODEC_SAMPLE_ERR_ERROR,
        "Get audio track format failed, index: %{public}d", trackIndex);
    CHECK_AND_RETURN_RET_LOG(GetTrackType(trackFormat) == MEDIA_TYPE_AUD, AVCODEC_SAMPLE_ERR_ERROR,
        "Selected track is not an audio track, index: %{public}d", trackIndex);
    // Parse into a temporary object first. A failed switch must leave both the
    // current metadata and the demuxer's selected-track set untouched.
    SampleInfo candidateInfo = info;
    CHECK_AND_RETURN_RET_LOG(PopulateAudioTrackInfo(trackFormat, trackIndex, candidateInfo) == AVCODEC_SAMPLE_ERR_OK,
        AVCODEC_SAMPLE_ERR_ERROR, "Parse audio track failed, index: %{public}d", trackIndex);

    // Keep the selected-track set in sync for APIs that require a track to be
    // selected before seeking or reading. Remove the old audio track first so
    // the demuxer does not keep advancing an abandoned audio stream.
    const int32_t previousTrackId = audioTrackId_;
    if (previousTrackId >= 0 && previousTrackId != trackIndex) {
        OH_AVDemuxer_UnselectTrackByID(demuxer_, static_cast<uint32_t>(previousTrackId));
    }
    if (OH_AVDemuxer_SelectTrackByID(demuxer_, static_cast<uint32_t>(trackIndex)) != AV_ERR_OK) {
        if (previousTrackId >= 0) {
            OH_AVDemuxer_SelectTrackByID(demuxer_, static_cast<uint32_t>(previousTrackId));
        }
        AVCODEC_SAMPLE_LOGE("Select audio track failed, index: %{public}d", trackIndex);
        return AVCODEC_SAMPLE_ERR_ERROR;
    }

    info.audio = candidateInfo.audio;
    // ReadSample() uses this explicit container track id for every audio
    // request. Keep it in sync with the metadata selected above.
    audioTrackId_ = trackIndex;
    LogAudioConfig(info, info.audio.audioCodecMime.c_str());
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Demuxer::GetAudioTrackInfo(int32_t trackIndex, AudioSampleInfo &audioInfo)
{
    std::lock_guard<std::mutex> lock(demuxerMutex_);
    CHECK_AND_RETURN_RET_LOG(demuxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Demuxer is null");
    auto trackFormat = GetTrackFormat(trackIndex);
    CHECK_AND_RETURN_RET_LOG(trackFormat != nullptr && GetTrackType(trackFormat) == MEDIA_TYPE_AUD,
        AVCODEC_SAMPLE_ERR_ERROR, "Audio track is unavailable, index: %{public}d", trackIndex);
    SampleInfo candidateInfo;
    CHECK_AND_RETURN_RET_LOG(PopulateAudioTrackInfo(trackFormat, trackIndex, candidateInfo) == AVCODEC_SAMPLE_ERR_OK,
        AVCODEC_SAMPLE_ERR_ERROR, "Parse audio track failed, index: %{public}d", trackIndex);
    audioInfo = std::move(candidateInfo.audio);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Demuxer::Release()
{
    std::lock_guard<std::mutex> lock(demuxerMutex_);
    if (demuxer_ != nullptr) {
        OH_AVDemuxer_Destroy(demuxer_);
        demuxer_ = nullptr;
    }
    if (source_ != nullptr) {
        OH_AVSource_Destroy(source_);
        source_ = nullptr;
    }
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Demuxer::GetTrackInfo(std::shared_ptr<OH_AVFormat> sourceFormat, SampleInfo &info)
{
    OH_AVFormat_GetLongValue(sourceFormat.get(), OH_MD_KEY_DURATION, &info.source.durationUs);
    OH_AVFormat_GetIntValue(sourceFormat.get(), OH_MD_KEY_TRACK_COUNT, &info.source.trackCount);
    info.source.sourceFormatDump = CopyFormatDump(sourceFormat.get());
    info.source.trackFormats.clear();
    for (int32_t index = 0; index < info.source.trackCount; index++) {
        auto trackFormat = GetTrackFormat(index);
        if (trackFormat == nullptr) {
            AVCODEC_SAMPLE_LOGW("Get track format failed, index: %{public}d", index);
            continue;
        }
        int trackType = GetTrackType(trackFormat);
        SaveTrackFormat(trackFormat, index, trackType, info);
        if (trackType == MEDIA_TYPE_VID) {
            ProcessVideoTrack(trackFormat, index, info);
        } else if (trackType == MEDIA_TYPE_AUD) {
            ProcessAudioTrack(trackFormat, index, info);
        }
    }
    return AVCODEC_SAMPLE_ERR_OK;
}

std::shared_ptr<OH_AVFormat> Demuxer::GetTrackFormat(int32_t index)
{
    return std::shared_ptr<OH_AVFormat>(OH_AVSource_GetTrackFormat(source_, index), OH_AVFormat_Destroy);
}

int Demuxer::GetTrackType(std::shared_ptr<OH_AVFormat> trackFormat)
{
    int trackType = -1;
    OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_TRACK_TYPE, &trackType);
    return trackType;
}

void Demuxer::SaveTrackFormat(std::shared_ptr<OH_AVFormat> trackFormat, int32_t index, int32_t trackType,
    SampleInfo &info)
{
    MediaTrackFormatInfo trackInfo;
    trackInfo.trackIndex = index;
    trackInfo.trackType = trackType;
    char *codecMime = nullptr;
    OH_AVFormat_GetStringValue(trackFormat.get(), OH_MD_KEY_CODEC_MIME, const_cast<char const **>(&codecMime));
    trackInfo.codecMime = codecMime == nullptr ? "" : codecMime;
    if (trackType == MEDIA_TYPE_AUD) {
        OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_AUD_SAMPLE_RATE, &trackInfo.audioSampleRate);
        OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_AUD_CHANNEL_COUNT, &trackInfo.audioChannelCount);
    }
    OH_AVFormat_GetLongValue(trackFormat.get(), OH_MD_KEY_BITRATE, &trackInfo.bitrate);
    trackInfo.formatDump = CopyFormatDump(trackFormat.get());
    info.source.trackFormats.push_back(std::move(trackInfo));
}

void Demuxer::ProcessVideoTrack(std::shared_ptr<OH_AVFormat> trackFormat, int32_t index, SampleInfo &info)
{
    OH_AVDemuxer_SelectTrackByID(demuxer_, index);
    
    char *videoCodecMime;
    OH_AVFormat_GetStringValue(trackFormat.get(), OH_MD_KEY_CODEC_MIME, const_cast<char const **>(&videoCodecMime));
    if (videoCodecMime == nullptr || strncmp(videoCodecMime, "video/", strlen("video/")) != 0) {
        AVCODEC_SAMPLE_LOGW("Not a video track, mime: %{public}s", videoCodecMime);
        return;
    }
    
    OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_WIDTH, &info.video.videoWidth);
    OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_HEIGHT, &info.video.videoHeight);
    OH_AVFormat_GetDoubleValue(trackFormat.get(), OH_MD_KEY_FRAME_RATE, &info.video.frameRate);
    OH_AVFormat_GetLongValue(trackFormat.get(), OH_MD_KEY_BITRATE, &info.video.bitrate);
    OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_ROTATION, &info.video.rotation);
    int32_t hdrVividContainerSignaled = 0;
    if (OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_VIDEO_IS_HDR_VIVID,
        &hdrVividContainerSignaled)) {
        info.video.hdrVividContainerSignaled = hdrVividContainerSignaled == 1;
    }
    
    info.video.videoCodecMime = videoCodecMime;
    OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_PROFILE, &info.video.hevcProfile);
    videoTrackId_ = index;
    
    LogVideoConfig(info, videoCodecMime);
}

void Demuxer::ProcessAudioTrack(std::shared_ptr<OH_AVFormat> trackFormat, int32_t index, SampleInfo &info)
{
    // Keep the first audio track by default. A caller may explicitly select a
    // container track index through CodecOptions::audioTrackIndex.
    if (info.audio.trackIndex >= 0 ||
        (info.codec.audioTrackIndex >= 0 && info.codec.audioTrackIndex != index)) {
        return;
    }
    OH_AVDemuxer_SelectTrackByID(demuxer_, index);
    if (PopulateAudioTrackInfo(trackFormat, index, info) != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGW("Parse audio track failed, index: %{public}d", index);
        return;
    }
    audioTrackId_ = index;

    LogAudioConfig(info, info.audio.audioCodecMime.c_str());
}

int32_t Demuxer::PopulateAudioTrackInfo(std::shared_ptr<OH_AVFormat> trackFormat, int32_t trackIndex,
    SampleInfo &info)
{
    char *audioCodecMime = nullptr;
    OH_AVFormat_GetStringValue(trackFormat.get(), OH_MD_KEY_CODEC_MIME, const_cast<char const **>(&audioCodecMime));
    CHECK_AND_RETURN_RET_LOG(audioCodecMime != nullptr, AVCODEC_SAMPLE_ERR_ERROR,
        "Audio track mime is null, index: %{public}d", trackIndex);
    AudioSampleInfo audioInfo;
    audioInfo.trackIndex = trackIndex;
    OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_AUDIO_SAMPLE_FORMAT, &audioInfo.audioSampleFormat);
    OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_AUD_CHANNEL_COUNT, &audioInfo.audioChannelCount);
    OH_AVFormat_GetLongValue(trackFormat.get(), OH_MD_KEY_CHANNEL_LAYOUT, &audioInfo.audioChannelLayout);
    OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_AUD_SAMPLE_RATE, &audioInfo.audioSampleRate);
    OH_AVFormat_GetLongValue(trackFormat.get(), OH_MD_KEY_BITRATE, &audioInfo.audioBitRate);
    info.audio = std::move(audioInfo);
    HandleCodecConfig(trackFormat, info);
    OH_AVFormat_GetIntValue(trackFormat.get(), OH_MD_KEY_AAC_IS_ADTS, &info.audio.aacAdts);
    info.audio.audioCodecMime = audioCodecMime;
    return AVCODEC_SAMPLE_ERR_OK;
}

void Demuxer::HandleCodecConfig(std::shared_ptr<OH_AVFormat> trackFormat, SampleInfo &info)
{
    uint8_t *sourceCodecConfig = nullptr;
    size_t sourceLength = 0;
    info.audio.codecConfigLen = 0;
    info.audio.codecConfig.clear();
    OH_AVFormat_GetBuffer(trackFormat.get(), OH_MD_KEY_CODEC_CONFIG, &sourceCodecConfig, &sourceLength);

    if (sourceCodecConfig != nullptr && sourceLength > 0 && sourceLength <= MAX_CODEC_CONFIG_SIZE) {
        info.audio.codecConfigLen = sourceLength;
        info.audio.codecConfig.assign(sourceCodecConfig, sourceCodecConfig + sourceLength);
        LogCodecConfigDetails(info);
    } else if (sourceLength > MAX_CODEC_CONFIG_SIZE) {
        AVCODEC_SAMPLE_LOGW("Codec config is too large, skip it, size: %{public}zu, limit: %{public}zu",
            sourceLength, MAX_CODEC_CONFIG_SIZE);
    }
}

void Demuxer::LogVideoConfig(const SampleInfo &info, const char *videoCodecMime)
{
    AVCODEC_SAMPLE_LOGI("====== Demuxer Video config ======");
    AVCODEC_SAMPLE_LOGI("Mime: %{public}s", videoCodecMime);
    AVCODEC_SAMPLE_LOGI("%{public}d * %{public}d, %{public}.1ffps, %{public}" PRId64 "kbps",
                        info.video.videoWidth, info.video.videoHeight, info.video.frameRate, info.video.bitrate / 1024);
    AVCODEC_SAMPLE_LOGI("====== Demuxer Video config ======");
}

void Demuxer::LogAudioConfig(const SampleInfo &info, const char *audioCodecMime)
{
    AVCODEC_SAMPLE_LOGI("====== Demuxer Audio config ======");
    AVCODEC_SAMPLE_LOGI("audioMime:%{public}s sampleForamt:%{public}d sampleRate:%{public}d "
                        "channelCount:%{public}d channelLayout:%{public}ld adts:%{public}i",
                        audioCodecMime, info.audio.audioSampleFormat, info.audio.audioSampleRate,
                        info.audio.audioChannelCount, info.audio.audioChannelLayout, info.audio.aacAdts);
    AVCODEC_SAMPLE_LOGI("====== Demuxer Audio config ======");
}

void Demuxer::LogCodecConfigDetails(const SampleInfo &info)
{
    if (info.audio.codecConfigLen < CODEC_CONFIG_LOG_BYTES ||
        info.audio.codecConfig.size() < CODEC_CONFIG_LOG_BYTES) {
        return;
    }
    AVCODEC_SAMPLE_LOGI("codecConfig:%{public}p, len:%{public}i, 0:0x%{public}02x 1:0x:%{public}02x, bufLen:%{public}u",
                        info.audio.codecConfig.data(), static_cast<int>(info.audio.codecConfigLen),
                        info.audio.codecConfig[0], info.audio.codecConfig[1],
                        static_cast<unsigned int>(info.audio.codecConfig.size()));
}

int32_t Demuxer::GetVideoTrackId() { return videoTrackId_; }
int32_t Demuxer::GetAudioTrackId() { return audioTrackId_; }

int32_t Demuxer::Seek(int64_t positionMs, OH_AVSeekMode mode)
{
    std::lock_guard<std::mutex> lock(demuxerMutex_);
    int32_t ret = OH_AVDemuxer_SeekToTime(demuxer_, positionMs, mode);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Seek failed");
    return AVCODEC_SAMPLE_ERR_OK;
}
