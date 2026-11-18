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
#include "cap_bitmap.h"

#include <native_drawing/drawing_bitmap.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_sampling_options.h>

#include "common/log_common.h"
#include "capability/cap_util.h"
#include "capability/capability_type.h"

namespace ndr {
namespace {
constexpr uint32_t BYTES_PER_PIXEL = 4;
constexpr int32_t SAMPLE_SIZE = 16;
constexpr int32_t TILE_GRID_COUNT = 6;
constexpr int32_t MAX_BITMAP_SIDE = 256;
// 行字节数场景固定用 32 行高，条纹跨度由 rowBytes 决定。
constexpr int32_t ROW_BYTES_BITMAP_HEIGHT = 32;
// 参数面板第 3 位为位图高度。
constexpr int32_t PARAM_BITMAP_HEIGHT = 2;

// 按给定尺寸与像素格式创建一个位图；调用方负责 Destroy。
OH_Drawing_Bitmap *CreateBitmap(uint32_t width, uint32_t height, OH_Drawing_ColorFormat colorFormat,
    OH_Drawing_AlphaFormat alphaFormat)
{
    if (width == 0 || height == 0) {
        DRAWING_LOGE("CreateBitmap invalid size, width=%{public}u height=%{public}u", width, height);
        return nullptr;
    }
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    if (bitmap == nullptr) {
        DRAWING_LOGE("CreateBitmap create failed");
        return nullptr;
    }
    OH_Drawing_BitmapFormat format;
    format.colorFormat = colorFormat;
    format.alphaFormat = alphaFormat;
    OH_Drawing_BitmapBuild(bitmap, width, height, &format);
    return bitmap;
}

// 把位图绑定到一块临时画布上，先离屏绘制内容，再回到主画布展示。
void DrawIntoBitmap(OH_Drawing_Bitmap *bitmap, int32_t width, int32_t height, int32_t palette)
{
    if (bitmap == nullptr || width <= 0 || height <= 0) {
        return;
    }
    OH_Drawing_Canvas *offscreen = OH_Drawing_CanvasCreate();
    if (offscreen == nullptr) {
        DRAWING_LOGE("DrawIntoBitmap create canvas failed");
        return;
    }
    OH_Drawing_CanvasBind(offscreen, bitmap);
    OH_Drawing_CanvasClear(offscreen, cap::WithAlpha(cap::PaletteColor(palette), 1.0F));
    cap::FillCircleArea(offscreen, cap::PaletteColor(palette + 1), static_cast<float>(width) * 0.5F,
        static_cast<float>(height) * 0.5F, static_cast<float>(width) * 0.32F);
    cap::FillRectArea(offscreen, cap::WithAlpha(cap::PaletteColor(palette + 2), 0.7F),
        static_cast<float>(width) * 0.1F, static_cast<float>(height) * 0.1F, static_cast<float>(width) * 0.5F,
        static_cast<float>(height) * 0.4F);
    // 画布先于位图销毁，避免位图被仍在使用中的画布引用。
    OH_Drawing_CanvasDestroy(offscreen);
}

// 把位图拉伸到目标矩形；src 传空表示整幅贴图。
void DrawBitmapIntoRect(OH_Drawing_Canvas *canvas, const OH_Drawing_Bitmap *bitmap, float left, float top,
    float right, float bottom)
{
    if (canvas == nullptr || bitmap == nullptr || right <= left || bottom <= top) {
        return;
    }
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(left, top, right, bottom);
    if (dst == nullptr) {
        return;
    }
    OH_Drawing_SamplingOptions *sampling = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_LINEAR,
        MIPMAP_MODE_NONE);
    if (sampling == nullptr) {
        OH_Drawing_RectDestroy(dst);
        return;
    }
    OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, nullptr, dst, sampling);
    OH_Drawing_SamplingOptionsDestroy(sampling);
    OH_Drawing_RectDestroy(dst);
}

