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

// The final lookahead enforces the absolute end; $ also matches before a trailing newline.
const EMAIL_PATTERN: RegExp = /^[A-Za-z0-9._%+-]+@(?:[A-Za-z0-9-]+\.)+[A-Za-z]{2,}(?![\s\S])/;
// Chinese mainland mobile number pattern used by the phone validation helper.
const PHONE_CN_PATTERN: RegExp = /^1[3-9]\d{9}$/;
// Basic shape of an 18 digit Chinese mainland ID card used by the ID validation helper.
const ID_CARD_CN_PATTERN: RegExp = /^\d{17}[\dXx]$/;
// Weight factors used to verify the check digit of a Chinese mainland ID card.
const ID_CARD_WEIGHTS: number[] = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
// Valid check digit lookup string indexed by the weighted sum modulo 11.
const ID_CARD_CHECK_CODES: string = '10X98765432';
// Last digit index of an 18 digit Chinese mainland ID card.
const ID_CARD_CHECK_INDEX: number = 17;
// Percent symbol appended by the percent formatting helper.
const PERCENT_SUFFIX: string = '%';
// Default fraction digits kept by the percent formatting helper.
const DEFAULT_FRACTION_DIGITS: number = 1;

/**
 * Basic utility class for the GeofenceCheckIn sample.
 * Collects pure static helpers for strings, numbers, validation and arrays, it never touches system resources.
 */
export class BasicUtil {
  /**
   * Check whether a string is missing or has zero length.
   * @param value the string to check, may be undefined
   * @returns true when the value is undefined or empty
   */
  public static isEmptyString(value?: string): boolean {
    // Treat undefined as missing data and reject strings without any character.
    return value === undefined || value.length === 0;
  }

  /**
   * Check whether a string is empty or contains only whitespace characters.
   * @param value the string to check, may be undefined
   * @returns true when the value is missing, empty or whitespace only
   */
  public static isBlank(value?: string): boolean {
    // Reuse the empty check first, then trim to detect whitespace-only content.
    return BasicUtil.isEmptyString(value) || BasicUtil.trimSafe(value).length === 0;
  }

  /**
   * Trim a string safely and map missing input to an empty string.
   * @param value the string to trim, may be undefined
   * @returns the trimmed text, or an empty string when the input is missing
   */
  public static trimSafe(value?: string): string {
    // Missing input maps to an empty trimmed result so callers avoid null branches.
    if (value === undefined) {
      return '';
    }
    return value.trim();
  }

  /**
   * Uppercase the first character of a string and keep the rest unchanged.
   * @param value the string to capitalize
   * @returns the capitalized string, or the original value when it is empty
   */
  public static capitalize(value: string): string {
    // An empty string has no first character to capitalize.
    if (value.length === 0) {
      return value;
    }
    // Uppercase the first code unit and append the remaining characters.
    return value.charAt(0).toUpperCase() + value.substring(1);
  }

  /**
   * Reverse a string by Unicode code point.
   * @param value the string to reverse
   * @returns the reversed string, or an empty string when the input is empty
   */
  public static reverseString(value: string): string {
    // Match surrogate pairs explicitly instead of relying on string iterator behavior.
    const characters: string[] = value.match(/[\uD800-\uDBFF][\uDC00-\uDFFF]|[\s\S]/g) ?? [];
    return characters.reverse().join('');
  }

  /**
   * Count how many times a substring appears in a source string.
   * @param source the string to scan
   * @param target the substring to count
   * @returns the number of non-overlapping occurrences of the target
   */
  public static countOccurrences(source: string, target: string): number {
    // An empty target would make indexOf loop forever, so report zero directly.
    if (target === '') {
      return 0;
    }
    // Advance the cursor past every match until no match is left.
    let count: number = 0;
    let cursor: number = source.indexOf(target);
    while (cursor >= 0) {
      count = count + 1;
      cursor = source.indexOf(target, cursor + target.length);
    }
    return count;
  }

  /**
   * Bound a number into an inclusive range.
   * @param value the number to clamp
   * @param min the lower bound of the range
   * @param max the upper bound of the range
   * @returns the value limited between min and max
   */
  public static clamp(value: number, min: number, max: number): number {
    // Compose max with min so the value can never fall outside the range.
    return Math.min(Math.max(value, min), max);
  }

