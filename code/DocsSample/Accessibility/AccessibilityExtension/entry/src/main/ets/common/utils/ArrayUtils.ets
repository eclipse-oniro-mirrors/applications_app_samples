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

import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';
const EMPTY_FALLBACK: number = 0;
const COMMA: string = ',';
const SLICE_START: number = 1;
const SLICE_END: number = 3;

/**
 * Aggregations over number arrays used by the ohosTest utility suites.
 *
 * None of the members mutate their argument; every aggregation allocates a new
 * container so that repeated calls stay idempotent.
 */
export class ArrayUtils {
  /**
   * Reports whether the array holds no element.
   */
  static isEmpty(values: number[]): boolean {
    hilog.info(DOMAIN, TAG, 'ArrayUtils.isEmpty size=%{public}d', values.length);
    return values.length === 0;
  }

  /**
   * Adds up every element, an empty array yields zero.
   */
  static sum(values: number[]): number {
    hilog.info(DOMAIN, TAG, 'ArrayUtils.sum size=%{public}d', values.length);
    let total: number = 0;
    let index: number = 0;
    while (index < values.length) {
      total = total + values[index];
      index = index + 1;
    }
    return total;
  }

  /**
   * Returns the largest element, an empty array yields zero.
   */
  static maxOf(values: number[]): number {
    hilog.info(DOMAIN, TAG, 'ArrayUtils.maxOf size=%{public}d', values.length);
    if (values.length === 0) {
      return EMPTY_FALLBACK;
    }
    let best: number = values[0];
    let index: number = 1;
    while (index < values.length) {
      if (values[index] > best) {
        best = values[index];
      }
      index = index + 1;
    }
    return best;
  }

  /**
   * Returns the smallest element, an empty array yields zero.
   */
  static minOf(values: number[]): number {
    hilog.info(DOMAIN, TAG, 'ArrayUtils.minOf size=%{public}d', values.length);
    if (values.length === 0) {
      return EMPTY_FALLBACK;
    }
    let best: number = values[0];
    let index: number = 1;
    while (index < values.length) {
      if (values[index] < best) {
        best = values[index];
      }
      index = index + 1;
    }
    return best;
  }

  /**
   * Arithmetic mean, an empty array yields zero instead of NaN.
   */
  static average(values: number[]): number {
    hilog.info(DOMAIN, TAG, 'ArrayUtils.average size=%{public}d', values.length);
    if (values.length === 0) {
      return EMPTY_FALLBACK;
    }
    return ArrayUtils.sum(values) / values.length;
  }

  /**
   * Counts the elements strictly greater than the bound.
   */
  static countGreater(values: number[], bound: number): number {
    hilog.info(DOMAIN, TAG, 'ArrayUtils.countGreater bound=%{public}d', bound);
    let total: number = 0;
    let index: number = 0;
    while (index < values.length) {
      if (values[index] > bound) {
        total = total + 1;
      }
      index = index + 1;
    }
    return total;
  }

  /**
   * Returns the first index of the target or -1 when absent.
   */
  static indexOfValue(values: number[], target: number): number {
    hilog.info(DOMAIN, TAG, 'ArrayUtils.indexOfValue target=%{public}d', target);
    let index: number = 0;
    while (index < values.length) {
      if (values[index] === target) {
        return index;
      }
      index = index + 1;
    }
    return -1;
  }

  /**
   * Reports whether the target occurs at least once.
   */
  static containsValue(values: number[], target: number): boolean {
    hilog.info(DOMAIN, TAG, 'ArrayUtils.containsValue target=%{public}d', target);
    return ArrayUtils.indexOfValue(values, target) >= 0;
  }

  /**
   * Keeps the first occurrence of every distinct element.
   */
  static distinct(values: number[]): number[] {
    hilog.info(DOMAIN, TAG, 'ArrayUtils.distinct size=%{public}d', values.length);
    const out: number[] = [];
    let index: number = 0;
    while (index < values.length) {
      let seen: boolean = false;
      let scan: number = 0;
      while (scan < out.length) {
        if (out[scan] === values[index]) {
          seen = true;
          break;
        }
        scan = scan + 1;
      }
      if (!seen) {
        out.push(values[index]);
      }
      index = index + 1;
    }
    return out;
  }

  /**
   * Copies the array in reverse order.
   */
  static reversed(values: number[]): number[] {
    hilog.info(DOMAIN, TAG, 'ArrayUtils.reversed size=%{public}d', values.length);
    const out: number[] = [];
    let index: number = values.length - 1;
    while (index >= 0) {
      out.push(values[index]);
      index = index - 1;
    }
    return out;
  }

  /**
   * Copies the array sorted in ascending order using insertion sort.
   */
  static sortedAsc(values: number[]): number[] {
    hilog.info(DOMAIN, TAG, 'ArrayUtils.sortedAsc size=%{public}d', values.length);
    const out: number[] = values.slice();
    let index: number = 1;
    while (index < out.length) {
      const current: number = out[index];
      let scan: number = index - 1;
      while (scan >= 0 && out[scan] > current) {
        out[scan + 1] = out[scan];
        scan = scan - 1;
      }
      out[scan + 1] = current;
      index = index + 1;
    }
    return out;
  }

  /**
   * Joins every element with the comma separator.
   */
  static joinComma(values: number[]): string {
    hilog.info(DOMAIN, TAG, 'ArrayUtils.joinComma size=%{public}d', values.length);
    let out: string = '';
    let index: number = 0;
    while (index < values.length) {
      if (index > 0) {
        out = out + COMMA;
      }
      out = out + values[index].toString();
      index = index + 1;
    }
    return out;
  }

  /**
   * Returns the middle window [1, 3) of the array.
   */
  static sliceSafe(values: number[]): number[] {
    hilog.info(DOMAIN, TAG, 'ArrayUtils.sliceSafe size=%{public}d', values.length);
    return values.slice(SLICE_START, SLICE_END);
  }

  /**
   * Appends a fixed suffix array without touching the source.
   */
  static concatAll(values: number[], extra: number[]): number[] {
    hilog.info(DOMAIN, TAG, 'ArrayUtils.concatAll size=%{public}d', values.length);
    return values.concat(extra);
  }
}
