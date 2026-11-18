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

#ifndef AVCODEC_SAMPLE_CODEC_CAPABILITY_H
#define AVCODEC_SAMPLE_CODEC_CAPABILITY_H

#include <multimedia/player_framework/native_avcapability.h>
#include "sample_info.h"

namespace CodecCapability {
// 根据 MIME、编码/解码方向和软硬件类别查询当前设备能力；返回值由系统管理，不能释放或长期保存。
OH_AVCapability *GetCapability(const std::string &mime, bool isEncoder, int32_t codecType);
// 校验视频尺寸、帧率、像素格式及编码参数，在 Configure 前筛掉不支持的配置。
bool ValidateVideoConfiguration(const SampleInfo &sampleInfo, bool isEncoder);
// 校验低时延、解码序输出等可选视频能力；未请求任何可选能力时直接通过。
bool ValidateVideoFeatureConfiguration(const SampleInfo &sampleInfo);
// 校验音频编码参数；解码器的容器格式能力可能不完整，因此最终结果仍以 Configure 为准。
bool ValidateAudioConfiguration(const SampleInfo &sampleInfo, bool isEncoder);
} // 编解码能力查询命名空间

#endif // AVCODEC_SAMPLE_CODEC_CAPABILITY_H
