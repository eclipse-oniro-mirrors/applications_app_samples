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

#ifndef AVCODEC_SAMPLE_SESSION_REPORT_H
#define AVCODEC_SAMPLE_SESSION_REPORT_H

#include <atomic>
#include <chrono>
#include <deque>
#include <mutex>
#include <sstream>
#include <string>
#include <vector>
#include "sample_config.h"

struct SessionTimelineEvent {
    int64_t elapsedMs = 0;
    std::string stage;
    std::string result;
};

struct SessionReportInfo {
    std::string id;
    std::string requested;
    std::string observed;
    std::string changes;
    std::vector<SessionTimelineEvent> timeline;
    std::string endReason;
};

inline std::string CreateCodecSessionId(const char *kind)
{
    static std::atomic<uint64_t> sequence {0};
    const auto time = std::chrono::duration_cast<std::chrono::microseconds>(
        std::chrono::system_clock::now().time_since_epoch()).count();
    return std::string(kind) + "_" + std::to_string(time) + "_" + std::to_string(++sequence);
}

inline std::string DescribeCodecRequest(const SampleInfo &info, bool recording)
{
    // 有意不包含 fd、URI、文件名和绝对路径，报告可由用户主动导出分享。
    std::ostringstream text;
    text << "codecName=" << (info.codec.codecName.empty() ? "auto" : info.codec.codecName)
        << "; codecType=" << info.codec.codecType << "; runMode=" << info.codec.codecRunMode
        << "; sync=" << info.codec.codecSyncMode << "; dump=" << info.output.enableVideoDump
        << "; dumpMaxMiB=" << info.output.dumpMaxMiB << "; dumpMaxSeconds=" << info.output.dumpMaxSeconds;
    if (recording) {
        text << "; mime=" << info.video.videoCodecMime << "; input=" << info.video.videoWidth
            << "x" << info.video.videoHeight << "; fps=" << info.video.frameRate
            << "; bitrate=" << info.video.bitrate << "; bitrateMode=" << info.video.bitrateMode
            << "; iFrameInterval=" << info.video.iFrameInterval << "; hdr=" << info.video.isHDRVivid
            << "; pixelFormat=" << info.video.pixelFormat << "; preprocess=" << info.video.preprocMode
            << "; crop=" << info.video.cropLeft << "," << info.video.cropTop << ","
            << info.video.cropRight << "," << info.video.cropBottom
            << "; downsampling=" << info.video.downsamplingWidth << "x" << info.video.downsamplingHeight
            << "; dropToFps=" << info.video.dropToFrameRate << "; dualOutput=" << info.output.enableDualOutput
            << "; secondary=" << info.output.secondaryVideoWidth << "x" << info.output.secondaryVideoHeight
            << "; container=" << info.output.outputFormat << "; audio=" << info.audio.audioSampleRate
            << "Hz/" << info.audio.audioChannelCount << "ch/" << info.audio.audioBitRate << "bps";
    } else {
        text << "; retainLastFrame=" << info.codec.retainLastFrame
            << "; lowLatency=" << info.codec.enableLowLatency
            << "; decodingOrder=" << info.codec.outputInDecodingOrder
            << "; hdrToBt709=" << info.codec.convertHdrVividToBt709
            << "; audioLowLatency=" << info.audioPlayback.enableLowLatency
            << "; volume=" << info.audioPlayback.volume << "; audioTrack=" << info.codec.audioTrackIndex;
    }
    return text.str();
}

class SessionReport {
public:
    void Begin(const std::string &id, const std::string &requested)
    {
        std::lock_guard<std::mutex> lock(mutex_);
        info_ = {};
        info_.id = id;
        info_.requested = requested;
        info_.observed = "not configured";
        changes_.clear();
        started_ = std::chrono::steady_clock::now();
    }

    // 只记录阶段转换，不记录逐帧事件。去重使首帧和重复停止请求不会挤占历史。
    void Event(const std::string &stage, const std::string &result = "ok")
    {
        std::lock_guard<std::mutex> lock(mutex_);
        for (const auto &event : info_.timeline) {
            if (event.stage == stage) {
                return;
            }
        }
        if (info_.timeline.size() >= MAX_CHANGES) {
            return;
        }
        const auto ms = std::chrono::duration_cast<std::chrono::milliseconds>(
            std::chrono::steady_clock::now() - started_).count();
        info_.timeline.push_back({ms, stage, result});
    }

    void End(const std::string &reason)
    {
        std::lock_guard<std::mutex> lock(mutex_);
        // 正常停止不能覆盖更早发生的错误或排空超时。
        if (info_.endReason.empty() || info_.endReason == "user_stop") {
            info_.endReason = reason;
        }
    }

    void Observe(const std::string &observed)
    {
        std::lock_guard<std::mutex> lock(mutex_);
        info_.observed = observed;
    }

    void Change(const std::string &change)
    {
        std::lock_guard<std::mutex> lock(mutex_);
        const auto ms = std::chrono::duration_cast<std::chrono::milliseconds>(
            std::chrono::steady_clock::now() - started_).count();
        changes_.push_back("+" + std::to_string(ms) + " ms " + change);
        if (changes_.size() > MAX_CHANGES) {
            changes_.pop_front();
        }
    }

    SessionReportInfo Snapshot() const
    {
        std::lock_guard<std::mutex> lock(mutex_);
        auto copy = info_;
        for (const auto &change : changes_) {
            copy.changes += change + "\n";
        }
        return copy;
    }

private:
    static constexpr size_t MAX_CHANGES = 128;
    mutable std::mutex mutex_;
    SessionReportInfo info_;
    std::deque<std::string> changes_;
    std::chrono::steady_clock::time_point started_ {};
};

#endif
