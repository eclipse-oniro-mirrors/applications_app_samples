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
#include "cap_image_io.h"

#include <cstdio>
#include <cstdlib>

#include <native_drawing/drawing_bitmap.h>
#include <native_drawing/drawing_font.h>
#include <native_drawing/drawing_image.h>
#include <native_drawing/drawing_memory_stream.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_sampling_options.h>
#include <native_drawing/drawing_text_blob.h>
#include <native_drawing/drawing_typeface.h>

#include "common/log_common.h"
#include "capability/cap_text_util.h"
#include "capability/cap_util.h"
#include "capability/capability_type.h"

namespace ndr {
namespace {
constexpr uint32_t IMAGE_SIDE = 64;
constexpr size_t MAX_FONT_BYTES = 8 * 1024 * 1024;
constexpr const char *STREAM_TEXT = "Stream";
// 内存流演示用的字节数与非法流的最小样本长度，256 便于按块均分。
constexpr size_t MEMORY_STREAM_BYTES = 256;
constexpr size_t INVALID_STREAM_BYTES = 16;

// 创建一张带内容的位图，作为 Image 的像素来源。
OH_Drawing_Bitmap *CreateSampleBitmap(int32_t side, int32_t palette)
{
    if (side <= 0) {
        return nullptr;
    }
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    if (bitmap == nullptr) {
        DRAWING_LOGE("CreateSampleBitmap create failed");
        return nullptr;
    }
    OH_Drawing_BitmapFormat format;
    format.colorFormat = COLOR_FORMAT_RGBA_8888;
    format.alphaFormat = ALPHA_FORMAT_PREMUL;
    OH_Drawing_BitmapBuild(bitmap, static_cast<uint32_t>(side), static_cast<uint32_t>(side), &format);
    OH_Drawing_Canvas *offscreen = OH_Drawing_CanvasCreate();
    if (offscreen != nullptr) {
        OH_Drawing_CanvasBind(offscreen, bitmap);
        OH_Drawing_CanvasClear(offscreen, cap::PaletteColor(palette));
        cap::FillCircleArea(offscreen, cap::PaletteColor(palette + 1), static_cast<float>(side) * 0.5F,
            static_cast<float>(side) * 0.5F, static_cast<float>(side) * 0.35F);
        cap::FillRectArea(offscreen, cap::WithAlpha(cap::PaletteColor(palette + 2), 0.8F), 0.0F, 0.0F,
            static_cast<float>(side) * 0.4F, static_cast<float>(side) * 0.4F);
        OH_Drawing_CanvasDestroy(offscreen);
    }
    return bitmap;
}

// 位图转 Image，两者都需成对释放；这里把创建与销毁收在一处，避免场景里重复写。
struct ImageBundle {
    OH_Drawing_Bitmap *bitmap = nullptr;
    OH_Drawing_Image *image = nullptr;
};

bool BuildImageBundle(ImageBundle &bundle, int32_t side, int32_t palette)
{
    bundle.bitmap = CreateSampleBitmap(side, palette);
    if (bundle.bitmap == nullptr) {
        return false;
    }
    bundle.image = OH_Drawing_ImageCreate();
    if (bundle.image == nullptr || !OH_Drawing_ImageBuildFromBitmap(bundle.image, bundle.bitmap)) {
        DRAWING_LOGE("BuildImageBundle build image failed");
        return false;
    }
    return true;
}

void ReleaseImageBundle(ImageBundle &bundle)
{
    if (bundle.image != nullptr) {
        OH_Drawing_ImageDestroy(bundle.image);
        bundle.image = nullptr;
    }
    if (bundle.bitmap != nullptr) {
        OH_Drawing_BitmapDestroy(bundle.bitmap);
        bundle.bitmap = nullptr;
    }
}

OH_Drawing_SamplingOptions *NewSampling(OH_Drawing_FilterMode filterMode)
{
    return OH_Drawing_SamplingOptionsCreate(filterMode, MIPMAP_MODE_NONE);
}

// 把图像按目标矩形绘制，采样模式由参数决定。
void DrawImageRect(OH_Drawing_Canvas *canvas, OH_Drawing_Image *image, float left, float top, float right,
    float bottom, OH_Drawing_FilterMode filterMode)
{
    if (image == nullptr || right <= left || bottom <= top) {
        return;
    }
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(left, top, right, bottom);
    OH_Drawing_SamplingOptions *sampling = NewSampling(filterMode);
    if (dst != nullptr && sampling != nullptr) {
        OH_Drawing_CanvasDrawImageRect(canvas, image, dst, sampling);
    }
    if (sampling != nullptr) {
        OH_Drawing_SamplingOptionsDestroy(sampling);
    }
    if (dst != nullptr) {
        OH_Drawing_RectDestroy(dst);
    }
}

// 0. 构建图像：位图 -> Image，再把 Image 画到画布中心。
void SceneBuild(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const float side = frame.Span(params.Range(1, 50.0F, 20.0F, 90.0F));
    ImageBundle bundle;
    if (!BuildImageBundle(bundle, static_cast<int32_t>(IMAGE_SIDE), palette)) {
        ReleaseImageBundle(bundle);
        return;
    }
    DrawImageRect(canvas, bundle.image, frame.centerX - side * 0.5F, frame.centerY - side * 0.5F,
        frame.centerX + side * 0.5F, frame.centerY + side * 0.5F, FILTER_MODE_LINEAR);
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette + 3), 2.0F, frame.centerX - side * 0.5F,
        frame.centerY - side * 0.5F, frame.centerX + side * 0.5F, frame.centerY + side * 0.5F);
    ReleaseImageBundle(bundle);
}

