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
    uint8_t codecConfig[1024] = { 0 };
    size_t codecConfigLen = 0;
    int32_t aacAdts = -1;
    int32_t audioLatencyMode = 0;
    // Demuxer track index selected for playback. -1 means the first audio track.
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
    // Audio track selected by the caller. The value is a container track index.
    int32_t audioTrackIndex = -1;
};

struct OutputOptions {
    int32_t outputFd = -1;
    bool enableVideoDump = false;
    std::string outputFilePath;
    int32_t outputFormat = 2; // AV_OUTPUT_FORMAT_MPEG_4 = 2, AV_OUTPUT_FORMAT_FLV = 14
};

struct AudioPlaybackOptions {
    // Renderer volume, normalized to [0.0, 1.0].
    float volume = 1.0f;
    // Applied while the AudioRenderer is being built; changing it requires a new renderer.
    bool enableLowLatency = false;
};

struct PlaybackCallbackInfo {
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
    BUFFER = 1
};

#endif // AVCODEC_SAMPLE_CONFIG_H
