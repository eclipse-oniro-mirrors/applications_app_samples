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
#include "cap_typography.h"

#include <native_drawing/drawing_font_collection.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_text_declaration.h>
#include <native_drawing/drawing_text_line.h>
#include <native_drawing/drawing_text_typography.h>

#include "common/log_common.h"
#include "capability/cap_text_util.h"
#include "capability/cap_util.h"
#include "capability/capability_type.h"

namespace ndr {
namespace {
constexpr const char *PARAGRAPH = "Typography 排版能力演示：通过 TypographyStyle 控制对齐、行数、省略号，"
                                   "通过 TextStyle 控制字间距、装饰线与阴影。";
constexpr const char *LONG_TEXT = "OpenHarmony Native Drawing provides typography layout, line metrics and "
                                  "text decoration so that text can be arranged precisely.";
constexpr int32_t MAX_INDENTS = 3;
constexpr int32_t MAX_DRAWN_LINES = 8;
// 参数面板下标：第 2 位在各排版场景分别为省略号模式、字间距、装饰样式与偏移。
constexpr int32_t PARAM_MODAL = 2;
constexpr int32_t PARAM_WORD_SPACING = 2;
constexpr int32_t PARAM_STYLE = 2;
constexpr int32_t PARAM_OFFSET = 2;
// 对齐方式、装饰线样式与断行策略的选项下标，与各场景的下拉顺序一致。
constexpr int32_t ALIGN_OPTION_CENTER = 2;
constexpr int32_t ALIGN_OPTION_JUSTIFY = 3;
constexpr int32_t ALIGN_OPTION_START = 4;
constexpr int32_t ALIGN_OPTION_END = 5;
constexpr int32_t DECORATION_OPTION_UNDERLINE_THROUGH = 2;
constexpr int32_t DECORATION_STYLE_OPTION_DOTTED = 2;
constexpr int32_t DECORATION_STYLE_OPTION_DASHED = 3;
constexpr int32_t DECORATION_STYLE_OPTION_WAVY = 4;
constexpr int32_t BREAK_STRATEGY_OPTION_BALANCED = 2;
// 三种断行策略、五档字重与五个方向指示色块各自并排展示。
constexpr int32_t BREAK_STRATEGY_COUNT = 3;
constexpr int32_t FONT_WEIGHT_LEVEL_COUNT = 5;
constexpr int32_t DIRECTION_BLOCK_COUNT = 5;
// 装饰线粗细倍率，稍粗于默认值以便观察。
constexpr double DECORATION_THICKNESS_SCALE = 1.5;

// 排版对象集合：样式、文本样式、Handler 与 Typography，统一创建与销毁。
struct TypographyHolder {
    OH_Drawing_FontCollection *collection = nullptr;
    OH_Drawing_TypographyStyle *style = nullptr;
    OH_Drawing_TextStyle *textStyle = nullptr;
    OH_Drawing_TypographyCreate *handler = nullptr;
    OH_Drawing_Typography *typography = nullptr;
};

void DestroyHolder(TypographyHolder &holder)
{
    if (holder.typography != nullptr) {
        OH_Drawing_DestroyTypography(holder.typography);
        holder.typography = nullptr;
    }
    if (holder.handler != nullptr) {
        OH_Drawing_DestroyTypographyHandler(holder.handler);
        holder.handler = nullptr;
    }
    if (holder.textStyle != nullptr) {
        OH_Drawing_DestroyTextStyle(holder.textStyle);
        holder.textStyle = nullptr;
    }
    if (holder.style != nullptr) {
        OH_Drawing_DestroyTypographyStyle(holder.style);
        holder.style = nullptr;
    }
    if (holder.collection != nullptr) {
        OH_Drawing_DestroyFontCollection(holder.collection);
        holder.collection = nullptr;
    }
}

// 创建一套默认样式的排版对象，但不做布局，便于场景在布局前继续调整样式。
bool BuildHolder(TypographyHolder &holder, const char *text, double fontSize, uint32_t color)
{
    if (text == nullptr || fontSize <= 0.0) {
        return false;
    }
    holder.collection = OH_Drawing_CreateFontCollection();
    holder.style = OH_Drawing_CreateTypographyStyle();
    holder.textStyle = OH_Drawing_CreateTextStyle();
    if (holder.collection == nullptr || holder.style == nullptr || holder.textStyle == nullptr) {
        DRAWING_LOGE("BuildHolder create style failed");
        DestroyHolder(holder);
        return false;
    }
    OH_Drawing_SetTypographyTextDirection(holder.style, TEXT_DIRECTION_LTR);
    OH_Drawing_SetTypographyTextAlign(holder.style, TEXT_ALIGN_LEFT);
    OH_Drawing_SetTextStyleColor(holder.textStyle, color);
    OH_Drawing_SetTextStyleFontSize(holder.textStyle, fontSize);
    OH_Drawing_SetTextStyleFontWeight(holder.textStyle, FONT_WEIGHT_400);
    OH_Drawing_SetTextStyleBaseLine(holder.textStyle, TEXT_BASELINE_ALPHABETIC);
    OH_Drawing_SetTextStyleFontHeight(holder.textStyle, 1.0);
    (void)cap::RegisterSampleFont(holder.collection, holder.textStyle);

    holder.handler = OH_Drawing_CreateTypographyHandler(holder.style, holder.collection);
    if (holder.handler == nullptr) {
        DRAWING_LOGE("BuildHolder create handler failed");
        DestroyHolder(holder);
        return false;
    }
    OH_Drawing_TypographyHandlerPushTextStyle(holder.handler, holder.textStyle);
    OH_Drawing_TypographyHandlerAddText(holder.handler, text);
    OH_Drawing_TypographyHandlerPopTextStyle(holder.handler);
    holder.typography = OH_Drawing_CreateTypography(holder.handler);
    if (holder.typography == nullptr) {
        DRAWING_LOGE("BuildHolder create typography failed");
        DestroyHolder(holder);
        return false;
    }
    return true;
}

void LayoutHolder(TypographyHolder &holder, double maxWidth)
{
    if (holder.typography != nullptr && maxWidth > 0.0) {
        OH_Drawing_TypographyLayout(holder.typography, maxWidth);
    }
}

void PaintHolder(OH_Drawing_Canvas *canvas, TypographyHolder &holder, double x, double y)
{
    if (canvas != nullptr && holder.typography != nullptr) {
        OH_Drawing_TypographyPaint(holder.typography, canvas, x, y);
    }
}

// 在左侧画一组等高色块，用于把行数、缩进等数值型结果变成可读的图形。
void DrawCountBars(OH_Drawing_Canvas *canvas, const cap::Frame &frame, int32_t count, int32_t palette)
{
    const int32_t limited = count > MAX_DRAWN_LINES ? MAX_DRAWN_LINES : (count < 0 ? 0 : count);
    for (int32_t index = 0; index < limited; ++index) {
        const float top = frame.Y(20.0F) + static_cast<float>(index) * frame.Y(6.0F);
        const uint32_t color = cap::PaletteColor(palette + index % cap::COLOR_CYCLE_TRIPLE);
        cap::FillRectArea(canvas, color, frame.X(4.0F), top, frame.X(9.0F), top + frame.Y(4.0F));
    }
}

// 0. 基础排版：默认样式下按给定宽度布局并绘制，作为其余场景的基准。
void SceneBasic(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const double fontSize = frame.Span(params.Range(1, 16.0F, 10.0F, 32.0F));
    TypographyHolder holder;
    if (!BuildHolder(holder, PARAGRAPH, fontSize, cap::PaletteColor(palette))) {
        DestroyHolder(holder);
        return;
    }
    LayoutHolder(holder, frame.X(90.0F));
    PaintHolder(canvas, holder, frame.X(5.0F), frame.Y(10.0F));
    DestroyHolder(holder);
}

// 1. 对齐方式：TypographyStyle 的 align 决定每行在给定宽度内的水平位置。
void SceneAlign(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    const int32_t alignIndex = params.Choice(1, 6, 2);
    int32_t align = TEXT_ALIGN_LEFT;
    switch (alignIndex) {
        case 1:
            align = TEXT_ALIGN_RIGHT;
            break;
        case ALIGN_OPTION_CENTER:
            align = TEXT_ALIGN_CENTER;
            break;
        case ALIGN_OPTION_JUSTIFY:
            align = TEXT_ALIGN_JUSTIFY;
            break;
        case ALIGN_OPTION_START:
            align = TEXT_ALIGN_START;
            break;
        case ALIGN_OPTION_END:
            align = TEXT_ALIGN_END;
            break;
        default:
            align = TEXT_ALIGN_LEFT;
            break;
    }
    TypographyHolder holder;
    if (!BuildHolder(holder, PARAGRAPH, frame.Span(14.0F), cap::PaletteColor(palette))) {
        DestroyHolder(holder);
        return;
    }
    OH_Drawing_SetTypographyTextAlign(holder.style, align);
    LayoutHolder(holder, frame.X(80.0F));
    // 布局区域用描边框标出，便于观察不同对齐方式下文字靠左/靠右/居中的差异。
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette + cap::SLOT_RED), 1.0F, frame.X(10.0F), frame.Y(6.0F),
        frame.X(90.0F), frame.Y(94.0F));
    PaintHolder(canvas, holder, frame.X(10.0F), frame.Y(10.0F));
    DestroyHolder(holder);
}

