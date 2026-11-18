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

import { Logger } from './Logger';

// Minimum accepted chunk size for chunk(); zero would loop forever.
const MIN_CHUNK_SIZE: number = 1;

/**
 * Collection helpers for arrays: emptiness checks, deduplication, slicing
 * into chunks, flattening, membership aggregation and grouping.
 * All methods are stateless and return new arrays, inputs stay untouched.
 */
export class CollectionUtils {
  /**
   * Check whether an array is undefined or has no elements.
   * @typeParam T element type of the array.
   * @param values array to inspect, may be undefined.
   * @returns true when the array holds no elements.
   */
  static isEmpty<T>(values: T[] | undefined): boolean {
    const tag: string = '[CollectionUtils#isEmpty]';
    Logger.enter(tag, '');
    Logger.beginTrace('NetworkSecurity.utils.isEmpty', 1);
    // Treat a missing array the same as an empty one.
    const result: boolean = values === undefined || values.length === 0;
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.isEmpty', 1);
    return result;
  }

  /**
   * Check whether an array holds at least one element.
   * @typeParam T element type of the array.
   * @param values array to inspect, may be undefined.
   * @returns true when the array holds elements.
   */
  static isNotEmpty<T>(values: T[] | undefined): boolean {
    const tag: string = '[CollectionUtils#isNotEmpty]';
    Logger.enter(tag, '');
    Logger.beginTrace('NetworkSecurity.utils.isNotEmpty', 1);
    // Invert the empty check to keep a single source of truth.
    const result: boolean = !(values === undefined || values.length === 0);
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.isNotEmpty', 1);
    return result;
  }

  /**
   * Keep the first occurrence of every distinct element, preserving order.
   * @typeParam T element type; matching works by strict equality, so value
   * types and identical references are deduplicated but fresh objects are not.
   * @param values array to deduplicate, may be undefined.
   * @returns a new array without repeated elements.
   */
  static unique<T>(values: T[] | undefined): T[] {
    const tag: string = '[CollectionUtils#unique]';
    Logger.enter(tag, 'size: ' + (values === undefined ? 'undefined' : values.length.toString()));
    Logger.beginTrace('NetworkSecurity.utils.unique', 1);
    // Build the deduplicated list with a simple keep-if-new scan.
    const result: T[] = [];
    if (values !== undefined) {
      for (let index = 0; index < values.length; index++) {
        const item: T = values[index];
        // Skip elements already collected by scanning the output array.
        if (!result.includes(item)) {
          result.push(item);
        }
      }
    }
    Logger.exit(tag, 'size: ' + result.length.toString());
    Logger.endTrace('NetworkSecurity.utils.unique', 1);
    return result;
  }

  /**
   * Split an array into consecutive slices of at most size elements.
   * @typeParam T element type of the array.
   * @param values array to split, may be undefined.
   * @param size desired slice length; values below one yield a single chunk.
   * @returns a new array of consecutive chunks.
   */
  static chunk<T>(values: T[] | undefined, size: number): T[][] {
    const tag: string = '[CollectionUtils#chunk]';
    Logger.enter(tag, 'size: ' + size.toString());
    Logger.beginTrace('NetworkSecurity.utils.chunk', 1);
    // Guard the chunk size first so the loop below cannot run forever.
    const safeSize: number = size < MIN_CHUNK_SIZE ? MIN_CHUNK_SIZE : size;
    // Walk the input in safeSize strides collecting slices.
    const result: T[][] = [];
    if (values !== undefined) {
      for (let index = 0; index < values.length; index += safeSize) {
        // Slice copies out one bounded window of the input.
        result.push(values.slice(index, index + safeSize));
      }
    }
    Logger.exit(tag, 'chunks: ' + result.length.toString());
    Logger.endTrace('NetworkSecurity.utils.chunk', 1);
    return result;
  }

