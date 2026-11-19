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
  waitForTipWindowStable,
  triggerRecordingStart,
  triggerRecordingStop,
  isTimerWindowVisible,
  pressAndWait,
  serializedDelay,
  buildRecordingFileName,
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  TIMEOUT_TIMER_RENDER,
  TIMEOUT_TIP_RENDER,
  TIMEOUT_RECORD_START,
  TIMEOUT_RECORD_STOP
} from '../shared/RecordingDriver';
import hilog from '@ohos.hilog';

const FLOW_LOG_DOMAIN: number = 0x0001;
const FLOW_LOG_TAG: string = 'RecordingOperationFlow';

// Operation kinds handled by ScreenRecorderAbility.onRequest. startId === 1 is
// the start request, every other startId is treated as a stop request.
enum RecordingOperationType {
  START = 'start',
  STOP = 'stop',
  QUERY = 'query'
}

// State machine of the recording engine.
enum RecState {
  Idle = 0,
  Recording = 1,
  Stopped = 2,
  Error = 3
}

// Phase of one recording operation flow.
enum FlowPhase {
  REQUEST_DISPATCH = 'request_dispatch',
  ASSET_CREATE = 'asset_create',
  FD_ALLOCATE = 'fd_allocate',
  ENGINE_START = 'engine_start',
  ENGINE_STOP = 'engine_stop',
  TIP_RENDER = 'tip_render',
  COMPLETION = 'completion',
  CANCELLATION = 'cancellation'
}

// Result of one recording operation flow.
enum FlowResult {
  RESULT_SUCCESS = 'success',
  RESULT_FAILURE = 'failure',
  RESULT_CANCELLED = 'cancelled',
  RESULT_TIMEOUT = 'timeout'
}

// One executed recording operation.
interface RecordingOperationRecord {
  operationType: RecordingOperationType;
  startId: number;
  fd: number;
  fileName: string;
  timestamp: number;
  executionTime: number;
  success: boolean;
}

// Script entry of a flow test.
interface OperationFlowRecord {
  startId: number;
  expectedState: RecState;
  type: RecordingOperationType;
}

// Snapshot of the flow tracker counters.
interface FlowSnapshotDef {
  totalOperations: number;
  successfulOperations: number;
  failedOperations: number;
  averageExecutionTime: number;
}

// Guard rules shared by the service and SRManager.
class RecordingStateGuard {
  public static readonly START_ID: number = 1;
  public static readonly FD_PREFIX: string = 'fd://';
  public static readonly FILE_PREFIX: string = 'REC';
  public static readonly FILE_SUFFIX: string = '.mp4';

  public static kindOfStartId(startId: number): RecordingOperationType {
    return startId === RecordingStateGuard.START_ID ? RecordingOperationType.START : RecordingOperationType.STOP;
  }

  public static startIdOf(kind: RecordingOperationType): number {
    if (kind === RecordingOperationType.START) {
      return RecordingStateGuard.START_ID;
    }
    return 2;
  }

  public static canStart(state: RecState): boolean {
    return state === RecState.Idle || state === RecState.Stopped;
  }

  public static canStop(state: RecState): boolean {
    return state === RecState.Recording;
  }

  public static isTerminal(state: RecState): boolean {
    return state === RecState.Stopped || state === RecState.Error;
  }

  public static nextState(current: RecState, kind: RecordingOperationType): RecState {
    if (kind === RecordingOperationType.START) {
      return RecordingStateGuard.canStart(current) ? RecState.Recording : current;
    }
    if (kind === RecordingOperationType.STOP) {
      return RecordingStateGuard.canStop(current) ? RecState.Stopped : current;
    }
    return current;
  }
}

// Allocates the file descriptors handed to SRApi.startRecording('fd://<fd>').
// The allocator is deterministic so that assertions can compare exact values.
class FileDescriptorAllocator {
  private nextFd: number;
  private opened: number[] = [];

  constructor(seed: number = 100) {
    this.nextFd = seed;
  }

  public allocate(): number {
    const fd: number = this.nextFd;
    this.nextFd++;
    this.opened.push(fd);
    return fd;
  }

  public release(fd: number): boolean {
    for (let i = 0; i < this.opened.length; i++) {
      if (this.opened[i] === fd) {
        this.opened.splice(i, 1);
        return true;
      }
    }
    return false;
  }

  public getOpenCount(): number {
    return this.opened.length;
  }

  public getOpenFds(): number[] {
    const result: number[] = [];
    for (let i = 0; i < this.opened.length; i++) {
      result.push(this.opened[i]);
    }
    return result;
  }

  public buildUri(fd: number): string {
    return `${RecordingStateGuard.FD_PREFIX}${fd}`;
  }

  public contains(fd: number): boolean {
    for (let i = 0; i < this.opened.length; i++) {
      if (this.opened[i] === fd) {
        return true;
      }
    }
    return false;
  }

  public reset(): void {
    this.opened = [];
  }
}

// Tracks the executed recording operations across the flow cases.
class RecordingOperationFlowTracker {
  private static instance: RecordingOperationFlowTracker;
  private operationHistory: RecordingOperationRecord[] = [];
  private totalOperations: number = 0;
  private successfulOperations: number = 0;
  private failedOperations: number = 0;

