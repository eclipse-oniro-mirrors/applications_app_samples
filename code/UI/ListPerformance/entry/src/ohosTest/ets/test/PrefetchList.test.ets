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

const BUNDLE_NAME: string = 'com.samples.listperformance';
const ABILITY_NAME: string = 'EntryAbility';

export default function prefetchTest() {
  describe('PrefetchListTest', () => {
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
     * @tc.number SUB_LISTPERF_PREFETCHLIST_0100
     * @tc.name testListPerformancePrefetchPage0001
     * @tc.desc Verify prefetch page behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformancePrefetchPage0001', 0, async (done: Function) => {
      await runCase('testListPerformancePrefetchPage0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPrefetch');
        await waitId('prefetchList');
        await waitIdContains('prefetchStatus', 'prefetched=0', 5000);
        await waitIdContains('prefetchStatus', 'loaded=20/200', 5000);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_PREFETCHLIST_0200
     * @tc.name testListPerformancePrefetchNext0002
     * @tc.desc Verify prefetch next behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformancePrefetchNext0002', 0, async (done: Function) => {
      await runCase('testListPerformancePrefetchNext0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPrefetch');
        await clickId('prefetchNext');
        await waitIdContains('prefetchStatus', 'prefetched=1', 5000);
        expect(await textOfId('prefetchStatus')).assertContain('loaded=21/200');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_PREFETCHLIST_0300
     * @tc.name testListPerformancePrefetchClear0003
     * @tc.desc Verify prefetch clear behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformancePrefetchClear0003', 0, async (done: Function) => {
      await runCase('testListPerformancePrefetchClear0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPrefetch');
        await clickId('prefetchNext');
        await waitIdContains('prefetchStatus', 'prefetched=1', 5000);
        await clickId('prefetchClear');
        expect(await textOfId('prefetchStatus')).assertContain('prefetched=0');
      }, done);
    });
  });
}
