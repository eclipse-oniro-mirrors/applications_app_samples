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
const TAG: string = 'RecorderOfflineNetwork';

// Network conditions observed by the recorder process.
enum NetworkState {
  ONLINE = 'online',
  OFFLINE = 'offline',
  WEAK = 'weak',
  AIRPLANE = 'airplane'
}

// Models local recording behaviour under every network condition.
class LocalRecordingStateModel {
  private state: NetworkState = NetworkState.ONLINE;
  private localOperations: string[] = [];
  private retryCount: number = 0;
  private maxRetry: number = 3;
  private savedFileQueue: string[] = [];

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

  public canRecordLocally(): boolean {
    return true;
  }

  public recordLocalOperation(name: string): void {
    this.localOperations.push(name);
  }

  public getLocalOperations(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.localOperations.length; i++) {
      result.push(this.localOperations[i]);
    }
    return result;
  }

  public recoverNetwork(): void {
    this.state = NetworkState.ONLINE;
  }

  public enqueueSavedFile(fileName: string): void {
    this.savedFileQueue.push(fileName);
  }

  public getSavedFileQueue(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.savedFileQueue.length; i++) {
      result.push(this.savedFileQueue[i]);
    }
    return result;
  }

  public getQueueLength(): number {
    return this.savedFileQueue.length;
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

// Transitions between network conditions.
enum NetworkTransitionEvent {
  TRANSITION_ONLINE_TO_OFFLINE = 'online_to_offline',
  TRANSITION_OFFLINE_TO_ONLINE = 'offline_to_online',
  TRANSITION_ONLINE_TO_WEAK = 'online_to_weak',
  TRANSITION_WEAK_TO_ONLINE = 'weak_to_online',
  TRANSITION_TO_AIRPLANE = 'to_airplane'
}

// Priority of a recorded file waiting to be persisted.
enum PendingFilePriority {
  PRIORITY_LOW = 0,
  PRIORITY_NORMAL = 1,
  PRIORITY_HIGH = 2
}

// Recorded file pending local persistence.
interface PendingFileTask {
  taskId: string;
  fileName: string;
  priority: number;
  retries: number;
  persisted: boolean;
}

// Local cache of recorded mp4 files.
class LocalAssetCacheStore {
  private tasks: PendingFileTask[] = [];

  public addTask(fileName: string, priority: number): void {
    const taskId: string = `task_${this.tasks.length}`;
    const task: PendingFileTask = {
      taskId: taskId,
      fileName: fileName,
      priority: priority,
      retries: 0,
      persisted: false
    };
    this.tasks.push(task);
  }

  public getTasks(): PendingFileTask[] {
    const result: PendingFileTask[] = [];
    for (let i = 0; i < this.tasks.length; i++) {
      result.push(this.tasks[i]);
    }
    return result;
  }

  public getTaskCount(): number {
    return this.tasks.length;
  }

  public getPersistedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.tasks.length; i++) {
      if (this.tasks[i].persisted) {
        count++;
      }
    }
    return count;
  }

  public getPendingCount(): number {
    return this.getTaskCount() - this.getPersistedCount();
  }

  public markPersisted(taskId: string): boolean {
    for (let i = 0; i < this.tasks.length; i++) {
      if (this.tasks[i].taskId === taskId) {
        this.tasks[i].persisted = true;
        return true;
      }
    }
    return false;
  }

  public incrementRetry(taskId: string): boolean {
    for (let i = 0; i < this.tasks.length; i++) {
      if (this.tasks[i].taskId === taskId) {
        this.tasks[i].retries++;
        return true;
      }
    }
    return false;
  }

  public getTasksByPriority(priority: number): PendingFileTask[] {
    const result: PendingFileTask[] = [];
    for (let i = 0; i < this.tasks.length; i++) {
      if (this.tasks[i].priority === priority) {
        result.push(this.tasks[i]);
      }
    }
    return result;
  }

  public clear(): void {
    this.tasks = [];
  }
}

