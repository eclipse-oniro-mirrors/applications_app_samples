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
const TAG: string = 'DataSourceSeqFlowTest';

const DEFAULT_ITEMS: string[] = ['第一条数据', '第二条数据', '第三条数据', '第四条数据', '第五条数据', '第六条数据',
  '第七条数据', '第八条数据', '第九条数据', '第十条数据', '第十一条数据', '第十二条数据'];

class EventLogListener implements DataChangeListener {
  eventLog: string[] = [];
  reloadedCount: number = 0;
  addedCount: number = 0;
  addIndexes: number[] = [];
  changedCount: number = 0;
  changeIndexes: number[] = [];
  deletedCount: number = 0;
  lastDeleteIndex: number = -1;
  deleteIndexes: number[] = [];
  movedCount: number = 0;

  onDataReloaded(): void {
    this.reloadedCount++;
    this.eventLog.push('reload');
  }

  onDataAdd(index: number): void {
    this.addedCount++;
    this.addIndexes.push(index);
    this.eventLog.push('add');
  }

  onDataChange(index: number): void {
    this.changedCount++;
    this.changeIndexes.push(index);
    this.eventLog.push('change');
  }

  onDataDelete(index: number): void {
    this.deletedCount++;
    this.lastDeleteIndex = index;
    this.deleteIndexes.push(index);
    this.eventLog.push('delete');
  }

