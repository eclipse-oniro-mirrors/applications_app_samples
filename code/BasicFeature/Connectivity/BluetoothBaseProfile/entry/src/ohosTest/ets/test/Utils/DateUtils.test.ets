/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import { DateUtils } from 'library';

const SAMPLE: Date = new Date(2024, 0, 5, 8, 9, 10, 0);

/**
 * Test suite for DateUtils.
 * @since 26.0.0
 */
export default function dateUtilsTest(): void {
  describe('DateUtilsTest', () => {
    // ==================== timestamp format (4 cases) ====================

    /*
     * @tc.number: SUB_DATE_UTILS_0100
     * @tc.name: testDateUtils0001
     * @tc.desc: Format a timestamp with the default date and time pattern.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0001', 0, () => {
      const text: string = DateUtils.formatTimestamp(SAMPLE.getTime());
      expect(text).assertEqual('2024-01-05 08:09:10');
      expect(text.length).assertEqual(19);
      expect(text.charAt(4)).assertEqual('-');
      expect(text.charAt(10)).assertEqual(' ');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_0200
     * @tc.name: testDateUtils0002
     * @tc.desc: Format a timestamp with a caller supplied pattern.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0002', 0, () => {
      expect(DateUtils.formatTimestamp(SAMPLE.getTime(), 'yyyy/MM/dd')).assertEqual('2024/01/05');
      expect(DateUtils.formatTimestamp(SAMPLE.getTime(), 'HH:mm')).assertEqual('08:09');
      expect(DateUtils.formatTimestamp(SAMPLE.getTime(), 'dd-MM-yyyy')).assertEqual('05-01-2024');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_0300
     * @tc.name: testDateUtils0003
     * @tc.desc: Pad single digit month, day, hour and minute fields.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0003', 0, () => {
      const early: Date = new Date(2024, 1, 3, 1, 2, 3, 0);
      const text: string = DateUtils.formatTimestamp(early.getTime());
      expect(text).assertEqual('2024-02-03 01:02:03');
      expect(text.indexOf('-02-03') > 0).assertTrue();
      expect(DateUtils.formatTimestamp(early.getTime(), 'yyyy')).assertEqual('2024');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_0400
     * @tc.name: testDateUtils0004
     * @tc.desc: Format the epoch timestamp and a negative timestamp.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0004', 0, () => {
      const epoch: string = DateUtils.formatTimestamp(0, 'HH:mm:ss');
      expect(epoch.length).assertEqual(8);
      expect(epoch.charAt(2)).assertEqual(':');
      expect(epoch.charAt(5)).assertEqual(':');
      const before: string = DateUtils.formatTimestamp(-1000, 'ss');
      expect(before.length).assertEqual(2);
    });

    // ==================== current time and difference value (3 cases) ====================

    /*
     * @tc.number: SUB_DATE_UTILS_0500
     * @tc.name: testDateUtils0005
     * @tc.desc: Return the current time close to the system clock.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0005', 0, () => {
      const before: number = Date.now();
      const value: number = DateUtils.now();
      const after: number = Date.now();
      expect(value >= before).assertTrue();
      expect(value <= after + 1).assertTrue();
      expect(DateUtils.now() >= value).assertTrue();
      expect(Number.isInteger(value)).assertTrue();
    });

    /*
     * @tc.number: SUB_DATE_UTILS_0600
     * @tc.name: testDateUtils0006
     * @tc.desc: Measure the absolute distance between two timestamps.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0006', 0, () => {
      expect(DateUtils.diff(1000, 3500)).assertEqual(2500);
      expect(DateUtils.diff(3500, 1000)).assertEqual(2500);
      expect(DateUtils.diff(7, 7)).assertEqual(0);
    });

    /*
     * @tc.number: SUB_DATE_UTILS_0700
     * @tc.name: testDateUtils0007
     * @tc.desc: Keep diff monotonic for large timestamp distances.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0007', 0, () => {
      const day: number = 86400000;
      expect(DateUtils.diff(0, day)).assertEqual(day);
      expect(DateUtils.diff(day, day * 7)).assertEqual(day * 6);
      expect(DateUtils.diff(-day, day) > day).assertTrue();
    });

    // ==================== time length format (4 cases) ====================

    /*
     * @tc.number: SUB_DATE_UTILS_0800
     * @tc.name: testDateUtils0008
     * @tc.desc: Format durations below one minute as whole seconds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0008', 0, () => {
      expect(DateUtils.formatDuration(0)).assertEqual('0s');
      expect(DateUtils.formatDuration(999)).assertEqual('0s');
      expect(DateUtils.formatDuration(1000)).assertEqual('1s');
      expect(DateUtils.formatDuration(59999)).assertEqual('59s');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_0900
     * @tc.name: testDateUtils0009
     * @tc.desc: Format durations of minutes with the remaining seconds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0009', 0, () => {
      expect(DateUtils.formatDuration(60000)).assertEqual('1m 0s');
      expect(DateUtils.formatDuration(90000)).assertEqual('1m 30s');
      expect(DateUtils.formatDuration(3599999)).assertEqual('59m 59s');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_1000
     * @tc.name: testDateUtils0010
     * @tc.desc: Format durations of hours and days with the reduced fields.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0010', 0, () => {
      expect(DateUtils.formatDuration(3600000)).assertEqual('1h 0m 0s');
      expect(DateUtils.formatDuration(3661000)).assertEqual('1h 1m 1s');
      expect(DateUtils.formatDuration(86400000)).assertEqual('1d 0h 0m');
      expect(DateUtils.formatDuration(90061000)).assertEqual('1d 1h 1m');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_1100
     * @tc.name: testDateUtils0011
     * @tc.desc: Clamp a negative duration to the zero second text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0011', 0, () => {
      expect(DateUtils.formatDuration(-1)).assertEqual('0s');
      expect(DateUtils.formatDuration(-100000)).assertEqual('0s');
      expect(DateUtils.formatDuration(-1)).assertEqual(DateUtils.formatDuration(0));
    });

    // ==================== month copy and star period name name (3 cases) ====================

    /*
     * @tc.number: SUB_DATE_UTILS_1200
     * @tc.name: testDateUtils0012
     * @tc.desc: Resolve month names for the first and last valid index.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0012', 0, () => {
      expect(DateUtils.getMonthName(0)).assertEqual('January');
      expect(DateUtils.getMonthName(11)).assertEqual('December');
      expect(DateUtils.getMonthName(1)).assertEqual('February');
      expect(DateUtils.getMonthName(6)).assertEqual('July');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_1300
     * @tc.name: testDateUtils0013
     * @tc.desc: Return Unknown for month indexes outside the range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0013', 0, () => {
      expect(DateUtils.getMonthName(-1)).assertEqual('Unknown');
      expect(DateUtils.getMonthName(12)).assertEqual('Unknown');
      expect(DateUtils.getMonthName(100)).assertEqual('Unknown');
      expect(DateUtils.getMonthName(11).length > 0).assertTrue();
    });

    /*
     * @tc.number: SUB_DATE_UTILS_1400
     * @tc.name: testDateUtils0014
     * @tc.desc: Resolve day names by index and reject out of range indexes.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0014', 0, () => {
      expect(DateUtils.getDayName(0)).assertEqual('Sunday');
      expect(DateUtils.getDayName(6)).assertEqual('Saturday');
      expect(DateUtils.getDayName(1)).assertEqual('Monday');
      expect(DateUtils.getDayName(7)).assertEqual('Unknown');
      expect(DateUtils.getDayName(-1)).assertEqual('Unknown');
    });

    // ==================== today and yesterday (3 cases) ====================

    /*
     * @tc.number: SUB_DATE_UTILS_1500
     * @tc.name: testDateUtils0015
     * @tc.desc: Recognize the current moment as today and not as yesterday.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0015', 0, () => {
      const noon: Date = new Date();
      noon.setHours(12, 0, 0, 0);
      expect(DateUtils.isToday(noon.getTime())).assertTrue();
      expect(DateUtils.isYesterday(noon.getTime())).assertFalse();
      expect(DateUtils.isToday(DateUtils.now())).assertTrue();
    });

    /*
     * @tc.number: SUB_DATE_UTILS_1600
     * @tc.name: testDateUtils0016
     * @tc.desc: Recognize the previous calendar day as yesterday.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0016', 0, () => {
      const yesterday: Date = new Date();
      yesterday.setDate(yesterday.getDate() - 1);
      yesterday.setHours(12, 0, 0, 0);
      expect(DateUtils.isYesterday(yesterday.getTime())).assertTrue();
      expect(DateUtils.isToday(yesterday.getTime())).assertFalse();
      const twoDaysBack: Date = new Date();
      twoDaysBack.setDate(twoDaysBack.getDate() - 2);
      twoDaysBack.setHours(12, 0, 0, 0);
      expect(DateUtils.isYesterday(twoDaysBack.getTime())).assertFalse();
    });

    /*
     * @tc.number: SUB_DATE_UTILS_1700
     * @tc.name: testDateUtils0017
     * @tc.desc: Reject future timestamps and the epoch day for today checks.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0017', 0, () => {
      const future: number = DateUtils.now() + 86400000;
      expect(DateUtils.isToday(future)).assertFalse();
      expect(DateUtils.isToday(0)).assertFalse();
      expect(DateUtils.isYesterday(0)).assertFalse();
    });

    // ==================== relative time (3 cases) ====================

    /*
     * @tc.number: SUB_DATE_UTILS_1800
     * @tc.name: testDateUtils0018
     * @tc.desc: Describe a recent timestamp as just now.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0018', 0, () => {
      expect(DateUtils.getRelativeTime(DateUtils.now())).assertEqual('just now');
      expect(DateUtils.getRelativeTime(DateUtils.now() - 30000)).assertEqual('just now');
      expect(DateUtils.getRelativeTime(DateUtils.now()).indexOf('now') > 0).assertTrue();
    });

    /*
     * @tc.number: SUB_DATE_UTILS_1900
     * @tc.name: testDateUtils0019
     * @tc.desc: Describe minute and hour offsets with the rounded unit count.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0019', 0, () => {
      const now: number = DateUtils.now();
      expect(DateUtils.getRelativeTime(now - 5 * 60000)).assertEqual('5 minutes ago');
      expect(DateUtils.getRelativeTime(now - 61 * 60000)).assertEqual('1 hours ago');
      expect(DateUtils.getRelativeTime(now - 2 * 3600000)).assertEqual('2 hours ago');
    });

    /*
     * @tc.number: SUB_DATE_UTILS_2000
     * @tc.name: testDateUtils0020
     * @tc.desc: Describe day offsets and fall back to a date for old timestamps.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0020', 0, () => {
      const now: number = DateUtils.now();
      expect(DateUtils.getRelativeTime(now - 3 * 86400000)).assertEqual('3 days ago');
      const oldText: string = DateUtils.getRelativeTime(now - 40 * 86400000);
      expect(oldText.length).assertEqual(10);
      expect(oldText.charAt(4)).assertEqual('-');
      expect(oldText.indexOf('ago') < 0).assertTrue();
    });

    // ==================== leap year and month day number (3 cases) ====================

    /*
     * @tc.number: SUB_DATE_UTILS_2100
     * @tc.name: testDateUtils0021
     * @tc.desc: Detect leap years by the four hundred year rule.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0021', 0, () => {
      expect(DateUtils.isLeapYear(2024)).assertTrue();
      expect(DateUtils.isLeapYear(2000)).assertTrue();
      expect(DateUtils.isLeapYear(1900)).assertFalse();
      expect(DateUtils.isLeapYear(2023)).assertFalse();
    });

    /*
     * @tc.number: SUB_DATE_UTILS_2200
     * @tc.name: testDateUtils0022
     * @tc.desc: Return the days of February for leap and common years.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0022', 0, () => {
      expect(DateUtils.getDaysInMonth(2024, 1)).assertEqual(29);
      expect(DateUtils.getDaysInMonth(2023, 1)).assertEqual(28);
      expect(DateUtils.getDaysInMonth(2000, 1)).assertEqual(29);
      expect(DateUtils.getDaysInMonth(1900, 1)).assertEqual(28);
    });

    /*
     * @tc.number: SUB_DATE_UTILS_2300
     * @tc.name: testDateUtils0023
     * @tc.desc: Return the calendar length of each other month.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0023', 0, () => {
      expect(DateUtils.getDaysInMonth(2024, 0)).assertEqual(31);
      expect(DateUtils.getDaysInMonth(2024, 3)).assertEqual(30);
      expect(DateUtils.getDaysInMonth(2024, 11)).assertEqual(31);
      const sum: number = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
        .reduce((acc: number, month: number): number => acc + DateUtils.getDaysInMonth(2023, month), 0);
      expect(sum).assertEqual(365);
    });

    // ==================== day period add subtract (5 cases) ====================

    /*
     * @tc.number: SUB_DATE_UTILS_2400
     * @tc.name: testDateUtils0024
     * @tc.desc: Add days without mutating the source date.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0024', 0, () => {
      const shifted: Date = DateUtils.addDays(SAMPLE, 3);
      expect(shifted.getDate()).assertEqual(8);
      expect(shifted.getMonth()).assertEqual(0);
      expect(SAMPLE.getDate()).assertEqual(5);
      expect(shifted.getTime() - SAMPLE.getTime()).assertEqual(3 * 86400000);
    });

    /*
     * @tc.number: SUB_DATE_UTILS_2500
     * @tc.name: testDateUtils0025
     * @tc.desc: Roll the month and year boundary when adding days.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0025', 0, () => {
      const endOfMonth: Date = new Date(2024, 0, 31, 12, 0, 0, 0);
      const next: Date = DateUtils.addDays(endOfMonth, 1);
      expect(next.getMonth()).assertEqual(1);
      expect(next.getDate()).assertEqual(1);
      const endOfYear: Date = DateUtils.addDays(new Date(2024, 11, 31, 12, 0, 0, 0), 1);
      expect(endOfYear.getFullYear()).assertEqual(2025);
      expect(endOfYear.getMonth()).assertEqual(0);
    });

    /*
     * @tc.number: SUB_DATE_UTILS_2600
     * @tc.name: testDateUtils0026
     * @tc.desc: Subtract days and hours to move a date backwards.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0026', 0, () => {
      const back: Date = DateUtils.addDays(SAMPLE, -2);
      expect(back.getDate()).assertEqual(3);
      expect(back.getMonth()).assertEqual(0);
      const hoursBack: Date = DateUtils.addHours(SAMPLE, -9);
      expect(hoursBack.getDate()).assertEqual(4);
      expect(hoursBack.getHours()).assertEqual(23);
    });

    /*
     * @tc.number: SUB_DATE_UTILS_2700
     * @tc.name: testDateUtils0027
     * @tc.desc: Add hours across the day boundary keeping minutes untouched.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0027', 0, () => {
      const shifted: Date = DateUtils.addHours(SAMPLE, 20);
      expect(shifted.getDate()).assertEqual(6);
      expect(shifted.getHours()).assertEqual(4);
      expect(shifted.getMinutes()).assertEqual(9);
      expect(SAMPLE.getHours()).assertEqual(8);
    });

    /*
     * @tc.number: SUB_DATE_UTILS_2800
     * @tc.name: testDateUtils0028
     * @tc.desc: Add minutes across the hour boundary and a zero shift.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0028', 0, () => {
      const shifted: Date = DateUtils.addMinutes(SAMPLE, 55);
      expect(shifted.getHours()).assertEqual(9);
      expect(shifted.getMinutes()).assertEqual(4);
      const identity: Date = DateUtils.addMinutes(SAMPLE, 0);
      expect(identity.getTime()).assertEqual(SAMPLE.getTime());
      expect(identity !== SAMPLE).assertTrue();
    });

    // ==================== day start and end (2 cases) ====================

    /*
     * @tc.number: SUB_DATE_UTILS_2900
     * @tc.name: testDateUtils0029
     * @tc.desc: Cut the day start at midnight and the day end at the last millisecond.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testDateUtils0029', 0, () => {
      const start: number = DateUtils.getStartOfDay(SAMPLE);
      const end: number = DateUtils.getEndOfDay(SAMPLE);
      const startOfDay: Date = new Date(start);
      const endOfDay: Date = new Date(end);
      expect(startOfDay.getHours()).assertEqual(0);
      expect(startOfDay.getMinutes()).assertEqual(0);
      expect(startOfDay.getSeconds()).assertEqual(0);
      expect(endOfDay.getHours()).assertEqual(23);
      expect(endOfDay.getMinutes()).assertEqual(59);
      expect(endOfDay.getMilliseconds()).assertEqual(999);
    });

    /*
     * @tc.number: SUB_DATE_UTILS_3000
     * @tc.name: testDateUtils0030
     * @tc.desc: Keep the day span length and leave the source date unchanged.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testDateUtils0030', 0, () => {
      const snapshot: number = SAMPLE.getTime();
      const start: number = DateUtils.getStartOfDay(SAMPLE);
      const end: number = DateUtils.getEndOfDay(SAMPLE);
      expect(end - start).assertEqual(86399999);
      expect(SAMPLE.getTime()).assertEqual(snapshot);
      expect(end > start).assertTrue();
      expect(DateUtils.getStartOfDay(new Date(start))).assertEqual(start);
    });
  });
}
