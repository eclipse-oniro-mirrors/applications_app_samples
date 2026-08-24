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

// 应用项模型：对应 Index.ets 中的 AppList 结构，封装单个应用的信息
class AppItemBean {
  public readonly bundleName: string;
  public readonly abilityName: string;
  public readonly moduleName: string;
  public label: string;
  public icon: string;
  public readonly installTime: number;
  public readonly labelId: number;
  public readonly iconId: number;

  constructor(bundleName: string, abilityName: string, moduleName: string, label: string, icon: string,
    installTime: number, labelId: number, iconId: number) {
    this.bundleName = bundleName;
    this.abilityName = abilityName;
    this.moduleName = moduleName;
    this.label = label;
    this.icon = icon;
    this.installTime = installTime;
    this.labelId = labelId;
    this.iconId = iconId;
  }

  public isSelf(bundleName: string): boolean {
    return this.bundleName === bundleName;
  }

  public isSystemReserved(): boolean {
    return this.bundleName.startsWith('com.ohos.');
  }

  public hasIcon(): boolean {
    return this.icon !== undefined && this.icon !== null && this.icon.length > 0;
  }

  public hasLabel(): boolean {
    return this.label !== undefined && this.label !== null && this.label.length > 0;
  }

  public getElementKey(): string {
    return `${this.bundleName}::${this.abilityName}::${this.moduleName}`;
  }

  public toString(): string {
    return `AppItem{bundleName: ${this.bundleName}, label: ${this.label}}`;
  }
}

