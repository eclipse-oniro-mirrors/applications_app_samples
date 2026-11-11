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

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

// ========================================
// 设备号验证测试套件
// ========================================

/**
 * 设备号验证测试套件。
 * 测试 ValidationUtils.validateDeviceId 方法在各种输入下的行为。
 */
export default function validateDeviceIdTest(): void {
  describe('ValidateDeviceIdTest', () => {

    // ========================================
    // 正向用例
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_DEVICE_ID_0100
     * @tc.name testValidationDeviceId0001
     * @tc.desc 正向: 合法设备号验证通过
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
     * @tc.desc 正向: 纯字母数字设备号验证通过
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
    // 反向用例
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_DEVICE_ID_0300
     * @tc.name testValidationDeviceId0003
     * @tc.desc 反向: 空字符串验证失败
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
     * @tc.desc 反向: 非法格式验证（含特殊字符）
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
     * @tc.desc 反向: 以连字符开头的设备号验证失败
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
    // 边界用例
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_DEVICE_ID_0600
     * @tc.name testValidationDeviceId0006
     * @tc.desc 边界: 边界长度测试（少于最小长度2字符）
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
     * @tc.desc 边界: 超过最大长度128字符验证失败
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
     * @tc.desc 边界: 恰好最小长度2字符验证通过
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
