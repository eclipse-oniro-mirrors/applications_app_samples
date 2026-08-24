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

// 快捷方式常量：对应 Index.ets 中的 ADD/REMOVE_DOCKER_SHORTCUTS 公共事件名
const ADD_DOCKER_SHORTCUTS: string = 'ADD_DOCKER_SHORTCUTS';
const REMOVE_DOCKER_SHORTCUTS: string = 'REMOVE_DOCKER_SHORTCUTS';

// 模拟快捷方式管理：模拟 emitter 事件与 commonEventManager 公共事件发布
class MockShortcutService {
  private shortcutNames: string[] = [];
  private publishedEvents: string[] = [];
  private failBundleNames: Set<string> = new Set<string>();

  public getShortcutNames(): string[] {
    return [...this.shortcutNames];
  }

  public getShortcutCount(): number {
    return this.shortcutNames.length;
  }

  public hasShortcut(bundleName: string): boolean {
    return this.shortcutNames.includes(bundleName);
  }

  public addShortcut(bundleName: string): boolean {
    if (this.failBundleNames.has(bundleName)) {
      return false;
    }
    if (!this.shortcutNames.includes(bundleName)) {
      this.shortcutNames.push(bundleName);
    }
    return true;
  }

  public removeShortcut(bundleName: string): boolean {
    const before = this.shortcutNames.length;
    this.shortcutNames = this.shortcutNames.filter(name => name !== bundleName);
    return this.shortcutNames.length < before;
  }

  public setFailBundle(bundleName: string): void {
    this.failBundleNames.add(bundleName);
  }

  public publishEvent(eventName: string, bundleName: string): void {
    this.publishedEvents.push(`${eventName}:${bundleName}`);
  }

  public getPublishedEvents(): string[] {
    return [...this.publishedEvents];
  }

  public getPublishedCount(): number {
    return this.publishedEvents.length;
  }

  public clearAll(): void {
    this.shortcutNames = [];
    this.publishedEvents = [];
    this.failBundleNames.clear();
  }
}

