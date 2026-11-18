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

import bridge, { TextMeasureResult } from 'libentry.so';

// 浮点比较容差：排版引擎返回的是 float 提升的 double。
export const MEASURE_EPSILON: number = 1e-6;
// 基线入参：与页面默认字号、常规排版宽度一致。
export const MEASURE_TEXT: string = 'RenderNode';
export const MEASURE_FONT_SIZE: number = 20;
export const MEASURE_MAX_WIDTH: number = 400;
// 字号夹取区间，与 cpp/drawing/drawing_text.cpp 的 MIN_FONT_SIZE 与 MAX_FONT_SIZE 一致。
export const MEASURE_MIN_FONT: number = 12;
export const MEASURE_MAX_FONT: number = 96;
// 空文本的宽度是负哨兵，正常文本为正；用于区分「读到了文本」与「文本退化为空串」。
export const EMPTY_TEXT_WIDTH_LIMIT: number = 0;

// 实参槽位：探针按槽位替换单个实参，其余槽位保持基线。
export const SLOT_TEXT: number = 0;
export const SLOT_FONT: number = 1;
export const SLOT_WIDTH: number = 2;
// 实参形态：真值、undefined 与 null 三种，对应 d.ts 强类型之外的实际入参。
export const FORM_VALUE: number = 0;
export const FORM_UNDEFINED: number = 1;
export const FORM_NULL: number = 2;

class PlainHolder {
}

// d.ts 把三个入参声明为 string/number，运行期仍可能收到其它类型；
// 松散签名只用于注入这些实参，等价于调用方用 JS 动态调用 native 入口。
type LooseMeasure = (text: Object | null | undefined, fontSize: Object | null | undefined,
  maxWidth: Object | null | undefined) => TextMeasureResult | undefined;

const LOOSE_MEASURE: LooseMeasure = bridge.nativeMeasureText as object as LooseMeasure;

function near(actual: number, expected: number, tolerance: number = MEASURE_EPSILON): boolean {
  return Math.abs(actual - expected) <= tolerance;
}

function sameMeasure(left: TextMeasureResult | undefined, right: TextMeasureResult | undefined): boolean {
  if (left === undefined || right === undefined) {
    return left === right;
  }
  return near(left.width, right.width) && near(left.height, right.height);
}

// 观测量的采集口径：调用是否安全、返回值形态、以及结果与两条基线的等价关系。
export class MeasureObs {
  public slot: number = -1;
  public form: number = -1;
  public valueKind: string = '';
  public callSafe: boolean = false;
  public returned: boolean = false;
  public width: number = 0;
  public height: number = 0;
  public widthPositive: boolean = false;
  public widthNonPositive: boolean = false;
  public heightPositive: boolean = false;
  public heightIsFontSize: boolean = false;
  public finite: boolean = false;
  public fieldCount: number = 0;
  public hasWidthField: boolean = false;
  public hasHeightField: boolean = false;
  public sameAsEmpty: boolean = false;
  public sameAsBaseline: boolean = false;
  public repeatStable: boolean = false;
  public belowNaturalWidth: boolean = false;
}

function kindOf(value: Object | null | undefined, form: number): string {
  if (form === FORM_UNDEFINED) {
    return 'undefined';
  }
  if (form === FORM_NULL) {
    return 'null';
  }
  return typeof value;
}

// 实际生效的排版宽度上限：只有宽度槽位注入真值时才偏离基线。
function allottedOf(slot: number, form: number, value: Object): number {
  if (slot !== SLOT_WIDTH || form !== FORM_VALUE) {
    return MEASURE_MAX_WIDTH;
  }
  if (typeof value === 'number') {
    return value as number;
  }
  return MEASURE_MAX_WIDTH;
}

// 按槽位与形态组装实参：被替换的槽位取注入值，其余槽位取基线值。
function invokeWith(slot: number, form: number, value: Object): TextMeasureResult | undefined {
  let text: Object | null | undefined = MEASURE_TEXT;
  let fontSize: Object | null | undefined = MEASURE_FONT_SIZE;
  let maxWidth: Object | null | undefined = MEASURE_MAX_WIDTH;
  let injected: Object | null | undefined = value;
  if (form === FORM_UNDEFINED) {
    injected = undefined;
  }
  if (form === FORM_NULL) {
    injected = null;
  }
  if (slot === SLOT_TEXT) {
    text = injected;
  }
  if (slot === SLOT_FONT) {
    fontSize = injected;
  }
  if (slot === SLOT_WIDTH) {
    maxWidth = injected;
  }
  return LOOSE_MEASURE(text, fontSize, maxWidth);
}

// 强类型入口，用于生成对照基线。
export function measureTyped(text: string, fontSize: number, maxWidth: number): TextMeasureResult | undefined {
  return bridge.nativeMeasureText(text, fontSize, maxWidth);
}

