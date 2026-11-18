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
constexpr auto STALL_LIMIT = std::chrono::seconds(30);
constexpr auto POLL_INTERVAL = std::chrono::milliseconds(2);
constexpr int64_t MS_PER_SECOND = 1000;
constexpr int64_t US_PER_SECOND = 1000000;
constexpr int64_t US_PER_MS = US_PER_SECOND / MS_PER_SECOND;
constexpr int64_t DIAGNOSTIC_INTERVAL_MS = 250;
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

void TranscodeJob::Run()
{
    startedAt_ = TranscodeMetrics::Clock::now();
    publishedAt_ = startedAt_;
    if (options_.inspectOnly) {
        const bool success = !cancelled_.load() && OpenSource() && (options_.remuxOnly || InspectCodecs());
        Cleanup();
        Complete(success);
        return;
    }
    if (options_.previewOnly || options_.remuxOnly) {
        const bool success = !cancelled_.load() && OpenSource() &&
            (options_.previewOnly ? RunPreview() : RunRemux());
        PublishDiagnostics();
        Cleanup();
        Complete(success);
        return;
    }
    bool success = !cancelled_.load() && OpenSource() && InspectCodecs() && CheckStorage(true) &&
                   InitializeDemuxer() && ConfigureCodecs();
    auto lastProgress = std::chrono::steady_clock::now();
    // 输入EOS只结束输入；编码输出EOS和音轨都处理完，才能停止封装并报告完成。
    while (success && !cancelled_.load() && !(encoderOutputDone_ && audioDone_)) {
        const uint64_t revision = options_.codecMode == 1 ? codecCallbacks_.Revision() : 0;
        bool advanced = false;
        success = CheckCodecCallbacks() && CheckStorage(false) && DrainEncoder(advanced) &&
            SubmitDecodedFrame(advanced) && DrainDecoder(advanced) && FeedDecoder(advanced) && CopyAudio(advanced);
        if (TranscodeMetrics::Clock::now() - publishedAt_ >= std::chrono::milliseconds(DIAGNOSTIC_INTERVAL_MS)) {
            PublishDiagnostics();
        }
        if (advanced) {
            lastProgress = std::chrono::steady_clock::now();
        } else if (std::chrono::steady_clock::now() - lastProgress > STALL_LIMIT) {
            success = Fail("Codec pipeline made no progress for 30 seconds");
        } else if (options_.codecMode == 1) {
            // Audio conversion still polls; bound the wait even when no video callback arrives.
            codecCallbacks_.Wait(revision, POLL_INTERVAL);
        } else {
            std::this_thread::sleep_for(POLL_INTERVAL);
        }
    }
    if (success && !cancelled_.load()) {
        {
            std::lock_guard<std::mutex> lock(snapshotMutex_);
            snapshot_.stage = "finalize";
        }
        success = CheckCodecCallbacks() && FinalizeOutput() && CheckCodecCallbacks();
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
