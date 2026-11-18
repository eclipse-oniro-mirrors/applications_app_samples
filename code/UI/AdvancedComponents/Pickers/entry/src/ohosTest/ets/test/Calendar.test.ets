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
import { clickId, existsId, pressBack, runCase, startApp, textOfId, waitId } from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.pickers';
const ABILITY_NAME: string = 'EntryAbility';

export default function calendarTest() {
  describe('CalendarPickerTest', () => {
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
     * @tc.number SUB_PICKERS_CALENDAR_0100
     * @tc.name testPickersCalendarPage0001
     * @tc.desc Verify calendar page behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersCalendarPage0001', 0, async (done: Function) => {
      await runCase('testPickersCalendarPage0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardCalendar');
        await waitId('calendarPicker');
        expect(await existsId('calendarSelected')).assertTrue();
        expect(await textOfId('calendarSelected')).assertContain('Selected');
        expect(await textOfId('calendarEvent')).assertContain('ready');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_CALENDAR_0200
     * @tc.name testPickersCalendarToday0002
     * @tc.desc Verify calendar today behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersCalendarToday0002', 0, async (done: Function) => {
      await runCase('testPickersCalendarToday0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardCalendar');
        await clickId('calendarToday');
        expect(await textOfId('calendarEvent')).assertContain('today');
        expect(await textOfId('calendarSelected')).assertContain(`${new Date().getFullYear()}`);
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_CALENDAR_0300
     * @tc.name testPickersCalendarBack0003
     * @tc.desc Verify calendar back behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersCalendarBack0003', 0, async (done: Function) => {
      await runCase('testPickersCalendarBack0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardCalendar');
        await waitId('calendarTitle');
        await clickId('calendarBack');
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_CALENDAR_0400
     * @tc.name testPickersCalendarDialog0004
     * @tc.desc Verify calendar dialog behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersCalendarDialog0004', 0, async (done: Function) => {
      await runCase('testPickersCalendarDialog0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardCalendar');
        await clickId('calendarPicker');
        await waitId('calendarPicker');
        await pressBack();
        await waitId('calendarTitle');
        expect(await existsId('calendarTitle')).assertTrue();
      }, done);
    });
  });
}