function emptyBaseline(): TextMeasureResult | undefined {
  return bridge.nativeMeasureText('', MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
}

function textBaseline(): TextMeasureResult | undefined {
  return bridge.nativeMeasureText(MEASURE_TEXT, MEASURE_FONT_SIZE, MEASURE_MAX_WIDTH);
}

function fill(observed: MeasureObs, slot: number, form: number, value: Object,
  measured: TextMeasureResult | undefined): MeasureObs {
  observed.slot = slot;
  observed.form = form;
  observed.valueKind = kindOf(value, form);
  observed.returned = measured !== undefined;
  if (measured === undefined) {
    return observed;
  }
  observed.width = measured.width;
  observed.height = measured.height;
  observed.widthPositive = measured.width > 0;
  observed.widthNonPositive = measured.width <= EMPTY_TEXT_WIDTH_LIMIT;
  observed.heightPositive = measured.height > 0;
  observed.heightIsFontSize = near(measured.height, MEASURE_FONT_SIZE);
  observed.finite = Number.isFinite(measured.width) && Number.isFinite(measured.height);
  const keys: string[] = Object.keys(measured);
  observed.fieldCount = keys.length;
  observed.hasWidthField = keys.indexOf('width') >= 0;
  observed.hasHeightField = keys.indexOf('height') >= 0;
  observed.sameAsEmpty = sameMeasure(measured, emptyBaseline());
  observed.sameAsBaseline = sameMeasure(measured, textBaseline());
  observed.belowNaturalWidth = measured.width <= allottedOf(slot, form, value) + MEASURE_EPSILON;
  // 复核：同一入参再测一次必须给出一致结果，用于排除测量过程的随机性。
  observed.repeatStable = sameMeasure(measured, invokeWith(slot, form, value));
  return observed;
}

// 注入真值实参：覆盖类型错误、数值极值与常规取值。
export function probeValue(slot: number, value: Object): MeasureObs {
  const observed: MeasureObs = new MeasureObs();
  let measured: TextMeasureResult | undefined = undefined;
  try {
    measured = invokeWith(slot, FORM_VALUE, value);
    observed.callSafe = true;
  } catch (error) {
    observed.callSafe = false;
  }
  return fill(observed, slot, FORM_VALUE, value, measured);
}

// 注入空值实参：覆盖 undefined 与 null 两种缺省形态。
export function probeAbsent(slot: number, useNull: boolean): MeasureObs {
  const observed: MeasureObs = new MeasureObs();
  const form: number = useNull ? FORM_NULL : FORM_UNDEFINED;
  const placeholder: PlainHolder = new PlainHolder();
  let measured: TextMeasureResult | undefined = undefined;
  try {
    measured = invokeWith(slot, form, placeholder);
    observed.callSafe = true;
  } catch (error) {
    observed.callSafe = false;
  }
  return fill(observed, slot, form, placeholder, measured);
}

// 全槽位拒绝：三个实参同时非法，用于确认校验顺序不会漏掉组合。
export function probeAllInvalid(text: Object, fontSize: Object, maxWidth: Object): MeasureObs {
  const observed: MeasureObs = new MeasureObs();
  let measured: TextMeasureResult | undefined = undefined;
  try {
    measured = LOOSE_MEASURE(text, fontSize, maxWidth);
    observed.callSafe = true;
  } catch (error) {
    observed.callSafe = false;
  }
  observed.returned = measured !== undefined;
  if (measured === undefined) {
    return observed;
  }
  observed.width = measured.width;
  observed.height = measured.height;
  observed.widthPositive = measured.width > 0;
  observed.widthNonPositive = measured.width <= EMPTY_TEXT_WIDTH_LIMIT;
  observed.heightPositive = measured.height > 0;
  observed.heightIsFontSize = near(measured.height, MEASURE_FONT_SIZE);
  observed.finite = Number.isFinite(measured.width) && Number.isFinite(measured.height);
  observed.fieldCount = Object.keys(measured).length;
  observed.sameAsEmpty = sameMeasure(measured, emptyBaseline());
  observed.sameAsBaseline = sameMeasure(measured, textBaseline());
  return observed;
}

// 合法入参测量：返回观测量，用于数值域与文本域的常规断言。
export function probeTyped(text: string, fontSize: number, maxWidth: number): MeasureObs {
  const observed: MeasureObs = new MeasureObs();
  const placeholder: PlainHolder = new PlainHolder();
  let measured: TextMeasureResult | undefined = undefined;
  try {
    measured = bridge.nativeMeasureText(text, fontSize, maxWidth);
    observed.callSafe = true;
  } catch (error) {
    observed.callSafe = false;
  }
  const filled: MeasureObs = fill(observed, SLOT_TEXT, FORM_VALUE, placeholder, measured);
  filled.valueKind = 'string';
  filled.width = measured === undefined ? 0 : measured.width;
  // 排版宽度上限：未换行时宽度不超过入参宽度。
  filled.belowNaturalWidth = measured !== undefined && measured.width <= maxWidth + MEASURE_EPSILON;
  // 强类型入口没有占位对象参与，直接重放同一组实参做幂等复核。
  filled.repeatStable = measured !== undefined && sameMeasure(measured, measureTyped(text, fontSize, maxWidth));
  return filled;
}
