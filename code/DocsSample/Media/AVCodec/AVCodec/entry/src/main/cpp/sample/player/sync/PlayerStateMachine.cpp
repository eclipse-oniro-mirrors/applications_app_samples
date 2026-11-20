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

#include "PlayerStateMachine.h"

PlayerState PlayerStateMachine::GetState() const
{
    return state_.load();
}

bool PlayerStateMachine::Transition(PlayerState expected, PlayerState target)
{
    return state_.compare_exchange_strong(expected, target);
}

bool PlayerStateMachine::BeginInitialization()
{
    return Transition(PLAYER_STATE_IDLE, PLAYER_STATE_INITIALIZING);
}

bool PlayerStateMachine::AbortInitialization()
{
    return Transition(PLAYER_STATE_INITIALIZING, PLAYER_STATE_IDLE);
}

bool PlayerStateMachine::MarkReady()
{
    return Transition(PLAYER_STATE_INITIALIZING, PLAYER_STATE_READY);
}

bool PlayerStateMachine::BeginPlayback()
{
    return Transition(PLAYER_STATE_READY, PLAYER_STATE_PLAYING);
}

bool PlayerStateMachine::BeginSeek()
{
    PlayerState current = state_.load();
    while (current == PLAYER_STATE_PLAYING || current == PLAYER_STATE_PAUSED) {
        if (state_.compare_exchange_weak(current, PLAYER_STATE_SEEKING)) {
            return true;
        }
    }
    return false;
}

bool PlayerStateMachine::CompleteSeek()
{
    return Transition(PLAYER_STATE_SEEKING, PLAYER_STATE_PLAYING);
}

bool PlayerStateMachine::BeginPause()
{
    return Transition(PLAYER_STATE_PLAYING, PLAYER_STATE_PAUSED);
}

bool PlayerStateMachine::BeginResume()
{
    return Transition(PLAYER_STATE_PAUSED, PLAYER_STATE_PLAYING);
}

bool PlayerStateMachine::BeginStop()
{
    PlayerState current = state_.load();
    while (current != PLAYER_STATE_STOPPING) {
        switch (current) {
            case PLAYER_STATE_INITIALIZING:
            case PLAYER_STATE_READY:
            case PLAYER_STATE_PLAYING:
            case PLAYER_STATE_SEEKING:
            case PLAYER_STATE_PAUSED:
                if (state_.compare_exchange_weak(current, PLAYER_STATE_STOPPING)) {
                    return true;
                }
                break;
            case PLAYER_STATE_IDLE:
            case PLAYER_STATE_STOPPING:
                return current == PLAYER_STATE_STOPPING;
        }
    }
    return true;
}

bool PlayerStateMachine::CompleteStop()
{
    return Transition(PLAYER_STATE_STOPPING, PLAYER_STATE_IDLE);
}
