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
#include <iostream>
#include "../../entry/src/main/cpp/capabilities/include/audio_decoder.h"
#include "../../entry/src/main/cpp/capabilities/include/audio_encoder.h"

struct OH_AVBuffer {
    OH_AVCodecBufferAttr attr {};
};
struct OH_AVFormat {};
struct OH_AVCodec {
    OH_AVBuffer input;
    OH_AVBuffer output;
    OH_AVErrCode inputStatus = AV_ERR_OK;
    OH_AVErrCode outputStatus = AV_ERR_OK;
    OH_AVErrCode attrStatus = AV_ERR_OK;
    OH_AVErrCode configureStatus = AV_ERR_OK;
    OH_AVErrCode freeStatus = AV_ERR_OK;
    OH_AVErrCode destroyStatus = AV_ERR_OK;
    bool failInputGet = false;
    bool failOutputGet = false;
    int32_t frees = 0;
    int32_t pushes = 0;
    int32_t stops = 0;
    int32_t flushes = 0;
    int32_t destroys = 0;
    int32_t formatCreates = 0;
    int32_t formatDestroys = 0;
};

const char *OH_MD_KEY_AUDIO_SAMPLE_FORMAT = "sampleFormat";
const char *OH_MD_KEY_AUD_CHANNEL_COUNT = "channels";
const char *OH_MD_KEY_AUD_SAMPLE_RATE = "sampleRate";
const char *OH_MD_KEY_BITRATE = "bitrate";
const char *OH_MD_KEY_CHANNEL_LAYOUT = "layout";
const char *OH_MD_KEY_MAX_INPUT_SIZE = "maxInput";
const char *OH_MD_KEY_ENABLE_SYNC_MODE = "sync";
const char *OH_MD_KEY_CODEC_CONFIG = "config";

