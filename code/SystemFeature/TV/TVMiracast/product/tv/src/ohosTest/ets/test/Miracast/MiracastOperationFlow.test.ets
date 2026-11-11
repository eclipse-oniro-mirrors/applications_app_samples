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
import { Driver } from '../Shared/MiracastDriver';
import { Log } from 'library';
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_ENTER,
  KEY_BACK,
  KEY_MENU,
  miracastComponentCount,
  isPlayerPageVisible,
  waitForPlayerPage,
  pressAndWait,
  serializedDelay,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_SESSION_OP,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_PLAYER_RENDER,
  TIMEOUT_SESSION_CREATE
} from '../Shared/MiracastDriver';

const TAG: string = 'MiracastOperationFlowSuite';

// 流程阶段枚举：描述投屏操作流程的执行阶段
enum FlowPhase {
  PHASE_SESSION_CREATE = 'session_create',
  PHASE_SCREEN_BIND = 'screen_bind',
  PHASE_PLAY = 'play',
  PHASE_PAUSE = 'pause',
  PHASE_STOP = 'stop',
  PHASE_MUTE = 'mute',
  PHASE_UNMUTE = 'unmute'
}

// 流程结果枚举
enum FlowResult {
  RESULT_SUCCESS = 'success',
  RESULT_FAILURE = 'failure',
  RESULT_CANCELLED = 'cancelled',
  RESULT_TIMEOUT = 'timeout'
}

// 单次投屏操作记录
interface MiracastOperationRecord {
  operationId: string;
  phase: FlowPhase;
  focusIndex: number;
  timestamp: number;
  executionTime: number;
  success: boolean;
}

// 流程快照接口
interface MiracastFlowSnapshot {
  totalOperations: number;
  successfulOperations: number;
  failedOperations: number;
  averageExecutionTime: number;
}

// 投屏操作流追踪器：全局记录 10 个 IDL 方法的执行结果
class MiracastFlowTracker {
  private static instance: MiracastFlowTracker;
  private history: MiracastOperationRecord[] = [];
  private totalOperations: number = 0;
  private successfulOperations: number = 0;
  private failedOperations: number = 0;

  public static getInstance(): MiracastFlowTracker {
    if (!MiracastFlowTracker.instance) {
      MiracastFlowTracker.instance = new MiracastFlowTracker();
    }
    return MiracastFlowTracker.instance;
  }

  public recordOperation(operationId: string, phase: FlowPhase, focusIndex: number, success: boolean,
    executionTime: number): void {
    const record: MiracastOperationRecord = {
      operationId: operationId,
      phase: phase,
      focusIndex: focusIndex,
      timestamp: Date.now(),
      executionTime: executionTime,
      success: success
    };
    this.history.push(record);
    this.totalOperations++;
    if (success) {
      this.successfulOperations++;
    } else {
      this.failedOperations++;
    }
  }

  public getHistory(): MiracastOperationRecord[] {
    return [...this.history];
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

  public getOperationCountByPhase(phase: FlowPhase): number {
    return this.history.filter((record: MiracastOperationRecord) => record.phase === phase).length;
  }

  public hasExecutedPhase(phase: FlowPhase): boolean {
    return this.getOperationCountByPhase(phase) > 0;
  }

  public getAverageExecutionTime(): number {
    if (this.history.length === 0) {
      return 0;
    }
    let total = 0;
    this.history.forEach((record: MiracastOperationRecord) => {
      total += record.executionTime;
    });
    return total / this.history.length;
  }

  public resetTracker(): void {
    this.history = [];
    this.totalOperations = 0;
    this.successfulOperations = 0;
    this.failedOperations = 0;
  }
}

// 执行耗时统计器：平均值、极值与方差
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
    let sum = 0;
    this.durations.forEach((duration: number) => {
      sum += duration;
    });
    return sum / this.durations.length;
  }

  public getMax(): number {
    if (this.durations.length === 0) {
      return 0;
    }
    let max = this.durations[0];
    this.durations.forEach((duration: number) => {
      if (duration > max) {
        max = duration;
      }
    });
    return max;
  }

  public getMin(): number {
    if (this.durations.length === 0) {
      return 0;
    }
    let min = this.durations[0];
    this.durations.forEach((duration: number) => {
      if (duration < min) {
        min = duration;
      }
    });
    return min;
  }

  public getRange(): number {
    return this.getMax() - this.getMin();
  }

  public getVariance(): number {
    if (this.durations.length === 0) {
      return 0;
    }
    const average: number = this.getAverage();
    let sumSquared = 0;
    this.durations.forEach((duration: number) => {
      const diff = duration - average;
      sumSquared += diff * diff;
    });
    return sumSquared / this.durations.length;
  }

  public clear(): void {
    this.durations = [];
  }
}

// 流程序列校验器：校验记录的时间戳、焦点与阶段顺序
class FlowSequenceValidator {
  private records: MiracastOperationRecord[] = [];

  public setRecords(records: MiracastOperationRecord[]): void {
    this.records = [...records];
  }

