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
#include "AudioOutputPump.h"
#include "HdrMetadataHelper.h"
#include "av_codec_sample_log.h"
#include "dfx/error/av_codec_sample_error.h"
#include <algorithm>
#include <bits/alltypes.h>
#include <netinet/tcp.h>
#include <queue>

#undef LOG_TAG
#define LOG_TAG "samplePlayer"

namespace {
constexpr int BALANCE_VALUE = 5;
using namespace std::string_literals;
using namespace std::chrono_literals;
constexpr int32_t BYTES_PER_SAMPLE_2 = 2;                          // 2 bytes per sample
constexpr int8_t YUV420_SAMPLE_RATIO = 2;
constexpr int32_t TRIPLE_SPEED_MULTIPLIER = 3;
constexpr int32_t DOUBLE_SPEED_MULTIPLIER = 2;
constexpr int64_t US_PER_SECOND = 1000000;
constexpr int64_t US_PER_MILLISECOND = 1000;
constexpr int64_t NS_PER_US = 1000;
constexpr int64_t CODEC_BUFFER_TIMEOUT_US = 100000;

std::string ToString(OH_AVPixelFormat pixelFormat)
{
    std::string ret;
    auto iter = PIXEL_FORMAT_TO_STRING.find(pixelFormat);
    if (iter != PIXEL_FORMAT_TO_STRING.end()) {
        ret = PIXEL_FORMAT_TO_STRING.at(pixelFormat);
    }
    return ret;
}

uint8_t *GetBufferDataAddr(CodecBufferInfo &bufferInfo)
{
    uint8_t *bufferAddr = OH_AVBuffer_GetAddr(bufferInfo.buffer);
    if (bufferAddr == nullptr) {
        return nullptr;
    }
    if (bufferInfo.attr.offset < 0) {
        AVCODEC_SAMPLE_LOGE("Invalid buffer offset: %{public}d", bufferInfo.attr.offset);
        return nullptr;
    }
    return bufferAddr + bufferInfo.attr.offset;
}
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
    paused_ = false;
    pauseCond_.notify_all();
    audioStartPendingAfterVideoSeek_ = false;
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
    if (audioRenderer_ != nullptr) {
        const int32_t ret = OH_AudioRenderer_Start(audioRenderer_);
        CHECK_AND_RETURN_RET_LOG(ret == AUDIOSTREAM_SUCCESS, AVCODEC_SAMPLE_ERR_ERROR,
            "Resume audio renderer failed: %{public}d", ret);
    }
    CHECK_AND_RETURN_RET_LOG(stateMachine_.BeginResume(), AVCODEC_SAMPLE_ERR_ERROR,
        "Failed to leave paused state");
    paused_ = false;
    pauseCond_.notify_all();
    AVCODEC_SAMPLE_LOGI("Playback resumed");
    return AVCODEC_SAMPLE_ERR_OK;
}

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

void Player::WaitIfPaused()
{
    std::unique_lock<std::mutex> lock(pauseMutex_);
    pauseCond_.wait(lock, [this]() { return !paused_.load() || !isStarted_.load(); });
}

