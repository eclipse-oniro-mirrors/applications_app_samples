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

#undef LOG_TAG
#define LOG_TAG "samplePlayer"

void Player::StartRelease()
{
    if (releaseThread_ && releaseThread_->joinable()) {
        return;
    }
    releaseThread_ = std::make_unique<std::thread>(&Player::ReleaseWorker, this);
}

void Player::ReleaseWorker()
{
    AVCODEC_SAMPLE_LOGI("Release worker started");
    std::unique_lock<std::mutex> lock(doneMutex);
    doneCond_.wait(lock, [this]() { return isAudioDone.load() && isVideoDone.load(); });
    lock.unlock();
    if (isReleased_.exchange(true)) {
        return;
    }
    Release();
}

void Player::JoinReleaseThread()
{
    if (!releaseThread_ || !releaseThread_->joinable()) {
        releaseThread_.reset();
        return;
    }
    if (releaseThread_->get_id() == std::this_thread::get_id()) {
        return;
    }
    releaseThread_->join();
    releaseThread_.reset();
}

bool Player::HasWorkerThreads() const
{
    return videoPipeline_.HasThreads() || audioPipeline_.HasThreads();
}

void Player::JoinWorkerThreads()
{
    videoPipeline_.Join();
    audioPipeline_.Join();
}

void Player::ReleaseVideoDecoder()
{
    if (videoDecoder_ != nullptr) {
        videoDecoder_->Release();
        videoDecoder_.reset();
    }
    if (videoDecContext_ != nullptr) {
        std::unique_lock<std::shared_mutex> codecLock(videoDecContext_->codecMutex);
        videoDecContext_->ClearQueue();
        codecLock.unlock();
        videoDecContext_.reset();
    }
}

void Player::ReleaseAudioDecoder()
{
    if (audioDecoder_ != nullptr) {
        audioDecoder_->Release();
        audioDecoder_.reset();
    }
    if (audioDecContext_ != nullptr) {
        std::unique_lock<std::shared_mutex> codecLock(audioDecContext_->codecMutex);
        audioDecContext_->ClearQueue();
        codecLock.unlock();
        audioDecContext_.reset();
    }
}

PlaybackCompletionReason Player::GetCompletionReason(bool &playbackSucceeded) const
{
    const bool hasDecodedOutput = hasDecodedOutput_.load() ||
        (videoDecContext_ != nullptr && videoDecContext_->outputFrameCount > 0) ||
        (audioDecContext_ != nullptr && audioDecContext_->outputFrameCount > 0);
    const bool codecFailed = (videoDecContext_ != nullptr && videoDecContext_->hasError.load()) ||
        (audioDecContext_ != nullptr && audioDecContext_->hasError.load());
    const bool stoppedByUser = stopRequested_.load();
    playbackSucceeded = stoppedByUser || (hasDecodedOutput && !playbackFailed_.load() && !codecFailed);
    if (stoppedByUser) {
        return PlaybackCompletionReason::STOPPED;
    }
    return playbackSucceeded ? PlaybackCompletionReason::COMPLETED : PlaybackCompletionReason::ERROR;
}

void Player::ReleasePlaybackResources()
{
    audioWorkerRunning_ = false;
    audioTrackSwitching_ = false;
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
#ifdef DEBUG_DECODE
    if (audioOutputFile_.is_open()) {
        audioOutputFile_.close();
    }
#endif
    if (demuxer_ != nullptr) {
        demuxer_->Release();
        demuxer_.reset();
    }
    if (videoSink_ != nullptr) {
        videoSink_->Reset();
        videoSink_.reset();
    }
    ReleaseVideoDecoder();
    ReleaseAudioDecoder();
    outputFile_ = nullptr;
    if (builder_ != nullptr) {
        OH_AudioStreamBuilder_Destroy(builder_);
        builder_ = nullptr;
    }
    doneCond_.notify_all();
}

void Player::Release()
{
    std::unique_lock<std::mutex> lock(mutex_);
    stateMachine_.BeginStop();
    bool playbackSucceeded = false;
    const PlaybackCompletionReason completionReason = GetCompletionReason(playbackSucceeded);
    isStarted_ = false;
    paused_ = false;
    renderSingleFrameAfterSeek_ = false;
    pauseCond_.notify_all();
    audioStartPendingAfterVideoSeek_ = false;
    audioStartCond_.notify_all();
    JoinWorkerThreads();
    ReleasePlaybackResources();
    auto playDoneCallback = sampleInfo_.playback.playDoneCallback;
    void *playDoneCallbackData = sampleInfo_.playback.playDoneCallbackData;
    sampleInfo_.playback.playDoneCallback = nullptr;
    sampleInfo_.playback.playDoneCallbackData = nullptr;
    smartFluencyAvailable_ = false;
    isBufferMode_ = false;
    speed.store(1.0f);
    playbackPositionUs_.store(0);
    playbackDurationUs_.store(0);
    videoOutputFrames_.store(0);
    videoRenderedFrames_.store(0);
    videoDroppedFrames_.store(0);
    audioOutputBuffers_.store(0);
    bufferPresentFrames_.store(0);
    bufferPresentFailures_.store(0);
    bufferPresentDurationNs_.store(0);
    softwareDecoderFallbackUsed_.store(false);
    hasVideoTrack_.store(false);
    hasAudioTrack_.store(false);
    hasDecodedOutput_ = false;
    seekInProgress_ = false;
    seekTargetUs_ = 0;
    discardVideoUntilSeekTarget_ = false;
    discardAudioUntilSeekTarget_ = false;
    stateMachine_.CompleteStop();
    lock.unlock();
    if (playDoneCallback != nullptr) {
        playDoneCallback(playDoneCallbackData, playbackSucceeded, completionReason);
    }
    AVCODEC_SAMPLE_LOGI("Succeed");
}
