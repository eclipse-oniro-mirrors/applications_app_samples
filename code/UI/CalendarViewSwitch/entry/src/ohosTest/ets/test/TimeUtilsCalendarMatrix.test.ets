/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { beforeEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { TimeUtils, DayInfo, Day, Constants, CommonData } from '../../../main/ets/bridge/CalendarSwitchBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'TimeUtilsCalendarMatrixTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function timeUtilsCalendarMatrixTest(): void {
  describe('TimeUtilsCalendarMatrixTest', () => {
    beforeEach(() => {
      CommonData.SCHEDULE_ARRAY = [];
      CommonData.SCHEDULE_DATA = [];
      CommonData.CURRENT_SELECT_DATE = '';
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0301
     * @tc.name      testCalendarMatrix0301
     * @tc.desc      Checks byMonthDayForYear builds 5 week rows for January 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0301 begin');
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2024, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows.length=${rows.length}, expected=5`);
      expect(rows.length).assertEqual(5);
      log('testCalendarMatrix0301 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0302
     * @tc.name      testCalendarMatrix0302
     * @tc.desc      Checks every week row of January 2024 holds exactly 7 days.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0302 begin');
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2024, 1);
      let allRowsFull: boolean = true;
      for (let i: number = 0; i < rows.length; i++) {
        if (rows[i].length !== Constants.DAYS_IN_WEEK) {
          allRowsFull = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allRowsFull=${allRowsFull}`);
      expect(allRowsFull).assertTrue();
      log('testCalendarMatrix0302 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0303
     * @tc.name      testCalendarMatrix0303
     * @tc.desc      Checks January 2024 first cell is 2023-12-31 from the previous month.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0303 begin');
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2024, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[0][0].dayNum=${rows[0][0].dayNum}, expected=31`);
      expect(rows[0][0].dayNum).assertEqual(31);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[0][0].dayInfo.year=${rows[0][0].dayInfo.year}`);
      expect(rows[0][0].dayInfo.year).assertEqual(2023);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[0][0].dayInfo.month=${rows[0][0].dayInfo.month}`);
      expect(rows[0][0].dayInfo.month).assertEqual(12);
      log('testCalendarMatrix0303 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0304
     * @tc.name      testCalendarMatrix0304
     * @tc.desc      Checks January 2024 second cell is the first of the month.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0304 begin');
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2024, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[0][1].dayNum=${rows[0][1].dayNum}, expected=1`);
      expect(rows[0][1].dayNum).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[0][1].dayInfo.month=${rows[0][1].dayInfo.month}`);
      expect(rows[0][1].dayInfo.month).assertEqual(1);
      log('testCalendarMatrix0304 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0305
     * @tc.name      testCalendarMatrix0305
     * @tc.desc      Checks January 2024 matrix contains day 29 of the current month.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0305 begin');
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2024, 1);
      let hasDay29: boolean = false;
      for (let i: number = 0; i < rows.length; i++) {
        for (let j: number = 0; j < rows[i].length; j++) {
          if (rows[i][j].dayNum === 29 && rows[i][j].dayInfo.month === 1 && rows[i][j].dayInfo.year === 2024) {
            hasDay29 = true;
          }
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue hasDay29=${hasDay29}`);
      expect(hasDay29).assertTrue();
      log('testCalendarMatrix0305 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0306
     * @tc.name      testCalendarMatrix0306
     * @tc.desc      Checks January 2024 last cell belongs to February 3 as next-month padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0306 begin');
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2024, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[4][6].dayNum=${rows[4][6].dayNum}, expected=3`);
      expect(rows[4][6].dayNum).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[4][6].dayInfo.month=${rows[4][6].dayInfo.month}`);
      expect(rows[4][6].dayInfo.month).assertEqual(2);
      log('testCalendarMatrix0306 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0307
     * @tc.name      testCalendarMatrix0307
     * @tc.desc      Checks every cell of January 2024 has a non-empty lunar label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0307 begin');
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2024, 1);
      let allLunarNonEmpty: boolean = true;
      for (let i: number = 0; i < rows.length; i++) {
        for (let j: number = 0; j < rows[i].length; j++) {
          if (rows[i][j].lunarDay.length === 0) {
            allLunarNonEmpty = false;
          }
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allLunarNonEmpty=${allLunarNonEmpty}`);
      expect(allLunarNonEmpty).assertTrue();
      log('testCalendarMatrix0307 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0308
     * @tc.name      testCalendarMatrix0308
     * @tc.desc      Checks every cell dayInfo of January 2024 is a DayInfo instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0308 begin');
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2024, 1);
      let allDayInfo: boolean = true;
      for (let i: number = 0; i < rows.length; i++) {
        for (let j: number = 0; j < rows[i].length; j++) {
          if (!(rows[i][j].dayInfo instanceof DayInfo)) {
            allDayInfo = false;
          }
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allDayInfo=${allDayInfo}`);
      expect(allDayInfo).assertTrue();
      log('testCalendarMatrix0308 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0309
     * @tc.name      testCalendarMatrix0309
     * @tc.desc      Checks no schedule point is shown when the schedule array is empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0309 begin');
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2024, 1);
      let anySchedulePoint: boolean = false;
      for (let i: number = 0; i < rows.length; i++) {
        for (let j: number = 0; j < rows[i].length; j++) {
          if (rows[i][j].isShowSchedulePoint) {
            anySchedulePoint = true;
          }
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse anySchedulePoint=${anySchedulePoint}`);
      expect(anySchedulePoint).assertFalse();
      log('testCalendarMatrix0309 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0310
     * @tc.name      testCalendarMatrix0310
     * @tc.desc      Checks January 2024 matrix has 35 total cells across 5 rows.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0310 begin');
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2024, 1);
      let totalCells: number = 0;
      for (let i: number = 0; i < rows.length; i++) {
        totalCells += rows[i].length;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual totalCells=${totalCells}, expected=35`);
      expect(totalCells).assertEqual(35);
      log('testCalendarMatrix0310 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0311
     * @tc.name      testCalendarMatrix0311
     * @tc.desc      Checks byMonthDayForYear builds 5 week rows for leap February 2024.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0311 begin');
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2024, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows.length=${rows.length}, expected=5`);
      expect(rows.length).assertEqual(5);
      log('testCalendarMatrix0311 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0312
     * @tc.name      testCalendarMatrix0312
     * @tc.desc      Checks leap February 2024 matrix contains day 29 of February.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0312 begin');
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2024, 2);
      let hasLeapDay: boolean = false;
      for (let i: number = 0; i < rows.length; i++) {
        for (let j: number = 0; j < rows[i].length; j++) {
          if (rows[i][j].dayNum === 29 && rows[i][j].dayInfo.month === 2 && rows[i][j].dayInfo.year === 2024) {
            hasLeapDay = true;
          }
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue hasLeapDay=${hasLeapDay}`);
      expect(hasLeapDay).assertTrue();
      log('testCalendarMatrix0312 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0313
     * @tc.name      testCalendarMatrix0313
     * @tc.desc      Checks leap February 2024 first row holds 4 previous-month January days.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0313 begin');
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2024, 2);
      let prevCount: number = 0;
      for (let j: number = 0; j < rows[0].length; j++) {
        if (rows[0][j].dayInfo.month === 1 && rows[0][j].dayInfo.year === 2024) {
          prevCount++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual prevCount=${prevCount}, expected=4`);
      expect(prevCount).assertEqual(4);
      log('testCalendarMatrix0313 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0314
     * @tc.name      testCalendarMatrix0314
     * @tc.desc      Checks leap February 2024 last cell is March 2 as next-month padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0314 begin');
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2024, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[4][6].dayNum=${rows[4][6].dayNum}, expected=2`);
      expect(rows[4][6].dayNum).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[4][6].dayInfo.month=${rows[4][6].dayInfo.month}`);
      expect(rows[4][6].dayInfo.month).assertEqual(3);
      log('testCalendarMatrix0314 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0315
     * @tc.name      testCalendarMatrix0315
     * @tc.desc      Checks September 2024 starting on Sunday has no previous-month padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0315 begin');
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2024, 9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[0][0].dayNum=${rows[0][0].dayNum}, expected=1`);
      expect(rows[0][0].dayNum).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[0][0].dayInfo.month=${rows[0][0].dayInfo.month}`);
      expect(rows[0][0].dayInfo.month).assertEqual(9);
      log('testCalendarMatrix0315 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0316
     * @tc.name      testCalendarMatrix0316
     * @tc.desc      Checks September 2024 has 5 rows padded with October days at the end.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0316 begin');
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2024, 9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows.length=${rows.length}, expected=5`);
      expect(rows.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[4][6].dayInfo.month=${rows[4][6].dayInfo.month}`);
      expect(rows[4][6].dayInfo.month).assertEqual(10);
      log('testCalendarMatrix0316 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0317
     * @tc.name      testCalendarMatrix0317
     * @tc.desc      Checks December 2024 trailing padding belongs to January 2025.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0317 begin');
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2024, 12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[4][6].dayNum=${rows[4][6].dayNum}, expected=4`);
      expect(rows[4][6].dayNum).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[4][6].dayInfo.month=${rows[4][6].dayInfo.month}`);
      expect(rows[4][6].dayInfo.month).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[4][6].dayInfo.year=${rows[4][6].dayInfo.year}`);
      expect(rows[4][6].dayInfo.year).assertEqual(2025);
      log('testCalendarMatrix0317 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0318
     * @tc.name      testCalendarMatrix0318
     * @tc.desc      Checks December 2024 starts on the first with no previous-month padding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0318 begin');
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2024, 12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[0][0].dayNum=${rows[0][0].dayNum}, expected=1`);
      expect(rows[0][0].dayNum).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[0][0].dayInfo.month=${rows[0][0].dayInfo.month}`);
      expect(rows[0][0].dayInfo.month).assertEqual(12);
      log('testCalendarMatrix0318 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0319
     * @tc.name      testCalendarMatrix0319
     * @tc.desc      Checks December 2024 matrix has 5 week rows.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0319 begin');
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2024, 12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows.length=${rows.length}, expected=5`);
      expect(rows.length).assertEqual(5);
      log('testCalendarMatrix0319 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0320
     * @tc.name      testCalendarMatrix0320
     * @tc.desc      Checks non-leap February 2023 matrix contains no February 29.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0320 begin');
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2023, 2);
      let hasLeapDay: boolean = false;
      for (let i: number = 0; i < rows.length; i++) {
        for (let j: number = 0; j < rows[i].length; j++) {
          if (rows[i][j].dayNum === 29 && rows[i][j].dayInfo.month === 2 && rows[i][j].dayInfo.year === 2023) {
            hasLeapDay = true;
          }
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse hasLeapDay=${hasLeapDay}`);
      expect(hasLeapDay).assertFalse();
      log('testCalendarMatrix0320 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0321
     * @tc.name      testCalendarMatrix0321
     * @tc.desc      Checks non-leap February 2023 matrix has 5 week rows.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0321 begin');
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2023, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows.length=${rows.length}, expected=5`);
      expect(rows.length).assertEqual(5);
      log('testCalendarMatrix0321 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0322
     * @tc.name      testCalendarMatrix0322
     * @tc.desc      Checks January 2024 marks week kinds 0 for prev, 1 for current, 2 for next days.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0322 begin');
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2024, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[0][0].dayInfo.week=${rows[0][0].dayInfo.week}`);
      expect(rows[0][0].dayInfo.week).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[0][1].dayInfo.week=${rows[0][1].dayInfo.week}`);
      expect(rows[0][1].dayInfo.week).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[4][6].dayInfo.week=${rows[4][6].dayInfo.week}`);
      expect(rows[4][6].dayInfo.week).assertEqual(2);
      log('testCalendarMatrix0322 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0323
     * @tc.name      testCalendarMatrix0323
     * @tc.desc      Checks getWeekDays for the current week returns a single row.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0323 begin');
      const rows: Day[][] = TimeUtils.getWeekDays(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows.length=${rows.length}, expected=1`);
      expect(rows.length).assertEqual(1);
      log('testCalendarMatrix0323 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0324
     * @tc.name      testCalendarMatrix0324
     * @tc.desc      Checks the current week row holds exactly 7 days.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0324 begin');
      const rows: Day[][] = TimeUtils.getWeekDays(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[0].length=${rows[0].length}`);
      expect(rows[0].length).assertEqual(Constants.DAYS_IN_WEEK);
      log('testCalendarMatrix0324 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0325
     * @tc.name      testCalendarMatrix0325
     * @tc.desc      Checks the current week contains today's day number.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0325 begin');
      const rows: Day[][] = TimeUtils.getWeekDays(0);
      let hasToday: boolean = false;
      for (let j: number = 0; j < rows[0].length; j++) {
        if (rows[0][j].dayNum === Constants.TODAY && rows[0][j].dayInfo.year === Constants.TODAY_YEAR &&
          rows[0][j].dayInfo.month === Constants.TODAY_MONTH) {
          hasToday = true;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue hasToday=${hasToday}`);
      expect(hasToday).assertTrue();
      log('testCalendarMatrix0325 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0326
     * @tc.name      testCalendarMatrix0326
     * @tc.desc      Checks every current-week cell is a DayInfo with a non-empty lunar label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0326 begin');
      const rows: Day[][] = TimeUtils.getWeekDays(0);
      let allValid: boolean = true;
      for (let j: number = 0; j < rows[0].length; j++) {
        if (!(rows[0][j].dayInfo instanceof DayInfo) || rows[0][j].lunarDay.length === 0) {
          allValid = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue allValid=${allValid}`);
      expect(allValid).assertTrue();
      log('testCalendarMatrix0326 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0327
     * @tc.name      testCalendarMatrix0327
     * @tc.desc      Checks getWeekDays for last week returns one full row.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0327 begin');
      const rows: Day[][] = TimeUtils.getWeekDays(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows.length=${rows.length}, expected=1`);
      expect(rows.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[0].length=${rows[0].length}`);
      expect(rows[0].length).assertEqual(Constants.DAYS_IN_WEEK);
      log('testCalendarMatrix0327 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0328
     * @tc.name      testCalendarMatrix0328
     * @tc.desc      Checks getWeekDays for next week returns one full row.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0328 begin');
      const rows: Day[][] = TimeUtils.getWeekDays(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows.length=${rows.length}, expected=1`);
      expect(rows.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[0].length=${rows[0].length}`);
      expect(rows[0].length).assertEqual(Constants.DAYS_IN_WEEK);
      log('testCalendarMatrix0328 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0329
     * @tc.name      testCalendarMatrix0329
     * @tc.desc      Checks getWeekDays two weeks back returns one full row.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0329 begin');
      const rows: Day[][] = TimeUtils.getWeekDays(-2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows.length=${rows.length}, expected=1`);
      expect(rows.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[0].length=${rows[0].length}`);
      expect(rows[0].length).assertEqual(Constants.DAYS_IN_WEEK);
      log('testCalendarMatrix0329 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0330
     * @tc.name      testCalendarMatrix0330
     * @tc.desc      Checks getWeekDays three weeks ahead returns one full row.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0330 begin');
      const rows: Day[][] = TimeUtils.getWeekDays(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows.length=${rows.length}, expected=1`);
      expect(rows.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[0].length=${rows[0].length}`);
      expect(rows[0].length).assertEqual(Constants.DAYS_IN_WEEK);
      log('testCalendarMatrix0330 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0331
     * @tc.name      testCalendarMatrix0331
     * @tc.desc      Checks next week Saturday is exactly 7 days after this week Saturday.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0331 begin');
      const current: Day = TimeUtils.getWeekDays(0)[0][6];
      const next: Day = TimeUtils.getWeekDays(1)[0][6];
      const diffDays: number = (new Date(next.dayInfo.year, next.dayInfo.month - 1, next.dayInfo.date).getTime() -
        new Date(current.dayInfo.year, current.dayInfo.month - 1, current.dayInfo.date).getTime()) /
        Constants.TOTAL_MILLISECONDS_IN_DAY;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual diffDays=${diffDays}, expected=7`);
      expect(diffDays).assertEqual(7);
      log('testCalendarMatrix0331 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0332
     * @tc.name      testCalendarMatrix0332
     * @tc.desc      Checks current week cell field types stay number, string and boolean.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0332 begin');
      const cell: Day = TimeUtils.getWeekDays(0)[0][0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof cell.dayNum=${typeof cell.dayNum}, expected='number'`);
      expect(typeof cell.dayNum).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof cell.lunarDay=${typeof cell.lunarDay}`);
      expect(typeof cell.lunarDay).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof cell.isShowSchedulePoint}`);
      expect(typeof cell.isShowSchedulePoint).assertEqual('boolean');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof cell.dayInfo.year=${typeof cell.dayInfo.year}`);
      expect(typeof cell.dayInfo.year).assertEqual('number');
      log('testCalendarMatrix0332 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0333
     * @tc.name      testCalendarMatrix0333
     * @tc.desc      Checks addSchedule for one day records 2024/1/1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0333 begin');
      TimeUtils.addSchedule(new Date(2024, 0, 1), new Date(2024, 0, 1));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonData.SCHEDULE_ARRAY.length}, expected=1`);
      expect(CommonData.SCHEDULE_ARRAY.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CommonData.SCHEDULE_ARRAY[0]=${CommonData.SCHEDULE_ARRAY[0]}`);
      expect(CommonData.SCHEDULE_ARRAY[0]).assertEqual('2024/1/1');
      log('testCalendarMatrix0333 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0334
     * @tc.name      testCalendarMatrix0334
     * @tc.desc      Checks addSchedule across a month boundary records each day once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0334 begin');
      TimeUtils.addSchedule(new Date(2024, 0, 30), new Date(2024, 1, 1));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonData.SCHEDULE_ARRAY.length}, expected=3`);
      expect(CommonData.SCHEDULE_ARRAY.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CommonData.SCHEDULE_ARRAY[0]=${CommonData.SCHEDULE_ARRAY[0]}`);
      expect(CommonData.SCHEDULE_ARRAY[0]).assertEqual('2024/1/30');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CommonData.SCHEDULE_ARRAY[1]=${CommonData.SCHEDULE_ARRAY[1]}`);
      expect(CommonData.SCHEDULE_ARRAY[1]).assertEqual('2024/1/31');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CommonData.SCHEDULE_ARRAY[2]=${CommonData.SCHEDULE_ARRAY[2]}`);
      expect(CommonData.SCHEDULE_ARRAY[2]).assertEqual('2024/2/1');
      log('testCalendarMatrix0334 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0335
     * @tc.name      testCalendarMatrix0335
     * @tc.desc      Checks addSchedule with end before start adds nothing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0335 begin');
      TimeUtils.addSchedule(new Date(2024, 5, 10), new Date(2024, 5, 9));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonData.SCHEDULE_ARRAY.length}, expected=0`);
      expect(CommonData.SCHEDULE_ARRAY.length).assertEqual(0);
      log('testCalendarMatrix0335 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0336
     * @tc.name      testCalendarMatrix0336
     * @tc.desc      Checks adding the same schedule range twice keeps unique entries only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0336 begin');
      TimeUtils.addSchedule(new Date(2024, 2, 1), new Date(2024, 2, 3));
      TimeUtils.addSchedule(new Date(2024, 2, 1), new Date(2024, 2, 3));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonData.SCHEDULE_ARRAY.length}, expected=3`);
      expect(CommonData.SCHEDULE_ARRAY.length).assertEqual(3);
      log('testCalendarMatrix0336 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0337
     * @tc.name      testCalendarMatrix0337
     * @tc.desc      Checks addSchedule across a year boundary formats each day correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0337 begin');
      TimeUtils.addSchedule(new Date(2024, 11, 30), new Date(2025, 0, 2));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonData.SCHEDULE_ARRAY.length}, expected=4`);
      expect(CommonData.SCHEDULE_ARRAY.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CommonData.SCHEDULE_ARRAY[0]=${CommonData.SCHEDULE_ARRAY[0]}`);
      expect(CommonData.SCHEDULE_ARRAY[0]).assertEqual('2024/12/30');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CommonData.SCHEDULE_ARRAY[3]=${CommonData.SCHEDULE_ARRAY[3]}`);
      expect(CommonData.SCHEDULE_ARRAY[3]).assertEqual('2025/1/2');
      log('testCalendarMatrix0337 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0338
     * @tc.name      testCalendarMatrix0338
     * @tc.desc      Checks a June 15 2024 schedule point shows in the month matrix.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0338 begin');
      TimeUtils.addSchedule(new Date(2024, 5, 15), new Date(2024, 5, 16));
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2024, 6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[2][6].dayNum=${rows[2][6].dayNum}, expected=15`);
      expect(rows[2][6].dayNum).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${rows[2][6].isShowSchedulePoint}`);
      expect(rows[2][6].isShowSchedulePoint).assertTrue();
      log('testCalendarMatrix0338 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0339
     * @tc.name      testCalendarMatrix0339
     * @tc.desc      Checks June 17 2024 without a schedule shows no schedule point.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0339 begin');
      TimeUtils.addSchedule(new Date(2024, 5, 15), new Date(2024, 5, 16));
      const rows: Day[][] = TimeUtils.byMonthDayForYear(2024, 6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual rows[3][1].dayNum=${rows[3][1].dayNum}, expected=17`);
      expect(rows[3][1].dayNum).assertEqual(17);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse actual=${rows[3][1].isShowSchedulePoint}`);
      expect(rows[3][1].isShowSchedulePoint).assertFalse();
      log('testCalendarMatrix0339 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0340
     * @tc.name      testCalendarMatrix0340
     * @tc.desc      Checks a full month schedule range records all 30 June days.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0340 begin');
      TimeUtils.addSchedule(new Date(2024, 5, 1), new Date(2024, 5, 30));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonData.SCHEDULE_ARRAY.length}, expected=30`);
      expect(CommonData.SCHEDULE_ARRAY.length).assertEqual(30);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CommonData.SCHEDULE_ARRAY[0]=${CommonData.SCHEDULE_ARRAY[0]}`);
      expect(CommonData.SCHEDULE_ARRAY[0]).assertEqual('2024/6/1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonData.SCHEDULE_ARRAY[29]}`);
      expect(CommonData.SCHEDULE_ARRAY[29]).assertEqual('2024/6/30');
      log('testCalendarMatrix0340 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0341
     * @tc.name      testCalendarMatrix0341
     * @tc.desc      Checks addSchedule for the epoch day records 1970/1/1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0341 begin');
      TimeUtils.addSchedule(new Date(1970, 0, 1), new Date(1970, 0, 1));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CommonData.SCHEDULE_ARRAY[0]=${CommonData.SCHEDULE_ARRAY[0]}`);
      expect(CommonData.SCHEDULE_ARRAY[0]).assertEqual('1970/1/1');
      log('testCalendarMatrix0341 end');
    })

    /**
     * @tc.number    SUB_CALENDARVIEWSWITCH_CALENDARMATRIX_0342
     * @tc.name      testCalendarMatrix0342
     * @tc.desc      Checks two disjoint schedule ranges accumulate into one array.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCalendarMatrix0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testCalendarMatrix0342 begin');
      TimeUtils.addSchedule(new Date(2024, 3, 1), new Date(2024, 3, 2));
      TimeUtils.addSchedule(new Date(2024, 7, 20), new Date(2024, 7, 21));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${CommonData.SCHEDULE_ARRAY.length}, expected=4`);
      expect(CommonData.SCHEDULE_ARRAY.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CommonData.SCHEDULE_ARRAY[0]=${CommonData.SCHEDULE_ARRAY[0]}`);
      expect(CommonData.SCHEDULE_ARRAY[0]).assertEqual('2024/4/1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual CommonData.SCHEDULE_ARRAY[3]=${CommonData.SCHEDULE_ARRAY[3]}`);
      expect(CommonData.SCHEDULE_ARRAY[3]).assertEqual('2024/8/21');
      log('testCalendarMatrix0342 end');
    })
  })
}
