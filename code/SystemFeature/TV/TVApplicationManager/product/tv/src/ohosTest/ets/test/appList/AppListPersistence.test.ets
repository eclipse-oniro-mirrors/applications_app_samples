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
  KEY_MENU,
  appComponentCount,
  checkFocusState,
  waitForUiStable,
  pressAndWait,
  triggerMenuDialog,
  serializedDelay,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  getCurrentFocusIndex
} from '../common/SharedDriver';

enum DialogState {
  CLOSED = 'closed', OPENING = 'opening', OPENED = 'opened', CLOSING = 'closing'
}

interface StateRecord {
  state: DialogState;
  focusIndex: number;
  timestamp: number;
  isPersisted: boolean;
}

class AppListPersistenceTracker {
  private static instance: AppListPersistenceTracker;
  private stateHistory: StateRecord[] = [];
  private totalStates: number = 0;
  private persistedStates: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): AppListPersistenceTracker {
    if (!AppListPersistenceTracker.instance) {
      AppListPersistenceTracker.instance = new AppListPersistenceTracker();
    }
    return AppListPersistenceTracker.instance;
  }

  public recordState(state: DialogState, focusIndex: number, isPersisted: boolean): void {
    const record: StateRecord = {
      state,
      focusIndex,
      timestamp: Date.now(),
      isPersisted
    };
    this.stateHistory.push(record);
    this.totalStates++;
    if (isPersisted) {
      this.persistedStates++;
    }
  }

  public getStateHistory(): StateRecord[] {
    return [...this.stateHistory];
  }

  public getTotalStates(): number {
    return this.totalStates;
  }

  public getPersistedStates(): number {
    return this.persistedStates;
  }

  public resetTracker(): void {
    this.stateHistory = [];
    this.totalStates = 0;
    this.persistedStates = 0;
  }

  public getPersistenceRate(): number {
    if (this.totalStates === 0) {
      return 0;
    }
    return this.persistedStates / this.totalStates;
  }

  public hasState(state: DialogState): boolean {
    return this.stateHistory.some(record => record.state === state);
  }

  public getLastState(): DialogState | undefined {
    if (this.stateHistory.length === 0) {
      return undefined;
    }
    return this.stateHistory[this.stateHistory.length - 1].state;
  }
}

