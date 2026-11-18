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
constexpr int64_t AUDIO_LEAD_US = 500000;
constexpr double RUNNING_PROGRESS_LIMIT = 99;
constexpr int32_t YUV420_COMPONENTS = 3;
constexpr int32_t YUV420_SUBSAMPLING = 2;
using TranscodeMetrics::WaitChannel;
} // namespace

bool TranscodeJob::FeedDecoder(bool &advanced)
{
    if (decoderInputDone_) {
        return true;
    }
    TranscodeCodecBuffer available;
    const int32_t result = AcquireCodecBuffer(false, true, available);
    if (result == AV_ERR_TRY_AGAIN_LATER) {
        return true;
    }
    if (!Check(result, "Acquire decoder input")) {
        return false;
    }
    const uint32_t index = available.index;
    OH_AVBuffer *buffer = available.buffer;
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
    if (decoderOutputDone_ || pendingDecoded_ != nullptr || gpuPending_) {
        return true;
    }
    TranscodeCodecBuffer available;
    const int32_t result = AcquireCodecBuffer(false, false, available);
    diagnostics_.Availability(WaitChannel::DECODER_OUTPUT, result != AV_ERR_TRY_AGAIN_LATER);
    if (result == AV_ERR_TRY_AGAIN_LATER) {
        return true;
    }
    if (result == AV_ERR_STREAM_CHANGED) {
        if (options_.gpu && !ValidateGpuOutputResolution()) {
            return false;
        }
        layoutsValid_ = false;
        advanced = true;
        return true;
    }
    if (!Check(result, "Acquire decoder output")) {
        return false;
    }
    pendingDecodedIndex_ = available.index;
    pendingDecoded_ = available.buffer;
    if (pendingDecoded_ == nullptr ||
        !Check(OH_AVBuffer_GetBufferAttr(pendingDecoded_, &pendingDecodedAttr_), "Read decoded frame attributes")) {
        pendingDecoded_ = nullptr;
        return Fail("Get decoded output Buffer");
    }
    if (!DiscardOutsideRange(advanced)) { return false; }
    if (pendingDecoded_ == nullptr) { return true; }
    if (!DropFrame(advanced)) { return false; }
    advanced = true;
    return true;
}

bool TranscodeJob::ValidateGpuOutputResolution()
{
    Format format(OH_VideoDecoder_GetOutputDescription(decoder_), OH_AVFormat_Destroy);
    if (format == nullptr) {
        return Fail("Read OpenGL decoder output description");
    }
    int32_t width = 0;
    int32_t height = 0;
    const bool hasWidth = OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_VIDEO_PIC_WIDTH, &width) ||
        OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_WIDTH, &width);
    const bool hasHeight = OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_VIDEO_PIC_HEIGHT, &height) ||
        OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_HEIGHT, &height);
    if (!hasWidth || !hasHeight || width != sourceWidth_ || height != sourceHeight_) {
        return Fail("OpenGL processing does not support a mid-stream resolution change");
    }
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

bool TranscodeJob::SubmitGpuFrame(bool &advanced)
{
    if (gpuPending_) {
        return SubmitPendingGpuFrame(advanced);
    }
    if (pendingDecoded_ != nullptr) {
        return QueueGpuFrame(advanced);
    }
    return NotifyGpuRangeEnd(advanced);
}

bool TranscodeJob::SubmitPendingGpuFrame(bool &advanced)
{
    if (!gpu_->Available()) {
        return true;
    }
    const bool drawn = diagnostics_.Measure(TranscodeMetrics::Stage::PROCESS,
        [this] { return gpu_->Draw(gpuPts_); });
    if (!drawn) {
        return Fail("Process/swap OpenGL transcode frame");
    }
    gpuPending_ = false;
    decoderOutputDone_ = gpuEos_;
    if (gpuEos_) {
        if (!Check(OH_VideoEncoder_NotifyEndOfStream(encoder_), "Notify OpenGL encoder EOS")) {
            return false;
        }
        encoderEosSent_ = true;
    }
    advanced = true;
    return true;
}

