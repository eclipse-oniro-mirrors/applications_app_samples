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
import { getMonthDate } from '../../../main/ets/pages/CustomCalendar/components/GetDate';
import { DateModel } from '../../../main/ets/pages/CustomCalendar/components/DateModel';
import { logSuite, countValue, lastNonZero, firstNonZero, firstWeekday } from './Shared/Support';

export default function abilityTest(): void {
  describe('ActsAbilityTest', () => {
    beforeAll(() => {
      logSuite('ActsAbilityTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => {
        setTimeout((): void => {
          resolve(undefined);
        }, 1);
      });
    });
    afterAll(() => {
      logSuite('ActsAbilityTest', 'end');
    });

    /**
     * @tc.name testHarnessLoadsCalendarEntryPoint
     * @tc.desc verify the harness can reach getMonthDate through the relative import chain
     * @tc.type Function
     * @tc.level Level1
     */
    it('testHarnessLoadsCalendarEntryPoint', 0, () => {
      // March 2024 begins on a Friday, so five blank cells precede day one
      // and the thirty one day month needs six rows in total.
      const grid: int[] = getMonthDate(3, 2024);
      expect(grid.length).assertEqual(42);
      expect(firstNonZero(grid)).assertEqual(5);
      expect(grid[5]).assertEqual(1);
      expect(grid[0]).assertEqual(0);
      expect(firstWeekday(3, 2024)).assertEqual(5);
    });

    /**
     * @tc.name testHarnessProducesWeekAlignedRows
     * @tc.desc verify the February panel is week aligned and ends with trailing blanks
     * @tc.type Function
     * @tc.level Level1
     */
    it('testHarnessProducesWeekAlignedRows', 0, () => {
      // February 2024 ends on a Thursday, so the panel closes with two blanks.
      const grid: int[] = getMonthDate(2, 2024);
      expect(grid.length).assertEqual(35);
      expect(grid.length % 7).assertEqual(0);
      expect(countValue(grid, 29)).assertEqual(1);
      expect(lastNonZero(grid)).assertEqual(32);
      expect(grid[34]).assertEqual(0);
    });

    /**
     * @tc.name testHarnessKeepsModelFieldsMutable
     * @tc.desc verify DateModel stores and forwards constructor arguments and stays mutable
     * @tc.type Function
     * @tc.level Level1
     */
    it('testHarnessKeepsModelFieldsMutable', 0, () => {
      const model: DateModel = new DateModel(0, 0, 0, 0);
      expect(model.day).assertEqual(0);
      model.day = 15;
      model.week = 4;
      model.month = 6;
      model.year = 2028;
      expect(model.day).assertEqual(15);
      expect(model.week).assertEqual(4);
      expect(model.month).assertEqual(6);
      expect(model.year).assertEqual(2028);
    });

    /**
     * @tc.name testSuiteLoggingChannelAcceptsNames
     * @tc.desc verify the shared hilog helper accepts suite names without throwing
     * @tc.type Function
     * @tc.level Level2
     */
    it('testSuiteLoggingChannelAcceptsNames', 0, () => {
      let accepted: boolean = true;
      try {
        logSuite('ActsAbilityTest', 'sanity');
      } catch (error) {
        accepted = false;
      }
      expect(accepted).assertTrue();
    });

    /**
     * @tc.name testHarnessRunsInsideDeviceSandbox
     * @tc.desc verify the runtime clock is available in the device test sandbox
     * @tc.type Function
     * @tc.level Level2
     */
    it('testHarnessRunsInsideDeviceSandbox', 0, () => {
      const now: Date = new Date();
      expect(now.getFullYear() >= 2020).assertTrue();
      expect(now.getMonth() >= 0).assertTrue();
      expect(now.getMonth() <= 11).assertTrue();
    });
  });
}
