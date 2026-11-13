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

// Host scheduling test with SDK declarations and fake codec/demux/mux implementations.
#include <deque>
#include <algorithm>
#include <cstdlib>
#include <iostream>
#include <iterator>
#include <map>
#include <string>
#include <vector>
#include "../../entry/src/main/cpp/sample/transcoder/process/audio/TranscodeAudioPipeline.h"
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_averrors.h>

struct OH_AVFormat { std::map<std::string, int64_t> numbers; };
struct OH_AVBuffer { std::vector<uint8_t> data = std::vector<uint8_t>(16384); OH_AVCodecBufferAttr attr {}; };
struct OH_AVCodec {
    bool encoder = false;
    bool changed = false;
    bool started = false;
    int32_t rate = 48000;
    int32_t channels = 2;
    int64_t channelLayout = 0;
    OH_AVBuffer input;
    std::map<uint32_t, OH_AVBuffer> outputs;
    std::deque<uint32_t> queued;
    uint32_t sequence = 1;
    int calls = 0;
    OH_AVCodecCallback callbacks {};
    void *context = nullptr;
    bool asynchronous = false;
};
struct OH_AVDemuxer { int chunk = 0; int samples = 0; int channels = 2; bool discontinuous = false; };
struct OH_AVMuxer { int packets = 0; std::vector<int64_t> timestamps; };

const char *OH_MD_KEY_CODEC_MIME = "mime";
const char *OH_MD_KEY_AUD_CHANNEL_COUNT = "channels";
const char *OH_MD_KEY_AUD_SAMPLE_RATE = "rate";
const char *OH_MD_KEY_AUDIO_SAMPLE_FORMAT = "sample";
const char *OH_MD_KEY_CHANNEL_LAYOUT = "channelLayout";
const char *OH_MD_KEY_ENABLE_SYNC_MODE = "sync";
const char *OH_MD_KEY_BITRATE = "bitrate";
const char *OH_MD_KEY_PROFILE = "profile";
const char *OH_MD_KEY_AAC_IS_ADTS = "adts";
const char *OH_AVCODEC_MIMETYPE_AUDIO_AAC = "audio/mp4a-latm";

