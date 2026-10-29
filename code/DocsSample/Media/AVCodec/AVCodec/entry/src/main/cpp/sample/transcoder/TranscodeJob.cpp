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
constexpr int64_t POLL_TIMEOUT_US = 0;
constexpr int32_t AUDIO_BUFFER_BYTES = 1024 * 1024;
constexpr int64_t AUDIO_LEAD_US = 500000;
constexpr auto STALL_LIMIT = std::chrono::seconds(30);
constexpr auto POLL_INTERVAL = std::chrono::milliseconds(2);
constexpr int32_t STATE_FINISHED = 2;
constexpr int32_t STATE_CANCELLED = 3;
constexpr int32_t STATE_FAILED = 4;
constexpr double DEFAULT_FRAME_RATE = 30;
constexpr int32_t I_FRAME_INTERVAL_MS = 2000;
constexpr double RUNNING_PROGRESS_LIMIT = 99;
constexpr double COMPLETE_PROGRESS = 100;
constexpr int32_t AUDIO_MODE_AAC = 1;
constexpr int32_t AUDIO_MODE_NONE = 2;
constexpr int32_t AUDIO_MODE_COPY = 0;
constexpr int64_t MS_PER_SECOND = 1000;
constexpr int64_t US_PER_SECOND = 1000000;
constexpr int64_t US_PER_MS = US_PER_SECOND / MS_PER_SECOND;
constexpr int64_t DIAGNOSTIC_INTERVAL_MS = 250;
constexpr int32_t YUV420_COMPONENTS = 3;
constexpr int32_t YUV420_SUBSAMPLING = 2;
using TranscodeMetrics::WaitChannel;
} // namespace

TranscodeJob::TranscodeJob(TranscodeOptions options) : options_(std::move(options)) {}
TranscodeJob::~TranscodeJob()
{
    Cleanup();
}

TranscodeSnapshot TranscodeJob::Snapshot() const
{
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    return snapshot_;
}

bool TranscodeJob::Fail(const char *operation, int32_t result)
{
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    if (snapshot_.detail.empty()) {
        snapshot_.detail = operation;
        snapshot_.errorCode = result;
        AVCODEC_SAMPLE_LOGE("Transcode failed: %{public}s, ret: %{public}d", operation, result);
    }
    return false;
}

bool TranscodeJob::Check(int32_t result, const char *operation)
{
    return result == AV_ERR_OK || Fail(operation, result);
}

bool TranscodeJob::ReadTracks(int32_t trackCount)
{
    for (int32_t index = 0; index < trackCount; ++index) {
        Format track(OH_AVSource_GetTrackFormat(source_, index), OH_AVFormat_Destroy);
        int32_t type = -1;
        if (track == nullptr || !OH_AVFormat_GetIntValue(track.get(), OH_MD_KEY_TRACK_TYPE, &type)) {
            continue;
        }
        if (type == MEDIA_TYPE_AUD) {
            const char *mime = nullptr;
            int32_t channels = 0;
            int32_t rate = 0;
            OH_AVFormat_GetStringValue(track.get(), OH_MD_KEY_CODEC_MIME, &mime);
            OH_AVFormat_GetIntValue(track.get(), OH_MD_KEY_AUD_CHANNEL_COUNT, &channels);
            OH_AVFormat_GetIntValue(track.get(), OH_MD_KEY_AUD_SAMPLE_RATE, &rate);
            std::lock_guard<std::mutex> lock(snapshotMutex_);
            snapshot_.audioTrackIds.push_back(index + 1);
            snapshot_.audioTracks.push_back(std::to_string(index) + " · " +
                (mime == nullptr ? "?" : mime) + " · " + std::to_string(channels) + " ch · " +
                std::to_string(rate) + " Hz");
        }
        if (type == MEDIA_TYPE_VID && videoTrack_ < 0) {
            videoTrack_ = index;
            videoFormat_ = std::move(track);
        } else if (type == MEDIA_TYPE_AUD && audioTrack_ < 0 && options_.audioMode != AUDIO_MODE_NONE &&
            (options_.audioTrack == 0 || options_.audioTrack == index + 1)) {
            audioTrack_ = index;
            audioFormat_ = std::move(track);
        }
    }
    return true;
}

