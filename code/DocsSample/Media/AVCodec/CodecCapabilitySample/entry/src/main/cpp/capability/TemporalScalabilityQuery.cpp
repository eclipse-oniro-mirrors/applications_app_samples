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

#include "TemporalScalabilityQuery.h"
#include "SampleLog.h"
#include <memory>
#include <shared_mutex>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_avbuffer.h>

namespace {
// 演示用轻量队列：代表业务侧维护的输入/输出数据队列，动态切换时需要清空。
struct DemoQueue {
    void Flush() {}
};

// 创建并按最小格式配置、启动编码器，用于动态开关时域可分层能力的场景演示。
OH_AVCodec *CreateRunningEncoder()
{
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    if (videoEnc == nullptr) {
        return nullptr;
    }
    OH_AVFormat *format = OH_AVFormat_CreateVideoFormat(OH_AVCODEC_MIMETYPE_VIDEO_AVC, 320, 240);
    if (format == nullptr) {
        OH_VideoEncoder_Destroy(videoEnc);
        return nullptr;
    }
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12);
    [[maybe_unused]] int32_t ret = OH_VideoEncoder_Configure(videoEnc, format);
    OH_AVFormat_Destroy(format);
    ret = OH_VideoEncoder_Start(videoEnc);
    if (ret != AV_ERR_OK) {
        OH_VideoEncoder_Destroy(videoEnc);
        return nullptr;
    }
    return videoEnc;
}
} // namespace

// 说明：以下为文档示例的输出回调实现，业务中注册到编码器后由输出轮转触发，
// 依据TGOP参数和编码出帧数目计算时域层级信息。此处保留定义供参考。
#if defined(__clang__)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-function"
#endif
namespace TemporalLayerDemo {
// [Start temporal_scalability_output_layer_by_tgop]
constexpr int32_t TGOP_SIZE = 3;
uint32_t outPoc = 0;
// 通过输出回调中有效帧数，获取TGOP内相对位置，对照配置确认层级。
static void OnNewOutputBuffer(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    struct OH_AVCodecBufferAttr attr;
    OH_AVErrCode ret = OH_AVBuffer_GetBufferAttr(buffer, &attr);
    if (ret != AV_ERR_OK) {
        // 异常处理。
    }
    // 刷新I帧后POC归零。
    if (attr.flags & AVCODEC_BUFFER_FLAGS_SYNC_FRAME) {
        outPoc = 0;
    }
    // 只有XPS的输出需要跳过。
    if (attr.flags != AVCODEC_BUFFER_FLAGS_CODEC_DATA) {
        int32_t tGopInner = outPoc % TGOP_SIZE;
        if (tGopInner == 0) {
            // 时域关键帧，后续传输、解码流程不可丢弃。
        } else {
            // 时域非关键帧，后续传输、解码流程可以丢弃。
        }
        outPoc++;
    }
}
// [End temporal_scalability_output_layer_by_tgop]
} // namespace TemporalLayerDemo
#if defined(__clang__)
#pragma clang diagnostic pop
#endif

