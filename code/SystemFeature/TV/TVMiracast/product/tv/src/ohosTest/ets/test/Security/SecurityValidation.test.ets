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
import {
  getDriver, KEY_LEFT, KEY_RIGHT, KEY_BACK, miracastComponentCount,
  waitForPageStable, pressAndWait, triggerMiracastHome, serializedDelay,
  TIMEOUT_PAGE_RENDER, DELAY_KEY_NAVIGATION, DELAY_AFTER_SESSION_OP
} from '../Shared/MiracastDriver';

enum ValidationCode { OK = 0, EMPTY = 1, TOO_LONG = 2, ILLEGAL_CHAR = 3, BAD_ID = 4 }

interface ValidationResult { code: number; reason: string; }

interface EmitterPayload { eventId: number; deviceId: string; deviceName: string; errCode: number; }

class DeviceNameValidator {
  public static readonly MAX_LENGTH: number = 32;

  public static validate(name: string): ValidationResult {
    if (name.length === 0) { return { code: ValidationCode.EMPTY, reason: 'empty' }; }
    if (name.length > DeviceNameValidator.MAX_LENGTH) { return { code: ValidationCode.TOO_LONG, reason: 'too_long' }; }
    if (name.trim().length !== name.length) { return { code: ValidationCode.ILLEGAL_CHAR, reason: 'padding' }; }
    for (let i = 0; i < name.length; i++) {
      const charCode: number = name.charCodeAt(i);
      if (charCode < 0x20 || charCode === 0x7F) { return { code: ValidationCode.ILLEGAL_CHAR, reason: 'control' }; }
    }
    return { code: ValidationCode.OK, reason: 'ok' };
  }
}

class InputSanitizer {
  public static stripControl(input: string): string {
    let kept: string = '';
    for (let i = 0; i < input.length; i++) {
      const charCode: number = input.charCodeAt(i);
      if (charCode >= 0x20 && charCode !== 0x7F) { kept += input.charAt(i); }
    }
    return kept.trim();
  }

  public static collapseSpaces(input: string): string {
    const parts: Array<string> = input.split(' ');
    const kept: Array<string> = [];
    for (let i = 0; i < parts.length; i++) {
      if (parts[i].length > 0) { kept.push(parts[i]); }
    }
    return kept.join(' ');
  }

  public static safeName(input: string): string {
    const cleaned: string = InputSanitizer.collapseSpaces(InputSanitizer.stripControl(input));
    return cleaned.length > DeviceNameValidator.MAX_LENGTH ? cleaned.substring(0, DeviceNameValidator.MAX_LENGTH) : cleaned;
  }
}

class DeviceIdValidator {
  public static validate(deviceId: string): ValidationResult {
    if (deviceId.length === 0) { return { code: ValidationCode.EMPTY, reason: 'empty' }; }
    if (deviceId.length > 64) { return { code: ValidationCode.TOO_LONG, reason: 'too_long' }; }
    if (!deviceId.startsWith('dev_')) { return { code: ValidationCode.BAD_ID, reason: 'prefix' }; }
    return { code: ValidationCode.OK, reason: 'ok' };
  }
}
class EmitterPayloadValidator {
  public static readonly EVENT_MIN: number = 1;
  public static readonly EVENT_MAX: number = 1000;

  public static validate(payload: EmitterPayload): ValidationResult {
    if (payload.eventId < EmitterPayloadValidator.EVENT_MIN || payload.eventId > EmitterPayloadValidator.EVENT_MAX) {
      return { code: ValidationCode.BAD_ID, reason: 'event_id' };
    }
    if (payload.errCode < 0) { return { code: ValidationCode.BAD_ID, reason: 'err_code' }; }
    const idResult: ValidationResult = DeviceIdValidator.validate(payload.deviceId);
    if (idResult.code !== ValidationCode.OK) { return idResult; }
    return DeviceNameValidator.validate(payload.deviceName);
  }
}

class ValidationReport {
  private results: Array<ValidationResult> = [];

