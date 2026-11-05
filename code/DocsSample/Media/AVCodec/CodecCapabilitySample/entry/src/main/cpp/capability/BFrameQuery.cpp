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

#include "BFrameQuery.h"
#include "SampleLog.h"
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>

#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0xFF00
#define LOG_TAG "BFrameQuery"

// 文档示例按单参数形式调用OH_LOG_INFO/OH_LOG_ERROR（省略了日志类型参数），
// 此处适配为携带LOG_APP类型的标准hilog打印，保持文档示例代码原样可编译。
// 注意：本文件内请勿使用SAMPLE_LOG系列宏（其按(type, fmt)双参形式调用OH_LOG_*）。
#undef OH_LOG_INFO
#undef OH_LOG_ERROR
#define OH_LOG_INFO(...) ((void)OH_LOG_Print(LOG_APP, LOG_INFO, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))
#define OH_LOG_ERROR(...) ((void)OH_LOG_Print(LOG_APP, LOG_ERROR, LOG_DOMAIN, LOG_TAG, __VA_ARGS__))

std::string BFrameQuery::FeatureCheck()
{
    OH_LOG_INFO("Run BFrameFeatureCheck.");
    // [Start bframe_feature_check]
    // 1.1 获取对应视频编码器能力实例，此处以H.265为例。
    OH_AVCapability *cap = OH_AVCodec_GetCapabilityByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true, HARDWARE);
    if (cap != nullptr) {
        OH_LOG_INFO("Get codec Capability success!");
        // 1.2 通过特性能力查询接口校验是否支持B帧编码特性。
        bool isSupported = OH_AVCapability_IsFeatureSupported(cap, VIDEO_ENCODER_B_FRAME);
        int32_t supportedMaxBFrameCount = 0;
        if (isSupported) {
            OH_LOG_INFO("Feature VIDEO_ENCODER_B_FRAME is Supported!");
            // 1.3 确定支持的最大B帧数量。
            OH_AVFormat *property = OH_AVCapability_GetFeatureProperties(cap, VIDEO_ENCODER_B_FRAME);
            OH_AVFormat_GetIntValue(property, OH_MD_KEY_VIDEO_ENCODER_MAX_B_FRAMES, &supportedMaxBFrameCount);
            OH_LOG_INFO("Get supportedMaxBFrameCount,value is %{public}d!", supportedMaxBFrameCount);
            // 1.4 销毁临时AVFormat。
            OH_AVFormat_Destroy(property);
        } else {
            OH_LOG_ERROR("Feature VIDEO_ENCODER_B_FRAME is not Supported!");
        }
    } else {
        OH_LOG_ERROR("codec Capability is null!");
    }
    // [End bframe_feature_check]
    std::string result = "B帧特性校验：";
    if (cap == nullptr) {
        return result + "未获取到H.265硬件编码器能力实例。";
    }
    result += "已获取H.265硬件编码器能力实例。";
    // 片段内的校验结果变量处于嵌套作用域，此处复查一次用于结果展示。
    bool isSupported = OH_AVCapability_IsFeatureSupported(cap, VIDEO_ENCODER_B_FRAME);
    result += "\nB帧编码特性支持情况: " + std::string(isSupported ? "支持" : "不支持");
    if (isSupported) {
        int32_t supportedMaxBFrameCount = 0;
        OH_AVFormat *property = OH_AVCapability_GetFeatureProperties(cap, VIDEO_ENCODER_B_FRAME);
        if (property != nullptr) {
            [[maybe_unused]] bool getRet =
                OH_AVFormat_GetIntValue(property, OH_MD_KEY_VIDEO_ENCODER_MAX_B_FRAMES, &supportedMaxBFrameCount);
            OH_AVFormat_Destroy(property);
        }
        result += "\n支持的最大B帧数量: " + std::to_string(supportedMaxBFrameCount);
    }
    return result;
}

std::string BFrameQuery::Configure()
{
    OH_LOG_INFO("Run BFrameConfigure.");
    // 场景示例中的videoEnc为视频编码器实例，此处先创建H.265编码器用于演示。
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
    // [Start bframe_configure]
    // 2.1 创建配置用临时AVFormat。
    OH_AVFormat *format = OH_AVFormat_Create();
    // 2.2 填充使能参数键值对。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_ENABLE_B_FRAME, 1);
    // 2.3 参数配置。
    int32_t ret = OH_VideoEncoder_Configure(videoEnc, format);
    if (ret != AV_ERR_OK) {
        // 异常处理。
    }
    // 2.4 配置完成后销毁临时AVFormat。
    OH_AVFormat_Destroy(format);
    // [End bframe_configure]
    std::string result = "配置使能B帧编码：";
    if (videoEnc == nullptr) {
        return result + "H.265编码器创建失败。";
    }
    result += ret == AV_ERR_OK ? "B帧使能参数已下发（配置环节为弱校验，请结合码流产物和运行日志判断是否真实使能）。"
                               : "参数配置失败，错误码: " + std::to_string(ret);
    OH_VideoEncoder_Destroy(videoEnc);
    return result + "（示例验证后已销毁实例）";
}
