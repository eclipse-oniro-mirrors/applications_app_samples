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
#include <cmath>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <multimedia/player_framework/native_averrors.h>

namespace {
constexpr int64_t PCM_TIMESTAMP_TOLERANCE_US = 2000;
constexpr int32_t PCM_TIMESTAMP_FRAME_TOLERANCE = 2;
constexpr int32_t AAC_SAMPLES = 1024;
constexpr int32_t PCM_BYTES = 2;
constexpr int64_t AAC_BITRATE = 128000;
constexpr int32_t MAX_CHANNELS = 2;
constexpr int32_t MAX_SAMPLE_RATE = 96000;
constexpr int64_t US_PER_SECOND = 1000000;
constexpr int32_t SYNC_MODE_ENABLED = 1;
constexpr int32_t ADTS_DISABLED = 0;
using Format = std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)>;

bool SamplesBefore(int64_t boundaryUs, int64_t ptsUs, int64_t samples, int32_t rate, bool roundUp,
    int64_t &count)
{
    count = 0;
    if (rate <= 0) { return false; }
    if (boundaryUs <= ptsUs || samples == 0) { return true; }
    // Cap large timestamp gaps before subtraction; a positive integer rate supplies at least one sample per second.
    if (ptsUs <= boundaryUs - samples * US_PER_SECOND) {
        count = samples;
        return true;
    }
    const int64_t elapsedUs = boundaryUs - ptsUs;
    const int64_t wholeSamples = (elapsedUs / US_PER_SECOND) * rate;
    const int64_t rounding = roundUp ? US_PER_SECOND - 1 : 0;
    const int64_t fractionalSamples = ((elapsedUs % US_PER_SECOND) * rate + rounding) / US_PER_SECOND;
    count = std::min(samples, wholeSamples + fractionalSamples);
    return true;
}

bool ConfigureDecoderFormat(OH_AVFormat *source, bool asynchronous)
{
    return OH_AVFormat_SetIntValue(source, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, SAMPLE_S16LE) &&
        OH_AVFormat_SetIntValue(source, OH_MD_KEY_ENABLE_SYNC_MODE, asynchronous ? 0 : SYNC_MODE_ENABLED);
}

bool ConfigureEncoderFormat(OH_AVFormat *encoded, int64_t bitrate, bool asynchronous)
{
    return OH_AVFormat_SetIntValue(encoded, OH_MD_KEY_AUDIO_SAMPLE_FORMAT, SAMPLE_S16LE) &&
        OH_AVFormat_SetIntValue(encoded, OH_MD_KEY_ENABLE_SYNC_MODE, asynchronous ? 0 : SYNC_MODE_ENABLED) &&
        OH_AVFormat_SetLongValue(encoded, OH_MD_KEY_BITRATE, bitrate) &&
        OH_AVFormat_SetIntValue(encoded, OH_MD_KEY_PROFILE, AAC_PROFILE_LC) &&
        OH_AVFormat_SetIntValue(encoded, OH_MD_KEY_AAC_IS_ADTS, ADTS_DISABLED);
}
}

bool TranscodeAudioPipeline::Check(int32_t result, const char *operation)
{
    if (result == AV_ERR_OK) { return true; }
    bool encoderError = false;
    const int32_t callbackError = asynchronous_ ? callbacks_.Error(encoderError) : AV_ERR_OK;
    if (callbackError != AV_ERR_OK) {
        return error_(encoderError ? "Asynchronous AAC encoder callback" : "Asynchronous audio decoder callback",
            callbackError);
    }
    return error_(operation, result);
}

int64_t TranscodeAudioPipeline::TargetBitrate()
{
    return AAC_BITRATE;
}

bool TranscodeAudioPipeline::ReadSourceFormat(OH_AVFormat *source, const char *&mime)
{
    if (!OH_AVFormat_GetStringValue(source, OH_MD_KEY_CODEC_MIME, &mime) || mime == nullptr ||
        !OH_AVFormat_GetIntValue(source, OH_MD_KEY_AUD_CHANNEL_COUNT, &channels_) ||
        !OH_AVFormat_GetIntValue(source, OH_MD_KEY_AUD_SAMPLE_RATE, &sampleRate_) ||
        channels_ < 1 || channels_ > MAX_CHANNELS || sampleRate_ <= 0 || sampleRate_ > MAX_SAMPLE_RATE) {
        return error_("AAC transcode requires a valid mono/stereo audio track", -1);
    }
    return true;
}

