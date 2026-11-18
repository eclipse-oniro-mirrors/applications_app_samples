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
void Require(bool condition, const char *message)
{
    if (!condition) { std::cerr << message << std::endl; std::exit(EXIT_FAILURE); }
}

void TestWrapAndGrowth()
{
    PcmQueue queue;
    std::vector<uint8_t> first(60000), second(90000), output(150000);
    std::iota(first.begin(), first.end(), 0);
    std::iota(second.begin(), second.end(), 7);
    Require(queue.Write(first.data(), first.size()), "Write initial PCM");
    Require(queue.Read(output.data(), 50000) == 50000 &&
        std::equal(output.begin(), output.begin() + 50000, first.begin()), "Read initial prefix");
    Require(queue.Write(second.data(), 30000), "Write across the ring boundary");
    Require(queue.Write(second.data() + 30000, 60000), "Grow while preserving wrapped bytes");
    Require(queue.Size() == 100000 && queue.Read(output.data(), output.size()) == 100000, "Read all queued PCM");
    Require(std::equal(first.begin() + 50000, first.end(), output.begin()) &&
        std::equal(second.begin(), second.end(), output.begin() + 10000), "Preserve exact PCM order");
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
