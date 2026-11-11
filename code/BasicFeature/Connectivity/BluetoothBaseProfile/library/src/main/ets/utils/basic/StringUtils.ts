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
 * 命名风格枚举
 */
export enum NamingStyle {
  CAMEL_CASE = 'camelCase',
  SNAKE_CASE = 'snake_case',
  KEBAB_CASE = 'kebab-case',
  PASCAL_CASE = 'PascalCase',
}

/**
 * 字符串工具类
 * 提供丰富的字符串处理静态方法
 */
export class StringUtils {
  private static readonly RANDOM_CHARS: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  private static readonly HEX_CHARS: string = '0123456789abcdef';

  /**
   * 首字母大写
   * @param str - 原始字符串
   * @returns 首字母大写后的字符串
   */
  static capitalize(str: string): string {
    if (!str || str.length === 0) return str;
    return str.charAt(0).toUpperCase() + str.slice(1);
  }

  /**
   * 首字母小写
   * @param str - 原始字符串
   * @returns 首字母小写后的字符串
   */
  static uncapitalize(str: string): string {
    if (!str || str.length === 0) return str;
    return str.charAt(0).toLowerCase() + str.slice(1);
  }

  /**
   * 转换为驼峰命名
   * @param str - 原始字符串
   * @returns 驼峰命名格式
   */
  static toCamelCase(str: string): string {
    if (!str || str.length === 0) return str;
    const words: string[] = StringUtils.splitWords(str);
    if (words.length === 0) return str;
    let result: string = words[0].toLowerCase();
    for (let i: number = 1; i < words.length; i++) {
      result += StringUtils.capitalize(words[i].toLowerCase());
    }
    return result;
  }

  /**
   * 转换为蛇形命名
   * @param str - 原始字符串
   * @returns 蛇形命名格式
   */
  static toSnakeCase(str: string): string {
    if (!str || str.length === 0) return str;
    const words: string[] = StringUtils.splitWords(str);
    return words.map((w: string): string => w.toLowerCase()).join('_');
  }

  /**
   * 转换为短横线命名
   * @param str - 原始字符串
   * @returns 短横线命名格式
   */
  static toKebabCase(str: string): string {
    if (!str || str.length === 0) return str;
    const words: string[] = StringUtils.splitWords(str);
    return words.map((w: string): string => w.toLowerCase()).join('-');
  }

  /**
   * 拆分为单词数组
   * @param str - 原始字符串
   * @returns 单词数组
   */
  private static splitWords(str: string): string[] {
    const parts: string[] = str.replace(/([a-z])([A-Z])/g, '$1 $2')
      .replace(/[_\-\s]+/g, ' ')
      .trim()
      .split(' ');
    return parts.filter((p: string): boolean => p.length > 0);
  }

  /**
   * 检查是否包含子串
   * @param str - 原始字符串
   * @param sub - 子串
   * @returns 是否包含
   */
  static contains(str: string, sub: string): boolean {
    if (!str || !sub) return false;
    return str.indexOf(sub) !== -1;
  }

  /**
   * 检查是否以指定前缀开头
   * @param str - 原始字符串
   * @param prefix - 前缀
   * @returns 是否以指定前缀开头
   */
  static startsWith(str: string, prefix: string): boolean {
    if (!str || !prefix) return false;
    return str.indexOf(prefix) === 0;
  }

  /**
   * 检查是否以指定后缀结尾
   * @param str - 原始字符串
   * @param suffix - 后缀
   * @returns 是否以指定后缀结尾
   */
  static endsWith(str: string, suffix: string): boolean {
    if (!str || !suffix) return false;
    return str.indexOf(suffix, str.length - suffix.length) !== -1;
  }

  /**
   * 统计子串出现次数
   * @param str - 原始字符串
   * @param sub - 子串
   * @returns 出现次数
   */
  static countOccurrences(str: string, sub: string): number {
    if (!str || !sub || sub.length === 0) return 0;
    let count: number = 0;
    let pos: number = 0;
    while (true) {
      const index: number = str.indexOf(sub, pos);
      if (index === -1) break;
      count++;
      pos = index + 1;
    }
    return count;
  }

  /**
   * 重复字符串
   * @param str - 原始字符串
   * @param count - 重复次数
   * @returns 重复后的字符串
   */
  static repeat(str: string, count: number): string {
    if (count <= 0 || !str) return '';
    let result: string = '';
    for (let i: number = 0; i < count; i++) {
      result += str;
    }
    return result;
  }

  /**
   * 反转字符串
   * @param str - 原始字符串
   * @returns 反转后的字符串
   */
  static reverse(str: string): string {
    if (!str) return str;
    let result: string = '';
    for (let i: number = str.length - 1; i >= 0; i--) {
      result += str.charAt(i);
    }
    return result;
  }

  /**
   * 移除空白字符
   * @param str - 原始字符串
   * @returns 移除空白后的字符串
   */
  static removeWhitespace(str: string): string {
    if (!str) return str;
    return str.replace(/\s+/g, '');
  }

  /**
   * 生成随机字符串
   * @param length - 长度
   * @returns 随机字符串
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
   * 生成随机十六进制字符串
   * @param length - 长度
   * @returns 随机十六进制字符串
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
   * 计算哈希值
   * @param str - 字符串
   * @returns 哈希值
   */
  static hashCode(str: string): number {
    if (!str || str.length === 0) return 0;
    let hash: number = 5381;
    for (let i: number = 0; i < str.length; i++) {
      hash = ((hash << 5) + hash) + str.charCodeAt(i);
      hash = hash & hash;
    }
    return Math.abs(hash);
  }

  /**
   * 检查是否为非空字符串
   * @param str - 字符串
   * @returns 是否非空
   */
  static isNotBlank(str: string | null | undefined): boolean {
    return str !== null && str !== undefined && str.trim().length > 0;
  }

  /**
   * 检查是否为空或空白
   * @param str - 字符串
   * @returns 是否为空
   */
  static isBlank(str: string | null | undefined): boolean {
    return !StringUtils.isNotBlank(str);
  }

  /**
   * 安全获取字符串长度
   * @param str - 字符串
   * @returns 长度
   */
  static safeLength(str: string | null | undefined): number {
    if (!str) return 0;
    return str.length;
  }

  /**
   * 截断字符串
   * @param str - 原始字符串
   * @param maxLen - 最大长度
   * @param suffix - 后缀
   * @returns 截断后的字符串
   */
  static truncate(str: string, maxLen: number, suffix: string = '...'): string {
    if (!str || str.length <= maxLen) return str;
    return str.substring(0, maxLen - suffix.length) + suffix;
  }

  /**
   * 填充字符串到指定长度
   * @param str - 原始字符串
   * @param length - 目标长度
   * @param char - 填充字符
   * @param padLeft - 是否在左侧填充
   * @returns 填充后的字符串
   */
  static pad(str: string, length: number, char: string = ' ', padLeft: boolean = true): string {
    if (!str || str.length >= length) return str;
    const padding: string = StringUtils.repeat(char, length - str.length);
    return padLeft ? padding + str : str + padding;
  }
}
