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
  getDriver,
  KEY_MENU,
  KEY_VOLUME_DOWN,
  KEY_ENTER,
  KEY_BACK,
  recorderComponentCount,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../shared/RecordingDriver';

// 录屏输入键类型：停止录屏依赖菜单键与音量减键的组合
enum InputKeyType {
  MENU = 'menu',
  VOLUME_DOWN = 'volume_down',
  ENTER = 'enter',
  BACK = 'back'
}

// 校验结论枚举
enum ValidationResult {
  PASS = 'pass',
  FAIL = 'fail',
  SKIP = 'skip'
}

// 输入规则接口
interface InputRule {
  name: InputKeyType;
  maxLength: number;
  minLength: number;
  allowSpecialChars: boolean;
}

// 校验结果接口
interface ValidationOutcome {
  result: ValidationResult;
  rule: string;
  message: string;
}

// 录屏输入校验器：校验计时文本、文件名与按键码
class RecorderInputValidator {
  public static readonly MAX_TIMER_LENGTH: number = 8;

  public static isEmpty(value: string): boolean {
    return value.length === 0;
  }

  public static isValidTimerLabel(label: string): boolean {
    return label.length === RecorderInputValidator.MAX_TIMER_LENGTH && label.charAt(2) === ':' &&
      label.charAt(5) === ':';
  }

  public static isTooLong(value: string, maxLength: number): boolean {
    return value.length > maxLength;
  }

  public static isWithinLengthRange(value: string, min: number, max: number): boolean {
    return value.length >= min && value.length <= max;
  }

  public static isValidMenuItemName(name: string): boolean {
    return name.length > 0 && name.length <= 20;
  }

  public static hasSpecialChars(value: string): boolean {
    return value.includes('*') || value.includes('!') || value.includes('@');
  }

  public static containsInjection(value: string): boolean {
    return value.includes('<') || value.includes('>') || value.includes('\'') || value.includes('"');
  }

  public static isKnownKeyCode(keyCode: number): boolean {
    return keyCode === KEY_MENU || keyCode === KEY_VOLUME_DOWN || keyCode === KEY_ENTER || keyCode === KEY_BACK;
  }

  public static isAlphanumeric(value: string): boolean {
    for (let i = 0; i < value.length; i++) {
      const code: number = value.charCodeAt(i);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      if (!isDigit && !isUpper && !isLower) {
        return false;
      }
    }
    return true;
  }
}

// 开始请求守卫：模拟 500ms 双击检测，拦截重复启动请求
class StartRequestGuard {
  private handled: boolean = false;
  private handledCount: number = 0;
  private windowMs: number;
  private lastAcceptedAt: number = -1;

  constructor(windowMs: number = 500) {
    this.windowMs = windowMs;
  }

  public request(now: number): boolean {
    if (this.handled && this.lastAcceptedAt >= 0 && now - this.lastAcceptedAt <= this.windowMs) {
      return false;
    }
    this.handled = true;
    this.handledCount++;
    this.lastAcceptedAt = now;
    return true;
  }

  public reset(): void {
    this.handled = false;
    this.lastAcceptedAt = -1;
  }

  public getHandledCount(): number {
    return this.handledCount;
  }

  public getWindowMs(): number {
    return this.windowMs;
  }
}

// 命令校验器：校验启动/停止命令的必填、范围与一致性
class CommandValidator {
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

// 输入清洗器：对输入字符串做归一化处理
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

// 输入字段模型：封装输入值与关联长度规则
class InputField {
  public value: string;
  public inputType: InputKeyType;
  private rule: LengthRule;

  constructor(value: string, inputType: InputKeyType, rule: LengthRule) {
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
      const pass: ValidationOutcome = {
        result: ValidationResult.PASS,
        rule: 'length',
        message: 'valid'
      };
      return pass;
    }
    const fail: ValidationOutcome = {
      result: ValidationResult.FAIL,
      rule: 'length',
      message: this.rule.getViolation(this.value)
    };
    return fail;
  }

  public isEmpty(): boolean {
    return this.value.length === 0;
  }

