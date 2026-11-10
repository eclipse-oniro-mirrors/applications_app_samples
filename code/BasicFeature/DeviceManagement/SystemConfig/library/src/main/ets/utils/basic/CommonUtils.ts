/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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
// 重试配置接口
// ========================================

/**
 * 重试配置接口
 * 定义重试操作的可选配置参数
 */
export interface RetryConfig {
  /** 最大重试次数 */
  maxRetries: number;
  /** 重试间隔时间（毫秒） */
  delayMs: number;
  /** 是否使用指数退避策略 */
  exponentialBackoff: boolean;
}

// ========================================
// 通用工具类
// ========================================

/**
 * 通用工具类
 * 提供常用的静态工具方法，包括延时、ID生成、空值检查、深拷贝、重试机制等
 * 这些方法在应用的各个模块中都可以复用
 */
export class CommonUtils {
  /** UUID生成计数器 */
  private static idCounter: number = 0;

  /** 上次生成ID的时间戳 */
  private static lastTimestamp: number = 0;

  // ========================================
  // 延时方法
  // ========================================

  /**
   * 异步延时方法
   * 返回一个在指定毫秒数后解决的Promise
   * @param ms - 延时的毫秒数
   * @returns 延时完成后解决的Promise
   */
  static delay(ms: number): Promise<void> {
    return new Promise<void>((resolve: () => void): void => {
      setTimeout((): void => {
        resolve();
      }, ms);
    });
  }

  // ========================================
  // ID生成
  // ========================================

  /**
   * 生成唯一的类UUID标识符
   * 基于时间戳和随机数生成，格式类似UUID v4
   * @returns 类UUID格式的唯一标识符字符串
   */
  static generateId(): string {
    const timestamp: number = Date.now();
    CommonUtils.idCounter++;

    // 确保同一毫秒内的唯一性
    if (timestamp === CommonUtils.lastTimestamp) {
      CommonUtils.idCounter++;
    } else {
      CommonUtils.idCounter = 0;
      CommonUtils.lastTimestamp = timestamp;
    }

    const randomPart1: string = CommonUtils.generateHexSegment(8);
    const randomPart2: string = CommonUtils.generateHexSegment(4);
    const randomPart3: string = CommonUtils.generateHexSegment(4);
    const randomPart4: string = CommonUtils.generateHexSegment(12);
    const counterHex: string = CommonUtils.idCounter.toString(16).padStart(4, '0');

    return `${randomPart1}-${randomPart2}-${randomPart3}-${randomPart4}-${counterHex}${timestamp.toString(16)}`;
  }

  /**
   * 生成指定长度的十六进制字符串段
   * @param length - 要生成的十六进制字符串长度
   * @returns 随机十六进制字符串
   */
  private static generateHexSegment(length: number): string {
    let result: string = '';
    const hexChars: string = '0123456789abcdef';
    for (let i: number = 0; i < length; i++) {
      result += hexChars.charAt(Math.floor(Math.random() * 16));
    }
    return result;
  }

  // ========================================
  // 空值检查方法
  // ========================================

  /**
   * 检查字符串是否为空或仅包含空白字符
   * @param str - 要检查的字符串
   * @returns 如果字符串为空或仅含空白字符返回true
   */
  static isEmpty(str: string | null | undefined): boolean {
    if (str === null || str === undefined) {
      return true;
    }
    return str.trim().length === 0;
  }

  /**
   * 检查值是否为null或undefined
   * @param value - 要检查的值
   * @returns 如果值为null或undefined返回true
   */
  static isNullOrEmpty(value: string | null | undefined | object | unknown[]): boolean {
    if (value === null || value === undefined) {
      return true;
    }
    if (typeof value === 'string') {
      return value.trim().length === 0;
    }
    if (Array.isArray(value)) {
      return value.length === 0;
    }
    if (typeof value === 'object') {
      return Object.keys(value as object).length === 0;
    }
    return false;
  }

  /**
   * 检查字符串是否不为空且包含非空白字符
   * @param str - 要检查的字符串
   * @returns 如果字符串包含非空白字符返回true
   */
  static isNotEmpty(str: string | null | undefined): boolean {
    return !CommonUtils.isEmpty(str);
  }

