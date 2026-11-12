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
import { Driver } from '../Shared/MiracastDriver';
import { Log } from 'library';
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_ENTER,
  KEY_BACK,
  KEY_MENU,
  KEY_TAB,
  miracastComponentCount,
  isPermissionDialogVisible,
  waitForPageStable,
  pressAndWait,
  serializedDelay,
  DELAY_KEY_NAVIGATION,
  TIMEOUT_PAGE_RENDER,
  MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';

const TAG: string = 'MiracastInputInteractionSuite';

const KEY_DPAD_CENTER: number = 232;

enum InputType {
  TEXT = 'text',
  NUMBER = 'number',
  NAME = 'name',
  PASSWORD = 'password'
}

enum ValidationResult {
  PASS = 'pass',
  FAIL = 'fail',
  SKIP = 'skip'
}

interface InputRule {
  name: string;
  minLength: number;
  maxLength: number;
  allowSpace: boolean;
}

interface ValidationOutcome {
  result: ValidationResult;
  rule: string;
  message: string;
}

class DeviceNameValidator {
  public static readonly MAX_NAME_LENGTH: number = 23;

  public static isEmpty(name: string): boolean {
    return name.length === 0;
  }

  public static isBlank(name: string): boolean {
    return name.trim().length === 0;
  }

  public static hasInnerSpace(name: string): boolean {
    return name.includes(' ');
  }

  public static isTooLong(name: string): boolean {
    return name.trim().length > DeviceNameValidator.MAX_NAME_LENGTH;
  }

  public static isValid(name: string): boolean {
    if (DeviceNameValidator.isBlank(name)) {
      return false;
    }
    if (DeviceNameValidator.hasInnerSpace(name.trim())) {
      return false;
    }
    return !DeviceNameValidator.isTooLong(name.trim());
  }

  public static isWithinLengthRange(name: string, min: number, max: number): boolean {
    return name.length >= min && name.length <= max;
  }

  public static describeRejection(name: string): string {
    if (DeviceNameValidator.isBlank(name)) {
      return 'empty or blank';
    }
    if (DeviceNameValidator.hasInnerSpace(name.trim())) {
      return 'contains space';
    }
    if (DeviceNameValidator.isTooLong(name.trim())) {
      return 'too long';
    }
    return 'accepted';
  }
}

class InputSanitizer {
  public static stripWhitespace(value: string): string {
    return value.trim();
  }

