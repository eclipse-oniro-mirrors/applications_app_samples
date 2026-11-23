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

export default function GridWorkflowTest(): void {
  describe('GridWorkflowTest', () => {
    beforeAll(() => {
      logSuite('GridWorkflowTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('GridWorkflowTest', 'end');
    });

    /**
     * @tc.name PanelPairAdvanceAndCellProjectionStayConsistentForTheSamePanelForPreviewPanels
     * @tc.desc PanelPairAdvanceAndCellProjectionStayConsistentForTheSamePanelForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelPairAdvanceAndCellProjectionStayConsistentForTheSamePanelForPreviewPanels', 0, () => {
      {
        const first: int[] = getMonthDate(9, 2008);
        const second: int[] = getMonthDate(10, 2008);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(9, 2008));
        expect(firstNonZero(second)).assertEqual(firstWeekday(10, 2008));
        if (9 === 12) {
          expect(monthLabel(1, 2009).indexOf('2009') >= 0).assertTrue();
        } else {
          expect(monthLabel(10, 2008).indexOf('2008') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(10, 2008));
      }
      {
        const style = CellProjector.project(2, 6, 2026, 2, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('2');
        const other = CellProjector.project(2, 8, 2009, 2, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 8, 2009, 2, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name GridSnapshotAndBlankLeadCellsMatchAfterSelectionChangeForPreviewPanels
     * @tc.desc GridSnapshotAndBlankLeadCellsMatchAfterSelectionChangeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndBlankLeadCellsMatchAfterSelectionChangeForPreviewPanels', 0, () => {
      {
        const year: int = 2009;
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
      {
        const grid: int[] = getMonthDate(7, 2010);
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
        const first: int[] = getMonthDate(6, 2011);
        const second: int[] = getMonthDate(7, 2011);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(42);
        expect(firstNonZero(first)).assertEqual(firstWeekday(6, 2011));
        expect(firstNonZero(second)).assertEqual(firstWeekday(7, 2011));
        if (6 === 12) {
          expect(monthLabel(1, 2012).indexOf('2012') >= 0).assertTrue();
        } else {
          expect(monthLabel(7, 2011).indexOf('2011') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(7, 2011));
      }
      {
        const style = CellProjector.project(6, 6, 2026, 6, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('6');
        const other = CellProjector.project(6, 3, 2012, 6, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 3, 2012, 6, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name PanelPairAdvanceAndCellProjectionAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.desc PanelPairAdvanceAndCellProjectionAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelPairAdvanceAndCellProjectionAgreeUnderRepeatedRebuildForPreviewPanels', 0, () => {
      {
        const first: int[] = getMonthDate(9, 2010);
        const second: int[] = getMonthDate(10, 2010);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(42);
        expect(firstNonZero(first)).assertEqual(firstWeekday(9, 2010));
        expect(firstNonZero(second)).assertEqual(firstWeekday(10, 2010));
        if (9 === 12) {
          expect(monthLabel(1, 2011).indexOf('2011') >= 0).assertTrue();
        } else {
          expect(monthLabel(10, 2010).indexOf('2010') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(10, 2010));
      }
      {
        const style = CellProjector.project(6, 6, 2026, 6, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('6');
        const other = CellProjector.project(6, 8, 2011, 6, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 8, 2011, 6, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const year: int = 2012;
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
     * @tc.name GridSnapshotAndBlankLeadCellsKeepTheSameGridShapeForPreviewPanels
     * @tc.desc GridSnapshotAndBlankLeadCellsKeepTheSameGridShapeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndBlankLeadCellsKeepTheSameGridShapeForPreviewPanels', 0, () => {
      {
        const year: int = 2011;
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
        const grid: int[] = getMonthDate(7, 2012);
        const expectedLead: int = 0;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
    });

    /**
     * @tc.name PanelPairAdvanceAndCellProjectionTrackTheVisibleColumnsForPreviewPanels
     * @tc.desc PanelPairAdvanceAndCellProjectionTrackTheVisibleColumnsForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelPairAdvanceAndCellProjectionTrackTheVisibleColumnsForPreviewPanels', 0, () => {
      {
        const first: int[] = getMonthDate(9, 2012);
        const second: int[] = getMonthDate(10, 2012);
        expect(first.length).assertEqual(42);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(9, 2012));
        expect(firstNonZero(second)).assertEqual(firstWeekday(10, 2012));
        if (9 === 12) {
          expect(monthLabel(1, 2013).indexOf('2013') >= 0).assertTrue();
        } else {
          expect(monthLabel(10, 2012).indexOf('2012') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(10, 2012));
      }
      {
        const style = CellProjector.project(10, 6, 2026, 10, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('10');
        const other = CellProjector.project(10, 8, 2013, 10, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 8, 2013, 10, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const year: int = 2014;
        const month: int = 5;
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
        const grid: int[] = getMonthDate(4, 2015);
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
    });

    /**
     * @tc.name PanelPairAdvanceAndCellProjectionSurviveRepeatedInspectionAcrossLeapYears
     * @tc.desc PanelPairAdvanceAndCellProjectionSurviveRepeatedInspectionAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelPairAdvanceAndCellProjectionSurviveRepeatedInspectionAcrossLeapYears', 0, () => {
      {
        const first: int[] = getMonthDate(9, 2014);
        const second: int[] = getMonthDate(10, 2014);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(9, 2014));
        expect(firstNonZero(second)).assertEqual(firstWeekday(10, 2014));
        if (9 === 12) {
          expect(monthLabel(1, 2015).indexOf('2015') >= 0).assertTrue();
        } else {
          expect(monthLabel(10, 2014).indexOf('2014') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(10, 2014));
      }
      {
        const style = CellProjector.project(14, 6, 2026, 14, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('14');
        const other = CellProjector.project(14, 8, 2015, 14, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 8, 2015, 14, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name GridSnapshotAndBlankLeadCellsRemainStableDuringPreviewAcrossLeapYears
     * @tc.desc GridSnapshotAndBlankLeadCellsRemainStableDuringPreviewAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndBlankLeadCellsRemainStableDuringPreviewAcrossLeapYears', 0, () => {
      {
        const year: int = 2015;
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
      {
        const grid: int[] = getMonthDate(7, 2016);
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
      {
        const first: int[] = getMonthDate(6, 2017);
        const second: int[] = getMonthDate(7, 2017);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(42);
        expect(firstNonZero(first)).assertEqual(firstWeekday(6, 2017));
        expect(firstNonZero(second)).assertEqual(firstWeekday(7, 2017));
        if (6 === 12) {
          expect(monthLabel(1, 2018).indexOf('2018') >= 0).assertTrue();
        } else {
          expect(monthLabel(7, 2017).indexOf('2017') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(7, 2017));
      }
      {
        const style = CellProjector.project(18, 6, 2026, 18, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('18');
        const other = CellProjector.project(18, 3, 2018, 18, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 3, 2018, 18, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name BlankLeadCellsAndPanelPairAdvanceAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.desc BlankLeadCellsAndPanelPairAdvanceAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndPanelPairAdvanceAgreeUnderRepeatedRebuildAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 2015);
        const expectedLead: int = 0;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
      {
        const first: int[] = getMonthDate(2, 2016);
        const second: int[] = getMonthDate(3, 2016);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(2, 2016));
        expect(firstNonZero(second)).assertEqual(firstWeekday(3, 2016));
        if (2 === 12) {
          expect(monthLabel(1, 2017).indexOf('2017') >= 0).assertTrue();
        } else {
          expect(monthLabel(3, 2016).indexOf('2016') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(3, 2016));
      }
    });

    /**
     * @tc.name PanelPairAdvanceAndCellProjectionHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.desc PanelPairAdvanceAndCellProjectionHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelPairAdvanceAndCellProjectionHoldAcrossSeasonBoundariesAcrossLeapYears', 0, () => {
      {
        const first: int[] = getMonthDate(9, 2016);
        const second: int[] = getMonthDate(10, 2016);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(42);
        expect(firstNonZero(first)).assertEqual(firstWeekday(9, 2016));
        expect(firstNonZero(second)).assertEqual(firstWeekday(10, 2016));
        if (9 === 12) {
          expect(monthLabel(1, 2017).indexOf('2017') >= 0).assertTrue();
        } else {
          expect(monthLabel(10, 2016).indexOf('2016') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(10, 2016));
      }
      {
        const style = CellProjector.project(18, 6, 2026, 18, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('18');
        const other = CellProjector.project(18, 8, 2017, 18, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 8, 2017, 18, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const year: int = 2018;
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
     * @tc.name CellProjectionAndGridSnapshotKeepTheSameGridShapeAcrossLeapYears
     * @tc.desc CellProjectionAndGridSnapshotKeepTheSameGridShapeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndGridSnapshotKeepTheSameGridShapeAcrossLeapYears', 0, () => {
      {
        const style = CellProjector.project(18, 6, 2026, 18, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('18');
        const other = CellProjector.project(18, 4, 2016, 18, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 4, 2016, 18, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const year: int = 2017;
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
        const grid: int[] = getMonthDate(11, 2018);
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
        const first: int[] = getMonthDate(10, 2019);
        const second: int[] = getMonthDate(11, 2019);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(10, 2019));
        expect(firstNonZero(second)).assertEqual(firstWeekday(11, 2019));
        if (10 === 12) {
          expect(monthLabel(1, 2020).indexOf('2020') >= 0).assertTrue();
        } else {
          expect(monthLabel(11, 2019).indexOf('2019') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(11, 2019));
      }
    });

    /**
     * @tc.name GridSnapshotAndBlankLeadCellsPreserveTheOracleSnapshotAcrossLeapYears
     * @tc.desc GridSnapshotAndBlankLeadCellsPreserveTheOracleSnapshotAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndBlankLeadCellsPreserveTheOracleSnapshotAcrossLeapYears', 0, () => {
      {
        const year: int = 2017;
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
        const grid: int[] = getMonthDate(7, 2018);
        const expectedLead: int = 0;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(GridInspector.facts(grid).leading).assertEqual(expectedLead);
        expect(grid[0]).assertEqual(1);
        expect(observedLead % 7).assertEqual(observedLead);
      }
    });

    /**
     * @tc.name BlankLeadCellsAndPanelPairAdvanceTrackTheVisibleColumnsAcrossLeapYears
     * @tc.desc BlankLeadCellsAndPanelPairAdvanceTrackTheVisibleColumnsAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndPanelPairAdvanceTrackTheVisibleColumnsAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 2017);
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
        const first: int[] = getMonthDate(2, 2018);
        const second: int[] = getMonthDate(3, 2018);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(2, 2018));
        expect(firstNonZero(second)).assertEqual(firstWeekday(3, 2018));
        if (2 === 12) {
          expect(monthLabel(1, 2019).indexOf('2019') >= 0).assertTrue();
        } else {
          expect(monthLabel(3, 2018).indexOf('2018') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(3, 2018));
      }
      {
        const style = CellProjector.project(22, 6, 2026, 22, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('22');
        const other = CellProjector.project(22, 12, 2019, 22, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 12, 2019, 22, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name PanelPairAdvanceAndCellProjectionSupportThePopupPreviewAcrossLeapYears
     * @tc.desc PanelPairAdvanceAndCellProjectionSupportThePopupPreviewAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelPairAdvanceAndCellProjectionSupportThePopupPreviewAcrossLeapYears', 0, () => {
      {
        const first: int[] = getMonthDate(9, 2018);
        const second: int[] = getMonthDate(10, 2018);
        expect(first.length).assertEqual(42);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(9, 2018));
        expect(firstNonZero(second)).assertEqual(firstWeekday(10, 2018));
        if (9 === 12) {
          expect(monthLabel(1, 2019).indexOf('2019') >= 0).assertTrue();
        } else {
          expect(monthLabel(10, 2018).indexOf('2018') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(10, 2018));
      }
      {
        const style = CellProjector.project(22, 6, 2026, 22, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('22');
        const other = CellProjector.project(22, 8, 2019, 22, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 8, 2019, 22, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const year: int = 2020;
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
        const grid: int[] = getMonthDate(4, 2021);
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
     * @tc.name CellProjectionAndGridSnapshotHoldWhenTheMonthRollsOverAcrossLeapYears
     * @tc.desc CellProjectionAndGridSnapshotHoldWhenTheMonthRollsOverAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndGridSnapshotHoldWhenTheMonthRollsOverAcrossLeapYears', 0, () => {
      {
        const style = CellProjector.project(22, 6, 2026, 22, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('22');
        const other = CellProjector.project(22, 4, 2018, 22, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 4, 2018, 22, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const year: int = 2019;
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
