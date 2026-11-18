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
#include <memory>
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

struct TailWorkerState {
    PlayerStateMachine state;
    std::mutex mutex;
    std::condition_variable changed;
    bool atTail = false;
    bool proceed = false;
    std::atomic<int> inputEos {0};
    std::atomic<int> outputEos {0};
    std::atomic<int> remainingVideo {0};
    std::atomic<int> wrongMode {0};
};

struct TailPlaybackContext {
    // 回调只持有共享状态，外层保存线程对象并在测试结束前Join。
    std::shared_ptr<TailWorkerState> workers = std::make_shared<TailWorkerState>();
    VideoFramePacer pacer;
    AudioPipeline audio;
    VideoPipeline video;
};

void StopTailWorkers(TailWorkerState &workers)
{
    workers.state.BeginStop();
    std::lock_guard<std::mutex> lock(workers.mutex);
    workers.proceed = true;
    workers.changed.notify_all();
}

void StartTailWorkers(TailPlaybackContext &context, bool synchronous)
{
    const std::shared_ptr<TailWorkerState> workers = context.workers;
    const PipelineWorkers::Worker audioInput = [workers]() { workers->inputEos.fetch_add(1); };
    const PipelineWorkers::Worker audioOutput = [workers]() {
        std::unique_lock<std::mutex> lock(workers->mutex);
        workers->atTail = true;
        workers->changed.notify_all();
        Require(workers->changed.wait_for(lock, WAIT_LIMIT, [workers]() { return workers->proceed; }),
            "Audio worker must be released");
        if (workers->state.GetState() != PLAYER_STATE_STOPPING) {
            workers->outputEos.fetch_add(1);
        }
    };
    const PipelineWorkers::Worker unusedMode = [workers]() { workers->wrongMode.fetch_add(1); };
    const PipelineWorkers::Worker inputWorker = [workers]() {
        std::unique_lock<std::mutex> lock(workers->mutex);
        Require(workers->changed.wait_for(lock, WAIT_LIMIT, [workers]() { return workers->proceed; }),
            "Video input must be released");
    };
    const PipelineWorkers::Worker outputWorker = [workers]() {
        std::unique_lock<std::mutex> lock(workers->mutex);
        Require(workers->changed.wait_for(lock, WAIT_LIMIT, [workers]() { return workers->proceed; }),
            "Video output must be released");
        if (workers->state.GetState() != PLAYER_STATE_STOPPING) {
            workers->remainingVideo.fetch_add(1);
        }
    };
    const auto stopOnFailure = [workers]() { StopTailWorkers(*workers); };
    Require(context.audio.Start({synchronous, synchronous ? audioInput : unusedMode,
        synchronous ? audioOutput : unusedMode, synchronous ? unusedMode : audioInput,
        synchronous ? unusedMode : audioOutput, stopOnFailure}), "Start audio workers");
    Require(context.video.Start({synchronous, synchronous ? inputWorker : unusedMode,
        synchronous ? outputWorker : unusedMode, synchronous ? unusedMode : inputWorker,
        synchronous ? unusedMode : outputWorker, stopOnFailure}), "Start video workers");
}

void ApplyTailAction(TailPlaybackContext &context, TailAction action)
{
    auto &state = context.workers->state;
    if (action == TailAction::PAUSE) {
        Require(state.BeginPause(), "Pause at the tail");
        Require(!state.BeginPause() && context.workers->remainingVideo == 0 && context.workers->outputEos == 0,
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
    const std::shared_ptr<TailWorkerState> workers = context.workers;
    std::unique_lock<std::mutex> lock(workers->mutex);
    Require(workers->changed.wait_for(lock, WAIT_LIMIT, [workers]() { return workers->atTail; }),
        "Reach the audio tail barrier");
    ApplyTailAction(context, action);
    if (action != TailAction::COMPLETE) {
        context.pacer.SetRevision(1);
        const auto resumed = origin + WAIT_LIMIT;
        Require(context.pacer.Deadline(FIRST_TAIL_PTS_US, 1.0, resumed) == resumed, "Reset timing after interruption");
        Require(context.pacer.Deadline(FIRST_TAIL_PTS_US + TAIL_STEP_US, 1.0, resumed) == resumed + FRAME_INTERVAL,
            "Tail timing does not include the interruption");
    }
    workers->proceed = true;
    workers->changed.notify_all();
}

void VerifyTailWorkers(TailPlaybackContext &context, TailAction action)
{
    context.audio.Join();
    context.video.Join();
    Require(!context.audio.HasThreads() && !context.video.HasThreads(), "All pipeline workers must exit");
    Require(context.workers->inputEos == 1 && context.workers->wrongMode == 0,
        "Dispatch each input worker once in the selected mode");
    const int expected = action == TailAction::STOP ? 0 : 1;
    Require(context.workers->outputEos == expected && context.workers->remainingVideo == expected,
        "Each active tail worker finishes once");
    Require(context.workers.use_count() == 1, "Joined workers release captured state ownership");
}

void TestReplay(TailPlaybackContext &context)
{
    const std::shared_ptr<TailWorkerState> workers = context.workers;
    auto &state = workers->state;
    Require(state.BeginStop() && state.CompleteStop() && !state.CompleteStop(), "Complete stop exactly once");
    const auto replayInput = [workers]() { workers->inputEos.fetch_add(1); };
    const auto stopOnFailure = [workers]() { StopTailWorkers(*workers); };
    Require(state.BeginInitialization() && state.MarkReady() && state.BeginPlayback(), "Replay starts a new state");
    Require(context.audio.Start({true, replayInput, replayInput, {}, {}, stopOnFailure}), "Restart released pipeline");
    context.audio.Join();
    Require(!context.audio.HasThreads(), "Replay workers also exit");
}

void TestTailWorkers(TailAction action, bool synchronous)
{
    TailPlaybackContext context;
    auto &state = context.workers->state;
    Require(state.BeginInitialization() && state.MarkReady() && state.BeginPlayback(), "Start playback state");
    const auto origin = VideoFramePacer::Clock::now();
    Require(context.pacer.Deadline(FIRST_TAIL_PTS_US, 1.0, origin) == origin, "Anchor the tail frame clock");
    StartTailWorkers(context, synchronous);
    ReleaseTailWorkers(context, action, origin);
    VerifyTailWorkers(context, action);
    TestReplay(context);
    Require(context.workers.use_count() == 1, "Replay callbacks release captured state ownership");
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
