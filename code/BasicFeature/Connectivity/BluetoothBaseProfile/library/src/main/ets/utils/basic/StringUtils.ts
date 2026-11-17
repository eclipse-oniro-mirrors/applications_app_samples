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

import { BluetoothConstants } from '../../constants/BluetoothConstants';

/**
 * naming style enum
 */
export enum NamingStyle {
  CAMEL_CASE = 'camelCase',
  SNAKE_CASE = 'snake_case',
  KEBAB_CASE = 'kebab-case',
  PASCAL_CASE = 'PascalCase',
}

/**
 * string utility class
 * provides rich string handle static state method method
 */
export class StringUtils {
  private static readonly RANDOM_CHARS: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  private static readonly HEX_CHARS: string = '0123456789abcdef';

  /**
   * first character mother large write
   * @param str - original string
   * @returns capitalized string
   */
  static capitalize(str: string): string {
    if (!str || str.length === 0) {
      return str;
    }
    return str.charAt(0).toUpperCase() + str.slice(1);
  }

  /**
   * first character mother small write
   * @param str - original string
   * @returns lower-cased string
   */
  static uncapitalize(str: string): string {
    if (!str || str.length === 0) {
      return str;
    }
    return str.charAt(0).toLowerCase() + str.slice(1);
  }

  /**
   * convert for camel peak naming
   * @param str - original string
   * @returns camel peak naming format style
   */
  static toCamelCase(str: string): string {
    if (!str || str.length === 0) {
      return str;
    }
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
   * convert for snake form naming
   * @param str - original string
   * @returns snake form naming format style
   */
  static toSnakeCase(str: string): string {
    if (!str || str.length === 0) {
      return str;
    }
    const words: string[] = StringUtils.splitWords(str);
    return words.map((w: string): string => w.toLowerCase()).join('_');
  }

  /**
   * convert for short horizontal line naming
   * @param str - original string
   * @returns short horizontal line naming format style
   */
  static toKebabCase(str: string): string {
    if (!str || str.length === 0) {
      return str;
    }
    const words: string[] = StringUtils.splitWords(str);
    return words.map((w: string): string => w.toLowerCase()).join('-');
  }

  /**
   * split divide for word array
   * @param str - original string
   * @returns word array
   */
  private static splitWords(str: string): string[] {
    const parts: string[] = str.replace(/([a-z])([A-Z])/g, '$1 $2')
      .replace(/[_\-\s]+/g, ' ')
      .trim()
      .split(' ');
    return parts.filter((p: string): boolean => p.length > 0);
  }

  /**
   * check whether package contain sub string
   * @param str - original string
   * @param sub - sub string
   * @returns whether package contain
   */
  static contains(str: string, sub: string): boolean {
    if (!str || !sub) {
      return false;
    }
    return str.indexOf(sub) !== -1;
  }

  /**
   * check whether by specified prefix open head
   * @param str - original string
   * @param prefix - prefix
   * @returns whether by specified prefix open head
   */
  static startsWith(str: string, prefix: string): boolean {
    if (!str || !prefix) {
      return false;
    }
    return str.indexOf(prefix) === 0;
  }

  /**
   * check whether by specified suffix result tail
   * @param str - original string
   * @param suffix - suffix
   * @returns whether by specified suffix result tail
   */
  static endsWith(str: string, suffix: string): boolean {
    if (!str || !suffix) {
      return false;
    }
    return str.indexOf(suffix, str.length - suffix.length) !== -1;
  }

  /**
   * statistics sub string occurrence count
   * @param str - original string
   * @param sub - sub string
   * @returns occurrence count
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

  /**
   * weight repeat string
   * @param str - original string
   * @param count - weight repeat times number
   * @returns repeated string
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
   * reverse string
   * @param str - original string
   * @returns reversed string
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
   * remove whitespace character symbol
   * @param str - original string
   * @returns string with whitespace removed
   */
  static removeWhitespace(str: string): string {
    if (!str) {
      return str;
    }
    return str.replace(/\s+/g, '');
  }

  /**
   * generate random string
   * @param length - length degree
   * @returns random string
   */
  static generateRandomString(length: number): string {
    let result: string = '';
    for (let i: number = 0; i < length; i++) {
      const idx: number = Math.floor(Math.random() * StringUtils.RANDOM_CHARS.length);
      result += StringUtils.RANDOM_CHARS.charAt(idx);
    }
    return result;
  }

  /**
   * generate random hex string
   * @param length - length degree
   * @returns random hex string
   */
  static generateHexString(length: number): string {
    let result: string = '';
    for (let i: number = 0; i < length; i++) {
      const idx: number = Math.floor(Math.random() * StringUtils.HEX_CHARS.length);
      result += StringUtils.HEX_CHARS.charAt(idx);
    }
    return result;
  }

  /**
   * calculate hash value
   * @param str - string
   * @returns ha hope value
   */
  static hashCode(str: string): number {
    if (!str || str.length === 0) {
      return 0;
    }
    let hash: number = 5381;
    for (let i: number = 0; i < str.length; i++) {
      hash = ((hash << 5) + hash) + str.charCodeAt(i);
      hash = hash & hash;
    }
    return Math.abs(hash);
  }

  /**
   * check whether for non empty string
   * @param str - string
   * @returns whether non empty
   */
  static isNotBlank(str: string | null | undefined): boolean {
    return str !== null && str !== undefined && str.trim().length > 0;
  }

  /**
   * check whether for empty or whitespace
   * @param str - string
   * @returns whether for empty
   */
  static isBlank(str: string | null | undefined): boolean {
    return !StringUtils.isNotBlank(str);
  }

  /**
   * safely get string length
   * @param str - string
   * @returns length degree
   */
  static safeLength(str: string | null | undefined): number {
    if (!str) {
      return 0;
    }
    return str.length;
  }

  /**
   * cut disconnect string
   * @param str - original string
   * @param maxLen - max length degree
   * @param suffix - suffix
   * @returns truncated string
   */
  static truncate(str: string, maxLen: number, suffix: string = '...'): string {
    if (!str || str.length <= maxLen) {
      return str;
    }
    return str.substring(0, maxLen - suffix.length) + suffix;
  }

  /**
   * pad string to specified length degree
   * @param str - original string
   * @param length - target length degree
   * @param char - pad character symbol
   * @param padLeft - whether at left side pad
   * @returns padded string
   */
  static pad(str: string, length: number, char: string = ' ', padLeft: boolean = true): string {
    if (!str || str.length >= length) {
      return str;
    }
    const padding: string = StringUtils.repeat(char, length - str.length);
    return padLeft ? padding + str : str + padding;
  }
}
