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

// 能力域编号，与 cpp/capability/capability_type.h 中的 CapabilityGroup 一一对应。
export const GROUP_CANVAS: number = 1;
export const GROUP_GEOMETRY: number = 2;
export const GROUP_PAINT: number = 3;
export const GROUP_COLOR: number = 4;
export const GROUP_COLOR_FILTER: number = 5;
export const GROUP_SHADER: number = 6;
export const GROUP_MASK_FILTER: number = 7;
export const GROUP_IMAGE_FILTER: number = 8;
export const GROUP_BITMAP: number = 9;
export const GROUP_PIXELMAP: number = 10;
export const GROUP_IMAGE_IO: number = 11;
export const GROUP_FONT: number = 12;
export const GROUP_TEXTBLOB: number = 13;
export const GROUP_TYPOGRAPHY: number = 14;
export const GROUP_SHADOW: number = 15;
export const GROUP_MATRIX: number = 16;
export const GROUP_RECORD: number = 17;
export const GROUP_OFFSCREEN: number = 18;
export const GROUP_ERROR: number = 19;
export const GROUP_COUNT: number = 19;

// 参数控件类型：滑杆、开关、下拉选择。
export const PARAM_RANGE: number = 0;
export const PARAM_TOGGLE: number = 1;
export const PARAM_SELECT: number = 2;

// 场景与能力域的标题/说明：生产代码统一传 $r 资源以支持三语言，用例中的探针数据允许直接传字面量。
export type SceneText = Resource | string;

// 单个参数的描述：native 侧按下标读取，因此顺序即协议。
export class ParamSpec {
  public key: string;
  public kind: number;
  public min: number;
  public max: number;
  public step: number;
  public def: number;
  public unit: string;
  public options: string[];

  constructor(key: string, kind: number, def: number, min: number, max: number, step: number, unit: string,
    options: string[]) {
    this.key = key;
    this.kind = kind;
    this.def = def;
    this.min = min;
    this.max = max;
    this.step = step;
    this.unit = unit;
    this.options = options;
  }
}

// 一个可切换的绘制场景。
export class SceneSpec {
  public id: number;
  public title: SceneText;
  public desc: SceneText;
  public params: ParamSpec[];

  constructor(id: number, title: SceneText, desc: SceneText, params: ParamSpec[]) {
    this.id = id;
    this.title = title;
    this.desc = desc;
    this.params = params;
  }
}

// 一个能力域：包含若干场景与说明。
export class GroupSpec {
  public id: number;
  public key: string;
  public title: SceneText;
  public desc: SceneText;
  public scenes: SceneSpec[];

  constructor(id: number, key: string, title: SceneText, desc: SceneText, scenes: SceneSpec[]) {
    this.id = id;
    this.key = key;
    this.title = title;
    this.desc = desc;
    this.scenes = scenes;
  }
}

export function rangeParam(key: string, unit: string, def: number, min: number, max: number, step: number): ParamSpec {
  return new ParamSpec(key, PARAM_RANGE, def, min, max, step, unit, []);
}

export function toggleParam(key: string, def: boolean): ParamSpec {
  return new ParamSpec(key, PARAM_TOGGLE, def ? 1 : 0, 0, 1, 1, '', []);
}

export function selectParam(key: string, def: number, options: string[]): ParamSpec {
  const max: number = options.length - 1 < 0 ? 0 : options.length - 1;
  return new ParamSpec(key, PARAM_SELECT, def, 0, max, 1, '', options);
}

export function scene(id: number, title: SceneText, desc: SceneText, params: ParamSpec[]): SceneSpec {
  return new SceneSpec(id, title, desc, params);
}

export function createGroup(id: number, key: string, title: SceneText, desc: SceneText,
  scenes: SceneSpec[]): GroupSpec {
  return new GroupSpec(id, key, title, desc, scenes);
}
