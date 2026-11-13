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

#include "../../core/Recorder.h"
#include <algorithm>

namespace {
constexpr int32_t FRAME_POLL_MS = 5;
constexpr int32_t INPUT_WAIT_MS = 20;
constexpr int32_t DRAIN_WAIT_MS = 5000;
constexpr int64_t US_PER_MS = 1000;
constexpr int64_t INPUT_WAIT_US = INPUT_WAIT_MS * US_PER_MS;
constexpr int64_t DRAIN_WAIT_US = DRAIN_WAIT_MS * US_PER_MS;
constexpr int64_t INPUT_STALL_US = 5000000;
constexpr int64_t NS_PER_US = 1000;
using CameraImage = std::unique_ptr<OH_ImageNative, decltype(&OH_ImageNative_Release)>;
} // namespace

uint64_t Recorder::GetCameraInputSurfaceId() const
{
    if (frameReceiver_ != nullptr) {
        return frameReceiver_->GetSurfaceId();
    }
    uint64_t id = 0;
    if (sampleInfo_.video.window != nullptr) {
        (void)OH_NativeWindow_GetSurfaceId(sampleInfo_.video.window, &id);
    }
    return id;
}

bool Recorder::InitSyncVideoInputContext()
{
    if (!encContext_->isEncFirstFrame) {
        return true;
    }
    std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)> format(videoEncoder_->GetInputDescription(),
                                                                        OH_AVFormat_Destroy);
    int32_t pixelFormat = -1;
    // 与同步解码首帧读取输出描述对应：取得首个输入Buffer后，读取编码器的实际输入布局。
    if (format == nullptr ||
        !OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_VIDEO_STRIDE, &encContext_->inputWidthStride) ||
        !OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_VIDEO_SLICE_HEIGHT, &encContext_->inputHeightStride) ||
        !OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, &pixelFormat)) {
        return false;
    }
    encContext_->inputPixelFormat = static_cast<OH_AVPixelFormat>(pixelFormat);
    encContext_->isEncFirstFrame = false;
    return true;
}

int32_t Recorder::StartVideoInputThread()
{
    if (frameReceiver_ == nullptr) {
        return AVCODEC_SAMPLE_ERR_OK;
    }
    const bool started = sampleInfo_.codec.codecSyncMode ?
        videoInputWorker_.Start([this]() { VideoEncInputSyncThread(); }) :
        videoInputWorker_.Start([this]() { VideoEncInputAsyncThread(); });
    CHECK_AND_RETURN_RET_LOG(started, AVCODEC_SAMPLE_ERR_ERROR, "Create video input worker failed");
    return AVCODEC_SAMPLE_ERR_OK;
}

OH_ImageNative *Recorder::ReadVideoInputImage(VideoInputState &state)
{
    if (encContext_->hasError.load()) {
        AbortRecording("Video input callback failed");
        return nullptr;
    }
    if (state.pauseRevision != pauseRevision_.load()) {
        state.pauseRevision = pauseRevision_.load();
        state.lastSubmittedUs = RecorderClockUs();
    }
    if (RecorderClockUs() - state.lastSubmittedUs > INPUT_STALL_US) {
        AbortRecording("Camera Buffer input stalled: check YUV output combination and encoder input");
        return nullptr;
    }
    // Receiver容量为3，始终读最新帧；编码输入不足时丢弃本帧，避免采集延迟累积。
    OH_ImageNative *image = frameReceiver_->ReadLatest();
    if (image == nullptr) {
        std::this_thread::sleep_for(std::chrono::milliseconds(FRAME_POLL_MS));
        return nullptr;
    }
    int64_t timestampNs = 0;
    if (OH_ImageNative_GetTimestamp(image, &timestampNs) != IMAGE_SUCCESS || timestampNs < 0 ||
        timestampNs < state.lastTimestampNs) {
        (void)OH_ImageNative_Release(image);
        AbortRecording("Invalid or regressing camera timestamp");
        return nullptr;
    }
    // 恢复时相机仍可能交来暂停期间在途的图像；申请编码输入前丢弃旧时间轴上的帧。
    const int64_t projectedPts = state.firstTimestampNs < 0 ? lastVideoInputPtsUs_ + 1 :
        state.firstOffsetUs + (timestampNs - state.firstTimestampNs) / NS_PER_US -
        (pausedDurationUs_ - state.initialPausedUs);
    if (projectedPts <= lastVideoInputPtsUs_) {
        (void)OH_ImageNative_Release(image);
        return nullptr;
    }
    return image;
}

