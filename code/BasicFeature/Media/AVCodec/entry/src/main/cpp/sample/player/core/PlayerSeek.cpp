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
#include "av_codec_sample_log.h"
#include "dfx/error/av_codec_sample_error.h"
#include <algorithm>
#include <queue>

#undef LOG_TAG
#define LOG_TAG "samplePlayer"

namespace {
constexpr int64_t US_PER_MILLISECOND = 1000;
} // namespace

void Player::CancelWorkerWaits()
{
    if (videoDecContext_ != nullptr) {
        videoDecContext_->inputBufferQueue.CancelWait();
        videoDecContext_->outputBufferQueue.CancelWait();
    }
    if (audioDecContext_ != nullptr) {
        audioDecContext_->inputBufferQueue.CancelWait();
        audioDecContext_->outputBufferQueue.CancelWait();
        audioDecContext_->renderCond.notify_all();
    }
}

void Player::WaitIfPaused(bool audioWorker)
{
    std::unique_lock<std::mutex> lock(pauseMutex_);
    pauseCond_.wait(lock, [this, audioWorker]() {
        return !paused_.load() || !isStarted_.load() || (audioWorker && !audioWorkerRunning_.load()) ||
            (!audioWorker && renderSingleFrameAfterSeek_.load());
    });
}

void Player::StartAudioAfterVideoSeek()
{
    if (!audioStartPendingAfterVideoSeek_.exchange(false)) {
        return;
    }
    audioStartCond_.notify_all();
    if (!isStarted_.load() || paused_.load()) {
        return;
    }
    std::lock_guard<std::mutex> rendererLock(audioRendererMutex_);
    if (audioRenderer_ == nullptr) {
        return;
    }
    const int32_t ret = OH_AudioRenderer_Start(audioRenderer_);
    if (ret != AUDIOSTREAM_SUCCESS) {
        AVCODEC_SAMPLE_LOGE("Start audio renderer after video seek failed: %{public}d", ret);
        playbackFailed_ = true;
        isStarted_ = false;
        CancelWorkerWaits();
        return;
    }
    if (speed.load() != 1.0f) {
        const int32_t speedRet = OH_AudioRenderer_SetSpeed(audioRenderer_, speed.load());
        if (speedRet != AUDIOSTREAM_SUCCESS) {
            AVCODEC_SAMPLE_LOGE("Restore audio speed after video seek failed: %{public}d", speedRet);
            playbackFailed_ = true;
            isStarted_ = false;
            CancelWorkerWaits();
        }
    }
    AVCODEC_SAMPLE_LOGI("Audio renderer started after first video frame reached seek target");
}

void Player::StopWorkersForSeek()
{
    isStarted_ = false;
    pauseCond_.notify_all();
    // Wake an audio output thread that may be waiting for the first video frame.
    audioStartPendingAfterVideoSeek_ = false;
    audioWorkerRunning_ = false;
    audioTrackSwitching_ = false;
    audioStartCond_.notify_all();
    if (audioRenderer_ != nullptr) {
        int32_t ret = OH_AudioRenderer_Pause(audioRenderer_);
        if (ret != AUDIOSTREAM_SUCCESS) {
            AVCODEC_SAMPLE_LOGW("Pause audio renderer before seek failed: %{public}d", ret);
        }
    }
    CancelWorkerWaits();
    JoinWorkerThreads();
}

void Player::ReleaseCodecResourcesForSeek()
{
    if (videoDecContext_ != nullptr) {
        videoDecContext_->isDestroyed = true;
    }
    if (audioDecContext_ != nullptr) {
        audioDecContext_->isDestroyed = true;
    }
    {
        std::lock_guard<std::mutex> rendererLock(audioRendererMutex_);
        if (audioRenderer_ != nullptr) {
            OH_AudioRenderer_Release(audioRenderer_);
            audioRenderer_ = nullptr;
        }
    }
    if (builder_ != nullptr) {
        OH_AudioStreamBuilder_Destroy(builder_);
        builder_ = nullptr;
    }
    ReleaseVideoDecoder();
    ReleaseAudioDecoder();
    if (videoSink_ != nullptr) {
        videoSink_->Reset();
    }
}