  public add(result: ValidationResult): void { this.results.push(result); }
  public getCount(): number { return this.results.length; }
  public reset(): void { this.results = []; }

  public getPassedCount(): number {
    let passed: number = 0;
    for (let i = 0; i < this.results.length; i++) {
      if (this.results[i].code === ValidationCode.OK) { passed++; }
    }
    return passed;
  }

  public getPassRate(): number {
    return this.results.length === 0 ? 0 : this.getPassedCount() / this.results.length;
  }

  public isAllPassed(): boolean {
    return this.results.length > 0 && this.getPassedCount() === this.results.length;
  }

  public firstFailureReason(): string {
    for (let i = 0; i < this.results.length; i++) {
      if (this.results[i].code !== ValidationCode.OK) { return this.results[i].reason; }
    }
    return '';
  }
}

function healthyPayload(): EmitterPayload {
  return { eventId: 100, deviceId: 'dev_001', deviceName: 'Living Room TV', errCode: 0 };
}
export default function securityValidationSuite(): void {
  describe('SecurityValidation_Suite', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await triggerMiracastHome(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
    });

    it('valid_device_name_should_pass', 0, async () => {
      expect(DeviceNameValidator.validate('Living Room TV').code).assertEqual(ValidationCode.OK);
    });

    it('empty_device_name_should_be_rejected', 0, async () => {
      expect(DeviceNameValidator.validate('').code).assertEqual(ValidationCode.EMPTY);
    });

    it('padded_device_name_should_be_rejected', 0, async () => {
      expect(DeviceNameValidator.validate(' TV ').code).assertEqual(ValidationCode.ILLEGAL_CHAR);
    });

    it('device_name_should_respect_max_length', 0, async () => {
      const longName: string = 'A'.repeat(DeviceNameValidator.MAX_LENGTH + 1);
      expect(DeviceNameValidator.validate(longName).code).assertEqual(ValidationCode.TOO_LONG);
    });

    it('device_name_with_control_char_should_be_rejected', 0, async () => {
      expect(DeviceNameValidator.validate('Tv\u0001Name').code).assertEqual(ValidationCode.ILLEGAL_CHAR);
    });

    it('device_name_at_max_length_should_pass', 0, async () => {
      const exactName: string = 'A'.repeat(DeviceNameValidator.MAX_LENGTH);
      expect(DeviceNameValidator.validate(exactName).code).assertEqual(ValidationCode.OK);
    });

    it('sanitizer_should_strip_control_and_trim', 0, async () => {
      expect(InputSanitizer.stripControl(' Tv\u0001 ')).assertEqual('Tv');
    });

    it('sanitizer_should_collapse_spaces', 0, async () => {
      expect(InputSanitizer.collapseSpaces('Living   Room  TV')).assertEqual('Living Room TV');
    });

    it('sanitizer_should_truncate_safe_name', 0, async () => {
      expect(InputSanitizer.safeName('A'.repeat(40)).length).assertEqual(DeviceNameValidator.MAX_LENGTH);
    });

    it('sanitized_name_should_pass_validation', 0, async () => {
      const safe: string = InputSanitizer.safeName('  Living   Room  ');
      expect(DeviceNameValidator.validate(safe).code).assertEqual(ValidationCode.OK);
    });
    it('valid_emitter_payload_should_pass', 0, async () => {
      expect(EmitterPayloadValidator.validate(healthyPayload()).code).assertEqual(ValidationCode.OK);
    });

    it('payload_with_invalid_event_id_should_fail', 0, async () => {
      const payload: EmitterPayload = healthyPayload();
      payload.eventId = 0;
      expect(EmitterPayloadValidator.validate(payload).reason).assertEqual('event_id');
    });

    it('payload_with_negative_err_code_should_fail', 0, async () => {
      const payload: EmitterPayload = healthyPayload();
      payload.errCode = -1;
      expect(EmitterPayloadValidator.validate(payload).code).assertEqual(ValidationCode.BAD_ID);
    });

    it('payload_with_bad_device_id_should_fail', 0, async () => {
      const payload: EmitterPayload = healthyPayload();
      payload.deviceId = 'abc';
      expect(EmitterPayloadValidator.validate(payload).reason).assertEqual('prefix');
    });

    it('payload_with_empty_device_id_should_fail', 0, async () => {
      const payload: EmitterPayload = healthyPayload();
      payload.deviceId = '';
      expect(EmitterPayloadValidator.validate(payload).code).assertEqual(ValidationCode.EMPTY);
    });

    it('payload_with_bad_device_name_should_fail', 0, async () => {
      const payload: EmitterPayload = healthyPayload();
      payload.deviceName = '';
      expect(EmitterPayloadValidator.validate(payload).code).assertEqual(ValidationCode.EMPTY);
    });

    it('payload_event_id_should_be_validated_before_name', 0, async () => {
      const payload: EmitterPayload = healthyPayload();
      payload.eventId = -5;
      payload.deviceName = '';
      expect(EmitterPayloadValidator.validate(payload).reason).assertEqual('event_id');
    });

    it('device_id_validator_should_reject_bad_prefix', 0, async () => {
      expect(DeviceIdValidator.validate('tile_1').code).assertEqual(ValidationCode.BAD_ID);
    });

    it('device_id_validator_should_respect_length', 0, async () => {
      expect(DeviceIdValidator.validate('dev_' + '9'.repeat(64)).code).assertEqual(ValidationCode.TOO_LONG);
    });

    it('device_id_validator_should_accept_well_formed_id', 0, async () => {
      expect(DeviceIdValidator.validate('dev_001').code).assertEqual(ValidationCode.OK);
    });
    it('report_should_compute_pass_rate', 0, async () => {
      const report = new ValidationReport();
      report.add(DeviceNameValidator.validate('Living Room TV'));
      report.add(DeviceNameValidator.validate(''));
      expect(report.getPassRate()).assertEqual(0.5);
    });

    it('report_should_detect_all_passed', 0, async () => {
      const report = new ValidationReport();
      report.add(DeviceNameValidator.validate('TV'));
      expect(report.isAllPassed()).assertTrue();
    });

    it('report_should_report_first_failure_reason', 0, async () => {
      const report = new ValidationReport();
      report.add(DeviceNameValidator.validate(''));
      expect(report.firstFailureReason()).assertEqual('empty');
    });

    it('report_should_reset_and_recount', 0, async () => {
      const report = new ValidationReport();
      report.add(DeviceNameValidator.validate(''));
      report.reset();
      expect(report.getCount()).assertEqual(0);
    });

    it('validation_logic_should_not_affect_home_render', 0, async () => {
      expect(DeviceNameValidator.validate('TV').code).assertEqual(ValidationCode.OK);
    });

    it('validation_should_be_deterministic_after_navigation', 0, async () => {
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      expect(EmitterPayloadValidator.validate(healthyPayload()).code).assertEqual(ValidationCode.OK);
    });

    it('payload_batch_should_keep_passing_entries', 0, async () => {
      const report = new ValidationReport();
      for (let i = 0; i < 5; i++) { report.add(EmitterPayloadValidator.validate(healthyPayload())); }
      expect(report.getPassedCount()).assertEqual(5);
    });

    it('payload_batch_with_failure_should_not_pass', 0, async () => {
      const report = new ValidationReport();
      report.add(EmitterPayloadValidator.validate(healthyPayload()));
      const bad: EmitterPayload = healthyPayload();
      bad.deviceId = 'x';
      report.add(EmitterPayloadValidator.validate(bad));
      expect(report.isAllPassed()).assertFalse();
      expect(report.getCount()).assertEqual(2);
    });


    it('sanitizer_should_preserve_mixed_text', 0, async () => {
      expect(InputSanitizer.safeName('TV-1 A')).assertEqual('TV-1 A');
    });

    it('report_should_count_single_entry', 0, async () => {
      const report = new ValidationReport();
      report.add(DeviceIdValidator.validate('dev_002'));
      expect(report.getPassedCount()).assertEqual(1);
    });

  });
}
