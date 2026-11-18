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
#include "cap_mask_filter.h"

#include <native_drawing/drawing_filter.h>
#include <native_drawing/drawing_font.h>
#include <native_drawing/drawing_mask_filter.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_text_blob.h>

#include "common/log_common.h"
#include "capability/cap_text_util.h"
#include "capability/cap_util.h"
#include "capability/capability_type.h"

namespace ndr {
namespace {
constexpr float MAX_SIGMA = 40.0F;
constexpr int32_t SIGMA_STEPS = 3;
constexpr const char *MASK_TEXT = "MASK";
// 参数面板下标：第 2 位在不同场景分别为透明度、梯度步长、画笔宽度与字号。
constexpr int32_t PARAM_ALPHA = 2;
constexpr int32_t PARAM_SIGMA_STEP = 2;
constexpr int32_t PARAM_PEN_WIDTH = 2;
constexpr int32_t PARAM_FONT_SIZE = 2;
// 第 4 位为模糊类型下拉序号。
constexpr int32_t PARAM_BLUR_TYPE = 3;

// 把下拉序号映射到模糊类型；NORMAL 之外的类型在 Skia 中只支持不跟随 CTM。
OH_Drawing_BlurType ToBlurType(int32_t index)
{
    switch (index) {
        case 1:
            return SOLID;
        case 2:
            return OUTER;
        case 3:
            return INNER;
        default:
            return NORMAL;
    }
}

// SOLID/OUTER/INNER 必须传 respectCTM=false，否则创建会失败并返回空指针。
bool RespectCtm(OH_Drawing_BlurType blurType)
{
    return blurType == NORMAL;
}

// 一整套“带蒙版的画刷”：filter 与 maskFilter 由这里创建，用完统一释放。
struct MaskBrush {
    OH_Drawing_Filter *filter = nullptr;
    OH_Drawing_MaskFilter *maskFilter = nullptr;
    OH_Drawing_Brush *brush = nullptr;
};

bool PrepareMaskBrush(MaskBrush &bundle, OH_Drawing_BlurType blurType, float sigma, uint32_t color)
{
    bundle.maskFilter = OH_Drawing_MaskFilterCreateBlur(blurType, sigma, RespectCtm(blurType));
    bundle.filter = OH_Drawing_FilterCreate();
    bundle.brush = cap::NewBrush(color);
    if (bundle.maskFilter == nullptr || bundle.filter == nullptr || bundle.brush == nullptr) {
        DRAWING_LOGE("PrepareMaskBrush create failed, sigma=%{public}f", sigma);
        return false;
    }
    OH_Drawing_FilterSetMaskFilter(bundle.filter, bundle.maskFilter);
    OH_Drawing_BrushSetFilter(bundle.brush, bundle.filter);
    return true;
}

void ReleaseMaskBrush(MaskBrush &bundle)
{
    if (bundle.brush != nullptr) {
        OH_Drawing_BrushSetFilter(bundle.brush, nullptr);
        OH_Drawing_BrushDestroy(bundle.brush);
        bundle.brush = nullptr;
    }
    if (bundle.filter != nullptr) {
        OH_Drawing_FilterDestroy(bundle.filter);
        bundle.filter = nullptr;
    }
    if (bundle.maskFilter != nullptr) {
        OH_Drawing_MaskFilterDestroy(bundle.maskFilter);
        bundle.maskFilter = nullptr;
    }
}

// 在指定矩形内画一个圆角图元，用于对比“无蒙版”和“有蒙版”的差异。
void FillBlurShape(OH_Drawing_Canvas *canvas, OH_Drawing_Brush *brush, float left, float top, float right,
    float bottom)
{
    if (brush == nullptr || right <= left || bottom <= top) {
        return;
    }
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(left, top, right, bottom);
    if (rect == nullptr) {
        return;
    }
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    OH_Drawing_CanvasDetachBrush(canvas);
    OH_Drawing_RectDestroy(rect);
}

// 四种模糊类型的通用演示：左侧为原始图形，右侧为同一图形经过蒙版后的效果。
void DrawBlurTypeDemo(OH_Drawing_Canvas *canvas, const cap::Frame &frame, OH_Drawing_BlurType blurType,
    int32_t palette, float sigma, float alpha)
{
    const uint32_t color = cap::WithAlpha(cap::PaletteColor(palette), alpha);
    const float top = frame.Y(20.0F);
    const float bottom = frame.Y(80.0F);
    const float plainRight = frame.X(42.0F);
    const float blurLeft = frame.X(58.0F);

    // 原始图形：不使用任何滤波器，作为参照。
    OH_Drawing_Brush *plainBrush = cap::NewBrush(color);
    FillBlurShape(canvas, plainBrush, frame.X(8.0F), top, plainRight, bottom);
    cap::FillRectArea(canvas, cap::WithAlpha(color, 0.25F), frame.X(8.0F), top, plainRight, bottom);
    if (plainBrush != nullptr) {
        OH_Drawing_BrushDestroy(plainBrush);
    }

    // 蒙版图形：形状不变，边缘由 blurType + sigma 决定。
    MaskBrush bundle;
    if (!PrepareMaskBrush(bundle, blurType, sigma, color)) {
        ReleaseMaskBrush(bundle);
        return;
    }
    FillBlurShape(canvas, bundle.brush, blurLeft, top, frame.X(92.0F), bottom);
    ReleaseMaskBrush(bundle);
}

// 0. 标准高斯模糊：内外边缘同时扩散，最贴近常见的“发光”效果。
void SceneBlurNormal(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    DrawBlurTypeDemo(canvas, frame, NORMAL, params.Choice(0, cap::PALETTE_COUNT, 1),
        params.Range(1, 12.0F, 0.0F, MAX_SIGMA), params.Percent(PARAM_ALPHA, 0.85F));
}

// 1. 实心模糊：模糊只在图形外部产生，内部保持原色，适合做“硬边发光”。
void SceneBlurSolid(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    DrawBlurTypeDemo(canvas, frame, SOLID, params.Choice(0, cap::PALETTE_COUNT, 2),
        params.Range(1, 16.0F, 0.0F, MAX_SIGMA), params.Percent(PARAM_ALPHA, 0.9F));
}

// 2. 外发光：只保留图形外侧的模糊，图形本体被裁掉。
void SceneBlurOuter(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    DrawBlurTypeDemo(canvas, frame, OUTER, params.Choice(0, cap::PALETTE_COUNT, 3),
        params.Range(1, 20.0F, 0.0F, MAX_SIGMA), params.Percent(PARAM_ALPHA, 0.95F));
}

// 3. 内发光：模糊只向内扩散，图形外侧保持干净。
void SceneBlurInner(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    DrawBlurTypeDemo(canvas, frame, INNER, params.Choice(0, cap::PALETTE_COUNT, 4),
        params.Range(1, 20.0F, 0.0F, MAX_SIGMA), params.Percent(PARAM_ALPHA, 0.95F));
}

// 4. sigma 梯度：同一模糊类型下，sigma 越大扩散范围越宽。
void SceneBlurSigma(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const float baseSigma = params.Range(1, 6.0F, 0.0F, MAX_SIGMA / 2.0F);
    const float step = params.Range(PARAM_SIGMA_STEP, 8.0F, 0.0F, MAX_SIGMA / 2.0F);
    const float rowHeight = frame.height / static_cast<float>(SIGMA_STEPS + 1);
    const float radius = frame.Span(9.0F);
    for (int32_t index = 0; index < SIGMA_STEPS; ++index) {
        const float sigma = baseSigma + step * static_cast<float>(index);
        const float centerY = rowHeight * static_cast<float>(index) + rowHeight * 0.5F;
        MaskBrush bundle;
        if (!PrepareMaskBrush(bundle, NORMAL, sigma, cap::PaletteColor(palette))) {
            ReleaseMaskBrush(bundle);
            continue;
        }
        OH_Drawing_Point *point = OH_Drawing_PointCreate(frame.centerX, centerY);
        if (point != nullptr) {
            OH_Drawing_CanvasAttachBrush(canvas, bundle.brush);
            OH_Drawing_CanvasDrawCircle(canvas, point, radius);
            OH_Drawing_CanvasDetachBrush(canvas);
            OH_Drawing_PointDestroy(point);
        }
        ReleaseMaskBrush(bundle);
        // 用小方块标注每个 sigma 的位置，便于对照参数面板。
        cap::FillRectArea(canvas, cap::PaletteColor(palette), frame.X(6.0F),
            centerY - rowHeight * 0.15F, frame.X(6.0F) + frame.Span(3.0F), centerY + rowHeight * 0.15F);
    }
}

// 5. 画笔级蒙版：滤波器挂在 Pen 上，描边路径同样会被模糊。
void SceneOnPen(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    const float sigma = params.Range(1, 14.0F, 0.0F, MAX_SIGMA);
    const float width = params.Range(PARAM_PEN_WIDTH, 8.0F, 1.0F, 40.0F);
    OH_Drawing_BlurType blurType = ToBlurType(params.Choice(PARAM_BLUR_TYPE, 4, 1));

    OH_Drawing_Pen *pen = cap::NewPen(cap::PaletteColor(palette), width);
    OH_Drawing_MaskFilter *maskFilter = OH_Drawing_MaskFilterCreateBlur(blurType, sigma, RespectCtm(blurType));
    OH_Drawing_Filter *filter = OH_Drawing_FilterCreate();
    OH_Drawing_Path *path = cap::CreatePolygonPath(frame.centerX, frame.centerY, frame.Span(26.0F), 5);
    if (pen != nullptr && maskFilter != nullptr && filter != nullptr && path != nullptr) {
        OH_Drawing_FilterSetMaskFilter(filter, maskFilter);
        OH_Drawing_PenSetFilter(pen, filter);
        OH_Drawing_PenSetJoin(pen, LINE_ROUND_JOIN);
        OH_Drawing_CanvasAttachPen(canvas, pen);
        OH_Drawing_CanvasDrawPath(canvas, path);
        OH_Drawing_CanvasDetachPen(canvas);
        OH_Drawing_PenSetFilter(pen, nullptr);
    }
    if (path != nullptr) {
        OH_Drawing_PathDestroy(path);
    }
    if (filter != nullptr) {
        OH_Drawing_FilterDestroy(filter);
    }
    if (maskFilter != nullptr) {
        OH_Drawing_MaskFilterDestroy(maskFilter);
    }
    if (pen != nullptr) {
        OH_Drawing_PenDestroy(pen);
    }
}

// 6. 图层级蒙版：SaveLayer 的画笔带蒙版时，整个图层内容作为整体被模糊。
void SceneOnLayer(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 5);
    const float sigma = params.Range(1, 18.0F, 0.0F, MAX_SIGMA);
    const float alpha = params.Percent(PARAM_ALPHA, 0.9F);

