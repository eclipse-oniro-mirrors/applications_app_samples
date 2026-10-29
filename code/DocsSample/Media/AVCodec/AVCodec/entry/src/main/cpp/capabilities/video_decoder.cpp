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

#include "video_decoder.h"
#include "codec_capability.h"

#undef LOG_TAG
#define LOG_TAG "VideoDecoder"

namespace {
constexpr int LIMIT_LOGD_FREQUENCY = 50;
constexpr int ROTATION_ANGLE = 90;

// 该能力依赖API 26 Native SDK中的智能流畅Key和枚举。
// 兼容旧SDK时，可将AVCODEC_SAMPLE_ENABLE_SMART_FLUENCY设为OFF。
#ifdef AVCODEC_SAMPLE_ENABLE_SMART_FLUENCY
// [Start configure_full_baseline]
bool ConfigureSmartFluency(OH_AVFormat *format)
{
    bool ret = OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_DECODER_FRAME_RETENTION_MODE,
        OH_FRAME_RETENTION_MODE_FULL);
    CHECK_AND_RETURN_RET_LOG(ret, false, "Set smart fluency initial mode failed");
    return true;
}
// [End configure_full_baseline]
#else
bool ConfigureSmartFluency(OH_AVFormat *format)
{
    (void)format;
    AVCODEC_SAMPLE_LOGW("Smart fluency is not enabled in current native SDK build");
    return true;
}
#endif

bool SetOptionalFormatFeatures(OH_AVFormat *format, const SampleInfo &sampleInfo)
{
    const bool usesSurfaceOutput = sampleInfo.video.window != nullptr;
    if (usesSurfaceOutput) {
        const int32_t blankFrameOnShutdown = sampleInfo.codec.retainLastFrame ? 0 : 1;
        if (!OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_DECODER_BLANK_FRAME_ON_SHUTDOWN,
            blankFrameOnShutdown)) {
            AVCODEC_SAMPLE_LOGE("Set blank-frame-on-shutdown failed, retain last frame: %{public}d",
                sampleInfo.codec.retainLastFrame);
            return false;
        }
    }
    if (sampleInfo.codec.enableLowLatency &&
        !OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENABLE_LOW_LATENCY, 1)) {
        AVCODEC_SAMPLE_LOGE("Set video low-latency mode failed");
        return false;
    }
    if (sampleInfo.codec.outputInDecodingOrder &&
        !OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_DECODER_OUTPUT_IN_DECODING_ORDER, 1)) {
        AVCODEC_SAMPLE_LOGE("Set decoding-order output failed");
        return false;
    }
    if (usesSurfaceOutput && sampleInfo.codec.convertHdrVividToBt709 &&
        sampleInfo.video.hdrVividContainerSignaled &&
        !OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_DECODER_OUTPUT_COLOR_SPACE, OH_COLORSPACE_BT709_LIMIT)) {
        AVCODEC_SAMPLE_LOGE("Set HDR Vivid to BT.709 output color space failed");
        return false;
    }
    // [Start decoder_sync_mode]
    // 同步模式配置。
    if (sampleInfo.codec.codecSyncMode) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, sampleInfo.codec.codecSyncMode);
    }
    // [End decoder_sync_mode]
    if (sampleInfo.codec.isSmartFluencySupported && !ConfigureSmartFluency(format)) {
        return false;
    }
    return true;
}
} // namespace

VideoDecoder::~VideoDecoder() { Release(); }
// [Start decoder_create_byname]
// 通过codec name创建解码器，应用有特殊需求，比如选择支持某种分辨率规格的解码器，可先查询capability，再根据codec name创建解码器。
OH_AVCodec *VideoDecoder::GetCodecByCategory(const char *mime, bool isEncoder, OH_AVCodecCategory category)
{
    OH_AVCapability *capability = OH_AVCodec_GetCapabilityByCategory(mime, isEncoder, category);
    CHECK_AND_RETURN_RET_LOG(capability != nullptr, nullptr, "Capability is nullptr");
    const char *codecName = OH_AVCapability_GetName(capability);
    CHECK_AND_RETURN_RET_LOG(codecName != nullptr, nullptr, "Codec name is nullptr");
    return OH_VideoDecoder_CreateByName(codecName);
}
// [End decoder_create_byname]

