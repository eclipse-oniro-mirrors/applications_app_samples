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
#include "drawing_shape.h"

#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_region.h>
#include <native_drawing/drawing_round_rect.h>

#include "common/log_common.h"
#include "drawing/drawing_util.h"
#include "drawing/scene_type.h"

namespace ndr {
namespace {
struct DrawStyle {
    OH_Drawing_Pen *pen = nullptr;
    OH_Drawing_Brush *brush = nullptr;
};

// 统一挂载描边画笔与填充画刷，返回值非空表示挂载成功。
DrawStyle AttachStyle(OH_Drawing_Canvas *canvas)
{
    DrawStyle style;
    style.pen = OH_Drawing_PenCreate();
    style.brush = OH_Drawing_BrushCreate();
    if (style.pen == nullptr || style.brush == nullptr) {
        DRAWING_LOGE("AttachStyle failed, pen or brush is null");
        return style;
    }
    OH_Drawing_PenSetAntiAlias(style.pen, true);
    OH_Drawing_PenSetColor(style.pen, COLOR_PRIMARY);
    OH_Drawing_PenSetWidth(style.pen, 4.0F);
    OH_Drawing_BrushSetAntiAlias(style.brush, true);
    OH_Drawing_BrushSetColor(style.brush, COLOR_FILL);
    OH_Drawing_CanvasAttachPen(canvas, style.pen);
    OH_Drawing_CanvasAttachBrush(canvas, style.brush);
    return style;
}

void DetachStyle(OH_Drawing_Canvas *canvas, DrawStyle &style)
{
    OH_Drawing_CanvasDetachPen(canvas);
    OH_Drawing_CanvasDetachBrush(canvas);
    if (style.pen != nullptr) {
        OH_Drawing_PenDestroy(style.pen);
        style.pen = nullptr;
    }
    if (style.brush != nullptr) {
        OH_Drawing_BrushDestroy(style.brush);
        style.brush = nullptr;
    }
}

void DrawPoint(OH_Drawing_Canvas *canvas, float cx, float cy)
{
    OH_Drawing_Point2D point = {cx, cy};
    (void)OH_Drawing_CanvasDrawPoint(canvas, &point);
}

void DrawCircle(OH_Drawing_Canvas *canvas, float cx, float cy, float radius)
{
    OH_Drawing_Point *center = OH_Drawing_PointCreate(cx, cy);
    if (center == nullptr) {
        return;
    }
    OH_Drawing_CanvasDrawCircle(canvas, center, radius);
    OH_Drawing_PointDestroy(center);
}

void DrawArc(OH_Drawing_Canvas *canvas, float left, float top, float right, float bottom)
{
    OH_Drawing_Rect *rect = CreateRect(left, top, right, bottom);
    if (rect == nullptr) {
        return;
    }
    // useCenter 为 true 时绘制扇形，否则只绘制圆弧。
    (void)OH_Drawing_CanvasDrawArcWithCenter(canvas, rect, 30.0F, 240.0F, true);
    OH_Drawing_RectDestroy(rect);
}

void DrawTrianglePath(OH_Drawing_Canvas *canvas, float cx, float top, float bottom)
{
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    if (path == nullptr) {
        return;
    }
    OH_Drawing_PathMoveTo(path, cx, top);
    OH_Drawing_PathLineTo(path, cx + (bottom - top) * 0.6F, bottom);
    OH_Drawing_PathLineTo(path, cx - (bottom - top) * 0.6F, bottom);
    OH_Drawing_PathClose(path);
    OH_Drawing_CanvasDrawPath(canvas, path);
    OH_Drawing_PathDestroy(path);
}

void DrawRegionRect(OH_Drawing_Canvas *canvas, float left, float top, float right, float bottom)
{
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    OH_Drawing_Rect *rect = CreateRect(left, top, right, bottom);
    if (region == nullptr || rect == nullptr) {
        OH_Drawing_RectDestroy(rect);
        OH_Drawing_RegionDestroy(region);
        return;
    }
    (void)OH_Drawing_RegionSetRect(region, rect);
    OH_Drawing_CanvasDrawRegion(canvas, region);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_RegionDestroy(region);
}

void DrawOval(OH_Drawing_Canvas *canvas, float w, float h)
{
    OH_Drawing_Rect *rect = CreateRect(w * 0.1F, h * 0.25F, w * 0.9F, h * 0.75F);
    if (rect == nullptr) {
        return;
    }
    OH_Drawing_CanvasDrawOval(canvas, rect);
    OH_Drawing_RectDestroy(rect);
}

void DrawRect(OH_Drawing_Canvas *canvas, float w, float h)
{
    OH_Drawing_Rect *rect = CreateRect(w * 0.1F, h * 0.25F, w * 0.9F, h * 0.75F);
    if (rect == nullptr) {
        return;
    }
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_RectDestroy(rect);
}

void DrawRoundRect(OH_Drawing_Canvas *canvas, float w, float h)
{
    OH_Drawing_Rect *rect = CreateRect(w * 0.1F, h * 0.3F, w * 0.9F, h * 0.7F);
    if (rect == nullptr) {
        return;
    }
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(rect, 32.0F, 32.0F);
    OH_Drawing_CanvasDrawRoundRect(canvas, roundRect);
    OH_Drawing_RoundRectDestroy(roundRect);
    OH_Drawing_RectDestroy(rect);
}

// 按形状编号分派：画笔与画刷的挂载由调用方负责，这里只负责具体图形。
void DrawShapeKind(OH_Drawing_Canvas *canvas, int32_t kind, float w, float h)
{
    const float cx = w / 2.0F;
    const float cy = h / 2.0F;
    switch (kind) {
        case SHAPE_POINT:
            DrawPoint(canvas, cx, cy);
            break;
        case SHAPE_LINE:
            OH_Drawing_CanvasDrawLine(canvas, w * 0.15F, h * 0.7F, w * 0.85F, h * 0.3F);
            break;
        case SHAPE_CIRCLE:
            DrawCircle(canvas, cx, cy, w < h ? w * 0.3F : h * 0.3F);
            break;
        case SHAPE_OVAL:
            DrawOval(canvas, w, h);
            break;
        case SHAPE_RECT:
            DrawRect(canvas, w, h);
            break;
        case SHAPE_ROUND_RECT:
            DrawRoundRect(canvas, w, h);
            break;
        case SHAPE_ARC:
            DrawArc(canvas, w * 0.1F, h * 0.2F, w * 0.9F, h * 0.8F);
            break;
        case SHAPE_PATH:
            DrawTrianglePath(canvas, cx, h * 0.2F, h * 0.8F);
            break;
        case SHAPE_REGION:
            DrawRegionRect(canvas, w * 0.15F, h * 0.3F, w * 0.85F, h * 0.7F);
            break;
        default:
            break;
    }
}
} // namespace

void DrawShapeScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t kind)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawShapeScene invalid param, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (kind < SHAPE_POINT || kind >= SHAPE_KIND_COUNT) {
        DRAWING_LOGE("DrawShapeScene unsupported kind=%{public}d", kind);
        return;
    }
    const float w = static_cast<float>(width);
    const float h = static_cast<float>(height);

    DrawStyle style = AttachStyle(canvas);
    DrawShapeKind(canvas, kind, w, h);
    DetachStyle(canvas, style);
    DRAWING_LOGI("DrawShapeScene done, kind=%{public}d width=%{public}d height=%{public}d", kind, width, height);
}
} // namespace ndr
