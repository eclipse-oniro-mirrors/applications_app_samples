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

#include "CapabilityQuery.h"
#include "EncodingConfigQuery.h"
#include "BFrameQuery.h"
#include "TemporalScalabilityQuery.h"
#include "SampleLog.h"

std::mutex CapabilityQuery::scenarioMutex_;
std::map<int32_t, std::string> CapabilityQuery::scenarioResults_;

std::string CapabilityQuery::RunScenario(int32_t scenarioId)
{
    {
        std::lock_guard<std::mutex> lock(scenarioMutex_);
        auto it = scenarioResults_.find(scenarioId);
        if (it != scenarioResults_.end()) {
            SAMPLE_LOGI("Scenario %{public}d cached.", scenarioId);
            return it->second;
        }
    }
    std::string result;
    if (scenarioId >= SCENARIO_LOW_LATENCY_CBR && scenarioId <= SCENARIO_OFFLINE_SQR) {
        // 《各类场景的视频编码基础参数配置》开发指南场景。
        result = RunEncodingConfigGuideScenario(scenarioId);
    } else if (scenarioId >= SCENARIO_BFRAME_FEATURE_CHECK && scenarioId <= SCENARIO_BFRAME_CONFIGURE) {
        // 《高压缩率B帧编码》开发指南场景。
        result = RunBFrameGuideScenario(scenarioId);
    } else if (scenarioId >= SCENARIO_TEMPORAL_SCALABILITY_CHECK &&
               scenarioId <= SCENARIO_LTR_SURFACE_CALLBACK_REGISTER) {
        // 《具有抗弱网丢包能力的时域可分层编码》开发指南场景。
        result = RunTemporalScalabilityGuideScenario(scenarioId);
    } else {
        // 《获取支持的编解码能力》开发指南场景。
        result = RunCapabilityGuideScenario(scenarioId);
    }
    SAMPLE_LOGI("Scenario %{public}d result: %{public}s", scenarioId, result.c_str());
    std::lock_guard<std::mutex> lock(scenarioMutex_);
    scenarioResults_[scenarioId] = result;
    return result;
}

std::string CapabilityQuery::RunCapabilityGuideScenario(int32_t scenarioId)
{
    using ScenarioHandler = std::string (*)();
    static const std::map<int32_t, ScenarioHandler> handlers = {
        {SCENARIO_GET_CAPABILITY_BY_MIME, GetCapabilityByMime},
        {SCENARIO_GET_CAPABILITY_BY_CATEGORY, GetCapabilityByCategory},
        {SCENARIO_GET_CAPABILITY_LIST, GetCapabilityListInfo},
        {SCENARIO_CREATE_DECODER_BY_NAME, CreateDecoderByName},
        {SCENARIO_CONFIG_BY_CATEGORY, ConfigByCategory},
        {SCENARIO_CREATE_MULTI_DECODERS, CreateMultiDecoders},
        {SCENARIO_BITRATE_MODE_CBR, BitrateModeCbr},
        {SCENARIO_BITRATE_MODE_CQ, BitrateModeCq},
        {SCENARIO_BITRATE_MODE_SQR, BitrateModeSqr},
        {SCENARIO_BITRATE_MODE_CBRHQ, BitrateModeCbrhq},
        {SCENARIO_COMPLEXITY_RANGE, QueryComplexityRange},
        {SCENARIO_AUDIO_PARAMS, QueryAudioParams},
        {SCENARIO_PROFILE_AND_LEVEL, QueryProfileAndLevel},
        {SCENARIO_PROFILE_LEVEL_SUPPORTED, CheckProfileAndLevel},
        {SCENARIO_VIDEO_SIZE_CHECK, CheckVideoSize},
        {SCENARIO_VIDEO_SIZE_FOR_WIDTH, QuerySizeForWidth},
        {SCENARIO_VIDEO_SIZE_FOR_HEIGHT, QuerySizeForHeight},
        {SCENARIO_FRAME_RATE_CHECK, CheckFrameRateRange},
        {SCENARIO_SIZE_FRAME_RATE_CONFIG, ConfigSizeAndFrameRate},
        {SCENARIO_PIXEL_FORMATS, QueryPixelFormats},
        {SCENARIO_FEATURE_LTR, QueryFeatureLtr},
        {SCENARIO_SECURE_DECODER, FindSecureDecoder},
    };
    auto it = handlers.find(scenarioId);
    if (it == handlers.end()) {
        return "未知场景编号: " + std::to_string(scenarioId);
    }
    return it->second();
}

std::string CapabilityQuery::RunEncodingConfigGuideScenario(int32_t scenarioId)
{
    using ScenarioHandler = std::string (*)();
    static const std::map<int32_t, ScenarioHandler> handlers = {
        {SCENARIO_LOW_LATENCY_CBR, EncodingConfigQuery::LowLatencyCbr},
        {SCENARIO_DYNAMIC_REQUEST_IDR, EncodingConfigQuery::DynamicRequestIdr},
        {SCENARIO_CBRHQ_CONFIG, EncodingConfigQuery::CbrhqConfig},
        {SCENARIO_LIVE_VBR, EncodingConfigQuery::LiveVbr},
        {SCENARIO_LIVE_SQR, EncodingConfigQuery::LiveSqr},
        {SCENARIO_OFFLINE_VBR, EncodingConfigQuery::OfflineVbr},
        {SCENARIO_OFFLINE_SQR, EncodingConfigQuery::OfflineSqr},
    };
    auto it = handlers.find(scenarioId);
    if (it == handlers.end()) {
        return "未知场景编号: " + std::to_string(scenarioId);
    }
    return it->second();
}

