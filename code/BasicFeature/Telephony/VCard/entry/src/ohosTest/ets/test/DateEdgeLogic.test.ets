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

export default function dateEdgeLogicTest() {
  describe('DateEdgeLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_0100
     * @tc.name      testDaysInMonth0001
     * @tc.desc      Verify daysInMonth returns 0 for every month value
     *               outside the 1..12 range including negatives and large
     *               numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDaysInMonth0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDaysInMonth0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.daysInMonth(2026, 0)).assertEqual(0);
      expect(DateNumberUtils.daysInMonth(2026, 13)).assertEqual(0);
      expect(DateNumberUtils.daysInMonth(2026, -3)).assertEqual(0);
      expect(DateNumberUtils.daysInMonth(2026, 99)).assertEqual(0);
      expect(DateNumberUtils.daysInMonth(2026, 100)).assertEqual(0);
      expect(DateNumberUtils.daysInMonth(2024, 0)).assertEqual(0);
      expect(DateNumberUtils.daysInMonth(2024, 14)).assertEqual(0);
      expect(DateNumberUtils.daysInMonth(2000, -1)).assertEqual(0);
      const invalid: number = DateNumberUtils.daysInMonth(2026, 13);
      expect(invalid).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_0200
     * @tc.name      testDaysInMonth0002
     * @tc.desc      Verify daysInMonth at the valid range boundaries and for
     *               February across century leap and common years.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDaysInMonth0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDaysInMonth0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.daysInMonth(2026, 1)).assertEqual(31);
      expect(DateNumberUtils.daysInMonth(2026, 12)).assertEqual(31);
      expect(DateNumberUtils.daysInMonth(2000, 2)).assertEqual(29);
      expect(DateNumberUtils.daysInMonth(1900, 2)).assertEqual(28);
      expect(DateNumberUtils.daysInMonth(2100, 2)).assertEqual(28);
      expect(DateNumberUtils.daysInMonth(2400, 2)).assertEqual(29);
      expect(DateNumberUtils.daysInMonth(2000, 1)).assertEqual(31);
      expect(DateNumberUtils.daysInMonth(2000, 12)).assertEqual(31);
      const february: number = DateNumberUtils.daysInMonth(2100, 2);
      expect(february).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_0300
     * @tc.name      testIsValidDate0001
     * @tc.desc      Verify isValidDate rejects day zero for long months,
     *               short months and February of both year kinds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsValidDate0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIsValidDate0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.isValidDate(2026, 1, 0)).assertFalse();
      expect(DateNumberUtils.isValidDate(2026, 4, 0)).assertFalse();
      expect(DateNumberUtils.isValidDate(2026, 2, 0)).assertFalse();
      expect(DateNumberUtils.isValidDate(2024, 2, 0)).assertFalse();
      expect(DateNumberUtils.isValidDate(2000, 2, 0)).assertFalse();
      expect(DateNumberUtils.isValidDate(2026, 12, 0)).assertFalse();
      expect(DateNumberUtils.isValidDate(2026, 1, 1)).assertTrue();
      expect(DateNumberUtils.isValidDate(2026, 4, 1)).assertTrue();
      expect(DateNumberUtils.isValidDate(2024, 2, 1)).assertTrue();
      const zeroDay: boolean = DateNumberUtils.isValidDate(2026, 1, 0);
      expect(zeroDay).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_0400
     * @tc.name      testIsValidDate0002
     * @tc.desc      Verify isValidDate accepts the true month-end day and
     *               rejects day 32 and the day after a 30-day month end.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsValidDate0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIsValidDate0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.isValidDate(2026, 1, 31)).assertTrue();
      expect(DateNumberUtils.isValidDate(2026, 1, 32)).assertFalse();
      expect(DateNumberUtils.isValidDate(2026, 4, 30)).assertTrue();
      expect(DateNumberUtils.isValidDate(2026, 4, 31)).assertFalse();
      expect(DateNumberUtils.isValidDate(2026, 2, 28)).assertTrue();
      expect(DateNumberUtils.isValidDate(2026, 2, 29)).assertFalse();
      expect(DateNumberUtils.isValidDate(2026, 12, 31)).assertTrue();
      expect(DateNumberUtils.isValidDate(2026, 12, 32)).assertFalse();
      expect(DateNumberUtils.isValidDate(2026, 9, 30)).assertTrue();
      expect(DateNumberUtils.isValidDate(2026, 9, 31)).assertFalse();
      const over: boolean = DateNumberUtils.isValidDate(2026, 1, 32);
      expect(over).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_0500
     * @tc.name      testIsValidDate0003
     * @tc.desc      Verify isValidDate rejects month 0 and month 13 while
     *               accepting the 1 and 12 boundaries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsValidDate0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIsValidDate0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.isValidDate(2026, 0, 15)).assertFalse();
      expect(DateNumberUtils.isValidDate(2026, 13, 15)).assertFalse();
      expect(DateNumberUtils.isValidDate(2026, -1, 15)).assertFalse();
      expect(DateNumberUtils.isValidDate(2026, 99, 15)).assertFalse();
      expect(DateNumberUtils.isValidDate(2026, 1, 15)).assertTrue();
      expect(DateNumberUtils.isValidDate(2026, 12, 15)).assertTrue();
      expect(DateNumberUtils.isValidDate(2024, 0, 29)).assertFalse();
      expect(DateNumberUtils.isValidDate(2024, 13, 29)).assertFalse();
      const badMonth: boolean = DateNumberUtils.isValidDate(2026, 13, 15);
      expect(badMonth).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_0600
     * @tc.name      testIsValidDate0004
     * @tc.desc      Verify isValidDate for February 29 across leap years
     *               2024/2000/2400 and common years 2026/1900/2100.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsValidDate0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIsValidDate0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.isValidDate(2024, 2, 29)).assertTrue();
      expect(DateNumberUtils.isValidDate(2000, 2, 29)).assertTrue();
      expect(DateNumberUtils.isValidDate(2400, 2, 29)).assertTrue();
      expect(DateNumberUtils.isValidDate(2026, 2, 29)).assertFalse();
      expect(DateNumberUtils.isValidDate(1900, 2, 29)).assertFalse();
      expect(DateNumberUtils.isValidDate(2100, 2, 29)).assertFalse();
      expect(DateNumberUtils.isValidDate(2028, 2, 29)).assertTrue();
      expect(DateNumberUtils.isValidDate(1996, 2, 29)).assertTrue();
      const leapDay: boolean = DateNumberUtils.isValidDate(2400, 2, 29);
      expect(leapDay).assertTrue();
      const commonDay: boolean = DateNumberUtils.isValidDate(2100, 2, 29);
      expect(commonDay).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_0700
     * @tc.name      testIsLeapYear0001
     * @tc.desc      Verify isLeapYear on the 1600/1700/1800/1900 century
     *               band where only 400-divisible centuries are leap.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsLeapYear0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIsLeapYear0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.isLeapYear(1600)).assertTrue();
      expect(DateNumberUtils.isLeapYear(1700)).assertFalse();
      expect(DateNumberUtils.isLeapYear(1800)).assertFalse();
      expect(DateNumberUtils.isLeapYear(1900)).assertFalse();
      expect(DateNumberUtils.isLeapYear(1500)).assertFalse();
      expect(DateNumberUtils.isLeapYear(1200)).assertTrue();
      expect(DateNumberUtils.isLeapYear(1896)).assertTrue();
      expect(DateNumberUtils.isLeapYear(1904)).assertTrue();
      const century: boolean = DateNumberUtils.isLeapYear(1600);
      expect(century).assertTrue();
      const commonCentury: boolean = DateNumberUtils.isLeapYear(1900);
      expect(commonCentury).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_0800
     * @tc.name      testIsLeapYear0002
     * @tc.desc      Verify isLeapYear for 2000, 2100 and 2400 plus regular
     *               four-year cycle members 2004 and 2104.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsLeapYear0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIsLeapYear0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.isLeapYear(2000)).assertTrue();
      expect(DateNumberUtils.isLeapYear(2100)).assertFalse();
      expect(DateNumberUtils.isLeapYear(2400)).assertTrue();
      expect(DateNumberUtils.isLeapYear(2004)).assertTrue();
      expect(DateNumberUtils.isLeapYear(2104)).assertTrue();
      expect(DateNumberUtils.isLeapYear(2101)).assertFalse();
      expect(DateNumberUtils.isLeapYear(2099)).assertFalse();
      expect(DateNumberUtils.isLeapYear(2001)).assertFalse();
      const year2000: boolean = DateNumberUtils.isLeapYear(2000);
      expect(year2000).assertTrue();
      const year2100: boolean = DateNumberUtils.isLeapYear(2100);
      expect(year2100).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_0900
     * @tc.name      testAddDays0001
     * @tc.desc      Verify addDays with delta -1 rolls back correctly across
     *               February in leap and common years.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAddDays0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testAddDays0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.addDays(2026, 3, 1, -1)).assertEqual('2026-02-28');
      expect(DateNumberUtils.addDays(2024, 3, 1, -1)).assertEqual('2024-02-29');
      expect(DateNumberUtils.addDays(2025, 3, 1, -1)).assertEqual('2025-02-28');
      expect(DateNumberUtils.addDays(2024, 3, 1, -2)).assertEqual('2024-02-28');
      expect(DateNumberUtils.addDays(2026, 3, 1, -2)).assertEqual('2026-02-27');
      expect(DateNumberUtils.addDays(2100, 3, 1, -1)).assertEqual('2100-02-28');
      expect(DateNumberUtils.addDays(2400, 3, 1, -1)).assertEqual('2400-02-29');
      const backOne: string = DateNumberUtils.addDays(2024, 3, 1, -1);
      expect(backOne).assertContain('2024-02-29');
      expect(backOne.length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_1000
     * @tc.name      testAddDays0002
     * @tc.desc      Verify addDays with delta -1 rolls back across the year
     *               boundary for three consecutive year starts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAddDays0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testAddDays0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.addDays(2027, 1, 1, -1)).assertEqual('2026-12-31');
      expect(DateNumberUtils.addDays(2026, 1, 1, -1)).assertEqual('2025-12-31');
      expect(DateNumberUtils.addDays(2025, 1, 1, -1)).assertEqual('2024-12-31');
      expect(DateNumberUtils.addDays(2025, 1, 1, -2)).assertEqual('2024-12-30');
      expect(DateNumberUtils.addDays(2100, 1, 1, -1)).assertEqual('2099-12-31');
      expect(DateNumberUtils.addDays(2000, 1, 1, -1)).assertEqual('1999-12-31');
      const crossYear: string = DateNumberUtils.addDays(2025, 1, 1, -1);
      expect(crossYear).assertContain('2024');
      expect(crossYear).assertContain('12-31');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_1100
     * @tc.name      testAddDays0003
     * @tc.desc      Verify addDays with large negative deltas lands on the
     *               hand-computed calendar dates including leap-year shifts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAddDays0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testAddDays0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.addDays(2026, 1, 1, -365)).assertEqual('2025-01-01');
      expect(DateNumberUtils.addDays(2025, 1, 1, -365)).assertEqual('2024-01-02');
      expect(DateNumberUtils.addDays(2025, 3, 1, -365)).assertEqual('2024-03-01');
      expect(DateNumberUtils.addDays(2026, 3, 1, -30)).assertEqual('2026-01-30');
      expect(DateNumberUtils.addDays(2026, 3, 1, -60)).assertEqual('2025-12-31');
      expect(DateNumberUtils.addDays(2027, 1, 1, -366)).assertEqual('2025-12-31');
      const minusYear: string = DateNumberUtils.addDays(2026, 1, 1, -365);
      expect(minusYear).assertEqual('2025-01-01');
      expect(minusYear.length).assertEqual(10);
      const minusLeapYear: string = DateNumberUtils.addDays(2027, 1, 1, -366);
      expect(minusLeapYear).assertEqual('2025-12-31');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_1200
     * @tc.name      testAddDays0004
     * @tc.desc      Verify addDays with large positive deltas across leap
     *               and common year lengths lands on exact dates.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAddDays0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testAddDays0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.addDays(2024, 1, 1, 366)).assertEqual('2025-01-01');
      expect(DateNumberUtils.addDays(2024, 1, 1, 365)).assertEqual('2024-12-31');
      expect(DateNumberUtils.addDays(2026, 1, 1, 365)).assertEqual('2027-01-01');
      expect(DateNumberUtils.addDays(2026, 1, 1, 731)).assertEqual('2028-01-02');
      expect(DateNumberUtils.addDays(2024, 1, 1, 1461)).assertEqual('2028-01-01');
      expect(DateNumberUtils.addDays(2025, 1, 1, 365)).assertEqual('2026-01-01');
      const fourYears: string = DateNumberUtils.addDays(2024, 1, 1, 1461);
      expect(fourYears).assertEqual('2028-01-01');
      expect(fourYears).assertContain('2028');
      const twoYears: string = DateNumberUtils.addDays(2026, 1, 1, 731);
      expect(twoYears).assertEqual('2028-01-02');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_1300
     * @tc.name      testAddDays0005
     * @tc.desc      Verify addDays returns the empty string for every
     *               invalid input date regardless of the delta value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAddDays0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testAddDays0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.addDays(2026, 2, 30, 1)).assertEqual('');
      expect(DateNumberUtils.addDays(2026, 0, 1, 5)).assertEqual('');
      expect(DateNumberUtils.addDays(2026, 13, 1, 0)).assertEqual('');
      expect(DateNumberUtils.addDays(2026, 1, 0, 1)).assertEqual('');
      expect(DateNumberUtils.addDays(2026, 1, 32, 0)).assertEqual('');
      expect(DateNumberUtils.addDays(1900, 2, 29, 1)).assertEqual('');
      expect(DateNumberUtils.addDays(2026, 4, 31, 10)).assertEqual('');
      expect(DateNumberUtils.addDays(2026, 9, 31, -5)).assertEqual('');
      const empty: string = DateNumberUtils.addDays(2026, 2, 30, 1);
      expect(empty).assertEqual('');
      expect(empty.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_1400
     * @tc.name      testAddDays0006
     * @tc.desc      Verify addDays clamps at month ends so overflowing days
     *               land in the first days of the next month.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAddDays0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testAddDays0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.addDays(2026, 1, 31, 28)).assertEqual('2026-02-28');
      expect(DateNumberUtils.addDays(2026, 1, 31, 29)).assertEqual('2026-03-01');
      expect(DateNumberUtils.addDays(2026, 5, 31, 1)).assertEqual('2026-06-01');
      expect(DateNumberUtils.addDays(2026, 7, 31, 1)).assertEqual('2026-08-01');
      expect(DateNumberUtils.addDays(2026, 10, 31, 1)).assertEqual('2026-11-01');
      expect(DateNumberUtils.addDays(2026, 4, 30, 1)).assertEqual('2026-05-01');
      expect(DateNumberUtils.addDays(2026, 8, 31, 1)).assertEqual('2026-09-01');
      expect(DateNumberUtils.addDays(2026, 3, 31, 1)).assertEqual('2026-04-01');
      const clamp: string = DateNumberUtils.addDays(2026, 1, 31, 29);
      expect(clamp).assertEqual('2026-03-01');
      expect(clamp).assertContain('03-01');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_1500
     * @tc.name      testAddDays0007
     * @tc.desc      Verify addDays spanning three consecutive month ends
     *               produces the hand-computed date deep in the next
     *               quarter.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAddDays0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testAddDays0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.addDays(2026, 10, 31, 32)).assertEqual('2026-12-02');
      expect(DateNumberUtils.addDays(2026, 8, 31, 92)).assertEqual('2026-12-01');
      expect(DateNumberUtils.addDays(2026, 9, 30, 61)).assertEqual('2026-11-30');
      expect(DateNumberUtils.addDays(2026, 9, 30, 62)).assertEqual('2026-12-01');
      expect(DateNumberUtils.addDays(2026, 6, 30, 92)).assertEqual('2026-09-30');
      expect(DateNumberUtils.addDays(2026, 6, 30, 93)).assertEqual('2026-10-01');
      const span: string = DateNumberUtils.addDays(2026, 8, 31, 92);
      expect(span).assertEqual('2026-12-01');
      expect(span).assertContain('12-01');
      const spanNext: string = DateNumberUtils.addDays(2026, 8, 31, 93);
      expect(spanNext).assertEqual('2026-12-02');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_1600
     * @tc.name      testAddDays0008
     * @tc.desc      Verify addDays with delta 0 is an identity for normal,
     *               leap-day and year-end dates.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAddDays0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testAddDays0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.addDays(2026, 5, 15, 0)).assertEqual('2026-05-15');
      expect(DateNumberUtils.addDays(2024, 2, 29, 0)).assertEqual('2024-02-29');
      expect(DateNumberUtils.addDays(2000, 2, 29, 0)).assertEqual('2000-02-29');
      expect(DateNumberUtils.addDays(2026, 12, 31, 0)).assertEqual('2026-12-31');
      expect(DateNumberUtils.addDays(1900, 1, 1, 0)).assertEqual('1900-01-01');
      expect(DateNumberUtils.addDays(2100, 12, 31, 0)).assertEqual('2100-12-31');
      const same: string = DateNumberUtils.addDays(2024, 2, 29, 0);
      expect(same).assertEqual('2024-02-29');
      expect(same.length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_1700
     * @tc.name      testDiffDays0001
     * @tc.desc      Verify diffDays returns 0 for identical dates and for
     *               any call with an invalid endpoint on either side.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDiffDays0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDiffDays0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.diffDays(2026, 5, 15, 2026, 5, 15)).assertEqual(0);
      expect(DateNumberUtils.diffDays(2024, 2, 29, 2024, 2, 29)).assertEqual(0);
      expect(DateNumberUtils.diffDays(2026, 2, 30, 2026, 3, 1)).assertEqual(0);
      expect(DateNumberUtils.diffDays(2026, 1, 1, 2026, 13, 1)).assertEqual(0);
      expect(DateNumberUtils.diffDays(2026, 0, 10, 2026, 1, 10)).assertEqual(0);
      expect(DateNumberUtils.diffDays(2026, 1, 32, 2026, 2, 1)).assertEqual(0);
      expect(DateNumberUtils.diffDays(2026, 2, 30, 2026, 2, 31)).assertEqual(0);
      const zero: number = DateNumberUtils.diffDays(2026, 5, 15, 2026, 5, 15);
      expect(zero).assertEqual(0);
      const invalid: number = DateNumberUtils.diffDays(2026, 2, 30, 2026, 3, 1);
      expect(invalid).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_1800
     * @tc.name      testDiffDays0002
     * @tc.desc      Verify diffDays returns exact negative values when the
     *                   to date precedes the from date across month and
     *                   year boundaries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDiffDays0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDiffDays0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.diffDays(2026, 12, 25, 2026, 11, 9)).assertEqual(-46);
      expect(DateNumberUtils.diffDays(2027, 1, 1, 2026, 1, 1)).assertEqual(-365);
      expect(DateNumberUtils.diffDays(2025, 1, 1, 2024, 1, 1)).assertEqual(-366);
      expect(DateNumberUtils.diffDays(2026, 3, 1, 2026, 2, 28)).assertEqual(-1);
      expect(DateNumberUtils.diffDays(2024, 3, 1, 2024, 2, 28)).assertEqual(-2);
      expect(DateNumberUtils.diffDays(2026, 1, 2, 2026, 1, 1)).assertEqual(-1);
      const negative: number = DateNumberUtils.diffDays(2027, 1, 1, 2026, 1, 1);
      expect(negative).assertEqual(-365);
      const mirror: number = DateNumberUtils.diffDays(2026, 12, 25, 2026, 11, 9);
      expect(mirror).assertEqual(-46);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_1900
     * @tc.name      testDiffDays0003
     * @tc.desc      Verify diffDays across February equals 29 in leap years
     *               and 28 in common years plus adjacent-day differences.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDiffDays0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDiffDays0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.diffDays(2024, 2, 1, 2024, 3, 1)).assertEqual(29);
      expect(DateNumberUtils.diffDays(2026, 2, 1, 2026, 3, 1)).assertEqual(28);
      expect(DateNumberUtils.diffDays(2024, 2, 28, 2024, 3, 1)).assertEqual(2);
      expect(DateNumberUtils.diffDays(2026, 2, 28, 2026, 3, 1)).assertEqual(1);
      expect(DateNumberUtils.diffDays(2000, 2, 28, 2000, 3, 1)).assertEqual(2);
      expect(DateNumberUtils.diffDays(1900, 2, 28, 1900, 3, 1)).assertEqual(1);
      const leapFeb: number = DateNumberUtils.diffDays(2024, 2, 1, 2024, 3, 1);
      expect(leapFeb).assertEqual(29);
      const commonFeb: number = DateNumberUtils.diffDays(2026, 2, 1, 2026, 3, 1);
      expect(commonFeb).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_2000
     * @tc.name      testDiffDays0004
     * @tc.desc      Verify diffDays over ten-year spans equals 3652 and 3653
     *               days depending on the number of included leap years.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDiffDays0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDiffDays0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.diffDays(2026, 1, 1, 2036, 1, 1)).assertEqual(3652);
      expect(DateNumberUtils.diffDays(2024, 1, 1, 2034, 1, 1)).assertEqual(3653);
      expect(DateNumberUtils.diffDays(2036, 1, 1, 2026, 1, 1)).assertEqual(-3652);
      expect(DateNumberUtils.diffDays(2000, 1, 1, 2010, 1, 1)).assertEqual(3653);
      expect(DateNumberUtils.diffDays(2100, 1, 1, 2110, 1, 1)).assertEqual(3652);
      const decade: number = DateNumberUtils.diffDays(2026, 1, 1, 2036, 1, 1);
      expect(decade).assertEqual(3652);
      const leapDecade: number = DateNumberUtils.diffDays(2024, 1, 1, 2034, 1, 1);
      expect(leapDecade).assertEqual(3653);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_2100
     * @tc.name      testFormatStamp0001
     * @tc.desc      Verify formatStamp renders midnight timestamps with
     *               zero-padded hours, minutes and seconds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatStamp0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatStamp0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const newYear: number = new Date(2026, 0, 1, 0, 0, 0).getTime();
      expect(DateNumberUtils.formatStamp(newYear)).assertEqual('2026-01-01 00:00:00');
      const leapMidnight: number = new Date(2024, 1, 29, 0, 0, 0).getTime();
      expect(DateNumberUtils.formatStamp(leapMidnight)).assertEqual('2024-02-29 00:00:00');
      const monthEnd: number = new Date(2026, 3, 30, 0, 0, 0).getTime();
      expect(DateNumberUtils.formatStamp(monthEnd)).assertEqual('2026-04-30 00:00:00');
      const text: string = DateNumberUtils.formatStamp(newYear);
      expect(text).assertContain('2026-01-01');
      expect(text).assertContain('00:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_2200
     * @tc.name      testFormatStamp0002
     * @tc.desc      Verify formatStamp at the last second of a day and of a
     *               year renders 23:59:59 with the full 19-character layout.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatStamp0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatStamp0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const lastSecond: number = new Date(2026, 11, 31, 23, 59, 59).getTime();
      const text: string = DateNumberUtils.formatStamp(lastSecond);
      expect(text).assertEqual('2026-12-31 23:59:59');
      expect(text.length).assertEqual(19);
      expect(text.charAt(11)).assertEqual('2');
      expect(text.charAt(12)).assertEqual('3');
      expect(text.charAt(14)).assertEqual('5');
      expect(text.charAt(17)).assertEqual('5');
      expect(text).assertContain('23:59:59');
      const otherNight: number = new Date(2024, 6, 15, 23, 59, 59).getTime();
      expect(DateNumberUtils.formatStamp(otherNight)).assertEqual('2024-07-15 23:59:59');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_2300
     * @tc.name      testFormatStamp0003
     * @tc.desc      Verify formatStamp pads single-digit month, day, hour,
     *               minute and second values with leading zeros.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatStamp0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatStamp0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const noon: number = new Date(2026, 5, 15, 12, 0, 0).getTime();
      expect(DateNumberUtils.formatStamp(noon)).assertEqual('2026-06-15 12:00:00');
      const early: number = new Date(2024, 1, 29, 6, 7, 8).getTime();
      expect(DateNumberUtils.formatStamp(early)).assertEqual('2024-02-29 06:07:08');
      const single: number = new Date(2026, 0, 5, 7, 8, 9).getTime();
      expect(DateNumberUtils.formatStamp(single)).assertEqual('2026-01-05 07:08:09');
      const mixed: number = new Date(2026, 8, 3, 9, 5, 1).getTime();
      expect(DateNumberUtils.formatStamp(mixed)).assertEqual('2026-09-03 09:05:01');
      const padded: string = DateNumberUtils.formatStamp(early);
      expect(padded).assertContain('06:07:08');
      expect(padded).assertContain('2024-02-29');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_2400
     * @tc.name      testFormatStamp0004
     * @tc.desc      Verify formatStamp places separators exactly at offsets
     *               4, 7, 10, 13 and 16 inside the 19-character output.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatStamp0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFormatStamp0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const stamp: number = new Date(2026, 5, 15, 12, 34, 56).getTime();
      const text: string = DateNumberUtils.formatStamp(stamp);
      expect(text).assertEqual('2026-06-15 12:34:56');
      expect(text.length).assertEqual(19);
      expect(text.charAt(4)).assertEqual('-');
      expect(text.charAt(7)).assertEqual('-');
      expect(text.charAt(10)).assertEqual(' ');
      expect(text.charAt(13)).assertEqual(':');
      expect(text.charAt(16)).assertEqual(':');
      expect(text).assertContain('2026');
      expect(text).assertContain('12:34:56');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_2500
     * @tc.name      testDayOfWeek0001
     * @tc.desc      Verify dayOfWeek returns -1 for invalid dates of every
     *               invalidity class including the common-year leap day.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDayOfWeek0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDayOfWeek0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.dayOfWeek(2026, 2, 29)).assertEqual(-1);
      expect(DateNumberUtils.dayOfWeek(2026, 0, 1)).assertEqual(-1);
      expect(DateNumberUtils.dayOfWeek(2026, 13, 1)).assertEqual(-1);
      expect(DateNumberUtils.dayOfWeek(2026, 1, 32)).assertEqual(-1);
      expect(DateNumberUtils.dayOfWeek(2026, 1, 0)).assertEqual(-1);
      expect(DateNumberUtils.dayOfWeek(1900, 2, 29)).assertEqual(-1);
      expect(DateNumberUtils.dayOfWeek(2100, 2, 29)).assertEqual(-1);
      expect(DateNumberUtils.dayOfWeek(2026, 4, 31)).assertEqual(-1);
      const invalid: number = DateNumberUtils.dayOfWeek(2026, 2, 29);
      expect(invalid).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_2600
     * @tc.name      testDayOfWeek0002
     * @tc.desc      Verify dayOfWeek is invariant after shifting a known
     *               Monday by exactly seven days through addDays.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDayOfWeek0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDayOfWeek0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.dayOfWeek(2026, 11, 9)).assertEqual(1);
      const shifted: string = DateNumberUtils.addDays(2026, 11, 9, 7);
      expect(shifted).assertEqual('2026-11-16');
      expect(DateNumberUtils.dayOfWeek(2026, 11, 16)).assertEqual(1);
      expect(DateNumberUtils.dayOfWeek(2026, 11, 15)).assertEqual(0);
      expect(DateNumberUtils.dayOfWeek(2026, 11, 14)).assertEqual(6);
      expect(DateNumberUtils.dayOfWeek(2026, 11, 10)).assertEqual(2);
      const monday: number = DateNumberUtils.dayOfWeek(2026, 11, 9);
      expect(monday).assertEqual(1);
      const nextMonday: number = DateNumberUtils.dayOfWeek(2026, 11, 16);
      expect(nextMonday).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_2700
     * @tc.name      testDayOfWeek0003
     * @tc.desc      Verify dayOfWeek maps the weekend of November 2026 to 0
     *               for Sunday and 6 for Saturday.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDayOfWeek0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDayOfWeek0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.dayOfWeek(2026, 11, 15)).assertEqual(0);
      expect(DateNumberUtils.dayOfWeek(2026, 11, 22)).assertEqual(0);
      expect(DateNumberUtils.dayOfWeek(2026, 11, 14)).assertEqual(6);
      expect(DateNumberUtils.dayOfWeek(2026, 11, 21)).assertEqual(6);
      expect(DateNumberUtils.dayOfWeek(2026, 11, 13)).assertEqual(5);
      expect(DateNumberUtils.dayOfWeek(2026, 11, 12)).assertEqual(4);
      expect(DateNumberUtils.dayOfWeek(2026, 11, 11)).assertEqual(3);
      expect(DateNumberUtils.dayOfWeek(2026, 11, 10)).assertEqual(2);
      const sunday: number = DateNumberUtils.dayOfWeek(2026, 11, 15);
      expect(sunday).assertEqual(0);
      const saturday: number = DateNumberUtils.dayOfWeek(2026, 11, 14);
      expect(saturday).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_2800
     * @tc.name      testDayOfWeek0004
     * @tc.desc      Verify dayOfWeek walks the first January week of 2026
     *               from Thursday through the following Wednesday.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDayOfWeek0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDayOfWeek0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.dayOfWeek(2026, 1, 1)).assertEqual(4);
      expect(DateNumberUtils.dayOfWeek(2026, 1, 2)).assertEqual(5);
      expect(DateNumberUtils.dayOfWeek(2026, 1, 3)).assertEqual(6);
      expect(DateNumberUtils.dayOfWeek(2026, 1, 4)).assertEqual(0);
      expect(DateNumberUtils.dayOfWeek(2026, 1, 5)).assertEqual(1);
      expect(DateNumberUtils.dayOfWeek(2026, 1, 6)).assertEqual(2);
      expect(DateNumberUtils.dayOfWeek(2026, 1, 7)).assertEqual(3);
      expect(DateNumberUtils.dayOfWeek(2026, 1, 8)).assertEqual(4);
      const thursday: number = DateNumberUtils.dayOfWeek(2026, 1, 1);
      expect(thursday).assertEqual(4);
      const nextThursday: number = DateNumberUtils.dayOfWeek(2026, 1, 8);
      expect(nextThursday).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_2900
     * @tc.name      testIsValidDate0005
     * @tc.desc      Verify dayOfYear agrees with isValidDate by returning -1
     *               for invalid dates and exact ordinals for valid ones.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsValidDate0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIsValidDate0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.dayOfYear(2026, 1, 1)).assertEqual(1);
      expect(DateNumberUtils.dayOfYear(2026, 12, 31)).assertEqual(365);
      expect(DateNumberUtils.dayOfYear(2024, 12, 31)).assertEqual(366);
      expect(DateNumberUtils.dayOfYear(2024, 2, 29)).assertEqual(60);
      expect(DateNumberUtils.dayOfYear(2026, 2, 29)).assertEqual(-1);
      expect(DateNumberUtils.dayOfYear(2026, 13, 1)).assertEqual(-1);
      expect(DateNumberUtils.dayOfYear(2026, 0, 5)).assertEqual(-1);
      expect(DateNumberUtils.dayOfYear(2026, 1, 32)).assertEqual(-1);
      expect(DateNumberUtils.isValidDate(2024, 2, 29)).assertTrue();
      expect(DateNumberUtils.isValidDate(2026, 2, 29)).assertFalse();
      const leapOrdinal: number = DateNumberUtils.dayOfYear(2024, 2, 29);
      expect(leapOrdinal).assertEqual(60);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_3000
     * @tc.name      testAddDays0009
     * @tc.desc      Verify addDays and diffDays form a consistent round trip
     *               for a positive and the matching negative shift.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAddDays0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testAddDays0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const forward: string = DateNumberUtils.addDays(2026, 5, 15, 40);
      expect(forward).assertEqual('2026-06-24');
      expect(DateNumberUtils.diffDays(2026, 5, 15, 2026, 6, 24)).assertEqual(40);
      const backward: string = DateNumberUtils.addDays(2026, 6, 24, -40);
      expect(backward).assertEqual('2026-05-15');
      expect(DateNumberUtils.diffDays(2026, 6, 24, 2026, 5, 15)).assertEqual(-40);
      const longHop: string = DateNumberUtils.addDays(2026, 11, 9, 46);
      expect(longHop).assertEqual('2026-12-25');
      expect(DateNumberUtils.diffDays(2026, 11, 9, 2026, 12, 25)).assertEqual(46);
      const roundTrip: string = DateNumberUtils.addDays(2026, 6, 24, -40);
      expect(roundTrip).assertContain('2026-05-15');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_3100
     * @tc.name      testDaysInMonth0003
     * @tc.desc      Verify the twelve monthly lengths sum to 365 for a
     *               common year and 366 for a leap year.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDaysInMonth0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDaysInMonth0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let commonTotal: number = 0;
      let m1: number = 1;
      while (m1 <= 12) {
        commonTotal = commonTotal + DateNumberUtils.daysInMonth(2026, m1);
        m1 = m1 + 1;
      }
      expect(commonTotal).assertEqual(365);
      let leapTotal: number = 0;
      let m2: number = 1;
      while (m2 <= 12) {
        leapTotal = leapTotal + DateNumberUtils.daysInMonth(2024, m2);
        m2 = m2 + 1;
      }
      expect(leapTotal).assertEqual(366);
      expect(DateNumberUtils.daysInMonth(2026, 4)).assertEqual(30);
      expect(DateNumberUtils.daysInMonth(2026, 9)).assertEqual(30);
      expect(DateNumberUtils.daysInMonth(2026, 11)).assertEqual(30);
      expect(DateNumberUtils.daysInMonth(2026, 6)).assertEqual(30);
      expect(DateNumberUtils.daysInMonth(2024, 2)).assertEqual(29);
      expect(DateNumberUtils.daysInMonth(2026, 2)).assertEqual(28);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_3200
     * @tc.name      testIsValidDate0006
     * @tc.desc      Verify isValidDate accepts exactly the last day of every
     *               month of a common year and rejects the day after it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsValidDate0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIsValidDate0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let m: number = 1;
      while (m <= 12) {
        const lastDay: number = DateNumberUtils.daysInMonth(2026, m);
        expect(DateNumberUtils.isValidDate(2026, m, lastDay)).assertTrue();
        expect(DateNumberUtils.isValidDate(2026, m, lastDay + 1)).assertFalse();
        m = m + 1;
      }
      expect(DateNumberUtils.isValidDate(2026, 4, 31)).assertFalse();
      expect(DateNumberUtils.isValidDate(2026, 9, 31)).assertFalse();
      expect(DateNumberUtils.isValidDate(2026, 6, 31)).assertFalse();
      expect(DateNumberUtils.isValidDate(2026, 11, 31)).assertFalse();
      expect(DateNumberUtils.isValidDate(2026, 1, 1)).assertTrue();
      expect(DateNumberUtils.isValidDate(2026, 12, 31)).assertTrue();
      expect(DateNumberUtils.isValidDate(2024, 2, 29)).assertTrue();
      const last: number = DateNumberUtils.daysInMonth(2026, 7);
      expect(last).assertEqual(31);
      expect(DateNumberUtils.isValidDate(2026, 7, 31)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_DTEX_3300
     * @tc.name      testIsLeapYear0003
     * @tc.desc      Verify isLeapYear across the 2096..2104 cycle around the
     *               common century year 2100 and the leap centuries 1600 and
     *               2000.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsLeapYear0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIsLeapYear0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateNumberUtils.isLeapYear(2096)).assertTrue();
      expect(DateNumberUtils.isLeapYear(2097)).assertFalse();
      expect(DateNumberUtils.isLeapYear(2098)).assertFalse();
      expect(DateNumberUtils.isLeapYear(2099)).assertFalse();
      expect(DateNumberUtils.isLeapYear(2100)).assertFalse();
      expect(DateNumberUtils.isLeapYear(2101)).assertFalse();
      expect(DateNumberUtils.isLeapYear(2102)).assertFalse();
      expect(DateNumberUtils.isLeapYear(2103)).assertFalse();
      expect(DateNumberUtils.isLeapYear(2104)).assertTrue();
      expect(DateNumberUtils.isLeapYear(1600)).assertTrue();
      expect(DateNumberUtils.isLeapYear(2000)).assertTrue();
      expect(DateNumberUtils.isLeapYear(1999)).assertFalse();
      expect(DateNumberUtils.isLeapYear(2001)).assertFalse();
      const century: boolean = DateNumberUtils.isLeapYear(2100);
      expect(century).assertFalse();
      const quad: boolean = DateNumberUtils.isLeapYear(2104);
      expect(quad).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
