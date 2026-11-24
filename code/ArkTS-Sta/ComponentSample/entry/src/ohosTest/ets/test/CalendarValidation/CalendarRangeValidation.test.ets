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

export default function CalendarRangeValidationTest(): void {
  describe('CalendarRangeValidationTest', () => {
    beforeAll(() => {
      logSuite('CalendarRangeValidationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('CalendarRangeValidationTest', 'end');
    });

    /**
     * @tc.name SaturdayClosureAndDecadeInvariantScanMatchAfterSelectionChangeForPreviewPanels
     * @tc.desc SaturdayClosureAndDecadeInvariantScanMatchAfterSelectionChangeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndDecadeInvariantScanMatchAfterSelectionChangeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(5, 2001);
        const expectedTrailing: int = 2;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const startYear: int = 2002;
        const endYear: int = 2003;
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
        const grid: int[] = getMonthDate(1, 2003);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(11, 2004);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });

    /**
     * @tc.name DecadeInvariantScanAndWeekAlignmentRemainStableDuringPreviewForPreviewPanels
     * @tc.desc DecadeInvariantScanAndWeekAlignmentRemainStableDuringPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('DecadeInvariantScanAndWeekAlignmentRemainStableDuringPreviewForPreviewPanels', 0, () => {
      {
        const startYear: int = 2001;
        const endYear: int = 2002;
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
        const grid: int[] = getMonthDate(10, 2002);
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
     * @tc.name WeekAlignmentAndCalendarDayCountAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.desc WeekAlignmentAndCalendarDayCountAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndCalendarDayCountAgreeUnderRepeatedRebuildForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(6, 2002);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(6);
        expect(grid.length).assertEqual(42);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(30);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(3, 2003);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(2, 2004);
        const expectedTrailing: int = 6;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(29);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
    });

    /**
     * @tc.name CalendarDayCountAndSaturdayClosureHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.desc CalendarDayCountAndSaturdayClosureHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndSaturdayClosureHoldAcrossSeasonBoundariesForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(12, 2002);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(9, 2003);
        const expectedTrailing: int = 4;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const startYear: int = 2004;
        const endYear: int = 2005;
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
        const grid: int[] = getMonthDate(5, 2005);
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
     * @tc.name SaturdayClosureAndDecadeInvariantScanKeepTheSameGridShapeForPreviewPanels
     * @tc.desc SaturdayClosureAndDecadeInvariantScanKeepTheSameGridShapeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndDecadeInvariantScanKeepTheSameGridShapeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(5, 2003);
        const expectedTrailing: int = 0;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const startYear: int = 2004;
        const endYear: int = 2005;
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
     * @tc.name DecadeInvariantScanAndWeekAlignmentPreserveTheOracleSnapshotForPreviewPanels
     * @tc.desc DecadeInvariantScanAndWeekAlignmentPreserveTheOracleSnapshotForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('DecadeInvariantScanAndWeekAlignmentPreserveTheOracleSnapshotForPreviewPanels', 0, () => {
      {
        const startYear: int = 2003;
        const endYear: int = 2004;
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
        const grid: int[] = getMonthDate(10, 2004);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(6);
        expect(grid.length).assertEqual(42);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(7, 2005);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });

    /**
     * @tc.name WeekAlignmentAndCalendarDayCountTrackTheVisibleColumnsForPreviewPanels
     * @tc.desc WeekAlignmentAndCalendarDayCountTrackTheVisibleColumnsForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndCalendarDayCountTrackTheVisibleColumnsForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(6, 2004);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(30);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(3, 2005);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(2, 2006);
        const expectedTrailing: int = 4;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(28);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const startYear: int = 2007;
        const endYear: int = 2008;
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
     * @tc.name CalendarDayCountAndSaturdayClosureSupportThePopupPreviewForPreviewPanels
     * @tc.desc CalendarDayCountAndSaturdayClosureSupportThePopupPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndSaturdayClosureSupportThePopupPreviewForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(12, 2004);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(9, 2005);
        const expectedTrailing: int = 1;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
    });

    /**
     * @tc.name SaturdayClosureAndDecadeInvariantScanHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.desc SaturdayClosureAndDecadeInvariantScanHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndDecadeInvariantScanHoldWhenTheMonthRollsOverForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(5, 2005);
        const expectedTrailing: int = 4;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const startYear: int = 2006;
        const endYear: int = 2007;
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
        const grid: int[] = getMonthDate(1, 2007);
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
     * @tc.name DecadeInvariantScanAndWeekAlignmentStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.desc DecadeInvariantScanAndWeekAlignmentStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('DecadeInvariantScanAndWeekAlignmentStayConsistentForTheSamePanelAcrossLeapYears', 0, () => {
      {
        const startYear: int = 2005;
        const endYear: int = 2006;
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
        const grid: int[] = getMonthDate(10, 2006);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(7, 2007);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(6, 2008);
        const expectedTrailing: int = 5;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
    });

    /**
     * @tc.name WeekAlignmentAndCalendarDayCountSurviveRepeatedInspectionAcrossLeapYears
     * @tc.desc WeekAlignmentAndCalendarDayCountSurviveRepeatedInspectionAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndCalendarDayCountSurviveRepeatedInspectionAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(6, 2006);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(30);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(3, 2007);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });

    /**
     * @tc.name CalendarDayCountAndSaturdayClosureMatchAfterSelectionChangeAcrossLeapYears
     * @tc.desc CalendarDayCountAndSaturdayClosureMatchAfterSelectionChangeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndSaturdayClosureMatchAfterSelectionChangeAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(12, 2006);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(9, 2007);
        const expectedTrailing: int = 6;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const startYear: int = 2008;
        const endYear: int = 2009;
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
     * @tc.name SaturdayClosureAndDecadeInvariantScanRemainStableDuringPreviewAcrossLeapYears
     * @tc.desc SaturdayClosureAndDecadeInvariantScanRemainStableDuringPreviewAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndDecadeInvariantScanRemainStableDuringPreviewAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(5, 2007);
        const expectedTrailing: int = 2;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const startYear: int = 2008;
        const endYear: int = 2009;
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
        const grid: int[] = getMonthDate(1, 2009);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(11, 2010);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });
  });
}