std::string CapabilityQuery::RunBFrameGuideScenario(int32_t scenarioId)
{
    using ScenarioHandler = std::string (*)();
    static const std::map<int32_t, ScenarioHandler> handlers = {
        {SCENARIO_BFRAME_FEATURE_CHECK, BFrameQuery::FeatureCheck},
        {SCENARIO_BFRAME_CONFIGURE, BFrameQuery::Configure},
    };
    auto it = handlers.find(scenarioId);
    if (it == handlers.end()) {
        return "未知场景编号: " + std::to_string(scenarioId);
    }
    return it->second();
}

std::string CapabilityQuery::RunTemporalScalabilityGuideScenario(int32_t scenarioId)
{
    using ScenarioHandler = std::string (*)();
    static const std::map<int32_t, ScenarioHandler> handlers = {
        {SCENARIO_TEMPORAL_SCALABILITY_CHECK, TemporalScalabilityQuery::FeatureCheck},
        {SCENARIO_TEMPORAL_SCALABILITY_CREATE, TemporalScalabilityQuery::CreateEncoder},
        {SCENARIO_TEMPORAL_SCALABILITY_CONFIG, TemporalScalabilityQuery::Configure},
        {SCENARIO_TEMPORAL_SCALABILITY_DYNAMIC_ENABLE, TemporalScalabilityQuery::DynamicEnable},
        {SCENARIO_TEMPORAL_SCALABILITY_DYNAMIC_DISABLE, TemporalScalabilityQuery::DynamicDisable},
        {SCENARIO_LTR_FEATURE_CHECK, TemporalScalabilityQuery::LtrFeatureCheck},
        {SCENARIO_LTR_CONFIG_COUNT, TemporalScalabilityQuery::LtrConfigCount},
        {SCENARIO_LTR_BUFFER_CALLBACK_REGISTER, TemporalScalabilityQuery::LtrBufferCallbackRegister},
        {SCENARIO_LTR_SURFACE_CALLBACK_REGISTER, TemporalScalabilityQuery::LtrSurfaceCallbackRegister},
    };
    auto it = handlers.find(scenarioId);
    if (it == handlers.end()) {
        return "未知场景编号: " + std::to_string(scenarioId);
    }
    return it->second();
}

std::string CapabilityQuery::GetCapabilityByMime()
{
    SAMPLE_LOGI("Run GetCapabilityByMime.");
    // [Start capability_get_by_mime]
    // 获取系统推荐的音频AAC解码器能力实例。
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_AUDIO_AAC, false);
    // [End capability_get_by_mime]
    if (capability == nullptr) {
        return "方式一：未获取到系统推荐的音频AAC解码器能力实例。";
    }
    return "方式一：已获取系统推荐的音频AAC解码器能力实例。\n编解码器名称: " + SafeName(OH_AVCapability_GetName(capability));
}

std::string CapabilityQuery::GetCapabilityByCategory()
{
    SAMPLE_LOGI("Run GetCapabilityByCategory.");
    // [Start capability_get_by_category]
    // 获取指定硬件的视频AVC编码器能力实例。
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true, HARDWARE);
    // [End capability_get_by_category]
    if (capability == nullptr) {
        return "方式二：当前设备不存在指定硬件的视频AVC编码器。";
    }
    return "方式二：已获取指定硬件的视频AVC编码器能力实例。\n编解码器名称: " +
        SafeName(OH_AVCapability_GetName(capability)) +
        "\n是否为硬件编解码器: " + (OH_AVCapability_IsHardware(capability) ? "是" : "否");
}

std::string CapabilityQuery::GetCapabilityListInfo()
{
    SAMPLE_LOGI("Run GetCapabilityListInfo.");
    // [Start capability_get_capability_list]
    // 获取系统中所有视频解码器的能力实例列表。
    uint32_t count = 0;
    OH_AVCapability **capabilityList = OH_AVCodec_GetCapabilityList(OH_AVCODEC_TYPE_VIDEO_DECODER, &count);
    // [End capability_get_capability_list]
    if (capabilityList == nullptr || count == 0) {
        return "方式三：未查询到视频解码器能力实例列表。";
    }
    std::string result = "方式三：共查询到 " + std::to_string(count) + " 个视频解码器。";
    for (uint32_t i = 0; i < count; i++) {
        result += "\n" + std::to_string(i + 1) + ". " + SafeName(OH_AVCapability_GetName(capabilityList[i]));
    }
    return result;
}

