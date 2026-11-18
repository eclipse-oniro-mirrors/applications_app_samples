/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { SceneText } from '../core/SchemaTypes';

// 场景编号，与 cpp/drawing/scene_type.h 中的 SceneType 一一对应。
export const SCENE_SHAPE: number = 0;
export const SCENE_EFFECT: number = 1;
export const SCENE_TRANSFORM: number = 2;
export const SCENE_IMAGE: number = 3;
export const SCENE_TEXT: number = 4;

// 几何图元种类，与 ShapeKind 对应。
export const SHAPE_POINT: number = 0;
export const SHAPE_LINE: number = 1;
export const SHAPE_CIRCLE: number = 2;
export const SHAPE_OVAL: number = 3;
export const SHAPE_RECT: number = 4;
export const SHAPE_ROUND_RECT: number = 5;
export const SHAPE_ARC: number = 6;
export const SHAPE_PATH: number = 7;
export const SHAPE_REGION: number = 8;

// 绘制效果种类，与 EffectKind 对应。
export const EFFECT_FILL_STROKE: number = 0;
export const EFFECT_BLEND_MODE: number = 1;
export const EFFECT_DASH: number = 2;
export const EFFECT_LINEAR_GRADIENT: number = 3;
export const EFFECT_RADIAL_GRADIENT: number = 4;
export const EFFECT_SWEEP_GRADIENT: number = 5;
export const EFFECT_COLOR_FILTER: number = 6;
export const EFFECT_MASK_BLUR: number = 7;

// 画布操作与状态种类，与 TransformKind 对应。
export const TRANSFORM_CLIP_RECT: number = 0;
export const TRANSFORM_CLIP_PATH: number = 1;
export const TRANSFORM_TRANSLATE: number = 2;
export const TRANSFORM_ROTATE: number = 3;
export const TRANSFORM_SCALE: number = 4;
export const TRANSFORM_MATRIX: number = 5;
export const TRANSFORM_SAVE_RESTORE: number = 6;

// 图片绘制种类，与 ImageKind 对应。
export const IMAGE_STRETCH: number = 0;
export const IMAGE_NEAREST: number = 1;
export const IMAGE_LINEAR: number = 2;
export const IMAGE_SCALE_VIEW: number = 3;

// 文本绘制种类，与 TextKind 对应。
export const TEXT_BLOB: number = 0;
export const TEXT_TYPOGRAPHY: number = 1;
export const TEXT_MEASURE: number = 2;

// 场景按钮描述，label 为界面展示文案（统一取 $r 资源以支持三语言），kind 传给 native 侧。
export class SceneOption {
  public label: SceneText;
  public kind: number;

  constructor(label: SceneText, kind: number) {
    this.label = label;
    this.kind = kind;
  }
}

export const SHAPE_OPTIONS: SceneOption[] = [
  new SceneOption($r('app.string.scene_shape_point'), SHAPE_POINT),
  new SceneOption($r('app.string.scene_shape_line'), SHAPE_LINE),
  new SceneOption($r('app.string.scene_shape_circle'), SHAPE_CIRCLE),
  new SceneOption($r('app.string.scene_shape_oval'), SHAPE_OVAL),
  new SceneOption($r('app.string.scene_shape_rect'), SHAPE_RECT),
  new SceneOption($r('app.string.scene_shape_round_rect'), SHAPE_ROUND_RECT),
  new SceneOption($r('app.string.scene_shape_arc'), SHAPE_ARC),
  new SceneOption($r('app.string.scene_shape_path'), SHAPE_PATH),
  new SceneOption($r('app.string.scene_shape_region'), SHAPE_REGION)
];

export const EFFECT_OPTIONS: SceneOption[] = [
  new SceneOption($r('app.string.scene_effect_fill_stroke'), EFFECT_FILL_STROKE),
  new SceneOption($r('app.string.scene_effect_blend_mode'), EFFECT_BLEND_MODE),
  new SceneOption($r('app.string.scene_effect_dash'), EFFECT_DASH),
  new SceneOption($r('app.string.scene_effect_linear'), EFFECT_LINEAR_GRADIENT),
  new SceneOption($r('app.string.scene_effect_radial'), EFFECT_RADIAL_GRADIENT),
  new SceneOption($r('app.string.scene_effect_sweep'), EFFECT_SWEEP_GRADIENT),
  new SceneOption($r('app.string.scene_effect_color_filter'), EFFECT_COLOR_FILTER),
  new SceneOption($r('app.string.scene_effect_mask_blur'), EFFECT_MASK_BLUR)
];

export const TRANSFORM_OPTIONS: SceneOption[] = [
  new SceneOption($r('app.string.scene_transform_clip_rect'), TRANSFORM_CLIP_RECT),
  new SceneOption($r('app.string.scene_transform_clip_path'), TRANSFORM_CLIP_PATH),
  new SceneOption($r('app.string.scene_transform_translate'), TRANSFORM_TRANSLATE),
  new SceneOption($r('app.string.scene_transform_rotate'), TRANSFORM_ROTATE),
  new SceneOption($r('app.string.scene_transform_scale'), TRANSFORM_SCALE),
  new SceneOption($r('app.string.scene_transform_matrix'), TRANSFORM_MATRIX),
  new SceneOption($r('app.string.scene_transform_save_restore'), TRANSFORM_SAVE_RESTORE)
];

export const IMAGE_OPTIONS: SceneOption[] = [
  new SceneOption($r('app.string.scene_image_stretch'), IMAGE_STRETCH),
  new SceneOption($r('app.string.scene_image_nearest'), IMAGE_NEAREST),
  new SceneOption($r('app.string.scene_image_linear'), IMAGE_LINEAR),
  new SceneOption($r('app.string.scene_image_scale_view'), IMAGE_SCALE_VIEW)
];

export const TEXT_OPTIONS: SceneOption[] = [
  new SceneOption($r('app.string.scene_text_blob'), TEXT_BLOB),
  new SceneOption($r('app.string.scene_text_typography'), TEXT_TYPOGRAPHY),
  new SceneOption($r('app.string.scene_text_measure'), TEXT_MEASURE)
];
