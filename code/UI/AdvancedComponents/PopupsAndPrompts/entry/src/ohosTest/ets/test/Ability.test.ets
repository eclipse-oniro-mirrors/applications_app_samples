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

const BUNDLE_NAME: string = 'com.samples.popupsandprompts';
const ABILITY_NAME: string = 'EntryAbility';

export default function abilityTest() {
  describe('PopupsAbilityTest', () => {
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
     * @tc.number SUB_POPUPS_ABILITY_0100
     * @tc.name testPopupsLaunch0001
     * @tc.desc Verify launch behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsLaunch0001', 0, async (done: Function) => {
      await runCase('testPopupsLaunch0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await waitId('pageTitle');
        expect(await existsId('cardPopupV2')).assertTrue();
        expect(await existsId('cardException')).assertTrue();
        expect(await existsId('cardExceptionV2')).assertTrue();
        expect(await existsId('cardSelection')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_ABILITY_0200
     * @tc.name testPopupsBreakpoint0002
     * @tc.desc Verify breakpoint behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsBreakpoint0002', 0, async (done: Function) => {
      await runCase('testPopupsBreakpoint0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        expect(await textOfId('breakpointText')).assertContain('breakpoint=');
        expect(await textOfId('deviceInfoText')).assertContain('device=');
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_ABILITY_0300
     * @tc.name testPopupsOpenPopup0003
     * @tc.desc Verify open popup behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsOpenPopup0003', 0, async (done: Function) => {
      await runCase('testPopupsOpenPopup0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPopupV2');
        await waitId('popupTitle');
        await pressBack();
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_ABILITY_0400
     * @tc.name testPopupsOpenException0004
     * @tc.desc Verify open exception behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsOpenException0004', 0, async (done: Function) => {
      await runCase('testPopupsOpenException0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardException');
        await waitId('exceptionTitle');
        await pressBack();
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_ABILITY_0500
     * @tc.name testPopupsOpenExceptionV20005
     * @tc.desc Verify open exception v2 behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsOpenExceptionV20005', 0, async (done: Function) => {
      await runCase('testPopupsOpenExceptionV20005', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardExceptionV2');
        await waitId('exceptionV2Title');
        await pressBack();
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_POPUPS_ABILITY_0600
     * @tc.name testPopupsOpenSelection0006
     * @tc.desc Verify open selection behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPopupsOpenSelection0006', 0, async (done: Function) => {
      await runCase('testPopupsOpenSelection0006', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardSelection');
        await waitId('selectionTitle');
        await pressBack();
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });
  });
}
