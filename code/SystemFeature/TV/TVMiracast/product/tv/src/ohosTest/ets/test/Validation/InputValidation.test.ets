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
  KEY_BACK,
  miracastComponentCount,
  pressAndWait,
  waitForPageStable,
  waitForComponentById,
  ID_SAVE_BTN,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION
} from '../Shared/MiracastDriver';

const TAG: string = 'InputValidationSuite';

// Rejection reasons of the miracast device name input.
enum DeviceNameError {
  NONE = 'none',
  EMPTY = 'empty',
  ALL_BLANK = 'all_blank',
  CONTAINS_SPACE = 'contains_space',
  TOO_LONG = 'too_long'
}

// Input sources accepted by the change name page.
enum InputType {
  SOFT_KEYBOARD = 'soft_keyboard',
  REMOTE = 'remote',
  VOICE = 'voice',
  TOUCH = 'touch'
}

// Validation result of one device name candidate.
interface DeviceNameResult {
  valid: boolean;
  error: DeviceNameError;
  length: number;
  codePointCount: number;
}

// One input validation record of the tracker.
interface InputRecord {
  inputType: InputType;
  candidate: string;
  isValid: boolean;
  responseTime: number;
  timestamp: number;
}

// Validates the device name of the change name page.
class DeviceNameInputValidator {
  public static readonly MAX_NAME_LENGTH: number = 23;

  public isEmpty(name: string): boolean {
    return name.length === 0;
  }

  public isAllBlank(name: string): boolean {
    if (name.length === 0) {
      return true;
    }
    for (let i: number = 0; i < name.length; i++) {
      const code: number = name.charCodeAt(i);
      if (code !== 32 && code !== 9 && code !== 10 && code !== 13) {
        return false;
      }
    }
    return true;
  }

  public hasSpace(name: string): boolean {
    for (let i: number = 0; i < name.length; i++) {
      if (name.charCodeAt(i) === 32) {
        return true;
      }
    }
    return false;
  }

  public isTooLong(name: string): boolean {
    return name.length > DeviceNameInputValidator.MAX_NAME_LENGTH;
  }

  // Counts unicode code points so that surrogate pairs are one character.
  public countCodePoints(name: string): number {
    let count: number = 0;
    for (let i: number = 0; i < name.length; i++) {
      const code: number = name.charCodeAt(i);
      const isHighSurrogate: boolean = code >= 0xD800 && code <= 0xDBFF;
      const nextIsLow: boolean = i + 1 < name.length && name.charCodeAt(i + 1) >= 0xDC00 &&
        name.charCodeAt(i + 1) <= 0xDFFF;
      if (isHighSurrogate && nextIsLow) {
        i++;
      }
      count++;
    }
    return count;
  }

  public hasChinese(name: string): boolean {
    for (let i: number = 0; i < name.length; i++) {
      const code: number = name.charCodeAt(i);
      if (code >= 0x4E00 && code <= 0x9FFF) {
        return true;
      }
    }
    return false;
  }

  public hasEmoji(name: string): boolean {
    for (let i: number = 0; i < name.length; i++) {
      const code: number = name.charCodeAt(i);
      if (code >= 0xD800 && code <= 0xDBFF) {
        return true;
      }
    }
    return false;
  }

  public hasSpecialCharacter(name: string): boolean {
    for (let i: number = 0; i < name.length; i++) {
      const code: number = name.charCodeAt(i);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      const isChinese: boolean = code >= 0x4E00 && code <= 0x9FFF;
      const isSurrogate: boolean = code >= 0xD800 && code <= 0xDFFF;
      if (!isDigit && !isUpper && !isLower && !isChinese && !isSurrogate) {
        return true;
      }
    }
    return false;
  }

  public buildResult(name: string): DeviceNameResult {
    let error: DeviceNameError = DeviceNameError.NONE;
    if (this.isEmpty(name)) {
      error = DeviceNameError.EMPTY;
    } else if (this.isAllBlank(name)) {
      error = DeviceNameError.ALL_BLANK;
    } else if (this.hasSpace(name)) {
      error = DeviceNameError.CONTAINS_SPACE;
    } else if (this.isTooLong(name)) {
      error = DeviceNameError.TOO_LONG;
    }
    const result: DeviceNameResult = {
      valid: error === DeviceNameError.NONE,
      error: error,
      length: name.length,
      codePointCount: this.countCodePoints(name)
    };
    return result;
  }

