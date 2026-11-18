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
const UPPER_A: number = 65;
const UPPER_Z: number = 90;
const LOWER_A: number = 97;
const LOWER_Z: number = 122;
const HEX_COLOR_LENGTH: number = 7;
const HEX_BYTE_LENGTH: number = 2;
const PHONE_LENGTH: number = 11;
const IPV4_PARTS: number = 4;
const IPV4_MAX: number = 255;
const HASH_PREFIX: string = '#';
const AT_SIGN: string = '@';
const DOT: string = '.';
const SPACE_CODE: number = 32;
const UNDERSCORE_CODE: number = 95;
const NULL_LENGTH: number = 0;
const NEGATIVE_ONE: number = -1;

/**
 * Input format probes backing the ohosTest utility suites.
 *
 * The probes are written as character loops instead of regular expressions so
 * that they stay allocation free and predictable on every device profile.
 */
export class ValidateUtils {
  /**
   * Reports whether every character is a decimal digit.
   */
  static isDigits(input: string): boolean {
    hilog.info(DOMAIN, TAG, 'ValidateUtils.isDigits length=%{public}d', input.length);
    if (input.length === NULL_LENGTH) {
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
   * Reports whether every character is an ASCII letter.
   */
  static isAlpha(input: string): boolean {
    hilog.info(DOMAIN, TAG, 'ValidateUtils.isAlpha length=%{public}d', input.length);
    if (input.length === NULL_LENGTH) {
      return false;
    }
    let index: number = 0;
    while (index < input.length) {
      const code: number = input.charCodeAt(index);
      if (!ValidateUtils.isAlphaCode(code)) {
        return false;
      }
      index = index + 1;
    }
    return true;
  }

  /**
   * Reports whether every character is an ASCII letter or digit.
   */
  static isAlphanumeric(input: string): boolean {
    hilog.info(DOMAIN, TAG, 'ValidateUtils.isAlphanumeric length=%{public}d', input.length);
    if (input.length === NULL_LENGTH) {
      return false;
    }
    let index: number = 0;
    while (index < input.length) {
      const code: number = input.charCodeAt(index);
      const isDigit: boolean = code >= DIGIT_ZERO && code <= DIGIT_NINE;
      if (!isDigit && !ValidateUtils.isAlphaCode(code)) {
        return false;
      }
      index = index + 1;
    }
    return true;
  }

  /**
   * Reports whether the value looks like a #RRGGBB colour literal.
   */
  static isHexColor(input: string): boolean {
    hilog.info(DOMAIN, TAG, 'ValidateUtils.isHexColor length=%{public}d', input.length);
    if (input.length !== HEX_COLOR_LENGTH) {
      return false;
    }
    if (input.charAt(0) !== HASH_PREFIX) {
      return false;
    }
    let index: number = 1;
    while (index < input.length) {
      if (!ValidateUtils.isHexCode(input.charCodeAt(index))) {
        return false;
      }
      index = index + 1;
    }
    return true;
  }

  /**
   * Reports whether the value matches a deliberately loose mail shape.
   */
  static isEmailLoose(input: string): boolean {
    hilog.info(DOMAIN, TAG, 'ValidateUtils.isEmailLoose length=%{public}d', input.length);
    let index: number = 0;
    while (index < input.length) {
      if (input.charCodeAt(index) <= SPACE_CODE) {
        return false;
      }
      index = index + 1;
    }
    const atIndex: number = input.indexOf(AT_SIGN);
    if (atIndex <= 0) {
      return false;
    }
    if (input.indexOf(AT_SIGN, atIndex + 1) !== NEGATIVE_ONE) {
      return false;
    }
    const domain: string = input.substring(atIndex + 1);
    const dotIndex: number = domain.indexOf(DOT);
    if (dotIndex <= 0) {
      return false;
    }
    return dotIndex < domain.length - 1;
  }

  /**
   * Reports whether the value is a dotted quad with every part below 256.
   */
  static isIpv4(input: string): boolean {
    hilog.info(DOMAIN, TAG, 'ValidateUtils.isIpv4 length=%{public}d', input.length);
    const parts: string[] = input.split(DOT);
    if (parts.length !== IPV4_PARTS) {
      return false;
    }
    let index: number = 0;
    while (index < parts.length) {
      if (!ValidateUtils.isDigits(parts[index])) {
        return false;
      }
      const value: number = Number.parseInt(parts[index], 10);
      if (value > IPV4_MAX) {
        return false;
      }
      index = index + 1;
    }
    return true;
  }

  /**
   * Reports whether the value is an eleven digit mainland phone number.
   */
  static isPhoneCn(input: string): boolean {
    hilog.info(DOMAIN, TAG, 'ValidateUtils.isPhoneCn length=%{public}d', input.length);
    if (input.length !== PHONE_LENGTH) {
      return false;
    }
    if (input.charAt(0) !== '1') {
      return false;
    }
    let index: number = 1;
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
   * Reports whether the value starts with an http scheme.
   */
  static isUrlHttp(input: string): boolean {
    hilog.info(DOMAIN, TAG, 'ValidateUtils.isUrlHttp length=%{public}d', input.length);
    return input.indexOf('http://') === 0 || input.indexOf('https://') === 0;
  }

  /**
   * Reports whether the length sits inside the inclusive window.
   */
  static lengthBetween(input: string, low: number, high: number): boolean {
    hilog.info(DOMAIN, TAG, 'ValidateUtils.lengthBetween low=%{public}d high=%{public}d', low, high);
    return input.length >= low && input.length <= high;
  }

  /**
   * Reports whether the value is an upper snake identifier.
   */
  static isUpperSnake(input: string): boolean {
    hilog.info(DOMAIN, TAG, 'ValidateUtils.isUpperSnake length=%{public}d', input.length);
    if (input.length === NULL_LENGTH) {
      return false;
    }
    const first: number = input.charCodeAt(0);
    if (first < UPPER_A || first > UPPER_Z) {
      return false;
    }
    let index: number = 1;
    while (index < input.length) {
      const code: number = input.charCodeAt(index);
      const isUpper: boolean = code >= UPPER_A && code <= UPPER_Z;
      const isDigit: boolean = code >= DIGIT_ZERO && code <= DIGIT_NINE;
      const isUnderscore: boolean = code === UNDERSCORE_CODE;
      if (!isUpper && !isDigit && !isUnderscore) {
        return false;
      }
      index = index + 1;
    }
    return true;
  }

  /**
   * Reports whether the value is a lower camel identifier.
   */
  static isLowerCamel(input: string): boolean {
    hilog.info(DOMAIN, TAG, 'ValidateUtils.isLowerCamel length=%{public}d', input.length);
    if (input.length === NULL_LENGTH) {
      return false;
    }
    const first: number = input.charCodeAt(0);
    if (first < LOWER_A || first > LOWER_Z) {
      return false;
    }
    let index: number = 1;
    while (index < input.length) {
      const code: number = input.charCodeAt(index);
      const isDigit: boolean = code >= DIGIT_ZERO && code <= DIGIT_NINE;
      if (!isDigit && !ValidateUtils.isAlphaCode(code)) {
        return false;
      }
      index = index + 1;
    }
    return true;
  }

  /**
   * Reports whether the value is the literal true or false text.
   */
  static isBooleanString(input: string): boolean {
    hilog.info(DOMAIN, TAG, 'ValidateUtils.isBooleanString length=%{public}d', input.length);
    return input === 'true' || input === 'false';
  }

  /**
   * Reports whether the trimmed value converts to a finite number.
   */
  static isNumericString(input: string): boolean {
    hilog.info(DOMAIN, TAG, 'ValidateUtils.isNumericString length=%{public}d', input.length);
    const trimmed: string = input.trim();
    if (trimmed.length === NULL_LENGTH) {
      return false;
    }
    return !Number.isNaN(Number(trimmed));
  }

  /**
   * Reports whether the value is exactly two hexadecimal characters.
   */
  static isHexByte(input: string): boolean {
    hilog.info(DOMAIN, TAG, 'ValidateUtils.isHexByte length=%{public}d', input.length);
    if (input.length !== HEX_BYTE_LENGTH) {
      return false;
    }
    return ValidateUtils.isHexCode(input.charCodeAt(0)) && ValidateUtils.isHexCode(input.charCodeAt(1));
  }

  /**
   * Shared ASCII letter probe used by the public predicates.
   */
  private static isAlphaCode(code: number): boolean {
    const isUpper: boolean = code >= UPPER_A && code <= UPPER_Z;
    const isLower: boolean = code >= LOWER_A && code <= LOWER_Z;
    return isUpper || isLower;
  }

  /**
   * Shared hexadecimal digit probe used by the colour predicates.
   */
  private static isHexCode(code: number): boolean {
    const isDigit: boolean = code >= DIGIT_ZERO && code <= DIGIT_NINE;
    const isUpperHex: boolean = code >= 65 && code <= 70;
    const isLowerHex: boolean = code >= 97 && code <= 102;
    return isDigit || isUpperHex || isLowerHex;
  }
}
