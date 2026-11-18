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
#include "cap_shadow.h"

#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_font.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_shadow_layer.h>
#include <native_drawing/drawing_text_blob.h>

#include "common/log_common.h"
#include "capability/cap_text_util.h"
#include "capability/cap_util.h"
#include "capability/capability_type.h"

namespace ndr {
namespace {
// 阴影层的模糊半径必须大于 0，小于该值时上涨到下限，避免创建失败。
constexpr float MIN_BLUR_RADIUS = 1.0F;
// 遮挡面离画布的高度决定投影的扩散范围，取 2..80 像素之间的可见区间。
constexpr float MIN_SHADOW_HEIGHT = 2.0F;
constexpr float MAX_SHADOW_HEIGHT = 80.0F;
// 光源离画布的高度固定，位置偏移由参数换算到光源坐标后体现。
constexpr float LIGHT_HEIGHT = 240.0F;
constexpr float MIN_LIGHT_RADIUS = 1.0F;
constexpr float MAX_LIGHT_RADIUS = 30.0F;
constexpr int32_t STACK_COUNT = 3;
// 参数面板下标：第 2 位在各阴影场景分别为纵向偏移、透明度与宽度。
constexpr int32_t PARAM_OFFSET_Y = 2;
constexpr int32_t PARAM_ALPHA = 2;
constexpr int32_t PARAM_WIDTH = 2;

// 画刷与阴影层成对出现：阴影层只对文字绘制生效，因此仅文字场景保留这套封装。
struct ShadowBrush {
    OH_Drawing_ShadowLayer *layer = nullptr;
    OH_Drawing_Brush *brush = nullptr;
};

void ReleaseShadowBrush(ShadowBrush &unit)
{
    if (unit.brush != nullptr) {
        // 先解绑阴影层，再销毁，保证画刷不会持有已释放的对象。
        OH_Drawing_BrushSetShadowLayer(unit.brush, nullptr);
        OH_Drawing_BrushDestroy(unit.brush);
        unit.brush = nullptr;
    }
    if (unit.layer != nullptr) {
        OH_Drawing_ShadowLayerDestroy(unit.layer);
        unit.layer = nullptr;
    }
}

bool PrepareShadowBrush(ShadowBrush &unit, float blur, float dx, float dy, uint32_t shadowColor, uint32_t paintColor)
{
    const float radius = blur < MIN_BLUR_RADIUS ? MIN_BLUR_RADIUS : blur;
    unit.brush = cap::NewBrush(paintColor);
    unit.layer = OH_Drawing_ShadowLayerCreate(radius, dx, dy, shadowColor);
    if (unit.brush == nullptr || unit.layer == nullptr) {
        DRAWING_LOGW("PrepareShadowBrush failed, blur=%{public}f", radius);
        ReleaseShadowBrush(unit);
        return false;
    }
    OH_Drawing_BrushSetShadowLayer(unit.brush, unit.layer);
    return true;
}

// 几何图形的投影统一走 CanvasDrawShadow：Brush/Pen 的阴影层仅对文字生效，给图形用不会有任何效果。
// blur 映射遮挡面离画布的高度（越高投影越散），offsetX/offsetY 映射阴影相对图形的位移。
void DrawPathShadow(OH_Drawing_Canvas *canvas, OH_Drawing_Path *path, const cap::Frame &frame, float blur,
    float offsetX, float offsetY, uint32_t shadowColor)
{
    if (canvas == nullptr || path == nullptr) {
        return;
    }
    const float height = cap::ClampFloat(blur, MIN_SHADOW_HEIGHT, MAX_SHADOW_HEIGHT);
    const OH_Drawing_Point3D plane = {0.0F, 0.0F, height};
    // 阴影落在光源的反方向，因此光源坐标取偏移量的相反方向，保证正偏移对应右下方投影。
    const OH_Drawing_Point3D light = {frame.centerX - offsetX, frame.centerY - offsetY, LIGHT_HEIGHT};
    const float lightRadius = cap::ClampFloat(blur, MIN_LIGHT_RADIUS, MAX_LIGHT_RADIUS);
    OH_Drawing_CanvasDrawShadow(canvas, path, plane, light, lightRadius, shadowColor, shadowColor, SHADOW_FLAGS_ALL);
}

// 0. 模糊半径：同一图形分别用三档模糊半径绘制，直观对比阴影扩散程度。
void SceneBlur(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const float blur = frame.Span(params.Range(1, 6.0F, 1.0F, 24.0F));
    const float radius = frame.Span(11.0F);
    for (int32_t index = 0; index < STACK_COUNT; ++index) {
        const float cx = frame.X(20.0F + 30.0F * static_cast<float>(index));
        const float level = blur * static_cast<float>(index + 1);
        OH_Drawing_Path *path = cap::CreateCirclePath(cx, frame.centerY, radius);
        if (path == nullptr) {
            continue;
        }
        DrawPathShadow(canvas, path, frame, level, 0.0F, frame.Y(3.0F),
            cap::WithAlpha(cap::PaletteColor(palette + 4), 0.55F));
        cap::FillCircleArea(canvas, cap::PaletteColor(palette + index), cx, frame.centerY, radius);
        OH_Drawing_PathDestroy(path);
    }
}

// 1. 阴影偏移：偏移量决定阴影相对图形的方位，参数为负值时阴影落在左上方。
void SceneOffset(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    const float offsetX = frame.X(params.Range(1, 8.0F, -15.0F, 15.0F));
    const float offsetY = frame.Y(params.Range(PARAM_OFFSET_Y, 8.0F, -15.0F, 15.0F));
    const float halfWidth = frame.X(18.0F);
    const float halfHeight = frame.Y(12.0F);
    const float left = frame.centerX - halfWidth;
    const float top = frame.centerY - halfHeight;
    const float right = left + halfWidth * 2.0F;
    const float bottom = top + halfHeight * 2.0F;
    OH_Drawing_Path *path = cap::CreateRectPath(left, top, right, bottom);
    if (path == nullptr) {
        DRAWING_LOGE("SceneOffset create path failed");
        return;
    }
    DrawPathShadow(canvas, path, frame, frame.Span(7.0F), offsetX, offsetY,
        cap::WithAlpha(cap::PaletteColor(palette + 3), 0.7F));
    cap::FillRectArea(canvas, cap::PaletteColor(palette), left, top, right, bottom);
    OH_Drawing_PathDestroy(path);
    // 图形轮廓用描边标出，便于区分阴影本体与来源图形的边界。
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette + 1), 1.0F, left, top, right, bottom);
}

