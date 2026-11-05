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

bool ResolveYuv420Planes(const Plane *mapped, uint32_t count, Yuv420Layout layout, size_t bytes, int32_t width,
                        int32_t height, Plane &y, Plane &u, Plane &v);

// U/V的位置由实际NativeBuffer格式和plane描述确定，不把相机YUV420SP一律当作NV12。
bool CopyNv12(const uint8_t *source, size_t bytes, const Plane &y, const Plane &u, const Plane &v,
              uint8_t *destination, size_t capacity, int32_t width, int32_t height, int32_t stride,
              int32_t sliceHeight);
} // namespace RecorderFrames
#endif
