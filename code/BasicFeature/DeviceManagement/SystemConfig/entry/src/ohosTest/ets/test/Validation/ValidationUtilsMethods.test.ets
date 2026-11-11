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

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

/**
 * ValidationUtils 方法扩展测试套件。
 * 覆盖 validateChannelId 和 validateDeviceId 的合法值、边界值、非法值矩阵。
 */
export default function ValidationUtilsMethodsTest(): void {
  describe('ValidationUtilsMethodsTest', () => {

    // ========================================
    // validateChannelId - 合法值测试
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_UTILS_METHODS_0100
     * @tc.name testValidationUtilsMethods0001
     * @tc.desc 正向: 正常渠道号验证通过
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
     * @tc.desc 边界: 渠道号恰好 64 字符验证通过
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
     * @tc.desc 边界: 渠道号超过 64 字符验证失败
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
     * @tc.desc 非法: 空字符串渠道号验证失败
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
     * @tc.desc 非法: 纯空格渠道号验证失败
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
    // validateDeviceId - 合法值测试
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_UTILS_METHODS_0600
     * @tc.name testValidationUtilsMethods0006
     * @tc.desc 正向: 正常设备 ID 验证通过
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
     * @tc.desc 边界: 设备 ID 恰好 2 字符验证通过
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
     * @tc.desc 边界: 设备 ID 仅 1 字符验证失败
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
     * @tc.desc 边界: 设备 ID 恰好 128 字符验证通过
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
     * @tc.desc 边界: 设备 ID 超过 128 字符验证失败
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
     * @tc.desc 非法: 空字符串设备 ID 验证失败
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
     * @tc.desc 非法: 含特殊字符的设备 ID 验证失败
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
     * @tc.desc 非法: 以连字符开头的设备 ID 验证失败
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
     * @tc.desc 非法: 以连字符结尾的设备 ID 验证失败
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
     * @tc.desc 正向: 纯数字设备 ID 验证通过
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
     * @tc.desc 正向: 渠道号和设备 ID 验证结果互不干扰
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
