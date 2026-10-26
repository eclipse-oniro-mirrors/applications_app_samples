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

#ifndef AVCODEC_RECORDER_STREAM_METRICS_H
#define AVCODEC_RECORDER_STREAM_METRICS_H

#include <deque>
#include <string>
#include "StageTiming.h"

struct RecorderStreamMetricsInfo {
    double recentBitrate = 0;
    double recentFps = 0;
    double expectedFps = 0;
    int64_t targetBitrate = 0;
    double outputIdleMs = -1;
    double longestGapMs = 0;
    uint64_t keyFrames = 0;
    int64_t lastKeyFramePtsUs = -1;
    double keyFrameIntervalMs = -1;
    std::string keyFrameRequest = "none";
    double keyFrameWaitMs = -1;
    uint64_t keyFrameRequests = 0;
    uint64_t parameterAccepted = 0;
    uint64_t parameterRejected = 0;
    uint64_t ptsRegressions = 0;
};

// 仅保存最近一秒的接收时刻和字节数，不保存 codec Buffer；最多保留 1024 个样本。
class RecorderStreamMetrics {
public:
    void Configure(double fps, int64_t bitrate)
    {
        info_.expectedFps = fps;
        info_.targetBitrate = bitrate;
    }

    void Start(int64_t now) { startedAt_ = now; }
    void Stop(int64_t now)
    {
        // 输出线程结束和资源回收都可能调用；只冻结一次，避免把后续清理等待计入停顿。
        if (stoppedAt_ < 0) {
            stoppedAt_ = now;
        }
    }

    void ParameterResult(int64_t bitrate, bool keyFrame, bool accepted, int64_t now)
    {
        if (!accepted) {
            ++info_.parameterRejected;
            return;
        }
        ++info_.parameterAccepted;
        if (bitrate > 0) {
            info_.targetBitrate = bitrate;
        }
        if (keyFrame) {
            ++info_.keyFrameRequests;
            requestAt_ = now;
            info_.keyFrameRequest = "pending";
            info_.keyFrameWaitMs = -1;
        }
    }

    void Record(uint64_t bytes, int64_t ptsUs, bool keyFrame, int64_t now)
    {
        if (lastAt_ >= 0) {
            info_.longestGapMs = std::max(info_.longestGapMs, (now - lastAt_) / microsecondsPerMillisecond);
        }
        if (lastPts_ >= 0 && ptsUs < lastPts_) {
            ++info_.ptsRegressions;
        }
        lastAt_ = now;
        lastPts_ = ptsUs;
        samples_.push_back({now, bytes});
        while (!samples_.empty() && (now - samples_.front().atUs > windowUs || samples_.size() > maxSamples)) {
            samples_.pop_front();
        }
        if (keyFrame) {
            ++info_.keyFrames;
            if (info_.lastKeyFramePtsUs >= 0 && ptsUs >= info_.lastKeyFramePtsUs) {
                info_.keyFrameIntervalMs = (ptsUs - info_.lastKeyFramePtsUs) / microsecondsPerMillisecond;
            }
            info_.lastKeyFramePtsUs = ptsUs;
            if (requestAt_ >= 0 && now >= requestAt_) {
                info_.keyFrameRequest = "observed";
                info_.keyFrameWaitMs = (now - requestAt_) / microsecondsPerMillisecond;
                requestAt_ = -1;
            }
        }
    }

    RecorderStreamMetricsInfo Snapshot(int64_t now) const
    {
        auto info = info_;
        const int64_t end = stoppedAt_ >= 0 ? stoppedAt_ : now;
        info.outputIdleMs = lastAt_ >= 0 ? (end - lastAt_) / microsecondsPerMillisecond :
            (startedAt_ >= 0 ? (end - startedAt_) / microsecondsPerMillisecond : -1);
        info.longestGapMs = std::max(info.longestGapMs, info.outputIdleMs);
        if (requestAt_ >= 0) {
            info.keyFrameWaitMs = (end - requestAt_) / microsecondsPerMillisecond;
            info.keyFrameRequest = stoppedAt_ >= 0 ? "ended" : "pending";
        }
        uint64_t bytes = 0;
        uint64_t frames = 0;
        for (const auto &sample : samples_) {
            if (sample.atUs > end - windowUs && sample.atUs <= end) {
                bytes += sample.bytes;
                ++frames;
            }
        }
        const int64_t duration = startedAt_ >= 0 ? std::min(windowUs, end - startedAt_) : 0;
        if (duration > 0) {
            const double seconds = duration / microsecondsPerSecond;
            info.recentFps = frames / seconds;
            info.recentBitrate = bytes * bitsPerByte / seconds;
        }
        return info;
    }

private:
    static constexpr double microsecondsPerMillisecond = 1000.0;
    static constexpr double microsecondsPerSecond = 1000000.0;
    static constexpr double bitsPerByte = 8.0;
    struct Sample { int64_t atUs; uint64_t bytes; };
    static constexpr int64_t windowUs = 1000000;
    static constexpr size_t maxSamples = 1024;
    RecorderStreamMetricsInfo info_;
    std::deque<Sample> samples_;
    int64_t startedAt_ = -1;
    int64_t stoppedAt_ = -1;
    int64_t lastAt_ = -1;
    int64_t lastPts_ = -1;
    int64_t requestAt_ = -1;
};

#endif
