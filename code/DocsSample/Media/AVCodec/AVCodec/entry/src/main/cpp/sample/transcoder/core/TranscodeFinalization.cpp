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
constexpr int32_t STATE_FINISHED = 2;
constexpr int32_t STATE_CANCELLED = 3;
constexpr int32_t STATE_FAILED = 4;
constexpr double COMPLETE_PROGRESS = 100;
constexpr int32_t AUDIO_MODE_COPY = 0;
} // namespace

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
    if (success && !snapshot_.cleanupFailure.stage.empty()) {
        success = false;
        snapshot_.detail = snapshot_.cleanupFailure.stage;
        snapshot_.errorCode = snapshot_.cleanupFailure.code;
    }
    snapshot_.state = cancelled_.load() ? STATE_CANCELLED : (success ? STATE_FINISHED : STATE_FAILED);
    snapshot_.stage = cancelled_.load() ? "cancelled" : (success ? "complete" : "failed");
    if (snapshot_.state == STATE_FINISHED) {
        snapshot_.progress = COMPLETE_PROGRESS;
        snapshot_.audioCopied = (options_.remuxOnly && options_.remuxAllAudioTracks &&
            !remuxAudioSourceTracks_.empty()) || (audioTrack_ >= 0 && options_.audioMode == AUDIO_MODE_COPY);
    }
}

void TranscodeJob::RecordCleanup(const char *stage, int32_t result)
{
    if (result == 0) { return; }
    std::lock_guard<std::mutex> lock(snapshotMutex_);
    if (snapshot_.cleanupFailure.stage.empty()) {
        snapshot_.cleanupFailure.stage = stage;
        snapshot_.cleanupFailure.code = result;
        snapshot_.cleanupFailure.message = "Native resource cleanup failed";
    }
    AVCODEC_SAMPLE_LOGW("Transcode cleanup failed: %{public}s, ret: %{public}d", stage, result);
}

void TranscodeJob::ReleaseCodecs()
{
    // Surface由编码器创建，解码器借用。先销毁解码器，再销毁编码器和窗口引用。
    if (decoder_ != nullptr) {
        if (decoderStarted_) {
            RecordCleanup("decoder.stop", OH_VideoDecoder_Stop(decoder_));
        }
        RecordCleanup("decoder.destroy", decoder_.Close());
        pendingDecoded_ = nullptr;
    }
    gpu_.reset();
    if (encoder_ != nullptr) {
        if (encoderStarted_) {
            RecordCleanup("encoder.stop", OH_VideoEncoder_Stop(encoder_));
        }
        RecordCleanup("encoder.destroy", encoder_.Close());
    }
    if (encoderWindow_ != nullptr) {
        RecordCleanup("encoder.window", encoderWindow_.Close());
    }
}

void TranscodeJob::Cleanup()
{
    // Reject late events before Stop, but retain callback contexts until both codecs are destroyed.
    codecCallbacks_.Close();
    if (audioPipeline_ != nullptr) { RecordCleanup("audio.pipeline.close", audioPipeline_->Close()); }
    audioPipeline_.reset();
    ReleaseCodecs();
    if (muxer_ != nullptr) {
        RecordCleanup("muxer.destroy", muxer_.Close());
    }
    if (audioBuffer_ != nullptr) {
        RecordCleanup("audio.buffer", audioBuffer_.Close());
    }
    if (videoCopyBuffer_ != nullptr) {
        RecordCleanup("video.buffer", videoCopyBuffer_.Close());
    }
    if (demuxer_ != nullptr) {
        RecordCleanup("demuxer.destroy", demuxer_.Close());
    }
    if (source_ != nullptr) {
        RecordCleanup("source.destroy", source_.Close());
    }
    if (options_.inputFd >= 0) {
        if (close(options_.inputFd) != 0) { RecordCleanup("input.close", errno); }
        options_.inputFd = -1;
    }
    if (options_.outputFd >= 0) {
        if (close(options_.outputFd) != 0) { RecordCleanup("output.close", errno); }
        options_.outputFd = -1;
    }
}
