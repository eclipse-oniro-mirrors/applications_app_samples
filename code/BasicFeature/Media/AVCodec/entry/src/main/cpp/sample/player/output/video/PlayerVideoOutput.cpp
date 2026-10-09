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

#include <algorithm>
#include <chrono>
#include <thread>

#include "av_codec_sample_log.h"
#include "dfx/error/av_codec_sample_error.h"

#undef LOG_TAG
#define LOG_TAG "samplePlayer"

namespace {
constexpr int32_t TRIPLE_SPEED_MULTIPLIER = 3;
constexpr int32_t DOUBLE_SPEED_MULTIPLIER = 2;
constexpr int64_t US_PER_SECOND = 1000000;
constexpr int64_t NS_PER_US = 1000;
constexpr int64_t CODEC_BUFFER_TIMEOUT_US = 100000;
constexpr uint32_t PLAYBACK_LOG_FREQUENCY = 120;
constexpr uint32_t SYNC_DIAGNOSTICS_SAMPLE_INTERVAL = 8;

bool ReleaseVideoOutputBuffer(VideoDecoder *decoder, const CodecBufferInfo &bufferInfo, const char *reason)
{
    if (bufferInfo.buffer == nullptr) {
        return true;
    }
    if (decoder == nullptr) {
        AVCODEC_SAMPLE_LOGE("Video decoder is null while releasing output buffer, reason: %{public}s", reason);
        return false;
    }
    // 该分支尚未进入 VideoSink，Buffer 的归还责任仍在输出线程。
    const int32_t ret = decoder->FreeOutputBuffer(bufferInfo.bufferIndex, false);
    if (ret == AVCODEC_SAMPLE_ERR_OK) {
        return true;
    }
    AVCODEC_SAMPLE_LOGE("Free video output buffer failed, reason: %{public}s, index: %{public}u, ret: %{public}d",
        reason, bufferInfo.bufferIndex, ret);
    return false;
}
} // 匿名命名空间

