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
const TAG: string = '[Sample_PrebuildOnIdle_RecoveryIsolation]';

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


export default function RecoveryIsolationTest() {
  describe('RecoveryIsolationTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_RECOVERY_0001
     * @tc.name testRecoverTitle0001
     * @tc.desc Verify recovery isolation behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRecoverTitle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTitle0001 begin');
      const index: number = 0;
      const first: TitleDataSource = new TitleDataSource();
      const addCount: number = (index % 12) + 1;
      for (let n: number = 0; n < addCount; n++) {
        first.addItem('recover_' + index + '_' + n);
      }
      expect(first.totalCount()).assertEqual(addCount);
      const second: TitleDataSource = new TitleDataSource();
      expect(second.totalCount()).assertEqual(0);
      second.addItem('fresh_' + index);
      expect(second.totalCount()).assertEqual(1);
      expect(first.totalCount()).assertEqual(addCount);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTitle0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_RECOVERY_0064
     * @tc.name testRecoverTitle0064
     * @tc.desc Verify recovery isolation behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRecoverTitle0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTitle0064 begin');
      const index: number = 63;
      const first: TitleDataSource = new TitleDataSource();
      const addCount: number = (index % 12) + 1;
      for (let n: number = 0; n < addCount; n++) {
        first.addItem('recover_' + index + '_' + n);
      }
      expect(first.totalCount()).assertEqual(addCount);
      const second: TitleDataSource = new TitleDataSource();
      expect(second.totalCount()).assertEqual(0);
      second.addItem('fresh_' + index);
      expect(second.totalCount()).assertEqual(1);
      expect(first.totalCount()).assertEqual(addCount);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverTitle0064 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_RECOVERY_0001
     * @tc.name testRecoverWaterFlow0001
     * @tc.desc Verify recovery isolation behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRecoverWaterFlow0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverWaterFlow0001 begin');
      const index: number = 0;
      const data: WaterFlowDataSource = new WaterFlowDataSource();
      const count: number = (index % 10) + 1;
      const items: ViewItem[] = [];
      for (let n: number = 0; n < count; n++) {
        items.push(makeItem('recover_water_' + index + '_' + n, n % 2));
      }
      data.addItems(items);
      expect(data.totalCount()).assertEqual(count);
      for (let n: number = 0; n < count; n++) {
        data.delete1stItem();
      }
      expect(data.totalCount()).assertEqual(0);
      const fresh: WaterFlowDataSource = new WaterFlowDataSource();
      expect(fresh.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverWaterFlow0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_RECOVERY_0064
     * @tc.name testRecoverWaterFlow0064
     * @tc.desc Verify recovery isolation behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRecoverWaterFlow0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverWaterFlow0064 begin');
      const index: number = 63;
      const data: WaterFlowDataSource = new WaterFlowDataSource();
      const count: number = (index % 10) + 1;
      const items: ViewItem[] = [];
      for (let n: number = 0; n < count; n++) {
        items.push(makeItem('recover_water_' + index + '_' + n, n % 2));
      }
      data.addItems(items);
      expect(data.totalCount()).assertEqual(count);
      for (let n: number = 0; n < count; n++) {
        data.delete1stItem();
      }
      expect(data.totalCount()).assertEqual(0);
      const fresh: WaterFlowDataSource = new WaterFlowDataSource();
      expect(fresh.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverWaterFlow0064 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_RECOVERY_0001
     * @tc.name testRecoverNodePool0001
     * @tc.desc Verify recovery isolation behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRecoverNodePool0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverNodePool0001 begin');
      const index: number = 0;
      const pool: NodePool = NodePool.getInstance();
      const type: string = 'recover_pool_' + (index % 4);
      const node: NodeItem = new NodeItem();
      node.type = type;
      node.id = 60000 + index;
      pool.recycleNode(type, node);
      const got: NodeItem | undefined = pool.getNode(type, new PoolProbeItem('r' + index), Color.Red, POOL_BUILDER);
      expect(got !== undefined).assertTrue();
      if (got !== undefined) {
        expect(got.id).assertEqual(60000 + index);
      }
      const other: NodeItem | undefined = pool.getNode('recover_other_' + (index % 4), new PoolProbeItem('o' + index), Color.Blue, POOL_BUILDER);
      expect(other !== undefined).assertTrue();
      if (other !== undefined) {
        expect(other.id).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverNodePool0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_RECOVERY_0064
     * @tc.name testRecoverNodePool0064
     * @tc.desc Verify recovery isolation behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRecoverNodePool0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverNodePool0064 begin');
      const index: number = 63;
      const pool: NodePool = NodePool.getInstance();
      const type: string = 'recover_pool_' + (index % 4);
      const node: NodeItem = new NodeItem();
      node.type = type;
      node.id = 60000 + index;
      pool.recycleNode(type, node);
      const got: NodeItem | undefined = pool.getNode(type, new PoolProbeItem('r' + index), Color.Red, POOL_BUILDER);
      expect(got !== undefined).assertTrue();
      if (got !== undefined) {
        expect(got.id).assertEqual(60000 + index);
      }
      const other: NodeItem | undefined = pool.getNode('recover_other_' + (index % 4), new PoolProbeItem('o' + index), Color.Blue, POOL_BUILDER);
      expect(other !== undefined).assertTrue();
      if (other !== undefined) {
        expect(other.id).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverNodePool0064 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_RECOVERY_0001
     * @tc.name testRecoverMockData0001
     * @tc.desc Verify recovery isolation behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRecoverMockData0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverMockData0001 begin');
      const index: number = 0;
      const selector: number = index % 5;
      const first: ViewItem[] = mockDataOf(selector);
      const second: ViewItem[] = mockDataOf(selector);
      expect(first === second).assertFalse();
      expect(first.length).assertEqual(second.length);
      expect(first[0].id).assertEqual(second[0].id);
      expect(first[99].id).assertEqual('99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverMockData0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_RECOVERY_0064
     * @tc.name testRecoverMockData0064
     * @tc.desc Verify recovery isolation behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testRecoverMockData0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverMockData0064 begin');
      const index: number = 63;
      const selector: number = index % 5;
      const first: ViewItem[] = mockDataOf(selector);
      const second: ViewItem[] = mockDataOf(selector);
      expect(first === second).assertFalse();
      expect(first.length).assertEqual(second.length);
      expect(first[0].id).assertEqual(second[0].id);
      expect(first[99].id).assertEqual('99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testRecoverMockData0064 end');
    });


  });
}
