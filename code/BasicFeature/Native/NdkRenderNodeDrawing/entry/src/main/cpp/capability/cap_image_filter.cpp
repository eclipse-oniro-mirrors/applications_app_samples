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
#include "cap_image_filter.h"

#include <native_drawing/drawing_color_filter.h>
#include <native_drawing/drawing_filter.h>
#include <native_drawing/drawing_image_filter.h>
#include <native_drawing/drawing_lattice.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_shader_effect.h>

#include "common/log_common.h"
#include "capability/cap_util.h"
#include "capability/capability_type.h"

namespace ndr {
namespace {
constexpr float MAX_SIGMA = 40.0F;
constexpr int32_t TILE_MODE_COUNT = 4;
constexpr int32_t LATTICE_MAX_COUNT = 5;
// 平铺模式的选项下标，与参数面板下拉顺序一致。
constexpr int32_t TILE_MODE_OPTION_MIRROR = 2;
constexpr int32_t TILE_MODE_OPTION_DECAL = 3;
// 参数面板下标：模糊场景的第 2、3 位为纵向 sigma 与平铺模式。
constexpr int32_t PARAM_SIGMA_Y = 2;
constexpr int32_t PARAM_TILE_MODE = 3;
// 其余场景的第 2 位依次为裁剪比例、纵向偏移与透明度。
constexpr int32_t PARAM_CROP_PERCENT = 2;
constexpr int32_t PARAM_OFFSET_Y = 2;
constexpr int32_t PARAM_ALPHA = 2;

// 图像滤波器的模糊平铺模式，下标顺序与参数面板的下拉选项一致。
OH_Drawing_TileMode ToTileMode(int32_t index)
{
    switch (index) {
        case 1:
            return REPEAT;
        case TILE_MODE_OPTION_MIRROR:
            return MIRROR;
        case TILE_MODE_OPTION_DECAL:
            return DECAL;
        default:
            return CLAMP;
    }
}

// 一整套“带图像滤波器的画刷”，三个对象同生共死，避免场景分支里重复写释放逻辑。
struct FilterBrush {
    OH_Drawing_ImageFilter *imageFilter = nullptr;
    OH_Drawing_Filter *filter = nullptr;
    OH_Drawing_Brush *brush = nullptr;
};

bool PrepareFilterBrush(FilterBrush &bundle, OH_Drawing_ImageFilter *imageFilter, uint32_t color)
{
    if (imageFilter == nullptr) {
        return false;
    }
    bundle.imageFilter = imageFilter;
    bundle.filter = OH_Drawing_FilterCreate();
    bundle.brush = cap::NewBrush(color);
    if (bundle.filter == nullptr || bundle.brush == nullptr) {
        DRAWING_LOGE("PrepareFilterBrush create filter or brush failed");
        return false;
    }
    OH_Drawing_FilterSetImageFilter(bundle.filter, bundle.imageFilter);
    OH_Drawing_BrushSetFilter(bundle.brush, bundle.filter);
    return true;
}

void ReleaseFilterBrush(FilterBrush &bundle)
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
    if (bundle.imageFilter != nullptr) {
        OH_Drawing_ImageFilterDestroy(bundle.imageFilter);
        bundle.imageFilter = nullptr;
    }
}

// 统一的演示图形：一个矩形加一个圆，两者都会走同一支画刷的滤波器。
void DrawFilteredContent(OH_Drawing_Canvas *canvas, OH_Drawing_Brush *brush, float left, float top, float right,
    float bottom)
{
    if (brush == nullptr || right <= left || bottom <= top) {
        return;
    }
    OH_Drawing_Rect *rect = OH_Drawing_RectCreate(left, top, right, bottom);
    OH_Drawing_Point *center = OH_Drawing_PointCreate((left + right) * 0.5F, (top + bottom) * 0.5F);
    if (rect == nullptr || center == nullptr) {
        if (rect != nullptr) {
            OH_Drawing_RectDestroy(rect);
        }
        if (center != nullptr) {
            OH_Drawing_PointDestroy(center);
        }
        return;
    }
    OH_Drawing_CanvasAttachBrush(canvas, brush);
    OH_Drawing_CanvasDrawOval(canvas, rect);
    OH_Drawing_CanvasDrawCircle(canvas, center, (right - left) * 0.18F);
    OH_Drawing_CanvasDetachBrush(canvas);
    OH_Drawing_RectDestroy(rect);
    OH_Drawing_PointDestroy(center);
}

// 0. 高斯模糊：X/Y 方向可分别设置 sigma，平铺模式决定模糊结果在边缘的延伸方式。
void SceneBlur(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const float sigmaX = params.Range(1, 12.0F, 0.0F, MAX_SIGMA);
    const float sigmaY = params.Range(PARAM_SIGMA_Y, 12.0F, 0.0F, MAX_SIGMA);
    const OH_Drawing_TileMode tileMode = ToTileMode(params.Choice(PARAM_TILE_MODE, TILE_MODE_COUNT, 0));

    OH_Drawing_ImageFilter *imageFilter = OH_Drawing_ImageFilterCreateBlur(sigmaX, sigmaY, tileMode, nullptr);
    FilterBrush bundle;
    if (PrepareFilterBrush(bundle, imageFilter, cap::PaletteColor(palette))) {
        DrawFilteredContent(canvas, bundle.brush, frame.X(12.0F), frame.Y(18.0F), frame.X(88.0F), frame.Y(82.0F));
    }
    ReleaseFilterBrush(bundle);
}

// 1. 裁剪模糊：crop 矩形之外的模糊结果被丢弃，可用于限制发光范围。
void SceneBlurCrop(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    const float sigma = params.Range(1, 16.0F, 0.0F, MAX_SIGMA);
    const float cropPercent = params.Percent(PARAM_CROP_PERCENT, 0.6F);

    // 左侧为不限范围的模糊，右侧为同一图形叠加裁剪矩形后的模糊。
    OH_Drawing_ImageFilter *plainFilter = OH_Drawing_ImageFilterCreateBlur(sigma, sigma, CLAMP, nullptr);
    FilterBrush plainBundle;
    if (PrepareFilterBrush(plainBundle, plainFilter, cap::PaletteColor(palette))) {
        DrawFilteredContent(canvas, plainBundle.brush, frame.X(4.0F), frame.Y(20.0F), frame.X(44.0F),
            frame.Y(80.0F));
    }
    ReleaseFilterBrush(plainBundle);

    const float left = frame.X(56.0F);
    const float right = frame.X(96.0F);
    const float top = frame.Y(20.0F);
    const float bottom = frame.Y(80.0F);
    OH_Drawing_Rect *cropRect = OH_Drawing_RectCreate(left + (right - left) * (1.0F - cropPercent) * 0.5F,
        top + (bottom - top) * (1.0F - cropPercent) * 0.5F, right - (right - left) * (1.0F - cropPercent) * 0.5F,
        bottom - (bottom - top) * (1.0F - cropPercent) * 0.5F);
    OH_Drawing_ImageFilter *cropFilter = OH_Drawing_ImageFilterCreateBlurWithCrop(sigma, sigma, CLAMP, nullptr,
        cropRect);
    FilterBrush cropBundle;
    if (PrepareFilterBrush(cropBundle, cropFilter, cap::PaletteColor(palette + 1))) {
        DrawFilteredContent(canvas, cropBundle.brush, left, top, right, bottom);
    }
    ReleaseFilterBrush(cropBundle);
    if (cropRect != nullptr) {
        OH_Drawing_RectDestroy(cropRect);
    }
    // 用描边画出裁剪区域，让“裁剪范围”这一参数可见。
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette), 2.0F,
        left + (right - left) * (1.0F - cropPercent) * 0.5F, top + (bottom - top) * (1.0F - cropPercent) * 0.5F,
        right - (right - left) * (1.0F - cropPercent) * 0.5F, bottom - (bottom - top) * (1.0F - cropPercent) * 0.5F);
}

