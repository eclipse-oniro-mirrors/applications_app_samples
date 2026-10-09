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
#include <bits/alltypes.h>
#include <limits>
#include "av_codec_sample_log.h"
#include "dfx/error/av_codec_sample_error.h"

#undef LOG_TAG
#define LOG_TAG "recorder"

namespace {
using namespace std::chrono_literals;
constexpr int64_t MICROSECOND = 1000000;
constexpr int32_t INPUT_FRAME_BYTES = 2 * 1024;
constexpr int64_t TIMEOUT_US = 5000000;
constexpr int32_t UNIT_CONVERSION = 1000;
constexpr int32_t SLEEP_TIME = 310;
constexpr int32_t WAIT_TIME = 5;
constexpr int32_t AUDIO_INPUT_STOP_POLL_INTERVAL_MS = 10;
}

Recorder::~Recorder()
{
    // Release 线程会访问 Recorder 成员；析构前必须等待它和所有工作线程退出。
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
    sampleInfo_ = sampleInfo;
    AVCODEC_SAMPLE_LOGI("Init config: mime=%{public}s, size=%{public}dx%{public}d, fps=%{public}.2f, "
        "bitrate=%{public}" PRId64 ", pixelFormat=%{public}d, sync=%{public}d, outputFormat=%{public}d, "
        "audio=%{public}dHz/%{public}dch/%{public}" PRId64 "bps",
        sampleInfo_.video.videoCodecMime.c_str(), sampleInfo_.video.videoWidth, sampleInfo_.video.videoHeight,
        sampleInfo_.video.frameRate, sampleInfo_.video.bitrate, sampleInfo_.video.pixelFormat,
        sampleInfo_.codec.codecSyncMode, sampleInfo_.output.outputFormat, sampleInfo_.audio.audioSampleRate,
        sampleInfo_.audio.audioChannelCount, sampleInfo_.audio.audioBitRate);

    const int32_t ret = InitializeSession(sampleInfo);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Recorder session initialization failed");
    releaseThread_ = nullptr;
    AVCODEC_SAMPLE_LOGI("Succeed");
    return AVCODEC_SAMPLE_ERR_OK;
}

void Recorder::JoinPreviousSessionThreads(std::unique_lock<std::mutex> &lock)
{
    // 已完成的收尾线程不再访问录制资源，移出锁后回收线程对象，避免 join 时阻塞 Release 获取 mutex_。
    std::unique_ptr<std::thread> completedReleaseThread;
    if (releaseThread_ != nullptr) {
        completedReleaseThread = std::move(releaseThread_);
        lock.unlock();
        if (completedReleaseThread->joinable()) {
            completedReleaseThread->join();
        }
        lock.lock();
    }

    // 初始化新会话前先回收上一会话的线程对象；保留 joinable 线程会在析构时触发异常终止。
    if (audioEncInputThread_ && audioEncInputThread_->joinable()) {
        audioEncInputThread_->join();
    }
    audioEncInputThread_.reset();
    if (audioEncOutputThread_ && audioEncOutputThread_->joinable()) {
        audioEncOutputThread_->join();
    }
    audioEncOutputThread_.reset();
}

int32_t Recorder::InitializeSession(SampleInfo &sampleInfo)
{
    // 本次录制会话独占封装器、编码器和采集器，失败时由 ReleaseThread 回收已创建的资源。
    audioEncoder_ = std::make_unique<AudioEncoder>();
    audioCapturer_ = std::make_unique<AudioCapturer>();
    videoEncoder_ = std::make_unique<VideoEncoder>();
    muxer_ = std::make_unique<Muxer>();

    int32_t ret = muxer_->Create(sampleInfo_.output.outputFd, sampleInfo_.output.outputFormat);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Create muxer with fd(%{public}d) failed",
                             sampleInfo_.output.outputFd);

    ret = muxer_->Config(sampleInfo_);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Recorder muxer config failed");

    ret = CreateAudioEncoder();
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Create audio encoder failed");

    audioCapturer_->AudioCapturerInit(sampleInfo_, audioEncContext_);

    ret = CreateVideoEncoder();
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Create video encoder failed");
    sampleInfo.video.window = sampleInfo_.video.window;
    return ret;
}

