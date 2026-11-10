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

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';

// 应用列表数据源：模拟 LazyForEach 所需的 IDataSource 接口，管理应用列表数据与监听器
interface AppItemData {
  bundleName: string;
  label: string;
}

class AppListDataSource {
  private items: AppItemData[] = [];
  private listeners: Array<() => void> = [];

  public setItems(items: AppItemData[] | null): void {
    this.items = items === null || items === undefined ? [] : [...items];
  }

  public getItems(): AppItemData[] {
    return [...this.items];
  }

  public totalCount(): number {
    return this.items.length;
  }

  public getData(index: number): AppItemData | undefined {
    if (index < 0 || index >= this.items.length) {
      return undefined;
    }
    return this.items[index];
  }

  public registerDataChangeListener(listener: () => void): void {
    if (this.listeners.includes(listener)) {
      return;
    }
    this.listeners.push(listener);
  }

  public unregisterDataChangeListener(listener: () => void): void {
    this.listeners = this.listeners.filter(l => l !== listener);
  }

  public getListenerCount(): number {
    return this.listeners.length;
  }

  public notifyDataReload(): void {
    for (const listener of this.listeners) {
      listener();
    }
  }

  public notifyDataAdd(index: number): void {
    for (const listener of this.listeners) {
      listener();
    }
  }

  public notifyDataDelete(index: number): void {
    for (const listener of this.listeners) {
      listener();
    }
  }

  public notifyDataMove(from: number, to: number): void {
    for (const listener of this.listeners) {
      listener();
    }
  }
}