  // ========================================
  // 深拷贝
  // ========================================

  /**
   * 深拷贝对象
   * 通过JSON序列化和反序列化实现深拷贝
   * 注意：不支持函数、undefined、Symbol、循环引用等
   * @param obj - 要深拷贝的对象
   * @returns 深拷贝后的新对象
   */
  static deepClone<T>(obj: T): T {
    if (obj === null || obj === undefined) {
      return obj;
    }
    try {
      const jsonStr: string = JSON.stringify(obj);
      return JSON.parse(jsonStr) as T;
    } catch (error) {
      hilog.error(DOMAIN, TAG, `深拷贝失败: ${error}`);
      return obj;
    }
  }

  // ========================================
  // 重试机制
  // ========================================

  /**
   * 带重试机制的异步操作执行器
   * 当操作失败时，会按照配置的重试策略自动重试
   * @param fn - 要执行的异步函数
   * @param maxRetries - 最大重试次数，默认为3
   * @param delayMs - 重试间隔毫秒数，默认为1000
   * @param exponentialBackoff - 是否使用指数退避，默认为true
   * @returns 函数执行结果的Promise
   */
  static async retry<T>(
    fn: () => Promise<T>,
    maxRetries: number = 3,
    delayMs: number = 1000,
    exponentialBackoff: boolean = true
  ): Promise<T> {
    let lastError: Error | null = null;

    for (let attempt: number = 0; attempt <= maxRetries; attempt++) {
      try {
        const result: T = await fn();
        if (attempt > 0) {
          hilog.info(DOMAIN, TAG, `重试第${attempt}次成功`);
        }
        return result;
      } catch (error) {
        lastError = error instanceof Error ? error : new Error(String(error));
        hilog.warn(DOMAIN, TAG, `操作失败，第${attempt + 1}次尝试: ${lastError.message}`);

        if (attempt < maxRetries) {
          const waitTime: number = exponentialBackoff
            ? delayMs * Math.pow(2, attempt)
            : delayMs;
          await CommonUtils.delay(waitTime);
        }
      }
    }

    throw lastError;
  }

  // ========================================
  // JSON解析
  // ========================================

  /**
   * 安全地解析JSON字符串
   * 解析失败时返回null而不是抛出异常
   * @param str - 要解析的JSON字符串
   * @returns 解析后的对象，解析失败返回null
   */
  static safeJsonParse(str: string | null | undefined): object | null {
    if (str === null || str === undefined || str.trim().length === 0) {
      return null;
    }
    try {
      return JSON.parse(str) as object;
    } catch (error) {
      hilog.warn(DOMAIN, TAG, `JSON解析失败: ${error}`);
      return null;
    }
  }

  /**
   * 安全地将对象序列化为JSON字符串
   * 序列化失败时返回null
   * @param obj - 要序列化的对象
   * @param pretty - 是否格式化输出，默认为false
   * @returns JSON字符串，序列化失败返回null
   */
  static safeJsonStringify(obj: object | null | undefined, pretty: boolean = false): string | null {
    if (obj === null || obj === undefined) {
      return null;
    }
    try {
      if (pretty) {
        return JSON.stringify(obj, null, 2);
      }
      return JSON.stringify(obj);
    } catch (error) {
      hilog.warn(DOMAIN, TAG, `JSON序列化失败: ${error}`);
      return null;
    }
  }

  // ========================================
  // 其他实用方法
  // ========================================

  /**
   * 获取当前时间戳（毫秒）
   * @returns 当前时间的毫秒时间戳
   */
  static getCurrentTimestamp(): number {
    return Date.now();
  }

  /**
   * 检查值是否在指定范围内（包含边界）
   * @param value - 要检查的数值
   * @param min - 最小值
   * @param max - 最大值
   * @returns 如果值在范围内返回true
   */
  static isInRange(value: number, min: number, max: number): boolean {
    return value >= min && value <= max;
  }

  /**
   * 将数值限制在指定范围内
   * @param value - 要限制的数值
   * @param min - 最小值
   * @param max - 最大值
   * @returns 限制范围后的数值
   */
  static clamp(value: number, min: number, max: number): number {
    return Math.min(Math.max(value, min), max);
  }
}