  onDataMove(from: number, to: number): void {
    this.movedCount++;
    this.eventLog.push('move');
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

export default function dataSourceSeqFlowTest(): void {
  describe('KeyboardAvoidDataSourceSeqFlowTest', () => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0301
     * @tc.name      testDsSequence0301
     * @tc.desc      Verify a reload pass keeps every default item in place.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0301 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.notifyDataReload();
      for (let i: number = 0; i < 12; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(i)=${source.getData(i)}`);
        expect(source.getData(i)).assertEqual(DEFAULT_ITEMS[i]);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.getData(0)=${typeof source.getData(0)}`);
      expect(typeof source.getData(0)).assertEqual('string');
      log('testDsSequence0301 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0302
     * @tc.name      testDsSequence0302
     * @tc.desc      Verify a registered listener observes replace and the count update together.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0302 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.modifyAllData(['r0', 'r1']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='r0'`);
      expect(source.getData(0)).assertEqual('r0');
      log('testDsSequence0302 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0303
     * @tc.name      testDsSequence0303
     * @tc.desc      Verify events after unregistration do not reach the removed listener.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0303 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.addLastItem();
      source.unregisterDataChangeListener(listener);
      source.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=14`);
      expect(source.totalCount()).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(0)`);
      expect(source.getData(0)).assertUndefined();
      log('testDsSequence0303 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0304
     * @tc.name      testDsSequence0304
     * @tc.desc      Verify mixed operations keep per-listener counters independent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0304 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const first: EventLogListener = new EventLogListener();
      const second: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.add1stItem();
      source.unregisterDataChangeListener(first);
      source.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.addedCount=${first.addedCount}, expected=1`);
      expect(first.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.addedCount=${second.addedCount}, expected=2`);
      expect(second.addedCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=14`);
      expect(source.totalCount()).assertEqual(14);
      log('testDsSequence0304 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0305
     * @tc.name      testDsSequence0305
     * @tc.desc      Verify every slot of a hundred-item source reads back its input.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0305 begin');
      const input: string[] = [];
      for (let i: number = 0; i < 100; i++) {
        input.push('row' + i);
      }
      const source: KeyboardDataSource = new KeyboardDataSource(input);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=100`);
      expect(source.totalCount()).assertEqual(100);
      for (let i: number = 0; i < 100; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(i)=${source.getData(i)}, expected='row' + i`);
        expect(source.getData(i)).assertEqual('row' + i);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.getData(0)=${typeof source.getData(0)}`);
      expect(typeof source.getData(0)).assertEqual('string');
      log('testDsSequence0305 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0306
     * @tc.name      testDsSequence0306
     * @tc.desc      Verify fifty head deletions halve a hundred-item source.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0306 begin');
      const input: string[] = [];
      for (let i: number = 0; i < 100; i++) {
        input.push('row' + i);
      }
      const source: KeyboardDataSource = new KeyboardDataSource(input);
      for (let i: number = 0; i < 50; i++) {
        source.delete1stItem();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=50`);
      expect(source.totalCount()).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='row50'`);
      expect(source.getData(0)).assertEqual('row50');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(49)=${source.getData(49)}, expected='row99'`);
      expect(source.getData(49)).assertEqual('row99');
      log('testDsSequence0306 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0307
     * @tc.name      testDsSequence0307
     * @tc.desc      Verify twelve add notifications record the zero-to-eleven index series.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0307 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      for (let i: number = 0; i < 12; i++) {
        source.notifyDataAdd(i);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=12`);
      expect(listener.addedCount).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes.length=${listener.addIndexes.length}`);
      expect(listener.addIndexes.length).assertEqual(12);
      for (let i: number = 0; i < 12; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[i]=${listener.addIndexes[i]}`);
        expect(listener.addIndexes[i]).assertEqual(i);
      }
      log('testDsSequence0307 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0308
     * @tc.name      testDsSequence0308
     * @tc.desc      Verify clear-then-restore through modifyAllData returns the original layout.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0308 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.modifyAllData([]);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      source.modifyAllData(DEFAULT_ITEMS);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(11)=${source.getData(11)}, expected='第十二条数据'`);
      expect(source.getData(11)).assertEqual('第十二条数据');
      log('testDsSequence0308 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0309
     * @tc.name      testDsSequence0309
     * @tc.desc      Verify three zero-index insertions on an empty source stack up.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0309 begin');
      const source: KeyboardDataSource = new KeyboardDataSource([]);
      source.addItem(0);
      source.addItem(0);
      source.addItem(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=3`);
      expect(source.totalCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(0)`);
      expect(source.getData(0)).assertUndefined();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(2)`);
      expect(source.getData(2)).assertUndefined();
      log('testDsSequence0309 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0310
     * @tc.name      testDsSequence0310
     * @tc.desc      Verify the three delete helpers all stay silent-safe on an empty source.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0310 begin');
      const source: KeyboardDataSource = new KeyboardDataSource([]);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.delete1stItem();
      source.delete2ndItem();
      source.deleteLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedCount=${listener.deletedCount}, expected=3`);
      expect(listener.deletedCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deleteIndexes[0]=${listener.deleteIndexes[0]}`);
      expect(listener.deleteIndexes[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deleteIndexes[1]=${listener.deleteIndexes[1]}`);
      expect(listener.deleteIndexes[1]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deleteIndexes[2]=${listener.deleteIndexes[2]}`);
      expect(listener.deleteIndexes[2]).assertEqual(0);
      log('testDsSequence0310 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0311
     * @tc.name      testDsSequence0311
     * @tc.desc      Verify five tail additions on an empty source create five empty slots.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0311 begin');
      const source: KeyboardDataSource = new KeyboardDataSource([]);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      for (let i: number = 0; i < 5; i++) {
        source.addLastItem();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=5`);
      expect(source.totalCount()).assertEqual(5);
      for (let i: number = 0; i < 5; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(i)`);
        expect(source.getData(i)).assertUndefined();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes.length=${listener.addIndexes.length}`);
      expect(listener.addIndexes.length).assertEqual(5);
      log('testDsSequence0311 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0312
     * @tc.name      testDsSequence0312
     * @tc.desc      Verify removing the second entry keeps relative order of duplicates.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0312 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a', 'b', 'a', 'b']);
      source.delete2ndItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=3`);
      expect(source.totalCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='a'`);
      expect(source.getData(0)).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='a'`);
      expect(source.getData(1)).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected='b'`);
      expect(source.getData(2)).assertEqual('b');
      log('testDsSequence0312 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0313
     * @tc.name      testDsSequence0313
     * @tc.desc      Verify three concurrent sources mutate without touching each other.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0313 begin');
      const one: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const two: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const three: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      one.delete1stItem();
      two.addLastItem();
      three.modifyAllData(['x']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual one.totalCount()=${one.totalCount()}, expected=11`);
      expect(one.totalCount()).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual two.totalCount()=${two.totalCount()}, expected=13`);
      expect(two.totalCount()).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual three.totalCount()=${three.totalCount()}, expected=1`);
      expect(three.totalCount()).assertEqual(1);
      log('testDsSequence0313 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0314
     * @tc.name      testDsSequence0314
     * @tc.desc      Verify move notifications never change the stored count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0314 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(0, 11);
      source.notifyDataMove(11, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.movedCount=${listener.movedCount}, expected=2`);
      expect(listener.movedCount).assertEqual(2);
      log('testDsSequence0314 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0315
     * @tc.name      testDsSequence0315
     * @tc.desc      Verify repeated reload calls are idempotent for stored data.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0315 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.reload();
      source.reload();
      source.reload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=3`);
      expect(listener.reloadedCount).assertEqual(3);
      log('testDsSequence0315 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0316
     * @tc.name      testDsSequence0316
     * @tc.desc      Verify replacing with the same array twice still notifies twice.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0316 begin');
      const replacement: string[] = ['r0', 'r1', 'r2'];
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.modifyAllData(replacement);
      source.modifyAllData(replacement);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=2`);
      expect(listener.reloadedCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=3`);
      expect(source.totalCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(2)=${source.getData(2)}, expected='r2'`);
      expect(source.getData(2)).assertEqual('r2');
      log('testDsSequence0316 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0317
     * @tc.name      testDsSequence0317
     * @tc.desc      Verify counters freeze after every listener is unregistered.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0317 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const first: EventLogListener = new EventLogListener();
      const second: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.add1stItem();
      source.unregisterDataChangeListener(first);
      source.unregisterDataChangeListener(second);
      source.add1stItem();
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.addedCount=${first.addedCount}, expected=1`);
      expect(first.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.addedCount=${second.addedCount}, expected=1`);
      expect(second.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.reloadedCount=${first.reloadedCount}, expected=0`);
      expect(first.reloadedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=14`);
      expect(source.totalCount()).assertEqual(14);
      log('testDsSequence0317 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0318
     * @tc.name      testDsSequence0318
     * @tc.desc      Verify one pass over every notification type bumps each counter once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0318 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.add1stItem();
      source.notifyDataChange(0);
      source.delete1stItem();
      source.notifyDataMove(0, 1);
      source.reload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changedCount=${listener.changedCount}, expected=1`);
      expect(listener.changedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedCount=${listener.deletedCount}, expected=1`);
      expect(listener.deletedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.movedCount=${listener.movedCount}, expected=1`);
      expect(listener.movedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      log('testDsSequence0318 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0319
     * @tc.name      testDsSequence0319
     * @tc.desc      Verify the event log preserves the notification order exactly.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0319 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataAdd(3);
      source.notifyDataChange(1);
      source.notifyDataDelete(2);
      source.notifyDataMove(0, 4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventLog.length=${listener.eventLog.length}`);
      expect(listener.eventLog.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventLog[0]=${listener.eventLog[0]}`);
      expect(listener.eventLog[0]).assertEqual('reload');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventLog[1]=${listener.eventLog[1]}, expected='add'`);
      expect(listener.eventLog[1]).assertEqual('add');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventLog[2]=${listener.eventLog[2]}`);
      expect(listener.eventLog[2]).assertEqual('change');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventLog[3]=${listener.eventLog[3]}`);
      expect(listener.eventLog[3]).assertEqual('delete');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventLog[4]=${listener.eventLog[4]}`);
      expect(listener.eventLog[4]).assertEqual('move');
      log('testDsSequence0319 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0320
     * @tc.name      testDsSequence0320
     * @tc.desc      Verify head and tail insert helpers notify their own boundary indexes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0320 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.add1stItem();
      source.addLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[0]=${listener.addIndexes[0]}, expected=0`);
      expect(listener.addIndexes[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[1]=${listener.addIndexes[1]}, expected=13`);
      expect(listener.addIndexes[1]).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=2`);
      expect(listener.addedCount).assertEqual(2);
      log('testDsSequence0320 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0321
     * @tc.name      testDsSequence0321
     * @tc.desc      Verify a two-hundred-item source keeps its endpoints readable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0321 begin');
      const input: string[] = [];
      for (let i: number = 0; i < 200; i++) {
        input.push('big' + i);
      }
      const source: KeyboardDataSource = new KeyboardDataSource(input);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=200`);
      expect(source.totalCount()).assertEqual(200);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='big0'`);
      expect(source.getData(0)).assertEqual('big0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(199)=${source.getData(199)}`);
      expect(source.getData(199)).assertEqual('big199');
      log('testDsSequence0321 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0322
     * @tc.name      testDsSequence0322
     * @tc.desc      Verify spot checks hold after replacing a hundred-item source.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0322 begin');
      const input: string[] = [];
      for (let i: number = 0; i < 100; i++) {
        input.push('old' + i);
      }
      const source: KeyboardDataSource = new KeyboardDataSource(input);
      const fresh: string[] = [];
      for (let i: number = 0; i < 20; i++) {
        fresh.push('new' + i);
      }
      source.modifyAllData(fresh);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=20`);
      expect(source.totalCount()).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='new0'`);
      expect(source.getData(0)).assertEqual('new0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(19)=${source.getData(19)}, expected='new19'`);
      expect(source.getData(19)).assertEqual('new19');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(10)=${source.getData(10)}, expected='new10'`);
      expect(source.getData(10)).assertEqual('new10');
      log('testDsSequence0322 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0323
     * @tc.name      testDsSequence0323
     * @tc.desc      Verify repeated fresh constructions always yield the same count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0323 begin');
      for (let round: number = 0; round < 5; round++) {
        const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
        expect(source.totalCount()).assertEqual(12);
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
        expect(source.getData(0)).assertEqual('第一条数据');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual new KeyboardDataSource(DEFAULT_ITEMS).totalC..., expected=12`);
      expect(new KeyboardDataSource(DEFAULT_ITEMS).totalCount()).assertEqual(12);
      log('testDsSequence0323 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0324
     * @tc.name      testDsSequence0324
     * @tc.desc      Verify combined head and second deletions keep the remaining order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0324 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.delete1stItem();
      source.delete2ndItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=10`);
      expect(source.totalCount()).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第二条数据'`);
      expect(source.getData(0)).assertEqual('第二条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='第四条数据'`);
      expect(source.getData(1)).assertEqual('第四条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(9)=${source.getData(9)}, expected='第十二条数据'`);
      expect(source.getData(9)).assertEqual('第十二条数据');
      log('testDsSequence0324 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0325
     * @tc.name      testDsSequence0325
     * @tc.desc      Verify negative and length-minus-one insert positions agree.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0325 begin');
      const viaNegative: KeyboardDataSource = new KeyboardDataSource(['a', 'b', 'c']);
      const viaPositive: KeyboardDataSource = new KeyboardDataSource(['a', 'b', 'c']);
      viaNegative.addItem(-1);
      viaPositive.addItem(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual viaNegative.totalCount()=${viaNegative.totalCount()}`);
      expect(viaNegative.totalCount()).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual viaPositive.totalCount()=${viaPositive.totalCount()}`);
      expect(viaPositive.totalCount()).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual viaNegative.getData(2)=${viaNegative.getData(2)}`);
      expect(viaNegative.getData(2)).assertEqual(viaPositive.getData(2));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual viaNegative.getData(3)=${viaNegative.getData(3)}`);
      expect(viaNegative.getData(3)).assertEqual(viaPositive.getData(3));
      log('testDsSequence0325 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0326
     * @tc.name      testDsSequence0326
     * @tc.desc      Verify a notification burst alone keeps the stored content stable.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0326 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      for (let i: number = 0; i < 12; i++) {
        source.notifyDataChange(i);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changedCount=${listener.changedCount}, expected=12`);
      expect(listener.changedCount).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      log('testDsSequence0326 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0327
     * @tc.name      testDsSequence0327
     * @tc.desc      Verify edits through the shared array stay visible without any event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0327 begin');
      const external: string[] = ['a', 'b', 'c'];
      const source: KeyboardDataSource = new KeyboardDataSource(external);
      source.modifyAllData(external);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      external[0] = 'z';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='z'`);
      expect(source.getData(0)).assertEqual('z');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=0`);
      expect(listener.reloadedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=0`);
      expect(listener.addedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=3`);
      expect(source.totalCount()).assertEqual(3);
      log('testDsSequence0327 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0328
     * @tc.name      testDsSequence0328
     * @tc.desc      Verify inserting through the source never grows the outside array.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0328 begin');
      const external: string[] = DEFAULT_ITEMS.slice();
      const source: KeyboardDataSource = new KeyboardDataSource(external);
      source.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual external.length=${external.length}, expected=12`);
      expect(external.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=13`);
      expect(source.totalCount()).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual external[0]=${external[0]}, expected='第一条数据'`);
      expect(external[0]).assertEqual('第一条数据');
      log('testDsSequence0328 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0329
     * @tc.name      testDsSequence0329
     * @tc.desc      Verify a fully drained source can accept a fresh head insertion.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0329 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      for (let i: number = 0; i < 12; i++) {
        source.delete1stItem();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      source.add1stItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(0)`);
      expect(source.getData(0)).assertUndefined();
      log('testDsSequence0329 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0330
     * @tc.name      testDsSequence0330
     * @tc.desc      Verify five register-notify-unregister rounds deliver one event per round.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0330 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      for (let round: number = 0; round < 5; round++) {
        source.registerDataChangeListener(listener);
        source.notifyDataAdd(round);
        source.unregisterDataChangeListener(listener);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=5`);
      expect(listener.addedCount).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes.length=${listener.addIndexes.length}`);
      expect(listener.addIndexes.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[4]=${listener.addIndexes[4]}, expected=4`);
      expect(listener.addIndexes[4]).assertEqual(4);
      log('testDsSequence0330 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0331
     * @tc.name      testDsSequence0331
     * @tc.desc      Verify the default data bookends match their expected literals.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0331 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const head: string = source.getData(0);
      const tail: string = source.getData(11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual head=${head}, expected='第一条数据'`);
      expect(head).assertEqual('第一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual tail=${tail}, expected='第十二条数据'`);
      expect(tail).assertEqual('第十二条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue head !== tail=${head !== tail}`);
      expect(head !== tail).assertTrue();
      log('testDsSequence0331 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0332
     * @tc.name      testDsSequence0332
     * @tc.desc      Verify a tail add followed by tail delete restores the original tail.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0332 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      source.addLastItem();
      source.deleteLastItem();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='第一条数据'`);
      expect(source.getData(0)).assertEqual('第一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(11)=${source.getData(11)}, expected='第十二条数据'`);
      expect(source.getData(11)).assertEqual('第十二条数据');
      log('testDsSequence0332 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0333
     * @tc.name      testDsSequence0333
     * @tc.desc      Verify an active listener receives the replace notification of modifyAllData.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0333 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.modifyAllData(['only']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventLog[0]=${listener.eventLog[0]}`);
      expect(listener.eventLog[0]).assertEqual('reload');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='only'`);
      expect(source.getData(0)).assertEqual('only');
      log('testDsSequence0333 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0334
     * @tc.name      testDsSequence0334
     * @tc.desc      Verify interleaved add and change notifications keep their order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0334 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      source.notifyDataChange(0);
      source.notifyDataAdd(1);
      source.notifyDataChange(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventLog.length=${listener.eventLog.length}`);
      expect(listener.eventLog.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventLog[0]=${listener.eventLog[0]}, expected='add'`);
      expect(listener.eventLog[0]).assertEqual('add');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventLog[1]=${listener.eventLog[1]}`);
      expect(listener.eventLog[1]).assertEqual('change');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventLog[2]=${listener.eventLog[2]}, expected='add'`);
      expect(listener.eventLog[2]).assertEqual('add');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventLog[3]=${listener.eventLog[3]}`);
      expect(listener.eventLog[3]).assertEqual('change');
      log('testDsSequence0334 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0335
     * @tc.name      testDsSequence0335
     * @tc.desc      Verify three sources built from one array stay mutually independent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0335 begin');
      const shared: string[] = DEFAULT_ITEMS.slice();
      const one: KeyboardDataSource = new KeyboardDataSource(shared);
      const two: KeyboardDataSource = new KeyboardDataSource(shared);
      const three: KeyboardDataSource = new KeyboardDataSource(shared);
      one.modifyAllData(['x']);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual one.totalCount()=${one.totalCount()}, expected=1`);
      expect(one.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual two.totalCount()=${two.totalCount()}, expected=12`);
      expect(two.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual three.totalCount()=${three.totalCount()}, expected=12`);
      expect(three.totalCount()).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual two.getData(0)=${two.getData(0)}, expected='第一条数据'`);
      expect(two.getData(0)).assertEqual('第一条数据');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual shared.length=${shared.length}, expected=12`);
      expect(shared.length).assertEqual(12);
      log('testDsSequence0335 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0336
     * @tc.name      testDsSequence0336
     * @tc.desc      Verify the full notification set is safe on an empty source.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0336 begin');
      const source: KeyboardDataSource = new KeyboardDataSource([]);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataAdd(0);
      source.notifyDataChange(0);
      source.notifyDataDelete(0);
      source.notifyDataMove(0, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.eventLog.length=${listener.eventLog.length}`);
      expect(listener.eventLog.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      log('testDsSequence0336 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0337
     * @tc.name      testDsSequence0337
     * @tc.desc      Verify delete notifications pass through negative indexes verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0337 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(-5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedCount=${listener.deletedCount}, expected=1`);
      expect(listener.deletedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastDeleteIndex=${listener.lastDeleteIndex}`);
      expect(listener.lastDeleteIndex).assertEqual(-5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=12`);
      expect(source.totalCount()).assertEqual(12);
      log('testDsSequence0337 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0338
     * @tc.name      testDsSequence0338
     * @tc.desc      Verify change notifications forward both boundary indexes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0338 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(0);
      source.notifyDataChange(11);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changedCount=${listener.changedCount}, expected=2`);
      expect(listener.changedCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changeIndexes[0]=${listener.changeIndexes[0]}`);
      expect(listener.changeIndexes[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changeIndexes[1]=${listener.changeIndexes[1]}`);
      expect(listener.changeIndexes[1]).assertEqual(11);
      log('testDsSequence0338 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0339
     * @tc.name      testDsSequence0339
     * @tc.desc      Verify draining a hundred-item source by tail deletions ends empty.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0339 begin');
      const input: string[] = [];
      for (let i: number = 0; i < 100; i++) {
        input.push('row' + i);
      }
      const source: KeyboardDataSource = new KeyboardDataSource(input);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      for (let i: number = 0; i < 100; i++) {
        source.deleteLastItem();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deleteIndexes.length}, expected=100`);
      expect(listener.deleteIndexes.length).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastDeleteIndex=${listener.lastDeleteIndex}`);
      expect(listener.lastDeleteIndex).assertEqual(0);
      log('testDsSequence0339 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSSEQ_0340
     * @tc.name      testDsSequence0340
     * @tc.desc      Verify a full edit lifecycle ends in the exact expected state.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsSequence0340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsSequence0340 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(DEFAULT_ITEMS);
      const listener: EventLogListener = new EventLogListener();
      source.registerDataChangeListener(listener);
      source.delete1stItem();
      source.delete1stItem();
      source.delete1stItem();
      source.addLastItem();
      source.modifyAllData(['final0', 'final1']);
      source.reload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='final0'`);
      expect(source.getData(0)).assertEqual('final0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='final1'`);
      expect(source.getData(1)).assertEqual('final1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedCount=${listener.deletedCount}, expected=3`);
      expect(listener.deletedCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=2`);
      expect(listener.reloadedCount).assertEqual(2);
      log('testDsSequence0340 end');
    })
  })
}
