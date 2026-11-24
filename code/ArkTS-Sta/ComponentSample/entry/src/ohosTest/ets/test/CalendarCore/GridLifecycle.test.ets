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

export default function GridLifecycleTest(): void {
  describe('GridLifecycleTest', () => {
    beforeAll(() => {
      logSuite('GridLifecycleTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('GridLifecycleTest', 'end');
    });

    /**
     * @tc.name PanelPairAdvanceAndGridSnapshotStayConsistentForTheSamePanelForPreviewPanels
     * @tc.desc PanelPairAdvanceAndGridSnapshotStayConsistentForTheSamePanelForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelPairAdvanceAndGridSnapshotStayConsistentForTheSamePanelForPreviewPanels', 0, () => {
      {
        const first: int[] = getMonthDate(10, 2026);
        const second: int[] = getMonthDate(11, 2026);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(10, 2026));
        expect(firstNonZero(second)).assertEqual(firstWeekday(11, 2026));
        if (10 === 12) {
          expect(monthLabel(1, 2027).indexOf('2027') >= 0).assertTrue();
        } else {
          expect(monthLabel(11, 2026).indexOf('2026') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(11, 2026));
      }
      {
        const year: int = 2027;
        const month: int = 7;
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
     * @tc.name GridSnapshotAndSaturdayClosureSurviveRepeatedInspectionForPreviewPanels
     * @tc.desc GridSnapshotAndSaturdayClosureSurviveRepeatedInspectionForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndSaturdayClosureSurviveRepeatedInspectionForPreviewPanels', 0, () => {
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
    });

    /**
     * @tc.name SaturdayClosureAndBlankLeadCellsMatchAfterSelectionChangeForPreviewPanels
     * @tc.desc SaturdayClosureAndBlankLeadCellsMatchAfterSelectionChangeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndBlankLeadCellsMatchAfterSelectionChangeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 2027);
        const expectedTrailing: int = 2;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const grid: int[] = getMonthDate(8, 2028);
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
        const first: int[] = getMonthDate(5, 2029);
        const second: int[] = getMonthDate(6, 2029);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(5, 2029));
        expect(firstNonZero(second)).assertEqual(firstWeekday(6, 2029));
        if (5 === 12) {
          expect(monthLabel(1, 2030).indexOf('2030') >= 0).assertTrue();
        } else {
          expect(monthLabel(6, 2029).indexOf('2029') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(6, 2029));
      }
      {
        const year: int = 2030;
        const month: int = 4;
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
    });

    /**
     * @tc.name BlankLeadCellsAndPanelPairAdvanceRemainStableDuringPreviewForPreviewPanels
     * @tc.desc BlankLeadCellsAndPanelPairAdvanceRemainStableDuringPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndPanelPairAdvanceRemainStableDuringPreviewForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(4, 2027);
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
        const first: int[] = getMonthDate(1, 2028);
        const second: int[] = getMonthDate(2, 2028);
        expect(first.length).assertEqual(42);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(1, 2028));
        expect(firstNonZero(second)).assertEqual(firstWeekday(2, 2028));
        if (1 === 12) {
          expect(monthLabel(1, 2029).indexOf('2029') >= 0).assertTrue();
        } else {
          expect(monthLabel(2, 2028).indexOf('2028') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(2, 2028));
      }
    });

    /**
     * @tc.name PanelPairAdvanceAndGridSnapshotAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.desc PanelPairAdvanceAndGridSnapshotAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelPairAdvanceAndGridSnapshotAgreeUnderRepeatedRebuildForPreviewPanels', 0, () => {
      {
        const first: int[] = getMonthDate(10, 2028);
        const second: int[] = getMonthDate(11, 2028);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(10, 2028));
        expect(firstNonZero(second)).assertEqual(firstWeekday(11, 2028));
        if (10 === 12) {
          expect(monthLabel(1, 2029).indexOf('2029') >= 0).assertTrue();
        } else {
          expect(monthLabel(11, 2028).indexOf('2028') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(11, 2028));
      }
      {
        const year: int = 2029;
        const month: int = 7;
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
        const grid: int[] = getMonthDate(6, 2030);
        const expectedTrailing: int = 6;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
    });

    /**
     * @tc.name GridSnapshotAndSaturdayClosureHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.desc GridSnapshotAndSaturdayClosureHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndSaturdayClosureHoldAcrossSeasonBoundariesForPreviewPanels', 0, () => {
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
        expect(produced[3]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(4);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(2, 2029);
        const expectedTrailing: int = 3;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(28);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const grid: int[] = getMonthDate(12, 2030);
        const expectedLead: int = 0;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
      {
        const first: int[] = getMonthDate(9, 2031);
        const second: int[] = getMonthDate(10, 2031);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(9, 2031));
        expect(firstNonZero(second)).assertEqual(firstWeekday(10, 2031));
        if (9 === 12) {
          expect(monthLabel(1, 2032).indexOf('2032') >= 0).assertTrue();
        } else {
          expect(monthLabel(10, 2031).indexOf('2031') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(10, 2031));
      }
    });

    /**
     * @tc.name SaturdayClosureAndBlankLeadCellsKeepTheSameGridShapeForPreviewPanels
     * @tc.desc SaturdayClosureAndBlankLeadCellsKeepTheSameGridShapeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndBlankLeadCellsKeepTheSameGridShapeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 2029);
        const expectedTrailing: int = 6;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const grid: int[] = getMonthDate(8, 2030);
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
     * @tc.name BlankLeadCellsAndPanelPairAdvancePreserveTheOracleSnapshotForPreviewPanels
     * @tc.desc BlankLeadCellsAndPanelPairAdvancePreserveTheOracleSnapshotForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndPanelPairAdvancePreserveTheOracleSnapshotForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(4, 2029);
        const expectedLead: int = 0;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
      {
        const first: int[] = getMonthDate(1, 2030);
        const second: int[] = getMonthDate(2, 2030);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(1, 2030));
        expect(firstNonZero(second)).assertEqual(firstWeekday(2, 2030));
        if (1 === 12) {
          expect(monthLabel(1, 2031).indexOf('2031') >= 0).assertTrue();
        } else {
          expect(monthLabel(2, 2030).indexOf('2030') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(2, 2030));
      }
      {
        const year: int = 2031;
        const month: int = 11;
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
     * @tc.name PanelPairAdvanceAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels
     * @tc.desc PanelPairAdvanceAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelPairAdvanceAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels', 0, () => {
      {
        const first: int[] = getMonthDate(10, 2030);
        const second: int[] = getMonthDate(11, 2030);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(10, 2030));
        expect(firstNonZero(second)).assertEqual(firstWeekday(11, 2030));
        if (10 === 12) {
          expect(monthLabel(1, 2031).indexOf('2031') >= 0).assertTrue();
        } else {
          expect(monthLabel(11, 2030).indexOf('2030') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(11, 2030));
      }
      {
        const year: int = 2031;
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
        const grid: int[] = getMonthDate(6, 2032);
        const expectedTrailing: int = 3;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const grid: int[] = getMonthDate(3, 2033);
        const expectedLead: int = 2;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(0);
        expect(grid[1]).assertEqual(0);
        expect(grid[2]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
    });

    /**
     * @tc.name GridSnapshotAndSaturdayClosureSupportThePopupPreviewForPreviewPanels
     * @tc.desc GridSnapshotAndSaturdayClosureSupportThePopupPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndSaturdayClosureSupportThePopupPreviewForPreviewPanels', 0, () => {
      {
        const year: int = 2030;
        const month: int = 3;
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
        const grid: int[] = getMonthDate(2, 2031);
        const expectedTrailing: int = 1;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(28);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
    });

    /**
     * @tc.name SaturdayClosureAndBlankLeadCellsHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.desc SaturdayClosureAndBlankLeadCellsHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndBlankLeadCellsHoldWhenTheMonthRollsOverForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 2031);
        const expectedTrailing: int = 4;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
      {
        const grid: int[] = getMonthDate(8, 2032);
        const expectedLead: int = 0;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
      {
        const first: int[] = getMonthDate(5, 2033);
        const second: int[] = getMonthDate(6, 2033);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(5, 2033));
        expect(firstNonZero(second)).assertEqual(firstWeekday(6, 2033));
        if (5 === 12) {
          expect(monthLabel(1, 2034).indexOf('2034') >= 0).assertTrue();
        } else {
          expect(monthLabel(6, 2033).indexOf('2033') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(6, 2033));
      }
    });

    /**
     * @tc.name BlankLeadCellsAndPanelPairAdvanceStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.desc BlankLeadCellsAndPanelPairAdvanceStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndPanelPairAdvanceStayConsistentForTheSamePanelAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(4, 2031);
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
        const first: int[] = getMonthDate(1, 2032);
        const second: int[] = getMonthDate(2, 2032);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(1, 2032));
        expect(firstNonZero(second)).assertEqual(firstWeekday(2, 2032));
        if (1 === 12) {
          expect(monthLabel(1, 2033).indexOf('2033') >= 0).assertTrue();
        } else {
          expect(monthLabel(2, 2032).indexOf('2032') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(2, 2032));
      }
      {
        const year: int = 2033;
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
      {
        const grid: int[] = getMonthDate(10, 2034);
        const expectedTrailing: int = 4;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(GridInspector.facts(grid).trailing).assertEqual(expectedTrailing);
      }
    });
  });
}
