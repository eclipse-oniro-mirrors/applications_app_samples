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
import { DateUtils } from 'photopickersendable';
import { hilog } from '@kit.PerformanceAnalysisKit';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;
/** Milliseconds of one minute, reused by the relative time checks. */
const MS_PER_MINUTE: number = 60000;
/** Milliseconds of one hour, reused by the calendar arithmetic checks. */
const MS_PER_HOUR: number = 3600000;
/** Milliseconds of one day, reused by the calendar arithmetic checks. */
const MS_PER_DAY: number = 86400000;
/** Shifted offset that stays inside the minute window of relativeTime. */
const HALF_MINUTE: number = 30000;
/** Offset of two minutes used by the relative time checks. */
const TWO_MINUTES: number = 120000;
/** Offset just below one hour used by the relative time checks. */
const JUST_UNDER_HOUR: number = 3590000;
/** Offset just above one hour used by the relative time checks. */
const JUST_OVER_HOUR: number = 3700000;
/** Offset of two hours plus slack used by the relative time checks. */
const TWO_HOURS_SLACK: number = 7300000;
/** Offset of about two days used by the relative time checks. */
const TWO_DAYS_SLACK: number = 173000000;
/** Offset of about seven days used by the relative time checks. */
const SIX_DAYS_SLACK: number = 600000000;
/** Offset of about two months used by the relative time checks. */
const TWO_MONTHS_SLACK: number = 5000000000;
/** Future offset of about one month used by the relative time checks. */
const ONE_MONTH_AHEAD: number = 2500000000;

/**
 * Registers the calendar matrix cases of every date helper of the shared
 * library. Date inputs are built from local Date constructors so the
 * expectations stay stable in any device time zone, and the relative time
 * offsets keep a large slack against the internal Date.now call.
 */