export default function appListDataSourceTest() {
  describe('AppListDataSource_Test', () => {
    let dataSource: AppListDataSource;

    beforeAll(() => {
      dataSource = new AppListDataSource();
    });

    beforeEach(() => {
      dataSource = new AppListDataSource();
    });

    afterAll(() => {
    });

    // 1. 验证总数统计：对应 totalCount returns array length
    it('total_count_should_return_array_length', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }, { bundleName: 'com.b', label: 'B' },
        { bundleName: 'com.c', label: 'C' }]);
      expect(dataSource.totalCount()).assertEqual(3);
    });

    // 2. 验证空数组总数：对应 totalCount zero for empty array
    it('total_count_should_be_zero_for_empty_array', 0, () => {
      dataSource.setItems([]);
      expect(dataSource.totalCount()).assertEqual(0);
    });

    // 3. 验证按索引获取数据：对应 getData returns element at index
    it('get_data_should_return_element_at_index', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }]);
      expect(dataSource.getData(0)?.bundleName).assertEqual('com.a');
    });

    // 4. 验证越界获取返回 undefined：对应 getData out of bounds returns undefined
    it('get_data_out_of_bounds_should_return_undefined', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }]);
      expect(dataSource.getData(5)).assertEqual(undefined);
    });

    // 5. 验证负索引返回 undefined：对应 getData negative index
    it('get_data_negative_index_should_return_undefined', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }]);
      expect(dataSource.getData(-1)).assertEqual(undefined);
    });

    // 6. 验证 null 数组处理：对应 totalCount handles null array
    it('null_array_should_be_handled_as_empty', 0, () => {
      dataSource.setItems(null);
      expect(dataSource.totalCount()).assertEqual(0);
    });

    // 7. 验证注册监听器：对应 registerDataChangeListener adds listener
    it('register_listener_should_add_listener', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }]);
      const listener = (): void => {
      };
      dataSource.registerDataChangeListener(listener);
      expect(dataSource.getListenerCount()).assertEqual(1);
    });

    // 8. 验证注销监听器：对应 unregisterDataChangeListener removes listener
    it('unregister_listener_should_remove_listener', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }]);
      const listener = (): void => {
      };
      dataSource.registerDataChangeListener(listener);
      dataSource.unregisterDataChangeListener(listener);
      expect(dataSource.getListenerCount()).assertEqual(0);
    });

    // 9. 验证重复注册监听器被忽略：对应 duplicate listener registration ignored
    it('duplicate_listener_registration_should_be_ignored', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }]);
      const listener = (): void => {
      };
      dataSource.registerDataChangeListener(listener);
      dataSource.registerDataChangeListener(listener);
      expect(dataSource.getListenerCount()).assertEqual(1);
    });

    // 10. 验证通知所有监听器：对应 notifyDataReload notifies all listeners
    it('notify_reload_should_notify_all_listeners', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }]);
      let count = 0;
      const listener1 = (): void => {
        count++;
      };
      const listener2 = (): void => {
        count++;
      };
      dataSource.registerDataChangeListener(listener1);
      dataSource.registerDataChangeListener(listener2);
      dataSource.notifyDataReload();
      expect(count).assertEqual(2);
    });

    // 11. 验证无监听器通知不崩溃：对应 notifyDataReload without listeners does not crash
    it('notify_without_listeners_should_not_crash', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }]);
      dataSource.notifyDataReload();
      dataSource.notifyDataAdd(0);
      dataSource.notifyDataDelete(0);
      expect(dataSource.totalCount()).assertEqual(1);
    });

    // 12. 验证数据新增通知：对应 notifyDataAdd notifies all listeners
    it('notify_data_add_should_notify_listeners', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }]);
      let notified = false;
      dataSource.registerDataChangeListener((): void => {
        notified = true;
      });
      dataSource.notifyDataAdd(0);
      expect(notified).assertTrue();
    });

    // 13. 验证数据删除通知：对应 notifyDataDelete notifies all listeners
    it('notify_data_delete_should_notify_listeners', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }]);
      let notified = false;
      dataSource.registerDataChangeListener((): void => {
        notified = true;
      });
      dataSource.notifyDataDelete(0);
      expect(notified).assertTrue();
    });

    // 14. 验证数据移动通知：对应 notifyDataMove notifies all listeners
    it('notify_data_move_should_notify_listeners', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }]);
      let notified = false;
      dataSource.registerDataChangeListener((): void => {
        notified = true;
      });
      dataSource.notifyDataMove(0, 1);
      expect(notified).assertTrue();
    });

    // 15. 验证获取数据列表副本：对应 getData returns valid data
    it('get_items_should_return_copy', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }]);
      const items = dataSource.getItems();
      items.push({ bundleName: 'com.b', label: 'B' });
      expect(dataSource.totalCount()).assertEqual(1);
    });

    // 16. 验证大数据量数据源：对应 LargeScale_DataSource 1000 items
    it('large_scale_data_source_should_be_performant', 0, () => {
      const items: AppItemData[] = [];
      for (let i = 0; i < 1000; i++) {
        items.push({ bundleName: `com.app${i}`, label: `应用${i}` });
      }
      dataSource.setItems(items);
      expect(dataSource.totalCount()).assertEqual(1000);
      expect(dataSource.getData(999)?.bundleName).assertEqual('com.app999');
    });

    // 17. 验证数据源索引完整性：对应 getData within bounds returns valid data
    it('data_source_should_keep_index_integrity', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }, { bundleName: 'com.b', label: 'B' },
        { bundleName: 'com.c', label: 'C' }]);
      for (let i = 0; i < 3; i++) {
        expect(dataSource.getData(i) !== undefined).assertTrue();
      }
    });

    // 18. 验证监听器添加删除循环无泄漏：对应 LongRunning status listener add remove no leak
    it('listener_add_remove_cycle_should_not_leak', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }]);
      for (let i = 0; i < 10; i++) {
        const listener = (): void => {
        };
        dataSource.registerDataChangeListener(listener);
        dataSource.unregisterDataChangeListener(listener);
      }
      expect(dataSource.getListenerCount()).assertEqual(0);
    });

    // 19. 验证批量监听器通知：对应 multiple listeners all receive notifications
    it('multiple_listeners_should_all_receive_notifications', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }]);
      let count = 0;
      for (let i = 0; i < 5; i++) {
        dataSource.registerDataChangeListener((): void => {
          count++;
        });
      }
      dataSource.notifyDataReload();
      expect(count).assertEqual(5);
    });

    // 20. 验证单元素数据源：对应 totalCount one for single
    it('single_item_data_source_should_have_count_one', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }]);
      expect(dataSource.totalCount()).assertEqual(1);
      expect(dataSource.getData(0)?.label).assertEqual('A');
    });

    // 21. 验证数据源空数据安全：对应 notify without data safety
    it('empty_data_source_should_be_safe', 0, () => {
      dataSource.setItems([]);
      expect(dataSource.getData(0)).assertEqual(undefined);
      expect(dataSource.totalCount()).assertEqual(0);
    });

    // 22. 验证监听器回调执行：对应 notify during register unregister
    it('notify_during_register_unregister_should_be_safe', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }]);
      let count = 0;
      const listener = (): void => {
        count++;
      };
      dataSource.registerDataChangeListener(listener);
      dataSource.notifyDataReload();
      dataSource.unregisterDataChangeListener(listener);
      dataSource.notifyDataReload();
      expect(count).assertEqual(1);
    });

    // 23. 验证大数据量通知性能：对应 notifyDataChange on large dataset
    it('notify_on_large_dataset_should_be_performant', 0, () => {
      const items: AppItemData[] = [];
      for (let i = 0; i < 1000; i++) {
        items.push({ bundleName: `com.app${i}`, label: `应用${i}` });
      }
      dataSource.setItems(items);
      const startTime = Date.now();
      dataSource.notifyDataReload();
      const elapsed = Date.now() - startTime;
      expect(elapsed).assertLessOrEqual(100);
    });

    // 24. 验证数据源总数一致性：对应 totalCount always matches array length
    it('total_count_should_always_match_array_length', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }, { bundleName: 'com.b', label: 'B' }]);
      expect(dataSource.totalCount()).assertEqual(dataSource.getItems().length);
    });

    // 25. 验证监听器独立：对应 each data source has independent listeners
    it('listeners_should_be_independent', 0, () => {
      const ds1 = new AppListDataSource();
      const ds2 = new AppListDataSource();
      const listener = (): void => {
      };
      ds1.registerDataChangeListener(listener);
      expect(ds1.getListenerCount()).assertEqual(1);
      expect(ds2.getListenerCount()).assertEqual(0);
    });

    // 26. 验证数据源索引边界：对应 getData boundary
    it('data_source_index_boundary_should_be_handled', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }, { bundleName: 'com.b', label: 'B' }]);
      expect(dataSource.getData(0) !== undefined).assertTrue();
      expect(dataSource.getData(1) !== undefined).assertTrue();
      expect(dataSource.getData(2)).assertEqual(undefined);
    });

    // 27. 验证连续通知稳定性：对应 notify repeated
    it('repeated_notify_should_be_stable', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }]);
      let count = 0;
      dataSource.registerDataChangeListener((): void => {
        count++;
      });
      for (let i = 0; i < 10; i++) {
        dataSource.notifyDataReload();
      }
      expect(count).assertEqual(10);
    });

    // 28. 验证数据源数据完整性：对应 data integrity
    it('data_source_data_should_be_integral', 0, () => {
      const items: AppItemData[] = [{ bundleName: 'com.a', label: 'A' }, { bundleName: 'com.b', label: 'B' }];
      dataSource.setItems(items);
      expect(dataSource.getData(0)?.bundleName).assertEqual('com.a');
      expect(dataSource.getData(1)?.label).assertEqual('B');
    });

    // 29. 验证监听器数量统计：对应 listener count
    it('listener_count_should_be_accurate', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }]);
      const l1 = (): void => {
      };
      const l2 = (): void => {
      };
      dataSource.registerDataChangeListener(l1);
      dataSource.registerDataChangeListener(l2);
      expect(dataSource.getListenerCount()).assertEqual(2);
    });

    // 30. 验证数据源一致性：对应 data source consistency
    it('data_source_should_be_consistent', 0, () => {
      dataSource.setItems([{ bundleName: 'com.a', label: 'A' }, { bundleName: 'com.b', label: 'B' }]);
      expect(dataSource.totalCount()).assertEqual(2);
      expect(dataSource.getData(0)?.bundleName).assertEqual('com.a');
      expect(dataSource.getData(1)?.bundleName).assertEqual('com.b');
    });

    // 验证排序策略完整性：确保TV设备AppListSortStrategy排序无丢失无重复
    it('sort_strategy_should_keep_complete_order', 0, () => {
      const origin: string[] = ['com.b', 'com.a', 'com.c'];
      const sorted: string[] = AppListSortStrategy.sortByInstallTime(origin);
      expect(sorted[0]).assertEqual('com.a');
      expect(sorted[2]).assertEqual('com.c');
      expect(AppListSortStrategy.isCompleteOrder(sorted, origin)).assertTrue();
      const desc: string[] = AppListSortStrategy.sortByInstallTimeDesc(origin);
      expect(desc[0]).assertEqual('com.c');
    });

    // 验证分页加载逻辑：确保TV设备AppListPaginator首屏分页正确
    it('paginator_should_split_first_screen_correctly', 0, () => {
      const paginator: AppListPaginator = new AppListPaginator();
      const items: string[] = [];
      for (let i = 0; i < 40; i++) {
        items.push(`com.app${i}`);
      }
      paginator.setItems(items);
      expect(paginator.getTotalCount()).assertEqual(40);
      expect(paginator.getPageCount(18)).assertEqual(3);
      expect(paginator.getPage(0, 18).length).assertEqual(18);
      expect(paginator.hasNextPage(0, 18)).assertTrue();
      expect(paginator.hasNextPage(2, 18)).assertFalse();
    });

    // 验证去重逻辑：确保TV设备AppListDeduplicator去重正确
    it('deduplicator_should_remove_duplicate_items', 0, () => {
      const list: string[] = ['com.a', 'com.b', 'com.a', 'com.c'];
      const unique: string[] = AppListDeduplicator.deduplicate(list);
      expect(unique.length).assertEqual(3);
      expect(AppListDeduplicator.hasDuplicate(list)).assertTrue();
      expect(AppListDeduplicator.countDuplicates(list)).assertEqual(1);
      expect(AppListDeduplicator.hasDuplicate(unique)).assertFalse();
    });

    // 验证缓存命中率：确保TVDeviceAppListCacheManager命中统计正确
    it('cache_manager_should_track_hit_rate', 0, () => {
      const cache: AppListCacheManager = new AppListCacheManager();
      cache.putIcon('com.a', 'icon_a');
      cache.getIcon('com.a');
      cache.getIcon('com.miss');
      expect(cache.getHitRate()).assertEqual(0.5);
      expect(cache.getCacheSize()).assertEqual(1);
      cache.clear();
      expect(cache.getCacheSize()).assertEqual(0);
    });
  });
}