// 文档示例代码：LTR随帧通路回调注册完整示例（Buffer输入模式）。回调实现与
// 注册步骤封装于独立命名空间参与编译，随帧参数经OH_AVBuffer参数通路随帧下发，
// 注册结果由LtrBufferCallbackRegister场景入口验证。
#if defined(__clang__)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-function"
#endif
namespace LtrBufferDemo {
// [Start ltr_buffer_callback_register]
// 2.1 编码输入回调OH_AVCodecOnNeedInputBuffer实现。
static void OnNeedInputBuffer(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    // 输入帧buffer对应的index，送入InIndexQueue队列。
    // 输入帧的数据buffer送入InBufferQueue队列。
    // 数据处理，请参考：
    // - 写入编码码流。
    // - 通知编码器码流结束。
    // - 随帧参数写入。
    OH_AVFormat *format = OH_AVBuffer_GetParameter(buffer);
    if (format == nullptr) {
        // 异常处理。
        return;
    }
    // 随帧参数写入：将当前帧标记为LTR帧，并指定参考的LTR帧POC号。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_PER_FRAME_MARK_LTR, 1);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODER_PER_FRAME_USE_LTR, 4);
    OH_AVBuffer_SetParameter(buffer, format);
    OH_AVFormat_Destroy(format);
    // 通知编码器buffer输入完成。
    OH_AVErrCode ret = OH_VideoEncoder_PushInputBuffer(codec, index);
    if (ret != AV_ERR_OK) {
        // 异常处理。
    }
}

// 2.2 编码输出回调OH_AVCodecOnNewOutputBuffer实现。
static void OnNewOutputBuffer(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    // 完成帧buffer对应的index，送入outIndexQueue队列。
    // 完成帧的数据buffer送入outBufferQueue队列。
    // 数据处理，请参考：
    // - 释放编码帧。
    // - 记录POC和LTR生效情况。
    // 获取出帧属性，出帧时间戳attr.pts可作为输入/输出轮转参数匹配的键值。
    struct OH_AVCodecBufferAttr attr;
    OH_AVErrCode ret = OH_AVBuffer_GetBufferAttr(buffer, &attr);
    if (ret != AV_ERR_OK) {
        // 异常处理。
        return;
    }
    // 记录POC和LTR生效情况：读取完成帧携带的帧POC与LTR标记，结合输入轮转中
    // 随帧下发的MARK_LTR/USE_LTR记录，核对参考结构是否符合预期。
    OH_AVFormat *format = OH_AVBuffer_GetParameter(buffer);
    if (format != nullptr) {
        int32_t framePoc = -1;
        int32_t isLtrFrame = 0;
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PER_FRAME_POC, &framePoc);
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PER_FRAME_IS_LTR, &isLtrFrame);
        OH_AVFormat_Destroy(format);
    }
    // 释放编码帧。
    ret = OH_VideoEncoder_FreeOutputBuffer(codec, index);
    if (ret != AV_ERR_OK) {
        // 异常处理。
    }
}

// 2.3 注册数据回调。
static OH_AVErrCode RegisterLtrBufferCallbacks(OH_AVCodec *videoEnc)
{
    // 零初始化，未注册的回调成员为空指针，框架触发对应事件时会跳过空回调。
    OH_AVCodecCallback cb = {};
    cb.onNeedInputBuffer = OnNeedInputBuffer;
    cb.onNewOutputBuffer = OnNewOutputBuffer;
    OH_AVErrCode ret = OH_VideoEncoder_RegisterCallback(videoEnc, cb, nullptr);
    if (ret != AV_ERR_OK) {
        // 异常处理。
    }
    return ret;
}
// [End ltr_buffer_callback_register]
} // namespace LtrBufferDemo
#if defined(__clang__)
#pragma clang diagnostic pop
#endif

