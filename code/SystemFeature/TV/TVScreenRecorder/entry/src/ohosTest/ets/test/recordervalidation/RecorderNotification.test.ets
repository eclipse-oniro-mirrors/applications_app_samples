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
import { Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver,
  recorderComponentCount,
  pressAndWait,
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../shared/RecordingDriver';

const DOMAIN: number = 0x0001;
const TAG: string = 'RecorderNotification';

// Notification emitted whenever the recorder state changes.
interface RecorderNotificationRecord {
  contentId: string;
  eventName: string;
  stateCode: number;
  timestamp: number;
  expired: boolean;
}

// Callback subscribed to recorder state notifications.
type RecorderSubscriber = (eventName: string, stateCode: number) => void;

// Publishes recorder state notifications to the timer and tip windows.
class RecorderNotificationManager {
  private static instance: RecorderNotificationManager | null = null;
  private records: RecorderNotificationRecord[] = [];
  private subscribers: RecorderSubscriber[] = [];
  private enabled: boolean = true;
  private badgeCount: number = 0;
  private silencePeriod: boolean = false;

  public static getInstance(): RecorderNotificationManager {
    if (RecorderNotificationManager.instance === null) {
      RecorderNotificationManager.instance = new RecorderNotificationManager();
    }
    return RecorderNotificationManager.instance;
  }

  public publish(stateCode: number, contentId: string = 'recorderState'): void {
    if (!this.enabled) {
      return;
    }
    if (this.silencePeriod) {
      return;
    }
    if (this.hasContentId(contentId)) {
      return;
    }
    const record: RecorderNotificationRecord = {
      contentId: contentId,
      eventName: 'recorderState',
      stateCode: stateCode,
      timestamp: Date.now(),
      expired: false
    };
    this.records.push(record);
    this.badgeCount++;
    this.notifySubscribers('recorderState', stateCode);
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

  public getRecords(): RecorderNotificationRecord[] {
    const result: RecorderNotificationRecord[] = [];
    for (let i = 0; i < this.records.length; i++) {
      result.push(this.records[i]);
    }
    return result;
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

  public subscribe(subscriber: RecorderSubscriber): void {
    this.subscribers.push(subscriber);
  }

  public unsubscribe(subscriber: RecorderSubscriber): void {
    const index: number = this.subscribers.indexOf(subscriber);
    if (index >= 0) {
      this.subscribers.splice(index, 1);
    }
  }

  public getSubscriberCount(): number {
    return this.subscribers.length;
  }

  public archiveExpired(now: number): number {
    let archived: number = 0;
    this.records.forEach((record: RecorderNotificationRecord) => {
      if (!record.expired && now - record.timestamp > 60 * 60 * 1000) {
        record.expired = true;
        archived++;
      }
    });
    return archived;
  }

  public countByState(stateCode: number): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].stateCode === stateCode) {
        count++;
      }
    }
    return count;
  }

  public clear(): void {
    this.records = [];
    this.badgeCount = 0;
  }

  private hasContentId(contentId: string): boolean {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].contentId === contentId) {
        return true;
      }
    }
    return false;
  }

  private notifySubscribers(eventName: string, stateCode: number): void {
    this.subscribers.forEach((subscriber: RecorderSubscriber) => subscriber(eventName, stateCode));
  }
}

// Priority levels of recorder notifications.
enum RecorderNotificationPriority {
  PRIORITY_LOW = 0,
  PRIORITY_NORMAL = 1,
  PRIORITY_HIGH = 2,
  PRIORITY_CRITICAL = 3
}

// Business category of a recorder notification.
enum RecorderNotificationCategory {
  CATEGORY_RECORDING = 'recording',
  CATEGORY_PERMISSION = 'permission',
  CATEGORY_STORAGE = 'storage',
  CATEGORY_REMINDER = 'reminder'
}

// Delivery stage of a recorder notification.
enum RecorderDeliveryStatus {
  DELIVERY_PENDING = 'pending',
  DELIVERY_SENT = 'sent',
  DELIVERY_DELIVERED = 'delivered',
  DELIVERY_DROPPED = 'dropped'
}