// 2. 最大行数：MaxLines 生效后超出部分被截断，DidExceedMaxLines 返回真。
void SceneMaxLines(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    const int32_t maxLines = params.Int(1, 2, 1, 6);
    TypographyHolder holder;
    if (!BuildHolder(holder, LONG_TEXT, frame.Span(14.0F), cap::PaletteColor(palette))) {
        DestroyHolder(holder);
        return;
    }
    OH_Drawing_SetTypographyTextMaxLines(holder.style, maxLines);
    LayoutHolder(holder, frame.X(80.0F));
    PaintHolder(canvas, holder, frame.X(12.0F), frame.Y(12.0F));
    DrawCountBars(canvas, frame, maxLines, palette);
    // 超出最大行数时在右下角画一个提示色块，与参数面板的“是否截断”信息对应。
    if (OH_Drawing_TypographyDidExceedMaxLines(holder.typography)) {
        cap::FillRectArea(canvas, cap::PaletteColor(palette + cap::SLOT_PURPLE), frame.X(84.0F), frame.Y(88.0F),
            frame.X(94.0F), frame.Y(94.0F));
    }
    DestroyHolder(holder);
}

// 3. 省略号：配合最大行数使用时，超出内容以省略号结尾。
void SceneEllipsis(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 4);
    const int32_t maxLines = params.Int(1, 2, 1, 4);
    const int32_t modalIndex = params.Choice(PARAM_MODAL, 2, 1);
    TypographyHolder holder;
    if (!BuildHolder(holder, LONG_TEXT, frame.Span(14.0F), cap::PaletteColor(palette))) {
        DestroyHolder(holder);
        return;
    }
    OH_Drawing_SetTypographyTextMaxLines(holder.style, maxLines);
    OH_Drawing_SetTypographyTextEllipsis(holder.style, "...");
    OH_Drawing_SetTypographyTextEllipsisModal(holder.style, modalIndex == 0 ? ELLIPSIS_MODAL_HEAD :
        ELLIPSIS_MODAL_TAIL);
    LayoutHolder(holder, frame.X(78.0F));
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette + cap::SLOT_GREEN), 1.0F, frame.X(10.0F), frame.Y(10.0F),
        frame.X(88.0F), frame.Y(90.0F));
    PaintHolder(canvas, holder, frame.X(12.0F), frame.Y(14.0F));
    DestroyHolder(holder);
}

