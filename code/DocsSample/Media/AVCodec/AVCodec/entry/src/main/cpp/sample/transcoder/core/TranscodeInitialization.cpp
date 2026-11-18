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
#include <sys/stat.h>
#include <thread>
#include <unistd.h>
#include <utility>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_averrors.h>
#include <native_window/external_window.h>
#include "av_codec_sample_log.h"

namespace {
constexpr int32_t AUDIO_BUFFER_BYTES = 1024 * 1024;
constexpr double DEFAULT_FRAME_RATE = 30;
constexpr int32_t AUDIO_MODE_AAC = 1;
constexpr int32_t AUDIO_MODE_NONE = 2;
constexpr int32_t BITRATE_MODE_VARIABLE = 0;
constexpr int32_t COLOR_COMPONENT_UNSPECIFIED = 2;
} // namespace

bool TranscodeJob::ReadTracks(int32_t trackCount)
{
    for (int32_t index = 0; index < trackCount; ++index) {
        Format track(OH_AVSource_GetTrackFormat(source_, index), OH_AVFormat_Destroy);
        int32_t type = -1;
        if (track == nullptr || !OH_AVFormat_GetIntValue(track.get(), OH_MD_KEY_TRACK_TYPE, &type)) {
            continue;
        }
        if (type == MEDIA_TYPE_AUD && !ReadAudioTrack(index, track.get())) {
            return false;
        }
        if (type == MEDIA_TYPE_SUBTITLE) {
            const char *mime = nullptr;
            OH_AVFormat_GetStringValue(track.get(), OH_MD_KEY_CODEC_MIME, &mime);
            std::lock_guard<std::mutex> lock(snapshotMutex_);
            snapshot_.subtitleTracks.push_back(std::to_string(index) + " · " + (mime == nullptr ? "?" : mime));
        }
        if (type == MEDIA_TYPE_VID && videoTrack_ < 0) {
            videoTrack_ = index;
            videoFormat_ = std::move(track);
        } else if (type == MEDIA_TYPE_AUD && audioTrack_ < 0 &&
            (options_.audioMode != AUDIO_MODE_NONE || (options_.remuxOnly && options_.remuxAllAudioTracks)) &&
            (options_.audioTrack == 0 || options_.audioTrack == index + 1)) {
            audioTrack_ = index;
            audioFormat_ = std::move(track);
            int32_t selectedChannels = 0;
            OH_AVFormat_GetIntValue(audioFormat_.get(), OH_MD_KEY_AUD_CHANNEL_COUNT, &selectedChannels);
            std::lock_guard<std::mutex> lock(snapshotMutex_);
            snapshot_.selectedAudioChannels = selectedChannels;
        }
    }
    return true;
}

bool TranscodeJob::ReadAudioTrack(int32_t index, OH_AVFormat *track)
{
    const char *mime = nullptr;
    int32_t channels = 0;
    int32_t rate = 0;
    OH_AVFormat_GetStringValue(track, OH_MD_KEY_CODEC_MIME, &mime);
    OH_AVFormat_GetIntValue(track, OH_MD_KEY_AUD_CHANNEL_COUNT, &channels);
    OH_AVFormat_GetIntValue(track, OH_MD_KEY_AUD_SAMPLE_RATE, &rate);
    if (options_.remuxOnly && options_.remuxAllAudioTracks) {
        Format remuxFormat(OH_AVSource_GetTrackFormat(source_, index), OH_AVFormat_Destroy);
        if (remuxFormat == nullptr) {
            return Fail("Read remux audio track format");
        }
        remuxAudioSourceTracks_.push_back(index);
        remuxAudioFormats_.push_back(std::move(remuxFormat));
    }
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    snapshot_.audioTrackIds.push_back(index + 1);
    snapshot_.audioTracks.push_back(std::to_string(index) + " · " +
        (mime == nullptr ? "?" : mime) + " · " + std::to_string(channels) + " ch · " + std::to_string(rate) + " Hz");
    return true;
}