void Player::VideoDecInputSyncThread()
{
    while (isStarted_) {
        WaitIfPaused();
        CHECK_AND_BREAK_LOG(isStarted_, "Decoder input thread out");
        std::unique_lock<std::mutex> lock(videoDecContext_->inputMutex);
        CodecBufferInfo bufferInfo;
        auto buffer = videoDecoder_->GetInputBuffer(bufferInfo, CODEC_BUFFER_TIMEOUT_US);
        CHECK_AND_CONTINUE_LOG(buffer != nullptr, "Get input buffer timeout, retry");
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
            ret = demuxer_->ReadSample(demuxer_->GetVideoTrackId(), bufferInfo.buffer, bufferInfo.attr);
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
    while (isStarted_) {
        WaitIfPaused();
        CHECK_AND_BREAK_LOG(isStarted_, "Decoder input thread out");
        // [Start decoder_input_buffer]
        std::shared_ptr<CodecBufferInfo> bufferInfo = videoDecContext_->inputBufferQueue.Dequeue();
        std::shared_lock<std::shared_mutex> codecLock(videoDecContext_->codecMutex);
        // [Start decoder_input_buffer_example]
        /**
           *
           * // 示例：将数据写入 Buffer，设置属性后送入解码器。
           * uint8_t *addr = OH_AVBuffer_GetAddr(buffer);
           * CHECK_AND_RETURN_RET_LOG(addr != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Input buffer addr is null");
           * int32_t capacity = OH_AVBuffer_GetCapacity(buffer);
           * if (size > capacity) {
           * // 异常处理。
           * }
           * memcpy(addr, frameData, size);
           * OH_AVCodecBufferAttr info;
           * info.size = size;
           * info.offset = offset;
           * info.pts = pts;
           * info.flags = flags;
           * OH_AVErrCode setBufferRet = OH_AVBuffer_SetBufferAttr(buffer, &info);
           * if (setBufferRet != AV_ERR_OK) {
           * // 异常处理。
           * return false;
           * }
           * OH_AVErrCode pushInputRet = OH_VideoDecoder_PushInputBuffer(videoDec, index);
           * if (pushInputRet != AV_ERR_OK) {
           * // 异常处理。
           * return false;
           * }
           *
           */
        // [End decoder_input_buffer_example]
        // [StartExclude decoder_input_buffer]
        CHECK_AND_BREAK_LOG(isStarted_, "Work done, thread out");
        CHECK_AND_CONTINUE_LOG(bufferInfo != nullptr, "Buffer queue is empty, continue");
        videoDecContext_->inputFrameCount++;
        int32_t ret = demuxer_->ReadSample(demuxer_->GetVideoTrackId(), bufferInfo->buffer, bufferInfo->attr);
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
            ret = demuxer_->ReadSample(demuxer_->GetVideoTrackId(), bufferInfo->buffer, bufferInfo->attr);
            if (ret != AVCODEC_SAMPLE_ERR_OK) {
                playbackFailed_ = true;
                isStarted_ = false;
                break;
            }
        }
        // [EndExclude decoder_input_buffer]
        ret = videoDecoder_->PushInputBuffer(*bufferInfo);
        // [End decoder_input_buffer]
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
    bool discarded = false;
    if (!DiscardVideoOutputBeforeSeekTarget(bufferInfo, discarded)) {
        return false;
    }
    if (discarded) {
        return true;
    }
    if (!PresentAndReleaseVideoBuffer(bufferInfo, true, GetCurrentTime())) {
        playbackFailed_ = true;
        isStarted_ = false;
        return false;
    }
    renderSingleFrameAfterSeek_ = false;
    const float speedSnapshot = speed.load();
    sampleInfo_.video.frameInterval = US_PER_SECOND / sampleInfo_.video.frameRate;
    if (speedSnapshot == DOUBLE_SPEED_MULTIPLIER) {
        sampleInfo_.video.frameInterval /= DOUBLE_SPEED_MULTIPLIER;
    } else if (speedSnapshot != 1.0f) {
        sampleInfo_.video.frameInterval /= TRIPLE_SPEED_MULTIPLIER;
    }
    std::this_thread::sleep_until(lastPushTime + std::chrono::microseconds(sampleInfo_.video.frameInterval));
    lastPushTime = std::chrono::system_clock::now();
    return true;
}

bool Player::CalculateSyncParameters(CodecBufferInfo& bufferInfo, int64_t framePosition, AvSyncDecision& decision)
{
    int64_t audioFramesWritten = 0;
    int64_t currentAudioPts = 0;
    {
        std::lock_guard<std::mutex> lock(audioDecContext_->outputMutex);
        audioFramesWritten = audioDecContext_->audioFramesWritten;
        currentAudioPts = audioDecContext_->currentPosAudioBufferPts;
    }
    decision = avSyncController_.Decide({
        bufferInfo.attr.pts,
        audioFramesWritten,
        framePosition,
        currentAudioPts,
        playbackClock_.UpdateNowTimestampNs(),
        playbackClock_.GetAudioTimestampNs(),
        sampleInfo_.audio.audioSampleRate,
        static_cast<double>(speed.load()),
    });
    CHECK_AND_RETURN_RET_LOG(decision.valid, false, "Invalid audio clock parameters");
    // 高帧率视频不应每帧都获取诊断互斥锁，以免诊断本身影响输出响应。
    if (videoOutputFrames_.load() % SYNC_DIAGNOSTICS_SAMPLE_INTERVAL == 0) {
        diagnostics_.RecordSync(decision);
    }
    AVCODEC_SAMPLE_LOGD_LIMIT(PLAYBACK_LOG_FREQUENCY,
        "VD sync decision, index: %{public}u, waitTimeUs: %{public}" PRId64 ", drop: %{public}d",
        bufferInfo.bufferIndex, decision.waitTimeUs, decision.dropFrame);
    return true;
}

void Player::SetVolume(float volume)
{
    const float clampedVolume = std::clamp(volume, 0.0f, 1.0f);
    sampleInfo_.audioPlayback.volume = clampedVolume;
    audioVolume_.store(clampedVolume);
    std::lock_guard<std::mutex> rendererLock(audioRendererMutex_);
    if (audioRenderer_ == nullptr) {
        return;
    }
    const int32_t ret = OH_AudioRenderer_SetVolume(audioRenderer_, clampedVolume);
    if (ret != AUDIOSTREAM_SUCCESS) {
        AVCODEC_SAMPLE_LOGW("Set audio volume failed, volume: %{public}f, ret: %{public}d", clampedVolume, ret);
    }
}

bool Player::RenderAndRelease(CodecBufferInfo& bufferInfo, int64_t waitTimeUs, bool dropFrame)
{
    // 60fps 时提前渲染两帧是合理的，但在 240fps 时会占用约八个解码器输出 Buffer。
    // 将提前量限制为两个源帧，使硬件解码器在高帧率下仍可及时收回输出 Buffer。
    const int64_t sourceFrameIntervalUs = std::max<int64_t>(1, sampleInfo_.video.frameInterval);
    const int64_t maxRenderLeadUs = std::min(AvSyncController::renderAheadUs, sourceFrameIntervalUs * 2);
    const int64_t renderLeadUs = std::clamp(waitTimeUs, int64_t { 0 }, maxRenderLeadUs);
    if (waitTimeUs > maxRenderLeadUs) {
        std::this_thread::sleep_for(std::chrono::microseconds(waitTimeUs - maxRenderLeadUs));
    }
    // 无论送显还是丢帧，该调用都会归还同一 bufferIndex；返回后不能访问 bufferInfo.buffer。
    return PresentAndReleaseVideoBuffer(bufferInfo, !dropFrame, renderLeadUs * NS_PER_US + GetCurrentTime());
}

bool Player::ProcessVideoWithAudio(CodecBufferInfo& bufferInfo,
    std::chrono::time_point<std::chrono::system_clock>& lastPushTime)
{
    bool discarded = false;
    if (!DiscardVideoOutputBeforeSeekTarget(bufferInfo, discarded)) {
        return false;
    }
    if (discarded) {
        return true;
    }
    if (audioStartPendingAfterVideoSeek_.load()) {
        return ProcessVideoAfterSeek(bufferInfo, lastPushTime);
    }
    if (audioTrackSwitching_.load()) {
        return ProcessVideoDuringTrackSwitch(bufferInfo, lastPushTime);
    }
    int64_t framePosition = 0;
    int64_t timestamp = 0;
    int32_t ret = AUDIOSTREAM_SUCCESS;
    if (!GetAudioTimestampForVideo(bufferInfo, framePosition, timestamp, ret)) {
        return false;
    }
    if (ret != AUDIOSTREAM_SUCCESS || timestamp == 0 || framePosition == 0) {
        return ProcessVideoWithAudioWithoutTimestamp(bufferInfo, lastPushTime);
    }
    AvSyncDecision decision;
    if (!CalculateSyncParameters(bufferInfo, framePosition, decision)) {
        // 同步参数无效时没有送显路径会接管该 Buffer，直接丢弃并归还。
        (void)ReleaseVideoOutputBuffer(videoDecoder_.get(), bufferInfo, "invalid audio video sync parameters");
        playbackFailed_ = true;
        isStarted_ = false;
        return false;
    }
    const bool rendered = RenderAndRelease(bufferInfo, decision.waitTimeUs, decision.dropFrame);
    if (rendered && !decision.dropFrame) {
        StartAudioAfterVideoSeek();
    }
    return rendered;
}

bool Player::GetAudioTimestampForVideo(CodecBufferInfo& bufferInfo, int64_t& framePosition,
    int64_t& timestamp, int32_t& result)
{
    {
        std::lock_guard<std::mutex> rendererLock(audioRendererMutex_);
        if (audioRenderer_ == nullptr) {
            // 尚未进入 VideoSink，必须由当前输出线程归还该索引。
            (void)ReleaseVideoOutputBuffer(videoDecoder_.get(), bufferInfo, "audio renderer is null");
            playbackFailed_ = true;
            isStarted_ = false;
            return false;
        }
        result = OH_AudioRenderer_GetAudioTimestampInfo(audioRenderer_, &framePosition, &timestamp);
    }
    AVCODEC_SAMPLE_LOGD_LIMIT(PLAYBACK_LOG_FREQUENCY,
        "VD framePosition: %{public}li, audioTimestamp: %{public}li", framePosition, timestamp);
    playbackClock_.SetAudioTimestampNs(timestamp);
    return true;
}

bool Player::ProcessVideoWithAudioWithoutTimestamp(CodecBufferInfo& bufferInfo,
    std::chrono::time_point<std::chrono::system_clock>& lastPushTime)
{
    if (!PresentAndReleaseVideoBuffer(bufferInfo, true, GetCurrentTime())) {
        return false;
    }
    StartAudioAfterVideoSeek();
    std::this_thread::sleep_until(lastPushTime + std::chrono::microseconds(sampleInfo_.video.frameInterval));
    lastPushTime = std::chrono::system_clock::now();
    return true;
}

bool Player::ProcessVideoAfterSeek(CodecBufferInfo& bufferInfo,
    std::chrono::time_point<std::chrono::system_clock>& lastPushTime)
{
    if (!PresentAndReleaseVideoBuffer(bufferInfo, true, GetCurrentTime())) {
        return false;
    }
    renderSingleFrameAfterSeek_ = false;
    StartAudioAfterVideoSeek();
    lastPushTime = std::chrono::system_clock::now();
    return true;
}

bool Player::ProcessVideoDuringTrackSwitch(CodecBufferInfo& bufferInfo,
    std::chrono::time_point<std::chrono::system_clock>& lastPushTime)
{
    if (!PresentAndReleaseVideoBuffer(bufferInfo, true, GetCurrentTime())) {
        return false;
    }
    const auto frameInterval = std::chrono::microseconds(sampleInfo_.video.frameInterval);
    std::this_thread::sleep_until(lastPushTime + frameInterval);
    lastPushTime = std::chrono::system_clock::now();
    return true;
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
        int32_t pixelFormat = static_cast<int32_t>(videoDecContext_->outputPixelFormat);
        if (OH_AVFormat_GetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, &pixelFormat)) {
            videoDecContext_->outputPixelFormat = static_cast<OH_AVPixelFormat>(pixelFormat);
        }
        OH_AVFormat_Destroy(format);
    }
    videoDecContext_->isDecFirstFrame = false;
    AVCODEC_SAMPLE_LOGI("Sync mode init: %{public}d*%{public}d, stride: %{public}d*%{public}d, "
        "pixel format: %{public}d", videoDecContext_->width, videoDecContext_->height,
        videoDecContext_->widthStride, videoDecContext_->heightStride, videoDecContext_->outputPixelFormat);
}

