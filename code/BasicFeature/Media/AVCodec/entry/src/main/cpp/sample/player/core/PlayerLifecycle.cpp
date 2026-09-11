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

#include <queue>

#include "av_codec_sample_log.h"
#include "dfx/error/av_codec_sample_error.h"

#undef LOG_TAG
#define LOG_TAG "samplePlayer"

int32_t Player::CreateAudioDecoder()
{
    CHECK_AND_RETURN_RET_LOG(audioDecoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR,
        "Audio decoder object is null");
    AVCODEC_SAMPLE_LOGW("audio mime:%{public}s", sampleInfo_.audio.audioCodecMime.c_str());
    int32_t ret = audioDecoder_->Create(sampleInfo_.audio.audioCodecMime);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        isAudioDone.store(true);
        AVCODEC_SAMPLE_LOGE("Create audio decoder failed, mime:%{public}s",
            sampleInfo_.audio.audioCodecMime.c_str());
        return ret;
    }
    if (audioDecContext_ == nullptr) {
        audioDecContext_ = std::make_unique<CodecUserData>();
    }
    audioDecContext_->isDestroyed = false;
    audioDecContext_->runningFlag = &audioWorkerRunning_;
    audioDecContext_->playbackPositionUs = &playbackPositionUs_;
    audioDecContext_->sampleInfo = &sampleInfo_;
    ret = audioDecoder_->Config(sampleInfo_, audioDecContext_.get());
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Audio Decoder config failed, mime:%{public}s, ret:%{public}d",
            sampleInfo_.audio.audioCodecMime.c_str(), ret);
        audioDecoder_->Release();
        return ret;
    }
    return CreateAudioRenderer();
}

bool Player::CanConfigureAudioTrack(const AudioSampleInfo &audioInfo) const
{
    SampleInfo candidateInfo = sampleInfo_;
    candidateInfo.audio = audioInfo;
    auto candidateDecoder = std::make_unique<AudioDecoder>();
    int32_t ret = candidateDecoder->Create(candidateInfo.audio.audioCodecMime);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGW("Audio track decoder create failed, mime: %{public}s",
            candidateInfo.audio.audioCodecMime.c_str());
        return false;
    }
    ret = candidateDecoder->ValidateConfiguration(candidateInfo);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGW("Audio track decoder configuration failed, mime: %{public}s",
            candidateInfo.audio.audioCodecMime.c_str());
        return false;
    }
    return true;
}