namespace {
constexpr int32_t K_CHANNELS = 2;
constexpr int32_t K_MONO_CHANNELS = 1;
constexpr int32_t K_FIVE_POINT_ONE_CHANNELS = 6;
constexpr int32_t K_PCM_SAMPLE_BYTES = 2;
constexpr int32_t K_PCM_SAMPLE_BITS_PER_BYTE = 8;
constexpr int32_t K_STEREO_PCM_FRAME_BYTES = K_CHANNELS * K_PCM_SAMPLE_BYTES;
constexpr int32_t K_SAMPLE_RATE = 48000;
constexpr int32_t K_INVALID_SAMPLE_RATE = 44100;
constexpr int32_t K_SAMPLE_RATE_44100 = 44100;
constexpr int32_t K_INPUT_CHUNK_SAMPLES = 300;
constexpr int32_t K_SECOND_CHUNK_SAMPLES = 1300;
constexpr int32_t K_TAIL_CHUNK_SAMPLES = 37;
constexpr int32_t K_ENCODED_BYTES = 8;
constexpr int32_t K_EXPECTED_PACKET_COUNT = 2;
constexpr int32_t K_EXPECTED_DESTROYED = 30;
constexpr int32_t K_EXPECTED_PADDED_SAMPLES = 411;
constexpr int32_t K_RANGE_PADDED_SAMPLES = 544;
constexpr int64_t K_RANGE_START_US = 110000;
constexpr int64_t K_RANGE_END_US = 120000;
constexpr int32_t K_FRACTIONAL_RANGE_PADDED_SAMPLES = 546;
constexpr int64_t K_FRACTIONAL_RANGE_FIRST_PTS = 19;
constexpr int32_t K_MAX_TICKS = 1000;
constexpr int32_t K_READY_TICKS = 100;
constexpr int32_t K_MUX_START_TICK = 20;
constexpr int32_t K_EXPECTED_BYTES = 16;
constexpr int64_t K_FIRST_PTS = 100000;
constexpr int64_t K_PARTIAL_SOURCE_START_US = 50000;
constexpr int64_t K_SECOND_PTS_MIN = 121332;
constexpr int64_t K_SECOND_PTS_MAX = 121334;
constexpr int32_t K_OUTPUT_QUEUE_LIMIT = 2;
constexpr int32_t K_QUERY_FREQUENCY = 3;
constexpr int32_t K_PCM_FRAME_BYTES = 4096;
constexpr int32_t K_AAC_FRAME_SAMPLES = 1024;
constexpr int32_t K_DISCONTINUITY_US = 10000;
constexpr int64_t K_TEST_AAC_BITRATE = 192000;
constexpr int64_t K_MICROSECONDS_PER_SECOND = 1000000;
bool g_sendFormatChange = true;
bool g_invalidLayout = false;
bool g_failWrite = false;
bool g_callbackError = false;
bool g_errorEncoder = false;
int g_destroyed = 0;
int g_paddedSamples = 0;
int g_inputEos = 0;
int g_returned = 0;
std::vector<int64_t> encodedPts;

void Require(bool condition, const char *message)
{
    if (!condition) {
        std::cerr << message << '\n';
        std::exit(EXIT_FAILURE);
    }
}

void RecordEncoderInput(OH_AVCodec *codec)
{
    if ((codec->input.attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0) {
        ++g_inputEos;
        return;
    }
    const int32_t bytesPerSample = codec->channels * K_PCM_SAMPLE_BYTES;
    Require(codec->input.attr.size == K_AAC_FRAME_SAMPLES * bytesPerSample, "PCM frame size");
    encodedPts.push_back(codec->input.attr.pts);
    for (int index = 0; index < codec->input.attr.size; index += bytesPerSample) {
        if (codec->input.data[index] == 0) {
            ++g_paddedSamples;
        }
    }
}

void AddOutput(OH_AVCodec *codec)
{
    OH_AVBuffer output = codec->input;
    if (codec->encoder && output.attr.size > 0) {
        output.attr.size = K_ENCODED_BYTES;
    }
    const auto id = codec->sequence++;
    codec->outputs.emplace(id, std::move(output));
    if (codec->asynchronous) {
        if (!codec->changed && g_sendFormatChange) {
            codec->changed = true;
            codec->callbacks.onStreamChanged(codec, nullptr, codec->context);
        }
        codec->callbacks.onNewOutputBuffer(codec, id, &codec->outputs.at(id), codec->context);
    } else { codec->queued.push_back(id); }
}
}

extern "C" OH_AVFormat *FakeAvFormatCreateAudioFormat(const char *, int32_t rate, int32_t channels)
    __asm__("OH_AVFormat_CreateAudioFormat");
extern "C" OH_AVFormat *FakeAvFormatCreateAudioFormat(const char *, int32_t rate, int32_t channels)
{
    auto *format = new OH_AVFormat;
    format->numbers = {{"rate", rate}, {"channels", channels}, {"sample", SAMPLE_S16LE}};
    return format;
}
extern "C" void FakeAvFormatDestroy(OH_AVFormat *format) __asm__("OH_AVFormat_Destroy");
extern "C" void FakeAvFormatDestroy(OH_AVFormat *format)
{
    delete format;
}
extern "C" bool FakeAvFormatSetIntValue(OH_AVFormat *format, const char *key, int32_t number)
    __asm__("OH_AVFormat_SetIntValue");
extern "C" bool FakeAvFormatSetIntValue(OH_AVFormat *format, const char *key, int32_t number)
{
    format->numbers[key] = number;
    return true;
}
extern "C" bool FakeAvFormatSetLongValue(OH_AVFormat *format, const char *key, int64_t number)
    __asm__("OH_AVFormat_SetLongValue");
extern "C" bool FakeAvFormatSetLongValue(OH_AVFormat *format, const char *key, int64_t number)
{
    format->numbers[key] = number;
    return true;
}
extern "C" bool FakeAvFormatGetIntValue(OH_AVFormat *format, const char *key, int32_t *number)
    __asm__("OH_AVFormat_GetIntValue");
extern "C" bool FakeAvFormatGetIntValue(OH_AVFormat *format, const char *key, int32_t *number)
{
    const auto found = format->numbers.find(key);
    if (found == format->numbers.end()) { return false; }
    *number = static_cast<int32_t>(found->second);
    return true;
}
extern "C" bool FakeAvFormatGetStringValue(OH_AVFormat *, const char *, const char **text)
    __asm__("OH_AVFormat_GetStringValue");
extern "C" bool FakeAvFormatGetStringValue(OH_AVFormat *, const char *, const char **text)
{
    *text = OH_AVCODEC_MIMETYPE_AUDIO_AAC;
    return true;
}
extern "C" bool FakeAvFormatGetLongValue(OH_AVFormat *format, const char *key, int64_t *number)
    __asm__("OH_AVFormat_GetLongValue");
extern "C" bool FakeAvFormatGetLongValue(OH_AVFormat *format, const char *key, int64_t *number)
{
    const auto found = format->numbers.find(key);
    if (found == format->numbers.end()) { return false; }
    *number = found->second;
    return true;
}
extern "C" OH_AVCodec *FakeAudioCodecCreateByMime(const char *, bool encoder)
    __asm__("OH_AudioCodec_CreateByMime");
extern "C" OH_AVCodec *FakeAudioCodecCreateByMime(const char *, bool encoder)
{
    auto *codec = new OH_AVCodec;
    codec->encoder = encoder;
    return codec;
}
extern "C" OH_AVErrCode FakeAudioCodecConfigure(OH_AVCodec *, const OH_AVFormat *)
    __asm__("OH_AudioCodec_Configure");
extern "C" OH_AVErrCode FakeAudioCodecConfigure(OH_AVCodec *codec, const OH_AVFormat *format)
{
    codec->asynchronous = format->numbers.at("sync") == 0;
    Require(!codec->asynchronous || codec->context != nullptr, "Register callbacks before Configure");
    codec->rate = static_cast<int32_t>(format->numbers.at("rate"));
    codec->channels = static_cast<int32_t>(format->numbers.at("channels"));
    const auto layout = format->numbers.find("channelLayout");
    codec->channelLayout = layout == format->numbers.end() ? 0 : layout->second;
    return AV_ERR_OK;
}
extern "C" OH_AVErrCode FakeAudioCodecRegisterCallback(OH_AVCodec *, OH_AVCodecCallback, void *)
    __asm__("OH_AudioCodec_RegisterCallback");
extern "C" OH_AVErrCode FakeAudioCodecRegisterCallback(OH_AVCodec *codec, OH_AVCodecCallback callbacks, void *context)
{
    codec->callbacks = callbacks;
    codec->context = context;
    return AV_ERR_OK;
}
extern "C" OH_AVErrCode FakeAudioCodecPrepare(OH_AVCodec *) __asm__("OH_AudioCodec_Prepare");
extern "C" OH_AVErrCode FakeAudioCodecPrepare(OH_AVCodec *)
{
    return AV_ERR_OK;
}
extern "C" OH_AVErrCode FakeAudioCodecStart(OH_AVCodec *codec) __asm__("OH_AudioCodec_Start");
extern "C" OH_AVErrCode FakeAudioCodecStart(OH_AVCodec *codec)
{
    codec->started = true;
    if (codec->asynchronous) { codec->callbacks.onNeedInputBuffer(codec, 0, &codec->input, codec->context); }
    return AV_ERR_OK;
}
extern "C" OH_AVErrCode FakeAudioCodecStop(OH_AVCodec *codec) __asm__("OH_AudioCodec_Stop");
extern "C" OH_AVErrCode FakeAudioCodecStop(OH_AVCodec *codec)
{
    codec->started = false;
    if (codec->asynchronous) { codec->callbacks.onError(codec, AV_ERR_UNKNOWN, codec->context); }
    return AV_ERR_OK;
}
extern "C" OH_AVErrCode FakeAudioCodecDestroy(OH_AVCodec *codec) __asm__("OH_AudioCodec_Destroy");
extern "C" OH_AVErrCode FakeAudioCodecDestroy(OH_AVCodec *codec)
{
    ++g_destroyed;
    delete codec;
    return AV_ERR_OK;
}
extern "C" OH_AVFormat *FakeAudioCodecGetOutputDescription(OH_AVCodec *)
    __asm__("OH_AudioCodec_GetOutputDescription");
extern "C" OH_AVFormat *FakeAudioCodecGetOutputDescription(OH_AVCodec *codec)
{
    OH_AVFormat *format = FakeAvFormatCreateAudioFormat(OH_AVCODEC_MIMETYPE_AUDIO_AAC,
        g_invalidLayout ? K_INVALID_SAMPLE_RATE : codec->rate, codec->channels);
    if (codec->channelLayout != 0) { format->numbers["channelLayout"] = codec->channelLayout; }
    return format;
}
extern "C" OH_AVErrCode FakeAudioCodecQueryInputBuffer(OH_AVCodec *codec, uint32_t *index, int64_t)
    __asm__("OH_AudioCodec_QueryInputBuffer");
extern "C" OH_AVErrCode FakeAudioCodecQueryInputBuffer(OH_AVCodec *codec, uint32_t *index, int64_t)
{
    Require(!codec->asynchronous, "Asynchronous input must not Query");
    if (++codec->calls % K_QUERY_FREQUENCY == 0 || codec->outputs.size() >= K_OUTPUT_QUEUE_LIMIT) {
        return AV_ERR_TRY_AGAIN_LATER;
    }
    *index = 0;
    return AV_ERR_OK;
}
extern "C" OH_AVBuffer *FakeAudioCodecGetInputBuffer(OH_AVCodec *codec, uint32_t)
    __asm__("OH_AudioCodec_GetInputBuffer");
extern "C" OH_AVBuffer *FakeAudioCodecGetInputBuffer(OH_AVCodec *codec, uint32_t)
{
    Require(!codec->asynchronous, "Asynchronous input must not Get");
    return &codec->input;
}
extern "C" OH_AVErrCode FakeAudioCodecPushInputBuffer(OH_AVCodec *codec, uint32_t)
    __asm__("OH_AudioCodec_PushInputBuffer");
extern "C" OH_AVErrCode FakeAudioCodecPushInputBuffer(OH_AVCodec *codec, uint32_t)
{
    if (codec->asynchronous && g_callbackError && codec->encoder == g_errorEncoder) {
        codec->callbacks.onError(codec, AV_ERR_UNKNOWN, codec->context);
        return AV_ERR_OK;
    }
    if (codec->encoder) {
        RecordEncoderInput(codec);
    }
    AddOutput(codec);
    if (codec->asynchronous && (codec->input.attr.flags & AVCODEC_BUFFER_FLAGS_EOS) == 0) {
        codec->callbacks.onNeedInputBuffer(codec, 0, &codec->input, codec->context);
    }
    return AV_ERR_OK;
}
extern "C" OH_AVErrCode FakeAudioCodecQueryOutputBuffer(OH_AVCodec *codec, uint32_t *index, int64_t)
    __asm__("OH_AudioCodec_QueryOutputBuffer");
extern "C" OH_AVErrCode FakeAudioCodecQueryOutputBuffer(OH_AVCodec *codec, uint32_t *index, int64_t)
{
    Require(!codec->asynchronous, "Asynchronous output must not Query");
    if (!codec->changed && g_sendFormatChange) {
        codec->changed = true;
        return AV_ERR_STREAM_CHANGED;
    }
    if (codec->queued.empty()) { return AV_ERR_TRY_AGAIN_LATER; }
    *index = codec->queued.front();
    codec->queued.pop_front();
    return AV_ERR_OK;
}
extern "C" OH_AVBuffer *FakeAudioCodecGetOutputBuffer(OH_AVCodec *codec, uint32_t index)
    __asm__("OH_AudioCodec_GetOutputBuffer");
extern "C" OH_AVBuffer *FakeAudioCodecGetOutputBuffer(OH_AVCodec *codec, uint32_t index)
{
    Require(!codec->asynchronous, "Asynchronous output must not Get");
    return &codec->outputs.at(index);
}
extern "C" OH_AVErrCode FakeAudioCodecFreeOutputBuffer(OH_AVCodec *codec, uint32_t index)
    __asm__("OH_AudioCodec_FreeOutputBuffer");
extern "C" OH_AVErrCode FakeAudioCodecFreeOutputBuffer(OH_AVCodec *codec, uint32_t index)
{
    Require(codec->outputs.erase(index) == 1, "Free audio output");
    ++g_returned;
    return AV_ERR_OK;
}
extern "C" uint8_t *FakeAvBufferGetAddr(OH_AVBuffer *buffer) __asm__("OH_AVBuffer_GetAddr");
extern "C" uint8_t *FakeAvBufferGetAddr(OH_AVBuffer *buffer)
{
    return buffer->data.data();
}
extern "C" int32_t FakeAvBufferGetCapacity(OH_AVBuffer *buffer) __asm__("OH_AVBuffer_GetCapacity");
extern "C" int32_t FakeAvBufferGetCapacity(OH_AVBuffer *buffer)
{
    return static_cast<int32_t>(buffer->data.size());
}
extern "C" OH_AVErrCode FakeAvBufferGetBufferAttr(OH_AVBuffer *buffer, OH_AVCodecBufferAttr *attr)
    __asm__("OH_AVBuffer_GetBufferAttr");
extern "C" OH_AVErrCode FakeAvBufferGetBufferAttr(OH_AVBuffer *buffer, OH_AVCodecBufferAttr *attr)
{
    *attr = buffer->attr;
    return AV_ERR_OK;
}
extern "C" OH_AVErrCode FakeAvBufferSetBufferAttr(OH_AVBuffer *buffer, const OH_AVCodecBufferAttr *attr)
    __asm__("OH_AVBuffer_SetBufferAttr");
extern "C" OH_AVErrCode FakeAvBufferSetBufferAttr(OH_AVBuffer *buffer, const OH_AVCodecBufferAttr *attr)
{
    buffer->attr = *attr;
    return AV_ERR_OK;
}
extern "C" OH_AVErrCode FakeAvDemuxerReadSampleBuffer(OH_AVDemuxer *demuxer, uint32_t, OH_AVBuffer *buffer)
    __asm__("OH_AVDemuxer_ReadSampleBuffer");
extern "C" OH_AVErrCode FakeAvDemuxerReadSampleBuffer(OH_AVDemuxer *demuxer, uint32_t, OH_AVBuffer *buffer)
{
    constexpr int chunks[] = {K_INPUT_CHUNK_SAMPLES, K_SECOND_CHUNK_SAMPLES, K_TAIL_CHUNK_SAMPLES};
    buffer->attr = {};
    buffer->attr.pts = K_FIRST_PTS + static_cast<int64_t>(demuxer->samples) * K_MICROSECONDS_PER_SECOND / K_SAMPLE_RATE;
    if (demuxer->discontinuous && demuxer->chunk > 0) {
        buffer->attr.pts += K_DISCONTINUITY_US;
    }
    if (static_cast<size_t>(demuxer->chunk) == std::size(chunks)) {
        buffer->attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        return AV_ERR_OK;
    }
    buffer->attr.size = chunks[demuxer->chunk] * demuxer->channels * K_PCM_SAMPLE_BYTES;
    std::fill(buffer->data.begin(), buffer->data.end(), 1);
    demuxer->samples += chunks[demuxer->chunk++];
    return AV_ERR_OK;
}
extern "C" OH_AVErrCode FakeAvMuxerWriteSampleBuffer(OH_AVMuxer *muxer, uint32_t, const OH_AVBuffer *buffer)
    __asm__("OH_AVMuxer_WriteSampleBuffer");
extern "C" OH_AVErrCode FakeAvMuxerWriteSampleBuffer(OH_AVMuxer *muxer, uint32_t, const OH_AVBuffer *buffer)
{
    if (g_failWrite) { return AV_ERR_UNKNOWN; }
    ++muxer->packets;
    muxer->timestamps.push_back(buffer->attr.pts);
    return AV_ERR_OK;
}

void RunSuccess(bool formatEvent, int64_t originUs = 0, bool asynchronous = false)
{
    g_sendFormatChange = formatEvent;
    g_paddedSamples = 0;
    g_inputEos = 0;
    encodedPts.clear();
    OH_AVDemuxer demuxer;
    OH_AVMuxer muxer;
    bool failed = false;
    auto source = std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)>(
        FakeAvFormatCreateAudioFormat(OH_AVCODEC_MIMETYPE_AUDIO_AAC, K_SAMPLE_RATE, K_CHANNELS),
        FakeAvFormatDestroy);
    {
        TranscodeAudioPipeline pipeline([&failed](const char *, int32_t) {
            failed = true;
            return false;
        });
        Require(pipeline.Configure(source.get(), &demuxer, 1, originUs, 0, 0, 0,
            TranscodeAudioPipeline::TargetBitrate(), false, asynchronous), "Configure success pipeline");
        for (int tick = 0; tick < K_MAX_TICKS && !pipeline.Done(); ++tick) {
            bool advanced = false;
            Require(pipeline.Pump(pipeline.Ready() && tick > K_MUX_START_TICK ? &muxer : nullptr, 1, advanced),
                "Pump success pipeline");
        }
        Require(pipeline.Done() && !failed && muxer.packets == K_EXPECTED_PACKET_COUNT && g_inputEos == 1,
            "Complete success pipeline");
        Require(g_paddedSamples == K_EXPECTED_PADDED_SAMPLES && encodedPts.size() == K_EXPECTED_PACKET_COUNT &&
            encodedPts[0] == K_FIRST_PTS - originUs, "PCM padding and first PTS on the shared timeline");
        Require(encodedPts[1] >= K_SECOND_PTS_MIN - originUs && encodedPts[1] <= K_SECOND_PTS_MAX - originUs,
            "Second PTS retains sample spacing after rebasing");
        Require(pipeline.Bytes() == K_EXPECTED_BYTES, "Encoded byte count");
    }
}