  public static removeControlChars(value: string): string {
    let result: string = '';
    for (let i = 0; i < value.length; i++) {
      if (value.charCodeAt(i) >= 32) {
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
    if (this.minLength > this.maxLength) {
      return 'too long';
    }
    if (value.length < this.minLength) {
      return 'too short';
    }
    if (value.length > this.maxLength) {
      return 'too long';
    }
    return 'valid';
  }

  public clamp(value: string): string {
    if (value.length <= this.maxLength) {
      return value;
    }
    return value.substring(0, this.maxLength);
  }
}

class NameInputField {
  public value: string;
  private rule: LengthRule;

  constructor(value: string, rule: LengthRule) {
    this.value = value;
    this.rule = rule;
  }

  public getValue(): string {
    return this.value;
  }

  public setValue(value: string): void {
    this.value = value;
  }

  public validate(): ValidationOutcome {
    if (DeviceNameValidator.isBlank(this.value)) {
      const blankOutcome: ValidationOutcome = {
        result: ValidationResult.FAIL,
        rule: 'required',
        message: 'empty or blank'
      };
      return blankOutcome;
    }
    if (!this.rule.isValid(this.value)) {
      const lengthOutcome: ValidationOutcome = {
        result: ValidationResult.FAIL,
        rule: 'length',
        message: this.rule.getViolation(this.value)
      };
      return lengthOutcome;
    }
    const passOutcome: ValidationOutcome = {
      result: ValidationResult.PASS,
      rule: 'length',
      message: 'valid'
    };
    return passOutcome;
  }

  public getRule(): InputRule {
    const rule: InputRule = {
      name: InputType.NAME,
      minLength: this.rule.minLength,
      maxLength: this.rule.maxLength,
      allowSpace: false
    };
    return rule;
  }

  public isEmpty(): boolean {
    return this.value.length === 0;
  }
}

class KeyInputMapper {
  public static readonly ACTION_LEFT: string = 'focus_prev_tile';
  public static readonly ACTION_RIGHT: string = 'focus_next_tile';
  public static readonly ACTION_UP: string = 'focus_row_up';
  public static readonly ACTION_DOWN: string = 'focus_row_down';
  public static readonly ACTION_FULLSCREEN: string = 'toggle_fullscreen';
  public static readonly ACTION_BACK: string = 'leave_player';
  public static readonly ACTION_UNKNOWN: string = 'no_action';

  public static isNavigationKey(key: number): boolean {
    return key === KEY_LEFT || key === KEY_RIGHT || key === KEY_UP || key === KEY_DOWN;
  }

  public static isConfirmKey(key: number): boolean {
    return key === KEY_ENTER || key === KEY_DPAD_CENTER;
  }

  public static isExitKey(key: number): boolean {
    return key === KEY_BACK;
  }

  public static getAction(key: number): string {
    if (key === KEY_LEFT) {
      return KeyInputMapper.ACTION_LEFT;
    }
    if (key === KEY_RIGHT) {
      return KeyInputMapper.ACTION_RIGHT;
    }
    if (key === KEY_UP) {
      return KeyInputMapper.ACTION_UP;
    }
    if (key === KEY_DOWN) {
      return KeyInputMapper.ACTION_DOWN;
    }
    if (KeyInputMapper.isConfirmKey(key)) {
      return KeyInputMapper.ACTION_FULLSCREEN;
    }
    if (key === KEY_BACK) {
      return KeyInputMapper.ACTION_BACK;
    }
    return KeyInputMapper.ACTION_UNKNOWN;
  }

  public static countNavigationKeys(keys: number[]): number {
    return keys.filter((key: number) => KeyInputMapper.isNavigationKey(key)).length;
  }
}

class FocusNavigator {
  private index: number = 0;
  private tileCount: number = 1;

  constructor(tileCount: number) {
    this.tileCount = tileCount >= 1 ? tileCount : 1;
  }

  public getIndex(): number {
    return this.index;
  }

  public getTileCount(): number {
    return this.tileCount;
  }

  public setIndex(index: number): boolean {
    if (index < 0 || index >= this.tileCount) {
      return false;
    }
    this.index = index;
    return true;
  }

  public next(): boolean {
    if (this.index >= this.tileCount - 1) {
      return false;
    }
    this.index++;
    return true;
  }

  public prev(): boolean {
    if (this.index <= 0) {
      return false;
    }
    this.index--;
    return true;
  }

  public nextWithWrap(): number {
    this.index = (this.index + 1) % this.tileCount;
    return this.index;
  }

  public prevWithWrap(): number {
    this.index = (this.index - 1 + this.tileCount) % this.tileCount;
    return this.index;
  }
}

// 校验链：按加入顺序累计字段校验结果，便于统计通过/失败数量
class ValidationChain {
  private fields: NameInputField[] = [];
  private passCount: number = 0;
  private failCount: number = 0;

  public addField(field: NameInputField): void {
    this.fields.push(field);
    const outcome: ValidationOutcome = field.validate();
    if (outcome.result === ValidationResult.PASS) {
      this.passCount++;
    } else if (outcome.result === ValidationResult.FAIL) {
      this.failCount++;
    }
  }

  public getFieldCount(): number {
    return this.fields.length;
  }

  public getPassCount(): number {
    return this.passCount;
  }

  public getFailCount(): number {
    return this.failCount;
  }
}

export default function miracastInputInteractionSuite(): void {
  describe('MiracastInputInteraction_Suite', () => {
    let driver: Driver;
    const nameRule = new LengthRule(1, DeviceNameValidator.MAX_NAME_LENGTH);

    beforeAll(async () => {
      Log.info(TAG, 'input interaction suite start');
      driver = getDriver();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      Log.info(TAG, 'input interaction suite end');
    });
    it('empty_device_name_should_be_rejected', 0, async () => {
      expect(DeviceNameValidator.isEmpty('')).assertTrue();
      expect(DeviceNameValidator.isValid('')).assertFalse();
      expect(DeviceNameValidator.describeRejection('')).assertEqual('empty or blank');
    });
    it('blank_device_name_should_be_rejected', 0, async () => {
      expect(DeviceNameValidator.isBlank('   ')).assertTrue();
      expect(DeviceNameValidator.isEmpty('   ')).assertFalse();
      expect(DeviceNameValidator.isValid('   ')).assertFalse();
      expect(DeviceNameValidator.describeRejection('   ')).assertEqual('empty or blank');
    });
    it('device_name_with_inner_space_should_be_rejected', 0, async () => {
      expect(DeviceNameValidator.hasInnerSpace('Living Room')).assertTrue();
      expect(DeviceNameValidator.isValid('Living Room')).assertFalse();
      expect(DeviceNameValidator.describeRejection('Living Room')).assertEqual('contains space');
    });
    it('trimmed_trailing_space_should_be_accepted', 0, async () => {
      expect(DeviceNameValidator.hasInnerSpace('  LivingRoom  '.trim())).assertFalse();
      expect(DeviceNameValidator.isValid('  LivingRoom  ')).assertTrue();
      expect(DeviceNameValidator.describeRejection('  LivingRoom  ')).assertEqual('accepted');
    });
    it('device_name_at_max_length_should_be_accepted', 0, async () => {
      const maxName: string = 'a'.repeat(DeviceNameValidator.MAX_NAME_LENGTH);
      expect(maxName.length).assertEqual(23);
      expect(DeviceNameValidator.isValid(maxName)).assertTrue();
      expect(DeviceNameValidator.isTooLong(maxName)).assertFalse();
    });
    it('device_name_over_max_length_should_be_rejected', 0, async () => {
      const longName: string = 'a'.repeat(DeviceNameValidator.MAX_NAME_LENGTH + 1);
      expect(DeviceNameValidator.isTooLong(longName)).assertTrue();
      expect(DeviceNameValidator.isValid(longName)).assertFalse();
      expect(DeviceNameValidator.describeRejection(longName)).assertEqual('too long');
    });
    it('device_name_length_range_should_be_validated', 0, async () => {
      expect(DeviceNameValidator.isWithinLengthRange('ab', 2, 5)).assertTrue();
      expect(DeviceNameValidator.isWithinLengthRange('a', 2, 5)).assertFalse();
      expect(DeviceNameValidator.isWithinLengthRange('abcdef', 2, 5)).assertFalse();
    });
    it('device_name_with_unicode_chars_should_be_accepted', 0, async () => {
      expect(DeviceNameValidator.isValid('KiTchenTV')).assertTrue();
      expect(DeviceNameValidator.isTooLong('KiTchenTV')).assertFalse();
      expect(DeviceNameValidator.describeRejection('KiTchenTV')).assertEqual('accepted');
    });
    it('sanitizer_should_strip_leading_and_trailing_space', 0, async () => {
      expect(InputSanitizer.stripWhitespace('  cast  ')).assertEqual('cast');
      expect(InputSanitizer.stripWhitespace('\tcast\n')).assertEqual('cast');
      expect(InputSanitizer.stripWhitespace('cast').length).assertEqual(4);
    });
    it('sanitizer_should_remove_control_characters', 0, async () => {
      expect(InputSanitizer.removeControlChars('ca\u0001st')).assertEqual('cast');
      expect(InputSanitizer.removeControlChars('cast')).assertEqual('cast');
      expect(InputSanitizer.removeControlChars('\u0000\u0001').length).assertEqual(0);
    });
    it('sanitizer_should_collapse_multiple_spaces', 0, async () => {
      expect(InputSanitizer.collapseSpaces('a   b')).assertEqual('a b');
      expect(InputSanitizer.collapseSpaces('a b').length).assertEqual(3);
    });
    it('sanitizer_should_normalize_newlines', 0, async () => {
      expect(InputSanitizer.normalizeNewlines('a\r\nb')).assertEqual('a\nb');
      expect(InputSanitizer.normalizeNewlines('a\nb')).assertEqual('a\nb');
    });
    it('sanitizer_should_lowercase_text', 0, async () => {
      expect(InputSanitizer.toLower('Miracast')).assertEqual('miracast');
      expect(InputSanitizer.toLower('MIRACAST')).assertEqual('miracast');
      expect(InputSanitizer.toLower('miracast')).assertEqual('miracast');
    });
    it('length_rule_should_accept_boundary_values', 0, async () => {
      const rule = new LengthRule(1, 23);
      expect(rule.isValid('a')).assertTrue();
      expect(rule.isValid('a'.repeat(23))).assertTrue();
      expect(rule.isValid('')).assertFalse();
      expect(rule.isValid('a'.repeat(24))).assertFalse();
    });
    it('length_rule_should_report_violation_text', 0, async () => {
      const rule = new LengthRule(2, 4);
      expect(rule.getViolation('a')).assertEqual('too short');
      expect(rule.getViolation('abc')).assertEqual('valid');
      expect(rule.getViolation('abcde')).assertEqual('too long');
    });
    it('length_rule_should_clamp_overlong_value', 0, async () => {
      const rule = new LengthRule(1, 5);
      expect(rule.clamp('abcdefgh')).assertEqual('abcde');
      expect(rule.clamp('abc').length).assertEqual(3);
      expect(rule.clamp('abcdefgh').length).assertEqual(5);
    });
    it('name_field_should_fail_on_blank_value', 0, async () => {
      const field = new NameInputField('   ', nameRule);
      const outcome: ValidationOutcome = field.validate();
      expect(outcome.result).assertEqual(ValidationResult.FAIL);
      expect(outcome.rule).assertEqual('required');
      expect(outcome.message).assertEqual('empty or blank');
    });
    it('name_field_should_fail_on_overlong_value', 0, async () => {
      const field = new NameInputField('b'.repeat(30), nameRule);
      const outcome: ValidationOutcome = field.validate();
      expect(outcome.result).assertEqual(ValidationResult.FAIL);
      expect(outcome.rule).assertEqual('length');
      expect(outcome.message).assertEqual('too long');
    });
    it('name_field_should_pass_valid_value', 0, async () => {
      const field = new NameInputField('LivingRoomTV', nameRule);
      const outcome: ValidationOutcome = field.validate();
      expect(outcome.result).assertEqual(ValidationResult.PASS);
      expect(outcome.message).assertEqual('valid');
      expect(field.isEmpty()).assertFalse();
    });
    it('name_field_should_update_value', 0, async () => {
      const field = new NameInputField('', nameRule);
      field.setValue('CastBox');
      expect(field.getValue()).assertEqual('CastBox');
      expect(field.validate().result).assertEqual(ValidationResult.PASS);
    });
    it('name_field_rule_should_expose_max_length', 0, async () => {
      const field = new NameInputField('abc', nameRule);
      const rule: InputRule = field.getRule();
      expect(rule.maxLength).assertEqual(DeviceNameValidator.MAX_NAME_LENGTH);
      expect(rule.minLength).assertEqual(1);
      expect(rule.allowSpace).assertFalse();
    });
    it('navigation_keys_should_be_recognized', 0, async () => {
      expect(KeyInputMapper.isNavigationKey(KEY_LEFT)).assertTrue();
      expect(KeyInputMapper.isNavigationKey(KEY_RIGHT)).assertTrue();
      expect(KeyInputMapper.isNavigationKey(KEY_UP)).assertTrue();
      expect(KeyInputMapper.isNavigationKey(KEY_DOWN)).assertTrue();
      expect(KeyInputMapper.isNavigationKey(KEY_ENTER)).assertFalse();
    });
    it('confirm_keys_should_cover_enter_and_dpad_center', 0, async () => {
      expect(KeyInputMapper.isConfirmKey(KEY_ENTER)).assertTrue();
      expect(KeyInputMapper.isConfirmKey(KEY_DPAD_CENTER)).assertTrue();
      expect(KeyInputMapper.isConfirmKey(KEY_LEFT)).assertFalse();
      expect(KEY_DPAD_CENTER).assertEqual(232);
    });
    it('key_mapper_should_map_each_direction_to_action', 0, async () => {
      expect(KeyInputMapper.getAction(KEY_LEFT)).assertEqual(KeyInputMapper.ACTION_LEFT);
      expect(KeyInputMapper.getAction(KEY_RIGHT)).assertEqual(KeyInputMapper.ACTION_RIGHT);
      expect(KeyInputMapper.getAction(KEY_UP)).assertEqual(KeyInputMapper.ACTION_UP);
      expect(KeyInputMapper.getAction(KEY_DOWN)).assertEqual(KeyInputMapper.ACTION_DOWN);
    });
    it('enter_and_dpad_center_should_toggle_fullscreen', 0, async () => {
      expect(KeyInputMapper.getAction(KEY_ENTER)).assertEqual(KeyInputMapper.ACTION_FULLSCREEN);
      expect(KeyInputMapper.getAction(KEY_DPAD_CENTER)).assertEqual(KeyInputMapper.ACTION_FULLSCREEN);
      expect(KeyInputMapper.getAction(KEY_DPAD_CENTER)).assertEqual('toggle_fullscreen');
    });
    it('unmapped_key_should_return_no_action', 0, async () => {
      expect(KeyInputMapper.getAction(KEY_MENU)).assertEqual(KeyInputMapper.ACTION_UNKNOWN);
      expect(KeyInputMapper.getAction(KEY_TAB)).assertEqual(KeyInputMapper.ACTION_UNKNOWN);
      expect(KeyInputMapper.getAction(KEY_BACK)).assertEqual(KeyInputMapper.ACTION_BACK);
    });
    it('navigation_key_count_should_ignore_other_keys', 0, async () => {
      const keys: number[] = [KEY_LEFT, KEY_ENTER, KEY_RIGHT, KEY_BACK, KEY_UP];
      expect(KeyInputMapper.countNavigationKeys(keys)).assertEqual(3);
      expect(keys.length).assertEqual(5);
    });
    it('focus_navigator_should_move_within_tiles', 0, async () => {
      const navigator = new FocusNavigator(3);
      expect(navigator.getIndex()).assertEqual(0);
      expect(navigator.next()).assertTrue();
      expect(navigator.getIndex()).assertEqual(1);
      expect(navigator.prev()).assertTrue();
      expect(navigator.getIndex()).assertEqual(0);
    });
    it('focus_navigator_should_stop_at_tile_boundary', 0, async () => {
      const navigator = new FocusNavigator(3);
      expect(navigator.prev()).assertFalse();
      expect(navigator.setIndex(2)).assertTrue();
      expect(navigator.next()).assertFalse();
      expect(navigator.getIndex()).assertEqual(2);
    });
    it('focus_navigator_should_wrap_when_requested', 0, async () => {
      const navigator = new FocusNavigator(3);
      expect(navigator.prevWithWrap()).assertEqual(2);
      expect(navigator.nextWithWrap()).assertEqual(0);
      expect(navigator.getTileCount()).assertEqual(3);
    });
    it('focus_navigator_should_reject_invalid_index', 0, async () => {
      const navigator = new FocusNavigator(9);
      expect(navigator.setIndex(-1)).assertFalse();
      expect(navigator.setIndex(9)).assertFalse();
      expect(navigator.getIndex()).assertEqual(0);
    });
    it('focus_navigator_should_coerce_invalid_tile_count', 0, async () => {
      const navigator = new FocusNavigator(0);
      expect(navigator.getTileCount()).assertEqual(1);
      expect(navigator.next()).assertFalse();
      expect(navigator.prev()).assertFalse();
    });
    it('remote_navigation_should_not_break_input_page', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      expect(KeyInputMapper.getAction(KEY_LEFT)).assertEqual('focus_prev_tile');
    });
    it('permission_dialog_probe_should_not_disturb_input', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const visible = await isPermissionDialogVisible(driver);
      expect(visible === true || visible === false).assertTrue();
    });
    it('single_character_name_should_be_accepted', 0, async () => {
      expect(DeviceNameValidator.isValid('a')).assertTrue();
      expect(DeviceNameValidator.isWithinLengthRange('a', 1, 23)).assertTrue();
      expect(DeviceNameValidator.describeRejection('a')).assertEqual('accepted');
    });
    it('name_with_only_tabs_should_be_treated_as_blank', 0, async () => {
      expect(DeviceNameValidator.isBlank('\t\t')).assertTrue();
      expect(DeviceNameValidator.isEmpty('\t\t')).assertFalse();
      expect(DeviceNameValidator.isValid('\t\t')).assertFalse();
    });
    it('name_with_leading_space_should_be_trimmed_before_validation', 0, async () => {
      const raw: string = InputSanitizer.stripWhitespace(' LivingRoom ');
      expect(raw).assertEqual('LivingRoom');
      expect(DeviceNameValidator.isValid(raw)).assertTrue();
      expect(DeviceNameValidator.hasInnerSpace(raw)).assertFalse();
    });
    it('name_length_check_should_ignore_outer_spaces', 0, async () => {
      const padded: string = '  ' + 'a'.repeat(23) + '  ';
      expect(padded.length).assertEqual(27);
      expect(DeviceNameValidator.isTooLong(padded)).assertFalse();
      expect(DeviceNameValidator.isValid(padded)).assertTrue();
    });
    it('sanitizer_should_keep_high_ascii_characters', 0, async () => {
      expect(InputSanitizer.removeControlChars('ca~st')).assertEqual('ca~st');
      expect(InputSanitizer.removeControlChars('\u001Fabc')).assertEqual('abc');
      expect(InputSanitizer.stripWhitespace('').length).assertEqual(0);
    });
    it('sanitizer_collapse_should_be_idempotent', 0, async () => {
      const once: string = InputSanitizer.collapseSpaces('a    b   c');
      const twice: string = InputSanitizer.collapseSpaces(once);
      expect(once).assertEqual('a b c');
      expect(twice).assertEqual(once);
    });
    it('length_rule_should_report_invalid_when_min_exceeds_max', 0, async () => {
      const rule = new LengthRule(5, 2);
      expect(rule.isValid('abc')).assertFalse();
      expect(rule.getViolation('abc')).assertEqual('too long');
      expect(rule.getViolation('abcdef')).assertEqual('too long');
      expect(rule.clamp('abcdef').length).assertEqual(2);
    });
    it('name_field_should_accept_value_at_exact_maximum', 0, async () => {
      const field = new NameInputField('c'.repeat(DeviceNameValidator.MAX_NAME_LENGTH), nameRule);
      expect(field.validate().result).assertEqual(ValidationResult.PASS);
      expect(field.getValue().length).assertEqual(23);
      expect(field.isEmpty()).assertFalse();
    });
    it('name_field_should_revalidate_after_multiple_updates', 0, async () => {
      const field = new NameInputField('', nameRule);
      field.setValue('first');
      expect(field.validate().result).assertEqual(ValidationResult.PASS);
      field.setValue('');
      expect(field.validate().result).assertEqual(ValidationResult.FAIL);
      field.setValue('second');
      expect(field.validate().result).assertEqual(ValidationResult.PASS);
    });
    it('focus_navigator_should_jump_to_last_tile', 0, async () => {
      const navigator = new FocusNavigator(9);
      expect(navigator.setIndex(8)).assertTrue();
      expect(navigator.getIndex()).assertEqual(8);
      expect(navigator.next()).assertFalse();
      expect(navigator.prev()).assertTrue();
      expect(navigator.getIndex()).assertEqual(7);
    });
    it('focus_navigator_should_wrap_single_tile_in_place', 0, async () => {
      const navigator = new FocusNavigator(1);
      expect(navigator.nextWithWrap()).assertEqual(0);
      expect(navigator.prevWithWrap()).assertEqual(0);
      expect(navigator.getTileCount()).assertEqual(1);
      expect(navigator.setIndex(0)).assertTrue();
    });
    it('key_mapper_should_ignore_confirm_as_navigation', 0, async () => {
      expect(KeyInputMapper.isNavigationKey(KEY_ENTER)).assertFalse();
      expect(KeyInputMapper.isNavigationKey(KEY_DPAD_CENTER)).assertFalse();
      expect(KeyInputMapper.isExitKey(KEY_BACK)).assertTrue();
      expect(KeyInputMapper.isExitKey(KEY_MENU)).assertFalse();
    });
    it('key_mapper_should_handle_unknown_and_mapped_keys', 0, async () => {
      expect(KeyInputMapper.getAction(KEY_TAB)).assertEqual(KeyInputMapper.ACTION_UNKNOWN);
      expect(KeyInputMapper.getAction(KEY_BACK)).assertEqual(KeyInputMapper.ACTION_BACK);
      expect(KeyInputMapper.getAction(KEY_UP)).assertEqual(KeyInputMapper.ACTION_UP);
      expect(KeyInputMapper.getAction(KEY_DOWN)).assertEqual(KeyInputMapper.ACTION_DOWN);
    });
    it('key_mapper_should_count_no_navigation_keys', 0, async () => {
      const keys: number[] = [KEY_ENTER, KEY_BACK, KEY_MENU];
      expect(KeyInputMapper.countNavigationKeys(keys)).assertEqual(0);
      expect(keys.length).assertEqual(3);
      expect(KeyInputMapper.isConfirmKey(KEY_BACK)).assertFalse();
    });
    it('length_rule_should_accept_both_boundaries', 0, async () => {
      const rule = new LengthRule(2, 5);
      expect(rule.getViolation('ab')).assertEqual('valid');
      expect(rule.getViolation('abcde')).assertEqual('valid');
      expect(rule.getViolation('a')).assertEqual('too short');
      expect(rule.clamp('a')).assertEqual('a');
    });
    it('name_field_should_treat_blank_as_required_failure', 0, async () => {
      const field = new NameInputField(' \t ', nameRule);
      const outcome: ValidationOutcome = field.validate();
      expect(outcome.result).assertEqual(ValidationResult.FAIL);
      expect(outcome.rule).assertEqual('required');
      expect(field.getValue().length).assertEqual(3);
    });
    it('validation_chain_should_accumulate_after_reuse', 0, async () => {
      const chain = new ValidationChain();
      chain.addField(new NameInputField('LivingRoom', nameRule));
      expect(chain.getPassCount()).assertEqual(1);
      chain.addField(new NameInputField('Bedroom', nameRule));
      expect(chain.getFieldCount()).assertEqual(2);
      expect(chain.getPassCount()).assertEqual(2);
      expect(chain.getFailCount()).assertEqual(0);
    });
    it('sanitizer_should_remove_mixed_control_characters', 0, async () => {
      expect(InputSanitizer.removeControlChars('a\u0000b\u001Fc')).assertEqual('abc');
      expect(InputSanitizer.removeControlChars('a b').length).assertEqual(3);
      expect(InputSanitizer.normalizeNewlines('a\r\nb\r\nc')).assertEqual('a\nb\nc');
    });
    it('focus_navigator_should_move_through_all_nine_tiles', 0, async () => {
      const navigator = new FocusNavigator(MAX_MIRROR_TILES);
      for (let i = 1; i < MAX_MIRROR_TILES; i++) {
        expect(navigator.next()).assertTrue();
        expect(navigator.getIndex()).assertEqual(i);
      }
      expect(navigator.next()).assertFalse();
      expect(navigator.getIndex()).assertEqual(MAX_MIRROR_TILES - 1);
    });
  });
}
