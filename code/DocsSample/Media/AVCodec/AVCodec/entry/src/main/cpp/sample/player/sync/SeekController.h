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

#ifndef AVCODEC_SAMPLE_SEEK_CONTROLLER_H
#define AVCODEC_SAMPLE_SEEK_CONTROLLER_H

#include <cstdint>
#include "codec_buffer.h"

enum AudioSeekResult : int32_t {
    AUDIO_SEEK_KEEP,
    AUDIO_SEEK_DISCARD,
    AUDIO_SEEK_ERROR,
};

struct VideoSeekDecision {
    bool discardFrame = false;
    bool reachedTarget = false;
};

class SeekController {
public:
    VideoSeekDecision DecideVideoFrame(int64_t ptsUs, int64_t targetUs, bool &discardUntilTarget) const;
    AudioSeekResult TrimAudioFrame(CodecBufferInfo &bufferInfo, int64_t targetUs,
        int32_t sampleRate, int32_t channelCount, int32_t capacity) const;
};

#endif // AVCODEC_SAMPLE_SEEK_CONTROLLER_H
