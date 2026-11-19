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

import { GroupSpec, PARAM_RANGE, PARAM_SELECT, PARAM_TOGGLE, ParamSpec,
  SceneSpec } from '../../../main/ets/core/SchemaTypes';
import { ParamEngine } from '../../../main/ets/core/ParamEngine';
import { CAPABILITY_GROUPS, TOPIC_GROUPS } from './SceneDefaults';

// 参数维度编号：合法取值、区间边界、非法输入、数值极值、多参数组合、多次操作状态。
export const DIM_LEGAL: number = 0;
export const DIM_BOUND: number = 1;
export const DIM_INVALID: number = 2;
export const DIM_EXTREME: number = 3;
export const DIM_COMBO: number = 4;
export const DIM_STATE: number = 5;
// 浮点比较容差：参数刻度换算含乘除，不能直接比相等。
export const PROBE_EPSILON: number = 1e-6;
// 越界探针幅度：足够跨越任何区间，又不会溢出 double 的有效范围。
export const PROBE_OUT_OF_RANGE: number = 1000;

// 单个参数在六个维度上的观测量：定位结果、声明形状与引擎行为逐项拆开，供用例体分别断言。
export class ParamProbeObs {
  public bucket: number = -1;
  public ordinal: number = -1;
  public dimension: number = -1;
  public found: boolean = false;
  public groupKey: string = '';
  public sceneIndex: number = -1;
  public paramIndex: number = -1;
  public paramKey: string = '';
  public kind: number = -1;
  public sceneCount: number = 0;
  public paramTotal: number = 0;
  public defaultLegal: boolean = false;
  public describeNonEmpty: boolean = false;
  public summaryHasKey: boolean = false;
  public lowExact: boolean = false;
  public highExact: boolean = false;
  public nanFallback: boolean = false;
  public stepAligned: boolean = false;
  public normalizeIdempotent: boolean = false;
  public neighborsKept: boolean = false;
  public summaryStable: boolean = false;
  public repeatStable: boolean = false;
  public selectIntegral: boolean = false;
  public toggleBinary: boolean = false;
}

class ParamSlot {
  public sceneIndex: number = -1;
  public paramIndex: number = -1;
}

function near(actual: number, expected: number, tolerance: number = PROBE_EPSILON): boolean {
  return Math.abs(actual - expected) <= tolerance;
}

function sameValues(left: number[], right: number[]): boolean {
  if (left.length !== right.length) {
    return false;
  }
  for (let index = 0; index < left.length; index++) {
    if (!near(left[index], right[index])) {
      return false;
    }
  }
  return true;
}

// 按桶编号取分组：0..18 为能力域，19..28 为专题页，越界返回 undefined。
export function groupAtBucket(bucket: number): GroupSpec | undefined {
  if (bucket < 0) {
    return undefined;
  }
  if (bucket < CAPABILITY_GROUPS.length) {
    return CAPABILITY_GROUPS[bucket];
  }
  const topicIndex: number = bucket - CAPABILITY_GROUPS.length;
  if (topicIndex < TOPIC_GROUPS.length) {
    return TOPIC_GROUPS[topicIndex];
  }
  return undefined;
}

// 统计分组声明的参数总数，与 native 侧读取的数组长度对应。
export function paramTotalOf(group: GroupSpec): number {
  let total: number = 0;
  for (let index = 0; index < group.scenes.length; index++) {
    total += group.scenes[index].params.length;
  }
  return total;
}

// 把组内第 ordinal 个参数定位到（场景下标，场景内参数下标），越界返回 -1。
function locateParam(group: GroupSpec, ordinal: number): ParamSlot {
  const slot: ParamSlot = new ParamSlot();
  let seen: number = 0;
  for (let sceneIndex = 0; sceneIndex < group.scenes.length; sceneIndex++) {
    const count: number = group.scenes[sceneIndex].params.length;
    if (ordinal < seen + count) {
      slot.sceneIndex = sceneIndex;
      slot.paramIndex = ordinal - seen;
      return slot;
    }
    seen += count;
  }
  return slot;
}