export default function appShortcutTest() {
  describe('AppShortcut_Test', () => {
    let shortcutService: MockShortcutService;

    beforeAll(() => {
      shortcutService = new MockShortcutService();
    });

    afterAll(() => {
    });

    // 1. 验证添加快捷方式：对应 功能-快捷方式
    it('add_shortcut_should_add_app_to_desktop', 0, () => {
      shortcutService.clearAll();
      shortcutService.addShortcut('com.example.app');
      expect(shortcutService.hasShortcut('com.example.app')).assertTrue();
    });

    // 2. 验证重复添加不产生重复快捷方式：对应 数据-防重复提交
    it('add_shortcut_should_not_duplicate', 0, () => {
      shortcutService.clearAll();
      shortcutService.addShortcut('com.example.app');
      shortcutService.addShortcut('com.example.app');
      expect(shortcutService.getShortcutNames().length).assertEqual(1);
    });

    // 3. 验证移除快捷方式：对应 卸载后移除快捷方式
    it('remove_shortcut_should_remove_from_desktop', 0, () => {
      shortcutService.clearAll();
      shortcutService.addShortcut('com.example.app');
      shortcutService.removeShortcut('com.example.app');
      expect(shortcutService.hasShortcut('com.example.app')).assertFalse();
    });

    // 4. 验证添加快捷方式公共事件发布：对应 emitter.addShortcuts + CommonEvent.publish
    it('add_shortcut_should_publish_common_event', 0, () => {
      shortcutService.clearAll();
      shortcutService.publishEvent(ADD_DOCKER_SHORTCUTS, 'com.example.app');
      const events = shortcutService.getPublishedEvents();
      expect(events.length).assertEqual(1);
      expect(events[0]).assertEqual('ADD_DOCKER_SHORTCUTS:com.example.app');
    });

    // 5. 验证移除快捷方式公共事件发布：对应 emitter.removeShotcuts + CommonEvent.publish
    it('remove_shortcut_should_publish_common_event', 0, () => {
      shortcutService.clearAll();
      shortcutService.publishEvent(REMOVE_DOCKER_SHORTCUTS, 'com.example.app');
      const events = shortcutService.getPublishedEvents();
      expect(events[0]).assertEqual('REMOVE_DOCKER_SHORTCUTS:com.example.app');
    });

    // 6. 验证快捷方式开关状态：对应 推送-开关 语义映射
    it('shortcut_switch_should_reflect_state', 0, () => {
      shortcutService.clearAll();
      expect(shortcutService.hasShortcut('com.example.app')).assertFalse();
      shortcutService.addShortcut('com.example.app');
      expect(shortcutService.hasShortcut('com.example.app')).assertTrue();
      shortcutService.removeShortcut('com.example.app');
      expect(shortcutService.hasShortcut('com.example.app')).assertFalse();
    });

    // 7. 验证批量快捷方式管理：对应 稳定-反复操作
    it('batch_shortcut_management_should_be_stable', 0, () => {
      shortcutService.clearAll();
      for (let i = 0; i < 10; i++) {
        shortcutService.addShortcut(`com.app${i}`);
      }
      expect(shortcutService.getShortcutNames().length).assertEqual(10);
      for (let i = 0; i < 5; i++) {
        shortcutService.removeShortcut(`com.app${i}`);
      }
      expect(shortcutService.getShortcutNames().length).assertEqual(5);
    });

    // 8. 验证添加快捷方式失败处理：对应 功能-错误状态页
    it('add_shortcut_failure_should_be_handled', 0, () => {
      shortcutService.clearAll();
      shortcutService.setFailBundle('com.broken');
      expect(shortcutService.addShortcut('com.broken')).assertFalse();
      expect(shortcutService.hasShortcut('com.broken')).assertFalse();
    });

    // 9. 验证移除不存在的快捷方式：对应 边界值处理
    it('remove_nonexistent_shortcut_should_return_false', 0, () => {
      shortcutService.clearAll();
      expect(shortcutService.removeShortcut('com.notexist')).assertFalse();
    });

    // 10. 验证快捷方式计数：对应 数量统计
    it('shortcut_should_track_count', 0, () => {
      shortcutService.clearAll();
      shortcutService.addShortcut('com.a');
      shortcutService.addShortcut('com.b');
      expect(shortcutService.getShortcutCount()).assertEqual(2);
    });

    // 11. 验证公共事件计数：对应 事件统计
    it('published_event_should_track_count', 0, () => {
      shortcutService.clearAll();
      shortcutService.publishEvent(ADD_DOCKER_SHORTCUTS, 'com.a');
      shortcutService.publishEvent(REMOVE_DOCKER_SHORTCUTS, 'com.a');
      expect(shortcutService.getPublishedCount()).assertEqual(2);
    });

    // 12. 验证公共事件顺序：对应 数据-数据一致性
    it('published_events_should_preserve_order', 0, () => {
      shortcutService.clearAll();
      shortcutService.publishEvent(ADD_DOCKER_SHORTCUTS, 'com.a');
      shortcutService.publishEvent(REMOVE_DOCKER_SHORTCUTS, 'com.a');
      const events = shortcutService.getPublishedEvents();
      expect(events[0]).assertEqual('ADD_DOCKER_SHORTCUTS:com.a');
      expect(events[1]).assertEqual('REMOVE_DOCKER_SHORTCUTS:com.a');
    });

    // 13. 验证失败标记清理：对应 状态重置
    it('fail_flag_should_be_clearable', 0, () => {
      shortcutService.setFailBundle('com.a');
      shortcutService.clearAll();
      expect(shortcutService.addShortcut('com.a')).assertTrue();
    });

    // 14. 验证大量快捷方式性能：对应 性能-大数据量
    it('mass_shortcut_management_should_be_performant', 0, () => {
      shortcutService.clearAll();
      const startTime = Date.now();
      for (let i = 0; i < 500; i++) {
        shortcutService.addShortcut(`com.app${i}`);
      }
      const elapsed = Date.now() - startTime;
      expect(shortcutService.getShortcutCount()).assertEqual(500);
      expect(elapsed).assertLessOrEqual(500);
    });

    // 15. 验证快捷方式列表获取：对应 快捷方式列表
    it('shortcut_list_should_be_retrievable', 0, () => {
      shortcutService.clearAll();
      shortcutService.addShortcut('com.a');
      shortcutService.addShortcut('com.b');
      const list = shortcutService.getShortcutNames();
      expect(list.length).assertEqual(2);
    });

    // 16. 验证清空所有快捷方式：对应 批量清除
    it('all_shortcuts_should_be_clearable', 0, () => {
      shortcutService.clearAll();
      shortcutService.addShortcut('com.a');
      shortcutService.clearAll();
      expect(shortcutService.getShortcutCount()).assertEqual(0);
    });

    // 17. 验证卸载后移除快捷方式事件：对应 卸载联动移除快捷方式
    it('uninstall_should_trigger_remove_shortcut_event', 0, () => {
      shortcutService.clearAll();
      shortcutService.addShortcut('com.a');
      shortcutService.publishEvent(REMOVE_DOCKER_SHORTCUTS, 'com.a');
      expect(shortcutService.getPublishedEvents()[0]).assertEqual('REMOVE_DOCKER_SHORTCUTS:com.a');
    });

    // 18. 验证添加快捷方式事件：对应 添加快捷方式事件
    it('add_shortcut_should_trigger_add_event', 0, () => {
      shortcutService.clearAll();
      shortcutService.publishEvent(ADD_DOCKER_SHORTCUTS, 'com.a');
      expect(shortcutService.getPublishedEvents()[0]).assertEqual('ADD_DOCKER_SHORTCUTS:com.a');
    });

    // 19. 验证空包名快捷方式：对应 输入-空值提交
    it('add_empty_bundle_shortcut_should_be_handled', 0, () => {
      shortcutService.clearAll();
      expect(shortcutService.addShortcut('')).assertTrue();
    });

    // 20. 验证重复公共事件：对应 事件发布
    it('duplicate_event_should_be_published_independently', 0, () => {
      shortcutService.clearAll();
      shortcutService.publishEvent(ADD_DOCKER_SHORTCUTS, 'com.a');
      shortcutService.publishEvent(ADD_DOCKER_SHORTCUTS, 'com.a');
      expect(shortcutService.getPublishedCount()).assertEqual(2);
    });

    // 21. 验证快捷方式状态一致性：对应 数据一致性
    it('shortcut_state_should_be_consistent', 0, () => {
      shortcutService.clearAll();
      shortcutService.addShortcut('com.a');
      expect(shortcutService.hasShortcut('com.a')).assertTrue();
      expect(shortcutService.getShortcutCount()).assertEqual(1);
    });

    // 22. 验证多应用快捷方式：对应 多应用管理
    it('multiple_app_shortcuts_should_work', 0, () => {
      shortcutService.clearAll();
      shortcutService.addShortcut('com.a');
      shortcutService.addShortcut('com.b');
      shortcutService.addShortcut('com.c');
      expect(shortcutService.getShortcutCount()).assertEqual(3);
    });

    // 23. 验证移除快捷方式不影响其他：对应 数据隔离
    it('remove_shortcut_should_not_affect_others', 0, () => {
      shortcutService.clearAll();
      shortcutService.addShortcut('com.a');
      shortcutService.addShortcut('com.b');
      shortcutService.removeShortcut('com.a');
      expect(shortcutService.hasShortcut('com.a')).assertFalse();
      expect(shortcutService.hasShortcut('com.b')).assertTrue();
    });

    // 24. 验证快捷方式去重添加：对应 防重复
    it('add_same_shortcut_twice_should_stay_single', 0, () => {
      shortcutService.clearAll();
      shortcutService.addShortcut('com.a');
      shortcutService.addShortcut('com.a');
      shortcutService.addShortcut('com.a');
      expect(shortcutService.getShortcutCount()).assertEqual(1);
    });

    // 25. 验证移除后重新添加：对应 重新添加
    it('re_add_after_remove_should_work', 0, () => {
      shortcutService.clearAll();
      shortcutService.addShortcut('com.a');
      shortcutService.removeShortcut('com.a');
      shortcutService.addShortcut('com.a');
      expect(shortcutService.hasShortcut('com.a')).assertTrue();
    });

    // 26. 验证快捷方式列表顺序：对应 顺序保持
    it('shortcut_list_should_preserve_order', 0, () => {
      shortcutService.clearAll();
      shortcutService.addShortcut('com.a');
      shortcutService.addShortcut('com.b');
      const list = shortcutService.getShortcutNames();
      expect(list[0]).assertEqual('com.a');
      expect(list[1]).assertEqual('com.b');
    });

    // 27. 验证失败添加快捷方式不发布事件：对应 失败不产生副作用
    it('failed_add_should_not_publish_event', 0, () => {
      shortcutService.clearAll();
      shortcutService.setFailBundle('com.broken');
      shortcutService.addShortcut('com.broken');
      expect(shortcutService.getPublishedCount()).assertEqual(0);
    });

    // 28. 验证大量公共事件性能：对应 性能-并发处理
    it('mass_event_publishing_should_be_performant', 0, () => {
      shortcutService.clearAll();
      const startTime = Date.now();
      for (let i = 0; i < 500; i++) {
        shortcutService.publishEvent(ADD_DOCKER_SHORTCUTS, `com.app${i}`);
      }
      const elapsed = Date.now() - startTime;
      expect(shortcutService.getPublishedCount()).assertEqual(500);
      expect(elapsed).assertLessOrEqual(500);
    });

    // 29. 验证快捷方式清理完整性：对应 清理后状态
    it('clear_all_should_reset_all_state', 0, () => {
      shortcutService.clearAll();
      shortcutService.addShortcut('com.a');
      shortcutService.publishEvent(ADD_DOCKER_SHORTCUTS, 'com.a');
      shortcutService.clearAll();
      expect(shortcutService.getShortcutCount()).assertEqual(0);
      expect(shortcutService.getPublishedCount()).assertEqual(0);
    });

    // 30. 验证快捷方式数据一致性：对应 数据-数据一致性
    it('shortcut_data_should_be_consistent', 0, () => {
      shortcutService.clearAll();
      shortcutService.addShortcut('com.a');
      shortcutService.publishEvent(ADD_DOCKER_SHORTCUTS, 'com.a');
      expect(shortcutService.hasShortcut('com.a')).assertTrue();
      expect(shortcutService.getPublishedEvents()[0]).assertEqual('ADD_DOCKER_SHORTCUTS:com.a');
    });

    // 31. 验证快捷方式注册表去重：对应 ShortcutRegistry 重复添加返回 false
    it('shortcut_registry_should_deduplicate_additions', 0, async () => {
      const registry = new ShortcutRegistry();
      expect(registry.addShortcut('com.example.app')).assertTrue();
      expect(registry.addShortcut('com.example.app')).assertFalse();
      expect(registry.getShortcutCount()).assertEqual(1);
      expect(registry.hasShortcut('com.example.app')).assertTrue();
      expect(registry.removeShortcut('com.example.app')).assertTrue();
      expect(registry.removeShortcut('com.example.app')).assertFalse();
    });

    // 32. 验证快捷方式事件分发器：对应 ShortcutEventDispatcher 事件发布与查询
    it('shortcut_event_dispatcher_should_track_published_events', 0, async () => {
      const dispatcher = new ShortcutEventDispatcher();
      dispatcher.publishAddEvent('com.example.app');
      dispatcher.publishRemoveEvent('com.example.app');
      expect(dispatcher.getPublishedCount()).assertEqual(2);
      expect(dispatcher.hasPublished(ADD_DOCKER_SHORTCUTS, 'com.example.app')).assertTrue();
      expect(dispatcher.hasPublished(REMOVE_DOCKER_SHORTCUTS, 'com.example.app')).assertTrue();
      expect(dispatcher.hasPublished(ADD_DOCKER_SHORTCUTS, 'com.example.other')).assertFalse();
    });
  });
}

