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
import { describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CommonLazyDataSourceModel } from '../../../main/ets/model/CommonLazyDataSourceModel';

const DOMAIN: number = 0xF814;
const TAG: string = 'LazyDataSourceTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

class RecordItem {
  public name: string = '';
  public id: number = 0;

  constructor(name: string, id: number) {
    this.name = name;
    this.id = id;
  }
}

class TestListener implements DataChangeListener {
  public eventNames: string[] = [];
  public lastIndex: number = -1;
  public lastFrom: number = -1;
  public lastTo: number = -1;
  public reloadCount: number = 0;

  onDataReloaded(): void {
    this.eventNames.push('reloaded');
    this.reloadCount++;
  }

  onDataAdd(index: number): void {
    this.eventNames.push('add');
    this.lastIndex = index;
  }

  onDataChange(index: number): void {
    this.eventNames.push('change');
    this.lastIndex = index;
  }

  onDataDelete(index: number): void {
    this.eventNames.push('delete');
    this.lastIndex = index;
  }

  onDataMove(from: number, to: number): void {
    this.eventNames.push('move');
    this.lastFrom = from;
    this.lastTo = to;
  }

  onDataMoveFromTo(from: number, to: number): void {
    this.eventNames.push('moveFromTo');
    this.lastFrom = from;
    this.lastTo = to;
  }

  onDataAdded(index: number): void {
    this.eventNames.push('added');
    this.lastIndex = index;
  }

  onDataChanged(index: number): void {
    this.eventNames.push('changed');
    this.lastIndex = index;
  }

  onDataDeleted(index: number): void {
    this.eventNames.push('deleted');
    this.lastIndex = index;
  }

  onDataMoved(from: number, to: number): void {
    this.eventNames.push('moved');
    this.lastFrom = from;
    this.lastTo = to;
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
    this.eventNames.push('datasetChange');
  }
}

