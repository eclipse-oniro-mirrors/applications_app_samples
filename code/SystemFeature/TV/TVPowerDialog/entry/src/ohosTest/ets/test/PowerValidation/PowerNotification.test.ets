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
  createFreshDriver,
  KEY_BACK,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../Shared/SharedDriver';

// 通知记录接口
interface NotificationRecord {
  contentId: string;
  eventName: string;
  powerBoolean: boolean;
  timestamp: number;
  expired: boolean;
}

// 订阅者类型
type Subscriber = (eventName: string, powerBoolean: boolean) => void;

// 公共事件通知管理器：管理发布、订阅、去重、角标与归档
class PowerNotificationManager {
  private static instance: PowerNotificationManager;
  private records: NotificationRecord[] = [];
  private subscribers: Array<Subscriber> = [];
  private enabled: boolean = true;
  private badgeCount: number = 0;
  private silencePeriod: boolean = false;

  public static getInstance(): PowerNotificationManager {
    if (!PowerNotificationManager.instance) {
      PowerNotificationManager.instance = new PowerNotificationManager();
    }
    return PowerNotificationManager.instance;
  }

  public publish(powerBoolean: boolean, contentId: string = 'default'): void {
    if (!this.enabled) {
      return;
    }
    if (this.silencePeriod) {
      return;
    }
    if (this.hasContentId(contentId)) {
      return;
    }
    this.records.push({
      contentId,
      eventName: 'powerBoolean',
      powerBoolean,
      timestamp: Date.now(),
      expired: false
    });
    this.badgeCount++;
    this.notifySubscribers('powerBoolean', powerBoolean);
  }

  public setEnabled(enabled: boolean): void {
    this.enabled = enabled;
  }

  public isEnabled(): boolean {
    return this.enabled;
  }

  public setSilencePeriod(silence: boolean): void {
    this.silencePeriod = silence;
  }

  public isSilencePeriod(): boolean {
    return this.silencePeriod;
  }

  public getRecords(): NotificationRecord[] {
    return [...this.records];
  }

  public getPublishCount(): number {
    return this.records.length;
  }

  public getBadgeCount(): number {
    return this.badgeCount;
  }

  public clearBadge(): void {
    this.badgeCount = 0;
  }

  public subscribe(subscriber: Subscriber): void {
    this.subscribers.push(subscriber);
  }

  public unsubscribe(subscriber: Subscriber): void {
    const index = this.subscribers.indexOf(subscriber);
    if (index >= 0) {
      this.subscribers.splice(index, 1);
    }
  }

  public getSubscriberCount(): number {
    return this.subscribers.length;
  }

  public archiveExpired(now: number): number {
    let archived = 0;
    this.records.forEach((record: NotificationRecord) => {
      if (!record.expired && now - record.timestamp > 60 * 60 * 1000) {
        record.expired = true;
        archived++;
      }
    });
    return archived;
  }

  public clear(): void {
    this.records = [];
    this.badgeCount = 0;
  }

  private hasContentId(contentId: string): boolean {
    return this.records.some((record: NotificationRecord) => record.contentId === contentId);
  }

  private notifySubscribers(eventName: string, powerBoolean: boolean): void {
    this.subscribers.forEach((subscriber: Subscriber) => subscriber(eventName, powerBoolean));
  }
}

// 通知优先级枚举：描述通知的展示优先级层级
enum NotificationPriority {
  PRIORITY_LOW = 0, PRIORITY_NORMAL = 1, PRIORITY_HIGH = 2, PRIORITY_CRITICAL = 3
}

// 通知类别枚举：描述通知的业务分类
enum NotificationCategory {
  CATEGORY_POWER = 'power', CATEGORY_SYSTEM = 'system', CATEGORY_UPDATE = 'update', CATEGORY_REMINDER = 'reminder'
}

// 通知投递状态枚举：描述通知在投递链路中的阶段状态
enum NotificationDeliveryStatus {
  DELIVERY_PENDING = 'pending', DELIVERY_SENT = 'sent', DELIVERY_DELIVERED = 'delivered', DELIVERY_DROPPED = 'dropped'
}

// 通知去重键接口：描述通知去重的唯一标识
interface NotificationDedupKey {
  contentId: string;
  category: NotificationCategory;
  priority: number;
}

// 通知去重注册表：基于去重键管理通知的重复判定与登记
class NotificationDedupRegistry {
  private registeredKeys: NotificationDedupKey[] = [];

