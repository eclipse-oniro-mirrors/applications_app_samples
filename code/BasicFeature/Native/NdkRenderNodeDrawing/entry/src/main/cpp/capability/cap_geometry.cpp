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
#include "cap_geometry.h"

#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_region.h>
#include <native_drawing/drawing_round_rect.h>

#include "common/log_common.h"
#include "capability/cap_util.h"
#include "capability/capability_type.h"

namespace ndr {
namespace {
// 参数面板第 3 位为是否用中心点连线结圆弧。
constexpr int32_t PARAM_USE_CENTER = 2;
// 路径布尔运算的选项下标，与参数面板的下拉顺序一致。
constexpr int32_t PATH_OP_OPTION_XOR = 3;
constexpr int32_t PATH_OP_OPTION_REVERSE_DIFFERENCE = 4;
// 区域布尔运算的选项下标。
constexpr int32_t REGION_OP_OPTION_DIFFERENCE = 2;
// 直线场景并排绘制的条数。
constexpr int32_t LINE_STRIP_COUNT = 3;

// 描边圆弧：Canvas 只提供填充式圆弧，描边需先挂载画笔。
void StrokeArc(OH_Drawing_Canvas *canvas, uint32_t color, float width, const OH_Drawing_Rect *rect,
    float startAngle, float sweepAngle, bool useCenter)
{
    OH_Drawing_Pen *pen = cap::NewPen(color, width);
    if (pen == nullptr || rect == nullptr) {
        if (pen != nullptr) {
            OH_Drawing_PenDestroy(pen);
        }
        return;
    }
    OH_Drawing_CanvasAttachPen(canvas, pen);
    if (useCenter) {
        (void)OH_Drawing_CanvasDrawArcWithCenter(canvas, rect, startAngle, sweepAngle, true);
    } else {
        OH_Drawing_CanvasDrawArc(canvas, rect, startAngle, sweepAngle);
    }
    OH_Drawing_CanvasDetachPen(canvas);
    OH_Drawing_PenDestroy(pen);
}

OH_Drawing_PathOpMode ToPathOpMode(int32_t mode)
{
    switch (mode) {
        case 0:
            return PATH_OP_MODE_DIFFERENCE;
        case 1:
            return PATH_OP_MODE_INTERSECT;
        case PATH_OP_OPTION_XOR:
            return PATH_OP_MODE_XOR;
        case PATH_OP_OPTION_REVERSE_DIFFERENCE:
            return PATH_OP_MODE_REVERSE_DIFFERENCE;
        default:
            return PATH_OP_MODE_UNION;
    }
}

OH_Drawing_RegionOpMode ToRegionOpMode(int32_t mode)
{
    switch (mode) {
        case 1:
            return REGION_OP_MODE_INTERSECT;
        case REGION_OP_OPTION_DIFFERENCE:
            return REGION_OP_MODE_DIFFERENCE;
        default:
            return REGION_OP_MODE_UNION;
    }
}

// 0. 矩形：填充叠描边，宽高由参数控制。
void SceneRect(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float widthPercent = params.Range(0, 60.0F, 10.0F, 90.0F);
    const float heightPercent = params.Range(1, 50.0F, 10.0F, 90.0F);
    const float halfWidth = frame.X(widthPercent) * 0.5F;
    const float halfHeight = frame.Y(heightPercent) * 0.5F;
    const float left = frame.centerX - halfWidth;
    const float top = frame.centerY - halfHeight;
    const float right = frame.centerX + halfWidth;
    const float bottom = frame.centerY + halfHeight;
    cap::FillRectArea(canvas, cap::WithAlpha(cap::PaletteColor(0), 0.35F), left, top, right, bottom);
    cap::StrokeRectArea(canvas, cap::PaletteColor(0), 5.0F, left, top, right, bottom);
}

// 1. 圆角矩形：整体圆角 + 左上角单独放大，展示 SetCorner 的逐角控制。
void SceneRoundRect(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float radiusPercent = params.Range(0, 25.0F, 5.0F, 50.0F);
    const float widthPercent = params.Range(1, 70.0F, 10.0F, 90.0F);
    const float halfWidth = frame.X(widthPercent) * 0.5F;
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(frame.centerX - halfWidth, frame.Y(25.0F),
        frame.centerX + halfWidth, frame.Y(75.0F));
    const float cornerRadius = frame.Span(radiusPercent);
    OH_Drawing_RoundRect *roundRect =
        rect == nullptr ? nullptr : OH_Drawing_RoundRectCreate(rect, cornerRadius, cornerRadius);
    if (roundRect != nullptr) {
        const float sharpRadius = frame.Span(radiusPercent) * 2.0F;
        const OH_Drawing_Corner_Radii sharpRadii = { sharpRadius, sharpRadius };
        OH_Drawing_RoundRectSetCorner(roundRect, CORNER_POS_TOP_LEFT, sharpRadii);
        OH_Drawing_Brush *brush = cap::NewBrush(cap::WithAlpha(cap::PaletteColor(1), 0.55F));
        if (brush != nullptr) {
            OH_Drawing_CanvasAttachBrush(canvas, brush);
            OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);
            OH_Drawing_CanvasDetachBrush(canvas);
            OH_Drawing_BrushDestroy(brush);
        }
        OH_Drawing_RoundRectDestroy(roundRect);
    }
    if (rect != nullptr) {
        OH_Drawing_RectDestroy(rect);
    }
}

// 2. 嵌套圆角矩形：外框与内框同时绘制，展示内外轮廓的关系。
void SceneNestedRoundRect(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float outerRadius = params.Range(0, 30.0F, 5.0F, 50.0F);
    const float innerInset = params.Range(1, 30.0F, 10.0F, 60.0F);
    OH_Drawing_Rect *outerBounds = OH_Drawing_RectCreate(frame.X(10.0F), frame.Y(15.0F), frame.X(90.0F),
        frame.Y(85.0F));
    const float insetX = frame.X(innerInset) * 0.5F;
    const float insetY = frame.Y(innerInset) * 0.5F;
    OH_Drawing_Rect *innerBounds = OH_Drawing_RectCreate(frame.X(10.0F) + insetX, frame.Y(15.0F) + insetY,
        frame.X(90.0F) - insetX, frame.Y(85.0F) - insetY);
    OH_Drawing_RoundRect *outerRound =
        outerBounds == nullptr ? nullptr : OH_Drawing_RoundRectCreate(outerBounds, frame.Span(outerRadius),
            frame.Span(outerRadius));
    OH_Drawing_RoundRect *innerRound =
        innerBounds == nullptr ? nullptr : OH_Drawing_RoundRectCreate(innerBounds, frame.Span(outerRadius * 0.5F),
            frame.Span(outerRadius * 0.5F));
    if (outerRound != nullptr && innerRound != nullptr) {
        OH_Drawing_Brush *brush = cap::NewBrush(cap::WithAlpha(cap::PaletteColor(2), 0.6F));
        if (brush != nullptr) {
            OH_Drawing_CanvasAttachBrush(canvas, brush);
            (void)OH_Drawing_CanvasDrawNestedRoundRect(canvas, outerRound, innerRound);
            OH_Drawing_CanvasDetachBrush(canvas);
            OH_Drawing_BrushDestroy(brush);
        }
    }
    if (innerRound != nullptr) {
        OH_Drawing_RoundRectDestroy(innerRound);
    }
    if (outerRound != nullptr) {
        OH_Drawing_RoundRectDestroy(outerRound);
    }
    if (innerBounds != nullptr) {
        OH_Drawing_RectDestroy(innerBounds);
    }
    if (outerBounds != nullptr) {
        OH_Drawing_RectDestroy(outerBounds);
    }
}

// 3. 椭圆：水平与垂直半径独立可调。
void SceneOval(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float radiusXPercent = params.Range(0, 40.0F, 10.0F, 50.0F);
    const float radiusYPercent = params.Range(1, 25.0F, 10.0F, 50.0F);
    const float radiusX = frame.X(radiusXPercent);
    const float radiusY = frame.Y(radiusYPercent);
    cap::FillOvalArea(canvas, cap::WithAlpha(cap::PaletteColor(cap::SLOT_RED), 0.5F), frame.centerX - radiusX,
        frame.centerY - radiusY, frame.centerX + radiusX, frame.centerY + radiusY);
}

// 4. 圆弧：只画弧线，不连接圆心。
void SceneArc(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float startAngle = params.Range(0, 30.0F, -180.0F, 180.0F);
    const float sweepAngle = params.Range(1, 240.0F, 10.0F, 360.0F);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(frame.X(15.0F), frame.Y(15.0F), frame.X(85.0F), frame.Y(85.0F));
    StrokeArc(canvas, cap::PaletteColor(0), 14.0F, rect, startAngle, sweepAngle, false);
    if (rect != nullptr) {
        OH_Drawing_RectDestroy(rect);
    }
}

// 5. 扇形：useCenter 为真时补齐圆心形成扇形。
void SceneArcWithCenter(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float startAngle = params.Range(0, 45.0F, -180.0F, 180.0F);
    const float sweepAngle = params.Range(1, 200.0F, 10.0F, 360.0F);
    const bool useCenter = params.Flag(PARAM_USE_CENTER, true);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(frame.X(15.0F), frame.Y(15.0F), frame.X(85.0F), frame.Y(85.0F));
    if (rect != nullptr) {
        cap::FillArcArea(canvas, cap::WithAlpha(cap::PaletteColor(cap::SLOT_PURPLE), 0.55F), frame.X(15.0F),
            frame.Y(15.0F), frame.X(85.0F), frame.Y(85.0F), startAngle, sweepAngle, useCenter);
        StrokeArc(canvas, cap::PaletteColor(cap::SLOT_PURPLE), 4.0F, rect, startAngle, sweepAngle, useCenter);
        OH_Drawing_RectDestroy(rect);
    }
}

// 6. 直线：线宽与斜向偏移都可调。
void SceneLine(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float thickness = params.Range(0, 8.0F, 1.0F, 24.0F);
    const float offset = frame.Span(params.Range(1, 20.0F, 0.0F, 40.0F));
    for (int32_t index = 0; index < LINE_STRIP_COUNT; index++) {
        const float shift = offset * static_cast<float>(index);
        cap::StrokeLineArea(canvas, cap::PaletteColor(index), thickness, frame.X(12.0F) + shift,
            frame.Y(30.0F) + shift, frame.X(88.0F) - shift, frame.Y(70.0F) - shift);
    }
}

// 7. 正多边形：闭合时同时填充与描边，非闭合时只描边。
void ScenePolygon(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t sides = params.Int(0, 6, 3, 10);
    const bool closed = params.Flag(1, true);
    OH_Drawing_Path *path = cap::CreatePolygonPath(frame.centerX, frame.centerY, frame.Span(38.0F), sides);
    if (path == nullptr) {
        return;
    }
    if (!closed) {
        // 非闭合多边形需要重新构造：AddPolygon 的 isClosed 参数决定是否收尾。
        OH_Drawing_PathReset(path);
        OH_Drawing_Point2D points[cap::MAX_POLYGON_SIDES];
        const int32_t count = sides < cap::MIN_POLYGON_SIDES ? cap::MIN_POLYGON_SIDES :
            (sides > cap::MAX_POLYGON_SIDES ? cap::MAX_POLYGON_SIDES : sides);
        for (int32_t index = 0; index < count; index++) {
            const float angle = cap::PI * cap::FULL_TURN * static_cast<float>(index) / static_cast<float>(count) -
                cap::PI * cap::HALF_TURN;
            points[index].x = frame.centerX + frame.Span(38.0F) * std::cos(angle);
            points[index].y = frame.centerY + frame.Span(38.0F) * std::sin(angle);
        }
        OH_Drawing_PathAddPolygon(path, points, static_cast<uint32_t>(count), false);
    } else {
        cap::FillPathArea(canvas, cap::WithAlpha(cap::PaletteColor(cap::SLOT_GREEN), 0.45F), path);
    }
    cap::StrokePathArea(canvas, cap::PaletteColor(cap::SLOT_GREEN), 5.0F, path);
    OH_Drawing_PathDestroy(path);
}

// 8. 贝塞尔曲线：二次与三次曲线并排对比，曲率与段数可调。
void SceneBezier(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float curvature = params.Percent(0, 0.6F);
    const int32_t segments = params.Int(1, 4, 2, 8);
    const float left = frame.X(12.0F);
    const float right = frame.X(88.0F);
    const float step = (right - left) / static_cast<float>(segments);
    const float amplitude = frame.Span(40.0F) * curvature;

    OH_Drawing_Path *quadPath = OH_Drawing_PathCreate();
    OH_Drawing_Path *cubicPath = OH_Drawing_PathCreate();
    if (quadPath == nullptr || cubicPath == nullptr) {
        OH_Drawing_PathDestroy(quadPath);
        OH_Drawing_PathDestroy(cubicPath);
        return;
    }
    OH_Drawing_PathMoveTo(quadPath, left, frame.Y(35.0F));
    OH_Drawing_PathMoveTo(cubicPath, left, frame.Y(70.0F));
    for (int32_t index = 0; index < segments; index++) {
        const float startX = left + step * static_cast<float>(index);
        const float endX = startX + step;
        const float direction = (index % 2 == 0) ? -1.0F : 1.0F;
        OH_Drawing_PathQuadTo(quadPath, (startX + endX) * 0.5F, frame.Y(35.0F) + direction * amplitude, endX,
            frame.Y(35.0F));
        OH_Drawing_PathCubicTo(cubicPath, startX + step * 0.33F, frame.Y(70.0F) + direction * amplitude,
            startX + step * 0.66F, frame.Y(70.0F) - direction * amplitude, endX, frame.Y(70.0F));
    }
    cap::StrokePathArea(canvas, cap::PaletteColor(0), 5.0F, quadPath);
    cap::StrokePathArea(canvas, cap::PaletteColor(1), 5.0F, cubicPath);
    OH_Drawing_PathDestroy(quadPath);
    OH_Drawing_PathDestroy(cubicPath);
}

// 9. 路径布尔运算：两个圆做 Op，结果填充并描边。
void ScenePathOp(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t mode = params.Choice(0, 5, 2);
    const float offset = frame.Span(params.Range(1, 15.0F, 0.0F, 40.0F));
    OH_Drawing_Path *left = cap::CreateCirclePath(frame.centerX - offset * 0.5F, frame.centerY, frame.Span(30.0F));
    OH_Drawing_Path *right = cap::CreateCirclePath(frame.centerX + offset * 0.5F, frame.centerY, frame.Span(30.0F));
    if (left == nullptr || right == nullptr) {
        OH_Drawing_PathDestroy(left);
        OH_Drawing_PathDestroy(right);
        return;
    }
    // 先画出两个输入圆的轮廓，便于观察运算结果的来源。
    cap::StrokePathArea(canvas, cap::WithAlpha(cap::PaletteColor(cap::SLOT_RED), 0.45F), 2.0F, left);
    cap::StrokePathArea(canvas, cap::WithAlpha(cap::PaletteColor(cap::SLOT_RED), 0.45F), 2.0F, right);
    if (OH_Drawing_PathOp(left, right, ToPathOpMode(mode))) {
        cap::FillPathArea(canvas, cap::WithAlpha(cap::PaletteColor(0), 0.55F), left);
        cap::StrokePathArea(canvas, cap::PaletteColor(0), 4.0F, left);
    } else {
        DRAWING_LOGE("ScenePathOp path op failed, mode=%{public}d", mode);
    }
    OH_Drawing_PathDestroy(left);
    OH_Drawing_PathDestroy(right);
}

// 10. 区域布尔运算：RegionOp 后可导出边界路径用于描边。
void SceneRegionOp(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t mode = params.Choice(0, 3, 0);
    const float inset = params.Range(1, 20.0F, 5.0F, 45.0F);
    OH_Drawing_Region *base = OH_Drawing_RegionCreate();
    OH_Drawing_Region *other = OH_Drawing_RegionCreate();
    OH_Drawing_Rect *baseRect = OH_Drawing_RectCreate(frame.X(inset), frame.Y(15.0F), frame.X(60.0F), frame.Y(85.0F));
    OH_Drawing_Rect *otherRect = OH_Drawing_RectCreate(frame.X(40.0F), frame.Y(inset), frame.X(100.0F - inset),
        frame.Y(100.0F - inset));
    if (base == nullptr || other == nullptr || baseRect == nullptr || otherRect == nullptr) {
        DRAWING_LOGE("SceneRegionOp create object failed");
    } else {
        (void)OH_Drawing_RegionSetRect(base, baseRect);
        (void)OH_Drawing_RegionSetRect(other, otherRect);
        (void)OH_Drawing_RegionOp(base, other, ToRegionOpMode(mode));
        cap::FillRegionArea(canvas, cap::WithAlpha(cap::PaletteColor(cap::SLOT_PURPLE), 0.5F), base);
        OH_Drawing_Path *boundary = OH_Drawing_PathCreate();
        if (boundary != nullptr && OH_Drawing_RegionGetBoundaryPath(base, boundary) == OH_DRAWING_SUCCESS) {
            cap::StrokePathArea(canvas, cap::PaletteColor(cap::SLOT_PURPLE), 4.0F, boundary);
        }
        OH_Drawing_PathDestroy(boundary);
    }
    if (otherRect != nullptr) {
        OH_Drawing_RectDestroy(otherRect);
    }
    if (baseRect != nullptr) {
        OH_Drawing_RectDestroy(baseRect);
    }
    if (other != nullptr) {
        OH_Drawing_RegionDestroy(other);
    }
    if (base != nullptr) {
        OH_Drawing_RegionDestroy(base);
    }
}

// 按场景编号分派：参数校验与日志由对外入口负责，这里只做具体场景转发。
void DrawGeometryKind(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params, int32_t scene)
{
    switch (scene) {
        case GEOMETRY_RECT:
            SceneRect(canvas, frame, params);
            break;
        case GEOMETRY_ROUND_RECT:
            SceneRoundRect(canvas, frame, params);
            break;
        case GEOMETRY_NESTED_ROUND_RECT:
            SceneNestedRoundRect(canvas, frame, params);
            break;
        case GEOMETRY_OVAL:
            SceneOval(canvas, frame, params);
            break;
        case GEOMETRY_ARC:
            SceneArc(canvas, frame, params);
            break;
        case GEOMETRY_ARC_WITH_CENTER:
            SceneArcWithCenter(canvas, frame, params);
            break;
        case GEOMETRY_LINE:
            SceneLine(canvas, frame, params);
            break;
        case GEOMETRY_POLYGON:
            ScenePolygon(canvas, frame, params);
            break;
        case GEOMETRY_BEZIER:
            SceneBezier(canvas, frame, params);
            break;
        case GEOMETRY_PATH_OP:
            ScenePathOp(canvas, frame, params);
            break;
        case GEOMETRY_REGION_OP:
            SceneRegionOp(canvas, frame, params);
            break;
        default:
            break;
    }
}
} // namespace

void DrawGeometryScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t scene,
    const ParamBag &params)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawGeometryScene invalid canvas or size, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (scene < GEOMETRY_RECT || scene >= GEOMETRY_SCENE_COUNT) {
        DRAWING_LOGE("DrawGeometryScene unsupported scene=%{public}d", scene);
        return;
    }
    const cap::Frame frame = cap::MakeFrame(width, height);
    DrawGeometryKind(canvas, frame, params, scene);
    DRAWING_LOGI("DrawGeometryScene done, scene=%{public}d size=%{public}dx%{public}d", scene, width, height);
}
} // namespace ndr
