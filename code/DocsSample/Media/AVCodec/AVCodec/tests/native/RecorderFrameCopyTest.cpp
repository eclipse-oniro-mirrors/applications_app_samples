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
#include <iterator>
#include <limits>
#include "../../entry/src/main/cpp/sample/recorder/RecorderFrameCopy.h"

namespace
{
using RecorderFrames::CopyNv12;
using RecorderFrames::Plane;
using RecorderFrames::ResolveYuv420Planes;
using RecorderFrames::Yuv420Layout;

void CheckTest(bool passed, const char *expression, int32_t line)
{
    if (!passed) {
        std::cerr << "Frame copy check failed at line " << line << ": " << expression << std::endl;
        std::exit(EXIT_FAILURE);
    }
}

// 测试检查在Release构建中同样执行，复制和布局解析不会随NDEBUG被移除。
#define CHECK_TEST(expression) CheckTest((expression), #expression, __LINE__)

// 4x4有效图像：相机每行6字节，编码器每行8字节并为Y平面分配6行。
constexpr int32_t FRAME_WIDTH = 4;
constexpr int32_t FRAME_HEIGHT = 4;
constexpr int32_t CAMERA_STRIDE = 6;
constexpr int32_t ENCODER_STRIDE = 8;
constexpr int32_t ENCODER_SLICE_HEIGHT = 6;
constexpr int32_t CHROMA_SUBSAMPLING = 2;
constexpr uint32_t CHROMA_COMPONENTS = 2;
constexpr int32_t CHROMA_HEIGHT = FRAME_HEIGHT / CHROMA_SUBSAMPLING;
constexpr size_t CAMERA_LUMA_BYTES = static_cast<size_t>(CAMERA_STRIDE) * FRAME_HEIGHT;
constexpr size_t CAMERA_BYTES = CAMERA_LUMA_BYTES + CAMERA_LUMA_BYTES / CHROMA_SUBSAMPLING;
constexpr size_t ENCODER_LUMA_BYTES = static_cast<size_t>(ENCODER_STRIDE) * ENCODER_SLICE_HEIGHT;
constexpr size_t ENCODER_BYTES = ENCODER_LUMA_BYTES + ENCODER_LUMA_BYTES / CHROMA_SUBSAMPLING;
constexpr size_t FIRST_CHROMA_OFFSET = CAMERA_LUMA_BYTES;
constexpr size_t SECOND_CHROMA_OFFSET = FIRST_CHROMA_OFFSET + 1;
constexpr int32_t PLANAR_CHROMA_STRIDE = CAMERA_STRIDE / CHROMA_SUBSAMPLING;
constexpr size_t PLANAR_V_OFFSET = FIRST_CHROMA_OFFSET + static_cast<size_t>(PLANAR_CHROMA_STRIDE) * CHROMA_HEIGHT;
constexpr uint8_t EXPECTED_BLACK = 16;
constexpr uint8_t EXPECTED_NEUTRAL_CHROMA = 128;
constexpr uint8_t UNTOUCHED_PIXEL = 99;
constexpr Plane Y_PLANE{0, CAMERA_STRIDE, 1};
constexpr Plane FIRST_CHROMA{FIRST_CHROMA_OFFSET, CAMERA_STRIDE, CHROMA_COMPONENTS};
constexpr Plane SECOND_CHROMA{SECOND_CHROMA_OFFSET, CAMERA_STRIDE, CHROMA_COMPONENTS};

struct FrameCopyFixture {
    std::array<uint8_t, CAMERA_BYTES> camera{};
    std::array<uint8_t, ENCODER_BYTES> encoded{};

