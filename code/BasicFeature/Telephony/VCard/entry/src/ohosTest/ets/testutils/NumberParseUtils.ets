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
 * Pure number parsing and formatting helpers shared by the VCard hypium
 * test suites. Every method is static and side-effect free so the unit
 * tests can call them directly without any device, permission or UI
 * dependency. The class avoids regular expressions and dynamic property
 * access on purpose so it stays inside the strict ArkTS subset.
 */
export class NumberParseUtils {
  /** Largest exact integer value (2^53 - 1) used by every overflow check. */
  private static readonly MAX_SAFE: number = 9007199254740991;
  /** Uppercase hexadecimal alphabet used by toHex(). */
  private static readonly HEX_CHARS: string = '0123456789ABCDEF';

  /**
   * Parse a decimal integer string. An optional leading '+' or '-' sign and
   * surrounding whitespace are accepted. Invalid input and values outside
   * the safe integer range return 0.
   */
  static parseIntSafe(text: string): number {
    const trimmed: string = text.trim();
    if (trimmed.length === 0) {
      return 0;
    }
    let index: number = 0;
    let sign: number = 1;
    const head: string = trimmed.charAt(0);
    if (head === '+') {
      index = 1;
    } else if (head === '-') {
      index = 1;
      sign = -1;
    }
    if (index >= trimmed.length) {
      return 0;
    }
    let value: number = 0;
    for (let i = index; i < trimmed.length; i++) {
      const code: number = trimmed.charCodeAt(i);
      if (code < 48 || code > 57) {
        return 0;
      }
      const digit: number = code - 48;
      if (value > (NumberParseUtils.MAX_SAFE - digit) / 10) {
        return 0;
      }
      value = value * 10 + digit;
    }
    return sign * value;
  }

  /**
   * Return true only when text is non-empty and every character is a
   * decimal digit 0-9.
   */
  static isDigits(text: string): boolean {
    if (text.length === 0) {
      return false;
    }
    for (let i = 0; i < text.length; i++) {
      const code: number = text.charCodeAt(i);
      if (code < 48 || code > 57) {
        return false;
      }
    }
    return true;
  }

  /**
   * Clamp value into the closed interval [min, max].
   */
  static clampInt(value: number, min: number, max: number): number {
    if (value < min) {
      return min;
    }
    if (value > max) {
      return max;
    }
    return value;
  }

  /**
   * Render value with exactly digits fraction digits. digits must be an
   * integer between 0 and 8; otherwise the plain toString() of value is
   * returned. Negative values keep their sign.
   */
  static toFixedText(value: number, digits: number): string {
    if (digits !== Math.floor(digits) || digits < 0 || digits > 8) {
      return value.toString();
    }
    return value.toFixed(digits);
  }

  /**
   * Insert separator every three digits of an integer string. A single
   * leading '+' or '-' sign is preserved. Any input that is not a valid
   * integer string is returned unchanged.
   */
  static groupThousands(text: string, separator: string): string {
    if (text.length === 0) {
      return text;
    }
    let sign: string = '';
    let start: number = 0;
    const head: string = text.charAt(0);
    if (head === '+' || head === '-') {
      sign = head;
      start = 1;
    }
    const digits: string = text.substring(start);
    if (!NumberParseUtils.isDigits(digits)) {
      return text;
    }
    let pos: number = digits.length % 3;
    if (pos === 0) {
      pos = 3;
    }
    let out: string = digits.substring(0, pos);
    while (pos < digits.length) {
      out = out + separator + digits.substring(pos, pos + 3);
      pos = pos + 3;
    }
    return sign + out;
  }

  /**
   * Convert a non-negative decimal string to uppercase hexadecimal without
   * any prefix. Invalid input returns an empty string. The conversion uses
   * repeated string division so arbitrarily long inputs stay exact.
   */
  static toHex(text: string): string {
    if (!NumberParseUtils.isDigits(text)) {
      return '';
    }
    let work: string = text;
    let result: string = '';
    while (true) {
      let quotient: string = '';
      let rem: number = 0;
      for (let i = 0; i < work.length; i++) {
        const cur: number = rem * 10 + (work.charCodeAt(i) - 48);
        rem = cur % 16;
        const q: number = (cur - rem) / 16;
        if (quotient.length > 0 || q > 0) {
          quotient = quotient + q.toString();
        }
      }
      result = NumberParseUtils.HEX_CHARS.charAt(rem) + result;
      if (quotient.length === 0) {
        break;
      }
      work = quotient;
    }
    return result;
  }

