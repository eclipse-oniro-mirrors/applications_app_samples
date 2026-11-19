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
import { KeyboardDataSource } from '../../../main/ets/bridge/KeyboardAvoidBridge';

const DOMAIN: number = 0xF814;
const TAG: string = 'DataSourceMutationOpsTest';

const DEFAULT_ITEMS: string[] = ['第一条数据', '第二条数据', '第三条数据', '第四条数据', '第五条数据', '第六条数据',
  '第七条数据', '第八条数据', '第九条数据', '第十条数据', '第十一条数据', '第十二条数据'];

class EventLogListener implements DataChangeListener {
  reloadedCount: number = 0;
  addedCount: number = 0;
  lastAddIndex: number = -1;
  addIndexes: number[] = [];
  changedCount: number = 0;
  lastChangeIndex: number = -1;
  deletedCount: number = 0;
  lastDeleteIndex: number = -1;
  deleteIndexes: number[] = [];
  movedCount: number = 0;
  lastMoveFrom: number = -1;
  lastMoveTo: number = -1;

  onDataReloaded(): void {
    this.reloadedCount++;
  }

  onDataAdd(index: number): void {
    this.addedCount++;
    this.lastAddIndex = index;
    this.addIndexes.push(index);
  }

  onDataChange(index: number): void {
    this.changedCount++;
    this.lastChangeIndex = index;
  }

  onDataDelete(index: number): void {
    this.deletedCount++;
    this.lastDeleteIndex = index;
    this.deleteIndexes.push(index);
  }

  onDataMove(from: number, to: number): void {
    this.movedCount++;
    this.lastMoveFrom = from;
    this.lastMoveTo = to;
  }

  onDataAdded(index: number): void {
  }

  onDataChanged(index: number): void {
  }

  onDataDeleted(index: number): void {
  }