// 1. 直接绘制：Image 以目标矩形整体贴图，不做源区域裁剪。
void SceneDraw(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    ImageBundle bundle;
    if (!BuildImageBundle(bundle, static_cast<int32_t>(IMAGE_SIDE), palette)) {
        ReleaseImageBundle(bundle);
        return;
    }
    DrawImageRect(canvas, bundle.image, frame.X(8.0F), frame.Y(20.0F), frame.X(92.0F), frame.Y(80.0F),
        FILTER_MODE_LINEAR);
    ReleaseImageBundle(bundle);
}

// 2. 源矩形：只取源图中间区域绘制，演示源与目标的独立映射。
void SceneSrcRect(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    const float srcPercent = params.Percent(1, 0.5F);
    ImageBundle bundle;
    if (!BuildImageBundle(bundle, static_cast<int32_t>(IMAGE_SIDE), palette)) {
        ReleaseImageBundle(bundle);
        return;
    }
    const float side = static_cast<float>(IMAGE_SIDE);
    const float inset = side * (1.0F - srcPercent) * 0.5F;
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(inset, inset, side - inset, side - inset);
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(frame.X(10.0F), frame.Y(18.0F), frame.X(90.0F), frame.Y(82.0F));
    OH_Drawing_SamplingOptions *sampling = NewSampling(FILTER_MODE_LINEAR);
    if (src != nullptr && dst != nullptr && sampling != nullptr) {
        OH_Drawing_CanvasDrawImageRectWithSrc(canvas, bundle.image, src, dst, sampling, STRICT_SRC_RECT_CONSTRAINT);
    }
    if (sampling != nullptr) {
        OH_Drawing_SamplingOptionsDestroy(sampling);
    }
    if (dst != nullptr) {
        OH_Drawing_RectDestroy(dst);
    }
    if (src != nullptr) {
        OH_Drawing_RectDestroy(src);
    }
    ReleaseImageBundle(bundle);
}

