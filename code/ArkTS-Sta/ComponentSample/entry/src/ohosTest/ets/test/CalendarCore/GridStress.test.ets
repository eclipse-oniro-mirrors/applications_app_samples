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

export default function GridStressTest(): void {
  describe('GridStressTest', () => {
    beforeAll(() => {
      logSuite('GridStressTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('GridStressTest', 'end');
    });

    /**
     * @tc.name DecadeInvariantScanAndGridSnapshotStayConsistentForTheSamePanelForPreviewPanels
     * @tc.desc DecadeInvariantScanAndGridSnapshotStayConsistentForTheSamePanelForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('DecadeInvariantScanAndGridSnapshotStayConsistentForTheSamePanelForPreviewPanels', 0, () => {
      {
        const startYear: int = 2010;
        const endYear: int = 2011;
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
        const year: int = 2011;
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
     * @tc.name GridSnapshotAndDecadeInvariantScanSurviveRepeatedInspectionForPreviewPanels
     * @tc.desc GridSnapshotAndDecadeInvariantScanSurviveRepeatedInspectionForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('GridSnapshotAndDecadeInvariantScanSurviveRepeatedInspectionForPreviewPanels', 0, () => {
      {
        const year: int = 2010;
        const month: int = 8;
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
        const startYear: int = 2011;
        const endYear: int = 2012;
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
        const year: int = 2012;
        const month: int = 4;
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
     * @tc.name DecadeInvariantScanAndGridSnapshotMatchAfterSelectionChangeForPreviewPanels
     * @tc.desc DecadeInvariantScanAndGridSnapshotMatchAfterSelectionChangeForPreviewPanels
     * @tc.type Function
     * @tc.level Level2
     */
    it('DecadeInvariantScanAndGridSnapshotMatchAfterSelectionChangeForPreviewPanels', 0, () => {
      {
        const startYear: int = 2011;
        const endYear: int = 2012;
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
        const year: int = 2012;
        const month: int = 11;
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
        const startYear: int = 2013;
        const endYear: int = 2014;
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
        const year: int = 2014;
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
    });
  });
}
