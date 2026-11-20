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

/** Suffix appended by {@link StringUtils.truncate} when the input is shortened. */
const TRUNCATE_SUFFIX: string = '...';
/** Character code of the digit zero, used by {@link StringUtils.isNumeric}. */
const CHAR_CODE_ZERO: number = 48;
/** Character code of the digit nine, used by {@link StringUtils.isNumeric}. */
const CHAR_CODE_NINE: number = 57;
/** Decimal radix used when parsing integers from strings. */
const RADIX_DECIMAL: number = 10;

/**
 * Utility class for common string operations.
 * All methods are static and null-safe: inputs may be null or undefined.
 */
export class StringUtils {
  /**
   * Checks whether the input is null, undefined or an empty string.
   * @param value - the string to check, may be null or undefined.
   * @returns true when the value is considered empty.
   */
  public static isEmpty(value: string | null | undefined): boolean {
    return value === null || value === undefined || value.length === 0;
  }

  /**
   * Inverse of {@link StringUtils.isEmpty}.
   */
  public static isNotEmpty(value: string | null | undefined): boolean {
    return !StringUtils.isEmpty(value);
  }

  /**
   * Checks whether the input is null, undefined or blank (only whitespace).
   */
  public static isBlank(value: string | null | undefined): boolean {
    // Missing values are treated as blank directly.
    if (value === null || value === undefined) {
      return true;
    }
    return value.trim().length === 0;
  }

  /**
   * Inverse of {@link StringUtils.isBlank}.
   */
  public static isNotBlank(value: string | null | undefined): boolean {
    return !StringUtils.isBlank(value);
  }

  /**
   * Converts null or undefined to an empty string, otherwise returns the trimmed input.
   */
  public static trimToEmpty(value: string | null | undefined): string {
    // Normalize missing values to an empty string before trimming.
    if (value === null || value === undefined) {
      return '';
    }
    return value.trim();
  }

  /**
   * Compares two strings for exact equality with null-safety.
   */
  public static equals(first: string | null | undefined, second: string | null | undefined): boolean {
    // Identical references (or both missing) are always equal.
    if (first === second) {
      return true;
    }
    // Only one of the two values is present, so they cannot be equal.
    if (first === null || first === undefined || second === null || second === undefined) {
      return false;
    }
    return first === second;
  }

  /**
   * Case-insensitive equality check with null-safety.
   */
  public static equalsIgnoreCase(first: string | null | undefined, second: string | null | undefined): boolean {
    // A missing operand can never be equal to anything.
    if (first === null || first === undefined || second === null || second === undefined) {
      return false;
    }
    // Lower-case both operands before comparing.
    return first.toLowerCase() === second.toLowerCase();
  }

  /**
   * Uppercases the first character of the input, missing values become empty strings.
   */
  public static capitalize(value: string | null | undefined): string {
    // Nothing to capitalize for null, undefined or empty input.
    if (value === null || value === undefined || value.length === 0) {
      return StringUtils.trimToEmpty(value);
    }
    // Rebuild the string with the first character uppercased.
    return `${value.charAt(0).toUpperCase()}${value.substring(1)}`;
  }

  /**
   * Replaces '{0}', '{1}' and so on in the template with the given arguments.
   * @param template - text containing placeholders such as '{0}'.
   * @param args - replacement values in placeholder order.
   */
  public static format(template: string, ...args: string[]): string {
    return StringUtils.formatWithArgs(template, args);
  }

  /**
   * Replaces '{0}', '{1}' and so on in the template with the given argument array.
   * @param template - text containing placeholders such as '{0}'.
   * @param args - replacement values in placeholder order.
   */
  public static formatWithArgs(template: string, args: string[]): string {
    if (StringUtils.isEmpty(template)) {
      return StringUtils.trimToEmpty(template);
    }
    // Replace every '{index}' placeholder that has a matching argument.
    let result: string = template;
    for (let i = 0; i < args.length; i++) {
      // Build the placeholder token such as '{0}' for the current index.
      const token: string = `{${i}}`;
      result = result.split(token).join(args[i]);
    }
    return result;
  }

  /**
   * Truncates the input to maxLength characters and appends '...' when shortened.
   * Logs a warning when maxLength is not positive.
   */
  public static truncate(value: string | null | undefined, maxLength: number): string {
    if (maxLength <= 0) {
      // A non-positive limit is a caller mistake, warn and return an empty string.
      AppLogger.warn('StringUtils', `truncate called with non-positive maxLength: ${maxLength}`);
      return '';
    }
    if (value === null || value === undefined) {
      return '';
    }
    // The value already fits, no truncation is needed.
    if (value.length <= maxLength) {
      return value;
    }
    return `${value.substring(0, maxLength)}${TRUNCATE_SUFFIX}`;
  }

  /**
   * Joins the given parts with the separator, skipping null, undefined and empty parts.
   */
  public static join(separator: string, parts: Array<string | null | undefined>): string {
    // Filter out missing or empty fragments before joining.
    const filtered: string[] = [];
    for (const part of parts) {
      if (part !== null && part !== undefined && part.length > 0) {
        filtered.push(part);
      }
    }
    return filtered.join(separator);
  }

  /**
   * Parses the input as a decimal integer and returns defaultValue when parsing fails.
   * Logs a warning when the input cannot be parsed.
   */
  public static toIntOrDefault(value: string | null | undefined, defaultValue: number): number {
    if (value === null || value === undefined) {
      return defaultValue;
    }
    // parseInt returns NaN for inputs that are not numbers.
    const parsed: number = Number.parseInt(value, RADIX_DECIMAL);
    if (Number.isNaN(parsed)) {
      AppLogger.warn('StringUtils', `toIntOrDefault failed for value: ${value}`);
      return defaultValue;
    }
    return parsed;
  }

  /**
   * Checks whether the input consists of ASCII digits only.
   * Signs, decimal points and whitespace make the check fail.
   */
  public static isNumeric(value: string | null | undefined): boolean {
    if (value === null || value === undefined || value.length === 0) {
      return false;
    }
    // Every single character must fall into the digit code range.
    for (let i = 0; i < value.length; i++) {
      const code: number = value.charCodeAt(i);
      if (code < CHAR_CODE_ZERO || code > CHAR_CODE_NINE) {
        return false;
      }
    }
    return true;
  }
}
