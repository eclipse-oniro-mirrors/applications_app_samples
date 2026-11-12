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

struct OH_AVBuffer { OH_AVCodecBufferAttr attr {}; };
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
OH_AVCodec codec;
OH_AVFormat format;

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
    codec = {};
    AudioCodec wrapper;
    CodecBufferInfo info;
    Require(wrapper.GetInputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR,
        "Input requires a codec");
    Require(wrapper.Create("audio/mp4a-latm") == AVCODEC_SAMPLE_ERR_OK, "Create audio codec");
    Require(wrapper.GetInputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_OK &&
        info.buffer == &codec.input && info.bufferIndex == BUFFER_INDEX, "Input preserves Buffer and index");
    codec.inputStatus = AV_ERR_TRY_AGAIN_LATER;
    Require(wrapper.GetInputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_AGAIN && info.buffer == nullptr,
        "Input timeout permits retry and clears stale data");
    codec.inputStatus = AV_ERR_UNKNOWN;
    Require(wrapper.GetInputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR,
        "Hard input errors must not become timeout retries");
    codec.inputStatus = AV_ERR_OK;
    codec.failInputGet = true;
    Require(wrapper.GetInputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR && info.buffer == nullptr,
        "Failed input Get must not expose a Buffer");
}

template<typename AudioCodec>
void TestOutputOwnership()
{
    codec = {};
    AudioCodec wrapper;
    Require(wrapper.Create("audio/mp4a-latm") == AVCODEC_SAMPLE_ERR_OK, "Create audio codec");
    codec.output.attr.size = FRAME_BYTES;
    codec.output.attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    CodecBufferInfo info;
    Require(wrapper.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_OK &&
        info.buffer == &codec.output && info.bufferIndex == BUFFER_INDEX &&
        (info.attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0 && codec.frees == 0,
        "EOS remains caller-owned until its original index is returned");
    Require(wrapper.FreeOutputBuffer(info) == AVCODEC_SAMPLE_ERR_OK && codec.frees == 1,
        "Caller returns EOS exactly once");
    codec.outputStatus = AV_ERR_TRY_AGAIN_LATER;
    Require(wrapper.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_AGAIN && info.buffer == nullptr,
        "Output timeout clears the previous Buffer");
    codec.outputStatus = AV_ERR_UNKNOWN;
    Require(wrapper.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR,
        "Output query error is not a timeout");
    codec.outputStatus = AV_ERR_OK;
    codec.failOutputGet = true;
    Require(wrapper.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR && info.buffer == nullptr,
        "Output Get failure does not publish an unusable Buffer");
    codec.failOutputGet = false;
    codec.attrStatus = AV_ERR_UNKNOWN;
    Require(wrapper.GetOutputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_ERROR && info.buffer == nullptr &&
        codec.frees == 1, "Failed Get or attribute read does not guess an extra Free");
    codec.freeStatus = AV_ERR_UNKNOWN;
    Require(wrapper.FreeOutputBuffer(info) == AVCODEC_SAMPLE_ERR_ERROR, "Output return errors propagate");
}

template<typename AudioCodec>
void TestLifecycle()
{
    codec = {};
    {
        AudioCodec wrapper;
        Require(wrapper.Create("audio/mp4a-latm") == AVCODEC_SAMPLE_ERR_OK, "Create audio codec");
        SampleInfo sample;
        sample.codec.codecSyncMode = true;
        CodecUserData context;
        codec.configureStatus = AV_ERR_UNKNOWN;
        Require(wrapper.Config(sample, &context) == AVCODEC_SAMPLE_ERR_ERROR &&
            codec.formatCreates == 1 && codec.formatDestroys == 1, "Failed Configure destroys its Format");
        codec.configureStatus = AV_ERR_OK;
        Require(wrapper.Config(sample, &context) == AVCODEC_SAMPLE_ERR_OK &&
            codec.formatCreates == codec.formatDestroys, "Successful Configure also destroys its Format");
        Require(wrapper.Stop() == AVCODEC_SAMPLE_ERR_OK && codec.stops == 1 && codec.flushes == 0,
            "Stop does not implicitly Flush");
        codec.destroyStatus = AV_ERR_UNKNOWN;
        Require(wrapper.Release() == AVCODEC_SAMPLE_ERR_ERROR && codec.destroys == 1 &&
            codec.stops == 1 && codec.flushes == 0, "Release calls only Destroy and reports its failure");
    }
    Require(codec.destroys == 1, "Destructor does not destroy a released handle twice");
}

void TestEncoderEos()
{
    codec = {};
    AudioEncoder encoder;
    Require(encoder.Create("audio/mp4a-latm") == AVCODEC_SAMPLE_ERR_OK, "Create AAC encoder");
    CodecBufferInfo info;
    Require(encoder.GetInputBuffer(info, QUERY_TIMEOUT_US) == AVCODEC_SAMPLE_ERR_OK, "Acquire EOS input");
    Require(encoder.NotifyEndOfStream(info) == AVCODEC_SAMPLE_ERR_OK && codec.pushes == 1 &&
        codec.input.attr.flags == AVCODEC_BUFFER_FLAGS_EOS && codec.input.attr.size == 0,
        "EOS uses the acquired input Buffer and index");
}
} // namespace

