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

export default function GridStateManagementTest(): void {
  describe('GridStateManagementTest', () => {
    beforeAll(() => {
      logSuite('GridStateManagementTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('GridStateManagementTest', 'end');
    });

    /**
     * @tc.name SelectionGuardAndGridSnapshotStayConsistentForTheSamePanelForPreviewPanels
     * @tc.desc SelectionGuardAndGridSnapshotStayConsistentForTheSamePanelForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SelectionGuardAndGridSnapshotStayConsistentForTheSamePanelForPreviewPanels', 0, () => {
      {
        const allowed: boolean = SelectionGuard.canSelect(1, 2, 2022, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(2, 2022);
        expect(SelectionGuard.weekdayFromGrid(grid, 1) >= 0).assertTrue();
        expect(CellProjector.project(1, 2, 2022, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(1, 2, 2022, 12, 6, 2026).visible).assertTrue();
      }
      {
        const year: int = 2023;
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
     * @tc.name GridSnapshotAndWeekdayColumnsSurviveRepeatedInspectionForPreviewPanels
     * @tc.desc GridSnapshotAndWeekdayColumnsSurviveRepeatedInspectionForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndWeekdayColumnsSurviveRepeatedInspectionForPreviewPanels', 0, () => {
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
        const day: int = 11;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(11);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(4);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(11)).assertEqual(4);
        expect(rowOf(11)).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(4, 2024);
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
     * @tc.name WeekdayColumnsAndWeekAlignmentMatchAfterSelectionChangeForPreviewPanels
     * @tc.desc WeekdayColumnsAndWeekAlignmentMatchAfterSelectionChangeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndWeekAlignmentMatchAfterSelectionChangeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(1, 2023);
        const day: int = 11;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(10);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(3);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(10)).assertEqual(3);
        expect(rowOf(10)).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(11, 2024);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const allowed: boolean = SelectionGuard.canSelect(13, 10, 2025, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(10, 2025);
        expect(SelectionGuard.weekdayFromGrid(grid, 13) >= 0).assertTrue();
        expect(CellProjector.project(13, 10, 2025, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(13, 10, 2025, 12, 6, 2026).visible).assertTrue();
      }
      {
        const year: int = 2026;
        const month: int = 7;
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
    });

    /**
     * @tc.name WeekAlignmentAndSelectionGuardRemainStableDuringPreviewForPreviewPanels
     * @tc.desc WeekAlignmentAndSelectionGuardRemainStableDuringPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndSelectionGuardRemainStableDuringPreviewForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(7, 2023);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(42);
      }
      {
        const allowed: boolean = SelectionGuard.canSelect(13, 6, 2024, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(6, 2024);
        expect(SelectionGuard.weekdayFromGrid(grid, 13) >= 0).assertTrue();
        expect(CellProjector.project(13, 6, 2024, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(13, 6, 2024, 12, 6, 2026).visible).assertTrue();
      }
    });

    /**
     * @tc.name SelectionGuardAndGridSnapshotAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.desc SelectionGuardAndGridSnapshotAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SelectionGuardAndGridSnapshotAgreeUnderRepeatedRebuildForPreviewPanels', 0, () => {
      {
        const allowed: boolean = SelectionGuard.canSelect(13, 2, 2024, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(2, 2024);
        expect(SelectionGuard.weekdayFromGrid(grid, 13) >= 0).assertTrue();
        expect(CellProjector.project(13, 2, 2024, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(13, 2, 2024, 12, 6, 2026).visible).assertTrue();
      }
      {
        const year: int = 2025;
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
        const grid: int[] = getMonthDate(9, 2026);
        const day: int = 1;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(2);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(2);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(2)).assertEqual(2);
        expect(rowOf(2)).assertEqual(0);
      }
    });

    /**
     * @tc.name GridSnapshotAndWeekdayColumnsHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.desc GridSnapshotAndWeekdayColumnsHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndWeekdayColumnsHoldAcrossSeasonBoundariesForPreviewPanels', 0, () => {
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
        expect(produced[4]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(4);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(31);
      }
      {
        const grid: int[] = getMonthDate(5, 2025);
        const day: int = 31;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(34);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(6);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(34)).assertEqual(6);
        expect(rowOf(34)).assertEqual(4);
      }
      {
        const grid: int[] = getMonthDate(4, 2026);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const allowed: boolean = SelectionGuard.canSelect(25, 1, 2027, 12, 6, 2026);
        expect(allowed).assertEqual(true);
        const grid: int[] = getMonthDate(1, 2027);
        expect(SelectionGuard.weekdayFromGrid(grid, 25) >= 0).assertTrue();
        expect(SelectionGuard.weekdayFromGrid(grid, 25)).assertEqual(1);
        expect(GridInspector.slotOfDay(grid, 25) >= 0).assertTrue();
        expect(CellProjector.project(25, 1, 2027, 12, 6, 2026).visible).assertTrue();
      }
    });

    /**
     * @tc.name WeekdayColumnsAndWeekAlignmentKeepTheSameGridShapeForPreviewPanels
     * @tc.desc WeekdayColumnsAndWeekAlignmentKeepTheSameGridShapeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndWeekAlignmentKeepTheSameGridShapeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(1, 2025);
        const day: int = 31;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(33);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(5);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(33)).assertEqual(5);
        expect(rowOf(33)).assertEqual(4);
      }
      {
        const grid: int[] = getMonthDate(11, 2026);
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
     * @tc.name WeekAlignmentAndSelectionGuardPreserveTheOracleSnapshotForPreviewPanels
     * @tc.desc WeekAlignmentAndSelectionGuardPreserveTheOracleSnapshotForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndSelectionGuardPreserveTheOracleSnapshotForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(7, 2025);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const allowed: boolean = SelectionGuard.canSelect(25, 6, 2026, 12, 6, 2026);
        expect(allowed).assertEqual(true);
        const grid: int[] = getMonthDate(6, 2026);
        expect(SelectionGuard.weekdayFromGrid(grid, 25) >= 0).assertTrue();
        expect(SelectionGuard.weekdayFromGrid(grid, 25)).assertEqual(4);
        expect(GridInspector.slotOfDay(grid, 25) >= 0).assertTrue();
        expect(CellProjector.project(25, 6, 2026, 12, 6, 2026).visible).assertTrue();
      }
      {
        const year: int = 2027;
        const month: int = 3;
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
    });

    /**
     * @tc.name SelectionGuardAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels
     * @tc.desc SelectionGuardAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SelectionGuardAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels', 0, () => {
      {
        const allowed: boolean = SelectionGuard.canSelect(25, 2, 2026, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(2, 2026);
        expect(SelectionGuard.weekdayFromGrid(grid, 25) >= 0).assertTrue();
        expect(CellProjector.project(25, 2, 2026, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(25, 2, 2026, 12, 6, 2026).visible).assertTrue();
      }
      {
        const year: int = 2027;
        const month: int = 12;
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
        const grid: int[] = getMonthDate(9, 2028);
        const day: int = 21;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(25);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(4);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(25)).assertEqual(4);
        expect(rowOf(25)).assertEqual(3);
      }
      {
        const grid: int[] = getMonthDate(8, 2029);
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
     * @tc.name GridSnapshotAndWeekdayColumnsSupportThePopupPreviewForPreviewPanels
     * @tc.desc GridSnapshotAndWeekdayColumnsSupportThePopupPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndWeekdayColumnsSupportThePopupPreviewForPreviewPanels', 0, () => {
      {
        const year: int = 2026;
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
        const grid: int[] = getMonthDate(5, 2027);
        const day: int = 20;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(25);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(4);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(25)).assertEqual(4);
        expect(rowOf(25)).assertEqual(3);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndWeekAlignmentHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.desc WeekdayColumnsAndWeekAlignmentHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndWeekAlignmentHoldWhenTheMonthRollsOverForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(1, 2027);
        const day: int = 20;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(24);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(3);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(24)).assertEqual(3);
        expect(rowOf(24)).assertEqual(3);
      }
      {
        const grid: int[] = getMonthDate(11, 2028);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const allowed: boolean = SelectionGuard.canSelect(6, 10, 2029, 12, 6, 2026);
        expect(allowed).assertEqual(true);
        const grid: int[] = getMonthDate(10, 2029);
        expect(SelectionGuard.weekdayFromGrid(grid, 6) >= 0).assertTrue();
        expect(SelectionGuard.weekdayFromGrid(grid, 6)).assertEqual(6);
        expect(GridInspector.slotOfDay(grid, 6) >= 0).assertTrue();
        expect(CellProjector.project(6, 10, 2029, 12, 6, 2026).visible).assertTrue();
      }
    });

    /**
     * @tc.name WeekAlignmentAndSelectionGuardStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.desc WeekAlignmentAndSelectionGuardStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndSelectionGuardStayConsistentForTheSamePanelAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(7, 2027);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const allowed: boolean = SelectionGuard.canSelect(7, 6, 2028, 12, 6, 2026);
        expect(allowed).assertEqual(true);
        const grid: int[] = getMonthDate(6, 2028);
        expect(SelectionGuard.weekdayFromGrid(grid, 7) >= 0).assertTrue();
        expect(SelectionGuard.weekdayFromGrid(grid, 7)).assertEqual(3);
        expect(GridInspector.slotOfDay(grid, 7) >= 0).assertTrue();
        expect(CellProjector.project(7, 6, 2028, 12, 6, 2026).visible).assertTrue();
      }
      {
        const year: int = 2029;
        const month: int = 3;
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
        const grid: int[] = getMonthDate(2, 2030);
        const day: int = 15;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(19);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(5);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(19)).assertEqual(5);
        expect(rowOf(19)).assertEqual(2);
      }
    });

    /**
     * @tc.name SelectionGuardAndGridSnapshotSurviveRepeatedInspectionAcrossLeapYears
     * @tc.desc SelectionGuardAndGridSnapshotSurviveRepeatedInspectionAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('SelectionGuardAndGridSnapshotSurviveRepeatedInspectionAcrossLeapYears', 0, () => {
      {
        const allowed: boolean = SelectionGuard.canSelect(8, 2, 2028, 12, 6, 2026);
        expect(allowed).assertEqual(true);
        const grid: int[] = getMonthDate(2, 2028);
        expect(SelectionGuard.weekdayFromGrid(grid, 8) >= 0).assertTrue();
        expect(SelectionGuard.weekdayFromGrid(grid, 8)).assertEqual(2);
        expect(GridInspector.slotOfDay(grid, 8) >= 0).assertTrue();
        expect(CellProjector.project(8, 2, 2028, 12, 6, 2026).visible).assertTrue();
      }
      {
        const year: int = 2029;
        const month: int = 12;
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
     * @tc.name GridSnapshotAndWeekdayColumnsMatchAfterSelectionChangeAcrossLeapYears
     * @tc.desc GridSnapshotAndWeekdayColumnsMatchAfterSelectionChangeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndWeekdayColumnsMatchAfterSelectionChangeAcrossLeapYears', 0, () => {
      {
        const year: int = 2028;
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
        const grid: int[] = getMonthDate(5, 2029);
        const day: int = 9;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(10);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(3);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(10)).assertEqual(3);
        expect(rowOf(10)).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(4, 2030);
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
