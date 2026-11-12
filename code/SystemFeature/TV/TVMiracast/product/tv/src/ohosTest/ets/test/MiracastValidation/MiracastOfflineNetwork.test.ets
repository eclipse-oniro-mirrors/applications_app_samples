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

const TAG: string = 'MiracastOfflineNetworkSuite';

// 网络状态：投屏发现与连接依赖 WiFi 与软总线
enum NetworkState {
  ONLINE = 'online', OFFLINE = 'offline', DISCOVERING = 'discovering', DEGRADED = 'degraded'
}

// 网络状态迁移事件
enum NetworkTransitionEvent {
  WIFI_LOST = 'wifi_lost', SOFTBUS_LOST = 'softbus_lost', RESTORED = 'restored',
  DISCOVERY_TIMEOUT = 'discovery_timeout', SERVICE_RESTART = 'service_restart'
}

// 网络状态模型：维护 WiFi/软总线的可用性组合
class NetworkStateModel {
  private wifiAvailable: boolean = true;
  private softbusAvailable: boolean = true;
  private discovering: boolean = false;

  public isWifiAvailable(): boolean {
    return this.wifiAvailable;
  }

  public isSoftbusAvailable(): boolean {
    return this.softbusAvailable;
  }

  public onWifiLost(): void {
    this.wifiAvailable = false;
  }

  public onSoftbusLost(): void {
    this.softbusAvailable = false;
  }

  public onWifiRestored(): void {
    this.wifiAvailable = true;
  }

  public onSoftbusRestored(): void {
    this.softbusAvailable = true;
  }

  public startDiscovery(): boolean {
    if (!this.isOnline()) {
      return false;
    }
    this.discovering = true;
    return true;
  }

  public stopDiscovery(): void {
    this.discovering = false;
  }

  public isDiscovering(): boolean {
    return this.discovering;
  }

  public isOnline(): boolean {
    return this.wifiAvailable || this.softbusAvailable;
  }

  public getState(): NetworkState {
    if (this.discovering && this.isOnline()) {
      return NetworkState.DISCOVERING;
    }
    if (!this.isOnline()) {
      return NetworkState.OFFLINE;
    }
    if (!this.wifiAvailable || !this.softbusAvailable) {
      return NetworkState.DEGRADED;
    }
    return NetworkState.ONLINE;
  }

  public getTransitionEvent(): NetworkTransitionEvent | null {
    if (!this.wifiAvailable && !this.softbusAvailable) {
      return NetworkTransitionEvent.WIFI_LOST;
    }
    if (!this.softbusAvailable) {
      return NetworkTransitionEvent.SOFTBUS_LOST;
    }
    if (!this.wifiAvailable) {
      return NetworkTransitionEvent.DISCOVERY_TIMEOUT;
    }
    return null;
  }
}

// 发现会话：带超时的设备发现周期
class DiscoverySession {
  private startedAt: number = 0;
  private timeoutMs: number;
  private running: boolean = false;
  private restarts: number = 0;

  constructor(timeoutMs: number = 1000) {
    this.timeoutMs = timeoutMs;
  }

  public start(now: number): boolean {
    if (this.running) {
      return false;
    }
    this.running = true;
    this.startedAt = now;
    return true;
  }

  public tick(now: number): boolean {
    if (!this.running) {
      return false;
    }
    if (now - this.startedAt >= this.timeoutMs) {
      this.running = false;
      return false;
    }
    return true;
  }

  public isTimedOut(now: number): boolean {
    return this.running && now - this.startedAt >= this.timeoutMs;
  }

  public restart(now: number): void {
    this.running = true;
    this.startedAt = now;
    this.restarts++;
  }

  public stop(): void {
    this.running = false;
  }

  public isRunning(): boolean {
    return this.running;
  }

  public getElapsed(now: number): number {
    if (this.startedAt === 0) {
      return 0;
    }
    const elapsed = now - this.startedAt;
    return elapsed > 0 ? elapsed : 0;
  }

  public getRestarts(): number {
    return this.restarts;
  }

  public getTimeoutMs(): number {
    return this.timeoutMs;
  }
}

// 重试退避策略：指数退避并设置上限
class RetryBackoffPolicy {
  private baseDelayMs: number;
  private maxDelayMs: number;
  private maxAttempts: number;

