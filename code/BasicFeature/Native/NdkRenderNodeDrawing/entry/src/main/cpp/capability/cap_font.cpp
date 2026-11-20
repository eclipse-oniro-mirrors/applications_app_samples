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
#include "cap_font.h"

#include <cstring>

#include <native_drawing/drawing_font.h>
#include <native_drawing/drawing_font_mgr.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_text_blob.h>
#include <native_drawing/drawing_typeface.h>

#include "common/log_common.h"
#include "capability/cap_text_util.h"
#include "capability/cap_util.h"
#include "capability/capability_type.h"

namespace ndr {
namespace {
constexpr const char *SAMPLE_TEXT = "Font 字体";
constexpr const char *MEASURE_TEXTS[] = {"Aa", "鸿蒙", "OpenHarmony"};
constexpr int32_t MEASURE_TEXT_COUNT = 3;
constexpr int32_t HINTING_COUNT = 4;
constexpr int32_t EDGING_COUNT = 3;
constexpr int32_t MAX_FAMILY_BARS = 12;
// 参数面板第 3 位为字间距步长。
constexpr int32_t PARAM_LETTER_STEP = 2;
// 字号梯度场景展示的行数，每行字号递增一个步长。
constexpr int32_t SIZE_GRADIENT_ROWS = 3;
// 字体度量参考线条数：top / ascent / descent / bottom。
constexpr int32_t METRIC_LINE_COUNT = 4;
// 字族竖条的循环用色个数与高度循环档数。
constexpr int32_t FAMILY_BAR_COLOR_CYCLE = 3;
constexpr int32_t FAMILY_BAR_HEIGHT_STEPS = 8;
// Hinting 档位下标，完全对齐为最高档。
constexpr int32_t HINTING_OPTION_FULL = 3;
// Edging 档位下标，次像素对应第 3 项。
constexpr int32_t EDGING_OPTION_SUBPIXEL = 2;

// 汉字与英文混排的文本块绘制，统一走 TextBlob，避免每个场景重复写创建与释放。
void DrawTextAt(OH_Drawing_Canvas *canvas, OH_Drawing_Font *font, const char *text, float x, float y,
    uint32_t color)
{
    if (canvas == nullptr || font == nullptr || text == nullptr) {
        return;
    }
    OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobCreateFromString(text, font, TEXT_ENCODING_UTF8);
    if (textBlob == nullptr) {
        DRAWING_LOGW("DrawTextAt create text blob failed");
        return;
    }
    OH_Drawing_Brush *brush = cap::NewBrush(color);
    if (brush != nullptr) {
        OH_Drawing_CanvasAttachBrush(canvas, brush);
        OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, x, y);
        OH_Drawing_CanvasDetachBrush(canvas);
        OH_Drawing_BrushDestroy(brush);
    }
    OH_Drawing_TextBlobDestroy(textBlob);
}

// 0. 字体创建：最基础的 FontCreate + 字号设置，随后绘制一段文字。
void SceneCreate(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const float fontSize = frame.Span(params.Range(1, 18.0F, 8.0F, 60.0F));
    OH_Drawing_Font *font = cap::CreateSampleFont(fontSize);
    if (font == nullptr) {
        return;
    }
    DrawTextAt(canvas, font, SAMPLE_TEXT, frame.X(10.0F), frame.centerY, cap::PaletteColor(palette));
    OH_Drawing_FontDestroy(font);
}

// 1. 字号梯度：同一字体设置不同字号，观察字形与行高的变化。
void SceneSize(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    const float baseSize = params.Range(1, 14.0F, 8.0F, 40.0F);
    const float step = params.Range(PARAM_LETTER_STEP, 10.0F, 0.0F, 30.0F);
    for (int32_t index = 0; index < SIZE_GRADIENT_ROWS; ++index) {
        const float fontSize = baseSize + step * static_cast<float>(index);
        OH_Drawing_Font *font = cap::CreateSampleFont(fontSize);
        if (font == nullptr) {
            continue;
        }
        // 字号越大基线下移越多，三行文字自然拉开距离。
        const float baseline = frame.Y(25.0F) + frame.Y(22.0F) * static_cast<float>(index);
        DrawTextAt(canvas, font, SAMPLE_TEXT, frame.X(12.0F), baseline, cap::PaletteColor(palette + index));
        OH_Drawing_FontDestroy(font);
    }
}

// 2. 文本测量：MeasureText 给出宽度与包围盒，接着按测量值画框验证准确性。
void SceneMeasure(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    const float fontSize = frame.Span(params.Range(1, 14.0F, 8.0F, 40.0F));
    OH_Drawing_Font *font = cap::CreateSampleFont(fontSize);
    if (font == nullptr) {
        return;
    }
    for (int32_t index = 0; index < MEASURE_TEXT_COUNT; ++index) {
        const char *text = MEASURE_TEXTS[index];
        OH_Drawing_Rect *bounds = OH_Drawing_RectCreate(0.0F, 0.0F, 0.0F, 0.0F);
        float textWidth = 0.0F;
        const OH_Drawing_ErrorCode result = OH_Drawing_FontMeasureText(font, text, strlen(text), TEXT_ENCODING_UTF8,
            bounds, &textWidth);
        if (result != OH_DRAWING_SUCCESS) {
            DRAWING_LOGW("SceneMeasure measure failed, result=%{public}d", static_cast<int32_t>(result));
        }
        const float baseline = frame.Y(26.0F) + frame.Y(24.0F) * static_cast<float>(index);
        DrawTextAt(canvas, font, text, frame.X(14.0F), baseline, cap::PaletteColor(palette + index));
        // 用测量宽度画一条下划线，长度与文字宽度一致。
        if (textWidth > 0.0F) {
            cap::StrokeLineArea(canvas, cap::PaletteColor(palette + index), 2.0F, frame.X(14.0F),
                baseline + 4.0F, frame.X(14.0F) + textWidth, baseline + 4.0F);
        }
        if (bounds != nullptr) {
            OH_Drawing_RectDestroy(bounds);
        }
    }
    OH_Drawing_FontDestroy(font);
}

// 3. 字体度量：按 metrics 的 top/ascent/descent/bottom 画出基线参考线。
void SceneMetrics(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 4);
    const float fontSize = frame.Span(params.Range(1, 18.0F, 10.0F, 48.0F));
    OH_Drawing_Font *font = cap::CreateSampleFont(fontSize);
    if (font == nullptr) {
        return;
    }
    OH_Drawing_Font_Metrics metrics;
    const float lineSpacing = OH_Drawing_FontGetMetrics(font, &metrics);
    const float baseline = frame.centerY;
    const float scale = 1.0F;
    // 四条参考线分别对应 top / ascent / descent / bottom，线条颜色区分。
    const float positions[] = {baseline + metrics.ascent * scale, baseline, baseline + metrics.descent * scale,
        baseline + metrics.bottom * scale};
    for (int32_t index = 0; index < METRIC_LINE_COUNT; ++index) {
        cap::StrokeLineArea(canvas, cap::PaletteColor(palette + index), index == 1 ? 3.0F : 1.0F,
            frame.X(6.0F), positions[index], frame.X(94.0F), positions[index]);
    }
    DrawTextAt(canvas, font, SAMPLE_TEXT, frame.X(10.0F), baseline, cap::PaletteColor(palette + cap::SLOT_CYAN));
    // 行距用一组小方块的高度表示，方块越多行距越大。
    const int32_t blockCount = lineSpacing > 0.0F ? static_cast<int32_t>(lineSpacing / 4.0F) : 0;
    for (int32_t index = 0; index < blockCount && index < MAX_FAMILY_BARS; ++index) {
        const float left = frame.X(6.0F + static_cast<float>(index) * 3.0F);
        cap::FillRectArea(canvas, cap::PaletteColor(palette + cap::SLOT_GREEN), left, frame.Y(6.0F),
            left + frame.X(2.0F), frame.Y(10.0F));
    }
    OH_Drawing_FontDestroy(font);
}

