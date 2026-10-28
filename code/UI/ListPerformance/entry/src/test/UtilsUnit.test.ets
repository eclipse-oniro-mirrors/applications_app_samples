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

import { describe, it, expect } from '@ohos/hypium';
import { BreakpointUtils } from '../main/ets/utils/BreakpointUtils';
import { ListDataUtils } from '../main/ets/utils/ListDataUtils';
import { PrefetchDataSource } from '../main/ets/utils/ListDataSources';
import { PlaceholderController } from '../main/ets/utils/PlaceholderController';
import { PlaceholderRegistry } from '../main/ets/utils/PlaceholderRegistry';
import { PrefetchUtils } from '../main/ets/utils/PrefetchUtils';

export default function utilsUnitTest() {
  describe('UtilsUnitTest', () => {
    it('PlaceholderRegistry_Basic_001', 0, () => {
      const registry = new PlaceholderRegistry(50);
      registry.register(0);
      registry.registerRange(5, 10);
      expect(registry.loadedCount()).assertEqual(6);
      expect(registry.isLoaded(5)).assertTrue();
      expect(registry.isLoaded(10)).assertFalse();
      registry.reset();
      expect(registry.loadedCount()).assertEqual(0);
    });

    it('ListDataUtils_Batch_001', 0, () => {
      expect(ListDataUtils.nextBatch(0, 200, 20)).assertEqual(20);
      expect(ListDataUtils.nextBatch(190, 200, 20)).assertEqual(200);
      expect(ListDataUtils.itemTitle(9)).assertEqual('Item 10');
      expect(ListDataUtils.formatPlaceholder(20, 200)).assertEqual('loaded=20/200');
      expect(ListDataUtils.formatPrefetch(1, 21, 200)).assertEqual('prefetched=1, loaded=21/200');
    });

    it('BreakpointUtils_Template_001', 0, () => {
      expect(BreakpointUtils.gridTemplate(500)).assertEqual('1fr');
      expect(BreakpointUtils.gridTemplate(700)).assertEqual('1fr 1fr');
      expect(BreakpointUtils.gridTemplate(1000)).assertEqual('1fr 1fr 1fr');
      expect(BreakpointUtils.contentPadding(700)).assertEqual(24);
    });

    it('PlaceholderRegistry_Bounds_001', 0, () => {
      const registry = new PlaceholderRegistry(10);
      registry.register(-1);
      registry.register(10);
      registry.registerRange(8, 20);
      expect(registry.loadedCount()).assertEqual(2);
      expect(registry.total()).assertEqual(10);
    });

    it('PlaceholderController_Load_001', 0, () => {
      const controller = new PlaceholderController(200);
      expect(controller.loadNext()).assertEqual('loaded=20/200');
      expect(controller.dataSource().getData(19).loaded).assertTrue();
      expect(controller.dataSource().getData(20).loaded).assertFalse();
      expect(controller.reset()).assertEqual('loaded=0/200');
    });

    it('PrefetchUtils_Range_001', 0, () => {
      expect(PrefetchUtils.nextIndices(0, 3, 200).join(',')).assertEqual('1,2,3');
      expect(PrefetchUtils.nextIndices(198, 3, 200).join(',')).assertEqual('199');
      expect(PrefetchUtils.nextIndices(199, 3, 200).length).assertEqual(0);
    });

    it('PrefetchDataSource_Stats_001', 0, () => {
      const registry = new PlaceholderRegistry(50);
      let prefetched = 0;
      const source = new PrefetchDataSource(50, registry, (p: number, loaded: number, total: number) => {
        prefetched = p;
      });
      source.loadNext();
      source.prefetch(20);
      expect(prefetched).assertEqual(1);
      source.prefetch(20);
      expect(prefetched).assertEqual(1);
      source.clearStats();
      expect(prefetched).assertEqual(0);
    });
  });
}