int32_t Player::CreateAudioRenderer()
{
    int32_t ret = OH_AudioStreamBuilder_Create(&builder_, AUDIOSTREAM_TYPE_RENDERER);
    if (ret != AUDIOSTREAM_SUCCESS || builder_ == nullptr) {
        AVCODEC_SAMPLE_LOGE("Create audio stream builder failed, ret:%{public}d", ret);
        audioDecoder_->Release();
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    const auto latencyMode = sampleInfo_.audioPlayback.enableLowLatency ?
        AUDIOSTREAM_LATENCY_MODE_FAST : AUDIOSTREAM_LATENCY_MODE_NORMAL;
    const int32_t latencyRet = OH_AudioStreamBuilder_SetLatencyMode(builder_, latencyMode);
    if (latencyRet != AUDIOSTREAM_SUCCESS) {
        AVCODEC_SAMPLE_LOGW("Set audio latency mode failed, mode: %{public}d, ret: %{public}d",
            static_cast<int32_t>(latencyMode), latencyRet);
    }
    OH_AudioStreamBuilder_SetSamplingRate(builder_, sampleInfo_.audio.audioSampleRate);
    OH_AudioStreamBuilder_SetChannelCount(builder_, sampleInfo_.audio.audioChannelCount);
    OH_AudioStreamBuilder_SetSampleFormat(builder_, AUDIOSTREAM_SAMPLE_S16LE);
    OH_AudioStreamBuilder_SetEncodingType(builder_, AUDIOSTREAM_ENCODING_TYPE_RAW);
    OH_AudioStreamBuilder_SetRendererInfo(builder_, AUDIOSTREAM_USAGE_MOVIE);
    AVCODEC_SAMPLE_LOGW("Init audioSampleRate: %{public}d, ChannelCount: %{public}d",
        sampleInfo_.audio.audioSampleRate, sampleInfo_.audio.audioChannelCount);
    OH_AudioRenderer_Callbacks callbacks;
#ifndef DEBUG_DECODE
    callbacks.OH_AudioRenderer_OnWriteData = SampleCallback::OnRenderWriteData;
#else
    callbacks.OH_AudioRenderer_OnWriteData = nullptr;
#endif
    callbacks.OH_AudioRenderer_OnStreamEvent = SampleCallback::OnRenderStreamEvent;
    callbacks.OH_AudioRenderer_OnInterruptEvent = SampleCallback::OnRenderInterruptEvent;
    callbacks.OH_AudioRenderer_OnError = SampleCallback::OnRenderError;
    OH_AudioStreamBuilder_SetRendererCallback(builder_, callbacks, audioDecContext_.get());
    ret = OH_AudioStreamBuilder_GenerateRenderer(builder_, &audioRenderer_);
    if (ret != AUDIOSTREAM_SUCCESS || audioRenderer_ == nullptr) {
        AVCODEC_SAMPLE_LOGE("Generate audio renderer failed, ret:%{public}d", ret);
        OH_AudioStreamBuilder_Destroy(builder_);
        builder_ = nullptr;
        audioDecoder_->Release();
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    const int32_t volumeRet = OH_AudioRenderer_SetVolume(audioRenderer_, sampleInfo_.audioPlayback.volume);
    if (volumeRet != AUDIOSTREAM_SUCCESS) {
        AVCODEC_SAMPLE_LOGW("Set initial audio volume failed, ret: %{public}d", volumeRet);
    }
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Player::CreateVideoDecoder()
{
    if (sampleInfo_.video.videoCodecMime.empty()) {
        isVideoDone.store(true);
        return AVCODEC_SAMPLE_ERR_OK;
    }
    int32_t ret = CreateVideoDecoderForType(activeVideoDecoderType_);
    if (ret == AVCODEC_SAMPLE_ERR_OK) {
        return ret;
    }
    if (requestedVideoDecoderType_ != AUTO || activeVideoDecoderType_ != AUTO) {
        isVideoDone.store(true);
        return ret;
    }

    AVCODEC_SAMPLE_LOGW("Automatic video decoder failed, fallback to software decoder, mime: %{public}s",
        sampleInfo_.video.videoCodecMime.c_str());
    ret = CreateVideoDecoderForType(VIDEO_SW_DECODER);
    if (ret == AVCODEC_SAMPLE_ERR_OK) {
        activeVideoDecoderType_ = VIDEO_SW_DECODER;
        softwareDecoderFallbackUsed_.store(true);
        AVCODEC_SAMPLE_LOGI("Software video decoder fallback succeeded, mime: %{public}s",
            sampleInfo_.video.videoCodecMime.c_str());
        return AVCODEC_SAMPLE_ERR_OK;
    }
    isVideoDone.store(true);
    AVCODEC_SAMPLE_LOGE("Software video decoder fallback failed, mime: %{public}s",
        sampleInfo_.video.videoCodecMime.c_str());
    return ret;
}

int32_t Player::CreateVideoDecoderForType(int32_t decoderType)
{
    ReleaseVideoDecoder();
    sampleInfo_.codec.codecType = decoderType;
    videoDecoder_ = std::make_unique<VideoDecoder>();
    AVCODEC_SAMPLE_LOGI("Create video decoder, mime: %{public}s, type: %{public}d",
        sampleInfo_.video.videoCodecMime.c_str(), decoderType);
    int32_t ret = videoDecoder_->Create(sampleInfo_.video.videoCodecMime, decoderType);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        ReleaseVideoDecoder();
        return ret;
    }
    videoDecContext_ = std::make_unique<CodecUserData>();
    videoDecContext_->runningFlag = &isStarted_;
    videoDecContext_->sampleInfo = &sampleInfo_;
    videoDecContext_->isDecFirstFrame = true;
    sampleInfo_.video.window = sampleInfo_.codec.codecRunMode == SURFACE ?
        NativeXComponentSample::PluginManager::GetInstance()->GetPluginWindow() : nullptr;
    ret = videoDecoder_->Config(sampleInfo_, videoDecContext_.get());
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGW("Video decoder configuration failed, type: %{public}d", decoderType);
        ReleaseVideoDecoder();
        return ret;
    }
    activeVideoDecoderType_ = decoderType;
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
    videoOutputFrames_.store(0);
    videoRenderedFrames_.store(0);
    videoDroppedFrames_.store(0);
    audioOutputBuffers_.store(0);
    bufferPresentFrames_.store(0);
    bufferPresentFailures_.store(0);
    bufferPresentDurationNs_.store(0);
    hasVideoTrack_.store(false);
    hasAudioTrack_.store(false);
    hdrVividConfirmed_.store(false);
    requestedVideoDecoderType_ = sampleInfo.codec.codecType;
    activeVideoDecoderType_ = requestedVideoDecoderType_;
    softwareDecoderFallbackUsed_.store(false);
    isSmartFluencySupported_ = sampleInfo.codec.isSmartFluencySupported;
    isBufferMode_.store(sampleInfo.codec.codecRunMode == BUFFER);
    thermalWarningActive_ = false;
    thermalFrameRetentionRatio_ = 0.0;
    videoDecoder_.reset();
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
    mediaInfo_.decoderType = activeVideoDecoderType_;
    mediaInfo_.decoderRunMode = sampleInfo_.codec.codecRunMode;
    mediaInfo_.decoderSyncMode = sampleInfo_.codec.codecSyncMode;
    mediaInfo_.videoDumpEnabled = sampleInfo_.output.enableVideoDump;
    mediaInfo_.softwareDecoderFallbackUsed = softwareDecoderFallbackUsed_.load();
    mediaInfo_.sourceFormatDump = sampleInfo_.source.sourceFormatDump;
    mediaInfo_.trackFormats = sampleInfo_.source.trackFormats;
}

int32_t Player::Init(SampleInfo &sampleInfo)
{
    JoinReleaseThread();
    const PlayerState previousState = stateMachine_.GetState();
    CHECK_AND_RETURN_RET_LOG(stateMachine_.BeginInitialization(), AVCODEC_SAMPLE_ERR_ERROR,
        "Init is not allowed in state: %{public}d", static_cast<int32_t>(previousState));
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
    CHECK_AND_RETURN_RET_LOG(!videoPipeline_.HasThreads(), AVCODEC_SAMPLE_ERR_ERROR,
        "Video threads already running");
    int32_t ret = videoDecoder_->Start();
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Video Decoder start failed");
        return ret;
    }
    PipelineWorkers::StartConfig startConfig;
    startConfig.syncMode = sampleInfo_.codec.codecSyncMode;
    startConfig.inputSync = [this]() { VideoDecInputSyncThread(); };
    startConfig.outputSync = [this]() { VideoDecOutputSyncThread(); };
    startConfig.inputAsync = [this]() { VideoDecInputAsyncThread(); };
    startConfig.outputAsync = [this]() { VideoDecOutputAsyncThread(); };
    startConfig.stopOnFailure = [this]() {
        isStarted_ = false;
        CancelWorkerWaits();
    };
    if (!videoPipeline_.Start(std::move(startConfig))) {
        AVCODEC_SAMPLE_LOGE("Create video threads failed");
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Player::StartAudioDecoder()
{
    CHECK_AND_RETURN_RET_LOG(!audioPipeline_.HasThreads(), AVCODEC_SAMPLE_ERR_ERROR,
        "Audio threads already running");
    {
        std::lock_guard<std::mutex> lock(audioDecContext_->outputMutex);
        std::queue<unsigned char> emptyQueue;
        audioDecContext_->renderQueue.swap(emptyQueue);
    }
    audioWorkerRunning_ = true;
    int32_t ret = audioDecoder_->Start();
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        audioWorkerRunning_ = false;
        AVCODEC_SAMPLE_LOGE("Audio Decoder start failed");
        return ret;
    }
    PipelineWorkers::StartConfig startConfig;
    startConfig.syncMode = sampleInfo_.codec.codecSyncMode;
    startConfig.inputSync = [this]() { AudioDecInputSyncThread(); };
    startConfig.outputSync = [this]() { AudioDecOutputSyncThread(); };
    startConfig.inputAsync = [this]() { AudioDecInputThread(); };
    startConfig.outputAsync = [this]() { AudioDecOutputThread(); };
    startConfig.stopOnFailure = [this]() {
        isStarted_ = false;
        CancelWorkerWaits();
    };
    if (!audioPipeline_.Start(std::move(startConfig))) {
        audioWorkerRunning_ = false;
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
    audioWorkerRunning_ = false;
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
        isAudioDone = audioDecContext_ == nullptr;
        isVideoDone = videoDecContext_ == nullptr;
    }
    isStarted_ = true;
    audioWorkerRunning_ = audioDecContext_ != nullptr;
    bool videoStarted = false;
    const int32_t ret = StartPlaybackDecoders(videoStarted);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        lock.unlock();
        CleanupAfterStartFailure(videoStarted);
        return ret;
    }
    CHECK_AND_RETURN_RET_LOG(stateMachine_.BeginPlayback(), AVCODEC_SAMPLE_ERR_ERROR,
        "Failed to enter playing state");
    AVCODEC_SAMPLE_LOGI("Player started successfully");
    StartRelease();
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Player::StartPlaybackDecoders(bool &videoStarted)
{
    int32_t ret = demuxer_->Seek(0);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Seek failed");
        return ret;
    }
    if (videoDecContext_ != nullptr) {
        ret = StartVideoDecoder();
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            return ret;
        }
        videoStarted = true;
    }
    if (audioDecContext_ == nullptr) {
        return AVCODEC_SAMPLE_ERR_OK;
    }
    ret = StartAudioDecoder();
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        return ret;
    }
    std::lock_guard<std::mutex> rendererLock(audioRendererMutex_);
    if (audioRenderer_ != nullptr && OH_AudioRenderer_Start(audioRenderer_) != AUDIOSTREAM_SUCCESS) {
        AVCODEC_SAMPLE_LOGE("Start audio renderer failed");
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    return AVCODEC_SAMPLE_ERR_OK;
}