// 4. 字间距与词间距：TextStyle 上设置后，排版阶段会据此调整每行宽度。
void SceneSpacing(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 5);
    const double letterSpacing = params.Range(1, 2.0F, -4.0F, 12.0F);
    const double wordSpacing = params.Range(PARAM_WORD_SPACING, 4.0F, 0.0F, 24.0F);
    TypographyHolder holder;
    if (!BuildHolder(holder, LONG_TEXT, frame.Span(14.0F), cap::PaletteColor(palette))) {
        DestroyHolder(holder);
        return;
    }
    OH_Drawing_SetTextStyleLetterSpacing(holder.textStyle, letterSpacing);
    OH_Drawing_SetTextStyleWordSpacing(holder.textStyle, wordSpacing);
    LayoutHolder(holder, frame.X(86.0F));
    PaintHolder(canvas, holder, frame.X(6.0F), frame.Y(12.0F));
    // 底部两条横条分别对应字间距与词间距，长度按比例给出。
    cap::FillRectArea(canvas, cap::PaletteColor(palette + 1), frame.X(6.0F), frame.Y(86.0F),
        frame.X(6.0F) + frame.X(30.0F) * cap::ClampFloat(static_cast<float>(letterSpacing) / 12.0F, 0.05F, 1.0F),
        frame.Y(89.0F));
    cap::FillRectArea(canvas, cap::PaletteColor(palette + cap::SLOT_GREEN), frame.X(6.0F), frame.Y(91.0F),
        frame.X(6.0F) + frame.X(30.0F) * cap::ClampFloat(static_cast<float>(wordSpacing) / 24.0F, 0.05F, 1.0F),
        frame.Y(94.0F));
    DestroyHolder(holder);
}