void Player::StartAudioAfterVideoSeek()
{
    if (!audioStartPendingAfterVideoSeek_.exchange(false)) {
        return;
    }
    audioStartCond_.notify_all();
    if (audioRenderer_ == nullptr || !isStarted_.load() || paused_.load()) {
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
    if (audioRenderer_ != nullptr) {
        OH_AudioRenderer_Release(audioRenderer_);
        audioRenderer_ = nullptr;
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
        return true;
    }
    const int64_t targetUs = seekTargetUs_.load();
    if (bufferInfo.attr.pts >= targetUs) {
        discardAudioUntilSeekTarget_ = false;
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
    audioStartPendingAfterVideoSeek_ = hadVideo && hadAudio && resumeAfterSeek_;
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

int32_t Player::CreateAudioDecoder()
{
    AVCODEC_SAMPLE_LOGW("audio mime:%{public}s", sampleInfo_.audio.audioCodecMime.c_str());
    int32_t ret = audioDecoder_->Create(sampleInfo_.audio.audioCodecMime);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        isAudioDone.store(true);
        AVCODEC_SAMPLE_LOGE("Create audio decoder failed, mime:%{public}s",
            sampleInfo_.audio.audioCodecMime.c_str());
    } else {
        audioDecContext_ = std::make_unique<CodecUserData>();
        audioDecContext_->runningFlag = &isStarted_;
        audioDecContext_->playbackPositionUs = &playbackPositionUs_;
        audioDecContext_->sampleInfo = &sampleInfo_;
        ret = audioDecoder_->Config(sampleInfo_, audioDecContext_.get());
        CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Audio Decoder config failed");
        OH_AudioStreamBuilder_Create(&builder_, AUDIOSTREAM_TYPE_RENDERER);
        const auto latencyMode = sampleInfo_.audioPlayback.enableLowLatency ?
            AUDIOSTREAM_LATENCY_MODE_FAST : AUDIOSTREAM_LATENCY_MODE_NORMAL;
        int32_t latencyRet = OH_AudioStreamBuilder_SetLatencyMode(builder_, latencyMode);
        if (latencyRet != AUDIOSTREAM_SUCCESS) {
            AVCODEC_SAMPLE_LOGW("Set audio latency mode failed, mode: %{public}d, ret: %{public}d",
                static_cast<int32_t>(latencyMode), latencyRet);
        }
         // Set the audio sampling rate.
        OH_AudioStreamBuilder_SetSamplingRate(builder_, sampleInfo_.audio.audioSampleRate);
        // 设置音频声道
        OH_AudioStreamBuilder_SetChannelCount(builder_, sampleInfo_.audio.audioChannelCount);
        // 设置音频采样格式
        OH_AudioStreamBuilder_SetSampleFormat(builder_, AUDIOSTREAM_SAMPLE_S16LE);
        // 设置音频流的编码类型
        OH_AudioStreamBuilder_SetEncodingType(builder_, AUDIOSTREAM_ENCODING_TYPE_RAW);
        // 设置输出音频流的工作场景
        OH_AudioStreamBuilder_SetRendererInfo(builder_, AUDIOSTREAM_USAGE_MOVIE);
        AVCODEC_SAMPLE_LOGW("Init audioSampleRate: %{public}d, ChannelCount: %{public}d",
            sampleInfo_.audio.audioSampleRate, sampleInfo_.audio.audioChannelCount);
        OH_AudioRenderer_Callbacks callbacks;
        // 配置回调函数
#ifndef DEBUG_DECODE
        callbacks.OH_AudioRenderer_OnWriteData = SampleCallback::OnRenderWriteData;
#else
        callbacks.OH_AudioRenderer_OnWriteData = nullptr;
#endif
        callbacks.OH_AudioRenderer_OnStreamEvent = SampleCallback::OnRenderStreamEvent;
        callbacks.OH_AudioRenderer_OnInterruptEvent = SampleCallback::OnRenderInterruptEvent;
        callbacks.OH_AudioRenderer_OnError = SampleCallback::OnRenderError;
        // 设置输出音频流的回调
        OH_AudioStreamBuilder_SetRendererCallback(builder_, callbacks, audioDecContext_.get());
        OH_AudioStreamBuilder_GenerateRenderer(builder_, &audioRenderer_);
        if (audioRenderer_ != nullptr) {
            const int32_t volumeRet = OH_AudioRenderer_SetVolume(audioRenderer_, sampleInfo_.audioPlayback.volume);
            if (volumeRet != AUDIOSTREAM_SUCCESS) {
                AVCODEC_SAMPLE_LOGW("Set initial audio volume failed, ret: %{public}d", volumeRet);
            }
        }
    }
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Player::CreateVideoDecoder()
{
    AVCODEC_SAMPLE_LOGW("video mime:%{public}s", sampleInfo_.video.videoCodecMime.c_str());
    int32_t ret = videoDecoder_->Create(sampleInfo_.video.videoCodecMime, sampleInfo_.codec.codecType);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        isVideoDone.store(true);
        AVCODEC_SAMPLE_LOGW("Create video decoder failed, mime:%{public}s",
            sampleInfo_.video.videoCodecMime.c_str());
    } else {
        videoDecContext_ = std::make_unique<CodecUserData>();
        videoDecContext_->runningFlag = &isStarted_;
        videoDecContext_->sampleInfo = &sampleInfo_;
        videoDecContext_->isDecFirstFrame = true;
        if (sampleInfo_.codec.codecRunMode == SURFACE) {
            sampleInfo_.video.window = NativeXComponentSample::PluginManager::GetInstance()->GetPluginWindow();
        } else {
            sampleInfo_.video.window = nullptr;
        }
        ret = videoDecoder_->Config(sampleInfo_, videoDecContext_.get());
        CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Video Decoder config failed");
    }
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Player::HandleInitError(std::unique_lock<std::mutex>& outerLock)
{
    playbackFailed_ = true;
    stateMachine_.BeginStop();
    {
        std::unique_lock<std::mutex> doneLock(doneMutex);
        isAudioDone = true;
        isVideoDone = true;
        isReleased_ = false;
    }
    doneCond_.notify_all();
    if (outerLock.owns_lock()) {
        outerLock.unlock();
    }
    StartRelease();
    return AVCODEC_SAMPLE_ERR_ERROR;
}

void Player::PrepareForInitialization(const SampleInfo &sampleInfo)
{
    sampleInfo_ = sampleInfo;
    mediaInfo_ = {};
    playbackFailed_ = false;
    hasDecodedOutput_ = false;
    stopRequested_ = false;
    paused_ = false;
    resumeAfterSeek_ = true;
    audioStartPendingAfterVideoSeek_ = false;
    audioStartCond_.notify_all();
    seekInProgress_ = false;
    seekTargetUs_ = 0;
    discardVideoUntilSeekTarget_ = false;
    discardAudioUntilSeekTarget_ = false;
    speed.store(1.0f);
    playbackPositionUs_.store(0);
    playbackDurationUs_.store(0);
    hasVideoTrack_.store(false);
    hasAudioTrack_.store(false);
    hdrVividConfirmed_.store(false);
    isSmartFluencySupported_ = sampleInfo.codec.isSmartFluencySupported;
    thermalWarningActive_ = false;
    thermalFrameRetentionRatio_ = 0.0;
    videoDecoder_ = std::make_unique<VideoDecoder>();
    audioDecoder_ = std::make_unique<AudioDecoder>();
    demuxer_ = std::make_unique<Demuxer>();
}

void Player::UpdateSmartFluencyAvailability()
{
#ifdef AVCODEC_SAMPLE_ENABLE_SMART_FLUENCY
    smartFluencyAvailable_ = isSmartFluencySupported_ && videoDecContext_ != nullptr;
#else
    smartFluencyAvailable_ = false;
#endif
    AVCODEC_SAMPLE_LOGI("Smart fluency available for this playback: %{public}d", smartFluencyAvailable_.load());
}

void Player::UpdateMediaInfoSnapshot()
{
    mediaInfo_.available = true;
    mediaInfo_.fileSize = sampleInfo_.source.inputFileSize;
    mediaInfo_.durationUs = sampleInfo_.source.durationUs;
    mediaInfo_.trackCount = sampleInfo_.source.trackCount;
    mediaInfo_.videoCodecMime = sampleInfo_.video.videoCodecMime;
    mediaInfo_.videoWidth = sampleInfo_.video.videoWidth;
    mediaInfo_.videoHeight = sampleInfo_.video.videoHeight;
    mediaInfo_.frameRate = sampleInfo_.video.frameRate;
    mediaInfo_.videoBitrate = sampleInfo_.video.bitrate;
    mediaInfo_.codecProfile = sampleInfo_.video.hevcProfile;
    mediaInfo_.rotation = sampleInfo_.video.rotation;
    mediaInfo_.hdrVividContainerSignaled = sampleInfo_.video.hdrVividContainerSignaled;
    mediaInfo_.audioCodecMime = sampleInfo_.audio.audioCodecMime;
    mediaInfo_.audioSampleFormat = sampleInfo_.audio.audioSampleFormat;
    mediaInfo_.audioSampleRate = sampleInfo_.audio.audioSampleRate;
    mediaInfo_.audioChannelCount = sampleInfo_.audio.audioChannelCount;
    mediaInfo_.audioChannelLayout = sampleInfo_.audio.audioChannelLayout;
    mediaInfo_.audioBitrate = sampleInfo_.audio.audioBitRate;
    mediaInfo_.aacAdts = sampleInfo_.audio.aacAdts;
    mediaInfo_.codecConfigLength = static_cast<int64_t>(sampleInfo_.audio.codecConfigLen);
    mediaInfo_.decoderType = sampleInfo_.codec.codecType;
    mediaInfo_.decoderRunMode = sampleInfo_.codec.codecRunMode;
    mediaInfo_.decoderSyncMode = sampleInfo_.codec.codecSyncMode;
    mediaInfo_.videoDumpEnabled = sampleInfo_.output.enableVideoDump;
    mediaInfo_.sourceFormatDump = sampleInfo_.source.sourceFormatDump;
    mediaInfo_.trackFormats = sampleInfo_.source.trackFormats;
}

int32_t Player::Init(SampleInfo &sampleInfo)
{
    JoinReleaseThread();
    const PlayerState previousState = stateMachine_.GetState();
    CHECK_AND_RETURN_RET_LOG(stateMachine_.BeginInitialization(),
        AVCODEC_SAMPLE_ERR_ERROR, "Init is not allowed in state: %{public}d", static_cast<int32_t>(previousState));
    std::unique_lock<std::mutex> lock(mutex_);
    if (demuxer_ != nullptr || videoDecoder_ != nullptr || audioDecoder_ != nullptr) {
        stateMachine_.AbortInitialization();
        AVCODEC_SAMPLE_LOGE("Player resources were not released before Init");
        return AVCODEC_SAMPLE_ERR_ERROR;
    }

    PrepareForInitialization(sampleInfo);
    AVCODEC_SAMPLE_LOGI("Smart fluency supported: %{public}d", isSmartFluencySupported_);

    int32_t ret = demuxer_->Create(sampleInfo_);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Create demuxer failed");
        return HandleInitError(lock);
    }

    ret = CreateAudioDecoder();
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Create audio decoder failed");
        return HandleInitError(lock);
    }

    ret = CreateVideoDecoder();
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Create video decoder failed");
        return HandleInitError(lock);
    }

    UpdateSmartFluencyAvailability();

    if (audioDecContext_ == nullptr && videoDecContext_ == nullptr) {
        AVCODEC_SAMPLE_LOGE("No supported audio or video track found");
        return HandleInitError(lock);
    }

    playbackDurationUs_.store(sampleInfo_.source.durationUs);
    hasVideoTrack_.store(videoDecContext_ != nullptr);
    hasAudioTrack_.store(audioDecContext_ != nullptr);
    UpdateMediaInfoSnapshot();
    isReleased_ = false;
    CHECK_AND_RETURN_RET_LOG(stateMachine_.MarkReady(), AVCODEC_SAMPLE_ERR_ERROR,
        "Failed to enter ready state");
    AVCODEC_SAMPLE_LOGI("Succeed");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Player::StartVideoDecoder()
{
    CHECK_AND_RETURN_RET_LOG(!videoPipeline_.HasThreads(),
                             AVCODEC_SAMPLE_ERR_ERROR, "Video threads already running");

    int32_t ret = videoDecoder_->Start();
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Video Decoder start failed");
        return ret;
    }

    PipelineWorkers::StartConfig startConfig;
    startConfig.syncMode = sampleInfo_.codec.codecSyncMode;
    startConfig.inputSync = [this]() {
        VideoDecInputSyncThread();
    };
    startConfig.outputSync = [this]() {
        VideoDecOutputSyncThread();
    };
    startConfig.inputAsync = [this]() {
        VideoDecInputAsyncThread();
    };
    startConfig.outputAsync = [this]() {
        VideoDecOutputAsyncThread();
    };
    startConfig.stopOnFailure = [this]() {
        isStarted_ = false;
        CancelWorkerWaits();
    };
    bool started = videoPipeline_.Start(std::move(startConfig));
    if (!started) {
        AVCODEC_SAMPLE_LOGE("Create video threads failed");
        return AVCODEC_SAMPLE_ERR_ERROR;
    }

    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Player::StartAudioDecoder()
{
    CHECK_AND_RETURN_RET_LOG(!audioPipeline_.HasThreads(),
                             AVCODEC_SAMPLE_ERR_ERROR, "Audio threads already running");

    {
        std::lock_guard<std::mutex> lock(audioDecContext_->outputMutex);
        std::queue<unsigned char> emptyQueue;
        audioDecContext_->renderQueue.swap(emptyQueue);
    }

    int32_t ret = audioDecoder_->Start();
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Audio Decoder start failed");
        return ret;
    }

    PipelineWorkers::StartConfig startConfig;
    startConfig.syncMode = sampleInfo_.codec.codecSyncMode;
    startConfig.inputSync = [this]() {
        AudioDecInputSyncThread();
    };
    startConfig.outputSync = [this]() {
        AudioDecOutputSyncThread();
    };
    startConfig.inputAsync = [this]() {
        AudioDecInputThread();
    };
    startConfig.outputAsync = [this]() {
        AudioDecOutputThread();
    };
    startConfig.stopOnFailure = [this]() {
        isStarted_ = false;
        CancelWorkerWaits();
    };
    bool started = audioPipeline_.Start(std::move(startConfig));
    if (!started) {
        AVCODEC_SAMPLE_LOGE("Create audio threads failed");
        return AVCODEC_SAMPLE_ERR_ERROR;
    }

#ifdef DEBUG_DECODE
    audioOutputFile_.open("/data/storage/el2/base/haps/entry/files/audio_decode_out.pcm",
                          std::ios::out | std::ios::binary);
#endif

    return AVCODEC_SAMPLE_ERR_OK;
}

