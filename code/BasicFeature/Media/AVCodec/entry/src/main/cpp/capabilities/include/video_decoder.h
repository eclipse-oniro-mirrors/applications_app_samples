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

#ifndef VIDEODECODER_H
#define VIDEODECODER_H

#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avbuffer_info.h>
#include <multimedia/player_framework/native_averrors.h>
#include "sample_info.h"
#include "sample_callback.h"
#include "dfx/error/av_codec_sample_error.h"
#include "av_codec_sample_log.h"
#include <shared_mutex>

class VideoDecoder {
public:
    VideoDecoder() = default;
    ~VideoDecoder();

    int32_t Create(const std::string &videoCodecMime, int32_t videoDecoderType);
    // 按 codec 名称创建解码器。创建成功后由 Release() 统一销毁，避免调用方直接管理 OH_AVCodec 生命周期。
    int32_t CreateByName(const std::string &codecName);
    int32_t Config(const SampleInfo &sampleInfo, CodecUserData *codecUserData);

    // 以下接口与 Native SDK 的状态机一一对应，调用方需按“配置、设置输出 Surface、准备、启动”的顺序使用。
    // 直接传入 OH_AVFormat 时，调用方负责保证格式对象在本次调用期间有效，并完成能力查询。
    int32_t Configure(OH_AVFormat *format);
    int32_t SetSurface(OHNativeWindow *window);
    int32_t Prepare();
    int32_t PushInputBuffer(CodecBufferInfo &info);

    // 同步模式下先查询可用索引，再获取对应 Buffer；Buffer 归还给 codec 后不能继续访问。
    int32_t QueryInputBuffer(uint32_t &bufferIndex, int64_t timeoutUs);
    OH_AVBuffer *GetInputBuffer(uint32_t bufferIndex);
    OH_AVBuffer* GetInputBuffer(CodecBufferInfo &info, int64_t timeoutUs);

    // 同步模式下先查询输出索引，再获取对应 Buffer；输出 Buffer 必须及时送显或释放。
    int32_t QueryOutputBuffer(uint32_t &bufferIndex, int64_t timeoutUs);
    OH_AVBuffer *GetOutputBuffer(uint32_t bufferIndex);
    int32_t GetOutputBuffer(CodecBufferInfo &info, int64_t timeoutUs);

    // 直接送显、定时送显和仅归还输出 Buffer 的接口。三者均以同一个输出索引作为归还凭据。
    int32_t RenderOutputBuffer(uint32_t bufferIndex);
    int32_t RenderOutputBufferAtTime(uint32_t bufferIndex, int64_t timeStamp);
    int32_t FreeOutputBuffer(uint32_t bufferIndex);
    int32_t FreeOutputBuffer(uint32_t bufferIndex, bool render);
    int32_t FreeOutputBuffer(uint32_t bufferIndex, bool render, int64_t timeStamp);
    int32_t Start();
    int32_t Stop();
    int32_t Flush();
    int32_t Reset();
    int32_t Release();

    // 获取的格式对象所有权属于调用方，使用完毕必须调用 OH_AVFormat_Destroy()。
    OH_AVFormat *GetOutputDescription();

    // 解码器启动后可通过该接口更新动态参数；格式对象由调用方创建和销毁。
    int32_t SetParameter(OH_AVFormat *format);
    // 查询 codec 服务是否仍可用。调用前会将 isValid 置为 false，只有成功返回时结果才有效。
    int32_t IsValid(bool &isValid);
    // 在 Prepare() 前设置 DRM 解密会话；Buffer 模式不支持安全视频通路。
    int32_t SetDecryptionConfig(MediaKeySession *mediaKeySession, bool secureVideoPath);
    int32_t OnUserSpeedChanged(double targetSpeed);
    int32_t OnThermalWarningReceived(double ratio);

private:
    int32_t SetCallback(CodecUserData *codecUserData);
    // SampleInfo 配置入口保留为私有实现，统一执行能力校验和播放设置映射，避免绕过示例的配置约束。
    int32_t Configure(const SampleInfo &sampleInfo);
    OH_AVCodec *GetCodecByCategory(const char *mime, bool isEncoder, OH_AVCodecCategory category);

    bool isAVBufferMode_ = false;
    std::shared_mutex codecMutex;
    OH_AVCodec *decoder_ = nullptr;
};
#endif
