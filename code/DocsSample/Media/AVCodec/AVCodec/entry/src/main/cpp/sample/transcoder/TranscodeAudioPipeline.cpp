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

#include "TranscodeAudioPipeline.h"
#include <algorithm>
#include <cstring>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_averrors.h>

namespace {
constexpr int32_t AAC_SAMPLES = 1024;
constexpr int32_t PCM_BYTES = 2;
constexpr int64_t AAC_BITRATE = 128000;
using Format = std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)>;
}

bool TranscodeAudioPipeline::Check(int32_t result, const char *operation)
{
    return result == AV_ERR_OK || error_(operation, result);
}

bool TranscodeAudioPipeline::Configure(OH_AVFormat *source, OH_AVDemuxer *demuxer, int32_t track)
{
    demuxer_ = demuxer;
    track_ = track;
    const char *mime = nullptr;
    if (!OH_AVFormat_GetStringValue(source, OH_MD_KEY_CODEC_MIME, &mime) || mime == nullptr ||
        !OH_AVFormat_GetIntValue(source, OH_MD_KEY_AUD_CHANNEL_COUNT, &channels_) ||
        !OH_AVFormat_GetIntValue(source, OH_MD_KEY_AUD_SAMPLE_RATE, &sampleRate_) ||
        channels_ < 1 || channels_ > 2 || sampleRate_ <= 0 || sampleRate_ > 96000) {
        return error_("AAC transcode requires a valid mono/stereo audio track", -1);
    }
    decoder_ = OH_AudioCodec_CreateByMime(mime, false);
    encoder_ = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    Format encoded(OH_AVFormat_CreateAudioFormat(OH_AVCODEC_MIMETYPE_AUDIO_AAC, sampleRate_, channels_),
        OH_AVFormat_Destroy);
    if (decoder_ == nullptr || encoder_ == nullptr || encoded == nullptr) {
        return error_("Create audio decoder/AAC encoder", -1);
    }
    if (!OH_AVFormat_SetIntValue(source, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, SAMPLE_S16LE) ||
        !OH_AVFormat_SetIntValue(source, OH_MD_KEY_ENABLE_SYNC_MODE, 1) ||
        !OH_AVFormat_SetIntValue(encoded.get(), OH_MD_KEY_AUDIO_SAMPLE_FORMAT, SAMPLE_S16LE) ||
        !OH_AVFormat_SetIntValue(encoded.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1) ||
        !OH_AVFormat_SetLongValue(encoded.get(), OH_MD_KEY_BITRATE, AAC_BITRATE) ||
        !OH_AVFormat_SetIntValue(encoded.get(), OH_MD_KEY_PROFILE, AAC_PROFILE_LC) ||
        !OH_AVFormat_SetIntValue(encoded.get(), OH_MD_KEY_AAC_IS_ADTS, 0)) {
        return error_("Build audio decoder/AAC encoder format", -1);
    }
    if (!Check(OH_AudioCodec_Configure(decoder_, source), "Configure audio decoder") ||
        !Check(OH_AudioCodec_Configure(encoder_, encoded.get()), "Configure AAC encoder") ||
        !Check(OH_AudioCodec_Prepare(decoder_), "Prepare audio decoder") ||
        !Check(OH_AudioCodec_Prepare(encoder_), "Prepare AAC encoder") ||
        !Check(OH_AudioCodec_Start(encoder_), "Start AAC encoder")) { return false; }
    encoderStarted_ = true;
    if (!Check(OH_AudioCodec_Start(decoder_), "Start audio decoder")) { return false; }
    decoderStarted_ = true;
    frame_.reserve(static_cast<size_t>(AAC_SAMPLES) * channels_ * PCM_BYTES);
    return true;
}

