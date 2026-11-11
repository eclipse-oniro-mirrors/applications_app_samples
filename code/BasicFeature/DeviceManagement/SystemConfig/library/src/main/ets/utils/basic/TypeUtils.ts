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
// 类型名称常量
// ========================================

/** 字符串类型名称 */
const TYPE_STRING: string = 'string';
/** 数字类型名称 */
const TYPE_NUMBER: string = 'number';
/** 布尔类型名称 */
const TYPE_BOOLEAN: string = 'boolean';
/** 对象类型名称 */
const TYPE_OBJECT: string = 'object';
/** 未定义类型名称 */
const TYPE_UNDEFINED: string = 'undefined';
/** 空类型名称 */
const TYPE_NULL: string = 'null';
/** 数组类型名称 */
const TYPE_ARRAY: string = 'array';
/** 函数类型名称 */
const TYPE_FUNCTION: string = 'function';
/** 符号类型名称 */
const TYPE_SYMBOL: string = 'symbol';

// ========================================
// 类型工具类
// ========================================

/**
 * 类型工具类
 * 提供全面的类型检查和类型转换静态方法
 * 包括基本类型判断、空值检查、类型安全转换等功能
 * 所有方法都经过严格的空值和边界检查
 */
export class TypeUtils {
  // ========================================
  // 基本类型检查方法
  // ========================================

  /**
   * 检查值是否为字符串类型
   * @param value - 要检查的值
   * @returns 如果值为字符串类型返回true
   */
  static isString(value: unknown): boolean {
    return typeof value === TYPE_STRING;
  }

  /**
   * 检查值是否为数字类型（排除NaN）
   * @param value - 要检查的值
   * @returns 如果值为有效数字类型返回true
   */
  static isNumber(value: unknown): boolean {
    return typeof value === TYPE_NUMBER && !isNaN(value as number);
  }

  /**
   * 检查值是否为布尔类型
   * @param value - 要检查的值
   * @returns 如果值为布尔类型返回true
   */
  static isBoolean(value: unknown): boolean {
    return typeof value === TYPE_BOOLEAN;
  }

  /**
   * 检查值是否为对象类型（排除null和数组）
   * @param value - 要检查的值
   * @returns 如果值为普通对象类型返回true
   */
  static isObject(value: unknown): boolean {
    return typeof value === TYPE_OBJECT && value !== null && !Array.isArray(value);
  }

  /**
   * 检查值是否为数组类型
   * @param value - 要检查的值
   * @returns 如果值为数组类型返回true
   */
  static isArray(value: unknown): boolean {
    return Array.isArray(value);
  }

  /**
   * 检查值是否为null
   * @param value - 要检查的值
   * @returns 如果值为null返回true
   */
  static isNull(value: unknown): boolean {
    return value === null;
  }

  /**
   * 检查值是否为undefined
   * @param value - 要检查的值
   * @returns 如果值为undefined返回true
   */
  static isUndefined(value: unknown): boolean {
    return value === undefined;
  }

  /**
   * 检查值是否为函数类型
   * @param value - 要检查的值
   * @returns 如果值为函数类型返回true
   */
  static isFunction(value: unknown): boolean {
    return typeof value === TYPE_FUNCTION;
  }

  /**
   * 检查值是否为Symbol类型
   * @param value - 要检查的值
   * @returns 如果值为Symbol类型返回true
   */
  static isSymbol(value: unknown): boolean {
    return typeof value === TYPE_SYMBOL;
  }

  // ========================================
  // 空值检查方法
  // ========================================

  /**
   * 检查值是否为空（null、undefined或空字符串）
   * @param value - 要检查的值
   * @returns 如果值为空返回true
   */
  static isEmpty(value: string | null | undefined): boolean {
    return value === null || value === undefined || value === '';
  }

  /**
   * 检查字符串是否为空白（null、undefined、空字符串或仅含空白字符）
   * @param value - 要检查的字符串
   * @returns 如果字符串为空白返回true
   */
  static isBlank(value: string | null | undefined): boolean {
    if (value === null || value === undefined) {
      return true;
    }
    return value.trim().length === 0;
  }

  /**
   * 检查对象是否为空（null、undefined或没有自有属性）
   * @param value - 要检查的对象
   * @returns 如果对象为空返回true
   */
  static isEmptyObject(value: object | null | undefined): boolean {
    if (value === null || value === undefined) {
      return true;
    }
    return Object.keys(value).length === 0;
  }

  /**
   * 检查数组是否为空（null、undefined或长度为0）
   * @param value - 要检查的数组
   * @returns 如果数组为空返回true
   */
  static isEmptyArray(value: unknown[] | null | undefined): boolean {
    if (value === null || value === undefined) {
      return true;
    }
    return value.length === 0;
  }

  /**
   * 检查值是否为空集合（null、undefined、空字符串、空数组或空对象）
   * @param value - 要检查的值
   * @returns 如果值为空集合返回true
   */
  static isEmptyCollection(value: unknown): boolean {
    if (value === null || value === undefined) {
      return true;
    }
    if (typeof value === TYPE_STRING) {
      return (value as string).trim().length === 0;
    }
    if (Array.isArray(value)) {
      return value.length === 0;
    }
    if (typeof value === TYPE_OBJECT) {
      return Object.keys(value as object).length === 0;
    }
    return false;
  }

  // ========================================
  // 类型获取方法
  // ========================================

  /**
   * 获取值的类型名称
   * 返回精确的类型描述字符串
   * @param value - 要获取类型的值
   * @returns 类型名称字符串（如'string'、'number'、'array'、'null'等）
   */
  static getType(value: unknown): string {
    if (value === null) {
      return TYPE_NULL;
    }
    if (value === undefined) {
      return TYPE_UNDEFINED;
    }
    if (Array.isArray(value)) {
      return TYPE_ARRAY;
    }
    return typeof value;
  }