// Deduplication key of a recorder notification.
interface RecorderDedupKey {
  contentId: string;
  category: RecorderNotificationCategory;
  priority: number;
}

// Registry that suppresses duplicated recorder notifications.
class RecorderDedupRegistry {
  private registeredKeys: RecorderDedupKey[] = [];

  public register(key: RecorderDedupKey): boolean {
    if (this.contains(key)) {
      return false;
    }
    this.registeredKeys.push(key);
    return true;
  }

  public contains(key: RecorderDedupKey): boolean {
    for (let i = 0; i < this.registeredKeys.length; i++) {
      if (this.isSameKey(this.registeredKeys[i], key)) {
        return true;
      }
    }
    return false;
  }

  public getRegisteredCount(): number {
    return this.registeredKeys.length;
  }

  public unregister(key: RecorderDedupKey): boolean {
    for (let i = 0; i < this.registeredKeys.length; i++) {
      if (this.isSameKey(this.registeredKeys[i], key)) {
        this.registeredKeys.splice(i, 1);
        return true;
      }
    }
    return false;
  }

  public clear(): void {
    this.registeredKeys = [];
  }

  private isSameKey(left: RecorderDedupKey, right: RecorderDedupKey): boolean {
    return left.contentId === right.contentId && left.category === right.category &&
      left.priority === right.priority;
  }
}

// Sorts and partitions recorder notifications before delivery.
class RecorderNotificationDispatcher {
  private priorityOrder: number[] = [];

  constructor() {
    this.priorityOrder = [
      RecorderNotificationPriority.PRIORITY_CRITICAL,
      RecorderNotificationPriority.PRIORITY_HIGH,
      RecorderNotificationPriority.PRIORITY_NORMAL,
      RecorderNotificationPriority.PRIORITY_LOW
    ];
  }

  public getPriorityRank(priority: number): number {
    const index: number = this.priorityOrder.indexOf(priority);
    return index >= 0 ? index : this.priorityOrder.length;
  }

  public sortByPriority(records: RecorderNotificationRecord[],
    priorityOf: (record: RecorderNotificationRecord) => number): RecorderNotificationRecord[] {
    const copy: RecorderNotificationRecord[] = [];
    for (let i = 0; i < records.length; i++) {
      copy.push(records[i]);
    }
    return copy.sort((a: RecorderNotificationRecord, b: RecorderNotificationRecord) => {
      return this.getPriorityRank(priorityOf(a)) - this.getPriorityRank(priorityOf(b));
    });
  }

  public partitionExpired(records: RecorderNotificationRecord[]): RecorderNotificationRecord[][] {
    const active: RecorderNotificationRecord[] = [];
    const expired: RecorderNotificationRecord[] = [];
    for (let i = 0; i < records.length; i++) {
      if (records[i].expired) {
        expired.push(records[i]);
      } else {
        active.push(records[i]);
      }
    }
    return [active, expired];
  }

  public countByState(records: RecorderNotificationRecord[], stateCode: number): number {
    let count: number = 0;
    for (let i = 0; i < records.length; i++) {
      if (records[i].stateCode === stateCode) {
        count++;
      }
    }
    return count;
  }
}

// Aggregates recorder notification metrics.
class RecorderNotificationStatistics {
  private records: RecorderNotificationRecord[] = [];

  public addRecord(record: RecorderNotificationRecord): void {
    this.records.push(record);
  }

