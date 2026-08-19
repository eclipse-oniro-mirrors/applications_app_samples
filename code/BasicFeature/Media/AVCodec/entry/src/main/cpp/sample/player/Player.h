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
#include "BufferRenderer.h"
#include "video_decoder.h"
#include "audio_decoder.h"
#include "demuxer.h"
#include "sample_info.h"
#include "plugin_manager.h"

class AudioOutputPump;

enum PlayerState : int32_t {
    IDLE = 0,
    INITIALIZING,
    READY,
    PLAYING,
    STOPPING,
    SEEKING,
};

struct PlaybackInfo {
    PlayerState state = PlayerState::IDLE;
    float speed = 1.0f;
    int64_t durationUs = 0;
    int64_t positionUs = 0;
    bool hasVideo = false;
    bool hasAudio = false;
    bool smartFluencyAvailable = false;
    bool hdrVividConfirmed = false;
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
    std::string sourceFormatDump;
    std::vector<MediaTrackFormatInfo> trackFormats;
};

class Player {
public:
    Player(){};
    ~Player();
    
    static Player& GetInstance()
    {
        static Player player;
        return player;
    }

    int32_t Init(SampleInfo &sampleInfo);
    int32_t Start();
    int32_t Stop();
    int32_t SeekTo(int64_t positionUs);
    PlayerState GetState() const;
    PlaybackInfo GetPlaybackInfo() const;
    MediaInfo GetMediaInfo() const;
    bool IsSmartFluencyAvailable() const;
    void SetSpeed(float multiplier);
    void SetTransform(int32_t hint);
    void SetSmartFluencySupported(bool supported);
    void OnThermalWarningReceived(double ratio);
    void OnThermalLevelRecovered();

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
    void UpdateSmartFluencyAvailability();
    void UpdateMediaInfoSnapshot();
    PlaybackCompletionReason GetCompletionReason(bool &playbackSucceeded) const;
    void ReleasePlaybackResources();
    int32_t CreateAudioDecoder();
    int32_t CreateVideoDecoder();
    int64_t GetCurrentTime();
    void DumpOutput(CodecBufferInfo &bufferInfo);
    void WriteOutputFileWithStrideYUV420P(uint8_t *bufferAddr);
    void WriteOutputFileWithStrideYUV420SP(uint8_t *bufferAddr);
    void WriteOutputFileWithStrideRGBA(uint8_t *bufferAddr);
    bool PresentAndReleaseVideoBuffer(CodecBufferInfo& bufferInfo, bool render, int64_t renderTimestamp);
    bool RenderBufferToWindow(CodecBufferInfo& bufferInfo, int64_t renderTimestamp);
    int32_t HandleInitError(std::unique_lock<std::mutex>& outerLock);
    int32_t StartVideoDecoder();
    int32_t StartAudioDecoder();
    void CleanupAfterStartFailure(bool videoStarted);
    bool ProcessAudioOutput(CodecBufferInfo &bufferInfo);
    AudioOutputPump CreateAudioOutputPump();
    void FinishAudioOutput(bool stopRenderer);
    bool ProcessVideoWithoutAudio(CodecBufferInfo& bufferInfo,
        std::chrono::time_point<std::chrono::system_clock>& lastPushTime);
    bool ProcessVideoWithAudio(CodecBufferInfo& bufferInfo,
        std::chrono::time_point<std::chrono::system_clock>& lastPushTime);
    bool GetSyncVideoOutputBuffer(CodecBufferInfo& bufferInfo);
    void InitSyncVideoOutputContext();
    bool ProcessSyncVideoOutput(std::chrono::time_point<std::chrono::system_clock>& lastPushTime);
    void FinishVideoOutput();
    void CancelWorkerWaits();
    void StopWorkersForSeek();
    void ReleaseCodecResourcesForSeek();
    void ResetPlaybackClockForSeek(int64_t positionUs);
    bool DiscardVideoOutputBeforeSeekTarget(CodecBufferInfo &bufferInfo, bool &discarded);
    bool GetAudioSeekBufferLayout(CodecBufferInfo &bufferInfo, int32_t &sampleRate,
        int32_t &capacity, int64_t &bytesPerFrame);
    bool TrimAudioOutputToSeekTarget(CodecBufferInfo &bufferInfo, int64_t targetUs,
        int32_t sampleRate, int32_t capacity, int64_t bytesPerFrame);
    bool PrepareAudioOutputAfterSeek(CodecBufferInfo &bufferInfo);
    int32_t RecreateDecodersAfterSeek(bool hadVideo, bool hadAudio);
    void PreparePlaybackStateAfterSeek(bool hadVideo, bool hadAudio, int64_t positionUs);
    int32_t RestartAudioAfterSeek(float speedSnapshot);
    int32_t RestoreVideoPolicyAfterSeek(float speedSnapshot);
    int32_t RecreateCodecResourcesAfterSeek(bool hadVideo, bool hadAudio, float speedSnapshot,
        int64_t positionUs);
    int32_t HandleSeekFailure();
    bool CalculateSyncParameters(CodecBufferInfo& bufferInfo, int64_t framePosition,
        int64_t& waitTimeUs, bool& dropFrame);
    bool RenderAndRelease(CodecBufferInfo& bufferInfo, int64_t waitTimeUs, bool dropFrame);

