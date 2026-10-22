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

#ifndef AVCODEC_SAMPLE_PLAYBACK_DIAGNOSTICS_H
#define AVCODEC_SAMPLE_PLAYBACK_DIAGNOSTICS_H

#include <atomic>
#include <chrono>
#include <cstdint>
#include <mutex>
#include "AvSyncController.h"

struct PlaybackDiagnosticsInfo {
    bool syncAvailable = false;
    int64_t avOffsetUs = 0;
    double averageAbsoluteOffsetUs = 0;
    int64_t maxAbsoluteOffsetUs = 0;
    int64_t audioDevicePendingUs = 0;
    int64_t audioQueueDurationUs = 0;
    uint64_t audioUnderruns = 0;
    uint64_t syncDrops = 0;
    int64_t seekRebuildUs = -1;
    int64_t seekFirstOutputUs = -1;
    bool audioInterrupted = false;
    uint64_t audioInterruptions = 0;
    int32_t lastAudioInterruptHint = 0;
    bool backgroundPaused = false;
};

class PlaybackDiagnostics {
public:
    using Clock = std::chrono::steady_clock;
    void Reset();
    void RecordSync(const AvSyncDecision &decision);
    void BeginSeek(Clock::time_point startedAt);
    void EndSeek(bool success);
    void RecordSeekOutput();
    void RecordAudioInterrupt(uint64_t count, int32_t hint, bool interrupted);
    void SetBackgroundPaused(bool paused);
    PlaybackDiagnosticsInfo Snapshot() const;

    std::atomic<uint64_t> audioUnderruns { 0 };
    std::atomic<int64_t> audioQueueDurationUs { 0 };

private:
    mutable std::mutex mutex_;
    PlaybackDiagnosticsInfo info_;
    uint64_t syncSamples_ = 0;
    double absoluteOffsetSumUs_ = 0;
    Clock::time_point lastSync_ {};
    Clock::time_point seekStartedAt_ {};
    bool waitingSeekOutput_ = false;
};

#endif // AVCODEC_SAMPLE_PLAYBACK_DIAGNOSTICS_H