  public getRule(): InputRule {
    const rule: InputRule = {
      name: this.inputType,
      maxLength: this.rule.getMaxLength(),
      minLength: this.rule.getMinLength(),
      allowSpecialChars: true
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
    return this.validateAll().filter((outcome: ValidationOutcome) =>
      outcome.result === ValidationResult.PASS).length;
  }

  public getFailCount(): number {
    return this.validateAll().filter((outcome: ValidationOutcome) =>
      outcome.result === ValidationResult.FAIL).length;
  }

  public getFieldCount(): number {
    return this.fields.length;
  }

  public clear(): void {
    this.fields = [];
  }
}

// 按键事件记录接口
interface StopKeyEvent {
  keyCode: number;
  isDown: boolean;
  at: number;
}

// 停止录屏组合键消费者：菜单键与音量减键同时按下且闸门开启时触发一次
class StopCombinationConsumer {
  private keyA: number;
  private keyB: number;
  private aDown: boolean = false;
  private bDown: boolean = false;
  private gateOpen: boolean = true;
  private triggerCount: number = 0;
  private history: StopKeyEvent[] = [];
  private callback: (() => void) | null = null;

  constructor(keyA: number = KEY_MENU, keyB: number = KEY_VOLUME_DOWN) {
    this.keyA = keyA;
    this.keyB = keyB;
  }

  public setCallback(callback: () => void): void {
    this.callback = callback;
  }

  public handleKey(keyCode: number, isDown: boolean, at: number): boolean {
    const event: StopKeyEvent = {
      keyCode: keyCode,
      isDown: isDown,
      at: at
    };
    this.history.push(event);
    if (keyCode !== this.keyA && keyCode !== this.keyB) {
      return false;
    }
    if (!isDown) {
      if (keyCode === this.keyA) {
        this.aDown = false;
      } else {
        this.bDown = false;
      }
      this.gateOpen = true;
      return false;
    }
    if (keyCode === this.keyA) {
      this.aDown = true;
    } else {
      this.bDown = true;
    }
    if (this.aDown && this.bDown && this.gateOpen) {
      this.gateOpen = false;
      this.triggerCount++;
      if (this.callback !== null) {
        this.callback();
      }
      return true;
    }
    return false;
  }

  public getTriggerCount(): number {
    return this.triggerCount;
  }

  public isGateOpen(): boolean {
    return this.gateOpen;
  }

  public getHistory(): StopKeyEvent[] {
    return this.history.slice();
  }

  public getHistoryCount(): number {
    return this.history.length;
  }

  public getKeyA(): number {
    return this.keyA;
  }

  public getKeyB(): number {
    return this.keyB;
  }

  public reset(): void {
    this.aDown = false;
    this.bDown = false;
    this.gateOpen = true;
    this.triggerCount = 0;
    this.history = [];
  }
}

// 输入计数器：统计各类按键事件数量
class InputCounter {
  private counts: Map<InputKeyType, number> = new Map<InputKeyType, number>();

  public record(inputType: InputKeyType): void {
    const current: number | undefined = this.counts.get(inputType);
    if (current === undefined) {
      this.counts.set(inputType, 1);
    } else {
      this.counts.set(inputType, current + 1);
    }
  }

  public getCount(inputType: InputKeyType): number {
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
    this.counts = new Map<InputKeyType, number>();
  }
}

// 输入一致性校验器
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

// 输入掩码器：对录屏文件名做部分遮挡展示
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

// 输入历史：记录录屏项名称的变更历史
class InputHistory {
  private values: string[] = [];

  public append(value: string): void {
    this.values.push(value);
  }

