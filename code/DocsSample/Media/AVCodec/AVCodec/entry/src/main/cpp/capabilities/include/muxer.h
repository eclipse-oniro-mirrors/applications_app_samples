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

#ifndef MUXER_H
#define MUXER_H

#include <bits/alltypes.h>
#include "multimedia/player_framework/native_avmuxer.h"
#include "sample_info.h"
#include "dfx/error/av_codec_sample_error.h"
#include "av_codec_sample_log.h"

class Muxer {
public:
    Muxer() = default;
    ~Muxer();

    // 以调用方提供的输出 fd 创建封装器；fd 的关闭责任仍属于调用方。
    int32_t Create(int32_t fd, int32_t outputFormat);
    // 创建音视频轨道并写入必要的格式、色彩和旋转元数据；Start 前必须先完成 Config。
    int32_t Config(SampleInfo &sampleInfo);
    int32_t SetRotation();
    int32_t AddAudioTrack(SampleInfo &sampleInfo);
    int32_t AddVideoTrack(SampleInfo &sampleInfo);
    int32_t Start();
    // 将编码器输出写入指定轨道。buffer 在返回前必须保持有效，随后仍需由编码器侧归还。
    int32_t WriteSample(int32_t trackId, OH_AVBuffer *buffer, OH_AVCodecBufferAttr &attr);
    int32_t Stop();
    // 销毁封装器并释放音视频框架资源；不会关闭传入 Create 的输出 fd。
    int32_t Release();
    int32_t GetVideoTrackId();
    int32_t GetAudioTrackId();

private:
    // 由 OH_AVMuxer_Create 创建、由 Release() 销毁的封装器句柄。
    OH_AVMuxer *muxer_ = nullptr;
    int32_t outputFormat_ = 2;
    int32_t videoTrackId_ = -1;
    int32_t audioTrackId_ = -1;
    // 音视频输出线程可能并发写入，必须串行化容器写操作以保持时间线完整。
    std::mutex writeMutex_;
};

#endif
