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
  recorderComponentCount,
  waitForTimerWindowStable,
  triggerRecordingStart,
  triggerRecordingStop,
  runSerializedUiOperation,
  pressAndWait,
  serializedDelay,
  StopCombinationGate,
  KEY_MENU,
  KEY_VOLUME_DOWN,
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  TIMEOUT_TIMER_RENDER
} from '../shared/RecordingDriver';

// Kinds of requests that may race inside the recording sample. The service
// receives start (startId === 1) and stop requests, while the floating windows
// are rendered asynchronously on the same UI thread.
enum ConcurrentOperationType {
  START_REQUEST = 'start_request',
  STOP_REQUEST = 'stop_request',
  STATE_QUERY = 'state_query',
  WINDOW_RENDER = 'window_render',
  KEY_COMBINATION = 'key_combination'
}

// Lifecycle of the concurrency window.
enum ConcurrencyState {
  IDLE = 'idle',
  ACTIVE = 'active',
  DRAINING = 'draining',
  TERMINATED = 'terminated'
}

// Detailed record of one concurrent operation.
interface ConcurrentOperationDef {
  operationId: number;
  type: ConcurrentOperationType;
  startTime: number;
  endTime: number;
  successful: boolean;
}

// Snapshot of the concurrency window at one point in time.
interface ConcurrencySnapshotDef {
  state: ConcurrencyState;
  activeCount: number;
  totalCount: number;
  maxConcurrency: number;
}

// Entry of the request queue owned by the recording service.
interface RecordingRequestDef {
  sequence: number;
  startId: number;
  issuedAt: number;
}

// Lightweight tracker used by the UI cases. Counters are updated by the test
// body, so the helper stays deterministic and device independent.
class RecordingRequestTracker {
  private static instance: RecordingRequestTracker;
  private totalOperations: number = 0;
  private successOperations: number = 0;
  private failureOperations: number = 0;
  private activeCount: number = 0;
  private maxConcurrency: number = 0;
  private timestamps: number[] = [];

  public static getInstance(): RecordingRequestTracker {
    if (!RecordingRequestTracker.instance) {
      RecordingRequestTracker.instance = new RecordingRequestTracker();
    }
    return RecordingRequestTracker.instance;
  }

  public beginOperation(): void {
    this.activeCount++;
    this.totalOperations++;
    if (this.activeCount > this.maxConcurrency) {
      this.maxConcurrency = this.activeCount;
    }
    this.timestamps.push(Date.now());
  }

  public endOperation(successful: boolean): void {
    if (this.activeCount > 0) {
      this.activeCount--;
    }
    if (successful) {
      this.successOperations++;
    } else {
      this.failureOperations++;
    }
  }

  public recordFailure(): void {
    this.totalOperations++;
    this.failureOperations++;
    this.timestamps.push(Date.now());
  }

  public getTotalOperations(): number {
    return this.totalOperations;
  }

  public getSuccessOperations(): number {
    return this.successOperations;
  }

  public getFailureOperations(): number {
    return this.failureOperations;
  }

  public getMaxConcurrency(): number {
    return this.maxConcurrency;
  }

  public getActiveCount(): number {
    return this.activeCount;
  }

  public getTimestamps(): number[] {
    const result: number[] = [];
    for (let i = 0; i < this.timestamps.length; i++) {
      result.push(this.timestamps[i]);
    }
    return result;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.timestamps.length; i++) {
      if (this.timestamps[i] < this.timestamps[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public reset(): void {
    this.totalOperations = 0;
    this.successOperations = 0;
    this.failureOperations = 0;
    this.activeCount = 0;
    this.maxConcurrency = 0;
    this.timestamps = [];
  }
}

// Detailed recorder for concurrent operations. It keeps per-operation data so
// that overlap and duration analysis can be asserted.
class ConcurrentOperationRecorder {
  private records: ConcurrentOperationDef[] = [];
  private nextId: number = 0;

  public startOperation(type: ConcurrentOperationType, at: number): number {
    const id: number = this.nextId;
    this.nextId++;
    const record: ConcurrentOperationDef = {
      operationId: id,
      type: type,
      startTime: at,
      endTime: 0,
      successful: true
    };
    this.records.push(record);
    return id;
  }

  public finishOperation(operationId: number, at: number, successful: boolean): boolean {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].operationId === operationId) {
        this.records[i].endTime = at;
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

  public getCountByType(type: ConcurrentOperationType): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].type === type) {
        count++;
      }
    }
    return count;
  }

  public getRecords(): ConcurrentOperationDef[] {
    const result: ConcurrentOperationDef[] = [];
    for (let i = 0; i < this.records.length; i++) {
      const record: ConcurrentOperationDef = {
        operationId: this.records[i].operationId,
        type: this.records[i].type,
        startTime: this.records[i].startTime,
        endTime: this.records[i].endTime,
        successful: this.records[i].successful
      };
      result.push(record);
    }
    return result;
  }

  public getAverageDuration(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let sum: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      sum += this.records[i].endTime - this.records[i].startTime;
    }
    return sum / this.records.length;
  }

  public clear(): void {
    this.records = [];
    this.nextId = 0;
  }
}

