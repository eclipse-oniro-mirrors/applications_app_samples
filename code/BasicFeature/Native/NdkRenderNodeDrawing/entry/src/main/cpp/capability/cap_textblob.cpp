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
#include "cap_textblob.h"

#include <cmath>
#include <cstring>

#include <native_drawing/drawing_font.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_text_blob.h>

#include "common/log_common.h"
#include "capability/cap_text_util.h"
#include "capability/cap_util.h"
#include "capability/capability_type.h"

namespace ndr {
namespace {
constexpr const char *SAMPLE_TEXT = "TextBlob 文字块";
constexpr int32_t MAX_GLYPH_COUNT = 64;
constexpr int32_t ID_BAR_COUNT = 8;

// 用画刷把文字块贴到画布上，统一在这里处理画笔的创建与释放。
void DrawBlobAt(OH_Drawing_Canvas *canvas, OH_Drawing_TextBlob *textBlob, float x, float y, uint32_t color)
{
    if (canvas == nullptr || textBlob == nullptr) {
        return;
    }
    OH_Drawing_Brush *brush = cap::NewBrush(color);
    if (brush == nullptr) {
        return;
    }
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, x, y);
    OH_Drawing_CanvasDetachBrush(canvas);
    OH_Drawing_BrushDestroy(brush);
}

// 0. 字符串构造：CreateFromString 是最省事的方式，内部按 UTF-8 解析。
void SceneString(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const float fontSize = frame.Span(params.Range(1, 16.0F, 8.0F, 40.0F));
    OH_Drawing_Font *font = cap::CreateSampleFont(fontSize);
    if (font == nullptr) {
        return;
    }
    OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobCreateFromString(SAMPLE_TEXT, font, TEXT_ENCODING_UTF8);
    if (textBlob != nullptr) {
        DrawBlobAt(canvas, textBlob, frame.X(8.0F), frame.centerY, cap::PaletteColor(palette));
        OH_Drawing_TextBlobDestroy(textBlob);
    }
    OH_Drawing_FontDestroy(font);
}

// 1. 显式长度：CreateFromText 允许只截取字符串前面若干字节，适合做截断效果。
void SceneText(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    const int32_t takePercent = params.Int(1, 100, 20, 100);
    const size_t byteLength = strlen(SAMPLE_TEXT);
    const size_t usedLength = byteLength * static_cast<size_t>(takePercent) / 100;
    OH_Drawing_Font *font = cap::CreateSampleFont(frame.Span(16.0F));
    if (font == nullptr) {
        return;
    }
    OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobCreateFromText(SAMPLE_TEXT, usedLength, font,
        TEXT_ENCODING_UTF8);
    if (textBlob != nullptr) {
        DrawBlobAt(canvas, textBlob, frame.X(8.0F), frame.centerY, cap::PaletteColor(palette));
        OH_Drawing_TextBlobDestroy(textBlob);
    } else {
        DRAWING_LOGW("SceneText create text blob failed, length=%{public}d", static_cast<int32_t>(usedLength));
    }
    OH_Drawing_FontDestroy(font);
}

// 2. 指定位置：逐个字符给出坐标，文字沿一条正弦曲线排布。
void ScenePosText(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    const float amplitude = frame.Span(params.Range(1, 12.0F, 0.0F, 30.0F));
    OH_Drawing_Font *font = cap::CreateSampleFont(frame.Span(14.0F));
    if (font == nullptr) {
        return;
    }
    const int32_t count = OH_Drawing_FontCountText(font, SAMPLE_TEXT, strlen(SAMPLE_TEXT), TEXT_ENCODING_UTF8);
    if (count <= 0 || count > MAX_GLYPH_COUNT) {
        DRAWING_LOGW("ScenePosText unexpected char count=%{public}d", count);
        OH_Drawing_FontDestroy(font);
        return;
    }
    const float step = frame.X(76.0F) / static_cast<float>(count);
    OH_Drawing_Point2D points[MAX_GLYPH_COUNT] = {{0.0F, 0.0F}};
    for (int32_t index = 0; index < count; ++index) {
        const float ratio = static_cast<float>(index) / static_cast<float>(count);
        points[index].x = frame.X(10.0F) + step * static_cast<float>(index);
        points[index].y = frame.centerY - amplitude * std::sin(ratio * 2.0F * cap::PI);
    }
    OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobCreateFromPosText(SAMPLE_TEXT, strlen(SAMPLE_TEXT), points,
        font, TEXT_ENCODING_UTF8);
    if (textBlob != nullptr) {
        // 参考曲线：与文字位置使用同一组参数，便于对照。
        for (int32_t index = 0; index < count; ++index) {
            cap::FillCircleArea(canvas, cap::PaletteColor(palette + 1), points[index].x, points[index].y, 2.0F);
        }
        DrawBlobAt(canvas, textBlob, 0.0F, 0.0F, cap::PaletteColor(palette));
        OH_Drawing_TextBlobDestroy(textBlob);
    } else {
        DRAWING_LOGW("ScenePosText create text blob failed");
    }
    OH_Drawing_FontDestroy(font);
}

// 3. 构建器：先申请一段 RunBuffer，填入字形与坐标，最后由 BuilderMake 生成文字块。
void SceneBuilder(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 4);
    const float spacing = frame.X(params.Range(1, 1.0F, 0.5F, 4.0F));
    OH_Drawing_Font *font = cap::CreateSampleFont(frame.Span(16.0F));
    OH_Drawing_TextBlobBuilder *builder = OH_Drawing_TextBlobBuilderCreate();
    if (font == nullptr || builder == nullptr) {
        if (builder != nullptr) {
            OH_Drawing_TextBlobBuilderDestroy(builder);
        }
        if (font != nullptr) {
            OH_Drawing_FontDestroy(font);
        }
        return;
    }
    const int32_t count = OH_Drawing_FontCountText(font, SAMPLE_TEXT, strlen(SAMPLE_TEXT), TEXT_ENCODING_UTF8);
    if (count > 0 && count <= MAX_GLYPH_COUNT) {
        const OH_Drawing_RunBuffer *runBuffer = OH_Drawing_TextBlobBuilderAllocRunPos(builder, font, count, nullptr);
        if (runBuffer != nullptr && runBuffer->glyphs != nullptr && runBuffer->pos != nullptr) {
            uint16_t glyphs[MAX_GLYPH_COUNT] = {0};
            const uint32_t glyphCount = OH_Drawing_FontTextToGlyphs(font, SAMPLE_TEXT,
                static_cast<uint32_t>(strlen(SAMPLE_TEXT)), TEXT_ENCODING_UTF8, glyphs, MAX_GLYPH_COUNT);
            for (int32_t index = 0; index < count; ++index) {
                runBuffer->glyphs[index] = index < static_cast<int32_t>(glyphCount) ? glyphs[index] : glyphs[0];
                // 坐标按对齐步长排列，形成字距可调的横向文字。
                runBuffer->pos[index * 2] = frame.X(10.0F) + spacing * static_cast<float>(index) * 8.0F;
                runBuffer->pos[index * 2 + 1] = frame.centerY;
            }
        }
        OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobBuilderMake(builder);
        if (textBlob != nullptr) {
            DrawBlobAt(canvas, textBlob, 0.0F, 0.0F, cap::PaletteColor(palette));
            OH_Drawing_TextBlobDestroy(textBlob);
        } else {
            DRAWING_LOGW("SceneBuilder make text blob failed");
        }
    }
    OH_Drawing_TextBlobBuilderDestroy(builder);
    OH_Drawing_FontDestroy(font);
}

