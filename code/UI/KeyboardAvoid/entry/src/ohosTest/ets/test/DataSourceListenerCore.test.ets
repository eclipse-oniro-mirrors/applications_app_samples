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
const TAG: string = 'DataSourceListenerCoreTest';

class NotificationRecorder implements DataChangeListener {
  notificationHistory: string[] = [];
  reloadedCount: number = 0;
  addedCount: number = 0;
  lastAddIndex: number = -1;
  addIndexes: number[] = [];
  changedCount: number = 0;
  lastChangeIndex: number = -1;
  changeIndexes: number[] = [];
  deletedCount: number = 0;
  lastDeleteIndex: number = -1;
  deleteIndexes: number[] = [];
  movedCount: number = 0;
  lastMoveFrom: number = -1;
  lastMoveTo: number = -1;
  addedNewCount: number = 0;
  changedNewCount: number = 0;
  deletedNewCount: number = 0;
  movedNewCount: number = 0;
  datasetChangeCount: number = 0;

  onDataReloaded(): void {
    this.reloadedCount++;
    this.notificationHistory.push('reload');
  }

  onDataAdd(index: number): void {
    this.addedCount++;
    this.lastAddIndex = index;
    this.addIndexes.push(index);
    this.notificationHistory.push('add');
  }

  onDataChange(index: number): void {
    this.changedCount++;
    this.lastChangeIndex = index;
    this.changeIndexes.push(index);
    this.notificationHistory.push('change');
  }

  onDataDelete(index: number): void {
    this.deletedCount++;
    this.lastDeleteIndex = index;
    this.deleteIndexes.push(index);
    this.notificationHistory.push('delete');
  }

