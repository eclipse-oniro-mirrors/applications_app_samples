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

#include "audio_encoder.h"
#include "codec_capability.h"

#undef LOG_TAG
#define LOG_TAG "AudioEncoder"

namespace {
constexpr int LIMIT_LOGD_FREQUENCY = 50;
constexpr int64_t TIMEOUT_US = 5000000;  // 5 秒
}  // 匿名命名空间

AudioEncoder::~AudioEncoder()
{
    Release();
}

// [Start AudioEncoder::Create]
int32_t AudioEncoder::Create(const std::string &codecMime)
{
    // 设置判定是否为编码。true表示当前是编码。
    constexpr bool isEncoder = true;
    // 通过mime type创建编码器。此处传入的mime type以实际编码格式为准。
    encoder_ = OH_AudioCodec_CreateByMime(codecMime.c_str(), isEncoder);
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Create failed");
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioEncoder::Create]

// [Start AudioEncoder::CreateByName]
int32_t AudioEncoder::CreateByName(const std::string &codecMime)
{
    // 通过codec name创建编码器。
    OH_AVCapability *capability = OH_AVCodec_GetCapability(codecMime.c_str(), true);
    CHECK_AND_RETURN_RET_LOG(capability != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "GetCapability failed");
    const char *name = OH_AVCapability_GetName(capability);
    encoder_ = OH_AudioCodec_CreateByName(name);
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "CreateByName failed");
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioEncoder::CreateByName]

// [Start AudioEncoder::SetCallback]
int32_t AudioEncoder::SetCallback(CodecUserData *codecUserData)
{
    // 编码器在内部线程回调 userData；释放前应停止编码器并等待消费线程退出。
    int32_t ret = AV_ERR_OK;
    ret = OH_AudioCodec_RegisterCallback(encoder_,
                                         { SampleCallback::OnCodecError, SampleCallback::OnCodecFormatChange,
                                           SampleCallback::OnNeedInputBuffer, SampleCallback::OnNewOutputBuffer },
                                         codecUserData);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Set callback failed, ret: %{public}d", ret);

    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioEncoder::SetCallback]

// [Start AudioEncoder::Configure]
int32_t AudioEncoder::Configure(const SampleInfo &sampleInfo)
{
    CHECK_AND_RETURN_RET_LOG(CodecCapability::ValidateAudioConfiguration(sampleInfo, true),
        AVCODEC_SAMPLE_ERR_ERROR, "Audio encoder configuration is not supported");
    // 配置对象不被编码器接管；成功配置后由本函数销毁，调用方无需接管。
    OH_AVFormat *format = OH_AVFormat_Create();
    CHECK_AND_RETURN_RET_LOG(format != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "AVFormat create failed");

    // 必选：采样格式、声道数、采样率、码率、声道布局。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, sampleInfo.audio.audioSampleFormat);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_CHANNEL_COUNT, sampleInfo.audio.audioChannelCount);
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_AUD_SAMPLE_RATE, sampleInfo.audio.audioSampleRate);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_BITRATE, sampleInfo.audio.audioBitRate);
    OH_AVFormat_SetLongValue(format, OH_MD_KEY_CHANNEL_LAYOUT, sampleInfo.audio.audioChannelLayout);
    // 可选：最大输入长度。FLAC、MP3等帧对齐编码器设置后允许输入数据不按帧大小对齐。
    OH_AVFormat_SetIntValue(format, OH_MD_KEY_MAX_INPUT_SIZE, sampleInfo.audio.audioMaxInputSize);
    if (sampleInfo.codec.codecSyncMode) {
        OH_AVFormat_SetIntValue(format, OH_MD_KEY_ENABLE_SYNC_MODE, sampleInfo.codec.codecSyncMode);
    }

    // 配置编码器。
    int ret = OH_AudioCodec_Configure(encoder_, format);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Config failed, ret: %{public}d", ret);
    OH_AVFormat_Destroy(format);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Config failed, ret: %{public}d", ret);

    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioEncoder::Configure]

