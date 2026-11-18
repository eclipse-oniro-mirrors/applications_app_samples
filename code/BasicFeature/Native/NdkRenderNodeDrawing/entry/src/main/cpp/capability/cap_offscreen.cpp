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
#include "cap_offscreen.h"

#include <native_drawing/drawing_bitmap.h>
#include <native_drawing/drawing_gpu_context.h>
#include <native_drawing/drawing_rect.h>
#include <native_drawing/drawing_sampling_options.h>
#include <native_drawing/drawing_surface.h>

#include "common/log_common.h"
#include "capability/cap_util.h"
#include "capability/capability_type.h"

namespace ndr {
namespace {
constexpr int32_t STATUS_STEP_COUNT = 3;
constexpr int32_t MAX_FLUSH_COUNT = 5;
constexpr int32_t FALLBACK_SIDE = 96;
// 表面内容不会直接出现在渲染节点画布上，场景统一用示意图与状态点表达执行结果。
constexpr float STATUS_DOT_RADIUS = 4.0F;

struct OffscreenUnit {
    OH_Drawing_Surface *layer = nullptr;
    // 表面画布由表面持有，只做引用，不单独销毁。
    OH_Drawing_Canvas *canvas = nullptr;
};

// GPU 上下文创建代价高，进程内复用一份；表面仍按场景正常创建与销毁。
OH_Drawing_GpuContext *SharedGpuContext()
{
    static OH_Drawing_GpuContext *context = OH_Drawing_GpuContextCreate();
    return context;
}

void CloseOffscreen(OffscreenUnit &unit)
{
    if (unit.layer != nullptr) {
        // 表面必须在对应的 GPU 上下文之前销毁。
        OH_Drawing_SurfaceDestroy(unit.layer);
        unit.layer = nullptr;
        unit.canvas = nullptr;
    }
}

// 创建离屏 GPU 表面；应用进程内 GPU 上下文可能不可用，此时返回 false 由场景降级。
bool OpenOffscreen(OffscreenUnit &unit, int32_t width, int32_t height)
{
    if (width <= 0 || height <= 0) {
        DRAWING_LOGW("OpenOffscreen invalid size, width=%{public}d height=%{public}d", width, height);
        return false;
    }
    OH_Drawing_GpuContext *gpu = SharedGpuContext();
    if (gpu == nullptr) {
        DRAWING_LOGW("OpenOffscreen gpu context unavailable, scene falls back to schematic");
        return false;
    }
    OH_Drawing_Image_Info info;
    info.width = width;
    info.height = height;
    info.colorType = COLOR_FORMAT_RGBA_8888;
    info.alphaType = ALPHA_FORMAT_PREMUL;
    // 第二个参数为 false 表示不绑定窗口，生成离屏表面。
    unit.layer = OH_Drawing_SurfaceCreateFromGpuContext(gpu, false, info);
    if (unit.layer == nullptr) {
        DRAWING_LOGW("Create offscreen layer failed, size=%{public}dx%{public}d", width, height);
        CloseOffscreen(unit);
        return false;
    }
    unit.canvas = OH_Drawing_SurfaceGetCanvas(unit.layer);
    if (unit.canvas == nullptr) {
        DRAWING_LOGW("OpenOffscreen get canvas failed");
        CloseOffscreen(unit);
        return false;
    }
    return true;
}

// 在表面画布上绘制示例内容，验证表面画布可以像普通画布一样接收绘制命令。
void PaintOffscreenContent(OH_Drawing_Canvas *offscreenCanvas, int32_t width, int32_t height, int32_t palette)
{
    if (offscreenCanvas == nullptr || width <= 0 || height <= 0) {
        return;
    }
    const cap::Frame inner = cap::MakeFrame(width, height);
    cap::FillRectArea(offscreenCanvas, cap::PaletteColor(palette), inner.X(10.0F), inner.Y(10.0F), inner.X(60.0F),
        inner.Y(50.0F));
    cap::FillCircleArea(offscreenCanvas, cap::PaletteColor(palette + 2), inner.centerX, inner.centerY,
        inner.Span(18.0F));
}

// 一列状态点：绿色表示该步骤成功，红色表示失败，数量对应创建、绘制、刷新三个阶段。
void DrawStatusColumn(OH_Drawing_Canvas *canvas, const cap::Frame &frame, int32_t okCount)
{
    for (int32_t index = 0; index < STATUS_STEP_COUNT; ++index) {
        const float cy = frame.Y(8.0F) + frame.Y(7.0F) * static_cast<float>(index);
        const bool ok = index < okCount;
        cap::FillCircleArea(canvas, ok ? cap::PaletteColor(2) : cap::PaletteColor(3), frame.X(94.0F), cy,
            STATUS_DOT_RADIUS);
    }
}

// 表面示意图：外框代表渲染目标，内框代表离屏表面，内框大小随尺寸比例变化。
void DrawOffscreenSchematic(OH_Drawing_Canvas *canvas, const cap::Frame &frame, int32_t palette, float ratio)
{
    const float left = frame.X(8.0F);
    const float top = frame.Y(12.0F);
    const float right = frame.X(86.0F);
    const float bottom = frame.Y(88.0F);
    cap::StrokeRectArea(canvas, cap::WithAlpha(cap::PaletteColor(palette + 4), 0.6F), 1.0F, left, top, right, bottom);
    const float offscreenWidth = (right - left) * cap::ClampFloat(ratio, 0.05F, 1.0F);
    const float offscreenHeight = (bottom - top) * cap::ClampFloat(ratio, 0.05F, 1.0F);
    const float offscreenLeft = left + (right - left - offscreenWidth) * 0.5F;
    const float offscreenTop = top + (bottom - top - offscreenHeight) * 0.5F;
    cap::FillRectArea(canvas, cap::WithAlpha(cap::PaletteColor(palette), 0.25F), offscreenLeft, offscreenTop,
        offscreenLeft + offscreenWidth, offscreenTop + offscreenHeight);
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette + 1), 2.0F, offscreenLeft, offscreenTop,
        offscreenLeft + offscreenWidth, offscreenTop + offscreenHeight);
    cap::FillCircleArea(canvas, cap::PaletteColor(palette + 2),
        offscreenLeft + offscreenWidth * 0.5F, offscreenTop + offscreenHeight * 0.5F, frame.Span(6.0F));
}

