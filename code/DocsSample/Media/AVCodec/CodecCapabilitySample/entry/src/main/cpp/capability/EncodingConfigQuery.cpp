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

#include "EncodingConfigQuery.h"
#include "SampleLog.h"

namespace {
// 按码控模式支持情况与配置结果组装场景结果文本，并释放示例编码器实例。
std::string BuildEncodingResult(const std::string &sceneName, OH_AVCapability *cap, OH_BitrateMode mode,
    const std::string &supportedText, const std::string &fallbackText, int32_t ret, OH_AVCodec *videoEnc)
{
    std::string result = sceneName;
    if (videoEnc == nullptr) {
        return result + "H.265编码器创建失败。";
    }
    if (cap != nullptr && OH_AVCapability_IsEncoderBitrateModeSupported(cap, mode)) {
        result += supportedText;
    } else {
        result += fallbackText;
    }
    result += ret == AV_ERR_OK ? "编码器配置成功（示例验证后已销毁实例）。"
                               : "编码器配置失败，错误码: " + std::to_string(ret);
    OH_VideoEncoder_Destroy(videoEnc);
    return result;
}
} // namespace

std::string EncodingConfigQuery::LowLatencyCbr()
{
    SAMPLE_LOGI("Run LowLatencyCbr.");
    // 场景示例中的videoEnc为视频编码器实例，此处先创建H.265编码器用于演示。
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
    // [Start config_low_latency_cbr]
    // 1. 创建AVFormat参数实例。
    OH_AVFormat *format = OH_AVFormat_Create();
    if (format == nullptr) {
        // 异常处理。
    }
    // 2. 填充编码参数键值对（以1080p@30fps SDR输入源为例）。
    constexpr int32_t VIDEO_WIDTH = 1920; // 视频像素宽。
    constexpr int32_t VIDEO_HEIGHT = 1080; // 视频像素高。
    constexpr double VIDEO_FRAME_RATE = 30.0; // 视频帧率。
    constexpr int64_t VIDEO_BITRATE = 1500000; // 视频码率，单位为bps。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, VIDEO_WIDTH); // 必须配置，视频像素宽。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, VIDEO_HEIGHT); // 必须配置，视频像素高。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12); // 必须配置，视频源数据排布格式。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_RANGE_FLAG, 0); // VUI（视频可用性信息），视频YUV值域标志，0:limited range 1:full range。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_COLOR_PRIMARIES, OH_ColorPrimary::COLOR_PRIMARY_BT709); // VUI，视频源色域。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                            OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_BT709); // VUI，OETF/EOTF曲线。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MATRIX_COEFFICIENTS,
                            OH_MatrixCoefficient::MATRIX_COEFFICIENT_BT709); // VUI，YUV和RGB转换矩阵。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_HEVCProfile::HEVC_PROFILE_MAIN); // 视频编码器profile。
    OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, VIDEO_FRAME_RATE); // 必须配置，视频帧率。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, -1); // 必须配置，接入帧间隔。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE,
                            OH_BitrateMode::BITRATE_MODE_CBR); // 必须配置，码控模式配置为CBR。
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, VIDEO_BITRATE); // 必须配置，设置码率，单位为bps。
    // 3. 配置视频编码器的编码参数。
    int32_t ret = OH_VideoEncoder_Configure(videoEnc, format);
    if (ret != AV_ERR_OK) {
        // 异常处理。
    }
    // 4. 配置完成后销毁AVFormat实例。
    OH_AVFormat_Destroy(format);
    // [End config_low_latency_cbr]
    std::string result = "低时延场景（视频通话CBR 1080p@30fps）：";
    if (videoEnc == nullptr) {
        return result + "H.265编码器创建失败。";
    }
    result += ret == AV_ERR_OK ? "编码器按推荐参数配置成功（示例验证后已销毁实例）。"
                               : "编码器配置失败，错误码: " + std::to_string(ret);
    OH_VideoEncoder_Destroy(videoEnc);
    return result;
}

