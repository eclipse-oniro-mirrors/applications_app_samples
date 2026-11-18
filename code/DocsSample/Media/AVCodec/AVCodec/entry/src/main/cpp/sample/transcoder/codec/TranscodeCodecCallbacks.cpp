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

#include "TranscodeCodecCallbacks.h"
#include <multimedia/player_framework/native_averrors.h>

namespace {
constexpr size_t MAX_QUEUED_EVENTS = 128;
}

TranscodeCodecCallbacks::TranscodeCodecCallbacks() : decoder_ {this, false, {}, {}}, encoder_ {this, true, {}, {}} {}

OH_AVCodecCallback TranscodeCodecCallbacks::Callbacks()
{
    return {OnError, OnFormat, OnInput, OnOutput};
}

void TranscodeCodecCallbacks::SetError(bool encoder, int32_t error)
{
    if (error_ == AV_ERR_OK) {
        error_ = error == AV_ERR_OK ? AV_ERR_UNKNOWN : error;
        encoderError_ = encoder;
    }
}

void TranscodeCodecCallbacks::RecordError(Channel &channel, int32_t error)
{
    {
        std::lock_guard<std::mutex> lock(mutex_);
        if (closed_) { return; }
        SetError(channel.encoder, error);
        ++revision_;
    }
    changed_.notify_all();
}

void TranscodeCodecCallbacks::Enqueue(Channel &channel, bool input, const Event &event)
{
    {
        std::lock_guard<std::mutex> lock(mutex_);
        if (closed_ || error_ != AV_ERR_OK) { return; }
        auto &queue = input ? channel.inputs : channel.outputs;
        if ((!event.formatChanged && event.buffer.buffer == nullptr) || queue.size() >= MAX_QUEUED_EVENTS) {
            SetError(channel.encoder, event.buffer.buffer == nullptr && !event.formatChanged ?
                AV_ERR_INVALID_VAL : AV_ERR_NO_MEMORY);
        } else {
            queue.push_back(event);
        }
        ++revision_;
    }
    changed_.notify_all();
}

void TranscodeCodecCallbacks::OnError(OH_AVCodec *, int32_t error, void *userData)
{
    if (userData == nullptr) { return; }
    auto &channel = *static_cast<Channel *>(userData);
    channel.owner->RecordError(channel, error);
}

void TranscodeCodecCallbacks::OnFormat(OH_AVCodec *, OH_AVFormat *, void *userData)
{
    if (userData == nullptr) { return; }
    auto &channel = *static_cast<Channel *>(userData);
    // The format pointer is callback-scoped; the worker queries its own description after this marker.
    channel.owner->Enqueue(channel, false, {{}, true});
}

void TranscodeCodecCallbacks::OnInput(OH_AVCodec *, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    if (userData == nullptr) { return; }
    auto &channel = *static_cast<Channel *>(userData);
    channel.owner->Enqueue(channel, true, {{index, buffer}, false});
}

void TranscodeCodecCallbacks::OnOutput(OH_AVCodec *, uint32_t index, OH_AVBuffer *buffer, void *userData)
{
    if (userData == nullptr) { return; }
    auto &channel = *static_cast<Channel *>(userData);
    channel.owner->Enqueue(channel, false, {{index, buffer}, false});
}

int32_t TranscodeCodecCallbacks::Take(bool encoder, bool input, TranscodeCodecBuffer &buffer)
{
    std::lock_guard<std::mutex> lock(mutex_);
    buffer = {};
    if (error_ != AV_ERR_OK) { return error_; }
    auto &channel = encoder ? encoder_ : decoder_;
    auto &queue = input ? channel.inputs : channel.outputs;
    if (closed_ || queue.empty()) { return AV_ERR_TRY_AGAIN_LATER; }
    const Event event = queue.front();
    queue.pop_front();
    buffer = event.buffer;
    return event.formatChanged ? AV_ERR_STREAM_CHANGED : AV_ERR_OK;
}

int32_t TranscodeCodecCallbacks::Error(bool &encoder) const
{
    std::lock_guard<std::mutex> lock(mutex_);
    encoder = encoderError_;
    return error_;
}

uint64_t TranscodeCodecCallbacks::Revision() const
{
    std::lock_guard<std::mutex> lock(mutex_);
    return revision_;
}

void TranscodeCodecCallbacks::Wait(uint64_t revision, std::chrono::milliseconds timeout)
{
    std::unique_lock<std::mutex> lock(mutex_);
    changed_.wait_for(lock, timeout, [this, revision] { return closed_ || revision_ != revision; });
}

void TranscodeCodecCallbacks::Close()
{
    {
        std::lock_guard<std::mutex> lock(mutex_);
        closed_ = true;
        decoder_.inputs.clear();
        decoder_.outputs.clear();
        encoder_.inputs.clear();
        encoder_.outputs.clear();
        ++revision_;
    }
    changed_.notify_all();
}
