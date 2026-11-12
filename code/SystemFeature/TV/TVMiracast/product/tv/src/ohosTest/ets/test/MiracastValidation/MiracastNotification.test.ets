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
import { Log } from 'library';

const TAG: string = 'MiracastNotificationSuite';

// 通知优先级
enum NotificationPriority {
  LOW = 0, NORMAL = 1, HIGH = 2, URGENT = 3
}

// 通知类别：授权提示与投屏连接状态
enum NotificationCategory {
  PERMISSION_PROMPT = 'permission_prompt', CONNECT_STATUS = 'connect_status',
  DISCONNECT_STATUS = 'disconnect_status', ERROR_STATUS = 'error_status'
}

// 通知投递状态
enum NotificationDeliveryStatus {
  QUEUED = 'queued', SHOWING = 'showing', DISMISSED = 'dismissed', SUPPRESSED = 'suppressed'
}

// 通知展示通道
enum NotificationChannel {
  TOAST = 'toast', PANEL = 'panel', BANNER = 'banner'
}

// 通知记录：一条投屏通知的完整描述
interface NotificationRecord {
  id: number;
  category: NotificationCategory;
  priority: NotificationPriority;
  deviceId: string;
  message: string;
  createdAt: number;
}

// 通知模型：构造授权提示与连接/断开状态通知
class MiracastNotificationModel {
  public static readonly MAX_MESSAGE_LENGTH: number = 64;

  public buildPermissionPrompt(deviceId: string, deviceName: string, createdAt: number): NotificationRecord {
    const record: NotificationRecord = {
      id: 1000,
      category: NotificationCategory.PERMISSION_PROMPT,
      priority: NotificationPriority.URGENT,
      deviceId: deviceId,
      message: `${deviceName} requests to cast`,
      createdAt: createdAt
    };
    return record;
  }

  public buildConnectStatus(deviceId: string, createdAt: number): NotificationRecord {
    const record: NotificationRecord = {
      id: 1001,
      category: NotificationCategory.CONNECT_STATUS,
      priority: NotificationPriority.NORMAL,
      deviceId: deviceId,
      message: 'Casting started',
      createdAt: createdAt
    };
    return record;
  }

  public buildDisconnectStatus(deviceId: string, createdAt: number): NotificationRecord {
    const record: NotificationRecord = {
      id: 1002,
      category: NotificationCategory.DISCONNECT_STATUS,
      priority: NotificationPriority.HIGH,
      deviceId: deviceId,
      message: 'Casting stopped',
      createdAt: createdAt
    };
    return record;
  }

  public buildErrorStatus(deviceId: string, reason: string, createdAt: number): NotificationRecord {
    const record: NotificationRecord = {
      id: 1003,
      category: NotificationCategory.ERROR_STATUS,
      priority: NotificationPriority.URGENT,
      deviceId: deviceId,
      message: `Casting failed: ${reason}`,
      createdAt: createdAt
    };
    return record;
  }

  public isValid(record: NotificationRecord): boolean {
    return record.id > 0 && record.deviceId.length > 0 && record.message.length > 0 &&
      record.message.length <= MiracastNotificationModel.MAX_MESSAGE_LENGTH &&
      record.createdAt >= 0;
  }

  public getChannel(record: NotificationRecord): NotificationChannel {
    if (record.category === NotificationCategory.PERMISSION_PROMPT) {
      return NotificationChannel.PANEL;
    }
    if (record.priority === NotificationPriority.URGENT) {
      return NotificationChannel.BANNER;
    }
    return NotificationChannel.TOAST;
  }

  public buildSummary(records: NotificationRecord[]): string {
    let prompts: number = 0;
    let statuses: number = 0;
    for (let i = 0; i < records.length; i++) {
      if (records[i].category === NotificationCategory.PERMISSION_PROMPT) {
        prompts++;
      } else {
        statuses++;
      }
    }
    return `prompts=${prompts},statuses=${statuses}`;
  }
}

// 通知 payload 模型：支持克隆与相等比较
class NotificationPayload {
  public record: NotificationRecord;
  public channel: NotificationChannel;

  constructor(record: NotificationRecord, channel: NotificationChannel) {
    this.record = record;
    this.channel = channel;
  }

  public clone(): NotificationPayload {
    const copied: NotificationRecord = {
      id: this.record.id,
      category: this.record.category,
      priority: this.record.priority,
      deviceId: this.record.deviceId,
      message: this.record.message,
      createdAt: this.record.createdAt
    };
    return new NotificationPayload(copied, this.channel);
  }

