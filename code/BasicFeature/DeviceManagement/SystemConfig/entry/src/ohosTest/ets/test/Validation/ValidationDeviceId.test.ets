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
import { ValidationUtils } from 'library';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

// ========================================
// Device ID validation test suite
// ========================================

/**
 * Device ID validation test suite.
 * Verifies the behavior of ValidationUtils.validateDeviceId under various inputs.
 */
export default function validateDeviceIdTest(): void {
  describe('ValidateDeviceIdTest', () => {

    // ========================================
    // Positive cases
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_DEVICE_ID_0100
     * @tc.name testValidationDeviceId0001
     * @tc.desc Verify a valid device ID passes validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationDeviceId0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationDeviceId0001: begin');
      const result = ValidationUtils.validateDeviceId('device-001');
      expect(result.isValid).assertTrue();
      expect(result.code).assertEqual(0);
      expect(result.message).assertEqual('设备ID验证通过');
      hilog.info(DOMAIN, TAG, 'testValidationDeviceId0001: end');
    });

    /**
     * @tc.number SUB_VALIDATION_DEVICE_ID_0200
     * @tc.name testValidationDeviceId0002
     * @tc.desc Verify an alphanumeric device ID passes validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationDeviceId0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationDeviceId0002: begin');
      const result = ValidationUtils.validateDeviceId('AB12');
      expect(result.isValid).assertTrue();
      expect(result.code).assertEqual(0);
      expect(result.message).assertEqual('设备ID验证通过');
      hilog.info(DOMAIN, TAG, 'testValidationDeviceId0002: end');
    });

    // ========================================
    // Negative cases
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_DEVICE_ID_0300
     * @tc.name testValidationDeviceId0003
     * @tc.desc Verify an empty string fails validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationDeviceId0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationDeviceId0003: begin');
      const result = ValidationUtils.validateDeviceId('');
      expect(result.isValid).assertFalse();
      expect(result.code).assertEqual(1001);
      expect(result.message.indexOf('空')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, 'testValidationDeviceId0003: end');
    });

    /**
     * @tc.number SUB_VALIDATION_DEVICE_ID_0400
     * @tc.name testValidationDeviceId0004
     * @tc.desc Verify an illegal format fails validation (contains special characters)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationDeviceId0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationDeviceId0004: begin');
      const result = ValidationUtils.validateDeviceId('dev@ice!');
      expect(result.isValid).assertFalse();
      expect(result.code).assertEqual(1003);
      expect(result.message.indexOf('格式')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, 'testValidationDeviceId0004: end');
    });

    /**
     * @tc.number SUB_VALIDATION_DEVICE_ID_0500
     * @tc.name testValidationDeviceId0005
     * @tc.desc Verify a device ID starting with a hyphen fails validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationDeviceId0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationDeviceId0005: begin');
      const result = ValidationUtils.validateDeviceId('-device01');
      expect(result.isValid).assertFalse();
      expect(result.code).assertEqual(1003);
      expect(result.message.indexOf('格式')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, 'testValidationDeviceId0005: end');
    });

    // ========================================
    // Boundary cases
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_DEVICE_ID_0600
     * @tc.name testValidationDeviceId0006
     * @tc.desc Verify the lower length boundary (fewer than the minimum of 2 characters)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationDeviceId0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationDeviceId0006: begin');
      const result = ValidationUtils.validateDeviceId('a');
      expect(result.isValid).assertFalse();
      expect(result.code).assertEqual(1002);
      expect(result.message.indexOf('长度')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, 'testValidationDeviceId0006: end');
    });

    /**
     * @tc.number SUB_VALIDATION_DEVICE_ID_0700
     * @tc.name testValidationDeviceId0007
     * @tc.desc Verify a length over the maximum of 128 characters fails validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationDeviceId0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationDeviceId0007: begin');
      const longId: string = 'a' + 'b'.repeat(127) + 'c';
      const result = ValidationUtils.validateDeviceId(longId);
      expect(result.isValid).assertFalse();
      expect(result.code).assertEqual(1002);
      expect(result.message.indexOf('长度')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, 'testValidationDeviceId0007: end');
    });

    /**
     * @tc.number SUB_VALIDATION_DEVICE_ID_0800
     * @tc.name testValidationDeviceId0008
     * @tc.desc Verify exactly the minimum length of 2 characters passes validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationDeviceId0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationDeviceId0008: begin');
      const result = ValidationUtils.validateDeviceId('ab');
      expect(result.isValid).assertTrue();
      expect(result.code).assertEqual(0);
      expect(result.message).assertEqual('设备ID验证通过');
      hilog.info(DOMAIN, TAG, 'testValidationDeviceId0008: end');
    });
  });
}
