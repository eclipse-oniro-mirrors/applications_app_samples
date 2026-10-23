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

#include "PlaybackDiagnostics.h"
#include <algorithm>
#include <cstdlib>

namespace {
constexpr auto SYNC_SAMPLE_VALIDITY = std::chrono::seconds(1);
constexpr size_t MAX_TIMELINE_EVENTS = 128;
constexpr size_t MAX_PRESENT_SAMPLES = 512;
}

void PlaybackDiagnostics::Reset()
{
    std::lock_guard<std::mutex> lock(mutex_);
    info_ = {};
    events_.clear();
    presentCallUs_.clear();
    sessionStartedAt_ = Clock::now();
    sequence_ = 0;
    seekId_ = 0;
    seekTargetUs_ = -1;
    firstOutput_ = true;
    AppendEvent("playback.initialize", -1);
    syncSamples_ = 0;
    absoluteOffsetSumUs_ = 0;
    lastSync_ = {};
    seekStartedAt_ = {};
    waitingSeekOutput_ = false;
    audioUnderruns = 0;
    audioQueueDurationUs = 0;
}

void PlaybackDiagnostics::SetSession(const std::string &id, const std::string &requested)
{
    std::lock_guard<std::mutex> lock(mutex_);
    info_.sessionId = id;
    info_.requestedConfiguration = requested;
    info_.observedConfiguration = "not configured";
}

void PlaybackDiagnostics::SetObservedConfiguration(const std::string &observed)
{
    std::lock_guard<std::mutex> lock(mutex_);
    info_.observedConfiguration = observed;
}

void PlaybackDiagnostics::RecordSync(const AvSyncDecision &decision)
{
    if (!decision.valid) {
        return;
    }
    std::lock_guard<std::mutex> lock(mutex_);
    lastSync_ = Clock::now();
    info_.syncAvailable = true;
    info_.avOffsetUs = decision.mediaOffsetUs;
    info_.audioDevicePendingUs = decision.audioPendingUs;
    const int64_t absoluteOffsetUs = std::abs(decision.mediaOffsetUs);
    info_.maxAbsoluteOffsetUs = std::max(info_.maxAbsoluteOffsetUs, absoluteOffsetUs);
    absoluteOffsetSumUs_ += static_cast<double>(absoluteOffsetUs);
    info_.averageAbsoluteOffsetUs = absoluteOffsetSumUs_ / static_cast<double>(++syncSamples_);
    if (decision.dropFrame) {
        ++info_.syncDrops;
    }
}

void PlaybackDiagnostics::BeginSeek(Clock::time_point startedAt, int64_t targetUs)
{
    std::lock_guard<std::mutex> lock(mutex_);
    if (waitingSeekOutput_) {
        AppendEvent("seek.superseded", seekTargetUs_);
    }
    ++seekId_;
    seekTargetUs_ = targetUs;
    AppendEvent("seek.begin", targetUs);
    seekStartedAt_ = startedAt;
    // 此时旧输出线程尚未退出，不能把最后提交的旧帧记作本次 Seek 的首帧。
    waitingSeekOutput_ = false;
    info_.seekRebuildUs = -1;
    info_.seekFirstOutputUs = -1;
    info_.syncAvailable = false;
    info_.maxAbsoluteOffsetUs = 0;
    info_.averageAbsoluteOffsetUs = 0;
    syncSamples_ = 0;
    absoluteOffsetSumUs_ = 0;
    audioQueueDurationUs = 0;
}

void PlaybackDiagnostics::ArmSeekOutput()
{
    std::lock_guard<std::mutex> lock(mutex_);
    waitingSeekOutput_ = true;
    AppendEvent("seek.await.output", seekTargetUs_);
}

