
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

#include "audio_decoder.h"
#include "codec_capability.h"

#undef LOG_TAG
#define LOG_TAG "AudioDecoder"

AudioDecoder::~AudioDecoder()
{
    Release();
}

// [Start AudioDecoder::Create]
int32_t AudioDecoder::Create(const std::string &codecMime)
{
    // 设置判定是否为编码。false表示当前是解码。
    constexpr bool isEncoder = false;
    // 通过mime type创建解码器。此处传入的mime type以实际解码格式为准。
    decoder_ = OH_AudioCodec_CreateByMime(codecMime.c_str(), isEncoder);
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Create failed");
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioDecoder::Create]

// [Start AudioDecoder::CreateByName]
int32_t AudioDecoder::CreateByName(const std::string &codecMime)
{
    // 通过codec name创建解码器。
    OH_AVCapability *capability = OH_AVCodec_GetCapability(codecMime.c_str(), false);
    CHECK_AND_RETURN_RET_LOG(capability != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "GetCapability failed");
    const char *name = OH_AVCapability_GetName(capability);
    decoder_ = OH_AudioCodec_CreateByName(name);
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "CreateByName failed");
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioDecoder::CreateByName]

// [Start AudioDecoder::SetCallback]
int32_t AudioDecoder::SetCallback(CodecUserData *codecUserData)
{
    // 异步模式下 codec 在内部线程回调 userData；Release 前先停止 codec，回调才不会访问该上下文。
    int32_t ret = AV_ERR_OK;
    ret = OH_AudioCodec_RegisterCallback(decoder_,
                                         {SampleCallback::OnCodecError, SampleCallback::OnCodecFormatChange,
                                          SampleCallback::OnNeedInputBuffer, SampleCallback::OnNewOutputBuffer},
                                         codecUserData);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Set callback failed, ret: %{public}d", ret);

    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioDecoder::SetCallback]

// [Start AudioDecoder::Configure]
int32_t AudioDecoder::Configure(const SampleInfo &sampleInfo)
{
    // 解码能力表可能未完整列出部分容器编码格式的采样率/声道信息，
    // 解码器Configure调用的返回值才是最终判定依据，此处仅将能力查询结果作为参考日志。
    if (!CodecCapability::ValidateAudioConfiguration(sampleInfo, false)) {
        AVCODEC_SAMPLE_LOGW("Audio capability query did not fully describe mime: %{public}s; "
            "continue with decoder configure", sampleInfo.audio.audioCodecMime.c_str());
    }
    // format 仅用于本次 Configure；所有失败路径和成功路径都要在返回前销毁。
    OH_AVFormat *format = OH_AVFormat_Create();
    CHECK_AND_RETURN_RET_LOG(format != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "AVFormat create failed");

    // 必选：采样格式、声道数、声道布局、采样率。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, SAMPLE_S16LE);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, sampleInfo.audio.audioChannelCount);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_CHANNEL_LAYOUT, sampleInfo.audio.audioChannelLayout);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, sampleInfo.audio.audioSampleRate);
    // 可选：同步模式，按需设置。
    if (sampleInfo.codec.codecSyncMode) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, sampleInfo.codec.codecSyncMode);
    }

    // 可选：编解码器特定数据（codec config），由解封装获取，无则不设置。
    if (sampleInfo.audio.codecConfigLen > 0 &&
        sampleInfo.audio.codecConfig.size() >= sampleInfo.audio.codecConfigLen) {
        OH_AVFormat_SetBuffer(format, OH_MD_KEY_CODEC_CONFIG, sampleInfo.audio.codecConfig.data(),
            sampleInfo.audio.codecConfigLen);
    }

    // 配置解码器。
    int ret = OH_AudioCodec_Configure(decoder_, format);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Config failed, ret: %{public}d", ret);
    OH_AVFormat_Destroy(format);
    format = nullptr;

    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioDecoder::Configure]

int32_t AudioDecoder::Config(const SampleInfo &sampleInfo, CodecUserData *codecUserData)
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");
    CHECK_AND_RETURN_RET_LOG(codecUserData != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Invalid param: codecUserData");

    int32_t ret = Configure(sampleInfo);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Configure failed");

    if (!sampleInfo.codec.codecSyncMode) {
        ret = SetCallback(codecUserData);
        CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
                                 "Set callback failed, ret: %{public}d", ret);
    }

    // [Start AudioDecoder::Config]
    {
        // 解码器就绪。
        int ret = OH_AudioCodec_Prepare(decoder_);
        CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Prepare failed, ret: %{public}d", ret);
    }
    // [End AudioDecoder::Config]

    return AVCODEC_SAMPLE_ERR_OK;
}

int32_t AudioDecoder::ValidateConfiguration(const SampleInfo &sampleInfo)
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");
    return Configure(sampleInfo);
}

// [Start AudioDecoder::GetInputBuffer]
OH_AVBuffer *AudioDecoder::GetInputBuffer(CodecBufferInfo &info, int64_t timeoutUs)
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, nullptr, "Decoder is null");
    int32_t ret = OH_AudioCodec_QueryInputBuffer(decoder_, &info.bufferIndex, timeoutUs);
    switch (ret) {
        case AV_ERR_OK: {
            OH_AVBuffer *buffer = OH_AudioCodec_GetInputBuffer(decoder_, info.bufferIndex);
            CHECK_AND_RETURN_RET_LOG(buffer != nullptr, nullptr, "Input buffer is null");
            // Buffer 由 codec 管理，业务侧只在 PushInputBuffer 前写入，不能缓存地址或跨线程长期持有。
            info.buffer = buffer;
            return buffer;
        }
        case AV_ERR_TRY_AGAIN_LATER: {
            AVCODEC_SAMPLE_LOGE("Get input buffer timeout.");
            return nullptr;
        }
        default: {
            return nullptr;
        }
    }
    return nullptr;
}
// [End AudioDecoder::GetInputBuffer]

