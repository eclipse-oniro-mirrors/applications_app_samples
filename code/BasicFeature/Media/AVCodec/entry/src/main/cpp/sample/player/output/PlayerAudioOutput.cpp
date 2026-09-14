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

#include "Player.h"

#include <chrono>

#include "AudioOutputPump.h"
#include "av_codec_sample_log.h"
#include "dfx/error/av_codec_sample_error.h"

#undef LOG_TAG
#define LOG_TAG "samplePlayer"

namespace {
constexpr int BALANCE_VALUE = 5;
constexpr int32_t BYTES_PER_SAMPLE_2 = 2;
constexpr int64_t CODEC_BUFFER_TIMEOUT_US = 100000;
using namespace std::chrono_literals;
} // namespace

void Player::AudioDecInputThread()
{
    while (isStarted_ && audioWorkerRunning_) {
        WaitIfPaused(true);
        CHECK_AND_BREAK_LOG(isStarted_ && audioWorkerRunning_, "Decoder input thread out");
        std::shared_ptr<CodecBufferInfo> bufferInfo = audioDecContext_->inputBufferQueue.Dequeue();
        std::shared_lock<std::shared_mutex> codecLock(audioDecContext_->codecMutex);
        CHECK_AND_BREAK_LOG(isStarted_ && audioWorkerRunning_, "Work done, thread out");
        CHECK_AND_CONTINUE_LOG(bufferInfo != nullptr && bufferInfo->isValid,
            "Buffer queue is empty or invalid, continue");
        audioDecContext_->inputFrameCount++;
        int32_t ret = demuxer_->ReadSample(demuxer_->GetAudioTrackId(), bufferInfo->buffer, bufferInfo->attr);
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            AVCODEC_SAMPLE_LOGE("Read audio sample failed");
            playbackFailed_ = true;
            isStarted_ = false;
            break;
        }
        ret = audioDecoder_->PushInputBuffer(*bufferInfo);
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            playbackFailed_ = true;
            isStarted_ = false;
            break;
        }
        CHECK_AND_BREAK_LOG(!(bufferInfo->attr.flags & AVCODEC_BUFFER_FLAGS_EOS), "Catch EOS, thread out");
    }
}

void Player::AudioDecInputSyncThread()
{
    while (isStarted_ && audioWorkerRunning_) {
        WaitIfPaused(true);
        CHECK_AND_BREAK_LOG(isStarted_ && audioWorkerRunning_, "Decoder input thread out");
        std::unique_lock<std::mutex> lock(audioDecContext_->inputMutex);
        CodecBufferInfo bufferInfo(nullptr);
        auto buffer = audioDecoder_->GetInputBuffer(bufferInfo, CODEC_BUFFER_TIMEOUT_US);
        CHECK_AND_CONTINUE_LOG(buffer != nullptr, "Get input buffer timeout, retry");
        CHECK_AND_BREAK_LOG(isStarted_ && audioWorkerRunning_, "Work done, thread out");
        bufferInfo.buffer = buffer;
        AVCODEC_SAMPLE_LOGW("bufferInfo.attr.size:%{public}d", bufferInfo.attr.size);
        audioDecContext_->inputFrameCount++;
        lock.unlock();
        int32_t ret = demuxer_->ReadSample(demuxer_->GetAudioTrackId(), buffer, bufferInfo.attr);
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            AVCODEC_SAMPLE_LOGE("Read audio sample failed");
            playbackFailed_ = true;
            isStarted_ = false;
            break;
        }
        if ((bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_EOS) && isLoop_) {
            ret = demuxer_->Seek(0);
            if (ret != AVCODEC_SAMPLE_ERR_OK) {
                playbackFailed_ = true;
                isStarted_ = false;
                break;
            }
            ret = demuxer_->ReadSample(demuxer_->GetAudioTrackId(), bufferInfo.buffer, bufferInfo.attr);
            if (ret != AVCODEC_SAMPLE_ERR_OK) {
                playbackFailed_ = true;
                isStarted_ = false;
                break;
            }
        }
        ret = audioDecoder_->PushInputBuffer(bufferInfo);
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            playbackFailed_ = true;
            isStarted_ = false;
            break;
        }
        CHECK_AND_BREAK_LOG(!(bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_EOS), "Catch EOS, thread out");
    }
}

