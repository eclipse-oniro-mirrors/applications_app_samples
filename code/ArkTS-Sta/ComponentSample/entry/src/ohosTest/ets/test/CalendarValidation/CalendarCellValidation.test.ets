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

export default function CalendarCellValidationTest(): void {
  describe('CalendarCellValidationTest', () => {
    beforeAll(() => {
      logSuite('CalendarCellValidationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('CalendarCellValidationTest', 'end');
    });

    /**
     * @tc.name CellProjectionAndBlankLeadCellsSurviveRepeatedInspectionForPreviewPanels
     * @tc.desc CellProjectionAndBlankLeadCellsSurviveRepeatedInspectionForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndBlankLeadCellsSurviveRepeatedInspectionForPreviewPanels', 0, () => {
      {
        const style = CellProjector.project(2, 6, 2026, 2, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('2');
        const other = CellProjector.project(2, 12, 1904, 2, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 12, 1904, 2, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(9, 1905);
        const expectedLead: int = 5;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(8, 1906);
        const expectedTrailing: int = 1;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
    });

    /**
     * @tc.name BlankLeadCellsAndSaturdayClosureMatchAfterSelectionChangeForPreviewPanels
     * @tc.desc BlankLeadCellsAndSaturdayClosureMatchAfterSelectionChangeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndSaturdayClosureMatchAfterSelectionChangeForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(5, 1905);
        const expectedLead: int = 1;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(4, 1906);
        const expectedTrailing: int = 5;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const grid: int[] = getMonthDate(1, 1907);
        const day: int = 21;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(22);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(1);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(22)).assertEqual(1);
        expect(rowOf(22)).assertEqual(3);
      }
      {
        const style = CellProjector.project(6, 6, 2026, 6, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('6');
        const other = CellProjector.project(6, 11, 1908, 6, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 11, 1908, 6, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name SaturdayClosureAndWeekdayColumnsRemainStableDuringPreviewForPreviewPanels
     * @tc.desc SaturdayClosureAndWeekdayColumnsRemainStableDuringPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndWeekdayColumnsRemainStableDuringPreviewForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(11, 1905);
        const expectedTrailing: int = 2;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const grid: int[] = getMonthDate(10, 1906);
        const day: int = 21;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(21);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(0);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(21)).assertEqual(0);
        expect(rowOf(21)).assertEqual(3);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndCellProjectionAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.desc WeekdayColumnsAndCellProjectionAgreeUnderRepeatedRebuildForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndCellProjectionAgreeUnderRepeatedRebuildForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(6, 1906);
        const day: int = 21;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(25);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(4);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(25)).assertEqual(4);
        expect(rowOf(25)).assertEqual(3);
      }
      {
        const style = CellProjector.project(6, 6, 2026, 6, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('6');
        const other = CellProjector.project(6, 3, 1907, 6, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 3, 1907, 6, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(2, 1908);
        const expectedLead: int = 6;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
    });

    /**
     * @tc.name CellProjectionAndBlankLeadCellsHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.desc CellProjectionAndBlankLeadCellsHoldAcrossSeasonBoundariesForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndBlankLeadCellsHoldAcrossSeasonBoundariesForPreviewPanels', 0, () => {
      {
        const style = CellProjector.project(6, 6, 2026, 6, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('6');
        const other = CellProjector.project(6, 12, 1906, 6, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 12, 1906, 6, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(9, 1907);
        const expectedLead: int = 0;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(8, 1908);
        const expectedTrailing: int = 5;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const grid: int[] = getMonthDate(5, 1909);
        const day: int = 10;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(15);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(1);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(15)).assertEqual(1);
        expect(rowOf(15)).assertEqual(2);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndCellProjectionTrackTheVisibleColumnsForPreviewPanels
     * @tc.desc WeekdayColumnsAndCellProjectionTrackTheVisibleColumnsForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndCellProjectionTrackTheVisibleColumnsForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(6, 1908);
        const day: int = 11;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(11);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(4);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(11)).assertEqual(4);
        expect(rowOf(11)).assertEqual(1);
      }
      {
        const style = CellProjector.project(10, 6, 2026, 10, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('10');
        const other = CellProjector.project(10, 3, 1909, 10, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 3, 1909, 10, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(2, 1910);
        const expectedLead: int = 2;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(12, 1911);
        const expectedTrailing: int = 6;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
    });

    /**
     * @tc.name CellProjectionAndBlankLeadCellsSupportThePopupPreviewForPreviewPanels
     * @tc.desc CellProjectionAndBlankLeadCellsSupportThePopupPreviewForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndBlankLeadCellsSupportThePopupPreviewForPreviewPanels', 0, () => {
      {
        const style = CellProjector.project(10, 6, 2026, 10, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('10');
        const other = CellProjector.project(10, 12, 1908, 10, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 12, 1908, 10, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(9, 1909);
        const expectedLead: int = 3;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
    });

    /**
     * @tc.name BlankLeadCellsAndSaturdayClosureHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.desc BlankLeadCellsAndSaturdayClosureHoldWhenTheMonthRollsOverForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndSaturdayClosureHoldWhenTheMonthRollsOverForPreviewPanels', 0, () => {
      {
        const grid: int[] = getMonthDate(5, 1909);
        const expectedLead: int = 6;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(4, 1910);
        const expectedTrailing: int = 0;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const grid: int[] = getMonthDate(1, 1911);
        const day: int = 30;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(29);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(1);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(29)).assertEqual(1);
        expect(rowOf(29)).assertEqual(4);
      }
    });

    /**
     * @tc.name SaturdayClosureAndWeekdayColumnsStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.desc SaturdayClosureAndWeekdayColumnsStayConsistentForTheSamePanelAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndWeekdayColumnsStayConsistentForTheSamePanelAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(11, 1909);
        const expectedTrailing: int = 4;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const grid: int[] = getMonthDate(10, 1910);
        const day: int = 30;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(35);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(0);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(35)).assertEqual(0);
        expect(rowOf(35)).assertEqual(5);
      }
      {
        const style = CellProjector.project(14, 6, 2026, 14, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('14');
        const other = CellProjector.project(14, 7, 1911, 14, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 7, 1911, 14, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(6, 1912);
        const expectedLead: int = 6;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndCellProjectionSurviveRepeatedInspectionAcrossLeapYears
     * @tc.desc WeekdayColumnsAndCellProjectionSurviveRepeatedInspectionAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndCellProjectionSurviveRepeatedInspectionAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(6, 1910);
        const day: int = 1;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(3);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(3);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(3)).assertEqual(3);
        expect(rowOf(3)).assertEqual(0);
      }
      {
        const style = CellProjector.project(14, 6, 2026, 14, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('14');
        const other = CellProjector.project(14, 3, 1911, 14, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 3, 1911, 14, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name CellProjectionAndBlankLeadCellsMatchAfterSelectionChangeAcrossLeapYears
     * @tc.desc CellProjectionAndBlankLeadCellsMatchAfterSelectionChangeAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('CellProjectionAndBlankLeadCellsMatchAfterSelectionChangeAcrossLeapYears', 0, () => {
      {
        const style = CellProjector.project(14, 6, 2026, 14, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('14');
        const other = CellProjector.project(14, 12, 1910, 14, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 12, 1910, 14, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(9, 1911);
        const expectedLead: int = 5;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(8, 1912);
        const expectedTrailing: int = 0;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(31);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
    });

    /**
     * @tc.name BlankLeadCellsAndSaturdayClosureRemainStableDuringPreviewAcrossLeapYears
     * @tc.desc BlankLeadCellsAndSaturdayClosureRemainStableDuringPreviewAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('BlankLeadCellsAndSaturdayClosureRemainStableDuringPreviewAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(5, 1911);
        const expectedLead: int = 1;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
      {
        const grid: int[] = getMonthDate(4, 1912);
        const expectedTrailing: int = 4;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const grid: int[] = getMonthDate(1, 1913);
        const day: int = 19;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(21);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(0);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(21)).assertEqual(0);
        expect(rowOf(21)).assertEqual(3);
      }
      {
        const style = CellProjector.project(18, 6, 2026, 18, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('18');
        const other = CellProjector.project(18, 11, 1914, 18, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 11, 1914, 18, 6, 2026);
        expect(filler.visible).assertFalse();
      }
    });

    /**
     * @tc.name SaturdayClosureAndWeekdayColumnsAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.desc SaturdayClosureAndWeekdayColumnsAgreeUnderRepeatedRebuildAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('SaturdayClosureAndWeekdayColumnsAgreeUnderRepeatedRebuildAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(11, 1911);
        const expectedTrailing: int = 2;
        const lastDaySlot: int = lastNonZero(grid);
        expect(grid.length - 1 - lastDaySlot).assertEqual(expectedTrailing);
        expect(grid[lastDaySlot]).assertEqual(30);
        expect(grid.length).assertEqual(lastDaySlot + 1 + expectedTrailing);
        expect(countValue(grid, 0)).assertEqual(firstNonZero(grid) + expectedTrailing);
        expect((lastDaySlot + expectedTrailing) % 7).assertEqual(6);
      }
      {
        const grid: int[] = getMonthDate(10, 1912);
        const day: int = 19;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(20);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(6);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(20)).assertEqual(6);
        expect(rowOf(20)).assertEqual(2);
      }
    });

    /**
     * @tc.name WeekdayColumnsAndCellProjectionHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.desc WeekdayColumnsAndCellProjectionHoldAcrossSeasonBoundariesAcrossLeapYears
     * @tc.type Function
     * @tc.level Level2
     */
    it('WeekdayColumnsAndCellProjectionHoldAcrossSeasonBoundariesAcrossLeapYears', 0, () => {
      {
        const grid: int[] = getMonthDate(6, 1912);
        const day: int = 21;
        expect(GridInspector.slotOfDay(grid, day)).assertEqual(26);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(5);
        expect(GridInspector.weekdayOfDay(grid, day)).assertEqual(GridInspector.slotOfDay(grid, day) % 7);
        expect(columnOf(26)).assertEqual(5);
        expect(rowOf(26)).assertEqual(3);
      }
      {
        const style = CellProjector.project(18, 6, 2026, 18, 6, 2026);
        expect(style.visible).assertTrue();
        expect(style.highlighted).assertTrue();
        expect(style.selectable).assertTrue();
        expect(style.label).assertEqual('18');
        const other = CellProjector.project(18, 3, 1913, 18, 6, 2026);
        expect(other.highlighted).assertFalse();
        const filler = CellProjector.project(0, 3, 1913, 18, 6, 2026);
        expect(filler.visible).assertFalse();
      }
      {
        const grid: int[] = getMonthDate(2, 1914);
        const expectedLead: int = 0;
        const observedLead: int = firstNonZero(grid);
        expect(observedLead).assertEqual(expectedLead);
        expect(grid[0] === 0 || expectedLead === 0).assertTrue();
        expect(countValue(grid, 0) >= expectedLead).assertTrue();
        expect(grid[observedLead]).assertEqual(1);
      }
    });
  });
}