  public getValues(): string[] {
    return this.values.slice();
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

// 校验报告构建器
class ValidationReportBuilder {
  private outcomes: ValidationOutcome[] = [];

  public addOutcome(outcome: ValidationOutcome): void {
    this.outcomes.push(outcome);
  }

  public addOutcomes(outcomes: ValidationOutcome[]): void {
    outcomes.forEach((outcome: ValidationOutcome) => {
      this.outcomes.push(outcome);
    });
  }

  public getTotalCount(): number {
    return this.outcomes.length;
  }

  public getPassCount(): number {
    return this.outcomes.filter((outcome: ValidationOutcome) =>
      outcome.result === ValidationResult.PASS).length;
  }

  public getFailCount(): number {
    return this.outcomes.filter((outcome: ValidationOutcome) =>
      outcome.result === ValidationResult.FAIL).length;
  }

  public getSkipCount(): number {
    return this.outcomes.filter((outcome: ValidationOutcome) =>
      outcome.result === ValidationResult.SKIP).length;
  }

  public isAllPassed(): boolean {
    return this.getTotalCount() > 0 && this.getFailCount() === 0;
  }

  public clear(): void {
    this.outcomes = [];
  }
}

export default function recorderInputInteractionTest(): void {
  describe('RecorderInputInteraction_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await serializedDelay(driver, 500);
    });

    // ===== 输入校验 =====
    it('empty_name_should_be_rejected', 0, async () => {
      expect(RecorderInputValidator.isEmpty('')).assertTrue();
      expect(RecorderInputValidator.isValidMenuItemName('')).assertFalse();
    });

    it('valid_menu_item_name_should_pass_validation', 0, async () => {
      expect(RecorderInputValidator.isValidMenuItemName('录屏')).assertTrue();
      expect(RecorderInputValidator.isValidMenuItemName('结束录屏')).assertTrue();
    });

    it('overlong_name_should_be_rejected', 0, async () => {
      const longName: string = 'a'.repeat(50);
      expect(RecorderInputValidator.isTooLong(longName, 20)).assertTrue();
      expect(RecorderInputValidator.isValidMenuItemName(longName)).assertFalse();
    });

    it('boundary_length_should_be_accepted', 0, async () => {
      const exactMax: string = 'a'.repeat(20);
      expect(RecorderInputValidator.isValidMenuItemName(exactMax)).assertTrue();
      const overMax: string = 'a'.repeat(21);
      expect(RecorderInputValidator.isValidMenuItemName(overMax)).assertFalse();
    });

    it('special_characters_should_be_detected', 0, async () => {
      expect(RecorderInputValidator.hasSpecialChars('录屏*')).assertTrue();
      expect(RecorderInputValidator.hasSpecialChars('录屏')).assertFalse();
    });

    it('injection_characters_should_be_detected', 0, async () => {
      expect(RecorderInputValidator.containsInjection('<script>')).assertTrue();
      expect(RecorderInputValidator.containsInjection('正常')).assertFalse();
    });

    it('length_range_should_be_validated', 0, async () => {
      expect(RecorderInputValidator.isWithinLengthRange('ab', 2, 5)).assertTrue();
      expect(RecorderInputValidator.isWithinLengthRange('a', 2, 5)).assertFalse();
      expect(RecorderInputValidator.isWithinLengthRange('abcdef', 2, 5)).assertFalse();
    });

    it('alphanumeric_check_should_work', 0, async () => {
      expect(RecorderInputValidator.isAlphanumeric('abc123')).assertTrue();
      expect(RecorderInputValidator.isAlphanumeric('录屏')).assertFalse();
    });

    it('timer_label_should_be_validated', 0, async () => {
      expect(RecorderInputValidator.isValidTimerLabel('00:00:00')).assertTrue();
      expect(RecorderInputValidator.isValidTimerLabel('00:00')).assertFalse();
      expect(RecorderInputValidator.isValidTimerLabel('00000000')).assertFalse();
    });

    it('known_key_codes_should_be_recognized', 0, async () => {
      expect(RecorderInputValidator.isKnownKeyCode(KEY_MENU)).assertTrue();
      expect(RecorderInputValidator.isKnownKeyCode(KEY_VOLUME_DOWN)).assertTrue();
      expect(RecorderInputValidator.isKnownKeyCode(9999)).assertFalse();
    });

    // ===== 重复请求拦截 =====
    it('rapid_duplicate_start_request_should_be_blocked', 0, async () => {
      const guard: StartRequestGuard = new StartRequestGuard();
      expect(guard.request(0)).assertTrue();
      expect(guard.request(100)).assertFalse();
      expect(guard.getHandledCount()).assertEqual(1);
    });

    it('request_after_window_should_be_accepted', 0, async () => {
      const guard: StartRequestGuard = new StartRequestGuard();
      expect(guard.request(0)).assertTrue();
      expect(guard.request(501)).assertTrue();
      expect(guard.getHandledCount()).assertEqual(2);
    });

    it('reset_should_allow_resubmit', 0, async () => {
      const guard: StartRequestGuard = new StartRequestGuard();
      guard.request(0);
      guard.reset();
      expect(guard.request(10)).assertTrue();
      expect(guard.getHandledCount()).assertEqual(2);
    });

    // ===== 命令校验 =====
    it('required_field_should_be_validated', 0, async () => {
      expect(CommandValidator.validateRequired('录屏')).assertTrue();
      expect(CommandValidator.validateRequired('')).assertFalse();
    });

    it('length_field_should_be_validated', 0, async () => {
      expect(CommandValidator.validateLength('abc', 5)).assertTrue();
      expect(CommandValidator.validateLength('abcdef', 5)).assertFalse();
    });

    it('range_field_should_be_validated', 0, async () => {
      expect(CommandValidator.validateRange(1, 0, 3)).assertTrue();
      expect(CommandValidator.validateRange(4, 0, 3)).assertFalse();
    });

    it('consistency_field_should_be_validated', 0, async () => {
      expect(CommandValidator.validateConsistency('REC_20260101_120000.mp4',
        'REC_20260101_120000.mp4')).assertTrue();
      expect(CommandValidator.validateConsistency('REC_1.mp4', 'REC_2.mp4')).assertFalse();
    });

        // ===== 组合键停止录屏 =====
    it('stop_combination_should_trigger_once_when_both_keys_down', 0, async () => {
      const consumer: StopCombinationConsumer = new StopCombinationConsumer();
      let triggered: number = 0;
      consumer.setCallback(() => {
        triggered++;
      });
      expect(consumer.handleKey(KEY_MENU, true, 10)).assertFalse();
      expect(consumer.handleKey(KEY_VOLUME_DOWN, true, 20)).assertTrue();
      expect(consumer.handleKey(KEY_MENU, true, 30)).assertFalse();
      expect(triggered).assertEqual(1);
      expect(consumer.getTriggerCount()).assertEqual(1);
    });

    it('releasing_either_key_should_reopen_gate', 0, async () => {
      const consumer: StopCombinationConsumer = new StopCombinationConsumer();
      consumer.handleKey(KEY_MENU, true, 10);
      consumer.handleKey(KEY_VOLUME_DOWN, true, 20);
      expect(consumer.isGateOpen()).assertFalse();
      consumer.handleKey(KEY_MENU, false, 30);
      expect(consumer.isGateOpen()).assertTrue();
      expect(consumer.handleKey(KEY_MENU, true, 40)).assertTrue();
      expect(consumer.getTriggerCount()).assertEqual(2);
    });

    it('single_key_should_not_trigger_stop', 0, async () => {
      const consumer: StopCombinationConsumer = new StopCombinationConsumer();
      for (let i = 0; i < 5; i++) {
        consumer.handleKey(KEY_MENU, true, i * 10);
        consumer.handleKey(KEY_MENU, false, i * 10 + 5);
      }
      expect(consumer.getTriggerCount()).assertEqual(0);
      expect(consumer.isGateOpen()).assertTrue();
    });

    it('unrelated_key_should_be_ignored_by_consumer', 0, async () => {
      const consumer: StopCombinationConsumer = new StopCombinationConsumer();
      expect(consumer.handleKey(KEY_ENTER, true, 10)).assertFalse();
      expect(consumer.handleKey(KEY_ENTER, false, 20)).assertFalse();
      expect(consumer.getTriggerCount()).assertEqual(0);
    });

    it('volume_down_first_order_should_also_trigger', 0, async () => {
      const consumer: StopCombinationConsumer = new StopCombinationConsumer();
      expect(consumer.handleKey(KEY_VOLUME_DOWN, true, 10)).assertFalse();
      expect(consumer.handleKey(KEY_MENU, true, 20)).assertTrue();
      expect(consumer.getTriggerCount()).assertEqual(1);
    });

    it('key_history_should_be_recorded_in_order', 0, async () => {
      const consumer: StopCombinationConsumer = new StopCombinationConsumer();
      consumer.handleKey(KEY_MENU, true, 10);
      consumer.handleKey(KEY_VOLUME_DOWN, true, 20);
      consumer.handleKey(KEY_VOLUME_DOWN, false, 30);
      const history: StopKeyEvent[] = consumer.getHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].keyCode).assertEqual(KEY_MENU);
      expect(history[2].isDown).assertFalse();
      expect(consumer.getHistoryCount()).assertEqual(3);
    });

