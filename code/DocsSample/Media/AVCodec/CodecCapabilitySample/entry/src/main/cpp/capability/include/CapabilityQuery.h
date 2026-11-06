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

#ifndef CAPABILITY_QUERY_H
#define CAPABILITY_QUERY_H

#include <map>
#include <mutex>
#include <string>
#include "CapabilityTypes.h"

// [Start capability_include_headers]
#include <algorithm>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_audiocodec.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
// [End capability_include_headers]

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0xFF00
#define LOG_TAG "CapabilityQuery"

/**
 * 编解码能力查询场景执行器。
 *
 * 与《获取支持的编解码能力》开发指南的场景化示例一一对应，文档示例代码以
 * [Start xxx]/[End xxx] 标记嵌入各场景函数中，供文档通过代码片段名引用。
 * 场景结果会缓存，避免重复创建编解码器实例。
 */
class CapabilityQuery {
public:
    /**
     * 执行指定场景并返回结果文本。
     *
     * @param scenarioId 场景编号，取值见CapabilityScenario。
     * @return 场景执行结果描述文本。
     */
    static std::string RunScenario(int32_t scenarioId);

private:
    // 通用开发指导：获取能力实例的三种方式。
    static std::string GetCapabilityByMime();
    static std::string GetCapabilityByCategory();
    static std::string GetCapabilityListInfo();
    // 场景化开发：创建指定名称的编解码器。
    static std::string CreateDecoderByName();
    // 场景化开发：针对软硬件类别差异化配置编解码器参数。
    static std::string ConfigByCategory();
    // 场景化开发：创建多路编解码器。
    static std::string CreateMultiDecoders();
    // 场景化开发：控制编码质量。
    static std::string BitrateModeCbr();
    static std::string BitrateModeCq();
    static std::string BitrateModeSqr();
    static std::string BitrateModeCbrhq();
    // 场景化开发：查询编码器支持复杂度范围。
    static std::string QueryComplexityRange();
    // 场景化开发：设置正确的音频编解码参数。
    static std::string QueryAudioParams();
    // 场景化开发：查询编解码档次和级别支持情况。
    static std::string QueryProfileAndLevel();
    static std::string CheckProfileAndLevel();
    // 场景化开发：设置正确的视频宽高。
    static std::string CheckVideoSize();
    static std::string QuerySizeForWidth();
    static std::string QuerySizeForHeight();
    // 场景化开发：设置正确的视频帧率。
    static std::string CheckFrameRateRange();
    static std::string ConfigSizeAndFrameRate();
    // 场景化开发：设置正确的视频像素格式信息。
    static std::string QueryPixelFormats();
    // 场景化开发：查询编解码特性支持情况并获取特性属性信息。
    static std::string QueryFeatureLtr();
    // 场景化开发：筛选特定MIME类型的安全解码器（DRM播放场景）。
    static std::string FindSecureDecoder();

    // 按开发指南分组分发场景执行，控制单个分发函数的规模。
    static std::string RunCapabilityGuideScenario(int32_t scenarioId);
    static std::string RunEncodingConfigGuideScenario(int32_t scenarioId);
    static std::string RunBFrameGuideScenario(int32_t scenarioId);
    static std::string RunTemporalScalabilityGuideScenario(int32_t scenarioId);

    static std::mutex scenarioMutex_;
    static std::map<int32_t, std::string> scenarioResults_;
};

#endif // CAPABILITY_QUERY_H
