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

#undef LOG_TAG
#define LOG_TAG "recorder"

namespace {
constexpr auto CAMERA_DRAIN_GRACE = std::chrono::milliseconds(310);
constexpr auto ENCODER_DRAIN_TIMEOUT = std::chrono::seconds(5);
}

void Recorder::StartRelease()
{
    std::lock_guard<std::mutex> lock(mutex_);
    if (releaseThread_ == nullptr) {
        // 只创建一个收尾线程，防止多个路径重复销毁codec、窗口或回调上下文。
        AVCODEC_SAMPLE_LOGI("StartRelease: Creating release thread");
        releaseCompleted_ = false;
        releaseThread_ = std::make_unique<std::thread>(&Recorder::Release, this);
    } else {
        AVCODEC_SAMPLE_LOGI("StartRelease: Release thread already exists");
    }
}

void Recorder::ReleaseThread()
{
    {
        // 错误释放与停止后的EOS提交串行，输入线程join后才允许Destroy。
        std::lock_guard<std::mutex> inputLock(videoInputMutex_);
        videoInputStopping_.store(true);
        videoInputWorker_.Join();
    }
    videoOutputWorker_.Join();
    secondaryVideoOutputWorker_.Join();
    audioInputWorker_.Join();
    audioOutputWorker_.Join();
}

// [Start recorder_release]
void Recorder::ReleaseVideoEncoder()
{
    // 相机停止供帧、视频输入线程退出后才释放Receiver。
    frameReceiver_.reset();
    // [StartExclude recorder_release]
    // API 26要求先销毁副编码器，再销毁主编码器；主路拥有共享输入的生命周期。
    if (secondaryVideoEncoder_ != nullptr) {
        if (secondaryEncContext_ != nullptr) {
            secondaryEncContext_->isDestroyed.store(true);
            std::unique_lock<std::shared_mutex> codecLock(secondaryEncContext_->codecMutex);
            secondaryEncContext_->ClearQueue();
        }
        const int32_t ret = secondaryVideoEncoder_->Release();
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            releaseResult_ = ret;
            failure_.Record("recorder.secondary.destroy", ret, "Destroy secondary encoder failed");
        }
        secondaryVideoEncoder_.reset();
        if (secondaryEncContext_ != nullptr) {
            secondaryEncContext_.reset();
        }
    }
    // [EndExclude recorder_release]
    if (videoEncoder_ != nullptr) {
        if (encContext_ != nullptr) {
            // 回调只借用上下文。先拒绝迟到回调，再销毁codec和上下文。
            encContext_->isDestroyed.store(true);
            // 清空回调队列并取得写锁后，再释放codec buffer。
            std::unique_lock<std::shared_mutex> codecLock(encContext_->codecMutex);
            encContext_->ClearQueue();
        }
        // codec销毁前仍可能访问其输出surface，因此先释放codec，再归还应用持有的窗口引用。
        const int32_t ret = videoEncoder_->Release();
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            releaseResult_ = ret;
            failure_.Record("recorder.video.destroy", ret, "Destroy video encoder failed");
        }
        videoEncoder_.reset();
        if (sampleInfo_.video.window != nullptr) {
            OH_NativeWindow_DestroyNativeWindow(sampleInfo_.video.window);
            sampleInfo_.video.window = nullptr;
        }
    }
}
// [End recorder_release]

void Recorder::ReleaseAudioEncoder()
{
    if (audioEncoder_ != nullptr) {
        if (audioEncContext_ != nullptr) {
            // 回调只借用上下文。停止codec前先使迟到回调直接返回。
            audioEncContext_->isDestroyed.store(true);
            audioEncContext_->inputCond.notify_all();
            std::unique_lock<std::shared_mutex> codecLock(audioEncContext_->codecMutex);
            audioEncContext_->ClearQueue();
        }
        // 编码器停止回调后再停止采集器，最后才能释放两个组件共用的音频上下文。
        const int32_t ret = audioEncoder_->Release();
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            releaseResult_ = ret;
            failure_.Record("recorder.audio.destroy", ret, "Destroy audio encoder failed");
        }
        audioEncoder_.reset();
    }
    if (audioCapturer_ != nullptr) {
        audioCapturer_->AudioCapturerRelease();
        audioCapturer_.reset();
    }
    if (audioEncContext_ != nullptr) {
        // 该上下文只在所有音频线程结束且codec回调已停止后释放。
        audioEncContext_.reset();
    }
}

