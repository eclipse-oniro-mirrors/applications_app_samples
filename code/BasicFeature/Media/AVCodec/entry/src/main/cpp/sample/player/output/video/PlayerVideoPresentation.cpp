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

#include "gpu/OpenGLVideoSink.h"
#include "gpu/VulkanVideoSink.h"
#include "renderer/HdrMetadataHelper.h"
#include "av_codec_sample_log.h"
#include "dfx/error/av_codec_sample_error.h"
#include "plugin_manager.h"

#undef LOG_TAG
#define LOG_TAG "samplePlayer"

namespace {
constexpr int8_t YUV420_SAMPLE_RATIO = 2;
constexpr int32_t RGBA_BYTES_PER_PIXEL = 4;
constexpr int32_t TEN_BIT_OUTPUT_BYTES_PER_COMPONENT = 2;
constexpr uint64_t HDR_VIVID_SURFACE_PROBE_INITIAL_FRAME = 4;
constexpr uint64_t HDR_VIVID_SURFACE_PROBE_INTERVAL = 30;
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

bool IsTenBitOutput(const SampleInfo &sampleInfo, const CodecUserData *videoDecContext);

bool HasBufferCapacity(const CodecBufferInfo &bufferInfo, uint64_t requiredBytes)
{
    if (bufferInfo.buffer == nullptr || bufferInfo.attr.offset < 0) {
        return false;
    }
    const int32_t capacity = OH_AVBuffer_GetCapacity(bufferInfo.buffer);
    if (capacity < 0) {
        AVCODEC_SAMPLE_LOGE("Invalid buffer capacity: %{public}d", capacity);
        return false;
    }
    const uint64_t offset = static_cast<uint64_t>(bufferInfo.attr.offset);
    return offset <= static_cast<uint64_t>(capacity) &&
        requiredBytes <= static_cast<uint64_t>(capacity) - offset;
}

bool GetDumpByteCount(const SampleInfo &sampleInfo, const CodecUserData *videoDecContext,
    OH_AVPixelFormat pixelFormat, uint64_t &byteCount)
{
    if (videoDecContext == nullptr || videoDecContext->width <= 0 || videoDecContext->height <= 0 ||
        videoDecContext->widthStride <= 0 || videoDecContext->heightStride < videoDecContext->height) {
        return false;
    }
    const uint64_t height = static_cast<uint64_t>(videoDecContext->height);
    const uint64_t heightStride = static_cast<uint64_t>(videoDecContext->heightStride);
    const uint64_t stride = static_cast<uint64_t>(videoDecContext->widthStride);
    const uint64_t width = static_cast<uint64_t>(videoDecContext->width) *
        (IsTenBitOutput(sampleInfo, videoDecContext) ? TEN_BIT_OUTPUT_BYTES_PER_COMPONENT : 1);
    if (width > stride) {
        return false;
    }
    switch (pixelFormat) {
        case AV_PIXEL_FORMAT_YUVI420:
            if (height % YUV420_SAMPLE_RATIO != 0 || heightStride % YUV420_SAMPLE_RATIO != 0 ||
                stride % YUV420_SAMPLE_RATIO != 0) {
                return false;
            }
            byteCount = heightStride * stride + heightStride * stride / YUV420_SAMPLE_RATIO;
            return true;
        case AV_PIXEL_FORMAT_NV12:
        case AV_PIXEL_FORMAT_NV21:
            if (height % YUV420_SAMPLE_RATIO != 0) {
                return false;
            }
            byteCount = heightStride * stride + height * width / YUV420_SAMPLE_RATIO;
            return true;
        case AV_PIXEL_FORMAT_RGBA1010102:
        case AV_PIXEL_FORMAT_RGBA:
            if (width * RGBA_BYTES_PER_PIXEL > stride) {
                return false;
            }
            byteCount = heightStride * stride;
            return true;
        default:
            return false;
    }
}

uint8_t *GetBufferDataAddr(CodecBufferInfo &bufferInfo, uint64_t requiredBytes)
{
    if (!HasBufferCapacity(bufferInfo, requiredBytes)) {
        AVCODEC_SAMPLE_LOGE("Buffer range is invalid, offset: %{public}d", bufferInfo.attr.offset);
        return nullptr;
    }
    uint8_t *bufferAddr = OH_AVBuffer_GetAddr(bufferInfo.buffer);
    CHECK_AND_RETURN_RET_LOG(bufferAddr != nullptr, nullptr, "Buffer address is null");
    return bufferAddr + bufferInfo.attr.offset;
}

OH_AVPixelFormat GetOutputPixelFormat(const SampleInfo &sampleInfo, const CodecUserData *videoDecContext)
{
    return videoDecContext == nullptr ? sampleInfo.video.pixelFormat : videoDecContext->outputPixelFormat;
}

bool IsTenBitOutput(const SampleInfo &sampleInfo, const CodecUserData *videoDecContext)
{
    if (videoDecContext != nullptr && videoDecContext->outputPixelFormat == AV_PIXEL_FORMAT_RGBA1010102) {
        return true;
    }
    return IsTenBitHevcOutput(sampleInfo.video);
}

bool ShouldProbeHdrVividSurface(uint64_t outputFrameCount)
{
    return outputFrameCount == HDR_VIVID_SURFACE_PROBE_INITIAL_FRAME ||
        (outputFrameCount > HDR_VIVID_SURFACE_PROBE_INITIAL_FRAME &&
            outputFrameCount % HDR_VIVID_SURFACE_PROBE_INTERVAL == 0);
}
} // 匿名命名空间