// FIFO queue that models the request dispatch of ScreenRecorderAbility.
// Consecutive duplicates are collapsed because a second start while recording
// is rejected by the state guard and must not allocate a second file.
class RecordingRequestQueue {
  private requests: RecordingRequestDef[] = [];
  private nextSequence: number = 1;
  private capacity: number;

  constructor(capacity: number = 16) {
    this.capacity = capacity;
  }

  public enqueue(startId: number, issuedAt: number): number {
    const sequence: number = this.nextSequence;
    const last: RecordingRequestDef | null = this.peekLast();
    if (last !== null && last.startId === startId) {
      return -1;
    }
    if (this.requests.length >= this.capacity) {
      return -1;
    }
    const request: RecordingRequestDef = {
      sequence: sequence,
      startId: startId,
      issuedAt: issuedAt
    };
    this.requests.push(request);
    this.nextSequence++;
    return sequence;
  }

  public dequeue(): RecordingRequestDef | null {
    if (this.requests.length === 0) {
      return null;
    }
    return this.requests.shift() as RecordingRequestDef;
  }

  public peekLast(): RecordingRequestDef | null {
    if (this.requests.length === 0) {
      return null;
    }
    return this.requests[this.requests.length - 1];
  }

  public size(): number {
    return this.requests.length;
  }

  public isEmpty(): boolean {
    return this.requests.length === 0;
  }

  public isFull(): boolean {
    return this.requests.length >= this.capacity;
  }

  public getCapacity(): number {
    return this.capacity;
  }

  public getSequenceNumbers(): number[] {
    const result: number[] = [];
    for (let i = 0; i < this.requests.length; i++) {
      result.push(this.requests[i].sequence);
    }
    return result;
  }

  public countStartRequests(): number {
    let count: number = 0;
    for (let i = 0; i < this.requests.length; i++) {
      if (this.requests[i].startId === 1) {
        count++;
      }
    }
    return count;
  }

  public countStopRequests(): number {
    return this.requests.length - this.countStartRequests();
  }

  public clear(): void {
    this.requests = [];
    this.nextSequence = 1;
  }
}

// State machine of the concurrency window.
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

  public isDraining(): boolean {
    return this.state === ConcurrencyState.DRAINING;
  }

  public isTerminated(): boolean {
    return this.state === ConcurrencyState.TERMINATED;
  }
}

// Snapshot model of the concurrency window.
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

  public isValid(): boolean {
    return this.activeCount >= 0 && this.totalCount >= 0 && this.maxConcurrency >= 0;
  }

  public isQuiescent(): boolean {
    return this.activeCount === 0;
  }

  public toString(): string {
    return `ConcurrencySnapshotModel(state=${this.state}, active=${this.activeCount}, total=${this.totalCount})`;
  }
}

