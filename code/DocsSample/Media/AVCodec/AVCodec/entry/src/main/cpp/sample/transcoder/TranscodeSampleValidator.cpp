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

#include "TranscodeSampleValidator.h"
#include <chrono>
#include <memory>
#include <sys/stat.h>
#include <thread>
#include <utility>
#include <multimedia/player_framework/native_avsource.h>
#include <multimedia/player_framework/native_avdemuxer.h>
#include <multimedia/player_framework/native_avcodec_videodecoder.h>
#include <multimedia/player_framework/native_averrors.h>

namespace {
constexpr int64_t US_PER_MS = 1000;
constexpr int64_t SAMPLE_PTS_TOLERANCE_US = 2000000;
constexpr auto SAMPLE_DECODE_TIMEOUT = std::chrono::seconds(10);
constexpr auto SAMPLE_IDLE_WAIT = std::chrono::milliseconds(1);

class OutputSampleDecoder {
public:
    OutputSampleDecoder(int64_t targetUs, int64_t durationUs, const std::atomic<bool> &cancelled, std::string &failure)
        : targetUs_(targetUs), durationUs_(durationUs), cancelled_(cancelled), failure_(failure)
    {
    }
    ~OutputSampleDecoder();
    bool Initialize(int32_t outputFd, int32_t videoTrack);
    bool Decode();

private:
    bool Configure(const char *mime);
    bool FeedInput(bool &progressed);
    bool DrainOutput(bool &progressed);
    bool ValidatePts(const OH_AVCodecBufferAttr &attr);
    bool CheckResult(std::chrono::steady_clock::time_point deadline);
    bool Fail(std::string reason);

