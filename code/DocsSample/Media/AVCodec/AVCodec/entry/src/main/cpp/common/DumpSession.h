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

#ifndef AVCODEC_SAMPLE_DUMP_SESSION_H
#define AVCODEC_SAMPLE_DUMP_SESSION_H

#include <chrono>
#include <cstdint>
#include <cstdio>
#include <fstream>
#include <string>
#include <sys/statvfs.h>

// 每个输出线程独占一个实例。只记录 Dump，不拥有 codec Buffer，也不改变播放/录制状态。
class DumpSession {
public:
    const std::string &State() const { return state_; }

    void Open(const std::string &path, const std::string &configuration)
    {
        path_ = path;
        configuration_ = configuration;
        bytes_ = 0;
        ptsUs_ = -1;
        available_ = 0;
        checked_ = false;
        state_ = "writing";
        startedAt_ = Clock::now();
        lastSavedAt_ = {};
        Save();
    }

    bool CanWrite(uint64_t nextBytes)
    {
        if (state_ != "writing") {
            return false;
        }
        const auto now = Clock::now();
        if (!checked_ || now - checkedAt_ >= std::chrono::milliseconds(250) ||
            nextBytes > available_ || available_ - nextBytes < RESERVED_BYTES) {
            struct statvfs space {};
            if (statvfs(path_.c_str(), &space) != 0) {
                Stop("space_query_failed");
                return false;
            }
            available_ = static_cast<uint64_t>(space.f_bavail) * space.f_frsize;
            checkedAt_ = now;
            checked_ = true;
        }
        if (available_ < RESERVED_BYTES || nextBytes > available_ - RESERVED_BYTES) {
            Stop("low_space");
            return false;
        }
        available_ -= nextBytes;
        return true;
    }

    void Written(uint64_t bytes, int64_t ptsUs)
    {
        bytes_ += bytes;
        ptsUs_ = ptsUs;
        if (Clock::now() - lastSavedAt_ >= std::chrono::seconds(1)) {
            Save();
        }
    }

    void Stop(const std::string &reason)
    {
        if (!path_.empty() && state_ == "writing") {
            state_ = reason;
            Save();
        }
    }

private:
    using Clock = std::chrono::steady_clock;
    static constexpr uint64_t RESERVED_BYTES = 128ULL * 1024 * 1024;

    void Save()
    {
        // 先写临时文件再替换，文件列表不会读到截断了一半的状态文本。
        const std::string metadata = path_ + ".session.txt";
        const std::string temporary = metadata + ".pending";
        std::ofstream text(temporary, std::ios::trunc);
        text << "state=" << state_ << "\nbytes=" << bytes_ << "\nlastPtsUs=" << ptsUs_
            << "\nelapsedMs=" << std::chrono::duration_cast<std::chrono::milliseconds>(Clock::now() - startedAt_).count()
            << "\nreservedMiB=128\n" << configuration_ << "\n";
        text.close();
        if (!text.fail()) {
            (void)std::rename(temporary.c_str(), metadata.c_str());
        }
        lastSavedAt_ = Clock::now();
    }

    std::string path_;
    std::string configuration_;
    std::string state_;
    uint64_t bytes_ = 0;
    uint64_t available_ = 0;
    int64_t ptsUs_ = -1;
    bool checked_ = false;
    Clock::time_point startedAt_ {};
    Clock::time_point checkedAt_ {};
    Clock::time_point lastSavedAt_ {};
};

#endif
