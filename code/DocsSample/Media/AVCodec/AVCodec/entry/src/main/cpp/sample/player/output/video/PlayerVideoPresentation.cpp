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
            if (videoDecContext->width % YUV420_SAMPLE_RATIO != 0 ||
                height % YUV420_SAMPLE_RATIO != 0 || heightStride % YUV420_SAMPLE_RATIO != 0 ||
                stride % YUV420_SAMPLE_RATIO != 0) {
                return false;
            }
            byteCount = heightStride * stride + heightStride * stride / YUV420_SAMPLE_RATIO;
            return true;
        case AV_PIXEL_FORMAT_NV12:
        case AV_PIXEL_FORMAT_NV21:
            if (videoDecContext->width % YUV420_SAMPLE_RATIO != 0 || height % YUV420_SAMPLE_RATIO != 0) {
                return false;
            }
            byteCount = heightStride * stride + (height / YUV420_SAMPLE_RATIO - 1) * stride + width;
            return true;
        case AV_PIXEL_FORMAT_RGBA1010102:
        case AV_PIXEL_FORMAT_RGBA:
            if (static_cast<uint64_t>(videoDecContext->width) * RGBA_BYTES_PER_PIXEL > stride) {
                return false;
            }
            byteCount = (height - 1) * stride + static_cast<uint64_t>(videoDecContext->width) * RGBA_BYTES_PER_PIXEL;
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

bool UsesBufferMetadataPresentation(const SampleInfo &sampleInfo, const VideoSink *sink)
{
    if (sampleInfo.codec.codecRunMode == BUFFER) {
        return true;
    }
    return (sampleInfo.codec.codecRunMode == OPENGL || sampleInfo.codec.codecRunMode == VULKAN) &&
        sink != nullptr && !sink->UsesSurfaceDecoder();
}

bool IsVulkanSurfaceChainReady(const SampleInfo &sampleInfo, const VideoSink *sink)
{
    return sampleInfo.codec.codecRunMode != VULKAN ||
        (sink != nullptr && sink->UsesSurfaceDecoder() && sampleInfo.video.window != nullptr);
}
} // 匿名命名空间

bool Player::CheckDumpLimit(uint64_t frameBytes)
{
    constexpr uint64_t bytesPerMiB = 1024 * 1024;
    const auto elapsed = std::chrono::steady_clock::now() - dumpStarted_;
    const auto position = outputFile_->tellp();
    const uint64_t maxBytes = static_cast<uint64_t>(sampleInfo_.output.dumpMaxMiB) * bytesPerMiB;
    const bool sizeExceeded = maxBytes > 0 && (static_cast<uint64_t>(position) > maxBytes ||
        frameBytes > maxBytes - static_cast<uint64_t>(position));
    const bool durationExceeded = sampleInfo_.output.dumpMaxSeconds > 0 &&
        std::chrono::duration_cast<std::chrono::seconds>(elapsed).count() >= sampleInfo_.output.dumpMaxSeconds;
    if (position < 0 || sizeExceeded || durationExceeded) {
        dumpSession_.Stop(position < 0 ? "write_failed" : (sizeExceeded ? "size_limit" : "duration_limit"));
        sampleInfo_.output.enableVideoDump = false;
        outputFile_->close();
        return false;
    }
    if (!dumpSession_.CanWrite(frameBytes)) {
        sampleInfo_.output.enableVideoDump = false;
        outputFile_->close();
        return false;
    }
    return true;
}

void Player::WriteDumpLayout(OH_AVPixelFormat format)
{
    std::ofstream description(sampleInfo_.output.outputFilePath + ".layout.txt", std::ios::trunc);
    const bool rgba = format == AV_PIXEL_FORMAT_RGBA || format == AV_PIXEL_FORMAT_RGBA1010102;
    const int32_t componentBytes = !rgba && IsTenBitOutput(sampleInfo_, videoDecContext_.get()) ? 2 : 1;
    description << "format=" << ToString(format) << "\nwidth=" << videoDecContext_->width
        << "\nheight=" << videoDecContext_->height << "\ncomponentBytes=" << componentBytes
        << "\nsourceStrideBytes=" << videoDecContext_->widthStride
        << "\nsourceSliceHeight=" << videoDecContext_->heightStride
        << "\nfileRowBytes=" << videoDecContext_->width * (rgba ? RGBA_BYTES_PER_PIXEL : componentBytes)
        << "\nrotation=" << sampleInfo_.video.rotation
        << "\nlayout=packed rows, no padding; I420: Y/U/V, NV12: Y/UV, NV21: Y/VU; "
        << "10-bit NV output uses 16-bit little-endian components; RGBA1010102: packed 32-bit\n";
}

