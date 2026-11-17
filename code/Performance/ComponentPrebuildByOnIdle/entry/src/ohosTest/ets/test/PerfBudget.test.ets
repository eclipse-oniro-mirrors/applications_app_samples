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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  avatarData,
  furnitureData,
  goodsData,
  natureData,
  travelData
} from '@ohos/customreusablepool/src/main/ets/data/MockData';
import { TitleDataSource } from '@ohos/customreusablepool/src/main/ets/data/TitleDataSource';
import { WaterFlowDataSource } from '@ohos/customreusablepool/src/main/ets/data/WaterFlowDataSource';
import { ViewItem } from '@ohos/customreusablepool/src/main/ets/data/ViewItem';
import { NodeItem, NodePool } from '@ohos/customreusablepool/src/main/ets/utils/BuilderNodePool';

import { paceTurn } from './shared/TestPace';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PrebuildOnIdle_PerfBudget]';

function makeItem(id: string, type: number): ViewItem {
  const item: ViewItem = new ViewItem();
  item.id = id;
  item.name = 'name_' + id;
  item.des = 'des_' + id;
  item.type = type;
  item.image = 'image_' + id;
  return item;
}

function mockDataOf(selector: number): ViewItem[] {
  if (selector === 1) {
    return goodsData();
  } else if (selector === 2) {
    return travelData();
  } else if (selector === 3) {
    return avatarData();
  } else if (selector === 4) {
    return natureData();
  }
  return furnitureData();
}

@Builder
function poolProbeBuilder(data: ESObject) {
}

const POOL_BUILDER: WrappedBuilder<ESObject> = wrapBuilder<ESObject>(poolProbeBuilder);

class PoolProbeItem {
  public value: string;

  constructor(value: string) {
    this.value = value;
  }
}


export default function PerfBudgetTest() {
  describe('PerfBudgetTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_PERF_0001
     * @tc.name testPerfMockData0001
     * @tc.desc Verify performance budget behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testPerfMockData0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMockData0001 begin');
      const index: number = 0;
      const repeat: number = (index % 16) + 1;
      const selector: number = index % 5;
      const start: number = Date.now();
      let data: ViewItem[] = mockDataOf(selector);
      for (let n: number = 0; n < repeat; n++) {
        data = mockDataOf(selector);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(data.length).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMockData0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_PERF_0064
     * @tc.name testPerfMockData0064
     * @tc.desc Verify performance budget behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testPerfMockData0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMockData0064 begin');
      const index: number = 63;
      const repeat: number = (index % 16) + 1;
      const selector: number = index % 5;
      const start: number = Date.now();
      let data: ViewItem[] = mockDataOf(selector);
      for (let n: number = 0; n < repeat; n++) {
        data = mockDataOf(selector);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(data.length).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfMockData0064 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_PERF_0001
     * @tc.name testPerfTitleData0001
     * @tc.desc Verify performance budget behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testPerfTitleData0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfTitleData0001 begin');
      const index: number = 0;
      const repeat: number = (index % 16) + 1;
      const data: TitleDataSource = new TitleDataSource();
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        data.addItem('perf_title_' + index + '_' + n);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(data.totalCount()).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfTitleData0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_PERF_0064
     * @tc.name testPerfTitleData0064
     * @tc.desc Verify performance budget behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testPerfTitleData0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfTitleData0064 begin');
      const index: number = 63;
      const repeat: number = (index % 16) + 1;
      const data: TitleDataSource = new TitleDataSource();
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        data.addItem('perf_title_' + index + '_' + n);
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(data.totalCount()).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfTitleData0064 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_PERF_0001
     * @tc.name testPerfWaterFlow0001
     * @tc.desc Verify performance budget behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testPerfWaterFlow0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfWaterFlow0001 begin');
      const index: number = 0;
      const repeat: number = (index % 16) + 1;
      const data: WaterFlowDataSource = new WaterFlowDataSource();
      const items: ViewItem[] = [];
      for (let n: number = 0; n < repeat; n++) {
        items.push(makeItem('perf_water_' + index + '_' + n, n % 2));
      }
      const start: number = Date.now();
      data.addItems(items);
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(data.totalCount()).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfWaterFlow0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_PERF_0064
     * @tc.name testPerfWaterFlow0064
     * @tc.desc Verify performance budget behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testPerfWaterFlow0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfWaterFlow0064 begin');
      const index: number = 63;
      const repeat: number = (index % 16) + 1;
      const data: WaterFlowDataSource = new WaterFlowDataSource();
      const items: ViewItem[] = [];
      for (let n: number = 0; n < repeat; n++) {
        items.push(makeItem('perf_water_' + index + '_' + n, n % 2));
      }
      const start: number = Date.now();
      data.addItems(items);
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      expect(data.totalCount()).assertEqual(repeat);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfWaterFlow0064 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_PERF_0001
     * @tc.name testPerfNodePool0001
     * @tc.desc Verify performance budget behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testPerfNodePool0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfNodePool0001 begin');
      const index: number = 0;
      const repeat: number = (index % 16) + 1;
      const pool: NodePool = NodePool.getInstance();
      const type: string = 'perf_pool_' + (index % 4);
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        const node: NodeItem = new NodeItem();
        node.type = type;
        node.id = 20000 + n;
        pool.recycleNode(type, node);
        const got: NodeItem | undefined = pool.getNode(type, new PoolProbeItem('v' + n), Color.Red, POOL_BUILDER);
        expect(got !== undefined).assertTrue();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfNodePool0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_PERF_0064
     * @tc.name testPerfNodePool0064
     * @tc.desc Verify performance budget behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testPerfNodePool0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfNodePool0064 begin');
      const index: number = 63;
      const repeat: number = (index % 16) + 1;
      const pool: NodePool = NodePool.getInstance();
      const type: string = 'perf_pool_' + (index % 4);
      const start: number = Date.now();
      for (let n: number = 0; n < repeat; n++) {
        const node: NodeItem = new NodeItem();
        node.type = type;
        node.id = 20000 + n;
        pool.recycleNode(type, node);
        const got: NodeItem | undefined = pool.getNode(type, new PoolProbeItem('v' + n), Color.Red, POOL_BUILDER);
        expect(got !== undefined).assertTrue();
      }
      const elapsed: number = Date.now() - start;
      expect(elapsed).assertLargerOrEqual(0);
      expect(elapsed < 5000).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testPerfNodePool0064 end');
    });


  });
}