int32_t Recorder::Start()
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!isStarted_, AVCODEC_SAMPLE_ERR_ERROR, "Already started.");
    CHECK_AND_RETURN_RET_LOG(encContext_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR,
                             "Already started.");
    CHECK_AND_RETURN_RET_LOG(videoEncoder_ != nullptr && muxer_ != nullptr,
                             AVCODEC_SAMPLE_ERR_ERROR, "Already started.");

    int32_t ret = StartVideoPipeline(lock);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Start video pipeline failed");
    if (audioEncContext_ != nullptr) {
        ret = StartAudioPipeline(lock);
        CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Start audio pipeline failed");
    }
    AVCODEC_SAMPLE_LOGI("Succeed");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Recorder::StartVideoPipeline(std::unique_lock<std::mutex> &lock)
{
    // 先启动 Muxer，再启动编码器，保证首个编码输出到达时容器轨道已经可写。
    int32_t ret = muxer_->Start();
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Muxer start failed");
        lock.unlock();
        StartRelease();
        return ret;
    }
    ret = videoEncoder_->Start();
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Video encoder start failed");
        lock.unlock();
        StartRelease();
        return ret;
    }

    isEos_ = false;
    isStarted_ = true;
    if (sampleInfo_.codec.codecSyncMode) {
        encOutputThread_ = std::make_unique<std::thread>(&Recorder::VideoEncOutputSyncThread, this);
    } else {
        encOutputThread_ = std::make_unique<std::thread>(&Recorder::VideoEncOutputAsyncThread, this);
    }
    if (encOutputThread_ == nullptr) {
        AVCODEC_SAMPLE_LOGE("Create thread failed");
        lock.unlock();
        StartRelease();
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Recorder::StartAudioPipeline(std::unique_lock<std::mutex> &lock)
{
    audioCapturer_->AudioCapturerStart();
    const int32_t ret = audioEncoder_->Start();
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Audio encoder start failed");
        isStarted_.store(false);
        lock.unlock();
        StartRelease();
        return ret;
    }
    isStarted_ = true;
    if (sampleInfo_.codec.codecSyncMode) {
        audioEncInputThread_ = std::make_unique<std::thread>(&Recorder::AudioEncInputSyncThread, this);
        audioEncOutputThread_ = std::make_unique<std::thread>(&Recorder::AudioEncOutputSyncThread, this);
    } else {
        audioEncInputThread_ = std::make_unique<std::thread>(&Recorder::AudioEncInputThread, this);
        audioEncOutputThread_ = std::make_unique<std::thread>(&Recorder::AudioEncOutputThread, this);
    }
    if (audioEncInputThread_ == nullptr || audioEncOutputThread_ == nullptr) {
        AVCODEC_SAMPLE_LOGE("Create thread failed");
        isStarted_.store(false);
        lock.unlock();
        StartRelease();
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    audioEncContext_->ClearCache();
    return AVCODEC_SAMPLE_ERR_OK;
}

void Recorder::VideoEncOutputSyncThread()
{
    while (true) {
        CHECK_AND_BREAK_LOG(isStarted_, "Work done, thread out");
        std::unique_lock<std::mutex> lock(encContext_->outputMutex);
        CodecBufferInfo bufferInfo;
        CHECK_AND_BREAK_LOG(videoEncoder_
                            ->GetOutputBuffer(bufferInfo, TIMEOUT_US), "VD Get out buffer failed, thread out");
        CHECK_AND_BREAK_LOG(isStarted_, "Work done, thread out");
        lock.unlock();

        if ((bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_SYNC_FRAME) ||
                (bufferInfo.attr.flags == AVCODEC_BUFFER_FLAGS_NONE)) {
                    encContext_->outputFrameCount++;
                    if (isVideoEncFirstSyncFrame_) {
                        videoFirstSyncFramePts_ = bufferInfo.attr.pts;
                        isVideoEncFirstSyncFrame_.store(false);
                    }
                    bufferInfo.attr.pts = (bufferInfo.attr.pts - videoFirstSyncFramePts_) / UNIT_CONVERSION;
        } else {
            bufferInfo.attr.pts = 0;
        }

        AVCODEC_SAMPLE_LOGW("Out buffer count: %{public}u, size: %{public}d, flag: %{public}u, pts: %{public}" PRId64,
                            encContext_->outputFrameCount, bufferInfo.attr.size, bufferInfo.attr.flags,
                            bufferInfo.attr.pts);

        // 写入完成后立即按原索引归还输出 Buffer；长期持有会耗尽编码器输出队列。
        muxer_->WriteSample(muxer_->GetVideoTrackId(), bufferInfo.buffer,
                            bufferInfo.attr);
        int32_t ret = videoEncoder_->FreeOutputBuffer(bufferInfo.bufferIndex);
        CHECK_AND_BREAK_LOG(ret == AVCODEC_SAMPLE_ERR_OK, "Encoder output thread out");

        if (bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_EOS) {
            AVCODEC_SAMPLE_LOGI("Video EOS processed (sync), notifying StopEnd");
            isVideoEos_.store(true);
            videoEosCond_.notify_all();
            AVCODEC_SAMPLE_LOGI("Video EOS complete (sync), exiting thread");
            break;
        }
    }
    AVCODEC_SAMPLE_LOGI("Exit, frame count: %{public}u", encContext_->outputFrameCount);
    StartRelease();
}

void Recorder::VideoEncOutputAsyncThread()
{
    while (true) {
        CHECK_AND_BREAK_LOG(isStarted_, "Work done, thread out");
        std::shared_ptr<CodecBufferInfo> bufferInfo = encContext_->outputBufferQueue.Dequeue();
        std::shared_lock<std::shared_mutex> codecLock(encContext_->codecMutex);
        CHECK_AND_BREAK_LOG(isStarted_, "Work done, thread out");
        CHECK_AND_CONTINUE_LOG(bufferInfo != nullptr, "Buffer queue is empty, continue");

        if ((bufferInfo->attr.flags & AVCODEC_BUFFER_FLAGS_SYNC_FRAME) ||
                (bufferInfo->attr.flags == AVCODEC_BUFFER_FLAGS_NONE)) {
                    encContext_->outputFrameCount++;
                    if (isVideoEncFirstSyncFrame_) {
                        videoFirstSyncFramePts_ = bufferInfo->attr.pts;
                        isVideoEncFirstSyncFrame_.store(false);
                    }
                    bufferInfo->attr.pts = (bufferInfo->attr.pts - videoFirstSyncFramePts_) / UNIT_CONVERSION;
        } else {
            bufferInfo->attr.pts = 0;
        }

        AVCODEC_SAMPLE_LOGW("Out buffer count: %{public}u, size: %{public}d, flag: %{public}u, pts: %{public}" PRId64,
                            encContext_->outputFrameCount, bufferInfo->attr.size, bufferInfo->attr.flags,
                            bufferInfo->attr.pts);

        // 回调队列只保存 Buffer 和索引快照；写入 Muxer 后必须尽快归还给编码器。
        muxer_->WriteSample(muxer_->GetVideoTrackId(), bufferInfo->buffer,
                            bufferInfo->attr);
        int32_t ret = videoEncoder_->FreeOutputBuffer(bufferInfo->bufferIndex);
        CHECK_AND_BREAK_LOG(ret == AVCODEC_SAMPLE_ERR_OK, "Encoder output thread out");

        if (bufferInfo->attr.flags & AVCODEC_BUFFER_FLAGS_EOS) {
            AVCODEC_SAMPLE_LOGI("Video EOS processed, notifying StopEnd");
            isVideoEos_.store(true);
            videoEosCond_.notify_all();
            AVCODEC_SAMPLE_LOGI("Video EOS complete, exiting thread");
            break;
        }
    }
    AVCODEC_SAMPLE_LOGI("Exit, frame count: %{public}u", encContext_->outputFrameCount);
    StartRelease();
}

void Recorder::StartRelease()
{
    std::lock_guard<std::mutex> lock(mutex_);
    if (releaseThread_ == nullptr) {
        // 只创建一个收尾线程，防止多个路径重复销毁 codec、窗口或回调上下文。
        AVCODEC_SAMPLE_LOGI("StartRelease: Creating release thread");
        releaseCompleted_ = false;
        releaseThread_ = std::make_unique<std::thread>(&Recorder::Release, this);
    } else {
        AVCODEC_SAMPLE_LOGI("StartRelease: Release thread already exists");
    }
}

void Recorder::ReleaseThread()
{
    if (encOutputThread_ && encOutputThread_->joinable()) {
        AVCODEC_SAMPLE_LOGI("ReleaseThread: Joining video encoding thread...");
        encOutputThread_->join();
        encOutputThread_.reset();
        AVCODEC_SAMPLE_LOGI("ReleaseThread: Video encoding thread joined");
    }
    isVideoEncFirstSyncFrame_.store(true);

    if (audioEncContext_ != nullptr) {
        if (audioEncInputThread_ && audioEncInputThread_->joinable()) {
            AVCODEC_SAMPLE_LOGI("ReleaseThread: Joining audio input thread...");
            audioEncContext_->inputCond.notify_all();
            audioEncInputThread_->join();
            audioEncInputThread_.reset();
            AVCODEC_SAMPLE_LOGI("ReleaseThread: Audio input thread joined");
        }
        if (audioEncOutputThread_ && audioEncOutputThread_->joinable()) {
            AVCODEC_SAMPLE_LOGI("ReleaseThread: Joining audio output thread...");
            audioEncOutputThread_->join();
            audioEncOutputThread_.reset();
            AVCODEC_SAMPLE_LOGI("ReleaseThread: Audio output thread joined");
        }
    } else {
        if (audioEncInputThread_ && audioEncInputThread_->joinable()) {
            AVCODEC_SAMPLE_LOGI("ReleaseThread: Joining audio input thread (no context)...");
            audioEncInputThread_->join();
            audioEncInputThread_.reset();
        }
        if (audioEncOutputThread_ && audioEncOutputThread_->joinable()) {
            AVCODEC_SAMPLE_LOGI("ReleaseThread: Joining audio output thread (no context)...");
            audioEncOutputThread_->join();
            audioEncOutputThread_.reset();
        }
    }
}

void Recorder::ReleaseVideoEncoder()
{
    if (videoEncoder_ != nullptr) {
        if (encContext_ != nullptr) {
            // 回调只借用上下文。先拒绝迟到回调，再销毁 codec 和上下文。
            encContext_->isDestroyed.store(true);
            // 清空回调队列并取得写锁后，再释放 codec Buffer。
            std::unique_lock<std::shared_mutex> codecLock(encContext_->codecMutex);
            encContext_->ClearQueue();
        }
        // codec 销毁前仍可能访问其输出 Surface，因此先释放 codec，再归还应用持有的窗口引用。
        videoEncoder_->Release();
        videoEncoder_.reset();
        if (sampleInfo_.video.window != nullptr) {
            OH_NativeWindow_DestroyNativeWindow(sampleInfo_.video.window);
            sampleInfo_.video.window = nullptr;
        }
    }
}

void Recorder::ReleaseAudioEncoder()
{
    if (audioEncoder_ != nullptr) {
        if (audioEncContext_ != nullptr) {
            // 回调只借用上下文。停止 codec 前先使迟到回调直接返回。
            audioEncContext_->isDestroyed.store(true);
            audioEncContext_->inputCond.notify_all();
            std::unique_lock<std::shared_mutex> codecLock(audioEncContext_->codecMutex);
            audioEncContext_->ClearQueue();
        }
        // 编码器停止回调后再停止采集器，最后才能释放两个组件共用的音频上下文。
        audioEncoder_->Release();
        audioEncoder_.reset();
    }
    if (audioCapturer_ != nullptr) {
        audioCapturer_->AudioCapturerRelease();
        audioCapturer_.reset();
    }
    if (audioEncContext_ != nullptr) {
        // 该上下文只在所有音频线程结束且 codec 回调已停止后释放。
        delete audioEncContext_;
        audioEncContext_ = nullptr;
    }
}

void Recorder::Release()
{
    AVCODEC_SAMPLE_LOGI("Release: Starting cleanup");

    {
        std::lock_guard<std::mutex> lock(mutex_);
        isStarted_ = false;
    }

    AVCODEC_SAMPLE_LOGI("Release: Joining encoding threads...");
    ReleaseThread();
    AVCODEC_SAMPLE_LOGI("Release: All encoding threads joined");

    {
        std::lock_guard<std::mutex> lock(mutex_);
        isEos_.store(false);
        isVideoEos_.store(false);
        isStopping_.store(false);

        // 编码线程已退出，此时容器中不再有新的样本写入，可以安全释放 Muxer。
        if (muxer_ != nullptr) {
            muxer_->Release();
            muxer_.reset();
        }
        ReleaseVideoEncoder();
        ReleaseAudioEncoder();
        if (encContext_ != nullptr) {
            // 视频 codec 已释放且输出线程已 join，回调上下文不再会被访问。
            delete encContext_;
            encContext_ = nullptr;
        }
        releaseCompleted_ = true;
    }
    doneCond_.notify_all();
    AVCODEC_SAMPLE_LOGI("Release: Cleanup complete, notifying doneCond");
}

void Recorder::AbortRecording(const char *reason)
{
    // 输入 Buffer 已交给应用但无法安全提交时，直接结束本次会话，避免 Buffer 永久滞留在应用侧。
    AVCODEC_SAMPLE_LOGE("Abort recording: %{public}s", reason);
    isEos_.store(true);
    isStopping_.store(true);
    isStarted_.store(false);
    if (audioEncContext_ != nullptr) {
        audioEncContext_->inputCond.notify_all();
        audioEncContext_->inputBufferQueue.CancelWait();
        audioEncContext_->outputBufferQueue.CancelWait();
    }
    StartRelease();
}

int32_t Recorder::WaitForDone()
{
    AVCODEC_SAMPLE_LOGI("Wait called");
    std::unique_lock<std::mutex> lock(mutex_);
    doneCond_.wait(lock, [this]() { return releaseCompleted_; });
    std::unique_ptr<std::thread> releaseThread = std::move(releaseThread_);
    lock.unlock();
    if (releaseThread != nullptr && releaseThread->joinable()) {
        releaseThread->join();
    }
    AVCODEC_SAMPLE_LOGI("Done");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Recorder::StopStart()
{
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
    if (isStarted_) {
        AVCODEC_SAMPLE_LOGI("StopEnd: Waiting for camera pipeline to flush...");
        std::this_thread::sleep_for(std::chrono::milliseconds(SLEEP_TIME));
        AVCODEC_SAMPLE_LOGI("StopEnd: Camera pipeline flush complete, signaling video EOS");
        // EOS 进入编码器后仍需继续消费输出，直到视频输出线程收到并归还 EOS Buffer。
        int32_t ret = videoEncoder_->NotifyEndOfStream();
        CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Encoder notifyEndOfStream failed");
        if (audioEncoder_ != nullptr) {
            ret = audioEncoder_->NotifyEndOfStream();
            CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Audio encoder notifyEndOfStream failed");
        }
        std::unique_lock<std::mutex> lock(videoEosMutex_);
        bool eosReceived = videoEosCond_.wait_for(lock, std::chrono::seconds(WAIT_TIME),
            [this]() { return isVideoEos_.load(); });
        if (!eosReceived) {
            AVCODEC_SAMPLE_LOGW("Timeout waiting for video EOS, proceeding with stop");
        }
        lock.unlock();
        isEos_.store(true);
        if (audioEncContext_ != nullptr) {
            audioEncContext_->inputCond.notify_all();
        }
        AVCODEC_SAMPLE_LOGI("StopEnd: Video EOS complete, waiting for audio threads to finish");
    } else {
        StartRelease();
    }
    return WaitForDone();
}

int32_t Recorder::CreateVideoEncoder()
{
    int32_t ret = videoEncoder_->Create(sampleInfo_.video.videoCodecMime);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Create video encoder failed");

    // Config 失败时先销毁 codec，再回收临时上下文，避免已注册回调借用悬空指针。
    std::unique_ptr<CodecUserData> context = std::make_unique<CodecUserData>();
    ret = videoEncoder_->Config(sampleInfo_, context.get());
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        // 配置可能已经创建输出 Surface，销毁 codec 后才能归还窗口引用。
        (void)videoEncoder_->Release();
        if (sampleInfo_.video.window != nullptr) {
            OH_NativeWindow_DestroyNativeWindow(sampleInfo_.video.window);
            sampleInfo_.video.window = nullptr;
        }
        return ret;
    }
    encContext_ = context.release();

    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Recorder::CreateAudioEncoder()
{
    int32_t ret = audioEncoder_->Create(sampleInfo_.audio.audioCodecMime);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Create audio encoder(%{public}s) failed",
                             sampleInfo_.audio.audioCodecMime.c_str());
    AVCODEC_SAMPLE_LOGI("Create audio encoder(%{public}s)", sampleInfo_.audio.audioCodecMime.c_str());

    // Config 失败时先销毁 codec，再回收临时上下文，避免已注册回调借用悬空指针。
    std::unique_ptr<CodecUserData> context = std::make_unique<CodecUserData>();
    ret = audioEncoder_->Config(sampleInfo_, context.get());
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        (void)audioEncoder_->Release();
        return ret;
    }
    audioEncContext_ = context.release();

    return AVCODEC_SAMPLE_ERR_OK;
}

