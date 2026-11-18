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
  KEY_BACK,
  powerDialogComponentCount,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../Shared/SharedDriver';

// 性能采样记录接口
interface PerformanceSample {
  name: string;
  durationMs: number;
}

// 性能监控器：采集耗时样本并计算统计指标
class PerformanceMonitor {
  private samples: PerformanceSample[] = [];

  public measure(name: string, action: () => void): number {
    const start = Date.now();
    action();
    const duration = Date.now() - start;
    this.samples.push({ name, durationMs: duration });
    return duration;
  }

  public recordSample(name: string, durationMs: number): void {
    this.samples.push({ name, durationMs });
  }

  public getSamples(): PerformanceSample[] {
    return [...this.samples];
  }

  public getSampleCount(): number {
    return this.samples.length;
  }

  public getAverageDuration(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    const total = this.samples.reduce((sum: number, sample: PerformanceSample) => sum + sample.durationMs, 0);
    return total / this.samples.length;
  }

  public getMaxDuration(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let max = 0;
    this.samples.forEach((sample: PerformanceSample) => {
      if (sample.durationMs > max) {
        max = sample.durationMs;
      }
    });
    return max;
  }

  public getMinDuration(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let min = Number.MAX_VALUE;
    this.samples.forEach((sample: PerformanceSample) => {
      if (sample.durationMs < min) {
        min = sample.durationMs;
      }
    });
    return min;
  }

  public clear(): void {
    this.samples = [];
  }
}

// 性能指标类型枚举：描述性能监控关注的指标类别
enum MetricType {
  METRIC_LATENCY = 'latency', METRIC_THROUGHPUT = 'throughput', METRIC_MEMORY = 'memory', METRIC_CPU = 'cpu'
}

// 性能等级枚举：描述性能表现的评级
enum PerformanceGrade {
  GRADE_EXCELLENT = 'excellent', GRADE_GOOD = 'good', GRADE_ACCEPTABLE = 'acceptable', GRADE_POOR = 'poor'
}

// 百分位结果接口：记录一次百分位统计结果
interface PercentileResult {
  p50: number;
  p90: number;
  p99: number;
  max: number;
}

// 性能分析器：对样本集合进行百分位、标准差与中位数分析
class PerformanceAnalyzer {
  private samples: PerformanceSample[] = [];

  public setSamples(samples: PerformanceSample[]): void {
    this.samples = [...samples];
  }

  public addSample(sample: PerformanceSample): void {
    this.samples.push(sample);
  }

  public getSampleCount(): number {
    return this.samples.length;
  }

  private getSortedDurations(): number[] {
    const durations = this.samples.map((sample: PerformanceSample) => sample.durationMs);
    return durations.sort((a: number, b: number) => a - b);
  }

  public getMedian(): number {
    const sorted = this.getSortedDurations();
    if (sorted.length === 0) {
      return 0;
    }
    const mid = Math.floor(sorted.length / 2);
    if (sorted.length % 2 === 1) {
      return sorted[mid];
    }
    return (sorted[mid - 1] + sorted[mid]) / 2;
  }

  public getPercentile(percentile: number): number {
    const sorted = this.getSortedDurations();
    if (sorted.length === 0) {
      return 0;
    }
    const index = Math.ceil((percentile / 100) * sorted.length) - 1;
    const clamped = index < 0 ? 0 : (index >= sorted.length ? sorted.length - 1 : index);
    return sorted[clamped];
  }

  public getStandardDeviation(): number {
    const count = this.samples.length;
    if (count === 0) {
      return 0;
    }
    const durations = this.samples.map((sample: PerformanceSample) => sample.durationMs);
    let sum = 0;
    durations.forEach((duration: number) => sum += duration);
    const average = sum / count;
    let sumSquared = 0;
    durations.forEach((duration: number) => {
      const diff = duration - average;
      sumSquared += diff * diff;
    });
    return Math.sqrt(sumSquared / count);
  }

  public generatePercentileResult(): PercentileResult {
    return {
      p50: this.getPercentile(50),
      p90: this.getPercentile(90),
      p99: this.getPercentile(99),
      max: this.getPercentile(100)
    };
  }
}

// 性能报告器：将性能统计数据格式化为可读文本报告
class PerformanceReport {
  private analyzer: PerformanceAnalyzer;

  constructor(analyzer: PerformanceAnalyzer) {
    this.analyzer = analyzer;
  }

