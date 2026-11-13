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
// Default character set constants
// ========================================

/** Alphanumeric character set */
const ALPHANUMERIC_CHARS: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
/** Hexadecimal character set */
const HEX_CHARS: string = '0123456789abcdef';

// ========================================
// Random weight item interface
// ========================================

/**
 * Weighted random item interface.
 * Pairs an entry with its weight for the weightedRandom method.
 */
export interface WeightedItem<T> {
  /** Data value of the random item */
  item: T;
  /** Weight of the random item (larger means more likely to be chosen) */
  weight: number;
}

// ========================================
// Random utility class
// ========================================

/**
 * Random number generation utility class.
 * Provides various random data generation capabilities including integers,
 * floats, strings, UUIDs, color values, array shuffling and weighted random.
 */
export class RandomUtils {
  /**
   * Generates a random integer within the specified range.
   * Includes the minimum value, excludes the maximum value.
   * @param {number} min - Minimum value (inclusive)
   * @param {number} max - Maximum value (exclusive)
   * @returns {number} Random integer
   */
  static nextInt(min: number, max: number): number {
    if (min >= max) {
      hilog.warn(DOMAIN, TAG, 'RandomUtils nextInt: min >= max, returning min=%{public}d', min);
      return min;
    }
    const result: number = Math.floor(Math.random() * (max - min)) + min;
    hilog.debug(DOMAIN, TAG, 'RandomUtils nextInt: min=%{public}d, max=%{public}d, result=%{public}d',
      min, max, result);
    return result;
  }

  /**
   * Generates a random float within the specified range.
   * @param {number} min - Minimum value (inclusive)
   * @param {number} max - Maximum value (inclusive)
   * @returns {number} Random float
   */
  static nextFloat(min: number, max: number): number {
    if (min > max) {
      hilog.warn(DOMAIN, TAG, 'RandomUtils nextFloat: min > max, swapping values');
      const temp: number = min;
      min = max;
      max = temp;
    }
    const result: number = Math.random() * (max - min) + min;
    hilog.debug(DOMAIN, TAG, 'RandomUtils nextFloat: result=%{public}s', result.toFixed(4));
    return result;
  }

  /**
   * Generates a random boolean value.
   * @returns {boolean} Random true or false
   */
  static nextBoolean(): boolean {
    const result: boolean = Math.random() >= 0.5;
    hilog.debug(DOMAIN, TAG, 'RandomUtils nextBoolean: result=%{public}s', result.toString());
    return result;
  }

  /**
   * Generates a random string of the specified length.
   * Uses the alphanumeric character set by default, with an optional custom set.
   * @param {number} length - Length of the string to generate
   * @param {string} [chars] - Optional custom character set
   * @returns {string} Random string
   */
  static nextString(length: number, chars?: string): string {
    const charSet: string = chars ?? ALPHANUMERIC_CHARS;
    let result: string = '';

    for (let i: number = 0; i < length; i++) {
      const randomIndex: number = Math.floor(Math.random() * charSet.length);
      result += charSet.charAt(randomIndex);
    }

    hilog.debug(DOMAIN, TAG, 'RandomUtils nextString: length=%{public}d, resultLength=%{public}d',
      length, result.length);
    return result;
  }

  /**
   * Generates a random hexadecimal string of the specified length.
   * @param {number} length - Length of the hexadecimal string
   * @returns {string} Random hexadecimal string (lowercase)
   */
  static nextHex(length: number): string {
    let result: string = '';

    for (let i: number = 0; i < length; i++) {
      const randomIndex: number = Math.floor(Math.random() * HEX_CHARS.length);
      result += HEX_CHARS.charAt(randomIndex);
    }

    hilog.debug(DOMAIN, TAG, 'RandomUtils nextHex: length=%{public}d', length);
    return result;
  }

  // ========================================
  // UUID generation
  // ========================================

  /**
   * Generates a simulated UUID (v4 format) string.
   * Format: xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx,
   * where y is one of 8, 9, a or b.
   * @returns {string} Simulated UUID string
   */
  static nextUuid(): string {
    const section1: string = RandomUtils.nextHex(8);
    const section2: string = RandomUtils.nextHex(4);
    const section3: string = '4' + RandomUtils.nextHex(3);
    const variantChars: string = '89ab';
    const variantChar: string = variantChars.charAt(Math.floor(Math.random() * variantChars.length));
    const section4: string = variantChar + RandomUtils.nextHex(3);
    const section5: string = RandomUtils.nextHex(12);

    const uuid: string = `${section1}-${section2}-${section3}-${section4}-${section5}`;
    hilog.debug(DOMAIN, TAG, 'RandomUtils nextUuid: generated=%{public}s', uuid);
    return uuid;
  }

