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

#include <cstdlib>
#include <deque>
#include <iostream>
#include "../../entry/src/main/cpp/capabilities/include/video_encoder.h"

struct OH_AVBuffer { OH_AVCodecBufferAttr attr {}; };
struct OH_AVFormat { bool input = false; };
struct OH_AVCodec {
    OH_AVBuffer input;
    OH_AVBuffer output;
    OH_AVErrCode inputStatus = AV_ERR_OK;
    OH_AVErrCode attrStatus = AV_ERR_OK;
    std::deque<OH_AVErrCode> outputResults;
    bool failInputGet = false;
    bool failOutputGet = false;
    bool formatAvailable = true;
    bool formatComplete = true;
    int32_t outputQueries = 0;
    int32_t inputDescriptions = 0;
    int32_t formatDestroys = 0;
    int32_t flushCalls = 0;
    int32_t stopCalls = 0;
};

const char *OH_MD_KEY_WIDTH = "width";
const char *OH_MD_KEY_HEIGHT = "height";
const char *OH_MD_KEY_VIDEO_PIC_WIDTH = "pictureWidth";
const char *OH_MD_KEY_VIDEO_PIC_HEIGHT = "pictureHeight";
const char *OH_MD_KEY_VIDEO_STRIDE = "stride";
const char *OH_MD_KEY_VIDEO_SLICE_HEIGHT = "sliceHeight";
const char *OH_MD_KEY_PIXEL_FORMAT = "pixelFormat";
const char *OH_MD_KEY_AUD_SAMPLE_RATE = "sampleRate";
const char *OH_MD_KEY_AUD_CHANNEL_COUNT = "channelCount";
const char *OH_MD_KEY_AUDIO_SAMPLE_FORMAT = "sampleFormat";

