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
#include <cstdlib>
#include <iostream>
#include <iterator>
#include <map>
#include <string>
#include <vector>
#include "../../entry/src/main/cpp/sample/transcoder/TranscodeAudioPipeline.h"
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_averrors.h>

struct OH_AVFormat { std::map<std::string, int64_t> numbers; };
struct OH_AVBuffer { std::vector<uint8_t> data = std::vector<uint8_t>(16384); OH_AVCodecBufferAttr attr {}; };
struct OH_AVCodec {
    bool encoder = false;
    bool changed = false;
    bool started = false;
    OH_AVBuffer input;
    std::map<uint32_t, OH_AVBuffer> outputs;
    std::deque<uint32_t> queued;
    uint32_t sequence = 1;
    int calls = 0;
};
struct OH_AVDemuxer { int chunk = 0; int samples = 0; };
struct OH_AVMuxer { int packets = 0; std::vector<int64_t> timestamps; };

const char *OH_MD_KEY_CODEC_MIME = "mime";
const char *OH_MD_KEY_AUD_CHANNEL_COUNT = "channels";
const char *OH_MD_KEY_AUD_SAMPLE_RATE = "rate";
const char *OH_MD_KEY_AUDIO_SAMPLE_FORMAT = "sample";
const char *OH_MD_KEY_ENABLE_SYNC_MODE = "sync";
const char *OH_MD_KEY_BITRATE = "bitrate";
const char *OH_MD_KEY_PROFILE = "profile";
const char *OH_MD_KEY_AAC_IS_ADTS = "adts";
const char *OH_AVCODEC_MIMETYPE_AUDIO_AAC = "audio/mp4a-latm";

namespace {
constexpr int32_t kChannels = 2;
constexpr int32_t kSampleRate = 48000;
constexpr int32_t kInvalidSampleRate = 44100;
constexpr int32_t kInputChunkSamples = 300;
constexpr int32_t kSecondChunkSamples = 1300;
constexpr int32_t kTailChunkSamples = 37;
constexpr int32_t kPcmBytes = 4;
constexpr int32_t kEncodedBytes = 8;
constexpr int32_t kExpectedPacketCount = 2;
constexpr int32_t kExpectedDestroyed = 10;
constexpr int32_t kExpectedPaddedSamples = 411;
constexpr int32_t kMaxTicks = 1000;
constexpr int32_t kReadyTicks = 100;
constexpr int32_t kMuxStartTick = 20;
constexpr int32_t kExpectedBytes = 16;
constexpr int64_t kFirstPts = 100000;
constexpr int64_t kSecondPtsMin = 121332;
constexpr int64_t kSecondPtsMax = 121334;
constexpr int32_t kOutputQueueLimit = 2;
constexpr int32_t kQueryFrequency = 3;
constexpr int32_t kPcmFrameBytes = 4096;
constexpr int64_t kMicrosecondsPerSecond = 1000000;
bool g_sendFormatChange = true;
bool g_invalidLayout = false;
bool g_failWrite = false;
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
    Require(codec->input.attr.size == kPcmFrameBytes, "PCM frame size");
    encodedPts.push_back(codec->input.attr.pts);
    for (int index = 0; index < codec->input.attr.size; index += kPcmBytes) {
        if (codec->input.data[index] == 0) {
            ++g_paddedSamples;
        }
    }
}

