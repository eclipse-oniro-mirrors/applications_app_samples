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
const TAG: string = '[Sample_PrebuildOnIdle_InputBoundary]';

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


export default function InputBoundaryTest() {
  describe('InputBoundaryTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_INPUT_0001
     * @tc.name testBoundaryTitle0001
     * @tc.desc Verify input boundary behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBoundaryTitle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryTitle0001 begin');
      const index: number = 0;
      const data: TitleDataSource = new TitleDataSource();
      expect(data.totalCount()).assertEqual(0);
      expect(data.getData(0) === undefined).assertTrue();
      expect(data.getData(-1) === undefined).assertTrue();
      data.addItem('');
      expect(data.totalCount()).assertEqual(1);
      expect(data.getData(0)).assertEqual('');
      data.addItem('boundary_title_' + index);
      expect(data.getData(1)).assertEqual('boundary_title_' + index);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryTitle0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_INPUT_0064
     * @tc.name testBoundaryTitle0064
     * @tc.desc Verify input boundary behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBoundaryTitle0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryTitle0064 begin');
      const index: number = 63;
      const data: TitleDataSource = new TitleDataSource();
      expect(data.totalCount()).assertEqual(0);
      expect(data.getData(0) === undefined).assertTrue();
      expect(data.getData(-1) === undefined).assertTrue();
      data.addItem('');
      expect(data.totalCount()).assertEqual(1);
      expect(data.getData(0)).assertEqual('');
      data.addItem('boundary_title_' + index);
      expect(data.getData(1)).assertEqual('boundary_title_' + index);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryTitle0064 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_INPUT_0001
     * @tc.name testBoundaryWaterFlow0001
     * @tc.desc Verify input boundary behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBoundaryWaterFlow0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryWaterFlow0001 begin');
      const index: number = 0;
      const data: WaterFlowDataSource = new WaterFlowDataSource();
      expect(data.totalCount()).assertEqual(0);
      expect(data.getData(0) === undefined).assertTrue();
      data.add1stItem(makeItem('boundary_first_' + index, 1));
      data.addLastItem(makeItem('boundary_last_' + index, 0));
      expect(data.totalCount()).assertEqual(2);
      data.addItem(1, makeItem('boundary_mid_' + index, 1));
      expect(data.totalCount()).assertEqual(3);
      expect(data.getData(1).id).assertEqual('boundary_mid_' + index);
      data.delete1stItem();
      data.delete2ndItem();
      data.deleteLastItem();
      expect(data.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryWaterFlow0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_INPUT_0064
     * @tc.name testBoundaryWaterFlow0064
     * @tc.desc Verify input boundary behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBoundaryWaterFlow0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryWaterFlow0064 begin');
      const index: number = 63;
      const data: WaterFlowDataSource = new WaterFlowDataSource();
      expect(data.totalCount()).assertEqual(0);
      expect(data.getData(0) === undefined).assertTrue();
      data.add1stItem(makeItem('boundary_first_' + index, 1));
      data.addLastItem(makeItem('boundary_last_' + index, 0));
      expect(data.totalCount()).assertEqual(2);
      data.addItem(1, makeItem('boundary_mid_' + index, 1));
      expect(data.totalCount()).assertEqual(3);
      expect(data.getData(1).id).assertEqual('boundary_mid_' + index);
      data.delete1stItem();
      data.delete2ndItem();
      data.deleteLastItem();
      expect(data.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryWaterFlow0064 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_INPUT_0001
     * @tc.name testBoundaryMockData0001
     * @tc.desc Verify input boundary behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBoundaryMockData0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryMockData0001 begin');
      const index: number = 0;
      const selector: number = index % 5;
      const data: ViewItem[] = mockDataOf(selector);
      expect(data.length).assertEqual(100);
      expect(data[0].id).assertEqual('0');
      expect(data[99].id).assertEqual('99');
      expect(data[100] === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryMockData0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_INPUT_0064
     * @tc.name testBoundaryMockData0064
     * @tc.desc Verify input boundary behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBoundaryMockData0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryMockData0064 begin');
      const index: number = 63;
      const selector: number = index % 5;
      const data: ViewItem[] = mockDataOf(selector);
      expect(data.length).assertEqual(100);
      expect(data[0].id).assertEqual('0');
      expect(data[99].id).assertEqual('99');
      expect(data[100] === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryMockData0064 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_INPUT_0001
     * @tc.name testBoundaryNodePool0001
     * @tc.desc Verify input boundary behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBoundaryNodePool0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNodePool0001 begin');
      const index: number = 0;
      const pool: NodePool = NodePool.getInstance();
      const type: string = index % 2 === 0 ? '' : 'boundary_pool_[]{}_' + index;
      const node: NodeItem = new NodeItem();
      node.type = type;
      node.id = 40000 + index;
      pool.recycleNode(type, node);
      const got: NodeItem | undefined = pool.getNode(type, new PoolProbeItem('b' + index), Color.Red, POOL_BUILDER);
      expect(got !== undefined).assertTrue();
      if (got !== undefined) {
        expect(got.id).assertEqual(40000 + index);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNodePool0001 end');
    });

    /**
     * @tc.number SUB_COMPONENT_PREBUILD_INPUT_0064
     * @tc.name testBoundaryNodePool0064
     * @tc.desc Verify input boundary behavior for matrix index 63
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testBoundaryNodePool0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNodePool0064 begin');
      const index: number = 63;
      const pool: NodePool = NodePool.getInstance();
      const type: string = index % 2 === 0 ? '' : 'boundary_pool_[]{}_' + index;
      const node: NodeItem = new NodeItem();
      node.type = type;
      node.id = 40000 + index;
      pool.recycleNode(type, node);
      const got: NodeItem | undefined = pool.getNode(type, new PoolProbeItem('b' + index), Color.Red, POOL_BUILDER);
      expect(got !== undefined).assertTrue();
      if (got !== undefined) {
        expect(got.id).assertEqual(40000 + index);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testBoundaryNodePool0064 end');
    });


  });
}