std::string EncodingConfigQuery::DynamicRequestIdr()
{
    SAMPLE_LOGI("Run DynamicRequestIdr.");
    // 动态请求IDR要求编码器处于运行状态，此处先创建、配置并启动H.265编码器用于演示。
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
    if (videoEnc == nullptr) {
        return "运行中动态请求IDR帧：H.265编码器创建失败。";
    }
    int32_t ret = AV_ERR_OK;
    // 演示用最小视频规格，用于配置并启动编码器。
    constexpr int32_t DEMO_VIDEO_WIDTH = 320; // 演示用视频像素宽。
    constexpr int32_t DEMO_VIDEO_HEIGHT = 240; // 演示用视频像素高。
    OH_AVFormat *baseFormat =
        OH_AVFormat_CreateVideoFormat(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, DEMO_VIDEO_WIDTH, DEMO_VIDEO_HEIGHT);
    if (baseFormat != nullptr) {
        OH_AVFormat_SetIntValue(baseFormat, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
        ret = OH_VideoEncoder_Configure(videoEnc, baseFormat);
        OH_AVFormat_Destroy(baseFormat);
    }
    if (ret == AV_ERR_OK) {
        ret = OH_VideoEncoder_Start(videoEnc);
    }
    if (ret != AV_ERR_OK) {
        OH_VideoEncoder_Destroy(videoEnc);
        return "运行中动态请求IDR帧：编码器启动失败，错误码: " + std::to_string(ret);
    }
    // [Start config_dynamic_request_idr]
    // 1. 创建AVFormat参数实例。
    OH_AVFormat *format = OH_AVFormat_Create();
    // 2. 填充编码参数键值对（动态请求IDR帧）。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_REQUEST_I_FRAME, 1);
    // 3. 设置编码器参数生效。
    ret = OH_VideoEncoder_SetParameter(videoEnc, format);
    if (ret != AV_ERR_OK) {
        // 异常处理。
    }
    // 4. 配置完成后销毁AVFormat实例。
    OH_AVFormat_Destroy(format);
    // [End config_dynamic_request_idr]
    std::string result = "运行中动态请求IDR帧：";
    result += ret == AV_ERR_OK ? "动态请求IDR参数设置成功（示例验证后已停止并销毁实例）。"
                               : "动态参数设置失败，错误码: " + std::to_string(ret);
    OH_VideoEncoder_Stop(videoEnc);
    OH_VideoEncoder_Destroy(videoEnc);
    return result;
}

std::string EncodingConfigQuery::CbrhqConfig()
{
    SAMPLE_LOGI("Run CbrhqConfig.");
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
    // [Start config_cbrhq]
    // 1. 创建AVFormat参数实例。
    OH_AVFormat *format = OH_AVFormat_Create();
    if (format == nullptr) {
        // 异常处理。
    }
    // 2. 填充编码参数键值对（以1080p@15fps SDR输入源为例）。
    constexpr int32_t VIDEO_WIDTH = 1920; // 视频像素宽。
    constexpr int32_t VIDEO_HEIGHT = 1080; // 视频像素高。
    constexpr double VIDEO_FRAME_RATE = 15.0; // 视频帧率。
    constexpr int32_t VIDEO_I_FRAME_INTERVAL = 10000; // I帧间隔，单位为ms。
    constexpr int64_t VIDEO_BITRATE = 1520000; // 视频码率，单位为bps。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, VIDEO_WIDTH); // 必须配置，视频像素宽。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, VIDEO_HEIGHT); // 必须配置，视频像素高。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12); // 必须配置，视频源数据排布格式。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_RANGE_FLAG, 0); // VUI，视频YUV值域标志，0:limited range 1:full range。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_COLOR_PRIMARIES, OH_ColorPrimary::COLOR_PRIMARY_BT709); // VUI，视频源色域。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                            OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_BT709); // VUI，OETF/EOTF曲线。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MATRIX_COEFFICIENTS,
                            OH_MatrixCoefficient::MATRIX_COEFFICIENT_BT709); // VUI，YUV和RGB转换矩阵。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_HEVCProfile::HEVC_PROFILE_MAIN); // 视频编码器profile。
    OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, VIDEO_FRAME_RATE); // 必须配置，视频帧率。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, VIDEO_I_FRAME_INTERVAL); // 必须配置，接入帧间隔，单位为ms。

    // 3. 查询CBRHQ支持情况选择合适的码控配置。
    OH_AVCapability *cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true);
    if (cap == nullptr ||
        !OH_AVCapability_IsEncoderBitrateModeSupported(cap, OH_BitrateMode::BITRATE_MODE_CBR_HIGH_QUALITY)) {
        // 不支持CBRHQ，使用CBR代替。
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE,
                                OH_BitrateMode::BITRATE_MODE_CBR); // 必须配置，码控模式配置为CBR。
    } else {
        // 支持CBRHQ，配置CBRHQ码控模式。
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE,
                                OH_BitrateMode::BITRATE_MODE_CBR_HIGH_QUALITY); // 必须配置，码控模式配置为CBRHQ。
    }
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, VIDEO_BITRATE); // 必须配置，设置码率，单位为bps。

    // 4. 配置视频编码器的编码参数。
    int32_t ret = OH_VideoEncoder_Configure(videoEnc, format);
    if (ret != AV_ERR_OK) {
        // 异常处理。
    }
    // 5. 配置完成后销毁AVFormat实例。
    OH_AVFormat_Destroy(format);
    // [End config_cbrhq]
    // 结果文本组装与示例实例清理由辅助函数完成。
    return BuildEncodingResult("低时延场景（CBRHQ 1080p@15fps）：", cap, BITRATE_MODE_CBR_HIGH_QUALITY,
        "当前编码器支持CBRHQ，已按CBRHQ码控配置。", "当前编码器不支持CBRHQ，已自动降级为CBR码控配置。", ret, videoEnc);
}

