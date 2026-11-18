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
import { clickId, runCase, startApp, textOfId, waitId, waitIdContains } from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.treesortandrefresh';
const ABILITY_NAME: string = 'EntryAbility';

export default function refreshTest() {
  describe('SwipeRefreshTest', () => {
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
     * @tc.number SUB_TREESORT_SWIPEREFRESH_0100
     * @tc.name testTreeSortRefreshPage0001
     * @tc.desc Verify refresh page behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortRefreshPage0001', 0, async (done: Function) => {
      await runCase('testTreeSortRefreshPage0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardRefresh');
        await waitId('swipeRefresher');
        expect(await textOfId('refreshStatus')).assertContain('count=0, loading=false');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_SWIPEREFRESH_0200
     * @tc.name testTreeSortRefreshStart0002
     * @tc.desc Verify refresh start behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortRefreshStart0002', 0, async (done: Function) => {
      await runCase('testTreeSortRefreshStart0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardRefresh');
        await clickId('refreshStart');
        expect(await textOfId('refreshStatus')).assertContain('loading=true');
        await waitIdContains('refreshStatus', 'count=1, loading=false', 5000);
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_SWIPEREFRESH_0300
     * @tc.name testTreeSortRefreshStop0003
     * @tc.desc Verify refresh stop behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortRefreshStop0003', 0, async (done: Function) => {
      await runCase('testTreeSortRefreshStop0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardRefresh');
        await clickId('refreshStart');
        await clickId('refreshStop');
        expect(await textOfId('refreshStatus')).assertContain('count=0, loading=false');
      }, done);
    });
  });
}