void RunTimeRange(int64_t startUs, int64_t endUs, int32_t paddedSamples, int64_t firstPts)
{
    g_sendFormatChange = true;
    g_paddedSamples = 0;
    g_inputEos = 0;
    encodedPts.clear();
    OH_AVDemuxer demuxer;
    OH_AVMuxer muxer;
    bool failed = false;
    auto source = std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)>(
        FakeAvFormatCreateAudioFormat(OH_AVCODEC_MIMETYPE_AUDIO_AAC, K_SAMPLE_RATE, K_CHANNELS),
        FakeAvFormatDestroy);
    {
        TranscodeAudioPipeline pipeline([&failed](const char *, int32_t) {
            failed = true;
            return false;
        });
        Require(pipeline.Configure(source.get(), &demuxer, 1, startUs, endUs),
            "Configure range pipeline");
        for (int tick = 0; tick < K_MAX_TICKS && !pipeline.Done(); ++tick) {
            bool advanced = false;
            Require(pipeline.Pump(pipeline.Ready() && tick > K_MUX_START_TICK ? &muxer : nullptr, 1, advanced),
                "Pump range pipeline");
        }
        Require(pipeline.Done() && !failed && muxer.packets == 1 && g_inputEos == 1, "Complete range pipeline");
        Require(g_paddedSamples == paddedSamples && encodedPts.size() == 1 && encodedPts[0] == firstPts,
            "Trim PCM to range and rebase timestamp");
        Require(pipeline.Bytes() == K_ENCODED_BYTES, "Range encoded byte count");
    }
}

