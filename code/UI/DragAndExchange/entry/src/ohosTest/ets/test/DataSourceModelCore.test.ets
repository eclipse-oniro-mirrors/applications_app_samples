/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AppInfo, DataSource } from '../../../main/ets/bridge/DragAndExchangeBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'DataSourceModelCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function makeItem(index: number): AppInfo {
  return new AppInfo('', 'S' + String(index), true);
}

function buildSource(count: number): DataSource {
  const source: DataSource = new DataSource();
  for (let i: number = 1; i <= count; i++) {
    source.pushData(makeItem(i));
  }
  return source;
}

/**
 * Mock DataChangeListener used by DataSource test cases.
 */
class DsMockListener implements DataChangeListener {
  reloadedCount: number = 0;
  addedIndexes: number[] = [];
  deletedIndexes: number[] = [];
  changedIndexes: number[] = [];
  movedCount: number = 0;
  moveFrom: number = -1;
  moveTo: number = -1;

  onDataReloaded(): void {
    this.reloadedCount++;
  }

  onDataAdded(index: number): void {
    this.addedIndexes.push(index);
  }

  onDataAdd(index: number): void {
    this.addedIndexes.push(index);
  }

  onDataMoved(from: number, to: number): void {
    this.moveFrom = from;
    this.moveTo = to;
    this.movedCount++;
  }

  onDataMove(from: number, to: number): void {
    this.moveFrom = from;
    this.moveTo = to;
    this.movedCount++;
  }

  onDataDeleted(index: number): void {
    this.deletedIndexes.push(index);
  }

  onDataDelete(index: number): void {
    this.deletedIndexes.push(index);
  }

  onDataChanged(index: number): void {
    this.changedIndexes.push(index);
  }

  onDataChange(index: number): void {
    this.changedIndexes.push(index);
  }

  onDatasetChange(operations: Object[]): void {
    this.reloadedCount++;
  }
}