std::string EncodingConfigQuery::LiveVbr()
{
    SAMPLE_LOGI("Run LiveVbr.");
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
    // [Start config_live_vbr]
    // 1. 创建AVFormat参数实例。
    OH_AVFormat *format = OH_AVFormat_Create();
    // 2. 填充编码参数键值对（以1080p@25fps SDR输入源为例）。
    constexpr int32_t VIDEO_WIDTH = 1920; // 视频像素宽。
    constexpr int32_t VIDEO_HEIGHT = 1080; // 视频像素高。
    constexpr double VIDEO_FRAME_RATE = 25.0; // 视频帧率。
    constexpr int32_t VIDEO_I_FRAME_INTERVAL = 2000; // I帧间隔，单位为ms。
    constexpr int64_t VIDEO_BITRATE = 3000000; // 视频码率，单位为bps。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, VIDEO_WIDTH); // 必须配置，视频像素宽。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, VIDEO_HEIGHT); // 必须配置，视频像素高。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12); // 必须配置，视频源数据排布格式。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_RANGE_FLAG, 0); // VUI，视频YUV值域标志，0:limited range 1:full range。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_COLOR_PRIMARIES, OH_ColorPrimary::COLOR_PRIMARY_BT709); // VUI，视频源色域。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                            OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_BT709); // VUI，OETF/EOTF曲线。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MATRIX_COEFFICIENTS,
                            OH_MatrixCoefficient::MATRIX_COEFFICIENT_BT709); // VUI，YUV和RGB转换矩阵。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_HEVCProfile::HEVC_PROFILE_MAIN); // 视频编码器profile。
    OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, VIDEO_FRAME_RATE); // 必须配置，视频帧率。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, VIDEO_I_FRAME_INTERVAL); // 必须配置，接入帧间隔，单位为ms。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE,
                            OH_BitrateMode::BITRATE_MODE_VBR); // 必须配置，码控模式配置为VBR。
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, VIDEO_BITRATE); // 必须配置，设置码率，单位为bps。
    // 3. 配置视频编码器的编码参数。
    int32_t ret = OH_VideoEncoder_Configure(videoEnc, format);
    if (ret != AV_ERR_OK) {
        // 异常处理。
    }
    // 4. 配置完成后销毁AVFormat实例。
    OH_AVFormat_Destroy(format);
    // [End config_live_vbr]
    std::string result = "实时流媒体场景（直播VBR 1080p@25fps）：";
    if (videoEnc == nullptr) {
        return result + "H.265编码器创建失败。";
    }
    result += ret == AV_ERR_OK ? "编码器按推荐参数配置成功（示例验证后已销毁实例）。"
                               : "编码器配置失败，错误码: " + std::to_string(ret);
    OH_VideoEncoder_Destroy(videoEnc);
    return result;
}

