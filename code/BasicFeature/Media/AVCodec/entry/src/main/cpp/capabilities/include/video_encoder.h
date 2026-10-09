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

#ifndef VIDEOENCODER_H
#define VIDEOENCODER_H

#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_avbuffer_info.h>
#include <native_window/external_window.h>
#include <native_window/buffer_handle.h>
#include <mutex>
#include <shared_mutex>
#include <string>
#include "sample_info.h"
#include "sample_callback.h"
#include "dfx/error/av_codec_sample_error.h"
#include "av_codec_sample_log.h"

class VideoEncoder {
public:
    VideoEncoder() = default;
    ~VideoEncoder();

    int32_t Create(const std::string &videoCodecMime);
    // 按能力查询返回的确切编码器名称创建实例。名称必须与当前设备的能力查询结果一致。
    int32_t CreateByName(const std::string &videoCodecName);
    // 创建支持预处理的主编码器。主编码器的生命周期必须长于由它创建的副编码器。
    int32_t CreatePrimaryWithPreproc(const std::string &videoCodecMime);
    // 从主编码器创建副编码器。调用方必须先销毁副编码器，再销毁主编码器。
    int32_t CreateSecondaryFromPrimary(VideoEncoder &primaryEncoder);
    int32_t Config(SampleInfo &sampleInfo, CodecUserData *codecUserData);
    // 在 Configure 成功后申请内部资源；通常由 Config 统一完成，无需业务侧重复调用。
    int32_t Prepare();
    int32_t Start();
    // 清空已排队但尚未处理的输入、输出和编码参数；Flush 后此前取得的 Buffer 索引均不可继续使用。
    int32_t Flush();
    // 使编码器回到初始状态。Reset 后必须重新 Configure、Prepare 后才能再次 Start。
    int32_t Reset();
    // 运行期间动态更新编码参数。format 的创建和销毁仍由调用方负责。
    int32_t SetParameter(OH_AVFormat *format);
    // surface 模式下为指定输入帧提交参数；索引只能来自已注册的参数回调。
    int32_t PushInputParameter(uint32_t bufferIndex);
    // 注册 surface 模式的逐帧参数回调。userData 必须在停止回调并释放编码器前始终有效。
    int32_t RegisterParameterCallback(OH_VideoEncoder_OnNeedInputParameter callback, void *userData);
    // 查询空闲输入 Buffer 的索引。查询成功后，该索引只能用于对应的 GetInputBuffer 和 PushInputBuffer。
    int32_t QueryInputBuffer(uint32_t &bufferIndex, int64_t timeoutUs);
    // 同步模式下取得一个空闲输入 Buffer，并将同一 Buffer 与索引写入 info。
    OH_AVBuffer *GetInputBuffer(CodecBufferInfo &info, int64_t timeoutUs);
    // 查询已编码输出 Buffer 的索引。输出处理完成后必须调用 FreeOutputBuffer 归还该索引。
    int32_t QueryOutputBuffer(uint32_t &bufferIndex, int64_t timeoutUs);
    bool GetOutputBuffer(CodecBufferInfo &info, int64_t timeoutUs);
    int32_t PushInputBuffer(CodecBufferInfo &info);
    int32_t FreeOutputBuffer(uint32_t bufferIndex);
    int32_t NotifyEndOfStream();
    int32_t Stop();
    int32_t Release();
    // 返回编码输出描述。调用方必须在不再使用时调用 OH_AVFormat_Destroy 释放返回对象。
    OH_AVFormat *GetOutputDescription();
    // 返回编码输入描述。调用方必须在不再使用时调用 OH_AVFormat_Destroy 释放返回对象。
    OH_AVFormat *GetInputDescription();
    // 查询编码器服务是否仍然有效；只有返回成功时 isValid 才具有有效含义。
    int32_t IsValid(bool &isValid);

private:
    int32_t SetCallback(CodecUserData *codecUserData);
    int32_t Configure(const SampleInfo &sampleInfo);
    int32_t GetSurface(SampleInfo &sampleInfo);
    bool isAVBufferMode_ = false;
    std::shared_mutex codecMutex;
    OH_AVCodec *encoder_ = nullptr;
};
#endif