// [Start decoder_create_bymime]
// 通过MIME TYPE创建解码器，只能创建系统推荐的特定编解码器。
// 涉及创建多路编解码器时，优先创建硬件解码器实例，硬件资源不够时再创建软件解码器实例。
OH_AVCodec *VideoDecoder::GetCodecByMime(const char *mime)
{
    CHECK_AND_RETURN_RET_LOG(mime != nullptr, nullptr, "Codec mime is nullptr");
    return OH_VideoDecoder_CreateByMime(mime);
}
// [End decoder_create_bymime]

// [Start decoder_set_surface]
// 设置解码器的送显窗口。调用时必须已经完成Configure，window的生命周期由调用方保证。
int32_t VideoDecoder::SetSurface(OHNativeWindow *window)
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");
    CHECK_AND_RETURN_RET_LOG(window != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Surface window is null");
    const int32_t ret = OH_VideoDecoder_SetSurface(decoder_, window);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Set surface failed, ret: %{public}d", ret);
    // 配置视频与显示屏匹配模式（缓冲区按原比例缩放，使得缓冲区的较小边与窗口匹配，较长边超出窗口的部分被视为透明）。
    // 可选缩放接口：OH_NativeWindow_NativeWindowSetScalingModeV2(nativeWindow, OH_SCALING_MODE_SCALE_CROP_V2);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End decoder_set_surface]

// [Start decoder_prepare]
// 申请解码器运行所需资源。Prepare成功后才能调用Start。
int32_t VideoDecoder::Prepare()
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");
    const int32_t ret = OH_VideoDecoder_Prepare(decoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Prepare failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End decoder_prepare]

int32_t VideoDecoder::Create(const std::string &videoCodecMime, int32_t videoDecoderType)
{
    CHECK_AND_RETURN_RET_LOG(decoder_ == nullptr, AVCODEC_SAMPLE_ERR_ERROR,
        "Decoder already exists, release it before creating another one");
    switch (videoDecoderType) {
        case AUTO:
            decoder_ = GetCodecByMime(videoCodecMime.c_str());
            CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Create failed");
            break;
        case VIDEO_HW_DECODER:
            if (!strcmp(videoCodecMime.data(), "video/avc")) {
                decoder_ = GetCodecByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, HARDWARE);
            } else if (!strcmp(videoCodecMime.data(), "video/hevc")) {
                decoder_ = GetCodecByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, HARDWARE);
            } else if (!strcmp(videoCodecMime.data(), "video/vvc")) {
                decoder_ = GetCodecByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VVC, false, HARDWARE);
            } else {
                AVCODEC_SAMPLE_LOGE("INVALID MIMETYPE");
                return AVCODEC_SAMPLE_ERR_ERROR;
            }
            break;
        case VIDEO_SW_DECODER:
            if (!strcmp(videoCodecMime.data(), "video/avc")) {
                decoder_ = GetCodecByCategory(OH_AVCODEC_MIMETYPE_VIDEO_AVC, false, SOFTWARE);
            } else if (!strcmp(videoCodecMime.data(), "video/hevc")) {
                decoder_ = GetCodecByCategory(OH_AVCODEC_MIMETYPE_VIDEO_HEVC, false, SOFTWARE);
            } else if (!strcmp(videoCodecMime.data(), "video/vvc")) {
                decoder_ = GetCodecByCategory(OH_AVCODEC_MIMETYPE_VIDEO_VVC, false, SOFTWARE);
            } else {
                decoder_ = GetCodecByCategory(videoCodecMime.data(), false, SOFTWARE);
                if (decoder_ == nullptr) {
                    AVCODEC_SAMPLE_LOGE("INVALID MIMETYPE");
                    return AVCODEC_SAMPLE_ERR_ERROR;
                }
            }
            break;
        }
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoDecoder::CreateByName(const std::string &codecName)
{
    CHECK_AND_RETURN_RET_LOG(!codecName.empty(), AVCODEC_SAMPLE_ERR_ERROR, "Codec name is empty");
    CHECK_AND_RETURN_RET_LOG(decoder_ == nullptr, AVCODEC_SAMPLE_ERR_ERROR,
        "Decoder already exists, release it before creating another one");

    // 名称通常来自能力查询结果。由封装类持有decoder_，避免调用方遗漏Destroy。
    decoder_ = OH_VideoDecoder_CreateByName(codecName.c_str());
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR,
        "Create decoder by name failed, name: %{public}s", codecName.c_str());
    return AVCODEC_SAMPLE_ERR_OK;
}

