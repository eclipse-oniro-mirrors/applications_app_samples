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
import { FormatUtils } from 'library';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF820;
const TAG: string = '[Sample_SystemConfig]';

// ========================================
// 格式化工具测试套件
// ========================================

/**
 * 格式化工具测试套件。
 * 测试 FormatUtils 类中各格式化方法的正确性。
 */
export default function utilsFormatUtilsTest(): void {
  describe('UtilsFormatUtilsTest', () => {

    // ========================================
    // 正向用例 - 字节格式化
    // ========================================

    /**
     * @tc.number SUB_UTILS_FORMAT_UTILS_0100
     * @tc.name testUtilsFormatUtils0001
     * @tc.desc 正向: 0字节
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsFormatUtils0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsFormatUtils0001: begin');
      const result: string = FormatUtils.formatBytes(0);
      expect(result).assertEqual('0 B');
      expect(result.length).assertEqual(3);
      expect(result.indexOf('B')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, 'testUtilsFormatUtils0001: end');
    });

    /**
     * @tc.number SUB_UTILS_FORMAT_UTILS_0200
     * @tc.name testUtilsFormatUtils0002
     * @tc.desc 正向: KB格式
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsFormatUtils0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsFormatUtils0002: begin');
      const result: string = FormatUtils.formatBytes(1024);
      expect(result).assertEqual('1 KB');
      expect(result.indexOf('KB')).assertLarger(-1);
      expect(FormatUtils.formatBytes(1536)).assertEqual('1.5 KB');
      expect(FormatUtils.formatBytes(1024, 0)).assertEqual('1 KB');
      hilog.info(DOMAIN, TAG, 'testUtilsFormatUtils0002: end');
    });

    /**
     * @tc.number SUB_UTILS_FORMAT_UTILS_0300
     * @tc.name testUtilsFormatUtils0003
     * @tc.desc 正向: MB格式
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsFormatUtils0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsFormatUtils0003: begin');
      const result: string = FormatUtils.formatBytes(1048576);
      expect(result).assertEqual('1 MB');
      expect(result.indexOf('MB')).assertLarger(-1);
      expect(FormatUtils.formatBytes(1572864)).assertEqual('1.5 MB');
      hilog.info(DOMAIN, TAG, 'testUtilsFormatUtils0003: end');
    });

    /**
     * @tc.number SUB_UTILS_FORMAT_UTILS_0400
     * @tc.name testUtilsFormatUtils0004
     * @tc.desc 正向: GB格式
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsFormatUtils0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsFormatUtils0004: begin');
      const result: string = FormatUtils.formatBytes(1073741824);
      expect(result).assertEqual('1 GB');
      expect(result.indexOf('GB')).assertLarger(-1);
      expect(FormatUtils.formatBytes(1610612736)).assertEqual('1.5 GB');
      hilog.info(DOMAIN, TAG, 'testUtilsFormatUtils0004: end');
    });

    // ========================================
    // 正向用例 - 时长与数字格式化
    // ========================================

    /**
     * @tc.number SUB_UTILS_FORMAT_UTILS_0500
     * @tc.name testUtilsFormatUtils0005
     * @tc.desc 正向: 时长格式化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsFormatUtils0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsFormatUtils0005: begin');
      const result: string = FormatUtils.formatDuration(3661000);
      expect(result).assertEqual('1小时1分1秒');
      expect(result.indexOf('小时')).assertLarger(-1);
      expect(FormatUtils.formatDuration(0)).assertEqual('0秒');
      expect(FormatUtils.formatDuration(-1000)).assertEqual('0秒');
      expect(FormatUtils.formatDuration(60000)).assertEqual('1分');
      hilog.info(DOMAIN, TAG, 'testUtilsFormatUtils0005: end');
    });

    /**
     * @tc.number SUB_UTILS_FORMAT_UTILS_0600
     * @tc.name testUtilsFormatUtils0006
     * @tc.desc 正向: 数字格式化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsFormatUtils0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsFormatUtils0006: begin');
      const result: string = FormatUtils.formatNumber(3.14159, 2);
      expect(result).assertEqual('3.14');
      expect(result.indexOf('.')).assertLarger(-1);
      expect(FormatUtils.formatNumber(NaN)).assertEqual('0');
      expect(FormatUtils.formatNumber(100, 0)).assertEqual('100');
      hilog.info(DOMAIN, TAG, 'testUtilsFormatUtils0006: end');
    });

    /**
     * @tc.number SUB_UTILS_FORMAT_UTILS_0700
     * @tc.name testUtilsFormatUtils0007
     * @tc.desc 正向: 前填充
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsFormatUtils0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsFormatUtils0007: begin');
      const result: string = FormatUtils.padStart('42', 5, '0');
      expect(result).assertEqual('00042');
      expect(result.length).assertEqual(5);
      expect(FormatUtils.padStart('hello', 3, '0')).assertEqual('hello');
      expect(FormatUtils.padStart('', 3, 'x')).assertEqual('xxx');
      hilog.info(DOMAIN, TAG, 'testUtilsFormatUtils0007: end');
    });

    // ========================================
    // 正向用例 - 字符串截断与百分比
    // ========================================

    /**
     * @tc.number SUB_UTILS_FORMAT_UTILS_0800
     * @tc.name testUtilsFormatUtils0008
     * @tc.desc 正向: 短字符串不截断
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsFormatUtils0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsFormatUtils0008: begin');
      const result: string = FormatUtils.truncate('hi', 10);
      expect(result).assertEqual('hi');
      expect(result.length).assertEqual(2);
      expect(FormatUtils.truncate('', 5)).assertEqual('');
      expect(FormatUtils.truncate('exact', 5)).assertEqual('exact');
      hilog.info(DOMAIN, TAG, 'testUtilsFormatUtils0008: end');
    });

    /**
     * @tc.number SUB_UTILS_FORMAT_UTILS_0900
     * @tc.name testUtilsFormatUtils0009
     * @tc.desc 正向: 长字符串截断
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsFormatUtils0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsFormatUtils0009: begin');
      const result: string = FormatUtils.truncate('hello world', 8);
      expect(result).assertEqual('hello...');
      expect(result.length).assertEqual(8);
      expect(result.indexOf('...')).assertLarger(-1);
      expect(FormatUtils.truncate('hello world', 8, '--').length).assertLess(9);
      hilog.info(DOMAIN, TAG, 'testUtilsFormatUtils0009: end');
    });

    /**
     * @tc.number SUB_UTILS_FORMAT_UTILS_1000
     * @tc.name testUtilsFormatUtils0010
     * @tc.desc 正向: 百分比格式化
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsFormatUtils0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsFormatUtils0010: begin');
      const result: string = FormatUtils.formatPercentage(0.756);
      expect(result).assertEqual('75.6%');
      expect(result.indexOf('%')).assertLarger(-1);
      expect(FormatUtils.formatPercentage(0)).assertEqual('0.0%');
      expect(FormatUtils.formatPercentage(1)).assertEqual('100.0%');
      expect(FormatUtils.formatPercentage(50)).assertEqual('50.0%');
      hilog.info(DOMAIN, TAG, 'testUtilsFormatUtils0010: end');
    });

    // ========================================
    // 边界用例
    // ========================================

    /**
     * @tc.number SUB_UTILS_FORMAT_UTILS_1100
     * @tc.name testUtilsFormatUtils0011
     * @tc.desc 边界: 负数处理
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testUtilsFormatUtils0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testUtilsFormatUtils0011: begin');
      const result: string = FormatUtils.formatBytes(-1024);
      expect(result.indexOf('-') !== -1).assertEqual(true);
      expect(result.indexOf('KB') !== -1).assertEqual(true);
      expect(result).assertEqual('-1 KB');
      expect(FormatUtils.formatBytes(-1048576).indexOf('MB')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, 'testUtilsFormatUtils0011: end');
    });
  });
}
