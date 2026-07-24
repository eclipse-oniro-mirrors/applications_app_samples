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

void CodecCallback::OnCodecError([[maybe_unused]]OH_AVCodec *codec, [[maybe_unused]]int32_t errorCode,
    [[maybe_unused]]void *userData)
{
    SAMPLE_LOGI("On codec error, error code: %{public}d", errorCode);
}

void CodecCallback::OnCodecFormatChange([[maybe_unused]]OH_AVCodec *codec, [[maybe_unused]]OH_AVFormat *format,
    [[maybe_unused]]void *userData)
{
    SAMPLE_LOGI("On codec format change");
}

void CodecCallback::OnNeedInputBuffer(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    if (userData == nullptr) {
        return;
    }
    CodecUserData *codecUserData = static_cast<CodecUserData *>(userData);
    std::unique_lock<std::mutex> lock(codecUserData->inputMutex);
    codecUserData->inputBufferInfoQueue.emplace(index, buffer);
    codecUserData->inputCond.notify_all();
}

void CodecCallback::OnNewOutputBuffer([[maybe_unused]]OH_AVCodec *codec, uint32_t index,
                                      OH_AVBuffer *buffer, void *userData)
{
    if (userData == nullptr) {
        return;
    }
    CodecUserData *codecUserData = static_cast<CodecUserData *>(userData);
    std::unique_lock<std::mutex> lock(codecUserData->outputMutex);
    codecUserData->outputBufferInfoQueue.emplace(index, buffer);
    codecUserData->outputCond.notify_all();
}