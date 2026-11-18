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
    snapshot_.state = cancelled_.load() ? STATE_CANCELLED : (success ? STATE_FINISHED : STATE_FAILED);
    snapshot_.stage = cancelled_.load() ? "cancelled" : (success ? "complete" : "failed");
    if (snapshot_.state == STATE_FINISHED) {
        snapshot_.progress = COMPLETE_PROGRESS;
        snapshot_.audioCopied = (options_.remuxOnly && options_.remuxAllAudioTracks &&
            !remuxAudioSourceTracks_.empty()) || (audioTrack_ >= 0 && options_.audioMode == AUDIO_MODE_COPY);
    }
}

void TranscodeJob::ReleaseCodecs()
{
    // Surface由编码器创建，解码器借用。先销毁解码器，再销毁编码器和窗口引用。
    if (decoder_ != nullptr) {
        if (decoderStarted_) {
            (void)OH_VideoDecoder_Stop(decoder_);
        }
        OH_VideoDecoder_Destroy(decoder_);
        decoder_ = nullptr;
        pendingDecoded_ = nullptr;
    }
    gpu_.reset();
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
}

void TranscodeJob::Cleanup()
{
    // Reject late events before Stop, but retain callback contexts until both codecs are destroyed.
    codecCallbacks_.Close();
    audioPipeline_.reset();
    ReleaseCodecs();
    if (muxer_ != nullptr) {
        OH_AVMuxer_Destroy(muxer_);
        muxer_ = nullptr;
    }
    if (audioBuffer_ != nullptr) {
        OH_AVBuffer_Destroy(audioBuffer_);
        audioBuffer_ = nullptr;
    }
    if (videoCopyBuffer_ != nullptr) {
        OH_AVBuffer_Destroy(videoCopyBuffer_);
        videoCopyBuffer_ = nullptr;
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
