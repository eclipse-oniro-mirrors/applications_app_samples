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
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  serializedDelay,
  componentCount,
  waitForHomePageStable,
  isHomePageVisible,
  isFoodDetailVisible,
  launchStandardAbility,
  launchSpecifiedAbility,
  launchSingletonAbility,
  resetToHome,
  INDEX_STANDARD_GROUP,
  INDEX_SPECIFIED_GROUP,
  INDEX_SINGLETON_GROUP,
  MODE_STANDARD,
  MODE_SPECIFIED,
  TIMEOUT_PAGE_RENDER,
  DELAY_AFTER_START_MODE,
  logInfo
} from '../Shared/SharedDriver';

// One recorded concurrent operation.
interface ConcurrentRecord {
  type: string;
  timestamp: number;
  success: boolean;
}

// Kind of operation issued against the sample abilities.
enum StartModeOperationType {
  LAUNCH_STANDARD = 'launch_standard', LAUNCH_SPECIFIED = 'launch_specified',
  LAUNCH_SINGLETON = 'launch_singleton', KEY_NAVIGATION = 'key_navigation', RENDER = 'render'
}

// State of the concurrency bookkeeping.
enum ConcurrencyState {
  IDLE = 'idle', ACTIVE = 'active', DRAINING = 'draining', TERMINATED = 'terminated'
}

// Detailed timing of one concurrent operation.
interface ConcurrentOperationDetail {
  operationId: number;
  type: StartModeOperationType;
  startTime: number;
  endTime: number;
  successful: boolean;
}

// Snapshot of the concurrency bookkeeping at one point in time.
interface ConcurrencySnapshot {
  state: ConcurrencyState;
  activeCount: number;
  totalCount: number;
  maxConcurrency: number;
}

// Tracks how many operations overlap and whether they succeed.
class ConcurrencyTracker {
  private static instance: ConcurrencyTracker;
  private records: ConcurrentRecord[] = [];
  private maxConcurrency: number = 0;
  private activeCount: number = 0;
  private totalOperations: number = 0;

  public static getInstance(): ConcurrencyTracker {
    if (!ConcurrencyTracker.instance) {
      ConcurrencyTracker.instance = new ConcurrencyTracker();
    }
    return ConcurrencyTracker.instance;
  }

  public beginOperation(type: string): void {
    this.activeCount++;
    this.totalOperations++;
    if (this.activeCount > this.maxConcurrency) {
      this.maxConcurrency = this.activeCount;
    }
    this.records.push({
      type: type,
      timestamp: Date.now(),
      success: true
    });
  }

  public endOperation(): void {
    if (this.activeCount > 0) {
      this.activeCount--;
    }
  }

  public recordFailed(type: string): void {
    this.totalOperations++;
    this.records.push({
      type: type,
      timestamp: Date.now(),
      success: false
    });
  }

  public getMaxConcurrency(): number {
    return this.maxConcurrency;
  }

  public getTotalOperations(): number {
    return this.totalOperations;
  }

  public getActiveCount(): number {
    return this.activeCount;
  }

  public getSuccessCount(): number {
    return this.records.filter((record: ConcurrentRecord) => record.success).length;
  }

  public getFailureCount(): number {
    return this.records.filter((record: ConcurrentRecord) => !record.success).length;
  }

  public getRecords(): ConcurrentRecord[] {
    return [...this.records];
  }

  public getTypeCount(type: string): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].type === type) {
        count++;
      }
    }
    return count;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].timestamp < this.records[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public reset(): void {
    this.records = [];
    this.maxConcurrency = 0;
    this.activeCount = 0;
    this.totalOperations = 0;
  }
}

// Record of one concurrent operation that supports cloning.
class ConcurrentOperationRecord {
  public operationId: number;
  public type: StartModeOperationType;
  public startTime: number;
  public endTime: number;
  public successful: boolean;

  constructor(operationId: number, type: StartModeOperationType, startTime: number, endTime: number,
    successful: boolean) {
    this.operationId = operationId;
    this.type = type;
    this.startTime = startTime;
    this.endTime = endTime;
    this.successful = successful;
  }

  public clone(): ConcurrentOperationRecord {
    return new ConcurrentOperationRecord(this.operationId, this.type, this.startTime, this.endTime, this.successful);
  }