// [Start decoder_set_callback]
// 配置异步回调，调用OH_VideoDecoder_RegisterCallback()接口。
// 注册回调包括：解码器运行错误OH_AVCodecOnError、码流信息变化OH_AVCodecOnStreamChanged、
// 输入回调OH_AVCodecOnNeedInputBuffer、输出回调OH_AVCodecOnNewOutputBuffer。
int32_t VideoDecoder::SetCallback(CodecUserData *codecUserData)
{
    int32_t ret = AV_ERR_OK;
    ret = OH_VideoDecoder_RegisterCallback(decoder_,
                                           {SampleCallback::OnCodecError, SampleCallback::OnCodecFormatChange,
                                            SampleCallback::OnNeedInputBuffer, SampleCallback::OnNewOutputBuffer},
                                           codecUserData);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Set callback failed, ret: %{public}d", ret);

    return AVCODEC_SAMPLE_ERR_OK;
}
// [End decoder_set_callback]

// [Start decoder_configure]
int32_t VideoDecoder::Configure(const SampleInfo &sampleInfo)
{
    // 建议在配置解码器前进行能力校验，确认当前设备是否支持配置的参数。
    // [StartExclude decoder_configure]
    CHECK_AND_RETURN_RET_LOG(CodecCapability::ValidateVideoConfiguration(sampleInfo, false),
        AVCODEC_SAMPLE_ERR_ERROR, "Video decoder configuration is not supported");
    CHECK_AND_RETURN_RET_LOG(CodecCapability::ValidateVideoFeatureConfiguration(sampleInfo),
        AVCODEC_SAMPLE_ERR_ERROR, "Video decoder feature configuration is not supported");
    // [EndExclude decoder_configure]
    OH_AVFormat *format = OH_AVFormat_Create();
    CHECK_AND_RETURN_RET_LOG(format != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "AVFormat create failed");

    OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, sampleInfo.video.videoWidth);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, sampleInfo.video.videoHeight);
    OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, sampleInfo.video.frameRate);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, sampleInfo.video.pixelFormat);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_ROTATION, sampleInfo.video.rotation);
    // [StartExclude decoder_configure]
    // 可选配置，开发者可根据业务需要进行配置，如：低时延解码配置。
    if (!SetOptionalFormatFeatures(format, sampleInfo)) {
        OH_AVFormat_Destroy(format);
        return AVCODEC_SAMPLE_ERR_ERROR;
    }

    AVCODEC_SAMPLE_LOGI("Configure decoder: run mode=%{public}d, type=%{public}d, size=%{public}dx%{public}d, "
        "frame rate=%{public}.2f, pixel format=%{public}d, rotation=%{public}d, retain last frame=%{public}d, "
        "low latency=%{public}d, decoding order=%{public}d, smart fluency=%{public}d, HDR Vivid=%{public}d, "
        "BT.709 conversion=%{public}d", sampleInfo.codec.codecRunMode, sampleInfo.codec.codecType,
        sampleInfo.video.videoWidth, sampleInfo.video.videoHeight, sampleInfo.video.frameRate,
        sampleInfo.video.pixelFormat, sampleInfo.video.rotation, sampleInfo.codec.retainLastFrame,
        sampleInfo.codec.enableLowLatency, sampleInfo.codec.outputInDecodingOrder,
        sampleInfo.codec.isSmartFluencySupported, sampleInfo.video.hdrVividContainerSignaled,
        sampleInfo.codec.convertHdrVividToBt709);
    // [EndExclude decoder_configure]
    int ret = OH_VideoDecoder_Configure(decoder_, format);
    OH_AVFormat_Destroy(format);
    format = nullptr;
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Config failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End decoder_configure]

