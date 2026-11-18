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
const PAIR_SEPARATOR: string = '=';
const EMPTY_TEXT: string = '';
const NOT_FOUND: number = -1;
const FIRST_INDEX: number = 0;

/**
 * Ordered map helpers backing the ohosTest utility suites.
 *
 * All members treat the argument as read only and return freshly allocated
 * containers, which keeps the suites free of shared state.
 */
export class ObjectUtils {
  /**
   * Reports whether the map holds no entry.
   */
  static isEmptyMap(entries: Map<string, string>): boolean {
    hilog.info(DOMAIN, TAG, 'ObjectUtils.isEmptyMap size=%{public}d', entries.size);
    return entries.size === 0;
  }

  /**
   * Returns the entry count of the map.
   */
  static sizeOf(entries: Map<string, string>): number {
    hilog.info(DOMAIN, TAG, 'ObjectUtils.sizeOf size=%{public}d', entries.size);
    return entries.size;
  }

  /**
   * Returns every key sorted in ascending order.
   */
  static keysOf(entries: Map<string, string>): string[] {
    hilog.info(DOMAIN, TAG, 'ObjectUtils.keysOf size=%{public}d', entries.size);
    const keys: string[] = [];
    entries.forEach((value: string, key: string) => {
      keys.push(key);
    });
    return ObjectUtils.sortText(keys);
  }

  /**
   * Returns every value ordered by the sorted key sequence.
   */
  static valuesOf(entries: Map<string, string>): string[] {
    hilog.info(DOMAIN, TAG, 'ObjectUtils.valuesOf size=%{public}d', entries.size);
    const keys: string[] = ObjectUtils.keysOf(entries);
    const values: string[] = [];
    let index: number = 0;
    while (index < keys.length) {
      values.push(ObjectUtils.getOrDefault(entries, keys[index], EMPTY_TEXT));
      index = index + 1;
    }
    return values;
  }

  /**
   * Reports whether the key is present.
   */
  static hasKey(entries: Map<string, string>, key: string): boolean {
    hilog.info(DOMAIN, TAG, 'ObjectUtils.hasKey key=%{public}s', key);
    return entries.has(key);
  }

  /**
   * Returns the mapped value or the fallback when the key is absent.
   */
  static getOrDefault(entries: Map<string, string>, key: string, fallback: string): string {
    hilog.info(DOMAIN, TAG, 'ObjectUtils.getOrDefault key=%{public}s', key);
    const value: string | undefined = entries.get(key);
    if (value === undefined) {
      return fallback;
    }
    return value;
  }

  /**
   * Returns a new map holding the left entries overlaid by the right ones.
   */
  static mergeMaps(left: Map<string, string>, right: Map<string, string>): Map<string, string> {
    hilog.info(DOMAIN, TAG, 'ObjectUtils.mergeMaps left=%{public}d right=%{public}d', left.size, right.size);
    const merged: Map<string, string> = new Map<string, string>();
    left.forEach((value: string, key: string) => {
      merged.set(key, value);
    });
    right.forEach((value: string, key: string) => {
      merged.set(key, value);
    });
    return merged;
  }

  /**
   * Returns a defensive copy of the map.
   */
  static cloneMap(entries: Map<string, string>): Map<string, string> {
    hilog.info(DOMAIN, TAG, 'ObjectUtils.cloneMap size=%{public}d', entries.size);
    const copy: Map<string, string> = new Map<string, string>();
    entries.forEach((value: string, key: string) => {
      copy.set(key, value);
    });
    return copy;
  }

  /**
   * Renders the map as sorted key=value pairs.
   */
  static toPairs(entries: Map<string, string>): string[] {
    hilog.info(DOMAIN, TAG, 'ObjectUtils.toPairs size=%{public}d', entries.size);
    const keys: string[] = ObjectUtils.keysOf(entries);
    const pairs: string[] = [];
    let index: number = 0;
    while (index < keys.length) {
      const value: string = ObjectUtils.getOrDefault(entries, keys[index], EMPTY_TEXT);
      pairs.push(keys[index] + PAIR_SEPARATOR + value);
      index = index + 1;
    }
    return pairs;
  }

  /**
   * Counts the keys that start with the requested prefix.
   */
  static countMatching(entries: Map<string, string>, prefix: string): number {
    hilog.info(DOMAIN, TAG, 'ObjectUtils.countMatching prefix=%{public}s', prefix);
    let total: number = 0;
    entries.forEach((value: string, key: string) => {
      if (key.indexOf(prefix) === FIRST_INDEX) {
        total = total + 1;
      }
    });
    return total;
  }

  /**
   * Returns a new map without the requested key.
   */
  static removeKey(entries: Map<string, string>, key: string): Map<string, string> {
    hilog.info(DOMAIN, TAG, 'ObjectUtils.removeKey key=%{public}s', key);
    const copy: Map<string, string> = new Map<string, string>();
    entries.forEach((value: string, current: string) => {
      if (current !== key) {
        copy.set(current, value);
      }
    });
    return copy;
  }

  /**
   * Reports whether both maps hold the same key value pairs.
   */
  static equalsMap(left: Map<string, string>, right: Map<string, string>): boolean {
    hilog.info(DOMAIN, TAG, 'ObjectUtils.equalsMap left=%{public}d right=%{public}d', left.size, right.size);
    if (left.size !== right.size) {
      return false;
    }
    let equal: boolean = true;
    left.forEach((value: string, key: string) => {
      if (right.get(key) !== value) {
        equal = false;
      }
    });
    return equal;
  }

  /**
   * Returns the first key of the sorted key sequence, empty when absent.
   */
  static firstKey(entries: Map<string, string>): string {
    hilog.info(DOMAIN, TAG, 'ObjectUtils.firstKey size=%{public}d', entries.size);
    const keys: string[] = ObjectUtils.keysOf(entries);
    if (keys.length === 0) {
      return EMPTY_TEXT;
    }
    return keys[0];
  }

  /**
   * Joins the sorted values with the requested separator.
   */
  static joinValues(entries: Map<string, string>, separator: string): string {
    hilog.info(DOMAIN, TAG, 'ObjectUtils.joinValues separator=%{public}s', separator);
    const values: string[] = ObjectUtils.valuesOf(entries);
    let out: string = '';
    let index: number = 0;
    while (index < values.length) {
      if (index > 0) {
        out = out + separator;
      }
      out = out + values[index];
      index = index + 1;
    }
    return out;
  }

  /**
   * Sorts the text array in place free fashion using insertion sort.
   */
  private static sortText(values: string[]): string[] {
    const out: string[] = values.slice();
    let index: number = 1;
    while (index < out.length) {
      const current: string = out[index];
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
   * Reports whether the requested key lookup returned nothing.
   */
  static isMissing(entries: Map<string, string>, key: string): boolean {
    hilog.info(DOMAIN, TAG, 'ObjectUtils.isMissing key=%{public}s', key);
    return entries.get(key) === undefined;
  }

  /**
   * Returns the index of the key inside the sorted key sequence.
   */
  static keyIndex(entries: Map<string, string>, key: string): number {
    hilog.info(DOMAIN, TAG, 'ObjectUtils.keyIndex key=%{public}s', key);
    const keys: string[] = ObjectUtils.keysOf(entries);
    let index: number = 0;
    while (index < keys.length) {
      if (keys[index] === key) {
        return index;
      }
      index = index + 1;
    }
    return NOT_FOUND;
  }
}
