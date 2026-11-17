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

import { BusinessError } from '@kit.BasicServicesKit';

import { AppLogger } from '../AppLogger';

/**
 * Utility class for common object operations.
 * All methods are static and never throw; failure branches log a warning.
 */
export class ObjectUtils {
  /**
   * Checks whether the value is neither null nor undefined.
   */
  public static hasValue<T>(value: T | null | undefined): boolean {
    return value !== null && value !== undefined;
  }

  /**
   * Returns the value when present, otherwise the given default.
   */
  public static getOrDefault<T>(value: T | null | undefined, defaultValue: T): T {
    if (value === null || value === undefined) {
      return defaultValue;
    }
    return value;
  }

  /**
   * Checks whether the object has no enumerable own keys.
   * Null and undefined inputs are treated as empty.
   */
  public static isEmptyObject(value: object | null | undefined): boolean {
    if (value === null || value === undefined) {
      return true;
    }
    // Enumerate own keys and check whether at least one exists.
    const keys: string[] = Object.keys(value);
    return keys.length === 0;
  }

  /**
   * Serializes the value to a JSON string.
   * Returns an empty string and logs a warning when serialization fails,
   * for example on circular references.
   */
  public static stringify(value: object | null | undefined): string {
    if (value === null || value === undefined) {
      return '';
    }
    try {
      return JSON.stringify(value);
    } catch (err) {
      // Circular structures make JSON.stringify throw.
      const error: BusinessError = err as BusinessError;
      AppLogger.warn('ObjectUtils', `stringify failed: ${error.message}`);
      return '';
    }
  }

  /**
   * Deep-copies the value through a JSON round-trip.
   * Only JSON representable data is supported, class methods are dropped.
   * Returns null and logs a warning when the copy fails.
   */
  public static deepClone<T extends object>(value: T): T | null {
    try {
      // The JSON round-trip is the safest portable deep copy in ArkTS.
      const text: string = JSON.stringify(value);
      return JSON.parse(text) as T;
    } catch (err) {
      const error: BusinessError = err as BusinessError;
      AppLogger.warn('ObjectUtils', `deepClone failed: ${error.message}`);
      return null;
    }
  }

  /**
   * Compares two values by their JSON representation.
   * Key order matters for this check, best suited for simple data objects.
   */
  public static deepEqualsByJson(first: object | null | undefined, second: object | null | undefined): boolean {
    // Fast path for identical references.
    if (first === second) {
      return true;
    }
    return ObjectUtils.stringify(first) === ObjectUtils.stringify(second);
  }
}
