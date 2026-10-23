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
#include <string>
#include <sys/stat.h>
#include <sys/statvfs.h>
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
    sessionActive_.store(true);
    sampleInfo_ = sampleInfo;
    sampleInfo_.output.sessionId = CreateCodecSessionId("recording");
    sessionReport_.Begin(sampleInfo_.output.sessionId, DescribeCodecRequest(sampleInfo_, true));
    sessionReport_.Event("initialize.begin");
    AVCODEC_SAMPLE_LOGI("Recording session: %{public}s", sampleInfo_.output.sessionId.c_str());
    secondarySampleInfo_ = {};
    primaryStats_.Reset(sampleInfo_.video);
    secondaryStats_.Reset(secondarySampleInfo_.video);
    primaryStorageAtUs_ = secondaryStorageAtUs_ = 0;
    primaryFileBytes_ = secondaryFileBytes_ = -1;
    failure_.Reset(sampleInfo_.video.videoCodecMime, sampleInfo_.codec.codecName, SURFACE);
    isAudioEos_.store(false);
    audioStats_.Reset(sampleInfo_.audio.audioSampleRate, sampleInfo_.audio.audioChannelCount);
    primaryEosReceived_ = false;
    secondaryEosReceived_ = false;
    audioEosReceived_ = false;
    isAudioEncFirstFrame_ = true;
    audioSubmittedFrames_ = 0;
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
        // 初始化可能已经创建了部分 codec、Muxer 或采集器；统一走收尾线程，避免下一次录制复用残留资源。
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