std::string EncodingConfigQuery::LiveSqr()
{
    SAMPLE_LOGI("Run LiveSqr.");
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
    // [Start config_live_sqr]
    // 1. 创建AVFormat参数实例。
    OH_AVFormat *format = OH_AVFormat_Create();
    // 2. 填充编码参数键值对（以1080p@25fps SDR输入源为例）。
    constexpr int32_t VIDEO_WIDTH = 1920; // 视频像素宽。
    constexpr int32_t VIDEO_HEIGHT = 1080; // 视频像素高。
    constexpr double VIDEO_FRAME_RATE = 25.0; // 视频帧率。
    constexpr int32_t VIDEO_I_FRAME_INTERVAL = 2000; // I帧间隔，单位为ms。
    constexpr int64_t VIDEO_BITRATE = 3000000; // 视频码率，单位为bps。
    constexpr int64_t VIDEO_MAX_BITRATE = 3000000; // 峰值码率，单位为bps。
    constexpr int32_t VIDEO_SQR_FACTOR = 25; // SQR质量因子，取值范围为[0, 51]，数值越小画质越高。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, VIDEO_WIDTH); // 必须配置，视频像素宽。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, VIDEO_HEIGHT); // 必须配置，视频像素高。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12); // 必须配置，视频源数据排布格式。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_RANGE_FLAG, 0); // VUI，视频YUV值域标志，0:limited range 1:full range。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_COLOR_PRIMARIES, OH_ColorPrimary::COLOR_PRIMARY_BT709); // VUI，视频源色域。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                            OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_BT709); // VUI，OETF/EOTF曲线。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MATRIX_COEFFICIENTS,
                            OH_MatrixCoefficient::MATRIX_COEFFICIENT_BT709); // VUI，YUV和RGB转换矩阵。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_HEVCProfile::HEVC_PROFILE_MAIN); // 视频编码器profile。
    OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, VIDEO_FRAME_RATE); // 必须配置，视频帧率。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, VIDEO_I_FRAME_INTERVAL); // 必须配置，接入帧间隔，单位为ms。

    // 3. 查询SQR支持情况选择合适的码控配置。
    OH_AVCapability *cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true);
    if (cap == nullptr || !OH_AVCapability_IsEncoderBitrateModeSupported(cap, OH_BitrateMode::BITRATE_MODE_SQR)) {
        // 不支持SQR，使用VBR代替。
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE,
                                OH_BitrateMode::BITRATE_MODE_VBR); // 必须配置，码控模式配置为VBR。
        OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, VIDEO_BITRATE); // 必须配置，设置码率，单位为bps。
    } else {
        // 支持SQR，配置SQR码控参数。
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE,
                                OH_BitrateMode::BITRATE_MODE_SQR); // 必须配置，码控模式配置为SQR。
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_SQR_FACTOR, VIDEO_SQR_FACTOR); // 必选配置，SQR质量因子。
        OH_AVFormat_SetLongValue(format, OH_MD_KEY_MAX_BITRATE, VIDEO_MAX_BITRATE); // 必须配置，设置峰值码率，单位为bps。
    }

    // 4. 配置视频编码器的编码参数。
    int32_t ret = OH_VideoEncoder_Configure(videoEnc, format);
    if (ret != AV_ERR_OK) {
        // 异常处理。
    }
    // 5. 配置完成后销毁AVFormat实例。
    OH_AVFormat_Destroy(format);
    // [End config_live_sqr]
    // 结果文本组装与示例实例清理由辅助函数完成。
    return BuildEncodingResult("实时流媒体场景（直播SQR 1080p@25fps）：", cap, BITRATE_MODE_SQR,
        "当前编码器支持SQR，已按SQR码控（质量因子25）配置。", "当前编码器不支持SQR，已自动降级为VBR码控配置。",
        ret, videoEnc);
}

