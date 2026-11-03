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
import { PlaceholderRegistry } from '../../../main/ets/utils/PlaceholderRegistry';
import { PrefetchUtils } from '../../../main/ets/utils/PrefetchUtils';
import {
  clickId,
  existsId,
  runCase,
  scrollToId,
  startApp,
  textOfId,
  waitText,
  waitId
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

    /**
     * @tc.number SUB_LISTPERF_MATRIX_0100
     * @tc.name testListPerformanceMatrixBatch0005
     * @tc.desc Verify single-item, exact-total, and oversized batch boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceMatrixBatch0005', 0, async (done: Function) => {
      await runCase('testListPerformanceMatrixBatch0005', async () => {
        expect(ListDataUtils.nextBatch(0, 10, 1)).assertEqual(1);
        expect(ListDataUtils.nextBatch(9, 10, 1)).assertEqual(10);
        expect(ListDataUtils.nextBatch(10, 10, 1)).assertEqual(10);
        expect(ListDataUtils.nextBatch(5, 10, 100)).assertEqual(10);
        expect(ListDataUtils.nextBatch(0, 0, 1)).assertEqual(0);
        expect(ListDataUtils.nextBatch(-1, 10, 1)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_MATRIX_0200
     * @tc.name testListPerformanceMatrixRegistry0006
     * @tc.desc Verify range loading and duplicate registration on a small registry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceMatrixRegistry0006', 0, async (done: Function) => {
      await runCase('testListPerformanceMatrixRegistry0006', async () => {
        const registry = new PlaceholderRegistry(3);
        registry.registerRange(1, 3);
        expect(registry.loadedCount()).assertEqual(2);
        registry.registerRange(0, 1);
        expect(registry.loadedCount()).assertEqual(3);
        registry.register(0);
        registry.register(2);
        expect(registry.loadedCount()).assertEqual(3);
        expect(registry.isLoaded(-1)).assertFalse();
        expect(registry.isLoaded(3)).assertFalse();
        registry.reset();
        expect(registry.loadedCount()).assertEqual(0);
        expect(registry.total()).assertEqual(3);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_MATRIX_0300
     * @tc.name testListPerformanceMatrixPrefetch0007
     * @tc.desc Verify prefetch windows at the start, middle, and end of a list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceMatrixPrefetch0007', 0, async (done: Function) => {
      await runCase('testListPerformanceMatrixPrefetch0007', async () => {
        expect(PrefetchUtils.nextIndices(0, 5, 10).join(',')).assertEqual('1,2,3,4,5');
        expect(PrefetchUtils.nextIndices(5, 5, 10).join(',')).assertEqual('6,7,8,9');
        expect(PrefetchUtils.nextIndices(9, 5, 10).length).assertEqual(0);
        expect(PrefetchUtils.nextIndices(0, 1, 0).length).assertEqual(0);
        expect(PrefetchUtils.nextIndices(-2, 1, 5).length).assertEqual(0);
        expect(PrefetchUtils.formatWindow(5, 9, 4)).assertEqual('window=5-9, ahead=4');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_MATRIX_0400
     * @tc.name testListPerformanceMatrixFormat0008
     * @tc.desc Verify titles, subtitles, and placeholder summaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceMatrixFormat0008', 0, async (done: Function) => {
      await runCase('testListPerformanceMatrixFormat0008', async () => {
        expect(ListDataUtils.itemTitle(0)).assertEqual('Item 1');
        expect(ListDataUtils.itemTitle(9)).assertEqual('Item 10');
        expect(ListDataUtils.itemSubtitle(0)).assertEqual('Row 1 of long list');
        expect(ListDataUtils.formatPlaceholder(0, 200)).assertEqual('loaded=0/200');
        expect(ListDataUtils.formatPrefetch(3, 20, 200)).assertEqual('prefetched=3, loaded=20/200');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERF_MATRIX_0500
     * @tc.name testListPerformanceMatrixBatchLimits0009
     * @tc.desc Verify zero batch, exact total, and formatted window values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceMatrixBatchLimits0009', 0, async (done: Function) => {
      await runCase('testListPerformanceMatrixBatchLimits0009', async () => {
        expect(ListDataUtils.nextBatch(5, 5, 5)).assertEqual(5);
        expect(ListDataUtils.nextBatch(5, 10, 0)).assertEqual(0);
        expect(ListDataUtils.nextBatch(5, 10, -1)).assertEqual(0);
        expect(ListDataUtils.formatPlaceholder(5, 5)).assertEqual('loaded=5/5');
        expect(ListDataUtils.formatPrefetch(0, 0, 0)).assertEqual('prefetched=0, loaded=0/0');
      }, done);
    });


    /**
     * @tc.number SUB_LISTPERFORMANCE_MATRIX_0600
     * @tc.name testListPerformanceMatrixBreakpointBounds0012
     * @tc.desc Verify resolve, width helpers, padding, and grid at breakpoint boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceMatrixBreakpointBounds0012', 0, async (done: Function) => {
      await runCase('testListPerformanceMatrixBreakpointBounds0012', async () => {
        expect(BreakpointUtils.resolve(0)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(599)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(600)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.resolve(601)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.resolve(840)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.resolve(841)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(600)).assertEqual(560);
        expect(BreakpointUtils.contentMaxWidth(601)).assertEqual(720);
        expect(BreakpointUtils.contentMaxWidth(841)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(600)).assertEqual(16);
        expect(BreakpointUtils.pagePadding(601)).assertEqual(24);
        expect(BreakpointUtils.pagePadding(841)).assertEqual(32);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_MATRIX_0700
     * @tc.name testListPerformanceMatrixGridBounds0013
     * @tc.desc Verify grid template, column count, and wide flag boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceMatrixGridBounds0013', 0, async (done: Function) => {
      await runCase('testListPerformanceMatrixGridBounds0013', async () => {
        expect(BreakpointUtils.gridTemplate(600)).assertEqual('1fr');
        expect(BreakpointUtils.gridTemplate(601)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.gridTemplate(841)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.columnCount(600)).assertEqual(1);
        expect(BreakpointUtils.columnCount(601)).assertEqual(2);
        expect(BreakpointUtils.columnCount(841)).assertEqual(3);
        expect(BreakpointUtils.isWide(600)).assertFalse();
        expect(BreakpointUtils.isWide(601)).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_MATRIX_0800
     * @tc.name testListPerformanceMatrixDescribe0014
     * @tc.desc Verify breakpoint descriptions at zero and exact boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceMatrixDescribe0014', 0, async (done: Function) => {
      await runCase('testListPerformanceMatrixDescribe0014', async () => {
        expect(BreakpointUtils.describe(0)).assertEqual('width=0vp, breakpoint=sm');
        expect(BreakpointUtils.describe(600)).assertEqual('width=600vp, breakpoint=sm');
        expect(BreakpointUtils.describe(601)).assertEqual('width=601vp, breakpoint=md');
        expect(BreakpointUtils.describe(840)).assertEqual('width=840vp, breakpoint=md');
        expect(BreakpointUtils.describe(841)).assertEqual('width=841vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_MATRIX_0900
     * @tc.name testListPerformanceMatrixDeviceInfo0015
     * @tc.desc Verify device screen information exposes every expected field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceMatrixDeviceInfo0015', 0, async (done: Function) => {
      await runCase('testListPerformanceMatrixDeviceInfo0015', async () => {
        const screen = DeviceInfoUtils.screenInfo();
        expect(screen).assertContain('device=');
        expect(screen).assertContain('width=');
        expect(screen).assertContain('height=');
        expect(screen).assertContain('density=');
        expect(screen).assertContain('orientation=');
        expect(DeviceInfoUtils.deviceType().length > 0).assertTrue();
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_MATRIX_1000
     * @tc.name testListPerformanceMatrixCustom0016
     * @tc.desc Verify additional project-specific boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceMatrixCustom0016', 0, async (done: Function) => {
      await runCase('testListPerformanceMatrixCustom0016', async () => {
        expect(BreakpointUtils.cacheCount(500)).assertEqual(4);
        expect(BreakpointUtils.cacheCount(700)).assertEqual(6);
        expect(BreakpointUtils.cacheCount(1000)).assertEqual(8);
      }, done);
    });


    /**
     * @tc.number SUB_LISTPERFORMANCE_EXTRA_1100
     * @tc.name testListPerformanceExtraBatchA0020
     * @tc.desc Verify batch calculation covers small and full totals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceExtraBatchA0020', 0, async (done: Function) => {
      await runCase('testListPerformanceExtraBatchA0020', async () => {
        expect(ListDataUtils.nextBatch(0, 5, 2)).assertEqual(2);
        expect(ListDataUtils.nextBatch(2, 5, 2)).assertEqual(4);
        expect(ListDataUtils.nextBatch(4, 5, 2)).assertEqual(5);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_EXTRA_1200
     * @tc.name testListPerformanceExtraBatchB0021
     * @tc.desc Verify batch calculation handles zero and negative inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceExtraBatchB0021', 0, async (done: Function) => {
      await runCase('testListPerformanceExtraBatchB0021', async () => {
        expect(ListDataUtils.nextBatch(-1, 5, 2)).assertEqual(0);
        expect(ListDataUtils.nextBatch(0, 0, 2)).assertEqual(0);
        expect(ListDataUtils.nextBatch(0, 5, 0)).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_EXTRA_1300
     * @tc.name testListPerformanceExtraRegistryA0022
     * @tc.desc Verify registry loads single indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceExtraRegistryA0022', 0, async (done: Function) => {
      await runCase('testListPerformanceExtraRegistryA0022', async () => {
        const registry = new PlaceholderRegistry(2);
        registry.register(0);
        expect(registry.isLoaded(0)).assertTrue();
        expect(registry.isLoaded(1)).assertFalse();
        expect(registry.loadedCount()).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_EXTRA_1400
     * @tc.name testListPerformanceExtraRegistryB0023
     * @tc.desc Verify registry reset clears every flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceExtraRegistryB0023', 0, async (done: Function) => {
      await runCase('testListPerformanceExtraRegistryB0023', async () => {
        const registry = new PlaceholderRegistry(2);
        registry.registerRange(0, 2);
        expect(registry.loadedCount()).assertEqual(2);
        registry.reset();
        expect(registry.loadedCount()).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_EXTRA_1500
     * @tc.name testListPerformanceExtraPrefetchA0024
     * @tc.desc Verify prefetch window stops at the list end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceExtraPrefetchA0024', 0, async (done: Function) => {
      await runCase('testListPerformanceExtraPrefetchA0024', async () => {
        expect(PrefetchUtils.nextIndices(7, 5, 10).join(',')).assertEqual('8,9');
        expect(PrefetchUtils.nextIndices(9, 5, 10).length).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_EXTRA_1600
     * @tc.name testListPerformanceExtraPrefetchB0025
     * @tc.desc Verify prefetch window ignores empty lists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceExtraPrefetchB0025', 0, async (done: Function) => {
      await runCase('testListPerformanceExtraPrefetchB0025', async () => {
        expect(PrefetchUtils.nextIndices(0, 5, 0).length).assertEqual(0);
        expect(PrefetchUtils.nextIndices(0, 5, -1).length).assertEqual(0);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_EXTRA_1700
     * @tc.name testListPerformanceExtraFormatA0026
     * @tc.desc Verify placeholder formatting keeps loaded and total
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceExtraFormatA0026', 0, async (done: Function) => {
      await runCase('testListPerformanceExtraFormatA0026', async () => {
        expect(ListDataUtils.formatPlaceholder(0, 100)).assertEqual('loaded=0/100');
        expect(ListDataUtils.formatPlaceholder(100, 100)).assertEqual('loaded=100/100');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_EXTRA_1800
     * @tc.name testListPerformanceExtraFormatB0027
     * @tc.desc Verify prefetch formatting keeps all counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceExtraFormatB0027', 0, async (done: Function) => {
      await runCase('testListPerformanceExtraFormatB0027', async () => {
        expect(ListDataUtils.formatPrefetch(0, 0, 100)).assertEqual('prefetched=0, loaded=0/100');
        expect(ListDataUtils.formatPrefetch(5, 25, 100)).assertEqual('prefetched=5, loaded=25/100');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_EXTRA_1900
     * @tc.name testListPerformanceExtraTitle0028
     * @tc.desc Verify row titles use one-based indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceExtraTitle0028', 0, async (done: Function) => {
      await runCase('testListPerformanceExtraTitle0028', async () => {
        expect(ListDataUtils.itemTitle(0)).assertEqual('Item 1');
        expect(ListDataUtils.itemTitle(4)).assertEqual('Item 5');
        expect(ListDataUtils.itemSubtitle(0)).assertEqual('Row 1 of long list');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_EXTRA_2000
     * @tc.name testListPerformanceExtraWindow0029
     * @tc.desc Verify window formatting keeps ranges and counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceExtraWindow0029', 0, async (done: Function) => {
      await runCase('testListPerformanceExtraWindow0029', async () => {
        expect(PrefetchUtils.formatWindow(0, 4, 2)).assertEqual('window=0-4, ahead=2');
        expect(PrefetchUtils.formatWindow(7, 9, 1)).assertEqual('window=7-9, ahead=1');
      }, done);
    });


    /**
     * @tc.number SUB_LISTPERFORMANCE_DEEP_1100
     * @tc.name testListPerformanceDeepBatchA0030
     * @tc.desc Verify zero loaded starts a batch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceDeepBatchA0030', 0, async (done: Function) => {
      await runCase('testListPerformanceDeepBatchA0030', async () => {
        expect(ListDataUtils.nextBatch(0, 10, 20)).assertEqual(10);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_DEEP_1200
     * @tc.name testListPerformanceDeepBatchB0031
     * @tc.desc Verify loaded at total returns total
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceDeepBatchB0031', 0, async (done: Function) => {
      await runCase('testListPerformanceDeepBatchB0031', async () => {
        expect(ListDataUtils.nextBatch(10, 10, 20)).assertEqual(10);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_DEEP_1300
     * @tc.name testListPerformanceDeepRegistryA0032
     * @tc.desc Verify single registration counts once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceDeepRegistryA0032', 0, async (done: Function) => {
      await runCase('testListPerformanceDeepRegistryA0032', async () => {
        const registry = new PlaceholderRegistry(2);
        registry.register(1);
        expect(registry.loadedCount()).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_DEEP_1400
     * @tc.name testListPerformanceDeepRegistryB0033
     * @tc.desc Verify duplicate registration is idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceDeepRegistryB0033', 0, async (done: Function) => {
      await runCase('testListPerformanceDeepRegistryB0033', async () => {
        const registry = new PlaceholderRegistry(2);
        registry.register(1);
        registry.register(1);
        expect(registry.loadedCount()).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_DEEP_1500
     * @tc.name testListPerformanceDeepPrefetchA0034
     * @tc.desc Verify prefetch starts after current index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceDeepPrefetchA0034', 0, async (done: Function) => {
      await runCase('testListPerformanceDeepPrefetchA0034', async () => {
        expect(PrefetchUtils.nextIndices(0, 2, 5).join(',')).assertEqual('1,2');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_DEEP_1600
     * @tc.name testListPerformanceDeepPrefetchB0035
     * @tc.desc Verify prefetch stops at total
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceDeepPrefetchB0035', 0, async (done: Function) => {
      await runCase('testListPerformanceDeepPrefetchB0035', async () => {
        expect(PrefetchUtils.nextIndices(3, 5, 5).join(',')).assertEqual('4');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_DEEP_1700
     * @tc.name testListPerformanceDeepFormatA0036
     * @tc.desc Verify placeholder format keeps zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceDeepFormatA0036', 0, async (done: Function) => {
      await runCase('testListPerformanceDeepFormatA0036', async () => {
        expect(ListDataUtils.formatPlaceholder(0, 1)).assertEqual('loaded=0/1');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_DEEP_1800
     * @tc.name testListPerformanceDeepFormatB0037
     * @tc.desc Verify prefetch format keeps zero loaded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceDeepFormatB0037', 0, async (done: Function) => {
      await runCase('testListPerformanceDeepFormatB0037', async () => {
        expect(ListDataUtils.formatPrefetch(1, 0, 1)).assertEqual('prefetched=1, loaded=0/1');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_DEEP_1900
     * @tc.name testListPerformanceDeepTitleA0038
     * @tc.desc Verify item title uses one-based index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceDeepTitleA0038', 0, async (done: Function) => {
      await runCase('testListPerformanceDeepTitleA0038', async () => {
        expect(ListDataUtils.itemTitle(1)).assertEqual('Item 2');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_DEEP_2000
     * @tc.name testListPerformanceDeepWindowA0039
     * @tc.desc Verify window text keeps counts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceDeepWindowA0039', 0, async (done: Function) => {
      await runCase('testListPerformanceDeepWindowA0039', async () => {
        expect(PrefetchUtils.formatWindow(1, 2, 3)).assertEqual('window=1-2, ahead=3');
      }, done);
    });


    /**
     * @tc.number SUB_LISTPERFORMANCE_FINAL_1100
     * @tc.name testListPerformanceFinalA0040
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceFinalA0040', 0, async (done: Function) => {
      await runCase('testListPerformanceFinalA0040', async () => {
        expect(ListDataUtils.nextBatch(0, 10, 20)).assertEqual(10);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_FINAL_1200
     * @tc.name testListPerformanceFinalB0041
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceFinalB0041', 0, async (done: Function) => {
      await runCase('testListPerformanceFinalB0041', async () => {
        expect(ListDataUtils.nextBatch(10, 10, 20)).assertEqual(10);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_FINAL_1300
     * @tc.name testListPerformanceFinalC0042
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceFinalC0042', 0, async (done: Function) => {
      await runCase('testListPerformanceFinalC0042', async () => {
        const registry = new PlaceholderRegistry(2);
        registry.register(1);
        expect(registry.loadedCount()).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_FINAL_1400
     * @tc.name testListPerformanceFinalD0043
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceFinalD0043', 0, async (done: Function) => {
      await runCase('testListPerformanceFinalD0043', async () => {
        const registry = new PlaceholderRegistry(2);
        registry.register(1);
        registry.register(1);
        expect(registry.loadedCount()).assertEqual(1);
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_FINAL_1500
     * @tc.name testListPerformanceFinalE0044
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceFinalE0044', 0, async (done: Function) => {
      await runCase('testListPerformanceFinalE0044', async () => {
        expect(PrefetchUtils.nextIndices(0, 2, 5).join(',')).assertEqual('1,2');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_FINAL_1600
     * @tc.name testListPerformanceFinalF0045
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceFinalF0045', 0, async (done: Function) => {
      await runCase('testListPerformanceFinalF0045', async () => {
        expect(PrefetchUtils.nextIndices(3, 5, 5).join(',')).assertEqual('4');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_FINAL_1700
     * @tc.name testListPerformanceFinalG0046
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceFinalG0046', 0, async (done: Function) => {
      await runCase('testListPerformanceFinalG0046', async () => {
        expect(ListDataUtils.formatPlaceholder(0, 1)).assertEqual('loaded=0/1');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_FINAL_1800
     * @tc.name testListPerformanceFinalH0047
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceFinalH0047', 0, async (done: Function) => {
      await runCase('testListPerformanceFinalH0047', async () => {
        expect(ListDataUtils.formatPrefetch(1, 0, 1)).assertEqual('prefetched=1, loaded=0/1');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_FINAL_1900
     * @tc.name testListPerformanceFinalI0048
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceFinalI0048', 0, async (done: Function) => {
      await runCase('testListPerformanceFinalI0048', async () => {
        expect(ListDataUtils.itemTitle(1)).assertEqual('Item 2');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_FINAL_2000
     * @tc.name testListPerformanceFinalJ0049
     * @tc.desc Verify final matrix boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceFinalJ0049', 0, async (done: Function) => {
      await runCase('testListPerformanceFinalJ0049', async () => {
        expect(PrefetchUtils.formatWindow(1, 2, 3)).assertEqual('window=1-2, ahead=3');
      }, done);
    });


    /**
     * @tc.number SUB_LISTPERFORMANCE_WIDTH_0100
     * @tc.name testListPerformanceWidth0001
     * @tc.desc Verify breakpoint helpers at width -100vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceWidth0001', 0, async (done: Function) => {
      await runCase('testListPerformanceWidth0001', async () => {
        expect(BreakpointUtils.resolve(-100)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(-100)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(-100)).assertEqual(16);
        expect(BreakpointUtils.columnCount(-100)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(-100)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(-100)).assertFalse();
        expect(BreakpointUtils.describe(-100)).assertEqual('width=-100vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_WIDTH_0200
     * @tc.name testListPerformanceWidth0002
     * @tc.desc Verify breakpoint helpers at width 0vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceWidth0002', 0, async (done: Function) => {
      await runCase('testListPerformanceWidth0002', async () => {
        expect(BreakpointUtils.resolve(0)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(0)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(0)).assertEqual(16);
        expect(BreakpointUtils.columnCount(0)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(0)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(0)).assertFalse();
        expect(BreakpointUtils.describe(0)).assertEqual('width=0vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_WIDTH_0300
     * @tc.name testListPerformanceWidth0003
     * @tc.desc Verify breakpoint helpers at width 1vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceWidth0003', 0, async (done: Function) => {
      await runCase('testListPerformanceWidth0003', async () => {
        expect(BreakpointUtils.resolve(1)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(1)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(1)).assertEqual(16);
        expect(BreakpointUtils.columnCount(1)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(1)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(1)).assertFalse();
        expect(BreakpointUtils.describe(1)).assertEqual('width=1vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_WIDTH_0400
     * @tc.name testListPerformanceWidth0004
     * @tc.desc Verify breakpoint helpers at width 320vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceWidth0004', 0, async (done: Function) => {
      await runCase('testListPerformanceWidth0004', async () => {
        expect(BreakpointUtils.resolve(320)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(320)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(320)).assertEqual(16);
        expect(BreakpointUtils.columnCount(320)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(320)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(320)).assertFalse();
        expect(BreakpointUtils.describe(320)).assertEqual('width=320vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_WIDTH_0500
     * @tc.name testListPerformanceWidth0005
     * @tc.desc Verify breakpoint helpers at width 599vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceWidth0005', 0, async (done: Function) => {
      await runCase('testListPerformanceWidth0005', async () => {
        expect(BreakpointUtils.resolve(599)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(599)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(599)).assertEqual(16);
        expect(BreakpointUtils.columnCount(599)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(599)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(599)).assertFalse();
        expect(BreakpointUtils.describe(599)).assertEqual('width=599vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_WIDTH_0600
     * @tc.name testListPerformanceWidth0006
     * @tc.desc Verify breakpoint helpers at width 600vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceWidth0006', 0, async (done: Function) => {
      await runCase('testListPerformanceWidth0006', async () => {
        expect(BreakpointUtils.resolve(600)).assertEqual(BreakpointUtils.SM);
        expect(BreakpointUtils.contentMaxWidth(600)).assertEqual(560);
        expect(BreakpointUtils.pagePadding(600)).assertEqual(16);
        expect(BreakpointUtils.columnCount(600)).assertEqual(1);
        expect(BreakpointUtils.gridTemplate(600)).assertEqual('1fr');
        expect(BreakpointUtils.isWide(600)).assertFalse();
        expect(BreakpointUtils.describe(600)).assertEqual('width=600vp, breakpoint=sm');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_WIDTH_0700
     * @tc.name testListPerformanceWidth0007
     * @tc.desc Verify breakpoint helpers at width 601vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceWidth0007', 0, async (done: Function) => {
      await runCase('testListPerformanceWidth0007', async () => {
        expect(BreakpointUtils.resolve(601)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.contentMaxWidth(601)).assertEqual(720);
        expect(BreakpointUtils.pagePadding(601)).assertEqual(24);
        expect(BreakpointUtils.columnCount(601)).assertEqual(2);
        expect(BreakpointUtils.gridTemplate(601)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.isWide(601)).assertTrue();
        expect(BreakpointUtils.describe(601)).assertEqual('width=601vp, breakpoint=md');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_WIDTH_0800
     * @tc.name testListPerformanceWidth0008
     * @tc.desc Verify breakpoint helpers at width 700vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceWidth0008', 0, async (done: Function) => {
      await runCase('testListPerformanceWidth0008', async () => {
        expect(BreakpointUtils.resolve(700)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.contentMaxWidth(700)).assertEqual(720);
        expect(BreakpointUtils.pagePadding(700)).assertEqual(24);
        expect(BreakpointUtils.columnCount(700)).assertEqual(2);
        expect(BreakpointUtils.gridTemplate(700)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.isWide(700)).assertTrue();
        expect(BreakpointUtils.describe(700)).assertEqual('width=700vp, breakpoint=md');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_WIDTH_0900
     * @tc.name testListPerformanceWidth0009
     * @tc.desc Verify breakpoint helpers at width 839vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceWidth0009', 0, async (done: Function) => {
      await runCase('testListPerformanceWidth0009', async () => {
        expect(BreakpointUtils.resolve(839)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.contentMaxWidth(839)).assertEqual(720);
        expect(BreakpointUtils.pagePadding(839)).assertEqual(24);
        expect(BreakpointUtils.columnCount(839)).assertEqual(2);
        expect(BreakpointUtils.gridTemplate(839)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.isWide(839)).assertTrue();
        expect(BreakpointUtils.describe(839)).assertEqual('width=839vp, breakpoint=md');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_WIDTH_1000
     * @tc.name testListPerformanceWidth0010
     * @tc.desc Verify breakpoint helpers at width 840vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceWidth0010', 0, async (done: Function) => {
      await runCase('testListPerformanceWidth0010', async () => {
        expect(BreakpointUtils.resolve(840)).assertEqual(BreakpointUtils.MD);
        expect(BreakpointUtils.contentMaxWidth(840)).assertEqual(720);
        expect(BreakpointUtils.pagePadding(840)).assertEqual(24);
        expect(BreakpointUtils.columnCount(840)).assertEqual(2);
        expect(BreakpointUtils.gridTemplate(840)).assertEqual('1fr 1fr');
        expect(BreakpointUtils.isWide(840)).assertTrue();
        expect(BreakpointUtils.describe(840)).assertEqual('width=840vp, breakpoint=md');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_WIDTH_1100
     * @tc.name testListPerformanceWidth0011
     * @tc.desc Verify breakpoint helpers at width 841vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceWidth0011', 0, async (done: Function) => {
      await runCase('testListPerformanceWidth0011', async () => {
        expect(BreakpointUtils.resolve(841)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(841)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(841)).assertEqual(32);
        expect(BreakpointUtils.columnCount(841)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(841)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(841)).assertTrue();
        expect(BreakpointUtils.describe(841)).assertEqual('width=841vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_WIDTH_1200
     * @tc.name testListPerformanceWidth0012
     * @tc.desc Verify breakpoint helpers at width 900vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceWidth0012', 0, async (done: Function) => {
      await runCase('testListPerformanceWidth0012', async () => {
        expect(BreakpointUtils.resolve(900)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(900)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(900)).assertEqual(32);
        expect(BreakpointUtils.columnCount(900)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(900)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(900)).assertTrue();
        expect(BreakpointUtils.describe(900)).assertEqual('width=900vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_WIDTH_1300
     * @tc.name testListPerformanceWidth0013
     * @tc.desc Verify breakpoint helpers at width 1000vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceWidth0013', 0, async (done: Function) => {
      await runCase('testListPerformanceWidth0013', async () => {
        expect(BreakpointUtils.resolve(1000)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(1000)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(1000)).assertEqual(32);
        expect(BreakpointUtils.columnCount(1000)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(1000)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(1000)).assertTrue();
        expect(BreakpointUtils.describe(1000)).assertEqual('width=1000vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_WIDTH_1400
     * @tc.name testListPerformanceWidth0014
     * @tc.desc Verify breakpoint helpers at width 1200vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceWidth0014', 0, async (done: Function) => {
      await runCase('testListPerformanceWidth0014', async () => {
        expect(BreakpointUtils.resolve(1200)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(1200)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(1200)).assertEqual(32);
        expect(BreakpointUtils.columnCount(1200)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(1200)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(1200)).assertTrue();
        expect(BreakpointUtils.describe(1200)).assertEqual('width=1200vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_WIDTH_1500
     * @tc.name testListPerformanceWidth0015
     * @tc.desc Verify breakpoint helpers at width 1440vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceWidth0015', 0, async (done: Function) => {
      await runCase('testListPerformanceWidth0015', async () => {
        expect(BreakpointUtils.resolve(1440)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(1440)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(1440)).assertEqual(32);
        expect(BreakpointUtils.columnCount(1440)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(1440)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(1440)).assertTrue();
        expect(BreakpointUtils.describe(1440)).assertEqual('width=1440vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_WIDTH_1600
     * @tc.name testListPerformanceWidth0016
     * @tc.desc Verify breakpoint helpers at width 1920vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceWidth0016', 0, async (done: Function) => {
      await runCase('testListPerformanceWidth0016', async () => {
        expect(BreakpointUtils.resolve(1920)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(1920)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(1920)).assertEqual(32);
        expect(BreakpointUtils.columnCount(1920)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(1920)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(1920)).assertTrue();
        expect(BreakpointUtils.describe(1920)).assertEqual('width=1920vp, breakpoint=lg');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_WIDTH_1700
     * @tc.name testListPerformanceWidth0017
     * @tc.desc Verify breakpoint helpers at width 2000vp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceWidth0017', 0, async (done: Function) => {
      await runCase('testListPerformanceWidth0017', async () => {
        expect(BreakpointUtils.resolve(2000)).assertEqual(BreakpointUtils.LG);
        expect(BreakpointUtils.contentMaxWidth(2000)).assertEqual(960);
        expect(BreakpointUtils.pagePadding(2000)).assertEqual(32);
        expect(BreakpointUtils.columnCount(2000)).assertEqual(3);
        expect(BreakpointUtils.gridTemplate(2000)).assertEqual('1fr 1fr 1fr');
        expect(BreakpointUtils.isWide(2000)).assertTrue();
        expect(BreakpointUtils.describe(2000)).assertEqual('width=2000vp, breakpoint=lg');
      }, done);
    });


    /**
     * @tc.number SUB_LISTPERFORMANCE_REAL_0100
     * @tc.name testListPerformanceRealPlaceholderBack0001
     * @tc.desc Verify page opens and returns through its back button
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceRealPlaceholderBack0001', 0, async (done: Function) => {
      await runCase('testListPerformanceRealPlaceholderBack0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPlaceholder');
        await waitId('placeholderPageTitle');
        await clickId('placeholderBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_REAL_0200
     * @tc.name testListPerformanceRealPrefetchBack0002
     * @tc.desc Verify page opens and returns through its back button
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceRealPrefetchBack0002', 0, async (done: Function) => {
      await runCase('testListPerformanceRealPrefetchBack0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPrefetch');
        await waitId('prefetchPageTitle');
        await clickId('prefetchBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_REAL_0300
     * @tc.name testListPerformanceRealLoadSequence0003
     * @tc.desc Verify two load-more actions followed by reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceRealLoadSequence0003', 0, async (done: Function) => {
      await runCase('testListPerformanceRealLoadSequence0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPlaceholder');
        await clickId('loadMore');
        await clickId('loadMore');
        expect(await textOfId('placeholderStatus')).assertContain('60/');
        await clickId('resetList');
        expect(await textOfId('placeholderStatus')).assertContain('0/');
      }, done);
    });


    /**
     * @tc.number SUB_LISTPERFORMANCE_SCENE_0100
     * @tc.name testListPerformanceSceneLoadReset0001
     * @tc.desc Verify two load-more actions and reset restore the empty state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceSceneLoadReset0001', 0, async (done: Function) => {
      await runCase('testListPerformanceSceneLoadReset0001', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPlaceholder');
        await clickId('loadMore');
        await clickId('loadMore');
        expect(await textOfId('placeholderStatus')).assertContain('60/');
        await clickId('resetList');
        expect(await textOfId('placeholderStatus')).assertContain('0/');
        await clickId('placeholderBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_SCENE_0200
     * @tc.name testListPerformanceScenePrefetchClear0002
     * @tc.desc Verify prefetch next and clear stats restore the counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceScenePrefetchClear0002', 0, async (done: Function) => {
      await runCase('testListPerformanceScenePrefetchClear0002', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPrefetch');
        await clickId('prefetchNext');
        expect(await textOfId('prefetchStatus')).assertContain('prefetched=1');
        await clickId('prefetchClear');
        expect(await textOfId('prefetchStatus')).assertContain('prefetched=0');
        await clickId('prefetchBack');
        await waitId('pageTitle');
      }, done);
    });

    /**
     * @tc.number SUB_LISTPERFORMANCE_SCENE_0300
     * @tc.name testListPerformanceScenePlaceholderBack0003
     * @tc.desc Verify placeholder page returns to the index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testListPerformanceScenePlaceholderBack0003', 0, async (done: Function) => {
      await runCase('testListPerformanceScenePlaceholderBack0003', async () => {
        await startApp(BUNDLE_NAME, ABILITY_NAME);
        await clickId('cardPlaceholder');
        await waitId('placeholderList');
        await clickId('placeholderBack');
        await waitId('pageTitle');
      }, done);
    });

  });
}
