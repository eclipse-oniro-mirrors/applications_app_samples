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

#include "Player.h"

#include <chrono>
#include <fstream>

#include "HdrMetadataHelper.h"
#include "av_codec_sample_log.h"
#include "dfx/error/av_codec_sample_error.h"

#undef LOG_TAG
#define LOG_TAG "samplePlayer"

namespace {
constexpr int8_t YUV420_SAMPLE_RATIO = 2;
constexpr int32_t RGBA_BYTES_PER_PIXEL = 4;
using namespace std::string_literals;

std::string ToString(OH_AVPixelFormat pixelFormat)
{
    std::string ret;
    auto iter = PIXEL_FORMAT_TO_STRING.find(pixelFormat);
    if (iter != PIXEL_FORMAT_TO_STRING.end()) {
        ret = PIXEL_FORMAT_TO_STRING.at(pixelFormat);
    }
    return ret;
}

uint8_t *GetBufferDataAddr(CodecBufferInfo &bufferInfo)
{
    uint8_t *bufferAddr = OH_AVBuffer_GetAddr(bufferInfo.buffer);
    if (bufferAddr == nullptr) {
        return nullptr;
    }
    if (bufferInfo.attr.offset < 0) {
        AVCODEC_SAMPLE_LOGE("Invalid buffer offset: %{public}d", bufferInfo.attr.offset);
        return nullptr;
    }
    return bufferAddr + bufferInfo.attr.offset;
}
} // namespace

void Player::DumpOutput(CodecBufferInfo &bufferInfo)
{
    auto &info = sampleInfo_;
    if (info.codec.codecRunMode != BUFFER || !info.output.enableVideoDump) {
        return;
    }
    if (outputFile_ == nullptr) {
        auto time = std::chrono::system_clock::to_time_t(std::chrono::system_clock::now());
        if (info.output.outputFilePath.empty()) {
            info.output.outputFilePath = "/data/storage/el2/base/haps/entry/files/VideoDecoderOut_"s +
                ToString(info.video.pixelFormat) + "_" + std::to_string(info.video.videoWidth) + "_" +
                std::to_string(info.video.videoHeight) + "_" + std::to_string(time) + ".yuv";
        }
        outputFile_ = std::make_unique<std::ofstream>(info.output.outputFilePath, std::ios::out | std::ios::trunc);
        if (!outputFile_->is_open()) {
            outputFile_ = nullptr;
            AVCODEC_SAMPLE_LOGE("Output file open failed");
            return;
        }
    }

    uint8_t *bufferAddr = GetBufferDataAddr(bufferInfo);
    CHECK_AND_RETURN_LOG(bufferAddr != nullptr, "Buffer is nullptr");
    switch (info.video.pixelFormat) {
        case AV_PIXEL_FORMAT_YUVI420:
            WriteOutputFileWithStrideYUV420P(bufferAddr);
            break;
        case AV_PIXEL_FORMAT_NV12:
        case AV_PIXEL_FORMAT_NV21:
            WriteOutputFileWithStrideYUV420SP(bufferAddr);
            break;
        case AV_PIXEL_FORMAT_RGBA1010102:
        case AV_PIXEL_FORMAT_RGBA:
            WriteOutputFileWithStrideRGBA(bufferAddr);
            break;
        default:
            AVCODEC_SAMPLE_LOGE("Unsupported pixel format, skip");
            break;
    }
}