  constructor(baseDelayMs: number = 400, maxDelayMs: number = 3200, maxAttempts: number = 3) {
    this.baseDelayMs = baseDelayMs;
    this.maxDelayMs = maxDelayMs;
    this.maxAttempts = maxAttempts;
  }

  public getDelay(attempt: number): number {
    if (attempt <= 0) {
      return 0;
    }
    let delay = this.baseDelayMs;
    for (let i = 1; i < attempt; i++) {
      delay = delay * 2;
    }
    if (delay > this.maxDelayMs) {
      return this.maxDelayMs;
    }
    return delay;
  }

  public shouldRetry(attempt: number): boolean {
    return attempt < this.maxAttempts;
  }

  public isExhausted(attempt: number): boolean {
    return attempt >= this.maxAttempts;
  }

  public getMaxAttempts(): number {
    return this.maxAttempts;
  }

  public getBaseDelayMs(): number {
    return this.baseDelayMs;
  }

  public getMaxDelayMs(): number {
    return this.maxDelayMs;
  }
}

// 发现任务：一次待执行的重连任务
interface DiscoveryTask {
  deviceId: string;
  attempt: number;
  scheduledAt: number;
}

// 重试队列：维护待重连设备，并按退避策略给出下一次延迟
class RetryQueueManager {
  private tasks: DiscoveryTask[] = [];
  private dropped: number = 0;

  public enqueue(deviceId: string, attempt: number, scheduledAt: number): boolean {
    for (let i = 0; i < this.tasks.length; i++) {
      if (this.tasks[i].deviceId === deviceId) {
        return false;
      }
    }
    const task: DiscoveryTask = {
      deviceId: deviceId,
      attempt: attempt,
      scheduledAt: scheduledAt
    };
    this.tasks.push(task);
    return true;
  }

  public dequeue(): DiscoveryTask | null {
    if (this.tasks.length === 0) {
      return null;
    }
    const first = this.tasks.shift();
    return first === undefined ? null : first;
  }

  public size(): number {
    return this.tasks.length;
  }

  public peekDeviceId(): string {
    if (this.tasks.length === 0) {
      return '';
    }
    return this.tasks[0].deviceId;
  }

  public remove(deviceId: string): boolean {
    for (let i = 0; i < this.tasks.length; i++) {
      if (this.tasks[i].deviceId === deviceId) {
        this.tasks.splice(i, 1);
        return true;
      }
    }
    return false;
  }

  public markDropped(): void {
    this.dropped++;
  }

  public getDropped(): number {
    return this.dropped;
  }

  public clear(): void {
    this.tasks = [];
    this.dropped = 0;
  }
}

// 离线缓存：网络恢复后回放上次的设备列表
class OfflineCacheStore {
  private deviceIds: string[] = [];
  private cachedAt: number = 0;

  public save(deviceIds: string[], at: number): void {
    this.deviceIds = [...deviceIds];
    this.cachedAt = at;
  }

  public restore(): string[] {
    return [...this.deviceIds];
  }

  public size(): number {
    return this.deviceIds.length;
  }

  public isStale(now: number, ttlMs: number): boolean {
    if (this.cachedAt === 0) {
      return true;
    }
    return now - this.cachedAt > ttlMs;
  }

  public clear(): void {
    this.deviceIds = [];
    this.cachedAt = 0;
  }

  public getCachedAt(): number {
    return this.cachedAt;
  }
}

// 网络迁移日志：记录离线/恢复事件，统计次数
class NetworkTransitionLogger {
  private events: NetworkTransitionEvent[] = [];
  private times: number[] = [];

  public record(event: NetworkTransitionEvent, at: number): void {
    this.events.push(event);
    this.times.push(at);
  }

  public getEventCount(): number {
    return this.events.length;
  }

