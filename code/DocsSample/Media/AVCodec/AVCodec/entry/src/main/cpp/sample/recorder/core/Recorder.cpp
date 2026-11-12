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

#include "Recorder.h"
#include <string>
#include "av_codec_sample_log.h"
#include "dfx/error/av_codec_sample_error.h"

#undef LOG_TAG
#define LOG_TAG "recorder"

Recorder::~Recorder()
{
    // Release线程会访问Recorder成员；析构前必须等待它和所有工作线程退出。
    StartRelease();
    (void)WaitForDone();
}

int32_t Recorder::Init(SampleInfo &sampleInfo)
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!isStarted_, AVCODEC_SAMPLE_ERR_ERROR, "Already started.");
    CHECK_AND_RETURN_RET_LOG(videoEncoder_ == nullptr && muxer_ == nullptr,
                             AVCODEC_SAMPLE_ERR_ERROR, "Already started.");
    CHECK_AND_RETURN_RET_LOG(releaseThread_ == nullptr || releaseCompleted_, AVCODEC_SAMPLE_ERR_ERROR,
                             "Previous recorder release is still running");

    JoinPreviousSessionThreads(lock);
    sessionActive_.store(true);
    sampleInfo_ = sampleInfo;
    sampleInfo_.output.sessionId = CreateCodecSessionId("recording");
    sessionReport_.Begin(sampleInfo_.output.sessionId, DescribeCodecRequest(sampleInfo_, true));
    sessionReport_.Event("initialize.begin");
    AVCODEC_SAMPLE_LOGI("Recording session: %{public}s", sampleInfo_.output.sessionId.c_str());
    ResetSessionState();
    AVCODEC_SAMPLE_LOGI("Init config: mime=%{public}s, size=%{public}dx%{public}d, fps=%{public}.2f, "
        "bitrate=%{public}" PRId64 ", pixelFormat=%{public}d, sync=%{public}d, outputFormat=%{public}d, "
        "audio=%{public}dHz/%{public}dch/%{public}" PRId64 "bps",
        sampleInfo_.video.videoCodecMime.c_str(), sampleInfo_.video.videoWidth, sampleInfo_.video.videoHeight,
        sampleInfo_.video.frameRate, sampleInfo_.video.bitrate, sampleInfo_.video.pixelFormat,
        sampleInfo_.codec.codecSyncMode, sampleInfo_.output.outputFormat, sampleInfo_.audio.audioSampleRate,
        sampleInfo_.audio.audioChannelCount, sampleInfo_.audio.audioBitRate);

    const int32_t ret = InitializeSession(sampleInfo);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        failure_.Record("recorder.initialize", ret, "创建或配置编码器、封装器失败");
        sessionReport_.Event("initialize.end", std::to_string(ret));
        sessionReport_.End("initialize_failed");
        AVCODEC_SAMPLE_LOGE("Recorder session initialization failed, ret: %{public}d", ret);
        // 初始化可能已经创建了部分codec、Muxer或采集器；统一走收尾线程，避免下一次录制复用残留资源。
        lock.unlock();
        StartRelease();
        (void)WaitForDone();
        return ret;
    }
    releaseThread_ = nullptr;
    sessionReport_.Event("initialize.end");
    AVCODEC_SAMPLE_LOGI("Succeed");
    return AVCODEC_SAMPLE_ERR_OK;
}

void Recorder::ResetSessionState()
{
    releaseResult_ = AVCODEC_SAMPLE_ERR_OK;
    audioInputStopping_ = false;
    videoOutputDone_ = false;
    secondaryVideoOutputDone_ = false;
    audioOutputDone_ = false;
    isStopping_ = false;
    secondarySampleInfo_ = {};
    primaryStats_.Reset(sampleInfo_.video);
    secondaryStats_.Reset(secondarySampleInfo_.video);
    primaryStorageAtUs_ = 0;
    secondaryStorageAtUs_ = 0;
    primaryFileBytes_ = -1;
    secondaryFileBytes_ = -1;
    failure_.Reset(sampleInfo_.video.videoCodecMime, sampleInfo_.codec.codecName,
        sampleInfo_.video.bufferInput ? BUFFER : SURFACE);
    audioStats_.Reset(sampleInfo_.audio.audioSampleRate, sampleInfo_.audio.audioChannelCount);
    videoOutputEosReceived_ = false;
    secondaryVideoOutputEosReceived_ = false;
    audioOutputEosReceived_ = false;
    isAudioEncFirstFrame_ = true;
    audioSubmittedFrames_ = 0;
    videoInputStopping_ = false;
    captureStartedUs_ = 0;
    audioCaptureOffsetUs_ = 0;
    lastVideoInputPtsUs_ = 0;
    isPaused_ = false;
    pauseRevision_ = 0;
    pauseStartedUs_ = 0;
    pausedDurationUs_ = 0;
}

