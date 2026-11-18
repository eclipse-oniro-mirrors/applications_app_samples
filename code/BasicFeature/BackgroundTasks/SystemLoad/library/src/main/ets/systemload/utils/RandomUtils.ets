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
const TAG: string = 'RandomUtils';

/**
 * 随机数生成选项结构体
 * 用于配置随机数生成的参数
 */
export interface RandomOptions {
  /** 最小值（包含） */
  min?: number;
  /** 最大值（包含） */
  max?: number;
  /** 是否为整数 */
  integer?: boolean;
  /** 小数位数 */
  decimals?: number;
}

/**
 * 随机工具类
 * 提供各种随机数、随机字符串、随机选择等生成功能
 * 
 * @remarks
 * 该类为静态工具类，无需实例化
 * 支持多种随机数据类型生成
 * 
 * @example
 * ```typescript
 * // 生成随机整数
 * const num = RandomUtils.randomInt(1, 100);
 * 
 * // 生成随机字符串
 * const str = RandomUtils.randomString(16);
 * 
 * // 从数组随机选择
 * const item = RandomUtils.randomChoice([1, 2, 3, 4, 5]);
 * ```
 */
export class RandomUtils {
  /** 默认字符集：字母和数字 */
  public static readonly DEFAULT_CHARSET: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  /** 数字字符集 */
  public static readonly NUMERIC_CHARSET: string = '0123456789';
  /** 小写字母字符集 */
  public static readonly LOWERCASE_CHARSET: string = 'abcdefghijklmnopqrstuvwxyz';
  /** 大写字母字符集 */
  public static readonly UPPERCASE_CHARSET: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  /** 特殊字符集 */
  public static readonly SPECIAL_CHARSET: string = '!@#$%^&*()_+-=[]{}|;:,.<>?';
  /** 十六进制字符集 */
  public static readonly HEX_CHARSET: string = '0123456789ABCDEF';