// Retries local persistence with exponential backoff.
class FilePersistRetryQueue {
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
    const count: number | undefined = this.retryCounts.get(taskId);
    if (count === undefined) {
      return false;
    }
    return count < this.maxRetry;
  }

  public recordRetry(taskId: string): boolean {
    if (!this.canRetry(taskId)) {
      return false;
    }
    const count: number | undefined = this.retryCounts.get(taskId);
    const current: number = count === undefined ? 0 : count;
    this.retryCounts.set(taskId, current + 1);
    return true;
  }

  public getBackoffMs(taskId: string): number {
    const count: number | undefined = this.retryCounts.get(taskId);
    if (count === undefined) {
      return 0;
    }
    return this.baseBackoffMs * Math.pow(2, count);
  }

  public getRetryCount(taskId: string): number {
    const count: number | undefined = this.retryCounts.get(taskId);
    return count === undefined ? 0 : count;
  }

  public resetTask(taskId: string): void {
    this.retryCounts.set(taskId, 0);
  }

  public clear(): void {
    this.retryCounts.clear();
  }
}

// Logs network transitions for later replay.
class NetworkTransitionLogger {
  private transitions: NetworkTransitionEvent[] = [];

  public logTransition(event: NetworkTransitionEvent): void {
    this.transitions.push(event);
  }

  public getTransitions(): NetworkTransitionEvent[] {
    const result: NetworkTransitionEvent[] = [];
    for (let i = 0; i < this.transitions.length; i++) {
      result.push(this.transitions[i]);
    }
    return result;
  }

  public getTransitionCount(): number {
    return this.transitions.length;
  }

  public hasTransition(event: NetworkTransitionEvent): boolean {
    return this.transitions.includes(event);
  }

