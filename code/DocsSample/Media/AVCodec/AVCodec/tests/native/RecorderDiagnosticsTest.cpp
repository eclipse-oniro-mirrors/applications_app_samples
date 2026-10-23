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

#include <cmath>
#include <cstdlib>
#include <iostream>
#include "../../entry/src/main/cpp/sample/recorder/RecorderStreamMetrics.h"
#include "../../entry/src/main/cpp/sample/recorder/RecorderAudioStats.h"

namespace {
void Require(bool condition, const char *message)
{
    if (!condition) {
        std::cerr << message << '\n';
        std::exit(EXIT_FAILURE);
    }
}

bool Near(double value, double expected)
{
    return std::abs(value - expected) < 0.0001;
}

void TestWindowAndTargets()
{
    RecorderStreamMetrics metrics;
    metrics.Configure(30, 30000000);
    constexpr int64_t start = 1000000;
    metrics.Start(start);
    for (int i = 1; i <= 30; ++i) {
        metrics.Record(125000, (i - 1) * 1000000 / 30, i == 1, start + i * 1000000 / 30);
    }
    const auto high = metrics.Snapshot(start + 1000000);
    Require(Near(high.recentFps, 30) && Near(high.recentBitrate, 30000000), "One-second output window is wrong");
    metrics.ParameterResult(10000000, false, false, start + 1000001);
    Require(metrics.Snapshot(start + 1000001).targetBitrate == 30000000, "Rejected target changed accepted bitrate");
    metrics.ParameterResult(10000000, false, true, start + 1000001);
    for (int i = 1; i <= 25; ++i) {
        metrics.Record(50000, 1000000 + i * 40000, false, start + 1000000 + i * 40000);
    }
    const auto low = metrics.Snapshot(start + 2000000);
    Require(Near(low.recentFps, 25) && Near(low.recentBitrate, 10000000), "Old bitrate samples leaked into new window");
    Require(low.targetBitrate == 10000000 && low.parameterAccepted == 1 && low.parameterRejected == 1,
        "Parameter result counters are wrong");
    const auto idle = metrics.Snapshot(start + 3000000);
    Require(idle.recentFps == 0 && idle.recentBitrate == 0 && Near(idle.outputIdleMs, 1000),
        "Idle output must age out of the window");
}

void TestKeyFramesAndFreeze()
{
    RecorderStreamMetrics metrics;
    metrics.Configure(15, 10000000);
    metrics.Start(0);
    metrics.Record(100, 0, true, 10000);
    metrics.ParameterResult(0, true, true, 20000);
    Require(metrics.Snapshot(30000).keyFrameRequest == "pending", "Accepted request must wait for output");
    metrics.Record(100, 1000000, true, 70000);
    const auto observed = metrics.Snapshot(70000);
    Require(observed.keyFrameRequest == "observed" && observed.keyFrames == 2 &&
        Near(observed.keyFrameWaitMs, 50) && Near(observed.keyFrameIntervalMs, 1000), "Key-frame observation is wrong");
    Require(Near(observed.expectedFps, 15), "Preprocessed expected output rate was lost");
    metrics.Record(100, 500000, false, 80000);
    metrics.ParameterResult(0, true, false, 90000);
    Require(metrics.Snapshot(90000).keyFrameRequests == 1, "Rejected key-frame request counted as accepted");
    metrics.ParameterResult(0, true, true, 100000);
    metrics.Stop(200000);
    const auto stopped = metrics.Snapshot(300000);
    Require(stopped.keyFrameRequest == "ended" && Near(stopped.keyFrameWaitMs, 100) &&
        stopped.ptsRegressions == 1, "Pending request or PTS regression state was lost");
    metrics.Stop(9000000);
    const auto later = metrics.Snapshot(10000000);
    Require(Near(later.outputIdleMs, stopped.outputIdleMs) && Near(later.recentBitrate, stopped.recentBitrate) &&
        Near(later.longestGapMs, stopped.longestGapMs), "Release must not advance frozen diagnostics");
}

void TestEmptyAndBoundedSamples()
{
    RecorderStreamMetrics empty;
    Require(empty.Snapshot(0).outputIdleMs == -1, "Unstarted output should be unavailable");
    empty.Start(1000000);
    Require(empty.Snapshot(1000000).recentFps == 0, "Zero-duration snapshot should not divide by zero");
    Require(Near(empty.Snapshot(2000000).outputIdleMs, 1000), "First-output waiting is not measured");
    RecorderStreamMetrics dense;
    dense.Start(0);
    for (int i = 0; i < 2048; ++i) {
        dense.Record(1, i, false, 1);
    }
    Require(Near(dense.Snapshot(1000000).recentFps, 1024), "Output sample storage exceeded its bound");
}

void TestTimingRing()
{
    StageTiming timing;
    Require(timing.Snapshot().count == 0, "Empty timing should have no samples");
    for (int i = 1; i <= 300; ++i) {
        timing.Record(i * 1000);
    }
    const auto initial = timing.Snapshot();
    Require(initial.count == 300 && Near(initial.averageMs, 150.5) && Near(initial.p95Ms, 288) &&
        Near(initial.maximumMs, 300), "Timing average or recent P95 is wrong");
    for (int i = 0; i < 256; ++i) {
        timing.Record(1000);
    }
    const auto wrapped = timing.Snapshot();
    Require(wrapped.count == 556 && Near(wrapped.p95Ms, 1) && Near(wrapped.maximumMs, 300),
        "Recent timing ring must wrap without losing all-session maximum");
    StageTiming clamped;
    clamped.Record(-1000);
    Require(clamped.Snapshot().maximumMs == 0, "Negative elapsed times must be clamped");
}
}

int main()
{
    RecorderAudioStats audio;
    audio.Reset(48000, 2);
    audio.Capture(192000, 19200);
    auto pcm = audio.Snapshot();
    Require(pcm.capturedFrames == 48000 && Near(pcm.pendingPcmMs, 100), "PCM sample frames or queue duration wrong");
    Require(audio.Output(0, 100), "First AAC output was not recognized");
    Require(!audio.Output(20000, 100), "Repeated AAC output counted as first output");
    audio.Video(true, 0);
    audio.Video(true, 40000);
    audio.Video(false, 10000);
    audio.Write(true, 2000, false);
    audio.Write(false, 1000, true);
    audio.Stop();
    const auto ended = audio.Snapshot();
    audio.Capture(192000, 0);
    Require(ended.firstPtsUs == 0 && ended.lastPtsUs == 20000 && ended.primaryLastPtsUs == 40000 &&
        ended.secondaryFirstPtsUs == 10000 && ended.primaryWriteFailures == 1 &&
        ended.secondaryWriteFailures == 0, "Audio PTS or muxer accounting wrong");
    Require(audio.Snapshot().capturedFrames == ended.capturedFrames, "Capture changed frozen diagnostics");
    audio.Reset(0, 0);
    audio.Capture(10, 10);
    Require(audio.Snapshot().capturedFrames == 0, "Invalid sample configuration must not divide by zero");
    TestWindowAndTargets();
    TestKeyFramesAndFreeze();
    TestEmptyAndBoundedSamples();
    TestTimingRing();
    std::cout << "Recorder diagnostics: windows, requests, freeze, PTS and bounded timing passed\n";
    return EXIT_SUCCESS;
}
