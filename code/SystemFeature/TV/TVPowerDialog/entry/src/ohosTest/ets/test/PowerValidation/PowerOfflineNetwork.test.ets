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
  KEY_BACK,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../Shared/SharedDriver';

// 网络状态枚举
enum NetworkState {
  ONLINE = 'online', OFFLINE = 'offline', WEAK = 'weak', AIRPLANE = 'airplane'
}

// 网络状态模型：管理网络状态、离线操作、重试队列与消息顺序
class NetworkStateModel {
  private state: NetworkState = NetworkState.ONLINE;
  private offlineOps: string[] = [];
  private retryCount: number = 0;
  private maxRetry: number = 3;
  private messageQueue: string[] = [];

  public setState(state: NetworkState): void {
    this.state = state;
  }

  public getState(): NetworkState {
    return this.state;
  }

  public isOffline(): boolean {
    return this.state === NetworkState.OFFLINE || this.state === NetworkState.AIRPLANE;
  }

  public isWeak(): boolean {
    return this.state === NetworkState.WEAK;
  }

  public isOnline(): boolean {
    return this.state === NetworkState.ONLINE;
  }

  public canOperateLocally(): boolean {
    return true;
  }

  public recordOfflineOperation(name: string): void {
    this.offlineOps.push(name);
  }

  public getOfflineOperations(): string[] {
    return [...this.offlineOps];
  }

  public recoverNetwork(): void {
    this.state = NetworkState.ONLINE;
  }

  public enqueueMessage(content: string): void {
    this.messageQueue.push(content);
  }

  public getMessageQueue(): string[] {
    return [...this.messageQueue];
  }

  public getQueueLength(): number {
    return this.messageQueue.length;
  }

  public retry(): boolean {
    if (this.retryCount >= this.maxRetry) {
      return false;
    }
    this.retryCount++;
    return true;
  }

  public getRetryCount(): number {
    return this.retryCount;
  }

  public resetRetry(): void {
    this.retryCount = 0;
  }
}

// 网络状态迁移事件枚举：描述网络状态切换过程中产生的事件类型
enum NetworkTransitionEvent {
  TRANSITION_ONLINE_TO_OFFLINE = 'online_to_offline', TRANSITION_OFFLINE_TO_ONLINE = 'offline_to_online', TRANSITION_ONLINE_TO_WEAK = 'online_to_weak', TRANSITION_WEAK_TO_ONLINE = 'weak_to_online', TRANSITION_TO_AIRPLANE = 'to_airplane'
}

// 离线同步优先级枚举：描述离线任务恢复同步时的优先级
enum OfflineSyncPriority {
  SYNC_LOW = 0, SYNC_NORMAL = 1, SYNC_HIGH = 2
}

// 离线同步任务接口：描述一个待同步的离线任务
interface OfflineSyncTask {
  taskId: string;
  operationName: string;
  priority: number;
  retries: number;
  synced: boolean;
}

// 离线缓存仓库：管理离线操作的缓存、同步标记与清空
class OfflineCacheStore {
  private tasks: OfflineSyncTask[] = [];

  public addTask(operationName: string, priority: number): void {
    const taskId = `task_${this.tasks.length}`;
    this.tasks.push({
      taskId,
      operationName,
      priority,
      retries: 0,
      synced: false
    });
  }

  public getTasks(): OfflineSyncTask[] {
    return [...this.tasks];
  }

  public getTaskCount(): number {
    return this.tasks.length;
  }

  public getSyncedCount(): number {
    return this.tasks.filter(task => task.synced).length;
  }

  public getPendingCount(): number {
    return this.tasks.filter(task => !task.synced).length;
  }

  public markSynced(taskId: string): boolean {
    const task = this.tasks.find(item => item.taskId === taskId);
    if (task === undefined) {
      return false;
    }
    task.synced = true;
    return true;
  }

  public incrementRetry(taskId: string): boolean {
    const task = this.tasks.find(item => item.taskId === taskId);
    if (task === undefined) {
      return false;
    }
    task.retries++;
    return true;
  }