export default function dateUtilsMatrixTest() {
  describe('DateUtilsMatrixTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_0100
     * @tc.name      testDateMatrix0001
     * @tc.desc      Verify formatDate renders zero padded year, month and
     *               day fields including the leap day.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const midJanuary: number = new Date(2026, 0, 15, 9, 30, 0).getTime();
      expect(DateUtils.formatDate(midJanuary)).assertEqual('2026-01-15');
      const yearEnd: number = new Date(2026, 11, 31, 22, 0, 0).getTime();
      expect(DateUtils.formatDate(yearEnd)).assertEqual('2026-12-31');
      const leapDay: number = new Date(2024, 1, 29, 12, 0, 0).getTime();
      expect(DateUtils.formatDate(leapDay)).assertEqual('2024-02-29');
      const nonLeap: number = new Date(2023, 1, 28, 12, 0, 0).getTime();
      expect(DateUtils.formatDate(nonLeap)).assertEqual('2023-02-28');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_0200
     * @tc.name      testDateMatrix0002
     * @tc.desc      Verify formatDate keeps the century boundary and single
     *               digit month and day fields correctly padded.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateMatrix0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const beforeCentury: number = new Date(1999, 11, 31, 12, 0, 0).getTime();
      expect(DateUtils.formatDate(beforeCentury)).assertEqual('1999-12-31');
      const afterCentury: number = new Date(2000, 0, 1, 12, 0, 0).getTime();
      expect(DateUtils.formatDate(afterCentury)).assertEqual('2000-01-01');
      const earlyMarch: number = new Date(2025, 2, 5, 8, 0, 0).getTime();
      expect(DateUtils.formatDate(earlyMarch)).assertEqual('2025-03-05');
      const midYear: number = new Date(2027, 5, 10, 8, 0, 0).getTime();
      expect(DateUtils.formatDate(midYear)).assertEqual('2027-06-10');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_0300
     * @tc.name      testDateMatrix0003
     * @tc.desc      Verify formatTime renders zero padded hour, minute and
     *               second fields across the daily range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateMatrix0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const midnight: number = new Date(2026, 5, 15, 0, 0, 0).getTime();
      expect(DateUtils.formatTime(midnight)).assertEqual('00:00:00');
      const lastSecond: number = new Date(2026, 5, 15, 23, 59, 59).getTime();
      expect(DateUtils.formatTime(lastSecond)).assertEqual('23:59:59');
      const noonish: number = new Date(2026, 5, 15, 12, 34, 56).getTime();
      expect(DateUtils.formatTime(noonish)).assertEqual('12:34:56');
      const earlyMorning: number = new Date(2026, 5, 15, 1, 2, 3).getTime();
      expect(DateUtils.formatTime(earlyMorning)).assertEqual('01:02:03');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_0400
     * @tc.name      testDateMatrix0004
     * @tc.desc      Verify formatDateTime joins the date and time parts with
     *               one space and equals the concatenated helpers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateMatrix0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const instant: number = new Date(2026, 5, 20, 14, 8, 9).getTime();
      expect(DateUtils.formatDateTime(instant)).assertEqual('2026-06-20 14:08:09');
      expect(DateUtils.formatDateTime(instant)).assertEqual(
        DateUtils.formatDate(instant) + ' ' + DateUtils.formatTime(instant));
      const morning: number = new Date(2026, 0, 2, 3, 4, 5).getTime();
      expect(DateUtils.formatDateTime(morning)).assertEqual('2026-01-02 03:04:05');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_0500
     * @tc.name      testDateMatrix0005
     * @tc.desc      Verify formatDateTime keeps the year end, year start and
     *               month end boundaries stable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateMatrix0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const yearEnd: number = new Date(2026, 11, 31, 23, 59, 59).getTime();
      expect(DateUtils.formatDateTime(yearEnd)).assertEqual('2026-12-31 23:59:59');
      const yearStart: number = new Date(2027, 0, 1, 0, 0, 1).getTime();
      expect(DateUtils.formatDateTime(yearStart)).assertEqual('2027-01-01 00:00:01');
      const monthEnd: number = new Date(2026, 3, 30, 12, 0, 0).getTime();
      expect(DateUtils.formatDateTime(monthEnd)).assertEqual('2026-04-30 12:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_0600
     * @tc.name      testDateMatrix0006
     * @tc.desc      Verify dayStart moves an instant to the local midnight
     *               of the same calendar day.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateMatrix0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = new Date(2026, 5, 15, 10, 30, 45, 500).getTime();
      const start: number = DateUtils.dayStart(base);
      expect(DateUtils.formatTime(start)).assertEqual('00:00:00');
      expect(DateUtils.formatDate(start)).assertEqual(DateUtils.formatDate(base));
      expect(start).assertLess(base);
      expect(DateUtils.dayStart(new Date(2026, 11, 31, 23, 59, 59).getTime()))
        .assertEqual(new Date(2026, 11, 31).getTime());
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_0700
     * @tc.name      testDateMatrix0007
     * @tc.desc      Verify dayStart is idempotent so a second call keeps the
     *               same midnight instant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateMatrix0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = new Date(2026, 2, 8, 18, 45, 12).getTime();
      const first: number = DateUtils.dayStart(base);
      const second: number = DateUtils.dayStart(first);
      expect(second).assertEqual(first);
      expect(DateUtils.dayStart(new Date(2026, 2, 8).getTime())).assertEqual(first);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_0800
     * @tc.name      testDateMatrix0008
     * @tc.desc      Verify dayEnd lands on the last millisecond of the day
     *               and formats as twenty three fifty nine fifty nine.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateMatrix0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = new Date(2026, 5, 15, 10, 30, 45).getTime();
      const start: number = DateUtils.dayStart(base);
      const end: number = DateUtils.dayEnd(base);
      expect(end - start).assertEqual(MS_PER_DAY - 1);
      expect(DateUtils.formatTime(end)).assertEqual('23:59:59');
      expect(DateUtils.formatDate(end)).assertEqual(DateUtils.formatDate(base));
      expect(end).assertLarger(base);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_0900
     * @tc.name      testDateMatrix0009
     * @tc.desc      Verify dayEnd is idempotent and equals the day end of
     *               the day start of the same instant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateMatrix0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = new Date(2026, 8, 21, 6, 15, 0).getTime();
      const end: number = DateUtils.dayEnd(base);
      expect(DateUtils.dayEnd(end)).assertEqual(end);
      expect(DateUtils.dayEnd(DateUtils.dayStart(base))).assertEqual(end);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_1000
     * @tc.name      testDateMatrix0010
     * @tc.desc      Verify todayStart is not ahead of the current instant,
     *               stays inside one day and shares the current date.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateMatrix0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const start: number = DateUtils.todayStart();
      const now: number = Date.now();
      expect(start).assertLess(now);
      expect(now - start).assertLess(MS_PER_DAY);
      expect(DateUtils.formatDate(start)).assertEqual(DateUtils.formatDate(now));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_1100
     * @tc.name      testDateMatrix0011
     * @tc.desc      Verify todayStart formats as midnight and equals the
     *               day start of the current instant.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateMatrix0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateUtils.formatTime(DateUtils.todayStart())).assertEqual('00:00:00');
      expect(DateUtils.dayStart(DateUtils.todayStart())).assertEqual(DateUtils.todayStart());
      expect(DateUtils.dayStart(Date.now())).assertEqual(DateUtils.todayStart());
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_1200
     * @tc.name      testDateMatrix0012
     * @tc.desc      Verify addDays shifts the instant by whole days and
     *               keeps the instant unchanged for a zero count.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateMatrix0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = new Date(2026, 5, 15, 12, 0, 0).getTime();
      expect(DateUtils.addDays(base, 0)).assertEqual(base);
      expect(DateUtils.addDays(base, 3)).assertEqual(base + 3 * MS_PER_DAY);
      expect(DateUtils.addDays(base, -2)).assertEqual(base - 2 * MS_PER_DAY);
      expect(DateUtils.addDays(base, 1)).assertLarger(base);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_1300
     * @tc.name      testDateMatrix0013
     * @tc.desc      Verify a forward and backward day shift cancel out and
     *               a five day shift moves across the month border.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateMatrix0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = new Date(2026, 5, 15, 12, 0, 0).getTime();
      expect(DateUtils.addDays(DateUtils.addDays(base, 5), -5)).assertEqual(base);
      const shifted: number = DateUtils.addDays(base, 16);
      expect(DateUtils.formatDate(shifted)).assertEqual('2026-07-01');
      expect(DateUtils.formatDate(DateUtils.addDays(shifted, -16))).assertEqual('2026-06-15');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_1400
     * @tc.name      testDateMatrix0014
     * @tc.desc      Verify addDays handles a full year of days in both
     *               directions as a pure millisecond shift.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateMatrix0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = new Date(2026, 5, 15, 12, 0, 0).getTime();
      const yearAhead: number = DateUtils.addDays(base, 365);
      expect(yearAhead).assertEqual(base + 365 * MS_PER_DAY);
      expect(DateUtils.addDays(yearAhead, -365)).assertEqual(base);
      const yearBehind: number = DateUtils.addDays(base, -365);
      expect(yearBehind).assertEqual(base - 365 * MS_PER_DAY);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_1500
     * @tc.name      testDateMatrix0015
     * @tc.desc      Verify addHours shifts the instant by whole hours and
     *               keeps the instant unchanged for a zero count.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateMatrix0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = new Date(2026, 5, 15, 12, 0, 0).getTime();
      expect(DateUtils.addHours(base, 0)).assertEqual(base);
      expect(DateUtils.addHours(base, 5)).assertEqual(base + 5 * MS_PER_HOUR);
      expect(DateUtils.addHours(base, -3)).assertEqual(base - 3 * MS_PER_HOUR);
      expect(DateUtils.addHours(base, 1)).assertLarger(base);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_1600
     * @tc.name      testDateMatrix0016
     * @tc.desc      Verify twenty four hour shifts equal the matching whole
     *               day shifts of addDays in both directions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateMatrix0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = new Date(2026, 5, 15, 12, 0, 0).getTime();
      expect(DateUtils.addHours(base, 24)).assertEqual(DateUtils.addDays(base, 1));
      expect(DateUtils.addHours(base, -24)).assertEqual(DateUtils.addDays(base, -1));
      expect(DateUtils.addHours(base, 6)).assertEqual(base + 6 * MS_PER_HOUR);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_1700
     * @tc.name      testDateMatrix0017
     * @tc.desc      Verify diffMs returns the signed distance in
     *               milliseconds including zero for equal instants.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateMatrix0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateUtils.diffMs(1000, 3000)).assertEqual(2000);
      expect(DateUtils.diffMs(3000, 1000)).assertEqual(-2000);
      expect(DateUtils.diffMs(500, 500)).assertEqual(0);
      expect(DateUtils.diffMs(0, 1)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_1800
     * @tc.name      testDateMatrix0018
     * @tc.desc      Verify diffMs composes with the day and hour shift
     *               helpers to whole day and hour distances.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateMatrix0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const base: number = new Date(2026, 5, 15, 12, 0, 0).getTime();
      expect(DateUtils.diffMs(base, DateUtils.addDays(base, 3))).assertEqual(3 * MS_PER_DAY);
      expect(DateUtils.diffMs(base, DateUtils.addHours(base, -5))).assertEqual(-5 * MS_PER_HOUR);
      expect(DateUtils.diffMs(DateUtils.addDays(base, 2), base)).assertEqual(-2 * MS_PER_DAY);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_1900
     * @tc.name      testDateMatrix0019
     * @tc.desc      Verify diffDays counts whole days and truncates the
     *               remainder for distances below one day.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateMatrix0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateUtils.diffDays(0, MS_PER_DAY)).assertEqual(1);
      expect(DateUtils.diffDays(0, MS_PER_DAY - 1)).assertEqual(0);
      expect(DateUtils.diffDays(0, 2 * MS_PER_DAY)).assertEqual(2);
      expect(DateUtils.diffDays(0, 3 * MS_PER_DAY + 1)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_2000
     * @tc.name      testDateMatrix0020
     * @tc.desc      Verify diffDays truncates negative distances toward zero
     *               so the sign is preserved without an extra day.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateMatrix0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateUtils.diffDays(MS_PER_DAY, 0)).assertEqual(-1);
      expect(DateUtils.diffDays(999999, 0)).assertEqual(0);
      expect(DateUtils.diffDays(0, 999999)).assertEqual(0);
      expect(DateUtils.diffDays(2 * MS_PER_DAY, MS_PER_DAY + 1)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_2100
     * @tc.name      testDateMatrix0021
     * @tc.desc      Verify diffDays counts a full year span in both the
     *               forward and the backward direction.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateMatrix0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateUtils.diffDays(0, 365 * MS_PER_DAY)).assertEqual(365);
      expect(DateUtils.diffDays(-365 * MS_PER_DAY, 0)).assertEqual(365);
      expect(DateUtils.diffDays(365 * MS_PER_DAY, 0)).assertEqual(-365);
      expect(DateUtils.diffDays(100 * MS_PER_DAY, 60 * MS_PER_DAY)).assertEqual(-40);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_2200
     * @tc.name      testDateMatrix0022
     * @tc.desc      Verify isSameDay reports true for two instants of the
     *               same local day at morning and late evening.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateMatrix0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const morning: number = new Date(2026, 5, 15, 8, 0, 0).getTime();
      const evening: number = new Date(2026, 5, 15, 23, 59, 59, 999).getTime();
      expect(DateUtils.isSameDay(morning, evening)).assertTrue();
      expect(DateUtils.isSameDay(evening, morning)).assertTrue();
      expect(DateUtils.isSameDay(morning, DateUtils.dayStart(morning))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_2300
     * @tc.name      testDateMatrix0023
     * @tc.desc      Verify isSameDay reports false for the last millisecond
     *               of one day and the first milliseconds of the next day.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateMatrix0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const lastInstant: number = new Date(2026, 5, 15, 23, 59, 59, 999).getTime();
      const firstInstant: number = new Date(2026, 5, 16, 0, 0, 0, 1).getTime();
      expect(DateUtils.isSameDay(lastInstant, firstInstant)).assertFalse();
      expect(DateUtils.isSameDay(firstInstant, lastInstant)).assertFalse();
      const monthSwitch: number = new Date(2026, 5, 30, 12, 0, 0).getTime();
      const nextMonth: number = new Date(2026, 6, 1, 12, 0, 0).getTime();
      expect(DateUtils.isSameDay(monthSwitch, nextMonth)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_2400
     * @tc.name      testDateMatrix0024
     * @tc.desc      Verify isSameDay is true for one instant compared with
     *               itself and false across a whole day shift from noon.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateMatrix0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const noon: number = new Date(2026, 5, 15, 12, 0, 0).getTime();
      expect(DateUtils.isSameDay(noon, noon)).assertTrue();
      expect(DateUtils.isSameDay(noon, DateUtils.addDays(noon, 1))).assertFalse();
      expect(DateUtils.isSameDay(noon, DateUtils.addDays(noon, -1))).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_2500
     * @tc.name      testDateMatrix0025
     * @tc.desc      Verify relativeTime reports just now for the current
     *               instant and for offsets inside the minute window.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateMatrix0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateUtils.relativeTime(Date.now())).assertEqual('just now');
      expect(DateUtils.relativeTime(Date.now() - HALF_MINUTE)).assertEqual('just now');
      expect(DateUtils.relativeTime(Date.now() + HALF_MINUTE)).assertEqual('just now');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_2600
     * @tc.name      testDateMatrix0026
     * @tc.desc      Verify relativeTime reports the singular and plural
     *               minute labels for one and two minute offsets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateMatrix0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateUtils.relativeTime(Date.now() - MS_PER_MINUTE)).assertEqual('1 minute ago');
      expect(DateUtils.relativeTime(Date.now() - TWO_MINUTES)).assertEqual('2 minutes ago');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_2700
     * @tc.name      testDateMatrix0027
     * @tc.desc      Verify relativeTime keeps the minute unit below one hour
     *               and switches to hours just above it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateMatrix0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateUtils.relativeTime(Date.now() - JUST_UNDER_HOUR)).assertEqual('59 minutes ago');
      expect(DateUtils.relativeTime(Date.now() - JUST_OVER_HOUR)).assertEqual('1 hour ago');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_2800
     * @tc.name      testDateMatrix0028
     * @tc.desc      Verify relativeTime reports two hours in the past and
     *               prefixes the matching description for the future.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateMatrix0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateUtils.relativeTime(Date.now() - TWO_HOURS_SLACK)).assertEqual('2 hours ago');
      expect(DateUtils.relativeTime(Date.now() + TWO_HOURS_SLACK)).assertEqual('in 2 hours');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_2900
     * @tc.name      testDateMatrix0029
     * @tc.desc      Verify relativeTime reports day units for offsets of
     *               about two and about seven days.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDateMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDateMatrix0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateUtils.relativeTime(Date.now() - TWO_DAYS_SLACK)).assertEqual('2 days ago');
      expect(DateUtils.relativeTime(Date.now() - SIX_DAYS_SLACK)).assertEqual('6 days ago');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_3000
     * @tc.name      testDateMatrix0030
     * @tc.desc      Verify relativeTime falls back to month units beyond a
     *               week and prefixes future month descriptions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDateMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testDateMatrix0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DateUtils.relativeTime(Date.now() - TWO_MONTHS_SLACK)).assertEqual('2 months ago');
      expect(DateUtils.relativeTime(Date.now() + ONE_MONTH_AHEAD)).assertEqual('in 1 month');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_3100
     * @tc.name      testDateMatrix0031
     * @tc.desc      Verify nowMs returns a positive instant close to the
     *               platform clock and never moves backwards.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testDateMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testDateMatrix0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const first: number = DateUtils.nowMs();
      expect(first).assertLarger(0);
      const second: number = DateUtils.nowMs();
      expect(second).assertLarger(first - 1);
      const platform: number = Date.now();
      const gap: number = platform - first;
      expect(gap).assertLess(1000);
      expect(gap).assertLarger(-1000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_DATEMAT_3200
     * @tc.name      testDateMatrix0032
     * @tc.desc      Verify composed calendar queries keep the day start
     *               idempotent and count whole days across shifts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testDateMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testDateMatrix0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const midnight: number = DateUtils.dayStart(Date.now());
      expect(DateUtils.dayStart(midnight)).assertEqual(midnight);
      expect(DateUtils.addDays(midnight, 1)).assertEqual(midnight + MS_PER_DAY);
      expect(DateUtils.diffDays(midnight, DateUtils.addDays(midnight, 3))).assertEqual(3);
      expect(DateUtils.isSameDay(midnight, DateUtils.addDays(midnight, 0))).assertTrue();
      expect(DateUtils.formatTime(midnight)).assertEqual('00:00:00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