// 3. 图像信息：按 ImageGetWidth/Height 决定绘制比例，并按 alphaType 画标记色块。
void SceneInfo(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 4);
    ImageBundle bundle;
    if (!BuildImageBundle(bundle, static_cast<int32_t>(IMAGE_SIDE), palette)) {
        ReleaseImageBundle(bundle);
        return;
    }
    const int32_t imageWidth = OH_Drawing_ImageGetWidth(bundle.image);
    const int32_t imageHeight = OH_Drawing_ImageGetHeight(bundle.image);
    OH_Drawing_Image_Info info;
    OH_Drawing_ImageGetImageInfo(bundle.image, &info);
    const float aspect = imageHeight > 0 ? static_cast<float>(imageWidth) / static_cast<float>(imageHeight) : 1.0F;
    const float boxWidth = frame.X(56.0F);
    const float boxHeight = boxWidth / (aspect > 0.1F ? aspect : 1.0F);
    DrawImageRect(canvas, bundle.image, frame.centerX - boxWidth * 0.5F, frame.centerY - boxHeight * 0.5F,
        frame.centerX + boxWidth * 0.5F, frame.centerY + boxHeight * 0.5F, FILTER_MODE_LINEAR);
    // 右上角色块数量对应颜色格式，右下角色块对应透明度格式，便于对照信息结构体。
    const int32_t colorBlocks = info.colorType == COLOR_FORMAT_RGBA_8888 ? 3 : 2;
    for (int32_t index = 0; index < colorBlocks; ++index) {
        const float left = frame.X(6.0F) + static_cast<float>(index) * frame.X(8.0F);
        cap::FillRectArea(canvas, cap::PaletteColor(palette + index), left, frame.Y(6.0F), left + frame.X(6.0F),
            frame.Y(12.0F));
    }
    if (info.alphaType != ALPHA_FORMAT_OPAQUE) {
        cap::FillRectArea(canvas, cap::WithAlpha(cap::PaletteColor(palette + 5), 0.4F), frame.X(86.0F),
            frame.Y(88.0F), frame.X(94.0F), frame.Y(94.0F));
    }
    ReleaseImageBundle(bundle);
}

// 4..5. 采样对比：最近邻保留硬边，线性插值更平滑。
void SceneSampling(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params,
    OH_Drawing_FilterMode filterMode)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 5);
    const float zoom = params.Percent(1, 0.5F);
    ImageBundle bundle;
    if (!BuildImageBundle(bundle, static_cast<int32_t>(IMAGE_SIDE), palette)) {
        ReleaseImageBundle(bundle);
        return;
    }
    const float halfSide = frame.Span(20.0F) + frame.Span(25.0F) * zoom;
    DrawImageRect(canvas, bundle.image, frame.centerX - halfSide, frame.centerY - halfSide,
        frame.centerX + halfSide, frame.centerY + halfSide, filterMode);
    ReleaseImageBundle(bundle);
}

// 6. 透明叠加：图像放在带 alpha 的图层里绘制，与背景自然混合。
void SceneAlphaCopy(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const float alpha = params.Percent(1, 0.5F);
    ImageBundle bundle;
    if (!BuildImageBundle(bundle, static_cast<int32_t>(IMAGE_SIDE), palette)) {
        ReleaseImageBundle(bundle);
        return;
    }
    // 背景棋盘：用于观察半透明图像与底色的混合关系。
    const int32_t columns = 8;
    const int32_t rows = 6;
    for (int32_t row = 0; row < rows; ++row) {
        for (int32_t column = 0; column < columns; ++column) {
            const bool even = (row + column) % 2 == 0;
            const float left = frame.X(static_cast<float>(column) * 100.0F / static_cast<float>(columns));
            const float top = frame.Y(static_cast<float>(row) * 100.0F / static_cast<float>(rows));
            cap::FillRectArea(canvas, even ? cap::PaletteColor(palette + 4) : cap::PaletteColor(palette + 5), left,
                top, left + frame.X(100.0F / static_cast<float>(columns)),
                top + frame.Y(100.0F / static_cast<float>(rows)));
        }
    }
    OH_Drawing_Brush *layerBrush = cap::NewBrush(cap::WithAlpha(cap::PaletteColor(palette), alpha));
    if (layerBrush != nullptr) {
        OH_Drawing_Rect *layerRect = OH_Drawing_RectCreate(0.0F, 0.0F, frame.width, frame.height);
        if (layerRect != nullptr) {
            OH_Drawing_CanvasSaveLayer(canvas, layerRect, layerBrush);
            DrawImageRect(canvas, bundle.image, frame.X(20.0F), frame.Y(20.0F), frame.X(80.0F), frame.Y(80.0F),
                FILTER_MODE_LINEAR);
            OH_Drawing_CanvasRestore(canvas);
            OH_Drawing_RectDestroy(layerRect);
        }
        OH_Drawing_BrushDestroy(layerBrush);
    }
    ReleaseImageBundle(bundle);
}