int32_t VideoDecoder::Config(const SampleInfo &sampleInfo, CodecUserData *codecUserData)
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");
    CHECK_AND_RETURN_RET_LOG(codecUserData != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Invalid param: codecUserData");

    int32_t ret = Configure(sampleInfo);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Configure failed");

    if (sampleInfo.video.window != nullptr) {
        ret = SetSurface(sampleInfo.video.window);
        CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK && sampleInfo.video.window, AVCODEC_SAMPLE_ERR_ERROR,
                                 "Set surface failed, ret: %{public}d", ret);
    }

    if (!sampleInfo.codec.codecSyncMode) {
        ret = SetCallback(codecUserData);
        CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
                                 "Set callback failed, ret: %{public}d", ret);
    }

    ret = Prepare();
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Prepare failed, ret: %{public}d", ret);

    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoDecoder::QueryInputBuffer(uint32_t &bufferIndex, int64_t timeoutUs)
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");

    // 查询成功后，bufferIndex仅在对应Buffer被PushInputBuffer归还前有效。
    const int32_t ret = OH_VideoDecoder_QueryInputBuffer(decoder_, &bufferIndex, timeoutUs);
    if (ret == AV_ERR_TRY_AGAIN_LATER) {
        return AVCODEC_SAMPLE_ERR_AGAIN;
    }
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Query input buffer failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

OH_AVBuffer *VideoDecoder::GetInputBuffer(uint32_t bufferIndex)
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, nullptr, "Decoder is null");

    // 返回的Buffer由codec管理，调用方只能在PushInputBuffer前读取或写入其内容。
    OH_AVBuffer *buffer = OH_VideoDecoder_GetInputBuffer(decoder_, bufferIndex);
    CHECK_AND_RETURN_RET_LOG(buffer != nullptr, nullptr, "Input buffer is null, index: %{public}u", bufferIndex);
    return buffer;
}

// [Start decoder_sync_get_inputbuffer]
int32_t VideoDecoder::GetInputBuffer(CodecBufferInfo &info, int64_t timeoutUs)
{
    info.buffer = nullptr;
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");
    int32_t ret = OH_VideoDecoder_QueryInputBuffer(decoder_, &info.bufferIndex, timeoutUs);
    switch (ret) {
        case AV_ERR_OK: {
            OH_AVBuffer *buffer = OH_VideoDecoder_GetInputBuffer(decoder_, info.bufferIndex);
            CHECK_AND_RETURN_RET_LOG(buffer != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Input buffer is null");
            info.buffer = buffer;
            /**
             * // 示例：调用方将待解码帧的数据与属性写入Buffer。
             * uint8_t *addr = OH_AVBuffer_GetAddr(buffer);
             * CHECK_AND_RETURN_RET_LOG(addr != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Input buffer addr is null");
             * // Buffer数据填充。
             * int32_t capacity = OH_AVBuffer_GetCapacity(buffer);
             * if (size > capacity) {
             *     // 异常处理。
             * }
             * memcpy(addr, frameData, size);
             * OH_AVCodecBufferAttr attrInfo;
             * // Buffer属性配置。
             * // 配置帧数据的输入尺寸、偏移量、时间戳等字段信息。
             * attrInfo.size = size;
             * attrInfo.offset = offset;
             * attrInfo.pts = pts;
             * if (inFile_->eof()) {
             *     attrInfo.flags = AVCODEC_BUFFER_FLAGS_EOS;
             * } else {
             *     attrInfo.flags = flags;
             * }
             * OH_AVErrCode setBufferRet = OH_AVBuffer_SetBufferAttr(buffer, &attrInfo);
             * if (setBufferRet != AV_ERR_OK) {
             *     // 异常处理。
             * }
             */
            return AVCODEC_SAMPLE_ERR_OK;
        }
        case AV_ERR_TRY_AGAIN_LATER: {
            AVCODEC_SAMPLE_LOGE("Get input buffer timeout.");
            return AVCODEC_SAMPLE_ERR_AGAIN;
        }
        default: {
            AVCODEC_SAMPLE_LOGE("Query input buffer failed, ret: %{public}d", ret);
            return AVCODEC_SAMPLE_ERR_ERROR;
        }
    }
    return AVCODEC_SAMPLE_ERR_ERROR;
}
// [End decoder_sync_get_inputbuffer]

int32_t VideoDecoder::QueryOutputBuffer(uint32_t &bufferIndex, int64_t timeoutUs)
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");

    // 查询成功后必须尽快送显或释放该索引，否则codec的输出队列会被阻塞。
    const int32_t ret = OH_VideoDecoder_QueryOutputBuffer(decoder_, &bufferIndex, timeoutUs);
    if (ret == AV_ERR_TRY_AGAIN_LATER) {
        return AVCODEC_SAMPLE_ERR_AGAIN;
    }
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Query output buffer failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

OH_AVBuffer *VideoDecoder::GetOutputBuffer(uint32_t bufferIndex)
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, nullptr, "Decoder is null");

    // 输出Buffer归还后可能立即由codec复用，调用方不得缓存其地址或跨线程长期持有。
    OH_AVBuffer *buffer = OH_VideoDecoder_GetOutputBuffer(decoder_, bufferIndex);
    CHECK_AND_RETURN_RET_LOG(buffer != nullptr, nullptr, "Output buffer is null, index: %{public}u", bufferIndex);
    return buffer;
}