int32_t Recorder::Start()
{
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!isStarted_, AVCODEC_SAMPLE_ERR_ERROR, "Already started.");
    CHECK_AND_RETURN_RET_LOG(encContext_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR,
                             "Already started.");
    CHECK_AND_RETURN_RET_LOG(videoEncoder_ != nullptr && muxer_ != nullptr,
                             AVCODEC_SAMPLE_ERR_ERROR, "Already started.");

    int32_t ret = StartVideoPipeline();
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        failure_.Record("recorder.video.start", ret, "启动视频编码或封装链路失败");
        sessionReport_.End("video_start_failed");
        lock.unlock();
        StartRelease();
        return ret;
    }
    if (audioEncContext_ != nullptr) {
        ret = StartAudioPipeline(lock);
        CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Start audio pipeline failed");
    }
    sessionReport_.Event("encoder.started");
    AVCODEC_SAMPLE_LOGI("Succeed");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t Recorder::StartAudioPipeline(std::unique_lock<std::mutex> &lock)
{
    // 先清缓存再启动采集，避免在采集回调运行时无锁修改 cache。
    audioEncContext_->ClearCache();
    if (!audioCapturer_->AudioCapturerStart()) {
        failure_.Record("recorder.audio.capture", AVCODEC_SAMPLE_ERR_ERROR, "Start audio capturer failed");
        sessionReport_.End("audio_start_failed");
        lock.unlock();
        StartRelease();
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    const int32_t ret = audioEncoder_->Start();
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        failure_.Record("recorder.audio.start", ret, "启动音频编码器失败");
        sessionReport_.End("audio_start_failed");
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
    return AVCODEC_SAMPLE_ERR_OK;
}

void Recorder::VideoEncOutputSyncThread(VideoEncoder *encoder, CodecUserData *context, Muxer *muxer, bool isPrimary)
{
    // [Start encoder_sync_output_buffer]
    while (true) {
        CHECK_AND_BREAK_LOG(isStarted_, "Work done, thread out");
        std::unique_lock<std::mutex> lock(context->outputMutex);
        const int64_t waitStart = RecorderClockUs();
        CodecBufferInfo bufferInfo;
        if (!encoder->GetOutputBuffer(bufferInfo, TIMEOUT_US)) {
            // [StartExclude encoder_sync_output_buffer]
            if (isStarted_ && !isStopping_) {
                AbortRecording("Video output buffer retrieval failed");
            }
            // [EndExclude encoder_sync_output_buffer]
            break;
        }
        // [StartExclude encoder_sync_output_buffer]
        const int64_t receivedAtUs = RecorderClockUs();
        (isPrimary ? primaryStats_ : secondaryStats_).RecordRetrieval(receivedAtUs - waitStart);
        CHECK_AND_BREAK_LOG(isStarted_, "Work done, thread out");
        lock.unlock();
        if (!ProcessVideoOutputBuffer(encoder, context, muxer, bufferInfo, isPrimary, receivedAtUs)) {
            break;
        }
        // [EndExclude encoder_sync_output_buffer]
    }
    // [End encoder_sync_output_buffer]
    FinishVideoOutputThread(context, isPrimary);
}

void Recorder::VideoEncOutputAsyncThread(VideoEncoder *encoder, CodecUserData *context, Muxer *muxer, bool isPrimary)
{
    // [Start encoder_output_buffer]
    while (true) {
        CHECK_AND_BREAK_LOG(isStarted_, "Work done, thread out");
        // 获取输出buffer。
        std::shared_ptr<CodecBufferInfo> bufferInfo = context->outputBufferQueue.Dequeue();
        std::shared_lock<std::shared_mutex> codecLock(context->codecMutex);
        // 开发者可根据业务需要，对输出数据进行保存/释放处理。
        // [StartExclude encoder_output_buffer]
        const int64_t receivedAtUs = RecorderClockUs();
        CHECK_AND_BREAK_LOG(isStarted_, "Work done, thread out");
        if (context->hasError.load()) {
            AbortRecording("Video codec callback failed");
            break;
        }
        CHECK_AND_CONTINUE_LOG(bufferInfo != nullptr, "Buffer queue is empty, continue");
        if (!ProcessVideoOutputBuffer(encoder, context, muxer, *bufferInfo, isPrimary, receivedAtUs)) {
            break;
        }
        // [EndExclude encoder_output_buffer]
    }
    // [End encoder_output_buffer]
    FinishVideoOutputThread(context, isPrimary);
}

bool Recorder::ProcessVideoOutputBuffer(VideoEncoder *encoder, CodecUserData *context, Muxer *muxer,
    CodecBufferInfo &bufferInfo, bool isPrimary, int64_t receivedAtUs)
{
    if ((bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_SYNC_FRAME) ||
        bufferInfo.attr.flags == AVCODEC_BUFFER_FLAGS_NONE) {
        context->outputFrameCount++;
        if (context->isFirstVideoSyncFrame.exchange(false)) {
            context->firstVideoSyncFramePts = bufferInfo.attr.pts;
        }
        bufferInfo.attr.pts = (bufferInfo.attr.pts - context->firstVideoSyncFramePts) / UNIT_CONVERSION;
    } else {
        bufferInfo.attr.pts = 0;
    }

    AVCODEC_SAMPLE_LOGW("Out buffer count: %{public}u, size: %{public}d, flag: %{public}u, pts: %{public}" PRId64,
        context->outputFrameCount, bufferInfo.attr.size, bufferInfo.attr.flags, bufferInfo.attr.pts);
    const bool isEosBuffer = (bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    if (context->outputFrameCount == 1 && !isEosBuffer && bufferInfo.attr.size > 0 &&
        (bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_CODEC_DATA) == 0) {
        sessionReport_.Event(isPrimary ? "primary.first_output" : "secondary.first_output");
    }
    auto &stats = isPrimary ? primaryStats_ : secondaryStats_;
    stats.RecordOutput(bufferInfo.attr);
    if (!isEosBuffer && bufferInfo.attr.size > 0 &&
        (bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_CODEC_DATA) == 0) {
        audioStats_.Video(isPrimary, bufferInfo.attr.pts);
    }
    int64_t dumpUs = -1;
    int64_t muxerUs = -1;
    int32_t writeRet = AVCODEC_SAMPLE_ERR_OK;
    if (!isEosBuffer && bufferInfo.attr.size > 0) {
        if ((isPrimary ? primaryDump_ : secondaryDump_).IsWriting()) {
            const int64_t start = RecorderClockUs();
            DumpVideoOutput(bufferInfo, isPrimary);
            dumpUs = RecorderClockUs() - start;
        }
        const int64_t muxerStart = RecorderClockUs();
        writeRet = muxer->WriteSample(muxer->GetVideoTrackId(), bufferInfo.buffer, bufferInfo.attr);
        muxerUs = RecorderClockUs() - muxerStart;
        if (writeRet == AVCODEC_SAMPLE_ERR_OK) {
            (isPrimary ? primaryStats_ : secondaryStats_).Record(bufferInfo.attr);
        }
    }
    // 每个输出 Buffer 都必须按原索引归还，包括 EOS 和 Muxer 写入失败的情况。
    const int32_t freeRet = encoder->FreeOutputBuffer(bufferInfo);
    stats.RecordStages(muxerUs, dumpUs, RecorderClockUs() - receivedAtUs);
    RefreshStreamStorage(isPrimary);
    if (freeRet != AVCODEC_SAMPLE_ERR_OK) {
        failure_.Record("recorder.video.release", freeRet, "归还视频编码输出 Buffer 失败");
        AVCODEC_SAMPLE_LOGE("Encoder output buffer release failed, ret: %{public}d", freeRet);
        return false;
    }
    if (writeRet != AVCODEC_SAMPLE_ERR_OK) {
        AbortRecording("Write encoded video sample failed");
        return false;
    }
    if (isEosBuffer) {
        sessionReport_.Event(isPrimary ? "primary.eos" : "secondary.eos");
        (isPrimary ? primaryEosReceived_ : secondaryEosReceived_).store(true);
        if (isPrimary) {
            isVideoEos_.store(true);
        } else {
            isSecondaryVideoEos_.store(true);
        }
        videoEosCond_.notify_all();
        return false;
    }
    return true;
}

void Recorder::FinishVideoOutputThread(CodecUserData *context, bool isPrimary)
{
    sessionReport_.Event(isPrimary ? "primary.thread_end" : "secondary.thread_end");
    (isPrimary ? primaryStats_ : secondaryStats_).Stop();
    RefreshStreamStorage(isPrimary, true);
    AVCODEC_SAMPLE_LOGI("Exit, frame count: %{public}u", context->outputFrameCount);
    if (isPrimary) {
        isVideoEos_.store(true);
    } else {
        isSecondaryVideoEos_.store(true);
    }
    videoEosCond_.notify_all();
    if (!isStopping_ && isVideoEos_.load() &&
        (secondaryVideoEncoder_ == nullptr || isSecondaryVideoEos_.load())) {
        StartRelease();
    }
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
    if (secondaryEncOutputThread_ && secondaryEncOutputThread_->joinable()) {
        secondaryEncOutputThread_->join();
        secondaryEncOutputThread_.reset();
    }
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

// [Start recorder_release]
void Recorder::ReleaseVideoEncoder()
{
    // API 26 要求先销毁副编码器，再销毁主编码器；主路拥有共享输入的生命周期。
    if (secondaryVideoEncoder_ != nullptr) {
        if (secondaryEncContext_ != nullptr) {
            secondaryEncContext_->isDestroyed.store(true);
            std::unique_lock<std::shared_mutex> codecLock(secondaryEncContext_->codecMutex);
            secondaryEncContext_->ClearQueue();
        }
        secondaryVideoEncoder_->Release();
        secondaryVideoEncoder_.reset();
        if (secondaryEncContext_ != nullptr) {
            delete secondaryEncContext_;
            secondaryEncContext_ = nullptr;
        }
    }
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
// [End recorder_release]

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
        isAudioEos_.store(false);
        isStopping_.store(false);

        // 所有输出线程已 join；先结束容器写入并刷新文件尾，再销毁 codec。
        if (muxer_ != nullptr) {
            const int32_t ret = muxer_->Release();
            sessionReport_.Event("primary.muxer_released", std::to_string(ret));
            if (ret != AVCODEC_SAMPLE_ERR_OK) {
                AVCODEC_SAMPLE_LOGE("Release primary muxer failed, ret: %{public}d", ret);
            }
            muxer_.reset();
        }
        if (secondaryMuxer_ != nullptr) {
            const int32_t ret = secondaryMuxer_->Release();
            sessionReport_.Event("secondary.muxer_released", std::to_string(ret));
            if (ret != AVCODEC_SAMPLE_ERR_OK) {
                AVCODEC_SAMPLE_LOGE("Release secondary muxer failed, ret: %{public}d", ret);
            }
            secondaryMuxer_.reset();
        }
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
            // 视频 codec 已释放且输出线程已 join，回调上下文不再会被访问。
            delete encContext_;
            encContext_ = nullptr;
        }
        isSecondaryVideoEos_.store(false);
        releaseCompleted_ = true;
        sessionReport_.Event("native.released");
    }
    doneCond_.notify_all();
    AVCODEC_SAMPLE_LOGI("Release: Cleanup complete, notifying doneCond");
}

void Recorder::RefreshStreamStorage(bool primary, bool force)
{
    auto &lastAt = primary ? primaryStorageAtUs_ : secondaryStorageAtUs_;
    const int64_t now = RecorderClockUs();
    if (!force && now - lastAt < MICROSECOND) {
        return;
    }
    auto &stats = primary ? primaryStats_ : secondaryStats_;
    auto *context = primary ? encContext_ : secondaryEncContext_;
    if (context != nullptr && !sampleInfo_.codec.codecSyncMode) {
        StageTimingInfo wait;
        StageTimingInfo residence;
        size_t depth = 0;
        size_t peak = 0;
        context->outputBufferQueue.GetDiagnostics(wait, residence, depth, peak);
        stats.SetQueue(wait, residence, depth, peak);
    }
    const int fd = primary ? sampleInfo_.output.outputFd : sampleInfo_.output.secondaryOutputFd;
    struct stat file {};
    struct statvfs space {};
    const int64_t bytes = fd >= 0 && fstat(fd, &file) == 0 ? file.st_size : -1;
    const int64_t available = fd >= 0 && fstatvfs(fd, &space) == 0 ?
        static_cast<int64_t>(space.f_bavail) * space.f_frsize : -1;
    auto &previousBytes = primary ? primaryFileBytes_ : secondaryFileBytes_;
    const double growth = lastAt > 0 && now > lastAt && bytes >= previousBytes && previousBytes >= 0 ?
        static_cast<double>(bytes - previousBytes) * MICROSECOND / (now - lastAt) : -1;
    const auto &dump = primary ? primaryDump_ : secondaryDump_;
    stats.SetStorage(bytes, available, growth, dump.State(), dump.Bytes());
    previousBytes = bytes;
    lastAt = now;
}

void Recorder::AbortRecording(const char *reason)
{
    sessionReport_.Event("recording.aborted", reason);
    sessionReport_.End("output_failed");
    failure_.Record("recorder.output", AVCODEC_SAMPLE_ERR_ERROR, reason);
    // 输入 Buffer 已交给应用但无法安全提交时，直接结束本次会话，避免 Buffer 永久滞留在应用侧。
    AVCODEC_SAMPLE_LOGE("Abort recording: %{public}s", reason);
    const bool wasStopping = isStopping_.exchange(true);
    isEos_.store(true);
    isStarted_.store(false);
    if (encContext_ != nullptr) {
        encContext_->inputBufferQueue.CancelWait();
        encContext_->outputBufferQueue.CancelWait();
    }
    if (secondaryEncContext_ != nullptr) {
        secondaryEncContext_->inputBufferQueue.CancelWait();
        secondaryEncContext_->outputBufferQueue.CancelWait();
    }
    if (audioEncContext_ != nullptr) {
        audioEncContext_->inputCond.notify_all();
        audioEncContext_->inputBufferQueue.CancelWait();
        audioEncContext_->outputBufferQueue.CancelWait();
    }
    isAudioEos_.store(true);
    videoEosCond_.notify_all();
    if (!wasStopping) {
        StartRelease();
    }
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
        // 先关闭动态参数入口，再给相机排空和编码器 EOS 留出收尾时间。
        std::lock_guard<std::mutex> lock(mutex_);
        isStopping_.store(true);
    }
    if (!isStarted_) {
        StartRelease();
        return WaitForDone();
    }

    AVCODEC_SAMPLE_LOGI("StopEnd: Waiting for camera pipeline to flush...");
    std::this_thread::sleep_for(std::chrono::milliseconds(SLEEP_TIME));
    int32_t ret = SendVideoEndOfStream();
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        return AbortAndWait(ret, "Video encoder notifyEndOfStream failed");
    }
    ret = SendAudioEndOfStream();
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        return AbortAndWait(ret, "Audio encoder notifyEndOfStream failed");
    }
    WaitForEncoderEndOfStream();
    AVCODEC_SAMPLE_LOGI("StopEnd: Encoder EOS received; releasing recorder resources");
    StartRelease();
    return WaitForDone();
}

