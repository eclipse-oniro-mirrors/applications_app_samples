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

void TestTailWorkers(TailAction action, bool synchronous)
{
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
    Require(state.BeginInitialization() && state.MarkReady() && state.BeginPlayback(), "Start playback state");
    const auto origin = VideoFramePacer::Clock::now();
    Require(pacer.Deadline(FIRST_TAIL_PTS_US, 1.0, origin) == origin, "Anchor the tail frame clock");
    const PipelineWorkers::Worker audioInput = [&]() { inputEos.fetch_add(1); };
    const PipelineWorkers::Worker audioOutput = [&]() {
        std::unique_lock<std::mutex> lock(mutex);
        atTail = true;
        changed.notify_all();
        Require(changed.wait_for(lock, WAIT_LIMIT, [&]() { return proceed; }), "Audio worker must be released");
        if (state.GetState() != PLAYER_STATE_STOPPING) {
            outputEos.fetch_add(1);
        }
    };
    const PipelineWorkers::Worker unusedMode = [&]() { wrongMode.fetch_add(1); };
    const PipelineWorkers::Worker inputWorker = [&]() {
        std::unique_lock<std::mutex> lock(mutex);
        Require(changed.wait_for(lock, WAIT_LIMIT, [&]() { return proceed; }), "Video input must be released");
    };
    const PipelineWorkers::Worker outputWorker = [&]() {
        std::unique_lock<std::mutex> lock(mutex);
        Require(changed.wait_for(lock, WAIT_LIMIT, [&]() { return proceed; }), "Video output must be released");
        if (state.GetState() != PLAYER_STATE_STOPPING) {
            remainingVideo.fetch_add(1);
        }
    };
    const auto stopOnFailure = [&]() {
        state.BeginStop();
        std::lock_guard<std::mutex> lock(mutex);
        proceed = true;
        changed.notify_all();
    };
    Require(audio.Start({synchronous, synchronous ? audioInput : unusedMode,
        synchronous ? audioOutput : unusedMode, synchronous ? unusedMode : audioInput,
        synchronous ? unusedMode : audioOutput, stopOnFailure}), "Start audio workers");
    Require(video.Start({synchronous, synchronous ? inputWorker : unusedMode,
        synchronous ? outputWorker : unusedMode, synchronous ? unusedMode : inputWorker,
        synchronous ? unusedMode : outputWorker, stopOnFailure}), "Start video workers");
    {
        std::unique_lock<std::mutex> lock(mutex);
        Require(changed.wait_for(lock, WAIT_LIMIT, [&]() { return atTail; }), "Reach the audio tail barrier");
        if (action == TailAction::PAUSE) {
            Require(state.BeginPause(), "Pause at the tail");
            Require(!state.BeginPause() && remainingVideo == 0 && outputEos == 0, "Pause does not finish workers");
            Require(state.BeginResume(), "Resume the tail");
        } else if (action == TailAction::SEEK || action == TailAction::TRACK_SWITCH) {
            Require(state.BeginSeek() && !state.BeginSeek(), "Serialize seek and track rebuild transitions");
            Require(state.CompleteSeek(), "Complete the rebuild before resuming");
        } else if (action == TailAction::STOP) {
            Require(state.BeginStop() && state.BeginStop() && !state.BeginSeek(), "Stop supersedes seek");
        }
        if (action != TailAction::COMPLETE) {
            pacer.SetRevision(1);
            const auto resumed = origin + WAIT_LIMIT;
            Require(pacer.Deadline(FIRST_TAIL_PTS_US, 1.0, resumed) == resumed, "Reset timing after interruption");
            Require(pacer.Deadline(FIRST_TAIL_PTS_US + TAIL_STEP_US, 1.0, resumed) == resumed + FRAME_INTERVAL,
                "Tail timing does not include the interruption");
        }
        proceed = true;
        changed.notify_all();
    }
    audio.Join();
    video.Join();
    Require(!audio.HasThreads() && !video.HasThreads(), "All pipeline workers must exit");
    Require(inputEos == 1 && wrongMode == 0, "Dispatch each input worker once in the selected mode");
    const int expected = action == TailAction::STOP ? 0 : 1;
    Require(outputEos == expected && remainingVideo == expected, "Each active tail worker finishes once");
    Require(state.BeginStop() && state.CompleteStop() && !state.CompleteStop(), "Complete stop exactly once");
    const auto replayInput = [&]() { inputEos.fetch_add(1); };
    Require(state.BeginInitialization() && state.MarkReady() && state.BeginPlayback(), "Replay starts a new state");
    Require(audio.Start({true, replayInput, replayInput, {}, {}, stopOnFailure}), "Restart released pipeline");
    audio.Join();
    Require(!audio.HasThreads(), "Replay workers also exit");
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
