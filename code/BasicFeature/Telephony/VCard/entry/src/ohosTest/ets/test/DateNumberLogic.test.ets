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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { DateNumberUtils } from '../testutils/DateNumberUtils';

const DOMAIN: number = 0xF811;

export default function dateNumberLogicTest() {
  describe('DateNumberLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_0100
     * @tc.name      testIsLeapYear0001
     * @tc.desc      Verify isLeapYear follows the Gregorian rule on a matrix
     *               of recent common and leap years including the 2000/1900
     *               century pair.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsLeapYear0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIsLeapYear0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.isLeapYear(2000)).assertTrue();
      expect(DateNumberUtils.isLeapYear(1900)).assertFalse();
      expect(DateNumberUtils.isLeapYear(2024)).assertTrue();
      expect(DateNumberUtils.isLeapYear(2023)).assertFalse();
      expect(DateNumberUtils.isLeapYear(2026)).assertFalse();
      expect(DateNumberUtils.isLeapYear(2025)).assertFalse();
      expect(DateNumberUtils.isLeapYear(2028)).assertTrue();
      const leap2024: boolean = DateNumberUtils.isLeapYear(2024);
      expect(leap2024).assertTrue();
      const common2026: boolean = DateNumberUtils.isLeapYear(2026);
      expect(common2026).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_0200
     * @tc.name      testIsLeapYear0002
     * @tc.desc      Verify isLeapYear applies the divisible-by-400 exception
     *               so 1600 and 2400 are leap years while 1700, 1800 and
     *               2100 are common years.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsLeapYear0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIsLeapYear0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.isLeapYear(1600)).assertTrue();
      expect(DateNumberUtils.isLeapYear(1700)).assertFalse();
      expect(DateNumberUtils.isLeapYear(1800)).assertFalse();
      expect(DateNumberUtils.isLeapYear(2100)).assertFalse();
      expect(DateNumberUtils.isLeapYear(2400)).assertTrue();
      expect(DateNumberUtils.isLeapYear(2000)).assertTrue();
      const centuries: number[] = [1600, 1700, 1800, 1900, 2000, 2100, 2400];
      let i: number = 0;
      let leapCount: number = 0;
      while (i < centuries.length) {
        if (DateNumberUtils.isLeapYear(centuries[i])) {
          leapCount = leapCount + 1;
        }
        i = i + 1;
      }
      expect(leapCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_0300
     * @tc.name      testIsLeapYear0003
     * @tc.desc      Verify isLeapYear classifies the 1996..2004 band and the
     *               very small years 4, 40, 100 and 400 correctly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsLeapYear0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIsLeapYear0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.isLeapYear(1996)).assertTrue();
      expect(DateNumberUtils.isLeapYear(1997)).assertFalse();
      expect(DateNumberUtils.isLeapYear(1998)).assertFalse();
      expect(DateNumberUtils.isLeapYear(1999)).assertFalse();
      expect(DateNumberUtils.isLeapYear(2004)).assertTrue();
      expect(DateNumberUtils.isLeapYear(4)).assertTrue();
      expect(DateNumberUtils.isLeapYear(40)).assertTrue();
      expect(DateNumberUtils.isLeapYear(100)).assertFalse();
      expect(DateNumberUtils.isLeapYear(400)).assertTrue();
      const band: number[] = [1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004];
      const leapFlags: boolean[] = [true, false, false, false, true, false, false, false, true];
      let i: number = 0;
      while (i < band.length) {
        expect(DateNumberUtils.isLeapYear(band[i])).assertEqual(leapFlags[i]);
        i = i + 1;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_0400
     * @tc.name      testDaysInMonth0001
     * @tc.desc      Verify daysInMonth returns 31 for every long month of a
     *               common year and of a leap year alike.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDaysInMonth0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDaysInMonth0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const longMonths: number[] = [1, 3, 5, 7, 8, 10, 12];
      let i: number = 0;
      while (i < longMonths.length) {
        expect(DateNumberUtils.daysInMonth(2026, longMonths[i])).assertEqual(31);
        expect(DateNumberUtils.daysInMonth(2024, longMonths[i])).assertEqual(31);
        i = i + 1;
      }
      expect(DateNumberUtils.daysInMonth(2026, 1)).assertEqual(31);
      expect(DateNumberUtils.daysInMonth(2026, 12)).assertEqual(31);
      expect(DateNumberUtils.daysInMonth(1900, 7)).assertEqual(31);
      expect(DateNumberUtils.daysInMonth(2100, 8)).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_0500
     * @tc.name      testDaysInMonth0002
     * @tc.desc      Verify daysInMonth returns 30 for every short month in
     *               both a common and a leap year.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDaysInMonth0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDaysInMonth0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const shortMonths: number[] = [4, 6, 9, 11];
      let i: number = 0;
      while (i < shortMonths.length) {
        expect(DateNumberUtils.daysInMonth(2026, shortMonths[i])).assertEqual(30);
        expect(DateNumberUtils.daysInMonth(2024, shortMonths[i])).assertEqual(30);
        i = i + 1;
      }
      expect(DateNumberUtils.daysInMonth(2026, 4)).assertEqual(30);
      expect(DateNumberUtils.daysInMonth(2026, 11)).assertEqual(30);
      expect(DateNumberUtils.daysInMonth(2000, 6)).assertEqual(30);
      expect(DateNumberUtils.daysInMonth(1999, 9)).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_0600
     * @tc.name      testDaysInMonth0003
     * @tc.desc      Verify daysInMonth returns 29 only for February of leap
     *               years and 28 for February of common century years.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDaysInMonth0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDaysInMonth0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.daysInMonth(2026, 2)).assertEqual(28);
      expect(DateNumberUtils.daysInMonth(2024, 2)).assertEqual(29);
      expect(DateNumberUtils.daysInMonth(2000, 2)).assertEqual(29);
      expect(DateNumberUtils.daysInMonth(1900, 2)).assertEqual(28);
      expect(DateNumberUtils.daysInMonth(2100, 2)).assertEqual(28);
      expect(DateNumberUtils.daysInMonth(2400, 2)).assertEqual(29);
      expect(DateNumberUtils.daysInMonth(1999, 2)).assertEqual(28);
      expect(DateNumberUtils.daysInMonth(2028, 2)).assertEqual(29);
      const leapYears: number[] = [2000, 2024, 2028, 2400];
      let i: number = 0;
      while (i < leapYears.length) {
        expect(DateNumberUtils.daysInMonth(leapYears[i], 2)).assertEqual(29);
        i = i + 1;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_0700
     * @tc.name      testDaysInMonth0004
     * @tc.desc      Verify daysInMonth returns 0 for out-of-range months so
     *               callers can detect invalid month values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDaysInMonth0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDaysInMonth0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.daysInMonth(2026, 0)).assertEqual(0);
      expect(DateNumberUtils.daysInMonth(2026, 13)).assertEqual(0);
      expect(DateNumberUtils.daysInMonth(2026, -1)).assertEqual(0);
      expect(DateNumberUtils.daysInMonth(2026, -12)).assertEqual(0);
      expect(DateNumberUtils.daysInMonth(2026, 99)).assertEqual(0);
      expect(DateNumberUtils.daysInMonth(2024, 0)).assertEqual(0);
      expect(DateNumberUtils.daysInMonth(1900, 13)).assertEqual(0);
      const invalidMonths: number[] = [0, 13, -1, 99];
      let i: number = 0;
      while (i < invalidMonths.length) {
        expect(DateNumberUtils.daysInMonth(2026, invalidMonths[i])).assertEqual(0);
        i = i + 1;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_0800
     * @tc.name      testDayOfYear0001
     * @tc.desc      Verify dayOfYear ordinal values across the first months
     *               and the year end of the common year 2026.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDayOfYear0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDayOfYear0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.dayOfYear(2026, 1, 1)).assertEqual(1);
      expect(DateNumberUtils.dayOfYear(2026, 1, 31)).assertEqual(31);
      expect(DateNumberUtils.dayOfYear(2026, 2, 28)).assertEqual(59);
      expect(DateNumberUtils.dayOfYear(2026, 3, 1)).assertEqual(60);
      expect(DateNumberUtils.dayOfYear(2026, 4, 1)).assertEqual(91);
      expect(DateNumberUtils.dayOfYear(2026, 5, 1)).assertEqual(121);
      expect(DateNumberUtils.dayOfYear(2026, 6, 1)).assertEqual(152);
      expect(DateNumberUtils.dayOfYear(2026, 12, 31)).assertEqual(365);
      const end: number = DateNumberUtils.dayOfYear(2026, 12, 31);
      expect(end).assertEqual(365);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_0900
     * @tc.name      testDayOfYear0002
     * @tc.desc      Verify dayOfYear shifts every date after February by one
     *               in the leap year 2024 and ends at ordinal 366.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDayOfYear0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDayOfYear0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.dayOfYear(2024, 1, 1)).assertEqual(1);
      expect(DateNumberUtils.dayOfYear(2024, 2, 28)).assertEqual(59);
      expect(DateNumberUtils.dayOfYear(2024, 2, 29)).assertEqual(60);
      expect(DateNumberUtils.dayOfYear(2024, 3, 1)).assertEqual(61);
      expect(DateNumberUtils.dayOfYear(2024, 4, 1)).assertEqual(92);
      expect(DateNumberUtils.dayOfYear(2024, 6, 1)).assertEqual(153);
      expect(DateNumberUtils.dayOfYear(2024, 12, 31)).assertEqual(366);
      const leapEnd: number = DateNumberUtils.dayOfYear(2024, 12, 31);
      expect(leapEnd).assertEqual(366);
      const shift: number = DateNumberUtils.dayOfYear(2024, 3, 1)
        - DateNumberUtils.dayOfYear(2026, 3, 1);
      expect(shift).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_1000
     * @tc.name      testDayOfYear0003
     * @tc.desc      Verify dayOfYear for mid-year reference dates including
     *               2026-06-15 at ordinal 166 and 2026-11-09 at ordinal 313.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDayOfYear0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDayOfYear0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.dayOfYear(2026, 6, 15)).assertEqual(166);
      expect(DateNumberUtils.dayOfYear(2026, 11, 9)).assertEqual(313);
      expect(DateNumberUtils.dayOfYear(2026, 7, 15)).assertEqual(196);
      expect(DateNumberUtils.dayOfYear(2026, 10, 31)).assertEqual(304);
      expect(DateNumberUtils.dayOfYear(2026, 12, 25)).assertEqual(359);
      expect(DateNumberUtils.dayOfYear(2000, 3, 1)).assertEqual(61);
      expect(DateNumberUtils.dayOfYear(1900, 3, 1)).assertEqual(60);
      const midYear: number = DateNumberUtils.dayOfYear(2026, 6, 15);
      expect(midYear).assertLarger(150);
      expect(midYear).assertLess(170);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_1100
     * @tc.name      testDayOfYear0004
     * @tc.desc      Verify dayOfYear returns -1 for every invalid year-month
     *               and year-day combination.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDayOfYear0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDayOfYear0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.dayOfYear(2026, 2, 30)).assertEqual(-1);
      expect(DateNumberUtils.dayOfYear(2026, 0, 1)).assertEqual(-1);
      expect(DateNumberUtils.dayOfYear(2026, 13, 1)).assertEqual(-1);
      expect(DateNumberUtils.dayOfYear(2026, 1, 0)).assertEqual(-1);
      expect(DateNumberUtils.dayOfYear(2026, 1, 32)).assertEqual(-1);
      expect(DateNumberUtils.dayOfYear(2026, 4, 31)).assertEqual(-1);
      expect(DateNumberUtils.dayOfYear(1900, 2, 29)).assertEqual(-1);
      expect(DateNumberUtils.dayOfYear(2026, -5, 10)).assertEqual(-1);
      const invalid: number = DateNumberUtils.dayOfYear(2026, 2, 30);
      expect(invalid).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_1200
     * @tc.name      testAddDays0001
     * @tc.desc      Verify addDays keeps the date inside one month for zero
     *               and small positive deltas.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAddDays0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testAddDays0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.addDays(2026, 5, 15, 0)).assertEqual('2026-05-15');
      expect(DateNumberUtils.addDays(2026, 5, 15, 1)).assertEqual('2026-05-16');
      expect(DateNumberUtils.addDays(2026, 5, 15, 10)).assertEqual('2026-05-25');
      expect(DateNumberUtils.addDays(2026, 5, 15, 16)).assertEqual('2026-05-31');
      expect(DateNumberUtils.addDays(2026, 1, 1, 0)).assertEqual('2026-01-01');
      expect(DateNumberUtils.addDays(2026, 12, 31, 0)).assertEqual('2026-12-31');
      expect(DateNumberUtils.addDays(2024, 2, 29, 0)).assertEqual('2024-02-29');
      const shifted: string = DateNumberUtils.addDays(2026, 5, 15, 10);
      expect(shifted.length).assertEqual(10);
      expect(shifted.charAt(4)).assertEqual('-');
      expect(shifted.charAt(7)).assertEqual('-');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_1300
     * @tc.name      testAddDays0002
     * @tc.desc      Verify addDays rolls over one-month boundaries exactly on
     *               the last day of each month length class.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAddDays0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testAddDays0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.addDays(2026, 1, 31, 1)).assertEqual('2026-02-01');
      expect(DateNumberUtils.addDays(2026, 4, 30, 1)).assertEqual('2026-05-01');
      expect(DateNumberUtils.addDays(2026, 5, 31, 1)).assertEqual('2026-06-01');
      expect(DateNumberUtils.addDays(2026, 9, 30, 1)).assertEqual('2026-10-01');
      expect(DateNumberUtils.addDays(2026, 10, 31, 1)).assertEqual('2026-11-01');
      expect(DateNumberUtils.addDays(2026, 11, 30, 1)).assertEqual('2026-12-01');
      expect(DateNumberUtils.addDays(2026, 8, 31, 1)).assertEqual('2026-09-01');
      const rolled: string = DateNumberUtils.addDays(2026, 1, 31, 1);
      expect(rolled).assertContain('2026-02-01');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_1400
     * @tc.name      testAddDays0003
     * @tc.desc      Verify addDays handles the February boundary differently
     *               for a common year and a leap year.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAddDays0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testAddDays0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.addDays(2026, 2, 27, 1)).assertEqual('2026-02-28');
      expect(DateNumberUtils.addDays(2026, 2, 28, 1)).assertEqual('2026-03-01');
      expect(DateNumberUtils.addDays(2024, 2, 27, 1)).assertEqual('2024-02-28');
      expect(DateNumberUtils.addDays(2024, 2, 28, 1)).assertEqual('2024-02-29');
      expect(DateNumberUtils.addDays(2024, 2, 29, 1)).assertEqual('2024-03-01');
      expect(DateNumberUtils.addDays(1900, 2, 28, 1)).assertEqual('1900-03-01');
      expect(DateNumberUtils.addDays(2000, 2, 28, 1)).assertEqual('2000-02-29');
      expect(DateNumberUtils.addDays(2000, 2, 29, 1)).assertEqual('2000-03-01');
      const leapKeep: string = DateNumberUtils.addDays(2024, 2, 28, 1);
      expect(leapKeep).assertContain('02-29');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_1500
     * @tc.name      testAddDays0004
     * @tc.desc      Verify addDays rolls over the year boundary at the last
     *               day of December into January of the next year.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAddDays0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testAddDays0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.addDays(2026, 12, 31, 1)).assertEqual('2027-01-01');
      expect(DateNumberUtils.addDays(2024, 12, 31, 1)).assertEqual('2025-01-01');
      expect(DateNumberUtils.addDays(2026, 12, 30, 2)).assertEqual('2027-01-01');
      expect(DateNumberUtils.addDays(2026, 12, 31, 2)).assertEqual('2027-01-02');
      expect(DateNumberUtils.addDays(1999, 12, 31, 1)).assertEqual('2000-01-01');
      expect(DateNumberUtils.addDays(2000, 12, 31, 1)).assertEqual('2001-01-01');
      const newYear: string = DateNumberUtils.addDays(2026, 12, 31, 1);
      expect(newYear).assertContain('2027-01-01');
      expect(newYear.length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_1600
     * @tc.name      testAddDays0005
     * @tc.desc      Verify addDays walks several months in one call using
     *               the true month lengths of 2026.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAddDays0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testAddDays0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.addDays(2026, 10, 31, 32)).assertEqual('2026-12-02');
      expect(DateNumberUtils.addDays(2026, 1, 31, 28)).assertEqual('2026-02-28');
      expect(DateNumberUtils.addDays(2026, 1, 31, 29)).assertEqual('2026-03-01');
      expect(DateNumberUtils.addDays(2026, 1, 1, 31)).assertEqual('2026-02-01');
      expect(DateNumberUtils.addDays(2026, 3, 31, 30)).assertEqual('2026-04-30');
      expect(DateNumberUtils.addDays(2026, 4, 1, 60)).assertEqual('2026-05-31');
      expect(DateNumberUtils.addDays(2026, 8, 31, 31)).assertEqual('2026-10-01');
      const multi: string = DateNumberUtils.addDays(2026, 10, 31, 32);
      expect(multi).assertContain('2026-12-02');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_1700
     * @tc.name      testAddDays0006
     * @tc.desc      Verify addDays spans whole years correctly across common
     *               and leap year lengths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAddDays0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testAddDays0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.addDays(2026, 1, 1, 365)).assertEqual('2027-01-01');
      expect(DateNumberUtils.addDays(2024, 1, 1, 365)).assertEqual('2024-12-31');
      expect(DateNumberUtils.addDays(2024, 1, 1, 366)).assertEqual('2025-01-01');
      expect(DateNumberUtils.addDays(2026, 12, 31, 366)).assertEqual('2028-01-01');
      expect(DateNumberUtils.addDays(2025, 1, 1, 365)).assertEqual('2026-01-01');
      expect(DateNumberUtils.addDays(2000, 1, 1, 366)).assertEqual('2001-01-01');
      const span: string = DateNumberUtils.addDays(2026, 1, 1, 365);
      expect(span).assertContain('2027');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_1800
     * @tc.name      testAddDays0007
     * @tc.desc      Verify addDays moves one day backwards across month and
     *               year boundaries with negative delta -1.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAddDays0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testAddDays0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.addDays(2026, 3, 1, -1)).assertEqual('2026-02-28');
      expect(DateNumberUtils.addDays(2024, 3, 1, -1)).assertEqual('2024-02-29');
      expect(DateNumberUtils.addDays(2027, 1, 1, -1)).assertEqual('2026-12-31');
      expect(DateNumberUtils.addDays(2026, 1, 1, -1)).assertEqual('2025-12-31');
      expect(DateNumberUtils.addDays(2025, 1, 1, -1)).assertEqual('2024-12-31');
      expect(DateNumberUtils.addDays(2026, 5, 1, -1)).assertEqual('2026-04-30');
      expect(DateNumberUtils.addDays(2000, 3, 1, -1)).assertEqual('2000-02-29');
      const back: string = DateNumberUtils.addDays(2026, 3, 1, -1);
      expect(back).assertContain('2026-02-28');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_1900
     * @tc.name      testAddDays0008
     * @tc.desc      Verify addDays applies larger negative deltas across
     *               whole months and whole years.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAddDays0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testAddDays0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.addDays(2026, 1, 1, -365)).assertEqual('2025-01-01');
      expect(DateNumberUtils.addDays(2026, 3, 1, -30)).assertEqual('2026-01-30');
      expect(DateNumberUtils.addDays(2026, 3, 1, -29)).assertEqual('2026-01-31');
      expect(DateNumberUtils.addDays(2026, 6, 1, -31)).assertEqual('2026-05-01');
      expect(DateNumberUtils.addDays(2025, 1, 1, -365)).assertEqual('2024-01-02');
      expect(DateNumberUtils.addDays(2026, 12, 31, -364)).assertEqual('2026-01-01');
      const back365: string = DateNumberUtils.addDays(2026, 1, 1, -365);
      expect(back365).assertContain('2025-01-01');
      const backStep: string = DateNumberUtils.addDays(2026, 3, 1, -30);
      expect(backStep).assertContain('2026-01-30');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_2000
     * @tc.name      testAddDays0009
     * @tc.desc      Verify addDays returns the empty string for every
     *               invalid input date and never shifts it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAddDays0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testAddDays0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.addDays(2026, 2, 30, 1)).assertEqual('');
      expect(DateNumberUtils.addDays(2026, 0, 1, 5)).assertEqual('');
      expect(DateNumberUtils.addDays(2026, 13, 1, 0)).assertEqual('');
      expect(DateNumberUtils.addDays(2026, 1, 0, 1)).assertEqual('');
      expect(DateNumberUtils.addDays(2026, 1, 32, 0)).assertEqual('');
      expect(DateNumberUtils.addDays(2026, 4, 31, -3)).assertEqual('');
      expect(DateNumberUtils.addDays(1900, 2, 29, 1)).assertEqual('');
      const invalid: string = DateNumberUtils.addDays(2026, 2, 30, 1);
      expect(invalid.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_2100
     * @tc.name      testDiffDays0001
     * @tc.desc      Verify diffDays is zero for identical dates and one day
     *               for adjacent dates in both directions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDiffDays0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDiffDays0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.diffDays(2026, 11, 9, 2026, 11, 9)).assertEqual(0);
      expect(DateNumberUtils.diffDays(2026, 11, 9, 2026, 11, 10)).assertEqual(1);
      expect(DateNumberUtils.diffDays(2026, 11, 10, 2026, 11, 9)).assertEqual(-1);
      expect(DateNumberUtils.diffDays(2026, 1, 1, 2026, 1, 1)).assertEqual(0);
      expect(DateNumberUtils.diffDays(2024, 12, 31, 2025, 1, 1)).assertEqual(1);
      expect(DateNumberUtils.diffDays(2025, 1, 1, 2024, 12, 31)).assertEqual(-1);
      expect(DateNumberUtils.diffDays(2026, 2, 28, 2026, 3, 1)).assertEqual(1);
      const zero: number = DateNumberUtils.diffDays(2026, 11, 9, 2026, 11, 9);
      expect(zero).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_2200
     * @tc.name      testDiffDays0002
     * @tc.desc      Verify diffDays inside one year including the 46 day
     *               span from 2026-11-09 to 2026-12-25 and its reverse.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDiffDays0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDiffDays0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.diffDays(2026, 11, 9, 2026, 12, 25)).assertEqual(46);
      expect(DateNumberUtils.diffDays(2026, 12, 25, 2026, 11, 9)).assertEqual(-46);
      expect(DateNumberUtils.diffDays(2026, 3, 1, 2026, 2, 28)).assertEqual(-1);
      expect(DateNumberUtils.diffDays(2026, 2, 28, 2026, 3, 1)).assertEqual(1);
      expect(DateNumberUtils.diffDays(2026, 1, 1, 2026, 6, 15)).assertEqual(165);
      expect(DateNumberUtils.diffDays(2026, 6, 15, 2026, 12, 31)).assertEqual(199);
      expect(DateNumberUtils.diffDays(2026, 1, 1, 2026, 12, 31)).assertEqual(364);
      const span46: number = DateNumberUtils.diffDays(2026, 11, 9, 2026, 12, 25);
      expect(span46).assertLarger(40);
      expect(span46).assertLess(50);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_2300
     * @tc.name      testDiffDays0003
     * @tc.desc      Verify diffDays across year boundaries gives 365 for a
     *               common year and 366 for the leap year 2024.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDiffDays0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDiffDays0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.diffDays(2026, 1, 1, 2027, 1, 1)).assertEqual(365);
      expect(DateNumberUtils.diffDays(2024, 1, 1, 2025, 1, 1)).assertEqual(366);
      expect(DateNumberUtils.diffDays(2025, 1, 1, 2026, 1, 1)).assertEqual(365);
      expect(DateNumberUtils.diffDays(2026, 11, 9, 2027, 2, 1)).assertEqual(84);
      expect(DateNumberUtils.diffDays(2026, 12, 31, 2027, 1, 1)).assertEqual(1);
      expect(DateNumberUtils.diffDays(2027, 2, 1, 2026, 11, 9)).assertEqual(-84);
      expect(DateNumberUtils.diffDays(2024, 2, 29, 2025, 2, 28)).assertEqual(365);
      const leapSpan: number = DateNumberUtils.diffDays(2024, 1, 1, 2025, 1, 1);
      expect(leapSpan).assertEqual(366);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_2400
     * @tc.name      testDiffDays0004
     * @tc.desc      Verify diffDays over century spans yields 36524 across
     *               the common century 1900 and 36525 across the leap
     *               century 2000, plus a two day leap February span.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDiffDays0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDiffDays0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.diffDays(1900, 1, 1, 2000, 1, 1)).assertEqual(36524);
      expect(DateNumberUtils.diffDays(2000, 1, 1, 2100, 1, 1)).assertEqual(36525);
      expect(DateNumberUtils.diffDays(2000, 3, 1, 2000, 2, 28)).assertEqual(-2);
      expect(DateNumberUtils.diffDays(2000, 2, 28, 2000, 3, 1)).assertEqual(2);
      expect(DateNumberUtils.diffDays(1900, 2, 28, 1900, 3, 1)).assertEqual(1);
      expect(DateNumberUtils.diffDays(2026, 1, 1, 2036, 1, 1)).assertEqual(3652);
      expect(DateNumberUtils.diffDays(2100, 1, 1, 1900, 1, 1)).assertEqual(-73049);
      const century1900: number = DateNumberUtils.diffDays(1900, 1, 1, 2000, 1, 1);
      expect(century1900).assertLarger(36500);
      expect(century1900).assertLess(36530);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_2500
     * @tc.name      testDiffDays0005
     * @tc.desc      Verify diffDays returns 0 whenever either endpoint is an
     *               invalid calendar date.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDiffDays0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDiffDays0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.diffDays(2026, 2, 30, 2026, 3, 1)).assertEqual(0);
      expect(DateNumberUtils.diffDays(2026, 1, 1, 2026, 13, 1)).assertEqual(0);
      expect(DateNumberUtils.diffDays(2026, 0, 10, 2026, 1, 10)).assertEqual(0);
      expect(DateNumberUtils.diffDays(2026, 1, 1, 2026, 1, 0)).assertEqual(0);
      expect(DateNumberUtils.diffDays(2026, 1, 32, 2026, 2, 1)).assertEqual(0);
      expect(DateNumberUtils.diffDays(2026, 4, 31, 2026, 5, 1)).assertEqual(0);
      expect(DateNumberUtils.diffDays(1900, 2, 29, 1900, 3, 1)).assertEqual(0);
      const invalid: number = DateNumberUtils.diffDays(2026, 2, 30, 2026, 3, 1);
      expect(invalid).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_2600
     * @tc.name      testDayOfWeek0001
     * @tc.desc      Verify dayOfWeek returns 1 for the known Monday
     *               2026-11-09 and its immediate weekday neighbors.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDayOfWeek0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDayOfWeek0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.dayOfWeek(2026, 11, 9)).assertEqual(1);
      expect(DateNumberUtils.dayOfWeek(2026, 11, 10)).assertEqual(2);
      expect(DateNumberUtils.dayOfWeek(2026, 11, 11)).assertEqual(3);
      expect(DateNumberUtils.dayOfWeek(2026, 11, 12)).assertEqual(4);
      expect(DateNumberUtils.dayOfWeek(2026, 11, 13)).assertEqual(5);
      expect(DateNumberUtils.dayOfWeek(2026, 11, 14)).assertEqual(6);
      expect(DateNumberUtils.dayOfWeek(2026, 11, 15)).assertEqual(0);
      expect(DateNumberUtils.dayOfWeek(2026, 11, 16)).assertEqual(1);
      const monday: number = DateNumberUtils.dayOfWeek(2026, 11, 9);
      expect(monday).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_2700
     * @tc.name      testDayOfWeek0002
     * @tc.desc      Verify dayOfWeek on hand-checked dates: 2026-01-01 is a
     *               Thursday, 2026-12-25 a Friday and 2000-01-01 a Saturday.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDayOfWeek0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDayOfWeek0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.dayOfWeek(2026, 1, 1)).assertEqual(4);
      expect(DateNumberUtils.dayOfWeek(2026, 12, 25)).assertEqual(5);
      expect(DateNumberUtils.dayOfWeek(2000, 1, 1)).assertEqual(6);
      expect(DateNumberUtils.dayOfWeek(2026, 1, 2)).assertEqual(5);
      expect(DateNumberUtils.dayOfWeek(2026, 1, 3)).assertEqual(6);
      expect(DateNumberUtils.dayOfWeek(2026, 1, 4)).assertEqual(0);
      expect(DateNumberUtils.dayOfWeek(2026, 1, 5)).assertEqual(1);
      const thursday: number = DateNumberUtils.dayOfWeek(2026, 1, 1);
      expect(thursday).assertEqual(4);
      const saturday: number = DateNumberUtils.dayOfWeek(2000, 1, 1);
      expect(saturday).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_2800
     * @tc.name      testDayOfWeek0003
     * @tc.desc      Verify dayOfWeek for historic dates: 1900-01-01 Monday,
     *               the leap day 2024-02-29 Thursday and 2100-03-01 Monday.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDayOfWeek0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDayOfWeek0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.dayOfWeek(1900, 1, 1)).assertEqual(1);
      expect(DateNumberUtils.dayOfWeek(2024, 2, 29)).assertEqual(4);
      expect(DateNumberUtils.dayOfWeek(2100, 3, 1)).assertEqual(1);
      expect(DateNumberUtils.dayOfWeek(2000, 3, 1)).assertEqual(3);
      expect(DateNumberUtils.dayOfWeek(2026, 6, 15)).assertEqual(1);
      expect(DateNumberUtils.dayOfWeek(2026, 2, 28)).assertEqual(6);
      expect(DateNumberUtils.dayOfWeek(2026, 3, 1)).assertEqual(0);
      const historic: number = DateNumberUtils.dayOfWeek(1900, 1, 1);
      expect(historic).assertEqual(1);
      const leapDay: number = DateNumberUtils.dayOfWeek(2024, 2, 29);
      expect(leapDay).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_2900
     * @tc.name      testDayOfWeek0004
     * @tc.desc      Verify dayOfWeek returns -1 for invalid calendar dates
     *               of every invalidity class.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDayOfWeek0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDayOfWeek0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.dayOfWeek(2026, 2, 29)).assertEqual(-1);
      expect(DateNumberUtils.dayOfWeek(2026, 13, 1)).assertEqual(-1);
      expect(DateNumberUtils.dayOfWeek(2026, 1, 32)).assertEqual(-1);
      expect(DateNumberUtils.dayOfWeek(2026, 0, 5)).assertEqual(-1);
      expect(DateNumberUtils.dayOfWeek(2026, 1, 0)).assertEqual(-1);
      expect(DateNumberUtils.dayOfWeek(1900, 2, 29)).assertEqual(-1);
      expect(DateNumberUtils.dayOfWeek(2026, 4, 31)).assertEqual(-1);
      const invalid: number = DateNumberUtils.dayOfWeek(2026, 2, 29);
      expect(invalid).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_3000
     * @tc.name      testFormatStamp0001
     * @tc.desc      Verify formatStamp renders yyyy-MM-dd HH:mm:ss with two
     *               digit padding exactly like the production Formatter.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatStamp0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatStamp0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stampA: number = new Date(2026, 0, 5, 7, 8, 9).getTime();
      expect(DateNumberUtils.formatStamp(stampA)).assertEqual('2026-01-05 07:08:09');
      const stampB: number = new Date(2026, 10, 25, 23, 59, 59).getTime();
      expect(DateNumberUtils.formatStamp(stampB)).assertEqual('2026-11-25 23:59:59');
      const stampC: number = new Date(2026, 2, 9, 5, 6, 7).getTime();
      expect(DateNumberUtils.formatStamp(stampC)).assertEqual('2026-03-09 05:06:07');
      const stampD: number = new Date(2026, 5, 15, 12, 34, 56).getTime();
      expect(DateNumberUtils.formatStamp(stampD)).assertEqual('2026-06-15 12:34:56');
      const text: string = DateNumberUtils.formatStamp(stampA);
      expect(text).assertContain('2026-01-05 07:08:09');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_3100
     * @tc.name      testFormatStamp0002
     * @tc.desc      Verify formatStamp at midnight and late-night boundary
     *               timestamps and the exact separator layout of the text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatStamp0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatStamp0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const midnight: number = new Date(2024, 1, 29, 0, 0, 0).getTime();
      const midnightText: string = DateNumberUtils.formatStamp(midnight);
      expect(midnightText).assertEqual('2024-02-29 00:00:00');
      const lastSecond: number = new Date(2026, 11, 31, 23, 59, 59).getTime();
      const lastSecondText: string = DateNumberUtils.formatStamp(lastSecond);
      expect(lastSecondText).assertEqual('2026-12-31 23:59:59');
      expect(midnightText.length).assertEqual(19);
      expect(midnightText.charAt(10)).assertEqual(' ');
      expect(midnightText.charAt(4)).assertEqual('-');
      expect(midnightText.charAt(7)).assertEqual('-');
      expect(midnightText.charAt(13)).assertEqual(':');
      expect(midnightText.charAt(16)).assertEqual(':');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_3200
     * @tc.name      testDayOfYear0005
     * @tc.desc      Verify dayOfYear for mid-month dates across the year and
     *               the one-day shift that leap February applies to November.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDayOfYear0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDayOfYear0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.dayOfYear(2026, 1, 15)).assertEqual(15);
      expect(DateNumberUtils.dayOfYear(2026, 2, 15)).assertEqual(46);
      expect(DateNumberUtils.dayOfYear(2026, 3, 15)).assertEqual(74);
      expect(DateNumberUtils.dayOfYear(2026, 12, 1)).assertEqual(335);
      expect(DateNumberUtils.dayOfYear(2026, 11, 9)).assertEqual(313);
      expect(DateNumberUtils.dayOfYear(2024, 11, 9)).assertEqual(314);
      expect(DateNumberUtils.dayOfYear(2024, 12, 31)).assertEqual(366);
      expect(DateNumberUtils.dayOfYear(2026, 12, 31)).assertEqual(365);
      const midYear: number = DateNumberUtils.dayOfYear(2026, 6, 1);
      expect(midYear).assertEqual(152);
      expect(DateNumberUtils.dayOfYear(2026, 6, 30)).assertEqual(181);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_3300
     * @tc.name      testAddDays0010
     * @tc.desc      Verify addDays around leap February boundaries and the
     *               fixed yyyy-MM-dd layout of every rendered result.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAddDays0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testAddDays0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.addDays(2024, 2, 28, 1)).assertEqual('2024-02-29');
      expect(DateNumberUtils.addDays(2024, 2, 29, 1)).assertEqual('2024-03-01');
      expect(DateNumberUtils.addDays(2026, 2, 28, 1)).assertEqual('2026-03-01');
      expect(DateNumberUtils.addDays(2026, 5, 15, 0)).assertEqual('2026-05-15');
      const shifted: string = DateNumberUtils.addDays(2026, 5, 15, 16);
      expect(shifted).assertEqual('2026-05-31');
      expect(shifted.length).assertEqual(10);
      expect(shifted.charAt(4)).assertEqual('-');
      expect(shifted.charAt(7)).assertEqual('-');
      const yearEnd: string = DateNumberUtils.addDays(2026, 12, 31, 1);
      expect(yearEnd.charAt(0)).assertEqual('2');
      expect(yearEnd).assertContain('2027');
      const back: string = DateNumberUtils.addDays(2026, 1, 1, -1);
      expect(back).assertEqual('2025-12-31');
      expect(back.length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DATE_3400
     * @tc.name      testDiffDays0006
     * @tc.desc      Verify diffDays additivity across an intermediate date
     *               and the exact negative mirror of a one-year span.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDiffDays0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDiffDays0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const first: number = DateNumberUtils.diffDays(2026, 1, 1, 2026, 6, 1);
      expect(first).assertEqual(151);
      const second: number = DateNumberUtils.diffDays(2026, 6, 1, 2027, 1, 1);
      expect(second).assertEqual(214);
      expect(first + second).assertEqual(365);
      expect(DateNumberUtils.diffDays(2026, 1, 1, 2027, 1, 1)).assertEqual(365);
      expect(DateNumberUtils.diffDays(2027, 1, 1, 2026, 1, 1)).assertEqual(-365);
      const mirror: number = DateNumberUtils.diffDays(2026, 11, 9, 2026, 12, 25);
      expect(mirror).assertEqual(46);
      expect(DateNumberUtils.diffDays(2026, 12, 25, 2026, 11, 9)).assertEqual(-46);
      expect(DateNumberUtils.diffDays(2026, 6, 1, 2026, 6, 1)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
