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

export default function CalendarLeapValidationTest(): void {
  describe('CalendarLeapValidationTest', () => {
    beforeAll(() => {
      logSuite('CalendarLeapValidationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('CalendarLeapValidationTest', 'end');
    });

    /**
     * @tc.name CalendarDayCountAndGridSnapshotStayConsistentForTheSamePanelForPreviewPanels
     * @tc.desc CalendarDayCountAndGridSnapshotStayConsistentForTheSamePanelForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndGridSnapshotStayConsistentForTheSamePanelForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 1600);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(isLeapYear(1600)).assertEqual(true);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
      }
      {
        const year: int = 1601;
        const month: int = 8;
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
    });

    /**
     * @tc.name GridSnapshotAndContiguousDayRunSurviveRepeatedInspectionForPreviewPanels
     * @tc.desc GridSnapshotAndContiguousDayRunSurviveRepeatedInspectionForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndContiguousDayRunSurviveRepeatedInspectionForPreviewPanels', 0, () => {
      {
        const year: int = 1600;
        const month: int = 4;
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
      {
        const grid: int[] = getMonthDate(1, 1601);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        expect(isContiguousFromOne(grid)).assertTrue();
        for (let index = 0; index < days.length; index++) {
          expect(days[index]).assertEqual(index + 1);
        }
        expect(days[30]).assertEqual(31);
      }
      {
        const grid: int[] = getMonthDate(11, 1602);
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
     * @tc.name ContiguousDayRunAndWeekAlignmentMatchAfterSelectionChangeForPreviewPanels
     * @tc.desc ContiguousDayRunAndWeekAlignmentMatchAfterSelectionChangeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('ContiguousDayRunAndWeekAlignmentMatchAfterSelectionChangeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(10, 1601);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        expect(isContiguousFromOne(grid)).assertTrue();
        for (let index = 0; index < days.length; index++) {
          expect(days[index]).assertEqual(index + 1);
        }
        expect(days[30]).assertEqual(31);
      }
      {
        const grid: int[] = getMonthDate(7, 1602);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const grid: int[] = getMonthDate(6, 1603);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(isLeapYear(1603)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
      }
      {
        const year: int = 1604;
        const month: int = 3;
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
     * @tc.name WeekAlignmentAndCalendarDayCountRemainStableDuringPreviewForPreviewPanels
     * @tc.desc WeekAlignmentAndCalendarDayCountRemainStableDuringPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndCalendarDayCountRemainStableDuringPreviewForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 1601);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const grid: int[] = getMonthDate(2, 1602);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(28);
        expect(isLeapYear(1602)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(28);
      }
    });

    /**
     * @tc.name CalendarDayCountAndGridSnapshotAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.desc CalendarDayCountAndGridSnapshotAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndGridSnapshotAgreeUnderRepeatedRebuildForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 1602);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(isLeapYear(1602)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
      }
      {
        const year: int = 1603;
        const month: int = 8;
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
        const grid: int[] = getMonthDate(5, 1604);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        expect(isContiguousFromOne(grid)).assertTrue();
        for (let index = 0; index < days.length; index++) {
          expect(days[index]).assertEqual(index + 1);
        }
        expect(days[30]).assertEqual(31);
      }
    });

    /**
     * @tc.name ContiguousDayRunAndWeekAlignmentKeepTheSameGridShapeForPreviewPanels
     * @tc.desc ContiguousDayRunAndWeekAlignmentKeepTheSameGridShapeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('ContiguousDayRunAndWeekAlignmentKeepTheSameGridShapeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(10, 1603);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        expect(isContiguousFromOne(grid)).assertTrue();
        for (let index = 0; index < days.length; index++) {
          expect(days[index]).assertEqual(index + 1);
        }
        expect(days[30]).assertEqual(31);
      }
      {
        const grid: int[] = getMonthDate(7, 1604);
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
     * @tc.name WeekAlignmentAndCalendarDayCountPreserveTheOracleSnapshotForPreviewPanels
     * @tc.desc WeekAlignmentAndCalendarDayCountPreserveTheOracleSnapshotForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndCalendarDayCountPreserveTheOracleSnapshotForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 1603);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(42);
      }
      {
        const grid: int[] = getMonthDate(2, 1604);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(29);
        expect(isLeapYear(1604)).assertEqual(true);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(29);
      }
      {
        const year: int = 1605;
        const month: int = 12;
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
     * @tc.name CalendarDayCountAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels
     * @tc.desc CalendarDayCountAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndGridSnapshotTrackTheVisibleColumnsForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 1604);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(isLeapYear(1604)).assertEqual(true);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
      }
      {
        const year: int = 1605;
        const month: int = 8;
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
      {
        const grid: int[] = getMonthDate(5, 1606);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        expect(isContiguousFromOne(grid)).assertTrue();
        for (let index = 0; index < days.length; index++) {
          expect(days[index]).assertEqual(index + 1);
        }
        expect(days[30]).assertEqual(31);
      }
      {
        const grid: int[] = getMonthDate(4, 1607);
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
     * @tc.name GridSnapshotAndContiguousDayRunSupportThePopupPreviewForPreviewPanels
     * @tc.desc GridSnapshotAndContiguousDayRunSupportThePopupPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndContiguousDayRunSupportThePopupPreviewForPreviewPanels', 0, () => {
      {
        const year: int = 1604;
        const month: int = 4;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
          28, 29, 30, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(produced[4]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(5);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(1, 1605);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        expect(isContiguousFromOne(grid)).assertTrue();
        for (let index = 0; index < days.length; index++) {
          expect(days[index]).assertEqual(index + 1);
        }
        expect(days[30]).assertEqual(31);
      }
    });

    /**
     * @tc.name ContiguousDayRunAndWeekAlignmentHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.desc ContiguousDayRunAndWeekAlignmentHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('ContiguousDayRunAndWeekAlignmentHoldWhenTheMonthRollsOverForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(10, 1605);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        expect(isContiguousFromOne(grid)).assertTrue();
        for (let index = 0; index < days.length; index++) {
          expect(days[index]).assertEqual(index + 1);
        }
        expect(days[30]).assertEqual(31);
      }
      {
        const grid: int[] = getMonthDate(7, 1606);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(42);
      }
      {
        const grid: int[] = getMonthDate(6, 1607);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(isLeapYear(1607)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
      }
    });

    /**
     * @tc.name WeekAlignmentAndCalendarDayCountStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.desc WeekAlignmentAndCalendarDayCountStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndCalendarDayCountStayConsistentForTheSamePanelAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 1605);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const grid: int[] = getMonthDate(2, 1606);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(28);
        expect(isLeapYear(1606)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(28);
      }
      {
        const year: int = 1607;
        const month: int = 12;
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
        const grid: int[] = getMonthDate(9, 1608);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(30);
        expect(isContiguousFromOne(grid)).assertTrue();
        for (let index = 0; index < days.length; index++) {
          expect(days[index]).assertEqual(index + 1);
        }
        expect(days[29]).assertEqual(30);
      }
    });

    /**
     * @tc.name CalendarDayCountAndGridSnapshotSurviveRepeatedInspectionAcrossLeapYears
     * @tc.desc CalendarDayCountAndGridSnapshotSurviveRepeatedInspectionAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndGridSnapshotSurviveRepeatedInspectionAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 1606);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(isLeapYear(1606)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
      }
      {
        const year: int = 1607;
        const month: int = 8;
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
    });

    /**
     * @tc.name GridSnapshotAndContiguousDayRunMatchAfterSelectionChangeAcrossLeapYears
     * @tc.desc GridSnapshotAndContiguousDayRunMatchAfterSelectionChangeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndContiguousDayRunMatchAfterSelectionChangeAcrossLeapYears', 0, () => {
      {
        const year: int = 1606;
        const month: int = 4;
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
      {
        const grid: int[] = getMonthDate(1, 1607);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        expect(isContiguousFromOne(grid)).assertTrue();
        for (let index = 0; index < days.length; index++) {
          expect(days[index]).assertEqual(index + 1);
        }
        expect(days[30]).assertEqual(31);
      }
      {
        const grid: int[] = getMonthDate(11, 1608);
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
     * @tc.name ContiguousDayRunAndWeekAlignmentRemainStableDuringPreviewAcrossLeapYears
     * @tc.desc ContiguousDayRunAndWeekAlignmentRemainStableDuringPreviewAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('ContiguousDayRunAndWeekAlignmentRemainStableDuringPreviewAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(10, 1607);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        expect(isContiguousFromOne(grid)).assertTrue();
        for (let index = 0; index < days.length; index++) {
          expect(days[index]).assertEqual(index + 1);
        }
        expect(days[30]).assertEqual(31);
      }
      {
        const grid: int[] = getMonthDate(7, 1608);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const grid: int[] = getMonthDate(6, 1609);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(isLeapYear(1609)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
      }
      {
        const year: int = 1610;
        const month: int = 3;
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
     * @tc.name CalendarDayCountAndGridSnapshotHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.desc CalendarDayCountAndGridSnapshotHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndGridSnapshotHoldAcrossSeasonBoundariesAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 1608);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(isLeapYear(1608)).assertEqual(true);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
      }
      {
        const year: int = 1609;
        const month: int = 8;
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
        const grid: int[] = getMonthDate(5, 1610);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        expect(isContiguousFromOne(grid)).assertTrue();
        for (let index = 0; index < days.length; index++) {
          expect(days[index]).assertEqual(index + 1);
        }
        expect(days[30]).assertEqual(31);
      }
    });

    /**
     * @tc.name GridSnapshotAndContiguousDayRunKeepTheSameGridShapeAcrossLeapYears
     * @tc.desc GridSnapshotAndContiguousDayRunKeepTheSameGridShapeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndContiguousDayRunKeepTheSameGridShapeAcrossLeapYears', 0, () => {
      {
        const year: int = 1608;
        const month: int = 4;
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
        const grid: int[] = getMonthDate(1, 1609);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        expect(isContiguousFromOne(grid)).assertTrue();
        for (let index = 0; index < days.length; index++) {
          expect(days[index]).assertEqual(index + 1);
        }
        expect(days[30]).assertEqual(31);
      }
      {
        const grid: int[] = getMonthDate(11, 1610);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const grid: int[] = getMonthDate(10, 1611);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(31);
        expect(isLeapYear(1611)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(31);
      }
    });

    /**
     * @tc.name ContiguousDayRunAndWeekAlignmentPreserveTheOracleSnapshotAcrossLeapYears
     * @tc.desc ContiguousDayRunAndWeekAlignmentPreserveTheOracleSnapshotAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('ContiguousDayRunAndWeekAlignmentPreserveTheOracleSnapshotAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(10, 1609);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        expect(isContiguousFromOne(grid)).assertTrue();
        for (let index = 0; index < days.length; index++) {
          expect(days[index]).assertEqual(index + 1);
        }
        expect(days[30]).assertEqual(31);
      }
      {
        const grid: int[] = getMonthDate(7, 1610);
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
     * @tc.name WeekAlignmentAndCalendarDayCountTrackTheVisibleColumnsAcrossLeapYears
     * @tc.desc WeekAlignmentAndCalendarDayCountTrackTheVisibleColumnsAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekAlignmentAndCalendarDayCountTrackTheVisibleColumnsAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(3, 1609);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const grid: int[] = getMonthDate(2, 1610);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(28);
        expect(isLeapYear(1610)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(28);
      }
      {
        const year: int = 1611;
        const month: int = 12;
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
     * @tc.name CalendarDayCountAndGridSnapshotSupportThePopupPreviewAcrossLeapYears
     * @tc.desc CalendarDayCountAndGridSnapshotSupportThePopupPreviewAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CalendarDayCountAndGridSnapshotSupportThePopupPreviewAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(9, 1610);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(isLeapYear(1610)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
      }
      {
        const year: int = 1611;
        const month: int = 8;
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
      {
        const grid: int[] = getMonthDate(5, 1612);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        expect(isContiguousFromOne(grid)).assertTrue();
        for (let index = 0; index < days.length; index++) {
          expect(days[index]).assertEqual(index + 1);
        }
        expect(days[30]).assertEqual(31);
      }
      {
        const grid: int[] = getMonthDate(4, 1613);
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
     * @tc.name GridSnapshotAndContiguousDayRunHoldWhenTheMonthRollsOverAcrossLeapYears
     * @tc.desc GridSnapshotAndContiguousDayRunHoldWhenTheMonthRollsOverAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndContiguousDayRunHoldWhenTheMonthRollsOverAcrossLeapYears', 0, () => {
      {
        const year: int = 1610;
        const month: int = 4;
        // Snapshot computed on the test side, never by the function under test.
        const expected: int[] = [
          0, 0, 0, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27,
          28, 29, 30, 0,
        ];
        const produced: int[] = getMonthDate(month, year);
        expect(produced.length).assertEqual(expected.length);
        expect(produced[4]).assertEqual(1);
        expect(countValue(produced, 0)).assertEqual(5);
        expect(joined(expected)).assertEqual(joined(produced));
        expect(realDays(produced).length).assertEqual(realDays(expected).length);
        expect(produced[34]).assertEqual(0);
      }
      {
        const grid: int[] = getMonthDate(1, 1611);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        expect(isContiguousFromOne(grid)).assertTrue();
        for (let index = 0; index < days.length; index++) {
          expect(days[index]).assertEqual(index + 1);
        }
        expect(days[30]).assertEqual(31);
      }
    });

    /**
     * @tc.name ContiguousDayRunAndWeekAlignmentStayConsistentForTheSamePanelAtDecadeBoundary
     * @tc.desc ContiguousDayRunAndWeekAlignmentStayConsistentForTheSamePanelAtDecadeBoundary
     * @tc.type Function
     * @tc.level Level2
     */
    it('ContiguousDayRunAndWeekAlignmentStayConsistentForTheSamePanelAtDecadeBoundary', 0, () => {
      {
        const grid: int[] = getMonthDate(10, 1611);
        const days: int[] = realDays(grid);
        expect(days.length).assertEqual(31);
        expect(isContiguousFromOne(grid)).assertTrue();
        for (let index = 0; index < days.length; index++) {
          expect(days[index]).assertEqual(index + 1);
        }
        expect(days[30]).assertEqual(31);
      }
      {
        const grid: int[] = getMonthDate(7, 1612);
        const facts = GridInspector.facts(grid);
        expect(grid.length % 7).assertEqual(0);
        expect(GridInspector.rowsOf(grid).length * 7).assertEqual(grid.length);
        expect(facts.rows >= 4).assertTrue();
        expect(facts.rows <= 6).assertTrue();
        expect(facts.days + facts.leading + facts.trailing).assertEqual(grid.length);
        expect(grid.length).assertEqual(35);
      }
      {
        const grid: int[] = getMonthDate(6, 1613);
        const facts = GridInspector.facts(grid);
        expect(facts.days).assertEqual(30);
        expect(isLeapYear(1613)).assertEqual(false);
        expect(countValue(grid, 0)).assertEqual(grid.length - facts.days);
        expect(GridInspector.maxValue(grid)).assertEqual(30);
      }
    });
  });
}