int32_t AudioEncoder::Config(const SampleInfo &sampleInfo, CodecUserData *codecUserData)
{
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");
    CHECK_AND_RETURN_RET_LOG(codecUserData != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Invalid param: codecUserData");

    int32_t ret = Configure(sampleInfo);
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Configure failed");

    if (!sampleInfo.codec.codecSyncMode) {
        ret = SetCallback(codecUserData);
        CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
                                 "Set callback failed, ret: %{public}d", ret);
    }

    // [Start AudioEncoder::Config]
    {
        // 编码器就绪。
        int ret = OH_AudioCodec_Prepare(encoder_);
        CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Prepare failed, ret: %{public}d", ret);
    }
    // [End AudioEncoder::Config]

    return AVCODEC_SAMPLE_ERR_OK;
}

// [Start AudioEncoder::GetInputBuffer]
OH_AVBuffer *AudioEncoder::GetInputBuffer(CodecBufferInfo &info, int64_t timeoutUs)
{
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, nullptr, "Encoder is null");
    auto ret = OH_AudioCodec_QueryInputBuffer(encoder_, &info.bufferIndex, timeoutUs);
    switch (ret) {
        case AV_ERR_OK: {
            OH_AVBuffer *buffer = OH_AudioCodec_GetInputBuffer(encoder_, info.bufferIndex);
            CHECK_AND_RETURN_RET_LOG(buffer != nullptr, nullptr, "Input buffer is null");
            // 该 Buffer 只能在 PushInputData 前填充；提交后所有权回到 codec。
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
// [End AudioEncoder::GetInputBuffer]

// [Start AudioEncoder::GetOutputBuffer]
int32_t AudioEncoder::GetOutputBuffer(CodecBufferInfo &info, int64_t timeoutUs)
{
    info.buffer = nullptr;
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");
    // 一批输入可能产生多帧输出，需要持续取出并归还，直到 codec 暂无输出或返回 EOS。
    OH_AVErrCode ret = OH_AudioCodec_QueryOutputBuffer(encoder_, &info.bufferIndex, timeoutUs);
    if (ret == AV_ERR_TRY_AGAIN_LATER) {
        // 超时，可能输入的数据不足以编码出一帧，或者超时时间设置过短。
        AVCODEC_SAMPLE_LOGW("Get output buffer timeout.");
        return AVCODEC_SAMPLE_ERR_AGAIN; // continue;
    }
    if (ret != AV_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("query output buffer failed, ret: %{public}d", ret);
        return AVCODEC_SAMPLE_ERR_ERROR; // break;
    }

    OH_AVBuffer *outputBuf = OH_AudioCodec_GetOutputBuffer(encoder_, info.bufferIndex);
    if (outputBuf == nullptr) {
        // 查询成功后索引已被 codec 交给应用，异常路径同样需要归还。
        const int32_t freeRet = OH_AudioCodec_FreeOutputBuffer(encoder_, info.bufferIndex);
        AVCODEC_SAMPLE_LOGE("Get output buffer failed, free ret: %{public}d", freeRet);
        return AVCODEC_SAMPLE_ERR_ERROR; // break;
    }
    ret = OH_AVBuffer_GetBufferAttr(outputBuf, &info.attr);
    if (ret != AV_ERR_OK) {
        const int32_t freeRet = OH_AudioCodec_FreeOutputBuffer(encoder_, info.bufferIndex);
        AVCODEC_SAMPLE_LOGE("Get output buffer attr failed, ret: %{public}d, free ret: %{public}d", ret, freeRet);
        return AVCODEC_SAMPLE_ERR_ERROR; // break;
    }

    info.buffer = outputBuf;
    if (info.attr.flags & AVCODEC_BUFFER_FLAGS_EOS) {
        AVCODEC_SAMPLE_LOGI("Out buffer EOS flag detected");
        return AVCODEC_SAMPLE_ERR_OK;
    }
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioEncoder::GetOutputBuffer]

// [Start AudioEncoder::Start]
int32_t AudioEncoder::Start()
{
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");

    int ret = OH_AudioCodec_Start(encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Start failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioEncoder::Start]

// [Start AudioEncoder::PushInputData]
int32_t AudioEncoder::PushInputData(CodecBufferInfo &info)
{
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");
    CHECK_AND_RETURN_RET_LOG(info.buffer != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Input buffer is null");
    int32_t ret = OH_AVBuffer_SetBufferAttr(info.buffer, &info.attr);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Set avbuffer attr failed");
    ret = OH_AudioCodec_PushInputBuffer(encoder_, info.bufferIndex);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Push input data failed");
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioEncoder::PushInputData]

// [Start AudioEncoder::FreeOutputData]
int32_t AudioEncoder::FreeOutputData(uint32_t bufferIndex)
{
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");

    int32_t ret = AVCODEC_SAMPLE_ERR_OK;
    ret = OH_AudioCodec_FreeOutputBuffer(encoder_, bufferIndex);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Free output data failed");
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioEncoder::FreeOutputData]

// [Start AudioEncoder::NotifyEndOfStream]
int32_t AudioEncoder::NotifyEndOfStream()
{
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");

    // 使用空输入 Buffer 携带 EOS。即使没有媒体数据也必须提交它，编码器才会输出尾部数据。
    CodecBufferInfo bufferInfo;
    auto buffer = GetInputBuffer(bufferInfo, TIMEOUT_US);
    if (buffer == nullptr) {
        AVCODEC_SAMPLE_LOGW("GetInputBuffer for EOS failed");
        return AVCODEC_SAMPLE_ERR_ERROR;
    }

    // EOS 不包含有效音频字节；调用 PushInputBuffer 后该 Buffer 立即归 codec 管理。
    bufferInfo.attr.size = 0;
    bufferInfo.attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    int32_t ret = OH_AVBuffer_SetBufferAttr(buffer, &bufferInfo.attr);
    if (ret != AV_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("SetBufferAttr for EOS failed, ret: %{public}d", ret);
        return AVCODEC_SAMPLE_ERR_ERROR;
    }

    bufferInfo.buffer = buffer;
    ret = OH_AudioCodec_PushInputBuffer(encoder_, bufferInfo.bufferIndex);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
                             "PushInputBuffer for EOS failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioEncoder::NotifyEndOfStream]

// [Start AudioEncoder::Flush]
int32_t AudioEncoder::Flush()
{
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");

    // 刷新编码器，清空当前队列，之后需要调用Start()重新开始编码。
    int32_t ret = OH_AudioCodec_Flush(encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Flush failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioEncoder::Flush]

// [Start AudioEncoder::Reset]
int32_t AudioEncoder::Reset()
{
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");

    // 重置编码器，之后需要重新调用Configure()配置、Start()启动。
    int32_t ret = OH_AudioCodec_Reset(encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Reset failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioEncoder::Reset]

// [Start AudioEncoder::Stop]
int32_t AudioEncoder::Stop()
{
    CHECK_AND_RETURN_RET_LOG(encoder_ != nullptr, AVCODEC_SAMPLE_ERR_ERROR, "Encoder is null");

    int ret = Flush();
    CHECK_AND_RETURN_RET_LOG(ret == AVCODEC_SAMPLE_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR,
                             "Flush failed, ret: %{public}d", ret);

    ret = OH_AudioCodec_Stop(encoder_);
    CHECK_AND_RETURN_RET_LOG(ret == AV_ERR_OK, AVCODEC_SAMPLE_ERR_ERROR, "Stop failed, ret: %{public}d", ret);
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioEncoder::Stop]

// [Start AudioEncoder::Release]
int32_t AudioEncoder::Release()
{
    if (encoder_ != nullptr) {
        // 销毁前刷新并停止编码器，不可重复destroy。
        Flush();
        Stop();
        OH_AudioCodec_Destroy(encoder_);
        encoder_ = nullptr;
    }
    return AVCODEC_SAMPLE_ERR_OK;
}
// [End AudioEncoder::Release]
