/*
 * Copyright (c) 2024 Hunan OpenValley Digital Industry Development Co., Ltd.
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
// 渠道号验证测试套件
// ========================================

/**
 * 渠道号验证测试套件。
 * 测试 ValidationUtils.validateChannelId 方法在各种输入下的行为。
 */
export default function validateChannelIdTest(): void {
  describe('ValidateChannelIdTest', () => {

    // ========================================
    // 正向用例
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_CHANNEL_ID_0100
     * @tc.name testValidationChannelId0001
     * @tc.desc 正向: 合法渠道号验证通过
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationChannelId0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationChannelId0001: begin');
      const result = ValidationUtils.validateChannelId('channel_001');
      expect(result.isValid).assertTrue();
      expect(result.code).assertEqual(0);
      expect(result.message.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testValidationChannelId0001: end');
    });

    /**
     * @tc.number SUB_VALIDATION_CHANNEL_ID_0200
     * @tc.name testValidationChannelId0002
     * @tc.desc 正向: 单字符渠道号验证通过
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationChannelId0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationChannelId0002: begin');
      const result = ValidationUtils.validateChannelId('a');
      expect(result.isValid).assertTrue();
      expect(result.code).assertEqual(0);
      expect(result.message).assertEqual('渠道号验证通过');
      hilog.info(DOMAIN, TAG, 'testValidationChannelId0002: end');
    });

    // ========================================
    // 反向用例
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_CHANNEL_ID_0300
     * @tc.name testValidationChannelId0003
     * @tc.desc 反向: 空字符串验证失败
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationChannelId0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationChannelId0003: begin');
      const result = ValidationUtils.validateChannelId('');
      expect(result.isValid).assertFalse();
      expect(result.code).assertEqual(1001);
      expect(result.message.indexOf('空')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, 'testValidationChannelId0003: end');
    });

    /**
     * @tc.number SUB_VALIDATION_CHANNEL_ID_0400
     * @tc.name testValidationChannelId0004
     * @tc.desc 反向: 纯空白字符串验证失败
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationChannelId0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationChannelId0004: begin');
      const result = ValidationUtils.validateChannelId('   ');
      expect(result.isValid).assertFalse();
      expect(result.code).assertEqual(1001);
      expect(result.message.indexOf('空')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, 'testValidationChannelId0004: end');
    });

    // ========================================
    // 边界用例
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_CHANNEL_ID_0500
     * @tc.name testValidationChannelId0005
     * @tc.desc 边界: 超长渠道号验证（超过64字符）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationChannelId0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationChannelId0005: begin');
      const longId: string = 'a'.repeat(65);
      const result = ValidationUtils.validateChannelId(longId);
      expect(result.isValid).assertFalse();
      expect(result.code).assertEqual(1002);
      expect(result.message.indexOf('长度')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, 'testValidationChannelId0005: end');
    });

    /**
     * @tc.number SUB_VALIDATION_CHANNEL_ID_0600
     * @tc.name testValidationChannelId0006
     * @tc.desc 边界: 恰好64字符的渠道号验证通过
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationChannelId0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationChannelId0006: begin');
      const maxId: string = 'a'.repeat(64);
      const result = ValidationUtils.validateChannelId(maxId);
      expect(result.isValid).assertTrue();
      expect(result.code).assertEqual(0);
      expect(result.message).assertEqual('渠道号验证通过');
      hilog.info(DOMAIN, TAG, 'testValidationChannelId0006: end');
    });

    /**
     * @tc.number SUB_VALIDATION_CHANNEL_ID_0700
     * @tc.name testValidationChannelId0007
     * @tc.desc 边界: 特殊字符渠道号验证通过（工具类不限制字符类型）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationChannelId0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationChannelId0007: begin');
      const result = ValidationUtils.validateChannelId('ch@nnel#001!');
      expect(result.isValid).assertTrue();
      expect(result.code).assertEqual(0);
      expect(result.message).assertEqual('渠道号验证通过');
      hilog.info(DOMAIN, TAG, 'testValidationChannelId0007: end');
    });
  });
}
