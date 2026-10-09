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

// [Start codec_buffer_info]
// 回调buffer的信息。
struct CodecBufferInfo {
     // 回调buffer。
    OH_AVBuffer *buffer = nullptr;
    // 回调buffer对应的bufferIndex。
    uint32_t bufferIndex = 0;
    // buffer的输入尺寸（size）、偏移量（offset）、时间戳（pts）、缓冲区标记（flags）信息。
    OH_AVCodecBufferAttr attr = {0, 0, 0, AVCODEC_BUFFER_FLAGS_NONE};

    CodecBufferInfo() = default;

    CodecBufferInfo(uint32_t index, OH_AVBuffer *avBuffer)
        : buffer(avBuffer), bufferIndex(index)
    {
        // 获取回调buffer的attr信息。
        if (buffer != nullptr) {
            (void)OH_AVBuffer_GetBufferAttr(buffer, &attr);
        }
    }
};
// [End codec_buffer_info]

// [Start codec_buffer_queue]
// 回调buffer输入输出队列。
class CodecBufferQueue {
public:
    void Enqueue(const std::shared_ptr<CodecBufferInfo> bufferInfo)
    {
        std::unique_lock<std::mutex> lock(mutex_);
        // 队列只共享描述对象，不取得 OH_AVBuffer 的所有权。消费者必须按所属编解码器归还bufferIndex。
        bufferQueue_.push(bufferInfo);
        cond_.notify_all();
    }

    std::shared_ptr<CodecBufferInfo> Dequeue(int32_t timeoutMs = 1000)
    {
        std::unique_lock<std::mutex> lock(mutex_);
        (void)cond_.wait_for(lock, std::chrono::milliseconds(timeoutMs),
            [this]() { return cancelled_ || !bufferQueue_.empty(); });
        // 返回空既可能是超时，也可能是解码器不处于Running状态；调用方应结合所属流水线的运行状态决定后续动作。
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
        // 清空回调buffer队列。
        // 调用方需先与 codec 的 Flush/Stop 及工作线程完成同步，避免在其他线程仍访问 Buffer 时清空队列。
        while (!bufferQueue_.empty()) {
            bufferQueue_.pop();
        }
    }
    // [StartExclude codec_buffer_queue]
    void CancelWait()
    {
        std::unique_lock<std::mutex> lock(mutex_);
        // 取消状态会一直保持到 Reset，确保 Stop/Seek 后新旧工作线程都不会继续消费旧队列。
        cancelled_ = true;
        cond_.notify_all();
    }

    // Stop 或 Seek 时通过 CancelWait 唤醒等待中的工作线程。原位切换音轨会复用 codec 上下文，
    // 因而在替换工作线程启动前必须显式重新打开队列，避免新线程立即因已取消而退出。
    void Reset()
    {
        std::unique_lock<std::mutex> lock(mutex_);
        while (!bufferQueue_.empty()) {
            bufferQueue_.pop();
        }
        cancelled_ = false;
    }
    // [EndExclude codec_buffer_queue]
private:
    std::mutex mutex_;
    std::condition_variable cond_;
    std::queue<std::shared_ptr<CodecBufferInfo>> bufferQueue_;
    bool cancelled_ = false;
};
// [End codec_buffer_queue]

#endif // AVCODEC_SAMPLE_CODEC_BUFFER_H
