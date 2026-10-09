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

namespace {
constexpr auto FAILURE_CHECK_INTERVAL = std::chrono::milliseconds(100);
}

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
    // 回调错误可能只停止一条流水线；有界等待可检查未发完成通知的线程失败。
    while (!playbackFailed_.load() && !(isAudioDone.load() && isVideoDone.load())) {
        doneCond_.wait_for(lock, FAILURE_CHECK_INTERVAL);
    }
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
// [Start player_release]
void Player::ReleaseVideoDecoder()
{
    OHNativeWindow *decoderWindow = decoderWindowLease_.GetWindow();
    if (videoDecoder_ != nullptr) {
        videoDecoder_->Release();
        videoDecoder_.reset();
    }
    if (sampleInfo_.video.window == decoderWindow) {
        sampleInfo_.video.window = nullptr;
    }
    // OH_VideoDecoder_Destroy() 完成后，codec 不再访问输出 Surface，才能解除窗口引用。
    decoderWindowLease_ = {};
    if (videoDecContext_ != nullptr) {
        std::unique_lock<std::shared_mutex> codecLock(videoDecContext_->codecMutex);
        videoDecContext_->ClearQueue();
        codecLock.unlock();
        videoDecContext_.reset();
    }
}
// [End player_release]

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
    // 先销毁 codec。OpenGL 的 NativeImage 和直连 XComponent Surface 仍是其输出端，
    // 必须等 codec 完全释放后才能拆除 sink。
    ReleaseVideoDecoder();
    // 每个 sink 持有当前解码器和 XComponent 的送显资源。全部释放后再创建新的 Surface 解码器。
    if (videoSink_ != nullptr) {
        videoSink_->Reset();
        videoSink_.reset();
        videoSinkRunMode_ = -1;
    }
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
    std::lock_guard<std::mutex> operationLock(audioTrackOperationMutex_);
    std::unique_lock<std::mutex> lock(mutex_);
    stateMachine_.BeginStop();
    isStarted_ = false;
    audioWorkerRunning_ = false;
    paused_ = false;
    renderSingleFrameAfterSeek_ = false;
    pauseCond_.notify_all();
    audioStartPendingAfterVideoSeek_ = false;
    audioStartCond_.notify_all();
    CancelWorkerWaits();
    JoinWorkerThreads();
    bool playbackSucceeded = false;
    const PlaybackCompletionReason completionReason = GetCompletionReason(playbackSucceeded);
    ReleasePlaybackResources();
    auto playDoneCallback = sampleInfo_.playback.playDoneCallback;
    void *playDoneCallbackData = sampleInfo_.playback.playDoneCallbackData;
    sampleInfo_.playback.playDoneCallback = nullptr;
    sampleInfo_.playback.playDoneCallbackData = nullptr;
    ResetReleasedPlaybackState();
    stateMachine_.CompleteStop();
    lock.unlock();
    if (playDoneCallback != nullptr) {
        playDoneCallback(playDoneCallbackData, playbackSucceeded, completionReason);
    }
    AVCODEC_SAMPLE_LOGI("Succeed");
}

void Player::ResetReleasedPlaybackState()
{
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
    audioInterrupted_ = false;
    audioResumePending_ = false;
    audioInterruptHint_ = AUDIOSTREAM_INTERRUPT_HINT_NONE;
    audioDucked_ = false;
    backgroundPausedPlayback_ = false;
    diagnostics_.SetBackgroundPaused(false);
    seekInProgress_ = false;
    seekTargetUs_ = 0;
    discardVideoUntilSeekTarget_ = false;
    discardAudioUntilSeekTarget_ = false;
}