// 4. 文本倾斜：SetTextSkewX 让字形沿 X 方向倾斜，负值向左。
void SceneSkew(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const float skew = params.Range(1, 0.25F, -1.0F, 1.0F);
    OH_Drawing_Font *font = cap::CreateSampleFont(frame.Span(16.0F));
    if (font == nullptr) {
        return;
    }
    OH_Drawing_FontSetTextSkewX(font, skew);
    DrawTextAt(canvas, font, SAMPLE_TEXT, frame.X(12.0F), frame.Y(40.0F), cap::PaletteColor(palette));
    // 参考竖线标示 skew 为 0 时的竖直方向。
    cap::StrokeLineArea(canvas, cap::PaletteColor(palette + cap::SLOT_GREEN), 1.0F, frame.X(12.0F), frame.Y(20.0F),
        frame.X(12.0F), frame.Y(70.0F));
    OH_Drawing_FontDestroy(font);
}

// 5. 伪粗体：不换字体文件，仅通过 FakeBold 加粗字形。
void SceneFakeBold(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    const bool enabled = params.Flag(1, true);
    OH_Drawing_Font *font = cap::CreateSampleFont(frame.Span(16.0F));
    if (font == nullptr) {
        return;
    }
    OH_Drawing_FontSetFakeBoldText(font, enabled);
    DrawTextAt(canvas, font, SAMPLE_TEXT, frame.X(10.0F), frame.Y(35.0F), cap::PaletteColor(palette));
    // 第二行关闭伪粗体作为对照，样式由参数决定是否与第一行一致。
    OH_Drawing_FontSetFakeBoldText(font, !enabled);
    DrawTextAt(canvas, font, SAMPLE_TEXT, frame.X(10.0F), frame.Y(60.0F), cap::PaletteColor(palette + 1));
    OH_Drawing_FontDestroy(font);
}