bool TranscodeJob::ValidateSourceColor()
{
    int32_t transfer = 0;
    int32_t hdr = 0;
    int32_t profile = 0;
    OH_AVFormat_GetIntValue(videoFormat_.get(), OH_MD_KEY_TRANSFER_CHARACTERISTICS, &transfer);
    OH_AVFormat_GetIntValue(videoFormat_.get(), OH_MD_KEY_VIDEO_IS_HDR_VIVID, &hdr);
    OH_AVFormat_GetIntValue(videoFormat_.get(), OH_MD_KEY_PROFILE, &profile);
    const char *sourceMime = nullptr;
    OH_AVFormat_GetStringValue(videoFormat_.get(), OH_MD_KEY_CODEC_MIME, &sourceMime);
    const bool hevc = sourceMime != nullptr && std::string(sourceMime) == OH_AVCODEC_MIMETYPE_VIDEO_HEVC;
    if (hdr != 0 || transfer == TRANSFER_CHARACTERISTIC_HLG || transfer == TRANSFER_CHARACTERISTIC_PQ ||
        (hevc && profile != HEVC_PROFILE_MAIN)) {
        return Fail("HDR input requires tone mapping or metadata preservation; this transcode path supports SDR");
    }
    return true;
}

bool TranscodeJob::ConnectSurface()
{
    if (options_.surface) {
        if (targetWidth_ != sourceWidth_ || targetHeight_ != sourceHeight_ || options_.grayscale ||
            options_.longEdge != 0) {
            return Fail("Surface transcode requires original dimensions and no CPU filter");
        }
        if (!Check(OH_VideoEncoder_GetSurface(encoder_, &encoderWindow_), "Get encoder input Surface") ||
            !Check(OH_VideoDecoder_SetSurface(decoder_, encoderWindow_), "Connect decoder to encoder Surface")) {
            return false;
        }
    }
    return true;
}