// [Start Recorder::AudioEncInputThread]
void Recorder::AudioEncInputThread()
{
    while (true) {
        CHECK_AND_BREAK_LOG(!isEos_, "Work done, thread out");
        CHECK_AND_BREAK_LOG(isStarted_, "Encoder input thread out");
        if (isStopping_.load()) {
            std::this_thread::sleep_for(std::chrono::milliseconds(AUDIO_INPUT_STOP_POLL_INTERVAL_MS));
            continue;
        }
        if (!WaitForAudioInputFrame(5s)) {
            continue;
        }
        std::shared_ptr<CodecBufferInfo> bufferInfo = audioEncContext_->inputBufferQueue.Dequeue();
        std::shared_lock<std::shared_mutex> codecLock(audioEncContext_->codecMutex);
        CHECK_AND_CONTINUE_LOG(bufferInfo != nullptr, "Audio buffer queue is empty, continue");
        if (!SubmitAudioInputFrame(*bufferInfo, bufferInfo->buffer, false)) {
            break;
        }
    }
}
// [End Recorder::AudioEncInputThread]

bool Recorder::WaitForAudioInputFrame(std::chrono::milliseconds timeout)
{
    std::unique_lock<std::mutex> lock(audioEncContext_->inputMutex);
    audioEncContext_->inputCond.wait_for(lock, timeout, [this]() {
        return !isStarted_ || isEos_.load() ||
            (audioEncContext_->remainlen >= sampleInfo_.audio.audioMaxInputSize);
    });
    return isStarted_ && !isEos_.load() &&
        audioEncContext_->remainlen >= sampleInfo_.audio.audioMaxInputSize;
}

