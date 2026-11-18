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
#include "cap_shader.h"

#include <cmath>

#include <native_drawing/drawing_matrix.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_shader_effect.h>

#include "common/log_common.h"
#include "capability/cap_util.h"
#include "capability/capability_type.h"

namespace ndr {
namespace {
constexpr uint32_t MAX_GRADIENT_STOPS = 8;

OH_Drawing_TileMode ToTileMode(int32_t index)
{
    switch (index) {
        case 1:
            return REPEAT;
        case 2:
            return MIRROR;
        case 3:
            return DECAL;
        default:
            return CLAMP;
    }
}

OH_Drawing_BlendMode ToShaderBlendMode(int32_t index)
{
    switch (index) {
        case 1:
            return BLEND_MODE_SCREEN;
        case 2:
            return BLEND_MODE_MULTIPLY;
        case 3:
            return BLEND_MODE_OVERLAY;
        case 4:
            return BLEND_MODE_DIFFERENCE;
        default:
            return BLEND_MODE_SRC_OVER;
    }
}

// 渐变方向：以画布中心为基准，按角度求出起点与终点。
void LinearEndpoints(const cap::Frame &frame, float angle, OH_Drawing_Point2D &start, OH_Drawing_Point2D &end)
{
    const float radians = angle * cap::PI / 180.0F;
    const float half = frame.shortSide * 0.5F;
    const float dx = std::cos(radians) * half;
    const float dy = std::sin(radians) * half;
    start.x = frame.centerX - dx;
    start.y = frame.centerY - dy;
    end.x = frame.centerX + dx;
    end.y = frame.centerY + dy;
}

// 用画刷挂载着色器填充矩形，着色器由调用方释放。
void FillRectWithShader(OH_Drawing_Canvas *canvas, OH_Drawing_ShaderEffect *shader,
    float left, float top, float right, float bottom)
{
    OH_Drawing_Brush *brush = cap::NewBrush(0xFFFFFFFFU);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(left, top, right, bottom);
    if (brush != nullptr && rect != nullptr && shader != nullptr) {
        OH_Drawing_BrushSetShaderEffect(brush, shader);
        OH_Drawing_CanvasAttachBrush(canvas, brush);
        OH_Drawing_CanvasDrawRect(canvas, rect);
        OH_Drawing_CanvasDetachBrush(canvas);
        OH_Drawing_BrushSetShaderEffect(brush, nullptr);
    }
    if (rect != nullptr) {
        OH_Drawing_RectDestroy(rect);
    }
    if (brush != nullptr) {
        OH_Drawing_BrushDestroy(brush);
    }
}

// 用画刷挂载着色器填充圆形。
void FillCircleWithShader(OH_Drawing_Canvas *canvas, OH_Drawing_ShaderEffect *shader, float cx, float cy,
    float radius)
{
    OH_Drawing_Brush *brush = cap::NewBrush(0xFFFFFFFFU);
    OH_Drawing_Point *center = OH_Drawing_PointCreate(cx, cy);
    if (brush != nullptr && center != nullptr && shader != nullptr) {
        OH_Drawing_BrushSetShaderEffect(brush, shader);
        OH_Drawing_CanvasAttachBrush(canvas, brush);
        OH_Drawing_CanvasDrawCircle(canvas, center, radius);
        OH_Drawing_CanvasDetachBrush(canvas);
        OH_Drawing_BrushSetShaderEffect(brush, nullptr);
    }
    if (center != nullptr) {
        OH_Drawing_PointDestroy(center);
    }
    if (brush != nullptr) {
        OH_Drawing_BrushDestroy(brush);
    }
}

// 0. 双色线性渐变：角度控制方向，alpha 控制整体透明。
void SceneLinearTwo(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float angle = params.Range(0, 45.0F, 0.0F, 360.0F);
    const float alpha = params.Percent(1, 1.0F);
    OH_Drawing_Point2D start;
    OH_Drawing_Point2D end;
    LinearEndpoints(frame, angle, start, end);
    const uint32_t colors[] = {cap::WithAlpha(cap::PaletteColor(0), alpha),
        cap::WithAlpha(cap::PaletteColor(1), alpha)};
    const float pos[] = {0.0F, 1.0F};
    OH_Drawing_ShaderEffect *shader =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, 2, CLAMP, nullptr);
    FillRectWithShader(canvas, shader, frame.X(6.0F), frame.Y(10.0F), frame.X(94.0F), frame.Y(90.0F));
    OH_Drawing_ShaderEffectDestroy(shader);
}

// 1. 多色标线性渐变：色标由两端颜色插值生成。
void SceneLinearMulti(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t stops = params.Int(0, 3, 2, 6);
    const float angle = params.Range(1, 0.0F, 0.0F, 360.0F);
    uint32_t colors[MAX_GRADIENT_STOPS] = {0};
    float pos[MAX_GRADIENT_STOPS] = {0.0F};
    const float last = static_cast<float>(stops - 1);
    for (int32_t index = 0; index < stops; index++) {
        const float weight = last <= 0.0F ? 0.0F : static_cast<float>(index) / last;
        colors[index] = cap::MixColor(cap::PaletteColor(0), cap::PaletteColor(4), weight);
        pos[index] = weight;
    }
    OH_Drawing_Point2D start;
    OH_Drawing_Point2D end;
    LinearEndpoints(frame, angle, start, end);
    OH_Drawing_ShaderEffect *shader = OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end,
        colors, pos, static_cast<uint32_t>(stops), CLAMP, nullptr);
    FillRectWithShader(canvas, shader, frame.X(6.0F), frame.Y(10.0F), frame.X(94.0F), frame.Y(90.0F));
    OH_Drawing_ShaderEffectDestroy(shader);
}