std::string EncodingConfigQuery::OfflineVbr()
{
    SAMPLE_LOGI("Run OfflineVbr.");
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
    // [Start config_offline_vbr]
    // 1. 创建AVFormat参数实例。
    OH_AVFormat *format = OH_AVFormat_Create();
    // 2. 填充编码参数键值对（以1080p@30fps SDR输入源为例）。
    constexpr int32_t VIDEO_WIDTH = 1920; // 视频像素宽。
    constexpr int32_t VIDEO_HEIGHT = 1080; // 视频像素高。
    constexpr double VIDEO_FRAME_RATE = 30.0; // 视频帧率。
    constexpr int32_t VIDEO_I_FRAME_INTERVAL = 5000; // I帧间隔，单位为ms。
    constexpr int64_t VIDEO_BITRATE = 2100000; // 视频码率，单位为bps。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, VIDEO_WIDTH); // 必须配置，视频像素宽。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, VIDEO_HEIGHT); // 必须配置，视频像素高。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12); // 必须配置，视频源数据排布格式。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_RANGE_FLAG, 0); // VUI，视频YUV值域标志，0:limited range 1:full range。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_COLOR_PRIMARIES, OH_ColorPrimary::COLOR_PRIMARY_BT709); // VUI，视频源色域。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                            OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_BT709); // VUI，OETF/EOTF曲线。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MATRIX_COEFFICIENTS,
                            OH_MatrixCoefficient::MATRIX_COEFFICIENT_BT709); // VUI，YUV和RGB转换矩阵。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_HEVCProfile::HEVC_PROFILE_MAIN); // 视频编码器profile。
    OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, VIDEO_FRAME_RATE); // 必须配置，视频帧率。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, VIDEO_I_FRAME_INTERVAL); // 必须配置，接入帧间隔，单位为ms。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE,
                            OH_BitrateMode::BITRATE_MODE_VBR); // 必须配置，码控模式配置为VBR。
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, VIDEO_BITRATE); // 必须配置，设置码率，单位为bps。
    // 3. 配置视频编码器的编码参数。
    int32_t ret = OH_VideoEncoder_Configure(videoEnc, format);
    if (ret != AV_ERR_OK) {
        // 异常处理。
    }
    // 4. 配置完成后销毁AVFormat实例。
    OH_AVFormat_Destroy(format);
    // [End config_offline_vbr]
    std::string result = "离线编码场景（视频分享VBR 1080p@30fps）：";
    if (videoEnc == nullptr) {
        return result + "H.265编码器创建失败。";
    }
    result += ret == AV_ERR_OK ? "编码器按推荐参数配置成功（示例验证后已销毁实例）。"
                               : "编码器配置失败，错误码: " + std::to_string(ret);
    OH_VideoEncoder_Destroy(videoEnc);
    return result;
}

