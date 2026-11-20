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

// Registers every matrix case of the DateFormatSweepSuite suite.
export default function dateFormatSweepTest() {
  // Group the cases under the "DateFormatSweepSuite" describe block.
  describe('DateFormatSweepSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'DateFormatSweepSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_DATEFMT_0100
     * @tc.name      testDateFormatSweepDate0001
     * @tc.desc      Verify formatDate prints the calendar date across months and leap days.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateFormatSweepDate0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateFormatSweepDate0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: formatDate(2000-01-01) prints the calendar date.
      logCase(TAG, "formatDate(2000-01-01)");
      expect(DateUtils.formatDate(new Date(2000, 0, 1, 0, 0, 0))).assertEqual("2000-01-01");
      // Vector 2: formatDate(2000-02-02) prints the calendar date.
      logCase(TAG, "formatDate(2000-02-02)");
      expect(DateUtils.formatDate(new Date(2000, 1, 2, 1, 7, 13))).assertEqual("2000-02-02");
      // Vector 3: formatDate(2000-03-03) prints the calendar date.
      logCase(TAG, "formatDate(2000-03-03)");
      expect(DateUtils.formatDate(new Date(2000, 2, 3, 2, 14, 26))).assertEqual("2000-03-03");
      // Vector 4: formatDate(2000-04-04) prints the calendar date.
      logCase(TAG, "formatDate(2000-04-04)");
      expect(DateUtils.formatDate(new Date(2000, 3, 4, 3, 21, 39))).assertEqual("2000-04-04");
      // Vector 5: formatDate(2000-05-05) prints the calendar date.
      logCase(TAG, "formatDate(2000-05-05)");
      expect(DateUtils.formatDate(new Date(2000, 4, 5, 4, 28, 52))).assertEqual("2000-05-05");
      // Vector 6: formatDate(2000-06-06) prints the calendar date.
      logCase(TAG, "formatDate(2000-06-06)");
      expect(DateUtils.formatDate(new Date(2000, 5, 6, 5, 35, 5))).assertEqual("2000-06-06");
      // Vector 7: formatDate(2000-07-07) prints the calendar date.
      logCase(TAG, "formatDate(2000-07-07)");
      expect(DateUtils.formatDate(new Date(2000, 6, 7, 6, 42, 18))).assertEqual("2000-07-07");
      // Vector 8: formatDate(2000-08-08) prints the calendar date.
      logCase(TAG, "formatDate(2000-08-08)");
      expect(DateUtils.formatDate(new Date(2000, 7, 8, 7, 49, 31))).assertEqual("2000-08-08");
      // Vector 9: formatDate(2000-09-09) prints the calendar date.
      logCase(TAG, "formatDate(2000-09-09)");
      expect(DateUtils.formatDate(new Date(2000, 8, 9, 8, 56, 44))).assertEqual("2000-09-09");
      // Vector 10: formatDate(2000-10-10) prints the calendar date.
      logCase(TAG, "formatDate(2000-10-10)");
      expect(DateUtils.formatDate(new Date(2000, 9, 10, 9, 3, 57))).assertEqual("2000-10-10");
      // Vector 11: formatDate(2000-11-11) prints the calendar date.
      logCase(TAG, "formatDate(2000-11-11)");
      expect(DateUtils.formatDate(new Date(2000, 10, 11, 10, 10, 10))).assertEqual("2000-11-11");
      // Vector 12: formatDate(2000-12-12) prints the calendar date.
      logCase(TAG, "formatDate(2000-12-12)");
      expect(DateUtils.formatDate(new Date(2000, 11, 12, 11, 17, 23))).assertEqual("2000-12-12");
      // Vector 13: formatDate(2001-01-13) prints the calendar date.
      logCase(TAG, "formatDate(2001-01-13)");
      expect(DateUtils.formatDate(new Date(2001, 0, 13, 12, 24, 36))).assertEqual("2001-01-13");
      // Vector 14: formatDate(2001-02-14) prints the calendar date.
      logCase(TAG, "formatDate(2001-02-14)");
      expect(DateUtils.formatDate(new Date(2001, 1, 14, 13, 31, 49))).assertEqual("2001-02-14");
      // Vector 15: formatDate(2001-03-15) prints the calendar date.
      logCase(TAG, "formatDate(2001-03-15)");
      expect(DateUtils.formatDate(new Date(2001, 2, 15, 14, 38, 2))).assertEqual("2001-03-15");
      // Vector 16: formatDate(2001-04-16) prints the calendar date.
      logCase(TAG, "formatDate(2001-04-16)");
      expect(DateUtils.formatDate(new Date(2001, 3, 16, 15, 45, 15))).assertEqual("2001-04-16");
      // Vector 17: formatDate(2001-05-17) prints the calendar date.
      logCase(TAG, "formatDate(2001-05-17)");
      expect(DateUtils.formatDate(new Date(2001, 4, 17, 16, 52, 28))).assertEqual("2001-05-17");
      // Vector 18: formatDate(2001-06-18) prints the calendar date.
      logCase(TAG, "formatDate(2001-06-18)");
      expect(DateUtils.formatDate(new Date(2001, 5, 18, 17, 59, 41))).assertEqual("2001-06-18");
      // Vector 19: formatDate(2001-07-19) prints the calendar date.
      logCase(TAG, "formatDate(2001-07-19)");
      expect(DateUtils.formatDate(new Date(2001, 6, 19, 18, 6, 54))).assertEqual("2001-07-19");
      // Vector 20: formatDate(2001-08-20) prints the calendar date.
      logCase(TAG, "formatDate(2001-08-20)");
      expect(DateUtils.formatDate(new Date(2001, 7, 20, 19, 13, 7))).assertEqual("2001-08-20");
      // Vector 21: formatDate(2001-09-21) prints the calendar date.
      logCase(TAG, "formatDate(2001-09-21)");
      expect(DateUtils.formatDate(new Date(2001, 8, 21, 20, 20, 20))).assertEqual("2001-09-21");
      // Vector 22: formatDate(2001-10-22) prints the calendar date.
      logCase(TAG, "formatDate(2001-10-22)");
      expect(DateUtils.formatDate(new Date(2001, 9, 22, 21, 27, 33))).assertEqual("2001-10-22");
      // Vector 23: formatDate(2001-11-23) prints the calendar date.
      logCase(TAG, "formatDate(2001-11-23)");
      expect(DateUtils.formatDate(new Date(2001, 10, 23, 22, 34, 46))).assertEqual("2001-11-23");
      // Vector 24: formatDate(2001-12-24) prints the calendar date.
      logCase(TAG, "formatDate(2001-12-24)");
      expect(DateUtils.formatDate(new Date(2001, 11, 24, 23, 41, 59))).assertEqual("2001-12-24");
      // Vector 25: formatDate(2002-01-25) prints the calendar date.
      logCase(TAG, "formatDate(2002-01-25)");
      expect(DateUtils.formatDate(new Date(2002, 0, 25, 0, 48, 12))).assertEqual("2002-01-25");
      // Vector 26: formatDate(2002-02-26) prints the calendar date.
      logCase(TAG, "formatDate(2002-02-26)");
      expect(DateUtils.formatDate(new Date(2002, 1, 26, 1, 55, 25))).assertEqual("2002-02-26");
      // Vector 27: formatDate(2002-03-27) prints the calendar date.
      logCase(TAG, "formatDate(2002-03-27)");
      expect(DateUtils.formatDate(new Date(2002, 2, 27, 2, 2, 38))).assertEqual("2002-03-27");
      // Vector 28: formatDate(2002-04-28) prints the calendar date.
      logCase(TAG, "formatDate(2002-04-28)");
      expect(DateUtils.formatDate(new Date(2002, 3, 28, 3, 9, 51))).assertEqual("2002-04-28");
      // Vector 29: formatDate(2002-05-01) prints the calendar date.
      logCase(TAG, "formatDate(2002-05-01)");
      expect(DateUtils.formatDate(new Date(2002, 4, 1, 4, 16, 4))).assertEqual("2002-05-01");
      // Vector 30: formatDate(2002-06-02) prints the calendar date.
      logCase(TAG, "formatDate(2002-06-02)");
      expect(DateUtils.formatDate(new Date(2002, 5, 2, 5, 23, 17))).assertEqual("2002-06-02");
      // Vector 31: formatDate(2002-07-03) prints the calendar date.
      logCase(TAG, "formatDate(2002-07-03)");
      expect(DateUtils.formatDate(new Date(2002, 6, 3, 6, 30, 30))).assertEqual("2002-07-03");
      // Vector 32: formatDate(2002-08-04) prints the calendar date.
      logCase(TAG, "formatDate(2002-08-04)");
      expect(DateUtils.formatDate(new Date(2002, 7, 4, 7, 37, 43))).assertEqual("2002-08-04");
      // Vector 33: formatDate(2002-09-05) prints the calendar date.
      logCase(TAG, "formatDate(2002-09-05)");
      expect(DateUtils.formatDate(new Date(2002, 8, 5, 8, 44, 56))).assertEqual("2002-09-05");
      // Vector 34: formatDate(2002-10-06) prints the calendar date.
      logCase(TAG, "formatDate(2002-10-06)");
      expect(DateUtils.formatDate(new Date(2002, 9, 6, 9, 51, 9))).assertEqual("2002-10-06");
      // Vector 35: formatDate(2002-11-07) prints the calendar date.
      logCase(TAG, "formatDate(2002-11-07)");
      expect(DateUtils.formatDate(new Date(2002, 10, 7, 10, 58, 22))).assertEqual("2002-11-07");
      // Vector 36: formatDate(2002-12-08) prints the calendar date.
      logCase(TAG, "formatDate(2002-12-08)");
      expect(DateUtils.formatDate(new Date(2002, 11, 8, 11, 5, 35))).assertEqual("2002-12-08");
      // Vector 37: formatDate(2003-01-09) prints the calendar date.
      logCase(TAG, "formatDate(2003-01-09)");
      expect(DateUtils.formatDate(new Date(2003, 0, 9, 12, 12, 48))).assertEqual("2003-01-09");
      // Vector 38: formatDate(2003-02-10) prints the calendar date.
      logCase(TAG, "formatDate(2003-02-10)");
      expect(DateUtils.formatDate(new Date(2003, 1, 10, 13, 19, 1))).assertEqual("2003-02-10");
      // Vector 39: formatDate(2003-03-11) prints the calendar date.
      logCase(TAG, "formatDate(2003-03-11)");
      expect(DateUtils.formatDate(new Date(2003, 2, 11, 14, 26, 14))).assertEqual("2003-03-11");
      // Vector 40: formatDate(2003-04-12) prints the calendar date.
      logCase(TAG, "formatDate(2003-04-12)");
      expect(DateUtils.formatDate(new Date(2003, 3, 12, 15, 33, 27))).assertEqual("2003-04-12");
      // Vector 41: formatDate(2003-05-13) prints the calendar date.
      logCase(TAG, "formatDate(2003-05-13)");
      expect(DateUtils.formatDate(new Date(2003, 4, 13, 16, 40, 40))).assertEqual("2003-05-13");
      // Vector 42: formatDate(2003-06-14) prints the calendar date.
      logCase(TAG, "formatDate(2003-06-14)");
      expect(DateUtils.formatDate(new Date(2003, 5, 14, 17, 47, 53))).assertEqual("2003-06-14");
      // Vector 43: formatDate(2003-07-15) prints the calendar date.
      logCase(TAG, "formatDate(2003-07-15)");
      expect(DateUtils.formatDate(new Date(2003, 6, 15, 18, 54, 6))).assertEqual("2003-07-15");
      // Vector 44: formatDate(2003-08-16) prints the calendar date.
      logCase(TAG, "formatDate(2003-08-16)");
      expect(DateUtils.formatDate(new Date(2003, 7, 16, 19, 1, 19))).assertEqual("2003-08-16");
      // Vector 45: formatDate(2003-09-17) prints the calendar date.
      logCase(TAG, "formatDate(2003-09-17)");
      expect(DateUtils.formatDate(new Date(2003, 8, 17, 20, 8, 32))).assertEqual("2003-09-17");
      // Vector 46: formatDate(2003-10-18) prints the calendar date.
      logCase(TAG, "formatDate(2003-10-18)");
      expect(DateUtils.formatDate(new Date(2003, 9, 18, 21, 15, 45))).assertEqual("2003-10-18");
      // Vector 47: formatDate(2003-11-19) prints the calendar date.
      logCase(TAG, "formatDate(2003-11-19)");
      expect(DateUtils.formatDate(new Date(2003, 10, 19, 22, 22, 58))).assertEqual("2003-11-19");
      // Vector 48: formatDate(2003-12-20) prints the calendar date.
      logCase(TAG, "formatDate(2003-12-20)");
      expect(DateUtils.formatDate(new Date(2003, 11, 20, 23, 29, 11))).assertEqual("2003-12-20");
      // Vector 49: formatDate(2004-01-21) prints the calendar date.
      logCase(TAG, "formatDate(2004-01-21)");
      expect(DateUtils.formatDate(new Date(2004, 0, 21, 0, 36, 24))).assertEqual("2004-01-21");
      // Vector 50: formatDate(2004-02-22) prints the calendar date.
      logCase(TAG, "formatDate(2004-02-22)");
      expect(DateUtils.formatDate(new Date(2004, 1, 22, 1, 43, 37))).assertEqual("2004-02-22");
      // Vector 51: formatDate(2004-03-23) prints the calendar date.
      logCase(TAG, "formatDate(2004-03-23)");
      expect(DateUtils.formatDate(new Date(2004, 2, 23, 2, 50, 50))).assertEqual("2004-03-23");
      // Vector 52: formatDate(2004-04-24) prints the calendar date.
      logCase(TAG, "formatDate(2004-04-24)");
      expect(DateUtils.formatDate(new Date(2004, 3, 24, 3, 57, 3))).assertEqual("2004-04-24");
      // Vector 53: formatDate(2004-05-25) prints the calendar date.
      logCase(TAG, "formatDate(2004-05-25)");
      expect(DateUtils.formatDate(new Date(2004, 4, 25, 4, 4, 16))).assertEqual("2004-05-25");
      // Vector 54: formatDate(2004-06-26) prints the calendar date.
      logCase(TAG, "formatDate(2004-06-26)");
      expect(DateUtils.formatDate(new Date(2004, 5, 26, 5, 11, 29))).assertEqual("2004-06-26");
      // Vector 55: formatDate(2004-07-27) prints the calendar date.
      logCase(TAG, "formatDate(2004-07-27)");
      expect(DateUtils.formatDate(new Date(2004, 6, 27, 6, 18, 42))).assertEqual("2004-07-27");
      // Vector 56: formatDate(2004-08-28) prints the calendar date.
      logCase(TAG, "formatDate(2004-08-28)");
      expect(DateUtils.formatDate(new Date(2004, 7, 28, 7, 25, 55))).assertEqual("2004-08-28");
      // Vector 57: formatDate(2004-09-01) prints the calendar date.
      logCase(TAG, "formatDate(2004-09-01)");
      expect(DateUtils.formatDate(new Date(2004, 8, 1, 8, 32, 8))).assertEqual("2004-09-01");
      // Vector 58: formatDate(2004-10-02) prints the calendar date.
      logCase(TAG, "formatDate(2004-10-02)");
      expect(DateUtils.formatDate(new Date(2004, 9, 2, 9, 39, 21))).assertEqual("2004-10-02");
      // Vector 59: formatDate(2004-11-03) prints the calendar date.
      logCase(TAG, "formatDate(2004-11-03)");
      expect(DateUtils.formatDate(new Date(2004, 10, 3, 10, 46, 34))).assertEqual("2004-11-03");
      // Vector 60: formatDate(2004-12-04) prints the calendar date.
      logCase(TAG, "formatDate(2004-12-04)");
      expect(DateUtils.formatDate(new Date(2004, 11, 4, 11, 53, 47))).assertEqual("2004-12-04");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_DATEFMT_0200
     * @tc.name      testDateFormatSweepTime0001
     * @tc.desc      Verify formatTime prints zero-padded wall clock values around the full day.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateFormatSweepTime0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateFormatSweepTime0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: formatTime(00:00:00) prints the wall clock time.
      logCase(TAG, "formatTime(00:00:00)");
      expect(DateUtils.formatTime(new Date(2000, 0, 1, 0, 0, 0))).assertEqual("00:00:00");
      // Vector 2: formatTime(01:07:13) prints the wall clock time.
      logCase(TAG, "formatTime(01:07:13)");
      expect(DateUtils.formatTime(new Date(2000, 1, 2, 1, 7, 13))).assertEqual("01:07:13");
      // Vector 3: formatTime(02:14:26) prints the wall clock time.
      logCase(TAG, "formatTime(02:14:26)");
      expect(DateUtils.formatTime(new Date(2000, 2, 3, 2, 14, 26))).assertEqual("02:14:26");
      // Vector 4: formatTime(03:21:39) prints the wall clock time.
      logCase(TAG, "formatTime(03:21:39)");
      expect(DateUtils.formatTime(new Date(2000, 3, 4, 3, 21, 39))).assertEqual("03:21:39");
      // Vector 5: formatTime(04:28:52) prints the wall clock time.
      logCase(TAG, "formatTime(04:28:52)");
      expect(DateUtils.formatTime(new Date(2000, 4, 5, 4, 28, 52))).assertEqual("04:28:52");
      // Vector 6: formatTime(05:35:05) prints the wall clock time.
      logCase(TAG, "formatTime(05:35:05)");
      expect(DateUtils.formatTime(new Date(2000, 5, 6, 5, 35, 5))).assertEqual("05:35:05");
      // Vector 7: formatTime(06:42:18) prints the wall clock time.
      logCase(TAG, "formatTime(06:42:18)");
      expect(DateUtils.formatTime(new Date(2000, 6, 7, 6, 42, 18))).assertEqual("06:42:18");
      // Vector 8: formatTime(07:49:31) prints the wall clock time.
      logCase(TAG, "formatTime(07:49:31)");
      expect(DateUtils.formatTime(new Date(2000, 7, 8, 7, 49, 31))).assertEqual("07:49:31");
      // Vector 9: formatTime(08:56:44) prints the wall clock time.
      logCase(TAG, "formatTime(08:56:44)");
      expect(DateUtils.formatTime(new Date(2000, 8, 9, 8, 56, 44))).assertEqual("08:56:44");
      // Vector 10: formatTime(09:03:57) prints the wall clock time.
      logCase(TAG, "formatTime(09:03:57)");
      expect(DateUtils.formatTime(new Date(2000, 9, 10, 9, 3, 57))).assertEqual("09:03:57");
      // Vector 11: formatTime(10:10:10) prints the wall clock time.
      logCase(TAG, "formatTime(10:10:10)");
      expect(DateUtils.formatTime(new Date(2000, 10, 11, 10, 10, 10))).assertEqual("10:10:10");
      // Vector 12: formatTime(11:17:23) prints the wall clock time.
      logCase(TAG, "formatTime(11:17:23)");
      expect(DateUtils.formatTime(new Date(2000, 11, 12, 11, 17, 23))).assertEqual("11:17:23");
      // Vector 13: formatTime(12:24:36) prints the wall clock time.
      logCase(TAG, "formatTime(12:24:36)");
      expect(DateUtils.formatTime(new Date(2001, 0, 13, 12, 24, 36))).assertEqual("12:24:36");
      // Vector 14: formatTime(13:31:49) prints the wall clock time.
      logCase(TAG, "formatTime(13:31:49)");
      expect(DateUtils.formatTime(new Date(2001, 1, 14, 13, 31, 49))).assertEqual("13:31:49");
      // Vector 15: formatTime(14:38:02) prints the wall clock time.
      logCase(TAG, "formatTime(14:38:02)");
      expect(DateUtils.formatTime(new Date(2001, 2, 15, 14, 38, 2))).assertEqual("14:38:02");
      // Vector 16: formatTime(15:45:15) prints the wall clock time.
      logCase(TAG, "formatTime(15:45:15)");
      expect(DateUtils.formatTime(new Date(2001, 3, 16, 15, 45, 15))).assertEqual("15:45:15");
      // Vector 17: formatTime(16:52:28) prints the wall clock time.
      logCase(TAG, "formatTime(16:52:28)");
      expect(DateUtils.formatTime(new Date(2001, 4, 17, 16, 52, 28))).assertEqual("16:52:28");
      // Vector 18: formatTime(17:59:41) prints the wall clock time.
      logCase(TAG, "formatTime(17:59:41)");
      expect(DateUtils.formatTime(new Date(2001, 5, 18, 17, 59, 41))).assertEqual("17:59:41");
      // Vector 19: formatTime(18:06:54) prints the wall clock time.
      logCase(TAG, "formatTime(18:06:54)");
      expect(DateUtils.formatTime(new Date(2001, 6, 19, 18, 6, 54))).assertEqual("18:06:54");
      // Vector 20: formatTime(19:13:07) prints the wall clock time.
      logCase(TAG, "formatTime(19:13:07)");
      expect(DateUtils.formatTime(new Date(2001, 7, 20, 19, 13, 7))).assertEqual("19:13:07");
      // Vector 21: formatTime(20:20:20) prints the wall clock time.
      logCase(TAG, "formatTime(20:20:20)");
      expect(DateUtils.formatTime(new Date(2001, 8, 21, 20, 20, 20))).assertEqual("20:20:20");
      // Vector 22: formatTime(21:27:33) prints the wall clock time.
      logCase(TAG, "formatTime(21:27:33)");
      expect(DateUtils.formatTime(new Date(2001, 9, 22, 21, 27, 33))).assertEqual("21:27:33");
      // Vector 23: formatTime(22:34:46) prints the wall clock time.
      logCase(TAG, "formatTime(22:34:46)");
      expect(DateUtils.formatTime(new Date(2001, 10, 23, 22, 34, 46))).assertEqual("22:34:46");
      // Vector 24: formatTime(23:41:59) prints the wall clock time.
      logCase(TAG, "formatTime(23:41:59)");
      expect(DateUtils.formatTime(new Date(2001, 11, 24, 23, 41, 59))).assertEqual("23:41:59");
      // Vector 25: formatTime(00:48:12) prints the wall clock time.
      logCase(TAG, "formatTime(00:48:12)");
      expect(DateUtils.formatTime(new Date(2002, 0, 25, 0, 48, 12))).assertEqual("00:48:12");
      // Vector 26: formatTime(01:55:25) prints the wall clock time.
      logCase(TAG, "formatTime(01:55:25)");
      expect(DateUtils.formatTime(new Date(2002, 1, 26, 1, 55, 25))).assertEqual("01:55:25");
      // Vector 27: formatTime(02:02:38) prints the wall clock time.
      logCase(TAG, "formatTime(02:02:38)");
      expect(DateUtils.formatTime(new Date(2002, 2, 27, 2, 2, 38))).assertEqual("02:02:38");
      // Vector 28: formatTime(03:09:51) prints the wall clock time.
      logCase(TAG, "formatTime(03:09:51)");
      expect(DateUtils.formatTime(new Date(2002, 3, 28, 3, 9, 51))).assertEqual("03:09:51");
      // Vector 29: formatTime(04:16:04) prints the wall clock time.
      logCase(TAG, "formatTime(04:16:04)");
      expect(DateUtils.formatTime(new Date(2002, 4, 1, 4, 16, 4))).assertEqual("04:16:04");
      // Vector 30: formatTime(05:23:17) prints the wall clock time.
      logCase(TAG, "formatTime(05:23:17)");
      expect(DateUtils.formatTime(new Date(2002, 5, 2, 5, 23, 17))).assertEqual("05:23:17");
      // Vector 31: formatTime(06:30:30) prints the wall clock time.
      logCase(TAG, "formatTime(06:30:30)");
      expect(DateUtils.formatTime(new Date(2002, 6, 3, 6, 30, 30))).assertEqual("06:30:30");
      // Vector 32: formatTime(07:37:43) prints the wall clock time.
      logCase(TAG, "formatTime(07:37:43)");
      expect(DateUtils.formatTime(new Date(2002, 7, 4, 7, 37, 43))).assertEqual("07:37:43");
      // Vector 33: formatTime(08:44:56) prints the wall clock time.
      logCase(TAG, "formatTime(08:44:56)");
      expect(DateUtils.formatTime(new Date(2002, 8, 5, 8, 44, 56))).assertEqual("08:44:56");
      // Vector 34: formatTime(09:51:09) prints the wall clock time.
      logCase(TAG, "formatTime(09:51:09)");
      expect(DateUtils.formatTime(new Date(2002, 9, 6, 9, 51, 9))).assertEqual("09:51:09");
      // Vector 35: formatTime(10:58:22) prints the wall clock time.
      logCase(TAG, "formatTime(10:58:22)");
      expect(DateUtils.formatTime(new Date(2002, 10, 7, 10, 58, 22))).assertEqual("10:58:22");
      // Vector 36: formatTime(11:05:35) prints the wall clock time.
      logCase(TAG, "formatTime(11:05:35)");
      expect(DateUtils.formatTime(new Date(2002, 11, 8, 11, 5, 35))).assertEqual("11:05:35");
      // Vector 37: formatTime(12:12:48) prints the wall clock time.
      logCase(TAG, "formatTime(12:12:48)");
      expect(DateUtils.formatTime(new Date(2003, 0, 9, 12, 12, 48))).assertEqual("12:12:48");
      // Vector 38: formatTime(13:19:01) prints the wall clock time.
      logCase(TAG, "formatTime(13:19:01)");
      expect(DateUtils.formatTime(new Date(2003, 1, 10, 13, 19, 1))).assertEqual("13:19:01");
      // Vector 39: formatTime(14:26:14) prints the wall clock time.
      logCase(TAG, "formatTime(14:26:14)");
      expect(DateUtils.formatTime(new Date(2003, 2, 11, 14, 26, 14))).assertEqual("14:26:14");
      // Vector 40: formatTime(15:33:27) prints the wall clock time.
      logCase(TAG, "formatTime(15:33:27)");
      expect(DateUtils.formatTime(new Date(2003, 3, 12, 15, 33, 27))).assertEqual("15:33:27");
      // Vector 41: formatTime(16:40:40) prints the wall clock time.
      logCase(TAG, "formatTime(16:40:40)");
      expect(DateUtils.formatTime(new Date(2003, 4, 13, 16, 40, 40))).assertEqual("16:40:40");
      // Vector 42: formatTime(17:47:53) prints the wall clock time.
      logCase(TAG, "formatTime(17:47:53)");
      expect(DateUtils.formatTime(new Date(2003, 5, 14, 17, 47, 53))).assertEqual("17:47:53");
      // Vector 43: formatTime(18:54:06) prints the wall clock time.
      logCase(TAG, "formatTime(18:54:06)");
      expect(DateUtils.formatTime(new Date(2003, 6, 15, 18, 54, 6))).assertEqual("18:54:06");
      // Vector 44: formatTime(19:01:19) prints the wall clock time.
      logCase(TAG, "formatTime(19:01:19)");
      expect(DateUtils.formatTime(new Date(2003, 7, 16, 19, 1, 19))).assertEqual("19:01:19");
      // Vector 45: formatTime(20:08:32) prints the wall clock time.
      logCase(TAG, "formatTime(20:08:32)");
      expect(DateUtils.formatTime(new Date(2003, 8, 17, 20, 8, 32))).assertEqual("20:08:32");
      // Vector 46: formatTime(21:15:45) prints the wall clock time.
      logCase(TAG, "formatTime(21:15:45)");
      expect(DateUtils.formatTime(new Date(2003, 9, 18, 21, 15, 45))).assertEqual("21:15:45");
      // Vector 47: formatTime(22:22:58) prints the wall clock time.
      logCase(TAG, "formatTime(22:22:58)");
      expect(DateUtils.formatTime(new Date(2003, 10, 19, 22, 22, 58))).assertEqual("22:22:58");
      // Vector 48: formatTime(23:29:11) prints the wall clock time.
      logCase(TAG, "formatTime(23:29:11)");
      expect(DateUtils.formatTime(new Date(2003, 11, 20, 23, 29, 11))).assertEqual("23:29:11");
      // Vector 49: formatTime(00:36:24) prints the wall clock time.
      logCase(TAG, "formatTime(00:36:24)");
      expect(DateUtils.formatTime(new Date(2004, 0, 21, 0, 36, 24))).assertEqual("00:36:24");
      // Vector 50: formatTime(01:43:37) prints the wall clock time.
      logCase(TAG, "formatTime(01:43:37)");
      expect(DateUtils.formatTime(new Date(2004, 1, 22, 1, 43, 37))).assertEqual("01:43:37");
      // Vector 51: formatTime(02:50:50) prints the wall clock time.
      logCase(TAG, "formatTime(02:50:50)");
      expect(DateUtils.formatTime(new Date(2004, 2, 23, 2, 50, 50))).assertEqual("02:50:50");
      // Vector 52: formatTime(03:57:03) prints the wall clock time.
      logCase(TAG, "formatTime(03:57:03)");
      expect(DateUtils.formatTime(new Date(2004, 3, 24, 3, 57, 3))).assertEqual("03:57:03");
      // Vector 53: formatTime(04:04:16) prints the wall clock time.
      logCase(TAG, "formatTime(04:04:16)");
      expect(DateUtils.formatTime(new Date(2004, 4, 25, 4, 4, 16))).assertEqual("04:04:16");
      // Vector 54: formatTime(05:11:29) prints the wall clock time.
      logCase(TAG, "formatTime(05:11:29)");
      expect(DateUtils.formatTime(new Date(2004, 5, 26, 5, 11, 29))).assertEqual("05:11:29");
      // Vector 55: formatTime(06:18:42) prints the wall clock time.
      logCase(TAG, "formatTime(06:18:42)");
      expect(DateUtils.formatTime(new Date(2004, 6, 27, 6, 18, 42))).assertEqual("06:18:42");
      // Vector 56: formatTime(07:25:55) prints the wall clock time.
      logCase(TAG, "formatTime(07:25:55)");
      expect(DateUtils.formatTime(new Date(2004, 7, 28, 7, 25, 55))).assertEqual("07:25:55");
      // Vector 57: formatTime(08:32:08) prints the wall clock time.
      logCase(TAG, "formatTime(08:32:08)");
      expect(DateUtils.formatTime(new Date(2004, 8, 1, 8, 32, 8))).assertEqual("08:32:08");
      // Vector 58: formatTime(09:39:21) prints the wall clock time.
      logCase(TAG, "formatTime(09:39:21)");
      expect(DateUtils.formatTime(new Date(2004, 9, 2, 9, 39, 21))).assertEqual("09:39:21");
      // Vector 59: formatTime(10:46:34) prints the wall clock time.
      logCase(TAG, "formatTime(10:46:34)");
      expect(DateUtils.formatTime(new Date(2004, 10, 3, 10, 46, 34))).assertEqual("10:46:34");
      // Vector 60: formatTime(11:53:47) prints the wall clock time.
      logCase(TAG, "formatTime(11:53:47)");
      expect(DateUtils.formatTime(new Date(2004, 11, 4, 11, 53, 47))).assertEqual("11:53:47");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_DATEFMT_0300
     * @tc.name      testDateFormatSweepDateTime0001
     * @tc.desc      Verify formatDateTime joins the date and time portions with one space.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateFormatSweepDateTime0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateFormatSweepDateTime0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: formatDateTime prints date and time for 2000-01-01 00:00:00.
      logCase(TAG, "formatDateTime(2000-01-01 00:00:00)");
      expect(DateUtils.formatDateTime(new Date(2000, 0, 1, 0, 0, 0))).assertEqual("2000-01-01 00:00:00");
      // Vector 2: formatDateTime prints date and time for 2000-02-02 01:07:13.
      logCase(TAG, "formatDateTime(2000-02-02 01:07:13)");
      expect(DateUtils.formatDateTime(new Date(2000, 1, 2, 1, 7, 13))).assertEqual("2000-02-02 01:07:13");
      // Vector 3: formatDateTime prints date and time for 2000-03-03 02:14:26.
      logCase(TAG, "formatDateTime(2000-03-03 02:14:26)");
      expect(DateUtils.formatDateTime(new Date(2000, 2, 3, 2, 14, 26))).assertEqual("2000-03-03 02:14:26");
      // Vector 4: formatDateTime prints date and time for 2000-04-04 03:21:39.
      logCase(TAG, "formatDateTime(2000-04-04 03:21:39)");
      expect(DateUtils.formatDateTime(new Date(2000, 3, 4, 3, 21, 39))).assertEqual("2000-04-04 03:21:39");
      // Vector 5: formatDateTime prints date and time for 2000-05-05 04:28:52.
      logCase(TAG, "formatDateTime(2000-05-05 04:28:52)");
      expect(DateUtils.formatDateTime(new Date(2000, 4, 5, 4, 28, 52))).assertEqual("2000-05-05 04:28:52");
      // Vector 6: formatDateTime prints date and time for 2000-06-06 05:35:05.
      logCase(TAG, "formatDateTime(2000-06-06 05:35:05)");
      expect(DateUtils.formatDateTime(new Date(2000, 5, 6, 5, 35, 5))).assertEqual("2000-06-06 05:35:05");
      // Vector 7: formatDateTime prints date and time for 2000-07-07 06:42:18.
      logCase(TAG, "formatDateTime(2000-07-07 06:42:18)");
      expect(DateUtils.formatDateTime(new Date(2000, 6, 7, 6, 42, 18))).assertEqual("2000-07-07 06:42:18");
      // Vector 8: formatDateTime prints date and time for 2000-08-08 07:49:31.
      logCase(TAG, "formatDateTime(2000-08-08 07:49:31)");
      expect(DateUtils.formatDateTime(new Date(2000, 7, 8, 7, 49, 31))).assertEqual("2000-08-08 07:49:31");
      // Vector 9: formatDateTime prints date and time for 2000-09-09 08:56:44.
      logCase(TAG, "formatDateTime(2000-09-09 08:56:44)");
      expect(DateUtils.formatDateTime(new Date(2000, 8, 9, 8, 56, 44))).assertEqual("2000-09-09 08:56:44");
      // Vector 10: formatDateTime prints date and time for 2000-10-10 09:03:57.
      logCase(TAG, "formatDateTime(2000-10-10 09:03:57)");
      expect(DateUtils.formatDateTime(new Date(2000, 9, 10, 9, 3, 57))).assertEqual("2000-10-10 09:03:57");
      // Vector 11: formatDateTime prints date and time for 2000-11-11 10:10:10.
      logCase(TAG, "formatDateTime(2000-11-11 10:10:10)");
      expect(DateUtils.formatDateTime(new Date(2000, 10, 11, 10, 10, 10))).assertEqual("2000-11-11 10:10:10");
      // Vector 12: formatDateTime prints date and time for 2000-12-12 11:17:23.
      logCase(TAG, "formatDateTime(2000-12-12 11:17:23)");
      expect(DateUtils.formatDateTime(new Date(2000, 11, 12, 11, 17, 23))).assertEqual("2000-12-12 11:17:23");
      // Vector 13: formatDateTime prints date and time for 2001-01-13 12:24:36.
      logCase(TAG, "formatDateTime(2001-01-13 12:24:36)");
      expect(DateUtils.formatDateTime(new Date(2001, 0, 13, 12, 24, 36))).assertEqual("2001-01-13 12:24:36");
      // Vector 14: formatDateTime prints date and time for 2001-02-14 13:31:49.
      logCase(TAG, "formatDateTime(2001-02-14 13:31:49)");
      expect(DateUtils.formatDateTime(new Date(2001, 1, 14, 13, 31, 49))).assertEqual("2001-02-14 13:31:49");
      // Vector 15: formatDateTime prints date and time for 2001-03-15 14:38:02.
      logCase(TAG, "formatDateTime(2001-03-15 14:38:02)");
      expect(DateUtils.formatDateTime(new Date(2001, 2, 15, 14, 38, 2))).assertEqual("2001-03-15 14:38:02");
      // Vector 16: formatDateTime prints date and time for 2001-04-16 15:45:15.
      logCase(TAG, "formatDateTime(2001-04-16 15:45:15)");
      expect(DateUtils.formatDateTime(new Date(2001, 3, 16, 15, 45, 15))).assertEqual("2001-04-16 15:45:15");
      // Vector 17: formatDateTime prints date and time for 2001-05-17 16:52:28.
      logCase(TAG, "formatDateTime(2001-05-17 16:52:28)");
      expect(DateUtils.formatDateTime(new Date(2001, 4, 17, 16, 52, 28))).assertEqual("2001-05-17 16:52:28");
      // Vector 18: formatDateTime prints date and time for 2001-06-18 17:59:41.
      logCase(TAG, "formatDateTime(2001-06-18 17:59:41)");
      expect(DateUtils.formatDateTime(new Date(2001, 5, 18, 17, 59, 41))).assertEqual("2001-06-18 17:59:41");
      // Vector 19: formatDateTime prints date and time for 2001-07-19 18:06:54.
      logCase(TAG, "formatDateTime(2001-07-19 18:06:54)");
      expect(DateUtils.formatDateTime(new Date(2001, 6, 19, 18, 6, 54))).assertEqual("2001-07-19 18:06:54");
      // Vector 20: formatDateTime prints date and time for 2001-08-20 19:13:07.
      logCase(TAG, "formatDateTime(2001-08-20 19:13:07)");
      expect(DateUtils.formatDateTime(new Date(2001, 7, 20, 19, 13, 7))).assertEqual("2001-08-20 19:13:07");
      // Vector 21: formatDateTime prints date and time for 2001-09-21 20:20:20.
      logCase(TAG, "formatDateTime(2001-09-21 20:20:20)");
      expect(DateUtils.formatDateTime(new Date(2001, 8, 21, 20, 20, 20))).assertEqual("2001-09-21 20:20:20");
      // Vector 22: formatDateTime prints date and time for 2001-10-22 21:27:33.
      logCase(TAG, "formatDateTime(2001-10-22 21:27:33)");
      expect(DateUtils.formatDateTime(new Date(2001, 9, 22, 21, 27, 33))).assertEqual("2001-10-22 21:27:33");
      // Vector 23: formatDateTime prints date and time for 2001-11-23 22:34:46.
      logCase(TAG, "formatDateTime(2001-11-23 22:34:46)");
      expect(DateUtils.formatDateTime(new Date(2001, 10, 23, 22, 34, 46))).assertEqual("2001-11-23 22:34:46");
      // Vector 24: formatDateTime prints date and time for 2001-12-24 23:41:59.
      logCase(TAG, "formatDateTime(2001-12-24 23:41:59)");
      expect(DateUtils.formatDateTime(new Date(2001, 11, 24, 23, 41, 59))).assertEqual("2001-12-24 23:41:59");
      // Vector 25: formatDateTime prints date and time for 2002-01-25 00:48:12.
      logCase(TAG, "formatDateTime(2002-01-25 00:48:12)");
      expect(DateUtils.formatDateTime(new Date(2002, 0, 25, 0, 48, 12))).assertEqual("2002-01-25 00:48:12");
      // Vector 26: formatDateTime prints date and time for 2002-02-26 01:55:25.
      logCase(TAG, "formatDateTime(2002-02-26 01:55:25)");
      expect(DateUtils.formatDateTime(new Date(2002, 1, 26, 1, 55, 25))).assertEqual("2002-02-26 01:55:25");
      // Vector 27: formatDateTime prints date and time for 2002-03-27 02:02:38.
      logCase(TAG, "formatDateTime(2002-03-27 02:02:38)");
      expect(DateUtils.formatDateTime(new Date(2002, 2, 27, 2, 2, 38))).assertEqual("2002-03-27 02:02:38");
      // Vector 28: formatDateTime prints date and time for 2002-04-28 03:09:51.
      logCase(TAG, "formatDateTime(2002-04-28 03:09:51)");
      expect(DateUtils.formatDateTime(new Date(2002, 3, 28, 3, 9, 51))).assertEqual("2002-04-28 03:09:51");
      // Vector 29: formatDateTime prints date and time for 2002-05-01 04:16:04.
      logCase(TAG, "formatDateTime(2002-05-01 04:16:04)");
      expect(DateUtils.formatDateTime(new Date(2002, 4, 1, 4, 16, 4))).assertEqual("2002-05-01 04:16:04");
      // Vector 30: formatDateTime prints date and time for 2002-06-02 05:23:17.
      logCase(TAG, "formatDateTime(2002-06-02 05:23:17)");
      expect(DateUtils.formatDateTime(new Date(2002, 5, 2, 5, 23, 17))).assertEqual("2002-06-02 05:23:17");
      // Vector 31: formatDateTime prints date and time for 2002-07-03 06:30:30.
      logCase(TAG, "formatDateTime(2002-07-03 06:30:30)");
      expect(DateUtils.formatDateTime(new Date(2002, 6, 3, 6, 30, 30))).assertEqual("2002-07-03 06:30:30");
      // Vector 32: formatDateTime prints date and time for 2002-08-04 07:37:43.
      logCase(TAG, "formatDateTime(2002-08-04 07:37:43)");
      expect(DateUtils.formatDateTime(new Date(2002, 7, 4, 7, 37, 43))).assertEqual("2002-08-04 07:37:43");
      // Vector 33: formatDateTime prints date and time for 2002-09-05 08:44:56.
      logCase(TAG, "formatDateTime(2002-09-05 08:44:56)");
      expect(DateUtils.formatDateTime(new Date(2002, 8, 5, 8, 44, 56))).assertEqual("2002-09-05 08:44:56");
      // Vector 34: formatDateTime prints date and time for 2002-10-06 09:51:09.
      logCase(TAG, "formatDateTime(2002-10-06 09:51:09)");
      expect(DateUtils.formatDateTime(new Date(2002, 9, 6, 9, 51, 9))).assertEqual("2002-10-06 09:51:09");
      // Vector 35: formatDateTime prints date and time for 2002-11-07 10:58:22.
      logCase(TAG, "formatDateTime(2002-11-07 10:58:22)");
      expect(DateUtils.formatDateTime(new Date(2002, 10, 7, 10, 58, 22))).assertEqual("2002-11-07 10:58:22");
      // Vector 36: formatDateTime prints date and time for 2002-12-08 11:05:35.
      logCase(TAG, "formatDateTime(2002-12-08 11:05:35)");
      expect(DateUtils.formatDateTime(new Date(2002, 11, 8, 11, 5, 35))).assertEqual("2002-12-08 11:05:35");
      // Vector 37: formatDateTime prints date and time for 2003-01-09 12:12:48.
      logCase(TAG, "formatDateTime(2003-01-09 12:12:48)");
      expect(DateUtils.formatDateTime(new Date(2003, 0, 9, 12, 12, 48))).assertEqual("2003-01-09 12:12:48");
      // Vector 38: formatDateTime prints date and time for 2003-02-10 13:19:01.
      logCase(TAG, "formatDateTime(2003-02-10 13:19:01)");
      expect(DateUtils.formatDateTime(new Date(2003, 1, 10, 13, 19, 1))).assertEqual("2003-02-10 13:19:01");
      // Vector 39: formatDateTime prints date and time for 2003-03-11 14:26:14.
      logCase(TAG, "formatDateTime(2003-03-11 14:26:14)");
      expect(DateUtils.formatDateTime(new Date(2003, 2, 11, 14, 26, 14))).assertEqual("2003-03-11 14:26:14");
      // Vector 40: formatDateTime prints date and time for 2003-04-12 15:33:27.
      logCase(TAG, "formatDateTime(2003-04-12 15:33:27)");
      expect(DateUtils.formatDateTime(new Date(2003, 3, 12, 15, 33, 27))).assertEqual("2003-04-12 15:33:27");
      // Vector 41: formatDateTime prints date and time for 2003-05-13 16:40:40.
      logCase(TAG, "formatDateTime(2003-05-13 16:40:40)");
      expect(DateUtils.formatDateTime(new Date(2003, 4, 13, 16, 40, 40))).assertEqual("2003-05-13 16:40:40");
      // Vector 42: formatDateTime prints date and time for 2003-06-14 17:47:53.
      logCase(TAG, "formatDateTime(2003-06-14 17:47:53)");
      expect(DateUtils.formatDateTime(new Date(2003, 5, 14, 17, 47, 53))).assertEqual("2003-06-14 17:47:53");
      // Vector 43: formatDateTime prints date and time for 2003-07-15 18:54:06.
      logCase(TAG, "formatDateTime(2003-07-15 18:54:06)");
      expect(DateUtils.formatDateTime(new Date(2003, 6, 15, 18, 54, 6))).assertEqual("2003-07-15 18:54:06");
      // Vector 44: formatDateTime prints date and time for 2003-08-16 19:01:19.
      logCase(TAG, "formatDateTime(2003-08-16 19:01:19)");
      expect(DateUtils.formatDateTime(new Date(2003, 7, 16, 19, 1, 19))).assertEqual("2003-08-16 19:01:19");
      // Vector 45: formatDateTime prints date and time for 2003-09-17 20:08:32.
      logCase(TAG, "formatDateTime(2003-09-17 20:08:32)");
      expect(DateUtils.formatDateTime(new Date(2003, 8, 17, 20, 8, 32))).assertEqual("2003-09-17 20:08:32");
      // Vector 46: formatDateTime prints date and time for 2003-10-18 21:15:45.
      logCase(TAG, "formatDateTime(2003-10-18 21:15:45)");
      expect(DateUtils.formatDateTime(new Date(2003, 9, 18, 21, 15, 45))).assertEqual("2003-10-18 21:15:45");
      // Vector 47: formatDateTime prints date and time for 2003-11-19 22:22:58.
      logCase(TAG, "formatDateTime(2003-11-19 22:22:58)");
      expect(DateUtils.formatDateTime(new Date(2003, 10, 19, 22, 22, 58))).assertEqual("2003-11-19 22:22:58");
      // Vector 48: formatDateTime prints date and time for 2003-12-20 23:29:11.
      logCase(TAG, "formatDateTime(2003-12-20 23:29:11)");
      expect(DateUtils.formatDateTime(new Date(2003, 11, 20, 23, 29, 11))).assertEqual("2003-12-20 23:29:11");
      // Vector 49: formatDateTime prints date and time for 2004-01-21 00:36:24.
      logCase(TAG, "formatDateTime(2004-01-21 00:36:24)");
      expect(DateUtils.formatDateTime(new Date(2004, 0, 21, 0, 36, 24))).assertEqual("2004-01-21 00:36:24");
      // Vector 50: formatDateTime prints date and time for 2004-02-22 01:43:37.
      logCase(TAG, "formatDateTime(2004-02-22 01:43:37)");
      expect(DateUtils.formatDateTime(new Date(2004, 1, 22, 1, 43, 37))).assertEqual("2004-02-22 01:43:37");
      // Vector 51: formatDateTime prints date and time for 2004-03-23 02:50:50.
      logCase(TAG, "formatDateTime(2004-03-23 02:50:50)");
      expect(DateUtils.formatDateTime(new Date(2004, 2, 23, 2, 50, 50))).assertEqual("2004-03-23 02:50:50");
      // Vector 52: formatDateTime prints date and time for 2004-04-24 03:57:03.
      logCase(TAG, "formatDateTime(2004-04-24 03:57:03)");
      expect(DateUtils.formatDateTime(new Date(2004, 3, 24, 3, 57, 3))).assertEqual("2004-04-24 03:57:03");
      // Vector 53: formatDateTime prints date and time for 2004-05-25 04:04:16.
      logCase(TAG, "formatDateTime(2004-05-25 04:04:16)");
      expect(DateUtils.formatDateTime(new Date(2004, 4, 25, 4, 4, 16))).assertEqual("2004-05-25 04:04:16");
      // Vector 54: formatDateTime prints date and time for 2004-06-26 05:11:29.
      logCase(TAG, "formatDateTime(2004-06-26 05:11:29)");
      expect(DateUtils.formatDateTime(new Date(2004, 5, 26, 5, 11, 29))).assertEqual("2004-06-26 05:11:29");
      // Vector 55: formatDateTime prints date and time for 2004-07-27 06:18:42.
      logCase(TAG, "formatDateTime(2004-07-27 06:18:42)");
      expect(DateUtils.formatDateTime(new Date(2004, 6, 27, 6, 18, 42))).assertEqual("2004-07-27 06:18:42");
      // Vector 56: formatDateTime prints date and time for 2004-08-28 07:25:55.
      logCase(TAG, "formatDateTime(2004-08-28 07:25:55)");
      expect(DateUtils.formatDateTime(new Date(2004, 7, 28, 7, 25, 55))).assertEqual("2004-08-28 07:25:55");
      // Vector 57: formatDateTime prints date and time for 2004-09-01 08:32:08.
      logCase(TAG, "formatDateTime(2004-09-01 08:32:08)");
      expect(DateUtils.formatDateTime(new Date(2004, 8, 1, 8, 32, 8))).assertEqual("2004-09-01 08:32:08");
      // Vector 58: formatDateTime prints date and time for 2004-10-02 09:39:21.
      logCase(TAG, "formatDateTime(2004-10-02 09:39:21)");
      expect(DateUtils.formatDateTime(new Date(2004, 9, 2, 9, 39, 21))).assertEqual("2004-10-02 09:39:21");
      // Vector 59: formatDateTime prints date and time for 2004-11-03 10:46:34.
      logCase(TAG, "formatDateTime(2004-11-03 10:46:34)");
      expect(DateUtils.formatDateTime(new Date(2004, 10, 3, 10, 46, 34))).assertEqual("2004-11-03 10:46:34");
      // Vector 60: formatDateTime prints date and time for 2004-12-04 11:53:47.
      logCase(TAG, "formatDateTime(2004-12-04 11:53:47)");
      expect(DateUtils.formatDateTime(new Date(2004, 11, 4, 11, 53, 47))).assertEqual("2004-12-04 11:53:47");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_DATEFMT_0400
     * @tc.name      testDateFormatSweepEpoch0001
     * @tc.desc      Verify fromEpochMs converts epoch milliseconds into local date time text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateFormatSweepEpoch0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateFormatSweepEpoch0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: fromEpochMs(0) converts the epoch value.
      logCase(TAG, "fromEpochMs(0)");
      expect(DateUtils.fromEpochMs(0)).assertEqual("1970-01-01 08:00:00");
      // Vector 2: fromEpochMs(1000) converts the epoch value.
      logCase(TAG, "fromEpochMs(1000)");
      expect(DateUtils.fromEpochMs(1000)).assertEqual("1970-01-01 08:00:01");
      // Vector 3: fromEpochMs(60000) converts the epoch value.
      logCase(TAG, "fromEpochMs(60000)");
      expect(DateUtils.fromEpochMs(60000)).assertEqual("1970-01-01 08:01:00");
      // Vector 4: fromEpochMs(3600000) converts the epoch value.
      logCase(TAG, "fromEpochMs(3600000)");
      expect(DateUtils.fromEpochMs(3600000)).assertEqual("1970-01-01 09:00:00");
      // Vector 5: fromEpochMs(86400000) converts the epoch value.
      logCase(TAG, "fromEpochMs(86400000)");
      expect(DateUtils.fromEpochMs(86400000)).assertEqual("1970-01-02 08:00:00");
      // Vector 6: fromEpochMs(1700000000000) converts the epoch value.
      logCase(TAG, "fromEpochMs(1700000000000)");
      expect(DateUtils.fromEpochMs(1700000000000)).assertEqual("2023-11-15 06:13:20");
      // Vector 7: fromEpochMs(1735689600000) converts the epoch value.
      logCase(TAG, "fromEpochMs(1735689600000)");
      expect(DateUtils.fromEpochMs(1735689600000)).assertEqual("2025-01-01 08:00:00");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