bool TranscodeAudioPipeline::ConfigureFormats(OH_AVFormat *source, OH_AVFormat *encoded)
{
    if (!ConfigureDecoderFormat(source, asynchronous_) || !ConfigureEncoderFormat(encoded, bitrate_, asynchronous_)) {
        return error_("Build audio decoder/AAC encoder format", -1);
    }
    if (asynchronous_) {
        const OH_AVCodecCallback callbacks = TranscodeCodecCallbacks::Callbacks();
        if (!Check(OH_AudioCodec_RegisterCallback(decoder_, callbacks, callbacks_.DecoderContext()),
            "Register asynchronous audio decoder") ||
            !Check(OH_AudioCodec_RegisterCallback(encoder_, callbacks, callbacks_.EncoderContext()),
                "Register asynchronous AAC encoder")) { return false; }
    }
    return Check(OH_AudioCodec_Configure(decoder_, source), "Configure audio decoder") &&
        Check(OH_AudioCodec_Configure(encoder_, encoded), "Configure AAC encoder");
}

bool TranscodeAudioPipeline::PrepareCodecs()
{
    return Check(OH_AudioCodec_Prepare(decoder_), "Prepare audio decoder") &&
        Check(OH_AudioCodec_Prepare(encoder_), "Prepare AAC encoder");
}

bool TranscodeAudioPipeline::StartCodecs()
{
    if (!Check(OH_AudioCodec_Start(encoder_), "Start AAC encoder")) {
        return false;
    }
    encoderStarted_ = true;
    if (!Check(OH_AudioCodec_Start(decoder_), "Start audio decoder")) {
        return false;
    }
    decoderStarted_ = true;
    return true;
}

bool TranscodeAudioPipeline::Configure(OH_AVFormat *source, OH_AVDemuxer *demuxer, int32_t track,
    int64_t rangeStartUs, int64_t rangeEndUs, int32_t targetRate, int32_t targetChannels, int64_t bitrate, bool lowPass,
    bool asynchronous)
{
    asynchronous_ = asynchronous;
    demuxer_ = demuxer;
    track_ = track;
    rangeStartUs_ = rangeStartUs;
    rangeEndUs_ = rangeEndUs;
    const char *mime = nullptr;
    if (!ReadSourceFormat(source, mime)) { return false; }
    targetRate_ = targetRate == 0 ? sampleRate_ : targetRate;
    targetChannels_ = targetChannels == 0 ? channels_ : targetChannels;
    bitrate_ = bitrate;
    if (!converter_.Configure(sampleRate_, targetRate_, channels_, targetChannels_, lowPass)) {
        return error_("Invalid PCM conversion configuration", -1);
    }
    decoder_ = OH_AudioCodec_CreateByMime(mime, false);
    encoder_ = OH_AudioCodec_CreateByMime(OH_AVCODEC_MIMETYPE_AUDIO_AAC, true);
    Format encoded(OH_AVFormat_CreateAudioFormat(OH_AVCODEC_MIMETYPE_AUDIO_AAC, targetRate_, targetChannels_),
        OH_AVFormat_Destroy);
    if (decoder_ == nullptr || encoder_ == nullptr || encoded == nullptr) {
        return error_("Create audio decoder/AAC encoder", -1);
    }
    if (!ConfigureFormats(source, encoded.get()) || !PrepareCodecs() || !StartCodecs()) {
        return false;
    }
    frame_.reserve(static_cast<size_t>(AAC_SAMPLES) * targetChannels_ * PCM_BYTES);
    return true;
}

// [Start transcode_audio_feed_sync]
bool TranscodeAudioPipeline::FeedSync(bool &advanced)
{
    if (inputDone_) { return true; }
    uint32_t index = 0;
    const int32_t result = OH_AudioCodec_QueryInputBuffer(decoder_, &index, 0);
    if (result == AV_ERR_TRY_AGAIN_LATER) { return true; }
    if (!Check(result, "Query audio decoder input")) { return false; }
    OH_AVBuffer *buffer = OH_AudioCodec_GetInputBuffer(decoder_, index);
    return FeedBuffer(index, buffer, advanced);
}
// [End transcode_audio_feed_sync]

