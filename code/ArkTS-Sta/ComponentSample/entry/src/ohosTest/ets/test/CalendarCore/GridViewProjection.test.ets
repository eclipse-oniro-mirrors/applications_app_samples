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

export default function GridViewProjectionTest(): void {
  describe('GridViewProjectionTest', () => {
    beforeAll(() => {
      logSuite('GridViewProjectionTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('GridViewProjectionTest', 'end');
    });

    /**
     * @tc.name CellProjectionAndGridSnapshotStayConsistentForTheSamePanelForPreviewPanels
     * @tc.desc CellProjectionAndGridSnapshotStayConsistentForTheSamePanelForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndGridSnapshotStayConsistentForTheSamePanelForPreviewPanels', 0, () => {
      {
        const style = CellProjector.project(1, 6, 2026, 1, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('1');
        const other = CellProjector.project(1, 11, 2021, 1, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 11, 2021, 1, 6, 2026);
        expect(filler.visible).assertFalse();
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
        expect(produced[6]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(11);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[41]).assertEqual(0);
      }
    });

    /**
     * @tc.name WeekAlignmentAndCellProjectionRemainStableDuringPreviewForPreviewPanels
     * @tc.desc WeekAlignmentAndCellProjectionRemainStableDuringPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndCellProjectionRemainStableDuringPreviewForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(5, 2022);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const style = CellProjector.project(5, 6, 2026, 5, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('5');
        const other = CellProjector.project(5, 4, 2023, 5, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 4, 2023, 5, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name CellProjectionAndGridSnapshotAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.desc CellProjectionAndGridSnapshotAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndGridSnapshotAgreeUnderRepeatedRebuildForPreviewPanels', 0, () => {
      {
        const style = CellProjector.project(5, 6, 2026, 5, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('5');
        const other = CellProjector.project(5, 11, 2023, 5, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 11, 2023, 5, 6, 2026);
        expect(filler.visible).assertFalse();
      }
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
        expect(produced[2]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(4);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(7, 2025);
        const day: int = 31;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(32);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(4);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(32)).assertEqual(4);
        expect(rowOf(32)).assertEqual(4);
      }
    });

    /**
     * @tc.name WeekAlignmentAndCellProjectionPreserveTheOracleSnapshotForPreviewPanels
     * @tc.desc WeekAlignmentAndCellProjectionPreserveTheOracleSnapshotForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndCellProjectionPreserveTheOracleSnapshotForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(5, 2024);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const style = CellProjector.project(9, 6, 2026, 9, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('9');
        const other = CellProjector.project(9, 4, 2025, 9, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 4, 2025, 9, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const year: int = 2026;
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
    });

    /**
     * @tc.name CellProjectionAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels
     * @tc.desc CellProjectionAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels', 0, () => {
      {
        const style = CellProjector.project(9, 6, 2026, 9, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('9');
        const other = CellProjector.project(9, 11, 2025, 9, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 11, 2025, 9, 6, 2026);
        expect(filler.visible).assertFalse();
      }
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
        const day: int = 20;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(23);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(2);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(23)).assertEqual(2);
        expect(rowOf(23)).assertEqual(3);
      }
      {
        const grid: int[] = getMonthDate(6, 2028);
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
     * @tc.name WeekAlignmentAndCellProjectionStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.desc WeekAlignmentAndCellProjectionStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndCellProjectionStayConsistentForTheSamePanelAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(5, 2026);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(42);
      }
      {
        const style = CellProjector.project(13, 6, 2026, 13, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('13');
        const other = CellProjector.project(13, 4, 2027, 13, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 4, 2027, 13, 6, 2026);
        expect(filler.visible).assertFalse();
      }
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
        expect(produced[6]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(11);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[41]).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(11, 2029);
        const day: int = 11;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(14);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(0);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(14)).assertEqual(0);
        expect(rowOf(14)).assertEqual(2);
      }
    });

    /**
     * @tc.name CellProjectionAndGridSnapshotSurviveRepeatedInspectionAcrossLeapYears
     * @tc.desc CellProjectionAndGridSnapshotSurviveRepeatedInspectionAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndGridSnapshotSurviveRepeatedInspectionAcrossLeapYears', 0, () => {
      {
        const style = CellProjector.project(13, 6, 2026, 13, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('13');
        const other = CellProjector.project(13, 11, 2027, 13, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 11, 2027, 13, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const year: int = 2028;
        const month: int = 10;
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
    });

    /**
     * @tc.name WeekdayColumnsAndWeekAlignmentRemainStableDuringPreviewAcrossLeapYears
     * @tc.desc WeekdayColumnsAndWeekAlignmentRemainStableDuringPreviewAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndWeekAlignmentRemainStableDuringPreviewAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(12, 2028);
        const day: int = 9;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(13);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(6);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(13)).assertEqual(6);
        expect(rowOf(13)).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(9, 2029);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(42);
      }
      {
        const style = CellProjector.project(17, 6, 2026, 17, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('17');
        const other = CellProjector.project(17, 8, 2030, 17, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 8, 2030, 17, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const year: int = 2031;
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
     * @tc.name WeekAlignmentAndCellProjectionAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.desc WeekAlignmentAndCellProjectionAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndCellProjectionAgreeUnderRepeatedRebuildAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(5, 2028);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const style = CellProjector.project(17, 6, 2026, 17, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('17');
        const other = CellProjector.project(17, 4, 2029, 17, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 4, 2029, 17, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name CellProjectionAndGridSnapshotHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.desc CellProjectionAndGridSnapshotHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndGridSnapshotHoldAcrossSeasonBoundariesAcrossLeapYears', 0, () => {
      {
        const style = CellProjector.project(17, 6, 2026, 17, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('17');
        const other = CellProjector.project(17, 11, 2029, 17, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 11, 2029, 17, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const year: int = 2030;
        const month: int = 10;
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
        const grid: int[] = getMonthDate(7, 2031);
        const day: int = 29;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(30);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(2);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(30)).assertEqual(2);
        expect(rowOf(30)).assertEqual(4);
      }
    });

    /**
     * @tc.name GridSnapshotAndWeekdayColumnsKeepTheSameGridShapeAcrossLeapYears
     * @tc.desc GridSnapshotAndWeekdayColumnsKeepTheSameGridShapeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndWeekdayColumnsKeepTheSameGridShapeAcrossLeapYears', 0, () => {
      {
        const year: int = 2029;
        const month: int = 6;
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
        const grid: int[] = getMonthDate(3, 2030);
        const day: int = 29;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(33);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(5);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(33)).assertEqual(5);
        expect(rowOf(33)).assertEqual(4);
      }
      {
        const grid: int[] = getMonthDate(2, 2031);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const style = CellProjector.project(21, 6, 2026, 21, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('21');
        const other = CellProjector.project(21, 12, 2032, 21, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 12, 2032, 21, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name WeekdayColumnsAndWeekAlignmentPreserveTheOracleSnapshotAcrossLeapYears
     * @tc.desc WeekdayColumnsAndWeekAlignmentPreserveTheOracleSnapshotAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndWeekAlignmentPreserveTheOracleSnapshotAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(12, 2030);
        const day: int = 29;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(28);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(0);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(28)).assertEqual(0);
        expect(rowOf(28)).assertEqual(4);
      }
      {
        const grid: int[] = getMonthDate(9, 2031);
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
