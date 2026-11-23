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

export default function CalendarYearBoundaryTest(): void {
  describe('CalendarYearBoundaryTest', () => {
    beforeAll(() => {
      logSuite('CalendarYearBoundaryTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('CalendarYearBoundaryTest', 'end');
    });

    /**
     * @tc.name BlankLeadCellsAndOverflowMonthFoldingSurviveRepeatedInspectionForPreviewPanels
     * @tc.desc BlankLeadCellsAndOverflowMonthFoldingSurviveRepeatedInspectionForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndOverflowMonthFoldingSurviveRepeatedInspectionForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(2, 1899);
        const expectedLead: int = 3;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(0);
        expect(grid[1]).assertEqual(0);
        expect(grid[2]).assertEqual(0);
        expect(grid[3]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
      {
        const grid: int[] = getMonthDate(24, 1900);
        const normalizedYear: int = 1901;
        const normalizedMonth: int = 12;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(22824);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(0);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(9, 1901);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });

    /**
     * @tc.name OverflowMonthFoldingAndCalendarDayCountMatchAfterSelectionChangeForPreviewPanels
     * @tc.desc OverflowMonthFoldingAndCalendarDayCountMatchAfterSelectionChangeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('OverflowMonthFoldingAndCalendarDayCountMatchAfterSelectionChangeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(20, 1900);
        const normalizedYear: int = 1901;
        const normalizedMonth: int = 8;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(22820);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(4);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(5, 1901);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const year: int = 1902;
        const month: int = 4;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28,
          29, 30, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(30);
        expect(GridInspector.facts(produced).leading).assertEqual(2);
      }
      {
        const grid: int[] = getMonthDate(1, 1903);
        const expectedLead: int = 4;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(0);
        expect(grid[1]).assertEqual(0);
        expect(grid[2]).assertEqual(0);
        expect(grid[3]).assertEqual(0);
        expect(grid[4]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
    });

    /**
     * @tc.name BlankLeadCellsAndOverflowMonthFoldingHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.desc BlankLeadCellsAndOverflowMonthFoldingHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndOverflowMonthFoldingHoldAcrossSeasonBoundariesForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(2, 1901);
        const expectedLead: int = 5;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(0);
        expect(grid[1]).assertEqual(0);
        expect(grid[2]).assertEqual(0);
        expect(grid[3]).assertEqual(0);
        expect(grid[4]).assertEqual(0);
        expect(grid[5]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
      {
        const grid: int[] = getMonthDate(24, 1902);
        const normalizedYear: int = 1903;
        const normalizedMonth: int = 12;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(22848);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(2);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(9, 1903);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const year: int = 1904;
        const month: int = 8;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
          30, 31, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(1);
      }
    });

    /**
     * @tc.name OverflowMonthFoldingAndCalendarDayCountKeepTheSameGridShapeForPreviewPanels
     * @tc.desc OverflowMonthFoldingAndCalendarDayCountKeepTheSameGridShapeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('OverflowMonthFoldingAndCalendarDayCountKeepTheSameGridShapeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(20, 1902);
        const normalizedYear: int = 1903;
        const normalizedMonth: int = 8;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(22844);
        expect(grid.length).assertEqual(42);
        expect(firstNonZero(grid)).assertEqual(6);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(5, 1903);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });

    /**
     * @tc.name BlankLeadCellsAndOverflowMonthFoldingSupportThePopupPreviewForPreviewPanels
     * @tc.desc BlankLeadCellsAndOverflowMonthFoldingSupportThePopupPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndOverflowMonthFoldingSupportThePopupPreviewForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(2, 1903);
        const expectedLead: int = 0;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
      {
        const grid: int[] = getMonthDate(24, 1904);
        const normalizedYear: int = 1905;
        const normalizedMonth: int = 12;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(22872);
        expect(grid.length).assertEqual(42);
        expect(firstNonZero(grid)).assertEqual(5);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
    });

    /**
     * @tc.name OverflowMonthFoldingAndCalendarDayCountHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.desc OverflowMonthFoldingAndCalendarDayCountHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('OverflowMonthFoldingAndCalendarDayCountHoldWhenTheMonthRollsOverForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(20, 1904);
        const normalizedYear: int = 1905;
        const normalizedMonth: int = 8;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(22868);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(2);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(5, 1905);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const year: int = 1906;
        const month: int = 4;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
          0, 0, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(30);
        expect(GridInspector.facts(produced).leading).assertEqual(0);
      }
    });

    /**
     * @tc.name BlankLeadCellsAndOverflowMonthFoldingMatchAfterSelectionChangeAcrossLeapYears
     * @tc.desc BlankLeadCellsAndOverflowMonthFoldingMatchAfterSelectionChangeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndOverflowMonthFoldingMatchAfterSelectionChangeAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(2, 1905);
        const expectedLead: int = 3;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(0);
        expect(grid[1]).assertEqual(0);
        expect(grid[2]).assertEqual(0);
        expect(grid[3]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
      {
        const grid: int[] = getMonthDate(24, 1906);
        const normalizedYear: int = 1907;
        const normalizedMonth: int = 12;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(22896);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(0);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(9, 1907);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });

    /**
     * @tc.name OverflowMonthFoldingAndCalendarDayCountRemainStableDuringPreviewAcrossLeapYears
     * @tc.desc OverflowMonthFoldingAndCalendarDayCountRemainStableDuringPreviewAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('OverflowMonthFoldingAndCalendarDayCountRemainStableDuringPreviewAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(20, 1906);
        const normalizedYear: int = 1907;
        const normalizedMonth: int = 8;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(22892);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(4);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(5, 1907);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const year: int = 1908;
        const month: int = 4;
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
      {
        const grid: int[] = getMonthDate(1, 1909);
        const expectedLead: int = 5;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(0);
        expect(grid[1]).assertEqual(0);
        expect(grid[2]).assertEqual(0);
        expect(grid[3]).assertEqual(0);
        expect(grid[4]).assertEqual(0);
        expect(grid[5]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
    });

    /**
     * @tc.name CalendarDayCountAndGridSnapshotAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.desc CalendarDayCountAndGridSnapshotAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndGridSnapshotAgreeUnderRepeatedRebuildAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(1, 1906);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const year: int = 1907;
        const month: int = 11;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
          27, 28, 29, 30,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(30);
        expect(GridInspector.facts(produced).leading).assertEqual(5);
      }
    });

    /**
     * @tc.name GridSnapshotAndBlankLeadCellsHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.desc GridSnapshotAndBlankLeadCellsHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndBlankLeadCellsHoldAcrossSeasonBoundariesAcrossLeapYears', 0, () => {
      {
        const year: int = 1907;
        const month: int = 7;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
          30, 31, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(6, 1908);
        const expectedLead: int = 1;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(0);
        expect(grid[1]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
      {
        const grid: int[] = getMonthDate(15, 1909);
        const normalizedYear: int = 1910;
        const normalizedMonth: int = 3;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(22923);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(2);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
    });

    /**
     * @tc.name BlankLeadCellsAndOverflowMonthFoldingKeepTheSameGridShapeAcrossLeapYears
     * @tc.desc BlankLeadCellsAndOverflowMonthFoldingKeepTheSameGridShapeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndOverflowMonthFoldingKeepTheSameGridShapeAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(2, 1907);
        const expectedLead: int = 5;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(0);
        expect(grid[1]).assertEqual(0);
        expect(grid[2]).assertEqual(0);
        expect(grid[3]).assertEqual(0);
        expect(grid[4]).assertEqual(0);
        expect(grid[5]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
      {
        const grid: int[] = getMonthDate(24, 1908);
        const normalizedYear: int = 1909;
        const normalizedMonth: int = 12;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(22920);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(3);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(9, 1909);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const year: int = 1910;
        const month: int = 8;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
          30, 31, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(1);
      }
    });

    /**
     * @tc.name OverflowMonthFoldingAndCalendarDayCountPreserveTheOracleSnapshotAcrossLeapYears
     * @tc.desc OverflowMonthFoldingAndCalendarDayCountPreserveTheOracleSnapshotAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('OverflowMonthFoldingAndCalendarDayCountPreserveTheOracleSnapshotAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(20, 1908);
        const normalizedYear: int = 1909;
        const normalizedMonth: int = 8;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(22916);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(0);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(5, 1909);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });

    /**
     * @tc.name CalendarDayCountAndGridSnapshotTrackTheVisibleColumnsAcrossLeapYears
     * @tc.desc CalendarDayCountAndGridSnapshotTrackTheVisibleColumnsAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndGridSnapshotTrackTheVisibleColumnsAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(1, 1908);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const year: int = 1909;
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
        const grid: int[] = getMonthDate(10, 1910);
        const expectedLead: int = 6;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(0);
        expect(grid[1]).assertEqual(0);
        expect(grid[2]).assertEqual(0);
        expect(grid[3]).assertEqual(0);
        expect(grid[4]).assertEqual(0);
        expect(grid[5]).assertEqual(0);
        expect(observedLead % 7).assertEqual(observedLead);
      }
    });

    /**
     * @tc.name BlankLeadCellsAndOverflowMonthFoldingHoldWhenTheMonthRollsOverAcrossLeapYears
     * @tc.desc BlankLeadCellsAndOverflowMonthFoldingHoldWhenTheMonthRollsOverAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndOverflowMonthFoldingHoldWhenTheMonthRollsOverAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(2, 1909);
        const expectedLead: int = 1;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(0);
        expect(grid[1]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
      {
        const grid: int[] = getMonthDate(24, 1910);
        const normalizedYear: int = 1911;
        const normalizedMonth: int = 12;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(22944);
        expect(grid.length).assertEqual(42);
        expect(firstNonZero(grid)).assertEqual(5);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
    });

    /**
     * @tc.name OverflowMonthFoldingAndCalendarDayCountStayConsistentForTheSamePanelAtDecadeBoundary
     * @tc.desc OverflowMonthFoldingAndCalendarDayCountStayConsistentForTheSamePanelAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('OverflowMonthFoldingAndCalendarDayCountStayConsistentForTheSamePanelAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(20, 1910);
        const normalizedYear: int = 1911;
        const normalizedMonth: int = 8;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(22940);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(2);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(5, 1911);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const year: int = 1912;
        const month: int = 4;
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
    });

    /**
     * @tc.name CalendarDayCountAndGridSnapshotSurviveRepeatedInspectionAtDecadeBoundary
     * @tc.desc CalendarDayCountAndGridSnapshotSurviveRepeatedInspectionAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndGridSnapshotSurviveRepeatedInspectionAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(1, 1910);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const year: int = 1911;
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
      {
        const grid: int[] = getMonthDate(10, 1912);
        const expectedLead: int = 2;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(0);
        expect(grid[1]).assertEqual(0);
        expect(grid[2]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
      {
        const grid: int[] = getMonthDate(19, 1913);
        const normalizedYear: int = 1914;
        const normalizedMonth: int = 7;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(22975);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(3);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
    });

    /**
     * @tc.name GridSnapshotAndBlankLeadCellsMatchAfterSelectionChangeAtDecadeBoundary
     * @tc.desc GridSnapshotAndBlankLeadCellsMatchAfterSelectionChangeAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndBlankLeadCellsMatchAfterSelectionChangeAtDecadeBoundary', 0, () => {
      {
        const year: int = 1911;
        const month: int = 7;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,
          26, 27, 28, 29, 30, 31, 0, 0, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(6);
      }
      {
        const grid: int[] = getMonthDate(6, 1912);
        const expectedLead: int = 6;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(0);
        expect(grid[1]).assertEqual(0);
        expect(grid[2]).assertEqual(0);
        expect(grid[3]).assertEqual(0);
        expect(grid[4]).assertEqual(0);
        expect(grid[5]).assertEqual(0);
        expect(observedLead % 7).assertEqual(observedLead);
      }
    });

    /**
     * @tc.name BlankLeadCellsAndOverflowMonthFoldingRemainStableDuringPreviewAtDecadeBoundary
     * @tc.desc BlankLeadCellsAndOverflowMonthFoldingRemainStableDuringPreviewAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndOverflowMonthFoldingRemainStableDuringPreviewAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(2, 1911);
        const expectedLead: int = 3;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(0);
        expect(grid[1]).assertEqual(0);
        expect(grid[2]).assertEqual(0);
        expect(grid[3]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
      {
        const grid: int[] = getMonthDate(24, 1912);
        const normalizedYear: int = 1913;
        const normalizedMonth: int = 12;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(22968);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(1);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(9, 1913);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });

    /**
     * @tc.name OverflowMonthFoldingAndCalendarDayCountAgreeUnderRepeatedRebuildAtDecadeBoundary
     * @tc.desc OverflowMonthFoldingAndCalendarDayCountAgreeUnderRepeatedRebuildAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('OverflowMonthFoldingAndCalendarDayCountAgreeUnderRepeatedRebuildAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(20, 1912);
        const normalizedYear: int = 1913;
        const normalizedMonth: int = 8;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(22964);
        expect(grid.length).assertEqual(42);
        expect(firstNonZero(grid)).assertEqual(5);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(5, 1913);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const year: int = 1914;
        const month: int = 4;
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
      {
        const grid: int[] = getMonthDate(1, 1915);
        const expectedLead: int = 5;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(0);
        expect(grid[1]).assertEqual(0);
        expect(grid[2]).assertEqual(0);
        expect(grid[3]).assertEqual(0);
        expect(grid[4]).assertEqual(0);
        expect(grid[5]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
    });

    /**
     * @tc.name CalendarDayCountAndGridSnapshotHoldAcrossSeasonBoundariesAtDecadeBoundary
     * @tc.desc CalendarDayCountAndGridSnapshotHoldAcrossSeasonBoundariesAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndGridSnapshotHoldAcrossSeasonBoundariesAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(1, 1912);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const year: int = 1913;
        const month: int = 11;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,
          26, 27, 28, 29, 30, 0, 0, 0, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(30);
        expect(GridInspector.facts(produced).leading).assertEqual(6);
      }
    });

    /**
     * @tc.name GridSnapshotAndBlankLeadCellsKeepTheSameGridShapeAtDecadeBoundary
     * @tc.desc GridSnapshotAndBlankLeadCellsKeepTheSameGridShapeAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndBlankLeadCellsKeepTheSameGridShapeAtDecadeBoundary', 0, () => {
      {
        const year: int = 1913;
        const month: int = 7;
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
        const grid: int[] = getMonthDate(6, 1914);
        const expectedLead: int = 1;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(0);
        expect(grid[1]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
      {
        const grid: int[] = getMonthDate(15, 1915);
        const normalizedYear: int = 1916;
        const normalizedMonth: int = 3;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(22995);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(3);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
    });
  });
}