// 2. 偏移滤波器：内容在绘制时整体平移，可用于制作投影或重影。
void SceneOffset(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    const float offsetX = frame.Span(params.Range(1, 10.0F, -30.0F, 30.0F));
    const float offsetY = frame.Span(params.Range(PARAM_OFFSET_Y, 10.0F, -30.0F, 30.0F));

    OH_Drawing_ImageFilter *imageFilter = OH_Drawing_ImageFilterCreateOffset(offsetX, offsetY, nullptr);
    FilterBrush bundle;
    if (PrepareFilterBrush(bundle, imageFilter, cap::WithAlpha(cap::PaletteColor(palette), 0.7F))) {
        DrawFilteredContent(canvas, bundle.brush, frame.X(16.0F), frame.Y(22.0F), frame.X(72.0F), frame.Y(78.0F));
    }
    ReleaseFilterBrush(bundle);

    // 原始位置用描边标出，便于对比偏移前后的差别。
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette), 2.0F, frame.X(16.0F), frame.Y(22.0F), frame.X(72.0F),
        frame.Y(78.0F));
}

// 3. 颜色矩阵滤波器：把色相调整包装成图像滤波器，只作用于被绘制的图形。
void SceneColorMatrix(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 4);
    const int32_t mode = params.Choice(1, 2, 0);

    OH_Drawing_ColorFilter *colorFilter = mode == 0 ? OH_Drawing_ColorFilterCreateLuma() :
        OH_Drawing_ColorFilterCreateBlendMode(cap::PaletteColor(palette), BLEND_MODE_SCREEN);
    OH_Drawing_ImageFilter *imageFilter = OH_Drawing_ImageFilterCreateFromColorFilter(colorFilter, nullptr);
    FilterBrush bundle;
    if (PrepareFilterBrush(bundle, imageFilter, cap::PaletteColor(palette))) {
        DrawFilteredContent(canvas, bundle.brush, frame.X(6.0F), frame.Y(20.0F), frame.X(46.0F), frame.Y(80.0F));
    }
    ReleaseFilterBrush(bundle);

    // 右侧保留原色用于对比。
    OH_Drawing_Brush *plainBrush = cap::NewBrush(cap::PaletteColor(palette));
    DrawFilteredContent(canvas, plainBrush, frame.X(54.0F), frame.Y(20.0F), frame.X(94.0F), frame.Y(80.0F));
    if (plainBrush != nullptr) {
        OH_Drawing_BrushDestroy(plainBrush);
    }
    if (colorFilter != nullptr) {
        // CreateFromColorFilter 只是引用颜色滤波器，用完后由调用方释放。
        OH_Drawing_ColorFilterDestroy(colorFilter);
    }
}