void Recorder::Release()
{
    AVCODEC_SAMPLE_LOGI("Release: Starting cleanup");

    {
        std::lock_guard<std::mutex> lock(mutex_);
        isStarted_ = false;
        audioInputStopping_ = true;
        videoInputStopping_ = true;
    }
    CancelWorkerWaits();

    AVCODEC_SAMPLE_LOGI("Release: Joining encoding threads...");
    ReleaseThread();
    AVCODEC_SAMPLE_LOGI("Release: All encoding threads joined");

    {
        std::lock_guard<std::mutex> lock(mutex_);
        ReleaseMuxers();
        ReleaseVideoEncoder();
        ReleaseAudioEncoder();
        audioStats_.Stop();
        CloseVideoDumpFiles();
        primaryStats_.Stop();
        secondaryStats_.Stop();
        RefreshStreamStorage(true, true);
        if (sampleInfo_.output.enableDualOutput) {
            RefreshStreamStorage(false, true);
        }
        sessionActive_.store(false);
        if (encContext_ != nullptr) {
            // 视频codec已释放且输出线程已join，回调上下文不再会被访问。
            encContext_.reset();
        }
        releaseCompleted_ = true;
        sessionReport_.Event("native.released");
    }
    doneCond_.notify_all();
    AVCODEC_SAMPLE_LOGI("Release: Cleanup complete, notifying doneCond");
}

void Recorder::CancelWorkerWaits()
{
    for (auto *context : {encContext_.get(), secondaryEncContext_.get(), audioEncContext_.get()}) {
        if (context != nullptr) {
            context->inputCond.notify_all();
            context->inputBufferQueue.CancelWait();
            context->outputBufferQueue.CancelWait();
        }
    }
    std::lock_guard<std::mutex> lock(outputDoneMutex_);
    outputDoneCond_.notify_all();
}

void Recorder::AbortRecording(const char *reason)
{
    sessionReport_.Event("recording.aborted", reason);
    sessionReport_.End("output_failed");
    failure_.Record("recorder.output", AVCODEC_SAMPLE_ERR_ERROR, reason);
    AVCODEC_SAMPLE_LOGE("Abort recording: %{public}s", reason);
    const bool wasStopping = isStopping_.exchange(true);
    audioInputStopping_.store(true);
    videoInputStopping_.store(true);
    isStarted_.store(false);
    CancelWorkerWaits();
    if (!wasStopping) {
        StartRelease();
    }
}

int32_t Recorder::WaitForDone()
{
    AVCODEC_SAMPLE_LOGI("Wait called");
    std::unique_lock<std::mutex> lock(mutex_);
    doneCond_.wait(lock, [this]() { return releaseCompleted_; });
    const int32_t result = releaseResult_ != AVCODEC_SAMPLE_ERR_OK ? releaseResult_ :
        (failure_.Snapshot().stage.empty() ? AVCODEC_SAMPLE_ERR_OK : AVCODEC_SAMPLE_ERR_ERROR);
    std::unique_ptr<std::thread> releaseThread = std::move(releaseThread_);
    lock.unlock();
    if (releaseThread != nullptr && releaseThread->joinable()) {
        releaseThread->join();
    }
    AVCODEC_SAMPLE_LOGI("Done");
    return result;
}

int32_t Recorder::StopStart()
{
    sessionReport_.Event("stop.requested");
    sessionReport_.End("user_stop");
    std::lock_guard<std::mutex> lock(mutex_);
    if (isStarted_) {
        isStopping_.store(true);
        AVCODEC_SAMPLE_LOGI("StopStart: isStopping set to true, audio continues");
        return AVCODEC_SAMPLE_ERR_OK;
    } else {
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
}

int32_t Recorder::StopEnd()
{
    {
        // 先关闭动态参数入口，再给相机排空和编码器EOS留出收尾时间。
        std::lock_guard<std::mutex> lock(mutex_);
        isStopping_.store(true);
    }
    if (!isStarted_) {
        StartRelease();
        return WaitForDone();
    }

    AVCODEC_SAMPLE_LOGI("StopEnd: Waiting for camera pipeline to flush...");
    std::this_thread::sleep_for(CAMERA_DRAIN_GRACE);
    int32_t ret = SendVideoEndOfStream();
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        return AbortAndWait(ret, "Video encoder notifyEndOfStream failed");
    }
    ret = SendAudioEndOfStream();
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        return AbortAndWait(ret, "Audio encoder notifyEndOfStream failed");
    }
    ret = WaitForEncoderEndOfStream();
    AVCODEC_SAMPLE_LOGI("StopEnd: Encoder drain finished, ret: %{public}d", ret);
    StartRelease();
    const int32_t releaseRet = WaitForDone();
    return ret == AVCODEC_SAMPLE_ERR_OK ? releaseRet : ret;
}

