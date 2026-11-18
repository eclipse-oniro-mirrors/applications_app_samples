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
#include "cap_paint.h"

#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_path_effect.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_shadow_layer.h>

#include "common/log_common.h"
#include "capability/cap_util.h"
#include "capability/capability_type.h"

namespace ndr {
namespace {

OH_Drawing_PenLineCapStyle ToCapStyle(int32_t index)
{
    switch (index) {
        case 0:
            return LINE_FLAT_CAP;
        case 1:
            return LINE_SQUARE_CAP;
        default:
            return LINE_ROUND_CAP;
    }
}

OH_Drawing_PenLineJoinStyle ToJoinStyle(int32_t index)
{
    switch (index) {
        case 0:
            return LINE_MITER_JOIN;
        case 1:
            return LINE_ROUND_JOIN;
        default:
            return LINE_BEVEL_JOIN;
    }
}

OH_Drawing_BlendMode ToBlendMode(int32_t index)
{
    switch (index) {
        case 1:
            return BLEND_MODE_SCREEN;
        case 2:
            return BLEND_MODE_OVERLAY;
        case 3:
            return BLEND_MODE_DIFFERENCE;
        default:
            return BLEND_MODE_MULTIPLY;
    }
}

// 选中的选项用主色高亮，其余用低透明度弱化，形成对比。
uint32_t OptionColor(int32_t index, int32_t selected, int32_t palette)
{
    if (index == selected) {
        return cap::PaletteColor(palette);
    }
    return cap::WithAlpha(cap::PaletteColor(index), 0.25F);
}

// 0. 画笔端点：flat / square / round 三种端点并排显示，宽线更容易看出差异。
void ScenePenCap(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t selected = params.Choice(0, 3, 2);
    const float width = params.Range(1, 16.0F, 2.0F, 30.0F);
    for (int32_t index = 0; index < 3; index++) {
        OH_Drawing_Pen *pen = cap::NewPen(OptionColor(index, selected, 0), width);
        if (pen == nullptr) {
            continue;
        }
        OH_Drawing_PenSetCap(pen, ToCapStyle(index));
        const float y = frame.Y(20.0F + static_cast<float>(index) * 30.0F);
        OH_Drawing_CanvasAttachPen(canvas, pen);
        OH_Drawing_CanvasDrawLine(canvas, frame.X(22.0F), y, frame.X(78.0F), y);
        OH_Drawing_CanvasDetachPen(canvas);
        OH_Drawing_PenDestroy(pen);
    }
}

// 1. 画笔拐角：miterroundbevel 三种连接方式，尖角差异直观。
void ScenePenJoin(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t selected = params.Choice(0, 3, 1);
    const float width = params.Range(1, 18.0F, 2.0F, 30.0F);
    for (int32_t index = 0; index < 3; index++) {
        OH_Drawing_Path *path = OH_Drawing_PathCreate();
        OH_Drawing_Pen *pen = cap::NewPen(OptionColor(index, selected, 0), width);
        if (path == nullptr || pen == nullptr) {
            OH_Drawing_PathDestroy(path);
            OH_Drawing_PenDestroy(pen);
            continue;
        }
        OH_Drawing_PenSetJoin(pen, ToJoinStyle(index));
        const float top = frame.Y(18.0F + static_cast<float>(index) * 30.0F);
        const float bottom = top + frame.Y(14.0F);
        OH_Drawing_PathMoveTo(path, frame.X(20.0F), bottom);
        OH_Drawing_PathLineTo(path, frame.X(50.0F), top);
        OH_Drawing_PathLineTo(path, frame.X(80.0F), bottom);
        OH_Drawing_CanvasAttachPen(canvas, pen);
        OH_Drawing_CanvasDrawPath(canvas, path);
        OH_Drawing_CanvasDetachPen(canvas);
        OH_Drawing_PathDestroy(path);
        OH_Drawing_PenDestroy(pen);
    }
}

// 2. 斜接限制：限制值越大，尖角可延伸得越长。
void ScenePenMiter(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float miterLimit = params.Range(0, 4.0F, 1.0F, 20.0F);
    const float width = params.Range(1, 16.0F, 2.0F, 30.0F);
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    OH_Drawing_Pen *pen = cap::NewPen(cap::PaletteColor(1), width);
    if (path == nullptr || pen == nullptr) {
        OH_Drawing_PathDestroy(path);
        OH_Drawing_PenDestroy(pen);
        return;
    }
    OH_Drawing_PenSetJoin(pen, LINE_MITER_JOIN);
    OH_Drawing_PenSetMiterLimit(pen, miterLimit);
    OH_Drawing_PathMoveTo(path, frame.X(25.0F), frame.Y(70.0F));
    OH_Drawing_PathLineTo(path, frame.X(50.0F), frame.Y(22.0F));
    OH_Drawing_PathLineTo(path, frame.X(75.0F), frame.Y(70.0F));
    OH_Drawing_CanvasAttachPen(canvas, pen);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_CanvasDetachPen(canvas);
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PenDestroy(pen);
}

// 3. 线宽与透明度：同一条线按倍率放大，展示宽度与 alpha 的叠加效果。
void ScenePenWidth(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float width = params.Range(0, 12.0F, 1.0F, 40.0F);
    const float alpha = params.Percent(1, 1.0F);
    for (int32_t index = 0; index < 4; index++) {
        const float scale = 0.5F + static_cast<float>(index) * 0.5F;
        OH_Drawing_Pen *pen = cap::NewPen(cap::WithAlpha(cap::PaletteColor(index), alpha), width * scale);
        if (pen == nullptr) {
            continue;
        }
        const float y = frame.Y(25.0F + static_cast<float>(index) * 18.0F);
        OH_Drawing_CanvasAttachPen(canvas, pen);
        OH_Drawing_CanvasDrawLine(canvas, frame.X(15.0F), y, frame.X(85.0F), y);
        OH_Drawing_CanvasDetachPen(canvas);
        OH_Drawing_PenDestroy(pen);
    }
}

// 4. 画刷透明度：多层半透明色块叠加，重叠处颜色更深。
void SceneBrushAlpha(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float alpha = params.Percent(0, 0.6F);
    const int32_t layers = params.Int(1, 3, 1, 5);
    for (int32_t index = 0; index < layers; index++) {
        const float shift = frame.Span(12.0F) * static_cast<float>(index);
        cap::FillRectArea(canvas, cap::WithAlpha(cap::PaletteColor(index), alpha), frame.X(15.0F) + shift,
            frame.Y(20.0F) + shift, frame.X(65.0F) + shift, frame.Y(65.0F) + shift);
    }
}

// 5. 混合模式：先铺底色，再用指定模式叠加，观察交点颜色。
void SceneBlendMode(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t mode = params.Choice(0, 4, 0);
    const float alpha = params.Percent(1, 1.0F);
    cap::FillRectArea(canvas, cap::PaletteColor(1), frame.X(12.0F), frame.Y(25.0F), frame.X(60.0F), frame.Y(72.0F));
    OH_Drawing_Brush *brush = cap::NewBrush(cap::WithAlpha(cap::PaletteColor(0), alpha));
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(frame.X(38.0F), frame.Y(36.0F), frame.X(88.0F), frame.Y(82.0F));
    if (brush != nullptr && rect != nullptr) {
        OH_Drawing_BrushSetBlendMode(brush, ToBlendMode(mode));
        OH_Drawing_CanvasAttachBrush(canvas, brush);
        OH_Drawing_CanvasDrawRect(canvas, rect);
        OH_Drawing_CanvasDetachBrush(canvas);
    }
    if (rect != nullptr) {
        OH_Drawing_RectDestroy(rect);
    }
    if (brush != nullptr) {
        OH_Drawing_BrushDestroy(brush);
    }
}

// 6. 虚线：DashPathEffect 通过交替的实线段与空白段构造。
void SceneDashEffect(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float dash = params.Range(0, 16.0F, 2.0F, 30.0F);
    const float gap = params.Range(1, 8.0F, 2.0F, 30.0F);
    float intervals[] = {dash, gap};
    OH_Drawing_PathEffect *effect = OH_Drawing_CreateDashPathEffect(intervals, 2, 0.0F);
    OH_Drawing_Pen *pen = cap::NewPen(cap::PaletteColor(0), 8.0F);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(frame.X(12.0F), frame.Y(22.0F), frame.X(88.0F), frame.Y(78.0F));
    if (effect != nullptr && pen != nullptr && rect != nullptr) {
        OH_Drawing_PenSetPathEffect(pen, effect);
        OH_Drawing_CanvasAttachPen(canvas, pen);
        OH_Drawing_CanvasDrawRect(canvas, rect);
        OH_Drawing_CanvasDetachPen(canvas);
    }
    if (rect != nullptr) {
        OH_Drawing_RectDestroy(rect);
    }
    if (pen != nullptr) {
        OH_Drawing_PenDestroy(pen);
    }
    if (effect != nullptr) {
        OH_Drawing_PathEffectDestroy(effect);
    }
}

// 7. 圆角路径效果：把折线拐角自动替换成圆弧。
void SceneCornerEffect(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float radius = params.Range(0, 16.0F, 2.0F, 40.0F);
    const float width = params.Range(1, 12.0F, 2.0F, 30.0F);
    OH_Drawing_PathEffect *effect = OH_Drawing_CreateCornerPathEffect(radius);
    OH_Drawing_Pen *pen = cap::NewPen(cap::PaletteColor(2), width);
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    if (effect != nullptr && pen != nullptr && path != nullptr) {
        OH_Drawing_PenSetPathEffect(pen, effect);
        OH_Drawing_PathMoveTo(path, frame.X(15.0F), frame.Y(25.0F));
        OH_Drawing_PathLineTo(path, frame.X(85.0F), frame.Y(25.0F));
        OH_Drawing_PathLineTo(path, frame.X(85.0F), frame.Y(75.0F));
        OH_Drawing_PathLineTo(path, frame.X(15.0F), frame.Y(75.0F));
        OH_Drawing_PathLineTo(path, frame.X(15.0F), frame.Y(50.0F));
        OH_Drawing_CanvasAttachPen(canvas, pen);
        OH_Drawing_CanvasDrawPath(canvas, path);
        OH_Drawing_CanvasDetachPen(canvas);
    }
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_PathEffectDestroy(effect);
}

// 8. 离散路径效果：沿路径加入随机抖动，形成手绘感。
void SceneDiscreteEffect(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float segment = params.Range(0, 10.0F, 2.0F, 30.0F);
    const float deviation = params.Range(1, 6.0F, 0.0F, 20.0F);
    OH_Drawing_PathEffect *effect = OH_Drawing_CreateDiscretePathEffect(segment, deviation);
    OH_Drawing_Pen *pen = cap::NewPen(cap::PaletteColor(3), 5.0F);
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    if (effect != nullptr && pen != nullptr && path != nullptr) {
        OH_Drawing_PenSetPathEffect(pen, effect);
        OH_Drawing_PathMoveTo(path, frame.X(10.0F), frame.Y(30.0F));
        OH_Drawing_PathQuadTo(path, frame.centerX, frame.Y(70.0F), frame.X(90.0F), frame.Y(30.0F));
        OH_Drawing_CanvasAttachPen(canvas, pen);
        OH_Drawing_CanvasDrawPath(canvas, path);
        OH_Drawing_CanvasDetachPen(canvas);
    }
    OH_Drawing_PathDestroy(path);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_PathEffectDestroy(effect);
}

// 9. 阴影层：模糊半径与偏移控制投影的软硬与方向。
void SceneShadowLayer(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float blur = params.Range(0, 16.0F, 0.0F, 40.0F);
    const float offset = params.Range(1, 10.0F, 0.0F, 30.0F);
    OH_Drawing_ShadowLayer *shadow = OH_Drawing_ShadowLayerCreate(blur, offset, offset, 0x66000000U);
    OH_Drawing_Brush *brush = cap::NewBrush(cap::PaletteColor(0));
    if (shadow != nullptr && brush != nullptr) {
        OH_Drawing_BrushSetShadowLayer(brush, shadow);
        OH_Drawing_Point *center = OH_Drawing_PointCreate(frame.centerX, frame.centerY);
        if (center != nullptr) {
            OH_Drawing_CanvasAttachBrush(canvas, brush);
            OH_Drawing_CanvasDrawCircle(canvas, center, frame.Span(28.0F));
            OH_Drawing_CanvasDetachBrush(canvas);
            OH_Drawing_PointDestroy(center);
        }
    }
    if (brush != nullptr) {
        OH_Drawing_BrushDestroy(brush);
    }
    if (shadow != nullptr) {
        OH_Drawing_ShadowLayerDestroy(shadow);
    }
}
} // namespace

void DrawPaintScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t scene,
    const ParamBag &params)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawPaintScene invalid canvas or size, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (scene < PAINT_PEN_CAP || scene >= PAINT_SCENE_COUNT) {
        DRAWING_LOGE("DrawPaintScene unsupported scene=%{public}d", scene);
        return;
    }
    const cap::Frame frame = cap::MakeFrame(width, height);
    switch (scene) {
        case PAINT_PEN_CAP:
            ScenePenCap(canvas, frame, params);
            break;
        case PAINT_PEN_JOIN:
            ScenePenJoin(canvas, frame, params);
            break;
        case PAINT_PEN_MITER:
            ScenePenMiter(canvas, frame, params);
            break;
        case PAINT_PEN_WIDTH:
            ScenePenWidth(canvas, frame, params);
            break;
        case PAINT_BRUSH_ALPHA:
            SceneBrushAlpha(canvas, frame, params);
            break;
        case PAINT_BLEND_MODE:
            SceneBlendMode(canvas, frame, params);
            break;
        case PAINT_DASH_EFFECT:
            SceneDashEffect(canvas, frame, params);
            break;
        case PAINT_CORNER_EFFECT:
            SceneCornerEffect(canvas, frame, params);
            break;
        case PAINT_DISCRETE_EFFECT:
            SceneDiscreteEffect(canvas, frame, params);
            break;
        case PAINT_SHADOW_LAYER:
            SceneShadowLayer(canvas, frame, params);
            break;
        default:
            break;
    }
    DRAWING_LOGI("DrawPaintScene done, scene=%{public}d size=%{public}dx%{public}d", scene, width, height);
}
} // namespace ndr