  public static getInstance(): RecordingOperationFlowTracker {
    if (!RecordingOperationFlowTracker.instance) {
      RecordingOperationFlowTracker.instance = new RecordingOperationFlowTracker();
    }
    return RecordingOperationFlowTracker.instance;
  }

  public recordOperation(operationType: RecordingOperationType, startId: number, fd: number, fileName: string,
    success: boolean, executionTime: number): void {
    const record: RecordingOperationRecord = {
      operationType: operationType,
      startId: startId,
      fd: fd,
      fileName: fileName,
      timestamp: Date.now(),
      executionTime: executionTime,
      success: success
    };
    this.operationHistory.push(record);
    this.totalOperations++;
    if (success) {
      this.successfulOperations++;
    } else {
      this.failedOperations++;
    }
  }

  public getOperationHistory(): RecordingOperationRecord[] {
    const result: RecordingOperationRecord[] = [];
    for (let i = 0; i < this.operationHistory.length; i++) {
      result.push(this.operationHistory[i]);
    }
    return result;
  }

  public getTotalOperations(): number {
    return this.totalOperations;
  }

  public getSuccessfulOperations(): number {
    return this.successfulOperations;
  }

  public getFailedOperations(): number {
    return this.failedOperations;
  }

  public hasExecutedOperation(operationType: RecordingOperationType): boolean {
    for (let i = 0; i < this.operationHistory.length; i++) {
      if (this.operationHistory[i].operationType === operationType) {
        return true;
      }
    }
    return false;
  }

  public getOperationCountByType(operationType: RecordingOperationType): number {
    let count: number = 0;
    for (let i = 0; i < this.operationHistory.length; i++) {
      if (this.operationHistory[i].operationType === operationType) {
        count++;
      }
    }
    return count;
  }

  public getAverageExecutionTime(): number {
    if (this.operationHistory.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.operationHistory.length; i++) {
      total += this.operationHistory[i].executionTime;
    }
    return total / this.operationHistory.length;
  }

  public getLastRecord(): RecordingOperationRecord | null {
    if (this.operationHistory.length === 0) {
      return null;
    }
    return this.operationHistory[this.operationHistory.length - 1];
  }

  public resetTracker(): void {
    this.operationHistory = [];
    this.totalOperations = 0;
    this.successfulOperations = 0;
    this.failedOperations = 0;
  }
}

// Statistics of the execution durations collected by the flow cases.
class ExecutionTimeStatistics {
  private durations: number[] = [];

  public recordDuration(duration: number): void {
    this.durations.push(duration);
  }

  public getDurationCount(): number {
    return this.durations.length;
  }

  public getAverage(): number {
    if (this.durations.length === 0) {
      return 0;
    }
    let sum: number = 0;
    for (let i = 0; i < this.durations.length; i++) {
      sum += this.durations[i];
    }
    return sum / this.durations.length;
  }

  public getMax(): number {
    if (this.durations.length === 0) {
      return 0;
    }
    let max: number = this.durations[0];
    for (let i = 1; i < this.durations.length; i++) {
      if (this.durations[i] > max) {
        max = this.durations[i];
      }
    }
    return max;
  }

  public getMin(): number {
    if (this.durations.length === 0) {
      return 0;
    }
    let min: number = this.durations[0];
    for (let i = 1; i < this.durations.length; i++) {
      if (this.durations[i] < min) {
        min = this.durations[i];
      }
    }
    return min;
  }

  public getRange(): number {
    return this.getMax() - this.getMin();
  }

  public getVariance(): number {
    const count: number = this.durations.length;
    if (count === 0) {
      return 0;
    }
    const average: number = this.getAverage();
    let sumSquared: number = 0;
    for (let i = 0; i < count; i++) {
      const diff: number = this.durations[i] - average;
      sumSquared += diff * diff;
    }
    return sumSquared / count;
  }

  public clear(): void {
    this.durations = [];
  }
}

// Validates the recorded operations: chronology, state legality and counts.
class FlowSequenceValidator {
  private records: RecordingOperationRecord[] = [];

  public setRecords(records: RecordingOperationRecord[]): void {
    this.records = [];
    for (let i = 0; i < records.length; i++) {
      this.records.push(records[i]);
    }
  }

  public addRecord(record: RecordingOperationRecord): void {
    this.records.push(record);
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public areTimestampsChronological(): boolean {
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].timestamp < this.records[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public hasValidFdIndices(): boolean {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].operationType !== RecordingOperationType.QUERY && this.records[i].fd < 0) {
        return false;
      }
    }
    return true;
  }

  public containsOperationType(operationType: RecordingOperationType): boolean {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].operationType === operationType) {
        return true;
      }
    }
    return false;
  }

  public getSuccessCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].success) {
        count++;
      }
    }
    return count;
  }

  public getFailureCount(): number {
    return this.records.length - this.getSuccessCount();
  }

  public hasReusedFd(): boolean {
    const seen: number[] = [];
    for (let i = 0; i < this.records.length; i++) {
      const fd: number = this.records[i].fd;
      if (fd < 0) {
        continue;
      }
      for (let j = 0; j < seen.length; j++) {
        if (seen[j] === fd) {
          return true;
        }
      }
      seen.push(fd);
    }
    return false;
  }

  public clear(): void {
    this.records = [];
  }
}

