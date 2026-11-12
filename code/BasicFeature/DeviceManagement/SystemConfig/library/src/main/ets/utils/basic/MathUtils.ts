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
// Math utility class
// ========================================

/**
 * Math utility class
 * Provides common static math methods including value clamping, interpolation, rounding,
 * random generation, array statistics and percentage calculations
 */
export class MathUtils {
  /** Default decimal precision */
  private static readonly DEFAULT_PRECISION: number = 2;

  /** Pi constant */
  static readonly PI: number = Math.PI;

  /** Euler's number */
  static readonly E: number = Math.E;

  /** Golden ratio */
  static readonly GOLDEN_RATIO: number = 1.618033988749895;

  // ========================================
  // Value clamping and interpolation
  // ========================================

  /**
   * Clamps a value to the specified range
   * Returns the minimum when below it, and the maximum when above it
   * @param value - Value to clamp
   * @param min - Minimum value
   * @param max - Maximum value
   * @returns Clamped value
   */
  static clamp(value: number, min: number, max: number): number {
    if (min > max) {
      hilog.warn(DOMAIN, TAG, 'MathUtils clamp: min greater than max, auto swapped');
      const temp: number = min;
      min = max;
      max = temp;
    }
    return Math.min(Math.max(value, min), max);
  }

  /**
   * Linear interpolation
   * Interpolates linearly between a and b by parameter t (0-1)
   * @param a - Start value
   * @param b - End value
   * @param t - Interpolation factor (between 0 and 1)
   * @returns Interpolated result
   */
  static lerp(a: number, b: number, t: number): number {
    const clampedT: number = MathUtils.clamp(t, 0, 1);
    return a + (b - a) * clampedT;
  }

  /**
   * Inverse linear interpolation
   * Given a value's position between a and b, returns the interpolation factor
   * @param a - Start value
   * @param b - End value
   * @param value - Actual value
   * @returns Interpolation factor (between 0 and 1)
   */
  static inverseLerp(a: number, b: number, value: number): number {
    if (a === b) {
      return 0;
    }
    return (value - a) / (b - a);
  }

  /**
   * Maps a value from one range to another
   * @param value - Original value
   * @param fromMin - Source range minimum
   * @param fromMax - Source range maximum
   * @param toMin - Target range minimum
   * @param toMax - Target range maximum
   * @returns Mapped value
   */
  static mapRange(value: number, fromMin: number, fromMax: number, toMin: number, toMax: number): number {
    const t: number = MathUtils.inverseLerp(fromMin, fromMax, value);
    return MathUtils.lerp(toMin, toMax, t);
  }

  // ========================================
  // Rounding and precision
  // ========================================

  /**
   * Rounds to the specified decimal places
   * @param value - Value to round
   * @param decimals - Decimal places, default 2
   * @returns Rounded value
   */
  static round(value: number, decimals: number = MathUtils.DEFAULT_PRECISION): number {
    const factor: number = Math.pow(10, decimals);
    return Math.round(value * factor) / factor;
  }

  /**
   * Ceils to the specified decimal places
   * @param value - Value to process
   * @param decimals - Decimal places, default 2
   * @returns Ceiled result
   */
  static ceil(value: number, decimals: number = MathUtils.DEFAULT_PRECISION): number {
    const factor: number = Math.pow(10, decimals);
    return Math.ceil(value * factor) / factor;
  }

  /**
   * Floors to the specified decimal places
   * @param value - Value to process
   * @param decimals - Decimal places, default 2
   * @returns Floored result
   */
  static floor(value: number, decimals: number = MathUtils.DEFAULT_PRECISION): number {
    const factor: number = Math.pow(10, decimals);
    return Math.floor(value * factor) / factor;
  }

  // ========================================
  // Random generation
  // ========================================

  /**
   * Generates a random integer in the specified range
   * @param min - Minimum (inclusive)
   * @param max - Maximum (inclusive)
   * @returns Random integer
   */
  static randomInt(min: number, max: number): number {
    const safeMin: number = Math.ceil(min);
    const safeMax: number = Math.floor(max);
    return Math.floor(Math.random() * (safeMax - safeMin + 1)) + safeMin;
  }

  /**
   * Generates a random float in the specified range
   * @param min - Minimum (inclusive)
   * @param max - Maximum (exclusive)
   * @returns Random float
   */
  static randomFloat(min: number, max: number): number {
    return Math.random() * (max - min) + min;
  }

  /**
   * Picks a random element from an array
   * @param array - Source array
   * @returns Randomly picked element, or undefined for an empty array
   */
  static randomChoice<T>(array: T[]): T | undefined {
    if (array.length === 0) {
      return undefined;
    }
    const index: number = MathUtils.randomInt(0, array.length - 1);
    return array[index];
  }

