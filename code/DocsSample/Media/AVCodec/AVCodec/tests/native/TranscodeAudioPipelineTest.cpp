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
#include <cassert>
#include <deque>
#include <iostream>
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
bool sendFormatChange = true;
bool invalidLayout = false;
bool failWrite = false;
int destroyed = 0;
int paddedSamples = 0;
int inputEos = 0;
int returned = 0;
std::vector<int64_t> encodedPts;
}

OH_AVFormat *OH_AVFormat_CreateAudioFormat(const char *, int32_t rate, int32_t channels)
{
    auto *format = new OH_AVFormat;
    format->numbers = {{"rate", rate}, {"channels", channels}, {"sample", SAMPLE_S16LE}};
    return format;
}
void OH_AVFormat_Destroy(OH_AVFormat *format) { delete format; }
bool OH_AVFormat_SetIntValue(OH_AVFormat *format, const char *key, int32_t number)
{ format->numbers[key] = number; return true; }
bool OH_AVFormat_SetLongValue(OH_AVFormat *format, const char *key, int64_t number)
{ format->numbers[key] = number; return true; }
bool OH_AVFormat_GetIntValue(OH_AVFormat *format, const char *key, int32_t *number)
{
    const auto found = format->numbers.find(key);
    if (found == format->numbers.end()) { return false; }
    *number = static_cast<int32_t>(found->second);
    return true;
}
bool OH_AVFormat_GetStringValue(OH_AVFormat *, const char *, const char **text)
{ *text = OH_AVCODEC_MIMETYPE_AUDIO_AAC; return true; }
OH_AVCodec *OH_AudioCodec_CreateByMime(const char *, bool encoder)
{ auto *codec = new OH_AVCodec; codec->encoder = encoder; return codec; }
OH_AVErrCode OH_AudioCodec_Configure(OH_AVCodec *, const OH_AVFormat *) { return AV_ERR_OK; }
OH_AVErrCode OH_AudioCodec_Prepare(OH_AVCodec *) { return AV_ERR_OK; }
OH_AVErrCode OH_AudioCodec_Start(OH_AVCodec *codec) { codec->started = true; return AV_ERR_OK; }
OH_AVErrCode OH_AudioCodec_Stop(OH_AVCodec *codec) { codec->started = false; return AV_ERR_OK; }
OH_AVErrCode OH_AudioCodec_Destroy(OH_AVCodec *codec) { ++destroyed; delete codec; return AV_ERR_OK; }
OH_AVFormat *OH_AudioCodec_GetOutputDescription(OH_AVCodec *)
{ return OH_AVFormat_CreateAudioFormat(OH_AVCODEC_MIMETYPE_AUDIO_AAC, invalidLayout ? 44100 : 48000, 2); }
OH_AVErrCode OH_AudioCodec_QueryInputBuffer(OH_AVCodec *codec, uint32_t *index, int64_t)
{
    if (++codec->calls % 3 == 0 || codec->outputs.size() >= 2) { return AV_ERR_TRY_AGAIN_LATER; }
    *index = 0;
    return AV_ERR_OK;
}
OH_AVBuffer *OH_AudioCodec_GetInputBuffer(OH_AVCodec *codec, uint32_t) { return &codec->input; }
OH_AVErrCode OH_AudioCodec_PushInputBuffer(OH_AVCodec *codec, uint32_t)
{
    if (codec->encoder) {
        if ((codec->input.attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0) { ++inputEos; }
        else {
            assert(codec->input.attr.size == 4096);
            encodedPts.push_back(codec->input.attr.pts);
            for (int index = 0; index < codec->input.attr.size; index += 4) {
                if (codec->input.data[index] == 0) { ++paddedSamples; }
            }
        }
    }
    OH_AVBuffer output = codec->input;
    if (codec->encoder && output.attr.size > 0) { output.attr.size = 8; }
    const auto id = codec->sequence++;
    codec->outputs.emplace(id, std::move(output));
    codec->queued.push_back(id);
    return AV_ERR_OK;
}
OH_AVErrCode OH_AudioCodec_QueryOutputBuffer(OH_AVCodec *codec, uint32_t *index, int64_t)
{
    if (!codec->changed && sendFormatChange) { codec->changed = true; return AV_ERR_STREAM_CHANGED; }
    if (codec->queued.empty()) { return AV_ERR_TRY_AGAIN_LATER; }
    *index = codec->queued.front();
    codec->queued.pop_front();
    return AV_ERR_OK;
}
OH_AVBuffer *OH_AudioCodec_GetOutputBuffer(OH_AVCodec *codec, uint32_t index)
{ return &codec->outputs.at(index); }
OH_AVErrCode OH_AudioCodec_FreeOutputBuffer(OH_AVCodec *codec, uint32_t index)
{ assert(codec->outputs.erase(index) == 1); ++returned; return AV_ERR_OK; }
uint8_t *OH_AVBuffer_GetAddr(OH_AVBuffer *buffer) { return buffer->data.data(); }
int32_t OH_AVBuffer_GetCapacity(OH_AVBuffer *buffer) { return static_cast<int32_t>(buffer->data.size()); }
OH_AVErrCode OH_AVBuffer_GetBufferAttr(OH_AVBuffer *buffer, OH_AVCodecBufferAttr *attr)
{ *attr = buffer->attr; return AV_ERR_OK; }
OH_AVErrCode OH_AVBuffer_SetBufferAttr(OH_AVBuffer *buffer, const OH_AVCodecBufferAttr *attr)
{ buffer->attr = *attr; return AV_ERR_OK; }
OH_AVErrCode OH_AVDemuxer_ReadSampleBuffer(OH_AVDemuxer *demuxer, uint32_t, OH_AVBuffer *buffer)
{
    constexpr int CHUNKS[] = {300, 1300, 37};
    buffer->attr = {};
    buffer->attr.pts = 100000 + static_cast<int64_t>(demuxer->samples) * 1000000 / 48000;
    if (demuxer->chunk == 3) { buffer->attr.flags = AVCODEC_BUFFER_FLAGS_EOS; return AV_ERR_OK; }
    buffer->attr.size = CHUNKS[demuxer->chunk] * 4;
    std::fill(buffer->data.begin(), buffer->data.end(), 1);
    demuxer->samples += CHUNKS[demuxer->chunk++];
    return AV_ERR_OK;
}
OH_AVErrCode OH_AVMuxer_WriteSampleBuffer(OH_AVMuxer *muxer, uint32_t, const OH_AVBuffer *buffer)
{
    if (failWrite) { return AV_ERR_UNKNOWN; }
    ++muxer->packets;
    muxer->timestamps.push_back(buffer->attr.pts);
    return AV_ERR_OK;
}

void RunSuccess(bool formatEvent)
{
    sendFormatChange = formatEvent;
    paddedSamples = 0;
    inputEos = 0;
    encodedPts.clear();
    OH_AVDemuxer demuxer;
    OH_AVMuxer muxer;
    bool failed = false;
    auto source = std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)>(
        OH_AVFormat_CreateAudioFormat(OH_AVCODEC_MIMETYPE_AUDIO_AAC, 48000, 2), OH_AVFormat_Destroy);
    {
        TranscodeAudioPipeline pipeline([&](const char *, int32_t) { failed = true; return false; });
        assert(pipeline.Configure(source.get(), &demuxer, 1));
        for (int tick = 0; tick < 1000 && !pipeline.Done(); ++tick) {
            bool advanced = false;
            assert(pipeline.Pump(pipeline.Ready() && tick > 20 ? &muxer : nullptr, 1, advanced));
        }
        assert(pipeline.Done() && !failed && muxer.packets == 2 && inputEos == 1);
        assert(paddedSamples == 411 && encodedPts.size() == 2 && encodedPts[0] == 100000);
        assert(encodedPts[1] >= 121332 && encodedPts[1] <= 121334);
        assert(pipeline.Bytes() == 16);
    }
}