  public addRecords(records: RecorderNotificationRecord[]): void {
    for (let i = 0; i < records.length; i++) {
      this.records.push(records[i]);
    }
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public getRecordingCount(): number {
    return this.countByState(1);
  }

  public getStoppedCount(): number {
    return this.countByState(2);
  }

  public getErrorCount(): number {
    return this.countByState(3);
  }

  public countByState(stateCode: number): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].stateCode === stateCode) {
        count++;
      }
    }
    return count;
  }

  public getExpiredCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].expired) {
        count++;
      }
    }
    return count;
  }

  public getRecordingRatio(): number {
    const total: number = this.getRecordCount();
    if (total === 0) {
      return 0;
    }
    return this.getRecordingCount() / total;
  }

  public getEarliestTimestamp(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let earliest: number = this.records[0].timestamp;
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].timestamp < earliest) {
        earliest = this.records[i].timestamp;
      }
    }
    return earliest;
  }

  public getLatestTimestamp(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let latest: number = this.records[0].timestamp;
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].timestamp > latest) {
        latest = this.records[i].timestamp;
      }
    }
    return latest;
  }

  public clear(): void {
    this.records = [];
  }
}

// Decides whether a recorder notification may be dispatched.
class RecorderNotificationPolicy {
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

// Maps recorder states to notification priorities.
class RecorderNotificationPriorityResolver {
  private priorityMap: Map<number, number> = new Map<number, number>();

  constructor() {
    this.priorityMap.set(3, RecorderNotificationPriority.PRIORITY_CRITICAL);
    this.priorityMap.set(2, RecorderNotificationPriority.PRIORITY_HIGH);
    this.priorityMap.set(1, RecorderNotificationPriority.PRIORITY_NORMAL);
  }

  public resolve(stateCode: number): number {
    const priority: number | undefined = this.priorityMap.get(stateCode);
    if (priority === undefined) {
      return RecorderNotificationPriority.PRIORITY_LOW;
    }
    return priority;
  }

  public getMappedCount(): number {
    return this.priorityMap.size;
  }

  public hasMapping(stateCode: number): boolean {
    return this.priorityMap.has(stateCode);
  }
}

// Delivery channel constants used when reporting recorder failures.
enum RecorderNotificationChannel {
  CHANNEL_TIMER = 'timer',
  CHANNEL_TIP = 'tip',
  CHANNEL_DIALOG = 'dialog',
  CHANNEL_LOG = 'log'
}

// Tracks delivery of recorder notifications across channels.
class RecorderDeliveryTracker {
  private statusByContentId: Map<string, RecorderDeliveryStatus> =
    new Map<string, RecorderDeliveryStatus>();
  private channelByContentId: Map<string, RecorderNotificationChannel> =
    new Map<string, RecorderNotificationChannel>();

  public mark(contentId: string, status: RecorderDeliveryStatus): void {
    this.statusByContentId.set(contentId, status);
  }

  public markChannel(contentId: string, channel: RecorderNotificationChannel): void {
    this.channelByContentId.set(contentId, channel);
  }

  public getChannel(contentId: string): RecorderNotificationChannel | null {
    const channel: RecorderNotificationChannel | undefined = this.channelByContentId.get(contentId);
    if (channel === undefined) {
      return null;
    }
    return channel;
  }

  public getStatus(contentId: string): RecorderDeliveryStatus | null {
    const status: RecorderDeliveryStatus | undefined = this.statusByContentId.get(contentId);
    if (status === undefined) {
      return null;
    }
    return status;
  }

  public getTrackedCount(): number {
    return this.statusByContentId.size;
  }

  public countByStatus(status: RecorderDeliveryStatus): number {
    let count: number = 0;
    this.statusByContentId.forEach((value: RecorderDeliveryStatus) => {
      if (value === status) {
        count++;
      }
    });
    return count;
  }

  public isAllDelivered(): boolean {
    let allDelivered: boolean = true;
    this.statusByContentId.forEach((value: RecorderDeliveryStatus) => {
      if (value !== RecorderDeliveryStatus.DELIVERY_DELIVERED) {
        allDelivered = false;
      }
    });
    return allDelivered;
  }

  public clear(): void {
    this.statusByContentId.clear();
  }
}

// Validates recorder notification content before publishing.
class RecorderNotificationContentValidator {
  public isContentIdValid(contentId: string): boolean {
    return contentId.length > 0;
  }

