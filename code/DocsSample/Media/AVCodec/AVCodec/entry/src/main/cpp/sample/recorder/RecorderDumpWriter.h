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

#ifndef AVCODEC_RECORDER_DUMP_WRITER_H
#define AVCODEC_RECORDER_DUMP_WRITER_H

#include <chrono>
#include <fstream>
#include <sstream>
#include "sample_info.h"
#include "DumpSession.h"

class RecorderDumpWriter {
public:
    std::string State() const { return enabled_ ? session_.State() : "disabled"; }
    uint64_t Bytes() const { return bytes_; }
    bool IsWriting() const { return file_.is_open(); }

    void Open(const std::string &path, const OutputOptions &options, const VideoSampleInfo &video)
    {
        Close();
        bytes_ = 0;
        started_ = false;
        enabled_ = !path.empty();
        maxBytes_ = static_cast<uint64_t>(options.dumpMaxMiB) * BYTES_PER_MIB;
        maxSeconds_ = options.dumpMaxSeconds;
        if (!path.empty()) {
            file_.clear();
            file_.open(path, std::ios::binary | std::ios::trunc);
            session_.Open(path, Configuration(options, video));
            if (!file_.is_open()) {
                session_.Stop("open_failed");
            }
        }
    }

    void Write(const CodecBufferInfo &info)
    {
        if (!file_.is_open() || info.buffer == nullptr || info.attr.size <= 0) {
            return;
        }
        const auto now = std::chrono::steady_clock::now();
        if (!started_) {
            started_ = true;
            start_ = now;
        }
        const uint64_t size = static_cast<uint64_t>(info.attr.size);
        if (maxBytes_ > 0 && (bytes_ > maxBytes_ || size > maxBytes_ - bytes_)) {
            session_.Stop("size_limit");
            Close();
            return;
        }
        if (maxSeconds_ > 0 &&
            std::chrono::duration_cast<std::chrono::seconds>(now - start_).count() >= maxSeconds_) {
            session_.Stop("duration_limit");
            Close();
            return;
        }
        const int32_t capacity = OH_AVBuffer_GetCapacity(info.buffer);
        const uint8_t *address = OH_AVBuffer_GetAddr(info.buffer);
        if (address == nullptr || info.attr.offset < 0 || info.attr.offset > capacity ||
            info.attr.size > capacity - info.attr.offset) {
            session_.Stop("invalid_buffer");
            Close();
            return;
        }
        if (!session_.CanWrite(size)) {
            Close();
            return;
        }
        // 输出 Buffer 仍归 codec 所有，在当前线程写完后立即归还，不把地址交给异步任务。
        file_.write(reinterpret_cast<const char *>(address + info.attr.offset), info.attr.size);
        if (!file_.good()) {
            session_.Stop("write_failed");
            Close();
            return;
        }
        bytes_ += size;
        session_.Written(size, info.attr.pts);
    }

    void Close()
    {
        if (file_.is_open()) {
            file_.close();
            session_.Stop(file_.fail() ? "write_failed" : "completed");
        }
    }

private:
    static std::string Configuration(const OutputOptions &options, const VideoSampleInfo &video)
    {
        int32_t width = video.videoWidth;
        int32_t height = video.videoHeight;
        if (video.preprocMode == VIDEO_PREPROC_DOWNSAMPLING) {
            width = video.downsamplingWidth;
            height = video.downsamplingHeight;
        } else if (video.preprocMode == VIDEO_PREPROC_CROP) {
            width = video.cropRight - video.cropLeft + 1;
            height = video.cropBottom - video.cropTop + 1;
        }
        const double outputRate = video.dropToFrameRate > 0 ? video.dropToFrameRate : video.frameRate;
        std::ostringstream text;
        text << "sessionId=" << options.sessionId << "\nmime=" << video.videoCodecMime << "\ninputWidth=" << video.videoWidth
            << "\ninputHeight=" << video.videoHeight << "\nframeRate=" << video.frameRate
            << "\noutputWidth=" << width << "\noutputHeight=" << height << "\noutputFrameRate=" << outputRate
            << "\nbitrate=" << video.bitrate << "\npreprocMode=" << video.preprocMode
            << "\ncropLeft=" << video.cropLeft << "\ncropTop=" << video.cropTop
            << "\ncropRight=" << video.cropRight << "\ncropBottom=" << video.cropBottom
            << "\nmaxMiB=" << options.dumpMaxMiB << "\nmaxSeconds=" << options.dumpMaxSeconds;
        return text.str();
    }

    static constexpr uint64_t BYTES_PER_MIB = 1024 * 1024;
    std::ofstream file_;
    DumpSession session_;
    uint64_t bytes_ = 0;
    uint64_t maxBytes_ = 0;
    int32_t maxSeconds_ = 0;
    bool started_ = false;
    bool enabled_ = false;
    std::chrono::steady_clock::time_point start_;
};

#endif