namespace {
constexpr int64_t QUERY_TIMEOUT_US = 100000;
constexpr uint32_t BUFFER_INDEX = 9;
constexpr int32_t FRAME_BYTES = 32;
OH_AVCodec g_codec;
OH_AVFormat g_format;

void Require(bool condition, const char *message)
{
    if (!condition) {
        std::cerr << message << '\n';
        std::exit(EXIT_FAILURE);
    }
}

template<typename AudioCodec>
void TestInputStatus()
{
    g_codec = {};
    AudioCodec wrapper;
    CodecBufferInfo info;
    Require(wrapper.GetInputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR,
        "Input requires a codec");
    Require(wrapper.Create("audio/mp4a-latm") == AVCODEC_SAMPLE_ERR_OK, "Create audio codec");
    Require(wrapper.GetInputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_OK &&
        info.buffer == &g_codec.input && info.bufferIndex == BUFFER_INDEX, "Input preserves Buffer and index");
    g_codec.inputStatus = AV_ERR_TRY_AGAIN_LATER;
    Require(wrapper.GetInputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_AGAIN && info.buffer == nullptr,
        "Input timeout permits retry and clears stale data");
    g_codec.inputStatus = AV_ERR_UNKNOWN;
    Require(wrapper.GetInputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR,
        "Hard input errors must not become timeout retries");
    g_codec.inputStatus = AV_ERR_OK;
    g_codec.failInputGet = true;
    Require(wrapper.GetInputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR && info.buffer == nullptr,
        "Failed input Get must not expose a Buffer");
}

template<typename AudioCodec>
void TestOutputOwnership()
{
    g_codec = {};
    AudioCodec wrapper;
    Require(wrapper.Create("audio/mp4a-latm") == AVCODEC_SAMPLE_ERR_OK, "Create audio codec");
    g_codec.output.attr.size = FRAME_BYTES;
    g_codec.output.attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    CodecBufferInfo info;
    Require(wrapper.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_OK &&
        info.buffer == &g_codec.output && info.bufferIndex == BUFFER_INDEX &&
        (info.attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0 && g_codec.frees == 0,
        "EOS remains caller-owned until its original index is returned");
    Require(wrapper.FreeOutputBuffer(info) == AVCODEC_SAMPLE_ERR_OK && g_codec.frees == 1,
        "Caller returns EOS exactly once");
    g_codec.outputStatus = AV_ERR_TRY_AGAIN_LATER;
    Require(wrapper.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_AGAIN && info.buffer == nullptr,
        "Output timeout clears the previous Buffer");
    g_codec.outputStatus = AV_ERR_UNKNOWN;
    Require(wrapper.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR,
        "Output query error is not a timeout");
    g_codec.outputStatus = AV_ERR_OK;
    g_codec.failOutputGet = true;
    Require(wrapper.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR && info.buffer == nullptr,
        "Output Get failure does not publish an unusable Buffer");
    g_codec.failOutputGet = false;
    g_codec.attrStatus = AV_ERR_UNKNOWN;
    Require(wrapper.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR && info.buffer == nullptr &&
        g_codec.frees == 1, "Failed Get or attribute read does not guess an extra Free");
    g_codec.freeStatus = AV_ERR_UNKNOWN;
    Require(wrapper.FreeOutputBuffer(info) == AVCODEC_SAMPLE_ERR_ERROR, "Output return errors propagate");
}

template<typename AudioCodec>
void TestLifecycle()
{
    g_codec = {};
    {
        AudioCodec wrapper;
        Require(wrapper.Create("audio/mp4a-latm") == AVCODEC_SAMPLE_ERR_OK, "Create audio codec");
        SampleInfo sample;
        sample.codec.codecSyncMode = true;
        CodecUserData context;
        g_codec.configureStatus = AV_ERR_UNKNOWN;
        Require(wrapper.Config(sample, &context) == AVCODEC_SAMPLE_ERR_ERROR &&
            g_codec.formatCreates == 1 && g_codec.formatDestroys == 1, "Failed Configure destroys its Format");
        g_codec.configureStatus = AV_ERR_OK;
        Require(wrapper.Config(sample, &context) == AVCODEC_SAMPLE_ERR_OK &&
            g_codec.formatCreates == g_codec.formatDestroys, "Successful Configure also destroys its Format");
        Require(wrapper.Stop() == AVCODEC_SAMPLE_ERR_OK && g_codec.stops == 1 && g_codec.flushes == 0,
            "Stop does not implicitly Flush");
        g_codec.destroyStatus = AV_ERR_UNKNOWN;
        Require(wrapper.Release() == AVCODEC_SAMPLE_ERR_ERROR && g_codec.destroys == 1 &&
            g_codec.stops == 1 && g_codec.flushes == 0, "Release calls only Destroy and reports its failure");
    }
    Require(g_codec.destroys == 1, "Destructor does not destroy a released handle twice");
}

void TestEncoderEos()
{
    g_codec = {};
    AudioEncoder encoder;
    Require(encoder.Create("audio/mp4a-latm") == AVCODEC_SAMPLE_ERR_OK, "Create AAC encoder");
    CodecBufferInfo info;
    Require(encoder.GetInputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_OK, "Acquire EOS input");
    Require(encoder.NotifyEndOfStream(info) == AVCODEC_SAMPLE_ERR_OK && g_codec.pushes == 1 &&
        g_codec.input.attr.flags == AVCODEC_BUFFER_FLAGS_EOS && g_codec.input.attr.size == 0,
        "EOS uses the acquired input Buffer and index");
}
} // namespace

namespace CodecCapability {
bool ValidateAudioConfiguration(const SampleInfo &, bool)
{
    return true;
}
}
void SampleCallback::OnCodecError(OH_AVCodec *, int32_t, void *)
{
}
void SampleCallback::OnCodecFormatChange(OH_AVCodec *, OH_AVFormat *, void *)
{
}
void SampleCallback::OnNeedInputBuffer(OH_AVCodec *, uint32_t, OH_AVBuffer *, void *)
{
}
void SampleCallback::OnNewOutputBuffer(OH_AVCodec *, uint32_t, OH_AVBuffer *, void *)
{
}
extern "C" OH_AVCodec *FakeAudioCodecCreateByMime(const char *, bool)
    __asm__("OH_AudioCodec_CreateByMime");
extern "C" OH_AVCodec *FakeAudioCodecCreateByMime(const char *, bool)
{
    return &g_codec;
}
extern "C" OH_AVErrCode FakeAudioCodecQueryInputBuffer(OH_AVCodec *, uint32_t *index, int64_t)
    __asm__("OH_AudioCodec_QueryInputBuffer");
extern "C" OH_AVErrCode FakeAudioCodecQueryInputBuffer(OH_AVCodec *, uint32_t *index, int64_t)
{
    *index = BUFFER_INDEX;
    return g_codec.inputStatus;
}
extern "C" OH_AVBuffer *FakeAudioCodecGetInputBuffer(OH_AVCodec *, uint32_t index)
    __asm__("OH_AudioCodec_GetInputBuffer");
extern "C" OH_AVBuffer *FakeAudioCodecGetInputBuffer(OH_AVCodec *, uint32_t index)
{
    Require(index == BUFFER_INDEX, "Input Get uses the queried index");
    return g_codec.failInputGet ? nullptr : &g_codec.input;
}
extern "C" OH_AVErrCode FakeAudioCodecQueryOutputBuffer(OH_AVCodec *, uint32_t *index, int64_t)
    __asm__("OH_AudioCodec_QueryOutputBuffer");
extern "C" OH_AVErrCode FakeAudioCodecQueryOutputBuffer(OH_AVCodec *, uint32_t *index, int64_t)
{
    *index = BUFFER_INDEX;
    return g_codec.outputStatus;
}
extern "C" OH_AVBuffer *FakeAudioCodecGetOutputBuffer(OH_AVCodec *, uint32_t index)
    __asm__("OH_AudioCodec_GetOutputBuffer");
extern "C" OH_AVBuffer *FakeAudioCodecGetOutputBuffer(OH_AVCodec *, uint32_t index)
{
    Require(index == BUFFER_INDEX, "Output Get uses the queried index");
    return g_codec.failOutputGet ? nullptr : &g_codec.output;
}
extern "C" OH_AVErrCode FakeAvBufferGetBufferAttr(OH_AVBuffer *buffer, OH_AVCodecBufferAttr *attr)
    __asm__("OH_AVBuffer_GetBufferAttr");
extern "C" OH_AVErrCode FakeAvBufferGetBufferAttr(OH_AVBuffer *buffer, OH_AVCodecBufferAttr *attr)
{
    *attr = buffer->attr;
    return g_codec.attrStatus;
}
extern "C" OH_AVErrCode FakeAvBufferSetBufferAttr(OH_AVBuffer *buffer, const OH_AVCodecBufferAttr *attr)
    __asm__("OH_AVBuffer_SetBufferAttr");
extern "C" OH_AVErrCode FakeAvBufferSetBufferAttr(OH_AVBuffer *buffer, const OH_AVCodecBufferAttr *attr)
{
    buffer->attr = *attr;
    return AV_ERR_OK;
}
extern "C" OH_AVErrCode FakeAudioCodecPushInputBuffer(OH_AVCodec *, uint32_t index)
    __asm__("OH_AudioCodec_PushInputBuffer");
extern "C" OH_AVErrCode FakeAudioCodecPushInputBuffer(OH_AVCodec *, uint32_t index)
{
    Require(index == BUFFER_INDEX, "Push uses the acquired index");
    ++g_codec.pushes;
    return AV_ERR_OK;
}
extern "C" OH_AVErrCode FakeAudioCodecFreeOutputBuffer(OH_AVCodec *, uint32_t index)
    __asm__("OH_AudioCodec_FreeOutputBuffer");
extern "C" OH_AVErrCode FakeAudioCodecFreeOutputBuffer(OH_AVCodec *, uint32_t index)
{
    Require(index == BUFFER_INDEX, "Free uses the acquired index");
    ++g_codec.frees;
    return g_codec.freeStatus;
}
extern "C" OH_AVFormat *FakeAvFormatCreate()
    __asm__("OH_AVFormat_Create");
extern "C" OH_AVFormat *FakeAvFormatCreate()
{
    ++g_codec.formatCreates;
    return &g_format;
}
extern "C" void FakeAvFormatDestroy(OH_AVFormat *)
    __asm__("OH_AVFormat_Destroy");
extern "C" void FakeAvFormatDestroy(OH_AVFormat *)
{
    ++g_codec.formatDestroys;
}
extern "C" bool FakeAvFormatSetIntValue(OH_AVFormat *, const char *, int32_t)
    __asm__("OH_AVFormat_SetIntValue");
extern "C" bool FakeAvFormatSetIntValue(OH_AVFormat *, const char *, int32_t)
{
    return true;
}
extern "C" bool FakeAvFormatSetLongValue(OH_AVFormat *, const char *, int64_t)
    __asm__("OH_AVFormat_SetLongValue");
extern "C" bool FakeAvFormatSetLongValue(OH_AVFormat *, const char *, int64_t)
{
    return true;
}
extern "C" bool FakeAvFormatSetBuffer(OH_AVFormat *, const char *, const uint8_t *, size_t)
    __asm__("OH_AVFormat_SetBuffer");
extern "C" bool FakeAvFormatSetBuffer(OH_AVFormat *, const char *, const uint8_t *, size_t)
{
    return true;
}
extern "C" OH_AVErrCode FakeAudioCodecConfigure(OH_AVCodec *, const OH_AVFormat *)
    __asm__("OH_AudioCodec_Configure");
extern "C" OH_AVErrCode FakeAudioCodecConfigure(OH_AVCodec *, const OH_AVFormat *)
{
    return g_codec.configureStatus;
}
extern "C" OH_AVErrCode FakeAudioCodecRegisterCallback(OH_AVCodec *, OH_AVCodecCallback, void *)
    __asm__("OH_AudioCodec_RegisterCallback");
extern "C" OH_AVErrCode FakeAudioCodecRegisterCallback(OH_AVCodec *, OH_AVCodecCallback, void *)
{
    return AV_ERR_OK;
}
extern "C" OH_AVErrCode FakeAudioCodecPrepare(OH_AVCodec *)
    __asm__("OH_AudioCodec_Prepare");
extern "C" OH_AVErrCode FakeAudioCodecPrepare(OH_AVCodec *)
{
    return AV_ERR_OK;
}
extern "C" OH_AVErrCode FakeAudioCodecStop(OH_AVCodec *)
    __asm__("OH_AudioCodec_Stop");
extern "C" OH_AVErrCode FakeAudioCodecStop(OH_AVCodec *)
{
    ++g_codec.stops;
    return AV_ERR_OK;
}
extern "C" OH_AVErrCode FakeAudioCodecFlush(OH_AVCodec *)
    __asm__("OH_AudioCodec_Flush");
extern "C" OH_AVErrCode FakeAudioCodecFlush(OH_AVCodec *)
{
    ++g_codec.flushes;
    return AV_ERR_OK;
}
extern "C" OH_AVErrCode FakeAudioCodecDestroy(OH_AVCodec *)
    __asm__("OH_AudioCodec_Destroy");
extern "C" OH_AVErrCode FakeAudioCodecDestroy(OH_AVCodec *)
{
    ++g_codec.destroys;
    return g_codec.destroyStatus;
}
extern "C" int FakeLogPrint(LogType, LogLevel, unsigned int, const char *, const char *, ...)
    __asm__("OH_LOG_Print");
extern "C" int FakeLogPrint(LogType, LogLevel, unsigned int, const char *, const char *, ...)
{
    return 0;
}

int main()
{
    TestInputStatus<AudioEncoder>();
    TestInputStatus<AudioDecoder>();
    TestOutputOwnership<AudioEncoder>();
    TestOutputOwnership<AudioDecoder>();
    TestLifecycle<AudioEncoder>();
    TestLifecycle<AudioDecoder>();
    TestEncoderEos();
    std::cout << "Audio Buffers: status, EOS ownership, Format cleanup and independent lifecycle passed\n";
}