// 6. 横向缩放：SetScaleX 只拉伸字形宽度，字号（高度）保持不变。
void SceneScaleX(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    const float scaleX = params.Range(1, 1.5F, 0.2F, 4.0F);
    OH_Drawing_Font *font = cap::CreateSampleFont(frame.Span(14.0F));
    if (font == nullptr) {
        return;
    }
    OH_Drawing_FontSetScaleX(font, scaleX);
    DrawTextAt(canvas, font, SAMPLE_TEXT, frame.X(8.0F), frame.Y(45.0F), cap::PaletteColor(palette));
    // 底部横条长度与 scaleX 成正比，便于直接读出当前缩放倍数。
    cap::FillRectArea(canvas, cap::PaletteColor(palette + cap::SLOT_GREEN), frame.X(8.0F), frame.Y(60.0F),
        frame.X(8.0F) + frame.X(80.0F) * (scaleX / 4.0F), frame.Y(64.0F));
    OH_Drawing_FontDestroy(font);
}

// 7. 微调级别：Hinting 越高，小字号边缘对齐越强，用竖排色块数量表示当前级别。
void SceneHinting(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 4);
    const int32_t hintingIndex = params.Choice(1, HINTING_COUNT, 2);
    OH_Drawing_Font *font = cap::CreateSampleFont(frame.Span(10.0F));
    if (font == nullptr) {
        return;
    }
    OH_Drawing_FontHinting hinting = FONT_HINTING_NORMAL;
    switch (hintingIndex) {
        case 0:
            hinting = FONT_HINTING_NONE;
            break;
        case 1:
            hinting = FONT_HINTING_SLIGHT;
            break;
        case HINTING_OPTION_FULL:
            hinting = FONT_HINTING_FULL;
            break;
        default:
            hinting = FONT_HINTING_NORMAL;
            break;
    }
    OH_Drawing_FontSetHinting(font, hinting);
    DrawTextAt(canvas, font, "Hinting 0123", frame.X(10.0F), frame.Y(45.0F), cap::PaletteColor(palette));
    for (int32_t index = 0; index <= hintingIndex; ++index) {
        const float top = frame.Y(60.0F) + static_cast<float>(index) * frame.Y(5.0F);
        cap::FillRectArea(canvas, cap::PaletteColor(palette + 1), frame.X(10.0F), top, frame.X(50.0F),
            top + frame.Y(3.0F));
    }
    OH_Drawing_FontDestroy(font);
}

