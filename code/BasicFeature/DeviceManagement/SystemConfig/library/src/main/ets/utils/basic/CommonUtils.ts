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
import { SystemConfigConstants } from '../../constants/SystemConfigConstants';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// Retry config interface
// ========================================

/**
 * Retry config interface
 * Defines optional configuration parameters for retry operations
 */
export interface RetryConfig {
  /** Maximum retry count */
  maxRetries: number;
  /** Retry interval (milliseconds) */
  delayMs: number;
  /** Whether to use exponential backoff */
  exponentialBackoff: boolean;
}

// ========================================
// Common utility class
// ========================================

/**
 * Common utility class
 * Provides frequently used static utility methods including delay, ID generation,
 * null checks, deep clone and retry, reusable across application modules
 */
export class CommonUtils {
  /** UUID generation counter */
  private static idCounter: number = 0;

  /** Timestamp of the last generated ID */
  private static lastTimestamp: number = 0;

  // ========================================
  // Delay methods
  // ========================================

  /**
   * Asynchronous delay method
   * Returns a Promise that resolves after the specified milliseconds
   * @param ms - Delay duration in milliseconds
   * @returns Promise resolved when the delay completes
   */
  static delay(ms: number): Promise<void> {
    return new Promise<void>((resolve: () => void): void => {
      setTimeout((): void => {
        resolve();
      }, ms);
    });
  }

  // ========================================
  // ID generation
  // ========================================

  /**
   * Generates a unique UUID-like identifier
   * Based on timestamp and random values, formatted similarly to UUID v4
   * @returns Unique identifier string in UUID-like format
   */
  static generateId(): string {
    const timestamp: number = Date.now();
    CommonUtils.idCounter++;

    // Ensure uniqueness within the same millisecond
    if (timestamp === CommonUtils.lastTimestamp) {
      CommonUtils.idCounter++;
    } else {
      CommonUtils.idCounter = 0;
      CommonUtils.lastTimestamp = timestamp;
    }

    const randomPart1: string = CommonUtils.generateHexSegment(8);
    const randomPart2: string = CommonUtils.generateHexSegment(4);
    const randomPart3: string = CommonUtils.generateHexSegment(4);
    const randomPart4: string = CommonUtils.generateHexSegment(12);
    const counterHex: string = CommonUtils.idCounter.toString(16).padStart(4, '0');

    return `${randomPart1}-${randomPart2}-${randomPart3}-${randomPart4}-${counterHex}${timestamp.toString(16)}`;
  }

  /**
   * Generates a hexadecimal string segment of the specified length
   * @param length - Length of the hexadecimal string to generate
   * @returns Random hexadecimal string
   */
  private static generateHexSegment(length: number): string {
    let result: string = '';
    const hexChars: string = '0123456789abcdef';
    for (let i: number = 0; i < length; i++) {
      result += hexChars.charAt(Math.floor(Math.random() * 16));
    }
    return result;
  }

  // ========================================
  // Null check methods
  // ========================================

  /**
   * Checks whether a string is empty or contains only whitespace
   * @param str - String to check
   * @returns true if the string is empty or contains only whitespace
   */
  static isEmpty(str: string | null | undefined): boolean {
    if (str === null || str === undefined) {
      return true;
    }
    return str.trim().length === 0;
  }

  /**
   * Checks whether a value is null or undefined
   * @param value - Value to check
   * @returns true if the value is null or undefined
   */
  static isNullOrEmpty(value: string | null | undefined | object | unknown[]): boolean {
    if (value === null || value === undefined) {
      return true;
    }
    if (typeof value === 'string') {
      return value.trim().length === 0;
    }
    if (Array.isArray(value)) {
      return value.length === 0;
    }
    if (typeof value === 'object') {
      return Object.keys(value as object).length === 0;
    }
    return false;
  }

  /**
   * Checks whether a string is non-empty and contains non-whitespace characters
   * @param str - String to check
   * @returns true if the string contains non-whitespace characters
   */
  static isNotEmpty(str: string | null | undefined): boolean {
    return !CommonUtils.isEmpty(str);
  }

  // ========================================
  // Deep clone
  // ========================================

