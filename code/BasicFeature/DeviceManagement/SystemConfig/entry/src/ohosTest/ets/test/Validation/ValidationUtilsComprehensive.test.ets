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
 * ValidationUtils 综合验证测试套件。
 * 覆盖 validateErrorCode、validateTimestamp、validateString、
 * validateNumber、validateEnum、validateArray 等未在其他测试文件中覆盖的方法。
 */
export default function ValidationUtilsComprehensiveTest(): void {
  describe('ValidationUtilsComprehensiveTest', () => {

    // ========================================
    // validateErrorCode
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_UTILS_COMPREHENSIVE_0100
     * @tc.name testValidationUtilsComprehensive0001
     * @tc.desc 正向: 合法错误码(0, 1, 99999)验证通过
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationUtilsComprehensive0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsComprehensive0001 begin');
      const r1: ValidationResult = ValidationUtils.validateErrorCode(0);
      expect(r1.isValid).assertTrue();
      expect(r1.code).assertEqual(0);
      expect(r1.message).assertEqual('错误码验证通过');
      const r2: ValidationResult = ValidationUtils.validateErrorCode(99999);
      expect(r2.isValid).assertTrue();
      const r3: ValidationResult = ValidationUtils.validateErrorCode(500);
      expect(r3.isValid).assertTrue();
    });

    /**
     * @tc.number SUB_VALIDATION_UTILS_COMPREHENSIVE_0200
     * @tc.name testValidationUtilsComprehensive0002
     * @tc.desc 反向: 负数、超大值、非整数验证失败
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationUtilsComprehensive0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsComprehensive0002 begin');
      const r1: ValidationResult = ValidationUtils.validateErrorCode(-1);
      expect(r1.isValid).assertFalse();
      expect(r1.code).assertEqual(1004);
      const r2: ValidationResult = ValidationUtils.validateErrorCode(100000);
      expect(r2.isValid).assertFalse();
      expect(r2.code).assertEqual(1004);
      const r3: ValidationResult = ValidationUtils.validateErrorCode(3.14);
      expect(r3.isValid).assertFalse();
      expect(r3.code).assertEqual(1003);
    });

    // ========================================
    // validateTimestamp
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_UTILS_COMPREHENSIVE_0300
     * @tc.name testValidationUtilsComprehensive0003
     * @tc.desc 正向: 合法历史时间戳验证通过
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationUtilsComprehensive0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsComprehensive0003 begin');
      const pastTs: number = Date.now() - 60000;
      const result: ValidationResult = ValidationUtils.validateTimestamp(pastTs);
      expect(result.isValid).assertTrue();
      expect(result.code).assertEqual(0);
      expect(result.message).assertEqual('时间戳验证通过');
    });

    /**
     * @tc.number SUB_VALIDATION_UTILS_COMPREHENSIVE_0400
     * @tc.name testValidationUtilsComprehensive0004
     * @tc.desc 反向: 负数、零、未来时间、NaN、Infinity 验证失败
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationUtilsComprehensive0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsComprehensive0004 begin');
      const r1: ValidationResult = ValidationUtils.validateTimestamp(-100);
      expect(r1.isValid).assertFalse();
      expect(r1.code).assertEqual(1007);
      const r2: ValidationResult = ValidationUtils.validateTimestamp(0);
      expect(r2.isValid).assertFalse();
      const r3: ValidationResult = ValidationUtils.validateTimestamp(NaN);
      expect(r3.isValid).assertFalse();
      expect(r3.code).assertEqual(1007);
      const r4: ValidationResult = ValidationUtils.validateTimestamp(Infinity);
      expect(r4.isValid).assertFalse();
    });

    // ========================================
    // validateString
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_UTILS_COMPREHENSIVE_0500
     * @tc.name testValidationUtilsComprehensive0005
     * @tc.desc 正向: 长度在范围内的字符串验证通过
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationUtilsComprehensive0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsComprehensive0005 begin');
      const r1: ValidationResult = ValidationUtils.validateString('hello', 1, 10);
      expect(r1.isValid).assertTrue();
      expect(r1.code).assertEqual(0);
      const r2: ValidationResult = ValidationUtils.validateString('ab', 2, 5);
      expect(r2.isValid).assertTrue();
      const r3: ValidationResult = ValidationUtils.validateString('abcde', 2, 5);
      expect(r3.isValid).assertTrue();
    });

    /**
     * @tc.number SUB_VALIDATION_UTILS_COMPREHENSIVE_0600
     * @tc.name testValidationUtilsComprehensive0006
     * @tc.desc 反向: 长度低于 minLen 验证失败
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationUtilsComprehensive0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsComprehensive0006 begin');
      const result: ValidationResult = ValidationUtils.validateString('a', 3, 10);
      expect(result.isValid).assertFalse();
      expect(result.code).assertEqual(1002);
      expect(result.message.indexOf('不能少于')).assertLarger(-1);
    });

    /**
     * @tc.number SUB_VALIDATION_UTILS_COMPREHENSIVE_0700
     * @tc.name testValidationUtilsComprehensive0007
     * @tc.desc 反向: 长度超过 maxLen 验证失败
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationUtilsComprehensive0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsComprehensive0007 begin');
      const result: ValidationResult = ValidationUtils.validateString('abcdefghij', 1, 5);
      expect(result.isValid).assertFalse();
      expect(result.code).assertEqual(1002);
      expect(result.message.indexOf('不能超过')).assertLarger(-1);
    });

    // ========================================
    // validateNumber
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_UTILS_COMPREHENSIVE_0800
     * @tc.name testValidationUtilsComprehensive0008
     * @tc.desc 正向: 范围内的数值验证通过
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationUtilsComprehensive0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsComprehensive0008 begin');
      const r1: ValidationResult = ValidationUtils.validateNumber(5, 0, 10);
      expect(r1.isValid).assertTrue();
      expect(r1.code).assertEqual(0);
      const r2: ValidationResult = ValidationUtils.validateNumber(0, 0, 100);
      expect(r2.isValid).assertTrue();
      const r3: ValidationResult = ValidationUtils.validateNumber(10, 0, 10);
      expect(r3.isValid).assertTrue();
    });

    /**
     * @tc.number SUB_VALIDATION_UTILS_COMPREHENSIVE_0900
     * @tc.name testValidationUtilsComprehensive0009
     * @tc.desc 反向: 超出范围、NaN 验证失败
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationUtilsComprehensive0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsComprehensive0009 begin');
      const r1: ValidationResult = ValidationUtils.validateNumber(-1, 0, 10);
      expect(r1.isValid).assertFalse();
      expect(r1.code).assertEqual(1004);
      const r2: ValidationResult = ValidationUtils.validateNumber(11, 0, 10);
      expect(r2.isValid).assertFalse();
      const r3: ValidationResult = ValidationUtils.validateNumber(NaN, 0, 10);
      expect(r3.isValid).assertFalse();
      expect(r3.code).assertEqual(1003);
    });

    // ========================================
    // validateEnum
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_UTILS_COMPREHENSIVE_1000
     * @tc.name testValidationUtilsComprehensive0010
     * @tc.desc 正向: 合法枚举值验证通过
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationUtilsComprehensive0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsComprehensive0010 begin');
      const validValues: string[] = ['SUCCESS', 'FAILED', 'LOADING'];
      const r1: ValidationResult = ValidationUtils.validateEnum('SUCCESS', validValues);
      expect(r1.isValid).assertTrue();
      expect(r1.code).assertEqual(0);
      expect(r1.message).assertEqual('枚举值验证通过');
    });

    /**
     * @tc.number SUB_VALIDATION_UTILS_COMPREHENSIVE_1100
     * @tc.name testValidationUtilsComprehensive0011
     * @tc.desc 反向: 非法枚举值、空值、空列表验证失败
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationUtilsComprehensive0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsComprehensive0011 begin');
      const validValues: string[] = ['A', 'B', 'C'];
      const r1: ValidationResult = ValidationUtils.validateEnum('D', validValues);
      expect(r1.isValid).assertFalse();
      expect(r1.code).assertEqual(1005);
      const r2: ValidationResult = ValidationUtils.validateEnum('', validValues);
      expect(r2.isValid).assertFalse();
      expect(r2.code).assertEqual(1001);
      const r3: ValidationResult = ValidationUtils.validateEnum('A', []);
      expect(r3.isValid).assertFalse();
      expect(r3.code).assertEqual(1005);
    });

    // ========================================
    // validateArray
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_UTILS_COMPREHENSIVE_1200
     * @tc.name testValidationUtilsComprehensive0012
     * @tc.desc 正向: 满足最小长度的数组验证通过
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testValidationUtilsComprehensive0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsComprehensive0012 begin');
      const r1: ValidationResult = ValidationUtils.validateArray([1, 2, 3], 2);
      expect(r1.isValid).assertTrue();
      expect(r1.code).assertEqual(0);
      const r2: ValidationResult = ValidationUtils.validateArray(['a'], 1);
      expect(r2.isValid).assertTrue();
      const r3: ValidationResult = ValidationUtils.validateArray([1, 2, 3, 4, 5], 5);
      expect(r3.isValid).assertTrue();
    });

    /**
     * @tc.number SUB_VALIDATION_UTILS_COMPREHENSIVE_1300
     * @tc.name testValidationUtilsComprehensive0013
     * @tc.desc 反向: 数组长度不足最小要求验证失败
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationUtilsComprehensive0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsComprehensive0013 begin');
      const r1: ValidationResult = ValidationUtils.validateArray([1], 3);
      expect(r1.isValid).assertFalse();
      expect(r1.code).assertEqual(1006);
      expect(r1.message.indexOf('不能少于')).assertLarger(-1);
      const r2: ValidationResult = ValidationUtils.validateArray([], 1);
      expect(r2.isValid).assertFalse();
    });

    // ========================================
    // 边界值
    // ========================================

    /**
     * @tc.number SUB_VALIDATION_UTILS_COMPREHENSIVE_1400
     * @tc.name testValidationUtilsComprehensive0014
     * @tc.desc 边界: 错误码恰好为 0 和 99999 边界值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationUtilsComprehensive0014', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsComprehensive0014 begin');
      const r1: ValidationResult = ValidationUtils.validateErrorCode(0);
      expect(r1.isValid).assertTrue();
      const r2: ValidationResult = ValidationUtils.validateErrorCode(99999);
      expect(r2.isValid).assertTrue();
      const r3: ValidationResult = ValidationUtils.validateErrorCode(100000);
      expect(r3.isValid).assertFalse();
    });

    /**
     * @tc.number SUB_VALIDATION_UTILS_COMPREHENSIVE_1500
     * @tc.name testValidationUtilsComprehensive0015
     * @tc.desc 边界: minLen=0 允许空字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testValidationUtilsComprehensive0015', 0, () => {
      hilog.info(DOMAIN, TAG, 'testValidationUtilsComprehensive0015 begin');
      const result: ValidationResult = ValidationUtils.validateString('', 0, 10);
      expect(result.isValid).assertTrue();
      expect(result.code).assertEqual(0);
      const result2: ValidationResult = ValidationUtils.validateString('hello', 0, 0);
      expect(result2.isValid).assertFalse();
    });
  });
}
