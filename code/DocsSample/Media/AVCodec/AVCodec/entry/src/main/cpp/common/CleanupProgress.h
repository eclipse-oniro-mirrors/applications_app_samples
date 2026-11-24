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

#ifndef AVCODEC_CLEANUP_PROGRESS_H
#define AVCODEC_CLEANUP_PROGRESS_H

#include <chrono>
#include <cstdint>
#include <mutex>
#include <string>

struct CleanupProgressInfo {
    std::string stage = "idle";
    int64_t elapsedMs = 0;
    int64_t totalMs = 0;
    uint64_t revision = 0;
    bool active = false;
};

// 独立锁允许界面在会话锁被收尾占用时查询阶段，不改变资源释放协议。
class CleanupProgress {
public:
    void Reset()
    {
        std::lock_guard<std::mutex> lock(mutex_);
        info_ = {};
        started_ = {};
        stageStarted_ = {};
    }

    void Enter(const char *stage)
    {
        std::lock_guard<std::mutex> lock(mutex_);
        const auto now = Clock::now();
        if (!info_.active) {
            started_ = now;
        }
        info_.stage = stage;
        info_.active = true;
        ++info_.revision;
        stageStarted_ = now;
    }

    void Complete()
    {
        std::lock_guard<std::mutex> lock(mutex_);
        if (!info_.active) {
            return;
        }
        const auto now = Clock::now();
        info_.elapsedMs = Milliseconds(now - stageStarted_);
        info_.totalMs = Milliseconds(now - started_);
        info_.active = false;
    }

    CleanupProgressInfo Snapshot() const
    {
        std::lock_guard<std::mutex> lock(mutex_);
        CleanupProgressInfo result = info_;
        if (result.active) {
            const auto now = Clock::now();
            result.elapsedMs = Milliseconds(now - stageStarted_);
            result.totalMs = Milliseconds(now - started_);
        }
        return result;
    }

private:
    using Clock = std::chrono::steady_clock;

    static int64_t Milliseconds(Clock::duration elapsed)
    {
        return std::chrono::duration_cast<std::chrono::milliseconds>(elapsed).count();
    }

    mutable std::mutex mutex_;
    CleanupProgressInfo info_;
    Clock::time_point started_ {};
    Clock::time_point stageStarted_ {};
};
#endif
