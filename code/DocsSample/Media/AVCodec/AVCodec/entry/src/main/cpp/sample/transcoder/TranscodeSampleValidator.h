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

#ifndef AVCODEC_TRANSCODE_SAMPLE_VALIDATOR_H
#define AVCODEC_TRANSCODE_SAMPLE_VALIDATOR_H

#include <atomic>
#include <cstdint>
#include <string>

bool ValidateTranscodeOutputSample(int32_t outputFd, int32_t videoTrack, int64_t targetUs, int64_t durationUs,
                                   const std::atomic<bool> &cancelled, std::string &failure);

#endif
