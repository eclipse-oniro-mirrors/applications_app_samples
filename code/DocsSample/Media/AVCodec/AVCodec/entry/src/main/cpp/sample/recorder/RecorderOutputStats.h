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

#ifndef AVCODEC_RECORDER_OUTPUT_STATS_H
#define AVCODEC_RECORDER_OUTPUT_STATS_H

#include <algorithm>
#include <cstdint>
#include <mutex>
#include "sample_info.h"
#include "RecorderStreamMetrics.h"

struct RecorderStreamInfo {
    int32_t width = 0;
    int32_t height = 0;
    uint64_t frames = 0;
    uint64_t bytes = 0;
    double framesPerSecond = 0;
    double bitrate = 0;
    RecorderStreamMetricsInfo live;
    StageTimingInfo queueWait;
    StageTimingInfo muxerWrite;
    StageTimingInfo dumpWrite;
    StageTimingInfo bufferHold;
    std::string requestedConfiguration;
    std::string codecDescription;
    int32_t codecWidth = 0;
    int32_t codecHeight = 0;
    double codecFps = 0;
    int64_t codecBitrate = 0;
    int64_t fileBytes = -1;
    int64_t freeBytes = -1;
    double fileBytesPerSecond = -1;
    std::string dumpState = "disabled";
    uint64_t dumpBytes = 0;
};

class RecorderOutputStats {
public:
    void Reset(const VideoSampleInfo &video, bool configured = false)
    {
        std::lock_guard<std::mutex> lock(mutex_);
        info_ = {};
        metrics_ = {};
        muxerTiming_ = {};
        dumpTiming_ = {};
        holdTiming_ = {};
        retrievalTiming_ = {};
        metrics_.Configure(video.dropToFrameRate > 0 ? video.dropToFrameRate : video.frameRate,
            configured ? video.bitrate : 0);
        firstPtsUs_ = -1;
        lastPtsUs_ = -1;
        info_.width = video.videoWidth;
        info_.height = video.videoHeight;
        if (video.preprocMode == VIDEO_PREPROC_DOWNSAMPLING) {
            info_.width = video.downsamplingWidth;
            info_.height = video.downsamplingHeight;
        } else if (video.preprocMode == VIDEO_PREPROC_CROP) {
            info_.width = video.cropRight - video.cropLeft + 1;
            info_.height = video.cropBottom - video.cropTop + 1;
        }
    }

    void Start()
    {
        std::lock_guard<std::mutex> lock(mutex_);
        metrics_.Start(RecorderClockUs());
    }

    void Stop()
    {
        std::lock_guard<std::mutex> lock(mutex_);
        metrics_.Stop(RecorderClockUs());
    }

    void ParameterResult(int64_t bitrate, bool keyFrame, bool accepted)
    {
        std::lock_guard<std::mutex> lock(mutex_);
        metrics_.ParameterResult(bitrate, keyFrame, accepted, RecorderClockUs());
    }

    void ConfigureDescription(const std::string &requested, const std::string &description,
        int32_t width, int32_t height, double fps, int64_t bitrate)
    {
        std::lock_guard<std::mutex> lock(mutex_);
        info_.requestedConfiguration = requested;
        info_.codecDescription = description;
        info_.codecWidth = width;
        info_.codecHeight = height;
        info_.codecFps = fps;
        info_.codecBitrate = bitrate;
    }

    void RecordStages(int64_t muxerUs, int64_t dumpUs, int64_t holdUs)
    {
        std::lock_guard<std::mutex> lock(mutex_);
        if (muxerUs >= 0) { muxerTiming_.Record(muxerUs); }
        if (dumpUs >= 0) { dumpTiming_.Record(dumpUs); }
        holdTiming_.Record(holdUs);
    }

    void RecordRetrieval(int64_t microseconds)
    {
        std::lock_guard<std::mutex> lock(mutex_);
        retrievalTiming_.Record(microseconds);
    }

    void RecordOutput(const OH_AVCodecBufferAttr &attr)
    {
        if (attr.size <= 0 || (attr.flags & (AVCODEC_BUFFER_FLAGS_CODEC_DATA | AVCODEC_BUFFER_FLAGS_EOS)) != 0) {
            return;
        }
        std::lock_guard<std::mutex> lock(mutex_);
        metrics_.Record(static_cast<uint64_t>(attr.size), attr.pts,
            (attr.flags & AVCODEC_BUFFER_FLAGS_SYNC_FRAME) != 0, RecorderClockUs());
    }

    void SetStorage(int64_t fileBytes, int64_t freeBytes, double growth, const std::string &dump, uint64_t dumpBytes)
    {
        std::lock_guard<std::mutex> lock(mutex_);
        info_.fileBytes = fileBytes;
        info_.freeBytes = freeBytes;
        info_.fileBytesPerSecond = growth;
        info_.dumpState = dump;
        info_.dumpBytes = dumpBytes;
    }

    void Record(const OH_AVCodecBufferAttr &attr)
    {
        std::lock_guard<std::mutex> lock(mutex_);
        info_.bytes += attr.size > 0 ? static_cast<uint64_t>(attr.size) : 0;
        if ((attr.flags & AVCODEC_BUFFER_FLAGS_CODEC_DATA) != 0 || attr.size <= 0) {
            return;
        }
        ++info_.frames;
        if (firstPtsUs_ < 0) {
            firstPtsUs_ = attr.pts;
        }
        lastPtsUs_ = std::max(lastPtsUs_, attr.pts);
    }

    RecorderStreamInfo Snapshot() const
    {
        std::lock_guard<std::mutex> lock(mutex_);
        RecorderStreamInfo snapshot = info_;
        snapshot.live = metrics_.Snapshot(RecorderClockUs());
        snapshot.muxerWrite = muxerTiming_.Snapshot();
        snapshot.dumpWrite = dumpTiming_.Snapshot();
        snapshot.bufferHold = holdTiming_.Snapshot();
        snapshot.queueWait = retrievalTiming_.Snapshot();
        // Recorder 已将 Camera 纳秒 PTS 归一化为微秒；首帧前不凭配置帧率推算实测值。
        const double seconds = static_cast<double>(lastPtsUs_ - firstPtsUs_) / microsecondsPerSecond;
        if (seconds > 0 && info_.frames > 1) {
            snapshot.framesPerSecond = static_cast<double>(info_.frames - 1) / seconds;
            snapshot.bitrate = static_cast<double>(info_.bytes) * bitsPerByte / seconds;
        }
        return snapshot;
    }

private:
    static constexpr double microsecondsPerSecond = 1000000.0;
    static constexpr double bitsPerByte = 8.0;
    mutable std::mutex mutex_;
    RecorderStreamInfo info_;
    RecorderStreamMetrics metrics_;
    StageTiming muxerTiming_;
    StageTiming dumpTiming_;
    StageTiming holdTiming_;
    StageTiming retrievalTiming_;
    int64_t firstPtsUs_ = -1;
    int64_t lastPtsUs_ = -1;
};

#endif