bool Player::GetSyncVideoOutputBuffer(CodecBufferInfo& bufferInfo)
{
    int32_t ret = AVCODEC_SAMPLE_ERR_AGAIN;
    while (isStarted_ && ret == AVCODEC_SAMPLE_ERR_AGAIN) {
        std::unique_lock<std::mutex> lock(videoDecContext_->outputMutex);
        ret = videoDecoder_->GetOutputBuffer(bufferInfo, CODEC_BUFFER_TIMEOUT_US);
    }
    if (!isStarted_) {
        if (!ReleaseVideoOutputBuffer(videoDecoder_.get(), bufferInfo, "video output worker stopped")) {
            playbackFailed_ = true;
        }
        AVCODEC_SAMPLE_LOGI("VD Decoder output thread out");
        return false;
    }
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        // GetOutputBuffer 在取得 Buffer 后读取属性失败时仍可能留下已获取的索引。
        if (!ReleaseVideoOutputBuffer(videoDecoder_.get(), bufferInfo, "get video output buffer failed")) {
            playbackFailed_ = true;
            isStarted_ = false;
        }
        AVCODEC_SAMPLE_LOGE("VD Get out buffer failed, ret: %{public}d", ret);
        return false;
    }
    if (bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_EOS) {
        if (!ReleaseVideoOutputBuffer(videoDecoder_.get(), bufferInfo, "video output EOS")) {
            playbackFailed_ = true;
            isStarted_ = false;
        }
        AVCODEC_SAMPLE_LOGI("Catch EOS, video output thread out");
        return false;
    }
    InitSyncVideoOutputContext();
    videoDecContext_->outputFrameCount++;
    AVCODEC_SAMPLE_LOGD_LIMIT(PLAYBACK_LOG_FREQUENCY,
        "Out buffer count: %{public}u, size: %{public}d, flag: %{public}u, pts: %{public}" PRId64,
        videoDecContext_->outputFrameCount, bufferInfo.attr.size, bufferInfo.attr.flags, bufferInfo.attr.pts);
    return true;
}

