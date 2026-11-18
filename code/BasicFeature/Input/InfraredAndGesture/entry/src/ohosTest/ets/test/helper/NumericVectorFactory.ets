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
 * Deterministic numeric vector factory shared by the logic suites.
 *
 * The factory only builds inputs and closed-form expectations; it never calls
 * the production code under test. A suite can therefore build a large vector,
 * derive the expected aggregate from a closed-form formula and compare it with
 * the value the production code computes, without duplicating the production
 * loop.
 *
 * All methods are pure: they allocate a fresh array on every call.
 */

/** First prime used by the prime generator. */
const FIRST_PRIME: number = 2;
/** Smallest integer that is not a prime. */
const FIRST_COMPOSITE: number = 4;
/** Base of the default power vector. */
const DEFAULT_POWER_BASE: number = 2;

/**
 * Factory of numeric test vectors plus their closed-form expectations.
 */
export class NumericVectorFactory {
  /**
   * Builds an ascending arithmetic sequence.
   * @param count - number of elements, negative counts yield an empty array.
   * @param start - value of the first element.
   * @param step - difference between two neighbouring elements.
   */
  public static ascending(count: number, start: number, step: number): number[] {
    const result: number[] = [];
    for (let i: number = 0; i < count; i++) {
      result.push(start + i * step);
    }
    return result;
  }

  /**
   * Builds a descending arithmetic sequence.
   * @param count - number of elements, negative counts yield an empty array.
   * @param start - value of the first element.
   * @param step - positive difference subtracted between neighbours.
   */
  public static descending(count: number, start: number, step: number): number[] {
    const result: number[] = [];
    for (let i: number = 0; i < count; i++) {
      result.push(start - i * step);
    }
    return result;
  }

  /**
   * Builds a constant vector.
   * @param count - number of elements.
   * @param value - value repeated for every element.
   */
  public static constant(count: number, value: number): number[] {
    const result: number[] = [];
    for (let i: number = 0; i < count; i++) {
      result.push(value);
    }
    return result;
  }

  /**
   * Builds a vector that alternates between two values, starting with first.
   */
  public static alternating(count: number, first: number, second: number): number[] {
    const result: number[] = [];
    for (let i: number = 0; i < count; i++) {
      result.push(i % 2 === 0 ? first : second);
    }
    return result;
  }

  /**
   * Builds the first count non-negative multiples of the given factor.
   * The first element is always zero.
   */
  public static multiples(count: number, factor: number): number[] {
    return NumericVectorFactory.ascending(count, 0, factor);
  }

  /**
   * Builds the powers base^0 .. base^(count-1).
   */
  public static powers(base: number, count: number): number[] {
    const result: number[] = [];
    for (let i: number = 0; i < count; i++) {
      result.push(Math.pow(base, i));
    }
    return result;
  }

  /**
   * Builds the first count prime numbers in ascending order.
   */
  public static primes(count: number): number[] {
    const result: number[] = [];
    let candidate: number = FIRST_PRIME;
    while (result.length < count) {
      if (NumericVectorFactory.isPrime(candidate)) {
        result.push(candidate);
      }
      candidate++;
    }
    return result;
  }

  /**
   * Builds the first count Fibonacci numbers starting with 0 and 1.
   */
  public static fibonacci(count: number): number[] {
    const result: number[] = [];
    for (let i: number = 0; i < count; i++) {
      result.push(NumericVectorFactory.fibonacciValue(i));
    }
    return result;
  }

  /**
   * Builds the first count triangular numbers: 1, 3, 6, 10, ...
   */
  public static triangular(count: number): number[] {
    const result: number[] = [];
    for (let i: number = 1; i <= count; i++) {
      result.push(i * (i + 1) / 2);
    }
    return result;
  }

  /**
   * Builds a zigzag vector: amplitude, -amplitude, amplitude, ...
   */
  public static zigzag(count: number, amplitude: number): number[] {
    return NumericVectorFactory.alternating(count, amplitude, -amplitude);
  }

  /**
   * Builds a row-major matrix whose element at row r and column c equals
   * seed + r * cols + c.
   */
  public static matrix(rows: number, cols: number, seed: number): number[][] {
    const result: number[][] = [];
    for (let r: number = 0; r < rows; r++) {
      const row: number[] = [];
      for (let c: number = 0; c < cols; c++) {
        row.push(seed + r * cols + c);
      }
      result.push(row);
    }
    return result;
  }

  /**
   * Flattens a matrix into a single row-major vector.
   */
  public static flatten(matrix: number[][]): number[] {
    const result: number[] = [];
    for (const row of matrix) {
      for (const value of row) {
        result.push(value);
      }
    }
    return result;
  }

  /**
   * Repeats every element the given number of times.
   */
  public static repeatEach(values: number[], times: number): number[] {
    const result: number[] = [];
    for (const value of values) {
      for (let i: number = 0; i < times; i++) {
        result.push(value);
      }
    }
    return result;
  }

