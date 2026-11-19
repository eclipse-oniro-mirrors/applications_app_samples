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
const ID_PREFIX: string = 'ID-';
const COUNT_PREFIX: string = 'COUNT:';
const DASH: string = '-';
const PAD_CHAR: string = '0';
const DIGIT_ZERO: number = 48;
const DIGIT_NINE: number = 57;
const UPPER_A: number = 65;
const UPPER_Z: number = 90;
const LOWER_A: number = 97;
const LOWER_Z: number = 122;
const SHORT_LENGTH: number = 8;
const DEFAULT_WIDTH: number = 4;
const NOT_FOUND: number = -1;
const SUFFIX_ONE: string = '-1';
const SUFFIX_TWO: string = '-2';

/**
 * Identifier rendering helpers backing the ohosTest utility suites.
 *
 * The members never allocate a global counter; every identifier is derived from
 * its argument so that a suite can predict the exact rendering.
 */
export class IdUtils {
  /**
   * Renders a zero padded identifier with the default prefix.
   */
  static nextId(sequence: number): string {
    hilog.info(DOMAIN, TAG, 'IdUtils.nextId sequence=%{public}d', sequence);
    return ID_PREFIX + IdUtils.padNumber(sequence, DEFAULT_WIDTH);
  }

  /**
   * Renders a counter label for the sequence value.
   */
  static counterId(sequence: number): string {
    hilog.info(DOMAIN, TAG, 'IdUtils.counterId sequence=%{public}d', sequence);
    return COUNT_PREFIX + Math.abs(Math.trunc(sequence)).toString();
  }

  /**
   * Renders the magnitude of the value with the requested zero padding.
   */
  static formatId(sequence: number, width: number): string {
    hilog.info(DOMAIN, TAG, 'IdUtils.formatId width=%{public}d', width);
    return IdUtils.padNumber(sequence, width);
  }

  /**
   * Reports whether the text is a usable identifier literal.
   */
  static isValidId(input: string): boolean {
    hilog.info(DOMAIN, TAG, 'IdUtils.isValidId length=%{public}d', input.length);
    if (input.length === 0) {
      return false;
    }
    let index: number = 0;
    while (index < input.length) {
      const code: number = input.charCodeAt(index);
      const isDigit: boolean = code >= DIGIT_ZERO && code <= DIGIT_NINE;
      const isUpper: boolean = code >= UPPER_A && code <= UPPER_Z;
      const isLower: boolean = code >= LOWER_A && code <= LOWER_Z;
      const isDash: boolean = input.charAt(index) === DASH;
      if (!isDigit && !isUpper && !isLower && !isDash) {
        return false;
      }
      index = index + 1;
    }
    return true;
  }

  /**
   * Returns the text before the first dash, empty when absent.
   */
  static parsePrefix(input: string): string {
    hilog.info(DOMAIN, TAG, 'IdUtils.parsePrefix length=%{public}d', input.length);
    const dashIndex: number = input.indexOf(DASH);
    if (dashIndex < 0) {
      return '';
    }
    return input.substring(0, dashIndex);
  }

  /**
   * Returns the text after the first dash, empty when absent.
   */
  static parseSuffix(input: string): string {
    hilog.info(DOMAIN, TAG, 'IdUtils.parseSuffix length=%{public}d', input.length);
    const dashIndex: number = input.indexOf(DASH);
    if (dashIndex < 0) {
      return '';
    }
    return input.substring(dashIndex + 1);
  }

  /**
   * Upper cases the identifier for comparison purposes.
   */
  static normalizeId(input: string): string {
    hilog.info(DOMAIN, TAG, 'IdUtils.normalizeId length=%{public}d', input.length);
    return input.toUpperCase();
  }

  /**
   * Adds up the character codes of the identifier.
   */
  static hashId(input: string): number {
    hilog.info(DOMAIN, TAG, 'IdUtils.hashId length=%{public}d', input.length);
    let total: number = 0;
    let index: number = 0;
    while (index < input.length) {
      total = total + input.charCodeAt(index);
      index = index + 1;
    }
    return total;
  }

  /**
   * Returns the leading window of at most eight characters.
   */
  static shortId(input: string): string {
    hilog.info(DOMAIN, TAG, 'IdUtils.shortId length=%{public}d', input.length);
    if (input.length <= SHORT_LENGTH) {
      return input;
    }
    return input.substring(0, SHORT_LENGTH);
  }

  /**
   * Returns the character count of the identifier.
   */
  static idLength(input: string): number {
    hilog.info(DOMAIN, TAG, 'IdUtils.idLength length=%{public}d', input.length);
    return input.length;
  }

  /**
   * Prefixes the text with the identifier marker.
   */
  static composeId(input: string): string {
    hilog.info(DOMAIN, TAG, 'IdUtils.composeId length=%{public}d', input.length);
    return ID_PREFIX + input;
  }

  /**
   * Expands the text into a base identifier plus two numbered variants.
   */
  static expandId(input: string): string[] {
    hilog.info(DOMAIN, TAG, 'IdUtils.expandId length=%{public}d', input.length);
    const out: string[] = [];
    out.push(input);
    out.push(input + SUFFIX_ONE);
    out.push(input + SUFFIX_TWO);
    return out;
  }

  /**
   * Reports whether the text carries a dash separator.
   */
  static hasDash(input: string): boolean {
    hilog.info(DOMAIN, TAG, 'IdUtils.hasDash length=%{public}d', input.length);
    return input.indexOf(DASH) !== NOT_FOUND;
  }

  /**
   * Reports whether the text is a non empty decimal run.
   */
  static isNumericSuffix(input: string): boolean {
    hilog.info(DOMAIN, TAG, 'IdUtils.isNumericSuffix length=%{public}d', input.length);
    if (input.length === 0) {
      return false;
    }
    let index: number = 0;
    while (index < input.length) {
      const code: number = input.charCodeAt(index);
      if (code < DIGIT_ZERO || code > DIGIT_NINE) {
        return false;
      }
      index = index + 1;
    }
    return true;
  }

  /**
   * Renders the magnitude of the value with the requested zero padding.
   */
  private static padNumber(value: number, width: number): string {
    let text: string = Math.abs(Math.trunc(value)).toString();
    while (text.length < width) {
      text = PAD_CHAR + text;
    }
    return text;
  }
}
