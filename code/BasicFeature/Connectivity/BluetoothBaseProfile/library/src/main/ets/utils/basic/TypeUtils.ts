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
 * type utility class
 * provides type check and convert relative relate actual use method method
 */
export class TypeUtils {
  /**
   * check whether the value is a string
   * @param value - want check value
   * @returns whether it is a string
   */
  static isString(value: unknown): boolean {
    return typeof value === 'string';
  }

  /**
   * check whether the value is a number
   * @param value - want check value
   * @returns whether it is a number
   */
  static isNumber(value: unknown): boolean {
    return typeof value === 'number' && !isNaN(value);
  }

  /**
   * check whether the value is a boolean
   * @param value - want check value
   * @returns whether it is a boolean
   */
  static isBoolean(value: unknown): boolean {
    return typeof value === 'boolean';
  }

  /**
   * check whether the value is an array
   * @param value - want check value
   * @returns whether it is an array
   */
  static isArray(value: unknown): boolean {
    return Array.isArray(value);
  }

  /**
   * check whether the value is an object
   * @param value - want check value
   * @returns whether it is an object
   */
  static isObject(value: unknown): boolean {
    return value !== null && typeof value === 'object' && !Array.isArray(value);
  }

  /**
   * check whether the value is a function
   * @param value - want check value
   * @returns whether it is a function
   */
  static isFunction(value: unknown): boolean {
    return typeof value === 'function';
  }

  /**
   * check value whether for null or undefined
   * @param value - want check value
   * @returns whether for null or undefined
   */
  static isNullOrUndefined(value: unknown): boolean {
    return value === null || value === undefined;
  }

  /**
   * check value whether for empty (null, undefined, empty string, empty array, empty against object)
   * @param value - want check value
   * @returns whether for empty
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
   * safely convert string to number
   * @param value - string to convert
   * @param defaultValue - default value when conversion fails
   * @returns converted number
   */
  static toNumber(value: string, defaultValue: number = 0): number {
    const num: number = Number(value);
    return isNaN(num) ? defaultValue : num;
  }

  /**
   * safely convert value to boolean
   * @param value - value to convert
   * @returns layout er value
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
   * safely convert value to string
   * @param value - value to convert
   * @param defaultValue - default value when conversion fails
   * @returns string
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
   * deep copy object
   * @param obj - want copy shell against object
   * @returns copied new object
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
   * check whether two objects are deeply equal
   * @param a - th one against object
   * @param b - th second against object
   * @returns whether deep equality
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
   * get the type name of the value
   * @param value - want check value
   * @returns type name
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
   * safely parse JSON string
   * @param json - JSON string
   * @param defaultValue - default value when parsing fails
   * @returns decode parse after against object
   */
  static safeParseJson<T>(json: string, defaultValue: T): T {
    try {
      return JSON.parse(json) as T;
    } catch (e) {
      return defaultValue;
    }
  }
}