  // ========================================
  // Color and element operations
  // ========================================

  /**
   * Generates a random hexadecimal color value.
   * Format: #RRGGBB, each channel being two hexadecimal digits.
   * @returns {string} Random color value (e.g. #a3f2c1)
   */
  static nextColor(): string {
    const color: string = '#' + RandomUtils.nextHex(6);
    hilog.debug(DOMAIN, TAG, 'RandomUtils nextColor: %{public}s', color);
    return color;
  }

  /**
   * Picks a random element from an array.
   * The array must not be empty, otherwise undefined is returned.
   * @param {T[]} array - Source array
   * @returns {T | undefined} Randomly selected element
   */
  static nextElement<T>(array: T[]): T | undefined {
    if (array.length === 0) {
      hilog.warn(DOMAIN, TAG, 'RandomUtils nextElement: array is empty');
      return undefined;
    }
    const index: number = Math.floor(Math.random() * array.length);
    hilog.debug(DOMAIN, TAG, 'RandomUtils nextElement: selected index=%{public}d', index);
    return array[index];
  }

  /**
   * Shuffles an array with the Fisher-Yates algorithm.
   * Returns a new shuffled array without modifying the original one.
   * @param {T[]} array - Array to shuffle
   * @returns {T[]} New shuffled array
   */
  static shuffle<T>(array: T[]): T[] {
    const result: T[] = [...array];
    hilog.info(DOMAIN, TAG, 'RandomUtils shuffle: shuffling array of length=%{public}d', result.length);

    for (let i: number = result.length - 1; i > 0; i--) {
      const j: number = Math.floor(Math.random() * (i + 1));
      const temp: T = result[i];
      result[i] = result[j];
      result[j] = temp;
    }

    hilog.debug(DOMAIN, TAG, 'RandomUtils shuffle: shuffle complete');
    return result;
  }

  // ========================================
  // Range and weighted random
  // ========================================

  /**
   * Generates a random value within a range by step.
   * Starting from min and advancing by step, one of the values is picked randomly.
   * @param {number} min - Range minimum (inclusive)
   * @param {number} max - Range maximum (inclusive)
   * @param {number} step - Step size (must be greater than 0)
   * @returns {number} Random stepped value within the range
   */
  static nextInRange(min: number, max: number, step: number): number {
    if (step <= 0) {
      hilog.error(DOMAIN, TAG, 'RandomUtils nextInRange: step must be positive, got=%{public}s', step.toString());
      return min;
    }
    if (min > max) {
      hilog.warn(DOMAIN, TAG, 'RandomUtils nextInRange: min > max, returning min');
      return min;
    }

    const stepsCount: number = Math.floor((max - min) / step);
    const randomStep: number = Math.floor(Math.random() * (stepsCount + 1));
    const result: number = min + randomStep * step;
    hilog.debug(DOMAIN, TAG, 'RandomUtils nextInRange: result=%{public}s', result.toString());
    return result;
  }

  /**
   * Picks one entry randomly from a list according to its weights.
   * Entries with larger weights are more likely to be chosen.
   * @param {T[]} items - Candidate item array
   * @param {number[]} weights - Corresponding weight array (must match items in length)
   * @returns {T | undefined} Selected item, or undefined when the list is empty
   */
  static weightedRandom<T>(items: T[], weights: number[]): T | undefined {
    if (items.length === 0 || weights.length === 0) {
      hilog.warn(DOMAIN, TAG, 'RandomUtils weightedRandom: empty items or weights');
      return undefined;
    }

    if (items.length !== weights.length) {
      hilog.error(DOMAIN, TAG, 'RandomUtils weightedRandom: items and weights length mismatch');
      return undefined;
    }

    // Compute the total weight
    let totalWeight: number = 0;
    for (const weight of weights) {
      totalWeight += Math.max(0, weight);
    }

    if (totalWeight <= 0) {
      hilog.warn(DOMAIN, TAG, 'RandomUtils weightedRandom: total weight is zero, using uniform random');
      return items[Math.floor(Math.random() * items.length)];
    }

    // Generate a random value and look it up in the weight intervals
    let randomValue: number = Math.random() * totalWeight;
    for (let i: number = 0; i < items.length; i++) {
      randomValue -= Math.max(0, weights[i]);
      if (randomValue < 0) {
        hilog.debug(DOMAIN, TAG, 'RandomUtils weightedRandom: selected index=%{public}d', i);
        return items[i];
      }
    }

    // Fall back to the last element
    return items[items.length - 1];
  }
}