    MaskBrush bundle;
    if (!PrepareMaskBrush(bundle, NORMAL, sigma, cap::WithAlpha(cap::PaletteColor(palette), alpha))) {
        ReleaseMaskBrush(bundle);
        return;
    }
    OH_Drawing_Rect *layerRect = OH_Drawing_RectCreate(frame.X(5.0F), frame.Y(10.0F), frame.X(95.0F),
        frame.Y(90.0F));
    if (layerRect != nullptr) {
        // 图层内的颜色使用不透明色，整体透明度交给 SaveLayer 的画笔控制。
        OH_Drawing_CanvasSaveLayer(canvas, layerRect, bundle.brush);
        cap::FillRectArea(canvas, cap::PaletteColor(palette), frame.X(18.0F), frame.Y(26.0F), frame.X(48.0F),
            frame.Y(62.0F));
        cap::FillCircleArea(canvas, cap::PaletteColor(palette + 1), frame.X(64.0F), frame.Y(48.0F),
            frame.Span(14.0F));
        OH_Drawing_CanvasRestore(canvas);
        OH_Drawing_RectDestroy(layerRect);
    }
    ReleaseMaskBrush(bundle);
}

// 7. 文字蒙版：画刷带蒙版时，TextBlob 的字形轮廓也会被模糊。
void SceneOnText(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const float sigma = params.Range(1, 10.0F, 0.0F, MAX_SIGMA);
    const float fontSize = frame.Span(params.Range(PARAM_FONT_SIZE, 22.0F, 8.0F, 48.0F));

    OH_Drawing_Font *font = cap::CreateSampleFont(fontSize);
    if (font == nullptr) {
        return;
    }
    OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobCreateFromString(MASK_TEXT, font, TEXT_ENCODING_UTF8);
    if (textBlob == nullptr) {
        DRAWING_LOGW("SceneOnText create text blob failed, fontSize=%{public}f", fontSize);
        OH_Drawing_FontDestroy(font);
        return;
    }

    // 先画一层无蒙版的文字作为参照，再在其下方画带蒙版的投影。
    OH_Drawing_Brush *plainBrush = cap::NewBrush(cap::PaletteColor(palette));
    if (plainBrush != nullptr) {
        OH_Drawing_CanvasAttachBrush(canvas, plainBrush);
        OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, frame.X(10.0F), frame.Y(40.0F));
        OH_Drawing_CanvasDetachBrush(canvas);
        OH_Drawing_BrushDestroy(plainBrush);
    }

