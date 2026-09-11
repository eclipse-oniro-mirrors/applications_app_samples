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

#ifndef VIDEO_CODEC_AUDIO_OUTPUT_PUMP_H
#define VIDEO_CODEC_AUDIO_OUTPUT_PUMP_H

#include <atomic>
#include <functional>
#include "audio_decoder.h"
#include "sample_info.h"

class AudioOutputPump {
public:
    using OutputCallback = std::function<bool(CodecBufferInfo &)>;
    using OutputPrepareCallback = std::function<bool(CodecBufferInfo &)>;
    using DumpCallback = std::function<void(CodecBufferInfo &)>;

    struct Config {
        AudioDecoder &decoder;
        CodecUserData &context;
        std::atomic<bool> &running;
        std::atomic<bool> &playbackFailed;
        OutputPrepareCallback outputPrepareCallback;
        OutputCallback outputCallback;
        DumpCallback dumpCallback;
    };

    explicit AudioOutputPump(Config config);

    bool ProcessAsyncOutput();
    bool ProcessSyncOutput();

private:
    bool HandleOutputBuffer(CodecBufferInfo &bufferInfo, bool dumpOutput);
    bool EnqueueOutput(CodecBufferInfo &bufferInfo);
    void MarkPlaybackFailed(const char *message);

    AudioDecoder &decoder_;
    CodecUserData &context_;
    std::atomic<bool> &running_;
    std::atomic<bool> &playbackFailed_;
    OutputPrepareCallback outputPrepareCallback_;
    OutputCallback outputCallback_;
    DumpCallback dumpCallback_;
};

#endif // VIDEO_CODEC_AUDIO_OUTPUT_PUMP_H