// 2. 阴影颜色：颜色与透明度共同决定阴影观感，透明度越低阴影越淡。
void SceneColor(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    const int32_t shadowPalette = params.Choice(1, cap::PALETTE_COUNT, 5);
    const float alpha = params.Range(PARAM_ALPHA, 0.6F, 0.1F, 1.0F);
    const float size = frame.Span(22.0F);
    for (int32_t index = 0; index < STACK_COUNT; ++index) {
        // 三个色块使用同一阴影颜色，仅透明度按序号递增，形成由淡到浓的对比。
        const float level = alpha * (0.4F + 0.3F * static_cast<float>(index));
        const float left = frame.X(8.0F + 30.0F * static_cast<float>(index));
        const float top = frame.centerY - size * 0.5F;
        OH_Drawing_Path *path = cap::CreateRectPath(left, top, left + size, top + size);
        if (path == nullptr) {
            continue;
        }
        DrawPathShadow(canvas, path, frame, frame.Span(6.0F), frame.X(2.0F), frame.Y(3.0F),
            cap::WithAlpha(cap::PaletteColor(shadowPalette), cap::ClampFloat(level, 0.05F, 1.0F)));
        cap::FillRectArea(canvas, cap::PaletteColor(palette + index), left, top, left + size, top + size);
        OH_Drawing_PathDestroy(path);
    }
}

// 3. 路径阴影：多边形容器本身既描边也投影，适合路径类图形演示。
void SceneOnPen(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 4);
    const float blur = frame.Span(params.Range(1, 5.0F, 1.0F, 20.0F));
    const float width = frame.Span(params.Range(PARAM_WIDTH, 2.0F, 0.5F, 8.0F));
    OH_Drawing_Path *path = cap::CreatePolygonPath(frame.centerX, frame.centerY, frame.Span(26.0F), 5);
    if (path == nullptr) {
        DRAWING_LOGE("SceneOnPen create path failed");
        return;
    }
    DrawPathShadow(canvas, path, frame, blur, frame.X(3.0F), frame.Y(3.0F),
        cap::WithAlpha(cap::PaletteColor(palette + 4), 0.65F));
    // 路径再用描边画一次，保证图形本身轮廓清晰可见。
    cap::StrokePathArea(canvas, cap::PaletteColor(palette + 1), width, path);
    OH_Drawing_PathDestroy(path);
}

// 4. 填充阴影：填充图形投影是最常见的用法，投影参数全部由滑杆控制。
void SceneOnBrush(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 5);
    const float blur = frame.Span(params.Range(1, 8.0F, 1.0F, 24.0F));
    const float radius = frame.Span(24.0F);
    OH_Drawing_Path *path = cap::CreateCirclePath(frame.centerX, frame.centerY, radius);
    if (path == nullptr) {
        DRAWING_LOGE("SceneOnBrush create path failed");
        return;
    }
    DrawPathShadow(canvas, path, frame, blur, frame.X(2.0F), frame.Y(4.0F),
        cap::WithAlpha(cap::PaletteColor(palette + 3), 0.6F));
    cap::FillCircleArea(canvas, cap::PaletteColor(palette), frame.centerX, frame.centerY, radius);
    OH_Drawing_PathDestroy(path);
}

