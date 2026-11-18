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
#ifndef AVCODEC_TRANSCODE_LOW_PASS_RESAMPLER_H
#define AVCODEC_TRANSCODE_LOW_PASS_RESAMPLER_H
#include <algorithm>
#include <array>
#include <cmath>
#include <cstdint>
#include <limits>

// Windowed-sinc downsampling. Drain Pending() before Push(); no decoder Buffer pointers are retained.
class TranscodeLowPassResampler {
private:
    static constexpr size_t channelCount = 2;
    static constexpr int32_t secondHarmonic = 2;
    static constexpr int32_t radius = 32;
    static constexpr int32_t historyPadding = 3;
    static constexpr int32_t historySize = radius * secondHarmonic + historyPadding;
    static constexpr double pi = 3.14159265358979323846;
    static constexpr double passband = 0.94;
    static constexpr double windowCenter = 0.42;
    static constexpr double windowCosine = 0.5;
    static constexpr double windowSecond = 0.08;
    static constexpr double epsilon = 1e-12;

public:
    using Frame = std::array<int32_t, channelCount>;
    void Configure(int32_t sourceRate, int32_t targetRate)
    {
        sourceRate_ = sourceRate;
        targetRate_ = targetRate;
        inputs_ = 0;
        outputs_ = 0;
        finalCount_ = 0;
        finished_ = false;
    }
    void Push(const Frame &frame)
    {
        if (inputs_ == 0) { first_ = frame; }
        history_[inputs_ % historySize] = frame;
        last_ = frame;
        ++inputs_;
    }
    bool Pending() const
    {
        if (inputs_ == 0) { return false; }
        return finished_ ? outputs_ < finalCount_ : Position() + radius < inputs_;
    }
    void Finish()
    {
        finished_ = true;
        finalCount_ = inputs_ / sourceRate_ * targetRate_ +
            (inputs_ % sourceRate_ * targetRate_ + sourceRate_ - 1) / sourceRate_;
    }
    Frame Pull()
    {
        const int64_t center = Position();
        const double fraction = static_cast<double>(outputs_ % targetRate_ * sourceRate_ % targetRate_) / targetRate_;
        const double cutoff = passband * targetRate_ / sourceRate_;
        std::array<double, channelCount> sum {};
        double weights = 0;
        for (int32_t tap = -radius; tap <= radius; ++tap) {
            const double distance = tap - fraction;
            const double window = std::abs(distance) >= radius ? 0 : windowCenter +
                windowCosine * std::cos(pi * distance / radius) +
                windowSecond * std::cos(secondHarmonic * pi * distance / radius);
            const double phase = pi * cutoff * distance;
            const double weight = (std::abs(phase) < epsilon ? cutoff :
                cutoff * std::sin(phase) / phase) * window;
            const Frame sample = Read(center + tap);
            for (size_t channel = 0; channel < sum.size(); ++channel) {
                sum[channel] += sample[channel] * weight;
            }
            weights += weight;
        }
        ++outputs_;
        return {Clamp(sum[0] / weights), Clamp(sum[1] / weights)};
    }
    int64_t Count() const { return outputs_; }

private:
    static int32_t Clamp(double sample)
    {
        return static_cast<int32_t>(std::clamp(std::lround(sample),
            static_cast<long>(std::numeric_limits<int16_t>::min()),
            static_cast<long>(std::numeric_limits<int16_t>::max())));
    }
    int64_t Position() const
    {
        return outputs_ / targetRate_ * sourceRate_ + outputs_ % targetRate_ * sourceRate_ / targetRate_;
    }
    Frame Read(int64_t index) const
    {
        if (index < 0) { return first_; }
        if (index >= inputs_) { return last_; }
        return history_[index % historySize];
    }
    std::array<Frame, historySize> history_ {};
    Frame first_ {};
    Frame last_ {};
    int32_t sourceRate_ = 1;
    int32_t targetRate_ = 1;
    int64_t inputs_ = 0;
    int64_t outputs_ = 0;
    int64_t finalCount_ = 0;
    bool finished_ = false;
};
#endif