// 用给定像素数组创建位图，数组的生命周期由调用方保证长于位图。
OH_Drawing_Bitmap *CreateBitmapFromPixels(uint32_t width, uint32_t height, OH_Drawing_ColorFormat colorFormat,
    OH_Drawing_AlphaFormat alphaFormat, void *pixels)
{
    if (width == 0 || height == 0 || pixels == nullptr) {
        return nullptr;
    }
    OH_Drawing_Image_Info info;
    info.width = static_cast<int32_t>(width);
    info.height = static_cast<int32_t>(height);
    info.colorType = colorFormat;
    info.alphaType = alphaFormat;
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreateFromPixels(&info, pixels, width * BYTES_PER_PIXEL);
    if (bitmap == nullptr) {
        DRAWING_LOGW("CreateBitmapFromPixels failed, width=%{public}u", width);
    }
    return bitmap;
}

// 生成棋盘格像素：两色交替，便于观察缩放与采样差异。
void FillCheckerPixels(uint32_t *pixels, uint32_t width, uint32_t height, uint32_t first, uint32_t second)
{
    const uint32_t cell = 4;
    for (uint32_t row = 0; row < height; ++row) {
        for (uint32_t column = 0; column < width; ++column) {
            const bool even = ((row / cell) + (column / cell)) % 2 == 0;
            pixels[row * width + column] = even ? first : second;
        }
    }
}

// 0. 位图构建：先建空位图，再绑定离屏画布绘制内容，最后贴回主画布。
void SceneBuild(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const float side = frame.Span(params.Range(1, 40.0F, 10.0F, 90.0F));
    OH_Drawing_Bitmap *bitmap = CreateBitmap(static_cast<uint32_t>(side), static_cast<uint32_t>(side),
        COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_PREMUL);
    if (bitmap == nullptr) {
        return;
    }
    DrawIntoBitmap(bitmap, static_cast<int32_t>(side), static_cast<int32_t>(side), palette);
    DrawBitmapIntoRect(canvas, bitmap, frame.centerX - side * 0.5F, frame.centerY - side * 0.5F,
        frame.centerX + side * 0.5F, frame.centerY + side * 0.5F);
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette), 2.0F, frame.centerX - side * 0.5F,
        frame.centerY - side * 0.5F, frame.centerX + side * 0.5F, frame.centerY + side * 0.5F);
    OH_Drawing_BitmapDestroy(bitmap);
}

// 1. 原始尺寸绘制：DrawBitmap 不做缩放，位图像素与画布像素一一对应。
void SceneDraw(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    const int32_t side = params.Int(1, 96, 16, MAX_BITMAP_SIDE);
    OH_Drawing_Bitmap *bitmap = CreateBitmap(static_cast<uint32_t>(side), static_cast<uint32_t>(side),
        COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_PREMUL);
    if (bitmap == nullptr) {
        return;
    }
    DrawIntoBitmap(bitmap, side, side, palette);
    // 左上角按原始像素尺寸贴图，用于对照“贴图尺寸 = 位图尺寸”。
    OH_Drawing_CanvasDrawBitmap(canvas, bitmap, frame.X(6.0F), frame.Y(10.0F));
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette), 1.0F, frame.X(6.0F), frame.Y(10.0F),
        frame.X(6.0F) + static_cast<float>(side), frame.Y(10.0F) + static_cast<float>(side));
    OH_Drawing_BitmapDestroy(bitmap);
}

// 2. 矩形缩放：通过目标矩形把同一张位图拉伸到不同比例。
void SceneRectScale(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    const float scale = params.Percent(1, 0.8F);
    const float side = frame.Span(48.0F);
    OH_Drawing_Bitmap *bitmap = CreateBitmap(static_cast<uint32_t>(side), static_cast<uint32_t>(side),
        COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_PREMUL);
    if (bitmap == nullptr) {
        return;
    }
    DrawIntoBitmap(bitmap, static_cast<int32_t>(side), static_cast<int32_t>(side), palette);
    // 左侧按原始比例，右侧按参数缩放，直观看到采样拉伸的效果。
    DrawBitmapIntoRect(canvas, bitmap, frame.X(6.0F), frame.Y(25.0F), frame.X(6.0F) + side,
        frame.Y(25.0F) + side);
    const float scaledSide = side * (0.4F + scale);
    DrawBitmapIntoRect(canvas, bitmap, frame.X(52.0F), frame.centerY - scaledSide * 0.5F,
        frame.X(52.0F) + scaledSide, frame.centerY + scaledSide * 0.5F);
    OH_Drawing_BitmapDestroy(bitmap);
}