int32_t Recorder::SetPaused(const std::string &sessionId, bool paused)
{
    std::lock_guard<std::mutex> inputLock(mediaInputMutex_);
    std::lock_guard<std::mutex> lock(mutex_);
    if (sessionId != sampleInfo_.output.sessionId || !isStarted_ || isStopping_ ||
        !sampleInfo_.video.bufferInput || sampleInfo_.output.enableDualOutput) {
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    if (isPaused_.load() == paused) {
        return AVCODEC_SAMPLE_ERR_OK;
    }
    const int64_t now = RecorderClockUs();
    if (paused) {
        pauseStartedUs_ = now;
    } else {
        pausedDurationUs_ += now - pauseStartedUs_;
        OH_ImageNative *stale = frameReceiver_->ReadLatest();
        if (stale != nullptr) { (void)OH_ImageNative_Release(stale); }
    }
    if (audioEncContext_ != nullptr) {
        std::lock_guard<std::mutex> audioLock(audioEncContext_->inputMutex);
        audioEncContext_->capturePaused = paused;
    }
    isPaused_.store(paused);
    if (audioEncContext_ != nullptr) { audioEncContext_->inputCond.notify_all(); }
    ++pauseRevision_;
    sessionReport_.Event(paused ? "recording.paused" : "recording.resumed");
    return AVCODEC_SAMPLE_ERR_OK;
}

void Recorder::JoinPreviousSessionThreads(std::unique_lock<std::mutex> &lock)
{
    // 已完成的收尾线程不再访问录制资源，移出锁后回收线程对象，避免join时阻塞Release获取mutex_。
    std::unique_ptr<std::thread> completedReleaseThread;
    if (releaseThread_ != nullptr) {
        completedReleaseThread = std::move(releaseThread_);
        lock.unlock();
        if (completedReleaseThread->joinable()) {
            completedReleaseThread->join();
        }
        lock.lock();
    }

    audioInputWorker_.Join();
    audioOutputWorker_.Join();
}

int32_t Recorder::Start()
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!isStarted_, AVCODEC_SAMPLE_ERR_ERROR, "Already started.");
    CHECK_AND_RETURN_RET_LOG(encContext_ != nullptr && videoEncoder_ != nullptr && muxer_ != nullptr,
        AVCODEC_SAMPLE_ERR_ERROR, "Recorder is not initialized");
    captureStartedUs_ = RecorderClockUs();
    if (frameReceiver_ != nullptr) {
        // 预览阶段可能已产生帧，开始录制时丢弃这些旧图像。
        OH_ImageNative *stale = frameReceiver_->ReadLatest();
        if (stale != nullptr) { (void)OH_ImageNative_Release(stale); }
    }
    int32_t ret = StartVideoPipeline();
    if (ret == AVCODEC_SAMPLE_ERR_OK && audioEncContext_ != nullptr) {
        ret = StartAudioPipeline();
    }
    if (ret == AVCODEC_SAMPLE_ERR_OK) {
        ret = StartVideoInputThread();
    }
    if (ret == AVCODEC_SAMPLE_ERR_OK && (!isStarted_ || encContext_->hasError ||
        (audioEncContext_ != nullptr && audioEncContext_->hasError))) {
        ret = AVCODEC_SAMPLE_ERR_ERROR;
    }
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        failure_.Record("recorder.start", ret, "启动采集、编码或工作线程失败");
        sessionReport_.End("start_failed");
        lock.unlock();
        StartRelease();
        (void)WaitForDone();
        return ret;
    }
    sessionReport_.Event("encoder.started");
    AVCODEC_SAMPLE_LOGI("Recorder started");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Recorder::StartAudioPipeline()
{
    audioEncContext_->ClearCache();
    audioCaptureOffsetUs_ = sampleInfo_.video.bufferInput ? RecorderClockUs() - captureStartedUs_ : 0;
    if (!audioCapturer_->AudioCapturerStart()) {
        failure_.Record("recorder.audio.capture", AVCODEC_SAMPLE_ERR_ERROR, "Start audio capturer failed");
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    const int32_t ret = audioEncoder_->Start();
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Start audio encoder failed");
    bool started = false;
    if (sampleInfo_.codec.codecSyncMode) {
        started = audioInputWorker_.Start([this]() { AudioEncInputSyncThread(); }) &&
            audioOutputWorker_.Start([this]() { AudioEncOutputSyncThread(); });
    } else {
        started = audioInputWorker_.Start([this]() { AudioEncInputAsyncThread(); }) &&
            audioOutputWorker_.Start([this]() { AudioEncOutputAsyncThread(); });
    }
    CHECK_AND_RETURN_RET_LOG(started, AVCODEC_SAMPLE_ERR_ERROR, "Create audio encoding workers failed");
    return AVCODEC_SAMPLE_ERR_OK;
}