// 4. 包围盒：GetBounds 得到的矩形用描边画出，验证文字的实际占用范围。
void SceneBounds(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 5);
    const float fontSize = frame.Span(params.Range(1, 16.0F, 8.0F, 40.0F));
    OH_Drawing_Font *font = cap::CreateSampleFont(fontSize);
    if (font == nullptr) {
        return;
    }
    OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobCreateFromString(SAMPLE_TEXT, font, TEXT_ENCODING_UTF8);
    if (textBlob == nullptr) {
        OH_Drawing_FontDestroy(font);
        return;
    }
    const float originX = frame.X(12.0F);
    const float originY = frame.centerY;
    DrawBlobAt(canvas, textBlob, originX, originY, cap::PaletteColor(palette));
    OH_Drawing_Rect *bounds = OH_Drawing_RectCreate(0.0F, 0.0F, 0.0F, 0.0F);
    if (bounds != nullptr) {
        OH_Drawing_TextBlobGetBounds(textBlob, bounds);
        // 包围盒以文字块自身坐标系给出，绘制时平移到落笔位置。
        cap::StrokeRectArea(canvas, cap::PaletteColor(palette + 2), 2.0F,
            originX + OH_Drawing_RectGetLeft(bounds), originY + OH_Drawing_RectGetTop(bounds),
            originX + OH_Drawing_RectGetRight(bounds), originY + OH_Drawing_RectGetBottom(bounds));
        OH_Drawing_RectDestroy(bounds);
    }
    OH_Drawing_TextBlobDestroy(textBlob);
    OH_Drawing_FontDestroy(font);
}