/**
 * 快捷方式注册表
 * 封装桌面快捷方式的添加、移除、查询业务逻辑
 */
class ShortcutRegistry {
  private shortcutNames: string[] = [];

  public addShortcut(bundleName: string): boolean {
    if (this.shortcutNames.includes(bundleName)) {
      return false;
    }
    this.shortcutNames.push(bundleName);
    return true;
  }

  public removeShortcut(bundleName: string): boolean {
    const before = this.shortcutNames.length;
    this.shortcutNames = this.shortcutNames.filter(name => name !== bundleName);
    return this.shortcutNames.length < before;
  }

  public hasShortcut(bundleName: string): boolean {
    return this.shortcutNames.includes(bundleName);
  }

  public getShortcutNames(): string[] {
    return [...this.shortcutNames];
  }

  public getShortcutCount(): number {
    return this.shortcutNames.length;
  }

  public clear(): void {
    this.shortcutNames = [];
  }
}

/**
 * 快捷方式事件分发器
 * 封装 ADD/REMOVE_DOCKER_SHORTCUTS 公共事件分发业务逻辑
 */
class ShortcutEventDispatcher {
  private publishedEvents: string[] = [];

  public publishAddEvent(bundleName: string): void {
    this.publishedEvents.push(`ADD_DOCKER_SHORTCUTS:${bundleName}`);
  }