bool TranscodeJob::ValidateSourceColor()
{
    int32_t transfer = 0;
    int32_t hdr = 0;
    int32_t profile = 0;
    OH_AVFormat_GetIntValue(videoFormat_.get(), OH_MD_KEY_TRANSFER_CHARACTERISTICS, &transfer);
    OH_AVFormat_GetIntValue(videoFormat_.get(), OH_MD_KEY_VIDEO_IS_HDR_VIVID, &hdr);
    const bool hasProfile = OH_AVFormat_GetIntValue(videoFormat_.get(), OH_MD_KEY_PROFILE, &profile);
    const char *sourceMime = nullptr;
    OH_AVFormat_GetStringValue(videoFormat_.get(), OH_MD_KEY_CODEC_MIME, &sourceMime);
    const bool hevc = sourceMime != nullptr && std::string(sourceMime) == OH_AVCODEC_MIMETYPE_VIDEO_HEVC;
    if (hevc && !hasProfile) {
        return Fail("Cannot determine the HEVC profile; refusing input with unverified bit depth");
    }
    if (hdr != 0) {
        return Fail("HDR Vivid input is not transcoded: dynamic metadata preservation is unavailable");
    }
    if (transfer == TRANSFER_CHARACTERISTIC_HLG || transfer == TRANSFER_CHARACTERISTIC_PQ ||
        (hevc && (profile == HEVC_PROFILE_MAIN_10_HDR10 || profile == HEVC_PROFILE_MAIN_10_HDR10_PLUS))) {
        return Fail("PQ/HLG or HDR10 input is not transcoded: HDR metadata preservation is unavailable");
    }
    if (transfer == TRANSFER_CHARACTERISTIC_BT2020_10BIT || transfer == TRANSFER_CHARACTERISTIC_BT2020_12BIT) {
        return Fail("BT.2020 10/12-bit input is not transcoded: high-bit-depth handling is unavailable");
    }
    if (hevc && profile != HEVC_PROFILE_MAIN) {
        return Fail("HEVC Main 10 and other non-Main profiles are not transcoded "
            "until 10-bit Surface and color metadata are verified");
    }
    if (options_.gpu) {
        for (const char *key : {OH_MD_KEY_COLOR_PRIMARIES, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
            OH_MD_KEY_MATRIX_COEFFICIENTS}) {
            int32_t component = 0;
            if (OH_AVFormat_GetIntValue(videoFormat_.get(), key, &component) && component != 0 &&
                component != COLOR_COMPONENT_UNSPECIFIED && component != COLOR_PRIMARY_BT709) {
                return Fail("OpenGL processing supports BT.709 SDR; use Buffer for other SDR color descriptions");
            }
        }
    }
    return true;
}

bool TranscodeJob::ConnectSurface()
{
    if (options_.surface) {
        if (!options_.gpu && (targetWidth_ != sourceWidth_ || targetHeight_ != sourceHeight_ || options_.grayscale ||
            options_.longEdge != 0)) {
            return Fail("Surface transcode requires original dimensions and no CPU filter");
        }
        if (!Check(OH_VideoEncoder_GetSurface(encoder_, &encoderWindow_), "Get encoder input Surface")) {
            return false;
        }
        if (options_.gpu) {
            gpu_ = std::make_unique<TranscodeGpuProcessor>();
            if (!gpu_->Initialize(encoderWindow_, sourceWidth_, sourceHeight_, targetWidth_, targetHeight_,
                options_.resizeMode, options_.grayscale, options_.scalingFilter)) {
                return Fail("Initialize SDR OpenGL transcode processing");
            }
        }
        return Check(OH_VideoDecoder_SetSurface(decoder_, gpu_ ? gpu_->DecoderWindow() : encoderWindow_),
            "Connect decoder output Surface");
    }
    return true;
}

bool TranscodeJob::OpenSource()
{
    struct stat inputStat {};
    struct stat outputStat {};
    if (fstat(options_.inputFd, &inputStat) != 0 || inputStat.st_size <= 0 ||
        (!options_.inspectOnly && !options_.previewOnly && (fstat(options_.outputFd, &outputStat) != 0 ||
        (inputStat.st_dev == outputStat.st_dev && inputStat.st_ino == outputStat.st_ino)))) {
        return Fail("Invalid input/output descriptors or identical files");
    }
    source_ = OH_AVSource_CreateWithFD(options_.inputFd, 0, inputStat.st_size);
    if (source_ == nullptr) {
        return Fail("Create media source");
    }
    return ReadSourceMetadata() && ReadVideoProperties() && ValidateSelectedAudioTrack();
}

