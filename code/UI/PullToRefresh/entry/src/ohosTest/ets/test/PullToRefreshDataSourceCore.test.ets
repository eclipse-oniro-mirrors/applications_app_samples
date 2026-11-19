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
  });
}
