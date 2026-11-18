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
#include <iomanip>
#include <iostream>
#include <numeric>
#include <queue>
#include <vector>
#include "common/PcmQueue.h"

namespace {
constexpr size_t BLOCK_SIZE = 4096;
constexpr size_t BLOCK_COUNT = 2000;
constexpr size_t RUN_COUNT = 7;
using Clock = std::chrono::steady_clock;

std::vector<uint8_t> CreateBlock()
{
    std::vector<uint8_t> block(BLOCK_SIZE);
    for (size_t index = 0; index < block.size(); ++index) {
        block[index] = static_cast<uint8_t>((index * 37 + 11) & 0xff);
    }
    return block;
}

uint64_t Checksum(const std::vector<uint8_t> &block)
{
    return std::accumulate(block.begin(), block.end(), uint64_t{0});
}

double BenchmarkPcmQueue(uint64_t &checksum)
{
    PcmQueue queue;
    const std::vector<uint8_t> input = CreateBlock();
    std::vector<uint8_t> output(BLOCK_SIZE);
    queue.Write(input.data(), input.size());
    queue.Read(output.data(), output.size());
    const Clock::time_point start = Clock::now();
    for (size_t index = 0; index < BLOCK_COUNT; ++index) {
        if (!queue.Write(input.data(), input.size()) || queue.Read(output.data(), output.size()) != BLOCK_SIZE) {
            return 0;
        }
        checksum += Checksum(output);
    }
    const auto elapsed = std::chrono::duration_cast<std::chrono::nanoseconds>(Clock::now() - start);
    return static_cast<double>(elapsed.count()) / BLOCK_COUNT;
}

double BenchmarkLegacyQueue(uint64_t &checksum)
{
    std::queue<uint8_t> queue;
    const std::vector<uint8_t> input = CreateBlock();
    std::vector<uint8_t> output(BLOCK_SIZE);
    for (uint8_t value : input) { queue.push(value); }
    for (size_t index = 0; index < output.size(); ++index) { output[index] = queue.front(); queue.pop(); }
    const Clock::time_point start = Clock::now();
    for (size_t block = 0; block < BLOCK_COUNT; ++block) {
        for (uint8_t value : input) { queue.push(value); }
        for (size_t index = 0; index < output.size(); ++index) { output[index] = queue.front(); queue.pop(); }
        checksum += Checksum(output);
    }
    const auto elapsed = std::chrono::duration_cast<std::chrono::nanoseconds>(Clock::now() - start);
    return static_cast<double>(elapsed.count()) / BLOCK_COUNT;
}

double Median(std::array<double, RUN_COUNT> values)
{
    std::sort(values.begin(), values.end());
    return values[RUN_COUNT / 2];
}

bool RunBenchmarks(std::array<double, RUN_COUNT> &ring, std::array<double, RUN_COUNT> &legacy,
    uint64_t &ringChecksum, uint64_t &legacyChecksum)
{
    for (size_t run = 0; run < RUN_COUNT; ++run) {
        ringChecksum = 0;
        legacyChecksum = 0;
        if (run % 2 == 0) {
            ring[run] = BenchmarkPcmQueue(ringChecksum);
            legacy[run] = BenchmarkLegacyQueue(legacyChecksum);
        } else {
            legacy[run] = BenchmarkLegacyQueue(legacyChecksum);
            ring[run] = BenchmarkPcmQueue(ringChecksum);
        }
        if (ringChecksum != legacyChecksum || ring[run] <= 0 || legacy[run] <= 0) { return false; }
    }
    return true;
}
} // namespace

int main()
{
    std::array<double, RUN_COUNT> ring{};
    std::array<double, RUN_COUNT> legacy{};
    uint64_t ringChecksum = 0;
    uint64_t legacyChecksum = 0;
    if (!RunBenchmarks(ring, legacy, ringChecksum, legacyChecksum)) {
        std::cerr << "PCM queue benchmark failed: data mismatch" << std::endl;
        return 1;
    }
    const double ringMedian = Median(ring);
    const double legacyMedian = Median(legacy);
    std::cout << std::fixed << std::setprecision(2)
        << "block_bytes=" << BLOCK_SIZE << " blocks_per_run=" << BLOCK_COUNT << " runs=" << RUN_COUNT << std::endl
        << "PcmQueue_median_ns_per_block=" << ringMedian << std::endl
        << "std_queue_median_ns_per_block=" << legacyMedian << std::endl
        << "speedup=" << legacyMedian / ringMedian << " checksum=" << ringChecksum << std::endl;
    return 0;
}