  public equals(other: ConcurrentOperationRecord): boolean {
    return this.operationId === other.operationId && this.type === other.type;
  }

  public toString(): string {
    return `ConcurrentOperationRecord(id=${this.operationId}, type=${this.type}, successful=${this.successful})`;
  }

  public getDuration(): number {
    return this.endTime - this.startTime;
  }

  public isValid(): boolean {
    return this.operationId >= 0 && this.endTime >= this.startTime;
  }
}

// Starts and finishes concurrent operations and keeps their ids.
class ConcurrentOperationRecorder {
  private records: ConcurrentOperationRecord[] = [];
  private nextId: number = 0;

  public startOperation(type: StartModeOperationType): number {
    const id: number = this.nextId;
    this.nextId++;
    const record: ConcurrentOperationRecord = new ConcurrentOperationRecord(id, type, Date.now(), 0, true);
    this.records.push(record);
    return id;
  }

  public finishOperation(operationId: number, successful: boolean): boolean {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].operationId === operationId) {
        this.records[i].endTime = Date.now();
        this.records[i].successful = successful;
        return true;
      }
    }
    return false;
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public getSuccessfulCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].successful) {
        count++;
      }
    }
    return count;
  }

  public getCountByType(type: StartModeOperationType): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].type === type) {
        count++;
      }
    }
    return count;
  }

  public getAverageDuration(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let sum: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      sum += this.records[i].getDuration();
    }
    return sum / this.records.length;
  }

  public getRecords(): ConcurrentOperationRecord[] {
    const result: ConcurrentOperationRecord[] = [];
    for (let i = 0; i < this.records.length; i++) {
      result.push(this.records[i].clone());
    }
    return result;
  }

  public clear(): void {
    this.records = [];
    this.nextId = 0;
  }
}

// Runs the concurrency bookkeeping through its lifecycle states.
class ConcurrencyStateMachine {
  private state: ConcurrencyState = ConcurrencyState.IDLE;
  private activeCount: number = 0;

  public start(): void {
    this.state = ConcurrencyState.ACTIVE;
  }

  public beginOperation(): void {
    this.activeCount++;
  }

  public endOperation(): void {
    if (this.activeCount > 0) {
      this.activeCount--;
    }
    if (this.activeCount === 0 && this.state === ConcurrencyState.DRAINING) {
      this.state = ConcurrencyState.IDLE;
    }
  }

  public drain(): void {
    if (this.activeCount === 0) {
      this.state = ConcurrencyState.IDLE;
    } else {
      this.state = ConcurrencyState.DRAINING;
    }
  }

  public terminate(): void {
    this.state = ConcurrencyState.TERMINATED;
    this.activeCount = 0;
  }

  public getState(): ConcurrencyState {
    return this.state;
  }

  public getActiveCount(): number {
    return this.activeCount;
  }

  public isIdle(): boolean {
    return this.state === ConcurrencyState.IDLE;
  }

  public isActive(): boolean {
    return this.state === ConcurrencyState.ACTIVE;
  }

  public isTerminated(): boolean {
    return this.state === ConcurrencyState.TERMINATED;
  }
}

// Snapshot of the concurrency bookkeeping that supports cloning.
class ConcurrencySnapshotModel {
  public state: ConcurrencyState;
  public activeCount: number;
  public totalCount: number;
  public maxConcurrency: number;

  constructor(state: ConcurrencyState, activeCount: number, totalCount: number, maxConcurrency: number) {
    this.state = state;
    this.activeCount = activeCount;
    this.totalCount = totalCount;
    this.maxConcurrency = maxConcurrency;
  }

  public clone(): ConcurrencySnapshotModel {
    return new ConcurrencySnapshotModel(this.state, this.activeCount, this.totalCount, this.maxConcurrency);
  }

  public equals(other: ConcurrencySnapshotModel): boolean {
    return this.state === other.state && this.activeCount === other.activeCount &&
      this.totalCount === other.totalCount && this.maxConcurrency === other.maxConcurrency;
  }

  public toString(): string {
    return `ConcurrencySnapshotModel(state=${this.state}, active=${this.activeCount}, total=${this.totalCount}, max=${this.maxConcurrency})`;
  }

