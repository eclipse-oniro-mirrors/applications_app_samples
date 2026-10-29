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
#ifndef AVCODEC_TRANSCODE_PCM_CONVERTER_H
#define AVCODEC_TRANSCODE_PCM_CONVERTER_H
#include <array>
#include <cstdint>
#include <limits>
#include <vector>

// Linear interpolation retains two source sample frames, including across decoder Buffer boundaries.
class TranscodePcmConverter {
    static constexpr int32_t PCM_SAMPLE_BYTES = 2;
    static constexpr int32_t PCM_SAMPLE_BITS_PER_BYTE = 8;
    static constexpr int32_t PCM_CHANNEL_LIMIT = 2;
    static constexpr int32_t PCM_MONO_CHANNEL_COUNT = 1;
    static constexpr int32_t PCM_SAMPLE_RATE_LIMIT = 96000;
    static constexpr int32_t PCM_SIGNED_SAMPLE_MIDPOINT = 1 << (PCM_SAMPLE_BYTES * PCM_SAMPLE_BITS_PER_BYTE - 1);
    static constexpr int32_t PCM_SIGNED_SAMPLE_RANGE = static_cast<int32_t>(std::numeric_limits<uint16_t>::max()) + 1;

public:
    bool Configure(int32_t sourceRate, int32_t targetRate, int32_t sourceChannels, int32_t targetChannels)
    {
        if (sourceRate <= 0 || sourceRate > PCM_SAMPLE_RATE_LIMIT || targetRate <= 0 ||
            targetRate > PCM_SAMPLE_RATE_LIMIT || sourceChannels < 1 || sourceChannels > PCM_CHANNEL_LIMIT ||
            targetChannels < 1 || targetChannels > PCM_CHANNEL_LIMIT) {
            return false;
        }
        sourceRate_ = sourceRate;
        targetRate_ = targetRate;
        sourceChannels_ = sourceChannels;
        targetChannels_ = targetChannels;
        phase_ = 0;
        count_ = 0;
        inputs_ = 0;
        finalCount_ = 0;
        initialized_ = false;
        pending_ = false;
        return true;
    }
    bool Pending() const { return pending_ || count_ < finalCount_; }
    void Finish()
    {
        finalCount_ = inputs_ / sourceRate_ * targetRate_ +
            (inputs_ % sourceRate_ * targetRate_ + sourceRate_ - 1) / sourceRate_;
    }
    void Push(const uint8_t *sample)
    {
        previous_ = current_;
        int32_t left = Read(sample);
        int32_t right = sourceChannels_ == PCM_CHANNEL_LIMIT ? Read(sample + PCM_SAMPLE_BYTES) : left;
        current_[0] = targetChannels_ == PCM_MONO_CHANNEL_COUNT ?
            (left + right) / PCM_CHANNEL_LIMIT : left;
        current_[1] = right;
        ++inputs_;
        if (!initialized_) {
            previous_ = current_;
            initialized_ = true;
        } else {
            phase_ -= targetRate_;
        }
        pending_ = phase_ <= 0;
    }
    bool Pull(std::vector<uint8_t> &output)
    {
        if (!Pending()) { return false; }
        const int64_t fraction = phase_ + targetRate_;
        for (int32_t channel = 0; channel < targetChannels_; ++channel) {
            const int64_t value = pending_ ? (previous_[channel] * (targetRate_ - fraction) +
                current_[channel] * fraction) / targetRate_ : current_[channel];
            const uint16_t sample = static_cast<uint16_t>(static_cast<int16_t>(value));
            output.push_back(static_cast<uint8_t>(sample));
            output.push_back(static_cast<uint8_t>(sample >> PCM_SAMPLE_BITS_PER_BYTE));
        }
        ++count_;
        if (pending_) {
            phase_ += sourceRate_;
            pending_ = phase_ <= 0;
        }
        return true;
    }
    int64_t Count() const { return count_; }
private:
    static int32_t Read(const uint8_t *data)
    {
        const uint16_t value = static_cast<uint16_t>(data[0]) |
            static_cast<uint16_t>(data[1]) << PCM_SAMPLE_BITS_PER_BYTE;
        return value >= PCM_SIGNED_SAMPLE_MIDPOINT ?
            static_cast<int32_t>(value) - PCM_SIGNED_SAMPLE_RANGE : value;
    }
    int32_t sourceRate_ = 1;
    int32_t targetRate_ = 1;
    int32_t sourceChannels_ = 1;
    int32_t targetChannels_ = 1;
    int64_t phase_ = 0;
    int64_t count_ = 0;
    int64_t inputs_ = 0;
    int64_t finalCount_ = 0;
    bool initialized_ = false;
    bool pending_ = false;
    std::array<int32_t, PCM_CHANNEL_LIMIT> previous_ {};
    std::array<int32_t, PCM_CHANNEL_LIMIT> current_ {};
};
#endif
