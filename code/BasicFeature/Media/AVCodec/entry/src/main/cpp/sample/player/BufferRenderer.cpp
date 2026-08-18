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

#include <algorithm>
#include <unistd.h>
#include "BufferRenderer.h"
#include "HdrMetadataHelper.h"
#include "av_codec_sample_log.h"
#include "plugin_manager.h"

#undef LOG_TAG
#define LOG_TAG "bufferRenderer"

namespace {
constexpr int8_t YUV420_SAMPLE_RATIO = 2;

int32_t ToGraphicPixelFormat(OH_AVPixelFormat pixelFormat, int32_t hevcProfile)
{
    if (hevcProfile == HEVC_PROFILE_MAIN_10) {
        switch (pixelFormat) {
            case AV_PIXEL_FORMAT_NV12:
                return NATIVEBUFFER_PIXEL_FMT_YCBCR_P010;
            case AV_PIXEL_FORMAT_NV21:
                return NATIVEBUFFER_PIXEL_FMT_YCRCB_P010;
            case AV_PIXEL_FORMAT_RGBA:
                return NATIVEBUFFER_PIXEL_FMT_RGBA_8888;
            case AV_PIXEL_FORMAT_RGBA1010102:
                return NATIVEBUFFER_PIXEL_FMT_RGBA_1010102;
            default:
                return NATIVEBUFFER_PIXEL_FMT_BUTT;
        }
    }

    switch (pixelFormat) {
        case AV_PIXEL_FORMAT_NV12:
            return NATIVEBUFFER_PIXEL_FMT_YCBCR_420_SP;
        case AV_PIXEL_FORMAT_NV21:
            return NATIVEBUFFER_PIXEL_FMT_YCRCB_420_SP;
        case AV_PIXEL_FORMAT_YUVI420:
            return NATIVEBUFFER_PIXEL_FMT_YCBCR_420_P;
        case AV_PIXEL_FORMAT_RGBA:
            return NATIVEBUFFER_PIXEL_FMT_RGBA_8888;
        case AV_PIXEL_FORMAT_RGBA1010102:
            return NATIVEBUFFER_PIXEL_FMT_RGBA_1010102;
        default:
            return NATIVEBUFFER_PIXEL_FMT_BUTT;
    }
}

bool IsTenBitOutput(const SampleInfo &sampleInfo)
{
    return sampleInfo.video.videoCodecMime == OH_AVCODEC_MIMETYPE_VIDEO_HEVC &&
        sampleInfo.video.hevcProfile == HEVC_PROFILE_MAIN_10;
}

struct PlaneCopyConfig {
    uint8_t *dst = nullptr;
    int32_t dstStride = 0;
    const uint8_t *src = nullptr;
    int32_t srcStride = 0;
    int32_t bytesPerRow = 0;
    int32_t rows = 0;
};

struct BufferCopyConfig {
    uint8_t *dstAddr = nullptr;
    const uint8_t *srcAddr = nullptr;
    int32_t width = 0;
    int32_t height = 0;
    int32_t bytesPerRow = 0;
    int32_t srcStride = 0;
    int32_t srcSliceHeight = 0;
    int32_t dstStride = 0;
    int32_t dstSliceHeight = 0;
};

bool CopyPlaneByStride(const PlaneCopyConfig &config)
{
    if (config.dst == nullptr || config.src == nullptr || config.dstStride <= 0 || config.srcStride <= 0 ||
        config.bytesPerRow <= 0 || config.rows <= 0 || config.bytesPerRow > config.dstStride ||
        config.bytesPerRow > config.srcStride) {
        AVCODEC_SAMPLE_LOGE("Invalid plane copy config");
        return false;
    }
    uint8_t *dst = config.dst;
    const uint8_t *src = config.src;
    for (int32_t row = 0; row < config.rows; row++) {
        std::copy_n(src, static_cast<size_t>(config.bytesPerRow), dst);
        dst += config.dstStride;
        src += config.srcStride;
    }
    return true;
}

bool CopyRgbaBuffer(const BufferCopyConfig &config)
{
    PlaneCopyConfig planeConfig = { config.dstAddr, config.dstStride, config.srcAddr, config.srcStride,
        config.bytesPerRow, config.height };
    return CopyPlaneByStride(planeConfig);
}

bool CopyYuv420PBuffer(const BufferCopyConfig &config)
{
    PlaneCopyConfig yPlane = { config.dstAddr, config.dstStride, config.srcAddr, config.srcStride,
        config.bytesPerRow, config.height };
    CHECK_AND_RETURN_RET_LOG(CopyPlaneByStride(yPlane), false, "Copy YUV420P luma plane failed");

    int32_t dstUvStride = config.dstStride / YUV420_SAMPLE_RATIO;
    int32_t srcUvStride = config.srcStride / YUV420_SAMPLE_RATIO;
    int32_t uvBytesPerRow = config.bytesPerRow / YUV420_SAMPLE_RATIO;
    int32_t uvRows = config.height / YUV420_SAMPLE_RATIO;
    uint8_t *dstU = config.dstAddr + config.dstStride * config.dstSliceHeight;
    const uint8_t *srcU = config.srcAddr + config.srcStride * config.srcSliceHeight;
    PlaneCopyConfig uPlane = { dstU, dstUvStride, srcU, srcUvStride, uvBytesPerRow, uvRows };
    CHECK_AND_RETURN_RET_LOG(CopyPlaneByStride(uPlane), false, "Copy YUV420P U plane failed");

    uint8_t *dstV = dstU + dstUvStride * (config.dstSliceHeight / YUV420_SAMPLE_RATIO);
    const uint8_t *srcV = srcU + srcUvStride * (config.srcSliceHeight / YUV420_SAMPLE_RATIO);
    PlaneCopyConfig vPlane = { dstV, dstUvStride, srcV, srcUvStride, uvBytesPerRow, uvRows };
    return CopyPlaneByStride(vPlane);
}

bool CopyYuv420SpBuffer(const BufferCopyConfig &config)
{
    PlaneCopyConfig yPlane = { config.dstAddr, config.dstStride, config.srcAddr, config.srcStride,
        config.bytesPerRow, config.height };
    CHECK_AND_RETURN_RET_LOG(CopyPlaneByStride(yPlane), false, "Copy YUV420SP luma plane failed");

    uint8_t *dstUv = config.dstAddr + config.dstStride * config.dstSliceHeight;
    const uint8_t *srcUv = config.srcAddr + config.srcStride * config.srcSliceHeight;
    PlaneCopyConfig uvPlane = { dstUv, config.dstStride, srcUv, config.srcStride, config.bytesPerRow,
        config.height / YUV420_SAMPLE_RATIO };
    return CopyPlaneByStride(uvPlane);
}

void CloseFence(int &fenceFd)
{
    if (fenceFd >= 0) {
        close(fenceFd);
        fenceFd = -1;
    }
}

class NativeWindowBufferGuard {
public:
    NativeWindowBufferGuard(OHNativeWindow *window, OHNativeWindowBuffer *buffer)
        : window_(window), buffer_(buffer) {}
    ~NativeWindowBufferGuard()
    {
        Abort();
    }

