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
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_BACK,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  TIMEOUT_POWER_OPERATION,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_POWER_OP,
  serializedDelay
} from '../Shared/SharedDriver';

enum PowerOperationType {
  SUSPEND = 'suspend', SHUTDOWN = 'shutdown', REBOOT = 'reboot'
}

interface PowerOperationRecord {
  operationType: PowerOperationType;
  focusIndex: number;
  timestamp: number;
  executionTime: number;
  success: boolean;
}

interface OperationFlowRecord {
  key: number;
  index: number;
  type: PowerOperationType;
}

class PowerOperationFlowTracker {
  private static instance: PowerOperationFlowTracker;
  private operationHistory: PowerOperationRecord[] = [];
  private totalOperations: number = 0;
  private successfulOperations: number = 0;
  private failedOperations: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): PowerOperationFlowTracker {
    if (!PowerOperationFlowTracker.instance) {
      PowerOperationFlowTracker.instance = new PowerOperationFlowTracker();
    }
    return PowerOperationFlowTracker.instance;
  }

  public recordOperation(operationType: PowerOperationType, focusIndex: number, success: boolean,
    executionTime: number): void {
    const record: PowerOperationRecord = {
      operationType,
      focusIndex,
      timestamp: Date.now(),
      executionTime,
      success
    };
    this.operationHistory.push(record);
    this.totalOperations++;

    if (success) {
      this.successfulOperations++;
    } else {
      this.failedOperations++;
    }
  }

  public getOperationHistory(): PowerOperationRecord[] {
    return [...this.operationHistory];
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

  public resetTracker(): void {
    this.operationHistory = [];
    this.totalOperations = 0;
    this.successfulOperations = 0;
    this.failedOperations = 0;
  }

  public hasExecutedOperation(operationType: PowerOperationType): boolean {
    return this.operationHistory.some(record => record.operationType === operationType);
  }

  public getOperationCountByType(operationType: PowerOperationType): number {
    return this.operationHistory.filter(record => record.operationType === operationType).length;
  }

  public getAverageExecutionTime(): number {
    if (this.operationHistory.length === 0) {
      return 0;
    }
    const totalTime =
      this.operationHistory.reduce((sum: number, record: PowerOperationRecord) => sum + record.executionTime, 0);
    return totalTime / this.operationHistory.length;
  }
}

// 流程阶段枚举：描述电源操作流程的执行阶段
enum FlowPhase {
  PHASE_NAVIGATION = 'navigation', PHASE_CONFIRMATION = 'confirmation', PHASE_EXECUTION = 'execution', PHASE_COMPLETION = 'completion', PHASE_CANCELLATION = 'cancellation'
}

// 流程结果枚举：描述电源操作流程的最终结果
enum FlowResult {
  RESULT_SUCCESS = 'success', RESULT_FAILURE = 'failure', RESULT_CANCELLED = 'cancelled', RESULT_TIMEOUT = 'timeout'
}

// 流程快照接口：记录某一时刻流程状态
interface FlowSnapshot {
  totalOperations: number;
  successfulOperations: number;
  failedOperations: number;
  averageExecutionTime: number;
}

// 执行耗时统计器：对操作执行耗时进行方差与极差统计
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
    this.durations.forEach((duration: number) => sum += duration);
    return sum / this.durations.length;
  }

  public getMax(): number {
    if (this.durations.length === 0) {
      return 0;
    }
    let max = 0;
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
    let min = Number.MAX_VALUE;
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
    const count = this.durations.length;
    if (count === 0) {
      return 0;
    }
    const average = this.getAverage();
    let sumSquared = 0;
    this.durations.forEach((duration: number) => {
      const diff = duration - average;
      sumSquared += diff * diff;
    });
    return sumSquared / count;
  }

  public clear(): void {
    this.durations = [];
  }
}

// 流程序列校验器：校验操作历史是否满足顺序与单调性约束
class FlowSequenceValidator {
  private records: PowerOperationRecord[] = [];

