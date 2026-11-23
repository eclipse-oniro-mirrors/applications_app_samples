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

export default function CalendarTimezoneValidationTest(): void {
  describe('CalendarTimezoneValidationTest', () => {
    beforeAll(() => {
      logSuite('CalendarTimezoneValidationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('CalendarTimezoneValidationTest', 'end');
    });

    /**
     * @tc.name WeekdayColumnsAndWeekAlignmentStayConsistentForTheSamePanelForPreviewPanels
     * @tc.desc WeekdayColumnsAndWeekAlignmentStayConsistentForTheSamePanelForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndWeekAlignmentStayConsistentForTheSamePanelForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 1969);
        const day: int = 1;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(6);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(6);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(6)).assertEqual(6);
        expect(rowOf(6)).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(2, 1970);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(28);
      }
    });

    /**
     * @tc.name WeekAlignmentAndGridSnapshotSurviveRepeatedInspectionForPreviewPanels
     * @tc.desc WeekAlignmentAndGridSnapshotSurviveRepeatedInspectionForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndGridSnapshotSurviveRepeatedInspectionForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 1969);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const year: int = 1970;
        const month: int = 8;
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
        const first: int[] = getMonthDate(5, 1971);
        const second: int[] = getMonthDate(6, 1971);
        expect(first.length).assertEqual(42);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(5, 1971));
        expect(firstNonZero(second)).assertEqual(firstWeekday(6, 1971));
        if (5 === 12) {
          expect(monthLabel(1, 1972).indexOf('1972') >= 0).assertTrue();
        } else {
          expect(monthLabel(6, 1971).indexOf('1971') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(6, 1971));
      }
    });

    /**
     * @tc.name GridSnapshotAndPanelPairAdvanceMatchAfterSelectionChangeForPreviewPanels
     * @tc.desc GridSnapshotAndPanelPairAdvanceMatchAfterSelectionChangeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndPanelPairAdvanceMatchAfterSelectionChangeForPreviewPanels', 0, () => {
      {
        const year: int = 1970;
        const month: int = 4;
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
        const first: int[] = getMonthDate(1, 1971);
        const second: int[] = getMonthDate(2, 1971);
        expect(first.length).assertEqual(42);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(1, 1971));
        expect(firstNonZero(second)).assertEqual(firstWeekday(2, 1971));
        if (1 === 12) {
          expect(monthLabel(1, 1972).indexOf('1972') >= 0).assertTrue();
        } else {
          expect(monthLabel(2, 1971).indexOf('1971') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(2, 1971));
      }
      {
        const grid: int[] = getMonthDate(11, 1972);
        const day: int = 21;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(23);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(2);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(23)).assertEqual(2);
        expect(rowOf(23)).assertEqual(3);
      }
      {
        const grid: int[] = getMonthDate(10, 1973);
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
     * @tc.name PanelPairAdvanceAndWeekdayColumnsRemainStableDuringPreviewForPreviewPanels
     * @tc.desc PanelPairAdvanceAndWeekdayColumnsRemainStableDuringPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelPairAdvanceAndWeekdayColumnsRemainStableDuringPreviewForPreviewPanels', 0, () => {
      {
        const first: int[] = getMonthDate(10, 1970);
        const second: int[] = getMonthDate(11, 1970);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(10, 1970));
        expect(firstNonZero(second)).assertEqual(firstWeekday(11, 1970));
        if (10 === 12) {
          expect(monthLabel(1, 1971).indexOf('1971') >= 0).assertTrue();
        } else {
          expect(monthLabel(11, 1970).indexOf('1970') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(11, 1970));
      }
      {
        const grid: int[] = getMonthDate(7, 1971);
        const day: int = 21;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(24);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(3);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(24)).assertEqual(3);
        expect(rowOf(24)).assertEqual(3);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndWeekAlignmentAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.desc WeekdayColumnsAndWeekAlignmentAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndWeekAlignmentAgreeUnderRepeatedRebuildForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 1971);
        const day: int = 21;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(21);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(0);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(21)).assertEqual(0);
        expect(rowOf(21)).assertEqual(3);
      }
      {
        const grid: int[] = getMonthDate(2, 1972);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const year: int = 1973;
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
    });

    /**
     * @tc.name WeekAlignmentAndGridSnapshotHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.desc WeekAlignmentAndGridSnapshotHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndGridSnapshotHoldAcrossSeasonBoundariesForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 1971);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const year: int = 1972;
        const month: int = 8;
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
      {
        const first: int[] = getMonthDate(5, 1973);
        const second: int[] = getMonthDate(6, 1973);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(5, 1973));
        expect(firstNonZero(second)).assertEqual(firstWeekday(6, 1973));
        if (5 === 12) {
          expect(monthLabel(1, 1974).indexOf('1974') >= 0).assertTrue();
        } else {
          expect(monthLabel(6, 1973).indexOf('1973') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(6, 1973));
      }
      {
        const grid: int[] = getMonthDate(4, 1974);
        const day: int = 11;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(11);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(4);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(11)).assertEqual(4);
        expect(rowOf(11)).assertEqual(1);
      }
    });

    /**
     * @tc.name GridSnapshotAndPanelPairAdvanceKeepTheSameGridShapeForPreviewPanels
     * @tc.desc GridSnapshotAndPanelPairAdvanceKeepTheSameGridShapeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndPanelPairAdvanceKeepTheSameGridShapeForPreviewPanels', 0, () => {
      {
        const year: int = 1972;
        const month: int = 4;
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
        const first: int[] = getMonthDate(1, 1973);
        const second: int[] = getMonthDate(2, 1973);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(1, 1973));
        expect(firstNonZero(second)).assertEqual(firstWeekday(2, 1973));
        if (1 === 12) {
          expect(monthLabel(1, 1974).indexOf('1974') >= 0).assertTrue();
        } else {
          expect(monthLabel(2, 1973).indexOf('1973') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(2, 1973));
      }
    });

    /**
     * @tc.name PanelPairAdvanceAndWeekdayColumnsPreserveTheOracleSnapshotForPreviewPanels
     * @tc.desc PanelPairAdvanceAndWeekdayColumnsPreserveTheOracleSnapshotForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelPairAdvanceAndWeekdayColumnsPreserveTheOracleSnapshotForPreviewPanels', 0, () => {
      {
        const first: int[] = getMonthDate(10, 1972);
        const second: int[] = getMonthDate(11, 1972);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(10, 1972));
        expect(firstNonZero(second)).assertEqual(firstWeekday(11, 1972));
        if (10 === 12) {
          expect(monthLabel(1, 1973).indexOf('1973') >= 0).assertTrue();
        } else {
          expect(monthLabel(11, 1972).indexOf('1972') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(11, 1972));
      }
      {
        const grid: int[] = getMonthDate(7, 1973);
        const day: int = 10;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(9);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(2);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(9)).assertEqual(2);
        expect(rowOf(9)).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(6, 1974);
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
     * @tc.name WeekdayColumnsAndWeekAlignmentTrackTheVisibleColumnsForPreviewPanels
     * @tc.desc WeekdayColumnsAndWeekAlignmentTrackTheVisibleColumnsForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndWeekAlignmentTrackTheVisibleColumnsForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 1973);
        const day: int = 10;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(13);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(6);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(13)).assertEqual(6);
        expect(rowOf(13)).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(2, 1974);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const year: int = 1975;
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
        const first: int[] = getMonthDate(9, 1976);
        const second: int[] = getMonthDate(10, 1976);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(42);
        expect(firstNonZero(first)).assertEqual(firstWeekday(9, 1976));
        expect(firstNonZero(second)).assertEqual(firstWeekday(10, 1976));
        if (9 === 12) {
          expect(monthLabel(1, 1977).indexOf('1977') >= 0).assertTrue();
        } else {
          expect(monthLabel(10, 1976).indexOf('1976') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(10, 1976));
      }
    });

    /**
     * @tc.name WeekAlignmentAndGridSnapshotSupportThePopupPreviewForPreviewPanels
     * @tc.desc WeekAlignmentAndGridSnapshotSupportThePopupPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndGridSnapshotSupportThePopupPreviewForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 1973);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(42);
      }
      {
        const year: int = 1974;
        const month: int = 8;
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
     * @tc.name GridSnapshotAndPanelPairAdvanceHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.desc GridSnapshotAndPanelPairAdvanceHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndPanelPairAdvanceHoldWhenTheMonthRollsOverForPreviewPanels', 0, () => {
      {
        const year: int = 1974;
        const month: int = 4;
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
        const first: int[] = getMonthDate(1, 1975);
        const second: int[] = getMonthDate(2, 1975);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(1, 1975));
        expect(firstNonZero(second)).assertEqual(firstWeekday(2, 1975));
        if (1 === 12) {
          expect(monthLabel(1, 1976).indexOf('1976') >= 0).assertTrue();
        } else {
          expect(monthLabel(2, 1975).indexOf('1975') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(2, 1975));
      }
      {
        const grid: int[] = getMonthDate(11, 1976);
        const day: int = 1;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(1);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(1);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(1)).assertEqual(1);
        expect(rowOf(1)).assertEqual(0);
      }
    });

    /**
     * @tc.name PanelPairAdvanceAndWeekdayColumnsStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.desc PanelPairAdvanceAndWeekdayColumnsStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelPairAdvanceAndWeekdayColumnsStayConsistentForTheSamePanelAcrossLeapYears', 0, () => {
      {
        const first: int[] = getMonthDate(10, 1974);
        const second: int[] = getMonthDate(11, 1974);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(10, 1974));
        expect(firstNonZero(second)).assertEqual(firstWeekday(11, 1974));
        if (10 === 12) {
          expect(monthLabel(1, 1975).indexOf('1975') >= 0).assertTrue();
        } else {
          expect(monthLabel(11, 1974).indexOf('1974') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(11, 1974));
      }
      {
        const grid: int[] = getMonthDate(7, 1975);
        const day: int = 30;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(31);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(3);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(31)).assertEqual(3);
        expect(rowOf(31)).assertEqual(4);
      }
      {
        const grid: int[] = getMonthDate(6, 1976);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const year: int = 1977;
        const month: int = 3;
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
     * @tc.name WeekdayColumnsAndWeekAlignmentSurviveRepeatedInspectionAcrossLeapYears
     * @tc.desc WeekdayColumnsAndWeekAlignmentSurviveRepeatedInspectionAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndWeekAlignmentSurviveRepeatedInspectionAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 1975);
        const day: int = 30;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(35);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(0);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(35)).assertEqual(0);
        expect(rowOf(35)).assertEqual(5);
      }
      {
        const grid: int[] = getMonthDate(2, 1976);
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
     * @tc.name WeekAlignmentAndGridSnapshotMatchAfterSelectionChangeAcrossLeapYears
     * @tc.desc WeekAlignmentAndGridSnapshotMatchAfterSelectionChangeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndGridSnapshotMatchAfterSelectionChangeAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 1975);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const year: int = 1976;
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
        const first: int[] = getMonthDate(5, 1977);
        const second: int[] = getMonthDate(6, 1977);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(5, 1977));
        expect(firstNonZero(second)).assertEqual(firstWeekday(6, 1977));
        if (5 === 12) {
          expect(monthLabel(1, 1978).indexOf('1978') >= 0).assertTrue();
        } else {
          expect(monthLabel(6, 1977).indexOf('1977') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(6, 1977));
      }
    });

    /**
     * @tc.name GridSnapshotAndPanelPairAdvanceRemainStableDuringPreviewAcrossLeapYears
     * @tc.desc GridSnapshotAndPanelPairAdvanceRemainStableDuringPreviewAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndPanelPairAdvanceRemainStableDuringPreviewAcrossLeapYears', 0, () => {
      {
        const year: int = 1976;
        const month: int = 4;
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
        const first: int[] = getMonthDate(1, 1977);
        const second: int[] = getMonthDate(2, 1977);
        expect(first.length).assertEqual(42);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(1, 1977));
        expect(firstNonZero(second)).assertEqual(firstWeekday(2, 1977));
        if (1 === 12) {
          expect(monthLabel(1, 1978).indexOf('1978') >= 0).assertTrue();
        } else {
          expect(monthLabel(2, 1977).indexOf('1977') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(2, 1977));
      }
      {
        const grid: int[] = getMonthDate(11, 1978);
        const day: int = 21;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(23);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(2);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(23)).assertEqual(2);
        expect(rowOf(23)).assertEqual(3);
      }
      {
        const grid: int[] = getMonthDate(10, 1979);
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
     * @tc.name PanelPairAdvanceAndWeekdayColumnsAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.desc PanelPairAdvanceAndWeekdayColumnsAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelPairAdvanceAndWeekdayColumnsAgreeUnderRepeatedRebuildAcrossLeapYears', 0, () => {
      {
        const first: int[] = getMonthDate(10, 1976);
        const second: int[] = getMonthDate(11, 1976);
        expect(first.length).assertEqual(42);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(10, 1976));
        expect(firstNonZero(second)).assertEqual(firstWeekday(11, 1976));
        if (10 === 12) {
          expect(monthLabel(1, 1977).indexOf('1977') >= 0).assertTrue();
        } else {
          expect(monthLabel(11, 1976).indexOf('1976') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(11, 1976));
      }
      {
        const grid: int[] = getMonthDate(7, 1977);
        const day: int = 19;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(23);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(2);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(23)).assertEqual(2);
        expect(rowOf(23)).assertEqual(3);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndWeekAlignmentHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.desc WeekdayColumnsAndWeekAlignmentHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndWeekAlignmentHoldAcrossSeasonBoundariesAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 1977);
        const day: int = 19;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(20);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(6);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(20)).assertEqual(6);
        expect(rowOf(20)).assertEqual(2);
      }
      {
        const grid: int[] = getMonthDate(2, 1978);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const year: int = 1979;
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
    });

    /**
     * @tc.name WeekAlignmentAndGridSnapshotKeepTheSameGridShapeAcrossLeapYears
     * @tc.desc WeekAlignmentAndGridSnapshotKeepTheSameGridShapeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndGridSnapshotKeepTheSameGridShapeAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 1977);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const year: int = 1978;
        const month: int = 8;
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
      {
        const first: int[] = getMonthDate(5, 1979);
        const second: int[] = getMonthDate(6, 1979);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(5, 1979));
        expect(firstNonZero(second)).assertEqual(firstWeekday(6, 1979));
        if (5 === 12) {
          expect(monthLabel(1, 1980).indexOf('1980') >= 0).assertTrue();
        } else {
          expect(monthLabel(6, 1979).indexOf('1979') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(6, 1979));
      }
      {
        const grid: int[] = getMonthDate(4, 1980);
        const day: int = 11;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(12);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(5);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(12)).assertEqual(5);
        expect(rowOf(12)).assertEqual(1);
      }
    });

    /**
     * @tc.name GridSnapshotAndPanelPairAdvancePreserveTheOracleSnapshotAcrossLeapYears
     * @tc.desc GridSnapshotAndPanelPairAdvancePreserveTheOracleSnapshotAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndPanelPairAdvancePreserveTheOracleSnapshotAcrossLeapYears', 0, () => {
      {
        const year: int = 1978;
        const month: int = 4;
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
        const first: int[] = getMonthDate(1, 1979);
        const second: int[] = getMonthDate(2, 1979);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(1, 1979));
        expect(firstNonZero(second)).assertEqual(firstWeekday(2, 1979));
        if (1 === 12) {
          expect(monthLabel(1, 1980).indexOf('1980') >= 0).assertTrue();
        } else {
          expect(monthLabel(2, 1979).indexOf('1979') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(2, 1979));
      }
    });

    /**
     * @tc.name PanelPairAdvanceAndWeekdayColumnsTrackTheVisibleColumnsAcrossLeapYears
     * @tc.desc PanelPairAdvanceAndWeekdayColumnsTrackTheVisibleColumnsAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('PanelPairAdvanceAndWeekdayColumnsTrackTheVisibleColumnsAcrossLeapYears', 0, () => {
      {
        const first: int[] = getMonthDate(10, 1978);
        const second: int[] = getMonthDate(11, 1978);
        expect(first.length).assertEqual(35);
        expect(second.length).assertEqual(35);
        expect(firstNonZero(first)).assertEqual(firstWeekday(10, 1978));
        expect(firstNonZero(second)).assertEqual(firstWeekday(11, 1978));
        if (10 === 12) {
          expect(monthLabel(1, 1979).indexOf('1979') >= 0).assertTrue();
        } else {
          expect(monthLabel(11, 1978).indexOf('1978') >= 0).assertTrue();
        }
        expect(GridInspector.maxValue(second)).assertEqual(daysInMonth(11, 1978));
      }
      {
        const grid: int[] = getMonthDate(7, 1979);
        const day: int = 8;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(7);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(0);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(7)).assertEqual(0);
        expect(rowOf(7)).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(6, 1980);
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