  /**
   * 获取值的详细类型描述
   * 使用Object.prototype.toString获取精确类型
   * @param value - 要获取类型的值
   * @returns 详细类型描述字符串（如'[object String]'）
   */
  static getDetailedType(value: unknown): string {
    return Object.prototype.toString.call(value);
  }

  /**
   * 检查值是否为指定的类型
   * @param value - 要检查的值
   * @param typeName - 期望的类型名称
   * @returns 如果值是指定类型返回true
   */
  static isType(value: unknown, typeName: string): boolean {
    return TypeUtils.getType(value) === typeName;
  }

  // ========================================
  // 类型转换方法
  // ========================================

  /**
   * 将值安全地转换为字符串
   * null和undefined转换为空字符串，对象使用JSON序列化
   * @param value - 要转换的值
   * @returns 转换后的字符串
   */
  static toString(value: unknown): string {
    if (value === null || value === undefined) {
      return '';
    }
    if (typeof value === TYPE_STRING) {
      return value as string;
    }
    if (typeof value === TYPE_OBJECT) {
      try {
        return JSON.stringify(value);
      } catch (error) {
        hilog.warn(DOMAIN, TAG, 'TypeUtils objectToString failed, error=%{public}s', String(error));
        return String(value);
      }
    }
    return String(value);
  }

  /**
   * 将值安全地转换为数字
   * 无法转换时返回0
   * @param value - 要转换的值
   * @returns 转换后的数字
   */
  static toNumber(value: unknown): number {
    if (value === null || value === undefined) {
      return 0;
    }
    if (typeof value === TYPE_NUMBER) {
      const num: number = value as number;
      return isNaN(num) ? 0 : num;
    }
    if (typeof value === TYPE_BOOLEAN) {
      return (value as boolean) ? 1 : 0;
    }
    if (typeof value === TYPE_STRING) {
      const str: string = (value as string).trim();
      if (str.length === 0) {
        return 0;
      }
      const parsed: number = Number(str);
      return isNaN(parsed) ? 0 : parsed;
    }
    return 0;
  }

  /**
   * 将值安全地转换为布尔值
   * 遵循JavaScript的truthy/falsy规则，但空字符串和'false'文本返回false
   * @param value - 要转换的值
   * @returns 转换后的布尔值
   */
  static toBoolean(value: unknown): boolean {
    if (value === null || value === undefined) {
      return false;
    }
    if (typeof value === TYPE_BOOLEAN) {
      return value as boolean;
    }
    if (typeof value === TYPE_NUMBER) {
      return (value as number) !== 0;
    }
    if (typeof value === TYPE_STRING) {
      const str: string = (value as string).trim().toLowerCase();
      if (str === '' || str === 'false' || str === '0' || str === 'no' || str === 'null' || str === 'undefined') {
        return false;
      }
      return true;
    }
    if (typeof value === TYPE_OBJECT) {
      return true;
    }
    return Boolean(value);
  }

  /**
   * 尝试将字符串解析为整数
   * @param value - 要解析的字符串
   * @param defaultValue - 解析失败时的默认值
   * @returns 解析后的整数或默认值
   */
  static toInt(value: string | null | undefined, defaultValue: number = 0): number {
    if (value === null || value === undefined || value.trim().length === 0) {
      return defaultValue;
    }
    const parsed: number = parseInt(value, 10);
    return isNaN(parsed) ? defaultValue : parsed;
  }

  /**
   * 尝试将字符串解析为浮点数
   * @param value - 要解析的字符串
   * @param defaultValue - 解析失败时的默认值
   * @returns 解析后的浮点数或默认值
   */
  static toFloat(value: string | null | undefined, defaultValue: number = 0): number {
    if (value === null || value === undefined || value.trim().length === 0) {
      return defaultValue;
    }
    const parsed: number = parseFloat(value);
    return isNaN(parsed) ? defaultValue : parsed;
  }

  // ========================================
  // 类型断言辅助方法
  // ========================================

  /**
   * 确保值不为空，为空时抛出异常
   * @param value - 要检查的值
   * @param name - 值名称（用于错误信息）
   * @returns 非空的值
   */
  static requireNonNull<T>(value: T | null | undefined, name: string): T {
    if (value === null || value === undefined) {
      hilog.error(DOMAIN, TAG, 'TypeUtils required parameter is empty, name=%{public}s', name);
      throw new Error(`必需参数 '${name}' 不能为空`);
    }
    return value;
  }

  /**
   * 检查值是否为原始类型（string、number、boolean、symbol、null、undefined）
   * @param value - 要检查的值
   * @returns 如果值为原始类型返回true
   */
  static isPrimitive(value: unknown): boolean {
    if (value === null || value === undefined) {
      return true;
    }
    const type: string = typeof value;
    return type === TYPE_STRING || type === TYPE_NUMBER || type === TYPE_BOOLEAN || type === TYPE_SYMBOL;
  }

  /**
   * 检查值是否为引用类型（对象、数组、函数）
   * @param value - 要检查的值
   * @returns 如果值为引用类型返回true
   */
  static isReference(value: unknown): boolean {
    return !TypeUtils.isPrimitive(value);
  }

  /**
   * 安全地检查两个值是否相等
   * 支持基本类型和对象的深度比较
   * @param a - 第一个值
   * @param b - 第二个值
   * @returns 如果两个值相等返回true
   */
  static safeEquals(a: unknown, b: unknown): boolean {
    if (a === b) {
      return true;
    }
    if (a === null || a === undefined || b === null || b === undefined) {
      return false;
    }
    try {
      return JSON.stringify(a) === JSON.stringify(b);
    } catch (error) {
      return false;
    }
  }
}
