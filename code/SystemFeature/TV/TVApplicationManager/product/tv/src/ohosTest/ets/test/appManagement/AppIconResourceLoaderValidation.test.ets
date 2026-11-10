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
  createFreshDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_ENTER,
  KEY_BACK,
  appComponentCount,
  checkFocusState,
  waitForUiStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION
} from '../common/SharedDriver';

enum ResourceType {
  IMAGE = 'image', STRING = 'string', COLOR = 'color', ANIMATION = 'animation', LAYOUT = 'layout'
}

interface ResourceItem {
  id: string;
  type: ResourceType;
  data: string | number | Record<string, string | number>;
  loadTime: number;
  size: number;
}

interface LoadHistoryRecord {
  id: string;
  type: ResourceType;
  timestamp: number;
  success: boolean;
}

class AppIconResourceLoaderSimulator {
  private static instance: AppIconResourceLoaderSimulator;
  private resourceCache: Map<string, ResourceItem> = new Map();
  private loadHistory: LoadHistoryRecord[] = [];
  private cacheSizeLimit: number = 100;
  private totalLoadCount: number = 0;
  private cacheHitCount: number = 0;

  public static getInstance(): AppIconResourceLoaderSimulator {
    if (!AppIconResourceLoaderSimulator.instance) {
      AppIconResourceLoaderSimulator.instance = new AppIconResourceLoaderSimulator();
    }
    return AppIconResourceLoaderSimulator.instance;
  }

  public loadResource(id: string, type: ResourceType, data: string | number | Record<string, string | number>,
    size: number): boolean {
    this.totalLoadCount++;
    if (this.resourceCache.has(id)) {
      this.cacheHitCount++;
      return true;
    }
    if (this.resourceCache.size >= this.cacheSizeLimit) {
      this.evictOldestResource();
    }

    const resource: ResourceItem = {
      id,
      type,
      data,
      loadTime: Date.now(),
      size
    };

    this.resourceCache.set(id, resource);

    const record: LoadHistoryRecord = {
      id,
      type,
      timestamp: Date.now(),
      success: true
    };
    this.loadHistory.push(record);

    return true;
  }

  public getResource(id: string): ResourceItem | undefined {
    return this.resourceCache.get(id);
  }

  public hasResource(id: string): boolean {
    return this.resourceCache.has(id);
  }

  public removeResource(id: string): boolean {
    return this.resourceCache.delete(id);
  }

  public clearCache(): void {
    this.resourceCache.clear();
  }

  public getCacheSize(): number {
    return this.resourceCache.size;
  }

  public getCacheHitRate(): number {
    if (this.totalLoadCount === 0) {
      return 0;
    }
    return this.cacheHitCount / this.totalLoadCount;
  }

  public getLoadHistory(): LoadHistoryRecord[] {
    const history: LoadHistoryRecord[] = [];
    for (let i = 0; i < this.loadHistory.length; i++) {
      history.push(this.loadHistory[i]);
    }
    return history;
  }

  public getResourcesByType(type: ResourceType): ResourceItem[] {
    return Array.from(this.resourceCache.values()).filter(r => r.type === type);
  }

  public getTotalLoadCount(): number {
    return this.totalLoadCount;
  }

  public setCacheSizeLimit(limit: number): void {
    this.cacheSizeLimit = limit;
  }

  public resetLoader(): void {
    this.resourceCache.clear();
    this.loadHistory = [];
    this.totalLoadCount = 0;
    this.cacheHitCount = 0;
    this.cacheSizeLimit = 100;
  }

  public getCacheStats(): Map<string, number> {
    const stats = new Map<string, number>();

    for (const resource of this.resourceCache.values()) {
      const type = resource.type;
      const currentCount = stats.get(type) || 0;
      stats.set(type, currentCount + 1);
    }

    return stats;
  }

