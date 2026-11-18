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
const DIGIT_ZERO: number = 48;
const DIGIT_NINE: number = 57;
const PERCENT_SIGN: string = '%';
const COMMA: string = ',';
const SPACE: string = ' ';
const HEX_BASE: number = 16;
const EMPTY_LENGTH: number = 0;
const INVALID_RESULT: number = 0;

/**
 * Text to value conversions backing the ohosTest utility suites.
 *
 * Every conversion documents its invalid input fallback instead of throwing, so
 * that a suite can assert on the fallback as a first class behaviour.
 */
export class ConvertUtils {
  /**
   * Maps the trimmed text true to a boolean, everything else is false.
   */
  static strToBool(input: string): boolean {
    hilog.info(DOMAIN, TAG, 'ConvertUtils.strToBool length=%{public}d', input.length);
    return input.trim().toLowerCase() === 'true';
  }

  /**
   * Parses the trimmed text, unparsable text collapses to zero.
   */
  static strToNumber(input: string): number {
    hilog.info(DOMAIN, TAG, 'ConvertUtils.strToNumber length=%{public}d', input.length);
    const trimmed: string = input.trim();
    const parsed: number = Number(trimmed);
    return Number.isNaN(parsed) ? INVALID_RESULT : parsed;
  }

  /**
   * Parses a trailing percent suffix, malformed text collapses to zero.
   */
  static percentStrToNumber(input: string): number {
    hilog.info(DOMAIN, TAG, 'ConvertUtils.percentStrToNumber length=%{public}d', input.length);
    let text: string = input.trim();
    if (text.length > EMPTY_LENGTH && text.charAt(text.length - 1) === PERCENT_SIGN) {
      text = text.substring(0, text.length - 1).trim();
    }
    if (text.length === EMPTY_LENGTH) {
      return INVALID_RESULT;
    }
    const parsed: number = Number(text);
    return Number.isNaN(parsed) ? INVALID_RESULT : parsed;
  }

  /**
   * Parses a hexadecimal literal, invalid text collapses to zero.
   */
  static hexToDec(input: string): number {
    hilog.info(DOMAIN, TAG, 'ConvertUtils.hexToDec length=%{public}d', input.length);
    const text: string = input.trim();
    if (text.length === EMPTY_LENGTH) {
      return INVALID_RESULT;
    }
    let total: number = 0;
    let index: number = 0;
    while (index < text.length) {
      const digit: number = ConvertUtils.hexDigit(text.charCodeAt(index));
      if (digit < 0) {
        return INVALID_RESULT;
      }
      total = total * HEX_BASE + digit;
      index = index + 1;
    }
    return total;
  }

  /**
   * Splits the text into single character entries.
   */
  static toCharArray(input: string): string[] {
    hilog.info(DOMAIN, TAG, 'ConvertUtils.toCharArray length=%{public}d', input.length);
    const out: string[] = [];
    let index: number = 0;
    while (index < input.length) {
      out.push(input.charAt(index));
      index = index + 1;
    }
    return out;
  }

  /**
   * Renders a number array as a comma separated list.
   */
  static numbersToCsv(values: number[]): string {
    hilog.info(DOMAIN, TAG, 'ConvertUtils.numbersToCsv size=%{public}d', values.length);
    let out: string = '';
    let index: number = 0;
    while (index < values.length) {
      if (index > 0) {
        out = out + COMMA;
      }
      out = out + values[index].toString();
      index = index + 1;
    }
    return out;
  }

  /**
   * Parses a comma separated list, unparsable entries collapse to zero.
   */
  static csvToNumbers(input: string): number[] {
    hilog.info(DOMAIN, TAG, 'ConvertUtils.csvToNumbers length=%{public}d', input.length);
    const parts: string[] = input.split(COMMA);
    const out: number[] = [];
    let index: number = 0;
    while (index < parts.length) {
      out.push(ConvertUtils.strToNumber(parts[index]));
      index = index + 1;
    }
    return out;
  }

  /**
   * Renders zero as false and every other value as true.
   */
  static numberToBoolStr(value: number): string {
    hilog.info(DOMAIN, TAG, 'ConvertUtils.numberToBoolStr value=%{public}d', value);
    return value === 0 ? 'false' : 'true';
  }

  /**
   * Renders the sign of the value as a plus or minus character.
   */
  static numberToSign(value: number): string {
    hilog.info(DOMAIN, TAG, 'ConvertUtils.numberToSign value=%{public}d', value);
    return value >= 0 ? '+' : '-';
  }

  /**
   * Returns the character code of the first character, zero when empty.
   */
  static charCodeOfFirstChar(input: string): number {
    hilog.info(DOMAIN, TAG, 'ConvertUtils.charCodeOfFirstChar length=%{public}d', input.length);
    if (input.length === EMPTY_LENGTH) {
      return INVALID_RESULT;
    }
    return input.charCodeAt(0);
  }

  /**
   * Returns the character code of every character.
   */
  static toAsciiCodes(input: string): number[] {
    hilog.info(DOMAIN, TAG, 'ConvertUtils.toAsciiCodes length=%{public}d', input.length);
    const out: number[] = [];
    let index: number = 0;
    while (index < input.length) {
      out.push(input.charCodeAt(index));
      index = index + 1;
    }
    return out;
  }

  /**
   * Drops every plain space character.
   */
  static stripSpaces(input: string): string {
    hilog.info(DOMAIN, TAG, 'ConvertUtils.stripSpaces length=%{public}d', input.length);
    const parts: string[] = input.split(SPACE);
    let out: string = '';
    let index: number = 0;
    while (index < parts.length) {
      out = out + parts[index];
      index = index + 1;
    }
    return out;
  }

  /**
   * Returns the leading run of decimal digits, empty when absent.
   */
  static numericPrefix(input: string): string {
    hilog.info(DOMAIN, TAG, 'ConvertUtils.numericPrefix length=%{public}d', input.length);
    let out: string = '';
    let index: number = 0;
    while (index < input.length) {
      const code: number = input.charCodeAt(index);
      if (code < DIGIT_ZERO || code > DIGIT_NINE) {
        break;
      }
      out = out + input.charAt(index);
      index = index + 1;
    }
    return out;
  }

  /**
   * Drops every decimal digit from the text.
   */
  static stripDigits(input: string): string {
    hilog.info(DOMAIN, TAG, 'ConvertUtils.stripDigits length=%{public}d', input.length);
    let out: string = '';
    let index: number = 0;
    while (index < input.length) {
      const code: number = input.charCodeAt(index);
      const isDigit: boolean = code >= DIGIT_ZERO && code <= DIGIT_NINE;
      if (!isDigit) {
        out = out + input.charAt(index);
      }
      index = index + 1;
    }
    return out;
  }

  /**
   * Maps one character code to its hexadecimal value, minus one when invalid.
   */
  private static hexDigit(code: number): number {
    if (code >= 48 && code <= 57) {
      return code - 48;
    }
    if (code >= 65 && code <= 70) {
      return code - 55;
    }
    if (code >= 97 && code <= 102) {
      return code - 87;
    }
    return -1;
  }
}