// 5. 装饰线：下划线/上划线/删除线可组合，样式与粗细也可调。
void SceneDecoration(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const int32_t decorationIndex = params.Choice(1, 3, 1);
    const int32_t styleIndex = params.Choice(PARAM_STYLE, 5, 0);
    int32_t decoration = TEXT_DECORATION_UNDERLINE;
    if (decorationIndex == 1) {
        decoration = TEXT_DECORATION_OVERLINE;
    } else if (decorationIndex == DECORATION_OPTION_UNDERLINE_THROUGH) {
        decoration = TEXT_DECORATION_UNDERLINE | TEXT_DECORATION_LINE_THROUGH;
    }
    int32_t decorationStyle = TEXT_DECORATION_STYLE_SOLID;
    switch (styleIndex) {
        case 1:
            decorationStyle = TEXT_DECORATION_STYLE_DOUBLE;
            break;
        case DECORATION_STYLE_OPTION_DOTTED:
            decorationStyle = TEXT_DECORATION_STYLE_DOTTED;
            break;
        case DECORATION_STYLE_OPTION_DASHED:
            decorationStyle = TEXT_DECORATION_STYLE_DASHED;
            break;
        case DECORATION_STYLE_OPTION_WAVY:
            decorationStyle = TEXT_DECORATION_STYLE_WAVY;
            break;
        default:
            decorationStyle = TEXT_DECORATION_STYLE_SOLID;
            break;
    }
    TypographyHolder holder;
    if (!BuildHolder(holder, PARAGRAPH, frame.Span(15.0F), cap::PaletteColor(palette))) {
        DestroyHolder(holder);
        return;
    }
    OH_Drawing_SetTextStyleDecoration(holder.textStyle, decoration);
    OH_Drawing_SetTextStyleDecorationStyle(holder.textStyle, decorationStyle);
    OH_Drawing_SetTextStyleDecorationColor(holder.textStyle, cap::PaletteColor(palette + cap::SLOT_RED));
    OH_Drawing_SetTextStyleDecorationThicknessScale(holder.textStyle, DECORATION_THICKNESS_SCALE);
    LayoutHolder(holder, frame.X(88.0F));
    PaintHolder(canvas, holder, frame.X(6.0F), frame.Y(14.0F));
    DestroyHolder(holder);
}

// 6. 文字阴影：TextShadow 挂到 TextStyle 上，先绘制阴影再绘制文字本体。
void SceneShadow(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    const float blurRadius = params.Range(1, 6.0F, 0.0F, 24.0F);
    const float offset = frame.Span(params.Range(PARAM_OFFSET, 6.0F, 0.0F, 20.0F));
    TypographyHolder holder;
    if (!BuildHolder(holder, LONG_TEXT, frame.Span(16.0F), cap::PaletteColor(palette))) {
        DestroyHolder(holder);
        return;
    }
    OH_Drawing_TextShadow *shadow = OH_Drawing_CreateTextShadow();
    OH_Drawing_Point *shadowOffset = OH_Drawing_PointCreate(offset, offset);
    if (shadow != nullptr && shadowOffset != nullptr) {
        OH_Drawing_SetTextShadow(shadow, cap::PaletteColor(palette + cap::SLOT_PURPLE), shadowOffset, blurRadius);
        OH_Drawing_TextStyleAddShadow(holder.textStyle, shadow);
    }
    LayoutHolder(holder, frame.X(84.0F));
    PaintHolder(canvas, holder, frame.X(8.0F), frame.Y(16.0F));
    if (shadowOffset != nullptr) {
        OH_Drawing_PointDestroy(shadowOffset);
    }
    if (shadow != nullptr) {
        OH_Drawing_DestroyTextShadow(shadow);
    }
    DestroyHolder(holder);
}