// 5. 唯一编号：UniqueID 非零，用一组方块按位展示编号特征，验证多次创建结果不同。
void SceneUniqueId(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    OH_Drawing_Font *font = cap::CreateSampleFont(frame.Span(14.0F));
    if (font == nullptr) {
        return;
    }
    OH_Drawing_TextBlob *first = OH_Drawing_TextBlobCreateFromString(SAMPLE_TEXT, font, TEXT_ENCODING_UTF8);
    OH_Drawing_TextBlob *second = OH_Drawing_TextBlobCreateFromString(SAMPLE_TEXT, font, TEXT_ENCODING_UTF8);
    if (first != nullptr && second != nullptr) {
        const uint32_t firstId = OH_Drawing_TextBlobUniqueID(first);
        const uint32_t secondId = OH_Drawing_TextBlobUniqueID(second);
        for (int32_t index = 0; index < ID_BAR_COUNT; ++index) {
            const float left = frame.X(8.0F) + static_cast<float>(index) * frame.X(10.0F);
            const bool firstBit = (firstId >> index) & 0x1U;
            const bool secondBit = (secondId >> index) & 0x1U;
            cap::FillRectArea(canvas, cap::PaletteColor(palette + index % 3), left, frame.Y(30.0F),
                left + frame.X(7.0F), frame.Y(firstBit ? 44.0F : 41.0F));
            cap::FillRectArea(canvas, cap::PaletteColor(palette + 4), left, frame.Y(52.0F),
                left + frame.X(7.0F), frame.Y(secondBit ? 66.0F : 63.0F));
        }
        DrawBlobAt(canvas, first, frame.X(8.0F), frame.Y(84.0F), cap::PaletteColor(palette));
    }
    if (second != nullptr) {
        OH_Drawing_TextBlobDestroy(second);
    }
    if (first != nullptr) {
        OH_Drawing_TextBlobDestroy(first);
    }
    OH_Drawing_FontDestroy(font);
}