// 3. 回读像素：把位图像素读入内存数组，再用读到的颜色画色块验证结果一致。
void SceneReadPixels(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 4);
    OH_Drawing_Bitmap *bitmap = CreateBitmap(SAMPLE_SIZE, SAMPLE_SIZE, COLOR_FORMAT_RGBA_8888,
        ALPHA_FORMAT_PREMUL);
    if (bitmap == nullptr) {
        return;
    }
    DrawIntoBitmap(bitmap, SAMPLE_SIZE, SAMPLE_SIZE, palette);
    uint32_t pixels[SAMPLE_SIZE * SAMPLE_SIZE] = {0};
    OH_Drawing_Image_Info info;
    info.width = SAMPLE_SIZE;
    info.height = SAMPLE_SIZE;
    info.colorType = COLOR_FORMAT_RGBA_8888;
    info.alphaType = ALPHA_FORMAT_PREMUL;
    const bool ok = OH_Drawing_BitmapReadPixels(bitmap, &info, pixels, SAMPLE_SIZE * BYTES_PER_PIXEL, 0, 0);
    if (!ok) {
        DRAWING_LOGW("SceneReadPixels read pixels failed");
    }
    // 取四个采样点的颜色画成色块，回读成功时与原始位图配色一致。
    const int32_t sampleIndex[] = {0, SAMPLE_SIZE / 2, SAMPLE_SIZE * SAMPLE_SIZE / 2,
        SAMPLE_SIZE * SAMPLE_SIZE - 1};
    for (int32_t index = 0; index < 4; ++index) {
        const float left = frame.X(8.0F + static_cast<float>(index) * 21.0F);
        cap::FillRectArea(canvas, pixels[sampleIndex[index]], left, frame.Y(30.0F), left + frame.X(17.0F),
            frame.Y(70.0F));
    }
    OH_Drawing_BitmapDestroy(bitmap);
}

// 4. 从像素创建：直接以内存像素构造位图，避免离屏画布的开销。
void SceneFromPixels(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 5);
    const uint32_t cell = params.Int(1, 4, 1, 8);
    const uint32_t side = 24;
    uint32_t pixels[side * side] = {0};
    // cell 参数改变棋盘格密度，直接按参数生成像素，避免先填一次再覆盖。
    for (uint32_t row = 0; row < side; ++row) {
        for (uint32_t column = 0; column < side; ++column) {
            const bool even = ((row / cell) + (column / cell)) % 2 == 0;
            pixels[row * side + column] = even ? cap::PaletteColor(palette) : cap::PaletteColor(palette + 2);
        }
    }
    OH_Drawing_Bitmap *bitmap = CreateBitmapFromPixels(side, side, COLOR_FORMAT_RGBA_8888,
        ALPHA_FORMAT_PREMUL, pixels);
    if (bitmap == nullptr) {
        return;
    }
    DrawBitmapIntoRect(canvas, bitmap, frame.X(10.0F), frame.Y(20.0F), frame.X(90.0F), frame.Y(80.0F));
    OH_Drawing_BitmapDestroy(bitmap);
}

// 5. 图像信息：读取宽高与格式，按信息反推绘制比例，验证描述与实际一致。
void SceneImageInfo(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const int32_t width = params.Int(1, 64, 8, MAX_BITMAP_SIDE);
    const int32_t height = params.Int(PARAM_BITMAP_HEIGHT, 32, 8, MAX_BITMAP_SIDE);
    OH_Drawing_Bitmap *bitmap = CreateBitmap(static_cast<uint32_t>(width), static_cast<uint32_t>(height),
        COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_PREMUL);
    if (bitmap == nullptr) {
        return;
    }
    OH_Drawing_Image_Info info;
    OH_Drawing_BitmapGetImageInfo(bitmap, &info);
    const float aspect = info.height > 0 ? static_cast<float>(info.width) / static_cast<float>(info.height) : 1.0F;
    const float boxWidth = frame.X(60.0F);
    const float boxHeight = boxWidth / (aspect > 0.1F ? aspect : 1.0F);
    cap::FillRectArea(canvas, cap::PaletteColor(palette), frame.centerX - boxWidth * 0.5F,
        frame.centerY - boxHeight * 0.5F, frame.centerX + boxWidth * 0.5F, frame.centerY + boxHeight * 0.5F);
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette + 3), 2.0F, frame.centerX - boxWidth * 0.5F,
        frame.centerY - boxHeight * 0.5F, frame.centerX + boxWidth * 0.5F, frame.centerY + boxHeight * 0.5F);
    // 色块高度对应 alphaType：不透明与预乘各占一半高度，便于从画面读出格式。
    const float swatchTop = info.alphaType == ALPHA_FORMAT_OPAQUE ? frame.Y(6.0F) : frame.Y(12.0F);
    cap::FillRectArea(canvas, cap::PaletteColor(palette + 1), frame.X(6.0F), swatchTop, frame.X(14.0F),
        swatchTop + frame.Y(6.0F));
    OH_Drawing_BitmapDestroy(bitmap);
}

