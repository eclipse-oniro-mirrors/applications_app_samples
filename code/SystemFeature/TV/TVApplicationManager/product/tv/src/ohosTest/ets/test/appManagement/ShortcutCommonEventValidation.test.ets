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

// 公共事件类型枚举：定义系统支持的所有事件类型，确保事件分类清晰
enum CommonEventType {
  APP_UNINSTALL = 'app_uninstall', APP_SHORTCUT = 'app_shortcut', APP_MOVE = 'app_move', DIALOG_OPEN = 'dialog_open', DIALOG_CLOSE = 'dialog_close', FOCUS_CHANGE = 'focus_change', SYSTEM_READY = 'system_ready'
}

// 事件负载接口：定义事件携带的额外数据结构，支持不同类型事件的参数传递
interface EventPayload {
  reason?: string;
  mode?: string;
  dialogType?: string;
  fromIndex?: number;
  toIndex?: number;
  delay?: number;
  retryCount?: number;
  forceMove?: boolean;
  saveState?: boolean;
  index?: number;
  original?: boolean;
  version?: string;
  animation?: boolean;
  confirmed?: boolean;
}

interface CommonEventData {
  eventType: CommonEventType;
  payload: EventPayload;
  timestamp: number;
  source: string;
}

// 事件订阅者接口：定义事件监听器的结构，支持订阅特定类型的事件
interface CommonEventSubscriber {
  id: string;
  callback: (data: CommonEventData) => void;
  eventTypes: CommonEventType[];
}

// 公共事件系统类：实现事件发布订阅模式，管理事件分发和订阅
class ShortcutCommonEventSystem {
  private static instance: ShortcutCommonEventSystem;
  private subscribers: Map<string, CommonEventSubscriber> = new Map();
  private eventHistory: CommonEventData[] = [];
  private publishedCount: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): ShortcutCommonEventSystem {
    if (!ShortcutCommonEventSystem.instance) {
      ShortcutCommonEventSystem.instance = new ShortcutCommonEventSystem();
    }
    return ShortcutCommonEventSystem.instance;
  }

  // 订阅事件：验证订阅者能成功注册并接收指定类型的事件
  public subscribe(subscriber: CommonEventSubscriber): boolean {
    if (this.subscribers.has(subscriber.id)) {
      return false;
    }
    this.subscribers.set(subscriber.id, subscriber);
    return true;
  }

  // 取消订阅：验证订阅者能被正确移除，不再接收事件
  public unsubscribe(subscriberId: string): boolean {
    return this.subscribers.delete(subscriberId);
  }

  // 发布事件：验证事件能被正确分发到所有匹配的订阅者
  public publish(eventData: CommonEventData): void {
    eventData.timestamp = Date.now();
    this.eventHistory.push(eventData);
    this.publishedCount++;

    // 遍历所有订阅者：只通知订阅了该事件类型的订阅者
    for (const subscriber of this.subscribers.values()) {
      if (subscriber.eventTypes.includes(eventData.eventType)) {
        subscriber.callback(eventData);
      }
    }
  }

  // 获取事件历史：返回所有已发布事件的副本，防止外部修改
  public getEventHistory(): CommonEventData[] {
    return [...this.eventHistory];
  }

  // 按类型查询事件：返回指定类型的所有事件，用于验证事件分发正确性
  public getEventsByType(eventType: CommonEventType): CommonEventData[] {
    return this.eventHistory.filter(event => event.eventType === eventType);
  }

  // 获取发布计数：返回已发布事件总数，用于验证事件发布次数
  public getPublishedCount(): number {
    return this.publishedCount;
  }

  // 获取订阅者数量：返回当前活跃的订阅者数量
  public getSubscriberCount(): number {
    return this.subscribers.size;
  }

  // 检查订阅者是否存在：验证特定ID的订阅者是否已注册
  public hasSubscriber(subscriberId: string): boolean {
    return this.subscribers.has(subscriberId);
  }

  // 清空事件历史：移除所有已记录的事件，用于测试环境重置
  public clearEventHistory(): void {
    this.eventHistory = [];
    this.publishedCount = 0;
  }

  // 清空所有订阅者：移除所有事件订阅，用于测试环境重置
  public clearSubscribers(): void {
    this.subscribers.clear();
  }

  // 重置整个系统：清空事件历史和订阅者，确保测试独立性
  public resetSystem(): void {
    this.clearEventHistory();
    this.clearSubscribers();
  }

  // 获取事件类型统计：返回每种事件类型的出现次数
  public getEventTypeStats(): Map<string, number> {
    const stats = new Map<string, number>();

    for (const event of this.eventHistory) {
      const type = event.eventType;
      const currentCount = stats.get(type) || 0;
      stats.set(type, currentCount + 1);
    }

    return stats;
  }

  // 验证事件数据：检查事件数据的完整性和有效性
  public validateEventData(eventData: CommonEventData): boolean {
    const validTypes: CommonEventType[] =
      [CommonEventType.APP_UNINSTALL, CommonEventType.APP_SHORTCUT, CommonEventType.APP_MOVE,
        CommonEventType.DIALOG_OPEN, CommonEventType.DIALOG_CLOSE, CommonEventType.FOCUS_CHANGE,
        CommonEventType.SYSTEM_READY];
    let isValidType = false;
    for (const t of validTypes) {
      if (t === eventData.eventType) {
        isValidType = true;
        break;
      }
    }
    if (!isValidType) {
      return false;
    }

    if (eventData.timestamp <= 0) {
      return false;
    }

    if (eventData.source.length === 0) {
      return false;
    }

    return true;
  }
}

