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

#ifndef ENCODING_CONFIG_QUERY_H
#define ENCODING_CONFIG_QUERY_H

#include <string>
#include "CapabilityTypes.h"

// [Start config_include_headers]
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_avformat.h>
#include <fstream>
// [End config_include_headers]

/**
 * 各类场景的视频编码基础参数配置场景执行器。
 *
 * 与《各类场景的视频编码基础参数配置》开发指南的场景化示例一一对应，覆盖
 * 低时延、实时流媒体、离线编码三大类别应用场景的推荐参数配置示例，文档示例
 * 代码以[Start xxx]/[End xxx]标记嵌入各场景函数中，供文档通过代码片段名引用。
 */
class EncodingConfigQuery {
public:
    // 场景：低时延视频通话场景编码参数配置（CBR）。
    static std::string LowLatencyCbr();
    // 场景：运行过程中动态请求IDR帧。
    static std::string DynamicRequestIdr();
    // 场景：CBRHQ（高质量恒定码率）码控方式配置。
    static std::string CbrhqConfig();
    // 场景：实时流媒体（直播）VBR码控方式配置。
    static std::string LiveVbr();
    // 场景：实时流媒体（直播）SQR码控方式配置。
    static std::string LiveSqr();
    // 场景：离线编码（视频分享）VBR码控方式配置。
    static std::string OfflineVbr();
    // 场景：离线编码（视频分享）SQR码控方式配置。
    static std::string OfflineSqr();
};

#endif // ENCODING_CONFIG_QUERY_H