// [Start recorder_video_buffer_input]
// [Start recorder_video_buffer_input_sync]
void Recorder::VideoEncInputSyncThread()
{
    VideoInputState state;
    state.lastSubmittedUs = RecorderClockUs();
    // videoInputStopping_单独结束视频输入线程，停止读取相机图像、提交普通帧，让输出线程继续排空编码数据。
    while (isStarted_.load() && !videoInputStopping_.load()) {
        std::unique_lock<std::mutex> inputLock(mediaInputMutex_);
        if (isPaused_) {
            const CameraImage discarded(frameReceiver_->ReadLatest(), OH_ImageNative_Release);
            state.lastSubmittedUs = RecorderClockUs();
            inputLock.unlock();
            std::this_thread::sleep_for(std::chrono::milliseconds(FRAME_POLL_MS));
            continue;
        }
        const CameraImage image(ReadVideoInputImage(state), OH_ImageNative_Release);
        if (image == nullptr) {
            continue;
        }
        const int64_t receivedAtUs = RecorderClockUs();
        CodecBufferInfo info;
        // 同步模式主动Query输入索引，再Get对应的编码器Buffer。
        const int32_t ret = videoEncoder_->GetInputBuffer(info, INPUT_WAIT_US);
        if (ret == AVCODEC_SAMPLE_ERR_AGAIN) {
            continue;
        }
        if (ret != AVCODEC_SAMPLE_ERR_OK || !InitSyncVideoInputContext()) {
            AbortRecording("Get video input buffer or input description failed");
            break;
        }
        if (!SubmitVideoInputImage(image.get(), info, state, receivedAtUs)) {
            break;
        }
    }
}
// [End recorder_video_buffer_input_sync]

// [Start recorder_video_buffer_input_async]
void Recorder::VideoEncInputAsyncThread()
{
    VideoInputState state;
    state.lastSubmittedUs = RecorderClockUs();
    // videoInputStopping_单独结束视频输入线程，停止读取相机图像、提交普通帧，让输出线程继续排空编码数据。
    while (isStarted_.load() && !videoInputStopping_.load()) {
        std::unique_lock<std::mutex> inputLock(mediaInputMutex_);
        if (isPaused_) {
            const CameraImage discarded(frameReceiver_->ReadLatest(), OH_ImageNative_Release);
            state.lastSubmittedUs = RecorderClockUs();
            inputLock.unlock();
            std::this_thread::sleep_for(std::chrono::milliseconds(FRAME_POLL_MS));
            continue;
        }
        const CameraImage image(ReadVideoInputImage(state), OH_ImageNative_Release);
        if (image == nullptr) {
            continue;
        }
        const int64_t receivedAtUs = RecorderClockUs();
        // 异步模式只消费OnNeedInputBuffer回调入队的Buffer和索引，不调用Query/Get接口。
        const auto input = encContext_->inputBufferQueue.Dequeue(INPUT_WAIT_MS);
        if (input == nullptr || input->buffer == nullptr) {
            continue;
        }
        if (!SubmitVideoInputImage(image.get(), *input, state, receivedAtUs)) {
            break;
        }
    }
}
// [End recorder_video_buffer_input_async]
// [End recorder_video_buffer_input]

