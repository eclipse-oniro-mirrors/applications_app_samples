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

#ifndef AVCODEC_SAMPLE_PCM_QUEUE_H
#define AVCODEC_SAMPLE_PCM_QUEUE_H

#include <algorithm>
#include <cstddef>
#include <cstdint>
#include <limits>
#include <vector>

namespace PcmQueueConstants {
constexpr size_t INITIAL_CAPACITY = 64 * 1024;
constexpr size_t GROWTH_FACTOR = 2;
}

// 由调用方持有对应队列锁。动态队列仅生产者扩容，固定容量队列的读写均不分配内存。
class PcmQueue {
public:
    explicit PcmQueue(size_t capacity = PcmQueueConstants::INITIAL_CAPACITY,
        size_t maximum = std::numeric_limits<size_t>::max())
        : maximum_(maximum), data_(std::min(capacity, maximum))
    {
    }

    size_t Capacity() const
    {
        return data_.size();
    }

    bool Write(const uint8_t *source, size_t count)
    {
        if (count == 0) {
            return true;
        }
        if (source == nullptr || count > maximum_ - size_) {
            return false;
        }
        EnsureCapacity(size_ + count);
        const size_t tail = (head_ + size_) % data_.size();
        const size_t first = std::min(count, data_.size() - tail);
        std::copy_n(source, first, data_.data() + tail);
        std::copy_n(source + first, count - first, data_.data());
        size_ += count;
        return true;
    }

    size_t Read(uint8_t *destination, size_t count)
    {
        if (destination == nullptr || size_ == 0 || count == 0) {
            return 0;
        }
        count = std::min(count, size_);
        const size_t first = std::min(count, data_.size() - head_);
        std::copy_n(data_.data() + head_, first, destination);
        std::copy_n(data_.data(), count - first, destination + first);
        head_ = (head_ + count) % data_.size();
        size_ -= count;
        return count;
    }

    size_t Size() const
    {
        return size_;
    }
    bool Empty() const
    {
        return size_ == 0;
    }
    void Clear()
    {
        head_ = 0;
        size_ = 0;
    }

private:
    void EnsureCapacity(size_t required)
    {
        if (required <= data_.size()) {
            return;
        }
        const bool canGrow = data_.size() <= std::numeric_limits<size_t>::max() / PcmQueueConstants::GROWTH_FACTOR;
        const size_t next = canGrow ? std::max(required, data_.size() * PcmQueueConstants::GROWTH_FACTOR) : required;
        std::vector<uint8_t> grown(std::min(next, maximum_));
        const size_t preserved = Read(grown.data(), size_);
        data_.swap(grown);
        head_ = 0;
        size_ = preserved;
    }

    size_t maximum_;
    std::vector<uint8_t> data_;
    size_t head_ = 0;
    size_t size_ = 0;
};
#endif
