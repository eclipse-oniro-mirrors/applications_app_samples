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
#include "cap_pixelmap.h"

#include <multimedia/image_framework/image_pixel_map_mdk.h>
#include <native_drawing/drawing_path.h>
#include <native_drawing/drawing_pixel_map.h>
#include <native_drawing/drawing_point.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_round_rect.h>
#include <native_drawing/drawing_sampling_options.h>

#include "common/log_common.h"
#include "capability/cap_util.h"
#include "capability/capability_type.h"

namespace ndr {
namespace {
constexpr int32_t MESH_COLUMNS = 3;
constexpr int32_t MESH_ROWS = 3;
constexpr int32_t MAX_TILE_COUNT = 6;
// 参数面板下标：第 2 位在各像素图场景分别为采样模式与目标矩形约束。
constexpr int32_t PARAM_FILTER_MODE = 2;
constexpr int32_t PARAM_CONSTRAINT = 2;

// 可绘制的源图：除句柄外带上原图像素尺寸，源矩形一律在源图坐标系构建。
struct PixelSource {
    OH_Drawing_PixelMap *pixelMap = nullptr;
    float width = 0.0F;
    float height = 0.0F;
};

// 从 bridge 传入的原生 PixelMap 句柄获取可绘制对象与原始尺寸；失败返回 false，由上层走降级示意。
bool AcquirePixelMap(void *nativePixelMap, PixelSource &source)
{
    if (nativePixelMap == nullptr) {
        return false;
    }
    NativePixelMap_ *nativeMap = reinterpret_cast<NativePixelMap_ *>(nativePixelMap);
    OhosPixelMapInfos info = {};
    // 已释放的 PixelMap 仍能取到句柄，只有读取图像信息才能识别出位图已不可用。
    const int32_t result = OH_PixelMap_GetImageInfo(nativeMap, &info);
    if (result != 0 || info.width == 0 || info.height == 0) {
        DRAWING_LOGW("AcquirePixelMap image info unavailable, result=%{public}d width=%{public}u height=%{public}u",
            result, info.width, info.height);
        return false;
    }
    OH_Drawing_PixelMap *pixelMap = OH_Drawing_PixelMapGetFromNativePixelMap(nativeMap);
    if (pixelMap == nullptr) {
        DRAWING_LOGW("AcquirePixelMap get drawing pixel map failed");
        return false;
    }
    source.pixelMap = pixelMap;
    source.width = static_cast<float>(info.width);
    source.height = static_cast<float>(info.height);
    return true;
}

// 采样选项按需创建，统一用线性/最近邻两种过滤方式。
OH_Drawing_SamplingOptions *NewSampling(OH_Drawing_FilterMode filterMode)
{
    return OH_Drawing_SamplingOptionsCreate(filterMode, MIPMAP_MODE_NONE);
}

// 没有 PixelMap 时的占位示意：画一个带斜线的圆角框，并标出“缺少图片”的视觉暗示。
void DrawFallbackSchematic(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const float left = frame.X(12.0F);
    const float top = frame.Y(20.0F);
    const float right = frame.X(88.0F);
    const float bottom = frame.Y(80.0F);
    cap::FillRoundRectArea(canvas, cap::WithAlpha(cap::PaletteColor(palette), 0.25F), left, top, right, bottom,
        frame.Span(6.0F));
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette), 2.0F, left, top, right, bottom);
    cap::StrokeLineArea(canvas, cap::PaletteColor(palette), 2.0F, left, top, right, bottom);
    cap::StrokeLineArea(canvas, cap::PaletteColor(palette), 2.0F, left, bottom, right, top);
    cap::FillCircleArea(canvas, cap::PaletteColor(palette + 1), frame.X(30.0F), frame.Y(32.0F),
        frame.Span(4.0F));
}

// 把 PixelMap 的某个源区域画到目标区域，采样方式由调用方指定。
bool DrawSourceRect(OH_Drawing_Canvas *canvas, OH_Drawing_PixelMap *pixelMap, const OH_Drawing_Rect *src,
    const OH_Drawing_Rect *dst, OH_Drawing_FilterMode filterMode)
{
    if (canvas == nullptr || pixelMap == nullptr || dst == nullptr) {
        return false;
    }
    OH_Drawing_SamplingOptions *sampling = NewSampling(filterMode);
    if (sampling == nullptr) {
        return false;
    }
    OH_Drawing_CanvasDrawPixelMapRect(canvas, pixelMap, src, dst, sampling);
    OH_Drawing_SamplingOptionsDestroy(sampling);
    return true;
}

