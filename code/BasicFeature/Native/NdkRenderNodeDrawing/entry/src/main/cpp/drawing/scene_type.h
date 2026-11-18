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
#ifndef NDR_DRAWING_SCENE_TYPE_H
#define NDR_DRAWING_SCENE_TYPE_H

#include <cstdint>

namespace ndr {
// 场景类型，与 ArkTS 侧 SceneType.ets 一一对应。
enum SceneType : int32_t {
    SCENE_SHAPE = 0,
    SCENE_EFFECT = 1,
    SCENE_TRANSFORM = 2,
    SCENE_IMAGE = 3,
    SCENE_TEXT = 4,
    SCENE_TYPE_COUNT = 5,
};

// 几何图元种类。
enum ShapeKind : int32_t {
    SHAPE_POINT = 0,
    SHAPE_LINE = 1,
    SHAPE_CIRCLE = 2,
    SHAPE_OVAL = 3,
    SHAPE_RECT = 4,
    SHAPE_ROUND_RECT = 5,
    SHAPE_ARC = 6,
    SHAPE_PATH = 7,
    SHAPE_REGION = 8,
    SHAPE_KIND_COUNT = 9,
};

// 绘制效果种类。
enum EffectKind : int32_t {
    EFFECT_FILL_STROKE = 0,
    EFFECT_BLEND_MODE = 1,
    EFFECT_DASH = 2,
    EFFECT_LINEAR_GRADIENT = 3,
    EFFECT_RADIAL_GRADIENT = 4,
    EFFECT_SWEEP_GRADIENT = 5,
    EFFECT_COLOR_FILTER = 6,
    EFFECT_MASK_BLUR = 7,
    EFFECT_KIND_COUNT = 8,
};

// 画布操作与状态种类。
enum TransformKind : int32_t {
    TRANSFORM_CLIP_RECT = 0,
    TRANSFORM_CLIP_PATH = 1,
    TRANSFORM_TRANSLATE = 2,
    TRANSFORM_ROTATE = 3,
    TRANSFORM_SCALE = 4,
    TRANSFORM_MATRIX = 5,
    TRANSFORM_SAVE_RESTORE = 6,
    TRANSFORM_KIND_COUNT = 7,
};

// 图片绘制种类。
enum ImageKind : int32_t {
    IMAGE_STRETCH = 0,
    IMAGE_NEAREST = 1,
    IMAGE_LINEAR = 2,
    IMAGE_SCALE_VIEW = 3,
    IMAGE_KIND_COUNT = 4,
};

// 文本绘制种类。
enum TextKind : int32_t {
    TEXT_BLOB = 0,
    TEXT_TYPOGRAPHY = 1,
    TEXT_MEASURE = 2,
    TEXT_KIND_COUNT = 3,
};
} // namespace ndr

#endif // NDR_DRAWING_SCENE_TYPE_H