void RunConverted(int32_t outputRate, int32_t outputChannels, int32_t sourceChannels = K_CHANNELS,
    int32_t sourceLayout = TRANSCODE_SOURCE_AUDIO_LAYOUT_UNSPECIFIED)
{
    if (outputRate <= 0) {
        Require(false, "Converted sample rate must be positive");
        return;
    }
    g_sendFormatChange = true;
    g_paddedSamples = 0;
    g_inputEos = 0;
    encodedPts.clear();
    OH_AVDemuxer demuxer;
    demuxer.channels = sourceChannels;
    OH_AVMuxer muxer;
    bool failed = false;
    auto source = std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)>(
        FakeAvFormatCreateAudioFormat(OH_AVCODEC_MIMETYPE_AUDIO_AAC, K_SAMPLE_RATE, sourceChannels),
        FakeAvFormatDestroy);
    TranscodeAudioPipeline pipeline([&failed](const char *, int32_t) {
        failed = true;
        return false;
    });
    Require(pipeline.Configure(source.get(), &demuxer, 1, 0, 0, outputRate, outputChannels, K_TEST_AAC_BITRATE,
        false, false, sourceLayout), "Configure converted pipeline");
    for (int tick = 0; tick < K_MAX_TICKS && !pipeline.Done(); ++tick) {
        bool advanced = false;
        Require(pipeline.Pump(pipeline.Ready() ? &muxer : nullptr, 1, advanced), "Pump converted pipeline");
    }
    constexpr int64_t sourceSamples = K_INPUT_CHUNK_SAMPLES + K_SECOND_CHUNK_SAMPLES + K_TAIL_CHUNK_SAMPLES;
    const int64_t convertedSamples = (sourceSamples * outputRate + K_SAMPLE_RATE - 1) / K_SAMPLE_RATE;
    const int64_t packets = (convertedSamples + K_AAC_FRAME_SAMPLES - 1) / K_AAC_FRAME_SAMPLES;
    Require(pipeline.Done() && !failed && muxer.packets == packets && g_inputEos == 1,
        "Converted audio drains exactly one EOS");
    Require(g_paddedSamples == packets * K_AAC_FRAME_SAMPLES - convertedSamples,
        "Converted fractional tail and AAC padding");
    Require(encodedPts.size() == static_cast<size_t>(packets), "Converted frame count");
    for (size_t index = 0; index < encodedPts.size(); ++index) {
        const int64_t expectedPts = outputRate > 0 ? K_FIRST_PTS + static_cast<int64_t>(index) *
            K_AAC_FRAME_SAMPLES * K_MICROSECONDS_PER_SECOND / outputRate : -1;
        Require(encodedPts[index] == expectedPts, "PTS follows output sample clock");
    }
    auto format = std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)>(pipeline.OutputFormat(),
        FakeAvFormatDestroy);
    Require(format != nullptr && format->numbers.at("rate") == outputRate &&
        format->numbers.at("channels") == outputChannels, "AAC output description follows selected layout");
}