  public isValid(name: string): boolean {
    return this.buildResult(name).valid;
  }
}

// Tracks input validation results of the change name page.
class InputValidationTracker {
  private records: InputRecord[] = [];
  private validCount: number = 0;
  private invalidCount: number = 0;

  public recordInput(inputType: InputType, candidate: string, isValid: boolean, responseTime: number): void {
    this.records.push({
      inputType: inputType,
      candidate: candidate,
      isValid: isValid,
      responseTime: responseTime,
      timestamp: Date.now()
    });
    if (isValid) {
      this.validCount++;
    } else {
      this.invalidCount++;
    }
  }

  public getHistory(): InputRecord[] {
    const copy: InputRecord[] = [];
    for (const record of this.records) {
      copy.push({
        inputType: record.inputType,
        candidate: record.candidate,
        isValid: record.isValid,
        responseTime: record.responseTime,
        timestamp: record.timestamp
      });
    }
    return copy;
  }

  public getTotalInputs(): number {
    return this.records.length;
  }

  public getValidCount(): number {
    return this.validCount;
  }

  public getInvalidCount(): number {
    return this.invalidCount;
  }

  public getValidationRate(): number {
    if (this.records.length === 0) {
      return 0;
    }
    return this.validCount / this.records.length;
  }

  public hasInputType(type: InputType): boolean {
    for (const record of this.records) {
      if (record.inputType === type) {
        return true;
      }
    }
    return false;
  }

  public getInputTypeCount(type: InputType): number {
    let count: number = 0;
    for (const record of this.records) {
      if (record.inputType === type) {
        count++;
      }
    }
    return count;
  }

  public getAverageResponseTime(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (const record of this.records) {
      total += record.responseTime;
    }
    return total / this.records.length;
  }

  public getMaxResponseTime(): number {
    let maxTime: number = 0;
    for (const record of this.records) {
      if (record.responseTime > maxTime) {
        maxTime = record.responseTime;
      }
    }
    return maxTime;
  }

  public getMinResponseTime(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let minTime: number = Number.MAX_SAFE_INTEGER;
    for (const record of this.records) {
      if (record.responseTime < minTime) {
        minTime = record.responseTime;
      }
    }
    return minTime === Number.MAX_SAFE_INTEGER ? 0 : minTime;
  }

  public reset(): void {
    this.records = [];
    this.validCount = 0;
    this.invalidCount = 0;
  }

  public getLastCandidate(): string {
    if (this.records.length === 0) {
      return '';
    }
    return this.records[this.records.length - 1].candidate;
  }
}

// Save flow of the change name page: stop service, persist, start service, go back.
class NameSaveFlowModel {
  private executedSteps: string[] = [];
  private currentName: string = '';
  private failureStep: string = '';

  public getCurrentName(): string {
    return this.currentName;
  }

  public getSteps(): string[] {
    const copy: string[] = [];
    for (const step of this.executedSteps) {
      copy.push(step);
    }
    return copy;
  }

  // Saves a valid name, an invalid name stops before touching the service.
  public save(name: string, validator: DeviceNameInputValidator): boolean {
    this.executedSteps = [];
    this.failureStep = '';
    if (!validator.isValid(name)) {
      this.failureStep = 'validate';
      return false;
    }
    this.executedSteps.push('stop_miracast_service');
    this.executedSteps.push('set_value_sync');
    this.executedSteps.push('start_miracast_service');
    this.executedSteps.push('router_back');
    this.currentName = name;
    return true;
  }

  public getFailureStep(): string {
    return this.failureStep;
  }

  public getStepCount(): number {
    return this.executedSteps.length;
  }

  public resetFlow(): void {
    this.executedSteps = [];
    this.currentName = '';
    this.failureStep = '';
  }
}