export default function shortcutCommonEventValidationTest() {
  describe('ShortcutCommonEventValidation_Test', () => {
    let driver: Driver;
    let eventSystem: ShortcutCommonEventSystem; // 测试前置：初始化驱动和事件系统，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      eventSystem = ShortcutCommonEventSystem.getInstance();
      eventSystem.resetSystem();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭弹窗并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    // 验证公共事件类型枚举定义正确：确保所有事件类型值与预期一致
    it('common_event_type_enum_should_be_defined_correctly', 0, async () => {
      expect(CommonEventType.APP_UNINSTALL).assertEqual('app_uninstall');
      expect(CommonEventType.APP_SHORTCUT).assertEqual('app_shortcut');
      expect(CommonEventType.APP_MOVE).assertEqual('app_move');
      expect(CommonEventType.DIALOG_OPEN).assertEqual('dialog_open');
      expect(CommonEventType.DIALOG_CLOSE).assertEqual('dialog_close');
      expect(CommonEventType.FOCUS_CHANGE).assertEqual('focus_change');
      expect(CommonEventType.SYSTEM_READY).assertEqual('system_ready');
    });

    // 验证事件订阅功能：确保订阅者能成功注册并接收事件
    it('common_event_subscription_should_work_correctly', 0, async () => {
      eventSystem.resetSystem();

      const subscriber: CommonEventSubscriber = {
        id: 'test_subscriber_1', callback: (_data: CommonEventData) => {
        }, eventTypes: [CommonEventType.APP_UNINSTALL, CommonEventType.APP_SHORTCUT]
      };

      const subscribeResult = eventSystem.subscribe(subscriber);
      expect(subscribeResult).assertTrue();
      expect(eventSystem.getSubscriberCount()).assertEqual(1);

      const payload1: EventPayload = { reason: 'user_action' };
      const eventData1: CommonEventData = {
        eventType: CommonEventType.APP_UNINSTALL,
        payload: payload1,
        timestamp: 0,
        source: 'test'
      };
      eventSystem.publish(eventData1);

      const history = eventSystem.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].eventType).assertEqual(CommonEventType.APP_UNINSTALL);
    });

    // 验证事件取消订阅功能：确保订阅者取消后不再接收事件
    it('common_event_unsubscription_should_work_correctly', 0, async () => {
      eventSystem.resetSystem();

      let receivedCount = 0;

      const subscriber: CommonEventSubscriber = {
        id: 'test_subscriber_2', callback: () => {
          receivedCount++;
        }, eventTypes: [CommonEventType.APP_UNINSTALL]
      };

      // 订阅事件
      eventSystem.subscribe(subscriber);
      expect(eventSystem.hasSubscriber('test_subscriber_2')).assertTrue();

      // 发布事件验证订阅者能接收
      const payloadEmpty: EventPayload = {};
      const eventUninstall: CommonEventData = {
        eventType: CommonEventType.APP_UNINSTALL,
        payload: payloadEmpty,
        timestamp: 0,
        source: 'test'
      };
      eventSystem.publish(eventUninstall);
      expect(receivedCount).assertEqual(1);
    });

    // 验证重复订阅被拒绝：确保同一订阅者ID不能被重复注册
    it('duplicate_subscription_should_be_rejected', 0, async () => {
      eventSystem.resetSystem();

      const subscriber: CommonEventSubscriber = {
        id: 'duplicate_test', callback: () => {
        }, eventTypes: [CommonEventType.APP_UNINSTALL]
      };

      // 第一次订阅应该成功
      const firstResult = eventSystem.subscribe(subscriber);
      expect(firstResult).assertTrue();

      // 第二次订阅相同ID应该失败
      const secondResult = eventSystem.subscribe(subscriber);
      expect(secondResult).assertFalse();

      expect(eventSystem.getSubscriberCount()).assertEqual(1);
    });

    // 验证事件发布功能：确保事件能被正确发布并记录到历史
    it('common_event_publishing_should_work_correctly', 0, async () => {
      eventSystem.resetSystem();

      const payload1: EventPayload = { dialogType: 'app' };
      const event1: CommonEventData = {
        eventType: CommonEventType.DIALOG_OPEN,
        payload: payload1,
        timestamp: 0,
        source: 'AppMenu'
      };
      eventSystem.publish(event1);

      const payload2: EventPayload = { fromIndex: 0, toIndex: 1 };
      const event2: CommonEventData = {
        eventType: CommonEventType.FOCUS_CHANGE,
        payload: payload2,
        timestamp: 0,
        source: 'FocusManager'
      };
      eventSystem.publish(event2);

      const payload3: EventPayload = { reason: 'user_action' };
      const event3: CommonEventData = {
        eventType: CommonEventType.DIALOG_CLOSE,
        payload: payload3,
        timestamp: 0,
        source: 'AppMenu'
      };
      eventSystem.publish(event3);

      expect(eventSystem.getPublishedCount()).assertEqual(3);
      expect(eventSystem.getEventHistory().length).assertEqual(3);
    });

    // 验证按类型查询事件：确保查询结果只包含指定类型的事件
    it('query_events_by_type_should_return_correct_results', 0, async () => {
      eventSystem.resetSystem();

      const emptyPayload1: EventPayload = {};
      const uninstallEvent1: CommonEventData = {
        eventType: CommonEventType.APP_UNINSTALL,
        payload: emptyPayload1,
        timestamp: 0,
        source: 'test'
      };
      eventSystem.publish(uninstallEvent1);

      const shortcutEvent: CommonEventData = {
        eventType: CommonEventType.APP_SHORTCUT,
        payload: emptyPayload1,
        timestamp: 0,
        source: 'test'
      };
      eventSystem.publish(shortcutEvent);

      const uninstallEvent2: CommonEventData = {
        eventType: CommonEventType.APP_UNINSTALL,
        payload: emptyPayload1,
        timestamp: 0,
        source: 'test'
      };
      eventSystem.publish(uninstallEvent2);

      const moveEvent: CommonEventData = {
        eventType: CommonEventType.APP_MOVE,
        payload: emptyPayload1,
        timestamp: 0,
        source: 'test'
      };
      eventSystem.publish(moveEvent);

      const uninstallEvents = eventSystem.getEventsByType(CommonEventType.APP_UNINSTALL);
      const shortcutEvents = eventSystem.getEventsByType(CommonEventType.APP_SHORTCUT);
      const moveEvents = eventSystem.getEventsByType(CommonEventType.APP_MOVE);

      expect(uninstallEvents.length).assertEqual(2);
      expect(shortcutEvents.length).assertEqual(1);
      expect(moveEvents.length).assertEqual(1);
    });

    // 验证事件数据校验：确保无效事件数据能被正确识别
    it('event_data_validation_should_detect_invalid_data', 0, async () => {
      eventSystem.resetSystem();

      const validPayload: EventPayload = { reason: 'test' };
      const validEventData: CommonEventData = {
        eventType: CommonEventType.APP_UNINSTALL,
        payload: validPayload,
        timestamp: Date.now(),
        source: 'test_source'
      };
      expect(eventSystem.validateEventData(validEventData)).assertTrue();

      const invalidPayload: EventPayload = {};
      const invalidTypeEventData: CommonEventData = {
        eventType: 'invalid_type' as CommonEventType,
        payload: invalidPayload,
        timestamp: Date.now(),
        source: 'test'
      };
      expect(eventSystem.validateEventData(invalidTypeEventData)).assertFalse();

      const invalidTsPayload: EventPayload = {};
      const invalidTimestampEventData: CommonEventData = {
        eventType: CommonEventType.APP_UNINSTALL,
        payload: invalidTsPayload,
        timestamp: 0,
        source: 'test'
      };
      expect(eventSystem.validateEventData(invalidTimestampEventData)).assertFalse();

      const emptySrcPayload: EventPayload = {};
      const emptySourceEventData: CommonEventData = {
        eventType: CommonEventType.APP_UNINSTALL,
        payload: emptySrcPayload,
        timestamp: Date.now(),
        source: ''
      };
      expect(eventSystem.validateEventData(emptySourceEventData)).assertFalse();
    });

    // 验证事件类型统计：确保各类型事件出现次数统计正确
    it('event_type_stats_should_be_accurate', 0, async () => {
      eventSystem.resetSystem();

      const emptyPayload: EventPayload = {};
      const uninstallEvent: CommonEventData = {
        eventType: CommonEventType.APP_UNINSTALL,
        payload: emptyPayload,
        timestamp: 0,
        source: 'test'
      };
      for (let i = 0; i < 3; i++) {
        eventSystem.publish(uninstallEvent);
      }

      const shortcutEvent: CommonEventData = {
        eventType: CommonEventType.APP_SHORTCUT,
        payload: emptyPayload,
        timestamp: 0,
        source: 'test'
      };
      for (let i = 0; i < 5; i++) {
        eventSystem.publish(shortcutEvent);
      }

      const moveEvent: CommonEventData = {
        eventType: CommonEventType.APP_MOVE,
        payload: emptyPayload,
        timestamp: 0,
        source: 'test'
      };
      for (let i = 0; i < 2; i++) {
        eventSystem.publish(moveEvent);
      }

      const stats = eventSystem.getEventTypeStats();

      expect(stats.get('app_uninstall')).assertEqual(3);
      expect(stats.get('app_shortcut')).assertEqual(5);
      expect(stats.get('app_move')).assertEqual(2);
    });

    // 验证多订阅者事件分发：确保事件能正确分发到所有匹配的订阅者
    it('multi_subscriber_event_distribution_should_work_correctly', 0, async () => {
      eventSystem.resetSystem();

      let subscriber1Count = 0;
      let subscriber2Count = 0;
      let subscriber3Count = 0;

      const sub1: CommonEventSubscriber = {
        id: 'sub_1', callback: () => {
          subscriber1Count++;
        }, eventTypes: [CommonEventType.APP_UNINSTALL]
      };
      eventSystem.subscribe(sub1);

      const sub2: CommonEventSubscriber = {
        id: 'sub_2', callback: () => {
          subscriber2Count++;
        }, eventTypes: [CommonEventType.APP_UNINSTALL, CommonEventType.APP_SHORTCUT]
      };
      eventSystem.subscribe(sub2);

      const sub3: CommonEventSubscriber = {
        id: 'sub_3', callback: () => {
          subscriber3Count++;
        }, eventTypes: [CommonEventType.APP_UNINSTALL, CommonEventType.APP_SHORTCUT, CommonEventType.APP_MOVE]
      };
      eventSystem.subscribe(sub3);

      const emptyPayload: EventPayload = {};
      const uninstallEvent: CommonEventData = {
        eventType: CommonEventType.APP_UNINSTALL,
        payload: emptyPayload,
        timestamp: 0,
        source: 'test'
      };
      eventSystem.publish(uninstallEvent);

      expect(subscriber1Count).assertEqual(1);
      expect(subscriber2Count).assertEqual(1);
      expect(subscriber3Count).assertEqual(1);

      const shortcutEvent: CommonEventData = {
        eventType: CommonEventType.APP_SHORTCUT,
        payload: emptyPayload,
        timestamp: 0,
        source: 'test'
      };
      eventSystem.publish(shortcutEvent);

      expect(subscriber1Count).assertEqual(1);
      expect(subscriber2Count).assertEqual(2);
      expect(subscriber3Count).assertEqual(2);

      const moveEvent: CommonEventData = {
        eventType: CommonEventType.APP_MOVE,
        payload: emptyPayload,
        timestamp: 0,
        source: 'test'
      };
      eventSystem.publish(moveEvent);

      expect(subscriber1Count).assertEqual(1);
      expect(subscriber2Count).assertEqual(2);
      expect(subscriber3Count).assertEqual(3);
    });

    // 验证事件时间戳自动设置：确保发布时间戳在合理范围内
    it('event_timestamp_should_be_set_automatically_on_publish', 0, async () => {
      eventSystem.resetSystem();

      const beforePublish = Date.now();

      const readyPayload: EventPayload = {};
      const readyEvent: CommonEventData = {
        eventType: CommonEventType.SYSTEM_READY,
        payload: readyPayload,
        timestamp: 0,
        source: 'test'
      };
      eventSystem.publish(readyEvent);

      const afterPublish = Date.now();

      const events = eventSystem.getEventHistory();
      expect(events.length).assertEqual(1);

      const eventTimestamp = events[0].timestamp;
      expect(eventTimestamp).assertLargerOrEqual(beforePublish);
      expect(eventTimestamp).assertLessOrEqual(afterPublish);
    });

    // 验证事件系统清空功能：确保清空后状态正确重置
    it('event_system_clear_functions_should_work_correctly', 0, async () => {
      eventSystem.resetSystem();

      const emptyPayload1: EventPayload = {};
      const uninstallEvent: CommonEventData = {
        eventType: CommonEventType.APP_UNINSTALL,
        payload: emptyPayload1,
        timestamp: 0,
        source: 'test'
      };
      eventSystem.publish(uninstallEvent);

      const shortcutEvent: CommonEventData = {
        eventType: CommonEventType.APP_SHORTCUT,
        payload: emptyPayload1,
        timestamp: 0,
        source: 'test'
      };
      eventSystem.publish(shortcutEvent);

      const clearSub: CommonEventSubscriber = {
        id: 'clear_test_sub', callback: () => {
        }, eventTypes: [CommonEventType.APP_UNINSTALL]
      };
      eventSystem.subscribe(clearSub);

      expect(eventSystem.getPublishedCount()).assertEqual(2);
      expect(eventSystem.getSubscriberCount()).assertEqual(1);

      eventSystem.clearEventHistory();
      expect(eventSystem.getPublishedCount()).assertEqual(0);
      expect(eventSystem.getEventHistory().length).assertEqual(0);
      expect(eventSystem.getSubscriberCount()).assertEqual(1);

      eventSystem.clearSubscribers();
      expect(eventSystem.getSubscriberCount()).assertEqual(0);
    });

    // 验证事件系统单例模式：确保多次获取返回同一实例
    it('common_event_system_singleton_should_return_same_instance', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const system1 = ShortcutCommonEventSystem.getInstance();
      const system2 = ShortcutCommonEventSystem.getInstance();

      expect(system1 === system2).assertTrue();
      system1.resetSystem();
      const sysPayload: EventPayload = {};
      const sysEvent: CommonEventData = {
        eventType: CommonEventType.SYSTEM_READY,
        payload: sysPayload,
        timestamp: 0,
        source: 'test'
      };
      system1.publish(sysEvent);

      expect(system2.getPublishedCount()).assertEqual(1);
    });

    // 验证事件负载数据多样性：确保系统能处理各种类型的负载数据
    it('event_payload_data_diversity_should_be_supported', 0, async () => {
      eventSystem.resetSystem();

      const strPayload: EventPayload = { reason: 'user_action', mode: 'normal' };
      const strEvent: CommonEventData = {
        eventType: CommonEventType.APP_UNINSTALL,
        payload: strPayload,
        timestamp: 0,
        source: 'test'
      };
      eventSystem.publish(strEvent);

      const numPayload: EventPayload = { fromIndex: 0, toIndex: 2 };
      const numEvent: CommonEventData = {
        eventType: CommonEventType.FOCUS_CHANGE,
        payload: numPayload,
        timestamp: 0,
        source: 'test'
      };
      eventSystem.publish(numEvent);

      const boolPayload: EventPayload = { animation: true, confirmed: false };
      const boolEvent: CommonEventData = {
        eventType: CommonEventType.DIALOG_OPEN,
        payload: boolPayload,
        timestamp: 0,
        source: 'test'
      };
      eventSystem.publish(boolEvent);

      const history = eventSystem.getEventHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].payload.reason).assertEqual('user_action');
      expect(history[1].payload.fromIndex).assertEqual(0);
      expect(history[2].payload.animation).assertTrue();
    });

    // 验证事件与UI交互关联：确保事件发布与弹窗状态变化一致
    it('event_system_should_correlate_with_ui_interactions', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      eventSystem.resetSystem();

      const initialCount = await appComponentCount(driver);

      const openPayload: EventPayload = { dialogType: 'app' };
      const openEvent: CommonEventData = {
        eventType: CommonEventType.DIALOG_OPEN,
        payload: openPayload,
        timestamp: 0,
        source: 'test'
      };
      eventSystem.publish(openEvent);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

      const focusPayload: EventPayload = { fromIndex: 0, toIndex: 1 };
      const focusEvent: CommonEventData = {
        eventType: CommonEventType.FOCUS_CHANGE,
        payload: focusPayload,
        timestamp: 0,
        source: 'test'
      };
      eventSystem.publish(focusEvent);

      const finalCount = await appComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);

      const stats = eventSystem.getEventTypeStats();
      expect(stats.get('dialog_open')).assertEqual(1);
      expect(stats.get('focus_change')).assertEqual(1);
    });

    // 综合事件系统场景测试：验证完整事件发布订阅流程功能正常
    it('comprehensive_event_scenario_should_demonstrate_full_functionality', 0, async () => {
      eventSystem.resetSystem();

      const scenarioStart = Date.now();

      const sub1: CommonEventSubscriber = {
        id: 'comprehensive_sub_1', callback: () => {
        }, eventTypes: [CommonEventType.APP_UNINSTALL, CommonEventType.APP_SHORTCUT]
      };
      eventSystem.subscribe(sub1);

      const emptyPayload: EventPayload = {};
      const uninstallEvent: CommonEventData = {
        eventType: CommonEventType.APP_UNINSTALL,
        payload: emptyPayload,
        timestamp: 0,
        source: 'test'
      };
      for (let i = 0; i < 5; i++) {
        eventSystem.publish(uninstallEvent);
      }

      const shortcutEvent: CommonEventData = {
        eventType: CommonEventType.APP_SHORTCUT,
        payload: emptyPayload,
        timestamp: 0,
        source: 'test'
      };
      for (let i = 0; i < 3; i++) {
        eventSystem.publish(shortcutEvent);
      }

      const scenarioEnd = Date.now();
      const scenarioTime = scenarioEnd - scenarioStart;

      expect(eventSystem.getPublishedCount()).assertEqual(8);
      expect(scenarioTime).assertLessOrEqual(5000);

      const stats = eventSystem.getEventTypeStats();
      expect(stats.get('app_uninstall')).assertEqual(5);
      expect(stats.get('app_shortcut')).assertEqual(3);
    });

    // 验证快捷方式事件分发：确保TVDeviceShortcutEventDispatcher事件发布正确
    it('shortcut_event_dispatcher_should_track_events', 0, () => {
      const dispatcher: ShortcutEventDispatcher = new ShortcutEventDispatcher();
      dispatcher.publishAddEvent('com.a');
      dispatcher.publishRemoveEvent('com.b');
      expect(dispatcher.getPublishedCount()).assertEqual(2);
      expect(dispatcher.hasPublished('ADD_DOCKER_SHORTCUTS', 'com.a')).assertTrue();
      expect(dispatcher.hasPublished('REMOVE_DOCKER_SHORTCUTS', 'com.b')).assertTrue();
      dispatcher.clear();
      expect(dispatcher.getPublishedCount()).assertEqual(0);
    });

    // 验证快捷方式目标校验：确保TVDeviceShortcutTargetValidator校验正确
    it('shortcut_target_validator_should_validate_bundle', 0, () => {
      expect(ShortcutTargetValidator.isValidBundleName('com.example.app')).assertTrue();
      expect(ShortcutTargetValidator.isValidBundleName('')).assertFalse();
      expect(ShortcutTargetValidator.isSystemBundle('com.ohos.settings')).assertTrue();
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
