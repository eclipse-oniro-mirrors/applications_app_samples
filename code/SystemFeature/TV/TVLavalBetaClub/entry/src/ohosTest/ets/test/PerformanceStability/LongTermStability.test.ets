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

import { describe, it, expect } from '@ohos/hypium';

const LONG_RUN_ITERATIONS: number = 100;

const CHECKPOINT_INTERVAL: number = 20;

const MAX_MEMORY_SLOPE_KB: number = 5;

const LATENCY_DEGRADATION_RATIO: number = 1.5;

const MAX_FAILURE_RATE: number = 5;

interface StabilitySample {
  iteration: number;
  memoryKb: number;
  latencyMs: number;
  failed: boolean;
}

// Aggregates long-running session statistics
class StabilitySession {
  private iterations: number = 0;
  private failures: number = 0;
  private totalLatency: number = 0;
  private maxLatency: number = 0;
  private startedAt: number = 0;
  private finishedAt: number = 0;

  public start(now: number = Date.now()): void {
    this.startedAt = now;
    this.finishedAt = 0;
  }

  public finish(now: number = Date.now()): void {
    this.finishedAt = now;
  }

  public record(latencyMs: number, failed: boolean): void {
    this.iterations++;
    this.totalLatency += latencyMs;
    if (latencyMs > this.maxLatency) {
      this.maxLatency = latencyMs;
    }
    if (failed) {
      this.failures++;
    }
  }

  public getIterations(): number {
    return this.iterations;
  }

  public getFailures(): number {
    return this.failures;
  }

  public getAverageLatency(): number {
    return this.iterations === 0 ? 0 : this.totalLatency / this.iterations;
  }

  public getMaxLatency(): number {
    return this.maxLatency;
  }

  public getFailureRate(): number {
    return this.iterations === 0 ? 0 : this.failures * 100 / this.iterations;
  }

  public isFailureRateAcceptable(threshold: number): boolean {
    return this.getFailureRate() <= threshold;
  }

  public getDuration(): number {
    return this.startedAt === 0 || this.finishedAt === 0 ? 0 : this.finishedAt - this.startedAt;
  }

  public reset(): void {
    this.iterations = 0;
    this.failures = 0;
    this.totalLatency = 0;
    this.maxLatency = 0;
    this.startedAt = 0;
    this.finishedAt = 0;
  }
}

// Detects sustained memory growth across samples
class LeakTrendAnalyzer {
  private samples: number[] = [];

  public add(memoryKb: number): void {
    this.samples.push(memoryKb);
  }

  public count(): number {
    return this.samples.length;
  }

  public baseline(): number {
    return this.samples.length === 0 ? 0 : this.samples[0];
  }

  public latest(): number {
    return this.samples.length === 0 ? 0 : this.samples[this.samples.length - 1];
  }

  public growth(): number {
    return this.latest() - this.baseline();
  }

  public slope(): number {
    if (this.samples.length < 2) {
      return 0;
    }
    return this.growth() / (this.samples.length - 1);
  }

  public isGrowing(thresholdKb: number): boolean {
    return this.slope() > thresholdKb;
  }

