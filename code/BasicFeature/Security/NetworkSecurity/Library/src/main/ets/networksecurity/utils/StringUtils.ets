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

import { Logger } from './Logger';

// Hard cap for repeat() so a caller bug cannot allocate an unbounded string.
const REPEAT_LIMIT: number = 10000;

/**
 * String helpers covering emptiness checks, casing, padding, prefix and
 * suffix comparison, repetition and pattern counting.
 * All methods are stateless so callers can invoke them directly on the class.
 */
export class StringUtils {
  /**
   * Check whether a value is undefined, null or an empty string.
   * @param value input text, may be undefined when the caller has no value.
   * @returns true when the value holds no characters at all.
   */
  static isEmpty(value: string | undefined): boolean {
    const tag: string = '[StringUtils#isEmpty]';
    Logger.enter(tag, 'value: ' + (value === undefined ? 'undefined' : value));
    Logger.beginTrace('NetworkSecurity.utils.isEmpty', 1);
    // Undefined and null both count as empty, matching Java-style semantics.
    const result: boolean = value === undefined || value === null || value.length === 0;
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.isEmpty', 1);
    return result;
  }

  /**
   * Check whether a value is undefined, null, empty or whitespace only.
   * @param value input text, may be undefined when the caller has no value.
   * @returns true when the trimmed value holds no visible characters.
   */
  static isBlank(value: string | undefined): boolean {
    const tag: string = '[StringUtils#isBlank]';
    Logger.enter(tag, 'value: ' + (value === undefined ? 'undefined' : value));
    Logger.beginTrace('NetworkSecurity.utils.isBlank', 1);
    // Trim first so whitespace-only text is also treated as blank.
    const result: boolean = value === undefined || value === null || value.trim().length === 0;
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.isBlank', 1);
    return result;
  }

  /**
   * Trim a value and collapse pure whitespace input to null.
   * @param value input text, may be undefined when the caller has no value.
   * @returns the trimmed text, or null when nothing visible remains.
   */
  static trimToNull(value: string | undefined): string | null {
    const tag: string = '[StringUtils#trimToNull]';
    Logger.enter(tag, 'value: ' + (value === undefined ? 'undefined' : value));
    Logger.beginTrace('NetworkSecurity.utils.trimToNull', 1);
    // Start from null so missing input needs no extra branch below.
    let result: string | null = null;
    if (value !== undefined && value !== null) {
      // Keep the trimmed text only when it still holds characters.
      const trimmed: string = value.trim();
      result = trimmed.length === 0 ? null : trimmed;
    }
    Logger.exit(tag, 'result: ' + (result === null ? 'null' : result));
    Logger.endTrace('NetworkSecurity.utils.trimToNull', 1);
    return result;
  }

  /**
   * Uppercase the first character of a value and keep the rest untouched.
   * @param value input text to adjust.
   * @returns the capitalized text, or the original when it is empty.
   */
  static capitalize(value: string): string {
    const tag: string = '[StringUtils#capitalize]';
    Logger.enter(tag, 'value: ' + value);
    Logger.beginTrace('NetworkSecurity.utils.capitalize', 1);
    // Only touch non-empty values so empty input stays empty.
    let result: string = value;
    if (value.length > 0) {
      // Concatenate the uppercased head with the unchanged tail.
      result = value.charAt(0).toUpperCase() + value.substring(1);
    }
    Logger.exit(tag, 'result: ' + result);
    Logger.endTrace('NetworkSecurity.utils.capitalize', 1);
    return result;
  }

  /**
   * Cut a value down to at most maxLength characters.
   * @param value input text to limit.
   * @param maxLength maximum number of characters to keep.
   * @returns the original text when short enough, otherwise the prefix.
   */
  static truncate(value: string, maxLength: number): string {
    const tag: string = '[StringUtils#truncate]';
    Logger.enter(tag, 'maxLength: ' + maxLength.toString());
    Logger.beginTrace('NetworkSecurity.utils.truncate', 1);
    // Short values pass through without allocation.
    let result: string = value;
    if (maxLength >= 0 && value.length > maxLength) {
      // Take the leading slice only up to the requested length.
      result = value.substring(0, maxLength);
    }
    Logger.exit(tag, 'result: ' + result);
    Logger.endTrace('NetworkSecurity.utils.truncate', 1);
    return result;
  }

