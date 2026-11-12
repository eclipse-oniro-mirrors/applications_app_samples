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

// Result handed back when a lookup finds nothing at all.
const NOT_FOUND: number = -1;
// Smallest allowed chunk size, guards against an endless loop.
const MIN_CHUNK_SIZE: number = 1;
// Separator used by the plain join helper.
const DEFAULT_SEPARATOR: string = ', ';
/**
 * Sentinel returned by max() when the list is empty.
 * Number.NaN is used on purpose: it can never collide with a real maximum.
 */
const EMPTY_NUMBER: number = Number.NaN;
// Separator used to build the identity key inside distinct().
const KEY_SEPARATOR: string = '|';

/**
 * Array helpers that never mutate their input.
 * Every method works on primitive numbers, strings or booleans so that no cast is required.
 */
export class ArrayUtils {
  /**
   * Checks whether the list is missing or carries no entry.
   * @param items List to test, undefined and null are accepted.
   * @returns True when the list has no entry.
   */
  static isEmpty(items: string[] | number[] | boolean[] | undefined | null): boolean {
    // Missing lists are empty by definition.
    if (items === undefined || items === null) {
      return true;
    }
    // A defined list is empty when its length is zero.
    return items.length === 0;
  }

  /**
   * Sums the numbers of the list.
   * @param items Numbers to add.
   * @returns Total sum, zero for an empty list.
   */
  static sum(items: number[]): number {
    // Start from the neutral element of the addition.
    let total: number = 0;
    // Walk the list with an index based loop.
    for (let index: number = 0; index < items.length; index++) {
      // Accumulate the current value.
      total = total + items[index];
    }
    // Hand the accumulated total back.
    return total;
  }

  /**
   * Finds the greatest number of the list.
   * @param items Numbers to scan.
   * @returns Greatest value, NaN for an empty list.
   */
  static max(items: number[]): number {
    // An empty list has no maximum.
    if (items.length === 0) {
      return EMPTY_NUMBER;
    }
    // Seed the running maximum with the first value.
    let result: number = items[0];
    // Walk the remaining values and keep the larger one.
    for (let index: number = 1; index < items.length; index++) {
      // Only a strictly greater value replaces the maximum.
      if (items[index] > result) {
        result = items[index];
      }
    }
    // Hand the maximum back.
    return result;
  }

  /**
   * Finds the smallest number of the list.
   * @param items Numbers to scan.
   * @returns Smallest value, NaN for an empty list.
   */
  static min(items: number[]): number {
    // An empty list has no minimum.
    if (items.length === 0) {
      return EMPTY_NUMBER;
    }
    // Seed the running minimum with the first value.
    let result: number = items[0];
    // Walk the remaining values and keep the smaller one.
    for (let index: number = 1; index < items.length; index++) {
      // Only a strictly smaller value replaces the minimum.
      if (items[index] < result) {
        result = items[index];
      }
    }
    // Hand the minimum back.
    return result;
  }

  /**
   * Computes the arithmetic mean of the list.
   * @param items Numbers to average.
   * @returns Mean value, zero for an empty list.
   */
  static average(items: number[]): number {
    // An empty list has no mean, zero keeps the callers free of NaN checks.
    if (items.length === 0) {
      return 0;
    }
    // Divide the total by the entry count.
    return ArrayUtils.sum(items) / items.length;
  }

  /**
   * Splits the list into consecutive groups of a fixed size.
   * @param items Values to group, any primitive array is accepted.
   * @param size Group size, values below one are raised to one.
   * @returns List of groups, the last group may be shorter.
   */
  static chunk<T>(items: T[], size: number): T[][] {
    // Guard against an endless loop caused by a zero size.
    const groupSize: number = size < MIN_CHUNK_SIZE ? MIN_CHUNK_SIZE : Math.floor(size);
    // Collect the groups in a temporary buffer.
    const groups: T[][] = [];
    // Walk the input with a step equal to the group size.
    for (let start: number = 0; start < items.length; start = start + groupSize) {
      // Slice the current group out of the input list.
      const group: T[] = items.slice(start, start + groupSize);
      // Keep the group.
      groups.push(group);
    }
    // Hand the groups back.
    return groups;
  }

  /**
   * Removes duplicated numbers while keeping the first occurrence order.
   * @param items Numbers to filter.
   * @returns De-duplicated list.
   */
  static distinct(items: number[]): number[] {
    // Remember every value that was already copied.
    const seen: Set<number> = new Set<number>();
    // Collect the unique values in a temporary buffer.
    const buffer: number[] = [];
    // Walk the input with an index based loop.
    for (let index: number = 0; index < items.length; index++) {
      // Read the current value.
      const value: number = items[index];
      // Skip values that were already copied.
      if (seen.has(value)) {
        continue;
      }
      // Remember the value and copy it once.
      seen.add(value);
      buffer.push(value);
    }
    // Hand the unique values back.
    return buffer;
  }