void Player::CleanupAfterStartFailure(bool videoStarted)
{
    playbackFailed_ = true;
    stateMachine_.BeginStop();
    isStarted_ = false;
    {
        std::lock_guard<std::mutex> lock(doneMutex);
        if (!videoStarted) {
            isVideoDone = true;
        }
        isAudioDone = true;
        isReleased_ = false;
    }
    doneCond_.notify_all();
    StartRelease();
}

int32_t Player::Start()
{
    std::unique_lock<std::mutex> lock(mutex_);
    const PlayerState currentState = stateMachine_.GetState();
    CHECK_AND_RETURN_RET_LOG(currentState == PLAYER_STATE_READY, AVCODEC_SAMPLE_ERR_ERROR,
        "Start is not allowed in state: %{public}d", static_cast<int32_t>(currentState));
    CHECK_AND_RETURN_RET_LOG(demuxer_, AVCODEC_SAMPLE_ERR_ERROR, "Demuxer not initialized");
    
    {
        std::lock_guard<std::mutex> doneLock(doneMutex);
        isAudioDone = (audioDecContext_ == nullptr);
        isVideoDone = (videoDecContext_ == nullptr);
    }
    isStarted_ = true;
    int32_t ret = AVCODEC_SAMPLE_ERR_OK;
    bool videoStarted = false;
    
    ret = demuxer_->Seek(0);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Seek failed");
        lock.unlock();
        CleanupAfterStartFailure(videoStarted);
        return ret;
    }
    
    if (videoDecContext_) {
        ret = StartVideoDecoder();
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            lock.unlock();
            CleanupAfterStartFailure(videoStarted);
            return ret;
        }
        videoStarted = true;
    }
    
    if (audioDecContext_) {
        ret = StartAudioDecoder();
        if (ret == AVCODEC_SAMPLE_ERR_OK && audioRenderer_) {
            OH_AudioRenderer_Start(audioRenderer_);
        }
        
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            lock.unlock();
            CleanupAfterStartFailure(videoStarted);
            return ret;
        }
    }
    
    CHECK_AND_RETURN_RET_LOG(stateMachine_.BeginPlayback(), AVCODEC_SAMPLE_ERR_ERROR,
        "Failed to enter playing state");
    AVCODEC_SAMPLE_LOGI("Player started successfully");
    StartRelease();
    return AVCODEC_SAMPLE_ERR_OK;
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
    if (audioRenderer_) {
        int32_t ret = OH_AudioRenderer_SetSpeed(audioRenderer_, multiplier);
        CHECK_AND_RETURN_LOG(ret == AUDIOSTREAM_SUCCESS, "Set audio renderer speed failed: %{public}d", ret);
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
     // Restore the frame retention mode for the current playback speed.
    if (smartFluencyAvailable_.load() && videoDecoder_ != nullptr) {
        videoDecoder_->OnUserSpeedChanged(speed.load());
    }
}