  /**
   * Mirrors the vector around its last element, excluding that element itself.
   */
  public static mirror(values: number[]): number[] {
    const result: number[] = [];
    for (let i: number = values.length - 1; i >= 0; i--) {
      result.push(values[i]);
    }
    return result;
  }

  /**
   * Interleaves two vectors; the longer tail is appended unchanged.
   */
  public static interleave(first: number[], second: number[]): number[] {
    const result: number[] = [];
    const max: number = Math.max(first.length, second.length);
    for (let i: number = 0; i < max; i++) {
      if (i < first.length) {
        result.push(first[i]);
      }
      if (i < second.length) {
        result.push(second[i]);
      }
    }
    return result;
  }

  /**
   * Splits the vector into consecutive buckets of fixed size.
   */
  public static buckets(values: number[], size: number): number[][] {
    const result: number[][] = [];
    if (size <= 0) {
      return result;
    }
    for (let i: number = 0; i < values.length; i += size) {
      result.push(values.slice(i, i + size));
    }
    return result;
  }

  /**
   * Closed-form sum of an arithmetic sequence with count elements.
   * count * first + step * count * (count - 1) / 2
   */
  public static arithmeticSum(count: number, first: number, step: number): number {
    return count * first + step * count * (count - 1) / 2;
  }

  /**
   * Closed-form sum of a constant vector.
   */
  public static constantSum(count: number, value: number): number {
    return count * value;
  }

  /**
   * Closed-form sum of base^0 .. base^(count-1), valid for base other than 1.
   */
  public static powersSum(base: number, count: number): number {
    if (base === 1) {
      return count;
    }
    return (Math.pow(base, count) - 1) / (base - 1);
  }

  /**
   * Closed-form sum of the first count triangular numbers: count*(count+1)*(count+2)/6.
   */
  public static triangularSum(count: number): number {
    return count * (count + 1) * (count + 2) / 6;
  }

  /**
   * Zero-based Fibonacci value.
   */
  public static fibonacciValue(index: number): number {
    if (index <= 0) {
      return 0;
    }
    if (index === 1) {
      return 1;
    }
    let previous: number = 0;
    let current: number = 1;
    for (let i: number = 2; i <= index; i++) {
      const next: number = previous + current;
      previous = current;
      current = next;
    }
    return current;
  }

  /**
   * Closed-form element value of {@link NumericVectorFactory.matrix}.
   */
  public static matrixValue(seed: number, cols: number, row: number, col: number): number {
    return seed + row * cols + col;
  }

  /**
   * Closed-form sum of one matrix row built by {@link NumericVectorFactory.matrix}.
   */
  public static matrixRowSum(seed: number, cols: number, row: number): number {
    return cols * seed + row * cols * cols + cols * (cols - 1) / 2;
  }

  /**
   * Closed-form sum of one matrix column built by {@link NumericVectorFactory.matrix}.
   */
  public static matrixColumnSum(seed: number, rows: number, cols: number, col: number): number {
    return rows * seed + cols * rows * (rows - 1) / 2 + rows * col;
  }

  /**
   * Closed-form sum of every matrix element built by {@link NumericVectorFactory.matrix}.
   */
  public static matrixTotalSum(seed: number, rows: number, cols: number): number {
    return rows * cols * seed
      + cols * cols * rows * (rows - 1) / 2
      + rows * cols * (cols - 1) / 2;
  }

  /**
   * Counts how many elements of the vector satisfy the inclusive range check.
   */
  public static countInRange(values: number[], min: number, max: number): number {
    let count: number = 0;
    for (const value of values) {
      if (value >= min && value <= max) {
        count++;
      }
    }
    return count;
  }

  /**
   * Returns the largest element, or null when the vector is empty.
   */
  public static maxOf(values: number[]): number | null {
    if (values.length === 0) {
      return null;
    }
    let result: number = values[0];
    for (const value of values) {
      if (value > result) {
        result = value;
      }
    }
    return result;
  }

  /**
   * Returns the smallest element, or null when the vector is empty.
   */
  public static minOf(values: number[]): number | null {
    if (values.length === 0) {
      return null;
    }
    let result: number = values[0];
    for (const value of values) {
      if (value < result) {
        result = value;
      }
    }
    return result;
  }

  /**
   * Returns the number of distinct values, computed with a set.
   */
  public static distinctCount(values: number[]): number {
    const seen: Set<number> = new Set<number>();
    for (const value of values) {
      seen.add(value);
    }
    return seen.size;
  }

  /**
   * Checks whether the given number is a prime.
   */
  public static isPrime(value: number): boolean {
    if (value < FIRST_PRIME) {
      return false;
    }
    if (value < FIRST_COMPOSITE) {
      return true;
    }
    for (let divisor: number = FIRST_PRIME; divisor * divisor <= value; divisor++) {
      if (value % divisor === 0) {
        return false;
      }
    }
    return true;
  }

  /**
   * Builds the default power vector used by compact suites.
   */
  public static defaultPowers(count: number): number[] {
    return NumericVectorFactory.powers(DEFAULT_POWER_BASE, count);
  }
}