// 文档示例代码：LTR随帧通路回调注册完整示例（Surface输入模式）。随帧参数经
// 随帧参数回调通路下发，注册结果由LtrSurfaceCallbackRegister场景入口验证。
#if defined(__clang__)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-function"
#endif
namespace LtrSurfaceDemo {
// [Start ltr_surface_callback_register]
// 2.1 编码输入参数回调OH_VideoEncoder_OnNeedInputParameter实现。
static void OnNeedInputParameter(OH_AVCodec *codec, uint32_t index, OH_AVFormat *parameter, void *userData)
{
    if (parameter == nullptr) {
        // 异常处理。
        return;
    }
    // 输入帧buffer对应的index，送入InIndexQueue队列。
    // 输入帧的数据avformat送入InFormatQueue队列。
    // 数据处理，请参考：
    // - 写入编码码流。
    // - 通知编码器码流结束。
    // - 随帧参数写入。
    // 随帧参数写入：将当前帧标记为LTR帧，并指定参考的LTR帧POC号。
    OH_AVFormat_SetIntValue(parameter, OH_MD_KEY_VIDEO_ENCODER_PER_FRAME_MARK_LTR, 1);
    OH_AVFormat_SetIntValue(parameter, OH_MD_KEY_VIDEO_ENCODER_PER_FRAME_USE_LTR, 4);
    // 通知编码器随帧参数配置输入完成。
    OH_AVErrCode ret = OH_VideoEncoder_PushInputParameter(codec, index);
    if (ret != AV_ERR_OK) {
        // 异常处理。
    }
}

// 2.2 编码输出回调OH_AVCodecOnNewOutputBuffer实现。
static void OnNewOutputBuffer(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    // 完成帧buffer对应的index，送入outIndexQueue队列。
    // 完成帧的数据buffer送入outBufferQueue队列。
    // 数据处理，请参考：
    // - 释放编码帧。
    // - 记录POC和LTR生效情况。
    // 获取出帧属性，出帧时间戳attr.pts可作为输入/输出轮转参数匹配的键值。
    struct OH_AVCodecBufferAttr attr;
    OH_AVErrCode ret = OH_AVBuffer_GetBufferAttr(buffer, &attr);
    if (ret != AV_ERR_OK) {
        // 异常处理。
        return;
    }
    // 记录POC和LTR生效情况：读取完成帧携带的帧POC与LTR标记，结合输入轮转中
    // 随帧下发的MARK_LTR/USE_LTR记录，核对参考结构是否符合预期。
    OH_AVFormat *format = OH_AVBuffer_GetParameter(buffer);
    if (format != nullptr) {
        int32_t framePoc = -1;
        int32_t isLtrFrame = 0;
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PER_FRAME_POC, &framePoc);
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PER_FRAME_IS_LTR, &isLtrFrame);
        OH_AVFormat_Destroy(format);
    }
    // 释放编码帧。
    ret = OH_VideoEncoder_FreeOutputBuffer(codec, index);
    if (ret != AV_ERR_OK) {
        // 异常处理。
    }
}

// 2.3 注册数据回调。
// 2.4 注册随帧参数回调。
static OH_AVErrCode RegisterLtrSurfaceCallbacks(OH_AVCodec *videoEnc)
{
    // 零初始化，未注册的回调成员为空指针，框架触发对应事件时会跳过空回调。
    OH_AVCodecCallback cb = {};
    cb.onNewOutputBuffer = OnNewOutputBuffer;
    OH_AVErrCode ret = OH_VideoEncoder_RegisterCallback(videoEnc, cb, nullptr);
    if (ret != AV_ERR_OK) {
        // 异常处理。
    }
    // 注册随帧参数回调，Surface输入模式下随帧参数经该通路随帧下发。
    OH_VideoEncoder_OnNeedInputParameter inParaCb = OnNeedInputParameter;
    OH_AVErrCode paramRet = OH_VideoEncoder_RegisterParameterCallback(videoEnc, inParaCb, nullptr);
    if (paramRet != AV_ERR_OK) {
        // 异常处理。
    }
    return ret != AV_ERR_OK ? ret : paramRet;
}
// [End ltr_surface_callback_register]
} // namespace LtrSurfaceDemo
#if defined(__clang__)
#pragma clang diagnostic pop
#endif

std::string TemporalScalabilityQuery::FeatureCheck()
{
    SAMPLE_LOGI("Run TemporalScalabilityFeatureCheck.");
    // [Start temporal_scalability_feature_check]
    // 1.1 获取对应视频编码器能力实例，此处以H.264为例。
    OH_AVCapability *cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true);
    // 1.2 通过特性能力查询接口校验是否支持全局时域可分层特性。
    bool isSupported = OH_AVCapability_IsFeatureSupported(cap, VIDEO_ENCODER_TEMPORAL_SCALABILITY);
    // [End temporal_scalability_feature_check]
    std::string result = "全局时域可分层特性校验：";
    if (cap == nullptr) {
        return result + "未获取到H.264编码器能力实例。";
    }
    result += "已获取系统推荐的H.264编码器能力实例。";
    result += "\n全局时域可分层特性支持情况: " + std::string(isSupported ? "支持" : "不支持");
    return result;
}

std::string TemporalScalabilityQuery::CreateEncoder()
{
    SAMPLE_LOGI("Run TemporalScalabilityCreateEncoder.");
    // [Start temporal_scalability_create_encoder]
    // 创建硬件编码器实例。
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    // [End temporal_scalability_create_encoder]
    std::string result = "使能全局时域可分层特性时创建硬件编码器实例：";
    if (videoEnc == nullptr) {
        return result + "H.264编码器创建失败。";
    }
    result += "已通过OH_VideoEncoder_CreateByMime创建H.264编码器。";
    OH_VideoEncoder_Destroy(videoEnc);
    return result + "（示例验证后已销毁实例）";
}