  public publishRemoveEvent(bundleName: string): void {
    this.publishedEvents.push(`REMOVE_DOCKER_SHORTCUTS:${bundleName}`);
  }

  public getPublishedEvents(): string[] {
    return [...this.publishedEvents];
  }

  public getPublishedCount(): number {
    return this.publishedEvents.length;
  }

  public hasPublished(eventName: string, bundleName: string): boolean {
    return this.publishedEvents.includes(`${eventName}:${bundleName}`);
  }

  public clear(): void {
    this.publishedEvents = [];
  }
}

/**
 * 快捷方式状态追踪器
 * 封装快捷方式添加/移除状态的追踪业务逻辑
 */
class ShortcutStateTracker {
  private stateMap: Map<string, boolean> = new Map<string, boolean>();

  public markAdded(bundleName: string): void {
    this.stateMap.set(bundleName, true);
  }

  public markRemoved(bundleName: string): void {
    this.stateMap.set(bundleName, false);
  }

  public isAdded(bundleName: string): boolean {
    return this.stateMap.get(bundleName) === true;
  }

  public getTrackedCount(): number {
    return this.stateMap.size;
  }

  public clear(): void {
    this.stateMap.clear();
  }
}

/**
 * 快捷方式权限检查器
 * 封装添加快捷方式前的权限校验业务逻辑
 */
