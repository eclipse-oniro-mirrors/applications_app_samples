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
#include "drawing_transform.h"

#include <cmath>
#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_matrix.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_rect.h>

#include "common/log_common.h"
#include "drawing/drawing_util.h"
#include "drawing/scene_type.h"

namespace ndr {
namespace {
constexpr float GRID_LINE_WIDTH = 1.0F;
constexpr float OUTLINE_WIDTH = 4.0F;
constexpr int32_t GRID_CELL_COUNT = 6;
constexpr int32_t STAR_POINT_COUNT = 5;
constexpr float ROTATE_DEGREE = 30.0F;
constexpr float PI = 3.14159265358979323846F;

void DrawGrid(OH_Drawing_Canvas *canvas, float width, float height)
{
    OH_Drawing_Pen *pen = OH_Drawing_PenCreate();
    if (pen == nullptr) {
        return;
    }
    OH_Drawing_PenSetAntiAlias(pen, true);
    OH_Drawing_PenSetWidth(pen, GRID_LINE_WIDTH);
    OH_Drawing_PenSetColor(pen, 0xFFE2E8F0);
    OH_Drawing_CanvasAttachPen(canvas, pen);
    for (int32_t i = 1; i < GRID_CELL_COUNT; ++i) {
        const float x = width * static_cast<float>(i) / GRID_CELL_COUNT;
        const float y = height * static_cast<float>(i) / GRID_CELL_COUNT;
        OH_Drawing_CanvasDrawLine(canvas, x, 0.0F, x, height);
        OH_Drawing_CanvasDrawLine(canvas, 0.0F, y, width, y);
    }
    OH_Drawing_CanvasDetachPen(canvas);
    OH_Drawing_PenDestroy(pen);
}

void FillRect(OH_Drawing_Canvas *canvas, uint32_t color, float left, float top, float right, float bottom)
{
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    OH_Drawing_Rect *rect = CreateRect(left, top, right, bottom);
    if (brush == nullptr || rect == nullptr) {
        OH_Drawing_BrushDestroy(brush);
        OH_Drawing_RectDestroy(rect);
        return;
    }
    OH_Drawing_BrushSetAntiAlias(brush, true);
    OH_Drawing_BrushSetColor(brush, color);
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_CanvasDetachBrush(canvas);
    OH_Drawing_BrushDestroy(brush);
    OH_Drawing_RectDestroy(rect);
}

void StrokeRect(OH_Drawing_Canvas *canvas, uint32_t color, float left, float top, float right, float bottom)
{
    OH_Drawing_Pen *pen = OH_Drawing_PenCreate();
    OH_Drawing_Rect *rect = CreateRect(left, top, right, bottom);
    if (pen == nullptr || rect == nullptr) {
        OH_Drawing_PenDestroy(pen);
        OH_Drawing_RectDestroy(rect);
        return;
    }
    OH_Drawing_PenSetAntiAlias(pen, true);
    OH_Drawing_PenSetWidth(pen, OUTLINE_WIDTH);
    OH_Drawing_PenSetColor(pen, color);
    OH_Drawing_CanvasAttachPen(canvas, pen);
    OH_Drawing_CanvasDrawRect(canvas, rect);
    OH_Drawing_CanvasDetachPen(canvas);
    OH_Drawing_PenDestroy(pen);
    OH_Drawing_RectDestroy(rect);
}

// 生成五角星路径，用于演示按路径裁剪。
OH_Drawing_Path *CreateStarPath(float cx, float cy, float radius)
{
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    if (path == nullptr) {
        return nullptr;
    }
    constexpr float startAngle = -90.0F;
    constexpr int32_t step = 2;
    for (int32_t i = 0; i <= STAR_POINT_COUNT; ++i) {
        const float degrees = startAngle + static_cast<float>(i * step) * 360.0F / STAR_POINT_COUNT;
        const float angle = degrees * PI / 180.0F;
        const float x = cx + radius * std::cos(angle);
        const float y = cy + radius * std::sin(angle);
        if (i == 0) {
            OH_Drawing_PathMoveTo(path, x, y);
        } else {
            OH_Drawing_PathLineTo(path, x, y);
        }
    }
    OH_Drawing_PathClose(path);
    return path;
}

// 裁剪区域内绘制配色条带，便于观察裁剪边界。
void DrawStrips(OH_Drawing_Canvas *canvas, float left, float top, float right, float bottom)
{
    constexpr int32_t stripCount = 8;
    const float height = (bottom - top) / stripCount;
    for (int32_t i = 0; i < stripCount; ++i) {
        const uint32_t color = (i % 2 == 0) ? COLOR_PRIMARY : COLOR_ACCENT;
        FillRect(canvas, color, left, top + height * static_cast<float>(i), right,
            top + height * static_cast<float>(i + 1));
    }
}

void DrawClipRect(OH_Drawing_Canvas *canvas, float width, float height)
{
    OH_Drawing_Rect *clipRect = CreateRect(width * 0.2F, height * 0.2F, width * 0.8F, height * 0.8F);
    if (clipRect == nullptr) {
        return;
    }
    OH_Drawing_CanvasSave(canvas);
    OH_Drawing_CanvasClipRect(canvas, clipRect, INTERSECT, true);
    DrawStrips(canvas, width * 0.05F, height * 0.05F, width * 0.95F, height * 0.95F);
    OH_Drawing_CanvasRestore(canvas);
    StrokeRect(canvas, COLOR_TEXT, width * 0.2F, height * 0.2F, width * 0.8F, height * 0.8F);
    OH_Drawing_RectDestroy(clipRect);
}

void DrawClipPath(OH_Drawing_Canvas *canvas, float width, float height)
{
    const float radius = (width < height ? width : height) * 0.4F;
    OH_Drawing_Path *path = CreateStarPath(width / 2.0F, height / 2.0F, radius);
    if (path == nullptr) {
        return;
    }
    OH_Drawing_CanvasSave(canvas);
    OH_Drawing_CanvasClipPath(canvas, path, INTERSECT, true);
    DrawStrips(canvas, 0.0F, 0.0F, width, height);
    OH_Drawing_CanvasRestore(canvas);
    OH_Drawing_Pen *pen = OH_Drawing_PenCreate();
    if (pen != nullptr) {
        OH_Drawing_PenSetAntiAlias(pen, true);
        OH_Drawing_PenSetWidth(pen, OUTLINE_WIDTH);
        OH_Drawing_PenSetColor(pen, COLOR_TEXT);
        OH_Drawing_CanvasAttachPen(canvas, pen);
        OH_Drawing_CanvasDrawPath(canvas, path);
        OH_Drawing_CanvasDetachPen(canvas);
        OH_Drawing_PenDestroy(pen);
    }
    OH_Drawing_PathDestroy(path);
}

void DrawTranslate(OH_Drawing_Canvas *canvas, float width, float height)
{
    DrawGrid(canvas, width, height);
    StrokeRect(canvas, COLOR_TEXT, width * 0.1F, height * 0.35F, width * 0.4F, height * 0.65F);
    OH_Drawing_CanvasSave(canvas);
    OH_Drawing_CanvasTranslate(canvas, width * 0.45F, height * 0.1F);
    FillRect(canvas, COLOR_PRIMARY, width * 0.1F, height * 0.35F, width * 0.4F, height * 0.65F);
    OH_Drawing_CanvasRestore(canvas);
}

void DrawRotate(OH_Drawing_Canvas *canvas, float width, float height)
{
    DrawGrid(canvas, width, height);
    const float cx = width / 2.0F;
    const float cy = height / 2.0F;
    StrokeRect(canvas, COLOR_TEXT, width * 0.3F, height * 0.3F, width * 0.7F, height * 0.7F);
    OH_Drawing_CanvasSave(canvas);
    OH_Drawing_CanvasRotate(canvas, ROTATE_DEGREE, cx, cy);
    FillRect(canvas, COLOR_FILL, width * 0.3F, height * 0.3F, width * 0.7F, height * 0.7F);
    OH_Drawing_CanvasRestore(canvas);
}

void DrawScale(OH_Drawing_Canvas *canvas, float width, float height)
{
    DrawGrid(canvas, width, height);
    const float cx = width / 2.0F;
    const float cy = height / 2.0F;
    StrokeRect(canvas, COLOR_TEXT, width * 0.3F, height * 0.3F, width * 0.7F, height * 0.7F);
    OH_Drawing_CanvasSave(canvas);
    OH_Drawing_CanvasTranslate(canvas, cx, cy);
    OH_Drawing_CanvasScale(canvas, 1.5F, 0.75F);
    OH_Drawing_CanvasTranslate(canvas, -cx, -cy);
    FillRect(canvas, COLOR_FILL, width * 0.3F, height * 0.3F, width * 0.7F, height * 0.7F);
    OH_Drawing_CanvasRestore(canvas);
}

void DrawMatrix(OH_Drawing_Canvas *canvas, float width, float height)
{
    DrawGrid(canvas, width, height);
    const float cx = width / 2.0F;
    const float cy = height / 2.0F;
    StrokeRect(canvas, COLOR_TEXT, width * 0.3F, height * 0.3F, width * 0.7F, height * 0.7F);
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreateRotation(ROTATE_DEGREE, cx, cy);
    if (matrix == nullptr) {
        DRAWING_LOGE("DrawMatrix create matrix failed");
        return;
    }
    OH_Drawing_CanvasSave(canvas);
    OH_Drawing_CanvasConcatMatrix(canvas, matrix);
    FillRect(canvas, COLOR_FILL, width * 0.3F, height * 0.3F, width * 0.7F, height * 0.7F);
    OH_Drawing_CanvasRestore(canvas);
    OH_Drawing_MatrixDestroy(matrix);
}

void DrawSaveRestore(OH_Drawing_Canvas *canvas, float width, float height)
{
    const uint32_t baseCount = OH_Drawing_CanvasGetSaveCount(canvas);
    OH_Drawing_CanvasSave(canvas);
    FillRect(canvas, COLOR_FILL, width * 0.05F, height * 0.05F, width * 0.95F, height * 0.95F);
    OH_Drawing_CanvasSave(canvas);
    OH_Drawing_CanvasTranslate(canvas, width * 0.1F, height * 0.1F);
    FillRect(canvas, COLOR_PRIMARY, width * 0.1F, height * 0.1F, width * 0.6F, height * 0.5F);
    OH_Drawing_CanvasSave(canvas);
    OH_Drawing_CanvasTranslate(canvas, width * 0.2F, height * 0.25F);
    FillRect(canvas, COLOR_ACCENT, width * 0.1F, height * 0.1F, width * 0.6F, height * 0.5F);
    const uint32_t savedCount = OH_Drawing_CanvasGetSaveCount(canvas);
    // 一次性恢复到绘制前保存的状态，等价于连续调用 Restore。
    OH_Drawing_CanvasRestoreToCount(canvas, baseCount);
    DRAWING_LOGI("DrawSaveRestore baseCount=%{public}u savedCount=%{public}u", baseCount, savedCount);
}
} // namespace

void DrawTransformScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t kind)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawTransformScene invalid param, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (kind < TRANSFORM_CLIP_RECT || kind >= TRANSFORM_KIND_COUNT) {
        DRAWING_LOGE("DrawTransformScene unsupported kind=%{public}d", kind);
        return;
    }
    const float w = static_cast<float>(width);
    const float h = static_cast<float>(height);
    switch (kind) {
        case TRANSFORM_CLIP_RECT:
            DrawClipRect(canvas, w, h);
            break;
        case TRANSFORM_CLIP_PATH:
            DrawClipPath(canvas, w, h);
            break;
        case TRANSFORM_TRANSLATE:
            DrawTranslate(canvas, w, h);
            break;
        case TRANSFORM_ROTATE:
            DrawRotate(canvas, w, h);
            break;
        case TRANSFORM_SCALE:
            DrawScale(canvas, w, h);
            break;
        case TRANSFORM_MATRIX:
            DrawMatrix(canvas, w, h);
            break;
        case TRANSFORM_SAVE_RESTORE:
            DrawSaveRestore(canvas, w, h);
            break;
        default:
            break;
    }
    DRAWING_LOGI("DrawTransformScene done, kind=%{public}d width=%{public}d height=%{public}d",
        kind, width, height);
}
} // namespace ndr