void RunUnspecifiedSixChannelRejected()
{
    OH_AVDemuxer demuxer;
    bool failed = false;
    auto source = std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)>(
        FakeAvFormatCreateAudioFormat(OH_AVCODEC_MIMETYPE_AUDIO_AAC, K_SAMPLE_RATE, 6), FakeAvFormatDestroy);
    const int destroyedBefore = g_destroyed;
    TranscodeAudioPipeline pipeline([&failed](const char *, int32_t) {
        failed = true;
        return false;
    });
    Require(!pipeline.Configure(source.get(), &demuxer, 1),
        "Reject six-channel input without an explicit layout");
    Require(failed && g_destroyed == destroyedBefore,
        "Reject unspecified six-channel input before creating codecs");
}

int16_t ReadOutputSample(const std::vector<uint8_t> &bytes, size_t offset)
{
    const uint16_t value = static_cast<uint16_t>(bytes[offset]) |
        static_cast<uint16_t>(bytes[offset + 1]) << 8;
    return static_cast<int16_t>(value);
}

void RunFivePointOneLowPassResampling(const uint8_t *input)
{
    constexpr int32_t kLowPassSourceSamples = 512;
    constexpr int32_t kLowPassExpectedSamples = 471;
    TranscodePcmConverter converter;
    Require(converter.Configure(K_SAMPLE_RATE, K_SAMPLE_RATE_44100, K_FIVE_POINT_ONE_CHANNELS, K_CHANNELS, true,
        CH_LAYOUT_5POINT1),
        "Configure low-pass filtering for 5.1 downmix");
    std::vector<uint8_t> output;
    for (int32_t sample = 0; sample < kLowPassSourceSamples; ++sample) {
        converter.Push(input);
        while (converter.Pull(output)) {}
    }
    converter.Finish();
    while (converter.Pull(output)) {}
    Require(converter.Count() == kLowPassExpectedSamples &&
        output.size() == static_cast<size_t>(kLowPassExpectedSamples * K_STEREO_PCM_FRAME_BYTES),
        "Low-pass downmix preserves output sample count and stereo PCM size");
}

