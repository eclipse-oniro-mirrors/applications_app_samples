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
import { CommonUtils } from 'library';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

// ========================================
// 通用工具测试套件
// ========================================

/**
 * 通用工具测试套件。
 * 测试 CommonUtils 类中各通用方法的正确性。
 */
export default function utilsCommonUtilsTest(): void {
  describe('UtilsCommonUtilsTest', () => {

    // ========================================
    // 正向用例 - ID生成
    // ========================================

    /**
     * @tc.number SUB_UTILS_COMMON_UTILS_0100
     * @tc.name testUtilsCommonUtils0001
     * @tc.desc 正向: ID唯一性
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsCommonUtils0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsCommonUtils0001: begin');
      const id1: string = CommonUtils.generateId();
      const id2: string = CommonUtils.generateId();
      const id3: string = CommonUtils.generateId();
      expect(id1 === id2).assertEqual(false);
      expect(id1 === id3).assertEqual(false);
      expect(id2 === id3).assertEqual(false);
      hilog.info(DOMAIN, TAG, 'testUtilsCommonUtils0001: end');
    });

    /**
     * @tc.number SUB_UTILS_COMMON_UTILS_0200
     * @tc.name testUtilsCommonUtils0002
     * @tc.desc 正向: ID格式（类UUID格式含连字符）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsCommonUtils0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsCommonUtils0002: begin');
      const id: string = CommonUtils.generateId();
      expect(id.indexOf('-') !== -1).assertTrue();
      expect(id.length).assertLarger(30);
      const parts: string[] = id.split('-');
      expect(parts.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, 'testUtilsCommonUtils0002: end');
    });

    // ========================================
    // 正向用例 - 空值检查
    // ========================================

    /**
     * @tc.number SUB_UTILS_COMMON_UTILS_0300
     * @tc.name testUtilsCommonUtils0003
     * @tc.desc 正向: 空字符串判断
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsCommonUtils0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsCommonUtils0003: begin');
      expect(CommonUtils.isEmpty('')).assertEqual(true);
      expect(CommonUtils.isEmpty(null)).assertEqual(true);
      expect(CommonUtils.isEmpty(undefined)).assertEqual(true);
      expect(CommonUtils.isEmpty('   ')).assertEqual(true);
      hilog.info(DOMAIN, TAG, 'testUtilsCommonUtils0003: end');
    });

    /**
     * @tc.number SUB_UTILS_COMMON_UTILS_0400
     * @tc.name testUtilsCommonUtils0004
     * @tc.desc 正向: 非空字符串判断
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsCommonUtils0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsCommonUtils0004: begin');
      expect(CommonUtils.isEmpty('hello')).assertEqual(false);
      expect(CommonUtils.isEmpty('  a  ')).assertEqual(false);
      expect(CommonUtils.isNotEmpty('test')).assertTrue();
      expect(CommonUtils.isNotEmpty('')).assertFalse();
      hilog.info(DOMAIN, TAG, 'testUtilsCommonUtils0004: end');
    });

    // ========================================
    // 正向用例 - 深拷贝
    // ========================================

    /**
     * @tc.number SUB_UTILS_COMMON_UTILS_0500
     * @tc.name testUtilsCommonUtils0005
     * @tc.desc 正向: 对象深拷贝
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsCommonUtils0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsCommonUtils0005: begin');
      const original: Record<string, Object> = { 'name': 'test', 'value': 42 };
      const cloned: Record<string, Object> = CommonUtils.deepClone(original);
      expect(JSON.stringify(cloned)).assertEqual(JSON.stringify(original));
      expect(cloned === original).assertEqual(false);
      expect(cloned['name']).assertEqual('test');
      expect(cloned['value']).assertEqual(42);
      hilog.info(DOMAIN, TAG, 'testUtilsCommonUtils0005: end');
    });

    /**
     * @tc.number SUB_UTILS_COMMON_UTILS_0600
     * @tc.name testUtilsCommonUtils0006
     * @tc.desc 正向: 数组深拷贝
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsCommonUtils0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsCommonUtils0006: begin');
      const original: number[] = [1, 2, 3, 4, 5];
      const cloned: number[] = CommonUtils.deepClone(original);
      expect(JSON.stringify(cloned)).assertEqual(JSON.stringify(original));
      expect(cloned === original).assertEqual(false);
      expect(cloned.length).assertEqual(5);
      expect(cloned[0]).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'testUtilsCommonUtils0006: end');
    });

    // ========================================
    // 正向用例 - JSON解析
    // ========================================

    /**
     * @tc.number SUB_UTILS_COMMON_UTILS_0700
     * @tc.name testUtilsCommonUtils0007
     * @tc.desc 正向: 合法JSON解析
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsCommonUtils0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsCommonUtils0007: begin');
      const result: object | null = CommonUtils.safeJsonParse('{"key":"value"}');
      expect(JSON.stringify(result)).assertEqual('{"key":"value"}');
      expect(CommonUtils.isNullOrEmpty(result)).assertFalse();
      expect(CommonUtils.safeJsonStringify(result, false)).assertEqual('{"key":"value"}');
      const arrayResult: object | null = CommonUtils.safeJsonParse('[1,2,3]');
      expect(JSON.stringify(arrayResult)).assertEqual('[1,2,3]');
      expect(CommonUtils.isNullOrEmpty(arrayResult)).assertFalse();
      const nested: object | null = CommonUtils.safeJsonParse('{"a":{"b":[1,2]}}');
      expect(JSON.stringify(nested)).assertEqual('{"a":{"b":[1,2]}}');
      expect(CommonUtils.safeJsonParse('   ')).assertNull();
      hilog.info(DOMAIN, TAG, 'testUtilsCommonUtils0007: end');
    });

    /**
     * @tc.number SUB_UTILS_COMMON_UTILS_0800
     * @tc.name testUtilsCommonUtils0008
     * @tc.desc 反向: 非法JSON解析返回null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsCommonUtils0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsCommonUtils0008: begin');
      const result: object | null = CommonUtils.safeJsonParse('not valid json');
      expect(result).assertNull();
      expect(CommonUtils.safeJsonParse('')).assertNull();
      expect(CommonUtils.safeJsonParse(null)).assertNull();
      hilog.info(DOMAIN, TAG, 'testUtilsCommonUtils0008: end');
    });

    // ========================================
    // 正向用例 - 重试机制
    // ========================================

    /**
     * @tc.number SUB_UTILS_COMMON_UTILS_0900
     * @tc.name testUtilsCommonUtils0009
     * @tc.desc 正向: 重试成功（首次即成功）
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsCommonUtils0009', 0, async () => {
      hilog.info(DOMAIN, TAG, 'testUtilsCommonUtils0009: begin');
      let callCount: number = 0;
      const startedAt: number = Date.now();
      const result: string = await CommonUtils.retry<string>(async (): Promise<string> => {
        callCount++;
        return 'success';
      }, 3, 5000, false);
      const elapsed: number = Date.now() - startedAt;
      expect(result).assertEqual('success');
      expect(callCount).assertEqual(1);
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed).assertLess(5000);
      hilog.info(DOMAIN, TAG, 'testUtilsCommonUtils0009: end');
    });

    // ========================================
    // 边界用例
    // ========================================

    /**
     * @tc.number SUB_UTILS_COMMON_UTILS_1000
     * @tc.name testUtilsCommonUtils0010
     * @tc.desc 边界: ID非空检查
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsCommonUtils0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsCommonUtils0010: begin');
      const id: string = CommonUtils.generateId();
      expect(CommonUtils.isEmpty(id)).assertFalse();
      expect(id.length).assertLarger(0);
      expect(CommonUtils.isNotEmpty(id)).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUtilsCommonUtils0010: end');
    });
  });
}