bool TranscodeJob::QueueGpuFrame(bool &advanced)
{
    const bool eos = (pendingDecodedAttr_.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    if (eos && pendingDecodedAttr_.size == 0) {
        return SubmitSurfaceFrame(true, advanced);
    }
    gpuPts_ = std::max<int64_t>(0, pendingDecodedAttr_.pts - rangeStartUs_);
    gpuEos_ = eos;
    if (!Check(OH_VideoDecoder_RenderOutputBuffer(decoder_, pendingDecodedIndex_),
        "Render decoded frame to NativeImage")) {
        return false;
    }
    pendingDecoded_ = nullptr;
    gpuPending_ = true;
    advanced = true;
    return true;
}

bool TranscodeJob::NotifyGpuRangeEnd(bool &advanced)
{
    if (!decoderOutputDone_ || encoderEosSent_) {
        return true;
    }
    encoderEosSent_ = Check(OH_VideoEncoder_NotifyEndOfStream(encoder_), "Notify OpenGL range EOS");
    advanced = encoderEosSent_;
    return encoderEosSent_;
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
            encodedLayout_, options_.grayscale, static_cast<TranscodeFrames::ResizeMode>(options_.resizeMode),
            static_cast<TranscodeFrames::Filter>(options_.scalingFilter))) {
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
    if (options_.gpu) { return SubmitGpuFrame(advanced); }
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
    TranscodeCodecBuffer available;
    const int32_t result = AcquireCodecBuffer(true, true, available);
    diagnostics_.Availability(WaitChannel::ENCODER_INPUT, result != AV_ERR_TRY_AGAIN_LATER);
    if (result == AV_ERR_TRY_AGAIN_LATER) {
        return true;
    }
    if (!Check(result, "Acquire Buffer encoder input")) {
        return false;
    }
    const uint32_t index = available.index;
    OH_AVBuffer *input = available.buffer;
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
    // 带数据的最后一帧先正常送入，下一轮再单独送空EOS，避免编码器忽略尾帧。
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
    TranscodeCodecBuffer available;
    const int32_t result = AcquireCodecBuffer(true, false, available);
    diagnostics_.Availability(WaitChannel::ENCODER_OUTPUT, result != AV_ERR_TRY_AGAIN_LATER);
    if (result == AV_ERR_TRY_AGAIN_LATER) {
        return true;
    }
    if (result == AV_ERR_STREAM_CHANGED) {
        advanced = true;
        return StartMuxer();
    }
    if (!Check(result, "Acquire encoded output")) {
        return false;
    }
    const uint32_t index = available.index;
    OH_AVBuffer *buffer = available.buffer;
    OH_AVCodecBufferAttr attr{};
    if (buffer == nullptr || !Check(OH_AVBuffer_GetBufferAttr(buffer, &attr), "Read encoded output attributes")) {
        return Fail("Get encoded output Buffer");
    }
    bool success = StartMuxer();
    if (success && options_.surface && !options_.gpu && attr.size > 0) {
        // Surface carries the decoder's original PTS; Buffer input was already rebased before encoding.
        attr.pts = std::max<int64_t>(0, attr.pts - rangeStartUs_);
        success = Check(OH_AVBuffer_SetBufferAttr(buffer, &attr), "Rebase Surface video timestamps");
    }
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
    if (options_.remuxOnly && options_.remuxAllAudioTracks) {
        return CopyRemuxAudio(advanced);
    }
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
    if (!WriteCopiedAudioSample(attr)) {
        return false;
    }
    audioDone_ = (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    advanced = true;
    return true;
}

bool TranscodeJob::WriteCopiedAudioSample(OH_AVCodecBufferAttr &attr)
{
    attr.pts = std::max<int64_t>(0, attr.pts - rangeStartUs_);
    if (!Check(OH_AVBuffer_SetBufferAttr(audioBuffer_, &attr), "Rebase original audio timestamps")) {
        return false;
    }
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
    return true;
}
