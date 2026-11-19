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


/**
 * Pure numeric puzzle helpers used by the number matrix test suites.
 */
export class NumberPuzzleUtil {
  /**
   * Sum every proper divisor of a positive integer.
   * A proper divisor is a divisor smaller than the number itself.
   * @param value the number whose proper divisors are summed
   * @returns the sum of the proper divisors, or 0 for values below 2
   */
  public static divisorSum(value: number): number {
    if (value <= 1) {
      return 0;
    }
    let sum: number = 1;
    for (let divisor = 2; divisor * divisor <= value; divisor++) {
      if (value % divisor === 0) {
        sum = sum + divisor;
        const pair: number = value / divisor;
        if (pair !== divisor) {
          sum = sum + pair;
        }
      }
    }
    return sum;
  }

  /**
   * Classify a number by comparing it with the sum of its proper divisors.
   * The result is one of perfect, abundant, deficient or invalid.
   * @param value the number to classify
   * @returns the classification keyword of the number
   */
  public static classifyNumber(value: number): string {
    if (value <= 0) {
      return 'invalid';
    }
    const sum: number = NumberPuzzleUtil.divisorSum(value);
    if (sum === value) {
      return 'perfect';
    }
    if (sum > value) {
      return 'abundant';
    }
    return 'deficient';
  }

  /**
   * Count how many Collatz steps are needed to reach 1.
   * Even values are halved and odd values become three times plus one.
   * @param value the starting value of the Collatz sequence
   * @returns the step count, or 0 when the value is already 1 or below
   */
  public static collatzSteps(value: number): number {
    if (value <= 1) {
      return 0;
    }
    let current: number = value;
    let steps: number = 0;
    while (current !== 1 && steps < 1000) {
      if (current % 2 === 0) {
        current = current / 2;
      } else {
        current = current * 3 + 1;
      }
      steps = steps + 1;
    }
    return steps;
  }

  /**
   * Square every decimal digit of a non negative value and sum the squares.
   * @param value the value whose digits are squared and summed
   * @returns the sum of the squared digits
   */
  private static squareDigitSum(value: number): number {
    if (value <= 0) {
      return 0;
    }
    let current: number = value;
    let sum: number = 0;
    while (current > 0) {
      const digit: number = current % 10;
      sum = sum + digit * digit;
      current = Math.floor(current / 10);
    }
    return sum;
  }

  /**
   * Check whether repeatedly summing squared digits reaches 1.
   * The loop is guarded so unhappy numbers terminate.
   * @param value the number to test
   * @returns true when the number is happy
   */
  public static isHappyNumber(value: number): boolean {
    if (value <= 0) {
      return false;
    }
    let current: number = value;
    let guard: number = 0;
    while (current !== 1 && guard < 100) {
      current = NumberPuzzleUtil.squareDigitSum(current);
      guard = guard + 1;
    }
    return current === 1;
  }

  /**
   * Compute the triangular number of a one based index.
   * Index 0 and negative indexes map to zero.
   * @param index the one based index of the triangular number
   * @returns the triangular number, or 0 for indexes below 1
   */
  public static triangularNumber(index: number): number {
    if (index <= 0) {
      return 0;
    }
    return index * (index + 1) / 2;
  }

  /**
   * Check whether a value is a triangular number by solving eight n plus one.
   * The square root is rounded down and compared with the exact square.
   * @param value the value to test
   * @returns true when the value is triangular
   */
  public static isTriangular(value: number): boolean {
    if (value < 0) {
      return false;
    }
    if (value === 0) {
      return true;
    }
    const target: number = 8 * value + 1;
    const root: number = Math.floor(Math.sqrt(target));
    return root * root === target;
  }

  /**
   * Repeatedly sum the decimal digits until one digit remains.
   * Non positive values map to zero.
   * @param value the value whose digital root is computed
   * @returns the digital root in the range from 0 to 9
   */
  public static digitalRoot(value: number): number {
    if (value <= 0) {
      return 0;
    }
    let current: number = value;
    while (current >= 10) {
      let sum: number = 0;
      while (current > 0) {
        sum = sum + current % 10;
        current = Math.floor(current / 10);
      }
      current = sum;
    }
    return current;
  }

  /**
   * Check whether a positive integer is an exact power of two.
   * The value is divided by two until it becomes odd.
   * @param value the value to test
   * @returns true when the value is a power of two
   */
  public static isPowerOfTwo(value: number): boolean {
    if (value < 1) {
      return false;
    }
    let current: number = value;
    while (current % 2 === 0) {
      current = current / 2;
    }
    return current === 1;
  }

  /**
   * Find the smallest power of two that is greater than or equal to a value.
   * Values below two map to one.
   * @param value the lower bound of the requested power
   * @returns the smallest power of two covering the value
   */
  public static nextPowerOfTwo(value: number): number {
    if (value <= 1) {
      return 1;
    }
    let result: number = 1;
    while (result < value) {
      result = result * 2;
    }
    return result;
  }

  /**
   * Multiply every decimal digit of a non negative value.
   * The result is 0 when any digit is 0.
   * @param value the value whose digits are multiplied
   * @returns the product of the decimal digits
   */
  public static digitProduct(value: number): number {
    if (value <= 0) {
      return 0;
    }
    let current: number = value;
    let product: number = 1;
    while (current > 0) {
      product = product * (current % 10);
      current = Math.floor(current / 10);
    }
    return product;
  }

  /**
   * Reverse the decimal digits of a non negative value.
   * Trailing zeros disappear because the result is numeric.
   * @param value the value whose digits are reversed
   * @returns the reversed number, or 0 for non positive input
   */
  public static reverseNumber(value: number): number {
    if (value <= 0) {
      return 0;
    }
    let current: number = value;
    let result: number = 0;
    while (current > 0) {
      result = result * 10 + current % 10;
      current = Math.floor(current / 10);
    }
    return result;
  }

  /**
   * Count the Kaprekar routine steps that reach the constant 6174.
   * Repeated digits never converge and are reported as minus one.
   * @param value the four digit starting value
   * @returns the step count, or -1 when the value is invalid or never converges
   */
  public static kaprekarSteps(value: number): number {
    if (value < 1000 || value > 9999) {
      return -1;
    }
    if (value === 6174) {
      return 0;
    }
    let current: number = value;
    let steps: number = 0;
    while (steps < 20) {
      const digits: number[] = [
        Math.floor(current / 1000) % 10,
        Math.floor(current / 100) % 10,
        Math.floor(current / 10) % 10,
        current % 10
      ];
      for (let i = 0; i < 4; i++) {
        for (let j = 0; j < 3 - i; j++) {
          if (digits[j] > digits[j + 1]) {
            const swap: number = digits[j];
            digits[j] = digits[j + 1];
            digits[j + 1] = swap;
          }
        }
      }
      const ascending: number = digits[0] * 1000 + digits[1] * 100 + digits[2] * 10 + digits[3];
      const descending: number = digits[3] * 1000 + digits[2] * 100 + digits[1] * 10 + digits[0];
      const next: number = descending - ascending;
      steps = steps + 1;
      if (next === 6174) {
        return steps;
      }
      if (next === current) {
        return -1;
      }
      current = next;
    }
    return -1;
  }
}