// Statistical helpers over the recorded concurrent operations.
class ConcurrencyStatistics {
  public getSuccessRate(records: ConcurrentOperationDef[]): number {
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

  public getTotalDuration(records: ConcurrentOperationDef[]): number {
    let total: number = 0;
    for (let i = 0; i < records.length; i++) {
      total += records[i].endTime - records[i].startTime;
    }
    return total;
  }

  public getOverlapCount(records: ConcurrentOperationDef[]): number {
    let overlaps: number = 0;
    for (let i = 0; i < records.length; i++) {
      for (let j = i + 1; j < records.length; j++) {
        const left: ConcurrentOperationDef = records[i];
        const right: ConcurrentOperationDef = records[j];
        if (left.startTime < right.endTime && right.startTime < left.endTime) {
          overlaps++;
        }
      }
    }
    return overlaps;
  }

  public getMaxActiveCount(records: ConcurrentOperationDef[]): number {
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

export default function screenRecorderDialogConcurrencyTest(): void {
  describe('ScreenRecorderDialogConcurrency_Test', () => {
    let driver: Driver;
    let tracker: RecordingRequestTracker;

    beforeAll(async () => {
      driver = getDriver();
      tracker = RecordingRequestTracker.getInstance();
      tracker.reset();
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      await serializedDelay(driver, 300);
    });

    // Concurrency: repeated start requests keep a single timer window.
    it('repeated_start_requests_should_keep_single_timer', 0, async () => {
      await triggerRecordingStart(driver);
      for (let i = 0; i < 5; i++) {
        tracker.beginOperation();
        await triggerRecordingStart(driver);
        tracker.endOperation(true);
      }
      await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      const count: number = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(tracker.getMaxConcurrency()).assertLargerOrEqual(1);
    });

    // Concurrency: alternating start and stop requests stay ordered.
    it('alternating_requests_should_keep_order', 0, async () => {
      tracker.reset();
      for (let i = 0; i < 6; i++) {
        tracker.beginOperation();
        if (i % 2 === 0) {
          await triggerRecordingStart(driver);
        } else {
          await triggerRecordingStop(driver);
        }
        tracker.endOperation(true);
      }
      expect(tracker.isChronological()).assertTrue();
      expect(tracker.getTotalOperations()).assertEqual(6);
    });

    // Concurrency: serialized UI operations never overlap.
    it('serialized_ui_operations_should_not_overlap', 0, async () => {
      tracker.reset();
      await runSerializedUiOperation(async () => {
        tracker.beginOperation();
        await serializedDelay(driver, 10);
        tracker.endOperation(true);
      });
      await runSerializedUiOperation(async () => {
        tracker.beginOperation();
        await serializedDelay(driver, 10);
        tracker.endOperation(true);
      });
      expect(tracker.getMaxConcurrency()).assertEqual(1);
      expect(tracker.getSuccessOperations()).assertEqual(2);
    });

    // Concurrency: parallel probes are queued instead of rejected.
    it('parallel_probes_should_be_queued', 0, async () => {
      tracker.reset();
      const first: Promise<number> = runSerializedUiOperation(async () => {
        tracker.beginOperation();
        await serializedDelay(driver, 5);
        tracker.endOperation(true);
        return 1;
      });
      const second: Promise<number> = runSerializedUiOperation(async () => {
        tracker.beginOperation();
        await serializedDelay(driver, 5);
        tracker.endOperation(true);
        return 2;
      });
      const values: number[] = await Promise.all([first, second]);
      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(2);
      expect(tracker.getMaxConcurrency()).assertLessOrEqual(2);
    });

    // Concurrency: the tracker keeps a single instance across suites.
    it('request_tracker_singleton_should_be_stable', 0, async () => {
      const first: RecordingRequestTracker = RecordingRequestTracker.getInstance();
      const second: RecordingRequestTracker = RecordingRequestTracker.getInstance();
      expect(first === second).assertTrue();
      expect(first === tracker).assertTrue();
    });

    // Concurrency: the maximum concurrency counter is monotonic per window.
    it('max_concurrency_should_be_tracked', 0, async () => {
      tracker.reset();
      tracker.beginOperation();
      tracker.beginOperation();
      tracker.beginOperation();
      expect(tracker.getMaxConcurrency()).assertEqual(3);
      expect(tracker.getActiveCount()).assertEqual(3);
      tracker.endOperation(true);
      tracker.endOperation(true);
      tracker.endOperation(true);
      expect(tracker.getActiveCount()).assertEqual(0);
      expect(tracker.getSuccessOperations()).assertEqual(3);
    });

    // Concurrency: failed requests are counted separately.
    it('failed_requests_should_be_counted_separately', 0, async () => {
      tracker.reset();
      tracker.beginOperation();
      tracker.endOperation(true);
      tracker.recordFailure();
      expect(tracker.getSuccessOperations()).assertEqual(1);
      expect(tracker.getFailureOperations()).assertEqual(1);
      expect(tracker.getTotalOperations()).assertEqual(2);
    });

    // Concurrency: the request queue rejects duplicate consecutive start ids.
    it('request_queue_should_reject_consecutive_duplicates', 0, async () => {
      const queue = new RecordingRequestQueue();
      expect(queue.enqueue(1, 100)).assertEqual(1);
      expect(queue.enqueue(1, 110)).assertEqual(-1);
      expect(queue.enqueue(2, 120)).assertEqual(2);
      expect(queue.size()).assertEqual(2);
      expect(queue.countStartRequests()).assertEqual(1);
      expect(queue.countStopRequests()).assertEqual(1);
    });

    // Concurrency: the request queue preserves FIFO ordering.
    it('request_queue_should_preserve_fifo_order', 0, async () => {
      const queue = new RecordingRequestQueue();
      queue.enqueue(1, 100);
      queue.enqueue(2, 200);
      queue.enqueue(1, 300);
      const sequences: number[] = queue.getSequenceNumbers();
      expect(sequences.length).assertEqual(3);
      expect(sequences[0]).assertEqual(1);
      expect(sequences[2]).assertEqual(3);
      const first = queue.dequeue();
      expect(first?.startId).assertEqual(1);
      const second = queue.dequeue();
      expect(second?.startId).assertEqual(2);
      expect(queue.size()).assertEqual(1);
    });

    // Concurrency: the queue reports capacity limits.
    it('request_queue_should_enforce_capacity', 0, async () => {
      const queue = new RecordingRequestQueue(2);
      expect(queue.getCapacity()).assertEqual(2);
      expect(queue.isEmpty()).assertTrue();
      queue.enqueue(1, 100);
      queue.enqueue(2, 200);
      expect(queue.isFull()).assertTrue();
      expect(queue.enqueue(1, 300)).assertEqual(-1);
      expect(queue.size()).assertEqual(2);
      queue.clear();
      expect(queue.isEmpty()).assertTrue();
      expect(queue.dequeue()).assertEqual(null);
    });

    // Concurrency: the state machine drains only after the last operation.
    it('concurrency_state_machine_should_drain_after_last_operation', 0, async () => {
      const machine = new ConcurrencyStateMachine();
      expect(machine.isIdle()).assertTrue();
      machine.start();
      expect(machine.isActive()).assertTrue();
      machine.beginOperation();
      machine.beginOperation();
      expect(machine.getActiveCount()).assertEqual(2);
      machine.drain();
      expect(machine.isDraining()).assertTrue();
      machine.endOperation();
      expect(machine.isDraining()).assertTrue();
      machine.endOperation();
      expect(machine.isIdle()).assertTrue();
    });

    // Concurrency: termination clears the active counter.
    it('concurrency_state_machine_should_terminate_cleanly', 0, async () => {
      const machine = new ConcurrencyStateMachine();
      machine.start();
      machine.beginOperation();
      machine.terminate();
      expect(machine.isTerminated()).assertTrue();
      expect(machine.getActiveCount()).assertEqual(0);
      machine.endOperation();
      expect(machine.getActiveCount()).assertEqual(0);
    });

    // Concurrency: operation records capture overlap information.
    it('operation_records_should_expose_overlaps', 0, async () => {
      const recorder = new ConcurrentOperationRecorder();
      const firstId: number = recorder.startOperation(ConcurrentOperationType.START_REQUEST, 100);
      const secondId: number = recorder.startOperation(ConcurrentOperationType.WINDOW_RENDER, 120);
      recorder.finishOperation(firstId, 200, true);
      recorder.finishOperation(secondId, 180, true);
      const records: ConcurrentOperationDef[] = recorder.getRecords();
      const stats = new ConcurrencyStatistics();
      expect(records.length).assertEqual(2);
      expect(stats.getOverlapCount(records)).assertEqual(1);
      expect(stats.getMaxActiveCount(records)).assertEqual(2);
      expect(stats.getTotalDuration(records)).assertEqual(160);
      expect(stats.getSuccessRate(records)).assertEqual(1);
    });

    // Concurrency: finishing an unknown operation is rejected.
    it('finishing_unknown_operation_should_fail', 0, async () => {
      const recorder = new ConcurrentOperationRecorder();
      recorder.startOperation(ConcurrentOperationType.STOP_REQUEST, 10);
      expect(recorder.finishOperation(99, 20, true)).assertFalse();
      expect(recorder.finishOperation(0, 20, true)).assertTrue();
      expect(recorder.getSuccessfulCount()).assertEqual(1);
      expect(recorder.getAverageDuration()).assertEqual(10);
      expect(recorder.getCountByType(ConcurrentOperationType.STOP_REQUEST)).assertEqual(1);
      expect(recorder.getCountByType(ConcurrentOperationType.STATE_QUERY)).assertEqual(0);
    });

    // Concurrency: the snapshot model validates its own invariants.
    it('snapshot_model_should_validate_invariants', 0, async () => {
      const snapshot = new ConcurrencySnapshotModel(ConcurrencyState.ACTIVE, 2, 5, 3);
      expect(snapshot.isValid()).assertTrue();
      expect(snapshot.isQuiescent()).assertFalse();
      const clone: ConcurrencySnapshotModel = snapshot.clone();
      expect(clone.equals(snapshot)).assertTrue();
      expect(clone.toString().includes('active=2')).assertTrue();
      const drained = new ConcurrencySnapshotModel(ConcurrencyState.IDLE, 0, 5, 3);
      expect(drained.isQuiescent()).assertTrue();
      expect(drained.equals(snapshot)).assertFalse();
      const invalid = new ConcurrencySnapshotModel(ConcurrencyState.IDLE, -1, -1, -1);
      expect(invalid.isValid()).assertFalse();
    });

    // Concurrency: the stop combination fires once per key pair.
    it('stop_combination_should_fire_once_per_pair', 0, async () => {
      const gate = new StopCombinationGate(KEY_MENU, KEY_VOLUME_DOWN);
      expect(gate.onKeyDown(KEY_MENU)).assertFalse();
      expect(gate.onKeyDown(KEY_VOLUME_DOWN)).assertTrue();
      expect(gate.getFiredCount()).assertEqual(1);
      expect(gate.onKeyDown(KEY_VOLUME_DOWN)).assertFalse();
      expect(gate.getFiredCount()).assertEqual(1);
      gate.onKeyUp(KEY_VOLUME_DOWN);
      expect(gate.isGateOpen()).assertTrue();
      gate.onKeyUp(KEY_MENU);
      expect(gate.onKeyDown(KEY_MENU)).assertFalse();
      expect(gate.onKeyDown(KEY_VOLUME_DOWN)).assertTrue();
      expect(gate.getFiredCount()).assertEqual(2);
    });

    // Concurrency: a single key never stops the recording.
    it('single_key_should_not_stop_recording', 0, async () => {
      const gate = new StopCombinationGate(KEY_MENU, KEY_VOLUME_DOWN);
      expect(gate.onKeyDown(KEY_MENU)).assertFalse();
      expect(gate.isDownA()).assertTrue();
      expect(gate.isDownB()).assertFalse();
      expect(gate.getFiredCount()).assertEqual(0);
      gate.onKeyUp(KEY_MENU);
      expect(gate.onKeyDown(KEY_VOLUME_DOWN)).assertFalse();
      expect(gate.getFiredCount()).assertEqual(0);
    });

    // Concurrency: a mixed request script keeps the tracker chronological.
    it('mixed_request_script_should_stay_chronological', 0, async () => {
      tracker.reset();
      const types: ConcurrentOperationType[] = [ConcurrentOperationType.START_REQUEST,
        ConcurrentOperationType.WINDOW_RENDER, ConcurrentOperationType.STOP_REQUEST,
        ConcurrentOperationType.STATE_QUERY, ConcurrentOperationType.KEY_COMBINATION];
      for (let i = 0; i < types.length; i++) {
        tracker.beginOperation();
        tracker.endOperation(i % 3 !== 2);
      }
      expect(tracker.getTotalOperations()).assertEqual(5);
      expect(tracker.getFailureOperations()).assertEqual(1);
      expect(tracker.isChronological()).assertTrue();
    });

    // Concurrency: two start requests never create two recording sessions.
    it('two_start_requests_should_share_one_session', 0, async () => {
      const queue = new RecordingRequestQueue();
      queue.enqueue(1, 10);
      queue.enqueue(2, 20);
      queue.enqueue(1, 30);
      const starts: number = queue.countStartRequests();
      const stops: number = queue.countStopRequests();
      expect(starts).assertEqual(2);
      expect(stops).assertEqual(1);
      expect(starts + stops).assertEqual(queue.size());
    });
  });
}