int32_t Recorder::SendVideoEndOfStream()
{
    // EOS 入队后仍需消费输出，直到每路视频线程归还 EOS Buffer。
    int32_t ret = videoEncoder_->NotifyEndOfStream();
    if (ret != AVCODEC_SAMPLE_ERR_OK || secondaryVideoEncoder_ == nullptr) {
        return ret;
    }
    return secondaryVideoEncoder_->NotifyEndOfStream();
}

int32_t Recorder::SendAudioEndOfStream()
{
    // 先结束并 join AAC 输入线程，再发 EOS；输出线程会排空剩余编码数据。
    isEos_.store(true);
    if (audioEncContext_ != nullptr) {
        audioEncContext_->inputCond.notify_all();
    }
    if (audioEncInputThread_ != nullptr && audioEncInputThread_->joinable()) {
        audioEncInputThread_->join();
        audioEncInputThread_.reset();
    }
    return audioEncoder_ == nullptr ? AVCODEC_SAMPLE_ERR_OK : audioEncoder_->NotifyEndOfStream();
}

void Recorder::WaitForEncoderEndOfStream()
{
    std::unique_lock<std::mutex> lock(videoEosMutex_);
    const bool videoEosReceived = videoEosCond_.wait_for(lock, std::chrono::seconds(WAIT_TIME), [this]() {
        return isVideoEos_.load() && (secondaryVideoEncoder_ == nullptr || isSecondaryVideoEos_.load());
    });
    if (!videoEosReceived || !primaryEosReceived_ ||
        (sampleInfo_.output.enableDualOutput && !secondaryEosReceived_)) {
        sessionReport_.Event("video.drain", videoEosReceived ? "ended_without_eos" : "timeout");
        sessionReport_.End(videoEosReceived ? "video_eos_missing" : "video_eos_timeout");
        AVCODEC_SAMPLE_LOGW("Timeout waiting for video EOS, proceeding with stop");
    }
    const bool audioEosReceived = audioEncoder_ == nullptr ||
        videoEosCond_.wait_for(lock, std::chrono::seconds(WAIT_TIME), [this]() { return isAudioEos_.load(); });
    if (audioEncoder_ != nullptr && (!audioEosReceived || !audioEosReceived_)) {
        sessionReport_.Event("audio.drain", audioEosReceived ? "ended_without_eos" : "timeout");
        sessionReport_.End(audioEosReceived ? "audio_eos_missing" : "audio_eos_timeout");
        AVCODEC_SAMPLE_LOGW("Timeout waiting for audio EOS, proceeding with stop");
    }
}