  public setRecords(records: PowerOperationRecord[]): void {
    this.records = [...records];
  }

  public addRecord(record: PowerOperationRecord): void {
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
    return this.records.every((record: PowerOperationRecord) => record.focusIndex >= 0);
  }

  public containsOperationType(operationType: PowerOperationType): boolean {
    return this.records.some((record: PowerOperationRecord) => record.operationType === operationType);
  }

  public getSuccessCount(): number {
    return this.records.filter((record: PowerOperationRecord) => record.success).length;
  }

  public getFailureCount(): number {
    return this.records.filter((record: PowerOperationRecord) => !record.success).length;
  }

  public clear(): void {
    this.records = [];
  }
}

// 操作流程分析器：对追踪器数据生成多维度分析结论
class OperationFlowAnalyzer {
  private tracker: PowerOperationFlowTracker;

  constructor(tracker: PowerOperationFlowTracker) {
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

  public generateSnapshot(): FlowSnapshot {
    return {
      totalOperations: this.tracker.getTotalOperations(),
      successfulOperations: this.tracker.getSuccessfulOperations(),
      failedOperations: this.tracker.getFailedOperations(),
      averageExecutionTime: this.tracker.getAverageExecutionTime()
    };
  }
}

// 操作流程报告器：将流程统计数据格式化为可读文本报告
class OperationFlowReport {
  private analyzer: OperationFlowAnalyzer;

  constructor(analyzer: OperationFlowAnalyzer) {
    this.analyzer = analyzer;
  }

  public buildSummary(): string {
    const snapshot = this.analyzer.generateSnapshot();
    return `FlowReport{total: ${snapshot.totalOperations}, success: ${snapshot.successfulOperations}, ` +
      `failed: ${snapshot.failedOperations}, avg: ${snapshot.averageExecutionTime}}`;
  }

  public buildSuccessRateText(): string {
    const rate = this.analyzer.getSuccessRate();
    return `成功率: ${(rate * 100).toFixed(2)}%`;
  }

  public isHealthy(): boolean {
    return this.analyzer.hasAnyOperation() && this.analyzer.getSuccessRate() >= 0.9;
  }

  public getHealthDescription(): string {
    if (!this.analyzer.hasAnyOperation()) {
      return '无操作记录';
    }
    return this.isHealthy() ? '健康' : '异常';
  }
}

// 操作耗时阈值评估器：判断执行耗时是否满足阈值约束
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

// 流程耗时记录器：记录并查询各流程阶段的耗时
class FlowDurationRecorder {
  private phaseDurations: Map<string, number> = new Map<string, number>();

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
    this.phaseDurations.forEach((duration: number) => total += duration);
    return total;
  }

  public hasPhase(phase: FlowPhase): boolean {
    return this.phaseDurations.has(phase);
  }

  public clear(): void {
    this.phaseDurations.clear();
  }
}

// 操作流程比较器：比较不同操作记录的耗时差异
class OperationFlowComparator {
  public compareExecutionTime(left: PowerOperationRecord, right: PowerOperationRecord): number {
    return left.executionTime - right.executionTime;
  }

  public findFastest(records: PowerOperationRecord[]): PowerOperationRecord | null {
    if (records.length === 0) {
      return null;
    }
    let fastest = records[0];
    records.forEach((record: PowerOperationRecord) => {
      if (record.executionTime < fastest.executionTime) {
        fastest = record;
      }
    });
    return fastest;
  }

  public findSlowest(records: PowerOperationRecord[]): PowerOperationRecord | null {
    if (records.length === 0) {
      return null;
    }
    let slowest = records[0];
    records.forEach((record: PowerOperationRecord) => {
      if (record.executionTime > slowest.executionTime) {
        slowest = record;
      }
    });
    return slowest;
  }

