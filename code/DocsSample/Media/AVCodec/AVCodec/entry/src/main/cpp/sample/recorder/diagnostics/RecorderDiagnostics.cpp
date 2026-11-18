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

#include "../core/Recorder.h"
#include <sys/stat.h>
#include <sys/statvfs.h>

#undef LOG_TAG
#define LOG_TAG "recorder"

namespace {
constexpr size_t MAX_STAGE_RESULT_LENGTH = 128;
constexpr int64_t MICROSECOND = 1000000;
constexpr uint32_t VIDEO_OUTPUT_LOG_FREQUENCY = 120;
}

void Recorder::RefreshStreamStorage(bool primary, bool force)
{
    auto &lastAt = primary ? primaryStorageAtUs_ : secondaryStorageAtUs_;
    const int64_t now = RecorderClockUs();
    if (!force && now - lastAt < MICROSECOND) {
        return;
    }
    auto &stats = primary ? primaryStats_ : secondaryStats_;
    const int fd = primary ? sampleInfo_.output.outputFd : sampleInfo_.output.secondaryOutputFd;
    struct stat file {};
    struct statvfs space {};
    const int64_t bytes = fd >= 0 && fstat(fd, &file) == 0 ? file.st_size : -1;
    const int64_t available = fd >= 0 && fstatvfs(fd, &space) == 0 ?
        static_cast<int64_t>(space.f_bavail) * space.f_frsize : -1;
    auto &previousBytes = primary ? primaryFileBytes_ : secondaryFileBytes_;
    const double growth = lastAt > 0 && now > lastAt && bytes >= previousBytes && previousBytes >= 0 ?
        static_cast<double>(bytes - previousBytes) * MICROSECOND / (now - lastAt) : -1;
    const auto &dump = primary ? primaryDump_ : secondaryDump_;
    stats.SetStorage(bytes, available, growth, dump.State(), dump.Bytes());
    previousBytes = bytes;
    lastAt = now;
}

void Recorder::MarkStage(const std::string &id, const std::string &stage, const std::string &result)
{
    if (id.empty() || id != sessionReport_.Snapshot().id || result.size() > MAX_STAGE_RESULT_LENGTH) {
        return;
    }
    if (stage == "camera.started" || stage == "camera.failed" || stage == "camera.released" ||
        stage == "files.closed" || stage == "files.close_failed" || stage == "camera.frame_end" ||
        stage == "camera.frame_end_timeout" || stage == "storage.stop_requested" || stage == "stop.requested") {
        sessionReport_.Event(stage, result);
        if (stage == "stop.requested") { sessionReport_.End("user_stop"); }
        if (stage == "storage.stop_requested") { sessionReport_.End("low_space"); }
        if (stage == "camera.failed") { sessionReport_.End("camera_failed"); }
        if (stage == "files.close_failed") { sessionReport_.End("file_close_failed"); }
        if (stage == "camera.frame_end_timeout") { sessionReport_.End("camera_frame_end_timeout"); }
    }
}

void Recorder::RecordVideoOutput(CodecUserData *context, const CodecBufferInfo &bufferInfo, bool isPrimary)
{
    const bool media = (bufferInfo.attr.flags & (AVCODEC_BUFFER_FLAGS_EOS | AVCODEC_BUFFER_FLAGS_CODEC_DATA)) == 0 &&
        bufferInfo.attr.size > 0;
    if (media) {
        ++context->outputFrameCount;
    }
    AVCODEC_SAMPLE_LOGD_LIMIT(VIDEO_OUTPUT_LOG_FREQUENCY,
        "Out buffer count: %{public}u, size: %{public}d, flag: %{public}u, pts: %{public}" PRId64,
        context->outputFrameCount, bufferInfo.attr.size, bufferInfo.attr.flags, bufferInfo.attr.pts);
    const bool isEosBuffer = (bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    if (context->outputFrameCount == 1 && !isEosBuffer && bufferInfo.attr.size > 0 &&
        (bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_CODEC_DATA) == 0) {
        sessionReport_.Event(isPrimary ? "primary.first_output" : "secondary.first_output");
    }
    auto &stats = isPrimary ? primaryStats_ : secondaryStats_;
    stats.RecordOutput(bufferInfo.attr);
    if (!isEosBuffer && bufferInfo.attr.size > 0 &&
        (bufferInfo.attr.flags & AVCODEC_BUFFER_FLAGS_CODEC_DATA) == 0) {
        audioStats_.Video(isPrimary, bufferInfo.attr.pts);
    }
}