  public equals(other: NotificationPayload): boolean {
    return this.record.id === other.record.id &&
      this.record.category === other.record.category &&
      this.record.deviceId === other.record.deviceId &&
      this.record.message === other.record.message &&
      this.channel === other.channel;
  }

  public toString(): string {
    return `NotificationPayload(id=${this.record.id}, category=${this.record.category}, channel=${this.channel})`;
  }
}

// 去重注册表：同一设备同类通知在时间窗内只展示一次
class NotificationDedupRegistry {
  private keys: string[] = [];
  private windowMs: number;

  constructor(windowMs: number = 1000) {
    this.windowMs = windowMs;
  }

  private toKey(category: NotificationCategory, deviceId: string): string {
    return `${category}#${deviceId}`;
  }

  public tryRegister(category: NotificationCategory, deviceId: string, now: number): boolean {
    const key = this.toKey(category, deviceId);
    const existing = this.findEntry(key);
    if (existing >= 0) {
      return false;
    }
    this.keys.push(`${key}@${now}`);
    return true;
  }

  private findEntry(key: string): number {
    for (let i = 0; i < this.keys.length; i++) {
      const entry = this.keys[i];
      const at = entry.indexOf('@');
      const storedKey = at < 0 ? entry : entry.substring(0, at);
      const storedAt = at < 0 ? 0 : parseInt(entry.substring(at + 1), 10);
      if (storedKey === key && storedAt <= this.windowMs * 1000) {
        return i;
      }
    }
    return -1;
  }

  public size(): number {
    return this.keys.length;
  }

  public release(category: NotificationCategory, deviceId: string): boolean {
    const key = this.toKey(category, deviceId);
    for (let i = 0; i < this.keys.length; i++) {
      if (this.keys[i].indexOf(key) === 0) {
        this.keys.splice(i, 1);
        return true;
      }
    }
    return false;
  }

  public clear(): void {
    this.keys = [];
  }

  public getWindowMs(): number {
    return this.windowMs;
  }
}

// 策略评估器：决定通知是否展示、压制或升级优先级
class NotificationPolicyEvaluator {
  private dedup: NotificationDedupRegistry;
  private disconnectRepeatLimit: number;

  constructor(dedup: NotificationDedupRegistry, disconnectRepeatLimit: number = 1) {
    this.dedup = dedup;
    this.disconnectRepeatLimit = disconnectRepeatLimit;
  }

  public shouldShow(record: NotificationRecord, disconnectCount: number): boolean {
    if (!new MiracastNotificationModel().isValid(record)) {
      return false;
    }
    if (record.category === NotificationCategory.DISCONNECT_STATUS &&
      disconnectCount > this.disconnectRepeatLimit) {
      return false;
    }
    return this.dedup.tryRegister(record.category, record.deviceId, record.createdAt);
  }

  public shouldSuppressDuplicate(record: NotificationRecord): boolean {
    return !this.dedup.tryRegister(record.category, record.deviceId, record.createdAt);
  }

  public getDisconnectRepeatLimit(): number {
    return this.disconnectRepeatLimit;
  }

  public isPromptCategory(record: NotificationRecord): boolean {
    return record.category === NotificationCategory.PERMISSION_PROMPT;
  }

  public requiresUserAction(record: NotificationRecord): boolean {
    return record.category === NotificationCategory.PERMISSION_PROMPT ||
      record.category === NotificationCategory.ERROR_STATUS;
  }
}

// 优先级解析器：结合重试次数提升断开通知的优先级
class NotificationPriorityResolver {
  public resolve(category: NotificationCategory, retryCount: number): NotificationPriority {
    if (category === NotificationCategory.PERMISSION_PROMPT) {
      return NotificationPriority.URGENT;
    }
    if (category === NotificationCategory.ERROR_STATUS) {
      return NotificationPriority.URGENT;
    }
    if (category === NotificationCategory.DISCONNECT_STATUS) {
      return retryCount >= 3 ? NotificationPriority.HIGH : NotificationPriority.NORMAL;
    }
    return NotificationPriority.LOW;
  }

  public isHigherThan(left: NotificationPriority, right: NotificationPriority): boolean {
    return left > right;
  }

  public getRank(priority: NotificationPriority): number {
    if (priority === NotificationPriority.URGENT) {
      return 4;
    }
    if (priority === NotificationPriority.HIGH) {
      return 3;
    }
    if (priority === NotificationPriority.NORMAL) {
      return 2;
    }
    return 1;
  }

