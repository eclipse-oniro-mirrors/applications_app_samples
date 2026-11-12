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
// Form validation result interface
// ========================================

/**
 * Form validation result interface.
 * Contains the overall pass/fail flag and a field-to-error message map.
 */
export interface FormValidationResult {
  /** Whether the overall validation passed */
  isValid: boolean;
  /** Mapping from field names to error messages */
  errors: Map<string, string>;
}

// ========================================
// Field validation rule interface
// ========================================

/**
 * Field validation rule interface.
 * Defines the validation constraints applicable to a single form field.
 */
export interface FieldRule {
  /** Whether the field is required */
  required: boolean;
  /** Minimum length limit (optional) */
  minLength?: number;
  /** Maximum length limit (optional) */
  maxLength?: number;
  /** Regular expression pattern matching (optional) */
  pattern?: RegExp;
  /** Custom validation function (optional) */
  customValidator?: (value: string) => string | null;
}

// ========================================
// Single field validation result interface
// ========================================

/**
 * Single field validation result interface.
 * Contains whether the field passed validation and the error description.
 */
export interface FieldValidationResult {
  /** Whether the field validation passed */
  valid: boolean;
  /** Error description when validation fails, null when passed */
  error: string | null;
}

// ========================================
// Form validation utility class
// ========================================

/**
 * Form validation utility class.
 * Provides rule-based form field validation, supporting required checks,
 * length limits, regex matching and custom validators.
 */
export class FormValidator {
  /** Mapping from field names to validation rules */
  private rules: Map<string, FieldRule> = new Map();

  // ========================================
  // Rule management
  // ========================================

  /**
   * Adds a validation rule for the specified field.
   * Overwrites the existing rule when the field already has one.
   * @param {string} fieldName - Form field name
   * @param {FieldRule} rule - Validation rule configuration
   */
  addRule(fieldName: string, rule: FieldRule): void {
    hilog.info(DOMAIN, TAG, 'FormValidator addRule: field=%{public}s, required=%{public}s',
      fieldName, rule.required.toString());
    this.rules.set(fieldName, rule);
    hilog.debug(DOMAIN, TAG, 'FormValidator addRule: total rules=%{public}d', this.rules.size);
  }

  /**
   * Removes the validation rule of the specified field.
   * @param {string} fieldName - Field name whose rule is to be removed
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
   * Clears all registered validation rules.
   */
  clearRules(): void {
    hilog.info(DOMAIN, TAG, 'FormValidator clearRules: clearing all %{public}d rules', this.rules.size);
    this.rules.clear();
  }

  /**
   * Gets the number of currently registered rules.
   * @returns {number} Total number of rules
   */
  getRuleCount(): number {
    hilog.debug(DOMAIN, TAG, 'FormValidator getRuleCount: %{public}d', this.rules.size);
    return this.rules.size;
  }

  // ========================================
  // Form validation
  // ========================================

  /**
   * Validates the entire form.
   * Iterates over all fields with registered rules and checks them one by one.
   * @param {Map<string, string>} fields - Mapping from form field names to values
   * @returns {FormValidationResult} Validation result with pass flag and error messages
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
   * Validates a single field.
   * Checks required, minimum length, maximum length, regex pattern and custom
   * validator in order; error texts come from validate_field_* resources in string.json.
   * @param {string} name - Field name
   * @param {string} value - Field value
   * @returns {FieldValidationResult} Field validation result
   */
  validateField(name: string, value: string): FieldValidationResult {
    const rule: FieldRule | undefined = this.rules.get(name);

    if (!rule) {
      hilog.debug(DOMAIN, TAG, 'FormValidator validateField: no rule for field=%{public}s, passing', name);
      return { valid: true, error: null };
    }

    hilog.debug(DOMAIN, TAG, 'FormValidator validateField: checking field=%{public}s', name);

    // Required check
    if (rule.required && value.trim().length === 0) {
      return { valid: false, error: ResourceHelper.getStringByName('validate_field_required', name) };
    }

    // Skip subsequent rule checks when the value is empty
    if (value.length === 0) {
      return { valid: true, error: null };
    }

    // Minimum length check
    if (rule.minLength !== undefined && value.length < rule.minLength) {
      return {
        valid: false,
        error: ResourceHelper.getStringByName('validate_field_min_length', name, rule.minLength)
      };
    }

    // Maximum length check
    if (rule.maxLength !== undefined && value.length > rule.maxLength) {
      return {
        valid: false,
        error: ResourceHelper.getStringByName('validate_field_max_length', name, rule.maxLength)
      };
    }

    // Regex pattern match
    if (rule.pattern !== undefined && !rule.pattern.test(value)) {
      return { valid: false, error: ResourceHelper.getStringByName('validate_field_pattern', name) };
    }

    // Custom validator
    if (rule.customValidator !== undefined) {
      const customError: string | null = rule.customValidator(value);
      if (customError !== null) {
        return { valid: false, error: customError };
      }
    }

    return { valid: true, error: null };
  }

  // ========================================
  // Built-in validators (static methods)
  // ========================================

  /**
   * Validates whether a string is a legal email address.
   * @param {string} value - String to validate
   * @returns {boolean} Whether it is a valid email format
   */
  static isEmail(value: string): boolean {
    const emailPattern: RegExp = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    const result: boolean = emailPattern.test(value);
    hilog.debug(DOMAIN, TAG, 'FormValidator isEmail: result=%{public}s', result.toString());
    return result;
  }

  /**
   * Validates whether a string is a legal mobile phone number.
   * Supports the 11-digit mainland China mobile number format.
   * @param {string} value - String to validate
   * @returns {boolean} Whether it is a valid phone number format
   */
  static isPhone(value: string): boolean {
    const phonePattern: RegExp = /^1[3-9]\d{9}$/;
    const result: boolean = phonePattern.test(value);
    hilog.debug(DOMAIN, TAG, 'FormValidator isPhone: result=%{public}s', result.toString());
    return result;
  }

  /**
   * Validates whether a string is a legal URL.
   * Supports http, https and ftp protocols.
   * @param {string} value - String to validate
   * @returns {boolean} Whether it is a valid URL
   */
  static isUrl(value: string): boolean {
    const urlPattern: RegExp = /^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$/i;
    const result: boolean = urlPattern.test(value);
    hilog.debug(DOMAIN, TAG, 'FormValidator isUrl: result=%{public}s', result.toString());
    return result;
  }

  /**
   * Validates whether a string is non-empty.
   * Checks whether the length is greater than zero after trimming whitespace.
   * @param {string} value - String to validate
   * @returns {boolean} Whether non-empty
   */
  static isNotEmpty(value: string): boolean {
    const result: boolean = value.trim().length > 0;
    hilog.debug(DOMAIN, TAG, 'FormValidator isNotEmpty: result=%{public}s', result.toString());
    return result;
  }

  /**
   * Validates whether a string matches the given regular expression.
   * @param {string} value - String to validate
   * @param {RegExp} pattern - Matching pattern
   * @returns {boolean} Whether it matches
   */
  static matchesPattern(value: string, pattern: RegExp): boolean {
    const result: boolean = pattern.test(value);
    hilog.debug(DOMAIN, TAG, 'FormValidator matchesPattern: result=%{public}s', result.toString());
    return result;
  }
}
