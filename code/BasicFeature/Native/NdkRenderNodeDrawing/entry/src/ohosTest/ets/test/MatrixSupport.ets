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

import { expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { DrawContext } from '@kit.ArkUI';
import bridge from 'libentry.so';
import { PARAM_RANGE, PARAM_SELECT, PARAM_TOGGLE, ParamSpec, GroupSpec,
  SceneSpec } from '../../../main/ets/core/SchemaTypes';
import { ParamEngine } from '../../../main/ets/core/ParamEngine';
import { CAPABILITY_GROUPS } from './SceneDefaults';

export const TAG: string = '[Sample_NdkRenderNodeMatrixTest]';
export const DOMAIN: number = 0xF811;
// 单个场景最多接收的参数个数，与 cpp/capability/capability_type.h 的 MAX_SCENE_PARAMS 一致。
export const MAX_SCENE_PARAMS: number = 8;
// 夹取下界的探针值：远小于任何参数下界，期望被 clamp 回下界。
export const PROBE_MIN: number = -1000000;
// 刻度对齐容差：clamp 先夹紧再按刻度对齐，乘除会带出 1e-16 量级的越界。
export const CLAMP_EPSILON: number = 1e-9;
// 默认值文本的保留位数，用于抹平刻度对齐带来的浮点噪声。
export const DEFAULTS_DIGITS: number = 1000000;

// 数值相等判定：刻度对齐是乘除运算，同一份默认值再对齐一次可能漂移 1e-16，
// 直接比较会误报，因此用 CLAMP_EPSILON 作为容差。
export function almostEqual(left: number, right: number): boolean {
  return Math.abs(left - right) <= CLAMP_EPSILON;
}

// 占位类型：ArkTS 不允许给空对象字面量定型，这里用空类实例充当任意对象。
class PlainHolder {
}

// 默认值基线文本：引擎按刻度对齐默认值，1.5 这类声明值经乘除后可能变成 1.5000000000000002，
// 所以先保留 6 位小数再拼串，既保留冻结基线的作用，又不会因浮点噪声误报。
export function defaultsText(target: SceneSpec): string {
  const values: number[] = ParamEngine.defaults(target);
  const parts: string[] = [];
  for (let index = 0; index < values.length; index++) {
    parts.push(String(Math.round(values[index] * DEFAULTS_DIGITS) / DEFAULTS_DIGITS));
  }
  return parts.join(',');
}

// 空实现占位，保证导出符号与使用方一致。
export function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

// 假绘制上下文：普通对象没有 native 包装，napi_unwrap 失败后 native 入口直接返回。
// 因此这里只确认「参数编组与入口守卫不抛异常」，真实绘制结果由像素层套件断言。
export function fakeContext(): DrawContext {
  const holder: PlainHolder = new PlainHolder();
  return holder as object as DrawContext;
}

// 单条参数的声明契约：控件类型合法、区间自洽、默认值落在区间内、下拉选项与下标匹配。
export function verifyParamSpec(spec: ParamSpec, groupKey: string, sceneId: number): void {
  expect(spec.key.length > 0).assertTrue();
  expect(spec.kind === PARAM_RANGE || spec.kind === PARAM_TOGGLE || spec.kind === PARAM_SELECT).assertTrue();
  expect(spec.min <= spec.max).assertTrue();
  expect(spec.def >= spec.min && spec.def <= spec.max).assertTrue();
  if (spec.kind === PARAM_RANGE) {
    expect(spec.step > 0).assertTrue();
  }
  if (spec.kind === PARAM_TOGGLE) {
    expect(spec.def === 0 || spec.def === 1).assertTrue();
  }
  if (spec.kind === PARAM_SELECT) {
    expect(spec.options.length > 0).assertTrue();
    expect(Number.isInteger(spec.def)).assertTrue();
    expect(spec.def >= 0 && spec.def < spec.options.length).assertTrue();
  }
  logInfo('param ok: ' + groupKey + '/scene ' + sceneId.toString() + '/' + spec.key);
}

// 越界入参必须被夹回区间：下界以下取下界，上界以上取上界，下拉仍为整数下标。
// 刻度对齐是乘除运算，结果可能越界 1e-16，因此区间判定带 CLAMP_EPSILON 容差。
export function verifyParamClamp(spec: ParamSpec): void {
  const low: number = ParamEngine.clamp(spec, spec.min - 1000);
  const high: number = ParamEngine.clamp(spec, spec.max + 1000);
  expect(low >= spec.min - CLAMP_EPSILON && low <= spec.max + CLAMP_EPSILON).assertTrue();
  expect(high >= spec.min - CLAMP_EPSILON && high <= spec.max + CLAMP_EPSILON).assertTrue();
  if (spec.kind === PARAM_SELECT) {
    expect(Number.isInteger(low) && Number.isInteger(high)).assertTrue();
  }
}

// 逐场景校验：分组编号、场景编号、参数契约、默认值幂等与 native 入口可达。
export function verifyScene(domainIndex: number, sceneIndex: number): void {
  const group: GroupSpec = CAPABILITY_GROUPS[domainIndex];
  expect(group.id).assertEqual(domainIndex + 1);
  expect(sceneIndex < group.scenes.length).assertTrue();
  const target: SceneSpec = group.scenes[sceneIndex];
  expect(target.id).assertEqual(sceneIndex);
  expect(target.params.length <= MAX_SCENE_PARAMS).assertTrue();
  for (const spec of target.params) {
    verifyParamSpec(spec, group.key, target.id);
    verifyParamClamp(spec);
  }
  // 默认值必须幂等：把默认值原样送回 normalize，结果仍应落回默认值（带浮点容差）。
  const defaults: number[] = ParamEngine.defaults(target);
  const normalized: number[] = ParamEngine.normalize(target, defaults);
  expect(normalized.length).assertEqual(defaults.length);
  for (let index = 0; index < normalized.length; index++) {
    expect(almostEqual(normalized[index], defaults[index])).assertTrue();
  }
  const summary: string = ParamEngine.summary(target, defaults);
  for (const spec of target.params) {
    expect(summary.indexOf(spec.key + '=') >= 0).assertTrue();
  }
  let dispatched: boolean = false;
  try {
    bridge.nativeRenderScene(fakeContext(), 64, 64, group.id, target.id, defaults);
    dispatched = true;
  } catch (error) {
    logInfo('nativeRenderScene threw at ' + group.key + '/scene ' + target.id.toString());
  }
  expect(dispatched).assertTrue();
}
