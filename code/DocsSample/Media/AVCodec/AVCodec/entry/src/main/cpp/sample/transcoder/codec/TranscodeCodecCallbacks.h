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

#ifndef AVCODEC_TRANSCODE_CODEC_CALLBACKS_H
#define AVCODEC_TRANSCODE_CODEC_CALLBACKS_H

#include <chrono>
#include <condition_variable>
#include <cstdint>
#include <deque>
#include <mutex>
#include <multimedia/player_framework/native_avcodec_base.h>

struct TranscodeCodecBuffer {
    uint32_t index = 0;
    OH_AVBuffer *buffer = nullptr;
};

// Callback queues borrow codec buffers. Only the job worker submits or returns their indices.
class TranscodeCodecCallbacks {
public:
    TranscodeCodecCallbacks();
    static OH_AVCodecCallback Callbacks();
    void *DecoderContext() { return &decoder_; }
    void *EncoderContext() { return &encoder_; }
    int32_t Take(bool encoder, bool input, TranscodeCodecBuffer &buffer);
    int32_t Error(bool &encoder) const;
    uint64_t Revision() const;
    void Wait(uint64_t revision, std::chrono::milliseconds timeout);
    void Close();

private:
    struct Event {
        TranscodeCodecBuffer buffer;
        bool formatChanged = false;
    };
    struct Channel {
        TranscodeCodecCallbacks *owner;
        bool encoder;
        std::deque<Event> inputs;
        std::deque<Event> outputs;
    };
    static void OnError(OH_AVCodec *codec, int32_t error, void *userData);
    static void OnFormat(OH_AVCodec *codec, OH_AVFormat *format, void *userData);
    static void OnInput(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData);
    static void OnOutput(OH_AVCodec *codec, uint32_t index, OH_AVBuffer *buffer, void *userData);
    void Enqueue(Channel &channel, bool input, const Event &event);
    void RecordError(Channel &channel, int32_t error);
    void SetError(bool encoder, int32_t error);

    mutable std::mutex mutex_;
    std::condition_variable changed_;
    Channel decoder_;
    Channel encoder_;
    uint64_t revision_ = 0;
    int32_t error_ = 0;
    bool encoderError_ = false;
    bool closed_ = false;
};
#endif
