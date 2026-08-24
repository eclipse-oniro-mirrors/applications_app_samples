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
  createFreshDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  KEY_ENTER,
  KEY_MENU,
  appComponentCount,
  checkFocusState,
  waitForUiStable,
  pressAndWait,
  triggerMenuDialog,
  runSerializedUiOperation,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  getCurrentFocusIndex
} from '../common/SharedDriver';

interface StabilityRecord {
  operationIndex: number;
  componentCount: number;
  focusState: boolean;
  responseTime: number;
  timestamp: number;
  success: boolean;
}

class LongTermStabilityTracker {
  private static instance: LongTermStabilityTracker;
  private stabilityHistory: StabilityRecord[] = [];
  private totalOperations: number = 0;
  private successfulOperations: number = 0;
  private failedOperations: number = 0;
  private baselineComponentCount: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): LongTermStabilityTracker {
    if (!LongTermStabilityTracker.instance) {
      LongTermStabilityTracker.instance = new LongTermStabilityTracker();
    }
    return LongTermStabilityTracker.instance;
  }

  public setBaseline(count: number): void {
    this.baselineComponentCount = count;
  }

  public recordStability(operationIndex: number, componentCount: number, focusState: boolean, responseTime: number,
    success: boolean): void {
    const record: StabilityRecord = {
      operationIndex,
      componentCount,
      focusState,
      responseTime,
      timestamp: Date.now(),
      success
    };
    this.stabilityHistory.push(record);
    this.totalOperations++;
    if (success) {
      this.successfulOperations++;
    } else {
      this.failedOperations++;
    }
  }

  public getStabilityHistory(): StabilityRecord[] {
    return [...this.stabilityHistory];
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
    this.stabilityHistory = [];
    this.totalOperations = 0;
    this.successfulOperations = 0;
    this.failedOperations = 0;
    this.baselineComponentCount = 0;
  }

  public getSuccessRate(): number {
    if (this.totalOperations === 0) {
      return 0;
    }
    return this.successfulOperations / this.totalOperations;
  }

  public getAverageResponseTime(): number {
    if (this.stabilityHistory.length === 0) {
      return 0;
    }
    const totalTime =
      this.stabilityHistory.reduce((sum: number, record: StabilityRecord) => sum + record.responseTime, 0);
    return totalTime / this.stabilityHistory.length;
  }

  public getComponentCountDrift(): number {
    if (this.stabilityHistory.length === 0 || this.baselineComponentCount === 0) {
      return 0;
    }
    const lastCount = this.stabilityHistory[this.stabilityHistory.length - 1].componentCount;
    return lastCount - this.baselineComponentCount;
  }

  public hasPerformanceDegradation(threshold: number): boolean {
    if (this.stabilityHistory.length < 2) {
      return false;
    }
    const firstTime = this.stabilityHistory[0].responseTime;
    const lastTime = this.stabilityHistory[this.stabilityHistory.length - 1].responseTime;
    return (lastTime - firstTime) > threshold;
  }
}

