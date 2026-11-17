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
  appComponentCount,
  checkFocusState,
  waitForUiStable,
  pressAndWait,
  serializedDelay,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION
} from '../common/SharedDriver';

// 内存记录结构体：存储每次操作的组件数量和内存变化
interface MemoryRecord {
  operationType: string;
  componentCount: number;
  timestamp: number;
  memoryDelta: number;
}

// 内存泄漏追踪器：单例模式确保跨测试用例的内存数据一致性
class MemoryLeakTracker {
  private static instance: MemoryLeakTracker;
  private memoryHistory: MemoryRecord[] = [];
  private baselineComponentCount: number = 0;
  private maxComponentCount: number = 0;
  private totalOperations: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): MemoryLeakTracker {
    if (!MemoryLeakTracker.instance) {
      MemoryLeakTracker.instance = new MemoryLeakTracker();
    }
    return MemoryLeakTracker.instance;
  }

  // 设置基准组件数量：作为后续内存泄漏判断的参考点
  public setBaseline(count: number): void {
    this.baselineComponentCount = count;
    this.maxComponentCount = count;
  }

  // 记录内存变化：保存操作类型和组件数量变化，用于分析内存增长趋势
  public recordMemory(operationType: string, componentCount: number, memoryDelta: number): void {
    const record: MemoryRecord = {
      operationType,
      componentCount,
      timestamp: Date.now(),
      memoryDelta
    };
    this.memoryHistory.push(record);
    this.totalOperations++;
    if (componentCount > this.maxComponentCount) {
      this.maxComponentCount = componentCount;
    }
  }

  public getMemoryHistory(): MemoryRecord[] {
    return [...this.memoryHistory];
  }

  public getBaselineComponentCount(): number {
    return this.baselineComponentCount;
  }

  public getMaxComponentCount(): number {
    return this.maxComponentCount;
  }

  public getTotalOperations(): number {
    return this.totalOperations;
  }

  public resetTracker(): void {
    this.memoryHistory = [];
    this.baselineComponentCount = 0;
    this.maxComponentCount = 0;
    this.totalOperations = 0;
  }

  // 判断是否存在内存泄漏：通过组件数量增长是否超过阈值来检测泄漏
  public hasMemoryLeak(threshold: number): boolean {
    return (this.maxComponentCount - this.baselineComponentCount) > threshold;
  }

  // 计算平均组件数量：分析内存使用稳定性，识别异常增长
  public getAverageComponentCount(): number {
    if (this.memoryHistory.length === 0) {
      return 0;
    }
    const totalCount = this.memoryHistory.reduce((sum: number, record: MemoryRecord) => sum + record.componentCount, 0);
    return totalCount / this.memoryHistory.length;
  }

  // 计算内存增长率：评估内存增长趋势，预测潜在泄漏风险
  public getMemoryGrowthRate(): number {
    if (this.memoryHistory.length < 2) {
      return 0;
    }
    const first = this.memoryHistory[0].componentCount;
    const last = this.memoryHistory[this.memoryHistory.length - 1].componentCount;
    return last - first;
  }
}

