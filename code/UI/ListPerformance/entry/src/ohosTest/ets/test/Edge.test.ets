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
import { ListDataUtils } from '../../../main/ets/utils/ListDataUtils';
import { PlaceholderRegistry } from '../../../main/ets/utils/PlaceholderRegistry';
import { PrefetchUtils } from '../../../main/ets/utils/PrefetchUtils';
import {
  clickId,
  existsId,
  runCase,
  scrollToId,
  startApp,
  textOfId,
  waitText
} from '../testkit/SharedDriver';

const BUNDLE_NAME: string = 'com.samples.listperformance';
const ABILITY_NAME: string = 'EntryAbility';

export default function edgeTest() {
  describe('ListPerformanceEdgeTest', () => {
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
     * @tc.number SUB_LISTPERF_EDGE_0100
     * @tc.name testListPerformanceEdgeBatch0001
     * @tc.desc Verify zero, negative, and oversized batch boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceEdgeBatch0001', 0, async (done: Function) => {
      await runCase('testListPerformanceEdgeBatch0001', async () => {
        expect(ListDataUtils.nextBatch(0, 200, 0)).assertEqual(0);
        expect(ListDataUtils.nextBatch(0, 200, -5)).assertEqual(0);
        expect(ListDataUtils.nextBatch(-5, 200, 20)).assertEqual(0);
        expect(ListDataUtils.nextBatch(300, 200, 20)).assertEqual(200);
        expect(ListDataUtils.nextBatch(0, -1, 20)).assertEqual(0);
        expect(ListDataUtils.nextBatch(0, 0, 0)).assertEqual(0);
        expect(ListDataUtils.nextBatch(0, 1, 100)).assertEqual(1);
        expect(ListDataUtils.nextBatch(0, 200, 1000)).assertEqual(200);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_EDGE_0200
     * @tc.name testListPerformanceEdgeRegistry0002
     * @tc.desc Verify reversed, negative, and repeated registry ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceEdgeRegistry0002', 0, async (done: Function) => {
      await runCase('testListPerformanceEdgeRegistry0002', async () => {
        const registry = new PlaceholderRegistry(5);
        registry.registerRange(-2, 1);
        expect(registry.loadedCount()).assertEqual(1);
        registry.registerRange(3, 1);
        expect(registry.loadedCount()).assertEqual(1);
        registry.registerRange(0, 0);
        expect(registry.loadedCount()).assertEqual(1);
        registry.register(2);
        registry.register(2);
        expect(registry.loadedCount()).assertEqual(2);
        registry.registerRange(0, 5);
        expect(registry.loadedCount()).assertEqual(5);
        registry.registerRange(0, 99);
        expect(registry.loadedCount()).assertEqual(5);
        expect(registry.isLoaded(-1)).assertFalse();
        expect(registry.isLoaded(5)).assertFalse();
        registry.reset();
        registry.reset();
        expect(registry.loadedCount()).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_EDGE_0300
     * @tc.name testListPerformanceEdgePrefetch0003
     * @tc.desc Verify negative windows, empty sources, and window exhaustion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceEdgePrefetch0003', 0, async (done: Function) => {
      await runCase('testListPerformanceEdgePrefetch0003', async () => {
        expect(PrefetchUtils.nextIndices(-1, 1, 5).join(',')).assertEqual('0');
        expect(PrefetchUtils.nextIndices(-1, 3, 5).join(',')).assertEqual('0,1,2');
        expect(PrefetchUtils.nextIndices(3, 10, 5).join(',')).assertEqual('4');
        expect(PrefetchUtils.nextIndices(4, 1, 5).length).assertEqual(0);
        expect(PrefetchUtils.nextIndices(0, 1, 1).length).assertEqual(0);
        expect(PrefetchUtils.nextIndices(0, 1, 2).join(',')).assertEqual('1');
        expect(PrefetchUtils.nextIndices(2, 3, 3).length).assertEqual(0);
        expect(PrefetchUtils.nextIndices(0, 3, 0).length).assertEqual(0);
        expect(PrefetchUtils.nextIndices(0, 3, -1).length).assertEqual(0);
        expect(PrefetchUtils.formatWindow(-1, 0, 0)).assertEqual('window=-1-0, ahead=0');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_EDGE_0400
     * @tc.name testListPerformanceEdgeHistory0004
     * @tc.desc Verify placeholder list action history and its clear empty state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceEdgeHistory0004', 0, async (done: Function) => {
      await runCase('testListPerformanceEdgeHistory0004', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPlaceholder');
        await clickId('loadMore');
        expect(await textOfId('placeholderActionCount')).assertEqual('2');
        await scrollToId('placeholderClearHistory');
        await clickId('placeholderClearHistory');
        await waitText('No actions yet');
        expect(await existsId('placeholderHistory')).assertTrue();
      }, done);
    });
  });
}