void PlaybackDiagnostics::EndSeek(bool success)
{
    std::lock_guard<std::mutex> lock(mutex_);
    if (!success) {
        AppendEvent("seek.failed", seekTargetUs_);
        waitingSeekOutput_ = false;
        return;
    }
    info_.seekRebuildUs = std::chrono::duration_cast<std::chrono::microseconds>(Clock::now() - seekStartedAt_).count();
    AppendEvent("seek.workers.started", seekTargetUs_);
}

void PlaybackDiagnostics::RecordSeekOutput()
{
    std::lock_guard<std::mutex> lock(mutex_);
    CompleteFirstOutput(-1, false);
}

void PlaybackDiagnostics::CompleteFirstOutput(int64_t mediaUs, bool video)
{
    if (firstOutput_) {
        AppendEvent(video ? "video.first.submit" : "audio.first.output", mediaUs);
        firstOutput_ = false;
    }
    if (waitingSeekOutput_) {
        info_.seekFirstOutputUs =
            std::chrono::duration_cast<std::chrono::microseconds>(Clock::now() - seekStartedAt_).count();
        waitingSeekOutput_ = false;
        AppendEvent(video ? "seek.video.first.submit" : "seek.audio.first.output", mediaUs);
    }
}

void PlaybackDiagnostics::AppendEvent(const std::string &stage, int64_t mediaUs)
{
    if (events_.size() >= MAX_TIMELINE_EVENTS) {
        events_.pop_front();
    }
    const auto elapsed = std::chrono::duration_cast<std::chrono::microseconds>(Clock::now() - sessionStartedAt_);
    events_.push_back({ ++sequence_, seekId_, elapsed.count(), mediaUs, stage });
}

void PlaybackDiagnostics::RecordEvent(const std::string &stage, int64_t mediaUs)
{
    std::lock_guard<std::mutex> lock(mutex_);
    AppendEvent(stage, mediaUs);
}

void PlaybackDiagnostics::RecordVideoSubmission(int64_t ptsUs, int64_t durationUs)
{
    std::lock_guard<std::mutex> lock(mutex_);
    CompleteFirstOutput(ptsUs, true);
    if (presentCallUs_.size() >= MAX_PRESENT_SAMPLES) {
        presentCallUs_.pop_front();
    }
    presentCallUs_.push_back(std::max(int64_t { 0 }, durationUs));
}

void PlaybackDiagnostics::RecordAudioInterrupt(uint64_t count, int32_t hint, bool interrupted)
{
    std::lock_guard<std::mutex> lock(mutex_);
    info_.audioInterruptions = count;
    info_.lastAudioInterruptHint = hint;
    info_.audioInterrupted = interrupted;
}

void PlaybackDiagnostics::SetBackgroundPaused(bool paused)
{
    std::lock_guard<std::mutex> lock(mutex_);
    if (info_.backgroundPaused == paused) {
        return;
    }
    info_.backgroundPaused = paused;
    AppendEvent(paused ? "background.pause" : "background.active", -1);
}

PlaybackDiagnosticsInfo PlaybackDiagnostics::Snapshot() const
{
    std::unique_lock<std::mutex> lock(mutex_);
    auto snapshot = info_;
    snapshot.syncAvailable = info_.syncAvailable && Clock::now() - lastSync_ <= SYNC_SAMPLE_VALIDITY;
    snapshot.audioUnderruns = audioUnderruns.load();
    snapshot.audioQueueDurationUs = audioQueueDurationUs.load();
    snapshot.events.assign(events_.begin(), events_.end());
    snapshot.presentCallSamples = presentCallUs_.size();
    std::vector<int64_t> sorted(presentCallUs_.begin(), presentCallUs_.end());
    lock.unlock();
    if (!sorted.empty()) {
        // 只在读取快照时排序，送显线程仅维护固定容量样本，不逐帧计算分位数。
        std::sort(sorted.begin(), sorted.end());
        const size_t rank = (sorted.size() * 95 + 99) / 100;
        snapshot.presentCallP95Us = sorted[rank - 1];
        snapshot.presentCallMaxUs = sorted.back();
    }
    return snapshot;
}