bool Recorder::SubmitVideoInputImage(OH_ImageNative *image, CodecBufferInfo &info, VideoInputState &state,
    int64_t receivedAtUs)
{
    int64_t timestampNs = 0;
    if (OH_ImageNative_GetTimestamp(image, &timestampNs) != IMAGE_SUCCESS || timestampNs < 0) {
        AbortRecording("Read camera image timestamp failed");
        return false;
    }
    if (timestampNs < state.lastTimestampNs) {
        AbortRecording("Camera timestamp moved backwards");
        return false;
    }
    state.lastTimestampNs = timestampNs;
    if (encContext_->isEncFirstFrame || encContext_->inputPixelFormat != AV_PIXEL_FORMAT_NV12 ||
        encContext_->inputWidthStride < sampleInfo_.video.videoWidth ||
        encContext_->inputHeightStride < sampleInfo_.video.videoHeight) {
        AbortRecording("Encoder did not report a valid NV12 input layout");
        return false;
    }
    if (!frameReceiver_->Copy(image, info.buffer, encContext_->inputWidthStride,
        encContext_->inputHeightStride, info.attr.size)) {
        AbortRecording("Camera YUV image is not CPU-readable or has an unsupported layout");
        return false;
    }
    if (state.firstTimestampNs < 0) {
        state.firstTimestampNs = timestampNs;
        state.initialPausedUs = pausedDurationUs_;
        state.firstOffsetUs = std::max<int64_t>(0, receivedAtUs - captureStartedUs_ - pausedDurationUs_);
    }
    // 相机时间戳为ns，编码Buffer使用us。首帧保留相对录制启动的偏移，与音频共用起点。
    // 暂停前已送入编码器的帧正常排空；恢复后的帧扣除暂停时长，边界处保持PTS递增。
    const int64_t ptsUs = std::max(lastVideoInputPtsUs_ + 1,
        state.firstOffsetUs + (timestampNs - state.firstTimestampNs) / NS_PER_US -
        (pausedDurationUs_ - state.initialPausedUs));
    info.attr.pts = ptsUs;
    info.attr.offset = 0;
    info.attr.flags = AVCODEC_BUFFER_FLAGS_NONE;
    if (videoEncoder_->PushInputBuffer(info) != AVCODEC_SAMPLE_ERR_OK) {
        AbortRecording("Submit camera frame to video encoder failed");
        return false;
    }
    lastVideoInputPtsUs_ = ptsUs;
    ++encContext_->inputFrameCount;
    state.lastSubmittedUs = RecorderClockUs();
    return true;
}

int32_t Recorder::SendBufferVideoEndOfStream()
{
    std::lock_guard<std::mutex> inputLock(videoInputMutex_);
    // ArkTS已停止相机输出；先join唯一输入线程，再获取专用于EOS的输入Buffer。
    videoInputStopping_.store(true);
    videoInputWorker_.Join();
    if (!isStarted_.load()) {
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    return sampleInfo_.codec.codecSyncMode ? SendBufferVideoEndOfStreamSync() : SendBufferVideoEndOfStreamAsync();
}

// [Start recorder_video_buffer_eos_sync]
int32_t Recorder::SendBufferVideoEndOfStreamSync()
{
    CodecBufferInfo info;
    const int32_t ret = videoEncoder_->GetInputBuffer(info, DRAIN_WAIT_US);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, ret, "Get video EOS input buffer failed");
    info.attr.size = 0;
    info.attr.offset = 0;
    info.attr.pts = lastVideoInputPtsUs_;
    info.attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    return videoEncoder_->PushInputBuffer(info);
}
// [End recorder_video_buffer_eos_sync]

// [Start recorder_video_buffer_eos_async]
int32_t Recorder::SendBufferVideoEndOfStreamAsync()
{
    const auto input = encContext_->inputBufferQueue.Dequeue(DRAIN_WAIT_MS);
    if (input == nullptr || input->buffer == nullptr) {
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    CodecBufferInfo info = *input;
    info.attr.size = 0;
    info.attr.offset = 0;
    info.attr.pts = lastVideoInputPtsUs_;
    info.attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    return videoEncoder_->PushInputBuffer(info);
}
// [End recorder_video_buffer_eos_async]
