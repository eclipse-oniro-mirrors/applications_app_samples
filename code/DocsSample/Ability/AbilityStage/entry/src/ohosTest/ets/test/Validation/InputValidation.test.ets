/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver, Component } from '@ohos.UiTest';
import {
  getDriver,
  getBundleName,
  logInfo,
  waitForIndexPageStable,
  isIndexPageVisible,
  pageComponentCount,
  findComponentsByType,
  checkTextContent,
  getCurrentFocusIndex,
  triggerEntryAbility,
  TIMEOUT_PAGE_RENDER,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  BUNDLE_NAME,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum ValidationCode {
  OK = 0,
  EMPTY_VALUE = 100,
  TOO_SHORT = 101,
  TOO_LONG = 102,
  INVALID_CHARSET = 103,
  WHITESPACE_ONLY = 104,
  OUT_OF_RANGE = 200,
  NOT_INTEGER = 201,
  NOT_A_NUMBER = 202,
  NEGATIVE_VALUE = 203,
  UNKNOWN_ENUM = 300,
  ARRAY_EMPTY = 400,
  ARRAY_TOO_LARGE = 401,
  ARRAY_DUPLICATE = 402,
  TYPE_MISMATCH = 500
}

enum TextFieldKind {
  USER_NAME = 'user_name',
  PAGE_KEY = 'page_key',
  ABILITY_NAME = 'ability_name',
  LOG_TAG = 'log_tag'
}

enum SortOrder {
  ASCENDING = 'asc',
  DESCENDING = 'desc',
  NONE = 'none'
}

interface ValidationRule {
  minLength: number;
  maxLength: number;
  allowSpace: boolean;
  required: boolean;
}

interface ValidationResult {
  code: ValidationCode;
  field: string;
  value: string;
  message: string;
  passed: boolean;
}

interface NumericRule {
  min: number;
  max: number;
  allowFraction: boolean;
}

interface NumericResult {
  code: ValidationCode;
  raw: number;
  normalized: number;
  message: string;
}

interface ArrayResult {
  code: ValidationCode;
  length: number;
  message: string;
}

class TextValidator {
  private rule: ValidationRule;
  private kind: TextFieldKind;

  public constructor(kind: TextFieldKind, rule: ValidationRule) {
    this.kind = kind;
    this.rule = rule;
  }

  public getKind(): TextFieldKind {
    return this.kind;
  }

  public getRule(): ValidationRule {
    return this.rule;
  }

  public validate(raw: string): ValidationResult {
    const trimmed: string = raw.trim();
    if (trimmed.length === 0) {
      if (this.rule.required) {
        return this.result(ValidationCode.EMPTY_VALUE, raw, 'value is empty');
      }
      return this.result(ValidationCode.OK, raw, 'optional value empty');
    }
    if (trimmed.length !== raw.length && !this.rule.allowSpace) {
      return this.result(ValidationCode.WHITESPACE_ONLY, raw, 'surrounding whitespace not allowed');
    }
    if (!this.rule.allowSpace && raw.indexOf(' ') >= 0) {
      return this.result(ValidationCode.INVALID_CHARSET, raw, 'space inside value not allowed');
    }
    if (trimmed.length < this.rule.minLength) {
      return this.result(ValidationCode.TOO_SHORT, raw, 'value shorter than minimum');
    }
    if (trimmed.length > this.rule.maxLength) {
      return this.result(ValidationCode.TOO_LONG, raw, 'value longer than maximum');
    }
    return this.result(ValidationCode.OK, raw, 'value accepted');
  }

  public normalized(raw: string): string {
    return raw.trim();
  }

  private result(code: ValidationCode, value: string, message: string): ValidationResult {
    const result: ValidationResult = {
      code: code,
      field: this.kind,
      value: value,
      message: message,
      passed: code === ValidationCode.OK
    };
    return result;
  }
}

class NumericValidator {
  private rule: NumericRule;

  public constructor(rule: NumericRule) {
    this.rule = rule;
  }

  public validate(value: number): NumericResult {
    if (isNaN(value) || !isFinite(value)) {
      return this.build(ValidationCode.NOT_A_NUMBER, value, 0, 'value is not a finite number');
    }
    if (value < this.rule.min) {
      return this.build(ValidationCode.OUT_OF_RANGE, value, this.rule.min, 'value below minimum');
    }
    if (value > this.rule.max) {
      return this.build(ValidationCode.OUT_OF_RANGE, value, this.rule.max, 'value above maximum');
    }
    if (!this.rule.allowFraction && Math.floor(value) !== value) {
      return this.build(ValidationCode.NOT_INTEGER, value, Math.floor(value), 'value is not an integer');
    }
    if (value < 0) {
      return this.build(ValidationCode.NEGATIVE_VALUE, value, 0, 'value is negative');
    }
    return this.build(ValidationCode.OK, value, value, 'value accepted');
  }

  public clamp(value: number): number {
    if (isNaN(value) || !isFinite(value)) {
      return this.rule.min;
    }
    if (value < this.rule.min) {
      return this.rule.min;
    }
    if (value > this.rule.max) {
      return this.rule.max;
    }
    return value;
  }

  private build(code: ValidationCode, raw: number, normalized: number, message: string): NumericResult {
    const result: NumericResult = {
      code: code,
      raw: raw,
      normalized: normalized,
      message: message
    };
    return result;
  }
}

class BooleanValidator {
  public validate(raw: boolean, expected: boolean): ValidationCode {
    if (raw === expected) {
      return ValidationCode.OK;
    }
    return ValidationCode.TYPE_MISMATCH;
  }

  public parse(raw: string): boolean {
    return raw.toLowerCase() === 'true';
  }

  public negate(value: boolean): boolean {
    return !value;
  }
}

class EnumValidator {
  private allowed: string[];

  public constructor(allowed: string[]) {
    this.allowed = allowed;
  }

  public validate(value: string): ValidationCode {
    for (let i = 0; i < this.allowed.length; i++) {
      if (this.allowed[i] === value) {
        return ValidationCode.OK;
      }
    }
    return ValidationCode.UNKNOWN_ENUM;
  }

  public allowedCount(): number {
    return this.allowed.length;
  }

  public contains(value: string): boolean {
    return this.validate(value) === ValidationCode.OK;
  }
}

class ArrayValidator {
  private maxSize: number;
  private allowDuplicate: boolean;

  public constructor(maxSize: number, allowDuplicate: boolean) {
    this.maxSize = maxSize;
    this.allowDuplicate = allowDuplicate;
  }

  public validate(values: string[]): ArrayResult {
    if (values.length === 0) {
      return this.build(ValidationCode.ARRAY_EMPTY, 0, 'array is empty');
    }
    if (values.length > this.maxSize) {
      return this.build(ValidationCode.ARRAY_TOO_LARGE, values.length, 'array exceeds size limit');
    }
    if (!this.allowDuplicate) {
      for (let i = 0; i < values.length; i++) {
        for (let j = i + 1; j < values.length; j++) {
          if (values[i] === values[j]) {
            return this.build(ValidationCode.ARRAY_DUPLICATE, values.length, 'array contains duplicate');
          }
        }
      }
    }
    return this.build(ValidationCode.OK, values.length, 'array accepted');
  }

  public distinctCount(values: string[]): number {
    const seen: string[] = [];
    for (let i = 0; i < values.length; i++) {
      let found: boolean = false;
      for (let j = 0; j < seen.length; j++) {
        if (seen[j] === values[i]) {
          found = true;
          break;
        }
      }
      if (!found) {
        seen.push(values[i]);
      }
    }
    return seen.length;
  }

  private build(code: ValidationCode, length: number, message: string): ArrayResult {
    const result: ArrayResult = {
      code: code,
      length: length,
      message: message
    };
    return result;
  }
}

class CompositeValidator {
  private results: ValidationResult[] = [];

  public add(result: ValidationResult): CompositeValidator {
    this.results.push(result);
    return this;
  }

  public andPassed(): boolean {
    if (this.results.length === 0) {
      return false;
    }
    for (let i = 0; i < this.results.length; i++) {
      if (!this.results[i].passed) {
        return false;
      }
    }
    return true;
  }

  public orPassed(): boolean {
    for (let i = 0; i < this.results.length; i++) {
      if (this.results[i].passed) {
        return true;
      }
    }
    return false;
  }

  public firstFailureCode(): ValidationCode {
    for (let i = 0; i < this.results.length; i++) {
      if (!this.results[i].passed) {
        return this.results[i].code;
      }
    }
    return ValidationCode.OK;
  }

  public failureCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.results.length; i++) {
      if (!this.results[i].passed) {
        count++;
      }
    }
    return count;
  }

  public size(): number {
    return this.results.length;
  }

  public reset(): void {
    this.results = [];
  }
}

