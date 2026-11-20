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

const BUNDLE_NAME: string = 'com.samples.titlebarsandtoolbars';
const ABILITY_NAME: string = 'EntryAbility';

export default function abilityTest() {
  describe('TitleBarsAbilityTest', () => {
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
     * @tc.number SUB_TITLEBARS_ABILITY_0100
     * @tc.name testTitleBarsLaunch0001
     * @tc.desc Verify launch behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsLaunch0001', 0, async (done: Function) => {
      await runCase('testTitleBarsLaunch0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await waitId('pageTitle');
        expect(await existsId('cardEditable')).assertTrue();
        expect(await existsId('cardEditableV2')).assertTrue();
        expect(await existsId('cardSelect')).assertTrue();
        expect(await existsId('cardTab')).assertTrue();
        expect(await existsId('cardToolbar')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_ABILITY_0200
     * @tc.name testTitleBarsBreakpoint0002
     * @tc.desc Verify breakpoint behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsBreakpoint0002', 0, async (done: Function) => {
      await runCase('testTitleBarsBreakpoint0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        expect(await textOfId('breakpointText')).assertContain('breakpoint=');
        expect(await textOfId('deviceInfoText')).assertContain('device=');
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_ABILITY_0300
     * @tc.name testTitleBarsOpenEditable0003
     * @tc.desc Verify open editable behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsOpenEditable0003', 0, async (done: Function) => {
      await runCase('testTitleBarsOpenEditable0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardEditable');
        await waitId('editablePageTitle');
        await clickId('editableBack');
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_ABILITY_0400
     * @tc.name testTitleBarsOpenEditableV20004
     * @tc.desc Verify open editable v2 behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsOpenEditableV20004', 0, async (done: Function) => {
      await runCase('testTitleBarsOpenEditableV20004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardEditableV2');
        await waitId('editableV2PageTitle');
        await clickId('editableV2Back');
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_ABILITY_0500
     * @tc.name testTitleBarsOpenSelect0005
     * @tc.desc Verify open select behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsOpenSelect0005', 0, async (done: Function) => {
      await runCase('testTitleBarsOpenSelect0005', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardSelect');
        await waitId('selectPageTitle');
        await clickId('selectBack');
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_ABILITY_0600
     * @tc.name testTitleBarsOpenTab0006
     * @tc.desc Verify open tab behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsOpenTab0006', 0, async (done: Function) => {
      await runCase('testTitleBarsOpenTab0006', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardTab');
        await waitId('tabPageTitle');
        await clickId('tabBack');
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_TITLEBARS_ABILITY_0700
     * @tc.name testTitleBarsOpenToolbar0007
     * @tc.desc Verify open toolbar behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTitleBarsOpenToolbar0007', 0, async (done: Function) => {
      await runCase('testTitleBarsOpenToolbar0007', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardToolbar');
        await waitId('toolbarPageTitle');
        await clickId('toolbarBack');
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });
  });
}