// 以画布中心为基准构造目标矩形，sidePercent 为短边占比。
void MakeCenteredRect(const cap::Frame &frame, float sidePercent, float widthPercent, float heightPercent,
    OH_Drawing_Rect *&rect)
{
    const float halfWidth = frame.Span(widthPercent) * sidePercent * 0.5F;
    const float halfHeight = frame.Span(heightPercent) * sidePercent * 0.5F;
    rect = OH_Drawing_RectCreate(frame.centerX - halfWidth, frame.centerY - halfHeight,
        frame.centerX + halfWidth, frame.centerY + halfHeight);
}

// 0. 整幅绘制：把 PixelMap 整体贴到画布中心区域，采样方式可切换。
void SceneDrawRect(OH_Drawing_Canvas *canvas, OH_Drawing_PixelMap *pixelMap, const cap::Frame &frame,
    const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const float side = params.Percent(1, 0.7F);
    const OH_Drawing_FilterMode filterMode = params.Choice(PARAM_FILTER_MODE, 2, 1) == 0 ? FILTER_MODE_NEAREST :
        FILTER_MODE_LINEAR;
    OH_Drawing_Rect *dst = nullptr;
    MakeCenteredRect(frame, 0.6F + side, 90.0F, 90.0F, dst);
    if (dst != nullptr) {
        DrawSourceRect(canvas, pixelMap, nullptr, dst, filterMode);
        // 描出目标矩形，同时让调色板参数有可见反馈。
        cap::StrokeRectArea(canvas, cap::PaletteColor(palette), 1.0F, OH_Drawing_RectGetLeft(dst),
            OH_Drawing_RectGetTop(dst), OH_Drawing_RectGetRight(dst), OH_Drawing_RectGetBottom(dst));
        OH_Drawing_RectDestroy(dst);
    }
}

// 1..2. 采样对比：放大倍数固定，只改变过滤方式，最近邻保留硬边、线性插值更平滑。
void SceneSampling(OH_Drawing_Canvas *canvas, OH_Drawing_PixelMap *pixelMap, const cap::Frame &frame,
    const ParamBag &params, OH_Drawing_FilterMode filterMode)
{
    const float zoom = params.Percent(1, 0.8F) * 2.0F + 1.0F;
    OH_Drawing_Rect *dst = nullptr;
    MakeCenteredRect(frame, zoom * 0.3F, 80.0F, 80.0F, dst);
    if (dst == nullptr) {
        return;
    }
    DrawSourceRect(canvas, pixelMap, nullptr, dst, filterMode);
    // 用细网格标出目标区域，放大后网格间距即缩放倍数。
    cap::StrokeRectArea(canvas, cap::PaletteColor(params.Choice(0, cap::PALETTE_COUNT, 2)), 1.0F,
        OH_Drawing_RectGetLeft(dst), OH_Drawing_RectGetTop(dst), OH_Drawing_RectGetRight(dst),
        OH_Drawing_RectGetBottom(dst));
    OH_Drawing_RectDestroy(dst);
}

// 3. 源矩形约束：只取源图中间区域，STRICT/FAST 决定是否允许采样越界。
void SceneSrcConstraint(OH_Drawing_Canvas *canvas, OH_Drawing_PixelMap *pixelMap, const cap::Frame &frame,
    const ParamBag &params, float srcWidth, float srcHeight)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    const float srcPercent = params.Percent(1, 0.5F);
    const int32_t constraintIndex = params.Choice(PARAM_CONSTRAINT, 2, 0);
    OH_Drawing_Rect *dst = nullptr;
    MakeCenteredRect(frame, 0.9F, 70.0F, 70.0F, dst);
    if (dst == nullptr) {
        return;
    }
    // 源矩形位于源图像素坐标系，必须用源图尺寸换算；用目标矩形尺寸会让裁剪比例失真。
    OH_Drawing_Rect *src = OH_Drawing_RectCreate(srcWidth * (1.0F - srcPercent) * 0.5F,
        srcHeight * (1.0F - srcPercent) * 0.5F, srcWidth * (1.0F + srcPercent) * 0.5F,
        srcHeight * (1.0F + srcPercent) * 0.5F);
    OH_Drawing_SamplingOptions *sampling = NewSampling(FILTER_MODE_LINEAR);
    if (src != nullptr && sampling != nullptr) {
        const OH_Drawing_SrcRectConstraint constraint = constraintIndex == 0 ? STRICT_SRC_RECT_CONSTRAINT :
            FAST_SRC_RECT_CONSTRAINT;
        const OH_Drawing_ErrorCode result = OH_Drawing_CanvasDrawPixelMapRectConstraint(canvas, pixelMap, src, dst,
            sampling, constraint);
        if (result != OH_DRAWING_SUCCESS) {
            DRAWING_LOGW("SceneSrcConstraint draw failed, result=%{public}d", static_cast<int32_t>(result));
        }
    }
    if (sampling != nullptr) {
        OH_Drawing_SamplingOptionsDestroy(sampling);
    }
    if (src != nullptr) {
        OH_Drawing_RectDestroy(src);
    }
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette), 1.0F, OH_Drawing_RectGetLeft(dst),
        OH_Drawing_RectGetTop(dst), OH_Drawing_RectGetRight(dst), OH_Drawing_RectGetBottom(dst));
    OH_Drawing_RectDestroy(dst);
}

