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

#include "RecorderFrameEffects.h"
#include <algorithm>

namespace RecorderFrames {
void DrawWatermark(uint8_t *data, int32_t width, int32_t height, int32_t stride)
{
    const int32_t textWidth = WATERMARK_GLYPHS * (GLYPH_WIDTH + GLYPH_SPACING) * GLYPH_SCALE;
    const int32_t textHeight = GLYPH_HEIGHT * GLYPH_SCALE;
    if (width < WATERMARK_MARGIN + textWidth || height < WATERMARK_MARGIN + textHeight) {
        return;
    }
    for (int32_t y = 0; y < textHeight; ++y) {
        uint8_t *row = data + static_cast<size_t>(y + WATERMARK_MARGIN) * stride + WATERMARK_MARGIN;
        for (int32_t x = 0; x < textWidth; ++x) {
            const int32_t glyph = x / ((GLYPH_WIDTH + GLYPH_SPACING) * GLYPH_SCALE);
            const int32_t column = (x / GLYPH_SCALE) % (GLYPH_WIDTH + GLYPH_SPACING);
            const bool lit = column < GLYPH_WIDTH &&
                (WATERMARK_FONT[glyph][y / GLYPH_SCALE] & (1U << (GLYPH_WIDTH - column - 1))) != 0;
            row[x] = lit ? WATERMARK_LUMA : LIMITED_RANGE_BLACK;
        }
    }
}

bool ApplyEffects(uint8_t *data, size_t capacity, int32_t width, int32_t height,
    int32_t stride, int32_t sliceHeight, bool grayscale, bool watermark)
{
    if (data == nullptr || width <= 0 || height <= 0 || stride < width || sliceHeight < height ||
        stride > MAX_BUFFER_DIMENSION || sliceHeight > MAX_BUFFER_DIMENSION ||
        width % CHROMA_SUBSAMPLING != 0 || height % CHROMA_SUBSAMPLING != 0 ||
        stride % CHROMA_SUBSAMPLING != 0 || sliceHeight % CHROMA_SUBSAMPLING != 0) {
        return false;
    }
    const size_t lumaBytes = static_cast<size_t>(stride) * sliceHeight;
    if (capacity < lumaBytes + lumaBytes / CHROMA_SUBSAMPLING) {
        return false;
    }
    if (grayscale) {
        uint8_t *chroma = data + lumaBytes;
        for (int32_t row = 0; row < height / CHROMA_SUBSAMPLING; ++row) {
            std::fill_n(chroma + static_cast<size_t>(row) * stride, width, NEUTRAL_CHROMA);
        }
    }
    if (watermark) {
        DrawWatermark(data, width, height, stride);
    }
    return true;
}
} // namespace RecorderFrames