// [Start transcode_audio_feed_async]
bool TranscodeAudioPipeline::FeedAsync(bool &advanced)
{
    if (inputDone_) { return true; }
    TranscodeCodecBuffer input;
    const int32_t result = callbacks_.Take(false, true, input);
    if (result == AV_ERR_TRY_AGAIN_LATER) { return true; }
    if (!Check(result, "Read asynchronous audio decoder input")) { return false; }
    return FeedBuffer(input.index, input.buffer, advanced);
}
// [End transcode_audio_feed_async]

bool TranscodeAudioPipeline::FeedBuffer(uint32_t index, OH_AVBuffer *buffer, bool &advanced)
{
    OH_AVCodecBufferAttr attr {};
    if (buffer == nullptr) { return error_("Get audio decoder input", -1); }
    if (!Check(OH_AVDemuxer_ReadSampleBuffer(demuxer_, track_, buffer), "Read compressed audio") ||
        !Check(OH_AVBuffer_GetBufferAttr(buffer, &attr), "Read compressed audio attributes")) { return false; }
    if (rangeEndUs_ > rangeStartUs_ && attr.pts >= rangeEndUs_) {
        attr = {};
        attr.flags = AVCODEC_BUFFER_FLAGS_EOS;
        if (!Check(OH_AVBuffer_SetBufferAttr(buffer, &attr), "Set AAC range EOS")) { return false; }
        inputDone_ = true;
    }
    if (!Check(OH_AudioCodec_PushInputBuffer(decoder_, index), "Submit compressed audio")) { return false; }
    inputDone_ = inputDone_ || (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
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

// [Start transcode_audio_decode_sync]
bool TranscodeAudioPipeline::DecodeSync(bool &advanced)
{
    if (decodedDone_ || pcm_ != nullptr) { return true; }
    const int32_t result = OH_AudioCodec_QueryOutputBuffer(decoder_, &pcmIndex_, 0);
    if (result == AV_ERR_TRY_AGAIN_LATER) { return true; }
    if (result == AV_ERR_STREAM_CHANGED) {
        advanced = true;
        return ValidatePcm();
    }
    if (!Check(result, "Query decoded PCM")) { return false; }
    pcm_ = OH_AudioCodec_GetOutputBuffer(decoder_, pcmIndex_);
    return AcceptPcm(advanced);
}
// [End transcode_audio_decode_sync]

// [Start transcode_audio_decode_async]
bool TranscodeAudioPipeline::DecodeAsync(bool &advanced)
{
    if (decodedDone_ || pcm_ != nullptr) { return true; }
    TranscodeCodecBuffer output;
    const int32_t result = callbacks_.Take(false, false, output);
    if (result == AV_ERR_TRY_AGAIN_LATER) { return true; }
    if (result == AV_ERR_STREAM_CHANGED) { advanced = true; return ValidatePcm(); }
    if (!Check(result, "Read asynchronous decoded PCM")) { return false; }
    pcm_ = output.buffer;
    pcmIndex_ = output.index;
    return AcceptPcm(advanced);
}
// [End transcode_audio_decode_async]

bool TranscodeAudioPipeline::AcceptPcm(bool &advanced)
{
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
    if (!TrimPcm()) { return false; }
    advanced = true;
    return true;
}

bool TranscodeAudioPipeline::TrimPcm()
{
    if (rangeEndUs_ <= 0) {
        pcmAttr_.pts = std::max<int64_t>(0, pcmAttr_.pts - rangeStartUs_);
        return true;
    }
    if (sampleRate_ <= 0 || channels_ <= 0) {
        return error_("Invalid PCM sample rate or channel count", -1);
    }
    const int32_t bytesPerSample = channels_ * PCM_BYTES;
    const int64_t samples = pcmAttr_.size / bytesPerSample;
    int64_t first = 0;
    int64_t last = 0;
    if (!SamplesBefore(rangeStartUs_, pcmAttr_.pts, samples, sampleRate_, true, first) ||
        !SamplesBefore(rangeEndUs_, pcmAttr_.pts, samples, sampleRate_, false, last)) {
        return error_("Invalid PCM sample rate for time-range trimming", -1);
    }
    last = std::max(first, last);
    pcmAttr_.offset += static_cast<int32_t>(first * bytesPerSample);
    pcmAttr_.size = static_cast<int32_t>((last - first) * bytesPerSample);
    if (pcmAttr_.size == 0) {
        pcmAttr_.pts = 0;
        return true;
    }
    pcmAttr_.pts = std::max<int64_t>(0, pcmAttr_.pts + first * US_PER_SECOND / sampleRate_ - rangeStartUs_);
    return true;
}

bool TranscodeAudioPipeline::CheckPcmTimestampContinuity()
{
    if (pcmConsumed_ != 0 || pcmStartPts_ < 0) {
        return true;
    }
    const int64_t expected = pcmStartPts_ + consumedSourceSamples_ / sampleRate_ * US_PER_SECOND +
        consumedSourceSamples_ % sampleRate_ * US_PER_SECOND / sampleRate_;
    const int64_t tolerance = std::max<int64_t>(PCM_TIMESTAMP_TOLERANCE_US,
        PCM_TIMESTAMP_FRAME_TOLERANCE * US_PER_SECOND / sampleRate_);
    if (std::abs(static_cast<double>(pcmAttr_.pts) - expected) > tolerance) {
        return error_("Discontinuous PCM timestamps; conversion will not compress timeline gaps", -1);
    }
    return true;
}

bool TranscodeAudioPipeline::ConsumePcmSample(bool &advanced)
{
    const uint8_t *address = OH_AVBuffer_GetAddr(pcm_);
    if (address == nullptr) {
        return error_("Read PCM address", -1);
    }
    if (!CheckPcmTimestampContinuity()) {
        return false;
    }
    if (pcmStartPts_ < 0) {
        pcmStartPts_ = pcmAttr_.pts;
    }
    converter_.Push(address + pcmAttr_.offset + pcmConsumed_);
    pcmConsumed_ += channels_ * PCM_BYTES;
    ++consumedSourceSamples_;
    advanced = true;
    return true;
}

bool TranscodeAudioPipeline::ReleasePcmOutput()
{
    decodedDone_ = (pcmAttr_.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    if (decodedDone_) {
        converter_.Finish();
    }
    if (!Check(OH_AudioCodec_FreeOutputBuffer(decoder_, pcmIndex_), "Return decoded PCM")) {
        return false;
    }
    pcm_ = nullptr;
    return true;
}

bool TranscodeAudioPipeline::FillPcmFrame(bool &advanced)
{
    const size_t frameBytes = static_cast<size_t>(AAC_SAMPLES) * targetChannels_ * PCM_BYTES;
    while (frame_.size() < frameBytes && (pcm_ != nullptr || converter_.Pending())) {
        if (converter_.Pending()) {
            converter_.Pull(frame_);
            advanced = true;
            continue;
        }
        if (pcmConsumed_ < pcmAttr_.size) {
            if (!ConsumePcmSample(advanced)) {
                return false;
            }
        }
        if (pcmConsumed_ == pcmAttr_.size) {
            if (!ReleasePcmOutput()) {
                return false;
            }
        }
    }
    return true;
}

// [Start transcode_audio_encode_sync]
bool TranscodeAudioPipeline::EncodeSync(bool &advanced)
{
    const size_t frameBytes = static_cast<size_t>(AAC_SAMPLES) * targetChannels_ * PCM_BYTES;
    if (!FillPcmFrame(advanced)) { return false; }
    if (sentEos_ || (frame_.size() < frameBytes && !decodedDone_)) { return true; }
    uint32_t index = 0;
    const int32_t result = OH_AudioCodec_QueryInputBuffer(encoder_, &index, 0);
    if (result == AV_ERR_TRY_AGAIN_LATER) { return true; }
    if (!Check(result, "Query AAC encoder input")) { return false; }
    OH_AVBuffer *input = OH_AudioCodec_GetInputBuffer(encoder_, index);
    return SubmitPcm(index, input, advanced);
}
// [End transcode_audio_encode_sync]

// [Start transcode_audio_encode_async]
bool TranscodeAudioPipeline::EncodeAsync(bool &advanced)
{
    const size_t frameBytes = static_cast<size_t>(AAC_SAMPLES) * targetChannels_ * PCM_BYTES;
    if (!FillPcmFrame(advanced)) { return false; }
    if (sentEos_ || (frame_.size() < frameBytes && !decodedDone_)) { return true; }
    TranscodeCodecBuffer input;
    const int32_t result = callbacks_.Take(true, true, input);
    if (result == AV_ERR_TRY_AGAIN_LATER) { return true; }
    if (!Check(result, "Read asynchronous AAC input")) { return false; }
    return SubmitPcm(input.index, input.buffer, advanced);
}
// [End transcode_audio_encode_async]

bool TranscodeAudioPipeline::SubmitPcm(uint32_t index, OH_AVBuffer *input, bool &advanced)
{
    const size_t frameBytes = static_cast<size_t>(AAC_SAMPLES) * targetChannels_ * PCM_BYTES;
    if (input == nullptr) { return error_("Get AAC encoder input", -1); }
    OH_AVCodecBufferAttr attr {};
    attr.pts = std::max<int64_t>(0, pcmStartPts_) + submittedSamples_ / targetRate_ * US_PER_SECOND +
        submittedSamples_ % targetRate_ * US_PER_SECOND / targetRate_;
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
    if (!sentEos_) { submittedSamples_ += AAC_SAMPLES; }
    frame_.clear();
    advanced = true;
    return true;
}

// [Start transcode_audio_drain_sync]
bool TranscodeAudioPipeline::DrainSync(OH_AVMuxer *muxer, int32_t muxTrack, bool &advanced)
{
    if (outputDone_ || (ready_ && muxer == nullptr)) { return true; }
    uint32_t index = 0;
    const int32_t result = OH_AudioCodec_QueryOutputBuffer(encoder_, &index, 0);
    if (result == AV_ERR_TRY_AGAIN_LATER) { return true; }
    if (result == AV_ERR_STREAM_CHANGED) {
        ready_ = true;
        advanced = true;
        return true;
    }
    if (!Check(result, "Query AAC output")) { return false; }
    OH_AVBuffer *buffer = OH_AudioCodec_GetOutputBuffer(encoder_, index);
    return WriteOutput(index, buffer, muxer, muxTrack, advanced);
}
// [End transcode_audio_drain_sync]

// [Start transcode_audio_drain_async]
bool TranscodeAudioPipeline::DrainAsync(OH_AVMuxer *muxer, int32_t muxTrack, bool &advanced)
{
    if (outputDone_ || (ready_ && muxer == nullptr)) { return true; }
    TranscodeCodecBuffer output;
    const int32_t result = callbacks_.Take(true, false, output);
    if (result == AV_ERR_TRY_AGAIN_LATER) { return true; }
    if (result == AV_ERR_STREAM_CHANGED) { ready_ = true; advanced = true; return true; }
    if (!Check(result, "Read asynchronous AAC output")) { return false; }
    return WriteOutput(output.index, output.buffer, muxer, muxTrack, advanced);
}
// [End transcode_audio_drain_async]

bool TranscodeAudioPipeline::WriteOutput(uint32_t index, OH_AVBuffer *buffer, OH_AVMuxer *muxer,
    int32_t muxTrack, bool &advanced)
{
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
    bool encoderError = false;
    const int32_t callbackError = asynchronous_ ? callbacks_.Error(encoderError) : AV_ERR_OK;
    if (!Check(callbackError,
        encoderError ? "Asynchronous AAC encoder callback" : "Asynchronous audio decoder callback")) { return false; }
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
    if (outputDone_) { return true; }
    if (asynchronous_) {
        return DrainAsync(muxer, muxTrack, advanced) && EncodeAsync(advanced) && DecodeAsync(advanced) &&
            FeedAsync(advanced);
    }
    return DrainSync(muxer, muxTrack, advanced) && EncodeSync(advanced) && DecodeSync(advanced) && FeedSync(advanced);
}

OH_AVFormat *TranscodeAudioPipeline::OutputFormat() const
{
    return ready_ ? OH_AudioCodec_GetOutputDescription(encoder_) : nullptr;
}

TranscodeAudioPipeline::~TranscodeAudioPipeline()
{
    callbacks_.Close();
    if (decoder_ != nullptr) {
        if (decoderStarted_) { (void)OH_AudioCodec_Stop(decoder_); }
        OH_AudioCodec_Destroy(decoder_);
    }
    if (encoder_ != nullptr) {
        if (encoderStarted_) { (void)OH_AudioCodec_Stop(encoder_); }
        OH_AudioCodec_Destroy(encoder_);
    }
}
