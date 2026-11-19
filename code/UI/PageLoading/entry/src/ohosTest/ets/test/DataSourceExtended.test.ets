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
const TAG: string = 'DataSourceExtendedTest';

class SequenceListener implements DataChangeListener {
  reloadedCount: number = 0;
  addedCount: number = 0;
  changedCount: number = 0;
  deletedCount: number = 0;
  lastAddIndex: number = -1000;
  lastChangeIndex: number = -1000;
  lastDeleteIndex: number = -1000;
  addIndexes: number[] = [];
  notificationHistory: string[] = [];
  addedNewCount: number = 0;
  changedNewCount: number = 0;
  deletedNewCount: number = 0;
  movedNewCount: number = 0;
  datasetChangeCount: number = 0;
  movedOldCount: number = 0;

  onDataReloaded(): void {
    this.reloadedCount++;
    this.notificationHistory.push('reload');
  }

  onDataAdd(index: number): void {
    this.addedCount++;
    this.lastAddIndex = index;
    this.addIndexes.push(index);
    this.notificationHistory.push('add:' + index);
  }

  onDataChange(index: number): void {
    this.changedCount++;
    this.lastChangeIndex = index;
    this.notificationHistory.push('change:' + index);
  }

  onDataDelete(index: number): void {
    this.deletedCount++;
    this.lastDeleteIndex = index;
    this.notificationHistory.push('delete:' + index);
  }

  onDataMove(from: number, to: number): void {
    this.movedOldCount++;
    this.notificationHistory.push('move:' + from + '>' + to);
  }

  onDataAdded(index: number): void {
    this.addedNewCount++;
  }

  onDataChanged(index: number): void {
    this.changedNewCount++;
  }

  onDataDeleted(index: number): void {
    this.deletedNewCount++;
  }

  onDataMoved(from: number, to: number): void {
    this.movedNewCount++;
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
    this.datasetChangeCount++;
  }
}

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function makeItem(id: number): CommodityDataModel {
  return new CommodityDataModel(id, 'uri' + id, 'title' + id, 'price' + id, 'views' + id, 'ins' + id);
}

