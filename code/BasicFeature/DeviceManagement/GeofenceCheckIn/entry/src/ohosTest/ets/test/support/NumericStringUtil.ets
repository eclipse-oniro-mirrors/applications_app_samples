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
 * Pure numeric string parsing helpers used by the numeric text suites.
 */
export class NumericStringUtil {
  /**
   * Check whether a text is a plain integer or decimal number.
   * Surrounding whitespace is ignored.
   * @param text the text to test
   * @returns true when the trimmed text matches a numeric pattern
   */
  public static isNumeric(text: string): boolean {
    const trimmed: string = text.trim();
    const pattern: RegExp = /^[+-]?(\d+(\.\d*)?|\.\d+)$/;
    return pattern.test(trimmed);
  }

  /**
   * Parse a signed integer text and fall back for invalid input.
   * @param text the text to parse
   * @param fallback the value returned for invalid text
   * @returns the parsed integer or the fallback value
   */
  public static parseInteger(text: string, fallback: number): number {
    const trimmed: string = text.trim();
    const pattern: RegExp = /^[+-]?\d+$/;
    if (!pattern.test(trimmed)) {
      return fallback;
    }
    const parsed: number = Number.parseInt(trimmed, 10);
    if (Number.isNaN(parsed)) {
      return fallback;
    }
    return parsed;
  }

  /**
   * Parse a signed decimal text and fall back for invalid input.
   * @param text the text to parse
   * @param fallback the value returned for invalid text
   * @returns the parsed decimal or the fallback value
   */
  public static parseDecimal(text: string, fallback: number): number {
    const trimmed: string = text.trim();
    if (!NumericStringUtil.isNumeric(trimmed)) {
      return fallback;
    }
    const parsed: number = Number(trimmed);
    if (!Number.isFinite(parsed)) {
      return fallback;
    }
    return parsed;
  }

  /**
   * Keep only the decimal digit characters of a text.
   * @param text the text to scan
   * @returns the digit characters in their original order
   */
  public static extractDigits(text: string): string {
    let result: string = '';
    for (let i = 0; i < text.length; i++) {
      const character: string = text.charAt(i);
      if (character >= '0' && character <= '9') {
        result = result + character;
      }
    }
    return result;
  }

  /**
   * Count the decimal digit characters of a text.
   * @param text the text to scan
   * @returns the digit count
   */
  public static countDigits(text: string): number {
    return NumericStringUtil.extractDigits(text).length;
  }

  /**
   * Remove redundant leading zeros and keep the sign of an integer text.
   * @param text the integer text to normalize
   * @returns the normalized text, or an empty string for invalid input
   */
  public static normalizeIntegerText(text: string): string {
    const trimmed: string = text.trim();
    const pattern: RegExp = /^[+-]?\d+$/;
    if (!pattern.test(trimmed)) {
      return '';
    }
    const negative: boolean = trimmed.charAt(0) === '-';
    let digits: string = trimmed;
    if (trimmed.charAt(0) === '-' || trimmed.charAt(0) === '+') {
      digits = trimmed.substring(1);
    }
    while (digits.length > 1 && digits.charAt(0) === '0') {
      digits = digits.substring(1);
    }
    if (digits === '0') {
      return '0';
    }
    if (negative) {
      return '-' + digits;
    }
    return digits;
  }

  /**
   * Compare two integer texts numerically.
   * @param left the left integer text
   * @param right the right integer text
   * @returns minus one, zero or one, and zero when either text is invalid
   */
  public static compareNumericText(left: string, right: string): number {
    const leftValue: number = NumericStringUtil.parseInteger(left, Number.NaN);
    const rightValue: number = NumericStringUtil.parseInteger(right, Number.NaN);
    if (Number.isNaN(leftValue) || Number.isNaN(rightValue)) {
      return 0;
    }
    if (leftValue < rightValue) {
      return -1;
    }
    if (leftValue > rightValue) {
      return 1;
    }
    return 0;
  }

  /**
   * Render a number with an explicit plus sign for positive values.
   * @param value the value to format
   * @returns the signed text
   */
  public static formatWithSign(value: number): string {
    if (value > 0) {
      return '+' + value.toString();
    }
    return value.toString();
  }

  /**
   * Return the part before the decimal point of a numeric text.
   * @param text the numeric text to split
   * @returns the integer part, or an empty string for invalid input
   */
  public static integerPart(text: string): string {
    const trimmed: string = text.trim();
    if (!NumericStringUtil.isNumeric(trimmed)) {
      return '';
    }
    const point: number = trimmed.indexOf('.');
    if (point < 0) {
      return trimmed;
    }
    return trimmed.substring(0, point);
  }

  /**
   * Return the part after the decimal point of a numeric text.
   * @param text the numeric text to split
   * @returns the fraction digits, or an empty string when there is no fraction
   */
  public static fractionPart(text: string): string {
    const trimmed: string = text.trim();
    if (!NumericStringUtil.isNumeric(trimmed)) {
      return '';
    }
    const point: number = trimmed.indexOf('.');
    if (point < 0) {
      return '';
    }
    return trimmed.substring(point + 1);
  }
}