    FrameCopyFixture()
    {
        for (size_t index = 0; index < camera.size(); ++index) {
            camera[index] = static_cast<uint8_t>(index + 1);
        }
    }
};

void TestPaddedNv12Copy()
{
    FrameCopyFixture frame;
    CHECK_TEST(CopyNv12(frame.camera.data(), frame.camera.size(), Y_PLANE, FIRST_CHROMA, SECOND_CHROMA,
                        frame.encoded.data(), frame.encoded.size(), FRAME_WIDTH, FRAME_HEIGHT, ENCODER_STRIDE,
                        ENCODER_SLICE_HEIGHT));
    for (size_t row = 0; row < ENCODER_SLICE_HEIGHT; ++row) {
        for (size_t col = 0; col < ENCODER_STRIDE; ++col) {
            const uint8_t expected =
                row < FRAME_HEIGHT && col < FRAME_WIDTH ? frame.camera[row * CAMERA_STRIDE + col] : EXPECTED_BLACK;
            CHECK_TEST(frame.encoded[row * ENCODER_STRIDE + col] == expected);
        }
    }
    for (size_t row = 0; row < ENCODER_SLICE_HEIGHT / CHROMA_SUBSAMPLING; ++row) {
        for (size_t col = 0; col < ENCODER_STRIDE; ++col) {
            const uint8_t expected = row < CHROMA_HEIGHT && col < FRAME_WIDTH
                                         ? frame.camera[FIRST_CHROMA_OFFSET + row * CAMERA_STRIDE + col]
                                         : EXPECTED_NEUTRAL_CHROMA;
            CHECK_TEST(frame.encoded[ENCODER_LUMA_BYTES + row * ENCODER_STRIDE + col] == expected);
        }
    }
}

void CheckNv21Chroma(const FrameCopyFixture &frame)
{
    for (size_t row = 0; row < CHROMA_HEIGHT; ++row) {
        for (size_t col = 0; col < FRAME_WIDTH / CHROMA_SUBSAMPLING; ++col) {
            const size_t output = ENCODER_LUMA_BYTES + row * ENCODER_STRIDE + col * CHROMA_COMPONENTS;
            const size_t input = FIRST_CHROMA_OFFSET + row * CAMERA_STRIDE + col * CHROMA_COMPONENTS;
            CHECK_TEST(frame.encoded[output] == frame.camera[input + 1]);
            CHECK_TEST(frame.encoded[output + 1] == frame.camera[input]);
        }
    }
}

void TestNv21Copy()
{
    FrameCopyFixture frame;
    // NV21必须交换色度顺序，不能因为宽高一致而整块复制。
    CHECK_TEST(CopyNv12(frame.camera.data(), frame.camera.size(), Y_PLANE, SECOND_CHROMA, FIRST_CHROMA,
                        frame.encoded.data(), frame.encoded.size(), FRAME_WIDTH, FRAME_HEIGHT, ENCODER_STRIDE,
                        ENCODER_SLICE_HEIGHT));
    CheckNv21Chroma(frame);
}

void TestNativePlaneLayouts()
{
    FrameCopyFixture frame;
    Plane resolvedY;
    Plane resolvedU;
    Plane resolvedV;
    // 真机NV21返回三分量，跨度为pixel/row，偏移按Y/U/V排列。
    const Plane nativeNv21[]{{0, 1, CAMERA_STRIDE},
                             {SECOND_CHROMA_OFFSET, CHROMA_COMPONENTS, CAMERA_STRIDE},
                             {FIRST_CHROMA_OFFSET, CHROMA_COMPONENTS, CAMERA_STRIDE}};
    CHECK_TEST(ResolveYuv420Planes(nativeNv21, std::size(nativeNv21), Yuv420Layout::NV21, frame.camera.size(),
                                   FRAME_WIDTH, FRAME_HEIGHT, resolvedY, resolvedU, resolvedV));
    CHECK_TEST(resolvedY.rowStride == CAMERA_STRIDE && resolvedY.pixelStride == 1);
    CHECK_TEST(resolvedU.offset == SECOND_CHROMA_OFFSET && resolvedV.offset == FIRST_CHROMA_OFFSET);
    CHECK_TEST(CopyNv12(frame.camera.data(), frame.camera.size(), resolvedY, resolvedU, resolvedV, frame.encoded.data(),
                        frame.encoded.size(), FRAME_WIDTH, FRAME_HEIGHT, ENCODER_STRIDE, ENCODER_SLICE_HEIGHT));
    CheckNv21Chroma(frame);
    const Plane nativeNv12[]{Y_PLANE, FIRST_CHROMA, SECOND_CHROMA};
    CHECK_TEST(ResolveYuv420Planes(nativeNv12, std::size(nativeNv12), Yuv420Layout::NV12, frame.camera.size(),
                                   FRAME_WIDTH, FRAME_HEIGHT, resolvedY, resolvedU, resolvedV));
    CHECK_TEST(resolvedU.offset == FIRST_CHROMA_OFFSET && resolvedV.offset == SECOND_CHROMA_OFFSET);
    const Plane twoPlaneNv21[]{Y_PLANE, FIRST_CHROMA};
    CHECK_TEST(ResolveYuv420Planes(twoPlaneNv21, std::size(twoPlaneNv21), Yuv420Layout::NV21, frame.camera.size(),
                                   FRAME_WIDTH, FRAME_HEIGHT, resolvedY, resolvedU, resolvedV));
    CHECK_TEST(resolvedU.offset == SECOND_CHROMA_OFFSET && resolvedV.offset == FIRST_CHROMA_OFFSET);
}

void TestInvalidPlaneLayouts()
{
    Plane resolvedY;
    Plane resolvedU;
    Plane resolvedV;
    // 该跨度既不能描述Y像素，也不能在交换后描述有效行。
    constexpr uint32_t invalidLumaStride = FRAME_WIDTH - 1;
    const Plane invalidStride[]{{0, invalidLumaStride, invalidLumaStride}, FIRST_CHROMA, SECOND_CHROMA};
    CHECK_TEST(!ResolveYuv420Planes(invalidStride, std::size(invalidStride), Yuv420Layout::NV21, CAMERA_BYTES,
                                    FRAME_WIDTH, FRAME_HEIGHT, resolvedY, resolvedU, resolvedV));
    const Plane invalidChroma[]{
        Y_PLANE, FIRST_CHROMA, {FIRST_CHROMA_OFFSET + CHROMA_COMPONENTS, CAMERA_STRIDE, CHROMA_COMPONENTS}};
    CHECK_TEST(!ResolveYuv420Planes(invalidChroma, std::size(invalidChroma), Yuv420Layout::NV21, CAMERA_BYTES,
                                    FRAME_WIDTH, FRAME_HEIGHT, resolvedY, resolvedU, resolvedV));
}

void TestPlanarYuvCopy()
{
    FrameCopyFixture frame;
    const Plane planarU{FIRST_CHROMA_OFFSET, PLANAR_CHROMA_STRIDE, 1};
    const Plane planarV{PLANAR_V_OFFSET, PLANAR_CHROMA_STRIDE, 1};
    CHECK_TEST(CopyNv12(frame.camera.data(), frame.camera.size(), Y_PLANE, planarU, planarV, frame.encoded.data(),
                        frame.encoded.size(), FRAME_WIDTH, FRAME_HEIGHT, ENCODER_STRIDE, ENCODER_SLICE_HEIGHT));
    for (size_t row = 0; row < CHROMA_HEIGHT; ++row) {
        for (size_t col = 0; col < FRAME_WIDTH / CHROMA_SUBSAMPLING; ++col) {
            const size_t output = ENCODER_LUMA_BYTES + row * ENCODER_STRIDE + col * CHROMA_COMPONENTS;
            const size_t input = row * PLANAR_CHROMA_STRIDE + col;
            CHECK_TEST(frame.encoded[output] == frame.camera[FIRST_CHROMA_OFFSET + input]);
            CHECK_TEST(frame.encoded[output + 1] == frame.camera[PLANAR_V_OFFSET + input]);
        }
    }
}

void TestCopyBoundaries()
{
    FrameCopyFixture frame;
    const Plane planarU{FIRST_CHROMA_OFFSET, PLANAR_CHROMA_STRIDE, 1};
    const Plane planarV{PLANAR_V_OFFSET, PLANAR_CHROMA_STRIDE, 1};
    frame.encoded.fill(UNTOUCHED_PIXEL);
    const auto untouched = frame.encoded;
    CHECK_TEST(!CopyNv12(frame.camera.data(), frame.camera.size() - CHROMA_COMPONENTS, Y_PLANE, planarU, planarV,
                         frame.encoded.data(), frame.encoded.size(), FRAME_WIDTH, FRAME_HEIGHT, ENCODER_STRIDE,
                         ENCODER_SLICE_HEIGHT));
    CHECK_TEST(frame.encoded == untouched);
    CHECK_TEST(!CopyNv12(frame.camera.data(), frame.camera.size(), Y_PLANE, FIRST_CHROMA, SECOND_CHROMA,
                         frame.encoded.data(), frame.encoded.size() - 1, FRAME_WIDTH, FRAME_HEIGHT, ENCODER_STRIDE,
                         ENCODER_SLICE_HEIGHT));
    CHECK_TEST(!CopyNv12(frame.camera.data(), frame.camera.size(), Y_PLANE, FIRST_CHROMA, SECOND_CHROMA,
                         frame.encoded.data(), frame.encoded.size(), FRAME_WIDTH - 1, FRAME_HEIGHT, ENCODER_STRIDE,
                         ENCODER_SLICE_HEIGHT));
    CHECK_TEST(!CopyNv12(frame.camera.data(), frame.camera.size(), Y_PLANE, FIRST_CHROMA, SECOND_CHROMA,
                         frame.encoded.data(), frame.encoded.size(), FRAME_WIDTH, FRAME_HEIGHT, ENCODER_STRIDE - 1,
                         ENCODER_SLICE_HEIGHT));
    const Plane overflow{std::numeric_limits<uint64_t>::max(), CAMERA_STRIDE, 1};
    CHECK_TEST(!RecorderFrames::Contains(frame.camera.size(), overflow, FRAME_WIDTH, FRAME_HEIGHT));
    CHECK_TEST(!RecorderFrames::Contains(frame.camera.size(), {0, FRAME_WIDTH - 1, CHROMA_COMPONENTS}, FRAME_WIDTH,
                                         FRAME_HEIGHT));
    CHECK_TEST(frame.encoded == untouched);
}
} // namespace

int main()
{
    TestPaddedNv12Copy();
    TestNv21Copy();
    TestNativePlaneLayouts();
    TestInvalidPlaneLayouts();
    TestPlanarYuvCopy();
    TestCopyBoundaries();
    return 0;
}
