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
 * form validation result interface
 */
export interface FormValidationResult {
  isValid: boolean;
  errors: Map<string, string>;
  fieldCount: number;
}

/**
 * field rule interface
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
 * form validator class
 * provides form field validate capability
 */
export class FormValidator {
  /** validation rule list */
  private rules: FieldRule[] = [];

  /**
   * add validation rule
   * @param rule - field rule rule
   */
  addRule(rule: FieldRule): void {
    this.rules.push(rule);
  }

  /**
   * remove rules of the specified field
   * @param fieldName - field name name
   */
  removeRule(fieldName: string): void {
    this.rules = this.rules.filter((r: FieldRule) => r.fieldName !== fieldName);
  }

  /**
   * clear all rules
   */
  clearRules(): void {
    this.rules = [];
  }

  /**
   * validate form data
   * @param data - form data
   * @returns validation result
   */
  validate(data: Record<string, string>): FormValidationResult {
    const errors: Map<string, string> = new Map();
    for (const rule of this.rules) {
      const value: string = data[rule.fieldName] || '';
      // check required fill
      if (rule.required && (!value || value.trim().length === 0)) {
        errors.set(rule.fieldName, rule.fieldName + ' is required');
        continue;
      }
      // check min length degree
      if (rule.minLength !== undefined && value.length < rule.minLength) {
        errors.set(rule.fieldName, rule.fieldName + ' too short (min ' + rule.minLength + ')');
        continue;
      }
      // check max length degree
      if (rule.maxLength !== undefined && value.length > rule.maxLength) {
        errors.set(rule.fieldName, rule.fieldName + ' too long (max ' + rule.maxLength + ')');
        continue;
      }
      // check correct rule
      if (rule.pattern && !rule.pattern.test(value)) {
        errors.set(rule.fieldName, rule.fieldName + ' format invalid');
        continue;
      }
      // custom validation
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
   * get rule count
   * @returns rule rule number amount
   */
  getRuleCount(): number {
    return this.rules.length;
  }

  /**
   * check whether the specified field has rules
   * @param fieldName - field name name
   * @returns whether have rule rule
   */
  hasRule(fieldName: string): boolean {
    return this.rules.some((r: FieldRule) => r.fieldName === fieldName);
  }

  /**
   * create Bluetooth device form validator
   * @returns configured form validator
   */
  static createBluetoothDeviceValidator(): FormValidator {
    const validator: FormValidator = new FormValidator();
    validator.addRule({ fieldName: 'deviceName', required: true, minLength: 1, maxLength: 248 });
    validator.addRule({ fieldName: 'macAddress', required: true,
        customValidator: (v: string) => ValidationUtils.validateMacAddress(v) });
    return validator;
  }

  /**
   * create connection config form validator
   * @returns configured form validator
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
