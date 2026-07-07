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

#ifndef ROI_QUEUE_H
#define ROI_QUEUE_H

#include <mutex>
#include <condition_variable>
#include <chrono>
#include <map>
#include <string>
#include <cstdint>

// Synchronized queue for ROI data keyed by PTS, used by Path 2 (parameter callback).
// Ensures each encoder parameter callback gets the correct ROI string for the frame it's encoding.
class RoiQueue {
public:
    static constexpr uint32_t DEFAULT_TIMEOUT_MS = 3;
    static constexpr uint32_t CLEANUP_THRESHOLD_MS = 2000;

    // Push an ROI entry with its frame PTS. Notifies waiting Pop calls.
    void Push(int64_t pts, const std::string &roiStr);

    // Pop the oldest ROI entry (lowest PTS). Waits up to timeoutMs if queue is empty.
    // Returns empty string if queue remains empty after timeout or queue is stopped.
    std::string Pop(uint32_t timeoutMs = DEFAULT_TIMEOUT_MS);

    // Clear all entries in the queue.
    void Clear();

    // Stop the queue. Notifies all waiting threads to exit.
    void Stop();

    ~RoiQueue();

private:
    struct Entry {
        std::string roiStr;
        std::chrono::steady_clock::time_point pushTime;
    };

    // Remove entries older than CLEANUP_THRESHOLD_MS to prevent unbounded growth.
    // Must be called under mutex_ lock.
    void CleanupStale();

    std::mutex mutex_;
    std::condition_variable cv_;
    std::map<int64_t, Entry> entries_;
    bool isStopped_ = false;
};

#endif // ROI_QUEUE_H
