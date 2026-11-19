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

import { PARAM_SELECT, PARAM_TOGGLE, ParamSpec, SceneSpec } from './SchemaTypes';

const MAX_DIGITS: number = 3;

// 由步长反推需要展示的小数位：0.05 需要 2 位，0.25 也需要 2 位，避免四舍五入后看成 0.3。
function fractionDigits(step: number): number {
  if (!(step > 0)) {
    return 1;
  }
  for (let digits = 1; digits <= MAX_DIGITS; digits++) {
    const scaled: number = step * Math.pow(10, digits);
    if (Math.abs(scaled - Math.round(scaled)) < 1e-6) {
      return digits;
    }
  }
  return MAX_DIGITS;
}

// 参数引擎：负责默认值、范围裁剪与展示文案，保证 native 侧收到的是合法数值数组。
export class ParamEngine {
  // 取场景默认参数，长度与参数声明顺序一致。
  static defaults(spec: SceneSpec): number[] {
    const values: number[] = [];
    for (let index = 0; index < spec.params.length; index++) {
      values.push(spec.params[index].def);
    }
    return values;
  }

  // 按控件类型裁剪到合法区间，开关固定 0/1，下拉固定为整数下标。
  static clamp(spec: ParamSpec, value: number): number {
    if (Number.isNaN(value)) {
      return spec.def;
    }
    if (spec.kind === PARAM_TOGGLE) {
      return value > 0.5 ? 1 : 0;
    }
    let result: number = value;
    if (result < spec.min) {
      result = spec.min;
    }
    if (result > spec.max) {
      result = spec.max;
    }
    if (spec.kind === PARAM_SELECT) {
      return Math.round(result);
    }
    if (spec.step > 0) {
      const steps: number = Math.round((result - spec.min) / spec.step);
      // 步长对齐后仍可能因浮点误差越界（如 0.1 + 18 * 0.05 = 1.0000000000000002），需要再夹紧一次。
      const aligned: number = spec.min + steps * spec.step;
      result = Math.min(Math.max(aligned, spec.min), spec.max);
    }
    return result;
  }

  // 校正任意外部输入：长度对齐、逐项裁剪。
  static normalize(spec: SceneSpec, values: number[]): number[] {
    const result: number[] = [];
    for (let index = 0; index < spec.params.length; index++) {
      const raw: number = index < values.length ? values[index] : spec.params[index].def;
      result.push(ParamEngine.clamp(spec.params[index], raw));
    }
    return result;
  }

  // 面板右侧展示文案。
  static describe(spec: ParamSpec, value: number): string {
    if (spec.kind === PARAM_TOGGLE) {
      return value > 0.5 ? 'on' : 'off';
    }
    if (spec.kind === PARAM_SELECT) {
      const optionIndex: number = Math.round(value);
      if (optionIndex >= 0 && optionIndex < spec.options.length) {
        return spec.options[optionIndex];
      }
      return '-';
    }
    const digits: number = spec.step >= 1 ? 0 : fractionDigits(spec.step);
    const text: string = value.toFixed(digits);
    return spec.unit.length > 0 ? text + ' ' + spec.unit : text;
  }

  // 变更单个参数并返回新数组，避免直接改写调用方持有的引用。
  static withValue(spec: SceneSpec, values: number[], index: number, value: number): number[] {
    const next: number[] = ParamEngine.normalize(spec, values);
    if (index >= 0 && index < next.length) {
      next[index] = ParamEngine.clamp(spec.params[index], value);
    }
    return next;
  }

  // 参数摘要，用于页面底部状态栏与日志。
  static summary(spec: SceneSpec, values: number[]): string {
    const parts: string[] = [];
    for (let index = 0; index < spec.params.length; index++) {
      const value: number = index < values.length ? values[index] : spec.params[index].def;
      parts.push(spec.params[index].key + '=' + ParamEngine.describe(spec.params[index], value));
    }
    return parts.join(', ');
  }
}
