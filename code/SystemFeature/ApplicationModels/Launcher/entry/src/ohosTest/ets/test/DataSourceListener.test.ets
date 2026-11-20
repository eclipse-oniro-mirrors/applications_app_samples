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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { GridLayoutItemInfo, LauncherDataSource } from '@ohos/base';

class TestDataChangeListener implements DataChangeListener {
  reloadCount: number = 0;
  addIndexes: number[] = [];
  changeIndexes: number[] = [];
  deleteIndexes: number[] = [];
  moveFrom: number[] = [];
  moveTo: number[] = [];
  datasetChanges: number = 0;

  onDataReloaded(reuseImmediately?: boolean): void {
    this.reloadCount++;
  }

  onDataAdded(index: number): void {
    this.addIndexes.push(index);
  }

  onDataAdd(index: number): void {
    this.addIndexes.push(index);
  }

  onDataMoved(from: number, to: number): void {
    this.moveFrom.push(from);
    this.moveTo.push(to);
  }

  onDataMove(from: number, to: number): void {
    this.moveFrom.push(from);
    this.moveTo.push(to);
  }

  onDataDeleted(index: number): void {
    this.deleteIndexes.push(index);
  }

  onDataDelete(index: number): void {
    this.deleteIndexes.push(index);
  }

  onDataChanged(index: number): void {
    this.changeIndexes.push(index);
  }

  onDataChange(index: number): void {
    this.changeIndexes.push(index);
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
    this.datasetChanges += dataOperations.length;
  }
}

function createGridItem(id: number, appName: string): GridLayoutItemInfo {
  const item: GridLayoutItemInfo = new GridLayoutItemInfo();
  item.id = id;
  item.appName = appName;
  item.appIconId = id;
  item.cardId = 0;
  item.cardName = '';
  item.typeId = 0;
  item.area = [1, 1];
  item.page = 0;
  item.column = 0;
  item.row = 0;
  return item;
}

export default function dataSourceListenerTest() {
  describe('LauncherDataSourceListenerTest', () => {

    /**
     * @tc.name   testPushNotifiesAdd0001
     * @tc.number SUB_LAUNCHER_ENTRY_DATALISTENER_0100
     * @tc.desc   Test that pushData notifies the registered listener with the appended index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testPushNotifiesAdd0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: LauncherDataSource = new LauncherDataSource([]);
      const listener: TestDataChangeListener = new TestDataChangeListener();
      source.registerDataChangeListener(listener);
      source.pushData(createGridItem(1, 'Gallery'));
      expect(listener.addIndexes.length).assertEqual(1);
      expect(listener.addIndexes[0]).assertEqual(0);
      expect(source.totalCount()).assertEqual(1);
      source.unregisterDataChangeListener(listener);
    })

    /**
     * @tc.name   testAddNotifiesIndex0002
     * @tc.number SUB_LAUNCHER_ENTRY_DATALISTENER_0200
     * @tc.desc   Test that addData notifies the listener with the insertion index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAddNotifiesIndex0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: LauncherDataSource = new LauncherDataSource([createGridItem(1, 'Gallery')]);
      const listener: TestDataChangeListener = new TestDataChangeListener();
      source.registerDataChangeListener(listener);
      source.addData(1, createGridItem(2, 'Maps'));
      expect(listener.addIndexes.length).assertEqual(1);
      expect(listener.addIndexes[0]).assertEqual(1);
      expect(source.totalCount()).assertEqual(2);
      source.unregisterDataChangeListener(listener);
    })

    /**
     * @tc.name   testReloadNotification0003
     * @tc.number SUB_LAUNCHER_ENTRY_DATALISTENER_0300
     * @tc.desc   Test that notifyDataReload reaches the registered listener.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testReloadNotification0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: LauncherDataSource = new LauncherDataSource([]);
      const listener: TestDataChangeListener = new TestDataChangeListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      expect(listener.reloadCount).assertEqual(1);
      source.unregisterDataChangeListener(listener);
    })

    /**
     * @tc.name   testChangeNotification0004
     * @tc.number SUB_LAUNCHER_ENTRY_DATALISTENER_0400
     * @tc.desc   Test that notifyDataChange forwards the changed index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testChangeNotification0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: LauncherDataSource = new LauncherDataSource([]);
      const listener: TestDataChangeListener = new TestDataChangeListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(4);
      expect(listener.changeIndexes.length).assertEqual(1);
      expect(listener.changeIndexes[0]).assertEqual(4);
      source.unregisterDataChangeListener(listener);
    })

    /**
     * @tc.name   testDeleteNotification0005
     * @tc.number SUB_LAUNCHER_ENTRY_DATALISTENER_0500
     * @tc.desc   Test that notifyDataDelete forwards the deleted index.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDeleteNotification0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: LauncherDataSource = new LauncherDataSource([]);
      const listener: TestDataChangeListener = new TestDataChangeListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(2);
      expect(listener.deleteIndexes.length).assertEqual(1);
      expect(listener.deleteIndexes[0]).assertEqual(2);
      source.unregisterDataChangeListener(listener);
    })

    /**
     * @tc.name   testMoveNotification0006
     * @tc.number SUB_LAUNCHER_ENTRY_DATALISTENER_0600
     * @tc.desc   Test that notifyDataMove forwards both source and target indexes.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMoveNotification0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: LauncherDataSource = new LauncherDataSource([]);
      const listener: TestDataChangeListener = new TestDataChangeListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(1, 3);
      expect(listener.moveFrom[0]).assertEqual(1);
      expect(listener.moveTo[0]).assertEqual(3);
      source.unregisterDataChangeListener(listener);
    })

    /**
     * @tc.name   testUnregisterStopsNotification0007
     * @tc.number SUB_LAUNCHER_ENTRY_DATALISTENER_0700
     * @tc.desc   Test that an unregistered listener no longer receives notifications.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUnregisterStopsNotification0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: LauncherDataSource = new LauncherDataSource([]);
      const listener: TestDataChangeListener = new TestDataChangeListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.pushData(createGridItem(1, 'Gallery'));
      expect(listener.addIndexes.length).assertEqual(0);
    })

    /**
     * @tc.name   testDuplicateRegister0008
     * @tc.number SUB_LAUNCHER_ENTRY_DATALISTENER_0800
     * @tc.desc   Test that registering the same listener twice does not duplicate notifications.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testDuplicateRegister0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: LauncherDataSource = new LauncherDataSource([]);
      const listener: TestDataChangeListener = new TestDataChangeListener();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.pushData(createGridItem(1, 'Gallery'));
      expect(listener.addIndexes.length).assertEqual(1);
      source.unregisterDataChangeListener(listener);
    })

  })
}