export default function dataSourceExtendedTest(): void {
  describe('DataSourceExtendedTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0201
     * @tc.name      testDsExt0201
     * @tc.desc      Verify the first push on an empty source notifies add at index 0.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0201 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.pushData([makeItem(0)]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}, expected=0`);
      expect(listener.lastAddIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      log('testDsExt0201 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0202
     * @tc.name      testDsExt0202
     * @tc.desc      Verify pushing with two existing items notifies add at index 2.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0202 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.pushData([makeItem(0), makeItem(1)]);
      source.registerDataChangeListener(listener);
      source.pushData([makeItem(2)]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}, expected=2`);
      expect(listener.lastAddIndex).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsExt0202 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0203
     * @tc.name      testDsExt0203
     * @tc.desc      Verify a batch push with five existing items notifies add at the new last index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0203 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.pushData([makeItem(0), makeItem(1), makeItem(2), makeItem(3), makeItem(4)]);
      source.registerDataChangeListener(listener);
      source.pushData([makeItem(5), makeItem(6), makeItem(7)]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}, expected=7`);
      expect(listener.lastAddIndex).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=8`);
      expect(source.totalCount()).assertEqual(8);
      log('testDsExt0203 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0204
     * @tc.name      testDsExt0204
     * @tc.desc      Verify one batch push emits exactly one add notification.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0204 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.pushData(PRODUCTS_DATA);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes.length=${listener.addIndexes.length}`);
      expect(listener.addIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=6`);
      expect(source.totalCount()).assertEqual(6);
      log('testDsExt0204 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0206
     * @tc.name      testDsExt0206
     * @tc.desc      Verify push, reload, change and delete events arrive in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0206 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.pushData([makeItem(0)]);
      source.notifyDataReload();
      source.notifyDataChange(0);
      source.notifyDataDelete(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notificationHistory.length=${listener.notificationHistory.length}`);
      expect(listener.notificationHistory.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notificationHistory[0]=${listener.notificationHistory[0]}`);
      expect(listener.notificationHistory[0]).assertEqual('add:0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notificationHistory[1]=${listener.notificationHistory[1]}`);
      expect(listener.notificationHistory[1]).assertEqual('reload');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notificationHistory[2]=${listener.notificationHistory[2]}`);
      expect(listener.notificationHistory[2]).assertEqual('change:0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notificationHistory[3]=${listener.notificationHistory[3]}`);
      expect(listener.notificationHistory[3]).assertEqual('delete:0');
      log('testDsExt0206 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0207
     * @tc.name      testDsExt0207
     * @tc.desc      Verify three consecutive pushes log three add events in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0207 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.pushData([makeItem(0)]);
      source.pushData([makeItem(1)]);
      source.pushData([makeItem(2)]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=3`);
      expect(listener.addedCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[0]=${listener.addIndexes[0]}, expected=0`);
      expect(listener.addIndexes[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[1]=${listener.addIndexes[1]}, expected=1`);
      expect(listener.addIndexes[1]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[2]=${listener.addIndexes[2]}, expected=2`);
      expect(listener.addIndexes[2]).assertEqual(2);
      log('testDsExt0207 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0208
     * @tc.name      testDsExt0208
     * @tc.desc      Verify notification calls never mutate the stored dataset.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0208 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.pushData([makeItem(0), makeItem(1), makeItem(2)]);
      source.registerDataChangeListener(listener);
      source.notifyDataChange(1);
      source.notifyDataDelete(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=3`);
      expect(source.totalCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)?.id=${source.getData(1)?.id}, expected=1`);
      expect(source.getData(1)?.id).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsExt0208 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0209
     * @tc.name      testDsExt0209
     * @tc.desc      Verify a delete notification keeps the referenced item reachable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0209 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      const kept: CommodityDataModel = makeItem(9);
      source.pushData([kept]);
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.getData(0) === kept=${source.getData(0) === kept}`);
      expect(source.getData(0) === kept).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedCount=${listener.deletedCount}, expected=1`);
      expect(listener.deletedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsExt0209 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0210
     * @tc.name      testDsExt0210
     * @tc.desc      Verify a reload notification keeps totalCount unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0210 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.pushData(PRODUCTS_DATA);
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=6`);
      expect(source.totalCount()).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=2`);
      expect(listener.reloadedCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsExt0210 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0211
     * @tc.name      testDsExt0211
     * @tc.desc      Verify unregistering one listener leaves the other still notified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0211 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const first: SequenceListener = new SequenceListener();
      const second: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.unregisterDataChangeListener(first);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.reloadedCount=${first.reloadedCount}, expected=0`);
      expect(first.reloadedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.reloadedCount=${second.reloadedCount}, expected=1`);
      expect(second.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsExt0211 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0212
     * @tc.name      testDsExt0212
     * @tc.desc      Verify a re-registered listener receives notifications again.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0212 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.notifyDataChange(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changedCount=${listener.changedCount}, expected=1`);
      expect(listener.changedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastChangeIndex=${listener.lastChangeIndex}`);
      expect(listener.lastChangeIndex).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsExt0212 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0213
     * @tc.name      testDsExt0213
     * @tc.desc      Verify ten registered listeners all receive one broadcast.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0213 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listeners: SequenceListener[] = [];
      for (let i: number = 0; i < 10; i++) {
        const listener: SequenceListener = new SequenceListener();
        listeners.push(listener);
        source.registerDataChangeListener(listener);
      }
      source.notifyDataAdd(3);
      let total: number = 0;
      for (let i: number = 0; i < listeners.length; i++) {
        total += listeners[i].addedCount;
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual total=${total}, expected=10`);
      expect(total).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listeners[0].lastAddIndex=${listeners[0].lastAddIndex}`);
      expect(listeners[0].lastAddIndex).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsExt0213 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0214
     * @tc.name      testDsExt0214
     * @tc.desc      Verify repeated notifications on one index accumulate per call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0214 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(2);
      source.notifyDataChange(2);
      source.notifyDataChange(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changedCount=${listener.changedCount}, expected=3`);
      expect(listener.changedCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastChangeIndex=${listener.lastChangeIndex}`);
      expect(listener.lastChangeIndex).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      log('testDsExt0214 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0215
     * @tc.name      testDsExt0215
     * @tc.desc      Verify an int32 max index passes through add notifications.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0215 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}`);
      expect(listener.lastAddIndex).assertEqual(2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsExt0215 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0216
     * @tc.name      testDsExt0216
     * @tc.desc      Verify an int32 max index passes through change notifications.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0216 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastChangeIndex=${listener.lastChangeIndex}`);
      expect(listener.lastChangeIndex).assertEqual(2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changedCount=${listener.changedCount}, expected=1`);
      expect(listener.changedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsExt0216 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0217
     * @tc.name      testDsExt0217
     * @tc.desc      Verify an int32 max index passes through delete notifications.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0217 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastDeleteIndex=${listener.lastDeleteIndex}`);
      expect(listener.lastDeleteIndex).assertEqual(2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedCount=${listener.deletedCount}, expected=1`);
      expect(listener.deletedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsExt0217 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0218
     * @tc.name      testDsExt0218
     * @tc.desc      Verify a negative index passes through add notifications unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0218 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(-100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}`);
      expect(listener.lastAddIndex).assertEqual(-100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsExt0218 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0219
     * @tc.name      testDsExt0219
     * @tc.desc      Verify a negative index passes through delete notifications unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0219 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(-100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastDeleteIndex=${listener.lastDeleteIndex}`);
      expect(listener.lastDeleteIndex).assertEqual(-100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedCount=${listener.deletedCount}, expected=1`);
      expect(listener.deletedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsExt0219 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0220
     * @tc.name      testDsExt0220
     * @tc.desc      Verify a non-integer index passes through change notifications.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0220 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(2.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastChangeIndex=${listener.lastChangeIndex}`);
      expect(listener.lastChangeIndex).assertEqual(2.5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changedCount=${listener.changedCount}, expected=1`);
      expect(listener.changedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsExt0220 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0221
     * @tc.name      testDsExt0221
     * @tc.desc      Verify a NaN index passes through add notifications unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0221 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(NaN);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${Number.isNaN(listener.lastAddIndex)}`);
      expect(Number.isNaN(listener.lastAddIndex)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsExt0221 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0222
     * @tc.name      testDsExt0222
     * @tc.desc      Verify registration itself emits no notification.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0222 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      source.pushData([makeItem(0)]);
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notificationHistory.length=${listener.notificationHistory.length}`);
      expect(listener.notificationHistory.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=0`);
      expect(listener.reloadedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=0`);
      expect(listener.addedCount).assertEqual(0);
      log('testDsExt0222 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0223
     * @tc.name      testDsExt0223
     * @tc.desc      Verify a push before registration is never observed by the listener.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0223 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      source.pushData([makeItem(0), makeItem(1)]);
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=0`);
      expect(listener.addedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsExt0223 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0224
     * @tc.name      testDsExt0224
     * @tc.desc      Verify a late listener observes only the explicit reload call.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0224 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      source.pushData(PRODUCTS_DATA);
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notificationHistory.length=${listener.notificationHistory.length}`);
      expect(listener.notificationHistory.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notificationHistory[0]=${listener.notificationHistory[0]}`);
      expect(listener.notificationHistory[0]).assertEqual('reload');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=0`);
      expect(listener.addedCount).assertEqual(0);
      log('testDsExt0224 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0225
     * @tc.name      testDsExt0225
     * @tc.desc      Verify events from one source never reach listeners of another source.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0225 begin');
      const sourceA: CommodityDataSource = new CommodityDataSource();
      const sourceB: CommodityDataSource = new CommodityDataSource();
      const listenerB: SequenceListener = new SequenceListener();
      sourceB.registerDataChangeListener(listenerB);
      sourceA.notifyDataReload();
      sourceA.notifyDataAdd(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listenerB.notificationHistory.length=${listenerB.notificationHistory.length}`);
      expect(listenerB.notificationHistory.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listenerB.reloadedCount=${listenerB.reloadedCount}`);
      expect(listenerB.reloadedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof sourceA=${typeof sourceA}, expected='object'`);
      expect(typeof sourceA).assertEqual('object');
      log('testDsExt0225 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0226
     * @tc.name      testDsExt0226
     * @tc.desc      Verify the reload event is the first entry of a fresh notification history.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0226 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataAdd(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notificationHistory[0]=${listener.notificationHistory[0]}`);
      expect(listener.notificationHistory[0]).assertEqual('reload');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notificationHistory[1]=${listener.notificationHistory[1]}`);
      expect(listener.notificationHistory[1]).assertEqual('add:0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notificationHistory.length=${listener.notificationHistory.length}`);
      expect(listener.notificationHistory.length).assertEqual(2);
      log('testDsExt0226 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0227
     * @tc.name      testDsExt0227
     * @tc.desc      Verify one full lifecycle logs all four legacy event kinds.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0227 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.pushData([makeItem(0)]);
      source.notifyDataReload();
      source.notifyDataChange(0);
      source.notifyDataDelete(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changedCount=${listener.changedCount}, expected=1`);
      expect(listener.changedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedCount=${listener.deletedCount}, expected=1`);
      expect(listener.deletedCount).assertEqual(1);
      log('testDsExt0227 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0228
     * @tc.name      testDsExt0228
     * @tc.desc      Verify triple registration of one listener collapses into one entry.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0228 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notificationHistory.length=${listener.notificationHistory.length}`);
      expect(listener.notificationHistory.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsExt0228 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0229
     * @tc.name      testDsExt0229
     * @tc.desc      Verify structurally identical listeners receive independent events.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0229 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const first: SequenceListener = new SequenceListener();
      const second: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataChange(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.changedCount=${first.changedCount}, expected=1`);
      expect(first.changedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.changedCount=${second.changedCount}, expected=1`);
      expect(second.changedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue first !== second=${first !== second}`);
      expect(first !== second).assertTrue();
      log('testDsExt0229 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0230
     * @tc.name      testDsExt0230
     * @tc.desc      Verify one unregister does not disturb remaining listeners.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0230 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const first: SequenceListener = new SequenceListener();
      const second: SequenceListener = new SequenceListener();
      const third: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.registerDataChangeListener(third);
      source.unregisterDataChangeListener(second);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.reloadedCount=${first.reloadedCount}, expected=1`);
      expect(first.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.reloadedCount=${second.reloadedCount}, expected=0`);
      expect(second.reloadedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual third.reloadedCount=${third.reloadedCount}, expected=1`);
      expect(third.reloadedCount).assertEqual(1);
      log('testDsExt0230 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0231
     * @tc.name      testDsExt0231
     * @tc.desc      Verify two hundred single pushes grow the source to 200 items.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0231 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      for (let i: number = 0; i < 200; i++) {
        source.pushData([makeItem(i)]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=200`);
      expect(source.totalCount()).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(199)?.id=${source.getData(199)?.id}`);
      expect(source.getData(199)?.id).assertEqual(199);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)?.id=${source.getData(0)?.id}, expected=0`);
      expect(source.getData(0)?.id).assertEqual(0);
      log('testDsExt0231 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0232
     * @tc.name      testDsExt0232
     * @tc.desc      Verify two hundred pushes emit two hundred ordered add events.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0232 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      for (let i: number = 0; i < 200; i++) {
        source.pushData([makeItem(i)]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=200`);
      expect(listener.addedCount).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}, expected=199`);
      expect(listener.lastAddIndex).assertEqual(199);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[100]=${listener.addIndexes[100]}`);
      expect(listener.addIndexes[100]).assertEqual(100);
      log('testDsExt0232 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0233
     * @tc.name      testDsExt0233
     * @tc.desc      Verify mock and locally built items coexist in one batch push.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0233 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      source.pushData([PRODUCTS_DATA[0], makeItem(100), PRODUCTS_DATA[5]]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=3`);
      expect(source.totalCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${source.getData(0) === PRODUCTS_DATA[0]}`);
      expect(source.getData(0) === PRODUCTS_DATA[0]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)?.id=${source.getData(1)?.id}, expected=100`);
      expect(source.getData(1)?.id).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${source.getData(2) === PRODUCTS_DATA[5]}`);
      expect(source.getData(2) === PRODUCTS_DATA[5]).assertTrue();
      log('testDsExt0233 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0234
     * @tc.name      testDsExt0234
     * @tc.desc      Verify every slot of a six item push holds its own reference.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0234 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const batch: CommodityDataModel[] = [];
      for (let i: number = 0; i < 6; i++) {
        batch.push(makeItem(i));
      }
      source.pushData(batch);
      for (let i: number = 0; i < 6; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${source.getData(i) === batch[i]}`);
        expect(source.getData(i) === batch[i]).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.totalCount() >= 0=${source.totalCount() >= 0}`);
      expect(source.totalCount() >= 0).assertTrue();
      log('testDsExt0234 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0235
     * @tc.name      testDsExt0235
     * @tc.desc      Verify a reload notification never increments the add counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0235 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=2`);
      expect(listener.reloadedCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=0`);
      expect(listener.addedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsExt0235 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0236
     * @tc.name      testDsExt0236
     * @tc.desc      Verify an add notification never increments the reload counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0236 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      source.notifyDataAdd(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=2`);
      expect(listener.addedCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=0`);
      expect(listener.reloadedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsExt0236 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0237
     * @tc.name      testDsExt0237
     * @tc.desc      Verify a change notification never increments the reload counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0237 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(0);
      source.notifyDataChange(1);
      source.notifyDataChange(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changedCount=${listener.changedCount}, expected=3`);
      expect(listener.changedCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=0`);
      expect(listener.reloadedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsExt0237 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0238
     * @tc.name      testDsExt0238
     * @tc.desc      Verify a delete notification never increments the reload counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0238 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(0);
      source.notifyDataDelete(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedCount=${listener.deletedCount}, expected=2`);
      expect(listener.deletedCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=0`);
      expect(listener.reloadedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsExt0238 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0239
     * @tc.name      testDsExt0239
     * @tc.desc      Verify a full register-push-unregister cycle ends with stable counters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0239 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.pushData([makeItem(0), makeItem(1)]);
      source.notifyDataReload();
      source.notifyDataChange(0);
      source.unregisterDataChangeListener(listener);
      source.notifyDataDelete(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changedCount=${listener.changedCount}, expected=1`);
      expect(listener.changedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedCount=${listener.deletedCount}, expected=0`);
      expect(listener.deletedCount).assertEqual(0);
      log('testDsExt0239 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0240
     * @tc.name      testDsExt0240
     * @tc.desc      Verify unregistering the same listener twice never throws.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0240 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=0`);
      expect(listener.reloadedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsExt0240 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0241
     * @tc.name      testDsExt0241
     * @tc.desc      Verify five register-unregister rounds end in a registered state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0241 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      for (let i: number = 0; i < 5; i++) {
        source.registerDataChangeListener(listener);
        source.unregisterDataChangeListener(listener);
      }
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}, expected=0`);
      expect(listener.lastAddIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDsExt0241 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0242
     * @tc.name      testDsExt0242
     * @tc.desc      Verify legacy notifies leave the SDK26 style callbacks untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0242 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataAdd(0);
      source.notifyDataChange(0);
      source.notifyDataDelete(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedNewCount=${listener.addedNewCount}, expected=0`);
      expect(listener.addedNewCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changedNewCount=${listener.changedNewCount}`);
      expect(listener.changedNewCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedNewCount=${listener.deletedNewCount}`);
      expect(listener.deletedNewCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.datasetChangeCount=${listener.datasetChangeCount}`);
      expect(listener.datasetChangeCount).assertEqual(0);
      log('testDsExt0242 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0243
     * @tc.name      testDsExt0243
     * @tc.desc      Verify a real push never triggers the SDK26 style added callback.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0243 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.pushData([makeItem(0)]);
      source.pushData([makeItem(1)]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=2`);
      expect(listener.addedCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedNewCount=${listener.addedNewCount}, expected=0`);
      expect(listener.addedNewCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.movedNewCount=${listener.movedNewCount}, expected=0`);
      expect(listener.movedNewCount).assertEqual(0);
      log('testDsExt0243 end');
    })

    /**
     * @tc.number    SUB_PAGELOADING_DSMODEL_0244
     * @tc.name      testDsExt0244
     * @tc.desc      Verify no notify path ever emits a move event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsExt0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsExt0244 begin');
      const source: CommodityDataSource = new CommodityDataSource();
      const listener: SequenceListener = new SequenceListener();
      source.registerDataChangeListener(listener);
      source.pushData([makeItem(0), makeItem(1)]);
      source.notifyDataReload();
      source.notifyDataChange(0);
      source.notifyDataDelete(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.movedOldCount=${listener.movedOldCount}, expected=0`);
      expect(listener.movedOldCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.movedNewCount=${listener.movedNewCount}, expected=0`);
      expect(listener.movedNewCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.notificationHistory.indexOf('move:0>1')}, expected=-1`);
      expect(listener.notificationHistory.indexOf('move:0>1')).assertEqual(-1);
      log('testDsExt0244 end');
    })
  })
}
