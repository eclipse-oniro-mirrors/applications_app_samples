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
import { clickId, existsId, runCase, startApp, textOfId, waitId } from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.pickers';
const ABILITY_NAME: string = 'EntryAbility';

export default function datePickerTest() {
  describe('DatePickerComponentTest', () => {
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
     * @tc.number SUB_PICKERS_DATEPICKER_0100
     * @tc.name testPickersDatePage0001
     * @tc.desc Verify date page behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersDatePage0001', 0, async (done: Function) => {
      await runCase('testPickersDatePage0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardDatePicker');
        await waitId('datePicker');
        expect(await textOfId('dateResult')).assertContain('date=');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_DATEPICKER_0200
     * @tc.name testPickersDateModeTime0002
     * @tc.desc Verify date mode time behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersDateModeTime0002', 0, async (done: Function) => {
      await runCase('testPickersDateModeTime0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardDatePicker');
        await clickId('dateModeTime');
        await waitId('timePicker');
        expect(await textOfId('timeResult')).assertContain('time=');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_DATEPICKER_0300
     * @tc.name testPickersDateModeDateTime0003
     * @tc.desc Verify date mode date time behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersDateModeDateTime0003', 0, async (done: Function) => {
      await runCase('testPickersDateModeDateTime0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardDatePicker');
        await clickId('dateModeDateTime');
        await waitId('dateTimePicker');
        expect(await textOfId('dateTimeResult')).assertContain('datetime=');
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_DATEPICKER_0400
     * @tc.name testPickersDateModeBack0004
     * @tc.desc Verify date mode back behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersDateModeBack0004', 0, async (done: Function) => {
      await runCase('testPickersDateModeBack0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardDatePicker');
        await clickId('dateModeTime');
        await waitId('timePicker');
        await clickId('dateModeDate');
        await waitId('datePicker');
        expect(await existsId('datePicker')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_PICKERS_DATEPICKER_0500
     * @tc.name testPickersDateAdvanced0005
     * @tc.desc Verify date advanced behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPickersDateAdvanced0005', 0, async (done: Function) => {
      await runCase('testPickersDateAdvanced0005', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardDatePicker');
        await clickId('dpLunar');
        await clickId('dpLoop');
        await clickId('dpMilitary');
        await clickId('dpSeconds');
        const config = await textOfId('dateConfig');
        expect(config).assertContain('lunar=true');
        expect(config).assertContain('loop=true');
        expect(config).assertContain('military=false');
        expect(config).assertContain('seconds=true');
        await waitId('datePicker');
      }, done);
    });

  });
}