// 2. 径向渐变：半径与圆心横向位置可调。
void SceneRadial(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float radiusPercent = params.Range(0, 35.0F, 10.0F, 60.0F);
    const float centerPercent = params.Range(1, 50.0F, 10.0F, 90.0F);
    OH_Drawing_Point *center = OH_Drawing_PointCreate(frame.X(centerPercent), frame.centerY);
    const uint32_t colors[] = {0xFFFFFFFFU, cap::PaletteColor(0), cap::PaletteColor(4)};
    const float pos[] = {0.0F, 0.55F, 1.0F};
    OH_Drawing_ShaderEffect *shader = OH_Drawing_ShaderEffectCreateRadialGradient(center, frame.Span(radiusPercent),
        colors, pos, 3, CLAMP);
    FillRectWithShader(canvas, shader, frame.X(4.0F), frame.Y(8.0F), frame.X(96.0F), frame.Y(92.0F));
    OH_Drawing_ShaderEffectDestroy(shader);
    OH_Drawing_PointDestroy(center);
}

// 3. 扫描渐变：通过旋转色标顺序模拟起始角度。
void SceneSweep(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t startAngle = params.Int(0, 0, 0, 360);
    const float alpha = params.Percent(1, 1.0F);
    const int32_t shift = startAngle / 60;
    uint32_t colors[cap::PALETTE_COUNT] = {0};
    float pos[cap::PALETTE_COUNT] = {0.0F};
    for (int32_t index = 0; index < cap::PALETTE_COUNT; index++) {
        colors[index] = cap::WithAlpha(cap::PaletteColor(index + shift), alpha);
        pos[index] = static_cast<float>(index) / static_cast<float>(cap::PALETTE_COUNT);
    }
    OH_Drawing_Point *center = OH_Drawing_PointCreate(frame.centerX, frame.centerY);
    OH_Drawing_ShaderEffect *shader = OH_Drawing_ShaderEffectCreateSweepGradient(center, colors, pos,
        cap::PALETTE_COUNT, CLAMP);
    FillCircleWithShader(canvas, shader, frame.centerX, frame.centerY, frame.Span(42.0F));
    OH_Drawing_ShaderEffectDestroy(shader);
    OH_Drawing_PointDestroy(center);
}

// 4. 两点锥形渐变：内外圆半径与水平位移共同决定锥形形状。
void SceneConical(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float innerPercent = params.Range(0, 10.0F, 0.0F, 50.0F);
    const float offsetPercent = params.Range(1, 50.0F, 10.0F, 90.0F);
    OH_Drawing_Point2D start;
    OH_Drawing_Point2D end;
    start.x = frame.X(offsetPercent) - frame.Span(20.0F);
    start.y = frame.centerY;
    end.x = frame.X(offsetPercent) + frame.Span(20.0F);
    end.y = frame.centerY;
    const uint32_t colors[] = {cap::PaletteColor(1), cap::PaletteColor(0)};
    const float pos[] = {0.0F, 1.0F};
    OH_Drawing_ShaderEffect *shader = OH_Drawing_ShaderEffectCreateTwoPointConicalGradient(&start,
        frame.Span(innerPercent), &end, frame.Span(45.0F), colors, pos, 2, CLAMP, nullptr);
    FillRectWithShader(canvas, shader, frame.X(4.0F), frame.Y(8.0F), frame.X(96.0F), frame.Y(92.0F));
    OH_Drawing_ShaderEffectDestroy(shader);
}