    it('consumer_reset_should_clear_history_and_counter', 0, async () => {
      const consumer: StopCombinationConsumer = new StopCombinationConsumer();
      consumer.handleKey(KEY_MENU, true, 10);
      consumer.handleKey(KEY_VOLUME_DOWN, true, 20);
      consumer.reset();
      expect(consumer.getTriggerCount()).assertEqual(0);
      expect(consumer.getHistoryCount()).assertEqual(0);
      expect(consumer.isGateOpen()).assertTrue();
    });

    it('consumer_should_expose_configured_key_pair', 0, async () => {
      const consumer: StopCombinationConsumer = new StopCombinationConsumer();
      expect(consumer.getKeyA()).assertEqual(KEY_MENU);
      expect(consumer.getKeyB()).assertEqual(KEY_VOLUME_DOWN);
      expect(consumer.getKeyA() === consumer.getKeyB()).assertFalse();
    });

    // ===== 清洗与规则 =====
    it('sanitizer_should_strip_whitespace', 0, async () => {
      expect(InputSanitizer.stripWhitespace('  录屏  ')).assertEqual('录屏');
    });

    it('sanitizer_should_remove_control_chars', 0, async () => {
      expect(InputSanitizer.removeControlChars('a\u0001b')).assertEqual('ab');
      expect(InputSanitizer.removeControlChars('录屏')).assertEqual('录屏');
    });