void RunFivePointOneDownmix()
{
    constexpr double kDownmixGain = 0.7071067811865476;
    const int16_t channels[] = {1000, 2000, 3000, 30000, 4000, 5000};
    std::vector<uint8_t> input;
    for (const int16_t sample : channels) {
        const uint16_t value = static_cast<uint16_t>(sample);
        input.push_back(static_cast<uint8_t>(value));
        input.push_back(static_cast<uint8_t>(value >> K_PCM_SAMPLE_BITS_PER_BYTE));
    }
    TranscodePcmConverter converter;
    Require(converter.Configure(K_SAMPLE_RATE, K_SAMPLE_RATE, K_FIVE_POINT_ONE_CHANNELS, K_CHANNELS, false,
        CH_LAYOUT_5POINT1),
        "Configure standard 5.1 downmix");
    converter.Push(input.data());
    converter.Finish();
    std::vector<uint8_t> output;
    Require(converter.Pull(output) && output.size() == K_STEREO_PCM_FRAME_BYTES,
        "Produce one stereo frame from 5.1");
    const int16_t expectedLeft = static_cast<int16_t>(1000 + std::lround(7000 * kDownmixGain));
    const int16_t expectedRight = static_cast<int16_t>(2000 + std::lround(8000 * kDownmixGain));
    Require(ReadOutputSample(output, 0) == expectedLeft &&
        ReadOutputSample(output, K_PCM_SAMPLE_BYTES) == expectedRight,
        "Mix center and surrounds at -3 dB and omit LFE");
    Require(converter.Configure(K_SAMPLE_RATE, K_SAMPLE_RATE, K_FIVE_POINT_ONE_CHANNELS, K_MONO_CHANNELS, false,
        CH_LAYOUT_5POINT1_BACK),
        "Configure rear 5.1 mono downmix");
    converter.Push(input.data());
    converter.Finish();
    output.clear();
    Require(converter.Pull(output) && output.size() == K_PCM_SAMPLE_BYTES &&
        ReadOutputSample(output, 0) == static_cast<int16_t>((expectedLeft + expectedRight) / K_CHANNELS),
        "Downmix rear 5.1 to mono");
    Require(!converter.Configure(K_SAMPLE_RATE, K_SAMPLE_RATE, K_FIVE_POINT_ONE_CHANNELS, K_CHANNELS, false,
        CH_LAYOUT_UNKNOWN),
        "Reject 5.1 PCM without a declared channel layout");
    RunFivePointOneLowPassResampling(input.data());
}

