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
// 表单验证结果接口
// ========================================

/**
 * 表单验证结果接口。
 * 包含验证是否通过以及各字段的错误信息映射。
 */
export interface FormValidationResult {
  /** 整体验证是否通过 */
  isValid: boolean;
  /** 字段名到错误信息的映射表 */
  errors: Map<string, string>;
}

// ========================================
// 字段验证规则接口
// ========================================

/**
 * 字段验证规则接口。
 * 定义单个表单字段可应用的验证约束。
 */
export interface FieldRule {
  /** 是否为必填字段 */
  required: boolean;
  /** 最小长度限制（可选） */
  minLength?: number;
  /** 最大长度限制（可选） */
  maxLength?: number;
  /** 正则表达式模式匹配（可选） */
  pattern?: RegExp;
  /** 自定义验证函数（可选） */
  customValidator?: (value: string) => string | null;
}

// ========================================
// 单字段验证结果接口
// ========================================

/**
 * 单字段验证结果接口。
 * 包含字段验证是否通过及错误描述。
 */
export interface FieldValidationResult {
  /** 字段验证是否通过 */
  valid: boolean;
  /** 验证失败时的错误描述，通过时为 null */
  error: string | null;
}

// ========================================
// 表单验证工具类
// ========================================

/**
 * 表单验证工具类。
 * 提供基于规则的表单字段验证能力，
 * 支持必填检查、长度限制、正则匹配和自定义验证器。
 */
export class FormValidator {
  /** 字段名到验证规则的映射 */
  private rules: Map<string, FieldRule> = new Map();

  // ========================================
  // 规则管理
  // ========================================

  /**
   * 为指定字段添加验证规则。
   * 如果字段已存在规则，则覆盖更新。
   * @param {string} fieldName - 表单字段名称
   * @param {FieldRule} rule - 验证规则配置
   */
  addRule(fieldName: string, rule: FieldRule): void {
    hilog.info(DOMAIN, TAG, 'FormValidator addRule: field=%{public}s, required=%{public}s',
      fieldName, rule.required.toString());
    this.rules.set(fieldName, rule);
    hilog.debug(DOMAIN, TAG, 'FormValidator addRule: total rules=%{public}d', this.rules.size);
  }

  /**
   * 移除指定字段的验证规则。
   * @param {string} fieldName - 要移除规则的字段名称
   */
  removeRule(fieldName: string): void {
    hilog.info(DOMAIN, TAG, 'FormValidator removeRule: field=%{public}s', fieldName);
    const removed: boolean = this.rules.delete(fieldName);
    if (removed) {
      hilog.debug(DOMAIN, TAG, 'FormValidator removeRule: rule removed successfully');
    } else {
      hilog.warn(DOMAIN, TAG, 'FormValidator removeRule: rule not found for field=%{public}s', fieldName);
    }
  }

  /**
   * 清除所有已注册的验证规则。
   */
  clearRules(): void {
    hilog.info(DOMAIN, TAG, 'FormValidator clearRules: clearing all %{public}d rules', this.rules.size);
    this.rules.clear();
  }

  /**
   * 获取当前已注册的规则数量。
   * @returns {number} 规则总数
   */
  getRuleCount(): number {
    hilog.debug(DOMAIN, TAG, 'FormValidator getRuleCount: %{public}d', this.rules.size);
    return this.rules.size;
  }

  // ========================================
  // 表单验证
  // ========================================

  /**
   * 对整张表单执行验证。
   * 遍历所有已注册规则的字段，逐一进行校验。
   * @param {Map<string, string>} fields - 表单字段名到值的映射
   * @returns {FormValidationResult} 验证结果，包含是否通过和错误信息
   */
  validate(fields: Map<string, string>): FormValidationResult {
    hilog.info(DOMAIN, TAG, 'FormValidator validate: validating %{public}d fields', fields.size);
    const errors: Map<string, string> = new Map();

    this.rules.forEach((rule: FieldRule, fieldName: string) => {
      const value: string | undefined = fields.get(fieldName);
      const fieldValue: string = value ?? '';
      const result: FieldValidationResult = this.validateField(fieldName, fieldValue);

      if (!result.valid && result.error !== null) {
        errors.set(fieldName, result.error);
        hilog.warn(DOMAIN, TAG, 'FormValidator validate: field=%{public}s error=%{public}s',
          fieldName, result.error);
      }
    });

    const isValid: boolean = errors.size === 0;
    hilog.info(DOMAIN, TAG, 'FormValidator validate: result isValid=%{public}s, errorCount=%{public}d',
      isValid.toString(), errors.size);

    return { isValid, errors };
  }