// 7. 路径排版：TypographyPaintOnPath 让文本沿指定路径排布。
void SceneOnPath(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    const float radius = frame.Span(params.Range(1, 30.0F, 15.0F, 42.0F));
    TypographyHolder holder;
    if (!BuildHolder(holder, "Typography on path 沿路径排版", frame.Span(12.0F), cap::PaletteColor(palette))) {
        DestroyHolder(holder);
        return;
    }
    LayoutHolder(holder, frame.X(90.0F));
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    if (path != nullptr) {
        // 路径取一个圆，起点在圆心正上方，文字沿圆周顺时针排布。
        OH_Drawing_PathAddCircle(path, frame.centerX, frame.centerY, radius, PATH_DIRECTION_CW);
        OH_Drawing_TypographyPaintOnPath(holder.typography, canvas, path, 0.0, 0.0);
        OH_Drawing_PathDestroy(path);
    }
    // 路径参考圆：文字与圆环对照，确认排版确实沿路径进行。
    cap::StrokeCircleArea(canvas, cap::WithAlpha(cap::PaletteColor(palette + cap::SLOT_PURPLE), 0.4F), 1.0F,
        frame.centerX, frame.centerY, radius);
    DestroyHolder(holder);
}

// 8. 缩进：布局前设置各行缩进，排版时首行、次行分别偏移。
void SceneIndents(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 4);
    const float firstIndent = frame.X(params.Range(1, 8.0F, 0.0F, 20.0F));
    TypographyHolder holder;
    if (!BuildHolder(holder, PARAGRAPH, frame.Span(13.0F), cap::PaletteColor(palette))) {
        DestroyHolder(holder);
        return;
    }
    // 缩进个数与缩进值一一对应，末尾补 0 表示其余行不缩进。
    const float indents[MAX_INDENTS] = {firstIndent, firstIndent * 0.5F, 0.0F};
    OH_Drawing_TypographySetIndents(holder.typography, MAX_INDENTS, indents);
    LayoutHolder(holder, frame.X(84.0F));
    for (int32_t index = 0; index < MAX_INDENTS; ++index) {
        const float left = frame.X(6.0F) + indents[index];
        cap::StrokeLineArea(canvas, cap::PaletteColor(palette + index), 1.0F, left, frame.Y(8.0F), left,
            frame.Y(92.0F));
    }
    PaintHolder(canvas, holder, frame.X(8.0F), frame.Y(12.0F));
    DestroyHolder(holder);
}

// 9. 行度量：逐行读取行高与行宽，画出对应的矩形与基线。
void SceneLineMetrics(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 5);
    TypographyHolder holder;
    if (!BuildHolder(holder, LONG_TEXT, frame.Span(13.0F), cap::PaletteColor(palette))) {
        DestroyHolder(holder);
        return;
    }
    LayoutHolder(holder, frame.X(84.0F));
    const int32_t lineCount = static_cast<int32_t>(OH_Drawing_TypographyGetLineCount(holder.typography));
    float top = frame.Y(8.0F);
    for (int32_t line = 0; line < lineCount && line < MAX_DRAWN_LINES; ++line) {
        const double lineHeight = OH_Drawing_TypographyGetLineHeight(holder.typography, line);
        const double lineWidth = OH_Drawing_TypographyGetLineWidth(holder.typography, line);
        const float height = static_cast<float>(lineHeight);
        const float width = static_cast<float>(lineWidth);
        // 行高决定矩形高度，行宽决定矩形宽度，右侧留白即该行未占满的部分。
        const uint32_t color = cap::PaletteColor(palette + line % cap::COLOR_CYCLE_TRIPLE);
        cap::StrokeRectArea(canvas, color, 1.0F, frame.X(6.0F), top,
            frame.X(6.0F) + (width > 0.0F ? width : frame.X(10.0F)), top + height);
        top += height;
    }
    PaintHolder(canvas, holder, frame.X(8.0F), frame.Y(10.0F));
    DestroyHolder(holder);
}

