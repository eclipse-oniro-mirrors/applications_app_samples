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
import { clickAnyText, clickId, runCase, startApp, textOfId, waitId } from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.treesortandrefresh';
const ABILITY_NAME: string = 'EntryAbility';

export default function treeV2Test() {
  describe('TreeViewV2Test', () => {
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
     * @tc.number SUB_TREESORT_TREEVIEWV2_0100
     * @tc.name testTreeSortTreeV2Page0001
     * @tc.desc Verify tree v2 page behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortTreeV2Page0001', 0, async (done: Function) => {
      await runCase('testTreeSortTreeV2Page0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardTreeV2');
        await waitId('treeViewV2');
        expect(await textOfId('treeV2Status')).assertContain('ready');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_TREEVIEWV2_0200
     * @tc.name testTreeSortTreeV2Click0002
     * @tc.desc Verify tree v2 click behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortTreeV2Click0002', 0, async (done: Function) => {
      await runCase('testTreeSortTreeV2Click0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardTreeV2');
        expect(await clickAnyText(['Documents', '文档'])).assertTrue();
        expect(await textOfId('treeV2Status')).assertContain('node=0');
      }, done);
    });

    /**
     * @tc.number SUB_TREESORT_TREEVIEWV2_0300
     * @tc.name testTreeSortTreeV2Reset0003
     * @tc.desc Verify tree v2 reset behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testTreeSortTreeV2Reset0003', 0, async (done: Function) => {
      await runCase('testTreeSortTreeV2Reset0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardTreeV2');
        await clickAnyText(['Documents', '文档']);
        await clickId('treeV2Reset');
        expect(await textOfId('treeV2Status')).assertContain('ready');
      }, done);
    });
  });
}
