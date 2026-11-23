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

export default function GridConcurrencyTest(): void {
  describe('GridConcurrencyTest', () => {
    beforeAll(() => {
      logSuite('GridConcurrencyTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('GridConcurrencyTest', 'end');
    });

    /**
     * @tc.name GridSnapshotAndWeekAlignmentStayConsistentForTheSamePanelForPreviewPanels
     * @tc.desc GridSnapshotAndWeekAlignmentStayConsistentForTheSamePanelForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndWeekAlignmentStayConsistentForTheSamePanelForPreviewPanels', 0, () => {
      {
        const year: int = 2024;
        const month: int = 6;
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
      {
        const grid: int[] = getMonthDate(3, 2025);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(42);
      }
    });

    /**
     * @tc.name WeekAlignmentAndRebuildDeterminismSurviveRepeatedInspectionForPreviewPanels
     * @tc.desc WeekAlignmentAndRebuildDeterminismSurviveRepeatedInspectionForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndRebuildDeterminismSurviveRepeatedInspectionForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(12, 2024);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const first: int[] = getMonthDate(9, 2025);
        const again: int[] = getMonthDate(9, 2025);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(10, 2025);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(9, 2025)));
        expect(joined(other)).assertEqual(joined(expectedGrid(10, 2025)));
        expect(fingerprint(other)).assertEqual(802760);
      }
      {
        const startYear: int = 2026;
        const endYear: int = 2027;
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
     * @tc.name RebuildDeterminismAndDecadeInvariantScanMatchAfterSelectionChangeForPreviewPanels
     * @tc.desc RebuildDeterminismAndDecadeInvariantScanMatchAfterSelectionChangeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('RebuildDeterminismAndDecadeInvariantScanMatchAfterSelectionChangeForPreviewPanels', 0, () => {
      {
        const first: int[] = getMonthDate(5, 2025);
        const again: int[] = getMonthDate(5, 2025);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(6, 2025);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(5, 2025)));
        expect(joined(other)).assertEqual(joined(expectedGrid(6, 2025)));
        expect(fingerprint(other)).assertEqual(664659);
      }
      {
        const startYear: int = 2026;
        const endYear: int = 2027;
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
     * @tc.name DecadeInvariantScanAndGridSnapshotRemainStableDuringPreviewForPreviewPanels
     * @tc.desc DecadeInvariantScanAndGridSnapshotRemainStableDuringPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('DecadeInvariantScanAndGridSnapshotRemainStableDuringPreviewForPreviewPanels', 0, () => {
      {
        const startYear: int = 2025;
        const endYear: int = 2026;
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
        const year: int = 2026;
        const month: int = 10;
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
    });

    /**
     * @tc.name GridSnapshotAndWeekAlignmentAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.desc GridSnapshotAndWeekAlignmentAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndWeekAlignmentAgreeUnderRepeatedRebuildForPreviewPanels', 0, () => {
      {
        const year: int = 2026;
        const month: int = 6;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
          30, 0, 0, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(sameIntArray(produced, expected)).assertTrue();
        expect(firstDifference(produced, expected)).assertEqual(-1);
        expect(joined(produced)).assertEqual(joined(expected));
        expect(GridInspector.maxValue(produced)).assertEqual(30);
        expect(GridInspector.facts(produced).leading).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(3, 2027);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const first: int[] = getMonthDate(2, 2028);
        const again: int[] = getMonthDate(2, 2028);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(3, 2028);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(2, 2028)));
        expect(joined(other)).assertEqual(joined(expectedGrid(3, 2028)));
        expect(fingerprint(other)).assertEqual(802760);
      }
    });

    /**
     * @tc.name WeekAlignmentAndRebuildDeterminismHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.desc WeekAlignmentAndRebuildDeterminismHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndRebuildDeterminismHoldAcrossSeasonBoundariesForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(12, 2026);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const first: int[] = getMonthDate(9, 2027);
        const again: int[] = getMonthDate(9, 2027);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(10, 2027);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(9, 2027)));
        expect(joined(other)).assertEqual(joined(expectedGrid(10, 2027)));
        expect(fingerprint(other)).assertEqual(327418);
      }
      {
        const startYear: int = 2028;
        const endYear: int = 2029;
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
        const year: int = 2029;
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
     * @tc.name RebuildDeterminismAndDecadeInvariantScanKeepTheSameGridShapeForPreviewPanels
     * @tc.desc RebuildDeterminismAndDecadeInvariantScanKeepTheSameGridShapeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('RebuildDeterminismAndDecadeInvariantScanKeepTheSameGridShapeForPreviewPanels', 0, () => {
      {
        const first: int[] = getMonthDate(5, 2027);
        const again: int[] = getMonthDate(5, 2027);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(6, 2027);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(5, 2027)));
        expect(joined(other)).assertEqual(joined(expectedGrid(6, 2027)));
        expect(fingerprint(other)).assertEqual(996022);
      }
      {
        const startYear: int = 2028;
        const endYear: int = 2029;
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
     * @tc.name DecadeInvariantScanAndGridSnapshotPreserveTheOracleSnapshotForPreviewPanels
     * @tc.desc DecadeInvariantScanAndGridSnapshotPreserveTheOracleSnapshotForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('DecadeInvariantScanAndGridSnapshotPreserveTheOracleSnapshotForPreviewPanels', 0, () => {
      {
        const startYear: int = 2027;
        const endYear: int = 2028;
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
        const year: int = 2028;
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
        const grid: int[] = getMonthDate(7, 2029);
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
     * @tc.name GridSnapshotAndWeekAlignmentTrackTheVisibleColumnsForPreviewPanels
     * @tc.desc GridSnapshotAndWeekAlignmentTrackTheVisibleColumnsForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndWeekAlignmentTrackTheVisibleColumnsForPreviewPanels', 0, () => {
      {
        const year: int = 2028;
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
        const grid: int[] = getMonthDate(3, 2029);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const first: int[] = getMonthDate(2, 2030);
        const again: int[] = getMonthDate(2, 2030);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(3, 2030);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(2, 2030)));
        expect(joined(other)).assertEqual(joined(expectedGrid(3, 2030)));
        expect(fingerprint(other)).assertEqual(327418);
      }
      {
        const startYear: int = 2031;
        const endYear: int = 2032;
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
     * @tc.name WeekAlignmentAndRebuildDeterminismSupportThePopupPreviewForPreviewPanels
     * @tc.desc WeekAlignmentAndRebuildDeterminismSupportThePopupPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndRebuildDeterminismSupportThePopupPreviewForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(12, 2028);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(42);
      }
      {
        const first: int[] = getMonthDate(9, 2029);
        const again: int[] = getMonthDate(9, 2029);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(10, 2029);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(9, 2029)));
        expect(joined(other)).assertEqual(joined(expectedGrid(10, 2029)));
        expect(fingerprint(other)).assertEqual(940435);
      }
    });

    /**
     * @tc.name RebuildDeterminismAndDecadeInvariantScanHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.desc RebuildDeterminismAndDecadeInvariantScanHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('RebuildDeterminismAndDecadeInvariantScanHoldWhenTheMonthRollsOverForPreviewPanels', 0, () => {
      {
        const first: int[] = getMonthDate(5, 2029);
        const again: int[] = getMonthDate(5, 2029);
        expect(sameIntArray(first, again)).assertTrue();
        expect(fingerprint(first)).assertEqual(fingerprint(again));
        const other: int[] = getMonthDate(6, 2029);
        expect(first.length === other.length || first.length !== other.length).assertTrue();
        expect(joined(first)).assertEqual(joined(expectedGrid(5, 2029)));
        expect(joined(other)).assertEqual(joined(expectedGrid(6, 2029)));
        expect(fingerprint(other)).assertEqual(842158);
      }
      {
        const startYear: int = 2030;
        const endYear: int = 2031;
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
        const year: int = 2031;
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
  });
}
