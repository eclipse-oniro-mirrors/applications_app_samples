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
// 验证结果接口
// ========================================

/**
 * 通用验证结果接口。
 * 包含验证是否通过、描述消息和状态码。
 */
export interface ValidationResult {
  /** 验证是否通过 */
  isValid: boolean;
  /** 验证结果描述消息 */
  message: string;
  /** 验证结果状态码（0 表示成功） */
  code: number;
}

// ========================================
// 验证错误码常量
// ========================================

/** 验证成功 */
const CODE_SUCCESS: number = 0;
/** 验证失败 - 值为空 */
const CODE_EMPTY: number = 1001;
/** 验证失败 - 超出长度限制 */
const CODE_LENGTH_EXCEEDED: number = 1002;
/** 验证失败 - 格式不正确 */
const CODE_INVALID_FORMAT: number = 1003;
/** 验证失败 - 超出数值范围 */
const CODE_OUT_OF_RANGE: number = 1004;
/** 验证失败 - 值不在枚举范围内 */
const CODE_INVALID_ENUM: number = 1005;
/** 验证失败 - 数组长度不足 */
const CODE_ARRAY_TOO_SHORT: number = 1006;
/** 验证失败 - 时间戳无效 */
const CODE_INVALID_TIMESTAMP: number = 1007;

// ========================================
// 通用验证工具类
// ========================================

/**
 * 通用验证工具类。
 * 提供渠道号、设备号、错误码、时间戳、字符串、数值、
 * 枚举值和数组等多种数据格式的校验能力。
 */
export class ValidationUtils {
  /** 渠道号最大长度 */
  private static readonly CHANNEL_ID_MAX_LENGTH: number = 64;
  /** 设备 ID 最大长度 */
  private static readonly DEVICE_ID_MAX_LENGTH: number = 128;
  /** 设备 ID 格式正则（字母数字和连字符） */
  private static readonly DEVICE_ID_PATTERN: RegExp = /^[a-zA-Z0-9][a-zA-Z0-9\-]*[a-zA-Z0-9]$/;
  /** 设备 ID 最小长度 */
  private static readonly DEVICE_ID_MIN_LENGTH: number = 2;

  // ========================================
  // 渠道号与设备号验证
  // ========================================

  /**
   * 验证渠道号是否合法。
   * 渠道号不能为空且长度不能超过最大限制。
   * @param {string} id - 待验证的渠道号
   * @returns {ValidationResult} 验证结果
   */
  static validateChannelId(id: string): ValidationResult {
    hilog.info(DOMAIN, TAG, 'ValidationUtils validateChannelId: validating channel ID');

    if (!id || id.trim().length === 0) {
      return { isValid: false, message: '渠道号不能为空', code: CODE_EMPTY };
    }

    if (id.length > ValidationUtils.CHANNEL_ID_MAX_LENGTH) {
      return {
        isValid: false,
        message: `渠道号长度不能超过 ${ValidationUtils.CHANNEL_ID_MAX_LENGTH} 个字符`,
        code: CODE_LENGTH_EXCEEDED
      };
    }

    return { isValid: true, message: '渠道号验证通过', code: CODE_SUCCESS };
  }

  /**
   * 验证设备 ID 是否合法。
   * 设备 ID 须满足格式要求：仅含字母、数字和连字符，
   * 且长度在允许范围内。
   * @param {string} id - 待验证的设备 ID
   * @returns {ValidationResult} 验证结果
   */
  static validateDeviceId(id: string): ValidationResult {
    hilog.info(DOMAIN, TAG, 'ValidationUtils validateDeviceId: validating device ID');

    if (!id || id.trim().length === 0) {
      return { isValid: false, message: '设备ID不能为空', code: CODE_EMPTY };
    }

    if (id.length < ValidationUtils.DEVICE_ID_MIN_LENGTH) {
      return {
        isValid: false,
        message: `设备ID长度不能少于 ${ValidationUtils.DEVICE_ID_MIN_LENGTH} 个字符`,
        code: CODE_LENGTH_EXCEEDED
      };
    }

    if (id.length > ValidationUtils.DEVICE_ID_MAX_LENGTH) {
      return {
        isValid: false,
        message: `设备ID长度不能超过 ${ValidationUtils.DEVICE_ID_MAX_LENGTH} 个字符`,
        code: CODE_LENGTH_EXCEEDED
      };
    }

    if (!ValidationUtils.DEVICE_ID_PATTERN.test(id)) {
      return {
        isValid: false,
        message: '设备ID格式不正确，仅允许字母、数字和连字符，且首尾不能为连字符',
        code: CODE_INVALID_FORMAT
      };
    }

    return { isValid: true, message: '设备ID验证通过', code: CODE_SUCCESS };
  }

  // ========================================
  // 错误码与时间戳验证
  // ========================================

  /**
   * 验证错误码是否在合法范围内。
   * 错误码须为非负整数且在 0~99999 范围内。
   * @param {number} code - 待验证的错误码
   * @returns {ValidationResult} 验证结果
   */
  static validateErrorCode(code: number): ValidationResult {
    hilog.info(DOMAIN, TAG, 'ValidationUtils validateErrorCode: validating code=%{public}d', code);

    if (!Number.isInteger(code)) {
      return { isValid: false, message: '错误码必须为整数', code: CODE_INVALID_FORMAT };
    }

    if (code < 0 || code > 99999) {
      return { isValid: false, message: '错误码必须在 0 到 99999 之间', code: CODE_OUT_OF_RANGE };
    }

    return { isValid: true, message: '错误码验证通过', code: CODE_SUCCESS };
  }