bool TranscodeJob::ReadSourceMetadata()
{
    Format sourceFormat(OH_AVSource_GetSourceFormat(source_), OH_AVFormat_Destroy);
    if (sourceFormat == nullptr) {
        return Fail("Read media source description");
    }
    int32_t trackCount = 0;
    OH_AVFormat_GetIntValue(sourceFormat.get(), OH_MD_KEY_TRACK_COUNT, &trackCount);
    OH_AVFormat_GetLongValue(sourceFormat.get(), OH_MD_KEY_DURATION, &durationUs_);
    OH_AVFormat_GetLongValue(sourceFormat.get(), OH_MD_KEY_START_TIME, &sourceStartUs_);
    sourceStartUs_ = std::max<int64_t>(0, sourceStartUs_);
    return ReadTracks(trackCount) && ConfigureTimeRange();
}

bool TranscodeJob::ReadVideoProperties()
{
    if (videoFormat_ == nullptr || !OH_AVFormat_GetIntValue(videoFormat_.get(), OH_MD_KEY_WIDTH, &sourceWidth_) ||
        !OH_AVFormat_GetIntValue(videoFormat_.get(), OH_MD_KEY_HEIGHT, &sourceHeight_) ||
        !TranscodeFrames::OutputSize(sourceWidth_, sourceHeight_,
            options_.surface && !options_.gpu ? 0 : options_.longEdge,
            static_cast<TranscodeFrames::ResizeMode>(options_.resizeMode), targetWidth_, targetHeight_)) {
        return Fail("No supported video track or invalid video dimensions");
    }
    if (options_.remuxOnly) {
        targetWidth_ = sourceWidth_;
        targetHeight_ = sourceHeight_;
    }
    if (!options_.remuxOnly && !ValidateSourceColor()) {
        return false;
    }
    OH_AVFormat_GetIntValue(videoFormat_.get(), OH_MD_KEY_ROTATION, &rotation_);
    OH_AVFormat_GetDoubleValue(videoFormat_.get(), OH_MD_KEY_FRAME_RATE, &frameRate_);
    if (!std::isfinite(frameRate_) || frameRate_ <= 0) {
        frameRate_ = DEFAULT_FRAME_RATE;
    }
    if (frameRate_ > INT32_MAX) { return Fail("Invalid source frame rate"); }
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    snapshot_.outputWidth = targetWidth_;
    snapshot_.outputHeight = targetHeight_;
    snapshot_.sourceWidth = sourceWidth_;
    snapshot_.sourceHeight = sourceHeight_;
    snapshot_.durationUs = durationUs_;
    snapshot_.sourceFrameRate = frameRate_;
    const char *mime = nullptr;
    if (OH_AVFormat_GetStringValue(videoFormat_.get(), OH_MD_KEY_CODEC_MIME, &mime) && mime != nullptr) {
        snapshot_.sourceMime = mime;
        if (options_.remuxOnly) { options_.mime = mime; }
    }
    return true;
}

bool TranscodeJob::ValidateSelectedAudioTrack()
{
    if (options_.remuxOnly && options_.remuxAllAudioTracks) { return true; }
    if (options_.audioMode != AUDIO_MODE_NONE && options_.audioTrack > 0 && audioTrack_ < 0) {
        return Fail("Selected audio track is unavailable");
    }
    return true;
}

