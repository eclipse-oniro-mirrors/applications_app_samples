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
const SPACE_CODE: number = 32;
const UPPER_A_CODE: number = 97;
const UPPER_Z_CODE: number = 122;
const LOWER_A_CODE: number = 65;
const LOWER_Z_CODE: number = 90;
const CASE_DELTA: number = 32;
const DEFAULT_SEPARATOR: string = ',';
const JOIN_CHAR: string = '|';

/**
 * Plain string helpers backing the ohosTest utility suites.
 *
 * Every member is a side effect free pure function so that the suites can
 * assert on a value without touching the accessibility service. The class is
 * deliberately not referenced from pages/Index.ets.
 */
export class StringUtils {
  /**
   * Removes leading and trailing whitespace characters.
   */
  static trim(input: string): string {
    hilog.info(DOMAIN, TAG, 'StringUtils.trim length=%{public}d', input.length);
    let start: number = 0;
    let end: number = input.length;
    while (start < end && input.charCodeAt(start) <= SPACE_CODE) {
      start = start + 1;
    }
    while (end > start && input.charCodeAt(end - 1) <= SPACE_CODE) {
      end = end - 1;
    }
    return input.substring(start, end);
  }

  /**
   * Converts ASCII lower case characters to upper case, leaving the rest as is.
   */
  static toUpper(input: string): string {
    hilog.info(DOMAIN, TAG, 'StringUtils.toUpper length=%{public}d', input.length);
    let out: string = '';
    let index: number = 0;
    while (index < input.length) {
      const code: number = input.charCodeAt(index);
      if (code >= UPPER_A_CODE && code <= UPPER_Z_CODE) {
        out = out + String.fromCharCode(code - CASE_DELTA);
      } else {
        out = out + input.charAt(index);
      }
      index = index + 1;
    }
    return out;
  }

  /**
   * Converts ASCII upper case characters to lower case, leaving the rest as is.
   */
  static toLower(input: string): string {
    hilog.info(DOMAIN, TAG, 'StringUtils.toLower length=%{public}d', input.length);
    let out: string = '';
    let index: number = 0;
    while (index < input.length) {
      const code: number = input.charCodeAt(index);
      if (code >= LOWER_A_CODE && code <= LOWER_Z_CODE) {
        out = out + String.fromCharCode(code + CASE_DELTA);
      } else {
        out = out + input.charAt(index);
      }
      index = index + 1;
    }
    return out;
  }

  /**
   * Reports whether the value has zero characters.
   */
  static isEmpty(input: string): boolean {
    hilog.info(DOMAIN, TAG, 'StringUtils.isEmpty length=%{public}d', input.length);
    return input.length === 0;
  }

  /**
   * Reports whether the value has zero characters after trimming.
   */
  static isBlank(input: string): boolean {
    hilog.info(DOMAIN, TAG, 'StringUtils.isBlank length=%{public}d', input.length);
    return StringUtils.trim(input).length === 0;
  }

  /**
   * Upper cases only the first character and keeps the tail untouched.
   */
  static capitalize(input: string): string {
    hilog.info(DOMAIN, TAG, 'StringUtils.capitalize length=%{public}d', input.length);
    if (input.length === 0) {
      return '';
    }
    return StringUtils.toUpper(input.substring(0, 1)) + input.substring(1);
  }

  /**
   * Reverses the character order of the value.
   */
  static reverse(input: string): string {
    hilog.info(DOMAIN, TAG, 'StringUtils.reverse length=%{public}d', input.length);
    let out: string = '';
    let index: number = input.length - 1;
    while (index >= 0) {
      out = out + input.charAt(index);
      index = index - 1;
    }
    return out;
  }

  /**
   * Concatenates the value with itself three times.
   */
  static repeat3(input: string): string {
    hilog.info(DOMAIN, TAG, 'StringUtils.repeat3 length=%{public}d', input.length);
    let out: string = '';
    let round: number = 0;
    while (round < 3) {
      out = out + input;
      round = round + 1;
    }
    return out;
  }

  /**
   * Returns the inclusive/exclusive window [start, end) clamping negatives.
   */
  static substringSafe(input: string, start: number, end: number): string {
    hilog.info(DOMAIN, TAG, 'StringUtils.substringSafe start=%{public}d end=%{public}d', start, end);
    const safeStart: number = start < 0 ? 0 : start;
    const safeEnd: number = end > input.length ? input.length : end;
    return input.substring(safeStart, safeEnd);
  }

  /**
   * Counts non overlapping occurrences of a single character.
   */
  static countOf(input: string, target: string): number {
    hilog.info(DOMAIN, TAG, 'StringUtils.countOf target=%{public}s', target);
    let total: number = 0;
    let index: number = 0;
    while (index < input.length) {
      if (input.charAt(index) === target) {
        total = total + 1;
      }
      index = index + 1;
    }
    return total;
  }

  /**
   * Drops every occurrence of a single character.
   */
  static removeAll(input: string, target: string): string {
    hilog.info(DOMAIN, TAG, 'StringUtils.removeAll target=%{public}s', target);
    let out: string = '';
    let index: number = 0;
    while (index < input.length) {
      const current: string = input.charAt(index);
      if (current !== target) {
        out = out + current;
      }
      index = index + 1;
    }
    return out;
  }

  /**
   * Returns the first index of the target character or -1 when absent.
   */
  static indexOfValue(input: string, target: string): number {
    hilog.info(DOMAIN, TAG, 'StringUtils.indexOfValue target=%{public}s', target);
    let index: number = 0;
    while (index < input.length) {
      if (input.charAt(index) === target) {
        return index;
      }
      index = index + 1;
    }
    return -1;
  }

  /**
   * Splits on comma and trims every produced segment.
   */
  static splitTrim(input: string): string[] {
    hilog.info(DOMAIN, TAG, 'StringUtils.splitTrim length=%{public}d', input.length);
    const parts: string[] = input.split(DEFAULT_SEPARATOR);
    const out: string[] = [];
    let index: number = 0;
    while (index < parts.length) {
      out.push(StringUtils.trim(parts[index]));
      index = index + 1;
    }
    return out;
  }

  /**
   * Joins every single character with the pipe separator.
   */
  static joinChars(input: string): string {
    hilog.info(DOMAIN, TAG, 'StringUtils.joinChars length=%{public}d', input.length);
    let out: string = '';
    let index: number = 0;
    while (index < input.length) {
      if (index > 0) {
        out = out + JOIN_CHAR;
      }
      out = out + input.charAt(index);
      index = index + 1;
    }
    return out;
  }
}