    std::unique_ptr<std::ofstream> outputFile_ = nullptr;
    std::unique_ptr<VideoDecoder> videoDecoder_ = nullptr;
    std::shared_ptr<AudioDecoder> audioDecoder_ = nullptr;
    std::unique_ptr<Demuxer> demuxer_ = nullptr;
    
    mutable std::mutex mutex_;
    std::atomic<bool> isStarted_ { false };
    std::atomic<bool> isReleased_ { false };
    std::atomic<bool> isAudioDone { false };
    std::atomic<bool> isVideoDone { false };
    std::atomic<bool> playbackFailed_ { false };
    std::atomic<bool> hasDecodedOutput_ { false };
    std::atomic<bool> stopRequested_ { false };
    std::atomic<bool> seekInProgress_ { false };
    std::atomic<int64_t> seekTargetUs_ { 0 };
    std::atomic<bool> discardVideoUntilSeekTarget_ { false };
    std::atomic<bool> discardAudioUntilSeekTarget_ { false };
    std::atomic<bool> isLoop_ { false };
    std::atomic<PlayerState> state_ { PlayerState::IDLE };
    std::unique_ptr<std::thread> videoDecInputThread_ = nullptr;
    std::unique_ptr<std::thread> videoDecOutputThread_ = nullptr;
    std::unique_ptr<std::thread> audioDecInputThread_ = nullptr;
    std::unique_ptr<std::thread> audioDecOutputThread_ = nullptr;
    std::unique_ptr<std::thread> releaseThread_ = nullptr;
    std::condition_variable doneCond_;
    std::mutex doneMutex;
    SampleInfo sampleInfo_;
    MediaInfo mediaInfo_;
    std::unique_ptr<CodecUserData> videoDecContext_ = nullptr;
    std::unique_ptr<CodecUserData> audioDecContext_ = nullptr;
    OH_AudioStreamBuilder* builder_ = nullptr;
    OH_AudioRenderer* audioRenderer_ = nullptr;
    
    int64_t nowTimeStamp = 0;
    int64_t audioTimeStamp = 0;
    int64_t writtenSampleCnt = 0;
    int64_t audioBufferPts = 0;
#ifdef DEBUG_DECODE
    std::ofstream audioOutputFile_; // for debug
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
    bool thermalWarningActive_ = false;
    double thermalFrameRetentionRatio_ = 0.0;
    BufferRenderer bufferRenderer_;
};

#endif // VIDEO_CODEC_PLAYER_H
