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
// 命名风格枚举
// ========================================

/**
 * 命名风格枚举
 * 定义字符串转换的目标命名风格
 */
export enum NamingStyle {
  /** 驼峰命名法 */
  CAMEL_CASE = 'camelCase',
  /** 蛇形命名法 */
  SNAKE_CASE = 'snake_case',
  /** 短横线命名法 */
  KEBAB_CASE = 'kebab-case',
  /** 帕斯卡命名法 */
  PASCAL_CASE = 'PascalCase',
}

// ========================================
// 字符串工具类
// ========================================

/**
 * 字符串工具类
 * 提供丰富的字符串处理静态方法，包括大小写转换、命名风格转换、
 * 字符串查找、生成随机字符串、哈希计算等实用功能
 */
export class StringUtils {
  /** 随机字符串字符集 */
  private static readonly RANDOM_CHARS: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

  /** 十六进制字符集 */
  private static readonly HEX_CHARS: string = '0123456789abcdef';

  // ========================================
  // 大小写转换方法
  // ========================================

  /**
   * 将字符串首字母大写
   * @param str - 原始字符串
   * @returns 首字母大写后的字符串
   */
  static capitalize(str: string): string {
    if (!str || str.length === 0) {
      return str;
    }
    return str.charAt(0).toUpperCase() + str.slice(1);
  }

  /**
   * 将字符串首字母小写
   * @param str - 原始字符串
   * @returns 首字母小写后的字符串
   */
  static uncapitalize(str: string): string {
    if (!str || str.length === 0) {
      return str;
    }
    return str.charAt(0).toLowerCase() + str.slice(1);
  }

  /**
   * 将字符串全部转为大写
   * @param str - 原始字符串
   * @returns 大写字符串
   */
  static toUpperCase(str: string): string {
    return str.toUpperCase();
  }

  /**
   * 将字符串全部转为小写
   * @param str - 原始字符串
   * @returns 小写字符串
   */
  static toLowerCase(str: string): string {
    return str.toLowerCase();
  }

  // ========================================
  // 命名风格转换方法
  // ========================================