  /**
   * Flatten one level of nesting into a single array.
   * @typeParam T element type of the inner arrays.
   * @param values array of arrays, may be undefined.
   * @returns a new array containing every inner element in order.
   */
  static flatten<T>(values: T[][] | undefined): T[] {
    const tag: string = '[CollectionUtils#flatten]';
    Logger.enter(tag, '');
    Logger.beginTrace('NetworkSecurity.utils.flatten', 1);
    // Append each inner array in order to the flat output.
    const result: T[] = [];
    if (values !== undefined) {
      for (let index = 0; index < values.length; index++) {
        const inner: T[] = values[index];
        for (let innerIndex = 0; innerIndex < inner.length; innerIndex++) {
          result.push(inner[innerIndex]);
        }
      }
    }
    Logger.exit(tag, 'size: ' + result.length.toString());
    Logger.endTrace('NetworkSecurity.utils.flatten', 1);
    return result;
  }

  /**
   * Check whether every candidate element is present in the source array.
   * @typeParam T element type; membership uses strict equality.
   * @param source array that must contain the candidates, may be undefined.
   * @param candidates elements that are required, may be undefined.
   * @returns true when the source contains all candidates.
   */
  static containsAll<T>(source: T[] | undefined, candidates: T[] | undefined): boolean {
    const tag: string = '[CollectionUtils#containsAll]';
    Logger.enter(tag, '');
    Logger.beginTrace('NetworkSecurity.utils.containsAll', 1);
    // Missing input arrays can never satisfy the containment contract.
    let result: boolean = false;
    if (source !== undefined && candidates !== undefined) {
      // Verify each candidate against the source array.
      result = true;
      for (let index = 0; index < candidates.length; index++) {
        if (!source.includes(candidates[index])) {
          result = false;
          break;
        }
      }
    }
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.containsAll', 1);
    return result;
  }

  /**
   * Remove duplicated numbers from a plain numeric array while keeping the
   * original order of first occurrences.
   * @param range numeric array to clean up, may be undefined.
   * @returns a new array of distinct numbers in first-seen order.
   */
  static removeDuplicates(range: number[] | undefined): number[] {
    const tag: string = '[CollectionUtils#removeDuplicates]';
    Logger.enter(tag, 'size: ' + (range === undefined ? 'undefined' : range.length.toString()));
    Logger.beginTrace('NetworkSecurity.utils.removeDuplicates', 1);
    // Reuse the generic scan; numbers compare strictly so this is exact.
    const result: number[] = CollectionUtils.unique<number>(range);
    Logger.exit(tag, 'size: ' + result.length.toString());
    Logger.endTrace('NetworkSecurity.utils.removeDuplicates', 1);
    return result;
  }

  /**
   * Group elements by a computed string key using a single reduce pass.
   * @typeParam T element type of the array.
   * @param values array to group, may be undefined.
   * @param keySelector function mapping each element to its group key.
   * @returns a map from group key to the elements of that group.
   */
  static groupBy<T>(values: T[] | undefined, keySelector: (item: T) => string): Map<string, T[]> {
    const tag: string = '[CollectionUtils#groupBy]';
    Logger.enter(tag, 'size: ' + (values === undefined ? 'undefined' : values.length.toString()));
    Logger.beginTrace('NetworkSecurity.utils.groupBy', 1);
    // Reduce folds every element into the shared map in one pass.
    const result: Map<string, T[]> = values === undefined
      ? new Map<string, T[]>()
      : values.reduce<Map<string, T[]>>(
        (map: Map<string, T[]>, item: T): Map<string, T[]> => {
          // Resolve the group key and append into its bucket.
          const key: string = keySelector(item);
          const bucket: T[] | undefined = map.get(key);
          if (bucket === undefined) {
            // First element of a new group starts its own bucket.
            map.set(key, [item]);
          } else {
            bucket.push(item);
          }
          return map;
        }, new Map<string, T[]>());
    Logger.exit(tag, 'groups: ' + result.size.toString());
    Logger.endTrace('NetworkSecurity.utils.groupBy', 1);
    return result;
  }
}
