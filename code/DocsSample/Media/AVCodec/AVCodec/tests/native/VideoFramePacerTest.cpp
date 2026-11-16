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
#include <limits>
#include "../../entry/src/main/cpp/sample/player/sync/VideoFramePacer.h"

namespace {
constexpr int64_t FIRST_PTS_US = 1000000;
constexpr int64_t EARLY_FRAME_PTS_US = 1040000;
constexpr int64_t LATE_FRAME_PTS_US = 1120000;
constexpr int64_t SPEED_CHANGE_PTS_US = 1160000;
constexpr int64_t DOUBLE_SPEED_PTS_US = 1200000;
constexpr int64_t RESUME_PTS_US = 1240000;
constexpr int64_t RESUME_NEXT_PTS_US = 1280000;
constexpr int64_t BACKWARD_SEEK_PTS_US = 500000;
constexpr int64_t INVALID_SPEED_PTS_US = 600000;
constexpr int64_t RESET_PTS_US = 9000000;
constexpr double NORMAL_SPEED = 1.0;
constexpr double DOUBLE_SPEED = 2.0;
constexpr uint64_t RESUME_REVISION = 2;
constexpr auto ORIGIN_TIME = std::chrono::seconds(10);
constexpr auto EARLY_FRAME_DELAY = std::chrono::milliseconds(7);
constexpr auto LATE_FRAME_DELAY = std::chrono::milliseconds(80);
constexpr auto FRAME_INTERVAL = std::chrono::milliseconds(40);
constexpr auto LATE_FRAME_INTERVAL = std::chrono::milliseconds(120);
constexpr auto DOUBLE_SPEED_INTERVAL = std::chrono::milliseconds(20);
constexpr auto SPEED_CHANGE_DELAY = std::chrono::seconds(1);
constexpr auto RESUME_DELAY = std::chrono::seconds(10);
constexpr auto BACKWARD_SEEK_DELAY = std::chrono::seconds(11);

void CheckDeadline(bool passed)
{
    if (!passed) {
        std::cerr << "Video pacing deadline differs" << std::endl;
        std::exit(EXIT_FAILURE);
    }
}
} // namespace

int main()
{
    VideoFramePacer pacer;
    const auto origin = VideoFramePacer::Clock::time_point(ORIGIN_TIME);
    CheckDeadline(pacer.Deadline(FIRST_PTS_US, NORMAL_SPEED, origin) == origin);
    CheckDeadline(pacer.Deadline(EARLY_FRAME_PTS_US, NORMAL_SPEED, origin + EARLY_FRAME_DELAY) ==
        origin + FRAME_INTERVAL);
    CheckDeadline(pacer.Deadline(LATE_FRAME_PTS_US, NORMAL_SPEED, origin + LATE_FRAME_DELAY) ==
        origin + LATE_FRAME_INTERVAL);
    const auto speedChangeTime = origin + SPEED_CHANGE_DELAY;
    CheckDeadline(pacer.Deadline(SPEED_CHANGE_PTS_US, DOUBLE_SPEED, speedChangeTime) == speedChangeTime);
    CheckDeadline(pacer.Deadline(DOUBLE_SPEED_PTS_US, DOUBLE_SPEED, speedChangeTime) ==
        speedChangeTime + DOUBLE_SPEED_INTERVAL);
    // 暂停和恢复即使发生在两帧之间，也通过修订号重建时钟基准。
    pacer.SetRevision(RESUME_REVISION);
    const auto resumeTime = origin + RESUME_DELAY;
    CheckDeadline(pacer.Deadline(RESUME_PTS_US, DOUBLE_SPEED, resumeTime) == resumeTime);
    CheckDeadline(pacer.Deadline(RESUME_NEXT_PTS_US, DOUBLE_SPEED, resumeTime) == resumeTime + DOUBLE_SPEED_INTERVAL);
    const auto backwardSeekTime = origin + BACKWARD_SEEK_DELAY;
    CheckDeadline(pacer.Deadline(BACKWARD_SEEK_PTS_US, DOUBLE_SPEED, backwardSeekTime) == backwardSeekTime);
    CheckDeadline(pacer.Deadline(INVALID_SPEED_PTS_US, 0, origin) == origin);
    CheckDeadline(pacer.Deadline(INVALID_SPEED_PTS_US, std::numeric_limits<double>::quiet_NaN(), origin) == origin);
    pacer.Reset();
    CheckDeadline(pacer.Deadline(RESET_PTS_US, NORMAL_SPEED, origin) == origin);
    std::cout << "Video frame pacing passed" << std::endl;
}