// 10. 断行策略：GREEDY 逐行贪心、HIGH_QUALITY 与 BALANCED 会平衡各行长度。
void SceneBreakStrategy(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const int32_t strategyIndex = params.Choice(1, 3, 1);
    int32_t strategy = BREAK_STRATEGY_HIGH_QUALITY;
    if (strategyIndex == 0) {
        strategy = BREAK_STRATEGY_GREEDY;
    } else if (strategyIndex == BREAK_STRATEGY_OPTION_BALANCED) {
        strategy = BREAK_STRATEGY_BALANCED;
    }
    TypographyHolder holder;
    if (!BuildHolder(holder, LONG_TEXT, frame.Span(14.0F), cap::PaletteColor(palette))) {
        DestroyHolder(holder);
        return;
    }
    OH_Drawing_SetTypographyTextBreakStrategy(holder.style, strategy);
    LayoutHolder(holder, frame.X(70.0F));
    PaintHolder(canvas, holder, frame.X(6.0F), frame.Y(12.0F));
    // 三种策略用三段色块标注当前选择。
    for (int32_t index = 0; index < BREAK_STRATEGY_COUNT; ++index) {
        const float top = frame.Y(88.0F) + static_cast<float>(index) * frame.Y(3.0F);
        if (index == strategyIndex) {
            cap::FillRectArea(canvas, cap::PaletteColor(palette + index), frame.X(6.0F), top, frame.X(20.0F),
                top + 3.0F);
        } else {
            cap::StrokeRectArea(canvas, cap::PaletteColor(palette + index), 1.0F, frame.X(6.0F), top, frame.X(20.0F),
                top + 3.0F);
        }
    }
    DestroyHolder(holder);
}

// 11. 字重：TextStyle 的 fontWeight 从 100 到 900，逐级加重。
void SceneFontWeight(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    const int32_t weightIndex = params.Choice(1, 5, 2);
    const int32_t weights[] = {FONT_WEIGHT_300, FONT_WEIGHT_400, FONT_WEIGHT_500, FONT_WEIGHT_700,
        FONT_WEIGHT_900};
    TypographyHolder holder;
    if (!BuildHolder(holder, LONG_TEXT, frame.Span(14.0F), cap::PaletteColor(palette))) {
        DestroyHolder(holder);
        return;
    }
    OH_Drawing_SetTextStyleFontWeight(holder.textStyle, weights[weightIndex]);
    LayoutHolder(holder, frame.X(84.0F));
    PaintHolder(canvas, holder, frame.X(8.0F), frame.Y(14.0F));
    // 五段色条表示五档字重，选中的一档最高。
    for (int32_t index = 0; index < FONT_WEIGHT_LEVEL_COUNT; ++index) {
        const float left = frame.X(8.0F) + static_cast<float>(index) * frame.X(17.0F);
        const float height = index == weightIndex ? frame.Y(10.0F) : frame.Y(4.0F);
        const uint32_t color = cap::PaletteColor(palette + index % cap::COLOR_CYCLE_TRIPLE);
        cap::FillRectArea(canvas, color, left, frame.Y(88.0F) - height, left + frame.X(14.0F), frame.Y(88.0F));
    }
    DestroyHolder(holder);
}

// 12. 文字方向：LTR 与 RTL 会改变行内顺排方向，配合 START/END 对齐差异明显。
void SceneDirection(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    const bool isRtl = params.Flag(1, false);
    TypographyHolder holder;
    if (!BuildHolder(holder, LONG_TEXT, frame.Span(14.0F), cap::PaletteColor(palette))) {
        DestroyHolder(holder);
        return;
    }
    OH_Drawing_SetTypographyTextDirection(holder.style, isRtl ? TEXT_DIRECTION_RTL : TEXT_DIRECTION_LTR);
    OH_Drawing_SetTypographyTextAlign(holder.style, TEXT_ALIGN_START);
    LayoutHolder(holder, frame.X(80.0F));
    PaintHolder(canvas, holder, frame.X(10.0F), frame.Y(12.0F));
    // 方向指示：从左向右或从右向左的一组渐隐色块。
    for (int32_t index = 0; index < DIRECTION_BLOCK_COUNT; ++index) {
        const int32_t position = isRtl ? DIRECTION_BLOCK_COUNT - 1 - index : index;
        const float left = frame.X(10.0F) + static_cast<float>(position) * frame.X(16.0F);
        const uint32_t color = cap::WithAlpha(
            cap::PaletteColor(palette + index % cap::COLOR_CYCLE_TRIPLE), 1.0F - 0.15F * static_cast<float>(index));
        cap::FillRectArea(canvas, color, left, frame.Y(88.0F), left + frame.X(12.0F), frame.Y(93.0F));
    }
    DestroyHolder(holder);
}