bool TranscodeAudioPipeline::Feed(bool &advanced)
{
    if (inputDone_) { return true; }
    uint32_t index = 0;
    const int32_t result = OH_AudioCodec_QueryInputBuffer(decoder_, &index, 0);
    if (result == AV_ERR_TRY_AGAIN_LATER) { return true; }
    if (!Check(result, "Query audio decoder input")) { return false; }
    OH_AVBuffer *buffer = OH_AudioCodec_GetInputBuffer(decoder_, index);
    OH_AVCodecBufferAttr attr {};
    if (buffer == nullptr) { return error_("Get audio decoder input", -1); }
    if (!Check(OH_AVDemuxer_ReadSampleBuffer(demuxer_, track_, buffer), "Read compressed audio") ||
        !Check(OH_AVBuffer_GetBufferAttr(buffer, &attr), "Read compressed audio attributes") ||
        !Check(OH_AudioCodec_PushInputBuffer(decoder_, index), "Submit compressed audio")) { return false; }
    inputDone_ = (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    advanced = true;
    return true;
}

bool TranscodeAudioPipeline::ValidatePcm()
{
    Format format(OH_AudioCodec_GetOutputDescription(decoder_), OH_AVFormat_Destroy);
    int32_t rate = 0;
    int32_t channels = 0;
    int32_t sample = -1;
    if (format == nullptr || !OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_AUD_SAMPLE_RATE, &rate) ||
        !OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_AUD_CHANNEL_COUNT, &channels) ||
        !OH_AVFormat_GetIntValue(format.get(), OH_MD_KEY_AUDIO_SAMPLE_FORMAT, &sample) ||
        rate != sampleRate_ || channels != channels_ || sample != SAMPLE_S16LE) {
        return error_("Audio decoder must output unchanged sample-rate/channel-count interleaved S16LE", -1);
    }
    pcmValidated_ = true;
    return true;
}

bool TranscodeAudioPipeline::Decode(bool &advanced)
{
    if (decodedDone_ || pcm_ != nullptr) { return true; }
    const int32_t result = OH_AudioCodec_QueryOutputBuffer(decoder_, &pcmIndex_, 0);
    if (result == AV_ERR_TRY_AGAIN_LATER) { return true; }
    if (result == AV_ERR_STREAM_CHANGED) { advanced = true; return ValidatePcm(); }
    if (!Check(result, "Query decoded PCM")) { return false; }
    pcm_ = OH_AudioCodec_GetOutputBuffer(decoder_, pcmIndex_);
    if (pcm_ == nullptr || !Check(OH_AVBuffer_GetBufferAttr(pcm_, &pcmAttr_), "Read PCM attributes")) {
        pcm_ = nullptr;
        return error_("Get decoded PCM", -1);
    }
    if (!pcmValidated_ && !ValidatePcm()) { return false; }
    const int32_t capacity = OH_AVBuffer_GetCapacity(pcm_);
    if (pcmAttr_.offset < 0 || pcmAttr_.size < 0 || pcmAttr_.offset > capacity ||
        pcmAttr_.size > capacity - pcmAttr_.offset || pcmAttr_.size % (channels_ * PCM_BYTES) != 0) {
        return error_("Invalid decoded PCM layout", -1);
    }
    pcmConsumed_ = 0;
    advanced = true;
    return true;
}

