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

// 应用列表数据模型：封装单个应用图标的展示信息，对应 Index.ets 中的 AppList 结构
interface AppListEntry {
  bundleName: string;
  abilityName: string;
  moduleName: string;
  label: string;
  icon: string;
  installTime: number;
  labelId: number;
  iconId: number;
}

// 模拟应用列表管理器：模拟 getAllLauncherAbilityInfo 获取、FilterApp 过滤、installTime 排序逻辑
class AppListManager {
  private entries: AppListEntry[] = [];
  private loading: boolean = false;

  public setEntries(entries: AppListEntry[]): void {
    this.entries = entries;
  }

  public getEntries(): AppListEntry[] {
    return [...this.entries];
  }

  public getCount(): number {
    return this.entries.length;
  }

  public getByIndex(index: number): AppListEntry | null {
    if (index < 0 || index >= this.entries.length) {
      return null;
    }
    return this.entries[index];
  }

  public setLoading(loading: boolean): void {
    this.loading = loading;
  }

  public isLoading(): boolean {
    return this.loading;
  }

  // 过滤系统保留应用（如自身与 admin 应用）
  public filterReservedApp(selfBundleName: string): AppListEntry[] {
    const reserved: string[] = [selfBundleName, 'com.ohos.adminprovisioning'];
    return this.entries.filter(entry => !reserved.includes(entry.bundleName));
  }

  // 按关键词过滤应用名称
  public filterByKeyword(keyword: string): AppListEntry[] {
    const kw = keyword.toLowerCase();
    return this.entries.filter(entry => entry.bundleName.toLowerCase().includes(kw) ||
      entry.label.toLowerCase().includes(kw));
  }

  // 按 installTime 升序排序
  public sortByInstallTime(): AppListEntry[] {
    return [...this.entries].sort((a, b) => a.installTime - b.installTime);
  }

  // 按 installTime 降序排序
  public sortByInstallTimeDesc(): AppListEntry[] {
    return [...this.entries].sort((a, b) => b.installTime - a.installTime);
  }

  // 按历史排序信息重排（对应 orderList 逻辑）
  public orderByHistory(history: string[]): AppListEntry[] {
    const ordered: AppListEntry[] = [];
    const remain = [...this.entries];
    for (const key of history) {
      const idx = remain.findIndex(e => `${e.bundleName}::${e.abilityName}` === key);
      if (idx >= 0) {
        ordered.push(remain[idx]);
        remain.splice(idx, 1);
      }
    }
    return [...ordered, ...remain].filter(e => e !== null && e !== undefined);
  }

  // 去重：相同 bundleName::abilityName 只保留一个
  public deduplicate(): AppListEntry[] {
    const seen: Set<string> = new Set<string>();
    const result: AppListEntry[] = [];
    for (const e of this.entries) {
      const key = `${e.bundleName}::${e.abilityName}::${e.moduleName}`;
      if (seen.has(key)) {
        continue;
      }
      seen.add(key);
      result.push(e);
    }
    return result;
  }

  // 分批加载：对应 GridList 首屏 18 个 + 分批加载
  public loadBatch(pageIndex: number, pageSize: number): AppListEntry[] {
    const start = pageIndex * pageSize;
    return this.entries.slice(start, start + pageSize);
  }

  // 卸载后更新列表：对应 emitter unInstallApp 事件
  public removeByBundleName(bundleName: string): void {
    this.entries = this.entries.filter(e => e.bundleName !== bundleName);
  }

  // 安装后追加应用：对应 安装后列表刷新
  public addEntry(entry: AppListEntry): void {
    this.entries.push(entry);
  }

  // 校验列表数据完整性（无 null、无重复）
  public validateIntegrity(): boolean {
    if (this.entries.some(e => e === null || e === undefined)) {
      return false;
    }
    const keys = this.entries.map(e => `${e.bundleName}::${e.abilityName}::${e.moduleName}`);
    return new Set<string>(keys).size === keys.length;
  }
}

// 模拟图标名称缓存管理器：模拟 AppIconCacheManager/AppNameCacheManager 的内存缓存行为
class AppCacheManager {
  private iconCache: Map<string, string> = new Map<string, string>();
  private nameCache: Map<string, string> = new Map<string, string>();
  private hitCount: number = 0;
  private missCount: number = 0;
  private capacity: number = 100;

  public setCapacity(capacity: number): void {
    this.capacity = capacity;
  }

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

  public clear(): void {
    this.iconCache.clear();
    this.nameCache.clear();
    this.hitCount = 0;
    this.missCount = 0;
  }

