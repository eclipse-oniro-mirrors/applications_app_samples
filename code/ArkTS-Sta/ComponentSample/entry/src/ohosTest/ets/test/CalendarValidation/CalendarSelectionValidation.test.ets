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

export default function CalendarSelectionValidationTest(): void {
  describe('CalendarSelectionValidationTest', () => {
    beforeAll(() => {
      logSuite('CalendarSelectionValidationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('CalendarSelectionValidationTest', 'end');
    });

    /**
     * @tc.name CellProjectionAndWeekdayColumnsSurviveRepeatedInspectionForPreviewPanels
     * @tc.desc CellProjectionAndWeekdayColumnsSurviveRepeatedInspectionForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndWeekdayColumnsSurviveRepeatedInspectionForPreviewPanels', 0, () => {
      {
        const style = CellProjector.project(2, 6, 2026, 2, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('2');
        const other = CellProjector.project(2, 2, 1971, 2, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 2, 1971, 2, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(12, 1972);
        const day: int = 11;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(15);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(1);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(15)).assertEqual(1);
        expect(rowOf(15)).assertEqual(2);
      }
      {
        const year: int = 1973;
        const month: int = 9;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,
          26, 27, 28, 29, 30, 0, 0, 0, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(produced[6]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(12);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[41]).assertEqual(0);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndGridSnapshotMatchAfterSelectionChangeForPreviewPanels
     * @tc.desc WeekdayColumnsAndGridSnapshotMatchAfterSelectionChangeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndGridSnapshotMatchAfterSelectionChangeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(8, 1972);
        const day: int = 11;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(12);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(5);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(12)).assertEqual(5);
        expect(rowOf(12)).assertEqual(1);
      }
      {
        const year: int = 1973;
        const month: int = 5;
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
        const allowed: boolean = SelectionGuard.canSelect(13, 4, 1974, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(4, 1974);
        expect(SelectionGuard.weekdayFromGrid(grid, 13) >= 0).assertTrue();
        expect(CellProjector.project(13, 4, 1974, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(13, 4, 1974, 12, 6, 2026).visible).assertTrue();
      }
      {
        const style = CellProjector.project(6, 6, 2026, 6, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('6');
        const other = CellProjector.project(6, 1, 1975, 6, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 1, 1975, 6, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name GridSnapshotAndSelectionGuardRemainStableDuringPreviewForPreviewPanels
     * @tc.desc GridSnapshotAndSelectionGuardRemainStableDuringPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndSelectionGuardRemainStableDuringPreviewForPreviewPanels', 0, () => {
      {
        const year: int = 1972;
        const month: int = 1;
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
        const allowed: boolean = SelectionGuard.canSelect(13, 11, 1973, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(11, 1973);
        expect(SelectionGuard.weekdayFromGrid(grid, 13) >= 0).assertTrue();
        expect(CellProjector.project(13, 11, 1973, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(13, 11, 1973, 12, 6, 2026).visible).assertTrue();
      }
    });

    /**
     * @tc.name CellProjectionAndWeekdayColumnsHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.desc CellProjectionAndWeekdayColumnsHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndWeekdayColumnsHoldAcrossSeasonBoundariesForPreviewPanels', 0, () => {
      {
        const style = CellProjector.project(6, 6, 2026, 6, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('6');
        const other = CellProjector.project(6, 2, 1973, 6, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 2, 1973, 6, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(12, 1974);
        const day: int = 31;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(30);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(2);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(30)).assertEqual(2);
        expect(rowOf(30)).assertEqual(4);
      }
      {
        const year: int = 1975;
        const month: int = 9;
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
        const allowed: boolean = SelectionGuard.canSelect(25, 8, 1976, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(8, 1976);
        expect(SelectionGuard.weekdayFromGrid(grid, 25) >= 0).assertTrue();
        expect(CellProjector.project(25, 8, 1976, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(25, 8, 1976, 12, 6, 2026).visible).assertTrue();
      }
    });

    /**
     * @tc.name WeekdayColumnsAndGridSnapshotKeepTheSameGridShapeForPreviewPanels
     * @tc.desc WeekdayColumnsAndGridSnapshotKeepTheSameGridShapeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndGridSnapshotKeepTheSameGridShapeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(8, 1974);
        const day: int = 31;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(34);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(6);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(34)).assertEqual(6);
        expect(rowOf(34)).assertEqual(4);
      }
      {
        const year: int = 1975;
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
     * @tc.name GridSnapshotAndSelectionGuardPreserveTheOracleSnapshotForPreviewPanels
     * @tc.desc GridSnapshotAndSelectionGuardPreserveTheOracleSnapshotForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndSelectionGuardPreserveTheOracleSnapshotForPreviewPanels', 0, () => {
      {
        const year: int = 1974;
        const month: int = 1;
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
        const allowed: boolean = SelectionGuard.canSelect(25, 11, 1975, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(11, 1975);
        expect(SelectionGuard.weekdayFromGrid(grid, 25) >= 0).assertTrue();
        expect(CellProjector.project(25, 11, 1975, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(25, 11, 1975, 12, 6, 2026).visible).assertTrue();
      }
      {
        const style = CellProjector.project(10, 6, 2026, 10, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('10');
        const other = CellProjector.project(10, 10, 1976, 10, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 10, 1976, 10, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name CellProjectionAndWeekdayColumnsSupportThePopupPreviewForPreviewPanels
     * @tc.desc CellProjectionAndWeekdayColumnsSupportThePopupPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndWeekdayColumnsSupportThePopupPreviewForPreviewPanels', 0, () => {
      {
        const style = CellProjector.project(10, 6, 2026, 10, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('10');
        const other = CellProjector.project(10, 2, 1975, 10, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 2, 1975, 10, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(12, 1976);
        const day: int = 20;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(22);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(1);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(22)).assertEqual(1);
        expect(rowOf(22)).assertEqual(3);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndGridSnapshotHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.desc WeekdayColumnsAndGridSnapshotHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndGridSnapshotHoldWhenTheMonthRollsOverForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(8, 1976);
        const day: int = 20;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(19);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(5);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(19)).assertEqual(5);
        expect(rowOf(19)).assertEqual(2);
      }
      {
        const year: int = 1977;
        const month: int = 5;
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
        const allowed: boolean = SelectionGuard.canSelect(7, 4, 1978, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(4, 1978);
        expect(SelectionGuard.weekdayFromGrid(grid, 7) >= 0).assertTrue();
        expect(CellProjector.project(7, 4, 1978, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(7, 4, 1978, 12, 6, 2026).visible).assertTrue();
      }
    });

    /**
     * @tc.name GridSnapshotAndSelectionGuardStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.desc GridSnapshotAndSelectionGuardStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndSelectionGuardStayConsistentForTheSamePanelAcrossLeapYears', 0, () => {
      {
        const year: int = 1976;
        const month: int = 1;
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
        const allowed: boolean = SelectionGuard.canSelect(7, 11, 1977, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(11, 1977);
        expect(SelectionGuard.weekdayFromGrid(grid, 7) >= 0).assertTrue();
        expect(CellProjector.project(7, 11, 1977, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(7, 11, 1977, 12, 6, 2026).visible).assertTrue();
      }
      {
        const style = CellProjector.project(14, 6, 2026, 14, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('14');
        const other = CellProjector.project(14, 10, 1978, 14, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 10, 1978, 14, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(7, 1979);
        const day: int = 9;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(8);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(1);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(8)).assertEqual(1);
        expect(rowOf(8)).assertEqual(1);
      }
    });

    /**
     * @tc.name CellProjectionAndWeekdayColumnsMatchAfterSelectionChangeAcrossLeapYears
     * @tc.desc CellProjectionAndWeekdayColumnsMatchAfterSelectionChangeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndWeekdayColumnsMatchAfterSelectionChangeAcrossLeapYears', 0, () => {
      {
        const style = CellProjector.project(14, 6, 2026, 14, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('14');
        const other = CellProjector.project(14, 2, 1977, 14, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 2, 1977, 14, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(12, 1978);
        const day: int = 9;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(13);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(6);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(13)).assertEqual(6);
        expect(rowOf(13)).assertEqual(1);
      }
      {
        const year: int = 1979;
        const month: int = 9;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,
          26, 27, 28, 29, 30, 0, 0, 0, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(produced[6]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(12);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[41]).assertEqual(0);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndGridSnapshotRemainStableDuringPreviewAcrossLeapYears
     * @tc.desc WeekdayColumnsAndGridSnapshotRemainStableDuringPreviewAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndGridSnapshotRemainStableDuringPreviewAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(8, 1978);
        const day: int = 9;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(10);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(3);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(10)).assertEqual(3);
        expect(rowOf(10)).assertEqual(1);
      }
      {
        const year: int = 1979;
        const month: int = 5;
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
        const allowed: boolean = SelectionGuard.canSelect(19, 4, 1980, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(4, 1980);
        expect(SelectionGuard.weekdayFromGrid(grid, 19) >= 0).assertTrue();
        expect(CellProjector.project(19, 4, 1980, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(19, 4, 1980, 12, 6, 2026).visible).assertTrue();
      }
      {
        const style = CellProjector.project(18, 6, 2026, 18, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('18');
        const other = CellProjector.project(18, 1, 1981, 18, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 1, 1981, 18, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name GridSnapshotAndSelectionGuardAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.desc GridSnapshotAndSelectionGuardAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndSelectionGuardAgreeUnderRepeatedRebuildAcrossLeapYears', 0, () => {
      {
        const year: int = 1978;
        const month: int = 1;
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
        const allowed: boolean = SelectionGuard.canSelect(19, 11, 1979, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(11, 1979);
        expect(SelectionGuard.weekdayFromGrid(grid, 19) >= 0).assertTrue();
        expect(CellProjector.project(19, 11, 1979, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(19, 11, 1979, 12, 6, 2026).visible).assertTrue();
      }
    });

    /**
     * @tc.name SelectionGuardAndCellProjectionHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.desc SelectionGuardAndCellProjectionHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('SelectionGuardAndCellProjectionHoldAcrossSeasonBoundariesAcrossLeapYears', 0, () => {
      {
        const allowed: boolean = SelectionGuard.canSelect(18, 7, 1979, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(7, 1979);
        expect(SelectionGuard.weekdayFromGrid(grid, 18) >= 0).assertTrue();
        expect(CellProjector.project(18, 7, 1979, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(18, 7, 1979, 12, 6, 2026).visible).assertTrue();
      }
      {
        const style = CellProjector.project(18, 6, 2026, 18, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('18');
        const other = CellProjector.project(18, 6, 1980, 18, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 6, 1980, 18, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(3, 1981);
        const day: int = 29;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(28);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(0);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(28)).assertEqual(0);
        expect(rowOf(28)).assertEqual(4);
      }
    });

    /**
     * @tc.name CellProjectionAndWeekdayColumnsKeepTheSameGridShapeAcrossLeapYears
     * @tc.desc CellProjectionAndWeekdayColumnsKeepTheSameGridShapeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndWeekdayColumnsKeepTheSameGridShapeAcrossLeapYears', 0, () => {
      {
        const style = CellProjector.project(18, 6, 2026, 18, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('18');
        const other = CellProjector.project(18, 2, 1979, 18, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 2, 1979, 18, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(12, 1980);
        const day: int = 29;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(29);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(1);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(29)).assertEqual(1);
        expect(rowOf(29)).assertEqual(4);
      }
      {
        const year: int = 1981;
        const month: int = 9;
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
        const allowed: boolean = SelectionGuard.canSelect(30, 8, 1982, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(8, 1982);
        expect(SelectionGuard.weekdayFromGrid(grid, 30) >= 0).assertTrue();
        expect(CellProjector.project(30, 8, 1982, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(30, 8, 1982, 12, 6, 2026).visible).assertTrue();
      }
    });

    /**
     * @tc.name GridSnapshotAndSelectionGuardTrackTheVisibleColumnsAcrossLeapYears
     * @tc.desc GridSnapshotAndSelectionGuardTrackTheVisibleColumnsAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndSelectionGuardTrackTheVisibleColumnsAcrossLeapYears', 0, () => {
      {
        const year: int = 1980;
        const month: int = 1;
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
        const allowed: boolean = SelectionGuard.canSelect(1, 11, 1981, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(11, 1981);
        expect(SelectionGuard.weekdayFromGrid(grid, 1) >= 0).assertTrue();
        expect(CellProjector.project(1, 11, 1981, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(1, 11, 1981, 12, 6, 2026).visible).assertTrue();
      }
      {
        const style = CellProjector.project(22, 6, 2026, 22, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('22');
        const other = CellProjector.project(22, 10, 1982, 22, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 10, 1982, 22, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name SelectionGuardAndCellProjectionSupportThePopupPreviewAcrossLeapYears
     * @tc.desc SelectionGuardAndCellProjectionSupportThePopupPreviewAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('SelectionGuardAndCellProjectionSupportThePopupPreviewAcrossLeapYears', 0, () => {
      {
        const allowed: boolean = SelectionGuard.canSelect(30, 7, 1981, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(7, 1981);
        expect(SelectionGuard.weekdayFromGrid(grid, 30) >= 0).assertTrue();
        expect(CellProjector.project(30, 7, 1981, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(30, 7, 1981, 12, 6, 2026).visible).assertTrue();
      }
      {
        const style = CellProjector.project(22, 6, 2026, 22, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('22');
        const other = CellProjector.project(22, 6, 1982, 22, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 6, 1982, 22, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(3, 1983);
        const day: int = 18;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(19);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(5);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(19)).assertEqual(5);
        expect(rowOf(19)).assertEqual(2);
      }
      {
        const year: int = 1984;
        const month: int = 2;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
          28, 29, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(produced[3]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(6);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
    });

    /**
     * @tc.name CellProjectionAndWeekdayColumnsHoldWhenTheMonthRollsOverAcrossLeapYears
     * @tc.desc CellProjectionAndWeekdayColumnsHoldWhenTheMonthRollsOverAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndWeekdayColumnsHoldWhenTheMonthRollsOverAcrossLeapYears', 0, () => {
      {
        const style = CellProjector.project(22, 6, 2026, 22, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('22');
        const other = CellProjector.project(22, 2, 1981, 22, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 2, 1981, 22, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(12, 1982);
        const day: int = 18;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(20);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(6);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(20)).assertEqual(6);
        expect(rowOf(20)).assertEqual(2);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndGridSnapshotStayConsistentForTheSamePanelAtDecadeBoundary
     * @tc.desc WeekdayColumnsAndGridSnapshotStayConsistentForTheSamePanelAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndGridSnapshotStayConsistentForTheSamePanelAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(8, 1982);
        const day: int = 18;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(17);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(3);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(17)).assertEqual(3);
        expect(rowOf(17)).assertEqual(2);
      }
      {
        const year: int = 1983;
        const month: int = 5;
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
        const allowed: boolean = SelectionGuard.canSelect(13, 4, 1984, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(4, 1984);
        expect(SelectionGuard.weekdayFromGrid(grid, 13) >= 0).assertTrue();
        expect(CellProjector.project(13, 4, 1984, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(13, 4, 1984, 12, 6, 2026).visible).assertTrue();
      }
    });

    /**
     * @tc.name GridSnapshotAndSelectionGuardSurviveRepeatedInspectionAtDecadeBoundary
     * @tc.desc GridSnapshotAndSelectionGuardSurviveRepeatedInspectionAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndSelectionGuardSurviveRepeatedInspectionAtDecadeBoundary', 0, () => {
      {
        const year: int = 1982;
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
      {
        const allowed: boolean = SelectionGuard.canSelect(13, 11, 1983, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(11, 1983);
        expect(SelectionGuard.weekdayFromGrid(grid, 13) >= 0).assertTrue();
        expect(CellProjector.project(13, 11, 1983, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(13, 11, 1983, 12, 6, 2026).visible).assertTrue();
      }
      {
        const style = CellProjector.project(26, 6, 2026, 26, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('26');
        const other = CellProjector.project(26, 10, 1984, 26, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 10, 1984, 26, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(7, 1985);
        const day: int = 7;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(7);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(0);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(7)).assertEqual(0);
        expect(rowOf(7)).assertEqual(1);
      }
    });

    /**
     * @tc.name SelectionGuardAndCellProjectionMatchAfterSelectionChangeAtDecadeBoundary
     * @tc.desc SelectionGuardAndCellProjectionMatchAfterSelectionChangeAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('SelectionGuardAndCellProjectionMatchAfterSelectionChangeAtDecadeBoundary', 0, () => {
      {
        const allowed: boolean = SelectionGuard.canSelect(11, 7, 1983, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(7, 1983);
        expect(SelectionGuard.weekdayFromGrid(grid, 11) >= 0).assertTrue();
        expect(CellProjector.project(11, 7, 1983, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(11, 7, 1983, 12, 6, 2026).visible).assertTrue();
      }
      {
        const style = CellProjector.project(26, 6, 2026, 26, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('26');
        const other = CellProjector.project(26, 6, 1984, 26, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 6, 1984, 26, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name CellProjectionAndWeekdayColumnsRemainStableDuringPreviewAtDecadeBoundary
     * @tc.desc CellProjectionAndWeekdayColumnsRemainStableDuringPreviewAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndWeekdayColumnsRemainStableDuringPreviewAtDecadeBoundary', 0, () => {
      {
        const style = CellProjector.project(26, 6, 2026, 26, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('26');
        const other = CellProjector.project(26, 2, 1983, 26, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 2, 1983, 26, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(12, 1984);
        const day: int = 7;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(12);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(5);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(12)).assertEqual(5);
        expect(rowOf(12)).assertEqual(1);
      }
      {
        const year: int = 1985;
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
     * @tc.name WeekdayColumnsAndGridSnapshotAgreeUnderRepeatedRebuildAtDecadeBoundary
     * @tc.desc WeekdayColumnsAndGridSnapshotAgreeUnderRepeatedRebuildAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndGridSnapshotAgreeUnderRepeatedRebuildAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(8, 1984);
        const day: int = 7;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(9);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(2);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(9)).assertEqual(2);
        expect(rowOf(9)).assertEqual(1);
      }
      {
        const year: int = 1985;
        const month: int = 5;
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
        const allowed: boolean = SelectionGuard.canSelect(25, 4, 1986, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(4, 1986);
        expect(SelectionGuard.weekdayFromGrid(grid, 25) >= 0).assertTrue();
        expect(CellProjector.project(25, 4, 1986, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(25, 4, 1986, 12, 6, 2026).visible).assertTrue();
      }
      {
        const style = CellProjector.project(2, 6, 2026, 2, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('2');
        const other = CellProjector.project(2, 1, 1987, 2, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 1, 1987, 2, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });
  });
}