// 6. 透明度格式：预乘与非预乘在绘制半透明内容时表现不同。
void SceneAlphaFormat(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    const float alpha = params.Percent(1, 0.5F);
    const uint32_t side = 80;
    const OH_Drawing_AlphaFormat formats[] = {ALPHA_FORMAT_PREMUL, ALPHA_FORMAT_UNPREMUL};
    for (int32_t index = 0; index < 2; ++index) {
        OH_Drawing_Bitmap *bitmap = CreateBitmap(side, side, COLOR_FORMAT_RGBA_8888, formats[index]);
        if (bitmap == nullptr) {
            continue;
        }
        OH_Drawing_Canvas *offscreen = OH_Drawing_CanvasCreate();
        if (offscreen != nullptr) {
            OH_Drawing_CanvasBind(offscreen, bitmap);
            OH_Drawing_CanvasClear(offscreen, cap::WithAlpha(cap::PaletteColor(palette), 0.0F));
            cap::FillCircleArea(offscreen, cap::WithAlpha(cap::PaletteColor(palette + index), alpha),
                static_cast<float>(side) * 0.5F, static_cast<float>(side) * 0.5F,
                static_cast<float>(side) * 0.35F);
            OH_Drawing_CanvasDestroy(offscreen);
        }
        const float left = index == 0 ? frame.X(8.0F) : frame.X(54.0F);
        DrawBitmapIntoRect(canvas, bitmap, left, frame.Y(20.0F), left + frame.X(38.0F), frame.Y(80.0F));
        OH_Drawing_BitmapDestroy(bitmap);
    }
    cap::StrokeLineArea(canvas, cap::PaletteColor(palette + 4), 1.0F, frame.centerX, frame.Y(10.0F),
        frame.centerX, frame.Y(90.0F));
}

// 7. 颜色格式：同一份内存按 RGBA/BGRA 解释时通道顺序不同，画面呈现色偏。
void SceneColorFormat(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 4);
    const uint32_t side = 16;
    uint32_t pixels[side * side] = {0};
    FillCheckerPixels(pixels, side, side, cap::PaletteColor(palette), cap::PaletteColor(palette + 1));
    const OH_Drawing_ColorFormat formats[] = {COLOR_FORMAT_RGBA_8888, COLOR_FORMAT_BGRA_8888};
    for (int32_t index = 0; index < 2; ++index) {
        OH_Drawing_Bitmap *bitmap = CreateBitmapFromPixels(side, side, formats[index], ALPHA_FORMAT_PREMUL,
            pixels);
        if (bitmap == nullptr) {
            continue;
        }
        const float left = index == 0 ? frame.X(6.0F) : frame.X(52.0F);
        DrawBitmapIntoRect(canvas, bitmap, left, frame.Y(20.0F), left + frame.X(42.0F), frame.Y(80.0F));
        OH_Drawing_BitmapDestroy(bitmap);
    }
}