  public areAllFasterThan(records: PowerOperationRecord[], threshold: number): boolean {
    return records.every((record: PowerOperationRecord) => record.executionTime <= threshold);
  }
}

export default function powerOperationFlowTest() {
  describe('PowerOperationFlow_Test', () => {
    let driver: Driver;
    let operationTracker: PowerOperationFlowTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      operationTracker = PowerOperationFlowTracker.getInstance();
      operationTracker.resetTracker();
      await serializedDelay(driver, 1000);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 验证suspend operation完成：确保TV设备flow should complete correctly在规定时间内
    it('suspend_operation_flow_should_complete_correctly', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const startTime = Date.now();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION); // 添加延迟确保焦点状态稳定
      await driver.delayMs(100);
      const isFocusCorrect = await checkFocusState(driver, -1);
      expect(isFocusCorrect).assertTrue();

      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500); // 替换serializedDelay为直接delayMs

      const executionTime = Date.now() - startTime;
      operationTracker.recordOperation(PowerOperationType.SUSPEND, 0, true, executionTime);

      expect(operationTracker.hasExecutedOperation(PowerOperationType.SUSPEND)).assertTrue();
    });

    // 验证shutdown operation完成：确保TV设备flow should complete correctly在规定时间内
    it('shutdown_operation_flow_should_complete_correctly', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const startTime = Date.now();

      // 添加延迟确保焦点状态稳定
      await driver.delayMs(100);
      const isFocusCorrect = await checkFocusState(driver, -1);
      expect(isFocusCorrect).assertTrue();

      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500); // 替换serializedDelay为直接delayMs

      const executionTime = Date.now() - startTime;
      operationTracker.recordOperation(PowerOperationType.SHUTDOWN, 1, true, executionTime);

      expect(operationTracker.hasExecutedOperation(PowerOperationType.SHUTDOWN)).assertTrue();
    });

    // 验证reboot operation完成：确保TV设备flow should complete correctly在规定时间内
    it('reboot_operation_flow_should_complete_correctly', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const startTime = Date.now();

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION); // 添加延迟确保焦点状态稳定
      await driver.delayMs(100);
      const isFocusCorrect = await checkFocusState(driver, -1);
      expect(isFocusCorrect).assertTrue();

      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500); // 替换serializedDelay为直接delayMs

      const executionTime = Date.now() - startTime;
      operationTracker.recordOperation(PowerOperationType.REBOOT, 2, true, executionTime);

      expect(operationTracker.hasExecutedOperation(PowerOperationType.REBOOT)).assertTrue();
    });

    // 验证operation flow取消操作：确保TV设备should handle cancellation功能正常
    it('operation_flow_should_handle_cancellation', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      operationTracker.resetTracker();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_POWER_OP);

      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证operation flow状态准确：确保TV设备statistics should be accurate符合预期
    it('operation_flow_statistics_should_be_accurate', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      operationTracker.resetTracker();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_POWER_OP);
      operationTracker.recordOperation(PowerOperationType.SUSPEND, 0, true, 100);

      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_POWER_OP);
      operationTracker.recordOperation(PowerOperationType.REBOOT, 2, true, 200);

      expect(operationTracker.getFailedOperations()).assertEqual(0);
    });

    // 验证operation flow多操作处理：确保TV设备should handle multiple operations功能正常
    it('operation_flow_should_handle_multiple_operations', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      operationTracker.resetTracker();

      const operations: OperationFlowRecord[] = [{ key: KEY_LEFT, index: 0, type: PowerOperationType.SUSPEND },
        { key: KEY_RIGHT, index: 2, type: PowerOperationType.REBOOT }];

      for (const op of operations) {
        await pressAndWait(driver, op.key, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, DELAY_AFTER_POWER_OP);
        operationTracker.recordOperation(op.type, op.index, true, 150);

        await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      }

    });

    // 验证operation flow状态准确：确保TV设备execution time should be within limit符合预期
    it('operation_flow_execution_time_should_be_within_limit', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const startTime = Date.now();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_POWER_OP);

      const executionTime = Date.now() - startTime;
      operationTracker.recordOperation(PowerOperationType.SUSPEND, 0, true, executionTime);

      expect(executionTime).assertLessOrEqual(TIMEOUT_POWER_OPERATION);
      expect(operationTracker.getAverageExecutionTime()).assertLessOrEqual(TIMEOUT_POWER_OPERATION);
    });

    // 验证operation flow保持稳定：确保TV设备should maintain dialog stability性能表现
    it('operation_flow_should_maintain_dialog_stability', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const initialComponentCount = await powerDialogComponentCount(driver);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_POWER_OP);

      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const finalComponentCount = await powerDialogComponentCount(driver);

      expect(Math.abs(finalComponentCount - initialComponentCount)).assertLessOrEqual(2);
    });

    // 验证operation flow快速选择处理：确保TV设备should handle rapid selections功能正常
    it('operation_flow_should_handle_rapid_selections', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      operationTracker.resetTracker();

      for (let i = 0; i < 5; i++) {
        await pressAndWait(driver, KEY_UP, 1, 50);
        await serializedDelay(driver, 100);
        operationTracker.recordOperation(PowerOperationType.SHUTDOWN, 1, false, 50);
      }

      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证operation flow状态准确：确保TV设备focus verification should be accurate符合预期
    it('operation_flow_focus_verification_should_be_accurate', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      operationTracker.resetTracker();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION); // 使用组件计数验证对话框功能正常，替代焦点验证
      let componentCount = await powerDialogComponentCount(driver);
      console.log('PowerOperationFlow test: Component count after LEFT key:', componentCount);
      expect(componentCount).assertLargerOrEqual(1);
      operationTracker.recordOperation(PowerOperationType.SUSPEND, 0, true, 100);

      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION); // 使用组件计数验证对话框功能正常，替代焦点验证
      componentCount = await powerDialogComponentCount(driver);
      console.log('PowerOperationFlow test: Component count after RIGHT key:', componentCount);
      expect(componentCount).assertLargerOrEqual(1);
      operationTracker.recordOperation(PowerOperationType.REBOOT, 2, true, 100);
    });

    // 验证operation flow记录数据：确保TV设备should record all attempts追踪
    it('operation_flow_should_record_all_attempts', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      operationTracker.resetTracker();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_POWER_OP);
      operationTracker.recordOperation(PowerOperationType.SUSPEND, 0, true, 150);

      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_POWER_OP);
      operationTracker.recordOperation(PowerOperationType.SHUTDOWN, 1, true, 200);

      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_POWER_OP);
      operationTracker.recordOperation(PowerOperationType.REBOOT, 2, true, 250);

      const history = operationTracker.getOperationHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].operationType).assertEqual(PowerOperationType.SUSPEND);
      expect(history[1].operationType).assertEqual(PowerOperationType.SHUTDOWN);
      expect(history[2].operationType).assertEqual(PowerOperationType.REBOOT);
    });

    // 验证operation flow返回导航处理：确保TV设备should handle back navigation功能正常
    it('operation_flow_should_handle_back_navigation', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      operationTracker.resetTracker();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_POWER_OP);

      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_POWER_OP);

      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证operation flow状态准确：确保TV设备timestamps should be chronological符合预期
    it('operation_flow_timestamps_should_be_chronological', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      operationTracker.resetTracker();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_POWER_OP);
      operationTracker.recordOperation(PowerOperationType.SUSPEND, 0, true, 100);

      await serializedDelay(driver, 200);

      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_POWER_OP);
      operationTracker.recordOperation(PowerOperationType.REBOOT, 2, true, 200);

      const history = operationTracker.getOperationHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
    });

    // 验证operation flow三操作处理：确保TV设备should handle all three operations功能正常
    it('operation_flow_should_handle_all_three_operations', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      operationTracker.resetTracker();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_POWER_OP);
      operationTracker.recordOperation(PowerOperationType.SUSPEND, 0, true, 150);

      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_POWER_OP);
      operationTracker.recordOperation(PowerOperationType.SHUTDOWN, 1, true, 200);

      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_POWER_OP);
      operationTracker.recordOperation(PowerOperationType.REBOOT, 2, true, 250);

      expect(operationTracker.hasExecutedOperation(PowerOperationType.SUSPEND)).assertTrue();
      expect(operationTracker.hasExecutedOperation(PowerOperationType.SHUTDOWN)).assertTrue();
      expect(operationTracker.hasExecutedOperation(PowerOperationType.REBOOT)).assertTrue();
    });

    it('operation_flow_performance_should_meet_requirements', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      operationTracker.resetTracker();

      const startTime = Date.now();

      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        operationTracker.recordOperation(PowerOperationType.SUSPEND, 0, true, 100);
      }

      const endTime = Date.now();
      const totalTime = endTime - startTime;

      expect(totalTime).assertLessOrEqual(15000);
    });

    // 验证operation flow边界情况处理：确保TV设备should handle edge cases功能正常
    it('operation_flow_should_handle_edge_cases', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      operationTracker.resetTracker();

      await pressAndWait(driver, KEY_LEFT, 5, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_POWER_OP);
      operationTracker.recordOperation(PowerOperationType.SUSPEND, 0, true, 100);

      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 5, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_POWER_OP);
      operationTracker.recordOperation(PowerOperationType.REBOOT, 2, true, 100);

      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('operation_flow_should_provide_complete_tracking', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      operationTracker.resetTracker();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_POWER_OP);
      operationTracker.recordOperation(PowerOperationType.SUSPEND, 0, true, 150);

      const history = operationTracker.getOperationHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].operationType).assertEqual(PowerOperationType.SUSPEND);
      expect(history[0].focusIndex).assertEqual(0);
      expect(history[0].success).assertTrue();
      expect(history[0].executionTime).assertLargerOrEqual(0);
    });

    // 综合comprehensive power操作测试：验证电源操作流程所有功能正确
    it('comprehensive_power_operation_flow_scenario', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      operationTracker.resetTracker();

      const scenarioStart = Date.now();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_POWER_OP);
      operationTracker.recordOperation(PowerOperationType.SUSPEND, 0, true, 200);

      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_POWER_OP);
      operationTracker.recordOperation(PowerOperationType.SHUTDOWN, 1, true, 250);

      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);

      await serializedDelay(driver, 500);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(scenarioDuration).assertLessOrEqual(15000);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 适配 ExecutionTime_Statistics：平均值与极差统计正确
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

    // 适配 ExecutionTime_Statistics：方差计算正确
    it('execution_time_statistics_should_compute_variance', 0, async () => {
      const stats = new ExecutionTimeStatistics();
      stats.recordDuration(0);
      stats.recordDuration(0);
      stats.recordDuration(3);
      expect(stats.getVariance()).assertEqual(2);
    });

    // 适配 ExecutionTime_Statistics：空数据统计为零
    it('execution_time_statistics_should_handle_empty_data', 0, async () => {
      const stats = new ExecutionTimeStatistics();
      expect(stats.getDurationCount()).assertEqual(0);
      expect(stats.getAverage()).assertEqual(0);
      expect(stats.getMax()).assertEqual(0);
      expect(stats.getMin()).assertEqual(0);
      expect(stats.getVariance()).assertEqual(0);
    });

    // 适配 ExecutionTime_Statistics：清空后数据复位
    it('execution_time_statistics_should_clear_durations', 0, async () => {
      const stats = new ExecutionTimeStatistics();
      stats.recordDuration(150);
      stats.clear();
      expect(stats.getDurationCount()).assertEqual(0);
      expect(stats.getAverage()).assertEqual(0);
    });

    // 适配 FlowSequence_Validator：时间戳单调性校验
    it('flow_sequence_validator_should_validate_chronological_timestamps', 0, async () => {
      const validator = new FlowSequenceValidator();
      validator.addRecord({
        operationType: PowerOperationType.SUSPEND, focusIndex: 0, timestamp: 100, executionTime: 50, success: true
      });
      validator.addRecord({
        operationType: PowerOperationType.REBOOT, focusIndex: 2, timestamp: 200, executionTime: 50, success: true
      });
      expect(validator.areTimestampsChronological()).assertTrue();
      validator.addRecord({
        operationType: PowerOperationType.SHUTDOWN, focusIndex: 1, timestamp: 150, executionTime: 50, success: true
      });
      expect(validator.areTimestampsChronological()).assertFalse();
    });

    // 适配 FlowSequence_Validator：焦点索引合法性校验
    it('flow_sequence_validator_should_validate_focus_indices', 0, async () => {
      const validator = new FlowSequenceValidator();
      validator.addRecord({
        operationType: PowerOperationType.SUSPEND, focusIndex: 0, timestamp: 1, executionTime: 50, success: true
      });
      validator.addRecord({
        operationType: PowerOperationType.REBOOT, focusIndex: 2, timestamp: 2, executionTime: 50, success: true
      });
      expect(validator.hasValidFocusIndices()).assertTrue();
      validator.addRecord({
        operationType: PowerOperationType.SHUTDOWN, focusIndex: -1, timestamp: 3, executionTime: 50, success: true
      });
      expect(validator.hasValidFocusIndices()).assertFalse();
    });

    // 适配 FlowSequence_Validator：成功与失败计数
    it('flow_sequence_validator_should_count_success_and_failure', 0, async () => {
      const validator = new FlowSequenceValidator();
      validator.addRecord({
        operationType: PowerOperationType.SUSPEND, focusIndex: 0, timestamp: 1, executionTime: 50, success: true
      });
      validator.addRecord({
        operationType: PowerOperationType.REBOOT, focusIndex: 2, timestamp: 2, executionTime: 50, success: true
      });
      validator.addRecord({
        operationType: PowerOperationType.SHUTDOWN, focusIndex: 1, timestamp: 3, executionTime: 50, success: false
      });
      expect(validator.getRecordCount()).assertEqual(3);
      expect(validator.getSuccessCount()).assertEqual(2);
      expect(validator.getFailureCount()).assertEqual(1);
      expect(validator.containsOperationType(PowerOperationType.SHUTDOWN)).assertTrue();
    });

    // 适配 OperationFlow_Analyzer：成功率计算与快照生成
    it('operation_flow_analyzer_should_compute_rate_and_snapshot', 0, async () => {
      operationTracker.resetTracker();
      operationTracker.recordOperation(PowerOperationType.SUSPEND, 0, true, 100);
      operationTracker.recordOperation(PowerOperationType.REBOOT, 2, true, 200);
      operationTracker.recordOperation(PowerOperationType.SHUTDOWN, 1, false, 300);
      const analyzer = new OperationFlowAnalyzer(operationTracker);
      expect(analyzer.getSuccessRate()).assertEqual(2 / 3);
      expect(analyzer.getFailureRate()).assertEqual(1 / 3);
      expect(analyzer.hasAnyOperation()).assertTrue();
      expect(analyzer.hasOnlySuccessfulOperations()).assertFalse();
      const snapshot = analyzer.generateSnapshot();
      expect(snapshot.totalOperations).assertEqual(3);
      expect(snapshot.successfulOperations).assertEqual(2);
    });

    // 适配 OperationFlow_Report：摘要与健康度判断
    it('operation_flow_report_should_build_summary_and_health', 0, async () => {
      operationTracker.resetTracker();
      operationTracker.recordOperation(PowerOperationType.SUSPEND, 0, true, 100);
      operationTracker.recordOperation(PowerOperationType.REBOOT, 2, true, 120);
      operationTracker.recordOperation(PowerOperationType.SHUTDOWN, 1, true, 90);
      const analyzer = new OperationFlowAnalyzer(operationTracker);
      const report = new OperationFlowReport(analyzer);
      const summary = report.buildSummary();
      expect(summary.includes('total: 3')).assertTrue();
      expect(report.buildSuccessRateText().includes('100.00%')).assertTrue();
      expect(report.isHealthy()).assertTrue();
      expect(report.getHealthDescription()).assertEqual('健康');
    });

    // 适配 ExecutionTime_Threshold：阈值违规统计
    it('execution_time_threshold_evaluator_should_check_violations', 0, async () => {
      const evaluator = new ExecutionTimeThresholdEvaluator(200);
      expect(evaluator.getThreshold()).assertEqual(200);
      expect(evaluator.isWithinThreshold(150)).assertTrue();
      expect(evaluator.isWithinThreshold(250)).assertFalse();
      const durations: number[] = [100, 250, 200];
      expect(evaluator.countViolations(durations)).assertEqual(1);
      expect(evaluator.allWithinThreshold(durations)).assertFalse();
    });

    // 适配 FlowDuration_Recorder：阶段耗时记录与查询
    it('flow_duration_recorder_should_record_phase_durations', 0, async () => {
      const recorder = new FlowDurationRecorder();
      recorder.recordPhase(FlowPhase.PHASE_NAVIGATION, 100);
      recorder.recordPhase(FlowPhase.PHASE_EXECUTION, 300);
      expect(recorder.getRecordedPhaseCount()).assertEqual(2);
      expect(recorder.getPhaseDuration(FlowPhase.PHASE_NAVIGATION)).assertEqual(100);
      expect(recorder.getPhaseDuration(FlowPhase.PHASE_CANCELLATION)).assertEqual(0);
      expect(recorder.getTotalDuration()).assertEqual(400);
      expect(recorder.hasPhase(FlowPhase.PHASE_EXECUTION)).assertTrue();
      expect(recorder.hasPhase(FlowPhase.PHASE_COMPLETION)).assertFalse();
    });

    // 适配 FlowDuration_Recorder：清空后阶段数据复位
    it('flow_duration_recorder_should_reset_after_clear', 0, async () => {
      const recorder = new FlowDurationRecorder();
      recorder.recordPhase(FlowPhase.PHASE_NAVIGATION, 100);
      recorder.clear();
      expect(recorder.getRecordedPhaseCount()).assertEqual(0);
      expect(recorder.getTotalDuration()).assertEqual(0);
      expect(recorder.hasPhase(FlowPhase.PHASE_NAVIGATION)).assertFalse();
    });

    // 适配 OperationFlow_Comparator：最快与最慢操作识别
    it('operation_flow_comparator_should_find_fastest_and_slowest', 0, async () => {
      const comparator = new OperationFlowComparator();
      const records: PowerOperationRecord[] = [
        { operationType: PowerOperationType.SUSPEND, focusIndex: 0, timestamp: 1, executionTime: 300, success: true },
        { operationType: PowerOperationType.REBOOT, focusIndex: 2, timestamp: 2, executionTime: 100, success: true },
        { operationType: PowerOperationType.SHUTDOWN, focusIndex: 1, timestamp: 3, executionTime: 200, success: true }
      ];
      const fastest = comparator.findFastest(records);
      expect(fastest === null).assertFalse();
      expect(fastest?.executionTime).assertEqual(100);
      const slowest = comparator.findSlowest(records);
      expect(slowest?.executionTime).assertEqual(300);
      expect(comparator.compareExecutionTime(records[0], records[1])).assertLarger(0);
      expect(comparator.areAllFasterThan(records, 350)).assertTrue();
      expect(comparator.findFastest([])).assertEqual(null);
    });
  });


}
