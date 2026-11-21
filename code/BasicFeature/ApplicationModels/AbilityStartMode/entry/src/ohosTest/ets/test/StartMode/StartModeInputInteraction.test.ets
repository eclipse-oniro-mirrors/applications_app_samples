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
import { Driver } from '@ohos.UiTest';
import {
  DELAY_KEY_NAVIGATION,
  FOOD_ICE_CREAM,
  FOOD_TOMATO,
  FOOD_WALNUT,
  INDEX_SINGLETON_GROUP,
  INDEX_STANDARD_GROUP,
  KEY_BACK,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  MODE_SINGLETON,
  MODE_SPECIFIED,
  MODE_STANDARD,
  TIMEOUT_PAGE_RENDER,
  checkTextContent,
  componentCount,
  getDriver,
  homeComponentCount,
  pressAndWait,
  serializedDelay,
  waitForHomePageStable
} from '../Shared/SharedDriver';

// 输入校验器：处理食物名称、模式标识与启动参数的各类边界校验
class InputValidator {
  public static readonly MAX_NAME_LENGTH: number = 20;
  public static readonly GROUP_COUNT: number = 3;

  public static isValidName(letter: string): boolean {
    return letter.length > 0 && letter.length <= InputValidator.MAX_NAME_LENGTH;
  }

  public static isTooLong(letter: string, maxLength: number): boolean {
    return letter.length > maxLength;
  }

  public static hasSpecialChars(letter: string): boolean {
    return letter.includes('*') || letter.includes('!') || letter.includes('@');
  }

  public static isEmpty(letter: string): boolean {
    return letter.length === 0;
  }

  public static containsInjection(letter: string): boolean {
    return letter.includes('<') || letter.includes('>') || letter.includes('\'') || letter.includes('"');
  }

  public static isWithinLengthRange(letter: string, min: number, max: number): boolean {
    return letter.length >= min && letter.length <= max;
  }

  public static isAlphanumeric(letter: string): boolean {
    for (let i = 0; i < letter.length; i++) {
      const code: number = letter.charCodeAt(i);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      if (!isDigit && !isUpper && !isLower) {
        return false;
      }
    }
    return true;
  }

  // 模式标识校验：只接受主页实际渲染的三个 modeName 值
  public static isValidModeName(modeName: string): boolean {
    return modeName === MODE_STANDARD || modeName === MODE_SPECIFIED || modeName === MODE_SINGLETON;
  }

  // 食物条目下标校验：每组固定两个条目，合法下标为 0 与 1
  public static isValidFoodItemId(foodItemId: number): boolean {
    return foodItemId === 0 || foodItemId === 1;
  }

  // 分组下标校验：主页共三组食物列表
  public static isValidGroupIndex(groupIndex: number): boolean {
    return groupIndex >= 0 && groupIndex < InputValidator.GROUP_COUNT;
  }
}

// 防重复提交器：拦截 SingletonAbility 的快速重复启动
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

