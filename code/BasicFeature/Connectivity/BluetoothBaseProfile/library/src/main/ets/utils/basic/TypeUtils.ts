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
 * 类型工具类
 * 提供类型检查和转换相关的实用方法
 */
export class TypeUtils {
  /**
   * 检查值是否为字符串类型
   * @param value - 要检查的值
   * @returns 是否为字符串
   */
  static isString(value: unknown): boolean {
    return typeof value === 'string';
  }

  /**
   * 检查值是否为数字类型
   * @param value - 要检查的值
   * @returns 是否为数字
   */
  static isNumber(value: unknown): boolean {
    return typeof value === 'number' && !isNaN(value);
  }

  /**
   * 检查值是否为布尔类型
   * @param value - 要检查的值
   * @returns 是否为布尔
   */
  static isBoolean(value: unknown): boolean {
    return typeof value === 'boolean';
  }

  /**
   * 检查值是否为数组
   * @param value - 要检查的值
   * @returns 是否为数组
   */
  static isArray(value: unknown): boolean {
    return Array.isArray(value);
  }

  /**
   * 检查值是否为对象
   * @param value - 要检查的值
   * @returns 是否为对象
   */
  static isObject(value: unknown): boolean {
    return value !== null && typeof value === 'object' && !Array.isArray(value);
  }

  /**
   * 检查值是否为函数
   * @param value - 要检查的值
   * @returns 是否为函数
   */
  static isFunction(value: unknown): boolean {
    return typeof value === 'function';
  }

  /**
   * 检查值是否为null或undefined
   * @param value - 要检查的值
   * @returns 是否为null或undefined
   */
  static isNullOrUndefined(value: unknown): boolean {
    return value === null || value === undefined;
  }

  /**
   * 检查值是否为空（null、undefined、空字符串、空数组、空对象）
   * @param value - 要检查的值
   * @returns 是否为空
   */
  static isEmpty(value: unknown): boolean {
    if (value === null || value === undefined) {
      return true;
    }
    if (typeof value === 'string') {
      return value.length === 0;
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
   * 安全地将字符串转换为数字
   * @param value - 要转换的字符串
   * @param defaultValue - 转换失败时的默认值
   * @returns 转换后的数字
   */
  static toNumber(value: string, defaultValue: number = 0): number {
    const num: number = Number(value);
    return isNaN(num) ? defaultValue : num;
  }

  /**
   * 安全地将值转换为布尔值
   * @param value - 要转换的值
   * @returns 布尔值
   */
  static toBoolean(value: unknown): boolean {
    if (typeof value === 'boolean') {
      return value;
    }
    if (typeof value === 'string') {
      const lower: string = value.toLowerCase();
      return lower === 'true' || lower === '1' || lower === 'yes';
    }
    if (typeof value === 'number') {
      return value !== 0;
    }
    return false;
  }

  /**
   * 安全地将值转换为字符串
   * @param value - 要转换的值
   * @param defaultValue - 转换失败时的默认值
   * @returns 字符串
   */
  static toString(value: unknown, defaultValue: string = ''): string {
    if (value === null || value === undefined) {
      return defaultValue;
    }
    if (typeof value === 'string') {
      return value;
    }
    return String(value);
  }

  /**
   * 深拷贝对象
   * @param obj - 要拷贝的对象
   * @returns 拷贝后的新对象
   */
  static deepClone<T>(obj: T): T {
    if (obj === null || typeof obj !== 'object') {
      return obj;
    }
    try {
      return JSON.parse(JSON.stringify(obj));
    } catch (e) {
      return obj;
    }
  }

  /**
   * 检查两个对象是否深度相等
   * @param a - 第一个对象
   * @param b - 第二个对象
   * @returns 是否深度相等
   */
  static deepEquals(a: unknown, b: unknown): boolean {
    if (a === b) {
      return true;
    }
    if (a === null || b === null) {
      return false;
    }
    if (typeof a !== typeof b) {
      return false;
    }
    if (typeof a !== 'object') {
      return a === b;
    }
    const objA: Record<string, unknown> = a as Record<string, unknown>;
    const objB: Record<string, unknown> = b as Record<string, unknown>;
    const keysA: string[] = Object.keys(objA);
    const keysB: string[] = Object.keys(objB);
    if (keysA.length !== keysB.length) {
      return false;
    }
    for (const key of keysA) {
      if (!TypeUtils.deepEquals(objA[key], objB[key])) {
        return false;
      }
    }
    return true;
  }

  /**
   * 获取值的类型名称
   * @param value - 要检查的值
   * @returns 类型名称
   */
  static getTypeName(value: unknown): string {
    if (value === null) {
      return 'null';
    }
    if (value === undefined) {
      return 'undefined';
    }
    if (Array.isArray(value)) {
      return 'array';
    }
    return typeof value;
  }

  /**
   * 安全地解析JSON字符串
   * @param json - JSON字符串
   * @param defaultValue - 解析失败时的默认值
   * @returns 解析后的对象
   */
  static safeParseJson<T>(json: string, defaultValue: T): T {
    try {
      return JSON.parse(json) as T;
    } catch (e) {
      return defaultValue;
    }
  }
}