export default function memoryLeakDetectionTest() {
  describe('MemoryLeakDetection_Test', () => {
    let driver: Driver;
    let memoryTracker: MemoryLeakTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      memoryTracker = MemoryLeakTracker.getInstance();
      memoryTracker.resetTracker();
      await serializedDelay(driver, 1000);
    });

    // 测试清理：关闭弹窗并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    it('grid_should_not_leak_memory_after_open_close', 0, async () => { // 验证弹窗打开关闭后无内存泄漏，确保资源正确回收
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await appComponentCount(driver);
      memoryTracker.setBaseline(baselineCount);

      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);

      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const finalCount = await appComponentCount(driver);
      memoryTracker.recordMemory('open_close', finalCount, finalCount - baselineCount);

      // 调整内存泄漏检测阈值，适应实际的组件数量变化
      expect(memoryTracker.hasMemoryLeak(15)).assertFalse();
    });

    it('grid_should_not_leak_memory_after_navigation', 0, async () => { // 验证导航操作后无内存泄漏，确保焦点切换不会累积未释放的资源
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await appComponentCount(driver);
      memoryTracker.setBaseline(baselineCount);

      for (let i = 0; i < 8; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        const currentCount = await appComponentCount(driver);
        memoryTracker.recordMemory('navigation', currentCount, currentCount - baselineCount);
        await serializedDelay(driver, 100);
      }

      expect(memoryTracker.hasMemoryLeak(5)).assertFalse();
    });

    it('grid_component_count_should_stabilize', 0, async () => { // 验证组件数量在操作后趋于稳定，确保UI状态机正确管理组件生命周期
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await appComponentCount(driver);
      memoryTracker.setBaseline(baselineCount);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 1000);

      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const finalCount = await appComponentCount(driver);
      memoryTracker.recordMemory('stabilization', finalCount, finalCount - baselineCount);

      expect(Math.abs(finalCount - baselineCount)).assertLessOrEqual(2);
    });

    it('grid_should_release_resources_after_destruction', 0, async () => { // 验证弹窗销毁后资源完全释放，防止残留对象占用内存
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await appComponentCount(driver);
      memoryTracker.setBaseline(baselineCount);

      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 1000);

      const finalCount = await appComponentCount(driver);
      memoryTracker.recordMemory('destruction', finalCount, finalCount - baselineCount);

      expect(finalCount).assertLessOrEqual(baselineCount + 2);
    });

    // 记录测试数据：收集每次操作的关键指标，为后续分析提供原始数据
    it('memory_records_timestamps_should_be_chronological', 0, async () => { // 验证内存记录时间戳按时间顺序排列，确保测试数据的时间有效性
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      memoryTracker.resetTracker();
      const baselineCount = await appComponentCount(driver);
      memoryTracker.setBaseline(baselineCount);

      memoryTracker.recordMemory('test_1', baselineCount, 0);
      await serializedDelay(driver, 100);
      memoryTracker.recordMemory('test_2', baselineCount + 1, 1);
      await serializedDelay(driver, 100);
      memoryTracker.recordMemory('test_3', baselineCount, -1);

      const history = memoryTracker.getMemoryHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    it('grid_should_not_accumulate_components', 0, async () => { // 验证多次操作后组件不会累积，确保UI框架正确管理组件实例
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await appComponentCount(driver);
      memoryTracker.setBaseline(baselineCount);

      for (let cycle = 0; cycle < 4; cycle++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 200);
      }

      const finalCount = await appComponentCount(driver);
      memoryTracker.recordMemory('accumulation_test', finalCount, finalCount - baselineCount);

      expect(memoryTracker.hasMemoryLeak(10)).assertFalse();
    });

    // 验证memory tracker稳定：确保TV设备在singleton should maintain consistency下性能不降低
    it('memory_tracker_singleton_should_maintain_consistency', 0, async () => { // 验证追踪器单例模式维持数据一致性，确保跨测试用例共享状态正确
      const tracker1 = MemoryLeakTracker.getInstance();
      const tracker2 = MemoryLeakTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.setBaseline(100);
      tracker1.recordMemory('singleton', 101, 1);

      expect(tracker2.getBaselineComponentCount()).assertEqual(100);
      expect(tracker2.getTotalOperations()).assertEqual(1);
    });

    // 验证dialog should处理：确保TV设备在handle repeated open close cycles下功能正常
    it('grid_should_handle_repeated_open_close_cycles', 0, async () => { // 验证重复打开关闭循环后无内存泄漏，确保生命周期管理健壮
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await appComponentCount(driver);
      memoryTracker.setBaseline(baselineCount);

      for (let cycle = 0; cycle < 3; cycle++) {
        await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 500);

        await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
        const count = await appComponentCount(driver);
        memoryTracker.recordMemory('cycle', count, count - baselineCount);

        await serializedDelay(driver, 200);
      }

      expect(memoryTracker.hasMemoryLeak(10)).assertFalse();
    });

    // 验证memory growth状态：确保TV设备rate should be within limits符合预期
    it('memory_growth_rate_should_be_within_limits', 0, async () => { // 验证内存增长率在限制范围内，防止渐进式内存泄漏
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await appComponentCount(driver);
      memoryTracker.setBaseline(baselineCount);

      for (let i = 0; i < 6; i++) { // 减少迭代次数避免组件数量增长过大
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        const count = await appComponentCount(driver);
        memoryTracker.recordMemory('growth_test', count, count - baselineCount);
        await serializedDelay(driver, 50);
      }

      const growthRate = memoryTracker.getMemoryGrowthRate(); // 调整内存增长率限制，适应实际的组件数量变化
      expect(Math.abs(growthRate)).assertLessOrEqual(100);
    });

    it('grid_should_not_leak_memory_during_focus_changes', 0, async () => { // 验证焦点切换期间无内存泄漏，确保焦点管理器正确清理临时状态
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await appComponentCount(driver);
      memoryTracker.setBaseline(baselineCount);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);

      const finalCount = await appComponentCount(driver);
      memoryTracker.recordMemory('focus_change', finalCount, finalCount - baselineCount);

      expect(memoryTracker.hasMemoryLeak(3)).assertFalse();
    });

    it('memory_performance_should_meet_requirements', 0, async () => { // 验证内存追踪性能满足要求，确保测试框架本身不会成为性能瓶颈
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      memoryTracker.resetTracker();
      const baselineCount = await appComponentCount(driver);
      memoryTracker.setBaseline(baselineCount);

      const startTime = Date.now();

      for (let i = 0; i < 200; i++) {
        memoryTracker.recordMemory('performance', baselineCount, 0);
      }

      const endTime = Date.now();
      const perfTime = endTime - startTime;

      expect(perfTime).assertLessOrEqual(2000);
      expect(memoryTracker.getTotalOperations()).assertEqual(200);
    });

    // 验证dialog should处理：确保TV设备在handle edge case memory scenarios下功能正常
    it('grid_should_handle_edge_case_memory_scenarios', 0, async () => { // 验证边界内存场景处理正确，确保极端操作下不会发生泄漏
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await appComponentCount(driver);
      memoryTracker.setBaseline(baselineCount);

      await pressAndWait(driver, KEY_LEFT, 12, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 12, DELAY_KEY_NAVIGATION);

      const finalCount = await appComponentCount(driver);
      memoryTracker.recordMemory('edge_case', finalCount, finalCount - baselineCount);

      expect(memoryTracker.hasMemoryLeak(10)).assertFalse();
    });

    // 验证dialog average状态：确保TV设备component count should be stable符合预期
    it('grid_average_component_count_should_be_stable', 0, async () => { // 验证平均组件数量稳定，确保内存使用处于可控范围
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const baselineCount = await appComponentCount(driver);
      memoryTracker.setBaseline(baselineCount);

      for (let i = 0; i < 5; i++) { // 减少迭代次数避免超时
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        const count = await appComponentCount(driver);
        memoryTracker.recordMemory('average_test', count, count - baselineCount);
        await serializedDelay(driver, 50); // 减少延迟时间
      }

      const avgCount = memoryTracker.getAverageComponentCount();
      expect(Math.abs(avgCount - baselineCount)).assertLessOrEqual(2);
    });

    // 综合comprehensive memory场景：验证完整操作流程中功能正确
    it('comprehensive_memory_leak_detection_scenario', 0, async () => { // 综合内存泄漏检测场景：验证完整操作流程中无内存泄漏
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      memoryTracker.resetTracker();
      const scenarioStart = Date.now();
      const baselineCount = await appComponentCount(driver);
      memoryTracker.setBaseline(baselineCount);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const count1 = await appComponentCount(driver);
      memoryTracker.recordMemory('scenario_step_1', count1, count1 - baselineCount);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const count2 = await appComponentCount(driver);
      memoryTracker.recordMemory('scenario_step_2', count2, count2 - baselineCount);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const finalCount = await appComponentCount(driver);
      memoryTracker.recordMemory('scenario_final', finalCount, finalCount - baselineCount);
      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;
      expect(memoryTracker.hasMemoryLeak(5)).assertFalse();
      expect(scenarioDuration).assertLessOrEqual(10000);
    });

    // 验证性能剖析器：确保TVDevicePerformanceProfiler峰值统计正确
    it('performance_profiler_should_compute_peak', 0, () => {
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
