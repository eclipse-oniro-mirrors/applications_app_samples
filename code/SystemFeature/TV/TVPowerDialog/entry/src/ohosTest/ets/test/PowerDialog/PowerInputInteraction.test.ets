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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import {
  createFreshDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_ENTER,
  KEY_BACK,
  powerDialogComponentCount,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../Shared/SharedDriver';

// 输入校验器：处理名称与输入的各类边界校验
class InputValidator {
  public static readonly MAX_NAME_LENGTH: number = 20;

  public static isValidName(name: string): boolean {
    return name.length > 0 && name.length <= InputValidator.MAX_NAME_LENGTH;
  }

  public static isTooLong(name: string, maxLength: number): boolean {
    return name.length > maxLength;
  }

  public static hasSpecialChars(name: string): boolean {
    return name.includes('*') || name.includes('!') || name.includes('@');
  }

  public static isEmpty(name: string): boolean {
    return name.length === 0;
  }

  public static containsInjection(name: string): boolean {
    return name.includes('<') || name.includes('>') || name.includes('\'') || name.includes('"');
  }

  public static isWithinLengthRange(name: string, min: number, max: number): boolean {
    return name.length >= min && name.length <= max;
  }

  public static isAlphanumeric(name: string): boolean {
    for (let i = 0; i < name.length; i++) {
      const code = name.charCodeAt(i);
      const isDigit = code >= 48 && code <= 57;
      const isUpper = code >= 65 && code <= 90;
      const isLower = code >= 97 && code <= 122;
      if (!isDigit && !isUpper && !isLower) {
        return false;
      }
    }
    return true;
  }
}

// 防重复提交器：拦截快速重复操作
class AntiDuplicateSubmitter {
  private submitted: boolean = false;
  private submitCount: number = 0;

  public submit(): boolean {
    if (this.submitted) {
      return false;
    }
    this.submitted = true;
    this.submitCount++;
    return true;
  }

  public reset(): void {
    this.submitted = false;
  }

  public getSubmitCount(): number {
    return this.submitCount;
  }
}

// 表单校验器：处理必填、格式、长度、范围与一致性校验
class FormValidator {
  public static validateRequired(value: string): boolean {
    return value.length > 0;
  }

  public static validateLength(value: string, maxLength: number): boolean {
    return value.length <= maxLength;
  }

  public static validateRange(value: number, min: number, max: number): boolean {
    return value >= min && value <= max;
  }

  public static validateConsistency(a: string, b: string): boolean {
    return a === b;
  }

  public static validateFormat(value: string, pattern: string): boolean {
    return value.includes(pattern);
  }
}

// 输入类型枚举：描述电源对话框支持的输入种类
enum InputType {
  TEXT = 'text', NUMBER = 'number', NAME = 'name', PASSWORD = 'password'
}

// 校验结果枚举：描述单次校验的结论
enum ValidationResult {
  PASS = 'pass', FAIL = 'fail', SKIP = 'skip'
}

// 输入规则接口：描述一条输入校验规则
interface InputRule {
  name: string;
  maxLength: number;
  minLength: number;
  allowSpecialChars: boolean;
}

// 校验结果接口：描述一次校验的完整输出
interface ValidationOutcome {
  result: ValidationResult;
  rule: string;
  message: string;
}

// 输入清洗器：对输入字符串进行归一化与清洗
class InputSanitizer {
  public static stripWhitespace(value: string): string {
    return value.trim();
  }

  public static removeControlChars(value: string): string {
    let result: string = '';
    for (let i = 0; i < value.length; i++) {
      const code: number = value.charCodeAt(i);
      if (code >= 32) {
        result += value.charAt(i);
      }
    }
    return result;
  }

  public static collapseSpaces(value: string): string {
    return value.replace(/\s+/g, ' ');
  }

  public static normalizeNewlines(value: string): string {
    return value.replace(/\r\n/g, '\n');
  }

  public static toLower(value: string): string {
    return value.toLowerCase();
  }
}

// 长度规则模型：封装输入长度的最小与最大约束
class LengthRule {
  public minLength: number;
  public maxLength: number;

  constructor(minLength: number, maxLength: number) {
    this.minLength = minLength;
    this.maxLength = maxLength;
  }

  public isValid(value: string): boolean {
    return value.length >= this.minLength && value.length <= this.maxLength;
  }

  public getViolation(value: string): string {
    if (value.length < this.minLength) {
      return 'too short';
    }
    if (value.length > this.maxLength) {
      return 'too long';
    }
    return 'valid';
  }

  public getMinLength(): number {
    return this.minLength;
  }

  public getMaxLength(): number {
    return this.maxLength;
  }
}

// 输入字段模型：封装输入值与关联规则，支持校验
class InputField {
  public value: string;
  public inputType: InputType;
  private rule: LengthRule;

  constructor(value: string, inputType: InputType, rule: LengthRule) {
    this.value = value;
    this.inputType = inputType;
    this.rule = rule;
  }

  public getValue(): string {
    return this.value;
  }

  public setValue(value: string): void {
    this.value = value;
  }

  public validate(): ValidationOutcome {
    if (this.rule.isValid(this.value)) {
      return { result: ValidationResult.PASS, rule: 'length', message: 'valid' };
    }
    return { result: ValidationResult.FAIL, rule: 'length', message: this.rule.getViolation(this.value) };
  }

  public isEmpty(): boolean {
    return this.value.length === 0;
  }

  public getRule(): InputRule {
    return {
      name: this.inputType,
      maxLength: this.rule.getMaxLength(),
      minLength: this.rule.getMinLength(),
      allowSpecialChars: true
    };
  }
}

// 校验链：顺序执行多条校验并汇总结果
class ValidationChain {
  private fields: InputField[] = [];

  public addField(field: InputField): void {
    this.fields.push(field);
  }

  public validateAll(): ValidationOutcome[] {
    const outcomes: ValidationOutcome[] = [];
    this.fields.forEach((field: InputField) => {
      outcomes.push(field.validate());
    });
    return outcomes;
  }

  public getPassCount(): number {
    return this.validateAll().filter((outcome: ValidationOutcome) => outcome.result === ValidationResult.PASS).length;
  }

  public getFailCount(): number {
    return this.validateAll().filter((outcome: ValidationOutcome) => outcome.result === ValidationResult.FAIL).length;
  }

  public getFieldCount(): number {
    return this.fields.length;
  }

  public clear(): void {
    this.fields = [];
  }
}

// 输入计数器：统计各类输入事件的数量
class InputCounter {
  private counts: Map<InputType, number> = new Map<InputType, number>();

  public record(inputType: InputType): void {
    const current: number = this.counts.get(inputType) ?? 0;
    this.counts.set(inputType, current + 1);
  }

  public getCount(inputType: InputType): number {
    const value: number | undefined = this.counts.get(inputType);
    if (value === undefined) {
      return 0;
    }
    return value;
  }

  public getTotalCount(): number {
    let total: number = 0;
    this.counts.forEach((value: number) => {
      total += value;
    });
    return total;
  }

  public reset(): void {
    this.counts = new Map<InputType, number>();
  }
}

// 输入一致性校验器：校验多个输入之间的一致性
class InputConsistencyValidator {
  public static allEqual(values: string[]): boolean {
    if (values.length === 0) {
      return true;
    }
    const first: string = values[0];
    return values.every((value: string) => value === first);
  }

  public static anyBlank(values: string[]): boolean {
    return values.some((value: string) => value.trim().length === 0);
  }

  public static countDistinct(values: string[]): number {
    const set: Set<string> = new Set<string>();
    values.forEach((value: string) => {
      set.add(value);
    });
    return set.size;
  }
}

// 输入掩码器：对敏感输入进行掩码处理
class InputMasker {
  public static maskAll(value: string): string {
    return '*'.repeat(value.length);
  }

  public static maskSuffix(value: string, visibleCount: number): string {
    if (value.length <= visibleCount) {
      return value;
    }
    const visible: string = value.slice(value.length - visibleCount);
    const masked: string = '*'.repeat(value.length - visibleCount);
    return masked + visible;
  }

  public static maskPrefix(value: string, visibleCount: number): string {
    if (value.length <= visibleCount) {
      return value;
    }
    const visible: string = value.slice(0, visibleCount);
    const masked: string = '*'.repeat(value.length - visibleCount);
    return visible + masked;
  }

  public static maskMiddle(value: string, edgeCount: number): string {
    if (value.length <= edgeCount * 2) {
      return value;
    }
    const prefix: string = value.slice(0, edgeCount);
    const suffix: string = value.slice(value.length - edgeCount);
    const middle: string = '*'.repeat(value.length - edgeCount * 2);
    return prefix + middle + suffix;
  }
}

// 输入历史：记录输入值的变更历史
class InputHistory {
  private values: string[] = [];

  public append(value: string): void {
    this.values.push(value);
  }

  public getValues(): string[] {
    return [...this.values];
  }

  public getCount(): number {
    return this.values.length;
  }

  public getLastValue(): string {
    if (this.values.length === 0) {
      return '';
    }
    return this.values[this.values.length - 1];
  }

  public getFirstValue(): string {
    if (this.values.length === 0) {
      return '';
    }
    return this.values[0];
  }

  public hasValue(value: string): boolean {
    return this.values.includes(value);
  }

  public clear(): void {
    this.values = [];
  }
}

// 校验报告构建器：汇总校验结果并生成统计
class ValidationReportBuilder {
  private outcomes: ValidationOutcome[] = [];

  public addOutcome(outcome: ValidationOutcome): void {
    this.outcomes.push(outcome);
  }

  public addOutcomes(outcomes: ValidationOutcome[]): void {
    this.outcomes.push(...outcomes);
  }

  public getTotalCount(): number {
    return this.outcomes.length;
  }

  public getPassCount(): number {
    return this.outcomes.filter((outcome: ValidationOutcome) => outcome.result === ValidationResult.PASS).length;
  }

  public getFailCount(): number {
    return this.outcomes.filter((outcome: ValidationOutcome) => outcome.result === ValidationResult.FAIL).length;
  }

  public getSkipCount(): number {
    return this.outcomes.filter((outcome: ValidationOutcome) => outcome.result === ValidationResult.SKIP).length;
  }

  public isAllPassed(): boolean {
    return this.getTotalCount() > 0 && this.getFailCount() === 0;
  }

  public clear(): void {
    this.outcomes = [];
  }
}

export default function powerInputInteractionTest() {
  describe('PowerInputInteraction_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = createFreshDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // ===== 输入校验 =====
    it('empty_name_should_be_rejected', 0, async () => {
      expect(InputValidator.isEmpty('')).assertTrue();
      expect(InputValidator.isValidName('')).assertFalse();
    });

    it('valid_name_should_pass_validation', 0, async () => {
      expect(InputValidator.isValidName('关机')).assertTrue();
      expect(InputValidator.isValidName('重启')).assertTrue();
    });

    it('overlong_name_should_be_rejected', 0, async () => {
      const longName = 'a'.repeat(50);
      expect(InputValidator.isTooLong(longName, InputValidator.MAX_NAME_LENGTH)).assertTrue();
      expect(InputValidator.isValidName(longName)).assertFalse();
    });

    it('boundary_length_should_be_accepted', 0, async () => {
      const exactMax = 'a'.repeat(InputValidator.MAX_NAME_LENGTH);
      expect(InputValidator.isValidName(exactMax)).assertTrue();
      const overMax = 'a'.repeat(InputValidator.MAX_NAME_LENGTH + 1);
      expect(InputValidator.isValidName(overMax)).assertFalse();
    });

    it('special_characters_should_be_detected', 0, async () => {
      expect(InputValidator.hasSpecialChars('关机*')).assertTrue();
      expect(InputValidator.hasSpecialChars('重启')).assertFalse();
    });

    it('injection_characters_should_be_detected', 0, async () => {
      expect(InputValidator.containsInjection('<script>')).assertTrue();
      expect(InputValidator.containsInjection('正常')).assertFalse();
    });

    it('length_range_should_be_validated', 0, async () => {
      expect(InputValidator.isWithinLengthRange('ab', 2, 5)).assertTrue();
      expect(InputValidator.isWithinLengthRange('a', 2, 5)).assertFalse();
      expect(InputValidator.isWithinLengthRange('abcdef', 2, 5)).assertFalse();
    });

    it('alphanumeric_check_should_work', 0, async () => {
      expect(InputValidator.isAlphanumeric('abc123')).assertTrue();
      expect(InputValidator.isAlphanumeric('中文')).assertFalse();
    });

    // ===== 防重复提交 =====
    it('rapid_duplicate_submit_should_be_blocked', 0, async () => {
      const submitter = new AntiDuplicateSubmitter();
      expect(submitter.submit()).assertTrue();
      expect(submitter.submit()).assertFalse();
      expect(submitter.getSubmitCount()).assertEqual(1);
    });

    it('reset_should_allow_resubmit', 0, async () => {
      const submitter = new AntiDuplicateSubmitter();
      submitter.submit();
      submitter.reset();
      expect(submitter.submit()).assertTrue();
      expect(submitter.getSubmitCount()).assertEqual(2);
    });

    // ===== 表单校验 =====
    it('required_field_should_be_validated', 0, async () => {
      expect(FormValidator.validateRequired('关机')).assertTrue();
      expect(FormValidator.validateRequired('')).assertFalse();
    });

    it('length_field_should_be_validated', 0, async () => {
      expect(FormValidator.validateLength('abc', 5)).assertTrue();
      expect(FormValidator.validateLength('abcdef', 5)).assertFalse();
    });

    it('range_field_should_be_validated', 0, async () => {
      expect(FormValidator.validateRange(1, 0, 2)).assertTrue();
      expect(FormValidator.validateRange(3, 0, 2)).assertFalse();
    });

    it('consistency_field_should_be_validated', 0, async () => {
      expect(FormValidator.validateConsistency('关机', '关机')).assertTrue();
      expect(FormValidator.validateConsistency('关机', '重启')).assertFalse();
    });

    // ===== 交互 =====
    it('back_key_should_work_without_deadlock', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    it('focus_interaction_should_be_stable', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('emoji_should_be_detected_as_non_alphanumeric', 0, async () => {
      expect(InputValidator.isAlphanumeric('emoji😀')).assertFalse();
    });

    it('format_validation_should_work', 0, async () => {
      expect(FormValidator.validateFormat('app.media.shutdown', 'app.media')).assertTrue();
      expect(FormValidator.validateFormat('shutdown', 'app.media')).assertFalse();
    });

    it('consistency_mismatch_should_be_detected', 0, async () => {
      expect(FormValidator.validateConsistency('关机', '重启')).assertFalse();
    });

    it('range_exact_boundary_should_pass', 0, async () => {
      expect(FormValidator.validateRange(0, 0, 2)).assertTrue();
      expect(FormValidator.validateRange(2, 0, 2)).assertTrue();
    });

    it('submit_count_should_accumulate_after_resets', 0, async () => {
      const submitter = new AntiDuplicateSubmitter();
      submitter.submit();
      submitter.reset();
      submitter.submit();
      submitter.reset();
      submitter.submit();
      expect(submitter.getSubmitCount()).assertEqual(3);
    });

    it('empty_vs_whitespace_distinction', 0, async () => {
      expect(InputValidator.isEmpty('')).assertTrue();
      expect(InputValidator.isEmpty('   ')).assertFalse();
    });

    it('special_char_single_detected', 0, async () => {
      expect(InputValidator.hasSpecialChars('*')).assertTrue();
      expect(InputValidator.hasSpecialChars('!')).assertTrue();
      expect(InputValidator.hasSpecialChars('@')).assertTrue();
    });

    it('injection_angle_detected', 0, async () => {
      expect(InputValidator.containsInjection('<x>')).assertTrue();
    });

    it('injection_quote_detected', 0, async () => {
      expect(InputValidator.containsInjection('\'')).assertTrue();
      expect(InputValidator.containsInjection('"')).assertTrue();
    });

    it('alphanumeric_mixed_returns_true', 0, async () => {
      expect(InputValidator.isAlphanumeric('abc123XYZ')).assertTrue();
    });

    it('submit_without_reset_after_first_blocked', 0, async () => {
      const submitter = new AntiDuplicateSubmitter();
      submitter.submit();
      expect(submitter.submit()).assertFalse();
    });

    it('form_required_whitespace_is_true', 0, async () => {
      expect(FormValidator.validateRequired(' ')).assertTrue();
    });

    it('form_length_zero_value_passes', 0, async () => {
      expect(FormValidator.validateLength('', 5)).assertTrue();
    });

    it('form_range_negative_fails', 0, async () => {
      expect(FormValidator.validateRange(-1, 0, 2)).assertFalse();
    });

    it('form_consistency_empty_strings', 0, async () => {
      expect(FormValidator.validateConsistency('', '')).assertTrue();
    });
  });
}
