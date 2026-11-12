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
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { FormValidator } from 'library';
import type { FormValidationResult, FieldRule } from 'library';
import { TestRes } from '../Utils/TestRes';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * FormValidator form validation utility test suite.
 * Covers all public methods including rule management, field validation, and built-in validators.
 */
export default function FormValidatorTest(): void {
  describe('FormValidatorTest', () => {

    // ========================================
    // Rule management
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_0100
     * @tc.name testValidationFormValidator0001
     * @tc.desc Verify getRuleCount increases after adding a rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationFormValidator0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0001 begin');
      const validator: FormValidator = new FormValidator();
      expect(validator.getRuleCount()).assertEqual(0);
      const rule: FieldRule = { required: true, minLength: 3 };
      validator.addRule('username', rule);
      expect(validator.getRuleCount()).assertEqual(1);
      validator.addRule('email', { required: true });
      expect(validator.getRuleCount()).assertEqual(2);
    });

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_0200
     * @tc.name testValidationFormValidator0002
     * @tc.desc Verify getRuleCount decreases after removing a rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationFormValidator0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0002 begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule('username', { required: true });
      validator.addRule('email', { required: true });
      expect(validator.getRuleCount()).assertEqual(2);
      validator.removeRule('username');
      expect(validator.getRuleCount()).assertEqual(1);
      validator.removeRule('nonexistent');
      expect(validator.getRuleCount()).assertEqual(1);
    });

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_0300
     * @tc.name testValidationFormValidator0003
     * @tc.desc Verify the rule count returns to zero after clearRules
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationFormValidator0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0003 begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule('a', { required: true });
      validator.addRule('b', { required: false });
      validator.addRule('c', { required: true, minLength: 5 });
      expect(validator.getRuleCount()).assertEqual(3);
      validator.clearRules();
      expect(validator.getRuleCount()).assertEqual(0);
      const fields: Map<string, string> = new Map();
      fields.set('a', '');
      const result: FormValidationResult = validator.validate(fields);
      expect(result.isValid).assertTrue();
    });

    // ========================================
    // Field validation - required checks
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_0400
     * @tc.name testValidationFormValidator0004
     * @tc.desc Verify a required field fails validation when empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationFormValidator0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0004 begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule('username', { required: true });
      const fields: Map<string, string> = new Map();
      fields.set('username', '');
      const result: FormValidationResult = validator.validate(fields);
      expect(result.isValid).assertFalse();
      expect(result.errors.size).assertEqual(1);
      expect(result.errors.get('username')?.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_0500
     * @tc.name testValidationFormValidator0005
     * @tc.desc Verify a required field passes validation when it has a value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationFormValidator0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0005 begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule('username', { required: true });
      const fields: Map<string, string> = new Map();
      fields.set('username', 'testUser');
      const result: FormValidationResult = validator.validate(fields);
      expect(result.isValid).assertTrue();
      expect(result.errors.size).assertEqual(0);
      const fieldResult = validator.validateField('username', 'testUser');
      expect(fieldResult.valid).assertTrue();
    });

    // ========================================
    // Field validation - length limits
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_0600
     * @tc.name testValidationFormValidator0006
     * @tc.desc Verify a field shorter than minLength fails validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationFormValidator0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0006 begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule('password', { required: true, minLength: 8 });
      const fields: Map<string, string> = new Map();
      fields.set('password', 'abc');
      const result: FormValidationResult = validator.validate(fields);
      expect(result.isValid).assertFalse();
      expect(result.errors.has('password')).assertTrue();
      const fieldResult = validator.validateField('password', 'abc');
      expect(fieldResult.valid).assertFalse();
    });

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_0700
     * @tc.name testValidationFormValidator0007
     * @tc.desc Verify a field longer than maxLength fails validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationFormValidator0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0007 begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule('name', { required: false, maxLength: 5 });
      const fields: Map<string, string> = new Map();
      fields.set('name', 'abcdefghij');
      const result: FormValidationResult = validator.validate(fields);
      expect(result.isValid).assertFalse();
      expect(result.errors.has('name')).assertTrue();
      const passResult = validator.validateField('name', 'abc');
      expect(passResult.valid).assertTrue();
    });

    // ========================================
    // Field validation - regex pattern
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_0800
     * @tc.name testValidationFormValidator0008
     * @tc.desc Verify validation fails when the pattern does not match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationFormValidator0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0008 begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule('code', { required: false, pattern: /^\d{6}$/ });
      const failResult = validator.validateField('code', 'abc');
      expect(failResult.valid).assertFalse();
      expect(failResult.error).assertEqual(TestRes.str1('validate_field_pattern', 'code'));
      const passResult = validator.validateField('code', '123456');
      expect(passResult.valid).assertTrue();
      expect(passResult.error).assertNull();
    });

    // ========================================
    // Field validation - custom validator
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_0900
     * @tc.name testValidationFormValidator0009
     * @tc.desc Verify validation fails when the custom validator returns an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationFormValidator0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0009 begin');
      const validator: FormValidator = new FormValidator();
      const customFn = (value: string): string | null => {
        if (value.indexOf('admin') >= 0) {
          return '不允许包含 admin';
        }
        return null;
      };
      validator.addRule('username', { required: false, customValidator: customFn });
      const failResult = validator.validateField('username', 'adminUser');
      expect(failResult.valid).assertFalse();
      expect(failResult.error).assertEqual('不允许包含 admin');
      const passResult = validator.validateField('username', 'testUser');
      expect(passResult.valid).assertTrue();
      expect(passResult.error).assertNull();
    });

    // ========================================
    // Validation of fields without rules
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_1000
     * @tc.name testValidationFormValidator0010
     * @tc.desc Verify a field with no registered rule passes validation directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationFormValidator0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0010 begin');
      const validator: FormValidator = new FormValidator();
      const result = validator.validateField('unknown', 'anything');
      expect(result.valid).assertTrue();
      expect(result.error).assertNull();
      const fields: Map<string, string> = new Map();
      fields.set('unknown', '');
      const formResult: FormValidationResult = validator.validate(fields);
      expect(formResult.isValid).assertTrue();
      expect(formResult.errors.size).assertEqual(0);
    });

    // ========================================
    // Built-in static validators
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_1100
     * @tc.name testValidationFormValidator0011
     * @tc.desc Verify isEmail validates valid/invalid emails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationFormValidator0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0011 begin');
      expect(FormValidator.isEmail('test@example.com')).assertTrue();
      expect(FormValidator.isEmail('user.name+tag@domain.co')).assertTrue();
      expect(FormValidator.isEmail('invalid-email')).assertFalse();
      expect(FormValidator.isEmail('@no-local.com')).assertFalse();
      expect(FormValidator.isEmail('')).assertFalse();
    });

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_1200
     * @tc.name testValidationFormValidator0012
     * @tc.desc Verify isPhone validates valid/invalid phone numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationFormValidator0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0012 begin');
      expect(FormValidator.isPhone('13800138000')).assertTrue();
      expect(FormValidator.isPhone('15912345678')).assertTrue();
      expect(FormValidator.isPhone('12345678901')).assertFalse();
      expect(FormValidator.isPhone('1380013800')).assertFalse();
      expect(FormValidator.isPhone('')).assertFalse();
    });

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_1300
     * @tc.name testValidationFormValidator0013
     * @tc.desc Verify isUrl validates valid/invalid URLs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationFormValidator0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0013 begin');
      expect(FormValidator.isUrl('https://www.example.com')).assertTrue();
      expect(FormValidator.isUrl('http://localhost:8080/path')).assertTrue();
      expect(FormValidator.isUrl('ftp://files.example.com')).assertTrue();
      expect(FormValidator.isUrl('not-a-url')).assertFalse();
      expect(FormValidator.isUrl('')).assertFalse();
    });

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_1400
     * @tc.name testValidationFormValidator0014
     * @tc.desc Verify isNotEmpty validates non-empty values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationFormValidator0014', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0014 begin');
      expect(FormValidator.isNotEmpty('hello')).assertTrue();
      expect(FormValidator.isNotEmpty('  a  ')).assertTrue();
      expect(FormValidator.isNotEmpty('')).assertFalse();
      expect(FormValidator.isNotEmpty('   ')).assertFalse();
    });

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_1500
     * @tc.name testValidationFormValidator0015
     * @tc.desc Verify matchesPattern validates against a regex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationFormValidator0015', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0015 begin');
      const pattern: RegExp = /^[A-Z]{3}$/;
      expect(FormValidator.matchesPattern('ABC', pattern)).assertTrue();
      expect(FormValidator.matchesPattern('abc', pattern)).assertFalse();
      expect(FormValidator.matchesPattern('ABCD', pattern)).assertFalse();
    });

    // ========================================
    // Combined multi-field validation
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_1600
     * @tc.name testValidationFormValidator0016
     * @tc.desc Verify combined multi-field validation with partial failures
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationFormValidator0016', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0016 begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule('username', { required: true, minLength: 3 });
      validator.addRule('email', { required: true });
      validator.addRule('age', { required: false });
      const fields: Map<string, string> = new Map();
      fields.set('username', 'ab');
      fields.set('email', '');
      fields.set('age', '25');
      const result: FormValidationResult = validator.validate(fields);
      expect(result.isValid).assertFalse();
      expect(result.errors.size).assertEqual(2);
      expect(result.errors.has('username')).assertTrue();
      expect(result.errors.has('email')).assertTrue();
    });

    // ========================================
    // Boundary: whitespace-only required field
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_FORM_VALIDATOR_1700
     * @tc.name testValidationFormValidator0017
     * @tc.desc Verify a whitespace-only required field fails validation (empty after trim)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationFormValidator0017', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationFormValidator0017 begin');
      const validator: FormValidator = new FormValidator();
      validator.addRule('name', { required: true });
      const fields: Map<string, string> = new Map();
      fields.set('name', '   ');
      const result: FormValidationResult = validator.validate(fields);
      expect(result.isValid).assertFalse();
      expect(result.errors.has('name')).assertTrue();
      const fieldResult = validator.validateField('name', '   ');
      expect(fieldResult.valid).assertFalse();
    });
  });
}