void Player::DumpOutput(CodecBufferInfo &bufferInfo)
{
    auto &info = sampleInfo_;
    const bool usesSurfaceDecoder = videoSink_ != nullptr && videoSink_->UsesSurfaceDecoder();
    if (!IsBufferBasedRunMode(info.codec.codecRunMode) || usesSurfaceDecoder || !info.output.enableVideoDump) {
        return;
    }
    // [Start decoder_outputFile]
    const OH_AVPixelFormat pixelFormat = GetOutputPixelFormat(info, videoDecContext_.get());
    if (outputFile_ == nullptr) {
        auto time = std::chrono::system_clock::to_time_t(std::chrono::system_clock::now());
        if (info.output.outputFilePath.empty()) {
            info.output.outputFilePath = "/data/storage/el2/base/haps/entry/files/VideoDecoderOut_"s +
                ToString(pixelFormat) + "_" + std::to_string(info.video.videoWidth) + "_" +
                std::to_string(info.video.videoHeight) + "_" + std::to_string(time) + ".yuv";
        }
        outputFile_ = std::make_unique<std::ofstream>(info.output.outputFilePath, std::ios::out | std::ios::trunc);
        if (!outputFile_->is_open()) {
            outputFile_ = nullptr;
            AVCODEC_SAMPLE_LOGE("Output file open failed");
            return;
        }
    }
    // [End decoder_outputFile]

    uint64_t dumpByteCount = 0;
    CHECK_AND_RETURN_LOG(GetDumpByteCount(info, videoDecContext_.get(), pixelFormat, dumpByteCount),
        "Invalid video output layout");
    uint8_t *bufferAddr = GetBufferDataAddr(bufferInfo, dumpByteCount);
    CHECK_AND_RETURN_LOG(bufferAddr != nullptr, "Buffer is nullptr");
    switch (pixelFormat) {
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
    const uint64_t outputFrameCount = videoOutputFrames_.fetch_add(1) + 1;
    if (!render) {
        videoDroppedFrames_.fetch_add(1);
    }
    ConfirmHdrVividFromBuffer(bufferInfo);
    DumpOutput(bufferInfo);
    if (videoDecContext_ == nullptr) {
        if (videoDecoder_ != nullptr && bufferInfo.buffer != nullptr &&
            videoDecoder_->FreeOutputBuffer(bufferInfo.bufferIndex, false) != AVCODEC_SAMPLE_ERR_OK) {
            AVCODEC_SAMPLE_LOGW("Free video output buffer failed before presentation");
        }
        AVCODEC_SAMPLE_LOGE("Video decode context is null");
        return false;
    }
    if (!EnsureVideoSink()) {
        if (videoDecoder_ != nullptr && bufferInfo.buffer != nullptr &&
            videoDecoder_->FreeOutputBuffer(bufferInfo.bufferIndex, false) != AVCODEC_SAMPLE_ERR_OK) {
            AVCODEC_SAMPLE_LOGW("Free video output buffer failed before presentation");
        }
        AVCODEC_SAMPLE_LOGE("Video sink initialization failed");
        return false;
    }
    const VideoPresentRequest request { *videoDecoder_, bufferInfo, sampleInfo_, *videoDecContext_, render,
        renderTimestamp };
    const bool measureBufferPresent = IsBufferBasedRunMode(sampleInfo_.codec.codecRunMode) && render;
    const int32_t result = PresentVideoBuffer(request, measureBufferPresent);
    if (result != AVCODEC_SAMPLE_ERR_OK) {
        AVCODEC_SAMPLE_LOGE("Present video output failed: %{public}d", result);
        playbackFailed_ = true;
        isStarted_ = false;
        return false;
    }
    ProbeHdrVividFromSurface(render, outputFrameCount);
    hasDecodedOutput_ = true;
    if (render) {
        videoRenderedFrames_.fetch_add(1);
        diagnostics_.RecordSeekOutput();
    }
    if (render && !hasAudioTrack_.load()) {
        playbackPositionUs_.store(bufferInfo.attr.pts);
    }
    return true;
}

void Player::ConfirmHdrVividFromBuffer(const CodecBufferInfo &bufferInfo)
{
    // 容器声明不能证明码流确为 HDR Vivid。仅以解码后 Buffer 的元数据为准；
    // 直连 Surface 输出则在下方帧已送达 XComponent 后再检查。
    if (!hdrVividConfirmed_.load() && HdrMetadataHelper::IsHdrVivid(bufferInfo.buffer)) {
        hdrVividConfirmed_.store(true);
        AVCODEC_SAMPLE_LOGI("HDR Vivid confirmed from decoded bitstream metadata");
    }
}

bool Player::EnsureVideoSink()
{
    if (videoSink_ != nullptr && videoSinkRunMode_ != sampleInfo_.codec.codecRunMode) {
        videoSink_->Reset();
        videoSink_.reset();
    }
    if (videoSink_ == nullptr) {
        switch (sampleInfo_.codec.codecRunMode) {
            case OPENGL:
                videoSink_ = std::make_unique<OpenGLVideoSink>();
                break;
            case VULKAN:
                videoSink_ = std::make_unique<VulkanVideoSink>();
                break;
            case BUFFER:
                videoSink_ = std::make_unique<BufferVideoSink>();
                break;
            case SURFACE:
            default:
                videoSink_ = std::make_unique<SurfaceVideoSink>();
                break;
        }
        videoSinkRunMode_ = sampleInfo_.codec.codecRunMode;
    }
    return videoSink_ != nullptr;
}

int32_t Player::PresentVideoBuffer(const VideoPresentRequest &request, bool measureBufferPresent)
{
    const auto presentStart = measureBufferPresent ? std::chrono::steady_clock::now() :
        std::chrono::steady_clock::time_point {};
    const int32_t result = videoSink_->Present(request);
    if (measureBufferPresent) {
        RecordBufferPresentResult(result, presentStart);
    }
    return result;
}

void Player::RecordBufferPresentResult(int32_t result, std::chrono::steady_clock::time_point presentStart)
{
    const auto presentEnd = std::chrono::steady_clock::now();
    const uint64_t durationNs = static_cast<uint64_t>(std::chrono::duration_cast<std::chrono::nanoseconds>(
        presentEnd - presentStart).count());
    bufferPresentFrames_.fetch_add(1);
    bufferPresentDurationNs_.fetch_add(durationNs);
    if (result != AVCODEC_SAMPLE_ERR_OK) {
        bufferPresentFailures_.fetch_add(1);
    }
}

void Player::ProbeHdrVividFromSurface(bool render, uint64_t outputFrameCount)
{
    if (render && !hdrVividConfirmed_.load() && ShouldProbeHdrVividSurface(outputFrameCount)) {
        auto windowLease = NativeXComponentSample::PluginManager::GetInstance()->AcquirePluginWindow();
        // 仅当解码器直接渲染到 XComponent 时才查询该窗口。NativeImage 生产者属于 OpenGL 路径，
        // 不能通过消费者窗口读取其元数据。
        if (windowLease && sampleInfo_.video.window == windowLease.GetWindow() &&
            HdrMetadataHelper::IsLastFlushedBufferHdrVivid(windowLease.GetWindow())) {
            hdrVividConfirmed_.store(true);
            AVCODEC_SAMPLE_LOGI("HDR Vivid confirmed from XComponent Surface metadata");
        }
    }
}

void Player::WriteOutputFileWithStrideYUV420P(uint8_t *bufferAddr)
{
    CHECK_AND_RETURN_LOG(bufferAddr != nullptr, "Buffer is nullptr");
    const auto &info = sampleInfo_;
    const int32_t videoWidth = videoDecContext_->width *
        (IsTenBitOutput(info, videoDecContext_.get()) ? TEN_BIT_OUTPUT_BYTES_PER_COMPONENT : 1);
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
// [Start decoder_save_file_YUV420]
void Player::WriteOutputFileWithStrideYUV420SP(uint8_t *bufferAddr)
{
    CHECK_AND_RETURN_LOG(bufferAddr != nullptr, "Buffer is nullptr");
    const auto &info = sampleInfo_;
    const int32_t videoWidth = videoDecContext_->width *
        (IsTenBitOutput(info, videoDecContext_.get()) ? TEN_BIT_OUTPUT_BYTES_PER_COMPONENT : 1);
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
// [End decoder_save_file_YUV420]

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