// 7. 内存流：把一段内存包装成 MemoryStream，用缓冲区块数量体现流长度。
void SceneMemoryStream(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    const int32_t blockCount = params.Int(1, 6, 1, 12);
    uint8_t data[MEMORY_STREAM_BYTES] = {0};
    for (size_t index = 0; index < sizeof(data); ++index) {
        data[index] = static_cast<uint8_t>(index & 0xFFU);
    }
    OH_Drawing_MemoryStream *stream = OH_Drawing_MemoryStreamCreate(data, sizeof(data), true);
    if (stream == nullptr) {
        DRAWING_LOGW("SceneMemoryStream create memory stream failed");
        return;
    }
    const float cellWidth = frame.X(80.0F) / static_cast<float>(blockCount);
    for (int32_t index = 0; index < blockCount; ++index) {
        const float left = frame.X(10.0F) + cellWidth * static_cast<float>(index);
        cap::FillRectArea(canvas, cap::PaletteColor(palette + index % 3), left, frame.Y(35.0F),
            left + cellWidth - 3.0F, frame.Y(65.0F));
    }
    OH_Drawing_MemoryStreamDestroy(stream);
}

// 读取字体文件的全部字节，供 TypefaceCreateFromStream 使用；失败返回空。
uint8_t *ReadFontFile(size_t &length)
{
    length = 0;
    for (int32_t index = 0; index < cap::SAMPLE_FONT_COUNT; ++index) {
        FILE *file = fopen(cap::SAMPLE_FONT_PATHS[index], "rb");
        if (file == nullptr) {
            continue;
        }
        if (fseek(file, 0, SEEK_END) != 0) {
            fclose(file);
            continue;
        }
        const long size = ftell(file);
        if (size <= 0 || static_cast<size_t>(size) > MAX_FONT_BYTES) {
            fclose(file);
            continue;
        }
        rewind(file);
        uint8_t *buffer = static_cast<uint8_t *>(malloc(static_cast<size_t>(size)));
        if (buffer == nullptr) {
            fclose(file);
            continue;
        }
        const size_t readBytes = fread(buffer, 1, static_cast<size_t>(size), file);
        fclose(file);
        if (readBytes != static_cast<size_t>(size)) {
            free(buffer);
            continue;
        }
        length = readBytes;
        return buffer;
    }
    return nullptr;
}

// 用当前字形绘制一段文字，作为 Typeface 是否可用的视觉反馈。
void DrawStreamText(OH_Drawing_Canvas *canvas, const cap::Frame &frame, OH_Drawing_Typeface *typeface,
    uint32_t color)
{
    OH_Drawing_Font *font = OH_Drawing_FontCreate();
    if (font == nullptr) {
        return;
    }
    OH_Drawing_FontSetTextSize(font, frame.Span(14.0F));
    if (typeface != nullptr) {
        OH_Drawing_FontSetTypeface(font, typeface);
    }
    OH_Drawing_TextBlob *textBlob = OH_Drawing_TextBlobCreateFromString(STREAM_TEXT, font, TEXT_ENCODING_UTF8);
    if (textBlob != nullptr) {
        OH_Drawing_Brush *brush = cap::NewBrush(color);
        if (brush != nullptr) {
            OH_Drawing_CanvasAttachBrush(canvas, brush);
            OH_Drawing_CanvasDrawTextBlob(canvas, textBlob, frame.X(16.0F), frame.Y(60.0F));
            OH_Drawing_CanvasDetachBrush(canvas);
            OH_Drawing_BrushDestroy(brush);
        }
        OH_Drawing_TextBlobDestroy(textBlob);
    } else {
        DRAWING_LOGW("DrawStreamText create text blob failed");
    }
    OH_Drawing_FontDestroy(font);
}