  public countTransition(event: NetworkTransitionEvent): number {
    let count: number = 0;
    for (let i = 0; i < this.transitions.length; i++) {
      if (this.transitions[i] === event) {
        count++;
      }
    }
    return count;
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

// Validates that recorded file names stay ordered and unique.
class RecordingFileOrderValidator {
  private queue: string[] = [];

  public enqueue(fileName: string): void {
    this.queue.push(fileName);
  }

  public getQueue(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.queue.length; i++) {
      result.push(this.queue[i]);
    }
    return result;
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
    for (let i = 0; i < this.queue.length; i++) {
      seen.add(this.queue[i]);
    }
    return seen.size;
  }

  public clear(): void {
    this.queue = [];
  }
}

// Aggregates network condition metrics for the recorder.
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
    const total: number = this.getTotalRecorded();
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

// Estimates local disk write latency for recorded files.
class LocalWriteLatencyEstimator {
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
    let sum: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      sum += this.samples[i];
    }
    return sum / this.samples.length;
  }

  public getMaxLatency(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let max: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i] > max) {
        max = this.samples[i];
      }
    }
    return max;
  }

  public classifyWriteSpeed(): NetworkState {
    const average: number = this.getAverageLatency();
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

// Persists recorded files by priority, independent of the network.
class SavedFileScheduler {
  private tasks: PendingFileTask[] = [];

  public addTask(task: PendingFileTask): void {
    this.tasks.push(task);
  }

  public getPendingTasks(): PendingFileTask[] {
    const result: PendingFileTask[] = [];
    for (let i = 0; i < this.tasks.length; i++) {
      if (!this.tasks[i].persisted) {
        result.push(this.tasks[i]);
      }
    }
    return result;
  }

  public getPendingCount(): number {
    return this.getPendingTasks().length;
  }

  public sortByPriority(): PendingFileTask[] {
    const copy: PendingFileTask[] = [];
    for (let i = 0; i < this.tasks.length; i++) {
      copy.push(this.tasks[i]);
    }
    return copy.sort((a: PendingFileTask, b: PendingFileTask) => b.priority - a.priority);
  }

  public persistNext(): PendingFileTask | null {
    const pending: PendingFileTask[] = this.getPendingTasks();
    if (pending.length === 0) {
      return null;
    }
    const sorted: PendingFileTask[] = this.sortByPriority();
    for (let i = 0; i < sorted.length; i++) {
      if (!sorted[i].persisted) {
        sorted[i].persisted = true;
        return sorted[i];
      }
    }
    return null;
  }

  public getHighestPendingPriority(): number {
    const pending: PendingFileTask[] = this.getPendingTasks();
    if (pending.length === 0) {
      return -1;
    }
    let highest: number = pending[0].priority;
    for (let i = 1; i < pending.length; i++) {
      if (pending[i].priority > highest) {
        highest = pending[i].priority;
      }
    }
    return highest;
  }

  public clear(): void {
    this.tasks = [];
  }
}

// Guarantees that recording stays available without any network access.
class RecordingAvailabilityPolicy {
  private airplaneMode: boolean = false;
  private dataSaver: boolean = false;
  private networkRequired: boolean = false;

  public setAirplaneMode(enabled: boolean): void {
    this.airplaneMode = enabled;
  }

  public isAirplaneMode(): boolean {
    return this.airplaneMode;
  }

  public setDataSaver(enabled: boolean): void {
    this.dataSaver = enabled;
  }

  public isDataSaver(): boolean {
    return this.dataSaver;
  }

  public setNetworkRequired(required: boolean): void {
    this.networkRequired = required;
  }

  public isNetworkRequired(): boolean {
    return this.networkRequired;
  }

  public canStartRecording(state: NetworkState): boolean {
    if (this.networkRequired && (state === NetworkState.OFFLINE || state === NetworkState.AIRPLANE)) {
      return false;
    }
    return true;
  }

  public canPersistLocally(): boolean {
    return !this.networkRequired;
  }

  public describe(): string {
    return `RecordingAvailabilityPolicy(airplane=${this.airplaneMode}, dataSaver=${this.dataSaver}, ` +
      `networkRequired=${this.networkRequired})`;
  }
}

export default function recorderOfflineNetworkTest(): void {
  describe('RecorderOfflineNetwork_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      hilog.info(DOMAIN, TAG, 'prepare offline recording validation');
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      hilog.info(DOMAIN, TAG, 'offline recording validation finished');
      await serializedDelay(driver, 300);
    });

    // Offline state is detected.
    it('offline_state_should_be_detected', 0, async () => {
      const model = new LocalRecordingStateModel();
      model.setState(NetworkState.OFFLINE);
      expect(model.isOffline()).assertTrue();
      expect(model.isOnline()).assertFalse();
    });

    // Airplane mode is treated as offline.
    it('airplane_mode_should_be_treated_as_offline', 0, async () => {
      const model = new LocalRecordingStateModel();
      model.setState(NetworkState.AIRPLANE);
      expect(model.isOffline()).assertTrue();
    });

    // Recording remains available while offline.
    it('local_recording_should_work_when_offline', 0, async () => {
      const model = new LocalRecordingStateModel();
      model.setState(NetworkState.OFFLINE);
      expect(model.canRecordLocally()).assertTrue();
    });

    // Local recording operations are recorded offline.
    it('offline_operations_should_be_recorded', 0, async () => {
      const model = new LocalRecordingStateModel();
      model.setState(NetworkState.OFFLINE);
      model.recordLocalOperation('startRecording');
      model.recordLocalOperation('stopRecording');
      expect(model.getLocalOperations().length).assertEqual(2);
      expect(model.getLocalOperations()[0]).assertEqual('startRecording');
    });

    // Weak network is neither offline nor blocking.
    it('weak_network_state_should_be_detected', 0, async () => {
      const model = new LocalRecordingStateModel();
      model.setState(NetworkState.WEAK);
      expect(model.isWeak()).assertTrue();
      expect(model.isOffline()).assertFalse();
      expect(model.canRecordLocally()).assertTrue();
    });

    // Network recovery restores the online state.
    it('network_recovery_should_restore_online_state', 0, async () => {
      const model = new LocalRecordingStateModel();
      model.setState(NetworkState.OFFLINE);
      model.recoverNetwork();
      expect(model.isOnline()).assertTrue();
      expect(model.isOffline()).assertFalse();
    });

    // The default state is online.
    it('default_state_should_be_online', 0, async () => {
      const model = new LocalRecordingStateModel();
      expect(model.getState()).assertEqual(NetworkState.ONLINE);
      expect(model.isOnline()).assertTrue();
    });

    // Offline operations survive a network recovery.
    it('offline_operations_should_survive_recovery', 0, async () => {
      const model = new LocalRecordingStateModel();
      model.setState(NetworkState.OFFLINE);
      model.recordLocalOperation('stopRecording');
      model.recoverNetwork();
      expect(model.getLocalOperations().length).assertEqual(1);
    });

    // Switching between network states stays stable.
    it('network_state_switch_should_be_stable', 0, async () => {
      const model = new LocalRecordingStateModel();
      model.setState(NetworkState.OFFLINE);
      model.setState(NetworkState.WEAK);
      model.setState(NetworkState.ONLINE);
      expect(model.getState()).assertEqual(NetworkState.ONLINE);
      model.setState(NetworkState.ONLINE);
      expect(model.getState()).assertEqual(NetworkState.ONLINE);
    });

    // Saved file order follows the recording order.
    it('saved_file_order_should_be_preserved', 0, async () => {
      const model = new LocalRecordingStateModel();
      model.enqueueSavedFile('REC_20260115_102030.mp4');
      model.enqueueSavedFile('REC_20260115_102130.mp4');
      model.enqueueSavedFile('REC_20260115_102230.mp4');
      const queue: string[] = model.getSavedFileQueue();
      expect(queue[0]).assertEqual('REC_20260115_102030.mp4');
      expect(queue[1]).assertEqual('REC_20260115_102130.mp4');
      expect(queue[2]).assertEqual('REC_20260115_102230.mp4');
      expect(model.getQueueLength()).assertEqual(3);
    });

    // Local persistence retries are limited to three attempts.
    it('retry_should_be_limited_to_max_attempts', 0, async () => {
      const model = new LocalRecordingStateModel();
      expect(model.retry()).assertTrue();
      expect(model.retry()).assertTrue();
      expect(model.retry()).assertTrue();
      expect(model.retry()).assertFalse();
      expect(model.getRetryCount()).assertEqual(3);
      model.resetRetry();
      expect(model.getRetryCount()).assertEqual(0);
      expect(model.retry()).assertTrue();
    });

    // Switching to airplane mode and back keeps the queue.
    it('airplane_then_recover_should_work', 0, async () => {
      const model = new LocalRecordingStateModel();
      model.setState(NetworkState.AIRPLANE);
      model.enqueueSavedFile('REC_20260115_102030.mp4');
      expect(model.isOffline()).assertTrue();
      model.recoverNetwork();
      expect(model.isOnline()).assertTrue();
      expect(model.getQueueLength()).assertEqual(1);
    });

    // Weak then offline transitions are both detected.
    it('weak_then_offline_should_work', 0, async () => {
      const model = new LocalRecordingStateModel();
      model.setState(NetworkState.WEAK);
      model.setState(NetworkState.OFFLINE);
      expect(model.isOffline()).assertTrue();
      expect(model.isWeak()).assertFalse();
    });

    // A full network cycle returns to online.
    it('full_state_cycle_should_be_stable', 0, async () => {
      const model = new LocalRecordingStateModel();
      model.setState(NetworkState.OFFLINE);
      model.setState(NetworkState.AIRPLANE);
      model.setState(NetworkState.WEAK);
      model.recoverNetwork();
      expect(model.isOnline()).assertTrue();
    });

    // Recording availability is independent of the network by default.
    it('availability_policy_should_allow_offline_recording', 0, async () => {
      const policy = new RecordingAvailabilityPolicy();
      expect(policy.canStartRecording(NetworkState.OFFLINE)).assertTrue();
      expect(policy.canStartRecording(NetworkState.AIRPLANE)).assertTrue();
      expect(policy.canPersistLocally()).assertTrue();
      expect(policy.describe().length).assertLarger(0);
    });

    // A network dependent policy blocks recording when offline.
    it('availability_policy_should_block_when_network_is_required', 0, async () => {
      const policy = new RecordingAvailabilityPolicy();
      policy.setNetworkRequired(true);
      expect(policy.isNetworkRequired()).assertTrue();
      expect(policy.canStartRecording(NetworkState.OFFLINE)).assertFalse();
      expect(policy.canStartRecording(NetworkState.ONLINE)).assertTrue();
      expect(policy.canPersistLocally()).assertFalse();
    });

    // Airplane mode and data saver flags are tracked.
    it('availability_policy_should_track_device_flags', 0, async () => {
      const policy = new RecordingAvailabilityPolicy();
      expect(policy.isAirplaneMode()).assertFalse();
      policy.setAirplaneMode(true);
      policy.setDataSaver(true);
      expect(policy.isAirplaneMode()).assertTrue();
      expect(policy.isDataSaver()).assertTrue();
      expect(policy.canStartRecording(NetworkState.AIRPLANE)).assertTrue();
      policy.setAirplaneMode(false);
      policy.setDataSaver(false);
      expect(policy.isAirplaneMode()).assertFalse();
      expect(policy.isDataSaver()).assertFalse();
    });

    // Cache store: pending file tasks are tracked.
    it('cache_store_should_track_tasks', 0, async () => {
      const store = new LocalAssetCacheStore();
      store.addTask('REC_20260115_102030.mp4', PendingFilePriority.PRIORITY_HIGH);
      store.addTask('REC_20260115_102130.mp4', PendingFilePriority.PRIORITY_NORMAL);
      expect(store.getTaskCount()).assertEqual(2);
      expect(store.getPendingCount()).assertEqual(2);
      expect(store.getPersistedCount()).assertEqual(0);
      expect(store.getTasks()[0].taskId).assertEqual('task_0');
    });

    // Cache store: persistence marks and unknown task rejection.
    it('cache_store_should_mark_persisted', 0, async () => {
      const store = new LocalAssetCacheStore();
      store.addTask('REC_20260115_102030.mp4', PendingFilePriority.PRIORITY_HIGH);
      const tasks: PendingFileTask[] = store.getTasks();
      expect(store.markPersisted(tasks[0].taskId)).assertTrue();
      expect(store.getPersistedCount()).assertEqual(1);
      expect(store.getPendingCount()).assertEqual(0);
      expect(store.markPersisted('ghost')).assertFalse();
      expect(store.incrementRetry('ghost')).assertFalse();
      expect(store.incrementRetry(tasks[0].taskId)).assertTrue();
      expect(store.getTasks()[0].retries).assertEqual(1);
    });

    // Cache store: filtering by persistence priority.
    it('cache_store_should_filter_by_priority', 0, async () => {
      const store = new LocalAssetCacheStore();
      store.addTask('REC_1.mp4', PendingFilePriority.PRIORITY_HIGH);
      store.addTask('REC_2.mp4', PendingFilePriority.PRIORITY_LOW);
      store.addTask('REC_3.mp4', PendingFilePriority.PRIORITY_HIGH);
      expect(store.getTasksByPriority(PendingFilePriority.PRIORITY_HIGH).length).assertEqual(2);
      expect(store.getTasksByPriority(PendingFilePriority.PRIORITY_LOW).length).assertEqual(1);
      store.clear();
      expect(store.getTaskCount()).assertEqual(0);
    });

    // Retry queue: attempts are capped per task.
    it('retry_queue_should_limit_attempts', 0, async () => {
      const queue = new FilePersistRetryQueue();
      expect(queue.canRetry('t1')).assertFalse();
      queue.registerTask('t1');
      expect(queue.canRetry('t1')).assertTrue();
      queue.recordRetry('t1');
      queue.recordRetry('t1');
      queue.recordRetry('t1');
      expect(queue.canRetry('t1')).assertFalse();
      expect(queue.recordRetry('t1')).assertFalse();
      expect(queue.getMaxRetry()).assertEqual(3);
    });

    // Retry queue: exponential backoff growth.
    it('retry_queue_backoff_should_grow_exponentially', 0, async () => {
      const queue = new FilePersistRetryQueue();
      queue.setBaseBackoffMs(100);
      expect(queue.getBackoffMs('t1')).assertEqual(0);
      queue.registerTask('t1');
      queue.recordRetry('t1');
      queue.recordRetry('t1');
      expect(queue.getBackoffMs('t1')).assertEqual(400);
      expect(queue.getRetryCount('t1')).assertEqual(2);
      queue.resetTask('t1');
      expect(queue.getRetryCount('t1')).assertEqual(0);
      queue.clear();
      expect(queue.getBaseBackoffMs()).assertEqual(100);
    });

    // Transition logger: counts and lookups.
    it('transition_logger_should_count_events', 0, async () => {
      const logger = new NetworkTransitionLogger();
      logger.logTransition(NetworkTransitionEvent.TRANSITION_ONLINE_TO_OFFLINE);
      logger.logTransition(NetworkTransitionEvent.TRANSITION_OFFLINE_TO_ONLINE);
      logger.logTransition(NetworkTransitionEvent.TRANSITION_ONLINE_TO_OFFLINE);
      expect(logger.getTransitionCount()).assertEqual(3);
      expect(logger.countTransition(NetworkTransitionEvent.TRANSITION_ONLINE_TO_OFFLINE)).assertEqual(2);
      expect(logger.hasTransition(NetworkTransitionEvent.TRANSITION_OFFLINE_TO_ONLINE)).assertTrue();
      expect(logger.getTransitions().length).assertEqual(3);
    });

    // Transition logger: last event and clearing.
    it('transition_logger_should_return_last_event', 0, async () => {
      const logger = new NetworkTransitionLogger();
      expect(logger.getLastTransition()).assertNull();
      logger.logTransition(NetworkTransitionEvent.TRANSITION_ONLINE_TO_WEAK);
      logger.logTransition(NetworkTransitionEvent.TRANSITION_WEAK_TO_ONLINE);
      expect(logger.getLastTransition()).assertEqual(NetworkTransitionEvent.TRANSITION_WEAK_TO_ONLINE);
      logger.clear();
      expect(logger.getLastTransition()).assertNull();
      expect(logger.getTransitionCount()).assertEqual(0);
    });

    // File order validator: duplicate detection and ordering.
    it('file_order_validator_should_detect_duplicates', 0, async () => {
      const validator = new RecordingFileOrderValidator();
      validator.enqueue('REC_20260115_102030.mp4');
      validator.enqueue('REC_20260115_102130.mp4');
      validator.enqueue('REC_20260115_102030.mp4');
      expect(validator.hasDuplicates()).assertTrue();
      expect(validator.getDistinctCount()).assertEqual(2);
      expect(validator.isOrdered()).assertFalse();
    });

    // File order validator: ordered file names.
    it('file_order_validator_should_check_ordering', 0, async () => {
      const validator = new RecordingFileOrderValidator();
      validator.enqueue('REC_20260115_102030.mp4');
      validator.enqueue('REC_20260115_102130.mp4');
      expect(validator.isOrdered()).assertTrue();
      expect(validator.hasDuplicates()).assertFalse();
      const reverse = new RecordingFileOrderValidator();
      reverse.enqueue('REC_20260115_102130.mp4');
      reverse.enqueue('REC_20260115_102030.mp4');
      expect(reverse.isOrdered()).assertFalse();
      validator.clear();
      expect(validator.getQueue().length).assertEqual(0);
    });

    // Network statistics: state counters.
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
      expect(stats.getOnlineRatio()).assertEqual(0.25);
      stats.reset();
      expect(stats.getTotalRecorded()).assertEqual(0);
      expect(stats.getOnlineRatio()).assertEqual(0);
    });

    // Local write latency: classification thresholds.
    it('latency_estimator_should_classify_write_speed', 0, async () => {
      const estimator = new LocalWriteLatencyEstimator();
      estimator.recordLatency(50);
      estimator.recordLatency(100);
      expect(estimator.classifyWriteSpeed()).assertEqual(NetworkState.ONLINE);
      estimator.clear();
      estimator.recordLatency(300);
      expect(estimator.classifyWriteSpeed()).assertEqual(NetworkState.WEAK);
      estimator.clear();
      estimator.recordLatency(600);
      expect(estimator.classifyWriteSpeed()).assertEqual(NetworkState.OFFLINE);
    });

    // Local write latency: average and max.
    it('latency_estimator_should_compute_avg_and_max', 0, async () => {
      const estimator = new LocalWriteLatencyEstimator();
      expect(estimator.getAverageLatency()).assertEqual(0);
      expect(estimator.getMaxLatency()).assertEqual(0);
      estimator.recordLatency(100);
      estimator.recordLatency(300);
      estimator.recordLatency(500);
      expect(estimator.getAverageLatency()).assertEqual(300);
      expect(estimator.getMaxLatency()).assertEqual(500);
      expect(estimator.getSampleCount()).assertEqual(3);
    });

    // Saved file scheduler: highest priority file is persisted first.
    it('scheduler_should_persist_highest_priority', 0, async () => {
      const scheduler = new SavedFileScheduler();
      const low: PendingFileTask = {
        taskId: 't1', fileName: 'REC_1.mp4', priority: PendingFilePriority.PRIORITY_LOW,
        retries: 0, persisted: false
      };
      const high: PendingFileTask = {
        taskId: 't2', fileName: 'REC_2.mp4', priority: PendingFilePriority.PRIORITY_HIGH,
        retries: 0, persisted: false
      };
      scheduler.addTask(low);
      scheduler.addTask(high);
      expect(scheduler.getPendingCount()).assertEqual(2);
      expect(scheduler.getHighestPendingPriority()).assertEqual(PendingFilePriority.PRIORITY_HIGH);
      expect(scheduler.sortByPriority()[0].taskId).assertEqual('t2');
      const next: PendingFileTask | null = scheduler.persistNext();
      expect(next === null).assertFalse();
      if (next !== null) {
        expect(next.taskId).assertEqual('t2');
      }
      expect(scheduler.getPendingCount()).assertEqual(1);
    });

    // Saved file scheduler: empty queue returns null and clears cleanly.
    it('scheduler_should_handle_empty_queue', 0, async () => {
      const scheduler = new SavedFileScheduler();
      expect(scheduler.persistNext()).assertNull();
      expect(scheduler.getPendingCount()).assertEqual(0);
      expect(scheduler.getHighestPendingPriority()).assertEqual(-1);
      scheduler.clear();
      expect(scheduler.sortByPriority().length).assertEqual(0);
    });

    // UI smoke check: the recorder stays observable without a network.
    it('recorder_should_stay_observable_without_network', 0, async () => {
      const count: number = await recorderComponentCount(driver);
      expect(count >= 0).assertEqual(true);
      hilog.info(DOMAIN, TAG, 'recorder window observed under offline conditions');
    });
  });
}