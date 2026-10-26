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

#include "TranscodeFrameProcessor.h"
#include <algorithm>

namespace TranscodeFrames {
namespace {
constexpr int32_t CHROMA_SUBSAMPLING = 2;
constexpr int32_t MAX_DIMENSION = 16384;
constexpr uint8_t BLACK_LUMA = 16;
constexpr uint8_t NEUTRAL_CHROMA = 128;

void ProcessLuma(const uint8_t *source, const Layout &input, uint8_t *destination, const Layout &output)
{
    for (int32_t y = 0; y < output.height; ++y) {
        const int32_t sourceY = static_cast<int64_t>(y) * input.height / output.height;
        const uint8_t *row = source + static_cast<size_t>(sourceY) * input.stride;
        uint8_t *target = destination + static_cast<size_t>(y) * output.stride;
        if (input.width == output.width) {
            std::copy_n(row, output.width, target);
        } else {
            for (int32_t x = 0; x < output.width; ++x) {
                target[x] = row[static_cast<int64_t>(x) * input.width / output.width];
            }
        }
    }
}

void ProcessChroma(const uint8_t *source, const Layout &input, uint8_t *destination, const Layout &output)
{
    const size_t planeBytes = static_cast<size_t>(input.stride / CHROMA_SUBSAMPLING) *
        (input.sliceHeight / CHROMA_SUBSAMPLING);
    for (int32_t y = 0; y < output.height / CHROMA_SUBSAMPLING; ++y) {
        const int32_t sourceY = static_cast<int64_t>(y) * input.height / output.height;
        uint8_t *target = destination + static_cast<size_t>(y) * output.stride;
        if (input.chroma == Chroma::NV12 && input.width == output.width && input.height == output.height) {
            std::copy_n(source + static_cast<size_t>(y) * input.stride, output.width, target);
            continue;
        }
        for (int32_t x = 0; x < output.width / CHROMA_SUBSAMPLING; ++x) {
            const int32_t sourceX = static_cast<int64_t>(x) * input.width / output.width;
            const int32_t targetX = x * CHROMA_SUBSAMPLING;
            if (input.chroma == Chroma::I420) {
                const size_t offset = static_cast<size_t>(sourceY) * (input.stride / CHROMA_SUBSAMPLING) + sourceX;
                target[targetX] = source[offset];
                target[targetX + 1] = source[planeBytes + offset];
            } else {
                const size_t offset = static_cast<size_t>(sourceY) * input.stride + sourceX * CHROMA_SUBSAMPLING;
                target[targetX] = source[offset + (input.chroma == Chroma::NV21 ? 1 : 0)];
                target[targetX + 1] = source[offset + (input.chroma == Chroma::NV21 ? 0 : 1)];
            }
        }
    }
}
} // namespace

size_t RequiredBytes(const Layout &layout)
{
    if (layout.width <= 0 || layout.height <= 0 || layout.stride < layout.width ||
        layout.sliceHeight < layout.height || layout.width % CHROMA_SUBSAMPLING != 0 ||
        layout.height % CHROMA_SUBSAMPLING != 0 || layout.stride % CHROMA_SUBSAMPLING != 0 ||
        layout.sliceHeight % CHROMA_SUBSAMPLING != 0) {
        return 0;
    }
    const uint64_t yBytes = static_cast<uint64_t>(layout.stride) * layout.sliceHeight;
    const uint64_t bytes = yBytes + yBytes / CHROMA_SUBSAMPLING;
    return bytes > SIZE_MAX ? 0 : static_cast<size_t>(bytes);
}

bool FitSize(int32_t sourceWidth, int32_t sourceHeight, int32_t longEdge,
    int32_t &targetWidth, int32_t &targetHeight)
{
    if (sourceWidth <= 0 || sourceHeight <= 0 || sourceWidth > MAX_DIMENSION ||
        sourceHeight > MAX_DIMENSION || longEdge < 0) {
        return false;
    }
    const int32_t sourceEdge = sourceWidth >= sourceHeight ? sourceWidth : sourceHeight;
    if (sourceEdge <= 0) {
        return false;
    }
    const int32_t targetEdge = longEdge == 0 ? sourceEdge : std::min(longEdge, sourceEdge);
    const int64_t widthNumerator = static_cast<int64_t>(sourceWidth) * targetEdge;
    const int64_t heightNumerator = static_cast<int64_t>(sourceHeight) * targetEdge;
    const int32_t fittedWidth = static_cast<int32_t>(widthNumerator / sourceEdge);
    const int32_t fittedHeight = static_cast<int32_t>(heightNumerator / sourceEdge);
    targetWidth = std::max(CHROMA_SUBSAMPLING, fittedWidth & ~1);
    targetHeight = std::max(CHROMA_SUBSAMPLING, fittedHeight & ~1);
    return true;
}

bool Process(const uint8_t *source, size_t sourceCapacity, const Layout &input,
    uint8_t *destination, size_t destinationCapacity, const Layout &output, bool grayscale)
{
    const size_t inputBytes = RequiredBytes(input);
    const size_t outputBytes = RequiredBytes(output);
    if (source == nullptr || destination == nullptr || inputBytes == 0 || outputBytes == 0 ||
        inputBytes > sourceCapacity || outputBytes > destinationCapacity || output.chroma != Chroma::NV12) {
        return false;
    }
    const size_t outputYBytes = static_cast<size_t>(output.stride) * output.sliceHeight;
    // Write visible pixels once; initialize only padding (and all UV for grayscale).
    for (int32_t y = 0; y < output.height; ++y) {
        std::fill_n(destination + static_cast<size_t>(y) * output.stride + output.width,
            output.stride - output.width, BLACK_LUMA);
    }
    std::fill(destination + static_cast<size_t>(output.height) * output.stride,
        destination + outputYBytes, BLACK_LUMA);
    uint8_t *uv = destination + outputYBytes;
    const int32_t visibleRows = grayscale ? 0 : output.height / CHROMA_SUBSAMPLING;
    for (int32_t y = 0; y < visibleRows; ++y) {
        std::fill_n(uv + static_cast<size_t>(y) * output.stride + output.width,
            output.stride - output.width, NEUTRAL_CHROMA);
    }
    std::fill(uv + static_cast<size_t>(visibleRows) * output.stride,
        destination + outputBytes, NEUTRAL_CHROMA);
    ProcessLuma(source, input, destination, output);
    if (!grayscale) {
        ProcessChroma(source + static_cast<size_t>(input.stride) * input.sliceHeight, input,
            destination + outputYBytes, output);
    }
    return true;
}
} // namespace TranscodeFrames