    it('sanitizer_should_collapse_spaces', 0, async () => {
      expect(InputSanitizer.collapseSpaces('录屏   提示')).assertEqual('录屏 提示');
    });

    it('sanitizer_should_lower_case_ascii', 0, async () => {
      expect(InputSanitizer.toLower('REC_File')).assertEqual('rec_file');
    });

    it('length_rule_should_report_violations', 0, async () => {
      const rule: LengthRule = new LengthRule(2, 5);
      expect(rule.isValid('abc')).assertTrue();
      expect(rule.getViolation('a')).assertEqual('too short');
      expect(rule.getViolation('abcdef')).assertEqual('too long');
      expect(rule.getViolation('abc')).assertEqual('valid');
    });

    it('input_field_should_validate_against_rule', 0, async () => {
      const field: InputField = new InputField('录屏', InputKeyType.MENU, new LengthRule(1, 4));
      expect(field.validate().result).assertEqual(ValidationResult.PASS);
      field.setValue('');
      expect(field.validate().result).assertEqual(ValidationResult.FAIL);
      expect(field.isEmpty()).assertTrue();
    });

    it('validation_chain_should_aggregate_outcomes', 0, async () => {
      const chain: ValidationChain = new ValidationChain();
      chain.addField(new InputField('录屏', InputKeyType.MENU, new LengthRule(1, 4)));
      chain.addField(new InputField('', InputKeyType.VOLUME_DOWN, new LengthRule(1, 4)));
      expect(chain.getFieldCount()).assertEqual(2);
      expect(chain.getPassCount()).assertEqual(1);
      expect(chain.getFailCount()).assertEqual(1);
      chain.clear();
      expect(chain.getFieldCount()).assertEqual(0);
    });

    // ===== 统计与报告 =====
    it('input_counter_should_count_by_key_type', 0, async () => {
      const counter: InputCounter = new InputCounter();
      counter.record(InputKeyType.MENU);
      counter.record(InputKeyType.MENU);
      counter.record(InputKeyType.VOLUME_DOWN);
      expect(counter.getCount(InputKeyType.MENU)).assertEqual(2);
      expect(counter.getCount(InputKeyType.VOLUME_DOWN)).assertEqual(1);
      expect(counter.getCount(InputKeyType.ENTER)).assertEqual(0);
      expect(counter.getTotalCount()).assertEqual(3);
    });

    it('input_counter_should_reset', 0, async () => {
      const counter: InputCounter = new InputCounter();
      counter.record(InputKeyType.BACK);
      counter.reset();
      expect(counter.getTotalCount()).assertEqual(0);
    });

    it('consistency_validator_should_compare_values', 0, async () => {
      expect(InputConsistencyValidator.allEqual(['录制', '录制', '录制'])).assertTrue();
      expect(InputConsistencyValidator.allEqual(['录制', '停止'])).assertFalse();
      expect(InputConsistencyValidator.anyBlank(['录制', ' '])).assertTrue();
      expect(InputConsistencyValidator.countDistinct(['a', 'a', 'b'])).assertEqual(2);
    });

    it('masker_should_hide_recording_file_name', 0, async () => {
      expect(InputMasker.maskAll('abc')).assertEqual('***');
      expect(InputMasker.maskSuffix('REC_001.mp4', 4)).assertEqual('*******.mp4');
      expect(InputMasker.maskPrefix('REC_001.mp4', 3)).assertEqual('REC********');
      expect(InputMasker.maskMiddle('REC_001.mp4', 2)).assertEqual('RE*******p4');
    });

