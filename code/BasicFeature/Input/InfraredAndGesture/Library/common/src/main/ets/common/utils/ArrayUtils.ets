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

import { AppLogger } from '../AppLogger';

/** Chunk size fallback used when the caller passes a non-positive size. */
const DEFAULT_CHUNK_SIZE: number = 1;

/**
 * Utility class for common array operations.
 * All methods are static, generic and null-safe: inputs may be null or undefined.
 */
export class ArrayUtils {
  /**
   * Checks whether the array is null, undefined or empty.
   */
  public static isEmpty<T>(value: T[] | null | undefined): boolean {
    return value === null || value === undefined || value.length === 0;
  }

  /**
   * Inverse of {@link ArrayUtils.isEmpty}.
   */
  public static isNotEmpty<T>(value: T[] | null | undefined): boolean {
    return !ArrayUtils.isEmpty(value);
  }

  /**
   * Returns the first element or the given default when the array is empty.
   */
  public static firstOrDefault<T>(value: T[] | null | undefined, defaultValue: T): T {
    if (value === null || value === undefined || value.length === 0) {
      return defaultValue;
    }
    const arr: T[] = value;
    return arr[0];
  }

  /**
   * Returns the last element or the given default when the array is empty.
   */
  public static lastOrDefault<T>(value: T[] | null | undefined, defaultValue: T): T {
    if (value === null || value === undefined || value.length === 0) {
      return defaultValue;
    }
    const arr: T[] = value;
    // The last index is length minus one for non-empty arrays.
    return arr[arr.length - 1];
  }

  /**
   * Checks whether the array contains the given element.
   */
  public static contains<T>(value: T[] | null | undefined, element: T): boolean {
    if (value === null || value === undefined || value.length === 0) {
      return false;
    }
    const arr: T[] = value;
    return arr.includes(element);
  }

  /**
   * Sums all numbers of the array, empty or missing inputs yield 0.
   */
  public static sum(numbers: number[] | null | undefined): number {
    if (ArrayUtils.isEmpty(numbers)) {
      return 0;
    }
    const arr: number[] = numbers as number[];
    // Accumulate every element into a single total.
    let total: number = 0;
    for (const item of arr) {
      total += item;
    }
    return total;
  }

  /**
   * Computes the arithmetic average of the array.
   * Logs a warning and returns 0 for empty or missing inputs.
   */
  public static average(numbers: number[] | null | undefined): number {
    if (ArrayUtils.isEmpty(numbers)) {
      // Division by zero must be avoided, warn so the caller notices.
      AppLogger.warn('ArrayUtils', 'average called with an empty array');
      return 0;
    }
    const arr: number[] = numbers as number[];
    return ArrayUtils.sum(arr) / arr.length;
  }

  /**
   * Returns the smallest number of the array or null when it is empty.
   * Logs a warning for empty or missing inputs.
   */
  public static minOrNull(numbers: number[] | null | undefined): number | null {
    if (ArrayUtils.isEmpty(numbers)) {
      AppLogger.warn('ArrayUtils', 'minOrNull called with an empty array');
      return null;
    }
    const arr: number[] = numbers as number[];
    // Fold the array keeping the smallest value seen so far.
    let result: number = arr[0];
    for (const item of arr) {
      if (item < result) {
        result = item;
      }
    }
    return result;
  }

  /**
   * Returns the largest number of the array or null when it is empty.
   * Logs a warning for empty or missing inputs.
   */
  public static maxOrNull(numbers: number[] | null | undefined): number | null {
    if (ArrayUtils.isEmpty(numbers)) {
      AppLogger.warn('ArrayUtils', 'maxOrNull called with an empty array');
      return null;
    }
    const arr: number[] = numbers as number[];
    // Fold the array keeping the largest value seen so far.
    let result: number = arr[0];
    for (const item of arr) {
      if (item > result) {
        result = item;
      }
    }
    return result;
  }

  /**
   * Splits the array into consecutive chunks of the given size.
   * A non-positive size is warned and replaced with 1.
   */
  public static chunk<T>(value: T[] | null | undefined, size: number): T[][] {
    const result: T[][] = [];
    if (value === null || value === undefined || value.length === 0) {
      return result;
    }
    if (size <= 0) {
      // A non-positive size would loop forever, fall back to a safe chunk size.
      AppLogger.warn('ArrayUtils', `chunk called with non-positive size: ${size}`);
      size = DEFAULT_CHUNK_SIZE;
    }
    const arr: T[] = value;
    // Walk the source array in fixed size steps.
    for (let i = 0; i < arr.length; i += size) {
      result.push(arr.slice(i, i + size));
    }
    return result;
  }

  /**
   * Removes duplicated elements, keeping the first occurrence of each value.
   * For object elements uniqueness is based on references.
   */
  public static unique<T>(value: T[] | null | undefined): T[] {
    const result: T[] = [];
    if (value === null || value === undefined || value.length === 0) {
      return result;
    }
    const arr: T[] = value;
    // A set keeps track of already emitted elements.
    const seen: Set<T> = new Set<T>();
    for (const item of arr) {
      if (!seen.has(item)) {
        seen.add(item);
        result.push(item);
      }
    }
    return result;
  }

  /**
   * Removes the first occurrence of the element from the array in place.
   * @returns true when an element was removed, false otherwise.
   */
  public static removeElement<T>(value: T[] | null | undefined, element: T): boolean {
    if (value === null || value === undefined || value.length === 0) {
      return false;
    }
    const arr: T[] = value;
    const index: number = arr.indexOf(element);
    // Nothing to do when the element is not part of the array.
    if (index < 0) {
      return false;
    }
    arr.splice(index, 1);
    return true;
  }
}
