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

#undef LOG_TAG
#define LOG_TAG "recorder"

// 一入二出的副路单独取出并归还输出Buffer，不借用主路的编码器、回调队列或Muxer。
void Recorder::SecondaryVideoEncOutputSyncThread()
{
    while (isStarted_) {
        if (secondaryEncContext_->hasError.load()) {
            AbortRecording("Secondary video codec callback failed");
            break;
        }
        const int64_t waitStart = RecorderClockUs();
        CodecBufferInfo bufferInfo;
        const int32_t ret = secondaryVideoEncoder_->GetOutputBuffer(bufferInfo, codecBufferTimeoutUs);
        if (!isStarted_) {
            // 输出线程退出后，由副编码器Destroy统一回收未归还的Buffer。
            break;
        }
        if (ret == AVCODEC_SAMPLE_ERR_AGAIN) {
            continue;
        }
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            AbortRecording("Secondary video output buffer retrieval failed");
            break;
        }
        const int64_t receivedAtUs = RecorderClockUs();
        secondaryStats_.RecordRetrieval(receivedAtUs - waitStart);
        if (bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_EOS) {
            RecordVideoOutputEos(bufferInfo, false, receivedAtUs);
            AVCODEC_SAMPLE_LOGI("Catch EOS, secondary video output thread out");
            break;
        }
        if (!ProcessVideoOutputBuffer(bufferInfo, false, receivedAtUs)) {
            break;
        }
    }
    FinishVideoOutputThread(secondaryEncContext_.get(), false);
}

void Recorder::SecondaryVideoEncOutputAsyncThread()
{
    while (isStarted_) {
        const int64_t waitStart = RecorderClockUs();
        const auto bufferInfo = secondaryEncContext_->outputBufferQueue.Dequeue();
        const int64_t receivedAtUs = RecorderClockUs();
        if (!isStarted_ || secondaryEncContext_->hasError.load()) {
            // 停止或故障后不再消费输出，未归还的Buffer由副编码器Destroy统一回收。
            if (isStarted_) {
                AbortRecording("Secondary video codec callback failed");
            }
            break;
        }
        CHECK_AND_CONTINUE_LOG(bufferInfo != nullptr, "Buffer queue is empty, continue");
        secondaryStats_.RecordRetrieval(receivedAtUs - waitStart);
        if (bufferInfo->attr.flags & AVCODEC_BUFFER_FLAGS_EOS) {
            RecordVideoOutputEos(*bufferInfo, false, receivedAtUs);
            AVCODEC_SAMPLE_LOGI("Catch EOS, secondary video output thread out");
            break;
        }
        if (!ProcessVideoOutputBuffer(*bufferInfo, false, receivedAtUs)) {
            break;
        }
    }
    FinishVideoOutputThread(secondaryEncContext_.get(), false);
}