bool Player::PresentAndReleaseVideoBuffer(CodecBufferInfo& bufferInfo, bool render, int64_t renderTimestamp)
{
    videoOutputFrames_.fetch_add(1);
    if (render) {
        videoRenderedFrames_.fetch_add(1);
    } else {
        videoDroppedFrames_.fetch_add(1);
    }
    if (sampleInfo_.codec.codecRunMode == BUFFER && !hdrVividConfirmed_.load() &&
        HdrMetadataHelper::IsHdrVivid(bufferInfo.buffer)) {
        hdrVividConfirmed_.store(true);
        AVCODEC_SAMPLE_LOGI("HDR Vivid confirmed from decoded bitstream metadata");
    }
    DumpOutput(bufferInfo);

    CHECK_AND_RETURN_RET_LOG(videoDecContext_ != nullptr, false, "Video decode context is null");
    if (videoSink_ == nullptr) {
        videoSink_ = sampleInfo_.codec.codecRunMode == BUFFER ?
            std::unique_ptr<VideoSink>(std::make_unique<BufferVideoSink>()) :
            std::unique_ptr<VideoSink>(std::make_unique<SurfaceVideoSink>());
    }
    VideoPresentRequest request { *videoDecoder_, bufferInfo, sampleInfo_, *videoDecContext_, render, renderTimestamp };
    const bool measureBufferPresent = sampleInfo_.codec.codecRunMode == BUFFER && render;
    const auto presentStart = measureBufferPresent ? std::chrono::steady_clock::now() :
        std::chrono::steady_clock::time_point {};
    const int32_t ret = videoSink_->Present(request);
    if (measureBufferPresent) {
        const auto presentEnd = std::chrono::steady_clock::now();
        const uint64_t durationNs = static_cast<uint64_t>(std::chrono::duration_cast<std::chrono::nanoseconds>(
            presentEnd - presentStart).count());
        bufferPresentFrames_.fetch_add(1);
        bufferPresentDurationNs_.fetch_add(durationNs);
        if (ret != AVCODEC_SAMPLE_ERR_OK) {
            bufferPresentFailures_.fetch_add(1);
        }
    }
    if (ret != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Present video output failed: %{public}d", ret);
        playbackFailed_ = true;
        isStarted_ = false;
        return false;
    }
    hasDecodedOutput_ = true;
    if (render && !hasAudioTrack_.load()) {
        playbackPositionUs_.store(bufferInfo.attr.pts);
    }
    return true;
}

void Player::WriteOutputFileWithStrideYUV420P(uint8_t *bufferAddr)
{
    CHECK_AND_RETURN_LOG(bufferAddr != nullptr, "Buffer is nullptr");
    const auto &info = sampleInfo_;
    const int32_t videoWidth = videoDecContext_->width *
        ((info.video.videoCodecMime == OH_AVCODEC_MIMETYPE_VIDEO_HEVC &&
            info.video.hevcProfile == HEVC_PROFILE_MAIN_10) ? 2 : 1);
    const int32_t stride = videoDecContext_->widthStride;
    const int32_t uvWidth = videoWidth / YUV420_SAMPLE_RATIO;
    const int32_t uvStride = stride / YUV420_SAMPLE_RATIO;
    for (int32_t row = 0; row < videoDecContext_->height; row++) {
        outputFile_->write(reinterpret_cast<char *>(bufferAddr), videoWidth);
        bufferAddr += stride;
    }
    bufferAddr += (videoDecContext_->heightStride - videoDecContext_->height) * stride;
    for (int32_t row = 0; row < videoDecContext_->height / YUV420_SAMPLE_RATIO; row++) {
        outputFile_->write(reinterpret_cast<char *>(bufferAddr), uvWidth);
        bufferAddr += uvStride;
    }
    bufferAddr += (videoDecContext_->heightStride - videoDecContext_->height) / YUV420_SAMPLE_RATIO * uvStride;
    for (int32_t row = 0; row < videoDecContext_->height / YUV420_SAMPLE_RATIO; row++) {
        outputFile_->write(reinterpret_cast<char *>(bufferAddr), uvWidth);
        bufferAddr += uvStride;
    }
}

void Player::WriteOutputFileWithStrideYUV420SP(uint8_t *bufferAddr)
{
    CHECK_AND_RETURN_LOG(bufferAddr != nullptr, "Buffer is nullptr");
    const auto &info = sampleInfo_;
    const int32_t videoWidth = videoDecContext_->width *
        ((info.video.videoCodecMime == OH_AVCODEC_MIMETYPE_VIDEO_HEVC &&
            info.video.hevcProfile == HEVC_PROFILE_MAIN_10) ? 2 : 1);
    const int32_t stride = videoDecContext_->widthStride;
    for (int32_t row = 0; row < videoDecContext_->height; row++) {
        outputFile_->write(reinterpret_cast<char *>(bufferAddr), videoWidth);
        bufferAddr += stride;
    }
    bufferAddr += (videoDecContext_->heightStride - videoDecContext_->height) * stride;
    for (int32_t row = 0; row < videoDecContext_->height / YUV420_SAMPLE_RATIO; row++) {
        outputFile_->write(reinterpret_cast<char *>(bufferAddr), videoWidth);
        bufferAddr += videoWidth;
    }
}

void Player::WriteOutputFileWithStrideRGBA(uint8_t *bufferAddr)
{
    CHECK_AND_RETURN_LOG(bufferAddr != nullptr, "Buffer is nullptr");
    const int32_t width = videoDecContext_->width;
    const int32_t stride = videoDecContext_->widthStride;
    for (int32_t row = 0; row < videoDecContext_->heightStride; row++) {
        outputFile_->write(reinterpret_cast<char *>(bufferAddr), width * RGBA_BYTES_PER_PIXEL);
        bufferAddr += stride;
    }
}
