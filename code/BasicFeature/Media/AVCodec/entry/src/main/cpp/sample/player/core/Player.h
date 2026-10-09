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

#ifndef VIDEO_CODEC_PLAYER_H
#define VIDEO_CODEC_PLAYER_H

#include <bits/alltypes.h>
#include <cstdint>
#include <chrono>
#include <mutex>
#include <memory>
#include <atomic>
#include <thread>
#include <unistd.h>
#include <ohaudio/native_audiorenderer.h>
#include <multimedia/player_framework/native_avbuffer.h>
#include <ohaudio/native_audiostreambuilder.h>
#include <native_window/external_window.h>
#include <fstream>
#include "output/video/renderer/BufferRenderer.h"
#include "AvSyncController.h"
#include "PlaybackClock.h"
#include "PlaybackDiagnostics.h"
#include "SeekController.h"
#include "PlayerStateMachine.h"
#include "output/pipeline/AudioPipeline.h"
#include "output/pipeline/VideoPipeline.h"
#include "output/video/sink/BufferVideoSink.h"
#include "output/video/sink/SurfaceVideoSink.h"
#include "output/video/sink/VideoSink.h"
#include "video_decoder.h"
#include "audio_decoder.h"
#include "demuxer.h"
#include "sample_info.h"
#include "plugin_manager.h"

class AudioOutputPump;

struct PlaybackInfo {
    PlayerState state = PLAYER_STATE_IDLE;
    float speed = 1.0f;
    int64_t durationUs = 0;
    int64_t positionUs = 0;
    bool hasVideo = false;
    bool hasAudio = false;
    bool smartFluencyAvailable = false;
    bool hdrVividConfirmed = false;
    bool softwareDecoderFallbackUsed = false;
    bool isBufferMode = false;
    uint64_t videoOutputFrames = 0;
    uint64_t videoRenderedFrames = 0;
    uint64_t videoDroppedFrames = 0;
    uint64_t audioOutputBuffers = 0;
    uint64_t bufferPresentFrames = 0;
    uint64_t bufferPresentFailures = 0;
    double bufferPresentAverageUs = 0.0;
    PlaybackDiagnosticsInfo diagnostics;
};

struct MediaInfo {
    bool available = false;
    int64_t fileSize = 0;
    int64_t durationUs = 0;
    int32_t trackCount = 0;
    std::string videoCodecMime;
    int32_t videoWidth = 0;
    int32_t videoHeight = 0;
    double frameRate = 0.0;
    int64_t videoBitrate = 0;
    int32_t codecProfile = 0;
    int32_t rotation = 0;
    bool hdrVividContainerSignaled = false;
    bool hdrVividConfirmed = false;
    std::string audioCodecMime;
    int32_t audioSampleFormat = 0;
    int32_t audioSampleRate = 0;
    int32_t audioChannelCount = 0;
    int64_t audioChannelLayout = 0;
    int64_t audioBitrate = 0;
    int32_t aacAdts = -1;
    int64_t codecConfigLength = 0;
    int32_t decoderType = 0;
    int32_t decoderRunMode = 0;
    int32_t decoderSyncMode = 0;
    bool videoDumpEnabled = false;
    bool softwareDecoderFallbackUsed = false;
    std::string sourceFormatDump;
    std::vector<MediaTrackFormatInfo> trackFormats;
};

class Player {
public:
    Player() = default;
    ~Player();