bool TranscodeJob::OpenSource()
{
    struct stat inputStat {};
    struct stat outputStat {};
    if (fstat(options_.inputFd, &inputStat) != 0 || inputStat.st_size <= 0 ||
        (!options_.inspectOnly && (fstat(options_.outputFd, &outputStat) != 0 ||
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
    return ReadTracks(trackCount) && ConfigureTimeRange();
}

bool TranscodeJob::ReadVideoProperties()
{
    if (videoFormat_ == nullptr || !OH_AVFormat_GetIntValue(videoFormat_.get(), OH_MD_KEY_WIDTH, &sourceWidth_) ||
        !OH_AVFormat_GetIntValue(videoFormat_.get(), OH_MD_KEY_HEIGHT, &sourceHeight_) ||
        !TranscodeFrames::OutputSize(sourceWidth_, sourceHeight_, options_.surface ? 0 : options_.longEdge,
            static_cast<TranscodeFrames::ResizeMode>(options_.resizeMode), targetWidth_, targetHeight_)) {
        return Fail("No supported video track or invalid video dimensions");
    }
    if (!ValidateSourceColor()) {
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
    }
    return true;
}

bool TranscodeJob::ValidateSelectedAudioTrack()
{
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
    if (audioTrack_ >= 0) {
        if (!Check(OH_AVDemuxer_SelectTrackByID(demuxer_, audioTrack_), "Select original audio track")) {
            return false;
        }
        audioDone_ = false;
        if (options_.audioMode == AUDIO_MODE_AAC) {
            audioPipeline_ = std::make_unique<TranscodeAudioPipeline>(
                [this](const char *operation, int32_t result) { return Fail(operation, result); });
            if (!audioPipeline_->Configure(audioFormat_.get(), demuxer_, audioTrack_, rangeStartUs_, rangeEndUs_)) {
                return false;
            }
        } else {
            audioBuffer_ = OH_AVBuffer_Create(AUDIO_BUFFER_BYTES);
            if (audioBuffer_ == nullptr) { return Fail("Create audio remux buffer"); }
        }
    }
    if (rangeStartUs_ > 0 && !Check(OH_AVDemuxer_SeekToTime(demuxer_, options_.startTimeMs,
        SEEK_MODE_PREVIOUS_SYNC), "Seek source to range start")) {
        return false;
    }
    return true;
}

bool TranscodeJob::ConfigureEncoderFormat()
{
    Format output(OH_AVFormat_CreateVideoFormat(options_.mime.c_str(), targetWidth_, targetHeight_),
                  OH_AVFormat_Destroy);
    if (output == nullptr || !OH_AVFormat_SetIntValue(output.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1) ||
        !OH_AVFormat_SetIntValue(output.get(), OH_MD_KEY_PIXEL_FORMAT,
                                 options_.surface ? AV_PIXEL_FORMAT_SURFACE_FORMAT : AV_PIXEL_FORMAT_NV12) ||
        !OH_AVFormat_SetLongValue(output.get(), OH_MD_KEY_BITRATE, options_.bitrate) ||
        !OH_AVFormat_SetDoubleValue(output.get(), OH_MD_KEY_FRAME_RATE, frameRate_) ||
        !OH_AVFormat_SetIntValue(output.get(), OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, VBR) ||
        !OH_AVFormat_SetIntValue(output.get(), OH_MD_KEY_I_FRAME_INTERVAL, I_FRAME_INTERVAL_MS)) {
        return Fail("Build video encoder format");
    }
    // 透传 SDR 的颜色描述；旋转保存为 MP4 元数据，不让解码器先转一次、播放器再转一次。
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
    if (!ConfigureEncoderFormat()) { return false; }
    if (!OH_AVFormat_SetIntValue(videoFormat_.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1) ||
        !OH_AVFormat_SetIntValue(videoFormat_.get(), OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12) ||
        !OH_AVFormat_SetIntValue(videoFormat_.get(), OH_MD_KEY_ROTATION, 0) ||
        !Check(OH_VideoDecoder_Configure(decoder_, videoFormat_.get()), "Configure video decoder")) { return false; }
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
    // 等编码器报告实际输出描述后再加轨；不能拿源文件的 AVC/HEVC 配置来描述新编码的码流。
    Format format(OH_VideoEncoder_GetOutputDescription(encoder_), OH_AVFormat_Destroy);
    if (format == nullptr) {
        return Fail("Read encoder output description");
    }
    // 部分编码器的输出描述不带 MIME 等封装必填项；补入本次编码参数，保留输出描述中的 codec 配置。
    if (!OH_AVFormat_SetStringValue(format.get(), OH_MD_KEY_CODEC_MIME, options_.mime.c_str()) ||
        !OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_WIDTH, targetWidth_) ||
        !OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_HEIGHT, targetHeight_) ||
        !OH_AVFormat_SetDoubleValue(format.get(), OH_MD_KEY_FRAME_RATE, frameRate_)) {
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

bool TranscodeJob::FeedDecoder(bool &advanced)
{
    if (decoderInputDone_) {
        return true;
    }
    uint32_t index = 0;
    const int32_t result = OH_VideoDecoder_QueryInputBuffer(decoder_, &index, POLL_TIMEOUT_US);
    if (result == AV_ERR_TRY_AGAIN_LATER) {
        return true;
    }
    if (!Check(result, "Query decoder input")) {
        return false;
    }
    OH_AVBuffer *buffer = OH_VideoDecoder_GetInputBuffer(decoder_, index);
    OH_AVCodecBufferAttr attr{};
    if (buffer == nullptr) {
        return Fail("Get decoder input Buffer");
    }
    const int32_t readResult = diagnostics_.Measure(TranscodeMetrics::Stage::DEMUX, [&] {
            return OH_AVDemuxer_ReadSampleBuffer(demuxer_, videoTrack_, buffer);
    });
    if (!Check(readResult, "Read compressed video") ||
        !Check(OH_AVBuffer_GetBufferAttr(buffer, &attr), "Read compressed video attributes")) {
        return Fail("Read or submit decoder input");
    }
    const int32_t submitResult = diagnostics_.Measure(TranscodeMetrics::Stage::DECODE, [&] {
            return OH_VideoDecoder_PushInputBuffer(decoder_, index);
    });
    if (!Check(submitResult, "Submit decoder input")) {
        return Fail("Read or submit decoder input");
    }
    decoderInputDone_ = (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    advanced = true;
    return true;
}

bool TranscodeJob::ReadLayout(OH_AVFormat *format, TranscodeFrames::Layout &layout)
{
    if (format == nullptr) {
        return Fail("Read codec image layout");
    }
    if (!OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PIC_WIDTH, &layout.width)) {
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_WIDTH, &layout.width);
    }
    if (!OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PIC_HEIGHT, &layout.height)) {
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_HEIGHT, &layout.height);
    }
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_STRIDE, &layout.stride);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_SLICE_HEIGHT, &layout.sliceHeight);
    int32_t pixelFormat = AV_PIXEL_FORMAT_NV12;
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, &pixelFormat);
    if (pixelFormat == AV_PIXEL_FORMAT_NV12) {
        layout.chroma = TranscodeFrames::Chroma::NV12;
    } else if (pixelFormat == AV_PIXEL_FORMAT_NV21) {
        layout.chroma = TranscodeFrames::Chroma::NV21;
    } else if (pixelFormat == AV_PIXEL_FORMAT_YUVI420) {
        layout.chroma = TranscodeFrames::Chroma::I420;
    } else {
        return Fail("Buffer transcode requires 8-bit NV12/NV21/I420 output");
    }
    return TranscodeFrames::RequiredBytes(layout) != 0 || Fail("Invalid codec stride or slice height");
}