// 4. 九宫格缩放：中心矩形按参数放大，四角保持原始像素密度。
void SceneNinePatch(OH_Drawing_Canvas *canvas, OH_Drawing_PixelMap *pixelMap, const cap::Frame &frame,
    const ParamBag &params, float srcWidth, float srcHeight)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 4);
    const float centerPercent = params.Percent(1, 0.3F);
    const OH_Drawing_FilterMode filterMode = params.Choice(PARAM_FILTER_MODE, 2, 0) == 0 ? FILTER_MODE_NEAREST :
        FILTER_MODE_LINEAR;
    OH_Drawing_Rect *dst = nullptr;
    MakeCenteredRect(frame, 0.95F, 90.0F, 80.0F, dst);
    if (dst == nullptr) {
        return;
    }
    // 中心矩形是切分源图的那块区域，同样按源图像素尺寸换算。
    const float centerWidth = srcWidth * centerPercent;
    const float centerHeight = srcHeight * centerPercent;
    OH_Drawing_Rect *center = OH_Drawing_RectCreate((srcWidth - centerWidth) * 0.5F,
        (srcHeight - centerHeight) * 0.5F, (srcWidth + centerWidth) * 0.5F, (srcHeight + centerHeight) * 0.5F);
    if (center != nullptr) {
        const OH_Drawing_ErrorCode result = OH_Drawing_CanvasDrawPixelMapNine(canvas, pixelMap, center, dst,
            filterMode);
        if (result != OH_DRAWING_SUCCESS) {
            DRAWING_LOGW("SceneNinePatch draw failed, result=%{public}d", static_cast<int32_t>(result));
        }
        OH_Drawing_RectDestroy(center);
    }
    // 标出中心区域在画布上的投影位置，便于理解九宫格的分割方式。
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette), 2.0F,
        frame.centerX - OH_Drawing_RectGetWidth(dst) * centerPercent * 0.5F,
        frame.centerY - OH_Drawing_RectGetHeight(dst) * centerPercent * 0.5F,
        frame.centerX + OH_Drawing_RectGetWidth(dst) * centerPercent * 0.5F,
        frame.centerY + OH_Drawing_RectGetHeight(dst) * centerPercent * 0.5F);
    OH_Drawing_RectDestroy(dst);
}

// 5. 网格变形：按 3x3 网格给出顶点坐标，顶点偏移形成波浪。
void SceneMesh(OH_Drawing_Canvas *canvas, OH_Drawing_PixelMap *pixelMap, const cap::Frame &frame,
    const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 5);
    const float amplitude = frame.Span(params.Range(1, 8.0F, 0.0F, 20.0F));
    const float width = frame.Span(80.0F);
    const float height = frame.Span(60.0F);
    const float originX = frame.centerX - width * 0.5F;
    const float originY = frame.centerY - height * 0.5F;
    constexpr int32_t vertexCount = (MESH_COLUMNS + 1) * (MESH_ROWS + 1);
    float vertices[vertexCount * 2] = {0.0F};
    for (int32_t row = 0; row <= MESH_ROWS; ++row) {
        for (int32_t column = 0; column <= MESH_COLUMNS; ++column) {
            const int32_t index = row * (MESH_COLUMNS + 1) + column;
            const float ratioX = static_cast<float>(column) / static_cast<float>(MESH_COLUMNS);
            const float ratioY = static_cast<float>(row) / static_cast<float>(MESH_ROWS);
            vertices[index * 2] = originX + width * ratioX;
            // 中间一行整体上抬，形成一条正弦波形状，直观体现顶点可控。
            vertices[index * 2 + 1] = originY + height * ratioY - amplitude * (ratioY > 0.3F && ratioY < 0.7F ?
                1.0F : 0.0F);
        }
    }
    const OH_Drawing_ErrorCode result = OH_Drawing_CanvasDrawPixelMapMesh(canvas, pixelMap,
        static_cast<uint32_t>(MESH_COLUMNS), static_cast<uint32_t>(MESH_ROWS), vertices,
        static_cast<uint32_t>(vertexCount * 2), 0, nullptr, 0, 0);
    if (result != OH_DRAWING_SUCCESS) {
        DRAWING_LOGW("SceneMesh draw failed, result=%{public}d", static_cast<int32_t>(result));
    }
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette), 1.0F, originX, originY, originX + width,
        originY + height);
}