void Player::SetTransform(int32_t hint)
{
    const PlayerState currentState = stateMachine_.GetState();
    CHECK_AND_RETURN_LOG(currentState == PLAYER_STATE_PLAYING || currentState == PLAYER_STATE_PAUSED,
        "Set transform is only allowed while playing or paused");
    if (this->transformHint == hint) {
        AVCODEC_SAMPLE_LOGW("Same transform hint value");
        return;
    }
    this->transformHint = hint;
    int32_t operationCode = SET_TRANSFORM;
    OHNativeWindow *window = sampleInfo_.video.window != nullptr ? sampleInfo_.video.window :
        NativeXComponentSample::PluginManager::GetInstance()->GetPluginWindow();
    CHECK_AND_RETURN_LOG(window != nullptr, "Native window is null");
    OH_NativeWindow_NativeWindowHandleOpt(window, operationCode, this->transformHint);
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
    if (videoDecContext_ != nullptr) {
        videoDecContext_->isDestroyed = true;
    }
    if (audioDecContext_ != nullptr) {
        audioDecContext_->isDestroyed = true;
    }
    if (audioRenderer_ != nullptr) {
        OH_AudioRenderer_Release(audioRenderer_);
        audioRenderer_ = nullptr;
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
    speed.store(1.0f);
    playbackPositionUs_.store(0);
    playbackDurationUs_.store(0);
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

void Player::DumpOutput(CodecBufferInfo &bufferInfo)
{
    auto &info = sampleInfo_;
    if (info.codec.codecRunMode != BUFFER || !info.output.enableVideoDump) {
        return;
    }
    if (outputFile_ == nullptr) {
        auto time = std::chrono::system_clock::to_time_t(std::chrono::system_clock::now());
        // dump file /data/app/el2/100/base/com.samples.avcodecsample/haps/entry/files
        if (info.output.outputFilePath.empty()) {
            info.output.outputFilePath = "/data/storage/el2/base/haps/entry/files/VideoDecoderOut_"s +
                                  ToString(info.video.pixelFormat) + "_" + std::to_string(info.video.videoWidth) + "_" +
                                  std::to_string(info.video.videoHeight) + "_" + std::to_string(time) + ".yuv";
        }

        outputFile_ = std::make_unique<std::ofstream>(info.output.outputFilePath, std::ios::out | std::ios::trunc);
        if (!outputFile_->is_open()) {
            outputFile_ = nullptr;
            AVCODEC_SAMPLE_LOGE("Output file open failed");
            return;
        }
    }

    uint8_t *bufferAddr = GetBufferDataAddr(bufferInfo);
    CHECK_AND_RETURN_LOG(bufferAddr != nullptr, "Buffer is nullptr");
    switch (info.video.pixelFormat) {
        case AV_PIXEL_FORMAT_YUVI420:
            WriteOutputFileWithStrideYUV420P(bufferAddr);
            break;
        case AV_PIXEL_FORMAT_NV12:
            [[fallthrough]];
        case AV_PIXEL_FORMAT_NV21:
            // NV12/NV21 都是 YUV420 Semi-Planar，UV 顺序不同但写入逻辑相同
            WriteOutputFileWithStrideYUV420SP(bufferAddr);
            break;
        case AV_PIXEL_FORMAT_RGBA1010102:
            [[fallthrough]];
        case AV_PIXEL_FORMAT_RGBA:
            // RGBA1010102: R10+G10+B10+A2 = 32bit = 4 字节/像素
            // RGBA:        R8+G8+B8+A8   = 32bit = 4 字节/像素
             // Both formats use four bytes per pixel and can be written directly.
            WriteOutputFileWithStrideRGBA(bufferAddr);
            break;
        default:
            AVCODEC_SAMPLE_LOGE("Unsupported pixel format, skip");
            break;
    }
}

bool Player::PresentAndReleaseVideoBuffer(CodecBufferInfo& bufferInfo, bool render, int64_t renderTimestamp)
{
    if (sampleInfo_.codec.codecRunMode == BUFFER && !hdrVividConfirmed_.load() &&
        HdrMetadataHelper::IsHdrVivid(bufferInfo.buffer)) {
        hdrVividConfirmed_.store(true);
        AVCODEC_SAMPLE_LOGI("HDR Vivid confirmed from decoded bitstream metadata");
    }
    DumpOutput(bufferInfo);

    CHECK_AND_RETURN_RET_LOG(videoDecContext_ != nullptr, false, "Video decode context is null");
    if (videoSink_ == nullptr) {
        videoSink_ = sampleInfo_.codec.codecRunMode == BUFFER ?
            std::unique_ptr<VideoSink>(std::make_unique<BufferVideoSink>()) :
            std::unique_ptr<VideoSink>(std::make_unique<SurfaceVideoSink>());
    }
    VideoPresentRequest request { *videoDecoder_, bufferInfo, sampleInfo_, *videoDecContext_, render, renderTimestamp };
    int32_t ret = videoSink_->Present(request);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Present video output failed: %{public}d", ret);
        playbackFailed_ = true;
        isStarted_ = false;
        return false;
    }
    hasDecodedOutput_ = true;
    if (render && !hasAudioTrack_.load()) {
        playbackPositionUs_.store(bufferInfo.attr.pts);
    }
    return true;
}

void Player::WriteOutputFileWithStrideYUV420P(uint8_t *bufferAddr)
{
    CHECK_AND_RETURN_LOG(bufferAddr != nullptr, "Buffer is nullptr");
    auto &info = sampleInfo_;
    int32_t videoWidth =
        videoDecContext_->width *
        ((info.video.videoCodecMime == OH_AVCODEC_MIMETYPE_VIDEO_HEVC &&
            info.video.hevcProfile == HEVC_PROFILE_MAIN_10) ? 2 : 1);
    int32_t &stride = videoDecContext_->widthStride;
    int32_t uvWidth = videoWidth / YUV420_SAMPLE_RATIO;
    int32_t uvStride = stride / YUV420_SAMPLE_RATIO;

    // copy Y
    for (int32_t row = 0; row < videoDecContext_->height; row++) {
        outputFile_->write(reinterpret_cast<char *>(bufferAddr), videoWidth);
        bufferAddr += stride;
    }
    bufferAddr += (videoDecContext_->heightStride - videoDecContext_->height) * stride;

    // copy U
    for (int32_t row = 0; row < (videoDecContext_->height / YUV420_SAMPLE_RATIO); row++) {
        outputFile_->write(reinterpret_cast<char *>(bufferAddr), uvWidth);
        bufferAddr += uvStride;
    }
    bufferAddr += (videoDecContext_->heightStride - videoDecContext_->height) / YUV420_SAMPLE_RATIO * uvStride;
    // copy V
    for (int32_t row = 0; row < (videoDecContext_->height / YUV420_SAMPLE_RATIO); row++) {
        outputFile_->write(reinterpret_cast<char *>(bufferAddr), uvWidth);
        bufferAddr += uvStride;
    }
}

void Player::WriteOutputFileWithStrideYUV420SP(uint8_t *bufferAddr)
{
    CHECK_AND_RETURN_LOG(bufferAddr != nullptr, "Buffer is nullptr");
    auto &info = sampleInfo_;
    int32_t videoWidth =
        videoDecContext_->width *
        ((info.video.videoCodecMime == OH_AVCODEC_MIMETYPE_VIDEO_HEVC &&
            info.video.hevcProfile == HEVC_PROFILE_MAIN_10) ? 2 : 1);
    int32_t &stride = videoDecContext_->widthStride;

    // copy Y
    for (int32_t row = 0; row < videoDecContext_->height; row++) {
        outputFile_->write(reinterpret_cast<char *>(bufferAddr), videoWidth);
        bufferAddr += stride;
    }
    bufferAddr += (videoDecContext_->heightStride - videoDecContext_->height) * stride;
    
    // copy UV
    for (int32_t row = 0; row < (videoDecContext_->height / YUV420_SAMPLE_RATIO); row++) {
        outputFile_->write(reinterpret_cast<char *>(bufferAddr), videoWidth);
        bufferAddr += videoWidth;
    }
}

void Player::WriteOutputFileWithStrideRGBA(uint8_t *bufferAddr)
{
    CHECK_AND_RETURN_LOG(bufferAddr != nullptr, "Buffer is nullptr");
    int32_t width = videoDecContext_->width;
    int32_t &stride = videoDecContext_->widthStride;

    for (int32_t row = 0; row < videoDecContext_->heightStride; row++) {
        outputFile_->write(reinterpret_cast<char *>(bufferAddr), width * 4); // 4: RGBA 4 channels
        bufferAddr += stride;
    }
}

void Player::VideoDecInputSyncThread()
{
    while (true) {
        WaitIfPaused();
        CHECK_AND_BREAK_LOG(isStarted_, "Decoder input thread out");
        std::unique_lock<std::mutex> lock(videoDecContext_->inputMutex);
        CodecBufferInfo bufferInfo(nullptr);
        auto buffer = videoDecoder_->GetInputBuffer(bufferInfo, CODEC_BUFFER_TIMEOUT_US);
        CHECK_AND_CONTINUE_LOG(buffer != nullptr, "Get input buffer timeout, retry");
        CHECK_AND_BREAK_LOG(isStarted_, "Work done, thread out");
        videoDecContext_->inputFrameCount++;
        lock.unlock();
        
        int32_t ret = demuxer_->ReadSample(demuxer_->GetVideoTrackId(), buffer, bufferInfo.attr);
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            AVCODEC_SAMPLE_LOGE("Read video sample failed");
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
            ret = demuxer_->ReadSample(demuxer_->
                    GetVideoTrackId(), bufferInfo.buffer, bufferInfo.attr);
            if (ret != AVCODEC_SAMPLE_ERR_OK) {
                playbackFailed_ = true;
                isStarted_ = false;
                break;
            }
        }

        ret = videoDecoder_->PushInputBuffer(bufferInfo);
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            playbackFailed_ = true;
            isStarted_ = false;
            break;
        }

        CHECK_AND_BREAK_LOG(!(bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_EOS), "Catch EOS, thread out");
    }
}

