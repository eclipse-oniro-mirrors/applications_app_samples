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

#include "video_output.h"

#include <algorithm>
#include <hilog/log.h>
#include <multimedia/player_framework/native_avcodec_base.h>
#include <native_buffer/native_buffer.h>
#include <native_fence/native_fence.h>

namespace {
constexpr unsigned PLAYER_LOG_DOMAIN = 0xD000;
constexpr char PLAYER_LOG_TAG[] = "[Sample_AVCodecVideoPlayer]";
constexpr uint32_t FENCE_TIMEOUT_MS = 100;
constexpr int32_t CHROMA_SUBSAMPLING = 2;
constexpr uint32_t LUMA_PLANE = 0;
constexpr uint32_t CHROMA_PLANE = 1;
constexpr uint32_t SECOND_CHROMA_PLANE = 2;
constexpr int32_t MEDIA_ROTATION_90_DEGREES = 90;
constexpr int32_t MEDIA_ROTATION_180_DEGREES = 180;
constexpr int32_t MEDIA_ROTATION_270_DEGREES = 270;

bool WindowSucceeded(int32_t result, const char *operation)
{
    if (result != 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, PLAYER_LOG_DOMAIN, PLAYER_LOG_TAG,
            "%{public}s failed: %{public}d", operation, result);
    }
    return result == 0;
}

int32_t WindowTransform(int32_t rotation)
{
    switch (rotation) {
        case MEDIA_ROTATION_90_DEGREES:
            return NATIVEBUFFER_ROTATE_270;
        case MEDIA_ROTATION_180_DEGREES:
            return NATIVEBUFFER_ROTATE_180;
        case MEDIA_ROTATION_270_DEGREES:
            return NATIVEBUFFER_ROTATE_90;
        default:
            return NATIVEBUFFER_ROTATE_NONE;
    }
}

void CopyRows(uint8_t *target, size_t targetStride, const uint8_t *source, size_t sourceStride,
    size_t width, size_t rows)
{
    for (size_t row = 0; row < rows; ++row) {
        std::copy_n(source + row * sourceStride, width, target + row * targetStride);
    }
}

bool PlaneFits(uint64_t offset, size_t stride, size_t width, size_t rows, size_t size)
{
    if (stride == 0 || stride < width || rows == 0 || offset > size || width > size - offset) {
        return false;
    }
    return (rows - 1) <= (size - offset - width) / stride;
}

bool WaitForBufferFence(int fence)
{
    if (fence < 0) {
        return true;
    }
    const bool ready = OH_NativeFence_Wait(fence, FENCE_TIMEOUT_MS);
    OH_NativeFence_Close(fence);
    return ready;
}
}

bool BufferOutput::Configure(OH_AVFormat *format)
{
    int32_t pixelFormat = AV_PIXEL_FORMAT_NV12;
    if (!OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PIC_WIDTH, &width_)) {
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_WIDTH, &width_);
    }
    if (!OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_PIC_HEIGHT, &height_)) {
        OH_AVFormat_GetIntValue(format, OH_MD_KEY_HEIGHT, &height_);
    }
    stride_ = width_;
    sliceHeight_ = height_;
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_STRIDE, &stride_);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_VIDEO_SLICE_HEIGHT, &sliceHeight_);
    OH_AVFormat_GetIntValue(format, OH_MD_KEY_PIXEL_FORMAT, &pixelFormat);
    if (width_ <= 0 || height_ <= 0 || stride_ < width_ || sliceHeight_ < height_ ||
        width_ % CHROMA_SUBSAMPLING != 0 || height_ % CHROMA_SUBSAMPLING != 0 ||
        (pixelFormat != AV_PIXEL_FORMAT_NV12 && pixelFormat != AV_PIXEL_FORMAT_NV21)) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, PLAYER_LOG_DOMAIN, PLAYER_LOG_TAG,
            "Unsupported video output layout: %{public}dx%{public}d "
            "stride %{public}d slice %{public}d format %{public}d",
            width_, height_, stride_, sliceHeight_, pixelFormat);
        return false;
    }
    windowFormat_ = pixelFormat == AV_PIXEL_FORMAT_NV12 ?
        NATIVEBUFFER_PIXEL_FMT_YCBCR_420_SP : NATIVEBUFFER_PIXEL_FMT_YCRCB_420_SP;
    const uint64_t usage = NATIVEBUFFER_USAGE_CPU_WRITE | NATIVEBUFFER_USAGE_MEM_DMA;
    return WindowSucceeded(OH_NativeWindow_NativeWindowHandleOpt(window_, SET_BUFFER_GEOMETRY, width_, height_),
        "Set window geometry") &&
        WindowSucceeded(OH_NativeWindow_NativeWindowHandleOpt(window_, SET_USAGE, usage), "Set window usage") &&
        WindowSucceeded(OH_NativeWindow_NativeWindowHandleOpt(window_, SET_FORMAT, windowFormat_),
            "Set window format") &&
        WindowSucceeded(OH_NativeWindow_NativeWindowHandleOpt(window_, SET_TRANSFORM, WindowTransform(rotation_)),
            "Set window transform");
}

