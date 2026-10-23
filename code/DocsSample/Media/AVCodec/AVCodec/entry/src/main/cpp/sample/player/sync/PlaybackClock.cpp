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

#include "PlaybackClock.h"
#include <chrono>

void PlaybackClock::Reset(int64_t positionUs)
{
    nowTimestampNs_.store(0);
    audioTimestampNs_.store(0);
    writtenSamples_.store(0);
    audioBufferPtsUs_.store(positionUs);
}

void PlaybackClock::SetAudioTimestampNs(int64_t timestampNs)
{
    audioTimestampNs_.store(timestampNs);
}

int64_t PlaybackClock::GetAudioTimestampNs() const
{
    return audioTimestampNs_.load();
}

int64_t PlaybackClock::UpdateNowTimestampNs()
{
    const auto now = std::chrono::steady_clock::now();
    const int64_t timestampNs = std::chrono::time_point_cast<std::chrono::nanoseconds>(now)
        .time_since_epoch().count();
    nowTimestampNs_.store(timestampNs);
    return timestampNs;
}

int64_t PlaybackClock::GetNowTimestampNs() const
{
    return nowTimestampNs_.load();
}

void PlaybackClock::AddWrittenSamples(int64_t sampleCount)
{
    writtenSamples_.fetch_add(sampleCount);
}

int64_t PlaybackClock::GetWrittenSamples() const
{
    return writtenSamples_.load();
}

void PlaybackClock::SetAudioBufferPts(int64_t pts)
{
    audioBufferPtsUs_.store(pts);
}

int64_t PlaybackClock::GetAudioBufferPts() const
{
    return audioBufferPtsUs_.load();
}