void Player::DumpOutput(CodecBufferInfo &bufferInfo)
{
    auto &info = sampleInfo_;
    if (bufferInfo.attr.size <= 0) {
        return;
    }
    const bool usesSurfaceDecoder = videoSink_ != nullptr && videoSink_->UsesSurfaceDecoder();
    if (!IsBufferBasedRunMode(info.codec.codecRunMode) || usesSurfaceDecoder || !info.output.enableVideoDump) {
        return;
    }
    const OH_AVPixelFormat pixelFormat = GetOutputPixelFormat(info, videoDecContext_.get());
    uint64_t dumpByteCount = 0;
    CHECK_AND_RETURN_LOG(GetDumpByteCount(info, videoDecContext_.get(), pixelFormat, dumpByteCount),
        "Invalid video output layout");
    uint8_t *bufferAddr = GetBufferDataAddr(bufferInfo, dumpByteCount);
    CHECK_AND_RETURN_LOG(bufferAddr != nullptr, "Buffer is nullptr");
    // [Start decoder_outputFile]
    if (outputFile_ == nullptr) {
        const auto time = std::chrono::duration_cast<std::chrono::microseconds>(
            std::chrono::system_clock::now().time_since_epoch()).count();
        if (info.output.outputFilePath.empty()) {
            info.output.outputFilePath = "/data/storage/el2/base/haps/entry/files/VideoDecoderOut_"s +
                ToString(pixelFormat) + "_" + std::to_string(info.video.videoWidth) + "_" +
                std::to_string(info.video.videoHeight) + "_" + std::to_string(time) + ".yuv";
        }
        dumpStarted_ = std::chrono::steady_clock::now();
        outputFile_ = std::make_unique<std::ofstream>(info.output.outputFilePath,
            std::ios::out | std::ios::binary | std::ios::trunc);
        dumpSession_.Open(info.output.outputFilePath, "sessionId=" + info.output.sessionId +
            "\nmime=" + info.video.videoCodecMime +
            "\nmaxMiB=" + std::to_string(info.output.dumpMaxMiB) +
            "\nmaxSeconds=" + std::to_string(info.output.dumpMaxSeconds));
        if (!outputFile_->is_open()) {
            dumpSession_.Stop("open_failed");
            info.output.enableVideoDump = false;
            outputFile_ = nullptr;
            AVCODEC_SAMPLE_LOGE("Output file open failed");
            return;
        }
        // [StartExclude decoder_outputFile]
        WriteDumpLayout(pixelFormat);
        // [EndExclude decoder_outputFile]
    }
    // [End decoder_outputFile]

    WriteDecodedDumpFrame(pixelFormat, bufferAddr, bufferInfo);
}

void Player::WriteDecodedDumpFrame(OH_AVPixelFormat pixelFormat, uint8_t *bufferAddr,
    const CodecBufferInfo &bufferInfo)
{
    auto &info = sampleInfo_;
    const bool rgba = pixelFormat == AV_PIXEL_FORMAT_RGBA || pixelFormat == AV_PIXEL_FORMAT_RGBA1010102;
    const uint64_t rowBytes = static_cast<uint64_t>(videoDecContext_->width) *
        (rgba ? RGBA_BYTES_PER_PIXEL : (IsTenBitOutput(info, videoDecContext_.get()) ? 2 : 1));
    const uint64_t packedBytes = rowBytes * static_cast<uint64_t>(videoDecContext_->height) *
        (rgba ? 2 : 3) / 2;
    if (!CheckDumpLimit(packedBytes)) {
        return;
    }
    // 输出格式变化后停止本文件，不能把不同帧布局拼进同一份裸数据。
    const uint64_t layoutKey = (static_cast<uint64_t>(videoDecContext_->width) << 32U) |
        (static_cast<uint64_t>(videoDecContext_->height) << 8U) | static_cast<uint64_t>(pixelFormat);
    if (dumpLayoutKey_ != 0 && dumpLayoutKey_ != layoutKey) {
        dumpSession_.Stop("layout_changed");
        info.output.enableVideoDump = false;
        outputFile_->close();
        return;
    }
    dumpLayoutKey_ = layoutKey;
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
    if (!outputFile_->good()) {
        dumpSession_.Stop("write_failed");
        info.output.enableVideoDump = false;
        outputFile_->close();
        AVCODEC_SAMPLE_LOGW("Stop decoder dump after a write failure; keep normal presentation");
    } else {
        dumpSession_.Written(packedBytes, bufferInfo.attr.pts);
    }
}

