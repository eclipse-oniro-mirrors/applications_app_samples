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
import { clickId, existsId, runCase, startApp, textOfId, waitId, waitIdContains } from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.listperformance';
const ABILITY_NAME: string = 'EntryAbility';

export default function placeholderTest() {
  describe('PlaceholderListTest', () => {
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
     * @tc.number SUB_LISTPERF_PLACEHOLDERLIST_0100
     * @tc.name testListPerformancePlaceholderPage0001
     * @tc.desc Verify placeholder page behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformancePlaceholderPage0001', 0, async (done: Function) => {
      await runCase('testListPerformancePlaceholderPage0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPlaceholder');
        await waitId('placeholderList');
        await waitIdContains('placeholderStatus', 'loaded=20/200', 5000);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_PLACEHOLDERLIST_0200
     * @tc.name testListPerformancePlaceholderLoad0002
     * @tc.desc Verify placeholder load behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformancePlaceholderLoad0002', 0, async (done: Function) => {
      await runCase('testListPerformancePlaceholderLoad0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPlaceholder');
        await clickId('loadMore');
        await waitIdContains('placeholderStatus', 'loaded=40/200', 5000);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_PLACEHOLDERLIST_0300
     * @tc.name testListPerformancePlaceholderReset0003
     * @tc.desc Verify placeholder reset behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformancePlaceholderReset0003', 0, async (done: Function) => {
      await runCase('testListPerformancePlaceholderReset0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPlaceholder');
        await clickId('loadMore');
        await clickId('resetList');
        await waitIdContains('placeholderStatus', 'loaded=0/200', 5000);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_PLACEHOLDERLIST_0400
     * @tc.name testListPerformancePlaceholderScroll0004
     * @tc.desc Verify placeholder scroll behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformancePlaceholderScroll0004', 0, async (done: Function) => {
      await runCase('testListPerformancePlaceholderScroll0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPlaceholder');
        await waitId('placeholderList');
        expect(await existsId('placeholderList')).assertTrue();
      }, done);
    });
  });
}