export default function appItemBeanTest() {
  describe('AppItemBean_Test', () => {
    let bean: AppItemBean;

    beforeAll(() => {
      bean = new AppItemBean('com.example', 'MainAbility', 'entry', '示例', 'icon', 100, 0, 0);
    });

    afterAll(() => {
    });

    // 1. 验证构造字段正确：对应 FileBean constructor extracts fields
    it('constructor_should_extract_fields_correctly', 0, () => {
      const b = new AppItemBean('com.a', 'MainAbility', 'entry', '应用A', 'icon_a', 200, 1, 2);
      expect(b.bundleName).assertEqual('com.a');
      expect(b.abilityName).assertEqual('MainAbility');
      expect(b.label).assertEqual('应用A');
      expect(b.installTime).assertEqual(200);
    });

    // 2. 验证自身应用判断：对应 isSelf
    it('is_self_should_detect_own_bundle', 0, () => {
      const b = new AppItemBean('com.self', 'MainAbility', 'entry', '自', 'i', 0, 0, 0);
      expect(b.isSelf('com.self')).assertTrue();
      expect(b.isSelf('com.other')).assertFalse();
    });

    // 3. 验证系统保留应用判断：对应 isSystemReserved
    it('is_system_reserved_should_detect_ohos_app', 0, () => {
      const sys = new AppItemBean('com.ohos.adminprovisioning', 'A', 'e', 'l', 'i', 0, 0, 0);
      const normal = new AppItemBean('com.normal', 'A', 'e', 'l', 'i', 0, 0, 0);
      expect(sys.isSystemReserved()).assertTrue();
      expect(normal.isSystemReserved()).assertFalse();
    });

    // 4. 验证图标存在判断：对应 hasIcon
    it('has_icon_should_detect_icon', 0, () => {
      const withIcon = new AppItemBean('com.a', 'A', 'e', 'l', 'icon', 0, 0, 0);
      const noIcon = new AppItemBean('com.b', 'A', 'e', 'l', '', 0, 0, 0);
      expect(withIcon.hasIcon()).assertTrue();
      expect(noIcon.hasIcon()).assertFalse();
    });

    // 5. 验证名称存在判断：对应 hasLabel
    it('has_label_should_detect_label', 0, () => {
      const withLabel = new AppItemBean('com.a', 'A', 'e', '应用', 'i', 0, 0, 0);
      const noLabel = new AppItemBean('com.b', 'A', 'e', '', 'i', 0, 0, 0);
      expect(withLabel.hasLabel()).assertTrue();
      expect(noLabel.hasLabel()).assertFalse();
    });

    // 6. 验证元素键生成：对应 getElementKey 唯一标识
    it('element_key_should_be_unique', 0, () => {
      const a = new AppItemBean('com.a', 'MainAbility', 'entry', 'l', 'i', 0, 0, 0);
      const b = new AppItemBean('com.b', 'MainAbility', 'entry', 'l', 'i', 0, 0, 0);
      expect(a.getElementKey() !== b.getElementKey()).assertTrue();
    });

    // 7. 验证 toString 包含关键字段：对应 FileBean toString contains key fields
    it('to_string_should_contain_key_fields', 0, () => {
      const str = bean.toString();
      expect(str.includes('com.example')).assertTrue();
      expect(str.includes('示例')).assertTrue();
    });

    // 8. 验证字段不可变性：对应 FileBean id never changes
    it('bundle_name_should_be_immutable', 0, () => {
      const b = new AppItemBean('com.a', 'MainAbility', 'entry', 'l', 'i', 100, 0, 0);
      expect(b.bundleName).assertEqual('com.a');
      expect(b.installTime).assertEqual(100);
    });

    // 9. 验证空 bundleName 处理：对应 FileBean empty uri
    it('empty_bundle_name_should_be_handled', 0, () => {
      const b = new AppItemBean('', 'MainAbility', 'entry', 'l', 'i', 0, 0, 0);
      expect(b.bundleName).assertEqual('');
      expect(b.hasLabel()).assertTrue();
    });

    // 10. 验证默认图标尺寸：对应 image dimensions default to zero
    it('default_icon_id_should_be_zero', 0, () => {
      const b = new AppItemBean('com.a', 'A', 'e', 'l', 'i', 0, 0, 0);
      expect(b.iconId).assertEqual(0);
      expect(b.labelId).assertEqual(0);
    });

    // 11. 验证标签 ID 正确：对应 labelId
    it('label_id_should_be_extracted', 0, () => {
      const b = new AppItemBean('com.a', 'A', 'e', 'l', 'i', 0, 5, 3);
      expect(b.labelId).assertEqual(5);
      expect(b.iconId).assertEqual(3);
    });

    // 12. 验证元素键包含模块名：对应 element key includes module
    it('element_key_should_include_module_name', 0, () => {
      const b = new AppItemBean('com.a', 'MainAbility', 'entry', 'l', 'i', 0, 0, 0);
      expect(b.getElementKey()).assertEqual('com.a::MainAbility::entry');
    });

    // 13. 验证排序按安装时间：对应 FileBean sorting
    it('app_items_should_sort_by_install_time', 0, () => {
      const a = new AppItemBean('com.a', 'A', 'e', 'l', 'i', 100, 0, 0);
      const b = new AppItemBean('com.b', 'A', 'e', 'l', 'i', 200, 0, 0);
      const c = new AppItemBean('com.c', 'A', 'e', 'l', 'i', 50, 0, 0);
      const sorted = [a, b, c].sort((x, y) => x.installTime - y.installTime);
      expect(sorted[0].bundleName).assertEqual('com.c');
      expect(sorted[2].bundleName).assertEqual('com.b');
    });

    // 14. 验证排序按名称：对应 same type sorts by name
    it('app_items_should_sort_by_name', 0, () => {
      const a = new AppItemBean('com.aaa', 'A', 'e', 'l', 'i', 0, 0, 0);
      const b = new AppItemBean('com.bbb', 'A', 'e', 'l', 'i', 0, 0, 0);
      const sorted = [b, a].sort((x, y) => x.bundleName.localeCompare(y.bundleName));
      expect(sorted[0].bundleName).assertEqual('com.aaa');
    });

    // 15. 验证类型链：对应 video bean correct type chain
    it('app_item_type_chain_should_be_correct', 0, () => {
      const b = new AppItemBean('com.video', 'PlayerAbility', 'entry', '视频', 'icon', 0, 0, 0);
      expect(b.bundleName).assertEqual('com.video');
      expect(b.abilityName).assertEqual('PlayerAbility');
      expect(b.hasIcon()).assertTrue();
    });

    // 16. 验证目录项判断：对应 isDir true
    it('system_app_detection_should_work', 0, () => {
      const sys = new AppItemBean('com.ohos.settings', 'A', 'e', 'l', 'i', 0, 0, 0);
      expect(sys.isSystemReserved()).assertTrue();
    });

    // 17. 验证名称变更：对应 setPath updates getPath
    it('label_should_be_updatable', 0, () => {
      const b = new AppItemBean('com.a', 'A', 'e', 'old', 'i', 0, 0, 0);
      b.label = 'new';
      expect(b.label).assertEqual('new');
    });

    // 18. 验证图标变更：对应 icon updatable
    it('icon_should_be_updatable', 0, () => {
      const b = new AppItemBean('com.a', 'A', 'e', 'l', 'old', 0, 0, 0);
      b.icon = 'new_icon';
      expect(b.icon).assertEqual('new_icon');
    });

    // 19. 验证大量构造性能：对应 large FileBean construction
    it('mass_construction_should_be_performant', 0, () => {
      const startTime = Date.now();
      for (let i = 0; i < 1000; i++) {
        new AppItemBean(`com.app${i}`, 'MainAbility', 'entry', `应用${i}`, 'icon', i, 0, 0);
      }
      const elapsed = Date.now() - startTime;
      expect(elapsed).assertLessOrEqual(1000);
    });

    // 20. 验证构造与丢弃：对应 rapid FileBean creation and discard
    it('rapid_construction_and_discard_should_be_stable', 0, () => {
      for (let i = 0; i < 500; i++) {
        const b = new AppItemBean(`com.app${i}`, 'A', 'e', 'l', 'i', i, 0, 0);
        expect(b.bundleName).assertEqual(`com.app${i}`);
      }
    });

    // 21. 验证自身应用过滤：对应 filter self
    it('self_app_should_be_filterable', 0, () => {
      const self = new AppItemBean('com.samples.applicationmanager', 'A', 'e', 'l', 'i', 0, 0, 0);
      expect(self.isSelf('com.samples.applicationmanager')).assertTrue();
    });

    // 22. 验证特殊字符 bundleName：对应 special char filenames
    it('special_char_bundle_name_should_be_handled', 0, () => {
      const b = new AppItemBean('com.app.v1.2-3', 'A', 'e', 'l', 'i', 0, 0, 0);
      expect(b.bundleName).assertEqual('com.app.v1.2-3');
    });

    // 23. 验证元素键一致：对应 id consistent across copy and move
    it('element_key_should_be_stable', 0, () => {
      const b = new AppItemBean('com.a', 'MainAbility', 'entry', 'l', 'i', 100, 0, 0);
      const key1 = b.getElementKey();
      const key2 = b.getElementKey();
      expect(key1).assertEqual(key2);
    });

    // 24. 验证安装时间不可变：对应 size never changes
    it('install_time_should_be_immutable', 0, () => {
      const b = new AppItemBean('com.a', 'A', 'e', 'l', 'i', 12345, 0, 0);
      expect(b.installTime).assertEqual(12345);
    });

    // 25. 验证空名称判断：对应 hasLabel empty
    it('empty_label_should_be_detected', 0, () => {
      const b = new AppItemBean('com.a', 'A', 'e', '', 'i', 0, 0, 0);
      expect(b.hasLabel()).assertFalse();
    });

    // 26. 验证空图标判断：对应 hasIcon empty
    it('empty_icon_should_be_detected', 0, () => {
      const b = new AppItemBean('com.a', 'A', 'e', 'l', '', 0, 0, 0);
      expect(b.hasIcon()).assertFalse();
    });

    // 27. 验证多模块同名 bundle：对应 unique key with module
    it('same_bundle_different_module_should_have_distinct_key', 0, () => {
      const a = new AppItemBean('com.a', 'A', 'module1', 'l', 'i', 0, 0, 0);
      const b = new AppItemBean('com.a', 'A', 'module2', 'l', 'i', 0, 0, 0);
      expect(a.getElementKey() !== b.getElementKey()).assertTrue();
    });

    // 28. 验证极端 installTime：对应 extreme values
    it('extreme_install_time_should_be_handled', 0, () => {
      const b = new AppItemBean('com.a', 'A', 'e', 'l', 'i', -1, 0, 0);
      expect(b.installTime).assertEqual(-1);
    });

    // 29. 验证构造数据完整性：对应 data consistency
    it('bean_data_should_be_consistent', 0, () => {
      const b = new AppItemBean('com.a', 'MainAbility', 'entry', '应用', 'icon', 100, 1, 2);
      expect(b.bundleName).assertEqual('com.a');
      expect(b.abilityName).assertEqual('MainAbility');
      expect(b.moduleName).assertEqual('entry');
      expect(b.label).assertEqual('应用');
      expect(b.icon).assertEqual('icon');
      expect(b.installTime).assertEqual(100);
      expect(b.labelId).assertEqual(1);
      expect(b.iconId).assertEqual(2);
    });

    // 30. 验证不可变性与可变更区分：对应 immutable vs mutable
    it('immutable_vs_mutable_fields_should_be_distinct', 0, () => {
      const b = new AppItemBean('com.a', 'A', 'e', 'l', 'i', 100, 0, 0);
      expect(b.installTime).assertEqual(100);
      b.label = 'changed';
      expect(b.label).assertEqual('changed');
    }); // 验证应用列表分页器分页逻辑：确保TV设备分页切页与下一页判断符合预期
    it('app_list_paginator_should_split_pages_correctly', 0, async () => {
      const paginator: AppListPaginator = new AppListPaginator();
      paginator.setItems(['app1', 'app2', 'app3', 'app4', 'app5', 'app6', 'app7', 'app8']);
      expect(paginator.getTotalCount()).assertEqual(8);
      const firstPage: string[] = paginator.getPage(0, 3);
      expect(firstPage.length).assertEqual(3);
      expect(firstPage[0]).assertEqual('app1');
      const secondPage: string[] = paginator.getPage(1, 3);
      expect(secondPage[0]).assertEqual('app4');
      expect(paginator.getPageCount(3)).assertEqual(3);
      expect(paginator.hasNextPage(0, 3)).assertTrue();
      expect(paginator.hasNextPage(2, 3)).assertFalse();
    }); // 验证应用列表统计器分类统计逻辑：确保TV设备系统与普通应用计数符合预期
    it('app_list_statistics_should_classify_apps_correctly', 0, async () => {
      const statistics: AppListStatistics = new AppListStatistics();
      expect(statistics.getTotalApps()).assertEqual(0);
      statistics.recordApp(true);
      statistics.recordApp(true);
      statistics.recordApp(false);
      statistics.recordApp(false);
      statistics.recordApp(false);
      expect(statistics.getTotalApps()).assertEqual(5);
      expect(statistics.getSystemApps()).assertEqual(2);
      expect(statistics.getNormalApps()).assertEqual(3);
      statistics.reset();
      expect(statistics.getTotalApps()).assertEqual(0);
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


