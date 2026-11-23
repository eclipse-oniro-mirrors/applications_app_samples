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

export default function CalendarModelDeepTest(): void {
  describe('CalendarModelDeepTest', () => {
    beforeAll(() => {
      logSuite('CalendarModelDeepTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('CalendarModelDeepTest', 'end');
    });

    /**
     * @tc.name ContiguousDayRunAndCalendarDayCountSurviveRepeatedInspectionForPreviewPanels
     * @tc.desc ContiguousDayRunAndCalendarDayCountSurviveRepeatedInspectionForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('ContiguousDayRunAndCalendarDayCountSurviveRepeatedInspectionForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 2014);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        let previous: number = 0;
        for (let index = 0; index < days.length; index++) {
          expect(days[index] - previous).assertEqual(1);
          previous = days[index];
        }
        expect(previous).assertEqual(31);
        expect(countValue(grid, 1)).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(2, 2015);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(28);
        expect(isLeapYear(2015)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(28);
      }
      {
        const startYear: int = 2016;
        const endYear: int = 2017;
        let panels: number = 0;
        let widest: number = 0;
        for (let year = startYear; year <= endYear; year++) {
          for (let month = 1; month <= 12; month++) {
            const grid: int[] = getMonthDate(month, year);
            expect(grid.length % 7).assertEqual(0);
            expect(isContiguousFromOne(grid)).assertTrue();
            expect(firstNonZero(grid)).assertEqual(firstWeekday(month, year));
            expect(GridInspector.maxValue(grid)).assertEqual(daysInMonth(month, year));
            if (grid.length > widest) {
              widest = grid.length;
            }
            panels = panels + 1;
          }
        }
        expect(panels).assertEqual(24);
        expect(widest).assertEqual(42);
      }
    });

    /**
     * @tc.name CalendarDayCountAndDecadeInvariantScanMatchAfterSelectionChangeForPreviewPanels
     * @tc.desc CalendarDayCountAndDecadeInvariantScanMatchAfterSelectionChangeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndDecadeInvariantScanMatchAfterSelectionChangeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 2015);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(isLeapYear(2015)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
      }
      {
        const startYear: int = 2016;
        const endYear: int = 2017;
        let panels: number = 0;
        let widest: number = 0;
        for (let year = startYear; year <= endYear; year++) {
          for (let month = 1; month <= 12; month++) {
            const grid: int[] = getMonthDate(month, year);
            expect(grid.length % 7).assertEqual(0);
            expect(isContiguousFromOne(grid)).assertTrue();
            expect(firstNonZero(grid)).assertEqual(firstWeekday(month, year));
            expect(GridInspector.maxValue(grid)).assertEqual(daysInMonth(month, year));
            if (grid.length > widest) {
              widest = grid.length;
            }
            panels = panels + 1;
          }
        }
        expect(panels).assertEqual(24);
        expect(widest).assertEqual(42);
      }
      {
        const grid: int[] = getMonthDate(17, 2017);
        const normalizedYear: int = 2018;
        const normalizedMonth: int = 5;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(24221);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(2);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const year: int = 2018;
        const month: int = 4;
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
     * @tc.name DecadeInvariantScanAndOverflowMonthFoldingRemainStableDuringPreviewForPreviewPanels
     * @tc.desc DecadeInvariantScanAndOverflowMonthFoldingRemainStableDuringPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('DecadeInvariantScanAndOverflowMonthFoldingRemainStableDuringPreviewForPreviewPanels', 0, () => {
      {
        const startYear: int = 2015;
        const endYear: int = 2016;
        let panels: number = 0;
        let widest: number = 0;
        for (let year = startYear; year <= endYear; year++) {
          for (let month = 1; month <= 12; month++) {
            const grid: int[] = getMonthDate(month, year);
            expect(grid.length % 7).assertEqual(0);
            expect(isContiguousFromOne(grid)).assertTrue();
            expect(firstNonZero(grid)).assertEqual(firstWeekday(month, year));
            expect(GridInspector.maxValue(grid)).assertEqual(daysInMonth(month, year));
            if (grid.length > widest) {
              widest = grid.length;
            }
            panels = panels + 1;
          }
        }
        expect(panels).assertEqual(24);
        expect(widest).assertEqual(42);
      }
      {
        const grid: int[] = getMonthDate(13, 2016);
        const normalizedYear: int = 2017;
        const normalizedMonth: int = 1;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(24205);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(0);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
    });

    /**
     * @tc.name OverflowMonthFoldingAndGridSnapshotAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.desc OverflowMonthFoldingAndGridSnapshotAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('OverflowMonthFoldingAndGridSnapshotAgreeUnderRepeatedRebuildForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(22, 2016);
        const normalizedYear: int = 2017;
        const normalizedMonth: int = 10;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(24214);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(0);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const year: int = 2017;
        const month: int = 7;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,
          26, 27, 28, 29, 30, 31, 0, 0, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(produced[6]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(11);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[41]).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(6, 2018);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(30);
        expect(isContiguousFromOne(grid)).assertTrue();
        for (let index = 0; index < days.length; index++) {
          expect(days[index]).assertEqual(index + 1);
        }
        expect(days[29]).assertEqual(30);
      }
    });

    /**
     * @tc.name GridSnapshotAndContiguousDayRunHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.desc GridSnapshotAndContiguousDayRunHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndContiguousDayRunHoldAcrossSeasonBoundariesForPreviewPanels', 0, () => {
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
        expect(produced[2]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(4);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(2, 2017);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(28);
        expect(isContiguousFromOne(grid)).assertTrue();
        for (let index = 0; index < days.length; index++) {
          expect(days[index]).assertEqual(index + 1);
        }
        expect(days[27]).assertEqual(28);
      }
      {
        const grid: int[] = getMonthDate(12, 2018);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const startYear: int = 2019;
        const endYear: int = 2020;
        let panels: number = 0;
        let widest: number = 0;
        for (let year = startYear; year <= endYear; year++) {
          for (let month = 1; month <= 12; month++) {
            const grid: int[] = getMonthDate(month, year);
            expect(grid.length % 7).assertEqual(0);
            expect(isContiguousFromOne(grid)).assertTrue();
            expect(firstNonZero(grid)).assertEqual(firstWeekday(month, year));
            expect(GridInspector.maxValue(grid)).assertEqual(daysInMonth(month, year));
            if (grid.length > widest) {
              widest = grid.length;
            }
            panels = panels + 1;
          }
        }
        expect(panels).assertEqual(24);
        expect(widest).assertEqual(42);
      }
    });

    /**
     * @tc.name ContiguousDayRunAndCalendarDayCountKeepTheSameGridShapeForPreviewPanels
     * @tc.desc ContiguousDayRunAndCalendarDayCountKeepTheSameGridShapeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('ContiguousDayRunAndCalendarDayCountKeepTheSameGridShapeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 2017);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(30);
        expect(isContiguousFromOne(grid)).assertTrue();
        for (let index = 0; index < days.length; index++) {
          expect(days[index]).assertEqual(index + 1);
        }
        expect(days[29]).assertEqual(30);
      }
      {
        const grid: int[] = getMonthDate(8, 2018);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });

    /**
     * @tc.name CalendarDayCountAndDecadeInvariantScanPreserveTheOracleSnapshotForPreviewPanels
     * @tc.desc CalendarDayCountAndDecadeInvariantScanPreserveTheOracleSnapshotForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndDecadeInvariantScanPreserveTheOracleSnapshotForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(4, 2017);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const startYear: int = 2018;
        const endYear: int = 2019;
        let panels: number = 0;
        let widest: number = 0;
        for (let year = startYear; year <= endYear; year++) {
          for (let month = 1; month <= 12; month++) {
            const grid: int[] = getMonthDate(month, year);
            expect(grid.length % 7).assertEqual(0);
            expect(isContiguousFromOne(grid)).assertTrue();
            expect(firstNonZero(grid)).assertEqual(firstWeekday(month, year));
            expect(GridInspector.maxValue(grid)).assertEqual(daysInMonth(month, year));
            if (grid.length > widest) {
              widest = grid.length;
            }
            panels = panels + 1;
          }
        }
        expect(panels).assertEqual(24);
        expect(widest).assertEqual(42);
      }
      {
        const grid: int[] = getMonthDate(23, 2019);
        const normalizedYear: int = 2020;
        const normalizedMonth: int = 11;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(24251);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(0);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
    });

    /**
     * @tc.name DecadeInvariantScanAndOverflowMonthFoldingTrackTheVisibleColumnsForPreviewPanels
     * @tc.desc DecadeInvariantScanAndOverflowMonthFoldingTrackTheVisibleColumnsForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('DecadeInvariantScanAndOverflowMonthFoldingTrackTheVisibleColumnsForPreviewPanels', 0, () => {
      {
        const startYear: int = 2018;
        const endYear: int = 2019;
        let panels: number = 0;
        let widest: number = 0;
        for (let year = startYear; year <= endYear; year++) {
          for (let month = 1; month <= 12; month++) {
            const grid: int[] = getMonthDate(month, year);
            expect(grid.length % 7).assertEqual(0);
            expect(isContiguousFromOne(grid)).assertTrue();
            expect(firstNonZero(grid)).assertEqual(firstWeekday(month, year));
            expect(GridInspector.maxValue(grid)).assertEqual(daysInMonth(month, year));
            if (grid.length > widest) {
              widest = grid.length;
            }
            panels = panels + 1;
          }
        }
        expect(panels).assertEqual(24);
        expect(widest).assertEqual(42);
      }
      {
        const grid: int[] = getMonthDate(19, 2019);
        const normalizedYear: int = 2020;
        const normalizedMonth: int = 7;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(24247);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(3);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const year: int = 2020;
        const month: int = 6;
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
        const grid: int[] = getMonthDate(3, 2021);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        let previous: number = 0;
        for (let index = 0; index < days.length; index++) {
          expect(days[index] - previous).assertEqual(1);
          previous = days[index];
        }
        expect(previous).assertEqual(31);
        expect(countValue(grid, 1)).assertEqual(1);
      }
    });

    /**
     * @tc.name OverflowMonthFoldingAndGridSnapshotSupportThePopupPreviewForPreviewPanels
     * @tc.desc OverflowMonthFoldingAndGridSnapshotSupportThePopupPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('OverflowMonthFoldingAndGridSnapshotSupportThePopupPreviewForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(15, 2018);
        const normalizedYear: int = 2019;
        const normalizedMonth: int = 3;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(24231);
        expect(grid.length).assertEqual(42);
        expect(firstNonZero(grid)).assertEqual(5);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const year: int = 2019;
        const month: int = 2;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
          27, 28, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(28);
        expect(GridInspector.facts(produced).leading).assertEqual(5);
      }
    });

    /**
     * @tc.name GridSnapshotAndContiguousDayRunHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.desc GridSnapshotAndContiguousDayRunHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndContiguousDayRunHoldWhenTheMonthRollsOverForPreviewPanels', 0, () => {
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
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(30);
        expect(GridInspector.facts(produced).leading).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(8, 2020);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        let previous: number = 0;
        for (let index = 0; index < days.length; index++) {
          expect(days[index] - previous).assertEqual(1);
          previous = days[index];
        }
        expect(previous).assertEqual(31);
        expect(countValue(grid, 1)).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(5, 2021);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(isLeapYear(2021)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
      }
    });

    /**
     * @tc.name ContiguousDayRunAndCalendarDayCountStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.desc ContiguousDayRunAndCalendarDayCountStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('ContiguousDayRunAndCalendarDayCountStayConsistentForTheSamePanelAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(4, 2019);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(30);
        let previous: number = 0;
        for (let index = 0; index < days.length; index++) {
          expect(days[index] - previous).assertEqual(1);
          previous = days[index];
        }
        expect(previous).assertEqual(30);
        expect(countValue(grid, 1)).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(1, 2020);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(isLeapYear(2020)).assertEqual(true);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
      }
      {
        const startYear: int = 2021;
        const endYear: int = 2022;
        let panels: number = 0;
        let widest: number = 0;
        for (let year = startYear; year <= endYear; year++) {
          for (let month = 1; month <= 12; month++) {
            const grid: int[] = getMonthDate(month, year);
            expect(grid.length % 7).assertEqual(0);
            expect(isContiguousFromOne(grid)).assertTrue();
            expect(firstNonZero(grid)).assertEqual(firstWeekday(month, year));
            expect(GridInspector.maxValue(grid)).assertEqual(daysInMonth(month, year));
            if (grid.length > widest) {
              widest = grid.length;
            }
            panels = panels + 1;
          }
        }
        expect(panels).assertEqual(24);
        expect(widest).assertEqual(42);
      }
      {
        const grid: int[] = getMonthDate(22, 2022);
        const normalizedYear: int = 2023;
        const normalizedMonth: int = 10;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(24286);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(0);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
    });

    /**
     * @tc.name CalendarDayCountAndDecadeInvariantScanSurviveRepeatedInspectionAcrossLeapYears
     * @tc.desc CalendarDayCountAndDecadeInvariantScanSurviveRepeatedInspectionAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndDecadeInvariantScanSurviveRepeatedInspectionAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(10, 2020);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(isLeapYear(2020)).assertEqual(true);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
      }
      {
        const startYear: int = 2021;
        const endYear: int = 2022;
        let panels: number = 0;
        let widest: number = 0;
        for (let year = startYear; year <= endYear; year++) {
          for (let month = 1; month <= 12; month++) {
            const grid: int[] = getMonthDate(month, year);
            expect(grid.length % 7).assertEqual(0);
            expect(isContiguousFromOne(grid)).assertTrue();
            expect(firstNonZero(grid)).assertEqual(firstWeekday(month, year));
            expect(GridInspector.maxValue(grid)).assertEqual(daysInMonth(month, year));
            if (grid.length > widest) {
              widest = grid.length;
            }
            panels = panels + 1;
          }
        }
        expect(panels).assertEqual(24);
        expect(widest).assertEqual(42);
      }
    });

    /**
     * @tc.name DecadeInvariantScanAndOverflowMonthFoldingMatchAfterSelectionChangeAcrossLeapYears
     * @tc.desc DecadeInvariantScanAndOverflowMonthFoldingMatchAfterSelectionChangeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('DecadeInvariantScanAndOverflowMonthFoldingMatchAfterSelectionChangeAcrossLeapYears', 0, () => {
      {
        const startYear: int = 2020;
        const endYear: int = 2021;
        let panels: number = 0;
        let widest: number = 0;
        for (let year = startYear; year <= endYear; year++) {
          for (let month = 1; month <= 12; month++) {
            const grid: int[] = getMonthDate(month, year);
            expect(grid.length % 7).assertEqual(0);
            expect(isContiguousFromOne(grid)).assertTrue();
            expect(firstNonZero(grid)).assertEqual(firstWeekday(month, year));
            expect(GridInspector.maxValue(grid)).assertEqual(daysInMonth(month, year));
            if (grid.length > widest) {
              widest = grid.length;
            }
            panels = panels + 1;
          }
        }
        expect(panels).assertEqual(24);
        expect(widest).assertEqual(42);
      }
      {
        const grid: int[] = getMonthDate(14, 2021);
        const normalizedYear: int = 2022;
        const normalizedMonth: int = 2;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(24266);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(2);
        expect(GridInspector.maxValue(grid)).assertEqual(28);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const year: int = 2022;
        const month: int = 12;
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
     * @tc.name OverflowMonthFoldingAndGridSnapshotRemainStableDuringPreviewAcrossLeapYears
     * @tc.desc OverflowMonthFoldingAndGridSnapshotRemainStableDuringPreviewAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('OverflowMonthFoldingAndGridSnapshotRemainStableDuringPreviewAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(21, 2021);
        const normalizedYear: int = 2022;
        const normalizedMonth: int = 9;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(24273);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(4);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const year: int = 2022;
        const month: int = 8;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
          30, 31, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(produced[1]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(4);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(5, 2023);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        expect(isContiguousFromOne(grid)).assertTrue();
        for (let index = 0; index < days.length; index++) {
          expect(days[index]).assertEqual(index + 1);
        }
        expect(days[30]).assertEqual(31);
      }
      {
        const grid: int[] = getMonthDate(4, 2024);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });

    /**
     * @tc.name GridSnapshotAndContiguousDayRunAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.desc GridSnapshotAndContiguousDayRunAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndContiguousDayRunAgreeUnderRepeatedRebuildAcrossLeapYears', 0, () => {
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
        expect(produced[4]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(5);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(1, 2022);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        expect(isContiguousFromOne(grid)).assertTrue();
        for (let index = 0; index < days.length; index++) {
          expect(days[index]).assertEqual(index + 1);
        }
        expect(days[30]).assertEqual(31);
      }
    });

    /**
     * @tc.name ContiguousDayRunAndCalendarDayCountHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.desc ContiguousDayRunAndCalendarDayCountHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('ContiguousDayRunAndCalendarDayCountHoldAcrossSeasonBoundariesAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(10, 2022);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        expect(isContiguousFromOne(grid)).assertTrue();
        for (let index = 0; index < days.length; index++) {
          expect(days[index]).assertEqual(index + 1);
        }
        expect(days[30]).assertEqual(31);
      }
      {
        const grid: int[] = getMonthDate(7, 2023);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const startYear: int = 2024;
        const endYear: int = 2025;
        let panels: number = 0;
        let widest: number = 0;
        for (let year = startYear; year <= endYear; year++) {
          for (let month = 1; month <= 12; month++) {
            const grid: int[] = getMonthDate(month, year);
            expect(grid.length % 7).assertEqual(0);
            expect(isContiguousFromOne(grid)).assertTrue();
            expect(firstNonZero(grid)).assertEqual(firstWeekday(month, year));
            expect(GridInspector.maxValue(grid)).assertEqual(daysInMonth(month, year));
            if (grid.length > widest) {
              widest = grid.length;
            }
            panels = panels + 1;
          }
        }
        expect(panels).assertEqual(24);
        expect(widest).assertEqual(42);
      }
    });

    /**
     * @tc.name CalendarDayCountAndDecadeInvariantScanKeepTheSameGridShapeAcrossLeapYears
     * @tc.desc CalendarDayCountAndDecadeInvariantScanKeepTheSameGridShapeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndDecadeInvariantScanKeepTheSameGridShapeAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 2022);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const startYear: int = 2023;
        const endYear: int = 2024;
        let panels: number = 0;
        let widest: number = 0;
        for (let year = startYear; year <= endYear; year++) {
          for (let month = 1; month <= 12; month++) {
            const grid: int[] = getMonthDate(month, year);
            expect(grid.length % 7).assertEqual(0);
            expect(isContiguousFromOne(grid)).assertTrue();
            expect(firstNonZero(grid)).assertEqual(firstWeekday(month, year));
            expect(GridInspector.maxValue(grid)).assertEqual(daysInMonth(month, year));
            if (grid.length > widest) {
              widest = grid.length;
            }
            panels = panels + 1;
          }
        }
        expect(panels).assertEqual(24);
        expect(widest).assertEqual(42);
      }
      {
        const grid: int[] = getMonthDate(24, 2024);
        const normalizedYear: int = 2025;
        const normalizedMonth: int = 12;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(24312);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(1);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const year: int = 2025;
        const month: int = 9;
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
     * @tc.name DecadeInvariantScanAndOverflowMonthFoldingPreserveTheOracleSnapshotAcrossLeapYears
     * @tc.desc DecadeInvariantScanAndOverflowMonthFoldingPreserveTheOracleSnapshotAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('DecadeInvariantScanAndOverflowMonthFoldingPreserveTheOracleSnapshotAcrossLeapYears', 0, () => {
      {
        const startYear: int = 2023;
        const endYear: int = 2024;
        let panels: number = 0;
        let widest: number = 0;
        for (let year = startYear; year <= endYear; year++) {
          for (let month = 1; month <= 12; month++) {
            const grid: int[] = getMonthDate(month, year);
            expect(grid.length % 7).assertEqual(0);
            expect(isContiguousFromOne(grid)).assertTrue();
            expect(firstNonZero(grid)).assertEqual(firstWeekday(month, year));
            expect(GridInspector.maxValue(grid)).assertEqual(daysInMonth(month, year));
            if (grid.length > widest) {
              widest = grid.length;
            }
            panels = panels + 1;
          }
        }
        expect(panels).assertEqual(24);
        expect(widest).assertEqual(42);
      }
      {
        const grid: int[] = getMonthDate(20, 2024);
        const normalizedYear: int = 2025;
        const normalizedMonth: int = 8;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(24308);
        expect(grid.length).assertEqual(42);
        expect(firstNonZero(grid)).assertEqual(5);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
    });

    /**
     * @tc.name OverflowMonthFoldingAndGridSnapshotTrackTheVisibleColumnsAcrossLeapYears
     * @tc.desc OverflowMonthFoldingAndGridSnapshotTrackTheVisibleColumnsAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('OverflowMonthFoldingAndGridSnapshotTrackTheVisibleColumnsAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(16, 2023);
        const normalizedYear: int = 2024;
        const normalizedMonth: int = 4;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(24292);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(1);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const year: int = 2024;
        const month: int = 1;
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
        const grid: int[] = getMonthDate(11, 2025);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(30);
        let previous: number = 0;
        for (let index = 0; index < days.length; index++) {
          expect(days[index] - previous).assertEqual(1);
          previous = days[index];
        }
        expect(previous).assertEqual(30);
        expect(countValue(grid, 1)).assertEqual(1);
      }
    });

    /**
     * @tc.name GridSnapshotAndContiguousDayRunSupportThePopupPreviewAcrossLeapYears
     * @tc.desc GridSnapshotAndContiguousDayRunSupportThePopupPreviewAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndContiguousDayRunSupportThePopupPreviewAcrossLeapYears', 0, () => {
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
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(2);
      }
      {
        const grid: int[] = getMonthDate(7, 2025);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        let previous: number = 0;
        for (let index = 0; index < days.length; index++) {
          expect(days[index] - previous).assertEqual(1);
          previous = days[index];
        }
        expect(previous).assertEqual(31);
        expect(countValue(grid, 1)).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(6, 2026);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(isLeapYear(2026)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
      }
      {
        const startYear: int = 2027;
        const endYear: int = 2028;
        let panels: number = 0;
        let widest: number = 0;
        for (let year = startYear; year <= endYear; year++) {
          for (let month = 1; month <= 12; month++) {
            const grid: int[] = getMonthDate(month, year);
            expect(grid.length % 7).assertEqual(0);
            expect(isContiguousFromOne(grid)).assertTrue();
            expect(firstNonZero(grid)).assertEqual(firstWeekday(month, year));
            expect(GridInspector.maxValue(grid)).assertEqual(daysInMonth(month, year));
            if (grid.length > widest) {
              widest = grid.length;
            }
            panels = panels + 1;
          }
        }
        expect(panels).assertEqual(24);
        expect(widest).assertEqual(42);
      }
    });

    /**
     * @tc.name ContiguousDayRunAndCalendarDayCountHoldWhenTheMonthRollsOverAcrossLeapYears
     * @tc.desc ContiguousDayRunAndCalendarDayCountHoldWhenTheMonthRollsOverAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('ContiguousDayRunAndCalendarDayCountHoldWhenTheMonthRollsOverAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 2024);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        let previous: number = 0;
        for (let index = 0; index < days.length; index++) {
          expect(days[index] - previous).assertEqual(1);
          previous = days[index];
        }
        expect(previous).assertEqual(31);
        expect(countValue(grid, 1)).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(2, 2025);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(28);
        expect(isLeapYear(2025)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(28);
      }
    });

    /**
     * @tc.name CalendarDayCountAndDecadeInvariantScanStayConsistentForTheSamePanelAtDecadeBoundary
     * @tc.desc CalendarDayCountAndDecadeInvariantScanStayConsistentForTheSamePanelAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndDecadeInvariantScanStayConsistentForTheSamePanelAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 2025);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(isLeapYear(2025)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
      }
      {
        const startYear: int = 2026;
        const endYear: int = 2027;
        let panels: number = 0;
        let widest: number = 0;
        for (let year = startYear; year <= endYear; year++) {
          for (let month = 1; month <= 12; month++) {
            const grid: int[] = getMonthDate(month, year);
            expect(grid.length % 7).assertEqual(0);
            expect(isContiguousFromOne(grid)).assertTrue();
            expect(firstNonZero(grid)).assertEqual(firstWeekday(month, year));
            expect(GridInspector.maxValue(grid)).assertEqual(daysInMonth(month, year));
            if (grid.length > widest) {
              widest = grid.length;
            }
            panels = panels + 1;
          }
        }
        expect(panels).assertEqual(24);
        expect(widest).assertEqual(42);
      }
      {
        const grid: int[] = getMonthDate(17, 2027);
        const normalizedYear: int = 2028;
        const normalizedMonth: int = 5;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(24341);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(1);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
    });
  });
}