// 0. 表面创建：创建 GPU 上下文与离屏表面，读取画布并绘制内容，最后销毁。
void SceneCreate(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const int32_t width = static_cast<int32_t>(frame.width);
    const int32_t height = static_cast<int32_t>(frame.height);
    OffscreenUnit unit;
    int32_t okCount = 0;
    if (OpenOffscreen(unit, width, height)) {
        okCount = 1;
        PaintOffscreenContent(unit.canvas, width, height, palette);
        okCount = 2;
        if (OH_Drawing_SurfaceFlush(unit.layer) == OH_DRAWING_SUCCESS) {
            okCount = STATUS_STEP_COUNT;
        }
    }
    DrawOffscreenSchematic(canvas, frame, palette, 1.0F);
    DrawStatusColumn(canvas, frame, okCount);
    CloseOffscreen(unit);
}

// 1. 表面尺寸：按参数比例创建表面，示意图内框大小与实际尺寸比例一致。
void SceneSize(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    const float ratio = params.Range(1, 0.6F, 0.2F, 1.0F);
    const int32_t width = static_cast<int32_t>(frame.width * ratio);
    const int32_t height = static_cast<int32_t>(frame.height * ratio);
    OffscreenUnit unit;
    int32_t okCount = 0;
    if (OpenOffscreen(unit, width, height)) {
        PaintOffscreenContent(unit.canvas, width, height, palette);
        okCount = 2;
        if (OH_Drawing_SurfaceFlush(unit.layer) == OH_DRAWING_SUCCESS) {
            okCount = STATUS_STEP_COUNT;
        }
    }
    DrawOffscreenSchematic(canvas, frame, palette, ratio);
    DrawStatusColumn(canvas, frame, okCount);
    CloseOffscreen(unit);
}