    std::unique_ptr<OH_AVSource, decltype(&OH_AVSource_Destroy)> source_{nullptr, OH_AVSource_Destroy};
    std::unique_ptr<OH_AVFormat, decltype(&OH_AVFormat_Destroy)> format_{nullptr, OH_AVFormat_Destroy};
    std::unique_ptr<OH_AVDemuxer, decltype(&OH_AVDemuxer_Destroy)> demuxer_{nullptr, OH_AVDemuxer_Destroy};
    std::unique_ptr<OH_AVCodec, decltype(&OH_VideoDecoder_Destroy)> decoder_{nullptr, OH_VideoDecoder_Destroy};
    int32_t videoTrack_ = -1;
    int64_t targetUs_ = 0;
    int64_t durationUs_ = 0;
    const std::atomic<bool> &cancelled_;
    std::string &failure_;
    bool started_ = false;
    bool inputEos_ = false;
    bool outputEos_ = false;
    bool reachedTarget_ = false;
    int64_t lastPts_ = -1;
};

OutputSampleDecoder::~OutputSampleDecoder()
{
    // 先停止，再按decoder、demuxer、format、source的顺序销毁，覆盖失败和取消出口。
    if (started_) {
        (void)OH_VideoDecoder_Stop(decoder_.get());
    }
}

bool OutputSampleDecoder::Fail(std::string reason)
{
    failure_ = std::move(reason);
    return false;
}

bool OutputSampleDecoder::Initialize(int32_t outputFd, int32_t videoTrack)
{
    struct stat file {
    };
    if (fstat(outputFd, &file) != 0 || file.st_size <= 0) {
        return Fail("output file unavailable");
    }
    source_.reset(OH_AVSource_CreateWithFD(outputFd, 0, file.st_size));
    if (source_ == nullptr) {
        return Fail("reopen output");
    }
    videoTrack_ = videoTrack;
    format_.reset(OH_AVSource_GetTrackFormat(source_.get(), videoTrack));
    const char *mime = nullptr;
    if (format_ == nullptr || !OH_AVFormat_GetStringValue(format_.get(), OH_MD_KEY_CODEC_MIME, &mime) ||
        mime == nullptr) {
        return Fail("read video format");
    }
    demuxer_.reset(OH_AVDemuxer_CreateWithSource(source_.get()));
    if (!Configure(mime)) {
        return false;
    }
    if (targetUs_ > 0 &&
        OH_AVDemuxer_SeekToTime(demuxer_.get(), targetUs_ / US_PER_MS, SEEK_MODE_PREVIOUS_SYNC) != AV_ERR_OK) {
        return Fail("seek to sample time");
    }
    return true;
}

bool OutputSampleDecoder::Configure(const char *mime)
{
    decoder_.reset(OH_VideoDecoder_CreateByMime(mime));
    if (demuxer_ == nullptr || decoder_ == nullptr ||
        OH_AVDemuxer_SelectTrackByID(demuxer_.get(), videoTrack_) != AV_ERR_OK ||
        !OH_AVFormat_SetIntValue(format_.get(), OH_MD_KEY_ENABLE_SYNC_MODE, 1) ||
        !OH_AVFormat_SetIntValue(format_.get(), OH_MD_KEY_PIXEL_FORMAT, AV_PIXEL_FORMAT_NV12) ||
        !OH_AVFormat_SetIntValue(format_.get(), OH_MD_KEY_ROTATION, 0) ||
        OH_VideoDecoder_Configure(decoder_.get(), format_.get()) != AV_ERR_OK ||
        OH_VideoDecoder_Prepare(decoder_.get()) != AV_ERR_OK || OH_VideoDecoder_Start(decoder_.get()) != AV_ERR_OK) {
        return Fail("initialize synchronous decoder");
    }
    started_ = true;
    return true;
}

bool OutputSampleDecoder::FeedInput(bool &progressed)
{
    if (inputEos_) {
        return true;
    }
    uint32_t index = 0;
    const int32_t query = OH_VideoDecoder_QueryInputBuffer(decoder_.get(), &index, 0);
    if (query == AV_ERR_TRY_AGAIN_LATER) {
        return true;
    }
    if (query != AV_ERR_OK) {
        return Fail("query decoder input");
    }
    OH_AVBuffer *buffer = OH_VideoDecoder_GetInputBuffer(decoder_.get(), index);
    OH_AVCodecBufferAttr attr{};
    if (buffer == nullptr || OH_AVDemuxer_ReadSampleBuffer(demuxer_.get(), videoTrack_, buffer) != AV_ERR_OK ||
        OH_AVBuffer_GetBufferAttr(buffer, &attr) != AV_ERR_OK ||
        OH_VideoDecoder_PushInputBuffer(decoder_.get(), index) != AV_ERR_OK) {
        return Fail("feed compressed sample");
    }
    inputEos_ = (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    progressed = true;
    return true;
}

bool OutputSampleDecoder::ValidatePts(const OH_AVCodecBufferAttr &attr)
{
    if (attr.size <= 0) {
        return true;
    }
    if (attr.pts < 0 || attr.pts > durationUs_ + SAMPLE_PTS_TOLERANCE_US || (lastPts_ >= 0 && attr.pts < lastPts_)) {
        return Fail("decoded PTS is out of range or regresses: currentUs=" + std::to_string(attr.pts) +
                    " previousUs=" + std::to_string(lastPts_) + " durationUs=" + std::to_string(durationUs_));
    }
    lastPts_ = attr.pts;
    reachedTarget_ = reachedTarget_ || attr.pts >= targetUs_;
    return true;
}

bool OutputSampleDecoder::DrainOutput(bool &progressed)
{
    uint32_t index = 0;
    const int32_t query = OH_VideoDecoder_QueryOutputBuffer(decoder_.get(), &index, 0);
    if (query == AV_ERR_TRY_AGAIN_LATER || query == AV_ERR_STREAM_CHANGED) {
        return true;
    }
    if (query != AV_ERR_OK) {
        return Fail("query decoder output");
    }
    OH_AVBuffer *buffer = OH_VideoDecoder_GetOutputBuffer(decoder_.get(), index);
    OH_AVCodecBufferAttr attr{};
    if (buffer == nullptr || OH_AVBuffer_GetBufferAttr(buffer, &attr) != AV_ERR_OK) {
        return Fail("read decoded sample");
    }
    const bool valid = ValidatePts(attr);
    outputEos_ = (attr.flags & AVCODEC_BUFFER_FLAGS_EOS) != 0;
    const int32_t freeRet = OH_VideoDecoder_FreeOutputBuffer(decoder_.get(), index);
    if (!valid) {
        return false;
    }
    if (freeRet != AV_ERR_OK) {
        return Fail("return decoded output");
    }
    progressed = true;
    return true;
}

bool OutputSampleDecoder::CheckResult(std::chrono::steady_clock::time_point deadline)
{
    if (cancelled_.load()) {
        return Fail("cancelled");
    }
    if (!reachedTarget_ && !outputEos_ && std::chrono::steady_clock::now() >= deadline) {
        return Fail("decode timeout");
    }
    if (!reachedTarget_) {
        return Fail("no decoded frame reached target PTS; targetUs=" + std::to_string(targetUs_) +
                    " lastDecodedPtsUs=" + std::to_string(lastPts_));
    }
    return true;
}

bool OutputSampleDecoder::Decode()
{
    const auto deadline = std::chrono::steady_clock::now() + SAMPLE_DECODE_TIMEOUT;
    while (!cancelled_.load() && !reachedTarget_ && !outputEos_ && std::chrono::steady_clock::now() < deadline) {
        bool progressed = false;
        if (!FeedInput(progressed) || !DrainOutput(progressed)) {
            return false;
        }
        if (!progressed) {
            std::this_thread::sleep_for(SAMPLE_IDLE_WAIT);
        }
    }
    return CheckResult(deadline);
}
} // namespace

bool ValidateTranscodeOutputSample(int32_t outputFd, int32_t videoTrack, int64_t targetUs, int64_t durationUs,
                                   const std::atomic<bool> &cancelled, std::string &failure)
{
    OutputSampleDecoder decoder(targetUs, durationUs, cancelled, failure);
    return decoder.Initialize(outputFd, videoTrack) && decoder.Decode();
}