bool Player::ProcessSyncVideoOutput(std::chrono::time_point<std::chrono::system_clock>& lastPushTime)
{
    CodecBufferInfo bufferInfo;
    if (!GetSyncVideoOutputBuffer(bufferInfo)) {
        return false;
    }
    return audioDecContext_ == nullptr ? ProcessVideoWithoutAudio(bufferInfo, lastPushTime) :
        ProcessVideoWithAudio(bufferInfo, lastPushTime);
}

void Player::FinishVideoOutput()
{
    std::lock_guard<std::mutex> lock(doneMutex);
    if (seekInProgress_.load()) {
        AVCODEC_SAMPLE_LOGI("Video output paused for seek");
        return;
    }
    playbackClock_.Reset(0);
    isVideoDone.store(true);
    doneCond_.notify_all();
}

void Player::VideoDecOutputSyncThread()
{
    sampleInfo_.video.frameInterval = US_PER_SECOND / sampleInfo_.video.frameRate;
    thread_local auto lastPushTime = std::chrono::system_clock::now();
    while (isStarted_) {
        WaitIfPaused();
        if (!ProcessSyncVideoOutput(lastPushTime)) {
            break;
        }
    }
    FinishVideoOutput();
}

void Player::VideoDecOutputAsyncThread()
{
    sampleInfo_.video.frameInterval = US_PER_SECOND / sampleInfo_.video.frameRate;
    while (isStarted_) {
        thread_local auto lastPushTime = std::chrono::system_clock::now();
        WaitIfPaused();
        CHECK_AND_BREAK_LOG(isStarted_, "VD Decoder output thread out");
        // [Start decoder_output_buffer]
        // 获取输出buffer。
        std::shared_ptr<CodecBufferInfo> bufferInfo = videoDecContext_->outputBufferQueue.Dequeue();
        std::shared_lock<std::shared_mutex> codecLock(videoDecContext_->codecMutex);
        //开发者可根据业务需要，对输出数据进行送显/保存/释放处理。
        // [End decoder_output_buffer]
        CHECK_AND_CONTINUE_LOG(bufferInfo != nullptr, "Buffer queue is empty, continue");
        if (!isStarted_) {
            if (!ReleaseVideoOutputBuffer(videoDecoder_.get(), *bufferInfo, "video output worker stopped")) {
                playbackFailed_ = true;
            }
            break;
        }
        if (bufferInfo->attr.flags & AVCODEC_BUFFER_FLAGS_EOS) {
            if (!ReleaseVideoOutputBuffer(videoDecoder_.get(), *bufferInfo, "video output EOS")) {
                playbackFailed_ = true;
                isStarted_ = false;
            }
            AVCODEC_SAMPLE_LOGI("Catch EOS, video output thread out");
            break;
        }
        videoDecContext_->outputFrameCount++;
        AVCODEC_SAMPLE_LOGD_LIMIT(PLAYBACK_LOG_FREQUENCY,
            "Out buffer count: %{public}u, size: %{public}d, flag: %{public}u, pts: %{public}" PRId64,
            videoDecContext_->outputFrameCount, bufferInfo->attr.size, bufferInfo->attr.flags, bufferInfo->attr.pts);
        const bool success = audioDecContext_ == nullptr ?
            ProcessVideoWithoutAudio(*bufferInfo, lastPushTime) : ProcessVideoWithAudio(*bufferInfo, lastPushTime);
        if (!success) {
            break;
        }
    }
    FinishVideoOutput();
}
