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
 * 通用工具类
 * 提供各种通用辅助方法
 */
export class CommonUtils {
  /**
   * 延迟执行
   * @param ms - 延迟毫秒数
   * @returns Promise
   */
  static delay(ms: number): Promise<void> {
    return new Promise<void>((resolve) => {
      setTimeout(() => resolve(), ms);
    });
  }

  /**
   * 生成唯一ID
   * @returns 唯一ID字符串
   */
  static generateId(): string {
    const timestamp: string = Date.now().toString(36);
    const random: string = Math.random().toString(36).substring(2, 10);
    return timestamp + '-' + random;
  }

  /**
   * 安全的JSON序列化
   * @param obj - 要序列化的对象
   * @returns JSON字符串
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
   * 安全的JSON解析
   * @param json - JSON字符串
   * @returns 解析后的对象
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
   * 防抖函数
   * @param fn - 要防抖的函数
   * @param delay - 延迟时间（毫秒）
   * @returns 防抖后的函数
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
   * 节流函数
   * @param fn - 要节流的函数
   * @param interval - 间隔时间（毫秒）
   * @returns 节流后的函数
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
   * 重试执行异步操作
   * @param fn - 要执行的异步函数
   * @param maxRetries - 最大重试次数
   * @param delayMs - 重试间隔（毫秒）
   * @returns Promise结果
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
   * 创建超时Promise
   * @param promise - 原始Promise
   * @param timeoutMs - 超时时间（毫秒）
   * @returns 带超时的Promise
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
   * 数组去重
   * @param arr - 原始数组
   * @returns 去重后的数组
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
   * 数组分块
   * @param arr - 原始数组
   * @param size - 每块大小
   * @returns 分块后的二维数组
   */
  static chunk<T>(arr: T[], size: number): T[][] {
    const result: T[][] = [];
    for (let i: number = 0; i < arr.length; i += size) {
      result.push(arr.slice(i, i + size));
    }
    return result;
  }

  /**
   * 扁平化数组
   * @param arr - 嵌套数组
   * @returns 扁平化后的数组
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
   * 分组数组
   * @param arr - 原始数组
   * @param keyFn - 分组键函数
   * @returns 分组后的Map
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
   * 排序数组（不修改原数组）
   * @param arr - 原始数组
   * @param compareFn - 比较函数
   * @returns 排序后的新数组
   */
  static sortBy<T>(arr: T[], compareFn: (a: T, b: T) => number): T[] {
    return [...arr].sort(compareFn);
  }

  /**
   * 检查值是否在数组中
   * @param arr - 数组
   * @param value - 要查找的值
   * @returns 是否包含
   */
  static includes<T>(arr: T[], value: T): boolean {
    return arr.indexOf(value) !== -1;
  }

  /**
   * 获取数组最后一个元素
   * @param arr - 数组
   * @returns 最后一个元素
   */
  static last<T>(arr: T[]): T | undefined {
    if (arr.length === 0) return undefined;
    return arr[arr.length - 1];
  }

  /**
   * 获取数组第一个元素
   * @param arr - 数组
   * @returns 第一个元素
   */
  static first<T>(arr: T[]): T | undefined {
    if (arr.length === 0) return undefined;
    return arr[0];
  }
}