  /**
   * 生成随机整数
   * 在指定范围内生成随机整数
   * 
   * @param min - 最小值（包含），默认0
   * @param max - 最大值（包含），默认100
   * @returns number 随机整数
   */
  static randomInt(min: number = 0, max: number = 100): number {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `randomInt() called with min: ${min}, max: ${max}`);
    // 计算随机整数
    const result = Math.floor(Math.random() * (max - min + 1)) + min;
    hilog.info(DOMAIN, TAG, `randomInt() result: ${result}`);
    return result;
  }

  /**
   * 生成随机浮点数
   * 在指定范围内生成随机浮点数
   * 
   * @param min - 最小值，默认0
   * @param max - 最大值，默认1
   * @param decimals - 小数位数，默认2
   * @returns number 随机浮点数
   */
  static randomFloat(min: number = 0, max: number = 1, decimals: number = 2): number {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `randomFloat() called with min: ${min}, max: ${max}, decimals: ${decimals}`);
    // 计算随机浮点数
    const random = Math.random() * (max - min) + min;
    // 保留指定小数位
    const factor = Math.pow(10, decimals);
    const result = Math.round(random * factor) / factor;
    hilog.info(DOMAIN, TAG, `randomFloat() result: ${result}`);
    return result;
  }

  /**
   * 生成随机布尔值
   * 随机返回true或false
   * 
   * @param probability - 返回true的概率（0-1），默认0.5
   * @returns boolean 随机布尔值
   */
  static randomBoolean(probability: number = 0.5): boolean {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `randomBoolean() called with probability: ${probability}`);
    // 生成随机布尔值
    const result = Math.random() < probability;
    hilog.info(DOMAIN, TAG, `randomBoolean() result: ${result}`);
    return result;
  }

  /**
   * 生成随机字符串
   * 使用指定字符集生成随机字符串
   * 
   * @param length - 字符串长度，默认16
   * @param charset - 字符集，默认为字母和数字
   * @returns string 随机字符串
   */
  static randomString(length: number = 16, charset: string = RandomUtils.DEFAULT_CHARSET): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `randomString() called with length: ${length}`);
    // 循环生成随机字符
    let result = '';
    for (let i = 0; i < length; i++) {
      const randomIndex = Math.floor(Math.random() * charset.length);
      result += charset.charAt(randomIndex);
    }
    hilog.info(DOMAIN, TAG, `randomString() generated ${length} characters`);
    return result;
  }

  /**
   * 生成随机数字字符串
   * 生成指定长度的纯数字字符串
   * 
   * @param length - 字符串长度，默认6
   * @returns string 随机数字字符串
   */
  static randomNumeric(length: number = 6): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `randomNumeric() called with length: ${length}`);
    // 使用数字字符集生成
    const result = RandomUtils.randomString(length, RandomUtils.NUMERIC_CHARSET);
    hilog.info(DOMAIN, TAG, `randomNumeric() generated ${length} digits`);
    return result;
  }

  /**
   * 生成随机十六进制字符串
   * 生成指定长度的十六进制字符串
   * 
   * @param length - 字符串长度，默认32
   * @returns string 随机十六进制字符串
   */
  static randomHex(length: number = 32): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `randomHex() called with length: ${length}`);
    // 使用十六进制字符集生成
    const result = RandomUtils.randomString(length, RandomUtils.HEX_CHARSET);
    hilog.info(DOMAIN, TAG, `randomHex() generated ${length} hex characters`);
    return result;
  }

  /**
   * 生成随机密码
   * 生成包含多种字符类型的强密码
   * 
   * @param length - 密码长度，默认16
   * @param includeSpecial - 是否包含特殊字符，默认true
   * @returns string 随机密码
   */
  static randomPassword(length: number = 16, includeSpecial: boolean = true): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `randomPassword() called with length: ${length}`);
    // 构建字符集
    let charset = RandomUtils.LOWERCASE_CHARSET + RandomUtils.UPPERCASE_CHARSET + RandomUtils.NUMERIC_CHARSET;
    if (includeSpecial) {
      charset += RandomUtils.SPECIAL_CHARSET;
    }
    // 确保至少包含各类字符
    let password = '';
    password += RandomUtils.randomString(1, RandomUtils.LOWERCASE_CHARSET);
    password += RandomUtils.randomString(1, RandomUtils.UPPERCASE_CHARSET);
    password += RandomUtils.randomString(1, RandomUtils.NUMERIC_CHARSET);
    if (includeSpecial) {
      password += RandomUtils.randomString(1, RandomUtils.SPECIAL_CHARSET);
    }
    // 填充剩余长度
    const remaining = length - password.length;
    password += RandomUtils.randomString(remaining, charset);
    // 打乱字符顺序
    password = RandomUtils.shuffleString(password);
    hilog.info(DOMAIN, TAG, `randomPassword() generated ${length} character password`);
    return password;
  }

  /**
   * 从数组中随机选择元素
   * 随机返回数组中的一个元素
   * 
   * @param array - 源数组
   * @returns T 随机选择的元素
   */
  static randomChoice<T>(array: T[]): T {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `randomChoice() called with array length: ${array.length}`);
    // 检查数组有效性
    if (!array || array.length === 0) {
      hilog.warn(DOMAIN, TAG, 'randomChoice() received empty array');
      throw new Error('Array cannot be empty');
    }
    // 随机选择
    const index = Math.floor(Math.random() * array.length);
    const result = array[index];
    hilog.info(DOMAIN, TAG, `randomChoice() selected index: ${index}`);
    return result;
  }

  /**
   * 从数组中随机选择多个元素
   * 不重复地随机选择指定数量的元素
   * 
   * @param array - 源数组
   * @param count - 选择数量
   * @returns T[] 随机选择的元素数组
   */
  static randomSample<T>(array: T[], count: number): T[] {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `randomSample() called with count: ${count}`);
    // 检查参数有效性
    if (!array || array.length === 0) {
      return [];
    }
    // 限制选择数量
    const actualCount = Math.min(count, array.length);
    // 复制并打乱数组
    const shuffled = [...array];
    RandomUtils.shuffleArray(shuffled);
    // 返回前N个元素
    const result = shuffled.slice(0, actualCount);
    hilog.info(DOMAIN, TAG, `randomSample() selected ${result.length} elements`);
    return result;
  }

  /**
   * 打乱数组顺序
   * 使用Fisher-Yates算法随机打乱数组
   * 
   * @param array - 待打乱的数组
   * @returns T[] 打乱后的数组（原数组被修改）
   */
  static shuffleArray<T>(array: T[]): T[] {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `shuffleArray() called with length: ${array.length}`);
    // Fisher-Yates洗牌算法
    for (let i: number = array.length - 1; i > 0; i--) {
      const j: number = Math.floor(Math.random() * (i + 1));
      // 使用临时变量交换元素（ArkTS不支持解构赋值）
      const temp: T = array[i];
      array[i] = array[j];
      array[j] = temp;
    }
    hilog.info(DOMAIN, TAG, 'shuffleArray() completed');
    return array;
  }

  /**
   * 打乱字符串顺序
   * 随机打乱字符串中字符的顺序
   * 
   * @param str - 待打乱的字符串
   * @returns string 打乱后的字符串
   */
  static shuffleString(str: string): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `shuffleString() called with length: ${str.length}`);
    // 转换为数组并打乱
    const arr = str.split('');
    RandomUtils.shuffleArray(arr);
    // 重新组合
    const result = arr.join('');
    hilog.info(DOMAIN, TAG, 'shuffleString() completed');
    return result;
  }

  /**
   * 生成随机颜色值
   * 生成随机的RGB颜色值
   * 
   * @returns string 十六进制颜色值（如：#FF5733）
   */
  static randomColor(): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'randomColor() called');
    // 生成随机RGB值
    const r = RandomUtils.randomInt(0, 255).toString(16).padStart(2, '0');
    const g = RandomUtils.randomInt(0, 255).toString(16).padStart(2, '0');
    const b = RandomUtils.randomInt(0, 255).toString(16).padStart(2, '0');
    const result = `#${r}${g}${b}`.toUpperCase();
    hilog.info(DOMAIN, TAG, `randomColor() result: ${result}`);
    return result;
  }

  /**
   * 生成随机日期
   * 在指定时间范围内生成随机日期
   * 
   * @param startDate - 起始日期，默认为1970-01-01
   * @param endDate - 结束日期，默认为当前日期
   * @returns Date 随机日期
   */
  static randomDate(startDate: Date = new Date(0), endDate: Date = new Date()): Date {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'randomDate() called');
    // 计算随机时间戳
    const start = startDate.getTime();
    const end = endDate.getTime();
    const randomTime = RandomUtils.randomInt(start, end);
    const result = new Date(randomTime);
    hilog.info(DOMAIN, TAG, `randomDate() result: ${result.toISOString()}`);
    return result;
  }

  /**
   * 生成随机UUID
   * 生成符合RFC4122标准的UUID
   * 
   * @returns string UUID字符串
   */
  static randomUUID(): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'randomUUID() called');
    // 生成UUID各部分
    const hex = RandomUtils.randomHex(32);
    const result = `${hex.substr(0, 8)}-${hex.substr(8, 4)}-4${hex.substr(13, 3)}-${
      (8 + parseInt(hex.substr(16, 1), 16) % 4).toString(16)}${hex.substr(17, 3)}-${hex.substr(20, 12)}`;
    hilog.info(DOMAIN, TAG, `randomUUID() result: ${result}`);
    return result;
  }

  /**
   * 生成随机IP地址
   * 生成随机的IPv4地址
   * 
   * @returns string IP地址字符串
   */
  static randomIpAddress(): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'randomIpAddress() called');
    // 生成四个随机段
    const result = `${RandomUtils.randomInt(1, 255)}.${RandomUtils.randomInt(0, 255)}.${
      RandomUtils.randomInt(0, 255)}.${RandomUtils.randomInt(1, 254)}`;
    hilog.info(DOMAIN, TAG, `randomIpAddress() result: ${result}`);
    return result;
  }

  /**
   * 生成随机手机号
   * 生成随机的中国大陆手机号
   * 
   * @returns string 手机号字符串
   */
  static randomPhoneNumber(): string {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, 'randomPhoneNumber() called');
    // 定义运营商号段
    const prefixes = ['130', '131', '132', '133', '134', '135', '136', '137', '138', '139',
      '150', '151', '152', '153', '155', '156', '157', '158', '159',
      '170', '171', '172', '173', '175', '176', '177', '178',
      '180', '181', '182', '183', '184', '185', '186', '187', '188', '189'];
    // 随机选择号段并生成剩余数字
    const prefix = RandomUtils.randomChoice(prefixes);
    const suffix = RandomUtils.randomNumeric(8);
    const result = prefix + suffix;
    hilog.info(DOMAIN, TAG, `randomPhoneNumber() result: ${result}`);
    return result;
  }

  /**
   * 加权随机选择
   * 根据权重随机选择数组中的元素
   * 
   * @param items - 待选择的元素数组
   * @param weights - 对应的权重数组
   * @returns T 随机选择的元素
   */
  static weightedRandom<T>(items: T[], weights: number[]): T {
    // 记录方法调用日志
    hilog.debug(DOMAIN, TAG, `weightedRandom() called with ${items.length} items`);
    // 检查参数有效性
    if (!items || items.length === 0 || !weights || weights.length !== items.length) {
      throw new Error('Invalid items or weights');
    }
    // 计算权重总和
    const totalWeight = weights.reduce((sum, w) => sum + w, 0);
    // 生成随机值
    let random = Math.random() * totalWeight;
    // 根据权重选择
    for (let i = 0; i < items.length; i++) {
      random -= weights[i];
      if (random <= 0) {
        hilog.info(DOMAIN, TAG, `weightedRandom() selected index: ${i}`);
        return items[i];
      }
    }
    // 返回最后一个元素作为兜底
    return items[items.length - 1];
  }
}