void RunDiscontinuous()
{
    OH_AVDemuxer demuxer;
    demuxer.discontinuous = true;
    OH_AVMuxer muxer;
    bool failed = false;
    auto source = std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)>(
        FakeAvFormatCreateAudioFormat(OH_AVCODEC_MIMETYPE_AUDIO_AAC, K_SAMPLE_RATE, K_CHANNELS),
        FakeAvFormatDestroy);
    TranscodeAudioPipeline pipeline([&failed](const char *, int32_t) {
        failed = true;
        return false;
    });
    Require(pipeline.Configure(source.get(), &demuxer, 1), "Configure discontinuous pipeline");
    for (int tick = 0; tick < K_MAX_TICKS && !failed; ++tick) {
        bool advanced = false;
        pipeline.Pump(pipeline.Ready() ? &muxer : nullptr, 1, advanced);
    }
    Require(failed && !pipeline.Done(), "Timestamp gap fails instead of compressing the audio timeline");
}

void RunInvalidSampleRate()
{
    constexpr int32_t invalidRates[] = {0, -1};
    for (const int32_t rate : invalidRates) {
        OH_AVDemuxer demuxer;
        bool failed = false;
        auto source = std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)>(
            FakeAvFormatCreateAudioFormat(OH_AVCODEC_MIMETYPE_AUDIO_AAC, rate, K_CHANNELS),
            FakeAvFormatDestroy);
        const int destroyedBefore = g_destroyed;
        {
            TranscodeAudioPipeline pipeline([&failed](const char *, int32_t) {
                failed = true;
                return false;
            });
            Require(!pipeline.Configure(source.get(), &demuxer, 1, K_RANGE_START_US, K_RANGE_END_US),
                "Reject nonpositive source sample rate");
            Require(failed, "Invalid sample rate reports a transcode error");
        }
        Require(g_destroyed == destroyedBefore, "Invalid sample rate does not create codecs");
    }
}

