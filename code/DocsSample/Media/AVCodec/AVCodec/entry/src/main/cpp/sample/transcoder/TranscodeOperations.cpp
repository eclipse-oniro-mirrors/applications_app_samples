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
#include <cmath>
#include <thread>
#include <multimedia/player_framework/native_averrors.h>

namespace {
constexpr int32_t CHROMA_SUBSAMPLING = 2;
constexpr int32_t RGBA_CHANNEL_COUNT = 4;
constexpr int32_t RGBA_GREEN_COMPONENT = 1;
constexpr int32_t RGBA_BLUE_COMPONENT = 2;
constexpr int32_t RGBA_ALPHA_COMPONENT = 3;
constexpr int32_t YUV_CHROMA_OFFSET = 128;
constexpr int32_t YUV_LUMA_OFFSET = 16;
constexpr int32_t YUV_LUMA_RANGE = 219;
constexpr int32_t YUV_CHROMA_RANGE = 224;
constexpr int32_t RGBA_ALPHA_OPAQUE = 255;
constexpr long MAX_COLOR_COMPONENT = 255;
constexpr int32_t PREVIEW_MAX_LONG_EDGE = 640;
constexpr int64_t VIDEO_COPY_BUFFER_SIZE = 32LL * 1024 * 1024;
constexpr int32_t PREVIEW_IDLE_WAIT_MS = 2;
constexpr int64_t MICROSECONDS_PER_MILLISECOND = 1000;
constexpr int64_t MICROSECONDS_PER_SECOND = 1000000;
constexpr int32_t DIAGNOSTICS_PUBLISH_INTERVAL_MS = 250;
constexpr double COLOR_COEFFICIENT_SCALE = 2.0;
constexpr int32_t PREVIEW_TIMEOUT_SECONDS = 15;

std::vector<uint8_t> ConvertPreviewToRgba(const std::vector<uint8_t> &yuv,
    const TranscodeFrames::Layout &layout, int32_t matrix, bool fullRange)
{
    const double kr = matrix == MATRIX_COEFFICIENT_BT709 ? 0.2126 : 0.299;
    const double kb = matrix == MATRIX_COEFFICIENT_BT709 ? 0.0722 : 0.114;
    const double kg = 1 - kr - kb;
    std::vector<uint8_t> rgba(static_cast<size_t>(layout.width) * layout.height * RGBA_CHANNEL_COUNT);
    const auto byte = [](double value) {
        return static_cast<uint8_t>(std::clamp(std::lround(value), 0L, MAX_COLOR_COMPONENT));
    };
    const size_t plane = static_cast<size_t>(layout.width) * layout.height;
    for (int32_t y = 0; y < layout.height; ++y) {
        for (int32_t x = 0; x < layout.width; ++x) {
            const size_t pixel = static_cast<size_t>(y) * layout.width + x;
            const size_t uv = plane + static_cast<size_t>(y / CHROMA_SUBSAMPLING) * layout.width + (x & ~1);
            const double luma = fullRange ? yuv[pixel] :
                (yuv[pixel] - YUV_LUMA_OFFSET) * 255.0 / YUV_LUMA_RANGE;
            const double u = (yuv[uv] - YUV_CHROMA_OFFSET) * (fullRange ? 1 : 255.0 / YUV_CHROMA_RANGE);
            const double v = (yuv[uv + 1] - YUV_CHROMA_OFFSET) * (fullRange ? 1 : 255.0 / YUV_CHROMA_RANGE);
            const size_t rgbaIndex = pixel * RGBA_CHANNEL_COUNT;
            rgba[rgbaIndex] = byte(luma + COLOR_COEFFICIENT_SCALE * (1 - kr) * v);
            rgba[rgbaIndex + RGBA_GREEN_COMPONENT] = byte(luma - COLOR_COEFFICIENT_SCALE * kb * (1 - kb) / kg * u -
                COLOR_COEFFICIENT_SCALE * kr * (1 - kr) / kg * v);
            rgba[rgbaIndex + RGBA_BLUE_COMPONENT] = byte(luma + COLOR_COEFFICIENT_SCALE * (1 - kb) * u);
            rgba[rgbaIndex + RGBA_ALPHA_COMPONENT] = RGBA_ALPHA_OPAQUE;
        }
    }
    return rgba;
}
}

