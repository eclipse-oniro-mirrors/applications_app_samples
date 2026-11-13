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

#include <cstdlib>
#include <iostream>
#include <vector>
#include "../../entry/src/main/cpp/sample/recorder/input/video/RecorderFrameEffects.h"

namespace {
constexpr int32_t WIDTH = 160;
constexpr int32_t HEIGHT = 64;
constexpr int32_t STRIDE = 176;
constexpr int32_t SLICE_HEIGHT = 80;
constexpr size_t LUMA_BYTES = STRIDE * SLICE_HEIGHT;
constexpr size_t FRAME_BYTES = LUMA_BYTES * 3 / 2;
constexpr uint8_t SENTINEL = 91;

void CheckEffects(bool passed)
{
    if (!passed) { std::cerr << "Recorder effect changed unexpected pixels" << std::endl; std::exit(EXIT_FAILURE); }
}
}

int main()
{
    std::vector<uint8_t> frame(FRAME_BYTES + 1, SENTINEL);
    auto apply = [&](size_t capacity, bool gray, bool mark) {
        return RecorderFrames::ApplyEffects(frame.data(), capacity, WIDTH, HEIGHT, STRIDE, SLICE_HEIGHT, gray, mark);
    };
    CheckEffects(!apply(FRAME_BYTES - 1, true, true));
    CheckEffects(std::all_of(frame.begin(), frame.end(), [](uint8_t byte) { return byte == SENTINEL; }));
    CheckEffects(apply(FRAME_BYTES, true, false));
    for (size_t offset = 0; offset < frame.size(); ++offset) {
        const size_t chromaOffset = offset >= LUMA_BYTES ? offset - LUMA_BYTES : FRAME_BYTES;
        const bool activeChroma = offset >= LUMA_BYTES && chromaOffset / STRIDE < HEIGHT / 2 &&
            chromaOffset % STRIDE < WIDTH;
        CheckEffects(frame[offset] == (activeChroma ? RecorderFrames::NEUTRAL_CHROMA : SENTINEL));
    }
    std::fill(frame.begin(), frame.end(), SENTINEL);
    CheckEffects(apply(FRAME_BYTES, false, true));
    size_t litPixels = 0;
    for (size_t offset = 0; offset < frame.size(); ++offset) {
        const size_t row = offset / STRIDE;
        const size_t column = offset % STRIDE;
        const bool inside = row >= RecorderFrames::WATERMARK_MARGIN &&
            row < RecorderFrames::WATERMARK_MARGIN + RecorderFrames::GLYPH_HEIGHT * RecorderFrames::GLYPH_SCALE &&
            column >= RecorderFrames::WATERMARK_MARGIN &&
            column < RecorderFrames::WATERMARK_MARGIN + RecorderFrames::WATERMARK_GLYPHS *
                (RecorderFrames::GLYPH_WIDTH + RecorderFrames::GLYPH_SPACING) * RecorderFrames::GLYPH_SCALE;
        if (!inside) { CheckEffects(frame[offset] == SENTINEL); }
        if (frame[offset] == RecorderFrames::WATERMARK_LUMA) { ++litPixels; }
    }
    CheckEffects(litPixels > 0);
    CheckEffects(!RecorderFrames::ApplyEffects(frame.data(), FRAME_BYTES, WIDTH - 1, HEIGHT,
        STRIDE, SLICE_HEIGHT, true, false));
    std::vector<uint8_t> tiny(6, SENTINEL);
    CheckEffects(RecorderFrames::ApplyEffects(tiny.data(), tiny.size(), 2, 2, 2, 2, false, true));
    CheckEffects(std::all_of(tiny.begin(), tiny.end(), [](uint8_t byte) { return byte == SENTINEL; }));
    std::cout << "Recorder frame effects passed" << std::endl;
}