void Player::ResetPlaybackClockForSeek(int64_t positionUs)
{
    playbackPositionUs_.store(positionUs);
    playbackClock_.Reset(positionUs);
    if (audioDecContext_ == nullptr) {
        return;
    }
    std::lock_guard<std::mutex> lock(audioDecContext_->outputMutex);
    std::queue<unsigned char> emptyQueue;
    audioDecContext_->renderQueue.swap(emptyQueue);
    audioDecContext_->audioFramesWritten = 0;
    audioDecContext_->currentPosAudioBufferPts = positionUs;
    audioDecContext_->endPosAudioBufferPts = positionUs;
}

bool Player::DiscardVideoOutputBeforeSeekTarget(CodecBufferInfo &bufferInfo, bool &discarded)
{
    discarded = false;
    if (!discardVideoUntilSeekTarget_.load()) {
        return true;
    }
    const int64_t targetUs = seekTargetUs_.load();
    bool discardUntilTarget = true;
    const VideoSeekDecision decision =
        seekController_.DecideVideoFrame(bufferInfo.attr.pts, targetUs, discardUntilTarget);
    discardVideoUntilSeekTarget_.store(discardUntilTarget);
    discarded = decision.discardFrame;
    if (decision.reachedTarget) {
        AVCODEC_SAMPLE_LOGI("Video reached seek target, pts: %{public}" PRId64, bufferInfo.attr.pts);
    }
    if (!discarded) {
        return true;
    }
    int32_t ret = videoDecoder_->FreeOutputBuffer(bufferInfo.bufferIndex, false);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Free pre-target video buffer failed: %{public}d", ret);
        playbackFailed_ = true;
        isStarted_ = false;
        return false;
    }
    videoOutputFrames_.fetch_add(1);
    videoDroppedFrames_.fetch_add(1);
    AVCODEC_SAMPLE_LOGD("Discard pre-target video frame, pts: %{public}" PRId64 ", target: %{public}" PRId64,
        bufferInfo.attr.pts, targetUs);
    return true;
}

bool Player::PrepareAudioOutputAfterSeek(CodecBufferInfo &bufferInfo)
{
    if (audioStartPendingAfterVideoSeek_.load()) {
        std::unique_lock<std::mutex> lock(audioStartMutex_);
        audioStartCond_.wait(lock, [this]() {
            return !audioStartPendingAfterVideoSeek_.load() || !isStarted_.load();
        });
        if (!isStarted_.load()) {
            return false;
        }
    }
    if (!discardAudioUntilSeekTarget_.load()) {
        if (audioTrackSwitching_.load()) {
            audioTrackSwitching_ = false;
        }
        return true;
    }
    const int64_t targetUs = seekTargetUs_.load();
    if (bufferInfo.attr.pts >= targetUs) {
        discardAudioUntilSeekTarget_ = false;
        if (audioTrackSwitching_.load()) {
            audioTrackSwitching_ = false;
            AVCODEC_SAMPLE_LOGI("Audio track reached current playback position, resume A/V sync");
        }
        AVCODEC_SAMPLE_LOGI("Audio reached seek target, pts: %{public}" PRId64, bufferInfo.attr.pts);
        return true;
    }
    const int32_t capacity = bufferInfo.buffer == nullptr ? -1 : OH_AVBuffer_GetCapacity(bufferInfo.buffer);
    const AudioSeekResult result = seekController_.TrimAudioFrame(bufferInfo, targetUs,
        sampleInfo_.audio.audioSampleRate, sampleInfo_.audio.audioChannelCount, capacity);
    if (result == AUDIO_SEEK_ERROR) {
        AVCODEC_SAMPLE_LOGE("Invalid audio output while applying precise seek");
        playbackFailed_ = true;
        isStarted_ = false;
        return false;
    }
    if (result == AUDIO_SEEK_DISCARD) {
        AVCODEC_SAMPLE_LOGD("Discard pre-target audio buffer, pts: %{public}" PRId64, bufferInfo.attr.pts);
        return false;
    }
    discardAudioUntilSeekTarget_ = false;
    if (audioTrackSwitching_.load()) {
        audioTrackSwitching_ = false;
        AVCODEC_SAMPLE_LOGI("Audio track trimmed to current playback position, resume A/V sync");
    }
    AVCODEC_SAMPLE_LOGI("Trim audio at seek target, output pts: %{public}" PRId64, bufferInfo.attr.pts);
    return true;
}

