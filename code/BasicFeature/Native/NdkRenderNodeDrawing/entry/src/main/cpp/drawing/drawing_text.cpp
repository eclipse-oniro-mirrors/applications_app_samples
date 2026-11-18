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
#include "drawing_text.h"

#include <unistd.h>

#include <native_drawing/drawing_brush.h>
#include <native_drawing/drawing_canvas.h>
#include <native_drawing/drawing_font.h>
#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_path_effect.h>
#include <native_drawing/drawing_pen.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_register_font.h>
#include <native_drawing/drawing_text_blob.h>
#include <native_drawing/drawing_text_typography.h>
#include <native_drawing/drawing_typeface.h>

#include "common/log_common.h"
#include "drawing/drawing_util.h"
#include "drawing/scene_type.h"

namespace ndr {
namespace {
constexpr const char *TEXT_CONTENT = "Hello, OpenHarmony! 你好，鸿蒙！";
// 字体文件不存在时回退到系统默认字体，避免直接以空路径注册字体。
constexpr const char *FONT_PATHS[] = {"/system/fonts/NotoSans_KR_Bold.otf"};
constexpr int32_t FONT_COUNT = static_cast<int32_t>(sizeof(FONT_PATHS) / sizeof(FONT_PATHS[0]));
constexpr const char *FONT_FAMILY = "ndrSampleFamily";
constexpr double FONT_SCALE = 16.0;
constexpr double MIN_FONT_SIZE = 12.0;
constexpr double MAX_FONT_SIZE = 96.0;
constexpr float DASH_INTERVALS[] = {12.0F, 8.0F};

struct TypographyBundle {
    OH_Drawing_TypographyStyle *typoStyle = nullptr;
    OH_Drawing_TextStyle *textStyle = nullptr;
    OH_Drawing_TypographyCreate *handler = nullptr;
    OH_Drawing_Typography *typography = nullptr;
};

void DestroyTypography(TypographyBundle &bundle)
{
    if (bundle.typography != nullptr) {
        OH_Drawing_DestroyTypography(bundle.typography);
        bundle.typography = nullptr;
    }
    if (bundle.handler != nullptr) {
        OH_Drawing_DestroyTypographyHandler(bundle.handler);
        bundle.handler = nullptr;
    }
    if (bundle.textStyle != nullptr) {
        OH_Drawing_DestroyTextStyle(bundle.textStyle);
        bundle.textStyle = nullptr;
    }
    if (bundle.typoStyle != nullptr) {
        OH_Drawing_DestroyTypographyStyle(bundle.typoStyle);
        bundle.typoStyle = nullptr;
    }
}

// 仅当字体文件存在且注册成功时才指定自定义字体族，否则沿用系统默认字体。
bool RegisterSampleFont(OH_Drawing_FontCollection *fontCollection, OH_Drawing_TextStyle *textStyle)
{
    for (int32_t i = 0; i < FONT_COUNT; ++i) {
        if (FONT_PATHS[i] == nullptr || access(FONT_PATHS[i], F_OK) != 0) {
            DRAWING_LOGW("font file not found, fallback to system font, index=%{public}d", i);
            continue;
        }
        const uint32_t result = OH_Drawing_RegisterFont(fontCollection, FONT_FAMILY, FONT_PATHS[i]);
        if (result != 0) {
            DRAWING_LOGW("register font failed, result=%{public}u index=%{public}d", result, i);
            continue;
        }
        const char *families[] = {FONT_FAMILY};
        OH_Drawing_SetTextStyleFontFamilies(textStyle, 1, families);
        return true;
    }
    return false;
}

bool BuildTypography(TypographyBundle &bundle, const char *text, double fontSize, double maxWidth,
    OH_Drawing_FontCollection *fontCollection)
{
    bundle.typoStyle = OH_Drawing_CreateTypographyStyle();
    bundle.textStyle = OH_Drawing_CreateTextStyle();
    if (bundle.typoStyle == nullptr || bundle.textStyle == nullptr || fontCollection == nullptr) {
        DRAWING_LOGE("create typography style failed");
        return false;
    }
    OH_Drawing_SetTypographyTextDirection(bundle.typoStyle, TEXT_DIRECTION_LTR);
    OH_Drawing_SetTypographyTextAlign(bundle.typoStyle, TEXT_ALIGN_LEFT);
    OH_Drawing_SetTextStyleColor(bundle.textStyle, COLOR_TEXT);
    OH_Drawing_SetTextStyleFontSize(bundle.textStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(bundle.textStyle, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(bundle.textStyle, TEXT_BASELINE_ALPHABETIC);
    OH_Drawing_SetTextStyleFontHeight(bundle.textStyle, 1.0);
    (void)RegisterSampleFont(fontCollection, bundle.textStyle);

    bundle.handler = OH_Drawing_CreateTypographyHandler(bundle.typoStyle, fontCollection);
    if (bundle.handler == nullptr) {
        DRAWING_LOGE("create typography handler failed");
        return false;
    }
    OH_Drawing_TypographyHandlerPushTextStyle(bundle.handler, bundle.textStyle);
    OH_Drawing_TypographyHandlerAddText(bundle.handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(bundle.handler);
    bundle.typography = OH_Drawing_CreateTypography(bundle.handler);
    if (bundle.typography == nullptr) {
        DRAWING_LOGE("create typography failed");
        return false;
    }
    OH_Drawing_TypographyLayout(bundle.typography, maxWidth);
    return true;
}

double ClampFontSize(double fontSize)
{
    if (fontSize < MIN_FONT_SIZE) {
        return MIN_FONT_SIZE;
    }
    if (fontSize > MAX_FONT_SIZE) {
        return MAX_FONT_SIZE;
    }
    return fontSize;
}

void DrawTypography(OH_Drawing_Canvas *canvas, int32_t width, int32_t height)
{
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_CreateSharedFontCollection();
    if (fontCollection == nullptr) {
        DRAWING_LOGE("create font collection failed");
        return;
    }
    const double fontSize = ClampFontSize(static_cast<double>(width) / FONT_SCALE);
    TypographyBundle bundle;
    const double maxWidth = static_cast<double>(width) * 0.9;
    if (BuildTypography(bundle, TEXT_CONTENT, fontSize, maxWidth, fontCollection)) {
        OH_Drawing_TypographyPaint(bundle.typography, canvas, width * 0.05, height * 0.3);
    }
    DestroyTypography(bundle);
    OH_Drawing_DestroyFontCollection(fontCollection);
}

void DrawTextBlob(OH_Drawing_Canvas *canvas, int32_t width, int32_t height)
{
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    if (font == nullptr) {
        DRAWING_LOGE("create font failed");
        return;
    }
    OH_Drawing_FontSetTextSize(font, ClampFontSize(static_cast<double>(width) / FONT_SCALE));
    for (int32_t i = 0; i < FONT_COUNT; ++i) {
        if (FONT_PATHS[i] == nullptr || access(FONT_PATHS[i], F_OK) != 0) {
            DRAWING_LOGW("font file not found, use default typeface, index=%{public}d", i);
            continue;
        }
        OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateFromFile(FONT_PATHS[i], 0);
        if (typeface != nullptr) {
            OH_Drawing_FontSetTypeface(font, typeface);
            OH_Drawing_TypefaceDestroy(typeface);
            break;
        }
    }
    OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobCreateFromString(TEXT_CONTENT, font, TEXT_ENCODING_UTF8);
    if (textBlob == nullptr) {
        DRAWING_LOGE("create text blob failed");
        OH_Drawing_FontDestroy(font);
        return;
    }
    OH_Drawing_Brush *brush = OH_Drawing_BrushCreate();
    if (brush != nullptr) {
        OH_Drawing_BrushSetAntiAlias(brush, true);
        OH_Drawing_BrushSetColor(brush, COLOR_PRIMARY);
        OH_Drawing_CanvasAttachBrush(canvas, brush);
    }
    // TextBlob 只支持单行绘制，按画布中心线定位。
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, width * 0.05, height * 0.5);
    if (brush != nullptr) {
        OH_Drawing_CanvasDetachBrush(canvas);
        OH_Drawing_BrushDestroy(brush);
    }
    OH_Drawing_TextBlobDestroy(textBlob);
    OH_Drawing_FontDestroy(font);
}

void DrawMeasure(OH_Drawing_Canvas *canvas, int32_t width, int32_t height)
{
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_CreateSharedFontCollection();
    if (fontCollection == nullptr) {
        DRAWING_LOGE("create font collection failed");
        return;
    }
    const double fontSize = ClampFontSize(static_cast<double>(width) / FONT_SCALE);
    TypographyBundle bundle;
    const double maxWidth = static_cast<double>(width) * 0.8;
    if (!BuildTypography(bundle, TEXT_CONTENT, fontSize, maxWidth, fontCollection)) {
        DestroyTypography(bundle);
        OH_Drawing_DestroyFontCollection(fontCollection);
        return;
    }
    const double textWidth = OH_Drawing_TypographyGetLongestLine(bundle.typography);
    const double textHeight = OH_Drawing_TypographyGetHeight(bundle.typography);
    const float left = static_cast<float>(width) * 0.1F;
    const float top = static_cast<float>(height) * 0.25F;
    OH_Drawing_Rect *rect = CreateRect(left, top, left + static_cast<float>(textWidth),
        top + static_cast<float>(textHeight));
    OH_Drawing_Pen *pen = OH_Drawing_PenCreate();
    if (pen != nullptr) {
        float intervals[] = {DASH_INTERVALS[0], DASH_INTERVALS[1]};
        OH_Drawing_PathEffect *pathEffect = OH_Drawing_CreateDashPathEffect(intervals, 2, 0.0F);
        OH_Drawing_PenSetAntiAlias(pen, true);
        OH_Drawing_PenSetWidth(pen, 2.0F);
        OH_Drawing_PenSetColor(pen, COLOR_ACCENT);
        OH_Drawing_PenSetPathEffect(pen, pathEffect);
        OH_Drawing_CanvasAttachPen(canvas, pen);
        if (rect != nullptr) {
            OH_Drawing_CanvasDrawRect(canvas, rect);
        }
        OH_Drawing_CanvasDetachPen(canvas);
        OH_Drawing_PenSetPathEffect(pen, nullptr);
        OH_Drawing_PathEffectDestroy(pathEffect);
        OH_Drawing_PenDestroy(pen);
    }
    OH_Drawing_TypographyPaint(bundle.typography, canvas, left, top);
    DRAWING_LOGI("Measure text width=%{public}f height=%{public}f fontSize=%{public}f",
        static_cast<float>(textWidth), static_cast<float>(textHeight), static_cast<float>(fontSize));
    OH_Drawing_RectDestroy(rect);
    DestroyTypography(bundle);
    OH_Drawing_DestroyFontCollection(fontCollection);
}
} // namespace

TextMeasureResult MeasureText(const char *text, double fontSize, double maxWidth)
{
    TextMeasureResult result;
    if (text == nullptr || maxWidth <= 0.0) {
        DRAWING_LOGE("MeasureText invalid param, maxWidth=%{public}f", static_cast<float>(maxWidth));
        return result;
    }
    OH_Drawing_FontCollection *fontCollection = OH_Drawing_CreateSharedFontCollection();
    if (fontCollection == nullptr) {
        DRAWING_LOGE("MeasureText create font collection failed");
        return result;
    }
    TypographyBundle bundle;
    if (BuildTypography(bundle, text, ClampFontSize(fontSize), maxWidth, fontCollection)) {
        result.width = OH_Drawing_TypographyGetLongestLine(bundle.typography);
        result.height = OH_Drawing_TypographyGetHeight(bundle.typography);
    }
    DestroyTypography(bundle);
    OH_Drawing_DestroyFontCollection(fontCollection);
    return result;
}

void DrawTextScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t kind)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawTextScene invalid param, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (kind < TEXT_BLOB || kind >= TEXT_KIND_COUNT) {
        DRAWING_LOGE("DrawTextScene unsupported kind=%{public}d", kind);
        return;
    }
    switch (kind) {
        case TEXT_BLOB:
            DrawTextBlob(canvas, width, height);
            break;
        case TEXT_TYPOGRAPHY:
            DrawTypography(canvas, width, height);
            break;
        case TEXT_MEASURE:
            DrawMeasure(canvas, width, height);
            break;
        default:
            break;
    }
    DRAWING_LOGI("DrawTextScene done, kind=%{public}d width=%{public}d height=%{public}d", kind, width, height);
}
} // namespace ndr