int32_t Recorder::SendVideoEndOfStream()
{
    if (sampleInfo_.video.bufferInput) { return SendBufferVideoEndOfStream(); }
    // EOS入队后仍需消费输出，直到每路视频线程归还EOS buffer。
    int32_t ret = videoEncoder_->NotifyEndOfStream();
    if (ret != AVCODEC_SAMPLE_ERR_OK || secondaryVideoEncoder_ == nullptr) {
        return ret;
    }
    return secondaryVideoEncoder_->NotifyEndOfStream();
}

int32_t Recorder::SendAudioEndOfStream()
{
    // 先结束并join AAC输入线程，再发EOS；输出线程会排空剩余编码数据。
    audioInputStopping_.store(true);
    if (audioEncContext_ != nullptr) {
        audioEncContext_->inputCond.notify_all();
    }
    audioInputWorker_.Join();
    if (audioEncoder_ == nullptr) {
        return AVCODEC_SAMPLE_ERR_OK;
    }
    return sampleInfo_.codec.codecSyncMode ? SendAudioEndOfStreamSync() : SendAudioEndOfStreamAsync();
}

int32_t Recorder::WaitForEncoderEndOfStream()
{
    const int32_t videoRet = WaitForVideoEndOfStream();
    const int32_t audioRet = WaitForAudioEndOfStream();
    return videoRet == AVCODEC_SAMPLE_ERR_OK ? audioRet : videoRet;
}

int32_t Recorder::WaitForVideoEndOfStream()
{
    std::unique_lock<std::mutex> lock(outputDoneMutex_);
    const bool done = outputDoneCond_.wait_for(lock, ENCODER_DRAIN_TIMEOUT, [this]() {
        return !isStarted_ || (videoOutputDone_ && (secondaryVideoEncoder_ == nullptr || secondaryVideoOutputDone_));
    });
    if (!done || !videoOutputEosReceived_ ||
        (sampleInfo_.output.enableDualOutput && !secondaryVideoOutputEosReceived_)) {
        sessionReport_.Event("video.drain", done ? "ended_without_eos" : "timeout");
        sessionReport_.End(done ? "video_eos_missing" : "video_eos_timeout");
        failure_.Record("recorder.video.drain", AVCODEC_SAMPLE_ERR_ERROR,
            done ? "Video output ended without EOS" : "Video EOS drain timed out");
        AVCODEC_SAMPLE_LOGW("Video drain failed: done=%{public}d", done);
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Recorder::WaitForAudioEndOfStream()
{
    if (audioEncoder_ == nullptr) {
        return AVCODEC_SAMPLE_ERR_OK;
    }
    std::unique_lock<std::mutex> lock(outputDoneMutex_);
    const bool done = outputDoneCond_.wait_for(lock, ENCODER_DRAIN_TIMEOUT, [this]() {
        return !isStarted_ || audioOutputDone_.load();
    });
    if (!done || !audioOutputEosReceived_) {
        sessionReport_.Event("audio.drain", done ? "ended_without_eos" : "timeout");
        sessionReport_.End(done ? "audio_eos_missing" : "audio_eos_timeout");
        failure_.Record("recorder.audio.drain", AVCODEC_SAMPLE_ERR_ERROR,
            done ? "Audio output ended without EOS" : "Audio EOS drain timed out");
        AVCODEC_SAMPLE_LOGW("Audio drain failed: done=%{public}d", done);
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Recorder::AbortAndWait(int32_t errorCode, const char *reason)
{
    AbortRecording(reason);
    StartRelease();
    (void)WaitForDone();
    return errorCode;
}

void Recorder::ReleaseMuxers()
{
    // 所有输出线程已join；先结束容器写入并刷新文件尾，再销毁codec。
    if (muxer_ != nullptr) {
        const int32_t ret = muxer_->Release();
        sessionReport_.Event("primary.muxer_released", std::to_string(ret));
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            releaseResult_ = ret;
            failure_.Record("recorder.primary.muxer", ret, "Destroy primary muxer failed");
            AVCODEC_SAMPLE_LOGE("Release primary muxer failed, ret: %{public}d", ret);
        }
        muxer_.reset();
    }
    if (secondaryMuxer_ != nullptr) {
        const int32_t ret = secondaryMuxer_->Release();
        sessionReport_.Event("secondary.muxer_released", std::to_string(ret));
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            releaseResult_ = ret;
            failure_.Record("recorder.secondary.muxer", ret, "Destroy secondary muxer failed");
            AVCODEC_SAMPLE_LOGE("Release secondary muxer failed, ret: %{public}d", ret);
        }
        secondaryMuxer_.reset();
    }
}
