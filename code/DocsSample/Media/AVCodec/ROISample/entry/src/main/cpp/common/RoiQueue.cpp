/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "RoiQueue.h"

void RoiQueue::Push(int64_t pts, const std::string &roiStr)
{
    std::lock_guard<std::mutex> lock(mutex_);
    if (isStopped_) {
        return;
    }
    entries_.emplace(pts, Entry{roiStr, std::chrono::steady_clock::now()});
    cv_.notify_one();
}

std::string RoiQueue::Pop(uint32_t timeoutMs)
{
    std::unique_lock<std::mutex> lock(mutex_);
    cv_.wait_for(lock, std::chrono::milliseconds(timeoutMs),
                 [this]() { return !entries_.empty() || isStopped_; });
    CleanupStale();
    if (entries_.empty()) {
        return "";
    }
    auto it = entries_.begin();
    std::string str = it->second.roiStr;
    entries_.erase(it);
    return str;
}

void RoiQueue::Clear()
{
    std::lock_guard<std::mutex> lock(mutex_);
    entries_.clear();
}

void RoiQueue::Stop()
{
    std::lock_guard<std::mutex> lock(mutex_);
    isStopped_ = true;
    cv_.notify_all();
}

RoiQueue::~RoiQueue()
{
    Stop();
}

void RoiQueue::CleanupStale()
{
    auto now = std::chrono::steady_clock::now();
    auto threshold = std::chrono::milliseconds(CLEANUP_THRESHOLD_MS);
    for (auto it = entries_.begin(); it != entries_.end();) {
        if (now - it->second.pushTime > threshold) {
            it = entries_.erase(it);
        } else {
            ++it;
        }
    }
}