// 输入类型枚举：描述启动模式页面支持的输入种类
enum InputType {
  TEXT = 'text', NUMBER = 'number', NAME = 'name', MODE = 'mode'
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
      const passOutcome: ValidationOutcome = { result: ValidationResult.PASS, rule: 'length', message: 'valid' };
      return passOutcome;
    }
    const failOutcome: ValidationOutcome =
      { result: ValidationResult.FAIL, rule: 'length', message: this.rule.getViolation(this.value) };
    return failOutcome;
  }

  public isEmpty(): boolean {
    return this.value.length === 0;
  }

  public getRule(): InputRule {
    const rule: InputRule = {
      name: this.inputType,
      maxLength: this.rule.getMaxLength(),
      minLength: this.rule.getMinLength(),
      allowSpecialChars: false
    };
    return rule;
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

// 启动参数校验器：校验 startMode 传递的 want 参数组合
class LaunchParameterValidator {
  public static readonly BUNDLE_NAME: string = 'ohos.samples.startmode';
  public static readonly TARGET_PAGE: string = 'pages/FoodDetail';

  public static isValidBundleName(bundleName: string): boolean {
    return bundleName === LaunchParameterValidator.BUNDLE_NAME;
  }

  public static isValidTarget(target: string): boolean {
    return target === LaunchParameterValidator.TARGET_PAGE;
  }

  public static isConsistentGroup(modeName: string, foodListIndex: number): boolean {
    if (modeName === MODE_STANDARD) {
      return foodListIndex === 0;
    }
    if (modeName === MODE_SPECIFIED) {
      return foodListIndex === 1;
    }
    if (modeName === MODE_SINGLETON) {
      return foodListIndex === 2;
    }
    return false;
  }

  public static isComplete(modeName: string, foodItemId: number, foodListIndex: number): boolean {
    return InputValidator.isValidModeName(modeName) && InputValidator.isValidFoodItemId(foodItemId) &&
      InputValidator.isValidGroupIndex(foodListIndex);
  }
}

export default function startModeInputInteractionTest() {
  describe('StartModeInputInteraction_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
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

    it('valid_food_name_should_pass_validation', 0, async () => {
      expect(InputValidator.isValidName(FOOD_TOMATO)).assertTrue();
      expect(InputValidator.isValidName(FOOD_WALNUT)).assertTrue();
      expect(InputValidator.isValidName(FOOD_ICE_CREAM)).assertTrue();
    });

    it('overlong_name_should_be_rejected', 0, async () => {
      const longName: string = 'a'.repeat(50);
      expect(InputValidator.isTooLong(longName, InputValidator.MAX_NAME_LENGTH)).assertTrue();
      expect(InputValidator.isValidName(longName)).assertFalse();
    });

    it('boundary_length_should_be_accepted', 0, async () => {
      const exactMax: string = 'a'.repeat(InputValidator.MAX_NAME_LENGTH);
      expect(InputValidator.isValidName(exactMax)).assertTrue();
      const overMax: string = 'a'.repeat(InputValidator.MAX_NAME_LENGTH + 1);
      expect(InputValidator.isValidName(overMax)).assertFalse();
    });

    it('special_characters_should_be_detected', 0, async () => {
      expect(InputValidator.hasSpecialChars('Tomato*')).assertTrue();
      expect(InputValidator.hasSpecialChars(FOOD_TOMATO)).assertFalse();
    });

    it('injection_characters_should_be_detected', 0, async () => {
      expect(InputValidator.containsInjection('<script>')).assertTrue();
      expect(InputValidator.containsInjection(FOOD_WALNUT)).assertFalse();
    });

    it('length_range_should_be_validated', 0, async () => {
      expect(InputValidator.isWithinLengthRange('ab', 2, 5)).assertTrue();
      expect(InputValidator.isWithinLengthRange('a', 2, 5)).assertFalse();
      expect(InputValidator.isWithinLengthRange('abcdef', 2, 5)).assertFalse();
    });

    it('alphanumeric_check_should_work', 0, async () => {
      expect(InputValidator.isAlphanumeric('Tomato1')).assertTrue();
      expect(InputValidator.isAlphanumeric('番茄')).assertFalse();
    });

    it('mode_name_should_be_validated', 0, async () => {
      expect(InputValidator.isValidModeName(MODE_STANDARD)).assertTrue();
      expect(InputValidator.isValidModeName(MODE_SPECIFIED)).assertTrue();
      expect(InputValidator.isValidModeName(MODE_SINGLETON)).assertTrue();
      expect(InputValidator.isValidModeName('singleton')).assertFalse();
      expect(InputValidator.isValidModeName('')).assertFalse();
    });

    it('food_item_id_should_be_validated', 0, async () => {
      expect(InputValidator.isValidFoodItemId(0)).assertTrue();
      expect(InputValidator.isValidFoodItemId(1)).assertTrue();
      expect(InputValidator.isValidFoodItemId(2)).assertFalse();
      expect(InputValidator.isValidFoodItemId(-1)).assertFalse();
    });

    it('group_index_should_be_validated', 0, async () => {
      expect(InputValidator.isValidGroupIndex(INDEX_STANDARD_GROUP)).assertTrue();
      expect(InputValidator.isValidGroupIndex(INDEX_SINGLETON_GROUP)).assertTrue();
      expect(InputValidator.isValidGroupIndex(3)).assertFalse();
      expect(InputValidator.isValidGroupIndex(-1)).assertFalse();
    });

    // ===== 防重复提交 =====
    it('rapid_duplicate_submit_should_be_blocked', 0, async () => {
      const submitter: AntiDuplicateSubmitter = new AntiDuplicateSubmitter();
      expect(submitter.submit()).assertTrue();
      expect(submitter.submit()).assertFalse();
      expect(submitter.getSubmitCount()).assertEqual(1);
    });

    it('reset_should_allow_resubmit', 0, async () => {
      const submitter: AntiDuplicateSubmitter = new AntiDuplicateSubmitter();
      submitter.submit();
      submitter.reset();
      expect(submitter.submit()).assertTrue();
      expect(submitter.getSubmitCount()).assertEqual(2);
    });

    it('submit_count_should_accumulate_after_resets', 0, async () => {
      const submitter: AntiDuplicateSubmitter = new AntiDuplicateSubmitter();
      submitter.submit();
      submitter.reset();
      submitter.submit();
      submitter.reset();
      submitter.submit();
      expect(submitter.getSubmitCount()).assertEqual(3);
    });

    it('submit_without_reset_after_first_blocked', 0, async () => {
      const submitter: AntiDuplicateSubmitter = new AntiDuplicateSubmitter();
      submitter.submit();
      expect(submitter.submit()).assertFalse();
    });
    // ===== 表单校验 =====
    it('required_field_should_be_validated', 0, async () => {
      expect(FormValidator.validateRequired(FOOD_TOMATO)).assertTrue();
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
      expect(FormValidator.validateConsistency(MODE_STANDARD, MODE_STANDARD)).assertTrue();
      expect(FormValidator.validateConsistency(MODE_STANDARD, MODE_SPECIFIED)).assertFalse();
    });

    it('format_validation_should_work', 0, async () => {
      expect(FormValidator.validateFormat('app.media.tomato', 'app.media')).assertTrue();
      expect(FormValidator.validateFormat('tomato', 'app.media')).assertFalse();
    });

    it('range_exact_boundary_should_pass', 0, async () => {
      expect(FormValidator.validateRange(0, 0, 2)).assertTrue();
      expect(FormValidator.validateRange(2, 0, 2)).assertTrue();
    });

    it('form_range_negative_fails', 0, async () => {
      expect(FormValidator.validateRange(-1, 0, 2)).assertFalse();
    });

    it('form_required_whitespace_is_true', 0, async () => {
      expect(FormValidator.validateRequired(' ')).assertTrue();
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

    it('injection_quote_detected', 0, async () => {
      expect(InputValidator.containsInjection('\'')).assertTrue();
      expect(InputValidator.containsInjection('"')).assertTrue();
    });

    // ===== 清洗与长度规则 =====
    it('sanitizer_should_strip_whitespace', 0, async () => {
      expect(InputSanitizer.stripWhitespace('  Tomato  ')).assertEqual(FOOD_TOMATO);
      expect(InputSanitizer.stripWhitespace('')).assertEqual('');
    });

    it('sanitizer_should_collapse_spaces', 0, async () => {
      expect(InputSanitizer.collapseSpaces('Ice   Cream')).assertEqual('Ice Cream');
    });

    it('sanitizer_should_remove_control_chars', 0, async () => {
      expect(InputSanitizer.removeControlChars('Tom\u0001ato')).assertEqual(FOOD_TOMATO);
    });

    it('sanitizer_should_lower_case_mode_name', 0, async () => {
      expect(InputSanitizer.toLower('STANDARD')).assertEqual(MODE_STANDARD);
      expect(InputSanitizer.toLower('SINLETON')).assertEqual(MODE_SINGLETON);
    });

    it('sanitizer_should_normalize_newlines', 0, async () => {
      expect(InputSanitizer.normalizeNewlines('a\r\nb')).assertEqual('a\nb');
    });

    it('length_rule_should_validate_range', 0, async () => {
      const rule: LengthRule = new LengthRule(1, 20);
      expect(rule.isValid(FOOD_TOMATO)).assertTrue();
      expect(rule.isValid('')).assertFalse();
      expect(rule.isValid('a'.repeat(21))).assertFalse();
      expect(rule.getViolation('')).assertEqual('too short');
      expect(rule.getViolation('a'.repeat(21))).assertEqual('too long');
      expect(rule.getViolation(FOOD_TOMATO)).assertEqual('valid');
    });

    it('length_rule_should_expose_bounds', 0, async () => {
      const rule: LengthRule = new LengthRule(2, 8);
      expect(rule.getMinLength()).assertEqual(2);
      expect(rule.getMaxLength()).assertEqual(8);
    });

    it('input_field_should_validate_and_update_value', 0, async () => {
      const field: InputField = new InputField(FOOD_WALNUT, InputType.NAME, new LengthRule(1, 20));
      expect(field.getValue()).assertEqual(FOOD_WALNUT);
      expect(field.isEmpty()).assertFalse();
      expect(field.validate().result).assertEqual(ValidationResult.PASS);
      field.setValue('');
      expect(field.isEmpty()).assertTrue();
      expect(field.validate().result).assertEqual(ValidationResult.FAIL);
      expect(field.validate().message).assertEqual('too short');
    });

    it('input_field_should_expose_rule', 0, async () => {
      const field: InputField = new InputField(FOOD_ICE_CREAM, InputType.MODE, new LengthRule(1, 12));
      const rule: InputRule = field.getRule();
      expect(rule.minLength).assertEqual(1);
      expect(rule.maxLength).assertEqual(12);
      expect(rule.allowSpecialChars).assertFalse();
    });

    it('validation_chain_should_summarize_results', 0, async () => {
      const chain: ValidationChain = new ValidationChain();
      chain.addField(new InputField(FOOD_TOMATO, InputType.NAME, new LengthRule(1, 20)));
      chain.addField(new InputField('', InputType.NAME, new LengthRule(1, 20)));
      expect(chain.getFieldCount()).assertEqual(2);
      expect(chain.getPassCount()).assertEqual(1);
      expect(chain.getFailCount()).assertEqual(1);
      chain.clear();
      expect(chain.getFieldCount()).assertEqual(0);
    });

    it('input_counter_should_count_by_type', 0, async () => {
      const counter: InputCounter = new InputCounter();
      counter.record(InputType.NAME);
      counter.record(InputType.NAME);
      counter.record(InputType.MODE);
      expect(counter.getCount(InputType.NAME)).assertEqual(2);
      expect(counter.getCount(InputType.MODE)).assertEqual(1);
      expect(counter.getCount(InputType.NUMBER)).assertEqual(0);
      expect(counter.getTotalCount()).assertEqual(3);
      counter.reset();
      expect(counter.getTotalCount()).assertEqual(0);
    });

    it('input_consistency_should_be_checked', 0, async () => {
      expect(InputConsistencyValidator.allEqual([MODE_STANDARD, MODE_STANDARD])).assertTrue();
      expect(InputConsistencyValidator.allEqual([MODE_STANDARD, MODE_SPECIFIED])).assertFalse();
      expect(InputConsistencyValidator.allEqual([])).assertTrue();
      expect(InputConsistencyValidator.anyBlank([FOOD_TOMATO, '  '])).assertTrue();
      expect(InputConsistencyValidator.anyBlank([FOOD_TOMATO, FOOD_WALNUT])).assertFalse();
      expect(InputConsistencyValidator.countDistinct([FOOD_TOMATO, FOOD_TOMATO, FOOD_WALNUT])).assertEqual(2);
    });

    it('input_masker_should_mask_values', 0, async () => {
      expect(InputMasker.maskAll(FOOD_TOMATO)).assertEqual('******');
      expect(InputMasker.maskSuffix(FOOD_TOMATO, 2)).assertEqual('****to');
      expect(InputMasker.maskPrefix(FOOD_TOMATO, 2)).assertEqual('To****');
      expect(InputMasker.maskMiddle(FOOD_TOMATO, 2)).assertEqual('To**to');
    });

    it('input_masker_should_keep_short_values', 0, async () => {
      expect(InputMasker.maskSuffix('ab', 2)).assertEqual('ab');
      expect(InputMasker.maskMiddle('abc', 2)).assertEqual('abc');
    });

    it('input_history_should_track_values', 0, async () => {
      const history: InputHistory = new InputHistory();
      expect(history.getLastValue()).assertEqual('');
      expect(history.getFirstValue()).assertEqual('');
      history.append(FOOD_TOMATO);
      history.append(FOOD_WALNUT);
      expect(history.getCount()).assertEqual(2);
      expect(history.getFirstValue()).assertEqual(FOOD_TOMATO);
      expect(history.getLastValue()).assertEqual(FOOD_WALNUT);
      expect(history.hasValue(FOOD_TOMATO)).assertTrue();
      history.clear();
      expect(history.getCount()).assertEqual(0);
    });

    it('validation_report_should_summarize_outcomes', 0, async () => {
      const report: ValidationReportBuilder = new ValidationReportBuilder();
      const passOutcome: ValidationOutcome =
        { result: ValidationResult.PASS, rule: 'length', message: 'valid' };
      const failOutcome: ValidationOutcome = { result: ValidationResult.FAIL, rule: 'length', message: 'too short' };
      const skipOutcome: ValidationOutcome = { result: ValidationResult.SKIP, rule: 'mode', message: 'skipped' };
      report.addOutcome(passOutcome);
      report.addOutcomes([failOutcome, skipOutcome]);
      expect(report.getTotalCount()).assertEqual(3);
      expect(report.getPassCount()).assertEqual(1);
      expect(report.getFailCount()).assertEqual(1);
      expect(report.getSkipCount()).assertEqual(1);
      expect(report.isAllPassed()).assertFalse();
      report.clear();
      expect(report.getTotalCount()).assertEqual(0);
      expect(report.isAllPassed()).assertFalse();
    });
    // ===== 启动参数校验 =====
    it('bundle_name_should_be_validated', 0, async () => {
      expect(LaunchParameterValidator.isValidBundleName('ohos.samples.startmode')).assertTrue();
      expect(LaunchParameterValidator.isValidBundleName('ohos.samples.other')).assertFalse();
    });

    it('target_page_should_be_validated', 0, async () => {
      expect(LaunchParameterValidator.isValidTarget('pages/FoodDetail')).assertTrue();
      expect(LaunchParameterValidator.isValidTarget('pages/Home')).assertFalse();
    });

    it('group_should_match_mode_name', 0, async () => {
      expect(LaunchParameterValidator.isConsistentGroup(MODE_STANDARD, INDEX_STANDARD_GROUP)).assertTrue();
      expect(LaunchParameterValidator.isConsistentGroup(MODE_SPECIFIED, 1)).assertTrue();
      expect(LaunchParameterValidator.isConsistentGroup(MODE_SINGLETON, INDEX_SINGLETON_GROUP)).assertTrue();
      expect(LaunchParameterValidator.isConsistentGroup(MODE_STANDARD, INDEX_SINGLETON_GROUP)).assertFalse();
      expect(LaunchParameterValidator.isConsistentGroup('unknown', 0)).assertFalse();
    });

    it('complete_parameter_set_should_pass', 0, async () => {
      expect(LaunchParameterValidator.isComplete(MODE_STANDARD, 0, INDEX_STANDARD_GROUP)).assertTrue();
      expect(LaunchParameterValidator.isComplete(MODE_SPECIFIED, 1, 1)).assertTrue();
      expect(LaunchParameterValidator.isComplete(MODE_SINGLETON, 0, INDEX_SINGLETON_GROUP)).assertTrue();
    });

    it('incomplete_parameter_set_should_fail', 0, async () => {
      expect(LaunchParameterValidator.isComplete('', 0, 0)).assertFalse();
      expect(LaunchParameterValidator.isComplete(MODE_STANDARD, 2, 0)).assertFalse();
      expect(LaunchParameterValidator.isComplete(MODE_STANDARD, 0, 3)).assertFalse();
    });

    // ===== 交互 =====
    it('home_page_should_render_without_deadlock', 0, async () => {
      const rendered: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(rendered).assertTrue();
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      const componentCount: number = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('focus_interaction_should_be_stable', 0, async () => {
      const rendered: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(rendered).assertTrue();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const componentCount: number = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('home_page_should_show_mode_label_after_input_validation', 0, async () => {
      expect(InputValidator.isValidModeName(MODE_STANDARD)).assertTrue();
      expect(InputValidator.isValidFoodItemId(0)).assertTrue();
      const standardVisible: boolean = await checkTextContent(driver, MODE_STANDARD);
      const specifiedVisible: boolean = await checkTextContent(driver, MODE_SPECIFIED);
      const singletonVisible: boolean = await checkTextContent(driver, MODE_SINGLETON);
      expect(standardVisible || specifiedVisible || singletonVisible).assertTrue();
    });

    it('emoji_should_be_detected_as_non_alphanumeric', 0, async () => {
      expect(InputValidator.isAlphanumeric('emoji😀')).assertFalse();
    });

    it('alphanumeric_mixed_returns_true', 0, async () => {
      expect(InputValidator.isAlphanumeric('Tomato1XYZ')).assertTrue();
    });

    it('mode_name_sanitize_round_trip_should_be_stable', 0, async () => {
      const sanitized: string = InputSanitizer.toLower(InputSanitizer.stripWhitespace(' Specified '));
      expect(sanitized).assertEqual(MODE_SPECIFIED);
      expect(InputValidator.isValidModeName(sanitized)).assertTrue();
      expect(LaunchParameterValidator.isConsistentGroup(sanitized, 1)).assertTrue();
    });
  });
}