bool TranscodeAudioPipeline::Encode(bool &advanced)
{
    const size_t frameBytes = static_cast<size_t>(AAC_SAMPLES) * channels_ * PCM_BYTES;
    if (pcm_ != nullptr && frame_.size() < frameBytes) {
        const uint8_t *address = OH_AVBuffer_GetAddr(pcm_);
        const size_t count = std::min(frameBytes - frame_.size(), static_cast<size_t>(pcmAttr_.size - pcmConsumed_));
        if (count > 0) {
            if (address == nullptr) { return error_("Read PCM address", -1); }
            if (frame_.empty()) {
                framePts_ = pcmAttr_.pts + static_cast<int64_t>(pcmConsumed_ / (channels_ * PCM_BYTES)) *
                    1000000 / sampleRate_;
            }
            frame_.insert(frame_.end(), address + pcmAttr_.offset + pcmConsumed_,
                address + pcmAttr_.offset + pcmConsumed_ + count);
            pcmConsumed_ += static_cast<int32_t>(count);
            advanced = true;
        }
        if (pcmConsumed_ == pcmAttr_.size) {
            decodedDone_ = (pcmAttr_.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
            if (!Check(OH_AudioCodec_FreeOutputBuffer(decoder_, pcmIndex_), "Return decoded PCM")) { return false; }
            pcm_ = nullptr;
        }
    }
    if (sentEos_ || (frame_.size() < frameBytes && !decodedDone_)) { return true; }
    uint32_t index = 0;
    const int32_t result = OH_AudioCodec_QueryInputBuffer(encoder_, &index, 0);
    if (result == AV_ERR_TRY_AGAIN_LATER) { return true; }
    if (!Check(result, "Query AAC encoder input")) { return false; }
    OH_AVBuffer *input = OH_AudioCodec_GetInputBuffer(encoder_, index);
    if (input == nullptr) { return error_("Get AAC encoder input", -1); }
    OH_AVCodecBufferAttr attr {};
    attr.pts = framePts_;
    attr.size = static_cast<int32_t>(frame_.size());
    if (attr.size > 0) {
        // AAC-LC consumes 1024 samples; pad only the final partial PCM frame.
        frame_.resize(frameBytes, 0);
        attr.size = static_cast<int32_t>(frameBytes);
        uint8_t *target = OH_AVBuffer_GetAddr(input);
        if (target == nullptr || OH_AVBuffer_GetCapacity(input) < attr.size) {
            return error_("AAC encoder input is smaller than one PCM frame", -1);
        }
        std::copy(frame_.begin(), frame_.end(), target);
    } else {
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
    }
    if (!Check(OH_AVBuffer_SetBufferAttr(input, &attr), "Set AAC input attributes") ||
        !Check(OH_AudioCodec_PushInputBuffer(encoder_, index), "Submit AAC PCM/EOS")) { return false; }
    sentEos_ = attr.size == 0;
    frame_.clear();
    advanced = true;
    return true;
}

bool TranscodeAudioPipeline::Drain(OH_AVMuxer *muxer, int32_t muxTrack, bool &advanced)
{
    if (outputDone_ || (ready_ && muxer == nullptr)) { return true; }
    uint32_t index = 0;
    const int32_t result = OH_AudioCodec_QueryOutputBuffer(encoder_, &index, 0);
    if (result == AV_ERR_TRY_AGAIN_LATER) { return true; }
    if (result == AV_ERR_STREAM_CHANGED) { ready_ = true; advanced = true; return true; }
    if (!Check(result, "Query AAC output")) { return false; }
    OH_AVBuffer *buffer = OH_AudioCodec_GetOutputBuffer(encoder_, index);
    OH_AVCodecBufferAttr attr {};
    if (buffer == nullptr || !Check(OH_AVBuffer_GetBufferAttr(buffer, &attr), "Read AAC output attributes")) {
        return error_("Get AAC output", -1);
    }
    // Preserve the first packet until both output formats are known and the muxer starts.
    if (muxer == nullptr) {
        pendingOutput_ = buffer;
        pendingOutputIndex_ = index;
        ready_ = true;
        advanced = true;
        return true;
    }
    const bool success = attr.size == 0 || (attr.flags & AVCODEC_BUFFER_FLAGS_CODEC_DATA) != 0 ||
        Check(OH_AVMuxer_WriteSampleBuffer(muxer, muxTrack, buffer), "Write AAC sample");
    const bool returned = Check(OH_AudioCodec_FreeOutputBuffer(encoder_, index), "Return AAC output");
    bytes_ += attr.size;
    positionUs_ = std::max(positionUs_, attr.pts);
    outputDone_ = (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    advanced = true;
    return success && returned;
}

bool TranscodeAudioPipeline::Pump(OH_AVMuxer *muxer, int32_t muxTrack, bool &advanced)
{
    if (pendingOutput_ != nullptr && muxer != nullptr) {
        OH_AVCodecBufferAttr attr {};
        if (!Check(OH_AVBuffer_GetBufferAttr(pendingOutput_, &attr), "Read pending AAC output")) { return false; }
        const bool success = attr.size == 0 || (attr.flags & AVCODEC_BUFFER_FLAGS_CODEC_DATA) != 0 ||
            Check(OH_AVMuxer_WriteSampleBuffer(muxer, muxTrack, pendingOutput_), "Write first AAC sample");
        const bool returned = Check(OH_AudioCodec_FreeOutputBuffer(encoder_, pendingOutputIndex_),
            "Return first AAC output");
        pendingOutput_ = nullptr;
        bytes_ += attr.size;
        positionUs_ = std::max(positionUs_, attr.pts);
        outputDone_ = (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
        if (!success || !returned) { return false; }
        advanced = true;
    }
    return outputDone_ || (Drain(muxer, muxTrack, advanced) && Encode(advanced) && Decode(advanced) && Feed(advanced));
}

OH_AVFormat *TranscodeAudioPipeline::OutputFormat() const
{
    return ready_ ? OH_AudioCodec_GetOutputDescription(encoder_) : nullptr;
}

TranscodeAudioPipeline::~TranscodeAudioPipeline()
{
    if (decoder_ != nullptr) {
        if (decoderStarted_) { (void)OH_AudioCodec_Stop(decoder_); }
        OH_AudioCodec_Destroy(decoder_);
    }
    if (encoder_ != nullptr) {
        if (encoderStarted_) { (void)OH_AudioCodec_Stop(encoder_); }
        OH_AudioCodec_Destroy(encoder_);
    }
}