  public max(left: NotificationPriority, right: NotificationPriority): NotificationPriority {
    return this.isHigherThan(left, right) ? left : right;
  }
}

// 投递跟踪器：跟踪通知从排队到展示/忽略的全过程
class NotificationDeliveryTracker {
  private statuses: NotificationDeliveryStatus[] = [];
  private queueStartedAt: number[] = [];
  private shownAt: number[] = [];
  private latencies: number[] = [];

  public enqueue(at: number): number {
    this.statuses.push(NotificationDeliveryStatus.QUEUED);
    this.queueStartedAt.push(at);
    return this.statuses.length - 1;
  }

  public show(index: number, at: number): boolean {
    if (index < 0 || index >= this.statuses.length) {
      return false;
    }
    if (this.statuses[index] !== NotificationDeliveryStatus.QUEUED) {
      return false;
    }
    this.statuses[index] = NotificationDeliveryStatus.SHOWING;
    this.shownAt.push(at);
    this.latencies.push(at - this.queueStartedAt[index]);
    return true;
  }

  public dismiss(index: number): boolean {
    if (index < 0 || index >= this.statuses.length) {
      return false;
    }
    if (this.statuses[index] === NotificationDeliveryStatus.DISMISSED) {
      return false;
    }
    this.statuses[index] = NotificationDeliveryStatus.DISMISSED;
    return true;
  }

  public suppress(index: number): boolean {
    if (index < 0 || index >= this.statuses.length) {
      return false;
    }
    if (this.statuses[index] !== NotificationDeliveryStatus.QUEUED) {
      return false;
    }
    this.statuses[index] = NotificationDeliveryStatus.SUPPRESSED;
    return true;
  }

  public getStatus(index: number): NotificationDeliveryStatus | null {
    if (index < 0 || index >= this.statuses.length) {
      return null;
    }
    return this.statuses[index];
  }

  public countByStatus(status: NotificationDeliveryStatus): number {
    let count: number = 0;
    for (let i = 0; i < this.statuses.length; i++) {
      if (this.statuses[i] === status) {
        count++;
      }
    }
    return count;
  }

  public getAverageLatency(): number {
    if (this.latencies.length === 0) {
      return 0;
    }
    let sum: number = 0;
    for (let i = 0; i < this.latencies.length; i++) {
      sum += this.latencies[i];
    }
    return sum / this.latencies.length;
  }

  public getTotal(): number {
    return this.statuses.length;
  }
}

// 批量派发器：把多条通知打包派发，控制单批上限
class NotificationBatchDispatcher {
  private batch: NotificationPayload[] = [];
  private batchSize: number;
  private flushedBatches: number = 0;
  private flushedCount: number = 0;

  constructor(batchSize: number = 4) {
    this.batchSize = batchSize;
  }

  public add(payload: NotificationPayload): boolean {
    if (!new MiracastNotificationModel().isValid(payload.record)) {
      return false;
    }
    if (this.batch.length >= this.batchSize) {
      return false;
    }
    this.batch.push(payload);
    return true;
  }

  public isFull(): boolean {
    return this.batch.length >= this.batchSize;
  }

  public flush(): number {
    const count = this.batch.length;
    if (count === 0) {
      return 0;
    }
    this.flushedCount += count;
    this.flushedBatches++;
    this.batch = [];
    return count;
  }

  public size(): number {
    return this.batch.length;
  }

  public getFlushedBatches(): number {
    return this.flushedBatches;
  }

  public getFlushedCount(): number {
    return this.flushedCount;
  }

  public getBatchSize(): number {
    return this.batchSize;
  }
}

// 通知统计器：统计各类别数量与投递成功率
class NotificationStatistics {
  public countByCategory(records: NotificationRecord[], category: NotificationCategory): number {
    let count: number = 0;
    for (let i = 0; i < records.length; i++) {
      if (records[i].category === category) {
        count++;
      }
    }
    return count;
  }

  public getUrgentRatio(records: NotificationRecord[]): number {
    if (records.length === 0) {
      return 0;
    }
    let urgent: number = 0;
    for (let i = 0; i < records.length; i++) {
      if (records[i].priority === NotificationPriority.URGENT) {
        urgent++;
      }
    }
    return urgent / records.length;
  }

  public getDeliveryRate(tracker: NotificationDeliveryTracker): number {
    const total = tracker.getTotal();
    if (total === 0) {
      return 0;
    }
    const shown = tracker.countByStatus(NotificationDeliveryStatus.SHOWING);
    return shown / total;
  }

