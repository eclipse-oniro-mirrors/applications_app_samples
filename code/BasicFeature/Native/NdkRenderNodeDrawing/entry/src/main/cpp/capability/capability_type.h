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
#ifndef NDR_CAPABILITY_TYPE_H
#define NDR_CAPABILITY_TYPE_H

#include <cstdint>

namespace ndr {
// 能力域编号，与 ArkTS 侧 core/SchemaTypes.ets 的 GROUP_* 常量一一对应。
enum CapabilityGroup : int32_t {
    GROUP_CANVAS = 1,
    GROUP_GEOMETRY = 2,
    GROUP_PAINT = 3,
    GROUP_COLOR = 4,
    GROUP_COLOR_FILTER = 5,
    GROUP_SHADER = 6,
    GROUP_MASK_FILTER = 7,
    GROUP_IMAGE_FILTER = 8,
    GROUP_BITMAP = 9,
    GROUP_PIXELMAP = 10,
    GROUP_IMAGE_IO = 11,
    GROUP_FONT = 12,
    GROUP_TEXTBLOB = 13,
    GROUP_TYPOGRAPHY = 14,
    GROUP_SHADOW = 15,
    GROUP_MATRIX = 16,
    GROUP_RECORD = 17,
    GROUP_OFFSCREEN = 18,
    GROUP_ERROR = 19,
    GROUP_COUNT = 19,
};

// 单个场景最多接收 8 个参数，长度不足时由 ParamBag 用默认值补齐。
constexpr uint32_t MAX_SCENE_PARAMS = 8;

// 画布能力域：清屏、批量点阵、状态栈、裁剪、坐标变换与图层。
enum CanvasScene : int32_t {
    CANVAS_CLEAR = 0,
    CANVAS_POINT_GRID = 1,
    CANVAS_SAVE_RESTORE = 2,
    CANVAS_CLIP_RECT = 3,
    CANVAS_CLIP_ROUND_RECT = 4,
    CANVAS_CLIP_PATH = 5,
    CANVAS_CLIP_REGION = 6,
    CANVAS_TRANSLATE = 7,
    CANVAS_SKEW = 8,
    CANVAS_SAVE_LAYER = 9,
    CANVAS_SCENE_COUNT = 10,
};

// 几何能力域：基本图元、圆弧、路径与区域布尔运算。
enum GeometryScene : int32_t {
    GEOMETRY_RECT = 0,
    GEOMETRY_ROUND_RECT = 1,
    GEOMETRY_NESTED_ROUND_RECT = 2,
    GEOMETRY_OVAL = 3,
    GEOMETRY_ARC = 4,
    GEOMETRY_ARC_WITH_CENTER = 5,
    GEOMETRY_LINE = 6,
    GEOMETRY_POLYGON = 7,
    GEOMETRY_BEZIER = 8,
    GEOMETRY_PATH_OP = 9,
    GEOMETRY_REGION_OP = 10,
    GEOMETRY_SCENE_COUNT = 11,
};

// 画笔能力域：端点、拐角、线宽、透明度、混合模式、路径效果与阴影。
enum PaintScene : int32_t {
    PAINT_PEN_CAP = 0,
    PAINT_PEN_JOIN = 1,
    PAINT_PEN_MITER = 2,
    PAINT_PEN_WIDTH = 3,
    PAINT_BRUSH_ALPHA = 4,
    PAINT_BLEND_MODE = 5,
    PAINT_DASH_EFFECT = 6,
    PAINT_CORNER_EFFECT = 7,
    PAINT_DISCRETE_EFFECT = 8,
    PAINT_SHADOW_LAYER = 9,
    PAINT_SCENE_COUNT = 10,
};

// 颜色能力域：调色板、透明度、混色与颜色分量重排。
enum ColorScene : int32_t {
    COLOR_PALETTE = 0,
    COLOR_ALPHA_RAMP = 1,
    COLOR_LERP = 2,
    COLOR_ORDER_ARGB = 3,
    COLOR_ORDER_RGBA = 4,
    COLOR_CONTRAST = 5,
    COLOR_INVERT = 6,
    COLOR_GAMMA_TO_LINEAR = 7,
    COLOR_GAMMA_TO_SRGB = 8,
    COLOR_SCENE_COUNT = 9,
};

// 颜色滤波器能力域：模式、颜色矩阵、亮度、组合、光照与画笔级滤波器。
enum ColorFilterScene : int32_t {
    FILTER_BLEND_MODE = 0,
    FILTER_MATRIX_GRAY = 1,
    FILTER_MATRIX_SEPIA = 2,
    FILTER_MATRIX_INVERT = 3,
    FILTER_MATRIX_CONTRAST = 4,
    FILTER_LUMA = 5,
    FILTER_COMPOSE = 6,
    FILTER_LIGHTING = 7,
    FILTER_ON_PEN = 8,
    FILTER_SCENE_COUNT = 9,
};

// 着色器能力域：线性、径向、扫描、锥形渐变与组合、局部矩阵、平铺模式。
enum ShaderScene : int32_t {
    SHADER_LINEAR_TWO = 0,
    SHADER_LINEAR_MULTI = 1,
    SHADER_RADIAL = 2,
    SHADER_SWEEP = 3,
    SHADER_CONICAL = 4,
    SHADER_COLOR = 5,
    SHADER_COMPOSE = 6,
    SHADER_ON_PEN = 7,
    SHADER_LOCAL_MATRIX = 8,
    SHADER_TILE_MODE = 9,
    SHADER_GRADIENT_ALPHA = 10,
    SHADER_SCENE_COUNT = 11,
};

// 蒙版滤波器能力域：四种模糊类型、sigma 扫描与作用在画笔/图层/文字上的差异。
enum MaskFilterScene : int32_t {
    MASK_BLUR_NORMAL = 0,
    MASK_BLUR_SOLID = 1,
    MASK_BLUR_OUTER = 2,
    MASK_BLUR_INNER = 3,
    MASK_BLUR_SIGMA = 4,
    MASK_ON_PEN = 5,
    MASK_ON_LAYER = 6,
    MASK_ON_TEXT = 7,
    MASK_SCENE_COUNT = 8,
};

// 图像滤波器能力域：模糊、裁剪模糊、位移、颜色矩阵、渐变、九宫格与平铺模式。
enum ImageFilterScene : int32_t {
    IMAGE_FILTER_BLUR = 0,
    IMAGE_FILTER_BLUR_CROP = 1,
    IMAGE_FILTER_OFFSET = 2,
    IMAGE_FILTER_COLOR_MATRIX = 3,
    IMAGE_FILTER_SHADER = 4,
    IMAGE_FILTER_LATTICE = 5,
    IMAGE_FILTER_TILE_CLAMP = 6,
    IMAGE_FILTER_TILE_REPEAT = 7,
    IMAGE_FILTER_TILE_MIRROR = 8,
    IMAGE_FILTER_ON_LAYER = 9,
    IMAGE_FILTER_SCENE_COUNT = 10,
};

// 位图能力域：构建、绘制、缩放、像素回读、外部像素、格式与行字节。
enum BitmapScene : int32_t {
    BITMAP_BUILD = 0,
    BITMAP_DRAW = 1,
    BITMAP_RECT_SCALE = 2,
    BITMAP_READ_PIXELS = 3,
    BITMAP_FROM_PIXELS = 4,
    BITMAP_IMAGE_INFO = 5,
    BITMAP_ALPHA_FORMAT = 6,
    BITMAP_COLOR_FORMAT = 7,
    BITMAP_ROW_BYTES = 8,
    BITMAP_TILE_GRID = 9,
    BITMAP_SCENE_COUNT = 10,
};

// 像素图能力域：绘制、采样、九宫格、网格、裁剪与缺失 PixelMap 时的降级。
enum PixelMapScene : int32_t {
    PIXELMAP_DRAW_RECT = 0,
    PIXELMAP_SAMPLING_NEAREST = 1,
    PIXELMAP_SAMPLING_LINEAR = 2,
    PIXELMAP_SRC_CONSTRAINT = 3,
    PIXELMAP_NINE_PATCH = 4,
    PIXELMAP_MESH = 5,
    PIXELMAP_ROTATE = 6,
    PIXELMAP_TILE = 7,
    PIXELMAP_ALPHA = 8,
    PIXELMAP_SCALE = 9,
    PIXELMAP_CLIP = 10,
    PIXELMAP_FALLBACK = 11,
    PIXELMAP_SCENE_COUNT = 12,
};

// 图像与内存流能力域：位图转图像、源矩形约束、图像信息、采样与字体流加载。
enum ImageIoScene : int32_t {
    IMAGE_IO_BUILD = 0,
    IMAGE_IO_DRAW = 1,
    IMAGE_IO_SRC_RECT = 2,
    IMAGE_IO_INFO = 3,
    IMAGE_IO_SAMPLING_NEAREST = 4,
    IMAGE_IO_SAMPLING_LINEAR = 5,
    IMAGE_IO_ALPHA_COPY = 6,
    IMAGE_IO_MEMORY_STREAM = 7,
    IMAGE_IO_TYPEFACE_STREAM = 8,
    IMAGE_IO_STREAM_FALLBACK = 9,
    IMAGE_IO_SCENE_COUNT = 10,
};

// 字体能力域：字号、测量、度量、倾斜、伪粗体、横向缩放、微调、字形路径与字体管理器。
enum FontScene : int32_t {
    FONT_CREATE = 0,
    FONT_SIZE = 1,
    FONT_MEASURE = 2,
    FONT_METRICS = 3,
    FONT_SKEW = 4,
    FONT_FAKE_BOLD = 5,
    FONT_SCALE_X = 6,
    FONT_HINTING = 7,
    FONT_EDGING = 8,
    FONT_TEXT_PATH = 9,
    FONT_MGR_FAMILY = 10,
    FONT_TYPEFACE_DEFAULT = 11,
    FONT_SCENE_COUNT = 12,
};

// 文字块能力域：三种构造方式、Builder 定位、包围盒、唯一编号、环形与缩放排列。
enum TextBlobScene : int32_t {
    TEXTBLOB_STRING = 0,
    TEXTBLOB_TEXT = 1,
    TEXTBLOB_POS_TEXT = 2,
    TEXTBLOB_BUILDER = 3,
    TEXTBLOB_BOUNDS = 4,
    TEXTBLOB_UNIQUE_ID = 5,
    TEXTBLOB_CIRCLE = 6,
    TEXTBLOB_SCALE = 7,
    TEXTBLOB_SCENE_COUNT = 8,
};

// 排版能力域：对齐、行数、省略号、字间距、装饰、阴影、路径排版与行度量。
enum TypographyScene : int32_t {
    TYPO_BASIC = 0,
    TYPO_ALIGN = 1,
    TYPO_MAX_LINES = 2,
    TYPO_ELLIPSIS = 3,
    TYPO_SPACING = 4,
    TYPO_DECORATION = 5,
    TYPO_SHADOW = 6,
    TYPO_ON_PATH = 7,
    TYPO_INDENTS = 8,
    TYPO_LINE_METRICS = 9,
    TYPO_BREAK_STRATEGY = 10,
    TYPO_FONT_WEIGHT = 11,
    TYPO_DIRECTION = 12,
    TYPO_LINES = 13,
    TYPO_SCENE_COUNT = 14,
};

// 阴影层能力域：模糊半径、偏移、颜色、画笔与画刷作用、叠加、文字阴影与图层裁剪。
enum ShadowScene : int32_t {
    SHADOW_BLUR = 0,
    SHADOW_OFFSET = 1,
    SHADOW_COLOR = 2,
    SHADOW_ON_PEN = 3,
    SHADOW_ON_BRUSH = 4,
    SHADOW_STACK = 5,
    SHADOW_TEXT = 6,
    SHADOW_LAYER = 7,
    SHADOW_SCENE_COUNT = 8,
};

// 矩阵能力域：恒等、平移、缩放、旋转、错切、拼接、前后乘、求逆、点映射与多边映射。
enum MatrixScene : int32_t {
    MATRIX_IDENTITY = 0,
    MATRIX_TRANSLATE = 1,
    MATRIX_SCALE = 2,
    MATRIX_ROTATE = 3,
    MATRIX_SKEW = 4,
    MATRIX_CONCAT = 5,
    MATRIX_PRE_POST = 6,
    MATRIX_INVERT = 7,
    MATRIX_MAP_POINTS = 8,
    MATRIX_POLY_TO_POLY = 9,
    MATRIX_SCENE_COUNT = 10,
};

// 录制回放能力域：基础录制、变换录制、重复回放、嵌套、尺寸差异、图层与叠加。
enum RecordScene : int32_t {
    RECORD_BASIC = 0,
    RECORD_TRANSFORM = 1,
    RECORD_REPLAY_TWICE = 2,
    RECORD_NESTING = 3,
    RECORD_RESIZED = 4,
    RECORD_LAYER = 5,
    RECORD_SAVE_RESTORE = 6,
    RECORD_OVERLAY = 7,
    RECORD_SCENE_COUNT = 8,
};

// 离屏层能力域：创建、尺寸、CPU 降级、刷新、嵌套、裁剪、混合与信息。
enum OffscreenScene : int32_t {
    OFFSCREEN_CREATE = 0,
    OFFSCREEN_SIZE = 1,
    OFFSCREEN_FALLBACK = 2,
    OFFSCREEN_FLUSH = 3,
    OFFSCREEN_NESTED = 4,
    OFFSCREEN_CLIP = 5,
    OFFSCREEN_BLEND = 6,
    OFFSCREEN_INFO = 7,
    OFFSCREEN_SCENE_COUNT = 8,
};

// 错误码能力域：重置、空参数、非法尺寸、成功与失败后取值、恢复、码表与守卫差异。
enum ErrorScene : int32_t {
    ERROR_RESET = 0,
    ERROR_NULL_PARAM = 1,
    ERROR_INVALID_SIZE = 2,
    ERROR_AFTER_SUCCESS = 3,
    ERROR_AFTER_FAIL = 4,
    ERROR_RECOVER = 5,
    ERROR_CODE_TABLE = 6,
    ERROR_GUARDED_RECT = 7,
    ERROR_GUARDED_MATRIX = 8,
    ERROR_SUMMARY = 9,
    ERROR_SCENE_COUNT = 10,
};
} // namespace ndr

#endif // NDR_CAPABILITY_TYPE_H