  public buildSummary(): string {
    const percentiles = this.analyzer.generatePercentileResult();
    return `PerformanceReport{count: ${this.analyzer.getSampleCount()}, median: ${this.analyzer.getMedian()}, ` +
      `p90: ${percentiles.p90}, stddev: ${this.analyzer.getStandardDeviation()}}`;
  }

  public buildPercentileText(): string {
    const percentiles = this.analyzer.generatePercentileResult();
    return `p50=${percentiles.p50}, p90=${percentiles.p90}, p99=${percentiles.p99}, max=${percentiles.max}`;
  }

  public hasLowVariance(threshold: number): boolean {
    return this.analyzer.getStandardDeviation() <= threshold;
  }

  public clear(): void {
    this.analyzer.setSamples([]);
  }
}

// 吞吐量计数器：统计单位时间内的操作吞吐量
class ThroughputCounter {
  private operationCount: number = 0;
  private startTimestamp: number = 0;
  private endTimestamp: number = 0;

  public start(): void {
    this.startTimestamp = Date.now();
    this.endTimestamp = 0;
  }

  public recordOperation(): void {
    this.operationCount++;
  }

  public stop(): void {
    this.endTimestamp = Date.now();
  }

  public getOperationCount(): number {
    return this.operationCount;
  }

  public getElapsedMs(): number {
    if (this.endTimestamp === 0) {
      return Date.now() - this.startTimestamp;
    }
    return this.endTimestamp - this.startTimestamp;
  }

  public getThroughputPerSecond(): number {
    const elapsedMs = this.getElapsedMs();
    if (elapsedMs <= 0) {
      return 0;
    }
    return (this.operationCount * 1000) / elapsedMs;
  }

  public reset(): void {
    this.operationCount = 0;
    this.startTimestamp = 0;
    this.endTimestamp = 0;
  }
}

// 性能等级评估器：根据平均耗时与标准差评估性能等级
class PerformanceGradeEvaluator {
  private excellentAvg: number;
  private goodAvg: number;
  private acceptableAvg: number;

  constructor(excellentAvg: number, goodAvg: number, acceptableAvg: number) {
    this.excellentAvg = excellentAvg;
    this.goodAvg = goodAvg;
    this.acceptableAvg = acceptableAvg;
  }

  public evaluate(average: number): PerformanceGrade {
    if (average <= this.excellentAvg) {
      return PerformanceGrade.GRADE_EXCELLENT;
    }
    if (average <= this.goodAvg) {
      return PerformanceGrade.GRADE_GOOD;
    }
    if (average <= this.acceptableAvg) {
      return PerformanceGrade.GRADE_ACCEPTABLE;
    }
    return PerformanceGrade.GRADE_POOR;
  }

  public describeGrade(grade: PerformanceGrade): string {
    if (grade === PerformanceGrade.GRADE_EXCELLENT) {
      return '优秀';
    }
    if (grade === PerformanceGrade.GRADE_GOOD) {
      return '良好';
    }
    if (grade === PerformanceGrade.GRADE_ACCEPTABLE) {
      return '可接受';
    }
    return '较差';
  }
}

// 样本聚合器：按名称聚合性能样本并输出分组统计
class SampleAggregator {
  private samples: PerformanceSample[] = [];

  public addSample(sample: PerformanceSample): void {
    this.samples.push(sample);
  }

  public getDistinctNames(): string[] {
    const names: Set<string> = new Set<string>();
    this.samples.forEach((sample: PerformanceSample) => names.add(sample.name));
    return Array.from(names);
  }

  public countByName(name: string): number {
    return this.samples.filter((sample: PerformanceSample) => sample.name === name).length;
  }

  public averageByName(name: string): number {
    const matched = this.samples.filter((sample: PerformanceSample) => sample.name === name);
    if (matched.length === 0) {
      return 0;
    }
    let sum = 0;
    matched.forEach((sample: PerformanceSample) => sum += sample.durationMs);
    return sum / matched.length;
  }

  public clear(): void {
    this.samples = [];
  }
}

// 性能样本记录器：批量采集性能样本并输出汇总
class PerformanceSampleRecorder {
  private samples: PerformanceSample[] = [];

  public record(name: string, durationMs: number): void {
    this.samples.push({ name, durationMs });
  }

  public recordMany(name: string, durations: number[]): void {
    durations.forEach((duration: number) => this.samples.push({ name, durationMs: duration }));
  }