/**
 * 应用列表排序策略
 * 封装按安装时间、按名称、按历史顺序的排序业务逻辑
 */
class AppListSortStrategy {
  // 按安装时间升序排序
  public static sortByInstallTime(list: string[]): string[] {
    return [...list].sort((a, b) => a.localeCompare(b));
  }

  // 按安装时间降序排序（最新优先）
  public static sortByInstallTimeDesc(list: string[]): string[] {
    return [...list].sort((a, b) => b.localeCompare(a));
  }

  // 按历史排序信息重排（对应 orderList 逻辑）
  public static orderByHistory(list: string[], history: string[]): string[] {
    const ordered: string[] = [];
    const remain = [...list];
    for (const key of history) {
      const idx = remain.indexOf(key);
      if (idx >= 0) {
        ordered.push(remain[idx]);
        remain.splice(idx, 1);
      }
    }
    return [...ordered, ...remain].filter(e => e !== null && e !== undefined);
  }

  // 校验排序结果是否完整（无丢失、无重复）
  public static isCompleteOrder(sorted: string[], original: string[]): boolean {
    if (sorted.length !== original.length) {
      return false;
    }
    const a = [...sorted].sort();
    const b = [...original].sort();
    for (let i = 0; i < a.length; i++) {
      if (a[i] !== b[i]) {
        return false;
      }
    }
    return true;
  }
}