// 6. 旋转绘制：先用 CanvasRotate 变换坐标系，再按原矩形贴图。
void SceneRotate(OH_Drawing_Canvas *canvas, OH_Drawing_PixelMap *pixelMap, const cap::Frame &frame,
    const ParamBag &params)
{
    const float angle = params.Range(0, 15.0F, -180.0F, 180.0F);
    OH_Drawing_Rect *dst = nullptr;
    MakeCenteredRect(frame, 0.8F, 70.0F, 70.0F, dst);
    if (dst == nullptr) {
        return;
    }
    OH_Drawing_CanvasSave(canvas);
    OH_Drawing_CanvasRotate(canvas, angle, frame.centerX, frame.centerY);
    DrawSourceRect(canvas, pixelMap, nullptr, dst, FILTER_MODE_LINEAR);
    OH_Drawing_CanvasRestore(canvas);
    OH_Drawing_RectDestroy(dst);
}

// 7. 平铺：把同一张 PixelMap 按网格重复绘制，次数由参数控制。
void SceneTile(OH_Drawing_Canvas *canvas, OH_Drawing_PixelMap *pixelMap, const cap::Frame &frame,
    const ParamBag &params)
{
    const int32_t count = params.Int(0, 3, 1, MAX_TILE_COUNT);
    const float totalWidth = frame.X(84.0F);
    const float totalHeight = frame.Y(70.0F);
    const float left = frame.centerX - totalWidth * 0.5F;
    const float top = frame.centerY - totalHeight * 0.5F;
    const float cellWidth = totalWidth / static_cast<float>(count);
    const float cellHeight = totalHeight / static_cast<float>(count);
    for (int32_t row = 0; row < count; ++row) {
        for (int32_t column = 0; column < count; ++column) {
            OH_Drawing_Rect *dst = OH_Drawing_RectCreate(left + cellWidth * static_cast<float>(column),
                top + cellHeight * static_cast<float>(row), left + cellWidth * static_cast<float>(column + 1),
                top + cellHeight * static_cast<float>(row + 1));
            if (dst != nullptr) {
                DrawSourceRect(canvas, pixelMap, nullptr, dst, FILTER_MODE_LINEAR);
                OH_Drawing_RectDestroy(dst);
            }
        }
    }
}

// 8. 整体透明度：通过 SaveLayer 的画笔 alpha 控制 PixelMap 的整体透明。
void SceneAlpha(OH_Drawing_Canvas *canvas, OH_Drawing_PixelMap *pixelMap, const cap::Frame &frame,
    const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    const float alpha = params.Percent(1, 0.5F);
    OH_Drawing_Rect *dst = nullptr;
    MakeCenteredRect(frame, 0.8F, 80.0F, 80.0F, dst);
    if (dst == nullptr) {
        return;
    }
    OH_Drawing_Brush *layerBrush = cap::NewBrush(cap::WithAlpha(cap::PaletteColor(palette), alpha));
    if (layerBrush != nullptr) {
        OH_Drawing_CanvasSaveLayer(canvas, dst, layerBrush);
        DrawSourceRect(canvas, pixelMap, nullptr, dst, FILTER_MODE_LINEAR);
        OH_Drawing_CanvasRestore(canvas);
        OH_Drawing_BrushDestroy(layerBrush);
    }
    OH_Drawing_RectDestroy(dst);
}

// 9. 缩放：目标矩形随参数变化，用于观察连续缩放时的采样表现。
void SceneScale(OH_Drawing_Canvas *canvas, OH_Drawing_PixelMap *pixelMap, const cap::Frame &frame,
    const ParamBag &params)
{
    const float scale = params.Percent(0, 0.6F);
    const float side = frame.Span(30.0F) + frame.Span(60.0F) * scale;
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(frame.centerX - side * 0.5F, frame.centerY - side * 0.5F,
        frame.centerX + side * 0.5F, frame.centerY + side * 0.5F);
    if (dst != nullptr) {
        DrawSourceRect(canvas, pixelMap, nullptr, dst, FILTER_MODE_LINEAR);
        OH_Drawing_RectDestroy(dst);
    }
}

