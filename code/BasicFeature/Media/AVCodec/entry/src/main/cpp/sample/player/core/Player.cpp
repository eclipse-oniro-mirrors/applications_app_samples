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

#include <algorithm>
#include <queue>

#include "av_codec_sample_log.h"
#include "dfx/error/av_codec_sample_error.h"

#undef LOG_TAG
#define LOG_TAG "samplePlayer"

namespace {
constexpr double NANOSECONDS_PER_MICROSECOND = 1000.0;
} // namespace

Player::~Player()
{
    stateMachine_.BeginStop();
    isStarted_ = false;
    if (!releaseThread_ || !releaseThread_->joinable()) {
        if (!HasWorkerThreads()) {
            std::lock_guard<std::mutex> lock(doneMutex);
            isAudioDone = true;
            isVideoDone = true;
        }
        StartRelease();
    }
    JoinReleaseThread();
}

PlayerState Player::GetState() const
{
    return stateMachine_.GetState();
}

PlaybackInfo Player::GetPlaybackInfo() const
{
    PlaybackInfo info;
    info.state = stateMachine_.GetState();
    if (info.state == PLAYER_STATE_IDLE) {
        return info;
    }
    info.speed = speed.load();
    info.durationUs = playbackDurationUs_.load();
    info.hasVideo = hasVideoTrack_.load();
    info.hasAudio = hasAudioTrack_.load();
    info.smartFluencyAvailable = smartFluencyAvailable_.load();
    info.hdrVividConfirmed = hdrVividConfirmed_.load();
    info.softwareDecoderFallbackUsed = softwareDecoderFallbackUsed_.load();
    info.isBufferMode = isBufferMode_.load();
    info.videoOutputFrames = videoOutputFrames_.load();
    info.videoRenderedFrames = videoRenderedFrames_.load();
    info.videoDroppedFrames = videoDroppedFrames_.load();
    info.audioOutputBuffers = audioOutputBuffers_.load();
    info.bufferPresentFrames = bufferPresentFrames_.load();
    info.bufferPresentFailures = bufferPresentFailures_.load();
    const uint64_t bufferPresentDurationNs = bufferPresentDurationNs_.load();
    if (info.bufferPresentFrames > 0) {
        info.bufferPresentAverageUs = static_cast<double>(bufferPresentDurationNs) /
            static_cast<double>(info.bufferPresentFrames) / NANOSECONDS_PER_MICROSECOND;
    }
    info.positionUs = playbackPositionUs_.load();
    if (info.durationUs > 0) {
        info.positionUs = std::clamp(info.positionUs, int64_t { 0 }, info.durationUs);
    }
    return info;
}

MediaInfo Player::GetMediaInfo() const
{
    std::lock_guard<std::mutex> lock(mutex_);
    MediaInfo info = mediaInfo_;
    info.hdrVividConfirmed = hdrVividConfirmed_.load();
    return info;
}

bool Player::IsSmartFluencyAvailable() const
{
    return smartFluencyAvailable_.load();
}

