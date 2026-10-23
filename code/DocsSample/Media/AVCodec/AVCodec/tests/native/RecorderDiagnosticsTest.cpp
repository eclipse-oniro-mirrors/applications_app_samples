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
constexpr int64_t STEREO_CHANNELS = 2;
constexpr int64_t INVALID_PCM_BYTES = 10;
constexpr int64_t PREPROCESSED_FPS = 15;
constexpr int64_t REDUCED_FPS = 25;
constexpr int64_t INPUT_FPS = 30;
constexpr int64_t KEY_WAIT_MS = 50;
constexpr int64_t PACKET_BYTES = 100;
constexpr int64_t TIMING_CAPACITY = 256;
constexpr int64_t EXPECTED_P95_MS = 288;
constexpr int64_t TIMING_COUNT = 300;
constexpr int64_t WRAPPED_COUNT = 556;
constexpr int64_t MILLISECONDS_PER_SECOND = 1000;
constexpr int64_t DENSE_CAPACITY = 1024;
constexpr int64_t PRIMARY_MUX_US = 2000;
constexpr int64_t DENSE_INPUT_COUNT = 2048;
constexpr int64_t FIRST_OUTPUT_US = 10000;
constexpr int64_t PENDING_PCM_BYTES = 19200;
constexpr int64_t KEY_REQUEST_US = 20000;
constexpr int64_t PENDING_SNAPSHOT_US = 30000;
constexpr int64_t FRAME_INTERVAL_US = 40000;
constexpr int64_t SAMPLE_RATE = 48000;
constexpr int64_t LOW_FRAME_BYTES = 50000;
constexpr int64_t KEY_OUTPUT_US = 70000;
constexpr int64_t REGRESSED_OUTPUT_US = 80000;
constexpr int64_t REJECTED_REQUEST_US = 90000;
constexpr int64_t FINAL_REQUEST_US = 100000;
constexpr int64_t HIGH_FRAME_BYTES = 125000;
constexpr int64_t CAPTURED_PCM_BYTES = 192000;
constexpr int64_t STOP_US = 200000;
constexpr int64_t AFTER_STOP_US = 300000;
constexpr int64_t REGRESSED_PTS_US = 500000;
constexpr int64_t SECOND_US = 1000000;
constexpr int64_t AFTER_SECOND_US = 1000001;
constexpr int64_t TWO_SECONDS_US = 2000000;
constexpr int64_t THREE_SECONDS_US = 3000000;
constexpr int64_t LATE_STOP_US = 9000000;
constexpr int64_t LOW_BITRATE = 10000000;
constexpr int64_t HIGH_BITRATE = 30000000;
constexpr double COMPARISON_TOLERANCE = 0.0001;
constexpr double EXPECTED_AVERAGE_MS = 150.5;
constexpr int64_t LATE_SNAPSHOT_US = 10000000;
constexpr int64_t EXPECTED_KEY_FRAMES = 2;
constexpr int64_t STOPPED_KEY_WAIT_MS = 100;
constexpr int64_t EXPECTED_PENDING_MS = 100;
void Require(bool condition, const char *message)
{
    if (!condition) {
        std::cerr << message << '\n';
        std::exit(EXIT_FAILURE);
    }
}

bool Near(double value, double expected)
{
    return std::abs(value - expected) < COMPARISON_TOLERANCE;
}

