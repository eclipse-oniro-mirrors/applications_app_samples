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

#ifndef FRAME_QUEUE_H
#define FRAME_QUEUE_H

#include <mutex>
#include <condition_variable>
#include <chrono>
#include <queue>
#include <vector>
#include <string>
#include <cstdint>

// [Start roi_frame_item_struct]
// Buffer模式编码的帧数据项。
constexpr uint32_t FRAME_QUEUE_POP_TIMEOUT_MS = 4;
constexpr size_t FRAME_QUEUE_MAX_SIZE = 3;

struct FrameItem {
    std::vector<uint8_t> pixels;
    int32_t width = 0;
    int32_t height = 0;
    std::string roiStr;
};
// [End roi_frame_item_struct]

class FrameQueue {
public:
    // Push a frame into the queue. Drops oldest frame if queue is full.
    void Push(const FrameItem &item)
    {
        std::lock_guard<std::mutex> lock(mtx_);
        if (queue_.size() >= FRAME_QUEUE_MAX_SIZE) {
            queue_.pop();
        }
        queue_.push(item);
        cv_.notify_one();
    }

    // Pop a frame with timeout. Returns true if successful.
    bool Pop(FrameItem &outItem, const std::chrono::milliseconds &timeout)
    {
        std::unique_lock<std::mutex> lock(mtx_);
        if (!cv_.wait_for(lock, timeout, [this]() { return !queue_.empty() || isStopped_; })) {
            return false;
        }
        if (isStopped_ || queue_.empty()) {
            return false;
        }
        outItem = std::move(queue_.front());
        queue_.pop();
        return true;
    }

    void Clear()
    {
        std::lock_guard<std::mutex> lock(mtx_);
        while (!queue_.empty()) {
            queue_.pop();
        }
    }

    void Stop()
    {
        std::lock_guard<std::mutex> lock(mtx_);
        isStopped_ = true;
        cv_.notify_all();
    }

    ~FrameQueue()
    {
        Stop();
    }

private:
    std::queue<FrameItem> queue_;
    std::mutex mtx_;
    std::condition_variable cv_;
    bool isStopped_ = false;
};

#endif // FRAME_QUEUE_H