// 4. 着色器滤波器：把渐变着色器包装成图像滤波器，图形按渐变上色。
void SceneShader(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 5);
    const float angle = params.Range(1, 45.0F, 0.0F, 360.0F);
    const float radians = angle * cap::PI / 180.0F;
    OH_Drawing_Point2D start;
    start.x = frame.centerX - std::cos(radians) * frame.shortSide * 0.4F;
    start.y = frame.centerY - std::sin(radians) * frame.shortSide * 0.4F;
    OH_Drawing_Point2D end;
    end.x = frame.centerX + std::cos(radians) * frame.shortSide * 0.4F;
    end.y = frame.centerY + std::sin(radians) * frame.shortSide * 0.4F;
    const uint32_t colors[] = {cap::PaletteColor(palette), cap::PaletteColor(palette + 1)};
    const float pos[] = {0.0F, 1.0F};
    OH_Drawing_ShaderEffect *shader =
        OH_Drawing_ShaderEffectCreateLinearGradientWithLocalMatrix(&start, &end, colors, pos, 2, CLAMP, nullptr);
    OH_Drawing_ImageFilter *imageFilter = OH_Drawing_ImageFilterCreateFromShaderEffect(shader);
    FilterBrush bundle;
    if (PrepareFilterBrush(bundle, imageFilter, cap::PaletteColor(palette + cap::SLOT_GREEN))) {
        DrawFilteredContent(canvas, bundle.brush, frame.X(10.0F), frame.Y(16.0F), frame.X(90.0F), frame.Y(84.0F));
    }
    ReleaseFilterBrush(bundle);
    if (shader != nullptr) {
        OH_Drawing_ShaderEffectDestroy(shader);
    }
}