// 5. 纯色着色器：单色也能作为 Shader 使用，便于与渐变统一处理。
void SceneColorShader(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const float alpha = params.Percent(1, 1.0F);
    OH_Drawing_ShaderEffect *shader = OH_Drawing_ShaderEffectCreateColorShader(
        cap::WithAlpha(cap::PaletteColor(palette), alpha));
    FillCircleWithShader(canvas, shader, frame.centerX, frame.centerY, frame.Span(38.0F));
    OH_Drawing_ShaderEffectDestroy(shader);
}

// 6. 着色器组合：底层渐变与顶层单色按混合模式合成。
void SceneCompose(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t mode = params.Choice(0, 5, 0);
    const float angle = params.Range(1, 45.0F, 0.0F, 360.0F);
    OH_Drawing_Point2D start;
    OH_Drawing_Point2D end;
    LinearEndpoints(frame, angle, start, end);
    const uint32_t colors[] = {cap::PaletteColor(0), cap::PaletteColor(1)};
    const float pos[] = {0.0F, 1.0F};
    OH_Drawing_ShaderEffect *base = OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors,
        pos, 2, CLAMP, nullptr);
    OH_Drawing_ShaderEffect *top = OH_Drawing_ShaderEffectCreateColorShader(cap::WithAlpha(cap::PaletteColor(4), 0.5F));
    if (base == nullptr || top == nullptr) {
        OH_Drawing_ShaderEffectDestroy(base);
        OH_Drawing_ShaderEffectDestroy(top);
        return;
    }
    OH_Drawing_ShaderEffect *composed = OH_Drawing_ShaderEffectCreateCompose(base, top, ToShaderBlendMode(mode));
    FillRectWithShader(canvas, composed, frame.X(6.0F), frame.Y(10.0F), frame.X(94.0F), frame.Y(90.0F));
    OH_Drawing_ShaderEffectDestroy(composed);
    OH_Drawing_ShaderEffectDestroy(base);
    OH_Drawing_ShaderEffectDestroy(top);
}

// 7. 画笔着色器：渐变沿描边分布。
void SceneShaderOnPen(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float width = params.Range(0, 12.0F, 2.0F, 30.0F);
    const float angle = params.Range(1, 0.0F, 0.0F, 360.0F);
    OH_Drawing_Point2D start;
    OH_Drawing_Point2D end;
    LinearEndpoints(frame, angle, start, end);
    const uint32_t colors[] = {cap::PaletteColor(0), cap::PaletteColor(2), cap::PaletteColor(1)};
    const float pos[] = {0.0F, 0.5F, 1.0F};
    OH_Drawing_ShaderEffect *shader = OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors,
        pos, 3, CLAMP, nullptr);
    OH_Drawing_Pen *pen = cap::NewPen(cap::PaletteColor(0), width);
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(frame.X(12.0F), frame.Y(20.0F), frame.X(88.0F), frame.Y(80.0F));
    if (shader != nullptr && pen != nullptr && rect != nullptr) {
        OH_Drawing_PenSetShaderEffect(pen, shader);
        OH_Drawing_CanvasAttachPen(canvas, pen);
        OH_Drawing_CanvasDrawRect(canvas, rect);
        OH_Drawing_CanvasDetachPen(canvas);
        OH_Drawing_PenSetShaderEffect(pen, nullptr);
    }
    if (rect != nullptr) {
        OH_Drawing_RectDestroy(rect);
    }
    if (pen != nullptr) {
        OH_Drawing_PenDestroy(pen);
    }
    OH_Drawing_ShaderEffectDestroy(shader);
}

// 8. 局部矩阵：先构造渐变，再用矩阵缩放旋转，渐变随之变形。
void SceneLocalMatrix(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float scale = params.Percent(0, 1.0F);
    const float angle = params.Range(1, 30.0F, -90.0F, 90.0F);
    OH_Drawing_Point2D start;
    OH_Drawing_Point2D end;
    LinearEndpoints(frame, 0.0F, start, end);
    OH_Drawing_Matrix *matrix = OH_Drawing_MatrixCreate();
    if (matrix == nullptr) {
        return;
    }
    OH_Drawing_MatrixPreScale(matrix, 0.2F + scale * 1.8F, 1.0F, frame.centerX, frame.centerY);
    OH_Drawing_MatrixPreRotate(matrix, angle, frame.centerX, frame.centerY);
    const uint32_t colors[] = {cap::PaletteColor(1), cap::PaletteColor(0)};
    const float pos[] = {0.0F, 1.0F};
    OH_Drawing_ShaderEffect *shader = OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors,
        pos, 2, CLAMP, matrix);
    FillRectWithShader(canvas, shader, frame.X(6.0F), frame.Y(10.0F), frame.X(94.0F), frame.Y(90.0F));
    OH_Drawing_ShaderEffectDestroy(shader);
    OH_Drawing_MatrixDestroy(matrix);
}

