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
#include <multimedia/player_framework/native_avcapability.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <multimedia/player_framework/native_avmuxer.h>
#include <multimedia/player_framework/native_avsource.h>
#include "TranscodeFrameProcessor.h"
#include "TranscodeDiagnostics.h"
#include "TranscodeAudioPipeline.h"

struct TranscodeOptions {
    int32_t inputFd = -1;
    int32_t outputFd = -1;
    std::string mime = "video/avc";
    int64_t bitrate = 8000000;
    int32_t longEdge = 0;
    bool surface = false;
    bool grayscale = false;
    int32_t resizeMode = 0;
    int32_t encoderCategory = 0;
    int32_t audioMode = 0;
    int32_t audioTrack = 0;
    int64_t startTimeMs = 0;
    int64_t endTimeMs = 0;
    bool inspectOnly = false;
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
    double elapsedMs = 0;
    double firstFrameMs = -1;
    double fps = 0;
    double speed = 0;
    double remainingSeconds = -1;
    double decoderWaitMs = 0;
    double encoderInputWaitMs = 0;
    double encoderOutputWaitMs = 0;
    int64_t copiedBytes = 0;
    int64_t fileBytes = 0;
    std::vector<TranscodeMetrics::Measurement> diagnostics;
    std::string decoderName;
    std::string encoderName;
    int64_t availableBytes = -1;
    int64_t estimatedBytes = -1;
    int32_t sourceWidth = 0;
    int32_t sourceHeight = 0;
    int64_t durationUs = 0;
    double sourceFrameRate = 0;
    std::string sourceMime;
    std::vector<std::string> audioTracks;
    std::vector<int32_t> audioTrackIds;
    int64_t minBitrate = 0;
    int64_t maxBitrate = 0;
    int64_t audioBytes = 0;
    int32_t audioMode = 0;
    int64_t outputDurationUs = 0;
    std::string outputValidation;
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
    bool ReadTracks(int32_t trackCount);
    bool ValidateSourceColor();
    bool ConnectSurface();
    bool SubmitSurfaceFrame(bool eos, bool &advanced);
    bool ProcessBufferFrame(OH_AVBuffer *input, OH_AVCodecBufferAttr &attr);
    bool OpenSource();
    bool ReadSourceMetadata();
    bool ReadVideoProperties();
    bool ValidateSelectedAudioTrack();
    void UpdateVideoProgress(const OH_AVCodecBufferAttr &attr);
    bool InitializeDemuxer();
    bool ConfigureCodecs();
    bool ConfigureEncoderFormat();
    bool StartCodecs();
    bool CheckStorage(bool initial);
    bool ValidateEncoder(OH_AVCapability *capability);
    bool InspectCodecs();
    bool InspectAudio();
    bool StartMuxer();
    bool FeedDecoder(bool &advanced);
    bool DrainDecoder(bool &advanced);
    bool SubmitDecodedFrame(bool &advanced);
    bool SubmitBufferFrame(bool eos, bool sendEmptyEos, bool &advanced);
    bool DrainEncoder(bool &advanced);
    bool CopyAudio(bool &advanced);
    bool ReadLayout(OH_AVFormat *format, TranscodeFrames::Layout &layout);
    bool Check(int32_t result, const char *operation);
    bool Fail(const char *operation, int32_t result = -1);
    bool FinalizeOutput();
    bool ValidateOutput();
    bool ValidateOutputTrack(OH_AVFormat *format, int32_t type);
    bool ConfigureTimeRange();
    bool DiscardOutsideRange(bool &advanced);
    void Complete(bool success);
    void Cleanup();
    void PublishDiagnostics();

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
    int64_t rangeStartUs_ = 0;
    int64_t rangeEndUs_ = 0;
    int64_t selectedDurationUs_ = 0;
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
    bool layoutsValid_ = false;
    TranscodeMetrics::Diagnostics diagnostics_;
    TranscodeMetrics::Clock::time_point startedAt_ {};
    TranscodeMetrics::Clock::time_point publishedAt_ {};
    TranscodeMetrics::Clock::time_point storageCheckedAt_ {};
    std::unique_ptr<TranscodeAudioPipeline> audioPipeline_;
};
#endif