  public getTasksByPriority(priority: number): OfflineSyncTask[] {
    return this.tasks.filter(task => task.priority === priority);
  }

  public clear(): void {
    this.tasks = [];
  }
}

// 重试队列管理器：基于指数退避策略管理重试次数与退避间隔
class RetryQueueManager {
  private retryCounts: Map<string, number> = new Map<string, number>();
  private maxRetry: number = 3;
  private baseBackoffMs: number = 100;

  public setMaxRetry(maxRetry: number): void {
    this.maxRetry = maxRetry;
  }

  public getMaxRetry(): number {
    return this.maxRetry;
  }

  public setBaseBackoffMs(baseBackoffMs: number): void {
    this.baseBackoffMs = baseBackoffMs;
  }

  public getBaseBackoffMs(): number {
    return this.baseBackoffMs;
  }

  public registerTask(taskId: string): void {
    if (!this.retryCounts.has(taskId)) {
      this.retryCounts.set(taskId, 0);
    }
  }

  public canRetry(taskId: string): boolean {
    const count = this.retryCounts.get(taskId);
    if (count === undefined) {
      return false;
    }
    return count < this.maxRetry;
  }

  public recordRetry(taskId: string): boolean {
    if (!this.canRetry(taskId)) {
      return false;
    }
    const count = this.retryCounts.get(taskId);
    this.retryCounts.set(taskId, (count === undefined ? 0 : count) + 1);
    return true;
  }

  public getBackoffMs(taskId: string): number {
    const count = this.retryCounts.get(taskId);
    if (count === undefined) {
      return 0;
    }
    return this.baseBackoffMs * Math.pow(2, count);
  }

  public getRetryCount(taskId: string): number {
    const count = this.retryCounts.get(taskId);
    return count === undefined ? 0 : count;
  }

  public resetTask(taskId: string): void {
    this.retryCounts.set(taskId, 0);
  }

  public clear(): void {
    this.retryCounts.clear();
  }
}

// 网络状态迁移日志器：记录网络状态切换历史并支持回放校验
class NetworkTransitionLogger {
  private transitions: NetworkTransitionEvent[] = [];

  public logTransition(event: NetworkTransitionEvent): void {
    this.transitions.push(event);
  }

  public getTransitions(): NetworkTransitionEvent[] {
    return [...this.transitions];
  }

  public getTransitionCount(): number {
    return this.transitions.length;
  }

  public hasTransition(event: NetworkTransitionEvent): boolean {
    return this.transitions.includes(event);
  }

  public countTransition(event: NetworkTransitionEvent): number {
    return this.transitions.filter(item => item === event).length;
  }

  public getLastTransition(): NetworkTransitionEvent | null {
    if (this.transitions.length === 0) {
      return null;
    }
    return this.transitions[this.transitions.length - 1];
  }

  public clear(): void {
    this.transitions = [];
  }
}

// 消息顺序校验器：校验消息队列是否保持严格顺序并检测重复
class MessageOrderValidator {
  private queue: string[] = [];

  public enqueue(content: string): void {
    this.queue.push(content);
  }

  public getQueue(): string[] {
    return [...this.queue];
  }