// 9. 平铺模式：渐变区间被压缩后，区间外的填充方式由 tileMode 决定。
void SceneTileMode(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t tile = params.Choice(0, 4, 1);
    const float density = params.Range(1, 3.0F, 1.0F, 4.0F);
    const float span = frame.width / (4.0F * density);
    OH_Drawing_Point2D start;
    OH_Drawing_Point2D end;
    start.x = frame.X(10.0F);
    start.y = frame.centerY;
    end.x = frame.X(10.0F) + span;
    end.y = frame.centerY;
    const uint32_t colors[] = {cap::PaletteColor(0), cap::PaletteColor(1)};
    const float pos[] = {0.0F, 1.0F};
    OH_Drawing_ShaderEffect *shader = OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors,
        pos, 2, ToTileMode(tile), nullptr);
    FillRectWithShader(canvas, shader, frame.X(4.0F), frame.Y(15.0F), frame.X(96.0F), frame.Y(85.0F));
    OH_Drawing_ShaderEffectDestroy(shader);
}

// 10. 渐变透明度：两端 alpha 不同，形成淡入淡出。
void SceneGradientAlpha(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const float startAlpha = params.Percent(0, 1.0F);
    const float endAlpha = params.Percent(1, 0.2F);
    cap::FillRectArea(canvas, cap::PaletteColor(3), frame.X(4.0F), frame.Y(15.0F), frame.X(96.0F), frame.Y(85.0F));
    const uint32_t colors[] = {cap::WithAlpha(cap::PaletteColor(0), startAlpha),
        cap::WithAlpha(cap::PaletteColor(0), endAlpha)};
    const float pos[] = {0.0F, 1.0F};
    OH_Drawing_Point2D start = {frame.X(10.0F), frame.centerY};
    OH_Drawing_Point2D end = {frame.X(90.0F), frame.centerY};
    OH_Drawing_ShaderEffect *shader = OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors,
        pos, 2, CLAMP, nullptr);
    FillRectWithShader(canvas, shader, frame.X(4.0F), frame.Y(15.0F), frame.X(96.0F), frame.Y(85.0F));
    OH_Drawing_ShaderEffectDestroy(shader);
}

// 按场景编号分派：参数校验与日志由对外入口负责，这里只做具体场景转发。
void DrawShaderKind(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params, int32_t scene)
{
    switch (scene) {
        case SHADER_LINEAR_TWO:
            SceneLinearTwo(canvas, frame, params);
            break;
        case SHADER_LINEAR_MULTI:
            SceneLinearMulti(canvas, frame, params);
            break;
        case SHADER_RADIAL:
            SceneRadial(canvas, frame, params);
            break;
        case SHADER_SWEEP:
            SceneSweep(canvas, frame, params);
            break;
        case SHADER_CONICAL:
            SceneConical(canvas, frame, params);
            break;
        case SHADER_COLOR:
            SceneColorShader(canvas, frame, params);
            break;
        case SHADER_COMPOSE:
            SceneCompose(canvas, frame, params);
            break;
        case SHADER_ON_PEN:
            SceneShaderOnPen(canvas, frame, params);
            break;
        case SHADER_LOCAL_MATRIX:
            SceneLocalMatrix(canvas, frame, params);
            break;
        case SHADER_TILE_MODE:
            SceneTileMode(canvas, frame, params);
            break;
        case SHADER_GRADIENT_ALPHA:
            SceneGradientAlpha(canvas, frame, params);
            break;
        default:
            break;
    }
}
} // namespace

void DrawShaderScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t scene,
    const ParamBag &params)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawShaderScene invalid canvas or size, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (scene < SHADER_LINEAR_TWO || scene >= SHADER_SCENE_COUNT) {
        DRAWING_LOGE("DrawShaderScene unsupported scene=%{public}d", scene);
        return;
    }
    const cap::Frame frame = cap::MakeFrame(width, height);
    DrawShaderKind(canvas, frame, params, scene);
    DRAWING_LOGI("DrawShaderScene done, scene=%{public}d size=%{public}dx%{public}d", scene, width, height);
}
} // namespace ndr
