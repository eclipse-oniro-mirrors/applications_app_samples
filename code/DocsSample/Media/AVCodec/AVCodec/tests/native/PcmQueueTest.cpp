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

#include <cstdlib>
#include <iostream>
#include <numeric>
#include "common/PcmQueue.h"

namespace {
constexpr size_t FIRST_BLOCK_SIZE = 60000;
constexpr size_t SECOND_BLOCK_SIZE = 90000;
constexpr size_t OUTPUT_CAPACITY = FIRST_BLOCK_SIZE + SECOND_BLOCK_SIZE;
constexpr size_t PREFIX_SIZE = 50000;
constexpr size_t WRAPPED_SIZE = 30000;
constexpr size_t REMAINING_FIRST = FIRST_BLOCK_SIZE - PREFIX_SIZE;
constexpr size_t QUEUED_SIZE = REMAINING_FIRST + SECOND_BLOCK_SIZE;
constexpr uint8_t SECOND_PATTERN_START = 7;
void Require(bool condition, const char *message)
{
    if (!condition) {
        std::cerr << message << std::endl;
        std::exit(EXIT_FAILURE);
    }
}

void TestWrapAndGrowth()
{
    PcmQueue queue;
    std::vector<uint8_t> first(FIRST_BLOCK_SIZE);
    std::vector<uint8_t> second(SECOND_BLOCK_SIZE);
    std::vector<uint8_t> output(OUTPUT_CAPACITY);
    std::iota(first.begin(), first.end(), 0);
    std::iota(second.begin(), second.end(), SECOND_PATTERN_START);
    Require(queue.Write(first.data(), first.size()), "Write initial PCM");
    Require(queue.Read(output.data(), PREFIX_SIZE) == PREFIX_SIZE &&
            std::equal(output.begin(), output.begin() + PREFIX_SIZE, first.begin()),
        "Read initial prefix");
    Require(queue.Write(second.data(), WRAPPED_SIZE), "Write across the ring boundary");
    Require(queue.Write(second.data() + WRAPPED_SIZE, SECOND_BLOCK_SIZE - WRAPPED_SIZE),
        "Grow while preserving wrapped bytes");
    Require(
        queue.Size() == QUEUED_SIZE && queue.Read(output.data(), output.size()) == QUEUED_SIZE, "Read all queued PCM");
    Require(std::equal(first.begin() + PREFIX_SIZE, first.end(), output.begin()) &&
            std::equal(second.begin(), second.end(), output.begin() + REMAINING_FIRST),
        "Preserve exact PCM order");
    Require(queue.Empty() && queue.Read(output.data(), 1) == 0, "Empty reads do not invent bytes");
    Require(queue.Write(first.data(), first.size()), "Reuse allocated storage");
    queue.Clear();
    Require(queue.Empty() && queue.Size() == 0, "Seek clears pending PCM");
    Require(!queue.Write(nullptr, 1) && queue.Write(nullptr, 0), "Validate source without changing the queue");
}
} // namespace

int main()
{
    TestWrapAndGrowth();
    std::cout << "PCM queue: wrapping, growth, byte order and reset passed" << std::endl;
}