// 观测组内第 ordinal 个参数在指定维度上的行为，全部判定结果一次性采集回来。
export function probeParam(bucket: number, ordinal: number, dimension: number): ParamProbeObs {
  const observed: ParamProbeObs = new ParamProbeObs();
  observed.bucket = bucket;
  observed.ordinal = ordinal;
  observed.dimension = dimension;
  const group: GroupSpec | undefined = groupAtBucket(bucket);
  if (group === undefined) {
    return observed;
  }
  observed.groupKey = group.key;
  observed.sceneCount = group.scenes.length;
  observed.paramTotal = paramTotalOf(group);
  const slot: ParamSlot = locateParam(group, ordinal);
  observed.sceneIndex = slot.sceneIndex;
  observed.paramIndex = slot.paramIndex;
  if (slot.sceneIndex < 0 || slot.paramIndex < 0) {
    return observed;
  }
  observed.found = true;
  const scene: SceneSpec = group.scenes[slot.sceneIndex];
  const param: ParamSpec = scene.params[slot.paramIndex];
  observed.paramKey = param.key;
  observed.kind = param.kind;

  const defaults: number[] = ParamEngine.defaults(scene);
  const base: number[] = ParamEngine.normalize(scene, defaults);
  // 越界裁剪必须贴住边界：滑杆允许因步长对齐偏差一步，开关与下拉必须精确落值。
  const boundTolerance: number = param.kind === PARAM_RANGE && param.step > 0 ? param.step : PROBE_EPSILON;
  // 默认值至少要落在声明区间内：源码允许默认值不在步长网格上，因此不比较是否原样返回。
  const clampedDefault: number = ParamEngine.clamp(param, param.def);
  observed.defaultLegal = clampedDefault >= param.min - PROBE_EPSILON &&
    clampedDefault <= param.max + boundTolerance;
  observed.describeNonEmpty = ParamEngine.describe(param, param.def).length > 0;
  observed.summaryHasKey = ParamEngine.summary(scene, base).indexOf(param.key + '=') >= 0;
  observed.lowExact = near(ParamEngine.clamp(param, param.min - PROBE_OUT_OF_RANGE), param.min, boundTolerance);
  observed.highExact = near(ParamEngine.clamp(param, param.max + PROBE_OUT_OF_RANGE), param.max, boundTolerance);
  observed.nanFallback = near(ParamEngine.clamp(param, Number.NaN), param.def);

  // 刻度对齐：区间型按 step 换算整数步数，开关与下拉必须落在整数上。
  const middle: number = (param.min + param.max) / 2;
  const clampedMiddle: number = ParamEngine.clamp(param, middle);
  if (param.kind === PARAM_TOGGLE || param.kind === PARAM_SELECT) {
    observed.stepAligned = near(clampedMiddle, Math.round(clampedMiddle));
  } else if (param.step > 0) {
    const steps: number = (clampedMiddle - param.min) / param.step;
    observed.stepAligned = near(steps, Math.round(steps));
  } else {
    // 连续滑杆没有刻度，只要求裁剪结果留在区间内。
    observed.stepAligned = clampedMiddle >= param.min - PROBE_EPSILON &&
      clampedMiddle <= param.max + PROBE_EPSILON;
  }

  // 归一化幂等：越界数组先归一化，再次归一化结果不变。
  const wild: number[] = [];
  for (let index = 0; index < scene.params.length; index++) {
    wild.push(scene.params[index].max + PROBE_OUT_OF_RANGE);
  }
  const normalized: number[] = ParamEngine.normalize(scene, wild);
  observed.normalizeIdempotent = sameValues(normalized, ParamEngine.normalize(scene, normalized));

  // 组合维度：以归一化后的默认值为基线，改一个参数不得动到同场景其它参数。
  const changed: number[] = ParamEngine.withValue(scene, base, slot.paramIndex, param.min);
  let kept: boolean = changed.length === base.length;
  for (let index = 0; index < base.length; index++) {
    if (index !== slot.paramIndex && !near(changed[index], base[index])) {
      kept = false;
    }
  }
  observed.neighborsKept = kept;

  // 状态维度：摘要对已归一化的参数不变，重复改动同一个参数结果稳定。
  observed.summaryStable = ParamEngine.summary(scene, base) ===
    ParamEngine.summary(scene, ParamEngine.normalize(scene, base));
  const once: number[] = ParamEngine.withValue(scene, base, slot.paramIndex, param.max);
  const twice: number[] = ParamEngine.withValue(scene, once, slot.paramIndex, param.max);
  observed.repeatStable = sameValues(once, twice);

  // 形状约束：下拉只能是整数下标，开关只能落在 0/1。
  if (param.kind === PARAM_SELECT) {
    const rounded: number = ParamEngine.clamp(param, param.def + 0.4);
    observed.selectIntegral = near(rounded, Math.round(rounded));
  } else {
    observed.selectIntegral = true;
  }
  if (param.kind === PARAM_TOGGLE) {
    observed.toggleBinary = near(ParamEngine.clamp(param, 0.2), 0) && near(ParamEngine.clamp(param, 0.9), 1);
  } else {
    observed.toggleBinary = true;
  }
  return observed;
}