int32_t Recorder::AbortAndWait(int32_t errorCode, const char *reason)
{
    AbortRecording(reason);
    StartRelease();
    (void)WaitForDone();
    return errorCode;
}

int32_t Recorder::CreateAudioEncoder()
{
    int32_t ret = audioEncoder_->Create(sampleInfo_.audio.audioCodecMime);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Create audio encoder(%{public}s) failed",
                             sampleInfo_.audio.audioCodecMime.c_str());
    AVCODEC_SAMPLE_LOGI("Create audio encoder(%{public}s)", sampleInfo_.audio.audioCodecMime.c_str());

    // Config 失败时先销毁 codec，再回收临时上下文，避免已注册回调借用悬空指针。
    std::unique_ptr<CodecUserData> context = std::make_unique<CodecUserData>();
    context->recordingAudioStats = &audioStats_;
    context->failureDetails = &failure_;
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
        if (audioEncContext_->hasError.load()) { AbortRecording("Audio codec callback failed"); break; }
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
        audioStats_.Capture(0, audioEncContext_->remainlen);
    }
    if (!readSuccess) {
        AbortRecording(synchronous ? "Synchronous audio cache read failed" :
            "Asynchronous audio cache read failed");
        return false;
    }

    bufferInfo.buffer = buffer;
    bufferInfo.attr.size = inputSize;
    bufferInfo.attr.offset = 0;
    // PCM 没有容器时间戳，按已提交的 S16LE 样本帧生成微秒 PTS，避免重复使用零时间戳。
    bufferInfo.attr.pts = audioSubmittedFrames_ * MICROSECOND / sampleInfo_.audio.audioSampleRate;
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
    audioSubmittedFrames_ += inputSize / sampleInfo_.audio.audioChannelCount / sizeof(int16_t);
    return true;
}