void AddOutput(OH_AVCodec *codec)
{
    OH_AVBuffer output = codec->input;
    if (codec->encoder && output.attr.size > 0) {
        output.attr.size = kEncodedBytes;
    }
    const auto id = codec->sequence++;
    codec->outputs.emplace(id, std::move(output));
    codec->queued.push_back(id);
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
extern "C" OH_AVErrCode FakeAudioCodecConfigure(OH_AVCodec *, const OH_AVFormat *)
{
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
    return AV_ERR_OK;
}
extern "C" OH_AVErrCode FakeAudioCodecStop(OH_AVCodec *codec) __asm__("OH_AudioCodec_Stop");
extern "C" OH_AVErrCode FakeAudioCodecStop(OH_AVCodec *codec)
{
    codec->started = false;
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
extern "C" OH_AVFormat *FakeAudioCodecGetOutputDescription(OH_AVCodec *)
{
    return FakeAvFormatCreateAudioFormat(OH_AVCODEC_MIMETYPE_AUDIO_AAC,
        g_invalidLayout ? kInvalidSampleRate : kSampleRate, kChannels);
}
extern "C" OH_AVErrCode FakeAudioCodecQueryInputBuffer(OH_AVCodec *codec, uint32_t *index, int64_t)
    __asm__("OH_AudioCodec_QueryInputBuffer");
extern "C" OH_AVErrCode FakeAudioCodecQueryInputBuffer(OH_AVCodec *codec, uint32_t *index, int64_t)
{
    if (++codec->calls % kQueryFrequency == 0 || codec->outputs.size() >= kOutputQueueLimit) {
        return AV_ERR_TRY_AGAIN_LATER;
    }
    *index = 0;
    return AV_ERR_OK;
}
extern "C" OH_AVBuffer *FakeAudioCodecGetInputBuffer(OH_AVCodec *codec, uint32_t)
    __asm__("OH_AudioCodec_GetInputBuffer");
extern "C" OH_AVBuffer *FakeAudioCodecGetInputBuffer(OH_AVCodec *codec, uint32_t)
{
    return &codec->input;
}
extern "C" OH_AVErrCode FakeAudioCodecPushInputBuffer(OH_AVCodec *codec, uint32_t)
    __asm__("OH_AudioCodec_PushInputBuffer");
extern "C" OH_AVErrCode FakeAudioCodecPushInputBuffer(OH_AVCodec *codec, uint32_t)
{
    if (codec->encoder) {
        RecordEncoderInput(codec);
    }
    AddOutput(codec);
    return AV_ERR_OK;
}
extern "C" OH_AVErrCode FakeAudioCodecQueryOutputBuffer(OH_AVCodec *codec, uint32_t *index, int64_t)
    __asm__("OH_AudioCodec_QueryOutputBuffer");
extern "C" OH_AVErrCode FakeAudioCodecQueryOutputBuffer(OH_AVCodec *codec, uint32_t *index, int64_t)
{
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
    constexpr int chunks[] = {kInputChunkSamples, kSecondChunkSamples, kTailChunkSamples};
    buffer->attr = {};
    buffer->attr.pts = kFirstPts + static_cast<int64_t>(demuxer->samples) * kMicrosecondsPerSecond / kSampleRate;
    if (demuxer->chunk == std::size(chunks)) {
        buffer->attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        return AV_ERR_OK;
    }
    buffer->attr.size = chunks[demuxer->chunk] * kPcmBytes;
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

void RunSuccess(bool formatEvent)
{
    g_sendFormatChange = formatEvent;
    g_paddedSamples = 0;
    g_inputEos = 0;
    encodedPts.clear();
    OH_AVDemuxer demuxer;
    OH_AVMuxer muxer;
    bool failed = false;
    auto source = std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)>(
        FakeAvFormatCreateAudioFormat(OH_AVCODEC_MIMETYPE_AUDIO_AAC, kSampleRate, kChannels),
        FakeAvFormatDestroy);
    {
        TranscodeAudioPipeline pipeline([&failed](const char *, int32_t) {
            failed = true;
            return false;
        });
        Require(pipeline.Configure(source.get(), &demuxer, 1), "Configure success pipeline");
        for (int tick = 0; tick < kMaxTicks && !pipeline.Done(); ++tick) {
            bool advanced = false;
            Require(pipeline.Pump(pipeline.Ready() && tick > kMuxStartTick ? &muxer : nullptr, 1, advanced),
                "Pump success pipeline");
        }
        Require(pipeline.Done() && !failed && muxer.packets == kExpectedPacketCount && g_inputEos == 1,
            "Complete success pipeline");
        Require(g_paddedSamples == kExpectedPaddedSamples && encodedPts.size() == kExpectedPacketCount &&
            encodedPts[0] == kFirstPts, "PCM padding and first PTS");
        Require(encodedPts[1] >= kSecondPtsMin && encodedPts[1] <= kSecondPtsMax, "Second PTS");
        Require(pipeline.Bytes() == kExpectedBytes, "Encoded byte count");
    }
}

void RunInterrupted(bool writeFailure)
{
    g_sendFormatChange = false;
    g_invalidLayout = false;
    g_failWrite = writeFailure;
    OH_AVDemuxer demuxer;
    OH_AVMuxer muxer;
    bool failed = false;
    auto source = std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)>(
        FakeAvFormatCreateAudioFormat(OH_AVCODEC_MIMETYPE_AUDIO_AAC, kSampleRate, kChannels),
        FakeAvFormatDestroy);
    {
        TranscodeAudioPipeline pipeline([&failed](const char *, int32_t) {
            failed = true;
            return false;
        });
        Require(pipeline.Configure(source.get(), &demuxer, 1), "Configure interrupted pipeline");
        for (int tick = 0; tick < kReadyTicks && !pipeline.Ready(); ++tick) {
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

int main()
{
    RunSuccess(true);
    RunSuccess(false);
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
            FakeAvFormatCreateAudioFormat(OH_AVCODEC_MIMETYPE_AUDIO_AAC, kSampleRate, kChannels),
            FakeAvFormatDestroy);
        Require(pipeline.Configure(source.get(), &demuxer, 1), "Configure invalid layout pipeline");
        for (int tick = 0; tick < kReadyTicks && !failed; ++tick) {
            bool advanced = false;
            pipeline.Pump(nullptr, 1, advanced);
        }
        Require(failed, "Invalid layout is rejected");
    }
    Require(g_destroyed == kExpectedDestroyed && g_returned > 0, "Codec cleanup");
    std::cout << "AAC pipeline checks passed\n";
}
