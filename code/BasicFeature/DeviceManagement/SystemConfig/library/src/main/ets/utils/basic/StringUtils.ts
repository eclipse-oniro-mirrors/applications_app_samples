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
import { SystemConfigConstants } from '../../constants/SystemConfigConstants';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// Naming style enum
// ========================================

/**
 * Naming style enum
 * Defines target naming styles for string conversion
 */
export enum NamingStyle {
  /** camelCase style */
  CAMEL_CASE = 'camelCase',
  /** snake_case style */
  SNAKE_CASE = 'snake_case',
  /** kebab-case style */
  KEBAB_CASE = 'kebab-case',
  /** PascalCase style */
  PASCAL_CASE = 'PascalCase',
}

// ========================================
// String utility class
// ========================================

/**
 * String utility class
 * Provides rich static string methods including case conversion, naming style conversion,
 * substring searching, random string generation and hash calculation
 */
export class StringUtils {
  /** Random string charset */
  private static readonly RANDOM_CHARS: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

  /** Hexadecimal charset */
  private static readonly HEX_CHARS: string = '0123456789abcdef';

  // ========================================
  // Case conversion methods
  // ========================================

  /**
   * Capitalizes the first letter of a string
   * @param str - Original string
   * @returns String with the first letter capitalized
   */
  static capitalize(str: string): string {
    if (!str || str.length === 0) {
      return str;
    }
    return str.charAt(0).toUpperCase() + str.slice(1);
  }

  /**
   * Lowercases the first letter of a string
   * @param str - Original string
   * @returns String with the first letter lowercased
   */
  static uncapitalize(str: string): string {
    if (!str || str.length === 0) {
      return str;
    }
    return str.charAt(0).toLowerCase() + str.slice(1);
  }

  /**
   * Converts the whole string to upper case
   * @param str - Original string
   * @returns Uppercased string
   */
  static toUpperCase(str: string): string {
    return str.toUpperCase();
  }

  /**
   * Converts the whole string to lower case
   * @param str - Original string
   * @returns Lowercased string
   */
  static toLowerCase(str: string): string {
    return str.toLowerCase();
  }

  // ========================================
  // Naming style conversion methods
  // ========================================

  /**
   * Converts a string to camelCase
   * Supports sources such as snake_case, kebab-case and space-separated forms
   * @param str - Original string
   * @returns camelCase formatted string
   */
  static toCamelCase(str: string): string {
    if (!str || str.length === 0) {
      return str;
    }

    // Split by common separators first
    const words: string[] = StringUtils.splitWords(str);
    if (words.length === 0) {
      return str;
    }

    let result: string = words[0].toLowerCase();
    for (let i: number = 1; i < words.length; i++) {
      result += StringUtils.capitalize(words[i].toLowerCase());
    }
    return result;
  }

  /**
   * Converts a string to snake_case
   * @param str - Original string
   * @returns snake_case formatted string (lowercase with underscores)
   */
  static toSnakeCase(str: string): string {
    if (!str || str.length === 0) {
      return str;
    }

    const words: string[] = StringUtils.splitWords(str);
    return words.map((word: string): string => word.toLowerCase()).join('_');
  }

  /**
   * Converts a string to kebab-case
   * @param str - Original string
   * @returns kebab-case formatted string
   */
  static toKebabCase(str: string): string {
    if (!str || str.length === 0) {
      return str;
    }

    const words: string[] = StringUtils.splitWords(str);
    return words.map((word: string): string => word.toLowerCase()).join('-');
  }

  /**
   * Converts a string to PascalCase
   * @param str - Original string
   * @returns PascalCase formatted string (each word capitalized)
   */
  static toPascalCase(str: string): string {
    if (!str || str.length === 0) {
      return str;
    }

    const words: string[] = StringUtils.splitWords(str);
    return words.map((word: string): string => StringUtils.capitalize(word.toLowerCase())).join('');
  }

  /**
   * Splits a string into a word array
   * Handles camelCase, snake_case, kebab-case, spaces and other separators
   * @param str - Original string
   * @returns Array of split words
   */
  private static splitWords(str: string): string[] {
    // Split by non-alphanumeric characters first
    const parts: string[] = str.replace(/([a-z])([A-Z])/g, '$1 $2')
      .replace(/[_\-\s]+/g, ' ')
      .trim()
      .split(' ');
    return parts.filter((part: string): boolean => part.length > 0);
  }

  // ========================================
  // Substring search methods
  // ========================================

  /**
   * Checks whether a string contains the specified substring
   * @param str - Original string
   * @param sub - Substring to find
   * @returns true if the substring is contained
   */
  static contains(str: string, sub: string): boolean {
    if (!str || !sub) {
      return false;
    }
    return str.indexOf(sub) !== -1;
  }

  /**
   * Checks whether a string starts with the specified prefix
   * @param str - Original string
   * @param prefix - Prefix to check
   * @returns true if the string starts with the prefix
   */
  static startsWith(str: string, prefix: string): boolean {
    if (!str || !prefix) {
      return false;
    }
    return str.indexOf(prefix) === 0;
  }

  /**
   * Checks whether a string ends with the specified suffix
   * @param str - Original string
   * @param suffix - Suffix to check
   * @returns true if the string ends with the suffix
   */
  static endsWith(str: string, suffix: string): boolean {
    if (!str || !suffix) {
      return false;
    }
    return str.indexOf(suffix, str.length - suffix.length) !== -1;
  }

