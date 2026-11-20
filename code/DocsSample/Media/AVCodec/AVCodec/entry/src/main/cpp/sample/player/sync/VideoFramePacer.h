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

#ifndef AVCODEC_VIDEO_FRAME_PACER_H
#define AVCODEC_VIDEO_FRAME_PACER_H

#include <chrono>
#include <cstdint>
#include <cmath>

// 仅由视频输出线程使用。PTS决定帧间隔，单调时钟负责等待，不受系统校时影响。
class VideoFramePacer {
public:
    using Clock = std::chrono::steady_clock;
    void Reset() { initialized_ = false; }
    void SetRevision(uint64_t revision)
    {
        if (revision != revision_) {
            Reset();
            revision_ = revision;
        }
    }

    Clock::time_point Deadline(int64_t ptsUs, double speed, Clock::time_point now = Clock::now())
    {
        if (!std::isfinite(speed) || speed <= 0) {
            Reset();
            return now;
        }
        if (!initialized_ || speed != speed_ || ptsUs < lastPtsUs_) {
            anchorPtsUs_ = ptsUs;
            anchorTime_ = now;
            speed_ = speed;
            initialized_ = true;
        }
        lastPtsUs_ = ptsUs;
        const auto elapsed = std::chrono::duration<double, std::micro>(
            (static_cast<double>(ptsUs) - static_cast<double>(anchorPtsUs_)) / speed_);
        return anchorTime_ + std::chrono::duration_cast<Clock::duration>(elapsed);
    }

private:
    bool initialized_ = false;
    uint64_t revision_ = 0;
    double speed_ = 1;
    int64_t anchorPtsUs_ = 0;
    int64_t lastPtsUs_ = 0;
    Clock::time_point anchorTime_;
};

#endif