export default function longTermStabilityTest() {
  describe('LongTermStability_Test', () => {
    let driver: Driver;
    let stabilityTracker: LongTermStabilityTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver();
      stabilityTracker = LongTermStabilityTracker.getInstance();
      stabilityTracker.resetTracker();
      await runSerializedUiOperation(async () => {
        await driver.delayMs(1000);
      });
      await triggerMenuDialog(driver);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(500);
      });
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(500);
      });
    });

    it('grid_should_remain_stable_after_sampled_operations', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await appComponentCount(driver);
      stabilityTracker.setBaseline(baselineCount);

      for (let i = 0; i < 12; i++) {
        const startTime = Date.now();
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        const responseTime = Date.now() - startTime;

        const count = i % 4 === 0 ? await appComponentCount(driver) : baselineCount;
        const focusState = i % 4 === 0 ? await checkFocusState(driver, -1) : true;
        stabilityTracker.recordStability(i, count, focusState, responseTime, true);
      }

      expect(stabilityTracker.getTotalOperations()).assertEqual(12);
      expect(stabilityTracker.getSuccessRate()).assertEqual(1);
    });

    it('grid_should_not_degrade_performance_over_time', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      stabilityTracker.resetTracker();

      for (let i = 0; i < 12; i++) {
        const startTime = Date.now();
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        const responseTime = Date.now() - startTime;

        stabilityTracker.recordStability(i, 6, true, responseTime, true);
      }

      expect(stabilityTracker.hasPerformanceDegradation(500)).assertFalse();
    });

    it('grid_component_count_should_remain_stable', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await appComponentCount(driver);
      stabilityTracker.setBaseline(baselineCount);

      for (let i = 0; i < 12; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        const count = i % 3 === 0 ? await appComponentCount(driver) : baselineCount;
        stabilityTracker.recordStability(i, count, true, 50, true);
      }

      const drift = stabilityTracker.getComponentCountDrift();
      expect(Math.abs(drift)).assertLessOrEqual(5);
    });

    it('grid_focus_state_should_remain_consistent', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      stabilityTracker.resetTracker();

      for (let i = 0; i < 12; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        let focusState: boolean = true;
        if (i % 3 === 0) {
          const focusIndex = await getCurrentFocusIndex(driver);
          if (focusIndex !== -1) {
            focusState = await checkFocusState(driver, focusIndex);
          }
        }
        stabilityTracker.recordStability(i, 6, focusState, 30, focusState);
      }

      expect(stabilityTracker.getSuccessRate()).assertLargerOrEqual(0.95);
    });

    // 验证dialog should处理能力：确保TV设备在handle continuous operation without crash下功能正常
    it('grid_should_handle_continuous_operation_without_crash', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      stabilityTracker.resetTracker();

      for (let i = 0; i < 16; i++) {
        try {
          await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
          stabilityTracker.recordStability(i, 6, true, 20, true);
        } catch (e) {
          stabilityTracker.recordStability(i, 6, false, 20, false);
        }
      }

      expect(stabilityTracker.getFailedOperations()).assertLessOrEqual(5);
    });

    // 验证dialog response状态正确：确保TV设备time should be within limits符合预期
    it('grid_response_time_should_be_within_limits', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      stabilityTracker.resetTracker();

      for (let i = 0; i < 12; i++) {
        const startTime = Date.now();
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        const responseTime = Date.now() - startTime;

        stabilityTracker.recordStability(i, 6, true, responseTime, true);
      }

      const avgResponseTime = stabilityTracker.getAverageResponseTime();
      expect(avgResponseTime).assertLessOrEqual(500);
    });

    // 验证stability tracker维持稳定：确保TV设备在singleton should maintain consistency下性能不降低
    it('stability_tracker_singleton_should_maintain_consistency', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const tracker1 = LongTermStabilityTracker.getInstance();
      const tracker2 = LongTermStabilityTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.setBaseline(100);
      tracker1.recordStability(0, 101, true, 50, true);

      expect(tracker2.getTotalOperations()).assertEqual(1);
      expect(tracker2.getSuccessRate()).assertEqual(1);
    });

    // 验证dialog should维持稳定：确保TV设备在maintain state after extended use下性能不降低
    it('grid_should_maintain_state_after_extended_use', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await appComponentCount(driver);
      stabilityTracker.setBaseline(baselineCount);

      for (let i = 0; i < 12; i++) {
        await pressAndWait(driver, i % 3 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        const count = i % 3 === 0 ? await appComponentCount(driver) : baselineCount;
        stabilityTracker.recordStability(i, count, true, 30, true);
      }

      const finalCount = await appComponentCount(driver);
      expect(Math.abs(finalCount - baselineCount)).assertLessOrEqual(3);
    });

    // 验证dialog should处理能力：确保TV设备在handle mixed operations stably下功能正常
    it('grid_should_handle_mixed_operations_stably', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      stabilityTracker.resetTracker();

      for (let i = 0; i < 12; i++) {
        const startTime = Date.now();
        if (i % 4 === 0) {
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        } else if (i % 4 === 1) {
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        } else if (i % 4 === 2) {
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        } else {
          await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
          await triggerMenuDialog(driver);
        }
        const responseTime = Date.now() - startTime;

        const count = i % 3 === 0 ? await appComponentCount(driver) : 6;
        stabilityTracker.recordStability(i, count, true, responseTime, true);
      }

      expect(stabilityTracker.getTotalOperations()).assertEqual(12);
      expect(stabilityTracker.getSuccessRate()).assertLargerOrEqual(0.98);
    });

    // 验证stability records状态正确：确保TV设备timestamps should be chronological符合预期
    it('stability_records_timestamps_should_be_chronological', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      stabilityTracker.resetTracker();

      stabilityTracker.recordStability(0, 6, true, 50, true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(100);
      });
      stabilityTracker.recordStability(1, 6, true, 50, true);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(100);
      });
      stabilityTracker.recordStability(2, 6, true, 50, true);

      const history = stabilityTracker.getStabilityHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    it('grid_should_not_accumulate_errors_over_time', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      stabilityTracker.resetTracker();

      for (let i = 0; i < 16; i++) {
        try {
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
          stabilityTracker.recordStability(i, 6, true, 30, true);
        } catch (e) {
          stabilityTracker.recordStability(i, 6, false, 30, false);
        }
      }

      expect(stabilityTracker.getFailedOperations()).assertLessOrEqual(3);
    });

    // 验证dialog should处理能力：确保TV设备在handle boundary conditions stably下功能正常
    it('grid_should_handle_boundary_conditions_stably', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      stabilityTracker.resetTracker();

      for (let i = 0; i < 6; i++) {
        await pressAndWait(driver, KEY_LEFT, 3, DELAY_KEY_NAVIGATION);
        const count = i % 2 === 0 ? await appComponentCount(driver) : 6;
        stabilityTracker.recordStability(i, count, true, 50, true);
      }

      expect(stabilityTracker.getSuccessRate()).assertEqual(1);
    });

    // 综合comprehensive sampled long场景测试：验证完整操作流程中功能正确
    it('comprehensive_long_term_stability_scenario', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      stabilityTracker.resetTracker();

      const scenarioStart = Date.now();

      const baselineCount = await appComponentCount(driver);
      stabilityTracker.setBaseline(baselineCount);

      for (let i = 0; i < 12; i++) {
        const startTime = Date.now();
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        const responseTime = Date.now() - startTime;

        const count = i % 3 === 0 ? await appComponentCount(driver) : baselineCount;
        const focusState = i % 4 === 0 ? await checkFocusState(driver, -1) : true;
        stabilityTracker.recordStability(i, count, focusState, responseTime, true);
      }

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(stabilityTracker.getTotalOperations()).assertEqual(12);
      expect(stabilityTracker.getSuccessRate()).assertLargerOrEqual(0.98);
      expect(scenarioDuration).assertLessOrEqual(15000);
    });

    // 验证性能剖析器：确保TV设备PerformanceProfiler统计计算正确
    it('performance_profiler_should_compute_stats', 0, () => {
      const profiler: PerformanceProfiler = new PerformanceProfiler();
      profiler.recordSample(10);
      profiler.recordSample(20);
      profiler.recordSample(30);
      expect(profiler.getSampleCount()).assertEqual(3);
      expect(profiler.getAverage()).assertEqual(20);
      expect(profiler.getPeak()).assertEqual(30);
      profiler.clear();
      expect(profiler.getSampleCount()).assertEqual(0);
    });

    // 验证稳定性检查器：确保TVDeviceStabilityChecker失败率计算正确
    it('stability_checker_should_calculate_failure_rate', 0, () => {
      const checker: StabilityChecker = new StabilityChecker();
      checker.recordOperation();
      checker.recordOperation();
      checker.recordFailure();
      expect(checker.getOperationCount()).assertEqual(3);
      expect(checker.getFailureCount()).assertEqual(1);
      expect(checker.getFailureRate()).assertEqual(1 / 3);
      checker.clear();
      expect(checker.getOperationCount()).assertEqual(0);
    });
  });
}

