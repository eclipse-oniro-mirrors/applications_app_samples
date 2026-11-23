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

export default function GridCellModelTest(): void {
  describe('GridCellModelTest', () => {
    beforeAll(() => {
      logSuite('GridCellModelTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('GridCellModelTest', 'end');
    });

    /**
     * @tc.name WeekdayColumnsAndCellProjectionStayConsistentForTheSamePanelForPreviewPanels
     * @tc.desc WeekdayColumnsAndCellProjectionStayConsistentForTheSamePanelForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndCellProjectionStayConsistentForTheSamePanelForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(1, 2016);
        const day: int = 1;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(5);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(5);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(5)).assertEqual(5);
        expect(rowOf(5)).assertEqual(0);
      }
      {
        const style = CellProjector.project(2, 6, 2026, 2, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('2');
        const other = CellProjector.project(2, 11, 2017, 2, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 11, 2017, 2, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name CellProjectionAndSaturdayClosureSurviveRepeatedInspectionForPreviewPanels
     * @tc.desc CellProjectionAndSaturdayClosureSurviveRepeatedInspectionForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndSaturdayClosureSurviveRepeatedInspectionForPreviewPanels', 0, () => {
      {
        const style = CellProjector.project(2, 6, 2026, 2, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('2');
        const other = CellProjector.project(2, 7, 2016, 2, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 7, 2016, 2, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(6, 2017);
        const expectedTrailing: int = 1;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const grid: int[] = getMonthDate(3, 2018);
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
     * @tc.name BlankLeadCellsAndGridSnapshotRemainStableDuringPreviewForPreviewPanels
     * @tc.desc BlankLeadCellsAndGridSnapshotRemainStableDuringPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndGridSnapshotRemainStableDuringPreviewForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(8, 2017);
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
        const year: int = 2018;
        const month: int = 5;
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
    });

    /**
     * @tc.name GridSnapshotAndWeekdayColumnsAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.desc GridSnapshotAndWeekdayColumnsAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndWeekdayColumnsAgreeUnderRepeatedRebuildForPreviewPanels', 0, () => {
      {
        const year: int = 2018;
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
        const grid: int[] = getMonthDate(11, 2019);
        const day: int = 26;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(30);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(2);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 30)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const style = CellProjector.project(7, 6, 2026, 7, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('7');
        const other = CellProjector.project(7, 10, 2020, 7, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 10, 2020, 7, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name WeekdayColumnsAndCellProjectionHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.desc WeekdayColumnsAndCellProjectionHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndCellProjectionHoldAcrossSeasonBoundariesForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(7, 2018);
        const day: int = 26;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(25);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(4);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 25)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const style = CellProjector.project(7, 6, 2026, 7, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('7');
        const other = CellProjector.project(7, 6, 2019, 7, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 6, 2019, 7, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(3, 2020);
        const expectedTrailing: int = 4;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const grid: int[] = getMonthDate(2, 2021);
        const expectedLead: int = 1;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
    });

    /**
     * @tc.name CellProjectionAndSaturdayClosureKeepTheSameGridShapeForPreviewPanels
     * @tc.desc CellProjectionAndSaturdayClosureKeepTheSameGridShapeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndSaturdayClosureKeepTheSameGridShapeForPreviewPanels', 0, () => {
      {
        const style = CellProjector.project(7, 6, 2026, 7, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('7');
        const other = CellProjector.project(7, 2, 2019, 7, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 2, 2019, 7, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(12, 2020);
        const expectedTrailing: int = 2;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
    });

    /**
     * @tc.name SaturdayClosureAndBlankLeadCellsPreserveTheOracleSnapshotForPreviewPanels
     * @tc.desc SaturdayClosureAndBlankLeadCellsPreserveTheOracleSnapshotForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndBlankLeadCellsPreserveTheOracleSnapshotForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(8, 2019);
        const expectedTrailing: int = 0;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const grid: int[] = getMonthDate(5, 2020);
        const expectedLead: int = 5;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
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
        expect(produced[4]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(5);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
    });

    /**
     * @tc.name BlankLeadCellsAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels
     * @tc.desc BlankLeadCellsAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(1, 2020);
        const expectedLead: int = 3;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
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
        expect(produced[1]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(5);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(10, 2022);
        const day: int = 20;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(25);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(4);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(25)).assertEqual(4);
        expect(rowOf(25)).assertEqual(3);
      }
      {
        const style = CellProjector.project(12, 6, 2026, 12, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('12');
        const other = CellProjector.project(12, 7, 2023, 12, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 7, 2023, 12, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name WeekdayColumnsAndCellProjectionHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.desc WeekdayColumnsAndCellProjectionHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndCellProjectionHoldWhenTheMonthRollsOverForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(2, 2021);
        const day: int = 23;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(23);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(2);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(23)).assertEqual(2);
        expect(rowOf(23)).assertEqual(3);
      }
      {
        const style = CellProjector.project(12, 6, 2026, 12, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('12');
        const other = CellProjector.project(12, 12, 2022, 12, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 12, 2022, 12, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(9, 2023);
        const expectedTrailing: int = 0;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
    });

    /**
     * @tc.name CellProjectionAndSaturdayClosureStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.desc CellProjectionAndSaturdayClosureStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndSaturdayClosureStayConsistentForTheSamePanelAcrossLeapYears', 0, () => {
      {
        const style = CellProjector.project(12, 6, 2026, 12, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('12');
        const other = CellProjector.project(12, 8, 2021, 12, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 8, 2021, 12, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(5, 2022);
        const expectedTrailing: int = 4;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const grid: int[] = getMonthDate(4, 2023);
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
    });

    /**
     * @tc.name SaturdayClosureAndBlankLeadCellsSurviveRepeatedInspectionAcrossLeapYears
     * @tc.desc SaturdayClosureAndBlankLeadCellsSurviveRepeatedInspectionAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndBlankLeadCellsSurviveRepeatedInspectionAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(1, 2022);
        const expectedTrailing: int = 5;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const grid: int[] = getMonthDate(11, 2023);
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
    });

    /**
     * @tc.name BlankLeadCellsAndGridSnapshotMatchAfterSelectionChangeAcrossLeapYears
     * @tc.desc BlankLeadCellsAndGridSnapshotMatchAfterSelectionChangeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndGridSnapshotMatchAfterSelectionChangeAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(7, 2022);
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
        const year: int = 2023;
        const month: int = 6;
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
        const grid: int[] = getMonthDate(3, 2024);
        const day: int = 14;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(18);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(4);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 18)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndCellProjectionAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.desc WeekdayColumnsAndCellProjectionAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndCellProjectionAgreeUnderRepeatedRebuildAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(8, 2023);
        const day: int = 14;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(15);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(1);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 15)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const style = CellProjector.project(17, 6, 2026, 17, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('17');
        const other = CellProjector.project(17, 5, 2024, 17, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 5, 2024, 17, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name CellProjectionAndSaturdayClosureHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.desc CellProjectionAndSaturdayClosureHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndSaturdayClosureHoldAcrossSeasonBoundariesAcrossLeapYears', 0, () => {
      {
        const style = CellProjector.project(17, 6, 2026, 17, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('17');
        const other = CellProjector.project(17, 1, 2024, 17, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 1, 2024, 17, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(11, 2025);
        const expectedTrailing: int = 6;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const grid: int[] = getMonthDate(10, 2026);
        const expectedLead: int = 4;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
    });

    /**
     * @tc.name SaturdayClosureAndBlankLeadCellsKeepTheSameGridShapeAcrossLeapYears
     * @tc.desc SaturdayClosureAndBlankLeadCellsKeepTheSameGridShapeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndBlankLeadCellsKeepTheSameGridShapeAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(7, 2024);
        const expectedTrailing: int = 3;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const grid: int[] = getMonthDate(6, 2025);
        const expectedLead: int = 0;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
      {
        const year: int = 2026;
        const month: int = 3;
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
        const grid: int[] = getMonthDate(2, 2027);
        const day: int = 17;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(17);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(3);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(17)).assertEqual(3);
        expect(rowOf(17)).assertEqual(2);
      }
    });

    /**
     * @tc.name BlankLeadCellsAndGridSnapshotPreserveTheOracleSnapshotAcrossLeapYears
     * @tc.desc BlankLeadCellsAndGridSnapshotPreserveTheOracleSnapshotAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndGridSnapshotPreserveTheOracleSnapshotAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(2, 2025);
        const expectedLead: int = 6;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
      {
        const year: int = 2026;
        const month: int = 12;
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
     * @tc.name GridSnapshotAndWeekdayColumnsTrackTheVisibleColumnsAcrossLeapYears
     * @tc.desc GridSnapshotAndWeekdayColumnsTrackTheVisibleColumnsAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndWeekdayColumnsTrackTheVisibleColumnsAcrossLeapYears', 0, () => {
      {
        const year: int = 2025;
        const month: int = 8;
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
      {
        const grid: int[] = getMonthDate(5, 2026);
        const day: int = 8;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(12);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(5);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(12)).assertEqual(5);
        expect(rowOf(12)).assertEqual(1);
      }
      {
        const style = CellProjector.project(22, 6, 2026, 22, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('22');
        const other = CellProjector.project(22, 4, 2027, 22, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 4, 2027, 22, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name WeekdayColumnsAndCellProjectionSupportThePopupPreviewAcrossLeapYears
     * @tc.desc WeekdayColumnsAndCellProjectionSupportThePopupPreviewAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndCellProjectionSupportThePopupPreviewAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(1, 2026);
        const day: int = 8;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(11);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(4);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(11)).assertEqual(4);
        expect(rowOf(11)).assertEqual(1);
      }
      {
        const style = CellProjector.project(22, 6, 2026, 22, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('22');
        const other = CellProjector.project(22, 11, 2027, 22, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 11, 2027, 22, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(10, 2028);
        const expectedTrailing: int = 4;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const grid: int[] = getMonthDate(7, 2029);
        const expectedLead: int = 0;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
    });

    /**
     * @tc.name CellProjectionAndSaturdayClosureHoldWhenTheMonthRollsOverAcrossLeapYears
     * @tc.desc CellProjectionAndSaturdayClosureHoldWhenTheMonthRollsOverAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndSaturdayClosureHoldWhenTheMonthRollsOverAcrossLeapYears', 0, () => {
      {
        const style = CellProjector.project(22, 6, 2026, 22, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('22');
        const other = CellProjector.project(22, 7, 2026, 22, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 7, 2026, 22, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(6, 2027);
        const expectedTrailing: int = 3;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
    });

    /**
     * @tc.name SaturdayClosureAndBlankLeadCellsStayConsistentForTheSamePanelAtDecadeBoundary
     * @tc.desc SaturdayClosureAndBlankLeadCellsStayConsistentForTheSamePanelAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndBlankLeadCellsStayConsistentForTheSamePanelAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(2, 2027);
        const expectedTrailing: int = 6;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(28);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const grid: int[] = getMonthDate(12, 2028);
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
        const year: int = 2029;
        const month: int = 9;
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
     * @tc.name BlankLeadCellsAndGridSnapshotSurviveRepeatedInspectionAtDecadeBoundary
     * @tc.desc BlankLeadCellsAndGridSnapshotSurviveRepeatedInspectionAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndGridSnapshotSurviveRepeatedInspectionAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(8, 2027);
        const expectedLead: int = 0;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
      {
        const year: int = 2028;
        const month: int = 5;
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
        const grid: int[] = getMonthDate(4, 2029);
        const day: int = 6;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(5);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(5);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 5)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const style = CellProjector.project(27, 6, 2026, 27, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('27');
        const other = CellProjector.project(27, 1, 2030, 27, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 1, 2030, 27, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name GridSnapshotAndWeekdayColumnsMatchAfterSelectionChangeAtDecadeBoundary
     * @tc.desc GridSnapshotAndWeekdayColumnsMatchAfterSelectionChangeAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndWeekdayColumnsMatchAfterSelectionChangeAtDecadeBoundary', 0, () => {
      {
        const year: int = 2028;
        const month: int = 1;
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
        const grid: int[] = getMonthDate(11, 2029);
        const day: int = 6;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(9);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(2);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 9)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndCellProjectionRemainStableDuringPreviewAtDecadeBoundary
     * @tc.desc WeekdayColumnsAndCellProjectionRemainStableDuringPreviewAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndCellProjectionRemainStableDuringPreviewAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(7, 2028);
        const day: int = 2;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(7);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(0);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 7)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const style = CellProjector.project(27, 6, 2026, 27, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('27');
        const other = CellProjector.project(27, 6, 2029, 27, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 6, 2029, 27, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(3, 2030);
        const expectedTrailing: int = 6;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
    });
  });
}