void RunInterrupted(bool writeFailure)
{
    sendFormatChange = false;
    invalidLayout = false;
    failWrite = writeFailure;
    OH_AVDemuxer demuxer;
    OH_AVMuxer muxer;
    bool failed = false;
    auto source = std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)>(
        OH_AVFormat_CreateAudioFormat(OH_AVCODEC_MIMETYPE_AUDIO_AAC, 48000, 2), OH_AVFormat_Destroy);
    {
        TranscodeAudioPipeline pipeline([&](const char *, int32_t) { failed = true; return false; });
        assert(pipeline.Configure(source.get(), &demuxer, 1));
        for (int tick = 0; tick < 100 && !pipeline.Ready(); ++tick) {
            bool advanced = false;
            assert(pipeline.Pump(nullptr, 1, advanced));
        }
        assert(pipeline.Ready() && !pipeline.Done());
        if (writeFailure) {
            const int previouslyReturned = returned;
            bool advanced = false;
            assert(!pipeline.Pump(&muxer, 1, advanced));
            assert(failed && returned == previouslyReturned + 1 && muxer.packets == 0);
        }
        // Destruction also covers cancellation with a borrowed first output packet.
    }
    failWrite = false;
}

int main()
{
    RunSuccess(true);
    RunSuccess(false);
    RunInterrupted(true);
    RunInterrupted(false);
    invalidLayout = true;
    OH_AVDemuxer demuxer;
    bool failed = false;
    {
        TranscodeAudioPipeline pipeline([&](const char *, int32_t) { failed = true; return false; });
        auto source = std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)>(
            OH_AVFormat_CreateAudioFormat(OH_AVCODEC_MIMETYPE_AUDIO_AAC, 48000, 2), OH_AVFormat_Destroy);
        assert(pipeline.Configure(source.get(), &demuxer, 1));
        for (int tick = 0; tick < 100 && !failed; ++tick) {
            bool advanced = false;
            pipeline.Pump(nullptr, 1, advanced);
        }
        assert(failed);
    }
    assert(destroyed == 10 && returned > 0);
    std::cout << "AAC pipeline: split PCM, backpressure, format/no-format event, first packet, PTS, padded tail, EOS and cleanup passed\n";
}
