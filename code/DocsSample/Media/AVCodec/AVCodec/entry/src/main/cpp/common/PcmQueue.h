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
#include <cstdint>
#include <cstring>
#include <limits>
#include <vector>

// 由调用方持有outputMutex。只有生产者扩容，渲染回调仅批量读取，不分配内存。
class PcmQueue {
public:
    bool Write(const uint8_t *source, size_t count)
    {
        if (count == 0) { return true; }
        if (source == nullptr || count > std::numeric_limits<size_t>::max() - size_) { return false; }
        EnsureCapacity(size_ + count);
        const size_t tail = (head_ + size_) % data_.size();
        const size_t first = std::min(count, data_.size() - tail);
        std::memcpy(data_.data() + tail, source, first);
        std::memcpy(data_.data(), source + first, count - first);
        size_ += count;
        return true;
    }

    size_t Read(uint8_t *destination, size_t count)
    {
        if (destination == nullptr) { return 0; }
        count = std::min(count, size_);
        const size_t first = std::min(count, data_.size() - head_);
        std::memcpy(destination, data_.data() + head_, first);
        std::memcpy(destination + first, data_.data(), count - first);
        head_ = (head_ + count) % data_.size();
        size_ -= count;
        return count;
    }

    size_t Size() const { return size_; }
    bool Empty() const { return size_ == 0; }
    void Clear() { head_ = 0; size_ = 0; }

private:
    void EnsureCapacity(size_t required)
    {
        if (required <= data_.size()) { return; }
        const size_t next = data_.size() <= std::numeric_limits<size_t>::max() / 2 ?
            std::max(required, data_.size() * 2) : required;
        std::vector<uint8_t> grown(next);
        const size_t preserved = Read(grown.data(), size_);
        data_.swap(grown);
        head_ = 0;
        size_ = preserved;
    }

    static constexpr size_t INITIAL_CAPACITY = 64 * 1024;
    std::vector<uint8_t> data_ = std::vector<uint8_t>(INITIAL_CAPACITY);
    size_t head_ = 0;
    size_t size_ = 0;
};
#endif
