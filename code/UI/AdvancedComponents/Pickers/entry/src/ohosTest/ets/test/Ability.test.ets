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

export default function abilityTest() {
  describe('PickersAbilityTest', () => {
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
     * @tc.number SUB_PICKERS_ABILITY_0100
     * @tc.name testPickersLaunch0001
     * @tc.desc Verify launch behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersLaunch0001', 0, async (done: Function) => {
      await runCase('testPickersLaunch0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await waitId('pageTitle');
        expect(await existsId('cardCalendar')).assertTrue();
        expect(await existsId('cardDatePicker')).assertTrue();
        expect(await existsId('cardUIPicker')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_ABILITY_0200
     * @tc.name testPickersBreakpoint0002
     * @tc.desc Verify breakpoint behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersBreakpoint0002', 0, async (done: Function) => {
      await runCase('testPickersBreakpoint0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        expect(await textOfId('breakpointText')).assertContain('breakpoint=');
        expect(await textOfId('deviceInfoText')).assertContain('device=');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_ABILITY_0300
     * @tc.name testPickersOpenCalendar0003
     * @tc.desc Verify open calendar behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersOpenCalendar0003', 0, async (done: Function) => {
      await runCase('testPickersOpenCalendar0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardCalendar');
        await waitId('calendarTitle');
        await pressBack();
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_ABILITY_0400
     * @tc.name testPickersOpenDatePicker0004
     * @tc.desc Verify open date picker behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersOpenDatePicker0004', 0, async (done: Function) => {
      await runCase('testPickersOpenDatePicker0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardDatePicker');
        await waitId('dateTitle');
        await pressBack();
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_ABILITY_0500
     * @tc.name testPickersOpenUIPicker0005
     * @tc.desc Verify open ui picker behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersOpenUIPicker0005', 0, async (done: Function) => {
      await runCase('testPickersOpenUIPicker0005', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardUIPicker');
        await waitId('uiTitle');
        await pressBack();
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });
  });
}