std::string TemporalScalabilityQuery::Configure()
{
    SAMPLE_LOGI("Run TemporalScalabilityConfigure.");
    // 场景示例中的videoEnc为视频编码器实例，此处先创建H.264编码器用于演示。
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    // [Start temporal_scalability_configure]
    constexpr int32_t TGOP_SIZE = 3; 
    // 2.1 创建配置用临时AVFormat。
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    if (format == nullptr) {
        // 异常处理。
    }
    // 2.2 填充使能参数键值对。
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_VIDEO_ENCODER_ENABLE_TEMPORAL_SCALABILITY, 1);
    // 2.3 (可选)填充TGOP大小和TGOP内参考模式键值对。
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_VIDEO_ENCODER_TEMPORAL_GOP_SIZE, TGOP_SIZE);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_VIDEO_ENCODER_TEMPORAL_GOP_REFERENCE_MODE, ADJACENT_REFERENCE);
    // 2.4 参数配置。
    int32_t ret = OH_VideoEncoder_Configure(videoEnc, format.get());
    if (ret != AV_ERR_OK) {
        // 异常处理。
    }
    // [End temporal_scalability_configure]
    std::string result = "设置全局时域可分层编码特性参数（TGOP=3，相邻参考模式）：";
    if (videoEnc == nullptr) {
        return result + "H.264编码器创建失败。";
    }
    result += ret == AV_ERR_OK ? "编码器配置成功（示例验证后已销毁实例）。"
                               : "编码器配置失败，错误码: " + std::to_string(ret);
    OH_VideoEncoder_Destroy(videoEnc);
    return result;
}

std::string TemporalScalabilityQuery::DynamicEnable()
{
    SAMPLE_LOGI("Run TemporalScalabilityDynamicEnable.");
    // 动态开关要求编码器处于运行状态，此处创建并启动编码器用于演示。
    OH_AVCodec *videoEnc = CreateRunningEncoder();
    if (videoEnc == nullptr) {
        return "动态开启时域可分层能力：编码器创建或启动失败。";
    }
    // 演示用互斥锁与输入/输出队列，代表业务侧的编码会话上下文。
    std::shared_mutex codecMutex;
    DemoQueue inQueue;
    DemoQueue outQueue;
    // [Start temporal_scalability_dynamic_enable]
    std::unique_lock<std::shared_mutex> lock(codecMutex);
    // 重置编码器videoEnc。
    OH_AVErrCode resetRet = OH_VideoEncoder_Reset(videoEnc);
    if (resetRet != AV_ERR_OK) {
        // 异常处理。
    }
    inQueue.Flush();
    outQueue.Flush();
    // 重新配置编码器参数。
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    if (format == nullptr) {
        // 异常处理。
    }
    // 配置时域可分层编码特性参数。
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_VIDEO_ENCODER_ENABLE_TEMPORAL_SCALABILITY, 1);
    constexpr int32_t TGOP_SIZE = 3;
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_VIDEO_ENCODER_TEMPORAL_GOP_SIZE, TGOP_SIZE);
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_VIDEO_ENCODER_TEMPORAL_GOP_REFERENCE_MODE, ADJACENT_REFERENCE);
    OH_AVErrCode configRet = OH_VideoEncoder_Configure(videoEnc, format.get());
    if (configRet != AV_ERR_OK) {
        // 异常处理。
    }
    // 编码器重新就绪。
    OH_AVErrCode prepareRet = OH_VideoEncoder_Prepare(videoEnc);
    if (prepareRet != AV_ERR_OK) {
        // 异常处理。
    }
    // [End temporal_scalability_dynamic_enable]
    std::string result = "动态开启时域可分层能力：";
    result += resetRet == AV_ERR_OK ? "编码器重置成功。" : "编码器重置失败，错误码: " + std::to_string(resetRet);
    result += configRet == AV_ERR_OK ? "时域分层参数重新配置成功。" : "参数配置失败，错误码: " + std::to_string(configRet);
    result += prepareRet == AV_ERR_OK ? "编码器已重新就绪。" : "编码器就绪失败，错误码: " + std::to_string(prepareRet);
    OH_VideoEncoder_Destroy(videoEnc);
    return result + "（示例验证后已销毁实例）";
}