int32_t Player::RecreateDecodersAfterSeek(bool hadVideo, bool hadAudio)
{
    int32_t ret = AVCODEC_SAMPLE_ERR_OK;
    if (hadAudio) {
        audioDecoder_ = std::make_shared<AudioDecoder>();
        ret = CreateAudioDecoder();
        CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK && audioDecContext_ != nullptr,
            AVCODEC_SAMPLE_ERR_ERROR, "Recreate audio decoder after seek failed");
    }
    if (hadVideo) {
        videoDecoder_ = std::make_unique<VideoDecoder>();
        ret = CreateVideoDecoder();
        CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK && videoDecContext_ != nullptr,
            AVCODEC_SAMPLE_ERR_ERROR, "Recreate video decoder after seek failed");
    }
    return AVCODEC_SAMPLE_ERR_OK;
}

void Player::PreparePlaybackStateAfterSeek(bool hadVideo, bool hadAudio, int64_t positionUs)
{
    UpdateSmartFluencyAvailability();
    ResetPlaybackClockForSeek(positionUs);
    seekTargetUs_ = positionUs;
    discardVideoUntilSeekTarget_ = hadVideo && positionUs > 0;
    discardAudioUntilSeekTarget_ = hadAudio && positionUs > 0;
    {
        std::lock_guard<std::mutex> doneLock(doneMutex);
        isAudioDone = !hadAudio;
        isVideoDone = !hadVideo;
        seekInProgress_ = false;
    }
    isStarted_ = true;
    paused_ = !resumeAfterSeek_;
    // Keep audio paused for a paused seek, but let the video pipeline present
    // the first frame at the requested position. This is also used by frame
    // stepping, which is implemented as a precise paused seek.
    renderSingleFrameAfterSeek_ = hadVideo && !resumeAfterSeek_;
    audioStartPendingAfterVideoSeek_ = hadVideo && hadAudio;
}

int32_t Player::RestartAudioAfterSeek(float speedSnapshot)
{
    int32_t ret = StartAudioDecoder();
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret,
        "Restart audio decoder after seek failed");
    if (audioStartPendingAfterVideoSeek_.load()) {
        AVCODEC_SAMPLE_LOGI("Delay audio renderer start until first video frame after seek");
        return AVCODEC_SAMPLE_ERR_OK;
    }
    ret = OH_AudioRenderer_Start(audioRenderer_);
    CHECK_AND_RETURN_RET_LOG(ret == AUDIOSTREAM_SUCCESS, AVCODEC_SAMPLE_ERR_ERROR,
        "Restart audio renderer after seek failed: %{public}d", ret);
    if (speedSnapshot == 1.0f) {
        return AVCODEC_SAMPLE_ERR_OK;
    }
    ret = OH_AudioRenderer_SetSpeed(audioRenderer_, speedSnapshot);
    CHECK_AND_RETURN_RET_LOG(ret == AUDIOSTREAM_SUCCESS, AVCODEC_SAMPLE_ERR_ERROR,
        "Restore audio speed after seek failed: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Player::RestoreVideoPolicyAfterSeek(float speedSnapshot)
{
    if (!smartFluencyAvailable_.load() || videoDecoder_ == nullptr) {
        return AVCODEC_SAMPLE_ERR_OK;
    }
    int32_t ret = videoDecoder_->OnUserSpeedChanged(speedSnapshot);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret,
        "Restore video speed after seek failed");
    if (!thermalWarningActive_) {
        return AVCODEC_SAMPLE_ERR_OK;
    }
    ret = videoDecoder_->OnThermalWarningReceived(thermalFrameRetentionRatio_);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret,
        "Restore thermal frame retention after seek failed");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Player::RecreateCodecResourcesAfterSeek(bool hadVideo, bool hadAudio, float speedSnapshot,
    int64_t positionUs)
{
    int32_t ret = RecreateDecodersAfterSeek(hadVideo, hadAudio);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret,
        "Recreate decoders after seek failed");
    PreparePlaybackStateAfterSeek(hadVideo, hadAudio, positionUs);
    if (hadVideo) {
        ret = StartVideoDecoder();
        CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret,
            "Restart video decoder after seek failed");
    }
    if (hadAudio) {
        ret = RestartAudioAfterSeek(speedSnapshot);
        CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret,
            "Restart audio after seek failed");
    }
    if (!resumeAfterSeek_) {
        if (audioRenderer_ != nullptr) {
            OH_AudioRenderer_Pause(audioRenderer_);
        }
    }
    return RestoreVideoPolicyAfterSeek(speedSnapshot);
}

