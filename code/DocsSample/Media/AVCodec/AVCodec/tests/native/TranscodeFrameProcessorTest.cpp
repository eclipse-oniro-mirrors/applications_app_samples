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
    Require(FitSize(1920, 1080, 720, width, height) && width == 720 && height == 404, "Landscape fit");
    Require(FitSize(1080, 1920, 720, width, height) && width == 404 && height == 720, "Portrait fit");
    Require(FitSize(640, 360, 1920, width, height) && width == 640 && height == 360, "Do not upscale");
    Require(FitSize(1920, 1080, 0, width, height) && width == 1920 && height == 1080, "Original size");
    Require(!FitSize(0, 1080, 720, width, height), "Reject invalid dimensions");
}

void TestChromaAndPadding()
{
    // Four visible luma pixels per row, with two padding bytes and two padding rows.
    const Layout input { 4, 2, 6, 4, Chroma::NV21 };
    const Layout output { 4, 2, 8, 4, Chroma::NV12 };
    std::array<uint8_t, 36> source {};
    source.fill(255);
    source[0] = 1; source[1] = 2; source[2] = 3; source[3] = 4;
    source[6] = 5; source[7] = 6; source[8] = 7; source[9] = 8;
    source[24] = 91; source[25] = 41; source[26] = 92; source[27] = 42;
    std::array<uint8_t, 49> destination {};
    destination.fill(99);
    Require(Process(source.data(), source.size(), input, destination.data(), 48, output, false), "NV21 processing");
    Require(destination[0] == 1 && destination[3] == 4 && destination[8] == 5 && destination[11] == 8,
        "Copy visible rows with independent strides");
    Require(destination[4] == 16 && destination[16] == 16 && destination[31] == 16, "Initialize luma padding");
    Require(destination[32] == 41 && destination[33] == 91 && destination[34] == 42 && destination[35] == 92,
        "Convert VU to UV after slice-height padding");
    Require(destination[36] == 128 && destination[47] == 128 && destination[48] == 99, "Chroma padding and canary");
    Require(Process(source.data(), source.size(), input, destination.data(), 48, output, true), "Grayscale");
    Require(destination[0] == 1 && destination[32] == 128 && destination[35] == 128, "Grayscale keeps luma");
}

void TestPlanarAndScaling()
{
    const Layout input { 4, 4, 4, 4, Chroma::I420 };
    const Layout output { 2, 2, 2, 2, Chroma::NV12 };
    const std::array<uint8_t, 24> source {
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,
        51, 52, 53, 54, 101, 102, 103, 104
    };
    std::array<uint8_t, 6> destination {};
    Require(Process(source.data(), source.size(), input, destination.data(), destination.size(), output, false),
        "Planar downscale");
    Require(destination == std::array<uint8_t, 6> { 1, 3, 9, 11, 51, 101 }, "Downscaled pixels and U/V planes");

    const Layout padded { 2, 2, 4, 4, Chroma::I420 };
    std::array<uint8_t, 24> paddedSource {};
    paddedSource[0] = 11; paddedSource[1] = 12; paddedSource[4] = 13; paddedSource[5] = 14;
    paddedSource[16] = 61; paddedSource[20] = 111;
    Require(Process(paddedSource.data(), paddedSource.size(), padded, destination.data(), 6, output, false),
        "Padded I420 input");
    Require(destination == std::array<uint8_t, 6> { 11, 12, 13, 14, 61, 111 }, "Planar slice offsets");
}

void TestBounds()
{
    const Layout layout { 2, 2, 2, 2, Chroma::NV12 };
    std::array<uint8_t, 6> source {};
    std::array<uint8_t, 6> target {};
    target.fill(77);
    Require(!Process(source.data(), 5, layout, target.data(), 6, layout, false), "Short source");
    Require(!Process(source.data(), 6, layout, target.data(), 5, layout, false), "Short destination");
    Require(!Process(nullptr, 6, layout, target.data(), 6, layout, false), "Null source");
    Require(target == std::array<uint8_t, 6> { 77, 77, 77, 77, 77, 77 }, "Validate before writing");
    Require(RequiredBytes({ 2, 2, 1, 2, Chroma::NV12 }) == 0, "Short stride");
    Require(RequiredBytes({ 2, 2, 2, 1, Chroma::NV12 }) == 0, "Short slice height");
    Require(RequiredBytes({ 3, 2, 4, 2, Chroma::NV12 }) == 0, "Odd visible dimensions");
}
}

int main()
{
    TestFit();
    TestChromaAndPadding();
    TestPlanarAndScaling();
    TestBounds();
    std::cout << "TranscodeFrameProcessor tests passed\n";
}