// 5. 多层阴影：三个同心图形各自携带不同模糊半径的阴影，叠加出层次感。
void SceneStack(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const float step = frame.Span(params.Range(1, 14.0F, 8.0F, 24.0F));
    for (int32_t index = 0; index < STACK_COUNT; ++index) {
        const float radius = step * static_cast<float>(STACK_COUNT - index);
        // 半径越小模糊越强，阴影在图形外扩散得更开，形成包裹感。
        const float blur = frame.Span(4.0F) * static_cast<float>(index + 1);
        OH_Drawing_Path *path = cap::CreateCirclePath(frame.centerX, frame.centerY, radius);
        if (path == nullptr) {
            continue;
        }
        DrawPathShadow(canvas, path, frame, blur, 0.0F, frame.Y(2.0F),
            cap::WithAlpha(cap::PaletteColor(palette + index), 0.5F));
        cap::FillCircleArea(canvas, cap::PaletteColor(palette + index), frame.centerX, frame.centerY, radius);
        OH_Drawing_PathDestroy(path);
    }
}

// 6. 文字阴影：文字块通过画刷着色，阴影层对文字是有效的，因此这里保留 BrushSetShadowLayer。
void SceneText(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    const float blur = frame.Span(params.Range(1, 6.0F, 1.0F, 20.0F));
    OH_Drawing_Font *font = cap::CreateSampleFont(frame.Span(20.0F));
    if (font == nullptr) {
        return;
    }
    OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobCreateFromString("Shadow 阴影", font, TEXT_ENCODING_UTF8);
    if (textBlob == nullptr) {
        DRAWING_LOGW("SceneText create text blob failed");
        OH_Drawing_FontDestroy(font);
        return;
    }
    ShadowBrush shadow;
    if (PrepareShadowBrush(shadow, blur, frame.X(3.0F), frame.Y(4.0F),
        cap::WithAlpha(cap::PaletteColor(palette + 4), 0.7F), cap::PaletteColor(palette))) {
        OH_Drawing_CanvasAttachBrush(canvas, shadow.brush);
        OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, frame.X(12.0F), frame.centerY);
        OH_Drawing_CanvasDetachBrush(canvas);
        ReleaseShadowBrush(shadow);
    }
    OH_Drawing_TextBlobDestroy(textBlob);
    OH_Drawing_FontDestroy(font);
}

// 7. 图层阴影：SaveLayer 把阴影限制在指定矩形内，超出部分被裁剪。
void SceneLayer(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 4);
    const float inset = frame.Span(params.Range(1, 8.0F, 0.0F, 20.0F));
    OH_Drawing_Rect *bounds = OH_Drawing_RectCreate(frame.X(14.0F) + inset, frame.Y(20.0F) + inset,
        frame.X(86.0F) - inset, frame.Y(80.0F) - inset);
    if (bounds == nullptr) {
        DRAWING_LOGE("SceneLayer create rect failed");
        return;
    }
    // 先画图层边界，便于观察阴影是否被裁剪在图层范围内。
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette + 5), 1.0F, frame.X(14.0F) + inset,
        frame.Y(20.0F) + inset, frame.X(86.0F) - inset, frame.Y(80.0F) - inset);
    OH_Drawing_CanvasSaveLayer(canvas, bounds, nullptr);
    for (int32_t index = 0; index < STACK_COUNT; ++index) {
        const float cx = frame.X(35.0F + 15.0F * static_cast<float>(index));
        const float radius = frame.Span(9.0F);
        OH_Drawing_Path *path = cap::CreateCirclePath(cx, frame.centerY, radius);
        if (path == nullptr) {
            continue;
        }
        DrawPathShadow(canvas, path, frame, frame.Span(9.0F), frame.X(2.0F), frame.Y(3.0F),
            cap::WithAlpha(cap::PaletteColor(palette + 3), 0.6F));
        cap::FillCircleArea(canvas, cap::PaletteColor(palette + index), cx, frame.centerY, radius);
        OH_Drawing_PathDestroy(path);
    }
    OH_Drawing_CanvasRestore(canvas);
    OH_Drawing_RectDestroy(bounds);
}
} // namespace

void DrawShadowScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t scene,
    const ParamBag &params)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawShadowScene invalid canvas or size, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (scene < SHADOW_BLUR || scene >= SHADOW_SCENE_COUNT) {
        DRAWING_LOGE("DrawShadowScene unsupported scene=%{public}d", scene);
        return;
    }
    const cap::Frame frame = cap::MakeFrame(width, height);
    switch (scene) {
        case SHADOW_BLUR:
            SceneBlur(canvas, frame, params);
            break;
        case SHADOW_OFFSET:
            SceneOffset(canvas, frame, params);
            break;
        case SHADOW_COLOR:
            SceneColor(canvas, frame, params);
            break;
        case SHADOW_ON_PEN:
            SceneOnPen(canvas, frame, params);
            break;
        case SHADOW_ON_BRUSH:
            SceneOnBrush(canvas, frame, params);
            break;
        case SHADOW_STACK:
            SceneStack(canvas, frame, params);
            break;
        case SHADOW_TEXT:
            SceneText(canvas, frame, params);
            break;
        case SHADOW_LAYER:
            SceneLayer(canvas, frame, params);
            break;
        default:
            break;
    }
    DRAWING_LOGI("DrawShadowScene done, scene=%{public}d size=%{public}dx%{public}d", scene, width, height);
}
} // namespace ndr
