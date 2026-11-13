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

#ifndef VIDEO_CODEC_SAMPLE_RECODER_H
#define VIDEO_CODEC_SAMPLE_RECODER_H

#include <mutex>
#include <memory>
#include <atomic>
#include <chrono>
#include <fstream>
#include <thread>
#include <unistd.h>
#include "video_encoder.h"
#include "audio_encoder.h"
#include "muxer.h"
#include "sample_info.h"
#include "audio_capturer.h"
#include "../output/dump/RecorderDumpWriter.h"
#include "../diagnostics/RecorderOutputStats.h"
#include "SessionReport.h"
#include "../diagnostics/RecorderAudioStats.h"
#include "../input/video/RecorderFrameReceiver.h"
#include "RecorderWorker.h"

class Recorder {
public:
    Recorder(){};
    ~Recorder();

    static Recorder &GetInstance()
    {
        static Recorder recorder;
        return recorder;
    }

    // 创建编码器、封装器和音频采集器，但不启动数据流；失败时由调用方根据返回值提示配置不可用。
    int32_t Init(SampleInfo &sampleInfo);
    // 启动编码与采集线程。仅当Init成功后才能调用。
    int32_t Start();
    // 标记录制正在停止，拒绝动态参数更新；相机停流后由StopEnd发送EOS并等待输出排空。
    int32_t StopStart();
    // 等待后台收尾完成并释放录制资源；完成前不能启动下一次录制。
    int32_t StopEnd();
    OperationFailureInfo GetFailure() const { return failure_.Snapshot(); }
    bool IsSessionActive() const { return sessionActive_.load(); }
    uint64_t GetCameraInputSurfaceId() const;
    SessionReportInfo GetSessionReport() const { return sessionReport_.Snapshot(); }
    RecorderAudioInfo GetAudioStats() const { return audioStats_.Snapshot(); }
    void MarkStage(const std::string &id, const std::string &stage, const std::string &result);
    int32_t UpdateVideoParameters(const std::string &sessionId, bool primary, int64_t bitrate, bool requestKeyFrame);
    int32_t SetPaused(const std::string &sessionId, bool paused);
    RecorderStreamInfo GetOutputStats(bool primary) const
    {
        return primary ? primaryStats_.Snapshot() : secondaryStats_.Snapshot();
    }

private:
    static constexpr int64_t codecBufferTimeoutUs = 100000;
    struct VideoInputState {
        int64_t firstTimestampNs = -1;
        int64_t lastTimestampNs = -1;
        int64_t firstOffsetUs = 0;
        int64_t initialPausedUs = 0;
        uint64_t pauseRevision = 0;
        int64_t lastSubmittedUs = 0;
    };
    void VideoEncOutputAsyncThread();
    void VideoEncOutputSyncThread();
    void SecondaryVideoEncOutputAsyncThread();
    void SecondaryVideoEncOutputSyncThread();
    bool ProcessVideoOutputBuffer(CodecBufferInfo &bufferInfo, bool isPrimary, int64_t receivedAtUs);
    void RefreshStreamStorage(bool primary, bool force = false);
    void CaptureEncoderDescription(bool primary);
    void FinishVideoOutputThread(CodecUserData *context, bool isPrimary);
    void AudioEncInputAsyncThread();
    void AudioEncOutputAsyncThread();
    void AudioEncInputSyncThread();
    void AudioEncOutputSyncThread();
    bool ProcessAudioOutputBuffer(CodecBufferInfo &bufferInfo);
    void ReleaseThread();
    void Release();
    void ReleaseVideoEncoder();
    void ReleaseAudioEncoder();
    void StartRelease();
    void AbortRecording(const char *reason);
    // 将编码器输出的原始视频码流写入诊断文件；失败只记录日志，不影响正常封装。
    void DumpVideoOutput(const CodecBufferInfo &bufferInfo, bool isPrimary);
    void CloseVideoDumpFiles();
    void OpenVideoDumpFiles();
    void JoinPreviousSessionThreads(std::unique_lock<std::mutex> &lock);
    void ResetSessionState();
    int32_t InitializeSession(SampleInfo &sampleInfo);
    int32_t InitializeSecondaryMuxer();
    void ReleaseMuxers();
    void NormalizeVideoOutputTimestamp(CodecUserData &context, CodecBufferInfo &bufferInfo);
    void RecordVideoOutput(CodecUserData *context, const CodecBufferInfo &bufferInfo, bool isPrimary);
    int32_t StartVideoPipeline();
    int32_t StartVideoMuxers();
    int32_t StartVideoEncoders();
    int32_t StartVideoOutputThreads();
    int32_t StartAudioPipeline();
    int32_t SendVideoEndOfStream();
    int32_t StartVideoInputThread();
    void VideoEncInputSyncThread();
    void VideoEncInputAsyncThread();
    OH_ImageNative *ReadVideoInputImage(VideoInputState &state);
    bool SubmitVideoInputImage(OH_ImageNative *image, CodecBufferInfo &info, VideoInputState &state,
        int64_t receivedAtUs);
    bool InitSyncVideoInputContext();
    int32_t SendBufferVideoEndOfStream();
    int32_t SendBufferVideoEndOfStreamSync();
    int32_t SendBufferVideoEndOfStreamAsync();
    int32_t SendAudioEndOfStream();
    int32_t SendAudioEndOfStreamSync();
    int32_t SendAudioEndOfStreamAsync();
    int32_t WaitForEncoderEndOfStream();
    int32_t WaitForVideoEndOfStream();
    int32_t WaitForAudioEndOfStream();
    void CancelWorkerWaits();
    void FinishAudioOutputThread();
    int32_t AbortAndWait(int32_t errorCode, const char *reason);
    bool WaitForAudioInputFrame(std::chrono::milliseconds timeout);
    bool SubmitAudioInputFrame(CodecBufferInfo &bufferInfo);
    int32_t WaitForDone();