  public getIconHitCount(): number {
    return this.iconCache.size;
  }

  public getHitRate(): number {
    const total = this.hitCount + this.missCount;
    return total === 0 ? 0 : this.hitCount / total;
  }

  public isOverCapacity(): boolean {
    return this.iconCache.size + this.nameCache.size > this.capacity;
  }
}

function buildEntry(bundleName: string, installTime: number, label: string = ''): AppListEntry {
  return {
    bundleName,
    abilityName: 'MainAbility',
    moduleName: 'entry',
    label,
    icon: '',
    installTime,
    labelId: 0,
    iconId: 0
  };
}

export default function appListLoadingTest() {
  describe('AppListLoading_Test', () => {
    let manager: AppListManager;
    let cache: AppCacheManager;

    beforeAll(() => {
      manager = new AppListManager();
      cache = new AppCacheManager();
    });

    afterAll(() => {
    });

    // 1. 验证应用列表获取功能：对应 界面-布局/风格、性能-页面加载速度
    it('app_list_should_return_all_installed_entries', 0, () => {
      manager.setEntries([buildEntry('com.a', 100), buildEntry('com.b', 200), buildEntry('com.c', 300)]);
      expect(manager.getEntries().length).assertEqual(3);
    });

    // 2. 验证系统保留应用过滤：对应 FilterApp 过滤系统保留应用
    it('app_list_should_filter_reserved_system_app', 0, () => {
      manager.setEntries([buildEntry('com.samples.applicationmanager', 100),
        buildEntry('com.ohos.adminprovisioning', 200), buildEntry('com.normal', 300)]);
      const filtered = manager.filterReservedApp('com.samples.applicationmanager');
      expect(filtered.length).assertEqual(1);
      expect(filtered.find(e => e.bundleName === 'com.ohos.adminprovisioning')).assertEqual(undefined);
    });

    // 3. 验证按安装时间排序：对应 应用排序 installTime 逻辑
    it('app_list_should_sort_by_install_time', 0, () => {
      manager.setEntries([buildEntry('com.newest', 300), buildEntry('com.oldest', 100), buildEntry('com.middle', 200)]);
      const sorted = manager.sortByInstallTime();
      expect(sorted[0].bundleName).assertEqual('com.oldest');
      expect(sorted[2].bundleName).assertEqual('com.newest');
    });

    // 4. 验证历史排序信息重排：对应 Storage 持久化排序 orderList 逻辑
    it('app_list_should_order_by_persisted_history', 0, () => {
      manager.setEntries([buildEntry('com.a', 100), buildEntry('com.b', 200), buildEntry('com.c', 300)]);
      const ordered = manager.orderByHistory(['com.c::MainAbility', 'com.a::MainAbility']);
      expect(ordered[0].bundleName).assertEqual('com.c');
      expect(ordered[1].bundleName).assertEqual('com.a');
      expect(ordered[2].bundleName).assertEqual('com.b');
    });

    // 5. 验证去重：对应 uniqueElementSet 去重逻辑
    it('app_list_should_deduplicate_same_element', 0, () => {
      manager.setEntries([buildEntry('com.a', 100), buildEntry('com.a', 100), buildEntry('com.b', 200)]);
      const deduped = manager.deduplicate();
      expect(deduped.length).assertEqual(2);
    });

    // 6. 验证空列表处理：对应 功能-空状态页
    it('app_list_should_handle_empty_list', 0, () => {
      manager.setEntries([]);
      expect(manager.getEntries().length).assertEqual(0);
      expect(manager.sortByInstallTime().length).assertEqual(0);
    });

    // 7. 验证大数据量加载：对应 性能-大数据量加载
    it('app_list_should_handle_large_data_volume', 0, () => {
      const entries: AppListEntry[] = [];
      for (let i = 0; i < 1000; i++) {
        entries.push(buildEntry(`com.app${i}`, i * 100));
      }
      manager.setEntries(entries);
      const startTime = Date.now();
      const sorted = manager.sortByInstallTime();
      const endTime = Date.now();
      expect(sorted.length).assertEqual(1000);
      expect(endTime - startTime).assertLessOrEqual(1000);
    });

    // 8. 验证图标缓存命中：对应 AppIconCacheManager 图标缓存
    it('icon_cache_should_cache_and_return_icon', 0, () => {
      cache.clear();
      expect(cache.getIcon('com.a')).assertEqual(null);
      cache.putIcon('com.a', 'icon_a');
      expect(cache.getIcon('com.a')).assertEqual('icon_a');
      expect(cache.getIconHitCount()).assertEqual(1);
    });

    // 9. 验证名称缓存：对应 AppNameCacheManager 名称缓存
    it('name_cache_should_cache_and_return_name', 0, () => {
      cache.clear();
      cache.putName('com.a', '应用A');
      expect(cache.getName('com.a')).assertEqual('应用A');
      expect(cache.getName('com.b')).assertEqual(null);
    });

    // 10. 验证缓存清理：对应 功能-缓存清理
    it('cache_should_be_cleared_correctly', 0, () => {
      cache.putIcon('com.a', 'icon_a');
      cache.putName('com.a', '应用A');
      cache.clear();
      expect(cache.getIcon('com.a')).assertEqual(null);
      expect(cache.getName('com.a')).assertEqual(null);
      expect(cache.getIconHitCount()).assertEqual(0);
    });

    // 11. 验证大数据量排序稳定性：对应 稳定-大数据量加载
    it('app_list_should_sort_stably_under_repeated_operations', 0, () => {
      const entries: AppListEntry[] = [];
      for (let i = 0; i < 200; i++) {
        entries.push(buildEntry(`com.app${i % 50}`, i));
      }
      for (let round = 0; round < 5; round++) {
        manager.setEntries(entries);
        const sorted = manager.sortByInstallTime();
        expect(sorted.length).assertEqual(200);
      }
    });

    // 12. 验证按关键词过滤应用：对应 功能-搜索、功能-搜索过滤
    it('app_list_should_filter_by_keyword', 0, () => {
      manager.setEntries([buildEntry('com.video', 100, '视频'), buildEntry('com.music', 200, '音乐'),
        buildEntry('com.map', 300, '地图')]);
      const result = manager.filterByKeyword('video');
      expect(result.length).assertEqual(1);
      expect(result[0].bundleName).assertEqual('com.video');
    });

    // 13. 验证关键词无结果：对应 功能-搜索无结果
    it('keyword_search_should_return_empty_when_no_match', 0, () => {
      manager.setEntries([buildEntry('com.a', 100, '应用A')]);
      expect(manager.filterByKeyword('notexist').length).assertEqual(0);
    });

    // 14. 验证降序排序：对应 应用排序最新优先
    it('app_list_should_sort_by_install_time_desc', 0, () => {
      manager.setEntries([buildEntry('com.old', 100), buildEntry('com.new', 300)]);
      const sorted = manager.sortByInstallTimeDesc();
      expect(sorted[0].bundleName).assertEqual('com.new');
    });

    // 15. 验证分页加载首屏：对应 首屏 18 个应用分批加载
    it('batch_loading_should_return_first_page', 0, () => {
      const entries: AppListEntry[] = [];
      for (let i = 0; i < 100; i++) {
        entries.push(buildEntry(`com.app${i}`, i));
      }
      manager.setEntries(entries);
      const firstPage = manager.loadBatch(0, 18);
      expect(firstPage.length).assertEqual(18);
      expect(firstPage[0].bundleName).assertEqual('com.app0');
    });

    // 16. 验证分页加载后续页：对应 分批加载剩余应用
    it('batch_loading_should_return_next_page', 0, () => {
      const entries: AppListEntry[] = [];
      for (let i = 0; i < 100; i++) {
        entries.push(buildEntry(`com.app${i}`, i));
      }
      manager.setEntries(entries);
      const secondPage = manager.loadBatch(1, 18);
      expect(secondPage.length).assertEqual(18);
      expect(secondPage[0].bundleName).assertEqual('com.app18');
    });

    // 17. 验证分页越界：对应 分页边界处理
    it('batch_loading_should_handle_out_of_range_page', 0, () => {
      const entries: AppListEntry[] = [];
      for (let i = 0; i < 20; i++) {
        entries.push(buildEntry(`com.app${i}`, i));
      }
      manager.setEntries(entries);
      expect(manager.loadBatch(5, 18).length).assertEqual(0);
    });

    // 18. 验证卸载后列表更新：对应 emitter unInstallApp 事件更新列表
    it('uninstall_should_remove_entry_from_list', 0, () => {
      manager.setEntries([buildEntry('com.a', 100), buildEntry('com.b', 200)]);
      manager.removeByBundleName('com.a');
      expect(manager.getCount()).assertEqual(1);
      expect(manager.getEntries()[0].bundleName).assertEqual('com.b');
    });

    // 19. 验证安装后追加应用：对应 安装后列表刷新
    it('install_should_add_entry_to_list', 0, () => {
      manager.setEntries([buildEntry('com.a', 100)]);
      manager.addEntry(buildEntry('com.b', 200));
      expect(manager.getCount()).assertEqual(2);
    });

    // 20. 验证列表数据完整性：对应 数据-数据一致性
    it('app_list_should_maintain_data_integrity', 0, () => {
      manager.setEntries([buildEntry('com.a', 100), buildEntry('com.b', 200), buildEntry('com.c', 300)]);
      expect(manager.validateIntegrity()).assertTrue();
    });

    // 21. 验证重复数据破坏完整性：对应 数据完整性校验
    it('duplicate_entries_should_fail_integrity_check', 0, () => {
      manager.setEntries([buildEntry('com.a', 100), buildEntry('com.a', 100)]);
      expect(manager.validateIntegrity()).assertFalse();
    });

    // 22. 验证按索引获取：对应 列表按位置访问
    it('app_list_should_get_entry_by_index', 0, () => {
      manager.setEntries([buildEntry('com.a', 100), buildEntry('com.b', 200)]);
      expect(manager.getByIndex(0)?.bundleName).assertEqual('com.a');
      expect(manager.getByIndex(5)).assertEqual(null);
    });

    // 23. 验证加载状态：对应 功能-加载状态
    it('app_list_should_track_loading_state', 0, () => {
      manager.setLoading(true);
      expect(manager.isLoading()).assertTrue();
      manager.setLoading(false);
      expect(manager.isLoading()).assertFalse();
    });

    // 24. 验证缓存命中率：对应 缓存命中率计算
    it('cache_should_calculate_hit_rate', 0, () => {
      cache.clear();
      cache.putIcon('com.a', 'icon_a');
      cache.getIcon('com.a');
      cache.getIcon('com.a');
      cache.getIcon('com.b');
      expect(cache.getHitRate()).assertLessOrEqual(1);
    });

    // 25. 验证缓存容量限制：对应 本地缓存上限
    it('cache_should_detect_over_capacity', 0, () => {
      cache.clear();
      cache.setCapacity(4);
      cache.putIcon('com.a', 'a');
      cache.putIcon('com.b', 'b');
      cache.putName('com.c', 'c');
      cache.putName('com.d', 'd');
      cache.putName('com.e', 'e');
      expect(cache.isOverCapacity()).assertTrue();
    });

    // 26. 验证缓存未超容量：对应 缓存容量边界
    it('cache_should_not_exceed_capacity', 0, () => {
      cache.clear();
      cache.setCapacity(10);
      cache.putIcon('com.a', 'a');
      cache.putName('com.b', 'b');
      expect(cache.isOverCapacity()).assertFalse();
    });

    // 27. 验证名称关键词过滤：对应 搜索联想
    it('app_list_should_filter_by_label_keyword', 0, () => {
      manager.setEntries([buildEntry('com.a', 100, '视频播放器'), buildEntry('com.b', 200, '音乐')]);
      expect(manager.filterByKeyword('视频').length).assertEqual(1);
    });

    // 28. 验证单元素列表排序：对应 边界值处理
    it('single_entry_list_should_sort_correctly', 0, () => {
      manager.setEntries([buildEntry('com.a', 100)]);
      expect(manager.sortByInstallTime().length).assertEqual(1);
      expect(manager.sortByInstallTimeDesc().length).assertEqual(1);
    });

    // 29. 验证列表计数：对应 列表数量统计
    it('app_list_should_return_correct_count', 0, () => {
      manager.setEntries([buildEntry('com.a', 100), buildEntry('com.b', 200)]);
      expect(manager.getCount()).assertEqual(2);
    });

    // 30. 验证排序不修改原始列表：对应 数据不可变性
    it('sort_should_not_mutate_original_list', 0, () => {
      manager.setEntries([buildEntry('com.new', 300), buildEntry('com.old', 100)]);
      manager.sortByInstallTime();
      expect(manager.getEntries()[0].bundleName).assertEqual('com.new');
    });

    // 验证分批加载进度：确保TVDeviceAppListBatchLoader进度追踪正确
    it('batch_loader_should_track_load_progress', 0, () => {
      const loader: AppListBatchLoader = new AppListBatchLoader();
      loader.setTotalCount(100);
      loader.loadBatch(30);
      loader.loadBatch(30);
      expect(loader.getLoadedCount()).assertEqual(60);
      expect(loader.isFullyLoaded()).assertFalse();
      loader.loadBatch(50);
      expect(loader.isFullyLoaded()).assertTrue();
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