export default function inputValidationTest(): void {
  describe('InputValidationTest', () => {
    let driver: Driver;
    let pageKeyRule: ValidationRule;
    let abilityNameRule: ValidationRule;
    let scoreRule: NumericRule;

    beforeAll(async () => {
      driver = getDriver();
      pageKeyRule = {
        minLength: 3,
        maxLength: 16,
        allowSpace: false,
        required: true
      };
      abilityNameRule = {
        minLength: 4,
        maxLength: 32,
        allowSpace: true,
        required: true
      };
      scoreRule = {
        min: 0,
        max: 100,
        allowFraction: false
      };
      logInfo('InputValidationTest: beforeAll start');
      await triggerEntryAbility(driver);
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      logInfo('InputValidationTest: beforeAll finished');

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      driver = getDriver();
      await driver.delayMs(100);
      logInfo('InputValidationTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_0100
     * @tc.name testValidationCodeEnumValues
     * @tc.desc Verify validation codes reserve the documented numeric blocks for text numeric enum and array rules
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testValidationCodeEnumValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(ValidationCode.OK).assertEqual(0);
        expect(ValidationCode.EMPTY_VALUE).assertEqual(100);
        expect(ValidationCode.TOO_SHORT).assertEqual(101);
        expect(ValidationCode.TOO_LONG).assertEqual(102);
        expect(ValidationCode.INVALID_CHARSET).assertEqual(103);
        expect(ValidationCode.WHITESPACE_ONLY).assertEqual(104);
        expect(ValidationCode.OUT_OF_RANGE).assertEqual(200);
        expect(ValidationCode.NOT_INTEGER).assertEqual(201);
        expect(ValidationCode.NOT_A_NUMBER).assertEqual(202);
        expect(ValidationCode.NEGATIVE_VALUE).assertEqual(203);
        expect(ValidationCode.UNKNOWN_ENUM).assertEqual(300);
        expect(ValidationCode.ARRAY_EMPTY).assertEqual(400);
        expect(ValidationCode.ARRAY_TOO_LARGE).assertEqual(401);
        expect(ValidationCode.ARRAY_DUPLICATE).assertEqual(402);
        expect(ValidationCode.TYPE_MISMATCH).assertEqual(500);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_0200
     * @tc.name testTextValidatorAcceptsValidPageKey
     * @tc.desc Verify a trimmed lowercase page key inside length bounds returns OK and passes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTextValidatorAcceptsValidPageKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: TextValidator = new TextValidator(TextFieldKind.PAGE_KEY, pageKeyRule);
        const result: ValidationResult = validator.validate('index');
        expect(result.code).assertEqual(ValidationCode.OK);
        expect(result.passed).assertTrue();
        expect(result.value).assertEqual('index');
        expect(result.field).assertEqual(TextFieldKind.PAGE_KEY);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_0300
     * @tc.name testTextValidatorRejectsEmptyValue
     * @tc.desc Verify an empty required field returns empty-value code and marks the result as failed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTextValidatorRejectsEmptyValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: TextValidator = new TextValidator(TextFieldKind.USER_NAME, pageKeyRule);
        const result: ValidationResult = validator.validate('');
        expect(result.code).assertEqual(ValidationCode.EMPTY_VALUE);
        expect(result.passed).assertFalse();
        expect(result.message).assertEqual('value is empty');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_0400
     * @tc.name testTextValidatorRejectsWhitespaceOnly
     * @tc.desc Verify a whitespace-only required field collapses to empty and is rejected with empty-value code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTextValidatorRejectsWhitespaceOnly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: TextValidator = new TextValidator(TextFieldKind.PAGE_KEY, pageKeyRule);
        const result: ValidationResult = validator.validate('   ');
        expect(result.code).assertEqual(ValidationCode.EMPTY_VALUE);
        expect(result.passed).assertFalse();
        expect(validator.normalized('   ')).assertEqual('');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_0500
     * @tc.name testTextValidatorRejectsTooShort
     * @tc.desc Verify a two-character value below the three-character minimum returns too-short code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTextValidatorRejectsTooShort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: TextValidator = new TextValidator(TextFieldKind.PAGE_KEY, pageKeyRule);
        const result: ValidationResult = validator.validate('ab');
        expect(result.code).assertEqual(ValidationCode.TOO_SHORT);
        expect(result.passed).assertFalse();
        expect(result.message).assertEqual('value shorter than minimum');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_0600
     * @tc.name testTextValidatorAcceptsExactMinLength
     * @tc.desc Verify a value exactly at the minimum length boundary is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTextValidatorAcceptsExactMinLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: TextValidator = new TextValidator(TextFieldKind.PAGE_KEY, pageKeyRule);
        const result: ValidationResult = validator.validate('abc');
        expect(result.code).assertEqual(ValidationCode.OK);
        expect(result.passed).assertTrue();
        expect(result.value.length).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_0700
     * @tc.name testTextValidatorAcceptsExactMaxLength
     * @tc.desc Verify a sixteen-character value exactly at the maximum boundary is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTextValidatorAcceptsExactMaxLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: TextValidator = new TextValidator(TextFieldKind.PAGE_KEY, pageKeyRule);
        const value: string = 'abcdefghijklmnop';
        const result: ValidationResult = validator.validate(value);
        expect(value.length).assertEqual(16);
        expect(result.code).assertEqual(ValidationCode.OK);
        expect(result.passed).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_0800
     * @tc.name testTextValidatorRejectsTooLong
     * @tc.desc Verify a seventeen-character value one past the maximum returns too-long code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTextValidatorRejectsTooLong', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: TextValidator = new TextValidator(TextFieldKind.PAGE_KEY, pageKeyRule);
        const value: string = 'abcdefghijklmnopq';
        const result: ValidationResult = validator.validate(value);
        expect(value.length).assertEqual(17);
        expect(result.code).assertEqual(ValidationCode.TOO_LONG);
        expect(result.passed).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_0900
     * @tc.name testTextValidatorRejectsInnerSpace
     * @tc.desc Verify a value containing an inner space is rejected with invalid-charset when spaces are banned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTextValidatorRejectsInnerSpace', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: TextValidator = new TextValidator(TextFieldKind.PAGE_KEY, pageKeyRule);
        const result: ValidationResult = validator.validate('main page');
        expect(result.code).assertEqual(ValidationCode.INVALID_CHARSET);
        expect(result.passed).assertFalse();
        expect(result.message).assertEqual('space inside value not allowed');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_1000
     * @tc.name testTextValidatorAllowsSpaceWhenPermitted
     * @tc.desc Verify an ability name rule permitting spaces accepts a value with an inner space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTextValidatorAllowsSpaceWhenPermitted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: TextValidator = new TextValidator(TextFieldKind.ABILITY_NAME, abilityNameRule);
        const result: ValidationResult = validator.validate('Entry Ability');
        expect(result.code).assertEqual(ValidationCode.OK);
        expect(result.passed).assertTrue();
        expect(validator.getKind()).assertEqual(TextFieldKind.ABILITY_NAME);
        expect(validator.getRule().maxLength).assertEqual(32);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_1100
     * @tc.name testTextValidatorNormalizesSurroundingSpace
     * @tc.desc Verify normalization trims surrounding whitespace and the trimmed value then validates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTextValidatorNormalizesSurroundingSpace', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: TextValidator = new TextValidator(TextFieldKind.ABILITY_NAME, abilityNameRule);
        const raw: string = '  EntryAbility  ';
        const trimmed: string = validator.normalized(raw);
        expect(trimmed).assertEqual('EntryAbility');
        expect(trimmed.length).assertEqual(12);
        const result: ValidationResult = validator.validate(trimmed);
        expect(result.code).assertEqual(ValidationCode.OK);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_1200
     * @tc.name testNumericValidatorAcceptsInRangeInteger
     * @tc.desc Verify an integer inside the score range returns OK and keeps the raw value normalized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNumericValidatorAcceptsInRangeInteger', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: NumericValidator = new NumericValidator(scoreRule);
        const result: NumericResult = validator.validate(75);
        expect(result.code).assertEqual(ValidationCode.OK);
        expect(result.raw).assertEqual(75);
        expect(result.normalized).assertEqual(75);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_1300
     * @tc.name testNumericValidatorAcceptsLowerBound
     * @tc.desc Verify the zero lower bound is accepted as an in-range integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNumericValidatorAcceptsLowerBound', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: NumericValidator = new NumericValidator(scoreRule);
        const result: NumericResult = validator.validate(0);
        expect(result.code).assertEqual(ValidationCode.OK);
        expect(result.normalized).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_1400
     * @tc.name testNumericValidatorAcceptsUpperBound
     * @tc.desc Verify the one hundred upper bound is accepted as an in-range integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNumericValidatorAcceptsUpperBound', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: NumericValidator = new NumericValidator(scoreRule);
        const result: NumericResult = validator.validate(100);
        expect(result.code).assertEqual(ValidationCode.OK);
        expect(result.normalized).assertEqual(100);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_1500
     * @tc.name testNumericValidatorRejectsAboveUpperBound
     * @tc.desc Verify one hundred and one exceeds the upper bound and normalizes to the maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNumericValidatorRejectsAboveUpperBound', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: NumericValidator = new NumericValidator(scoreRule);
        const result: NumericResult = validator.validate(101);
        expect(result.code).assertEqual(ValidationCode.OUT_OF_RANGE);
        expect(result.raw).assertEqual(101);
        expect(result.normalized).assertEqual(100);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_1600
     * @tc.name testNumericValidatorRejectsBelowLowerBound
     * @tc.desc Verify minus one falls below the lower bound and normalizes to the minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNumericValidatorRejectsBelowLowerBound', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: NumericValidator = new NumericValidator(scoreRule);
        const result: NumericResult = validator.validate(-1);
        expect(result.code).assertEqual(ValidationCode.OUT_OF_RANGE);
        expect(result.normalized).assertEqual(0);
        expect(result.message).assertEqual('value below minimum');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_1700
     * @tc.name testNumericValidatorRejectsFraction
     * @tc.desc Verify a fractional value is rejected as not-integer when fractions are disallowed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNumericValidatorRejectsFraction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: NumericValidator = new NumericValidator(scoreRule);
        const result: NumericResult = validator.validate(75.5);
        expect(result.code).assertEqual(ValidationCode.NOT_INTEGER);
        expect(result.normalized).assertEqual(75);
        expect(result.raw).assertEqual(75.5);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_1800
     * @tc.name testNumericValidatorAcceptsFractionWhenAllowed
     * @tc.desc Verify a fraction is accepted when the rule permits fractional values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNumericValidatorAcceptsFractionWhenAllowed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const fractionRule: NumericRule = {
          min: 0,
          max: 1,
          allowFraction: true
        };
        const validator: NumericValidator = new NumericValidator(fractionRule);
        const result: NumericResult = validator.validate(0.25);
        expect(result.code).assertEqual(ValidationCode.OK);
        expect(result.normalized).assertEqual(0.25);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_1900
     * @tc.name testNumericValidatorDetectsNaN
     * @tc.desc Verify a parsed non-numeric literal becomes NaN and is rejected with not-a-number code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNumericValidatorDetectsNaN', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const parsed: number = parseFloat('not_a_number');
        expect(isNaN(parsed)).assertTrue();
        const validator: NumericValidator = new NumericValidator(scoreRule);
        const result: NumericResult = validator.validate(parsed);
        expect(result.code).assertEqual(ValidationCode.NOT_A_NUMBER);
        expect(result.message).assertEqual('value is not a finite number');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_2000
     * @tc.name testNumericValidatorDetectsInfinity
     * @tc.desc Verify a divided-by-zero infinity is rejected with not-a-number code rather than range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNumericValidatorDetectsInfinity', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const dividend: number = 1;
        const divisor: number = 0;
        const infinite: number = dividend / divisor;
        expect(isFinite(infinite)).assertFalse();
        const validator: NumericValidator = new NumericValidator(scoreRule);
        const result: NumericResult = validator.validate(infinite);
        expect(result.code).assertEqual(ValidationCode.NOT_A_NUMBER);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_2100
     * @tc.name testNumericValidatorClamp
     * @tc.desc Verify clamp pulls out-of-range values back inside and keeps in-range values untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNumericValidatorClamp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: NumericValidator = new NumericValidator(scoreRule);
        expect(validator.clamp(-50)).assertEqual(0);
        expect(validator.clamp(150)).assertEqual(100);
        expect(validator.clamp(42)).assertEqual(42);
        expect(validator.clamp(100)).assertEqual(100);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_2200
     * @tc.name testNumericValidatorRejectsNegativeForPositiveRule
     * @tc.desc Verify a negative value under a positive-only rule reports out-of-range before the negative check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNumericValidatorRejectsNegativeForPositiveRule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const positiveRule: NumericRule = {
          min: 0,
          max: 1000,
          allowFraction: true
        };
        const validator: NumericValidator = new NumericValidator(positiveRule);
        const result: NumericResult = validator.validate(-0.5);
        expect(result.code).assertEqual(ValidationCode.OUT_OF_RANGE);
        expect(result.normalized).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_2300
     * @tc.name testBooleanValidatorAcceptsBothLiterals
     * @tc.desc Verify matching boolean literals pass, a mismatched expectation fails, and negate flips each value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBooleanValidatorAcceptsBothLiterals', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: BooleanValidator = new BooleanValidator();
        expect(validator.validate(true, true)).assertEqual(ValidationCode.OK);
        expect(validator.validate(false, true)).assertEqual(ValidationCode.TYPE_MISMATCH);
        expect(validator.negate(true)).assertFalse();
        expect(validator.negate(false)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_2400
     * @tc.name testBooleanValidatorParsesText
     * @tc.desc Verify textual true is parsed to boolean true and any other literal to false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBooleanValidatorParsesText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: BooleanValidator = new BooleanValidator();
        expect(validator.parse('true')).assertTrue();
        expect(validator.parse('TRUE')).assertTrue();
        expect(validator.parse('false')).assertFalse();
        expect(validator.parse('yes')).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_2500
     * @tc.name testEnumValidatorSortOrder
     * @tc.desc Verify the sort order enum accepts its three declared values and rejects an undeclared one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnumValidatorSortOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const allowed: string[] = [SortOrder.ASCENDING, SortOrder.DESCENDING, SortOrder.NONE];
        const validator: EnumValidator = new EnumValidator(allowed);
        expect(validator.allowedCount()).assertEqual(3);
        expect(validator.validate(SortOrder.ASCENDING)).assertEqual(ValidationCode.OK);
        expect(validator.validate(SortOrder.DESCENDING)).assertEqual(ValidationCode.OK);
        expect(validator.validate(SortOrder.NONE)).assertEqual(ValidationCode.OK);
        expect(validator.validate('random')).assertEqual(ValidationCode.UNKNOWN_ENUM);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_2600
     * @tc.name testEnumValidatorContainsIsCaseSensitive
     * @tc.desc Verify enum lookup is exact and an upper-case variant of a declared value is unknown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEnumValidatorContainsIsCaseSensitive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const allowed: string[] = [SortOrder.ASCENDING, SortOrder.DESCENDING];
        const validator: EnumValidator = new EnumValidator(allowed);
        expect(validator.contains('asc')).assertTrue();
        expect(validator.contains('ASC')).assertFalse();
        expect(validator.contains('')).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_2700
     * @tc.name testArrayValidatorRejectsEmpty
     * @tc.desc Verify an empty page key list is rejected with array-empty and a zero length report
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayValidatorRejectsEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: ArrayValidator = new ArrayValidator(8, false);
        const values: string[] = [];
        const result: ArrayResult = validator.validate(values);
        expect(result.code).assertEqual(ValidationCode.ARRAY_EMPTY);
        expect(result.length).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_2800
     * @tc.name testArrayValidatorAcceptsDistinct
     * @tc.desc Verify a distinct two-element list under the size limit is accepted with length two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayValidatorAcceptsDistinct', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: ArrayValidator = new ArrayValidator(8, false);
        const values: string[] = ['pages/Index', 'pages/Detail'];
        const result: ArrayResult = validator.validate(values);
        expect(result.code).assertEqual(ValidationCode.OK);
        expect(result.length).assertEqual(2);
        expect(validator.distinctCount(values)).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_2900
     * @tc.name testArrayValidatorRejectsDuplicate
     * @tc.desc Verify a repeated entry is rejected with array-duplicate when duplicates are disallowed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayValidatorRejectsDuplicate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: ArrayValidator = new ArrayValidator(8, false);
        const values: string[] = ['pages/Index', 'pages/Index'];
        const result: ArrayResult = validator.validate(values);
        expect(result.code).assertEqual(ValidationCode.ARRAY_DUPLICATE);
        expect(result.length).assertEqual(2);
        expect(validator.distinctCount(values)).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_3000
     * @tc.name testArrayValidatorAllowsDuplicateWhenPermitted
     * @tc.desc Verify duplicates pass when the validator is configured to allow them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayValidatorAllowsDuplicateWhenPermitted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: ArrayValidator = new ArrayValidator(8, true);
        const values: string[] = ['key_a', 'key_a', 'key_b'];
        const result: ArrayResult = validator.validate(values);
        expect(result.code).assertEqual(ValidationCode.OK);
        expect(result.length).assertEqual(3);
        expect(validator.distinctCount(values)).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_3100
     * @tc.name testArrayValidatorRejectsTooLarge
     * @tc.desc Verify a list exceeding the configured maximum size returns array-too-large with the actual length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testArrayValidatorRejectsTooLarge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const validator: ArrayValidator = new ArrayValidator(3, false);
        const values: string[] = ['k1', 'k2', 'k3', 'k4'];
        const result: ArrayResult = validator.validate(values);
        expect(result.code).assertEqual(ValidationCode.ARRAY_TOO_LARGE);
        expect(result.length).assertEqual(4);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_3200
     * @tc.name testCompositeValidatorAndShortCircuit
     * @tc.desc Verify the AND aggregate reports failure and returns the first failing code when any member fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompositeValidatorAndShortCircuit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const textValidator: TextValidator = new TextValidator(TextFieldKind.PAGE_KEY, pageKeyRule);
        const numericValidator: NumericValidator = new NumericValidator(scoreRule);
        const composite: CompositeValidator = new CompositeValidator();
        const textResult: ValidationResult = textValidator.validate('ok_page');
        const numberResult: NumericResult = numericValidator.validate(150);
        expect(textResult.code).assertEqual(ValidationCode.OK);
        expect(numberResult.code).assertEqual(ValidationCode.OUT_OF_RANGE);
        composite.add(textResult);
        expect(composite.andPassed()).assertTrue();
        const numberAsField: ValidationResult = {
          code: numberResult.code,
          field: TextFieldKind.LOG_TAG,
          value: '150',
          message: numberResult.message,
          passed: false
        };
        composite.add(numberAsField);
        expect(composite.andPassed()).assertFalse();
        expect(composite.firstFailureCode()).assertEqual(ValidationCode.OUT_OF_RANGE);
        expect(composite.failureCount()).assertEqual(1);
        expect(composite.size()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_3300
     * @tc.name testCompositeValidatorOrAggregation
     * @tc.desc Verify the OR aggregate passes when at least one member passes and fails only when all fail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompositeValidatorOrAggregation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const composite: CompositeValidator = new CompositeValidator();
        const failingEmpty: ValidationResult = {
          code: ValidationCode.EMPTY_VALUE,
          field: TextFieldKind.USER_NAME,
          value: '',
          message: 'value is empty',
          passed: false
        };
        const passingKey: ValidationResult = {
          code: ValidationCode.OK,
          field: TextFieldKind.PAGE_KEY,
          value: 'main_page',
          message: 'value accepted',
          passed: true
        };
        composite.add(failingEmpty);
        composite.add(passingKey);
        expect(composite.orPassed()).assertTrue();
        expect(composite.failureCount()).assertEqual(1);
        composite.reset();
        expect(composite.size()).assertEqual(0);
        expect(composite.andPassed()).assertFalse();
        expect(composite.orPassed()).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_3400
     * @tc.name testCompositeValidatorEmptyAndIsFalse
     * @tc.desc Verify an empty composite reports false for AND, false for OR and OK for the first failure code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompositeValidatorEmptyAndIsFalse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const composite: CompositeValidator = new CompositeValidator();
        expect(composite.size()).assertEqual(0);
        expect(composite.andPassed()).assertFalse();
        expect(composite.orPassed()).assertFalse();
        expect(composite.firstFailureCode()).assertEqual(ValidationCode.OK);
        expect(composite.failureCount()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_3500
     * @tc.name testUiPageTextMatchesValidationExpectation
     * @tc.desc Verify the live page text equals the initial literal accepted by the text validator rules
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiPageTextMatchesValidationExpectation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const hasInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        const hasClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(hasInitial || hasClicked).assertTrue();
        const observed: string = hasInitial ? PAGE_TEXT_INITIAL : PAGE_TEXT_CLICKED;
        const validator: TextValidator = new TextValidator(TextFieldKind.LOG_TAG, abilityNameRule);
        const result: ValidationResult = validator.validate(observed);
        expect(result.code).assertEqual(ValidationCode.OK);
        expect(result.value).assertEqual(observed);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_3600
     * @tc.name testUiPageKeyLiteralValidated
     * @tc.desc Verify the real page path literal pages/Index passes the page key validator and contains a slash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiPageKeyLiteralValidated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const pagePath: string = 'pages/Index';
        const rule: ValidationRule = {
          minLength: 8,
          maxLength: 40,
          allowSpace: false,
          required: true
        };
        const validator: TextValidator = new TextValidator(TextFieldKind.PAGE_KEY, rule);
        const result: ValidationResult = validator.validate(pagePath);
        expect(result.code).assertEqual(ValidationCode.OK);
        expect(pagePath.indexOf('/') > 0).assertTrue();
        expect(pagePath.endsWith('Index')).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_3700
     * @tc.name testUiBundleNameValidatedAgainstRule
     * @tc.desc Verify the delegator bundle name satisfies a dotted identifier charset rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiBundleNameValidatedAgainstRule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const bundleName: string = getBundleName();
        expect(bundleName).assertEqual(BUNDLE_NAME);
        const rule: ValidationRule = {
          minLength: 4,
          maxLength: 64,
          allowSpace: false,
          required: true
        };
        const validator: TextValidator = new TextValidator(TextFieldKind.ABILITY_NAME, rule);
        const result: ValidationResult = validator.validate(bundleName);
        expect(result.code).assertEqual(ValidationCode.OK);
        expect(bundleName.indexOf('.' ) > 0).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_3800
     * @tc.name testUiTextComponentCountValidation
     * @tc.desc Verify the live text component count is a valid positive integer under the array size rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiTextComponentCountValidation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const texts: Component[] = await findComponentsByType(driver, 'Text');
        const total: number = await pageComponentCount(driver);
        const componentRule: NumericRule = {
          min: 1,
          max: 1000,
          allowFraction: false
        };
        const validator: NumericValidator = new NumericValidator(componentRule);
        const textResult: NumericResult = validator.validate(texts.length);
        const totalResult: NumericResult = validator.validate(total);
        expect(textResult.code).assertEqual(ValidationCode.OK);
        expect(totalResult.code).assertEqual(ValidationCode.OK);
        expect(total >= texts.length).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_3900
     * @tc.name testUiIndexPageVisibleUnderValidation
     * @tc.desc Verify the index page is visible before validating its literal copy against the text rules
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiIndexPageVisibleUnderValidation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
        const hasInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        const hasClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(hasInitial || hasClicked).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_4000
     * @tc.name testUiTextComponentNamesValidated
     * @tc.desc Verify every live text component literal passes a space-permitting length rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiTextComponentNamesValidated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const texts: Component[] = await findComponentsByType(driver, 'Text');
        expect(texts.length >= 1).assertTrue();
        const rule: ValidationRule = {
          minLength: 0,
          maxLength: 64,
          allowSpace: true,
          required: false
        };
        const validator: TextValidator = new TextValidator(TextFieldKind.USER_NAME, rule);
        let passedCount: number = 0;
        for (let i = 0; i < texts.length; i++) {
          const content: string = await texts[i].getText();
          const result: ValidationResult = validator.validate(content);
          expect(result.passed).assertTrue();
          if (result.passed) {
            passedCount++;
          }
        }
        expect(passedCount).assertEqual(texts.length);
        expect(await pageComponentCount(driver) >= texts.length).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_4100
     * @tc.name testUiComponentCountWithinNumericRule
     * @tc.desc Verify the live component count and focus index both satisfy the numeric integer rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiComponentCountWithinNumericRule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const count: number = await pageComponentCount(driver);
        expect(count > 0).assertTrue();
        const countRule: NumericRule = {
          min: 1,
          max: 10000,
          allowFraction: false
        };
        const validator: NumericValidator = new NumericValidator(countRule);
        const countResult: NumericResult = validator.validate(count);
        expect(countResult.code).assertEqual(ValidationCode.OK);
        const visible: boolean = await isIndexPageVisible(driver);
        expect(visible).assertTrue();
        const hasInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        const hasClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(hasInitial || hasClicked).assertTrue();
      } finally {
        done();
      }
    })
    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_4200
     * @tc.name testUiPageTextLengthsWithinNumericRule
     * @tc.desc Verify every live page text length satisfies the zero to sixty four integer length rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiPageTextLengthsWithinNumericRule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const texts: Component[] = await findComponentsByType(driver, 'Text');
        expect(texts.length >= 1).assertTrue();
        const lengthRule: NumericRule = {
          min: 0,
          max: 64,
          allowFraction: false
        };
        const validator: NumericValidator = new NumericValidator(lengthRule);
        let minLength: number = 64;
        let maxLength: number = 0;
        for (let i = 0; i < texts.length; i++) {
          const content: string = await texts[i].getText();
          const result: NumericResult = validator.validate(content.length);
          expect(result.code).assertEqual(ValidationCode.OK);
          if (content.length < minLength) {
            minLength = content.length;
          }
          if (content.length > maxLength) {
            maxLength = content.length;
          }
        }
        expect(minLength >= 0).assertTrue();
        expect(maxLength <= 64).assertTrue();
        expect(maxLength >= minLength).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_4300
     * @tc.name testUiBundleNameMatchesAbilityNameRule
     * @tc.desc Verify the delegator bundle name satisfies the ability name length rule without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiBundleNameMatchesAbilityNameRule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const bundle: string = getBundleName();
        const validator: TextValidator = new TextValidator(TextFieldKind.ABILITY_NAME, abilityNameRule);
        const result: ValidationResult = validator.validate(bundle);
        expect(result.code).assertEqual(ValidationCode.OK);
        expect(result.passed).assertTrue();
        expect(result.value).assertEqual(bundle);
        expect(validator.normalized(bundle)).assertEqual(bundle);
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_4400
     * @tc.name testUiFocusIndexValidatedAsInteger
     * @tc.desc Verify the live focus index is accepted as a whole number by the signed integer rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiFocusIndexValidatedAsInteger', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const index: number = await getCurrentFocusIndex(driver);
        const focusRule: NumericRule = {
          min: -10,
          max: 10000,
          allowFraction: false
        };
        const validator: NumericValidator = new NumericValidator(focusRule);
        const result: NumericResult = validator.validate(index);
        expect(result.raw).assertEqual(index);
        expect(result.code === ValidationCode.OK || result.code === ValidationCode.NEGATIVE_VALUE).assertTrue();
        expect(validator.clamp(index)).assertEqual(index);
        const total: number = await pageComponentCount(driver);
        expect(total > 0).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_4500
     * @tc.name testUiTextNamesPassArrayRule
     * @tc.desc Verify the collected live text literals pass the duplicate tolerant array rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiTextNamesPassArrayRule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const texts: Component[] = await findComponentsByType(driver, 'Text');
        expect(texts.length >= 1).assertTrue();
        const names: string[] = [];
        for (let i = 0; i < texts.length; i++) {
          names.push(await texts[i].getText());
        }
        const validator: ArrayValidator = new ArrayValidator(names.length + 8, true);
        const result: ArrayResult = validator.validate(names);
        expect(result.code).assertEqual(ValidationCode.OK);
        expect(result.length).assertEqual(texts.length);
        expect(validator.distinctCount(names) >= 1).assertTrue();
        expect(validator.distinctCount(names) <= names.length).assertTrue();
        const total: number = await pageComponentCount(driver);
        expect(total >= names.length).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_4600
     * @tc.name testUiCompositeValidatorOnLiveProbes
     * @tc.desc Verify bundle name and first live text both pass the composite and rule in one pass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiCompositeValidatorOnLiveProbes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const texts: Component[] = await findComponentsByType(driver, 'Text');
        expect(texts.length >= 1).assertTrue();
        const bundleValidator: TextValidator = new TextValidator(TextFieldKind.ABILITY_NAME, abilityNameRule);
        const pageRule: ValidationRule = {
          minLength: 0,
          maxLength: 64,
          allowSpace: true,
          required: false
        };
        const pageValidator: TextValidator = new TextValidator(TextFieldKind.PAGE_KEY, pageRule);
        const bundleResult: ValidationResult = bundleValidator.validate(getBundleName());
        const firstText: string = await texts[0].getText();
        const pageResult: ValidationResult = pageValidator.validate(firstText);
        const composite: CompositeValidator = new CompositeValidator();
        composite.add(bundleResult);
        composite.add(pageResult);
        expect(composite.size()).assertEqual(2);
        expect(composite.andPassed()).assertTrue();
        expect(composite.orPassed()).assertTrue();
        expect(composite.failureCount()).assertEqual(0);
        expect(composite.firstFailureCode()).assertEqual(ValidationCode.OK);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_4700
     * @tc.name testUiPageTextPresenceBooleanRule
     * @tc.desc Verify the observed page text presence matches the expected boolean and the mismatch code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiPageTextPresenceBooleanRule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const hasInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        const hasClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(hasInitial || hasClicked).assertTrue();
        const validator: BooleanValidator = new BooleanValidator();
        expect(validator.validate(hasInitial || hasClicked, true)).assertEqual(ValidationCode.OK);
        expect(validator.validate(false, true)).assertEqual(ValidationCode.TYPE_MISMATCH);
        expect(validator.parse('TRUE')).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })
    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_4800
     * @tc.name testUiTotalTextLengthValidatedAsInteger
     * @tc.desc Verify the summed live text length is a whole number accepted by the wide integer rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiTotalTextLengthValidatedAsInteger', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const texts: Component[] = await findComponentsByType(driver, 'Text');
        expect(texts.length >= 1).assertTrue();
        let totalLength: number = 0;
        for (let i = 0; i < texts.length; i++) {
          const content: string = await texts[i].getText();
          totalLength = totalLength + content.length;
        }
        const totalRule: NumericRule = {
          min: 0,
          max: 65535,
          allowFraction: false
        };
        const validator: NumericValidator = new NumericValidator(totalRule);
        const result: NumericResult = validator.validate(totalLength);
        expect(result.code).assertEqual(ValidationCode.OK);
        expect(result.normalized).assertEqual(totalLength);
        expect(validator.clamp(totalLength)).assertEqual(totalLength);
        const count: number = await pageComponentCount(driver);
        expect(count >= texts.length).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_INPUTVALID_4900
     * @tc.name testUiEnumValidatorOnObservedPageState
     * @tc.desc Verify the observed page copy resolves to one allowed page state and rejects a foreign state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiEnumValidatorOnObservedPageState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const hasInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        const hasClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(hasInitial || hasClicked).assertTrue();
        const observed: string = hasClicked ? 'clicked' : 'initial';
        const allowed: string[] = ['initial', 'clicked'];
        const validator: EnumValidator = new EnumValidator(allowed);
        expect(validator.validate(observed)).assertEqual(ValidationCode.OK);
        expect(validator.contains(observed)).assertTrue();
        expect(validator.allowedCount()).assertEqual(2);
        expect(validator.validate('loading')).assertEqual(ValidationCode.UNKNOWN_ENUM);
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })
  })
}