bool Recorder::SubmitAudioInputFrame(CodecBufferInfo &bufferInfo, OH_AVBuffer *buffer, bool synchronous)
{
    // Buffer 地址仅在填充并提交给编码器期间有效，不跨回调或工作线程保存。
    const int32_t inputSize = sampleInfo_.audio.audioMaxInputSize;
    const int32_t capacity = buffer == nullptr ? -1 : OH_AVBuffer_GetCapacity(buffer);
    uint8_t *inputBufferAddr = buffer == nullptr ? nullptr : OH_AVBuffer_GetAddr(buffer);
    if (inputSize <= 0 || inputBufferAddr == nullptr || capacity < inputSize) {
        AbortRecording(synchronous ? "Invalid synchronous audio input buffer" :
            "Invalid asynchronous audio input buffer");
        return false;
    }

    bool readSuccess = false;
    {
        std::unique_lock<std::mutex> lock(audioEncContext_->inputMutex);
        readSuccess = audioEncContext_->ReadCache(inputBufferAddr, inputSize);
    }
    if (!readSuccess) {
        AbortRecording(synchronous ? "Synchronous audio cache read failed" :
            "Asynchronous audio cache read failed");
        return false;
    }

    bufferInfo.buffer = buffer;
    bufferInfo.attr.size = inputSize;
    bufferInfo.attr.flags = isAudioEncFirstFrame_ ? AVCODEC_BUFFER_FLAGS_CODEC_DATA : AVCODEC_BUFFER_FLAGS_NONE;
    isAudioEncFirstFrame_ = false;
    const int32_t ret = audioEncoder_->PushInputData(bufferInfo);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AbortRecording(synchronous ? "Synchronous audio input push failed" :
            "Asynchronous audio input push failed");
        return false;
    }
    if (!synchronous) {
        audioEncContext_->inputFrameCount++;
    }
    return true;
}