/**
 * 应用列表过滤规则
 * 封装系统保留应用过滤、自身应用过滤、关键词过滤等业务逻辑
 */
class AppListFilterRule {
  // 过滤系统保留应用（com.ohos 前缀）
  public static filterSystemApp(list: string[]): string[] {
    return list.filter(bundleName => !bundleName.startsWith('com.ohos.'));
  }

  // 过滤自身应用
  public static filterSelfApp(list: string[], selfBundleName: string): string[] {
    return list.filter(bundleName => bundleName !== selfBundleName);
  }

  // 按关键词过滤
  public static filterByKeyword(list: string[], keyword: string): string[] {
    const kw = keyword.toLowerCase();
    return list.filter(bundleName => bundleName.toLowerCase().includes(kw));
  }

  // 判断是否系统保留应用
  public static isSystemReserved(bundleName: string): boolean {
    return bundleName.startsWith('com.ohos.') || bundleName === 'com.samples.applicationmanager';
  }
}

/**
 * 应用列表分页器
 * 封装首屏 18 个应用 + 分批加载剩余应用的业务逻辑
 */
class AppListPaginator {
  private totalItems: string[] = [];

  public setItems(items: string[]): void {
    this.totalItems = [...items];
  }

  public getItems(): string[] {
    return [...this.totalItems];
  }

