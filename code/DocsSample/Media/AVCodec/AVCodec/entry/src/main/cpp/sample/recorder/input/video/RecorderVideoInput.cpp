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
#include "RecorderFrameEffects.h"
#include <algorithm>

namespace {
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
// [Start recorder_buffer_input_first]
//  获取首帧视频宽跨距和高跨距。
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
// [End recorder_buffer_input_first]

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

bool Recorder::ValidateVideoInputImage(OH_ImageNative *image, VideoInputState &state)
{
    // videoInputStopping_请求停止Buffer视频供帧；取图期间收到停止或故障时丢弃当前图像。
    if (!isStarted_.load() || videoInputStopping_.load()) {
        return false;
    }
    if (isPaused_) {
        state.lastSubmittedUs = RecorderClockUs();
        return false;
    }
    if (encContext_->hasError.load()) {
        AbortRecording("Video input callback failed");
        return false;
    }
    if (state.pauseRevision != pauseRevision_.load()) {
        state.pauseRevision = pauseRevision_.load();
        state.lastSubmittedUs = RecorderClockUs();
    }
    if (RecorderClockUs() - state.lastSubmittedUs > INPUT_STALL_US) {
        AbortRecording("Camera Buffer input stalled: check YUV output combination and encoder input");
        return false;
    }
    if (image == nullptr) {
        return false;
    }
    int64_t timestampNs = 0;
    if (OH_ImageNative_GetTimestamp(image, &timestampNs) != IMAGE_SUCCESS || timestampNs < 0 ||
        timestampNs < state.lastTimestampNs) {
        AbortRecording("Invalid or regressing camera timestamp");
        return false;
    }
    // 恢复时相机仍可能交来暂停期间在途的图像；申请编码输入前丢弃旧时间轴上的帧。
    const int64_t projectedPts = state.firstTimestampNs < 0 ? lastVideoInputPtsUs_ + 1 :
        state.firstOffsetUs + (timestampNs - state.firstTimestampNs) / NS_PER_US -
        (pausedDurationUs_ - state.initialPausedUs);
    if (projectedPts <= lastVideoInputPtsUs_) {
        return false;
    }
    return true;
}

void Recorder::VideoEncInputSyncThread()
{
    VideoInputState state;
    // 先初始化心跳时间，避免启动瞬间被误判为停滞。
    state.lastSubmittedUs = RecorderClockUs();
    while (isStarted_.load()) {
        // videoInputStopping_请求停止Buffer视频供帧；在此提交EOS，不清零控制输出排空的isStarted_。
        if (videoInputStopping_.load()) {
            // [Start recorder_video_buffer_eos_sync]
            CodecBufferInfo info;
            int32_t ret = videoEncoder_->GetInputBuffer(info, DRAIN_WAIT_US);
            if (!isStarted_.load()) {
                break;
            }
            if (ret == AVCODEC_SAMPLE_ERR_OK) {
                info.attr.size = 0;
                info.attr.offset = 0;
                info.attr.pts = lastVideoInputPtsUs_;
                info.attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
                ret = videoEncoder_->PushInputBuffer(info);
            }
            if (ret != AVCODEC_SAMPLE_ERR_OK) {
                failure_.Record("recorder.video.input.eos", ret, "Submit video EOS input buffer failed");
                AbortRecording("Submit video EOS input buffer failed");
                break;
            }
            AVCODEC_SAMPLE_LOGI("Sync video input submitted EOS, thread exiting");
            break;
            // [End recorder_video_buffer_eos_sync]
        }
        // 等待相机图像时不占用暂停锁；校验和提交仍与暂停切换串行。
        const CameraImage image(frameReceiver_->ReadLatest(INPUT_WAIT_MS), OH_ImageNative_Release);
        std::lock_guard<std::mutex> inputLock(mediaInputMutex_);
        if (!ValidateVideoInputImage(image.get(), state)) {
            continue;
        }
        const int64_t receivedAtUs = RecorderClockUs();
        // [EndExclude recorder_video_buffer_input_sync]
        CodecBufferInfo info;
        // 同步模式主动Query输入索引，再Get对应的编码器Buffer。
        const int32_t ret = videoEncoder_->GetInputBuffer(info, INPUT_WAIT_US);
        if (ret == AVCODEC_SAMPLE_ERR_AGAIN) {
            continue;
        }
        /**
         * 示例：配置输入文件。
         * std::string_view inputFilePath = "/*yourpath*.yuv";
         * std::unique_ptr<std::ifstream> inputFile = std::make_unique<std::ifstream>();
         * if (inputFile != nullptr) {
         *     inputFile->open(inputFilePath.data(), std::ios::in | std::ios::binary);
         * }
         */
        if (ret != AVCODEC_SAMPLE_ERR_OK || !InitSyncVideoInputContext()) {
            AbortRecording("Get video input buffer or input description failed");
            break;
        }
        // [StartExclude recorder_video_buffer_input_sync]
        if (!SubmitVideoInputImage(image.get(), info, state, receivedAtUs)) {
            break;
        }
        // [EndExclude recorder_video_buffer_input_sync]
    }
// [End recorder_video_buffer_input_sync]
}

void Recorder::VideoEncInputAsyncThread()
{
    VideoInputState state;
    // 先初始化心跳时间，避免启动瞬间被误判为停滞。
    state.lastSubmittedUs = RecorderClockUs();
    while (isStarted_.load()) {
        // videoInputStopping_请求停止Buffer视频供帧；在此提交EOS，不清零控制输出排空的isStarted_。
        if (videoInputStopping_.load()) {
            // [Start recorder_video_buffer_eos_async]
            const auto input = encContext_->inputBufferQueue.Dequeue(DRAIN_WAIT_MS);
            if (!isStarted_.load()) {
                break;
            }
            if (input == nullptr || input->buffer == nullptr) {
                AbortRecording("Get video EOS input buffer failed");
                break;
            }
            CodecBufferInfo info = *input;
            info.attr.size = 0;
            info.attr.offset = 0;
            info.attr.pts = lastVideoInputPtsUs_;
            info.attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
            const int32_t ret = videoEncoder_->PushInputBuffer(info);
            if (ret != AVCODEC_SAMPLE_ERR_OK) {
                failure_.Record("recorder.video.input.eos", ret, "Submit video EOS input buffer failed");
                AbortRecording("Submit video EOS input buffer failed");
                break;
            }
            AVCODEC_SAMPLE_LOGI("Async video input submitted EOS, thread exiting");
            break;
            // [End recorder_video_buffer_eos_async]
        }
        // 等待相机图像时不占用暂停锁；校验和提交仍与暂停切换串行。
        const CameraImage image(frameReceiver_->ReadLatest(INPUT_WAIT_MS), OH_ImageNative_Release);
        std::lock_guard<std::mutex> inputLock(mediaInputMutex_);
        if (!ValidateVideoInputImage(image.get(), state)) {
            continue;
        }
        const int64_t receivedAtUs = RecorderClockUs();
        // [Start recorder_video_buffer_input_async]
        // 异步模式只消费OnNeedInputBuffer回调入队的Buffer和索引，不调用Query/Get接口。
        const auto bufferInfo = encContext_->inputBufferQueue.Dequeue(INPUT_WAIT_MS);
        if (input == nullptr || input->buffer == nullptr) {
            continue;
        }
         /**
         * // 示例：读取输入文件数据，将数据写入buffer，设置属性后送入编码器。
         * // 输入文件配置。
         * std::string_view inputFilePath = "/*yourpath*.yuv";
         * std::unique_ptr<std::ifstream> inputFile = std::make_unique<std::ifstream>();
         * if (inputFile != nullptr) {
         *     inputFile->open(inputFilePath.data(), std::ios::in | std::ios::binary);
         * }
         *
         * // 将数据写入buffer，设置属性后送入编码器。
         * int32_t frameSize = 0;
         * if (widthStride == width && heightStride == height) {
         *     frameSize = width * height * 3 / 2; // NV12像素格式下，每帧数据大小的计算公式。
         *     int32_t capacity = OH_AVBuffer_GetCapacity(bufferInfo->buffer);
         *     if (frameSize > capacity) {
         *         // 异常处理。
         *     }
         *     // 处理文件流得到帧的长度，再将需要编码的数据写入到对应index的buffer中。
         *     uint8_t *addr = OH_AVBuffer_GetAddr(bufferInfo->buffer);
         *     if (addr == nullptr) {
         *        // 异常处理。
         *     }
         *     if (inputFile != nullptr && inputFile->is_open()) {
         *        inputFile->read(reinterpret_cast<char *>(addr), frameSize);
         *     }
         * } else {
         *     // 如果跨距不等于宽，需要开发者按照跨距进行跨距对齐处理。
         * }
         * // 配置buffer info信息。
         * OH_AVCodecBufferAttr info;
         * info.size = frameSize;
         * info.offset = 0;
         * // 注意此处和Surface模式不同，pts需要应用填充，可根据预期显示的时间进行计算写入，如：帧数 * 1000000 / frameRate。
         * info.pts = 0;
         * // 避免flags随机初始化为AVCODEC_BUFFER_FLAGS_EOS导致使用异常，flags需要赋值如0（普通帧标识）。
         * info.flags = 0;
         * OH_AVErrCode setBufferRet = OH_AVBuffer_SetBufferAttr(bufferInfo->buffer, &info);
         * if (setBufferRet != AV_ERR_OK) {
         *     // 异常处理。
         * }
         * // 配置buffer随帧信息。
         * // 值由开发者决定。
         * int32_t isIFrame;
         * auto parameter =
         *     std::shared_ptr<OH_AVFormat>(OH_AVBuffer_GetParameter(bufferInfo->buffer), OH_AVFormat_Destroy);
         * if (parameter == nullptr) {
         *     // 异常处理。
         * }
         * OH_AVFormat_SetIntValue(parameter.get(), OH_MD_KEY_REQUEST_I_FRAME, isIFrame);
         * OH_AVErrCode parameterRet = OH_AVBuffer_SetParameter(bufferInfo->buffer, parameter.get());
         * if (parameterRet != AV_ERR_OK) {
         *     // 异常处理。
         * }
         * // 送入编码输入队列进行编码，index为对应输入队列的下标。
         * OH_AVErrCode pushInputRet = OH_VideoEncoder_PushInputBuffer(videoEnc, bufferInfo->index);
         * if (pushInputRet != AV_ERR_OK) {
         *     // 异常处理。
         * }
         */
        // [End recorder_video_buffer_input_async]
        if (!SubmitVideoInputImage(image.get(), *input, state, receivedAtUs)) {
            break;
        }
    }
}


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
    // 仅修改已取得的编码输入Buffer；相机原始Image和预览Surface保持原样。
    if ((sampleInfo_.video.grayscale || sampleInfo_.video.watermark) &&
        !RecorderFrames::ApplyEffects(OH_AVBuffer_GetAddr(info.buffer), OH_AVBuffer_GetCapacity(info.buffer),
            sampleInfo_.video.videoWidth, sampleInfo_.video.videoHeight, encContext_->inputWidthStride,
            encContext_->inputHeightStride, sampleInfo_.video.grayscale, sampleInfo_.video.watermark)) {
        AbortRecording("Apply recording pixel effects failed");
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
    // 注意输入的buffer需跨距对齐。
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
    // videoInputStopping_通知Buffer视频输入线程停止供帧并提交EOS；输出线程仍由isStarted_控制。
    videoInputStopping_.store(true);
    frameReceiver_->CancelWait();
    videoInputWorker_.Join();
    if (isStarted_.load()) {
        return AVCODEC_SAMPLE_ERR_OK;
    }
    const int32_t ret = failure_.Snapshot().code;
    return ret != AVCODEC_SAMPLE_ERR_OK ? ret : AVCODEC_SAMPLE_ERR_ERROR;
}