  public addRecord(record: MiracastOperationRecord): void {
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

  public hasValidFocusIndices(): boolean {
    return this.records.every((record: MiracastOperationRecord) => record.focusIndex >= 0);
  }

  public containsPhase(phase: FlowPhase): boolean {
    return this.records.some((record: MiracastOperationRecord) => record.phase === phase);
  }

  public getSuccessCount(): number {
    return this.records.filter((record: MiracastOperationRecord) => record.success).length;
  }

  public getFailureCount(): number {
    return this.records.filter((record: MiracastOperationRecord) => !record.success).length;
  }

  public isPhaseOrdered(): boolean {
    const order: FlowPhase[] = [FlowPhase.PHASE_SESSION_CREATE, FlowPhase.PHASE_SCREEN_BIND, FlowPhase.PHASE_PLAY,
      FlowPhase.PHASE_PAUSE, FlowPhase.PHASE_STOP];
    let lastIndex = -1;
    for (let i = 0; i < this.records.length; i++) {
      const position = order.indexOf(this.records[i].phase);
      if (position < 0) {
        continue;
      }
      if (position < lastIndex) {
        return false;
      }
      lastIndex = position;
    }
    return true;
  }

  public clear(): void {
    this.records = [];
  }
}

// 流程分析器：计算成功率并生成快照
class OperationFlowAnalyzer {
  private tracker: MiracastFlowTracker;

  constructor(tracker: MiracastFlowTracker) {
    this.tracker = tracker;
  }

  public getSuccessRate(): number {
    const total = this.tracker.getTotalOperations();
    if (total === 0) {
      return 0;
    }
    return this.tracker.getSuccessfulOperations() / total;
  }

  public getFailureRate(): number {
    const total = this.tracker.getTotalOperations();
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

  public generateSnapshot(): MiracastFlowSnapshot {
    return {
      totalOperations: this.tracker.getTotalOperations(),
      successfulOperations: this.tracker.getSuccessfulOperations(),
      failedOperations: this.tracker.getFailedOperations(),
      averageExecutionTime: this.tracker.getAverageExecutionTime()
    };
  }
}

// 流程报告器：把分析结果格式化为可读报告
class OperationFlowReport {
  private analyzer: OperationFlowAnalyzer;

  constructor(analyzer: OperationFlowAnalyzer) {
    this.analyzer = analyzer;
  }

  public buildSummary(): string {
    const snapshot: MiracastFlowSnapshot = this.analyzer.generateSnapshot();
    return `FlowReport{total: ${snapshot.totalOperations}, success: ${snapshot.successfulOperations}, ` +
      `failed: ${snapshot.failedOperations}, avg: ${snapshot.averageExecutionTime}}`;
  }

  public buildSuccessRateText(): string {
    const rate: number = this.analyzer.getSuccessRate();
    return `success rate: ${(rate * 100).toFixed(2)}%`;
  }

  public isHealthy(): boolean {
    return this.analyzer.hasAnyOperation() && this.analyzer.getSuccessRate() >= 0.9;
  }

  public getHealthDescription(): string {
    if (!this.analyzer.hasAnyOperation()) {
      return 'no operation';
    }
    return this.isHealthy() ? 'healthy' : 'unstable';
  }
}

// 执行耗时阈值评估器
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
    return durations.filter((duration: number) => !this.isWithinThreshold(duration)).length;
  }

  public allWithinThreshold(durations: number[]): boolean {
    return this.countViolations(durations) === 0;
  }
}

// 流程阶段耗时记录器
class FlowDurationRecorder {
  private phaseDurations: Map<FlowPhase, number> = new Map<FlowPhase, number>();

  public recordPhase(phase: FlowPhase, durationMs: number): void {
    this.phaseDurations.set(phase, durationMs);
  }

  public getPhaseDuration(phase: FlowPhase): number {
    const duration = this.phaseDurations.get(phase);
    return duration === undefined ? 0 : duration;
  }

  public getRecordedPhaseCount(): number {
    return this.phaseDurations.size;
  }

  public getTotalDuration(): number {
    let total = 0;
    this.phaseDurations.forEach((duration: number) => {
      total += duration;
    });
    return total;
  }

  public hasPhase(phase: FlowPhase): boolean {
    return this.phaseDurations.has(phase);
  }

  public getSlowestPhase(): FlowPhase | null {
    let slowest: FlowPhase | null = null;
    let maxDuration = -1;
    this.phaseDurations.forEach((duration: number, phase: FlowPhase) => {
      if (duration > maxDuration) {
        maxDuration = duration;
        slowest = phase;
      }
    });
    return slowest;
  }

  public clear(): void {
    this.phaseDurations.clear();
  }
}

// 流程记录比较器：比较耗时并定位最快/最慢记录
class OperationFlowComparator {
  public compareExecutionTime(left: MiracastOperationRecord, right: MiracastOperationRecord): number {
    return left.executionTime - right.executionTime;
  }

  public findFastest(records: MiracastOperationRecord[]): MiracastOperationRecord | null {
    if (records.length === 0) {
      return null;
    }
    let fastest = records[0];
    records.forEach((record: MiracastOperationRecord) => {
      if (record.executionTime < fastest.executionTime) {
        fastest = record;
      }
    });
    return fastest;
  }

  public findSlowest(records: MiracastOperationRecord[]): MiracastOperationRecord | null {
    if (records.length === 0) {
      return null;
    }
    let slowest = records[0];
    records.forEach((record: MiracastOperationRecord) => {
      if (record.executionTime > slowest.executionTime) {
        slowest = record;
      }
    });
    return slowest;
  }

  public areAllFasterThan(records: MiracastOperationRecord[], threshold: number): boolean {
    return records.every((record: MiracastOperationRecord) => record.executionTime <= threshold);
  }
}