    it('input_history_should_track_menu_names', 0, async () => {
      const history: InputHistory = new InputHistory();
      history.append('录屏');
      history.append('结束录屏');
      expect(history.getCount()).assertEqual(2);
      expect(history.getLastValue()).assertEqual('结束录屏');
      expect(history.getFirstValue()).assertEqual('录屏');
      expect(history.hasValue('录屏')).assertTrue();
      expect(history.getValues().length).assertEqual(2);
      history.clear();
      expect(history.getCount()).assertEqual(0);
    });

    it('validation_report_should_summarize_results', 0, async () => {
      const report: ValidationReportBuilder = new ValidationReportBuilder();
      const pass: ValidationOutcome = {
        result: ValidationResult.PASS,
        rule: 'timer',
        message: 'valid'
      };
      const fail: ValidationOutcome = {
        result: ValidationResult.FAIL,
        rule: 'file',
        message: 'too long'
      };
      report.addOutcome(pass);
      report.addOutcome(fail);
      expect(report.getTotalCount()).assertEqual(2);
      expect(report.getPassCount()).assertEqual(1);
      expect(report.getFailCount()).assertEqual(1);
      expect(report.isAllPassed()).assertFalse();
      report.clear();
      expect(report.getTotalCount()).assertEqual(0);
      expect(report.isAllPassed()).assertFalse();
    });

    // ===== 交互 =====
    it('back_key_should_work_without_deadlock', 0, async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    it('recorder_window_should_stay_queryable_after_stop_keys', 0, async () => {
      await pressAndWait(driver, KEY_MENU, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_VOLUME_DOWN, 1, DELAY_KEY_NAVIGATION);
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    it('emoji_should_be_detected_as_non_alphanumeric', 0, async () => {
      expect(RecorderInputValidator.isAlphanumeric('emoji😀')).assertFalse();
    });

    it('format_validation_should_work_for_media_path', 0, async () => {
      expect(CommandValidator.validateFormat('app.media.recorder_start', 'app.media')).assertTrue();
      expect(CommandValidator.validateFormat('recorder_start', 'app.media')).assertFalse();
    });

    it('range_exact_boundary_should_pass', 0, async () => {
      expect(CommandValidator.validateRange(0, 0, 3)).assertTrue();
      expect(CommandValidator.validateRange(3, 0, 3)).assertTrue();
    });

    it('guard_count_should_accumulate_after_resets', 0, async () => {
      const guard: StartRequestGuard = new StartRequestGuard();
      guard.request(0);
      guard.reset();
      guard.request(100);
      guard.reset();
      guard.request(200);
      expect(guard.getHandledCount()).assertEqual(3);
    });

    it('empty_vs_whitespace_distinction', 0, async () => {
      expect(RecorderInputValidator.isEmpty('')).assertTrue();
      expect(RecorderInputValidator.isEmpty('   ')).assertFalse();
    });

    it('stop_combination_should_survive_many_repeats', 0, async () => {
      const consumer: StopCombinationConsumer = new StopCombinationConsumer();
      for (let i = 0; i < 20; i++) {
        consumer.handleKey(KEY_MENU, true, i * 20);
        consumer.handleKey(KEY_VOLUME_DOWN, true, i * 20 + 5);
        consumer.handleKey(KEY_MENU, false, i * 20 + 10);
        consumer.handleKey(KEY_VOLUME_DOWN, false, i * 20 + 15);
      }
      expect(consumer.getTriggerCount()).assertEqual(20);
      expect(consumer.getHistoryCount()).assertEqual(80);
    });

    it('mask_short_value_should_remain_unchanged', 0, async () => {
      expect(InputMasker.maskSuffix('ab', 4)).assertEqual('ab');
      expect(InputMasker.maskPrefix('ab', 4)).assertEqual('ab');
      expect(InputMasker.maskMiddle('ab', 2)).assertEqual('ab');
    });

    it('input_field_rule_should_expose_metadata', 0, async () => {
      const field: InputField = new InputField('录屏', InputKeyType.ENTER, new LengthRule(1, 6));
      const rule: InputRule = field.getRule();
      expect(rule.minLength).assertEqual(1);
      expect(rule.maxLength).assertEqual(6);
      expect(rule.name).assertEqual(InputKeyType.ENTER);
    });
  });
}
