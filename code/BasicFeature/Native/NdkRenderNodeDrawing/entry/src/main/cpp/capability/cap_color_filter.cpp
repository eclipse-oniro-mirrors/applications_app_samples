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
#include "cap_color_filter.h"

#include <native_drawing/drawing_color_filter.h>
#include <native_drawing/drawing_filter.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_rect.h>

#include "common/log_common.h"
#include "capability/cap_util.h"
#include "capability/capability_type.h"

namespace ndr {
namespace {
constexpr float LUMA_RED = 0.2126F;
constexpr float LUMA_GREEN = 0.7152F;
constexpr float LUMA_BLUE = 0.0722F;

OH_Drawing_BlendMode ToFilterBlendMode(int32_t index)
{
    switch (index) {
        case 1:
            return BLEND_MODE_SCREEN;
        case 2:
            return BLEND_MODE_OVERLAY;
        case 3:
            return BLEND_MODE_DARKEN;
        case 4:
            return BLEND_MODE_DIFFERENCE;
        default:
            return BLEND_MODE_MULTIPLY;
    }
}

// 挂载颜色滤波器绘制一块矩形，Filter 与 ColorFilter 由调用方负责释放。
void FillFilteredRect(OH_Drawing_Canvas *canvas, uint32_t color, OH_Drawing_ColorFilter *colorFilter,
    float left, float top, float right, float bottom)
{
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    OH_Drawing_Brush *brush = cap::NewBrush(color);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(left, top, right, bottom);
    if (filter != nullptr && brush != nullptr && rect != nullptr && colorFilter != nullptr) {
        OH_Drawing_FilterSetColorFilter(filter, colorFilter);
        OH_Drawing_BrushSetFilter(brush, filter);
        OH_Drawing_CanvasAttachBrush(canvas, brush);
        OH_Drawing_CanvasDrawRect(canvas, rect);
        OH_Drawing_CanvasDetachBrush(canvas);
        OH_Drawing_BrushSetFilter(brush, nullptr);
    }
    if (rect != nullptr) {
        OH_Drawing_RectDestroy(rect);
    }
    if (brush != nullptr) {
        OH_Drawing_BrushDestroy(brush);
    }
    if (filter != nullptr) {
        OH_Drawing_FilterDestroy(filter);
    }
}

// 铺一整条调色板色带，filter 为空时按原色绘制，用于与滤波后的结果对照。
void DrawPaletteStrip(OH_Drawing_Canvas *canvas, const cap::Frame &frame, float top, float bottom,
    OH_Drawing_ColorFilter *filter)
{
    const float cellWidth = frame.width / static_cast<float>(cap::PALETTE_COUNT);
    for (int32_t index = 0; index < cap::PALETTE_COUNT; index++) {
        const float left = cellWidth * static_cast<float>(index);
        if (filter == nullptr) {
            cap::FillRectArea(canvas, cap::PaletteColor(index), left, top, left + cellWidth, bottom);
        } else {
            FillFilteredRect(canvas, cap::PaletteColor(index), filter, left, top, left + cellWidth, bottom);
        }
    }
}

// 饱和度矩阵：saturation 为 0 时完全灰度，为 1 时保持原色。
OH_Drawing_ColorFilter *CreateGrayFilter(float saturation, float alpha)
{
    const float inverse = 1.0F - cap::ClampFloat(saturation, 0.0F, 1.0F);
    const float matrix[] = {
        inverse * LUMA_RED + saturation, inverse * LUMA_GREEN, inverse * LUMA_BLUE, 0.0F, 0.0F,
        inverse * LUMA_RED, inverse * LUMA_GREEN + saturation, inverse * LUMA_BLUE, 0.0F, 0.0F,
        inverse * LUMA_RED, inverse * LUMA_GREEN, inverse * LUMA_BLUE + saturation, 0.0F, 0.0F,
        0.0F, 0.0F, 0.0F, alpha, 0.0F,
    };
    return OH_Drawing_ColorFilterCreateMatrix(matrix);
}

// 棕褐色矩阵：amount 越大越接近老照片效果。
OH_Drawing_ColorFilter *CreateSepiaFilter(float amount, float alpha)
{
    const float weight = cap::ClampFloat(amount, 0.0F, 1.0F);
    const float matrix[] = {
        1.0F - weight + weight * 0.393F, weight * 0.769F, weight * 0.189F, 0.0F, 0.0F,
        weight * 0.349F, 1.0F - weight + weight * 0.686F, weight * 0.168F, 0.0F, 0.0F,
        weight * 0.272F, weight * 0.534F, 1.0F - weight + weight * 0.131F, 0.0F, 0.0F,
        0.0F, 0.0F, 0.0F, alpha, 0.0F,
    };
    return OH_Drawing_ColorFilterCreateMatrix(matrix);
}

// 反相矩阵：对角系数 1-2a，位移 255a。
OH_Drawing_ColorFilter *CreateInvertFilter(float amount, float alpha)
{
    const float weight = cap::ClampFloat(amount, 0.0F, 1.0F);
    const float scale = 1.0F - 2.0F * weight;
    const float offset = 255.0F * weight;
    const float matrix[] = {
        scale, 0.0F, 0.0F, 0.0F, offset,
        0.0F, scale, 0.0F, 0.0F, offset,
        0.0F, 0.0F, scale, 0.0F, offset,
        0.0F, 0.0F, 0.0F, alpha, 0.0F,
    };
    return OH_Drawing_ColorFilterCreateMatrix(matrix);
}

// 对比度矩阵：以 128 为中心放大或压缩。
OH_Drawing_ColorFilter *CreateContrastFilter(float contrast, float alpha)
{
    const float matrix[] = {
        contrast, 0.0F, 0.0F, 0.0F, 128.0F * (1.0F - contrast),
        0.0F, contrast, 0.0F, 0.0F, 128.0F * (1.0F - contrast),
        0.0F, 0.0F, contrast, 0.0F, 128.0F * (1.0F - contrast),
        0.0F, 0.0F, 0.0F, alpha, 0.0F,
    };
    return OH_Drawing_ColorFilterCreateMatrix(matrix);
}

// 按序号构造一个固定的滤波器，供组合场景复用。
OH_Drawing_ColorFilter *CreateFilterByIndex(int32_t index, float alpha)
{
    switch (index) {
        case 1:
            return CreateGrayFilter(0.0F, alpha);
        case 2:
            return CreateInvertFilter(1.0F, alpha);
        case 3:
            return CreateSepiaFilter(1.0F, alpha);
        default:
            return OH_Drawing_ColorFilterCreateLuma();
    }
}

// 0. 混合模式滤波器：用指定颜色与指定混合模式过滤。
void SceneBlendModeFilter(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t mode = params.Choice(0, 5, 0);
    const int32_t palette = params.Choice(1, cap::PALETTE_COUNT, 2);
    OH_Drawing_ColorFilter *filter = OH_Drawing_ColorFilterCreateBlendMode(cap::PaletteColor(palette),
        ToFilterBlendMode(mode));
    if (filter == nullptr) {
        return;
    }
    DrawPaletteStrip(canvas, frame, frame.Y(12.0F), frame.Y(42.0F), nullptr);
    DrawPaletteStrip(canvas, frame, frame.Y(58.0F), frame.Y(88.0F), filter);
    OH_Drawing_ColorFilterDestroy(filter);
}

// 1. 灰度矩阵：饱和度越低越接近灰度。
void SceneMatrixGray(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float saturation = params.Percent(0, 0.0F);
    const float alpha = params.Percent(1, 1.0F);
    OH_Drawing_ColorFilter *filter = CreateGrayFilter(saturation, alpha);
    if (filter == nullptr) {
        return;
    }
    DrawPaletteStrip(canvas, frame, frame.Y(12.0F), frame.Y(42.0F), nullptr);
    DrawPaletteStrip(canvas, frame, frame.Y(58.0F), frame.Y(88.0F), filter);
    OH_Drawing_ColorFilterDestroy(filter);
}

// 2. 棕褐色矩阵。
void SceneMatrixSepia(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float amount = params.Percent(0, 0.7F);
    const float alpha = params.Percent(1, 1.0F);
    OH_Drawing_ColorFilter *filter = CreateSepiaFilter(amount, alpha);
    if (filter == nullptr) {
        return;
    }
    DrawPaletteStrip(canvas, frame, frame.Y(12.0F), frame.Y(42.0F), nullptr);
    DrawPaletteStrip(canvas, frame, frame.Y(58.0F), frame.Y(88.0F), filter);
    OH_Drawing_ColorFilterDestroy(filter);
}

// 3. 反相矩阵。
void SceneMatrixInvert(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float amount = params.Percent(0, 1.0F);
    const float alpha = params.Percent(1, 1.0F);
    OH_Drawing_ColorFilter *filter = CreateInvertFilter(amount, alpha);
    if (filter == nullptr) {
        return;
    }
    DrawPaletteStrip(canvas, frame, frame.Y(12.0F), frame.Y(42.0F), nullptr);
    DrawPaletteStrip(canvas, frame, frame.Y(58.0F), frame.Y(88.0F), filter);
    OH_Drawing_ColorFilterDestroy(filter);
}

// 4. 对比度矩阵。
void SceneMatrixContrast(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float contrast = params.Range(0, 1.5F, 0.0F, 2.0F);
    const float alpha = params.Percent(1, 1.0F);
    OH_Drawing_ColorFilter *filter = CreateContrastFilter(contrast, alpha);
    if (filter == nullptr) {
        return;
    }
    DrawPaletteStrip(canvas, frame, frame.Y(12.0F), frame.Y(42.0F), nullptr);
    DrawPaletteStrip(canvas, frame, frame.Y(58.0F), frame.Y(88.0F), filter);
    OH_Drawing_ColorFilterDestroy(filter);
}

// 5. 亮度滤波器：系统内置的 Luma 实现。
void SceneLuma(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float alpha = params.Percent(0, 1.0F);
    const int32_t palette = params.Choice(1, cap::PALETTE_COUNT, 1);
    OH_Drawing_ColorFilter *filter = OH_Drawing_ColorFilterCreateLuma();
    if (filter == nullptr) {
        return;
    }
    cap::FillRectArea(canvas, cap::PaletteColor(palette), frame.X(8.0F), frame.Y(12.0F), frame.X(92.0F),
        frame.Y(42.0F));
    FillFilteredRect(canvas, cap::WithAlpha(cap::PaletteColor(palette), alpha), filter, frame.X(8.0F),
        frame.Y(58.0F), frame.X(92.0F), frame.Y(88.0F));
    OH_Drawing_ColorFilterDestroy(filter);
}

// 6. 组合滤波器：两个滤波器串联，前者作用于后者的输出。
void SceneCompose(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t outerIndex = params.Choice(0, 4, 0);
    const int32_t innerIndex = params.Choice(1, 4, 1);
    OH_Drawing_ColorFilter *inner = CreateFilterByIndex(innerIndex, 1.0F);
    OH_Drawing_ColorFilter *outer = CreateFilterByIndex(outerIndex, 1.0F);
    if (inner == nullptr || outer == nullptr) {
        OH_Drawing_ColorFilterDestroy(inner);
        OH_Drawing_ColorFilterDestroy(outer);
        return;
    }
    OH_Drawing_ColorFilter *composed = OH_Drawing_ColorFilterCreateCompose(outer, inner);
    if (composed != nullptr) {
        DrawPaletteStrip(canvas, frame, frame.Y(12.0F), frame.Y(42.0F), nullptr);
        DrawPaletteStrip(canvas, frame, frame.Y(58.0F), frame.Y(88.0F), composed);
        OH_Drawing_ColorFilterDestroy(composed);
    }
    OH_Drawing_ColorFilterDestroy(inner);
    OH_Drawing_ColorFilterDestroy(outer);
}

// 7. 光照滤波器：乘色与加色共同决定最终亮度。
void SceneLighting(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t mulPalette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const int32_t addPalette = params.Choice(1, cap::PALETTE_COUNT, 4);
    OH_Drawing_ColorFilter *filter = OH_Drawing_ColorFilterCreateLighting(cap::PaletteColor(mulPalette),
        cap::WithAlpha(cap::PaletteColor(addPalette), 0.25F));
    if (filter == nullptr) {
        return;
    }
    DrawPaletteStrip(canvas, frame, frame.Y(12.0F), frame.Y(42.0F), nullptr);
    DrawPaletteStrip(canvas, frame, frame.Y(58.0F), frame.Y(88.0F), filter);
    OH_Drawing_ColorFilterDestroy(filter);
}

// 8. 画笔级滤波器：外框用原始画笔，中线用带反色滤波器的画笔，对比同一颜色在滤镜前后的差异。
void SceneFilterOnPen(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const float width = params.Range(1, 10.0F, 2.0F, 30.0F);
    OH_Drawing_ColorFilter *colorFilter = CreateInvertFilter(1.0F, 1.0F);
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    OH_Drawing_Pen *pen = cap::NewPen(cap::PaletteColor(palette), width);
    if (colorFilter != nullptr && filter != nullptr && pen != nullptr) {
        OH_Drawing_FilterSetColorFilter(filter, colorFilter);
        OH_Drawing_PenSetFilter(pen, filter);
        cap::StrokeRectArea(canvas, cap::PaletteColor(palette), width, frame.X(15.0F), frame.Y(20.0F),
            frame.X(85.0F), frame.Y(80.0F));
        OH_Drawing_CanvasAttachPen(canvas, pen);
        OH_Drawing_CanvasDrawLine(canvas, frame.X(20.0F), frame.Y(50.0F), frame.X(80.0F), frame.Y(50.0F));
        OH_Drawing_CanvasDetachPen(canvas);
        OH_Drawing_PenSetFilter(pen, nullptr);
    }
    if (pen != nullptr) {
        OH_Drawing_PenDestroy(pen);
    }
    if (filter != nullptr) {
        OH_Drawing_FilterDestroy(filter);
    }
    if (colorFilter != nullptr) {
        OH_Drawing_ColorFilterDestroy(colorFilter);
    }
}
} // namespace

void DrawColorFilterScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t scene,
    const ParamBag &params)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawColorFilterScene invalid canvas or size, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (scene < FILTER_BLEND_MODE || scene >= FILTER_SCENE_COUNT) {
        DRAWING_LOGE("DrawColorFilterScene unsupported scene=%{public}d", scene);
        return;
    }
    const cap::Frame frame = cap::MakeFrame(width, height);
    switch (scene) {
        case FILTER_BLEND_MODE:
            SceneBlendModeFilter(canvas, frame, params);
            break;
        case FILTER_MATRIX_GRAY:
            SceneMatrixGray(canvas, frame, params);
            break;
        case FILTER_MATRIX_SEPIA:
            SceneMatrixSepia(canvas, frame, params);
            break;
        case FILTER_MATRIX_INVERT:
            SceneMatrixInvert(canvas, frame, params);
            break;
        case FILTER_MATRIX_CONTRAST:
            SceneMatrixContrast(canvas, frame, params);
            break;
        case FILTER_LUMA:
            SceneLuma(canvas, frame, params);
            break;
        case FILTER_COMPOSE:
            SceneCompose(canvas, frame, params);
            break;
        case FILTER_LIGHTING:
            SceneLighting(canvas, frame, params);
            break;
        case FILTER_ON_PEN:
            SceneFilterOnPen(canvas, frame, params);
            break;
        default:
            break;
    }
    DRAWING_LOGI("DrawColorFilterScene done, scene=%{public}d size=%{public}dx%{public}d", scene, width, height);
}
} // namespace ndr
