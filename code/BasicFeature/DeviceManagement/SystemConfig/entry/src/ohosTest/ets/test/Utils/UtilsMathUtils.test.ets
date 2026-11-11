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
import { MathUtils } from 'library';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

// ========================================
// 数学工具测试套件
// ========================================

/**
 * 数学工具测试套件。
 * 测试 MathUtils 类中各数学计算方法的正确性。
 */
export default function utilsMathUtilsTest(): void {
  describe('UtilsMathUtilsTest', () => {

    // ========================================
    // 正向用例 - 数值限制与插值
    // ========================================

    /**
     * @tc.number SUB_UTILS_MATH_UTILS_0100
     * @tc.name testUtilsMathUtils0001
     * @tc.desc 正向: 范围内值不变
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsMathUtils0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0001: begin');
      const result: number = MathUtils.clamp(5, 0, 10);
      expect(result).assertEqual(5);
      expect(MathUtils.clamp(0, 0, 10)).assertEqual(0);
      expect(MathUtils.clamp(10, 0, 10)).assertEqual(10);
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0001: end');
    });

    /**
     * @tc.number SUB_UTILS_MATH_UTILS_0200
     * @tc.name testUtilsMathUtils0002
     * @tc.desc 正向: 低于最小值取最小
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsMathUtils0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0002: begin');
      const result: number = MathUtils.clamp(-5, 0, 10);
      expect(result).assertEqual(0);
      expect(MathUtils.clamp(-100, -10, 10)).assertEqual(-10);
      expect(result >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0002: end');
    });

    /**
     * @tc.number SUB_UTILS_MATH_UTILS_0300
     * @tc.name testUtilsMathUtils0003
     * @tc.desc 正向: 超过最大值取最大
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsMathUtils0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0003: begin');
      const result: number = MathUtils.clamp(15, 0, 10);
      expect(result).assertEqual(10);
      expect(MathUtils.clamp(100, 0, 10)).assertEqual(10);
      expect(result <= 10).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0003: end');
    });

    /**
     * @tc.number SUB_UTILS_MATH_UTILS_0400
     * @tc.name testUtilsMathUtils0004
     * @tc.desc 正向: 线性插值中点
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsMathUtils0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0004: begin');
      const result: number = MathUtils.lerp(0, 10, 0.5);
      expect(result).assertEqual(5);
      expect(MathUtils.lerp(0, 10, 0)).assertEqual(0);
      expect(MathUtils.lerp(0, 10, 1)).assertEqual(10);
      expect(MathUtils.lerp(0, 100, 0.25)).assertEqual(25);
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0004: end');
    });

    /**
     * @tc.number SUB_UTILS_MATH_UTILS_0500
     * @tc.name testUtilsMathUtils0005
     * @tc.desc 正向: 四舍五入
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsMathUtils0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0005: begin');
      const result: number = MathUtils.round(3.456, 2);
      expect(result).assertEqual(3.46);
      expect(MathUtils.round(3.454, 2)).assertEqual(3.45);
      expect(MathUtils.round(3.5, 0)).assertEqual(4);
      expect(MathUtils.round(-3.456, 2)).assertEqual(-3.46);
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0005: end');
    });

    // ========================================
    // 正向用例 - 随机数与范围
    // ========================================

    /**
     * @tc.number SUB_UTILS_MATH_UTILS_0600
     * @tc.name testUtilsMathUtils0006
     * @tc.desc 正向: 随机整数范围
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsMathUtils0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0006: begin');
      const result: number = MathUtils.randomInt(1, 10);
      expect(result >= 1).assertEqual(true);
      expect(result <= 10).assertEqual(true);
      expect(Number.isInteger(result)).assertEqual(true);
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0006: end');
    });

    /**
     * @tc.number SUB_UTILS_MATH_UTILS_0700
     * @tc.name testUtilsMathUtils0007
     * @tc.desc 正向: 范围内返回true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsMathUtils0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0007: begin');
      expect(MathUtils.isInRange(5, 0, 10)).assertEqual(true);
      expect(MathUtils.isInRange(0, 0, 10)).assertEqual(true);
      expect(MathUtils.isInRange(10, 0, 10)).assertEqual(true);
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0007: end');
    });

    /**
     * @tc.number SUB_UTILS_MATH_UTILS_0800
     * @tc.name testUtilsMathUtils0008
     * @tc.desc 正向: 范围外返回false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsMathUtils0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0008: begin');
      expect(MathUtils.isInRange(-1, 0, 10)).assertEqual(false);
      expect(MathUtils.isInRange(11, 0, 10)).assertEqual(false);
      expect(MathUtils.isInRange(0, 1, 10)).assertEqual(false);
      expect(MathUtils.isInRange(10, 0, 9)).assertEqual(false);
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0008: end');
    });

    // ========================================
    // 正向用例 - 统计与百分比
    // ========================================

    /**
     * @tc.number SUB_UTILS_MATH_UTILS_0900
     * @tc.name testUtilsMathUtils0009
     * @tc.desc 正向: 平均值计算
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsMathUtils0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0009: begin');
      const result: number = MathUtils.average([2, 4, 6, 8]);
      expect(result).assertEqual(5);
      expect(MathUtils.average([10])).assertEqual(10);
      expect(MathUtils.average([1, 2, 3])).assertEqual(2);
      expect(MathUtils.average([-2, 2])).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0009: end');
    });

    /**
     * @tc.number SUB_UTILS_MATH_UTILS_1000
     * @tc.name testUtilsMathUtils0010
     * @tc.desc 正向: 求和计算
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsMathUtils0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0010: begin');
      const result: number = MathUtils.sum([1, 2, 3, 4, 5]);
      expect(result).assertEqual(15);
      expect(MathUtils.sum([])).assertEqual(0);
      expect(MathUtils.sum([-1, 1])).assertEqual(0);
      expect(MathUtils.sum([100])).assertEqual(100);
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0010: end');
    });

    /**
     * @tc.number SUB_UTILS_MATH_UTILS_1100
     * @tc.name testUtilsMathUtils0011
     * @tc.desc 正向: 百分比计算
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsMathUtils0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0011: begin');
      const result: number = MathUtils.percentage(1, 4);
      expect(result).assertEqual(25);
      expect(MathUtils.percentage(1, 2)).assertEqual(50);
      expect(MathUtils.percentage(0, 10)).assertEqual(0);
      expect(MathUtils.percentage(1, 0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0011: end');
    });

    // ========================================
    // 边界用例
    // ========================================

    /**
     * @tc.number SUB_UTILS_MATH_UTILS_1200
     * @tc.name testUtilsMathUtils0012
     * @tc.desc 边界: 最小等于最大
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsMathUtils0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0012: begin');
      const result: number = MathUtils.clamp(5, 3, 3);
      expect(result).assertEqual(3);
      expect(MathUtils.clamp(3, 3, 3)).assertEqual(3);
      expect(MathUtils.clamp(1, 3, 3)).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0012: end');
    });

    /**
     * @tc.number SUB_UTILS_MATH_UTILS_1300
     * @tc.name testUtilsMathUtils0013
     * @tc.desc 边界: 空数组平均值
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsMathUtils0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0013: begin');
      const result: number = MathUtils.average([]);
      expect(result).assertEqual(0);
      expect(MathUtils.sum([])).assertEqual(0);
      expect(MathUtils.median([])).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testUtilsMathUtils0013: end');
    });
  });
}
