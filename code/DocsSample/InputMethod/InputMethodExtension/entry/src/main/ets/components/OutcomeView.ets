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
 * CallOutcome → ResultRow 的统一映射。
 * 三个演示页都要把"调了什么、结果如何"铺成列表，映射规则放在一处，
 * 避免同一状态在不同页面出现不同颜色。
 */

import { ApiStatus, CallOutcome } from '../model/CallOutcome';
import { WidgetTone } from './CommonWidgets';
import { ResultRow } from './ResultList';

export function outcomeTone(status: ApiStatus): WidgetTone {
  switch (status) {
    case ApiStatus.OK:
      return WidgetTone.SUCCESS;
    case ApiStatus.INPUT_METHOD:
      // 身份不符在本示例里是"预期内的负向结果"，黄色比红色更准确
      return WidgetTone.WARNING;
    case ApiStatus.INVALID_INPUT:
      return WidgetTone.WARNING;
    default:
      return WidgetTone.DANGER;
  }
}

export function outcomeRow(outcome: CallOutcome): ResultRow {
  return new ResultRow(outcome.describe(), outcome.describeDetail(), outcomeTone(outcome.status));
}

export function outcomeRows(list: CallOutcome[]): ResultRow[] {
  return list.map((item: CallOutcome) => outcomeRow(item));
}