// 2. 降级路径：GPU 表面不可用时改用位图加离屏画布，绘制结果可以贴回主画布显示。
void SceneFallback(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 3);
    const float side = frame.Span(params.Range(1, 50.0F, 20.0F, 90.0F));
    OH_Drawing_Bitmap *bitmap = OH_Drawing_BitmapCreate();
    if (bitmap == nullptr) {
        DRAWING_LOGE("SceneFallback create bitmap failed");
        return;
    }
    OH_Drawing_BitmapFormat format;
    format.colorFormat = COLOR_FORMAT_RGBA_8888;
    format.alphaFormat = ALPHA_FORMAT_PREMUL;
    OH_Drawing_BitmapBuild(bitmap, static_cast<uint32_t>(side), static_cast<uint32_t>(side), &format);
    OH_Drawing_Canvas *offscreen = OH_Drawing_CanvasCreate();
    if (offscreen != nullptr) {
        // 位图绑定到普通画布后即可离屏绘制，是无 GPU 环境下的等价方案。
        OH_Drawing_CanvasBind(offscreen, bitmap);
        PaintOffscreenContent(offscreen, static_cast<int32_t>(side), static_cast<int32_t>(side), palette);
        OH_Drawing_CanvasDestroy(offscreen);
    }
    const float left = frame.centerX - side * 0.5F;
    const float top = frame.centerY - side * 0.5F;
    OH_Drawing_Rect *dst = OH_Drawing_RectCreate(left, top, left + side, top + side);
    OH_Drawing_SamplingOptions *sampling = OH_Drawing_SamplingOptionsCreate(FILTER_MODE_LINEAR, MIPMAP_MODE_NONE);
    if (dst != nullptr && sampling != nullptr) {
        OH_Drawing_CanvasDrawBitmapRect(canvas, bitmap, nullptr, dst, sampling);
    }
    if (sampling != nullptr) {
        OH_Drawing_SamplingOptionsDestroy(sampling);
    }
    if (dst != nullptr) {
        OH_Drawing_RectDestroy(dst);
    }
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette + 1), 2.0F, left, top, left + side, top + side);
    // 降级路径始终可用，状态点按要求全部点亮。
    DrawStatusColumn(canvas, frame, STATUS_STEP_COUNT);
    OH_Drawing_BitmapDestroy(bitmap);
}

// 3. 表面刷新：多次绘制并刷新，条数由参数控制，用于观察 Flush 的调用节奏。
void SceneFlush(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 4);
    const int32_t flushCount = params.Int(1, 3, 1, MAX_FLUSH_COUNT);
    OffscreenUnit unit;
    int32_t successCount = 0;
    if (OpenOffscreen(unit, static_cast<int32_t>(frame.width), static_cast<int32_t>(frame.height))) {
        for (int32_t index = 0; index < flushCount; ++index) {
            cap::FillCircleArea(unit.canvas, cap::WithAlpha(cap::PaletteColor(palette + index), 0.6F),
                frame.X(20.0F + 12.0F * static_cast<float>(index)), frame.centerY, frame.Span(5.0F));
            if (OH_Drawing_SurfaceFlush(unit.layer) == OH_DRAWING_SUCCESS) {
                ++successCount;
            }
        }
    }
    // 每根柱子代表一次刷新，柱高表示累计成功次数。
    for (int32_t index = 0; index < flushCount; ++index) {
        const float left = frame.X(10.0F) + frame.X(16.0F) * static_cast<float>(index);
        const bool flushed = index < successCount;
        cap::FillRectArea(canvas, flushed ? cap::PaletteColor(palette + 2) : cap::PaletteColor(palette + 5), left,
            frame.Y(80.0F) - frame.Y(8.0F) * static_cast<float>(index + 1), left + frame.X(10.0F), frame.Y(80.0F));
    }
    DrawStatusColumn(canvas, frame, successCount > 0 ? STATUS_STEP_COUNT : 0);
    CloseOffscreen(unit);
}

// 4. 表面切换：先创建并释放一块表面，再创建另一块尺寸更小的表面，验证表面可重复创建。
void SceneNested(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 5);
    const float shrink = params.Range(1, 0.6F, 0.3F, 0.9F);
    OffscreenUnit outer;
    int32_t okCount = 0;
    if (OpenOffscreen(outer, static_cast<int32_t>(frame.width), static_cast<int32_t>(frame.height))) {
        PaintOffscreenContent(outer.canvas, static_cast<int32_t>(frame.width), static_cast<int32_t>(frame.height),
            palette);
        if (OH_Drawing_SurfaceFlush(outer.layer) == OH_DRAWING_SUCCESS) {
            okCount = 1;
        }
    }
    CloseOffscreen(outer);
    OffscreenUnit inner;
    const int32_t innerWidth = static_cast<int32_t>(frame.width * shrink);
    const int32_t innerHeight = static_cast<int32_t>(frame.height * shrink);
    if (OpenOffscreen(inner, innerWidth, innerHeight)) {
        PaintOffscreenContent(inner.canvas, innerWidth, innerHeight, palette + 2);
        if (OH_Drawing_SurfaceFlush(inner.layer) == OH_DRAWING_SUCCESS) {
            okCount += 1;
        }
        okCount += 1;
    }
    CloseOffscreen(inner);
    // 两层矩形表示先后创建的两块表面，尺寸差异由参数控制。
    DrawOffscreenSchematic(canvas, frame, palette, 1.0F);
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette + 3), 2.0F, frame.X(30.0F), frame.Y(32.0F),
        frame.X(70.0F), frame.Y(68.0F));
    DrawStatusColumn(canvas, frame, okCount > 0 ? STATUS_STEP_COUNT : 0);
}