bool Player::PresentAndReleaseVideoBuffer(CodecBufferInfo& bufferInfo, bool render, int64_t renderTimestamp)
{
    const uint64_t outputFrameCount = videoOutputFrames_.fetch_add(1) + 1;
    if (!render) {
        videoDroppedFrames_.fetch_add(1);
    }

    // Surface解码器的OH_AVBuffer没有应用侧内存，调用GetNativeBuffer只会产生
    // “buffer's memory is nullptr” 日志；Surface/OpenGL/Vulkan的HDR状态由各自
    // 的NativeWindow/NativeImage路径确认，Buffer模式才读取OH_AVBuffer元数据。
    if (UsesBufferMetadataPresentation(sampleInfo_, videoSink_.get())) {
        ConfirmHdrVividFromBuffer(bufferInfo);
    }
    DumpOutput(bufferInfo);
    if (videoDecContext_ == nullptr) {
        AVCODEC_SAMPLE_LOGE("Video decode context is null");
        (void)videoDecoder_->FreeOutputBuffer(bufferInfo, false);
        return false;
    }
    if (!EnsureVideoSink()) {
        AVCODEC_SAMPLE_LOGE("Video sink initialization failed");
        (void)videoDecoder_->FreeOutputBuffer(bufferInfo, false);
        return false;
    }
    if (!IsVulkanSurfaceChainReady(sampleInfo_, videoSink_.get())) {
        // Vulkan不允许退回decoder Buffer送显，避免切换模式后旧BufferRenderer继续接管画面。
        AVCODEC_SAMPLE_LOGE("Invalid Vulkan Surface chain");
        (void)videoDecoder_->FreeOutputBuffer(bufferInfo, false);
        return false;
    }
    const VideoPresentRequest request { *videoDecoder_, bufferInfo, sampleInfo_, *videoDecContext_, render,
        renderTimestamp };
    const bool measureBufferPresent = IsBufferBasedRunMode(sampleInfo_.codec.codecRunMode) && render;
    const auto presentStartedAt = PlaybackDiagnostics::Clock::now();
    const int32_t result = PresentVideoBuffer(request, measureBufferPresent);
    const auto presentElapsed = PlaybackDiagnostics::Clock::now() - presentStartedAt;
    if (result != AVCODEC_SAMPLE_ERR_OK) {
        failure_.Record("sink.present", result, "视频送显或归还输出 Buffer 失败");
        diagnostics_.RecordEvent("sink.present.failed", bufferInfo.attr.pts);
        AVCODEC_SAMPLE_LOGE("Present video output failed: %{public}d", result);
        playbackFailed_ = true;
        isStarted_ = false;
        return false;
    }
    ProbeHdrVividFromSurface(render, outputFrameCount);
    hasDecodedOutput_ = true;
    if (render) {
        videoRenderedFrames_.fetch_add(1);
        diagnostics_.RecordVideoSubmission(bufferInfo.attr.pts,
            std::chrono::duration_cast<std::chrono::microseconds>(presentElapsed).count());
    }
    if (render && !hasAudioTrack_.load()) {
        playbackPositionUs_.store(bufferInfo.attr.pts);
    }
    return true;
}

void Player::ConfirmHdrVividFromBuffer(const CodecBufferInfo &bufferInfo)
{
    // 容器声明不能证明码流确为HDR Vivid。仅以解码后Buffer的元数据为准；
    // 直连Surface输出则在下方帧已送达XComponent后再检查。
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
    if (sampleInfo_.codec.codecRunMode == VULKAN && !videoSink_->UsesSurfaceDecoder()) {
        AVCODEC_SAMPLE_LOGE("Vulkan sink is not bound to a Surface decoder");
        return false;
    }
    return videoSink_ != nullptr;
}

int32_t Player::PresentVideoBuffer(const VideoPresentRequest &request, bool measureBufferPresent)
{
    const auto presentStart = measureBufferPresent ? std::chrono::steady_clock::now() :
        std::chrono::steady_clock::time_point {};
    const int32_t result = videoSink_->Present(request);
    // UI每250ms拉取一次快照，送显线程不需要为每一帧争用诊断锁。
    if ((videoOutputFrames_.load() & 0x7U) == 0U) {
        const VideoSinkDiagnostics snapshot = videoSink_->GetDiagnostics();
        std::lock_guard<std::mutex> lock(videoSinkDiagnosticsMutex_);
        videoSinkDiagnostics_ = snapshot;
    }
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
        const bool usesVulkanSurface = sampleInfo_.codec.codecRunMode == VULKAN &&
            videoSink_ != nullptr && videoSink_->UsesSurfaceDecoder();
        // Vulkan的NativeImage生产者不是XComponent窗口，但Vulkan会把确认后的
        // NativeBuffer元数据同步到最终窗口，因此应从该窗口读取最后送显的Buffer。
        if (windowLease) {
            const bool usesDirectSurface = sampleInfo_.video.window == windowLease.GetWindow();
            const bool hdrConfirmed = usesVulkanSurface ? videoSink_->IsHdrVividConfirmed() :
                HdrMetadataHelper::IsLastFlushedBufferHdrVivid(windowLease.GetWindow());
            if ((usesDirectSurface || usesVulkanSurface) && hdrConfirmed) {
                hdrVividConfirmed_.store(true);
                AVCODEC_SAMPLE_LOGI("HDR Vivid confirmed from XComponent Surface metadata");
            }
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
        bufferAddr += stride;
    }
}
// [End decoder_save_file_YUV420]

void Player::WriteOutputFileWithStrideRGBA(uint8_t *bufferAddr)
{
    CHECK_AND_RETURN_LOG(bufferAddr != nullptr, "Buffer is nullptr");
    const int32_t width = videoDecContext_->width;
    const int32_t stride = videoDecContext_->widthStride;
    for (int32_t row = 0; row < videoDecContext_->height; row++) {
        outputFile_->write(reinterpret_cast<char *>(bufferAddr), width * RGBA_BYTES_PER_PIXEL);
        bufferAddr += stride;
    }
}
