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
import { ResourceHelper } from '../basic/ResourceHelper';

const TAG: string = SystemConfigConstants.TAG;
const DOMAIN: number = SystemConfigConstants.DOMAIN;

// ========================================
// Validation result interface
// ========================================

/**
 * Generic validation result interface.
 * Contains the pass flag, description message and status code.
 */
export interface ValidationResult {
  /** Whether validation passed */
  isValid: boolean;
  /** Validation result description message */
  message: string;
  /** Validation result status code (0 means success) */
  code: number;
}

// ========================================
// Validation error code constants
// ========================================

/** Validation succeeded */
const CODE_SUCCESS: number = 0;
/** Validation failed - value is empty */
const CODE_EMPTY: number = 1001;
/** Validation failed - length limit exceeded */
const CODE_LENGTH_EXCEEDED: number = 1002;
/** Validation failed - incorrect format */
const CODE_INVALID_FORMAT: number = 1003;
/** Validation failed - numeric range exceeded */
const CODE_OUT_OF_RANGE: number = 1004;
/** Validation failed - value not in the enum set */
const CODE_INVALID_ENUM: number = 1005;
/** Validation failed - array too short */
const CODE_ARRAY_TOO_SHORT: number = 1006;
/** Validation failed - invalid timestamp */
const CODE_INVALID_TIMESTAMP: number = 1007;

// ========================================
// Generic validation utility class
// ========================================

/**
 * Generic validation utility class.
 * Provides validation for channel ids, device ids, error codes, timestamps,
 * strings, numbers, enum values and arrays.
 */
export class ValidationUtils {
  /** Maximum channel id length */
  private static readonly CHANNEL_ID_MAX_LENGTH: number = 64;
  /** Maximum device ID length */
  private static readonly DEVICE_ID_MAX_LENGTH: number = 128;
  /** Device ID format pattern (alphanumerics and hyphens) */
  private static readonly DEVICE_ID_PATTERN: RegExp = /^[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9]$/;
  /** Minimum device ID length */
  private static readonly DEVICE_ID_MIN_LENGTH: number = 2;

  // ========================================
  // Channel id and device id validation
  // ========================================

  /**
   * Validates a channel id.
   * A channel id must not be empty and must not exceed the maximum length.
   * @param {string} id - Channel id to validate
   * @returns {ValidationResult} Validation result
   */
  static validateChannelId(id: string): ValidationResult {
    hilog.info(DOMAIN, TAG, 'ValidationUtils validateChannelId: validating channel ID');

    if (!id || id.trim().length === 0) {
      return { isValid: false, message: ResourceHelper.getStringByName('validate_channel_empty'), code: CODE_EMPTY };
    }

    if (id.length > ValidationUtils.CHANNEL_ID_MAX_LENGTH) {
      return {
        isValid: false,
        message: ResourceHelper.getStringByName('validate_channel_too_long', ValidationUtils.CHANNEL_ID_MAX_LENGTH),
        code: CODE_LENGTH_EXCEEDED
      };
    }

    return { isValid: true, message: ResourceHelper.getStringByName('validate_channel_pass'), code: CODE_SUCCESS };
  }

  /**
   * Validates a device ID.
   * A device ID must satisfy the format requirements: only letters, digits
   * and hyphens, with a length within the allowed range.
   * @param {string} id - Device ID to validate
   * @returns {ValidationResult} Validation result
   */
  static validateDeviceId(id: string): ValidationResult {
    hilog.info(DOMAIN, TAG, 'ValidationUtils validateDeviceId: validating device ID');

    if (!id || id.trim().length === 0) {
      return { isValid: false, message: ResourceHelper.getStringByName('validate_device_empty'), code: CODE_EMPTY };
    }

    if (id.length < ValidationUtils.DEVICE_ID_MIN_LENGTH) {
      return {
        isValid: false,
        message: ResourceHelper.getStringByName('validate_device_too_short', ValidationUtils.DEVICE_ID_MIN_LENGTH),
        code: CODE_LENGTH_EXCEEDED
      };
    }

    if (id.length > ValidationUtils.DEVICE_ID_MAX_LENGTH) {
      return {
        isValid: false,
        message: ResourceHelper.getStringByName('validate_device_too_long', ValidationUtils.DEVICE_ID_MAX_LENGTH),
        code: CODE_LENGTH_EXCEEDED
      };
    }

    if (!ValidationUtils.DEVICE_ID_PATTERN.test(id)) {
      return {
        isValid: false,
        message: ResourceHelper.getStringByName('validate_device_format'),
        code: CODE_INVALID_FORMAT
      };
    }

    return { isValid: true, message: ResourceHelper.getStringByName('validate_device_pass'), code: CODE_SUCCESS };
  }

  // ========================================
  // Error code and timestamp validation
  // ========================================

  /**
   * Validates whether an error code is within the legal range.
   * An error code must be a non-negative integer within 0~99999.
   * @param {number} code - Error code to validate
   * @returns {ValidationResult} Validation result
   */
  static validateErrorCode(code: number): ValidationResult {
    hilog.info(DOMAIN, TAG, 'ValidationUtils validateErrorCode: validating code=%{public}d', code);

    if (!Number.isInteger(code)) {
      return { isValid: false, message: ResourceHelper.getStringByName('validate_code_not_int'), code: CODE_INVALID_FORMAT };
    }

    if (code < 0 || code > 99999) {
      return { isValid: false, message: ResourceHelper.getStringByName('validate_code_out_of_range'), code: CODE_OUT_OF_RANGE };
    }

    return { isValid: true, message: ResourceHelper.getStringByName('validate_code_pass'), code: CODE_SUCCESS };
  }

