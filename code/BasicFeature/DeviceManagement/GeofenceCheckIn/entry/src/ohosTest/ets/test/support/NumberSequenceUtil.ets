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
// Smallest digit value a decimal digit can take.
const MIN_DIGIT_VALUE: number = 0;
// Smallest base accepted by the base conversion helpers (binary).
const MIN_BASE: number = 2;
// Largest base accepted by the base conversion helpers (base 36, digits plus letters).
const MAX_BASE: number = 36;
// Digit characters used by the base conversion helpers, index equals the digit value.
const DIGIT_CHARS: string = '0123456789abcdefghijklmnopqrstuvwxyz';
// Result of a failed base conversion, kept stable so tests can assert it.
const INVALID_BASE_RESULT: string = '';
// Guard used by every sequence generator to keep memory bounded.
const MAX_GENERATED_COUNT: number = 4096;
// Largest n accepted by factorial before the double precision result loses integers.
const MAX_FACTORIAL_N: number = 170;
// Smallest integer accepted by the digit based helpers.
const MIN_DIGIT_INPUT: number = 0;
// Step used when a caller passes a zero or non finite step to range().
const DEFAULT_RANGE_STEP: number = 1;
// Empty text returned by formatBase for malformed input.
const EMPTY_TEXT: string = '';
/**
 * Pure static helpers that build numeric sequences and answer small number theory questions.
 * Every method is deterministic: illegal input is mapped onto a documented fallback value instead of throwing,
 * so the helpers can be used freely inside ohosTest cases without try/catch noise.
 */