namespace CodecCapability {
bool ValidateAudioConfiguration(const SampleInfo &, bool) { return true; }
}
void SampleCallback::OnCodecError(OH_AVCodec *, int32_t, void *) {}
void SampleCallback::OnCodecFormatChange(OH_AVCodec *, OH_AVFormat *, void *) {}
void SampleCallback::OnNeedInputBuffer(OH_AVCodec *, uint32_t, OH_AVBuffer *, void *) {}
void SampleCallback::OnNewOutputBuffer(OH_AVCodec *, uint32_t, OH_AVBuffer *, void *) {}

extern "C" OH_AVCodec *OH_AudioCodec_CreateByMime(const char *, bool) { return &codec; }
extern "C" OH_AVErrCode OH_AudioCodec_QueryInputBuffer(OH_AVCodec *, uint32_t *index, int64_t)
{
    *index = BUFFER_INDEX;
    return codec.inputStatus;
}
extern "C" OH_AVBuffer *OH_AudioCodec_GetInputBuffer(OH_AVCodec *, uint32_t index)
{
    Require(index == BUFFER_INDEX, "Input Get uses the queried index");
    return codec.failInputGet ? nullptr : &codec.input;
}
extern "C" OH_AVErrCode OH_AudioCodec_QueryOutputBuffer(OH_AVCodec *, uint32_t *index, int64_t)
{
    *index = BUFFER_INDEX;
    return codec.outputStatus;
}
extern "C" OH_AVBuffer *OH_AudioCodec_GetOutputBuffer(OH_AVCodec *, uint32_t index)
{
    Require(index == BUFFER_INDEX, "Output Get uses the queried index");
    return codec.failOutputGet ? nullptr : &codec.output;
}
extern "C" OH_AVErrCode OH_AVBuffer_GetBufferAttr(OH_AVBuffer *buffer, OH_AVCodecBufferAttr *attr)
{
    *attr = buffer->attr;
    return codec.attrStatus;
}
extern "C" OH_AVErrCode OH_AVBuffer_SetBufferAttr(OH_AVBuffer *buffer, const OH_AVCodecBufferAttr *attr)
{
    buffer->attr = *attr;
    return AV_ERR_OK;
}
extern "C" OH_AVErrCode OH_AudioCodec_PushInputBuffer(OH_AVCodec *, uint32_t index)
{
    Require(index == BUFFER_INDEX, "Push uses the acquired index");
    ++codec.pushes;
    return AV_ERR_OK;
}
extern "C" OH_AVErrCode OH_AudioCodec_FreeOutputBuffer(OH_AVCodec *, uint32_t index)
{
    Require(index == BUFFER_INDEX, "Free uses the acquired index");
    ++codec.frees;
    return codec.freeStatus;
}
extern "C" OH_AVFormat *OH_AVFormat_Create() { ++codec.formatCreates; return &format; }
extern "C" void OH_AVFormat_Destroy(OH_AVFormat *) { ++codec.formatDestroys; }
extern "C" bool OH_AVFormat_SetIntValue(OH_AVFormat *, const char *, int32_t) { return true; }
extern "C" bool OH_AVFormat_SetLongValue(OH_AVFormat *, const char *, int64_t) { return true; }
extern "C" bool OH_AVFormat_SetBuffer(OH_AVFormat *, const char *, const uint8_t *, size_t) { return true; }
extern "C" OH_AVErrCode OH_AudioCodec_Configure(OH_AVCodec *, const OH_AVFormat *)
{
    return codec.configureStatus;
}
extern "C" OH_AVErrCode OH_AudioCodec_RegisterCallback(OH_AVCodec *, OH_AVCodecCallback, void *) { return AV_ERR_OK; }
extern "C" OH_AVErrCode OH_AudioCodec_Prepare(OH_AVCodec *) { return AV_ERR_OK; }
extern "C" OH_AVErrCode OH_AudioCodec_Stop(OH_AVCodec *) { ++codec.stops; return AV_ERR_OK; }
extern "C" OH_AVErrCode OH_AudioCodec_Flush(OH_AVCodec *) { ++codec.flushes; return AV_ERR_OK; }
extern "C" OH_AVErrCode OH_AudioCodec_Destroy(OH_AVCodec *) { ++codec.destroys; return codec.destroyStatus; }
extern "C" int OH_LOG_Print(LogType, LogLevel, unsigned int, const char *, const char *, ...) { return 0; }

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
