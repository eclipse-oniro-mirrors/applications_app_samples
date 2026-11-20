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

import { AppLogger } from '../AppLogger';

/** Regex for mainland China mobile phone numbers. */
const PHONE_CN_PATTERN: RegExp = /^1[3-9]\d{9}$/;
/** Regex for e-mail addresses, pragmatic subset of RFC 5322. */
const EMAIL_PATTERN: RegExp = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
/** Regex for http and https URLs with optional port and path. */
const URL_PATTERN: RegExp = /^https?:\/\/[\w.-]+(:\d{2,5})?(\/\S*)?$/;
/** Regex for IPv4 addresses with each octet in the range 0-255. */
const IPV4_PATTERN: RegExp = /^(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}$/;
/** Decimal radix used when parsing integers from strings. */
const RADIX_DECIMAL: number = 10;
/** Lowest valid TCP/UDP port number. */
const MIN_PORT_NUMBER: number = 0;
/** Highest valid TCP/UDP port number. */
const MAX_PORT_NUMBER: number = 65535;

/**
 * Utility class for common validation checks based on regular expressions.
 * All methods are static and null-safe, missing inputs simply fail the check.
 */
export class ValidateUtils {
  /**
   * Checks whether the input looks like a valid e-mail address.
   */
  public static isEmail(value: string | null | undefined): boolean {
    if (value === null || value === undefined || value.length === 0) {
      return false;
    }
    return EMAIL_PATTERN.test(value);
  }

  /**
   * Checks whether the input looks like a mainland China mobile phone number.
   */
  public static isPhoneCN(value: string | null | undefined): boolean {
    if (value === null || value === undefined || value.length === 0) {
      return false;
    }
    return PHONE_CN_PATTERN.test(value);
  }

  /**
   * Checks whether the input looks like an http or https URL.
   */
  public static isUrl(value: string | null | undefined): boolean {
    if (value === null || value === undefined || value.length === 0) {
      return false;
    }
    return URL_PATTERN.test(value);
  }

  /**
   * Checks whether the input looks like a valid IPv4 address.
   */
  public static isIpv4(value: string | null | undefined): boolean {
    if (value === null || value === undefined || value.length === 0) {
      return false;
    }
    return IPV4_PATTERN.test(value);
  }

  /**
   * Checks whether the number is a valid TCP/UDP port number.
   */
  public static isPortNumber(value: number): boolean {
    return Number.isInteger(value) && value >= MIN_PORT_NUMBER && value <= MAX_PORT_NUMBER;
  }

  /**
   * Checks whether the input parses to a positive integer greater than zero.
   * Logs a warning when the value cannot be parsed at all.
   */
  public static isPositiveInteger(value: string | null | undefined): boolean {
    if (value === null || value === undefined || value.length === 0) {
      return false;
    }
    const parsed: number = Number.parseInt(value, RADIX_DECIMAL);
    if (Number.isNaN(parsed)) {
      // Unparsable input is a common caller mistake, warn with the raw value.
      AppLogger.warn('ValidateUtils', `isPositiveInteger cannot parse value: ${value}`);
      return false;
    }
    return Number.isInteger(parsed) && parsed > 0;
  }

  /**
   * Checks whether the input length is inside the inclusive [minLength, maxLength] range.
   * Logs a warning when the bounds themselves are invalid.
   */
  public static isLengthInRange(value: string | null | undefined, minLength: number, maxLength: number): boolean {
    if (minLength < 0 || maxLength < minLength) {
      // Invalid bounds are a caller mistake, warn instead of silently failing.
      AppLogger.warn('ValidateUtils', `isLengthInRange called with invalid bounds: ${minLength}, ${maxLength}`);
      return false;
    }
    if (value === null || value === undefined) {
      return false;
    }
    return value.length >= minLength && value.length <= maxLength;
  }
}