// 13. 行对象：TypographyGetTextLines 取出 TextLine，逐行绘制并读取排版宽度。
void SceneLines(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 4);
    TypographyHolder holder;
    if (!BuildHolder(holder, LONG_TEXT, frame.Span(13.0F), cap::PaletteColor(palette))) {
        DestroyHolder(holder);
        return;
    }
    LayoutHolder(holder, frame.X(80.0F));
    OH_Drawing_Array *lines = OH_Drawing_TypographyGetTextLines(holder.typography);
    if (lines == nullptr) {
        DRAWING_LOGW("SceneLines get text lines failed");
        DestroyHolder(holder);
        return;
    }
    const size_t lineCount = OH_Drawing_GetDrawingArraySize(lines);
    float top = frame.Y(10.0F);
    for (size_t index = 0; index < lineCount && static_cast<int32_t>(index) < MAX_DRAWN_LINES; ++index) {
        OH_Drawing_TextLine *line = OH_Drawing_GetTextLineByIndex(lines, index);
        if (line == nullptr) {
            continue;
        }
        double ascent = 0.0;
        double descent = 0.0;
        double leading = 0.0;
        const double lineWidth = OH_Drawing_TextLineGetTypographicBounds(line, &ascent, &descent, &leading);
        const float height = static_cast<float>(ascent + descent + leading);
        // 每行先铺一条浅色底纹，再叠加行内文字，行宽即该行实际内容宽度。
        const uint32_t color = cap::WithAlpha(cap::PaletteColor(palette + index % cap::COLOR_CYCLE_TRIPLE), 0.25F);
        cap::FillRectArea(canvas, color, frame.X(6.0F), top,
            frame.X(6.0F) + (lineWidth > 0.0 ? static_cast<float>(lineWidth) : frame.X(10.0F)), top + height);
        OH_Drawing_TextLinePaint(line, canvas, frame.X(8.0F), top + static_cast<float>(ascent));
        top += height;
    }
    OH_Drawing_DestroyTextLines(lines);
    DestroyHolder(holder);
}

// 按场景编号分派：参数校验与日志由对外入口负责，这里只做具体场景转发。
void DrawTypographyKind(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params, int32_t scene)
{
    switch (scene) {
        case TYPO_BASIC:
            SceneBasic(canvas, frame, params);
            break;
        case TYPO_ALIGN:
            SceneAlign(canvas, frame, params);
            break;
        case TYPO_MAX_LINES:
            SceneMaxLines(canvas, frame, params);
            break;
        case TYPO_ELLIPSIS:
            SceneEllipsis(canvas, frame, params);
            break;
        case TYPO_SPACING:
            SceneSpacing(canvas, frame, params);
            break;
        case TYPO_DECORATION:
            SceneDecoration(canvas, frame, params);
            break;
        case TYPO_SHADOW:
            SceneShadow(canvas, frame, params);
            break;
        case TYPO_ON_PATH:
            SceneOnPath(canvas, frame, params);
            break;
        case TYPO_INDENTS:
            SceneIndents(canvas, frame, params);
            break;
        case TYPO_LINE_METRICS:
            SceneLineMetrics(canvas, frame, params);
            break;
        case TYPO_BREAK_STRATEGY:
            SceneBreakStrategy(canvas, frame, params);
            break;
        case TYPO_FONT_WEIGHT:
            SceneFontWeight(canvas, frame, params);
            break;
        case TYPO_DIRECTION:
            SceneDirection(canvas, frame, params);
            break;
        case TYPO_LINES:
            SceneLines(canvas, frame, params);
            break;
        default:
            break;
    }
}
} // namespace

void DrawTypographyScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t scene,
    const ParamBag &params)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawTypographyScene invalid canvas or size, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (scene < TYPO_BASIC || scene >= TYPO_SCENE_COUNT) {
        DRAWING_LOGE("DrawTypographyScene unsupported scene=%{public}d", scene);
        return;
    }
    const cap::Frame frame = cap::MakeFrame(width, height);
    DrawTypographyKind(canvas, frame, params, scene);
    DRAWING_LOGI("DrawTypographyScene done, scene=%{public}d size=%{public}dx%{public}d", scene, width, height);
}
} // namespace ndr
