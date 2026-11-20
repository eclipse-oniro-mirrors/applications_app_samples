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

#ifndef AVCODEC_SAMPLE_PLAYER_STATE_MACHINE_H
#define AVCODEC_SAMPLE_PLAYER_STATE_MACHINE_H

#include <atomic>
#include <cstdint>

enum PlayerState : int32_t {
    PLAYER_STATE_IDLE = 0,
    PLAYER_STATE_INITIALIZING,
    PLAYER_STATE_READY,
    PLAYER_STATE_PLAYING,
    PLAYER_STATE_STOPPING,
    PLAYER_STATE_SEEKING,
    PLAYER_STATE_PAUSED = 6,
};

class PlayerStateMachine {
public:
    PlayerState GetState() const;
    bool BeginInitialization();
    bool AbortInitialization();
    bool MarkReady();
    bool BeginPlayback();
    bool BeginSeek();
    bool CompleteSeek();
    bool BeginPause();
    bool BeginResume();
    bool BeginStop();
    bool CompleteStop();

private:
    bool Transition(PlayerState expected, PlayerState target);

    std::atomic<PlayerState> state_ { PLAYER_STATE_IDLE };
};

#endif // AVCODEC_SAMPLE_PLAYER_STATE_MACHINE_H
