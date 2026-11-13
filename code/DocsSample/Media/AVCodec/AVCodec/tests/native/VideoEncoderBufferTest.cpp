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

struct OH_AVBuffer {
    OH_AVCodecBufferAttr attr {};
};
struct OH_AVFormat {
    bool input = false;
};
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
OH_AVCodec g_codec;
OH_AVFormat g_outputFormat;
OH_AVFormat g_inputFormat { true };

void Require(bool condition, const char *message)
{
    if (!condition) {
        std::cerr << message << '\n';
        std::exit(EXIT_FAILURE);
    }
}

void TestInputStatus()
{
    g_codec = {};
    VideoEncoder encoder;
    CodecBufferInfo info;
    Require(encoder.GetInputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR,
        "Missing encoder is an error");
    Require(encoder.Create("video/avc") == AVCODEC_SAMPLE_ERR_OK, "Create encoder");
    Require(encoder.GetInputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_OK &&
        info.buffer == &g_codec.input && info.bufferIndex == BUFFER_INDEX, "Input Buffer and index stay paired");
    g_codec.inputStatus = AV_ERR_TRY_AGAIN_LATER;
    Require(encoder.GetInputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_AGAIN && info.buffer == nullptr,
        "Input timeout permits retry and clears the previous Buffer");
    g_codec.inputStatus = AV_ERR_UNKNOWN;
    Require(encoder.GetInputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR,
        "Input query failure must not be retried as a timeout");
    g_codec.inputStatus = AV_ERR_OK;
    g_codec.failInputGet = true;
    Require(encoder.GetInputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR && info.buffer == nullptr,
        "Input Get failure is an error");
}

void TestOutputStatus()
{
    g_codec = {};
    VideoEncoder encoder;
    Require(encoder.Create("video/avc") == AVCODEC_SAMPLE_ERR_OK, "Create encoder");
    g_codec.output.attr.size = FRAME_BYTES;
    g_codec.output.attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    CodecBufferInfo info;
    Require(encoder.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_OK &&
        info.buffer == &g_codec.output && info.bufferIndex == BUFFER_INDEX && info.attr.size == FRAME_BYTES &&
        (info.attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0, "Output preserves Buffer, index, attributes and EOS");
    g_codec.outputResults = { AV_ERR_TRY_AGAIN_LATER, AV_ERR_UNKNOWN };
    Require(encoder.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_AGAIN && info.buffer == nullptr,
        "Output timeout clears stale data and permits retry");
    Require(encoder.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR,
        "Output query failure is distinct from timeout");
    g_codec.failOutputGet = true;
    Require(encoder.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR && info.buffer == nullptr,
        "Output Get failure is an error");
    g_codec.failOutputGet = false;
    g_codec.attrStatus = AV_ERR_UNKNOWN;
    Require(encoder.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR && info.buffer == nullptr,
        "Invalid attributes must not expose an output Buffer");
}

void TestFormatChanges()
{
    g_codec = {};
    VideoEncoder encoder;
    Require(encoder.Create("video/avc") == AVCODEC_SAMPLE_ERR_OK, "Create encoder");
    CodecBufferInfo info;
    g_codec.outputResults = { AV_ERR_STREAM_CHANGED, AV_ERR_OK };
    Require(encoder.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_OK &&
        g_codec.formatDestroys == 1, "Format change retries acquisition and releases the description");
    g_codec.outputResults = { AV_ERR_STREAM_CHANGED, AV_ERR_STREAM_CHANGED, AV_ERR_OK };
    const int32_t previousQueries = g_codec.outputQueries;
    Require(encoder.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_AGAIN && info.buffer == nullptr &&
        g_codec.outputQueries - previousQueries == FORMAT_CHANGE_QUERY_LIMIT,
        "Repeated format changes return control so the worker can observe stop");
    Require(encoder.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_OK,
        "Next poll resumes acquisition after repeated format changes");
    g_codec.outputResults = { AV_ERR_STREAM_CHANGED };
    g_codec.formatAvailable = false;
    Require(encoder.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR,
        "Missing output description is an error");
    g_codec.formatAvailable = true;
    g_codec.formatComplete = false;
    g_codec.outputResults = { AV_ERR_STREAM_CHANGED };
    Require(encoder.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR,
        "Incomplete output description is an error");
}

void TestStopWithoutFlush()
{
    g_codec = {};
    VideoEncoder encoder;
    Require(encoder.Create("video/avc") == AVCODEC_SAMPLE_ERR_OK, "Create encoder");
    Require(encoder.Stop() == AVCODEC_SAMPLE_ERR_OK && g_codec.stopCalls == 1 && g_codec.flushCalls == 0,
        "Stop must not implicitly call Flush");
}

void TestInputLayoutCallback()
{
    g_codec = {};
    CodecUserData context;
    context.isEncFirstFrame = true;
    SampleCallback::OnNeedInputBuffer(&g_codec, BUFFER_INDEX, &g_codec.input, &context);
    Require(g_codec.inputDescriptions == 1 && !context.isEncFirstFrame && !context.hasError &&
        context.inputWidthStride == INPUT_WIDTH_STRIDE && context.inputHeightStride == INPUT_HEIGHT_STRIDE &&
        context.inputPixelFormat == AV_PIXEL_FORMAT_NV12, "First input callback caches the actual input layout");
    const auto input = context.inputBufferQueue.Dequeue(0);
    Require(input != nullptr && input->buffer == &g_codec.input && input->bufferIndex == BUFFER_INDEX,
        "Input layout is ready before publishing the callback Buffer");
    SampleCallback::OnCodecFormatChange(&g_codec, &g_outputFormat, &context);
    Require(context.widthStride == FRAME_WIDTH && context.inputWidthStride == INPUT_WIDTH_STRIDE &&
        context.heightStride == FRAME_HEIGHT && context.inputHeightStride == INPUT_HEIGHT_STRIDE &&
        context.inputPixelFormat == AV_PIXEL_FORMAT_NV12 && context.outputPixelFormat == AV_PIXEL_FORMAT_NV21,
        "Output format changes must not overwrite encoder input layout");
    SampleCallback::OnNeedInputBuffer(&g_codec, BUFFER_INDEX, &g_codec.input, &context);
    Require(g_codec.inputDescriptions == 1, "Later input callbacks reuse the first input description");
    CodecUserData invalid;
    invalid.isEncFirstFrame = true;
    g_codec.formatComplete = false;
    SampleCallback::OnNeedInputBuffer(&g_codec, BUFFER_INDEX, &g_codec.input, &invalid);
    Require(invalid.hasError && invalid.inputBufferQueue.Dequeue(0) == nullptr,
        "Missing layout fails the callback instead of exposing an unusable Buffer");
}
} // namespace