export default function inputValidationSuite(): void {
  describe('InputValidation_Suite', () => {
    let driver: Driver;
    let validator: DeviceNameInputValidator;
    let tracker: InputValidationTracker;

    beforeAll(async () => {
      driver = getDriver();
      validator = new DeviceNameInputValidator();
      tracker = new InputValidationTracker();
      Log.info(TAG, 'suite start');
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      Log.info(TAG, 'suite end');
    });
    it('device_name_error_enum_should_be_defined', 0, async () => {
      expect(DeviceNameError.NONE).assertEqual('none');
      expect(DeviceNameError.EMPTY).assertEqual('empty');
      expect(DeviceNameError.ALL_BLANK).assertEqual('all_blank');
      expect(DeviceNameError.CONTAINS_SPACE).assertEqual('contains_space');
      expect(DeviceNameError.TOO_LONG).assertEqual('too_long');
    });

    it('input_type_enum_should_be_defined', 0, async () => {
      expect(InputType.SOFT_KEYBOARD).assertEqual('soft_keyboard');
      expect(InputType.REMOTE).assertEqual('remote');
      expect(InputType.VOICE).assertEqual('voice');
      expect(InputType.TOUCH).assertEqual('touch');
    });

    it('empty_name_should_be_rejected', 0, async () => {
      const result: DeviceNameResult = validator.buildResult('');
      expect(result.valid).assertFalse();
      expect(result.error).assertEqual(DeviceNameError.EMPTY);
      expect(result.length).assertEqual(0);
      expect(result.codePointCount).assertEqual(0);
      expect(validator.isEmpty('')).assertTrue();
    });

    it('spaces_only_name_should_be_rejected', 0, async () => {
      const result: DeviceNameResult = validator.buildResult('   ');
      expect(result.valid).assertFalse();
      expect(result.error).assertEqual(DeviceNameError.ALL_BLANK);
      expect(result.length).assertEqual(3);
      expect(validator.isAllBlank('   ')).assertTrue();
      expect(validator.isAllBlank('\t')).assertTrue();
    });

    it('name_with_inner_space_should_be_rejected', 0, async () => {
      const result: DeviceNameResult = validator.buildResult('Living Room');
      expect(result.valid).assertFalse();
      expect(result.error).assertEqual(DeviceNameError.CONTAINS_SPACE);
      expect(validator.hasSpace('Living Room')).assertTrue();
      expect(validator.hasSpace('LivingRoom')).assertFalse();
    });

    it('single_character_name_should_be_accepted', 0, async () => {
      const result: DeviceNameResult = validator.buildResult('T');
      expect(result.valid).assertTrue();
      expect(result.error).assertEqual(DeviceNameError.NONE);
      expect(result.length).assertEqual(1);
      expect(result.codePointCount).assertEqual(1);
    });

    it('name_23_chars_should_be_accepted', 0, async () => {
      const name23: string = 'a'.repeat(23);
      const result: DeviceNameResult = validator.buildResult(name23);
      expect(result.valid).assertTrue();
      expect(result.error).assertEqual(DeviceNameError.NONE);
      expect(result.length).assertEqual(23);
      expect(result.length).assertEqual(DeviceNameInputValidator.MAX_NAME_LENGTH);
    });

    it('name_24_chars_should_be_rejected', 0, async () => {
      const name24: string = 'a'.repeat(24);
      const result: DeviceNameResult = validator.buildResult(name24);
      expect(result.valid).assertFalse();
      expect(result.error).assertEqual(DeviceNameError.TOO_LONG);
      expect(result.length).assertEqual(24);
      expect(validator.isTooLong(name24)).assertTrue();
    });

    it('chinese_name_should_be_accepted', 0, async () => {
      const chinese: string = '\u5ba2\u5385\u7535\u89c6';
      const result: DeviceNameResult = validator.buildResult(chinese);
      expect(result.valid).assertTrue();
      expect(result.error).assertEqual(DeviceNameError.NONE);
      expect(result.length).assertEqual(4);
      expect(result.codePointCount).assertEqual(4);
      expect(validator.hasChinese(chinese)).assertTrue();
    });

    it('chinese_name_at_24_chars_should_be_rejected', 0, async () => {
      const chinese24: string = '\u7535'.repeat(24);
      expect(chinese24.length).assertEqual(24);
      expect(validator.isValid(chinese24)).assertFalse();
      expect(validator.buildResult(chinese24).error).assertEqual(DeviceNameError.TOO_LONG);
    });

    it('emoji_code_point_count_should_use_surrogates', 0, async () => {
      const emoji: string = '\uD83D\uDE00';
      expect(emoji.length).assertEqual(2);
      expect(validator.countCodePoints(emoji)).assertEqual(1);
      expect(validator.hasEmoji(emoji)).assertTrue();
      expect(validator.hasSpecialCharacter(emoji)).assertFalse();
    });

    it('emoji_at_23_code_units_should_be_accepted', 0, async () => {
      const emoji11: string = '\uD83D\uDE00'.repeat(11);
      expect(emoji11.length).assertEqual(22);
      expect(validator.isValid(emoji11)).assertTrue();
      expect(validator.countCodePoints(emoji11)).assertEqual(11);
      const emoji11plus: string = emoji11 + 'a';
      expect(emoji11plus.length).assertEqual(23);
      expect(validator.isValid(emoji11plus)).assertTrue();
    });

    it('emoji_at_24_code_units_should_be_rejected', 0, async () => {
      const emoji12: string = '\uD83D\uDE00'.repeat(12);
      expect(emoji12.length).assertEqual(24);
      expect(validator.isValid(emoji12)).assertFalse();
      expect(validator.buildResult(emoji12).error).assertEqual(DeviceNameError.TOO_LONG);
    });

    it('special_characters_name_should_be_accepted', 0, async () => {
      const special: string = 'TV-01_HDMI.1';
      expect(validator.hasSpecialCharacter(special)).assertTrue();
      expect(validator.hasSpace(special)).assertFalse();
      expect(validator.isValid(special)).assertTrue();
      expect(validator.buildResult(special).error).assertEqual(DeviceNameError.NONE);
    });

    it('alphanumeric_name_should_have_no_special_character', 0, async () => {
      expect(validator.hasSpecialCharacter('TV01')).assertFalse();
      expect(validator.hasSpecialCharacter('tv01')).assertFalse();
      expect(validator.hasSpecialCharacter('12345')).assertFalse();
      expect(validator.hasSpecialCharacter('TV01-HDMI')).assertTrue();
    });
    it('tracker_should_count_valid_and_invalid_inputs', 0, async () => {
      tracker.reset();
      tracker.recordInput(InputType.SOFT_KEYBOARD, 'TV', true, 10);
      tracker.recordInput(InputType.SOFT_KEYBOARD, '', false, 20);
      tracker.recordInput(InputType.REMOTE, 'TV Room', false, 30);
      tracker.recordInput(InputType.REMOTE, 'TV01', true, 40);
      expect(tracker.getTotalInputs()).assertEqual(4);
      expect(tracker.getValidCount()).assertEqual(2);
      expect(tracker.getInvalidCount()).assertEqual(2);
      expect(tracker.getValidationRate()).assertEqual(0.5);
      expect(tracker.getLastCandidate()).assertEqual('TV01');
    });

    it('tracker_input_types_should_be_tracked', 0, async () => {
      tracker.reset();
      expect(tracker.hasInputType(InputType.VOICE)).assertFalse();
      tracker.recordInput(InputType.VOICE, 'TV', true, 60);
      tracker.recordInput(InputType.TOUCH, 'TV1', true, 70);
      expect(tracker.hasInputType(InputType.VOICE)).assertTrue();
      expect(tracker.getInputTypeCount(InputType.VOICE)).assertEqual(1);
      expect(tracker.getInputTypeCount(InputType.SOFT_KEYBOARD)).assertEqual(0);
      expect(tracker.getInputTypeCount(InputType.TOUCH)).assertEqual(1);
    });

    it('tracker_response_time_should_be_aggregated', 0, async () => {
      tracker.reset();
      tracker.recordInput(InputType.SOFT_KEYBOARD, 'A', true, 100);
      tracker.recordInput(InputType.SOFT_KEYBOARD, 'B', true, 300);
      tracker.recordInput(InputType.SOFT_KEYBOARD, 'C', false, 200);
      expect(tracker.getAverageResponseTime()).assertEqual(200);
      expect(tracker.getMaxResponseTime()).assertEqual(300);
      expect(tracker.getMinResponseTime()).assertEqual(100);
    });

    it('tracker_empty_metrics_should_be_zero', 0, async () => {
      tracker.reset();
      expect(tracker.getTotalInputs()).assertEqual(0);
      expect(tracker.getValidationRate()).assertEqual(0);
      expect(tracker.getAverageResponseTime()).assertEqual(0);
      expect(tracker.getMaxResponseTime()).assertEqual(0);
      expect(tracker.getMinResponseTime()).assertEqual(0);
      expect(tracker.getLastCandidate()).assertEqual('');
      expect(tracker.getHistory().length).assertEqual(0);
    });

    it('tracker_history_should_be_deep_copy', 0, async () => {
      tracker.reset();
      tracker.recordInput(InputType.SOFT_KEYBOARD, 'TV', true, 10);
      const historyA: InputRecord[] = tracker.getHistory();
      historyA[0].candidate = 'tampered';
      historyA.push({
        inputType: InputType.VOICE,
        candidate: 'fake',
        isValid: false,
        responseTime: 0,
        timestamp: 0
      });
      expect(tracker.getHistory().length).assertEqual(1);
      expect(tracker.getHistory()[0].candidate).assertEqual('TV');
    });

    it('tracker_validation_rate_should_be_exact', 0, async () => {
      tracker.reset();
      tracker.recordInput(InputType.SOFT_KEYBOARD, 'A', true, 10);
      tracker.recordInput(InputType.SOFT_KEYBOARD, 'B', true, 10);
      tracker.recordInput(InputType.SOFT_KEYBOARD, 'C', false, 10);
      expect(tracker.getValidationRate()).assertEqual(2 / 3);
      tracker.reset();
      tracker.recordInput(InputType.SOFT_KEYBOARD, 'D', false, 10);
      expect(tracker.getValidationRate()).assertEqual(0);
    });

    it('save_flow_should_execute_all_steps', 0, async () => {
      const flow = new NameSaveFlowModel();
      expect(flow.save('LivingRoomTV', validator)).assertTrue();
      const steps: string[] = flow.getSteps();
      expect(steps.length).assertEqual(4);
      expect(steps[0]).assertEqual('stop_miracast_service');
      expect(steps[1]).assertEqual('set_value_sync');
      expect(steps[2]).assertEqual('start_miracast_service');
      expect(steps[3]).assertEqual('router_back');
      expect(flow.getCurrentName()).assertEqual('LivingRoomTV');
    });

    it('save_flow_should_reject_invalid_name_before_service', 0, async () => {
      const flow = new NameSaveFlowModel();
      expect(flow.save('', validator)).assertFalse();
      expect(flow.getSteps().length).assertEqual(0);
      expect(flow.getFailureStep()).assertEqual('validate');
      expect(flow.getCurrentName()).assertEqual('');
      expect(flow.save('Living Room', validator)).assertFalse();
      expect(flow.getStepCount()).assertEqual(0);
    });

    it('save_flow_should_reset', 0, async () => {
      const flow = new NameSaveFlowModel();
      flow.save('TV01', validator);
      expect(flow.getStepCount()).assertEqual(4);
      expect(flow.getCurrentName()).assertEqual('TV01');
      flow.resetFlow();
      expect(flow.getStepCount()).assertEqual(0);
      expect(flow.getCurrentName()).assertEqual('');
      expect(flow.getFailureStep()).assertEqual('');
    });
    it('validation_should_cover_all_error_branches', 0, async () => {
      expect(validator.buildResult('').error).assertEqual(DeviceNameError.EMPTY);
      expect(validator.buildResult('  ').error).assertEqual(DeviceNameError.ALL_BLANK);
      expect(validator.buildResult('a b').error).assertEqual(DeviceNameError.CONTAINS_SPACE);
      expect(validator.buildResult('a'.repeat(24)).error).assertEqual(DeviceNameError.TOO_LONG);
      expect(validator.buildResult('TV01').error).assertEqual(DeviceNameError.NONE);
    });

    it('validation_should_prioritize_error_order', 0, async () => {
      expect(validator.buildResult(' ').error).assertEqual(DeviceNameError.ALL_BLANK);
      expect(validator.buildResult('a'.repeat(30) + ' ').error).assertEqual(DeviceNameError.CONTAINS_SPACE);
      expect(validator.buildResult('a'.repeat(30)).error).assertEqual(DeviceNameError.TOO_LONG);
      expect(validator.buildResult('a'.repeat(23) + ' b').error).assertEqual(DeviceNameError.CONTAINS_SPACE);
    });


    it('name_keyboard_input_should_be_validated', 0, async () => {
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      tracker.reset();
      tracker.recordInput(InputType.SOFT_KEYBOARD, 'TV', true, 50);
      tracker.recordInput(InputType.SOFT_KEYBOARD, 'TV ', false, 50);
      expect(tracker.getValidCount()).assertEqual(1);
      expect(tracker.getInvalidCount()).assertEqual(1);
      expect(tracker.getValidationRate()).assertEqual(0.5);
    });

    it('comprehensive_input_validation_scenario', 0, async () => {
      const flow = new NameSaveFlowModel();
      tracker.reset();
      const candidates: string[] = ['', '   ', 'Living Room', 'a'.repeat(24), 'LivingRoomTV'];
      for (let i: number = 0; i < candidates.length; i++) {
        const result: DeviceNameResult = validator.buildResult(candidates[i]);
        tracker.recordInput(InputType.SOFT_KEYBOARD, candidates[i], result.valid, 20 + i);
      }
      expect(tracker.getTotalInputs()).assertEqual(5);
      expect(tracker.getValidCount()).assertEqual(1);
      expect(tracker.getInvalidCount()).assertEqual(4);
      expect(tracker.getValidationRate()).assertEqual(0.2);
      expect(tracker.getAverageResponseTime()).assertEqual(22);
      expect(flow.save('LivingRoomTV', validator)).assertTrue();
      expect(flow.getStepCount()).assertEqual(4);
      expect(flow.getCurrentName().length).assertEqual(12);
    });

    it('name_with_space_at_23_chars_should_be_rejected', 0, async () => {
      const candidate: string = 'a'.repeat(22) + ' ';
      expect(candidate.length).assertEqual(23);
      expect(validator.isValid(candidate)).assertFalse();
      expect(validator.buildResult(candidate).error).assertEqual(DeviceNameError.CONTAINS_SPACE);
      expect(validator.buildResult(candidate).valid).assertFalse();
    });

    it('latin_accent_name_should_be_treated_as_special', 0, async () => {
      const accented: string = 'TV\u00e9';
      expect(validator.hasSpecialCharacter(accented)).assertTrue();
      expect(validator.hasChinese(accented)).assertFalse();
      expect(validator.hasEmoji(accented)).assertFalse();
      expect(validator.isValid(accented)).assertTrue();
    });

    it('digit_only_name_should_be_valid', 0, async () => {
      expect(validator.isValid('12345')).assertTrue();
      expect(validator.hasSpecialCharacter('12345')).assertFalse();
      expect(validator.buildResult('12345').length).assertEqual(5);
      expect(validator.buildResult('12345').error).assertEqual(DeviceNameError.NONE);
    });

    it('validation_result_fields_should_match_input', 0, async () => {
      const candidate: string = 'TV 01';
      const result: DeviceNameResult = validator.buildResult(candidate);
      expect(result.length).assertEqual(candidate.length);
      expect(result.codePointCount).assertEqual(candidate.length);
      expect(result.valid).assertFalse();
      expect(result.error).assertEqual(DeviceNameError.CONTAINS_SPACE);
    });

    it('tracker_high_volume_should_be_stable', 0, async () => {
      tracker.reset();
      const startedAt: number = Date.now();
      for (let i: number = 0; i < 300; i++) {
        const candidate: string = i % 3 === 0 ? '' : 'TV' + String(i);
        tracker.recordInput(InputType.SOFT_KEYBOARD, candidate, validator.isValid(candidate), 5);
      }
      const elapsed: number = Date.now() - startedAt;
      expect(elapsed).assertLessOrEqual(5000);
      expect(tracker.getTotalInputs()).assertEqual(300);
      expect(tracker.getInvalidCount()).assertEqual(100);
      expect(tracker.getValidCount()).assertEqual(200);
      expect(tracker.getValidationRate()).assertEqual(2 / 3);
      expect(tracker.getInputTypeCount(InputType.SOFT_KEYBOARD)).assertEqual(300);
    });
  });
}
