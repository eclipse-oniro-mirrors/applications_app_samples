/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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
