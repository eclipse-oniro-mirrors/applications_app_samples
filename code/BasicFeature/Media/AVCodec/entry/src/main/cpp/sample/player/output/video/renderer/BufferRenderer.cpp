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
#include <native_fence/native_fence.h>
#include "BufferRenderer.h"
#include "HdrMetadataHelper.h"
#include "av_codec_sample_log.h"
#include "plugin_manager.h"

#undef LOG_TAG
#define LOG_TAG "bufferRenderer"

namespace {
constexpr int8_t YUV420_SAMPLE_RATIO = 2;
constexpr int32_t MINIMUM_BUFFER_EXTENT = 1;
constexpr int32_t FIRST_PLANE_INDEX = 0;
constexpr int32_t CHROMA_PLANE_INDEX = 1;
constexpr uint32_t YUV420_SP_PLANE_COUNT = 2;
constexpr int32_t DEGREES_PER_TURN = 360;
constexpr int32_t ROTATION_90_DEGREES = 90;
constexpr int32_t ROTATION_180_DEGREES = 180;
constexpr int32_t ROTATION_270_DEGREES = 270;
constexpr int32_t BYTES_PER_SAMPLE_8 = 1;
constexpr int32_t BYTES_PER_SAMPLE_10 = 2;
constexpr int32_t RGBA_BYTES_PER_PIXEL = 4;
constexpr int32_t LAST_INDEX_OFFSET = 1;
constexpr int32_t EVEN_ALIGNMENT_MASK = ~LAST_INDEX_OFFSET;
constexpr uint8_t SDR_BLACK_LEVEL = 16U;
constexpr uint8_t SDR_NEUTRAL_CHROMA = 128U;
constexpr uint16_t P010_BLACK_LEVEL = 0x1000;
constexpr uint16_t P010_NEUTRAL_CHROMA = 0x8000;
constexpr int32_t CPU_WRITE_USAGE = static_cast<int32_t>(NATIVEBUFFER_USAGE_CPU_WRITE);

int32_t DivideByPositive(int32_t numerator, int32_t denominator)
{
    int32_t quotient = 0;
    if (denominator > 0) {
        quotient = numerator / denominator;
    }
    return quotient;
}

double DivideByPositive(double numerator, int32_t denominator)
{
    double quotient = 0.0;
    if (denominator > 0) {
        quotient = numerator / denominator;
    }
    return quotient;
}

int32_t NormalizeRotation(int32_t rotation)
{
    int32_t normalized = rotation % DEGREES_PER_TURN;
    if (normalized < 0) {
        normalized += DEGREES_PER_TURN;
    }
    return normalized == ROTATION_90_DEGREES || normalized == ROTATION_180_DEGREES ||
        normalized == ROTATION_270_DEGREES ? normalized : 0;
}

int32_t GetWindowTransform(int32_t rotation)
{
    // OH_MD_KEY_ROTATION 使用顺时针角度，而 NativeBuffer 变换使用逆时针角度。
    // 显式区分这两种元数据约定，避免竖屏码流横置显示。
    switch (NormalizeRotation(rotation)) {
        case ROTATION_90_DEGREES:
            return NATIVEBUFFER_ROTATE_270;
        case ROTATION_180_DEGREES:
            return NATIVEBUFFER_ROTATE_180;
        case ROTATION_270_DEGREES:
            return NATIVEBUFFER_ROTATE_90;
        default:
            return NATIVEBUFFER_ROTATE_NONE;
    }
}

int32_t ToGraphicPixelFormat(OH_AVPixelFormat pixelFormat, bool tenBitOutput)
{
    if (tenBitOutput) {
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

bool IsTenBitOutput(const SampleInfo &sampleInfo, const CodecUserData &context, OH_AVBuffer *buffer)
{
    (void)context;
    // 行跨度描述行对齐而不是像素位深。特别是已对齐的窄幅 8-bit 帧，行跨度也可能大于可见宽度的两倍。
    // 若误判为 P010，窗口会使用 10-bit 格式且每行复制两倍字节，导致绿屏或 Buffer 送显失败。
    // HEVC profile 和解码后 HDR 元数据才是该 Buffer 模式路径可用的可靠判断依据。
    return IsTenBitHevcOutput(sampleInfo.video) || HdrMetadataHelper::IsHdrVivid(buffer);
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
    uint8_t *dstUvAddr = nullptr;
    const uint8_t *srcAddr = nullptr;
    int32_t width = 0;
    int32_t height = 0;
    int32_t bytesPerRow = 0;
    int32_t srcStride = 0;
    int32_t srcSliceHeight = 0;
    int32_t dstStride = 0;
    int32_t dstUvStride = 0;
    int32_t dstSliceHeight = 0;
};

struct WindowBufferCopyInput {
    uint8_t *dstAddr = nullptr;
    const OH_NativeBuffer_Config &dstConfig;
    const OH_NativeBuffer_Planes &dstPlanes;
    const uint8_t *srcAddr = nullptr;
    const SampleInfo &sampleInfo;
    const CodecUserData &videoDecContext;
    bool tenBitOutput = false;
};

void GetDecodedFrameSize(const SampleInfo &sampleInfo, const CodecUserData &videoDecContext,
    int32_t &width, int32_t &height)
{
    width = videoDecContext.width > 0 ? videoDecContext.width : sampleInfo.video.videoWidth;
    height = videoDecContext.height > 0 ? videoDecContext.height : sampleInfo.video.videoHeight;
}

bool ConfigureYuv420SpDestination(const OH_NativeBuffer_Planes &dstPlanes,
    const OH_NativeBuffer_Config &dstConfig, uint8_t *dstAddr, BufferCopyConfig &copyConfig)
{
    if (dstPlanes.planeCount < YUV420_SP_PLANE_COUNT ||
        dstPlanes.planes[CHROMA_PLANE_INDEX].rowStride == 0) {
        AVCODEC_SAMPLE_LOGE("Native window has no writable chroma plane");
        return false;
    }
    copyConfig.dstUvAddr = dstAddr + dstPlanes.planes[CHROMA_PLANE_INDEX].offset;
    copyConfig.dstUvStride = dstConfig.stride;
    return true;
}

bool BuildWindowBufferCopyConfig(const WindowBufferCopyInput &input, BufferCopyConfig &copyConfig)
{
    if (input.dstAddr == nullptr || input.srcAddr == nullptr || input.dstPlanes.planeCount == 0 ||
        input.dstPlanes.planes[FIRST_PLANE_INDEX].rowStride == 0) {
        AVCODEC_SAMPLE_LOGE("Invalid writable native window plane");
        return false;
    }
    int32_t width = 0;
    int32_t height = 0;
    GetDecodedFrameSize(input.sampleInfo, input.videoDecContext, width, height);
    const OH_AVPixelFormat pixelFormat = input.videoDecContext.outputPixelFormat;
    const bool isRgba = pixelFormat == AV_PIXEL_FORMAT_RGBA || pixelFormat == AV_PIXEL_FORMAT_RGBA1010102;
    const int32_t bytesPerSample = input.tenBitOutput ? BYTES_PER_SAMPLE_10 : BYTES_PER_SAMPLE_8;
    const int32_t bytesPerRow = isRgba ? width * RGBA_BYTES_PER_PIXEL : width * bytesPerSample;
    copyConfig = {input.dstAddr + input.dstPlanes.planes[FIRST_PLANE_INDEX].offset, nullptr, input.srcAddr, width,
        height, bytesPerRow, input.videoDecContext.widthStride > 0 ? input.videoDecContext.widthStride : bytesPerRow,
        input.videoDecContext.heightStride > 0 ? input.videoDecContext.heightStride : height, input.dstConfig.stride,
        0, input.dstConfig.height > 0 ? input.dstConfig.height : height};
    if (pixelFormat == AV_PIXEL_FORMAT_NV12 || pixelFormat == AV_PIXEL_FORMAT_NV21) {
        if (!ConfigureYuv420SpDestination(input.dstPlanes, input.dstConfig, input.dstAddr, copyConfig)) {
            return false;
        }
    }
    return copyConfig.width > 0 && copyConfig.height > 0 && copyConfig.srcStride > 0 &&
        copyConfig.srcSliceHeight > 0 && copyConfig.dstStride > 0 && copyConfig.dstSliceHeight > 0;
}

struct FittedFrame {
    int32_t width = 0;
    int32_t height = 0;
    int32_t left = 0;
    int32_t top = 0;
};

struct WindowGeometry {
    OHNativeWindow *window = nullptr;
    uint64_t generation = 0;
    int32_t width = 0;
    int32_t height = 0;
    int32_t transform = NATIVEBUFFER_ROTATE_NONE;
};

class NearestNeighborStepper {
public:
    NearestNeighborStepper(int32_t sourceExtent, int32_t targetExtent)
    {
        targetExtent_ = targetExtent;
        if (targetExtent_ <= 0) {
            targetExtent_ = MINIMUM_BUFFER_EXTENT;
        }
        increment_ = DivideByPositive(sourceExtent, targetExtent_);
        remainder_ = sourceExtent - increment_ * targetExtent_;
    }

    int32_t Get() const
    {
        return sourcePosition_;
    }

    void Next()
    {
        sourcePosition_ += increment_;
        remainderAccumulator_ += remainder_;
        if (remainderAccumulator_ >= targetExtent_) {
            sourcePosition_++;
            remainderAccumulator_ -= targetExtent_;
        }
    }

private:
    int32_t sourcePosition_ = 0;
    int32_t targetExtent_ = MINIMUM_BUFFER_EXTENT;
    int32_t increment_ = 0;
    int32_t remainder_ = 0;
    int32_t remainderAccumulator_ = 0;
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

    uint8_t *dstUv = config.dstUvAddr != nullptr ? config.dstUvAddr :
        config.dstAddr + static_cast<size_t>(config.dstStride) * config.dstSliceHeight;
    const uint8_t *srcUv = config.srcAddr + config.srcStride * config.srcSliceHeight;
    const int32_t dstUvStride = config.dstUvStride > 0 ? config.dstUvStride : config.dstStride;
    PlaneCopyConfig uvPlane = { dstUv, dstUvStride, srcUv, config.srcStride, config.bytesPerRow,
        config.height / YUV420_SAMPLE_RATIO };
    return CopyPlaneByStride(uvPlane);
}

bool GetFittedFrame(int32_t sourceWidth, int32_t sourceHeight, int32_t targetWidth, int32_t targetHeight,
    FittedFrame &frame)
{
    if (sourceWidth <= 0 || sourceHeight <= 0 || targetWidth < YUV420_SAMPLE_RATIO ||
        targetHeight < YUV420_SAMPLE_RATIO) {
        return false;
    }
    const double scale = std::min(DivideByPositive(static_cast<double>(targetWidth), sourceWidth),
        DivideByPositive(static_cast<double>(targetHeight), sourceHeight));
    frame.width = std::max<int32_t>(YUV420_SAMPLE_RATIO,
        static_cast<int32_t>(sourceWidth * scale) & EVEN_ALIGNMENT_MASK);
    frame.height = std::max<int32_t>(YUV420_SAMPLE_RATIO,
        static_cast<int32_t>(sourceHeight * scale) & EVEN_ALIGNMENT_MASK);
    frame.width = std::min(frame.width, targetWidth & EVEN_ALIGNMENT_MASK);
    frame.height = std::min(frame.height, targetHeight & EVEN_ALIGNMENT_MASK);
    // YUV420 要求坐标为偶数，同时画面仍须居中。
    // 将剩余空间的一半向下取整为偶数偏移量。
    frame.left = ((targetWidth - frame.width) / YUV420_SAMPLE_RATIO) & ~1;
    frame.top = ((targetHeight - frame.height) / YUV420_SAMPLE_RATIO) & ~1;
    return frame.width > 0 && frame.height > 0;
}

bool ResolveWindowGeometry(const NativeXComponentSample::PluginManager::PluginWindowLease &windowLease,
    const SampleInfo &sampleInfo, const CodecUserData &videoDecContext, WindowGeometry &geometry)
{
    geometry.window = windowLease.GetWindow();
    CHECK_AND_RETURN_RET_LOG(geometry.window != nullptr, false, "XComponent window is null");
    geometry.generation = windowLease.GetGeneration();
    geometry.width = windowLease.GetWidth();
    geometry.height = windowLease.GetHeight();
    const bool hasComponentSize = geometry.width > 0 && geometry.height > 0;
    if (!hasComponentSize) {
        geometry.width = videoDecContext.width > 0 ? videoDecContext.width : sampleInfo.video.videoWidth;
        geometry.height = videoDecContext.height > 0 ? videoDecContext.height : sampleInfo.video.videoHeight;
    }
    CHECK_AND_RETURN_RET_LOG(geometry.width > 0 && geometry.height > 0, false,
        "Invalid render window size, width: %{public}d, height: %{public}d", geometry.width, geometry.height);
    const OH_AVPixelFormat pixelFormat = videoDecContext.outputPixelFormat;
    const bool isYuv420Sp = pixelFormat == AV_PIXEL_FORMAT_NV12 || pixelFormat == AV_PIXEL_FORMAT_NV21;
    geometry.transform = isYuv420Sp ? NATIVEBUFFER_ROTATE_NONE : GetWindowTransform(sampleInfo.video.rotation);
    if (!hasComponentSize) {
        return true;
    }
    const int32_t sourceWidth = videoDecContext.width > 0 ? videoDecContext.width : sampleInfo.video.videoWidth;
    const int32_t sourceHeight = videoDecContext.height > 0 ? videoDecContext.height : sampleInfo.video.videoHeight;
    const int32_t normalizedRotation = NormalizeRotation(sampleInfo.video.rotation);
    const bool quarterTurn = isYuv420Sp && (normalizedRotation == ROTATION_90_DEGREES ||
        normalizedRotation == ROTATION_270_DEGREES);
    FittedFrame contentFrame;
    const int32_t displayWidth = quarterTurn ? sourceHeight : sourceWidth;
    const int32_t displayHeight = quarterTurn ? sourceWidth : sourceHeight;
    CHECK_AND_RETURN_RET_LOG(GetFittedFrame(displayWidth, displayHeight, geometry.width, geometry.height,
        contentFrame), false, "Calculate fitted buffer geometry failed");
    geometry.width = contentFrame.width;
    geometry.height = contentFrame.height;
    return true;
}

struct SourcePosition {
    int32_t x = 0;
    int32_t y = 0;
};

struct SourcePositionRequest {
    int32_t rotation = 0;
    int32_t sourceWidth = 0;
    int32_t sourceHeight = 0;
    const FittedFrame &frame;
    int32_t targetX = 0;
    int32_t targetY = 0;
};

SourcePosition GetSourcePosition(const SourcePositionRequest &request)
{
    SourcePosition position;
    if (request.sourceWidth <= 0 || request.sourceHeight <= 0 || request.frame.width <= 0 ||
        request.frame.height <= 0) {
        return position;
    }
    const int32_t frameWidth = request.frame.width;
    const int32_t frameHeight = request.frame.height;
    switch (request.rotation) {
        case ROTATION_90_DEGREES:
            position.x = request.targetY * request.sourceWidth / frameHeight;
            position.y = (frameWidth - LAST_INDEX_OFFSET - request.targetX) * request.sourceHeight / frameWidth;
            break;
        case ROTATION_180_DEGREES:
            position.x = (frameWidth - LAST_INDEX_OFFSET - request.targetX) * request.sourceWidth / frameWidth;
            position.y = (frameHeight - LAST_INDEX_OFFSET - request.targetY) * request.sourceHeight / frameHeight;
            break;
        case ROTATION_270_DEGREES:
            position.x = (frameHeight - LAST_INDEX_OFFSET - request.targetY) * request.sourceWidth / frameHeight;
            position.y = request.targetX * request.sourceHeight / frameWidth;
            break;
        default:
            position.x = request.targetX * request.sourceWidth / frameWidth;
            position.y = request.targetY * request.sourceHeight / frameHeight;
            break;
    }
    position.x = std::clamp(position.x, 0, request.sourceWidth - LAST_INDEX_OFFSET);
    position.y = std::clamp(position.y, 0, request.sourceHeight - LAST_INDEX_OFFSET);
    return position;
}

void FillYuv420SpBlack(const BufferCopyConfig &config, bool tenBitOutput)
{
    const int32_t chromaRows = (config.dstSliceHeight + 1) / YUV420_SAMPLE_RATIO;
    if (!tenBitOutput) {
        for (int32_t row = 0; row < config.dstSliceHeight; ++row) {
            std::fill_n(config.dstAddr + static_cast<size_t>(row) * config.dstStride, config.dstStride,
                SDR_BLACK_LEVEL);
        }
        uint8_t *uvAddr = config.dstUvAddr != nullptr ? config.dstUvAddr :
            config.dstAddr + static_cast<size_t>(config.dstStride) * config.dstSliceHeight;
        const int32_t uvStride = config.dstUvStride > 0 ? config.dstUvStride : config.dstStride;
        for (int32_t row = 0; row < chromaRows; ++row) {
            std::fill_n(uvAddr + static_cast<size_t>(row) * uvStride, uvStride, SDR_NEUTRAL_CHROMA);
        }
        return;
    }

    for (int32_t row = 0; row < config.dstSliceHeight; ++row) {
        auto *line = reinterpret_cast<uint16_t *>(config.dstAddr + static_cast<size_t>(row) * config.dstStride);
        std::fill_n(line, config.dstStride / static_cast<int32_t>(sizeof(uint16_t)), P010_BLACK_LEVEL);
    }
    uint8_t *uvAddr = config.dstUvAddr != nullptr ? config.dstUvAddr :
        config.dstAddr + static_cast<size_t>(config.dstStride) * config.dstSliceHeight;
    const int32_t uvStride = config.dstUvStride > 0 ? config.dstUvStride : config.dstStride;
    for (int32_t row = 0; row < chromaRows; ++row) {
        auto *line = reinterpret_cast<uint16_t *>(uvAddr + static_cast<size_t>(row) * uvStride);
        std::fill_n(line, uvStride / static_cast<int32_t>(sizeof(uint16_t)), P010_NEUTRAL_CHROMA);
    }
}

struct Yuv420SpScaleContext {
    const BufferCopyConfig &config;
    const FittedFrame &frame;
    const uint8_t *sourceUv;
    uint8_t *targetUv;
    int32_t targetUvStride;
    int32_t bytesPerSample;
    int32_t rotation;
};

template<typename SampleType>
void CopyRotatedLuma(const Yuv420SpScaleContext &context)
{
    for (int32_t row = 0; row < context.frame.height; ++row) {
        auto *target = reinterpret_cast<SampleType *>(context.config.dstAddr +
            static_cast<size_t>(context.frame.top + row) * context.config.dstStride +
            static_cast<size_t>(context.frame.left) * context.bytesPerSample);
        for (int32_t column = 0; column < context.frame.width; ++column) {
            const SourcePosition position = GetSourcePosition({context.rotation, context.config.width,
                context.config.height, context.frame, column, row});
            const auto *source = reinterpret_cast<const SampleType *>(context.config.srcAddr +
                static_cast<size_t>(position.y) * context.config.srcStride);
            target[column] = source[position.x];
        }
    }
}

template<typename SampleType>
void CopyRotatedChroma(const Yuv420SpScaleContext &context)
{
    const int32_t chromaWidth = context.frame.width / YUV420_SAMPLE_RATIO;
    const int32_t chromaHeight = context.frame.height / YUV420_SAMPLE_RATIO;
    for (int32_t row = 0; row < chromaHeight; ++row) {
        auto *target = reinterpret_cast<SampleType *>(context.targetUv +
            static_cast<size_t>(context.frame.top / YUV420_SAMPLE_RATIO + row) * context.targetUvStride +
            static_cast<size_t>(context.frame.left) * context.bytesPerSample);
        for (int32_t column = 0; column < chromaWidth; ++column) {
            const SourcePosition position = GetSourcePosition({context.rotation, context.config.width,
                context.config.height, context.frame, column * YUV420_SAMPLE_RATIO,
                row * YUV420_SAMPLE_RATIO});
            const auto *source = reinterpret_cast<const SampleType *>(context.sourceUv +
                static_cast<size_t>(position.y / YUV420_SAMPLE_RATIO) * context.config.srcStride);
            const int32_t sourceColumn = position.x & EVEN_ALIGNMENT_MASK;
            target[column * YUV420_SAMPLE_RATIO] = source[sourceColumn];
            target[column * YUV420_SAMPLE_RATIO + 1] = source[sourceColumn + 1];
        }
    }
}

template<typename SampleType>
void CopyScaledLuma(const Yuv420SpScaleContext &context)
{
    NearestNeighborStepper sourceRow(context.config.height, context.frame.height);
    for (int32_t row = 0; row < context.frame.height; ++row) {
        const auto *source = reinterpret_cast<const SampleType *>(context.config.srcAddr +
            static_cast<size_t>(sourceRow.Get()) * context.config.srcStride);
        auto *target = reinterpret_cast<SampleType *>(context.config.dstAddr +
            static_cast<size_t>(context.frame.top + row) * context.config.dstStride +
            static_cast<size_t>(context.frame.left) * context.bytesPerSample);
        NearestNeighborStepper sourceColumn(context.config.width, context.frame.width);
        for (int32_t column = 0; column < context.frame.width; ++column) {
            target[column] = source[sourceColumn.Get()];
            sourceColumn.Next();
        }
        sourceRow.Next();
    }
}

template<typename SampleType>
void CopyScaledChroma(const Yuv420SpScaleContext &context)
{
    const int32_t chromaWidth = context.frame.width / YUV420_SAMPLE_RATIO;
    const int32_t chromaHeight = context.frame.height / YUV420_SAMPLE_RATIO;
    NearestNeighborStepper sourceRow(context.config.height / YUV420_SAMPLE_RATIO, chromaHeight);
    for (int32_t row = 0; row < chromaHeight; ++row) {
        const auto *source = reinterpret_cast<const SampleType *>(context.sourceUv +
            static_cast<size_t>(sourceRow.Get()) * context.config.srcStride);
        auto *target = reinterpret_cast<SampleType *>(context.targetUv +
            static_cast<size_t>(context.frame.top / YUV420_SAMPLE_RATIO + row) * context.targetUvStride +
            static_cast<size_t>(context.frame.left) * context.bytesPerSample);
        NearestNeighborStepper sourceColumn(context.config.width, chromaWidth);
        for (int32_t column = 0; column < chromaWidth; ++column) {
            const int32_t sourceColumnIndex = sourceColumn.Get() & EVEN_ALIGNMENT_MASK;
            target[column * YUV420_SAMPLE_RATIO] = source[sourceColumnIndex];
            target[column * YUV420_SAMPLE_RATIO + 1] = source[sourceColumnIndex + 1];
            sourceColumn.Next();
        }
        sourceRow.Next();
    }
}

bool CopyRotatedYuv420Sp(const Yuv420SpScaleContext &context, bool tenBitOutput)
{
    if (tenBitOutput) {
        CopyRotatedLuma<uint16_t>(context);
        CopyRotatedChroma<uint16_t>(context);
    } else {
        CopyRotatedLuma<uint8_t>(context);
        CopyRotatedChroma<uint8_t>(context);
    }
    return true;
}

bool CopyScaledYuv420Sp(const Yuv420SpScaleContext &context, bool tenBitOutput)
{
    if (tenBitOutput) {
        CopyScaledLuma<uint16_t>(context);
        CopyScaledChroma<uint16_t>(context);
    } else {
        CopyScaledLuma<uint8_t>(context);
        CopyScaledChroma<uint8_t>(context);
    }
    return true;
}

bool GetYuv420SpTargetSize(const BufferCopyConfig &config, const OH_NativeBuffer_Config &dstConfig,
    int32_t bytesPerSample, int32_t &targetWidth, int32_t &targetHeight)
{
    if (bytesPerSample <= 0) {
        return false;
    }
    int32_t strideWidth = 0;
    if (bytesPerSample == BYTES_PER_SAMPLE_8) {
        strideWidth = config.dstStride;
    } else if (bytesPerSample == BYTES_PER_SAMPLE_10) {
        strideWidth = DivideByPositive(config.dstStride, BYTES_PER_SAMPLE_10);
    } else {
        return false;
    }
    targetWidth = std::min(dstConfig.width, strideWidth) & ~1;
    targetHeight = std::min(dstConfig.height, config.dstSliceHeight) & ~1;
    return targetWidth > 0 && targetHeight > 0;
}

bool HasValidYuv420SpScaleConfig(const BufferCopyConfig &config, int32_t targetWidth,
    int32_t targetHeight, int32_t bytesPerSample)
{
    return config.width > 0 && config.height > 0 && config.width % YUV420_SAMPLE_RATIO == 0 &&
        config.height % YUV420_SAMPLE_RATIO == 0 && config.srcStride >= config.width * bytesPerSample &&
        config.dstStride >= targetWidth * bytesPerSample && targetWidth > 0 && targetHeight > 0;
}

bool HasSampleAlignedP010Stride(const BufferCopyConfig &config)
{
    const int32_t bytesPerP010Sample = static_cast<int32_t>(sizeof(uint16_t));
    return config.srcStride % bytesPerP010Sample == 0 && config.dstStride % bytesPerP010Sample == 0;
}

Yuv420SpScaleContext BuildYuv420SpScaleContext(const BufferCopyConfig &config, const FittedFrame &frame,
    int32_t bytesPerSample, int32_t rotation)
{
    const uint8_t *sourceUv = config.srcAddr + static_cast<size_t>(config.srcStride) * config.srcSliceHeight;
    uint8_t *targetUv = config.dstUvAddr != nullptr ? config.dstUvAddr :
        config.dstAddr + static_cast<size_t>(config.dstStride) * config.dstSliceHeight;
    const int32_t targetUvStride = config.dstUvStride > 0 ? config.dstUvStride : config.dstStride;
    return {config, frame, sourceUv, targetUv, targetUvStride, bytesPerSample, rotation};
}

bool CopyYuv420SpScaled(const BufferCopyConfig &config, const OH_NativeBuffer_Config &dstConfig,
    bool tenBitOutput, int32_t rotation)
{
    const int32_t bytesPerSample = tenBitOutput ? BYTES_PER_SAMPLE_10 : BYTES_PER_SAMPLE_8;
    int32_t targetWidth = 0;
    int32_t targetHeight = 0;
    if (!GetYuv420SpTargetSize(config, dstConfig, bytesPerSample, targetWidth, targetHeight) ||
        !HasValidYuv420SpScaleConfig(config, targetWidth, targetHeight, bytesPerSample)) {
        return false;
    }
    if (tenBitOutput && !HasSampleAlignedP010Stride(config)) {
        AVCODEC_SAMPLE_LOGE("P010 buffer stride is not sample aligned");
        return false;
    }
    const int32_t normalizedRotation = NormalizeRotation(rotation);
    const bool quarterTurn = normalizedRotation == ROTATION_90_DEGREES || normalizedRotation == ROTATION_270_DEGREES;
    const int32_t displayWidth = quarterTurn ? config.height : config.width;
    const int32_t displayHeight = quarterTurn ? config.width : config.height;
    FittedFrame frame;
    if (!GetFittedFrame(displayWidth, displayHeight, targetWidth, targetHeight, frame)) {
        return false;
    }
    if (frame.width != targetWidth || frame.height != targetHeight) {
        FillYuv420SpBlack(config, tenBitOutput);
    }
    const Yuv420SpScaleContext context = BuildYuv420SpScaleContext(config, frame, bytesPerSample,
        normalizedRotation);
    return normalizedRotation == 0 ? CopyScaledYuv420Sp(context, tenBitOutput) :
        CopyRotatedYuv420Sp(context, tenBitOutput);
}

bool ApplyWindowConfiguration(OHNativeWindow *window, int32_t width, int32_t height,
    int32_t graphicPixelFormat, int32_t windowTransform)
{
    int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(window, SET_BUFFER_GEOMETRY, width, height);
    CHECK_AND_RETURN_RET_LOG(ret == 0, false, "Set buffer geometry failed, ret: %{public}d", ret);
    const uint64_t usage = NATIVEBUFFER_USAGE_CPU_READ | NATIVEBUFFER_USAGE_CPU_WRITE |
        NATIVEBUFFER_USAGE_MEM_DMA;
    ret = OH_NativeWindow_NativeWindowHandleOpt(window, SET_USAGE, usage);
    CHECK_AND_RETURN_RET_LOG(ret == 0, false, "Set buffer usage failed, ret: %{public}d", ret);
    ret = OH_NativeWindow_NativeWindowHandleOpt(window, SET_FORMAT, graphicPixelFormat);
    CHECK_AND_RETURN_RET_LOG(ret == 0, false, "Set buffer format failed, ret: %{public}d", ret);
    ret = OH_NativeWindow_NativeWindowSetScalingModeV2(window, OH_SCALING_MODE_SCALE_FIT_V2);
    CHECK_AND_RETURN_RET_LOG(ret == 0, false, "Set scaling mode failed, ret: %{public}d", ret);
    ret = OH_NativeWindow_NativeWindowHandleOpt(window, SET_TRANSFORM, windowTransform);
    CHECK_AND_RETURN_RET_LOG(ret == 0, false, "Set buffer transform failed, ret: %{public}d", ret);
    return true;
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
        // Flush 成功会清空 buffer_；其他返回路径由析构函数 Abort，将窗口 Buffer 归还队列。
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
    if (bufferInfo.buffer == nullptr || bufferInfo.attr.offset < 0) {
        AVCODEC_SAMPLE_LOGE("Invalid buffer offset: %{public}d", bufferInfo.attr.offset);
        return nullptr;
    }
    const int32_t capacity = OH_AVBuffer_GetCapacity(bufferInfo.buffer);
    if (capacity < 0 || bufferInfo.attr.offset > capacity) {
        AVCODEC_SAMPLE_LOGE("Decoded buffer offset exceeds capacity, offset: %{public}d, capacity: %{public}d",
            bufferInfo.attr.offset, capacity);
        return nullptr;
    }
    uint8_t *bufferAddr = OH_AVBuffer_GetAddr(bufferInfo.buffer);
    if (bufferAddr == nullptr) {
        return nullptr;
    }
    return bufferAddr + bufferInfo.attr.offset;
}

bool HasValidSourceLayout(const CodecBufferInfo &bufferInfo, const SampleInfo &sampleInfo,
    const CodecUserData &context, OH_AVPixelFormat pixelFormat, bool tenBitOutput)
{
    if (bufferInfo.buffer == nullptr || bufferInfo.attr.offset < 0) {
        return false;
    }
    const int32_t capacity = OH_AVBuffer_GetCapacity(bufferInfo.buffer);
    if (capacity < 0 || bufferInfo.attr.offset > capacity) {
        return false;
    }
    const int32_t width = context.width > 0 ? context.width : sampleInfo.video.videoWidth;
    const int32_t height = context.height > 0 ? context.height : sampleInfo.video.videoHeight;
    const bool rgba = pixelFormat == AV_PIXEL_FORMAT_RGBA || pixelFormat == AV_PIXEL_FORMAT_RGBA1010102;
    const int32_t bytesPerSample = rgba ? RGBA_BYTES_PER_PIXEL :
        (tenBitOutput ? BYTES_PER_SAMPLE_10 : BYTES_PER_SAMPLE_8);
    if (width <= 0 || height <= 0 || bytesPerSample <= 0) {
        return false;
    }
    const int32_t strideValue = context.widthStride > 0 ? context.widthStride : width * bytesPerSample;
    const int32_t sliceHeightValue = context.heightStride > 0 ? context.heightStride : height;
    if (strideValue <= 0 || sliceHeightValue < height) {
        return false;
    }
    const size_t stride = static_cast<size_t>(strideValue);
    const size_t sliceHeight = static_cast<size_t>(sliceHeightValue);
    size_t requiredSize = stride * sliceHeight;
    if (pixelFormat == AV_PIXEL_FORMAT_YUVI420 || pixelFormat == AV_PIXEL_FORMAT_NV12 ||
        pixelFormat == AV_PIXEL_FORMAT_NV21) {
        requiredSize += stride * ((sliceHeight + 1) / YUV420_SAMPLE_RATIO);
    }
    return requiredSize <= static_cast<size_t>(capacity - bufferInfo.attr.offset);
}
} // 匿名命名空间

void BufferRenderer::Reset()
{
    // Buffer 模式自行处理容器旋转变换。几何信息、格式和 usage 刻意留给下一个生产者：
    // 在 Surface 解码器 Configure() 前修改它们，可能干扰 codec 服务与生产者的协商。
    auto windowLease = NativeXComponentSample::PluginManager::GetInstance()->AcquirePluginWindow();
    if (windowConfigured_ && windowLease && window_ == windowLease.GetWindow() &&
        windowGeneration_ == windowLease.GetGeneration() && windowTransform_ != NATIVEBUFFER_ROTATE_NONE) {
        const int32_t ret = OH_NativeWindow_NativeWindowHandleOpt(window_, SET_TRANSFORM, NATIVEBUFFER_ROTATE_NONE);
        if (ret != 0) {
            AVCODEC_SAMPLE_LOGW("Restore buffer window transform failed, ret: %{public}d", ret);
        }
    }
    windowConfigured_ = false;
    windowWidth_ = 0;
    windowHeight_ = 0;
    windowFormat_ = 0;
    windowTransform_ = NATIVEBUFFER_ROTATE_NONE;
    window_ = nullptr;
    windowGeneration_ = 0;
    nativeBufferConfigLogged_ = false;
    nativeBufferPlanesLogged_ = false;
    scaledBufferConfigLogged_ = false;
    metadataCopyFailureLogged_ = false;
    windowUnavailableLogged_ = false;
}

bool BufferRenderer::ConfigureWindow(const NativeXComponentSample::PluginManager::PluginWindowLease& windowLease,
    const SampleInfo& sampleInfo, const CodecUserData& videoDecContext, int32_t graphicPixelFormat)
{
    WindowGeometry geometry;
    CHECK_AND_RETURN_RET_LOG(ResolveWindowGeometry(windowLease, sampleInfo, videoDecContext, geometry), false,
        "Resolve buffer window geometry failed");
    OHNativeWindow *window = geometry.window;
    const uint64_t windowGeneration = geometry.generation;
    const int32_t width = geometry.width;
    const int32_t height = geometry.height;
    // CPU Buffer 拷贝已处理旋转，因此 NativeWindow 不能再次应用该变换。
    const int32_t windowTransform = geometry.transform;

    if (windowConfigured_ && window_ == window && windowWidth_ == width &&
        windowHeight_ == height && windowFormat_ == graphicPixelFormat &&
        windowTransform_ == windowTransform && windowGeneration_ == windowGeneration) {
        return true;
    }

    // OH_MD_KEY_ROTATION 中的容器旋转为顺时针方向，NativeWindow 变换值为逆时针方向，
    // 因此由 GetWindowTransform 执行文档规定的转换。
    CHECK_AND_RETURN_RET_LOG(ApplyWindowConfiguration(window, width, height, graphicPixelFormat, windowTransform),
        false, "Apply buffer window configuration failed");

    windowConfigured_ = true;
    windowWidth_ = width;
    windowHeight_ = height;
    windowFormat_ = graphicPixelFormat;
    windowTransform_ = windowTransform;
    window_ = window;
    windowGeneration_ = windowGeneration;
    nativeBufferConfigLogged_ = false;
    AVCODEC_SAMPLE_LOGI("Configure Buffer window: geometry=%{public}dx%{public}d, format=%{public}d, "
        "transform=%{public}d, generation=%{public}llu", width, height, graphicPixelFormat,
        windowTransform, static_cast<unsigned long long>(windowGeneration));
    return true;
}

bool BufferRenderer::CopyToWindowBuffer(const WindowBufferCopyContext& context)
{
    BufferCopyConfig copyConfig = {};
    const WindowBufferCopyInput copyInput = {context.dstAddr, context.dstConfig, context.dstPlanes, context.srcAddr,
        context.sampleInfo, context.videoDecContext, context.tenBitOutput};
    CHECK_AND_RETURN_RET_LOG(BuildWindowBufferCopyConfig(copyInput, copyConfig), false,
        "Invalid buffer address, plane, stride, or size");
    const OH_AVPixelFormat pixelFormat = context.videoDecContext.outputPixelFormat;
    const int32_t rotation = NormalizeRotation(context.sampleInfo.video.rotation);
    const bool requiresScaleOrRotation = context.dstConfig.width != copyConfig.width ||
        context.dstConfig.height != copyConfig.height || rotation != 0;
    if (requiresScaleOrRotation) {
        if (pixelFormat != AV_PIXEL_FORMAT_NV12 && pixelFormat != AV_PIXEL_FORMAT_NV21) {
            AVCODEC_SAMPLE_LOGE("Native window size differs from decoded frame for unsupported pixel format: "
                "%{public}d",
                pixelFormat);
            return false;
        }
        if (!scaledBufferConfigLogged_) {
            scaledBufferConfigLogged_ = true;
            AVCODEC_SAMPLE_LOGI("Scale decoded %{public}dx%{public}d frame into active native window "
                "%{public}dx%{public}d, rotation=%{public}d", copyConfig.width, copyConfig.height,
                context.dstConfig.width, context.dstConfig.height, rotation);
        }
        // XComponent 决定送显 Surface 的尺寸，解码帧可能与之不同，通常在这里以信箱模式显示。
        // 不能逐帧重配窗口：这会反复切换 Buffer 队列，并在 4K HDR 内容上阻塞 codec 输出回调。
        return CopyYuv420SpScaled(copyConfig, context.dstConfig, context.tenBitOutput, rotation);
    }

    switch (pixelFormat) {
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
            AVCODEC_SAMPLE_LOGE("Unsupported copy pixel format: %{public}d", pixelFormat);
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

BufferRenderer::NativeBufferCopyResult BufferRenderer::CopyToNativeBuffer(OHNativeWindowBuffer *windowBuffer,
    int &fenceFd,
    const BufferRenderContext& renderContext)
{
    NativeBufferPreparation preparation;
    const NativeBufferCopyResult preparationResult = PrepareNativeBuffer(windowBuffer, fenceFd, renderContext,
        preparation);
    if (preparationResult != NativeBufferCopyResult::COPIED) {
        return preparationResult;
    }
    return CopyMappedNativeBuffer(preparation, renderContext);
}

BufferRenderer::NativeBufferCopyResult BufferRenderer::PrepareNativeBuffer(OHNativeWindowBuffer *windowBuffer,
    int &fenceFd, const BufferRenderContext& renderContext, NativeBufferPreparation& preparation)
{
    int32_t ret = OH_NativeBuffer_FromNativeWindowBuffer(windowBuffer, &preparation.nativeBuffer);
    if (ret != 0 || preparation.nativeBuffer == nullptr) {
        CloseFence(fenceFd);
        AVCODEC_SAMPLE_LOGE("Get native buffer failed, ret: %{public}d", ret);
        return NativeBufferCopyResult::FAILED;
    }
    OH_NativeBuffer_GetConfig(preparation.nativeBuffer, &preparation.dstConfig);
    const int32_t expectedFormat = ToGraphicPixelFormat(renderContext.videoDecContext.outputPixelFormat,
        renderContext.tenBitOutput);
    if (preparation.dstConfig.format != expectedFormat) {
        CloseFence(fenceFd);
        windowConfigured_ = false;
        AVCODEC_SAMPLE_LOGW("Native window returned stale format %{public}d, expected %{public}d; retry next frame",
            preparation.dstConfig.format, expectedFormat);
        return NativeBufferCopyResult::RETRY;
    }
    // OpenGL 或 Vulkan 路径使用过的窗口，在 Buffer 模式接管后可能立即返回旧的仅 GPU 队列槽位。
    // 映射这种槽位也许成功，但部分设备写入会触发故障。应等待带 CPU 写权限的 Buffer 模式槽位，
    // 而不是拷贝到已经失效的分配中。
    if ((preparation.dstConfig.usage & CPU_WRITE_USAGE) == 0) {
        CloseFence(fenceFd);
        windowConfigured_ = false;
        AVCODEC_SAMPLE_LOGW("Native window returned GPU-only buffer, usage: %{public}d; retry next frame",
            preparation.dstConfig.usage);
        return NativeBufferCopyResult::RETRY;
    }
    if (!nativeBufferConfigLogged_) {
        nativeBufferConfigLogged_ = true;
        AVCODEC_SAMPLE_LOGI("Buffer target config: width=%{public}d, height=%{public}d, stride=%{public}d, "
            "format=%{public}d, usage=%{public}d", preparation.dstConfig.width, preparation.dstConfig.height,
            preparation.dstConfig.stride, preparation.dstConfig.format, preparation.dstConfig.usage);
    }
    if (fenceFd >= 0) {
        const bool fenceSignaled = OH_NativeFence_WaitForever(fenceFd);
        OH_NativeFence_Close(fenceFd);
        fenceFd = -1;
        if (!fenceSignaled) {
            AVCODEC_SAMPLE_LOGE("Wait native window buffer fence failed");
            return NativeBufferCopyResult::FAILED;
        }
    }
    return NativeBufferCopyResult::COPIED;
}

BufferRenderer::NativeBufferCopyResult BufferRenderer::CopyMappedNativeBuffer(
    const NativeBufferPreparation& preparation, const BufferRenderContext& renderContext)
{
    void *mappedAddr = nullptr;
    OH_NativeBuffer_Planes dstPlanes = {};
    const int32_t ret = OH_NativeBuffer_MapPlanes(preparation.nativeBuffer, &mappedAddr, &dstPlanes);
    if (ret != 0 || mappedAddr == nullptr) {
        AVCODEC_SAMPLE_LOGE("Map native window buffer failed, ret: %{public}d", ret);
        return NativeBufferCopyResult::FAILED;
    }
    // 映射地址只在 MapPlanes 与 Unmap 之间有效，像素复制必须在此作用域内完成。
    LogMappedNativeBufferPlanes(dstPlanes);
    auto *dstAddr = static_cast<uint8_t *>(mappedAddr);
    const WindowBufferCopyContext windowCopyContext = {dstAddr, preparation.dstConfig, dstPlanes, renderContext.srcAddr,
        renderContext.sampleInfo, renderContext.videoDecContext, renderContext.tenBitOutput};
    const bool copied = CopyToWindowBuffer(windowCopyContext);
    const int32_t unmapRet = OH_NativeBuffer_Unmap(preparation.nativeBuffer);
    if (!copied || unmapRet != 0) {
        AVCODEC_SAMPLE_LOGE("Copy or unmap native window buffer failed, unmapRet: %{public}d", unmapRet);
        return NativeBufferCopyResult::FAILED;
    }
    // BufferRenderer 复制解码器像素时不做色彩转换。必须保留源元数据，
    // 以免回退路径把 HDR 像素错误标记为 BT.709。
    const bool metadataCopied = HdrMetadataHelper::CopyToNativeBuffer(renderContext.bufferInfo.buffer,
        preparation.nativeBuffer);
    if (!metadataCopied &&
        !metadataCopyFailureLogged_) {
        metadataCopyFailureLogged_ = true;
        AVCODEC_SAMPLE_LOGW("Update decoded HDR metadata or color space failed; continue rendering pixels");
    }
    return NativeBufferCopyResult::COPIED;
}

void BufferRenderer::LogMappedNativeBufferPlanes(const OH_NativeBuffer_Planes& dstPlanes)
{
    if (nativeBufferPlanesLogged_) {
        return;
    }
    nativeBufferPlanesLogged_ = true;
    AVCODEC_SAMPLE_LOGI("Mapped buffer planes: count=%{public}u", dstPlanes.planeCount);
    if (dstPlanes.planeCount > 0) {
        const OH_NativeBuffer_Plane& primaryPlane = dstPlanes.planes[FIRST_PLANE_INDEX];
        AVCODEC_SAMPLE_LOGI("Mapped buffer primary plane: offset=%{public}llu, row=%{public}u, column=%{public}u",
            static_cast<unsigned long long>(primaryPlane.offset), primaryPlane.rowStride, primaryPlane.columnStride);
    }
    if (dstPlanes.planeCount >= YUV420_SP_PLANE_COUNT) {
        const OH_NativeBuffer_Plane& chromaPlane = dstPlanes.planes[CHROMA_PLANE_INDEX];
        AVCODEC_SAMPLE_LOGI("Mapped buffer chroma plane: offset=%{public}llu, row=%{public}u, column=%{public}u",
            static_cast<unsigned long long>(chromaPlane.offset), chromaPlane.rowStride, chromaPlane.columnStride);
    }
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
    if (!IsBufferBasedRunMode(sampleInfo.codec.codecRunMode)) {
        return true;
    }
    const OH_AVPixelFormat pixelFormat = videoDecContext.outputPixelFormat;
    const bool tenBitOutput = IsTenBitOutput(sampleInfo, videoDecContext, bufferInfo.buffer);
    CHECK_AND_RETURN_RET_LOG(HasValidSourceLayout(bufferInfo, sampleInfo, videoDecContext, pixelFormat,
        tenBitOutput), false, "Decoded buffer layout exceeds its capacity");
    // 先完成 offset 和容量校验，再计算首地址；异常 Buffer 不能参与指针运算。
    uint8_t *srcAddr = GetBufferDataAddr(bufferInfo);
    CHECK_AND_RETURN_RET_LOG(srcAddr != nullptr, false, "Decoded buffer address is null");
    int32_t graphicPixelFormat = ToGraphicPixelFormat(pixelFormat, tenBitOutput);
    CHECK_AND_RETURN_RET_LOG(graphicPixelFormat != NATIVEBUFFER_PIXEL_FMT_BUTT, false,
        "Unsupported buffer render pixel format: %{public}d", pixelFormat);
    auto windowLease = NativeXComponentSample::PluginManager::GetInstance()->AcquirePluginWindow();
    if (!windowLease) {
        if (!windowUnavailableLogged_) {
            windowUnavailableLogged_ = true;
            AVCODEC_SAMPLE_LOGW("XComponent surface is unavailable; drop decoded frame until it is recreated");
        }
        return true;
    }
    windowUnavailableLogged_ = false;
    CHECK_AND_RETURN_RET_LOG(ConfigureWindow(windowLease, sampleInfo, videoDecContext, graphicPixelFormat), false,
        "Configure buffer render window failed");

    OHNativeWindow *window = windowLease.GetWindow();
    OHNativeWindowBuffer *windowBuffer = nullptr;
    int fenceFd = -1;
    CHECK_AND_RETURN_RET_LOG(RequestWindowBuffer(window, windowBuffer, fenceFd), false,
        "Request buffer render window failed");
    NativeWindowBufferGuard windowBufferGuard(window, windowBuffer);
    BufferRenderContext renderContext = {bufferInfo, srcAddr, sampleInfo, videoDecContext, tenBitOutput};
    const NativeBufferCopyResult copyResult = CopyToNativeBuffer(windowBuffer, fenceFd, renderContext);
    if (copyResult == NativeBufferCopyResult::RETRY) {
        return true;
    }
    CHECK_AND_RETURN_RET_LOG(copyResult == NativeBufferCopyResult::COPIED, false,
        "Copy decoded buffer to native buffer failed");
    CHECK_AND_RETURN_RET_LOG(FlushWindowBuffer(window, windowBuffer, renderTimestamp), false,
        "Flush buffer render window failed");
    windowBufferGuard.Disarm();
    return true;
}
