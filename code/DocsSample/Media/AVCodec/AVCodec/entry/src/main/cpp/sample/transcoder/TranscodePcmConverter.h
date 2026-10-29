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
#include <vector>

// Linear interpolation retains two source sample frames, including across decoder Buffer boundaries.
class TranscodePcmConverter {
public:
    bool Configure(int32_t sourceRate, int32_t targetRate, int32_t sourceChannels, int32_t targetChannels)
    {
        if (sourceRate <= 0 || sourceRate > 96000 || targetRate <= 0 || targetRate > 96000 ||
            sourceChannels < 1 || sourceChannels > 2 || targetChannels < 1 || targetChannels > 2) { return false; }
        sourceRate_ = sourceRate; targetRate_ = targetRate;
        sourceChannels_ = sourceChannels; targetChannels_ = targetChannels;
        phase_ = 0; count_ = 0; inputs_ = 0; finalCount_ = 0; initialized_ = false; pending_ = false;
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
        int32_t right = sourceChannels_ == 2 ? Read(sample + 2) : left;
        current_[0] = targetChannels_ == 1 ? (left + right) / 2 : left;
        current_[1] = right;
        ++inputs_;
        if (!initialized_) { previous_ = current_; initialized_ = true; }
        else { phase_ -= targetRate_; }
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
            output.push_back(static_cast<uint8_t>(sample >> 8));
        }
        ++count_;
        if (pending_) { phase_ += sourceRate_; pending_ = phase_ <= 0; }
        return true;
    }
    int64_t Count() const { return count_; }
private:
    static int32_t Read(const uint8_t *data)
    {
        const uint16_t value = static_cast<uint16_t>(data[0]) | static_cast<uint16_t>(data[1]) << 8;
        return value >= 32768 ? static_cast<int32_t>(value) - 65536 : value;
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
    std::array<int32_t, 2> previous_ {};
    std::array<int32_t, 2> current_ {};
};
#endif
