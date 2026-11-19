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

#include <algorithm>
#include <array>
#include <chrono>
#include <cstdint>
#include <iostream>
#include <numeric>
#include <vector>
#include "common/PcmQueue.h"

namespace {
constexpr size_t BLOCK_SIZE = 4096;
constexpr size_t BACKLOG_SIZE = 192000;
constexpr size_t BLOCK_COUNT = 2000;
constexpr size_t RUN_COUNT = 7;
constexpr size_t MEDIAN_DIVISOR = 2;
using Clock = std::chrono::steady_clock;

// 对照上一版采集缓存：消费后把剩余PCM前移，分配在预热阶段完成。
class LegacyCaptureQueue {
public:
    bool Write(const uint8_t *input, size_t bytes)
    {
        data_.resize(size_ + bytes);
        std::copy_n(input, bytes, data_.data() + size_);
        size_ += bytes;
        return true;
    }
    size_t Read(uint8_t *output, size_t bytes)
    {
        std::copy_n(data_.data(), bytes, output);
        size_ -= bytes;
        std::move(data_.begin() + bytes, data_.begin() + bytes + size_, data_.begin());
        return bytes;
    }
private:
    std::vector<uint8_t> data_;
    size_t size_ = 0;
};

template<class Queue> double Measure(Queue &queue, uint64_t &checksum)
{
    std::vector<uint8_t> backlog(BACKLOG_SIZE);
    std::vector<uint8_t> block(BLOCK_SIZE);
    std::vector<uint8_t> output(BLOCK_SIZE);
    std::iota(backlog.begin(), backlog.end(), 0);
    std::iota(block.begin(), block.end(), 0);
    queue.Write(backlog.data(), backlog.size());
    queue.Write(block.data(), block.size());
    queue.Read(output.data(), output.size());
    const auto started = Clock::now();
    for (size_t count = 0; count < BLOCK_COUNT; ++count) {
        if (!queue.Write(block.data(), block.size()) || queue.Read(output.data(), output.size()) != BLOCK_SIZE) {
            return 0;
        }
        checksum += std::accumulate(output.begin(), output.end(), uint64_t { 0 });
    }
    return std::chrono::duration<double, std::nano>(Clock::now() - started).count() / BLOCK_COUNT;
}

double Median(std::array<double, RUN_COUNT> measurements)
{
    std::sort(measurements.begin(), measurements.end());
    return measurements[RUN_COUNT / MEDIAN_DIVISOR];
}
} // namespace

int main()
{
    std::array<double, RUN_COUNT> ring {};
    std::array<double, RUN_COUNT> legacy {};
    uint64_t ringChecksum = 0;
    uint64_t legacyChecksum = 0;
    for (size_t run = 0; run < RUN_COUNT; ++run) {
        ringChecksum = 0;
        legacyChecksum = 0;
        PcmQueue queue(BACKLOG_SIZE + BLOCK_SIZE, BACKLOG_SIZE + BLOCK_SIZE);
        LegacyCaptureQueue old;
        if (run % MEDIAN_DIVISOR == 0) {
            ring[run] = Measure(queue, ringChecksum);
            legacy[run] = Measure(old, legacyChecksum);
        } else {
            legacy[run] = Measure(old, legacyChecksum);
            ring[run] = Measure(queue, ringChecksum);
        }
        if (ringChecksum != legacyChecksum || ring[run] <= 0 || legacy[run] <= 0) {
            return EXIT_FAILURE;
        }
    }
    const double ringMedian = Median(ring);
    const double legacyMedian = Median(legacy);
    if (ringMedian > 0) {
        std::cout << "backlog_bytes=" << BACKLOG_SIZE << " block_bytes=" << BLOCK_SIZE << " runs=" << RUN_COUNT;
        std::cout << " ring_ns=" << ringMedian << " legacy_ns=" << legacyMedian;
        std::cout << " speedup=" << legacyMedian / ringMedian << " checksum=" << ringChecksum << '\n';
        return EXIT_SUCCESS;
    }
    return EXIT_FAILURE;
}
