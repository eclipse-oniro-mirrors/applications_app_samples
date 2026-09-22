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

#include <bits/alltypes.h>
#include <mutex>
#include <memory>
#include <atomic>
#include <chrono>
#include <thread>
#include <unistd.h>
#include "video_encoder.h"
#include "audio_encoder.h"
#include "muxer.h"
#include "sample_info.h"
#include "audio_capturer.h"

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
    // 启动编码与采集线程。仅当 Init 成功后才能调用。
    int32_t Start();
    // 请求停止：停止采集并发送 EOS，后台线程继续排空编码器和封装器中的剩余数据。
    int32_t StopStart();
    // 等待后台收尾完成并释放录制资源；完成前不能启动下一次录制。
    int32_t StopEnd();

private:
    void VideoEncOutputAsyncThread();
    void VideoEncOutputSyncThread();
    void AudioEncInputThread();
    void AudioEncOutputThread();
    void AudioEncInputSyncThread();
    void AudioEncOutputSyncThread();
    void ReleaseThread();
    void Release();
    void ReleaseVideoEncoder();
    void ReleaseAudioEncoder();
    void StartRelease();
    void AbortRecording(const char *reason);
    void JoinPreviousSessionThreads(std::unique_lock<std::mutex> &lock);
    int32_t InitializeSession(SampleInfo &sampleInfo);
    int32_t StartVideoPipeline(std::unique_lock<std::mutex> &lock);
    int32_t StartAudioPipeline(std::unique_lock<std::mutex> &lock);
    bool WaitForAudioInputFrame(std::chrono::milliseconds timeout);
    bool SubmitAudioInputFrame(CodecBufferInfo &bufferInfo, OH_AVBuffer *buffer, bool synchronous);
    int32_t WaitForDone();

    int32_t CreateAudioEncoder();
    int32_t CreateVideoEncoder();

    // 编码器和封装器由 Recorder 独占，ReleaseThread 完成收尾后释放。
    std::unique_ptr<VideoEncoder> videoEncoder_ = nullptr;
    std::unique_ptr<AudioEncoder> audioEncoder_ = nullptr;
    std::unique_ptr<Muxer> muxer_ = nullptr;

    std::mutex mutex_;
    // EOS 表示不再送入新数据；视频和音频输出线程仍需继续取 Buffer，直到各自完成收尾。
    std::atomic<bool> isEos_{false};
    std::atomic<bool> isVideoEos_{false};
    std::atomic<bool> isStopping_{false};
    std::condition_variable videoEosCond_;
    std::mutex videoEosMutex_;
    std::atomic<bool> isStarted_{false};
    int32_t isAudioEncFirstFrame_ = true;
    std::atomic<bool> isVideoEncFirstSyncFrame_ = true;
    int64_t videoFirstSyncFramePts_ = 0;
    std::unique_ptr<std::thread> encOutputThread_ = nullptr;
    std::unique_ptr<std::thread> audioEncInputThread_ = nullptr;
    std::unique_ptr<std::thread> audioEncOutputThread_ = nullptr;
    std::unique_ptr<std::thread> releaseThread_ = nullptr;
    std::condition_variable doneCond_;
    // 仅由 mutex_ 保护。Release 完成后才允许 WaitForDone 返回或开始下一次录制。
    bool releaseCompleted_ = true;
    SampleInfo sampleInfo_;
    // 回调上下文必须在注销 codec 回调、退出所有编码线程后释放，否则回调可能访问悬空对象。
    CodecUserData *encContext_ = nullptr;
    CodecUserData *audioEncContext_ = nullptr;

    std::unique_ptr<AudioCapturer> audioCapturer_ = nullptr;
};

#endif