int32_t Player::HandleSeekFailure()
{
    playbackFailed_ = true;
    isStarted_ = false;
    paused_ = false;
    renderSingleFrameAfterSeek_ = false;
    pauseCond_.notify_all();
    audioStartPendingAfterVideoSeek_ = false;
    audioStartCond_.notify_all();
    stateMachine_.BeginStop();
    discardVideoUntilSeekTarget_ = false;
    discardAudioUntilSeekTarget_ = false;
    seekTargetUs_ = 0;
    CancelWorkerWaits();
    JoinWorkerThreads();
    {
        std::lock_guard<std::mutex> doneLock(doneMutex);
        seekInProgress_ = false;
        isAudioDone = true;
        isVideoDone = true;
    }
    doneCond_.notify_all();
    return AVCODEC_SAMPLE_ERR_ERROR;
}

int32_t Player::SeekTo(int64_t positionUs)
{
    std::unique_lock<std::mutex> lock(mutex_);
    const PlayerState currentState = stateMachine_.GetState();
    CHECK_AND_RETURN_RET_LOG(currentState == PLAYER_STATE_PLAYING || currentState == PLAYER_STATE_PAUSED,
        AVCODEC_SAMPLE_ERR_ERROR, "Seek is only allowed while playing or paused, state: %{public}d",
        static_cast<int32_t>(currentState));
    const int64_t durationUs = playbackDurationUs_.load();
    CHECK_AND_RETURN_RET_LOG(durationUs > 0, AVCODEC_SAMPLE_ERR_ERROR, "Media duration is unavailable");
    CHECK_AND_RETURN_RET_LOG(demuxer_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Demuxer is null");

    const bool hadVideo = videoDecContext_ != nullptr;
    const bool hadAudio = audioDecContext_ != nullptr;
    {
        std::lock_guard<std::mutex> doneLock(doneMutex);
        if ((hadVideo && isVideoDone.load()) || (hadAudio && isAudioDone.load())) {
            AVCODEC_SAMPLE_LOGW("Seek rejected because an active output track has completed");
            return AVCODEC_SAMPLE_ERR_ERROR;
        }
        seekInProgress_ = true;
    }

    const int64_t targetUs = std::clamp(positionUs, int64_t { 0 }, durationUs);
    const float speedSnapshot = speed.load();
    resumeAfterSeek_ = currentState == PLAYER_STATE_PLAYING;
    CHECK_AND_RETURN_RET_LOG(stateMachine_.BeginSeek(), AVCODEC_SAMPLE_ERR_ERROR, "Failed to enter seeking state");
    playbackPositionUs_.store(targetUs);
    AVCODEC_SAMPLE_LOGI("Seek started, target: %{public}" PRId64 " us", targetUs);

    StopWorkersForSeek();
    ReleaseCodecResourcesForSeek();
    int32_t ret = demuxer_->Seek(targetUs / US_PER_MILLISECOND, SEEK_MODE_PREVIOUS_SYNC);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Seek demuxer failed");
        return HandleSeekFailure();
    }
    ret = RecreateCodecResourcesAfterSeek(hadVideo, hadAudio, speedSnapshot, targetUs);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Restart playback after seek failed");
        return HandleSeekFailure();
    }
    CHECK_AND_RETURN_RET_LOG(stateMachine_.CompleteSeek(), AVCODEC_SAMPLE_ERR_ERROR,
        "Failed to restore playing state after seek");
    if (!resumeAfterSeek_) {
        stateMachine_.BeginPause();
    }
    AVCODEC_SAMPLE_LOGI("Seek completed, target: %{public}" PRId64 " us", targetUs);
    return AVCODEC_SAMPLE_ERR_OK;
}