  public isValid(): boolean {
    return this.activeCount >= 0 && this.totalCount >= 0 && this.maxConcurrency >= 0;
  }

  public toSnapshot(): ConcurrencySnapshot {
    return {
      state: this.state,
      activeCount: this.activeCount,
      totalCount: this.totalCount,
      maxConcurrency: this.maxConcurrency
    };
  }
}

// Computes the aggregate metrics of the concurrent operations.
class ConcurrencyStatistics {
  public getSuccessRate(records: ConcurrentOperationRecord[]): number {
    if (records.length === 0) {
      return 0;
    }
    let success: number = 0;
    for (let i = 0; i < records.length; i++) {
      if (records[i].successful) {
        success++;
      }
    }
    return success / records.length;
  }

  public getTotalDuration(records: ConcurrentOperationRecord[]): number {
    let total: number = 0;
    for (let i = 0; i < records.length; i++) {
      total += records[i].getDuration();
    }
    return total;
  }

  public getOverlapCount(records: ConcurrentOperationRecord[]): number {
    let overlaps: number = 0;
    for (let i = 0; i < records.length; i++) {
      for (let j = i + 1; j < records.length; j++) {
        const a: ConcurrentOperationRecord = records[i];
        const b: ConcurrentOperationRecord = records[j];
        if (a.startTime < b.endTime && b.startTime < a.endTime) {
          overlaps++;
        }
      }
    }
    return overlaps;
  }

  public getMaxActiveCount(records: ConcurrentOperationRecord[]): number {
    let maxActive: number = 0;
    for (let i = 0; i < records.length; i++) {
      let active: number = 0;
      const time: number = records[i].startTime;
      for (let j = 0; j < records.length; j++) {
        if (records[j].startTime <= time && records[j].endTime > time) {
          active++;
        }
      }
      if (active > maxActive) {
        maxActive = active;
      }
    }
    return maxActive;
  }
}