// [Start Recorder::AudioEncOutputThread]
void Recorder::AudioEncOutputThread()
{
    while (true) {
        CHECK_AND_BREAK_LOG(!isEos_, "Work done, thread out");
        CHECK_AND_BREAK_LOG(isStarted_, "Work done, thread out");

        std::shared_ptr<CodecBufferInfo> bufferInfo = audioEncContext_->outputBufferQueue.Dequeue();
        std::shared_lock<std::shared_mutex> codecLock(audioEncContext_->codecMutex);
        CHECK_AND_BREAK_LOG(isStarted_, "Work done, thread out");
        CHECK_AND_CONTINUE_LOG(bufferInfo != nullptr, "Buffer queue is empty, continue");

        audioEncContext_->outputFrameCount++;
        AVCODEC_SAMPLE_LOGW(
            "Audio Out buffer count: %{public}u, size: %{public}d, flag: %{public}u, pts: %{public}" PRId64,
            audioEncContext_->outputFrameCount, bufferInfo->attr.size, bufferInfo->attr.flags, bufferInfo->attr.pts);
        // 写入后按同一索引归还。输出队列耗尽时，音频编码器会停止回调。
        muxer_->WriteSample(muxer_->GetAudioTrackId(), bufferInfo->buffer,
                            bufferInfo->attr);
        int32_t ret = audioEncoder_->FreeOutputData(bufferInfo->bufferIndex);
        CHECK_AND_BREAK_LOG(ret == AVCODEC_SAMPLE_ERR_OK, "Encoder output thread out");
    }
    AVCODEC_SAMPLE_LOGI("Exit, frame count: %{public}u", audioEncContext_->inputFrameCount);
}
// [End Recorder::AudioEncOutputThread]

