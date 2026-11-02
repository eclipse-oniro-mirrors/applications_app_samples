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

#include "TranscodeJob.h"
#include <multimedia/player_framework/native_averrors.h>

bool TranscodeJob::RegisterCodecCallbacks()
{
    if (options_.codecMode == 0) { return true; }
    const OH_AVCodecCallback callbacks = TranscodeCodecCallbacks::Callbacks();
    return Check(OH_VideoDecoder_RegisterCallback(decoder_, callbacks, codecCallbacks_.DecoderContext()),
        "Register asynchronous video decoder") &&
        Check(OH_VideoEncoder_RegisterCallback(encoder_, callbacks, codecCallbacks_.EncoderContext()),
            "Register asynchronous video encoder");
}

bool TranscodeJob::CheckCodecCallbacks()
{
    if (options_.codecMode == 0) { return true; }
    bool encoder = false;
    const int32_t error = codecCallbacks_.Error(encoder);
    return Check(error, encoder ? "Asynchronous video encoder callback" : "Asynchronous video decoder callback");
}

int32_t TranscodeJob::AcquireCodecBuffer(bool encoder, bool input, TranscodeCodecBuffer &buffer)
{
    if (options_.codecMode == 1 && !options_.previewOnly) {
        return codecCallbacks_.Take(encoder, input, buffer);
    }
    buffer = {};
    int32_t result = AV_ERR_OK;
    if (encoder) {
        result = input ? OH_VideoEncoder_QueryInputBuffer(encoder_, &buffer.index, 0) :
            OH_VideoEncoder_QueryOutputBuffer(encoder_, &buffer.index, 0);
        if (result == AV_ERR_OK) {
            buffer.buffer = input ? OH_VideoEncoder_GetInputBuffer(encoder_, buffer.index) :
                OH_VideoEncoder_GetOutputBuffer(encoder_, buffer.index);
        }
    } else {
        result = input ? OH_VideoDecoder_QueryInputBuffer(decoder_, &buffer.index, 0) :
            OH_VideoDecoder_QueryOutputBuffer(decoder_, &buffer.index, 0);
        if (result == AV_ERR_OK) {
            buffer.buffer = input ? OH_VideoDecoder_GetInputBuffer(decoder_, buffer.index) :
                OH_VideoDecoder_GetOutputBuffer(decoder_, buffer.index);
        }
    }
    return result;
}
