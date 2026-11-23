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

export default function DaySelectionTest(): void {
  describe('DaySelectionTest', () => {
    beforeAll(() => {
      logSuite('DaySelectionTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('DaySelectionTest', 'end');
    });

    /**
     * @tc.name SelectionGuardAndCellProjectionStayConsistentForTheSamePanelForPreviewPanels
     * @tc.desc SelectionGuardAndCellProjectionStayConsistentForTheSamePanelForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SelectionGuardAndCellProjectionStayConsistentForTheSamePanelForPreviewPanels', 0, () => {
      {
        const allowed: boolean = SelectionGuard.canSelect(1, 9, 2020, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(9, 2020);
        expect(SelectionGuard.weekdayFromGrid(grid, 1) >= 0).assertTrue();
        expect(CellProjector.project(1, 9, 2020, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(1, 9, 2020, 12, 6, 2026).visible).assertTrue();
      }
      {
        const style = CellProjector.project(2, 6, 2026, 2, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('2');
        const other = CellProjector.project(2, 8, 2021, 2, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 8, 2021, 2, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name CellProjectionAndGridSnapshotSurviveRepeatedInspectionForPreviewPanels
     * @tc.desc CellProjectionAndGridSnapshotSurviveRepeatedInspectionForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndGridSnapshotSurviveRepeatedInspectionForPreviewPanels', 0, () => {
      {
        const style = CellProjector.project(2, 6, 2026, 2, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('2');
        const other = CellProjector.project(2, 4, 2020, 2, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 4, 2020, 2, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const year: int = 2021;
        const month: int = 1;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
          27, 28, 29, 30, 31, 0, 0, 0, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(5);
      }
      {
        const grid: int[] = getMonthDate(11, 2022);
        const day: int = 16;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(17);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(3);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 17)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
    });

    /**
     * @tc.name GridSnapshotAndWeekdayColumnsMatchAfterSelectionChangeForPreviewPanels
     * @tc.desc GridSnapshotAndWeekdayColumnsMatchAfterSelectionChangeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndWeekdayColumnsMatchAfterSelectionChangeForPreviewPanels', 0, () => {
      {
        const year: int = 2021;
        const month: int = 10;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
          27, 28, 29, 30, 31, 0, 0, 0, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(5);
      }
      {
        const grid: int[] = getMonthDate(7, 2022);
        const day: int = 16;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(20);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(6);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 20)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const allowed: boolean = SelectionGuard.canSelect(13, 6, 2023, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(6, 2023);
        expect(SelectionGuard.weekdayFromGrid(grid, 13) >= 0).assertTrue();
        expect(CellProjector.project(13, 6, 2023, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(13, 6, 2023, 12, 6, 2026).visible).assertTrue();
      }
      {
        const style = CellProjector.project(6, 6, 2026, 6, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('6');
        const other = CellProjector.project(6, 3, 2024, 6, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 3, 2024, 6, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name WeekdayColumnsAndSelectionGuardRemainStableDuringPreviewForPreviewPanels
     * @tc.desc WeekdayColumnsAndSelectionGuardRemainStableDuringPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndSelectionGuardRemainStableDuringPreviewForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 2021);
        const day: int = 16;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(16);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(2);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 16)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const allowed: boolean = SelectionGuard.canSelect(13, 2, 2022, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(2, 2022);
        expect(SelectionGuard.weekdayFromGrid(grid, 13) >= 0).assertTrue();
        expect(CellProjector.project(13, 2, 2022, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(13, 2, 2022, 12, 6, 2026).visible).assertTrue();
      }
    });

    /**
     * @tc.name SelectionGuardAndCellProjectionAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.desc SelectionGuardAndCellProjectionAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SelectionGuardAndCellProjectionAgreeUnderRepeatedRebuildForPreviewPanels', 0, () => {
      {
        const allowed: boolean = SelectionGuard.canSelect(13, 9, 2022, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(9, 2022);
        expect(SelectionGuard.weekdayFromGrid(grid, 13) >= 0).assertTrue();
        expect(CellProjector.project(13, 9, 2022, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(13, 9, 2022, 12, 6, 2026).visible).assertTrue();
      }
      {
        const style = CellProjector.project(6, 6, 2026, 6, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('6');
        const other = CellProjector.project(6, 8, 2023, 6, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 8, 2023, 6, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const year: int = 2024;
        const month: int = 5;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
          28, 29, 30, 31, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(3);
      }
    });

    /**
     * @tc.name CellProjectionAndGridSnapshotHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.desc CellProjectionAndGridSnapshotHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndGridSnapshotHoldAcrossSeasonBoundariesForPreviewPanels', 0, () => {
      {
        const style = CellProjector.project(6, 6, 2026, 6, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('6');
        const other = CellProjector.project(6, 4, 2022, 6, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 4, 2022, 6, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const year: int = 2023;
        const month: int = 1;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
          31, 0, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(11, 2024);
        const day: int = 6;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(10);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(3);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 10)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const allowed: boolean = SelectionGuard.canSelect(25, 10, 2025, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(10, 2025);
        expect(SelectionGuard.weekdayFromGrid(grid, 25) >= 0).assertTrue();
        expect(CellProjector.project(25, 10, 2025, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(25, 10, 2025, 12, 6, 2026).visible).assertTrue();
      }
    });

    /**
     * @tc.name GridSnapshotAndWeekdayColumnsKeepTheSameGridShapeForPreviewPanels
     * @tc.desc GridSnapshotAndWeekdayColumnsKeepTheSameGridShapeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndWeekdayColumnsKeepTheSameGridShapeForPreviewPanels', 0, () => {
      {
        const year: int = 2023;
        const month: int = 10;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
          31, 0, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(7, 2024);
        const day: int = 5;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(5);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(5);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 5)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndSelectionGuardPreserveTheOracleSnapshotForPreviewPanels
     * @tc.desc WeekdayColumnsAndSelectionGuardPreserveTheOracleSnapshotForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndSelectionGuardPreserveTheOracleSnapshotForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 2023);
        const day: int = 5;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(7);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(0);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 7)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const allowed: boolean = SelectionGuard.canSelect(25, 2, 2024, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(2, 2024);
        expect(SelectionGuard.weekdayFromGrid(grid, 25) >= 0).assertTrue();
        expect(CellProjector.project(25, 2, 2024, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(25, 2, 2024, 12, 6, 2026).visible).assertTrue();
      }
      {
        const style = CellProjector.project(10, 6, 2026, 10, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('10');
        const other = CellProjector.project(10, 12, 2025, 10, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 12, 2025, 10, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name SelectionGuardAndCellProjectionTrackTheVisibleColumnsForPreviewPanels
     * @tc.desc SelectionGuardAndCellProjectionTrackTheVisibleColumnsForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SelectionGuardAndCellProjectionTrackTheVisibleColumnsForPreviewPanels', 0, () => {
      {
        const allowed: boolean = SelectionGuard.canSelect(25, 9, 2024, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(9, 2024);
        expect(SelectionGuard.weekdayFromGrid(grid, 25) >= 0).assertTrue();
        expect(CellProjector.project(25, 9, 2024, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(25, 9, 2024, 12, 6, 2026).visible).assertTrue();
      }
      {
        const style = CellProjector.project(10, 6, 2026, 10, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('10');
        const other = CellProjector.project(10, 8, 2025, 10, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 8, 2025, 10, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const year: int = 2026;
        const month: int = 5;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
          27, 28, 29, 30, 31, 0, 0, 0, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(5);
      }
      {
        const grid: int[] = getMonthDate(4, 2027);
        const day: int = 26;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(29);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(1);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 29)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
    });

    /**
     * @tc.name CellProjectionAndGridSnapshotSupportThePopupPreviewForPreviewPanels
     * @tc.desc CellProjectionAndGridSnapshotSupportThePopupPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndGridSnapshotSupportThePopupPreviewForPreviewPanels', 0, () => {
      {
        const style = CellProjector.project(10, 6, 2026, 10, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('10');
        const other = CellProjector.project(10, 4, 2024, 10, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 4, 2024, 10, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const year: int = 2025;
        const month: int = 1;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
          28, 29, 30, 31, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(3);
      }
    });

    /**
     * @tc.name GridSnapshotAndWeekdayColumnsHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.desc GridSnapshotAndWeekdayColumnsHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndWeekdayColumnsHoldWhenTheMonthRollsOverForPreviewPanels', 0, () => {
      {
        const year: int = 2025;
        const month: int = 10;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
          28, 29, 30, 31, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(3);
      }
      {
        const grid: int[] = getMonthDate(7, 2026);
        const day: int = 25;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(27);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(6);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 27)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const allowed: boolean = SelectionGuard.canSelect(7, 6, 2027, 12, 6, 2026);
        expect(allowed).assertEqual(true);
        const grid: int[] = getMonthDate(6, 2027);
        expect(SelectionGuard.weekdayFromGrid(grid, 7) >= 0).assertTrue();
        expect(SelectionGuard.weekdayFromGrid(grid, 7)).assertEqual(1);
        expect(GridInspector.slotOfDay(grid, 7) >= 0).assertTrue();
        expect(CellProjector.project(7, 6, 2027, 12, 6, 2026).visible).assertTrue();
      }
    });

    /**
     * @tc.name WeekdayColumnsAndSelectionGuardStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.desc WeekdayColumnsAndSelectionGuardStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndSelectionGuardStayConsistentForTheSamePanelAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 2025);
        const day: int = 25;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(30);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(2);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 30)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const allowed: boolean = SelectionGuard.canSelect(9, 2, 2026, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(2, 2026);
        expect(SelectionGuard.weekdayFromGrid(grid, 9) >= 0).assertTrue();
        expect(CellProjector.project(9, 2, 2026, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(9, 2, 2026, 12, 6, 2026).visible).assertTrue();
      }
      {
        const style = CellProjector.project(14, 6, 2026, 14, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('14');
        const other = CellProjector.project(14, 12, 2027, 14, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 12, 2027, 14, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const year: int = 2028;
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
     * @tc.name SelectionGuardAndCellProjectionSurviveRepeatedInspectionAcrossLeapYears
     * @tc.desc SelectionGuardAndCellProjectionSurviveRepeatedInspectionAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('SelectionGuardAndCellProjectionSurviveRepeatedInspectionAcrossLeapYears', 0, () => {
      {
        const allowed: boolean = SelectionGuard.canSelect(7, 9, 2026, 12, 6, 2026);
        expect(allowed).assertEqual(true);
        const grid: int[] = getMonthDate(9, 2026);
        expect(SelectionGuard.weekdayFromGrid(grid, 7) >= 0).assertTrue();
        expect(SelectionGuard.weekdayFromGrid(grid, 7)).assertEqual(1);
        expect(GridInspector.slotOfDay(grid, 7) >= 0).assertTrue();
        expect(CellProjector.project(7, 9, 2026, 12, 6, 2026).visible).assertTrue();
      }
      {
        const style = CellProjector.project(14, 6, 2026, 14, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('14');
        const other = CellProjector.project(14, 8, 2027, 14, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 8, 2027, 14, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name CellProjectionAndGridSnapshotMatchAfterSelectionChangeAcrossLeapYears
     * @tc.desc CellProjectionAndGridSnapshotMatchAfterSelectionChangeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndGridSnapshotMatchAfterSelectionChangeAcrossLeapYears', 0, () => {
      {
        const style = CellProjector.project(14, 6, 2026, 14, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('14');
        const other = CellProjector.project(14, 4, 2026, 14, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 4, 2026, 14, 6, 2026);
        expect(filler.visible).assertFalse();
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
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(5);
      }
      {
        const grid: int[] = getMonthDate(11, 2028);
        const day: int = 16;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(18);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(4);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 18)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
    });

    /**
     * @tc.name GridSnapshotAndWeekdayColumnsRemainStableDuringPreviewAcrossLeapYears
     * @tc.desc GridSnapshotAndWeekdayColumnsRemainStableDuringPreviewAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndWeekdayColumnsRemainStableDuringPreviewAcrossLeapYears', 0, () => {
      {
        const year: int = 2027;
        const month: int = 10;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26,
          27, 28, 29, 30, 31, 0, 0, 0, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(5);
      }
      {
        const grid: int[] = getMonthDate(7, 2028);
        const day: int = 14;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(19);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(5);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 19)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const allowed: boolean = SelectionGuard.canSelect(19, 6, 2029, 12, 6, 2026);
        expect(allowed).assertEqual(true);
        const grid: int[] = getMonthDate(6, 2029);
        expect(SelectionGuard.weekdayFromGrid(grid, 19) >= 0).assertTrue();
        expect(SelectionGuard.weekdayFromGrid(grid, 19)).assertEqual(2);
        expect(GridInspector.slotOfDay(grid, 19) >= 0).assertTrue();
        expect(CellProjector.project(19, 6, 2029, 12, 6, 2026).visible).assertTrue();
      }
      {
        const style = CellProjector.project(18, 6, 2026, 18, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('18');
        const other = CellProjector.project(18, 3, 2030, 18, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 3, 2030, 18, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });
  });
}
