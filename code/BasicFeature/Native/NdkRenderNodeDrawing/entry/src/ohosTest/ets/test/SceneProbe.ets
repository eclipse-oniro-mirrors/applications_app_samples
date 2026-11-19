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

import {
  GroupSpec, PARAM_RANGE, PARAM_SELECT, PARAM_TOGGLE, ParamSpec, SceneSpec
} from '../../../main/ets/core/SchemaTypes';
import { ParamEngine } from '../../../main/ets/core/ParamEngine';
import { groupAtBucket } from './ParamProbe';

// 浮点比较容差：场景级判定要把乘除换算的误差算进来。
export const SCENE_EPSILON: number = 1e-6;
// 越界探针幅度：足够跨越任何声明区间，又不会让 double 失去精度。
export const SCENE_OUT_OF_RANGE: number = 1000;

// 单场景在六个维度上的观测量：定位结果、声明形状与引擎行为逐项拆开，供用例体分别断言。
export class SceneProbeObs {
  public bucket: number = -1;
  public sceneIndex: number = -1;
  public dimension: number = -1;
  public found: boolean = false;
  public groupKey: string = '';
  public sceneTotal: number = 0;
  public sceneId: number = -1;
  public idMatchesIndex: boolean = false;
  public titleIsResource: boolean = false;
  public descIsResource: boolean = false;
  public paramCount: number = 0;
  public rangeCount: number = 0;
  public toggleCount: number = 0;
  public selectCount: number = 0;
  public keyUnique: boolean = false;
  public keyNonEmpty: boolean = false;
  public defaultLengthOk: boolean = false;
  public defaultInRange: boolean = false;
  public describeNonEmpty: boolean = false;
  public summaryHasAllKeys: boolean = false;
  public summaryStable: boolean = false;
  public boundsHold: boolean = false;
  public wildcardLengthOk: boolean = false;
  public nanDefaulted: boolean = false;
  public idempotentExtreme: boolean = false;
  public allInRange: boolean = false;
  public comboOrderOk: boolean = false;
  public specStable: boolean = false;
  public repeatStable: boolean = false;
  public inputUntouched: boolean = false;
}

