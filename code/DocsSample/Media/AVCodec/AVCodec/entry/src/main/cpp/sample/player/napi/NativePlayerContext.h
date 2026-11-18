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

#ifndef AVCODEC_SAMPLE_NATIVE_PLAYER_CONTEXT_H
#define AVCODEC_SAMPLE_NATIVE_PLAYER_CONTEXT_H

#include <atomic>
#include <memory>
#include <mutex>
#include "Player.h"
#include "napi/native_api.h"

struct NativePlayerSession {
    Player player;
    // NAPI的JS线程与跳转工作线程共享该标记。重建codec期间，
    // 它阻止其他控制操作继续访问Player。
    std::atomic<bool> seeking { false };
    enum class Operation { NONE, START, SEEK, TRACK };
    bool Begin(Operation operation)
    {
        std::lock_guard<std::mutex> lock(commandMutex);
        if (operation_ != Operation::NONE) { return false; }
        stopPending_ = false;
        operation_ = operation;
        seeking = true;
        return true;
    }
    bool StopPending()
    {
        std::lock_guard<std::mutex> lock(commandMutex);
        return stopPending_;
    }
    bool RequestStop()
    {
        std::lock_guard<std::mutex> lock(commandMutex);
        if (operation_ == Operation::NONE) { return player.Stop() == 0; }
        stopPending_ = true;
        return true;
    }
    void Finish()
    {
        std::lock_guard<std::mutex> lock(commandMutex);
        if (stopPending_) { (void)player.Stop(); }
        operation_ = Operation::NONE;
        seeking = false;
    }
private:
    std::mutex commandMutex;
    Operation operation_ = Operation::NONE;
    bool stopPending_ = false;
};

struct NativePlayerContext {
    std::shared_ptr<NativePlayerSession> session = std::make_shared<NativePlayerSession>();
};

inline std::shared_ptr<NativePlayerSession> GetNativePlayerSession(napi_env env)
{
    void *data = nullptr;
    if (napi_get_instance_data(env, &data) != napi_ok || data == nullptr) {
        return nullptr;
    }
    return static_cast<NativePlayerContext *>(data)->session;
}

napi_value SeekToAsync(napi_env env, napi_callback_info info);
napi_value SelectAudioTrackAsync(napi_env env, napi_callback_info info);
int32_t StartPlayerPlayback(NativePlayerSession &session, SampleInfo &info,
    void (*callback)(void *, bool, PlaybackCompletionReason), void *data);

#endif // AVCODEC_SAMPLE_NATIVE_PLAYER_CONTEXT_H