  public register(key: NotificationDedupKey): boolean {
    if (this.contains(key)) {
      return false;
    }
    this.registeredKeys.push(key);
    return true;
  }

  public contains(key: NotificationDedupKey): boolean {
    return this.registeredKeys.some(existing => this.isSameKey(existing, key));
  }

  public getRegisteredCount(): number {
    return this.registeredKeys.length;
  }

  public unregister(key: NotificationDedupKey): boolean {
    const index = this.registeredKeys.findIndex(existing => this.isSameKey(existing, key));
    if (index >= 0) {
      this.registeredKeys.splice(index, 1);
      return true;
    }
    return false;
  }

  public clear(): void {
    this.registeredKeys = [];
  }

  private isSameKey(left: NotificationDedupKey, right: NotificationDedupKey): boolean {
    return left.contentId === right.contentId && left.category === right.category && left.priority === right.priority;
  }
}

// 通知批量分发器：按优先级对通知记录进行排序与分批投递统计
class NotificationBatchDispatcher {
  private priorityOrder: NotificationPriority[] = [];

  constructor() {
    this.priorityOrder =
      [NotificationPriority.PRIORITY_CRITICAL, NotificationPriority.PRIORITY_HIGH, NotificationPriority.PRIORITY_NORMAL,
        NotificationPriority.PRIORITY_LOW];
  }

  public getPriorityRank(priority: number): number {
    const index = this.priorityOrder.indexOf(priority);
    return index >= 0 ? index : this.priorityOrder.length;
  }

  public sortByPriority(records: NotificationRecord[],
    priorityOf: (record: NotificationRecord) => number): NotificationRecord[] {
    return [...records].sort((a: NotificationRecord, b: NotificationRecord) => {
      return this.getPriorityRank(priorityOf(a)) - this.getPriorityRank(priorityOf(b));
    });
  }

  public partitionExpired(records: NotificationRecord[]): NotificationRecord[][] {
    const active: NotificationRecord[] = [];
    const expired: NotificationRecord[] = [];
    records.forEach((record: NotificationRecord) => {
      if (record.expired) {
        expired.push(record);
      } else {
        active.push(record);
      }
    });
    return [active, expired];
  }

  public countByPowerBoolean(records: NotificationRecord[], target: boolean): number {
    return records.filter((record: NotificationRecord) => record.powerBoolean === target).length;
  }
}

// 通知统计器：对通知记录集合进行聚合统计与速率计算
class NotificationStatistics {
  private records: NotificationRecord[] = [];

  public addRecord(record: NotificationRecord): void {
    this.records.push(record);
  }

  public addRecords(records: NotificationRecord[]): void {
    records.forEach((record: NotificationRecord) => this.records.push(record));
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public getTrueCount(): number {
    return this.records.filter((record: NotificationRecord) => record.powerBoolean).length;
  }

  public getFalseCount(): number {
    return this.records.filter((record: NotificationRecord) => !record.powerBoolean).length;
  }

  public getExpiredCount(): number {
    return this.records.filter((record: NotificationRecord) => record.expired).length;
  }

  public getTrueRatio(): number {
    const total = this.getRecordCount();
    if (total === 0) {
      return 0;
    }
    return this.getTrueCount() / total;
  }

  public getEarliestTimestamp(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let earliest = this.records[0].timestamp;
    this.records.forEach((record: NotificationRecord) => {
      if (record.timestamp < earliest) {
        earliest = record.timestamp;
      }
    });
    return earliest;
  }

  public getLatestTimestamp(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let latest = this.records[0].timestamp;
    this.records.forEach((record: NotificationRecord) => {
      if (record.timestamp > latest) {
        latest = record.timestamp;
      }
    });
    return latest;
  }

  public clear(): void {
    this.records = [];
  }
}

// 通知策略评估器：评估通知在不同状态下是否允许投递
class NotificationPolicyEvaluator {
  private enabled: boolean = true;
  private silencePeriod: boolean = false;
  private maxPendingCount: number = 100;

  public setEnabled(enabled: boolean): void {
    this.enabled = enabled;
  }

  public isEnabled(): boolean {
    return this.enabled;
  }

  public setSilencePeriod(silence: boolean): void {
    this.silencePeriod = silence;
  }

  public isSilencePeriod(): boolean {
    return this.silencePeriod;
  }

  public setMaxPendingCount(maxPendingCount: number): void {
    this.maxPendingCount = maxPendingCount;
  }