void Player::VideoDecInputAsyncThread()
{
    while (true) {
        WaitIfPaused();
        CHECK_AND_BREAK_LOG(isStarted_, "Decoder input thread out");
        std::shared_ptr<CodecBufferInfo> bufferInfo = videoDecContext_->inputBufferQueue.Dequeue();
        std::shared_lock<std::shared_mutex> codecLock(videoDecContext_->codecMutex);
        CHECK_AND_BREAK_LOG(isStarted_, "Work done, thread out");
        CHECK_AND_CONTINUE_LOG(bufferInfo != nullptr && bufferInfo->isValid,
                               "Buffer queue is empty or invalid, continue");

        videoDecContext_->inputFrameCount++;

        int32_t ret = demuxer_->ReadSample(demuxer_->GetVideoTrackId(), bufferInfo->buffer,
                                           bufferInfo->attr);
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            AVCODEC_SAMPLE_LOGE("Read video sample failed");
            playbackFailed_ = true;
            isStarted_ = false;
            break;
        }
        
        if ((bufferInfo->attr.flags & AVCODEC_BUFFER_FLAGS_EOS) && isLoop_) {
            ret = demuxer_->Seek(0);
            if (ret != AVCODEC_SAMPLE_ERR_OK) {
                playbackFailed_ = true;
                isStarted_ = false;
                break;
            }
            ret = demuxer_->ReadSample(demuxer_->
                GetVideoTrackId(), bufferInfo->buffer, bufferInfo->attr);
            if (ret != AVCODEC_SAMPLE_ERR_OK) {
                playbackFailed_ = true;
                isStarted_ = false;
                break;
            }
        }

        ret = videoDecoder_->PushInputBuffer(*bufferInfo);
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            playbackFailed_ = true;
            isStarted_ = false;
            break;
        }

        CHECK_AND_BREAK_LOG(!(bufferInfo->attr.flags & AVCODEC_BUFFER_FLAGS_EOS), "Catch EOS, thread out");
    }
}