bool TranscodeJob::DrainDecoder(bool &advanced)
{
    if (decoderOutputDone_ || pendingDecoded_ != nullptr) {
        return true;
    }
    const int32_t result = OH_VideoDecoder_QueryOutputBuffer(decoder_, &pendingDecodedIndex_, POLL_TIMEOUT_US);
    diagnostics_.Availability(WaitChannel::DECODER_OUTPUT, result != AV_ERR_TRY_AGAIN_LATER);
    if (result == AV_ERR_TRY_AGAIN_LATER) {
        return true;
    }
    if (result == AV_ERR_STREAM_CHANGED) {
        layoutsValid_ = false;
        advanced = true;
        return true;
    }
    if (!Check(result, "Query decoder output")) {
        return false;
    }
    pendingDecoded_ = OH_VideoDecoder_GetOutputBuffer(decoder_, pendingDecodedIndex_);
    if (pendingDecoded_ == nullptr ||
        !Check(OH_AVBuffer_GetBufferAttr(pendingDecoded_, &pendingDecodedAttr_), "Read decoded frame attributes")) {
        pendingDecoded_ = nullptr;
        return Fail("Get decoded output Buffer");
    }
    if (!DiscardOutsideRange(advanced)) { return false; }
    if (pendingDecoded_ == nullptr) { return true; }
    advanced = true;
    return true;
}

bool TranscodeJob::SubmitSurfaceFrame(bool eos, bool &advanced)
{
    const bool hasFrame = !eos || pendingDecodedAttr_.size > 0;
    const int32_t result = diagnostics_.Measure(TranscodeMetrics::Stage::ENCODE, [&] {
        return hasFrame ? OH_VideoDecoder_RenderOutputBuffer(decoder_, pendingDecodedIndex_)
            : OH_VideoDecoder_FreeOutputBuffer(decoder_, pendingDecodedIndex_);
    });
    pendingDecoded_ = nullptr;
    if (!Check(result, "Submit decoded Surface frame")) {
        return false;
    }
    if (eos && !Check(OH_VideoEncoder_NotifyEndOfStream(encoder_), "Notify Surface encoder EOS")) {
        return false;
    }
    encoderEosSent_ = eos;
    decoderOutputDone_ = eos;
    advanced = true;
    return true;
}

