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
import { WaterFlowDataSource } from '@ohos/customreusablepool/src/main/ets/data/WaterFlowDataSource';
import { ViewItem } from '@ohos/customreusablepool/src/main/ets/data/ViewItem';
import { CountingListener } from './shared/CountingListener';

import { paceTurn } from './shared/TestPace';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PrebuildOnIdle_WaterFlowDataSourceMatrix]';

function makeItem(id: string, type: number): ViewItem {
  const item: ViewItem = new ViewItem();
  item.id = id;
  item.name = 'name_' + id;
  item.des = 'des_' + id;
  item.type = type;
  item.image = 'image_' + id;
  return item;
}

export default function waterFlowDataSourceMatrixTest() {
  describe('waterFlowDataSourceMatrixTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number SUB_PREBUILD_WATERFLOW_MATRIX_0001
     * @tc.name test_waterFlowDataSourceMatrix_c0001
     * @tc.desc Verify WaterFlowDataSourceMatrix behavior for matrix index 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_waterFlowDataSourceMatrix_c0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_waterFlowDataSourceMatrix_c0001 begin');
      const data: WaterFlowDataSource = new WaterFlowDataSource();
      const seedCount: number = (0 % 10) + 3;
      const seed: ViewItem[] = [];
      for (let n: number = 0; n < seedCount; n++) {
        seed.push(makeItem('seed_' + 0 + '_' + n, n % 2));
      }
      data.addItems(seed);
      expect(data.totalCount()).assertEqual(seedCount);
      const listener: CountingListener = new CountingListener();
      data.registerDataChangeListener(listener);
      data.add1stItem(makeItem('first_' + 0, 1));
      expect(data.getData(0).id).assertEqual('first_' + 0);
      expect(listener.addCount).assertEqual(1);
      data.addLastItem(makeItem('last_' + 0, 0));
      expect(data.getData(data.totalCount() - 1).id).assertEqual('last_' + 0);
      expect(listener.addCount).assertEqual(2);
      data.addItem(1, makeItem('mid_' + 0, 1));
      expect(data.getData(1).id).assertEqual('mid_' + 0);
      const before: number = data.totalCount();
      data.delete1stItem();
      data.delete2ndItem();
      data.deleteLastItem();
      expect(data.totalCount()).assertEqual(before - 3);
      expect(listener.deleteCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_waterFlowDataSourceMatrix_c0001 end');
    });

    /**
     * @tc.number SUB_PREBUILD_WATERFLOW_MATRIX_0002
     * @tc.name test_waterFlowDataSourceMatrix_c0002
     * @tc.desc Verify WaterFlowDataSourceMatrix behavior for matrix index 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_waterFlowDataSourceMatrix_c0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_waterFlowDataSourceMatrix_c0002 begin');
      const data: WaterFlowDataSource = new WaterFlowDataSource();
      const seedCount: number = (1 % 10) + 3;
      const seed: ViewItem[] = [];
      for (let n: number = 0; n < seedCount; n++) {
        seed.push(makeItem('seed_' + 1 + '_' + n, n % 2));
      }
      data.addItems(seed);
      expect(data.totalCount()).assertEqual(seedCount);
      const listener: CountingListener = new CountingListener();
      data.registerDataChangeListener(listener);
      data.add1stItem(makeItem('first_' + 1, 1));
      expect(data.getData(0).id).assertEqual('first_' + 1);
      expect(listener.addCount).assertEqual(1);
      data.addLastItem(makeItem('last_' + 1, 0));
      expect(data.getData(data.totalCount() - 1).id).assertEqual('last_' + 1);
      expect(listener.addCount).assertEqual(2);
      data.addItem(1, makeItem('mid_' + 1, 1));
      expect(data.getData(1).id).assertEqual('mid_' + 1);
      const before: number = data.totalCount();
      data.delete1stItem();
      data.delete2ndItem();
      data.deleteLastItem();
      expect(data.totalCount()).assertEqual(before - 3);
      expect(listener.deleteCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_waterFlowDataSourceMatrix_c0002 end');
    });

    /**
     * @tc.number SUB_PREBUILD_WATERFLOW_MATRIX_0003
     * @tc.name test_waterFlowDataSourceMatrix_c0003
     * @tc.desc Verify WaterFlowDataSourceMatrix behavior for matrix index 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_waterFlowDataSourceMatrix_c0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_waterFlowDataSourceMatrix_c0003 begin');
      const data: WaterFlowDataSource = new WaterFlowDataSource();
      const seedCount: number = (2 % 10) + 3;
      const seed: ViewItem[] = [];
      for (let n: number = 0; n < seedCount; n++) {
        seed.push(makeItem('seed_' + 2 + '_' + n, n % 2));
      }
      data.addItems(seed);
      expect(data.totalCount()).assertEqual(seedCount);
      const listener: CountingListener = new CountingListener();
      data.registerDataChangeListener(listener);
      data.add1stItem(makeItem('first_' + 2, 1));
      expect(data.getData(0).id).assertEqual('first_' + 2);
      expect(listener.addCount).assertEqual(1);
      data.addLastItem(makeItem('last_' + 2, 0));
      expect(data.getData(data.totalCount() - 1).id).assertEqual('last_' + 2);
      expect(listener.addCount).assertEqual(2);
      data.addItem(1, makeItem('mid_' + 2, 1));
      expect(data.getData(1).id).assertEqual('mid_' + 2);
      const before: number = data.totalCount();
      data.delete1stItem();
      data.delete2ndItem();
      data.deleteLastItem();
      expect(data.totalCount()).assertEqual(before - 3);
      expect(listener.deleteCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_waterFlowDataSourceMatrix_c0003 end');
    });

    /**
     * @tc.number SUB_PREBUILD_WATERFLOW_MATRIX_0004
     * @tc.name test_waterFlowDataSourceMatrix_c0004
     * @tc.desc Verify WaterFlowDataSourceMatrix behavior for matrix index 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_waterFlowDataSourceMatrix_c0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_waterFlowDataSourceMatrix_c0004 begin');
      const data: WaterFlowDataSource = new WaterFlowDataSource();
      const seedCount: number = (3 % 10) + 3;
      const seed: ViewItem[] = [];
      for (let n: number = 0; n < seedCount; n++) {
        seed.push(makeItem('seed_' + 3 + '_' + n, n % 2));
      }
      data.addItems(seed);
      expect(data.totalCount()).assertEqual(seedCount);
      const listener: CountingListener = new CountingListener();
      data.registerDataChangeListener(listener);
      data.add1stItem(makeItem('first_' + 3, 1));
      expect(data.getData(0).id).assertEqual('first_' + 3);
      expect(listener.addCount).assertEqual(1);
      data.addLastItem(makeItem('last_' + 3, 0));
      expect(data.getData(data.totalCount() - 1).id).assertEqual('last_' + 3);
      expect(listener.addCount).assertEqual(2);
      data.addItem(1, makeItem('mid_' + 3, 1));
      expect(data.getData(1).id).assertEqual('mid_' + 3);
      const before: number = data.totalCount();
      data.delete1stItem();
      data.delete2ndItem();
      data.deleteLastItem();
      expect(data.totalCount()).assertEqual(before - 3);
      expect(listener.deleteCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_waterFlowDataSourceMatrix_c0004 end');
    });

    /**
     * @tc.number SUB_PREBUILD_WATERFLOW_MATRIX_0005
     * @tc.name test_waterFlowDataSourceMatrix_c0005
     * @tc.desc Verify WaterFlowDataSourceMatrix behavior for matrix index 4
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_waterFlowDataSourceMatrix_c0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_waterFlowDataSourceMatrix_c0005 begin');
      const data: WaterFlowDataSource = new WaterFlowDataSource();
      const seedCount: number = (4 % 10) + 3;
      const seed: ViewItem[] = [];
      for (let n: number = 0; n < seedCount; n++) {
        seed.push(makeItem('seed_' + 4 + '_' + n, n % 2));
      }
      data.addItems(seed);
      expect(data.totalCount()).assertEqual(seedCount);
      const listener: CountingListener = new CountingListener();
      data.registerDataChangeListener(listener);
      data.add1stItem(makeItem('first_' + 4, 1));
      expect(data.getData(0).id).assertEqual('first_' + 4);
      expect(listener.addCount).assertEqual(1);
      data.addLastItem(makeItem('last_' + 4, 0));
      expect(data.getData(data.totalCount() - 1).id).assertEqual('last_' + 4);
      expect(listener.addCount).assertEqual(2);
      data.addItem(1, makeItem('mid_' + 4, 1));
      expect(data.getData(1).id).assertEqual('mid_' + 4);
      const before: number = data.totalCount();
      data.delete1stItem();
      data.delete2ndItem();
      data.deleteLastItem();
      expect(data.totalCount()).assertEqual(before - 3);
      expect(listener.deleteCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_waterFlowDataSourceMatrix_c0005 end');
    });

    /**
     * @tc.number SUB_PREBUILD_WATERFLOW_MATRIX_0006
     * @tc.name test_waterFlowDataSourceMatrix_c0006
     * @tc.desc Verify WaterFlowDataSourceMatrix behavior for matrix index 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_waterFlowDataSourceMatrix_c0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_waterFlowDataSourceMatrix_c0006 begin');
      const data: WaterFlowDataSource = new WaterFlowDataSource();
      const seedCount: number = (5 % 10) + 3;
      const seed: ViewItem[] = [];
      for (let n: number = 0; n < seedCount; n++) {
        seed.push(makeItem('seed_' + 5 + '_' + n, n % 2));
      }
      data.addItems(seed);
      expect(data.totalCount()).assertEqual(seedCount);
      const listener: CountingListener = new CountingListener();
      data.registerDataChangeListener(listener);
      data.add1stItem(makeItem('first_' + 5, 1));
      expect(data.getData(0).id).assertEqual('first_' + 5);
      expect(listener.addCount).assertEqual(1);
      data.addLastItem(makeItem('last_' + 5, 0));
      expect(data.getData(data.totalCount() - 1).id).assertEqual('last_' + 5);
      expect(listener.addCount).assertEqual(2);
      data.addItem(1, makeItem('mid_' + 5, 1));
      expect(data.getData(1).id).assertEqual('mid_' + 5);
      const before: number = data.totalCount();
      data.delete1stItem();
      data.delete2ndItem();
      data.deleteLastItem();
      expect(data.totalCount()).assertEqual(before - 3);
      expect(listener.deleteCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_waterFlowDataSourceMatrix_c0006 end');
    });

    /**
     * @tc.number SUB_PREBUILD_WATERFLOW_MATRIX_0128
     * @tc.name test_waterFlowDataSourceMatrix_c0128
     * @tc.desc Verify WaterFlowDataSourceMatrix behavior for matrix index 127
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_waterFlowDataSourceMatrix_c0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_waterFlowDataSourceMatrix_c0128 begin');
      const data: WaterFlowDataSource = new WaterFlowDataSource();
      const seedCount: number = (127 % 10) + 3;
      const seed: ViewItem[] = [];
      for (let n: number = 0; n < seedCount; n++) {
        seed.push(makeItem('seed_' + 127 + '_' + n, n % 2));
      }
      data.addItems(seed);
      expect(data.totalCount()).assertEqual(seedCount);
      const listener: CountingListener = new CountingListener();
      data.registerDataChangeListener(listener);
      data.add1stItem(makeItem('first_' + 127, 1));
      expect(data.getData(0).id).assertEqual('first_' + 127);
      expect(listener.addCount).assertEqual(1);
      data.addLastItem(makeItem('last_' + 127, 0));
      expect(data.getData(data.totalCount() - 1).id).assertEqual('last_' + 127);
      expect(listener.addCount).assertEqual(2);
      data.addItem(1, makeItem('mid_' + 127, 1));
      expect(data.getData(1).id).assertEqual('mid_' + 127);
      const before: number = data.totalCount();
      data.delete1stItem();
      data.delete2ndItem();
      data.deleteLastItem();
      expect(data.totalCount()).assertEqual(before - 3);
      expect(listener.deleteCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_waterFlowDataSourceMatrix_c0128 end');
    });

    /**
     * @tc.number SUB_PREBUILD_WATERFLOW_MATRIX_0256
     * @tc.name test_waterFlowDataSourceMatrix_c0256
     * @tc.desc Verify WaterFlowDataSourceMatrix behavior for matrix index 255
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('test_waterFlowDataSourceMatrix_c0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_waterFlowDataSourceMatrix_c0256 begin');
      const data: WaterFlowDataSource = new WaterFlowDataSource();
      const seedCount: number = (255 % 10) + 3;
      const seed: ViewItem[] = [];
      for (let n: number = 0; n < seedCount; n++) {
        seed.push(makeItem('seed_' + 255 + '_' + n, n % 2));
      }
      data.addItems(seed);
      expect(data.totalCount()).assertEqual(seedCount);
      const listener: CountingListener = new CountingListener();
      data.registerDataChangeListener(listener);
      data.add1stItem(makeItem('first_' + 255, 1));
      expect(data.getData(0).id).assertEqual('first_' + 255);
      expect(listener.addCount).assertEqual(1);
      data.addLastItem(makeItem('last_' + 255, 0));
      expect(data.getData(data.totalCount() - 1).id).assertEqual('last_' + 255);
      expect(listener.addCount).assertEqual(2);
      data.addItem(1, makeItem('mid_' + 255, 1));
      expect(data.getData(1).id).assertEqual('mid_' + 255);
      const before: number = data.totalCount();
      data.delete1stItem();
      data.delete2ndItem();
      data.deleteLastItem();
      expect(data.totalCount()).assertEqual(before - 3);
      expect(listener.deleteCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'test_waterFlowDataSourceMatrix_c0256 end');
    });

  });
}
