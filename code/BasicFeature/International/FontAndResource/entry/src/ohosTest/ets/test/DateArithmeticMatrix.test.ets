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

// Registers every matrix case of the DateArithmeticMatrixSuite suite.
export default function dateArithmeticMatrixTest() {
  // Group the cases under the "DateArithmeticMatrixSuite" describe block.
  describe('DateArithmeticMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'DateArithmeticMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DATEAR_0100
     * @tc.name      testDateArithmeticAddDays0001
     * @tc.desc      Verify addDays shifts the calendar date across month and year boundaries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateArithmeticAddDays0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateArithmeticAddDays0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: addDays(2024-01-01, 0) returns 2024-01-01.
      logCase(TAG, "addDays 2024-01-01");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 1, 0, 0, 0), 0))).assertEqual("2024-01-01");
      // Vector 2: addDays(2024-01-01, 1) returns 2024-01-02.
      logCase(TAG, "addDays 2024-01-02");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 1, 0, 0, 0), 1))).assertEqual("2024-01-02");
      // Vector 3: addDays(2024-01-01, 2) returns 2024-01-03.
      logCase(TAG, "addDays 2024-01-03");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 1, 0, 0, 0), 2))).assertEqual("2024-01-03");
      // Vector 4: addDays(2024-01-01, 7) returns 2024-01-08.
      logCase(TAG, "addDays 2024-01-08");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 1, 0, 0, 0), 7))).assertEqual("2024-01-08");
      // Vector 5: addDays(2024-01-01, 30) returns 2024-01-31.
      logCase(TAG, "addDays 2024-01-31");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 1, 0, 0, 0), 30))).assertEqual("2024-01-31");
      // Vector 6: addDays(2024-01-01, 31) returns 2024-02-01.
      logCase(TAG, "addDays 2024-02-01");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 1, 0, 0, 0), 31))).assertEqual("2024-02-01");
      // Vector 7: addDays(2024-01-01, 365) returns 2024-12-31.
      logCase(TAG, "addDays 2024-12-31");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 1, 0, 0, 0), 365))).assertEqual("2024-12-31");
      // Vector 8: addDays(2024-01-01, -1) returns 2023-12-31.
      logCase(TAG, "addDays 2023-12-31");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 1, 0, 0, 0), -1))).assertEqual("2023-12-31");
      // Vector 9: addDays(2024-01-01, -7) returns 2023-12-25.
      logCase(TAG, "addDays 2023-12-25");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 1, 0, 0, 0), -7))).assertEqual("2023-12-25");
      // Vector 10: addDays(2024-01-01, -365) returns 2023-01-01.
      logCase(TAG, "addDays 2023-01-01");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 1, 0, 0, 0), -365))).assertEqual("2023-01-01");
      // Vector 11: addDays(2024-01-31, 0) returns 2024-01-31.
      logCase(TAG, "addDays 2024-01-31");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 31, 0, 0, 0), 0))).assertEqual("2024-01-31");
      // Vector 12: addDays(2024-01-31, 1) returns 2024-02-01.
      logCase(TAG, "addDays 2024-02-01");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 31, 0, 0, 0), 1))).assertEqual("2024-02-01");
      // Vector 13: addDays(2024-01-31, 2) returns 2024-02-02.
      logCase(TAG, "addDays 2024-02-02");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 31, 0, 0, 0), 2))).assertEqual("2024-02-02");
      // Vector 14: addDays(2024-01-31, 7) returns 2024-02-07.
      logCase(TAG, "addDays 2024-02-07");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 31, 0, 0, 0), 7))).assertEqual("2024-02-07");
      // Vector 15: addDays(2024-01-31, 30) returns 2024-03-01.
      logCase(TAG, "addDays 2024-03-01");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 31, 0, 0, 0), 30))).assertEqual("2024-03-01");
      // Vector 16: addDays(2024-01-31, 31) returns 2024-03-02.
      logCase(TAG, "addDays 2024-03-02");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 31, 0, 0, 0), 31))).assertEqual("2024-03-02");
      // Vector 17: addDays(2024-01-31, 365) returns 2025-01-30.
      logCase(TAG, "addDays 2025-01-30");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 31, 0, 0, 0), 365))).assertEqual("2025-01-30");
      // Vector 18: addDays(2024-01-31, -1) returns 2024-01-30.
      logCase(TAG, "addDays 2024-01-30");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 31, 0, 0, 0), -1))).assertEqual("2024-01-30");
      // Vector 19: addDays(2024-01-31, -7) returns 2024-01-24.
      logCase(TAG, "addDays 2024-01-24");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 31, 0, 0, 0), -7))).assertEqual("2024-01-24");
      // Vector 20: addDays(2024-01-31, -365) returns 2023-01-31.
      logCase(TAG, "addDays 2023-01-31");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 0, 31, 0, 0, 0), -365))).assertEqual("2023-01-31");
      // Vector 21: addDays(2024-02-28, 0) returns 2024-02-28.
      logCase(TAG, "addDays 2024-02-28");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 1, 28, 0, 0, 0), 0))).assertEqual("2024-02-28");
      // Vector 22: addDays(2024-02-28, 1) returns 2024-02-29.
      logCase(TAG, "addDays 2024-02-29");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 1, 28, 0, 0, 0), 1))).assertEqual("2024-02-29");
      // Vector 23: addDays(2024-02-28, 2) returns 2024-03-01.
      logCase(TAG, "addDays 2024-03-01");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 1, 28, 0, 0, 0), 2))).assertEqual("2024-03-01");
      // Vector 24: addDays(2024-02-28, 7) returns 2024-03-06.
      logCase(TAG, "addDays 2024-03-06");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 1, 28, 0, 0, 0), 7))).assertEqual("2024-03-06");
      // Vector 25: addDays(2024-02-28, 30) returns 2024-03-29.
      logCase(TAG, "addDays 2024-03-29");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 1, 28, 0, 0, 0), 30))).assertEqual("2024-03-29");
      // Vector 26: addDays(2024-02-28, 31) returns 2024-03-30.
      logCase(TAG, "addDays 2024-03-30");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 1, 28, 0, 0, 0), 31))).assertEqual("2024-03-30");
      // Vector 27: addDays(2024-02-28, 365) returns 2025-02-27.
      logCase(TAG, "addDays 2025-02-27");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 1, 28, 0, 0, 0), 365))).assertEqual("2025-02-27");
      // Vector 28: addDays(2024-02-28, -1) returns 2024-02-27.
      logCase(TAG, "addDays 2024-02-27");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 1, 28, 0, 0, 0), -1))).assertEqual("2024-02-27");
      // Vector 29: addDays(2024-02-28, -7) returns 2024-02-21.
      logCase(TAG, "addDays 2024-02-21");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 1, 28, 0, 0, 0), -7))).assertEqual("2024-02-21");
      // Vector 30: addDays(2024-02-28, -365) returns 2023-02-28.
      logCase(TAG, "addDays 2023-02-28");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 1, 28, 0, 0, 0), -365))).assertEqual("2023-02-28");
      // Vector 31: addDays(2024-12-31, 0) returns 2024-12-31.
      logCase(TAG, "addDays 2024-12-31");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 11, 31, 0, 0, 0), 0))).assertEqual("2024-12-31");
      // Vector 32: addDays(2024-12-31, 1) returns 2025-01-01.
      logCase(TAG, "addDays 2025-01-01");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 11, 31, 0, 0, 0), 1))).assertEqual("2025-01-01");
      // Vector 33: addDays(2024-12-31, 2) returns 2025-01-02.
      logCase(TAG, "addDays 2025-01-02");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 11, 31, 0, 0, 0), 2))).assertEqual("2025-01-02");
      // Vector 34: addDays(2024-12-31, 7) returns 2025-01-07.
      logCase(TAG, "addDays 2025-01-07");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 11, 31, 0, 0, 0), 7))).assertEqual("2025-01-07");
      // Vector 35: addDays(2024-12-31, 30) returns 2025-01-30.
      logCase(TAG, "addDays 2025-01-30");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 11, 31, 0, 0, 0), 30))).assertEqual("2025-01-30");
      // Vector 36: addDays(2024-12-31, 31) returns 2025-01-31.
      logCase(TAG, "addDays 2025-01-31");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 11, 31, 0, 0, 0), 31))).assertEqual("2025-01-31");
      // Vector 37: addDays(2024-12-31, 365) returns 2025-12-31.
      logCase(TAG, "addDays 2025-12-31");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 11, 31, 0, 0, 0), 365))).assertEqual("2025-12-31");
      // Vector 38: addDays(2024-12-31, -1) returns 2024-12-30.
      logCase(TAG, "addDays 2024-12-30");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 11, 31, 0, 0, 0), -1))).assertEqual("2024-12-30");
      // Vector 39: addDays(2024-12-31, -7) returns 2024-12-24.
      logCase(TAG, "addDays 2024-12-24");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 11, 31, 0, 0, 0), -7))).assertEqual("2024-12-24");
      // Vector 40: addDays(2024-12-31, -365) returns 2024-01-01.
      logCase(TAG, "addDays 2024-01-01");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2024, 11, 31, 0, 0, 0), -365))).assertEqual("2024-01-01");
      // Vector 41: addDays(2023-03-01, 0) returns 2023-03-01.
      logCase(TAG, "addDays 2023-03-01");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2023, 2, 1, 0, 0, 0), 0))).assertEqual("2023-03-01");
      // Vector 42: addDays(2023-03-01, 1) returns 2023-03-02.
      logCase(TAG, "addDays 2023-03-02");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2023, 2, 1, 0, 0, 0), 1))).assertEqual("2023-03-02");
      // Vector 43: addDays(2023-03-01, 2) returns 2023-03-03.
      logCase(TAG, "addDays 2023-03-03");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2023, 2, 1, 0, 0, 0), 2))).assertEqual("2023-03-03");
      // Vector 44: addDays(2023-03-01, 7) returns 2023-03-08.
      logCase(TAG, "addDays 2023-03-08");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2023, 2, 1, 0, 0, 0), 7))).assertEqual("2023-03-08");
      // Vector 45: addDays(2023-03-01, 30) returns 2023-03-31.
      logCase(TAG, "addDays 2023-03-31");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2023, 2, 1, 0, 0, 0), 30))).assertEqual("2023-03-31");
      // Vector 46: addDays(2023-03-01, 31) returns 2023-04-01.
      logCase(TAG, "addDays 2023-04-01");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2023, 2, 1, 0, 0, 0), 31))).assertEqual("2023-04-01");
      // Vector 47: addDays(2023-03-01, 365) returns 2024-02-29.
      logCase(TAG, "addDays 2024-02-29");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2023, 2, 1, 0, 0, 0), 365))).assertEqual("2024-02-29");
      // Vector 48: addDays(2023-03-01, -1) returns 2023-02-28.
      logCase(TAG, "addDays 2023-02-28");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2023, 2, 1, 0, 0, 0), -1))).assertEqual("2023-02-28");
      // Vector 49: addDays(2023-03-01, -7) returns 2023-02-22.
      logCase(TAG, "addDays 2023-02-22");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2023, 2, 1, 0, 0, 0), -7))).assertEqual("2023-02-22");
      // Vector 50: addDays(2023-03-01, -365) returns 2022-03-01.
      logCase(TAG, "addDays 2022-03-01");
      expect(DateUtils.formatDate(DateUtils.addDays(new Date(2023, 2, 1, 0, 0, 0), -365))).assertEqual("2022-03-01");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DATEAR_0200
     * @tc.name      testDateWeekdayIndex0001
     * @tc.desc      Verify weekdayIndex maps Monday to zero and Sunday to six.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateWeekdayIndex0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateWeekdayIndex0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: weekdayIndex(2024-01-01) returns 0.
      logCase(TAG, "weekdayIndex 0");
      expect(DateUtils.weekdayIndex(new Date(2024, 0, 1))).assertEqual(0);
      // Vector 2: weekdayIndex(2024-01-31) returns 2.
      logCase(TAG, "weekdayIndex 2");
      expect(DateUtils.weekdayIndex(new Date(2024, 0, 31))).assertEqual(2);
      // Vector 3: weekdayIndex(2024-02-28) returns 2.
      logCase(TAG, "weekdayIndex 2");
      expect(DateUtils.weekdayIndex(new Date(2024, 1, 28))).assertEqual(2);
      // Vector 4: weekdayIndex(2024-12-31) returns 1.
      logCase(TAG, "weekdayIndex 1");
      expect(DateUtils.weekdayIndex(new Date(2024, 11, 31))).assertEqual(1);
      // Vector 5: weekdayIndex(2023-03-01) returns 2.
      logCase(TAG, "weekdayIndex 2");
      expect(DateUtils.weekdayIndex(new Date(2023, 2, 1))).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DATEAR_0300
     * @tc.name      testDateArithmeticSameDay0001
     * @tc.desc      Verify isSameDay compares only the calendar day fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateArithmeticSameDay0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateArithmeticSameDay0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isSameDay compares (2024, 1, 1) and (2024, 1, 1).
      logCase(TAG, "isSameDay True");
      expect(DateUtils.isSameDay(new Date(2024, 0, 1, 0, 0, 0), new Date(2024, 0, 1, 0, 0, 0))).assertTrue();
      // Vector 2: isSameDay compares (2024, 1, 1) and (2024, 1, 2).
      logCase(TAG, "isSameDay False");
      expect(DateUtils.isSameDay(new Date(2024, 0, 1, 0, 0, 0), new Date(2024, 0, 2, 0, 0, 0))).assertFalse();
      // Vector 3: isSameDay compares (2024, 2, 29) and (2024, 2, 29).
      logCase(TAG, "isSameDay True");
      expect(DateUtils.isSameDay(new Date(2024, 1, 29, 0, 0, 0), new Date(2024, 1, 29, 0, 0, 0))).assertTrue();
      // Vector 4: isSameDay compares (2024, 12, 31) and (2025, 1, 1).
      logCase(TAG, "isSameDay False");
      expect(DateUtils.isSameDay(new Date(2024, 11, 31, 0, 0, 0), new Date(2025, 0, 1, 0, 0, 0))).assertFalse();
      // Vector 5: isSameDay compares (2023, 5, 6, 10) and (2023, 5, 6, 22).
      logCase(TAG, "isSameDay True");
      expect(DateUtils.isSameDay(new Date(2023, 4, 6, 10, 0, 0), new Date(2023, 4, 6, 22, 0, 0))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DATEAR_0400
     * @tc.name      testDateDiffMs0001
     * @tc.desc      Verify diffMs returns the absolute millisecond distance between two dates.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateDiffMs0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateDiffMs0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: diffMs between (2024, 1, 1, 0, 0, 0) and (2024, 1, 1, 0, 0, 1) is 1000.
      logCase(TAG, "diffMs 1000");
      expect(DateUtils.diffMs(new Date(2024, 0, 1, 0, 0, 0), new Date(2024, 0, 1, 0, 0, 1))).assertEqual(1000);
      // Vector 2: diffMs between (2024, 1, 1, 0, 0, 0) and (2024, 1, 1, 0, 1, 0) is 60000.
      logCase(TAG, "diffMs 60000");
      expect(DateUtils.diffMs(new Date(2024, 0, 1, 0, 0, 0), new Date(2024, 0, 1, 0, 1, 0))).assertEqual(60000);
      // Vector 3: diffMs between (2024, 1, 1, 0, 0, 0) and (2024, 1, 1, 1, 0, 0) is 3600000.
      logCase(TAG, "diffMs 3600000");
      expect(DateUtils.diffMs(new Date(2024, 0, 1, 0, 0, 0), new Date(2024, 0, 1, 1, 0, 0))).assertEqual(3600000);
      // Vector 4: diffMs between (2024, 1, 1, 0, 0, 0) and (2024, 1, 2, 0, 0, 0) is 86400000.
      logCase(TAG, "diffMs 86400000");
      expect(DateUtils.diffMs(new Date(2024, 0, 1, 0, 0, 0), new Date(2024, 0, 2, 0, 0, 0))).assertEqual(86400000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
