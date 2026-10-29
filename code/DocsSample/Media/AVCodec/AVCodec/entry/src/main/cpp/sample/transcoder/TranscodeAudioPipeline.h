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

#ifndef AVCODEC_TRANSCODE_AUDIO_PIPELINE_H
#define AVCODEC_TRANSCODE_AUDIO_PIPELINE_H
#include <functional>
#include <memory>
#include <vector>
#include <multimedia/player_framework/native_avcodec_audiocodec.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <multimedia/player_framework/native_avmuxer.h>

// One borrowed decoder output and at most one AAC PCM frame are retained.
class TranscodeAudioPipeline {
public:
    using Error = std::function<bool(const char *, int32_t)>;
    explicit TranscodeAudioPipeline(Error error) : error_(std::move(error)) {}
    ~TranscodeAudioPipeline();
    bool Configure(OH_AVFormat *source, OH_AVDemuxer *demuxer, int32_t track, int64_t rangeStartUs = 0,
        int64_t rangeEndUs = 0);
    bool Pump(OH_AVMuxer *muxer, int32_t muxTrack, bool &advanced);
    bool Ready() const { return ready_; }
    bool Done() const { return outputDone_; }
    OH_AVFormat *OutputFormat() const;
    int64_t Bytes() const { return bytes_; }
    int64_t PositionUs() const { return positionUs_; }
    static int64_t TargetBitrate();

private:
    bool ReadSourceFormat(OH_AVFormat *source, const char *&mime);
    bool ConfigureFormats(OH_AVFormat *source, OH_AVFormat *encoded);
    bool PrepareCodecs();
    bool StartCodecs();
    bool Check(int32_t result, const char *operation);
    bool Feed(bool &advanced);
    bool Decode(bool &advanced);
    bool Encode(bool &advanced);
    bool Drain(OH_AVMuxer *muxer, int32_t muxTrack, bool &advanced);
    bool ValidatePcm();
    bool TrimPcm();
    Error error_;
    OH_AVDemuxer *demuxer_ = nullptr;
    int32_t track_ = -1;
    OH_AVCodec *decoder_ = nullptr;
    OH_AVCodec *encoder_ = nullptr;
    OH_AVBuffer *pcm_ = nullptr;
    uint32_t pcmIndex_ = 0;
    OH_AVCodecBufferAttr pcmAttr_ {};
    int32_t pcmConsumed_ = 0;
    std::vector<uint8_t> frame_;
    int64_t framePts_ = 0;
    int32_t channels_ = 0;
    int32_t sampleRate_ = 0;
    bool decoderStarted_ = false;
    bool encoderStarted_ = false;
    bool inputDone_ = false;
    bool decodedDone_ = false;
    bool pcmValidated_ = false;
    bool sentEos_ = false;
    bool ready_ = false;
    bool outputDone_ = false;
    int64_t bytes_ = 0;
    int64_t positionUs_ = 0;
    int64_t rangeStartUs_ = 0;
    int64_t rangeEndUs_ = 0;
    OH_AVBuffer *pendingOutput_ = nullptr;
    uint32_t pendingOutputIndex_ = 0;
};
#endif
