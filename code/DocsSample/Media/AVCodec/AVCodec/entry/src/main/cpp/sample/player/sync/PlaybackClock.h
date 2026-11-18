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

#ifndef AVCODEC_SAMPLE_PLAYBACK_CLOCK_H
#define AVCODEC_SAMPLE_PLAYBACK_CLOCK_H

#include <atomic>
#include <cstdint>

class PlaybackClock {
public:
    void Reset(int64_t positionUs);
    void SetAudioTimestampNs(int64_t timestampNs);
    int64_t GetAudioTimestampNs() const;
    int64_t UpdateNowTimestampNs();
    int64_t GetNowTimestampNs() const;
    void AddWrittenSamples(int64_t sampleCount);
    int64_t GetWrittenSamples() const;
    void SetAudioBufferPts(int64_t pts);
    int64_t GetAudioBufferPts() const;

private:
    std::atomic<int64_t> nowTimestampNs_ { 0 };
    std::atomic<int64_t> audioTimestampNs_ { 0 };
    std::atomic<int64_t> writtenSamples_ { 0 };
    std::atomic<int64_t> audioBufferPtsUs_ { 0 };
};

#endif // AVCODEC_SAMPLE_PLAYBACK_CLOCK_H