int32_t Player::Stop()
{
    std::lock_guard<std::mutex> lock(mutex_);
    PlayerState currentState = stateMachine_.GetState();
    if (currentState == PLAYER_STATE_STOPPING) {
        return AVCODEC_SAMPLE_ERR_OK;
    }
    CHECK_AND_RETURN_RET_LOG(currentState == PLAYER_STATE_PLAYING || currentState == PLAYER_STATE_PAUSED,
        AVCODEC_SAMPLE_ERR_ERROR, "Stop is only allowed while playing or paused, state: %{public}d",
        static_cast<int32_t>(currentState));
    CHECK_AND_RETURN_RET_LOG(!playbackFailed_.load(), AVCODEC_SAMPLE_ERR_ERROR,
        "Playback is already failing");

    stateMachine_.BeginStop();
    stopRequested_ = true;
    isStarted_ = false;
    audioWorkerRunning_ = false;
    paused_ = false;
    renderSingleFrameAfterSeek_ = false;
    pauseCond_.notify_all();
    audioStartPendingAfterVideoSeek_ = false;
    audioTrackSwitching_ = false;
    audioStartCond_.notify_all();
    if (videoDecContext_ != nullptr) {
        videoDecContext_->inputBufferQueue.CancelWait();
        videoDecContext_->outputBufferQueue.CancelWait();
    }
    if (audioDecContext_ != nullptr) {
        audioDecContext_->inputBufferQueue.CancelWait();
        audioDecContext_->outputBufferQueue.CancelWait();
        audioDecContext_->renderCond.notify_all();
    }
    doneCond_.notify_all();
    AVCODEC_SAMPLE_LOGI("Stop requested");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Player::Pause()
{
    std::lock_guard<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(stateMachine_.GetState() == PLAYER_STATE_PLAYING, AVCODEC_SAMPLE_ERR_ERROR,
        "Pause is only allowed while playing");
    CHECK_AND_RETURN_RET_LOG(!playbackFailed_.load(), AVCODEC_SAMPLE_ERR_ERROR, "Playback is already failing");
    if (audioRenderer_ != nullptr) {
        std::lock_guard<std::mutex> rendererLock(audioRendererMutex_);
        const int32_t ret = OH_AudioRenderer_Pause(audioRenderer_);
        CHECK_AND_RETURN_RET_LOG(ret == AUDIOSTREAM_SUCCESS, AVCODEC_SAMPLE_ERR_ERROR,
            "Pause audio renderer failed: %{public}d", ret);
    }
    CHECK_AND_RETURN_RET_LOG(stateMachine_.BeginPause(), AVCODEC_SAMPLE_ERR_ERROR,
        "Failed to enter paused state");
    paused_ = true;
    AVCODEC_SAMPLE_LOGI("Playback paused");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Player::Resume()
{
    std::lock_guard<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(stateMachine_.GetState() == PLAYER_STATE_PAUSED, AVCODEC_SAMPLE_ERR_ERROR,
        "Resume is only allowed while paused");
    {
        std::lock_guard<std::mutex> rendererLock(audioRendererMutex_);
        if (audioRenderer_ != nullptr) {
            const int32_t ret = OH_AudioRenderer_Start(audioRenderer_);
            CHECK_AND_RETURN_RET_LOG(ret == AUDIOSTREAM_SUCCESS, AVCODEC_SAMPLE_ERR_ERROR,
                "Resume audio renderer failed: %{public}d", ret);
        }
    }
    CHECK_AND_RETURN_RET_LOG(stateMachine_.BeginResume(), AVCODEC_SAMPLE_ERR_ERROR,
        "Failed to leave paused state");
    paused_ = false;
    renderSingleFrameAfterSeek_ = false;
    pauseCond_.notify_all();
    AVCODEC_SAMPLE_LOGI("Playback resumed");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Player::SelectAudioTrack(int32_t trackIndex)
{
    std::unique_lock<std::mutex> lock(mutex_);
    const PlayerState currentState = stateMachine_.GetState();
    CHECK_AND_RETURN_RET_LOG(currentState == PLAYER_STATE_PLAYING || currentState == PLAYER_STATE_PAUSED,
        AVCODEC_SAMPLE_ERR_ERROR, "Audio track selection is only allowed while playing or paused");
    CHECK_AND_RETURN_RET_LOG(demuxer_ != nullptr && audioDecContext_ != nullptr && audioDecoder_ != nullptr,
        AVCODEC_SAMPLE_ERR_ERROR, "Audio playback is not initialized");
    CHECK_AND_RETURN_RET_LOG(trackIndex >= 0, AVCODEC_SAMPLE_ERR_ERROR,
        "Invalid audio track index: %{public}d", trackIndex);
    if (trackIndex == sampleInfo_.audio.trackIndex) {
        return AVCODEC_SAMPLE_ERR_OK;
    }

    AudioSampleInfo candidateAudioInfo;
    if (demuxer_->GetAudioTrackInfo(trackIndex, candidateAudioInfo) != AVCODEC_SAMPLE_ERR_OK ||
        !CanConfigureAudioTrack(candidateAudioInfo)) {
        AVCODEC_SAMPLE_LOGW("Audio track is not supported, keep current track: %{public}d", trackIndex);
        return AVCODEC_SAMPLE_ERR_ERROR;
    }

    const SampleInfo oldSampleInfo = sampleInfo_;
    const int32_t oldTrackIndex = sampleInfo_.audio.trackIndex;
    const float speedSnapshot = speed.load();
    const bool resumeRenderer = currentState == PLAYER_STATE_PLAYING;
    PrepareAudioTrackSwitch();
    lock.unlock();
    audioPipeline_.Join();
    lock.lock();
    ReleaseAudioTrackResources();
    int32_t ret = demuxer_->SelectAudioTrack(trackIndex, sampleInfo_);
    if (ret == AVCODEC_SAMPLE_ERR_OK) {
        sampleInfo_.codec.audioTrackIndex = trackIndex;
        ret = StartSelectedAudioTrack(resumeRenderer, speedSnapshot);
    }
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        return RestorePreviousAudioTrackAfterFailedSwitch(lock, oldSampleInfo, oldTrackIndex,
            resumeRenderer, speedSnapshot);
    }
    UpdateMediaInfoSnapshot();
    AVCODEC_SAMPLE_LOGI("Audio track switched without restarting video, track: %{public}d", trackIndex);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Player::RestorePreviousAudioTrackAfterFailedSwitch(std::unique_lock<std::mutex>& lock,
    const SampleInfo& oldSampleInfo, int32_t oldTrackIndex, bool resumeRenderer, float speedSnapshot)
{
    AVCODEC_SAMPLE_LOGE("Switch audio track failed, restoring track: %{public}d", oldTrackIndex);
    PrepareAudioTrackSwitch();
    lock.unlock();
    audioPipeline_.Join();
    lock.lock();
    ReleaseAudioTrackResources();
    sampleInfo_ = oldSampleInfo;
    const int32_t restoreRet = RestoreAudioTrack(oldTrackIndex, resumeRenderer, speedSnapshot);
    if (restoreRet != AVCODEC_SAMPLE_ERR_OK) {
        CleanupAudioTrackFailure(lock);
        isStarted_ = false;
        AVCODEC_SAMPLE_LOGE("Restore previous audio track failed, ret: %{public}d", restoreRet);
    }
    UpdateMediaInfoSnapshot();
    return AVCODEC_SAMPLE_ERR_ERROR;
}

void Player::PrepareAudioTrackSwitch()
{
    audioTrackSwitching_ = true;
    audioWorkerRunning_ = false;
    pauseCond_.notify_all();
    if (audioDecContext_ != nullptr) {
        audioDecContext_->isDestroyed = true;
        audioDecContext_->inputBufferQueue.CancelWait();
        audioDecContext_->outputBufferQueue.CancelWait();
        audioDecContext_->renderCond.notify_all();
    }
    std::lock_guard<std::mutex> rendererLock(audioRendererMutex_);
    if (audioRenderer_ != nullptr && OH_AudioRenderer_Pause(audioRenderer_) != AUDIOSTREAM_SUCCESS) {
        AVCODEC_SAMPLE_LOGW("Pause audio renderer before track switch failed");
    }
}

void Player::CleanupAudioTrackFailure(std::unique_lock<std::mutex>& lock)
{
    PrepareAudioTrackSwitch();
    lock.unlock();
    audioPipeline_.Join();
    lock.lock();
    ReleaseAudioTrackResources();
    audioTrackSwitching_ = false;
    audioWorkerRunning_ = false;
}

void Player::ReleaseAudioTrackResources()
{
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
    if (audioDecoder_ != nullptr) {
        audioDecoder_->Release();
        audioDecoder_.reset();
    }
    if (audioDecContext_ == nullptr) {
        return;
    }
    std::unique_lock<std::shared_mutex> codecLock(audioDecContext_->codecMutex);
    audioDecContext_->ClearQueue();
    audioDecContext_->inputBufferQueue.Reset();
    audioDecContext_->outputBufferQueue.Reset();
    {
        std::lock_guard<std::mutex> outputLock(audioDecContext_->outputMutex);
        std::queue<unsigned char> emptyQueue;
        audioDecContext_->renderQueue.swap(emptyQueue);
    }
    audioDecContext_->isDestroyed = false;
    audioDecContext_->audioFramesWritten = 0;
    audioDecContext_->currentPosAudioBufferPts = playbackPositionUs_.load();
    audioDecContext_->endPosAudioBufferPts = playbackPositionUs_.load();
}

int32_t Player::StartSelectedAudioTrack(bool resumeRenderer, float speedSnapshot)
{
    audioDecoder_ = std::make_shared<AudioDecoder>();
    int32_t ret = CreateAudioDecoder();
    if (ret != AVCODEC_SAMPLE_ERR_OK || audioDecContext_ == nullptr) {
        return ret;
    }
    {
        std::lock_guard<std::mutex> doneLock(doneMutex);
        isAudioDone = false;
    }
    audioWorkerRunning_ = true;
    ret = StartAudioDecoder();
    if (ret != AVCODEC_SAMPLE_ERR_OK || !resumeRenderer) {
        if (ret == AVCODEC_SAMPLE_ERR_OK) {
            seekTargetUs_ = 0;
            discardAudioUntilSeekTarget_ = false;
        }
        return ret;
    }
    std::lock_guard<std::mutex> rendererLock(audioRendererMutex_);
    if (audioRenderer_ == nullptr || OH_AudioRenderer_Start(audioRenderer_) != AUDIOSTREAM_SUCCESS) {
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    if (speedSnapshot != 1.0f && OH_AudioRenderer_SetSpeed(audioRenderer_, speedSnapshot) != AUDIOSTREAM_SUCCESS) {
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    seekTargetUs_ = 0;
    discardAudioUntilSeekTarget_ = false;
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Player::RestoreAudioTrack(int32_t oldTrackIndex, bool resumeRenderer, float speedSnapshot)
{
    sampleInfo_.codec.audioTrackIndex = oldTrackIndex;
    if (demuxer_->SelectAudioTrack(oldTrackIndex, sampleInfo_) != AVCODEC_SAMPLE_ERR_OK) {
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    const int32_t ret = StartSelectedAudioTrack(resumeRenderer, speedSnapshot);
    if (ret == AVCODEC_SAMPLE_ERR_OK) {
        seekTargetUs_ = 0;
        discardAudioUntilSeekTarget_ = false;
        audioTrackSwitching_ = false;
        audioWorkerRunning_ = true;
    }
    return ret;
}

void Player::SetSpeed(float multiplier)
{
    const PlayerState currentState = stateMachine_.GetState();
    CHECK_AND_RETURN_LOG(currentState == PLAYER_STATE_PLAYING || currentState == PLAYER_STATE_PAUSED,
        "Set speed is only allowed while playing or paused");
    CHECK_AND_RETURN_LOG(multiplier > 0.0f, "Playback speed must be positive");
    if (speed.load() == multiplier) {
        AVCODEC_SAMPLE_LOGW("Same speed value");
        return;
    }
    {
        std::lock_guard<std::mutex> rendererLock(audioRendererMutex_);
        if (audioRenderer_ != nullptr) {
            int32_t ret = OH_AudioRenderer_SetSpeed(audioRenderer_, multiplier);
            CHECK_AND_RETURN_LOG(ret == AUDIOSTREAM_SUCCESS, "Set audio renderer speed failed: %{public}d", ret);
        }
    }
    speed.store(multiplier);
    if (smartFluencyAvailable_.load() && videoDecoder_ != nullptr) {
        videoDecoder_->OnUserSpeedChanged(multiplier);
    }
}

void Player::SetSmartFluencySupported(bool supported)
{
    isSmartFluencySupported_ = supported;
    AVCODEC_SAMPLE_LOGI("SetSmartFluencySupported: %{public}d", supported);
}

void Player::OnThermalWarningReceived(double ratio)
{
    if (!smartFluencyAvailable_.load() || videoDecoder_ == nullptr) {
        AVCODEC_SAMPLE_LOGW("Smart frame retention is disabled for this playback, skip thermal warning");
        return;
    }
    thermalWarningActive_ = true;
    thermalFrameRetentionRatio_ = ratio;
    AVCODEC_SAMPLE_LOGI("Thermal warning received, switching to UNIFORM mode with ratio=%.2f", ratio);
    videoDecoder_->OnThermalWarningReceived(ratio);
}

void Player::OnThermalLevelRecovered()
{
    if (!thermalWarningActive_) {
        return;
    }
    thermalWarningActive_ = false;
    AVCODEC_SAMPLE_LOGI("Thermal level recovered, restoring speed-based mode");
    if (smartFluencyAvailable_.load() && videoDecoder_ != nullptr) {
        videoDecoder_->OnUserSpeedChanged(speed.load());
    }
}

void Player::SetTransform(int32_t hint)
{
    const PlayerState currentState = stateMachine_.GetState();
    CHECK_AND_RETURN_LOG(currentState == PLAYER_STATE_PLAYING || currentState == PLAYER_STATE_PAUSED,
        "Set transform is only allowed while playing or paused");
    if (transformHint == hint) {
        AVCODEC_SAMPLE_LOGW("Same transform hint value");
        return;
    }
    transformHint = hint;
    OHNativeWindow *window = sampleInfo_.video.window != nullptr ? sampleInfo_.video.window :
        NativeXComponentSample::PluginManager::GetInstance()->GetPluginWindow();
    CHECK_AND_RETURN_LOG(window != nullptr, "Native window is null");
    OH_NativeWindow_NativeWindowHandleOpt(window, SET_TRANSFORM, transformHint);
}
