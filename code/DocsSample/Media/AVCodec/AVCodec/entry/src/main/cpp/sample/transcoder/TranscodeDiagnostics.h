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

#ifndef AVCODEC_TRANSCODE_DIAGNOSTICS_H
#define AVCODEC_TRANSCODE_DIAGNOSTICS_H

#include <algorithm>
#include <array>
#include <chrono>
#include <cstdint>
#include <string>
#include <vector>

namespace TranscodeMetrics {
using Clock = std::chrono::steady_clock;
enum class Stage { DEMUX, DECODE, PROCESS, ENCODE, MUX, AUDIO, COUNT };
struct Measurement {
    std::string name;
    uint64_t calls = 0;
    double totalMs = 0;
    double averageMs = 0;
    double p95Ms = 0;
    double maxMs = 0;
};

class Diagnostics {
public:
    template<typename Operation>
    auto Measure(Stage stage, Operation operation) -> decltype(operation())
    {
        const auto begin = Clock::now();
        auto result = operation();
        Record(stage, std::chrono::duration<double, std::milli>(Clock::now() - begin).count());
        return result;
    }

    // The wait spans unsuccessful non-blocking polls, not just time inside Query*.
    void Availability(size_t channel, bool available)
    {
        auto &wait = waits_[channel];
        if (!available && !wait.pending) {
            wait.begin = Clock::now();
            wait.pending = true;
        } else if (available && wait.pending) {
            wait.totalMs += std::chrono::duration<double, std::milli>(Clock::now() - wait.begin).count();
            wait.pending = false;
        }
    }

    double WaitMs(size_t channel) const
    {
        const auto &wait = waits_[channel];
        return wait.totalMs + (wait.pending ?
            std::chrono::duration<double, std::milli>(Clock::now() - wait.begin).count() : 0);
    }

    std::vector<Measurement> Snapshot() const
    {
        constexpr std::array<const char *, 6> NAMES {"demux", "decode-submit", "process-copy",
            "encode-submit", "mux", "audio"};
        std::vector<Measurement> result;
        for (size_t index = 0; index < buckets_.size(); ++index) {
            const auto &bucket = buckets_[index];
            std::vector<double> ordered(bucket.samples.begin(), bucket.samples.begin() + bucket.used);
            std::sort(ordered.begin(), ordered.end());
            const double p95 = ordered.empty() ? 0 : ordered[(ordered.size() * 95 - 1) / 100];
            result.push_back({NAMES[index], bucket.calls, bucket.totalMs,
                bucket.calls == 0 ? 0 : bucket.totalMs / bucket.calls, p95, bucket.maxMs});
        }
        return result;
    }

private:
    static constexpr size_t SAMPLE_LIMIT = 256;
    struct Bucket {
        uint64_t calls = 0;
        double totalMs = 0;
        double maxMs = 0;
        size_t used = 0;
        std::array<double, SAMPLE_LIMIT> samples {};
    };
    struct Wait {
        bool pending = false;
        Clock::time_point begin {};
        double totalMs = 0;
    };
    void Record(Stage stage, double elapsedMs)
    {
        auto &bucket = buckets_[static_cast<size_t>(stage)];
        bucket.samples[bucket.calls % SAMPLE_LIMIT] = elapsedMs;
        ++bucket.calls;
        bucket.used = std::min(SAMPLE_LIMIT, bucket.used + 1);
        bucket.totalMs += elapsedMs;
        bucket.maxMs = std::max(bucket.maxMs, elapsedMs);
    }
    std::array<Bucket, static_cast<size_t>(Stage::COUNT)> buckets_;
    std::array<Wait, 3> waits_;
};
} // namespace TranscodeMetrics
#endif