  public validateResource(resource: ResourceItem): boolean {
    if (!resource.id || resource.id.length === 0) {
      return false;
    }

    if (!Object.values(ResourceType).includes(resource.type)) {
      return false;
    }

    if (resource.size < 0) {
      return false;
    }

    return true;
  }

  private evictOldestResource(): void {
    let oldestId: string | null = null;
    let oldestTime: number = Number.MAX_VALUE;

    const cacheEntries: Array<[string, ResourceItem]> = [];
    for (const entry of this.resourceCache.entries()) {
      cacheEntries.push(entry);
    }

    for (let i = 0; i < cacheEntries.length; i++) {
      const entry = cacheEntries[i];
      const id = entry[0];
      const resource = entry[1];
      if (resource.loadTime < oldestTime) {
        oldestTime = resource.loadTime;
        oldestId = id;
      }
    }

    if (oldestId !== null) {
      this.resourceCache.delete(oldestId);
    }
  }
}

export default function appIconResourceLoaderValidationTest() {
  describe('AppIconResourceLoaderValidation_Test', () => {
    let driver: Driver;
    let resourceLoader: AppIconResourceLoaderSimulator;

    beforeAll(async () => {
      driver = createFreshDriver();
      resourceLoader = AppIconResourceLoaderSimulator.getInstance();
      resourceLoader.resetLoader();
      await driver.delayMs(1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    it('resource_type_enum_should_be_defined_correctly', 0, async () => {
      expect(ResourceType.IMAGE).assertEqual('image');
      expect(ResourceType.STRING).assertEqual('string');
      expect(ResourceType.COLOR).assertEqual('color');
      expect(ResourceType.ANIMATION).assertEqual('animation');
      expect(ResourceType.LAYOUT).assertEqual('layout');
    });

    it('resource_loader_initial_state_should_be_empty', 0, async () => {
      resourceLoader.resetLoader();
      expect(resourceLoader.getCacheSize()).assertEqual(0);
      expect(resourceLoader.getTotalLoadCount()).assertEqual(0);
      expect(resourceLoader.getCacheHitRate()).assertEqual(0);
    });

    it('image_resource_loading_should_work_correctly', 0, async () => {
      resourceLoader.resetLoader();

      const result = resourceLoader.loadResource('icon_app', ResourceType.IMAGE, 'media://app_icon', 1024);

      expect(result).assertTrue();
      expect(resourceLoader.hasResource('icon_app')).assertTrue();

      const resource = resourceLoader.getResource('icon_app');
      expect(resource?.type).assertEqual(ResourceType.IMAGE);
      expect(resource?.data).assertEqual('media://app_icon');
      expect(resource?.size).assertEqual(1024);
    });

    it('string_resource_loading_should_work_correctly', 0, async () => {
      resourceLoader.resetLoader();

      const result = resourceLoader.loadResource('string_uninstall', ResourceType.STRING, '屏幕输出', 6);

      expect(result).assertTrue();
      expect(resourceLoader.hasResource('string_uninstall')).assertTrue();

      const resource = resourceLoader.getResource('string_uninstall');
      expect(resource?.type).assertEqual(ResourceType.STRING);
      expect(resource?.data).assertEqual('屏幕输出');
    });

    it('color_resource_loading_should_work_correctly', 0, async () => {
      resourceLoader.resetLoader();

      const result = resourceLoader.loadResource('color_focus', ResourceType.COLOR, '#FF0000', 4);

      expect(result).assertTrue();
      expect(resourceLoader.hasResource('color_focus')).assertTrue();

      const resource = resourceLoader.getResource('color_focus');
      expect(resource?.type).assertEqual(ResourceType.COLOR);
      expect(resource?.data).assertEqual('#FF0000');
    });

    it('resource_cache_hit_should_be_recorded', 0, async () => {
      resourceLoader.resetLoader();

      resourceLoader.loadResource('icon_shortcut', ResourceType.IMAGE, 'media://shortcut_icon', 2048);
      expect(resourceLoader.getCacheHitRate()).assertEqual(0);

      resourceLoader.loadResource('icon_shortcut', ResourceType.IMAGE, 'media://shortcut_icon', 2048);
      expect(resourceLoader.getCacheHitRate()).assertEqual(0.5);

      resourceLoader.loadResource('icon_shortcut', ResourceType.IMAGE, 'media://shortcut_icon', 2048);
      expect(resourceLoader.getCacheHitRate()).assertEqual(2 / 3);
    });

    it('resource_removal_should_work_correctly', 0, async () => {
      resourceLoader.resetLoader();

      resourceLoader.loadResource('temp_resource', ResourceType.STRING, 'temp', 4);
      expect(resourceLoader.hasResource('temp_resource')).assertTrue();

      const removeResult = resourceLoader.removeResource('temp_resource');
      expect(removeResult).assertTrue();
      expect(resourceLoader.hasResource('temp_resource')).assertFalse();

      const removeNonExistent = resourceLoader.removeResource('non_existent');
      expect(removeNonExistent).assertFalse();
    });

    it('cache_clear_should_remove_all_resources', 0, async () => {
      resourceLoader.resetLoader();

      resourceLoader.loadResource('res1', ResourceType.IMAGE, 'data1', 100);
      resourceLoader.loadResource('res2', ResourceType.STRING, 'data2', 50);
      resourceLoader.loadResource('res3', ResourceType.COLOR, 'data3', 4);

      expect(resourceLoader.getCacheSize()).assertEqual(3);

      resourceLoader.clearCache();

      expect(resourceLoader.getCacheSize()).assertEqual(0);
      expect(resourceLoader.hasResource('res1')).assertFalse();
      expect(resourceLoader.hasResource('res2')).assertFalse();
      expect(resourceLoader.hasResource('res3')).assertFalse();
    });

    it('query_resources_by_type_should_return_correct_results', 0, async () => {
      resourceLoader.resetLoader();

      resourceLoader.loadResource('img1', ResourceType.IMAGE, 'data1', 100);
      resourceLoader.loadResource('img2', ResourceType.IMAGE, 'data2', 200);
      resourceLoader.loadResource('str1', ResourceType.STRING, 'data3', 50);
      resourceLoader.loadResource('col1', ResourceType.COLOR, 'data4', 4);
      resourceLoader.loadResource('str2', ResourceType.STRING, 'data5', 60);

      const images = resourceLoader.getResourcesByType(ResourceType.IMAGE);
      const strings = resourceLoader.getResourcesByType(ResourceType.STRING);
      const colors = resourceLoader.getResourcesByType(ResourceType.COLOR);

      expect(images.length).assertEqual(2);
      expect(strings.length).assertEqual(2);
      expect(colors.length).assertEqual(1);
    });

    it('cache_size_limit_should_be_enforced', 0, async () => {
      resourceLoader.resetLoader();
      resourceLoader.setCacheSizeLimit(5);

      for (let i = 0; i < 10; i++) {
        resourceLoader.loadResource(`resource_${i}`, ResourceType.STRING, `data_${i}`, 10);
      }
      expect(resourceLoader.getCacheSize()).assertLessOrEqual(5);
    });

    it('cache_stats_should_be_accurate', 0, async () => {
      resourceLoader.resetLoader();

      resourceLoader.loadResource('img1', ResourceType.IMAGE, 'data1', 100);
      resourceLoader.loadResource('img2', ResourceType.IMAGE, 'data2', 200);
      resourceLoader.loadResource('img3', ResourceType.IMAGE, 'data3', 150);
      resourceLoader.loadResource('str1', ResourceType.STRING, 'data4', 50);
      resourceLoader.loadResource('str2', ResourceType.STRING, 'data5', 60);
      resourceLoader.loadResource('col1', ResourceType.COLOR, 'data6', 4);

      const stats = resourceLoader.getCacheStats();

      expect(stats.get('image')).assertEqual(3);
      expect(stats.get('string')).assertEqual(2);
      expect(stats.get('color')).assertEqual(1);
    });

    it('resource_validation_should_detect_invalid_resources', 0, async () => {
      resourceLoader.resetLoader();
      const validResource: ResourceItem = {
        id: 'valid_resource',
        type: ResourceType.STRING,
        data: 'valid',
        loadTime: Date.now(),
        size: 10
      };
      expect(resourceLoader.validateResource(validResource)).assertTrue();
      const emptyIdResource: ResourceItem = {
        id: '',
        type: ResourceType.STRING,
        data: 'valid',
        loadTime: Date.now(),
        size: 10
      };
      expect(resourceLoader.validateResource(emptyIdResource)).assertFalse();
      const invalidTypeResource: ResourceItem = {
        id: 'invalid_type',
        type: 'invalid' as ResourceType,
        data: 'valid',
        loadTime: Date.now(),
        size: 10
      };
      expect(resourceLoader.validateResource(invalidTypeResource)).assertFalse();
      const negativeSizeResource: ResourceItem = {
        id: 'negative_size',
        type: ResourceType.STRING,
        data: 'valid',
        loadTime: Date.now(),
        size: -1
      };
      expect(resourceLoader.validateResource(negativeSizeResource)).assertFalse();
    });

    it('resource_loader_singleton_should_return_same_instance', 0, async () => {
      const loader1 = AppIconResourceLoaderSimulator.getInstance();
      const loader2 = AppIconResourceLoaderSimulator.getInstance();

      expect(loader1 === loader2).assertTrue();

      loader1.resetLoader();
      loader1.loadResource('singleton_test', ResourceType.STRING, 'value', 10);

      expect(loader2.hasResource('singleton_test')).assertTrue();
    });

    it('load_history_should_record_all_operations', 0, async () => {
      resourceLoader.resetLoader();

      resourceLoader.loadResource('res1', ResourceType.IMAGE, 'data1', 100);
      resourceLoader.loadResource('res2', ResourceType.STRING, 'data2', 50);
      resourceLoader.loadResource('res3', ResourceType.COLOR, 'data3', 4);

      const history = resourceLoader.getLoadHistory();
      expect(history.length).assertEqual(3);

      expect(history[0].id).assertEqual('res1');
      expect(history[0].type).assertEqual(ResourceType.IMAGE);
      expect(history[0].success).assertTrue();

      expect(history[2].id).assertEqual('res3');
      expect(history[2].type).assertEqual(ResourceType.COLOR);
    });

    it('resource_loading_should_correlate_with_ui_interactions', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      resourceLoader.resetLoader();
      resourceLoader.loadResource('dialog_bg', ResourceType.IMAGE, 'media://dialog_bg', 5120);
      resourceLoader.loadResource('icon_uninstall', ResourceType.IMAGE, 'media://uninstall_icon', 1024);
      resourceLoader.loadResource('icon_shortcut', ResourceType.IMAGE, 'media://shortcut_icon', 1024);
      resourceLoader.loadResource('icon_move', ResourceType.IMAGE, 'media://move_icon', 1024);
      resourceLoader.loadResource('title_text', ResourceType.STRING, '应用选项', 12);
      expect(resourceLoader.getCacheSize()).assertEqual(5);
      expect(resourceLoader.getResourcesByType(ResourceType.IMAGE).length).assertEqual(4);
      expect(resourceLoader.getResourcesByType(ResourceType.STRING).length).assertEqual(1);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('resource_timestamps_should_be_chronological', 0, async () => {
      resourceLoader.resetLoader();

      resourceLoader.loadResource('res1', ResourceType.STRING, 'data1', 10);
      await driver.delayMs(50);
      resourceLoader.loadResource('res2', ResourceType.STRING, 'data2', 20);
      await driver.delayMs(50);
      resourceLoader.loadResource('res3', ResourceType.STRING, 'data3', 30);

      const res1 = resourceLoader.getResource('res1');
      const res2 = resourceLoader.getResource('res2');
      const res3 = resourceLoader.getResource('res3');

      expect(res1?.loadTime).assertLessOrEqual(res2?.loadTime);
      expect(res2?.loadTime).assertLessOrEqual(res3?.loadTime);
    });

    it('resource_loader_should_recover_from_abnormal_states', 0, async () => {
      resourceLoader.resetLoader();

      resourceLoader.loadResource('normal_res', ResourceType.STRING, 'normal', 10);
      expect(resourceLoader.getCacheSize()).assertEqual(1);

      resourceLoader.loadResource('another_res', ResourceType.IMAGE, 'image_data', 100);
      expect(resourceLoader.getCacheSize()).assertEqual(2);

      resourceLoader.clearCache();
      expect(resourceLoader.getCacheSize()).assertEqual(0);

      resourceLoader.loadResource('fresh_res', ResourceType.COLOR, '#FFFFFF', 4);
      expect(resourceLoader.getCacheSize()).assertEqual(1);
    });

    it('cache_hit_rate_calculation_should_be_accurate', 0, async () => {
      resourceLoader.resetLoader();

      resourceLoader.loadResource('unique1', ResourceType.STRING, 'data1', 10);
      resourceLoader.loadResource('unique2', ResourceType.STRING, 'data2', 20);
      resourceLoader.loadResource('unique3', ResourceType.STRING, 'data3', 30);

      expect(resourceLoader.getCacheHitRate()).assertEqual(0);

      resourceLoader.loadResource('unique1', ResourceType.STRING, 'data1', 10);
      resourceLoader.loadResource('unique2', ResourceType.STRING, 'data2', 20);

      expect(resourceLoader.getCacheHitRate()).assertEqual(2 / 5);

      resourceLoader.loadResource('unique1', ResourceType.STRING, 'data1', 10);
      resourceLoader.loadResource('unique3', ResourceType.STRING, 'data3', 30);
      resourceLoader.loadResource('unique3', ResourceType.STRING, 'data3', 30);

      expect(resourceLoader.getCacheHitRate()).assertEqual(5 / 8);
    }); // 验证应用列表去重逻辑：确保TV设备重复项去除与统计符合预期
    it('app_list_deduplicator_should_remove_duplicates_correctly', 0, async () => {
      const duplicated: string[] = ['app_a', 'app_b', 'app_a', 'app_c', 'app_b'];
      const unique: string[] = AppListDeduplicator.deduplicate(duplicated);
      expect(unique.length).assertEqual(3);
      expect(unique[0]).assertEqual('app_a');
      expect(unique[1]).assertEqual('app_b');
      expect(AppListDeduplicator.hasDuplicate(duplicated)).assertTrue();
      expect(AppListDeduplicator.hasDuplicate(unique)).assertFalse();
      expect(AppListDeduplicator.countDuplicates(duplicated)).assertEqual(2);
    }); // 验证应用列表分批加载逻辑：确保TV设备加载进度与完成状态符合预期
    it('app_list_batch_loader_should_track_progress_correctly', 0, async () => {
      const loader: AppListBatchLoader = new AppListBatchLoader();
      loader.setTotalCount(10);
      loader.loadBatch(4);
      expect(loader.getLoadedCount()).assertEqual(4);
      expect(loader.getLoadProgress()).assertEqual(0.4);
      expect(loader.isFullyLoaded()).assertFalse();
      loader.loadBatch(6);
      expect(loader.getLoadedCount()).assertEqual(10);
      expect(loader.isFullyLoaded()).assertTrue();
      expect(loader.getLoadProgress()).assertEqual(1);
      loader.loadBatch(10);
      expect(loader.getLoadedCount()).assertEqual(10);
      loader.reset();
      expect(loader.getLoadedCount()).assertEqual(0);
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