bool Player::ProcessAudioOutput(CodecBufferInfo &bufferInfo)
{
    audioOutputBuffers_.fetch_add(1);
    const int32_t ret = audioDecoder_->FreeOutputBuffer(bufferInfo.bufferIndex, true);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGW("FreeOutputBuffer failed: %{public}d", ret);
        playbackFailed_ = true;
        isStarted_ = false;
        return false;
    }
    playbackClock_.AddWrittenSamples(bufferInfo.attr.size / sampleInfo_.audio.audioChannelCount / BYTES_PER_SAMPLE_2);
    AVCODEC_SAMPLE_LOGI("writtenSampleCnt_: %{public}ld, bufferInfo.attr.size: %{public}d, "
        "sampleInfo_.audioChannelCount: %{public}d", playbackClock_.GetWrittenSamples(), bufferInfo.attr.size,
        sampleInfo_.audio.audioChannelCount);
    playbackClock_.SetAudioBufferPts(bufferInfo.attr.pts);
    audioDecContext_->endPosAudioBufferPts = playbackClock_.GetAudioBufferPts();
    hasDecodedOutput_ = true;
    std::unique_lock<std::mutex> lockRender(audioDecContext_->outputMutex);
    audioDecContext_->renderCond.wait_for(lockRender, 20ms, [this, bufferInfo]() {
        return audioDecContext_->renderQueue.size() < BALANCE_VALUE * bufferInfo.attr.size;
    });
    return true;
}

AudioOutputPump Player::CreateAudioOutputPump()
{
    AudioOutputPump::DumpCallback dumpCallback;
#ifdef DEBUG_DECODE
    dumpCallback = [this](CodecBufferInfo &bufferInfo) {
        if (audioOutputFile_.is_open()) {
            auto *source = OH_AVBuffer_GetAddr(bufferInfo.buffer);
            if (source != nullptr) {
                source += bufferInfo.attr.offset;
                audioOutputFile_.write(reinterpret_cast<const char *>(source), bufferInfo.attr.size);
            }
        }
    };
#endif
    return AudioOutputPump({
        *audioDecoder_,
        *audioDecContext_,
        audioWorkerRunning_,
        playbackFailed_,
        [this](CodecBufferInfo &bufferInfo) { return PrepareAudioOutputAfterSeek(bufferInfo); },
        [this](CodecBufferInfo &bufferInfo) { return ProcessAudioOutput(bufferInfo); },
        std::move(dumpCallback),
    });
}

void Player::FinishAudioOutput(bool stopRenderer)
{
    if (seekInProgress_.load() || (audioTrackSwitching_.load() && !audioWorkerRunning_.load())) {
        AVCODEC_SAMPLE_LOGI("Audio output paused for seek or track switch");
        return;
    }
    if (audioTrackSwitching_.load() && audioWorkerRunning_.load()) {
        audioTrackSwitching_ = false;
        discardAudioUntilSeekTarget_ = false;
    }
    std::unique_lock<std::mutex> lockRender(audioDecContext_->outputMutex);
    audioDecContext_->renderCond.wait_for(lockRender, 500ms,
        [this]() { return audioDecContext_->renderQueue.empty(); });
    if (seekInProgress_.load()) {
        AVCODEC_SAMPLE_LOGI("Audio output paused for seek after draining wait");
        return;
    }
    AVCODEC_SAMPLE_LOGI("Out buffer end");
    if (stopRenderer) {
        std::lock_guard<std::mutex> rendererLock(audioRendererMutex_);
        if (audioRenderer_ != nullptr) {
            OH_AudioRenderer_Stop(audioRenderer_);
        }
    }
    std::lock_guard<std::mutex> lock(doneMutex);
    if (seekInProgress_.load()) {
        return;
    }
    isAudioDone = true;
    doneCond_.notify_all();
}

void Player::AudioDecOutputThread()
{
    AudioOutputPump outputPump = CreateAudioOutputPump();
    while (audioWorkerRunning_) {
        WaitIfPaused(true);
        if (!outputPump.ProcessAsyncOutput()) {
            break;
        }
    }
    FinishAudioOutput(true);
}

void Player::AudioDecOutputSyncThread()
{
    AudioOutputPump outputPump = CreateAudioOutputPump();
    while (audioWorkerRunning_) {
        WaitIfPaused(true);
        if (!outputPump.ProcessSyncOutput()) {
            break;
        }
    }
    FinishAudioOutput(false);
}

int64_t Player::GetCurrentTime()
{
    const auto now = std::chrono::steady_clock::now();
    const auto nowNs = std::chrono::time_point_cast<std::chrono::nanoseconds>(now);
    return nowNs.time_since_epoch().count();
}
