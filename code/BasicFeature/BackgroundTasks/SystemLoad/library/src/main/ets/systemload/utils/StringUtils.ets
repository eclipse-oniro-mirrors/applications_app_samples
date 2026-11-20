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

/** 日志域ID */
const DOMAIN: number = 0xF811;
/** 日志标签 */
const TAG: string = 'StringUtils';

/**
 * 字符串工具类
 * 提供常用的字符串操作方法，包括判空、截断、格式化等功能
 * 
 * @remarks
 * 该类为静态工具类，无需实例化
 * 所有方法均为静态方法，可直接通过类名调用
 * 
 * @example
 * ```typescript
 * // 判断字符串是否为空
 * const isEmpty = StringUtils.isEmpty('');  // true
 * 
 * // 截断字符串
 * const truncated = StringUtils.truncate('Hello World', 5);  // 'Hello...'
 * ```
 */
export class StringUtils {
  /**
   * 判断字符串是否为空
   * 检查字符串是否为null、undefined或空字符串
   * 
   * @param str - 待检查的字符串
   * @returns boolean 如果字符串为空返回true，否则返回false
   */
  static isEmpty(str: string | null | undefined): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'isEmpty() called');
    // 判断字符串是否为空
    return str === null || str === undefined || str.length === 0;
  }

  /**
   * 判断字符串是否为空白
   * 检查字符串是否为null、undefined或仅包含空白字符
   * 
   * @param str - 待检查的字符串
   * @returns boolean 如果字符串为空白返回true，否则返回false
   */
  static isBlank(str: string | null | undefined): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'isBlank() called');
    // 判断字符串是否为空白
    return str === null || str === undefined || str.trim().length === 0;
  }

  /**
   * 截断字符串
   * 当字符串长度超过指定长度时，截断并添加省略号
   * 
   * @param str - 待截断的字符串
   * @param maxLength - 最大长度限制
   * @param suffix - 截断后添加的后缀，默认为'...'
   * @returns string 截断后的字符串
   */
  static truncate(str: string, maxLength: number, suffix: string = '...'): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `truncate() called with maxLength: ${maxLength}`);
    // 检查字符串是否为空
    if (StringUtils.isEmpty(str)) {
      return '';
    }
    // 检查是否需要截断
    if (str!.length <= maxLength) {
      return str!;
    }
    // 执行截断操作
    return str!.substring(0, maxLength) + suffix;
  }

  /**
   * 首字母大写
   * 将字符串的第一个字符转换为大写
   * 
   * @param str - 待转换的字符串
   * @returns string 首字母大写后的字符串
   */
  static capitalize(str: string): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'capitalize() called');
    // 检查字符串是否为空
    if (StringUtils.isEmpty(str)) {
      return '';
    }
    // 首字母大写，其余保持不变
    return str!.charAt(0).toUpperCase() + str!.slice(1);
  }

  /**
   * 首字母小写
   * 将字符串的第一个字符转换为小写
   * 
   * @param str - 待转换的字符串
   * @returns string 首字母小写后的字符串
   */
  static uncapitalize(str: string): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'uncapitalize() called');
    // 检查字符串是否为空
    if (StringUtils.isEmpty(str)) {
      return '';
    }
    // 首字母小写，其余保持不变
    return str!.charAt(0).toLowerCase() + str!.slice(1);
  }

  /**
   * 反转字符串
   * 将字符串中的字符顺序颠倒
   * 
   * @param str - 待反转的字符串
   * @returns string 反转后的字符串
   */
  static reverse(str: string): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'reverse() called');
    // 检查字符串是否为空
    if (StringUtils.isEmpty(str)) {
      return '';
    }
    // 反转字符串
    return str!.split('').reverse().join('');
  }

  /**
   * 统计子串出现次数
   * 计算指定子串在原字符串中出现的次数
   * 
   * @param str - 原字符串
   * @param subStr - 待统计的子串
   * @returns number 子串出现的次数
   */
  static countOccurrences(str: string, subStr: string): number {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'countOccurrences() called');
    // 检查参数有效性
    if (StringUtils.isEmpty(str) || StringUtils.isEmpty(subStr)) {
      return 0;
    }
    // 统计出现次数
    let count = 0;
    let pos = str!.indexOf(subStr);
    while (pos !== -1) {
      count++;
      pos = str!.indexOf(subStr, pos + subStr.length);
    }
    return count;
  }

  /**
   * 生成固定长度的随机字符串
   * 使用指定字符集生成随机字符串
   * 
   * @param length - 字符串长度，默16
   * @param charset - 字符集，默认为字母和数字
   * @returns string 随机生成的字符串
   */
  static random(length: number = 16, charset?: string): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `random() called with length: ${length}`);
    // 设置默认字符集
    const chars = charset || 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let result = '';
    // 循环生成随机字符
    for (let i = 0; i < length; i++) {
      result += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return result;
  }

  /**
   * 去除字符串两端空白
   * 移除字符串开头和结尾的空白字符
   * 
   * @param str - 待处理的字符串
   * @returns string 处理后的字符串
   */
  static trim(str: string): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'trim() called');
    // 检查字符串是否为空
    if (StringUtils.isEmpty(str)) {
      return '';
    }
    // 去除两端空白
    return str!.trim();
  }

  /**
   * 字符串转驼峰命名
   * 将下划线或中划线分隔的字符串转换为驼峰命名
   * 
   * @param str - 待转换的字符串
   * @returns string 驼峰命名格式的字符串
   */
  static toCamelCase(str: string): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'toCamelCase() called');
    // 检查字符串是否为空
    if (StringUtils.isEmpty(str)) {
      return '';
    }
    // 转换驼峰命名
    return str!.replace(/[-_](.)/g, (_match: string, char: string) => char.toUpperCase());
  }

  /**
   * 驼峰命名转下划线
   * 将驼峰命名格式的字符串转换为下划线分隔
   * 
   * @param str - 待转换的字符串
   * @returns string 下划线格式的字符串
   */
  static toUnderScore(str: string): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'toUnderScore() called');
    // 检查字符串是否为空
    if (StringUtils.isEmpty(str)) {
      return '';
    }
    // 转换为下划线格式
    return str!.replace(/[A-Z]/g, (match: string, offset: number) => {
      return (offset > 0 ? '_' : '') + match.toLowerCase();
    });
  }

  /**
   * 检查字符串是否包含子串
   * 判断字符串中是否包含指定的子串
   * 
   * @param str - 原字符串
   * @param subStr - 待检查的子串
   * @returns boolean 包含返回true，否则返回false
   */
  static contains(str: string, subStr: string): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'contains() called');
    // 检查参数有效性
    if (StringUtils.isEmpty(str) || StringUtils.isEmpty(subStr)) {
      return false;
    }
    // 检查是否包含
    return str!.includes(subStr);
  }

  /**
   * 左填充字符串
   * 在字符串左侧填充指定字符至目标长度
   * 
   * @param str - 原字符串
   * @param length - 目标长度
   * @param padChar - 填充字符，默认为'0'
   * @returns string 填充后的字符串
   */
  static padLeft(str: string, length: number, padChar: string = '0'): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `padLeft() called with length: ${length}`);
    // 检查字符串是否为空
    if (StringUtils.isEmpty(str)) {
      str = '';
    }
    // 循环填充
    let result = str!;
    while (result.length < length) {
      result = padChar + result;
    }
    return result;
  }

  /**
   * 右填充字符串
   * 在字符串右侧填充指定字符至目标长度
   * 
   * @param str - 原字符串
   * @param length - 目标长度
   * @param padChar - 填充字符，默认为空格
   * @returns string 填充后的字符串
   */
  static padRight(str: string, length: number, padChar: string = ' '): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `padRight() called with length: ${length}`);
    // 检查字符串是否为空
    if (StringUtils.isEmpty(str)) {
      str = '';
    }
    // 循环填充
    let result = str!;
    while (result.length < length) {
      result = result + padChar;
    }
    return result;
  }
}