std::string TemporalScalabilityQuery::DynamicDisable()
{
    SAMPLE_LOGI("Run TemporalScalabilityDynamicDisable.");
    OH_AVCodec *videoEnc = CreateRunningEncoder();
    if (videoEnc == nullptr) {
        return "动态关闭时域可分层能力：编码器创建或启动失败。";
    }
    std::shared_mutex codecMutex;
    DemoQueue inQueue;
    DemoQueue outQueue;
    // [Start temporal_scalability_dynamic_disable]
    std::unique_lock<std::shared_mutex> lock(codecMutex);
    // 重置编码器videoEnc。
    OH_AVErrCode resetRet = OH_VideoEncoder_Reset(videoEnc);
    if (resetRet != AV_ERR_OK) {
        // 异常处理。
    }
    inQueue.Flush();
    outQueue.Flush();
    // 重新配置编码器参数。
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    if (format == nullptr) {
        // 异常处理。
    }
    // 配置时域可分层编码特性参数。
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_VIDEO_ENCODER_ENABLE_TEMPORAL_SCALABILITY, 0);
    OH_AVErrCode configRet = OH_VideoEncoder_Configure(videoEnc, format.get());
    if (configRet != AV_ERR_OK) {
        // 异常处理。
    }
    // 编码器重新就绪。
    OH_AVErrCode prepareRet = OH_VideoEncoder_Prepare(videoEnc);
    if (prepareRet != AV_ERR_OK) {
        // 异常处理。
    }
    // [End temporal_scalability_dynamic_disable]
    std::string result = "动态关闭时域可分层能力：";
    result += resetRet == AV_ERR_OK ? "编码器重置成功。" : "编码器重置失败，错误码: " + std::to_string(resetRet);
    result += configRet == AV_ERR_OK ? "编码参数已恢复普通编码模式。" : "参数配置失败，错误码: " + std::to_string(configRet);
    result += prepareRet == AV_ERR_OK ? "编码器已重新就绪。" : "编码器就绪失败，错误码: " + std::to_string(prepareRet);
    OH_VideoEncoder_Destroy(videoEnc);
    return result + "（示例验证后已销毁实例）";
}

std::string TemporalScalabilityQuery::LtrFeatureCheck()
{
    SAMPLE_LOGI("Run LtrFeatureCheck.");
    // [Start ltr_feature_check]
    constexpr int32_t NEEDED_LTR_COUNT = 5;
    bool isSupported = false;
    int32_t supportedLTRCount = 0;
    // 1.1 获取对应编码器能力实例，此处以H.264为例。
    OH_AVCapability *cap = OH_AVCodec_GetCapability(OH_AVCODEC_MIMETYPE_VIDEO_AVC, true);
    // 1.2 通过特性能力查询接口校验是否支持LTR特性。
    isSupported = OH_AVCapability_IsFeatureSupported(cap, VIDEO_ENCODER_LONG_TERM_REFERENCE);
    // 1.3 确定支持的LTR数目。
    if (isSupported) {
        OH_AVFormat *properties = OH_AVCapability_GetFeatureProperties(cap, VIDEO_ENCODER_LONG_TERM_REFERENCE);
        if (!OH_AVFormat_GetIntValue(properties, OH_FEATURE_PROPERTY_KEY_VIDEO_ENCODER_MAX_LTR_FRAME_COUNT, &supportedLTRCount)) {
            // 异常处理。
        }
        OH_AVFormat_Destroy(properties);
        // 1.4 判断LTR是否满足结构需求。
        isSupported = supportedLTRCount >= NEEDED_LTR_COUNT;
    }
    // [End ltr_feature_check]
    std::string result = "LTR特性校验：";
    if (cap == nullptr) {
        return result + "未获取到H.264编码器能力实例。";
    }
    result += "LTR特性支持情况: " + std::string(isSupported ? "支持" : "不支持");
    result += "\n当前编码器支持的最大LTR数目: " + std::to_string(supportedLTRCount);
    result += "\n按4层时域分层结构需求（5个LTR）评估: " +
        std::string(supportedLTRCount >= 5 ? "满足" : "不满足");
    return result;
}