// [Start decoder_sync_get_outputbuffer]
int32_t VideoDecoder::GetOutputBuffer(CodecBufferInfo &info, int64_t timeoutUs)
{
    info.buffer = nullptr;
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null.");

    int32_t ret = OH_VideoDecoder_QueryOutputBuffer(decoder_, &info.bufferIndex, timeoutUs);
    switch (ret) {
        case AV_ERR_OK: {
            OH_AVBuffer *buffer = OH_VideoDecoder_GetOutputBuffer(decoder_, info.bufferIndex);
            CHECK_AND_RETURN_RET_LOG(buffer != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Output buffer is null");
            OH_AVErrCode getBufferRet = OH_AVBuffer_GetBufferAttr(buffer, &info.attr);
            CHECK_AND_RETURN_RET_LOG(getBufferRet == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
                "Get buffer attr error, ret: %{public}d", getBufferRet);
            info.buffer = buffer;
            // 开发者可根据业务需要，对输出数据进行送显/保存/释放处理。
            return AVCODEC_SAMPLE_ERR_OK;
        }
        case AV_ERR_TRY_AGAIN_LATER: {
            AVCODEC_SAMPLE_LOGD("Get output buffer timeout.");
            return AVCODEC_SAMPLE_ERR_AGAIN;
        }
        case AV_ERR_STREAM_CHANGED: {
            int32_t width = 0;
            int32_t height = 0;
            auto format =
                std::shared_ptr<OH_AVFormat>(OH_VideoDecoder_GetOutputDescription(decoder_), OH_AVFormat_Destroy);
            CHECK_AND_BREAK_LOG(format != nullptr, "Format is nullptr.");
            // 获取到变化后的视频宽、高、跨距。
            bool getIntRet = OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_VIDEO_PIC_WIDTH, &width) &&
                             OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_VIDEO_PIC_HEIGHT, &height);
            /**
             * OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_VIDEO_STRIDE, &widthStride);
             * OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_VIDEO_SLICE_HEIGHT, &heightStride);
             * 获取裁剪矩形信息可选。
             * OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_VIDEO_CROP_TOP, &cropTop);
             * OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_VIDEO_CROP_BOTTOM, &cropBottom);
             * OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_VIDEO_CROP_LEFT, &cropLeft);
             * OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_VIDEO_CROP_RIGHT, &cropRight);
             */
            CHECK_AND_BREAK_LOG(getIntRet, "Decoder get int value failed.");
            AVCODEC_SAMPLE_LOGI("Stream Changed. Width: %{public}i, height: %{public}i", width, height);
            return GetOutputBuffer(info, timeoutUs);
        }
        default: {
            AVCODEC_SAMPLE_LOGE("Query output buffer failed, ret: %{public}d", ret);
            return AVCODEC_SAMPLE_ERR_ERROR;
        }
    }
    return AVCODEC_SAMPLE_ERR_ERROR;
}
// [End decoder_sync_get_outputbuffer]

// [Start decoder_start]
int32_t VideoDecoder::Start()
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");

    int ret = OH_VideoDecoder_Start(decoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Start failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End decoder_start]

// [Start decoder_stop]
int32_t VideoDecoder::Stop()
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");

    const int32_t ret = OH_VideoDecoder_Stop(decoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Stop failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End decoder_stop]

