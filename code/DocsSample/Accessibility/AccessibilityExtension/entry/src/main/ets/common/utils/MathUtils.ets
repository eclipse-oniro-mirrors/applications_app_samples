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
const PERCENT_BASE: number = 100;
const PERCENT_MIN: number = 0;
const PERCENT_MAX: number = 100;
const DIGIT_BASE: number = 10;
const FIRST_PRIME: number = 2;

/**
 * Arithmetic helpers backing the ohosTest utility suites.
 *
 * Division, modulo and percentage members collapse a zero divisor to zero so
 * that a suite can assert the fallback without expecting an exception.
 */
export class MathUtils {
  /**
   * Adds the two operands.
   */
  static add(first: number, second: number): number {
    hilog.info(DOMAIN, TAG, 'MathUtils.add second=%{public}d', second);
    return first + second;
  }

  /**
   * Subtracts the second operand from the first one.
   */
  static sub(first: number, second: number): number {
    hilog.info(DOMAIN, TAG, 'MathUtils.sub second=%{public}d', second);
    return first - second;
  }

  /**
   * Multiplies the two operands.
   */
  static mul(first: number, second: number): number {
    hilog.info(DOMAIN, TAG, 'MathUtils.mul second=%{public}d', second);
    return first * second;
  }

  /**
   * Divides the first operand, a zero divisor yields zero.
   */
  static divSafe(first: number, second: number): number {
    hilog.info(DOMAIN, TAG, 'MathUtils.divSafe second=%{public}d', second);
    if (second === 0) {
      return 0;
    }
    return first / second;
  }

  /**
   * Returns the remainder, a zero divisor yields zero.
   */
  static modSafe(first: number, second: number): number {
    hilog.info(DOMAIN, TAG, 'MathUtils.modSafe second=%{public}d', second);
    if (second === 0) {
      return 0;
    }
    return first % second;
  }

  /**
   * Returns the mean of the two operands.
   */
  static averageOfTwo(first: number, second: number): number {
    hilog.info(DOMAIN, TAG, 'MathUtils.averageOfTwo second=%{public}d', second);
    return (first + second) / 2;
  }

  /**
   * Returns the median of the three operands.
   */
  static medianOfThree(first: number, second: number, third: number): number {
    hilog.info(DOMAIN, TAG, 'MathUtils.medianOfThree third=%{public}d', third);
    if ((first >= second && first <= third) || (first >= third && first <= second)) {
      return first;
    }
    if ((second >= first && second <= third) || (second >= third && second <= first)) {
      return second;
    }
    return third;
  }

  /**
   * Reports whether the value is divisible only by one and itself.
   */
  static isPrime(value: number): boolean {
    hilog.info(DOMAIN, TAG, 'MathUtils.isPrime value=%{public}d', value);
    if (value < FIRST_PRIME) {
      return false;
    }
    let divisor: number = FIRST_PRIME;
    while (divisor * divisor <= value) {
      if (value % divisor === 0) {
        return false;
      }
      divisor = divisor + 1;
    }
    return true;
  }

  /**
   * Returns the Fibonacci number at the requested position, negatives yield zero.
   */
  static fib(value: number): number {
    hilog.info(DOMAIN, TAG, 'MathUtils.fib value=%{public}d', value);
    if (value < 0) {
      return 0;
    }
    if (value === 0) {
      return 0;
    }
    if (value === 1) {
      return 1;
    }
    let previous: number = 0;
    let current: number = 1;
    let index: number = 2;
    while (index <= value) {
      const next: number = previous + current;
      previous = current;
      current = next;
      index = index + 1;
    }
    return current;
  }

  /**
   * Returns the Euclidean distance from (value, value) to the origin.
   */
  static distanceToOrigin(value: number): number {
    hilog.info(DOMAIN, TAG, 'MathUtils.distanceToOrigin value=%{public}d', value);
    return Math.sqrt(value * value + value * value);
  }

  /**
   * Returns the requested percentage of the value.
   */
  static percentOf(value: number, percent: number): number {
    hilog.info(DOMAIN, TAG, 'MathUtils.percentOf percent=%{public}d', percent);
    return value * percent / PERCENT_BASE;
  }

  /**
   * Restricts the value to the inclusive [0, 100] window.
   */
  static clampPercent(value: number): number {
    hilog.info(DOMAIN, TAG, 'MathUtils.clampPercent value=%{public}d', value);
    if (value < PERCENT_MIN) {
      return PERCENT_MIN;
    }
    if (value > PERCENT_MAX) {
      return PERCENT_MAX;
    }
    return value;
  }

  /**
   * Counts the set bits of the magnitude, negatives yield zero.
   */
  static popCount(value: number): number {
    hilog.info(DOMAIN, TAG, 'MathUtils.popCount value=%{public}d', value);
    if (value <= 0) {
      return 0;
    }
    let rest: number = Math.trunc(value);
    let total: number = 0;
    while (rest > 0) {
      if (rest % 2 === 1) {
        total = total + 1;
      }
      rest = Math.floor(rest / 2);
    }
    return total;
  }

  /**
   * Adds up the decimal digits of the magnitude.
   */
  static sumDigits(value: number): number {
    hilog.info(DOMAIN, TAG, 'MathUtils.sumDigits value=%{public}d', value);
    let rest: number = Math.abs(Math.trunc(value));
    let total: number = 0;
    while (rest > 0) {
      total = total + rest % DIGIT_BASE;
      rest = Math.floor(rest / DIGIT_BASE);
    }
    return total;
  }
}
