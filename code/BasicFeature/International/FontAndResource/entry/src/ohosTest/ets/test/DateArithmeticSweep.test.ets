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

// Import hilog directly for device side test logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
// Import the DateUtils helpers under test from the library HAR package.
import { DateUtils } from 'library';

// The suite-level hilog tag, distinct from the per-case TAG values.
const SUITE_TAG: string = '[Sample_FontAndResource]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const BUNDLE: string = 'FontAndResource_';

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// Registers every matrix case of the DateArithmeticSweepSuite suite.
export default function dateArithmeticSweepTest() {
  // Group the cases under the "DateArithmeticSweepSuite" describe block.
  describe('DateArithmeticSweepSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'DateArithmeticSweepSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_DATEAR_0100
     * @tc.name      testDateArithmeticSweepAddDays0001
     * @tc.desc      Verify addDays shifts calendar dates across positive and negative offsets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateArithmeticSweepAddDays0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateArithmeticSweepAddDays0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: addDays(2024-01-15, -30) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, -30)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), -30))).assertEqual("2023-12-16");
      // Vector 2: addDays(2024-01-15, -27) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, -27)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), -27))).assertEqual("2023-12-19");
      // Vector 3: addDays(2024-01-15, -24) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, -24)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), -24))).assertEqual("2023-12-22");
      // Vector 4: addDays(2024-01-15, -21) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, -21)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), -21))).assertEqual("2023-12-25");
      // Vector 5: addDays(2024-01-15, -18) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, -18)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), -18))).assertEqual("2023-12-28");
      // Vector 6: addDays(2024-01-15, -15) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, -15)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), -15))).assertEqual("2023-12-31");
      // Vector 7: addDays(2024-01-15, -12) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, -12)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), -12))).assertEqual("2024-01-03");
      // Vector 8: addDays(2024-01-15, -9) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, -9)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), -9))).assertEqual("2024-01-06");
      // Vector 9: addDays(2024-01-15, -6) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, -6)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), -6))).assertEqual("2024-01-09");
      // Vector 10: addDays(2024-01-15, -3) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, -3)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), -3))).assertEqual("2024-01-12");
      // Vector 11: addDays(2024-01-15, 0) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, 0)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), 0))).assertEqual("2024-01-15");
      // Vector 12: addDays(2024-01-15, 3) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, 3)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), 3))).assertEqual("2024-01-18");
      // Vector 13: addDays(2024-01-15, 6) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, 6)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), 6))).assertEqual("2024-01-21");
      // Vector 14: addDays(2024-01-15, 9) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, 9)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), 9))).assertEqual("2024-01-24");
      // Vector 15: addDays(2024-01-15, 12) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, 12)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), 12))).assertEqual("2024-01-27");
      // Vector 16: addDays(2024-01-15, 15) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, 15)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), 15))).assertEqual("2024-01-30");
      // Vector 17: addDays(2024-01-15, 18) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, 18)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), 18))).assertEqual("2024-02-02");
      // Vector 18: addDays(2024-01-15, 21) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, 21)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), 21))).assertEqual("2024-02-05");
      // Vector 19: addDays(2024-01-15, 24) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, 24)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), 24))).assertEqual("2024-02-08");
      // Vector 20: addDays(2024-01-15, 27) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, 27)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), 27))).assertEqual("2024-02-11");
      // Vector 21: addDays(2024-01-15, 30) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, 30)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), 30))).assertEqual("2024-02-14");
      // Vector 22: addDays(2024-01-15, 59) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, 59)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), 59))).assertEqual("2024-03-14");
      // Vector 23: addDays(2024-01-15, 60) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, 60)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), 60))).assertEqual("2024-03-15");
      // Vector 24: addDays(2024-01-15, 90) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, 90)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), 90))).assertEqual("2024-04-14");
      // Vector 25: addDays(2024-01-15, 180) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, 180)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), 180))).assertEqual("2024-07-13");
      // Vector 26: addDays(2024-01-15, 365) shifts the calendar date.
      logCase(TAG, "addDays(2024-01-15, 365)");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 15, 0, 0, 0), 365))).assertEqual("2025-01-14");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_DATEAR_0200
     * @tc.name      testDateArithmeticSweepWeekday0001
     * @tc.desc      Verify weekdayIndex maps Monday to zero and Sunday to six.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateArithmeticSweepWeekday0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateArithmeticSweepWeekday0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: weekdayIndex(2024-01-01) maps Monday to zero.
      logCase(TAG, "weekdayIndex(2024-01-01)");
      expect(DateUtils.weekdayIndex(new Date(2024, 0, 1, 0, 0, 0))).assertEqual(0);
      // Vector 2: weekdayIndex(2024-01-07) maps Monday to zero.
      logCase(TAG, "weekdayIndex(2024-01-07)");
      expect(DateUtils.weekdayIndex(new Date(2024, 0, 7, 0, 0, 0))).assertEqual(6);
      // Vector 3: weekdayIndex(2024-02-29) maps Monday to zero.
      logCase(TAG, "weekdayIndex(2024-02-29)");
      expect(DateUtils.weekdayIndex(new Date(2024, 1, 29, 0, 0, 0))).assertEqual(3);
      // Vector 4: weekdayIndex(2023-12-31) maps Monday to zero.
      logCase(TAG, "weekdayIndex(2023-12-31)");
      expect(DateUtils.weekdayIndex(new Date(2023, 11, 31, 0, 0, 0))).assertEqual(6);
      // Vector 5: weekdayIndex(2024-06-01) maps Monday to zero.
      logCase(TAG, "weekdayIndex(2024-06-01)");
      expect(DateUtils.weekdayIndex(new Date(2024, 5, 1, 0, 0, 0))).assertEqual(5);
      // Vector 6: weekdayIndex(2024-06-02) maps Monday to zero.
      logCase(TAG, "weekdayIndex(2024-06-02)");
      expect(DateUtils.weekdayIndex(new Date(2024, 5, 2, 0, 0, 0))).assertEqual(6);
      // Vector 7: weekdayIndex(2024-09-30) maps Monday to zero.
      logCase(TAG, "weekdayIndex(2024-09-30)");
      expect(DateUtils.weekdayIndex(new Date(2024, 8, 30, 0, 0, 0))).assertEqual(0);
      // Vector 8: weekdayIndex(2024-10-01) maps Monday to zero.
      logCase(TAG, "weekdayIndex(2024-10-01)");
      expect(DateUtils.weekdayIndex(new Date(2024, 9, 1, 0, 0, 0))).assertEqual(1);
      // Vector 9: weekdayIndex(2025-01-01) maps Monday to zero.
      logCase(TAG, "weekdayIndex(2025-01-01)");
      expect(DateUtils.weekdayIndex(new Date(2025, 0, 1, 0, 0, 0))).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_DATEAR_0300
     * @tc.name      testDateArithmeticSweepDiffMs0001
     * @tc.desc      Verify diffMs measures absolute millisecond spans between two instants.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateArithmeticSweepDiffMs0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateArithmeticSweepDiffMs0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: diffMs measures 0 minutes in milliseconds.
      logCase(TAG, "diffMs(0 minutes)");
      expect(DateUtils.diffMs(new Date(2024, 2, 1, 8, 0, 0), new Date(2024, 2, 1, 8, 0, 0))).assertEqual(0);
      // Vector 2: diffMs measures 1 minutes in milliseconds.
      logCase(TAG, "diffMs(1 minutes)");
      expect(DateUtils.diffMs(new Date(2024, 2, 1, 8, 0, 0), new Date(2024, 2, 1, 8, 1, 0))).assertEqual(60000);
      // Vector 3: diffMs measures 2 minutes in milliseconds.
      logCase(TAG, "diffMs(2 minutes)");
      expect(DateUtils.diffMs(new Date(2024, 2, 1, 8, 0, 0), new Date(2024, 2, 1, 8, 2, 0))).assertEqual(120000);
      // Vector 4: diffMs measures 5 minutes in milliseconds.
      logCase(TAG, "diffMs(5 minutes)");
      expect(DateUtils.diffMs(new Date(2024, 2, 1, 8, 0, 0), new Date(2024, 2, 1, 8, 5, 0))).assertEqual(300000);
      // Vector 5: diffMs measures 10 minutes in milliseconds.
      logCase(TAG, "diffMs(10 minutes)");
      expect(DateUtils.diffMs(new Date(2024, 2, 1, 8, 0, 0), new Date(2024, 2, 1, 8, 10, 0))).assertEqual(600000);
      // Vector 6: diffMs measures 30 minutes in milliseconds.
      logCase(TAG, "diffMs(30 minutes)");
      expect(DateUtils.diffMs(new Date(2024, 2, 1, 8, 0, 0), new Date(2024, 2, 1, 8, 30, 0))).assertEqual(1800000);
      // Vector 7: diffMs measures 59 minutes in milliseconds.
      logCase(TAG, "diffMs(59 minutes)");
      expect(DateUtils.diffMs(new Date(2024, 2, 1, 8, 0, 0), new Date(2024, 2, 1, 8, 59, 0))).assertEqual(3540000);
      // Vector 8: diffMs measures 60 minutes in milliseconds.
      logCase(TAG, "diffMs(60 minutes)");
      expect(DateUtils.diffMs(new Date(2024, 2, 1, 8, 0, 0), new Date(2024, 2, 1, 8, 60, 0))).assertEqual(3600000);
      // Vector 9: diffMs measures 120 minutes in milliseconds.
      logCase(TAG, "diffMs(120 minutes)");
      expect(DateUtils.diffMs(new Date(2024, 2, 1, 8, 0, 0), new Date(2024, 2, 1, 8, 120, 0))).assertEqual(7200000);
      // Vector 10: diffMs measures 1440 minutes in milliseconds.
      logCase(TAG, "diffMs(1440 minutes)");
      expect(DateUtils.diffMs(new Date(2024, 2, 1, 8, 0, 0), new Date(2024, 2, 1, 8, 1440, 0))).assertEqual(86400000);
      // Vector 11: diffMs measures 10080 minutes in milliseconds.
      logCase(TAG, "diffMs(10080 minutes)");
      expect(DateUtils.diffMs(new Date(2024, 2, 1, 8, 0, 0), new Date(2024, 2, 1, 8, 10080, 0))).assertEqual(604800000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_DATEAR_0400
     * @tc.name      testDateArithmeticSweepSameDay0001
     * @tc.desc      Verify isSameDay compares calendar days while ignoring the time of day.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateArithmeticSweepSameDay0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateArithmeticSweepSameDay0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isSameDay compares 2024-01-01 and 2024-01-01.
      logCase(TAG, "isSameDay(2024-01-01, 2024-01-01)");
      expect(DateUtils.isSameDay(new Date(2024, 0, 1, 0, 0, 0), new Date(2024, 0, 1, 23, 59, 59))).assertEqual(true);
      // Vector 2: isSameDay compares 2024-01-01 and 2024-01-02.
      logCase(TAG, "isSameDay(2024-01-01, 2024-01-02)");
      expect(DateUtils.isSameDay(new Date(2024, 0, 1, 0, 0, 0), new Date(2024, 0, 2, 23, 59, 59))).assertEqual(false);
      // Vector 3: isSameDay compares 2024-01-29 and 2024-01-29.
      logCase(TAG, "isSameDay(2024-01-29, 2024-01-29)");
      expect(DateUtils.isSameDay(new Date(2024, 0, 29, 0, 0, 0), new Date(2024, 0, 29, 23, 59, 59))).assertEqual(true);
      // Vector 4: isSameDay compares 2024-01-28 and 2024-01-29.
      logCase(TAG, "isSameDay(2024-01-28, 2024-01-29)");
      expect(DateUtils.isSameDay(new Date(2024, 0, 28, 0, 0, 0), new Date(2024, 0, 29, 23, 59, 59))).assertEqual(false);
      // Vector 5: isSameDay compares 2024-01-31 and 2024-01-01.
      logCase(TAG, "isSameDay(2024-01-31, 2024-01-01)");
      expect(DateUtils.isSameDay(new Date(2024, 0, 31, 0, 0, 0), new Date(2024, 0, 1, 23, 59, 59))).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