// 6. 环形排列：把每个字符摆到圆周上，演示逐字定位的排版能力。
void SceneCircle(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    const float radius = frame.Span(params.Range(1, 26.0F, 12.0F, 40.0F));
    OH_Drawing_Font *font = cap::CreateSampleFont(frame.Span(12.0F));
    if (font == nullptr) {
        return;
    }
    const int32_t count = OH_Drawing_FontCountText(font, SAMPLE_TEXT, strlen(SAMPLE_TEXT), TEXT_ENCODING_UTF8);
    if (count <= 0 || count > MAX_GLYPH_COUNT) {
        OH_Drawing_FontDestroy(font);
        return;
    }
    OH_Drawing_Point2D points[MAX_GLYPH_COUNT] = {{0.0F, 0.0F}};
    for (int32_t index = 0; index < count; ++index) {
        const float angle = 2.0F * cap::PI * static_cast<float>(index) / static_cast<float>(count);
        points[index].x = frame.centerX + radius * std::cos(angle);
        points[index].y = frame.centerY + radius * std::sin(angle);
    }
    OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobCreateFromPosText(SAMPLE_TEXT, strlen(SAMPLE_TEXT), points,
        font, TEXT_ENCODING_UTF8);
    if (textBlob != nullptr) {
        DrawBlobAt(canvas, textBlob, 0.0F, 0.0F, cap::PaletteColor(palette));
        OH_Drawing_TextBlobDestroy(textBlob);
    }
    // 圆环参考线与中心点，突出“文字沿圆周分布”的结构。
    cap::StrokeCircleArea(canvas, cap::PaletteColor(palette + 3), 1.0F, frame.centerX, frame.centerY, radius);
    cap::FillCircleArea(canvas, cap::PaletteColor(palette + 1), frame.centerX, frame.centerY, 3.0F);
    OH_Drawing_FontDestroy(font);
}

// 7. 缩放绘制：文字块本身不缩放，由画布变换控制，放大后仍保持矢量清晰度。
void SceneScale(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    const float scale = params.Range(1, 1.5F, 0.5F, 3.0F);
    OH_Drawing_Font *font = cap::CreateSampleFont(frame.Span(12.0F));
    if (font == nullptr) {
        return;
    }
    OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobCreateFromString("Scale", font, TEXT_ENCODING_UTF8);
    if (textBlob == nullptr) {
        OH_Drawing_FontDestroy(font);
        return;
    }
    OH_Drawing_CanvasSave(canvas);
    OH_Drawing_CanvasTranslate(canvas, frame.X(10.0F), frame.centerY);
    OH_Drawing_CanvasScale(canvas, scale, scale);
    DrawBlobAt(canvas, textBlob, 0.0F, 0.0F, cap::PaletteColor(palette));
    OH_Drawing_CanvasRestore(canvas);
    OH_Drawing_TextBlobDestroy(textBlob);
    OH_Drawing_FontDestroy(font);
}
} // namespace

void DrawTextBlobScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t scene,
    const ParamBag &params)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawTextBlobScene invalid canvas or size, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (scene < TEXTBLOB_STRING || scene >= TEXTBLOB_SCENE_COUNT) {
        DRAWING_LOGE("DrawTextBlobScene unsupported scene=%{public}d", scene);
        return;
    }
    const cap::Frame frame = cap::MakeFrame(width, height);
    switch (scene) {
        case TEXTBLOB_STRING:
            SceneString(canvas, frame, params);
            break;
        case TEXTBLOB_TEXT:
            SceneText(canvas, frame, params);
            break;
        case TEXTBLOB_POS_TEXT:
            ScenePosText(canvas, frame, params);
            break;
        case TEXTBLOB_BUILDER:
            SceneBuilder(canvas, frame, params);
            break;
        case TEXTBLOB_BOUNDS:
            SceneBounds(canvas, frame, params);
            break;
        case TEXTBLOB_UNIQUE_ID:
            SceneUniqueId(canvas, frame, params);
            break;
        case TEXTBLOB_CIRCLE:
            SceneCircle(canvas, frame, params);
            break;
        case TEXTBLOB_SCALE:
            SceneScale(canvas, frame, params);
            break;
        default:
            break;
    }
    DRAWING_LOGI("DrawTextBlobScene done, scene=%{public}d size=%{public}dx%{public}d", scene, width, height);
}
} // namespace ndr