function near(actual: number, expected: number, tolerance: number = SCENE_EPSILON): boolean {
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

// 滑杆允许因步长对齐偏差一格，开关与下拉必须精确落值。
function toleranceOf(param: ParamSpec): number {
  return param.kind === PARAM_RANGE && param.step > 0 ? param.step : SCENE_EPSILON;
}

// 取值是否全部落在各自声明区间内。
function allInRangeOf(scene: SceneSpec, values: number[]): boolean {
  if (values.length !== scene.params.length) {
    return false;
  }
  for (let index = 0; index < values.length; index++) {
    const param: ParamSpec = scene.params[index];
    if (values[index] < param.min - toleranceOf(param) || values[index] > param.max + toleranceOf(param)) {
      return false;
    }
  }
  return true;
}

// 摘要必须带出每个参数的「键=值」，否则面板状态栏会漏项。
function summaryHasAllKeysOf(scene: SceneSpec, summary: string): boolean {
  for (let index = 0; index < scene.params.length; index++) {
    if (summary.indexOf(scene.params[index].key + '=') < 0) {
      return false;
    }
  }
  return true;
}

// 摘要里参数的出现顺序必须等于声明顺序，否则 native 侧按下标取值会错位。
function orderOkOf(scene: SceneSpec, summary: string): boolean {
  let cursor: number = 0;
  for (let index = 0; index < scene.params.length; index++) {
    const at: number = summary.indexOf(scene.params[index].key + '=');
    if (at < cursor) {
      return false;
    }
    cursor = at;
  }
  return true;
}

function keysUniqueOf(scene: SceneSpec): boolean {
  for (let index = 0; index < scene.params.length; index++) {
    for (let other = index + 1; other < scene.params.length; other++) {
      if (scene.params[index].key === scene.params[other].key) {
        return false;
      }
    }
  }
  return true;
}

function keysNonEmptyOf(scene: SceneSpec): boolean {
  for (let index = 0; index < scene.params.length; index++) {
    if (scene.params[index].key.length === 0) {
      return false;
    }
  }
  return true;
}

function describeNonEmptyOf(scene: SceneSpec): boolean {
  for (let index = 0; index < scene.params.length; index++) {
    const param: ParamSpec = scene.params[index];
    if (ParamEngine.describe(param, param.def).length === 0) {
      return false;
    }
  }
  return true;
}

// 逐个把参数推到上下界：被推的参数贴住边界，其余参数保持基线。
function boundsHoldOf(scene: SceneSpec, base: number[]): boolean {
  for (let index = 0; index < scene.params.length; index++) {
    const param: ParamSpec = scene.params[index];
    const tolerance: number = toleranceOf(param);
    const low: number[] = ParamEngine.withValue(scene, base, index, param.min);
    if (!near(low[index], param.min, tolerance)) {
      return false;
    }
    const high: number[] = ParamEngine.withValue(scene, base, index, param.max);
    if (!near(high[index], param.max, tolerance)) {
      return false;
    }
    for (let other = 0; other < base.length; other++) {
      if (other === index) {
        continue;
      }
      if (!near(low[other], base[other]) || !near(high[other], base[other])) {
        return false;
      }
    }
  }
  return true;
}

// 观测指定分组下第 sceneIndex 个场景在指定维度上的行为，全部判定一次性采集回来。
export function probeScene(bucket: number, sceneIndex: number, dimension: number): SceneProbeObs {
  const observed: SceneProbeObs = new SceneProbeObs();
  observed.bucket = bucket;
  observed.sceneIndex = sceneIndex;
  observed.dimension = dimension;
  const group: GroupSpec | undefined = groupAtBucket(bucket);
  if (group === undefined) {
    return observed;
  }
  observed.groupKey = group.key;
  observed.sceneTotal = group.scenes.length;
  if (sceneIndex < 0 || sceneIndex >= group.scenes.length) {
    return observed;
  }
  observed.found = true;
  const scene: SceneSpec = group.scenes[sceneIndex];
  observed.sceneId = scene.id;
  observed.idMatchesIndex = scene.id === sceneIndex;
  // 生产 schema 的标题与说明统一传 $r，字面量只允许出现在用例探针数据里。
  observed.titleIsResource = typeof scene.title !== 'string';
  observed.descIsResource = typeof scene.desc !== 'string';

  const count: number = scene.params.length;
  observed.paramCount = count;
  for (let index = 0; index < count; index++) {
    const kind: number = scene.params[index].kind;
    if (kind === PARAM_RANGE) {
      observed.rangeCount++;
    } else if (kind === PARAM_TOGGLE) {
      observed.toggleCount++;
    } else if (kind === PARAM_SELECT) {
      observed.selectCount++;
    }
  }
  observed.keyUnique = keysUniqueOf(scene);
  observed.keyNonEmpty = keysNonEmptyOf(scene);
  observed.describeNonEmpty = describeNonEmptyOf(scene);

  const defaults: number[] = ParamEngine.defaults(scene);
  observed.defaultLengthOk = defaults.length === count;
  const base: number[] = ParamEngine.normalize(scene, defaults);
  observed.defaultInRange = allInRangeOf(scene, base);
  const summary: string = ParamEngine.summary(scene, base);
  observed.summaryHasAllKeys = summaryHasAllKeysOf(scene, summary);
  observed.summaryStable = summary.length > 0 &&
    summary === ParamEngine.summary(scene, ParamEngine.normalize(scene, base));
  observed.boundsHold = count === 0 ? true : boundsHoldOf(scene, base);

  // 非法输入维度：超长数组与 NaN 数组都必须被归一化收敛回声明形状。
  const over: number[] = [];
  for (let index = 0; index < count + 3; index++) {
    const target: ParamSpec = scene.params[index % (count === 0 ? 1 : count)];
    over.push(target.max + SCENE_OUT_OF_RANGE);
  }
  observed.wildcardLengthOk = count === 0 ? ParamEngine.normalize(scene, over).length === 0 :
    ParamEngine.normalize(scene, over).length === count;
  const nanValues: number[] = [];
  for (let index = 0; index < count; index++) {
    nanValues.push(Number.NaN);
  }
  observed.nanDefaulted = sameValues(ParamEngine.normalize(scene, nanValues), base);

  // 极值维度：全参数推过界后归一化幂等，且取值回到区间内。
  const extreme: number[] = [];
  for (let index = 0; index < count; index++) {
    extreme.push(scene.params[index].max + SCENE_OUT_OF_RANGE);
  }
  const extremeNorm: number[] = ParamEngine.normalize(scene, extreme);
  observed.idempotentExtreme = sameValues(extremeNorm, ParamEngine.normalize(scene, extremeNorm));
  observed.allInRange = allInRangeOf(scene, extremeNorm);

  // 组合维度：前半推到上界、后半推到下界，摘要顺序仍等于声明顺序。
  const combo: number[] = [];
  for (let index = 0; index < count; index++) {
    combo.push(index % 2 === 0 ? scene.params[index].max : scene.params[index].min);
  }
  const comboNorm: number[] = ParamEngine.normalize(scene, combo);
  observed.allInRange = observed.allInRange && allInRangeOf(scene, comboNorm);
  observed.comboOrderOk = orderOkOf(scene, ParamEngine.summary(scene, comboNorm));

  // 状态维度：声明不被改写、连续两次改动结果一致、withValue 不写回入参。
  const defaultsAgain: number[] = ParamEngine.defaults(scene);
  observed.specStable = sameValues(defaults, defaultsAgain) && defaults !== defaultsAgain;
  if (count === 0) {
    observed.repeatStable = true;
    observed.inputUntouched = true;
  } else {
    const first: number[] = ParamEngine.withValue(scene, base, 0, scene.params[0].max);
    const second: number[] = ParamEngine.withValue(scene, first, 0, scene.params[0].max);
    observed.repeatStable = sameValues(first, second);
    const guard: number[] = ParamEngine.normalize(scene, ParamEngine.defaults(scene));
    const snapshot: number[] = [];
    for (let index = 0; index < guard.length; index++) {
      snapshot.push(guard[index]);
    }
    ParamEngine.withValue(scene, guard, 0, scene.params[0].min);
    observed.inputUntouched = sameValues(guard, snapshot);
  }
  return observed;
}
