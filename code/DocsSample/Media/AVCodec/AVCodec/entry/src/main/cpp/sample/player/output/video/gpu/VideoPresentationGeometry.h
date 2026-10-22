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

#ifndef AVCODEC_SAMPLE_VIDEO_PRESENTATION_GEOMETRY_H
#define AVCODEC_SAMPLE_VIDEO_PRESENTATION_GEOMETRY_H

#include <array>
#include <cstddef>
#include <cstdint>

namespace VideoPresentationGeometry {
constexpr int32_t ROTATION_FULL_CIRCLE = 360;
constexpr int32_t ROTATION_QUARTER_TURN = 90;
constexpr int32_t ROTATION_HALF_TURN = 180;
constexpr int32_t ROTATION_THREE_QUARTER_TURN = 270;
constexpr int32_t CENTER_DIVISOR = 2;
constexpr size_t MATRIX_DIMENSION = 4;
constexpr size_t MATRIX_ELEMENT_COUNT = MATRIX_DIMENSION * MATRIX_DIMENSION;

struct Region {
    int32_t left = 0;
    int32_t top = 0;
    int32_t width = 0;
    int32_t height = 0;
};

struct FitRegionRequest {
    int32_t sourceWidth = 0;
    int32_t sourceHeight = 0;
    int32_t rotation = 0;
    int32_t targetWidth = 0;
    int32_t targetHeight = 0;
};

/**
 * 根据当前 acquired NativeBuffer 的分配尺寸和 codec 的有效内容尺寸生成纹理矩阵。
 * NativeBuffer 公共配置只有 width/height/stride，没有独立 crop API；视频内容约定从
 * Buffer 左上角开始，矩阵同时完成有效区域裁剪和 Y 轴翻转。输入 UV 使用 Vulkan
 * 顶点约定的左上角 (0, 1)，输出坐标使用源图左上角为 (0, 0) 的约定。
 */
bool BuildContentCropMatrix(int32_t bufferWidth, int32_t bufferHeight, int32_t contentWidth,
    int32_t contentHeight, std::array<float, MATRIX_ELEMENT_COUNT> &matrix);

int32_t NormalizeRotation(int32_t rotation);

bool CalculateFitRegion(const FitRegionRequest &request, Region &region);

std::array<float, MATRIX_ELEMENT_COUNT> RotateTextureMatrix(
    const std::array<float, MATRIX_ELEMENT_COUNT> &bufferMatrix, int32_t clockwiseRotation);
} // VideoPresentationGeometry 命名空间

#endif // AVCODEC_SAMPLE_VIDEO_PRESENTATION_GEOMETRY_H