// 8. 边缘处理：Alias 硬边、AntiAlias 平滑、Subpixel 次像素，配色区分当前选项。
void SceneEdging(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 5);
    const int32_t edgingIndex = params.Choice(1, EDGING_COUNT, 1);
    OH_Drawing_Font *font = cap::CreateSampleFont(frame.Span(18.0F));
    if (font == nullptr) {
        return;
    }
    OH_Drawing_FontEdging edging = FONT_EDGING_ANTI_ALIAS;
    switch (edgingIndex) {
        case 0:
            edging = FONT_EDGING_ALIAS;
            break;
        case EDGING_OPTION_SUBPIXEL:
            edging = FONT_EDGING_SUBPIXEL_ANTI_ALIAS;
            break;
        default:
            edging = FONT_EDGING_ANTI_ALIAS;
            break;
    }
    OH_Drawing_FontSetEdging(font, edging);
    DrawTextAt(canvas, font, SAMPLE_TEXT, frame.X(10.0F), frame.Y(40.0F), cap::PaletteColor(palette));
    // 三个候选色块，当前选项用实心，其余用描边。
    for (int32_t index = 0; index < EDGING_COUNT; ++index) {
        const float left = frame.X(10.0F) + static_cast<float>(index) * frame.X(26.0F);
        if (index == edgingIndex) {
            cap::FillRectArea(canvas, cap::PaletteColor(palette + index), left, frame.Y(58.0F), left + frame.X(20.0F),
                frame.Y(66.0F));
        } else {
            cap::StrokeRectArea(canvas, cap::PaletteColor(palette + index), 2.0F, left, frame.Y(58.0F),
                left + frame.X(20.0F), frame.Y(66.0F));
        }
    }
    OH_Drawing_FontDestroy(font);
}

// 9. 文字轮廓：GetTextPath 取到字形路径后既填充又描边，直观展示矢量轮廓。
void SceneTextPath(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const float fontSize = frame.Span(params.Range(1, 20.0F, 8.0F, 48.0F));
    OH_Drawing_Font *font = cap::CreateSampleFont(fontSize);
    OH_Drawing_Path *path = OH_Drawing_PathCreate();
    if (font == nullptr || path == nullptr) {
        if (path != nullptr) {
            OH_Drawing_PathDestroy(path);
        }
        if (font != nullptr) {
            OH_Drawing_FontDestroy(font);
        }
        return;
    }
    const OH_Drawing_ErrorCode result = OH_Drawing_FontGetTextPath(font, SAMPLE_TEXT, strlen(SAMPLE_TEXT),
        TEXT_ENCODING_UTF8, frame.X(8.0F), frame.centerY, path);
    if (result != OH_DRAWING_SUCCESS) {
        DRAWING_LOGW("SceneTextPath get text path failed, result=%{public}d", static_cast<int32_t>(result));
    }
    cap::FillPathArea(canvas, cap::WithAlpha(cap::PaletteColor(palette), 0.85F), path);
    cap::StrokePathArea(canvas, cap::PaletteColor(palette + cap::SLOT_RED), 1.0F, path);
    OH_Drawing_PathDestroy(path);
    OH_Drawing_FontDestroy(font);
}