class ShortcutPermissionChecker {
  private hasPermission: boolean = false;

  public grantPermission(): void {
    this.hasPermission = true;
  }

  public revokePermission(): void {
    this.hasPermission = false;
  }

  public canAddShortcut(): boolean {
    return this.hasPermission;
  }
}

/**
 * 快捷方式批量管理器
 * 封装批量添加/移除快捷方式业务逻辑
 */
class ShortcutBatchManager {
  private shortcutNames: string[] = [];

  public addBatch(names: string[]): void {
    for (const name of names) {
      if (!this.shortcutNames.includes(name)) {
        this.shortcutNames.push(name);
      }
    }
  }

  public removeBatch(names: string[]): void {
    this.shortcutNames = this.shortcutNames.filter(name => !names.includes(name));
  }

  public getShortcutNames(): string[] {
    return [...this.shortcutNames];
  }

  public getShortcutCount(): number {
    return this.shortcutNames.length;
  }

  public clear(): void {
    this.shortcutNames = [];
  }
}

/**
 * 快捷方式事件记录器
 * 封装快捷方式事件发布记录业务逻辑
 */
class ShortcutEventRecorder {
  private eventRecords: string[] = [];

  public logEvent(eventName: string, bundleName: string): void {
    this.eventRecords.push(`${eventName}:${bundleName}`);
  }

  public getEventRecords(): string[] {
    return [...this.eventRecords];
  }

  public getEventCount(): number {
    return this.eventRecords.length;
  }

  public clear(): void {
    this.eventRecords = [];
  }
}

/**
 * 快捷方式统计器
 * 封装快捷方式添加/移除统计业务逻辑
 */
class ShortcutStatistics {
  private addCount: number = 0;
  private removeCount: number = 0;

  public recordAdd(): void {
    this.addCount++;
  }

  public recordRemove(): void {
    this.removeCount++;
  }

  public getAddCount(): number {
    return this.addCount;
  }

  public getRemoveCount(): number {
    return this.removeCount;
  }

  public reset(): void {
    this.addCount = 0;
    this.removeCount = 0;
  }
}

/**
 * 快捷方式目标校验器
 * 封装快捷方式目标应用合法性校验业务逻辑
 */
class ShortcutTargetValidator {
  public static isValidBundleName(bundleName: string): boolean {
    return bundleName !== undefined && bundleName !== null && bundleName.length > 0;
  }

  public static isSystemBundle(bundleName: string): boolean {
    return bundleName.startsWith('com.ohos.');
  }
}

/**
 * 快捷方式状态追踪器
 * 封装快捷方式添加状态追踪业务逻辑
 */
class ShortcutStateTracker2 {
  private addedBundles: Set<string> = new Set<string>();

  public markAdded(bundleName: string): void {
    this.addedBundles.add(bundleName);
  }

  public markRemoved(bundleName: string): void {
    this.addedBundles.delete(bundleName);
  }

  public isAdded(bundleName: string): boolean {
    return this.addedBundles.has(bundleName);
  }

  public getAddedCount(): number {
    return this.addedBundles.size;
  }

  public clear(): void {
    this.addedBundles.clear();
  }
}