  /**
   * Deep clones an object
   * Implemented via JSON serialization and deserialization
   * Note: functions, undefined, Symbol and circular references are not supported
   * @param obj - Object to deep clone
   * @returns New deep-cloned object
   */
  static deepClone<T>(obj: T): T {
    if (obj === null || obj === undefined) {
      return obj;
    }
    try {
      const jsonStr: string = JSON.stringify(obj);
      return JSON.parse(jsonStr) as T;
    } catch (error) {
      hilog.error(DOMAIN, TAG, 'CommonUtils deepCopy failed, error=%{public}s', String(error));
      return obj;
    }
  }

  // ========================================
  // Retry mechanism
  // ========================================

  /**
   * Asynchronous operation executor with retry
   * Automatically retries failed operations according to the configured strategy
   * @param fn - Asynchronous function to execute
   * @param maxRetries - Maximum retry count, default 3
   * @param delayMs - Retry interval in milliseconds, default 1000
   * @param exponentialBackoff - Whether to use exponential backoff, default true
   * @returns Promise of the function result
   */
  static async retry<T>(
    fn: () => Promise<T>,
    maxRetries: number = 3,
    delayMs: number = 1000,
    exponentialBackoff: boolean = true
  ): Promise<T> {
    let lastError: Error | null = null;

    for (let attempt: number = 0; attempt <= maxRetries; attempt++) {
      try {
        const result: T = await fn();
        if (attempt > 0) {
          hilog.info(DOMAIN, TAG, 'CommonUtils retry succeeded, attempt=%{public}d', attempt);
        }
        return result;
      } catch (error) {
        lastError = error instanceof Error ? error : new Error(String(error));
        hilog.warn(DOMAIN, TAG, 'CommonUtils retry failed, attempt=%{public}d, error=%{public}s',
          attempt + 1, lastError.message);

        if (attempt < maxRetries) {
          const waitTime: number = exponentialBackoff
            ? delayMs * Math.pow(2, attempt)
            : delayMs;
          await CommonUtils.delay(waitTime);
        }
      }
    }

    throw lastError;
  }

  // ========================================
  // JSON parsing
  // ========================================

  /**
   * Safely parses a JSON string
   * Returns null instead of throwing on failure
   * @param str - JSON string to parse
   * @returns Parsed object, or null on failure
   */
  static safeJsonParse(str: string | null | undefined): object | null {
    if (str === null || str === undefined || str.trim().length === 0) {
      return null;
    }
    try {
      return JSON.parse(str) as object;
    } catch (error) {
      hilog.warn(DOMAIN, TAG, 'CommonUtils parseJson failed, error=%{public}s', String(error));
      return null;
    }
  }

  /**
   * Safely serializes an object to a JSON string
   * Returns null on serialization failure
   * @param obj - Object to serialize
   * @param pretty - Whether to format the output, default false
   * @returns JSON string, or null on failure
   */
  static safeJsonStringify(obj: object | null | undefined, pretty: boolean = false): string | null {
    if (obj === null || obj === undefined) {
      return null;
    }
    try {
      if (pretty) {
        return JSON.stringify(obj, null, 2);
      }
      return JSON.stringify(obj);
    } catch (error) {
      hilog.warn(DOMAIN, TAG, 'CommonUtils stringify failed, error=%{public}s', String(error));
      return null;
    }
  }

  // ========================================
  // Other utility methods
  // ========================================

  /**
   * Gets the current timestamp (milliseconds)
   * @returns Current time in millisecond timestamp
   */
  static getCurrentTimestamp(): number {
    return Date.now();
  }

  /**
   * Checks whether a value is within the specified range (inclusive)
   * @param value - Number to check
   * @param min - Minimum value
   * @param max - Maximum value
   * @returns true if the value is within range
   */
  static isInRange(value: number, min: number, max: number): boolean {
    return value >= min && value <= max;
  }

  /**
   * Clamps a number to the specified range
   * @param value - Number to clamp
   * @param min - Minimum value
   * @param max - Maximum value
   * @returns Clamped number
   */
  static clamp(value: number, min: number, max: number): number {
    return Math.min(Math.max(value, min), max);
  }
}