// 10. 字体管理器：枚举系统字体族数量，用竖条表示族数量并绘制第一个族名。
void SceneFontMgrFamily(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    OH_Drawing_FontMgr *fontMgr = OH_Drawing_FontMgrCreate();
    if (fontMgr == nullptr) {
        DRAWING_LOGE("SceneFontMgrFamily create font manager failed");
        return;
    }
    const int32_t familyCount = OH_Drawing_FontMgrGetFamilyCount(fontMgr);
    char *firstName = OH_Drawing_FontMgrGetFamilyName(fontMgr, 0);
    for (int32_t index = 0; index < familyCount && index < MAX_FAMILY_BARS; ++index) {
        const float left = frame.X(8.0F) + static_cast<float>(index) * frame.X(7.0F);
        cap::FillRectArea(canvas, cap::PaletteColor(palette + index % FAMILY_BAR_COLOR_CYCLE), left, frame.Y(30.0F),
            left + frame.X(5.0F), frame.Y(30.0F) +
            frame.Y(4.0F) * static_cast<float>(index % FAMILY_BAR_HEIGHT_STEPS + 1));
    }
    // 第一个字体族名称直接绘制，验证枚举结果可用于实际绘制。
    OH_Drawing_Font *font = cap::CreateSampleFont(frame.Span(10.0F));
    if (font != nullptr) {
        DrawTextAt(canvas, font, firstName == nullptr ? "default" : firstName, frame.X(8.0F), frame.Y(80.0F),
            cap::PaletteColor(palette + cap::SLOT_PURPLE));
        OH_Drawing_FontDestroy(font);
    }
    if (firstName != nullptr) {
        OH_Drawing_FontMgrDestroyFamilyName(firstName);
    }
    OH_Drawing_FontMgrDestroy(fontMgr);
}

// 11. 默认字形：TypefaceCreateDefault 显式挂载默认字形，与系统自动选择保持一致。
void SceneTypefaceDefault(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    OH_Drawing_Typeface *typeface = OH_Drawing_TypefaceCreateDefault();
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    if (typeface == nullptr || font == nullptr) {
        if (font != nullptr) {
            OH_Drawing_FontDestroy(font);
        }
        if (typeface != nullptr) {
            OH_Drawing_TypefaceDestroy(typeface);
        }
        return;
    }
    OH_Drawing_FontSetTextSize(font, frame.Span(18.0F));
    OH_Drawing_FontSetTypeface(font, typeface);
    DrawTextAt(canvas, font, SAMPLE_TEXT, frame.X(10.0F), frame.Y(40.0F), cap::PaletteColor(palette));
    // 第二行去掉显式字形，仅保留字号，用于对比默认行为是否一致。
    OH_Drawing_FontSetTypeface(font, nullptr);
    DrawTextAt(canvas, font, SAMPLE_TEXT, frame.X(10.0F), frame.Y(62.0F),
        cap::PaletteColor(palette + cap::SLOT_GREEN));
    OH_Drawing_FontDestroy(font);
    OH_Drawing_TypefaceDestroy(typeface);
}

// 按场景编号分派：参数校验与日志由对外入口负责，这里只做具体场景转发。
void DrawFontKind(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params, int32_t scene)
{
    switch (scene) {
        case FONT_CREATE:
            SceneCreate(canvas, frame, params);
            break;
        case FONT_SIZE:
            SceneSize(canvas, frame, params);
            break;
        case FONT_MEASURE:
            SceneMeasure(canvas, frame, params);
            break;
        case FONT_METRICS:
            SceneMetrics(canvas, frame, params);
            break;
        case FONT_SKEW:
            SceneSkew(canvas, frame, params);
            break;
        case FONT_FAKE_BOLD:
            SceneFakeBold(canvas, frame, params);
            break;
        case FONT_SCALE_X:
            SceneScaleX(canvas, frame, params);
            break;
        case FONT_HINTING:
            SceneHinting(canvas, frame, params);
            break;
        case FONT_EDGING:
            SceneEdging(canvas, frame, params);
            break;
        case FONT_TEXT_PATH:
            SceneTextPath(canvas, frame, params);
            break;
        case FONT_MGR_FAMILY:
            SceneFontMgrFamily(canvas, frame, params);
            break;
        case FONT_TYPEFACE_DEFAULT:
            SceneTypefaceDefault(canvas, frame, params);
            break;
        default:
            break;
    }
}
} // namespace

void DrawFontScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t scene,
    const ParamBag &params)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawFontScene invalid canvas or size, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (scene < FONT_CREATE || scene >= FONT_SCENE_COUNT) {
        DRAWING_LOGE("DrawFontScene unsupported scene=%{public}d", scene);
        return;
    }
    const cap::Frame frame = cap::MakeFrame(width, height);
    DrawFontKind(canvas, frame, params, scene);
    DRAWING_LOGI("DrawFontScene done, scene=%{public}d size=%{public}dx%{public}d", scene, width, height);
}
} // namespace ndr
