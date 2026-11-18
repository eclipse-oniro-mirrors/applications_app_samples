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
import { clickId, runCase, scrollToId, startApp, textOfId, waitId } from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.navigationandlayout';
const ABILITY_NAME: string = 'EntryAbility';

export default function stackApiTest() {
  describe('MultiNavigationStackApiTest', () => {
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
     * @tc.number SUB_NAVIGATION_MULTINAVIGATIONSTACK_0100
     * @tc.name testNavigationAndLayoutStackPushReplace0001
     * @tc.desc Verify navigation and layout stack push replace behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutStackPushReplace0001', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutStackPushReplace0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardStack');
        await waitId('stackTitle');
        await scrollToId('stackPushOptions');
        await clickId('stackPushOptions');
        expect(await textOfId('stackLog')).assertContain('pushPathOptions');
        await scrollToId('stackReplace');
        await clickId('stackReplace');
        expect(await textOfId('stackLog')).assertContain('replacePath size=');
        await scrollToId('stackReplaceOptions');
        await clickId('stackReplaceOptions');
        expect(await textOfId('stackLog')).assertContain('replacePathOptions');
        await scrollToId('stackReplaceByName');
        await clickId('stackReplaceByName');
        expect(await textOfId('stackLog')).assertContain('replacePathByName');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_MULTINAVIGATIONSTACK_0200
     * @tc.name testNavigationAndLayoutStackRemovePop0002
     * @tc.desc Verify navigation and layout stack remove pop behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutStackRemovePop0002', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutStackRemovePop0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardStack');
        await waitId('stackTitle');
        await scrollToId('stackRemoveIndexes');
        await clickId('stackRemoveIndexes');
        expect(await textOfId('stackLog')).assertContain('removeByIndexes=');
        await scrollToId('stackPopResult');
        await clickId('stackPopResult');
        expect(await textOfId('stackLog')).assertContain('popResult');
        await scrollToId('stackPopToName');
        await clickId('stackPopToName');
        expect(await textOfId('stackLog')).assertContain('popToName=');
        await scrollToId('stackPopToIndexResult');
        await clickId('stackPopToIndexResult');
        expect(await textOfId('stackLog')).assertContain('popToIndexResult');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_MULTINAVIGATIONSTACK_0300
     * @tc.name testNavigationAndLayoutStackQuery0003
     * @tc.desc Verify navigation and layout stack query behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutStackQuery0003', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutStackQuery0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardStack');
        await waitId('stackTitle');
        await scrollToId('stackQuery');
        await clickId('stackQuery');
        expect(await textOfId('stackLog')).assertContain('query size=');
        expect(await textOfId('stackLog')).assertContain('param=true');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_MULTINAVIGATIONSTACK_0400
     * @tc.name testNavigationAndLayoutStackAdjust0004
     * @tc.desc Verify navigation and layout stack adjust behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutStackAdjust0004', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutStackAdjust0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardStack');
        await waitId('stackTitle');
        await scrollToId('stackMoveIndexToTop');
        await clickId('stackMoveIndexToTop');
        expect(await textOfId('stackLog')).assertContain('moveIndexToTop');
        await scrollToId('stackClear');
        await clickId('stackClear');
        expect(await textOfId('stackLog')).assertContain('clear size=0');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_MULTINAVIGATIONSTACK_0500
     * @tc.name testNavigationAndLayoutStackLayout0005
     * @tc.desc Verify navigation and layout stack layout behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutStackLayout0005', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutStackLayout0005', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardStack');
        await waitId('stackTitle');
        await scrollToId('stackDisableAnimation');
        await clickId('stackDisableAnimation');
        expect(await textOfId('stackLog')).assertContain('disableAnimation');
        await scrollToId('stackFullScreen');
        await clickId('stackFullScreen');
        expect(await textOfId('stackLog')).assertContain('switchFullScreenState=');
        await scrollToId('stackHomeWidth');
        await clickId('stackHomeWidth');
        expect(await textOfId('stackLog')).assertContain('setHomeWidthRange');
        await scrollToId('stackPlaceholder');
        await clickId('stackPlaceholder');
        expect(await textOfId('stackLog')).assertContain('setPlaceholderPage');
        await scrollToId('stackKeepBottom');
        await clickId('stackKeepBottom');
        expect(await textOfId('stackLog')).assertContain('keepBottomPage');
      }, done);
    });
  });
}