  public getOldestRecord(records: NotificationRecord[]): NotificationRecord | null {
    if (records.length === 0) {
      return null;
    }
    let oldest = records[0];
    for (let i = 1; i < records.length; i++) {
      if (records[i].createdAt < oldest.createdAt) {
        oldest = records[i];
      }
    }
    return oldest;
  }

  public isCategorySorted(records: NotificationRecord[]): boolean {
    for (let i = 1; i < records.length; i++) {
      if (records[i].createdAt < records[i - 1].createdAt) {
        return false;
      }
    }
    return true;
  }
}

// 内容校验器：保证通知文案符合展示约束
class NotificationContentValidator {
  public isMessageValid(message: string): boolean {
    if (message.length === 0) {
      return false;
    }
    if (message.length > MiracastNotificationModel.MAX_MESSAGE_LENGTH) {
      return false;
    }
    return message.trim().length === message.length;
  }

  public isDeviceIdValid(deviceId: string): boolean {
    return deviceId.length >= 4 && deviceId.length <= 64;
  }

  public isIdValid(id: number): boolean {
    return id > 0 && id <= 9999;
  }

  public countViolations(record: NotificationRecord): number {
    let count: number = 0;
    if (!this.isMessageValid(record.message)) {
      count++;
    }
    if (!this.isDeviceIdValid(record.deviceId)) {
      count++;
    }
    if (!this.isIdValid(record.id)) {
      count++;
    }
    return count;
  }

  public isAcceptable(record: NotificationRecord): boolean {
    return this.countViolations(record) === 0;
  }
}

// 通知协调器：串联授权提示与连接/断开状态通知的完整流程
class MiracastNotificationCoordinator {
  private model: MiracastNotificationModel = new MiracastNotificationModel();
  private validator: NotificationContentValidator = new NotificationContentValidator();
  private tracker: NotificationDeliveryTracker = new NotificationDeliveryTracker();
  private history: NotificationRecord[] = [];
  private disconnectCount: number = 0;

  public notifyPermission(deviceId: string, deviceName: string, at: number): number {
    const record = this.model.buildPermissionPrompt(deviceId, deviceName, at);
    if (!this.validator.isAcceptable(record)) {
      return -1;
    }
    this.history.push(record);
    return this.tracker.enqueue(at);
  }

  public notifyConnected(deviceId: string, at: number): number {
    const record = this.model.buildConnectStatus(deviceId, at);
    this.history.push(record);
    this.disconnectCount = 0;
    return this.tracker.enqueue(at);
  }

  public notifyDisconnected(deviceId: string, at: number): number {
    this.disconnectCount++;
    const record = this.model.buildDisconnectStatus(deviceId, at);
    this.history.push(record);
    return this.tracker.enqueue(at);
  }

  public show(index: number, at: number): boolean {
    return this.tracker.show(index, at);
  }

  public dismiss(index: number): boolean {
    return this.tracker.dismiss(index);
  }

  public getHistory(): NotificationRecord[] {
    return [...this.history];
  }

  public getTracker(): NotificationDeliveryTracker {
    return this.tracker;
  }

  public getDisconnectCount(): number {
    return this.disconnectCount;
  }

  public getPromptCount(): number {
    return new NotificationStatistics().countByCategory(this.history,
      NotificationCategory.PERMISSION_PROMPT);
  }

  public reset(): void {
    this.history = [];
    this.disconnectCount = 0;
  }
}

