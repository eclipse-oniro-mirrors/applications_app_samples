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
import { BasicDataSource } from '../../../main/ets/bridge/PullToRefreshTestBridge';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF814;
const TAG: string = 'PullToRefreshDataSourceCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/**
 * Test double recording every DataChangeListener callback so the notify
 * fan-out semantics of BasicDataSource can be asserted precisely.
 */
class RecorderListener implements DataChangeListener {
  reloadCount: number = 0;
  deprecatedAddedCount: number = 0;
  addIndexes: number[] = [];
  deprecatedChangedCount: number = 0;
  changeIndexes: number[] = [];
  deprecatedDeletedCount: number = 0;
  deleteIndexes: number[] = [];
  deprecatedMovedCount: number = 0;
  moveFroms: number[] = [];
  moveTos: number[] = [];
  datasetChangeCount: number = 0;

  onDataReloaded(): void {
    this.reloadCount++;
  }

  onDataAdded(index: number): void {
    this.deprecatedAddedCount++;
  }

  onDataAdd(index: number): void {
    this.addIndexes.push(index);
  }

  onDataMoved(from: number, to: number): void {
    this.deprecatedMovedCount++;
  }

  onDataMove(from: number, to: number): void {
    this.moveFroms.push(from);
    this.moveTos.push(to);
  }

  onDataDeleted(index: number): void {
    this.deprecatedDeletedCount++;
  }

  onDataDelete(index: number): void {
    this.deleteIndexes.push(index);
  }

  onDataChanged(index: number): void {
    this.deprecatedChangedCount++;
  }

  onDataChange(index: number): void {
    this.changeIndexes.push(index);
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
    this.datasetChangeCount++;
  }
}

function newSource(): BasicDataSource {
  return new BasicDataSource();
}

