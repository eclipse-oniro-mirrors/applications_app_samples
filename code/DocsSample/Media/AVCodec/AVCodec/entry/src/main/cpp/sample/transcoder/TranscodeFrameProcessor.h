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

#include <cstddef>
#include <cstdint>

namespace TranscodeFrames {
enum class Chroma { NV12, NV21, I420 };
struct Layout {
    int32_t width = 0;
    int32_t height = 0;
    int32_t stride = 0;
    int32_t sliceHeight = 0;
    Chroma chroma = Chroma::NV12;
};

size_t RequiredBytes(const Layout &layout);
bool FitSize(int32_t sourceWidth, int32_t sourceHeight, int32_t longEdge,
    int32_t &targetWidth, int32_t &targetHeight);

// 两侧 stride、sliceHeight 分别来自各自的 codec。只拷贝有效像素，不能假设两块 Buffer 的填充相同。
bool Process(const uint8_t *source, size_t sourceCapacity, const Layout &input,
    uint8_t *destination, size_t destinationCapacity, const Layout &output, bool grayscale);
} // namespace TranscodeFrames
#endif