// [Start decoder_flush]
int32_t VideoDecoder::Flush()
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");
    const int32_t ret = OH_VideoDecoder_Flush(decoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Flush failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End decoder_flush]

// [Start decoder_reset]
int32_t VideoDecoder::Reset()
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");

    // Reset将codec恢复到初始状态。之后必须重新Configure、SetSurface（Surface模式）和Prepare。
    const int32_t ret = OH_VideoDecoder_Reset(decoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Reset failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End decoder_reset]

// [Start decoder_push_input_buffer]
// 送入解码输入队列进行解码，将填充好码流数据的Buffer推送给解码器。
int32_t VideoDecoder::PushInputBuffer(CodecBufferInfo &info)
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");
    CHECK_AND_RETURN_RET_LOG(info.buffer != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Input buffer is null");
    int32_t ret = OH_VideoDecoder_PushInputBuffer(decoder_, info.bufferIndex);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Push input data failed");
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End decoder_push_input_buffer]

int32_t VideoDecoder::RenderOutputBuffer(uint32_t bufferIndex)
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");

    // 显示并释放解码帧。
    const int32_t ret = OH_VideoDecoder_RenderOutputBuffer(decoder_, bufferIndex);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Render output buffer failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoDecoder::RenderOutputBufferAtTime(uint32_t bufferIndex, int64_t timeStamp)
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");
    CHECK_AND_RETURN_RET_LOG(timeStamp > 0, AVCODEC_SAMPLE_ERR_ERROR, "Render timestamp must be positive");

    const int32_t ret = OH_VideoDecoder_RenderOutputBufferAtTime(decoder_, bufferIndex, timeStamp);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Render output buffer at time failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

// [Start decoder_free_output]
int32_t VideoDecoder::FreeOutputBuffer(const CodecBufferInfo &info)
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");

    const int32_t ret = OH_VideoDecoder_FreeOutputBuffer(decoder_, info.bufferIndex);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Free output buffer failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End decoder_free_output]

// [Start decoder_render_output]
int32_t VideoDecoder::FreeOutputBuffer(const CodecBufferInfo &info, bool render)
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");

    int32_t ret = AVCODEC_SAMPLE_ERR_OK;
    if (render) {
        // 显示并释放解码帧。
        ret = OH_VideoDecoder_RenderOutputBuffer(decoder_, info.bufferIndex);
    } else {
        // 释放解码帧。
        ret = OH_VideoDecoder_FreeOutputBuffer(decoder_, info.bufferIndex);
    }
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Free output data failed");
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End decoder_render_output]

// [Start decoder_render_output_attime]
int32_t VideoDecoder::FreeOutputBuffer(const CodecBufferInfo &info, bool render, int64_t timeStamp)
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");

    int32_t ret = AVCODEC_SAMPLE_ERR_OK;
    if (render) {
        // 在指定时间点显示并释放解码帧，用于实现音画同步或控制显示速度。
        // timeStamp由开发者结合业务指定显示时间。
        ret = OH_VideoDecoder_RenderOutputBufferAtTime(decoder_, info.bufferIndex, timeStamp);
    } else {
        // 释放解码帧。
        ret = OH_VideoDecoder_FreeOutputBuffer(decoder_, info.bufferIndex);
    }
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Free output data failed");
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End decoder_render_output_attime]

// [Start decoder_setparameter]
int32_t VideoDecoder::SetParameter(OH_AVFormat *format)
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");
    CHECK_AND_RETURN_RET_LOG(format != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Parameter format is null");

    // 配置显示旋转角度。
    const int32_t ret = OH_VideoDecoder_SetParameter(decoder_, format);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Set parameter failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End decoder_setparameter]

