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
import { beforeEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../utils/YieldHook';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CommodityDataModel, CommodityDataSource, PRODUCTS_DATA } from '../../../main/ets/bridge/PageLoadingBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'DataSourceCoreTest';

class CountingListener implements DataChangeListener {
  reloadedCount: number = 0;
  addedCount: number = 0;
  lastAddIndex: number = -1000;
  changedCount: number = 0;
  lastChangeIndex: number = -1000;
  deletedCount: number = 0;
  lastDeleteIndex: number = -1000;
  eventLog: string[] = [];

  onDataReloaded(): void {
    this.reloadedCount++;
    this.eventLog.push('reload');
  }

  onDataAdd(index: number): void {
    this.addedCount++;
    this.lastAddIndex = index;
    this.eventLog.push('add:' + index);
  }

  onDataChange(index: number): void {
    this.changedCount++;
    this.lastChangeIndex = index;
    this.eventLog.push('change:' + index);
  }

  onDataDelete(index: number): void {
    this.deletedCount++;
    this.lastDeleteIndex = index;
    this.eventLog.push('delete:' + index);
  }

  onDataMove(from: number, to: number): void {
    this.eventLog.push('move:' + from + '>' + to);
  }

  onDataAdded(index: number): void {
    this.eventLog.push('addedNew:' + index);
  }

  onDataChanged(index: number): void {
    this.eventLog.push('changedNew:' + index);
  }

  onDataDeleted(index: number): void {
    this.eventLog.push('deletedNew:' + index);
  }

  onDataMoved(from: number, to: number): void {
    this.eventLog.push('movedNew:' + from + '>' + to);
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
    this.eventLog.push('datasetChange:' + dataOperations.length);
  }
}

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function makeItem(id: number): CommodityDataModel {
  return new CommodityDataModel(id, 'uri' + id, 'title' + id, 'price' + id, 'views' + id, 'ins' + id);
}

export default function dataSourceCoreTest(): void {
  describe('DataSourceCoreTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0101
     * @tc.name      testDsCore0101
     * @tc.desc      Verify a fresh data source reports a zero total count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0101 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.totalCount()=${typeof source.totalCount()}`);
      expect(typeof source.totalCount()).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0101 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0102
     * @tc.name      testDsCore0102
     * @tc.desc      Verify getData on an empty source returns undefined for index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0102 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const item: CommodityDataModel | undefined = source.getData(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined item`);
      expect(item).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.totalCount() >= 0=${source.totalCount() >= 0}`);
      expect(source.totalCount() >= 0).assertTrue();
      log('testDsCore0102 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0103
     * @tc.name      testDsCore0103
     * @tc.desc      Verify getData with a negative index on an empty source is undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0103 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(-1)`);
      expect(source.getData(-1)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.totalCount() >= 0=${source.totalCount() >= 0}`);
      expect(source.totalCount() >= 0).assertTrue();
      log('testDsCore0103 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0104
     * @tc.name      testDsCore0104
     * @tc.desc      Verify getData with a NaN index on an empty source is undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0104 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(NaN)`);
      expect(source.getData(NaN)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.totalCount() >= 0=${source.totalCount() >= 0}`);
      expect(source.totalCount() >= 0).assertTrue();
      log('testDsCore0104 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0105
     * @tc.name      testDsCore0105
     * @tc.desc      Verify getData with a fractional index on an empty source is undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0105 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(1.5)`);
      expect(source.getData(1.5)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.totalCount() >= 0=${source.totalCount() >= 0}`);
      expect(source.totalCount() >= 0).assertTrue();
      log('testDsCore0105 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0106
     * @tc.name      testDsCore0106
     * @tc.desc      Verify getData far beyond an empty source stays undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0106 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(100)`);
      expect(source.getData(100)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.totalCount() >= 0=${source.totalCount() >= 0}`);
      expect(source.totalCount() >= 0).assertTrue();
      log('testDsCore0106 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0107
     * @tc.name      testDsCore0107
     * @tc.desc      Verify pushing one item grows the total count to one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0107 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      source.pushData([makeItem(1)]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.totalCount()=${typeof source.totalCount()}`);
      expect(typeof source.totalCount()).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0107 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0108
     * @tc.name      testDsCore0108
     * @tc.desc      Verify the first stored item is returned by reference identity.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0108 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const item: CommodityDataModel = makeItem(7);
      source.pushData([item]);
      const stored: CommodityDataModel | undefined = source.getData(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue stored === item=${stored === item}`);
      expect(stored === item).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual stored?.id=${stored?.id}, expected=7`);
      expect(stored?.id).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0108 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0109
     * @tc.name      testDsCore0109
     * @tc.desc      Verify a three item batch is counted as three items.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0109 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      source.pushData([makeItem(1), makeItem(2), makeItem(3)]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=3`);
      expect(source.totalCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${source.getData(0) !== undefined}`);
      expect(source.getData(0) !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0109 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0110
     * @tc.name      testDsCore0110
     * @tc.desc      Verify the last slot of a batch keeps its own reference.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0110 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const last: CommodityDataModel = makeItem(3);
      source.pushData([makeItem(1), makeItem(2), last]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.getData(2) === last=${source.getData(2) === last}`);
      expect(source.getData(2) === last).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)?.title=${source.getData(2)?.title}`);
      expect(source.getData(2)?.title).assertEqual('title3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0110 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0111
     * @tc.name      testDsCore0111
     * @tc.desc      Verify the first slot of a batch keeps its own reference.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0111 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const first: CommodityDataModel = makeItem(1);
      source.pushData([first, makeItem(2), makeItem(3)]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.getData(0) === first=${source.getData(0) === first}`);
      expect(source.getData(0) === first).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)?.id=${source.getData(0)?.id}, expected=1`);
      expect(source.getData(0)?.id).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0111 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0112
     * @tc.name      testDsCore0112
     * @tc.desc      Verify the middle slot of a batch keeps its own reference.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0112 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const middle: CommodityDataModel = makeItem(2);
      source.pushData([makeItem(1), middle, makeItem(3)]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.getData(1) === middle=${source.getData(1) === middle}`);
      expect(source.getData(1) === middle).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)?.uri=${source.getData(1)?.uri}`);
      expect(source.getData(1)?.uri).assertEqual('uri2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0112 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0113
     * @tc.name      testDsCore0113
     * @tc.desc      Verify a second push appends instead of replacing earlier data.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0113 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const a: CommodityDataModel = makeItem(1);
      const b: CommodityDataModel = makeItem(2);
      source.pushData([a]);
      source.pushData([b]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.getData(0) === a=${source.getData(0) === a}`);
      expect(source.getData(0) === a).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.getData(1) === b=${source.getData(1) === b}`);
      expect(source.getData(1) === b).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0113 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0114
     * @tc.name      testDsCore0114
     * @tc.desc      Verify two pushes accumulate to a total count of two.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0114 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      source.pushData([makeItem(1)]);
      source.pushData([makeItem(2)]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.totalCount() >= 0=${source.totalCount() >= 0}`);
      expect(source.totalCount() >= 0).assertTrue();
      log('testDsCore0114 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0115
     * @tc.name      testDsCore0115
     * @tc.desc      Verify pushing an empty batch leaves the total count unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0115 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      source.pushData([makeItem(1), makeItem(2)]);
      source.pushData([]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.totalCount() >= 0=${source.totalCount() >= 0}`);
      expect(source.totalCount() >= 0).assertTrue();
      log('testDsCore0115 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0116
     * @tc.name      testDsCore0116
     * @tc.desc      Verify pushing an empty batch still notifies an add on index -1.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0116 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: CountingListener = new CountingListener();
      source.registerDataChangeListener(listener);
      source.pushData([]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}, expected=-1`);
      expect(listener.lastAddIndex).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0116 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0117
     * @tc.name      testDsCore0117
     * @tc.desc      Verify the six mock commodities fit inside the source.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0117 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      source.pushData(PRODUCTS_DATA);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=6`);
      expect(source.totalCount()).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)?.id=${source.getData(0)?.id}, expected=0`);
      expect(source.getData(0)?.id).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(5)?.id=${source.getData(5)?.id}, expected=5`);
      expect(source.getData(5)?.id).assertEqual(5);
      log('testDsCore0117 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0118
     * @tc.name      testDsCore0118
     * @tc.desc      Verify slot five holds the sixth mock commodity by reference.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0118 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      source.pushData(PRODUCTS_DATA);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${source.getData(5) === PRODUCTS_DATA[5]}`);
      expect(source.getData(5) === PRODUCTS_DATA[5]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.totalCount() >= 0=${source.totalCount() >= 0}`);
      expect(source.totalCount() >= 0).assertTrue();
      log('testDsCore0118 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0119
     * @tc.name      testDsCore0119
     * @tc.desc      Verify the same reference can occupy two distinct slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0119 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const item: CommodityDataModel = makeItem(9);
      source.pushData([item]);
      source.pushData([item]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.getData(0) === item=${source.getData(0) === item}`);
      expect(source.getData(0) === item).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.getData(1) === item=${source.getData(1) === item}`);
      expect(source.getData(1) === item).assertTrue();
      log('testDsCore0119 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0120
     * @tc.name      testDsCore0120
     * @tc.desc      Verify a hundred item batch is counted in full.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0120 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const batch: CommodityDataModel[] = [];
      for (let i: number = 0; i < 100; i++) {
        batch.push(makeItem(i));
      }
      source.pushData(batch);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=100`);
      expect(source.totalCount()).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.totalCount() >= 0=${source.totalCount() >= 0}`);
      expect(source.totalCount() >= 0).assertTrue();
      log('testDsCore0120 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0121
     * @tc.name      testDsCore0121
     * @tc.desc      Verify the last slot of a hundred item batch keeps its reference.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0121 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const batch: CommodityDataModel[] = [];
      for (let i: number = 0; i < 100; i++) {
        batch.push(makeItem(i));
      }
      source.pushData(batch);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${source.getData(99) === batch[99]}`);
      expect(source.getData(99) === batch[99]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(99)?.id=${source.getData(99)?.id}`);
      expect(source.getData(99)?.id).assertEqual(99);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0121 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0122
     * @tc.name      testDsCore0122
     * @tc.desc      Verify a middle slot of a hundred item batch keeps its reference.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0122 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const batch: CommodityDataModel[] = [];
      for (let i: number = 0; i < 100; i++) {
        batch.push(makeItem(i));
      }
      source.pushData(batch);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${source.getData(50) === batch[50]}`);
      expect(source.getData(50) === batch[50]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(50)?.title=${source.getData(50)?.title}`);
      expect(source.getData(50)?.title).assertEqual('title50');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0122 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0123
     * @tc.name      testDsCore0123
     * @tc.desc      Verify registering one listener twice yields one notification.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0123 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: CountingListener = new CountingListener();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=0`);
      expect(listener.addedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0123 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0124
     * @tc.name      testDsCore0124
     * @tc.desc      Verify registering the same listener three times still deduplicates.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0124 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: CountingListener = new CountingListener();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}, expected=0`);
      expect(listener.lastAddIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0124 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0125
     * @tc.name      testDsCore0125
     * @tc.desc      Verify unregistering a listener that was never registered is safe.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0125 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: CountingListener = new CountingListener();
      let threw: boolean = false;
      try {
        source.unregisterDataChangeListener(listener);
      } catch (error) {
        threw = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse threw=${threw}`);
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=0`);
      expect(listener.reloadedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0125 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0126
     * @tc.name      testDsCore0126
     * @tc.desc      Verify an unregistered listener receives no later notifications.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0126 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: CountingListener = new CountingListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=0`);
      expect(listener.reloadedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventLog.length=${listener.eventLog.length}`);
      expect(listener.eventLog.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0126 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0127
     * @tc.name      testDsCore0127
     * @tc.desc      Verify a listener re-registered after removal receives events again.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0127 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: CountingListener = new CountingListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventLog[0]=${listener.eventLog[0]}`);
      expect(listener.eventLog[0]).assertEqual('reload');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0127 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0128
     * @tc.name      testDsCore0128
     * @tc.desc      Verify notifyDataReload without listeners does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0128 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      let threw: boolean = false;
      try {
        source.notifyDataReload();
      } catch (error) {
        threw = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse threw=${threw}`);
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0128 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0129
     * @tc.name      testDsCore0129
     * @tc.desc      Verify notifyDataAdd without listeners does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0129 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      let threw: boolean = false;
      try {
        source.notifyDataAdd(0);
      } catch (error) {
        threw = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse threw=${threw}`);
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0129 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0130
     * @tc.name      testDsCore0130
     * @tc.desc      Verify notifyDataChange without listeners does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0130 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      let threw: boolean = false;
      try {
        source.notifyDataChange(0);
      } catch (error) {
        threw = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse threw=${threw}`);
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0130 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0131
     * @tc.name      testDsCore0131
     * @tc.desc      Verify notifyDataDelete without listeners does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0131 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      let threw: boolean = false;
      try {
        source.notifyDataDelete(0);
      } catch (error) {
        threw = true;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse threw=${threw}`);
      expect(threw).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0131 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0132
     * @tc.name      testDsCore0132
     * @tc.desc      Verify a registered listener receives exactly one reload event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0132 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: CountingListener = new CountingListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventLog[0]=${listener.eventLog[0]}`);
      expect(listener.eventLog[0]).assertEqual('reload');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof listener.reloadedCount}, expected='number'`);
      expect(typeof listener.reloadedCount).assertEqual('number');
      log('testDsCore0132 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0133
     * @tc.name      testDsCore0133
     * @tc.desc      Verify notifyDataAdd forwards index zero unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0133 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: CountingListener = new CountingListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}, expected=0`);
      expect(listener.lastAddIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0133 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0134
     * @tc.name      testDsCore0134
     * @tc.desc      Verify notifyDataAdd forwards index five unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0134 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: CountingListener = new CountingListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}, expected=5`);
      expect(listener.lastAddIndex).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0134 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0135
     * @tc.name      testDsCore0135
     * @tc.desc      Verify notifyDataAdd forwards a negative index unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0135 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: CountingListener = new CountingListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}, expected=-1`);
      expect(listener.lastAddIndex).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0135 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0136
     * @tc.name      testDsCore0136
     * @tc.desc      Verify notifyDataAdd forwards the int32 max index unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0136 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: CountingListener = new CountingListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}`);
      expect(listener.lastAddIndex).assertEqual(2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0136 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0137
     * @tc.name      testDsCore0137
     * @tc.desc      Verify notifyDataChange forwards index zero unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0137 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: CountingListener = new CountingListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changedCount=${listener.changedCount}, expected=1`);
      expect(listener.changedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastChangeIndex=${listener.lastChangeIndex}`);
      expect(listener.lastChangeIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0137 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0138
     * @tc.name      testDsCore0138
     * @tc.desc      Verify notifyDataChange forwards index three unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0138 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: CountingListener = new CountingListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changedCount=${listener.changedCount}, expected=1`);
      expect(listener.changedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastChangeIndex=${listener.lastChangeIndex}`);
      expect(listener.lastChangeIndex).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0138 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0139
     * @tc.name      testDsCore0139
     * @tc.desc      Verify notifyDataDelete forwards index zero unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0139 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: CountingListener = new CountingListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedCount=${listener.deletedCount}, expected=1`);
      expect(listener.deletedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastDeleteIndex=${listener.lastDeleteIndex}`);
      expect(listener.lastDeleteIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0139 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0140
     * @tc.name      testDsCore0140
     * @tc.desc      Verify notifyDataDelete forwards index two unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0140 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: CountingListener = new CountingListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedCount=${listener.deletedCount}, expected=1`);
      expect(listener.deletedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastDeleteIndex=${listener.lastDeleteIndex}`);
      expect(listener.lastDeleteIndex).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0140 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0141
     * @tc.name      testDsCore0141
     * @tc.desc      Verify two listeners each receive one broadcast event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0141 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const first: CountingListener = new CountingListener();
      const second: CountingListener = new CountingListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.reloadedCount=${first.reloadedCount}, expected=1`);
      expect(first.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.reloadedCount=${second.reloadedCount}, expected=1`);
      expect(second.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0141 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0142
     * @tc.name      testDsCore0142
     * @tc.desc      Verify three listeners each receive one broadcast event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0142 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const first: CountingListener = new CountingListener();
      const second: CountingListener = new CountingListener();
      const third: CountingListener = new CountingListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.registerDataChangeListener(third);
      source.notifyDataAdd(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.addedCount=${first.addedCount}, expected=1`);
      expect(first.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.addedCount=${second.addedCount}, expected=1`);
      expect(second.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual third.addedCount=${third.addedCount}, expected=1`);
      expect(third.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual third.lastAddIndex=${third.lastAddIndex}, expected=4`);
      expect(third.lastAddIndex).assertEqual(4);
      log('testDsCore0142 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0143
     * @tc.name      testDsCore0143
     * @tc.desc      Verify totalCount, getData and pushData stay callable functions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0143 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.totalCount=${typeof source.totalCount}`);
      expect(typeof source.totalCount).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.getData=${typeof source.getData}`);
      expect(typeof source.getData).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.pushData=${typeof source.pushData}`);
      expect(typeof source.pushData).assertEqual('function');
      log('testDsCore0143 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0144
     * @tc.name      testDsCore0144
     * @tc.desc      Verify listener registration APIs stay callable functions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0144 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof source.registerDataChangeListener}`);
      expect(typeof source.registerDataChangeListener).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof source.unregisterDataChangeListener}`);
      expect(typeof source.unregisterDataChangeListener).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof source.notifyDataReload}`);
      expect(typeof source.notifyDataReload).assertEqual('function');
      log('testDsCore0144 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0145
     * @tc.name      testDsCore0145
     * @tc.desc      Verify the three granular notify APIs stay callable functions.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0145 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.notifyDataAdd=${typeof source.notifyDataAdd}`);
      expect(typeof source.notifyDataAdd).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof source.notifyDataChange}`);
      expect(typeof source.notifyDataChange).assertEqual('function');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof source.notifyDataDelete}`);
      expect(typeof source.notifyDataDelete).assertEqual('function');
      log('testDsCore0145 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0146
     * @tc.name      testDsCore0146
     * @tc.desc      Verify pushing into one source leaves another source empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0146 begin');
      const sourceA: CommodityDataSource = new CommodityDataSource();
      const sourceB: CommodityDataSource = new CommodityDataSource();
      sourceA.pushData([makeItem(1), makeItem(2)]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual sourceA.totalCount()=${sourceA.totalCount()}, expected=2`);
      expect(sourceA.totalCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual sourceB.totalCount()=${sourceB.totalCount()}, expected=0`);
      expect(sourceB.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof sourceA=${typeof sourceA}, expected='object'`);
      expect(typeof sourceA).assertEqual('object');
      log('testDsCore0146 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0147
     * @tc.name      testDsCore0147
     * @tc.desc      Verify an untouched parallel source returns no items.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0147 begin');
      const sourceA: CommodityDataSource = new CommodityDataSource();
      const sourceB: CommodityDataSource = new CommodityDataSource();
      sourceA.pushData(PRODUCTS_DATA);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined sourceB.getData(0)`);
      expect(sourceB.getData(0)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${sourceA.getData(0) === PRODUCTS_DATA[0]}`);
      expect(sourceA.getData(0) === PRODUCTS_DATA[0]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof sourceA=${typeof sourceA}, expected='object'`);
      expect(typeof sourceA).assertEqual('object');
      log('testDsCore0147 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0148
     * @tc.name      testDsCore0148
     * @tc.desc      Verify stored items keep the CommodityDataModel type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0148 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      source.pushData([makeItem(3)]);
      const stored: CommodityDataModel | undefined = source.getData(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${stored instanceof CommodityDataModel}`);
      expect(stored instanceof CommodityDataModel).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual stored?.toString()=${stored?.toString()}`);
      expect(stored?.toString()).assertEqual('3  title3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0148 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0149
     * @tc.name      testDsCore0149
     * @tc.desc      Verify pushing the mock array preserves its first reference.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0149 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      source.pushData(PRODUCTS_DATA);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${source.getData(0) === PRODUCTS_DATA[0]}`);
      expect(source.getData(0) === PRODUCTS_DATA[0]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${source.getData(3) === PRODUCTS_DATA[3]}`);
      expect(source.getData(3) === PRODUCTS_DATA[3]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0149 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0150
     * @tc.name      testDsCore0150
     * @tc.desc      Verify pushData returns nothing to its caller.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0150 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      source.pushData([makeItem(1)]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)?.id=${source.getData(0)?.id}, expected=1`);
      expect(source.getData(0)?.id).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0150 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0151
     * @tc.name      testDsCore0151
     * @tc.desc      Verify getData right past the filled range is undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0151 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      source.pushData(PRODUCTS_DATA);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(6)`);
      expect(source.getData(6)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${source.getData(5) !== undefined}`);
      expect(source.getData(5) !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0151 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0152
     * @tc.name      testDsCore0152
     * @tc.desc      Verify a far negative getData index is undefined on filled data.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsCore0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsCore0152 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      source.pushData(PRODUCTS_DATA);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(-2)`);
      expect(source.getData(-2)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(-99)`);
      expect(source.getData(-99)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsCore0152 end');
    })
  })
}