bool TranscodeJob::ProcessBufferFrame(OH_AVBuffer *input, OH_AVCodecBufferAttr &attr)
{
    if (!layoutsValid_) {
        Format decoded(OH_VideoDecoder_GetOutputDescription(decoder_), OH_AVFormat_Destroy);
        Format encoded(OH_VideoEncoder_GetInputDescription(encoder_), OH_AVFormat_Destroy);
        if (!ReadLayout(decoded.get(), decodedLayout_) || !ReadLayout(encoded.get(), encodedLayout_) ||
            decodedLayout_.width != sourceWidth_ || decodedLayout_.height != sourceHeight_ ||
            encodedLayout_.width != targetWidth_ || encodedLayout_.height != targetHeight_) {
            return Fail("Unsupported image layout change");
        }
        layoutsValid_ = true;
    }
    const int32_t sourceCapacity = OH_AVBuffer_GetCapacity(pendingDecoded_);
    const int32_t targetCapacity = OH_AVBuffer_GetCapacity(input);
    const int32_t offset = pendingDecodedAttr_.offset;
    uint8_t *source = OH_AVBuffer_GetAddr(pendingDecoded_);
    uint8_t *target = OH_AVBuffer_GetAddr(input);
    if (source == nullptr || sourceCapacity < 0 || targetCapacity < 0 || offset < 0 || offset > sourceCapacity ||
        !TranscodeFrames::Process(source + offset, sourceCapacity - offset, decodedLayout_, target, targetCapacity,
            encodedLayout_, options_.grayscale, static_cast<TranscodeFrames::ResizeMode>(options_.resizeMode))) {
        return Fail("Process decoded image layout");
    }
    attr.size = static_cast<int32_t>(TranscodeFrames::RequiredBytes(encodedLayout_));
    {
        std::lock_guard<std::mutex> lock(snapshotMutex_);
        snapshot_.copiedBytes += static_cast<int64_t>(encodedLayout_.width) * encodedLayout_.height *
            YUV420_COMPONENTS / YUV420_SUBSAMPLING;
    }
    return true;
}