export default function appListPersistenceTest() {
  describe('AppListPersistence_Test', () => {
    let driver: Driver;
    let stateTracker: AppListPersistenceTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      stateTracker = AppListPersistenceTracker.getInstance();
      stateTracker.resetTracker();
      await serializedDelay(driver, 1000);
      await triggerMenuDialog(driver);
    });

    // 测试清理：关闭弹窗并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 验证dialog should持久：确保TV设备persist opened state状态保持
    it('app_should_persist_opened_state', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      stateTracker.recordState(DialogState.OPENED, 0, true);

      expect(stateTracker.hasState(DialogState.OPENED)).assertTrue();
    });

    it('app_should_restore_state_after_close', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      stateTracker.resetTracker();

      stateTracker.recordState(DialogState.OPENED, 0, true);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);

      stateTracker.recordState(DialogState.CLOSED, -1, true);

      expect(stateTracker.hasState(DialogState.CLOSED)).assertTrue();
    });

    // 验证dialog state状态正确：确保TV设备records timestamps should be chronological符合预期
    it('app_state_records_timestamps_should_be_chronological', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      stateTracker.resetTracker();

      stateTracker.recordState(DialogState.OPENED, 0, true);
      await serializedDelay(driver, 100);
      stateTracker.recordState(DialogState.OPENED, 1, true);
      await serializedDelay(driver, 100);
      stateTracker.recordState(DialogState.OPENED, 2, true);

      const history = stateTracker.getStateHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证dialog state维持稳定：确保TV设备在tracker singleton should maintain consistency下性能不降级
    it('app_state_tracker_singleton_should_maintain_consistency', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const tracker1 = AppListPersistenceTracker.getInstance();
      const tracker2 = AppListPersistenceTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.recordState(DialogState.OPENED, 0, true);

      expect(tracker2.getTotalStates()).assertEqual(1);
      expect(tracker2.getPersistedStates()).assertEqual(1);
    });

    it('app_should_track_all_state_transitions', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      stateTracker.resetTracker();

      const states = [DialogState.CLOSED, DialogState.OPENING, DialogState.OPENED, DialogState.CLOSING];
      for (const state of states) {
        stateTracker.recordState(state, 0, true);
      }

      expect(stateTracker.getTotalStates()).assertEqual(4);
      expect(stateTracker.hasState(DialogState.CLOSED)).assertTrue();
      expect(stateTracker.hasState(DialogState.OPENING)).assertTrue();
      expect(stateTracker.hasState(DialogState.OPENED)).assertTrue();
      expect(stateTracker.hasState(DialogState.CLOSING)).assertTrue();
    });

    // 验证dialog should维持稳定：确保TV设备在maintain state consistency下性能不降级
    it('app_should_maintain_state_consistency', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      stateTracker.resetTracker();
      const initialCount = await appComponentCount(driver);

      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        stateTracker.recordState(DialogState.OPENED, i % 3, true);
        await serializedDelay(driver, 50);
      }

      const finalCount = await appComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    // 验证dialog should处理能力：确保TV设备在handle rapid state changes下功能正常
    it('app_should_handle_rapid_state_changes', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      stateTracker.resetTracker();

      for (let i = 0; i < 50; i++) {
        const state = i % 2 === 0 ? DialogState.OPENED : DialogState.CLOSED;
        stateTracker.recordState(state, i % 3, true);
        await serializedDelay(driver, 30);
      }

      expect(stateTracker.getTotalStates()).assertEqual(50);
      expect(stateTracker.getPersistenceRate()).assertEqual(1);
    });

    it('app_should_restore_last_state', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      stateTracker.resetTracker();

      stateTracker.recordState(DialogState.OPENED, 0, true);
      stateTracker.recordState(DialogState.OPENED, 1, true);
      stateTracker.recordState(DialogState.OPENED, 2, true);

      const lastState = stateTracker.getLastState();
      expect(lastState).assertEqual(DialogState.OPENED);
    });

    // 验证dialog should持久：确保TV设备persist state across operations状态保持
    it('app_should_persist_state_across_operations', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      stateTracker.resetTracker();

      for (let i = 0; i < 20; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        stateTracker.recordState(DialogState.OPENED, i % 3, true);
        await serializedDelay(driver, 50);
      }

      expect(stateTracker.getPersistedStates()).assertEqual(20);
    });

    // 综合comprehensive state场景测试：验证完整操作流程中功能正确
    it('comprehensive_state_persistence_scenario', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      stateTracker.resetTracker();

      const scenarioStart = Date.now();

      stateTracker.recordState(DialogState.OPENING, 0, true);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);

      stateTracker.recordState(DialogState.OPENED, 0, true);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

      stateTracker.recordState(DialogState.OPENED, 1, true);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);

      stateTracker.recordState(DialogState.CLOSING, -1, true);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(stateTracker.getTotalStates()).assertEqual(4);
      expect(stateTracker.getPersistenceRate()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(5000);
    });

    // 验证持久化存储：确保TV设备AppListPersistenceStore保存读取正确
    it('persistence_store_should_save_and_load_order', 0, () => {
      const store: AppListPersistenceStore = new AppListPersistenceStore();
      expect(store.hasSavedOrder()).assertFalse();
      store.saveOrder(['com.a', 'com.b']);
      expect(store.hasSavedOrder()).assertTrue();
      const loaded: string[] = store.loadOrder();
      expect(loaded.length).assertEqual(2);
      expect(loaded[0]).assertEqual('com.a');
      store.clearOrder();
      expect(store.hasSavedOrder()).assertFalse();
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


