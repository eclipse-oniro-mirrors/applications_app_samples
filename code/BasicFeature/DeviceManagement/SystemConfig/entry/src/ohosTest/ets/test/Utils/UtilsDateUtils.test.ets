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
import { DateUtils } from 'library';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

// ========================================
// 日期工具测试套件
// ========================================

/**
 * 日期工具测试套件。
 * 测试 DateUtils 类中各日期处理方法的正确性。
 */
export default function utilsDateUtilsTest(): void {
  describe('UtilsDateUtilsTest', () => {

    // ========================================
    // 正向用例 - 基础时间
    // ========================================

    /**
     * @tc.number SUB_UTILS_DATE_UTILS_0100
     * @tc.name testUtilsDateUtils0001
     * @tc.desc 正向: now返回数字
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsDateUtils0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsDateUtils0001: begin');
      const result: number = DateUtils.now();
      const now: number = Date.now();
      expect(result > 0).assertTrue();
      expect(Math.abs(result - now)).assertLess(1000);
      expect(result).assertLarger(0);
      hilog.info(DOMAIN, TAG, 'testUtilsDateUtils0001: end');
    });

    /**
     * @tc.number SUB_UTILS_DATE_UTILS_0200
     * @tc.name testUtilsDateUtils0002
     * @tc.desc 正向: 日期格式化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsDateUtils0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsDateUtils0002: begin');
      const timestamp: number = new Date(2024, 0, 15).getTime();
      const result: string = DateUtils.formatDate(timestamp);
      expect(result).assertEqual('2024-01-15');
      expect(result.length).assertEqual(10);
      expect(result.indexOf('-')).assertEqual(4);
      const timestamp2: number = new Date(2024, 11, 25).getTime();
      expect(DateUtils.formatDate(timestamp2)).assertEqual('2024-12-25');
      hilog.info(DOMAIN, TAG, 'testUtilsDateUtils0002: end');
    });

    // ========================================
    // 正向用例 - 日期计算
    // ========================================

    /**
     * @tc.number SUB_UTILS_DATE_UTILS_0300
     * @tc.name testUtilsDateUtils0003
     * @tc.desc 正向: 增加天数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsDateUtils0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsDateUtils0003: begin');
      const base: number = new Date(2024, 0, 1).getTime();
      const result: number = DateUtils.addDays(base, 1);
      const expected: number = base + 86400000;
      expect(result).assertEqual(expected);
      expect(DateUtils.addDays(base, 0)).assertEqual(base);
      expect(DateUtils.addDays(base, -1)).assertEqual(base - 86400000);
      expect(DateUtils.addDays(base, 10)).assertEqual(base + 864000000);
      hilog.info(DOMAIN, TAG, 'testUtilsDateUtils0003: end');
    });

    /**
     * @tc.number SUB_UTILS_DATE_UTILS_0400
     * @tc.name testUtilsDateUtils0004
     * @tc.desc 正向: 增加小时
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsDateUtils0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsDateUtils0004: begin');
      const base: number = new Date(2024, 0, 1).getTime();
      const result: number = DateUtils.addHours(base, 2);
      const expected: number = base + 7200000;
      expect(result).assertEqual(expected);
      expect(DateUtils.addHours(base, 0)).assertEqual(base);
      expect(DateUtils.addHours(base, -1)).assertEqual(base - 3600000);
      expect(DateUtils.addHours(base, 24)).assertEqual(base + 86400000);
      hilog.info(DOMAIN, TAG, 'testUtilsDateUtils0004: end');
    });

    /**
     * @tc.number SUB_UTILS_DATE_UTILS_0500
     * @tc.name testUtilsDateUtils0005
     * @tc.desc 正向: 增加分钟
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsDateUtils0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsDateUtils0005: begin');
      const base: number = new Date(2024, 0, 1).getTime();
      const result: number = DateUtils.addMinutes(base, 30);
      const expected: number = base + 1800000;
      expect(result).assertEqual(expected);
      expect(DateUtils.addMinutes(base, 0)).assertEqual(base);
      expect(DateUtils.addMinutes(base, -15)).assertEqual(base - 900000);
      expect(DateUtils.addMinutes(base, 60)).assertEqual(base + 3600000);
      hilog.info(DOMAIN, TAG, 'testUtilsDateUtils0005: end');
    });

    // ========================================
    // 正向用例 - 日期判断
    // ========================================

    /**
     * @tc.number SUB_UTILS_DATE_UTILS_0600
     * @tc.name testUtilsDateUtils0006
     * @tc.desc 正向: 判断今天
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsDateUtils0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsDateUtils0006: begin');
      const now: number = Date.now();
      expect(DateUtils.isToday(now)).assertTrue();
      const yesterday: number = now - 86400000;
      expect(DateUtils.isToday(yesterday)).assertFalse();
      const tomorrow: number = now + 86400000;
      expect(DateUtils.isToday(tomorrow)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testUtilsDateUtils0006: end');
    });

    /**
     * @tc.number SUB_UTILS_DATE_UTILS_0700
     * @tc.name testUtilsDateUtils0007
     * @tc.desc 正向: 判断昨天
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsDateUtils0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsDateUtils0007: begin');
      const yesterday: number = Date.now() - 86400000;
      expect(DateUtils.isYesterday(yesterday)).assertTrue();
      expect(DateUtils.isYesterday(Date.now())).assertFalse();
      const dayBeforeYesterday: number = Date.now() - 2 * 86400000;
      expect(DateUtils.isYesterday(dayBeforeYesterday)).assertFalse();
      hilog.info(DOMAIN, TAG, 'testUtilsDateUtils0007: end');
    });

    // ========================================
    // 正向用例 - 相对时间
    // ========================================

    /**
     * @tc.number SUB_UTILS_DATE_UTILS_0800
     * @tc.name testUtilsDateUtils0008
     * @tc.desc 正向: 刚刚
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsDateUtils0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsDateUtils0008: begin');
      const now: number = Date.now();
      const result: string = DateUtils.getRelativeTime(now);
      expect(result).assertEqual('刚刚');
      expect(result.length).assertLarger(0);
      const oneMinuteAgo: number = now - 30000;
      expect(DateUtils.getRelativeTime(oneMinuteAgo)).assertEqual('刚刚');
      hilog.info(DOMAIN, TAG, 'testUtilsDateUtils0008: end');
    });

    /**
     * @tc.number SUB_UTILS_DATE_UTILS_0900
     * @tc.name testUtilsDateUtils0009
     * @tc.desc 正向: 分钟前
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsDateUtils0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsDateUtils0009: begin');
      const fiveMinutesAgo: number = Date.now() - 5 * 60000;
      const result: string = DateUtils.getRelativeTime(fiveMinutesAgo);
      expect(result).assertEqual('5分钟前');
      expect(result.indexOf('分钟')).assertLarger(-1);
      const oneHourAgo: number = Date.now() - 2 * 3600000;
      expect(DateUtils.getRelativeTime(oneHourAgo)).assertEqual('2小时前');
      hilog.info(DOMAIN, TAG, 'testUtilsDateUtils0009: end');
    });

    // ========================================
    // 正向用例 - 日期解析
    // ========================================

    /**
     * @tc.number SUB_UTILS_DATE_UTILS_1000
     * @tc.name testUtilsDateUtils0010
     * @tc.desc 正向: 解析合法日期
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsDateUtils0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsDateUtils0010: begin');
      const result: number = DateUtils.parse('2024-01-15');
      expect(result > 0).assertTrue();
      expect(DateUtils.formatDate(result)).assertEqual('2024-01-15');
      expect(DateUtils.parse('')).assertEqual(0);
      expect(DateUtils.parse('invalid-date')).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testUtilsDateUtils0010: end');
    });

    // ========================================
    // 边界用例
    // ========================================

    /**
     * @tc.number SUB_UTILS_DATE_UTILS_1100
     * @tc.name testUtilsDateUtils0011
     * @tc.desc 边界: 零时间戳
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsDateUtils0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsDateUtils0011: begin');
      const result: string = DateUtils.formatDate(0);
      expect(result.length).assertEqual(10);
      expect(result.indexOf('-')).assertLarger(-1);
      const parsed: number = DateUtils.parse(result);
      expect(parsed).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'testUtilsDateUtils0011: end');
    });
  });
}
