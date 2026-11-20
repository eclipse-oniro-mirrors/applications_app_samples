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
#include "cap_util.h"

namespace ndr {
namespace cap {
uint32_t MixColor(uint32_t from, uint32_t to, float ratio)
{
    const float weight = ClampFloat(ratio, 0.0F, 1.0F);
    uint32_t result = 0;
    for (int32_t shift = BLUE_SHIFT; shift <= ALPHA_SHIFT; shift += CHANNEL_BITS) {
        const float start = static_cast<float>((from >> shift) & BYTE_MASK);
        const float stop = static_cast<float>((to >> shift) & BYTE_MASK);
        const uint32_t channel = static_cast<uint32_t>(start + (stop - start) * weight + ROUND_OFFSET);
        result |= (channel & BYTE_MASK) << shift;
    }
    return result;
}

OH_Drawing_Pen *NewPen(uint32_t color, float width)
{
    OH_Drawing_Pen *pen = OH_Drawing_PenCreate();
    if (pen == nullptr) {
        return nullptr;
    }
    OH_Drawing_PenSetAntiAlias(pen, true);
    OH_Drawing_PenSetColor(pen, color);
    OH_Drawing_PenSetWidth(pen, width);
    return pen;
}

void FillRectArea(OH_Drawing_Canvas *canvas, uint32_t color, float left, float top, float right, float bottom)
{
    OH_Drawing_Brush *brush = NewBrush(color);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(left, top, right, bottom);
    if (brush != nullptr && rect != nullptr) {
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

void StrokeRectArea(OH_Drawing_Canvas *canvas, uint32_t color, float width,
    float left, float top, float right, float bottom)
{
    OH_Drawing_Pen *pen = NewPen(color, width);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(left, top, right, bottom);
    if (pen != nullptr && rect != nullptr) {
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
}

void FillCircleArea(OH_Drawing_Canvas *canvas, uint32_t color, float cx, float cy, float radius)
{
    OH_Drawing_Brush *brush = NewBrush(color);
    OH_Drawing_Point *center = OH_Drawing_PointCreate(cx, cy);
    if (brush != nullptr && center != nullptr) {
        OH_Drawing_CanvasAttachBrush(canvas, brush);
        OH_Drawing_CanvasDrawCircle(canvas, center, radius);
        OH_Drawing_CanvasDetachBrush(canvas);
    }
    if (center != nullptr) {
        OH_Drawing_PointDestroy(center);
    }
    if (brush != nullptr) {
        OH_Drawing_BrushDestroy(brush);
    }
}

void StrokeCircleArea(OH_Drawing_Canvas *canvas, uint32_t color, float width, float cx, float cy, float radius)
{
    OH_Drawing_Pen *pen = NewPen(color, width);
    OH_Drawing_Point *center = OH_Drawing_PointCreate(cx, cy);
    if (pen != nullptr && center != nullptr) {
        OH_Drawing_CanvasAttachPen(canvas, pen);
        OH_Drawing_CanvasDrawCircle(canvas, center, radius);
        OH_Drawing_CanvasDetachPen(canvas);
    }
    if (center != nullptr) {
        OH_Drawing_PointDestroy(center);
    }
    if (pen != nullptr) {
        OH_Drawing_PenDestroy(pen);
    }
}

void FillOvalArea(OH_Drawing_Canvas *canvas, uint32_t color, float left, float top, float right, float bottom)
{
    OH_Drawing_Brush *brush = NewBrush(color);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(left, top, right, bottom);
    if (brush != nullptr && rect != nullptr) {
        OH_Drawing_CanvasAttachBrush(canvas, brush);
        OH_Drawing_CanvasDrawOval(canvas, rect);
        OH_Drawing_CanvasDetachBrush(canvas);
    }
    if (rect != nullptr) {
        OH_Drawing_RectDestroy(rect);
    }
    if (brush != nullptr) {
        OH_Drawing_BrushDestroy(brush);
    }
}

void StrokeLineArea(OH_Drawing_Canvas *canvas, uint32_t color, float width,
    float x1, float y1, float x2, float y2)
{
    OH_Drawing_Pen *pen = NewPen(color, width);
    if (pen == nullptr) {
        return;
    }
    OH_Drawing_CanvasAttachPen(canvas, pen);
    OH_Drawing_CanvasDrawLine(canvas, x1, y1, x2, y2);
    OH_Drawing_CanvasDetachPen(canvas);
    OH_Drawing_PenDestroy(pen);
}

void FillRoundRectArea(OH_Drawing_Canvas *canvas, uint32_t color,
    float left, float top, float right, float bottom, float radius)
{
    OH_Drawing_Brush *brush = NewBrush(color);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(left, top, right, bottom);
    OH_Drawing_RoundRect *roundRect = rect == nullptr ? nullptr : OH_Drawing_RoundRectCreate(rect, radius, radius);
    if (brush != nullptr && roundRect != nullptr) {
        OH_Drawing_CanvasAttachBrush(canvas, brush);
        OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);
        OH_Drawing_CanvasDetachBrush(canvas);
    }
    if (roundRect != nullptr) {
        OH_Drawing_RoundRectDestroy(roundRect);
    }
    if (rect != nullptr) {
        OH_Drawing_RectDestroy(rect);
    }
    if (brush != nullptr) {
        OH_Drawing_BrushDestroy(brush);
    }
}

void FillPathArea(OH_Drawing_Canvas *canvas, uint32_t color, OH_Drawing_Path *path)
{
    OH_Drawing_Brush *brush = NewBrush(color);
    if (brush != nullptr && path != nullptr) {
        OH_Drawing_CanvasAttachBrush(canvas, brush);
        OH_Drawing_CanvasDrawPath(canvas, path);
        OH_Drawing_CanvasDetachBrush(canvas);
    }
    if (brush != nullptr) {
        OH_Drawing_BrushDestroy(brush);
    }
}

void StrokePathArea(OH_Drawing_Canvas *canvas, uint32_t color, float width, OH_Drawing_Path *path)
{
    OH_Drawing_Pen *pen = NewPen(color, width);
    if (pen != nullptr && path != nullptr) {
        OH_Drawing_CanvasAttachPen(canvas, pen);
        OH_Drawing_CanvasDrawPath(canvas, path);
        OH_Drawing_CanvasDetachPen(canvas);
    }
    if (pen != nullptr) {
        OH_Drawing_PenDestroy(pen);
    }
}

void FillRegionArea(OH_Drawing_Canvas *canvas, uint32_t color, OH_Drawing_Region *region)
{
    OH_Drawing_Brush *brush = NewBrush(color);
    if (brush != nullptr && region != nullptr) {
        OH_Drawing_CanvasAttachBrush(canvas, brush);
        OH_Drawing_CanvasDrawRegion(canvas, region);
        OH_Drawing_CanvasDetachBrush(canvas);
    }
    if (brush != nullptr) {
        OH_Drawing_BrushDestroy(brush);
    }
}

void FillArcArea(OH_Drawing_Canvas *canvas, uint32_t color, float left, float top, float right, float bottom,
    float startAngle, float sweepAngle, bool useCenter)
{
    OH_Drawing_Brush *brush = NewBrush(color);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(left, top, right, bottom);
    if (brush != nullptr && rect != nullptr) {
        OH_Drawing_CanvasAttachBrush(canvas, brush);
        if (useCenter) {
            (void)OH_Drawing_CanvasDrawArcWithCenter(canvas, rect, startAngle, sweepAngle, true);
        } else {
            OH_Drawing_CanvasDrawArc(canvas, rect, startAngle, sweepAngle);
        }
        OH_Drawing_CanvasDetachBrush(canvas);
    }
    if (rect != nullptr) {
        OH_Drawing_RectDestroy(rect);
    }
    if (brush != nullptr) {
        OH_Drawing_BrushDestroy(brush);
    }
}

OH_Drawing_Path *CreatePolygonPath(float cx, float cy, float radius, int32_t sides)
{
    const int32_t count = sides < MIN_POLYGON_SIDES ? MIN_POLYGON_SIDES :
        (sides > MAX_POLYGON_SIDES ? MAX_POLYGON_SIDES : sides);
    OH_Drawing_Point2D points[MAX_POLYGON_SIDES];
    for (int32_t index = 0; index < count; index++) {
        const float angle = PI * FULL_TURN * static_cast<float>(index) / static_cast<float>(count) -
            PI * HALF_TURN;
        points[index].x = cx + radius * std::cos(angle);
        points[index].y = cy + radius * std::sin(angle);
    }
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    if (path == nullptr) {
        return nullptr;
    }
    OH_Drawing_PathAddPolygon(path, points, static_cast<uint32_t>(count), true);
    return path;
}
} // namespace cap
} // namespace ndr