void RunInterrupted(bool writeFailure, bool asynchronous = false)
{
    g_sendFormatChange = false;
    g_invalidLayout = false;
    g_failWrite = writeFailure;
    OH_AVDemuxer demuxer;
    OH_AVMuxer muxer;
    bool failed = false;
    auto source = std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)>(
        FakeAvFormatCreateAudioFormat(OH_AVCODEC_MIMETYPE_AUDIO_AAC, K_SAMPLE_RATE, K_CHANNELS),
        FakeAvFormatDestroy);
    {
        TranscodeAudioPipeline pipeline([&failed](const char *, int32_t) {
            failed = true;
            return false;
        });
        Require(pipeline.Configure(source.get(), &demuxer, 1, 0, 0, 0, 0,
            TranscodeAudioPipeline::TargetBitrate(), false, asynchronous), "Configure interrupted pipeline");
        for (int tick = 0; tick < K_READY_TICKS && !pipeline.Ready(); ++tick) {
            bool advanced = false;
            Require(pipeline.Pump(nullptr, 1, advanced), "Pump interrupted pipeline");
        }
        Require(pipeline.Ready() && !pipeline.Done(), "Pipeline ready before muxer");
        if (writeFailure) {
            const int previouslyReturned = g_returned;
            bool advanced = false;
            Require(!pipeline.Pump(&muxer, 1, advanced), "Write failure is propagated");
            Require(failed && g_returned == previouslyReturned + 1 && muxer.packets == 0,
                "Write failure cleanup");
        }
        // Destruction also covers cancellation with a borrowed first output packet.
    }
    g_failWrite = false;
}

void RunAsyncError(bool encoder)
{
    g_callbackError = true;
    g_errorEncoder = encoder;
    OH_AVDemuxer demuxer;
    bool failed = false;
    auto source = std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)>(
        FakeAvFormatCreateAudioFormat(OH_AVCODEC_MIMETYPE_AUDIO_AAC, K_SAMPLE_RATE, K_CHANNELS),
        FakeAvFormatDestroy);
    TranscodeAudioPipeline pipeline([&failed, encoder](const char *operation, int32_t) {
        failed = true;
        Require(std::string(operation).find(encoder ? "encoder callback" : "decoder callback") != std::string::npos,
            "Report callback error origin");
        return false;
    });
    Require(pipeline.Configure(source.get(), &demuxer, 1, 0, 0, 0, 0,
        TranscodeAudioPipeline::TargetBitrate(), false, true), "Configure callback failure pipeline");
    for (int tick = 0; tick < K_READY_TICKS && !failed; ++tick) {
        bool advanced = false;
        pipeline.Pump(nullptr, 1, advanced);
    }
    Require(failed, "Propagate asynchronous callback error");
    g_callbackError = false;
}

int main()
{
    RunSuccess(true);
    RunSuccess(false);
    RunSuccess(true, K_FIRST_PTS);
    RunSuccess(false, K_PARTIAL_SOURCE_START_US);
    RunConverted(K_SAMPLE_RATE_44100, 1);
    RunConverted(K_SAMPLE_RATE_44100, K_CHANNELS);
    RunConverted(K_SAMPLE_RATE, 1);
    RunConverted(K_SAMPLE_RATE, K_CHANNELS);
    RunConverted(K_SAMPLE_RATE_44100, K_CHANNELS, K_FIVE_POINT_ONE_CHANNELS,
        TRANSCODE_SOURCE_AUDIO_LAYOUT_5POINT1_BACK);
    RunUnspecifiedSixChannelRejected();
    RunFivePointOneDownmix();
    RunDiscontinuous();
    RunTimeRange(K_RANGE_START_US, K_RANGE_END_US, K_RANGE_PADDED_SAMPLES, 0);
    RunTimeRange(K_RANGE_START_US + 1, K_RANGE_END_US - 1, K_FRACTIONAL_RANGE_PADDED_SAMPLES,
        K_FRACTIONAL_RANGE_FIRST_PTS);
    RunInvalidSampleRate();
    RunInterrupted(true);
    RunInterrupted(false);
    g_invalidLayout = true;
    OH_AVDemuxer demuxer;
    bool failed = false;
    {
        TranscodeAudioPipeline pipeline([&failed](const char *, int32_t) {
            failed = true;
            return false;
        });
        auto source = std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)>(
            FakeAvFormatCreateAudioFormat(OH_AVCODEC_MIMETYPE_AUDIO_AAC, K_SAMPLE_RATE, K_CHANNELS),
            FakeAvFormatDestroy);
        Require(pipeline.Configure(source.get(), &demuxer, 1), "Configure invalid layout pipeline");
        for (int tick = 0; tick < K_READY_TICKS && !failed; ++tick) {
            bool advanced = false;
            pipeline.Pump(nullptr, 1, advanced);
        }
        Require(failed, "Invalid layout is rejected");
    }
    Require(g_destroyed == K_EXPECTED_DESTROYED && g_returned > 0, "Codec cleanup");
    g_invalidLayout = false;
    RunSuccess(true, 0, true);
    RunSuccess(false, K_FIRST_PTS, true);
    RunInterrupted(true, true);
    RunInterrupted(false, true);
    RunAsyncError(false);
    RunAsyncError(true);
    std::cout << "AAC pipeline checks passed\n";
}
