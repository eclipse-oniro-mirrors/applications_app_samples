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
import { ValidationUtils } from 'library';
import type { ValidationResult } from 'library';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * ValidationUtils method extension test suite.
 * Covers the valid-value, boundary-value, and illegal-value matrix for validateChannelId and validateDeviceId.
 */
export default function ValidationUtilsMethodsTest(): void {
  describe('ValidationUtilsMethodsTest', () => {

    // ========================================
    // validateChannelId - valid value tests
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_UTILS_METHODS_0100
     * @tc.name testValidationUtilsMethods0001
     * @tc.desc Verify a normal channel ID passes validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationUtilsMethods0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsMethods0001: begin');
      const result: ValidationResult = ValidationUtils.validateChannelId('channel-001');
      expect(result.isValid).assertTrue();
      expect(result.code).assertEqual(0);
      expect(result.message).assertEqual('渠道号验证通过');
    });

    /**
     * @tc.number SUB_VALIDATION_UTILS_METHODS_0200
     * @tc.name testValidationUtilsMethods0002
     * @tc.desc Verify a channel ID of exactly 64 characters passes validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationUtilsMethods0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsMethods0002: begin');
      const maxId: string = 'a'.repeat(64);
      const result: ValidationResult = ValidationUtils.validateChannelId(maxId);
      expect(result.isValid).assertTrue();
      expect(result.code).assertEqual(0);
      expect(result.message.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_VALIDATION_UTILS_METHODS_0300
     * @tc.name testValidationUtilsMethods0003
     * @tc.desc Verify a channel ID over 64 characters fails validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationUtilsMethods0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsMethods0003: begin');
      const overId: string = 'b'.repeat(65);
      const result: ValidationResult = ValidationUtils.validateChannelId(overId);
      expect(result.isValid).assertFalse();
      expect(result.code).assertEqual(1002);
      expect(result.message.indexOf('64')).assertLarger(-1);
    });

    /**
     * @tc.number SUB_VALIDATION_UTILS_METHODS_0400
     * @tc.name testValidationUtilsMethods0004
     * @tc.desc Verify an empty-string channel ID fails validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationUtilsMethods0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsMethods0004: begin');
      const result: ValidationResult = ValidationUtils.validateChannelId('');
      expect(result.isValid).assertFalse();
      expect(result.code).assertEqual(1001);
      expect(result.message.indexOf('空')).assertLarger(-1);
    });

    /**
     * @tc.number SUB_VALIDATION_UTILS_METHODS_0500
     * @tc.name testValidationUtilsMethods0005
     * @tc.desc Verify a space-only channel ID fails validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationUtilsMethods0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsMethods0005: begin');
      const result: ValidationResult = ValidationUtils.validateChannelId('   ');
      expect(result.isValid).assertFalse();
      expect(result.code).assertEqual(1001);
      expect(result.message.length).assertLarger(0);
    });

    // ========================================
    // validateDeviceId - valid value tests
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_UTILS_METHODS_0600
     * @tc.name testValidationUtilsMethods0006
     * @tc.desc Verify a normal device ID passes validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationUtilsMethods0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsMethods0006: begin');
      const result: ValidationResult = ValidationUtils.validateDeviceId('device-001');
      expect(result.isValid).assertTrue();
      expect(result.code).assertEqual(0);
      expect(result.message).assertEqual('设备ID验证通过');
    });

    /**
     * @tc.number SUB_VALIDATION_UTILS_METHODS_0700
     * @tc.name testValidationUtilsMethods0007
     * @tc.desc Verify a device ID of exactly 2 characters passes validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationUtilsMethods0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsMethods0007: begin');
      const result: ValidationResult = ValidationUtils.validateDeviceId('ab');
      expect(result.isValid).assertTrue();
      expect(result.code).assertEqual(0);
      expect(result.message.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_VALIDATION_UTILS_METHODS_0800
     * @tc.name testValidationUtilsMethods0008
     * @tc.desc Verify a device ID of only 1 character fails validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationUtilsMethods0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsMethods0008: begin');
      const result: ValidationResult = ValidationUtils.validateDeviceId('a');
      expect(result.isValid).assertFalse();
      expect(result.code).assertEqual(1002);
      expect(result.message.indexOf('2')).assertLarger(-1);
    });

    /**
     * @tc.number SUB_VALIDATION_UTILS_METHODS_0900
     * @tc.name testValidationUtilsMethods0009
     * @tc.desc Verify a device ID of exactly 128 characters passes validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationUtilsMethods0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsMethods0009: begin');
      const maxId: string = 'a'.repeat(128);
      const result: ValidationResult = ValidationUtils.validateDeviceId(maxId);
      expect(result.isValid).assertTrue();
      expect(result.code).assertEqual(0);
      expect(result.message).assertEqual('设备ID验证通过');
    });

    /**
     * @tc.number SUB_VALIDATION_UTILS_METHODS_1000
     * @tc.name testValidationUtilsMethods0010
     * @tc.desc Verify a device ID over 128 characters fails validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationUtilsMethods0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsMethods0010: begin');
      const overId: string = 'a'.repeat(129);
      const result: ValidationResult = ValidationUtils.validateDeviceId(overId);
      expect(result.isValid).assertFalse();
      expect(result.code).assertEqual(1002);
      expect(result.message.indexOf('128')).assertLarger(-1);
    });

    /**
     * @tc.number SUB_VALIDATION_UTILS_METHODS_1100
     * @tc.name testValidationUtilsMethods0011
     * @tc.desc Verify an empty-string device ID fails validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationUtilsMethods0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsMethods0011: begin');
      const result: ValidationResult = ValidationUtils.validateDeviceId('');
      expect(result.isValid).assertFalse();
      expect(result.code).assertEqual(1001);
      expect(result.message.indexOf('空')).assertLarger(-1);
    });

    /**
     * @tc.number SUB_VALIDATION_UTILS_METHODS_1200
     * @tc.name testValidationUtilsMethods0012
     * @tc.desc Verify a device ID containing special characters fails validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationUtilsMethods0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsMethods0012: begin');
      const result: ValidationResult = ValidationUtils.validateDeviceId('device@001');
      expect(result.isValid).assertFalse();
      expect(result.code).assertEqual(1003);
      expect(result.message.indexOf('格式')).assertLarger(-1);
    });

    /**
     * @tc.number SUB_VALIDATION_UTILS_METHODS_1300
     * @tc.name testValidationUtilsMethods0013
     * @tc.desc Verify a device ID starting with a hyphen fails validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationUtilsMethods0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsMethods0013: begin');
      const result: ValidationResult = ValidationUtils.validateDeviceId('-device01');
      expect(result.isValid).assertFalse();
      expect(result.code).assertEqual(1003);
      expect(result.message.length).assertLarger(0);
    });

    /**
     * @tc.number SUB_VALIDATION_UTILS_METHODS_1400
     * @tc.name testValidationUtilsMethods0014
     * @tc.desc Verify a device ID ending with a hyphen fails validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationUtilsMethods0014', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsMethods0014: begin');
      const result: ValidationResult = ValidationUtils.validateDeviceId('device01-');
      expect(result.isValid).assertFalse();
      expect(result.code).assertEqual(1003);
      expect(result.message.indexOf('格式')).assertLarger(-1);
    });

    /**
     * @tc.number SUB_VALIDATION_UTILS_METHODS_1500
     * @tc.name testValidationUtilsMethods0015
     * @tc.desc Verify a purely numeric device ID passes validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationUtilsMethods0015', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsMethods0015: begin');
      const result: ValidationResult = ValidationUtils.validateDeviceId('12345');
      expect(result.isValid).assertTrue();
      expect(result.code).assertEqual(0);
      expect(result.message).assertEqual('设备ID验证通过');
    });

    /**
     * @tc.number SUB_VALIDATION_UTILS_METHODS_1600
     * @tc.name testValidationUtilsMethods0016
     * @tc.desc Verify channel ID and device ID validation results do not interfere with each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationUtilsMethods0016', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsMethods0016: begin');
      const channelResult: ValidationResult = ValidationUtils.validateChannelId('valid-channel');
      const deviceResult: ValidationResult = ValidationUtils.validateDeviceId('valid-device-01');
      expect(channelResult.isValid).assertTrue();
      expect(deviceResult.isValid).assertTrue();
      expect(channelResult.code).assertEqual(deviceResult.code);
      expect(channelResult.message).assertEqual('渠道号验证通过');
      expect(deviceResult.message).assertEqual('设备ID验证通过');
    });
  });
}
