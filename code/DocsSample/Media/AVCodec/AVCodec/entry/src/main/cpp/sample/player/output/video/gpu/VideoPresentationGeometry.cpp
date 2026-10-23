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

#include "VideoPresentationGeometry.h"

#include <algorithm>

namespace VideoPresentationGeometry {
namespace {
constexpr std::array<float, MATRIX_ELEMENT_COUNT> IDENTITY_MATRIX = {
    1.0F, 0.0F, 0.0F, 0.0F,
    0.0F, 1.0F, 0.0F, 0.0F,
    0.0F, 0.0F, 1.0F, 0.0F,
    0.0F, 0.0F, 0.0F, 1.0F
};

bool HasPositiveDimensions(int32_t width, int32_t height)
{
    return width > 0 && height > 0;
}

int32_t DivideByPositive(int64_t numerator, int32_t denominator)
{
    int32_t quotient = 0;
    if (denominator > 0) {
        quotient = static_cast<int32_t>(numerator / denominator);
    }
    return quotient;
}

void SwapDimensionsForRotation(int32_t rotation, int32_t &width, int32_t &height)
{
    if (rotation == ROTATION_QUARTER_TURN || rotation == ROTATION_THREE_QUARTER_TURN) {
        std::swap(width, height);
    }
}

bool SetFitSize(const FitRegionRequest &request, int32_t sourceWidth, int32_t sourceHeight, Region &region)
{
    // 将有效尺寸约束放在除法所在的函数内，静态检查也能确认分母非零。
    if (sourceWidth <= 0 || sourceHeight <= 0) {
        return false;
    }
    if (request.targetWidth <= 0 || request.targetHeight <= 0) {
        return false;
    }
    const int64_t fittedHeightNumerator = static_cast<int64_t>(request.targetWidth) * sourceHeight;
    const int64_t fittedWidthNumerator = static_cast<int64_t>(request.targetHeight) * sourceWidth;
    if (fittedHeightNumerator <= fittedWidthNumerator) {
        region.width = request.targetWidth;
        const int32_t fittedHeight = DivideByPositive(fittedHeightNumerator, sourceWidth);
        region.height = std::max(1, fittedHeight);
        return true;
    }
    const int32_t fittedWidth = DivideByPositive(fittedWidthNumerator, sourceHeight);
    region.width = std::max(1, fittedWidth);
    region.height = request.targetHeight;
    return true;
}

std::array<float, MATRIX_ELEMENT_COUNT> RotationMatrix(int32_t rotation)
{
    switch (NormalizeRotation(rotation)) {
        case ROTATION_QUARTER_TURN:
            return { 0.0F, 1.0F, 0.0F, 0.0F, -1.0F, 0.0F, 0.0F, 0.0F,
                0.0F, 0.0F, 1.0F, 0.0F, 1.0F, 0.0F, 0.0F, 1.0F };
        case ROTATION_HALF_TURN:
            return { -1.0F, 0.0F, 0.0F, 0.0F, 0.0F, -1.0F, 0.0F, 0.0F,
                0.0F, 0.0F, 1.0F, 0.0F, 1.0F, 1.0F, 0.0F, 1.0F };
        case ROTATION_THREE_QUARTER_TURN:
            return { 0.0F, -1.0F, 0.0F, 0.0F, 1.0F, 0.0F, 0.0F, 0.0F,
                0.0F, 0.0F, 1.0F, 0.0F, 0.0F, 1.0F, 0.0F, 1.0F };
        default:
            return IDENTITY_MATRIX;
    }
}
}

bool BuildContentCropMatrix(int32_t bufferWidth, int32_t bufferHeight, int32_t contentWidth,
    int32_t contentHeight, std::array<float, MATRIX_ELEMENT_COUNT> &matrix)
{
    matrix = {};
    if (!HasPositiveDimensions(bufferWidth, bufferHeight) || !HasPositiveDimensions(contentWidth, contentHeight) ||
        contentWidth > bufferWidth || contentHeight > bufferHeight) {
        return false;
    }
    const float widthRatio = static_cast<float>(contentWidth) / static_cast<float>(bufferWidth);
    const float heightRatio = static_cast<float>(contentHeight) / static_cast<float>(bufferHeight);
    matrix = { widthRatio, 0.0F, 0.0F, 0.0F, 0.0F, -heightRatio, 0.0F, 0.0F,
        0.0F, 0.0F, 1.0F, 0.0F, 0.0F, heightRatio, 0.0F, 1.0F };
    return true;
}

int32_t NormalizeRotation(int32_t rotation)
{
    const int32_t remainder = rotation % ROTATION_FULL_CIRCLE;
    return remainder < 0 ? remainder + ROTATION_FULL_CIRCLE : remainder;
}

bool CalculateFitRegion(const FitRegionRequest &request, Region &region)
{
    region = {};
    if (!HasPositiveDimensions(request.sourceWidth, request.sourceHeight) ||
        !HasPositiveDimensions(request.targetWidth, request.targetHeight)) {
        return false;
    }
    int32_t sourceWidth = request.sourceWidth;
    int32_t sourceHeight = request.sourceHeight;
    SwapDimensionsForRotation(NormalizeRotation(request.rotation), sourceWidth, sourceHeight);
    if (!HasPositiveDimensions(sourceWidth, sourceHeight)) {
        return false;
    }
    if (!SetFitSize(request, sourceWidth, sourceHeight, region)) {
        return false;
    }
    region.left = (request.targetWidth - region.width) / CENTER_DIVISOR;
    region.top = (request.targetHeight - region.height) / CENTER_DIVISOR;
    return true;
}

std::array<float, MATRIX_ELEMENT_COUNT> RotateTextureMatrix(
    const std::array<float, MATRIX_ELEMENT_COUNT> &bufferMatrix, int32_t clockwiseRotation)
{
    const auto rotation = RotationMatrix(clockwiseRotation);
    std::array<float, MATRIX_ELEMENT_COUNT> result = {};
    for (size_t column = 0; column < MATRIX_DIMENSION; ++column) {
        for (size_t row = 0; row < MATRIX_DIMENSION; ++row) {
            for (size_t inner = 0; inner < MATRIX_DIMENSION; ++inner) {
                result[column * MATRIX_DIMENSION + row] += bufferMatrix[inner * MATRIX_DIMENSION + row] *
                    rotation[column * MATRIX_DIMENSION + inner];
            }
        }
    }
    return result;
}
} // namespace VideoPresentationGeometry
