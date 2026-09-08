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
} // namespace

void Player::VideoDecInputSyncThread()
{
    while (isStarted_) {
        WaitIfPaused();
        CHECK_AND_BREAK_LOG(isStarted_, "Decoder input thread out");
        std::unique_lock<std::mutex> lock(videoDecContext_->inputMutex);
        CodecBufferInfo bufferInfo(nullptr);
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
        std::shared_ptr<CodecBufferInfo> bufferInfo = videoDecContext_->inputBufferQueue.Dequeue();
        std::shared_lock<std::shared_mutex> codecLock(videoDecContext_->codecMutex);
        CHECK_AND_BREAK_LOG(isStarted_, "Work done, thread out");
        CHECK_AND_CONTINUE_LOG(bufferInfo != nullptr && bufferInfo->isValid,
            "Buffer queue is empty or invalid, continue");
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

bool Player::CalculateSyncParameters(CodecBufferInfo& bufferInfo, int64_t framePosition,
    int64_t& waitTimeUs, bool& dropFrame)
{
    int64_t audioFramesWritten = 0;
    int64_t currentAudioPts = 0;
    {
        std::lock_guard<std::mutex> lock(audioDecContext_->outputMutex);
        audioFramesWritten = audioDecContext_->audioFramesWritten;
        currentAudioPts = audioDecContext_->currentPosAudioBufferPts;
    }
    const AvSyncDecision decision = avSyncController_.Decide({
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
    waitTimeUs = decision.waitTimeUs;
    dropFrame = decision.dropFrame;
    AVCODEC_SAMPLE_LOGI("VD sync decision, index: %{public}u, waitTimeUs: %{public}" PRId64
        ", drop: %{public}d", bufferInfo.bufferIndex, waitTimeUs, dropFrame);
    return true;
}

void Player::SetVolume(float volume)
{
    const float clampedVolume = std::clamp(volume, 0.0f, 1.0f);
    sampleInfo_.audioPlayback.volume = clampedVolume;
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
    const int64_t renderLeadUs = std::clamp(waitTimeUs, int64_t { 0 }, AvSyncController::renderAheadUs);
    if (waitTimeUs > AvSyncController::renderAheadUs) {
        std::this_thread::sleep_for(std::chrono::microseconds(waitTimeUs - AvSyncController::renderAheadUs));
    }
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
    {
        std::lock_guard<std::mutex> rendererLock(audioRendererMutex_);
        if (audioRenderer_ == nullptr) {
            return false;
        }
        ret = OH_AudioRenderer_GetAudioTimestampInfo(audioRenderer_, &framePosition, &timestamp);
    }
    AVCODEC_SAMPLE_LOGI("VD framePosition: %{public}li, audioTimestamp: %{public}li", framePosition, timestamp);
    playbackClock_.SetAudioTimestampNs(timestamp);
    if (ret != AUDIOSTREAM_SUCCESS || timestamp == 0 || framePosition == 0) {
        if (!PresentAndReleaseVideoBuffer(bufferInfo, true, GetCurrentTime())) {
            return false;
        }
        StartAudioAfterVideoSeek();
        std::this_thread::sleep_until(lastPushTime + std::chrono::microseconds(sampleInfo_.video.frameInterval));
        lastPushTime = std::chrono::system_clock::now();
        return true;
    }
    int64_t waitTimeUs = 0;
    bool dropFrame = false;
    if (!CalculateSyncParameters(bufferInfo, framePosition, waitTimeUs, dropFrame)) {
        return false;
    }
    const bool rendered = RenderAndRelease(bufferInfo, waitTimeUs, dropFrame);
    if (rendered && !dropFrame) {
        StartAudioAfterVideoSeek();
    }
    return rendered;
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
        int32_t pixelFormat = sampleInfo_.video.pixelFormat;
        if (OH_AVFormat_GetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, &pixelFormat)) {
            sampleInfo_.video.pixelFormat = static_cast<OH_AVPixelFormat>(pixelFormat);
        }
        OH_AVFormat_Destroy(format);
    }
    videoDecContext_->isDecFirstFrame = false;
    AVCODEC_SAMPLE_LOGI("Sync mode init: %{public}d*%{public}d, stride: %{public}d*%{public}d, "
        "pixel format: %{public}d", videoDecContext_->width, videoDecContext_->height,
        videoDecContext_->widthStride, videoDecContext_->heightStride, sampleInfo_.video.pixelFormat);
}

bool Player::GetSyncVideoOutputBuffer(CodecBufferInfo& bufferInfo)
{
    int32_t ret = AVCODEC_SAMPLE_ERR_AGAIN;
    while (isStarted_ && ret == AVCODEC_SAMPLE_ERR_AGAIN) {
        std::unique_lock<std::mutex> lock(videoDecContext_->outputMutex);
        ret = videoDecoder_->GetOutputBuffer(bufferInfo, CODEC_BUFFER_TIMEOUT_US);
    }
    CHECK_AND_RETURN_RET_LOG(isStarted_, false, "VD Decoder output thread out");
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, false, "VD Get out buffer failed, ret: %{public}d", ret);
    CHECK_AND_RETURN_RET_LOG(!(bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_EOS), false, "Catch EOS, thread out");
    InitSyncVideoOutputContext();
    videoDecContext_->outputFrameCount++;
    AVCODEC_SAMPLE_LOGW("Out buffer count: %{public}u, size: %{public}d, flag: %{public}u, pts: %{public}" PRId64,
        videoDecContext_->outputFrameCount, bufferInfo.attr.size, bufferInfo.attr.flags, bufferInfo.attr.pts);
    return true;
}

bool Player::ProcessSyncVideoOutput(std::chrono::time_point<std::chrono::system_clock>& lastPushTime)
{
    CodecBufferInfo bufferInfo(nullptr);
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
        std::shared_ptr<CodecBufferInfo> bufferInfo = videoDecContext_->outputBufferQueue.Dequeue();
        std::shared_lock<std::shared_mutex> codecLock(videoDecContext_->codecMutex);
        CHECK_AND_BREAK_LOG(isStarted_, "VD Decoder output thread out");
        CHECK_AND_CONTINUE_LOG(bufferInfo != nullptr && bufferInfo->isValid,
            "Buffer queue is empty or invalid, continue");
        CHECK_AND_BREAK_LOG(!(bufferInfo->attr.flags & AVCODEC_BUFFER_FLAGS_EOS), "Catch EOS, thread out");
        videoDecContext_->outputFrameCount++;
        AVCODEC_SAMPLE_LOGW("Out buffer count: %{public}u, size: %{public}d, flag: %{public}u, pts: %{public}" PRId64,
            videoDecContext_->outputFrameCount, bufferInfo->attr.size, bufferInfo->attr.flags, bufferInfo->attr.pts);
        const bool success = audioDecContext_ == nullptr ?
            ProcessVideoWithoutAudio(*bufferInfo, lastPushTime) : ProcessVideoWithAudio(*bufferInfo, lastPushTime);
        if (!success) {
            break;
        }
    }
    FinishVideoOutput();
}
