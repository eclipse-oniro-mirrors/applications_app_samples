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
#include "capability_dispatch.h"

#include "common/log_common.h"
#include "capability/cap_bitmap.h"
#include "capability/cap_canvas.h"
#include "capability/cap_color.h"
#include "capability/cap_color_filter.h"
#include "capability/cap_error.h"
#include "capability/cap_font.h"
#include "capability/cap_geometry.h"
#include "capability/cap_image_filter.h"
#include "capability/cap_image_io.h"
#include "capability/cap_mask_filter.h"
#include "capability/cap_matrix.h"
#include "capability/cap_offscreen.h"
#include "capability/cap_paint.h"
#include "capability/cap_pixelmap.h"
#include "capability/cap_record.h"
#include "capability/cap_shader.h"
#include "capability/cap_shadow.h"
#include "capability/cap_textblob.h"
#include "capability/cap_typography.h"
#include "capability/capability_type.h"
#include "capability/param_bag.h"

namespace ndr {
namespace {
// 每个能力域的合法场景个数，用于统一拦截越界编号；下标为 group - GROUP_CANVAS。
constexpr int32_t SCENE_COUNTS[] = {
    CANVAS_SCENE_COUNT,
    GEOMETRY_SCENE_COUNT,
    PAINT_SCENE_COUNT,
    COLOR_SCENE_COUNT,
    FILTER_SCENE_COUNT,
    SHADER_SCENE_COUNT,
    MASK_SCENE_COUNT,
    IMAGE_FILTER_SCENE_COUNT,
    BITMAP_SCENE_COUNT,
    PIXELMAP_SCENE_COUNT,
    IMAGE_IO_SCENE_COUNT,
    FONT_SCENE_COUNT,
    TEXTBLOB_SCENE_COUNT,
    TYPO_SCENE_COUNT,
    SHADOW_SCENE_COUNT,
    MATRIX_SCENE_COUNT,
    RECORD_SCENE_COUNT,
    OFFSCREEN_SCENE_COUNT,
    ERROR_SCENE_COUNT,
};
constexpr int32_t SCENE_COUNT_TABLE_SIZE = static_cast<int32_t>(sizeof(SCENE_COUNTS) / sizeof(SCENE_COUNTS[0]));

// 图形与样式域分派：画布、几何、画笔、颜色、滤波器与位图，返回 true 表示已处理。
bool DispatchStyleGroup(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t group, int32_t scene,
    const ParamBag &params)
{
    switch (group) {
        case GROUP_CANVAS:
            DrawCanvasScene(canvas, width, height, scene, params);
            return true;
        case GROUP_GEOMETRY:
            DrawGeometryScene(canvas, width, height, scene, params);
            return true;
        case GROUP_PAINT:
            DrawPaintScene(canvas, width, height, scene, params);
            return true;
        case GROUP_COLOR:
            DrawColorScene(canvas, width, height, scene, params);
            return true;
        case GROUP_COLOR_FILTER:
            DrawColorFilterScene(canvas, width, height, scene, params);
            return true;
        case GROUP_SHADER:
            DrawShaderScene(canvas, width, height, scene, params);
            return true;
        case GROUP_MASK_FILTER:
            DrawMaskFilterScene(canvas, width, height, scene, params);
            return true;
        case GROUP_IMAGE_FILTER:
            DrawImageFilterScene(canvas, width, height, scene, params);
            return true;
        case GROUP_BITMAP:
            DrawBitmapScene(canvas, width, height, scene, params);
            return true;
        default:
            return false;
    }
}

// 内容与输出域分派：图片 IO、字体、排版、阴影、矩阵、录制、离屏层与错误码，返回 true 表示已处理。
bool DispatchContentGroup(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t group, int32_t scene,
    const ParamBag &params)
{
    switch (group) {
        case GROUP_IMAGE_IO:
            DrawImageIoScene(canvas, width, height, scene, params);
            return true;
        case GROUP_FONT:
            DrawFontScene(canvas, width, height, scene, params);
            return true;
        case GROUP_TEXTBLOB:
            DrawTextBlobScene(canvas, width, height, scene, params);
            return true;
        case GROUP_TYPOGRAPHY:
            DrawTypographyScene(canvas, width, height, scene, params);
            return true;
        case GROUP_SHADOW:
            DrawShadowScene(canvas, width, height, scene, params);
            return true;
        case GROUP_MATRIX:
            DrawMatrixScene(canvas, width, height, scene, params);
            return true;
        case GROUP_RECORD:
            DrawRecordScene(canvas, width, height, scene, params);
            return true;
        case GROUP_OFFSCREEN:
            DrawOffscreenScene(canvas, width, height, scene, params);
            return true;
        case GROUP_ERROR:
            DrawErrorScene(canvas, width, height, scene, params);
            return true;
        default:
            return false;
    }
}
} // namespace

const char *CapabilityGroupName(int32_t group)
{
    switch (group) {
        case GROUP_CANVAS:
            return "canvas";
        case GROUP_GEOMETRY:
            return "geometry";
        case GROUP_PAINT:
            return "paint";
        case GROUP_COLOR:
            return "color";
        case GROUP_COLOR_FILTER:
            return "color-filter";
        case GROUP_SHADER:
            return "shader";
        case GROUP_MASK_FILTER:
            return "mask-filter";
        case GROUP_IMAGE_FILTER:
            return "image-filter";
        case GROUP_BITMAP:
            return "bitmap";
        case GROUP_PIXELMAP:
            return "pixelmap";
        case GROUP_IMAGE_IO:
            return "image-io";
        case GROUP_FONT:
            return "font";
        case GROUP_TEXTBLOB:
            return "textblob";
        case GROUP_TYPOGRAPHY:
            return "typography";
        case GROUP_SHADOW:
            return "shadow";
        case GROUP_MATRIX:
            return "matrix";
        case GROUP_RECORD:
            return "record";
        case GROUP_OFFSCREEN:
            return "offscreen";
        case GROUP_ERROR:
            return "error";
        default:
            return "unknown";
    }
}

bool IsCapabilitySupported(int32_t group, int32_t scene)
{
    if (group < GROUP_CANVAS || group >= GROUP_CANVAS + SCENE_COUNT_TABLE_SIZE) {
        return false;
    }
    const int32_t count = SCENE_COUNTS[group - GROUP_CANVAS];
    return scene >= 0 && scene < count;
}

void DispatchCapability(OH_Drawing_Canvas *canvas, int32_t width, int32_t height, int32_t group, int32_t scene,
    const double *values, uint32_t count, void *nativePixelMap)
{
    if (!IsCapabilitySupported(group, scene)) {
        DRAWING_LOGE("DispatchCapability unsupported group=%{public}d scene=%{public}d", group, scene);
        return;
    }
    const ParamBag params(values, count);
    if (group == GROUP_PIXELMAP) {
        // 像素图域额外需要 ArkTS 侧传入的 PixelMap，单独分派。
        DrawPixelMapScene(canvas, width, height, scene, params, nativePixelMap);
        return;
    }
    if (DispatchStyleGroup(canvas, width, height, group, scene, params) ||
        DispatchContentGroup(canvas, width, height, group, scene, params)) {
        return;
    }
    DRAWING_LOGE("DispatchCapability missing handler for group=%{public}d", group);
}
} // namespace ndr
