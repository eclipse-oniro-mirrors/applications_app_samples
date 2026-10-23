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

#ifndef AVCODEC_RECORDER_AUDIO_STATS_H
#define AVCODEC_RECORDER_AUDIO_STATS_H

#include <mutex>
#include "RecorderStreamMetrics.h"

struct RecorderAudioInfo {
    uint64_t capturedFrames = 0;
    double pendingPcmMs = 0;
    uint64_t outputFrames = 0;
    uint64_t outputBytes = 0;
    double recentBitrate = 0;
    double outputIdleMs = -1;
    int64_t firstPtsUs = -1;
    int64_t lastPtsUs = -1;
    int64_t primaryFirstPtsUs = -1;
    int64_t primaryLastPtsUs = -1;
    int64_t secondaryFirstPtsUs = -1;
    int64_t secondaryLastPtsUs = -1;
    uint64_t primaryWriteFailures = 0;
    uint64_t secondaryWriteFailures = 0;
    StageTimingInfo primaryMuxer;
    StageTimingInfo secondaryMuxer;
};

class RecorderAudioStats {
public:
    void Reset(int32_t rate, int32_t channels)
    {
        std::lock_guard<std::mutex> lock(mutex_);
        info_ = {};
        metrics_ = {};
        primaryTiming_ = {};
        secondaryTiming_ = {};
        sampleRate_ = rate;
        channels_ = channels;
        capturedBytes_ = 0;
        stopped_ = false;
        metrics_.Start(RecorderClockUs());
    }

    void Capture(int32_t bytes, int32_t pendingBytes)
    {
        std::lock_guard<std::mutex> lock(mutex_);
        if (stopped_ || sampleRate_ <= 0 || channels_ <= 0) { return; }
        capturedBytes_ += std::max(0, bytes);
        // 采集器固定为 S16LE。除以声道后是样本帧，不是单声道采样值总数。
        info_.capturedFrames = capturedBytes_ / channels_ / sizeof(int16_t);
        info_.pendingPcmMs = static_cast<double>(std::max(0, pendingBytes)) * 1000.0 /
            sampleRate_ / channels_ / sizeof(int16_t);
    }

    bool Output(int64_t ptsUs, int32_t bytes)
    {
        std::lock_guard<std::mutex> lock(mutex_);
        const bool first = info_.outputFrames == 0;
        if (first) { info_.firstPtsUs = ptsUs; }
        info_.lastPtsUs = ptsUs;
        ++info_.outputFrames;
        info_.outputBytes += std::max(0, bytes);
        metrics_.Record(std::max(0, bytes), ptsUs, false, RecorderClockUs());
        return first;
    }

    void Video(bool primary, int64_t ptsUs)
    {
        std::lock_guard<std::mutex> lock(mutex_);
        auto &first = primary ? info_.primaryFirstPtsUs : info_.secondaryFirstPtsUs;
        auto &last = primary ? info_.primaryLastPtsUs : info_.secondaryLastPtsUs;
        if (first < 0) { first = ptsUs; }
        last = ptsUs;
    }

    void Write(bool primary, int64_t timeUs, bool success)
    {
        std::lock_guard<std::mutex> lock(mutex_);
        (primary ? primaryTiming_ : secondaryTiming_).Record(timeUs);
        if (!success) { ++(primary ? info_.primaryWriteFailures : info_.secondaryWriteFailures); }
    }

    void Stop()
    {
        std::lock_guard<std::mutex> lock(mutex_);
        stopped_ = true;
        metrics_.Stop(RecorderClockUs());
    }

    RecorderAudioInfo Snapshot() const
    {
        std::lock_guard<std::mutex> lock(mutex_);
        auto info = info_;
        const auto live = metrics_.Snapshot(RecorderClockUs());
        info.recentBitrate = live.recentBitrate;
        info.outputIdleMs = live.outputIdleMs;
        info.primaryMuxer = primaryTiming_.Snapshot();
        info.secondaryMuxer = secondaryTiming_.Snapshot();
        return info;
    }

private:
    mutable std::mutex mutex_;
    RecorderAudioInfo info_;
    RecorderStreamMetrics metrics_;
    StageTiming primaryTiming_;
    StageTiming secondaryTiming_;
    int32_t sampleRate_ = 0;
    int32_t channels_ = 0;
    uint64_t capturedBytes_ = 0;
    bool stopped_ = false;
};

#endif