  public isOrdered(): boolean {
    for (let i = 1; i < this.queue.length; i++) {
      if (this.queue[i] < this.queue[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public hasDuplicates(): boolean {
    const seen: Set<string> = new Set<string>();
    for (let i = 0; i < this.queue.length; i++) {
      if (seen.has(this.queue[i])) {
        return true;
      }
      seen.add(this.queue[i]);
    }
    return false;
  }

  public getDistinctCount(): number {
    const seen: Set<string> = new Set<string>();
    this.queue.forEach(item => seen.add(item));
    return seen.size;
  }

  public clear(): void {
    this.queue = [];
  }
}

// 网络统计器：对网络状态模型的运行指标进行聚合统计
class NetworkStatistics {
  private offlineCount: number = 0;
  private onlineCount: number = 0;
  private weakCount: number = 0;
  private transitionCount: number = 0;

  public recordState(state: NetworkState): void {
    if (state === NetworkState.OFFLINE || state === NetworkState.AIRPLANE) {
      this.offlineCount++;
    } else if (state === NetworkState.WEAK) {
      this.weakCount++;
    } else {
      this.onlineCount++;
    }
  }

  public recordTransition(): void {
    this.transitionCount++;
  }

  public getOfflineCount(): number {
    return this.offlineCount;
  }

  public getOnlineCount(): number {
    return this.onlineCount;
  }

  public getWeakCount(): number {
    return this.weakCount;
  }

  public getTransitionCount(): number {
    return this.transitionCount;
  }

  public getTotalRecorded(): number {
    return this.offlineCount + this.onlineCount + this.weakCount;
  }

  public getOnlineRatio(): number {
    const total = this.getTotalRecorded();
    if (total === 0) {
      return 0;
    }
    return this.onlineCount / total;
  }

  public reset(): void {
    this.offlineCount = 0;
    this.onlineCount = 0;
    this.weakCount = 0;
    this.transitionCount = 0;
  }
}

// 网络延迟估算器：基于往返采样估算网络延迟等级
class NetworkLatencyEstimator {
  private samples: number[] = [];

  public recordLatency(latencyMs: number): void {
    this.samples.push(latencyMs);
  }

  public getSampleCount(): number {
    return this.samples.length;
  }

  public getAverageLatency(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let sum = 0;
    this.samples.forEach((sample: number) => sum += sample);
    return sum / this.samples.length;
  }

  public getMaxLatency(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let max = 0;
    this.samples.forEach((sample: number) => {
      if (sample > max) {
        max = sample;
      }
    });
    return max;
  }

  public classifyNetwork(): NetworkState {
    const average = this.getAverageLatency();
    if (average <= 100) {
      return NetworkState.ONLINE;
    }
    if (average <= 500) {
      return NetworkState.WEAK;
    }
    return NetworkState.OFFLINE;
  }

  public clear(): void {
    this.samples = [];
  }
}

// 离线同步调度器：按优先级调度离线任务进行同步
class OfflineSyncScheduler {
  private tasks: OfflineSyncTask[] = [];

  public addTask(task: OfflineSyncTask): void {
    this.tasks.push(task);
  }

  public getPendingTasks(): OfflineSyncTask[] {
    return this.tasks.filter((task: OfflineSyncTask) => !task.synced);
  }

  public getPendingCount(): number {
    return this.getPendingTasks().length;
  }

  public sortByPriority(): OfflineSyncTask[] {
    return [...this.tasks].sort((a: OfflineSyncTask, b: OfflineSyncTask) => b.priority - a.priority);
  }

  public syncNext(): OfflineSyncTask | null {
    const pending = this.sortByPriority().filter((task: OfflineSyncTask) => !task.synced);
    if (pending.length === 0) {
      return null;
    }
    pending[0].synced = true;
    return pending[0];
  }

  public getHighestPendingPriority(): number {
    const pending = this.getPendingTasks();
    if (pending.length === 0) {
      return -1;
    }
    let highest = pending[0].priority;
    pending.forEach((task: OfflineSyncTask) => {
      if (task.priority > highest) {
        highest = task.priority;
      }
    });
    return highest;
  }

  public clear(): void {
    this.tasks = [];
  }
}

export default function powerOfflineNetworkTest() {
  describe('PowerOfflineNetwork_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    it('offline_state_should_be_detected', 0, async () => {
      const model = new NetworkStateModel();
      model.setState(NetworkState.OFFLINE);
      expect(model.isOffline()).assertTrue();
    });

    it('airplane_mode_should_be_treated_as_offline', 0, async () => {
      const model = new NetworkStateModel();
      model.setState(NetworkState.AIRPLANE);
      expect(model.isOffline()).assertTrue();
    });

    it('local_operation_should_work_when_offline', 0, async () => {
      const model = new NetworkStateModel();
      model.setState(NetworkState.OFFLINE);
      expect(model.canOperateLocally()).assertTrue();
    });

    it('offline_operations_should_be_recorded', 0, async () => {
      const model = new NetworkStateModel();
      model.setState(NetworkState.OFFLINE);
      model.recordOfflineOperation('关机');
      model.recordOfflineOperation('重启');
      expect(model.getOfflineOperations().length).assertEqual(2);
    });

    it('weak_network_state_should_be_detected', 0, async () => {
      const model = new NetworkStateModel();
      model.setState(NetworkState.WEAK);
      expect(model.isWeak()).assertTrue();
      expect(model.isOffline()).assertFalse();
    });

    it('network_recovery_should_restore_online_state', 0, async () => {
      const model = new NetworkStateModel();
      model.setState(NetworkState.OFFLINE);
      model.recoverNetwork();
      expect(model.isOnline()).assertTrue();
      expect(model.isOffline()).assertFalse();
    });

    it('default_state_should_be_online', 0, async () => {
      const model = new NetworkStateModel();
      expect(model.getState()).assertEqual(NetworkState.ONLINE);
    });

    it('offline_operation_should_not_be_lost_after_recovery', 0, async () => {
      const model = new NetworkStateModel();
      model.setState(NetworkState.OFFLINE);
      model.recordOfflineOperation('熄屏');
      model.recoverNetwork();
      expect(model.getOfflineOperations().length).assertEqual(1);
    });

    it('network_state_switch_should_be_stable', 0, async () => {
      const model = new NetworkStateModel();
      model.setState(NetworkState.OFFLINE);
      model.setState(NetworkState.WEAK);
      model.setState(NetworkState.ONLINE);
      expect(model.getState()).assertEqual(NetworkState.ONLINE);
    });

    it('message_order_should_be_preserved', 0, async () => {
      const model = new NetworkStateModel();
      model.enqueueMessage('第一条');
      model.enqueueMessage('第二条');
      model.enqueueMessage('第三条');
      const queue = model.getMessageQueue();
      expect(queue[0]).assertEqual('第一条');
      expect(queue[1]).assertEqual('第二条');
      expect(queue[2]).assertEqual('第三条');
    });

    it('retry_should_be_limited_to_max_attempts', 0, async () => {
      const model = new NetworkStateModel();
      expect(model.retry()).assertTrue();
      expect(model.retry()).assertTrue();
      expect(model.retry()).assertTrue();
      expect(model.retry()).assertFalse();
      expect(model.getRetryCount()).assertEqual(3);
    });

    it('reset_retry_should_clear_retry_count', 0, async () => {
      const model = new NetworkStateModel();
      model.retry();
      model.retry();
      model.resetRetry();
      expect(model.getRetryCount()).assertEqual(0);
    });

    it('airplane_then_recover_should_work', 0, async () => {
      const model = new NetworkStateModel();
      model.setState(NetworkState.AIRPLANE);
      expect(model.isOffline()).assertTrue();
      model.recoverNetwork();
      expect(model.isOnline()).assertTrue();
    });

    it('weak_then_offline_should_work', 0, async () => {
      const model = new NetworkStateModel();
      model.setState(NetworkState.WEAK);
      model.setState(NetworkState.OFFLINE);
      expect(model.isOffline()).assertTrue();
      expect(model.isWeak()).assertFalse();
    });

    it('queue_length_should_track_messages', 0, async () => {
      const model = new NetworkStateModel();
      model.enqueueMessage('a');
      model.enqueueMessage('b');
      expect(model.getQueueLength()).assertEqual(2);
    });

    it('multiple_offline_ops_should_be_recorded', 0, async () => {
      const model = new NetworkStateModel();
      model.setState(NetworkState.OFFLINE);
      model.recordOfflineOperation('熄屏');
      model.recordOfflineOperation('关机');
      model.recordOfflineOperation('重启');
      expect(model.getOfflineOperations().length).assertEqual(3);
    });

    it('full_state_cycle_should_be_stable', 0, async () => {
      const model = new NetworkStateModel();
      model.setState(NetworkState.OFFLINE);
      model.setState(NetworkState.AIRPLANE);
      model.setState(NetworkState.WEAK);
      model.recoverNetwork();
      expect(model.isOnline()).assertTrue();
    });

    it('recover_from_weak_should_be_online', 0, async () => {
      const model = new NetworkStateModel();
      model.setState(NetworkState.WEAK);
      model.recoverNetwork();
      expect(model.isOnline()).assertTrue();
    });

    it('local_operation_should_always_work', 0, async () => {
      const model = new NetworkStateModel();
      model.setState(NetworkState.OFFLINE);
      expect(model.canOperateLocally()).assertTrue();
      model.recoverNetwork();
      expect(model.canOperateLocally()).assertTrue();
    });

    it('offline_ops_empty_initially', 0, async () => {
      const model = new NetworkStateModel();
      expect(model.getOfflineOperations().length).assertEqual(0);
    });

    it('enqueue_then_recover_keeps_queue', 0, async () => {
      const model = new NetworkStateModel();
      model.enqueueMessage('m1');
      model.recoverNetwork();
      expect(model.getQueueLength()).assertEqual(1);
    });

    it('retry_after_reset_restarts', 0, async () => {
      const model = new NetworkStateModel();
      model.retry();
      model.resetRetry();
      expect(model.getRetryCount()).assertEqual(0);
      expect(model.retry()).assertTrue();
    });

    it('is_offline_for_weak_is_false', 0, async () => {
      const model = new NetworkStateModel();
      model.setState(NetworkState.WEAK);
      expect(model.isOffline()).assertFalse();
    });

    it('is_online_after_default', 0, async () => {
      const model = new NetworkStateModel();
      expect(model.isOnline()).assertTrue();
    });

    it('state_set_same_is_stable', 0, async () => {
      const model = new NetworkStateModel();
      model.setState(NetworkState.ONLINE);
      expect(model.getState()).assertEqual(NetworkState.ONLINE);
    });

    it('queue_order_multi_preserved', 0, async () => {
      const model = new NetworkStateModel();
      model.enqueueMessage('a');
      model.enqueueMessage('b');
      model.enqueueMessage('c');
      const queue = model.getMessageQueue();
      expect(queue[2]).assertEqual('c');
    });

    it('recover_from_airplane_is_online', 0, async () => {
      const model = new NetworkStateModel();
      model.setState(NetworkState.AIRPLANE);
      model.recoverNetwork();
      expect(model.isOnline()).assertTrue();
    });

    it('can_operate_in_all_states', 0, async () => {
      const model = new NetworkStateModel();
      model.setState(NetworkState.OFFLINE);
      expect(model.canOperateLocally()).assertTrue();
      model.setState(NetworkState.WEAK);
      expect(model.canOperateLocally()).assertTrue();
      model.setState(NetworkState.AIRPLANE);
      expect(model.canOperateLocally()).assertTrue();
    });

    it('retry_zero_initially', 0, async () => {
      const model = new NetworkStateModel();
      expect(model.getRetryCount()).assertEqual(0);
    });

    it('offline_ops_persist_after_weak', 0, async () => {
      const model = new NetworkStateModel();
      model.setState(NetworkState.OFFLINE);
      model.recordOfflineOperation('关机');
      model.setState(NetworkState.WEAK);
      expect(model.getOfflineOperations().length).assertEqual(1);
    });

    // 适配 OfflineCacheStore：任务添加与统计
    it('offline_cache_should_add_and_track_tasks', 0, async () => {
      const store = new OfflineCacheStore();
      store.addTask('关机', OfflineSyncPriority.SYNC_HIGH);
      store.addTask('重启', OfflineSyncPriority.SYNC_NORMAL);
      expect(store.getTaskCount()).assertEqual(2);
      expect(store.getPendingCount()).assertEqual(2);
      expect(store.getSyncedCount()).assertEqual(0);
    });

    // 适配 OfflineCacheStore：任务同步标记
    it('offline_cache_should_mark_synced', 0, async () => {
      const store = new OfflineCacheStore();
      store.addTask('关机', OfflineSyncPriority.SYNC_HIGH);
      const tasks = store.getTasks();
      expect(store.markSynced(tasks[0].taskId)).assertTrue();
      expect(store.getSyncedCount()).assertEqual(1);
      expect(store.getPendingCount()).assertEqual(0);
    });

    // 适配 OfflineCacheStore：同步不存在的任务应返回 false
    it('offline_cache_should_reject_unknown_task', 0, async () => {
      const store = new OfflineCacheStore();
      expect(store.markSynced('ghost')).assertFalse();
      expect(store.incrementRetry('ghost')).assertFalse();
    });

    // 适配 OfflineCacheStore：按优先级过滤任务
    it('offline_cache_should_filter_by_priority', 0, async () => {
      const store = new OfflineCacheStore();
      store.addTask('关机', OfflineSyncPriority.SYNC_HIGH);
      store.addTask('熄屏', OfflineSyncPriority.SYNC_LOW);
      store.addTask('重启', OfflineSyncPriority.SYNC_HIGH);
      const highTasks = store.getTasksByPriority(OfflineSyncPriority.SYNC_HIGH);
      expect(highTasks.length).assertEqual(2);
    });

    // 适配 RetryQueueManager：重试次数限制
    it('retry_queue_should_limit_retry_attempts', 0, async () => {
      const manager = new RetryQueueManager();
      manager.registerTask('t1');
      expect(manager.canRetry('t1')).assertTrue();
      manager.recordRetry('t1');
      manager.recordRetry('t1');
      manager.recordRetry('t1');
      expect(manager.canRetry('t1')).assertFalse();
      expect(manager.recordRetry('t1')).assertFalse();
    });

    // 适配 RetryQueueManager：退避间隔指数增长
    it('retry_queue_backoff_should_grow_exponentially', 0, async () => {
      const manager = new RetryQueueManager();
      manager.setBaseBackoffMs(100);
      manager.registerTask('t1');
      manager.recordRetry('t1');
      manager.recordRetry('t1');
      expect(manager.getBackoffMs('t1')).assertEqual(400);
    });

    // 适配 RetryQueueManager：任务重试计数重置
    it('retry_queue_should_reset_task', 0, async () => {
      const manager = new RetryQueueManager();
      manager.registerTask('t1');
      manager.recordRetry('t1');
      manager.recordRetry('t1');
      manager.resetTask('t1');
      expect(manager.getRetryCount('t1')).assertEqual(0);
    });

    // 适配 NetworkTransitionLogger：迁移事件统计
    it('transition_logger_should_count_events', 0, async () => {
      const logger = new NetworkTransitionLogger();
      logger.logTransition(NetworkTransitionEvent.TRANSITION_ONLINE_TO_OFFLINE);
      logger.logTransition(NetworkTransitionEvent.TRANSITION_OFFLINE_TO_ONLINE);
      logger.logTransition(NetworkTransitionEvent.TRANSITION_ONLINE_TO_OFFLINE);
      expect(logger.getTransitionCount()).assertEqual(3);
      expect(logger.countTransition(NetworkTransitionEvent.TRANSITION_ONLINE_TO_OFFLINE)).assertEqual(2);
      expect(logger.hasTransition(NetworkTransitionEvent.TRANSITION_OFFLINE_TO_ONLINE)).assertTrue();
    });

    // 适配 NetworkTransitionLogger：最近迁移事件
    it('transition_logger_should_return_last_event', 0, async () => {
      const logger = new NetworkTransitionLogger();
      expect(logger.getLastTransition()).assertEqual(null);
      logger.logTransition(NetworkTransitionEvent.TRANSITION_ONLINE_TO_WEAK);
      logger.logTransition(NetworkTransitionEvent.TRANSITION_WEAK_TO_ONLINE);
      expect(logger.getLastTransition()).assertEqual(NetworkTransitionEvent.TRANSITION_WEAK_TO_ONLINE);
    });

    // 适配 MessageOrderValidator：重复消息检测
    it('message_order_validator_should_detect_duplicates', 0, async () => {
      const validator = new MessageOrderValidator();
      validator.enqueue('a');
      validator.enqueue('b');
      validator.enqueue('a');
      expect(validator.hasDuplicates()).assertTrue();
      expect(validator.getDistinctCount()).assertEqual(2);
    });

    // 适配 MessageOrderValidator：消息顺序校验
    it('message_order_validator_should_check_ordering', 0, async () => {
      const validator = new MessageOrderValidator();
      validator.enqueue('a');
      validator.enqueue('b');
      validator.enqueue('c');
      expect(validator.isOrdered()).assertTrue();
      const validator2 = new MessageOrderValidator();
      validator2.enqueue('c');
      validator2.enqueue('a');
      expect(validator2.isOrdered()).assertFalse();
    });

    // 适配 NetworkStatistics：状态计数聚合
    it('network_statistics_should_accumulate_counts', 0, async () => {
      const stats = new NetworkStatistics();
      stats.recordState(NetworkState.ONLINE);
      stats.recordState(NetworkState.OFFLINE);
      stats.recordState(NetworkState.AIRPLANE);
      stats.recordState(NetworkState.WEAK);
      stats.recordTransition();
      expect(stats.getOnlineCount()).assertEqual(1);
      expect(stats.getOfflineCount()).assertEqual(2);
      expect(stats.getWeakCount()).assertEqual(1);
      expect(stats.getTransitionCount()).assertEqual(1);
      expect(stats.getTotalRecorded()).assertEqual(4);
    });

    // 适配 NetworkLatencyEstimator：网络质量分级
    it('latency_estimator_should_classify_network', 0, async () => {
      const estimator = new NetworkLatencyEstimator();
      estimator.recordLatency(50);
      estimator.recordLatency(100);
      expect(estimator.classifyNetwork()).assertEqual(NetworkState.ONLINE);
      estimator.clear();
      estimator.recordLatency(300);
      expect(estimator.classifyNetwork()).assertEqual(NetworkState.WEAK);
      estimator.clear();
      estimator.recordLatency(600);
      expect(estimator.classifyNetwork()).assertEqual(NetworkState.OFFLINE);
    });

    // 适配 NetworkLatencyEstimator：平均与最大延迟
    it('latency_estimator_should_compute_avg_max', 0, async () => {
      const estimator = new NetworkLatencyEstimator();
      estimator.recordLatency(100);
      estimator.recordLatency(300);
      estimator.recordLatency(500);
      expect(estimator.getAverageLatency()).assertEqual(300);
      expect(estimator.getMaxLatency()).assertEqual(500);
      expect(estimator.getSampleCount()).assertEqual(3);
    });

    // 适配 OfflineSyncScheduler：按优先级调度同步
    it('sync_scheduler_should_sync_highest_priority', 0, async () => {
      const scheduler = new OfflineSyncScheduler();
      scheduler.addTask({ taskId: 't1', operationName: '关机', priority: OfflineSyncPriority.SYNC_LOW, retries: 0, synced: false });
      scheduler.addTask({ taskId: 't2', operationName: '重启', priority: OfflineSyncPriority.SYNC_HIGH, retries: 0, synced: false });
      expect(scheduler.getPendingCount()).assertEqual(2);
      const next = scheduler.syncNext();
      expect(next === null).assertFalse();
      if (next !== null) {
        expect(next.taskId).assertEqual('t2');
      }
      expect(scheduler.getPendingCount()).assertEqual(1);
    });
  });
}