  /**
   * 将字符串转换为驼峰命名格式
   * 支持从蛇形、短横线、空格分隔等多种格式转换
   * @param str - 原始字符串
   * @returns 驼峰命名格式的字符串
   */
  static toCamelCase(str: string): string {
    if (!str || str.length === 0) {
      return str;
    }

    // 先按常见分隔符拆分
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
   * 将字符串转换为蛇形命名格式
   * @param str - 原始字符串
   * @returns 蛇形命名格式的字符串（小写字母加下划线）
   */
  static toSnakeCase(str: string): string {
    if (!str || str.length === 0) {
      return str;
    }

    const words: string[] = StringUtils.splitWords(str);
    return words.map((word: string): string => word.toLowerCase()).join('_');
  }

  /**
   * 将字符串转换为短横线命名格式
   * @param str - 原始字符串
   * @returns 短横线命名格式的字符串
   */
  static toKebabCase(str: string): string {
    if (!str || str.length === 0) {
      return str;
    }

    const words: string[] = StringUtils.splitWords(str);
    return words.map((word: string): string => word.toLowerCase()).join('-');
  }

  /**
   * 将字符串转换为帕斯卡命名格式
   * @param str - 原始字符串
   * @returns 帕斯卡命名格式的字符串（每个单词首字母大写）
   */
  static toPascalCase(str: string): string {
    if (!str || str.length === 0) {
      return str;
    }

    const words: string[] = StringUtils.splitWords(str);
    return words.map((word: string): string => StringUtils.capitalize(word.toLowerCase())).join('');
  }

  /**
   * 将字符串拆分为单词数组
   * 处理驼峰、蛇形、短横线、空格等多种分隔方式
   * @param str - 原始字符串
   * @returns 拆分后的单词数组
   */
  private static splitWords(str: string): string[] {
    // 先按非字母数字字符拆分
    const parts: string[] = str.replace(/([a-z])([A-Z])/g, '$1 $2')
      .replace(/[_\-\s]+/g, ' ')
      .trim()
      .split(' ');
    return parts.filter((part: string): boolean => part.length > 0);
  }

  // ========================================
  // 字符串查找方法
  // ========================================

  /**
   * 检查字符串是否包含指定子串
   * @param str - 原始字符串
   * @param sub - 要查找的子串
   * @returns 如果包含返回true
   */
  static contains(str: string, sub: string): boolean {
    if (!str || !sub) {
      return false;
    }
    return str.indexOf(sub) !== -1;
  }

  /**
   * 检查字符串是否以指定前缀开头
   * @param str - 原始字符串
   * @param prefix - 要检查的前缀
   * @returns 如果以指定前缀开头返回true
   */
  static startsWith(str: string, prefix: string): boolean {
    if (!str || !prefix) {
      return false;
    }
    return str.indexOf(prefix) === 0;
  }

  /**
   * 检查字符串是否以指定后缀结尾
   * @param str - 原始字符串
   * @param suffix - 要检查的后缀
   * @returns 如果以指定后缀结尾返回true
   */
  static endsWith(str: string, suffix: string): boolean {
    if (!str || !suffix) {
      return false;
    }
    return str.indexOf(suffix, str.length - suffix.length) !== -1;
  }

  /**
   * 统计子串在字符串中出现的次数
   * @param str - 原始字符串
   * @param sub - 要统计的子串
   * @returns 子串出现的次数
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
  // 字符串操作方法
  // ========================================

  /**
   * 重复字符串指定次数
   * @param str - 原始字符串
   * @param count - 重复次数
   * @returns 重复后的字符串
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
   * 反转字符串
   * @param str - 原始字符串
   * @returns 反转后的字符串
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
   * 移除字符串中的所有空白字符
   * @param str - 原始字符串
   * @returns 移除空白后的字符串
   */
  static removeWhitespace(str: string): string {
    if (!str) {
      return str;
    }
    return str.replace(/\s+/g, '');
  }

  /**
   * 去除字符串两端的指定字符
   * @param str - 原始字符串
   * @param chars - 要去除的字符集合
   * @returns 处理后的字符串
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
   * 截取字符串到指定最大长度
   * @param str - 原始字符串
   * @param maxLen - 最大长度
   * @param suffix - 截断后的后缀，默认为空
   * @returns 截取后的字符串
   */
  static substring(str: string, maxLen: number, suffix: string = ''): string {
    if (!str || str.length <= maxLen) {
      return str;
    }
    return str.substring(0, maxLen) + suffix;
  }

  // ========================================
  // 随机字符串生成
  // ========================================

  /**
   * 生成指定长度的随机字符串
   * 包含大小写字母和数字
   * @param length - 要生成的字符串长度
   * @returns 随机字符串
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
   * 生成指定长度的随机十六进制字符串
   * @param length - 要生成的字符串长度
   * @returns 随机十六进制字符串
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
  // 哈希计算
  // ========================================

  /**
   * 计算字符串的哈希值
   * 使用DJB2哈希算法
   * @param str - 要计算哈希值的字符串
   * @returns 32位整数哈希值
   */
  static hashCode(str: string): number {
    if (!str || str.length === 0) {
      return 0;
    }
    let hash: number = 5381;
    for (let i: number = 0; i < str.length; i++) {
      const charCode: number = str.charCodeAt(i);
      hash = ((hash << 5) + hash) + charCode;
      hash = hash & hash; // 转换为32位整数
    }
    return Math.abs(hash);
  }

  /**
   * 计算字符串的简单校验和
   * @param str - 要计算校验和的字符串
   * @returns 校验和数值
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
  // 辅助方法
  // ========================================

  /**
   * 检查字符串是否为有效的非空字符串
   * @param str - 要检查的字符串
   * @returns 如果字符串非空且不仅包含空白字符返回true
   */
  static isNotBlank(str: string | null | undefined): boolean {
    return str !== null && str !== undefined && str.trim().length > 0;
  }

  /**
   * 检查字符串是否为空白或空
   * @param str - 要检查的字符串
   * @returns 如果字符串为空或仅含空白字符返回true
   */
  static isBlank(str: string | null | undefined): boolean {
    return !StringUtils.isNotBlank(str);
  }

  /**
   * 安全地获取字符串长度
   * @param str - 字符串
   * @returns 字符串长度，null或undefined返回0
   */
  static safeLength(str: string | null | undefined): number {
    if (!str) {
      return 0;
    }
    return str.length;
  }
}
