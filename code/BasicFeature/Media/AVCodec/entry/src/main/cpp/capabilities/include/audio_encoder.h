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

    // 按 MIME 创建音频编码器实例，成功后由 Release() 负责销毁。
    int32_t Create(const std::string &codecMime);
    // 完成配置、回调注册和 Prepare。异步回调使用的 codecUserData 在停止回调前不得释放。
    int32_t Config(const SampleInfo &sampleInfo, CodecUserData *codecUserData);
    int32_t Start();
    // 把填好音频数据和属性的输入 Buffer 交回编码器；成功后不能继续写该 Buffer。
    int32_t PushInputData(CodecBufferInfo &info);
    // 同步模式下取得空闲输入 Buffer；归还时必须使用同一个 bufferIndex。
    OH_AVBuffer *GetInputBuffer(CodecBufferInfo &info, int64_t timeoutUs);
    // 同步模式下取得编码输出；调用方写入 Muxer 后必须调用 FreeOutputData 归还。
    int32_t GetOutputBuffer(CodecBufferInfo &info, int64_t timeoutUs);
    int32_t FreeOutputData(uint32_t bufferIndex);
    // 提交 EOS 空输入 Buffer，通知编码器完成尾部数据输出；调用后仍需继续取输出直到收到 EOS。
    int32_t NotifyEndOfStream();
    int32_t Stop();
    // 销毁 codec 句柄。该操作后缓存的所有输入、输出 Buffer 索引都不能再使用。
    int32_t Release();

private:
    int32_t SetCallback(CodecUserData *codecUserData);
    int32_t Configure(const SampleInfo &sampleInfo);

    bool isAVBufferMode_ = false;
    // 由 OH_AudioCodec_CreateByMime 创建、由 Release() 销毁的音频编码器句柄。
    OH_AVCodec *encoder_ = nullptr;
};

#endif