extern "C" OH_AVCodec *FakeVideoEncoderCreateByMime(const char *)
    __asm__("OH_VideoEncoder_CreateByMime");
extern "C" OH_AVCodec *FakeVideoEncoderCreateByMime(const char *)
{
    return &g_codec;
}
extern "C" OH_AVErrCode FakeVideoEncoderDestroy(OH_AVCodec *)
    __asm__("OH_VideoEncoder_Destroy");
extern "C" OH_AVErrCode FakeVideoEncoderDestroy(OH_AVCodec *)
{
    return AV_ERR_OK;
}
extern "C" OH_AVErrCode FakeVideoEncoderQueryInputBuffer(OH_AVCodec *, uint32_t *index, int64_t)
    __asm__("OH_VideoEncoder_QueryInputBuffer");
extern "C" OH_AVErrCode FakeVideoEncoderQueryInputBuffer(OH_AVCodec *, uint32_t *index, int64_t)
{
    *index = BUFFER_INDEX;
    return g_codec.inputStatus;
}
extern "C" OH_AVBuffer *FakeVideoEncoderGetInputBuffer(OH_AVCodec *, uint32_t index)
    __asm__("OH_VideoEncoder_GetInputBuffer");
extern "C" OH_AVBuffer *FakeVideoEncoderGetInputBuffer(OH_AVCodec *, uint32_t index)
{
    Require(index == BUFFER_INDEX, "Input Get must use the queried index");
    return g_codec.failInputGet ? nullptr : &g_codec.input;
}
extern "C" OH_AVErrCode FakeVideoEncoderQueryOutputBuffer(OH_AVCodec *, uint32_t *index, int64_t)
    __asm__("OH_VideoEncoder_QueryOutputBuffer");
extern "C" OH_AVErrCode FakeVideoEncoderQueryOutputBuffer(OH_AVCodec *, uint32_t *index, int64_t)
{
    ++g_codec.outputQueries;
    *index = BUFFER_INDEX;
    if (g_codec.outputResults.empty()) {
        return AV_ERR_OK;
    }
    const auto status = g_codec.outputResults.front();
    g_codec.outputResults.pop_front();
    return status;
}
extern "C" OH_AVBuffer *FakeVideoEncoderGetOutputBuffer(OH_AVCodec *, uint32_t index)
    __asm__("OH_VideoEncoder_GetOutputBuffer");