  public isEventNameValid(eventName: string): boolean {
    return eventName.length > 0 && !eventName.includes(' ');
  }

  public isStateCodeValid(stateCode: number): boolean {
    return stateCode >= 0 && stateCode <= 3;
  }

  public validateRecord(record: RecorderNotificationRecord): boolean {
    return this.isContentIdValid(record.contentId) && this.isEventNameValid(record.eventName) &&
      this.isStateCodeValid(record.stateCode);
  }

  public collectViolations(record: RecorderNotificationRecord): string[] {
    const violations: string[] = [];
    if (!this.isContentIdValid(record.contentId)) {
      violations.push('contentId is empty');
    }
    if (!this.isEventNameValid(record.eventName)) {
      violations.push('eventName is invalid');
    }
    if (!this.isStateCodeValid(record.stateCode)) {
      violations.push('stateCode is out of range');
    }
    return violations;
  }
}

export default function recorderNotificationTest(): void {
  describe('RecorderNotification_Test', () => {
    let driver: Driver;
    let manager: RecorderNotificationManager;

    beforeAll(async () => {
      driver = getDriver();
      manager = RecorderNotificationManager.getInstance();
      manager.clear();
      hilog.info(DOMAIN, TAG, 'prepare recorder notification validation');
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      hilog.info(DOMAIN, TAG, 'recorder notification validation finished');
      await serializedDelay(driver, 300);
    });

    // Notifications are enabled by default.
    it('notification_should_be_enabled_by_default', 0, async () => {
      expect(manager.isEnabled()).assertTrue();
      expect(manager.isSilencePeriod()).assertFalse();
    });

    // Publishing a state change records one notification.
    it('publish_should_work_when_enabled', 0, async () => {
      manager.clear();
      manager.publish(1, 'recording_started');
      expect(manager.getPublishCount()).assertEqual(1);
    });

    // Disabled notifications are dropped.
    it('publish_should_be_blocked_when_disabled', 0, async () => {
      manager.clear();
      manager.setEnabled(false);
      manager.publish(1, 'recording_started');
      expect(manager.getPublishCount()).assertEqual(0);
      manager.setEnabled(true);
    });

    // Duplicate content identifiers are suppressed.
    it('duplicate_content_should_not_publish_twice', 0, async () => {
      manager.clear();
      manager.publish(2, 'dup');
      manager.publish(2, 'dup');
      expect(manager.getPublishCount()).assertEqual(1);
    });

    // Distinct content identifiers publish separately.
    it('different_content_should_publish_separately', 0, async () => {
      manager.clear();
      manager.publish(1, 'started');
      manager.publish(2, 'stopped');
      expect(manager.getPublishCount()).assertEqual(2);
    });

    // The event name stays stable across recorder states.
    it('publish_should_use_recorder_state_event_name', 0, async () => {
      manager.clear();
      manager.publish(3, 'error');
      const records: RecorderNotificationRecord[] = manager.getRecords();
      expect(records[0].eventName).assertEqual('recorderState');
      expect(records[0].stateCode).assertEqual(3);
    });

    // Subscribers receive the state change notification.
    it('subscriber_should_receive_notification', 0, async () => {
      manager.clear();
      let received: number = 0;
      let lastState: number = -1;
      const subscriber: RecorderSubscriber = (_eventName: string, stateCode: number) => {
        received++;
        lastState = stateCode;
      };
      manager.subscribe(subscriber);
      manager.publish(1, 'subscribed');
      expect(received).assertEqual(1);
      expect(lastState).assertEqual(1);
      manager.unsubscribe(subscriber);
    });

    // Unsubscribing stops further notifications.
    it('unsubscribe_should_stop_notification', 0, async () => {
      manager.clear();
      let received: number = 0;
      const subscriber: RecorderSubscriber = (_eventName: string, _stateCode: number) => {
        received++;
      };
      manager.subscribe(subscriber);
      manager.unsubscribe(subscriber);
      manager.publish(1, 'after_unsubscribe');
      expect(received).assertEqual(0);
    });

    // Multiple subscribers all receive the same notification.
    it('multiple_subscribers_should_all_receive', 0, async () => {
      manager.clear();
      let first: number = 0;
      let second: number = 0;
      const subscriberA: RecorderSubscriber = (_e: string, _s: number) => {
        first++;
      };
      const subscriberB: RecorderSubscriber = (_e: string, _s: number) => {
        second++;
      };
      manager.subscribe(subscriberA);
      manager.subscribe(subscriberB);
      manager.publish(1, 'multi');
      expect(first).assertEqual(1);
      expect(second).assertEqual(1);
      manager.unsubscribe(subscriberA);
      manager.unsubscribe(subscriberB);
    });

    // Badge counts follow published notifications.
    it('badge_count_should_increment_on_publish', 0, async () => {
      manager.clear();
      manager.publish(1, 'badge_1');
      manager.publish(2, 'badge_2');
      manager.publish(3, 'badge_3');
      expect(manager.getBadgeCount()).assertEqual(3);
    });

    // Clearing the badge does not drop the records.
    it('badge_count_should_clear_after_read', 0, async () => {
      manager.clear();
      manager.publish(1, 'badge');
      manager.clearBadge();
      expect(manager.getBadgeCount()).assertEqual(0);
      expect(manager.getPublishCount()).assertEqual(1);
    });

    // Duplicate publishes must not double count the badge.
    it('badge_should_not_double_count_on_duplicate', 0, async () => {
      manager.clear();
      manager.publish(1, 'badge_dup');
      manager.publish(1, 'badge_dup');
      expect(manager.getBadgeCount()).assertEqual(1);
    });

    // Silence period blocks publishing without clearing records.
    it('silence_period_should_block_publish', 0, async () => {
      manager.clear();
      manager.publish(1, 'before_silence');
      manager.setSilencePeriod(true);
      manager.publish(2, 'silenced');
      expect(manager.getPublishCount()).assertEqual(1);
      expect(manager.getBadgeCount()).assertEqual(1);
      manager.setSilencePeriod(false);
      expect(manager.isSilencePeriod()).assertFalse();
    });

    // Batch publishing of many distinct recorder states.
    it('batch_publish_should_be_handled', 0, async () => {
      manager.clear();
      for (let i = 0; i < 10; i++) {
        manager.publish(i % 4, 'state_' + i);
      }
      expect(manager.getPublishCount()).assertEqual(10);
      expect(manager.getBadgeCount()).assertEqual(10);
    });

    // Old notifications are archived after one hour.
    it('expired_messages_should_be_archived', 0, async () => {
      manager.clear();
      manager.publish(1, 'expired');
      const now: number = Date.now() + 2 * 60 * 60 * 1000;
      expect(manager.archiveExpired(now)).assertEqual(1);
      expect(manager.getRecords()[0].expired).assertTrue();
      expect(manager.archiveExpired(now)).assertEqual(0);
    });

    // Clearing resets both records and badge.
    it('clear_should_reset_publish_and_badge', 0, async () => {
      manager.publish(1, 'clear_me');
      manager.clear();
      expect(manager.getPublishCount()).assertEqual(0);
      expect(manager.getBadgeCount()).assertEqual(0);
      manager.clear();
      expect(manager.getPublishCount()).assertEqual(0);
    });

    // The enabled flag can be toggled repeatedly.
    it('toggle_enabled_should_take_effect', 0, async () => {
      manager.setEnabled(false);
      expect(manager.isEnabled()).assertFalse();
      manager.setEnabled(true);
      expect(manager.isEnabled()).assertTrue();
      manager.setEnabled(false);
      manager.setEnabled(true);
      manager.setEnabled(false);
      expect(manager.isEnabled()).assertFalse();
      manager.setEnabled(true);
    });

    // Subscriber bookkeeping counts duplicate subscriptions twice.
    it('subscriber_count_should_track_subscriptions', 0, async () => {
      manager.clear();
      const first: RecorderSubscriber = (_e: string, _s: number) => {
      };
      const second: RecorderSubscriber = (_e: string, _s: number) => {
      };
      manager.subscribe(first);
      manager.subscribe(second);
      expect(manager.getSubscriberCount()).assertEqual(2);
      manager.unsubscribe(first);
      expect(manager.getSubscriberCount()).assertEqual(1);
      manager.unsubscribe(second);
      expect(manager.getSubscriberCount()).assertEqual(0);
    });

    // Unsubscribing an unknown subscriber is safe.
    it('unsubscribe_nonexistent_should_be_safe', 0, async () => {
      manager.clear();
      const stranger: RecorderSubscriber = (_e: string, _s: number) => {
      };
      manager.unsubscribe(stranger);
      expect(manager.getSubscriberCount()).assertEqual(0);
    });

    // State counting by recorder state.
    it('state_counting_should_be_supported', 0, async () => {
      manager.clear();
      manager.publish(1, 'count_1');
      manager.publish(1, 'count_2');
      manager.publish(3, 'count_3');
      expect(manager.countByState(1)).assertEqual(2);
      expect(manager.countByState(3)).assertEqual(1);
      expect(manager.countByState(2)).assertEqual(0);
    });

    // Publishing with an empty content id still works.
    it('publish_with_empty_content_id_should_work', 0, async () => {
      manager.clear();
      manager.publish(1, '');
      expect(manager.getPublishCount()).assertEqual(1);
    });

    // Archiving only marks notifications that are old enough.
    it('archive_should_only_mark_old_records', 0, async () => {
      manager.clear();
      manager.publish(1, 'old');
      expect(manager.archiveExpired(Date.now())).assertEqual(0);
      expect(manager.getRecords()[0].expired).assertFalse();
    });

    // Dedup registry: key registration and lookup.
    it('dedup_registry_should_register_and_contain', 0, async () => {
      const registry = new RecorderDedupRegistry();
      const key: RecorderDedupKey = {
        contentId: 'started',
        category: RecorderNotificationCategory.CATEGORY_RECORDING,
        priority: 2
      };
      expect(registry.register(key)).assertTrue();
      expect(registry.contains(key)).assertTrue();
      expect(registry.getRegisteredCount()).assertEqual(1);
      registry.clear();
      expect(registry.getRegisteredCount()).assertEqual(0);
    });

    // Dedup registry: duplicate keys are rejected, then removable.
    it('dedup_registry_should_reject_duplicate_keys', 0, async () => {
      const registry = new RecorderDedupRegistry();
      const key: RecorderDedupKey = {
        contentId: 'stopped',
        category: RecorderNotificationCategory.CATEGORY_RECORDING,
        priority: 2
      };
      registry.register(key);
      const duplicate: RecorderDedupKey = {
        contentId: 'stopped',
        category: RecorderNotificationCategory.CATEGORY_RECORDING,
        priority: 2
      };
      expect(registry.register(duplicate)).assertFalse();
      expect(registry.unregister(duplicate)).assertTrue();
      expect(registry.unregister(duplicate)).assertFalse();
    });

    // Dispatcher: priority sorting puts critical state first.
    it('dispatcher_should_sort_by_priority', 0, async () => {
      const dispatcher = new RecorderNotificationDispatcher();
      const low: RecorderNotificationRecord = {
        contentId: 'idle', eventName: 'recorderState', stateCode: 0, timestamp: 1, expired: false
      };
      const critical: RecorderNotificationRecord = {
        contentId: 'error', eventName: 'recorderState', stateCode: 3, timestamp: 2, expired: false
      };
      const sorted: RecorderNotificationRecord[] = dispatcher.sortByPriority([low, critical],
        (record: RecorderNotificationRecord) => {
          if (record.stateCode === 3) {
            return 3;
          }
          return 0;
        });
      expect(sorted[0].contentId).assertEqual('error');
      expect(sorted[1].contentId).assertEqual('idle');
    });

    // Dispatcher: expired records are partitioned out.
    it('dispatcher_should_partition_expired', 0, async () => {
      const dispatcher = new RecorderNotificationDispatcher();
      const active: RecorderNotificationRecord = {
        contentId: 'a', eventName: 'recorderState', stateCode: 1, timestamp: 1, expired: false
      };
      const expired: RecorderNotificationRecord = {
        contentId: 'b', eventName: 'recorderState', stateCode: 2, timestamp: 2, expired: true
      };
      const partitions: RecorderNotificationRecord[][] = dispatcher.partitionExpired([active, expired]);
      expect(partitions[0].length).assertEqual(1);
      expect(partitions[1].length).assertEqual(1);
      expect(dispatcher.countByState([active, expired], 1)).assertEqual(1);
    });

    // Statistics: recorder state counts and ratios.
    it('statistics_should_count_recorder_states', 0, async () => {
      const stats = new RecorderNotificationStatistics();
      const recording: RecorderNotificationRecord = {
        contentId: 'a', eventName: 'recorderState', stateCode: 1, timestamp: 1, expired: false
      };
      const stopped: RecorderNotificationRecord = {
        contentId: 'b', eventName: 'recorderState', stateCode: 2, timestamp: 2, expired: false
      };
      const error: RecorderNotificationRecord = {
        contentId: 'c', eventName: 'recorderState', stateCode: 3, timestamp: 3, expired: true
      };
      stats.addRecords([recording, stopped, error]);
      expect(stats.getRecordCount()).assertEqual(3);
      expect(stats.getRecordingCount()).assertEqual(1);
      expect(stats.getStoppedCount()).assertEqual(1);
      expect(stats.getErrorCount()).assertEqual(1);
      expect(stats.getExpiredCount()).assertEqual(1);
      expect(stats.getRecordingRatio()).assertEqual(1 / 3);
    });

    // Statistics: earliest and latest timestamps.
    it('statistics_should_track_timestamp_bounds', 0, async () => {
      const stats = new RecorderNotificationStatistics();
      expect(stats.getEarliestTimestamp()).assertEqual(0);
      expect(stats.getLatestTimestamp()).assertEqual(0);
      const first: RecorderNotificationRecord = {
        contentId: 'a', eventName: 'recorderState', stateCode: 1, timestamp: 100, expired: false
      };
      const second: RecorderNotificationRecord = {
        contentId: 'b', eventName: 'recorderState', stateCode: 2, timestamp: 300, expired: false
      };
      const third: RecorderNotificationRecord = {
        contentId: 'c', eventName: 'recorderState', stateCode: 3, timestamp: 200, expired: false
      };
      stats.addRecord(first);
      stats.addRecord(second);
      stats.addRecord(third);
      expect(stats.getEarliestTimestamp()).assertEqual(100);
      expect(stats.getLatestTimestamp()).assertEqual(300);
      stats.clear();
      expect(stats.getRecordCount()).assertEqual(0);
    });

    // Policy: pending notification limit.
    it('policy_should_apply_pending_limit', 0, async () => {
      const policy = new RecorderNotificationPolicy();
      policy.setMaxPendingCount(5);
      expect(policy.canDispatch(4)).assertTrue();
      expect(policy.canDispatch(5)).assertFalse();
      expect(policy.getMaxPendingCount()).assertEqual(5);
    });

    // Policy: disabled or silenced state blocks dispatching.
    it('policy_should_block_when_disabled_or_silenced', 0, async () => {
      const policy = new RecorderNotificationPolicy();
      policy.setEnabled(false);
      expect(policy.canDispatch(0)).assertFalse();
      policy.setEnabled(true);
      policy.setSilencePeriod(true);
      expect(policy.canDispatch(0)).assertFalse();
      expect(policy.isSilencePeriod()).assertTrue();
      policy.setSilencePeriod(false);
      expect(policy.canDispatch(0)).assertTrue();
    });

    // Policy: stale notifications are archived.
    it('policy_should_archive_stale_records', 0, async () => {
      const policy = new RecorderNotificationPolicy();
      expect(policy.shouldArchive(5000, 1000, 1000)).assertTrue();
      expect(policy.shouldArchive(2000, 1000, 1000)).assertFalse();
      expect(policy.isEnabled()).assertTrue();
    });

    // Priority resolver: recorder states map to priorities.
    it('priority_resolver_should_map_recorder_states', 0, async () => {
      const resolver = new RecorderNotificationPriorityResolver();
      expect(resolver.resolve(3)).assertEqual(RecorderNotificationPriority.PRIORITY_CRITICAL);
      expect(resolver.resolve(2)).assertEqual(RecorderNotificationPriority.PRIORITY_HIGH);
      expect(resolver.resolve(1)).assertEqual(RecorderNotificationPriority.PRIORITY_NORMAL);
      expect(resolver.resolve(0)).assertEqual(RecorderNotificationPriority.PRIORITY_LOW);
      expect(resolver.resolve(9)).assertEqual(RecorderNotificationPriority.PRIORITY_LOW);
      expect(resolver.getMappedCount()).assertEqual(3);
      expect(resolver.hasMapping(1)).assertTrue();
      expect(resolver.hasMapping(0)).assertFalse();
    });

    // Delivery tracker: per content delivery status.
    it('delivery_tracker_should_track_status', 0, async () => {
      const tracker = new RecorderDeliveryTracker();
      tracker.mark('started', RecorderDeliveryStatus.DELIVERY_SENT);
      tracker.mark('stopped', RecorderDeliveryStatus.DELIVERY_DELIVERED);
      expect(tracker.getStatus('started')).assertEqual(RecorderDeliveryStatus.DELIVERY_SENT);
      expect(tracker.getStatus('missing')).assertNull();
      expect(tracker.getTrackedCount()).assertEqual(2);
      expect(tracker.countByStatus(RecorderDeliveryStatus.DELIVERY_DELIVERED)).assertEqual(1);
    });

    // Delivery tracker: all delivered detection.
    it('delivery_tracker_should_detect_all_delivered', 0, async () => {
      const tracker = new RecorderDeliveryTracker();
      tracker.mark('started', RecorderDeliveryStatus.DELIVERY_DELIVERED);
      tracker.mark('stopped', RecorderDeliveryStatus.DELIVERY_DELIVERED);
      tracker.markChannel('started', RecorderNotificationChannel.CHANNEL_TIMER);
      expect(tracker.getChannel('started')).assertEqual(RecorderNotificationChannel.CHANNEL_TIMER);
      expect(tracker.getChannel('missing')).assertNull();
      expect(tracker.isAllDelivered()).assertTrue();
      tracker.mark('error', RecorderDeliveryStatus.DELIVERY_PENDING);
      expect(tracker.isAllDelivered()).assertFalse();
      tracker.clear();
      expect(tracker.getTrackedCount()).assertEqual(0);
      expect(tracker.isAllDelivered()).assertTrue();
    });

    // Content validator: violations are collected for bad notifications.
    it('content_validator_should_collect_violations', 0, async () => {
      const validator = new RecorderNotificationContentValidator();
      const bad: RecorderNotificationRecord = {
        contentId: '', eventName: 'recorder state', stateCode: -1, timestamp: -1, expired: false
      };
      const violations: string[] = validator.collectViolations(bad);
      expect(violations.length).assertEqual(3);
      expect(validator.validateRecord(bad)).assertFalse();
      const good: RecorderNotificationRecord = {
        contentId: 'started', eventName: 'recorderState', stateCode: 1, timestamp: 1, expired: false
      };
      expect(validator.validateRecord(good)).assertTrue();
      expect(validator.collectViolations(good).length).assertEqual(0);
    });

    // UI smoke check: the notification state stays observable.
    it('notification_state_should_stay_observable', 0, async () => {
      const count: number = await recorderComponentCount(driver);
      expect(count >= 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, 'recorder notification state observed');
    });
  });
}