bool TranscodeJob::SubmitDecodedFrame(bool &advanced)
{
    const bool sendEmptyEos = decoderOutputDone_ && !encoderEosSent_ && !options_.surface;
    if (pendingDecoded_ == nullptr && !sendEmptyEos) {
        return true;
    }
    const bool eos = sendEmptyEos || (pendingDecodedAttr_.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    if (options_.surface) {
        return SubmitSurfaceFrame(eos, advanced);
    }
    return SubmitBufferFrame(eos, sendEmptyEos, advanced);
}

bool TranscodeJob::SubmitBufferFrame(bool eos, bool sendEmptyEos, bool &advanced)
{
    uint32_t index = 0;
    const int32_t result = OH_VideoEncoder_QueryInputBuffer(encoder_, &index, POLL_TIMEOUT_US);
    diagnostics_.Availability(WaitChannel::ENCODER_INPUT, result != AV_ERR_TRY_AGAIN_LATER);
    if (result == AV_ERR_TRY_AGAIN_LATER) {
        return true;
    }
    if (!Check(result, "Query Buffer encoder input")) {
        return false;
    }
    OH_AVBuffer *input = OH_VideoEncoder_GetInputBuffer(encoder_, index);
    if (input == nullptr) {
        return Fail("Get Buffer encoder input");
    }
    OH_AVCodecBufferAttr attr{};
    attr.pts = std::max<int64_t>(0, pendingDecodedAttr_.pts - rangeStartUs_);
    const bool hasFrame = !sendEmptyEos && (!eos || pendingDecodedAttr_.size > 0);
    if (hasFrame) {
        if (!diagnostics_.Measure(TranscodeMetrics::Stage::PROCESS,
            [&] { return ProcessBufferFrame(input, attr); })) {
            return false;
        }
    }
    // 带数据的最后一帧先正常送入，下一轮再单独送空 EOS，避免编码器忽略尾帧。
    if (eos && !hasFrame) {
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    }
    if (!Check(OH_AVBuffer_SetBufferAttr(input, &attr), "Set encoder input attributes")) {
        return false;
    }
    const int32_t submitResult = diagnostics_.Measure(TranscodeMetrics::Stage::ENCODE, [&] {
            return OH_VideoEncoder_PushInputBuffer(encoder_, index);
    });
    if (!Check(submitResult, "Submit processed Buffer to encoder")) {
        return false;
    }
    if (pendingDecoded_ != nullptr &&
        !Check(OH_VideoDecoder_FreeOutputBuffer(decoder_, pendingDecodedIndex_), "Return decoded frame")) {
        return false;
    }
    pendingDecoded_ = nullptr;
    decoderOutputDone_ = eos;
    encoderEosSent_ = eos && !hasFrame;
    advanced = true;
    return true;
}

bool TranscodeJob::DrainEncoder(bool &advanced)
{
    if (audioPipeline_ != nullptr && !audioPipeline_->Ready()) { return true; }
    if (encoderOutputDone_) {
        return true;
    }
    uint32_t index = 0;
    const int32_t result = OH_VideoEncoder_QueryOutputBuffer(encoder_, &index, POLL_TIMEOUT_US);
    diagnostics_.Availability(WaitChannel::ENCODER_OUTPUT, result != AV_ERR_TRY_AGAIN_LATER);
    if (result == AV_ERR_TRY_AGAIN_LATER) {
        return true;
    }
    if (result == AV_ERR_STREAM_CHANGED) {
        advanced = true;
        return StartMuxer();
    }
    if (!Check(result, "Query encoded output")) {
        return false;
    }
    OH_AVBuffer *buffer = OH_VideoEncoder_GetOutputBuffer(encoder_, index);
    OH_AVCodecBufferAttr attr{};
    if (buffer == nullptr || !Check(OH_AVBuffer_GetBufferAttr(buffer, &attr), "Read encoded output attributes")) {
        return Fail("Get encoded output Buffer");
    }
    bool success = StartMuxer();
    if (success && attr.size > 0) {
        const int32_t writeResult = diagnostics_.Measure(TranscodeMetrics::Stage::MUX, [&] {
            return OH_AVMuxer_WriteSampleBuffer(muxer_, muxVideoTrack_, buffer);
        });
        success = Check(writeResult, "Write encoded video to MP4");
    }
    const bool returned = Check(OH_VideoEncoder_FreeOutputBuffer(encoder_, index), "Return encoded output");
    if (!success || !returned) {
        return false;
    }
    encoderOutputDone_ = (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    UpdateVideoProgress(attr);
    advanced = true;
    return true;
}

void TranscodeJob::UpdateVideoProgress(const OH_AVCodecBufferAttr &attr)
{
    if (attr.size > 0 && (attr.flags & AVCODEC_BUFFER_FLAGS_CODEC_DATA) == 0) {
        videoPositionUs_ = std::max(videoPositionUs_, attr.pts);
        std::lock_guard<std::mutex> lock(snapshotMutex_);
        ++snapshot_.frames;
        if (snapshot_.firstFrameMs < 0) {
            snapshot_.firstFrameMs = std::chrono::duration<double, std::milli>(
                TranscodeMetrics::Clock::now() - startedAt_).count();
        }
        snapshot_.bytes += attr.size;
        snapshot_.stage = "transcode";
        if (selectedDurationUs_ > 0) {
            snapshot_.progress =
                std::clamp(static_cast<double>(videoPositionUs_) / selectedDurationUs_ * RUNNING_PROGRESS_LIMIT, 0.0,
                           RUNNING_PROGRESS_LIMIT);
        }
    }
}

bool TranscodeJob::CopyAudio(bool &advanced)
{
    if (audioPipeline_ != nullptr) {
        const bool result = diagnostics_.Measure(TranscodeMetrics::Stage::AUDIO, [&]() {
            return audioPipeline_->Pump(muxStarted_ ? muxer_ : nullptr, muxAudioTrack_, advanced);
        });
        audioDone_ = audioPipeline_->Done();
        return result;
    }
    if (audioDone_ || !muxStarted_ || (!encoderOutputDone_ && audioPositionUs_ > videoPositionUs_ + AUDIO_LEAD_US)) {
        return true;
    }
    OH_AVCodecBufferAttr attr{};
    const int32_t readResult = diagnostics_.Measure(TranscodeMetrics::Stage::AUDIO, [&] {
            return OH_AVDemuxer_ReadSampleBuffer(demuxer_, audioTrack_, audioBuffer_);
    });
    if (!Check(readResult, "Read original audio sample") ||
        !Check(OH_AVBuffer_GetBufferAttr(audioBuffer_, &attr), "Read audio sample attributes")) {
        return false;
    }
    audioDone_ = (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    if (rangeEndUs_ > 0 && attr.pts >= rangeEndUs_) {
        audioDone_ = true;
        advanced = true;
        return true;
    }
    if (rangeEndUs_ > 0 && attr.pts < rangeStartUs_) {
        advanced = true;
        return true;
    }
    attr.pts = std::max<int64_t>(0, attr.pts - rangeStartUs_);
    if (!Check(OH_AVBuffer_SetBufferAttr(audioBuffer_, &attr), "Rebase original audio timestamps")) { return false; }
    if (attr.size > 0) {
        const int32_t writeResult = diagnostics_.Measure(TranscodeMetrics::Stage::MUX, [&] {
            return OH_AVMuxer_WriteSampleBuffer(muxer_, muxAudioTrack_, audioBuffer_);
        });
        if (!Check(writeResult, "Remux original audio")) {
            return false;
        }
    }
    audioPositionUs_ = attr.pts;
    {
        std::lock_guard<std::mutex> lock(snapshotMutex_);
        snapshot_.audioBytes += std::max(0, attr.size);
    }
    audioDone_ = (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    advanced = true;
    return true;
}

bool TranscodeJob::FinalizeOutput()
{
    if (!muxStarted_ || Snapshot().frames <= 0) {
        return Fail("No encoded video samples were produced");
    }
    if (!Check(OH_AVMuxer_Stop(muxer_), "Finalize MP4 container")) {
        return false;
    }
    if (fsync(options_.outputFd) != 0) { return Fail("Flush output file", errno); }
    return ValidateOutput();
}

void TranscodeJob::Complete(bool success)
{
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    snapshot_.state = cancelled_.load() ? STATE_CANCELLED : (success ? STATE_FINISHED : STATE_FAILED);
    snapshot_.stage = cancelled_.load() ? "cancelled" : (success ? "complete" : "failed");
    if (snapshot_.state == STATE_FINISHED) {
        snapshot_.progress = COMPLETE_PROGRESS;
        snapshot_.audioCopied = audioTrack_ >= 0 && options_.audioMode == AUDIO_MODE_COPY;
    }
}

void TranscodeJob::Run()
{
    startedAt_ = TranscodeMetrics::Clock::now();
    publishedAt_ = startedAt_;
    if (options_.inspectOnly) {
        const bool success = !cancelled_.load() && OpenSource() && InspectCodecs();
        Cleanup();
        Complete(success);
        return;
    }
    bool success = !cancelled_.load() && OpenSource() && InspectCodecs() && CheckStorage(true) &&
                   InitializeDemuxer() && ConfigureCodecs();
    auto lastProgress = std::chrono::steady_clock::now();
    // 输入 EOS 只结束输入；编码输出 EOS 和音轨都处理完，才能停止封装并报告完成。
    while (success && !cancelled_.load() && !(encoderOutputDone_ && audioDone_)) {
        bool advanced = false;
        success = CheckStorage(false) && DrainEncoder(advanced) && SubmitDecodedFrame(advanced) &&
            DrainDecoder(advanced) && FeedDecoder(advanced) && CopyAudio(advanced);
        if (TranscodeMetrics::Clock::now() - publishedAt_ >= std::chrono::milliseconds(DIAGNOSTIC_INTERVAL_MS)) {
            PublishDiagnostics();
        }
        if (advanced) {
            lastProgress = std::chrono::steady_clock::now();
        } else if (std::chrono::steady_clock::now() - lastProgress > STALL_LIMIT) {
            success = Fail("Codec pipeline made no progress for 30 seconds");
        } else {
            std::this_thread::sleep_for(POLL_INTERVAL);
        }
    }
    if (success && !cancelled_.load()) {
        {
            std::lock_guard<std::mutex> lock(snapshotMutex_);
            snapshot_.stage = "finalize";
        }
        success = FinalizeOutput();
    }
    diagnostics_.FinishWaits();
    PublishDiagnostics();
    Cleanup();
    Complete(success);
}

void TranscodeJob::PublishDiagnostics()
{
    const auto now = TranscodeMetrics::Clock::now();
    struct stat file {};
    const int64_t fileBytes = fstat(options_.outputFd, &file) == 0 ? file.st_size : 0;
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    snapshot_.elapsedMs = std::chrono::duration<double, std::milli>(now - startedAt_).count();
    snapshot_.fps = snapshot_.elapsedMs > 0 ? snapshot_.frames * MS_PER_SECOND / snapshot_.elapsedMs : 0;
    snapshot_.speed = snapshot_.elapsedMs > 0 ? videoPositionUs_ / (snapshot_.elapsedMs * US_PER_MS) : 0;
    snapshot_.remainingSeconds = snapshot_.elapsedMs >= MS_PER_SECOND && snapshot_.speed > 0 &&
        selectedDurationUs_ > 0 ?
        std::max(0.0, (selectedDurationUs_ - videoPositionUs_) / (US_PER_SECOND * snapshot_.speed)) : -1;
    snapshot_.decoderWaitMs = diagnostics_.WaitMs(WaitChannel::DECODER_OUTPUT);
    snapshot_.encoderInputWaitMs = diagnostics_.WaitMs(WaitChannel::ENCODER_INPUT);
    snapshot_.encoderOutputWaitMs = diagnostics_.WaitMs(WaitChannel::ENCODER_OUTPUT);
    snapshot_.fileBytes = fileBytes;
    snapshot_.audioMode = options_.audioMode;
    if (audioPipeline_ != nullptr) { snapshot_.audioBytes = audioPipeline_->Bytes(); }
    snapshot_.diagnostics = diagnostics_.Snapshot();
    publishedAt_ = now;
}

void TranscodeJob::Cleanup()
{
    audioPipeline_.reset();
    // Surface 由编码器创建，解码器借用。先销毁解码器，再销毁编码器和窗口引用。
    if (decoder_ != nullptr) {
        if (decoderStarted_) {
            (void)OH_VideoDecoder_Stop(decoder_);
        }
        OH_VideoDecoder_Destroy(decoder_);
        decoder_ = nullptr;
        pendingDecoded_ = nullptr;
    }
    if (encoder_ != nullptr) {
        if (encoderStarted_) {
            (void)OH_VideoEncoder_Stop(encoder_);
        }
        OH_VideoEncoder_Destroy(encoder_);
        encoder_ = nullptr;
    }
    if (encoderWindow_ != nullptr) {
        OH_NativeWindow_DestroyNativeWindow(encoderWindow_);
        encoderWindow_ = nullptr;
    }
    if (muxer_ != nullptr) {
        OH_AVMuxer_Destroy(muxer_);
        muxer_ = nullptr;
    }
    if (audioBuffer_ != nullptr) {
        OH_AVBuffer_Destroy(audioBuffer_);
        audioBuffer_ = nullptr;
    }
    if (demuxer_ != nullptr) {
        OH_AVDemuxer_Destroy(demuxer_);
        demuxer_ = nullptr;
    }
    if (source_ != nullptr) {
        OH_AVSource_Destroy(source_);
        source_ = nullptr;
    }
    if (options_.inputFd >= 0) {
        close(options_.inputFd);
        options_.inputFd = -1;
    }
    if (options_.outputFd >= 0) {
        close(options_.outputFd);
        options_.outputFd = -1;
    }
}