double TranscodeJob::OutputFrameRate() const
{
    return options_.frameRateLimit > 0 ?
        std::min(frameRate_, static_cast<double>(options_.frameRateLimit)) : frameRate_;
}

bool TranscodeJob::DropFrame(bool &advanced)
{
    const bool eos = (pendingDecodedAttr_.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    // Surface frames can carry a zero byte count while still representing a visible frame.
    const bool hasFrame = options_.surface ? !eos || pendingDecodedAttr_.size > 0 : pendingDecodedAttr_.size > 0;
    if (options_.previewOnly || options_.frameRateLimit <= 0 || !hasFrame) { return true; }
    const int64_t pts = std::max<int64_t>(0, pendingDecodedAttr_.pts - rangeStartUs_);
    const auto bucket = [this](int64_t timestamp) {
        return timestamp / MICROSECONDS_PER_SECOND * options_.frameRateLimit +
            timestamp % MICROSECONDS_PER_SECOND * options_.frameRateLimit / MICROSECONDS_PER_SECOND;
    };
    if (lastSubmittedPts_ < 0 || bucket(pts) > bucket(lastSubmittedPts_)) {
        lastSubmittedPts_ = pts;
        return true;
    }
    if (!Check(OH_VideoDecoder_FreeOutputBuffer(decoder_, pendingDecodedIndex_), "Return rate-limited frame")) {
        return false;
    }
    pendingDecoded_ = nullptr;
    decoderOutputDone_ = eos;
    if (eos && options_.surface) {
        if (!Check(OH_VideoEncoder_NotifyEndOfStream(encoder_), "Notify rate-limited Surface EOS")) { return false; }
        encoderEosSent_ = true;
    }
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    ++snapshot_.droppedFrames;
    advanced = true;
    return true;
}

bool TranscodeJob::BuildPreview(const TranscodeFrames::Layout &input, bool original,
    TranscodeFrames::Layout &output, std::vector<uint8_t> &rgba)
{
    if (!TranscodeFrames::FitSize(original ? input.width : targetWidth_,
        original ? input.height : targetHeight_, PREVIEW_MAX_LONG_EDGE,
        output.width, output.height)) {
        return false;
    }
    output.stride = output.width;
    output.sliceHeight = output.height;
    std::vector<uint8_t> yuv(TranscodeFrames::RequiredBytes(output));
    const int32_t capacity = OH_AVBuffer_GetCapacity(pendingDecoded_);
    const int32_t offset = pendingDecodedAttr_.offset;
    const uint8_t *source = OH_AVBuffer_GetAddr(pendingDecoded_);
    if (source == nullptr || offset < 0 || capacity < offset ||
        !TranscodeFrames::Process(source + offset, capacity - offset, input, yuv.data(), yuv.size(), output,
            !original && options_.grayscale, original ? TranscodeFrames::ResizeMode::FIT :
            static_cast<TranscodeFrames::ResizeMode>(options_.resizeMode),
            original ? TranscodeFrames::Filter::AREA :
            static_cast<TranscodeFrames::Filter>(options_.scalingFilter))) { return Fail("Process preview image"); }
    int32_t matrix = MATRIX_COEFFICIENT_BT709;
    int32_t fullRange = 0;
    OH_AVFormat_GetIntValue(videoFormat_.get(), OH_MD_KEY_MATRIX_COEFFICIENTS, &matrix);
    OH_AVFormat_GetIntValue(videoFormat_.get(), OH_MD_KEY_RANGE_FLAG, &fullRange);
    rgba = ConvertPreviewToRgba(yuv, output, matrix, fullRange != 0);
    return true;
}

bool TranscodeJob::CapturePreview()
{
    Format description(OH_VideoDecoder_GetOutputDescription(decoder_), OH_AVFormat_Destroy);
    TranscodeFrames::Layout input;
    TranscodeFrames::Layout output;
    TranscodeFrames::Layout original;
    std::vector<uint8_t> rgba;
    std::vector<uint8_t> originalRgba;
    if (!ReadLayout(description.get(), input) || !BuildPreview(input, false, output, rgba) ||
        !BuildPreview(input, true, original, originalRgba)) { return false; }
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    snapshot_.previewWidth = output.width;
    snapshot_.previewHeight = output.height;
    snapshot_.previewRgba = std::move(rgba);
    snapshot_.originalWidth = original.width;
    snapshot_.originalHeight = original.height;
    snapshot_.originalRgba = std::move(originalRgba);
    snapshot_.previewTimeMs = std::max<int64_t>(0, pendingDecodedAttr_.pts - sourceStartUs_) /
        MICROSECONDS_PER_MILLISECOND;
    return true;
}

bool TranscodeJob::RunPreview()
{
    if (!InitializeDemuxer()) { return false; }
    const char *mime = nullptr;
    if (!OH_AVFormat_GetStringValue(videoFormat_.get(), OH_MD_KEY_CODEC_MIME, &mime) || mime == nullptr) {
        return Fail("Read preview source MIME");
    }
    decoder_ = OH_VideoDecoder_CreateByMime(mime);
    if (decoder_ == nullptr || !OH_AVFormat_SetIntValue(videoFormat_.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1) ||
        !OH_AVFormat_SetIntValue(videoFormat_.get(), OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12) ||
        !OH_AVFormat_SetIntValue(videoFormat_.get(), OH_MD_KEY_ROTATION, 0) ||
        !Check(OH_VideoDecoder_Configure(decoder_, videoFormat_.get()), "Configure preview decoder") ||
        !Check(OH_VideoDecoder_Prepare(decoder_), "Prepare preview decoder") ||
        !Check(OH_VideoDecoder_Start(decoder_), "Start preview decoder")) { return Fail("Initialize preview decoder"); }
    decoderStarted_ = true;
    const auto deadline = std::chrono::steady_clock::now() + std::chrono::seconds(PREVIEW_TIMEOUT_SECONDS);
    while (!cancelled_.load() && std::chrono::steady_clock::now() < deadline) {
        bool advanced = false;
        if (!DrainDecoder(advanced)) { return false; }
        if (pendingDecoded_ != nullptr) {
            const bool success = pendingDecodedAttr_.size > 0 ? CapturePreview() :
                Fail("No decoded frame within the selected preview range");
            const bool returned = Check(OH_VideoDecoder_FreeOutputBuffer(decoder_, pendingDecodedIndex_),
                "Return preview frame");
            pendingDecoded_ = nullptr;
            return success && returned;
        }
        if (decoderOutputDone_) { return Fail("No decoded frame within the selected preview range"); }
        if (!FeedDecoder(advanced)) { return false; }
        if (!advanced) { std::this_thread::sleep_for(std::chrono::milliseconds(PREVIEW_IDLE_WAIT_MS)); }
    }
    return cancelled_.load() ? false : Fail("Preview timed out after 15 seconds");
}

bool TranscodeJob::CopyVideoSample()
{
    OH_AVCodecBufferAttr attr {};
    if (!Check(OH_AVDemuxer_ReadSampleBuffer(demuxer_, videoTrack_, videoCopyBuffer_), "Read remux video") ||
        !Check(OH_AVBuffer_GetBufferAttr(videoCopyBuffer_, &attr), "Read remux video attributes")) { return false; }
    attr.pts = std::max<int64_t>(0, attr.pts - rangeStartUs_);
    if (!Check(OH_AVBuffer_SetBufferAttr(videoCopyBuffer_, &attr), "Rebase original video timestamps")) {
        return false;
    }
    if (attr.size > 0 && !Check(OH_AVMuxer_WriteSampleBuffer(muxer_, muxVideoTrack_, videoCopyBuffer_),
        "Write original video sample")) { return false; }
    encoderOutputDone_ = (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    UpdateVideoProgress(attr);
    return true;
}

bool TranscodeJob::CopyRemuxAudio(bool &advanced)
{
    for (size_t index = 0; index < remuxAudioSourceTracks_.size(); ++index) {
        if (remuxAudioDone_[index] != 0) {
            continue;
        }
        if (!CopyRemuxAudioSample(index)) {
            return false;
        }
        advanced = true;
    }
    audioDone_ = std::all_of(remuxAudioDone_.begin(), remuxAudioDone_.end(),
        [](uint8_t done) { return done != 0; });
    return true;
}

bool TranscodeJob::CopyRemuxAudioSample(size_t index)
{
    OH_AVCodecBufferAttr attr{};
    const int32_t track = remuxAudioSourceTracks_[index];
    if (!Check(OH_AVDemuxer_ReadSampleBuffer(demuxer_, track, audioBuffer_), "Read remux audio sample") ||
        !Check(OH_AVBuffer_GetBufferAttr(audioBuffer_, &attr), "Read remux audio attributes")) {
        return false;
    }
    remuxAudioDone_[index] = (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0 ? 1 : 0;
    if (attr.size <= 0) {
        return true;
    }
    attr.pts = std::max<int64_t>(0, attr.pts - rangeStartUs_);
    if (!Check(OH_AVBuffer_SetBufferAttr(audioBuffer_, &attr), "Set remux audio timestamp") ||
        !Check(OH_AVMuxer_WriteSampleBuffer(muxer_, remuxAudioMuxTracks_[index], audioBuffer_),
            "Write remux audio sample")) {
        return false;
    }
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    snapshot_.audioBytes += attr.size;
    return true;
}

bool TranscodeJob::InitializeRemuxAudioTracks()
{
    if (options_.remuxAllAudioTracks) {
        remuxAudioMuxTracks_.resize(remuxAudioFormats_.size(), -1);
        remuxAudioDone_.resize(remuxAudioFormats_.size(), 0);
        for (size_t index = 0; index < remuxAudioFormats_.size(); ++index) {
            if (!Check(OH_AVMuxer_AddTrack(muxer_, &remuxAudioMuxTracks_[index], remuxAudioFormats_[index].get()),
                "Source audio track is not MP4-compatible")) { return false; }
        }
    } else if (audioFormat_ != nullptr && !Check(OH_AVMuxer_AddTrack(muxer_, &muxAudioTrack_, audioFormat_.get()),
        "Source audio is not MP4-compatible; select no audio")) {
        return false;
    }
    return true;
}

bool TranscodeJob::RunRemux()
{
    if (!CheckStorage(true) || !InitializeDemuxer()) { return false; }
    muxer_ = OH_AVMuxer_Create(options_.outputFd, AV_OUTPUT_FORMAT_MPEG_4);
    videoCopyBuffer_ = OH_AVBuffer_Create(VIDEO_COPY_BUFFER_SIZE);
    if (muxer_ == nullptr || videoCopyBuffer_ == nullptr ||
        !Check(OH_AVMuxer_SetRotation(muxer_, rotation_), "Set remux rotation") ||
        !Check(OH_AVMuxer_AddTrack(muxer_, &muxVideoTrack_, videoFormat_.get()),
            "Source video is not MP4-compatible") || !InitializeRemuxAudioTracks()) {
        return false;
    }
    if (!Check(OH_AVMuxer_Start(muxer_), "Start remux container")) { return false; }
    if (!Snapshot().subtitleTracks.empty()) {
        AddValidationNote("Subtitle tracks were detected but are not copied: "
            "the native MP4 muxer API supports audio/video tracks only");
    }
    muxStarted_ = true;
    while (!cancelled_.load() && !(encoderOutputDone_ && audioDone_)) {
        bool advanced = false;
        if (!CheckStorage(false) || (!encoderOutputDone_ && !CopyVideoSample()) || !CopyAudio(advanced)) {
            return false;
        }
        if (TranscodeMetrics::Clock::now() - publishedAt_ >=
            std::chrono::milliseconds(DIAGNOSTICS_PUBLISH_INTERVAL_MS)) {
            PublishDiagnostics();
        }
    }
    return !cancelled_.load() && FinalizeOutput();
}