// [Start Recorder::AudioEncInputSyncThread]
void Recorder::AudioEncInputSyncThread()
{
    while (true) {
        CHECK_AND_BREAK_LOG(isStarted_, "Audio encoder sync thread out");
        // 收到 EOS 后停止提交新输入，但输出线程仍会继续排空已编码样本。
        if (isEos_.load()) {
            AVCODEC_SAMPLE_LOGI("Audio input thread received EOS signal, stopping input");
            break;
        }
        // 等待缓存凑满一帧；不完整音频数据会造成时长和时间戳异常。
        if (!WaitForAudioInputFrame(100ms)) {
            if (!isStarted_ || isEos_.load()) {
                break;
            }
            continue;
        }
        // 数据充足后才申请 codec 输入 Buffer；减少申请成功后因缓存不足无法及时归还的风险。
        CodecBufferInfo bufferInfo;
        bufferInfo.bufferIndex = std::numeric_limits<uint32_t>::max();
        auto buffer = audioEncoder_->GetInputBuffer(bufferInfo, TIMEOUT_US);
        if (buffer == nullptr) {
            if (bufferInfo.bufferIndex != std::numeric_limits<uint32_t>::max()) {
                // Query 已成功但 Get 失败时，索引可能仍由应用持有；结束会话交由 codec 回收。
                AbortRecording("Synchronous audio input buffer retrieval failed");
                break;
            }
            AVCODEC_SAMPLE_LOGW("Get input buffer timeout, retry");
            continue;
        }
        if (!SubmitAudioInputFrame(bufferInfo, buffer, true)) {
            break;
        }
    }
}
// [End Recorder::AudioEncInputSyncThread]

