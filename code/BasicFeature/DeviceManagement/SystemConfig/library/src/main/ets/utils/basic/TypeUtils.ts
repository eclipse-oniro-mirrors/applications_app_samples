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
import { ResourceHelper } from './ResourceHelper';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// Type name constants
// ========================================

/** String type name */
const TYPE_STRING: string = 'string';
/** Number type name */
const TYPE_NUMBER: string = 'number';
/** Boolean type name */
const TYPE_BOOLEAN: string = 'boolean';
/** Object type name */
const TYPE_OBJECT: string = 'object';
/** Undefined type name */
const TYPE_UNDEFINED: string = 'undefined';
/** Null type name */
const TYPE_NULL: string = 'null';
/** Array type name */
const TYPE_ARRAY: string = 'array';
/** Function type name */
const TYPE_FUNCTION: string = 'function';
/** Symbol type name */
const TYPE_SYMBOL: string = 'symbol';

// ========================================
// Type utility class
// ========================================

/**
 * Type utility class
 * Provides comprehensive type checking and conversion static methods,
 * including primitive checks, null checks and type-safe conversions.
 * All methods include strict null and boundary checks.
 */
export class TypeUtils {
  // ========================================
  // Basic type check methods
  // ========================================

  /**
   * Checks whether a value is a string
   * @param value - Value to check
   * @returns true if the value is a string
   */
  static isString(value: unknown): boolean {
    return typeof value === TYPE_STRING;
  }

  /**
   * Checks whether a value is a number (excluding NaN)
   * @param value - Value to check
   * @returns true if the value is a valid number
   */
  static isNumber(value: unknown): boolean {
    return typeof value === TYPE_NUMBER && !isNaN(value as number);
  }

  /**
   * Checks whether a value is a boolean
   * @param value - Value to check
   * @returns true if the value is a boolean
   */
  static isBoolean(value: unknown): boolean {
    return typeof value === TYPE_BOOLEAN;
  }

  /**
   * Checks whether a value is a plain object (excluding null and arrays)
   * @param value - Value to check
   * @returns true if the value is a plain object
   */
  static isObject(value: unknown): boolean {
    return typeof value === TYPE_OBJECT && value !== null && !Array.isArray(value);
  }

  /**
   * Checks whether a value is an array
   * @param value - Value to check
   * @returns true if the value is an array
   */
  static isArray(value: unknown): boolean {
    return Array.isArray(value);
  }

  /**
   * Checks whether a value is null
   * @param value - Value to check
   * @returns true if the value is null
   */
  static isNull(value: unknown): boolean {
    return value === null;
  }

  /**
   * Checks whether a value is undefined
   * @param value - Value to check
   * @returns true if the value is undefined
   */
  static isUndefined(value: unknown): boolean {
    return value === undefined;
  }

  /**
   * Checks whether a value is a function
   * @param value - Value to check
   * @returns true if the value is a function
   */
  static isFunction(value: unknown): boolean {
    return typeof value === TYPE_FUNCTION;
  }

  /**
   * Checks whether a value is a symbol
   * @param value - Value to check
   * @returns true if the value is a symbol
   */
  static isSymbol(value: unknown): boolean {
    return typeof value === TYPE_SYMBOL;
  }

  // ========================================
  // Null and empty checks
  // ========================================

  /**
   * Checks whether a value is empty (null, undefined or empty string)
   * @param value - Value to check
   * @returns true if the value is empty
   */
  static isEmpty(value: string | null | undefined): boolean {
    return value === null || value === undefined || value === '';
  }

  /**
   * Checks whether a string is blank (null, undefined, empty or whitespace only)
   * @param value - String to check
   * @returns true if the string is blank
   */
  static isBlank(value: string | null | undefined): boolean {
    if (value === null || value === undefined) {
      return true;
    }
    return value.trim().length === 0;
  }

  /**
   * Checks whether an object is empty (null, undefined or without own properties)
   * @param value - Object to check
   * @returns true if the object is empty
   */
  static isEmptyObject(value: object | null | undefined): boolean {
    if (value === null || value === undefined) {
      return true;
    }
    return Object.keys(value).length === 0;
  }

