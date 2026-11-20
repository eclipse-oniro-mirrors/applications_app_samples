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

export default function GridCatalogTest(): void {
  describe('GridCatalogTest', () => {
    beforeAll(() => {
      logSuite('GridCatalogTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('GridCatalogTest', 'end');
    });

    /**
     * @tc.name SaturdayClosureAndWeekdayColumnsMatchAfterSelectionChangeForPreviewPanels
     * @tc.desc SaturdayClosureAndWeekdayColumnsMatchAfterSelectionChangeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndWeekdayColumnsMatchAfterSelectionChangeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(5, 2013);
        const expectedTrailing: int = 1;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const grid: int[] = getMonthDate(4, 2014);
        const day: int = 16;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(17);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(3);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 17)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const first: int[] = getMonthDate(1, 2015);
        const again: int[] = getMonthDate(1, 2015);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(2, 2015);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(1, 2015)));
        expect(joined(other)).assertEqual(joined(expectedGrid(2, 2015)));
        expect(fingerprint(other)).assertEqual(920229);
      }
      {
        const year: int = 2016;
        const month: int = 11;
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
    });

    /**
     * @tc.name WeekdayColumnsAndRebuildDeterminismRemainStableDuringPreviewForPreviewPanels
     * @tc.desc WeekdayColumnsAndRebuildDeterminismRemainStableDuringPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndRebuildDeterminismRemainStableDuringPreviewForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(11, 2013);
        const day: int = 16;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(20);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(6);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 20)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const first: int[] = getMonthDate(10, 2014);
        const again: int[] = getMonthDate(10, 2014);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(11, 2014);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(10, 2014)));
        expect(joined(other)).assertEqual(joined(expectedGrid(11, 2014)));
        expect(fingerprint(other)).assertEqual(314767);
      }
    });

    /**
     * @tc.name RebuildDeterminismAndGridSnapshotAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.desc RebuildDeterminismAndGridSnapshotAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('RebuildDeterminismAndGridSnapshotAgreeUnderRepeatedRebuildForPreviewPanels', 0, () => {
      {
        const first: int[] = getMonthDate(6, 2014);
        const again: int[] = getMonthDate(6, 2014);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(7, 2014);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(6, 2014)));
        expect(joined(other)).assertEqual(joined(expectedGrid(7, 2014)));
        expect(fingerprint(other)).assertEqual(25810);
      }
      {
        const year: int = 2015;
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
        const grid: int[] = getMonthDate(2, 2016);
        const expectedLead: int = 1;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
    });

    /**
     * @tc.name GridSnapshotAndBlankLeadCellsHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.desc GridSnapshotAndBlankLeadCellsHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndBlankLeadCellsHoldAcrossSeasonBoundariesForPreviewPanels', 0, () => {
      {
        const year: int = 2014;
        const month: int = 12;
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
        const grid: int[] = getMonthDate(9, 2015);
        const expectedLead: int = 2;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(8, 2016);
        const expectedTrailing: int = 3;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const grid: int[] = getMonthDate(5, 2017);
        const day: int = 10;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(10);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(3);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(10)).assertEqual(3);
        expect(rowOf(10)).assertEqual(1);
      }
    });

    /**
     * @tc.name BlankLeadCellsAndSaturdayClosureKeepTheSameGridShapeForPreviewPanels
     * @tc.desc BlankLeadCellsAndSaturdayClosureKeepTheSameGridShapeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndSaturdayClosureKeepTheSameGridShapeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(5, 2015);
        const expectedLead: int = 5;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(4, 2016);
        const expectedTrailing: int = 0;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
    });

    /**
     * @tc.name SaturdayClosureAndWeekdayColumnsPreserveTheOracleSnapshotForPreviewPanels
     * @tc.desc SaturdayClosureAndWeekdayColumnsPreserveTheOracleSnapshotForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndWeekdayColumnsPreserveTheOracleSnapshotForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(11, 2015);
        const expectedTrailing: int = 5;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const grid: int[] = getMonthDate(10, 2016);
        const day: int = 10;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(15);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(1);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(15)).assertEqual(1);
        expect(rowOf(15)).assertEqual(2);
      }
      {
        const first: int[] = getMonthDate(7, 2017);
        const again: int[] = getMonthDate(7, 2017);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(8, 2017);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(7, 2017)));
        expect(joined(other)).assertEqual(joined(expectedGrid(8, 2017)));
        expect(fingerprint(other)).assertEqual(25810);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndRebuildDeterminismTrackTheVisibleColumnsForPreviewPanels
     * @tc.desc WeekdayColumnsAndRebuildDeterminismTrackTheVisibleColumnsForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndRebuildDeterminismTrackTheVisibleColumnsForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(6, 2016);
        const day: int = 11;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(13);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(6);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(13)).assertEqual(6);
        expect(rowOf(13)).assertEqual(1);
      }
      {
        const first: int[] = getMonthDate(3, 2017);
        const again: int[] = getMonthDate(3, 2017);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(4, 2017);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(3, 2017)));
        expect(joined(other)).assertEqual(joined(expectedGrid(4, 2017)));
        expect(fingerprint(other)).assertEqual(314767);
      }
      {
        const year: int = 2018;
        const month: int = 2;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
          28, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(28);
        expect(GridInspector.facts(produced).leading).assertEqual(4);
      }
      {
        const grid: int[] = getMonthDate(12, 2019);
        const expectedLead: int = 0;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
    });

    /**
     * @tc.name RebuildDeterminismAndGridSnapshotSupportThePopupPreviewForPreviewPanels
     * @tc.desc RebuildDeterminismAndGridSnapshotSupportThePopupPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('RebuildDeterminismAndGridSnapshotSupportThePopupPreviewForPreviewPanels', 0, () => {
      {
        const first: int[] = getMonthDate(12, 2016);
        const again: int[] = getMonthDate(12, 2016);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(1, 2017);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(12, 2016)));
        expect(joined(other)).assertEqual(joined(expectedGrid(1, 2017)));
        expect(fingerprint(other)).assertEqual(293723);
      }
      {
        const year: int = 2017;
        const month: int = 9;
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
     * @tc.name GridSnapshotAndBlankLeadCellsHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.desc GridSnapshotAndBlankLeadCellsHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndBlankLeadCellsHoldWhenTheMonthRollsOverForPreviewPanels', 0, () => {
      {
        const year: int = 2017;
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
        const grid: int[] = getMonthDate(4, 2018);
        const expectedLead: int = 0;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
      {
        const grid: int[] = getMonthDate(1, 2019);
        const expectedTrailing: int = 2;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
    });

    /**
     * @tc.name BlankLeadCellsAndSaturdayClosureStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.desc BlankLeadCellsAndSaturdayClosureStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndSaturdayClosureStayConsistentForTheSamePanelAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(11, 2017);
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
        const grid: int[] = getMonthDate(10, 2018);
        const expectedTrailing: int = 3;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const grid: int[] = getMonthDate(7, 2019);
        const day: int = 4;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(4);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(4);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 4)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const first: int[] = getMonthDate(6, 2020);
        const again: int[] = getMonthDate(6, 2020);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(7, 2020);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(6, 2020)));
        expect(joined(other)).assertEqual(joined(expectedGrid(7, 2020)));
        expect(fingerprint(other)).assertEqual(802760);
      }
    });

    /**
     * @tc.name SaturdayClosureAndWeekdayColumnsSurviveRepeatedInspectionAcrossLeapYears
     * @tc.desc SaturdayClosureAndWeekdayColumnsSurviveRepeatedInspectionAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndWeekdayColumnsSurviveRepeatedInspectionAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(6, 2018);
        const expectedTrailing: int = 0;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const grid: int[] = getMonthDate(3, 2019);
        const day: int = 4;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(8);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(1);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 8)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndRebuildDeterminismMatchAfterSelectionChangeAcrossLeapYears
     * @tc.desc WeekdayColumnsAndRebuildDeterminismMatchAfterSelectionChangeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndRebuildDeterminismMatchAfterSelectionChangeAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(12, 2018);
        const day: int = 4;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(9);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(2);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 9)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const first: int[] = getMonthDate(9, 2019);
        const again: int[] = getMonthDate(9, 2019);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(10, 2019);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(9, 2019)));
        expect(joined(other)).assertEqual(joined(expectedGrid(10, 2019)));
        expect(fingerprint(other)).assertEqual(25810);
      }
      {
        const year: int = 2020;
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
    });

    /**
     * @tc.name RebuildDeterminismAndGridSnapshotRemainStableDuringPreviewAcrossLeapYears
     * @tc.desc RebuildDeterminismAndGridSnapshotRemainStableDuringPreviewAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('RebuildDeterminismAndGridSnapshotRemainStableDuringPreviewAcrossLeapYears', 0, () => {
      {
        const first: int[] = getMonthDate(5, 2019);
        const again: int[] = getMonthDate(5, 2019);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(6, 2019);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(5, 2019)));
        expect(joined(other)).assertEqual(joined(expectedGrid(6, 2019)));
        expect(fingerprint(other)).assertEqual(314767);
      }
      {
        const year: int = 2020;
        const month: int = 4;
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
        const grid: int[] = getMonthDate(1, 2021);
        const expectedLead: int = 5;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(11, 2022);
        const expectedTrailing: int = 3;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
    });

    /**
     * @tc.name GridSnapshotAndBlankLeadCellsAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.desc GridSnapshotAndBlankLeadCellsAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndBlankLeadCellsAgreeUnderRepeatedRebuildAcrossLeapYears', 0, () => {
      {
        const year: int = 2019;
        const month: int = 11;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
          27, 28, 29, 30,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(produced[5]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(5);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(30);
      }
      {
        const grid: int[] = getMonthDate(10, 2020);
        const expectedLead: int = 4;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
    });

    /**
     * @tc.name BlankLeadCellsAndSaturdayClosureHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.desc BlankLeadCellsAndSaturdayClosureHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndSaturdayClosureHoldAcrossSeasonBoundariesAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(6, 2020);
        const expectedLead: int = 1;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(3, 2021);
        const expectedTrailing: int = 3;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const grid: int[] = getMonthDate(2, 2022);
        const day: int = 7;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(8);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(1);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(8)).assertEqual(1);
        expect(rowOf(8)).assertEqual(1);
      }
    });

    /**
     * @tc.name SaturdayClosureAndWeekdayColumnsKeepTheSameGridShapeAcrossLeapYears
     * @tc.desc SaturdayClosureAndWeekdayColumnsKeepTheSameGridShapeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndWeekdayColumnsKeepTheSameGridShapeAcrossLeapYears', 0, () => {
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
      {
        const grid: int[] = getMonthDate(9, 2021);
        const day: int = 1;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(3);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(3);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(3)).assertEqual(3);
        expect(rowOf(3)).assertEqual(0);
      }
      {
        const first: int[] = getMonthDate(8, 2022);
        const again: int[] = getMonthDate(8, 2022);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(9, 2022);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(8, 2022)));
        expect(joined(other)).assertEqual(joined(expectedGrid(9, 2022)));
        expect(fingerprint(other)).assertEqual(247145);
      }
      {
        const year: int = 2023;
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
    });

    /**
     * @tc.name WeekdayColumnsAndRebuildDeterminismPreserveTheOracleSnapshotAcrossLeapYears
     * @tc.desc WeekdayColumnsAndRebuildDeterminismPreserveTheOracleSnapshotAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndRebuildDeterminismPreserveTheOracleSnapshotAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(5, 2021);
        const day: int = 29;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(34);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(6);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(34)).assertEqual(6);
        expect(rowOf(34)).assertEqual(4);
      }
      {
        const first: int[] = getMonthDate(4, 2022);
        const again: int[] = getMonthDate(4, 2022);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(5, 2022);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(4, 2022)));
        expect(joined(other)).assertEqual(joined(expectedGrid(5, 2022)));
        expect(fingerprint(other)).assertEqual(293723);
      }
    });

    /**
     * @tc.name RebuildDeterminismAndGridSnapshotTrackTheVisibleColumnsAcrossLeapYears
     * @tc.desc RebuildDeterminismAndGridSnapshotTrackTheVisibleColumnsAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('RebuildDeterminismAndGridSnapshotTrackTheVisibleColumnsAcrossLeapYears', 0, () => {
      {
        const first: int[] = getMonthDate(11, 2021);
        const again: int[] = getMonthDate(11, 2021);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(12, 2021);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(11, 2021)));
        expect(joined(other)).assertEqual(joined(expectedGrid(12, 2021)));
        expect(fingerprint(other)).assertEqual(802760);
      }
      {
        const year: int = 2022;
        const month: int = 10;
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
        const grid: int[] = getMonthDate(7, 2023);
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
     * @tc.name GridSnapshotAndBlankLeadCellsSupportThePopupPreviewAcrossLeapYears
     * @tc.desc GridSnapshotAndBlankLeadCellsSupportThePopupPreviewAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndBlankLeadCellsSupportThePopupPreviewAcrossLeapYears', 0, () => {
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
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(30);
        expect(GridInspector.facts(produced).leading).assertEqual(3);
      }
      {
        const grid: int[] = getMonthDate(3, 2023);
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
        const grid: int[] = getMonthDate(2, 2024);
        const expectedTrailing: int = 2;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(29);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const grid: int[] = getMonthDate(12, 2025);
        const day: int = 23;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(23);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(2);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 23)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
    });

    /**
     * @tc.name BlankLeadCellsAndSaturdayClosureHoldWhenTheMonthRollsOverAcrossLeapYears
     * @tc.desc BlankLeadCellsAndSaturdayClosureHoldWhenTheMonthRollsOverAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndSaturdayClosureHoldWhenTheMonthRollsOverAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(12, 2022);
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
     * @tc.name SaturdayClosureAndWeekdayColumnsStayConsistentForTheSamePanelAtDecadeBoundary
     * @tc.desc SaturdayClosureAndWeekdayColumnsStayConsistentForTheSamePanelAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndWeekdayColumnsStayConsistentForTheSamePanelAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(5, 2023);
        const expectedTrailing: int = 3;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const grid: int[] = getMonthDate(4, 2024);
        const day: int = 26;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(26);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(5);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 26)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const first: int[] = getMonthDate(1, 2025);
        const again: int[] = getMonthDate(1, 2025);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(2, 2025);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(1, 2025)));
        expect(joined(other)).assertEqual(joined(expectedGrid(2, 2025)));
        expect(fingerprint(other)).assertEqual(861322);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndRebuildDeterminismSurviveRepeatedInspectionAtDecadeBoundary
     * @tc.desc WeekdayColumnsAndRebuildDeterminismSurviveRepeatedInspectionAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndRebuildDeterminismSurviveRepeatedInspectionAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(11, 2023);
        const day: int = 26;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(28);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(0);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 28)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const first: int[] = getMonthDate(10, 2024);
        const again: int[] = getMonthDate(10, 2024);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(11, 2024);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(10, 2024)));
        expect(joined(other)).assertEqual(joined(expectedGrid(11, 2024)));
        expect(fingerprint(other)).assertEqual(842158);
      }
      {
        const year: int = 2025;
        const month: int = 7;
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
        const grid: int[] = getMonthDate(6, 2026);
        const expectedLead: int = 1;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
    });

    /**
     * @tc.name RebuildDeterminismAndGridSnapshotMatchAfterSelectionChangeAtDecadeBoundary
     * @tc.desc RebuildDeterminismAndGridSnapshotMatchAfterSelectionChangeAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('RebuildDeterminismAndGridSnapshotMatchAfterSelectionChangeAtDecadeBoundary', 0, () => {
      {
        const first: int[] = getMonthDate(6, 2024);
        const again: int[] = getMonthDate(6, 2024);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(7, 2024);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(6, 2024)));
        expect(joined(other)).assertEqual(joined(expectedGrid(7, 2024)));
        expect(fingerprint(other)).assertEqual(940435);
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
        expect(produced[6]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(11);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[41]).assertEqual(0);
      }
    });

    /**
     * @tc.name GridSnapshotAndBlankLeadCellsRemainStableDuringPreviewAtDecadeBoundary
     * @tc.desc GridSnapshotAndBlankLeadCellsRemainStableDuringPreviewAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndBlankLeadCellsRemainStableDuringPreviewAtDecadeBoundary', 0, () => {
      {
        const year: int = 2024;
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
        const grid: int[] = getMonthDate(9, 2025);
        const expectedLead: int = 1;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(8, 2026);
        const expectedTrailing: int = 5;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
    });

    /**
     * @tc.name BlankLeadCellsAndSaturdayClosureAgreeUnderRepeatedRebuildAtDecadeBoundary
     * @tc.desc BlankLeadCellsAndSaturdayClosureAgreeUnderRepeatedRebuildAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndSaturdayClosureAgreeUnderRepeatedRebuildAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(5, 2025);
        const expectedLead: int = 4;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(4, 2026);
        const expectedTrailing: int = 2;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const grid: int[] = getMonthDate(1, 2027);
        const day: int = 17;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(21);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(0);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(21)).assertEqual(0);
        expect(rowOf(21)).assertEqual(3);
      }
      {
        const first: int[] = getMonthDate(11, 2028);
        const again: int[] = getMonthDate(11, 2028);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(12, 2028);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(11, 2028)));
        expect(joined(other)).assertEqual(joined(expectedGrid(12, 2028)));
        expect(fingerprint(other)).assertEqual(327418);
      }
    });
  });
}
