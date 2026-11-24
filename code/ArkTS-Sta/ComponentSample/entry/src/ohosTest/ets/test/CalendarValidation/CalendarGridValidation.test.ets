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

export default function CalendarGridValidationTest(): void {
  describe('CalendarGridValidationTest', () => {
    beforeAll(() => {
      logSuite('CalendarGridValidationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('CalendarGridValidationTest', 'end');
    });

    /**
     * @tc.name GridSnapshotAndWeekAlignmentSurviveRepeatedInspectionForPreviewPanels
     * @tc.desc GridSnapshotAndWeekAlignmentSurviveRepeatedInspectionForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndWeekAlignmentSurviveRepeatedInspectionForPreviewPanels', 0, () => {
      {
        const year: int = 1900;
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
      {
        const grid: int[] = getMonthDate(1, 1901);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(11, 1902);
        const expectedTrailing: int = 6;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
    });

    /**
     * @tc.name WeekAlignmentAndSaturdayClosureMatchAfterSelectionChangeForPreviewPanels
     * @tc.desc WeekAlignmentAndSaturdayClosureMatchAfterSelectionChangeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndSaturdayClosureMatchAfterSelectionChangeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(10, 1901);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(7, 1902);
        const expectedTrailing: int = 2;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const startYear: int = 1903;
        const endYear: int = 1904;
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
        const year: int = 1904;
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
    });

    /**
     * @tc.name SaturdayClosureAndDecadeInvariantScanRemainStableDuringPreviewForPreviewPanels
     * @tc.desc SaturdayClosureAndDecadeInvariantScanRemainStableDuringPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndDecadeInvariantScanRemainStableDuringPreviewForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 1901);
        const expectedTrailing: int = 6;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const startYear: int = 1902;
        const endYear: int = 1903;
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
     * @tc.name DecadeInvariantScanAndGridSnapshotAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.desc DecadeInvariantScanAndGridSnapshotAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('DecadeInvariantScanAndGridSnapshotAgreeUnderRepeatedRebuildForPreviewPanels', 0, () => {
      {
        const startYear: int = 1902;
        const endYear: int = 1903;
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
        const year: int = 1903;
        const month: int = 8;
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
        const grid: int[] = getMonthDate(5, 1904);
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
     * @tc.name GridSnapshotAndWeekAlignmentHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.desc GridSnapshotAndWeekAlignmentHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndWeekAlignmentHoldAcrossSeasonBoundariesForPreviewPanels', 0, () => {
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
        expect(produced[2]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(5);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(1, 1903);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(11, 1904);
        const expectedTrailing: int = 3;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const startYear: int = 1905;
        const endYear: int = 1906;
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
     * @tc.name WeekAlignmentAndSaturdayClosureKeepTheSameGridShapeForPreviewPanels
     * @tc.desc WeekAlignmentAndSaturdayClosureKeepTheSameGridShapeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndSaturdayClosureKeepTheSameGridShapeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(10, 1903);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(7, 1904);
        const expectedTrailing: int = 6;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
    });

    /**
     * @tc.name SaturdayClosureAndDecadeInvariantScanPreserveTheOracleSnapshotForPreviewPanels
     * @tc.desc SaturdayClosureAndDecadeInvariantScanPreserveTheOracleSnapshotForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndDecadeInvariantScanPreserveTheOracleSnapshotForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 1903);
        const expectedTrailing: int = 4;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const startYear: int = 1904;
        const endYear: int = 1905;
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
        const year: int = 1905;
        const month: int = 12;
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
     * @tc.name DecadeInvariantScanAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels
     * @tc.desc DecadeInvariantScanAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('DecadeInvariantScanAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels', 0, () => {
      {
        const startYear: int = 1904;
        const endYear: int = 1905;
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
        const year: int = 1905;
        const month: int = 8;
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
        const grid: int[] = getMonthDate(5, 1906);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(4, 1907);
        const expectedTrailing: int = 4;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
    });

    /**
     * @tc.name WeekAlignmentAndSaturdayClosureHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.desc WeekAlignmentAndSaturdayClosureHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndSaturdayClosureHoldWhenTheMonthRollsOverForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(10, 1905);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(7, 1906);
        const expectedTrailing: int = 4;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const startYear: int = 1907;
        const endYear: int = 1908;
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
     * @tc.name SaturdayClosureAndDecadeInvariantScanStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.desc SaturdayClosureAndDecadeInvariantScanStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndDecadeInvariantScanStayConsistentForTheSamePanelAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 1905);
        const expectedTrailing: int = 1;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const startYear: int = 1906;
        const endYear: int = 1907;
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
        const year: int = 1907;
        const month: int = 12;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
          31, 0, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(produced[0]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(4);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(9, 1908);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(30);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
    });

    /**
     * @tc.name DecadeInvariantScanAndGridSnapshotSurviveRepeatedInspectionAcrossLeapYears
     * @tc.desc DecadeInvariantScanAndGridSnapshotSurviveRepeatedInspectionAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('DecadeInvariantScanAndGridSnapshotSurviveRepeatedInspectionAcrossLeapYears', 0, () => {
      {
        const startYear: int = 1906;
        const endYear: int = 1907;
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
        const year: int = 1907;
        const month: int = 8;
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
  });
}
