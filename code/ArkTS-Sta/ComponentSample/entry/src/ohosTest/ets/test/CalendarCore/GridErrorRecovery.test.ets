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

export default function GridErrorRecoveryTest(): void {
  describe('GridErrorRecoveryTest', () => {
    beforeAll(() => {
      logSuite('GridErrorRecoveryTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('GridErrorRecoveryTest', 'end');
    });

    /**
     * @tc.name OverflowMonthFoldingAndCalendarDayCountStayConsistentForTheSamePanelForPreviewPanels
     * @tc.desc OverflowMonthFoldingAndCalendarDayCountStayConsistentForTheSamePanelForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('OverflowMonthFoldingAndCalendarDayCountStayConsistentForTheSamePanelForPreviewPanels', 0, () => {
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
        const grid: int[] = getMonthDate(1, 2024);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });

    /**
     * @tc.name CalendarDayCountAndWeekAlignmentSurviveRepeatedInspectionForPreviewPanels
     * @tc.desc CalendarDayCountAndWeekAlignmentSurviveRepeatedInspectionForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndWeekAlignmentSurviveRepeatedInspectionForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(10, 2023);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(7, 2024);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const year: int = 2025;
        const month: int = 6;
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
     * @tc.name WeekAlignmentAndGridSnapshotMatchAfterSelectionChangeForPreviewPanels
     * @tc.desc WeekAlignmentAndGridSnapshotMatchAfterSelectionChangeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndGridSnapshotMatchAfterSelectionChangeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 2024);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(6);
        expect(grid.length).assertEqual(42);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const year: int = 2025;
        const month: int = 2;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25,
          26, 27, 28, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(produced[6]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(7);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(24, 2026);
        const normalizedYear: int = 2027;
        const normalizedMonth: int = 12;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(24336);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(3);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(9, 2027);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });

    /**
     * @tc.name GridSnapshotAndOverflowMonthFoldingRemainStableDuringPreviewForPreviewPanels
     * @tc.desc GridSnapshotAndOverflowMonthFoldingRemainStableDuringPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndOverflowMonthFoldingRemainStableDuringPreviewForPreviewPanels', 0, () => {
      {
        const year: int = 2024;
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
      {
        const grid: int[] = getMonthDate(20, 2025);
        const normalizedYear: int = 2026;
        const normalizedMonth: int = 8;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(24320);
        expect(grid.length).assertEqual(42);
        expect(firstNonZero(grid)).assertEqual(6);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
    });

    /**
     * @tc.name OverflowMonthFoldingAndCalendarDayCountAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.desc OverflowMonthFoldingAndCalendarDayCountAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('OverflowMonthFoldingAndCalendarDayCountAgreeUnderRepeatedRebuildForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(16, 2025);
        const normalizedYear: int = 2026;
        const normalizedMonth: int = 4;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(24316);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(3);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(1, 2026);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(11, 2027);
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
     * @tc.name CalendarDayCountAndWeekAlignmentHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.desc CalendarDayCountAndWeekAlignmentHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndWeekAlignmentHoldAcrossSeasonBoundariesForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(10, 2025);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(7, 2026);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const year: int = 2027;
        const month: int = 6;
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
        const grid: int[] = getMonthDate(15, 2028);
        const normalizedYear: int = 2029;
        const normalizedMonth: int = 3;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(24351);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(4);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
    });

    /**
     * @tc.name WeekAlignmentAndGridSnapshotKeepTheSameGridShapeForPreviewPanels
     * @tc.desc WeekAlignmentAndGridSnapshotKeepTheSameGridShapeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndGridSnapshotKeepTheSameGridShapeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 2026);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const year: int = 2027;
        const month: int = 2;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 0,
          0, 0, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(produced[1]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(7);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
    });

    /**
     * @tc.name GridSnapshotAndOverflowMonthFoldingPreserveTheOracleSnapshotForPreviewPanels
     * @tc.desc GridSnapshotAndOverflowMonthFoldingPreserveTheOracleSnapshotForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndOverflowMonthFoldingPreserveTheOracleSnapshotForPreviewPanels', 0, () => {
      {
        const year: int = 2026;
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
        const grid: int[] = getMonthDate(20, 2027);
        const normalizedYear: int = 2028;
        const normalizedMonth: int = 8;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(24344);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(2);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(5, 2028);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });

    /**
     * @tc.name OverflowMonthFoldingAndCalendarDayCountTrackTheVisibleColumnsForPreviewPanels
     * @tc.desc OverflowMonthFoldingAndCalendarDayCountTrackTheVisibleColumnsForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('OverflowMonthFoldingAndCalendarDayCountTrackTheVisibleColumnsForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(16, 2027);
        const normalizedYear: int = 2028;
        const normalizedMonth: int = 4;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(24340);
        expect(grid.length).assertEqual(42);
        expect(firstNonZero(grid)).assertEqual(6);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(1, 2028);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(11, 2029);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(30);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
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
    });

    /**
     * @tc.name CalendarDayCountAndWeekAlignmentSupportThePopupPreviewForPreviewPanels
     * @tc.desc CalendarDayCountAndWeekAlignmentSupportThePopupPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndWeekAlignmentSupportThePopupPreviewForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(10, 2027);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(7, 2028);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(6);
        expect(grid.length).assertEqual(42);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
    });

    /**
     * @tc.name WeekAlignmentAndGridSnapshotHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.desc WeekAlignmentAndGridSnapshotHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndGridSnapshotHoldWhenTheMonthRollsOverForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 2028);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const year: int = 2029;
        const month: int = 2;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
          28, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(produced[4]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(7);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(24, 2030);
        const normalizedYear: int = 2031;
        const normalizedMonth: int = 12;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(24384);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(1);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
    });

    /**
     * @tc.name GridSnapshotAndOverflowMonthFoldingStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.desc GridSnapshotAndOverflowMonthFoldingStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndOverflowMonthFoldingStayConsistentForTheSamePanelAcrossLeapYears', 0, () => {
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
        expect(produced[5]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(5);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(30);
      }
      {
        const grid: int[] = getMonthDate(20, 2029);
        const normalizedYear: int = 2030;
        const normalizedMonth: int = 8;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(24368);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(4);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(5, 2030);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(4, 2031);
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
     * @tc.name OverflowMonthFoldingAndCalendarDayCountSurviveRepeatedInspectionAcrossLeapYears
     * @tc.desc OverflowMonthFoldingAndCalendarDayCountSurviveRepeatedInspectionAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('OverflowMonthFoldingAndCalendarDayCountSurviveRepeatedInspectionAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(16, 2029);
        const normalizedYear: int = 2030;
        const normalizedMonth: int = 4;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(24364);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(1);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(1, 2030);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });
  });
}
