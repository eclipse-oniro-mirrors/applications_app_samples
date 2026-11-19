/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { MemoDataSource } from '../../../main/ets/pages/DataSource';
import { MemoInfo } from '../../../main/ets/pages/MemoInfo';
import { MEMO_DATA } from '../../../main/ets/pages/MockData';

const DOMAIN: number = 0xF814;
const TAG: string = 'MemoDataSourceCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

class MemoDataChangeListener implements DataChangeListener {
  reloadedCount: number = 0;
  addCount: number = 0;
  changeCount: number = 0;
  deleteCount: number = 0;
  lastAddIndex: number = -1;
  lastChangeIndex: number = -1;
  lastDeleteIndex: number = -1;

  onDataReloaded(): void {
    this.reloadedCount++;
  }

  onDataAdd(index: number): void {
    this.addCount++;
    this.lastAddIndex = index;
  }

  onDataAdded(index: number): void {
  }

  onDataMove(from: number, to: number): void {
  }

  onDataMoved(from: number, to: number): void {
  }

  onDataChange(index: number): void {
    this.changeCount++;
    this.lastChangeIndex = index;
  }

  onDataChanged(index: number): void {
  }

  onDataDelete(index: number): void {
    this.deleteCount++;
    this.lastDeleteIndex = index;
  }

  onDataDeleted(index: number): void {
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
  }
}