  /**
   * 验证时间戳是否合法。
   * 时间戳须为正数且不能超过当前系统时间（不允许未来时间）。
   * @param {number} ts - 待验证的时间戳（毫秒级）
   * @returns {ValidationResult} 验证结果
   */
  static validateTimestamp(ts: number): ValidationResult {
    hilog.info(DOMAIN, TAG, 'ValidationUtils validateTimestamp: validating timestamp=%{public}d', ts);

    if (!Number.isFinite(ts)) {
      return { isValid: false, message: '时间戳必须为有效数字', code: CODE_INVALID_TIMESTAMP };
    }

    if (ts <= 0) {
      return { isValid: false, message: '时间戳必须为正数', code: CODE_INVALID_TIMESTAMP };
    }

    const now: number = Date.now();
    if (ts > now) {
      return { isValid: false, message: '时间戳不能晚于当前时间', code: CODE_INVALID_TIMESTAMP };
    }

    return { isValid: true, message: '时间戳验证通过', code: CODE_SUCCESS };
  }

  // ========================================
  // 通用类型验证
  // ========================================

  /**
   * 验证字符串长度是否在指定范围内。
   * @param {string} str - 待验证的字符串
   * @param {number} minLen - 最小长度（含）
   * @param {number} maxLen - 最大长度（含）
   * @returns {ValidationResult} 验证结果
   */
  static validateString(str: string, minLen: number, maxLen: number): ValidationResult {
    hilog.info(DOMAIN, TAG, 'ValidationUtils validateString: minLen=%{public}d, maxLen=%{public}d', minLen, maxLen);

    if (str === undefined || str === null) {
      return { isValid: false, message: '字符串不能为空', code: CODE_EMPTY };
    }

    if (str.length < minLen) {
      return { isValid: false, message: `字符串长度不能少于 ${minLen} 个字符`, code: CODE_LENGTH_EXCEEDED };
    }

    if (str.length > maxLen) {
      return { isValid: false, message: `字符串长度不能超过 ${maxLen} 个字符`, code: CODE_LENGTH_EXCEEDED };
    }

    return { isValid: true, message: '字符串验证通过', code: CODE_SUCCESS };
  }

  /**
   * 验证数值是否在指定范围内。
   * @param {number} num - 待验证的数值
   * @param {number} min - 最小值（含）
   * @param {number} max - 最大值（含）
   * @returns {ValidationResult} 验证结果
   */
  static validateNumber(num: number, min: number, max: number): ValidationResult {
    hilog.info(DOMAIN, TAG, 'ValidationUtils validateNumber: num=%{public}s, min=%{public}s, max=%{public}s',
      num.toString(), min.toString(), max.toString());

    if (typeof num !== 'number' || Number.isNaN(num)) {
      return { isValid: false, message: '值必须为有效数字', code: CODE_INVALID_FORMAT };
    }

    if (num < min || num > max) {
      return { isValid: false, message: `数值必须在 ${min} 到 ${max} 之间`, code: CODE_OUT_OF_RANGE };
    }

    return { isValid: true, message: '数值验证通过', code: CODE_SUCCESS };
  }

  /**
   * 验证值是否在合法的枚举值列表中。
   * @param {string} value - 待验证的值
   * @param {string[]} validValues - 合法枚举值数组
   * @returns {ValidationResult} 验证结果
   */
  static validateEnum(value: string, validValues: string[]): ValidationResult {
    hilog.info(DOMAIN, TAG, 'ValidationUtils validateEnum: value=%{public}s', value);

    if (!value || value.trim().length === 0) {
      return { isValid: false, message: '枚举值不能为空', code: CODE_EMPTY };
    }

    if (validValues.length === 0) {
      return { isValid: false, message: '枚举值列表不能为空', code: CODE_INVALID_ENUM };
    }

    if (validValues.indexOf(value) < 0) {
      return {
        isValid: false,
        message: `值 "${value}" 不在允许的枚举范围内`,
        code: CODE_INVALID_ENUM
      };
    }

    return { isValid: true, message: '枚举值验证通过', code: CODE_SUCCESS };
  }

  /**
   * 验证数组长度是否满足最小要求。
   * @param {unknown[]} arr - 待验证的数组
   * @param {number} minLen - 最小长度（含）
   * @returns {ValidationResult} 验证结果
   */
  static validateArray(arr: unknown[], minLen: number): ValidationResult {
    hilog.info(DOMAIN, TAG, 'ValidationUtils validateArray: arrLen=%{public}d, minLen=%{public}d',
      arr.length, minLen);

    if (!Array.isArray(arr)) {
      return { isValid: false, message: '参数必须为数组', code: CODE_INVALID_FORMAT };
    }

    if (arr.length < minLen) {
      return { isValid: false, message: `数组长度不能少于 ${minLen}`, code: CODE_ARRAY_TOO_SHORT };
    }

    return { isValid: true, message: '数组验证通过', code: CODE_SUCCESS };
  }
}
