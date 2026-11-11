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

#include "RecorderFrameCopy.h"
#include <algorithm>

namespace RecorderFrames {
namespace {
bool ResolveChromaPlanes(const Plane *mapped, uint32_t count, bool semiplanar, size_t bytes, int32_t width,
                         int32_t height, Plane &u, Plane &v)
{
    const uint32_t pixelStride = semiplanar ? CHROMA_COMPONENTS : 1;
    u = mapped[1];
    if (!NormalizePlane(u, bytes, width, height, pixelStride)) {
        return false;
    }
    if (count == SEMIPLANAR_PLANE_COUNT) {
        v = u;
        ++v.offset;
        return semiplanar && Contains(bytes, v, width, height);
    }
    v = mapped[YUV_COMPONENT_COUNT - 1];
    if (!NormalizePlane(v, bytes, width, height, pixelStride)) {
        return false;
    }
    const uint64_t offsetDistance = u.offset > v.offset ? u.offset - v.offset : v.offset - u.offset;
    return !semiplanar || (u.rowStride == v.rowStride && offsetDistance == 1);
}

bool ValidCopyDimensions(int32_t width, int32_t height, int32_t stride, int32_t sliceHeight)
{
    return width > 0 && height > 0 && width <= MAX_FRAME_WIDTH && height <= MAX_FRAME_HEIGHT &&
           width % CHROMA_SUBSAMPLING == 0 && height % CHROMA_SUBSAMPLING == 0 && stride >= width &&
           sliceHeight >= height && stride <= MAX_BUFFER_DIMENSION && sliceHeight <= MAX_BUFFER_DIMENSION &&
           stride % CHROMA_SUBSAMPLING == 0 && sliceHeight % CHROMA_SUBSAMPLING == 0;
}

void CopyLuma(const uint8_t *source, const Plane &y, uint8_t *destination, int32_t width, int32_t height,
              int32_t stride)
{
    for (int32_t row = 0; row < height; ++row) {
        const uint8_t *input = source + y.offset + static_cast<size_t>(row) * y.rowStride;
        uint8_t *output = destination + static_cast<size_t>(row) * stride;
        if (y.pixelStride == 1) {
            std::copy_n(input, width, output);
            continue;
        }
        for (int32_t col = 0; col < width; ++col) {
            output[col] = input[static_cast<size_t>(col) * y.pixelStride];
        }
    }
}

void CopyChroma(const uint8_t *source, const Plane &u, const Plane &v, uint8_t *destination, int32_t width,
                int32_t height, int32_t stride)
{
    for (int32_t row = 0; row < height / CHROMA_SUBSAMPLING; ++row) {
        const uint8_t *inputU = source + u.offset + static_cast<size_t>(row) * u.rowStride;
        const uint8_t *inputV = source + v.offset + static_cast<size_t>(row) * v.rowStride;
        uint8_t *output = destination + static_cast<size_t>(row) * stride;
        for (int32_t col = 0; col < width / CHROMA_SUBSAMPLING; ++col) {
            const size_t column = static_cast<size_t>(col);
            output[column * CHROMA_COMPONENTS] = inputU[column * u.pixelStride];
            output[column * CHROMA_COMPONENTS + 1] = inputV[column * v.pixelStride];
        }
    }
}
} // namespace

bool ResolveYuv420Planes(const Plane *mapped, uint32_t count, Yuv420Layout layout, size_t bytes, int32_t width,
                         int32_t height, Plane &y, Plane &u, Plane &v)
{
    if (mapped == nullptr || count < SEMIPLANAR_PLANE_COUNT || count > YUV_COMPONENT_COUNT || width <= 0 ||
        height <= 0 || width % CHROMA_SUBSAMPLING != 0 || height % CHROMA_SUBSAMPLING != 0) {
        return false;
    }
    y = mapped[0];
    const bool semiplanar = layout == Yuv420Layout::NV12 || layout == Yuv420Layout::NV21;
    if (!NormalizePlane(y, bytes, width, height, 1) ||
        !ResolveChromaPlanes(mapped, count, semiplanar, bytes, width / CHROMA_SUBSAMPLING, height / CHROMA_SUBSAMPLING,
                             u, v)) {
        return false;
    }
    // 三分量NV21可能按Y/U/V返回，其中U的偏移比V大1；不能再从U偏移推导V。
    const bool uFirst = layout == Yuv420Layout::NV12 || layout == Yuv420Layout::I420;
    if ((u.offset < v.offset) != uFirst) {
        std::swap(u, v);
    }
    return true;
}

bool CopyNv12(const uint8_t *source, size_t bytes, const Plane &y, const Plane &u, const Plane &v, uint8_t *destination,
              size_t capacity, int32_t width, int32_t height, int32_t stride, int32_t sliceHeight)
{
    if (source == nullptr || destination == nullptr || !ValidCopyDimensions(width, height, stride, sliceHeight)) {
        return false;
    }
    const size_t lumaBytes = static_cast<size_t>(stride) * sliceHeight;
    const int32_t chromaWidth = width / CHROMA_SUBSAMPLING;
    const int32_t chromaHeight = height / CHROMA_SUBSAMPLING;
    if (capacity < lumaBytes + lumaBytes / CHROMA_SUBSAMPLING || !Contains(bytes, y, width, height) ||
        !Contains(bytes, u, chromaWidth, chromaHeight) || !Contains(bytes, v, chromaWidth, chromaHeight)) {
        return false;
    }
    std::fill_n(destination, lumaBytes, LIMITED_RANGE_BLACK);
    std::fill_n(destination + lumaBytes, lumaBytes / CHROMA_SUBSAMPLING, NEUTRAL_CHROMA);
    CopyLuma(source, y, destination, width, height, stride);
    CopyChroma(source, u, v, destination + lumaBytes, width, height, stride);
    return true;
}
} // namespace RecorderFrames