// 5. 九宫格：当前版本只开放了 Lattice 的创建与销毁，绘制侧用等分矩形示意分区。
void SceneLattice(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const int32_t count = params.Int(1, 2, 1, LATTICE_MAX_COUNT);
    const float left = frame.X(10.0F);
    const float top = frame.Y(18.0F);
    const float right = frame.X(90.0F);
    const float bottom = frame.Y(82.0F);
    const float cellWidth = (right - left) / static_cast<float>(count + 1);
    const float cellHeight = (bottom - top) / static_cast<float>(count + 1);

    // 构造与实际绘制一致的等分线，验证 Lattice 对象的创建与释放。
    int xDivs[LATTICE_MAX_COUNT] = {0};
    int yDivs[LATTICE_MAX_COUNT] = {0};
    for (int32_t index = 0; index < count; ++index) {
        xDivs[index] = static_cast<int>(cellWidth * static_cast<float>(index + 1));
        yDivs[index] = static_cast<int>(cellHeight * static_cast<float>(index + 1));
    }
    OH_Drawing_Rect *bounds = OH_Drawing_RectCreate(left, top, right, bottom);
    OH_Drawing_Lattice *lattice = nullptr;
    const OH_Drawing_ErrorCode result = OH_Drawing_LatticeCreate(xDivs, yDivs, static_cast<uint32_t>(count),
        static_cast<uint32_t>(count), bounds, nullptr, 0, nullptr, 0, &lattice);
    if (result != OH_DRAWING_SUCCESS) {
        DRAWING_LOGW("SceneLattice create lattice failed, result=%{public}d", static_cast<int32_t>(result));
    }
    if (lattice != nullptr) {
        // 绘制接口尚未开放，这里只验证创建结果并立即释放，避免空实现被误认为漏调用。
        (void)OH_Drawing_LatticeDestroy(lattice);
    }
    if (bounds != nullptr) {
        OH_Drawing_RectDestroy(bounds);
    }

    // 用不同透明度区分四个角与边缘区域，直观体现九宫格的缩放区域划分。
    for (int32_t row = 0; row <= count; ++row) {
        for (int32_t column = 0; column <= count; ++column) {
            const float cellLeft = left + cellWidth * static_cast<float>(column);
            const float cellTop = top + cellHeight * static_cast<float>(row);
            const bool isEdge = row == 0 || row == count || column == 0 || column == count;
            const uint32_t color = cap::WithAlpha(cap::PaletteColor(palette + row + column), isEdge ? 0.9F : 0.35F);
            cap::FillRectArea(canvas, color, cellLeft + 1.0F, cellTop + 1.0F, cellLeft + cellWidth - 1.0F,
                cellTop + cellHeight - 1.0F);
        }
    }
}

// 6..8. 平铺模式对比：同一模糊在 CLAMP/REPEAT/MIRROR 下边缘表现不同。
void DrawTileModeDemo(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params,
    OH_Drawing_TileMode tileMode)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    const float sigma = params.Range(1, 14.0F, 0.0F, MAX_SIGMA);
    const float alpha = params.Percent(PARAM_ALPHA, 0.9F);
    OH_Drawing_ImageFilter *imageFilter = OH_Drawing_ImageFilterCreateBlur(sigma, sigma, tileMode, nullptr);
    FilterBrush bundle;
    if (PrepareFilterBrush(bundle, imageFilter, cap::WithAlpha(cap::PaletteColor(palette), alpha))) {
        DrawFilteredContent(canvas, bundle.brush, frame.X(14.0F), frame.Y(14.0F), frame.X(86.0F), frame.Y(86.0F));
    }
    ReleaseFilterBrush(bundle);
    // 参考边框：模糊超出边框的部分越多，说明平铺模式的外扩越明显。
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette), 1.0F, frame.X(14.0F), frame.Y(14.0F), frame.X(86.0F),
        frame.Y(86.0F));
}