bool BufferOutput::CopyFrame(OHNativeWindowBuffer *target, const uint8_t *source) const
{
    OH_NativeBuffer *native = nullptr;
    const BufferHandle *handle = OH_NativeWindow_GetBufferHandleFromNative(target);
    if (handle == nullptr || handle->format != windowFormat_ || handle->size <= 0) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, PLAYER_LOG_DOMAIN, PLAYER_LOG_TAG,
            "Unexpected window buffer format %{public}d, expected %{public}d, size %{public}d",
            handle == nullptr ? -1 : handle->format, windowFormat_, handle == nullptr ? -1 : handle->size);
        return false;
    }
    if (!WindowSucceeded(OH_NativeBuffer_FromNativeWindowBuffer(target, &native), "Get native buffer") ||
        native == nullptr) {
        return false;
    }
    void *address = nullptr;
    OH_NativeBuffer_Planes planes {};
    if (!WindowSucceeded(OH_NativeBuffer_MapPlanes(native, &address, &planes), "Map window buffer")) {
        return false;
    }
    const size_t width = static_cast<size_t>(width_);
    const size_t height = static_cast<size_t>(height_);
    const size_t chromaRows = height / CHROMA_SUBSAMPLING;
    const size_t targetSize = static_cast<size_t>(handle->size);
    const size_t sourceStride = static_cast<size_t>(stride_);
    OH_NativeBuffer_Config config {};
    OH_NativeBuffer_GetConfig(native, &config);
    const auto targetStride = static_cast<size_t>(std::max(config.stride, 0));
    const uint64_t lumaOffset = planes.planes[LUMA_PLANE].offset;
    uint64_t chromaOffset = planes.planes[CHROMA_PLANE].offset;
    if (planes.planeCount > SECOND_CHROMA_PLANE) {
        // NV12/NV21的两个色度分量交错存储，较小的偏移是色度行起点。
        chromaOffset = std::min(chromaOffset, planes.planes[SECOND_CHROMA_PLANE].offset);
    }
    const bool copied = address != nullptr && planes.planeCount > CHROMA_PLANE &&
        PlaneFits(lumaOffset, targetStride, width, height, targetSize) &&
        PlaneFits(chromaOffset, targetStride, width, chromaRows, targetSize);
    if (copied) {
        auto *targetAddress = static_cast<uint8_t *>(address);
        CopyRows(targetAddress + lumaOffset, targetStride, source, sourceStride, width, height);
        CopyRows(targetAddress + chromaOffset, targetStride,
            source + sourceStride * static_cast<size_t>(sliceHeight_), sourceStride, width, chromaRows);
    } else {
        OH_LOG_Print(LOG_APP, LOG_ERROR, PLAYER_LOG_DOMAIN, PLAYER_LOG_TAG,
            "Window planes do not fit: %{public}u planes, stride %{public}d, size %{public}zu",
            planes.planeCount, config.stride, targetSize);
    }
    const bool unmapped = WindowSucceeded(OH_NativeBuffer_Unmap(native), "Unmap window buffer");
    return copied && unmapped;
}

bool BufferOutput::Present(OH_AVBuffer *buffer, const OH_AVCodecBufferAttr &attr) const
{
    const uint8_t *source = OH_AVBuffer_GetAddr(buffer);
    const int32_t capacity = OH_AVBuffer_GetCapacity(buffer);
    const int64_t chromaRows = height_ / CHROMA_SUBSAMPLING;
    const int64_t required = (static_cast<int64_t>(sliceHeight_) + chromaRows - 1) * stride_ + width_;
    if (source == nullptr || attr.offset < 0 || attr.offset > capacity || required > capacity - attr.offset) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, PLAYER_LOG_DOMAIN, PLAYER_LOG_TAG,
            "Decoded frame exceeds buffer: offset %{public}d, capacity %{public}d, bytes %{public}lld",
            attr.offset, capacity, static_cast<long long>(required));
        return false;
    }
    OHNativeWindowBuffer *target = nullptr;
    int fence = -1;
    const int32_t acquired = OH_NativeWindow_NativeWindowRequestBuffer(window_, &target, &fence);
    const bool ready = WaitForBufferFence(fence);
    if (!WindowSucceeded(acquired, "Request window buffer") || target == nullptr) {
        return false;
    }
    if (!ready) {
        OH_LOG_Print(LOG_APP, LOG_ERROR, PLAYER_LOG_DOMAIN, PLAYER_LOG_TAG, "Wait for window buffer fence failed");
    }
    if (ready && CopyFrame(target, source + attr.offset) &&
        WindowSucceeded(OH_NativeWindow_NativeWindowFlushBuffer(window_, target, -1, {}), "Flush window buffer")) {
        return true;
    }
    OH_NativeWindow_NativeWindowAbortBuffer(window_, target);
    return false;
}
