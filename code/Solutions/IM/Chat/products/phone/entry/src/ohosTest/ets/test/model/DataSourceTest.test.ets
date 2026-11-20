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

import { describe, it, expect } from '@ohos/hypium';
import { BasicDataSource } from '@ohos/chatlist/src/main/ets/viewmodel/BasicDataSource';
import hilog from '@ohos.hilog';

const DOMAIN: number = 0xF811;
const BUNDLE: string = 'Chat_';
const TAG: string = 'BasicDataSourceTest';

class RecordingListener implements DataChangeListener {
  reloadCount: number = 0;
  addIndexes: number[] = [];
  changeIndexes: number[] = [];
  deleteIndexes: number[] = [];
  moveFrom: number[] = [];
  moveTo: number[] = [];

  onDataReloaded(): void {
    this.reloadCount++;
  }

  onDataAdd(index: number): void {
    this.addIndexes.push(index);
  }

  onDataChange(index: number): void {
    this.changeIndexes.push(index);
  }

  onDataDelete(index: number): void {
    this.deleteIndexes.push(index);
  }

  onDataMove(from: number, to: number): void {
    this.moveFrom.push(from);
    this.moveTo.push(to);
  }

  onDataAdded(index: number): void {
  }

  onDataMoved(from: number, to: number): void {
  }

  onDataDeleted(index: number): void {
  }

  onDataChanged(index: number): void {
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
  }
}

class StringDataSource extends BasicDataSource<string> {
  private items: string[] = [];

  totalCount(): number {
    return this.items.length;
  }

  getData(index: number): string {
    return this.items[index];
  }

  push(value: string): void {
    this.items.push(value);
    this.notifyDataAdd(this.items.length - 1);
  }
}

class MatrixListener implements DataChangeListener {
  reloadCount: number = 0;
  addIndexes: number[] = [];
  changeIndexes: number[] = [];
  deleteIndexes: number[] = [];
  moveFrom: number[] = [];
  moveTo: number[] = [];

  onDataReloaded(): void { this.reloadCount++; }
  onDataAdd(index: number): void { this.addIndexes.push(index); }
  onDataChange(index: number): void { this.changeIndexes.push(index); }
  onDataDelete(index: number): void { this.deleteIndexes.push(index); }
  onDataMove(from: number, to: number): void { this.moveFrom.push(from); this.moveTo.push(to); }
  onDataAdded(index: number): void { }
  onDataMoved(from: number, to: number): void { }
  onDataDeleted(index: number): void { }
  onDataChanged(index: number): void { }
  onDatasetChange(dataOperations: DataOperation[]): void { }
}

class MatrixDataSource extends BasicDataSource<string> {
  private items: string[] = [];

  totalCount(): number { return this.items.length; }
  getData(index: number): string { return this.items[index]; }
  push(value: string): void {
    this.items.push(value);
    this.notifyDataAdd(this.items.length - 1);
  }
}

/**
 * 数据源基类矩阵：监听生命周期、通知类型与索引边界。
 */

async function yieldThread(): Promise<void> {
  await new Promise<void>((resolve: () => void): void => {
    setTimeout(resolve, 0);
  });
}