bool TranscodeJob::InitializeDemuxer()
{
    demuxer_ = OH_AVDemuxer_CreateWithSource(source_);
    if (demuxer_ == nullptr || !Check(OH_AVDemuxer_SelectTrackByID(demuxer_, videoTrack_), "Select video track")) {
        return Fail("Create demuxer or select video track");
    }
    if (options_.remuxOnly && options_.remuxAllAudioTracks) {
        for (const int32_t track : remuxAudioSourceTracks_) {
            if (!Check(OH_AVDemuxer_SelectTrackByID(demuxer_, track), "Select remux audio track")) { return false; }
        }
        audioDone_ = remuxAudioSourceTracks_.empty();
        if (!audioDone_) {
            audioBuffer_ = OH_AVBuffer_Create(AUDIO_BUFFER_BYTES);
            if (audioBuffer_ == nullptr) { return Fail("Create remux audio buffer"); }
        }
        return true;
    }
    if (audioTrack_ >= 0) {
        if (!Check(OH_AVDemuxer_SelectTrackByID(demuxer_, audioTrack_), "Select original audio track")) {
            return false;
        }
        audioDone_ = false;
        if (options_.audioMode == AUDIO_MODE_AAC) {
            audioPipeline_ = std::make_unique<TranscodeAudioPipeline>(
                [this](const char *operation, int32_t result) { return Fail(operation, result); });
            if (!audioPipeline_->Configure(audioFormat_.get(), demuxer_, audioTrack_, rangeStartUs_, rangeEndUs_,
                options_.audioSampleRate, options_.audioChannels, options_.audioBitrate,
                options_.audioResampler == 1, options_.codecMode == 1, options_.audioSourceLayout)) {
                return false;
            }
        } else {
            audioBuffer_ = OH_AVBuffer_Create(AUDIO_BUFFER_BYTES);
            if (audioBuffer_ == nullptr) { return Fail("Create audio remux buffer"); }
        }
    }
    // A nonzero source origin can accompany approximate TS seeks that start on a non-keyframe.
    // Decode those sources from the beginning so range filtering retains the required reference frames.
    if (options_.startTimeMs > 0 && sourceStartUs_ == 0 &&
        !Check(OH_AVDemuxer_SeekToTime(demuxer_, options_.startTimeMs,
        SEEK_MODE_PREVIOUS_SYNC), "Seek source to range start")) {
        return false;
    }
    return true;
}

bool TranscodeJob::ConfigureEncoderFormat()
{
    Format output(OH_AVFormat_CreateVideoFormat(options_.mime.c_str(), targetWidth_, targetHeight_),
                  OH_AVFormat_Destroy);
    if (output == nullptr ||
        !OH_AVFormat_SetIntValue(output.get(), OH_MD_KEY_ENABLE_SYNC_MODE, options_.codecMode == 0 ? 1 : 0) ||
        !OH_AVFormat_SetIntValue(output.get(), OH_MD_KEY_PIXEL_FORMAT,
                                 options_.surface ? AV_PIXEL_FORMAT_SURFACE_FORMAT : AV_PIXEL_FORMAT_NV12) ||
        !OH_AVFormat_SetLongValue(output.get(), OH_MD_KEY_BITRATE, options_.bitrate) ||
        !OH_AVFormat_SetDoubleValue(output.get(), OH_MD_KEY_FRAME_RATE, OutputFrameRate()) ||
        !OH_AVFormat_SetIntValue(output.get(), OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE,
            options_.bitrateMode == BITRATE_MODE_VARIABLE ? VBR : CBR) ||
        !OH_AVFormat_SetIntValue(output.get(), OH_MD_KEY_I_FRAME_INTERVAL, options_.keyFrameIntervalMs)) {
        return Fail("Build video encoder format");
    }
    // 透传SDR的颜色描述；旋转保存为MP4元数据，不让解码器先转一次、播放器再转一次。
    for (const char *key : {OH_MD_KEY_COLOR_PRIMARIES, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                            OH_MD_KEY_MATRIX_COEFFICIENTS, OH_MD_KEY_RANGE_FLAG}) {
        int32_t component = 0;
        if (OH_AVFormat_GetIntValue(videoFormat_.get(), key, &component) &&
            !OH_AVFormat_SetIntValue(output.get(), key, component)) {
            return Fail("Copy SDR color description");
        }
    }
    if (!Check(OH_VideoEncoder_Configure(encoder_, output.get()), "Configure video encoder")) {
        return false;
    }
    return true;
}