bool Player::ProcessVideoWithoutAudio(CodecBufferInfo& bufferInfo,
    std::chrono::time_point<std::chrono::system_clock>& lastPushTime)
{
    bool discarded = false;
    if (!DiscardVideoOutputBeforeSeekTarget(bufferInfo, discarded)) {
        return false;
    }
    if (discarded) {
        return true;
    }
    if (!PresentAndReleaseVideoBuffer(bufferInfo, true, GetCurrentTime())) {
        playbackFailed_ = true;
        isStarted_ = false;
        return false;
    }
    const float speedSnapshot = speed.load();
    speedSnapshot == 1 ? sampleInfo_.video.frameInterval = US_PER_SECOND / sampleInfo_.video.frameRate
        : speedSnapshot == DOUBLE_SPEED_MULTIPLIER ? sampleInfo_.video.frameInterval =
                        US_PER_SECOND / sampleInfo_.video.frameRate / DOUBLE_SPEED_MULTIPLIER
                   : sampleInfo_.video.frameInterval =
                        US_PER_SECOND / sampleInfo_.video.frameRate / TRIPLE_SPEED_MULTIPLIER;
    std::this_thread::sleep_until(lastPushTime + std::chrono::microseconds(sampleInfo_.video.frameInterval));
    lastPushTime = std::chrono::system_clock::now();
    
    return true;
}

bool Player::CalculateSyncParameters(CodecBufferInfo& bufferInfo, int64_t framePosition,
    int64_t& waitTimeUs, bool& dropFrame)
{
    int64_t audioFramesWritten = 0;
    int64_t currentAudioPts = 0;
    {
        std::lock_guard<std::mutex> lock(audioDecContext_->outputMutex);
        audioFramesWritten = audioDecContext_->audioFramesWritten;
        currentAudioPts = audioDecContext_->currentPosAudioBufferPts;
    }
    const AvSyncDecision decision = avSyncController_.Decide({
        bufferInfo.attr.pts,
        audioFramesWritten,
        framePosition,
        currentAudioPts,
        playbackClock_.UpdateNowTimestampNs(),
        playbackClock_.GetAudioTimestampNs(),
        sampleInfo_.audio.audioSampleRate,
        static_cast<double>(speed.load()),
    });
    CHECK_AND_RETURN_RET_LOG(decision.valid, false, "Invalid audio clock parameters");
    waitTimeUs = decision.waitTimeUs;
    dropFrame = decision.dropFrame;
    AVCODEC_SAMPLE_LOGI("VD sync decision, index: %{public}u, waitTimeUs: %{public}" PRId64
        ", drop: %{public}d", bufferInfo.bufferIndex, waitTimeUs, dropFrame);
    return true;
}

void Player::SetVolume(float volume)
{
    const float clampedVolume = std::clamp(volume, 0.0f, 1.0f);
    sampleInfo_.audioPlayback.volume = clampedVolume;
    if (audioRenderer_ == nullptr) {
        return;
    }
    const int32_t ret = OH_AudioRenderer_SetVolume(audioRenderer_, clampedVolume);
    if (ret != AUDIOSTREAM_SUCCESS) {
        AVCODEC_SAMPLE_LOGW("Set audio volume failed, volume: %{public}f, ret: %{public}d", clampedVolume, ret);
    }
}

