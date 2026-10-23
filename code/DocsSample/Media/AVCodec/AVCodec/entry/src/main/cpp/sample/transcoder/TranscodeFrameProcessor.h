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

#ifndef AVCODEC_TRANSCODE_FRAME_PROCESSOR_H
#define AVCODEC_TRANSCODE_FRAME_PROCESSOR_H

#include <algorithm>
#include <cstddef>
#include <cstdint>
#include <cstring>

namespace TranscodeFrames {
enum class Chroma { NV12, NV21, I420 };
struct Layout {
    int32_t width = 0;
    int32_t height = 0;
    int32_t stride = 0;
    int32_t sliceHeight = 0;
    Chroma chroma = Chroma::NV12;
};

inline size_t RequiredBytes(const Layout &layout)
{
    if (layout.width <= 0 || layout.height <= 0 || layout.stride < layout.width ||
        layout.sliceHeight < layout.height || layout.width % 2 != 0 || layout.height % 2 != 0 ||
        layout.stride % 2 != 0 || layout.sliceHeight % 2 != 0) {
        return 0;
    }
    const uint64_t bytes = static_cast<uint64_t>(layout.stride) * layout.sliceHeight * 3 / 2;
    return bytes > SIZE_MAX ? 0 : static_cast<size_t>(bytes);
}

inline bool FitSize(int32_t sourceWidth, int32_t sourceHeight, int32_t longEdge,
    int32_t &targetWidth, int32_t &targetHeight)
{
    if (sourceWidth <= 0 || sourceHeight <= 0 || sourceWidth > 16384 || sourceHeight > 16384 || longEdge < 0) {
        return false;
    }
    const int32_t sourceEdge = std::max(sourceWidth, sourceHeight);
    const int32_t targetEdge = longEdge == 0 ? sourceEdge : std::min(longEdge, sourceEdge);
    targetWidth = std::max(2, static_cast<int32_t>(static_cast<int64_t>(sourceWidth) * targetEdge / sourceEdge) & ~1);
    targetHeight = std::max(2, static_cast<int32_t>(static_cast<int64_t>(sourceHeight) * targetEdge / sourceEdge) & ~1);
    return true;
}

// 两侧 stride、sliceHeight 分别来自各自的 codec。只拷贝有效像素，不能假设两块 Buffer 的填充相同。
inline bool Process(const uint8_t *source, size_t sourceCapacity, const Layout &input,
    uint8_t *destination, size_t destinationCapacity, const Layout &output, bool grayscale)
{
    const size_t inputBytes = RequiredBytes(input);
    const size_t outputBytes = RequiredBytes(output);
    if (source == nullptr || destination == nullptr || inputBytes == 0 || outputBytes == 0 ||
        inputBytes > sourceCapacity || outputBytes > destinationCapacity || output.chroma != Chroma::NV12) {
        return false;
    }
    const size_t outputYBytes = static_cast<size_t>(output.stride) * output.sliceHeight;
    std::memset(destination, 16, outputYBytes);
    std::memset(destination + outputYBytes, 128, outputBytes - outputYBytes);
    for (int32_t y = 0; y < output.height; ++y) {
        const int32_t sourceY = static_cast<int64_t>(y) * input.height / output.height;
        const uint8_t *row = source + static_cast<size_t>(sourceY) * input.stride;
        uint8_t *target = destination + static_cast<size_t>(y) * output.stride;
        if (input.width == output.width) {
            std::memcpy(target, row, output.width);
        } else {
            for (int32_t x = 0; x < output.width; ++x) {
                target[x] = row[static_cast<int64_t>(x) * input.width / output.width];
            }
        }
    }
    if (grayscale) {
        return true;
    }
    const uint8_t *chroma = source + static_cast<size_t>(input.stride) * input.sliceHeight;
    const size_t planeBytes = static_cast<size_t>(input.stride / 2) * (input.sliceHeight / 2);
    for (int32_t y = 0; y < output.height / 2; ++y) {
        const int32_t sourceY = static_cast<int64_t>(y) * input.height / output.height;
        uint8_t *target = destination + outputYBytes + static_cast<size_t>(y) * output.stride;
        for (int32_t x = 0; x < output.width / 2; ++x) {
            const int32_t sourceX = static_cast<int64_t>(x) * input.width / output.width;
            if (input.chroma == Chroma::I420) {
                const size_t offset = static_cast<size_t>(sourceY) * (input.stride / 2) + sourceX;
                target[x * 2] = chroma[offset];
                target[x * 2 + 1] = chroma[planeBytes + offset];
            } else {
                const size_t offset = static_cast<size_t>(sourceY) * input.stride + sourceX * 2;
                target[x * 2] = chroma[offset + (input.chroma == Chroma::NV21 ? 1 : 0)];
                target[x * 2 + 1] = chroma[offset + (input.chroma == Chroma::NV21 ? 0 : 1)];
            }
        }
    }
    return true;
}
} // namespace TranscodeFrames
#endif
