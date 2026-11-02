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
import { clickId, runCase, startApp, swipeOnId, textOfId, waitId, waitIdContains } from '../testkit/SharedDriver';

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

    /**
     * @tc.number SUB_LISTPERF_PREFETCHLIST_0400
     * @tc.name testListPerformancePrefetchScroll0004
     * @tc.desc Verify scrolling triggers automatic prefetch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformancePrefetchScroll0004', 0, async (done: Function) => {
      await runCase('testListPerformancePrefetchScroll0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPrefetch');
        await waitId('prefetchList');
        let status = await textOfId('prefetchStatus');
        for (let i = 0; i < 5 && status.includes('prefetched=0'); i++) {
          await swipeOnId('prefetchList');
          status = await textOfId('prefetchStatus');
        }
        expect(status.includes('prefetched=0')).assertFalse();
        expect(status.includes('loaded=20/')).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_PREFETCHLIST_0500
     * @tc.name testListPerformancePrefetchLoadIncrease0005
     * @tc.desc Verify scrolling increases the loaded row count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformancePrefetchLoadIncrease0005', 0, async (done: Function) => {
      await runCase('testListPerformancePrefetchLoadIncrease0005', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPrefetch');
        await waitId('prefetchList');
        let status = await textOfId('prefetchStatus');
        for (let i = 0; i < 5 && status.includes('loaded=20/'); i++) {
          await swipeOnId('prefetchList');
          status = await textOfId('prefetchStatus');
        }
        expect(status.includes('loaded=20/')).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_PREFETCHLIST_0600
     * @tc.name testListPerformancePrefetchClearAfterScroll0006
     * @tc.desc Verify clear stats resets prefetch count after scrolling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformancePrefetchClearAfterScroll0006', 0, async (done: Function) => {
      await runCase('testListPerformancePrefetchClearAfterScroll0006', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPrefetch');
        await waitId('prefetchList');
        let status = await textOfId('prefetchStatus');
        for (let i = 0; i < 5 && status.includes('prefetched=0'); i++) {
          await swipeOnId('prefetchList');
          status = await textOfId('prefetchStatus');
        }
        await clickId('prefetchClear');
        expect(await textOfId('prefetchStatus')).assertContain('prefetched=0');
        expect(await textOfId('prefetchStatus')).assertContain('loaded=');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_PREFETCHLIST_0700
     * @tc.name testListPerformancePrefetchRescroll0007
     * @tc.desc Verify scrolling after clear triggers prefetch again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformancePrefetchRescroll0007', 0, async (done: Function) => {
      await runCase('testListPerformancePrefetchRescroll0007', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPrefetch');
        await waitId('prefetchList');
        await swipeOnId('prefetchList');
        await clickId('prefetchClear');
        expect(await textOfId('prefetchStatus')).assertContain('prefetched=0');
        let status = await textOfId('prefetchStatus');
        for (let i = 0; i < 5 && status.includes('prefetched=0'); i++) {
          await swipeOnId('prefetchList');
          status = await textOfId('prefetchStatus');
        }
        expect(status.includes('prefetched=0')).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_PREFETCHLIST_0800
     * @tc.name testListPerformancePrefetchDeepScroll0008
     * @tc.desc Verify repeated scrolling keeps prefetch and load counters growing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformancePrefetchDeepScroll0008', 0, async (done: Function) => {
      await runCase('testListPerformancePrefetchDeepScroll0008', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPrefetch');
        await waitId('prefetchList');
        for (let i = 0; i < 3; i++) {
          await swipeOnId('prefetchList');
        }
        const status = await textOfId('prefetchStatus');
        expect(status.includes('prefetched=0')).assertFalse();
        expect(status.includes('loaded=20/')).assertFalse();
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_PREFETCHLIST_0900
     * @tc.name testListPerformancePrefetchReenter0009
     * @tc.desc Verify re-entering the page resets prefetch and load counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformancePrefetchReenter0009', 0, async (done: Function) => {
      await runCase('testListPerformancePrefetchReenter0009', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPrefetch');
        await waitId('prefetchList');
        await swipeOnId('prefetchList');
        await clickId('prefetchBack');
        await waitId('pageTitle');
        await clickId('cardPrefetch');
        await waitId('prefetchList');
        expect(await textOfId('prefetchStatus')).assertContain('prefetched=0');
        expect(await textOfId('prefetchStatus')).assertContain('loaded=20/');
      }, done);
    });

  });
}
