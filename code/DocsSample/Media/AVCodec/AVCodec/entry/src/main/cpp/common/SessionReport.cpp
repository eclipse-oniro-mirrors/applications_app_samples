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

#include "SessionReport.h"

namespace {
void AppendCommonRequest(std::ostringstream &text, const SampleInfo &info)
{
    text << "codecName=" << (info.codec.codecName.empty() ? "auto" : info.codec.codecName) <<
        "; codecType=" << info.codec.codecType << "; runMode=" << info.codec.codecRunMode <<
        "; sync=" << info.codec.codecSyncMode << "; dump=" << info.output.enableVideoDump <<
        "; dumpMaxMiB=" << info.output.dumpMaxMiB << "; dumpMaxSeconds=" << info.output.dumpMaxSeconds;
}

void AppendRecordingRequest(std::ostringstream &text, const SampleInfo &info)
{
    text << "; mime=" << info.video.videoCodecMime << "; input=" << info.video.videoWidth <<
        "x" << info.video.videoHeight << "; fps=" << info.video.frameRate <<
        "; bitrate=" << info.video.bitrate << "; bitrateMode=" << info.video.bitrateMode <<
        "; iFrameInterval=" << info.video.iFrameInterval << "; hdr=" << info.video.isHDRVivid <<
        "; pixelFormat=" << info.video.pixelFormat << "; preprocess=" << info.video.preprocMode <<
        "; crop=" << info.video.cropLeft << "," << info.video.cropTop << "," <<
        info.video.cropRight << "," << info.video.cropBottom <<
        "; downsampling=" << info.video.downsamplingWidth << "x" << info.video.downsamplingHeight <<
        "; dropToFps=" << info.video.dropToFrameRate << "; dualOutput=" << info.output.enableDualOutput <<
        "; secondary=" << info.output.secondaryVideoWidth << "x" << info.output.secondaryVideoHeight <<
        "; container=" << info.output.outputFormat << "; audio=" << info.audio.audioSampleRate <<
        "Hz/" << info.audio.audioChannelCount << "ch/" << info.audio.audioBitRate << "bps";
}

void AppendPlaybackRequest(std::ostringstream &text, const SampleInfo &info)
{
    text << "; retainLastFrame=" << info.codec.retainLastFrame <<
        "; lowLatency=" << info.codec.enableLowLatency <<
        "; decodingOrder=" << info.codec.outputInDecodingOrder <<
        "; hdrToBt709=" << info.codec.convertHdrVividToBt709 <<
        "; audioLowLatency=" << info.audioPlayback.enableLowLatency <<
        "; volume=" << info.audioPlayback.volume << "; audioTrack=" << info.codec.audioTrackIndex;
}
}

std::string DescribeCodecRequest(const SampleInfo &info, bool recording)
{
    // 有意不包含 fd、URI、文件名和文件完整路径，报告可由用户主动导出分享。
    std::ostringstream text;
    AppendCommonRequest(text, info);
    if (recording) {
        AppendRecordingRequest(text, info);
    } else {
        AppendPlaybackRequest(text, info);
    }
    return text.str();
}