  public countByEvent(event: NetworkTransitionEvent): number {
    let count: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i] === event) {
        count++;
      }
    }
    return count;
  }

  public getLastEvent(): NetworkTransitionEvent | null {
    if (this.events.length === 0) {
      return null;
    }
    return this.events[this.events.length - 1];
  }

  public isMonotonic(): boolean {
    for (let i = 1; i < this.times.length; i++) {
      if (this.times[i] < this.times[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public clear(): void {
    this.events = [];
    this.times = [];
  }
}

// 消息顺序校验器：校验发现结果序号的连续性
class MessageOrderValidator {
  private expected: number = 0;
  private gaps: number = 0;
  private duplicates: number = 0;

  public accept(sequence: number): boolean {
    if (sequence < this.expected) {
      this.duplicates++;
      return false;
    }
    if (sequence > this.expected) {
      this.gaps++;
    }
    this.expected = sequence + 1;
    return true;
  }

  public getExpected(): number {
    return this.expected;
  }

  public getGaps(): number {
    return this.gaps;
  }

  public getDuplicates(): number {
    return this.duplicates;
  }

  public isContinuous(): boolean {
    return this.gaps === 0 && this.duplicates === 0;
  }

  public reset(): void {
    this.expected = 0;
    this.gaps = 0;
    this.duplicates = 0;
  }
}

// 网络统计器：统计离线占比与平均恢复耗时
class NetworkStatistics {
  public getOfflineRatio(events: NetworkTransitionEvent[]): number {
    if (events.length === 0) {
      return 0;
    }
    let offline: number = 0;
    for (let i = 0; i < events.length; i++) {
      if (events[i] === NetworkTransitionEvent.WIFI_LOST ||
        events[i] === NetworkTransitionEvent.SOFTBUS_LOST) {
        offline++;
      }
    }
    return offline / events.length;
  }

  public getAverageDowntime(offlineAt: number[], restoredAt: number[]): number {
    if (offlineAt.length === 0 || restoredAt.length !== offlineAt.length) {
      return 0;
    }
    let sum: number = 0;
    for (let i = 0; i < offlineAt.length; i++) {
      const gap = restoredAt[i] - offlineAt[i];
      sum += gap > 0 ? gap : 0;
    }
    return sum / offlineAt.length;
  }

  public getLongestOutage(offlineAt: number[], restoredAt: number[]): number {
    let longest: number = 0;
    const limit = offlineAt.length < restoredAt.length ? offlineAt.length : restoredAt.length;
    for (let i = 0; i < limit; i++) {
      const gap = restoredAt[i] - offlineAt[i];
      if (gap > longest) {
        longest = gap;
      }
    }
    return longest;
  }

  public isRecovered(logger: NetworkTransitionLogger): boolean {
    const last = logger.getLastEvent();
    return last === NetworkTransitionEvent.RESTORED;
  }
}

// 延迟估算器：基于采样估算发现延迟与是否超时
class NetworkLatencyEstimator {
  private samples: number[] = [];

  public addSample(latencyMs: number): boolean {
    if (latencyMs < 0) {
      return false;
    }
    this.samples.push(latencyMs);
    return true;
  }

  public getSampleCount(): number {
    return this.samples.length;
  }

  public getAverage(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let sum: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      sum += this.samples[i];
    }
    return sum / this.samples.length;
  }

  public getMax(): number {
    let max: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i] > max) {
        max = this.samples[i];
      }
    }
    return max;
  }

  public isTimeout(latencyMs: number, thresholdMs: number): boolean {
    return latencyMs > thresholdMs;
  }

  public clear(): void {
    this.samples = [];
  }
}

// 发现调度器：按固定间隔安排下一次发现，支持指数退避
class DiscoveryScheduler {
  private intervalMs: number;
  private lastRunAt: number = 0;
  private runs: number = 0;

  constructor(intervalMs: number = 1000) {
    this.intervalMs = intervalMs;
  }

  public markRun(now: number): void {
    this.lastRunAt = now;
    this.runs++;
  }

  public isDue(now: number): boolean {
    if (this.lastRunAt === 0) {
      return true;
    }
    return now - this.lastRunAt >= this.intervalMs;
  }

  public getNextRunAt(): number {
    return this.lastRunAt + this.intervalMs;
  }

  public getRuns(): number {
    return this.runs;
  }

  public getIntervalMs(): number {
    return this.intervalMs;
  }

  public reset(): void {
    this.lastRunAt = 0;
    this.runs = 0;
  }
}

