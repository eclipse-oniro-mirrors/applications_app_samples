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

import { ValidationUtils, ValidationResult } from './ValidationUtils';

/**
 * 表单验证结果接口
 */
export interface FormValidationResult {
  isValid: boolean;
  errors: Map<string, string>;
  fieldCount: number;
}

/**
 * 字段规则接口
 */
export interface FieldRule {
  fieldName: string;
  required: boolean;
  minLength?: number;
  maxLength?: number;
  pattern?: RegExp;
  customValidator?: (value: string) => ValidationResult;
}

/**
 * 表单验证器类
 * 提供表单字段验证能力
 */
export class FormValidator {
  /** 验证规则列表 */
  private rules: FieldRule[] = [];

  /**
   * 添加验证规则
   * @param rule - 字段规则
   */
  addRule(rule: FieldRule): void {
    this.rules.push(rule);
  }

  /**
   * 移除指定字段的规则
   * @param fieldName - 字段名称
   */
  removeRule(fieldName: string): void {
    this.rules = this.rules.filter((r: FieldRule) => r.fieldName !== fieldName);
  }

  /**
   * 清除所有规则
   */
  clearRules(): void {
    this.rules = [];
  }

  /**
   * 验证表单数据
   * @param data - 表单数据
   * @returns 验证结果
   */
  validate(data: Record<string, string>): FormValidationResult {
    const errors: Map<string, string> = new Map();
    for (const rule of this.rules) {
      const value: string = data[rule.fieldName] || '';
      // 检查必填
      if (rule.required && (!value || value.trim().length === 0)) {
        errors.set(rule.fieldName, rule.fieldName + ' is required');
        continue;
      }
      // 检查最小长度
      if (rule.minLength !== undefined && value.length < rule.minLength) {
        errors.set(rule.fieldName, rule.fieldName + ' too short (min ' + rule.minLength + ')');
        continue;
      }
      // 检查最大长度
      if (rule.maxLength !== undefined && value.length > rule.maxLength) {
        errors.set(rule.fieldName, rule.fieldName + ' too long (max ' + rule.maxLength + ')');
        continue;
      }
      // 检查正则
      if (rule.pattern && !rule.pattern.test(value)) {
        errors.set(rule.fieldName, rule.fieldName + ' format invalid');
        continue;
      }
      // 自定义验证
      if (rule.customValidator && value.length > 0) {
        const result: ValidationResult = rule.customValidator(value);
        if (!result.isValid) {
          errors.set(rule.fieldName, result.errorMessage);
        }
      }
    }
    return {
      isValid: errors.size === 0,
      errors: errors,
      fieldCount: this.rules.length
    };
  }

  /**
   * 获取规则数量
   * @returns 规则数量
   */
  getRuleCount(): number {
    return this.rules.length;
  }

  /**
   * 检查是否有指定字段的规则
   * @param fieldName - 字段名称
   * @returns 是否有规则
   */
  hasRule(fieldName: string): boolean {
    return this.rules.some((r: FieldRule) => r.fieldName === fieldName);
  }

  /**
   * 创建蓝牙设备表单验证器
   * @returns 配置好的表单验证器
   */
  static createBluetoothDeviceValidator(): FormValidator {
    const validator: FormValidator = new FormValidator();
    validator.addRule({ fieldName: 'deviceName', required: true, minLength: 1, maxLength: 248 });
    validator.addRule({ fieldName: 'macAddress', required: true, customValidator: (v: string) => ValidationUtils.validateMacAddress(v) });
    return validator;
  }

  /**
   * 创建连接配置表单验证器
   * @returns 配置好的表单验证器
   */
  static createConnectionConfigValidator(): FormValidator {
    const validator: FormValidator = new FormValidator();
    validator.addRule({ fieldName: 'deviceId', required: true });
    validator.addRule({ fieldName: 'profileType', required: true });
    validator.addRule({ fieldName: 'timeout', required: false, customValidator: (v: string) => {
      const num: number = Number(v);
      if (isNaN(num) || num < 0) {
        return { isValid: false, errorMessage: 'Invalid timeout', errorCode: 1 };
      }
      return { isValid: true, errorMessage: '', errorCode: 0 };
    }});
    return validator;
  }
}
