/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#include "AvSyncController.h"
#include <algorithm>

AvSyncDecision AvSyncController::Decide(const AvSyncInput &input) const
{
    if (input.sampleRate <= 0 || input.speed <= 0.0) {
        return {};
    }
    const int64_t pendingFrames = std::max(input.audioFramesWritten - input.framePosition, int64_t { 0 });
    const int64_t latency = pendingFrames * 1'000'000 / input.sampleRate;
    const int64_t anchorDiff = (input.nowTimestampNs - input.audioTimestampNs) / 1000;
    const int64_t audioPlayedTime = input.currentAudioPtsUs - latency +
        static_cast<int64_t>(anchorDiff * input.speed);
    const int64_t mediaWaitTimeUs = input.videoPtsUs - audioPlayedTime;
    int64_t waitTimeUs = static_cast<int64_t>(mediaWaitTimeUs / input.speed);
    bool dropFrame = false;
    if (waitTimeUs < waitTimeUsThresholdWarning) {
        dropFrame = true;
    } else if (waitTimeUs > waitTimeUsThreshold) {
        waitTimeUs = waitTimeUsThreshold;
    }
    return {waitTimeUs, dropFrame, true};
}
