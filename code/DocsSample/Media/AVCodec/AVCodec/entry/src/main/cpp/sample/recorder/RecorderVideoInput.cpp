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

bool Recorder::ReadVideoInputLayout(int32_t &stride, int32_t &sliceHeight)
{
    std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)> format(videoEncoder_->GetInputDescription(),
                                                                        OH_AVFormat_Destroy);
    int32_t pixelFormat = -1;
    // 跨距必须由编码器报告，不能从分辨率猜测；相机和编码器两侧的填充可能不同。
    return format != nullptr && OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_VIDEO_STRIDE, &stride) &&
           OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_VIDEO_SLICE_HEIGHT, &sliceHeight) &&
           OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_PIXEL_FORMAT, &pixelFormat) &&
           pixelFormat == AV_PIXEL_FORMAT_NV12 && stride >= sampleInfo_.video.videoWidth &&
           sliceHeight >= sampleInfo_.video.videoHeight;
}

void Recorder::StartVideoInputThread()
{
    if (frameReceiver_ == nullptr) {
        return;
    }
    if (sampleInfo_.codec.codecSyncMode) {
        videoEncInputThread_ = std::make_unique<std::thread>(&Recorder::VideoEncInputSyncThread, this);
    } else {
        videoEncInputThread_ = std::make_unique<std::thread>(&Recorder::VideoEncInputAsyncThread, this);
    }
}

OH_ImageNative *Recorder::ReadVideoInputImage(int64_t lastSubmittedUs)
{
    if (encContext_->hasError.load()) {
        AbortRecording("Video input callback failed");
        return nullptr;
    }
    if (RecorderClockUs() - lastSubmittedUs > INPUT_STALL_US) {
        AbortRecording("Camera Buffer input stalled: check YUV output combination and encoder input");
        return nullptr;
    }
    // Receiver容量为3，始终读最新帧；编码输入不足时丢弃本帧，避免采集延迟累积。
    OH_ImageNative *image = frameReceiver_->ReadLatest();
    if (image == nullptr) {
        std::this_thread::sleep_for(std::chrono::milliseconds(FRAME_POLL_MS));
    }
    return image;
}

// [Start recorder_video_buffer_input]
// [Start recorder_video_buffer_input_sync]
void Recorder::VideoEncInputSyncThread()
{
    VideoInputState state;
    state.lastSubmittedUs = RecorderClockUs();
    while (isStarted_.load() && !videoInputStopping_.load()) {
        const CameraImage image(ReadVideoInputImage(state.lastSubmittedUs), OH_ImageNative_Release);
        if (image == nullptr) {
            continue;
        }
        const int64_t receivedAtUs = RecorderClockUs();
        CodecBufferInfo info;
        // 同步模式主动Query输入索引，再Get对应的编码器Buffer。
        if (videoEncoder_->GetInputBuffer(info, INPUT_WAIT_US) == nullptr) {
            continue;
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
    while (isStarted_.load() && !videoInputStopping_.load()) {
        const CameraImage image(ReadVideoInputImage(state.lastSubmittedUs), OH_ImageNative_Release);
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
    if (state.stride == 0 && !ReadVideoInputLayout(state.stride, state.sliceHeight)) {
        AbortRecording("Encoder did not report a valid NV12 input layout");
        return false;
    }
    if (!frameReceiver_->Copy(image, info.buffer, state.stride, state.sliceHeight, info.attr.size)) {
        AbortRecording("Camera YUV image is not CPU-readable or has an unsupported layout");
        return false;
    }
    if (state.firstTimestampNs < 0) {
        state.firstTimestampNs = timestampNs;
        state.firstOffsetUs = std::max<int64_t>(0, receivedAtUs - captureStartedUs_);
    }
    // 相机时间戳为ns，编码Buffer使用us。首帧保留相对录制启动的偏移，与音频共用起点。
    const int64_t ptsUs = state.firstOffsetUs + (timestampNs - state.firstTimestampNs) / NS_PER_US;
    if (ptsUs < lastVideoInputPtsUs_) {
        AbortRecording("Camera timestamp moved backwards");
        return false;
    }
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
    if (videoEncInputThread_ != nullptr && videoEncInputThread_->joinable()) {
        videoEncInputThread_->join();
    }
    videoEncInputThread_.reset();
    if (!isStarted_.load()) {
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
    return sampleInfo_.codec.codecSyncMode ? SendBufferVideoEndOfStreamSync() : SendBufferVideoEndOfStreamAsync();
}

// [Start recorder_video_buffer_eos_sync]
int32_t Recorder::SendBufferVideoEndOfStreamSync()
{
    CodecBufferInfo info;
    if (videoEncoder_->GetInputBuffer(info, DRAIN_WAIT_US) == nullptr) {
        return AVCODEC_SAMPLE_ERR_ERROR;
    }
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