  public isMonotonic(): boolean {
    for (let i = 1; i < this.samples.length; i++) {
      if (this.samples[i] < this.samples[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public reset(): void {
    this.samples = [];
  }
}

// Executes repeated iterations and records checkpoints
class IterationExecutor {
  private readonly total: number;
  private readonly checkpointInterval: number;
  private completed: number = 0;
  private checkpoints: number[] = [];

  constructor(total: number, checkpointInterval: number) {
    this.total = total;
    this.checkpointInterval = checkpointInterval;
  }

  public run(iteration: () => boolean): number {
    let failures: number = 0;
    for (let i = 0; i < this.total; i++) {
      if (!iteration()) {
        failures++;
      }
      this.completed++;
      if (this.checkpointInterval > 0 && this.completed % this.checkpointInterval === 0) {
        this.checkpoints.push(this.completed);
      }
    }
    return failures;
  }

  public getCompleted(): number {
    return this.completed;
  }

  public getCheckpoints(): number[] {
    return [...this.checkpoints];
  }

  public getTotal(): number {
    return this.total;
  }

  public isFinished(): boolean {
    return this.completed >= this.total;
  }

  public reset(): void {
    this.completed = 0;
    this.checkpoints = [];
  }
}

// Compares recent latency against the baseline window
class DegradationDetector {
  private baselineLatency: number = 0;
  private recentLatency: number = 0;
  private samples: number = 0;

  public setBaseline(latencyMs: number): void {
    this.baselineLatency = latencyMs;
  }

  public record(latencyMs: number): void {
    this.recentLatency = latencyMs;
    this.samples++;
  }

  public ratio(): number {
    return this.baselineLatency <= 0 ? 0 : this.recentLatency / this.baselineLatency;
  }

  public isDegraded(ratio: number): boolean {
    return this.ratio() > ratio;
  }

  public getSamples(): number {
    return this.samples;
  }

  public reset(): void {
    this.baselineLatency = 0;
    this.recentLatency = 0;
    this.samples = 0;
  }
}

// Produces a pass/fail report for the whole long-run suite
class StabilityReport {
  private checks: string[] = [];
  private failureItems: string[] = [];

  public check(name: string, passed: boolean): void {
    this.checks.push(name);
    if (!passed) {
      this.failureItems.push(name);
    }
  }

  public getCheckCount(): number {
    return this.checks.length;
  }

  public getFailures(): string[] {
    return [...this.failureItems];
  }

  public isPassed(): boolean {
    return this.checks.length > 0 && this.failureItems.length === 0;
  }

  public summary(): string {
    return this.isPassed() ? 'stable' : 'unstable';
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

export default function longTermStabilityTest() {
  describe('LongTermStability_Test', () => {

    it('session_should_aggregate_iterations', 0, () => {
      const session = new StabilitySession();
      session.start(1000);
      for (let i = 0; i < 10; i++) {
        session.record(100 + i, i === 9);
      }
      session.finish(3000);
      expect(session.getIterations()).assertEqual(10);
      expect(session.getFailures()).assertEqual(1);
      expect(session.getMaxLatency()).assertEqual(109);
      expect(session.getAverageLatency()).assertEqual(104.5);
      expect(session.getDuration()).assertEqual(2000);
    });

    it('session_should_compute_failure_rate', 0, () => {
      const session = new StabilitySession();
      session.record(10, false);
      session.record(10, true);
      session.record(10, false);
      session.record(10, false);
      expect(session.getFailureRate()).assertEqual(25);
      expect(session.isFailureRateAcceptable(MAX_FAILURE_RATE)).assertFalse();
      expect(session.isFailureRateAcceptable(30)).assertTrue();
      session.reset();
      expect(session.getIterations()).assertEqual(0);
      expect(session.getFailureRate()).assertEqual(0);
      expect(session.getDuration()).assertEqual(0);
    });

    it('trend_analyzer_should_detect_growth', 0, () => {
      const analyzer = new LeakTrendAnalyzer();
      expect(analyzer.count()).assertEqual(0);
      expect(analyzer.slope()).assertEqual(0);
      analyzer.add(1000);
      expect(analyzer.baseline()).assertEqual(1000);
      expect(analyzer.latest()).assertEqual(1000);
      analyzer.add(1020);
      analyzer.add(1040);
      expect(analyzer.count()).assertEqual(3);
      expect(analyzer.growth()).assertEqual(40);
      expect(analyzer.slope()).assertEqual(20);
      expect(analyzer.isGrowing(MAX_MEMORY_SLOPE_KB)).assertTrue();
      expect(analyzer.isMonotonic()).assertTrue();
    });

    it('trend_analyzer_should_detect_release', 0, () => {
      const analyzer = new LeakTrendAnalyzer();
      analyzer.add(1000);
      analyzer.add(1100);
      analyzer.add(1050);
      expect(analyzer.isMonotonic()).assertFalse();
      expect(analyzer.growth()).assertEqual(50);
      expect(analyzer.isGrowing(MAX_MEMORY_SLOPE_KB)).assertTrue();
      analyzer.reset();
      expect(analyzer.count()).assertEqual(0);
      expect(analyzer.growth()).assertEqual(0);
    });

    it('trend_analyzer_should_accept_stable_memory', 0, () => {
      const analyzer = new LeakTrendAnalyzer();
      analyzer.add(1000);
      analyzer.add(1001);
      analyzer.add(1002);
      expect(analyzer.slope()).assertEqual(1);
      expect(analyzer.isGrowing(MAX_MEMORY_SLOPE_KB)).assertFalse();
      expect(analyzer.isMonotonic()).assertTrue();
    });

    it('executor_should_run_all_iterations', 0, () => {
      const executor = new IterationExecutor(10, 5);
      const failures = executor.run(() => true);
      expect(failures).assertEqual(0);
      expect(executor.getCompleted()).assertEqual(10);
      expect(executor.isFinished()).assertTrue();
      expect(executor.getTotal()).assertEqual(10);
      expect(executor.getCheckpoints()).assertDeepEquals([5, 10]);
    });

    it('executor_should_count_failed_iterations', 0, () => {
      const executor = new IterationExecutor(6, 2);
      let index: number = 0;
      const failures = executor.run(() => {
        index++;
        return index % 3 !== 0;
      });
      expect(failures).assertEqual(2);
      expect(executor.getCompleted()).assertEqual(6);
      expect(executor.getCheckpoints()).assertDeepEquals([2, 4, 6]);
      executor.reset();
      expect(executor.getCompleted()).assertEqual(0);
      expect(executor.getCheckpoints().length).assertEqual(0);
      expect(executor.isFinished()).assertFalse();
    });

    it('executor_should_support_disabled_checkpoints', 0, () => {
      const executor = new IterationExecutor(5, 0);
      executor.run(() => true);
      expect(executor.getCompleted()).assertEqual(5);
      expect(executor.getCheckpoints().length).assertEqual(0);
      expect(executor.isFinished()).assertTrue();
    });

    it('degradation_detector_should_detect_slowdown', 0, () => {
      const detector = new DegradationDetector();
      detector.setBaseline(100);
      expect(detector.ratio()).assertEqual(0);
      detector.record(120);
      expect(detector.ratio()).assertEqual(1.2);
      expect(detector.isDegraded(LATENCY_DEGRADATION_RATIO)).assertFalse();
      detector.record(200);
      expect(detector.isDegraded(LATENCY_DEGRADATION_RATIO)).assertTrue();
      expect(detector.getSamples()).assertEqual(2);
    });

    it('degradation_detector_should_reset', 0, () => {
      const detector = new DegradationDetector();
      detector.setBaseline(50);
      detector.record(100);
      expect(detector.isDegraded(1.5)).assertTrue();
      detector.reset();
      expect(detector.ratio()).assertEqual(0);
      expect(detector.getSamples()).assertEqual(0);
      detector.setBaseline(0);
      detector.record(10);
      expect(detector.ratio()).assertEqual(0);
    });

    it('long_run_flow_should_remain_stable', 0, () => {
      const session = new StabilitySession();
      const trend = new LeakTrendAnalyzer();
      const executor = new IterationExecutor(LONG_RUN_ITERATIONS, CHECKPOINT_INTERVAL);
      session.start(0);
      let memory = 1000;
      const failures = executor.run(() => {
        memory += 0;
        session.record(10, false);
        if (executor.getCompleted() % CHECKPOINT_INTERVAL === 0) {
          trend.add(memory);
        }
        return true;
      });
      session.finish(1000);
      expect(failures).assertEqual(0);
      expect(executor.getCheckpoints().length).assertEqual(5);
      expect(session.getIterations()).assertEqual(LONG_RUN_ITERATIONS);
      expect(trend.isGrowing(MAX_MEMORY_SLOPE_KB)).assertFalse();
      expect(session.isFailureRateAcceptable(MAX_FAILURE_RATE)).assertTrue();
    });

    it('report_should_aggregate_stability_checks', 0, () => {
      const session = new StabilitySession();
      const trend = new LeakTrendAnalyzer();
      const detector = new DegradationDetector();
      session.record(10, false);
      session.record(20, false);
      trend.add(1000);
      trend.add(1001);
      detector.setBaseline(10);
      detector.record(12);
      const report = new StabilityReport();
      report.check('failureRate', session.isFailureRateAcceptable(MAX_FAILURE_RATE));
      report.check('memory', !trend.isGrowing(MAX_MEMORY_SLOPE_KB));
      report.check('latency', !detector.isDegraded(LATENCY_DEGRADATION_RATIO));
      expect(report.getCheckCount()).assertEqual(3);
      expect(report.isPassed()).assertTrue();
      expect(report.summary()).assertEqual('stable');
      report.check('forced', false);
      expect(report.isPassed()).assertFalse();
      expect(report.summary()).assertEqual('unstable');
      report.reset();
      expect(report.getCheckCount()).assertEqual(0);
    });

    it('stability_constants_should_be_stable', 0, () => {
      expect(LONG_RUN_ITERATIONS).assertEqual(100);
      expect(CHECKPOINT_INTERVAL).assertEqual(20);
      expect(MAX_MEMORY_SLOPE_KB).assertEqual(5);
      expect(LATENCY_DEGRADATION_RATIO).assertEqual(1.5);
      expect(MAX_FAILURE_RATE).assertEqual(5);
      expect(LONG_RUN_ITERATIONS / CHECKPOINT_INTERVAL).assertEqual(5);
    });
  });
}