// 8. 字体流：从字体文件字节创建 MemoryStream，再由 TypefaceCreateFromStream 解析出字形。
void SceneTypefaceStream(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    size_t length = 0;
    uint8_t *buffer = ReadFontFile(length);
    OH_Drawing_Typeface *typeface = nullptr;
    if (buffer != nullptr) {
        OH_Drawing_MemoryStream *stream = OH_Drawing_MemoryStreamCreate(buffer, length, true);
        if (stream != nullptr) {
            // 依 drawing_typeface.h 约定，流入 TypefaceCreateFromStream 后所有权即转移，
            // 无论解析成败都不能再调用 MemoryStreamDestroy，否则会重复释放底层缓冲。
            typeface = OH_Drawing_TypefaceCreateFromStream(stream, 0);
        }
        // 创建流时 copyData 为 true，流持有的是自己的副本，这里的原始字节仍由本函数释放。
        free(buffer);
    }
    if (typeface == nullptr) {
        // 字体文件缺失时退回默认字形，保证场景仍有可观察输出。
        typeface = OH_Drawing_TypefaceCreateDefault();
        DRAWING_LOGW("SceneTypefaceStream fallback to default typeface");
    }
    DrawStreamText(canvas, frame, typeface, cap::PaletteColor(palette));
    // 下方画一条粗细随长度变化的横条，体现流长度参与了构图。
    const float ratio = length == 0 ? 0.2F : cap::ClampFloat(static_cast<float>(length) / 1024.0F, 0.2F, 1.0F);
    cap::FillRectArea(canvas, cap::PaletteColor(palette + 2), frame.X(16.0F), frame.Y(72.0F),
        frame.X(16.0F) + frame.X(68.0F) * ratio, frame.Y(76.0F));
    if (typeface != nullptr) {
        OH_Drawing_TypefaceDestroy(typeface);
    }
}

// 9. 流失败回退：用非法字节构造流，验证解析失败后仍能用默认字形继续绘制。
void SceneStreamFallback(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 5);
    // 固定到静态区，避免把栈地址交给绘图库后出现悬垂引用。
    static const uint8_t invalidBytes[INVALID_STREAM_BYTES] = {0};
    OH_Drawing_MemoryStream *stream = OH_Drawing_MemoryStreamCreate(invalidBytes, sizeof(invalidBytes), true);
    OH_Drawing_Typeface *typeface = nullptr;
    if (stream != nullptr) {
        // 与 SceneTypefaceStream 相同：流入 TypefaceCreateFromStream 后所有权转移，不可再销毁。
        typeface = OH_Drawing_TypefaceCreateFromStream(stream, 0);
    }
    if (typeface == nullptr) {
        DRAWING_LOGW("SceneStreamFallback invalid stream rejected as expected");
        typeface = OH_Drawing_TypefaceCreateDefault();
    }
    DrawStreamText(canvas, frame, typeface, cap::PaletteColor(palette));
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette + 1), 2.0F, frame.X(12.0F), frame.Y(30.0F),
        frame.X(88.0F), frame.Y(70.0F));
    if (typeface != nullptr) {
        OH_Drawing_TypefaceDestroy(typeface);
    }
}
} // namespace

void DrawImageIoScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t scene,
    const ParamBag &params)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawImageIoScene invalid canvas or size, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (scene < IMAGE_IO_BUILD || scene >= IMAGE_IO_SCENE_COUNT) {
        DRAWING_LOGE("DrawImageIoScene unsupported scene=%{public}d", scene);
        return;
    }
    const cap::Frame frame = cap::MakeFrame(width, height);
    switch (scene) {
        case IMAGE_IO_BUILD:
            SceneBuild(canvas, frame, params);
            break;
        case IMAGE_IO_DRAW:
            SceneDraw(canvas, frame, params);
            break;
        case IMAGE_IO_SRC_RECT:
            SceneSrcRect(canvas, frame, params);
            break;
        case IMAGE_IO_INFO:
            SceneInfo(canvas, frame, params);
            break;
        case IMAGE_IO_SAMPLING_NEAREST:
            SceneSampling(canvas, frame, params, FILTER_MODE_NEAREST);
            break;
        case IMAGE_IO_SAMPLING_LINEAR:
            SceneSampling(canvas, frame, params, FILTER_MODE_LINEAR);
            break;
        case IMAGE_IO_ALPHA_COPY:
            SceneAlphaCopy(canvas, frame, params);
            break;
        case IMAGE_IO_MEMORY_STREAM:
            SceneMemoryStream(canvas, frame, params);
            break;
        case IMAGE_IO_TYPEFACE_STREAM:
            SceneTypefaceStream(canvas, frame, params);
            break;
        case IMAGE_IO_STREAM_FALLBACK:
            SceneStreamFallback(canvas, frame, params);
            break;
        default:
            break;
    }
    DRAWING_LOGI("DrawImageIoScene done, scene=%{public}d size=%{public}dx%{public}d", scene, width, height);
}
} // namespace ndr