int32_t VideoDecoder::IsValid(bool &isValid)
{
    isValid = false;
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");

    const int32_t ret = OH_VideoDecoder_IsValid(decoder_, &isValid);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Check decoder validity failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoDecoder::SetDecryptionConfig(MediaKeySession *mediaKeySession, bool secureVideoPath)
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");
    CHECK_AND_RETURN_RET_LOG(mediaKeySession != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Media key session is null");

    // 该配置需在Prepare前完成；安全视频通路仅适用于Surface模式。
    const int32_t ret = OH_VideoDecoder_SetDecryptionConfig(decoder_, mediaKeySession, secureVideoPath);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Set decryption config failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

#ifdef AVCODEC_SAMPLE_ENABLE_SMART_FLUENCY
// [Start onUserSpeedChanged]
int32_t VideoDecoder::OnUserSpeedChanged(double targetSpeed)
{
    OH_AVFormat *param = OH_AVFormat_Create();
    CHECK_AND_RETURN_RET_LOG(param != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "AVFormat create failed");

    // 引入epsilon处理double类型的精度比较。
    const double EPSILON = 1e-6;

    const bool enableAdaptive = targetSpeed > 1.0 + EPSILON;
    if (enableAdaptive) {
        // 场景：高倍速播放(如1.5x，2.0x，3.0x等)。
        // 策略：使能感知自适应模式。
        OH_AVFormat_SetIntValue(param, OH_MD_KEY_VIDEO_DECODER_FRAME_RETENTION_MODE,
                                OH_FRAME_RETENTION_MODE_ADAPTIVE);
        OH_AVFormat_SetDoubleValue(param, OH_MD_KEY_VIDEO_DECODER_SPEED, targetSpeed);
    } else {
        // 场景：正常播放(1.0x)或慢速播放(<1.0x)。
        // 策略：切换到全量直通模式，保障帧帧送显。
        OH_AVFormat_SetIntValue(param, OH_MD_KEY_VIDEO_DECODER_FRAME_RETENTION_MODE,
                                OH_FRAME_RETENTION_MODE_FULL);
    }

    // 实时下发参数，动态调整系统帧保留策略。
    int32_t ret = OH_VideoDecoder_SetParameter(decoder_, param);
    OH_AVFormat_Destroy(param);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
                             "SetParameter failed, ret: %{public}d", ret);
    if (enableAdaptive) {
        AVCODEC_SAMPLE_LOGI("Smart fluency mode changed to ADAPTIVE, speed: %{public}.2f", targetSpeed);
    } else {
        AVCODEC_SAMPLE_LOGI("Smart fluency mode changed to FULL");
    }
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End onUserSpeedChanged]

// [Start onThermalWarningReceived]
int32_t VideoDecoder::OnThermalWarningReceived(double ratio)
{
    OH_AVFormat *param = OH_AVFormat_Create();
    CHECK_AND_RETURN_RET_LOG(param != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "AVFormat create failed");

    // 采用UNIFORM平滑定比模式。
    OH_AVFormat_SetIntValue(param, OH_MD_KEY_VIDEO_DECODER_FRAME_RETENTION_MODE,
                            OH_FRAME_RETENTION_MODE_UNIFORM);

    // 设定保留比例（如0.3表示仅保留30%的解码帧输出）。
    OH_AVFormat_SetDoubleValue(param, OH_MD_KEY_VIDEO_DECODER_FRAME_RETENTION_RATIO, ratio);

    // 实时下发生效，系统将执行均匀的抽帧剔除，降低整机负载。
    int32_t ret = OH_VideoDecoder_SetParameter(decoder_, param);
    OH_AVFormat_Destroy(param);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
                             "SetParameter failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End onThermalWarningReceived]
#else
int32_t VideoDecoder::OnUserSpeedChanged(double targetSpeed)
{
    (void)targetSpeed;
    AVCODEC_SAMPLE_LOGW("Smart fluency is not enabled in current native SDK build");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoDecoder::OnThermalWarningReceived(double ratio)
{
    (void)ratio;
    AVCODEC_SAMPLE_LOGW("Smart fluency is not enabled in current native SDK build");
    return AVCODEC_SAMPLE_ERR_OK;
}
#endif

// [Start decoder_destroy]
// 调用OH_VideoDecoder_Destroy，注销解码器，释放资源。
int32_t VideoDecoder::Release()
{
    if (decoder_ != nullptr) {
        OH_VideoDecoder_Destroy(decoder_);
        decoder_ = nullptr;
    }
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End decoder_destroy]

OH_AVFormat *VideoDecoder::GetOutputDescription()
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, nullptr, "Decoder is null");
    return OH_VideoDecoder_GetOutputDescription(decoder_);
}