  onDataMove(from: number, to: number): void {
    this.movedCount++;
    this.lastMoveFrom = from;
    this.lastMoveTo = to;
    this.notificationHistory.push('move');
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

export default function dataSourceListenerCoreTest(): void {
  describe('KeyboardAvoidDataSourceListenerCoreTest', () => {
    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0101
     * @tc.name      testDsListener0101
     * @tc.desc      Verify a registered listener receives one reload notification.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0101 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0', 'a1']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notificationHistory[0]=${listener.notificationHistory[0]}`);
      expect(listener.notificationHistory[0]).assertEqual('reload');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${typeof listener.reloadedCount}, expected='number'`);
      expect(typeof listener.reloadedCount).assertEqual('number');
      log('testDsListener0101 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0102
     * @tc.name      testDsListener0102
     * @tc.desc      Verify two reload notifications are counted separately.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0102 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=2`);
      expect(listener.reloadedCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notificationHistory.length=${listener.notificationHistory.length}`);
      expect(listener.notificationHistory.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      log('testDsListener0102 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0103
     * @tc.name      testDsListener0103
     * @tc.desc      Verify reloading without any listener does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0103 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0', 'a1', 'a2']);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=3`);
      expect(source.totalCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='a0'`);
      expect(source.getData(0)).assertEqual('a0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='a1'`);
      expect(source.getData(1)).assertEqual('a1');
      log('testDsListener0103 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0104
     * @tc.name      testDsListener0104
     * @tc.desc      Verify notifyDataAdd forwards the given index to the listener.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0104 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0', 'a1']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}, expected=3`);
      expect(listener.lastAddIndex).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes.length=${listener.addIndexes.length}`);
      expect(listener.addIndexes.length).assertEqual(1);
      log('testDsListener0104 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0105
     * @tc.name      testDsListener0105
     * @tc.desc      Verify add notifications at index zero are forwarded unchanged.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0105 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}, expected=0`);
      expect(listener.lastAddIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[0]=${listener.addIndexes[0]}, expected=0`);
      expect(listener.addIndexes[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      log('testDsListener0105 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0106
     * @tc.name      testDsListener0106
     * @tc.desc      Verify negative add indexes are forwarded to listeners as given.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0106 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}, expected=-1`);
      expect(listener.lastAddIndex).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes.length=${listener.addIndexes.length}`);
      expect(listener.addIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      log('testDsListener0106 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0107
     * @tc.name      testDsListener0107
     * @tc.desc      Verify large add indexes keep their numeric value end to end.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0107 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}`);
      expect(listener.lastAddIndex).assertEqual(2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof listener.lastAddIndex=${typeof listener.lastAddIndex}`);
      expect(typeof listener.lastAddIndex).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      log('testDsListener0107 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0108
     * @tc.name      testDsListener0108
     * @tc.desc      Verify consecutive add notifications keep their emission order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0108 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      source.notifyDataAdd(1);
      source.notifyDataAdd(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=3`);
      expect(listener.addedCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[0]=${listener.addIndexes[0]}, expected=0`);
      expect(listener.addIndexes[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[1]=${listener.addIndexes[1]}, expected=1`);
      expect(listener.addIndexes[1]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[2]=${listener.addIndexes[2]}, expected=2`);
      expect(listener.addIndexes[2]).assertEqual(2);
      log('testDsListener0108 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0109
     * @tc.name      testDsListener0109
     * @tc.desc      Verify notifyDataChange forwards the changed index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0109 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0', 'a1', 'a2']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changedCount=${listener.changedCount}, expected=1`);
      expect(listener.changedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastChangeIndex=${listener.lastChangeIndex}`);
      expect(listener.lastChangeIndex).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.changeIndexes.length}, expected=1`);
      expect(listener.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=3`);
      expect(source.totalCount()).assertEqual(3);
      log('testDsListener0109 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0110
     * @tc.name      testDsListener0110
     * @tc.desc      Verify change notifications for the last slot keep the exact index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0110 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0', 'a1', 'a2']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastChangeIndex=${listener.lastChangeIndex}`);
      expect(listener.lastChangeIndex).assertEqual(source.totalCount() - 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.changeIndexes.length}, expected=1`);
      expect(listener.changeIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changedCount=${listener.changedCount}, expected=1`);
      expect(listener.changedCount).assertEqual(1);
      log('testDsListener0110 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0111
     * @tc.name      testDsListener0111
     * @tc.desc      Verify consecutive change notifications accumulate in order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0111 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0', 'a1', 'a2']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(0);
      source.notifyDataChange(1);
      source.notifyDataChange(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changedCount=${listener.changedCount}, expected=3`);
      expect(listener.changedCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changeIndexes[0]=${listener.changeIndexes[0]}`);
      expect(listener.changeIndexes[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changeIndexes[1]=${listener.changeIndexes[1]}`);
      expect(listener.changeIndexes[1]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changeIndexes[2]=${listener.changeIndexes[2]}`);
      expect(listener.changeIndexes[2]).assertEqual(2);
      log('testDsListener0111 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0112
     * @tc.name      testDsListener0112
     * @tc.desc      Verify notifyDataDelete forwards the deleted index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0112 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0', 'a1']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedCount=${listener.deletedCount}, expected=1`);
      expect(listener.deletedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastDeleteIndex=${listener.lastDeleteIndex}`);
      expect(listener.lastDeleteIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${listener.deleteIndexes.length}, expected=1`);
      expect(listener.deleteIndexes.length).assertEqual(1);
      log('testDsListener0112 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0113
     * @tc.name      testDsListener0113
     * @tc.desc      Verify delete notifications keep arbitrary indexes untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0113 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastDeleteIndex=${listener.lastDeleteIndex}`);
      expect(listener.lastDeleteIndex).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deleteIndexes[0]=${listener.deleteIndexes[0]}`);
      expect(listener.deleteIndexes[0]).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedCount=${listener.deletedCount}, expected=1`);
      expect(listener.deletedCount).assertEqual(1);
      log('testDsListener0113 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0114
     * @tc.name      testDsListener0114
     * @tc.desc      Verify notifyDataMove forwards both endpoints to the listener.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0114 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0', 'a1', 'a2']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(2, 7);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.movedCount=${listener.movedCount}, expected=1`);
      expect(listener.movedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastMoveFrom=${listener.lastMoveFrom}, expected=2`);
      expect(listener.lastMoveFrom).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastMoveTo=${listener.lastMoveTo}, expected=7`);
      expect(listener.lastMoveTo).assertEqual(7);
      log('testDsListener0114 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0115
     * @tc.name      testDsListener0115
     * @tc.desc      Verify a self-move notification keeps both endpoints at zero.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0115 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(0, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastMoveFrom=${listener.lastMoveFrom}, expected=0`);
      expect(listener.lastMoveFrom).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastMoveTo=${listener.lastMoveTo}, expected=0`);
      expect(listener.lastMoveTo).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.movedCount=${listener.movedCount}, expected=1`);
      expect(listener.movedCount).assertEqual(1);
      log('testDsListener0115 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0116
     * @tc.name      testDsListener0116
     * @tc.desc      Verify a tail-to-head move notification forwards the endpoints as given.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0116 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0', 'a1', 'a2']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(2, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastMoveFrom=${listener.lastMoveFrom}, expected=2`);
      expect(listener.lastMoveFrom).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastMoveTo=${listener.lastMoveTo}, expected=0`);
      expect(listener.lastMoveTo).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notificationHistory[0]=${listener.notificationHistory[0]}`);
      expect(listener.notificationHistory[0]).assertEqual('move');
      log('testDsListener0116 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0117
     * @tc.name      testDsListener0117
     * @tc.desc      Verify registering the same listener twice keeps one notification path.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0117 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes.length=${listener.addIndexes.length}`);
      expect(listener.addIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notificationHistory.length=${listener.notificationHistory.length}`);
      expect(listener.notificationHistory.length).assertEqual(1);
      log('testDsListener0117 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0118
     * @tc.name      testDsListener0118
     * @tc.desc      Verify triple registration of one listener still delivers events once.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0118 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notificationHistory.length=${listener.notificationHistory.length}`);
      expect(listener.notificationHistory.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='a0'`);
      expect(source.getData(0)).assertEqual('a0');
      log('testDsListener0118 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0119
     * @tc.name      testDsListener0119
     * @tc.desc      Verify two distinct listeners both receive an add notification.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0119 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const first: NotificationRecorder = new NotificationRecorder();
      const second: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataAdd(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.addedCount=${first.addedCount}, expected=1`);
      expect(first.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.addedCount=${second.addedCount}, expected=1`);
      expect(second.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.lastAddIndex=${first.lastAddIndex}, expected=1`);
      expect(first.lastAddIndex).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.lastAddIndex=${second.lastAddIndex}, expected=1`);
      expect(second.lastAddIndex).assertEqual(1);
      log('testDsListener0119 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0120
     * @tc.name      testDsListener0120
     * @tc.desc      Verify three distinct listeners all receive a reload notification.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0120 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const first: NotificationRecorder = new NotificationRecorder();
      const second: NotificationRecorder = new NotificationRecorder();
      const third: NotificationRecorder = new NotificationRecorder();
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
      log('testDsListener0120 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0121
     * @tc.name      testDsListener0121
     * @tc.desc      Verify an unregistered listener stops receiving add notifications.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0121 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      source.unregisterDataChangeListener(listener);
      source.notifyDataAdd(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[0]=${listener.addIndexes[0]}, expected=0`);
      expect(listener.addIndexes[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      log('testDsListener0121 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0122
     * @tc.name      testDsListener0122
     * @tc.desc      Verify unregistering a listener that was never added does not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0122 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.unregisterDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=0`);
      expect(listener.reloadedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='a0'`);
      expect(source.getData(0)).assertEqual('a0');
      log('testDsListener0122 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0123
     * @tc.name      testDsListener0123
     * @tc.desc      Verify repeated unregister calls for one listener do not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0123 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=0`);
      expect(listener.reloadedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='a0'`);
      expect(source.getData(0)).assertEqual('a0');
      log('testDsListener0123 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0124
     * @tc.name      testDsListener0124
     * @tc.desc      Verify unregistering one listener keeps another one subscribed.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0124 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const kept: NotificationRecorder = new NotificationRecorder();
      const removed: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(kept);
      source.registerDataChangeListener(removed);
      source.unregisterDataChangeListener(removed);
      source.notifyDataAdd(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual kept.addedCount=${kept.addedCount}, expected=1`);
      expect(kept.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual removed.addedCount=${removed.addedCount}, expected=0`);
      expect(removed.addedCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual kept.lastAddIndex=${kept.lastAddIndex}, expected=0`);
      expect(kept.lastAddIndex).assertEqual(0);
      log('testDsListener0124 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0125
     * @tc.name      testDsListener0125
     * @tc.desc      Verify a re-registered listener receives events again.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0125 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}, expected=2`);
      expect(listener.lastAddIndex).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[0]=${listener.addIndexes[0]}, expected=2`);
      expect(listener.addIndexes[0]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      log('testDsListener0125 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0126
     * @tc.name      testDsListener0126
     * @tc.desc      Verify only events emitted while registered reach the listener.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0126 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      source.unregisterDataChangeListener(listener);
      source.notifyDataAdd(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notificationHistory.length=${listener.notificationHistory.length}`);
      expect(listener.notificationHistory.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notificationHistory[0]=${listener.notificationHistory[0]}, expected='add'`);
      expect(listener.notificationHistory[0]).assertEqual('add');
      log('testDsListener0126 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0127
     * @tc.name      testDsListener0127
     * @tc.desc      Verify mixed reload and add notifications keep separate counters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0127 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataAdd(0);
      source.notifyDataReload();
      source.notifyDataAdd(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=2`);
      expect(listener.reloadedCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=2`);
      expect(listener.addedCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.notificationHistory.length=${listener.notificationHistory.length}`);
      expect(listener.notificationHistory.length).assertEqual(4);
      log('testDsListener0127 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0128
     * @tc.name      testDsListener0128
     * @tc.desc      Verify all five event kinds are counted independently.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0128 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0', 'a1', 'a2']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataAdd(1);
      source.notifyDataChange(1);
      source.notifyDataDelete(1);
      source.notifyDataMove(0, 2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.reloadedCount=${listener.reloadedCount}, expected=1`);
      expect(listener.reloadedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changedCount=${listener.changedCount}, expected=1`);
      expect(listener.changedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedCount=${listener.deletedCount}, expected=1`);
      expect(listener.deletedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.movedCount=${listener.movedCount}, expected=1`);
      expect(listener.movedCount).assertEqual(1);
      log('testDsListener0128 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0129
     * @tc.name      testDsListener0129
     * @tc.desc      Verify the add index history length matches the add counter.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0129 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      source.notifyDataAdd(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes.length=${listener.addIndexes.length}`);
      expect(listener.addIndexes.length).assertEqual(listener.addedCount);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes.length=${listener.addIndexes.length}`);
      expect(listener.addIndexes.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[0]=${listener.addIndexes[0]}, expected=0`);
      expect(listener.addIndexes[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[1]=${listener.addIndexes[1]}, expected=1`);
      expect(listener.addIndexes[1]).assertEqual(1);
      log('testDsListener0129 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0130
     * @tc.name      testDsListener0130
     * @tc.desc      Verify classic notify calls leave the newer callback variants unused.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0130 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataAdd(0);
      source.notifyDataChange(0);
      source.notifyDataDelete(0);
      source.notifyDataMove(0, 0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedNewCount=${listener.addedNewCount}, expected=0`);
      expect(listener.addedNewCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.changedNewCount=${listener.changedNewCount}`);
      expect(listener.changedNewCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.deletedNewCount=${listener.deletedNewCount}`);
      expect(listener.deletedNewCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.movedNewCount=${listener.movedNewCount}, expected=0`);
      expect(listener.movedNewCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.datasetChangeCount=${listener.datasetChangeCount}`);
      expect(listener.datasetChangeCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      log('testDsListener0130 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0131
     * @tc.name      testDsListener0131
     * @tc.desc      Verify change notifications without listeners do not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0131 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      source.notifyDataChange(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='a0'`);
      expect(source.getData(0)).assertEqual('a0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.getData(0)=${typeof source.getData(0)}`);
      expect(typeof source.getData(0)).assertEqual('string');
      log('testDsListener0131 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0132
     * @tc.name      testDsListener0132
     * @tc.desc      Verify delete notifications without listeners do not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0132 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0', 'a1']);
      source.notifyDataDelete(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='a1'`);
      expect(source.getData(1)).assertEqual('a1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='a0'`);
      expect(source.getData(0)).assertEqual('a0');
      log('testDsListener0132 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0133
     * @tc.name      testDsListener0133
     * @tc.desc      Verify move notifications without listeners do not throw.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0133 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0', 'a1']);
      source.notifyDataMove(0, 1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='a0'`);
      expect(source.getData(0)).assertEqual('a0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(1)=${source.getData(1)}, expected='a1'`);
      expect(source.getData(1)).assertEqual('a1');
      log('testDsListener0133 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0134
     * @tc.name      testDsListener0134
     * @tc.desc      Verify an empty source still forwards add notifications verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0134 begin');
      const source: KeyboardDataSource = new KeyboardDataSource([]);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastAddIndex=${listener.lastAddIndex}, expected=0`);
      expect(listener.lastAddIndex).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      log('testDsListener0134 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0135
     * @tc.name      testDsListener0135
     * @tc.desc      Verify one listener subscribed to two sources receives both streams.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0135 begin');
      const first: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const second: KeyboardDataSource = new KeyboardDataSource(['b0']);
      const listener: NotificationRecorder = new NotificationRecorder();
      first.registerDataChangeListener(listener);
      second.registerDataChangeListener(listener);
      first.notifyDataAdd(0);
      second.notifyDataAdd(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=2`);
      expect(listener.addedCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[0]=${listener.addIndexes[0]}, expected=0`);
      expect(listener.addIndexes[0]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addIndexes[1]=${listener.addIndexes[1]}, expected=1`);
      expect(listener.addIndexes[1]).assertEqual(1);
      log('testDsListener0135 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0136
     * @tc.name      testDsListener0136
     * @tc.desc      Verify the unsubscribed listener freezes while the kept one advances.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0136 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const kept: NotificationRecorder = new NotificationRecorder();
      const removed: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(kept);
      source.registerDataChangeListener(removed);
      source.notifyDataAdd(0);
      source.unregisterDataChangeListener(removed);
      source.notifyDataAdd(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual removed.addedCount=${removed.addedCount}, expected=1`);
      expect(removed.addedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual kept.addedCount=${kept.addedCount}, expected=2`);
      expect(kept.addedCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual kept.lastAddIndex=${kept.lastAddIndex}, expected=1`);
      expect(kept.lastAddIndex).assertEqual(1);
      log('testDsListener0136 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0137
     * @tc.name      testDsListener0137
     * @tc.desc      Verify consecutive move notifications accumulate and keep the latest pair.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0137 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0', 'a1']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(0, 1);
      source.notifyDataMove(1, 0);
      source.notifyDataMove(2, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.movedCount=${listener.movedCount}, expected=3`);
      expect(listener.movedCount).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastMoveFrom=${listener.lastMoveFrom}, expected=2`);
      expect(listener.lastMoveFrom).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastMoveTo=${listener.lastMoveTo}, expected=5`);
      expect(listener.lastMoveTo).assertEqual(5);
      log('testDsListener0137 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0138
     * @tc.name      testDsListener0138
     * @tc.desc      Verify ten listeners registered in a loop all receive the event.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0138 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0']);
      const listeners: NotificationRecorder[] = [];
      for (let i: number = 0; i < 10; i++) {
        const listener: NotificationRecorder = new NotificationRecorder();
        listeners.push(listener);
        source.registerDataChangeListener(listener);
      }
      source.notifyDataAdd(3);
      for (let i: number = 0; i < listeners.length; i++) {
        hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listeners[i].addedCount=${listeners[i].addedCount}`);
        expect(listeners[i].addedCount).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listeners[0].addIndexes[0]=${listeners[0].addIndexes[0]}`);
      expect(listeners[0].addIndexes[0]).assertEqual(3);
      log('testDsListener0138 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0139
     * @tc.name      testDsListener0139
     * @tc.desc      Verify an empty source forwards move notifications with both indexes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0139 begin');
      const source: KeyboardDataSource = new KeyboardDataSource([]);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(3, 9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.movedCount=${listener.movedCount}, expected=1`);
      expect(listener.movedCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastMoveFrom=${listener.lastMoveFrom}, expected=3`);
      expect(listener.lastMoveFrom).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.lastMoveTo=${listener.lastMoveTo}, expected=9`);
      expect(listener.lastMoveTo).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      log('testDsListener0139 end');
    })

    /**
     * @tc.number    SUB_KEYBOARDAVOID_DSLST_0140
     * @tc.name      testDsListener0140
     * @tc.desc      Verify pure notifications leave the stored data untouched.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDsListener0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testDsListener0140 begin');
      const source: KeyboardDataSource = new KeyboardDataSource(['a0', 'a1']);
      const listener: NotificationRecorder = new NotificationRecorder();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.getData(0)=${source.getData(0)}, expected='a0'`);
      expect(source.getData(0)).assertEqual('a0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual listener.addedCount=${listener.addedCount}, expected=1`);
      expect(listener.addedCount).assertEqual(1);
      log('testDsListener0140 end');
    })
  })
}
