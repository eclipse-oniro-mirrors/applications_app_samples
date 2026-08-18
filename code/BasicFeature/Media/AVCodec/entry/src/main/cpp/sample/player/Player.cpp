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
constexpr int64_t WAIT_TIME_US_THRESHOLD_WARNING = -1 * 40 * 1000; // warning threshold 40ms
constexpr int64_t WAIT_TIME_US_THRESHOLD = 1 * 1000 * 1000;        // max sleep time 1s
constexpr int32_t BYTES_PER_SAMPLE_2 = 2;                          // 2 bytes per sample
constexpr int8_t YUV420_SAMPLE_RATIO = 2;
constexpr int32_t TRIPLE_SPEED_MULTIPLIER = 3;
constexpr int32_t DOUBLE_SPEED_MULTIPLIER = 2;
constexpr int64_t US_PER_SECOND = 1000000;
constexpr int64_t NS_PER_US = 1000;
constexpr int64_t RENDER_AHEAD_US = US_PER_SECOND / 60 * 2;        // keep at most two VSync periods queued
constexpr int64_t CODEC_BUFFER_TIMEOUT_US = 5000000;

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
    state_ = PlayerState::STOPPING;
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
    return state_.load();
}

PlaybackInfo Player::GetPlaybackInfo() const
{
    PlaybackInfo info;
    info.state = state_.load();
    if (info.state == PlayerState::IDLE) {
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
    PlayerState currentState = state_.load();
    if (currentState == PlayerState::STOPPING) {
        return AVCODEC_SAMPLE_ERR_OK;
    }
    CHECK_AND_RETURN_RET_LOG(currentState == PlayerState::PLAYING, AVCODEC_SAMPLE_ERR_ERROR,
        "Stop is only allowed while playing, state: %{public}d", static_cast<int32_t>(currentState));
    CHECK_AND_RETURN_RET_LOG(!playbackFailed_.load(), AVCODEC_SAMPLE_ERR_ERROR,
        "Playback is already failing");

    state_ = PlayerState::STOPPING;
    stopRequested_ = true;
    isStarted_ = false;
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
        ret = audioDecoder_->Config(sampleInfo_, audioDecContext_.get());
        CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Audio Decoder config failed");
        OH_AudioStreamBuilder_Create(&builder_, AUDIOSTREAM_TYPE_RENDERER);
        OH_AudioStreamBuilder_SetLatencyMode(builder_, AUDIOSTREAM_LATENCY_MODE_NORMAL);
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
    state_ = PlayerState::STOPPING;
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
    stopRequested_ = false;
    speed.store(1.0f);
    playbackPositionUs_.store(0);
    playbackDurationUs_.store(0);
    hasVideoTrack_.store(false);
    hasAudioTrack_.store(false);
    hdrVividConfirmed_.store(false);
    isSmartFluencySupported_ = sampleInfo.codec.isSmartFluencySupported;
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
    PlayerState expectedState = PlayerState::IDLE;
    CHECK_AND_RETURN_RET_LOG(state_.compare_exchange_strong(expectedState, PlayerState::INITIALIZING),
        AVCODEC_SAMPLE_ERR_ERROR, "Init is not allowed in state: %{public}d", static_cast<int32_t>(expectedState));
    std::unique_lock<std::mutex> lock(mutex_);
    if (demuxer_ != nullptr || videoDecoder_ != nullptr || audioDecoder_ != nullptr) {
        state_ = PlayerState::IDLE;
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

    if (audioDecContext_ != nullptr) {
        audioDecContext_->sampleInfo = &sampleInfo_;
    }

    playbackDurationUs_.store(sampleInfo_.source.durationUs);
    hasVideoTrack_.store(videoDecContext_ != nullptr);
    hasAudioTrack_.store(audioDecContext_ != nullptr);
    UpdateMediaInfoSnapshot();
    isReleased_ = false;
    state_ = PlayerState::READY;
    AVCODEC_SAMPLE_LOGI("Succeed");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Player::StartVideoDecoder()
{
    CHECK_AND_RETURN_RET_LOG(!videoDecInputThread_ && !videoDecOutputThread_,
                             AVCODEC_SAMPLE_ERR_ERROR, "Video threads already running");

    int32_t ret = videoDecoder_->Start();
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Video Decoder start failed");
        return ret;
    }

    if (sampleInfo_.codec.codecSyncMode) {
        videoDecInputThread_ = std::make_unique<std::thread>(&Player::VideoDecInputSyncThread, this);
        videoDecOutputThread_ = std::make_unique<std::thread>(&Player::VideoDecOutputSyncThread, this);
    } else {
        videoDecInputThread_ = std::make_unique<std::thread>(&Player::VideoDecInputAsyncThread, this);
        videoDecOutputThread_ = std::make_unique<std::thread>(&Player::VideoDecOutputAsyncThread, this);
    }

    if (!videoDecInputThread_ || !videoDecOutputThread_) {
        AVCODEC_SAMPLE_LOGE("Create video threads failed");
        return AVCODEC_SAMPLE_ERR_ERROR;
    }

    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Player::StartAudioDecoder()
{
    CHECK_AND_RETURN_RET_LOG(!audioDecInputThread_ && !audioDecOutputThread_,
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

    if (sampleInfo_.codec.codecSyncMode) {
        audioDecInputThread_ = std::make_unique<std::thread>(&Player::AudioDecInputSyncThread, this);
        audioDecOutputThread_ = std::make_unique<std::thread>(&Player::AudioDecOutputSyncThread, this);
    } else {
        audioDecInputThread_ = std::make_unique<std::thread>(&Player::AudioDecInputThread, this);
        audioDecOutputThread_ = std::make_unique<std::thread>(&Player::AudioDecOutputThread, this);
    }

    if (!audioDecInputThread_ || !audioDecOutputThread_) {
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
    state_ = PlayerState::STOPPING;
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
    CHECK_AND_RETURN_RET_LOG(state_.load() == PlayerState::READY, AVCODEC_SAMPLE_ERR_ERROR,
        "Start is not allowed in state: %{public}d", static_cast<int32_t>(state_.load()));
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
    
    state_ = PlayerState::PLAYING;
    AVCODEC_SAMPLE_LOGI("Player started successfully");
    StartRelease();
    return AVCODEC_SAMPLE_ERR_OK;
}

void Player::SetSpeed(float multiplier)
{
    CHECK_AND_RETURN_LOG(state_.load() == PlayerState::PLAYING, "Set speed is only allowed while playing");
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
    CHECK_AND_RETURN_LOG(state_.load() == PlayerState::PLAYING, "Set transform is only allowed while playing");
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
    return (videoDecInputThread_ && videoDecInputThread_->joinable()) ||
           (videoDecOutputThread_ && videoDecOutputThread_->joinable()) ||
           (audioDecInputThread_ && audioDecInputThread_->joinable()) ||
           (audioDecOutputThread_ && audioDecOutputThread_->joinable());
}

void Player::JoinWorkerThreads()
{
    auto joinThread = [](std::unique_ptr<std::thread> &thread) {
        if (thread && thread->joinable()) {
            thread->join();
        }
        thread.reset();
    };
    joinThread(videoDecInputThread_);
    joinThread(videoDecOutputThread_);
    joinThread(audioDecInputThread_);
    joinThread(audioDecOutputThread_);
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
    const bool hasDecodedOutput = (videoDecContext_ != nullptr && videoDecContext_->outputFrameCount > 0) ||
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
    bufferRenderer_.Reset();
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
    state_ = PlayerState::STOPPING;
    bool playbackSucceeded = false;
    const PlaybackCompletionReason completionReason = GetCompletionReason(playbackSucceeded);
    isStarted_ = false;
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
    state_ = PlayerState::IDLE;
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

bool Player::RenderBufferToWindow(CodecBufferInfo& bufferInfo, int64_t renderTimestamp)
{
    CHECK_AND_RETURN_RET_LOG(videoDecContext_ != nullptr, false, "Video decode context is null");
    return bufferRenderer_.Render(bufferInfo, sampleInfo_, *videoDecContext_, renderTimestamp);
}

bool Player::PresentAndReleaseVideoBuffer(CodecBufferInfo& bufferInfo, bool render, int64_t renderTimestamp)
{
    if (sampleInfo_.codec.codecRunMode == BUFFER && !hdrVividConfirmed_.load() &&
        HdrMetadataHelper::IsHdrVivid(bufferInfo.buffer)) {
        hdrVividConfirmed_.store(true);
        AVCODEC_SAMPLE_LOGI("HDR Vivid confirmed from decoded bitstream metadata");
    }
    DumpOutput(bufferInfo);

    int32_t ret = AVCODEC_SAMPLE_ERR_OK;
    bool renderResult = true;
    if (sampleInfo_.codec.codecRunMode == BUFFER) {
        renderResult = !render || RenderBufferToWindow(bufferInfo, renderTimestamp);
        ret = videoDecoder_->FreeOutputBuffer(bufferInfo.bufferIndex, false);
    } else {
        ret = videoDecoder_->FreeOutputBuffer(bufferInfo.bufferIndex, render, renderTimestamp);
    }

    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("FreeOutputBuffer failed: %{public}d", ret);
        playbackFailed_ = true;
        isStarted_ = false;
        return false;
    }
    if (!renderResult) {
        AVCODEC_SAMPLE_LOGE("Render buffer to window failed");
        playbackFailed_ = true;
        isStarted_ = false;
        return false;
    }
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
        CHECK_AND_BREAK_LOG(isStarted_, "Decoder input thread out");
        std::unique_lock<std::mutex> lock(videoDecContext_->inputMutex);
        CodecBufferInfo bufferInfo(nullptr);
        auto buffer = videoDecoder_->GetInputBuffer(bufferInfo, CODEC_BUFFER_TIMEOUT_US);
        CHECK_AND_BREAK_LOG(buffer != nullptr, "Get input buffer timeout");
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
    const auto speedSnapshot = static_cast<double>(speed.load());
    CHECK_AND_RETURN_RET_LOG(sampleInfo_.audio.audioSampleRate > 0 && speedSnapshot > 0.0, false,
        "Invalid audio clock parameters");
    const int64_t pendingFrames = std::max(audioFramesWritten - framePosition, int64_t { 0 });
    const auto latency = static_cast<int64_t>(pendingFrames * US_PER_SECOND / sampleInfo_.audio.audioSampleRate);
    AVCODEC_SAMPLE_LOGI("VD latency: %{public}li audioFramesWritten: %{public}li",
        latency, audioFramesWritten);
    
    nowTimeStamp = GetCurrentTime();
    const int64_t anchorDiff = (nowTimeStamp - audioTimeStamp) / 1000;
    
    // The new timestamp position follows speed; extrapolate its monotonic-time anchor in the same media timeline.
    int64_t audioPlayedTime = currentAudioPts - latency + static_cast<int64_t>(anchorDiff * speedSnapshot);
    // us, video buffer expected render time
    int64_t videoPlayedTime = bufferInfo.attr.pts;
    
    // PTS uses media time. Convert the A/V difference to wall time before sleeping or scheduling a frame.
    const int64_t mediaWaitTimeUs = videoPlayedTime - audioPlayedTime;
    waitTimeUs = static_cast<int64_t>(mediaWaitTimeUs / speedSnapshot);
    
    AVCODEC_SAMPLE_LOGI("VD bufferInfo.bufferIndex: %{public}u", bufferInfo.bufferIndex);
    AVCODEC_SAMPLE_LOGI(
        "VD audioPlayedTime: %{public}li, videoPlayedTime: %{public}li, nowTimeStamp_:%{public}ld, "
          "audioTimeStamp_ :%{public}ld, mediaWaitTimeUs:%{public}ld, waitTimeUs:%{public}ld, "
          "anchorDiff:%{public}ld",
        audioPlayedTime, videoPlayedTime, nowTimeStamp, audioTimeStamp, mediaWaitTimeUs, waitTimeUs, anchorDiff);
    dropFrame = false;
    // video buffer is too late, drop it
    if (waitTimeUs < WAIT_TIME_US_THRESHOLD_WARNING) {
        dropFrame = true;
        AVCODEC_SAMPLE_LOGI("VD buffer is too late");
    } else {
        AVCODEC_SAMPLE_LOGE("VD buffer is too early waitTimeUs:%{public}ld", waitTimeUs);
        // [0, ), render it wait waitTimeUs, max 1s
        // [-40, 0), render it
        if (waitTimeUs > WAIT_TIME_US_THRESHOLD) {
            waitTimeUs = WAIT_TIME_US_THRESHOLD;
        }
    }
    return true;
}

bool Player::RenderAndRelease(CodecBufferInfo& bufferInfo, int64_t waitTimeUs, bool dropFrame)
{
    const int64_t renderLeadUs = std::clamp(waitTimeUs, int64_t { 0 }, RENDER_AHEAD_US);
    if (waitTimeUs > RENDER_AHEAD_US) {
        std::this_thread::sleep_for(std::chrono::microseconds(waitTimeUs - RENDER_AHEAD_US));
    }
    return PresentAndReleaseVideoBuffer(bufferInfo, !dropFrame, renderLeadUs * NS_PER_US + GetCurrentTime());
}

bool Player::ProcessVideoWithAudio(CodecBufferInfo& bufferInfo,
    std::chrono::time_point<std::chrono::system_clock>& lastPushTime)
{
    // get audio render position
    int64_t framePosition = 0;
    int64_t timestamp = 0;
    int32_t ret = OH_AudioRenderer_GetAudioTimestampInfo(audioRenderer_, &framePosition, &timestamp);
    AVCODEC_SAMPLE_LOGI("VD framePosition: %{public}li, audioTimestamp: %{public}li", framePosition, timestamp);
    audioTimeStamp = timestamp; // ns
    
    // Render at the nominal interval until the audio hardware timestamp becomes available.
    if (ret != AUDIOSTREAM_SUCCESS || (timestamp == 0) || (framePosition == 0)) {
        // first frame, render without wait
        if (!PresentAndReleaseVideoBuffer(bufferInfo, true, GetCurrentTime())) {
            return false;
        }
        std::this_thread::sleep_until(lastPushTime + std::chrono::microseconds(sampleInfo_.video.frameInterval));
        lastPushTime = std::chrono::system_clock::now();
        return true;
    }
    int64_t waitTimeUs = 0;
    bool dropFrame = false;
    if (!CalculateSyncParameters(bufferInfo, framePosition, waitTimeUs, dropFrame)) {
        return false;
    }
    return RenderAndRelease(bufferInfo, waitTimeUs, dropFrame);
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
    CHECK_AND_RETURN_RET_LOG(isStarted_, false, "VD Decoder output thread out");
    std::unique_lock<std::mutex> lock(videoDecContext_->outputMutex);
    CHECK_AND_RETURN_RET_LOG(videoDecoder_->GetOutputBuffer(bufferInfo, CODEC_BUFFER_TIMEOUT_US), false,
        "VD Get out buffer failed, thread out");
    CHECK_AND_RETURN_RET_LOG(isStarted_, false, "VD Decoder output thread out");
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
    writtenSampleCnt = 0;
    audioBufferPts = 0;
    std::unique_lock<std::mutex> lock(doneMutex);
    isVideoDone.store(true);
    lock.unlock();
    doneCond_.notify_all();
}

void Player::VideoDecOutputSyncThread()
{
    sampleInfo_.video.frameInterval = US_PER_SECOND / sampleInfo_.video.frameRate;
    thread_local auto lastPushTime = std::chrono::system_clock::now();
    while (isStarted_) {
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
        CHECK_AND_BREAK_LOG(isStarted_, "Decoder input thread out");
        std::unique_lock<std::mutex> lock(audioDecContext_->inputMutex);
        CodecBufferInfo bufferInfo(nullptr);
        auto buffer = audioDecoder_->GetInputBuffer(bufferInfo, CODEC_BUFFER_TIMEOUT_US);
        CHECK_AND_CONTINUE_LOG(buffer != nullptr, "Get input buffer timeout, retry");
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
    writtenSampleCnt += (bufferInfo.attr.size / sampleInfo_.audio.audioChannelCount / BYTES_PER_SAMPLE_2);
    AVCODEC_SAMPLE_LOGI("writtenSampleCnt_: %{public}ld, bufferInfo.attr.size: %{public}d, "
                        "sampleInfo_.audioChannelCount: %{public}d",
                        writtenSampleCnt, bufferInfo.attr.size, sampleInfo_.audio.audioChannelCount);

    audioBufferPts = bufferInfo.attr.pts;
    audioDecContext_->endPosAudioBufferPts = audioBufferPts;

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
            audioOutputFile_.write(reinterpret_cast<const char *>(source), bufferInfo.attr.size);
        }
    };
#endif
    return AudioOutputPump({
        *audioDecoder_,
        *audioDecContext_,
        isStarted_,
        playbackFailed_,
        [this](CodecBufferInfo &bufferInfo) { return ProcessAudioOutput(bufferInfo); },
        std::move(dumpCallback),
    });
}

void Player::FinishAudioOutput(bool stopRenderer)
{
    std::unique_lock<std::mutex> lockRender(audioDecContext_->outputMutex);
    audioDecContext_->renderCond.wait_for(lockRender, 500ms,
        [this]() { return audioDecContext_->renderQueue.empty(); });
    AVCODEC_SAMPLE_LOGI("Out buffer end");
    if (stopRenderer && audioRenderer_) {
        OH_AudioRenderer_Stop(audioRenderer_);
    }
    std::unique_lock<std::mutex> lock(doneMutex);
    isAudioDone = true;
    lock.unlock();
    doneCond_.notify_all();
}

void Player::AudioDecOutputThread()
{
    AudioOutputPump outputPump = CreateAudioOutputPump();
    while (outputPump.ProcessAsyncOutput()) {
    }
    FinishAudioOutput(true);
}

void Player::AudioDecOutputSyncThread()
{
    AudioOutputPump outputPump = CreateAudioOutputPump();
    while (outputPump.ProcessSyncOutput()) {
    }
    FinishAudioOutput(false);
}

int64_t Player::GetCurrentTime()
{
    auto now = std::chrono::steady_clock::now();
    auto now_ns = std::chrono::time_point_cast<std::chrono::nanoseconds>(now);
    return now_ns.time_since_epoch().count();
}
