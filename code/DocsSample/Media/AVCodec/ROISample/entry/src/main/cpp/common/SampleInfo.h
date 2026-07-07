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

#ifndef SAMPLE_INFO_H
#define SAMPLE_INFO_H

#include <cstdint>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <string>
#include <native_buffer/native_buffer.h>
#include "multimedia/player_framework/native_avcodec_base.h"
#include "multimedia/player_framework/native_avbuffer.h"

inline constexpr int64_t DEFAULT_VIDEO_BITRATE = 3 * 1024 * 1024;
inline constexpr int32_t DEFAULT_IFRAME_INTERVAL = 2000;
inline constexpr int32_t AUDIO_BYTES_PER_SAMPLE = sizeof(int16_t);
inline constexpr int32_t AUDIO_SAMPLE_RATE = 48000;
inline constexpr int32_t AUDIO_CHANNEL_COUNT = 2;
inline constexpr int64_t AUDIO_BITRATE = 32000;
inline constexpr double AUDIO_FRAME_DURATION_SEC = 0.02;
inline constexpr int32_t NAPI_STRING_BUFFER_SIZE = 20;
inline constexpr int32_t NAPI_INIT_ARG_COUNT = 11;
inline constexpr int32_t THREAD_WAIT_TIMEOUT_SEC = 5;
inline constexpr int32_t AUDIO_CODEC_CONFIG_SIZE = 100;
inline constexpr int32_t CODEC_CONFIG_BUFFER_SIZE = 1024;

// ROI configuration path type
enum RoiPathType {
    ROI_PATH_NATIVEBUFFER = 0,       // Surface模式 - NativeBuffer元数据配置
    ROI_PATH_METADATA_CALLBACK = 1,  // Surface模式 - 参数回调配置
    ROI_PATH_BUFFER_MODE = 2,        // Buffer模式 - Buffer回调配置
};

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0xFF00
#define LOG_TAG "CodecInfo"

struct FileInfo {
    int32_t inputFd = -1;
    int32_t outputFd = -1;
    int32_t roiFd = -1;
    int64_t inputFileOffset = 0;
    int64_t inputFileSize = 0;
    std::string inputFilePath;
};

struct VideoInfo {
    std::string videoCodecMime = "";
    int32_t videoWidth = 0;
    int32_t videoHeight = 0;
    double frameRate = 0.0;
    int64_t bitrate = DEFAULT_VIDEO_BITRATE;
    int64_t frameInterval = 0;
    OH_AVPixelFormat pixelFormat = AV_PIXEL_FORMAT_NV12;
    uint32_t bitrateMode = BITRATE_MODE_SQR;
    int32_t iFrameInterval = DEFAULT_IFRAME_INTERVAL;
    int32_t rangFlag = 1;
    int32_t isHDRVivid = 0;
    int32_t hevcProfile = HEVC_PROFILE_MAIN;
    OH_ColorPrimary primary = COLOR_PRIMARY_BT2020;
    OH_TransferCharacteristic transfer = TRANSFER_CHARACTERISTIC_PQ;
    OH_MatrixCoefficient matrix = MATRIX_COEFFICIENT_BT2020_CL;
    int32_t rotation = 0;
    OHNativeWindow *window = nullptr;
    RoiPathType roiPathType = ROI_PATH_NATIVEBUFFER;
};

struct AudioInfo {
    std::string audioCodecMime = "";
    int32_t audioSampleForamt = 0;
    int32_t audioSampleRate = 0;
    int32_t audioChannelCount = 0;
    int64_t audioChannelLayout = 0;
    int32_t audioBitRate = 0;
    uint8_t audioCodecConfig[AUDIO_CODEC_CONFIG_SIZE] = { 0 };
    int32_t audioMaxInputSize = 0;
    int32_t isOpenEchoCancel = 0;
    uint8_t codecConfig[CODEC_CONFIG_BUFFER_SIZE];
    size_t codecConfigLen = 0;
    int32_t aacAdts = -1;
};

struct SampleInfo {
    FileInfo fileInfo;
    AudioInfo audioInfo;
    VideoInfo videoInfo;
};

#endif // SAMPLE_INFO_H