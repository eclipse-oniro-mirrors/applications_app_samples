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

const BUNDLE_NAME: string = 'com.samples.navigationandlayout';
const ABILITY_NAME: string = 'EntryAbility';

export default function abilityTest() {
  describe('NavigationAbilityTest', () => {
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
     * @tc.number SUB_NAVIGATION_ABILITY_0100
     * @tc.name testNavigationAndLayoutLaunch0001
     * @tc.desc Verify navigation and layout launch behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutLaunch0001', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutLaunch0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await waitId('pageTitle');
        expect(await existsId('cardMulti')).assertTrue();
        expect(await existsId('cardSplit')).assertTrue();
        expect(await existsId('cardFold')).assertTrue();
        expect(await existsId('cardHsp')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_ABILITY_0200
     * @tc.name testNavigationAndLayoutBreakpoint0002
     * @tc.desc Verify navigation and layout breakpoint behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutBreakpoint0002', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutBreakpoint0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        expect(await textOfId('breakpointText')).assertContain('breakpoint=');
        expect(await textOfId('deviceInfoText')).assertContain('device=');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_ABILITY_0300
     * @tc.name testNavigationAndLayoutOpenMulti0003
     * @tc.desc Verify navigation and layout open multi behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutOpenMulti0003', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutOpenMulti0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardMulti');
        await waitId('multiTitle');
        await pressBack();
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_ABILITY_0400
     * @tc.name testNavigationAndLayoutOpenSplit0004
     * @tc.desc Verify navigation and layout open split behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutOpenSplit0004', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutOpenSplit0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardSplit');
        await waitId('splitTitle');
        await pressBack();
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_ABILITY_0500
     * @tc.name testNavigationAndLayoutOpenFold0005
     * @tc.desc Verify navigation and layout open fold behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutOpenFold0005', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutOpenFold0005', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardFold');
        await waitId('foldTitle');
        await pressBack();
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_ABILITY_0600
     * @tc.name testNavigationAndLayoutOpenHsp0006
     * @tc.desc Verify navigation and layout open hsp behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutOpenHsp0006', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutOpenHsp0006', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardHsp');
        await waitId('hspTitle');
        await pressBack();
        await waitId('pageTitle');
        expect(await existsId('pageTitle')).assertTrue();
      }, done);
    });
  });
}