// 5. 表面裁剪：在表面画布上设置裁剪矩形，验证裁剪状态属于表面画布自身。
void SceneClip(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 1);
    const float clipRatio = params.Range(1, 0.5F, 0.1F, 1.0F);
    OffscreenUnit unit;
    int32_t okCount = 0;
    if (OpenOffscreen(unit, static_cast<int32_t>(frame.width), static_cast<int32_t>(frame.height))) {
        const cap::Frame inner = cap::MakeFrame(static_cast<int32_t>(frame.width), static_cast<int32_t>(frame.height));
        OH_Drawing_Rect *clipRect = OH_Drawing_RectCreate(inner.X(10.0F), inner.Y(10.0F),
            inner.X(10.0F) + inner.X(80.0F) * clipRatio, inner.Y(90.0F));
        if (clipRect != nullptr) {
            // DIFFERENCE 表示与现有裁剪区求差，这里配合 INTERSECT 更符合“限定范围”的直觉。
            OH_Drawing_CanvasClipRect(unit.canvas, clipRect, INTERSECT, true);
            PaintOffscreenContent(unit.canvas, static_cast<int32_t>(frame.width), static_cast<int32_t>(frame.height),
                palette);
            OH_Drawing_RectDestroy(clipRect);
            okCount = 2;
        }
        if (OH_Drawing_SurfaceFlush(unit.layer) == OH_DRAWING_SUCCESS) {
            okCount = STATUS_STEP_COUNT;
        }
    }
    // 主画布同样画出裁剪区域，比例与表面上的裁剪保持一致。
    cap::FillRectArea(canvas, cap::WithAlpha(cap::PaletteColor(palette), 0.3F), frame.X(10.0F), frame.Y(10.0F),
        frame.X(10.0F) + frame.X(80.0F) * clipRatio, frame.Y(90.0F));
    cap::StrokeRectArea(canvas, cap::PaletteColor(palette + 2), 2.0F, frame.X(10.0F), frame.Y(10.0F),
        frame.X(10.0F) + frame.X(80.0F) * clipRatio, frame.Y(90.0F));
    DrawStatusColumn(canvas, frame, okCount);
    CloseOffscreen(unit);
}

// 6. 表面混合：在表面画布上叠加多个半透明色块，主画布用同样参数复现混合结果。
void SceneBlend(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 2);
    const float alpha = params.Range(1, 0.5F, 0.1F, 1.0F);
    const float side = frame.Span(34.0F);
    OffscreenUnit unit;
    int32_t okCount = 0;
    if (OpenOffscreen(unit, static_cast<int32_t>(frame.width), static_cast<int32_t>(frame.height))) {
        for (int32_t index = 0; index < STATUS_STEP_COUNT; ++index) {
            const float offset = side * 0.25F * static_cast<float>(index);
            cap::FillRectArea(unit.canvas, cap::WithAlpha(cap::PaletteColor(palette + index), alpha),
                frame.X(20.0F) + offset, frame.Y(30.0F) + offset, frame.X(20.0F) + offset + side,
                frame.Y(30.0F) + offset + side);
        }
        okCount = 2;
        if (OH_Drawing_SurfaceFlush(unit.layer) == OH_DRAWING_SUCCESS) {
            okCount = STATUS_STEP_COUNT;
        }
    }
    // 主画布上重复一遍相同绘制，视觉效果与表面内容一致。
    for (int32_t index = 0; index < STATUS_STEP_COUNT; ++index) {
        const float offset = side * 0.25F * static_cast<float>(index);
        cap::FillRectArea(canvas, cap::WithAlpha(cap::PaletteColor(palette + index), alpha),
            frame.X(20.0F) + offset, frame.Y(30.0F) + offset, frame.X(20.0F) + offset + side,
            frame.Y(30.0F) + offset + side);
    }
    DrawStatusColumn(canvas, frame, okCount);
    CloseOffscreen(unit);
}