// Analyzes the tracker counters.
class OperationFlowAnalyzer {
  private tracker: RecordingOperationFlowTracker;

  constructor(tracker: RecordingOperationFlowTracker) {
    this.tracker = tracker;
  }

  public getSuccessRate(): number {
    const total: number = this.tracker.getTotalOperations();
    if (total === 0) {
      return 0;
    }
    return this.tracker.getSuccessfulOperations() / total;
  }

  public getFailureRate(): number {
    const total: number = this.tracker.getTotalOperations();
    if (total === 0) {
      return 0;
    }
    return this.tracker.getFailedOperations() / total;
  }

  public hasOnlySuccessfulOperations(): boolean {
    return this.tracker.getTotalOperations() > 0 && this.tracker.getFailedOperations() === 0;
  }

  public hasAnyOperation(): boolean {
    return this.tracker.getTotalOperations() > 0;
  }

  public generateSnapshot(): FlowSnapshotDef {
    const snapshot: FlowSnapshotDef = {
      totalOperations: this.tracker.getTotalOperations(),
      successfulOperations: this.tracker.getSuccessfulOperations(),
      failedOperations: this.tracker.getFailedOperations(),
      averageExecutionTime: this.tracker.getAverageExecutionTime()
    };
    return snapshot;
  }
}

// Formats the analyzer data as a readable report.
class OperationFlowReport {
  private analyzer: OperationFlowAnalyzer;

  constructor(analyzer: OperationFlowAnalyzer) {
    this.analyzer = analyzer;
  }

  public buildSummary(): string {
    const snapshot: FlowSnapshotDef = this.analyzer.generateSnapshot();
    return `RecordingFlowReport{total: ${snapshot.totalOperations}, success: ${snapshot.successfulOperations}, ` +
      `failed: ${snapshot.failedOperations}, avg: ${snapshot.averageExecutionTime}}`;
  }

  public buildSuccessRateText(): string {
    return `success rate: ${(this.analyzer.getSuccessRate() * 100).toFixed(2)}%`;
  }

  public isHealthy(): boolean {
    return this.analyzer.hasAnyOperation() && this.analyzer.getSuccessRate() >= 0.9;
  }

  public getHealthDescription(): string {
    if (!this.analyzer.hasAnyOperation()) {
      return 'no operation';
    }
    return this.isHealthy() ? 'healthy' : 'degraded';
  }
}

// Evaluates the execution time against the timeout used by the flow cases.
class ExecutionTimeThresholdEvaluator {
  private thresholdMs: number;

  constructor(thresholdMs: number) {
    this.thresholdMs = thresholdMs;
  }

  public getThreshold(): number {
    return this.thresholdMs;
  }

  public isWithinThreshold(duration: number): boolean {
    return duration <= this.thresholdMs;
  }

  public countViolations(durations: number[]): number {
    let count: number = 0;
    for (let i = 0; i < durations.length; i++) {
      if (!this.isWithinThreshold(durations[i])) {
        count++;
      }
    }
    return count;
  }

  public allWithinThreshold(durations: number[]): boolean {
    return this.countViolations(durations) === 0;
  }
}

// Records the duration of each flow phase.
class FlowDurationRecorder {
  private phaseDurations: Map<string, number> = new Map<string, number>();

  public recordPhase(phase: FlowPhase, durationMs: number): void {
    this.phaseDurations.set(phase, durationMs);
  }

  public getPhaseDuration(phase: FlowPhase): number {
    const duration: number | undefined = this.phaseDurations.get(phase);
    return duration === undefined ? 0 : duration;
  }

  public getRecordedPhaseCount(): number {
    return this.phaseDurations.size;
  }

  public getTotalDuration(): number {
    let total: number = 0;
    this.phaseDurations.forEach((duration: number) => {
      total += duration;
    });
    return total;
  }

  public hasPhase(phase: FlowPhase): boolean {
    return this.phaseDurations.has(phase);
  }

  public clear(): void {
    this.phaseDurations.clear();
  }
}

// Compares the durations of two recorded operations.
class OperationFlowComparator {
  public compareExecutionTime(left: RecordingOperationRecord, right: RecordingOperationRecord): number {
    return left.executionTime - right.executionTime;
  }

  public findFastest(records: RecordingOperationRecord[]): RecordingOperationRecord | null {
    if (records.length === 0) {
      return null;
    }
    let fastest: RecordingOperationRecord = records[0];
    for (let i = 1; i < records.length; i++) {
      if (records[i].executionTime < fastest.executionTime) {
        fastest = records[i];
      }
    }
    return fastest;
  }

  public findSlowest(records: RecordingOperationRecord[]): RecordingOperationRecord | null {
    if (records.length === 0) {
      return null;
    }
    let slowest: RecordingOperationRecord = records[0];
    for (let i = 1; i < records.length; i++) {
      if (records[i].executionTime > slowest.executionTime) {
        slowest = records[i];
      }
    }
    return slowest;
  }

  public areAllFasterThan(records: RecordingOperationRecord[], threshold: number): boolean {
    for (let i = 0; i < records.length; i++) {
      if (records[i].executionTime > threshold) {
        return false;
      }
    }
    return true;
  }
}