bool TranscodeJob::StartCodecs()
{
    if (!Check(OH_VideoEncoder_Prepare(encoder_), "Prepare video encoder") ||
        !Check(OH_VideoDecoder_Prepare(decoder_), "Prepare video decoder") ||
        !Check(OH_VideoEncoder_Start(encoder_), "Start video encoder")) {
        return false;
    }
    encoderStarted_ = true;
    if (!Check(OH_VideoDecoder_Start(decoder_), "Start video decoder")) {
        return false;
    }
    decoderStarted_ = true;
    return true;
}

bool TranscodeJob::ConfigureCodecs()
{
    const auto selected = Snapshot();
    decoder_ = OH_VideoDecoder_CreateByName(selected.decoderName.c_str());
    encoder_ = OH_VideoEncoder_CreateByName(selected.encoderName.c_str());
    if (decoder_ == nullptr || encoder_ == nullptr) { return Fail("Create selected video codecs"); }
    if (!RegisterCodecCallbacks() || !ConfigureEncoderFormat()) { return false; }
    Format decoded(OH_AVSource_GetTrackFormat(source_, videoTrack_), OH_AVFormat_Destroy);
    if (decoded == nullptr ||
        !OH_AVFormat_SetIntValue(decoded.get(), OH_MD_KEY_ENABLE_SYNC_MODE, options_.codecMode == 0 ? 1 : 0) ||
        !OH_AVFormat_SetIntValue(decoded.get(), OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12) ||
        !OH_AVFormat_SetIntValue(decoded.get(), OH_MD_KEY_ROTATION, 0) ||
        !Check(OH_VideoDecoder_Configure(decoder_, decoded.get()), "Configure video decoder")) { return false; }
    if (!ConnectSurface() || !StartCodecs()) { return false; }
    muxer_ = OH_AVMuxer_Create(options_.outputFd, AV_OUTPUT_FORMAT_MPEG_4);
    if (muxer_ == nullptr) { return Fail("Create MP4 muxer"); }
    return Check(OH_AVMuxer_SetRotation(muxer_, rotation_), "Set output rotation");
}


bool TranscodeJob::StartMuxer()
{
    if (muxStarted_) {
        return true;
    }
    // 等编码器报告实际输出描述后再加轨；不能拿源文件的AVC/HEVC配置来描述新编码的码流。
    Format format(OH_VideoEncoder_GetOutputDescription(encoder_), OH_AVFormat_Destroy);
    if (format == nullptr) {
        return Fail("Read encoder output description");
    }
    // 部分编码器的输出描述不带MIME等封装必填项；补入本次编码参数，保留输出描述中的codec配置。
    if (!OH_AVFormat_SetStringValue(format.get(), OH_MD_KEY_CODEC_MIME, options_.mime.c_str()) ||
        !OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, targetWidth_) ||
        !OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, targetHeight_) ||
        !OH_AVFormat_SetDoubleValue(format.get(), OH_MD_KEY_FRAME_RATE, OutputFrameRate())) {
        return Fail("Complete encoded video track format");
    }
    if (!Check(OH_AVMuxer_AddTrack(muxer_, &muxVideoTrack_, format.get()), "Add encoded video track")) {
        return false;
    }
    Format aac(audioPipeline_ == nullptr ? nullptr : audioPipeline_->OutputFormat(), OH_AVFormat_Destroy);
    if (audioPipeline_ != nullptr && (aac == nullptr ||
        !OH_AVFormat_SetStringValue(aac.get(), OH_MD_KEY_CODEC_MIME, OH_AVCODEC_MIMETYPE_AUDIO_AAC))) {
        return Fail("Read AAC output track format");
    }
    if (audioFormat_ != nullptr &&
        !Check(OH_AVMuxer_AddTrack(muxer_, &muxAudioTrack_, aac == nullptr ? audioFormat_.get() : aac.get()),
               "Add audio track to MP4; for original audio try AAC conversion or no audio")) {
        return false;
    }
    if (!Check(OH_AVMuxer_Start(muxer_), "Start MP4 muxer")) {
        return false;
    }
    muxStarted_ = true;
    return true;
}
