/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
#include "av_codec_sample_log.h"
#include "dfx/error/av_codec_sample_error.h"
#include <bits/alltypes.h>
#include <netinet/tcp.h>
#include <queue>

#undef LOG_TAG
#define LOG_TAG "samplePlayer"

namespace {
constexpr int BALANCE_VALUE = 5;
using namespace std::string_literals;
using namespace std::chrono_literals;
static const int MS_PER_SECOND = 1000;
constexpr int64_t WAIT_TIME_US_THRESHOLD_WARNING = -1 * 40 * 1000; // warning threshold 40ms
constexpr int64_t WAIT_TIME_US_THRESHOLD = 1 * 1000 * 1000;        // max sleep time 1s
constexpr int64_t SINK_TIME_US_THRESHOLD = 100000;                 // max sink time 100ms
constexpr int32_t BYTES_PER_SAMPLE_2 = 2;                          // 2 bytes per sample
constexpr double VSYNC_TIME = 1000 / 60;                           // frame time
constexpr double LIP_SYNC_BALANCE_VALUE = 2;                       // the balance value of sync sound and picture
constexpr int8_t YUV420_SAMPLE_RATIO = 2;
constexpr int32_t TRIPLE_SPEED_MULTIPLIER = 3;
constexpr int32_t DOUBLE_SPEED_MULTIPLIER = 2;
constexpr int64_t US_PER_SECOND = 1000000;
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

int32_t Player::CreateAudioDecoder()
{
    AVCODEC_SAMPLE_LOGW("audio mime:%{public}s", sampleInfo_.audioCodecMime.c_str());
    int32_t ret = audioDecoder_->Create(sampleInfo_.audioCodecMime);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        isAudioDone.store(true);
        AVCODEC_SAMPLE_LOGE("Create audio decoder failed, mime:%{public}s", sampleInfo_.audioCodecMime.c_str());
    } else {
        audioDecContext_ = std::make_unique<CodecUserData>();
        audioDecContext_->runningFlag = &isStarted_;
        ret = audioDecoder_->Config(sampleInfo_, audioDecContext_.get());
        CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Audio Decoder config failed");
        OH_AudioStreamBuilder_Create(&builder_, AUDIOSTREAM_TYPE_RENDERER);
        OH_AudioStreamBuilder_SetLatencyMode(builder_, AUDIOSTREAM_LATENCY_MODE_NORMAL);
         // Set the audio sampling rate.
        OH_AudioStreamBuilder_SetSamplingRate(builder_, sampleInfo_.audioSampleRate);
        // 设置音频声道
        OH_AudioStreamBuilder_SetChannelCount(builder_, sampleInfo_.audioChannelCount);
        // 设置音频采样格式
        OH_AudioStreamBuilder_SetSampleFormat(builder_, AUDIOSTREAM_SAMPLE_S16LE);
        // 设置音频流的编码类型
        OH_AudioStreamBuilder_SetEncodingType(builder_, AUDIOSTREAM_ENCODING_TYPE_RAW);
        // 设置输出音频流的工作场景
        OH_AudioStreamBuilder_SetRendererInfo(builder_, AUDIOSTREAM_USAGE_MOVIE);
        AVCODEC_SAMPLE_LOGW("Init audioSampleRate: %{public}d, ChannelCount: %{public}d", sampleInfo_.audioSampleRate,
                            sampleInfo_.audioChannelCount);
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
    AVCODEC_SAMPLE_LOGW("video mime:%{public}s", sampleInfo_.videoCodecMime.c_str());
    int32_t ret = videoDecoder_->Create(sampleInfo_.videoCodecMime, sampleInfo_.codecType);
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        isVideoDone.store(true);
        AVCODEC_SAMPLE_LOGW("Create video decoder failed, mime:%{public}s", sampleInfo_.videoCodecMime.c_str());
    } else {
        videoDecContext_ = std::make_unique<CodecUserData>();
        videoDecContext_->runningFlag = &isStarted_;
        videoDecContext_->sampleInfo = &sampleInfo_;
        videoDecContext_->isDecFirstFrame = true;
        if (sampleInfo_.codecRunMode == SURFACE) {
            sampleInfo_.window = NativeXComponentSample::PluginManager::GetInstance()->pluginWindow_;
        } else {
            sampleInfo_.window = nullptr;
        }
        ret = videoDecoder_->Config(sampleInfo_, videoDecContext_.get());
        CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Video Decoder config failed");
    }
    return AVCODEC_SAMPLE_ERR_OK;
}

