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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import {
  getDriver,
  KEY_BACK,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../Shared/SharedDriver';

// 电源操作类型枚举
enum PowerOperationType {
  POWEROPERATION_SUSPEND = 0, POWEROPERATION_REBOOT = 1, POWEROPERATION_SHUTDOWN = 2
}

// 电源选项模型
class PowerOptionItem {
  public name: string;
  public operationType: number;

  constructor(name: string, operationType: number) {
    this.name = name;
    this.operationType = operationType;
  }
}

// 电源列表数据源：模拟电源选项列表的数据源行为
class PowerListDataSource {
  private items: PowerOptionItem[] = [];
  private listeners: Array<() => void> = [];

  public totalCount(): number {
    return this.items.length;
  }

  public getData(index: number): PowerOptionItem | undefined {
    if (index < 0 || index >= this.items.length) {
      return undefined;
    }
    return this.items[index];
  }

  public push(item: PowerOptionItem): void {
    this.items.push(item);
    this.notifyDataAdd();
  }

  public splice(index: number): void {
    if (index >= 0 && index < this.items.length) {
      this.items.splice(index, 1);
      this.notifyDataDelete();
    }
  }

  public clear(): void {
    this.items = [];
    this.notifyDataReload();
  }

  public registerDataChangeListener(listener: () => void): void {
    if (!this.listeners.includes(listener)) {
      this.listeners.push(listener);
    }
  }

  public unregisterDataChangeListener(listener: () => void): void {
    const index = this.listeners.indexOf(listener);
    if (index >= 0) {
      this.listeners.splice(index, 1);
    }
  }

  public getListenerCount(): number {
    return this.listeners.length;
  }

  private notifyDataAdd(): void {
    this.listeners.forEach((listener: () => void) => listener());
  }

  private notifyDataDelete(): void {
    this.listeners.forEach((listener: () => void) => listener());
  }

  private notifyDataReload(): void {
    this.listeners.forEach((listener: () => void) => listener());
  }
}

// ===== 新增辅助代码：数据源扩展模型与工具 =====

// 数据变更类型枚举：描述数据源的各类变更事件
enum DataChangeType {
  ADD = 'add', DELETE = 'delete', RELOAD = 'reload', UPDATE = 'update', MOVE = 'move'
}

// 数据源操作枚举：描述对数据源的常见操作
enum DataSourceOperation {
  PUSH = 'push', SPLICE = 'splice', CLEAR = 'clear', QUERY = 'query'
}

// 变更通知接口：描述一次数据变更通知的完整信息
interface ChangeNotification {
  type: DataChangeType;
  index: number;
  timestamp: number;
}

// 数据项标识接口：描述可排序数据项的通用标识
interface IdentifiableItem {
  id: number;
  label: string;
}

// 数据统计接口：描述数据源统计结果
interface DataSourceStats {
  totalCount: number;
  listenerCount: number;
  addCount: number;
  deleteCount: number;
}

// 带标识的电源选项模型：在基础选项之上附加唯一标识
class IdentifiedPowerOption {
  public id: number;
  public name: string;
  public operationType: number;

  constructor(id: number, name: string, operationType: number) {
    this.id = id;
    this.name = name;
    this.operationType = operationType;
  }

  public clone(): IdentifiedPowerOption {
    return new IdentifiedPowerOption(this.id, this.name, this.operationType);
  }

  public equals(other: IdentifiedPowerOption): boolean {
    return this.id === other.id && this.name === other.name && this.operationType === other.operationType;
  }

  public toString(): string {
    return `IdentifiedPowerOption(id=${this.id}, name=${this.name}, operationType=${this.operationType})`;
  }

  public isValid(): boolean {
    return this.id >= 0 && this.name.length > 0;
  }
}

// 变更通知记录器：记录并统计数据源变更通知
class ChangeNotifier {
  private notifications: ChangeNotification[] = [];

  public notify(type: DataChangeType, index: number): void {
    const notification: ChangeNotification = {
      type: type, index: index, timestamp: Date.now()
    };
    this.notifications.push(notification);
  }

  public getNotificationCount(): number {
    return this.notifications.length;
  }

  public getCountByType(type: DataChangeType): number {
    let count: number = 0;
    for (let i = 0; i < this.notifications.length; i++) {
      if (this.notifications[i].type === type) {
        count++;
      }
    }
    return count;
  }

  public getNotifications(): ChangeNotification[] {
    const result: ChangeNotification[] = [];
    for (let i = 0; i < this.notifications.length; i++) {
      const notification = this.notifications[i];
      result.push({
        type: notification.type, index: notification.index, timestamp: notification.timestamp
      });
    }
    return result;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.notifications.length; i++) {
      if (this.notifications[i].timestamp < this.notifications[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public getLastNotification(): ChangeNotification | null {
    if (this.notifications.length === 0) {
      return null;
    }
    const last = this.notifications[this.notifications.length - 1];
    return { type: last.type, index: last.index, timestamp: last.timestamp };
  }

  public clear(): void {
    this.notifications = [];
  }
}

// 数据源操作记录器：记录并统计数据源操作
class DataSourceOperationRecorder {
  private operations: DataSourceOperation[] = [];

  public record(operation: DataSourceOperation): void {
    this.operations.push(operation);
  }

  public getOperationCount(): number {
    return this.operations.length;
  }

  public getCountByOperation(operation: DataSourceOperation): number {
    let count: number = 0;
    for (let i = 0; i < this.operations.length; i++) {
      if (this.operations[i] === operation) {
        count++;
      }
    }
    return count;
  }

  public getOperations(): DataSourceOperation[] {
    return [...this.operations];
  }

  public clear(): void {
    this.operations = [];
  }
}

// 带标识的数据源：管理带唯一标识的电源选项集合
class IdentifiedDataSource {
  private items: IdentifiedPowerOption[] = [];
  private nextId: number = 0;

  public add(name: string, operationType: number): number {
    const item = new IdentifiedPowerOption(this.nextId, name, operationType);
    this.items.push(item);
    const assignedId = this.nextId;
    this.nextId++;
    return assignedId;
  }

  public totalCount(): number {
    return this.items.length;
  }

  public getById(id: number): IdentifiedPowerOption | null {
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].id === id) {
        return this.items[i];
      }
    }
    return null;
  }

  public getByIndex(index: number): IdentifiedPowerOption | null {
    if (index < 0 || index >= this.items.length) {
      return null;
    }
    return this.items[index];
  }

  public removeById(id: number): boolean {
    for (let i = 0; i < this.items.length; i++) {
      if (this.items[i].id === id) {
        this.items.splice(i, 1);
        return true;
      }
    }
    return false;
  }

  public containsId(id: number): boolean {
    return this.getById(id) !== null;
  }

  public getItems(): IdentifiedPowerOption[] {
    const result: IdentifiedPowerOption[] = [];
    for (let i = 0; i < this.items.length; i++) {
      result.push(this.items[i].clone());
    }
    return result;
  }

  public clear(): void {
    this.items = [];
    this.nextId = 0;
  }
}

// 数据源统计器：统计数据源的各项指标
class DataSourceStatistics {
  public computeStats(items: PowerOptionItem[], listenerCount: number, addCount: number,
    deleteCount: number): DataSourceStats {
    const stats: DataSourceStats = {
      totalCount: items.length,
      listenerCount: listenerCount,
      addCount: addCount,
      deleteCount: deleteCount
    };
    return stats;
  }

  public countByType(items: PowerOptionItem[], operationType: number): number {
    let count: number = 0;
    for (let i = 0; i < items.length; i++) {
      if (items[i].operationType === operationType) {
        count++;
      }
    }
    return count;
  }

  public getTypeDistribution(items: PowerOptionItem[]): Map<number, number> {
    const distribution = new Map<number, number>();
    for (let i = 0; i < items.length; i++) {
      const currentType = items[i].operationType;
      const current = distribution.get(currentType);
      const count = current === undefined ? 0 : current;
      distribution.set(currentType, count + 1);
    }
    return distribution;
  }

  public isEmpty(items: PowerOptionItem[]): boolean {
    return items.length === 0;
  }

  public hasDuplicates(items: PowerOptionItem[]): boolean {
    for (let i = 0; i < items.length; i++) {
      for (let j = i + 1; j < items.length; j++) {
        if (items[i].name === items[j].name && items[i].operationType === items[j].operationType) {
          return true;
        }
      }
    }
    return false;
  }
}

// 数据源工厂：批量构建电源选项集合
class PowerOptionFactory {
  public createStandardOptions(): PowerOptionItem[] {
    const options: PowerOptionItem[] = [];
    options.push(new PowerOptionItem('熄屏', PowerOperationType.POWEROPERATION_SUSPEND));
    options.push(new PowerOptionItem('关机', PowerOperationType.POWEROPERATION_SHUTDOWN));
    options.push(new PowerOptionItem('重启', PowerOperationType.POWEROPERATION_REBOOT));
    return options;
  }

  public createIdentifiedOptions(): IdentifiedPowerOption[] {
    const options: IdentifiedPowerOption[] = [];
    options.push(new IdentifiedPowerOption(0, '熄屏', PowerOperationType.POWEROPERATION_SUSPEND));
    options.push(new IdentifiedPowerOption(1, '关机', PowerOperationType.POWEROPERATION_SHUTDOWN));
    options.push(new IdentifiedPowerOption(2, '重启', PowerOperationType.POWEROPERATION_REBOOT));
    return options;
  }

  public createEmptyOptions(): PowerOptionItem[] {
    return [];
  }

  public createRepeatedOptions(name: string, operationType: number, count: number): PowerOptionItem[] {
    const options: PowerOptionItem[] = [];
    for (let i = 0; i < count; i++) {
      options.push(new PowerOptionItem(name, operationType));
    }
    return options;
  }
}

export default function powerDataSourceValidationTest() {
  describe('PowerDataSourceValidation_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 适配 BasicDataSource_Core：totalCount 返回数组长度
    it('total_count_should_return_array_length', 0, async () => {
      const ds = new PowerListDataSource();
      ds.push(new PowerOptionItem('熄屏', PowerOperationType.POWEROPERATION_SUSPEND));
      ds.push(new PowerOptionItem('关机', PowerOperationType.POWEROPERATION_SHUTDOWN));
      ds.push(new PowerOptionItem('重启', PowerOperationType.POWEROPERATION_REBOOT));
      expect(ds.totalCount()).assertEqual(3);
    });

    // 适配 BasicDataSource_Core：空数组 totalCount 为零
    it('total_count_should_be_zero_for_empty_array', 0, async () => {
      const ds = new PowerListDataSource();
      expect(ds.totalCount()).assertEqual(0);
    });

    // 适配 BasicDataSource_Core：getData 返回指定索引元素
    it('get_data_should_return_element_at_index', 0, async () => {
      const ds = new PowerListDataSource();
      ds.push(new PowerOptionItem('熄屏', PowerOperationType.POWEROPERATION_SUSPEND));
      expect(ds.getData(0)?.name).assertEqual('熄屏');
    });

    // 适配 BasicDataSource_Core：越界访问返回 undefined
    it('get_data_out_of_bounds_should_return_undefined', 0, async () => {
      const ds = new PowerListDataSource();
      ds.push(new PowerOptionItem('熄屏', PowerOperationType.POWEROPERATION_SUSPEND));
      expect(ds.getData(100)).assertEqual(undefined);
      expect(ds.getData(-1)).assertEqual(undefined);
    });

    // 适配 BasicDataSource_Edge_Cases：负索引返回 undefined
    it('get_data_with_negative_index_should_return_undefined', 0, async () => {
      const ds = new PowerListDataSource();
      ds.push(new PowerOptionItem('关机', PowerOperationType.POWEROPERATION_SHUTDOWN));
      expect(ds.getData(-5)).assertEqual(undefined);
    });

    // 适配 BasicDataSource_Core：注册监听器增加监听数
    it('register_listener_should_add_listener', 0, async () => {
      const ds = new PowerListDataSource();
      const listener: () => void = () => {
      };
      ds.registerDataChangeListener(listener);
      expect(ds.getListenerCount()).assertEqual(1);
    });

    // 适配 BasicDataSource_Core：注销监听器减少监听数
    it('unregister_listener_should_remove_listener', 0, async () => {
      const ds = new PowerListDataSource();
      const listener: () => void = () => {
      };
      ds.registerDataChangeListener(listener);
      ds.unregisterDataChangeListener(listener);
      expect(ds.getListenerCount()).assertEqual(0);
    });

    // 适配 BasicDataSource_Core：重复注册被忽略
    it('duplicate_listener_registration_should_be_ignored', 0, async () => {
      const ds = new PowerListDataSource();
      const listener: () => void = () => {
      };
      ds.registerDataChangeListener(listener);
      ds.registerDataChangeListener(listener);
      expect(ds.getListenerCount()).assertEqual(1);
    });

    // 适配 BasicDataSource_No_Listener_Safety：无监听器时 reload 不崩溃
    it('notify_reload_without_listeners_should_not_crash', 0, async () => {
      const ds = new PowerListDataSource();
      ds.clear();
      expect(ds.totalCount()).assertEqual(0);
    });

    // 适配 BasicDataSource_No_Listener_Safety：无监听器时 add 不崩溃
    it('notify_add_without_listeners_should_not_crash', 0, async () => {
      const ds = new PowerListDataSource();
      ds.push(new PowerOptionItem('熄屏', PowerOperationType.POWEROPERATION_SUSPEND));
      expect(ds.totalCount()).assertEqual(1);
    });

    // 适配 FileDataSource_Operations：splice 移除元素
    it('splice_should_remove_element', 0, async () => {
      const ds = new PowerListDataSource();
      ds.push(new PowerOptionItem('熄屏', PowerOperationType.POWEROPERATION_SUSPEND));
      ds.push(new PowerOptionItem('关机', PowerOperationType.POWEROPERATION_SHUTDOWN));
      ds.splice(0);
      expect(ds.totalCount()).assertEqual(1);
      expect(ds.getData(0)?.name).assertEqual('关机');
    });

    // 适配 FileDataSource_Operations：clear 清空数组
    it('clear_should_empty_array', 0, async () => {
      const ds = new PowerListDataSource();
      ds.push(new PowerOptionItem('熄屏', PowerOperationType.POWEROPERATION_SUSPEND));
      ds.clear();
      expect(ds.totalCount()).assertEqual(0);
    });

    // 适配 BasicDataSource_Core：多监听器均收到通知
    it('multiple_listeners_should_all_receive_notifications', 0, async () => {
      const ds = new PowerListDataSource();
      let count1: number = 0;
      let count2: number = 0;
      const listener1: () => void = () => {
        count1++;
      };
      const listener2: () => void = () => {
        count2++;
      };
      ds.registerDataChangeListener(listener1);
      ds.registerDataChangeListener(listener2);
      ds.push(new PowerOptionItem('重启', PowerOperationType.POWEROPERATION_REBOOT));
      expect(count1).assertEqual(1);
      expect(count2).assertEqual(1);
    });

    // 适配 Collection_Boundaries：单项数据源
    it('single_item_data_source_should_have_total_count_one', 0, async () => {
      const ds = new PowerListDataSource();
      ds.push(new PowerOptionItem('关机', PowerOperationType.POWEROPERATION_SHUTDOWN));
      expect(ds.totalCount()).assertEqual(1);
    });
  });
}
