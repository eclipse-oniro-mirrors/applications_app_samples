/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

#include <array>
#include <cmath>
#include <cstdlib>
#include <iostream>
#include <limits>

#include "../../entry/src/main/cpp/sample/player/output/video/gpu/VideoPresentationGeometry.h"

namespace {
using VideoPresentationGeometry::CalculateFitRegion;
using VideoPresentationGeometry::BuildContentCropMatrix;
using VideoPresentationGeometry::FitRegionRequest;
using VideoPresentationGeometry::Region;
using VideoPresentationGeometry::RotateTextureMatrix;
using VideoPresentationGeometry::MATRIX_DIMENSION;
using VideoPresentationGeometry::MATRIX_ELEMENT_COUNT;
constexpr size_t POINT_COMPONENT_COUNT = 2;
constexpr size_t CORNER_COUNT = 4;
using Matrix = std::array<float, MATRIX_ELEMENT_COUNT>;
using Point = std::array<float, POINT_COMPONENT_COUNT>;
using Corners = std::array<Point, CORNER_COUNT>;
constexpr float FLOAT_TOLERANCE = 0.00001F;
constexpr int32_t SOURCE_WIDTH = 1920;
constexpr int32_t SOURCE_HEIGHT = 1080;
constexpr int32_t BUFFER_WIDTH = 2048;
constexpr int32_t BUFFER_HEIGHT = 1152;
constexpr int32_t EXPECTED_VISIBLE_TOP = 496;
constexpr int32_t EXPECTED_HIDDEN_TOP = 796;
constexpr int32_t EXPECTED_PORTRAIT_LEFT = 90;
constexpr int32_t EXPECTED_PORTRAIT_TOP = 140;
constexpr int32_t EXPECTED_PORTRAIT_WIDTH = 900;
constexpr int32_t EXPECTED_LANDSCAPE_HEIGHT = 607;
constexpr int32_t EXPECTED_PORTRAIT_HEIGHT = 1600;
constexpr int32_t EXPECTED_HIDDEN_PORTRAIT_HEIGHT = 1920;
constexpr int32_t TARGET_WIDTH = 1000;
constexpr int32_t TARGET_HEIGHT = 1000;
constexpr int32_t PORTRAIT_TARGET_WIDTH = 1080;
constexpr int32_t PORTRAIT_TARGET_HEIGHT = 1600;
constexpr int32_t PORTRAIT_HIDDEN_TARGET_HEIGHT = 2200;
constexpr int32_t LARGE_TARGET = std::numeric_limits<int32_t>::max();
constexpr int32_t DEFAULT_LEFT = 1;
constexpr int32_t DEFAULT_TOP = 2;
constexpr int32_t DEFAULT_WIDTH = 3;
constexpr int32_t DEFAULT_HEIGHT = 4;
constexpr int32_t EXPECTED_ZERO = 0;
constexpr int32_t INVALID_DIMENSION = -1;
constexpr int32_t ROTATION_0 = 0;
constexpr int32_t ROTATION_90 = 90;
constexpr int32_t ROTATION_180 = 180;
constexpr int32_t ROTATION_270 = 270;
constexpr int32_t ROTATION_NEGATIVE_90 = -ROTATION_90;
constexpr int32_t ROTATION_450 = 450;
constexpr int32_t DIMENSION_ONE = 1;
constexpr int32_t MAXIMUM_DIMENSION = LARGE_TARGET;
constexpr Matrix BUFFER_VERTICAL_FLIP = {
    1.0F, 0.0F, 0.0F, 0.0F,
    0.0F, -1.0F, 0.0F, 0.0F,
    0.0F, 0.0F, 1.0F, 0.0F,
    0.0F, 1.0F, 0.0F, 1.0F
};
// 顺序为屏幕左上、右上、左下、右下。输入沿用 Vulkan 正向 viewport 的基础 UV。
constexpr Corners SCREEN_BASE_UV = { Point { 0.0F, 1.0F }, Point { 1.0F, 1.0F },
    Point { 0.0F, 0.0F }, Point { 1.0F, 0.0F } };

void Require(bool condition, const char *message)
{
    if (!condition) {
        std::cerr << message << '\n';
        std::exit(EXIT_FAILURE);
    }
}

void ExpectRegion(const Region &actual, const Region &expected)
{
    Require(actual.left == expected.left && actual.top == expected.top && actual.width == expected.width &&
        actual.height == expected.height, "Unexpected centered fit region");
}

void TestFitForEachRotation()
{
    constexpr std::array<int32_t, 4> angles = { ROTATION_0, ROTATION_90, ROTATION_180, ROTATION_270 };
    constexpr std::array<Region, 4> expected = {
        Region { 0, 219, 1000, 562 }, Region { 219, 0, 562, 1000 },
        Region { 0, 219, 1000, 562 }, Region { 219, 0, 562, 1000 }
    };
    for (size_t index = 0; index < angles.size(); ++index) {
        Region region;
        Require(CalculateFitRegion({ SOURCE_WIDTH, SOURCE_HEIGHT, angles[index], TARGET_WIDTH, TARGET_HEIGHT }, region),
            "Fit calculation failed");
        ExpectRegion(region, expected[index]);
    }
}

void TestControlsChangeSurfaceSize()
{
    Region region;
    Require(CalculateFitRegion({ SOURCE_WIDTH, SOURCE_HEIGHT, ROTATION_0, PORTRAIT_TARGET_WIDTH,
        PORTRAIT_TARGET_HEIGHT }, region),
        "Visible-controls fit failed");
    ExpectRegion(region, { 0, EXPECTED_VISIBLE_TOP, SOURCE_HEIGHT, EXPECTED_LANDSCAPE_HEIGHT });
    Require(CalculateFitRegion({ SOURCE_WIDTH, SOURCE_HEIGHT, ROTATION_0, PORTRAIT_TARGET_WIDTH,
        PORTRAIT_HIDDEN_TARGET_HEIGHT }, region),
        "Hidden-controls fit failed");
    ExpectRegion(region, { 0, EXPECTED_HIDDEN_TOP, SOURCE_HEIGHT, EXPECTED_LANDSCAPE_HEIGHT });
    Require(CalculateFitRegion({ SOURCE_WIDTH, SOURCE_HEIGHT, ROTATION_90, PORTRAIT_TARGET_WIDTH,
        PORTRAIT_TARGET_HEIGHT }, region),
        "Portrait visible-controls fit failed");
    ExpectRegion(region, { EXPECTED_PORTRAIT_LEFT, 0, EXPECTED_PORTRAIT_WIDTH, EXPECTED_PORTRAIT_HEIGHT });
    Require(CalculateFitRegion({ SOURCE_WIDTH, SOURCE_HEIGHT, ROTATION_90, PORTRAIT_TARGET_WIDTH,
        PORTRAIT_HIDDEN_TARGET_HEIGHT }, region),
        "Portrait hidden-controls fit failed");
    ExpectRegion(region, { 0, EXPECTED_PORTRAIT_TOP, SOURCE_HEIGHT, EXPECTED_HIDDEN_PORTRAIT_HEIGHT });
}

void TestFitBounds()
{
    Region region { DEFAULT_LEFT, DEFAULT_TOP, DEFAULT_WIDTH, DEFAULT_HEIGHT };
    Require(!CalculateFitRegion({ EXPECTED_ZERO, SOURCE_HEIGHT, ROTATION_0, TARGET_WIDTH, TARGET_HEIGHT }, region),
        "Zero source dimension accepted");
    ExpectRegion(region, {});
    Require(!CalculateFitRegion({ SOURCE_WIDTH, SOURCE_HEIGHT, ROTATION_0, TARGET_WIDTH, INVALID_DIMENSION }, region),
        "Negative target dimension accepted");
    Require(CalculateFitRegion({ LARGE_TARGET, LARGE_TARGET, ROTATION_0, LARGE_TARGET, LARGE_TARGET }, region),
        "Large dimensions rejected");
    ExpectRegion(region, { 0, 0, MAXIMUM_DIMENSION, MAXIMUM_DIMENSION });
    Require(CalculateFitRegion(MAXIMUM_DIMENSION, DIMENSION_ONE, ROTATION_0, DIMENSION_ONE, DIMENSION_ONE, region),
        "Single-pixel fit failed");
    ExpectRegion(region, { 0, 0, DIMENSION_ONE, DIMENSION_ONE });
    const FitRegionRequest negativeRotationRequest {
        SOURCE_WIDTH, SOURCE_HEIGHT, ROTATION_NEGATIVE_90, TARGET_WIDTH, TARGET_HEIGHT };
    Require(CalculateFitRegion(negativeRotationRequest, region),
        "Negative rotation rejected");
    ExpectRegion(region, { 219, 0, 562, 1000 });
}

void ExpectCorners(const Matrix &matrix, const Corners &expected)
{
    for (size_t index = 0; index < SCREEN_BASE_UV.size(); ++index) {
        const float u = SCREEN_BASE_UV[index][0];
        const float v = SCREEN_BASE_UV[index][1];
        const float outputU = matrix[0] * u + matrix[4] * v + matrix[12];
        const float outputV = matrix[1] * u + matrix[5] * v + matrix[13];
        Require(std::abs(outputU - expected[index][0]) < FLOAT_TOLERANCE &&
            std::abs(outputV - expected[index][1]) < FLOAT_TOLERANCE, "Unexpected texture corner mapping");
    }
}

void TestClockwiseTextureRotation()
{
    // 期望值使用源图左上角为 (0, 0) 的坐标。顺时针 90 度时，屏幕左上应读取源图左下。
    const Corners zero = { Point { 0.0F, 0.0F }, Point { 1.0F, 0.0F },
        Point { 0.0F, 1.0F }, Point { 1.0F, 1.0F } };
    const Corners clockwise90 = { Point { 0.0F, 1.0F }, Point { 0.0F, 0.0F },
        Point { 1.0F, 1.0F }, Point { 1.0F, 0.0F } };
    const Corners clockwise180 = { Point { 1.0F, 1.0F }, Point { 0.0F, 1.0F },
        Point { 1.0F, 0.0F }, Point { 0.0F, 0.0F } };
    const Corners clockwise270 = { Point { 1.0F, 0.0F }, Point { 1.0F, 1.0F },
        Point { 0.0F, 0.0F }, Point { 0.0F, 1.0F } };
    ExpectCorners(RotateTextureMatrix(BUFFER_VERTICAL_FLIP, ROTATION_0), zero);
    ExpectCorners(RotateTextureMatrix(BUFFER_VERTICAL_FLIP, ROTATION_90), clockwise90);
    ExpectCorners(RotateTextureMatrix(BUFFER_VERTICAL_FLIP, ROTATION_180), clockwise180);
    ExpectCorners(RotateTextureMatrix(BUFFER_VERTICAL_FLIP, ROTATION_270), clockwise270);
    ExpectCorners(RotateTextureMatrix(BUFFER_VERTICAL_FLIP, ROTATION_NEGATIVE_90), clockwise270);
    ExpectCorners(RotateTextureMatrix(BUFFER_VERTICAL_FLIP, ROTATION_450), clockwise90);
}

void TestAcquiredBufferContentCrop()
{
    Matrix contentMatrix;
    Require(BuildContentCropMatrix(BUFFER_WIDTH, BUFFER_HEIGHT, SOURCE_WIDTH, SOURCE_HEIGHT, contentMatrix),
        "Content crop matrix failed");
    const float contentWidthRatio = static_cast<float>(SOURCE_WIDTH) / static_cast<float>(BUFFER_WIDTH);
    const float contentHeightRatio = static_cast<float>(SOURCE_HEIGHT) / static_cast<float>(BUFFER_HEIGHT);
    const Corners zero = { Point { 0.0F, 0.0F }, Point { contentWidthRatio, 0.0F },
        Point { 0.0F, contentHeightRatio }, Point { contentWidthRatio, contentHeightRatio } };
    const Corners clockwise90 = { Point { 0.0F, contentHeightRatio }, Point { 0.0F, 0.0F },
        Point { contentWidthRatio, contentHeightRatio }, Point { contentWidthRatio, 0.0F } };
    const Corners clockwise180 = { Point { contentWidthRatio, contentHeightRatio },
        Point { 0.0F, contentHeightRatio }, Point { contentWidthRatio, 0.0F }, Point { 0.0F, 0.0F } };
    const Corners clockwise270 = { Point { contentWidthRatio, 0.0F },
        Point { contentWidthRatio, contentHeightRatio }, Point { 0.0F, 0.0F },
        Point { 0.0F, contentHeightRatio } };
    ExpectCorners(contentMatrix, zero);
    ExpectCorners(RotateTextureMatrix(contentMatrix, ROTATION_90), clockwise90);
    ExpectCorners(RotateTextureMatrix(contentMatrix, ROTATION_180), clockwise180);
    ExpectCorners(RotateTextureMatrix(contentMatrix, ROTATION_270), clockwise270);
    Require(!BuildContentCropMatrix(BUFFER_WIDTH, BUFFER_HEIGHT, BUFFER_WIDTH + DIMENSION_ONE,
        SOURCE_HEIGHT, contentMatrix), "Oversized content accepted");
    Require(!BuildContentCropMatrix(BUFFER_WIDTH, BUFFER_HEIGHT, SOURCE_WIDTH, 0, contentMatrix),
        "Empty content accepted");
}

void TestCropIsAppliedAfterRotation()
{
    // 非正方形裁剪范围可检出 M*R 被误写成 R*M 的问题；旋转后仍应落在同一有效图像范围。
    constexpr Matrix cropAndFlip = {
        0.5F, 0.0F, 0.0F, 0.0F,
        0.0F, -0.75F, 0.0F, 0.0F,
        0.0F, 0.0F, 1.0F, 0.0F,
        0.25F, 0.875F, 0.0F, 1.0F
    };
    const Corners expected = { Point { 0.25F, 0.875F }, Point { 0.25F, 0.125F },
        Point { 0.75F, 0.875F }, Point { 0.75F, 0.125F } };
    ExpectCorners(RotateTextureMatrix(cropAndFlip, ROTATION_90), expected);
}
} // 匿名命名空间

int main()
{
    TestFitForEachRotation();
    TestControlsChangeSurfaceSize();
    TestFitBounds();
    TestClockwiseTextureRotation();
    TestAcquiredBufferContentCrop();
    TestCropIsAppliedAfterRotation();
    std::cout << "Video presentation geometry tests passed\n";
    return EXIT_SUCCESS;
}