bool Player::RenderAndRelease(CodecBufferInfo& bufferInfo, int64_t waitTimeUs, bool dropFrame)
{
    const int64_t renderLeadUs = std::clamp(waitTimeUs, int64_t { 0 }, AvSyncController::renderAheadUs);
    if (waitTimeUs > AvSyncController::renderAheadUs) {
        std::this_thread::sleep_for(
            std::chrono::microseconds(waitTimeUs - AvSyncController::renderAheadUs));
    }
    return PresentAndReleaseVideoBuffer(bufferInfo, !dropFrame, renderLeadUs * NS_PER_US + GetCurrentTime());
}

bool Player::ProcessVideoWithAudio(CodecBufferInfo& bufferInfo,
    std::chrono::time_point<std::chrono::system_clock>& lastPushTime)
{
    bool discarded = false;
    if (!DiscardVideoOutputBeforeSeekTarget(bufferInfo, discarded)) {
        return false;
    }
    if (discarded) {
        return true;
    }
    if (audioStartPendingAfterVideoSeek_.load()) {
        // Present the first target frame immediately, then let the audio clock drive later frames.
        if (!PresentAndReleaseVideoBuffer(bufferInfo, true, GetCurrentTime())) {
            return false;
        }
        StartAudioAfterVideoSeek();
        lastPushTime = std::chrono::system_clock::now();
        return true;
    }
    // get audio render position
    int64_t framePosition = 0;
    int64_t timestamp = 0;
    int32_t ret = OH_AudioRenderer_GetAudioTimestampInfo(audioRenderer_, &framePosition, &timestamp);
    AVCODEC_SAMPLE_LOGI("VD framePosition: %{public}li, audioTimestamp: %{public}li", framePosition, timestamp);
    playbackClock_.SetAudioTimestampNs(timestamp);
    
    // Render at the nominal interval until the audio hardware timestamp becomes available.
    if (ret != AUDIOSTREAM_SUCCESS || (timestamp == 0) || (framePosition == 0)) {
        // first frame, render without wait
        if (!PresentAndReleaseVideoBuffer(bufferInfo, true, GetCurrentTime())) {
            return false;
        }
        StartAudioAfterVideoSeek();
        std::this_thread::sleep_until(lastPushTime + std::chrono::microseconds(sampleInfo_.video.frameInterval));
        lastPushTime = std::chrono::system_clock::now();
        return true;
    }
    int64_t waitTimeUs = 0;
    bool dropFrame = false;
    if (!CalculateSyncParameters(bufferInfo, framePosition, waitTimeUs, dropFrame)) {
        return false;
    }
    const bool rendered = RenderAndRelease(bufferInfo, waitTimeUs, dropFrame);
    if (rendered && !dropFrame) {
        StartAudioAfterVideoSeek();
    }
    return rendered;
}

void Player::InitSyncVideoOutputContext()
{
    if (!videoDecContext_->isDecFirstFrame) {
        return;
    }
    OH_AVFormat *format = videoDecoder_->GetOutputDescription();
    if (format != nullptr) {
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PIC_WIDTH, &videoDecContext_->width);
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PIC_HEIGHT, &videoDecContext_->height);
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_STRIDE, &videoDecContext_->widthStride);
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_SLICE_HEIGHT, &videoDecContext_->heightStride);
        int32_t pixelFormat = sampleInfo_.video.pixelFormat;
        if (OH_AVFormat_GetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, &pixelFormat)) {
            sampleInfo_.video.pixelFormat = static_cast<OH_AVPixelFormat>(pixelFormat);
        }
        OH_AVFormat_Destroy(format);
    }
    videoDecContext_->isDecFirstFrame = false;
    AVCODEC_SAMPLE_LOGI("Sync mode init: %{public}d*%{public}d, stride: %{public}d*%{public}d, "
        "pixel format: %{public}d", videoDecContext_->width, videoDecContext_->height,
        videoDecContext_->widthStride, videoDecContext_->heightStride, sampleInfo_.video.pixelFormat);
}

bool Player::GetSyncVideoOutputBuffer(CodecBufferInfo& bufferInfo)
{
    int32_t ret = AVCODEC_SAMPLE_ERR_AGAIN;
    while (isStarted_ && ret == AVCODEC_SAMPLE_ERR_AGAIN) {
        std::unique_lock<std::mutex> lock(videoDecContext_->outputMutex);
        ret = videoDecoder_->GetOutputBuffer(bufferInfo, CODEC_BUFFER_TIMEOUT_US);
    }
    CHECK_AND_RETURN_RET_LOG(isStarted_, false, "VD Decoder output thread out");
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, false,
        "VD Get out buffer failed, ret: %{public}d", ret);
    CHECK_AND_RETURN_RET_LOG(!(bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_EOS), false, "Catch EOS, thread out");
    InitSyncVideoOutputContext();
    videoDecContext_->outputFrameCount++;
    AVCODEC_SAMPLE_LOGW("Out buffer count: %{public}u, size: %{public}d, flag: %{public}u, pts: %{public}" PRId64,
        videoDecContext_->outputFrameCount, bufferInfo.attr.size, bufferInfo.attr.flags, bufferInfo.attr.pts);
    return true;
}

bool Player::ProcessSyncVideoOutput(std::chrono::time_point<std::chrono::system_clock>& lastPushTime)
{
    CodecBufferInfo bufferInfo(nullptr);
    if (!GetSyncVideoOutputBuffer(bufferInfo)) {
        return false;
    }
    if (audioDecContext_ == nullptr) {
        return ProcessVideoWithoutAudio(bufferInfo, lastPushTime);
    }
    return ProcessVideoWithAudio(bufferInfo, lastPushTime);
}

void Player::FinishVideoOutput()
{
    std::lock_guard<std::mutex> lock(doneMutex);
    if (seekInProgress_.load()) {
        AVCODEC_SAMPLE_LOGI("Video output paused for seek");
        return;
    }
    playbackClock_.Reset(0);
    isVideoDone.store(true);
    doneCond_.notify_all();
}