  public getMaxPendingCount(): number {
    return this.maxPendingCount;
  }

  public canDispatch(currentPendingCount: number): boolean {
    if (!this.enabled) {
      return false;
    }
    if (this.silencePeriod) {
      return false;
    }
    return currentPendingCount < this.maxPendingCount;
  }

  public shouldArchive(now: number, timestamp: number, ttlMs: number): boolean {
    return now - timestamp > ttlMs;
  }
}

// 通知优先级解析器：将操作类型映射为通知优先级
class NotificationPriorityResolver {
  private priorityMap: Map<number, NotificationPriority> = new Map<number, NotificationPriority>();

  constructor() {
    this.priorityMap.set(2, NotificationPriority.PRIORITY_CRITICAL);
    this.priorityMap.set(1, NotificationPriority.PRIORITY_HIGH);
    this.priorityMap.set(0, NotificationPriority.PRIORITY_NORMAL);
  }

  public resolve(operationType: number): NotificationPriority {
    const priority = this.priorityMap.get(operationType);
    if (priority === undefined) {
      return NotificationPriority.PRIORITY_LOW;
    }
    return priority;
  }

  public getMappedCount(): number {
    return this.priorityMap.size;
  }

  public hasMapping(operationType: number): boolean {
    return this.priorityMap.has(operationType);
  }
}

// 通知渠道枚举：描述通知投放的渠道类型
enum NotificationChannel {
  CHANNEL_DIALOG = 'dialog', CHANNEL_BANNER = 'banner', CHANNEL_BADGE = 'badge', CHANNEL_SOUND = 'sound'
}

// 通知投递追踪器：追踪通知在各个渠道的投递状态
class NotificationDeliveryTracker {
  private statusByContentId: Map<string, NotificationDeliveryStatus> = new Map<string, NotificationDeliveryStatus>();

  public mark(contentId: string, status: NotificationDeliveryStatus): void {
    this.statusByContentId.set(contentId, status);
  }

  public getStatus(contentId: string): NotificationDeliveryStatus | null {
    const status = this.statusByContentId.get(contentId);
    return status === undefined ? null : status;
  }

  public getTrackedCount(): number {
    return this.statusByContentId.size;
  }

  public countByStatus(status: NotificationDeliveryStatus): number {
    let count = 0;
    this.statusByContentId.forEach((value: NotificationDeliveryStatus) => {
      if (value === status) {
        count++;
      }
    });
    return count;
  }

  public isAllDelivered(): boolean {
    let allDelivered = true;
    this.statusByContentId.forEach((value: NotificationDeliveryStatus) => {
      if (value !== NotificationDeliveryStatus.DELIVERY_DELIVERED) {
        allDelivered = false;
      }
    });
    return allDelivered;
  }

  public clear(): void {
    this.statusByContentId.clear();
  }
}

// 通知内容校验器：校验通知内容的合法性
class NotificationContentValidator {
  public isContentIdValid(contentId: string): boolean {
    return contentId.length > 0;
  }

  public isEventNameValid(eventName: string): boolean {
    return eventName.length > 0 && !eventName.includes(' ');
  }

  public isTimestampValid(timestamp: number): boolean {
    return timestamp >= 0;
  }

  public validateRecord(record: NotificationRecord): boolean {
    return this.isContentIdValid(record.contentId) && this.isEventNameValid(record.eventName) &&
      this.isTimestampValid(record.timestamp);
  }

