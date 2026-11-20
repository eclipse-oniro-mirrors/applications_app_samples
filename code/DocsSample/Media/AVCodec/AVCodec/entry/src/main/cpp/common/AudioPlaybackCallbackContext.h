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

#ifndef AVCODEC_AUDIO_PLAYBACK_CALLBACK_CONTEXT_H
#define AVCODEC_AUDIO_PLAYBACK_CALLBACK_CONTEXT_H

#include <atomic>
#include <condition_variable>
#include <cstdint>

// Player持有此对象。renderer释放且音频工作线程退出后才能销毁；回调不保存服务提供的Buffer。
struct AudioPlaybackCallbackContext {
    AudioPlaybackCallbackContext(std::atomic<bool> &pausedState, std::atomic<bool> &runningState,
        std::condition_variable &changed, std::atomic<uint64_t> &underrunCount,
        std::atomic<int64_t> &queueDuration, std::atomic<int64_t> &position)
        : paused(pausedState), running(runningState), pauseChanged(changed), underruns(underrunCount),
          queueDurationUs(queueDuration), positionUs(position)
    {
    }

    // 借用Player及其诊断状态，成员在注册回调前全部绑定，此后不重绑。
    std::atomic<bool> &paused;
    std::atomic<bool> &running;
    std::condition_variable &pauseChanged;
    std::atomic<uint64_t> &underruns;
    std::atomic<int64_t> &queueDurationUs;
    std::atomic<int64_t> &positionUs;
    // 音频回调和Player共享的状态由本对象统一持有。
    std::atomic<bool> interrupted { false };
    std::atomic<bool> resumePending { false };
    std::atomic<uint64_t> interruptCount { 0 };
    std::atomic<int32_t> interruptHint { 0 };
    std::atomic<float> volume { 1.0F };
    std::atomic<bool> ducked { false };
};

#endif