    int32_t Init(SampleInfo &sampleInfo);
    int32_t Start();
    int32_t Stop();
    int32_t Pause();
    int32_t Resume();
    int32_t SeekTo(int64_t positionUs);
    int32_t SelectAudioTrack(int32_t trackIndex);
    PlayerState GetState() const;
    PlaybackInfo GetPlaybackInfo() const;
    MediaInfo GetMediaInfo() const;
    bool IsSmartFluencyAvailable() const;
    void SetSpeed(float multiplier);
    void SetVolume(float volume);
    void SetTransform(int32_t hint);
    void SetSmartFluencySupported(bool supported);
    void OnThermalWarningReceived(double ratio);
    void OnThermalLevelRecovered();
    void SetBackgroundPlaybackEnabled(bool enabled);
    void SetAppBackground(bool background);

private:
    void VideoDecInputAsyncThread();
    void VideoDecOutputAsyncThread();
    void VideoDecInputSyncThread();
    void VideoDecOutputSyncThread();
    void AudioDecInputThread();
    void AudioDecOutputThread();
    void AudioDecInputSyncThread();
    void AudioDecOutputSyncThread();
    void Release();
    void StartRelease();
    void ReleaseWorker();
    void JoinReleaseThread();
    void JoinWorkerThreads();
    bool HasWorkerThreads() const;
    void ReleaseVideoDecoder();
    void ReleaseAudioDecoder();
    void PrepareForInitialization(const SampleInfo &sampleInfo);
    void ResetPlaybackState();
    void PrepareVideoSinkForPlayback();
    void UpdateSmartFluencyAvailability();
    void UpdateMediaInfoSnapshot();
    int32_t CreateTrackDecoders();
    void ConfigureAudioRendererBuilder();
    void ConfigureAudioRendererCallbacks();
    PlaybackCompletionReason GetCompletionReason(bool &playbackSucceeded) const;
    void ReleasePlaybackResources();
    int32_t CreateAudioDecoder();
    bool CanConfigureAudioTrack(const AudioSampleInfo &audioInfo) const;
    int32_t CreateAudioRenderer();
    void PrepareAudioTrackSwitch();
    int32_t RestorePreviousAudioTrackAfterFailedSwitch(std::unique_lock<std::mutex>& lock,
        const SampleInfo& oldSampleInfo, int32_t oldTrackIndex, bool resumeRenderer, float speedSnapshot);
    void CleanupAudioTrackFailure(std::unique_lock<std::mutex>& lock);
    void ReleaseAudioTrackResources();
    int32_t StartSelectedAudioTrack(bool resumeRenderer, float speedSnapshot);
    int32_t RestoreAudioTrack(int32_t oldTrackIndex, bool resumeRenderer, float speedSnapshot);
    int32_t CreateVideoDecoder();
    int32_t CreateVideoDecoderForType(int32_t decoderType);
    int64_t GetCurrentTime();
    void DumpOutput(CodecBufferInfo &bufferInfo);
    void WriteOutputFileWithStrideYUV420P(uint8_t *bufferAddr);
    void WriteOutputFileWithStrideYUV420SP(uint8_t *bufferAddr);
    void WriteOutputFileWithStrideRGBA(uint8_t *bufferAddr);
    bool PresentAndReleaseVideoBuffer(CodecBufferInfo& bufferInfo, bool render, int64_t renderTimestamp);
    void ConfirmHdrVividFromBuffer(const CodecBufferInfo &bufferInfo);
    bool EnsureVideoSink();
    int32_t PresentVideoBuffer(const VideoPresentRequest &request, bool measureBufferPresent);
    void RecordBufferPresentResult(int32_t result, std::chrono::steady_clock::time_point presentStart);
    void ProbeHdrVividFromSurface(bool render, uint64_t outputFrameCount);
    int32_t HandleInitError(std::unique_lock<std::mutex>& outerLock);
    int32_t StartVideoDecoder();
    int32_t StartAudioDecoder();
    int32_t StartPlaybackDecoders(bool &videoStarted);
    void CleanupAfterStartFailure(bool videoStarted);
    bool ProcessAudioOutput(CodecBufferInfo &bufferInfo);
    void StartAudioAfterVideoSeek();
    AudioOutputPump CreateAudioOutputPump();
    void FinishAudioOutput(bool stopRenderer);
    bool ProcessVideoWithoutAudio(CodecBufferInfo& bufferInfo,
        std::chrono::time_point<std::chrono::system_clock>& lastPushTime);
    bool ProcessVideoWithAudio(CodecBufferInfo& bufferInfo,
        std::chrono::time_point<std::chrono::system_clock>& lastPushTime);
    bool GetAudioTimestampForVideo(CodecBufferInfo& bufferInfo, int64_t& framePosition, int64_t& timestamp,
        int32_t& result);
    bool ProcessVideoWithAudioWithoutTimestamp(CodecBufferInfo& bufferInfo,
        std::chrono::time_point<std::chrono::system_clock>& lastPushTime);
    bool ProcessVideoAfterSeek(CodecBufferInfo& bufferInfo,
        std::chrono::time_point<std::chrono::system_clock>& lastPushTime);
    bool ProcessVideoDuringTrackSwitch(CodecBufferInfo& bufferInfo,
        std::chrono::time_point<std::chrono::system_clock>& lastPushTime);
    bool GetSyncVideoOutputBuffer(CodecBufferInfo& bufferInfo);
    void InitSyncVideoOutputContext();
    bool ProcessSyncVideoOutput(std::chrono::time_point<std::chrono::system_clock>& lastPushTime);
    void FinishVideoOutput();
    void CancelWorkerWaits();
    void WaitIfPaused(bool audioWorker = false);
    void StopWorkersForSeek();
    int32_t ReleaseCodecResourcesForSeek(bool retainVideoDecoder);
    bool ShouldRetainVideoDecoderForSeek() const;
    void ResetPlaybackClockForSeek(int64_t positionUs);
    bool DiscardVideoOutputBeforeSeekTarget(CodecBufferInfo &bufferInfo, bool &discarded);
    bool PrepareAudioOutputAfterSeek(CodecBufferInfo &bufferInfo);
    int32_t RecreateDecodersAfterSeek(bool hadVideo, bool hadAudio, bool videoDecoderRetained);
    void PreparePlaybackStateAfterSeek(bool hadVideo, bool hadAudio, int64_t positionUs);
    int32_t RestartAudioAfterSeek(float speedSnapshot);
    int32_t RestoreVideoPolicyAfterSeek(float speedSnapshot);
    int32_t RecreateCodecResourcesAfterSeek(bool hadVideo, bool hadAudio, bool videoDecoderRetained,
        float speedSnapshot, int64_t positionUs);
    int32_t HandleSeekFailure();
    int32_t RebuildPlaybackForSeek(bool hadVideo, bool hadAudio, float speedSnapshot, int64_t targetUs,
        bool forwardSeek);
    void ResetReleasedPlaybackState();
    void PauseForBackground();
    void ResumeFromBackground();
    bool CalculateSyncParameters(CodecBufferInfo& bufferInfo, int64_t framePosition, AvSyncDecision& decision);
    bool RenderAndRelease(CodecBufferInfo& bufferInfo, int64_t waitTimeUs, bool dropFrame);

