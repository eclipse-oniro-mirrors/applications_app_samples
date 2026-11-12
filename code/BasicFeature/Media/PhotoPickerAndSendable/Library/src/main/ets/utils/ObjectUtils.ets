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

// One key value pair of a metadata record.
export interface StringPair {
  key: string;
  value: string;
}

// Marker used when a value cannot be rendered as text.
const TEXT_UNKNOWN: string = '[unknown]';
// Marker used when stringify cannot serialize the value.
const TEXT_UNSERIALIZABLE: string = '[unserializable]';
// Prefix placed in front of every key when the record is rendered as text.
const TEXT_KEY_PREFIX: string = ': ';

/**
 * Helpers for null checks and for shallow inspection of plain metadata records.
 * ArkTS forbids dynamic property access, so the record is always described by key value pairs.
 */
export class ObjectUtils {
  /**
   * Checks whether the value is undefined or null.
   * @param value Value to test, any type is accepted as an opaque object reference.
   * @returns True when the value is undefined or null.
   */
  static isNullish(value: Object | undefined | null): boolean {
    // Both missing states count as nullish.
    return value === undefined || value === null;
  }

  /**
   * Extracts the keys of a key value record.
   * @param pairs Metadata record, undefined and null are accepted.
   * @returns List of keys in record order, an empty list when the record is missing.
   */
  static keys(pairs: StringPair[] | undefined | null): string[] {
    // A missing record has no key.
    if (pairs === undefined || pairs === null) {
      return [];
    }
    // Collect the keys in a temporary buffer.
    const buffer: string[] = [];
    // Walk the record with an index based loop.
    for (let index: number = 0; index < pairs.length; index++) {
      // Copy the key of the current pair.
      buffer.push(pairs[index].key);
    }
    // Hand the key list back.
    return buffer;
  }

  /**
   * Counts the entries of a key value record.
   * @param pairs Metadata record, undefined and null are accepted.
   * @returns Number of entries, zero when the record is missing.
   */
  static size(pairs: StringPair[] | undefined | null): number {
    // A missing record carries no entry.
    if (pairs === undefined || pairs === null) {
      return 0;
    }
    // The entry count equals the record length.
    return pairs.length;
  }

  /**
   * Checks whether the record carries the given key.
   * @param pairs Metadata record, undefined and null are accepted.
   * @param key Key to look for.
   * @returns True when the key appears at least once.
   */
  static hasKey(pairs: StringPair[] | undefined | null, key: string): boolean {
    // A missing record has no key at all.
    if (pairs === undefined || pairs === null) {
      return false;
    }
    // Walk the record with an index based loop, for...in is not allowed.
    for (let index: number = 0; index < pairs.length; index++) {
      // A single match is enough.
      if (pairs[index].key === key) {
        return true;
      }
    }
    // No entry matched the requested key.
    return false;
  }

  /**
   * Checks whether the record has no entry.
   * @param pairs Metadata record, undefined and null are accepted.
   * @returns True when the record is missing or empty.
   */
  static isEmptyObject(pairs: StringPair[] | undefined | null): boolean {
    // A missing record counts as empty.
    if (pairs === undefined || pairs === null) {
      return true;
    }
    // A defined record is empty when its entry count is zero.
    return pairs.length === 0;
  }

  /**
   * Compares two records by their ordered key value pairs.
   * @param first Left record, undefined and null are accepted.
   * @param second Right record, undefined and null are accepted.
   * @returns True when both records carry the same pairs in the same order.
   */
  static jsonEquals(first: StringPair[] | undefined | null, second: StringPair[] | undefined | null): boolean {
    // Resolve both sides to a usable list so the comparison stays uniform.
    const left: StringPair[] = first === undefined || first === null ? [] : first;
    // Resolve the right side as well.
    const right: StringPair[] = second === undefined || second === null ? [] : second;
    // Different lengths can never be equal.
    if (left.length !== right.length) {
      return false;
    }
    // Compare the pairs pairwise with an index based loop.
    for (let index: number = 0; index < left.length; index++) {
      // Read the current pair of the left record.
      const leftPair: StringPair = left[index];
      // Read the current pair of the right record.
      const rightPair: StringPair = right[index];
      // A single difference makes the records unequal.
      if (leftPair.key !== rightPair.key || leftPair.value !== rightPair.value) {
        return false;
      }
    }
    // Every pair matched.
    return true;
  }

  /**
   * Renders a value as text without throwing.
   * @param value Value to render, undefined and null are accepted.
   * @returns Text form of the value or a placeholder when it cannot be rendered.
   */
  static toStringSafe(value: string | number | boolean | undefined | null): string {
    // Missing values are rendered with a dedicated placeholder.
    if (value === undefined || value === null) {
      return TEXT_UNKNOWN;
    }
    // Strings are already text and are handed back unchanged.
    if (typeof value === 'string') {
      return value;
    }
    // Numbers and booleans are converted through String.
    if (typeof value === 'number' || typeof value === 'boolean') {
      return String(value);
    }
    // Any other runtime type degrades to the placeholder.
    return TEXT_UNSERIALIZABLE;
  }

  /**
   * Returns the value itself when it is not nullish, otherwise the fallback.
   * @param value Preferred value, undefined and null are accepted.
   * @param fallback Value used when the preferred one is nullish.
   * @returns Preferred value or fallback.
   */
  static defaultIfNullish(value: string | undefined | null, fallback: string): string {
    // A defined value always wins.
    if (value !== undefined && value !== null) {
      return value;
    }
    // Missing values are replaced by the fallback.
    return fallback;
  }

  /**
   * Renders the whole record as a single readable line.
   * @param pairs Metadata record, undefined and null are accepted.
   * @returns Text such as 'key: value, key: value'.
   */
  static renderPairs(pairs: StringPair[] | undefined | null): string {
    // A missing record renders as an empty line.
    if (pairs === undefined || pairs === null || pairs.length === 0) {
      return '';
    }
    // Collect the rendered pairs in a temporary buffer.
    const buffer: string[] = [];
    // Walk the record with an index based loop.
    for (let index: number = 0; index < pairs.length; index++) {
      // Read the current pair.
      const pair: StringPair = pairs[index];
      // Join the key and the value with the fixed separator.
      buffer.push(pair.key + TEXT_KEY_PREFIX + ObjectUtils.toStringSafe(pair.value));
    }
    // Separate the rendered pairs with a comma.
    return buffer.join(', ');
  }
}
