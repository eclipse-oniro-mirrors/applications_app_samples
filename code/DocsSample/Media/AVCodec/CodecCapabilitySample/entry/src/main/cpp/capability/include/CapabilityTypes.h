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

#ifndef CAPABILITY_TYPES_H
#define CAPABILITY_TYPES_H

#include <cstdint>
#include <string>

// 编解码器类别，与ArkTS侧的类别索引保持一致。
enum CodecCategory {
    CATEGORY_VIDEO_DECODER = 0,
    CATEGORY_VIDEO_ENCODER = 1,
    CATEGORY_AUDIO_DECODER = 2,
    CATEGORY_AUDIO_ENCODER = 3,
};

// 场景化开发示例编号，与ArkTS侧的场景列表保持一致。
enum CapabilityScenario {
    SCENARIO_GET_CAPABILITY_BY_MIME = 0,
    SCENARIO_GET_CAPABILITY_BY_CATEGORY = 1,
    SCENARIO_GET_CAPABILITY_LIST = 2,
    SCENARIO_CREATE_DECODER_BY_NAME = 3,
    SCENARIO_CONFIG_BY_CATEGORY = 4,
    SCENARIO_CREATE_MULTI_DECODERS = 5,
    SCENARIO_BITRATE_MODE_CBR = 6,
    SCENARIO_BITRATE_MODE_CQ = 7,
    SCENARIO_BITRATE_MODE_SQR = 8,
    SCENARIO_BITRATE_MODE_CBRHQ = 9,
    SCENARIO_COMPLEXITY_RANGE = 10,
    SCENARIO_AUDIO_PARAMS = 11,
    SCENARIO_PROFILE_AND_LEVEL = 12,
    SCENARIO_PROFILE_LEVEL_SUPPORTED = 13,
    SCENARIO_VIDEO_SIZE_CHECK = 14,
    SCENARIO_VIDEO_SIZE_FOR_WIDTH = 15,
    SCENARIO_VIDEO_SIZE_FOR_HEIGHT = 16,
    SCENARIO_FRAME_RATE_CHECK = 17,
    SCENARIO_SIZE_FRAME_RATE_CONFIG = 18,
    SCENARIO_PIXEL_FORMATS = 19,
    SCENARIO_FEATURE_LTR = 20,
    SCENARIO_SECURE_DECODER = 21,
    // 以下场景对应《各类场景的视频编码基础参数配置》开发指南。
    SCENARIO_LOW_LATENCY_CBR = 22,
    SCENARIO_DYNAMIC_REQUEST_IDR = 23,
    SCENARIO_CBRHQ_CONFIG = 24,
    SCENARIO_LIVE_VBR = 25,
    SCENARIO_LIVE_SQR = 26,
    SCENARIO_OFFLINE_VBR = 27,
    SCENARIO_OFFLINE_SQR = 28,
    // 以下场景对应《高压缩率B帧编码》开发指南。
    SCENARIO_BFRAME_FEATURE_CHECK = 29,
    SCENARIO_BFRAME_CONFIGURE = 30,
    // 以下场景对应《具有抗弱网丢包能力的时域可分层编码》开发指南。
    SCENARIO_TEMPORAL_SCALABILITY_CHECK = 31,
    SCENARIO_TEMPORAL_SCALABILITY_CREATE = 32,
    SCENARIO_TEMPORAL_SCALABILITY_CONFIG = 33,
    SCENARIO_TEMPORAL_SCALABILITY_DYNAMIC_ENABLE = 34,
    SCENARIO_TEMPORAL_SCALABILITY_DYNAMIC_DISABLE = 35,
    SCENARIO_LTR_FEATURE_CHECK = 36,
    SCENARIO_LTR_CONFIG_COUNT = 37,
    SCENARIO_LTR_BUFFER_CALLBACK_REGISTER = 38,
    SCENARIO_LTR_SURFACE_CALLBACK_REGISTER = 39,
};

// 范围值转字符串，用于结果展示。
inline std::string RangeToString(int32_t minVal, int32_t maxVal)
{
    return "[" + std::to_string(minVal) + ", " + std::to_string(maxVal) + "]";
}

// 名称转字符串，避免空指针构造std::string。
inline std::string SafeName(const char *name)
{
    return name == nullptr ? "(unknown)" : std::string(name);
}

#endif // CAPABILITY_TYPES_H
