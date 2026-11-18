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
#include "drawing_effect.h"

#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_color_filter.h>
#include <native_drawing/drawing_filter.h>
#include <native_drawing/drawing_mask_filter.h>
#include <native_drawing/drawing_path_effect.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_shader_effect.h>

#include "common/log_common.h"
#include "drawing/drawing_util.h"
#include "drawing/scene_type.h"

namespace ndr {
namespace {
constexpr uint32_t GRADIENT_COLORS[] = {0xFF1F6FEB, 0xFFF59E0B, 0xFFEF4444};
constexpr float GRADIENT_POS[] = {0.0F, 0.5F, 1.0F};
constexpr uint32_t GRADIENT_COLOR_COUNT = 3;

void FillRect(OH_Drawing_Canvas *canvas, OH_Drawing_Brush *brush,
              float left, float top, float right, float bottom)
{
    OH_Drawing_Rect *rect = CreateRect(left, top, right, bottom);
    if (rect == nullptr) {
        return;
    }
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_CanvasDetachBrush(canvas);
    OH_Drawing_RectDestroy(rect);
}

void FillCircle(OH_Drawing_Canvas *canvas, OH_Drawing_Brush *brush, float cx, float cy, float radius)
{
    OH_Drawing_Point *center = OH_Drawing_PointCreate(cx, cy);
    if (center == nullptr) {
        return;
    }
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawCircle(canvas, center, radius);
    OH_Drawing_CanvasDetachBrush(canvas);
    OH_Drawing_PointDestroy(center);
}

void StrokeRect(OH_Drawing_Canvas *canvas, OH_Drawing_Pen *pen,
                float left, float top, float right, float bottom)
{
    OH_Drawing_Rect *rect = CreateRect(left, top, right, bottom);
    if (rect == nullptr) {
        return;
    }
    OH_Drawing_CanvasAttachPen(canvas, pen);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_CanvasDetachPen(canvas);
    OH_Drawing_RectDestroy(rect);
}

// 颜色矩阵取反，用于演示颜色滤波器效果。
void DrawColorFilteredRect(OH_Drawing_Canvas *canvas, OH_Drawing_Brush *brush,
                           float left, float top, float right, float bottom)
{
    const float matrix[] = {
        -1.0F, 0.0F, 0.0F, 0.0F, 255.0F,
        0.0F, -1.0F, 0.0F, 0.0F, 255.0F,
        0.0F, 0.0F, -1.0F, 0.0F, 255.0F,
        0.0F, 0.0F, 0.0F, 1.0F, 0.0F,
    };
    OH_Drawing_ColorFilter *colorFilter = OH_Drawing_ColorFilterCreateMatrix(matrix);
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    if (colorFilter == nullptr || filter == nullptr) {
        OH_Drawing_ColorFilterDestroy(colorFilter);
        OH_Drawing_FilterDestroy(filter);
        return;
    }
    OH_Drawing_FilterSetColorFilter(filter, colorFilter);
    OH_Drawing_BrushSetColor(brush, COLOR_PRIMARY);
    OH_Drawing_BrushSetFilter(brush, filter);
    FillRect(canvas, brush, left, top, right, bottom);
    OH_Drawing_BrushSetFilter(brush, nullptr);
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_ColorFilterDestroy(colorFilter);
}

void DrawBlurredCircle(OH_Drawing_Canvas *canvas, OH_Drawing_Brush *brush, float cx, float cy, float radius)
{
    OH_Drawing_MaskFilter *maskFilter = OH_Drawing_MaskFilterCreateBlur(NORMAL, 16.0F, true);
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    if (maskFilter == nullptr || filter == nullptr) {
        OH_Drawing_MaskFilterDestroy(maskFilter);
        OH_Drawing_FilterDestroy(filter);
        return;
    }
    OH_Drawing_FilterSetMaskFilter(filter, maskFilter);
    OH_Drawing_BrushSetColor(brush, COLOR_PRIMARY);
    OH_Drawing_BrushSetFilter(brush, filter);
    FillCircle(canvas, brush, cx, cy, radius);
    OH_Drawing_BrushSetFilter(brush, nullptr);
    OH_Drawing_FilterDestroy(filter);
    OH_Drawing_MaskFilterDestroy(maskFilter);
}
// 填充与描边：同一个矩形分别由画刷填充和画笔描边，直观对比两种绘制方式。
void DrawFillStrokePair(OH_Drawing_Canvas *canvas, OH_Drawing_Brush *brush, OH_Drawing_Pen *pen, float w, float h)
{
    OH_Drawing_BrushSetColor(brush, COLOR_FILL);
    FillRect(canvas, brush, w * 0.08F, h * 0.2F, w * 0.48F, h * 0.8F);
    StrokeRect(canvas, pen, w * 0.52F, h * 0.2F, w * 0.92F, h * 0.8F);
}

// 混合模式：两块矩形叠加，重叠区域的像素按 MUL 规则合成。
void DrawMultiplyOverlap(OH_Drawing_Canvas *canvas, OH_Drawing_Brush *brush, float w, float h)
{
    OH_Drawing_BrushSetColor(brush, COLOR_ACCENT);
    FillRect(canvas, brush, w * 0.1F, h * 0.25F, w * 0.6F, h * 0.7F);
    OH_Drawing_BrushSetColor(brush, COLOR_PRIMARY);
    OH_Drawing_BrushSetBlendMode(brush, BLEND_MODE_MULTIPLY);
    FillRect(canvas, brush, w * 0.35F, h * 0.35F, w * 0.9F, h * 0.8F);
}

// 虚线：画笔挂上虚线路径效果后描边，描边结束立刻摘掉效果。
void DrawDashedFrame(OH_Drawing_Canvas *canvas, OH_Drawing_Pen *pen, float w, float h)
{
    float intervals[] = {18.0F, 10.0F};
    OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreateDashPathEffect(intervals, 2, 0.0F);
    OH_Drawing_PenSetPathEffect(pen, pathEffect);
    StrokeRect(canvas, pen, w * 0.1F, h * 0.25F, w * 0.9F, h * 0.75F);
    OH_Drawing_PenSetPathEffect(pen, nullptr);
    OH_Drawing_PathEffectDestroy(pathEffect);
}

// 线性渐变：从左上到右下铺一层四段渐变。
void DrawLinearGradientRect(OH_Drawing_Canvas *canvas, OH_Drawing_Brush *brush, float w, float h)
{
    OH_Drawing_Point *start = OH_Drawing_PointCreate(w * 0.1F, h * 0.2F);
    OH_Drawing_Point *end = OH_Drawing_PointCreate(w * 0.9F, h * 0.8F);
    OH_Drawing_ShaderEffect *shader = OH_Drawing_ShaderEffectCreateLinearGradient(
        start, end, GRADIENT_COLORS, GRADIENT_POS, GRADIENT_COLOR_COUNT, CLAMP);
    if (shader != nullptr) {
        OH_Drawing_BrushSetShaderEffect(brush, shader);
    }
    FillRect(canvas, brush, w * 0.1F, h * 0.2F, w * 0.9F, h * 0.8F);
    OH_Drawing_BrushSetShaderEffect(brush, nullptr);
    OH_Drawing_ShaderEffectDestroy(shader);
    OH_Drawing_PointDestroy(start);
    OH_Drawing_PointDestroy(end);
}

// 径向渐变：以画布中心为原点，半径取短边的 35%。
void DrawRadialGradientCircle(OH_Drawing_Canvas *canvas, OH_Drawing_Brush *brush, float w, float h)
{
    OH_Drawing_Point *center = OH_Drawing_PointCreate(w / 2.0F, h / 2.0F);
    float radius = (w < h ? w : h) * 0.35F;
    OH_Drawing_ShaderEffect *shader = OH_Drawing_ShaderEffectCreateRadialGradient(
        center, radius, GRADIENT_COLORS, GRADIENT_POS, GRADIENT_COLOR_COUNT, CLAMP);
    if (shader != nullptr) {
        OH_Drawing_BrushSetShaderEffect(brush, shader);
    }
    FillCircle(canvas, brush, w / 2.0F, h / 2.0F, radius);
    OH_Drawing_BrushSetShaderEffect(brush, nullptr);
    OH_Drawing_ShaderEffectDestroy(shader);
    OH_Drawing_PointDestroy(center);
}

// 扫描渐变：色相沿圆周排布，半径与径向渐变保持一致。
void DrawSweepGradientCircle(OH_Drawing_Canvas *canvas, OH_Drawing_Brush *brush, float w, float h)
{
    OH_Drawing_Point *center = OH_Drawing_PointCreate(w / 2.0F, h / 2.0F);
    OH_Drawing_ShaderEffect *shader = OH_Drawing_ShaderEffectCreateSweepGradient(
        center, GRADIENT_COLORS, GRADIENT_POS, GRADIENT_COLOR_COUNT, CLAMP);
    if (shader != nullptr) {
        OH_Drawing_BrushSetShaderEffect(brush, shader);
    }
    FillCircle(canvas, brush, w / 2.0F, h / 2.0F, (w < h ? w : h) * 0.35F);
    OH_Drawing_BrushSetShaderEffect(brush, nullptr);
    OH_Drawing_ShaderEffectDestroy(shader);
    OH_Drawing_PointDestroy(center);
}

// 滤波分支：颜色矩阵滤波与蒙版模糊各自封装，主分派只保留一次调用。
void DrawFilteredEffect(OH_Drawing_Canvas *canvas, OH_Drawing_Brush *brush, int32_t kind, float w, float h)
{
    if (kind == EFFECT_COLOR_FILTER) {
        DrawColorFilteredRect(canvas, brush, w * 0.1F, h * 0.2F, w * 0.9F, h * 0.8F);
        return;
    }
    DrawBlurredCircle(canvas, brush, w / 2.0F, h / 2.0F, (w < h ? w : h) * 0.25F);
}

// 按种类分派：画笔与画刷的公共属性在此设置，具体场景交给各自的封装函数。
void DrawEffectKind(OH_Drawing_Canvas *canvas, OH_Drawing_Brush *brush, OH_Drawing_Pen *pen, int32_t kind,
    float w, float h)
{
    OH_Drawing_BrushSetAntiAlias(brush, true);
    OH_Drawing_PenSetAntiAlias(pen, true);
    OH_Drawing_PenSetWidth(pen, 6.0F);
    OH_Drawing_PenSetColor(pen, COLOR_PRIMARY);
    switch (kind) {
        case EFFECT_FILL_STROKE:
            DrawFillStrokePair(canvas, brush, pen, w, h);
            break;
        case EFFECT_BLEND_MODE:
            DrawMultiplyOverlap(canvas, brush, w, h);
            break;
        case EFFECT_DASH:
            DrawDashedFrame(canvas, pen, w, h);
            break;
        case EFFECT_LINEAR_GRADIENT:
            DrawLinearGradientRect(canvas, brush, w, h);
            break;
        case EFFECT_RADIAL_GRADIENT:
            DrawRadialGradientCircle(canvas, brush, w, h);
            break;
        case EFFECT_SWEEP_GRADIENT:
            DrawSweepGradientCircle(canvas, brush, w, h);
            break;
        case EFFECT_COLOR_FILTER:
        case EFFECT_MASK_BLUR:
            DrawFilteredEffect(canvas, brush, kind, w, h);
            break;
        default:
            break;
    }
}
} // namespace

void DrawEffectScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t kind)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawEffectScene invalid param, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (kind < 0 || kind >= EFFECT_KIND_COUNT) {
        DRAWING_LOGE("DrawEffectScene unsupported kind=%{public}d", kind);
        return;
    }
    const float w = static_cast<float>(width);
    const float h = static_cast<float>(height);
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_Pen *pen = OH_Drawing_PenCreate();
    if (brush == nullptr || pen == nullptr) {
        OH_Drawing_BrushDestroy(brush);
        OH_Drawing_PenDestroy(pen);
        DRAWING_LOGE("DrawEffectScene create brush or pen failed");
        return;
    }
    DrawEffectKind(canvas, brush, pen, kind, w, h);

    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_PenDestroy(pen);
    DRAWING_LOGI("DrawEffectScene done, kind=%{public}d width=%{public}d height=%{public}d", kind, width, height);
}
} // namespace ndr
