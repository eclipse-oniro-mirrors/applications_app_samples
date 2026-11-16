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

#ifndef AVCODEC_RECORDER_FRAME_EFFECTS_H
#define AVCODEC_RECORDER_FRAME_EFFECTS_H

#include <cstddef>
#include <cstdint>
#include "RecorderFrameCopy.h"

namespace RecorderFrames {
constexpr int32_t WATERMARK_MARGIN = 16;
constexpr int32_t GLYPH_WIDTH = 5;
constexpr int32_t GLYPH_HEIGHT = 7;
constexpr int32_t GLYPH_SCALE = 3;
constexpr int32_t GLYPH_SPACING = 1;
constexpr int32_t WATERMARK_GLYPHS = 7;
constexpr uint8_t WATERMARK_LUMA = 235;
// AVCODEC的5x7点阵；每行低5位分别对应一行像素。
constexpr uint8_t WATERMARK_FONT[WATERMARK_GLYPHS][GLYPH_HEIGHT] = {
    {0x0E, 0x11, 0x11, 0x1F, 0x11, 0x11, 0x11},
    {0x11, 0x11, 0x11, 0x11, 0x11, 0x0A, 0x04},
    {0x0E, 0x11, 0x10, 0x10, 0x10, 0x11, 0x0E},
    {0x0E, 0x11, 0x11, 0x11, 0x11, 0x11, 0x0E},
    {0x1E, 0x11, 0x11, 0x11, 0x11, 0x11, 0x1E},
    {0x1F, 0x10, 0x10, 0x1E, 0x10, 0x10, 0x1F},
    {0x0E, 0x11, 0x10, 0x10, 0x10, 0x11, 0x0E}
};

void DrawWatermark(uint8_t *data, int32_t width, int32_t height, int32_t stride);

bool ApplyEffects(uint8_t *data, size_t capacity, int32_t width, int32_t height,
    int32_t stride, int32_t sliceHeight, bool grayscale, bool watermark);
} // namespace RecorderFrames

#endif