export default function dataSourceModelCoreTest(): void {
  describe('DataSourceModelCoreTest', () => {
    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0201
     * @tc.name      testDataSourceModel0201
     * @tc.desc      Verify a fresh DataSource reports zero total count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0201 begin');
      const source: DataSource = new DataSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      log('testDataSourceModel0201 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0202
     * @tc.name      testDataSourceModel0202
     * @tc.desc      Verify a fresh DataSource returns undefined for index zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0202 begin');
      const source: DataSource = new DataSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(0)`);
      expect(source.getData(0)).assertUndefined();
      log('testDataSourceModel0202 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0203
     * @tc.name      testDataSourceModel0203
     * @tc.desc      Verify one push makes the total count one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0203 begin');
      const source: DataSource = new DataSource();
      source.pushData(makeItem(1));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      log('testDataSourceModel0203 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0204
     * @tc.name      testDataSourceModel0204
     * @tc.desc      Verify three pushes make the total count three.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0204 begin');
      const source: DataSource = buildSource(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=3`);
      expect(source.totalCount()).assertEqual(3);
      log('testDataSourceModel0204 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0205
     * @tc.name      testDataSourceModel0205
     * @tc.desc      Verify push order keeps the first item at index zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0205 begin');
      const source: DataSource = buildSource(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S1');
      log('testDataSourceModel0205 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0206
     * @tc.name      testDataSourceModel0206
     * @tc.desc      Verify push order keeps the last item at the tail index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0206 begin');
      const source: DataSource = buildSource(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2).name=${source.getData(2).name}`);
      expect(source.getData(2).name).assertEqual('S3');
      log('testDataSourceModel0206 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0207
     * @tc.name      testDataSourceModel0207
     * @tc.desc      Verify getData returns the same pushed object reference.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0207 begin');
      const source: DataSource = new DataSource();
      const pushed: AppInfo = makeItem(9);
      source.pushData(pushed);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=pushed`);
      expect(source.getData(0)).assertEqual(pushed);
      log('testDataSourceModel0207 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0208
     * @tc.name      testDataSourceModel0208
     * @tc.desc      Verify setData replaces the item at the target index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0208 begin');
      const source: DataSource = buildSource(3);
      const replacement: AppInfo = makeItem(99);
      source.setData(0, replacement);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=replacement`);
      expect(source.getData(0)).assertEqual(replacement);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S99');
      log('testDataSourceModel0208 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0209
     * @tc.name      testDataSourceModel0209
     * @tc.desc      Verify setData on one index leaves other indexes untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0209 begin');
      const source: DataSource = buildSource(4);
      source.setData(1, makeItem(77));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2).name=${source.getData(2).name}`);
      expect(source.getData(2).name).assertEqual('S3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(3).name=${source.getData(3).name}`);
      expect(source.getData(3).name).assertEqual('S4');
      log('testDataSourceModel0209 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0210
     * @tc.name      testDataSourceModel0210
     * @tc.desc      Verify setData on an existing index keeps the total count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0210 begin');
      const source: DataSource = buildSource(5);
      source.setData(2, makeItem(50));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=5`);
      expect(source.totalCount()).assertEqual(5);
      log('testDataSourceModel0210 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0211
     * @tc.name      testDataSourceModel0211
     * @tc.desc      Verify getData at the tail boundary returns undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0211 begin');
      const source: DataSource = buildSource(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(4)`);
      expect(source.getData(4)).assertUndefined();
      log('testDataSourceModel0211 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0212
     * @tc.name      testDataSourceModel0212
     * @tc.desc      Verify getData far beyond the range returns undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0212 begin');
      const source: DataSource = buildSource(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(40)`);
      expect(source.getData(40)).assertUndefined();
      log('testDataSourceModel0212 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0213
     * @tc.name      testDataSourceModel0213
     * @tc.desc      Verify getData with a negative index returns undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0213 begin');
      const source: DataSource = buildSource(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(-1)`);
      expect(source.getData(-1)).assertUndefined();
      log('testDataSourceModel0213 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0214
     * @tc.name      testDataSourceModel0214
     * @tc.desc      Verify setData at the tail index grows the total count by one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0214 begin');
      const source: DataSource = buildSource(3);
      source.setData(3, makeItem(4));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=4`);
      expect(source.totalCount()).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(3).name=${source.getData(3).name}`);
      expect(source.getData(3).name).assertEqual('S4');
      log('testDataSourceModel0214 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0215
     * @tc.name      testDataSourceModel0215
     * @tc.desc      Verify tail setData leaves the middle range untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0215 begin');
      const source: DataSource = buildSource(3);
      source.setData(3, makeItem(4));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2).name=${source.getData(2).name}`);
      expect(source.getData(2).name).assertEqual('S3');
      log('testDataSourceModel0215 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0216
     * @tc.name      testDataSourceModel0216
     * @tc.desc      Verify totalCount stays a number after push operations.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0216 begin');
      const source: DataSource = buildSource(3);
      const count: number = source.totalCount();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof count=${typeof count}, expected='number'`);
      expect(typeof count).assertEqual('number');
      log('testDataSourceModel0216 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0217
     * @tc.name      testDataSourceModel0217
     * @tc.desc      Verify getData returns an object typed value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0217 begin');
      const source: DataSource = buildSource(2);
      const item: AppInfo = source.getData(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue item instanceof AppInfo=${item instanceof AppInfo}`);
      expect(item instanceof AppInfo).assertTrue();
      log('testDataSourceModel0217 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0218
     * @tc.name      testDataSourceModel0218
     * @tc.desc      Verify a registered listener receives one reload notification.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0218 begin');
      const source: DataSource = new DataSource();
      const listener: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      log('testDataSourceModel0218 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0219
     * @tc.name      testDataSourceModel0219
     * @tc.desc      Verify duplicate registration only notifies once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0219 begin');
      const source: DataSource = new DataSource();
      const listener: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      log('testDataSourceModel0219 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0220
     * @tc.name      testDataSourceModel0220
     * @tc.desc      Verify two distinct listeners both receive reload notifications.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0220 begin');
      const source: DataSource = new DataSource();
      const first: DsMockListener = new DsMockListener();
      const second: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.reloadedCount=${first.reloadedCount}, expected=1`);
      expect(first.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.reloadedCount=${second.reloadedCount}, expected=1`);
      expect(second.reloadedCount).assertEqual(1);
      log('testDataSourceModel0220 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0221
     * @tc.name      testDataSourceModel0221
     * @tc.desc      Verify an unregistered listener stops receiving notifications.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0221 begin');
      const source: DataSource = new DataSource();
      const listener: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=0`);
      expect(listener.reloadedCount).assertEqual(0);
      log('testDataSourceModel0221 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0222
     * @tc.name      testDataSourceModel0222
     * @tc.desc      Verify unregistering a stranger listener keeps others notified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0222 begin');
      const source: DataSource = new DataSource();
      const kept: DsMockListener = new DsMockListener();
      const stranger: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(kept);
      source.unregisterDataChangeListener(stranger);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual kept.reloadedCount=${kept.reloadedCount}, expected=1`);
      expect(kept.reloadedCount).assertEqual(1);
      log('testDataSourceModel0222 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0223
     * @tc.name      testDataSourceModel0223
     * @tc.desc      Verify notifyDataAdd forwards the exact index to listeners.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0223 begin');
      const source: DataSource = new DataSource();
      const listener: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes.length=${listener.addedIndexes.length}`);
      expect(listener.addedIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes[0]=${listener.addedIndexes[0]}`);
      expect(listener.addedIndexes[0]).assertEqual(3);
      log('testDataSourceModel0223 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0224
     * @tc.name      testDataSourceModel0224
     * @tc.desc      Verify notifyDataChange forwards the exact index to listeners.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0224 begin');
      const source: DataSource = new DataSource();
      const listener: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.changedIndexes.length}, expected=1`);
      expect(listener.changedIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changedIndexes[0]=${listener.changedIndexes[0]}`);
      expect(listener.changedIndexes[0]).assertEqual(2);
      log('testDataSourceModel0224 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0225
     * @tc.name      testDataSourceModel0225
     * @tc.desc      Verify notifyDataMove forwards both indexes to listeners.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0225 begin');
      const source: DataSource = new DataSource();
      const listener: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(1, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.movedCount=${listener.movedCount}, expected=1`);
      expect(listener.movedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFrom=${listener.moveFrom}, expected=1`);
      expect(listener.moveFrom).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveTo=${listener.moveTo}, expected=3`);
      expect(listener.moveTo).assertEqual(3);
      log('testDataSourceModel0225 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0226
     * @tc.name      testDataSourceModel0226
     * @tc.desc      Verify two reload notifications are counted separately.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0226 begin');
      const source: DataSource = new DataSource();
      const listener: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=2`);
      expect(listener.reloadedCount).assertEqual(2);
      log('testDataSourceModel0226 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0227
     * @tc.name      testDataSourceModel0227
     * @tc.desc      Verify pushData auto-notifies listeners with the new index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0227 begin');
      const source: DataSource = new DataSource();
      const listener: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(listener);
      source.pushData(makeItem(1));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes.length=${listener.addedIndexes.length}`);
      expect(listener.addedIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes[0]=${listener.addedIndexes[0]}`);
      expect(listener.addedIndexes[0]).assertEqual(0);
      log('testDataSourceModel0227 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0228
     * @tc.name      testDataSourceModel0228
     * @tc.desc      Verify consecutive pushes notify indexes zero and one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0228 begin');
      const source: DataSource = new DataSource();
      const listener: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(listener);
      source.pushData(makeItem(1));
      source.pushData(makeItem(2));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes.length=${listener.addedIndexes.length}`);
      expect(listener.addedIndexes.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes[0]=${listener.addedIndexes[0]}`);
      expect(listener.addedIndexes[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes[1]=${listener.addedIndexes[1]}`);
      expect(listener.addedIndexes[1]).assertEqual(1);
      log('testDataSourceModel0228 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0229
     * @tc.name      testDataSourceModel0229
     * @tc.desc      Verify notifications without listeners cause no failure.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0229 begin');
      const source: DataSource = buildSource(2);
      source.notifyDataReload();
      source.notifyDataAdd(0);
      source.notifyDataChange(0);
      source.notifyDataMove(0, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      log('testDataSourceModel0229 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0230
     * @tc.name      testDataSourceModel0230
     * @tc.desc      Verify three listeners each receive one reload notification.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0230 begin');
      const source: DataSource = new DataSource();
      const first: DsMockListener = new DsMockListener();
      const second: DsMockListener = new DsMockListener();
      const third: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.registerDataChangeListener(third);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.reloadedCount=${first.reloadedCount}, expected=1`);
      expect(first.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.reloadedCount=${second.reloadedCount}, expected=1`);
      expect(second.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual third.reloadedCount=${third.reloadedCount}, expected=1`);
      expect(third.reloadedCount).assertEqual(1);
      log('testDataSourceModel0230 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0231
     * @tc.name      testDataSourceModel0231
     * @tc.desc      Verify notifyDataMove passes zero-zero moves through.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0231 begin');
      const source: DataSource = new DataSource();
      const listener: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(0, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.movedCount=${listener.movedCount}, expected=1`);
      expect(listener.movedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFrom=${listener.moveFrom}, expected=0`);
      expect(listener.moveFrom).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveTo=${listener.moveTo}, expected=0`);
      expect(listener.moveTo).assertEqual(0);
      log('testDataSourceModel0231 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0232
     * @tc.name      testDataSourceModel0232
     * @tc.desc      Verify notifyDataAdd passes negative indexes through unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0232 begin');
      const source: DataSource = new DataSource();
      const listener: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes[0]=${listener.addedIndexes[0]}`);
      expect(listener.addedIndexes[0]).assertEqual(-1);
      log('testDataSourceModel0232 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0233
     * @tc.name      testDataSourceModel0233
     * @tc.desc      Verify notifyDataChange passes out-of-range indexes through.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0233 begin');
      const source: DataSource = buildSource(2);
      const listener: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changedIndexes[0]=${listener.changedIndexes[0]}`);
      expect(listener.changedIndexes[0]).assertEqual(10);
      log('testDataSourceModel0233 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0234
     * @tc.name      testDataSourceModel0234
     * @tc.desc      Verify register then unregister then register notifies again.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0234 begin');
      const source: DataSource = new DataSource();
      const listener: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      log('testDataSourceModel0234 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0235
     * @tc.name      testDataSourceModel0235
     * @tc.desc      Verify double unregister of one listener causes no failure.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0235 begin');
      const source: DataSource = new DataSource();
      const listener: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      log('testDataSourceModel0235 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0236
     * @tc.name      testDataSourceModel0236
     * @tc.desc      Verify two listeners survive a single unregister precisely.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0236 begin');
      const source: DataSource = new DataSource();
      const removed: DsMockListener = new DsMockListener();
      const kept: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(removed);
      source.registerDataChangeListener(kept);
      source.unregisterDataChangeListener(removed);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual removed.reloadedCount=${removed.reloadedCount}, expected=0`);
      expect(removed.reloadedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual kept.reloadedCount=${kept.reloadedCount}, expected=1`);
      expect(kept.reloadedCount).assertEqual(1);
      log('testDataSourceModel0236 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0237
     * @tc.name      testDataSourceModel0237
     * @tc.desc      Verify a mixed push set notify sequence keeps counters exact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0237 begin');
      const source: DataSource = new DataSource();
      const listener: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(listener);
      source.pushData(makeItem(1));
      source.pushData(makeItem(2));
      source.setData(0, makeItem(9));
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes.length=${listener.addedIndexes.length}`);
      expect(listener.addedIndexes.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.changedIndexes.length}, expected=0`);
      expect(listener.changedIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      log('testDataSourceModel0237 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0238
     * @tc.name      testDataSourceModel0238
     * @tc.desc      Verify one hundred pushes all notify in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0238 begin');
      const source: DataSource = new DataSource();
      const listener: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(listener);
      for (let i: number = 1; i <= 100; i++) {
        source.pushData(makeItem(i));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes.length=${listener.addedIndexes.length}`);
      expect(listener.addedIndexes.length).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes[99]=${listener.addedIndexes[99]}`);
      expect(listener.addedIndexes[99]).assertEqual(99);
      log('testDataSourceModel0238 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0239
     * @tc.name      testDataSourceModel0239
     * @tc.desc      Verify one hundred pushes end with a total count of one hundred.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0239 begin');
      const source: DataSource = buildSource(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=100`);
      expect(source.totalCount()).assertEqual(100);
      log('testDataSourceModel0239 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0240
     * @tc.name      testDataSourceModel0240
     * @tc.desc      Verify the hundredth pushed item keeps its name order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0240 begin');
      const source: DataSource = buildSource(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(99).name=${source.getData(99).name}`);
      expect(source.getData(99).name).assertEqual('S100');
      log('testDataSourceModel0240 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0241
     * @tc.name      testDataSourceModel0241
     * @tc.desc      Verify Chinese item names survive push and get round trips.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0241 begin');
      const source: DataSource = new DataSource();
      const item: AppInfo = new AppInfo('', '应用一', true);
      source.pushData(item);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('应用一');
      log('testDataSourceModel0241 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0242
     * @tc.name      testDataSourceModel0242
     * @tc.desc      Verify a full replace loop keeps names aligned to indexes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0242 begin');
      const source: DataSource = buildSource(5);
      for (let i: number = 0; i < 5; i++) {
        source.setData(i, makeItem(10 + i));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('S10');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(4).name=${source.getData(4).name}`);
      expect(source.getData(4).name).assertEqual('S14');
      log('testDataSourceModel0242 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0243
     * @tc.name      testDataSourceModel0243
     * @tc.desc      Verify tail setData grows the count and keeps a number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0243 begin');
      const source: DataSource = buildSource(2);
      source.setData(2, makeItem(3));
      const count: number = source.totalCount();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual count=${count}, expected=3`);
      expect(count).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof count=${typeof count}, expected='number'`);
      expect(typeof count).assertEqual('number');
      log('testDataSourceModel0243 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0244
     * @tc.name      testDataSourceModel0244
     * @tc.desc      Verify the replaced item is no longer returned by getData.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0244 begin');
      const source: DataSource = new DataSource();
      const original: AppInfo = makeItem(1);
      source.pushData(original);
      const replacement: AppInfo = makeItem(2);
      source.setData(0, replacement);
      const current: AppInfo = source.getData(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual current=${current}, expected=replacement`);
      expect(current).assertEqual(replacement);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual current.name=${current.name}, expected='S2'`);
      expect(current.name).assertEqual('S2');
      log('testDataSourceModel0244 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0245
     * @tc.name      testDataSourceModel0245
     * @tc.desc      Verify unregister then push leaves the listener uninformed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0245 begin');
      const source: DataSource = new DataSource();
      const listener: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(listener);
      source.pushData(makeItem(1));
      source.pushData(makeItem(2));
      source.pushData(makeItem(3));
      source.unregisterDataChangeListener(listener);
      source.pushData(makeItem(4));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes.length=${listener.addedIndexes.length}`);
      expect(listener.addedIndexes.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=4`);
      expect(source.totalCount()).assertEqual(4);
      log('testDataSourceModel0245 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0246
     * @tc.name      testDataSourceModel0246
     * @tc.desc      Verify registering before pushes indexes add events from zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0246 begin');
      const source: DataSource = new DataSource();
      const listener: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(listener);
      source.pushData(makeItem(1));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes.length=${listener.addedIndexes.length}`);
      expect(listener.addedIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes[0]=${listener.addedIndexes[0]}`);
      expect(listener.addedIndexes[0]).assertEqual(0);
      log('testDataSourceModel0246 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0247
     * @tc.name      testDataSourceModel0247
     * @tc.desc      Verify visible flag toggles survive data source round trips.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0247 begin');
      const source: DataSource = buildSource(2);
      const item: AppInfo = source.getData(0);
      item.visible = false;
      const fetched: AppInfo = source.getData(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse fetched.visible=${fetched.visible}`);
      expect(fetched.visible).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fetched.name=${fetched.name}, expected='S1'`);
      expect(fetched.name).assertEqual('S1');
      log('testDataSourceModel0247 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0248
     * @tc.name      testDataSourceModel0248
     * @tc.desc      Verify notifyDataMove count stays one for a single move.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0248 begin');
      const source: DataSource = new DataSource();
      const listener: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(2, 3);
      source.notifyDataMove(0, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.movedCount=${listener.movedCount}, expected=2`);
      expect(listener.movedCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFrom=${listener.moveFrom}, expected=0`);
      expect(listener.moveFrom).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveTo=${listener.moveTo}, expected=1`);
      expect(listener.moveTo).assertEqual(1);
      log('testDataSourceModel0248 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0249
     * @tc.name      testDataSourceModel0249
     * @tc.desc      Verify tail setData leaves the former tail readable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0249 begin');
      const source: DataSource = buildSource(2);
      source.setData(2, makeItem(3));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1).name=${source.getData(1).name}`);
      expect(source.getData(1).name).assertEqual('S2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2).name=${source.getData(2).name}`);
      expect(source.getData(2).name).assertEqual('S3');
      log('testDataSourceModel0249 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0250
     * @tc.name      testDataSourceModel0250
     * @tc.desc      Verify a listener registered after pushes stays silent for them.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0250 begin');
      const source: DataSource = new DataSource();
      source.pushData(makeItem(1));
      const listener: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(listener);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedIndexes.length=${listener.addedIndexes.length}`);
      expect(listener.addedIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      log('testDataSourceModel0250 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0251
     * @tc.name      testDataSourceModel0251
     * @tc.desc      Verify mixed visible flags keep per-item independence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0251 begin');
      const source: DataSource = new DataSource();
      source.pushData(new AppInfo('', 'S1', false));
      source.pushData(new AppInfo('', 'S2', true));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse source.getData(0).visible=${source.getData(0).visible}`);
      expect(source.getData(0).visible).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.getData(1).visible=${source.getData(1).visible}`);
      expect(source.getData(1).visible).assertTrue();
      log('testDataSourceModel0251 end');
    })

    /**
     * @tc.number    SUB_DRAG_AND_EXCHANGE_DATASOURCEMODEL_0252
     * @tc.name      testDataSourceModel0252
     * @tc.desc      Verify reload notification after replacement keeps data intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSourceModel0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSourceModel0252 begin');
      const source: DataSource = buildSource(3);
      const listener: DsMockListener = new DsMockListener();
      source.registerDataChangeListener(listener);
      source.setData(1, makeItem(88));
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1).name=${source.getData(1).name}`);
      expect(source.getData(1).name).assertEqual('S88');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=3`);
      expect(source.totalCount()).assertEqual(3);
      log('testDataSourceModel0252 end');
    })
  })
}
