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

#include <atomic>
#include <cstdlib>
#include <iostream>
#include <thread>
#include "../../entry/src/main/cpp/sample/transcoder/TranscodeCodecCallbacks.h"
#include <multimedia/player_framework/native_averrors.h>

struct OH_AVBuffer { OH_AVCodecBufferAttr attr {}; };

namespace {
constexpr int32_t EVENT_LIMIT = 128;
constexpr int32_t RACE_ITERATIONS = 1000;
constexpr uint32_t ENCODER_INPUT_INDEX = 7;
constexpr uint32_t DECODER_OUTPUT_INDEX = 8;
constexpr uint32_t DECODER_EOS_INDEX = 9;
constexpr uint32_t ENCODER_OUTPUT_INDEX = 10;
constexpr uint32_t LATE_OUTPUT_INDEX = 2;
constexpr auto CALLBACK_WAIT_TIMEOUT = std::chrono::seconds(5);
constexpr auto WAKEUP_LIMIT = std::chrono::seconds(1);

void Require(bool condition, const char *message)
{
    if (!condition) {
        std::cerr << message << '\n';
        std::exit(EXIT_FAILURE);
    }
}

void TestOrderingAndOwnership()
{
    TranscodeCodecCallbacks queues;
    const auto callback = TranscodeCodecCallbacks::Callbacks();
    OH_AVBuffer input;
    OH_AVBuffer frame;
    OH_AVBuffer eos;
    eos.attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    callback.onNeedInputBuffer(nullptr, ENCODER_INPUT_INDEX, &input, queues.EncoderContext());
    callback.onStreamChanged(nullptr, nullptr, queues.DecoderContext());
    callback.onNewOutputBuffer(nullptr, DECODER_OUTPUT_INDEX, &frame, queues.DecoderContext());
    callback.onNewOutputBuffer(nullptr, DECODER_EOS_INDEX, &eos, queues.DecoderContext());
    TranscodeCodecBuffer buffer;
    Require(queues.Take(false, true, buffer) == AV_ERR_TRY_AGAIN_LATER, "Input channels must remain separate");
    Require(queues.Take(true, true, buffer) == AV_ERR_OK &&
        buffer.index == ENCODER_INPUT_INDEX && buffer.buffer == &input,
        "Encoder input uses the callback Buffer, not a new allocation");
    Require(queues.Take(false, false, buffer) == AV_ERR_STREAM_CHANGED && buffer.buffer == nullptr,
        "Format marker precedes decoded output and retains no format pointer");
    Require(queues.Take(false, false, buffer) == AV_ERR_OK &&
        buffer.index == DECODER_OUTPUT_INDEX && buffer.buffer == &frame,
        "Borrow decoded frame");
    // Waiting for encoder input does not invalidate a borrowed decoder output.
    TranscodeCodecBuffer unavailable;
    Require(queues.Take(true, true, unavailable) == AV_ERR_TRY_AGAIN_LATER && buffer.buffer == &frame,
        "Backpressure retains the borrowed frame");
    Require(queues.Take(false, false, buffer) == AV_ERR_OK && buffer.index == DECODER_EOS_INDEX &&
        (buffer.buffer->attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0, "EOS remains ordered behind the tail frame");
    Require(queues.Take(false, false, buffer) == AV_ERR_TRY_AGAIN_LATER && buffer.buffer == nullptr,
        "Consumed buffers are delivered once");
    callback.onNewOutputBuffer(nullptr, ENCODER_OUTPUT_INDEX, &frame, queues.EncoderContext());
    Require(queues.Take(true, false, buffer) == AV_ERR_OK && buffer.index == ENCODER_OUTPUT_INDEX,
        "Encoder output channel");
}

void TestErrorsAndBounds()
{
    const auto callback = TranscodeCodecCallbacks::Callbacks();
    TranscodeCodecCallbacks queues;
    callback.onError(nullptr, AV_ERR_UNKNOWN, queues.DecoderContext());
    callback.onError(nullptr, AV_ERR_INVALID_VAL, queues.EncoderContext());
    bool encoder = true;
    Require(queues.Error(encoder) == AV_ERR_UNKNOWN && !encoder, "First codec error and origin retained");
    TranscodeCodecBuffer buffer;
    Require(queues.Take(true, true, buffer) == AV_ERR_UNKNOWN, "Errors cannot hide behind an empty input queue");
    TranscodeCodecCallbacks invalid;
    callback.onNewOutputBuffer(nullptr, 1, nullptr, invalid.EncoderContext());
    Require(invalid.Error(encoder) == AV_ERR_INVALID_VAL && encoder, "Invalid callback buffer fails explicitly");
    TranscodeCodecCallbacks bounded;
    OH_AVBuffer frame;
    for (int32_t i = 0; i <= EVENT_LIMIT; ++i) {
        callback.onNewOutputBuffer(nullptr, static_cast<uint32_t>(i), &frame, bounded.DecoderContext());
    }
    Require(bounded.Error(encoder) == AV_ERR_NO_MEMORY && !encoder,
        "Overflow fails instead of silently dropping frames");
}

void TestWakeAndClose()
{
    TranscodeCodecCallbacks queues;
    const auto callback = TranscodeCodecCallbacks::Callbacks();
    OH_AVBuffer frame;
    const uint64_t revision = queues.Revision();
    // An event arriving between the worker pump and Wait must not be lost.
    callback.onNewOutputBuffer(nullptr, 1, &frame, queues.DecoderContext());
    const auto begin = std::chrono::steady_clock::now();
    queues.Wait(revision, CALLBACK_WAIT_TIMEOUT);
    Require(std::chrono::steady_clock::now() - begin < WAKEUP_LIMIT, "No lost callback wakeup");
    std::atomic<bool> entered {false};
    std::thread waiter([&queues, &entered] {
        const auto current = queues.Revision();
        entered.store(true);
        queues.Wait(current, CALLBACK_WAIT_TIMEOUT);
    });
    while (!entered.load()) { std::this_thread::yield(); }
    const auto closing = std::chrono::steady_clock::now();
    queues.Close();
    waiter.join();
    Require(std::chrono::steady_clock::now() - closing < WAKEUP_LIMIT, "Cancellation wakes the worker");
    std::thread late([&callback, &frame, &queues] {
        for (int32_t i = 0; i < RACE_ITERATIONS; ++i) {
            callback.onNewOutputBuffer(nullptr, LATE_OUTPUT_INDEX, &frame, queues.DecoderContext());
            callback.onStreamChanged(nullptr, nullptr, queues.EncoderContext());
            callback.onError(nullptr, AV_ERR_UNKNOWN, queues.EncoderContext());
        }
    });
    for (int32_t i = 0; i < RACE_ITERATIONS; ++i) { queues.Close(); }
    late.join();
    TranscodeCodecBuffer buffer;
    bool encoder = false;
    Require(queues.Error(encoder) == AV_ERR_OK && queues.Take(false, false, buffer) == AV_ERR_TRY_AGAIN_LATER,
        "Late shutdown callbacks neither enqueue borrowed buffers nor change the result");
}
}

int main()
{
    TestOrderingAndOwnership();
    TestErrorsAndBounds();
    TestWakeAndClose();
    std::cout << "Transcode callbacks: channels, ownership, EOS, format order, bounds, errors and shutdown passed\n";
}