void Player::VideoDecOutputSyncThread()
{
    sampleInfo_.video.frameInterval = US_PER_SECOND / sampleInfo_.video.frameRate;
    thread_local auto lastPushTime = std::chrono::system_clock::now();
    while (isStarted_) {
        WaitIfPaused();
        if (!ProcessSyncVideoOutput(lastPushTime)) {
            break;
        }
    }
    FinishVideoOutput();
}

void Player::VideoDecOutputAsyncThread()
{
    sampleInfo_.video.frameInterval = US_PER_SECOND / sampleInfo_.video.frameRate;
    while (true) {
        thread_local auto lastPushTime = std::chrono::system_clock::now();
        WaitIfPaused();
        CHECK_AND_BREAK_LOG(isStarted_, "VD Decoder output thread out");
        std::shared_ptr<CodecBufferInfo> bufferInfo = videoDecContext_->outputBufferQueue.Dequeue();
        std::shared_lock<std::shared_mutex> codecLock(videoDecContext_->codecMutex);
        CHECK_AND_BREAK_LOG(isStarted_, "VD Decoder output thread out");
        CHECK_AND_CONTINUE_LOG(bufferInfo != nullptr && bufferInfo->isValid,
            "Buffer queue is empty or invalid, continue");
        CHECK_AND_BREAK_LOG(!(bufferInfo->attr.flags & AVCODEC_BUFFER_FLAGS_EOS), "Catch EOS, thread out");
        videoDecContext_->outputFrameCount++;
        AVCODEC_SAMPLE_LOGW("Out buffer count: %{public}u, size: %{public}d, flag: %{public}u, pts: %{public}" PRId64,
                           videoDecContext_->outputFrameCount, bufferInfo->attr.size, bufferInfo->attr.flags,
                           bufferInfo->attr.pts);
        bool success = false;
        if (!audioDecContext_) {
            success = ProcessVideoWithoutAudio(*bufferInfo, lastPushTime);
        } else {
            success = ProcessVideoWithAudio(*bufferInfo, lastPushTime);
        }
        if (!success) {
            break;
        }
    }
    FinishVideoOutput();
}

void Player::AudioDecInputThread()
{
    while (true) {
        WaitIfPaused();
        CHECK_AND_BREAK_LOG(isStarted_, "Decoder input thread out");
        std::shared_ptr<CodecBufferInfo> bufferInfo = audioDecContext_->inputBufferQueue.Dequeue();
        std::shared_lock<std::shared_mutex> codecLock(audioDecContext_->codecMutex);
        CHECK_AND_BREAK_LOG(isStarted_, "Work done, thread out");
        CHECK_AND_CONTINUE_LOG(bufferInfo != nullptr && bufferInfo->isValid,
                               "Buffer queue is empty or invalid, continue");

        audioDecContext_->inputFrameCount++;

        int32_t ret = demuxer_->ReadSample(demuxer_->GetAudioTrackId(), bufferInfo->buffer,
                                           bufferInfo->attr);
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
    while (true) {
        WaitIfPaused();
        CHECK_AND_BREAK_LOG(isStarted_, "Decoder input thread out");
        std::unique_lock<std::mutex> lock(audioDecContext_->inputMutex);
        CodecBufferInfo bufferInfo(nullptr);
        auto buffer = audioDecoder_->GetInputBuffer(bufferInfo, CODEC_BUFFER_TIMEOUT_US);
        CHECK_AND_CONTINUE_LOG(buffer != nullptr, "Get input buffer timeout, retry");
        CHECK_AND_BREAK_LOG(isStarted_, "Work done, thread out");
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
            ret = demuxer_->ReadSample(demuxer_->
                    GetAudioTrackId(), bufferInfo.buffer, bufferInfo.attr);
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
    int32_t ret = audioDecoder_->FreeOutputBuffer(bufferInfo.bufferIndex, true);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGW("FreeOutputBuffer failed: %{public}d", ret);
        playbackFailed_ = true;
        isStarted_ = false;
        return false;
    }

    // SAMPLE_S16LE 2 bytes per frame
    playbackClock_.AddWrittenSamples(
        bufferInfo.attr.size / sampleInfo_.audio.audioChannelCount / BYTES_PER_SAMPLE_2);
    AVCODEC_SAMPLE_LOGI("writtenSampleCnt_: %{public}ld, bufferInfo.attr.size: %{public}d, "
                        "sampleInfo_.audioChannelCount: %{public}d",
                        playbackClock_.GetWrittenSamples(), bufferInfo.attr.size,
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
        isStarted_,
        playbackFailed_,
        [this](CodecBufferInfo &bufferInfo) { return PrepareAudioOutputAfterSeek(bufferInfo); },
        [this](CodecBufferInfo &bufferInfo) { return ProcessAudioOutput(bufferInfo); },
        std::move(dumpCallback),
    });
}

void Player::FinishAudioOutput(bool stopRenderer)
{
    if (seekInProgress_.load()) {
        AVCODEC_SAMPLE_LOGI("Audio output paused for seek");
        return;
    }
    std::unique_lock<std::mutex> lockRender(audioDecContext_->outputMutex);
    audioDecContext_->renderCond.wait_for(lockRender, 500ms,
        [this]() { return audioDecContext_->renderQueue.empty(); });
    if (seekInProgress_.load()) {
        AVCODEC_SAMPLE_LOGI("Audio output paused for seek after draining wait");
        return;
    }
    AVCODEC_SAMPLE_LOGI("Out buffer end");
    if (stopRenderer && audioRenderer_) {
        OH_AudioRenderer_Stop(audioRenderer_);
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
    while (true) {
        WaitIfPaused();
        if (!outputPump.ProcessAsyncOutput()) {
            break;
        }
    }
    FinishAudioOutput(true);
}

void Player::AudioDecOutputSyncThread()
{
    AudioOutputPump outputPump = CreateAudioOutputPump();
    while (true) {
        WaitIfPaused();
        if (!outputPump.ProcessSyncOutput()) {
            break;
        }
    }
    FinishAudioOutput(false);
}

int64_t Player::GetCurrentTime()
{
    auto now = std::chrono::steady_clock::now();
    auto now_ns = std::chrono::time_point_cast<std::chrono::nanoseconds>(now);
    return now_ns.time_since_epoch().count();
}
