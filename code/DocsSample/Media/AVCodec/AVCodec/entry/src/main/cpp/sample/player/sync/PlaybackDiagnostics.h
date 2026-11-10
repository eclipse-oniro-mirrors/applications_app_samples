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
#include <deque>
#include <mutex>
#include <string>
#include <vector>
#include "AvSyncController.h"

struct PlaybackTimelineEvent {
    uint64_t sequence = 0;
    uint64_t seekId = 0;
    int64_t elapsedUs = 0;
    int64_t mediaUs = -1;
    std::string stage;
};

struct PlaybackDiagnosticsInfo {
    std::string sessionId;
    std::string requestedConfiguration;
    std::string observedConfiguration;
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
    std::vector<PlaybackTimelineEvent> events;
    double presentCallP95Us = 0;
    double presentCallMaxUs = 0;
    size_t presentCallSamples = 0;
};

class PlaybackDiagnostics {
public:
    using Clock = std::chrono::steady_clock;
    void Reset();
    void SetSession(const std::string &id, const std::string &requested);
    void SetObservedConfiguration(const std::string &observed);
    void RecordSync(const AvSyncDecision &decision);
    void BeginSeek(Clock::time_point startedAt, int64_t targetUs = -1);
    void ArmSeekOutput();
    void EndSeek(bool success);
    void RecordSeekOutput();
    void RecordEvent(const std::string &stage, int64_t mediaUs = -1);
    void RecordVideoSubmission(int64_t ptsUs, int64_t durationUs);
    void RecordAudioInterrupt(uint64_t count, int32_t hint, bool interrupted);
    void SetBackgroundPaused(bool paused);
    PlaybackDiagnosticsInfo Snapshot() const;

    std::atomic<uint64_t> audioUnderruns { 0 };
    std::atomic<int64_t> audioQueueDurationUs { 0 };

private:
    void AppendEvent(const std::string &stage, int64_t mediaUs);
    void CompleteFirstOutput(int64_t mediaUs, bool video);
    std::deque<PlaybackTimelineEvent> events_;
    std::deque<int64_t> presentCallUs_;
    Clock::time_point sessionStartedAt_ = Clock::now();
    uint64_t sequence_ = 0;
    uint64_t seekId_ = 0;
    int64_t seekTargetUs_ = -1;
    bool firstOutput_ = true;
    mutable std::mutex mutex_;
    PlaybackDiagnosticsInfo info_;
    uint64_t syncSamples_ = 0;
    double absoluteOffsetSumUs_ = 0;
    Clock::time_point lastSync_ {};
    Clock::time_point seekStartedAt_ {};
    bool waitingSeekOutput_ = false;
};

#endif // AVCODEC_SAMPLE_PLAYBACK_DIAGNOSTICS_H