    MaskBrush bundle;
    if (PrepareMaskBrush(bundle, OUTER, sigma, cap::PaletteColor(palette))) {
        OH_Drawing_CanvasAttachBrush(canvas, bundle.brush);
        OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, frame.X(10.0F), frame.Y(72.0F));
        OH_Drawing_CanvasDetachBrush(canvas);
    }
    ReleaseMaskBrush(bundle);

    OH_Drawing_TextBlobDestroy(textBlob);
    OH_Drawing_FontDestroy(font);
}
} // namespace

void DrawMaskFilterScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t scene,
    const ParamBag &params)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawMaskFilterScene invalid canvas or size, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (scene < MASK_BLUR_NORMAL || scene >= MASK_SCENE_COUNT) {
        DRAWING_LOGE("DrawMaskFilterScene unsupported scene=%{public}d", scene);
        return;
    }
    const cap::Frame frame = cap::MakeFrame(width, height);
    switch (scene) {
        case MASK_BLUR_NORMAL:
            SceneBlurNormal(canvas, frame, params);
            break;
        case MASK_BLUR_SOLID:
            SceneBlurSolid(canvas, frame, params);
            break;
        case MASK_BLUR_OUTER:
            SceneBlurOuter(canvas, frame, params);
            break;
        case MASK_BLUR_INNER:
            SceneBlurInner(canvas, frame, params);
            break;
        case MASK_BLUR_SIGMA:
            SceneBlurSigma(canvas, frame, params);
            break;
        case MASK_ON_PEN:
            SceneOnPen(canvas, frame, params);
            break;
        case MASK_ON_LAYER:
            SceneOnLayer(canvas, frame, params);
            break;
        case MASK_ON_TEXT:
            SceneOnText(canvas, frame, params);
            break;
        default:
            break;
    }
    DRAWING_LOGI("DrawMaskFilterScene done, scene=%{public}d size=%{public}dx%{public}d", scene, width, height);
}
} // namespace ndr
