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

const BUNDLE_NAME: string = 'com.samples.treesortandrefresh';
const ABILITY_NAME: string = 'EntryAbility';

export default function abilityTest() {
  describe('TreeSortAbilityTest', () => {
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
     * @tc.number SUB_TREESORT_ABILITY_0100
     * @tc.name testTreeSortLaunch0001
     * @tc.desc Verify launch behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortLaunch0001', 0, async (done: Function) => {
      await runCase('testTreeSortLaunch0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await waitId('pageTitle');
        expect(await existsId('cardSpan')).assertTrue();
        expect(await existsId('cardTree')).assertTrue();
        expect(await existsId('cardTreeV2')).assertTrue();
        expect(await existsId('cardSort')).assertTrue();
        expect(await existsId('cardForm')).assertTrue();
        expect(await existsId('cardRefresh')).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_ABILITY_0200
     * @tc.name testTreeSortBreakpoint0002
     * @tc.desc Verify breakpoint behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortBreakpoint0002', 0, async (done: Function) => {
      await runCase('testTreeSortBreakpoint0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        expect(await textOfId('breakpointText')).assertContain('breakpoint=');
        expect(await textOfId('deviceInfoText')).assertContain('device=');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_ABILITY_0300
     * @tc.name testTreeSortOpenSpan0003
     * @tc.desc Verify open span behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortOpenSpan0003', 0, async (done: Function) => {
      await runCase('testTreeSortOpenSpan0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardSpan');
        await waitId('spanPageTitle');
        await clickId('spanBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_ABILITY_0400
     * @tc.name testTreeSortOpenTree0004
     * @tc.desc Verify open tree behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortOpenTree0004', 0, async (done: Function) => {
      await runCase('testTreeSortOpenTree0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardTree');
        await waitId('treePageTitle');
        await clickId('treeBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_ABILITY_0500
     * @tc.name testTreeSortOpenTreeV20005
     * @tc.desc Verify open tree v2 behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortOpenTreeV20005', 0, async (done: Function) => {
      await runCase('testTreeSortOpenTreeV20005', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardTreeV2');
        await waitId('treeV2PageTitle');
        await clickId('treeV2Back');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_ABILITY_0600
     * @tc.name testTreeSortOpenSort0006
     * @tc.desc Verify open sort behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortOpenSort0006', 0, async (done: Function) => {
      await runCase('testTreeSortOpenSort0006', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardSort');
        await waitId('sortPageTitle');
        await clickId('sortBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_ABILITY_0700
     * @tc.name testTreeSortOpenForm0007
     * @tc.desc Verify open form behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortOpenForm0007', 0, async (done: Function) => {
      await runCase('testTreeSortOpenForm0007', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardForm');
        await waitId('formPageTitle');
        await clickId('formBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_ABILITY_0800
     * @tc.name testTreeSortOpenRefresh0008
     * @tc.desc Verify open refresh behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortOpenRefresh0008', 0, async (done: Function) => {
      await runCase('testTreeSortOpenRefresh0008', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardRefresh');
        await waitId('refreshPageTitle');
        await clickId('refreshBack');
        await waitId('pageTitle');
      }, done);
    });
  });
}
