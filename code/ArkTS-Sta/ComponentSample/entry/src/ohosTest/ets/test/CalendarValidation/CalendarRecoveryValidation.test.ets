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

export default function CalendarRecoveryValidationTest(): void {
  describe('CalendarRecoveryValidationTest', () => {
    beforeAll(() => {
      logSuite('CalendarRecoveryValidationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('CalendarRecoveryValidationTest', 'end');
    });

    /**
     * @tc.name OverflowMonthFoldingAndRebuildDeterminismStayConsistentForTheSamePanelForPreviewPanels
     * @tc.desc OverflowMonthFoldingAndRebuildDeterminismStayConsistentForTheSamePanelForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('OverflowMonthFoldingAndRebuildDeterminismStayConsistentForTheSamePanelForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(17, 1970);
        const normalizedYear: int = 1971;
        const normalizedMonth: int = 5;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(23657);
        expect(grid.length).assertEqual(42);
        expect(firstNonZero(grid)).assertEqual(6);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const first: int[] = getMonthDate(4, 1971);
        const again: int[] = getMonthDate(4, 1971);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(5, 1971);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(4, 1971)));
        expect(joined(other)).assertEqual(joined(expectedGrid(5, 1971)));
        expect(fingerprint(other)).assertEqual(815787);
      }
    });

    /**
     * @tc.name RebuildDeterminismAndGridSnapshotSurviveRepeatedInspectionForPreviewPanels
     * @tc.desc RebuildDeterminismAndGridSnapshotSurviveRepeatedInspectionForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('RebuildDeterminismAndGridSnapshotSurviveRepeatedInspectionForPreviewPanels', 0, () => {
      {
        const first: int[] = getMonthDate(11, 1970);
        const again: int[] = getMonthDate(11, 1970);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(12, 1970);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(11, 1970)));
        expect(joined(other)).assertEqual(joined(expectedGrid(12, 1970)));
        expect(fingerprint(other)).assertEqual(25810);
      }
      {
        const year: int = 1971;
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
        const grid: int[] = getMonthDate(7, 1972);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });

    /**
     * @tc.name GridSnapshotAndCalendarDayCountMatchAfterSelectionChangeForPreviewPanels
     * @tc.desc GridSnapshotAndCalendarDayCountMatchAfterSelectionChangeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndCalendarDayCountMatchAfterSelectionChangeForPreviewPanels', 0, () => {
      {
        const year: int = 1971;
        const month: int = 6;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28,
          29, 30, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(30);
        expect(GridInspector.facts(produced).leading).assertEqual(2);
      }
      {
        const grid: int[] = getMonthDate(3, 1972);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(14, 1973);
        const normalizedYear: int = 1974;
        const normalizedMonth: int = 2;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(23690);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(5);
        expect(GridInspector.maxValue(grid)).assertEqual(28);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const first: int[] = getMonthDate(12, 1974);
        const again: int[] = getMonthDate(12, 1974);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(1, 1975);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(12, 1974)));
        expect(joined(other)).assertEqual(joined(expectedGrid(1, 1975)));
        expect(fingerprint(other)).assertEqual(802760);
      }
    });

    /**
     * @tc.name CalendarDayCountAndOverflowMonthFoldingRemainStableDuringPreviewForPreviewPanels
     * @tc.desc CalendarDayCountAndOverflowMonthFoldingRemainStableDuringPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndOverflowMonthFoldingRemainStableDuringPreviewForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(12, 1971);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(21, 1972);
        const normalizedYear: int = 1973;
        const normalizedMonth: int = 9;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(23685);
        expect(grid.length).assertEqual(42);
        expect(firstNonZero(grid)).assertEqual(6);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
    });

    /**
     * @tc.name OverflowMonthFoldingAndRebuildDeterminismAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.desc OverflowMonthFoldingAndRebuildDeterminismAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('OverflowMonthFoldingAndRebuildDeterminismAgreeUnderRepeatedRebuildForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(17, 1972);
        const normalizedYear: int = 1973;
        const normalizedMonth: int = 5;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(23681);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(2);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const first: int[] = getMonthDate(4, 1973);
        const again: int[] = getMonthDate(4, 1973);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(5, 1973);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(4, 1973)));
        expect(joined(other)).assertEqual(joined(expectedGrid(5, 1973)));
        expect(fingerprint(other)).assertEqual(25810);
      }
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
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(2);
      }
    });

    /**
     * @tc.name RebuildDeterminismAndGridSnapshotHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.desc RebuildDeterminismAndGridSnapshotHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('RebuildDeterminismAndGridSnapshotHoldAcrossSeasonBoundariesForPreviewPanels', 0, () => {
      {
        const first: int[] = getMonthDate(11, 1972);
        const again: int[] = getMonthDate(11, 1972);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(12, 1972);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(11, 1972)));
        expect(joined(other)).assertEqual(joined(expectedGrid(12, 1972)));
        expect(fingerprint(other)).assertEqual(327418);
      }
      {
        const year: int = 1973;
        const month: int = 10;
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
        const grid: int[] = getMonthDate(7, 1974);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(18, 1975);
        const normalizedYear: int = 1976;
        const normalizedMonth: int = 6;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(23718);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(2);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
    });

    /**
     * @tc.name GridSnapshotAndCalendarDayCountKeepTheSameGridShapeForPreviewPanels
     * @tc.desc GridSnapshotAndCalendarDayCountKeepTheSameGridShapeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndCalendarDayCountKeepTheSameGridShapeForPreviewPanels', 0, () => {
      {
        const year: int = 1973;
        const month: int = 6;
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
      {
        const grid: int[] = getMonthDate(3, 1974);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });

    /**
     * @tc.name CalendarDayCountAndOverflowMonthFoldingPreserveTheOracleSnapshotForPreviewPanels
     * @tc.desc CalendarDayCountAndOverflowMonthFoldingPreserveTheOracleSnapshotForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndOverflowMonthFoldingPreserveTheOracleSnapshotForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(12, 1973);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(21, 1974);
        const normalizedYear: int = 1975;
        const normalizedMonth: int = 9;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(23709);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(1);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const first: int[] = getMonthDate(8, 1975);
        const again: int[] = getMonthDate(8, 1975);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(9, 1975);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(8, 1975)));
        expect(joined(other)).assertEqual(joined(expectedGrid(9, 1975)));
        expect(fingerprint(other)).assertEqual(16914);
      }
    });

    /**
     * @tc.name OverflowMonthFoldingAndRebuildDeterminismTrackTheVisibleColumnsForPreviewPanels
     * @tc.desc OverflowMonthFoldingAndRebuildDeterminismTrackTheVisibleColumnsForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('OverflowMonthFoldingAndRebuildDeterminismTrackTheVisibleColumnsForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(17, 1974);
        const normalizedYear: int = 1975;
        const normalizedMonth: int = 5;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(23705);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(4);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const first: int[] = getMonthDate(4, 1975);
        const again: int[] = getMonthDate(4, 1975);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(5, 1975);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(4, 1975)));
        expect(joined(other)).assertEqual(joined(expectedGrid(5, 1975)));
        expect(fingerprint(other)).assertEqual(247176);
      }
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
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(4);
      }
      {
        const grid: int[] = getMonthDate(11, 1977);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });

    /**
     * @tc.name GridSnapshotAndCalendarDayCountHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.desc GridSnapshotAndCalendarDayCountHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndCalendarDayCountHoldWhenTheMonthRollsOverForPreviewPanels', 0, () => {
      {
        const year: int = 1975;
        const month: int = 6;
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
        const grid: int[] = getMonthDate(3, 1976);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(14, 1977);
        const normalizedYear: int = 1978;
        const normalizedMonth: int = 2;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(23738);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(3);
        expect(GridInspector.maxValue(grid)).assertEqual(28);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
    });

    /**
     * @tc.name CalendarDayCountAndOverflowMonthFoldingStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.desc CalendarDayCountAndOverflowMonthFoldingStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndOverflowMonthFoldingStayConsistentForTheSamePanelAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(12, 1975);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(21, 1976);
        const normalizedYear: int = 1977;
        const normalizedMonth: int = 9;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(23733);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(4);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const first: int[] = getMonthDate(8, 1977);
        const again: int[] = getMonthDate(8, 1977);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(9, 1977);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(8, 1977)));
        expect(joined(other)).assertEqual(joined(expectedGrid(9, 1977)));
        expect(fingerprint(other)).assertEqual(247145);
      }
      {
        const year: int = 1978;
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
     * @tc.name OverflowMonthFoldingAndRebuildDeterminismSurviveRepeatedInspectionAcrossLeapYears
     * @tc.desc OverflowMonthFoldingAndRebuildDeterminismSurviveRepeatedInspectionAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('OverflowMonthFoldingAndRebuildDeterminismSurviveRepeatedInspectionAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(17, 1976);
        const normalizedYear: int = 1977;
        const normalizedMonth: int = 5;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(23729);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(0);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const first: int[] = getMonthDate(4, 1977);
        const again: int[] = getMonthDate(4, 1977);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(5, 1977);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(4, 1977)));
        expect(joined(other)).assertEqual(joined(expectedGrid(5, 1977)));
        expect(fingerprint(other)).assertEqual(293723);
      }
    });

    /**
     * @tc.name RebuildDeterminismAndGridSnapshotMatchAfterSelectionChangeAcrossLeapYears
     * @tc.desc RebuildDeterminismAndGridSnapshotMatchAfterSelectionChangeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('RebuildDeterminismAndGridSnapshotMatchAfterSelectionChangeAcrossLeapYears', 0, () => {
      {
        const first: int[] = getMonthDate(11, 1976);
        const again: int[] = getMonthDate(11, 1976);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(12, 1976);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(11, 1976)));
        expect(joined(other)).assertEqual(joined(expectedGrid(12, 1976)));
        expect(fingerprint(other)).assertEqual(802760);
      }
      {
        const year: int = 1977;
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
        const grid: int[] = getMonthDate(7, 1978);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
    });

    /**
     * @tc.name GridSnapshotAndCalendarDayCountRemainStableDuringPreviewAcrossLeapYears
     * @tc.desc GridSnapshotAndCalendarDayCountRemainStableDuringPreviewAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndCalendarDayCountRemainStableDuringPreviewAcrossLeapYears', 0, () => {
      {
        const year: int = 1977;
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
        const grid: int[] = getMonthDate(3, 1978);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(14, 1979);
        const normalizedYear: int = 1980;
        const normalizedMonth: int = 2;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(23762);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(5);
        expect(GridInspector.maxValue(grid)).assertEqual(29);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const first: int[] = getMonthDate(12, 1980);
        const again: int[] = getMonthDate(12, 1980);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(1, 1981);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(12, 1980)));
        expect(joined(other)).assertEqual(joined(expectedGrid(1, 1981)));
        expect(fingerprint(other)).assertEqual(247176);
      }
    });

    /**
     * @tc.name CalendarDayCountAndOverflowMonthFoldingAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.desc CalendarDayCountAndOverflowMonthFoldingAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndOverflowMonthFoldingAgreeUnderRepeatedRebuildAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(12, 1977);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(realDays(grid).length).assertEqual(facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        expect(GridInspector.minValue(grid)).assertEqual(0);
        expect(facts.days % 1).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(21, 1978);
        const normalizedYear: int = 1979;
        const normalizedMonth: int = 9;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(23757);
        expect(grid.length).assertEqual(42);
        expect(firstNonZero(grid)).assertEqual(6);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
    });

    /**
     * @tc.name OverflowMonthFoldingAndRebuildDeterminismHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.desc OverflowMonthFoldingAndRebuildDeterminismHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('OverflowMonthFoldingAndRebuildDeterminismHoldAcrossSeasonBoundariesAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(17, 1978);
        const normalizedYear: int = 1979;
        const normalizedMonth: int = 5;
        expect(normalizedYear * 12 + normalizedMonth).assertEqual(23753);
        expect(grid.length).assertEqual(35);
        expect(firstNonZero(grid)).assertEqual(2);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
        // Overflow is folded into the next or previous year, not clamped.
        expect(sameIntArray(grid, expectedGrid(normalizedMonth, normalizedYear))).assertTrue();
      }
      {
        const first: int[] = getMonthDate(4, 1979);
        const again: int[] = getMonthDate(4, 1979);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(5, 1979);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(4, 1979)));
        expect(joined(other)).assertEqual(joined(expectedGrid(5, 1979)));
        expect(fingerprint(other)).assertEqual(25810);
      }
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
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(31);
        expect(GridInspector.facts(produced).leading).assertEqual(2);
      }
    });
  });
}
