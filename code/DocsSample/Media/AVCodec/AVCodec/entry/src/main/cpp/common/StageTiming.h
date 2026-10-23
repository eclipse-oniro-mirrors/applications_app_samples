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

#ifndef AVCODEC_SAMPLE_STAGE_TIMING_H
#define AVCODEC_SAMPLE_STAGE_TIMING_H

#include <algorithm>
#include <array>
#include <chrono>
#include <cstdint>

inline int64_t RecorderClockUs()
{
    return std::chrono::duration_cast<std::chrono::microseconds>(
        std::chrono::steady_clock::now().time_since_epoch()).count();
}

struct StageTimingInfo {
    uint64_t count = 0;
    double averageMs = 0;
    double p95Ms = 0;
    double maximumMs = 0;
};

// 调用方负责同步。平均值和最大值覆盖全程，P95 只覆盖最近 256 次，避免长录制无限占用内存。
class StageTiming {
public:
    void Record(int64_t microseconds)
    {
        const double milliseconds = std::max<int64_t>(0, microseconds) / 1000.0;
        samples_[count_ % samples_.size()] = milliseconds;
        ++count_;
        sumMs_ += milliseconds;
        maximumMs_ = std::max(maximumMs_, milliseconds);
    }

    StageTimingInfo Snapshot() const
    {
        StageTimingInfo info;
        info.count = count_;
        info.maximumMs = maximumMs_;
        if (count_ == 0) {
            return info;
        }
        info.averageMs = sumMs_ / static_cast<double>(count_);
        auto ordered = samples_;
        const size_t size = std::min<uint64_t>(count_, ordered.size());
        std::sort(ordered.begin(), ordered.begin() + size);
        info.p95Ms = ordered[(size * 95 + 99) / 100 - 1];
        return info;
    }

private:
    std::array<double, 256> samples_ {};
    uint64_t count_ = 0;
    double sumMs_ = 0;
    double maximumMs_ = 0;
};

#endif
