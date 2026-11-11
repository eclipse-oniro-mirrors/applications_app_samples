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
import { TypeUtils } from 'library';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

// ========================================
// 类型工具测试套件
// ========================================

/**
 * 类型工具测试套件。
 * 测试 TypeUtils 类中各类型检查和转换方法的正确性。
 */
export default function utilsTypeUtilsTest(): void {
  describe('UtilsTypeUtilsTest', () => {

    // ========================================
    // 正向用例 - 类型检查
    // ========================================

    /**
     * @tc.number SUB_UTILS_TYPE_UTILS_0100
     * @tc.name testUtilsTypeUtils0001
     * @tc.desc 正向: 字符串判断
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsTypeUtils0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0001: begin');
      expect(TypeUtils.isString('hello')).assertTrue();
      expect(TypeUtils.isString(123)).assertFalse();
      expect(TypeUtils.isString('')).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0001: end');
    });

    /**
     * @tc.number SUB_UTILS_TYPE_UTILS_0200
     * @tc.name testUtilsTypeUtils0002
     * @tc.desc 正向: 数字判断
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsTypeUtils0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0002: begin');
      expect(TypeUtils.isNumber(42)).assertTrue();
      expect(TypeUtils.isNumber(NaN)).assertFalse();
      expect(TypeUtils.isNumber('42')).assertFalse();
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0002: end');
    });

    /**
     * @tc.number SUB_UTILS_TYPE_UTILS_0300
     * @tc.name testUtilsTypeUtils0003
     * @tc.desc 正向: 布尔判断
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsTypeUtils0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0003: begin');
      expect(TypeUtils.isBoolean(true)).assertTrue();
      expect(TypeUtils.isBoolean(false)).assertTrue();
      expect(TypeUtils.isBoolean(0)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0003: end');
    });

    /**
     * @tc.number SUB_UTILS_TYPE_UTILS_0400
     * @tc.name testUtilsTypeUtils0004
     * @tc.desc 正向: 对象判断
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsTypeUtils0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0004: begin');
      const testObj: Record<string, string> = { 'key': 'value' };
      expect(TypeUtils.isObject(testObj)).assertTrue();
      expect(TypeUtils.isObject(null)).assertFalse();
      expect(TypeUtils.isObject([1, 2])).assertFalse();
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0004: end');
    });

    /**
     * @tc.number SUB_UTILS_TYPE_UTILS_0500
     * @tc.name testUtilsTypeUtils0005
     * @tc.desc 正向: 数组判断
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsTypeUtils0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0005: begin');
      expect(TypeUtils.isArray([1, 2, 3])).assertTrue();
      expect(TypeUtils.isArray([])).assertTrue();
      expect(TypeUtils.isArray('array')).assertFalse();
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0005: end');
    });

    /**
     * @tc.number SUB_UTILS_TYPE_UTILS_0600
     * @tc.name testUtilsTypeUtils0006
     * @tc.desc 正向: null判断
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsTypeUtils0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0006: begin');
      expect(TypeUtils.isNull(null)).assertTrue();
      expect(TypeUtils.isNull(undefined)).assertFalse();
      expect(TypeUtils.isNull(0)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0006: end');
    });

    /**
     * @tc.number SUB_UTILS_TYPE_UTILS_0700
     * @tc.name testUtilsTypeUtils0007
     * @tc.desc 正向: undefined判断
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsTypeUtils0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0007: begin');
      expect(TypeUtils.isUndefined(undefined)).assertTrue();
      expect(TypeUtils.isUndefined(null)).assertFalse();
      expect(TypeUtils.isUndefined(0)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0007: end');
    });

    // ========================================
    // 正向用例 - 空值检查
    // ========================================

    /**
     * @tc.number SUB_UTILS_TYPE_UTILS_0800
     * @tc.name testUtilsTypeUtils0008
     * @tc.desc 正向: 空字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsTypeUtils0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0008: begin');
      expect(TypeUtils.isEmpty('')).assertTrue();
      expect(TypeUtils.isEmpty(null)).assertTrue();
      expect(TypeUtils.isEmpty('hello')).assertFalse();
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0008: end');
    });

    /**
     * @tc.number SUB_UTILS_TYPE_UTILS_0900
     * @tc.name testUtilsTypeUtils0009
     * @tc.desc 正向: 空对象
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsTypeUtils0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0009: begin');
      const emptyObj: Record<string, string> = {};
      expect(TypeUtils.isEmptyObject(emptyObj)).assertTrue();
      expect(TypeUtils.isEmptyObject(null)).assertTrue();
      const filledObj: Record<string, string> = { 'key': 'value' };
      expect(TypeUtils.isEmptyObject(filledObj)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0009: end');
    });

    /**
     * @tc.number SUB_UTILS_TYPE_UTILS_1000
     * @tc.name testUtilsTypeUtils0010
     * @tc.desc 正向: 空数组
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsTypeUtils0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0010: begin');
      expect(TypeUtils.isEmptyArray([])).assertTrue();
      expect(TypeUtils.isEmptyArray(null)).assertTrue();
      expect(TypeUtils.isEmptyArray([1])).assertFalse();
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0010: end');
    });

    // ========================================
    // 正向用例 - 类型转换
    // ========================================

    /**
     * @tc.number SUB_UTILS_TYPE_UTILS_1100
     * @tc.name testUtilsTypeUtils0011
     * @tc.desc 正向: 转字符串
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsTypeUtils0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0011: begin');
      expect(TypeUtils.toString(42)).assertEqual('42');
      expect(TypeUtils.toString(null)).assertEqual('');
      expect(TypeUtils.toString('hello')).assertEqual('hello');
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0011: end');
    });

    /**
     * @tc.number SUB_UTILS_TYPE_UTILS_1200
     * @tc.name testUtilsTypeUtils0012
     * @tc.desc 正向: 转数字
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsTypeUtils0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0012: begin');
      expect(TypeUtils.toNumber('42')).assertEqual(42);
      expect(TypeUtils.toNumber(null)).assertEqual(0);
      expect(TypeUtils.toNumber(true)).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0012: end');
    });

    /**
     * @tc.number SUB_UTILS_TYPE_UTILS_1300
     * @tc.name testUtilsTypeUtils0013
     * @tc.desc 正向: 转布尔
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsTypeUtils0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0013: begin');
      expect(TypeUtils.toBoolean('true')).assertTrue();
      expect(TypeUtils.toBoolean(null)).assertFalse();
      expect(TypeUtils.toBoolean(0)).assertFalse();
      expect(TypeUtils.toBoolean(1)).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0013: end');
    });

    /**
     * @tc.number SUB_UTILS_TYPE_UTILS_1400
     * @tc.name testUtilsTypeUtils0014
     * @tc.desc 正向: 获取类型
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsTypeUtils0014', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0014: begin');
      expect(TypeUtils.getType(null)).assertEqual('null');
      expect(TypeUtils.getType(undefined)).assertEqual('undefined');
      expect(TypeUtils.getType([1, 2])).assertEqual('array');
      expect(TypeUtils.getType('str')).assertEqual('string');
      hilog.info(DOMAIN, TAG, 'testUtilsTypeUtils0014: end');
    });
  });
}