std::string EncodingConfigQuery::OfflineSqr()
{
    SAMPLE_LOGI("Run OfflineSqr.");
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_HEVC);
    // [Start config_offline_sqr]
    // 1. 创建AVFormat参数实例。
    OH_AVFormat *format = OH_AVFormat_Create();
    // 2. 填充编码参数键值对（以1080p@30fps SDR输入源为例）。
    constexpr int32_t VIDEO_WIDTH = 1920; // 视频像素宽。
    constexpr int32_t VIDEO_HEIGHT = 1080; // 视频像素高。
    constexpr double VIDEO_FRAME_RATE = 30.0; // 视频帧率。
    constexpr int32_t VIDEO_I_FRAME_INTERVAL = 5000; // I帧间隔，单位为ms。
    constexpr int64_t VIDEO_BITRATE = 2100000; // 视频码率，单位为bps。
    constexpr int64_t VIDEO_MAX_BITRATE = 2100000; // 峰值码率，单位为bps。
    constexpr int32_t VIDEO_SQR_FACTOR = 25; // SQR质量因子，取值范围为[0, 51]，数值越小画质越高。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, VIDEO_WIDTH); // 必须配置，视频像素宽。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, VIDEO_HEIGHT); // 必须配置，视频像素高。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12); // 必须配置，视频源数据排布格式。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_RANGE_FLAG, 0); // VUI，视频YUV值域标志，0:limited range 1:full range。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_COLOR_PRIMARIES, OH_ColorPrimary::COLOR_PRIMARY_BT709); // VUI，视频源色域。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_TRANSFER_CHARACTERISTICS,
                            OH_TransferCharacteristic::TRANSFER_CHARACTERISTIC_BT709); // VUI，OETF/EOTF曲线。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MATRIX_COEFFICIENTS,
                            OH_MatrixCoefficient::MATRIX_COEFFICIENT_BT709); // VUI，YUV和RGB转换矩阵。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, OH_HEVCProfile::HEVC_PROFILE_MAIN); // 视频编码器profile。
    OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, VIDEO_FRAME_RATE); // 必须配置，视频帧率。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, VIDEO_I_FRAME_INTERVAL); // 必须配置，接入帧间隔，单位为ms。

    // 3. 查询SQR支持情况选择合适的码控配置。
    OH_AVCapability *cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, true);
    if (cap == nullptr || !OH_AVCapability_IsEncoderBitrateModeSupported(cap, OH_BitrateMode::BITRATE_MODE_SQR)) {
        // 不支持SQR，使用VBR代替。
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE,
                                OH_BitrateMode::BITRATE_MODE_VBR); // 必须配置，码控模式配置为VBR。
        OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, VIDEO_BITRATE); // 必须配置，设置码率，单位为bps。
    } else {
        // 支持SQR，配置SQR码控参数。
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE,
                                OH_BitrateMode::BITRATE_MODE_SQR); // 必须配置，码控模式配置为SQR。
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_SQR_FACTOR, VIDEO_SQR_FACTOR); // 必选配置，SQR质量因子。
        OH_AVFormat_SetLongValue(format, OH_MD_KEY_MAX_BITRATE, VIDEO_MAX_BITRATE); // 必须配置，设置峰值码率，单位为bps。
    }

    // 4. 配置视频编码器的编码参数。
    int32_t ret = OH_VideoEncoder_Configure(videoEnc, format);
    if (ret != AV_ERR_OK) {
        // 异常处理。
    }
    // 5. 配置完成后销毁AVFormat实例。
    OH_AVFormat_Destroy(format);
    // [End config_offline_sqr]
    // 结果文本组装与示例实例清理由辅助函数完成。
    return BuildEncodingResult("离线编码场景（视频分享SQR 1080p@30fps）：", cap, BITRATE_MODE_SQR,
        "当前编码器支持SQR，已按SQR码控（质量因子25）配置。", "当前编码器不支持SQR，已自动降级为VBR码控配置。",
        ret, videoEnc);
}
