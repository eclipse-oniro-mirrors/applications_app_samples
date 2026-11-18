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

// Registers every matrix case of the DateFormattedMatrixSuite suite.
export default function dateFormattedMatrixTest() {
  // Group the cases under the "DateFormattedMatrixSuite" describe block.
  describe('DateFormattedMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'DateFormattedMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DATEFMT_0100
     * @tc.name      testDateFormatCalendar0001
     * @tc.desc      Verify formatDate composes the calendar date with zero padding.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateFormatCalendar0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateFormatCalendar0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: formatDate(new Date(2000, 0, 1)) returns 2000-01-01.
      logCase(TAG, "formatDate 2000-01-01");
      expect(DateUtils.formatDate(new Date(2000, 0, 1, 0, 0, 0))).assertEqual("2000-01-01");
      // Vector 2: formatDate(new Date(2001, 1, 3)) returns 2001-02-03.
      logCase(TAG, "formatDate 2001-02-03");
      expect(DateUtils.formatDate(new Date(2001, 1, 3, 4, 5, 6))).assertEqual("2001-02-03");
      // Vector 3: formatDate(new Date(2004, 1, 29)) returns 2004-02-29.
      logCase(TAG, "formatDate 2004-02-29");
      expect(DateUtils.formatDate(new Date(2004, 1, 29, 12, 30, 45))).assertEqual("2004-02-29");
      // Vector 4: formatDate(new Date(2010, 11, 31)) returns 2010-12-31.
      logCase(TAG, "formatDate 2010-12-31");
      expect(DateUtils.formatDate(new Date(2010, 11, 31, 23, 59, 59))).assertEqual("2010-12-31");
      // Vector 5: formatDate(new Date(2020, 5, 15)) returns 2020-06-15.
      logCase(TAG, "formatDate 2020-06-15");
      expect(DateUtils.formatDate(new Date(2020, 5, 15, 8, 9, 10))).assertEqual("2020-06-15");
      // Vector 6: formatDate(new Date(2024, 0, 2)) returns 2024-01-02.
      logCase(TAG, "formatDate 2024-01-02");
      expect(DateUtils.formatDate(new Date(2024, 0, 2, 3, 4, 5))).assertEqual("2024-01-02");
      // Vector 7: formatDate(new Date(2024, 1, 29)) returns 2024-02-29.
      logCase(TAG, "formatDate 2024-02-29");
      expect(DateUtils.formatDate(new Date(2024, 1, 29, 18, 0, 0))).assertEqual("2024-02-29");
      // Vector 8: formatDate(new Date(2025, 11, 25)) returns 2025-12-25.
      logCase(TAG, "formatDate 2025-12-25");
      expect(DateUtils.formatDate(new Date(2025, 11, 25, 6, 7, 8))).assertEqual("2025-12-25");
      // Vector 9: formatDate(new Date(2030, 6, 4)) returns 2030-07-04.
      logCase(TAG, "formatDate 2030-07-04");
      expect(DateUtils.formatDate(new Date(2030, 6, 4, 14, 15, 16))).assertEqual("2030-07-04");
      // Vector 10: formatDate(new Date(1999, 11, 31)) returns 1999-12-31.
      logCase(TAG, "formatDate 1999-12-31");
      expect(DateUtils.formatDate(new Date(1999, 11, 31, 23, 59, 58))).assertEqual("1999-12-31");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DATEFMT_0200
     * @tc.name      testDateFormatClock0001
     * @tc.desc      Verify formatTime composes the wall clock with zero padding.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateFormatClock0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateFormatClock0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: formatTime(new Date(..., 0, 0, 0)) returns 00:00:00.
      logCase(TAG, "formatTime 00:00:00");
      expect(DateUtils.formatTime(new Date(2000, 0, 1, 0, 0, 0))).assertEqual("00:00:00");
      // Vector 2: formatTime(new Date(..., 4, 5, 6)) returns 04:05:06.
      logCase(TAG, "formatTime 04:05:06");
      expect(DateUtils.formatTime(new Date(2001, 1, 3, 4, 5, 6))).assertEqual("04:05:06");
      // Vector 3: formatTime(new Date(..., 12, 30, 45)) returns 12:30:45.
      logCase(TAG, "formatTime 12:30:45");
      expect(DateUtils.formatTime(new Date(2004, 1, 29, 12, 30, 45))).assertEqual("12:30:45");
      // Vector 4: formatTime(new Date(..., 23, 59, 59)) returns 23:59:59.
      logCase(TAG, "formatTime 23:59:59");
      expect(DateUtils.formatTime(new Date(2010, 11, 31, 23, 59, 59))).assertEqual("23:59:59");
      // Vector 5: formatTime(new Date(..., 8, 9, 10)) returns 08:09:10.
      logCase(TAG, "formatTime 08:09:10");
      expect(DateUtils.formatTime(new Date(2020, 5, 15, 8, 9, 10))).assertEqual("08:09:10");
      // Vector 6: formatTime(new Date(..., 3, 4, 5)) returns 03:04:05.
      logCase(TAG, "formatTime 03:04:05");
      expect(DateUtils.formatTime(new Date(2024, 0, 2, 3, 4, 5))).assertEqual("03:04:05");
      // Vector 7: formatTime(new Date(..., 18, 0, 0)) returns 18:00:00.
      logCase(TAG, "formatTime 18:00:00");
      expect(DateUtils.formatTime(new Date(2024, 1, 29, 18, 0, 0))).assertEqual("18:00:00");
      // Vector 8: formatTime(new Date(..., 6, 7, 8)) returns 06:07:08.
      logCase(TAG, "formatTime 06:07:08");
      expect(DateUtils.formatTime(new Date(2025, 11, 25, 6, 7, 8))).assertEqual("06:07:08");
      // Vector 9: formatTime(new Date(..., 14, 15, 16)) returns 14:15:16.
      logCase(TAG, "formatTime 14:15:16");
      expect(DateUtils.formatTime(new Date(2030, 6, 4, 14, 15, 16))).assertEqual("14:15:16");
      // Vector 10: formatTime(new Date(..., 23, 59, 58)) returns 23:59:58.
      logCase(TAG, "formatTime 23:59:58");
      expect(DateUtils.formatTime(new Date(1999, 11, 31, 23, 59, 58))).assertEqual("23:59:58");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DATEFMT_0300
     * @tc.name      testDateFormatCombined0001
     * @tc.desc      Verify formatDateTime joins the calendar date and wall clock.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateFormatCombined0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateFormatCombined0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: formatDateTime(...) returns 2000-01-01 00:00:00.
      logCase(TAG, "formatDateTime 2000-01-01 00:00:00");
      expect(DateUtils.formatDateTime(new Date(2000, 0, 1, 0, 0, 0))).assertEqual("2000-01-01 00:00:00");
      // Vector 2: formatDateTime(...) returns 2001-02-03 04:05:06.
      logCase(TAG, "formatDateTime 2001-02-03 04:05:06");
      expect(DateUtils.formatDateTime(new Date(2001, 1, 3, 4, 5, 6))).assertEqual("2001-02-03 04:05:06");
      // Vector 3: formatDateTime(...) returns 2004-02-29 12:30:45.
      logCase(TAG, "formatDateTime 2004-02-29 12:30:45");
      expect(DateUtils.formatDateTime(new Date(2004, 1, 29, 12, 30, 45))).assertEqual("2004-02-29 12:30:45");
      // Vector 4: formatDateTime(...) returns 2010-12-31 23:59:59.
      logCase(TAG, "formatDateTime 2010-12-31 23:59:59");
      expect(DateUtils.formatDateTime(new Date(2010, 11, 31, 23, 59, 59))).assertEqual("2010-12-31 23:59:59");
      // Vector 5: formatDateTime(...) returns 2020-06-15 08:09:10.
      logCase(TAG, "formatDateTime 2020-06-15 08:09:10");
      expect(DateUtils.formatDateTime(new Date(2020, 5, 15, 8, 9, 10))).assertEqual("2020-06-15 08:09:10");
      // Vector 6: formatDateTime(...) returns 2024-01-02 03:04:05.
      logCase(TAG, "formatDateTime 2024-01-02 03:04:05");
      expect(DateUtils.formatDateTime(new Date(2024, 0, 2, 3, 4, 5))).assertEqual("2024-01-02 03:04:05");
      // Vector 7: formatDateTime(...) returns 2024-02-29 18:00:00.
      logCase(TAG, "formatDateTime 2024-02-29 18:00:00");
      expect(DateUtils.formatDateTime(new Date(2024, 1, 29, 18, 0, 0))).assertEqual("2024-02-29 18:00:00");
      // Vector 8: formatDateTime(...) returns 2025-12-25 06:07:08.
      logCase(TAG, "formatDateTime 2025-12-25 06:07:08");
      expect(DateUtils.formatDateTime(new Date(2025, 11, 25, 6, 7, 8))).assertEqual("2025-12-25 06:07:08");
      // Vector 9: formatDateTime(...) returns 2030-07-04 14:15:16.
      logCase(TAG, "formatDateTime 2030-07-04 14:15:16");
      expect(DateUtils.formatDateTime(new Date(2030, 6, 4, 14, 15, 16))).assertEqual("2030-07-04 14:15:16");
      // Vector 10: formatDateTime(...) returns 1999-12-31 23:59:58.
      logCase(TAG, "formatDateTime 1999-12-31 23:59:58");
      expect(DateUtils.formatDateTime(new Date(1999, 11, 31, 23, 59, 58))).assertEqual("1999-12-31 23:59:58");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DATEFMT_0400
     * @tc.name      testDateEpochRoundTrip0001
     * @tc.desc      Verify epoch millisecond conversion preserves the calendar date.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateEpochRoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateEpochRoundTrip0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: fromEpochMs round trip keeps 2000-01-01.
      logCase(TAG, "fromEpochMs 2000-01-01");
      expect(DateUtils.formatDate(new Date(new Date(2000, 0, 1, 0, 0, 0).getTime()))).assertEqual("2000-01-01");
      // Vector 2: fromEpochMs round trip keeps 2001-02-03.
      logCase(TAG, "fromEpochMs 2001-02-03");
      expect(DateUtils.formatDate(new Date(new Date(2001, 1, 3, 4, 5, 6).getTime()))).assertEqual("2001-02-03");
      // Vector 3: fromEpochMs round trip keeps 2004-02-29.
      logCase(TAG, "fromEpochMs 2004-02-29");
      expect(DateUtils.formatDate(new Date(new Date(2004, 1, 29, 12, 30, 45).getTime()))).assertEqual("2004-02-29");
      // Vector 4: fromEpochMs round trip keeps 2010-12-31.
      logCase(TAG, "fromEpochMs 2010-12-31");
      expect(DateUtils.formatDate(new Date(new Date(2010, 11, 31, 23, 59, 59).getTime()))).assertEqual("2010-12-31");
      // Vector 5: fromEpochMs round trip keeps 2020-06-15.
      logCase(TAG, "fromEpochMs 2020-06-15");
      expect(DateUtils.formatDate(new Date(new Date(2020, 5, 15, 8, 9, 10).getTime()))).assertEqual("2020-06-15");
      // Vector 6: fromEpochMs round trip keeps 2024-01-02.
      logCase(TAG, "fromEpochMs 2024-01-02");
      expect(DateUtils.formatDate(new Date(new Date(2024, 0, 2, 3, 4, 5).getTime()))).assertEqual("2024-01-02");
      // Vector 7: fromEpochMs round trip keeps 2024-02-29.
      logCase(TAG, "fromEpochMs 2024-02-29");
      expect(DateUtils.formatDate(new Date(new Date(2024, 1, 29, 18, 0, 0).getTime()))).assertEqual("2024-02-29");
      // Vector 8: fromEpochMs round trip keeps 2025-12-25.
      logCase(TAG, "fromEpochMs 2025-12-25");
      expect(DateUtils.formatDate(new Date(new Date(2025, 11, 25, 6, 7, 8).getTime()))).assertEqual("2025-12-25");
      // Vector 9: fromEpochMs round trip keeps 2030-07-04.
      logCase(TAG, "fromEpochMs 2030-07-04");
      expect(DateUtils.formatDate(new Date(new Date(2030, 6, 4, 14, 15, 16).getTime()))).assertEqual("2030-07-04");
      // Vector 10: fromEpochMs round trip keeps 1999-12-31.
      logCase(TAG, "fromEpochMs 1999-12-31");
      expect(DateUtils.formatDate(new Date(new Date(1999, 11, 31, 23, 59, 58).getTime()))).assertEqual("1999-12-31");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