  /**
   * Convert a hexadecimal string (0-9, A-F, a-f) to a decimal number.
   * Empty strings, invalid characters and values beyond the safe integer
   * range return -1.
   */
  static fromHex(text: string): number {
    if (text.length === 0) {
      return -1;
    }
    let value: number = 0;
    for (let i = 0; i < text.length; i++) {
      const code: number = text.charCodeAt(i);
      let digit: number = -1;
      if (code >= 48 && code <= 57) {
        digit = code - 48;
      } else if (code >= 65 && code <= 70) {
        digit = code - 55;
      } else if (code >= 97 && code <= 102) {
        digit = code - 87;
      }
      if (digit < 0) {
        return -1;
      }
      if (value > (NumberParseUtils.MAX_SAFE - digit) / 16) {
        return -1;
      }
      value = value * 16 + digit;
    }
    return value;
  }

  /**
   * Convert a non-negative decimal string to binary without any prefix.
   * Invalid input returns an empty string. Repeated string division keeps
   * long inputs exact.
   */
  static toBinary(text: string): string {
    if (!NumberParseUtils.isDigits(text)) {
      return '';
    }
    let work: string = text;
    let result: string = '';
    while (true) {
      let quotient: string = '';
      let rem: number = 0;
      for (let i = 0; i < work.length; i++) {
        const cur: number = rem * 10 + (work.charCodeAt(i) - 48);
        rem = cur % 2;
        const q: number = (cur - rem) / 2;
        if (quotient.length > 0 || q > 0) {
          quotient = quotient + q.toString();
        }
      }
      result = rem.toString() + result;
      if (quotient.length === 0) {
        break;
      }
      work = quotient;
    }
    return result;
  }

  /**
   * Convert a binary string of 0/1 characters to a decimal number. Empty
   * strings, invalid characters and values beyond the safe integer range
   * return -1.
   */
  static fromBinary(text: string): number {
    if (text.length === 0) {
      return -1;
    }
    let value: number = 0;
    for (let i = 0; i < text.length; i++) {
      const code: number = text.charCodeAt(i);
      if (code !== 48 && code !== 49) {
        return -1;
      }
      const bit: number = code - 48;
      if (value > (NumberParseUtils.MAX_SAFE - bit) / 2) {
        return -1;
      }
      value = value * 2 + bit;
    }
    return value;
  }

  /**
   * Sum every decimal digit character of text. Characters other than 0-9
   * are ignored; an empty or digit-free string yields 0.
   */
  static digitSum(text: string): number {
    let total: number = 0;
    for (let i = 0; i < text.length; i++) {
      const code: number = text.charCodeAt(i);
      if (code >= 48 && code <= 57) {
        total = total + (code - 48);
      }
    }
    return total;
  }

  /**
   * Remove leading zeros from a decimal integer string. A leading '-' sign
   * is preserved. Inputs that are not valid integer strings (after an
   * optional '-') are returned unchanged; all-zero strings collapse to '0'
   * (the sign is kept for negative input, e.g. '-000' -> '-0').
   */
  static leadingZeroTrim(text: string): string {
    if (text.length === 0) {
      return '';
    }
    if (text.charAt(0) === '-') {
      const rest: string = text.substring(1);
      if (!NumberParseUtils.isDigits(rest)) {
        return text;
      }
      return '-' + NumberParseUtils.trimLeadingZeros(rest);
    }
    if (!NumberParseUtils.isDigits(text)) {
      return text;
    }
    return NumberParseUtils.trimLeadingZeros(text);
  }

  /**
   * Internal helper that strips leading zeros but always keeps at least one
   * digit so all-zero input collapses to '0'.
   */
  private static trimLeadingZeros(digits: string): string {
    let index: number = 0;
    while (index < digits.length - 1 && digits.charAt(index) === '0') {
      index = index + 1;
    }
    return digits.substring(index);
  }
}