// [Start Recorder::AudioEncOutputThread]
void Recorder::AudioEncOutputThread()
{
    while (true) {
        CHECK_AND_BREAK_LOG(isStarted_, "Work done, thread out");

        std::shared_ptr<CodecBufferInfo> bufferInfo = audioEncContext_->outputBufferQueue.Dequeue();
        std::shared_lock<std::shared_mutex> codecLock(audioEncContext_->codecMutex);
        CHECK_AND_BREAK_LOG(isStarted_, "Work done, thread out");
        if (audioEncContext_->hasError.load()) { AbortRecording("Audio codec callback failed"); break; }
        CHECK_AND_CONTINUE_LOG(bufferInfo != nullptr, "Buffer queue is empty, continue");

        if (!ProcessAudioOutputBuffer(*bufferInfo)) {
            break;
        }
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
        // 数据充足后才可以申请codec输入Buffer；减少申请成功后因缓存不足无法及时归还的风险。
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
        } else if (errCode == AVCODEC_SAMPLE_ERR_ERROR) {
            if (isStarted_ && !isStopping_) {
                AbortRecording("Audio output buffer retrieval failed");
            }
            break;
        } else if (errCode == AVCODEC_SAMPLE_ERR_END) {
            AVCODEC_SAMPLE_LOGI("Audio output thread reached EOS");
            break;
        } else {
            AVCODEC_SAMPLE_LOGW("Get output buffer timeout, retry");
            continue;
        }

        if (!ProcessAudioOutputBuffer(bufferInfo)) {
            break;
        }
    }
    // 同步模式仍由视频线程触发释放；音频先结束时，视频仍在使用 Muxer。
    AVCODEC_SAMPLE_LOGI("Audio output thread exited, waiting for video thread to trigger release");
}
// [End Recorder::AudioEncOutputSyncThread]