export default function miracastNotificationSuite(): void {
  describe('MiracastNotification_Suite', () => {

    beforeAll(async () => {
      Log.info(TAG, 'notification suite started');
    });

    afterAll(async () => {
      Log.info(TAG, 'notification suite finished');
    });

    // ===== 通知构造 =====
    it('permission_prompt_should_be_urgent_and_panel', 0, async () => {
      const model = new MiracastNotificationModel();
      const record = model.buildPermissionPrompt('dev-0001', 'LivingRoomTV', 1000);
      expect(record.category).assertEqual(NotificationCategory.PERMISSION_PROMPT);
      expect(record.priority).assertEqual(NotificationPriority.URGENT);
      expect(model.getChannel(record)).assertEqual(NotificationChannel.PANEL);
      expect(record.message).assertContain('LivingRoomTV');
    });

    it('connect_status_should_be_normal_and_toast', 0, async () => {
      const model = new MiracastNotificationModel();
      const record = model.buildConnectStatus('dev-0001', 2000);
      expect(record.category).assertEqual(NotificationCategory.CONNECT_STATUS);
      expect(record.priority).assertEqual(NotificationPriority.NORMAL);
      expect(model.getChannel(record)).assertEqual(NotificationChannel.TOAST);
      expect(record.message).assertEqual('Casting started');
    });

    it('disconnect_status_should_be_high_priority', 0, async () => {
      const model = new MiracastNotificationModel();
      const record = model.buildDisconnectStatus('dev-0001', 3000);
      expect(record.category).assertEqual(NotificationCategory.DISCONNECT_STATUS);
      expect(record.priority).assertEqual(NotificationPriority.HIGH);
      expect(record.message).assertEqual('Casting stopped');
    });

    it('error_status_should_be_banner_with_reason', 0, async () => {
      const model = new MiracastNotificationModel();
      const record = model.buildErrorStatus('dev-0001', 'timeout', 4000);
      expect(record.category).assertEqual(NotificationCategory.ERROR_STATUS);
      expect(record.priority).assertEqual(NotificationPriority.URGENT);
      expect(model.getChannel(record)).assertEqual(NotificationChannel.BANNER);
      expect(record.message).assertContain('timeout');
    });

    it('valid_notification_should_pass_validation', 0, async () => {
      const model = new MiracastNotificationModel();
      const record = model.buildConnectStatus('dev-0001', 1000);
      expect(model.isValid(record)).assertTrue();
    });

    it('empty_device_id_notification_should_be_invalid', 0, async () => {
      const model = new MiracastNotificationModel();
      const record = model.buildConnectStatus('', 1000);
      expect(model.isValid(record)).assertFalse();
    });

    it('summary_should_count_prompts_and_statuses', 0, async () => {
      const model = new MiracastNotificationModel();
      const records: NotificationRecord[] = [
        model.buildPermissionPrompt('dev-0001', 'TV1', 1000),
        model.buildConnectStatus('dev-0001', 2000),
        model.buildDisconnectStatus('dev-0001', 3000)
      ];
      expect(model.buildSummary(records)).assertEqual('prompts=1,statuses=2');
      expect(model.buildSummary([])).assertEqual('prompts=0,statuses=0');
    });

    // ===== 通知 payload =====
    it('payload_clone_should_be_equal', 0, async () => {
      const model = new MiracastNotificationModel();
      const payload = new NotificationPayload(model.buildConnectStatus('dev-0001', 1000),
        NotificationChannel.TOAST);
      const copy = payload.clone();
      expect(payload.equals(copy)).assertTrue();
      expect(payload.toString()).assertContain('connect_status');
    });

    // ===== 去重注册 =====
    it('dedup_registry_should_accept_first_registration', 0, async () => {
      const registry = new NotificationDedupRegistry(1000);
      expect(registry.tryRegister(NotificationCategory.CONNECT_STATUS, 'dev-0001', 1000)).assertTrue();
      expect(registry.size()).assertEqual(1);
      expect(registry.getWindowMs()).assertEqual(1000);
    });

    it('dedup_registry_should_reject_same_category_and_device', 0, async () => {
      const registry = new NotificationDedupRegistry(1000);
      registry.tryRegister(NotificationCategory.CONNECT_STATUS, 'dev-0001', 1000);
      expect(registry.tryRegister(NotificationCategory.CONNECT_STATUS, 'dev-0001', 1500)).assertFalse();
      expect(registry.size()).assertEqual(1);
    });

    it('dedup_registry_release_should_allow_reregister', 0, async () => {
      const registry = new NotificationDedupRegistry(1000);
      registry.tryRegister(NotificationCategory.CONNECT_STATUS, 'dev-0001', 1000);
      expect(registry.release(NotificationCategory.CONNECT_STATUS, 'dev-0001')).assertTrue();
      expect(registry.release(NotificationCategory.CONNECT_STATUS, 'dev-0001')).assertFalse();
      expect(registry.tryRegister(NotificationCategory.CONNECT_STATUS, 'dev-0001', 2000)).assertTrue();
      registry.clear();
      expect(registry.tryRegister(NotificationCategory.CONNECT_STATUS, 'dev-0001', 3000)).assertTrue();
    });

    // ===== 策略评估 =====
    it('policy_should_show_first_valid_notification', 0, async () => {
      const model = new MiracastNotificationModel();
      const policy = new NotificationPolicyEvaluator(new NotificationDedupRegistry(1000));
      expect(policy.shouldShow(model.buildConnectStatus('dev-0001', 1000), 0)).assertTrue();
    });

    it('policy_should_suppress_repeated_notification', 0, async () => {
      const model = new MiracastNotificationModel();
      const policy = new NotificationPolicyEvaluator(new NotificationDedupRegistry(1000));
      expect(policy.shouldShow(model.buildConnectStatus('dev-0001', 1000), 0)).assertTrue();
      expect(policy.shouldSuppressDuplicate(model.buildConnectStatus('dev-0001', 2000))).assertTrue();
    });

    it('policy_should_reject_invalid_notification', 0, async () => {
      const model = new MiracastNotificationModel();
      const policy = new NotificationPolicyEvaluator(new NotificationDedupRegistry(1000));
      expect(policy.shouldShow(model.buildConnectStatus('', 1000), 0)).assertFalse();
    });

    it('policy_should_identify_prompt_and_action_requirement', 0, async () => {
      const model = new MiracastNotificationModel();
      const policy = new NotificationPolicyEvaluator(new NotificationDedupRegistry(1000));
      const prompt = model.buildPermissionPrompt('dev-0001', 'TV1', 1000);
      const connect = model.buildConnectStatus('dev-0001', 2000);
      expect(policy.isPromptCategory(prompt)).assertTrue();
      expect(policy.isPromptCategory(connect)).assertFalse();
      expect(policy.requiresUserAction(prompt)).assertTrue();
      expect(policy.requiresUserAction(connect)).assertFalse();
      expect(policy.getDisconnectRepeatLimit()).assertLarger(0);
    });

    // ===== 优先级解析 =====
    it('priority_resolver_should_promote_prompt_to_urgent', 0, async () => {
      const resolver = new NotificationPriorityResolver();
      expect(resolver.resolve(NotificationCategory.PERMISSION_PROMPT, 0))
        .assertEqual(NotificationPriority.URGENT);
      expect(resolver.resolve(NotificationCategory.CONNECT_STATUS, 0))
        .assertEqual(NotificationPriority.LOW);
      expect(resolver.getRank(NotificationPriority.URGENT)).assertLargerOrEqual(0);
      expect(resolver.max(NotificationPriority.LOW, NotificationPriority.URGENT))
        .assertEqual(NotificationPriority.URGENT);
    });

    it('priority_resolver_should_escalate_after_retries', 0, async () => {
      const resolver = new NotificationPriorityResolver();
      expect(resolver.resolve(NotificationCategory.DISCONNECT_STATUS, 2))
        .assertEqual(NotificationPriority.NORMAL);
      expect(resolver.resolve(NotificationCategory.DISCONNECT_STATUS, 3))
        .assertEqual(NotificationPriority.HIGH);
    });

    // ===== 投递跟踪 =====
    it('delivery_tracker_should_enqueue_and_show', 0, async () => {
      const tracker = new NotificationDeliveryTracker();
      const index = tracker.enqueue(1000);
      expect(index).assertEqual(0);
      expect(tracker.getStatus(0)).assertEqual(NotificationDeliveryStatus.QUEUED);
      expect(tracker.show(0, 1300)).assertTrue();
      expect(tracker.getStatus(0)).assertEqual(NotificationDeliveryStatus.SHOWING);
      expect(tracker.getAverageLatency()).assertEqual(300);
    });

    it('delivery_tracker_should_reject_repeated_show', 0, async () => {
      const tracker = new NotificationDeliveryTracker();
      tracker.enqueue(1000);
      tracker.show(0, 1200);
      expect(tracker.show(0, 1400)).assertFalse();
      expect(tracker.getTotal()).assertEqual(1);
    });

    it('delivery_tracker_should_reject_invalid_index', 0, async () => {
      const tracker = new NotificationDeliveryTracker();
      tracker.enqueue(1000);
      expect(tracker.show(-1, 1200)).assertFalse();
      expect(tracker.show(5, 1200)).assertFalse();
      expect(tracker.dismiss(9)).assertFalse();
      expect(tracker.getStatus(3)).assertNull();
      expect(tracker.suppress(9)).assertFalse();
    });

    it('delivery_tracker_dismiss_should_be_idempotent_guard', 0, async () => {
      const tracker = new NotificationDeliveryTracker();
      tracker.enqueue(1000);
      tracker.show(0, 1200);
      expect(tracker.dismiss(0)).assertTrue();
      expect(tracker.dismiss(0)).assertFalse();
      expect(tracker.countByStatus(NotificationDeliveryStatus.DISMISSED)).assertEqual(1);
    });

    it('delivery_tracker_average_latency_should_be_computed', 0, async () => {
      const tracker = new NotificationDeliveryTracker();
      tracker.enqueue(1000);
      tracker.enqueue(2000);
      tracker.show(0, 1400);
      tracker.show(1, 2200);
      expect(tracker.getAverageLatency()).assertEqual(300);
      expect(tracker.getTotal()).assertEqual(2);
    });

    // ===== 批量派发 =====
    it('batch_dispatcher_should_fill_and_flush', 0, async () => {
      const model = new MiracastNotificationModel();
      const dispatcher = new NotificationBatchDispatcher(2);
      expect(dispatcher.add(new NotificationPayload(model.buildConnectStatus('dev-0001', 1000),
        NotificationChannel.TOAST))).assertTrue();
      expect(dispatcher.isFull()).assertFalse();
      expect(dispatcher.add(new NotificationPayload(model.buildConnectStatus('dev-0002', 2000),
        NotificationChannel.TOAST))).assertTrue();
      expect(dispatcher.isFull()).assertTrue();
      expect(dispatcher.flush()).assertEqual(2);
      expect(dispatcher.size()).assertEqual(0);
      expect(dispatcher.getFlushedCount()).assertEqual(2);
    });

    it('batch_dispatcher_should_reject_overflow', 0, async () => {
      const model = new MiracastNotificationModel();
      const dispatcher = new NotificationBatchDispatcher(1);
      dispatcher.add(new NotificationPayload(model.buildConnectStatus('dev-0001', 1000),
        NotificationChannel.TOAST));
      expect(dispatcher.add(new NotificationPayload(model.buildConnectStatus('dev-0002', 2000),
        NotificationChannel.TOAST))).assertFalse();
      expect(dispatcher.size()).assertEqual(1);
      expect(dispatcher.getBatchSize()).assertEqual(1);
      expect(dispatcher.getFlushedBatches()).assertEqual(0);
    });

    it('batch_dispatcher_should_reject_invalid_payload', 0, async () => {
      const model = new MiracastNotificationModel();
      const dispatcher = new NotificationBatchDispatcher(4);
      expect(dispatcher.add(new NotificationPayload(model.buildConnectStatus('', 1000),
        NotificationChannel.TOAST))).assertFalse();
      expect(dispatcher.size()).assertEqual(0);
    });

    // ===== 统计 =====
    it('statistics_should_count_by_category', 0, async () => {
      const model = new MiracastNotificationModel();
      const records: NotificationRecord[] = [
        model.buildPermissionPrompt('dev-0001', 'TV1', 1000),
        model.buildConnectStatus('dev-0001', 2000),
        model.buildDisconnectStatus('dev-0001', 3000)
      ];
      const stats = new NotificationStatistics();
      expect(stats.countByCategory(records, NotificationCategory.PERMISSION_PROMPT)).assertEqual(1);
      expect(stats.countByCategory(records, NotificationCategory.CONNECT_STATUS)).assertEqual(1);
      expect(stats.countByCategory(records, NotificationCategory.ERROR_STATUS)).assertEqual(0);
    });

    it('statistics_urgent_ratio_should_be_computed', 0, async () => {
      const model = new MiracastNotificationModel();
      const records: NotificationRecord[] = [
        model.buildPermissionPrompt('dev-0001', 'TV1', 1000),
        model.buildConnectStatus('dev-0001', 2000),
        model.buildConnectStatus('dev-0002', 3000),
        model.buildConnectStatus('dev-0003', 4000)
      ];
      const stats = new NotificationStatistics();
      expect(stats.getUrgentRatio(records)).assertEqual(0.25);
      expect(stats.getUrgentRatio([])).assertEqual(0);
    });

    it('statistics_delivery_rate_should_be_computed', 0, async () => {
      const tracker = new NotificationDeliveryTracker();
      tracker.enqueue(1000);
      tracker.enqueue(2000);
      tracker.show(0, 1100);
      const stats = new NotificationStatistics();
      expect(stats.getDeliveryRate(tracker)).assertEqual(0.5);
      expect(stats.getDeliveryRate(new NotificationDeliveryTracker())).assertEqual(0);
    });

    it('statistics_oldest_record_should_be_found', 0, async () => {
      const model = new MiracastNotificationModel();
      const records: NotificationRecord[] = [
        model.buildConnectStatus('dev-0001', 3000),
        model.buildConnectStatus('dev-0002', 1000),
        model.buildConnectStatus('dev-0003', 2000)
      ];
      const stats = new NotificationStatistics();
      const oldest = stats.getOldestRecord(records);
      expect(oldest === null).assertFalse();
      if (oldest !== null) {
        expect(oldest.createdAt).assertEqual(1000);
        expect(oldest.deviceId).assertEqual('dev-0002');
      }
      expect(stats.getOldestRecord([])).assertNull();
    });

    // ===== 内容校验 =====
    it('content_validator_should_accept_normal_message', 0, async () => {
      const validator = new NotificationContentValidator();
      expect(validator.isMessageValid('Casting started')).assertTrue();
      expect(validator.isMessageValid('')).assertFalse();
    });

    it('content_validator_message_length_boundary_should_be_enforced', 0, async () => {
      const validator = new NotificationContentValidator();
      expect(validator.isMessageValid('a'.repeat(64))).assertTrue();
      expect(validator.isMessageValid('a'.repeat(65))).assertFalse();
    });

    it('content_validator_should_reject_edge_whitespace_message', 0, async () => {
      const validator = new NotificationContentValidator();
      expect(validator.isMessageValid(' Casting started')).assertFalse();
      expect(validator.isMessageValid('Casting  started')).assertTrue();
    });

    it('content_validator_should_bound_device_id_and_notification_id', 0, async () => {
      const validator = new NotificationContentValidator();
      expect(validator.isDeviceIdValid('dev-0001')).assertTrue();
      expect(validator.isDeviceIdValid('abc')).assertFalse();
      expect(validator.isIdValid(1)).assertTrue();
      expect(validator.isIdValid(9999)).assertTrue();
      expect(validator.isIdValid(0)).assertFalse();
      expect(validator.isIdValid(10000)).assertFalse();
    });

    // ===== 端到端协调 =====
    it('coordinator_should_queue_permission_prompt', 0, async () => {
      const coordinator = new MiracastNotificationCoordinator();
      const index = coordinator.notifyPermission('dev-0001', 'LivingRoomTV', 1000);
      expect(index).assertEqual(0);
      expect(coordinator.getHistory().length).assertEqual(1);
      expect(coordinator.getPromptCount()).assertEqual(1);
    });

    it('coordinator_should_show_then_dismiss_prompt', 0, async () => {
      const coordinator = new MiracastNotificationCoordinator();
      coordinator.notifyPermission('dev-0001', 'LivingRoomTV', 1000);
      expect(coordinator.show(0, 1200)).assertTrue();
      expect(coordinator.getTracker().getStatus(0)).assertEqual(NotificationDeliveryStatus.SHOWING);
      expect(coordinator.dismiss(0)).assertTrue();
      expect(coordinator.getTracker().getStatus(0)).assertEqual(NotificationDeliveryStatus.DISMISSED);
    });

    it('coordinator_should_reset_disconnect_count_on_connect', 0, async () => {
      const coordinator = new MiracastNotificationCoordinator();
      coordinator.notifyDisconnected('dev-0001', 1000);
      coordinator.notifyDisconnected('dev-0001', 2000);
      expect(coordinator.getDisconnectCount()).assertEqual(2);
      coordinator.notifyConnected('dev-0001', 3000);
      expect(coordinator.getDisconnectCount()).assertEqual(0);
    });

    it('coordinator_should_reject_invalid_permission_device', 0, async () => {
      const coordinator = new MiracastNotificationCoordinator();
      expect(coordinator.notifyPermission('', 'TV1', 1000)).assertEqual(-1);
      expect(coordinator.getHistory().length).assertEqual(0);
    });

    it('coordinator_reset_should_clear_history_and_counter', 0, async () => {
      const coordinator = new MiracastNotificationCoordinator();
      coordinator.notifyDisconnected('dev-0001', 1000);
      coordinator.notifyConnected('dev-0001', 2000);
      coordinator.reset();
      expect(coordinator.getHistory().length).assertEqual(0);
      expect(coordinator.getDisconnectCount()).assertEqual(0);
      expect(coordinator.getPromptCount()).assertEqual(0);
    });

    it('coordinator_should_keep_history_in_arrival_order', 0, async () => {
      const coordinator = new MiracastNotificationCoordinator();
      coordinator.notifyConnected('dev-0001', 1000);
      coordinator.notifyDisconnected('dev-0001', 2000);
      const history = coordinator.getHistory();
      expect(history.length).assertEqual(2);
      expect(history[0].category).assertEqual(NotificationCategory.CONNECT_STATUS);
      expect(history[1].category).assertEqual(NotificationCategory.DISCONNECT_STATUS);
      expect(new NotificationStatistics().isCategorySorted(history)).assertTrue();
    });

  });
}
