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

void CheckDeadline(bool passed)
{
    if (!passed) { std::cerr << "Video pacing deadline differs" << std::endl; std::exit(EXIT_FAILURE); }
}

int main()
{
    using namespace std::chrono;
    VideoFramePacer pacer;
    const auto origin = VideoFramePacer::Clock::time_point(seconds(10));
    CheckDeadline(pacer.Deadline(1000000, 1, origin) == origin);
    CheckDeadline(pacer.Deadline(1040000, 1, origin + milliseconds(7)) == origin + milliseconds(40));
    CheckDeadline(pacer.Deadline(1120000, 1, origin + milliseconds(80)) == origin + milliseconds(120));
    CheckDeadline(pacer.Deadline(1160000, 2, origin + seconds(1)) == origin + seconds(1));
    CheckDeadline(pacer.Deadline(1200000, 2, origin + seconds(1)) == origin + seconds(1) + milliseconds(20));
    // 暂停和恢复即使发生在两帧之间，也通过修订号重建时钟基准。
    pacer.SetRevision(2);
    CheckDeadline(pacer.Deadline(1240000, 2, origin + seconds(10)) == origin + seconds(10));
    CheckDeadline(pacer.Deadline(1280000, 2, origin + seconds(10)) == origin + seconds(10) + milliseconds(20));
    CheckDeadline(pacer.Deadline(500000, 2, origin + seconds(11)) == origin + seconds(11));
    CheckDeadline(pacer.Deadline(600000, 0, origin) == origin);
    CheckDeadline(pacer.Deadline(600000, std::numeric_limits<double>::quiet_NaN(), origin) == origin);
    pacer.Reset();
    CheckDeadline(pacer.Deadline(9000000, 1, origin) == origin);
    std::cout << "Video frame pacing passed" << std::endl;
}
