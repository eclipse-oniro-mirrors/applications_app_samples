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

import { FlowItemModel } from './MediaModels';

/** Generic asynchronous delay used by async test cases. */
export async function delayMs(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

/** Build a deterministic waterfall item for a given index. */
export function createFlowItem(index: number): FlowItemModel {
  return new FlowItemModel(
    'id_' + index.toString(),
    'user_' + index.toString(),
    'userName_' + index.toString(),
    'text_' + index.toString(),
    'media_full_screen_video' + ((index % 4) + 1).toString() + '.mp4',
    'media_full_screen_preview' + ((index % 4) + 1).toString()
  );
}

/** Build a list of deterministic waterfall items. */
export function createFlowItems(count: number): FlowItemModel[] {
  const result: FlowItemModel[] = [];
  for (let i = 0; i < count; i++) {
    result.push(createFlowItem(i));
  }
  return result;
}

/** Absolute difference between two numbers. */
export function absDiff(a: number, b: number): number {
  const diff: number = a - b;
  if (diff < 0) {
    return -diff;
  }
  return diff;
}

/** Tolerance comparison for floating point results. */
export function nearlyEqual(a: number, b: number, tolerance: number): boolean {
  return absDiff(a, b) <= tolerance;
}

/** Clamp helper shared by several controllers. */
export function clamp(value: number, min: number, max: number): number {
  if (value < min) {
    return min;
  }
  if (value > max) {
    return max;
  }
  return value;
}

/** Sum of a numeric array. */
export function sum(values: number[]): number {
  let total: number = 0;
  for (let i = 0; i < values.length; i++) {
    total += values[i];
  }
  return total;
}

/** Average of a numeric array, zero for empty input. */
export function average(values: number[]): number {
  if (values.length === 0) {
    return 0;
  }
  return sum(values) / values.length;
}
