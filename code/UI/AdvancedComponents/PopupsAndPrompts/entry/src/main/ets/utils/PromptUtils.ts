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

/** Provides Prompt Utils helpers for the sample. */
export class PromptUtils {
  static formatCount(label: string, count: number): string {
    return `${label}: ${count}`;
  }

  static toggleShown(shown: boolean): boolean {
    return !shown;
  }

  static describeRange(start: number, end: number): string {
    return `range=${start}-${end}`;
  }

  static selectionSummary(start: number, end: number, max: number): string {
    const range = PromptUtils.clampRange(start, end, max);
    return `selected ${range[0]}-${range[1]} of ${max}`;
  }

  static actionSummary(label: string, count: number): string {
    return `${label} x${count}`;
  }

  static clampRange(start: number, end: number, max: number): number[] {
    let left = start < 0 ? 0 : start;
    let right = end < 0 ? 0 : end;
    if (left > max) {
      left = max;
    }
    if (right > max) {
      right = max;
    }
    if (right < left) {
      const temp = left;
      left = right;
      right = temp;
    }
    return [left, right];
  }
}
