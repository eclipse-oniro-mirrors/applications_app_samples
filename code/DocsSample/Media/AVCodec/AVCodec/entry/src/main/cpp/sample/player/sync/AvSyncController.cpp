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
    return {waitTimeUs, dropFrame, true, mediaWaitTimeUs, latency};
}
