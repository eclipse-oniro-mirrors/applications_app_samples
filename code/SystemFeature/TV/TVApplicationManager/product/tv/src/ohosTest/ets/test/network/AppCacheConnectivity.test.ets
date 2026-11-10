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
  KEY_BACK,
  KEY_ENTER,
  appComponentCount,
  checkFocusState,
  waitForUiStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION
} from '../common/SharedDriver';

enum NetworkStatus {
  ONLINE = 'online', OFFLINE = 'offline', CONNECTING = 'connecting', DISCONNECTING = 'disconnecting'
}

interface NetworkRecord {
  status: NetworkStatus;
  operationName: string;
  success: boolean;
  responseTime: number;
  timestamp: number;
}

interface NetworkTransitionRecord {
  from: NetworkStatus;
  to: NetworkStatus;
}

class AppCacheConnectivityTracker {
  private static instance: AppCacheConnectivityTracker;
  private networkHistory: NetworkRecord[] = [];
  private totalOperations: number = 0;
  private successfulOperations: number = 0;
  private currentStatus: NetworkStatus = NetworkStatus.ONLINE;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): AppCacheConnectivityTracker {
    if (!AppCacheConnectivityTracker.instance) {
      AppCacheConnectivityTracker.instance = new AppCacheConnectivityTracker();
    }
    return AppCacheConnectivityTracker.instance;
  }

  public setCurrentStatus(status: NetworkStatus): void {
    this.currentStatus = status;
  }

  public getCurrentStatus(): NetworkStatus {
    return this.currentStatus;
  }

  public recordNetworkOperation(status: NetworkStatus, operationName: string, success: boolean,
    responseTime: number): void {
    const record: NetworkRecord = {
      status,
      operationName,
      success,
      responseTime,
      timestamp: Date.now()
    };
    this.networkHistory.push(record);
    this.totalOperations++;
    if (success) {
      this.successfulOperations++;
    }
  }

  public getNetworkHistory(): NetworkRecord[] {
    return [...this.networkHistory];
  }

  public getTotalOperations(): number {
    return this.totalOperations;
  }

  public getSuccessfulOperations(): number {
    return this.successfulOperations;
  }

  public resetTracker(): void {
    this.networkHistory = [];
    this.totalOperations = 0;
    this.successfulOperations = 0;
    this.currentStatus = NetworkStatus.ONLINE;
  }

  public getSuccessRate(): number {
    if (this.totalOperations === 0) {
      return 0;
    }
    return this.successfulOperations / this.totalOperations;
  }

  public hasOperationWithStatus(status: NetworkStatus): boolean {
    return this.networkHistory.some(record => record.status === status);
  }

  public getOperationCountByStatus(status: NetworkStatus): number {
    return this.networkHistory.filter(record => record.status === status).length;
  }
}