    void Disarm()
    {
        buffer_ = nullptr;
    }

private:
    void Abort()
    {
        if (window_ != nullptr && buffer_ != nullptr) {
            (void)OH_NativeWindow_NativeWindowAbortBuffer(window_, buffer_);
            buffer_ = nullptr;
        }
    }

    OHNativeWindow *window_ = nullptr;
    OHNativeWindowBuffer *buffer_ = nullptr;
};

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

void BufferRenderer::Reset()
{
    windowConfigured_ = false;
    windowWidth_ = 0;
    windowHeight_ = 0;
    windowFormat_ = 0;
    window_ = nullptr;
    metadataCopyFailureLogged_ = false;
}

bool BufferRenderer::ConfigureWindow(const SampleInfo& sampleInfo, const CodecUserData& videoDecContext,
    int32_t graphicPixelFormat)
{
    OHNativeWindow *window = NativeXComponentSample::PluginManager::GetInstance()->GetPluginWindow();
    CHECK_AND_RETURN_RET_LOG(window != nullptr, false, "XComponent window is null");

    int32_t width = videoDecContext.width > 0 ? videoDecContext.width : sampleInfo.video.videoWidth;
    int32_t height = videoDecContext.height > 0 ? videoDecContext.height : sampleInfo.video.videoHeight;
    CHECK_AND_RETURN_RET_LOG(width > 0 && height > 0, false,
        "Invalid render size, width: %{public}d, height: %{public}d", width, height);

    if (windowConfigured_ && window_ == window && windowWidth_ == width &&
        windowHeight_ == height && windowFormat_ == graphicPixelFormat) {
        return true;
    }

    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(window, SET_BUFFER_GEOMETRY, width, height);
    CHECK_AND_RETURN_RET_LOG(ret == 0, false, "Set buffer geometry failed, ret: %{public}d", ret);

    uint64_t usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA;
    ret = OH_NativeWindow_NativeWindowHandleOpt(window, SET_USAGE, usage);
    CHECK_AND_RETURN_RET_LOG(ret == 0, false, "Set buffer usage failed, ret: %{public}d", ret);

    ret = OH_NativeWindow_NativeWindowHandleOpt(window, SET_FORMAT, graphicPixelFormat);
    CHECK_AND_RETURN_RET_LOG(ret == 0, false, "Set buffer format failed, ret: %{public}d", ret);

    ret = OH_NativeWindow_NativeWindowSetScalingModeV2(window, OH_SCALING_MODE_SCALE_FIT_V2);
    CHECK_AND_RETURN_RET_LOG(ret == 0, false, "Set scaling mode failed, ret: %{public}d", ret);

    windowConfigured_ = true;
    windowWidth_ = width;
    windowHeight_ = height;
    windowFormat_ = graphicPixelFormat;
    window_ = window;
    return true;
}

bool BufferRenderer::CopyToWindowBuffer(uint8_t *dstAddr, const OH_NativeBuffer_Config& dstConfig,
    const uint8_t *srcAddr, const SampleInfo& sampleInfo, const CodecUserData& videoDecContext)
{
    CHECK_AND_RETURN_RET_LOG(dstAddr != nullptr && srcAddr != nullptr, false, "Invalid buffer address");

    int32_t width = videoDecContext.width > 0 ? videoDecContext.width : sampleInfo.video.videoWidth;
    int32_t height = videoDecContext.height > 0 ? videoDecContext.height : sampleInfo.video.videoHeight;
    const bool isRgba = sampleInfo.video.pixelFormat == AV_PIXEL_FORMAT_RGBA ||
        sampleInfo.video.pixelFormat == AV_PIXEL_FORMAT_RGBA1010102;
    constexpr int32_t rgbaBytesPerPixel = 4;
    const int32_t bytesPerSample = IsTenBitOutput(sampleInfo) ? 2 : 1;
    const int32_t bytesPerRow = isRgba ? width * rgbaBytesPerPixel : width * bytesPerSample;
    BufferCopyConfig copyConfig = {
        dstAddr,
        srcAddr,
        width,
        height,
        bytesPerRow,
        videoDecContext.widthStride > 0 ? videoDecContext.widthStride : bytesPerRow,
        videoDecContext.heightStride > 0 ? videoDecContext.heightStride : height,
        dstConfig.stride > 0 ? dstConfig.stride : bytesPerRow,
        dstConfig.height > 0 ? dstConfig.height : height
    };
    CHECK_AND_RETURN_RET_LOG(copyConfig.width > 0 && copyConfig.height > 0 && copyConfig.srcStride > 0 &&
        copyConfig.srcSliceHeight > 0 && copyConfig.dstStride > 0 && copyConfig.dstSliceHeight > 0,
        false, "Invalid stride or size");

    switch (sampleInfo.video.pixelFormat) {
        case AV_PIXEL_FORMAT_RGBA:
        case AV_PIXEL_FORMAT_RGBA1010102:
            return CopyRgbaBuffer(copyConfig);
        case AV_PIXEL_FORMAT_YUVI420:
            return CopyYuv420PBuffer(copyConfig);
        case AV_PIXEL_FORMAT_NV12:
            [[fallthrough]];
        case AV_PIXEL_FORMAT_NV21:
            return CopyYuv420SpBuffer(copyConfig);
        default:
            AVCODEC_SAMPLE_LOGE("Unsupported copy pixel format: %{public}d", sampleInfo.video.pixelFormat);
            return false;
    }
}

bool BufferRenderer::RequestWindowBuffer(OHNativeWindow *window, OHNativeWindowBuffer *&windowBuffer, int &fenceFd)
{
    int32_t ret = OH_NativeWindow_NativeWindowRequestBuffer(window, &windowBuffer, &fenceFd);
    if (ret == 0 && windowBuffer != nullptr) {
        return true;
    }
    if (windowBuffer != nullptr) {
        (void)OH_NativeWindow_NativeWindowAbortBuffer(window, windowBuffer);
        windowBuffer = nullptr;
    }
    CloseFence(fenceFd);
    AVCODEC_SAMPLE_LOGE("Request native window buffer failed, ret: %{public}d", ret);
    return false;
}

bool BufferRenderer::CopyToNativeBuffer(OHNativeWindowBuffer *windowBuffer, int &fenceFd,
    const BufferRenderContext& renderContext)
{
    OH_NativeBuffer *nativeBuffer = nullptr;
    int32_t ret = OH_NativeBuffer_FromNativeWindowBuffer(windowBuffer, &nativeBuffer);
    if (ret != 0 || nativeBuffer == nullptr) {
        CloseFence(fenceFd);
        AVCODEC_SAMPLE_LOGE("Get native buffer failed, ret: %{public}d", ret);
        return false;
    }
    OH_NativeBuffer_Config dstConfig = {};
    OH_NativeBuffer_GetConfig(nativeBuffer, &dstConfig);
    void *mappedAddr = nullptr;
    if (fenceFd >= 0) {
        ret = OH_NativeBuffer_MapWaitFence(nativeBuffer, fenceFd, &mappedAddr);
        if (ret == 0) {
            fenceFd = -1;
        }
    } else {
        ret = OH_NativeBuffer_Map(nativeBuffer, &mappedAddr);
    }
    if (ret != 0 || mappedAddr == nullptr) {
        CloseFence(fenceFd);
        AVCODEC_SAMPLE_LOGE("Map native window buffer failed, ret: %{public}d", ret);
        return false;
    }
    auto *dstAddr = static_cast<uint8_t *>(mappedAddr);
    bool copied = CopyToWindowBuffer(dstAddr, dstConfig, renderContext.srcAddr, renderContext.sampleInfo,
        renderContext.videoDecContext);
    int32_t unmapRet = OH_NativeBuffer_Unmap(nativeBuffer);
    if (!copied || unmapRet != 0) {
        AVCODEC_SAMPLE_LOGE("Copy or unmap native window buffer failed, unmapRet: %{public}d", unmapRet);
        return false;
    }
    if (!HdrMetadataHelper::CopyToNativeBuffer(renderContext.bufferInfo.buffer, nativeBuffer) &&
        !metadataCopyFailureLogged_) {
        metadataCopyFailureLogged_ = true;
        AVCODEC_SAMPLE_LOGW("Copy decoded HDR metadata or color space failed; continue rendering pixels");
    }
    return true;
}

bool BufferRenderer::FlushWindowBuffer(OHNativeWindow *window, OHNativeWindowBuffer *windowBuffer,
    int64_t renderTimestamp)
{
    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(window, SET_DESIRED_PRESENT_TIMESTAMP, renderTimestamp);
    if (ret != 0) {
        AVCODEC_SAMPLE_LOGW("Set desired present timestamp failed, ret: %{public}d", ret);
    }
    ret = OH_NativeWindow_NativeWindowFlushBuffer(window, windowBuffer, -1, {nullptr, 0});
    if (ret != 0) {
        AVCODEC_SAMPLE_LOGE("Flush native window buffer failed, ret: %{public}d", ret);
        return false;
    }
    return true;
}

bool BufferRenderer::Render(CodecBufferInfo& bufferInfo, const SampleInfo& sampleInfo,
    const CodecUserData& videoDecContext, int64_t renderTimestamp)
{
    if (sampleInfo.codec.codecRunMode != BUFFER) {
        return true;
    }
    uint8_t *srcAddr = GetBufferDataAddr(bufferInfo);
    CHECK_AND_RETURN_RET_LOG(srcAddr != nullptr, false, "Decoded buffer address is null");
    int32_t graphicPixelFormat = ToGraphicPixelFormat(sampleInfo.video.pixelFormat, sampleInfo.video.hevcProfile);
    CHECK_AND_RETURN_RET_LOG(graphicPixelFormat != NATIVEBUFFER_PIXEL_FMT_BUTT, false,
        "Unsupported buffer render pixel format: %{public}d", sampleInfo.video.pixelFormat);
    CHECK_AND_RETURN_RET_LOG(ConfigureWindow(sampleInfo, videoDecContext, graphicPixelFormat), false,
        "Configure buffer render window failed");

    OHNativeWindow *window = NativeXComponentSample::PluginManager::GetInstance()->GetPluginWindow();
    CHECK_AND_RETURN_RET_LOG(window != nullptr, false, "XComponent window is null");
    OHNativeWindowBuffer *windowBuffer = nullptr;
    int fenceFd = -1;
    CHECK_AND_RETURN_RET_LOG(RequestWindowBuffer(window, windowBuffer, fenceFd), false,
        "Request buffer render window failed");
    NativeWindowBufferGuard windowBufferGuard(window, windowBuffer);
    BufferRenderContext renderContext = {bufferInfo, srcAddr, sampleInfo, videoDecContext};
    CHECK_AND_RETURN_RET_LOG(
        CopyToNativeBuffer(windowBuffer, fenceFd, renderContext), false,
        "Copy decoded buffer to native buffer failed");
    CHECK_AND_RETURN_RET_LOG(FlushWindowBuffer(window, windowBuffer, renderTimestamp), false,
        "Flush buffer render window failed");
    windowBufferGuard.Disarm();
    return true;
}