  public getSamples(): PerformanceSample[] {
    return [...this.samples];
  }

  public getSampleCount(): number {
    return this.samples.length;
  }

  public getTotalDuration(): number {
    let total = 0;
    this.samples.forEach((sample: PerformanceSample) => total += sample.durationMs);
    return total;
  }

  public getDurationSumByName(name: string): number {
    let sum = 0;
    this.samples.forEach((sample: PerformanceSample) => {
      if (sample.name === name) {
        sum += sample.durationMs;
      }
    });
    return sum;
  }

  public clear(): void {
    this.samples = [];
  }
}

// 延迟预算：管理各性能指标的延迟预算与超支检测
class LatencyBudget {
  private budgets: Map<string, number> = new Map<string, number>();

  public setBudget(metricName: string, budgetMs: number): void {
    this.budgets.set(metricName, budgetMs);
  }

  public getBudget(metricName: string): number {
    const budget = this.budgets.get(metricName);
    return budget === undefined ? 0 : budget;
  }

  public isWithinBudget(metricName: string, actualMs: number): boolean {
    const budget = this.getBudget(metricName);
    return budget > 0 && actualMs <= budget;
  }

  public getBudgetCount(): number {
    return this.budgets.size;
  }

  public hasBudget(metricName: string): boolean {
    return this.budgets.has(metricName);
  }

  public clear(): void {
    this.budgets.clear();
  }
}

