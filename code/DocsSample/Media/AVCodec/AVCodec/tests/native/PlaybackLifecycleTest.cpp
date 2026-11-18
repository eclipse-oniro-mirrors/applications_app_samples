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

#include <atomic>
#include <chrono>
#include <condition_variable>
#include <cstdlib>
#include <iostream>
#include <mutex>
#include "sample/player/output/pipeline/AudioPipeline.h"
#include "sample/player/sync/PlayerStateMachine.h"
#include "sample/player/sync/VideoFramePacer.h"

namespace {
constexpr auto WAIT_LIMIT = std::chrono::seconds(5);
constexpr auto FRAME_INTERVAL = std::chrono::milliseconds(40);
constexpr int64_t FIRST_TAIL_PTS_US = 68'160'000;
constexpr int64_t TAIL_STEP_US = 40'000;
constexpr int REPEAT_COUNT = 20;
enum class TailAction { COMPLETE, PAUSE, SEEK, TRACK_SWITCH, STOP };

void Require(bool condition, const char *message)
{
    if (!condition) {
        std::cerr << message << std::endl;
        std::exit(EXIT_FAILURE);
    }
}

struct TailPlaybackContext {
    PlayerStateMachine state;
    VideoFramePacer pacer;
    AudioPipeline audio;
    VideoPipeline video;
    std::mutex mutex;
    std::condition_variable changed;
    bool atTail = false;
    bool proceed = false;
    std::atomic<int> inputEos {0};
    std::atomic<int> outputEos {0};
    std::atomic<int> remainingVideo {0};
    std::atomic<int> wrongMode {0};
};

PipelineWorkers::Worker CreateStopHandler(TailPlaybackContext &context)
{
    return [&context]() {
        context.state.BeginStop();
        std::lock_guard<std::mutex> lock(context.mutex);
        context.proceed = true;
        context.changed.notify_all();
    };
}

void StartTailWorkers(TailPlaybackContext &context, bool synchronous)
{
    const PipelineWorkers::Worker audioInput = [&context]() { context.inputEos.fetch_add(1); };
    const PipelineWorkers::Worker audioOutput = [&context]() {
        std::unique_lock<std::mutex> lock(context.mutex);
        context.atTail = true;
        context.changed.notify_all();
        Require(context.changed.wait_for(lock, WAIT_LIMIT, [&context]() { return context.proceed; }),
            "Audio worker must be released");
        if (context.state.GetState() != PLAYER_STATE_STOPPING) {
            context.outputEos.fetch_add(1);
        }
    };
    const PipelineWorkers::Worker unusedMode = [&context]() { context.wrongMode.fetch_add(1); };
    const PipelineWorkers::Worker inputWorker = [&context]() {
        std::unique_lock<std::mutex> lock(context.mutex);
        Require(context.changed.wait_for(lock, WAIT_LIMIT, [&context]() { return context.proceed; }),
            "Video input must be released");
    };
    const PipelineWorkers::Worker outputWorker = [&context]() {
        std::unique_lock<std::mutex> lock(context.mutex);
        Require(context.changed.wait_for(lock, WAIT_LIMIT, [&context]() { return context.proceed; }),
            "Video output must be released");
        if (context.state.GetState() != PLAYER_STATE_STOPPING) {
            context.remainingVideo.fetch_add(1);
        }
    };
    const auto stopOnFailure = CreateStopHandler(context);
    Require(context.audio.Start({synchronous, synchronous ? audioInput : unusedMode,
        synchronous ? audioOutput : unusedMode, synchronous ? unusedMode : audioInput,
        synchronous ? unusedMode : audioOutput, stopOnFailure}), "Start audio workers");
    Require(context.video.Start({synchronous, synchronous ? inputWorker : unusedMode,
        synchronous ? outputWorker : unusedMode, synchronous ? unusedMode : inputWorker,
        synchronous ? unusedMode : outputWorker, stopOnFailure}), "Start video workers");
}

void ApplyTailAction(TailPlaybackContext &context, TailAction action)
{
    auto &state = context.state;
    if (action == TailAction::PAUSE) {
        Require(state.BeginPause(), "Pause at the tail");
        Require(!state.BeginPause() && context.remainingVideo == 0 && context.outputEos == 0,
            "Pause does not finish workers");
        Require(state.BeginResume(), "Resume the tail");
    } else if (action == TailAction::SEEK || action == TailAction::TRACK_SWITCH) {
        Require(state.BeginSeek() && !state.BeginSeek(), "Serialize seek and track rebuild transitions");
        Require(state.CompleteSeek(), "Complete the rebuild before resuming");
    } else if (action == TailAction::STOP) {
        Require(state.BeginStop() && state.BeginStop() && !state.BeginSeek(), "Stop supersedes seek");
    }
}

void ReleaseTailWorkers(TailPlaybackContext &context, TailAction action, VideoFramePacer::Clock::time_point origin)
{
    std::unique_lock<std::mutex> lock(context.mutex);
    Require(context.changed.wait_for(lock, WAIT_LIMIT, [&context]() { return context.atTail; }),
        "Reach the audio tail barrier");
    ApplyTailAction(context, action);
    if (action != TailAction::COMPLETE) {
        context.pacer.SetRevision(1);
        const auto resumed = origin + WAIT_LIMIT;
        Require(context.pacer.Deadline(FIRST_TAIL_PTS_US, 1.0, resumed) == resumed, "Reset timing after interruption");
        Require(context.pacer.Deadline(FIRST_TAIL_PTS_US + TAIL_STEP_US, 1.0, resumed) == resumed + FRAME_INTERVAL,
            "Tail timing does not include the interruption");
    }
    context.proceed = true;
    context.changed.notify_all();
}

void VerifyTailWorkers(TailPlaybackContext &context, TailAction action)
{
    context.audio.Join();
    context.video.Join();
    Require(!context.audio.HasThreads() && !context.video.HasThreads(), "All pipeline workers must exit");
    Require(context.inputEos == 1 && context.wrongMode == 0, "Dispatch each input worker once in the selected mode");
    const int expected = action == TailAction::STOP ? 0 : 1;
    Require(context.outputEos == expected && context.remainingVideo == expected,
        "Each active tail worker finishes once");
}

void TestReplay(TailPlaybackContext &context)
{
    auto &state = context.state;
    Require(state.BeginStop() && state.CompleteStop() && !state.CompleteStop(), "Complete stop exactly once");
    const auto replayInput = [&context]() { context.inputEos.fetch_add(1); };
    Require(state.BeginInitialization() && state.MarkReady() && state.BeginPlayback(), "Replay starts a new state");
    Require(context.audio.Start({true, replayInput, replayInput, {}, {}, CreateStopHandler(context)}),
        "Restart released pipeline");
    context.audio.Join();
    Require(!context.audio.HasThreads(), "Replay workers also exit");
}

void TestTailWorkers(TailAction action, bool synchronous)
{
    TailPlaybackContext context;
    Require(context.state.BeginInitialization() && context.state.MarkReady() && context.state.BeginPlayback(),
        "Start playback state");
    const auto origin = VideoFramePacer::Clock::now();
    Require(context.pacer.Deadline(FIRST_TAIL_PTS_US, 1.0, origin) == origin, "Anchor the tail frame clock");
    StartTailWorkers(context, synchronous);
    ReleaseTailWorkers(context, action, origin);
    VerifyTailWorkers(context, action);
    TestReplay(context);
}
} // namespace

int main()
{
    for (int iteration = 0; iteration < REPEAT_COUNT; ++iteration) {
        for (bool synchronous : {false, true}) {
            for (auto action : {TailAction::COMPLETE, TailAction::PAUSE, TailAction::SEEK,
                TailAction::TRACK_SWITCH, TailAction::STOP}) {
                TestTailWorkers(action, synchronous);
            }
        }
    }
    std::cout << "Playback lifecycle: tail pause/rebuild/stop, worker joins and immediate replay passed" << std::endl;
}
