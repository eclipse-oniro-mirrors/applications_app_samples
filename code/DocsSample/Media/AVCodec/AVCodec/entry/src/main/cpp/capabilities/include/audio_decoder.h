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

#ifndef AUDIODECODER_H
#define AUDIODECODER_H

#include "multimedia/player_framework/native_avcodec_audiocodec.h"
#include "multimedia/player_framework/native_avcapability.h"
#include "multimedia/player_framework/native_avbuffer_info.h"
#include "sample_callback.h"
#include "dfx/error/av_codec_sample_error.h"
#include "av_codec_sample_log.h"

class AudioDecoder {
public:
    AudioDecoder() = default;
    ~AudioDecoder();

    // 按MIME创建音频解码器实例。成功后由Release() 销毁，调用方不直接销毁decoder_。
    int32_t Create(const std::string &codecMime);
    int32_t CreateByName(const std::string &codecMime);
    int32_t ValidateConfiguration(const SampleInfo &sampleInfo);
    // 完成配置、回调注册和Prepare。异步模式下codecUserData必须在Release前保持有效。
    int32_t Config(const SampleInfo &sampleInfo, CodecUserData *codecUserData);
    int32_t Start();
    // 将已填充属性的输入Buffer归还给codec；调用成功后不能再访问该Buffer。
    int32_t PushInputBuffer(CodecBufferInfo &info);
    // 归还已消费的输出Buffer。音频不送显，render参数仅为接口兼容保留。
    int32_t FreeOutputBuffer(uint32_t bufferIndex, bool render);
    int32_t Flush();
    int32_t Reset();
    int32_t Stop();
    OH_AVBuffer *GetInputBuffer(CodecBufferInfo &info, int64_t timeoutUs);
    // 同步模式下取得解码输出；调用方必须随后归还bufferIndex，否则codec会因无可用Buffer阻塞。
    int32_t GetOutputBuffer(CodecBufferInfo &info, int64_t timeoutUs);
    // 释放codec及其内部资源。该操作后此前获得的Buffer和索引均不再有效。
    int32_t Release();

private:
    int32_t SetCallback(CodecUserData *codecUserData);
    int32_t Configure(const SampleInfo &sampleInfo);

    bool isAVBufferMode_ = false;
    // 由OH_AudioCodec_CreateByMime创建并由Release() 销毁的音频解码器句柄。
    OH_AVCodec *decoder_ = nullptr;
};
#endif
