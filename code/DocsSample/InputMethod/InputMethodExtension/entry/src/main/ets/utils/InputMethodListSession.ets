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

/**
 * 输入法切换列表（@ohos.inputMethodList）的数据描述层。
 *
 * InputMethodListDialog 是声明式 UI 组件，图标必须是 Resource，只能在 .ets 组件里构造；
 * 这里把"列表里有几个模式项、默认选谁、点了第几项"抽成纯数据，
 * 页面负责把 spec 换成图标，用例负责断言下标与文案，两边不重复实现规则。
 */

import { LIST_PATTERN_COUNT } from '../common/AppConstants';

export class PatternSpec {
  public index: number;
  public label: string;
  public hint: string;

  constructor(index: number, label: string, hint: string) {
    this.index = index;
    this.label = label;
    this.hint = hint;
  }

  display(): string {
    return `${this.index + 1}. ${this.label}（${this.hint}）`;
  }
}

/** 与 LIST_PATTERN_COUNT 对齐的模式项：中文输入 / 英文输入 */
export function patternSpecs(count: number = LIST_PATTERN_COUNT): PatternSpec[] {
  const all: PatternSpec[] = [
    new PatternSpec(0, '中文输入', '拼音候选，适用于文本编辑框'),
    new PatternSpec(1, '英文输入', '直接上屏，适用于密码外的普通输入')
  ];
  return all.slice(0, count);
}

/** 越界下标回落到第一项：默认选中值非法时不能让对话框拿不到选中项 */
export function clampSelected(index: number, count: number): number {
  if (count <= 0 || index < 0 || index >= count) {
    return 0;
  }
  return index;
}

/** 真越界返回 undefined：action 回调收到非法下标时要能看出来，不能悄悄冒用第一项 */
export function specAt(index: number, specs: PatternSpec[] = patternSpecs()): PatternSpec | undefined {
  if (index < 0 || index >= specs.length) {
    return undefined;
  }
  return specs[index];
}

/** 页面标题与日志用：一眼看清列表里有什么 */
export function listSummary(specs: PatternSpec[] = patternSpecs()): string {
  if (specs.length === 0) {
    return '没有模式项';
  }
  const labels = specs.map((item: PatternSpec) => item.label).join('、');
  return `${specs.length} 个模式项：${labels}；默认选中第 ${clampSelected(0, specs.length) + 1} 项`;
}

/** 观察 action 回调：把下标翻译成"用户点了哪一项" */
export function actionText(index: number, specs: PatternSpec[] = patternSpecs()): string {
  const spec = specAt(index, specs);
  if (spec === undefined) {
    return specs.length === 0 ? `回调下标 ${index}：列表为空，无可选项`
      : `回调下标 ${index}：超出范围（共 ${specs.length} 项）`;
  }
  return `回调下标 ${index}：${spec.label}`;
}