  /**
   * Generates a random boolean
   * @param probability - Probability of returning true (0-1), default 0.5
   * @returns Random boolean
   */
  static randomBoolean(probability: number = 0.5): boolean {
    return Math.random() < probability;
  }

  // ========================================
  // Range checks
  // ========================================

  /**
   * Checks whether a value is within the specified range (inclusive)
   * @param value - Value to check
   * @param min - Minimum value
   * @param max - Maximum value
   * @returns true if the value is within range
   */
  static isInRange(value: number, min: number, max: number): boolean {
    return value >= min && value <= max;
  }

  /**
   * Checks whether a value is positive
   * @param value - Value to check
   * @returns true if the value is positive
   */
  static isPositive(value: number): boolean {
    return value > 0;
  }

  /**
   * Checks whether a value is negative
   * @param value - Value to check
   * @returns true if the value is negative
   */
  static isNegative(value: number): boolean {
    return value < 0;
  }

  /**
   * Checks whether a value is an integer
   * @param value - Value to check
   * @returns true if the value is an integer
   */
  static isInteger(value: number): boolean {
    return Number.isInteger(value);
  }

  // ========================================
  // Array statistics
  // ========================================

  /**
   * Calculates the average of a numeric array
   * @param numbers - Numeric array
   * @returns Average value, or 0 for an empty array
   */
  static average(numbers: number[]): number {
    if (numbers.length === 0) {
      return 0;
    }
    const total: number = MathUtils.sum(numbers);
    return total / numbers.length;
  }

  /**
   * Calculates the sum of a numeric array
   * @param numbers - Numeric array
   * @returns Sum of all elements
   */
  static sum(numbers: number[]): number {
    let total: number = 0;
    for (let i: number = 0; i < numbers.length; i++) {
      total += numbers[i];
    }
    return total;
  }

  /**
   * Calculates the median of a numeric array
   * @param numbers - Numeric array
   * @returns Median value, or 0 for an empty array
   */
  static median(numbers: number[]): number {
    if (numbers.length === 0) {
      return 0;
    }
    const sorted: number[] = [...numbers].sort((a: number, b: number) => a - b);
    const mid: number = Math.floor(sorted.length / 2);
    if (sorted.length % 2 === 0) {
      return (sorted[mid - 1] + sorted[mid]) / 2;
    }
    return sorted[mid];
  }

  /**
   * Finds the maximum value in an array
   * @param numbers - Numeric array
   * @returns Maximum value, or 0 for an empty array
   */
  static max(numbers: number[]): number {
    if (numbers.length === 0) {
      return 0;
    }
    let maxVal: number = numbers[0];
    for (let i: number = 1; i < numbers.length; i++) {
      if (numbers[i] > maxVal) {
        maxVal = numbers[i];
      }
    }
    return maxVal;
  }

  /**
   * Finds the minimum value in an array
   * @param numbers - Numeric array
   * @returns Minimum value, or 0 for an empty array
   */
  static min(numbers: number[]): number {
    if (numbers.length === 0) {
      return 0;
    }
    let minVal: number = numbers[0];
    for (let i: number = 1; i < numbers.length; i++) {
      if (numbers[i] < minVal) {
        minVal = numbers[i];
      }
    }
    return minVal;
  }

  // ========================================
  // Percentage calculations
  // ========================================

  /**
   * Calculates a percentage
   * @param part - Partial value
   * @param total - Total value
   * @param decimals - Decimal places, default 2
   * @returns Percentage value
   */
  static percentage(part: number, total: number, decimals: number = MathUtils.DEFAULT_PRECISION): number {
    if (total === 0) {
      hilog.warn(DOMAIN, TAG, 'MathUtils percentage: total must not be zero');
      return 0;
    }
    const result: number = (part / total) * 100;
    return MathUtils.round(result, decimals);
  }

  /**
   * Calculates the square of a value
   * @param value - Value to square
   * @returns Squared result
   */
  static square(value: number): number {
    return value * value;
  }

  /**
   * Calculates the Euclidean distance between two points
   * @param x1 - x coordinate of the first point
   * @param y1 - y coordinate of the first point
   * @param x2 - x coordinate of the second point
   * @param y2 - y coordinate of the second point
   * @returns Distance between the points
   */
  static distance(x1: number, y1: number, x2: number, y2: number): number {
    return Math.sqrt(MathUtils.square(x2 - x1) + MathUtils.square(y2 - y1));
  }

  /**
   * Converts degrees to radians
   * @param degrees - Degree value
   * @returns Radian value
   */
  static degreesToRadians(degrees: number): number {
    return degrees * (MathUtils.PI / 180);
  }

  /**
   * Converts radians to degrees
   * @param radians - Radian value
   * @returns Degree value
   */
  static radiansToDegrees(radians: number): number {
    return radians * (180 / MathUtils.PI);
  }
}