export default function miracastOfflineNetworkSuite(): void {
  describe('MiracastOfflineNetwork_Suite', () => {

    beforeAll(async () => {
      Log.info(TAG, 'offline network suite started');
    });

    afterAll(async () => {
      Log.info(TAG, 'offline network suite finished');
    });

    // ===== 网络状态组合 =====
    it('network_should_start_online', 0, async () => {
      const model = new NetworkStateModel();
      expect(model.isOnline()).assertTrue();
      expect(model.getState()).assertEqual(NetworkState.ONLINE);
      expect(model.getTransitionEvent()).assertNull();
      expect(model.isSoftbusAvailable()).assertTrue();
    });

    it('wifi_lost_should_degrade_network', 0, async () => {
      const model = new NetworkStateModel();
      model.onWifiLost();
      expect(model.isWifiAvailable()).assertFalse();
      expect(model.isOnline()).assertTrue();
      expect(model.getState()).assertEqual(NetworkState.DEGRADED);
      expect(model.getTransitionEvent()).assertEqual(NetworkTransitionEvent.DISCOVERY_TIMEOUT);
    });

    it('both_transports_lost_should_go_offline', 0, async () => {
      const model = new NetworkStateModel();
      model.onWifiLost();
      model.onSoftbusLost();
      expect(model.isOnline()).assertFalse();
      expect(model.getState()).assertEqual(NetworkState.OFFLINE);
      expect(model.getTransitionEvent()).assertEqual(NetworkTransitionEvent.WIFI_LOST);
    });

    it('offline_should_block_discovery', 0, async () => {
      const model = new NetworkStateModel();
      model.onWifiLost();
      model.onSoftbusLost();
      expect(model.startDiscovery()).assertFalse();
      expect(model.isDiscovering()).assertFalse();
    });

    it('online_should_allow_discovery', 0, async () => {
      const model = new NetworkStateModel();
      expect(model.startDiscovery()).assertTrue();
      expect(model.isDiscovering()).assertTrue();
      expect(model.getState()).assertEqual(NetworkState.DISCOVERING);
      model.stopDiscovery();
      expect(model.getState()).assertEqual(NetworkState.ONLINE);
    });

    it('wifi_restore_should_recover_state', 0, async () => {
      const model = new NetworkStateModel();
      model.onWifiLost();
      model.onWifiRestored();
      expect(model.isWifiAvailable()).assertTrue();
      expect(model.getState()).assertEqual(NetworkState.ONLINE);
    });

    it('full_offline_then_both_restored_should_be_online', 0, async () => {
      const model = new NetworkStateModel();
      model.onWifiLost();
      model.onSoftbusLost();
      model.onWifiRestored();
      expect(model.getState()).assertEqual(NetworkState.DEGRADED);
      model.onSoftbusRestored();
      expect(model.getState()).assertEqual(NetworkState.ONLINE);
      expect(model.isOnline()).assertTrue();
    });

    // ===== 发现超时 =====
    it('discovery_session_should_start_once', 0, async () => {
      const session = new DiscoverySession(1000);
      expect(session.start(1000)).assertTrue();
      expect(session.start(1100)).assertFalse();
      expect(session.isRunning()).assertTrue();
    });

    it('discovery_session_should_time_out_at_boundary', 0, async () => {
      const session = new DiscoverySession(1000);
      session.start(1000);
      expect(session.isTimedOut(1999)).assertFalse();
      expect(session.isTimedOut(2000)).assertTrue();
      expect(session.tick(2000)).assertFalse();
      expect(session.isRunning()).assertFalse();
    });

    it('discovery_session_restart_should_increment_counter', 0, async () => {
      const session = new DiscoverySession(1000);
      session.start(1000);
      session.restart(2000);
      expect(session.getRestarts()).assertEqual(1);
      expect(session.isRunning()).assertTrue();
      expect(session.getElapsed(2500)).assertEqual(500);
      expect(session.getTimeoutMs()).assertEqual(1000);
    });

    it('discovery_session_stop_should_prevent_tick', 0, async () => {
      const session = new DiscoverySession(1000);
      session.start(1000);
      session.stop();
      expect(session.isRunning()).assertFalse();
      expect(session.tick(1200)).assertFalse();
      expect(session.isTimedOut(3000)).assertFalse();
    });

    // ===== 退避策略 =====
    it('backoff_should_grow_exponentially', 0, async () => {
      const policy = new RetryBackoffPolicy(400, 3200, 5);
      expect(policy.getDelay(0)).assertEqual(0);
      expect(policy.getDelay(1)).assertEqual(400);
      expect(policy.getDelay(2)).assertEqual(800);
      expect(policy.getDelay(3)).assertEqual(1600);
      expect(policy.getBaseDelayMs()).assertEqual(400);
    });

    it('backoff_should_cap_at_max_delay', 0, async () => {
      const policy = new RetryBackoffPolicy(400, 3200, 8);
      expect(policy.getDelay(4)).assertEqual(3200);
      expect(policy.getDelay(6)).assertEqual(3200);
      expect(policy.getMaxDelayMs()).assertEqual(3200);
    });

    it('backoff_should_stop_at_max_attempts', 0, async () => {
      const policy = new RetryBackoffPolicy(400, 3200, 3);
      expect(policy.shouldRetry(2)).assertTrue();
      expect(policy.shouldRetry(3)).assertFalse();
      expect(policy.isExhausted(3)).assertTrue();
      expect(policy.isExhausted(2)).assertFalse();
      expect(policy.getMaxAttempts()).assertEqual(3);
    });

    // ===== 重试队列 =====
    it('retry_queue_should_enqueue_and_dequeue', 0, async () => {
      const queue = new RetryQueueManager();
      expect(queue.enqueue('dev-0001', 1, 1000)).assertTrue();
      expect(queue.size()).assertEqual(1);
      expect(queue.peekDeviceId()).assertEqual('dev-0001');
      const task = queue.dequeue();
      expect(task === null).assertFalse();
      if (task !== null) {
        expect(task.deviceId).assertEqual('dev-0001');
        expect(task.attempt).assertEqual(1);
        expect(task.scheduledAt).assertEqual(1000);
      }
    });

    it('retry_queue_should_reject_duplicate_device', 0, async () => {
      const queue = new RetryQueueManager();
      queue.enqueue('dev-0001', 1, 1000);
      expect(queue.enqueue('dev-0001', 2, 2000)).assertFalse();
      expect(queue.size()).assertEqual(1);
      expect(queue.getDropped()).assertEqual(0);
      queue.markDropped();
      expect(queue.getDropped()).assertEqual(1);
    });

    it('retry_queue_remove_should_allow_reenqueue', 0, async () => {
      const queue = new RetryQueueManager();
      queue.enqueue('dev-0001', 1, 1000);
      queue.enqueue('dev-0002', 1, 2000);
      expect(queue.remove('dev-0001')).assertTrue();
      expect(queue.size()).assertEqual(1);
      expect(queue.enqueue('dev-0001', 2, 3000)).assertTrue();
      expect(queue.size()).assertEqual(2);
    });

    // ===== 离线缓存 =====
    it('offline_cache_should_save_and_restore', 0, async () => {
      const cache = new OfflineCacheStore();
      cache.save(['dev-0001', 'dev-0002'], 1000);
      expect(cache.size()).assertEqual(2);
      const restored = cache.restore();
      expect(restored.length).assertEqual(2);
      expect(restored[0]).assertEqual('dev-0001');
      expect(cache.getCachedAt()).assertEqual(1000);
    });

    it('offline_cache_should_detect_staleness', 0, async () => {
      const cache = new OfflineCacheStore();
      cache.save(['dev-0001'], 1000);
      expect(cache.isStale(1500, 1000)).assertFalse();
      expect(cache.isStale(2000, 1000)).assertFalse();
      expect(cache.isStale(2001, 1000)).assertTrue();
    });

    // ===== 迁移日志 =====
    it('transition_logger_should_count_events', 0, async () => {
      const logger = new NetworkTransitionLogger();
      logger.record(NetworkTransitionEvent.WIFI_LOST, 1000);
      logger.record(NetworkTransitionEvent.RESTORED, 2000);
      logger.record(NetworkTransitionEvent.WIFI_LOST, 3000);
      expect(logger.getEventCount()).assertEqual(3);
      expect(logger.countByEvent(NetworkTransitionEvent.WIFI_LOST)).assertEqual(2);
      expect(logger.countByEvent(NetworkTransitionEvent.SOFTBUS_LOST)).assertEqual(0);
    });

    it('transition_logger_last_event_should_be_tracked', 0, async () => {
      const logger = new NetworkTransitionLogger();
      expect(logger.getLastEvent()).assertNull();
      logger.record(NetworkTransitionEvent.SOFTBUS_LOST, 1000);
      expect(logger.getLastEvent()).assertEqual(NetworkTransitionEvent.SOFTBUS_LOST);
      logger.record(NetworkTransitionEvent.RESTORED, 2000);
      expect(logger.getLastEvent()).assertEqual(NetworkTransitionEvent.RESTORED);
    });

    it('transition_logger_should_detect_out_of_order', 0, async () => {
      const logger = new NetworkTransitionLogger();
      logger.record(NetworkTransitionEvent.WIFI_LOST, 2000);
      logger.record(NetworkTransitionEvent.RESTORED, 1000);
      expect(logger.isMonotonic()).assertFalse();
      logger.clear();
      expect(logger.getEventCount()).assertEqual(0);
      expect(logger.isMonotonic()).assertTrue();
    });

    // ===== 消息顺序 =====
    it('message_order_should_accept_continuous_sequence', 0, async () => {
      const validator = new MessageOrderValidator();
      expect(validator.accept(0)).assertTrue();
      expect(validator.accept(1)).assertTrue();
      expect(validator.accept(2)).assertTrue();
      expect(validator.getExpected()).assertEqual(3);
      expect(validator.isContinuous()).assertTrue();
    });

    it('message_order_should_record_gaps', 0, async () => {
      const validator = new MessageOrderValidator();
      validator.accept(0);
      expect(validator.accept(3)).assertTrue();
      expect(validator.getGaps()).assertEqual(1);
      expect(validator.getExpected()).assertEqual(4);
      expect(validator.isContinuous()).assertFalse();
    });

    it('message_order_should_reject_duplicates', 0, async () => {
      const validator = new MessageOrderValidator();
      validator.accept(5);
      expect(validator.accept(5)).assertFalse();
      expect(validator.getDuplicates()).assertEqual(1);
      expect(validator.getExpected()).assertEqual(6);
    });

    it('message_order_reset_should_clear_counters', 0, async () => {
      const validator = new MessageOrderValidator();
      validator.accept(9);
      validator.accept(1);
      validator.reset();
      expect(validator.getExpected()).assertEqual(0);
      expect(validator.getGaps()).assertEqual(0);
      expect(validator.getDuplicates()).assertEqual(0);
      expect(validator.isContinuous()).assertTrue();
    });

    // ===== 网络统计 =====
    it('network_statistics_should_compute_offline_ratio', 0, async () => {
      const stats = new NetworkStatistics();
      const events: NetworkTransitionEvent[] = [
        NetworkTransitionEvent.WIFI_LOST,
        NetworkTransitionEvent.RESTORED,
        NetworkTransitionEvent.SOFTBUS_LOST,
        NetworkTransitionEvent.RESTORED
      ];
      expect(stats.getOfflineRatio(events)).assertEqual(0.5);
      expect(stats.getOfflineRatio([])).assertEqual(0);
    });

    it('network_statistics_should_compute_average_downtime', 0, async () => {
      const stats = new NetworkStatistics();
      expect(stats.getAverageDowntime([1000, 3000], [2000, 5000])).assertEqual(1500);
      expect(stats.getAverageDowntime([], [])).assertEqual(0);
      expect(stats.getAverageDowntime([1000], [2000, 3000])).assertEqual(0);
    });

    it('network_statistics_should_compute_longest_outage', 0, async () => {
      const stats = new NetworkStatistics();
      expect(stats.getLongestOutage([1000, 3000], [2000, 7000])).assertEqual(4000);
      expect(stats.getLongestOutage([], [])).assertEqual(0);
    });

    it('network_statistics_recovered_should_follow_last_event', 0, async () => {
      const stats = new NetworkStatistics();
      const logger = new NetworkTransitionLogger();
      logger.record(NetworkTransitionEvent.WIFI_LOST, 1000);
      expect(stats.isRecovered(logger)).assertFalse();
      logger.record(NetworkTransitionEvent.RESTORED, 2000);
      expect(stats.isRecovered(logger)).assertTrue();
    });

    // ===== 延迟估算 =====
    it('latency_estimator_should_compute_average_and_max', 0, async () => {
      const estimator = new NetworkLatencyEstimator();
      expect(estimator.addSample(100)).assertTrue();
      estimator.addSample(300);
      estimator.addSample(200);
      expect(estimator.getSampleCount()).assertEqual(3);
      expect(estimator.getAverage()).assertEqual(200);
      expect(estimator.getMax()).assertEqual(300);
    });

    it('latency_estimator_should_reject_negative_sample', 0, async () => {
      const estimator = new NetworkLatencyEstimator();
      expect(estimator.addSample(-1)).assertFalse();
      expect(estimator.getSampleCount()).assertEqual(0);
      expect(estimator.getAverage()).assertEqual(0);
      expect(estimator.getMax()).assertEqual(0);
    });

    it('latency_estimator_timeout_should_be_strict', 0, async () => {
      const estimator = new NetworkLatencyEstimator();
      expect(estimator.isTimeout(1000, 1000)).assertFalse();
      expect(estimator.isTimeout(1001, 1000)).assertTrue();
      estimator.clear();
      expect(estimator.getSampleCount()).assertEqual(0);
    });

    // ===== 发现调度 =====
    it('scheduler_should_run_immediately_when_fresh', 0, async () => {
      const scheduler = new DiscoveryScheduler(1000);
      expect(scheduler.isDue(0)).assertTrue();
      expect(scheduler.getRuns()).assertEqual(0);
      scheduler.markRun(1000);
      expect(scheduler.getRuns()).assertEqual(1);
      expect(scheduler.getNextRunAt()).assertEqual(2000);
    });

    it('scheduler_should_respect_interval', 0, async () => {
      const scheduler = new DiscoveryScheduler(1000);
      scheduler.markRun(1000);
      expect(scheduler.isDue(1999)).assertFalse();
      expect(scheduler.isDue(2000)).assertTrue();
      expect(scheduler.getIntervalMs()).assertEqual(1000);
    });

    it('scheduler_reset_should_clear_runs', 0, async () => {
      const scheduler = new DiscoveryScheduler(500);
      scheduler.markRun(1000);
      scheduler.reset();
      expect(scheduler.getRuns()).assertEqual(0);
      expect(scheduler.isDue(1000)).assertTrue();
      expect(scheduler.getNextRunAt()).assertEqual(500);
    });

    it('offline_and_retry_flow_should_converge', 0, async () => {
      const model = new NetworkStateModel();
      const policy = new RetryBackoffPolicy(400, 3200, 3);
      const queue = new RetryQueueManager();
      model.onWifiLost();
      model.onSoftbusLost();
      expect(model.startDiscovery()).assertFalse();
      expect(queue.enqueue('dev-0001', 1, 1000)).assertTrue();
      expect(policy.getDelay(1)).assertEqual(400);
      expect(policy.shouldRetry(1)).assertTrue();
      model.onWifiRestored();
      model.onSoftbusRestored();
      expect(model.getState()).assertEqual(NetworkState.ONLINE);
      expect(queue.dequeue() === null).assertFalse();
      expect(queue.size()).assertEqual(0);
    });

    it('discovery_timeout_then_restart_should_recover', 0, async () => {
      const session = new DiscoverySession(1000);
      const logger = new NetworkTransitionLogger();
      session.start(1000);
      expect(session.tick(2000)).assertFalse();
      logger.record(NetworkTransitionEvent.DISCOVERY_TIMEOUT, 2000);
      session.restart(2100);
      expect(logger.countByEvent(NetworkTransitionEvent.DISCOVERY_TIMEOUT)).assertEqual(1);
      expect(session.getRestarts()).assertEqual(1);
      expect(session.tick(2200)).assertTrue();
    });

    it('network_state_discovery_stop_should_return_to_online', 0, async () => {
      const model = new NetworkStateModel();
      model.onWifiLost();
      expect(model.startDiscovery()).assertTrue();
      expect(model.getState()).assertEqual(NetworkState.DISCOVERING);
      model.stopDiscovery();
      expect(model.getState()).assertEqual(NetworkState.DEGRADED);
      expect(model.isDiscovering()).assertFalse();
    });

    it('discovery_session_zero_timeout_should_expire_immediately', 0, async () => {
      const session = new DiscoverySession(0);
      session.start(1000);
      expect(session.isTimedOut(1000)).assertTrue();
      expect(session.tick(1000)).assertFalse();
      expect(session.getTimeoutMs()).assertEqual(0);
    });
  });
}