// 8. 行字节数：rowBytes 决定一行的内存跨度，用条纹数量体现不同格式下的差异。
void SceneRowBytes(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 5);
    const int32_t width = params.Int(1, 64, 8, MAX_BITMAP_SIDE);
    OH_Drawing_Bitmap *bitmap = CreateBitmap(static_cast<uint32_t>(width), ROW_BYTES_BITMAP_HEIGHT,
        COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_PREMUL);
    if (bitmap == nullptr) {
        return;
    }
    uint32_t rowBytes = 0;
    const OH_Drawing_ErrorCode result = OH_Drawing_BitmapGetRowBytes(bitmap, &rowBytes);
    if (result != OH_DRAWING_SUCCESS || rowBytes == 0) {
        DRAWING_LOGW("SceneRowBytes get row bytes failed, result=%{public}d", static_cast<int32_t>(result));
    }
    // 每 4 个像素画一条竖线，条纹总宽度即 rowBytes 对应的像素跨度。
    const int32_t stripeCount = static_cast<int32_t>(rowBytes / BYTES_PER_PIXEL / 4);
    for (int32_t index = 0; index < stripeCount; ++index) {
        const float left = frame.X(6.0F) + static_cast<float>(index) * frame.X(1.4F);
        cap::FillRectArea(canvas, cap::PaletteColor(palette + index % 3), left, frame.Y(30.0F),
            left + frame.X(0.7F), frame.Y(70.0F));
    }
    OH_Drawing_BitmapDestroy(bitmap);
}

// 9. 位图平铺：用小位图重复贴图实现九宫格之外的平铺效果，同时复用采样选项。
void SceneTileGrid(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const int32_t count = params.Int(1, 4, 1, TILE_GRID_COUNT);
    const uint32_t side = 8;
    uint32_t pixels[side * side] = {0};
    FillCheckerPixels(pixels, side, side, cap::PaletteColor(palette), cap::PaletteColor(palette + 2));
    OH_Drawing_Bitmap *bitmap = CreateBitmapFromPixels(side, side, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_PREMUL,
        pixels);
    if (bitmap == nullptr) {
        return;
    }
    const float left = frame.X(10.0F);
    const float top = frame.Y(15.0F);
    const float cellWidth = frame.X(80.0F) / static_cast<float>(count);
    const float cellHeight = frame.Y(70.0F) / static_cast<float>(count);
    for (int32_t row = 0; row < count; ++row) {
        for (int32_t column = 0; column < count; ++column) {
            const float cellLeft = left + cellWidth * static_cast<float>(column);
            const float cellTop = top + cellHeight * static_cast<float>(row);
            DrawBitmapIntoRect(canvas, bitmap, cellLeft + 1.0F, cellTop + 1.0F, cellLeft + cellWidth - 1.0F,
                cellTop + cellHeight - 1.0F);
        }
    }
    OH_Drawing_BitmapDestroy(bitmap);
}
} // namespace

void DrawBitmapScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t scene,
    const ParamBag &params)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawBitmapScene invalid canvas or size, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (scene < BITMAP_BUILD || scene >= BITMAP_SCENE_COUNT) {
        DRAWING_LOGE("DrawBitmapScene unsupported scene=%{public}d", scene);
        return;
    }
    const cap::Frame frame = cap::MakeFrame(width, height);
    switch (scene) {
        case BITMAP_BUILD:
            SceneBuild(canvas, frame, params);
            break;
        case BITMAP_DRAW:
            SceneDraw(canvas, frame, params);
            break;
        case BITMAP_RECT_SCALE:
            SceneRectScale(canvas, frame, params);
            break;
        case BITMAP_READ_PIXELS:
            SceneReadPixels(canvas, frame, params);
            break;
        case BITMAP_FROM_PIXELS:
            SceneFromPixels(canvas, frame, params);
            break;
        case BITMAP_IMAGE_INFO:
            SceneImageInfo(canvas, frame, params);
            break;
        case BITMAP_ALPHA_FORMAT:
            SceneAlphaFormat(canvas, frame, params);
            break;
        case BITMAP_COLOR_FORMAT:
            SceneColorFormat(canvas, frame, params);
            break;
        case BITMAP_ROW_BYTES:
            SceneRowBytes(canvas, frame, params);
            break;
        case BITMAP_TILE_GRID:
            SceneTileGrid(canvas, frame, params);
            break;
        default:
            break;
    }
    DRAWING_LOGI("DrawBitmapScene done, scene=%{public}d size=%{public}dx%{public}d", scene, width, height);
}
} // namespace ndr
