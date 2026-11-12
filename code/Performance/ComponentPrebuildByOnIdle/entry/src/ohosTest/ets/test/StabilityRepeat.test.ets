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
const TAG: string = '[Sample_PrebuildOnIdle_StabilityRepeat]';

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


export default function StabilityRepeatTest() {
  describe('StabilityRepeatTest', () => {
  describe('stableTitle', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_STAB_0001
     * @tc.name testStableTitle0001
     * @tc.desc Verify stability repeat behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStableTitle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableTitle0001 begin');
      const index: number = 0;
      const repeat: number = (index % 20) + 1;
      const data: TitleDataSource = new TitleDataSource();
      for (let n: number = 0; n < repeat; n++) {
        data.addItem('stable_title_' + index + '_' + n);
      }
      expect(data.totalCount()).assertEqual(repeat);
      for (let n: number = 0; n < repeat; n++) {
        data.addItem('stable_extra_' + index + '_' + n);
      }
      expect(data.totalCount()).assertEqual(repeat * 2);
      expect(data.getData(repeat * 2 - 1)).assertEqual('stable_extra_' + index + '_' + (repeat - 1));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableTitle0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_STAB_0064
     * @tc.name testStableTitle0064
     * @tc.desc Verify stability repeat behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStableTitle0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableTitle0064 begin');
      const index: number = 63;
      const repeat: number = (index % 20) + 1;
      const data: TitleDataSource = new TitleDataSource();
      for (let n: number = 0; n < repeat; n++) {
        data.addItem('stable_title_' + index + '_' + n);
      }
      expect(data.totalCount()).assertEqual(repeat);
      for (let n: number = 0; n < repeat; n++) {
        data.addItem('stable_extra_' + index + '_' + n);
      }
      expect(data.totalCount()).assertEqual(repeat * 2);
      expect(data.getData(repeat * 2 - 1)).assertEqual('stable_extra_' + index + '_' + (repeat - 1));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableTitle0064 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_STAB_0001
     * @tc.name testStableWaterFlow0001
     * @tc.desc Verify stability repeat behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStableWaterFlow0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableWaterFlow0001 begin');
      const index: number = 0;
      const repeat: number = (index % 20) + 1;
      const data: WaterFlowDataSource = new WaterFlowDataSource();
      for (let n: number = 0; n < repeat; n++) {
        data.addLastItem(makeItem('stable_water_' + index + '_' + n, n % 2));
      }
      expect(data.totalCount()).assertEqual(repeat);
      for (let n: number = 0; n < repeat; n++) {
        data.delete1stItem();
      }
      expect(data.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableWaterFlow0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_STAB_0064
     * @tc.name testStableWaterFlow0064
     * @tc.desc Verify stability repeat behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStableWaterFlow0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableWaterFlow0064 begin');
      const index: number = 63;
      const repeat: number = (index % 20) + 1;
      const data: WaterFlowDataSource = new WaterFlowDataSource();
      for (let n: number = 0; n < repeat; n++) {
        data.addLastItem(makeItem('stable_water_' + index + '_' + n, n % 2));
      }
      expect(data.totalCount()).assertEqual(repeat);
      for (let n: number = 0; n < repeat; n++) {
        data.delete1stItem();
      }
      expect(data.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableWaterFlow0064 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_STAB_0001
     * @tc.name testStableNodePool0001
     * @tc.desc Verify stability repeat behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStableNodePool0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableNodePool0001 begin');
      const index: number = 0;
      const repeat: number = (index % 20) + 1;
      const pool: NodePool = NodePool.getInstance();
      const type: string = 'stable_pool_' + (index % 4);
      const before: number = pool.getNextId();
      for (let n: number = 0; n < repeat; n++) {
        const node: NodeItem = new NodeItem();
        node.type = type;
        node.id = 30000 + index * 100 + n;
        pool.recycleNode(type, node);
        const got: NodeItem | undefined = pool.getNode(type, new PoolProbeItem('s' + n), Color.Green, POOL_BUILDER);
        expect(got !== undefined).assertTrue();
        if (got !== undefined) {
          expect(got.id).assertEqual(30000 + index * 100 + n);
        }
      }
      expect(pool.getNextId()).assertEqual(before + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableNodePool0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_STAB_0064
     * @tc.name testStableNodePool0064
     * @tc.desc Verify stability repeat behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStableNodePool0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableNodePool0064 begin');
      const index: number = 63;
      const repeat: number = (index % 20) + 1;
      const pool: NodePool = NodePool.getInstance();
      const type: string = 'stable_pool_' + (index % 4);
      const before: number = pool.getNextId();
      for (let n: number = 0; n < repeat; n++) {
        const node: NodeItem = new NodeItem();
        node.type = type;
        node.id = 30000 + index * 100 + n;
        pool.recycleNode(type, node);
        const got: NodeItem | undefined = pool.getNode(type, new PoolProbeItem('s' + n), Color.Green, POOL_BUILDER);
        expect(got !== undefined).assertTrue();
        if (got !== undefined) {
          expect(got.id).assertEqual(30000 + index * 100 + n);
        }
      }
      expect(pool.getNextId()).assertEqual(before + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableNodePool0064 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_STAB_0001
     * @tc.name testStableMockData0001
     * @tc.desc Verify stability repeat behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStableMockData0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableMockData0001 begin');
      const index: number = 0;
      const repeat: number = (index % 20) + 1;
      const selector: number = index % 5;
      for (let n: number = 0; n < repeat; n++) {
        const data: ViewItem[] = mockDataOf(selector);
        expect(data.length).assertEqual(100);
        expect(data[0].id).assertEqual('0');
        expect(data[99].id).assertEqual('99');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableMockData0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_STAB_0064
     * @tc.name testStableMockData0064
     * @tc.desc Verify stability repeat behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testStableMockData0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableMockData0064 begin');
      const index: number = 63;
      const repeat: number = (index % 20) + 1;
      const selector: number = index % 5;
      for (let n: number = 0; n < repeat; n++) {
        const data: ViewItem[] = mockDataOf(selector);
        expect(data.length).assertEqual(100);
        expect(data[0].id).assertEqual('0');
        expect(data[99].id).assertEqual('99');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testStableMockData0064 end');
    });


  });
  });
}
