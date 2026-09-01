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

#ifndef AVCODEC_SAMPLE_CODEC_BUFFER_H
#define AVCODEC_SAMPLE_CODEC_BUFFER_H

#include <chrono>
#include <condition_variable>
#include <cstdint>
#include <memory>
#include <mutex>
#include <queue>
#include <multimedia/player_framework/native_avbuffer.h>

struct CodecBufferInfo {
    uint32_t bufferIndex = 0;
    OH_AVBuffer *buffer = nullptr;
    uint8_t *bufferAddr = nullptr;
    OH_AVCodecBufferAttr attr = {0, 0, 0, AVCODEC_BUFFER_FLAGS_NONE};
    bool isValid = true;

    explicit CodecBufferInfo(uint8_t *addr) : bufferAddr(addr) {}
    CodecBufferInfo(uint8_t *addr, int32_t bufferSize)
        : bufferAddr(addr), attr({0, bufferSize, 0, AVCODEC_BUFFER_FLAGS_NONE}) {}
    CodecBufferInfo(uint32_t argBufferIndex, OH_AVBuffer *argBuffer)
        : bufferIndex(argBufferIndex), buffer(argBuffer)
    {
        OH_AVBuffer_GetBufferAttr(argBuffer, &attr);
    }
};

class CodecBufferQueue {
public:
    void Enqueue(const std::shared_ptr<CodecBufferInfo> bufferInfo)
    {
        std::unique_lock<std::mutex> lock(mutex_);
        bufferQueue_.push(bufferInfo);
        cond_.notify_all();
    }

    std::shared_ptr<CodecBufferInfo> Dequeue(int32_t timeoutMs = 1000)
    {
        std::unique_lock<std::mutex> lock(mutex_);
        (void)cond_.wait_for(lock, std::chrono::milliseconds(timeoutMs),
            [this]() { return cancelled_ || !bufferQueue_.empty(); });
        if (cancelled_ || bufferQueue_.empty()) {
            return nullptr;
        }
        std::shared_ptr<CodecBufferInfo> bufferInfo = bufferQueue_.front();
        bufferQueue_.pop();
        return bufferInfo;
    }

    void Flush()
    {
        std::unique_lock<std::mutex> lock(mutex_);
        while (!bufferQueue_.empty()) {
            std::shared_ptr<CodecBufferInfo> bufferInfo = bufferQueue_.front();
            bufferInfo->isValid = false;
            bufferQueue_.pop();
        }
    }

    void CancelWait()
    {
        std::unique_lock<std::mutex> lock(mutex_);
        cancelled_ = true;
        cond_.notify_all();
    }

private:
    std::mutex mutex_;
    std::condition_variable cond_;
    std::queue<std::shared_ptr<CodecBufferInfo>> bufferQueue_;
    bool cancelled_ = false;
};

#endif // AVCODEC_SAMPLE_CODEC_BUFFER_H