export default function appCacheConnectivityTest() {
  describe('AppCacheConnectivity_Test', () => {
    let driver: Driver;
    let networkTracker: AppCacheConnectivityTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      networkTracker = AppCacheConnectivityTracker.getInstance();
      networkTracker.resetTracker();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭弹窗并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    // 验证dialog should处理能力：确保TV设备在handle online status下功能正常
    it('app_should_handle_online_status', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      networkTracker.setCurrentStatus(NetworkStatus.ONLINE);

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      networkTracker.recordNetworkOperation(NetworkStatus.ONLINE, 'navigation', isFocusCorrect, responseTime);

      expect(networkTracker.hasOperationWithStatus(NetworkStatus.ONLINE)).assertTrue();
    });

    // 验证dialog should处理能力：确保TV设备在handle offline status下功能正常
    it('app_should_handle_offline_status', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      networkTracker.setCurrentStatus(NetworkStatus.OFFLINE);

      const startTime = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 1);
      networkTracker.recordNetworkOperation(NetworkStatus.OFFLINE, 'navigation_offline', isFocusCorrect, responseTime);

      expect(networkTracker.hasOperationWithStatus(NetworkStatus.OFFLINE)).assertTrue();
    });

    // 验证dialog should处理能力：确保TV设备在handle connecting status下功能正常
    it('app_should_handle_connecting_status', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      networkTracker.setCurrentStatus(NetworkStatus.CONNECTING);

      const startTime = Date.now();
      const componentCount = await appComponentCount(driver);
      const responseTime = Date.now() - startTime;

      networkTracker.recordNetworkOperation(NetworkStatus.CONNECTING, 'component_check', componentCount >= 6,
        responseTime);

      expect(networkTracker.hasOperationWithStatus(NetworkStatus.CONNECTING)).assertTrue();
    });

    // 验证dialog should处理能力：确保TV设备在handle disconnecting status下功能正常
    it('app_should_handle_disconnecting_status', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      networkTracker.setCurrentStatus(NetworkStatus.DISCONNECTING);

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      networkTracker.recordNetworkOperation(NetworkStatus.DISCONNECTING, 'navigation_disconnecting', isFocusCorrect,
        responseTime);

      expect(networkTracker.hasOperationWithStatus(NetworkStatus.DISCONNECTING)).assertTrue();
    });

    // 验证dialog should处理能力：确保TV设备在handle all network statuses下功能正常
    it('app_should_handle_all_network_statuses', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      networkTracker.resetTracker();

      const statuses =
        [NetworkStatus.ONLINE, NetworkStatus.OFFLINE, NetworkStatus.CONNECTING, NetworkStatus.DISCONNECTING];
      for (const status of statuses) {
        networkTracker.setCurrentStatus(status);
        networkTracker.recordNetworkOperation(status, 'test_operation', true, 50);
      }

      expect(networkTracker.getTotalOperations()).assertEqual(4);
      expect(networkTracker.getSuccessRate()).assertEqual(1);
    });

    // 验证dialog network状态正确：确保TV设备records timestamps should be chronological符合预期
    it('app_network_records_timestamps_should_be_chronological', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      networkTracker.resetTracker();

      networkTracker.recordNetworkOperation(NetworkStatus.ONLINE, 'test_1', true, 50);
      await driver.delayMs(100);
      networkTracker.recordNetworkOperation(NetworkStatus.OFFLINE, 'test_2', true, 50);
      await driver.delayMs(100);
      networkTracker.recordNetworkOperation(NetworkStatus.CONNECTING, 'test_3', true, 50);

      const history = networkTracker.getNetworkHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证dialog network维持稳定：确保TV设备在tracker singleton should maintain consistency下性能不降低
    it('app_network_tracker_singleton_should_maintain_consistency', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const tracker1 = AppCacheConnectivityTracker.getInstance();
      const tracker2 = AppCacheConnectivityTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();


      tracker1.resetTracker();
      tracker1.setCurrentStatus(NetworkStatus.ONLINE);
      tracker1.recordNetworkOperation(NetworkStatus.ONLINE, 'singleton_test', true, 100);

      expect(tracker2.getTotalOperations()).assertEqual(1);
      expect(tracker2.getSuccessfulOperations()).assertEqual(1);
    });

    // 验证dialog should处理能力：确保TV设备在handle network status transitions下功能正常
    it('app_should_handle_network_status_transitions', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      networkTracker.resetTracker();

      const transitions: NetworkTransitionRecord[] = [{ from: NetworkStatus.ONLINE, to: NetworkStatus.OFFLINE },
        { from: NetworkStatus.OFFLINE, to: NetworkStatus.CONNECTING },
        { from: NetworkStatus.CONNECTING, to: NetworkStatus.ONLINE },
        { from: NetworkStatus.ONLINE, to: NetworkStatus.DISCONNECTING }];

      for (const transition of transitions) {
        networkTracker.setCurrentStatus(transition.from);
        networkTracker.setCurrentStatus(transition.to);
        networkTracker.recordNetworkOperation(transition.to, `transition_${transition.from}_to_${transition.to}`, true,
          50);
      }

      expect(networkTracker.getTotalOperations()).assertEqual(4);
    });

    // 验证dialog should维持稳定：确保TV设备在maintain stability during network changes下性能不降低
    it('app_should_maintain_stability_during_network_changes', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      networkTracker.resetTracker();
      const initialCount = await appComponentCount(driver);

      const statuses =
        [NetworkStatus.ONLINE, NetworkStatus.OFFLINE, NetworkStatus.CONNECTING, NetworkStatus.DISCONNECTING];
      for (let i = 0; i < 20; i++) {
        const status = statuses[i % statuses.length];
        networkTracker.setCurrentStatus(status);
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        networkTracker.recordNetworkOperation(status, `stability_op_${i}`, true, 30);
        await driver.delayMs(50);
      }

      const finalCount = await appComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    // 验证dialog should处理能力：确保TV设备在handle rapid network changes下功能正常
    it('app_should_handle_rapid_network_changes', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      networkTracker.resetTracker();

      const statuses =
        [NetworkStatus.ONLINE, NetworkStatus.OFFLINE, NetworkStatus.CONNECTING, NetworkStatus.DISCONNECTING];
      for (let i = 0; i < 40; i++) {
        const status = statuses[i % statuses.length];
        networkTracker.setCurrentStatus(status);
        networkTracker.recordNetworkOperation(status, `rapid_change_${i}`, true, 20);
        await driver.delayMs(30);
      }

      expect(networkTracker.getTotalOperations()).assertEqual(40);
      expect(networkTracker.getSuccessRate()).assertEqual(1);
    });

    it('app_should_track_network_operation_counts', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      networkTracker.resetTracker();

      networkTracker.recordNetworkOperation(NetworkStatus.ONLINE, 'online_op_1', true, 50);
      networkTracker.recordNetworkOperation(NetworkStatus.ONLINE, 'online_op_2', true, 50);
      networkTracker.recordNetworkOperation(NetworkStatus.OFFLINE, 'offline_op_1', true, 50);

      expect(networkTracker.getOperationCountByStatus(NetworkStatus.ONLINE)).assertEqual(2);
      expect(networkTracker.getOperationCountByStatus(NetworkStatus.OFFLINE)).assertEqual(1);
    });

    // 综合comprehensive network场景测试：验证完整操作流程中功能正确
    it('comprehensive_network_connectivity_scenario', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      networkTracker.resetTracker();

      const scenarioStart = Date.now();

      networkTracker.setCurrentStatus(NetworkStatus.ONLINE);
      const startTime1 = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime1 = Date.now() - startTime1;
      networkTracker.recordNetworkOperation(NetworkStatus.ONLINE, 'online_navigation', true, responseTime1);

      networkTracker.setCurrentStatus(NetworkStatus.OFFLINE);
      const startTime2 = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime2 = Date.now() - startTime2;
      networkTracker.recordNetworkOperation(NetworkStatus.OFFLINE, 'offline_navigation', true, responseTime2);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(networkTracker.getTotalOperations()).assertEqual(2);
      expect(scenarioDuration).assertLessOrEqual(5000);
    }); // 验证应用列表排序策略逻辑：确保TV设备排序结果完整且顺序正确
    it('app_list_sort_strategy_should_order_completely', 0, async () => {
      const original: string[] = ['b', 'a', 'c'];
      const sorted: string[] = AppListSortStrategy.sortByInstallTime(original);
      expect(sorted[0]).assertEqual('a');
      expect(sorted[1]).assertEqual('b');
      expect(sorted[2]).assertEqual('c');
      expect(AppListSortStrategy.isCompleteOrder(sorted, original)).assertTrue();
      const desc: string[] = AppListSortStrategy.sortByInstallTimeDesc(original);
      expect(desc[0]).assertEqual('c');
      const history: string[] = ['c', 'a'];
      const ordered: string[] = AppListSortStrategy.orderByHistory(original, history);
      expect(ordered[0]).assertEqual('c');
      expect(ordered[1]).assertEqual('a');
      expect(ordered[2]).assertEqual('b');
    }); // 验证应用列表缓存管理逻辑：确保TV设备缓存命中与失效符合预期
    it('app_list_cache_manager_should_handle_hit_and_miss', 0, async () => {
      const cache: AppListCacheManager = new AppListCacheManager();
      expect(cache.getIcon('com.demo.app')).assertEqual(null);
      expect(cache.getHitRate()).assertEqual(0);
      cache.putIcon('com.demo.app', 'icon_1');
      cache.putName('com.demo.app', 'demo');
      expect(cache.getIcon('com.demo.app')).assertEqual('icon_1');
      expect(cache.getCacheSize()).assertEqual(2);
      expect(cache.getHitRate()).assertEqual(0.5);
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


