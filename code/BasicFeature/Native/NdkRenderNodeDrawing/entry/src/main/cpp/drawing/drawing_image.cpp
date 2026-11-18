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
#include "drawing_image.h"

#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_pixel_map.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_sampling_options.h>

#include "common/log_common.h"
#include "drawing/drawing_util.h"
#include "drawing/scene_type.h"

namespace ndr {
namespace {
struct ImageSource {
    OH_Drawing_PixelMap *pixelMap = nullptr;
    float width = 0.0F;
    float height = 0.0F;
};

// 等比缩放后的显示尺寸，保持图片不变形。
bool FitSize(float canvasWidth, float canvasHeight, float srcWidth, float srcHeight, float ratio,
    float &dstWidth, float &dstHeight)
{
    if (srcWidth <= 0.0F || srcHeight <= 0.0F || canvasWidth <= 0.0F || canvasHeight <= 0.0F) {
        return false;
    }
    const float canvasRatio = canvasWidth / canvasHeight;
    const float srcRatio = srcWidth / srcHeight;
    dstWidth = canvasWidth;
    dstHeight = canvasHeight;
    if (srcRatio > canvasRatio) {
        dstHeight = canvasWidth / srcRatio;
    } else {
        dstWidth = canvasHeight * srcRatio;
    }
    dstWidth *= ratio;
    dstHeight *= ratio;
    return dstWidth > 0.0F && dstHeight > 0.0F;
}

// 按等比缩放计算居中显示区域。
OH_Drawing_Rect *CreateFitRect(float canvasWidth, float canvasHeight, float srcWidth, float srcHeight,
    float ratio)
{
    float dstWidth = 0.0F;
    float dstHeight = 0.0F;
    if (!FitSize(canvasWidth, canvasHeight, srcWidth, srcHeight, ratio, dstWidth, dstHeight)) {
        return nullptr;
    }
    const float left = (canvasWidth - dstWidth) / 2.0F;
    const float top = (canvasHeight - dstHeight) / 2.0F;
    return CreateRect(left, top, left + dstWidth, top + dstHeight);
}

// 右下角对齐的等比缩放矩形，叠加层用它保证整张小图都留在画布内。
OH_Drawing_Rect *CreateCornerRect(float canvasWidth, float canvasHeight, float srcWidth, float srcHeight,
    float ratio)
{
    float dstWidth = 0.0F;
    float dstHeight = 0.0F;
    if (!FitSize(canvasWidth, canvasHeight, srcWidth, srcHeight, ratio, dstWidth, dstHeight)) {
        return nullptr;
    }
    const float margin = (canvasWidth < canvasHeight ? canvasWidth : canvasHeight) * 0.03F;
    const float right = canvasWidth - margin;
    const float bottom = canvasHeight - margin;
    return CreateRect(right - dstWidth, bottom - dstHeight, right, bottom);
}

void DrawPixelMap(OH_Drawing_Canvas *canvas, OH_Drawing_PixelMap *pixelMap, const OH_Drawing_Rect *src,
    const OH_Drawing_Rect *dst, OH_Drawing_FilterMode filterMode)
{
    OH_Drawing_SamplingOptions *sampling = OH_Drawing_SamplingOptionsCreate(filterMode, MIPMAP_MODE_NONE);
    if (sampling == nullptr) {
        DRAWING_LOGE("Create sampling options failed, filterMode=%{public}d", filterMode);
        return;
    }
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    if (brush != nullptr) {
        OH_Drawing_BrushSetAntiAlias(brush, true);
        OH_Drawing_CanvasAttachBrush(canvas, brush);
    }
    OH_Drawing_CanvasDrawPixelMapRect(canvas, pixelMap, src, dst, sampling);
    if (brush != nullptr) {
        OH_Drawing_CanvasDetachBrush(canvas);
        OH_Drawing_BrushDestroy(brush);
    }
    OH_Drawing_SamplingOptionsDestroy(sampling);
}

void DrawStretch(OH_Drawing_Canvas *canvas, const ImageSource &source, float canvasWidth, float canvasHeight)
{
    OH_Drawing_Rect *src = CreateRect(0.0F, 0.0F, source.width, source.height);
    OH_Drawing_Rect *dst = CreateRect(canvasWidth * 0.05F, canvasHeight * 0.05F,
        canvasWidth * 0.95F, canvasHeight * 0.95F);
    if (src != nullptr && dst != nullptr) {
        DrawPixelMap(canvas, source.pixelMap, src, dst, FILTER_MODE_NEAREST);
    }
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
}

void DrawSampling(OH_Drawing_Canvas *canvas, const ImageSource &source, float canvasWidth, float canvasHeight,
    OH_Drawing_FilterMode filterMode)
{
    OH_Drawing_Rect *src = CreateRect(0.0F, 0.0F, source.width, source.height);
    OH_Drawing_Rect *dst = CreateFitRect(canvasWidth, canvasHeight, source.width, source.height, 0.7F);
    if (src != nullptr && dst != nullptr) {
        DrawPixelMap(canvas, source.pixelMap, src, dst, filterMode);
    }
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(dst);
}

void DrawScaleView(OH_Drawing_Canvas *canvas, const ImageSource &source, float canvasWidth, float canvasHeight)
{
    OH_Drawing_Rect *src = CreateRect(0.0F, 0.0F, source.width, source.height);
    OH_Drawing_Rect *large = CreateFitRect(canvasWidth, canvasHeight, source.width, source.height, 0.8F);
    if (src != nullptr && large != nullptr) {
        DrawPixelMap(canvas, source.pixelMap, src, large, FILTER_MODE_LINEAR);
    }
    // 在右下角叠加一张小图，演示同一 PixelMap 可被重复绘制。
    // 叠加层直接用右下角矩形：居中矩形再按半画布平移会被推出画布，只剩左上角一角可见。
    OH_Drawing_Rect *small = CreateCornerRect(canvasWidth, canvasHeight, source.width, source.height, 0.35F);
    if (src != nullptr && small != nullptr) {
        DrawPixelMap(canvas, source.pixelMap, src, small, FILTER_MODE_NEAREST);
    }
    OH_Drawing_RectDestroy(src);
    OH_Drawing_RectDestroy(small);
    OH_Drawing_RectDestroy(large);
}

// 从 ArkTS 传入的 PixelMap 句柄取绘制对象与原始尺寸，失败时打印原因并返回 false。
bool ResolveImageSource(NativePixelMap *nativeMap, ImageSource &source)
{
    OhosPixelMapInfos info = {};
    const int32_t result = OH_PixelMap_GetImageInfo(nativeMap, &info);
    if (result != 0 || info.width == 0 || info.height == 0) {
        DRAWING_LOGE("GetImageInfo failed, result=%{public}d width=%{public}u height=%{public}u",
            result, info.width, info.height);
        return false;
    }
    OH_Drawing_PixelMap *pixelMap = OH_Drawing_PixelMapGetFromNativePixelMap(nativeMap);
    if (pixelMap == nullptr) {
        DRAWING_LOGE("Get drawing pixel map failed");
        return false;
    }
    source.pixelMap = pixelMap;
    source.width = static_cast<float>(info.width);
    source.height = static_cast<float>(info.height);
    return true;
}
} // namespace

void DrawImageScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height,
    NativePixelMap *nativeMap, int32_t kind)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawImageScene invalid param, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (kind < IMAGE_STRETCH || kind >= IMAGE_KIND_COUNT) {
        DRAWING_LOGE("DrawImageScene unsupported kind=%{public}d", kind);
        return;
    }
    if (nativeMap == nullptr) {
        DRAWING_LOGE("DrawImageScene pixel map is null, kind=%{public}d", kind);
        return;
    }
    ImageSource source;
    if (!ResolveImageSource(nativeMap, source)) {
        return;
    }
    const float canvasWidth = static_cast<float>(width);
    const float canvasHeight = static_cast<float>(height);

    switch (kind) {
        case IMAGE_STRETCH:
            DrawStretch(canvas, source, canvasWidth, canvasHeight);
            break;
        case IMAGE_NEAREST:
            DrawSampling(canvas, source, canvasWidth, canvasHeight, FILTER_MODE_NEAREST);
            break;
        case IMAGE_LINEAR:
            DrawSampling(canvas, source, canvasWidth, canvasHeight, FILTER_MODE_LINEAR);
            break;
        case IMAGE_SCALE_VIEW:
            DrawScaleView(canvas, source, canvasWidth, canvasHeight);
            break;
        default:
            break;
    }
    OH_Drawing_PixelMapDissolve(source.pixelMap);
    DRAWING_LOGI("DrawImageScene done, kind=%{public}d src=%{public}dx%{public}d", kind,
        static_cast<int32_t>(source.width), static_cast<int32_t>(source.height));
}
} // namespace ndr