export default function pullToRefreshDataSourceCoreTest(): void {
  describe('PullToRefreshDataSourceCoreTest', () => {
    // ============================ 初始状态 0301-0308 ============================
    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0301
     * @tc.name      testDataSource0301
     * @tc.desc      Verify totalCount returns zero on a fresh data source.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0301 begin');
      const source: BasicDataSource = newSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      log('testDataSource0301 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0302
     * @tc.name      testDataSource0302
     * @tc.desc      Verify totalCount keeps number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0302 begin');
      const source: BasicDataSource = newSource();
      const count: number = source.totalCount();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof count=${typeof count}, expected='number'`);
      expect(typeof count).assertEqual('number');
      log('testDataSource0302 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0303
     * @tc.name      testDataSource0303
     * @tc.desc      Verify getData echoes index zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0303 begin');
      const source: BasicDataSource = newSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=0`);
      expect(source.getData(0)).assertEqual(0);
      log('testDataSource0303 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0304
     * @tc.name      testDataSource0304
     * @tc.desc      Verify getData echoes a regular positive index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0304 begin');
      const source: BasicDataSource = newSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(5)=${source.getData(5)}, expected=5`);
      expect(source.getData(5)).assertEqual(5);
      log('testDataSource0304 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0305
     * @tc.name      testDataSource0305
     * @tc.desc      Verify getData echoes a negative index verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0305 begin');
      const source: BasicDataSource = newSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(-1)=${source.getData(-1)}, expected=-1`);
      expect(source.getData(-1)).assertEqual(-1);
      log('testDataSource0305 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0306
     * @tc.name      testDataSource0306
     * @tc.desc      Verify getData echoes a large index verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0306 begin');
      const source: BasicDataSource = newSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1000)=${source.getData(1000)}, expected=1000`);
      expect(source.getData(1000)).assertEqual(1000);
      log('testDataSource0306 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0307
     * @tc.name      testDataSource0307
     * @tc.desc      Verify getData keeps number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0307 begin');
      const source: BasicDataSource = newSource();
      const value: Object = source.getData(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof value=${typeof value}, expected='number'`);
      expect(typeof value).assertEqual('number');
      log('testDataSource0307 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0308
     * @tc.name      testDataSource0308
     * @tc.desc      Verify two fresh instances behave independently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0308 begin');
      const first: BasicDataSource = newSource();
      const second: BasicDataSource = newSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first === second=${first === second}, expected=false`);
      expect(first === second).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.totalCount()=${first.totalCount()}`);
      expect(first.totalCount()).assertEqual(second.totalCount());
      log('testDataSource0308 end');
    })

    // ============================ 注册与注销 0309-0318 ============================
    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0309
     * @tc.name      testDataSource0309
     * @tc.desc      Verify one registered listener receives reload notification.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0309 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=1`);
      expect(listener.reloadCount).assertEqual(1);
      log('testDataSource0309 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0310
     * @tc.name      testDataSource0310
     * @tc.desc      Verify two registered listeners both receive reload notification.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0310 begin');
      const source: BasicDataSource = newSource();
      const first: RecorderListener = new RecorderListener();
      const second: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.reloadCount=${first.reloadCount}, expected=1`);
      expect(first.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.reloadCount=${second.reloadCount}, expected=1`);
      expect(second.reloadCount).assertEqual(1);
      log('testDataSource0310 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0311
     * @tc.name      testDataSource0311
     * @tc.desc      Verify duplicate registration keeps a single subscription.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0311 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=1`);
      expect(listener.reloadCount).assertEqual(1);
      log('testDataSource0311 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0312
     * @tc.name      testDataSource0312
     * @tc.desc      Verify listeners are notified in registration order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0312 begin');
      const source: BasicDataSource = newSource();
      const first: RecorderListener = new RecorderListener();
      const second: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataAdd(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.addIndexes.join(',')=${first.addIndexes.join(',')}`);
      expect(first.addIndexes.join(',')).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.addIndexes.join(',')=${second.addIndexes.join(',')}`);
      expect(second.addIndexes.join(',')).assertEqual('1');
      log('testDataSource0312 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0313
     * @tc.name      testDataSource0313
     * @tc.desc      Verify unregistered listener stops receiving notifications.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0313 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=0`);
      expect(listener.reloadCount).assertEqual(0);
      log('testDataSource0313 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0314
     * @tc.name      testDataSource0314
     * @tc.desc      Verify unregistering an unknown listener keeps others subscribed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0314 begin');
      const source: BasicDataSource = newSource();
      const known: RecorderListener = new RecorderListener();
      const unknown: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(known);
      source.unregisterDataChangeListener(unknown);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual known.reloadCount=${known.reloadCount}, expected=1`);
      expect(known.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual unknown.reloadCount=${unknown.reloadCount}, expected=0`);
      expect(unknown.reloadCount).assertEqual(0);
      log('testDataSource0314 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0315
     * @tc.name      testDataSource0315
     * @tc.desc      Verify one unregister removes a duplicated subscription once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0315 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=0`);
      expect(listener.reloadCount).assertEqual(0);
      log('testDataSource0315 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0316
     * @tc.name      testDataSource0316
     * @tc.desc      Verify unregistering the middle listener keeps the rest notified.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0316 begin');
      const source: BasicDataSource = newSource();
      const first: RecorderListener = new RecorderListener();
      const second: RecorderListener = new RecorderListener();
      const third: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.registerDataChangeListener(third);
      source.unregisterDataChangeListener(second);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.reloadCount=${first.reloadCount}, expected=1`);
      expect(first.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.reloadCount=${second.reloadCount}, expected=0`);
      expect(second.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual third.reloadCount=${third.reloadCount}, expected=1`);
      expect(third.reloadCount).assertEqual(1);
      log('testDataSource0316 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0317
     * @tc.name      testDataSource0317
     * @tc.desc      Verify re-registering after unregister resumes notifications.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0317 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=1`);
      expect(listener.reloadCount).assertEqual(1);
      log('testDataSource0317 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0318
     * @tc.name      testDataSource0318
     * @tc.desc      Verify constructed object is a BasicDataSource instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0318 begin');
      const source: BasicDataSource = newSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${source instanceof BasicDataSource}, expected=true`);
      expect(source instanceof BasicDataSource).assertEqual(true);
      log('testDataSource0318 end');
    })

    // ============================ notifyDataReload 0319-0326 ============================
    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0319
     * @tc.name      testDataSource0319
     * @tc.desc      Verify reload without listeners completes without crash.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0319 begin');
      const source: BasicDataSource = newSource();
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      log('testDataSource0319 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0320
     * @tc.name      testDataSource0320
     * @tc.desc      Verify single reload hits the reload counter once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0320 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=1`);
      expect(listener.reloadCount).assertEqual(1);
      log('testDataSource0320 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0321
     * @tc.name      testDataSource0321
     * @tc.desc      Verify one reload fans out to both listeners.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0321 begin');
      const source: BasicDataSource = newSource();
      const first: RecorderListener = new RecorderListener();
      const second: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.reloadCount=${first.reloadCount}, expected=1`);
      expect(first.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.reloadCount=${second.reloadCount}, expected=1`);
      expect(second.reloadCount).assertEqual(1);
      log('testDataSource0321 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0322
     * @tc.name      testDataSource0322
     * @tc.desc      Verify repeated reloads accumulate the counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0322 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataReload();
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=3`);
      expect(listener.reloadCount).assertEqual(3);
      log('testDataSource0322 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0323
     * @tc.name      testDataSource0323
     * @tc.desc      Verify reload after unregister does not notify the listener.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0323 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.unregisterDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=1`);
      expect(listener.reloadCount).assertEqual(1);
      log('testDataSource0323 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0324
     * @tc.name      testDataSource0324
     * @tc.desc      Verify reload does not trigger add change or delete callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0324 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes.length=${listener.addIndexes.length}`);
      expect(listener.addIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.changeIndexes.length}, expected=0`);
      expect(listener.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deleteIndexes.length}, expected=0`);
      expect(listener.deleteIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFroms.length=${listener.moveFroms.length}`);
      expect(listener.moveFroms.length).assertEqual(0);
      log('testDataSource0324 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0325
     * @tc.name      testDataSource0325
     * @tc.desc      Verify fresh source reports zero reloads before registration.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0325 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=0`);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      log('testDataSource0325 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0326
     * @tc.name      testDataSource0326
     * @tc.desc      Verify a listener is only notified by its own data source.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0326 begin');
      const owned: BasicDataSource = newSource();
      const other: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      owned.registerDataChangeListener(listener);
      other.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=0`);
      expect(listener.reloadCount).assertEqual(0);
      owned.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=1`);
      expect(listener.reloadCount).assertEqual(1);
      log('testDataSource0326 end');
    })

    // ============================ notifyDataAdd 0327-0336 ============================
    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0327
     * @tc.name      testDataSource0327
     * @tc.desc      Verify notifyDataAdd forwards index zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0327 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.addIndexes.join(',')}, expected='0'`);
      expect(listener.addIndexes.join(',')).assertEqual('0');
      log('testDataSource0327 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0328
     * @tc.name      testDataSource0328
     * @tc.desc      Verify notifyDataAdd forwards a regular index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0328 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.addIndexes.join(',')}, expected='5'`);
      expect(listener.addIndexes.join(',')).assertEqual('5');
      log('testDataSource0328 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0329
     * @tc.name      testDataSource0329
     * @tc.desc      Verify notifyDataAdd passes negative index through unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0329 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.addIndexes.join(',')}, expected='-1'`);
      expect(listener.addIndexes.join(',')).assertEqual('-1');
      log('testDataSource0329 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0330
     * @tc.name      testDataSource0330
     * @tc.desc      Verify notifyDataAdd passes large index through unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0330 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(999);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.addIndexes.join(',')}, expected='999'`);
      expect(listener.addIndexes.join(',')).assertEqual('999');
      log('testDataSource0330 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0331
     * @tc.name      testDataSource0331
     * @tc.desc      Verify sequential adds preserve notification order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0331 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      source.notifyDataAdd(1);
      source.notifyDataAdd(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.addIndexes.join(',')}, expected='0,1,2'`);
      expect(listener.addIndexes.join(',')).assertEqual('0,1,2');
      log('testDataSource0331 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0332
     * @tc.name      testDataSource0332
     * @tc.desc      Verify both listeners receive the same add index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0332 begin');
      const source: BasicDataSource = newSource();
      const first: RecorderListener = new RecorderListener();
      const second: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataAdd(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.addIndexes.join(',')=${first.addIndexes.join(',')}`);
      expect(first.addIndexes.join(',')).assertEqual('4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.addIndexes.join(',')=${second.addIndexes.join(',')}`);
      expect(second.addIndexes.join(',')).assertEqual('4');
      log('testDataSource0332 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0333
     * @tc.name      testDataSource0333
     * @tc.desc      Verify add after unregister does not notify the listener.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0333 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.notifyDataAdd(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes.length=${listener.addIndexes.length}`);
      expect(listener.addIndexes.length).assertEqual(0);
      log('testDataSource0333 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0334
     * @tc.name      testDataSource0334
     * @tc.desc      Verify add without listeners completes without crash.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0334 begin');
      const source: BasicDataSource = newSource();
      source.notifyDataAdd(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      log('testDataSource0334 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0335
     * @tc.name      testDataSource0335
     * @tc.desc      Verify add does not trigger reload change or delete callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0335 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=0`);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.changeIndexes.length}, expected=0`);
      expect(listener.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deleteIndexes.length}, expected=0`);
      expect(listener.deleteIndexes.length).assertEqual(0);
      log('testDataSource0335 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0336
     * @tc.name      testDataSource0336
     * @tc.desc      Verify repeated adds record every occurrence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0336 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      source.notifyDataAdd(0);
      source.notifyDataAdd(0);
      source.notifyDataAdd(0);
      source.notifyDataAdd(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.addIndexes.join(',')}`);
      expect(listener.addIndexes.join(',')).assertEqual('0,0,0,0,0');
      log('testDataSource0336 end');
    })

    // ============================ notifyDataChange 0337-0346 ============================
    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0337
     * @tc.name      testDataSource0337
     * @tc.desc      Verify notifyDataChange forwards index zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0337 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.changeIndexes.join(',')}, expected='0'`);
      expect(listener.changeIndexes.join(',')).assertEqual('0');
      log('testDataSource0337 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0338
     * @tc.name      testDataSource0338
     * @tc.desc      Verify notifyDataChange forwards a regular index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0338 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.changeIndexes.join(',')}, expected='7'`);
      expect(listener.changeIndexes.join(',')).assertEqual('7');
      log('testDataSource0338 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0339
     * @tc.name      testDataSource0339
     * @tc.desc      Verify notifyDataChange passes negative index through unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0339 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(-3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.changeIndexes.join(',')}, expected='-3'`);
      expect(listener.changeIndexes.join(',')).assertEqual('-3');
      log('testDataSource0339 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0340
     * @tc.name      testDataSource0340
     * @tc.desc      Verify sequential changes preserve notification order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0340 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(1);
      source.notifyDataChange(3);
      source.notifyDataChange(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.changeIndexes.join(',')}, expected='1,3,5'`);
      expect(listener.changeIndexes.join(',')).assertEqual('1,3,5');
      log('testDataSource0340 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0341
     * @tc.name      testDataSource0341
     * @tc.desc      Verify both listeners receive the same change index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0341 begin');
      const source: BasicDataSource = newSource();
      const first: RecorderListener = new RecorderListener();
      const second: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataChange(6);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${first.changeIndexes.join(',')}, expected='6'`);
      expect(first.changeIndexes.join(',')).assertEqual('6');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${second.changeIndexes.join(',')}, expected='6'`);
      expect(second.changeIndexes.join(',')).assertEqual('6');
      log('testDataSource0341 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0342
     * @tc.name      testDataSource0342
     * @tc.desc      Verify change after unregister does not notify the listener.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0342 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.notifyDataChange(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.changeIndexes.length}, expected=0`);
      expect(listener.changeIndexes.length).assertEqual(0);
      log('testDataSource0342 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0343
     * @tc.name      testDataSource0343
     * @tc.desc      Verify change without listeners completes without crash.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0343 begin');
      const source: BasicDataSource = newSource();
      source.notifyDataChange(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      log('testDataSource0343 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0344
     * @tc.name      testDataSource0344
     * @tc.desc      Verify change does not trigger reload add or delete callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0344 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=0`);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes.length=${listener.addIndexes.length}`);
      expect(listener.addIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deleteIndexes.length}, expected=0`);
      expect(listener.deleteIndexes.length).assertEqual(0);
      log('testDataSource0344 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0345
     * @tc.name      testDataSource0345
     * @tc.desc      Verify repeated changes record every occurrence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0345 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(0);
      source.notifyDataChange(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.changeIndexes.join(',')}, expected='0,0'`);
      expect(listener.changeIndexes.join(',')).assertEqual('0,0');
      log('testDataSource0345 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0346
     * @tc.name      testDataSource0346
     * @tc.desc      Verify change passes very large index through unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0346 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(100000);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.changeIndexes.join(',')}`);
      expect(listener.changeIndexes.join(',')).assertEqual('100000');
      log('testDataSource0346 end');
    })

    // ============================ notifyDataDelete 0347-0356 ============================
    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0347
     * @tc.name      testDataSource0347
     * @tc.desc      Verify notifyDataDelete forwards index zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0347 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deleteIndexes.join(',')}, expected='0'`);
      expect(listener.deleteIndexes.join(',')).assertEqual('0');
      log('testDataSource0347 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0348
     * @tc.name      testDataSource0348
     * @tc.desc      Verify notifyDataDelete forwards a regular index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0348 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deleteIndexes.join(',')}, expected='3'`);
      expect(listener.deleteIndexes.join(',')).assertEqual('3');
      log('testDataSource0348 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0349
     * @tc.name      testDataSource0349
     * @tc.desc      Verify notifyDataDelete passes negative index through unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0349 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(-2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deleteIndexes.join(',')}, expected='-2'`);
      expect(listener.deleteIndexes.join(',')).assertEqual('-2');
      log('testDataSource0349 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0350
     * @tc.name      testDataSource0350
     * @tc.desc      Verify sequential deletes preserve notification order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0350 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(4);
      source.notifyDataDelete(3);
      source.notifyDataDelete(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deleteIndexes.join(',')}, expected='4,3,2'`);
      expect(listener.deleteIndexes.join(',')).assertEqual('4,3,2');
      log('testDataSource0350 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0351
     * @tc.name      testDataSource0351
     * @tc.desc      Verify both listeners receive the same delete index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0351 begin');
      const source: BasicDataSource = newSource();
      const first: RecorderListener = new RecorderListener();
      const second: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataDelete(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${first.deleteIndexes.join(',')}, expected='2'`);
      expect(first.deleteIndexes.join(',')).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${second.deleteIndexes.join(',')}, expected='2'`);
      expect(second.deleteIndexes.join(',')).assertEqual('2');
      log('testDataSource0351 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0352
     * @tc.name      testDataSource0352
     * @tc.desc      Verify delete after unregister does not notify the listener.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0352 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.notifyDataDelete(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deleteIndexes.length}, expected=0`);
      expect(listener.deleteIndexes.length).assertEqual(0);
      log('testDataSource0352 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0353
     * @tc.name      testDataSource0353
     * @tc.desc      Verify delete without listeners completes without crash.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0353 begin');
      const source: BasicDataSource = newSource();
      source.notifyDataDelete(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      log('testDataSource0353 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0354
     * @tc.name      testDataSource0354
     * @tc.desc      Verify delete does not trigger reload add or change callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0354 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=0`);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes.length=${listener.addIndexes.length}`);
      expect(listener.addIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.changeIndexes.length}, expected=0`);
      expect(listener.changeIndexes.length).assertEqual(0);
      log('testDataSource0354 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0355
     * @tc.name      testDataSource0355
     * @tc.desc      Verify repeated deletes record every occurrence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0355 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(0);
      source.notifyDataDelete(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deleteIndexes.join(',')}, expected='0,0'`);
      expect(listener.deleteIndexes.join(',')).assertEqual('0,0');
      log('testDataSource0355 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0356
     * @tc.name      testDataSource0356
     * @tc.desc      Verify delete passes very large index through unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0356 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(9999);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deleteIndexes.join(',')}, expected='9999'`);
      expect(listener.deleteIndexes.join(',')).assertEqual('9999');
      log('testDataSource0356 end');
    })

    // ============================ notifyDataMove 0357-0370 ============================
    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0357
     * @tc.name      testDataSource0357
     * @tc.desc      Verify notifyDataMove forwards adjacent indexes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0357 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(0, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFroms.join(',')=${listener.moveFroms.join(',')}`);
      expect(listener.moveFroms.join(',')).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveTos.join(',')=${listener.moveTos.join(',')}`);
      expect(listener.moveTos.join(',')).assertEqual('1');
      log('testDataSource0357 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0358
     * @tc.name      testDataSource0358
     * @tc.desc      Verify notifyDataMove forwards a backward move.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0358 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(5, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFroms.join(',')=${listener.moveFroms.join(',')}`);
      expect(listener.moveFroms.join(',')).assertEqual('5');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveTos.join(',')=${listener.moveTos.join(',')}`);
      expect(listener.moveTos.join(',')).assertEqual('2');
      log('testDataSource0358 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0359
     * @tc.name      testDataSource0359
     * @tc.desc      Verify notifyDataMove passes negative from index through.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0359 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(-1, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFroms.join(',')=${listener.moveFroms.join(',')}`);
      expect(listener.moveFroms.join(',')).assertEqual('-1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveTos.join(',')=${listener.moveTos.join(',')}`);
      expect(listener.moveTos.join(',')).assertEqual('3');
      log('testDataSource0359 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0360
     * @tc.name      testDataSource0360
     * @tc.desc      Verify notifyDataMove accepts equal from and to indexes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0360 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(0, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFroms.join(',')=${listener.moveFroms.join(',')}`);
      expect(listener.moveFroms.join(',')).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveTos.join(',')=${listener.moveTos.join(',')}`);
      expect(listener.moveTos.join(',')).assertEqual('0');
      log('testDataSource0360 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0361
     * @tc.name      testDataSource0361
     * @tc.desc      Verify notifyDataMove passes large indexes through unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0361 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(1000, 2000);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFroms.join(',')=${listener.moveFroms.join(',')}`);
      expect(listener.moveFroms.join(',')).assertEqual('1000');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveTos.join(',')=${listener.moveTos.join(',')}`);
      expect(listener.moveTos.join(',')).assertEqual('2000');
      log('testDataSource0361 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0362
     * @tc.name      testDataSource0362
     * @tc.desc      Verify notifyDataMove passes negative indexes through unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0362 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(-5, -10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFroms.join(',')=${listener.moveFroms.join(',')}`);
      expect(listener.moveFroms.join(',')).assertEqual('-5');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveTos.join(',')=${listener.moveTos.join(',')}`);
      expect(listener.moveTos.join(',')).assertEqual('-10');
      log('testDataSource0362 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0363
     * @tc.name      testDataSource0363
     * @tc.desc      Verify sequential moves preserve from and to ordering.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0363 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(0, 1);
      source.notifyDataMove(1, 2);
      source.notifyDataMove(2, 3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFroms.join(',')=${listener.moveFroms.join(',')}`);
      expect(listener.moveFroms.join(',')).assertEqual('0,1,2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveTos.join(',')=${listener.moveTos.join(',')}`);
      expect(listener.moveTos.join(',')).assertEqual('1,2,3');
      log('testDataSource0363 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0364
     * @tc.name      testDataSource0364
     * @tc.desc      Verify both listeners receive identical move arguments.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0364 begin');
      const source: BasicDataSource = newSource();
      const first: RecorderListener = new RecorderListener();
      const second: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataMove(2, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.moveFroms.join(',')=${first.moveFroms.join(',')}`);
      expect(first.moveFroms.join(',')).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.moveTos.join(',')=${first.moveTos.join(',')}`);
      expect(first.moveTos.join(',')).assertEqual('4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.moveFroms.join(',')=${second.moveFroms.join(',')}`);
      expect(second.moveFroms.join(',')).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.moveTos.join(',')=${second.moveTos.join(',')}`);
      expect(second.moveTos.join(',')).assertEqual('4');
      log('testDataSource0364 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0365
     * @tc.name      testDataSource0365
     * @tc.desc      Verify move after unregister does not notify the listener.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0365 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.notifyDataMove(1, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFroms.length=${listener.moveFroms.length}`);
      expect(listener.moveFroms.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveTos.length=${listener.moveTos.length}`);
      expect(listener.moveTos.length).assertEqual(0);
      log('testDataSource0365 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0366
     * @tc.name      testDataSource0366
     * @tc.desc      Verify move without listeners completes without crash.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0366 begin');
      const source: BasicDataSource = newSource();
      source.notifyDataMove(1, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      log('testDataSource0366 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0367
     * @tc.name      testDataSource0367
     * @tc.desc      Verify move does not trigger reload add change or delete.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0367 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(1, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=0`);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes.length=${listener.addIndexes.length}`);
      expect(listener.addIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.changeIndexes.length}, expected=0`);
      expect(listener.changeIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deleteIndexes.length}, expected=0`);
      expect(listener.deleteIndexes.length).assertEqual(0);
      log('testDataSource0367 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0368
     * @tc.name      testDataSource0368
     * @tc.desc      Verify move records equal counts of from and to entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0368 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(0, 1);
      source.notifyDataMove(3, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFroms.length=${listener.moveFroms.length}`);
      expect(listener.moveFroms.length).assertEqual(listener.moveTos.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFroms.length=${listener.moveFroms.length}`);
      expect(listener.moveFroms.length).assertEqual(2);
      log('testDataSource0368 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0369
     * @tc.name      testDataSource0369
     * @tc.desc      Verify repeated moves record every occurrence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0369 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(1, 2);
      source.notifyDataMove(1, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFroms.join(',')=${listener.moveFroms.join(',')}`);
      expect(listener.moveFroms.join(',')).assertEqual('1,1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveTos.join(',')=${listener.moveTos.join(',')}`);
      expect(listener.moveTos.join(',')).assertEqual('2,2');
      log('testDataSource0369 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0370
     * @tc.name      testDataSource0370
     * @tc.desc      Verify move direction is preserved from source to target.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0370 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(1, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFroms.join(',')=${listener.moveFroms.join(',')}`);
      expect(listener.moveFroms.join(',')).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveTos.join(',')=${listener.moveTos.join(',')}`);
      expect(listener.moveTos.join(',')).assertEqual('0');
      log('testDataSource0370 end');
    })

    // ============================ 事件互斥与契约 0371-0378 ============================
    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0371
     * @tc.name      testDataSource0371
     * @tc.desc      Verify add notification does not invoke deprecated callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0371 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deprecatedAddedCount}, expected=0`);
      expect(listener.deprecatedAddedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deprecatedChangedCount}, expected=0`);
      expect(listener.deprecatedChangedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deprecatedDeletedCount}, expected=0`);
      expect(listener.deprecatedDeletedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deprecatedMovedCount}, expected=0`);
      expect(listener.deprecatedMovedCount).assertEqual(0);
      log('testDataSource0371 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0372
     * @tc.name      testDataSource0372
     * @tc.desc      Verify change notification does not invoke deprecated callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0372 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deprecatedAddedCount}, expected=0`);
      expect(listener.deprecatedAddedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deprecatedChangedCount}, expected=0`);
      expect(listener.deprecatedChangedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deprecatedDeletedCount}, expected=0`);
      expect(listener.deprecatedDeletedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deprecatedMovedCount}, expected=0`);
      expect(listener.deprecatedMovedCount).assertEqual(0);
      log('testDataSource0372 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0373
     * @tc.name      testDataSource0373
     * @tc.desc      Verify delete notification does not invoke deprecated callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0373 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deprecatedAddedCount}, expected=0`);
      expect(listener.deprecatedAddedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deprecatedChangedCount}, expected=0`);
      expect(listener.deprecatedChangedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deprecatedDeletedCount}, expected=0`);
      expect(listener.deprecatedDeletedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deprecatedMovedCount}, expected=0`);
      expect(listener.deprecatedMovedCount).assertEqual(0);
      log('testDataSource0373 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0374
     * @tc.name      testDataSource0374
     * @tc.desc      Verify move notification does not invoke deprecated callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0374 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(1, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deprecatedAddedCount}, expected=0`);
      expect(listener.deprecatedAddedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deprecatedChangedCount}, expected=0`);
      expect(listener.deprecatedChangedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deprecatedDeletedCount}, expected=0`);
      expect(listener.deprecatedDeletedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deprecatedMovedCount}, expected=0`);
      expect(listener.deprecatedMovedCount).assertEqual(0);
      log('testDataSource0374 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0375
     * @tc.name      testDataSource0375
     * @tc.desc      Verify reload notification does not invoke deprecated callbacks.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0375 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deprecatedAddedCount}, expected=0`);
      expect(listener.deprecatedAddedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deprecatedChangedCount}, expected=0`);
      expect(listener.deprecatedChangedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deprecatedDeletedCount}, expected=0`);
      expect(listener.deprecatedDeletedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deprecatedMovedCount}, expected=0`);
      expect(listener.deprecatedMovedCount).assertEqual(0);
      log('testDataSource0375 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0376
     * @tc.name      testDataSource0376
     * @tc.desc      Verify combined add change and delete hits exact counters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0376 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(1);
      source.notifyDataChange(2);
      source.notifyDataDelete(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.addIndexes.join(',')}, expected='1'`);
      expect(listener.addIndexes.join(',')).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.changeIndexes.join(',')}, expected='2'`);
      expect(listener.changeIndexes.join(',')).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deleteIndexes.join(',')}, expected='3'`);
      expect(listener.deleteIndexes.join(',')).assertEqual('3');
      log('testDataSource0376 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0377
     * @tc.name      testDataSource0377
     * @tc.desc      Verify every notify type keeps onDatasetChange untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0377 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataAdd(1);
      source.notifyDataChange(1);
      source.notifyDataDelete(1);
      source.notifyDataMove(1, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.datasetChangeCount=${listener.datasetChangeCount}`);
      expect(listener.datasetChangeCount).assertEqual(0);
      log('testDataSource0377 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0378
     * @tc.name      testDataSource0378
     * @tc.desc      Verify five notify types produce disjoint callback streams.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0378 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataAdd(1);
      source.notifyDataChange(2);
      source.notifyDataDelete(3);
      source.notifyDataMove(4, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=1`);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes.length=${listener.addIndexes.length}`);
      expect(listener.addIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.changeIndexes.length}, expected=1`);
      expect(listener.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deleteIndexes.length}, expected=1`);
      expect(listener.deleteIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFroms.length=${listener.moveFroms.length}`);
      expect(listener.moveFroms.length).assertEqual(1);
      log('testDataSource0378 end');
    })

    // ============================ 混合序列 0379-0390 ============================
    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0379
     * @tc.name      testDataSource0379
     * @tc.desc      Verify scripted mixed operations deliver to all listeners.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0379 begin');
      const source: BasicDataSource = newSource();
      const first: RecorderListener = new RecorderListener();
      const second: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataAdd(0);
      source.notifyDataChange(1);
      source.notifyDataMove(2, 3);
      source.notifyDataDelete(4);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.addIndexes.join(',')=${first.addIndexes.join(',')}`);
      expect(first.addIndexes.join(',')).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${first.changeIndexes.join(',')}, expected='1'`);
      expect(first.changeIndexes.join(',')).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.moveFroms.join(',')=${first.moveFroms.join(',')}`);
      expect(first.moveFroms.join(',')).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.moveTos.join(',')=${first.moveTos.join(',')}`);
      expect(first.moveTos.join(',')).assertEqual('3');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${first.deleteIndexes.join(',')}, expected='4'`);
      expect(first.deleteIndexes.join(',')).assertEqual('4');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.reloadCount=${first.reloadCount}, expected=1`);
      expect(first.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.reloadCount=${second.reloadCount}, expected=1`);
      expect(second.reloadCount).assertEqual(1);
      log('testDataSource0379 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0380
     * @tc.name      testDataSource0380
     * @tc.desc      Verify unregistering one listener mid-stream keeps the other.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0380 begin');
      const source: BasicDataSource = newSource();
      const first: RecorderListener = new RecorderListener();
      const second: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataAdd(0);
      source.unregisterDataChangeListener(first);
      source.notifyDataAdd(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.addIndexes.join(',')=${first.addIndexes.join(',')}`);
      expect(first.addIndexes.join(',')).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.addIndexes.join(',')=${second.addIndexes.join(',')}`);
      expect(second.addIndexes.join(',')).assertEqual('0,1');
      log('testDataSource0380 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0381
     * @tc.name      testDataSource0381
     * @tc.desc      Verify interleaved adds record exact notification order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0381 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(1);
      source.notifyDataAdd(0);
      source.notifyDataAdd(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.addIndexes.join(',')}, expected='1,0,2'`);
      expect(listener.addIndexes.join(',')).assertEqual('1,0,2');
      log('testDataSource0381 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0382
     * @tc.name      testDataSource0382
     * @tc.desc      Verify ten reloads are all counted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0382 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      for (let i: number = 0; i < 10; i++) {
        source.notifyDataReload();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=10`);
      expect(listener.reloadCount).assertEqual(10);
      log('testDataSource0382 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0383
     * @tc.name      testDataSource0383
     * @tc.desc      Verify move followed by add keeps separate streams.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0383 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(0, 1);
      source.notifyDataAdd(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFroms.join(',')=${listener.moveFroms.join(',')}`);
      expect(listener.moveFroms.join(',')).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveTos.join(',')=${listener.moveTos.join(',')}`);
      expect(listener.moveTos.join(',')).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.addIndexes.join(',')}, expected='2'`);
      expect(listener.addIndexes.join(',')).assertEqual('2');
      log('testDataSource0383 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0384
     * @tc.name      testDataSource0384
     * @tc.desc      Verify delete then add on same index records both events.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0384 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(1);
      source.notifyDataAdd(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deleteIndexes.join(',')}, expected='1'`);
      expect(listener.deleteIndexes.join(',')).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.addIndexes.join(',')}, expected='1'`);
      expect(listener.addIndexes.join(',')).assertEqual('1');
      log('testDataSource0384 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0385
     * @tc.name      testDataSource0385
     * @tc.desc      Verify a late listener only receives subsequent notifications.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0385 begin');
      const source: BasicDataSource = newSource();
      const early: RecorderListener = new RecorderListener();
      const late: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(early);
      source.notifyDataAdd(0);
      source.registerDataChangeListener(late);
      source.notifyDataAdd(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual early.addIndexes.join(',')=${early.addIndexes.join(',')}`);
      expect(early.addIndexes.join(',')).assertEqual('0,1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual late.addIndexes.join(',')=${late.addIndexes.join(',')}`);
      expect(late.addIndexes.join(',')).assertEqual('1');
      log('testDataSource0385 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0386
     * @tc.name      testDataSource0386
     * @tc.desc      Verify clearing all listeners stops every callback.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0386 begin');
      const source: BasicDataSource = newSource();
      const first: RecorderListener = new RecorderListener();
      const second: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.unregisterDataChangeListener(first);
      source.unregisterDataChangeListener(second);
      source.notifyDataReload();
      source.notifyDataAdd(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.reloadCount=${first.reloadCount}, expected=0`);
      expect(first.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.addIndexes.length=${second.addIndexes.length}`);
      expect(second.addIndexes.length).assertEqual(0);
      log('testDataSource0386 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0387
     * @tc.name      testDataSource0387
     * @tc.desc      Verify notifying after removing one of two listeners works.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0387 begin');
      const source: BasicDataSource = newSource();
      const first: RecorderListener = new RecorderListener();
      const second: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.unregisterDataChangeListener(second);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.reloadCount=${first.reloadCount}, expected=1`);
      expect(first.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.reloadCount=${second.reloadCount}, expected=0`);
      expect(second.reloadCount).assertEqual(0);
      log('testDataSource0387 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0388
     * @tc.name      testDataSource0388
     * @tc.desc      Verify three listeners each receive three reloads.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0388 begin');
      const source: BasicDataSource = newSource();
      const first: RecorderListener = new RecorderListener();
      const second: RecorderListener = new RecorderListener();
      const third: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.registerDataChangeListener(third);
      source.notifyDataReload();
      source.notifyDataReload();
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.reloadCount=${first.reloadCount}, expected=3`);
      expect(first.reloadCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.reloadCount=${second.reloadCount}, expected=3`);
      expect(second.reloadCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual third.reloadCount=${third.reloadCount}, expected=3`);
      expect(third.reloadCount).assertEqual(3);
      log('testDataSource0388 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0389
     * @tc.name      testDataSource0389
     * @tc.desc      Verify callback order inside each stream stays chronological.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0389 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(3);
      source.notifyDataAdd(2);
      source.notifyDataAdd(1);
      source.notifyDataChange(9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.addIndexes.join(',')}, expected='3,2,1'`);
      expect(listener.addIndexes.join(',')).assertEqual('3,2,1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.changeIndexes.join(',')}, expected='9'`);
      expect(listener.changeIndexes.join(',')).assertEqual('9');
      log('testDataSource0389 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0390
     * @tc.name      testDataSource0390
     * @tc.desc      Verify two sources notify their own listeners independently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0390 begin');
      const sourceOne: BasicDataSource = newSource();
      const sourceTwo: BasicDataSource = newSource();
      const listenerOne: RecorderListener = new RecorderListener();
      const listenerTwo: RecorderListener = new RecorderListener();
      sourceOne.registerDataChangeListener(listenerOne);
      sourceTwo.registerDataChangeListener(listenerTwo);
      sourceOne.notifyDataAdd(1);
      sourceTwo.notifyDataAdd(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listenerOne.addIndexes.join(',')}, expected='1'`);
      expect(listenerOne.addIndexes.join(',')).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listenerTwo.addIndexes.join(',')}, expected='2'`);
      expect(listenerTwo.addIndexes.join(',')).assertEqual('2');
      log('testDataSource0390 end');
    })

    // ============================ 跨源复用 0391-0402 ============================
    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0391
     * @tc.name      testDataSource0391
     * @tc.desc      Verify one listener can subscribe to two data sources.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0391 begin');
      const sourceOne: BasicDataSource = newSource();
      const sourceTwo: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      sourceOne.registerDataChangeListener(listener);
      sourceTwo.registerDataChangeListener(listener);
      sourceOne.notifyDataReload();
      sourceTwo.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=2`);
      expect(listener.reloadCount).assertEqual(2);
      log('testDataSource0391 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0392
     * @tc.name      testDataSource0392
     * @tc.desc      Verify unregistering from one source keeps the other active.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0392 begin');
      const sourceOne: BasicDataSource = newSource();
      const sourceTwo: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      sourceOne.registerDataChangeListener(listener);
      sourceTwo.registerDataChangeListener(listener);
      sourceOne.unregisterDataChangeListener(listener);
      sourceOne.notifyDataReload();
      sourceTwo.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=1`);
      expect(listener.reloadCount).assertEqual(1);
      log('testDataSource0392 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0393
     * @tc.name      testDataSource0393
     * @tc.desc      Verify separate listeners track separate sources correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0393 begin');
      const sourceOne: BasicDataSource = newSource();
      const sourceTwo: BasicDataSource = newSource();
      const listenerOne: RecorderListener = new RecorderListener();
      const listenerTwo: RecorderListener = new RecorderListener();
      sourceOne.registerDataChangeListener(listenerOne);
      sourceTwo.registerDataChangeListener(listenerTwo);
      sourceOne.notifyDataReload();
      sourceOne.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listenerOne.reloadCount=${listenerOne.reloadCount}`);
      expect(listenerOne.reloadCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listenerTwo.reloadCount=${listenerTwo.reloadCount}`);
      expect(listenerTwo.reloadCount).assertEqual(0);
      log('testDataSource0393 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0394
     * @tc.name      testDataSource0394
     * @tc.desc      Verify listener indexes come only from its own source.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0394 begin');
      const sourceOne: BasicDataSource = newSource();
      const sourceTwo: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      sourceOne.registerDataChangeListener(listener);
      sourceTwo.notifyDataAdd(99);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes.length=${listener.addIndexes.length}`);
      expect(listener.addIndexes.length).assertEqual(0);
      sourceOne.notifyDataAdd(7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.addIndexes.join(',')}, expected='7'`);
      expect(listener.addIndexes.join(',')).assertEqual('7');
      log('testDataSource0394 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0395
     * @tc.name      testDataSource0395
     * @tc.desc      Verify duplicate subscription on second source stays single.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0395 begin');
      const sourceOne: BasicDataSource = newSource();
      const sourceTwo: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      sourceOne.registerDataChangeListener(listener);
      sourceTwo.registerDataChangeListener(listener);
      sourceTwo.registerDataChangeListener(listener);
      sourceTwo.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=1`);
      expect(listener.reloadCount).assertEqual(1);
      log('testDataSource0395 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0396
     * @tc.name      testDataSource0396
     * @tc.desc      Verify cross-source re-registration resumes notifications.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0396 begin');
      const sourceOne: BasicDataSource = newSource();
      const sourceTwo: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      sourceOne.registerDataChangeListener(listener);
      sourceTwo.registerDataChangeListener(listener);
      sourceTwo.unregisterDataChangeListener(listener);
      sourceTwo.registerDataChangeListener(listener);
      sourceTwo.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=1`);
      expect(listener.reloadCount).assertEqual(1);
      log('testDataSource0396 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0397
     * @tc.name      testDataSource0397
     * @tc.desc      Verify repeated construction yields distinct instances.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0397 begin');
      const first: BasicDataSource = newSource();
      const second: BasicDataSource = newSource();
      const third: BasicDataSource = newSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first === second=${first === second}, expected=false`);
      expect(first === second).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second === third=${second === third}, expected=false`);
      expect(second === third).assertEqual(false);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first === third=${first === third}, expected=false`);
      expect(first === third).assertEqual(false);
      log('testDataSource0397 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0398
     * @tc.name      testDataSource0398
     * @tc.desc      Verify instance keeps object runtime type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0398 begin');
      const source: BasicDataSource = newSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source=${typeof source}, expected='object'`);
      expect(typeof source).assertEqual('object');
      log('testDataSource0398 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0399
     * @tc.name      testDataSource0399
     * @tc.desc      Verify fresh listener sees no callbacks before subscribing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0399 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.notifyDataReload();
      source.notifyDataAdd(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=0`);
      expect(listener.reloadCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes.length=${listener.addIndexes.length}`);
      expect(listener.addIndexes.length).assertEqual(0);
      log('testDataSource0399 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0400
     * @tc.name      testDataSource0400
     * @tc.desc      Verify getData keeps consistent type across instances.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0400 begin');
      const first: BasicDataSource = newSource();
      const second: BasicDataSource = newSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof first.getData(2)=${typeof first.getData(2)}`);
      expect(typeof first.getData(2)).assertEqual(typeof second.getData(2));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.getData(2)=${first.getData(2)}`);
      expect(first.getData(2)).assertEqual(second.getData(2));
      log('testDataSource0400 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0401
     * @tc.name      testDataSource0401
     * @tc.desc      Verify subscribing on one source leaves the other silent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0401 begin');
      const sourceOne: BasicDataSource = newSource();
      const sourceTwo: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      sourceOne.registerDataChangeListener(listener);
      sourceTwo.notifyDataChange(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.changeIndexes.length}, expected=0`);
      expect(listener.changeIndexes.length).assertEqual(0);
      sourceOne.notifyDataChange(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.changeIndexes.join(',')}, expected='5'`);
      expect(listener.changeIndexes.join(',')).assertEqual('5');
      log('testDataSource0401 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0402
     * @tc.name      testDataSource0402
     * @tc.desc      Verify four registered listeners all receive reloads.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0402 begin');
      const source: BasicDataSource = newSource();
      const first: RecorderListener = new RecorderListener();
      const second: RecorderListener = new RecorderListener();
      const third: RecorderListener = new RecorderListener();
      const fourth: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.registerDataChangeListener(third);
      source.registerDataChangeListener(fourth);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.reloadCount=${first.reloadCount}, expected=1`);
      expect(first.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.reloadCount=${second.reloadCount}, expected=1`);
      expect(second.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual third.reloadCount=${third.reloadCount}, expected=1`);
      expect(third.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual fourth.reloadCount=${fourth.reloadCount}, expected=1`);
      expect(fourth.reloadCount).assertEqual(1);
      log('testDataSource0402 end');
    })

    // ============================ 边界补充 0403-0410 ============================
    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0403
     * @tc.name      testDataSource0403
     * @tc.desc      Verify add passes int32 max index through unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0403 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.addIndexes.join(',')}`);
      expect(listener.addIndexes.join(',')).assertEqual('2147483647');
      log('testDataSource0403 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0404
     * @tc.name      testDataSource0404
     * @tc.desc      Verify move passes large boundary indexes through.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0404 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(2147483646, 2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFroms.join(',')=${listener.moveFroms.join(',')}`);
      expect(listener.moveFroms.join(',')).assertEqual('2147483646');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveTos.join(',')=${listener.moveTos.join(',')}`);
      expect(listener.moveTos.join(',')).assertEqual('2147483647');
      log('testDataSource0404 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0405
     * @tc.name      testDataSource0405
     * @tc.desc      Verify delete passes int32 max index through unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0405 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deleteIndexes.join(',')}`);
      expect(listener.deleteIndexes.join(',')).assertEqual('2147483647');
      log('testDataSource0405 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0406
     * @tc.name      testDataSource0406
     * @tc.desc      Verify one hundred consecutive adds all notify.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0406 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      for (let i: number = 0; i < 100; i++) {
        source.notifyDataAdd(i);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes.length=${listener.addIndexes.length}`);
      expect(listener.addIndexes.length).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[0]=${listener.addIndexes[0]}, expected=0`);
      expect(listener.addIndexes[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[99]=${listener.addIndexes[99]}`);
      expect(listener.addIndexes[99]).assertEqual(99);
      log('testDataSource0406 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0407
     * @tc.name      testDataSource0407
     * @tc.desc      Verify fifty reloads are all counted.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0407 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      for (let i: number = 0; i < 50; i++) {
        source.notifyDataReload();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=50`);
      expect(listener.reloadCount).assertEqual(50);
      log('testDataSource0407 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0408
     * @tc.name      testDataSource0408
     * @tc.desc      Verify add delete add sequence records all three events.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0408 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      source.notifyDataDelete(0);
      source.notifyDataAdd(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.addIndexes.join(',')}, expected='0,0'`);
      expect(listener.addIndexes.join(',')).assertEqual('0,0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deleteIndexes.join(',')}, expected='0'`);
      expect(listener.deleteIndexes.join(',')).assertEqual('0');
      log('testDataSource0408 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0409
     * @tc.name      testDataSource0409
     * @tc.desc      Verify repeated self moves record every occurrence.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0409 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(0, 0);
      source.notifyDataMove(0, 0);
      source.notifyDataMove(0, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFroms.join(',')=${listener.moveFroms.join(',')}`);
      expect(listener.moveFroms.join(',')).assertEqual('0,0,0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveTos.join(',')=${listener.moveTos.join(',')}`);
      expect(listener.moveTos.join(',')).assertEqual('0,0,0');
      log('testDataSource0409 end');
    })

    /**
     * @tc.number    SUB_PULLTOREFRESH_DATASOURCE_0410
     * @tc.name      testDataSource0410
     * @tc.desc      Verify one hundred moves keep stream length consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDataSource0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDataSource0410 begin');
      const source: BasicDataSource = newSource();
      const listener: RecorderListener = new RecorderListener();
      source.registerDataChangeListener(listener);
      for (let i: number = 0; i < 100; i++) {
        source.notifyDataMove(i, i + 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFroms.length=${listener.moveFroms.length}`);
      expect(listener.moveFroms.length).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveTos.length=${listener.moveTos.length}`);
      expect(listener.moveTos.length).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveFroms[0]=${listener.moveFroms[0]}, expected=0`);
      expect(listener.moveFroms[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.moveTos[99]=${listener.moveTos[99]}, expected=100`);
      expect(listener.moveTos[99]).assertEqual(100);
      log('testDataSource0410 end');
    })
  })
}
