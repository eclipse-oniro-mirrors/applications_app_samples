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
import { BreakpointUtils } from '../../../main/ets/utils/BreakpointUtils';
import { DeviceInfoUtils } from '../../../main/ets/utils/DeviceInfoUtils';
import { ListDataUtils } from '../../../main/ets/utils/ListDataUtils';
import { PrefetchDataSource } from '../../../main/ets/utils/ListDataSources';
import { PlaceholderController } from '../../../main/ets/utils/PlaceholderController';
import { PlaceholderRegistry } from '../../../main/ets/utils/PlaceholderRegistry';
import { PrefetchUtils } from '../../../main/ets/utils/PrefetchUtils';
import { runCase } from '../testkit/SharedDriver';

export default function logicTest() {
  describe('ListPerformanceLogicTest', () => {
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
     * @tc.number SUB_LISTPERF_LOGIC_0100
     * @tc.name testListPerformanceLogicRegistry0001
     * @tc.desc Verify logic registry behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceLogicRegistry0001', 0, async (done: Function) => {
      await runCase('testListPerformanceLogicRegistry0001', async () => {
        const registry = new PlaceholderRegistry(100);
        expect(registry.loadedCount()).assertEqual(0);
        registry.register(0);
        registry.register(99);
        registry.register(-1);
        registry.register(100);
        expect(registry.loadedCount()).assertEqual(2);
        expect(registry.isLoaded(0)).assertTrue();
        expect(registry.isLoaded(1)).assertFalse();
        registry.registerRange(10, 14);
        expect(registry.loadedCount()).assertEqual(6);
        registry.reset();
        expect(registry.loadedCount()).assertEqual(0);
        expect(registry.total()).assertEqual(100);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_LOGIC_0200
     * @tc.name testListPerformanceLogicBatch0002
     * @tc.desc Verify logic batch behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceLogicBatch0002', 0, async (done: Function) => {
      await runCase('testListPerformanceLogicBatch0002', async () => {
        expect(ListDataUtils.nextBatch(0, 200, 20)).assertEqual(20);
        expect(ListDataUtils.nextBatch(180, 200, 20)).assertEqual(200);
        expect(ListDataUtils.nextBatch(195, 200, 20)).assertEqual(200);
        expect(ListDataUtils.itemTitle(0)).assertEqual('Item 1');
        expect(ListDataUtils.formatPlaceholder(20, 200)).assertEqual('loaded=20/200');
        expect(ListDataUtils.formatPrefetch(3, 23, 200)).assertEqual('prefetched=3, loaded=23/200');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_LOGIC_0300
     * @tc.name testListPerformanceLogicBreakpoint0003
     * @tc.desc Verify logic breakpoint behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceLogicBreakpoint0003', 0, async (done: Function) => {
      await runCase('testListPerformanceLogicBreakpoint0003', async () => {
        expect(BreakpointUtils.gridTemplate(500)).assertEqual('1fr');
        expect(BreakpointUtils.gridTemplate(700)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.gridTemplate(1000)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.contentPadding(500)).assertEqual(16);
        expect(BreakpointUtils.contentPadding(1000)).assertEqual(32);
        expect(BreakpointUtils.cacheCount(500)).assertEqual(4);
        expect(BreakpointUtils.cacheCount(700)).assertEqual(6);
        expect(BreakpointUtils.cacheCount(1000)).assertEqual(8);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_LOGIC_0400
     * @tc.name testListPerformanceLogicDevice0004
     * @tc.desc Verify logic device behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceLogicDevice0004', 0, async (done: Function) => {
      await runCase('testListPerformanceLogicDevice0004', async () => {
        const screen = DeviceInfoUtils.screenInfo();
        expect(screen).assertContain('device=');
        expect(screen).assertContain('width=');
        expect(DeviceInfoUtils.deviceType().length > 0).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_LOGIC_0500
     * @tc.name testListPerformanceLogicController0005
     * @tc.desc Verify logic controller behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceLogicController0005', 0, async (done: Function) => {
      await runCase('testListPerformanceLogicController0005', async () => {
        const controller = new PlaceholderController(200);
        expect(controller.loadNext()).assertEqual('loaded=20/200');
        expect(controller.dataSource().getData(0).loaded).assertTrue();
        expect(controller.dataSource().getData(20).loaded).assertFalse();
        expect(controller.loadNext()).assertEqual('loaded=40/200');
        expect(controller.reset()).assertEqual('loaded=0/200');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_LOGIC_0600
     * @tc.name testListPerformanceLogicPrefetchUtils0006
     * @tc.desc Verify logic prefetch utils behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceLogicPrefetchUtils0006', 0, async (done: Function) => {
      await runCase('testListPerformanceLogicPrefetchUtils0006', async () => {
        expect(PrefetchUtils.nextIndices(0, 3, 200).join(',')).assertEqual('1,2,3');
        expect(PrefetchUtils.nextIndices(198, 3, 200).join(',')).assertEqual('199');
        expect(PrefetchUtils.nextIndices(199, 3, 200).length).assertEqual(0);
        expect(PrefetchUtils.nextIndices(0, 0, 200).length).assertEqual(0);
        expect(PrefetchUtils.nextIndices(0, -1, 200).length).assertEqual(0);
        expect(PrefetchUtils.formatWindow(0, 7, 3)).assertEqual('window=0-7, ahead=3');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_LOGIC_0700
     * @tc.name testListPerformanceLogicPrefetchSource0007
     * @tc.desc Verify logic prefetch source behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceLogicPrefetchSource0007', 0, async (done: Function) => {
      await runCase('testListPerformanceLogicPrefetchSource0007', async () => {
        const registry = new PlaceholderRegistry(100);
        let prefetched = 0;
        let loaded = 0;
        const source = new PrefetchDataSource(100, registry, (p: number, l: number, total: number) => {
          prefetched = p;
          loaded = l;
        });
        source.loadNext();
        expect(loaded).assertEqual(20);
        source.prefetch(20);
        expect(prefetched).assertEqual(1);
        expect(loaded).assertEqual(21);
        source.prefetch(20);
        expect(prefetched).assertEqual(1);
        source.prefetchNext();
        expect(prefetched).assertEqual(2);
        expect(loaded).assertEqual(22);
        source.clearStats();
        expect(prefetched).assertEqual(0);
        expect(loaded).assertEqual(22);
      }, done);
    });
    /**
     * @tc.number SUB_LISTPERF_BOUNDARY_0100
     * @tc.name testListPerfBoundary0008
     * @tc.desc Verify boundary values and fallback behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerfBoundary0008', 0, async (done: Function) => {
      await runCase('testListPerfBoundary0008', async () => {
              expect(ListDataUtils.nextBatch(-1, 200, 20)).assertEqual(0);
              expect(ListDataUtils.nextBatch(0, 0, 20)).assertEqual(0);
              expect(ListDataUtils.nextBatch(180, 200, 20)).assertEqual(200);
              expect(ListDataUtils.nextBatch(200, 200, 20)).assertEqual(200);
              expect(PrefetchUtils.nextIndices(0, 0, 200).length).assertEqual(0);
              expect(PrefetchUtils.nextIndices(199, 3, 200).length).assertEqual(0);
              expect(PrefetchUtils.nextIndices(198, 3, 200).join(',')).assertEqual('199');
              const registry = new PlaceholderRegistry(2);
              registry.register(-1);
              registry.register(2);
              registry.registerRange(0, 5);
              expect(registry.loadedCount()).assertEqual(2);
              expect(BreakpointUtils.contentMaxWidth(600)).assertEqual(560);
              expect(BreakpointUtils.contentMaxWidth(601)).assertEqual(720);
              expect(BreakpointUtils.pagePadding(600)).assertEqual(16);
              expect(BreakpointUtils.pagePadding(601)).assertEqual(24);
      }, done);
    });
        /**
     * @tc.number SUB_LISTPERF_LIMIT_0100
     * @tc.name testListPerfLimit0009
     * @tc.desc Verify additional boundary and empty-state behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerfLimit0009', 0, async (done: Function) => {
      await runCase('testListPerfLimit0009', async () => {
              const emptyRegistry = new PlaceholderRegistry(0);
              emptyRegistry.register(0);
              emptyRegistry.register(1);
              expect(emptyRegistry.loadedCount()).assertEqual(0);
              expect(emptyRegistry.total()).assertEqual(0);
              expect(PrefetchUtils.nextIndices(-5, 3, 200).length).assertEqual(0);
              expect(ListDataUtils.nextBatch(199, 200, 20)).assertEqual(200);
              expect(ListDataUtils.formatPlaceholder(0, 0)).assertEqual('loaded=0/0');
              expect(ListDataUtils.formatPrefetch(0, 0, 0)).assertEqual('prefetched=0, loaded=0/0');
      }, done);
    });
      });
}