  /**
   * Generate a random integer inside the inclusive range [min, max].
   * @param min the lower bound of the range
   * @param max the upper bound of the range
   * @returns a random integer between min and max, or the lower bound when the range is invalid
   */
  public static randomInt(min: number, max: number): number {
    // Guard against inverted or single value ranges by returning the lower bound.
    if (max <= min) {
      return Math.min(min, max);
    }
    // Scale a uniform random value into the range and drop the fraction part.
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }

  /**
   * Check whether a number is finite and strictly greater than zero.
   * @param value the number to check
   * @returns true when the value is a finite positive number
   */
  public static isPositiveNumber(value: number): boolean {
    // Reject NaN and Infinity first, then require a strictly positive value.
    return Number.isFinite(value) && value > 0;
  }

  /**
   * Format a 0..1 ratio as a percent string with fixed fraction digits.
   * @param value the ratio to format, for example 0.256
   * @param fractionDigits optional digits kept after the decimal point, defaults to 1
   * @returns the formatted percent text such as '25.6%'
   */
  public static formatPercent(value: number, fractionDigits?: number): string {
    // Keep a fixed number of fraction digits so list text stays aligned.
    const digits: number = fractionDigits === undefined ? DEFAULT_FRACTION_DIGITS : fractionDigits;
    // Convert the ratio into a percent value and append the suffix.
    return (value * 100).toFixed(digits) + PERCENT_SUFFIX;
  }

  /**
   * Validate an email address with a simplified pattern.
   * @param email the email text to validate
   * @returns true when the text looks like a common email address
   */
  public static isValidEmail(email: string): boolean {
    // Test the whole text against the simplified email pattern.
    return EMAIL_PATTERN.test(email);
  }

  /**
   * Validate a Chinese mainland mobile phone number.
   * @param phone the phone text to validate
   * @returns true when the text matches the 1xx mobile number pattern
   */
  public static isValidPhoneCN(phone: string): boolean {
    // Test the whole text against the mobile number pattern.
    return phone.length === 11 && PHONE_CN_PATTERN.test(phone);
  }

  /**
   * Validate an 18 digit Chinese mainland ID card including its check digit.
   * @param idCard the ID card text to validate
   * @returns true when the shape is valid and the check digit matches
   */
  public static isValidIdCardCN(idCard: string): boolean {
    // Reject values that do not match the basic 18 digit shape.
    if (!ID_CARD_CN_PATTERN.test(idCard)) {
      return false;
    }
    // Accumulate the weighted sum of the first 17 digits.
    let sum: number = 0;
    for (let i = 0; i < ID_CARD_WEIGHTS.length; i++) {
      const digit: number = Number(idCard.charAt(i));
      sum = sum + digit * ID_CARD_WEIGHTS[i];
    }
    // Look up the expected check digit and compare it with the last character.
    const expected: string = ID_CARD_CHECK_CODES.charAt(sum % 11);
    return idCard.charAt(ID_CARD_CHECK_INDEX).toUpperCase() === expected;
  }

  /**
   * Remove duplicated string values and keep the first appearance order.
   * @param values the array to deduplicate
   * @returns a new array that contains only distinct values in their original order
   */
  public static removeDuplicates(values: string[]): string[] {
    // Collect only values that were not seen before.
    const result: string[] = [];
    for (let i = 0; i < values.length; i++) {
      const item: string = values[i];
      // Skip values that are already in the result array.
      if (result.indexOf(item) >= 0) {
        continue;
      }
      result.push(item);
    }
    return result;
  }

  /**
   * Join string entries with a separator after dropping blank entries.
   * @param values the entries to join
   * @param separator the text inserted between entries
   * @returns the joined text without empty or missing entries
   */
  public static safeJoin(values: string[], separator: string): string {
    // Drop blank entries so the joined text has no dangling separators.
    const usable: string[] = [];
    for (let i = 0; i < values.length; i++) {
      // Keep only entries that carry real content.
      if (values[i].length > 0) {
        usable.push(values[i]);
      }
    }
    // Join the remaining entries with the requested separator.
    return usable.join(separator);
  }

  /**
   * Convert a boolean into the common numeric flag convention.
   * @param value the boolean to convert
   * @returns 1 for true and 0 for false
   */
  public static booleanToFlag(value: boolean): number {
    // Map the boolean onto the 0/1 flag convention used by records.
    return value ? 1 : 0;
  }
}
