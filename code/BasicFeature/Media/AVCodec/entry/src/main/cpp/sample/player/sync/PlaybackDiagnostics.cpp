/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#include "PlaybackDiagnostics.h"
#include <algorithm>
#include <cstdlib>

namespace {
constexpr auto SYNC_SAMPLE_VALIDITY = std::chrono::seconds(1);
}

void PlaybackDiagnostics::Reset()
{
    std::lock_guard<std::mutex> lock(mutex_);
    info_ = {};
    syncSamples_ = 0;
    absoluteOffsetSumUs_ = 0;
    lastSync_ = {};
    seekStartedAt_ = {};
    waitingSeekOutput_ = false;
    audioUnderruns = 0;
    audioQueueDurationUs = 0;
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

void PlaybackDiagnostics::BeginSeek(Clock::time_point startedAt)
{
    std::lock_guard<std::mutex> lock(mutex_);
    seekStartedAt_ = startedAt;
    waitingSeekOutput_ = true;
    info_.seekRebuildUs = -1;
    info_.seekFirstOutputUs = -1;
    info_.syncAvailable = false;
    info_.maxAbsoluteOffsetUs = 0;
    info_.averageAbsoluteOffsetUs = 0;
    syncSamples_ = 0;
    absoluteOffsetSumUs_ = 0;
    audioQueueDurationUs = 0;
}

void PlaybackDiagnostics::EndSeek(bool success)
{
    std::lock_guard<std::mutex> lock(mutex_);
    if (!success) {
        waitingSeekOutput_ = false;
        return;
    }
    info_.seekRebuildUs = std::chrono::duration_cast<std::chrono::microseconds>(Clock::now() - seekStartedAt_).count();
}

void PlaybackDiagnostics::RecordSeekOutput()
{
    std::lock_guard<std::mutex> lock(mutex_);
    if (waitingSeekOutput_) {
        info_.seekFirstOutputUs =
            std::chrono::duration_cast<std::chrono::microseconds>(Clock::now() - seekStartedAt_).count();
        waitingSeekOutput_ = false;
    }
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
    info_.backgroundPaused = paused;
}

PlaybackDiagnosticsInfo PlaybackDiagnostics::Snapshot() const
{
    std::lock_guard<std::mutex> lock(mutex_);
    auto snapshot = info_;
    snapshot.syncAvailable = info_.syncAvailable && Clock::now() - lastSync_ <= SYNC_SAMPLE_VALIDITY;
    snapshot.audioUnderruns = audioUnderruns.load();
    snapshot.audioQueueDurationUs = audioQueueDurationUs.load();
    return snapshot;
}
