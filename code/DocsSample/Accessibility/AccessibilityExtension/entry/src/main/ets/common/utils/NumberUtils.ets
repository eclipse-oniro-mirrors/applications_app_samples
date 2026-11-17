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
const EVEN_DIVISOR: number = 2;
const DEFAULT_LOW: number = 0;
const DEFAULT_HIGH: number = 10;
const ROUND_FACTOR: number = 10;
const MAX_FACTORIAL_INPUT: number = 10;
const DIGIT_BASE: number = 10;
const STEP_SIZE: number = 5;

/**
 * Integer and floating point helpers backing the ohosTest utility suites.
 *
 * Guarded inputs (empty ranges, zero divisors, oversized factorials) collapse to
 * a documented fallback instead of throwing so that a suite never fails on
 * plumbing.
 */
export class NumberUtils {
  /**
   * Restricts the value to the inclusive [low, high] window.
   */
  static clamp(value: number, low: number, high: number): number {
    hilog.info(DOMAIN, TAG, 'NumberUtils.clamp low=%{public}d high=%{public}d', low, high);
    if (value < low) {
      return low;
    }
    if (value > high) {
      return high;
    }
    return value;
  }

  /**
   * Reports whether the value divides evenly by two.
   */
  static isEven(value: number): boolean {
    hilog.info(DOMAIN, TAG, 'NumberUtils.isEven value=%{public}d', value);
    return Math.abs(value % EVEN_DIVISOR) === 0;
  }

  /**
   * Reports whether the value leaves a remainder of one when halved.
   */
  static isOdd(value: number): boolean {
    hilog.info(DOMAIN, TAG, 'NumberUtils.isOdd value=%{public}d', value);
    return Math.abs(value % EVEN_DIVISOR) === 1;
  }

  /**
   * Returns the magnitude of the value.
   */
  static absOf(value: number): number {
    hilog.info(DOMAIN, TAG, 'NumberUtils.absOf value=%{public}d', value);
    return value < 0 ? -value : value;
  }

  /**
   * Rounds the value to a single fractional digit.
   */
  static roundTo1(value: number): number {
    hilog.info(DOMAIN, TAG, 'NumberUtils.roundTo1 value=%{public}d', value);
    return Math.round(value * ROUND_FACTOR) / ROUND_FACTOR;
  }

  /**
   * Adds up every integer in [low, high], an inverted window yields zero.
   */
  static sumRange(low: number, high: number): number {
    hilog.info(DOMAIN, TAG, 'NumberUtils.sumRange low=%{public}d high=%{public}d', low, high);
    if (high < low) {
      return 0;
    }
    let total: number = 0;
    let current: number = low;
    while (current <= high) {
      total = total + current;
      current = current + 1;
    }
    return total;
  }

  /**
   * Greatest common divisor using the Euclidean algorithm on magnitudes.
   */
  static gcd(first: number, second: number): number {
    hilog.info(DOMAIN, TAG, 'NumberUtils.gcd first=%{public}d second=%{public}d', first, second);
    let left: number = Math.abs(first);
    let right: number = Math.abs(second);
    while (right !== 0) {
      const rest: number = left % right;
      left = right;
      right = rest;
    }
    return left;
  }

  /**
   * Least common multiple, zero when either operand is zero.
   */
  static lcm(first: number, second: number): number {
    hilog.info(DOMAIN, TAG, 'NumberUtils.lcm first=%{public}d second=%{public}d', first, second);
    if (first === 0 || second === 0) {
      return 0;
    }
    const divisor: number = NumberUtils.gcd(first, second);
    return Math.abs(first * second) / divisor;
  }

  /**
   * Factorial restricted to [0, 10]; negatives and oversized inputs yield zero.
   */
  static factorial(value: number): number {
    hilog.info(DOMAIN, TAG, 'NumberUtils.factorial value=%{public}d', value);
    if (value < 0 || value > MAX_FACTORIAL_INPUT) {
      return 0;
    }
    if (value === 0) {
      return 1;
    }
    let total: number = 1;
    let current: number = value;
    while (current > 0) {
      total = total * current;
      current = current - 1;
    }
    return total;
  }

  /**
   * Squares the value.
   */
  static square(value: number): number {
    hilog.info(DOMAIN, TAG, 'NumberUtils.square value=%{public}d', value);
    return value * value;
  }

  /**
   * Counts the decimal digits of the magnitude, zero counts as one digit.
   */
  static digitCount(value: number): number {
    hilog.info(DOMAIN, TAG, 'NumberUtils.digitCount value=%{public}d', value);
    let rest: number = Math.abs(Math.trunc(value));
    let total: number = 1;
    while (rest >= DIGIT_BASE) {
      rest = Math.floor(rest / DIGIT_BASE);
      total = total + 1;
    }
    return total;
  }

  /**
   * Returns -1, 0 or 1 according to the sign of the value.
   */
  static signOf(value: number): number {
    hilog.info(DOMAIN, TAG, 'NumberUtils.signOf value=%{public}d', value);
    if (value > 0) {
      return 1;
    }
    if (value < 0) {
      return -1;
    }
    return 0;
  }

  /**
   * Reports whether the value sits inside the inclusive window.
   */
  static isInRange(value: number, low: number = DEFAULT_LOW, high: number = DEFAULT_HIGH): boolean {
    hilog.info(DOMAIN, TAG, 'NumberUtils.isInRange value=%{public}d', value);
    return value >= low && value <= high;
  }

  /**
   * Rounds a positive value up to the next multiple of the step size.
   */
  static roundUpToStep(value: number): number {
    hilog.info(DOMAIN, TAG, 'NumberUtils.roundUpToStep value=%{public}d', value);
    if (value <= 0) {
      return 0;
    }
    let stepped: number = 0;
    while (stepped < value) {
      stepped = stepped + STEP_SIZE;
    }
    return stepped;
  }
}