export class NumberSequenceUtil {
  /**
   * Build the inclusive numeric sequence from start to end with the given step.
   * When step is zero, negative, NaN or infinite the fallback step 1 is used (direction is derived from start/end).
   * @param start first value of the sequence
   * @param end last value that may be reached, inclusive
   * @param step optional positive step distance, defaults to 1
   * @returns ascending array when start <= end, descending array when start > end, empty when nothing fits
   */
  public static range(start: number, end: number, step?: number): number[] {
    const result: number[] = [];
    // Normalize non usable steps so the loop always terminates.
    let stepSize: number = step === undefined ? DEFAULT_RANGE_STEP : step;
    if (!Number.isFinite(stepSize) || stepSize <= 0) {
      stepSize = DEFAULT_RANGE_STEP;
    }
    // Ascending direction: walk from start upwards until the end is passed.
    if (start <= end) {
      for (let value: number = start; value <= end; value = value + stepSize) {
        result.push(value);
        if (result.length > MAX_GENERATED_COUNT) {
          break;
        }
      }
      return result;
    }
    // Descending direction: walk from start downwards until the end is passed.
    for (let value: number = start; value >= end; value = value - stepSize) {
      result.push(value);
      if (result.length > MAX_GENERATED_COUNT) {
        break;
      }
    }
    return result;
  }
  /**
   * Build an arithmetic series of count terms starting at first with a fixed difference.
   * @param first the first term of the series
   * @param diff the difference added between two neighbouring terms, may be negative or zero
   * @param count the number of terms, non positive or non finite counts produce an empty array
   * @returns the generated terms in order
   */
  public static arithmeticSeries(first: number, diff: number, count: number): number[] {
    const result: number[] = [];
    // A guard keeps the generated array small and the contract explicit.
    if (!Number.isFinite(first) || !Number.isFinite(diff) || !Number.isFinite(count)) {
      return result;
    }
    if (count <= 0) {
      return result;
    }
    let term: number = first;
    for (let index: number = 0; index < count; index++) {
      result.push(term);
      term = term + diff;
      if (result.length >= MAX_GENERATED_COUNT) {
        break;
      }
    }
    return result;
  }
  /**
   * Build a geometric series of count terms starting at first with a fixed ratio.
   * @param first the first term, returned as is when count is 1
   * @param ratio the multiplier applied between two neighbouring terms, may be fractional or zero
   * @param count the number of terms, non positive or non finite counts produce an empty array
   * @returns the generated terms in order
   */
  public static geometricSeries(first: number, ratio: number, count: number): number[] {
    const result: number[] = [];
    // Reject unstable inputs before multiplying anything.
    if (!Number.isFinite(first) || !Number.isFinite(ratio) || !Number.isFinite(count)) {
      return result;
    }
    if (count <= 0) {
      return result;
    }
    let term: number = first;
    for (let index: number = 0; index < count; index++) {
      result.push(term);
      term = term * ratio;
      if (result.length >= MAX_GENERATED_COUNT) {
        break;
      }
    }
    return result;
  }
  /**
   * Build the Fibonacci sequence starting from F(0) = 0 and F(1) = 1.
   * Terms above 2^53 lose precision in double arithmetic, callers should stay below 78 terms.
   * @param count the number of terms, non positive or non finite counts produce an empty array
   * @returns the first count Fibonacci numbers in ascending order
   */
  public static fibonacci(count: number): number[] {
    const result: number[] = [];
    if (!Number.isFinite(count) || count <= 0) {
      return result;
    }
    // The first term of the sequence is zero.
    result.push(0);
    if (count === 1) {
      return result;
    }
    // The second term of the sequence is one.
    result.push(1);
    for (let index: number = 2; index < count; index++) {
      const previous: number = result[index - 1];
      const beforePrevious: number = result[index - 2];
      result.push(previous + beforePrevious);
      if (result.length >= MAX_GENERATED_COUNT) {
        break;
      }
    }
    return result;
  }
  /**
   * Collect every prime strictly below the requested limit using trial division.
   * @param limit the exclusive upper bound, values below 2 produce an empty array
   * @returns ascending prime numbers, ending at the largest prime below limit
   */
  public static primesBelow(limit: number): number[] {
    const result: number[] = [];
    if (!Number.isFinite(limit) || limit <= MIN_BASE) {
      return result;
    }
    // Test every candidate from 2 up to limit - 1.
    for (let candidate: number = MIN_BASE; candidate < limit; candidate++) {
      if (NumberSequenceUtil.isPrime(candidate)) {
        result.push(candidate);
      }
    }
    return result;
  }
  /**
   * Check whether a candidate is a prime number by trial division up to its square root.
   * @param candidate the number to test
   * @returns true only for prime numbers, false for 0, 1, negatives and composites
   */
  public static isPrime(candidate: number): boolean {
    // Only integers greater than one can be prime.
    if (!Number.isFinite(candidate) || candidate !== Math.floor(candidate) || candidate < MIN_BASE) {
      return false;
    }
    if (candidate === 2) {
      return true;
    }
    // Every even number greater than two is composite.
    if (candidate % 2 === 0) {
      return false;
    }
    // Trial divide by odd factors up to the square root of the candidate.
    for (let divisor: number = 3; divisor * divisor <= candidate; divisor = divisor + 2) {
      if (candidate % divisor === 0) {
        return false;
      }
    }
    return true;
  }
  /**
   * Compute the greatest common divisor with the Euclidean algorithm.
   * @param a first operand, may be negative
   * @param b second operand, may be negative
   * @returns a non negative divisor, gcd(0, 0) is defined as 0
   */
  public static gcd(a: number, b: number): number {
    // Non integer operands are truncated towards zero first.
    let left: number = Math.abs(Math.trunc(a));
    let right: number = Math.abs(Math.trunc(b));
    if (!Number.isFinite(left) || !Number.isFinite(right)) {
      return 0;
    }
    // Replace the pair by (right, left mod right) until the remainder is zero.
    while (right !== 0) {
      const remainder: number = left % right;
      left = right;
      right = remainder;
    }
    return left;
  }
  /**
   * Compute the least common multiple of two operands.
   * @param a first operand, may be negative
   * @param b second operand, may be negative
   * @returns the non negative multiple, or 0 when either operand is zero or non finite
   */
  public static lcm(a: number, b: number): number {
    if (!Number.isFinite(a) || !Number.isFinite(b) || a === 0 || b === 0) {
      return 0;
    }
    // Divide before multiplying so the intermediate value stays small.
    const divisor: number = NumberSequenceUtil.gcd(a, b);
    if (divisor === 0) {
      return 0;
    }
    return Math.abs(Math.trunc(a) / divisor * Math.trunc(b));
  }
  /**
   * Compute n! with a plain loop so the intermediate product stays visible.
   * @param n the operand, must be an integer in [0, 170]
   * @returns the factorial, 1 for 0 and 1, and 0 for illegal operands
   */
  public static factorial(n: number): number {
    if (!Number.isFinite(n) || n !== Math.floor(n) || n < 0 || n > MAX_FACTORIAL_N) {
      return 0;
    }
    let product: number = 1;
    for (let factor: number = 2; factor <= n; factor++) {
      product = product * factor;
    }
    return product;
  }
  /**
   * Sum the decimal digits of a non negative integer.
   * @param n the operand, negative values are converted to their absolute value
   * @returns the digit sum, 0 for 0
   */
  public static digitSum(n: number): number {
    if (!Number.isFinite(n)) {
      return 0;
    }
    let value: number = Math.abs(Math.trunc(n));
    let sum: number = 0;
    // Strip the last decimal digit on every iteration.
    while (value > 0) {
      sum = sum + value % 10;
      value = Math.floor(value / 10);
    }
    return sum;
  }
  /**
   * Reverse the decimal digits of a non negative integer.
   * @param n the operand, negative values are converted to their absolute value
   * @returns the reversed number with leading zeros dropped, 0 for 0
   */
  public static digitReverse(n: number): number {
    if (!Number.isFinite(n)) {
      return 0;
    }
    let value: number = Math.abs(Math.trunc(n));
    let reversed: number = 0;
    // Shift the accumulated result left by one decimal digit per iteration.
    while (value > 0) {
      reversed = reversed * 10 + value % 10;
      value = Math.floor(value / 10);
    }
    return reversed;
  }
  /**
   * Check whether the decimal digits of a number form a palindrome.
   * @param n the operand, negative values are converted to their absolute value
   * @returns true for single digit numbers and digit palindromes, false otherwise
   */
  public static isPalindromeNumber(n: number): boolean {
    if (!Number.isFinite(n)) {
      return false;
    }
    const digits: string = Math.abs(Math.trunc(n)).toString();
    // Compare characters from both ends towards the centre.
    for (let left: number = 0; left < Math.floor(digits.length / 2); left++) {
      const right: number = digits.length - 1 - left;
      if (digits.charAt(left) !== digits.charAt(right)) {
        return false;
      }
    }
    return true;
  }
  /**
   * Check whether a number is an Armstrong (narcissistic) number for its own digit count.
   * @param n the operand, negative values are converted to their absolute value
   * @returns true when the sum of the powered digits equals the value itself
   */
  public static isArmstrongNumber(n: number): boolean {
    if (!Number.isFinite(n)) {
      return false;
    }
    const value: number = Math.abs(Math.trunc(n));
    const digits: string = value.toString();
    const power: number = digits.length;
    let sum: number = 0;
    for (let index: number = 0; index < digits.length; index++) {
      const digit: number = Number(digits.charAt(index));
      sum = sum + Math.pow(digit, power);
    }
    return sum === value;
  }
  /**
   * Compute the sum of the proper divisors of a number.
   * @param n the operand, must be greater than one to have proper divisors
   * @returns the divisor sum, 0 for values below two or non finite values
   */
  public static properDivisorSum(n: number): number {
    if (!Number.isFinite(n) || n < MIN_BASE) {
      return 0;
    }
    const value: number = Math.trunc(n);
    let sum: number = 0;
    // Pair up divisors so the loop only runs to the square root.
    for (let divisor: number = 1; divisor * divisor <= value; divisor++) {
      if (value % divisor !== 0) {
        continue;
      }
      if (divisor !== value) {
        sum = sum + divisor;
      }
      const partner: number = value / divisor;
      if (partner !== divisor && partner !== value) {
        sum = sum + partner;
      }
    }
    return sum;
  }
  /**
   * Check whether a number equals the sum of its proper divisors.
   * @param n the operand, values below six are rejected directly
   * @returns true for perfect numbers such as 6, 28 and 496
   */
  public static isPerfectNumber(n: number): boolean {
    if (!Number.isFinite(n) || n < 6 || n !== Math.floor(n)) {
      return false;
    }
    return NumberSequenceUtil.properDivisorSum(n) === n;
  }
  /**
   * Check whether a base is usable by the base conversion helpers.
   * @param base the base to test
   * @returns true only for integers inside [2, 36]
   */
  public static isValidBase(base: number): boolean {
    return Number.isFinite(base) && base === Math.floor(base) && base >= MIN_BASE && base <= MAX_BASE;
  }
  /**
   * Convert an integer into a lowercase text representation of the requested base.
   * Negative numbers keep a leading minus sign, illegal bases return an empty string.
   * @param n the integer to convert, fractions are truncated towards zero
   * @param base the target base inside [2, 36]
   * @returns the converted text, or an empty string when the base or the value is unusable
   */
  public static toBaseString(n: number, base: number): string {
    if (!NumberSequenceUtil.isValidBase(base) || !Number.isFinite(n)) {
      return INVALID_BASE_RESULT;
    }
    const value: number = Math.trunc(n);
    if (value === 0) {
      return '0';
    }
    let remaining: number = Math.abs(value);
    let text: string = EMPTY_TEXT;
    // Peel off the lowest digit and prepend its character until nothing is left.
    while (remaining > 0) {
      const digit: number = remaining % base;
      text = DIGIT_CHARS.charAt(digit) + text;
      remaining = Math.floor(remaining / base);
    }
    return value < 0 ? '-' + text : text;
  }
  /**
   * Parse a base encoded text back into a number.
   * Upper case letters are accepted, illegal characters or bases return NaN so callers can detect the failure.
   * @param text the encoded text, optionally starting with a minus sign
   * @param base the source base inside [2, 36]
   * @returns the parsed number, or NaN when the text or the base is invalid
   */
  public static parseBaseString(text: string, base: number): number {
    if (!NumberSequenceUtil.isValidBase(base) || text.length === 0) {
      return NaN;
    }
    let cursor: number = 0;
    let sign: number = 1;
    // A leading minus sign flips the sign of the parsed value.
    if (text.charAt(0) === '-') {
      sign = -1;
      cursor = 1;
    }
    if (cursor >= text.length) {
      return NaN;
    }
    let value: number = 0;
    for (let index: number = cursor; index < text.length; index++) {
      const digit: number = DIGIT_CHARS.indexOf(text.charAt(index).toLowerCase());
      // Reject digits that do not exist in the requested base.
      if (digit < 0 || digit >= base) {
        return NaN;
      }
      value = value * base + digit;
    }
    return sign * value;
  }
  /**
   * Bound an integer into an inclusive range and drop the fraction part.
   * @param value the value to clamp
   * @param min the lower bound
   * @param max the upper bound
   * @returns the clamped integer, min when the range is inverted
   */
  public static clampInt(value: number, min: number, max: number): number {
    let lower: number = Math.trunc(min);
    let upper: number = Math.trunc(max);
    if (lower > upper) {
      const swapped: number = lower;
      lower = upper;
      upper = swapped;
    }
    const truncated: number = Number.isFinite(value) ? Math.trunc(value) : lower;
    return Math.min(Math.max(truncated, lower), upper);
  }
  /**
   * Interpolate linearly between two values.
   * @param start the value at ratio 0
   * @param end the value at ratio 1
   * @param ratio the interpolation factor, values outside [0, 1] extrapolate
   * @returns start + (end - start) * ratio, or start when the ratio is not finite
   */
  public static lerp(start: number, end: number, ratio: number): number {
    if (!Number.isFinite(start) || !Number.isFinite(end) || !Number.isFinite(ratio)) {
      return start;
    }
    return start + (end - start) * ratio;
  }
  /**
   * Compute which percent of a total a part represents.
   * @param part the measured part
   * @param total the reference total, zero or non finite totals produce 0
   * @returns the percentage value, for example 25 for part 1 of total 4
   */
  public static percentOf(part: number, total: number): number {
    if (!Number.isFinite(part) || !Number.isFinite(total) || total === 0) {
      return 0;
    }
    return part / total * 100;
  }
  /**
   * Round a number onto a fixed number of fraction digits using Math.round after decimal scaling.
   * @param value the number to round
   * @param digits the fraction digits to keep, negative values round to tens, hundreds and so on
   * @returns the rounded number, or the original value when it is not finite or the digits are not finite
   */
  public static roundTo(value: number, digits: number): number {
    if (!Number.isFinite(value) || !Number.isFinite(digits)) {
      return value;
    }
    const factor: number = Math.pow(10, Math.trunc(digits));
    return Math.round(value * factor) / factor;
  }
  /**
   * Sum every value of an array with a plain loop, skipping non finite entries.
   * @param values the values to sum
   * @returns the total sum, 0 for an empty array
   */
  public static sum(values: number[]): number {
    let total: number = 0;
    for (let index: number = 0; index < values.length; index++) {
      const item: number = values[index];
      if (Number.isFinite(item)) {
        total = total + item;
      }
    }
    return total;
  }
  /**
   * Find the largest value of an array.
   * @param values the values to scan
   * @returns the maximum value, NaN for an empty array so callers see the failure
   */
  public static maxOf(values: number[]): number {
    if (values.length === 0) {
      return NaN;
    }
    let maximum: number = values[0];
    for (let index: number = 1; index < values.length; index++) {
      if (values[index] > maximum) {
        maximum = values[index];
      }
    }
    return maximum;
  }
  /**
   * Find the smallest value of an array.
   * @param values the values to scan
   * @returns the minimum value, NaN for an empty array so callers see the failure
   */
  public static minOf(values: number[]): number {
    if (values.length === 0) {
      return NaN;
    }
    let minimum: number = values[0];
    for (let index: number = 1; index < values.length; index++) {
      if (values[index] < minimum) {
        minimum = values[index];
      }
    }
    return minimum;
  }
  /**
   * Compute the arithmetic mean of an array.
   * @param values the values to average
   * @returns the mean value, 0 for an empty array
   */
  public static meanOf(values: number[]): number {
    if (values.length === 0) {
      return 0;
    }
    return NumberSequenceUtil.sum(values) / values.length;
  }
  /**
   * Count how many values of an array are strictly greater than a threshold.
   * @param values the values to scan
   * @param threshold the exclusive lower bound
   * @returns the number of matching values, 0 for an empty array
   */
  public static countAbove(values: number[], threshold: number): number {
    let count: number = 0;
    for (let index: number = 0; index < values.length; index++) {
      if (values[index] > threshold) {
        count = count + 1;
      }
    }
    return count;
  }
  /**
   * Count how many values of an array fall inside an inclusive range.
   * @param values the values to scan
   * @param min the inclusive lower bound
   * @param max the inclusive upper bound
   * @returns the number of values inside the range
   */
  public static countInRange(values: number[], min: number, max: number): number {
    // Swap the bounds when the caller passes them inverted so the count stays meaningful.
    const lower: number = Math.min(min, max);
    const upper: number = Math.max(min, max);
    let count: number = 0;
    for (let index: number = 0; index < values.length; index++) {
      const item: number = values[index];
      if (item >= lower && item <= upper) {
        count = count + 1;
      }
    }
    return count;
  }
  /**
   * Remove duplicated numbers and keep the first appearance order.
   * @param values the values to deduplicate
   * @returns a new array that contains only distinct values
   */
  public static distinct(values: number[]): number[] {
    const result: number[] = [];
    for (let index: number = 0; index < values.length; index++) {
      if (result.indexOf(values[index]) < 0) {
        result.push(values[index]);
      }
    }
    return result;
  }
  /**
   * Build a frequency table for the values of an array and keep the first appearance order.
   * @param values the values to count
   * @returns a new array whose entry i holds the value and its occurrence count
   */
  public static frequency(values: number[]): NumberFrequency[] {
    const result: NumberFrequency[] = [];
    for (let index: number = 0; index < values.length; index++) {
      const item: number = values[index];
      let found: boolean = false;
      // Look for an existing bucket that already tracks this value.
      for (let bucket: number = 0; bucket < result.length; bucket++) {
        if (result[bucket].value === item) {
          result[bucket].count = result[bucket].count + 1;
          found = true;
          break;
        }
      }
      if (!found) {
        const entry: NumberFrequency = { value: item, count: 1 };
        result.push(entry);
      }
    }
    return result;
  }
  /**
   * Sum the values of an array while keeping only the running total of each prefix.
   * @param values the values to accumulate
   * @returns a prefix sum array with the same length as the input
   */
  public static prefixSums(values: number[]): number[] {
    const result: number[] = [];
    let running: number = 0;
    for (let index: number = 0; index < values.length; index++) {
      running = running + values[index];
      result.push(running);
    }
    return result;
  }
  /**
   * Compute the difference between two neighbouring values of an array.
   * @param values the values to diff
   * @returns an array that is one entry shorter than the input
   */
  public static differences(values: number[]): number[] {
    const result: number[] = [];
    for (let index: number = 1; index < values.length; index++) {
      result.push(values[index] - values[index - 1]);
    }
    return result;
  }
  /**
   * Check whether an array is strictly ascending.
   * @param values the values to scan
   * @returns true when every value is greater than its predecessor, also true for length 0 and 1
   */
  public static isAscending(values: number[]): boolean {
    for (let index: number = 1; index < values.length; index++) {
      if (values[index] <= values[index - 1]) {
        return false;
      }
    }
    return true;
  }
  /**
   * Check whether an array is strictly descending.
   * @param values the values to scan
   * @returns true when every value is smaller than its predecessor, also true for length 0 and 1
   */
  public static isDescending(values: number[]): boolean {
    for (let index: number = 1; index < values.length; index++) {
      if (values[index] >= values[index - 1]) {
        return false;
      }
    }
    return true;
  }
  /**
   * Check whether two arrays carry the same values in the same order.
   * @param left the first array
   * @param right the second array
   * @returns true when both lengths and every position match
   */
  public static isSameSeries(left: number[], right: number[]): boolean {
    if (left.length !== right.length) {
      return false;
    }
    for (let index: number = 0; index < left.length; index++) {
      if (left[index] !== right[index]) {
        return false;
      }
    }
    return true;
  }
  /**
   * Sum every multiple of a divisor inside [1, limit].
   * @param limit the inclusive upper bound of the scan
   * @param divisor the divisor to look for, zero and negatives produce 0
   * @returns the sum of the matching multiples
   */
  public static sumMultiplesBelow(limit: number, divisor: number): number {
    if (!Number.isFinite(limit) || !Number.isFinite(divisor) || divisor <= 0 || limit <= 0) {
      return 0;
    }
    const step: number = Math.trunc(divisor);
    if (step <= 0) {
      return 0;
    }
    const bound: number = Math.trunc(limit);
    let total: number = 0;
    for (let value: number = step; value <= bound; value = value + step) {
      total = total + value;
    }
    return total;
  }
  /**
   * Compute the Collatz step count needed to reach 1.
   * @param start the starting value, must be a positive integer
   * @returns the number of steps, 0 for illegal starting values or for 1 itself
   */
  public static collatzSteps(start: number): number {
    if (!Number.isFinite(start) || start < 1 || start !== Math.floor(start)) {
      return 0;
    }
    let value: number = start;
    let steps: number = 0;
    // Even values halve, odd values follow 3n + 1 until the value reaches one.
    while (value !== 1 && steps < 1000) {
      if (value % 2 === 0) {
        value = value / 2;
      } else {
        value = value * 3 + 1;
      }
      steps = steps + 1;
    }
    return steps;
  }
  /**
   * Convert a plain number into a rounded integer text with a fixed length.
   * The text is left padded with zeros and cut from the left when it is too long.
   * @param value the number to render
   * @param length the requested text length
   * @returns a text of exactly length characters, or an empty string for illegal lengths
   */
  public static toFixedWidth(value: number, length: number): string {
    if (!Number.isFinite(value) || !Number.isFinite(length) || length <= 0) {
      return EMPTY_TEXT;
    }
    const width: number = Math.trunc(length);
    let text: string = Math.round(value).toString();
    // Negative values keep their sign and only pad the digits behind it.
    const negative: boolean = text.charAt(0) === '-';
    if (negative) {
      text = text.substring(1);
    }
    while (text.length < width) {
      text = '0' + text;
    }
    if (text.length > width) {
      text = text.substring(text.length - width);
    }
    return negative ? '-' + text : text;
  }
}
/**
 * One bucket of the frequency table built by NumberSequenceUtil.frequency.
 */
export interface NumberFrequency {
  /** The counted value. */
  value: number;
  /** How many times the value appears in the source array. */
  count: number;
}