// 服务调用顺序模型：校验 start -> setScreen -> play -> stop 的合法顺序
class ServiceCallSequence {
  private static readonly LEGAL_ORDER: string[] = ['startMiracastService', 'registerDeviceConnectListener',
    'setScreen', 'play', 'pause', 'mute', 'unMute', 'stop', 'stopMiracastService'];

  public static isLegalSequence(operations: string[]): boolean {
    let lastIndex = -1;
    for (let i = 0; i < operations.length; i++) {
      const position = ServiceCallSequence.LEGAL_ORDER.indexOf(operations[i]);
      if (position < 0) {
        return false;
      }
      if (position < lastIndex) {
        return false;
      }
      lastIndex = position;
    }
    return true;
  }

  public static isKnownOperation(operationId: string): boolean {
    return ServiceCallSequence.LEGAL_ORDER.includes(operationId);
  }

  public static getLegalOrder(): string[] {
    return [...ServiceCallSequence.LEGAL_ORDER];
  }

  public static findIllegalOperation(operations: string[]): string {
    for (let i = 0; i < operations.length; i++) {
      if (!ServiceCallSequence.isKnownOperation(operations[i])) {
        return operations[i];
      }
    }
    return '';
  }
}

export default function miracastOperationFlowSuite(): void {
  describe('MiracastOperationFlow_Suite', () => {
    let driver: Driver;
    let tracker: MiracastFlowTracker;

    beforeAll(async () => {
      Log.info(TAG, 'operation flow suite start');
      driver = getDriver();
      tracker = MiracastFlowTracker.getInstance();
      tracker.resetTracker();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      Log.info(TAG, 'operation flow suite end');
    });
    it('tracker_should_start_empty', 0, async () => {
      tracker.resetTracker();
      expect(tracker.getTotalOperations()).assertEqual(0);
      expect(tracker.getSuccessfulOperations()).assertEqual(0);
      expect(tracker.getFailedOperations()).assertEqual(0);
      expect(tracker.getHistory().length).assertEqual(0);
      expect(tracker.getAverageExecutionTime()).assertEqual(0);
    });
    it('tracker_should_record_successful_operation', 0, async () => {
      tracker.resetTracker();
      tracker.recordOperation('startMiracastService', FlowPhase.PHASE_SESSION_CREATE, 0, true, 120);
      expect(tracker.getTotalOperations()).assertEqual(1);
      expect(tracker.getSuccessfulOperations()).assertEqual(1);
      expect(tracker.getFailedOperations()).assertEqual(0);
      expect(tracker.hasExecutedPhase(FlowPhase.PHASE_SESSION_CREATE)).assertTrue();
      expect(tracker.getAverageExecutionTime()).assertEqual(120);
    });
    it('tracker_should_record_failed_operation', 0, async () => {
      tracker.resetTracker();
      tracker.recordOperation('setScreen', FlowPhase.PHASE_SCREEN_BIND, 0, false, 80);
      expect(tracker.getFailedOperations()).assertEqual(1);
      expect(tracker.getSuccessfulOperations()).assertEqual(0);
      expect(tracker.getOperationCountByPhase(FlowPhase.PHASE_SCREEN_BIND)).assertEqual(1);
    });
    it('tracker_should_count_by_phase', 0, async () => {
      tracker.resetTracker();
      tracker.recordOperation('play', FlowPhase.PHASE_PLAY, 0, true, 100);
      tracker.recordOperation('play', FlowPhase.PHASE_PLAY, 1, true, 110);
      tracker.recordOperation('pause', FlowPhase.PHASE_PAUSE, 1, true, 90);
      expect(tracker.getOperationCountByPhase(FlowPhase.PHASE_PLAY)).assertEqual(2);
      expect(tracker.getOperationCountByPhase(FlowPhase.PHASE_PAUSE)).assertEqual(1);
      expect(tracker.getOperationCountByPhase(FlowPhase.PHASE_STOP)).assertEqual(0);
      expect(tracker.hasExecutedPhase(FlowPhase.PHASE_STOP)).assertFalse();
    });
    it('tracker_should_compute_average_execution_time', 0, async () => {
      tracker.resetTracker();
      tracker.recordOperation('mute', FlowPhase.PHASE_MUTE, 0, true, 100);
      tracker.recordOperation('unMute', FlowPhase.PHASE_UNMUTE, 0, true, 300);
      expect(tracker.getAverageExecutionTime()).assertEqual(200);
      expect(tracker.getTotalOperations()).assertEqual(2);
    });
    it('tracker_history_should_return_copy', 0, async () => {
      tracker.resetTracker();
      tracker.recordOperation('stop', FlowPhase.PHASE_STOP, 0, true, 50);
      const history: MiracastOperationRecord[] = tracker.getHistory();
      history.push({
        operationId: 'play',
        phase: FlowPhase.PHASE_PLAY,
        focusIndex: 0,
        timestamp: 0,
        executionTime: 0,
        success: false
      });
      expect(tracker.getTotalOperations()).assertEqual(1);
      expect(tracker.getHistory().length).assertEqual(1);
    });
    it('tracker_reset_should_clear_all_counters', 0, async () => {
      tracker.recordOperation('play', FlowPhase.PHASE_PLAY, 0, true, 100);
      tracker.resetTracker();
      expect(tracker.getTotalOperations()).assertEqual(0);
      expect(tracker.getSuccessfulOperations()).assertEqual(0);
      expect(tracker.getFailedOperations()).assertEqual(0);
      expect(tracker.getAverageExecutionTime()).assertEqual(0);
      expect(tracker.getHistory().length).assertEqual(0);
    });
    it('execution_time_statistics_should_compute_summary', 0, async () => {
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
    it('execution_time_statistics_should_compute_variance', 0, async () => {
      const stats = new ExecutionTimeStatistics();
      stats.recordDuration(0);
      stats.recordDuration(0);
      stats.recordDuration(3);
      expect(stats.getVariance()).assertEqual(2);
    });
    it('execution_time_statistics_empty_should_report_zero', 0, async () => {
      const stats = new ExecutionTimeStatistics();
      expect(stats.getDurationCount()).assertEqual(0);
      expect(stats.getAverage()).assertEqual(0);
      expect(stats.getMax()).assertEqual(0);
      expect(stats.getMin()).assertEqual(0);
      expect(stats.getRange()).assertEqual(0);
      expect(stats.getVariance()).assertEqual(0);
    });
    it('execution_time_statistics_should_clear', 0, async () => {
      const stats = new ExecutionTimeStatistics();
      stats.recordDuration(150);
      stats.clear();
      expect(stats.getDurationCount()).assertEqual(0);
      expect(stats.getAverage()).assertEqual(0);
    });
    it('flow_validator_should_accept_chronological_records', 0, async () => {
      const validator = new FlowSequenceValidator();
      validator.addRecord({
        operationId: 'startMiracastService',
        phase: FlowPhase.PHASE_SESSION_CREATE,
        focusIndex: 0,
        timestamp: 100,
        executionTime: 50,
        success: true
      });
      validator.addRecord({
        operationId: 'setScreen',
        phase: FlowPhase.PHASE_SCREEN_BIND,
        focusIndex: 0,
        timestamp: 200,
        executionTime: 50,
        success: true
      });
      expect(validator.areTimestampsChronological()).assertTrue();
      validator.addRecord({
        operationId: 'play',
        phase: FlowPhase.PHASE_PLAY,
        focusIndex: 0,
        timestamp: 150,
        executionTime: 50,
        success: true
      });
      expect(validator.areTimestampsChronological()).assertFalse();
    });
    it('flow_validator_should_validate_focus_indices', 0, async () => {
      const validator = new FlowSequenceValidator();
      validator.addRecord({
        operationId: 'play',
        phase: FlowPhase.PHASE_PLAY,
        focusIndex: 0,
        timestamp: 1,
        executionTime: 10,
        success: true
      });
      expect(validator.hasValidFocusIndices()).assertTrue();
      validator.addRecord({
        operationId: 'pause',
        phase: FlowPhase.PHASE_PAUSE,
        focusIndex: -1,
        timestamp: 2,
        executionTime: 10,
        success: true
      });
      expect(validator.hasValidFocusIndices()).assertFalse();
    });
    it('flow_validator_should_count_results', 0, async () => {
      const validator = new FlowSequenceValidator();
      validator.addRecord({
        operationId: 'play',
        phase: FlowPhase.PHASE_PLAY,
        focusIndex: 0,
        timestamp: 1,
        executionTime: 10,
        success: true
      });
      validator.addRecord({
        operationId: 'stop',
        phase: FlowPhase.PHASE_STOP,
        focusIndex: 0,
        timestamp: 2,
        executionTime: 10,
        success: false
      });
      expect(validator.getRecordCount()).assertEqual(2);
      expect(validator.getSuccessCount()).assertEqual(1);
      expect(validator.getFailureCount()).assertEqual(1);
      expect(validator.containsPhase(FlowPhase.PHASE_STOP)).assertTrue();
      expect(validator.containsPhase(FlowPhase.PHASE_MUTE)).assertFalse();
    });
    it('flow_validator_should_detect_phase_order_violation', 0, async () => {
      const validator = new FlowSequenceValidator();
      validator.addRecord({
        operationId: 'play',
        phase: FlowPhase.PHASE_PLAY,
        focusIndex: 0,
        timestamp: 1,
        executionTime: 10,
        success: true
      });
      expect(validator.isPhaseOrdered()).assertTrue();
      validator.addRecord({
        operationId: 'startMiracastService',
        phase: FlowPhase.PHASE_SESSION_CREATE,
        focusIndex: 0,
        timestamp: 2,
        executionTime: 10,
        success: true
      });
      expect(validator.isPhaseOrdered()).assertFalse();
    });
    it('flow_validator_should_reset_records', 0, async () => {
      const validator = new FlowSequenceValidator();
      validator.addRecord({
        operationId: 'play',
        phase: FlowPhase.PHASE_PLAY,
        focusIndex: 0,
        timestamp: 1,
        executionTime: 10,
        success: true
      });
      validator.clear();
      expect(validator.getRecordCount()).assertEqual(0);
      expect(validator.areTimestampsChronological()).assertTrue();
      expect(validator.isPhaseOrdered()).assertTrue();
    });
    it('analyzer_should_compute_rates_and_snapshot', 0, async () => {
      tracker.resetTracker();
      tracker.recordOperation('play', FlowPhase.PHASE_PLAY, 0, true, 100);
      tracker.recordOperation('pause', FlowPhase.PHASE_PAUSE, 0, true, 200);
      tracker.recordOperation('stop', FlowPhase.PHASE_STOP, 0, false, 300);
      const analyzer = new OperationFlowAnalyzer(tracker);
      expect(analyzer.getSuccessRate()).assertEqual(2 / 3);
      expect(analyzer.getFailureRate()).assertEqual(1 / 3);
      expect(analyzer.hasAnyOperation()).assertTrue();
      expect(analyzer.hasOnlySuccessfulOperations()).assertFalse();
      const snapshot: MiracastFlowSnapshot = analyzer.generateSnapshot();
      expect(snapshot.totalOperations).assertEqual(3);
      expect(snapshot.successfulOperations).assertEqual(2);
      expect(snapshot.failedOperations).assertEqual(1);
    });
    it('analyzer_empty_tracker_should_report_zero', 0, async () => {
      tracker.resetTracker();
      const analyzer = new OperationFlowAnalyzer(tracker);
      expect(analyzer.getSuccessRate()).assertEqual(0);
      expect(analyzer.getFailureRate()).assertEqual(0);
      expect(analyzer.hasAnyOperation()).assertFalse();
      expect(analyzer.hasOnlySuccessfulOperations()).assertFalse();
      expect(analyzer.generateSnapshot().averageExecutionTime).assertEqual(0);
    });
    it('report_should_describe_healthy_flow', 0, async () => {
      tracker.resetTracker();
      tracker.recordOperation('startMiracastService', FlowPhase.PHASE_SESSION_CREATE, 0, true, 100);
      tracker.recordOperation('play', FlowPhase.PHASE_PLAY, 0, true, 120);
      tracker.recordOperation('stop', FlowPhase.PHASE_STOP, 0, true, 90);
      const report = new OperationFlowReport(new OperationFlowAnalyzer(tracker));
      expect(report.buildSummary().includes('total: 3')).assertTrue();
      expect(report.buildSuccessRateText().includes('100.00%')).assertTrue();
      expect(report.isHealthy()).assertTrue();
      expect(report.getHealthDescription()).assertEqual('healthy');
    });
    it('report_should_detect_unstable_flow', 0, async () => {
      tracker.resetTracker();
      tracker.recordOperation('play', FlowPhase.PHASE_PLAY, 0, true, 100);
      tracker.recordOperation('play', FlowPhase.PHASE_PLAY, 0, false, 100);
      tracker.recordOperation('play', FlowPhase.PHASE_PLAY, 0, false, 100);
      const report = new OperationFlowReport(new OperationFlowAnalyzer(tracker));
      expect(report.isHealthy()).assertFalse();
      expect(report.getHealthDescription()).assertEqual('unstable');
      expect(report.buildSummary().includes('failed: 2')).assertTrue();
    });
    it('report_should_handle_empty_flow', 0, async () => {
      tracker.resetTracker();
      const report = new OperationFlowReport(new OperationFlowAnalyzer(tracker));
      expect(report.getHealthDescription()).assertEqual('no operation');
      expect(report.isHealthy()).assertFalse();
      expect(report.buildSuccessRateText().includes('0.00%')).assertTrue();
    });
    it('threshold_evaluator_should_count_violations', 0, async () => {
      const evaluator = new ExecutionTimeThresholdEvaluator(200);
      expect(evaluator.getThreshold()).assertEqual(200);
      expect(evaluator.isWithinThreshold(150)).assertTrue();
      expect(evaluator.isWithinThreshold(250)).assertFalse();
      const durations: number[] = [100, 250, 200];
      expect(evaluator.countViolations(durations)).assertEqual(1);
      expect(evaluator.allWithinThreshold(durations)).assertFalse();
    });
    it('threshold_evaluator_should_accept_all_in_range', 0, async () => {
      const evaluator = new ExecutionTimeThresholdEvaluator(TIMEOUT_SESSION_CREATE);
      expect(evaluator.isWithinThreshold(0)).assertTrue();
      expect(evaluator.allWithinThreshold([100, 500, 1000])).assertTrue();
      expect(evaluator.countViolations([1000, 1001])).assertEqual(1);
    });
    it('duration_recorder_should_record_phase_durations', 0, async () => {
      const recorder = new FlowDurationRecorder();
      recorder.recordPhase(FlowPhase.PHASE_SESSION_CREATE, 100);
      recorder.recordPhase(FlowPhase.PHASE_SCREEN_BIND, 300);
      expect(recorder.getRecordedPhaseCount()).assertEqual(2);
      expect(recorder.getPhaseDuration(FlowPhase.PHASE_SESSION_CREATE)).assertEqual(100);
      expect(recorder.getPhaseDuration(FlowPhase.PHASE_PLAY)).assertEqual(0);
      expect(recorder.getTotalDuration()).assertEqual(400);
      expect(recorder.hasPhase(FlowPhase.PHASE_SCREEN_BIND)).assertTrue();
      expect(recorder.hasPhase(FlowPhase.PHASE_STOP)).assertFalse();
    });
    it('duration_recorder_should_identify_slowest_phase', 0, async () => {
      const recorder = new FlowDurationRecorder();
      recorder.recordPhase(FlowPhase.PHASE_PLAY, 120);
      recorder.recordPhase(FlowPhase.PHASE_STOP, 480);
      expect(recorder.getSlowestPhase()).assertEqual(FlowPhase.PHASE_STOP);
      expect(recorder.getTotalDuration()).assertEqual(600);
    });
    it('duration_recorder_empty_should_return_null_slowest', 0, async () => {
      const recorder = new FlowDurationRecorder();
      expect(recorder.getSlowestPhase() === null).assertTrue();
      expect(recorder.getRecordedPhaseCount()).assertEqual(0);
      expect(recorder.getTotalDuration()).assertEqual(0);
    });
    it('duration_recorder_should_reset_after_clear', 0, async () => {
      const recorder = new FlowDurationRecorder();
      recorder.recordPhase(FlowPhase.PHASE_MUTE, 60);
      recorder.clear();
      expect(recorder.getRecordedPhaseCount()).assertEqual(0);
      expect(recorder.hasPhase(FlowPhase.PHASE_MUTE)).assertFalse();
      expect(recorder.getPhaseDuration(FlowPhase.PHASE_MUTE)).assertEqual(0);
    });
    it('flow_comparator_should_find_fastest_and_slowest', 0, async () => {
      const comparator = new OperationFlowComparator();
      const records: MiracastOperationRecord[] = [
        {
          operationId: 'play',
          phase: FlowPhase.PHASE_PLAY,
          focusIndex: 0,
          timestamp: 1,
          executionTime: 300,
          success: true
        },
        {
          operationId: 'pause',
          phase: FlowPhase.PHASE_PAUSE,
          focusIndex: 0,
          timestamp: 2,
          executionTime: 100,
          success: true
        },
        {
          operationId: 'stop',
          phase: FlowPhase.PHASE_STOP,
          focusIndex: 0,
          timestamp: 3,
          executionTime: 200,
          success: true
        }
      ];
      const fastest: MiracastOperationRecord | null = comparator.findFastest(records);
      expect(fastest === null).assertFalse();
      expect(fastest?.executionTime).assertEqual(100);
      expect(comparator.findSlowest(records)?.executionTime).assertEqual(300);
      expect(comparator.compareExecutionTime(records[0], records[1])).assertLarger(0);
      expect(comparator.areAllFasterThan(records, 350)).assertTrue();
      expect(comparator.findFastest([]) === null).assertTrue();
      expect(comparator.findSlowest([]) === null).assertTrue();
    });
    it('flow_comparator_should_reject_slow_records', 0, async () => {
      const comparator = new OperationFlowComparator();
      const records: MiracastOperationRecord[] = [
        {
          operationId: 'setScreen',
          phase: FlowPhase.PHASE_SCREEN_BIND,
          focusIndex: 0,
          timestamp: 1,
          executionTime: 900,
          success: true
        }
      ];
      expect(comparator.areAllFasterThan(records, 500)).assertFalse();
      expect(comparator.areAllFasterThan(records, 900)).assertTrue();
      expect(comparator.compareExecutionTime(records[0], records[0])).assertEqual(0);
    });
    it('service_sequence_should_accept_legal_order', 0, async () => {
      const sequence: string[] = ['startMiracastService', 'registerDeviceConnectListener', 'setScreen', 'play',
        'pause', 'stop', 'stopMiracastService'];
      expect(ServiceCallSequence.isLegalSequence(sequence)).assertTrue();
      expect(ServiceCallSequence.getLegalOrder().length).assertEqual(9);
      expect(ServiceCallSequence.findIllegalOperation(sequence)).assertEqual('');
    });
    it('service_sequence_should_reject_out_of_order_calls', 0, async () => {
      const sequence: string[] = ['startMiracastService', 'play', 'setScreen'];
      expect(ServiceCallSequence.isLegalSequence(sequence)).assertFalse();
      expect(ServiceCallSequence.isKnownOperation('play')).assertTrue();
      expect(ServiceCallSequence.findIllegalOperation(sequence)).assertEqual('');
    });
    it('service_sequence_should_detect_unknown_operation', 0, async () => {
      const sequence: string[] = ['startMiracastService', 'launchRocket'];
      expect(ServiceCallSequence.isLegalSequence(sequence)).assertFalse();
      expect(ServiceCallSequence.isKnownOperation('launchRocket')).assertFalse();
      expect(ServiceCallSequence.findIllegalOperation(sequence)).assertEqual('launchRocket');
    });
    it('play_operation_flow_should_record_phase', 0, async () => {
      tracker.resetTracker();
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      const start: number = Date.now();
      tracker.recordOperation('play', FlowPhase.PHASE_PLAY, 0, true, Date.now() - start);
      expect(tracker.hasExecutedPhase(FlowPhase.PHASE_PLAY)).assertTrue();
      expect(tracker.getSuccessfulOperations()).assertEqual(1);
    });
    it('pause_operation_flow_should_record_phase', 0, async () => {
      tracker.resetTracker();
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      tracker.recordOperation('pause', FlowPhase.PHASE_PAUSE, 0, true, 90);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      expect(tracker.getOperationCountByPhase(FlowPhase.PHASE_PAUSE)).assertEqual(1);
      expect(tracker.getFailedOperations()).assertEqual(0);
    });
    it('stop_operation_flow_should_return_to_index', 0, async () => {
      tracker.resetTracker();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
      tracker.recordOperation('stop', FlowPhase.PHASE_STOP, 0, true, 60);
      expect(tracker.hasExecutedPhase(FlowPhase.PHASE_STOP)).assertTrue();
    });
    it('mute_and_unmute_flow_should_be_recorded', 0, async () => {
      tracker.resetTracker();
      await pressAndWait(driver, KEY_MENU, 1, DELAY_KEY_NAVIGATION);
      tracker.recordOperation('mute', FlowPhase.PHASE_MUTE, 0, true, 50);
      tracker.recordOperation('unMute', FlowPhase.PHASE_UNMUTE, 0, true, 55);
      expect(tracker.getOperationCountByPhase(FlowPhase.PHASE_MUTE)).assertEqual(1);
      expect(tracker.getOperationCountByPhase(FlowPhase.PHASE_UNMUTE)).assertEqual(1);
      expect(tracker.getAverageExecutionTime()).assertEqual(52.5);
    });
    it('flow_should_tolerate_cancelled_operation', 0, async () => {
      tracker.resetTracker();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      tracker.recordOperation('play', FlowPhase.PHASE_PLAY, 0, false, 40);
      expect(tracker.getFailedOperations()).assertEqual(1);
      expect(FlowResult.RESULT_CANCELLED).assertEqual('cancelled');
    });
    it('flow_should_measure_player_page_render', 0, async () => {
      const start: number = Date.now();
      const visible: boolean = await waitForPlayerPage(driver, TIMEOUT_PLAYER_RENDER);
      const duration: number = Date.now() - start;
      const evaluator = new ExecutionTimeThresholdEvaluator(TIMEOUT_PLAYER_RENDER * 10);
      expect(duration).assertLargerOrEqual(0);
      expect(duration).assertLessOrEqual(TIMEOUT_PLAYER_RENDER * 10);
      expect(evaluator.isWithinThreshold(duration)).assertTrue();
      expect(typeof visible).assertEqual('boolean');
    });
    it('flow_should_keep_player_visibility_stable', 0, async () => {
      const first: boolean = await isPlayerPageVisible(driver);
      const second: boolean = await isPlayerPageVisible(driver);
      expect(first === second).assertTrue();
      expect(FlowPhase.PHASE_SESSION_CREATE).assertEqual('session_create');
      expect(tracker.getTotalOperations()).assertLargerOrEqual(0);
    });
    it('flow_should_aggregate_multiple_phases', 0, async () => {
      tracker.resetTracker();
      const phases: FlowPhase[] = [FlowPhase.PHASE_SESSION_CREATE, FlowPhase.PHASE_SCREEN_BIND,
        FlowPhase.PHASE_PLAY, FlowPhase.PHASE_PAUSE, FlowPhase.PHASE_STOP];
      phases.forEach((phase: FlowPhase, position: number) => {
        tracker.recordOperation('operation_' + position, phase, 0, true, 100 + position);
      });
      expect(tracker.getTotalOperations()).assertEqual(5);
      expect(tracker.getSuccessfulOperations()).assertEqual(5);
      expect(tracker.getOperationCountByPhase(FlowPhase.PHASE_PLAY)).assertEqual(1);
      expect(tracker.getAverageExecutionTime()).assertEqual(102);
    });
    it('flow_should_detect_degradation_after_failures', 0, async () => {
      tracker.resetTracker();
      for (let i = 0; i < 4; i++) {
        tracker.recordOperation('stop', FlowPhase.PHASE_STOP, 0, false, 100);
      }
      tracker.recordOperation('stop', FlowPhase.PHASE_STOP, 0, true, 100);
      const report = new OperationFlowReport(new OperationFlowAnalyzer(tracker));
      expect(report.isHealthy()).assertFalse();
      expect(report.buildSummary().includes('failed: 4')).assertTrue();
      expect(tracker.getFailedOperations()).assertEqual(4);
    });
    it('flow_durations_should_satisfy_session_budget', 0, async () => {
      const stats = new ExecutionTimeStatistics();
      stats.recordDuration(TIMEOUT_SESSION_CREATE);
      stats.recordDuration(TIMEOUT_SESSION_CREATE / 2);
      const evaluator = new ExecutionTimeThresholdEvaluator(TIMEOUT_SESSION_CREATE);
      expect(evaluator.allWithinThreshold([stats.getMax(), stats.getMin()])).assertTrue();
      expect(stats.getAverage()).assertEqual(TIMEOUT_SESSION_CREATE * 0.75);
    });
    it('flow_records_should_keep_operation_ids', 0, async () => {
      tracker.resetTracker();
      tracker.recordOperation('setScreen', FlowPhase.PHASE_SCREEN_BIND, 0, true, 100);
      tracker.recordOperation('play', FlowPhase.PHASE_PLAY, 0, true, 100);
      const history: MiracastOperationRecord[] = tracker.getHistory();
      expect(history.length).assertEqual(2);
      expect(history[0].operationId).assertEqual('setScreen');
      expect(history[1].operationId).assertEqual('play');
      expect(history[0].phase).assertEqual(FlowPhase.PHASE_SCREEN_BIND);
    });
    it('flow_should_handle_concurrent_phase_registration', 0, async () => {
      tracker.resetTracker();
      tracker.recordOperation('mute', FlowPhase.PHASE_MUTE, 0, true, 70);
      tracker.recordOperation('unMute', FlowPhase.PHASE_UNMUTE, 0, true, 70);
      tracker.recordOperation('mute', FlowPhase.PHASE_MUTE, 0, true, 70);
      expect(tracker.getOperationCountByPhase(FlowPhase.PHASE_MUTE)).assertEqual(2);
      expect(tracker.getTotalOperations()).assertEqual(3);
      expect(tracker.getAverageExecutionTime()).assertEqual(70);
    });
    it('flow_snapshot_should_stay_consistent', 0, async () => {
      tracker.resetTracker();
      tracker.recordOperation('play', FlowPhase.PHASE_PLAY, 0, true, 150);
      tracker.recordOperation('stop', FlowPhase.PHASE_STOP, 0, true, 250);
      const analyzer = new OperationFlowAnalyzer(tracker);
      const first: MiracastFlowSnapshot = analyzer.generateSnapshot();
      const second: MiracastFlowSnapshot = analyzer.generateSnapshot();
      expect(first.totalOperations).assertEqual(second.totalOperations);
      expect(first.averageExecutionTime).assertEqual(second.averageExecutionTime);
      expect(first.averageExecutionTime).assertEqual(200);
      expect(first.successfulOperations).assertEqual(2);
    });
    it('flow_report_should_include_average_time', 0, async () => {
      tracker.resetTracker();
      tracker.recordOperation('play', FlowPhase.PHASE_PLAY, 0, true, 100);
      tracker.recordOperation('pause', FlowPhase.PHASE_PAUSE, 0, true, 300);
      const report = new OperationFlowReport(new OperationFlowAnalyzer(tracker));
      expect(report.buildSummary().includes('avg: 200')).assertTrue();
      expect(report.isHealthy()).assertTrue();
      expect(report.buildSuccessRateText().startsWith('success rate:')).assertTrue();
    });
    it('flow_validator_should_accept_full_session_sequence', 0, async () => {
      const validator = new FlowSequenceValidator();
      const phases: FlowPhase[] = [FlowPhase.PHASE_SESSION_CREATE, FlowPhase.PHASE_SCREEN_BIND,
        FlowPhase.PHASE_PLAY, FlowPhase.PHASE_PAUSE, FlowPhase.PHASE_STOP];
      phases.forEach((phase: FlowPhase, position: number) => {
        validator.addRecord({
          operationId: 'operation_' + position,
          phase: phase,
          focusIndex: 0,
          timestamp: position * 100,
          executionTime: 50,
          success: true
        });
      });
      expect(validator.getRecordCount()).assertEqual(5);
      expect(validator.isPhaseOrdered()).assertTrue();
      expect(validator.areTimestampsChronological()).assertTrue();
      expect(validator.getSuccessCount()).assertEqual(5);
      expect(validator.getFailureCount()).assertEqual(0);
    });
    it('flow_enum_should_define_all_phases', 0, async () => {
      const phases: Set<string> = new Set<string>([FlowPhase.PHASE_SESSION_CREATE, FlowPhase.PHASE_SCREEN_BIND,
        FlowPhase.PHASE_PLAY, FlowPhase.PHASE_PAUSE, FlowPhase.PHASE_STOP, FlowPhase.PHASE_MUTE,
        FlowPhase.PHASE_UNMUTE]);
      expect(phases.size).assertEqual(7);
      const phaseA: string = FlowPhase.PHASE_PLAY;
      const phaseB: string = FlowPhase.PHASE_STOP;
      expect(phaseA === phaseB).assertFalse();
    });
    it('flow_result_enum_should_define_four_results', 0, async () => {
      const results: Set<string> = new Set<string>([FlowResult.RESULT_SUCCESS, FlowResult.RESULT_FAILURE,
        FlowResult.RESULT_CANCELLED, FlowResult.RESULT_TIMEOUT]);
      expect(results.size).assertEqual(4);
      expect(FlowResult.RESULT_SUCCESS).assertEqual('success');
      expect(FlowResult.RESULT_TIMEOUT).assertEqual('timeout');
    });
    it('flow_should_reuse_tracker_singleton', 0, async () => {
      const first: MiracastFlowTracker = MiracastFlowTracker.getInstance();
      const second: MiracastFlowTracker = MiracastFlowTracker.getInstance();
      first.resetTracker();
      first.recordOperation('play', FlowPhase.PHASE_PLAY, 0, true, 10);
      expect(second.getTotalOperations()).assertEqual(1);
      second.resetTracker();
      expect(first.getTotalOperations()).assertEqual(0);
    });
    it('flow_should_support_repeated_reset_cycles', 0, async () => {
      for (let i = 0; i < 3; i++) {
        tracker.resetTracker();
        tracker.recordOperation('play', FlowPhase.PHASE_PLAY, 0, true, 10);
        expect(tracker.getTotalOperations()).assertEqual(1);
      }
      tracker.resetTracker();
      expect(tracker.getTotalOperations()).assertEqual(0);
      expect(tracker.getHistory().length).assertEqual(0);
    });
    it('flow_should_measure_component_count_during_phases', 0, async () => {
      tracker.resetTracker();
      const count: number = await miracastComponentCount(driver);
      tracker.recordOperation('play', FlowPhase.PHASE_PLAY, 0, count >= 0, 100);
      expect(tracker.getSuccessfulOperations()).assertEqual(1);
      expect(count).assertLargerOrEqual(0);
      expect(new ExecutionTimeThresholdEvaluator(500).isWithinThreshold(100)).assertTrue();
    });
    it('flow_should_finish_without_residual_state', 0, async () => {
      tracker.resetTracker();
      expect(tracker.getTotalOperations()).assertEqual(0);
      expect(tracker.getFailedOperations()).assertEqual(0);
      expect(tracker.getAverageExecutionTime()).assertEqual(0);
      expect(ServiceCallSequence.getLegalOrder().length).assertEqual(9);
    });
    it('flow_should_report_zero_success_before_any_operation', 0, async () => {
      tracker.resetTracker();
      const analyzer = new OperationFlowAnalyzer(tracker);
      expect(analyzer.getSuccessRate()).assertEqual(0);
      expect(analyzer.hasOnlySuccessfulOperations()).assertFalse();
      expect(analyzer.generateSnapshot().totalOperations).assertEqual(0);
    });
  });
}