extern "C" OH_AVBuffer *FakeVideoEncoderGetOutputBuffer(OH_AVCodec *, uint32_t index)
{
    Require(index == BUFFER_INDEX, "Output Get must use the queried index");
    return g_codec.failOutputGet ? nullptr : &g_codec.output;
}
extern "C" OH_AVErrCode FakeAvBufferGetBufferAttr(OH_AVBuffer *buffer, OH_AVCodecBufferAttr *attr)
    __asm__("OH_AVBuffer_GetBufferAttr");
extern "C" OH_AVErrCode FakeAvBufferGetBufferAttr(OH_AVBuffer *buffer, OH_AVCodecBufferAttr *attr)
{
    *attr = buffer->attr;
    return g_codec.attrStatus;
}
extern "C" OH_AVFormat *FakeVideoEncoderGetOutputDescription(OH_AVCodec *)
    __asm__("OH_VideoEncoder_GetOutputDescription");
extern "C" OH_AVFormat *FakeVideoEncoderGetOutputDescription(OH_AVCodec *)
{
    return g_codec.formatAvailable ? &g_outputFormat : nullptr;
}
extern "C" OH_AVFormat *FakeVideoEncoderGetInputDescription(OH_AVCodec *)
    __asm__("OH_VideoEncoder_GetInputDescription");
extern "C" OH_AVFormat *FakeVideoEncoderGetInputDescription(OH_AVCodec *)
{
    ++g_codec.inputDescriptions;
    return &g_inputFormat;
}
extern "C" bool FakeAvFormatGetIntValue(OH_AVFormat *format, const char *key, int32_t *value)
    __asm__("OH_AVFormat_GetIntValue");
extern "C" bool FakeAvFormatGetIntValue(OH_AVFormat *format, const char *key, int32_t *value)
{
    const std::string name(key);
    if (name == OH_MD_KEY_WIDTH || name == OH_MD_KEY_VIDEO_PIC_WIDTH) {
        *value = FRAME_WIDTH;
    } else if (name == OH_MD_KEY_HEIGHT || name == OH_MD_KEY_VIDEO_PIC_HEIGHT) {
        *value = FRAME_HEIGHT;
    } else if (name == OH_MD_KEY_VIDEO_STRIDE) {
        *value = format->input ? INPUT_WIDTH_STRIDE : FRAME_WIDTH;
    } else if (name == OH_MD_KEY_VIDEO_SLICE_HEIGHT) {
        *value = format->input ? INPUT_HEIGHT_STRIDE : FRAME_HEIGHT;
    } else if (name == OH_MD_KEY_PIXEL_FORMAT) {
        *value = format->input ? AV_PIXEL_FORMAT_NV12 : AV_PIXEL_FORMAT_NV21;
    } else {
        return false;
    }
    return g_codec.formatComplete;
}
extern "C" void FakeAvFormatDestroy(OH_AVFormat *)
    __asm__("OH_AVFormat_Destroy");
extern "C" void FakeAvFormatDestroy(OH_AVFormat *)
{
    ++g_codec.formatDestroys;
}
extern "C" OH_AVErrCode FakeVideoEncoderStop(OH_AVCodec *)
    __asm__("OH_VideoEncoder_Stop");
extern "C" OH_AVErrCode FakeVideoEncoderStop(OH_AVCodec *)
{
    ++g_codec.stopCalls;
    return AV_ERR_OK;
}
extern "C" OH_AVErrCode FakeVideoEncoderFlush(OH_AVCodec *)
    __asm__("OH_VideoEncoder_Flush");
extern "C" OH_AVErrCode FakeVideoEncoderFlush(OH_AVCodec *)
{
    ++g_codec.flushCalls;
    return AV_ERR_OK;
}
extern "C" int FakeLogPrint(LogType, LogLevel, unsigned int, const char *, const char *, ...)
    __asm__("OH_LOG_Print");
extern "C" int FakeLogPrint(LogType, LogLevel, unsigned int, const char *, const char *, ...)
{
    return 0;
}

int main()
{
    TestInputStatus();
    TestOutputStatus();
    TestFormatChanges();
    TestStopWithoutFlush();
    TestInputLayoutCallback();
    std::cout << "Encoder Buffers: retry, errors, EOS, independent Stop and isolated input/output layout passed\n";
}
