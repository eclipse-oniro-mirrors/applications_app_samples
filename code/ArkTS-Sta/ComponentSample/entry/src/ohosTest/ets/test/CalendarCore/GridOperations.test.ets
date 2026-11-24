'use static';

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
import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { getMonthDate } from '../../../../main/ets/pages/CustomCalendar/components/GetDate';
import {
  logSuite,
  expectedGrid,
  daysInMonth,
  firstWeekday,
  sameIntArray,
  firstDifference,
  countValue,
  joined,
  firstNonZero,
  lastNonZero,
  isContiguousFromOne,
  realDays,
  fingerprint,
  columnOf,
  rowOf,
  monthLabel,
  isLeapYear,
  normalizeMonth,
} from '../Shared/Support';
import { GridInspector, SelectionGuard, CellProjector, PanelBuilder } from '../Shared/SharedDriver';

export default function GridOperationsTest(): void {
  describe('GridOperationsTest', () => {
    beforeAll(() => {
      logSuite('GridOperationsTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('GridOperationsTest', 'end');
    });

    /**
     * @tc.name CalendarDayCountAndSaturdayClosureSurviveRepeatedInspectionForPreviewPanels
     * @tc.desc CalendarDayCountAndSaturdayClosureSurviveRepeatedInspectionForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndSaturdayClosureSurviveRepeatedInspectionForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(6, 2009);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(3, 2010);
        const expectedTrailing: int = 3;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const grid: int[] = getMonthDate(2, 2011);
        const day: int = 16;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(17);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(3);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 17)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
    });

    /**
     * @tc.name CalendarDayCountAndSaturdayClosureKeepTheSameGridShapeForPreviewPanels
     * @tc.desc CalendarDayCountAndSaturdayClosureKeepTheSameGridShapeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndSaturdayClosureKeepTheSameGridShapeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(12, 2012);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(isLeapYear(2012)).assertEqual(true);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
      }
      {
        const grid: int[] = getMonthDate(9, 2013);
        const expectedTrailing: int = 5;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels
     * @tc.desc WeekdayColumnsAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(11, 2013);
        const day: int = 11;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(15);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(1);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(15)).assertEqual(1);
        expect(rowOf(15)).assertEqual(2);
      }
      {
        const year: int = 2014;
        const month: int = 10;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
          28, 29, 30, 31, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(produced[3]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(4);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(7, 2015);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(6, 2016);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });

    /**
     * @tc.name CalendarDayCountAndSaturdayClosureStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.desc CalendarDayCountAndSaturdayClosureStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndSaturdayClosureStayConsistentForTheSamePanelAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(5, 2014);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(4, 2015);
        const expectedTrailing: int = 2;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const grid: int[] = getMonthDate(1, 2016);
        const day: int = 4;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(8);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(1);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 8)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const year: int = 2017;
        const month: int = 11;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
          28, 29, 30, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(30);
        expect(GridInspector.facts(produced).leading).assertEqual(3);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndGridSnapshotMatchAfterSelectionChangeAcrossLeapYears
     * @tc.desc WeekdayColumnsAndGridSnapshotMatchAfterSelectionChangeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndGridSnapshotMatchAfterSelectionChangeAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(6, 2015);
        const day: int = 6;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(6);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(6);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 6)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const year: int = 2016;
        const month: int = 3;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28,
          29, 30, 31, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(2);
      }
      {
        const grid: int[] = getMonthDate(2, 2017);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
    });

    /**
     * @tc.name CalendarDayCountAndSaturdayClosureHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.desc CalendarDayCountAndSaturdayClosureHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndSaturdayClosureHoldAcrossSeasonBoundariesAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(11, 2017);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(isLeapYear(2017)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
      }
      {
        const grid: int[] = getMonthDate(10, 2018);
        const expectedTrailing: int = 3;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const grid: int[] = getMonthDate(7, 2019);
        const day: int = 29;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(29);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(1);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(29)).assertEqual(1);
        expect(rowOf(29)).assertEqual(4);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndGridSnapshotPreserveTheOracleSnapshotAcrossLeapYears
     * @tc.desc WeekdayColumnsAndGridSnapshotPreserveTheOracleSnapshotAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndGridSnapshotPreserveTheOracleSnapshotAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(12, 2018);
        const day: int = 29;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(34);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(6);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(34)).assertEqual(6);
        expect(rowOf(34)).assertEqual(4);
      }
      {
        const year: int = 2019;
        const month: int = 9;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
          0, 0, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(produced[0]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(5);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
    });

    /**
     * @tc.name CalendarDayCountAndSaturdayClosureHoldWhenTheMonthRollsOverAcrossLeapYears
     * @tc.desc CalendarDayCountAndSaturdayClosureHoldWhenTheMonthRollsOverAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndSaturdayClosureHoldWhenTheMonthRollsOverAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(6, 2019);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(3, 2020);
        const expectedTrailing: int = 4;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndGridSnapshotSurviveRepeatedInspectionAtDecadeBoundary
     * @tc.desc WeekdayColumnsAndGridSnapshotSurviveRepeatedInspectionAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndGridSnapshotSurviveRepeatedInspectionAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(5, 2020);
        const day: int = 23;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(27);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(6);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 27)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const year: int = 2021;
        const month: int = 4;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
          28, 29, 30, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(30);
        expect(GridInspector.facts(produced).leading).assertEqual(4);
      }
      {
        const grid: int[] = getMonthDate(1, 2022);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(42);
      }
      {
        const grid: int[] = getMonthDate(11, 2023);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(isLeapYear(2023)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
      }
    });

    /**
     * @tc.name GridSnapshotAndWeekAlignmentMatchAfterSelectionChangeAtDecadeBoundary
     * @tc.desc GridSnapshotAndWeekAlignmentMatchAfterSelectionChangeAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndWeekAlignmentMatchAfterSelectionChangeAtDecadeBoundary', 0, () => {
      {
        const year: int = 2021;
        const month: int = 11;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
          30, 0, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(30);
        expect(GridInspector.facts(produced).leading).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(10, 2022);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(42);
      }
    });

    /**
     * @tc.name WeekAlignmentAndCalendarDayCountRemainStableDuringPreviewAtDecadeBoundary
     * @tc.desc WeekAlignmentAndCalendarDayCountRemainStableDuringPreviewAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndCalendarDayCountRemainStableDuringPreviewAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(6, 2021);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const grid: int[] = getMonthDate(3, 2022);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(isLeapYear(2022)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
      }
      {
        const grid: int[] = getMonthDate(2, 2023);
        const expectedTrailing: int = 4;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(28);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
    });

    /**
     * @tc.name CalendarDayCountAndSaturdayClosureAgreeUnderRepeatedRebuildAtDecadeBoundary
     * @tc.desc CalendarDayCountAndSaturdayClosureAgreeUnderRepeatedRebuildAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndSaturdayClosureAgreeUnderRepeatedRebuildAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(12, 2022);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(isLeapYear(2022)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
      }
      {
        const grid: int[] = getMonthDate(9, 2023);
        const expectedTrailing: int = 0;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const grid: int[] = getMonthDate(8, 2024);
        const day: int = 17;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(20);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(6);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(20)).assertEqual(6);
        expect(rowOf(20)).assertEqual(2);
      }
      {
        const year: int = 2025;
        const month: int = 5;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
          28, 29, 30, 31,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(produced[4]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(4);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(31);
      }
    });

    /**
     * @tc.name SaturdayClosureAndWeekdayColumnsHoldAcrossSeasonBoundariesAtDecadeBoundary
     * @tc.desc SaturdayClosureAndWeekdayColumnsHoldAcrossSeasonBoundariesAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndWeekdayColumnsHoldAcrossSeasonBoundariesAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(5, 2022);
        const expectedTrailing: int = 4;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const grid: int[] = getMonthDate(4, 2023);
        const day: int = 21;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(26);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(5);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(26)).assertEqual(5);
        expect(rowOf(26)).assertEqual(3);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndGridSnapshotKeepTheSameGridShapeAtDecadeBoundary
     * @tc.desc WeekdayColumnsAndGridSnapshotKeepTheSameGridShapeAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndGridSnapshotKeepTheSameGridShapeAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(11, 2023);
        const day: int = 21;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(23);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(2);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(23)).assertEqual(2);
        expect(rowOf(23)).assertEqual(3);
      }
      {
        const year: int = 2024;
        const month: int = 10;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28,
          29, 30, 31, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(produced[2]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(4);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(7, 2025);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
    });

    /**
     * @tc.name GridSnapshotAndWeekAlignmentPreserveTheOracleSnapshotAtDecadeBoundary
     * @tc.desc GridSnapshotAndWeekAlignmentPreserveTheOracleSnapshotAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndWeekAlignmentPreserveTheOracleSnapshotAtDecadeBoundary', 0, () => {
      {
        const year: int = 2023;
        const month: int = 6;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
          28, 29, 30, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(produced[4]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(5);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(3, 2024);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(6);
        expect(grid.length).assertEqual(42);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(2, 2025);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(28);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(28);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(12, 2026);
        const expectedTrailing: int = 2;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
    });

    /**
     * @tc.name WeekAlignmentAndCalendarDayCountTrackTheVisibleColumnsAtDecadeBoundary
     * @tc.desc WeekAlignmentAndCalendarDayCountTrackTheVisibleColumnsAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndCalendarDayCountTrackTheVisibleColumnsAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(12, 2024);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(9, 2025);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });

    /**
     * @tc.name CalendarDayCountAndSaturdayClosureSupportThePopupPreviewAtDecadeBoundary
     * @tc.desc CalendarDayCountAndSaturdayClosureSupportThePopupPreviewAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndSaturdayClosureSupportThePopupPreviewAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(5, 2024);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(4, 2025);
        const expectedTrailing: int = 3;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const grid: int[] = getMonthDate(1, 2026);
        const day: int = 11;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(14);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(0);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 14)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
    });

    /**
     * @tc.name SaturdayClosureAndWeekdayColumnsHoldWhenTheMonthRollsOverAtDecadeBoundary
     * @tc.desc SaturdayClosureAndWeekdayColumnsHoldWhenTheMonthRollsOverAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndWeekdayColumnsHoldWhenTheMonthRollsOverAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(11, 2025);
        const expectedTrailing: int = 6;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const grid: int[] = getMonthDate(10, 2026);
        const day: int = 11;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(14);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(0);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 14)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const year: int = 2027;
        const month: int = 7;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
          28, 29, 30, 31,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(4);
      }
      {
        const grid: int[] = getMonthDate(6, 2028);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
    });
  });
}
