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

export default function MonthPanelConfigTest(): void {
  describe('MonthPanelConfigTest', () => {
    beforeAll(() => {
      logSuite('MonthPanelConfigTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('MonthPanelConfigTest', 'end');
    });

    /**
     * @tc.name WeekAlignmentAndCalendarDayCountStayConsistentForTheSamePanelForPreviewPanels
     * @tc.desc WeekAlignmentAndCalendarDayCountStayConsistentForTheSamePanelForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndCalendarDayCountStayConsistentForTheSamePanelForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 2017);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(2, 2018);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(28);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(28);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });

    /**
     * @tc.name CalendarDayCountAndPanelPairAdvanceSurviveRepeatedInspectionForPreviewPanels
     * @tc.desc CalendarDayCountAndPanelPairAdvanceSurviveRepeatedInspectionForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndPanelPairAdvanceSurviveRepeatedInspectionForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 2017);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const first: int[] = getMonthDate(8, 2018);
        const second: int[] = getMonthDate(9, 2018);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(42);
        expect(firstNonZero(first)).assertEqual(firstWeekday(8, 2018));
        expect(firstNonZero(second)).assertEqual(firstWeekday(9, 2018));
        if (8 === 12) {
          expect(monthLabel(1, 2019).indexOf('2019') >= 0).assertTrue();
        } else {
          expect(monthLabel(9, 2018).indexOf('2018') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(9, 2018));
      }
      {
        const grid: int[] = getMonthDate(5, 2019);
        const expectedTrailing: int = 1;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
    });

    /**
     * @tc.name PanelPairAdvanceAndSaturdayClosureMatchAfterSelectionChangeForPreviewPanels
     * @tc.desc PanelPairAdvanceAndSaturdayClosureMatchAfterSelectionChangeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelPairAdvanceAndSaturdayClosureMatchAfterSelectionChangeForPreviewPanels', 0, () => {
      {
        const first: int[] = getMonthDate(4, 2018);
        const second: int[] = getMonthDate(5, 2018);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(4, 2018));
        expect(firstNonZero(second)).assertEqual(firstWeekday(5, 2018));
        if (4 === 12) {
          expect(monthLabel(1, 2019).indexOf('2019') >= 0).assertTrue();
        } else {
          expect(monthLabel(5, 2018).indexOf('2018') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(5, 2018));
      }
      {
        const grid: int[] = getMonthDate(1, 2019);
        const expectedTrailing: int = 2;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const year: int = 2020;
        const month: int = 11;
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
        const grid: int[] = getMonthDate(10, 2021);
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
     * @tc.name SaturdayClosureAndGridSnapshotRemainStableDuringPreviewForPreviewPanels
     * @tc.desc SaturdayClosureAndGridSnapshotRemainStableDuringPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndGridSnapshotRemainStableDuringPreviewForPreviewPanels', 0, () => {
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
        const year: int = 2019;
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
    });

    /**
     * @tc.name WeekAlignmentAndCalendarDayCountHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.desc WeekAlignmentAndCalendarDayCountHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndCalendarDayCountHoldAcrossSeasonBoundariesForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 2019);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const grid: int[] = getMonthDate(8, 2020);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(isLeapYear(2020)).assertEqual(true);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
      }
      {
        const first: int[] = getMonthDate(5, 2021);
        const second: int[] = getMonthDate(6, 2021);
        expect(first.length).assertEqual(42);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(5, 2021));
        expect(firstNonZero(second)).assertEqual(firstWeekday(6, 2021));
        if (5 === 12) {
          expect(monthLabel(1, 2022).indexOf('2022') >= 0).assertTrue();
        } else {
          expect(monthLabel(6, 2021).indexOf('2021') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(6, 2021));
      }
      {
        const grid: int[] = getMonthDate(4, 2022);
        const expectedTrailing: int = 0;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
    });

    /**
     * @tc.name CalendarDayCountAndPanelPairAdvanceKeepTheSameGridShapeForPreviewPanels
     * @tc.desc CalendarDayCountAndPanelPairAdvanceKeepTheSameGridShapeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndPanelPairAdvanceKeepTheSameGridShapeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(4, 2020);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(isLeapYear(2020)).assertEqual(true);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
      }
      {
        const first: int[] = getMonthDate(1, 2021);
        const second: int[] = getMonthDate(2, 2021);
        expect(first.length).assertEqual(42);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(1, 2021));
        expect(firstNonZero(second)).assertEqual(firstWeekday(2, 2021));
        if (1 === 12) {
          expect(monthLabel(1, 2022).indexOf('2022') >= 0).assertTrue();
        } else {
          expect(monthLabel(2, 2021).indexOf('2021') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(2, 2021));
      }
    });

    /**
     * @tc.name PanelPairAdvanceAndSaturdayClosurePreserveTheOracleSnapshotForPreviewPanels
     * @tc.desc PanelPairAdvanceAndSaturdayClosurePreserveTheOracleSnapshotForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelPairAdvanceAndSaturdayClosurePreserveTheOracleSnapshotForPreviewPanels', 0, () => {
      {
        const first: int[] = getMonthDate(10, 2020);
        const second: int[] = getMonthDate(11, 2020);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(10, 2020));
        expect(firstNonZero(second)).assertEqual(firstWeekday(11, 2020));
        if (10 === 12) {
          expect(monthLabel(1, 2021).indexOf('2021') >= 0).assertTrue();
        } else {
          expect(monthLabel(11, 2020).indexOf('2020') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(11, 2020));
      }
      {
        const grid: int[] = getMonthDate(7, 2021);
        const expectedTrailing: int = 0;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const year: int = 2022;
        const month: int = 6;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
          28, 29, 30, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(produced[3]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(5);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
    });

    /**
     * @tc.name SaturdayClosureAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels
     * @tc.desc SaturdayClosureAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 2021);
        const expectedTrailing: int = 3;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const year: int = 2022;
        const month: int = 2;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28,
          0, 0, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(produced[2]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(7);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(12, 2023);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(6);
        expect(grid.length).assertEqual(42);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(9, 2024);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });

    /**
     * @tc.name GridSnapshotAndWeekAlignmentSupportThePopupPreviewForPreviewPanels
     * @tc.desc GridSnapshotAndWeekAlignmentSupportThePopupPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndWeekAlignmentSupportThePopupPreviewForPreviewPanels', 0, () => {
      {
        const year: int = 2021;
        const month: int = 9;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
          28, 29, 30, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(produced[3]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(5);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(8, 2022);
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
     * @tc.name WeekAlignmentAndCalendarDayCountHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.desc WeekAlignmentAndCalendarDayCountHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndCalendarDayCountHoldWhenTheMonthRollsOverForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(4, 2022);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(30);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(1, 2023);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const first: int[] = getMonthDate(11, 2024);
        const second: int[] = getMonthDate(12, 2024);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(11, 2024));
        expect(firstNonZero(second)).assertEqual(firstWeekday(12, 2024));
        if (11 === 12) {
          expect(monthLabel(1, 2025).indexOf('2025') >= 0).assertTrue();
        } else {
          expect(monthLabel(12, 2024).indexOf('2024') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(12, 2024));
      }
    });

    /**
     * @tc.name CalendarDayCountAndPanelPairAdvanceStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.desc CalendarDayCountAndPanelPairAdvanceStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndPanelPairAdvanceStayConsistentForTheSamePanelAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(10, 2022);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const first: int[] = getMonthDate(7, 2023);
        const second: int[] = getMonthDate(8, 2023);
        expect(first.length).assertEqual(42);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(7, 2023));
        expect(firstNonZero(second)).assertEqual(firstWeekday(8, 2023));
        if (7 === 12) {
          expect(monthLabel(1, 2024).indexOf('2024') >= 0).assertTrue();
        } else {
          expect(monthLabel(8, 2023).indexOf('2023') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(8, 2023));
      }
      {
        const grid: int[] = getMonthDate(6, 2024);
        const expectedTrailing: int = 6;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const year: int = 2025;
        const month: int = 3;
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
    });

    /**
     * @tc.name PanelPairAdvanceAndSaturdayClosureSurviveRepeatedInspectionAcrossLeapYears
     * @tc.desc PanelPairAdvanceAndSaturdayClosureSurviveRepeatedInspectionAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelPairAdvanceAndSaturdayClosureSurviveRepeatedInspectionAcrossLeapYears', 0, () => {
      {
        const first: int[] = getMonthDate(3, 2023);
        const second: int[] = getMonthDate(4, 2023);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(42);
        expect(firstNonZero(first)).assertEqual(firstWeekday(3, 2023));
        expect(firstNonZero(second)).assertEqual(firstWeekday(4, 2023));
        if (3 === 12) {
          expect(monthLabel(1, 2024).indexOf('2024') >= 0).assertTrue();
        } else {
          expect(monthLabel(4, 2023).indexOf('2023') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(4, 2023));
      }
      {
        const grid: int[] = getMonthDate(2, 2024);
        const expectedTrailing: int = 2;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(29);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
    });

    /**
     * @tc.name SaturdayClosureAndGridSnapshotMatchAfterSelectionChangeAcrossLeapYears
     * @tc.desc SaturdayClosureAndGridSnapshotMatchAfterSelectionChangeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndGridSnapshotMatchAfterSelectionChangeAcrossLeapYears', 0, () => {
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
        const year: int = 2024;
        const month: int = 8;
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
        const grid: int[] = getMonthDate(5, 2025);
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
     * @tc.name GridSnapshotAndWeekAlignmentRemainStableDuringPreviewAcrossLeapYears
     * @tc.desc GridSnapshotAndWeekAlignmentRemainStableDuringPreviewAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndWeekAlignmentRemainStableDuringPreviewAcrossLeapYears', 0, () => {
      {
        const year: int = 2024;
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
      {
        const grid: int[] = getMonthDate(1, 2025);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const grid: int[] = getMonthDate(11, 2026);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(isLeapYear(2026)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
      }
      {
        const first: int[] = getMonthDate(10, 2027);
        const second: int[] = getMonthDate(11, 2027);
        expect(first.length).assertEqual(42);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(10, 2027));
        expect(firstNonZero(second)).assertEqual(firstWeekday(11, 2027));
        if (10 === 12) {
          expect(monthLabel(1, 2028).indexOf('2028') >= 0).assertTrue();
        } else {
          expect(monthLabel(11, 2027).indexOf('2027') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(11, 2027));
      }
    });

    /**
     * @tc.name WeekAlignmentAndCalendarDayCountAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.desc WeekAlignmentAndCalendarDayCountAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndCalendarDayCountAgreeUnderRepeatedRebuildAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(10, 2024);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const grid: int[] = getMonthDate(7, 2025);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(isLeapYear(2025)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
      }
    });

    /**
     * @tc.name CalendarDayCountAndPanelPairAdvanceHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.desc CalendarDayCountAndPanelPairAdvanceHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndPanelPairAdvanceHoldAcrossSeasonBoundariesAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 2025);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(isLeapYear(2025)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
      }
      {
        const first: int[] = getMonthDate(2, 2026);
        const second: int[] = getMonthDate(3, 2026);
        expect(first.length).assertEqual(28);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(2, 2026));
        expect(firstNonZero(second)).assertEqual(firstWeekday(3, 2026));
        if (2 === 12) {
          expect(monthLabel(1, 2027).indexOf('2027') >= 0).assertTrue();
        } else {
          expect(monthLabel(3, 2026).indexOf('2026') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(3, 2026));
      }
      {
        const grid: int[] = getMonthDate(12, 2027);
        const expectedTrailing: int = 1;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
    });

    /**
     * @tc.name PanelPairAdvanceAndSaturdayClosureKeepTheSameGridShapeAcrossLeapYears
     * @tc.desc PanelPairAdvanceAndSaturdayClosureKeepTheSameGridShapeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelPairAdvanceAndSaturdayClosureKeepTheSameGridShapeAcrossLeapYears', 0, () => {
      {
        const first: int[] = getMonthDate(9, 2025);
        const second: int[] = getMonthDate(10, 2025);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(9, 2025));
        expect(firstNonZero(second)).assertEqual(firstWeekday(10, 2025));
        if (9 === 12) {
          expect(monthLabel(1, 2026).indexOf('2026') >= 0).assertTrue();
        } else {
          expect(monthLabel(10, 2025).indexOf('2025') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(10, 2025));
      }
      {
        const grid: int[] = getMonthDate(8, 2026);
        const expectedTrailing: int = 5;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const year: int = 2027;
        const month: int = 5;
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
        const grid: int[] = getMonthDate(4, 2028);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(6);
        expect(grid.length).assertEqual(42);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(30);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
    });

    /**
     * @tc.name SaturdayClosureAndGridSnapshotPreserveTheOracleSnapshotAcrossLeapYears
     * @tc.desc SaturdayClosureAndGridSnapshotPreserveTheOracleSnapshotAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndGridSnapshotPreserveTheOracleSnapshotAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(4, 2026);
        const expectedTrailing: int = 2;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const year: int = 2027;
        const month: int = 1;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
          27, 28, 29, 30, 31, 0, 0, 0, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(produced[5]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(11);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[41]).assertEqual(0);
      }
    });

    /**
     * @tc.name GridSnapshotAndWeekAlignmentTrackTheVisibleColumnsAcrossLeapYears
     * @tc.desc GridSnapshotAndWeekAlignmentTrackTheVisibleColumnsAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndWeekAlignmentTrackTheVisibleColumnsAcrossLeapYears', 0, () => {
      {
        const year: int = 2026;
        const month: int = 10;
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
      {
        const grid: int[] = getMonthDate(7, 2027);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(6, 2028);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });

    /**
     * @tc.name WeekAlignmentAndCalendarDayCountSupportThePopupPreviewAcrossLeapYears
     * @tc.desc WeekAlignmentAndCalendarDayCountSupportThePopupPreviewAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndCalendarDayCountSupportThePopupPreviewAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 2027);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(2, 2028);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(29);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(29);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const first: int[] = getMonthDate(12, 2029);
        const second: int[] = getMonthDate(1, 2030);
        expect(first.length).assertEqual(42);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(12, 2029));
        expect(firstNonZero(second)).assertEqual(firstWeekday(1, 2030));
        if (12 === 12) {
          expect(monthLabel(1, 2030).indexOf('2030') >= 0).assertTrue();
        } else {
          expect(monthLabel(1, 2029).indexOf('2029') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(1, 2030));
      }
      {
        const grid: int[] = getMonthDate(9, 2030);
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
     * @tc.name CalendarDayCountAndPanelPairAdvanceHoldWhenTheMonthRollsOverAcrossLeapYears
     * @tc.desc CalendarDayCountAndPanelPairAdvanceHoldWhenTheMonthRollsOverAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndPanelPairAdvanceHoldWhenTheMonthRollsOverAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 2027);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const first: int[] = getMonthDate(8, 2028);
        const second: int[] = getMonthDate(9, 2028);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(8, 2028));
        expect(firstNonZero(second)).assertEqual(firstWeekday(9, 2028));
        if (8 === 12) {
          expect(monthLabel(1, 2029).indexOf('2029') >= 0).assertTrue();
        } else {
          expect(monthLabel(9, 2028).indexOf('2028') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(9, 2028));
      }
    });

    /**
     * @tc.name PanelPairAdvanceAndSaturdayClosureStayConsistentForTheSamePanelAtDecadeBoundary
     * @tc.desc PanelPairAdvanceAndSaturdayClosureStayConsistentForTheSamePanelAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelPairAdvanceAndSaturdayClosureStayConsistentForTheSamePanelAtDecadeBoundary', 0, () => {
      {
        const first: int[] = getMonthDate(4, 2028);
        const second: int[] = getMonthDate(5, 2028);
        expect(first.length).assertEqual(42);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(4, 2028));
        expect(firstNonZero(second)).assertEqual(firstWeekday(5, 2028));
        if (4 === 12) {
          expect(monthLabel(1, 2029).indexOf('2029') >= 0).assertTrue();
        } else {
          expect(monthLabel(5, 2028).indexOf('2028') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(5, 2028));
      }
      {
        const grid: int[] = getMonthDate(1, 2029);
        const expectedTrailing: int = 3;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const year: int = 2030;
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
  });
}