std::string CapabilityQuery::CreateDecoderByName()
{
    SAMPLE_LOGI("Run CreateDecoderByName.");
    // [Start capability_create_decoder_by_name]
    // 1. 获取H.264软件解码器能力实例。
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
    if (capability != nullptr) {
        // 2. 获取H.264软件解码器名称。
        const char *codecName = OH_AVCapability_GetName(capability);
        // 3. 创建H.264软件解码器实例。
        OH_AVCodec *videoDec = OH_VideoDecoder_CreateByName(codecName);
    }
    // [End capability_create_decoder_by_name]
    if (capability == nullptr) {
        return "创建指定名称的编解码器：当前设备不存在H.264软件解码器。";
    }
    // 说明：示例中创建的解码器实例由文档展示用途，实际业务请在使用完毕后调用OH_VideoDecoder_Destroy释放。
    return "创建指定名称的编解码器：已通过OH_VideoDecoder_CreateByName创建H.264软件解码器。\n编解码器名称: " +
        SafeName(OH_AVCapability_GetName(capability));
}

std::string CapabilityQuery::ConfigByCategory()
{
    SAMPLE_LOGI("Run ConfigByCategory.");
    // [Start capability_config_by_category]
    // 1. 确认推荐的H.264编码器的软硬件类别。
    OH_AVCapability *capability = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true);
    if (capability == nullptr) {
        // 异常处理。
    }
    bool isHardware = OH_AVCapability_IsHardware(capability);
    // 2. 基于软硬件类别差异化配置。
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    if (videoEnc == nullptr) {
        // 异常处理。
    }
    OH_AVFormat *format = OH_AVFormat_CreateVideoFormat(OH_AVCODEC_MIMETYPE_VIDEO_AVC, 1920, 1080);
    if (format == nullptr) {
        // 异常处理。
    }
    double frameRate = isHardware ? 60.0 : 30.0;
    if (!OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, frameRate)) {
        // 异常处理。
    }
    if (OH_VideoEncoder_Configure(videoEnc, format) != AV_ERR_OK) {
        // 异常处理。
    }
    OH_AVFormat_Destroy(format);
    // [End capability_config_by_category]
    std::string result = "针对软硬件类别差异化配置编解码器参数：";
    result += capability == nullptr ? "未获取到推荐的H.264编码器。" : "推荐的H.264编码器为" +
        std::string(OH_AVCapability_IsHardware(capability) ? "硬件" : "软件") + "编解码器。";
    result += "\n按类别差异化配置帧率: " + std::to_string(static_cast<int32_t>(frameRate)) + " fps。";
    result += videoEnc == nullptr ? "\n编码器创建失败。" : "\n编码器创建并配置完成。";
    if (videoEnc != nullptr) {
        OH_VideoEncoder_Destroy(videoEnc);
        result += "（示例验证后已销毁实例）";
    }
    return result;
}

std::string CapabilityQuery::CreateMultiDecoders()
{
    SAMPLE_LOGI("Run CreateMultiDecoders.");
    // [Start capability_create_multi_decoders]
    constexpr int32_t NEEDED_VDEC_NUM = 8;
    // 1. 创建硬件解码器实例。
    OH_AVCapability *capHW = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
    if (capHW == nullptr) {
        // 异常处理。
    }
    int32_t vDecNumHW = std::min(OH_AVCapability_GetMaxSupportedInstances(capHW), NEEDED_VDEC_NUM);
    int32_t createdVDecNum = 0;
    for (int i = 0; i < vDecNumHW; i++) {
        OH_AVCodec *videoDec = OH_VideoDecoder_CreateByName(OH_AVCapability_GetName(capHW));
        if (videoDec != nullptr) {
            // 维护在videoDecVector中。
            createdVDecNum++;
        }
    }
    if (createdVDecNum < NEEDED_VDEC_NUM) {
        // 2. 不够时，创建软件解码器实例。
        OH_AVCapability *capSW = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
        if (capSW == nullptr) {
            // 异常处理。
        }
        int32_t vDecNumSW = std::min(OH_AVCapability_GetMaxSupportedInstances(capSW), NEEDED_VDEC_NUM - createdVDecNum);
        for (int i = 0; i < vDecNumSW; i++) {
            OH_AVCodec *videoDec = OH_VideoDecoder_CreateByName(OH_AVCapability_GetName(capSW));
            if (videoDec != nullptr) {
                // 维护在videoDecVector中。
                createdVDecNum++;
            }
        }
    }
    // [End capability_create_multi_decoders]
    // 说明：示例按文档演示多路创建，创建的解码器实例由业务方在videoDecVector中维护并适时释放。
    std::string result = "创建多路编解码器：";
    if (capHW != nullptr) {
        result += "硬件解码器最大实例数 " + std::to_string(OH_AVCapability_GetMaxSupportedInstances(capHW)) + "。";
    } else {
        result += "未查询到硬件解码器。";
    }
    result += "\n本次共创建 " + std::to_string(createdVDecNum) + " 路解码器实例";
    result += createdVDecNum >= NEEDED_VDEC_NUM ? "，已满足业务需求。" : "，未达到目标8路（受设备资源约束）。";
    return result;
}
