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

import { GroupSpec, ParamSpec, PARAM_RANGE, SceneSpec } from '../../../main/ets/core/SchemaTypes';
import { BITMAP_GROUP } from '../../../main/ets/schema/CapabilityBitmap';
import { CANVAS_GROUP } from '../../../main/ets/schema/CapabilityCanvas';
import { COLOR_GROUP } from '../../../main/ets/schema/CapabilityColor';
import { COLOR_FILTER_GROUP } from '../../../main/ets/schema/CapabilityColorFilter';
import { ERROR_GROUP } from '../../../main/ets/schema/CapabilityError';
import { FONT_GROUP } from '../../../main/ets/schema/CapabilityFont';
import { GEOMETRY_GROUP } from '../../../main/ets/schema/CapabilityGeometry';
import { IMAGE_FILTER_GROUP } from '../../../main/ets/schema/CapabilityImageFilter';
import { IMAGE_IO_GROUP } from '../../../main/ets/schema/CapabilityImageIo';
import { MASK_FILTER_GROUP } from '../../../main/ets/schema/CapabilityMaskFilter';
import { MATRIX_GROUP } from '../../../main/ets/schema/CapabilityMatrix';
import { PAINT_GROUP } from '../../../main/ets/schema/CapabilityPaint';
import { PIXELMAP_GROUP } from '../../../main/ets/schema/CapabilityPixelMap';
import { RECORD_GROUP } from '../../../main/ets/schema/CapabilityRecord';
import { SHADER_GROUP } from '../../../main/ets/schema/CapabilityShader';
import { SHADOW_GROUP } from '../../../main/ets/schema/CapabilityShadow';
import { OFFSCREEN_GROUP } from '../../../main/ets/schema/CapabilityOffscreen';
import { TEXTBLOB_GROUP } from '../../../main/ets/schema/CapabilityTextBlob';
import { TYPOGRAPHY_GROUP } from '../../../main/ets/schema/CapabilityTypography';
import { TOPIC_ANIMATION_GROUP } from '../../../main/ets/schema/TopicAnimation';
import { TOPIC_BLUR_GROUP } from '../../../main/ets/schema/TopicBlur';
import { TOPIC_FRAME_TICK_GROUP } from '../../../main/ets/schema/TopicFrameTick';
import { TOPIC_HIT_TEST_GROUP } from '../../../main/ets/schema/TopicHitTest';
import { TOPIC_LIFECYCLE_GROUP } from '../../../main/ets/schema/TopicLifecycle';
import { TOPIC_MULTI_DEVICE_GROUP } from '../../../main/ets/schema/TopicMultiDevice';
import { TOPIC_NODE_TREE_GROUP } from '../../../main/ets/schema/TopicNodeTree';
import { TOPIC_PERFORMANCE_GROUP } from '../../../main/ets/schema/TopicPerformance';
import { TOPIC_RECORD_GROUP } from '../../../main/ets/schema/TopicRecord';
import { TOPIC_RENDER_PROP_GROUP } from '../../../main/ets/schema/TopicRenderProp';

// 十九个能力域，顺序与 native 侧 GROUP 1..19 一致。
export const CAPABILITY_GROUPS: GroupSpec[] = [CANVAS_GROUP, GEOMETRY_GROUP, PAINT_GROUP, COLOR_GROUP,
  COLOR_FILTER_GROUP, SHADER_GROUP, MASK_FILTER_GROUP, IMAGE_FILTER_GROUP, BITMAP_GROUP, PIXELMAP_GROUP,
  IMAGE_IO_GROUP, FONT_GROUP, TEXTBLOB_GROUP, TYPOGRAPHY_GROUP, SHADOW_GROUP, MATRIX_GROUP, RECORD_GROUP,
  OFFSCREEN_GROUP, ERROR_GROUP];
// 十个专题分组，编号 20..29；顺序必须以编号递增为准，
// 多个套件都按下标 i 校对编号 20+i（TopicMatrix 全量、Schema 专题槽位、Dispatch 末位专题）。
export const TOPIC_GROUPS: GroupSpec[] = [TOPIC_NODE_TREE_GROUP, TOPIC_RENDER_PROP_GROUP, TOPIC_BLUR_GROUP,
  TOPIC_ANIMATION_GROUP, TOPIC_HIT_TEST_GROUP, TOPIC_PERFORMANCE_GROUP, TOPIC_RECORD_GROUP,
  TOPIC_MULTI_DEVICE_GROUP, TOPIC_LIFECYCLE_GROUP, TOPIC_FRAME_TICK_GROUP];
// 全部二十九个分组。
export const ALL_GROUPS: GroupSpec[] = CAPABILITY_GROUPS.concat(TOPIC_GROUPS);

// 按编号取分组，编号来自 native 协议，越界时返回 undefined。
export function groupById(group: number): GroupSpec | undefined {
  for (let index = 0; index < ALL_GROUPS.length; index++) {
    if (ALL_GROUPS[index].id === group) {
      return ALL_GROUPS[index];
    }
  }
  return undefined;
}

// 按编号取场景，同一分组内场景编号连续且等于下标。
export function sceneOf(group: GroupSpec, scene: number): SceneSpec | undefined {
  if (scene < 0 || scene >= group.scenes.length) {
    return undefined;
  }
  return group.scenes[scene];
}

// 场景参数的默认值数组，即面板初始状态下传给 native 的参数。
export function defaultsOf(group: GroupSpec, scene: number): number[] {
  const target: SceneSpec | undefined = sceneOf(group, scene);
  const values: number[] = [];
  if (target === undefined) {
    return values;
  }
  for (let index = 0; index < target.params.length; index++) {
    values.push(target.params[index].def);
  }
  return values;
}

// 第一个滑杆参数的下标，用于构造「只改一个参数」的对照画面。
export function firstRangeIndex(group: GroupSpec, scene: number): number {
  const target: SceneSpec | undefined = sceneOf(group, scene);
  if (target === undefined) {
    return -1;
  }
  for (let index = 0; index < target.params.length; index++) {
    if (target.params[index].kind === PARAM_RANGE) {
      return index;
    }
  }
  return -1;
}

// 把指定参数推到最小或最大值，其余参数保持默认。
export function pushedParams(group: GroupSpec, scene: number, paramIndex: number, toMax: boolean): number[] {
  const values: number[] = defaultsOf(group, scene);
  const target: SceneSpec | undefined = sceneOf(group, scene);
  if (target === undefined || paramIndex < 0 || paramIndex >= values.length) {
    return values;
  }
  const spec: ParamSpec = target.params[paramIndex];
  values[paramIndex] = toMax ? spec.max : spec.min;
  return values;
}
