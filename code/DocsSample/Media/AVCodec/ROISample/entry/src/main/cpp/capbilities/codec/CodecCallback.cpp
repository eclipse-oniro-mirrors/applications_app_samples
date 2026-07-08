/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "include/CodecCallback.h"
#include "SampleLog.h"
#include "FrameQueue.h"
#include <algorithm>

void CodecCallback::OnCodecError([[maybe_unused]]OH_AVCodec *codec, [[maybe_unused]]int32_t errorCode,
                                 [[maybe_unused]]void *userData) {
    SAMPLE_LOGI("On codec error, error code: %{public}d", errorCode);
}

void CodecCallback::OnCodecFormatChange([[maybe_unused]]OH_AVCodec *codec, [[maybe_unused]]OH_AVFormat *format,
                                         [[maybe_unused]]void *userData) {
    SAMPLE_LOGI("On codec format change");
}

// [Start roi_buffer_mode_callback]
static void FillBufferModeInput(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer,
                                CodecUserData *codecUserData) {
    FrameItem frameItem;
    if (!codecUserData->frameQueue->pop(frameItem, std::chrono::milliseconds(FRAME_QUEUE_POP_TIMEOUT_MS))) {
        OH_VideoEncoder_PushInputBuffer(codec, index);
        return;
    }
    uint8_t *bufferAddr = OH_AVBuffer_GetAddr(buffer);
    int32_t bufferCapacity = OH_AVBuffer_GetCapacity(buffer);
    if (bufferAddr != nullptr && bufferCapacity >= static_cast<int32_t>(frameItem.pixels.size())) {
        std::copy(frameItem.pixels.data(), frameItem.pixels.data() + frameItem.pixels.size(), bufferAddr);
        OH_AVCodecBufferAttr attr;
        attr.size = static_cast<int32_t>(frameItem.pixels.size());
        attr.offset = 0;
        attr.flags = AVCODEC_BUFFER_FLAGS_NONE;
        OH_AVBuffer_SetBufferAttr(buffer, &attr);
    }
    if (!frameItem.roiStr.empty()) {
        OH_AVFormat *format = OH_AVBuffer_GetParameter(buffer);
        if (format != nullptr) {
            OH_AVFormat_SetStringValue(format, OH_MD_KEY_VIDEO_ENCODER_ROI_PARAMS, frameItem.roiStr.c_str());
        }
    }
    OH_VideoEncoder_PushInputBuffer(codec, index);
}

void CodecCallback::OnNeedInputBuffer(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData) {
    if (userData == nullptr) {
        return;
    }
    CodecUserData *codecUserData = static_cast<CodecUserData *>(userData);

    // Buffer模式：用帧队列的像素数据和ROI填充编码器Buffer
    if (codecUserData->roiPathType == ROI_PATH_BUFFER_MODE && codecUserData->frameQueue != nullptr) {
        FillBufferModeInput(codec, index, buffer, codecUserData);
        return;
    }
    // [End roi_buffer_mode_callback]
    // Surface模式: Just queue for audio processing
    std::unique_lock<std::mutex> lock(codecUserData->inputMutex);
    codecUserData->inputBufferInfoQueue.emplace(index, buffer);
    codecUserData->inputCond.notify_all();
}

void CodecCallback::OnNewOutputBuffer([[maybe_unused]]OH_AVCodec *codec, uint32_t index,
                                      OH_AVBuffer *buffer, void *userData) {
    if (userData == nullptr) {
        return;
    }
    CodecUserData *codecUserData = static_cast<CodecUserData *>(userData);
    std::unique_lock<std::mutex> lock(codecUserData->outputMutex);
    codecUserData->outputBufferInfoQueue.emplace(index, buffer);
    codecUserData->outputCond.notify_all();
}