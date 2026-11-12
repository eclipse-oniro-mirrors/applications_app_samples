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
import { BluetoothConstants } from '../../constants/BluetoothConstants';

const TAG: string = BluetoothConstants.TAG;
const DOMAIN: number = BluetoothConstants.DOMAIN;

/**
 * general utility class
 * provides various general auxiliary assist method method
 */
export class CommonUtils {
  /**
   * delay late execute row
   * @param ms - delay milliseconds
   * @returns Promise
   */
  static delay(ms: number): Promise<void> {
    return new Promise<void>((resolve) => {
      setTimeout(() => resolve(), ms);
    });
  }

  /**
   * generate unique ID
   * @returns unique ID string
   */
  static generateId(): string {
    const timestamp: string = Date.now().toString(36);
    const random: string = Math.random().toString(36).substring(2, 10);
    return timestamp + '-' + random;
  }

  /**
   * safe all JSON serialize
   * @param obj - want serialize against object
   * @returns JSON string
   */
  static safeStringify(obj: unknown): string {
    try {
      return JSON.stringify(obj);
    } catch (e) {
      hilog.error(DOMAIN, TAG, 'CommonUtils safeStringify: failed to stringify object');
      return '{}';
    }
  }

  /**
   * safe all JSON decode parse
   * @param json - JSON string
   * @returns decode parse after against object
   */
  static safeParse(json: string): object | null {
    try {
      return JSON.parse(json);
    } catch (e) {
      hilog.error(DOMAIN, TAG, 'CommonUtils safeParse: failed to parse JSON');
      return null;
    }
  }

  /**
   * prevent shake function number
   * @param fn - want prevent shake function number
   * @param delay - delay late time interval (ms)
   * @returns prevent shake after function number
   */
  static debounce(fn: () => void, delay: number): () => void {
    let timer: number = -1;
    return () => {
      if (timer !== -1) {
        clearTimeout(timer);
      }
      timer = setTimeout(() => {
        fn();
        timer = -1;
      }, delay);
    };
  }

  /**
   * section stream function number
   * @param fn - want section stream function number
   * @param interval - interval (ms)
   * @returns section stream after function number
   */
  static throttle(fn: () => void, interval: number): () => void {
    let lastTime: number = 0;
    return () => {
      const now: number = Date.now();
      if (now - lastTime >= interval) {
        lastTime = now;
        fn();
      }
    };
  }

  /**
   * weight try execute row different step operation
   * @param fn - want execute row different step function number
   * @param maxRetries - max weight try times number
   * @param delayMs - retry interval (ms)
   * @returns Promise result result
   */
  static async retryAsync<T>(fn: () => Promise<T>, maxRetries: number = 3, delayMs: number = 1000): Promise<T> {
    let lastError: Error | null = null;
    for (let i: number = 0; i <= maxRetries; i++) {
      try {
        return await fn();
      } catch (err) {
        lastError = err instanceof Error ? err : new Error(String(err));
        hilog.warn(DOMAIN, TAG, 'CommonUtils retryAsync: attempt ' + (i + 1) + ' failed');
        if (i < maxRetries) {
          await CommonUtils.delay(delayMs * (i + 1));
        }
      }
    }
    throw lastError;
  }

  /**
   * create exceed time Promise
   * @param promise - original Promise
   * @param timeoutMs - timeout (ms)
   * @returns Promise with timeout
   */
  static withTimeout<T>(promise: Promise<T>, timeoutMs: number): Promise<T> {
    return new Promise<T>((resolve, reject) => {
      const timer: number = setTimeout(() => {
        reject(new Error('Operation timed out after ' + timeoutMs + 'ms'));
      }, timeoutMs);
      promise.then(
        (result: T) => {
          clearTimeout(timer);
          resolve(result);
        },
        (err: Error) => {
          clearTimeout(timer);
          reject(err);
        }
      );
    });
  }

  /**
   * array remove weight
   * @param arr - original array
   * @returns deduplicated array
   */
  static unique<T>(arr: T[]): T[] {
    const seen: Set<string> = new Set<string>();
    const result: T[] = [];
    for (const item of arr) {
      const key: string = JSON.stringify(item);
      if (!seen.has(key)) {
        seen.add(key);
        result.push(item);
      }
    }
    return result;
  }

  /**
   * array divide block
   * @param arr - original array
   * @param size - each block large small
   * @returns chunked 2D array
   */
  static chunk<T>(arr: T[], size: number): T[][] {
    const result: T[][] = [];
    for (let i: number = 0; i < arr.length; i += size) {
      result.push(arr.slice(i, i + size));
    }
    return result;
  }

  /**
   * flat flat ize array
   * @param arr - nested array
   * @returns flattened array
   */
  static flatten<T>(arr: T[][]): T[] {
    const result: T[] = [];
    for (const subArr of arr) {
      for (const item of subArr) {
        result.push(item);
      }
    }
    return result;
  }

  /**
   * divide group array
   * @param arr - original array
   * @param keyFn - divide group key function number
   * @returns divide group after Map
   */
  static groupBy<T>(arr: T[], keyFn: (item: T) => string): Map<string, T[]> {
    const result: Map<string, T[]> = new Map<string, T[]>();
    for (const item of arr) {
      const key: string = keyFn(item);
      const group: T[] = result.get(key) || [];
      group.push(item);
      result.set(key, group);
    }
    return result;
  }

  /**
   * sort array (not modify modify raw array)
   * @param arr - original array
   * @param compareFn - compare compare function number
   * @returns sorted new array
   */
  static sortBy<T>(arr: T[], compareFn: (a: T, b: T) => number): T[] {
    return [...arr].sort(compareFn);
  }

  /**
   * check value whether at array in
   * @param arr - array
   * @param value - want check find value
   * @returns whether package contain
   */
  static includes<T>(arr: T[], value: T): boolean {
    return arr.indexOf(value) !== -1;
  }

  /**
   * get array last one element
   * @param arr - array
   * @returns last one element
   */
  static last<T>(arr: T[]): T | undefined {
    if (arr.length === 0) {
      return undefined;
    }
    return arr[arr.length - 1];
  }

  /**
   * get array th one element
   * @param arr - array
   * @returns th one element
   */
  static first<T>(arr: T[]): T | undefined {
    if (arr.length === 0) {
      return undefined;
    }
    return arr[0];
  }
}
