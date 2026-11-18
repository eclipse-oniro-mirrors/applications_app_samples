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
#include "cap_canvas.h"

#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_region.h>
#include <native_drawing/drawing_round_rect.h>

#include "common/log_common.h"
#include "capability/cap_util.h"
#include "capability/capability_type.h"

namespace ndr {
namespace {
constexpr uint32_t MAX_POINT_COUNT = 512;

// 0. 清屏与整幅填充：先清成底色，再叠加半透明色块，对比 alpha 的作用。
void SceneClear(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const float alpha = params.Percent(1, 1.0F);
    OH_Drawing_CanvasClear(canvas, cap::PaletteColor(palette));
    cap::FillRectArea(canvas, cap::WithAlpha(cap::PaletteColor(palette + 3), alpha),
        frame.X(10.0F), frame.Y(15.0F), frame.X(90.0F), frame.Y(85.0F));
    cap::FillCircleArea(canvas, cap::WithAlpha(0xFFFFFFFFU, alpha), frame.centerX, frame.centerY,
        frame.Span(22.0F));
}

// 1. 点阵：一次提交整屏顶点，用 Pen 的圆头端点把点画成圆点。
void ScenePointGrid(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float spacing = params.Range(0, 24.0F, 8.0F, 64.0F);
    const float radius = params.Range(1, 3.0F, 1.0F, 10.0F);
    OH_Drawing_Point2D points[MAX_POINT_COUNT];
    uint32_t count = 0;
    for (float y = frame.Y(8.0F); y <= frame.Y(92.0F) && count < MAX_POINT_COUNT; y += spacing) {
        for (float x = frame.X(8.0F); x <= frame.X(92.0F) && count < MAX_POINT_COUNT; x += spacing) {
            points[count].x = x;
            points[count].y = y;
            count++;
        }
    }
    if (count == 0) {
        return;
    }
    OH_Drawing_Pen *pen = cap::NewPen(cap::PaletteColor(0), radius * 2.0F);
    if (pen == nullptr) {
        return;
    }
    OH_Drawing_PenSetCap(pen, LINE_ROUND_CAP);
    OH_Drawing_CanvasAttachPen(canvas, pen);
    // POINT_MODE_POINTS 表示把每个顶点单独绘制成点。
    OH_Drawing_CanvasDrawPoints(canvas, POINT_MODE_POINTS, count, points);
    OH_Drawing_CanvasDetachPen(canvas);
    OH_Drawing_PenDestroy(pen);
}

// 2. 状态栈：每次 Save 后旋转不同角度，Restore 回到上一状态。
void SceneSaveRestore(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t layers = params.Int(0, 3, 1, 6);
    const float angle = params.Range(1, 30.0F, -90.0F, 90.0F);
    const uint32_t savedCount = OH_Drawing_CanvasGetSaveCount(canvas);
    for (int32_t index = 0; index < layers; index++) {
        OH_Drawing_CanvasSave(canvas);
        OH_Drawing_CanvasRotate(canvas, angle * static_cast<float>(index + 1), frame.centerX, frame.centerY);
        cap::FillRectArea(canvas, cap::WithAlpha(cap::PaletteColor(index), 0.35F),
            frame.centerX - frame.Span(18.0F), frame.centerY - frame.Span(18.0F),
            frame.centerX + frame.Span(18.0F), frame.centerY + frame.Span(18.0F));
        OH_Drawing_CanvasRestore(canvas);
    }
    // 恢复到进入本场景时的状态，避免影响同一次绘制中的后续场景。
    OH_Drawing_CanvasRestoreToCount(canvas, savedCount);
}

// 3. 矩形裁剪：裁剪后绘制斜向条纹，区域外的内容被丢弃。
void SceneClipRect(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float inset = params.Range(0, 25.0F, 5.0F, 45.0F);
    const float angle = params.Range(1, 30.0F, 0.0F, 90.0F);
    OH_Drawing_Rect *clip = OH_Drawing_RectCreate(frame.X(inset), frame.Y(inset),
        frame.X(100.0F - inset), frame.Y(100.0F - inset));
    if (clip == nullptr) {
        return;
    }
    OH_Drawing_CanvasSave(canvas);
    OH_Drawing_CanvasClipRect(canvas, clip, INTERSECT, true);
    OH_Drawing_CanvasRotate(canvas, angle, frame.centerX, frame.centerY);
    for (int32_t index = -8; index <= 8; index++) {
        const float x = frame.centerX + static_cast<float>(index) * frame.Span(8.0F);
        cap::FillRectArea(canvas, cap::PaletteColor(index), x - frame.Span(2.0F), -frame.height,
            x + frame.Span(2.0F), frame.height * 2.0F);
    }
    OH_Drawing_CanvasRestore(canvas);
    OH_Drawing_RectDestroy(clip);
}

// 4. 圆角矩形裁剪：裁剪区域内绘制同心圆，边界随圆角变化。
void SceneClipRoundRect(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float radiusPercent = params.Range(0, 30.0F, 5.0F, 50.0F);
    const float inset = params.Range(1, 20.0F, 5.0F, 45.0F);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(frame.X(inset), frame.Y(inset),
        frame.X(100.0F - inset), frame.Y(100.0F - inset));
    const float cornerRadius = frame.Span(radiusPercent);
    OH_Drawing_RoundRect *roundRect =
        rect == nullptr ? nullptr : OH_Drawing_RoundRectCreate(rect, cornerRadius, cornerRadius);
    if (roundRect != nullptr) {
        OH_Drawing_CanvasSave(canvas);
        OH_Drawing_CanvasClipRoundRect(canvas, roundRect, INTERSECT, true);
        for (int32_t index = 0; index < 4; index++) {
            cap::FillCircleArea(canvas, cap::PaletteColor(index), frame.centerX, frame.centerY,
                frame.Span(60.0F - static_cast<float>(index) * 12.0F));
        }
        OH_Drawing_CanvasRestore(canvas);
        OH_Drawing_RoundRectDestroy(roundRect);
    }
    if (rect != nullptr) {
        OH_Drawing_RectDestroy(rect);
    }
}

// 5. 路径裁剪：按多边形路径裁剪，边数由参数控制。
void SceneClipPath(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t sides = params.Int(0, 6, 3, 9);
    const float inset = params.Range(1, 20.0F, 5.0F, 45.0F);
    const float clipRadius = frame.Span(100.0F - inset * 2.0F);
    OH_Drawing_Path *path = cap::CreatePolygonPath(frame.centerX, frame.centerY, clipRadius, sides);
    if (path == nullptr) {
        return;
    }
    OH_Drawing_CanvasSave(canvas);
    OH_Drawing_CanvasClipPath(canvas, path, INTERSECT, true);
    for (int32_t index = 0; index < 6; index++) {
        cap::FillRectArea(canvas, cap::PaletteColor(index), 0.0F,
            frame.Y(static_cast<float>(index) * 16.0F), frame.width, frame.Y(static_cast<float>(index + 1) * 16.0F));
    }
    OH_Drawing_CanvasRestore(canvas);
    OH_Drawing_PathDestroy(path);
}

// 6. 区域裁剪：两个矩形的差集作为裁剪区，展示区域布尔运算。
void SceneClipRegion(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float inset = params.Range(0, 20.0F, 5.0F, 45.0F);
    const float offset = params.Range(1, 15.0F, 0.0F, 40.0F);
    OH_Drawing_Region *region = OH_Drawing_RegionCreate();
    OH_Drawing_Region *cut = OH_Drawing_RegionCreate();
    OH_Drawing_Rect *whole = OH_Drawing_RectCreate(frame.X(inset), frame.Y(inset),
        frame.X(100.0F - inset), frame.Y(100.0F - inset));
    OH_Drawing_Rect *hole = OH_Drawing_RectCreate(frame.X(inset + offset), frame.Y(inset + offset),
        frame.X(100.0F - inset - offset), frame.Y(100.0F - inset - offset));
    if (region != nullptr && cut != nullptr && whole != nullptr && hole != nullptr) {
        (void)OH_Drawing_RegionSetRect(region, whole);
        (void)OH_Drawing_RegionSetRect(cut, hole);
        // 差集：整块区域挖掉内圈矩形。
        (void)OH_Drawing_RegionOp(region, cut, REGION_OP_MODE_DIFFERENCE);
        OH_Drawing_CanvasSave(canvas);
        (void)OH_Drawing_CanvasClipRegion(canvas, region, INTERSECT);
        cap::FillRectArea(canvas, cap::PaletteColor(0), 0.0F, 0.0F, frame.width, frame.height);
        cap::FillRectArea(canvas, cap::WithAlpha(cap::PaletteColor(4), 0.5F), 0.0F, frame.Y(40.0F),
            frame.width, frame.Y(60.0F));
        OH_Drawing_CanvasRestore(canvas);
    }
    OH_Drawing_RectDestroy(hole);
    OH_Drawing_RectDestroy(whole);
    OH_Drawing_RegionDestroy(cut);
    OH_Drawing_RegionDestroy(region);
}

// 7. 坐标平移：连续平移三次，色块依次错开。
void SceneTranslate(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float dx = frame.width * params.Range(0, 20.0F, -40.0F, 40.0F) * 0.01F;
    const float dy = frame.height * params.Range(1, 15.0F, -40.0F, 40.0F) * 0.01F;
    for (int32_t index = 0; index < 3; index++) {
        OH_Drawing_CanvasSave(canvas);
        OH_Drawing_CanvasTranslate(canvas, dx * static_cast<float>(index + 1), dy * static_cast<float>(index + 1));
        cap::FillRectArea(canvas, cap::WithAlpha(cap::PaletteColor(index), 0.45F), frame.X(20.0F), frame.Y(25.0F),
            frame.X(70.0F), frame.Y(70.0F));
        OH_Drawing_CanvasRestore(canvas);
    }
    cap::StrokeRectArea(canvas, cap::PaletteColor(4), 2.0F, frame.X(20.0F), frame.Y(25.0F), frame.X(70.0F),
        frame.Y(70.0F));
}

// 8. 坐标倾斜：Skew 接收正切值，这里按角度换算。
void SceneSkew(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float skewX = params.Range(0, 25.0F, -60.0F, 60.0F);
    const float skewY = params.Range(1, 0.0F, -60.0F, 60.0F);
    OH_Drawing_CanvasSave(canvas);
    OH_Drawing_CanvasSkew(canvas, cap::DegreeToTan(skewX), cap::DegreeToTan(skewY));
    cap::FillRectArea(canvas, cap::WithAlpha(cap::PaletteColor(1), 0.75F), frame.X(25.0F), frame.Y(30.0F),
        frame.X(75.0F), frame.Y(70.0F));
    cap::StrokeRectArea(canvas, cap::PaletteColor(0), 3.0F, frame.X(25.0F), frame.Y(30.0F), frame.X(75.0F),
        frame.Y(70.0F));
    OH_Drawing_CanvasRestore(canvas);
}

// 9. 图层：SaveLayer 内的两圆先合成，再以整层透明度回贴，重叠区不会二次变暗。
void SceneSaveLayer(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float alpha = params.Percent(0, 1.0F);
    const float radiusPercent = params.Range(1, 35.0F, 10.0F, 50.0F);
    OH_Drawing_Brush *layerBrush = cap::NewBrush(cap::WithAlpha(0xFFFFFFFFU, alpha));
    OH_Drawing_Rect *bounds = OH_Drawing_RectCreate(frame.X(5.0F), frame.Y(5.0F), frame.X(95.0F), frame.Y(95.0F));
    if (layerBrush != nullptr && bounds != nullptr) {
        OH_Drawing_CanvasSaveLayer(canvas, bounds, layerBrush);
        cap::FillCircleArea(canvas, cap::PaletteColor(0), frame.centerX - frame.Span(radiusPercent * 0.5F),
            frame.centerY, frame.Span(radiusPercent));
        cap::FillCircleArea(canvas, cap::PaletteColor(1), frame.centerX + frame.Span(radiusPercent * 0.5F),
            frame.centerY, frame.Span(radiusPercent));
        OH_Drawing_CanvasRestore(canvas);
    }
    if (bounds != nullptr) {
        OH_Drawing_RectDestroy(bounds);
    }
    if (layerBrush != nullptr) {
        OH_Drawing_BrushDestroy(layerBrush);
    }
}
} // namespace

void DrawCanvasScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t scene,
    const ParamBag &params)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawCanvasScene invalid canvas or size, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (scene < CANVAS_CLEAR || scene >= CANVAS_SCENE_COUNT) {
        DRAWING_LOGE("DrawCanvasScene unsupported scene=%{public}d", scene);
        return;
    }
    const cap::Frame frame = cap::MakeFrame(width, height);
    switch (scene) {
        case CANVAS_CLEAR:
            SceneClear(canvas, frame, params);
            break;
        case CANVAS_POINT_GRID:
            ScenePointGrid(canvas, frame, params);
            break;
        case CANVAS_SAVE_RESTORE:
            SceneSaveRestore(canvas, frame, params);
            break;
        case CANVAS_CLIP_RECT:
            SceneClipRect(canvas, frame, params);
            break;
        case CANVAS_CLIP_ROUND_RECT:
            SceneClipRoundRect(canvas, frame, params);
            break;
        case CANVAS_CLIP_PATH:
            SceneClipPath(canvas, frame, params);
            break;
        case CANVAS_CLIP_REGION:
            SceneClipRegion(canvas, frame, params);
            break;
        case CANVAS_TRANSLATE:
            SceneTranslate(canvas, frame, params);
            break;
        case CANVAS_SKEW:
            SceneSkew(canvas, frame, params);
            break;
        case CANVAS_SAVE_LAYER:
            SceneSaveLayer(canvas, frame, params);
            break;
        default:
            break;
    }
    DRAWING_LOGI("DrawCanvasScene done, scene=%{public}d size=%{public}dx%{public}d", scene, width, height);
}
} // namespace ndr