  /**
   * 对单个字段执行验证。
   * 按顺序检查必填、最小长度、最大长度、正则模式和自定义验证器。
   * @param {string} name - 字段名称
   * @param {string} value - 字段值
   * @returns {FieldValidationResult} 字段验证结果
   */
  validateField(name: string, value: string): FieldValidationResult {
    const rule: FieldRule | undefined = this.rules.get(name);

    if (!rule) {
      hilog.debug(DOMAIN, TAG, 'FormValidator validateField: no rule for field=%{public}s, passing', name);
      return { valid: true, error: null };
    }

    hilog.debug(DOMAIN, TAG, 'FormValidator validateField: checking field=%{public}s', name);

    // 必填检查
    if (rule.required && value.trim().length === 0) {
      return { valid: false, error: `${name} 为必填项` };
    }

    // 非空时才继续后续检查
    if (value.length > 0) {
      // 最小长度检查
      if (rule.minLength !== undefined && value.length < rule.minLength) {
        return { valid: false, error: `${name} 长度不能少于 ${rule.minLength} 个字符` };
      }

      // 最大长度检查
      if (rule.maxLength !== undefined && value.length > rule.maxLength) {
        return { valid: false, error: `${name} 长度不能超过 ${rule.maxLength} 个字符` };
      }

      // 正则模式匹配
      if (rule.pattern !== undefined && !rule.pattern.test(value)) {
        return { valid: false, error: `${name} 格式不正确` };
      }

      // 自定义验证器
      if (rule.customValidator !== undefined) {
        const customError: string | null = rule.customValidator(value);
        if (customError !== null) {
          return { valid: false, error: customError };
        }
      }
    }

    return { valid: true, error: null };
  }

  // ========================================
  // 内置验证器（静态方法）
  // ========================================

  /**
   * 验证字符串是否为合法的电子邮件地址。
   * @param {string} value - 待验证的字符串
   * @returns {boolean} 是否为合法邮箱格式
   */
  static isEmail(value: string): boolean {
    const emailPattern: RegExp = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    const result: boolean = emailPattern.test(value);
    hilog.debug(DOMAIN, TAG, 'FormValidator isEmail: result=%{public}s', result.toString());
    return result;
  }

  /**
   * 验证字符串是否为合法的手机号码。
   * 支持中国大陆 11 位手机号格式。
   * @param {string} value - 待验证的字符串
   * @returns {boolean} 是否为合法手机号格式
   */
  static isPhone(value: string): boolean {
    const phonePattern: RegExp = /^1[3-9]\d{9}$/;
    const result: boolean = phonePattern.test(value);
    hilog.debug(DOMAIN, TAG, 'FormValidator isPhone: result=%{public}s', result.toString());
    return result;
  }

  /**
   * 验证字符串是否为合法的 URL 地址。
   * 支持 http、https、ftp 协议。
   * @param {string} value - 待验证的字符串
   * @returns {boolean} 是否为合法 URL
   */
  static isUrl(value: string): boolean {
    const urlPattern: RegExp = /^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$/i;
    const result: boolean = urlPattern.test(value);
    hilog.debug(DOMAIN, TAG, 'FormValidator isUrl: result=%{public}s', result.toString());
    return result;
  }

  /**
   * 验证字符串是否非空。
   * 去除首尾空白后判断长度是否大于零。
   * @param {string} value - 待验证的字符串
   * @returns {boolean} 是否非空
   */
  static isNotEmpty(value: string): boolean {
    const result: boolean = value.trim().length > 0;
    hilog.debug(DOMAIN, TAG, 'FormValidator isNotEmpty: result=%{public}s', result.toString());
    return result;
  }

  /**
   * 验证字符串是否匹配指定的正则表达式。
   * @param {string} value - 待验证的字符串
   * @param {RegExp} pattern - 匹配模式
   * @returns {boolean} 是否匹配
   */
  static matchesPattern(value: string, pattern: RegExp): boolean {
    const result: boolean = pattern.test(value);
    hilog.debug(DOMAIN, TAG, 'FormValidator matchesPattern: result=%{public}s', result.toString());
    return result;
  }
}