  /**
   * Counts occurrences of a substring in a string
   * @param str - Original string
   * @param sub - Substring to count
   * @returns Number of occurrences
   */
  static countOccurrences(str: string, sub: string): number {
    if (!str || !sub || sub.length === 0) {
      return 0;
    }
    let count: number = 0;
    let pos: number = 0;
    while (true) {
      const index: number = str.indexOf(sub, pos);
      if (index === -1) {
        break;
      }
      count++;
      pos = index + 1;
    }
    return count;
  }

  // ========================================
  // String manipulation methods
  // ========================================

  /**
   * Repeats a string the specified number of times
   * @param str - Original string
   * @param count - Repeat count
   * @returns Repeated string
   */
  static repeat(str: string, count: number): string {
    if (count <= 0 || !str) {
      return '';
    }
    let result: string = '';
    for (let i: number = 0; i < count; i++) {
      result += str;
    }
    return result;
  }

  /**
   * Reverses a string
   * @param str - Original string
   * @returns Reversed string
   */
  static reverse(str: string): string {
    if (!str) {
      return str;
    }
    let result: string = '';
    for (let i: number = str.length - 1; i >= 0; i--) {
      result += str.charAt(i);
    }
    return result;
  }

  /**
   * Removes all whitespace from a string
   * @param str - Original string
   * @returns String without whitespace
   */
  static removeWhitespace(str: string): string {
    if (!str) {
      return str;
    }
    return str.replace(/\s+/g, '');
  }

  /**
   * Trims specified characters from both ends of a string
   * @param str - Original string
   * @param chars - Character set to trim
   * @returns Processed string
   */
  static trimChars(str: string, chars: string): string {
    if (!str) {
      return str;
    }
    let start: number = 0;
    let end: number = str.length;

    while (start < end && chars.indexOf(str.charAt(start)) !== -1) {
      start++;
    }
    while (end > start && chars.indexOf(str.charAt(end - 1)) !== -1) {
      end--;
    }

    return str.substring(start, end);
  }

  /**
   * Truncates a string to the specified maximum length
   * @param str - Original string
   * @param maxLen - Maximum length
   * @param suffix - Suffix appended after truncation, default empty
   * @returns Truncated string
   */
  static substring(str: string, maxLen: number, suffix: string = ''): string {
    if (!str || str.length <= maxLen) {
      return str;
    }
    return str.substring(0, maxLen) + suffix;
  }

  // ========================================
  // Random string generation
  // ========================================

  /**
   * Generates a random string of the specified length
   * Contains upper/lowercase letters and digits
   * @param length - Length of the string to generate
   * @returns Random string
   */
  static generateRandomString(length: number): string {
    let result: string = '';
    for (let i: number = 0; i < length; i++) {
      const randomIndex: number = Math.floor(Math.random() * StringUtils.RANDOM_CHARS.length);
      result += StringUtils.RANDOM_CHARS.charAt(randomIndex);
    }
    return result;
  }

  /**
   * Generates a random hexadecimal string of the specified length
   * @param length - Length of the string to generate
   * @returns Random hexadecimal string
   */
  static generateHexString(length: number): string {
    let result: string = '';
    for (let i: number = 0; i < length; i++) {
      const randomIndex: number = Math.floor(Math.random() * StringUtils.HEX_CHARS.length);
      result += StringUtils.HEX_CHARS.charAt(randomIndex);
    }
    return result;
  }

  // ========================================
  // Hash calculation
  // ========================================

  /**
   * Calculates the hash of a string
   * Uses the DJB2 hash algorithm
   * @param str - String to hash
   * @returns 32-bit integer hash value
   */
  static hashCode(str: string): number {
    if (!str || str.length === 0) {
      return 0;
    }
    let hash: number = 5381;
    for (let i: number = 0; i < str.length; i++) {
      const charCode: number = str.charCodeAt(i);
      hash = ((hash << 5) + hash) + charCode;
      hash = hash & hash; // Convert to a 32-bit integer
    }
    return Math.abs(hash);
  }

  /**
   * Calculates a simple checksum of a string
   * @param str - String to checksum
   * @returns Checksum value
   */
  static checksum(str: string): number {
    if (!str) {
      return 0;
    }
    let sum: number = 0;
    for (let i: number = 0; i < str.length; i++) {
      sum += str.charCodeAt(i);
    }
    return sum;
  }

  // ========================================
  // Helper methods
  // ========================================

  /**
   * Checks whether a string is a valid non-blank string
   * @param str - String to check
   * @returns true if the string is non-empty with non-whitespace content
   */
  static isNotBlank(str: string | null | undefined): boolean {
    return str !== null && str !== undefined && str.trim().length > 0;
  }

  /**
   * Checks whether a string is blank or empty
   * @param str - String to check
   * @returns true if the string is empty or contains only whitespace
   */
  static isBlank(str: string | null | undefined): boolean {
    return !StringUtils.isNotBlank(str);
  }

  /**
   * Safely gets the length of a string
   * @param str - String
   * @returns String length, or 0 for null/undefined
   */
  static safeLength(str: string | null | undefined): number {
    if (!str) {
      return 0;
    }
    return str.length;
  }
}