  /**
   * Prepend a pad character until the value reaches the target length.
   * @param value input text to extend.
   * @param targetLength desired final length in characters.
   * @param padChar single character prepended repeatedly, empty means no-op.
   * @returns the padded text, or the original when padding is impossible.
   */
  static padStart(value: string, targetLength: number, padChar: string): string {
    const tag: string = '[StringUtils#padStart]';
    Logger.enter(tag, 'targetLength: ' + targetLength.toString() + ', padChar: ' + padChar);
    Logger.beginTrace('NetworkSecurity.utils.padStart', 1);
    // An empty pad character would loop forever, so short-circuit instead.
    let result: string = value;
    if (padChar.length === 0 || targetLength <= value.length) {
      result = value;
    } else {
      // Prepend one character per iteration until the target is reached.
      while (result.length < targetLength) {
        result = padChar + result;
      }
    }
    Logger.exit(tag, 'result: ' + result);
    Logger.endTrace('NetworkSecurity.utils.padStart', 1);
    return result;
  }

  /**
   * Check whether a value starts with a prefix ignoring letter case.
   * @param value input text to inspect.
   * @param prefix expected leading text.
   * @returns true when the lowercased value begins with the lowercased prefix.
   */
  static startsWithIgnoreCase(value: string, prefix: string): boolean {
    const tag: string = '[StringUtils#startsWithIgnoreCase]';
    Logger.enter(tag, 'prefix: ' + prefix);
    Logger.beginTrace('NetworkSecurity.utils.startsWithIgnoreCase', 1);
    // A longer prefix can never match, so bail out early.
    let result: boolean = false;
    if (prefix.length <= value.length) {
      // Compare lowercased head slices on both sides.
      const head: string = value.substring(0, prefix.length);
      result = head.toLowerCase() === prefix.toLowerCase();
    }
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.startsWithIgnoreCase', 1);
    return result;
  }

  /**
   * Check whether a value ends with a suffix ignoring letter case.
   * @param value input text to inspect.
   * @param suffix expected trailing text.
   * @returns true when the lowercased value closes with the lowercased suffix.
   */
  static endWithIgnoreCase(value: string, suffix: string): boolean {
    const tag: string = '[StringUtils#endWithIgnoreCase]';
    Logger.enter(tag, 'suffix: ' + suffix);
    Logger.beginTrace('NetworkSecurity.utils.endWithIgnoreCase', 1);
    // A longer suffix can never match, so bail out early.
    let result: boolean = false;
    if (suffix.length <= value.length) {
      // Compare lowercased tail slices on both sides.
      const tail: string = value.substring(value.length - suffix.length);
      result = tail.toLowerCase() === suffix.toLowerCase();
    }
    Logger.exit(tag, 'result: ' + result.toString());
    Logger.endTrace('NetworkSecurity.utils.endWithIgnoreCase', 1);
    return result;
  }

  /**
   * Repeat a value a bounded number of times.
   * @param value text to duplicate.
   * @param times repeat count; negative becomes zero and overflow is capped.
   * @returns the concatenated result of the repeated copies.
   */
  static repeat(value: string, times: number): string {
    const tag: string = '[StringUtils#repeat]';
    Logger.enter(tag, 'times: ' + times.toString());
    Logger.beginTrace('NetworkSecurity.utils.repeat', 1);
    // Clamp the repeat count into a safe range first.
    const safeTimes: number = times < 0 ? 0 : (times > REPEAT_LIMIT ? REPEAT_LIMIT : times);
    // Accumulate copies with plain concatenation, ArkTS forbids templates.
    let result: string = '';
    for (let index = 0; index < safeTimes; index++) {
      result = result + value;
    }
    Logger.exit(tag, 'length: ' + result.length.toString());
    Logger.endTrace('NetworkSecurity.utils.repeat', 1);
    return result;
  }

  /**
   * Count non-overlapping occurrences of a pattern inside a value.
   * @param value text to scan.
   * @param pattern text to look for; empty patterns never match.
   * @returns the number of matches found from left to right.
   */
  static countMatches(value: string, pattern: string): number {
    const tag: string = '[StringUtils#countMatches]';
    Logger.enter(tag, 'pattern: ' + pattern);
    Logger.beginTrace('NetworkSecurity.utils.countMatches', 1);
    // An empty pattern would loop forever, so guard before scanning.
    let count: number = 0;
    if (pattern.length > 0) {
      // Jump past each match so overlapping hits are not double counted.
      let cursor: number = value.indexOf(pattern);
      while (cursor >= 0) {
        count++;
        cursor = value.indexOf(pattern, cursor + pattern.length);
      }
    }
    Logger.exit(tag, 'count: ' + count.toString());
    Logger.endTrace('NetworkSecurity.utils.countMatches', 1);
    return count;
  }
}