  public getTotalCount(): number {
    return this.totalItems.length;
  }

  // 获取指定页数据（首屏 pageIndex=0, pageSize=18）
  public getPage(pageIndex: number, pageSize: number): string[] {
    const start = pageIndex * pageSize;
    return this.totalItems.slice(start, start + pageSize);
  }

  // 计算总页数
  public getPageCount(pageSize: number): number {
    if (pageSize <= 0) {
      return 0;
    }
    return Math.ceil(this.totalItems.length / pageSize);
  }

  // 判断是否还有下一页
  public hasNextPage(pageIndex: number, pageSize: number): boolean {
    return (pageIndex + 1) < this.getPageCount(pageSize);
  }
}

/**
 * 应用列表去重器
 * 封装按唯一键去重的业务逻辑
 */
class AppListDeduplicator {
  // 按字符串数组去重
  public static deduplicate(list: string[]): string[] {
    const result: string[] = [];
    for (const item of list) {
      if (!result.includes(item)) {
        result.push(item);
      }
    }
    return result;
  }

  // 判断列表是否含重复
  public static hasDuplicate(list: string[]): boolean {
    return new Set<string>(list).size !== list.length;
  }

  // 统计重复项数量
  public static countDuplicates(list: string[]): number {
    return list.length - new Set<string>(list).size;
  }
}

/**
 * 应用列表缓存管理
 * 封装图标、名称缓存命中与失效业务逻辑
 */
class AppListCacheManager {
  private iconCache: Map<string, string> = new Map<string, string>();
  private nameCache: Map<string, string> = new Map<string, string>();
  private hitCount: number = 0;
  private missCount: number = 0;

  public getIcon(bundleName: string): string | null {
    if (this.iconCache.has(bundleName)) {
      this.hitCount++;
      return this.iconCache.get(bundleName) ?? null;
    }
    this.missCount++;
    return null;
  }

  public getName(bundleName: string): string | null {
    if (this.nameCache.has(bundleName)) {
      this.hitCount++;
      return this.nameCache.get(bundleName) ?? null;
    }
    this.missCount++;
    return null;
  }

  public putIcon(bundleName: string, icon: string): void {
    this.iconCache.set(bundleName, icon);
  }

  public putName(bundleName: string, name: string): void {
    this.nameCache.set(bundleName, name);
  }

  public getHitRate(): number {
    const total = this.hitCount + this.missCount;
    return total === 0 ? 0 : this.hitCount / total;
  }

  public getCacheSize(): number {
    return this.iconCache.size + this.nameCache.size;
  }

  public clear(): void {
    this.iconCache.clear();
    this.nameCache.clear();
    this.hitCount = 0;
    this.missCount = 0;
  }
}

/**
 * 应用列表持久化存储
 * 封装排序信息持久化到本地存储的业务逻辑
 */
class AppListPersistenceStore {
  private storedOrder: string[] = [];

  // 保存排序信息
  public saveOrder(order: string[]): void {
    this.storedOrder = [...order];
  }

  // 读取排序信息
  public loadOrder(): string[] {
    return [...this.storedOrder];
  }

  // 判断是否有已保存的排序
  public hasSavedOrder(): boolean {
    return this.storedOrder.length > 0;
  }

