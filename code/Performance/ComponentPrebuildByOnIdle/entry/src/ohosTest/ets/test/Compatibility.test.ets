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
import { Constants } from '@ohos/customreusablepool/src/main/ets/constants/Constants';
import { CountingListener } from './shared/CountingListener';

import { paceTurn } from './shared/TestPace';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PrebuildOnIdle_Compatibility]';

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


export default function CompatibilityTest() {
  describe('CompatibilityTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_COMPAT_0001
     * @tc.name testCompatData0001
     * @tc.desc Verify compatibility behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testCompatData0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatData0001 begin');
      const index: number = 0;
      const selector: number = index % 5;
      const data: ViewItem[] = mockDataOf(selector);
      const target: number = index % 100;
      expect(data.length).assertEqual(100);
      expect(data[target].id).assertEqual(target.toString());
      expect(data[target].type).assertEqual(target % 2);
      expect(data[target].name.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatData0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_COMPAT_0064
     * @tc.name testCompatData0064
     * @tc.desc Verify compatibility behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testCompatData0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatData0064 begin');
      const index: number = 63;
      const selector: number = index % 5;
      const data: ViewItem[] = mockDataOf(selector);
      const target: number = index % 100;
      expect(data.length).assertEqual(100);
      expect(data[target].id).assertEqual(target.toString());
      expect(data[target].type).assertEqual(target % 2);
      expect(data[target].name.length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatData0064 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_COMPAT_0001
     * @tc.name testCompatSource0001
     * @tc.desc Verify compatibility behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testCompatSource0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatSource0001 begin');
      const index: number = 0;
      const title: TitleDataSource = new TitleDataSource();
      const listener: CountingListener = new CountingListener();
      title.registerDataChangeListener(listener);
      const addCount: number = (index % 8) + 1;
      for (let n: number = 0; n < addCount; n++) {
        title.addItem('compat_' + index + '_' + n);
      }
      expect(listener.addCount).assertEqual(addCount);
      const water: WaterFlowDataSource = new WaterFlowDataSource();
      const waterFirst: CountingListener = new CountingListener();
      const waterSecond: CountingListener = new CountingListener();
      water.registerDataChangeListener(waterFirst);
      water.registerDataChangeListener(waterSecond);
      water.addLastItem(makeItem('compat_water_' + index, 1));
      expect(waterFirst.addCount).assertEqual(1);
      expect(waterSecond.addCount).assertEqual(1);
      water.unregisterDataChangeListener(waterSecond);
      water.addLastItem(makeItem('compat_water2_' + index, 0));
      expect(waterFirst.addCount).assertEqual(2);
      expect(waterSecond.addCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatSource0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_COMPAT_0064
     * @tc.name testCompatSource0064
     * @tc.desc Verify compatibility behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testCompatSource0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatSource0064 begin');
      const index: number = 63;
      const title: TitleDataSource = new TitleDataSource();
      const listener: CountingListener = new CountingListener();
      title.registerDataChangeListener(listener);
      const addCount: number = (index % 8) + 1;
      for (let n: number = 0; n < addCount; n++) {
        title.addItem('compat_' + index + '_' + n);
      }
      expect(listener.addCount).assertEqual(addCount);
      const water: WaterFlowDataSource = new WaterFlowDataSource();
      const waterFirst: CountingListener = new CountingListener();
      const waterSecond: CountingListener = new CountingListener();
      water.registerDataChangeListener(waterFirst);
      water.registerDataChangeListener(waterSecond);
      water.addLastItem(makeItem('compat_water_' + index, 1));
      expect(waterFirst.addCount).assertEqual(1);
      expect(waterSecond.addCount).assertEqual(1);
      water.unregisterDataChangeListener(waterSecond);
      water.addLastItem(makeItem('compat_water2_' + index, 0));
      expect(waterFirst.addCount).assertEqual(2);
      expect(waterSecond.addCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatSource0064 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_COMPAT_0001
     * @tc.name testCompatPool0001
     * @tc.desc Verify compatibility behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testCompatPool0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatPool0001 begin');
      const index: number = 0;
      const pool: NodePool = NodePool.getInstance();
      const type: string = 'compat_pool_' + (index % 3);
      const node: NodeItem = new NodeItem();
      node.type = type;
      node.id = 50000 + index;
      pool.recycleNode(type, node);
      const same: NodeItem | undefined = pool.getNode(type, new PoolProbeItem('c' + index), Color.Red, POOL_BUILDER);
      expect(same !== undefined).assertTrue();
      if (same !== undefined) {
        expect(same.id).assertEqual(50000 + index);
      }
      const other: NodeItem | undefined = pool.getNode('compat_other_' + (index % 3), new PoolProbeItem('d' + index), Color.Blue, POOL_BUILDER);
      expect(other !== undefined).assertTrue();
      if (other !== undefined) {
        expect(other.id).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatPool0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_COMPAT_0064
     * @tc.name testCompatPool0064
     * @tc.desc Verify compatibility behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testCompatPool0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatPool0064 begin');
      const index: number = 63;
      const pool: NodePool = NodePool.getInstance();
      const type: string = 'compat_pool_' + (index % 3);
      const node: NodeItem = new NodeItem();
      node.type = type;
      node.id = 50000 + index;
      pool.recycleNode(type, node);
      const same: NodeItem | undefined = pool.getNode(type, new PoolProbeItem('c' + index), Color.Red, POOL_BUILDER);
      expect(same !== undefined).assertTrue();
      if (same !== undefined) {
        expect(same.id).assertEqual(50000 + index);
      }
      const other: NodeItem | undefined = pool.getNode('compat_other_' + (index % 3), new PoolProbeItem('d' + index), Color.Blue, POOL_BUILDER);
      expect(other !== undefined).assertTrue();
      if (other !== undefined) {
        expect(other.id).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatPool0064 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_COMPAT_0001
     * @tc.name testCompatConstants0001
     * @tc.desc Verify compatibility behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testCompatConstants0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatConstants0001 begin');
      const index: number = 0;
      const values: string[] = [Constants.HOME, Constants.FILM, Constants.TELEPLAY, Constants.ANIMATION, Constants.SPORT];
      const ci: number = index % values.length;
      expect(values[ci].length).assertLarger(0);
      expect(values.indexOf(values[ci])).assertEqual(ci);
      expect(values.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatConstants0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_COMPAT_0064
     * @tc.name testCompatConstants0064
     * @tc.desc Verify compatibility behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testCompatConstants0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatConstants0064 begin');
      const index: number = 63;
      const values: string[] = [Constants.HOME, Constants.FILM, Constants.TELEPLAY, Constants.ANIMATION, Constants.SPORT];
      const ci: number = index % values.length;
      expect(values[ci].length).assertLarger(0);
      expect(values.indexOf(values[ci])).assertEqual(ci);
      expect(values.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testCompatConstants0064 end');
    });


  });
}