std::string TemporalScalabilityQuery::LtrConfigCount()
{
    SAMPLE_LOGI("Run LtrConfigCount.");
    // 场景示例中的videoEnc为视频编码器实例，此处先创建H.264编码器用于演示。
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    // [Start ltr_configure_count]
    constexpr int32_t NEEDED_LTR_COUNT = 5;
    // 3.1 创建配置用临时AVFormat。
    auto format = std::shared_ptr<OH_AVFormat>(OH_AVFormat_Create(), OH_AVFormat_Destroy);
    if (format == nullptr) {
        // 异常处理。
    }
    // 3.2 填充使能LTR个数键值对。
    OH_AVFormat_SetIntValue(format.get(), OH_MD_KEY_VIDEO_ENCODER_LTR_FRAME_COUNT, NEEDED_LTR_COUNT);
    // 3.3 参数配置。
    int32_t ret = OH_VideoEncoder_Configure(videoEnc, format.get());
    if (ret != AV_ERR_OK) {
        // 异常处理。
    }
    // [End ltr_configure_count]
    std::string result = "配置阶段设置最大LTR数目（5个）：";
    if (videoEnc == nullptr) {
        return result + "H.264编码器创建失败。";
    }
    result += ret == AV_ERR_OK ? "LTR数目参数配置成功（示例验证后已销毁实例）。"
                               : "参数配置失败，错误码: " + std::to_string(ret);
    OH_VideoEncoder_Destroy(videoEnc);
    return result;
}

std::string TemporalScalabilityQuery::LtrBufferCallbackRegister()
{
    SAMPLE_LOGI("Run LtrBufferCallbackRegister.");
    // 场景示例中的videoEnc为视频编码器实例，此处先创建H.264编码器用于演示。
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    std::string result = "LTR随帧通路回调注册（Buffer输入模式）：";
    if (videoEnc == nullptr) {
        return result + "H.264编码器创建失败。";
    }
    // 回调注册需在编码器Prepare之前完成，随帧参数通过OH_AVBuffer参数通路随帧
    // 下发，回调实现见ltr_buffer_callback_register片段。
    OH_AVErrCode ret = LtrBufferDemo::RegisterLtrBufferCallbacks(videoEnc);
    result += ret == AV_ERR_OK ? "数据回调注册成功，输入/输出回调已就绪。"
                               : "数据回调注册失败，错误码: " + std::to_string(ret);
    OH_VideoEncoder_Destroy(videoEnc);
    return result + "（示例验证后已销毁实例）";
}

std::string TemporalScalabilityQuery::LtrSurfaceCallbackRegister()
{
    SAMPLE_LOGI("Run LtrSurfaceCallbackRegister.");
    // 场景示例中的videoEnc为视频编码器实例，此处先创建H.264编码器用于演示。
    OH_AVCodec *videoEnc = OH_VideoEncoder_CreateByMime(OH_AVCODEC_MIMETYPE_VIDEO_AVC);
    std::string result = "LTR随帧通路回调注册（Surface输入模式）：";
    if (videoEnc == nullptr) {
        return result + "H.264编码器创建失败。";
    }
    // 输出数据回调与随帧参数回调均需在编码器Configure/Prepare之前注册，
    // 随帧参数经OnNeedInputParameter参数通路随帧下发，实现见ltr_surface_callback_register片段。
    OH_AVErrCode ret = LtrSurfaceDemo::RegisterLtrSurfaceCallbacks(videoEnc);
    result += ret == AV_ERR_OK ? "输出数据回调与随帧参数回调注册成功。"
                               : "回调注册失败，错误码: " + std::to_string(ret);
    OH_VideoEncoder_Destroy(videoEnc);
    return result + "（示例验证后已销毁实例）";
}