// 同步和异步模式共用写入路径，保证两种模式对 Buffer 归还和错误处理的规则一致。
bool Recorder::ProcessAudioOutputBuffer(CodecBufferInfo &bufferInfo)
{
    ++audioEncContext_->outputFrameCount;
    const bool eos = (bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    const bool media = !eos && bufferInfo.attr.size > 0 &&
        (bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_CODEC_DATA) == 0;
    if (media) {
        if (audioStats_.Output(bufferInfo.attr.pts, bufferInfo.attr.size)) {
            sessionReport_.Event("audio.first_output");
        }
    }
    int32_t writeRet = AVCODEC_SAMPLE_ERR_OK;
    if (!eos && bufferInfo.attr.size > 0) {
        const int64_t begin = RecorderClockUs();
        writeRet = muxer_->WriteSample(muxer_->GetAudioTrackId(), bufferInfo.buffer, bufferInfo.attr);
        audioStats_.Write(true, RecorderClockUs() - begin, writeRet == AVCODEC_SAMPLE_ERR_OK);
        if (writeRet == AVCODEC_SAMPLE_ERR_OK && secondaryMuxer_ != nullptr) {
            const int64_t secondaryBegin = RecorderClockUs();
            writeRet = secondaryMuxer_->WriteSample(secondaryMuxer_->GetAudioTrackId(), bufferInfo.buffer, bufferInfo.attr);
            audioStats_.Write(false, RecorderClockUs() - secondaryBegin, writeRet == AVCODEC_SAMPLE_ERR_OK);
        }
    }
    // 即使写入失败也先归还同一索引，随后由正常的错误收尾路径释放会话。
    const int32_t freeRet = audioEncoder_->FreeOutputData(bufferInfo.bufferIndex);
    if (writeRet != AVCODEC_SAMPLE_ERR_OK || freeRet != AVCODEC_SAMPLE_ERR_OK) {
        AbortRecording(writeRet != AVCODEC_SAMPLE_ERR_OK ? "Write encoded audio sample failed" :
            "Release encoded audio buffer failed");
        return false;
    }
    if (eos) {
        audioEosReceived_ = true;
        sessionReport_.Event("audio.eos");
        isAudioEos_.store(true);
        audioStats_.Stop();
        videoEosCond_.notify_all();
        return false;
    }
    return true;
}

void Recorder::MarkStage(const std::string &id, const std::string &stage, const std::string &result)
{
    if (id.empty() || id != sessionReport_.Snapshot().id || result.size() > 128) {
        return;
    }
    if (stage == "camera.started" || stage == "camera.failed" || stage == "camera.released" ||
        stage == "files.closed" || stage == "files.close_failed" || stage == "camera.frame_end" ||
        stage == "camera.frame_end_timeout" || stage == "storage.stop_requested" || stage == "stop.requested") {
        sessionReport_.Event(stage, result);
        if (stage == "stop.requested") { sessionReport_.End("user_stop"); }
        if (stage == "storage.stop_requested") { sessionReport_.End("low_space"); }
        if (stage == "camera.failed") { sessionReport_.End("camera_failed"); }
        if (stage == "files.close_failed") { sessionReport_.End("file_close_failed"); }
        if (stage == "camera.frame_end_timeout") { sessionReport_.End("camera_frame_end_timeout"); }
    }
}