// 10. 裁剪：先裁成圆角区域再贴图，超出部分被裁掉。
void SceneClip(OH_Drawing_Canvas *canvas, OH_Drawing_PixelMap *pixelMap, const cap::Frame &frame,
    const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 4);
    const float radius = frame.Span(params.Range(1, 12.0F, 0.0F, 40.0F));
    OH_Drawing_Rect *dst = nullptr;
    MakeCenteredRect(frame, 0.9F, 90.0F, 90.0F, dst);
    if (dst == nullptr) {
        return;
    }
    OH_Drawing_RoundRect *roundRect = OH_Drawing_RoundRectCreate(dst, radius, radius);
    if (roundRect != nullptr) {
        OH_Drawing_CanvasSave(canvas);
        OH_Drawing_CanvasClipRoundRect(canvas, roundRect, INTERSECT, true);
        DrawSourceRect(canvas, pixelMap, nullptr, dst, FILTER_MODE_LINEAR);
        OH_Drawing_CanvasRestore(canvas);
        OH_Drawing_RoundRectDestroy(roundRect);
    }
    // 描出裁剪框，圆角半径的变化才看得见。
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette), 1.0F, OH_Drawing_RectGetLeft(dst),
        OH_Drawing_RectGetTop(dst), OH_Drawing_RectGetRight(dst), OH_Drawing_RectGetBottom(dst));
    OH_Drawing_RectDestroy(dst);
}

// 按场景编号分派：参数校验、PixelMap 获取与释放由对外入口负责，这里只做具体场景转发。
void DrawPixelMapKind(OH_Drawing_Canvas *canvas, OH_Drawing_PixelMap *pixelMap, const cap::Frame &frame,
    const ParamBag &params, const PixelSource &source, int32_t scene)
{
    switch (scene) {
        case PIXELMAP_DRAW_RECT:
            SceneDrawRect(canvas, pixelMap, frame, params);
            break;
        case PIXELMAP_SAMPLING_NEAREST:
            SceneSampling(canvas, pixelMap, frame, params, FILTER_MODE_NEAREST);
            break;
        case PIXELMAP_SAMPLING_LINEAR:
            SceneSampling(canvas, pixelMap, frame, params, FILTER_MODE_LINEAR);
            break;
        case PIXELMAP_SRC_CONSTRAINT:
            SceneSrcConstraint(canvas, pixelMap, frame, params, source.width, source.height);
            break;
        case PIXELMAP_NINE_PATCH:
            SceneNinePatch(canvas, pixelMap, frame, params, source.width, source.height);
            break;
        case PIXELMAP_MESH:
            SceneMesh(canvas, pixelMap, frame, params);
            break;
        case PIXELMAP_ROTATE:
            SceneRotate(canvas, pixelMap, frame, params);
            break;
        case PIXELMAP_TILE:
            SceneTile(canvas, pixelMap, frame, params);
            break;
        case PIXELMAP_ALPHA:
            SceneAlpha(canvas, pixelMap, frame, params);
            break;
        case PIXELMAP_SCALE:
            SceneScale(canvas, pixelMap, frame, params);
            break;
        case PIXELMAP_CLIP:
            SceneClip(canvas, pixelMap, frame, params);
            break;
        case PIXELMAP_FALLBACK:
            // 该场景固定演示降级形态，与缺少 PixelMap 时的表现保持一致。
            DrawFallbackSchematic(canvas, frame, params);
            break;
        default:
            break;
    }
}
} // namespace

void DrawPixelMapScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t scene,
    const ParamBag &params, void *nativePixelMap)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawPixelMapScene invalid canvas or size, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (scene < PIXELMAP_DRAW_RECT || scene >= PIXELMAP_SCENE_COUNT) {
        DRAWING_LOGE("DrawPixelMapScene unsupported scene=%{public}d", scene);
        return;
    }
    const cap::Frame frame = cap::MakeFrame(width, height);
    PixelSource source;
    if (!AcquirePixelMap(nativePixelMap, source)) {
        // 没有 PixelMap 时不阻断页面渲染，统一画示意图提示需要从 ArkTS 侧传入图片。
        DrawFallbackSchematic(canvas, frame, params);
        DRAWING_LOGW("DrawPixelMapScene fallback to schematic, scene=%{public}d", scene);
        return;
    }
    OH_Drawing_PixelMap *pixelMap = source.pixelMap;
    DrawPixelMapKind(canvas, pixelMap, frame, params, source, scene);
    OH_Drawing_PixelMapDissolve(pixelMap);
    DRAWING_LOGI("DrawPixelMapScene done, scene=%{public}d size=%{public}dx%{public}d", scene, width, height);
}
} // namespace ndr