namespace {
constexpr int64_t QUERY_TIMEOUT_US = 100000;
constexpr uint32_t BUFFER_INDEX = 7;
constexpr int32_t FRAME_BYTES = 32;
constexpr int32_t FRAME_WIDTH = 1280;
constexpr int32_t FRAME_HEIGHT = 720;
constexpr int32_t INPUT_WIDTH_STRIDE = 1344;
constexpr int32_t INPUT_HEIGHT_STRIDE = 736;
constexpr int32_t FORMAT_CHANGE_QUERY_LIMIT = 2;
OH_AVCodec codec;
OH_AVFormat outputFormat;
OH_AVFormat inputFormat { true };

void Require(bool condition, const char *message)
{
    if (!condition) {
        std::cerr << message << '\n';
        std::exit(EXIT_FAILURE);
    }
}

void TestInputStatus()
{
    codec = {};
    VideoEncoder encoder;
    CodecBufferInfo info;
    Require(encoder.GetInputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR,
        "Missing encoder is an error");
    Require(encoder.Create("video/avc") == AVCODEC_SAMPLE_ERR_OK, "Create encoder");
    Require(encoder.GetInputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_OK &&
        info.buffer == &codec.input && info.bufferIndex == BUFFER_INDEX, "Input Buffer and index stay paired");
    codec.inputStatus = AV_ERR_TRY_AGAIN_LATER;
    Require(encoder.GetInputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_AGAIN && info.buffer == nullptr,
        "Input timeout permits retry and clears the previous Buffer");
    codec.inputStatus = AV_ERR_UNKNOWN;
    Require(encoder.GetInputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR,
        "Input query failure must not be retried as a timeout");
    codec.inputStatus = AV_ERR_OK;
    codec.failInputGet = true;
    Require(encoder.GetInputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR && info.buffer == nullptr,
        "Input Get failure is an error");
}

void TestOutputStatus()
{
    codec = {};
    VideoEncoder encoder;
    Require(encoder.Create("video/avc") == AVCODEC_SAMPLE_ERR_OK, "Create encoder");
    codec.output.attr.size = FRAME_BYTES;
    codec.output.attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    CodecBufferInfo info;
    Require(encoder.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_OK &&
        info.buffer == &codec.output && info.bufferIndex == BUFFER_INDEX && info.attr.size == FRAME_BYTES &&
        (info.attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0, "Output preserves Buffer, index, attributes and EOS");
    codec.outputResults = { AV_ERR_TRY_AGAIN_LATER, AV_ERR_UNKNOWN };
    Require(encoder.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_AGAIN && info.buffer == nullptr,
        "Output timeout clears stale data and permits retry");
    Require(encoder.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR,
        "Output query failure is distinct from timeout");
    codec.failOutputGet = true;
    Require(encoder.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR && info.buffer == nullptr,
        "Output Get failure is an error");
    codec.failOutputGet = false;
    codec.attrStatus = AV_ERR_UNKNOWN;
    Require(encoder.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR && info.buffer == nullptr,
        "Invalid attributes must not expose an output Buffer");
}

void TestFormatChanges()
{
    codec = {};
    VideoEncoder encoder;
    Require(encoder.Create("video/avc") == AVCODEC_SAMPLE_ERR_OK, "Create encoder");
    CodecBufferInfo info;
    codec.outputResults = { AV_ERR_STREAM_CHANGED, AV_ERR_OK };
    Require(encoder.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_OK &&
        codec.formatDestroys == 1, "Format change retries acquisition and releases the description");
    codec.outputResults = { AV_ERR_STREAM_CHANGED, AV_ERR_STREAM_CHANGED, AV_ERR_OK };
    const int32_t previousQueries = codec.outputQueries;
    Require(encoder.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_AGAIN && info.buffer == nullptr &&
        codec.outputQueries - previousQueries == FORMAT_CHANGE_QUERY_LIMIT,
        "Repeated format changes return control so the worker can observe stop");
    Require(encoder.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_OK,
        "Next poll resumes acquisition after repeated format changes");
    codec.outputResults = { AV_ERR_STREAM_CHANGED };
    codec.formatAvailable = false;
    Require(encoder.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR,
        "Missing output description is an error");
    codec.formatAvailable = true;
    codec.formatComplete = false;
    codec.outputResults = { AV_ERR_STREAM_CHANGED };
    Require(encoder.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR,
        "Incomplete output description is an error");
}

void TestStopWithoutFlush()
{
    codec = {};
    VideoEncoder encoder;
    Require(encoder.Create("video/avc") == AVCODEC_SAMPLE_ERR_OK, "Create encoder");
    Require(encoder.Stop() == AVCODEC_SAMPLE_ERR_OK && codec.stopCalls == 1 && codec.flushCalls == 0,
        "Stop must not implicitly call Flush");
}

void TestInputLayoutCallback()
{
    codec = {};
    CodecUserData context;
    context.isEncFirstFrame = true;
    SampleCallback::OnNeedInputBuffer(&codec, BUFFER_INDEX, &codec.input, &context);
    Require(codec.inputDescriptions == 1 && !context.isEncFirstFrame && !context.hasError &&
        context.inputWidthStride == INPUT_WIDTH_STRIDE && context.inputHeightStride == INPUT_HEIGHT_STRIDE &&
        context.inputPixelFormat == AV_PIXEL_FORMAT_NV12, "First input callback caches the actual input layout");
    const auto input = context.inputBufferQueue.Dequeue(0);
    Require(input != nullptr && input->buffer == &codec.input && input->bufferIndex == BUFFER_INDEX,
        "Input layout is ready before publishing the callback Buffer");
    SampleCallback::OnCodecFormatChange(&codec, &outputFormat, &context);
    Require(context.widthStride == FRAME_WIDTH && context.inputWidthStride == INPUT_WIDTH_STRIDE &&
        context.heightStride == FRAME_HEIGHT && context.inputHeightStride == INPUT_HEIGHT_STRIDE &&
        context.inputPixelFormat == AV_PIXEL_FORMAT_NV12 && context.outputPixelFormat == AV_PIXEL_FORMAT_NV21,
        "Output format changes must not overwrite encoder input layout");
    SampleCallback::OnNeedInputBuffer(&codec, BUFFER_INDEX, &codec.input, &context);
    Require(codec.inputDescriptions == 1, "Later input callbacks reuse the first input description");
    CodecUserData invalid;
    invalid.isEncFirstFrame = true;
    codec.formatComplete = false;
    SampleCallback::OnNeedInputBuffer(&codec, BUFFER_INDEX, &codec.input, &invalid);
    Require(invalid.hasError && invalid.inputBufferQueue.Dequeue(0) == nullptr,
        "Missing layout fails the callback instead of exposing an unusable Buffer");
}
} // namespace

extern "C" OH_AVCodec *OH_VideoEncoder_CreateByMime(const char *) { return &codec; }
extern "C" OH_AVErrCode OH_VideoEncoder_Destroy(OH_AVCodec *) { return AV_ERR_OK; }
extern "C" OH_AVErrCode OH_VideoEncoder_QueryInputBuffer(OH_AVCodec *, uint32_t *index, int64_t)
{
    *index = BUFFER_INDEX;
    return codec.inputStatus;
}
extern "C" OH_AVBuffer *OH_VideoEncoder_GetInputBuffer(OH_AVCodec *, uint32_t index)
{
    Require(index == BUFFER_INDEX, "Input Get must use the queried index");
    return codec.failInputGet ? nullptr : &codec.input;
}
extern "C" OH_AVErrCode OH_VideoEncoder_QueryOutputBuffer(OH_AVCodec *, uint32_t *index, int64_t)
{
    ++codec.outputQueries;
    *index = BUFFER_INDEX;
    if (codec.outputResults.empty()) { return AV_ERR_OK; }
    const auto status = codec.outputResults.front();
    codec.outputResults.pop_front();
    return status;
}
extern "C" OH_AVBuffer *OH_VideoEncoder_GetOutputBuffer(OH_AVCodec *, uint32_t index)
{
    Require(index == BUFFER_INDEX, "Output Get must use the queried index");
    return codec.failOutputGet ? nullptr : &codec.output;
}
extern "C" OH_AVErrCode OH_AVBuffer_GetBufferAttr(OH_AVBuffer *buffer, OH_AVCodecBufferAttr *attr)
{
    *attr = buffer->attr;
    return codec.attrStatus;
}
extern "C" OH_AVFormat *OH_VideoEncoder_GetOutputDescription(OH_AVCodec *)
{
    return codec.formatAvailable ? &outputFormat : nullptr;
}
extern "C" OH_AVFormat *OH_VideoEncoder_GetInputDescription(OH_AVCodec *)
{
    ++codec.inputDescriptions;
    return &inputFormat;
}
extern "C" bool OH_AVFormat_GetIntValue(OH_AVFormat *format, const char *key, int32_t *value)
{
    const std::string name(key);
    if (name == OH_MD_KEY_WIDTH || name == OH_MD_KEY_VIDEO_PIC_WIDTH) { *value = FRAME_WIDTH; }
    else if (name == OH_MD_KEY_HEIGHT || name == OH_MD_KEY_VIDEO_PIC_HEIGHT) { *value = FRAME_HEIGHT; }
    else if (name == OH_MD_KEY_VIDEO_STRIDE) { *value = format->input ? INPUT_WIDTH_STRIDE : FRAME_WIDTH; }
    else if (name == OH_MD_KEY_VIDEO_SLICE_HEIGHT) { *value = format->input ? INPUT_HEIGHT_STRIDE : FRAME_HEIGHT; }
    else if (name == OH_MD_KEY_PIXEL_FORMAT) {
        *value = format->input ? AV_PIXEL_FORMAT_NV12 : AV_PIXEL_FORMAT_NV21;
    } else { return false; }
    return codec.formatComplete;
}
extern "C" void OH_AVFormat_Destroy(OH_AVFormat *) { ++codec.formatDestroys; }
extern "C" OH_AVErrCode OH_VideoEncoder_Stop(OH_AVCodec *)
{
    ++codec.stopCalls;
    return AV_ERR_OK;
}
extern "C" OH_AVErrCode OH_VideoEncoder_Flush(OH_AVCodec *)
{
    ++codec.flushCalls;
    return AV_ERR_OK;
}
extern "C" int OH_LOG_Print(LogType, LogLevel, unsigned int, const char *, const char *, ...) { return 0; }

int main()
{
    TestInputStatus();
    TestOutputStatus();
    TestFormatChanges();
    TestStopWithoutFlush();
    TestInputLayoutCallback();
    std::cout << "Encoder Buffers: retry, errors, EOS, independent Stop and isolated input/output layout passed\n";
}