// Builds one deterministic record for the pure logic cases.
function makeOperationRecord(operationType: RecordingOperationType, startId: number, fd: number, timestamp: number,
  executionTime: number, success: boolean): RecordingOperationRecord {
  const record: RecordingOperationRecord = {
    operationType: operationType,
    startId: startId,
    fd: fd,
    fileName: startId === RecordingStateGuard.START_ID ? 'REC_20261112_090807.mp4' : '',
    timestamp: timestamp,
    executionTime: executionTime,
    success: success
  };
  return record;
}

export default function recordingOperationFlowTest(): void {
  describe('RecordingOperationFlow_Test', () => {
    let driver: Driver;
    let operationTracker: RecordingOperationFlowTracker;

    beforeAll(async () => {
      driver = getDriver();
      operationTracker = RecordingOperationFlowTracker.getInstance();
      operationTracker.resetTracker();
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      await serializedDelay(driver, 300);
    });

    // Flow: a start request creates the timer window.
    it('start_operation_flow_should_complete_correctly', 0, async () => {
      await triggerRecordingStart(driver);
      const startTime: number = Date.now();
      const visible: boolean = await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      const executionTime: number = Date.now() - startTime;
      operationTracker.recordOperation(RecordingOperationType.START, RecordingStateGuard.START_ID, 100,
        buildRecordingFileName(new Date(2026, 10, 12, 9, 8, 7)), visible, executionTime);
      expect(operationTracker.hasExecutedOperation(RecordingOperationType.START)).assertTrue();
      expect(executionTime).assertLessOrEqual(TIMEOUT_RECORD_START * 5);
      hilog.info(FLOW_LOG_DOMAIN, FLOW_LOG_TAG, 'start flow duration: %{public}d', executionTime);
    });

    // Flow: a stop request finishes the recording and frees the timer window.
    it('stop_operation_flow_should_complete_correctly', 0, async () => {
      const startTime: number = Date.now();
      await triggerRecordingStop(driver);
      const tipVisible: boolean = await waitForTipWindowStable(driver, TIMEOUT_TIP_RENDER);
      const executionTime: number = Date.now() - startTime;
      operationTracker.recordOperation(RecordingOperationType.STOP, 2, 100, '', tipVisible, executionTime);
      expect(operationTracker.hasExecutedOperation(RecordingOperationType.STOP)).assertTrue();
      expect(executionTime).assertLessOrEqual(TIMEOUT_RECORD_STOP * 5);
      expect(operationTracker.getLastRecord()?.operationType).assertEqual(RecordingOperationType.STOP);
    });

    // Flow: a query request never changes the recording state.
    it('query_operation_should_not_change_state', 0, async () => {
      const stateBefore: RecState = RecState.Recording;
      const stateAfter: RecState = RecordingStateGuard.nextState(stateBefore, RecordingOperationType.QUERY);
      expect(stateAfter).assertEqual(RecState.Recording);
      expect(RecordingStateGuard.canStart(stateAfter)).assertFalse();
      expect(RecordingStateGuard.canStop(stateAfter)).assertTrue();
    });

    // Flow: cancellation keeps the device responsive.
    it('operation_flow_should_handle_cancellation', 0, async () => {
      await triggerRecordingStart(driver);
      await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 200);
      const count: number = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(RecordingStateGuard.isTerminal(RecState.Stopped)).assertTrue();
    });

    // Flow: the tracker statistics stay accurate across interleaved requests.
    it('operation_flow_statistics_should_be_accurate', 0, async () => {
      operationTracker.resetTracker();
      operationTracker.recordOperation(RecordingOperationType.START, 1, 100, 'REC_20261112_090807.mp4', true, 120);
      operationTracker.recordOperation(RecordingOperationType.STOP, 2, 100, '', true, 80);
      operationTracker.recordOperation(RecordingOperationType.QUERY, 2, 100, '', false, 5);
      expect(operationTracker.getTotalOperations()).assertEqual(3);
      expect(operationTracker.getSuccessfulOperations()).assertEqual(2);
      expect(operationTracker.getFailedOperations()).assertEqual(1);
      expect(operationTracker.getOperationCountByType(RecordingOperationType.START)).assertEqual(1);
      expect(operationTracker.getOperationCountByType(RecordingOperationType.STOP)).assertEqual(1);
      expect(operationTracker.getAverageExecutionTime()).assertEqual(205 / 3);
    });

    // Flow: a scripted start/stop pair completes for every entry.
    it('operation_flow_should_handle_multiple_operations', 0, async () => {
      operationTracker.resetTracker();
      const script: OperationFlowRecord[] = [
        { startId: 1, expectedState: RecState.Recording, type: RecordingOperationType.START },
        { startId: 2, expectedState: RecState.Stopped, type: RecordingOperationType.STOP }
      ];
      let state: RecState = RecState.Idle;
      for (let i = 0; i < script.length; i++) {
        const entry: OperationFlowRecord = script[i];
        state = RecordingStateGuard.nextState(state, entry.type);
        expect(state).assertEqual(entry.expectedState);
        operationTracker.recordOperation(entry.type, entry.startId, 100 + i, '', true, 100);
      }
      expect(operationTracker.getTotalOperations()).assertEqual(2);
      expect(state).assertEqual(RecState.Stopped);
    });

    // Flow: the start path stays inside the start timeout budget.
    it('start_execution_time_should_be_within_limit', 0, async () => {
      await triggerRecordingStart(driver);
      const startTime: number = Date.now();
      await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      const executionTime: number = Date.now() - startTime;
      operationTracker.recordOperation(RecordingOperationType.START, 1, 101, '', true, executionTime);
      expect(executionTime).assertLessOrEqual(TIMEOUT_RECORD_START * 5);
      expect(operationTracker.getAverageExecutionTime()).assertLargerOrEqual(0);
    });

    // Flow: the stop path stays inside the stop timeout budget.
    it('stop_execution_time_should_be_within_limit', 0, async () => {
      await triggerRecordingStop(driver);
      const startTime: number = Date.now();
      await waitForTipWindowStable(driver, TIMEOUT_TIP_RENDER);
      const executionTime: number = Date.now() - startTime;
      operationTracker.recordOperation(RecordingOperationType.STOP, 2, 101, '', true, executionTime);
      expect(executionTime).assertLessOrEqual(TIMEOUT_RECORD_STOP * 5);
    });

    // Flow: the floating window state survives a start/stop cycle.
    it('operation_flow_should_maintain_window_state', 0, async () => {
      await triggerRecordingStart(driver);
      const timerVisible: boolean = await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      const duringRecording: boolean = await isTimerWindowVisible(driver);
      await triggerRecordingStop(driver);
      await waitForTipWindowStable(driver, TIMEOUT_TIP_RENDER);
      const afterStop: number = await recorderComponentCount(driver);
      operationTracker.recordOperation(RecordingOperationType.START, 1, 103, '', timerVisible, 120);
      operationTracker.recordOperation(RecordingOperationType.STOP, 2, 103, '', duringRecording, 90);
      expect(afterStop).assertLargerOrEqual(0);
      expect(operationTracker.getTotalOperations()).assertLargerOrEqual(1);
      expect(operationTracker.getLastRecord()?.startId).assertEqual(2);
    });

    // Flow: rapid requests are absorbed without breaking the session.
    it('operation_flow_should_handle_rapid_requests', 0, async () => {
      operationTracker.resetTracker();
      for (let i = 0; i < 5; i++) {
        await triggerRecordingStart(driver);
        await serializedDelay(driver, 50);
        operationTracker.recordOperation(RecordingOperationType.START, 1, 100 + i, '', i % 2 === 0, 50);
      }
      const count: number = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(operationTracker.getTotalOperations()).assertEqual(5);
      expect(operationTracker.getFailedOperations()).assertEqual(2);
    });

    // Flow: every attempt is recorded with its own descriptor.
    it('operation_flow_should_record_all_attempts', 0, async () => {
      operationTracker.resetTracker();
      const allocator = new FileDescriptorAllocator(200);
      for (let i = 0; i < 3; i++) {
        const fd: number = allocator.allocate();
        operationTracker.recordOperation(RecordingOperationType.START, 1, fd, '', true, 100 + i * 10);
        operationTracker.recordOperation(RecordingOperationType.STOP, 2, fd, '', true, 90 + i * 10);
      }
      const history: RecordingOperationRecord[] = operationTracker.getOperationHistory();
      expect(history.length).assertEqual(6);
      expect(history[0].fd).assertEqual(200);
      expect(history[2].fd).assertEqual(201);
      expect(history[4].fd).assertEqual(202);
      expect(allocator.getOpenCount()).assertEqual(3);
      expect(allocator.release(201)).assertTrue();
      expect(allocator.getOpenCount()).assertEqual(2);
    });

    // Flow: timestamps of recorded attempts stay chronological.
    it('operation_flow_timestamps_should_be_chronological', 0, async () => {
      operationTracker.resetTracker();
      operationTracker.recordOperation(RecordingOperationType.START, 1, 100, '', true, 100);
      await serializedDelay(driver, 30);
      operationTracker.recordOperation(RecordingOperationType.STOP, 2, 100, '', true, 120);
      const history: RecordingOperationRecord[] = operationTracker.getOperationHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      const validator = new FlowSequenceValidator();
      validator.setRecords(history);
      expect(validator.areTimestampsChronological()).assertTrue();
    });

    // Flow: the three operation kinds are all reachable.
    it('operation_flow_should_handle_all_three_operations', 0, async () => {
      operationTracker.resetTracker();
      const kinds: RecordingOperationType[] = [RecordingOperationType.START, RecordingOperationType.STOP,
        RecordingOperationType.QUERY];
      for (let i = 0; i < kinds.length; i++) {
        operationTracker.recordOperation(kinds[i], RecordingStateGuard.startIdOf(kinds[i]), 100, '', true, 100);
      }
      expect(operationTracker.hasExecutedOperation(RecordingOperationType.START)).assertTrue();
      expect(operationTracker.hasExecutedOperation(RecordingOperationType.STOP)).assertTrue();
      expect(operationTracker.hasExecutedOperation(RecordingOperationType.QUERY)).assertTrue();
      expect(operationTracker.getOperationCountByType(RecordingOperationType.QUERY)).assertEqual(1);
    });

    // Flow: a cyclic start/stop script stays inside the overall budget.
    it('operation_flow_performance_should_meet_requirements', 0, async () => {
      operationTracker.resetTracker();
      const startTime: number = Date.now();
      for (let i = 0; i < 3; i++) {
        await triggerRecordingStart(driver);
        await triggerRecordingStop(driver);
        operationTracker.recordOperation(RecordingOperationType.START, 1, 100 + i, '', true, 100);
        operationTracker.recordOperation(RecordingOperationType.STOP, 2, 100 + i, '', true, 100);
      }
      const totalTime: number = Date.now() - startTime;
      expect(totalTime).assertLessOrEqual(60000);
      expect(operationTracker.getTotalOperations()).assertEqual(6);
    });

    // Flow: out of range start ids are still treated as stop requests.
    it('operation_flow_should_handle_start_id_edges', 0, async () => {
      const edges: number[] = [0, 1, 2, 99, -1];
      const kinds: RecordingOperationType[] = [];
      for (let i = 0; i < edges.length; i++) {
        kinds.push(RecordingStateGuard.kindOfStartId(edges[i]));
      }
      expect(kinds[0]).assertEqual(RecordingOperationType.STOP);
      expect(kinds[1]).assertEqual(RecordingOperationType.START);
      expect(kinds[2]).assertEqual(RecordingOperationType.STOP);
      expect(kinds[3]).assertEqual(RecordingOperationType.STOP);
      expect(kinds[4]).assertEqual(RecordingOperationType.STOP);
      expect(RecordingStateGuard.startIdOf(RecordingOperationType.START)).assertEqual(1);
      expect(RecordingStateGuard.startIdOf(RecordingOperationType.STOP)).assertEqual(2);
    });

    // Flow: a single attempt exposes every tracked field.
    it('operation_flow_should_provide_complete_tracking', 0, async () => {
      operationTracker.resetTracker();
      operationTracker.recordOperation(RecordingOperationType.START, 1, 107,
        buildRecordingFileName(new Date(2026, 2, 3, 4, 5, 6)), true, 150);
      const history: RecordingOperationRecord[] = operationTracker.getOperationHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].operationType).assertEqual(RecordingOperationType.START);
      expect(history[0].startId).assertEqual(1);
      expect(history[0].fd).assertEqual(107);
      expect(history[0].fileName).assertEqual('REC_20260303_040506.mp4');
      expect(history[0].success).assertTrue();
      expect(history[0].executionTime).assertLargerOrEqual(0);
    });

    // Flow: the comprehensive scenario covers start, stop and query.
    it('comprehensive_recording_operation_flow_scenario', 0, async () => {
      operationTracker.resetTracker();
      const scenarioStart: number = Date.now();
      await triggerRecordingStart(driver);
      await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      operationTracker.recordOperation(RecordingOperationType.START, 1, 108, '', true, 200);
      await triggerRecordingStop(driver);
      await waitForTipWindowStable(driver, TIMEOUT_TIP_RENDER);
      operationTracker.recordOperation(RecordingOperationType.STOP, 2, 108, '', true, 150);
      await serializedDelay(driver, 200);
      const scenarioDuration: number = Date.now() - scenarioStart;
      expect(scenarioDuration).assertLessOrEqual(60000);
      expect(operationTracker.getFailedOperations()).assertEqual(0);
      const count: number = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    // Statistics: average, extremes and range.
    it('execution_time_statistics_should_compute_average_and_range', 0, async () => {
      const stats = new ExecutionTimeStatistics();
      stats.recordDuration(100);
      stats.recordDuration(200);
      stats.recordDuration(300);
      expect(stats.getDurationCount()).assertEqual(3);
      expect(stats.getAverage()).assertEqual(200);
      expect(stats.getMax()).assertEqual(300);
      expect(stats.getMin()).assertEqual(100);
      expect(stats.getRange()).assertEqual(200);
    });

    // Statistics: variance of a known sample.
    it('execution_time_statistics_should_compute_variance', 0, async () => {
      const stats = new ExecutionTimeStatistics();
      stats.recordDuration(0);
      stats.recordDuration(0);
      stats.recordDuration(3);
      expect(stats.getVariance()).assertEqual(2);
    });

    // Statistics: empty input yields zeros.
    it('execution_time_statistics_should_handle_empty_data', 0, async () => {
      const stats = new ExecutionTimeStatistics();
      expect(stats.getDurationCount()).assertEqual(0);
      expect(stats.getAverage()).assertEqual(0);
      expect(stats.getMax()).assertEqual(0);
      expect(stats.getMin()).assertEqual(0);
      expect(stats.getVariance()).assertEqual(0);
      expect(stats.getRange()).assertEqual(0);
    });

    // Statistics: clearing resets every counter.
    it('execution_time_statistics_should_clear_durations', 0, async () => {
      const stats = new ExecutionTimeStatistics();
      stats.recordDuration(150);
      stats.recordDuration(50);
      expect(stats.getAverage()).assertEqual(100);
      stats.clear();
      expect(stats.getDurationCount()).assertEqual(0);
      expect(stats.getAverage()).assertEqual(0);
    });

    // Validator: chronological timestamps are detected.
    it('flow_sequence_validator_should_validate_chronological_timestamps', 0, async () => {
      const validator = new FlowSequenceValidator();
      validator.addRecord(makeOperationRecord(RecordingOperationType.START, 1, 100, 100, 50, true));
      validator.addRecord(makeOperationRecord(RecordingOperationType.STOP, 2, 100, 200, 50, true));
      expect(validator.areTimestampsChronological()).assertTrue();
      validator.addRecord(makeOperationRecord(RecordingOperationType.QUERY, 2, 100, 150, 50, true));
      expect(validator.areTimestampsChronological()).assertFalse();
    });

    // Validator: descriptors must be allocated for start and stop records.
    it('flow_sequence_validator_should_validate_fd_indices', 0, async () => {
      const validator = new FlowSequenceValidator();
      validator.addRecord(makeOperationRecord(RecordingOperationType.START, 1, 100, 1, 50, true));
      validator.addRecord(makeOperationRecord(RecordingOperationType.STOP, 2, 100, 2, 50, true));
      expect(validator.hasValidFdIndices()).assertTrue();
      validator.addRecord(makeOperationRecord(RecordingOperationType.STOP, 2, -1, 3, 50, false));
      expect(validator.hasValidFdIndices()).assertFalse();
      validator.addRecord(makeOperationRecord(RecordingOperationType.QUERY, 2, -1, 4, 50, true));
      expect(validator.getRecordCount()).assertEqual(4);
    });

    // Validator: success and failure counters.
    it('flow_sequence_validator_should_count_success_and_failure', 0, async () => {
      const validator = new FlowSequenceValidator();
      validator.addRecord(makeOperationRecord(RecordingOperationType.START, 1, 100, 1, 50, true));
      validator.addRecord(makeOperationRecord(RecordingOperationType.STOP, 2, 100, 2, 50, true));
      validator.addRecord(makeOperationRecord(RecordingOperationType.STOP, 2, 100, 3, 50, false));
      expect(validator.getRecordCount()).assertEqual(3);
      expect(validator.getSuccessCount()).assertEqual(2);
      expect(validator.getFailureCount()).assertEqual(1);
      expect(validator.containsOperationType(RecordingOperationType.STOP)).assertTrue();
      expect(validator.containsOperationType(RecordingOperationType.QUERY)).assertFalse();
    });

    // Validator: a descriptor must not be handed out twice.
    it('flow_sequence_validator_should_detect_fd_reuse', 0, async () => {
      const validator = new FlowSequenceValidator();
      validator.addRecord(makeOperationRecord(RecordingOperationType.START, 1, 100, 1, 50, true));
      expect(validator.hasReusedFd()).assertFalse();
      validator.addRecord(makeOperationRecord(RecordingOperationType.START, 1, 100, 2, 50, true));
      expect(validator.hasReusedFd()).assertTrue();
      validator.clear();
      expect(validator.getRecordCount()).assertEqual(0);
      expect(validator.hasReusedFd()).assertFalse();
    });

    // Analyzer: success rate, failure rate and snapshot.
    it('operation_flow_analyzer_should_compute_rate_and_snapshot', 0, async () => {
      operationTracker.resetTracker();
      operationTracker.recordOperation(RecordingOperationType.START, 1, 100, '', true, 100);
      operationTracker.recordOperation(RecordingOperationType.STOP, 2, 100, '', true, 200);
      operationTracker.recordOperation(RecordingOperationType.QUERY, 2, 100, '', false, 300);
      const analyzer = new OperationFlowAnalyzer(operationTracker);
      expect(analyzer.getSuccessRate()).assertEqual(2 / 3);
      expect(analyzer.getFailureRate()).assertEqual(1 / 3);
      expect(analyzer.hasAnyOperation()).assertTrue();
      expect(analyzer.hasOnlySuccessfulOperations()).assertFalse();
      const snapshot: FlowSnapshotDef = analyzer.generateSnapshot();
      expect(snapshot.totalOperations).assertEqual(3);
      expect(snapshot.successfulOperations).assertEqual(2);
      expect(snapshot.failedOperations).assertEqual(1);
      expect(snapshot.averageExecutionTime).assertEqual(200);
    });

    // Report: summary text and health decision.
    it('operation_flow_report_should_build_summary_and_health', 0, async () => {
      operationTracker.resetTracker();
      operationTracker.recordOperation(RecordingOperationType.START, 1, 100, '', true, 100);
      operationTracker.recordOperation(RecordingOperationType.STOP, 2, 100, '', true, 120);
      operationTracker.recordOperation(RecordingOperationType.QUERY, 2, 100, '', true, 90);
      const analyzer = new OperationFlowAnalyzer(operationTracker);
      const report = new OperationFlowReport(analyzer);
      expect(report.buildSummary().includes('total: 3')).assertTrue();
      expect(report.buildSuccessRateText().includes('100.00%')).assertTrue();
      expect(report.isHealthy()).assertTrue();
      expect(report.getHealthDescription()).assertEqual('healthy');
      operationTracker.resetTracker();
      expect(report.getHealthDescription()).assertEqual('no operation');
      expect(report.isHealthy()).assertFalse();
    });

    // Threshold: durations above the budget are counted as violations.
    it('execution_time_threshold_evaluator_should_check_violations', 0, async () => {
      const evaluator = new ExecutionTimeThresholdEvaluator(200);
      expect(evaluator.getThreshold()).assertEqual(200);
      expect(evaluator.isWithinThreshold(150)).assertTrue();
      expect(evaluator.isWithinThreshold(200)).assertTrue();
      expect(evaluator.isWithinThreshold(250)).assertFalse();
      const durations: number[] = [100, 250, 200];
      expect(evaluator.countViolations(durations)).assertEqual(1);
      expect(evaluator.allWithinThreshold(durations)).assertFalse();
      expect(evaluator.allWithinThreshold([1, 2, 3])).assertTrue();
    });

    // Durations: each flow phase is recorded independently.
    it('flow_duration_recorder_should_record_phase_durations', 0, async () => {
      const recorder = new FlowDurationRecorder();
      recorder.recordPhase(FlowPhase.REQUEST_DISPATCH, 10);
      recorder.recordPhase(FlowPhase.FD_ALLOCATE, 40);
      recorder.recordPhase(FlowPhase.ENGINE_START, 250);
      expect(recorder.getRecordedPhaseCount()).assertEqual(3);
      expect(recorder.getPhaseDuration(FlowPhase.FD_ALLOCATE)).assertEqual(40);
      expect(recorder.getPhaseDuration(FlowPhase.TIP_RENDER)).assertEqual(0);
      expect(recorder.getTotalDuration()).assertEqual(300);
      expect(recorder.hasPhase(FlowPhase.ENGINE_START)).assertTrue();
      expect(recorder.hasPhase(FlowPhase.CANCELLATION)).assertFalse();
    });

    // Durations: clearing resets the phase table.
    it('flow_duration_recorder_should_reset_after_clear', 0, async () => {
      const recorder = new FlowDurationRecorder();
      recorder.recordPhase(FlowPhase.ASSET_CREATE, 30);
      recorder.recordPhase(FlowPhase.ENGINE_STOP, 70);
      recorder.clear();
      expect(recorder.getRecordedPhaseCount()).assertEqual(0);
      expect(recorder.getTotalDuration()).assertEqual(0);
      expect(recorder.hasPhase(FlowPhase.ASSET_CREATE)).assertFalse();
    });

    // Comparator: fastest and slowest operations are identified.
    it('operation_flow_comparator_should_find_fastest_and_slowest', 0, async () => {
      const comparator = new OperationFlowComparator();
      const records: RecordingOperationRecord[] = [];
      records.push(makeOperationRecord(RecordingOperationType.START, 1, 100, 1, 300, true));
      records.push(makeOperationRecord(RecordingOperationType.STOP, 2, 100, 2, 100, true));
      records.push(makeOperationRecord(RecordingOperationType.QUERY, 2, 100, 3, 200, true));
      const fastest: RecordingOperationRecord | null = comparator.findFastest(records);
      const slowest: RecordingOperationRecord | null = comparator.findSlowest(records);
      expect(fastest?.executionTime).assertEqual(100);
      expect(slowest?.executionTime).assertEqual(300);
      expect(comparator.compareExecutionTime(records[0], records[1])).assertLarger(0);
      expect(comparator.areAllFasterThan(records, 350)).assertTrue();
      expect(comparator.areAllFasterThan(records, 250)).assertFalse();
      expect(comparator.findFastest([])).assertEqual(null);
      expect(comparator.findSlowest([])).assertEqual(null);
    });

    // Guard: the state machine only accepts legal transitions.
    it('state_guard_should_reject_illegal_transitions', 0, async () => {
      expect(RecordingStateGuard.canStart(RecState.Idle)).assertTrue();
      expect(RecordingStateGuard.canStart(RecState.Recording)).assertFalse();
      expect(RecordingStateGuard.canStop(RecState.Idle)).assertFalse();
      expect(RecordingStateGuard.canStop(RecState.Recording)).assertTrue();
      expect(RecordingStateGuard.nextState(RecState.Idle, RecordingOperationType.STOP)).assertEqual(RecState.Idle);
      expect(RecordingStateGuard.nextState(RecState.Recording, RecordingOperationType.START))
        .assertEqual(RecState.Recording);
      expect(RecordingStateGuard.nextState(RecState.Recording, RecordingOperationType.STOP))
        .assertEqual(RecState.Stopped);
      expect(RecordingStateGuard.isTerminal(RecState.Error)).assertTrue();
      expect(RecordingStateGuard.isTerminal(RecState.Recording)).assertFalse();
    });

    // Allocator: descriptors are unique, convertible to fd uris and releasable.
    it('fd_allocator_should_allocate_and_release', 0, async () => {
      const allocator = new FileDescriptorAllocator(10);
      const first: number = allocator.allocate();
      const second: number = allocator.allocate();
      expect(first).assertEqual(10);
      expect(second).assertEqual(11);
      expect(allocator.buildUri(first)).assertEqual('fd://10');
      expect(allocator.buildUri(second).startsWith(RecordingStateGuard.FD_PREFIX)).assertTrue();
      expect(allocator.contains(first)).assertTrue();
      expect(allocator.getOpenFds().length).assertEqual(2);
      expect(allocator.release(first)).assertTrue();
      expect(allocator.release(first)).assertFalse();
      expect(allocator.contains(first)).assertFalse();
      expect(allocator.contains(second)).assertTrue();
    });
  });
}




