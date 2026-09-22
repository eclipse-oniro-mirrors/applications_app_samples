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

#include "video_encoder.h"
#include "codec_capability.h"

#undef LOG_TAG
#define LOG_TAG "VideoEncoder"

namespace {
constexpr uint32_t OUTPUT_BUFFER_QUERY_RETRY_COUNT = 2;

int32_t ToGraphicPixelFormat(int32_t avPixelFormat, bool isHDRVivid)
{
    if (isHDRVivid) {
        return NATIVEBUFFER_PIXEL_FMT_YCBCR_P010;
    }
    switch (avPixelFormat) {
        case AV_PIXEL_FORMAT_RGBA:
            return NATIVEBUFFER_PIXEL_FMT_RGBA_8888;
        case AV_PIXEL_FORMAT_YUVI420:
            return NATIVEBUFFER_PIXEL_FMT_YCBCR_420_P;
        case AV_PIXEL_FORMAT_NV21:
            return NATIVEBUFFER_PIXEL_FMT_YCRCB_420_SP;
        default:
            return NATIVEBUFFER_PIXEL_FMT_YCRCB_420_SP;
    }
}
} // namespace

VideoEncoder::~VideoEncoder()
{
    Release();
}

int32_t VideoEncoder::Create(const std::string &videoCodecMime)
{
    std::unique_lock<std::shared_mutex> lock(codecMutex);
    CHECK_AND_RETURN_RET_LOG(encoder_ == nullptr, AVCODEC_SAMPLE_ERR_ERROR,
        "Encoder already exists, release it before creating another one");
    encoder_ = OH_VideoEncoder_CreateByMime(videoCodecMime.c_str());
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Create failed");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::CreateByName(const std::string &videoCodecName)
{
    // 仅在能力查询已经明确选定实现时使用名称创建。与 MIME 创建不同，名称不匹配时不会自动选择其他实现。
    std::unique_lock<std::shared_mutex> lock(codecMutex);
    CHECK_AND_RETURN_RET_LOG(encoder_ == nullptr, AVCODEC_SAMPLE_ERR_ERROR,
        "Encoder already exists, release it before creating another one");
    encoder_ = OH_VideoEncoder_CreateByName(videoCodecName.c_str());
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR,
        "Create encoder by name failed");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::CreatePrimaryWithPreproc(const std::string &videoCodecMime)
{
    // 该接口仅创建主编码器实例。缩放、裁剪、丢帧等预处理能力仍需通过配置参数按设备能力单独启用。
    std::unique_lock<std::shared_mutex> lock(codecMutex);
    CHECK_AND_RETURN_RET_LOG(encoder_ == nullptr, AVCODEC_SAMPLE_ERR_ERROR,
        "Encoder already exists, release it before creating another one");
    const int32_t ret = OH_VideoEncoder_CreatePrimaryWithPreproc(videoCodecMime.c_str(), &encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK && encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR,
        "Create primary encoder with preprocessor failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::CreateSecondaryFromPrimary(VideoEncoder &primaryEncoder)
{
    // 副编码器复用主编码器的输入源；为避免主编码器先释放导致副编码器失效，调用方需先 Release 副编码器。
    CHECK_AND_RETURN_RET_LOG(this != &primaryEncoder, AVCODEC_SAMPLE_ERR_ERROR,
        "Primary encoder and secondary encoder cannot be the same instance");
    std::unique_lock<std::shared_mutex> currentLock(codecMutex, std::defer_lock);
    std::shared_lock<std::shared_mutex> primaryLock(primaryEncoder.codecMutex, std::defer_lock);
    std::lock(currentLock, primaryLock);
    CHECK_AND_RETURN_RET_LOG(encoder_ == nullptr, AVCODEC_SAMPLE_ERR_ERROR,
        "Encoder already exists, release it before creating another one");
    CHECK_AND_RETURN_RET_LOG(primaryEncoder.encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR,
        "Primary encoder is null");
    const int32_t ret = OH_VideoEncoder_CreateSecondaryFromPrimary(primaryEncoder.encoder_, &encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK && encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR,
        "Create secondary encoder from primary failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::Config(SampleInfo &sampleInfo, CodecUserData *codecUserData)
{
    std::unique_lock<std::shared_mutex> lock(codecMutex);
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");
    CHECK_AND_RETURN_RET_LOG(codecUserData != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Invalid param: codecUserData");

    int32_t ret = Configure(sampleInfo);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Configure failed");

    ret = GetSurface(sampleInfo);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Get surface failed");

    if (!sampleInfo.codec.codecSyncMode) {
        ret = SetCallback(codecUserData);
        CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
                                 "Set callback failed, ret: %{public}d", ret);
    }

    ret = OH_VideoEncoder_Prepare(encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Prepare failed, ret: %{public}d", ret);

    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::Prepare()
{
    std::unique_lock<std::shared_mutex> lock(codecMutex);
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");
    const int32_t ret = OH_VideoEncoder_Prepare(encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Prepare failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

bool VideoEncoder::GetOutputBuffer(CodecBufferInfo &info, int64_t timeoutUs)
{
    info.buffer = nullptr;
    std::shared_lock<std::shared_mutex> lock(codecMutex);
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, false, "Encoder is null");

    // 格式变化后只重试一次，避免递归重入同一个 shared_mutex；持续变化由下次轮询继续处理。
    for (uint32_t retry = 0; retry < OUTPUT_BUFFER_QUERY_RETRY_COUNT; ++retry) {
        const int32_t ret = OH_VideoEncoder_QueryOutputBuffer(encoder_, &info.bufferIndex, timeoutUs);
        switch (ret) {
            case AV_ERR_OK: {
                OH_AVBuffer *buffer = OH_VideoEncoder_GetOutputBuffer(encoder_, info.bufferIndex);
                if (buffer == nullptr) {
                    const int32_t freeRet = OH_VideoEncoder_FreeOutputBuffer(encoder_, info.bufferIndex);
                    AVCODEC_SAMPLE_LOGE("Output buffer is null, free ret: %{public}d", freeRet);
                    return false;
                }
                const OH_AVErrCode getBufferRet = OH_AVBuffer_GetBufferAttr(buffer, &info.attr);
                if (getBufferRet != AV_ERR_OK) {
                    const int32_t freeRet = OH_VideoEncoder_FreeOutputBuffer(encoder_, info.bufferIndex);
                    AVCODEC_SAMPLE_LOGE("Get buffer attr error, ret: %{public}d, free ret: %{public}d", getBufferRet,
                        freeRet);
                    return false;
                }
                info.buffer = buffer;
                return true;
            }
            case AV_ERR_TRY_AGAIN_LATER: {
                AVCODEC_SAMPLE_LOGE("Get output buffer timeout.");
                return false;
            }
            case AV_ERR_STREAM_CHANGED: {
                int32_t width = 0;
                int32_t height = 0;
                auto format =
                    std::shared_ptr<OH_AVFormat>(OH_VideoEncoder_GetOutputDescription(encoder_), OH_AVFormat_Destroy);
                CHECK_AND_BREAK_LOG(format != nullptr, "Format is nullptr.");
                const bool getIntRet = OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_WIDTH, &width) &&
                                       OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_HEIGHT, &height);
                CHECK_AND_BREAK_LOG(getIntRet, "Encoder get int value failed.");
                AVCODEC_SAMPLE_LOGI("Stream Changed. Width: %{public}i, height: %{public}i", width, height);
                continue;
            }
            default: {
                return false;
            }
        }
    }
    AVCODEC_SAMPLE_LOGE("Output stream changed repeatedly, defer buffer acquisition to next poll");
    return false;
}

int32_t VideoEncoder::QueryInputBuffer(uint32_t &bufferIndex, int64_t timeoutUs)
{
    std::shared_lock<std::shared_mutex> lock(codecMutex);
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");
    const int32_t ret = OH_VideoEncoder_QueryInputBuffer(encoder_, &bufferIndex, timeoutUs);
    if (ret == AV_ERR_TRY_AGAIN_LATER) {
        return AVCODEC_SAMPLE_ERR_AGAIN;
    }
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Query input buffer failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

OH_AVBuffer *VideoEncoder::GetInputBuffer(CodecBufferInfo &info, int64_t timeoutUs)
{
    std::shared_lock<std::shared_mutex> lock(codecMutex);
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, nullptr, "Encoder is null");
    const int32_t ret = OH_VideoEncoder_QueryInputBuffer(encoder_, &info.bufferIndex, timeoutUs);
    if (ret == AV_ERR_TRY_AGAIN_LATER) {
        AVCODEC_SAMPLE_LOGD("Get input buffer timeout.");
        return nullptr;
    }
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, nullptr, "Query input buffer failed, ret: %{public}d", ret);
    OH_AVBuffer *buffer = OH_VideoEncoder_GetInputBuffer(encoder_, info.bufferIndex);
    CHECK_AND_RETURN_RET_LOG(buffer != nullptr, nullptr, "Input buffer is null");
    // Buffer 和 bufferIndex 必须成对保存，后续 PushInputBuffer 会使用同一个索引归还给编码器。
    info.buffer = buffer;
    return buffer;
}

int32_t VideoEncoder::QueryOutputBuffer(uint32_t &bufferIndex, int64_t timeoutUs)
{
    std::shared_lock<std::shared_mutex> lock(codecMutex);
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");
    const int32_t ret = OH_VideoEncoder_QueryOutputBuffer(encoder_, &bufferIndex, timeoutUs);
    if (ret == AV_ERR_TRY_AGAIN_LATER) {
        return AVCODEC_SAMPLE_ERR_AGAIN;
    }
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Query output buffer failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::Start()
{
    std::unique_lock<std::shared_mutex> lock(codecMutex);
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");

    const int32_t ret = OH_VideoEncoder_Start(encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Start failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::Flush()
{
    // Flush 会使此前通过回调或同步查询取得的 Buffer 索引失效，调用方需先结束对这些 Buffer 的访问。
    std::unique_lock<std::shared_mutex> lock(codecMutex);
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");
    const int32_t ret = OH_VideoEncoder_Flush(encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Flush failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::Reset()
{
    // Reset 会丢弃当前配置与缓存，编码器回到初始状态；不能将其当作可直接继续编码的 Flush 使用。
    std::unique_lock<std::shared_mutex> lock(codecMutex);
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");
    const int32_t ret = OH_VideoEncoder_Reset(encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Reset failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::SetParameter(OH_AVFormat *format)
{
    // 参数对象由调用方创建和销毁。本方法仅在编码器已启动期间转交参数，不保存 format 指针。
    CHECK_AND_RETURN_RET_LOG(format != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Parameter format is null");
    std::shared_lock<std::shared_mutex> lock(codecMutex);
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");
    const int32_t ret = OH_VideoEncoder_SetParameter(encoder_, format);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Set parameter failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::RegisterParameterCallback(OH_VideoEncoder_OnNeedInputParameter callback, void *userData)
{
    // 该回调仅适用于 surface 编码。userData 属于业务侧，必须在编码器停止回调前保持有效，避免异步回调访问悬空地址。
    CHECK_AND_RETURN_RET_LOG(callback != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Input parameter callback is null");
    std::unique_lock<std::shared_mutex> lock(codecMutex);
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");
    const int32_t ret = OH_VideoEncoder_RegisterParameterCallback(encoder_, callback, userData);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Register parameter callback failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::PushInputBuffer(CodecBufferInfo &info)
{
    // GetInputBuffer 返回的 buffer 只在归还给 codec 前有效；空指针不可传给 OH_AVBuffer_SetBufferAttr。
    CHECK_AND_RETURN_RET_LOG(info.buffer != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Input buffer is null");
    std::shared_lock<std::shared_mutex> lock(codecMutex);
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");

    int32_t ret = OH_AVBuffer_SetBufferAttr(info.buffer, &info.attr);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Set avbuffer attr failed");
    ret = OH_VideoEncoder_PushInputBuffer(encoder_, info.bufferIndex);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Push input data failed");
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::PushInputParameter(uint32_t bufferIndex)
{
    // 参数索引来自 RegisterParameterCallback；不能使用普通输入 Buffer 的索引替代。
    std::shared_lock<std::shared_mutex> lock(codecMutex);
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");
    const int32_t ret = OH_VideoEncoder_PushInputParameter(encoder_, bufferIndex);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Push input parameter failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::FreeOutputBuffer(uint32_t bufferIndex)
{
    std::shared_lock<std::shared_mutex> lock(codecMutex);
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");

    int32_t ret = OH_VideoEncoder_FreeOutputBuffer(encoder_, bufferIndex);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Free output data failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::NotifyEndOfStream()
{
    std::shared_lock<std::shared_mutex> lock(codecMutex);
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");

    int32_t ret = OH_VideoEncoder_NotifyEndOfStream(encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Notify end of stream failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::Stop()
{
    // Stop 前先清除缓存，确保已排队但尚未输出的编码数据不会落入下一次 Start。
    std::unique_lock<std::shared_mutex> lock(codecMutex);
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");

    int32_t ret = OH_VideoEncoder_Flush(encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Flush failed, ret: %{public}d", ret);

    ret = OH_VideoEncoder_Stop(encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Stop failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::Release()
{
    std::unique_lock<std::shared_mutex> lock(codecMutex);
    if (encoder_ != nullptr) {
        // Destroy 是编码器句柄的最终释放点。销毁后立即置空，避免后续调用继续使用失效句柄。
        const int32_t ret = OH_VideoEncoder_Destroy(encoder_);
        encoder_ = nullptr;
        CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
            "Destroy failed, ret: %{public}d", ret);
    }
    return AVCODEC_SAMPLE_ERR_OK;
}

OH_AVFormat *VideoEncoder::GetOutputDescription()
{
    std::shared_lock<std::shared_mutex> lock(codecMutex);
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, nullptr, "Encoder is null");
    return OH_VideoEncoder_GetOutputDescription(encoder_);
}

OH_AVFormat *VideoEncoder::GetInputDescription()
{
    std::shared_lock<std::shared_mutex> lock(codecMutex);
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, nullptr, "Encoder is null");
    return OH_VideoEncoder_GetInputDescription(encoder_);
}

int32_t VideoEncoder::IsValid(bool &isValid)
{
    std::shared_lock<std::shared_mutex> lock(codecMutex);
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");
    // 先置为 false，确保底层查询失败时调用方不会误用上一次查询留下的结果。
    isValid = false;
    const int32_t ret = OH_VideoEncoder_IsValid(encoder_, &isValid);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
        "Check encoder validity failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::SetCallback(CodecUserData *codecUserData)
{
    int32_t ret = OH_VideoEncoder_RegisterCallback(encoder_,
    {SampleCallback::OnCodecError, SampleCallback::OnCodecFormatChange,
        SampleCallback::OnNeedInputBuffer, SampleCallback::OnNewOutputBuffer},
        codecUserData);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Set callback failed, ret: %{public}d", ret);

    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::Configure(const SampleInfo &sampleInfo)
{
    CHECK_AND_RETURN_RET_LOG(CodecCapability::ValidateVideoConfiguration(sampleInfo, true),
        AVCODEC_SAMPLE_ERR_ERROR, "Video encoder configuration is not supported");
    OH_AVFormat *format = OH_AVFormat_Create();
    CHECK_AND_RETURN_RET_LOG(format != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "AVFormat create failed");

    OH_AVFormat_SetIntValue(format, OH_MD_KEY_WIDTH, sampleInfo.video.videoWidth);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_HEIGHT, sampleInfo.video.videoHeight);
    OH_AVFormat_SetDoubleValue(format, OH_MD_KEY_FRAME_RATE, sampleInfo.video.frameRate);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, sampleInfo.video.pixelFormat);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_VIDEO_ENCODE_BITRATE_MODE, sampleInfo.video.bitrateMode);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, sampleInfo.video.bitrate);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_PROFILE, sampleInfo.video.hevcProfile);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_I_FRAME_INTERVAL, sampleInfo.video.iFrameInterval);
    // B 帧间隔保持编码器默认值。部分设备没有暴露 VIDEO_ENCODER_B_FRAME 能力，
    // 对该可选 Key 做查询或赋值可能产生能力告警，甚至让原本可用的录制配置被拒绝。
    if (sampleInfo.codec.codecSyncMode) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, sampleInfo.codec.codecSyncMode);
    }
    if (sampleInfo.video.isHDRVivid) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_RANGE_FLAG, sampleInfo.video.rangFlag);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_COLOR_PRIMARIES, sampleInfo.video.primary);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_TRANSFER_CHARACTERISTICS, sampleInfo.video.transfer);
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_MATRIX_COEFFICIENTS, sampleInfo.video.matrix);
    }
    AVCODEC_SAMPLE_LOGI("====== VideoEncoder config ======");
    AVCODEC_SAMPLE_LOGI("%{public}d*%{public}d, %{public}.1ffps",
        sampleInfo.video.videoWidth, sampleInfo.video.videoHeight, sampleInfo.video.frameRate);
    AVCODEC_SAMPLE_LOGI("BitRate Mode: %{public}d, BitRate: %{public}" PRId64 "kbps",
        sampleInfo.video.bitrateMode, sampleInfo.video.bitrate / 1024);
    AVCODEC_SAMPLE_LOGI("====== VideoEncoder config ======");

    int ret = OH_VideoEncoder_Configure(encoder_, format);
    OH_AVFormat_Destroy(format);
    format = nullptr;
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Config failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t VideoEncoder::GetSurface(SampleInfo &sampleInfo)
{
    int32_t ret = OH_VideoEncoder_GetSurface(encoder_, &sampleInfo.video.window);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK && sampleInfo.video.window, AVCODEC_SAMPLE_ERR_ERROR,
        "Get surface failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}

