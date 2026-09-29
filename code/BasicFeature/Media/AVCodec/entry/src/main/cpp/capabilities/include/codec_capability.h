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
OH_AVCapability *GetCapability(const std::string &mime, bool isEncoder, int32_t codecType);
bool ValidateVideoConfiguration(const SampleInfo &sampleInfo, bool isEncoder);
bool ValidateVideoFeatureConfiguration(const SampleInfo &sampleInfo);
bool ValidateAudioConfiguration(const SampleInfo &sampleInfo, bool isEncoder);
} // namespace CodecCapability

#endif // AVCODEC_SAMPLE_CODEC_CAPABILITY_H
