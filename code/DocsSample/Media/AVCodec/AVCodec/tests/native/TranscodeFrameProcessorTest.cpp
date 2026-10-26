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

#include <array>
#include <cstdlib>
#include <iostream>
#include "../../entry/src/main/cpp/sample/transcoder/TranscodeFrameProcessor.h"

namespace {
using namespace TranscodeFrames;
constexpr int32_t FULL_HD_WIDTH = 1920;
constexpr int32_t FULL_HD_HEIGHT = 1080;
constexpr int32_t TARGET_EDGE = 720;
constexpr int32_t FITTED_SHORT_EDGE = 404;
constexpr int32_t SMALL_WIDTH = 640;
constexpr int32_t SMALL_HEIGHT = 360;
constexpr int32_t CHROMA_STEP = 2;
constexpr int32_t TEST_WIDTH = 4;
constexpr int32_t INPUT_STRIDE = 6;
constexpr int32_t OUTPUT_STRIDE = 8;
constexpr uint8_t LUMA_PADDING = 16;
constexpr uint8_t CHROMA_PADDING = 128;
constexpr uint8_t SOURCE_PADDING = 255;
constexpr uint8_t OUTPUT_CANARY = 99;
constexpr uint8_t BOUNDS_CANARY = 77;
constexpr size_t SMALL_FRAME_BYTES = CHROMA_STEP * CHROMA_STEP + CHROMA_STEP;
constexpr size_t PLANAR_FRAME_BYTES = TEST_WIDTH * TEST_WIDTH + TEST_WIDTH * CHROMA_STEP;
constexpr size_t INPUT_FRAME_BYTES = INPUT_STRIDE * TEST_WIDTH + INPUT_STRIDE * CHROMA_STEP;
constexpr size_t OUTPUT_FRAME_BYTES = OUTPUT_STRIDE * TEST_WIDTH + OUTPUT_STRIDE * CHROMA_STEP;
constexpr size_t INPUT_CHROMA_OFFSET = INPUT_STRIDE * TEST_WIDTH;
constexpr size_t OUTPUT_CHROMA_OFFSET = OUTPUT_STRIDE * TEST_WIDTH;

void Require(bool condition, const char *message)
{
    if (!condition) {
        std::cerr << message << '\n';
        std::exit(EXIT_FAILURE);
    }
}

void TestFit()
{
    int32_t width = 0;
    int32_t height = 0;
    Require(FitSize(FULL_HD_WIDTH, FULL_HD_HEIGHT, TARGET_EDGE, width, height) &&
        width == TARGET_EDGE && height == FITTED_SHORT_EDGE, "Landscape fit");
    Require(FitSize(FULL_HD_HEIGHT, FULL_HD_WIDTH, TARGET_EDGE, width, height) &&
        width == FITTED_SHORT_EDGE && height == TARGET_EDGE, "Portrait fit");
    Require(FitSize(SMALL_WIDTH, SMALL_HEIGHT, FULL_HD_WIDTH, width, height) &&
        width == SMALL_WIDTH && height == SMALL_HEIGHT, "Do not upscale");
    Require(FitSize(FULL_HD_WIDTH, FULL_HD_HEIGHT, 0, width, height) &&
        width == FULL_HD_WIDTH && height == FULL_HD_HEIGHT, "Original size");
    Require(!FitSize(0, FULL_HD_HEIGHT, TARGET_EDGE, width, height), "Reject invalid dimensions");
    Require(!FitSize(FULL_HD_WIDTH, 0, TARGET_EDGE, width, height), "Reject zero height");
    Require(!FitSize(0, 0, TARGET_EDGE, width, height), "Reject zero source edge");
    Require(width == FULL_HD_WIDTH && height == FULL_HD_HEIGHT, "Invalid dimensions preserve output size");
}

void TestChromaAndPadding()
{
    // Four visible luma pixels per row, with two padding bytes and two padding rows.
    const Layout input { TEST_WIDTH, CHROMA_STEP, INPUT_STRIDE, TEST_WIDTH, Chroma::NV21 };
    const Layout output { TEST_WIDTH, CHROMA_STEP, OUTPUT_STRIDE, TEST_WIDTH, Chroma::NV12 };
    std::array<uint8_t, INPUT_FRAME_BYTES> source {};
    source.fill(SOURCE_PADDING);
    const std::array<uint8_t, OUTPUT_STRIDE> luma { 1, 2, 3, 4, 5, 6, 7, 8 };
    const std::array<uint8_t, TEST_WIDTH> vu { 91, 41, 92, 42 };
    const std::array<uint8_t, TEST_WIDTH> uv { 41, 91, 42, 92 };
    for (size_t x = 0; x < TEST_WIDTH; ++x) {
        source[x] = luma[x];
        source[INPUT_STRIDE + x] = luma[TEST_WIDTH + x];
        source[INPUT_CHROMA_OFFSET + x] = vu[x];
    }
    std::array<uint8_t, OUTPUT_FRAME_BYTES + 1> destination {};
    destination.fill(OUTPUT_CANARY);
    Require(Process(source.data(), source.size(), input, destination.data(), OUTPUT_FRAME_BYTES, output, false),
        "NV21 processing");
    for (size_t x = 0; x < TEST_WIDTH; ++x) {
        Require(destination[x] == luma[x] && destination[OUTPUT_STRIDE + x] == luma[TEST_WIDTH + x],
            "Copy visible rows with independent strides");
        Require(destination[OUTPUT_CHROMA_OFFSET + x] == uv[x], "Convert VU to UV after slice-height padding");
    }
    Require(destination[TEST_WIDTH] == LUMA_PADDING && destination[CHROMA_STEP * OUTPUT_STRIDE] == LUMA_PADDING &&
        destination[OUTPUT_CHROMA_OFFSET - 1] == LUMA_PADDING, "Initialize luma padding");
    Require(destination[OUTPUT_CHROMA_OFFSET + TEST_WIDTH] == CHROMA_PADDING &&
        destination[OUTPUT_FRAME_BYTES - 1] == CHROMA_PADDING && destination.back() == OUTPUT_CANARY,
        "Chroma padding and canary");
    Require(Process(source.data(), source.size(), input, destination.data(), OUTPUT_FRAME_BYTES, output, true),
        "Grayscale");
    Require(destination[0] == luma[0] && destination[OUTPUT_CHROMA_OFFSET] == CHROMA_PADDING &&
        destination[OUTPUT_CHROMA_OFFSET + TEST_WIDTH - 1] == CHROMA_PADDING, "Grayscale keeps luma");
}

void TestPlanarAndScaling()
{
    const Layout input { TEST_WIDTH, TEST_WIDTH, TEST_WIDTH, TEST_WIDTH, Chroma::I420 };
    const Layout output { CHROMA_STEP, CHROMA_STEP, CHROMA_STEP, CHROMA_STEP, Chroma::NV12 };
    const std::array<uint8_t, PLANAR_FRAME_BYTES> source {
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
        51, 52, 53, 54, 101, 102, 103, 104
    };
    std::array<uint8_t, SMALL_FRAME_BYTES> destination {};
    Require(Process(source.data(), source.size(), input, destination.data(), destination.size(), output, false),
        "Planar downscale");
    const std::array<uint8_t, SMALL_FRAME_BYTES> scaled { 1, 3, 9, 11, 51, 101 };
    Require(destination == scaled, "Downscaled pixels and U/V planes");

    const Layout padded { CHROMA_STEP, CHROMA_STEP, TEST_WIDTH, TEST_WIDTH, Chroma::I420 };
    std::array<uint8_t, PLANAR_FRAME_BYTES> paddedSource {};
    const std::array<uint8_t, SMALL_FRAME_BYTES> expected { 11, 12, 13, 14, 61, 111 };
    for (size_t x = 0; x < CHROMA_STEP; ++x) {
        paddedSource[x] = expected[x];
        paddedSource[TEST_WIDTH + x] = expected[CHROMA_STEP + x];
    }
    paddedSource[TEST_WIDTH * TEST_WIDTH] = expected[TEST_WIDTH];
    paddedSource[TEST_WIDTH * TEST_WIDTH + TEST_WIDTH] = expected[TEST_WIDTH + 1];
    Require(Process(paddedSource.data(), paddedSource.size(), padded,
        destination.data(), destination.size(), output, false), "Padded I420 input");
    Require(destination == expected, "Planar slice offsets");
}

void TestBounds()
{
    const Layout layout { CHROMA_STEP, CHROMA_STEP, CHROMA_STEP, CHROMA_STEP, Chroma::NV12 };
    std::array<uint8_t, SMALL_FRAME_BYTES> source {};
    std::array<uint8_t, SMALL_FRAME_BYTES> target {};
    target.fill(BOUNDS_CANARY);
    const auto untouched = target;
    Require(!Process(source.data(), source.size() - 1, layout, target.data(), target.size(), layout, false),
        "Short source");
    Require(!Process(source.data(), source.size(), layout, target.data(), target.size() - 1, layout, false),
        "Short destination");
    Require(!Process(nullptr, source.size(), layout, target.data(), target.size(), layout, false), "Null source");
    Require(target == untouched, "Validate before writing");
    Require(RequiredBytes({ CHROMA_STEP, CHROMA_STEP, 1, CHROMA_STEP, Chroma::NV12 }) == 0, "Short stride");
    Require(RequiredBytes({ CHROMA_STEP, CHROMA_STEP, CHROMA_STEP, 1, Chroma::NV12 }) == 0, "Short slice height");
    Require(RequiredBytes({ CHROMA_STEP + 1, CHROMA_STEP, TEST_WIDTH, CHROMA_STEP, Chroma::NV12 }) == 0,
        "Odd visible dimensions");
}

void TestSameSizeNv12()
{
    const Layout input { TEST_WIDTH, CHROMA_STEP, INPUT_STRIDE, TEST_WIDTH, Chroma::NV12 };
    const Layout output { TEST_WIDTH, CHROMA_STEP, OUTPUT_STRIDE, TEST_WIDTH, Chroma::NV12 };
    std::array<uint8_t, INPUT_FRAME_BYTES> source {};
    source.fill(SOURCE_PADDING);
    const std::array<uint8_t, TEST_WIDTH> uv { 41, 91, 42, 92 };
    for (size_t x = 0; x < TEST_WIDTH; ++x) {
        source[x] = static_cast<uint8_t>(x + 1);
        source[INPUT_STRIDE + x] = static_cast<uint8_t>(x + 5);
        source[INPUT_CHROMA_OFFSET + x] = uv[x];
    }
    std::array<uint8_t, OUTPUT_FRAME_BYTES + 1> destination {};
    destination.fill(OUTPUT_CANARY);
    Require(Process(source.data(), source.size(), input, destination.data(), OUTPUT_FRAME_BYTES, output, false),
        "Same-size NV12 fast path");
    for (size_t x = 0; x < TEST_WIDTH; ++x) {
        Require(destination[x] == x + 1 && destination[OUTPUT_STRIDE + x] == x + 5, "Fast luma copy");
        Require(destination[OUTPUT_CHROMA_OFFSET + x] == uv[x], "Fast chroma copy");
    }
    Require(destination[TEST_WIDTH] == LUMA_PADDING && destination[OUTPUT_CHROMA_OFFSET - 1] == LUMA_PADDING,
        "Only initialize luma padding");
    Require(destination[OUTPUT_CHROMA_OFFSET + TEST_WIDTH] == CHROMA_PADDING &&
        destination[OUTPUT_FRAME_BYTES - 1] == CHROMA_PADDING && destination.back() == OUTPUT_CANARY,
        "Fast chroma padding and canary");
}
}

int main()
{
    TestFit();
    TestChromaAndPadding();
    TestPlanarAndScaling();
    TestBounds();
    TestSameSizeNv12();
    std::cout << "TranscodeFrameProcessor tests passed\n";
}