export default function dataSourceTest(): void {
  describe('DataSourceTest', (): void => {
    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_0100
     * @tc.name      new_data_source_should_have_zero_items_001
     * @tc.desc      Verify a freshly created data source reports zero items.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'new_data_source_should_have_zero_items_001', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'new_data_source_should_have_zero_items_001, begin');
      await yieldThread();
      hilog.info(DOMAIN, TAG, '%{public}s', 'data source count start');
      const source: StringDataSource = new StringDataSource();
      const check1 = source.totalCount();
      hilog.info(DOMAIN, TAG, BUNDLE + 'new_data_source_should_have_zero_items_001, value:' + check1);
      expect(check1).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'data source count end');
    
      hilog.info(DOMAIN, TAG, BUNDLE + 'new_data_source_should_have_zero_items_001, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_0200
     * @tc.name      push_should_increase_total_count_002
     * @tc.desc      Verify every push increases the item count by exactly one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'push_should_increase_total_count_002', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'push_should_increase_total_count_002, begin');
      await yieldThread();
      const source: StringDataSource = new StringDataSource();
      source.push('a');
      source.push('b');
      const check1 = source.totalCount();
      hilog.info(DOMAIN, TAG, BUNDLE + 'push_should_increase_total_count_002, value:' + check1);
      expect(check1).assertEqual(2);
      const check2 = source.getData(0);
      hilog.info(DOMAIN, TAG, BUNDLE + 'push_should_increase_total_count_002, value:' + check2);
      expect(check2).assertEqual('a');
      const check3 = source.getData(1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'push_should_increase_total_count_002, value:' + check3);
      expect(check3).assertEqual('b');
      hilog.info(DOMAIN, TAG, BUNDLE + 'push_should_increase_total_count_002, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_0300
     * @tc.name      register_listener_should_receive_add_003
     * @tc.desc      Verify a registered listener receives the inserted index.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'register_listener_should_receive_add_003', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'register_listener_should_receive_add_003, begin');
      await yieldThread();
      const source: StringDataSource = new StringDataSource();
      const listener: RecordingListener = new RecordingListener();
      source.registerDataChangeListener(listener);
      source.push('first');
      const check1: number = listener.addIndexes.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'register_listener_should_receive_add_003, value:' + check1);
      expect(check1).assertEqual(1);
      const check2 = listener.addIndexes[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'register_listener_should_receive_add_003, value:' + check2);
      expect(check2).assertEqual(0);
      hilog.info(DOMAIN, TAG, BUNDLE + 'register_listener_should_receive_add_003, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_0400
     * @tc.name      unregister_listener_should_stop_add_004
     * @tc.desc      Verify an unregistered listener no longer receives notifications.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'unregister_listener_should_stop_add_004', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'unregister_listener_should_stop_add_004, begin');
      await yieldThread();
      const source: StringDataSource = new StringDataSource();
      const listener: RecordingListener = new RecordingListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.push('ignored');
      const check1: number = listener.addIndexes.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'unregister_listener_should_stop_add_004, value:' + check1);
      expect(check1).assertEqual(0);
      hilog.info(DOMAIN, TAG, BUNDLE + 'unregister_listener_should_stop_add_004, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_0500
     * @tc.name      duplicate_register_should_notify_once_005
     * @tc.desc      Verify registering the same listener twice still delivers a single callback.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'duplicate_register_should_notify_once_005', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'duplicate_register_should_notify_once_005, begin');
      await yieldThread();
      const source: StringDataSource = new StringDataSource();
      const listener: RecordingListener = new RecordingListener();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.push('once');
      const check1: number = listener.addIndexes.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'duplicate_register_should_notify_once_005, value:' + check1);
      expect(check1).assertEqual(1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'duplicate_register_should_notify_once_005, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_0600
     * @tc.name      reload_should_notify_listener_006
     * @tc.desc      Verify notifyDataReload triggers exactly one reload callback.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'reload_should_notify_listener_006', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'reload_should_notify_listener_006, begin');
      await yieldThread();
      const source: StringDataSource = new StringDataSource();
      const listener: RecordingListener = new RecordingListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      const check1 = listener.reloadCount;
      hilog.info(DOMAIN, TAG, BUNDLE + 'reload_should_notify_listener_006, value:' + check1);
      expect(check1).assertEqual(1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'reload_should_notify_listener_006, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_0700
     * @tc.name      change_should_notify_with_index_007
     * @tc.desc      Verify notifyDataChange forwards the changed index unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'change_should_notify_with_index_007', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'change_should_notify_with_index_007, begin');
      await yieldThread();
      const source: StringDataSource = new StringDataSource();
      const listener: RecordingListener = new RecordingListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(3);
      const check1: number = listener.changeIndexes.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'change_should_notify_with_index_007, value:' + check1);
      expect(check1).assertEqual(1);
      const check2 = listener.changeIndexes[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'change_should_notify_with_index_007, value:' + check2);
      expect(check2).assertEqual(3);
      hilog.info(DOMAIN, TAG, BUNDLE + 'change_should_notify_with_index_007, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_0800
     * @tc.name      delete_should_notify_with_index_008
     * @tc.desc      Verify notifyDataDelete forwards the removed index unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'delete_should_notify_with_index_008', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'delete_should_notify_with_index_008, begin');
      await yieldThread();
      const source: StringDataSource = new StringDataSource();
      const listener: RecordingListener = new RecordingListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(1);
      const check1: number = listener.deleteIndexes.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'delete_should_notify_with_index_008, value:' + check1);
      expect(check1).assertEqual(1);
      const check2 = listener.deleteIndexes[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'delete_should_notify_with_index_008, value:' + check2);
      expect(check2).assertEqual(1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'delete_should_notify_with_index_008, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_0900
     * @tc.name      move_should_notify_with_pair_009
     * @tc.desc      Verify notifyDataMove forwards both the source and target indexes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'move_should_notify_with_pair_009', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'move_should_notify_with_pair_009, begin');
      await yieldThread();
      const source: StringDataSource = new StringDataSource();
      const listener: RecordingListener = new RecordingListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(2, 5);
      const check1 = listener.moveFrom[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'move_should_notify_with_pair_009, value:' + check1);
      expect(check1).assertEqual(2);
      const check2 = listener.moveTo[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'move_should_notify_with_pair_009, value:' + check2);
      expect(check2).assertEqual(5);
      hilog.info(DOMAIN, TAG, BUNDLE + 'move_should_notify_with_pair_009, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_1000
     * @tc.name      unregister_unknown_listener_should_not_throw_010
     * @tc.desc      Verify unregistering a listener that was never added is a no-op.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'unregister_unknown_listener_should_not_throw_010', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'unregister_unknown_listener_should_not_throw_010, begin');
      await yieldThread();
      const source: StringDataSource = new StringDataSource();
      const listener: RecordingListener = new RecordingListener();
      source.unregisterDataChangeListener(listener);
      source.push('after-unregister');
      const check1 = source.totalCount();
      hilog.info(DOMAIN, TAG, BUNDLE + 'unregister_unknown_listener_should_not_throw_010, value:' + check1);
      expect(check1).assertEqual(1);
      const check2: number = listener.addIndexes.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'unregister_unknown_listener_should_not_throw_010, value:' + check2);
      expect(check2).assertEqual(0);
      hilog.info(DOMAIN, TAG, BUNDLE + 'unregister_unknown_listener_should_not_throw_010, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_1100
     * @tc.name      notify_add_index_0_011
     * @tc.desc      Verify notifyDataAdd forwards index 0.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'notify_add_index_0_011', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_add_index_0_011, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      const check1 = listener.addIndexes[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_add_index_0_011, value:' + check1);
      expect(check1).assertEqual(0);
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_add_index_0_011, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_1200
     * @tc.name      notify_add_index_1_012
     * @tc.desc      Verify notifyDataAdd forwards index 1.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'notify_add_index_1_012', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_add_index_1_012, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(1);
      const check1 = listener.addIndexes[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_add_index_1_012, value:' + check1);
      expect(check1).assertEqual(1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_add_index_1_012, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_1300
     * @tc.name      notify_add_index_5_013
     * @tc.desc      Verify notifyDataAdd forwards index 5.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'notify_add_index_5_013', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_add_index_5_013, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(5);
      const check1 = listener.addIndexes[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_add_index_5_013, value:' + check1);
      expect(check1).assertEqual(5);
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_add_index_5_013, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_1400
     * @tc.name      notify_add_index_99_014
     * @tc.desc      Verify notifyDataAdd forwards index 99.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'notify_add_index_99_014', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_add_index_99_014, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(99);
      const check1 = listener.addIndexes[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_add_index_99_014, value:' + check1);
      expect(check1).assertEqual(99);
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_add_index_99_014, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_1500
     * @tc.name      notify_add_index_n1_015
     * @tc.desc      Verify notifyDataAdd forwards index -1.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'notify_add_index_n1_015', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_add_index_n1_015, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(-1);
      const check1 = listener.addIndexes[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_add_index_n1_015, value:' + check1);
      expect(check1).assertEqual(-1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_add_index_n1_015, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_1600
     * @tc.name      notify_add_index_1000_016
     * @tc.desc      Verify notifyDataAdd forwards index 1000.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'notify_add_index_1000_016', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_add_index_1000_016, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(1000);
      const check1 = listener.addIndexes[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_add_index_1000_016, value:' + check1);
      expect(check1).assertEqual(1000);
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_add_index_1000_016, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_1700
     * @tc.name      notify_change_index_0_017
     * @tc.desc      Verify notifyDataChange forwards index 0.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'notify_change_index_0_017', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_change_index_0_017, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(0);
      const check1 = listener.changeIndexes[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_change_index_0_017, value:' + check1);
      expect(check1).assertEqual(0);
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_change_index_0_017, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_1800
     * @tc.name      notify_change_index_1_018
     * @tc.desc      Verify notifyDataChange forwards index 1.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'notify_change_index_1_018', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_change_index_1_018, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(1);
      const check1 = listener.changeIndexes[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_change_index_1_018, value:' + check1);
      expect(check1).assertEqual(1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_change_index_1_018, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_1900
     * @tc.name      notify_change_index_7_019
     * @tc.desc      Verify notifyDataChange forwards index 7.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'notify_change_index_7_019', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_change_index_7_019, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(7);
      const check1 = listener.changeIndexes[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_change_index_7_019, value:' + check1);
      expect(check1).assertEqual(7);
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_change_index_7_019, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_2000
     * @tc.name      notify_change_index_99_020
     * @tc.desc      Verify notifyDataChange forwards index 99.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'notify_change_index_99_020', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_change_index_99_020, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(99);
      const check1 = listener.changeIndexes[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_change_index_99_020, value:' + check1);
      expect(check1).assertEqual(99);
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_change_index_99_020, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_2100
     * @tc.name      notify_change_index_n2_021
     * @tc.desc      Verify notifyDataChange forwards index -2.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'notify_change_index_n2_021', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_change_index_n2_021, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(-2);
      const check1 = listener.changeIndexes[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_change_index_n2_021, value:' + check1);
      expect(check1).assertEqual(-2);
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_change_index_n2_021, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_2200
     * @tc.name      notify_delete_index_0_022
     * @tc.desc      Verify notifyDataDelete forwards index 0.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'notify_delete_index_0_022', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_delete_index_0_022, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(0);
      const check1 = listener.deleteIndexes[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_delete_index_0_022, value:' + check1);
      expect(check1).assertEqual(0);
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_delete_index_0_022, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_2300
     * @tc.name      notify_delete_index_2_023
     * @tc.desc      Verify notifyDataDelete forwards index 2.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'notify_delete_index_2_023', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_delete_index_2_023, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(2);
      const check1 = listener.deleteIndexes[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_delete_index_2_023, value:' + check1);
      expect(check1).assertEqual(2);
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_delete_index_2_023, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_2400
     * @tc.name      notify_delete_index_8_024
     * @tc.desc      Verify notifyDataDelete forwards index 8.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'notify_delete_index_8_024', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_delete_index_8_024, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(8);
      const check1 = listener.deleteIndexes[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_delete_index_8_024, value:' + check1);
      expect(check1).assertEqual(8);
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_delete_index_8_024, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_2500
     * @tc.name      notify_delete_index_99_025
     * @tc.desc      Verify notifyDataDelete forwards index 99.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'notify_delete_index_99_025', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_delete_index_99_025, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(99);
      const check1 = listener.deleteIndexes[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_delete_index_99_025, value:' + check1);
      expect(check1).assertEqual(99);
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_delete_index_99_025, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_2600
     * @tc.name      notify_delete_index_n3_026
     * @tc.desc      Verify notifyDataDelete forwards index -3.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'notify_delete_index_n3_026', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_delete_index_n3_026, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(-3);
      const check1 = listener.deleteIndexes[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_delete_index_n3_026, value:' + check1);
      expect(check1).assertEqual(-3);
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_delete_index_n3_026, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_2700
     * @tc.name      notify_move_from_0_to_1_027
     * @tc.desc      Verify notifyDataMove forwards pair (0, 1).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'notify_move_from_0_to_1_027', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_move_from_0_to_1_027, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(0, 1);
      const check1 = listener.moveFrom[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_move_from_0_to_1_027, value:' + check1);
      expect(check1).assertEqual(0);
      const check2 = listener.moveTo[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_move_from_0_to_1_027, value:' + check2);
      expect(check2).assertEqual(1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_move_from_0_to_1_027, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_2800
     * @tc.name      notify_move_from_1_to_0_028
     * @tc.desc      Verify notifyDataMove forwards pair (1, 0).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'notify_move_from_1_to_0_028', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_move_from_1_to_0_028, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(1, 0);
      const check1 = listener.moveFrom[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_move_from_1_to_0_028, value:' + check1);
      expect(check1).assertEqual(1);
      const check2 = listener.moveTo[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_move_from_1_to_0_028, value:' + check2);
      expect(check2).assertEqual(0);
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_move_from_1_to_0_028, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_2900
     * @tc.name      notify_move_from_0_to_9_029
     * @tc.desc      Verify notifyDataMove forwards pair (0, 9).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'notify_move_from_0_to_9_029', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_move_from_0_to_9_029, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(0, 9);
      const check1 = listener.moveFrom[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_move_from_0_to_9_029, value:' + check1);
      expect(check1).assertEqual(0);
      const check2 = listener.moveTo[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_move_from_0_to_9_029, value:' + check2);
      expect(check2).assertEqual(9);
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_move_from_0_to_9_029, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_3000
     * @tc.name      notify_move_from_5_to_5_030
     * @tc.desc      Verify notifyDataMove forwards pair (5, 5).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'notify_move_from_5_to_5_030', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_move_from_5_to_5_030, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(5, 5);
      const check1 = listener.moveFrom[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_move_from_5_to_5_030, value:' + check1);
      expect(check1).assertEqual(5);
      const check2 = listener.moveTo[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_move_from_5_to_5_030, value:' + check2);
      expect(check2).assertEqual(5);
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_move_from_5_to_5_030, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_3100
     * @tc.name      notify_move_from_n1_to_2_031
     * @tc.desc      Verify notifyDataMove forwards pair (-1, 2).
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'notify_move_from_n1_to_2_031', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_move_from_n1_to_2_031, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(-1, 2);
      const check1 = listener.moveFrom[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_move_from_n1_to_2_031, value:' + check1);
      expect(check1).assertEqual(-1);
      const check2 = listener.moveTo[0];
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_move_from_n1_to_2_031, value:' + check2);
      expect(check2).assertEqual(2);
      hilog.info(DOMAIN, TAG, BUNDLE + 'notify_move_from_n1_to_2_031, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_3200
     * @tc.name      push_1_times_should_count_1_032
     * @tc.desc      Verify pushing 1 values yields a total count of 1.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'push_1_times_should_count_1_032', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'push_1_times_should_count_1_032, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      source.push('v0');
      const check1 = source.totalCount();
      hilog.info(DOMAIN, TAG, BUNDLE + 'push_1_times_should_count_1_032, value:' + check1);
      expect(check1).assertEqual(1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'push_1_times_should_count_1_032, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_3300
     * @tc.name      push_2_times_should_count_2_033
     * @tc.desc      Verify pushing 2 values yields a total count of 2.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'push_2_times_should_count_2_033', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'push_2_times_should_count_2_033, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      source.push('v0');
      source.push('v1');
      const check1 = source.totalCount();
      hilog.info(DOMAIN, TAG, BUNDLE + 'push_2_times_should_count_2_033, value:' + check1);
      expect(check1).assertEqual(2);
      hilog.info(DOMAIN, TAG, BUNDLE + 'push_2_times_should_count_2_033, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_3400
     * @tc.name      push_3_times_should_count_3_034
     * @tc.desc      Verify pushing 3 values yields a total count of 3.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'push_3_times_should_count_3_034', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'push_3_times_should_count_3_034, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      source.push('v0');
      source.push('v1');
      source.push('v2');
      const check1 = source.totalCount();
      hilog.info(DOMAIN, TAG, BUNDLE + 'push_3_times_should_count_3_034, value:' + check1);
      expect(check1).assertEqual(3);
      hilog.info(DOMAIN, TAG, BUNDLE + 'push_3_times_should_count_3_034, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_3500
     * @tc.name      push_4_times_should_count_4_035
     * @tc.desc      Verify pushing 4 values yields a total count of 4.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'push_4_times_should_count_4_035', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'push_4_times_should_count_4_035, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      source.push('v0');
      source.push('v1');
      source.push('v2');
      source.push('v3');
      const check1 = source.totalCount();
      hilog.info(DOMAIN, TAG, BUNDLE + 'push_4_times_should_count_4_035, value:' + check1);
      expect(check1).assertEqual(4);
      hilog.info(DOMAIN, TAG, BUNDLE + 'push_4_times_should_count_4_035, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_3600
     * @tc.name      push_5_times_should_count_5_036
     * @tc.desc      Verify pushing 5 values yields a total count of 5.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'push_5_times_should_count_5_036', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'push_5_times_should_count_5_036, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      source.push('v0');
      source.push('v1');
      source.push('v2');
      source.push('v3');
      source.push('item4');
      const check1 = source.totalCount();
      hilog.info(DOMAIN, TAG, BUNDLE + 'push_5_times_should_count_5_036, value:' + check1);
      expect(check1).assertEqual(5);
      hilog.info(DOMAIN, TAG, BUNDLE + 'push_5_times_should_count_5_036, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_3700
     * @tc.name      two_listeners_should_both_receive_add_037
     * @tc.desc      Verify two registered listeners both observe the same insertion.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'two_listeners_should_both_receive_add_037', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'two_listeners_should_both_receive_add_037, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const first: MatrixListener = new MatrixListener();
      const second: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.push('x');
      const check1: number = first.addIndexes.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'two_listeners_should_both_receive_add_037, value:' + check1);
      expect(check1).assertEqual(1);
      const check2: number = second.addIndexes.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'two_listeners_should_both_receive_add_037, value:' + check2);
      expect(check2).assertEqual(1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'two_listeners_should_both_receive_add_037, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_3800
     * @tc.name      three_listeners_should_all_receive_reload_038
     * @tc.desc      Verify three registered listeners all observe a reload.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'three_listeners_should_all_receive_reload_038', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'three_listeners_should_all_receive_reload_038, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const first: MatrixListener = new MatrixListener();
      const second: MatrixListener = new MatrixListener();
      const third: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.registerDataChangeListener(third);
      source.notifyDataReload();
      const check1 = first.reloadCount;
      hilog.info(DOMAIN, TAG, BUNDLE + 'three_listeners_should_all_receive_reload_038, value:' + check1);
      expect(check1).assertEqual(1);
      const check2 = second.reloadCount;
      hilog.info(DOMAIN, TAG, BUNDLE + 'three_listeners_should_all_receive_reload_038, value:' + check2);
      expect(check2).assertEqual(1);
      const check3 = third.reloadCount;
      hilog.info(DOMAIN, TAG, BUNDLE + 'three_listeners_should_all_receive_reload_038, value:' + check3);
      expect(check3).assertEqual(1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'three_listeners_should_all_receive_reload_038, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_3900
     * @tc.name      unregister_middle_listener_should_not_affect_others_039
     * @tc.desc      Verify removing the middle listener keeps the other two subscribed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'unregister_middle_listener_should_not_affect_others_039', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'unregister_middle_listener_should_not_affect_others_039, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const first: MatrixListener = new MatrixListener();
      const middle: MatrixListener = new MatrixListener();
      const last: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(middle);
      source.registerDataChangeListener(last);
      source.unregisterDataChangeListener(middle);
      source.push('x');
      const check1: number = first.addIndexes.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'unregister_middle_listener_should_not_affect_others_039, value:' + check1);
      expect(check1).assertEqual(1);
      const check2: number = middle.addIndexes.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'unregister_middle_listener_should_not_affect_others_039, value:' + check2);
      expect(check2).assertEqual(0);
      const check3: number = last.addIndexes.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'unregister_middle_listener_should_not_affect_others_039, value:' + check3);
      expect(check3).assertEqual(1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'unregister_middle_listener_should_not_affect_others_039, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_4000
     * @tc.name      re_register_after_unregister_should_work_040
     * @tc.desc      Verify a listener removed and added again receives notifications.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 're_register_after_unregister_should_work_040', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 're_register_after_unregister_should_work_040, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.push('x');
      const check1: number = listener.addIndexes.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 're_register_after_unregister_should_work_040, value:' + check1);
      expect(check1).assertEqual(1);
      hilog.info(DOMAIN, TAG, BUNDLE + 're_register_after_unregister_should_work_040, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_4100
     * @tc.name      duplicate_register_three_times_should_notify_once_041
     * @tc.desc      Verify registering the same listener three times still delivers one callback.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'duplicate_register_three_times_should_notify_once_041', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'duplicate_register_three_times_should_notify_once_041, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.push('x');
      const check1: number = listener.addIndexes.length;
      hilog.info(DOMAIN, TAG, BUNDLE + 'duplicate_register_three_times_should_notify_once_041, value:' + check1);
      expect(check1).assertEqual(1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'duplicate_register_three_times_should_notify_once_041, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_4200
     * @tc.name      reload_twice_should_count_twice_042
     * @tc.desc      Verify two reload notifications produce two callbacks.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'reload_twice_should_count_twice_042', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'reload_twice_should_count_twice_042, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const listener: MatrixListener = new MatrixListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataReload();
      const check1 = listener.reloadCount;
      hilog.info(DOMAIN, TAG, BUNDLE + 'reload_twice_should_count_twice_042, value:' + check1);
      expect(check1).assertEqual(2);
      hilog.info(DOMAIN, TAG, BUNDLE + 'reload_twice_should_count_twice_042, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_4300
     * @tc.name      empty_source_get_data_should_return_undefined_043
     * @tc.desc      Verify reading an index from an empty source returns no value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'empty_source_get_data_should_return_undefined_043', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'empty_source_get_data_should_return_undefined_043, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      const value: string = source.getData(0);
      const check1 = value;
      hilog.info(DOMAIN, TAG, BUNDLE + 'empty_source_get_data_should_return_undefined_043, value:' + check1);
      expect(check1).assertUndefined();
      hilog.info(DOMAIN, TAG, BUNDLE + 'empty_source_get_data_should_return_undefined_043, end');
    });

    /**
     * @tc.number    SUB_SOLUTION_CHAT_DATASOURCE_4400
     * @tc.name      get_data_should_return_stored_values_044
     * @tc.desc      Verify stored values are returned in insertion order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it(BUNDLE + 'get_data_should_return_stored_values_044', 0, async (): Promise<void> => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'get_data_should_return_stored_values_044, begin');
      await yieldThread();
      const source: MatrixDataSource = new MatrixDataSource();
      source.push('a');
      source.push('b');
      const check1 = source.getData(0);
      hilog.info(DOMAIN, TAG, BUNDLE + 'get_data_should_return_stored_values_044, value:' + check1);
      expect(check1).assertEqual('a');
      const check2 = source.getData(1);
      hilog.info(DOMAIN, TAG, BUNDLE + 'get_data_should_return_stored_values_044, value:' + check2);
      expect(check2).assertEqual('b');
      hilog.info(DOMAIN, TAG, BUNDLE + 'get_data_should_return_stored_values_044, end');
    });  });
}