    int32_t CreateAudioEncoder();
    int32_t CreateVideoEncoder();

    // 编码器和封装器由Recorder独占，ReleaseThread完成收尾后释放。
    std::unique_ptr<VideoEncoder> videoEncoder_ = nullptr;
    std::unique_ptr<RecorderFrameReceiver> frameReceiver_ = nullptr;
    RecorderWorker videoInputWorker_;
    std::mutex videoInputMutex_;
    // 暂停切换与音视频输入提交共用边界；需要mutex_时必须先取得此锁。
    std::mutex mediaInputMutex_;
    std::atomic<bool> isPaused_{false};
    std::atomic<uint64_t> pauseRevision_{0};
    int64_t pauseStartedUs_ = 0;
    int64_t pausedDurationUs_ = 0;
    std::atomic<bool> videoInputStopping_{false};
    int64_t captureStartedUs_ = 0;
    int64_t audioCaptureOffsetUs_ = 0;
    int64_t lastVideoInputPtsUs_ = 0;
    std::unique_ptr<VideoEncoder> secondaryVideoEncoder_ = nullptr;
    std::unique_ptr<AudioEncoder> audioEncoder_ = nullptr;
    std::unique_ptr<Muxer> muxer_ = nullptr;
    std::unique_ptr<Muxer> secondaryMuxer_ = nullptr;

    std::mutex mutex_;
    // 输入停止、输出线程结束和输出EOS分别记录，输入结束不能让输出提前退出。
    std::atomic<bool> audioInputStopping_{false};
    std::atomic<bool> videoOutputDone_{false};
    std::atomic<bool> secondaryVideoOutputDone_{false};
    std::atomic<bool> audioOutputDone_{false};
    std::atomic<bool> videoOutputEosReceived_{false};
    std::atomic<bool> secondaryVideoOutputEosReceived_{false};
    std::atomic<bool> audioOutputEosReceived_{false};
    std::atomic<bool> isStopping_{false};
    std::condition_variable outputDoneCond_;
    std::mutex outputDoneMutex_;
    std::atomic<bool> isStarted_{false};
    std::atomic<bool> sessionActive_{false};
    bool isAudioEncFirstFrame_ = true;
    int64_t audioSubmittedFrames_ = 0;
    RecorderWorker videoOutputWorker_;
    RecorderWorker secondaryVideoOutputWorker_;
    RecorderWorker audioInputWorker_;
    RecorderWorker audioOutputWorker_;
    std::unique_ptr<std::thread> releaseThread_ = nullptr;
    std::condition_variable doneCond_;
    // 仅由mutex_保护。Release完成后才允许WaitForDone返回或开始下一次录制。
    bool releaseCompleted_ = true;
    int32_t releaseResult_ = AVCODEC_SAMPLE_ERR_OK;
    SampleInfo sampleInfo_;
    SampleInfo secondarySampleInfo_;
    // 回调上下文必须在注销codec回调、退出所有编码线程后释放，否则回调可能访问悬空对象。
    std::unique_ptr<CodecUserData> encContext_;
    std::unique_ptr<CodecUserData> secondaryEncContext_;
    std::unique_ptr<CodecUserData> audioEncContext_;

    RecorderDumpWriter primaryDump_;
    RecorderDumpWriter secondaryDump_;
    OperationFailure failure_;
    RecorderOutputStats primaryStats_;
    RecorderOutputStats secondaryStats_;
    SessionReport sessionReport_;
    RecorderAudioStats audioStats_;
    int64_t primaryStorageAtUs_ = 0;
    int64_t secondaryStorageAtUs_ = 0;
    int64_t primaryFileBytes_ = -1;
    int64_t secondaryFileBytes_ = -1;

    std::unique_ptr<AudioCapturer> audioCapturer_ = nullptr;
};

#endif