// 7. 表面信息：读取表面画布的宽高与图像信息，画成条形图与色块。
void SceneInfo(OH_Drawing_Canvas *canvas, const cap::Frame &frame, const ParamBag &params)
{
    const int32_t palette = params.Choice(0, cap::PALETTE_COUNT, 4);
    const float ratio = params.Range(1, 0.8F, 0.2F, 1.0F);
    const int32_t width = static_cast<int32_t>(frame.width * ratio);
    const int32_t height = static_cast<int32_t>(frame.height * ratio);
    OffscreenUnit unit;
    int32_t canvasWidth = static_cast<int32_t>(frame.width);
    int32_t canvasHeight = static_cast<int32_t>(frame.height);
    OH_Drawing_Image_Info info = {0, 0, COLOR_FORMAT_RGBA_8888, ALPHA_FORMAT_PREMUL};
    int32_t okCount = 0;
    if (OpenOffscreen(unit, width, height)) {
        canvasWidth = OH_Drawing_CanvasGetWidth(unit.canvas);
        canvasHeight = OH_Drawing_CanvasGetHeight(unit.canvas);
        // 读取表面画布的图像信息，宽高与创建时传入的尺寸一致。
        if (OH_Drawing_CanvasGetImageInfo(unit.canvas, &info) == OH_DRAWING_SUCCESS) {
            okCount = STATUS_STEP_COUNT;
        } else {
            okCount = 1;
        }
    }
    // 两根横条分别表示宽度与高度相对画布的比例。
    const float widthBar = frame.X(70.0F) * cap::ClampFloat(static_cast<float>(canvasWidth) / frame.width, 0.0F, 1.0F);
    const float heightBar =
        frame.X(70.0F) * cap::ClampFloat(static_cast<float>(canvasHeight) / frame.height, 0.0F, 1.0F);
    cap::FillRectArea(canvas, cap::PaletteColor(palette), frame.X(10.0F), frame.Y(70.0F), frame.X(10.0F) + widthBar,
        frame.Y(78.0F));
    cap::FillRectArea(canvas, cap::PaletteColor(palette + 2), frame.X(10.0F), frame.Y(82.0F),
        frame.X(10.0F) + heightBar, frame.Y(90.0F));
    // 右上角色块的颜色格式由图像信息中的 colorType 决定，这里仅用其索引选色。
    cap::FillRectArea(canvas, cap::PaletteColor(palette + static_cast<int32_t>(info.colorType)), frame.X(80.0F),
        frame.Y(10.0F), frame.X(92.0F), frame.Y(20.0F));
    DrawStatusColumn(canvas, frame, okCount);
    CloseOffscreen(unit);
}
} // namespace

void DrawOffscreenScene(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t scene,
    const ParamBag &params)
{
    if (canvas == nullptr || width <= 0 || height <= 0) {
        DRAWING_LOGE("DrawOffscreenScene invalid canvas or size, width=%{public}d height=%{public}d", width, height);
        return;
    }
    if (scene < OFFSCREEN_CREATE || scene >= OFFSCREEN_SCENE_COUNT) {
        DRAWING_LOGE("DrawOffscreenScene unsupported scene=%{public}d", scene);
        return;
    }
    const cap::Frame frame = cap::MakeFrame(width, height);
    switch (scene) {
        case OFFSCREEN_CREATE:
            SceneCreate(canvas, frame, params);
            break;
        case OFFSCREEN_SIZE:
            SceneSize(canvas, frame, params);
            break;
        case OFFSCREEN_FALLBACK:
            SceneFallback(canvas, frame, params);
            break;
        case OFFSCREEN_FLUSH:
            SceneFlush(canvas, frame, params);
            break;
        case OFFSCREEN_NESTED:
            SceneNested(canvas, frame, params);
            break;
        case OFFSCREEN_CLIP:
            SceneClip(canvas, frame, params);
            break;
        case OFFSCREEN_BLEND:
            SceneBlend(canvas, frame, params);
            break;
        case OFFSCREEN_INFO:
            SceneInfo(canvas, frame, params);
            break;
        default:
            break;
    }
    DRAWING_LOGI("DrawOffscreenScene done, scene=%{public}d size=%{public}dx%{public}d", scene, width, height);
}
} // namespace ndr
