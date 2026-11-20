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

import { RESERVED_MODULE_NAMES } from './ConfigConstants';

/**
 * String helpers used by the configuration validators.
 */
export class NameUtils {
  /**
   * Returns true when the value is empty or only contains whitespace.
   */
  public static isBlank(value: string): boolean {
    return value.trim().length === 0;
  }

  /**
   * Returns true when the value is a PascalCase identifier.
   */
  public static isPascalCase(value: string): boolean {
    if (value.length === 0) {
      return false;
    }
    const pattern: RegExp = new RegExp('^[A-Z][A-Za-z0-9]*$');
    return pattern.test(value);
  }

  /**
   * Returns true when the value is a lower case identifier with underscores.
   */
  public static isLowerSnake(value: string): boolean {
    if (value.length === 0) {
      return false;
    }
    const pattern: RegExp = new RegExp('^[a-z][a-z0-9_]*$');
    return pattern.test(value);
  }

  /**
   * Returns true when the value only contains characters allowed in segment names.
   */
  public static isSegmentSafe(value: string): boolean {
    if (value.length === 0) {
      return false;
    }
    const pattern: RegExp = new RegExp('^[A-Za-z0-9_]+$');
    return pattern.test(value);
  }

  /**
   * Returns true when the value looks like a dotted bundle name.
   */
  public static isBundleNameShape(value: string): boolean {
    if (value.length === 0) {
      return false;
    }
    const pattern: RegExp = new RegExp('^[a-z0-9_]+(\\.[a-z0-9_]+)+$');
    return pattern.test(value);
  }

  /**
   * Returns true when the value contains at least one upper case letter.
   */
  public static hasUppercase(value: string): boolean {
    return value !== value.toLowerCase();
  }

  /**
   * Returns true when the value contains whitespace characters.
   */
  public static hasWhitespace(value: string): boolean {
    const pattern: RegExp = new RegExp('\\s');
    return pattern.test(value);
  }

  /**
   * Returns true when the value starts with a digit.
   */
  public static startsWithDigit(value: string): boolean {
    if (value.length === 0) {
      return false;
    }
    const first: string = value.substring(0, 1);
    const digits: string = '0123456789';
    return digits.indexOf(first) >= 0;
  }

  /**
   * Returns true when the value starts with the requested marker.
   */
  public static startsWith(value: string, marker: string): boolean {
    return value.substring(0, marker.length) === marker;
  }

  /**
   * Returns true when the value ends with the requested marker.
   */
  public static endsWith(value: string, marker: string): boolean {
    if (marker.length > value.length) {
      return false;
    }
    return value.substring(value.length - marker.length) === marker;
  }

  /**
   * Returns true when the value contains the requested fragment.
   */
  public static contains(value: string, fragment: string): boolean {
    return value.indexOf(fragment) >= 0;
  }

  /**
   * Counts the non overlapping occurrences of a fragment.
   */
  public static countOccurrences(value: string, fragment: string): number {
    if (fragment.length === 0) {
      return 0;
    }
    let count: number = 0;
    let cursor: number = 0;
    while (cursor <= value.length - fragment.length) {
      const current: string = value.substring(cursor, cursor + fragment.length);
      if (current === fragment) {
        count = count + 1;
        cursor = cursor + fragment.length;
      } else {
        cursor = cursor + 1;
      }
    }
    return count;
  }

  /**
   * Splits a value into trimmed segments and drops empty segments.
   */
  public static splitSegments(value: string, separator: string): string[] {
    const rawSegments: string[] = value.split(separator);
    const segments: string[] = [];
    for (let index: number = 0; index < rawSegments.length; index++) {
      const segment: string = rawSegments[index].trim();
      if (segment.length > 0) {
        segments.push(segment);
      }
    }
    return segments;
  }

  /**
   * Splits a value without dropping empty segments.
   */
  public static splitRaw(value: string, separator: string): string[] {
    return value.split(separator);
  }

  /**
   * Joins segments with the requested separator.
   */
  public static joinSegments(segments: string[], separator: string): string {
    return segments.join(separator);
  }

  /**
   * Returns true when the module name is reserved by the system.
   */
  public static isReservedModuleName(value: string): boolean {
    return RESERVED_MODULE_NAMES.indexOf(value) >= 0;
  }

  /**
   * Uppercases the first character of the value.
   */
  public static capitalizeFirst(value: string): string {
    if (value.length === 0) {
      return value;
    }
    return `${value.substring(0, 1).toUpperCase()}${value.substring(1)}`;
  }

  /**
   * Lowercases the first character of the value.
   */
  public static lowerFirst(value: string): string {
    if (value.length === 0) {
      return value;
    }
    return `${value.substring(0, 1).toLowerCase()}${value.substring(1)}`;
  }

  /**
   * Pads an index with leading zeros up to the requested width.
   */
  public static formatIndex(value: number, width: number): string {
    let text: string = `${value}`;
    while (text.length < width) {
      text = `0${text}`;
    }
    return text;
  }

  /**
   * Builds the default source entry path of an ability.
   */
  public static formatAbilityPath(moduleName: string, abilityName: string): string {
    return `./ets/${moduleName}/${abilityName}.ets`;
  }

  /**
   * Returns true when the value only contains characters from the allowed set.
   */
  public static hasOnlyAllowedChars(value: string, allowed: string): boolean {
    for (let index: number = 0; index < value.length; index++) {
      if (allowed.indexOf(value.charAt(index)) < 0) {
        return false;
      }
    }
    return true;
  }

  /**
   * Returns true when the value contains any character of the rejected set.
   */
  public static containsAny(value: string, rejected: string): boolean {
    for (let index: number = 0; index < rejected.length; index++) {
      if (value.indexOf(rejected.charAt(index)) >= 0) {
        return true;
      }
    }
    return false;
  }

  /**
   * Returns the number of dot separated segments.
   */
  public static segmentCount(value: string, separator: string): number {
    return NameUtils.splitRaw(value, separator).length;
  }

  /**
   * Returns true when any segment is empty.
   */
  public static hasEmptySegment(value: string, separator: string): boolean {
    const segments: string[] = NameUtils.splitRaw(value, separator);
    for (let index: number = 0; index < segments.length; index++) {
      if (segments[index].length === 0) {
        return true;
      }
    }
    return false;
  }

  /**
   * Returns the longest segment length of a dotted value.
   */
  public static maxSegmentLength(value: string, separator: string): number {
    const segments: string[] = NameUtils.splitRaw(value, separator);
    let longest: number = 0;
    for (let index: number = 0; index < segments.length; index++) {
      if (segments[index].length > longest) {
        longest = segments[index].length;
      }
    }
    return longest;
  }

  /**
   * Repeats a character the requested number of times.
   */
  public static repeat(character: string, count: number): string {
    let result: string = '';
    let index: number = 0;
    while (index < count) {
      result = `${result}${character}`;
      index = index + 1;
    }
    return result;
  }
}
