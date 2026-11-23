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

export default function GridFlowTest(): void {
  describe('GridFlowTest', () => {
    beforeAll(() => {
      logSuite('GridFlowTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('GridFlowTest', 'end');
    });

    /**
     * @tc.name GridSnapshotAndSelectionGuardSurviveRepeatedInspectionForPreviewPanels
     * @tc.desc GridSnapshotAndSelectionGuardSurviveRepeatedInspectionForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndSelectionGuardSurviveRepeatedInspectionForPreviewPanels', 0, () => {
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
        expect(produced[6]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(11);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[41]).assertEqual(0);
      }
      {
        const allowed: boolean = SelectionGuard.canSelect(7, 7, 2012, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(7, 2012);
        expect(SelectionGuard.weekdayFromGrid(grid, 7) >= 0).assertTrue();
        expect(CellProjector.project(7, 7, 2012, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(7, 7, 2012, 12, 6, 2026).visible).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(6, 2013);
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
     * @tc.name SelectionGuardAndContiguousDayRunMatchAfterSelectionChangeForPreviewPanels
     * @tc.desc SelectionGuardAndContiguousDayRunMatchAfterSelectionChangeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SelectionGuardAndContiguousDayRunMatchAfterSelectionChangeForPreviewPanels', 0, () => {
      {
        const allowed: boolean = SelectionGuard.canSelect(7, 3, 2012, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(3, 2012);
        expect(SelectionGuard.weekdayFromGrid(grid, 7) >= 0).assertTrue();
        expect(CellProjector.project(7, 3, 2012, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(7, 3, 2012, 12, 6, 2026).visible).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(2, 2013);
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
      {
        const first: int[] = getMonthDate(12, 2014);
        const second: int[] = getMonthDate(1, 2015);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(12, 2014));
        expect(firstNonZero(second)).assertEqual(firstWeekday(1, 2015));
        if (12 === 12) {
          expect(monthLabel(1, 2015).indexOf('2015') >= 0).assertTrue();
        } else {
          expect(monthLabel(1, 2014).indexOf('2014') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(1, 2015));
      }
      {
        const year: int = 2015;
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
    });

    /**
     * @tc.name ContiguousDayRunAndPanelPairAdvanceRemainStableDuringPreviewForPreviewPanels
     * @tc.desc ContiguousDayRunAndPanelPairAdvanceRemainStableDuringPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('ContiguousDayRunAndPanelPairAdvanceRemainStableDuringPreviewForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 2012);
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
        const first: int[] = getMonthDate(8, 2013);
        const second: int[] = getMonthDate(9, 2013);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(8, 2013));
        expect(firstNonZero(second)).assertEqual(firstWeekday(9, 2013));
        if (8 === 12) {
          expect(monthLabel(1, 2014).indexOf('2014') >= 0).assertTrue();
        } else {
          expect(monthLabel(9, 2013).indexOf('2013') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(9, 2013));
      }
    });

    /**
     * @tc.name GridSnapshotAndSelectionGuardHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.desc GridSnapshotAndSelectionGuardHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndSelectionGuardHoldAcrossSeasonBoundariesForPreviewPanels', 0, () => {
      {
        const year: int = 2013;
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
        const allowed: boolean = SelectionGuard.canSelect(19, 7, 2014, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(7, 2014);
        expect(SelectionGuard.weekdayFromGrid(grid, 19) >= 0).assertTrue();
        expect(CellProjector.project(19, 7, 2014, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(19, 7, 2014, 12, 6, 2026).visible).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(6, 2015);
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
        const first: int[] = getMonthDate(3, 2016);
        const second: int[] = getMonthDate(4, 2016);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(3, 2016));
        expect(firstNonZero(second)).assertEqual(firstWeekday(4, 2016));
        if (3 === 12) {
          expect(monthLabel(1, 2017).indexOf('2017') >= 0).assertTrue();
        } else {
          expect(monthLabel(4, 2016).indexOf('2016') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(4, 2016));
      }
    });

    /**
     * @tc.name SelectionGuardAndContiguousDayRunKeepTheSameGridShapeForPreviewPanels
     * @tc.desc SelectionGuardAndContiguousDayRunKeepTheSameGridShapeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SelectionGuardAndContiguousDayRunKeepTheSameGridShapeForPreviewPanels', 0, () => {
      {
        const allowed: boolean = SelectionGuard.canSelect(19, 3, 2014, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(3, 2014);
        expect(SelectionGuard.weekdayFromGrid(grid, 19) >= 0).assertTrue();
        expect(CellProjector.project(19, 3, 2014, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(19, 3, 2014, 12, 6, 2026).visible).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(2, 2015);
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
     * @tc.name ContiguousDayRunAndPanelPairAdvancePreserveTheOracleSnapshotForPreviewPanels
     * @tc.desc ContiguousDayRunAndPanelPairAdvancePreserveTheOracleSnapshotForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('ContiguousDayRunAndPanelPairAdvancePreserveTheOracleSnapshotForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 2014);
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
        const first: int[] = getMonthDate(8, 2015);
        const second: int[] = getMonthDate(9, 2015);
        expect(first.length).assertEqual(42);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(8, 2015));
        expect(firstNonZero(second)).assertEqual(firstWeekday(9, 2015));
        if (8 === 12) {
          expect(monthLabel(1, 2016).indexOf('2016') >= 0).assertTrue();
        } else {
          expect(monthLabel(9, 2015).indexOf('2015') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(9, 2015));
      }
      {
        const year: int = 2016;
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
    });

    /**
     * @tc.name GridSnapshotAndSelectionGuardSupportThePopupPreviewForPreviewPanels
     * @tc.desc GridSnapshotAndSelectionGuardSupportThePopupPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndSelectionGuardSupportThePopupPreviewForPreviewPanels', 0, () => {
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
        expect(produced[4]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(4);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(31);
      }
      {
        const allowed: boolean = SelectionGuard.canSelect(31, 7, 2016, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(7, 2016);
        expect(SelectionGuard.weekdayFromGrid(grid, 31) >= 0).assertTrue();
        expect(CellProjector.project(31, 7, 2016, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(31, 7, 2016, 12, 6, 2026).visible).assertTrue();
      }
    });

    /**
     * @tc.name SelectionGuardAndContiguousDayRunHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.desc SelectionGuardAndContiguousDayRunHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SelectionGuardAndContiguousDayRunHoldWhenTheMonthRollsOverForPreviewPanels', 0, () => {
      {
        const allowed: boolean = SelectionGuard.canSelect(31, 3, 2016, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(3, 2016);
        expect(SelectionGuard.weekdayFromGrid(grid, 31) >= 0).assertTrue();
        expect(CellProjector.project(31, 3, 2016, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(31, 3, 2016, 12, 6, 2026).visible).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(2, 2017);
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
      {
        const first: int[] = getMonthDate(12, 2018);
        const second: int[] = getMonthDate(1, 2019);
        expect(first.length).assertEqual(42);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(12, 2018));
        expect(firstNonZero(second)).assertEqual(firstWeekday(1, 2019));
        if (12 === 12) {
          expect(monthLabel(1, 2019).indexOf('2019') >= 0).assertTrue();
        } else {
          expect(monthLabel(1, 2018).indexOf('2018') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(1, 2019));
      }
    });

    /**
     * @tc.name ContiguousDayRunAndPanelPairAdvanceStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.desc ContiguousDayRunAndPanelPairAdvanceStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('ContiguousDayRunAndPanelPairAdvanceStayConsistentForTheSamePanelAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 2016);
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
        const first: int[] = getMonthDate(8, 2017);
        const second: int[] = getMonthDate(9, 2017);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(8, 2017));
        expect(firstNonZero(second)).assertEqual(firstWeekday(9, 2017));
        if (8 === 12) {
          expect(monthLabel(1, 2018).indexOf('2018') >= 0).assertTrue();
        } else {
          expect(monthLabel(9, 2017).indexOf('2017') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(9, 2017));
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
        expect(produced[2]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(4);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
      {
        const allowed: boolean = SelectionGuard.canSelect(13, 4, 2019, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(4, 2019);
        expect(SelectionGuard.weekdayFromGrid(grid, 13) >= 0).assertTrue();
        expect(CellProjector.project(13, 4, 2019, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(13, 4, 2019, 12, 6, 2026).visible).assertTrue();
      }
    });

    /**
     * @tc.name PanelPairAdvanceAndGridSnapshotSurviveRepeatedInspectionAcrossLeapYears
     * @tc.desc PanelPairAdvanceAndGridSnapshotSurviveRepeatedInspectionAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelPairAdvanceAndGridSnapshotSurviveRepeatedInspectionAcrossLeapYears', 0, () => {
      {
        const first: int[] = getMonthDate(4, 2017);
        const second: int[] = getMonthDate(5, 2017);
        expect(first.length).assertEqual(42);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(4, 2017));
        expect(firstNonZero(second)).assertEqual(firstWeekday(5, 2017));
        if (4 === 12) {
          expect(monthLabel(1, 2018).indexOf('2018') >= 0).assertTrue();
        } else {
          expect(monthLabel(5, 2017).indexOf('2017') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(5, 2017));
      }
      {
        const year: int = 2018;
        const month: int = 1;
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
     * @tc.name GridSnapshotAndSelectionGuardMatchAfterSelectionChangeAcrossLeapYears
     * @tc.desc GridSnapshotAndSelectionGuardMatchAfterSelectionChangeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndSelectionGuardMatchAfterSelectionChangeAcrossLeapYears', 0, () => {
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
        expect(produced[0]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(4);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
      {
        const allowed: boolean = SelectionGuard.canSelect(12, 7, 2018, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(7, 2018);
        expect(SelectionGuard.weekdayFromGrid(grid, 12) >= 0).assertTrue();
        expect(CellProjector.project(12, 7, 2018, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(12, 7, 2018, 12, 6, 2026).visible).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(6, 2019);
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
     * @tc.name SelectionGuardAndContiguousDayRunRemainStableDuringPreviewAcrossLeapYears
     * @tc.desc SelectionGuardAndContiguousDayRunRemainStableDuringPreviewAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('SelectionGuardAndContiguousDayRunRemainStableDuringPreviewAcrossLeapYears', 0, () => {
      {
        const allowed: boolean = SelectionGuard.canSelect(12, 3, 2018, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(3, 2018);
        expect(SelectionGuard.weekdayFromGrid(grid, 12) >= 0).assertTrue();
        expect(CellProjector.project(12, 3, 2018, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(12, 3, 2018, 12, 6, 2026).visible).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(2, 2019);
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
      {
        const first: int[] = getMonthDate(12, 2020);
        const second: int[] = getMonthDate(1, 2021);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(42);
        expect(firstNonZero(first)).assertEqual(firstWeekday(12, 2020));
        expect(firstNonZero(second)).assertEqual(firstWeekday(1, 2021));
        if (12 === 12) {
          expect(monthLabel(1, 2021).indexOf('2021') >= 0).assertTrue();
        } else {
          expect(monthLabel(1, 2020).indexOf('2020') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(1, 2021));
      }
      {
        const year: int = 2021;
        const month: int = 9;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
          28, 29, 30, 0, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(produced[3]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(5);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
    });

    /**
     * @tc.name ContiguousDayRunAndPanelPairAdvanceAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.desc ContiguousDayRunAndPanelPairAdvanceAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('ContiguousDayRunAndPanelPairAdvanceAgreeUnderRepeatedRebuildAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 2018);
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
        const first: int[] = getMonthDate(8, 2019);
        const second: int[] = getMonthDate(9, 2019);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(8, 2019));
        expect(firstNonZero(second)).assertEqual(firstWeekday(9, 2019));
        if (8 === 12) {
          expect(monthLabel(1, 2020).indexOf('2020') >= 0).assertTrue();
        } else {
          expect(monthLabel(9, 2019).indexOf('2019') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(9, 2019));
      }
    });

    /**
     * @tc.name PanelPairAdvanceAndGridSnapshotHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.desc PanelPairAdvanceAndGridSnapshotHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelPairAdvanceAndGridSnapshotHoldAcrossSeasonBoundariesAcrossLeapYears', 0, () => {
      {
        const first: int[] = getMonthDate(4, 2019);
        const second: int[] = getMonthDate(5, 2019);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(4, 2019));
        expect(firstNonZero(second)).assertEqual(firstWeekday(5, 2019));
        if (4 === 12) {
          expect(monthLabel(1, 2020).indexOf('2020') >= 0).assertTrue();
        } else {
          expect(monthLabel(5, 2019).indexOf('2019') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(5, 2019));
      }
      {
        const year: int = 2020;
        const month: int = 1;
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
        const allowed: boolean = SelectionGuard.canSelect(25, 11, 2021, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(11, 2021);
        expect(SelectionGuard.weekdayFromGrid(grid, 25) >= 0).assertTrue();
        expect(CellProjector.project(25, 11, 2021, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(25, 11, 2021, 12, 6, 2026).visible).assertTrue();
      }
    });

    /**
     * @tc.name GridSnapshotAndSelectionGuardKeepTheSameGridShapeAcrossLeapYears
     * @tc.desc GridSnapshotAndSelectionGuardKeepTheSameGridShapeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndSelectionGuardKeepTheSameGridShapeAcrossLeapYears', 0, () => {
      {
        const year: int = 2019;
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
        const allowed: boolean = SelectionGuard.canSelect(24, 7, 2020, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(7, 2020);
        expect(SelectionGuard.weekdayFromGrid(grid, 24) >= 0).assertTrue();
        expect(CellProjector.project(24, 7, 2020, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(24, 7, 2020, 12, 6, 2026).visible).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(6, 2021);
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
        const first: int[] = getMonthDate(3, 2022);
        const second: int[] = getMonthDate(4, 2022);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(3, 2022));
        expect(firstNonZero(second)).assertEqual(firstWeekday(4, 2022));
        if (3 === 12) {
          expect(monthLabel(1, 2023).indexOf('2023') >= 0).assertTrue();
        } else {
          expect(monthLabel(4, 2022).indexOf('2022') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(4, 2022));
      }
    });

    /**
     * @tc.name SelectionGuardAndContiguousDayRunPreserveTheOracleSnapshotAcrossLeapYears
     * @tc.desc SelectionGuardAndContiguousDayRunPreserveTheOracleSnapshotAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('SelectionGuardAndContiguousDayRunPreserveTheOracleSnapshotAcrossLeapYears', 0, () => {
      {
        const allowed: boolean = SelectionGuard.canSelect(24, 3, 2020, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(3, 2020);
        expect(SelectionGuard.weekdayFromGrid(grid, 24) >= 0).assertTrue();
        expect(CellProjector.project(24, 3, 2020, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(24, 3, 2020, 12, 6, 2026).visible).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(2, 2021);
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
     * @tc.name ContiguousDayRunAndPanelPairAdvanceTrackTheVisibleColumnsAcrossLeapYears
     * @tc.desc ContiguousDayRunAndPanelPairAdvanceTrackTheVisibleColumnsAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('ContiguousDayRunAndPanelPairAdvanceTrackTheVisibleColumnsAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 2020);
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
        const first: int[] = getMonthDate(8, 2021);
        const second: int[] = getMonthDate(9, 2021);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(8, 2021));
        expect(firstNonZero(second)).assertEqual(firstWeekday(9, 2021));
        if (8 === 12) {
          expect(monthLabel(1, 2022).indexOf('2022') >= 0).assertTrue();
        } else {
          expect(monthLabel(9, 2021).indexOf('2021') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(9, 2021));
      }
      {
        const year: int = 2022;
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
    });

    /**
     * @tc.name PanelPairAdvanceAndGridSnapshotSupportThePopupPreviewAcrossLeapYears
     * @tc.desc PanelPairAdvanceAndGridSnapshotSupportThePopupPreviewAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelPairAdvanceAndGridSnapshotSupportThePopupPreviewAcrossLeapYears', 0, () => {
      {
        const first: int[] = getMonthDate(4, 2021);
        const second: int[] = getMonthDate(5, 2021);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(42);
        expect(firstNonZero(first)).assertEqual(firstWeekday(4, 2021));
        expect(firstNonZero(second)).assertEqual(firstWeekday(5, 2021));
        if (4 === 12) {
          expect(monthLabel(1, 2022).indexOf('2022') >= 0).assertTrue();
        } else {
          expect(monthLabel(5, 2021).indexOf('2021') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(5, 2021));
      }
      {
        const year: int = 2022;
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
        const allowed: boolean = SelectionGuard.canSelect(7, 11, 2023, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(11, 2023);
        expect(SelectionGuard.weekdayFromGrid(grid, 7) >= 0).assertTrue();
        expect(CellProjector.project(7, 11, 2023, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(7, 11, 2023, 12, 6, 2026).visible).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(10, 2024);
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
     * @tc.name GridSnapshotAndSelectionGuardHoldWhenTheMonthRollsOverAcrossLeapYears
     * @tc.desc GridSnapshotAndSelectionGuardHoldWhenTheMonthRollsOverAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndSelectionGuardHoldWhenTheMonthRollsOverAcrossLeapYears', 0, () => {
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
        expect(produced[5]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(11);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[41]).assertEqual(0);
      }
      {
        const allowed: boolean = SelectionGuard.canSelect(5, 7, 2022, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(7, 2022);
        expect(SelectionGuard.weekdayFromGrid(grid, 5) >= 0).assertTrue();
        expect(CellProjector.project(5, 7, 2022, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(5, 7, 2022, 12, 6, 2026).visible).assertTrue();
      }
    });

    /**
     * @tc.name SelectionGuardAndContiguousDayRunStayConsistentForTheSamePanelAtDecadeBoundary
     * @tc.desc SelectionGuardAndContiguousDayRunStayConsistentForTheSamePanelAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('SelectionGuardAndContiguousDayRunStayConsistentForTheSamePanelAtDecadeBoundary', 0, () => {
      {
        const allowed: boolean = SelectionGuard.canSelect(5, 3, 2022, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(3, 2022);
        expect(SelectionGuard.weekdayFromGrid(grid, 5) >= 0).assertTrue();
        expect(CellProjector.project(5, 3, 2022, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(5, 3, 2022, 12, 6, 2026).visible).assertTrue();
      }
      {
        const grid: int[] = getMonthDate(2, 2023);
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
      {
        const first: int[] = getMonthDate(12, 2024);
        const second: int[] = getMonthDate(1, 2025);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(12, 2024));
        expect(firstNonZero(second)).assertEqual(firstWeekday(1, 2025));
        if (12 === 12) {
          expect(monthLabel(1, 2025).indexOf('2025') >= 0).assertTrue();
        } else {
          expect(monthLabel(1, 2024).indexOf('2024') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(1, 2025));
      }
    });

    /**
     * @tc.name ContiguousDayRunAndPanelPairAdvanceSurviveRepeatedInspectionAtDecadeBoundary
     * @tc.desc ContiguousDayRunAndPanelPairAdvanceSurviveRepeatedInspectionAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('ContiguousDayRunAndPanelPairAdvanceSurviveRepeatedInspectionAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 2022);
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
        const first: int[] = getMonthDate(8, 2023);
        const second: int[] = getMonthDate(9, 2023);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(8, 2023));
        expect(firstNonZero(second)).assertEqual(firstWeekday(9, 2023));
        if (8 === 12) {
          expect(monthLabel(1, 2024).indexOf('2024') >= 0).assertTrue();
        } else {
          expect(monthLabel(9, 2023).indexOf('2023') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(9, 2023));
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
        expect(produced[3]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(4);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
      {
        const allowed: boolean = SelectionGuard.canSelect(19, 4, 2025, 12, 6, 2026);
        expect(allowed).assertEqual(false);
        const grid: int[] = getMonthDate(4, 2025);
        expect(SelectionGuard.weekdayFromGrid(grid, 19) >= 0).assertTrue();
        expect(CellProjector.project(19, 4, 2025, 12, 6, 2026).selectable).assertFalse();
        expect(CellProjector.project(19, 4, 2025, 12, 6, 2026).visible).assertTrue();
      }
    });
  });
}