export default function memoDataSourceCoreTest(): void {
  describe('MemoDataSourceCoreTest', () => {
    /**
     * @tc.number    SUB_EXPANDTITLE_DATASOURCE_0601
     * @tc.name      testMemoDataSourceCore0601
     * @tc.desc      Verify data source total count matches the memo data size.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataSourceCore0601', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataSourceCore0601 begin');
      const source: MemoDataSource = new MemoDataSource();
      const actual: number = source.totalCount();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${actual}, expected=MEMO_DATA.length`);
      expect(actual).assertEqual(MEMO_DATA.length);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof actual=${typeof actual}, expected='number'`);
      expect(typeof actual).assertEqual('number');
      log('testMemoDataSourceCore0601 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_DATASOURCE_0602
     * @tc.name      testMemoDataSourceCore0602
     * @tc.desc      Verify first memo is retrievable from the data source.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataSourceCore0602', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataSourceCore0602 begin');
      const source: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = source.getData(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.memoId=${actual.memoId}, expected=MEMO_DATA[0].memoId`);
      expect(actual.memoId).assertEqual(MEMO_DATA[0].memoId);
      log('testMemoDataSourceCore0602 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_DATASOURCE_0603
     * @tc.name      testMemoDataSourceCore0603
     * @tc.desc      Verify second memo title is retrievable from the data source.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataSourceCore0603', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataSourceCore0603 begin');
      const source: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = source.getData(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.title=${actual.title}, expected=MEMO_DATA[1].title`);
      expect(actual.title).assertEqual(MEMO_DATA[1].title);
      log('testMemoDataSourceCore0603 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_DATASOURCE_0604
     * @tc.name      testMemoDataSourceCore0604
     * @tc.desc      Verify last memo is retrievable from the data source.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataSourceCore0604', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataSourceCore0604 begin');
      const source: MemoDataSource = new MemoDataSource();
      const last: number = source.totalCount() - 1;
      const actual: MemoInfo = source.getData(last);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual.memoId=${actual.memoId}`);
      expect(actual.memoId).assertEqual(MEMO_DATA[last].memoId);
      log('testMemoDataSourceCore0604 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_DATASOURCE_0605
     * @tc.name      testMemoDataSourceCore0605
     * @tc.desc      Verify out of range index returns undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataSourceCore0605', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataSourceCore0605 begin');
      const source: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = source.getData(source.totalCount());
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined actual`);
      expect(actual).assertUndefined();
      log('testMemoDataSourceCore0605 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_DATASOURCE_0606
     * @tc.name      testMemoDataSourceCore0606
     * @tc.desc      Verify negative index returns undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataSourceCore0606', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataSourceCore0606 begin');
      const source: MemoDataSource = new MemoDataSource();
      const actual: MemoInfo = source.getData(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined actual`);
      expect(actual).assertUndefined();
      log('testMemoDataSourceCore0606 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_DATASOURCE_0607
     * @tc.name      testMemoDataSourceCore0607
     * @tc.desc      Verify every in range index returns a memo instance.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataSourceCore0607', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataSourceCore0607 begin');
      const source: MemoDataSource = new MemoDataSource();
      const total: number = source.totalCount();
      let valid: number = 0;
      for (let i: number = 0; i < total; i++) {
        if (source.getData(i) instanceof MemoInfo) {
          valid++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual valid=${valid}, expected=total`);
      expect(valid).assertEqual(total);
      log('testMemoDataSourceCore0607 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_DATASOURCE_0608
     * @tc.name      testMemoDataSourceCore0608
     * @tc.desc      Verify data source items mirror the mock data references.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataSourceCore0608', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataSourceCore0608 begin');
      const source: MemoDataSource = new MemoDataSource();
      const item: MemoInfo = source.getData(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue item === MEMO_DATA[2]=${item === MEMO_DATA[2]}`);
      expect(item === MEMO_DATA[2]).assertTrue();
      log('testMemoDataSourceCore0608 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_DATASOURCE_0609
     * @tc.name      testMemoDataSourceCore0609
     * @tc.desc      Verify registered listener receives the reload notification.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataSourceCore0609', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataSourceCore0609 begin');
      const source: MemoDataSource = new MemoDataSource();
      const listener: MemoDataChangeListener = new MemoDataChangeListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      log('testMemoDataSourceCore0609 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_DATASOURCE_0610
     * @tc.name      testMemoDataSourceCore0610
     * @tc.desc      Verify duplicate listener registration notifies only once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataSourceCore0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataSourceCore0610 begin');
      const source: MemoDataSource = new MemoDataSource();
      const listener: MemoDataChangeListener = new MemoDataChangeListener();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      log('testMemoDataSourceCore0610 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_DATASOURCE_0611
     * @tc.name      testMemoDataSourceCore0611
     * @tc.desc      Verify add notification forwards the item index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataSourceCore0611', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataSourceCore0611 begin');
      const source: MemoDataSource = new MemoDataSource();
      const listener: MemoDataChangeListener = new MemoDataChangeListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addCount=${listener.addCount}, expected=1`);
      expect(listener.addCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}, expected=3`);
      expect(listener.lastAddIndex).assertEqual(3);
      log('testMemoDataSourceCore0611 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_DATASOURCE_0612
     * @tc.name      testMemoDataSourceCore0612
     * @tc.desc      Verify change notification forwards the item index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataSourceCore0612', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataSourceCore0612 begin');
      const source: MemoDataSource = new MemoDataSource();
      const listener: MemoDataChangeListener = new MemoDataChangeListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changeCount=${listener.changeCount}, expected=1`);
      expect(listener.changeCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastChangeIndex=${listener.lastChangeIndex}`);
      expect(listener.lastChangeIndex).assertEqual(2);
      log('testMemoDataSourceCore0612 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_DATASOURCE_0613
     * @tc.name      testMemoDataSourceCore0613
     * @tc.desc      Verify delete notification forwards the item index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataSourceCore0613', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataSourceCore0613 begin');
      const source: MemoDataSource = new MemoDataSource();
      const listener: MemoDataChangeListener = new MemoDataChangeListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deleteCount=${listener.deleteCount}, expected=1`);
      expect(listener.deleteCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastDeleteIndex=${listener.lastDeleteIndex}`);
      expect(listener.lastDeleteIndex).assertEqual(5);
      log('testMemoDataSourceCore0613 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_DATASOURCE_0614
     * @tc.name      testMemoDataSourceCore0614
     * @tc.desc      Verify unregistered listener no longer receives notifications.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataSourceCore0614', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataSourceCore0614 begin');
      const source: MemoDataSource = new MemoDataSource();
      const listener: MemoDataChangeListener = new MemoDataChangeListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=0`);
      expect(listener.reloadedCount).assertEqual(0);
      log('testMemoDataSourceCore0614 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_DATASOURCE_0615
     * @tc.name      testMemoDataSourceCore0615
     * @tc.desc      Verify unregistering an unknown listener keeps notifications intact.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataSourceCore0615', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataSourceCore0615 begin');
      const source: MemoDataSource = new MemoDataSource();
      const listener: MemoDataChangeListener = new MemoDataChangeListener();
      const unknown: MemoDataChangeListener = new MemoDataChangeListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(unknown);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual unknown.reloadedCount=${unknown.reloadedCount}, expected=0`);
      expect(unknown.reloadedCount).assertEqual(0);
      log('testMemoDataSourceCore0615 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_DATASOURCE_0616
     * @tc.name      testMemoDataSourceCore0616
     * @tc.desc      Verify multiple listeners all receive notifications.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataSourceCore0616', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataSourceCore0616 begin');
      const source: MemoDataSource = new MemoDataSource();
      const first: MemoDataChangeListener = new MemoDataChangeListener();
      const second: MemoDataChangeListener = new MemoDataChangeListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.reloadedCount=${first.reloadedCount}, expected=1`);
      expect(first.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.reloadedCount=${second.reloadedCount}, expected=1`);
      expect(second.reloadedCount).assertEqual(1);
      log('testMemoDataSourceCore0616 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_DATASOURCE_0617
     * @tc.name      testMemoDataSourceCore0617
     * @tc.desc      Verify add notification supports the zero index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataSourceCore0617', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataSourceCore0617 begin');
      const source: MemoDataSource = new MemoDataSource();
      const listener: MemoDataChangeListener = new MemoDataChangeListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}, expected=0`);
      expect(listener.lastAddIndex).assertEqual(0);
      log('testMemoDataSourceCore0617 end');
    })

    /**
     * @tc.number    SUB_EXPANDTITLE_DATASOURCE_0618
     * @tc.name      testMemoDataSourceCore0618
     * @tc.desc      Verify pushed memo is appended and visible at the tail index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMemoDataSourceCore0618', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testMemoDataSourceCore0618 begin');
      const source: MemoDataSource = new MemoDataSource();
      const before: number = source.totalCount();
      const pushed: MemoInfo = new MemoInfo('id_push_test', 'Pushed title', 'Now', '', 'Pushed content');
      source.pushData(pushed);
      const after: number = source.totalCount();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual after=${after}, expected=before + 1`);
      expect(after).assertEqual(before + 1);
      const stored: MemoInfo = source.getData(after - 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual stored.memoId=${stored.memoId}, expected='id_push_test'`);
      expect(stored.memoId).assertEqual('id_push_test');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual stored.title=${stored.title}, expected='Pushed title'`);
      expect(stored.title).assertEqual('Pushed title');
      log('testMemoDataSourceCore0618 end');
    })
  })
}
