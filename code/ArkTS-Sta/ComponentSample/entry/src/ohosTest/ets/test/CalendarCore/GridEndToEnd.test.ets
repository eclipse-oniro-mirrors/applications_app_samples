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

export default function GridEndToEndTest(): void {
  describe('GridEndToEndTest', () => {
    beforeAll(() => {
      logSuite('GridEndToEndTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('GridEndToEndTest', 'end');
    });

    /**
     * @tc.name GridSnapshotAndContiguousDayRunStayConsistentForTheSamePanelForPreviewPanels
     * @tc.desc GridSnapshotAndContiguousDayRunStayConsistentForTheSamePanelForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndContiguousDayRunStayConsistentForTheSamePanelForPreviewPanels', 0, () => {
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
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(5);
      }
      {
        const grid: int[] = getMonthDate(5, 2026);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        let previous: number = 0;
        for (let index = 0; index < days.length; index++) {
          expect(days[index] - previous).assertEqual(1);
          previous = days[index];
        }
        expect(previous).assertEqual(31);
        expect(countValue(grid, 1)).assertEqual(1);
      }
    });

    /**
     * @tc.name ContiguousDayRunAndWeekAlignmentSurviveRepeatedInspectionForPreviewPanels
     * @tc.desc ContiguousDayRunAndWeekAlignmentSurviveRepeatedInspectionForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('ContiguousDayRunAndWeekAlignmentSurviveRepeatedInspectionForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(1, 2025);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        let previous: number = 0;
        for (let index = 0; index < days.length; index++) {
          expect(days[index] - previous).assertEqual(1);
          previous = days[index];
        }
        expect(previous).assertEqual(31);
        expect(countValue(grid, 1)).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(11, 2026);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(30);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(10, 2027);
        const day: int = 16;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(20);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(6);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 20)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
    });

    /**
     * @tc.name WeekAlignmentAndWeekdayColumnsMatchAfterSelectionChangeForPreviewPanels
     * @tc.desc WeekAlignmentAndWeekdayColumnsMatchAfterSelectionChangeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndWeekdayColumnsMatchAfterSelectionChangeForPreviewPanels', 0, () => {
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
        const grid: int[] = getMonthDate(6, 2027);
        const day: int = 16;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(17);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(3);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 17)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const year: int = 2028;
        const month: int = 3;
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
        const grid: int[] = getMonthDate(2, 2029);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(28);
        let previous: number = 0;
        for (let index = 0; index < days.length; index++) {
          expect(days[index] - previous).assertEqual(1);
          previous = days[index];
        }
        expect(previous).assertEqual(28);
        expect(countValue(grid, 1)).assertEqual(1);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndGridSnapshotRemainStableDuringPreviewForPreviewPanels
     * @tc.desc WeekdayColumnsAndGridSnapshotRemainStableDuringPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndGridSnapshotRemainStableDuringPreviewForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(2, 2026);
        const day: int = 16;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(15);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(1);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 15)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
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
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(3);
      }
    });

    /**
     * @tc.name GridSnapshotAndContiguousDayRunAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.desc GridSnapshotAndContiguousDayRunAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndContiguousDayRunAgreeUnderRepeatedRebuildForPreviewPanels', 0, () => {
      {
        const year: int = 2027;
        const month: int = 8;
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
        const grid: int[] = getMonthDate(5, 2028);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        let previous: number = 0;
        for (let index = 0; index < days.length; index++) {
          expect(days[index] - previous).assertEqual(1);
          previous = days[index];
        }
        expect(previous).assertEqual(31);
        expect(countValue(grid, 1)).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(4, 2029);
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
     * @tc.name ContiguousDayRunAndWeekAlignmentHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.desc ContiguousDayRunAndWeekAlignmentHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('ContiguousDayRunAndWeekAlignmentHoldAcrossSeasonBoundariesForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(1, 2027);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        let previous: number = 0;
        for (let index = 0; index < days.length; index++) {
          expect(days[index] - previous).assertEqual(1);
          previous = days[index];
        }
        expect(previous).assertEqual(31);
        expect(countValue(grid, 1)).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(11, 2028);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(30);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(10, 2029);
        const day: int = 5;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(5);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(5);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 5)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const year: int = 2030;
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
     * @tc.name WeekAlignmentAndWeekdayColumnsKeepTheSameGridShapeForPreviewPanels
     * @tc.desc WeekAlignmentAndWeekdayColumnsKeepTheSameGridShapeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndWeekdayColumnsKeepTheSameGridShapeForPreviewPanels', 0, () => {
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
      {
        const grid: int[] = getMonthDate(6, 2029);
        const day: int = 6;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(10);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(3);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 10)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndGridSnapshotPreserveTheOracleSnapshotForPreviewPanels
     * @tc.desc WeekdayColumnsAndGridSnapshotPreserveTheOracleSnapshotForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndGridSnapshotPreserveTheOracleSnapshotForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(2, 2028);
        const day: int = 7;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(8);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(1);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 8)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
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
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(6);
      }
      {
        const grid: int[] = getMonthDate(9, 2030);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(30);
        let previous: number = 0;
        for (let index = 0; index < days.length; index++) {
          expect(days[index] - previous).assertEqual(1);
          previous = days[index];
        }
        expect(previous).assertEqual(30);
        expect(countValue(grid, 1)).assertEqual(1);
      }
    });

    /**
     * @tc.name GridSnapshotAndContiguousDayRunTrackTheVisibleColumnsForPreviewPanels
     * @tc.desc GridSnapshotAndContiguousDayRunTrackTheVisibleColumnsForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndContiguousDayRunTrackTheVisibleColumnsForPreviewPanels', 0, () => {
      {
        const year: int = 2029;
        const month: int = 8;
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
        const grid: int[] = getMonthDate(5, 2030);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        let previous: number = 0;
        for (let index = 0; index < days.length; index++) {
          expect(days[index] - previous).assertEqual(1);
          previous = days[index];
        }
        expect(previous).assertEqual(31);
        expect(countValue(grid, 1)).assertEqual(1);
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
      {
        const grid: int[] = getMonthDate(1, 2032);
        const day: int = 25;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(28);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(0);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 28)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
    });

    /**
     * @tc.name ContiguousDayRunAndWeekAlignmentSupportThePopupPreviewForPreviewPanels
     * @tc.desc ContiguousDayRunAndWeekAlignmentSupportThePopupPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('ContiguousDayRunAndWeekAlignmentSupportThePopupPreviewForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(1, 2029);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        let previous: number = 0;
        for (let index = 0; index < days.length; index++) {
          expect(days[index] - previous).assertEqual(1);
          previous = days[index];
        }
        expect(previous).assertEqual(31);
        expect(countValue(grid, 1)).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(11, 2030);
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
     * @tc.name WeekAlignmentAndWeekdayColumnsHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.desc WeekAlignmentAndWeekdayColumnsHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndWeekdayColumnsHoldWhenTheMonthRollsOverForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(7, 2030);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
      {
        const grid: int[] = getMonthDate(6, 2031);
        const day: int = 26;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(25);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(4);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 25)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const year: int = 2032;
        const month: int = 3;
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
     * @tc.name WeekdayColumnsAndGridSnapshotStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.desc WeekdayColumnsAndGridSnapshotStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndGridSnapshotStayConsistentForTheSamePanelAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(2, 2030);
        const day: int = 28;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(32);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(4);
        expect(GridInspector.isRealDay(grid, GridInspector.slotOfDay(grid, day))).assertTrue();
        expect(GridInspector.isRealDay(grid, 32)).assertTrue();
        expect(GridInspector.weekdayOfDay(grid, 0)).assertEqual(-1);
      }
      {
        const year: int = 2031;
        const month: int = 12;
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
        const grid: int[] = getMonthDate(9, 2032);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(30);
        let previous: number = 0;
        for (let index = 0; index < days.length; index++) {
          expect(days[index] - previous).assertEqual(1);
          previous = days[index];
        }
        expect(previous).assertEqual(30);
        expect(countValue(grid, 1)).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(8, 2033);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(facts.rows).assertEqual(5);
        expect(grid.length).assertEqual(35);
        expect(facts.endsOnSaturday).assertTrue();
        expect(facts.days).assertEqual(31);
        expect(GridInspector.rowsOf(grid).length).assertEqual(facts.rows);
      }
    });
  });
}
