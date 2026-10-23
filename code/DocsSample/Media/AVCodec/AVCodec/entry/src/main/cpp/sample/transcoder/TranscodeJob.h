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

#ifndef AVCODEC_TRANSCODE_JOB_H
#define AVCODEC_TRANSCODE_JOB_H

#include <atomic>
#include <chrono>
#include <memory>
#include <mutex>
#include <string>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_avcodec_videoencoder.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <multimedia/player_framework/native_avmuxer.h>
#include <multimedia/player_framework/native_avsource.h>
#include "TranscodeFrameProcessor.h"

struct TranscodeOptions {
    int32_t inputFd = -1;
    int32_t outputFd = -1;
    std::string mime = "video/avc";
    int64_t bitrate = 8000000;
    int32_t longEdge = 0;
    bool surface = false;
    bool grayscale = false;
    bool keepAudio = true;
};

struct TranscodeSnapshot {
    int32_t state = 1;
    std::string stage = "prepare";
    std::string detail;
    int32_t errorCode = 0;
    double progress = 0;
    int64_t frames = 0;
    int64_t bytes = 0;
    int32_t outputWidth = 0;
    int32_t outputHeight = 0;
    bool audioCopied = false;
};

class TranscodeJob {
public:
    explicit TranscodeJob(TranscodeOptions options);
    ~TranscodeJob();
    void Run();
    void Cancel() { cancelled_.store(true); }
    TranscodeSnapshot Snapshot() const;

private:
    using Format = std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)>;
    bool OpenSource();
    bool ConfigureCodecs();
    bool StartMuxer();
    bool FeedDecoder(bool &advanced);
    bool DrainDecoder(bool &advanced);
    bool SubmitDecodedFrame(bool &advanced);
    bool DrainEncoder(bool &advanced);
    bool CopyAudio(bool &advanced);
    bool ReadLayout(OH_AVFormat *format, TranscodeFrames::Layout &layout);
    bool Check(int32_t result, const char *operation);
    bool Fail(const char *operation, int32_t result = -1);
    void Cleanup();

    TranscodeOptions options_;
    mutable std::mutex snapshotMutex_;
    TranscodeSnapshot snapshot_;
    std::atomic<bool> cancelled_ { false };
    OH_AVSource *source_ = nullptr;
    OH_AVDemuxer *demuxer_ = nullptr;
    OH_AVCodec *decoder_ = nullptr;
    OH_AVCodec *encoder_ = nullptr;
    OH_AVMuxer *muxer_ = nullptr;
    OHNativeWindow *encoderWindow_ = nullptr;
    OH_AVBuffer *audioBuffer_ = nullptr;
    Format videoFormat_ { nullptr, OH_AVFormat_Destroy };
    Format audioFormat_ { nullptr, OH_AVFormat_Destroy };
    int32_t videoTrack_ = -1;
    int32_t audioTrack_ = -1;
    int32_t muxVideoTrack_ = -1;
    int32_t muxAudioTrack_ = -1;
    int64_t durationUs_ = 0;
    int64_t videoPositionUs_ = 0;
    int64_t audioPositionUs_ = 0;
    int32_t sourceWidth_ = 0;
    int32_t sourceHeight_ = 0;
    int32_t targetWidth_ = 0;
    int32_t targetHeight_ = 0;
    int32_t rotation_ = 0;
    double frameRate_ = 30;
    bool decoderInputDone_ = false;
    bool decoderOutputDone_ = false;
    bool encoderOutputDone_ = false;
    bool encoderEosSent_ = false;
    bool audioDone_ = true;
    bool muxStarted_ = false;
    bool decoderStarted_ = false;
    bool encoderStarted_ = false;
    // 只借用 codec 输出。等待编码器空闲输入时暂存一帧，限制内存和缓冲积压。
    OH_AVBuffer *pendingDecoded_ = nullptr;
    uint32_t pendingDecodedIndex_ = 0;
    OH_AVCodecBufferAttr pendingDecodedAttr_ {};
    TranscodeFrames::Layout decodedLayout_;
    TranscodeFrames::Layout encodedLayout_;
};
#endif
