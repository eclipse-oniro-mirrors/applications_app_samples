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

import { AppLogger } from '../AppLogger';

/** Decimal radix used when parsing numbers from strings. */
const RADIX_DECIMAL: number = 10;
/** Bytes per kilobyte used for human readable size formatting. */
const BYTES_PER_KB: number = 1024;
/** Maximum fraction digits accepted by {@link NumberUtils.toFixedString}. */
const MAX_FRACTION_DIGITS: number = 100;
/** Size units from byte to terabyte, used by {@link NumberUtils.formatFileSize}. */
const SIZE_UNITS: string[] = ['B', 'KB', 'MB', 'GB', 'TB'];

/**
 * Utility class for common number operations.
 * All methods are static and never throw; failure branches log a warning.
 */
export class NumberUtils {
  /**
   * Parses the input string as a decimal integer.
   * @param value - the string to parse, may be null or undefined.
   * @param defaultValue - value returned when the input is missing or invalid.
   */
  public static parseIntSafe(value: string | null | undefined, defaultValue: number): number {
    if (value === null || value === undefined) {
      return defaultValue;
    }
    // parseInt returns NaN for inputs that are not numbers.
    const parsed: number = Number.parseInt(value, RADIX_DECIMAL);
    if (Number.isNaN(parsed)) {
      AppLogger.warn('NumberUtils', `parseIntSafe failed for value: ${value}`);
      return defaultValue;
    }
    return parsed;
  }

  /**
   * Parses the input string as a float.
   * @param value - the string to parse, may be null or undefined.
   * @param defaultValue - value returned when the input is missing or invalid.
   */
  public static parseFloatSafe(value: string | null | undefined, defaultValue: number): number {
    if (value === null || value === undefined) {
      return defaultValue;
    }
    // parseFloat returns NaN for inputs that are not numbers.
    const parsed: number = Number.parseFloat(value);
    if (Number.isNaN(parsed)) {
      AppLogger.warn('NumberUtils', `parseFloatSafe failed for value: ${value}`);
      return defaultValue;
    }
    return parsed;
  }

  /**
   * Checks whether the given value is a finite number (not NaN and not Infinity).
   */
  public static isFiniteNumber(value: number): boolean {
    return Number.isFinite(value);
  }

  /**
   * Clamps the value into the inclusive [min, max] range.
   * Logs a warning when the bounds are swapped and normalizes them.
   */
  public static clamp(value: number, min: number, max: number): number {
    if (min > max) {
      // Swapped bounds are a caller mistake, warn and normalize the range.
      AppLogger.warn('NumberUtils', `clamp called with min ${min} greater than max ${max}`);
      const effectiveMin: number = max;
      const effectiveMax: number = min;
      return Math.min(Math.max(value, effectiveMin), effectiveMax);
    }
    return Math.min(Math.max(value, min), max);
  }

  /**
   * Checks whether the value is inside the inclusive [min, max] range.
   */
  public static isInRange(value: number, min: number, max: number): boolean {
    return value >= min && value <= max;
  }

  /**
   * Formats the number with fixed fraction digits.
   * Invalid digit counts are warned and clamped into the supported range.
   */
  public static toFixedString(value: number, fractionDigits: number): string {
    if (!Number.isFinite(fractionDigits) || fractionDigits < 0) {
      AppLogger.warn('NumberUtils', `toFixedString called with invalid digits: ${fractionDigits}`);
      return value.toFixed(0);
    }
    if (fractionDigits > MAX_FRACTION_DIGITS) {
      // toFixed only supports up to 100 fraction digits, clamp beyond that.
      AppLogger.warn('NumberUtils', `toFixedString digits ${fractionDigits} exceed limit, clamped to ${MAX_FRACTION_DIGITS}`);
      return value.toFixed(MAX_FRACTION_DIGITS);
    }
    return value.toFixed(fractionDigits);
  }

  /**
   * Converts a byte count into a human readable string such as '1.50MB'.
   * Negative or non-finite sizes are warned and treated as zero.
   */
  public static formatFileSize(bytes: number): string {
    if (!Number.isFinite(bytes) || bytes < 0) {
      // Negative or invalid sizes are caller mistakes, normalize to zero.
      AppLogger.warn('NumberUtils', `formatFileSize called with invalid bytes: ${bytes}`);
      bytes = 0;
    }
    let size: number = bytes;
    let unitIndex: number = 0;
    // Grow the unit while the value still fits into the previous one.
    while (size >= BYTES_PER_KB && unitIndex < SIZE_UNITS.length - 1) {
      size /= BYTES_PER_KB;
      unitIndex++;
    }
    return `${size.toFixed(2)}${SIZE_UNITS[unitIndex]}`;
  }
}
