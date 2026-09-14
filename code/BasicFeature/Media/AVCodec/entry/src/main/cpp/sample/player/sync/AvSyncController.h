/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#ifndef AVCODEC_SAMPLE_AV_SYNC_CONTROLLER_H
#define AVCODEC_SAMPLE_AV_SYNC_CONTROLLER_H

#include <cstdint>

struct AvSyncInput {
    int64_t videoPtsUs = 0;
    int64_t audioFramesWritten = 0;
    int64_t framePosition = 0;
    int64_t currentAudioPtsUs = 0;
    int64_t nowTimestampNs = 0;
    int64_t audioTimestampNs = 0;
    int32_t sampleRate = 0;
    double speed = 1.0;
};

struct AvSyncDecision {
    int64_t waitTimeUs = 0;
    bool dropFrame = false;
    bool valid = false;
};

class AvSyncController {
public:
    AvSyncDecision Decide(const AvSyncInput &input) const;
    static constexpr int64_t waitTimeUsThresholdWarning = -40 * 1000;
    static constexpr int64_t waitTimeUsThreshold = 1 * 1000 * 1000;
    static constexpr int64_t renderAheadUs = 1'000'000 / 60 * 2;
};

#endif // AVCODEC_SAMPLE_AV_SYNC_CONTROLLER_H