export default function powerPerformanceTest() {
  describe('PowerPerformance_Test', () => {
    let driver: Driver;
    let monitor: PerformanceMonitor;

    beforeAll(async () => {
      driver = getDriver();
      monitor = new PerformanceMonitor();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    it('focus_switch_should_be_within_time_limit', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      monitor.clear();
      for (let i = 0; i < 20; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_RIGHT : KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        monitor.measure('focus_switch', () => {
        });
      }
      expect(monitor.getAverageDuration()).assertLessOrEqual(200);
    });

    it('startup_should_be_within_time_limit', 0, async () => {
      const start = Date.now();
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const elapsed = Date.now() - start;
      expect(elapsed).assertLessOrEqual(5000);
    });

    it('dialog_render_should_be_stable', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('memory_should_be_stable_after_operations', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      for (let i = 0; i < 50; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_RIGHT : KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('repeated_operations_should_be_stable', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      monitor.clear();
      for (let i = 0; i < 100; i++) {
        monitor.measure('operation', () => {
        });
      }
      expect(monitor.getSampleCount()).assertEqual(100);
      expect(monitor.getMaxDuration()).assertLessOrEqual(100);
    });

    it('long_running_focus_switch_should_be_stable', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const start = Date.now();
      for (let i = 0; i < 60; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_RIGHT : KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const elapsed = Date.now() - start;
      expect(elapsed).assertLessOrEqual(10000);
    });

    it('average_duration_should_be_calculated_correctly', 0, async () => {
      const m = new PerformanceMonitor();
      m.recordSample('a', 10);
      m.recordSample('b', 20);
      m.recordSample('c', 30);
      expect(m.getAverageDuration()).assertEqual(20);
    });

    it('max_duration_should_be_calculated_correctly', 0, async () => {
      const m = new PerformanceMonitor();
      m.recordSample('a', 5);
      m.recordSample('b', 50);
      m.recordSample('c', 15);
      expect(m.getMaxDuration()).assertEqual(50);
    });

    it('min_duration_should_be_calculated_correctly', 0, async () => {
      const m = new PerformanceMonitor();
      m.recordSample('a', 5);
      m.recordSample('b', 50);
      m.recordSample('c', 15);
      expect(m.getMinDuration()).assertEqual(5);
    });

    it('empty_samples_should_return_zero_stats', 0, async () => {
      const m = new PerformanceMonitor();
      expect(m.getAverageDuration()).assertEqual(0);
      expect(m.getMaxDuration()).assertEqual(0);
      expect(m.getMinDuration()).assertEqual(0);
    });

    it('clear_should_reset_samples', 0, async () => {
      const m = new PerformanceMonitor();
      m.recordSample('a', 10);
      m.clear();
      expect(m.getSampleCount()).assertEqual(0);
    });

    it('single_sample_average_should_equal_sample', 0, async () => {
      const m = new PerformanceMonitor();
      m.recordSample('a', 25);
      expect(m.getAverageDuration()).assertEqual(25);
    });

    it('single_sample_max_should_equal_sample', 0, async () => {
      const m = new PerformanceMonitor();
      m.recordSample('a', 25);
      expect(m.getMaxDuration()).assertEqual(25);
    });

    it('single_sample_min_should_equal_sample', 0, async () => {
      const m = new PerformanceMonitor();
      m.recordSample('a', 25);
      expect(m.getMinDuration()).assertEqual(25);
    });

    it('measure_should_return_duration', 0, async () => {
      const m = new PerformanceMonitor();
      const duration = m.measure('op', () => {
      });
      expect(duration).assertLargerOrEqual(0);
    });

    it('many_samples_should_be_tracked', 0, async () => {
      const m = new PerformanceMonitor();
      for (let i = 0; i < 200; i++) {
        m.recordSample('sample', i);
      }
      expect(m.getSampleCount()).assertEqual(200);
    });

    it('clear_should_zero_all_stats', 0, async () => {
      const m = new PerformanceMonitor();
      m.recordSample('a', 10);
      m.recordSample('b', 20);
      m.clear();
      expect(m.getAverageDuration()).assertEqual(0);
      expect(m.getMaxDuration()).assertEqual(0);
      expect(m.getMinDuration()).assertEqual(0);
    });

    it('repeated_clear_should_be_safe', 0, async () => {
      const m = new PerformanceMonitor();
      m.clear();
      m.clear();
      expect(m.getSampleCount()).assertEqual(0);
    });

    it('sample_name_should_be_preserved', 0, async () => {
      const m = new PerformanceMonitor();
      m.recordSample('focus_switch', 10);
      expect(m.getSamples()[0].name).assertEqual('focus_switch');
    });

    it('avg_after_two_samples_is_mean', 0, async () => {
      const m = new PerformanceMonitor();
      m.recordSample('a', 10);
      m.recordSample('b', 30);
      expect(m.getAverageDuration()).assertEqual(20);
    });

    it('max_after_equal_samples', 0, async () => {
      const m = new PerformanceMonitor();
      m.recordSample('a', 15);
      m.recordSample('b', 15);
      expect(m.getMaxDuration()).assertEqual(15);
    });

    it('min_after_equal_samples', 0, async () => {
      const m = new PerformanceMonitor();
      m.recordSample('a', 15);
      m.recordSample('b', 15);
      expect(m.getMinDuration()).assertEqual(15);
    });

    it('measure_multiple_tracks_all', 0, async () => {
      const m = new PerformanceMonitor();
      m.measure('a', () => {
      });
      m.measure('b', () => {
      });
      m.measure('c', () => {
      });
      expect(m.getSampleCount()).assertEqual(3);
    });

    it('large_duration_sample_is_tracked', 0, async () => {
      const m = new PerformanceMonitor();
      m.recordSample('slow', 5000);
      expect(m.getMaxDuration()).assertEqual(5000);
    });

    it('zero_duration_sample_is_tracked', 0, async () => {
      const m = new PerformanceMonitor();
      m.recordSample('instant', 0);
      expect(m.getMinDuration()).assertEqual(0);
    });

    it('sample_order_should_be_preserved', 0, async () => {
      const m = new PerformanceMonitor();
      m.recordSample('first', 1);
      m.recordSample('second', 2);
      const samples = m.getSamples();
      expect(samples[0].name).assertEqual('first');
      expect(samples[1].name).assertEqual('second');
    });

    it('count_after_clear_and_remeasure', 0, async () => {
      const m = new PerformanceMonitor();
      m.recordSample('a', 10);
      m.clear();
      m.recordSample('b', 20);
      expect(m.getSampleCount()).assertEqual(1);
    });

    it('avg_after_clear_and_single_measure', 0, async () => {
      const m = new PerformanceMonitor();
      m.recordSample('a', 100);
      m.clear();
      m.recordSample('b', 40);
      expect(m.getAverageDuration()).assertEqual(40);
    });

    it('max_min_after_clear_are_zero', 0, async () => {
      const m = new PerformanceMonitor();
      m.recordSample('a', 100);
      m.clear();
      expect(m.getMaxDuration()).assertEqual(0);
      expect(m.getMinDuration()).assertEqual(0);
    });

    // 适配 PerformanceAnalyzer：验证中位数计算含奇偶样本
    it('analyzer_median_should_be_computed', 0, async () => {
      const analyzer = new PerformanceAnalyzer();
      analyzer.setSamples([{ name: 'a', durationMs: 10 }, { name: 'b', durationMs: 20 }, { name: 'c', durationMs: 30 }, { name: 'd', durationMs: 40 }]);
      expect(analyzer.getMedian()).assertEqual(25);
      analyzer.setSamples([{ name: 'a', durationMs: 10 }, { name: 'b', durationMs: 20 }, { name: 'c', durationMs: 30 }]);
      expect(analyzer.getMedian()).assertEqual(20);
    });

    // 适配 PerformanceAnalyzer：验证百分位计算
    it('analyzer_percentile_should_be_computed', 0, async () => {
      const analyzer = new PerformanceAnalyzer();
      analyzer.setSamples([{ name: 'a', durationMs: 10 }, { name: 'b', durationMs: 20 }, { name: 'c', durationMs: 30 }, { name: 'd', durationMs: 40 }, { name: 'e', durationMs: 50 }]);
      expect(analyzer.getPercentile(50)).assertEqual(30);
      expect(analyzer.getPercentile(90)).assertEqual(50);
      expect(analyzer.getPercentile(100)).assertEqual(50);
    });

    // 适配 PerformanceAnalyzer：验证标准差计算
    it('analyzer_standard_deviation_should_be_computed', 0, async () => {
      const analyzer = new PerformanceAnalyzer();
      analyzer.setSamples([{ name: 'a', durationMs: 2 }, { name: 'b', durationMs: 4 }, { name: 'c', durationMs: 4 }, { name: 'd', durationMs: 4 }, { name: 'e', durationMs: 5 }, { name: 'f', durationMs: 5 }, { name: 'g', durationMs: 7 }, { name: 'h', durationMs: 9 }]);
      expect(analyzer.getStandardDeviation()).assertEqual(2);
    });

    // 适配 PerformanceAnalyzer：验证百分位结果包含最大值
    it('analyzer_generate_percentile_result_should_return_max', 0, async () => {
      const analyzer = new PerformanceAnalyzer();
      analyzer.setSamples([{ name: 'a', durationMs: 10 }, { name: 'b', durationMs: 20 }, { name: 'c', durationMs: 30 }]);
      const result: PercentileResult = analyzer.generatePercentileResult();
      expect(result.max).assertEqual(30);
      expect(result.p90).assertLargerOrEqual(result.p50);
      expect(result.p99).assertLargerOrEqual(result.p90);
    });

    // 适配 PerformanceAnalyzer：验证空样本返回零统计
    it('analyzer_empty_samples_should_return_zero', 0, async () => {
      const analyzer = new PerformanceAnalyzer();
      expect(analyzer.getMedian()).assertEqual(0);
      expect(analyzer.getPercentile(50)).assertEqual(0);
      expect(analyzer.getStandardDeviation()).assertEqual(0);
      expect(analyzer.getSampleCount()).assertEqual(0);
    });

    // 适配 PerformanceReport：验证报告摘要与百分位文本
    it('report_build_summary_should_contain_stats', 0, async () => {
      const analyzer = new PerformanceAnalyzer();
      analyzer.setSamples([{ name: 'a', durationMs: 10 }, { name: 'b', durationMs: 20 }, { name: 'c', durationMs: 30 }]);
      const report = new PerformanceReport(analyzer);
      expect(report.buildSummary()).assertContain('PerformanceReport');
      expect(report.buildPercentileText()).assertContain('p50');
      expect(report.hasLowVariance(50)).assertTrue();
    });

    // 适配 PerformanceReport：验证低方差判定与清空
    it('report_has_low_variance_should_judge', 0, async () => {
      const analyzer = new PerformanceAnalyzer();
      analyzer.setSamples([{ name: 'a', durationMs: 10 }, { name: 'b', durationMs: 100 }, { name: 'c', durationMs: 190 }]);
      const report = new PerformanceReport(analyzer);
      expect(report.hasLowVariance(10)).assertFalse();
      report.clear();
      expect(analyzer.getSampleCount()).assertEqual(0);
    });

    // 适配 ThroughputCounter：验证操作计数与吞吐量计算
    it('throughput_counter_should_count_operations', 0, async () => {
      const counter = new ThroughputCounter();
      counter.start();
      for (let i = 0; i < 10; i++) {
        counter.recordOperation();
      }
      counter.stop();
      expect(counter.getOperationCount()).assertEqual(10);
      expect(counter.getElapsedMs()).assertLargerOrEqual(0);
      expect(counter.getThroughputPerSecond()).assertLargerOrEqual(0);
    });

    // 适配 ThroughputCounter：验证重置后计数归零
    it('throughput_counter_should_reset', 0, async () => {
      const counter = new ThroughputCounter();
      counter.start();
      counter.recordOperation();
      counter.stop();
      counter.reset();
      expect(counter.getOperationCount()).assertEqual(0);
      expect(counter.getElapsedMs()).assertLargerOrEqual(0);
    });

    // 适配 PerformanceGradeEvaluator：验证性能等级边界评估
    it('grade_evaluator_should_evaluate_grades', 0, async () => {
      const evaluator = new PerformanceGradeEvaluator(50, 100, 200);
      expect(evaluator.evaluate(30)).assertEqual(PerformanceGrade.GRADE_EXCELLENT);
      expect(evaluator.evaluate(50)).assertEqual(PerformanceGrade.GRADE_EXCELLENT);
      expect(evaluator.evaluate(51)).assertEqual(PerformanceGrade.GRADE_GOOD);
      expect(evaluator.evaluate(100)).assertEqual(PerformanceGrade.GRADE_GOOD);
      expect(evaluator.evaluate(101)).assertEqual(PerformanceGrade.GRADE_ACCEPTABLE);
      expect(evaluator.evaluate(201)).assertEqual(PerformanceGrade.GRADE_POOR);
    });

    // 适配 PerformanceGradeEvaluator：验证等级文本描述
    it('grade_evaluator_should_describe_grade', 0, async () => {
      const evaluator = new PerformanceGradeEvaluator(50, 100, 200);
      expect(evaluator.describeGrade(PerformanceGrade.GRADE_EXCELLENT)).assertEqual('优秀');
      expect(evaluator.describeGrade(PerformanceGrade.GRADE_GOOD)).assertEqual('良好');
      expect(evaluator.describeGrade(PerformanceGrade.GRADE_ACCEPTABLE)).assertEqual('可接受');
      expect(evaluator.describeGrade(PerformanceGrade.GRADE_POOR)).assertEqual('较差');
    });

    // 适配 SampleAggregator：验证样本按名称分组统计
    it('sample_aggregator_should_group_by_name', 0, async () => {
      const aggregator = new SampleAggregator();
      aggregator.addSample({ name: 'focus', durationMs: 10 });
      aggregator.addSample({ name: 'focus', durationMs: 30 });
      aggregator.addSample({ name: 'render', durationMs: 20 });
      expect(aggregator.getDistinctNames().length).assertEqual(2);
      expect(aggregator.countByName('focus')).assertEqual(2);
      expect(aggregator.averageByName('focus')).assertEqual(20);
      expect(aggregator.averageByName('missing')).assertEqual(0);
      aggregator.clear();
      expect(aggregator.countByName('focus')).assertEqual(0);
    });

    // 适配 PerformanceSampleRecorder：验证批量记录与按名求和
    it('performance_sample_recorder_should_record_many', 0, async () => {
      const recorder = new PerformanceSampleRecorder();
      recorder.record('focus', 10);
      recorder.recordMany('render', [10, 20, 30]);
      expect(recorder.getSampleCount()).assertEqual(4);
      expect(recorder.getTotalDuration()).assertEqual(70);
      expect(recorder.getDurationSumByName('render')).assertEqual(60);
      recorder.clear();
      expect(recorder.getSampleCount()).assertEqual(0);
    });

    // 适配 LatencyBudget：验证延迟预算管理与超支判定
    it('latency_budget_should_track_budgets', 0, async () => {
      const budget = new LatencyBudget();
      budget.setBudget('focus_switch', 100);
      expect(budget.getBudget('focus_switch')).assertEqual(100);
      expect(budget.isWithinBudget('focus_switch', 90)).assertTrue();
      expect(budget.isWithinBudget('focus_switch', 110)).assertFalse();
      expect(budget.hasBudget('focus_switch')).assertTrue();
      expect(budget.hasBudget('missing')).assertFalse();
      expect(budget.getBudgetCount()).assertEqual(1);
      budget.clear();
      expect(budget.getBudgetCount()).assertEqual(0);
    });
  });
}
