/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
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