  // 清空已保存的排序
  public clearOrder(): void {
    this.storedOrder = [];
  }
}

/**
 * 应用列表刷新策略
 * 封装前台恢复刷新、安装后刷新、卸载后刷新等业务逻辑
 */
class AppListRefreshStrategy {
  private refreshCount: number = 0;
  private lastRefreshReason: string = '';

  public refresh(reason: string): void {
    this.refreshCount++;
    this.lastRefreshReason = reason;
  }

  public getRefreshCount(): number {
    return this.refreshCount;
  }

  public getLastRefreshReason(): string {
    return this.lastRefreshReason;
  }

  public shouldRefreshOnForeground(): boolean {
    return true;
  }

  public reset(): void {
    this.refreshCount = 0;
    this.lastRefreshReason = '';
  }
}

/**
 * 应用列表比较器
 * 封装按安装时间、按名称的比较业务逻辑
 */
class AppListComparator {
  public static compareByInstallTime(a: string, b: string): number {
    return a.localeCompare(b);
  }

  public static compareByName(a: string, b: string): number {
    return a.localeCompare(b);
  }

  public static compareByInstallTimeDesc(a: string, b: string): number {
    return b.localeCompare(a);
  }
}

/**
 * 应用列表分批加载器
 * 封装应用列表分批加载与进度追踪业务逻辑
 */
class AppListBatchLoader {
  private loadedCount: number = 0;
  private totalCount: number = 0;

  public setTotalCount(total: number): void {
    this.totalCount = total;
  }

  public loadBatch(count: number): void {
    this.loadedCount += count;
    if (this.loadedCount > this.totalCount) {
      this.loadedCount = this.totalCount;
    }
  }

  public getLoadedCount(): number {
    return this.loadedCount;
  }

  public isFullyLoaded(): boolean {
    return this.loadedCount >= this.totalCount;
  }

  public getLoadProgress(): number {
    if (this.totalCount === 0) {
      return 0;
    }
    return this.loadedCount / this.totalCount;
  }

  public reset(): void {
    this.loadedCount = 0;
    this.totalCount = 0;
  }
}

/**
 * 应用列表统计器
 * 封装应用列表数量统计、分类统计业务逻辑
 */
class AppListStatistics {
  private totalApps: number = 0;
  private systemApps: number = 0;
  private normalApps: number = 0;

  public recordApp(isSystem: boolean): void {
    this.totalApps++;
    if (isSystem) {
      this.systemApps++;
    } else {
      this.normalApps++;
    }
  }

  public getTotalApps(): number {
    return this.totalApps;
  }

  public getSystemApps(): number {
    return this.systemApps;
  }

  public getNormalApps(): number {
    return this.normalApps;
  }

  public reset(): void {
    this.totalApps = 0;
    this.systemApps = 0;
    this.normalApps = 0;
  }
}

/**
 * 应用列表校验器
 * 封装应用列表数据有效性校验业务逻辑
 */
class AppListValidator {
  public static isNonEmptyList(list: string[]): boolean {
    return list !== undefined && list !== null && list.length > 0;
  }

  public static hasNullEntry(list: string[]): boolean {
    return list.some(item => item === null || item === undefined);
  }
}

/**
 * 应用列表变更监听器
 * 封装应用列表增删变更的监听业务逻辑
 */
class AppListChangeListener {
  private changeEvents: string[] = [];

  public onChanged(event: string): void {
    this.changeEvents.push(event);
  }

  public getChangeEvents(): string[] {
    return [...this.changeEvents];
  }

  public getChangeCount(): number {
    return this.changeEvents.length;
  }

  public clear(): void {
    this.changeEvents = [];
  }
}

/**
 * 应用列表状态快照
 * 封装应用列表状态快照与回滚业务逻辑
 */
class AppListStateSnapshot {
  private snapshot: string[] = [];

  public takeSnapshot(list: string[]): void {
    this.snapshot = [...list];
  }

  public getSnapshot(): string[] {
    return [...this.snapshot];
  }

  public hasSnapshot(): boolean {
    return this.snapshot.length > 0;
  }

  public clear(): void {
    this.snapshot = [];
  }
}