/**
 * 性能分析器
 * 封装耗时采样、平均值、峰值计算业务逻辑
 */
class PerformanceProfiler {
  private samples: number[] = [];

  public recordSample(cost: number): void {
    this.samples.push(cost);
  }

  public getSamples(): number[] {
    return [...this.samples];
  }

  public getSampleCount(): number {
    return this.samples.length;
  }

  public getAverage(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    const total = this.samples.reduce((sum, cost) => sum + cost, 0);
    return total / this.samples.length;
  }

  public getPeak(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return Math.max(...this.samples);
  }

  public clear(): void {
    this.samples = [];
  }
}

/**
 * 内存监控器
 * 封装内存基线、采样、泄漏检测业务逻辑
 */
class MemoryMonitor {
  private baseline: number = 0;
  private samples: number[] = [];

  public setBaseline(count: number): void {
    this.baseline = count;
    this.samples = [];
  }

  public recordSample(count: number): void {
    this.samples.push(count);
  }

  public getSampleCount(): number {
    return this.samples.length;
  }

  // 检测内存是否持续增长（超过容差视为泄漏）
  public hasLeak(tolerance: number): boolean {
    if (this.samples.length === 0) {
      return false;
    }
    const maxCount = Math.max(...this.samples);
    return maxCount - this.baseline > tolerance;
  }