  onDataMoved(from: number, to: number): void {
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
  }
}

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function dataSourceMutationOpsTest(): void {
  describe('KeyboardAvoidDataSourceMutationOpsTest', () => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0201
     * @tc.name      testDsMutate0201
     * @tc.desc      Verify add1stItem raises the total count from twelve to thirteen.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0201 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=13`);
      expect(source.totalCount()).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.totalCount()=${typeof source.totalCount()}`);
      expect(typeof source.totalCount()).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(0)`);
      expect(source.getData(0)).assertUndefined();
      log('testDsMutate0201 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0202
     * @tc.name      testDsMutate0202
     * @tc.desc      Verify add1stItem opens an empty slot at position zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0202 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.add1stItem();
      const head: string = source.getData(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined head`);
      expect(head).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=13`);
      expect(source.totalCount()).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='第一条数据'`);
      expect(source.getData(1)).assertEqual('第一条数据');
      log('testDsMutate0202 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0203
     * @tc.name      testDsMutate0203
     * @tc.desc      Verify add1stItem shifts the original first item to position one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0203 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='第一条数据'`);
      expect(source.getData(1)).assertEqual('第一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected='第二条数据'`);
      expect(source.getData(2)).assertEqual('第二条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=13`);
      expect(source.totalCount()).assertEqual(13);
      log('testDsMutate0203 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0204
     * @tc.name      testDsMutate0204
     * @tc.desc      Verify add1stItem notifies the listener with insert index zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0204 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}, expected=0`);
      expect(listener.lastAddIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=13`);
      expect(source.totalCount()).assertEqual(13);
      log('testDsMutate0204 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0205
     * @tc.name      testDsMutate0205
     * @tc.desc      Verify two consecutive add1stItem calls grow the count to fourteen.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0205 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.add1stItem();
      source.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=14`);
      expect(source.totalCount()).assertEqual(14);
      const head: string = source.getData(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined head`);
      expect(head).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(1)`);
      expect(source.getData(1)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected='第一条数据'`);
      expect(source.getData(2)).assertEqual('第一条数据');
      log('testDsMutate0205 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0206
     * @tc.name      testDsMutate0206
     * @tc.desc      Verify addLastItem raises the total count to thirteen.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0206 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.addLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=13`);
      expect(source.totalCount()).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.totalCount()=${typeof source.totalCount()}`);
      expect(typeof source.totalCount()).assertEqual('number');
      log('testDsMutate0206 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0207
     * @tc.name      testDsMutate0207
     * @tc.desc      Verify addLastItem opens an empty slot at the tail position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0207 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.addLastItem();
      const tail: string = source.getData(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined tail`);
      expect(tail).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=13`);
      expect(source.totalCount()).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(11)=${source.getData(11)}, expected='第十二条数据'`);
      expect(source.getData(11)).assertEqual('第十二条数据');
      log('testDsMutate0207 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0208
     * @tc.name      testDsMutate0208
     * @tc.desc      Verify addLastItem keeps the previous last item readable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0208 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.addLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(11)=${source.getData(11)}, expected='第十二条数据'`);
      expect(source.getData(11)).assertEqual('第十二条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=13`);
      expect(source.totalCount()).assertEqual(13);
      log('testDsMutate0208 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0209
     * @tc.name      testDsMutate0209
     * @tc.desc      Verify addLastItem notifies with the appended position index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0209 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.addLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}, expected=12`);
      expect(listener.lastAddIndex).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=13`);
      expect(source.totalCount()).assertEqual(13);
      log('testDsMutate0209 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0210
     * @tc.name      testDsMutate0210
     * @tc.desc      Verify addItem at zero behaves like a head insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0210 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.addItem(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=13`);
      expect(source.totalCount()).assertEqual(13);
      const head: string = source.getData(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined head`);
      expect(head).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='第一条数据'`);
      expect(source.getData(1)).assertEqual('第一条数据');
      log('testDsMutate0210 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0211
     * @tc.name      testDsMutate0211
     * @tc.desc      Verify addItem at five opens a slot and shifts later items back.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0211 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.addItem(5);
      const slot: string = source.getData(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined slot`);
      expect(slot).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(6)=${source.getData(6)}, expected='第六条数据'`);
      expect(source.getData(6)).assertEqual('第六条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(4)=${source.getData(4)}, expected='第五条数据'`);
      expect(source.getData(4)).assertEqual('第五条数据');
      log('testDsMutate0211 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0212
     * @tc.name      testDsMutate0212
     * @tc.desc      Verify addItem at the current length appends at the tail.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0212 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.addItem(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=13`);
      expect(source.totalCount()).assertEqual(13);
      const tail: string = source.getData(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined tail`);
      expect(tail).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(11)=${source.getData(11)}, expected='第十二条数据'`);
      expect(source.getData(11)).assertEqual('第十二条数据');
      log('testDsMutate0212 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0213
     * @tc.name      testDsMutate0213
     * @tc.desc      Verify addItem far past the end clamps to the tail.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0213 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.addItem(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=13`);
      expect(source.totalCount()).assertEqual(13);
      const tail: string = source.getData(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined tail`);
      expect(tail).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(11)=${source.getData(11)}, expected='第十二条数据'`);
      expect(source.getData(11)).assertEqual('第十二条数据');
      log('testDsMutate0213 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0214
     * @tc.name      testDsMutate0214
     * @tc.desc      Verify a negative addItem index counts from the tail.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0214 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.addItem(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=13`);
      expect(source.totalCount()).assertEqual(13);
      const slot: string = source.getData(11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined slot`);
      expect(slot).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(12)=${source.getData(12)}, expected='第十二条数据'`);
      expect(source.getData(12)).assertEqual('第十二条数据');
      log('testDsMutate0214 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0215
     * @tc.name      testDsMutate0215
     * @tc.desc      Verify an addItem index equal to minus the length inserts at the head.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0215 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.addItem(-12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=13`);
      expect(source.totalCount()).assertEqual(13);
      const head: string = source.getData(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined head`);
      expect(head).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='第一条数据'`);
      expect(source.getData(1)).assertEqual('第一条数据');
      log('testDsMutate0215 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0216
     * @tc.name      testDsMutate0216
     * @tc.desc      Verify addItem forwards exactly the requested insert index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0216 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.addItem(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}, expected=5`);
      expect(listener.lastAddIndex).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=13`);
      expect(source.totalCount()).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(5)`);
      expect(source.getData(5)).assertUndefined();
      log('testDsMutate0216 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0217
     * @tc.name      testDsMutate0217
     * @tc.desc      Verify delete1stItem removes the head and promotes the second item.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0217 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.delete1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=11`);
      expect(source.totalCount()).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第二条数据'`);
      expect(source.getData(0)).assertEqual('第二条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(10)=${source.getData(10)}, expected='第十二条数据'`);
      expect(source.getData(10)).assertEqual('第十二条数据');
      log('testDsMutate0217 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0218
     * @tc.name      testDsMutate0218
     * @tc.desc      Verify delete1stItem notifies with index zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0218 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.delete1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedCount=${listener.deletedCount}, expected=1`);
      expect(listener.deletedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastDeleteIndex=${listener.lastDeleteIndex}`);
      expect(listener.lastDeleteIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=11`);
      expect(source.totalCount()).assertEqual(11);
      log('testDsMutate0218 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0219
     * @tc.name      testDsMutate0219
     * @tc.desc      Verify twelve delete1stItem calls drain the source to zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0219 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      for (let i: number = 0; i < 12; i++) {
        source.delete1stItem();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      const head: string = source.getData(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined head`);
      expect(head).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.totalCount()=${typeof source.totalCount()}`);
      expect(typeof source.totalCount()).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${source instanceof KeyboardDataSource}`);
      expect(source instanceof KeyboardDataSource).assertTrue();
      log('testDsMutate0219 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0220
     * @tc.name      testDsMutate0220
     * @tc.desc      Verify delete1stItem on an empty source stays safe and silent-safe.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0220 begin');
      const source: KeyboardDataSource = new KeyboardDataSource([]);
      source.delete1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(0)`);
      expect(source.getData(0)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.totalCount()=${typeof source.totalCount()}`);
      expect(typeof source.totalCount()).assertEqual('number');
      log('testDsMutate0220 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0221
     * @tc.name      testDsMutate0221
     * @tc.desc      Verify delete2ndItem keeps the head and pulls later items forward.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0221 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.delete2ndItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=11`);
      expect(source.totalCount()).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='第三条数据'`);
      expect(source.getData(1)).assertEqual('第三条数据');
      log('testDsMutate0221 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0222
     * @tc.name      testDsMutate0222
     * @tc.desc      Verify delete2ndItem notifies with index one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0222 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.delete2ndItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedCount=${listener.deletedCount}, expected=1`);
      expect(listener.deletedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastDeleteIndex=${listener.lastDeleteIndex}`);
      expect(listener.lastDeleteIndex).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=11`);
      expect(source.totalCount()).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      log('testDsMutate0222 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0223
     * @tc.name      testDsMutate0223
     * @tc.desc      Verify delete2ndItem on a single-item source leaves it unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0223 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['only']);
      source.delete2ndItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='only'`);
      expect(source.getData(0)).assertEqual('only');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(1)`);
      expect(source.getData(1)).assertUndefined();
      log('testDsMutate0223 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0224
     * @tc.name      testDsMutate0224
     * @tc.desc      Verify delete2ndItem on an empty source stays safe.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0224 begin');
      const source: KeyboardDataSource = new KeyboardDataSource([]);
      source.delete2ndItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(0)`);
      expect(source.getData(0)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.totalCount()=${typeof source.totalCount()}`);
      expect(typeof source.totalCount()).assertEqual('number');
      log('testDsMutate0224 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0225
     * @tc.name      testDsMutate0225
     * @tc.desc      Verify deleteLastItem drops only the tail element.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0225 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.deleteLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=11`);
      expect(source.totalCount()).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(10)=${source.getData(10)}, expected='第十一条数据'`);
      expect(source.getData(10)).assertEqual('第十一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(11)`);
      expect(source.getData(11)).assertUndefined();
      log('testDsMutate0225 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0226
     * @tc.name      testDsMutate0226
     * @tc.desc      Verify deleteLastItem notifies with the post-removal length.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0226 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.deleteLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedCount=${listener.deletedCount}, expected=1`);
      expect(listener.deletedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastDeleteIndex=${listener.lastDeleteIndex}`);
      expect(listener.lastDeleteIndex).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=11`);
      expect(source.totalCount()).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(10)=${source.getData(10)}, expected='第十一条数据'`);
      expect(source.getData(10)).assertEqual('第十一条数据');
      log('testDsMutate0226 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0227
     * @tc.name      testDsMutate0227
     * @tc.desc      Verify deleteLastItem empties a single-item source.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0227 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['only']);
      source.deleteLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(0)`);
      expect(source.getData(0)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.totalCount()=${typeof source.totalCount()}`);
      expect(typeof source.totalCount()).assertEqual('number');
      log('testDsMutate0227 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0228
     * @tc.name      testDsMutate0228
     * @tc.desc      Verify deleteLastItem on an empty source notifies with index zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0228 begin');
      const source: KeyboardDataSource = new KeyboardDataSource([]);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.deleteLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedCount=${listener.deletedCount}, expected=1`);
      expect(listener.deletedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastDeleteIndex=${listener.lastDeleteIndex}`);
      expect(listener.lastDeleteIndex).assertEqual(0);
      log('testDsMutate0228 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0229
     * @tc.name      testDsMutate0229
     * @tc.desc      Verify reload keeps the stored data and count intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0229 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.reload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(11)=${source.getData(11)}, expected='第十二条数据'`);
      expect(source.getData(11)).assertEqual('第十二条数据');
      log('testDsMutate0229 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0230
     * @tc.name      testDsMutate0230
     * @tc.desc      Verify reload fires exactly one reload notification.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0230 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.reload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=0`);
      expect(listener.addedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      log('testDsMutate0230 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0231
     * @tc.name      testDsMutate0231
     * @tc.desc      Verify modifyAllData swaps the stored content for the new array.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0231 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.modifyAllData(['p0', 'p1', 'p2']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=3`);
      expect(source.totalCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='p0'`);
      expect(source.getData(0)).assertEqual('p0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected='p2'`);
      expect(source.getData(2)).assertEqual('p2');
      log('testDsMutate0231 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0232
     * @tc.name      testDsMutate0232
     * @tc.desc      Verify modifyAllData with an empty array empties the source.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0232 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.modifyAllData([]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(0)`);
      expect(source.getData(0)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(3)`);
      expect(source.getData(3)).assertUndefined();
      log('testDsMutate0232 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0233
     * @tc.name      testDsMutate0233
     * @tc.desc      Verify modifyAllData raises one reload notification.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0233 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.modifyAllData(['p0']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=0`);
      expect(listener.addedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedCount=${listener.deletedCount}, expected=0`);
      expect(listener.deletedCount).assertEqual(0);
      log('testDsMutate0233 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0234
     * @tc.name      testDsMutate0234
     * @tc.desc      Verify edits to the shared array are visible through the source.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0234 begin');
      const external: string[] = ['p0', 'p1'];
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.modifyAllData(external);
      external[0] = 'p0-edited';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='p0-edited'`);
      expect(source.getData(0)).assertEqual('p0-edited');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='p1'`);
      expect(source.getData(1)).assertEqual('p1');
      log('testDsMutate0234 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0235
     * @tc.name      testDsMutate0235
     * @tc.desc      Verify pushes to the shared array grow the stored count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0235 begin');
      const external: string[] = ['p0'];
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.modifyAllData(external);
      external.push('p1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='p1'`);
      expect(source.getData(1)).assertEqual('p1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='p0'`);
      expect(source.getData(0)).assertEqual('p0');
      log('testDsMutate0235 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0236
     * @tc.name      testDsMutate0236
     * @tc.desc      Verify modifyAllData with a single-item array stores one item.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0236 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.modifyAllData(['solo']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='solo'`);
      expect(source.getData(0)).assertEqual('solo');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(1)`);
      expect(source.getData(1)).assertUndefined();
      log('testDsMutate0236 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0237
     * @tc.name      testDsMutate0237
     * @tc.desc      Verify add then delete at the head restore the original layout.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0237 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.add1stItem();
      source.delete1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(11)=${source.getData(11)}, expected='第十二条数据'`);
      expect(source.getData(11)).assertEqual('第十二条数据');
      log('testDsMutate0237 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0238
     * @tc.name      testDsMutate0238
     * @tc.desc      Verify delete then add at the head leave an empty head slot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0238 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.delete1stItem();
      source.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(0)`);
      expect(source.getData(0)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='第二条数据'`);
      expect(source.getData(1)).assertEqual('第二条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(11)=${source.getData(11)}, expected='第十二条数据'`);
      expect(source.getData(11)).assertEqual('第十二条数据');
      log('testDsMutate0238 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0239
     * @tc.name      testDsMutate0239
     * @tc.desc      Verify addLastItem on an empty source creates one empty slot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0239 begin');
      const source: KeyboardDataSource = new KeyboardDataSource([]);
      source.addLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(0)`);
      expect(source.getData(0)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(1)`);
      expect(source.getData(1)).assertUndefined();
      log('testDsMutate0239 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0240
     * @tc.name      testDsMutate0240
     * @tc.desc      Verify addItem at zero on an empty source stores one empty slot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0240 begin');
      const source: KeyboardDataSource = new KeyboardDataSource([]);
      source.addItem(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(0)`);
      expect(source.getData(0)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.totalCount()=${typeof source.totalCount()}`);
      expect(typeof source.totalCount()).assertEqual('number');
      log('testDsMutate0240 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0241
     * @tc.name      testDsMutate0241
     * @tc.desc      Verify two head insertions followed by one head deletion keep one slot.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0241 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.add1stItem();
      source.add1stItem();
      source.delete1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=13`);
      expect(source.totalCount()).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(0)`);
      expect(source.getData(0)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='第一条数据'`);
      expect(source.getData(1)).assertEqual('第一条数据');
      log('testDsMutate0241 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0242
     * @tc.name      testDsMutate0242
     * @tc.desc      Verify twelve deleteLastItem calls drain the source to zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0242 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      for (let i: number = 0; i < 12; i++) {
        source.deleteLastItem();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(0)`);
      expect(source.getData(0)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.totalCount()=${typeof source.totalCount()}`);
      expect(typeof source.totalCount()).assertEqual('number');
      log('testDsMutate0242 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0243
     * @tc.name      testDsMutate0243
     * @tc.desc      Verify restoring the default array through modifyAllData rebuilds twelve items.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0243 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['temp']);
      source.modifyAllData(DEFAULT_ITEMS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(11)=${source.getData(11)}, expected='第十二条数据'`);
      expect(source.getData(11)).assertEqual('第十二条数据');
      log('testDsMutate0243 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0244
     * @tc.name      testDsMutate0244
     * @tc.desc      Verify delete1stItem empties a single-item source.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0244 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['only']);
      source.delete1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(0)`);
      expect(source.getData(0)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.totalCount()=${typeof source.totalCount()}`);
      expect(typeof source.totalCount()).assertEqual('number');
      log('testDsMutate0244 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0245
     * @tc.name      testDsMutate0245
     * @tc.desc      Verify addItem at two preserves earlier items and shifts the rest.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0245 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.addItem(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='第二条数据'`);
      expect(source.getData(1)).assertEqual('第二条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(2)`);
      expect(source.getData(2)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(3)=${source.getData(3)}, expected='第三条数据'`);
      expect(source.getData(3)).assertEqual('第三条数据');
      log('testDsMutate0245 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0246
     * @tc.name      testDsMutate0246
     * @tc.desc      Verify two zero-index insertions stack two empty head slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0246 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.addItem(0);
      source.addItem(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=14`);
      expect(source.totalCount()).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(0)`);
      expect(source.getData(0)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(1)`);
      expect(source.getData(1)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected='第一条数据'`);
      expect(source.getData(2)).assertEqual('第一条数据');
      log('testDsMutate0246 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0247
     * @tc.name      testDsMutate0247
     * @tc.desc      Verify add1stItem and addItem at zero produce the same layout.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0247 begin');
      const viaHelper: KeyboardDataSource = new KeyboardDataSource(['a0', 'a1', 'a2']);
      const viaIndex: KeyboardDataSource = new KeyboardDataSource(['a0', 'a1', 'a2']);
      viaHelper.add1stItem();
      viaIndex.addItem(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual viaHelper.totalCount()=${viaHelper.totalCount()}`);
      expect(viaHelper.totalCount()).assertEqual(viaIndex.totalCount());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual viaHelper.getData(0)=${viaHelper.getData(0)}`);
      expect(viaHelper.getData(0)).assertEqual(viaIndex.getData(0));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual viaHelper.getData(1)=${viaHelper.getData(1)}`);
      expect(viaHelper.getData(1)).assertEqual(viaIndex.getData(1));
      log('testDsMutate0247 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0248
     * @tc.name      testDsMutate0248
     * @tc.desc      Verify the readable tail after deleteLastItem is the former neighbor.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0248 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.deleteLastItem();
      const lastIndex: number = source.totalCount() - 1;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual lastIndex=${lastIndex}, expected=10`);
      expect(lastIndex).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(lastIndex)=${source.getData(lastIndex)}`);
      expect(source.getData(lastIndex)).assertEqual('第十一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(11)`);
      expect(source.getData(11)).assertUndefined();
      log('testDsMutate0248 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0249
     * @tc.name      testDsMutate0249
     * @tc.desc      Verify head values keep string type after mutation sequences.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0249 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.delete1stItem();
      source.addLastItem();
      const first: string = source.getData(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof first=${typeof first}, expected='string'`);
      expect(typeof first).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first=${first}, expected='第二条数据'`);
      expect(first).assertEqual('第二条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      log('testDsMutate0249 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0250
     * @tc.name      testDsMutate0250
     * @tc.desc      Verify a mutated source is still a KeyboardDataSource instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0250 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.add1stItem();
      source.deleteLastItem();
      source.reload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue actual=${source instanceof KeyboardDataSource}`);
      expect(source instanceof KeyboardDataSource).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='第一条数据'`);
      expect(source.getData(1)).assertEqual('第一条数据');
      log('testDsMutate0250 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0251
     * @tc.name      testDsMutate0251
     * @tc.desc      Verify delete notifications accumulate across mixed removals.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0251 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.delete1stItem();
      source.delete2ndItem();
      source.deleteLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=9`);
      expect(source.totalCount()).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedCount=${listener.deletedCount}, expected=3`);
      expect(listener.deletedCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deleteIndexes.length}, expected=3`);
      expect(listener.deleteIndexes.length).assertEqual(3);
      log('testDsMutate0251 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSMUT_0252
     * @tc.name      testDsMutate0252
     * @tc.desc      Verify a mixed add and replace sequence ends in the exact expected state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsMutate0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsMutate0252 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.addLastItem();
      source.modifyAllData(['p0', 'p1', 'p2']);
      source.addItem(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=4`);
      expect(source.totalCount()).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(1)`);
      expect(source.getData(1)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected='p1'`);
      expect(source.getData(2)).assertEqual('p1');
      log('testDsMutate0252 end');
    })
  })
}