  /**
   * Checks whether an array is empty (null, undefined or length 0)
   * @param value - Array to check
   * @returns true if the array is empty
   */
  static isEmptyArray(value: unknown[] | null | undefined): boolean {
    if (value === null || value === undefined) {
      return true;
    }
    return value.length === 0;
  }

  /**
   * Checks whether a value is an empty collection (null, undefined, empty string, array or object)
   * @param value - Value to check
   * @returns true if the value is an empty collection
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
  // Type retrieval methods
  // ========================================

  /**
   * Gets the type name of a value
   * Returns a precise type description string
   * @param value - Value whose type is requested
   * @returns Type name string (e.g. 'string', 'number', 'array', 'null')
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
   * Gets the detailed type description of a value
   * Uses Object.prototype.toString for the exact type
   * @param value - Value whose type is requested
   * @returns Detailed type string (e.g. '[object String]')
   */
  static getDetailedType(value: unknown): string {
    return Object.prototype.toString.call(value);
  }

  /**
   * Checks whether a value is of the specified type
   * @param value - Value to check
   * @param typeName - Expected type name
   * @returns true if the value is of the specified type
   */
  static isType(value: unknown, typeName: string): boolean {
    return TypeUtils.getType(value) === typeName;
  }

  // ========================================
  // Type conversion methods
  // ========================================

  /**
   * Safely converts a value to a string
   * null/undefined become an empty string; objects are JSON-serialized
   * @param value - Value to convert
   * @returns Converted string
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
   * Safely converts a value to a number
   * Returns 0 when conversion is impossible
   * @param value - Value to convert
   * @returns Converted number
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
   * Safely converts a value to a boolean
   * Follows JavaScript truthy/falsy rules, but empty strings and the text 'false' return false
   * @param value - Value to convert
   * @returns Converted boolean
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
   * Parses a string into an integer
   * @param value - String to parse
   * @param defaultValue - Default value when parsing fails
   * @returns Parsed integer or the default value
   */
  static toInt(value: string | null | undefined, defaultValue: number = 0): number {
    if (value === null || value === undefined || value.trim().length === 0) {
      return defaultValue;
    }
    const parsed: number = parseInt(value, 10);
    return isNaN(parsed) ? defaultValue : parsed;
  }

  /**
   * Parses a string into a float
   * @param value - String to parse
   * @param defaultValue - Default value when parsing fails
   * @returns Parsed float or the default value
   */
  static toFloat(value: string | null | undefined, defaultValue: number = 0): number {
    if (value === null || value === undefined || value.trim().length === 0) {
      return defaultValue;
    }
    const parsed: number = parseFloat(value);
    return isNaN(parsed) ? defaultValue : parsed;
  }

  // ========================================
  // Type assertion helpers
  // ========================================

  /**
   * Ensures a value is non-null, throwing when it is empty
   * @param value - Value to check
   * @param name - Value name (for the error message)
   * @returns The non-null value
   */
  static requireNonNull<T>(value: T | null | undefined, name: string): T {
    if (value === null || value === undefined) {
      hilog.error(DOMAIN, TAG, 'TypeUtils required parameter is empty, name=%{public}s', name);
      throw new Error(ResourceHelper.getStringByName('type_param_required_empty', name));
    }
    return value;
  }

  /**
   * Checks whether a value is primitive (string, number, boolean, symbol, null, undefined)
   * @param value - Value to check
   * @returns true if the value is primitive
   */
  static isPrimitive(value: unknown): boolean {
    if (value === null || value === undefined) {
      return true;
    }
    const type: string = typeof value;
    return type === TYPE_STRING || type === TYPE_NUMBER || type === TYPE_BOOLEAN || type === TYPE_SYMBOL;
  }

  /**
   * Checks whether a value is a reference type (object, array, function)
   * @param value - Value to check
   * @returns true if the value is a reference type
   */
  static isReference(value: unknown): boolean {
    return !TypeUtils.isPrimitive(value);
  }

  /**
   * Safely checks whether two values are equal
   * Supports primitives and deep comparison of objects
   * @param a - First value
   * @param b - Second value
   * @returns true if the values are equal
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
