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

#ifndef AVCODEC_RECORDER_FRAME_COPY_H
#define AVCODEC_RECORDER_FRAME_COPY_H

#include <cstddef>
#include <cstdint>
#include <cstring>
#include <utility>

namespace RecorderFrames {
constexpr int32_t CHROMA_SUBSAMPLING = 2;
constexpr uint32_t CHROMA_COMPONENTS = 2;
constexpr uint32_t SEMIPLANAR_PLANE_COUNT = 2;
constexpr uint32_t YUV_COMPONENT_COUNT = 3;
constexpr int32_t MAX_FRAME_WIDTH = 1920;
constexpr int32_t MAX_FRAME_HEIGHT = 1080;
constexpr int32_t MAX_BUFFER_DIMENSION = 8192;
constexpr uint8_t LIMITED_RANGE_BLACK = 16;
constexpr uint8_t NEUTRAL_CHROMA = 128;

struct Plane {
    uint64_t offset = 0;
    uint32_t rowStride = 0;
    uint32_t pixelStride = 0;
};

enum class Yuv420Layout { NV12, NV21, I420, YV12 };

inline bool Contains(size_t bytes, const Plane &plane, int32_t columns, int32_t rows)
{
    if (columns <= 0 || rows <= 0 || plane.pixelStride == 0 ||
        plane.rowStride < static_cast<uint64_t>(columns - 1) * plane.pixelStride + 1) {
        return false;
    }
    const uint64_t end =
        static_cast<uint64_t>(rows - 1) * plane.rowStride + static_cast<uint64_t>(columns - 1) * plane.pixelStride + 1;
    return plane.offset < bytes && end <= bytes - plane.offset;
}

inline bool NormalizePlane(Plane &plane, size_t bytes, int32_t columns, int32_t rows, uint32_t pixelStride)
{
    if (plane.pixelStride == pixelStride && Contains(bytes, plane, columns, rows)) {
        return true;
    }
    // 部分设备的MapPlanes将行跨度放在columnStride，按像素步长和容量校验后才交换。
    std::swap(plane.rowStride, plane.pixelStride);
    return plane.pixelStride == pixelStride && Contains(bytes, plane, columns, rows);
}

inline bool ResolveYuv420Planes(const Plane *mapped, uint32_t count, Yuv420Layout layout, size_t bytes, int32_t width,
                                int32_t height, Plane &y, Plane &u, Plane &v)
{
    if (mapped == nullptr || count < SEMIPLANAR_PLANE_COUNT || count > YUV_COMPONENT_COUNT || width <= 0 ||
        height <= 0 || width % CHROMA_SUBSAMPLING != 0 || height % CHROMA_SUBSAMPLING != 0) {
        return false;
    }
    y = mapped[0];
    const bool semiplanar = layout == Yuv420Layout::NV12 || layout == Yuv420Layout::NV21;
    const uint32_t chromaPixelStride = semiplanar ? CHROMA_COMPONENTS : 1;
    const int32_t chromaWidth = width / CHROMA_SUBSAMPLING;
    const int32_t chromaHeight = height / CHROMA_SUBSAMPLING;
    u = mapped[1];
    if (!NormalizePlane(y, bytes, width, height, 1) ||
        !NormalizePlane(u, bytes, chromaWidth, chromaHeight, chromaPixelStride)) {
        return false;
    }
    if (count == SEMIPLANAR_PLANE_COUNT) {
        if (!semiplanar) {
            return false;
        }
        v = u;
        ++v.offset;
        if (!Contains(bytes, v, chromaWidth, chromaHeight)) {
            return false;
        }
    } else {
        v = mapped[YUV_COMPONENT_COUNT - 1];
        if (!NormalizePlane(v, bytes, chromaWidth, chromaHeight, chromaPixelStride)) {
            return false;
        }
        if (semiplanar &&
            (u.rowStride != v.rowStride || (u.offset > v.offset ? u.offset - v.offset : v.offset - u.offset) != 1)) {
            return false;
        }
    }
    // 三分量NV21可能按Y/U/V返回，其中U的偏移比V大1；不能再从U偏移推导V。
    const bool uFirst = layout == Yuv420Layout::NV12 || layout == Yuv420Layout::I420;
    if ((u.offset < v.offset) != uFirst) {
        std::swap(u, v);
    }
    return true;
}

// U/V的位置由实际NativeBuffer格式和plane描述确定，不把相机YUV420SP一律当作NV12。
inline bool CopyNv12(const uint8_t *source, size_t bytes, const Plane &y, const Plane &u, const Plane &v,
                     uint8_t *destination, size_t capacity, int32_t width, int32_t height, int32_t stride,
                     int32_t sliceHeight)
{
    if (source == nullptr || destination == nullptr || width <= 0 || height <= 0 || width > MAX_FRAME_WIDTH ||
        height > MAX_FRAME_HEIGHT || width % CHROMA_SUBSAMPLING != 0 || height % CHROMA_SUBSAMPLING != 0 ||
        stride < width || sliceHeight < height || stride > MAX_BUFFER_DIMENSION || sliceHeight > MAX_BUFFER_DIMENSION ||
        stride % CHROMA_SUBSAMPLING != 0 || sliceHeight % CHROMA_SUBSAMPLING != 0) {
        return false;
    }
    const size_t lumaBytes = static_cast<size_t>(stride) * sliceHeight;
    const int32_t chromaWidth = width / CHROMA_SUBSAMPLING;
    const int32_t chromaHeight = height / CHROMA_SUBSAMPLING;
    if (capacity < lumaBytes + lumaBytes / CHROMA_SUBSAMPLING || !Contains(bytes, y, width, height) ||
        !Contains(bytes, u, chromaWidth, chromaHeight) || !Contains(bytes, v, chromaWidth, chromaHeight)) {
        return false;
    }
    std::memset(destination, LIMITED_RANGE_BLACK, lumaBytes);
    std::memset(destination + lumaBytes, NEUTRAL_CHROMA, lumaBytes / CHROMA_SUBSAMPLING);
    for (int32_t row = 0; row < height; ++row) {
        const uint8_t *input = source + y.offset + static_cast<size_t>(row) * y.rowStride;
        uint8_t *output = destination + static_cast<size_t>(row) * stride;
        if (y.pixelStride == 1) {
            std::memcpy(output, input, width);
        } else {
            for (int32_t col = 0; col < width; ++col) {
                output[col] = input[static_cast<size_t>(col) * y.pixelStride];
            }
        }
    }
    for (int32_t row = 0; row < chromaHeight; ++row) {
        const uint8_t *inputU = source + u.offset + static_cast<size_t>(row) * u.rowStride;
        const uint8_t *inputV = source + v.offset + static_cast<size_t>(row) * v.rowStride;
        uint8_t *output = destination + lumaBytes + static_cast<size_t>(row) * stride;
        for (int32_t col = 0; col < chromaWidth; ++col) {
            const size_t column = static_cast<size_t>(col);
            output[column * CHROMA_COMPONENTS] = inputU[column * u.pixelStride];
            output[column * CHROMA_COMPONENTS + 1] = inputV[column * v.pixelStride];
        }
    }
    return true;
}
} // namespace RecorderFrames
#endif