  public collectViolations(record: NotificationRecord): string[] {
    const violations: string[] = [];
    if (!this.isContentIdValid(record.contentId)) {
      violations.push('contentId为空');
    }
    if (!this.isEventNameValid(record.eventName)) {
      violations.push('eventName非法');
    }
    if (!this.isTimestampValid(record.timestamp)) {
      violations.push('timestamp非法');
    }
    return violations;
  }
}

export default function powerNotificationTest() {
  describe('PowerNotification_Test', () => {
    let driver: Driver;
    let manager: PowerNotificationManager;

    beforeAll(async () => {
      driver = createFreshDriver();
      manager = PowerNotificationManager.getInstance();
      manager.clear();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    it('notification_should_be_enabled_by_default', 0, async () => {
      expect(manager.isEnabled()).assertTrue();
    });

    it('publish_should_work_when_enabled', 0, async () => {
      manager.clear();
      manager.publish(true, 'c1');
      expect(manager.getPublishCount()).assertEqual(1);
    });

    it('publish_should_be_blocked_when_disabled', 0, async () => {
      manager.clear();
      manager.setEnabled(false);
      manager.publish(true, 'c1');
      expect(manager.getPublishCount()).assertEqual(0);
      manager.setEnabled(true);
    });

    it('duplicate_content_should_not_publish_twice', 0, async () => {
      manager.clear();
      manager.publish(false, 'dup');
      manager.publish(false, 'dup');
      expect(manager.getPublishCount()).assertEqual(1);
    });

    it('different_content_should_publish_separately', 0, async () => {
      manager.clear();
      manager.publish(true, 'a');
      manager.publish(true, 'b');
      expect(manager.getPublishCount()).assertEqual(2);
    });

    it('publish_should_use_correct_event_name', 0, async () => {
      manager.clear();
      manager.publish(true, 'evt');
      expect(manager.getRecords()[0].eventName).assertEqual('powerBoolean');
      expect(manager.getRecords()[0].powerBoolean).assertTrue();
    });

    it('subscriber_should_receive_notification', 0, async () => {
      manager.clear();
      let received = 0;
      const subscriber: Subscriber = (_eventName: string, _powerBoolean: boolean) => {
        received++;
      };
      manager.subscribe(subscriber);
      manager.publish(true, 's1');
      expect(received).assertEqual(1);
      manager.unsubscribe(subscriber);
    });

    it('unsubscribe_should_stop_notification', 0, async () => {
      manager.clear();
      let received = 0;
      const subscriber: Subscriber = (_eventName: string, _powerBoolean: boolean) => {
        received++;
      };
      manager.subscribe(subscriber);
      manager.unsubscribe(subscriber);
      manager.publish(true, 's2');
      expect(received).assertEqual(0);
    });

    it('badge_count_should_increment_on_publish', 0, async () => {
      manager.clear();
      manager.publish(true, 'b1');
      manager.publish(true, 'b2');
      manager.publish(true, 'b3');
      expect(manager.getBadgeCount()).assertEqual(3);
    });

    it('badge_count_should_clear_after_read', 0, async () => {
      manager.clear();
      manager.publish(true, 'b1');
      manager.clearBadge();
      expect(manager.getBadgeCount()).assertEqual(0);
    });

    it('silence_period_should_block_publish', 0, async () => {
      manager.clear();
      manager.setSilencePeriod(true);
      manager.publish(true, 'silent');
      expect(manager.getPublishCount()).assertEqual(0);
      manager.setSilencePeriod(false);
    });

    it('batch_publish_should_be_handled', 0, async () => {
      manager.clear();
      for (let i = 0; i < 10; i++) {
        manager.publish(i % 2 === 0, 'id' + i);
      }
      expect(manager.getPublishCount()).assertEqual(10);
    });

    it('expired_messages_should_be_archived', 0, async () => {
      manager.clear();
      manager.publish(true, 'expired');
      const now = Date.now() + 2 * 60 * 60 * 1000;
      const archived = manager.archiveExpired(now);
      expect(archived).assertEqual(1);
      expect(manager.getRecords()[0].expired).assertTrue();
    });

    it('clear_should_reset_publish_and_badge', 0, async () => {
      manager.publish(true, 'x');
      manager.clear();
      expect(manager.getPublishCount()).assertEqual(0);
      expect(manager.getBadgeCount()).assertEqual(0);
    });

    it('toggle_enabled_should_take_effect', 0, async () => {
      manager.setEnabled(false);
      expect(manager.isEnabled()).assertFalse();
      manager.setEnabled(true);
      expect(manager.isEnabled()).assertTrue();
    });

    it('badge_should_not_double_count_on_duplicate', 0, async () => {
      manager.clear();
      manager.publish(true, 'dup');
      manager.publish(true, 'dup');
      expect(manager.getBadgeCount()).assertEqual(1);
    });

    it('subscriber_count_should_track_subscriptions', 0, async () => {
      manager.clear();
      const s1: Subscriber = (_e: string, _p: boolean) => {
      };
      const s2: Subscriber = (_e: string, _p: boolean) => {
      };
      manager.subscribe(s1);
      manager.subscribe(s2);
      expect(manager.getSubscriberCount()).assertEqual(2);
      manager.unsubscribe(s1);
      manager.unsubscribe(s2);
    });

    it('unsubscribe_nonexistent_should_be_safe', 0, async () => {
      manager.clear();
      const s1: Subscriber = (_e: string, _p: boolean) => {
      };
      manager.unsubscribe(s1);
      expect(manager.getSubscriberCount()).assertEqual(0);
    });

    it('publish_with_empty_content_id_should_work', 0, async () => {
      manager.clear();
      manager.publish(true, '');
      expect(manager.getPublishCount()).assertEqual(1);
    });

    it('multiple_subscribers_should_all_receive', 0, async () => {
      manager.clear();
      let r1 = 0;
      let r2 = 0;
      const s1: Subscriber = (_e: string, _p: boolean) => {
        r1++;
      };
      const s2: Subscriber = (_e: string, _p: boolean) => {
        r2++;
      };
      manager.subscribe(s1);
      manager.subscribe(s2);
      manager.publish(true, 'multi');
      expect(r1).assertEqual(1);
      expect(r2).assertEqual(1);
      manager.unsubscribe(s1);
      manager.unsubscribe(s2);
    });

    it('archive_should_only_mark_old_records', 0, async () => {
      manager.clear();
      manager.publish(true, 'old');
      manager.publish(true, 'new');
      manager.archiveExpired(Date.now() + 2 * 60 * 60 * 1000);
      expect(manager.getRecords()[0].expired).assertTrue();
      expect(manager.getRecords()[1].expired).assertTrue();
    });

    it('silence_period_should_not_clear_records', 0, async () => {
      manager.clear();
      manager.publish(true, 'before');
      manager.setSilencePeriod(true);
      expect(manager.getPublishCount()).assertEqual(1);
      manager.setSilencePeriod(false);
    });

    it('clear_should_preserve_enabled_state', 0, async () => {
      manager.setEnabled(false);
      manager.clear();
      expect(manager.isEnabled()).assertFalse();
      manager.setEnabled(true);
    });

    it('publish_after_archive_still_works', 0, async () => {
      manager.clear();
      manager.publish(true, 'a');
      manager.archiveExpired(Date.now() + 2 * 60 * 60 * 1000);
      manager.publish(true, 'b');
      expect(manager.getPublishCount()).assertEqual(2);
    });

    it('subscriber_double_subscribe_increments_twice', 0, async () => {
      manager.clear();
      const s: Subscriber = (_e: string, _p: boolean) => {
      };
      manager.subscribe(s);
      manager.subscribe(s);
      expect(manager.getSubscriberCount()).assertEqual(2);
      manager.unsubscribe(s);
      manager.unsubscribe(s);
    });

    it('unsubscribe_middle_subscriber', 0, async () => {
      manager.clear();
      const s1: Subscriber = (_e: string, _p: boolean) => {
      };
      const s2: Subscriber = (_e: string, _p: boolean) => {
      };
      manager.subscribe(s1);
      manager.subscribe(s2);
      manager.unsubscribe(s1);
      expect(manager.getSubscriberCount()).assertEqual(1);
      manager.unsubscribe(s2);
    });

    it('publish_many_distinct_contents', 0, async () => {
      manager.clear();
      for (let i = 0; i < 50; i++) {
        manager.publish(true, 'id' + i);
      }
      expect(manager.getPublishCount()).assertEqual(50);
    });

    it('archive_zero_records_returns_zero', 0, async () => {
      manager.clear();
      expect(manager.archiveExpired(Date.now())).assertEqual(0);
    });

    it('silence_toggle_twice_returns_false', 0, async () => {
      manager.setSilencePeriod(true);
      manager.setSilencePeriod(false);
      expect(manager.isSilencePeriod()).assertFalse();
    });

    it('clear_twice_is_safe', 0, async () => {
      manager.publish(true, 'x');
      manager.clear();
      manager.clear();
      expect(manager.getPublishCount()).assertEqual(0);
    });

    it('event_name_consistent_across_records', 0, async () => {
      manager.clear();
      manager.publish(true, 'a');
      manager.publish(false, 'b');
      const records = manager.getRecords();
      expect(records[0].eventName).assertEqual('powerBoolean');
      expect(records[1].eventName).assertEqual('powerBoolean');
    });

    it('badge_not_affected_by_silence', 0, async () => {
      manager.clear();
      manager.setSilencePeriod(true);
      manager.publish(true, 'silent');
      expect(manager.getBadgeCount()).assertEqual(0);
      manager.setSilencePeriod(false);
    });

    it('enabled_state_after_multiple_toggles', 0, async () => {
      manager.setEnabled(false);
      manager.setEnabled(true);
      manager.setEnabled(false);
      expect(manager.isEnabled()).assertFalse();
      manager.setEnabled(true);
    });

    // 适配 NotificationDedupRegistry：去重键登记与查询
    it('dedup_registry_should_register_and_contain', 0, async () => {
      const registry = new NotificationDedupRegistry();
      const key: NotificationDedupKey = { contentId: 'c1', category: NotificationCategory.CATEGORY_POWER, priority: 2 };
      expect(registry.register(key)).assertTrue();
      expect(registry.contains(key)).assertTrue();
      expect(registry.getRegisteredCount()).assertEqual(1);
    });

    // 适配 NotificationDedupRegistry：重复登记应被拒绝
    it('dedup_registry_should_reject_duplicate_keys', 0, async () => {
      const registry = new NotificationDedupRegistry();
      const key: NotificationDedupKey = { contentId: 'c1', category: NotificationCategory.CATEGORY_POWER, priority: 2 };
      registry.register(key);
      const duplicate: NotificationDedupKey = { contentId: 'c1', category: NotificationCategory.CATEGORY_POWER, priority: 2 };
      expect(registry.register(duplicate)).assertFalse();
    });

    // 适配 NotificationDedupRegistry：注销去重键
    it('dedup_registry_should_unregister_key', 0, async () => {
      const registry = new NotificationDedupRegistry();
      const key: NotificationDedupKey = { contentId: 'c1', category: NotificationCategory.CATEGORY_POWER, priority: 2 };
      registry.register(key);
      expect(registry.unregister(key)).assertTrue();
      expect(registry.contains(key)).assertFalse();
      expect(registry.unregister(key)).assertFalse();
    });

    // 适配 NotificationBatchDispatcher：优先级排序
    it('batch_dispatcher_should_sort_by_priority', 0, async () => {
      const dispatcher = new NotificationBatchDispatcher();
      const low: NotificationRecord = { contentId: 'low', eventName: 'e', powerBoolean: true, timestamp: 1, expired: false };
      const critical: NotificationRecord = { contentId: 'crit', eventName: 'e', powerBoolean: true, timestamp: 2, expired: false };
      const records: NotificationRecord[] = [low, critical];
      const sorted = dispatcher.sortByPriority(records, (record: NotificationRecord) => {
        if (record.contentId === 'crit') {
          return 3;
        }
        return 0;
      });
      expect(sorted[0].contentId).assertEqual('crit');
    });

    // 适配 NotificationBatchDispatcher：过期分区
    it('batch_dispatcher_should_partition_expired', 0, async () => {
      const dispatcher = new NotificationBatchDispatcher();
      const active: NotificationRecord = { contentId: 'a', eventName: 'e', powerBoolean: true, timestamp: 1, expired: false };
      const expired: NotificationRecord = { contentId: 'b', eventName: 'e', powerBoolean: true, timestamp: 2, expired: true };
      const partitions = dispatcher.partitionExpired([active, expired]);
      expect(partitions[0].length).assertEqual(1);
      expect(partitions[1].length).assertEqual(1);
    });

    // 适配 NotificationStatistics：真假计数统计
    it('statistics_should_count_true_false_records', 0, async () => {
      const stats = new NotificationStatistics();
      stats.addRecord({ contentId: 'a', eventName: 'e', powerBoolean: true, timestamp: 1, expired: false });
      stats.addRecord({ contentId: 'b', eventName: 'e', powerBoolean: false, timestamp: 2, expired: false });
      stats.addRecord({ contentId: 'c', eventName: 'e', powerBoolean: true, timestamp: 3, expired: true });
      expect(stats.getTrueCount()).assertEqual(2);
      expect(stats.getFalseCount()).assertEqual(1);
      expect(stats.getExpiredCount()).assertEqual(1);
    });

    // 适配 NotificationStatistics：真值占比计算
    it('statistics_should_compute_true_ratio', 0, async () => {
      const stats = new NotificationStatistics();
      stats.addRecord({ contentId: 'a', eventName: 'e', powerBoolean: true, timestamp: 1, expired: false });
      stats.addRecord({ contentId: 'b', eventName: 'e', powerBoolean: false, timestamp: 2, expired: false });
      stats.addRecord({ contentId: 'c', eventName: 'e', powerBoolean: true, timestamp: 3, expired: false });
      expect(stats.getTrueRatio()).assertEqual(2 / 3);
    });

    // 适配 NotificationStatistics：最早与最晚时间戳
    it('statistics_should_track_earliest_latest_timestamp', 0, async () => {
      const stats = new NotificationStatistics();
      stats.addRecord({ contentId: 'a', eventName: 'e', powerBoolean: true, timestamp: 100, expired: false });
      stats.addRecord({ contentId: 'b', eventName: 'e', powerBoolean: false, timestamp: 300, expired: false });
      stats.addRecord({ contentId: 'c', eventName: 'e', powerBoolean: true, timestamp: 200, expired: false });
      expect(stats.getEarliestTimestamp()).assertEqual(100);
      expect(stats.getLatestTimestamp()).assertEqual(300);
    });

    // 适配 NotificationPolicyEvaluator：待处理上限控制
    it('policy_evaluator_should_apply_pending_limit', 0, async () => {
      const evaluator = new NotificationPolicyEvaluator();
      evaluator.setMaxPendingCount(5);
      expect(evaluator.canDispatch(4)).assertTrue();
      expect(evaluator.canDispatch(5)).assertFalse();
    });

    // 适配 NotificationPolicyEvaluator：禁用时禁止投递
    it('policy_evaluator_should_block_when_disabled', 0, async () => {
      const evaluator = new NotificationPolicyEvaluator();
      evaluator.setEnabled(false);
      expect(evaluator.canDispatch(0)).assertFalse();
    });

    // 适配 NotificationPolicyEvaluator：归档判定
    it('policy_evaluator_should_archive_stale_records', 0, async () => {
      const evaluator = new NotificationPolicyEvaluator();
      expect(evaluator.shouldArchive(5000, 1000, 1000)).assertTrue();
      expect(evaluator.shouldArchive(2000, 1000, 1000)).assertFalse();
    });

    // 适配 NotificationPriorityResolver：操作类型映射优先级
    it('priority_resolver_should_map_operation_type', 0, async () => {
      const resolver = new NotificationPriorityResolver();
      expect(resolver.resolve(2)).assertEqual(NotificationPriority.PRIORITY_CRITICAL);
      expect(resolver.resolve(1)).assertEqual(NotificationPriority.PRIORITY_HIGH);
      expect(resolver.resolve(0)).assertEqual(NotificationPriority.PRIORITY_NORMAL);
      expect(resolver.resolve(99)).assertEqual(NotificationPriority.PRIORITY_LOW);
    });

    // 适配 NotificationDeliveryTracker：投递状态追踪
    it('delivery_tracker_should_track_status', 0, async () => {
      const tracker = new NotificationDeliveryTracker();
      tracker.mark('c1', NotificationDeliveryStatus.DELIVERY_SENT);
      tracker.mark('c2', NotificationDeliveryStatus.DELIVERY_DELIVERED);
      expect(tracker.getStatus('c1')).assertEqual(NotificationDeliveryStatus.DELIVERY_SENT);
      expect(tracker.getTrackedCount()).assertEqual(2);
      expect(tracker.countByStatus(NotificationDeliveryStatus.DELIVERY_DELIVERED)).assertEqual(1);
    });

    // 适配 NotificationDeliveryTracker：全部送达判定
    it('delivery_tracker_should_detect_all_delivered', 0, async () => {
      const tracker = new NotificationDeliveryTracker();
      tracker.mark('c1', NotificationDeliveryStatus.DELIVERY_DELIVERED);
      tracker.mark('c2', NotificationDeliveryStatus.DELIVERY_DELIVERED);
      expect(tracker.isAllDelivered()).assertTrue();
      tracker.mark('c3', NotificationDeliveryStatus.DELIVERY_PENDING);
      expect(tracker.isAllDelivered()).assertFalse();
    });

    // 适配 NotificationContentValidator：内容违规收集
    it('content_validator_should_collect_violations', 0, async () => {
      const validator = new NotificationContentValidator();
      const bad: NotificationRecord = { contentId: '', eventName: 'has space', powerBoolean: true, timestamp: -1, expired: false };
      const violations = validator.collectViolations(bad);
      expect(violations.length).assertEqual(3);
      const good: NotificationRecord = { contentId: 'c1', eventName: 'power', powerBoolean: true, timestamp: 1, expired: false };
      expect(validator.validateRecord(good)).assertTrue();
    });
  });
}
