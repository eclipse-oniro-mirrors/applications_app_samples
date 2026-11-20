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
import { clickId, existsId, runCase, scrollToId, startApp, textOfId, waitId } from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.navigationandlayout';
const ABILITY_NAME: string = 'EntryAbility';

export default function foldTest() {
  describe('FoldSplitTest', () => {
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
     * @tc.number SUB_NAVIGATION_FOLDSPLIT_0100
     * @tc.name testNavigationAndLayoutFoldReal0001
     * @tc.desc Verify navigation and layout fold real behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutFoldReal0001', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutFoldReal0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardFold');
        await waitId('foldRealContainer');
        expect(await textOfId('foldStatusText')).assertContain('foldable=');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_FOLDSPLIT_0200
     * @tc.name testNavigationAndLayoutFoldSimFolded0002
     * @tc.desc Verify navigation and layout fold sim folded behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutFoldSimFolded0002', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutFoldSimFolded0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardFold');
        await clickId('simHover');
        await clickId('simFolded');
        expect(await textOfId('simModeText')).assertContain('folded');
        expect(await existsId('simPreview')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_FOLDSPLIT_0300
     * @tc.name testNavigationAndLayoutFoldSimHover0003
     * @tc.desc Verify navigation and layout fold sim hover behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutFoldSimHover0003', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutFoldSimHover0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardFold');
        await clickId('simHover');
        expect(await textOfId('simModeText')).assertContain('hover');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_FOLDSPLIT_0400
     * @tc.name testNavigationAndLayoutFoldSimExpanded0004
     * @tc.desc Verify navigation and layout fold sim expanded behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutFoldSimExpanded0004', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutFoldSimExpanded0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardFold');
        await clickId('simExpanded');
        expect(await textOfId('simModeText')).assertContain('expanded');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_FOLDSPLIT_0500
     * @tc.name testNavigationAndLayoutFoldConfig0005
     * @tc.desc Verify navigation and layout fold config behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutFoldConfig0005', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutFoldConfig0005', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardFold');
        await clickId('ratio3v2');
        await clickId('posBottom');
        await clickId('animToggle');
        expect(await textOfId('foldConfigText')).assertContain('3V2');
        expect(await textOfId('foldConfigText')).assertContain('BOTTOM');
        expect(await textOfId('foldConfigText')).assertContain('animation=true');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_FOLDSPLIT_0600
     * @tc.name testNavigationAndLayoutFoldRatioPosition0006
     * @tc.desc Verify navigation and layout fold ratio position behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutFoldRatioPosition0006', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutFoldRatioPosition0006', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardFold');
        await clickId('ratio1v1');
        await clickId('posTop');
        expect(await textOfId('foldConfigText')).assertContain('1V1');
        expect(await textOfId('foldConfigText')).assertContain('TOP');
      }, done);
    });

    /**
     * @tc.number SUB_NAVIGATION_FOLDSPLIT_0700
     * @tc.name testNavigationAndLayoutFoldAdvanced0007
     * @tc.desc Verify navigation and layout fold advanced behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testNavigationAndLayoutFoldAdvanced0007', 0, async (done: Function) => {
      await runCase('testNavigationAndLayoutFoldAdvanced0007', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardFold');
        await scrollToId('expPerp');
        await clickId('expPerp');
        await scrollToId('foldedRatio2v3');
        await clickId('foldedRatio2v3');
        await scrollToId('foldConfigText');
        const config = await textOfId('foldConfigText');
        expect(config).assertContain('perp=true');
        expect(config).assertContain('showExtra=true');
        expect(config).assertContain('foldedRatio=2V3');
        expect(await existsId('foldHoverDetail')).assertTrue();
      }, done);
    });
  });
}