void TestWindowAndTargets()
{
    RecorderStreamMetrics metrics;
    metrics.Configure(INPUT_FPS, HIGH_BITRATE);
    constexpr int64_t start = SECOND_US;
    metrics.Start(start);
    for (int i = 1; i <= INPUT_FPS; ++i) {
        metrics.Record(HIGH_FRAME_BYTES, (i - 1) * SECOND_US / INPUT_FPS, i == 1, start + i * SECOND_US / INPUT_FPS);
    }
    const auto high = metrics.Snapshot(start + SECOND_US);
    Require(Near(high.recentFps, INPUT_FPS) && Near(high.recentBitrate, HIGH_BITRATE),
            "One-second output window is wrong");
    metrics.ParameterResult(LOW_BITRATE, false, false, start + AFTER_SECOND_US);
    Require(metrics.Snapshot(start + AFTER_SECOND_US).targetBitrate == HIGH_BITRATE,
            "Rejected target changed accepted bitrate");
    metrics.ParameterResult(LOW_BITRATE, false, true, start + AFTER_SECOND_US);
    for (int i = 1; i <= REDUCED_FPS; ++i) {
        metrics.Record(LOW_FRAME_BYTES, SECOND_US + i * FRAME_INTERVAL_US, false,
                       start + SECOND_US + i * FRAME_INTERVAL_US);
    }
    const auto low = metrics.Snapshot(start + TWO_SECONDS_US);
    Require(Near(low.recentFps, REDUCED_FPS) && Near(low.recentBitrate, LOW_BITRATE),
            "Old bitrate samples leaked into new window");
    Require(low.targetBitrate == LOW_BITRATE && low.parameterAccepted == 1 && low.parameterRejected == 1,
            "Parameter result counters are wrong");
    const auto idle = metrics.Snapshot(start + THREE_SECONDS_US);
    Require(idle.recentFps == 0 && idle.recentBitrate == 0 && Near(idle.outputIdleMs, MILLISECONDS_PER_SECOND),
            "Idle output must age out of the window");
}

void TestKeyFramesAndFreeze()
{
    RecorderStreamMetrics metrics;
    metrics.Configure(PREPROCESSED_FPS, LOW_BITRATE);
    metrics.Start(0);
    metrics.Record(PACKET_BYTES, 0, true, FIRST_OUTPUT_US);
    metrics.ParameterResult(0, true, true, KEY_REQUEST_US);
    Require(metrics.Snapshot(PENDING_SNAPSHOT_US).keyFrameRequest == "pending",
            "Accepted request must wait for output");
    metrics.Record(PACKET_BYTES, SECOND_US, true, KEY_OUTPUT_US);
    const auto observed = metrics.Snapshot(KEY_OUTPUT_US);
    Require(observed.keyFrameRequest == "observed" && observed.keyFrames == EXPECTED_KEY_FRAMES &&
                Near(observed.keyFrameWaitMs, KEY_WAIT_MS) &&
                Near(observed.keyFrameIntervalMs, MILLISECONDS_PER_SECOND),
            "Key-frame observation is wrong");
    Require(Near(observed.expectedFps, PREPROCESSED_FPS), "Preprocessed expected output rate was lost");
    metrics.Record(PACKET_BYTES, REGRESSED_PTS_US, false, REGRESSED_OUTPUT_US);
    metrics.ParameterResult(0, true, false, REJECTED_REQUEST_US);
    Require(metrics.Snapshot(REJECTED_REQUEST_US).keyFrameRequests == 1,
            "Rejected key-frame request counted as accepted");
    metrics.ParameterResult(0, true, true, FINAL_REQUEST_US);
    metrics.Stop(STOP_US);
    const auto stopped = metrics.Snapshot(AFTER_STOP_US);
    Require(stopped.keyFrameRequest == "ended" && Near(stopped.keyFrameWaitMs, STOPPED_KEY_WAIT_MS) &&
                stopped.ptsRegressions == 1,
            "Pending request or PTS regression state was lost");
    metrics.Stop(LATE_STOP_US);
    const auto later = metrics.Snapshot(LATE_SNAPSHOT_US);
    Require(Near(later.outputIdleMs, stopped.outputIdleMs) && Near(later.recentBitrate, stopped.recentBitrate) &&
                Near(later.longestGapMs, stopped.longestGapMs),
            "Release must not advance frozen diagnostics");
}