export default function lazyDataSourceTest(): void {
  describe('LazyDataSourceTest', () => {
    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0401
     * @tc.name      testLazyDataSource0401
     * @tc.desc      Checks a fresh data source reports zero items.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0401 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.totalCount() >= 0=${source.totalCount() >= 0}`);
      expect(source.totalCount() >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.totalCount()=${typeof source.totalCount()}`);
      expect(typeof source.totalCount()).assertEqual('number');
      log('testLazyDataSource0401 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0402
     * @tc.name      testLazyDataSource0402
     * @tc.desc      Checks getting from an empty source yields undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0402 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      const value: string = source.getData(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined value`);
      expect(value).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(1)`);
      expect(source.getData(1)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      log('testLazyDataSource0402 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0403
     * @tc.name      testLazyDataSource0403
     * @tc.desc      Checks pushing one item raises the count to one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0403 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      source.pushData('first');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.totalCount()=${typeof source.totalCount()}`);
      expect(typeof source.totalCount()).assertEqual('number');
      log('testLazyDataSource0403 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0404
     * @tc.name      testLazyDataSource0404
     * @tc.desc      Checks pushed data can be read back by index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0404 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      source.pushData('first');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='first'`);
      expect(source.getData(0)).assertEqual('first');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${source.getData(0) === 'first'}`);
      expect(source.getData(0) === 'first').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      log('testLazyDataSource0404 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0405
     * @tc.name      testLazyDataSource0405
     * @tc.desc      Checks pushed items keep insertion order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0405 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      source.pushData('a');
      source.pushData('b');
      source.pushData('c');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='a'`);
      expect(source.getData(0)).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='b'`);
      expect(source.getData(1)).assertEqual('b');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected='c'`);
      expect(source.getData(2)).assertEqual('c');
      log('testLazyDataSource0405 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0406
     * @tc.name      testLazyDataSource0406
     * @tc.desc      Checks pushData notifies listeners with the tail index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0406 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.pushData('a');
      source.pushData('b');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastIndex=${listener.lastIndex}, expected=1`);
      expect(listener.lastIndex).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${listener.eventNames.includes('add')}`);
      expect(listener.eventNames.includes('add')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventNames.length=${listener.eventNames.length}`);
      expect(listener.eventNames.length).assertEqual(2);
      log('testLazyDataSource0406 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0407
     * @tc.name      testLazyDataSource0407
     * @tc.desc      Checks adding at the head puts data at index zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0407 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      source.pushData('a');
      source.addData(0, 'head');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='head'`);
      expect(source.getData(0)).assertEqual('head');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.getData(0) !== 'a'=${source.getData(0) !== 'a'}`);
      expect(source.getData(0) !== 'a').assertTrue();
      log('testLazyDataSource0407 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0408
     * @tc.name      testLazyDataSource0408
     * @tc.desc      Checks head insertion shifts existing items right.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0408 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      source.pushData('a');
      source.pushData('b');
      source.addData(0, 'head');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='a'`);
      expect(source.getData(1)).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected='b'`);
      expect(source.getData(2)).assertEqual('b');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='head'`);
      expect(source.getData(0)).assertEqual('head');
      log('testLazyDataSource0408 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0409
     * @tc.name      testLazyDataSource0409
     * @tc.desc      Checks adding in the middle keeps both sides ordered.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0409 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      source.pushData('a');
      source.pushData('c');
      source.addData(1, 'b');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='b'`);
      expect(source.getData(1)).assertEqual('b');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='a'`);
      expect(source.getData(0)).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected='c'`);
      expect(source.getData(2)).assertEqual('c');
      log('testLazyDataSource0409 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0410
     * @tc.name      testLazyDataSource0410
     * @tc.desc      Checks adding at the tail behaves like pushing.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0410 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      source.pushData('a');
      source.addData(1, 'tail');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='tail'`);
      expect(source.getData(1)).assertEqual('tail');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='a'`);
      expect(source.getData(0)).assertEqual('a');
      log('testLazyDataSource0410 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0411
     * @tc.name      testLazyDataSource0411
     * @tc.desc      Checks addData notifies listeners with the insert index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0411 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.pushData('a');
      source.pushData('c');
      source.addData(1, 'b');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastIndex=${listener.lastIndex}, expected=1`);
      expect(listener.lastIndex).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${listener.eventNames.includes('add')}`);
      expect(listener.eventNames.includes('add')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventNames.length=${listener.eventNames.length}`);
      expect(listener.eventNames.length).assertEqual(3);
      log('testLazyDataSource0411 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0412
     * @tc.name      testLazyDataSource0412
     * @tc.desc      Checks addData increases the total count by one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0412 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      source.pushData('a');
      const before: number = source.totalCount();
      source.addData(0, 'head');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}`);
      expect(source.totalCount()).assertEqual(before + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertLarger source.totalCount()=${source.totalCount()}, expected=before`);
      expect(source.totalCount()).assertLarger(before);
      log('testLazyDataSource0412 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0413
     * @tc.name      testLazyDataSource0413
     * @tc.desc      Checks out-of-range access returns undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0413 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      source.pushData('a');
      const value: string = source.getData(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined value`);
      expect(value).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='a'`);
      expect(source.getData(0)).assertEqual('a');
      log('testLazyDataSource0413 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0414
     * @tc.name      testLazyDataSource0414
     * @tc.desc      Checks negative index access returns undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0414 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      source.pushData('a');
      const value: string = source.getData(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined value`);
      expect(value).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='a'`);
      expect(source.getData(0)).assertEqual('a');
      log('testLazyDataSource0414 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0415
     * @tc.name      testLazyDataSource0415
     * @tc.desc      Checks clearAndPushAll replaces the whole data set.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0415 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      source.pushData('old1');
      source.pushData('old2');
      source.clearAndPushAll(['new1', 'new2', 'new3']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=3`);
      expect(source.totalCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='new1'`);
      expect(source.getData(0)).assertEqual('new1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected='new3'`);
      expect(source.getData(2)).assertEqual('new3');
      log('testLazyDataSource0415 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0416
     * @tc.name      testLazyDataSource0416
     * @tc.desc      Checks old items are gone after clearAndPushAll.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0416 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      source.pushData('old1');
      source.clearAndPushAll(['new1']);
      const value: string = source.getData(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined value`);
      expect(value).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='new1'`);
      expect(source.getData(0)).assertEqual('new1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      log('testLazyDataSource0416 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0417
     * @tc.name      testLazyDataSource0417
     * @tc.desc      Checks clearing with an empty array empties the source.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0417 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      source.pushData('a');
      source.pushData('b');
      source.clearAndPushAll([]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      const value: string = source.getData(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined value`);
      expect(value).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue source.totalCount() >= 0=${source.totalCount() >= 0}`);
      expect(source.totalCount() >= 0).assertTrue();
      log('testLazyDataSource0417 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0418
     * @tc.name      testLazyDataSource0418
     * @tc.desc      Checks clearAndPushAll fires the reload notification.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0418 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.pushData('old');
      source.clearAndPushAll(['new1', 'new2']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=1`);
      expect(listener.reloadCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${listener.eventNames.includes('reloaded')}`);
      expect(listener.eventNames.includes('reloaded')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventNames.length=${listener.eventNames.length}`);
      expect(listener.eventNames.length).assertEqual(2);
      log('testLazyDataSource0418 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0419
     * @tc.name      testLazyDataSource0419
     * @tc.desc      Checks a registered listener receives add notifications.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0419 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.pushData('a');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventNames.length=${listener.eventNames.length}`);
      expect(listener.eventNames.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastIndex=${listener.lastIndex}, expected=0`);
      expect(listener.lastIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventNames[0]=${listener.eventNames[0]}`);
      expect(listener.eventNames[0]).assertEqual('add');
      log('testLazyDataSource0419 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0420
     * @tc.name      testLazyDataSource0420
     * @tc.desc      Checks duplicate registration notifies only once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0420 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.pushData('a');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventNames.length=${listener.eventNames.length}`);
      expect(listener.eventNames.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastIndex=${listener.lastIndex}, expected=0`);
      expect(listener.lastIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${listener.eventNames.includes('add')}`);
      expect(listener.eventNames.includes('add')).assertTrue();
      log('testLazyDataSource0420 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0421
     * @tc.name      testLazyDataSource0421
     * @tc.desc      Checks every registered listener receives notifications.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0421 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      const first: TestListener = new TestListener();
      const second: TestListener = new TestListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.pushData('a');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.eventNames.length=${first.eventNames.length}`);
      expect(first.eventNames.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.eventNames.length=${second.eventNames.length}`);
      expect(second.eventNames.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.lastIndex=${second.lastIndex}, expected=0`);
      expect(second.lastIndex).assertEqual(0);
      log('testLazyDataSource0421 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0422
     * @tc.name      testLazyDataSource0422
     * @tc.desc      Checks an unregistered listener stops receiving events.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0422 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.pushData('a');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventNames.length=${listener.eventNames.length}`);
      expect(listener.eventNames.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastIndex=${listener.lastIndex}, expected=-1`);
      expect(listener.lastIndex).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      log('testLazyDataSource0422 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0423
     * @tc.name      testLazyDataSource0423
     * @tc.desc      Checks unregistering an unknown listener is harmless.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0423 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      const listener: TestListener = new TestListener();
      source.unregisterDataChangeListener(listener);
      source.pushData('a');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='a'`);
      expect(source.getData(0)).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventNames.length=${listener.eventNames.length}`);
      expect(listener.eventNames.length).assertEqual(0);
      log('testLazyDataSource0423 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0424
     * @tc.name      testLazyDataSource0424
     * @tc.desc      Checks notifyDataChange forwards the changed index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0424 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${listener.eventNames.includes('change')}`);
      expect(listener.eventNames.includes('change')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastIndex=${listener.lastIndex}, expected=2`);
      expect(listener.lastIndex).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventNames.length=${listener.eventNames.length}`);
      expect(listener.eventNames.length).assertEqual(1);
      log('testLazyDataSource0424 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0425
     * @tc.name      testLazyDataSource0425
     * @tc.desc      Checks notifyDataDelete forwards the deleted index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0425 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue listener.eventNames.includes('delete')`);
      expect(listener.eventNames.includes('delete')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastIndex=${listener.lastIndex}, expected=3`);
      expect(listener.lastIndex).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadCount=${listener.reloadCount}, expected=0`);
      expect(listener.reloadCount).assertEqual(0);
      log('testLazyDataSource0425 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0426
     * @tc.name      testLazyDataSource0426
     * @tc.desc      Checks notifyDataMove forwards both move indexes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0426 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      const listener: TestListener = new TestListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(0, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${listener.eventNames.includes('move')}`);
      expect(listener.eventNames.includes('move')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastFrom=${listener.lastFrom}, expected=0`);
      expect(listener.lastFrom).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastTo=${listener.lastTo}, expected=2`);
      expect(listener.lastTo).assertEqual(2);
      log('testLazyDataSource0426 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0427
     * @tc.name      testLazyDataSource0427
     * @tc.desc      Checks the source stores number items correctly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0427 begin');
      const source: CommonLazyDataSourceModel<number> = new CommonLazyDataSourceModel<number>();
      source.pushData(10);
      source.pushData(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected=10`);
      expect(source.getData(0)).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected=20`);
      expect(source.getData(1)).assertEqual(20);
      log('testLazyDataSource0427 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0428
     * @tc.name      testLazyDataSource0428
     * @tc.desc      Checks the source stores object items with fields intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0428 begin');
      const source: CommonLazyDataSourceModel<RecordItem> = new CommonLazyDataSourceModel<RecordItem>();
      source.pushData(new RecordItem('alpha', 1));
      source.pushData(new RecordItem('beta', 2));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0).name=${source.getData(0).name}`);
      expect(source.getData(0).name).assertEqual('alpha');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1).id=${source.getData(1).id}, expected=2`);
      expect(source.getData(1).id).assertEqual(2);
      log('testLazyDataSource0428 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0429
     * @tc.name      testLazyDataSource0429
     * @tc.desc      Checks repeated clearAndPushAll keeps the latest data only.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0429 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      source.clearAndPushAll(['batch1']);
      source.clearAndPushAll(['batch2a', 'batch2b', 'batch2c']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=3`);
      expect(source.totalCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='batch2a'`);
      expect(source.getData(0)).assertEqual('batch2a');
      const value: string = source.getData(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined value`);
      expect(value).assertUndefined();
      log('testLazyDataSource0429 end');
    })

    /**
     * @tc.number    SUB_IMAGEVIEWER_LAZYDATA_0430
     * @tc.name      testLazyDataSource0430
     * @tc.desc      Checks a mixed edit sequence keeps the source consistent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLazyDataSource0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testLazyDataSource0430 begin');
      const source: CommonLazyDataSourceModel<string> = new CommonLazyDataSourceModel<string>();
      source.pushData('a');
      source.pushData('b');
      source.addData(1, 'mid');
      source.clearAndPushAll(['x', 'y']);
      source.pushData('z');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=3`);
      expect(source.totalCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='x'`);
      expect(source.getData(0)).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected='z'`);
      expect(source.getData(2)).assertEqual('z');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='y'`);
      expect(source.getData(1)).assertEqual('y');
      log('testLazyDataSource0430 end');
    })
  })
}