  /**
   * Flattens a list of string lists into a single list one level deep.
   * @param groups Nested lists to flatten.
   * @returns Flat list containing every entry of every group in order.
   */
  static flatten(groups: string[][]): string[] {
    // Collect the entries in a temporary buffer.
    const buffer: string[] = [];
    // Walk the outer list with an index based loop.
    for (let outer: number = 0; outer < groups.length; outer++) {
      // Read the current group.
      const group: string[] = groups[outer];
      // Guard against a hole in the outer list.
      if (group === undefined || group === null) {
        continue;
      }
      // Append every entry of the group with an inner loop.
      for (let inner: number = 0; inner < group.length; inner++) {
        // Copy the current entry.
        buffer.push(group[inner]);
      }
    }
    // Hand the flat list back.
    return buffer;
  }

  /**
   * Produces a reversed copy without touching the input list.
   * @param items Values to reverse.
   * @returns New list with the reversed order.
   */
  static reverseCopy<T>(items: T[]): T[] {
    // Copy first so that the caller keeps the original order.
    const copy: T[] = items.slice(0);
    // Reverse the copy in place.
    copy.reverse();
    // Hand the reversed copy back.
    return copy;
  }

  /**
   * Checks whether the list contains the given number.
   * @param items Numbers to scan.
   * @param value Value to look for.
   * @returns True when the value appears in the list.
   */
  static contains(items: number[], value: number): boolean {
    // indexOf returns minus one when the value is absent.
    return items.indexOf(value) !== NOT_FOUND;
  }

  /**
   * Safe variant of indexOf that tolerates a missing list.
   * @param items Numbers to scan, undefined and null are accepted.
   * @param value Value to look for.
   * @returns Position of the value, minus one when absent or when the list is missing.
   */
  static indexOfSafe(items: number[] | undefined | null, value: number): number {
    // A missing list never contains the value.
    if (items === undefined || items === null) {
      return NOT_FOUND;
    }
    // Delegate to the platform lookup.
    return items.indexOf(value);
  }

  /**
   * Joins the numbers with a separator.
   * @param items Numbers to join.
   * @param separator Separator placed between the entries, defaults to ', '.
   * @returns Joined text.
   */
  static join(items: number[], separator?: string): string {
    // Resolve the separator, an empty or missing value falls back to the default.
    const gap: string = separator !== undefined && separator !== null ? separator : DEFAULT_SEPARATOR;
    // Convert every number to text so that join can use the platform implementation.
    const buffer: string[] = [];
    // Walk the input with an index based loop.
    for (let index: number = 0; index < items.length; index++) {
      // Convert the current value with String to avoid a cast.
      buffer.push(String(items[index]));
    }
    // Join the converted values.
    return buffer.join(gap);
  }

  /**
   * Keeps at most the requested number of leading entries.
   * @param items Values to slice.
   * @param count Number of entries to keep, negative values yield an empty list.
   * @returns New list with the leading entries.
   */
  static take<T>(items: T[], count: number): T[] {
    // A non positive count keeps nothing.
    if (count <= 0) {
      return [];
    }
    // Slice the leading part of the list.
    return items.slice(0, count);
  }

  /**
   * Drops the requested number of leading entries.
   * @param items Values to slice.
   * @param count Number of entries to drop, negative values keep the whole list.
   * @returns New list with the remaining entries.
   */
  static drop<T>(items: T[], count: number): T[] {
    // A non positive count drops nothing.
    if (count <= 0) {
      return items.slice(0);
    }
    // Slice everything after the dropped part.
    return items.slice(count);
  }

  /**
   * Returns the first text of the list.
   * @param items Texts to inspect, undefined and null are accepted.
   * @returns First text, or an empty string when the list is missing or empty.
   */
  static firstOrNull(items: string[] | undefined | null): string {
    // A missing or empty list has no first entry.
    if (items === undefined || items === null || items.length === 0) {
      return '';
    }
    // A hole at position zero also degrades to the empty string.
    const first: string = items[0];
    // Guard the hole, the entry itself is already a string.
    return first === undefined || first === null ? '' : first;
  }

  /**
   * Returns the last text of the list.
   * @param items Texts to inspect, undefined and null are accepted.
   * @returns Last text, or an empty string when the list is missing or empty.
   */
  static lastOrNull(items: string[] | undefined | null): string {
    // A missing or empty list has no last entry.
    if (items === undefined || items === null || items.length === 0) {
      return '';
    }
    // Read the entry at the final position.
    const last: string = items[items.length - 1];
    // Guard the hole, the entry itself is already a string.
    return last === undefined || last === null ? '' : last;
  }

  /**
   * Builds a list of consecutive integers.
   * @param start First value of the sequence.
   * @param end Upper bound, exclusive.
   * @param step Distance between two values, values below one are raised to one.
   * @returns Sequence of integers.
   */
  static range(start: number, end: number, step: number): number[] {
    // Guard against an endless loop caused by a zero step.
    const stride: number = step < 1 ? 1 : Math.floor(step);
    // Collect the sequence in a temporary buffer.
    const buffer: number[] = [];
    // Walk from the start value up to the exclusive end value.
    for (let value: number = start; value < end; value = value + stride) {
      // Append the current value.
      buffer.push(value);
    }
    // Hand the sequence back.
    return buffer;
  }
}