void TestEmptyAndBoundedSamples()
{
    RecorderStreamMetrics empty;
    Require(empty.Snapshot(0).outputIdleMs == -1, "Unstarted output should be unavailable");
    empty.Start(SECOND_US);
    Require(empty.Snapshot(SECOND_US).recentFps == 0, "Zero-duration snapshot should not divide by zero");
    Require(Near(empty.Snapshot(TWO_SECONDS_US).outputIdleMs, MILLISECONDS_PER_SECOND),
            "First-output waiting is not measured");
    RecorderStreamMetrics dense;
    dense.Start(0);
    for (int i = 0; i < DENSE_INPUT_COUNT; ++i) {
        dense.Record(1, i, false, 1);
    }
    Require(Near(dense.Snapshot(SECOND_US).recentFps, DENSE_CAPACITY), "Output sample storage exceeded its bound");
}

void TestTimingRing()
{
    StageTiming timing;
    Require(timing.Snapshot().count == 0, "Empty timing should have no samples");
    for (int i = 1; i <= TIMING_COUNT; ++i) {
        timing.Record(i * MILLISECONDS_PER_SECOND);
    }
    const auto initial = timing.Snapshot();
    Require(initial.count == TIMING_COUNT && Near(initial.averageMs, EXPECTED_AVERAGE_MS) &&
                Near(initial.p95Ms, EXPECTED_P95_MS) && Near(initial.maximumMs, TIMING_COUNT),
            "Timing average or recent P95 is wrong");
    for (int i = 0; i < TIMING_CAPACITY; ++i) {
        timing.Record(MILLISECONDS_PER_SECOND);
    }
    const auto wrapped = timing.Snapshot();
    Require(wrapped.count == WRAPPED_COUNT && Near(wrapped.p95Ms, 1) && Near(wrapped.maximumMs, TIMING_COUNT),
            "Recent timing ring must wrap without losing all-session maximum");
    StageTiming clamped;
    clamped.Record(-MILLISECONDS_PER_SECOND);
    Require(clamped.Snapshot().maximumMs == 0, "Negative elapsed times must be clamped");
}
} // namespace

int main()
{
    RecorderAudioStats audio;
    audio.Reset(SAMPLE_RATE, STEREO_CHANNELS);
    audio.Capture(CAPTURED_PCM_BYTES, PENDING_PCM_BYTES);
    auto pcm = audio.Snapshot();
    Require(pcm.capturedFrames == SAMPLE_RATE && Near(pcm.pendingPcmMs, EXPECTED_PENDING_MS),
            "PCM sample frames or queue duration wrong");
    Require(audio.Output(0, PACKET_BYTES), "First AAC output was not recognized");
    Require(!audio.Output(KEY_REQUEST_US, PACKET_BYTES), "Repeated AAC output counted as first output");
    audio.Video(true, 0);
    audio.Video(true, FRAME_INTERVAL_US);
    audio.Video(false, FIRST_OUTPUT_US);
    audio.Write(true, PRIMARY_MUX_US, false);
    audio.Write(false, MILLISECONDS_PER_SECOND, true);
    audio.Stop();
    const auto ended = audio.Snapshot();
    audio.Capture(CAPTURED_PCM_BYTES, 0);
    Require(ended.firstPtsUs == 0 && ended.lastPtsUs == KEY_REQUEST_US && ended.primaryLastPtsUs == FRAME_INTERVAL_US &&
                ended.secondaryFirstPtsUs == FIRST_OUTPUT_US && ended.primaryWriteFailures == 1 &&
                ended.secondaryWriteFailures == 0,
            "Audio PTS or muxer accounting wrong");
    Require(audio.Snapshot().capturedFrames == ended.capturedFrames, "Capture changed frozen diagnostics");
    audio.Reset(0, 0);
    audio.Capture(INVALID_PCM_BYTES, INVALID_PCM_BYTES);
    Require(audio.Snapshot().capturedFrames == 0, "Invalid sample configuration must not divide by zero");
    TestWindowAndTargets();
    TestKeyFramesAndFreeze();
    TestEmptyAndBoundedSamples();
    TestTimingRing();
    std::cout << "Recorder diagnostics: windows, requests, freeze, PTS and bounded timing passed\n";
    return EXIT_SUCCESS;
}