  /**
   * Validates a timestamp.
   * A timestamp must be a positive number and must not exceed the current system time (future times are not allowed).
   * @param {number} ts - Timestamp to validate (milliseconds)
   * @returns {ValidationResult} Validation result
   */
  static validateTimestamp(ts: number): ValidationResult {
    hilog.info(DOMAIN, TAG, 'ValidationUtils validateTimestamp: validating timestamp=%{public}d', ts);

    if (!Number.isFinite(ts)) {
      return { isValid: false, message: ResourceHelper.getStringByName('validate_ts_invalid'), code: CODE_INVALID_TIMESTAMP };
    }

    if (ts <= 0) {
      return { isValid: false, message: ResourceHelper.getStringByName('validate_ts_negative'), code: CODE_INVALID_TIMESTAMP };
    }

    const now: number = Date.now();
    if (ts > now) {
      return { isValid: false, message: ResourceHelper.getStringByName('validate_ts_future'), code: CODE_INVALID_TIMESTAMP };
    }

    return { isValid: true, message: ResourceHelper.getStringByName('validate_ts_pass'), code: CODE_SUCCESS };
  }

  // ========================================
  // Generic type validation
  // ========================================

  /**
   * Validates whether a string length is within the specified range.
   * @param {string} str - String to validate
   * @param {number} minLen - Minimum length (inclusive)
   * @param {number} maxLen - Maximum length (inclusive)
   * @returns {ValidationResult} Validation result
   */
  static validateString(str: string, minLen: number, maxLen: number): ValidationResult {
    hilog.info(DOMAIN, TAG, 'ValidationUtils validateString: minLen=%{public}d, maxLen=%{public}d', minLen, maxLen);

    if (str === undefined || str === null) {
      return { isValid: false, message: ResourceHelper.getStringByName('validate_str_empty'), code: CODE_EMPTY };
    }

    if (str.length < minLen) {
      return { isValid: false, message: ResourceHelper.getStringByName('validate_str_too_short', minLen), code: CODE_LENGTH_EXCEEDED };
    }

    if (str.length > maxLen) {
      return { isValid: false, message: ResourceHelper.getStringByName('validate_str_too_long', maxLen), code: CODE_LENGTH_EXCEEDED };
    }

    return { isValid: true, message: ResourceHelper.getStringByName('validate_str_pass'), code: CODE_SUCCESS };
  }

  /**
   * Validates whether a number is within the specified range.
   * @param {number} num - Number to validate
   * @param {number} min - Minimum value (inclusive)
   * @param {number} max - Maximum value (inclusive)
   * @returns {ValidationResult} Validation result
   */
  static validateNumber(num: number, min: number, max: number): ValidationResult {
    hilog.info(DOMAIN, TAG, 'ValidationUtils validateNumber: num=%{public}s, min=%{public}s, max=%{public}s',
      num.toString(), min.toString(), max.toString());

    if (typeof num !== 'number' || Number.isNaN(num)) {
      return { isValid: false, message: ResourceHelper.getStringByName('validate_num_invalid'), code: CODE_INVALID_FORMAT };
    }

    if (num < min || num > max) {
      return { isValid: false, message: ResourceHelper.getStringByName('validate_num_out_of_range', min, max), code: CODE_OUT_OF_RANGE };
    }

    return { isValid: true, message: ResourceHelper.getStringByName('validate_num_pass'), code: CODE_SUCCESS };
  }

  /**
   * Validates whether a value is in the list of legal enum values.
   * @param {string} value - Value to validate
   * @param {string[]} validValues - Array of valid enum values
   * @returns {ValidationResult} Validation result
   */
  static validateEnum(value: string, validValues: string[]): ValidationResult {
    hilog.info(DOMAIN, TAG, 'ValidationUtils validateEnum: value=%{public}s', value);

    if (!value || value.trim().length === 0) {
      return { isValid: false, message: ResourceHelper.getStringByName('validate_enum_empty'), code: CODE_EMPTY };
    }

    if (validValues.length === 0) {
      return { isValid: false, message: ResourceHelper.getStringByName('validate_enum_list_empty'), code: CODE_INVALID_ENUM };
    }

    if (validValues.indexOf(value) < 0) {
      return {
        isValid: false,
        message: ResourceHelper.getStringByName('validate_enum_not_allowed', value),
        code: CODE_INVALID_ENUM
      };
    }

    return { isValid: true, message: ResourceHelper.getStringByName('validate_enum_pass'), code: CODE_SUCCESS };
  }

  /**
   * Validates whether an array meets the minimum length requirement.
   * @param {unknown[]} arr - Array to validate
   * @param {number} minLen - Minimum length (inclusive)
   * @returns {ValidationResult} Validation result
   */
  static validateArray(arr: unknown[], minLen: number): ValidationResult {
    hilog.info(DOMAIN, TAG, 'ValidationUtils validateArray: arrLen=%{public}d, minLen=%{public}d',
      arr.length, minLen);

    if (!Array.isArray(arr)) {
      return { isValid: false, message: ResourceHelper.getStringByName('validate_array_not_array'), code: CODE_INVALID_FORMAT };
    }

    if (arr.length < minLen) {
      return { isValid: false, message: ResourceHelper.getStringByName('validate_array_too_short', minLen), code: CODE_ARRAY_TOO_SHORT };
    }

    return { isValid: true, message: ResourceHelper.getStringByName('validate_array_pass'), code: CODE_SUCCESS };
  }
}
