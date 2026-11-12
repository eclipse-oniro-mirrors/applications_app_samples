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

#ifndef AUDIOENCODER_H
#define AUDIOENCODER_H

#include "multimedia/player_framework/native_avcodec_audiocodec.h"
#include "multimedia/player_framework/native_avcapability.h"
#include "multimedia/player_framework/native_avbuffer_info.h"
#include "multimedia/native_audio_channel_layout.h"
#include "sample_info.h"
#include "sample_callback.h"
#include "dfx/error/av_codec_sample_error.h"
#include "dfx/log/av_codec_sample_log.h"

class AudioEncoder {
public:
    AudioEncoder() = default;
    ~AudioEncoder();

    // 按MIME创建音频编码器实例，成功后由Release()负责销毁。
    int32_t Create(const std::string &codecMime);
    int32_t CreateByName(const std::string &codecMime);
    int32_t Config(const SampleInfo &sampleInfo, CodecUserData *codecUserData);
    int32_t Start();
    // 把填好音频数据和属性的输入Buffer交回编码器；成功后不能继续写该Buffer。
    int32_t PushInputBuffer(CodecBufferInfo &info);
    // 同步取Buffer返回OK、AGAIN或ERROR；成功时由info保存Buffer和原索引。
    int32_t GetInputBuffer(CodecBufferInfo &info, int64_t timeoutUs);
    // EOS也返回OK，由调用方识别flags并按原索引归还；封装内部不消费输出。
    int32_t GetOutputBuffer(CodecBufferInfo &info, int64_t timeoutUs);
    int32_t FreeOutputBuffer(const CodecBufferInfo &info);
    // 使用按当前同步/异步模式取得的输入Buffer提交EOS；调用后仍需取输出直到收到EOS。
    int32_t NotifyEndOfStream(CodecBufferInfo &bufferInfo);
    int32_t Flush();
    int32_t Reset();
    int32_t Stop();
    // 销毁codec句柄。该操作后缓存的所有输入、输出Buffer索引都不能再使用。
    int32_t Release();

private:
    int32_t SetCallback(CodecUserData *codecUserData);
    int32_t Configure(const SampleInfo &sampleInfo);

    bool isAVBufferMode_ = false;
    // 由OH_AudioCodec_CreateByMime创建、由Release()销毁的音频编码器句柄。
    OH_AVCodec *encoder_ = nullptr;
};

#endif