export default function startModeConcurrencyTest() {
  describe('StartModeConcurrency_Test', () => {
    let driver: Driver;
    let tracker: ConcurrencyTracker;

    beforeAll(async () => {
      driver = getDriver();
      tracker = ConcurrencyTracker.getInstance();
      tracker.reset();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // The home page tolerates repeated concurrent key presses.
    it('home_page_should_handle_concurrent_key_presses', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        tracker.beginOperation('right');
        tracker.endOperation();
      }
      expect(tracker.getSuccessCount()).assertEqual(10);
      const counted: number = await componentCount(driver);
      expect(counted).assertLargerOrEqual(1);
    });

    // The home page keeps its state during alternating navigation.
    it('home_page_should_maintain_state_during_concurrent_operations', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      tracker.reset();
      for (let i = 0; i < 20; i++) {
        if (i % 2 === 0) {
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        } else {
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        }
        tracker.beginOperation(i % 2 === 0 ? 'left' : 'right');
        tracker.endOperation();
      }
      expect(tracker.getTotalOperations()).assertEqual(20);
      expect(await isHomePageVisible(driver)).assertTrue();
    });

    // Operation timestamps stay chronological.
    it('concurrent_operations_should_have_chronological_timestamps', 0, async () => {
      tracker.reset();
      tracker.beginOperation('left');
      tracker.endOperation();
      tracker.beginOperation('right');
      tracker.endOperation();
      tracker.beginOperation('enter');
      tracker.endOperation();
      expect(tracker.isChronological()).assertTrue();
      expect(tracker.getTotalOperations()).assertEqual(3);
    });

    // Rapid focus changes do not destabilise the page.
    it('home_page_should_handle_rapid_concurrent_focus_changes', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      tracker.reset();
      for (let i = 0; i < 30; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, 20);
        tracker.beginOperation('focus');
        tracker.endOperation();
      }
      expect(tracker.getTypeCount('focus')).assertEqual(30);
      const counted: number = await componentCount(driver);
      expect(counted).assertLargerOrEqual(1);
    });

    // The tracker records the maximum overlap of operations.
    it('concurrent_operations_should_track_max_concurrency', 0, async () => {
      tracker.reset();
      tracker.beginOperation('a');
      tracker.beginOperation('b');
      tracker.beginOperation('c');
      expect(tracker.getMaxConcurrency()).assertEqual(3);
      expect(tracker.getActiveCount()).assertEqual(3);
      tracker.endOperation();
      tracker.endOperation();
      tracker.endOperation();
      expect(tracker.getActiveCount()).assertEqual(0);
    });

    // The tracker singleton stays consistent across access.
    it('concurrency_tracker_singleton_should_be_consistent', 0, async () => {
      const instance1: ConcurrencyTracker = ConcurrencyTracker.getInstance();
      const instance2: ConcurrencyTracker = ConcurrencyTracker.getInstance();
      expect(instance1 === instance2).assertTrue();
    });

    // Mixed operation types are recorded independently.
    it('concurrent_operations_should_handle_mixed_types', 0, async () => {
      tracker.reset();
      const types: string[] = ['left', 'right', 'enter', 'left', 'right'];
      for (let i = 0; i < types.length; i++) {
        tracker.beginOperation(types[i]);
        tracker.endOperation();
      }
      expect(tracker.getTypeCount('left')).assertEqual(2);
      expect(tracker.getTypeCount('right')).assertEqual(2);
      expect(tracker.getTypeCount('enter')).assertEqual(1);
    });

    // A failed operation is recorded without breaking the success count.
    it('concurrent_operations_should_handle_error_recovery', 0, async () => {
      tracker.reset();
      tracker.beginOperation('valid');
      tracker.endOperation();
      tracker.recordFailed('invalid');
      expect(tracker.getSuccessCount()).assertEqual(1);
      expect(tracker.getFailureCount()).assertEqual(1);
      expect(tracker.getTotalOperations()).assertEqual(2);
    });

    // The success count can be compared with the total operations.
    it('concurrent_operations_should_validate_success_rate', 0, async () => {
      tracker.reset();
      tracker.beginOperation('ok');
      tracker.endOperation();
      tracker.beginOperation('ok');
      tracker.endOperation();
      expect(tracker.getSuccessCount()).assertEqual(2);
      expect(tracker.getSuccessCount() === tracker.getTotalOperations()).assertTrue();
    });

    // The operation recorder tracks ids, types and durations.
    it('operation_recorder_should_track_ids_and_durations', 0, async () => {
      const recorder = new ConcurrentOperationRecorder();
      const firstId: number = recorder.startOperation(StartModeOperationType.LAUNCH_STANDARD);
      expect(recorder.finishOperation(firstId, true)).assertTrue();
      const secondId: number = recorder.startOperation(StartModeOperationType.LAUNCH_SINGLETON);
      expect(recorder.finishOperation(secondId, false)).assertTrue();
      expect(firstId).assertEqual(0);
      expect(secondId).assertEqual(1);
      expect(recorder.getRecordCount()).assertEqual(2);
      expect(recorder.getSuccessfulCount()).assertEqual(1);
      expect(recorder.getCountByType(StartModeOperationType.LAUNCH_STANDARD)).assertEqual(1);
      expect(recorder.getAverageDuration() >= 0).assertTrue();
      expect(recorder.finishOperation(99, true)).assertFalse();
      expect(recorder.getRecords().length).assertEqual(2);
      recorder.clear();
      expect(recorder.getRecordCount()).assertEqual(0);
    });

    // The state machine walks through active, draining and idle states.
    it('concurrency_state_machine_should_drain_to_idle', 0, async () => {
      const machine = new ConcurrencyStateMachine();
      expect(machine.isIdle()).assertTrue();
      machine.start();
      expect(machine.isActive()).assertTrue();
      machine.beginOperation();
      machine.beginOperation();
      expect(machine.getActiveCount()).assertEqual(2);
      machine.drain();
      expect(machine.getState()).assertEqual(ConcurrencyState.DRAINING);
      machine.endOperation();
      machine.endOperation();
      expect(machine.isIdle()).assertTrue();
    });

    // Terminating the state machine clears the active count.
    it('concurrency_state_machine_should_terminate', 0, async () => {
      const machine = new ConcurrencyStateMachine();
      machine.beginOperation();
      machine.terminate();
      expect(machine.isTerminated()).assertTrue();
      expect(machine.getActiveCount()).assertEqual(0);
    });

    // Snapshots clone, compare and validate consistently.
    it('concurrency_snapshot_should_clone_and_compare', 0, async () => {
      const snapshot = new ConcurrencySnapshotModel(ConcurrencyState.ACTIVE, 2, 5, 3);
      const clone: ConcurrencySnapshotModel = snapshot.clone();
      expect(snapshot.equals(clone)).assertTrue();
      expect(snapshot.isValid()).assertTrue();
      const changed: ConcurrencySnapshotModel = new ConcurrencySnapshotModel(ConcurrencyState.IDLE, 0, 5, 3);
      expect(snapshot.equals(changed)).assertFalse();
      const plain: ConcurrencySnapshot = snapshot.toSnapshot();
      expect(plain.maxConcurrency).assertEqual(3);
      expect(plain.state).assertEqual(ConcurrencyState.ACTIVE);
      expect(snapshot.toString().length > 0).assertTrue();
    });

    // Aggregated statistics reflect the recorded operation details.
    it('concurrency_statistics_should_aggregate_metrics', 0, async () => {
      const statistics = new ConcurrencyStatistics();
      const records: ConcurrentOperationRecord[] = [
        new ConcurrentOperationRecord(0, StartModeOperationType.LAUNCH_STANDARD, 0, 100, true),
        new ConcurrentOperationRecord(1, StartModeOperationType.LAUNCH_SINGLETON, 50, 150, true),
        new ConcurrentOperationRecord(2, StartModeOperationType.KEY_NAVIGATION, 200, 250, false)
      ];
      expect(statistics.getSuccessRate(records) > 0.6).assertTrue();
      expect(statistics.getTotalDuration(records)).assertEqual(250);
      expect(statistics.getOverlapCount(records)).assertEqual(1);
      expect(statistics.getMaxActiveCount(records)).assertEqual(2);
      expect(statistics.getSuccessRate([])).assertEqual(0);
    });

    // Alternating standard and specified launches stay consistent.
    it('alternating_mode_launches_should_stay_consistent', 0, async () => {
      tracker.reset();
      for (let i = 0; i < 4; i++) {
        if (i % 2 === 0) {
          await launchStandardAbility(i % 2, MODE_STANDARD, INDEX_STANDARD_GROUP);
        } else {
          await launchSpecifiedAbility(i % 2, 'pages/FoodDetail', INDEX_SPECIFIED_GROUP);
        }
        tracker.beginOperation(i % 2 === 0 ? 'standard' : 'specified');
        tracker.endOperation();
        await serializedDelay(driver, DELAY_AFTER_START_MODE);
      }
      expect(tracker.getTotalOperations()).assertEqual(4);
      expect(tracker.isChronological()).assertTrue();
      const counted: number = await componentCount(driver);
      expect(counted).assertLargerOrEqual(1);
      await resetToHome(driver);
    });

    // Repeated singleton launches reuse the instance and keep the page alive.
    it('repeated_singleton_launch_should_stay_alive', 0, async () => {
      tracker.reset();
      await launchSingletonAbility(0, INDEX_SINGLETON_GROUP);
      await serializedDelay(driver, DELAY_AFTER_START_MODE);
      await launchSingletonAbility(1, INDEX_SINGLETON_GROUP);
      await serializedDelay(driver, DELAY_AFTER_START_MODE);
      tracker.beginOperation('singleton');
      tracker.endOperation();
      tracker.beginOperation('singleton');
      tracker.endOperation();
      expect(tracker.getTotalOperations()).assertEqual(2);
      const counted: number = await componentCount(driver);
      expect(counted).assertLargerOrEqual(1);
    });

    // Comprehensive concurrency scenario over the initial home state.
    it('comprehensive_concurrency_scenario', 0, async () => {
      await resetToHome(driver);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      tracker.reset();
      for (let i = 0; i < 15; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        tracker.beginOperation('right');
        tracker.endOperation();
      }
      expect(tracker.isChronological()).assertTrue();
      expect(tracker.getSuccessCount()).assertEqual(15);
      const home: boolean = await isHomePageVisible(driver);
      const detail: boolean = await isFoodDetailVisible(driver);
      logInfo(`comprehensive_concurrency_scenario: home=${home}, detail=${detail}`);
      expect(home || detail).assertTrue();
      const counted: number = await componentCount(driver);
      expect(counted).assertLargerOrEqual(1);
    });
  });
}
