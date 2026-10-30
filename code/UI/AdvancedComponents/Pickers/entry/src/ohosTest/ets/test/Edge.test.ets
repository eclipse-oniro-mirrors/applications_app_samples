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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { PickerUtils } from '../../../main/ets/utils/PickerUtils';
import {
  clickId,
  existsId,
  runCase,
  scrollToId,
  startApp,
  textOfId,
  waitId,
  waitText
} from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.pickers';
const ABILITY_NAME: string = 'EntryAbility';

export default function edgeTest() {
  describe('PickersEdgeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number SUB_PICKERS_EDGE_0100
     * @tc.name testPickersEdgeDefaults0001
     * @tc.desc Verify optional date and time parts use stable defaults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersEdgeDefaults0001', 0, async (done: Function) => {
      await runCase('testPickersEdgeDefaults0001', async () => {
        expect(PickerUtils.pad2(0)).assertEqual('00');
        expect(PickerUtils.pad2(9)).assertEqual('09');
        expect(PickerUtils.pad2(10)).assertEqual('10');
        expect(PickerUtils.pad2(99)).assertEqual('99');
        expect(PickerUtils.formatDateParts()).assertEqual('0-00-00');
        expect(PickerUtils.formatDateParts(2024)).assertEqual('2024-00-00');
        expect(PickerUtils.formatDateParts(2024, 1)).assertEqual('2024-02-00');
        expect(PickerUtils.formatDateParts(999, 11, 31)).assertEqual('999-12-31');
        expect(PickerUtils.formatTimeParts()).assertEqual('00:00:00');
        expect(PickerUtils.formatTimeParts(5)).assertEqual('05:00:00');
        expect(PickerUtils.formatTimeParts(9, 5)).assertEqual('09:05:00');
        expect(PickerUtils.formatDate(new Date(1970, 0, 1))).assertEqual('1970-01-01');
        expect(PickerUtils.formatDate(new Date(2099, 11, 31))).assertEqual('2099-12-31');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_EDGE_0200
     * @tc.name testPickersEdgeWrap0002
     * @tc.desc Verify large deltas, negative indexes, and empty list lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersEdgeWrap0002', 0, async (done: Function) => {
      await runCase('testPickersEdgeWrap0002', async () => {
        expect(PickerUtils.wrapIndex(-6, 5)).assertEqual(4);
        expect(PickerUtils.wrapIndex(10, 5)).assertEqual(0);
        expect(PickerUtils.wrapIndex(-10, 5)).assertEqual(0);
        expect(PickerUtils.wrapIndex(0, 1)).assertEqual(0);
        expect(PickerUtils.wrapIndex(5, 1)).assertEqual(0);
        expect(PickerUtils.wrapIndex(2, -1)).assertEqual(0);
        expect(PickerUtils.stepIndex(2, 10, 5, true)).assertEqual(2);
        expect(PickerUtils.stepIndex(2, -10, 5, true)).assertEqual(2);
        expect(PickerUtils.stepIndex(2, 10, 5, false)).assertEqual(4);
        expect(PickerUtils.stepIndex(2, -10, 5, false)).assertEqual(0);
        expect(PickerUtils.stepIndex(0, 0, 5, true)).assertEqual(0);
        expect(PickerUtils.stepIndex(0, 0, 5, false)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_EDGE_0300
     * @tc.name testPickersEdgeRange0003
     * @tc.desc Verify equal range boundaries, in-range dates, and leap day formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersEdgeRange0003', 0, async (done: Function) => {
      await runCase('testPickersEdgeRange0003', async () => {
        const start = new Date(2020, 0, 1);
        const end = new Date(2030, 11, 31);
        expect(PickerUtils.isWithinRange(start, start, end)).assertTrue();
        expect(PickerUtils.isWithinRange(new Date(2025, 5, 15), start, end)).assertTrue();
        expect(PickerUtils.formatDate(PickerUtils.clampDate(new Date(2025, 5, 15), start, end)))
          .assertEqual('2025-06-15');
        expect(PickerUtils.formatDate(PickerUtils.clampDate(new Date(2020, 0, 1), start, start)))
          .assertEqual('2020-01-01');
        expect(PickerUtils.formatDateRange(start, start)).assertEqual('2020-01-01 ~ 2020-01-01');
        expect(PickerUtils.formatDate(new Date(2024, 1, 29))).assertEqual('2024-02-29');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_EDGE_0400
     * @tc.name testPickersEdgeDateBack0004
     * @tc.desc Verify the date picker page returns to the index directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersEdgeDateBack0004', 0, async (done: Function) => {
      await runCase('testPickersEdgeDateBack0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardDatePicker');
        await waitId('datePicker');
        await clickId('dateBack');
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_EDGE_0500
     * @tc.name testPickersEdgeHistory0005
     * @tc.desc Verify calendar event history and its clear empty state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersEdgeHistory0005', 0, async (done: Function) => {
      await runCase('testPickersEdgeHistory0005', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardCalendar');
        await clickId('calendarToday');
        expect(await textOfId('calendarEvent')).assertContain('today');
        await scrollToId('calendarClearHistory');
        await clickId('calendarClearHistory');
        await waitText('No events yet');
        expect(await existsId('calendarHistory')).assertTrue();
      }, done);
    });
  });
}