// 新添加的错误处理函数
int32_t Player::HandleInitError(std::unique_lock<std::mutex>& outerLock)
{
    playbackFailed_ = true;
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

int32_t Player::Init(SampleInfo &sampleInfo)
{
    CHECK_AND_RETURN_RET_LOG(!isStarted_, AVCODEC_SAMPLE_ERR_ERROR, "Already started.");
    JoinReleaseThread();
    std::unique_lock<std::mutex> lock(mutex_);
    CHECK_AND_RETURN_RET_LOG(!isStarted_, AVCODEC_SAMPLE_ERR_ERROR, "Already started.");
    CHECK_AND_RETURN_RET_LOG(demuxer_ == nullptr && videoDecoder_ == nullptr && audioDecoder_ == nullptr,
                             AVCODEC_SAMPLE_ERR_ERROR, "Already started.");

    sampleInfo_ = sampleInfo;
    playbackFailed_ = false;
    isSmartFluencySupported_ = sampleInfo.isSmartFluencySupported;
    AVCODEC_SAMPLE_LOGI("Smart fluency supported: %{public}d", isSmartFluencySupported_);

    videoDecoder_ = std::make_unique<VideoDecoder>();
    audioDecoder_ = std::make_unique<AudioDecoder>();
    demuxer_ = std::make_unique<Demuxer>();

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

    if (audioDecContext_ == nullptr && videoDecContext_ == nullptr) {
        AVCODEC_SAMPLE_LOGE("No supported audio or video track found");
        return HandleInitError(lock);
    }

    if (audioDecContext_ != nullptr) {
        audioDecContext_->sampleInfo = &sampleInfo_;
    }

    isReleased_ = false;
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

    if (sampleInfo_.codecSyncMode) {
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

    if (sampleInfo_.codecSyncMode) {
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
    
    CHECK_AND_RETURN_RET_LOG(!isStarted_, AVCODEC_SAMPLE_ERR_ERROR, "Already started");
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
    
    AVCODEC_SAMPLE_LOGI("Player started successfully");
    StartRelease();
    return AVCODEC_SAMPLE_ERR_OK;
}

void Player::SetSpeed(float multiplier)
{
    if (this->speed == multiplier) {
        AVCODEC_SAMPLE_LOGW("Same speed value");
        return;
    }
    if (audioRenderer_) {
        OH_AudioRenderer_SetSpeed(audioRenderer_, multiplier);
    }
    this->speed = multiplier;
    if (audioDecContext_) {
        audioDecContext_->speed = multiplier;
    }

    if (isSmartFluencySupported_ && videoDecoder_ != nullptr) {
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
    if (!isSmartFluencySupported_ || videoDecoder_ == nullptr) {
        AVCODEC_SAMPLE_LOGW("Smart fluency not supported or decoder null, skip thermal warning");
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
    if (isSmartFluencySupported_ && videoDecoder_ != nullptr) {
        videoDecoder_->OnUserSpeedChanged(speed);
    }
}

void Player::SetTransform(int32_t hint)
{
    if (this->transformHint == hint) {
        AVCODEC_SAMPLE_LOGW("Same transform hint value");
        return;
    }
    this->transformHint = hint;
    int32_t operationCode = SET_TRANSFORM;
    OHNativeWindow *window = sampleInfo_.window != nullptr ? sampleInfo_.window :
        NativeXComponentSample::PluginManager::GetInstance()->pluginWindow_;
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

void Player::Release()
{
    std::unique_lock<std::mutex> lock(mutex_);
    bool hasDecodedOutput = (videoDecContext_ != nullptr && videoDecContext_->outputFrameCount > 0) ||
                            (audioDecContext_ != nullptr && audioDecContext_->outputFrameCount > 0);
    bool codecFailed = (videoDecContext_ != nullptr && videoDecContext_->hasError.load()) ||
                       (audioDecContext_ != nullptr && audioDecContext_->hasError.load());
    bool playbackSucceeded = hasDecodedOutput && !playbackFailed_.load() && !codecFailed;
    isStarted_ = false;
    JoinWorkerThreads();
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
    // 触发回调
    auto playDoneCallback = sampleInfo_.playDoneCallback;
    void *playDoneCallbackData = sampleInfo_.playDoneCallbackData;
    sampleInfo_.playDoneCallback = nullptr;
    sampleInfo_.playDoneCallbackData = nullptr;
    lock.unlock();
    if (playDoneCallback != nullptr) {
        playDoneCallback(playDoneCallbackData, playbackSucceeded);
    }
    // 清空队列
    AVCODEC_SAMPLE_LOGI("Succeed");
}

void Player::DumpOutput(CodecBufferInfo &bufferInfo)
{
    auto &info = sampleInfo_;
    if (info.codecRunMode != BUFFER || !info.enableVideoDump) {
        return;
    }
    if (outputFile_ == nullptr) {
        auto time = std::chrono::system_clock::to_time_t(std::chrono::system_clock::now());
        // dump file /data/app/el2/100/base/com.samples.avcodecsample/haps/entry/files
        if (info.outputFilePath.empty()) {
            info.outputFilePath = "/data/storage/el2/base/haps/entry/files/VideoDecoderOut_"s +
                                  ToString(info.pixelFormat) + "_" + std::to_string(info.videoWidth) + "_" +
                                  std::to_string(info.videoHeight) + "_" + std::to_string(time) + ".yuv";
        }

        outputFile_ = std::make_unique<std::ofstream>(info.outputFilePath, std::ios::out | std::ios::trunc);
        if (!outputFile_->is_open()) {
            outputFile_ = nullptr;
            AVCODEC_SAMPLE_LOGE("Output file open failed");
            return;
        }
    }

    uint8_t *bufferAddr = GetBufferDataAddr(bufferInfo);
    CHECK_AND_RETURN_LOG(bufferAddr != nullptr, "Buffer is nullptr");
    switch (info.pixelFormat) {
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
    DumpOutput(bufferInfo);

    int32_t ret = AVCODEC_SAMPLE_ERR_OK;
    bool renderResult = true;
    if (sampleInfo_.codecRunMode == BUFFER) {
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
    return true;
}

void Player::WriteOutputFileWithStrideYUV420P(uint8_t *bufferAddr)
{
    CHECK_AND_RETURN_LOG(bufferAddr != nullptr, "Buffer is nullptr");
    auto &info = sampleInfo_;
    int32_t videoWidth =
        videoDecContext_->width *
        ((info.videoCodecMime == OH_AVCODEC_MIMETYPE_VIDEO_HEVC && info.hevcProfile == HEVC_PROFILE_MAIN_10) ? 2 : 1);
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
        ((info.videoCodecMime == OH_AVCODEC_MIMETYPE_VIDEO_HEVC && info.hevcProfile == HEVC_PROFILE_MAIN_10) ? 2 : 1);
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
    this->speed == 1 ? sampleInfo_.frameInterval = US_PER_SECOND / sampleInfo_.frameRate
        : this->speed == DOUBLE_SPEED_MULTIPLIER ? sampleInfo_.frameInterval =
                        US_PER_SECOND / sampleInfo_.frameRate / DOUBLE_SPEED_MULTIPLIER
                   : sampleInfo_.frameInterval =
                        US_PER_SECOND / sampleInfo_.frameRate / TRIPLE_SPEED_MULTIPLIER;
    std::this_thread::sleep_until(lastPushTime + std::chrono::microseconds(sampleInfo_.frameInterval));
    lastPushTime = std::chrono::system_clock::now();
    
    return true;
}

bool Player::CalculateSyncParameters(CodecBufferInfo& bufferInfo, int64_t framePosition,
                                     int64_t& waitTimeUs, bool& dropFrame,
                                     int64_t perSinkTimeThreshold)
{
    // after seek, audio render flush, framePosition = 0, then writtenSampleCnt = 0
    int64_t latency = (audioDecContext_->frameWrittenForSpeed - framePosition) * 1000 * 1000 /
                      sampleInfo_.audioSampleRate / speed;
    AVCODEC_SAMPLE_LOGI("VD latency: %{public}li writtenSampleCnt: %{public}li", latency, writtenSampleCnt);
    
    nowTimeStamp = GetCurrentTime();
    int64_t anchorDiff = (nowTimeStamp - audioTimeStamp) / 1000;
    
    // us, audio buffer accelerate render time
    int64_t audioPlayedTime = audioDecContext_->currentPosAudioBufferPts - latency + anchorDiff;
    // us, video buffer expected render time
    int64_t videoPlayedTime = bufferInfo.attr.pts;
    
    // audio render timestamp and now timestamp diff
    waitTimeUs = videoPlayedTime - audioPlayedTime; // us
    
    AVCODEC_SAMPLE_LOGI("VD bufferInfo.bufferIndex: %{public}u", bufferInfo.bufferIndex);
    AVCODEC_SAMPLE_LOGI(
        "VD audioPlayedTime: %{public}li, videoPlayedTime: %{public}li, nowTimeStamp_:%{public}ld, "
        "audioTimeStamp_ :%{public}ld, waitTimeUs :%{public}ld, anchordiff :%{public}ld",
        audioPlayedTime, videoPlayedTime, nowTimeStamp, audioTimeStamp, waitTimeUs, anchorDiff);
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
        // per frame render time reduced by frame interval
        if (waitTimeUs > sampleInfo_.frameInterval + perSinkTimeThreshold) {
            waitTimeUs = sampleInfo_.frameInterval + perSinkTimeThreshold;
            AVCODEC_SAMPLE_LOGE("VD buffer is too early and reduced, waitTimeUs: %{public}ld", waitTimeUs);
        }
    }
    return true;
}

bool Player::RenderAndRelease(CodecBufferInfo& bufferInfo, int64_t waitTimeUs, bool dropFrame)
{
    if (static_cast<double>(waitTimeUs) > VSYNC_TIME * LIP_SYNC_BALANCE_VALUE) {
        std::this_thread::sleep_for(std::chrono::microseconds(
            static_cast<int64_t>(static_cast<double>(waitTimeUs) - VSYNC_TIME * LIP_SYNC_BALANCE_VALUE)));
    }
    return PresentAndReleaseVideoBuffer(bufferInfo, !dropFrame,
        VSYNC_TIME * LIP_SYNC_BALANCE_VALUE * US_PER_SECOND + GetCurrentTime());
}

bool Player::ProcessVideoWithAudio(CodecBufferInfo& bufferInfo,
    std::chrono::time_point<std::chrono::system_clock>& lastPushTime, int64_t perSinkTimeThreshold)
{
    // get audio render position
    int64_t framePosition = 0;
    int64_t timestamp = 0;
    int32_t ret = OH_AudioRenderer_GetTimestamp(audioRenderer_, CLOCK_MONOTONIC, &framePosition, &timestamp);
    AVCODEC_SAMPLE_LOGI("VD framePosition: %{public}li, nowTimeStamp: %{public}li", framePosition, nowTimeStamp);
    audioTimeStamp = timestamp; // ns
    
    // audio render getTimeStamp error, render it
    if (ret != AUDIOSTREAM_SUCCESS || (timestamp == 0) || (framePosition == 0)) {
        // first frame, render without wait
        if (!PresentAndReleaseVideoBuffer(bufferInfo, true, GetCurrentTime())) {
            return false;
        }
        std::this_thread::sleep_until(lastPushTime + std::chrono::microseconds(sampleInfo_.frameInterval));
        lastPushTime = std::chrono::system_clock::now();
        return true;
    }
    int64_t waitTimeUs = 0;
    bool dropFrame = false;
    if (!CalculateSyncParameters(bufferInfo, framePosition, waitTimeUs,
        dropFrame, perSinkTimeThreshold)) {
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
        int32_t pixelFormat = sampleInfo_.pixelFormat;
        if (OH_AVFormat_GetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, &pixelFormat)) {
            sampleInfo_.pixelFormat = static_cast<OH_AVPixelFormat>(pixelFormat);
        }
        OH_AVFormat_Destroy(format);
    }
    videoDecContext_->isDecFirstFrame = false;
    AVCODEC_SAMPLE_LOGI("Sync mode init: %{public}d*%{public}d, stride: %{public}d*%{public}d, "
        "pixel format: %{public}d", videoDecContext_->width, videoDecContext_->height,
        videoDecContext_->widthStride, videoDecContext_->heightStride, sampleInfo_.pixelFormat);
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

bool Player::ProcessSyncVideoOutput(std::chrono::time_point<std::chrono::system_clock>& lastPushTime,
    int64_t perSinkTimeThreshold)
{
    CodecBufferInfo bufferInfo(nullptr);
    if (!GetSyncVideoOutputBuffer(bufferInfo)) {
        return false;
    }
    if (audioDecContext_ == nullptr) {
        return ProcessVideoWithoutAudio(bufferInfo, lastPushTime);
    }
    return ProcessVideoWithAudio(bufferInfo, lastPushTime, perSinkTimeThreshold);
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
    sampleInfo_.frameInterval = US_PER_SECOND / sampleInfo_.frameRate;
    int64_t perSinkTimeThreshold = MS_PER_SECOND / sampleInfo_.frameRate * MS_PER_SECOND;
    thread_local auto lastPushTime = std::chrono::system_clock::now();
    while (isStarted_) {
        if (!ProcessSyncVideoOutput(lastPushTime, perSinkTimeThreshold)) {
            break;
        }
    }
    FinishVideoOutput();
}

void Player::VideoDecOutputAsyncThread()
{
    sampleInfo_.frameInterval = US_PER_SECOND / sampleInfo_.frameRate;
    int64_t perSinkTimeThreshold = MS_PER_SECOND / sampleInfo_.frameRate * MS_PER_SECOND; // max per sink time
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
            success = ProcessVideoWithAudio(*bufferInfo, lastPushTime,
                perSinkTimeThreshold);
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
    writtenSampleCnt += (bufferInfo.attr.size / sampleInfo_.audioChannelCount / BYTES_PER_SAMPLE_2);
    AVCODEC_SAMPLE_LOGI("writtenSampleCnt_: %{public}ld, bufferInfo.attr.size: %{public}d, "
                        "sampleInfo_.audioChannelCount: %{public}d",
                        writtenSampleCnt, bufferInfo.attr.size, sampleInfo_.audioChannelCount);

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