// [Start AudioDecoder::GetOutputBuffer]
int32_t AudioDecoder::GetOutputBuffer(CodecBufferInfo &info, int64_t timeoutUs)
{
    info.buffer = nullptr;
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");
    OH_AVErrCode ret = OH_AudioCodec_QueryOutputBuffer(decoder_, &info.bufferIndex, timeoutUs);
    if (ret == AV_ERR_TRY_AGAIN_LATER) {
        // 超时通常说明等待时间过短，或已有输出 Buffer 未及时归还导致 codec 暂无可用 Buffer。
        AVCODEC_SAMPLE_LOGW("Get output buffer timeout.");
        return AVCODEC_SAMPLE_ERR_AGAIN; // continue;
    }
    if (ret != AV_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("query output buffer failed, ret: %{public}d", ret);
        return AVCODEC_SAMPLE_ERR_ERROR; // break;
    }

    OH_AVBuffer *outputBuf = OH_AudioCodec_GetOutputBuffer(decoder_, info.bufferIndex);
    if (outputBuf == nullptr) {
        // 已取得输出索引，后续取 Buffer 失败也必须归还，避免占满 codec 的输出队列。
        const int32_t freeRet = OH_AudioCodec_FreeOutputBuffer(decoder_, info.bufferIndex);
        AVCODEC_SAMPLE_LOGE("Get output buffer failed, free ret: %{public}d", freeRet);
        return AVCODEC_SAMPLE_ERR_ERROR; // break;
    }

    ret = OH_AVBuffer_GetBufferAttr(outputBuf, &info.attr);
    if (ret != AV_ERR_OK) {
        const int32_t freeRet = OH_AudioCodec_FreeOutputBuffer(decoder_, info.bufferIndex);
        AVCODEC_SAMPLE_LOGE("Get output buffer attr failed, ret: %{public}d, free ret: %{public}d", ret, freeRet);
        return AVCODEC_SAMPLE_ERR_ERROR; // break;
    }
    info.buffer = outputBuf;
    if (info.attr.flags & AVCODEC_BUFFER_FLAGS_EOS) {
        // EOS 输出也必须归还，之后不再访问 outputBuf 或该索引。
        OH_AudioCodec_FreeOutputBuffer(decoder_, info.bufferIndex);
        info.buffer = nullptr;
        AVCODEC_SAMPLE_LOGI("Out buffer end");
        // 解码输出结束。
        return AVCODEC_SAMPLE_ERR_END;
    }
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioDecoder::GetOutputBuffer]

// [Start AudioDecoder::Start]
int32_t AudioDecoder::Start()
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");

    int ret = OH_AudioCodec_Start(decoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Start failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioDecoder::Start]

// [Start AudioDecoder::PushInputBuffer]
int32_t AudioDecoder::PushInputBuffer(CodecBufferInfo &info)
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");
    CHECK_AND_RETURN_RET_LOG(info.buffer != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Input buffer is null");
    int32_t ret = OH_AVBuffer_SetBufferAttr(info.buffer, &info.attr);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Set avbuffer attr failed");
    ret = OH_AudioCodec_PushInputBuffer(decoder_, info.bufferIndex);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Push input data failed");
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioDecoder::PushInputBuffer]

// [Start AudioDecoder::FreeOutputBuffer]
int32_t AudioDecoder::FreeOutputBuffer(uint32_t bufferIndex, bool render)
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");

    int32_t ret = AVCODEC_SAMPLE_ERR_OK;
    ret = OH_AudioCodec_FreeOutputBuffer(decoder_, bufferIndex);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Free output data failed");
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioDecoder::FreeOutputBuffer]

// [Start AudioDecoder::Flush]
int32_t AudioDecoder::Flush()
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");

    // 刷新解码器，清空当前队列，之后需要调用Start()重新开始解码。
    int32_t ret = OH_AudioCodec_Flush(decoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Flush failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioDecoder::Flush]

// [Start AudioDecoder::Reset]
int32_t AudioDecoder::Reset()
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");

    // 重置解码器，之后需要重新调用Configure()配置、Start()启动。
    int32_t ret = OH_AudioCodec_Reset(decoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Reset failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioDecoder::Reset]

// [Start AudioDecoder::Stop]
int32_t AudioDecoder::Stop()
{
    CHECK_AND_RETURN_RET_LOG(decoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Decoder is null");

    int32_t ret = OH_AudioCodec_Stop(decoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Stop failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioDecoder::Stop]

// [Start AudioDecoder::Release]
int32_t AudioDecoder::Release()
{
    if (decoder_ != nullptr) {
        // 销毁前刷新并停止解码器，不可重复destroy。
        Flush();
        Stop();
        OH_AudioCodec_Destroy(decoder_);
        decoder_ = nullptr;
    }
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioDecoder::Release]