    std::unique_ptr<std::ofstream> outputFile_ = nullptr;
    std::unique_ptr<VideoDecoder> videoDecoder_ = nullptr;
    std::shared_ptr<AudioDecoder> audioDecoder_ = nullptr;
    std::unique_ptr<Demuxer> demuxer_ = nullptr;
    
    mutable std::mutex mutex_;
    // 切换音轨会暂时释放 mutex_ 并等待音频线程退出。
    // 此锁将该操作与 Stop()、Release() 串行，禁止并发销毁流水线。
    std::mutex audioTrackOperationMutex_;
    std::atomic<bool> isStarted_ { false };
    std::atomic<bool> isReleased_ { false };
    std::atomic<bool> isAudioDone { false };
    std::atomic<bool> isVideoDone { false };
    std::atomic<bool> playbackFailed_ { false };
    std::atomic<bool> audioInterrupted_ { false };
    std::atomic<bool> audioResumePending_ { false };
    std::atomic<uint64_t> audioInterruptCount_ { 0 };
    std::atomic<int32_t> audioInterruptHint_ { 0 };
    std::atomic<float> audioVolume_ { 1.0f };
    std::atomic<bool> audioDucked_ { false };
    std::atomic<bool> appBackgrounded_ { false };
    std::atomic<bool> backgroundPlaybackEnabled_ { false };
    // 仅当后台播放关闭且播放器主动暂停时为 true，用于区分用户暂停与后台暂停。
    std::atomic<bool> backgroundPausedPlayback_ { false };
    std::atomic<bool> hasDecodedOutput_ { false };
    std::atomic<bool> stopRequested_ { false };
    std::atomic<bool> seekInProgress_ { false };
    std::atomic<int64_t> seekTargetUs_ { 0 };
    std::atomic<bool> discardVideoUntilSeekTarget_ { false };
    std::atomic<bool> discardAudioUntilSeekTarget_ { false };
    std::atomic<bool> isLoop_ { false };
    std::atomic<bool> paused_ { false };
    std::atomic<bool> audioStartPendingAfterVideoSeek_ { false };
    // 暂停跳转仍解码并送显目标帧，供跳转和逐帧操作更新画面。
    std::atomic<bool> renderSingleFrameAfterSeek_ { false };
    // 切换音轨时只停止音频线程，视频流水线继续运行。
    std::atomic<bool> audioWorkerRunning_ { false };
    std::atomic<bool> audioTrackSwitching_ { false };
    std::mutex pauseMutex_;
    std::condition_variable pauseCond_;
    std::mutex audioStartMutex_;
    std::condition_variable audioStartCond_;
    bool resumeAfterSeek_ = true;
    PlayerStateMachine stateMachine_;
    VideoPipeline videoPipeline_;
    AudioPipeline audioPipeline_;
    std::unique_ptr<std::thread> releaseThread_ = nullptr;
    std::condition_variable doneCond_;
    std::mutex doneMutex;
    SampleInfo sampleInfo_;
    // Surface 解码器配置后会持续使用该窗口；codec 销毁前保持引用，防止 XComponent 提前回收窗口。
    NativeXComponentSample::PluginManager::PluginWindowLease decoderWindowLease_;
    MediaInfo mediaInfo_;
    std::unique_ptr<CodecUserData> videoDecContext_ = nullptr;
    std::unique_ptr<CodecUserData> audioDecContext_ = nullptr;
    OH_AudioStreamBuilder* builder_ = nullptr;
    OH_AudioRenderer* audioRenderer_ = nullptr;
    mutable std::mutex audioRendererMutex_;
    
#ifdef DEBUG_DECODE
    std::ofstream audioOutputFile_; // 仅用于调试导出音频数据
#endif
    std::atomic<float> speed { 1.0f };
    std::atomic<int64_t> playbackPositionUs_ { 0 };
    std::atomic<int64_t> playbackDurationUs_ { 0 };
    std::atomic<bool> hasVideoTrack_ { false };
    std::atomic<bool> hasAudioTrack_ { false };
    std::atomic<bool> hdrVividConfirmed_ { false };
    int32_t transformHint = 0;
    bool isSmartFluencySupported_ = false;
    std::atomic<bool> smartFluencyAvailable_ { false };
    std::atomic<bool> isBufferMode_ { false };
    std::atomic<uint64_t> videoOutputFrames_ { 0 };
    std::atomic<uint64_t> videoRenderedFrames_ { 0 };
    std::atomic<uint64_t> videoDroppedFrames_ { 0 };
    std::atomic<uint64_t> audioOutputBuffers_ { 0 };
    std::atomic<uint64_t> bufferPresentFrames_ { 0 };
    std::atomic<uint64_t> bufferPresentFailures_ { 0 };
    std::atomic<uint64_t> bufferPresentDurationNs_ { 0 };
    int32_t requestedVideoDecoderType_ = AUTO;
    int32_t activeVideoDecoderType_ = AUTO;
    std::atomic<bool> softwareDecoderFallbackUsed_ { false };
    bool thermalWarningActive_ = false;
    double thermalFrameRetentionRatio_ = 0.0;
    std::unique_ptr<VideoSink> videoSink_ = nullptr;
    int32_t videoSinkRunMode_ = -1;
    PlaybackClock playbackClock_;
    PlaybackDiagnostics diagnostics_;
    AvSyncController avSyncController_;
    SeekController seekController_;
};

#endif // VIDEO_CODEC_PLAYER_H