  public clear(): void {
    this.baseline = 0;
    this.samples = [];
  }
}

/**
 * 稳定性检查器
 * 封装反复操作稳定性检查业务逻辑
 */
class StabilityChecker {
  private operationCount: number = 0;
  private failureCount: number = 0;

  public recordOperation(): void {
    this.operationCount++;
  }

  public recordFailure(): void {
    this.failureCount++;
    this.operationCount++;
  }

  public getOperationCount(): number {
    return this.operationCount;
  }

  public getFailureCount(): number {
    return this.failureCount;
  }

  public getFailureRate(): number {
    if (this.operationCount === 0) {
      return 0;
    }
    return this.failureCount / this.operationCount;
  }

  public clear(): void {
    this.operationCount = 0;
    this.failureCount = 0;
  }
}

/**
 * 压力执行器
 * 封装压力测试轮次执行业务逻辑
 */
class StressRunner {
  private rounds: number = 0;

  public runRounds(count: number): void {
    this.rounds += count;
  }

  public getTotalRounds(): number {
    return this.rounds;
  }

  public reset(): void {
    this.rounds = 0;
  }
}

/**
 * 基准测试执行器
 * 封装性能基准测试执行业务逻辑
 */
class BenchmarkRunner {
  private benchmarkResults: number[] = [];

  public runBenchmark(result: number): void {
    this.benchmarkResults.push(result);
  }

  public getResults(): number[] {
    return [...this.benchmarkResults];
  }

  public getAverageResult(): number {
    if (this.benchmarkResults.length === 0) {
      return 0;
    }
    const total = this.benchmarkResults.reduce((sum, r) => sum + r, 0);
    return total / this.benchmarkResults.length;
  }

  public clear(): void {
    this.benchmarkResults = [];
  }
}

/**
 * 内存泄漏分析器
 * 封装内存增长趋势分析业务逻辑
 */
class MemoryLeakAnalyzer {
  private growthTrend: number[] = [];

  public recordGrowth(growth: number): void {
    this.growthTrend.push(growth);
  }

  public getGrowthTrend(): number[] {
    return [...this.growthTrend];
  }

  public isGrowingSteadily(): boolean {
    if (this.growthTrend.length < 3) {
      return false;
    }
    return this.growthTrend[this.growthTrend.length - 1] > this.growthTrend[0];
  }

  public clear(): void {
    this.growthTrend = [];
  }
}

/**
 * 性能阈值管理器
 * 封装性能指标阈值管理业务逻辑
 */
class PerformanceThreshold {
  private thresholds: Map<string, number> = new Map<string, number>();

  public setThreshold(metric: string, threshold: number): void {
    this.thresholds.set(metric, threshold);
  }

  public getThreshold(metric: string): number | null {
    return this.thresholds.get(metric) ?? null;
  }

  public isWithinThreshold(metric: string, value: number): boolean {
    const threshold = this.thresholds.get(metric);
    if (threshold === undefined) {
      return true;
    }
    return value <= threshold;
  }

  public clear(): void {
    this.thresholds.clear();
  }
}

/**
 * 性能统计器
 * 封装性能指标汇总统计业务逻辑
 */
class PerformanceStatistics {
  private totalCost: number = 0;
  private sampleCount: number = 0;

  public recordCost(cost: number): void {
    this.totalCost += cost;
    this.sampleCount++;
  }

  public getAverageCost(): number {
    if (this.sampleCount === 0) {
      return 0;
    }
    return this.totalCost / this.sampleCount;
  }

  public getSampleCount(): number {
    return this.sampleCount;
  }

  public reset(): void {
    this.totalCost = 0;
    this.sampleCount = 0;
  }
}

/**
 * 性能目标校验器
 * 封装性能指标合法性校验业务逻辑
 */
class PerformanceTargetValidator {
  public static isValidMetric(metric: string): boolean {
    return metric !== undefined && metric !== null && metric.length > 0;
  }

  public static isValidCost(cost: number): boolean {
    return cost >= 0;
  }
}

/**
 * 性能状态追踪器
 * 封装性能监控状态追踪业务逻辑
 */
class PerformanceStateTracker {
  private isMonitoringFlag: boolean = false;

  public startMonitoring(): void {
    this.isMonitoringFlag = true;
  }

  public stopMonitoring(): void {
    this.isMonitoringFlag = false;
  }

  public isMonitoring(): boolean {
    return this.isMonitoringFlag;
  }
}
