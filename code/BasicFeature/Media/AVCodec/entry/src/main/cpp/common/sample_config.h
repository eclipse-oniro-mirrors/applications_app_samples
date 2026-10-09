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

#ifndef AVCODEC_SAMPLE_CONFIG_H
#define AVCODEC_SAMPLE_CONFIG_H

#include <cstddef>
#include <cstdint>
#include <string>
#include <unordered_map>
#include <vector>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <native_window/external_window.h>

constexpr int32_t BITRATE_10M = 10 * 1024 * 1024;
constexpr int32_t BITRATE_20M = 20 * 1024 * 1024;
constexpr int32_t BITRATE_30M = 30 * 1024 * 1024;

inline const std::unordered_map<OH_AVPixelFormat, std::string> PIXEL_FORMAT_TO_STRING = {
    {AV_PIXEL_FORMAT_YUVI420, "YUVI420"},
    {AV_PIXEL_FORMAT_NV12, "NV12"},
    {AV_PIXEL_FORMAT_NV21, "NV21"},
    {AV_PIXEL_FORMAT_SURFACE_FORMAT, "SURFACE_FORMAT"},
    {AV_PIXEL_FORMAT_RGBA, "RGBA"},
    {AV_PIXEL_FORMAT_RGBA1010102, "RGBA1010102"},
};

enum PlaybackCompletionReason : int32_t {
    COMPLETED = 0,
    STOPPED,
    ERROR,
};

struct MediaTrackFormatInfo {
    int32_t trackIndex = -1;
    int32_t trackType = -1;
    std::string codecMime;
    int32_t audioSampleRate = 0;
    int32_t audioChannelCount = 0;
    int64_t bitrate = 0;
    std::string formatDump;
};

struct MediaSourceInfo {
    int32_t inputFd = -1;
    int64_t inputFileOffset = 0;
    int64_t inputFileSize = 0;
    std::string inputFilePath;
    int64_t durationUs = 0;
    int32_t trackCount = 0;
    std::string sourceFormatDump;
    std::vector<MediaTrackFormatInfo> trackFormats;
};

struct VideoSampleInfo {
    std::string videoCodecMime;
    int32_t videoWidth = 0;
    int32_t videoHeight = 0;
    double frameRate = 0.0;
    int64_t bitrate = BITRATE_10M;
    int64_t frameInterval = 0;
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    uint32_t bitrateMode = CBR;
    int32_t iFrameInterval = 100;
    int32_t rangFlag = 1;
    int32_t isHDRVivid = 0;
    bool hdrVividContainerSignaled = false;
    int32_t hevcProfile = HEVC_PROFILE_MAIN;
    OH_ColorPrimary primary = COLOR_PRIMARY_BT2020;
    OH_TransferCharacteristic transfer = TRANSFER_CHARACTERISTIC_HLG;
    OH_MatrixCoefficient matrix = MATRIX_COEFFICIENT_BT2020_CL;
    int32_t rotation = 0;
    OHNativeWindow *window = nullptr;
};

struct AudioSampleInfo {
    std::string audioCodecMime;
    int32_t audioSampleFormat = 0;
    int32_t audioSampleRate = 0;
    int32_t audioChannelCount = 0;
    int64_t audioChannelLayout = 0;
    int64_t audioBitRate = 0;
    int32_t audioMaxInputSize = 0;
    std::vector<uint8_t> codecConfig;
    size_t codecConfigLen = 0;
    int32_t aacAdts = -1;
    int32_t audioLatencyMode = 0;
    // 播放时由解封装器选择的音频轨索引；-1 表示使用第一条音频轨。
    int32_t trackIndex = -1;
};

struct CodecOptions {
    int32_t codecType = 0;
    int32_t codecRunMode = 0;
    int32_t codecSyncMode = 0;
    bool isSmartFluencySupported = false;
    bool retainLastFrame = true;
    bool enableLowLatency = false;
    bool outputInDecodingOrder = false;
    bool convertHdrVividToBt709 = false;
    // 调用方选择的音频轨，取值为容器内的轨道索引。
    int32_t audioTrackIndex = -1;
};

struct OutputOptions {
    int32_t outputFd = -1;
    bool enableVideoDump = false;
    std::string outputFilePath;
    int32_t outputFormat = 2; // AV_OUTPUT_FORMAT_MPEG_4 = 2，AV_OUTPUT_FORMAT_FLV = 14
};

struct AudioPlaybackOptions {
    // 渲染器音量，取值归一化到 [0.0, 1.0]。
    float volume = 1.0f;
    // 仅在创建 AudioRenderer 时生效；修改该值后需要重新创建渲染器。
    bool enableLowLatency = false;
};

struct PlaybackCallbackInfo {
    // 播放器完成后调用。回调函数和 context 均由调用方持有，异步播放结束前不得释放其关联对象。
    void (*playDoneCallback)(void *context, bool success, PlaybackCompletionReason reason) = nullptr;
    void *playDoneCallbackData = nullptr;
};

struct SampleInfo {
    MediaSourceInfo source;
    VideoSampleInfo video;
    AudioSampleInfo audio;
    CodecOptions codec;
    OutputOptions output;
    AudioPlaybackOptions audioPlayback;
    PlaybackCallbackInfo playback;
};

enum CodecType {
    AUTO = 0,
    VIDEO_HW_DECODER = 1,
    VIDEO_SW_DECODER = 2,
    VIDEO_HW_ENCODER = 3,
    VIDEO_SW_ENCODER = 4,
};

enum CodecRunMode {
    SURFACE = 0,
    BUFFER = 1,
    OPENGL = 2,
    VULKAN = 3
};

inline bool IsBufferBasedRunMode(int32_t runMode)
{
    return runMode == BUFFER || runMode == OPENGL || runMode == VULKAN;
}

inline bool IsTenBitHevcProfile(int32_t profile)
{
    return profile == HEVC_PROFILE_MAIN_10 || profile == HEVC_PROFILE_MAIN_10_HDR10 ||
        profile == HEVC_PROFILE_MAIN_10_HDR10_PLUS;
}

inline bool IsTenBitHevcOutput(const VideoSampleInfo &video)
{
    return video.videoCodecMime == OH_AVCODEC_MIMETYPE_VIDEO_HEVC &&
        (IsTenBitHevcProfile(video.hevcProfile) || video.hdrVividContainerSignaled || video.isHDRVivid != 0);
}

#endif // AVCODEC_SAMPLE_CONFIG_H