// 9. 图层级图像滤波：整个图层先被绘制，再统一经过图像滤波器处理。
void SceneOnLayer(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 4);
    const float sigma = params.Range(1, 18.0F, 0.0F, MAX_SIGMA);
    const float alpha = params.Percent(PARAM_ALPHA, 0.95F);

    OH_Drawing_ImageFilter *imageFilter = OH_Drawing_ImageFilterCreateBlur(sigma, sigma, CLAMP, nullptr);
    FilterBrush bundle;
    if (!PrepareFilterBrush(bundle, imageFilter, cap::WithAlpha(cap::PaletteColor(palette), alpha))) {
        ReleaseFilterBrush(bundle);
        return;
    }
    OH_Drawing_Rect *layerRect = OH_Drawing_RectCreate(frame.X(4.0F), frame.Y(8.0F), frame.X(96.0F), frame.Y(92.0F));
    if (layerRect != nullptr) {
        OH_Drawing_CanvasSaveLayer(canvas, layerRect, bundle.brush);
        cap::FillRectArea(canvas, cap::PaletteColor(palette), frame.X(16.0F), frame.Y(30.0F), frame.X(50.0F),
            frame.Y(70.0F));
        cap::FillCircleArea(canvas, cap::PaletteColor(palette + 1), frame.X(68.0F), frame.Y(50.0F),
            frame.Span(16.0F));
        OH_Drawing_CanvasRestore(canvas);
        OH_Drawing_RectDestroy(layerRect);
    }
    ReleaseFilterBrush(bundle);
}
} // namespace

void DrawImageFilterScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t scene,
    const ParamBag &params)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawImageFilterScene invalid canvas or size, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (scene < IMAGE_FILTER_BLUR || scene >= IMAGE_FILTER_SCENE_COUNT) {
        DRAWING_LOGE("DrawImageFilterScene unsupported scene=%{public}d", scene);
        return;
    }
    const cap::Frame frame = cap::MakeFrame(width, height);
    switch (scene) {
        case IMAGE_FILTER_BLUR:
            SceneBlur(canvas, frame, params);
            break;
        case IMAGE_FILTER_BLUR_CROP:
            SceneBlurCrop(canvas, frame, params);
            break;
        case IMAGE_FILTER_OFFSET:
            SceneOffset(canvas, frame, params);
            break;
        case IMAGE_FILTER_COLOR_MATRIX:
            SceneColorMatrix(canvas, frame, params);
            break;
        case IMAGE_FILTER_SHADER:
            SceneShader(canvas, frame, params);
            break;
        case IMAGE_FILTER_LATTICE:
            SceneLattice(canvas, frame, params);
            break;
        case IMAGE_FILTER_TILE_CLAMP:
            DrawTileModeDemo(canvas, frame, params, CLAMP);
            break;
        case IMAGE_FILTER_TILE_REPEAT:
            DrawTileModeDemo(canvas, frame, params, REPEAT);
            break;
        case IMAGE_FILTER_TILE_MIRROR:
            DrawTileModeDemo(canvas, frame, params, MIRROR);
            break;
        case IMAGE_FILTER_ON_LAYER:
            SceneOnLayer(canvas, frame, params);
            break;
        default:
            break;
    }
    DRAWING_LOGI("DrawImageFilterScene done, scene=%{public}d size=%{public}dx%{public}d", scene, width, height);
}
} // namespace ndr