// [Start Recorder::AudioEncOutputSyncThread]
void Recorder::AudioEncOutputSyncThread()
{
    while (true) {
        CHECK_AND_BREAK_LOG(isStarted_, "Audio encoder output thread out");
        CodecBufferInfo bufferInfo;
        int32_t errCode = audioEncoder_->GetOutputBuffer(bufferInfo, TIMEOUT_US);
        if (errCode == AVCODEC_SAMPLE_ERR_OK) {
            AVCODEC_SAMPLE_LOGI("AVCODEC_SAMPLE_ERR_OK");
        } else if (errCode == AVCODEC_SAMPLE_ERR_END || errCode == AVCODEC_SAMPLE_ERR_ERROR) {
            AVCODEC_SAMPLE_LOGW("Audio output thread received END or ERROR");
            break;
        } else {
            AVCODEC_SAMPLE_LOGW("Get output buffer timeout, retry");
            continue;
        }

        audioEncContext_->outputFrameCount++;
        AVCODEC_SAMPLE_LOGW(
            "Audio Out buffer sync count: %{public}u, size: %{public}d, flag: %{public}u, pts: %{public}" PRId64,
            audioEncContext_->outputFrameCount, bufferInfo.attr.size, bufferInfo.attr.flags, bufferInfo.attr.pts);
        // Muxer 写入不接管 Buffer，写入后仍需显式归还给音频编码器。
        muxer_->WriteSample(muxer_->GetAudioTrackId(), bufferInfo.buffer,
                            bufferInfo.attr);
        int32_t ret = audioEncoder_->FreeOutputData(bufferInfo.bufferIndex);
        CHECK_AND_BREAK_LOG(ret == AVCODEC_SAMPLE_ERR_OK, "Encoder output thread out");
        CHECK_AND_BREAK_LOG(!(bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_EOS), "Catch EOS, thread out");
    }
    // 同步模式仍由视频线程触发释放；音频先结束时，视频仍在使用 Muxer。
    AVCODEC_SAMPLE_LOGI("Audio output thread exited, waiting for video thread to trigger release");
}
// [End Recorder::AudioEncOutputSyncThread]
