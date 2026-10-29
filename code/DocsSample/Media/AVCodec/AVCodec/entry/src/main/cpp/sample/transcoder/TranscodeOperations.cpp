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
constexpr int32_t YUV_CHROMA_OFFSET = 128;
constexpr int32_t YUV_LUMA_OFFSET = 16;
constexpr int32_t YUV_LUMA_RANGE = 219;
constexpr int32_t YUV_CHROMA_RANGE = 224;
constexpr int32_t RGBA_ALPHA_OPAQUE = 255;
constexpr int32_t PREVIEW_MAX_LONG_EDGE = 640;
constexpr int64_t VIDEO_COPY_BUFFER_SIZE = 32LL * 1024 * 1024;
constexpr int32_t PREVIEW_IDLE_WAIT_MS = 2;
constexpr int32_t DIAGNOSTICS_PUBLISH_INTERVAL_MS = 250;
constexpr double COLOR_COEFFICIENT_SCALE = 2.0;
constexpr int32_t PREVIEW_TIMEOUT_SECONDS = 15;
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
        return timestamp / 1000000 * options_.frameRateLimit +
            timestamp % 1000000 * options_.frameRateLimit / 1000000;
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

bool TranscodeJob::CapturePreview()
{
    Format description(OH_VideoDecoder_GetOutputDescription(decoder_), OH_AVFormat_Destroy);
    TranscodeFrames::Layout input;
    if (!ReadLayout(description.get(), input)) { return false; }
    TranscodeFrames::Layout output;
    if (!TranscodeFrames::FitSize(targetWidth_, targetHeight_, PREVIEW_MAX_LONG_EDGE,
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
            options_.grayscale, static_cast<TranscodeFrames::ResizeMode>(options_.resizeMode),
            static_cast<TranscodeFrames::Filter>(options_.scalingFilter))) { return Fail("Process preview image"); }
    int32_t matrix = MATRIX_COEFFICIENT_BT709;
    int32_t fullRange = 0;
    OH_AVFormat_GetIntValue(videoFormat_.get(), OH_MD_KEY_MATRIX_COEFFICIENTS, &matrix);
    OH_AVFormat_GetIntValue(videoFormat_.get(), OH_MD_KEY_RANGE_FLAG, &fullRange);
    double kr = matrix == MATRIX_COEFFICIENT_BT709 ? 0.2126 : 0.299;
    double kb = matrix == MATRIX_COEFFICIENT_BT709 ? 0.0722 : 0.114;
    const double kg = 1 - kr - kb;
    std::vector<uint8_t> rgba(static_cast<size_t>(output.width) * output.height * RGBA_CHANNEL_COUNT);
    const auto byte = [](double value) { return static_cast<uint8_t>(std::clamp(std::lround(value), 0L, 255L)); };
    const size_t plane = static_cast<size_t>(output.width) * output.height;
    for (int32_t y = 0; y < output.height; ++y) {
        for (int32_t x = 0; x < output.width; ++x) {
            const size_t pixel = static_cast<size_t>(y) * output.width + x;
            const size_t uv = plane + static_cast<size_t>(y / CHROMA_SUBSAMPLING) * output.width + (x & ~1);
            const double luma = fullRange ? yuv[pixel] :
                (yuv[pixel] - YUV_LUMA_OFFSET) * 255.0 / YUV_LUMA_RANGE;
            const double u = (yuv[uv] - YUV_CHROMA_OFFSET) * (fullRange ? 1 : 255.0 / YUV_CHROMA_RANGE);
            const double v = (yuv[uv + 1] - YUV_CHROMA_OFFSET) * (fullRange ? 1 : 255.0 / YUV_CHROMA_RANGE);
            const size_t rgbaIndex = pixel * RGBA_CHANNEL_COUNT;
            rgba[rgbaIndex] = byte(luma + COLOR_COEFFICIENT_SCALE * (1 - kr) * v);
            rgba[rgbaIndex + 1] = byte(luma - COLOR_COEFFICIENT_SCALE * kb * (1 - kb) / kg * u -
                COLOR_COEFFICIENT_SCALE * kr * (1 - kr) / kg * v);
            rgba[rgbaIndex + 2] = byte(luma + COLOR_COEFFICIENT_SCALE * (1 - kb) * u);
            rgba[rgbaIndex + 3] = RGBA_ALPHA_OPAQUE;
        }
    }
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    snapshot_.previewWidth = output.width;
    snapshot_.previewHeight = output.height;
    snapshot_.previewRgba = std::move(rgba);
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
    if (attr.size > 0 && !Check(OH_AVMuxer_WriteSampleBuffer(muxer_, muxVideoTrack_, videoCopyBuffer_),
        "Write original video sample")) { return false; }
    encoderOutputDone_ = (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    UpdateVideoProgress(attr);
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
            "Source video is not MP4-compatible") ||
        (audioFormat_ != nullptr && !Check(OH_AVMuxer_AddTrack(muxer_, &muxAudioTrack_, audioFormat_.get()),
            "Source audio is not MP4-compatible; select no audio")) ||
        !Check(OH_AVMuxer_Start(muxer_), "Start remux container")) { return false; }
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
