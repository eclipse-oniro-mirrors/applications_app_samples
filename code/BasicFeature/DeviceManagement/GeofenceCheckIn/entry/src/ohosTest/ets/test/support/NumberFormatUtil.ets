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
 * Pure numeric formatting helpers used by the numeric string suites.
 */
export class NumberFormatUtil {
  /**
   * Insert a comma every three digits of the integer part.
   * Non finite values map to the text NaN.
   * @param value the integer value to group
   * @returns the grouped integer text
   */
  public static groupThousands(value: number): string {
    if (!Number.isFinite(value)) {
      return 'NaN';
    }
    const truncated: number = Math.trunc(value);
    const negative: boolean = truncated < 0;
    const digits: string = Math.abs(truncated).toString();
    let grouped: string = '';
    let count: number = 0;
    for (let i = digits.length - 1; i >= 0; i--) {
      grouped = digits.charAt(i) + grouped;
      count = count + 1;
      if (count % 3 === 0 && i > 0) {
        grouped = ',' + grouped;
      }
    }
    if (negative) {
      return '-' + grouped;
    }
    return grouped;
  }

  /**
   * Pad the decimal text of a number on the left up to a fixed width.
   * Only the first character of the pad text is used.
   * @param value the numeric value to pad
   * @param width the requested minimum width
   * @param padChar the character used for padding
   * @returns the padded text
   */
  public static padLeft(value: number, width: number, padChar: string): string {
    const text: string = value.toString();
    if (width <= text.length || padChar.length === 0) {
      return text;
    }
    const pad: string = padChar.charAt(0);
    let result: string = text;
    while (result.length < width) {
      result = pad + result;
    }
    return result;
  }

  /**
   * Convert an integer in the closed range from 1 to 3999 into Roman numerals.
   * Out of range or fractional values map to an empty string.
   * @param value the integer value to convert
   * @returns the Roman numeral text, or an empty string for invalid input
   */
  public static toRoman(value: number): string {
    if (value < 1 || value > 3999 || !Number.isInteger(value)) {
      return '';
    }
    const values: number[] = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
    const symbols: string[] = ['M', 'CM', 'D', 'CD', 'C', 'XC', 'L', 'XL', 'X', 'IX', 'V', 'IV', 'I'];
    let remaining: number = value;
    let result: string = '';
    for (let i = 0; i < values.length; i++) {
      while (remaining >= values[i]) {
        result = result + symbols[i];
        remaining = remaining - values[i];
      }
    }
    return result;
  }

  /**
   * Convert a non negative integer into an upper case positional representation.
   * Invalid bases and negative values map to an empty string.
   * @param value the non negative integer to convert
   * @param base the target base in the range from 2 to 36
   * @returns the converted text, or an empty string for invalid input
   */
  public static toBaseString(value: number, base: number): string {
    if (base < 2 || base > 36 || value < 0 || !Number.isInteger(value)) {
      return '';
    }
    if (value === 0) {
      return '0';
    }
    const alphabet: string = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    let remaining: number = value;
    let result: string = '';
    while (remaining > 0) {
      const digit: number = remaining % base;
      result = alphabet.charAt(digit) + result;
      remaining = Math.floor(remaining / base);
    }
    return result;
  }

  /**
   * Convert a non negative integer into its binary text.
   * @param value the non negative integer to convert
   * @returns the binary text, or an empty string for invalid input
   */
  public static toBinaryString(value: number): string {
    return NumberFormatUtil.toBaseString(value, 2);
  }

  /**
   * Convert a non negative integer into its octal text.
   * @param value the non negative integer to convert
   * @returns the octal text, or an empty string for invalid input
   */
  public static toOctalString(value: number): string {
    return NumberFormatUtil.toBaseString(value, 8);
  }

  /**
   * Convert a non negative integer into its upper case hexadecimal text.
   * @param value the non negative integer to convert
   * @returns the hexadecimal text, or an empty string for invalid input
   */
  public static toHexString(value: number): string {
    return NumberFormatUtil.toBaseString(value, 16);
  }

  /**
   * Format a number with a bounded number of fraction digits.
   * The digit count is limited to the range from 0 to 10.
   * @param value the value to format
   * @param digits the requested fraction digits
   * @returns the fixed point text
   */
  public static formatFixed(value: number, digits: number): string {
    let safeDigits: number = Math.trunc(digits);
    if (safeDigits < 0) {
      safeDigits = 0;
    }
    if (safeDigits > 10) {
      safeDigits = 10;
    }
    return value.toFixed(safeDigits);
  }

  /**
   * Abbreviate a number with the K, M and B suffixes.
   * Values below one thousand keep their plain decimal text.
   * @param value the value to abbreviate
   * @returns the abbreviated text
   */
  public static abbreviate(value: number): string {
    const magnitude: number = Math.abs(value);
    if (!Number.isFinite(value)) {
      return 'NaN';
    }
    if (magnitude < 1000) {
      return value.toString();
    }
    if (magnitude < 1000000) {
      return (value / 1000).toFixed(1) + 'K';
    }
    if (magnitude < 1000000000) {
      return (value / 1000000).toFixed(1) + 'M';
    }
    return (value / 1000000000).toFixed(1) + 'B';
  }
}
