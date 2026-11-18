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

const DEFAULT_CYCLES: number = 50;

const CHECKPOINT_INTERVAL: number = 10;

const MAX_LATENCY_GROWTH: number = 20;

const MAX_MEMORY_GROWTH_KB: number = 1024;

const MAX_FAILURE_RATE: number = 2;

interface EnduranceSample {
  cycle: number;
  latencyMs: number;
  memoryKb: number;
  passed: boolean;
}

// Runs repeatable page cycles over a long session
class EnduranceRunner {
  private readonly totalCycles: number;
  private readonly checkpointInterval: number;
  private completed: number = 0;
  private failures: number = 0;
  private samples: EnduranceSample[] = [];

  constructor(totalCycles: number, checkpointInterval: number) {
    this.totalCycles = totalCycles;
    this.checkpointInterval = checkpointInterval;
  }

  public run(cycle: (index: number) => EnduranceSample): number {
    let failures: number = 0;
    for (let i = 0; i < this.totalCycles; i++) {
      const sample = cycle(i);
      this.samples.push(sample);
      this.completed++;
      if (!sample.passed) {
        failures++;
        this.failures++;
      }
      if (this.checkpointInterval > 0 && this.completed % this.checkpointInterval === 0) {
        continue;
      }
    }
    return failures;
  }

  public getCompleted(): number {
    return this.completed;
  }

  public getFailures(): number {
    return this.failures;
  }

  public getSamples(): EnduranceSample[] {
    return [...this.samples];
  }

  public isFinished(): boolean {
    return this.completed >= this.totalCycles;
  }

  public failureRate(): number {
    return this.completed === 0 ? 0 : this.failures * 100 / this.completed;
  }

  public reset(): void {
    this.completed = 0;
    this.failures = 0;
    this.samples = [];
  }
}

// Detects latency and memory degradation across cycles
class DegradationMetric {
  public static latencyGrowth(samples: EnduranceSample[]): number {
    if (samples.length < 2) {
      return 0;
    }
    const first = samples[0].latencyMs;
    const last = samples[samples.length - 1].latencyMs;
    return first <= 0 ? 0 : (last - first) * 100 / first;
  }

  public static memoryGrowth(samples: EnduranceSample[]): number {
    if (samples.length < 2) {
      return 0;
    }
    return samples[samples.length - 1].memoryKb - samples[0].memoryKb;
  }

  public static maxLatency(samples: EnduranceSample[]): number {
    let max: number = 0;
    for (let i = 0; i < samples.length; i++) {
      if (samples[i].latencyMs > max) {
        max = samples[i].latencyMs;
      }
    }
    return max;
  }

  public static averageLatency(samples: EnduranceSample[]): number {
    if (samples.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < samples.length; i++) {
      total += samples[i].latencyMs;
    }
    return total / samples.length;
  }

  public static isMemoryStable(samples: EnduranceSample[], thresholdKb: number): boolean {
    return DegradationMetric.memoryGrowth(samples) <= thresholdKb;
  }

  public static isLatencyStable(samples: EnduranceSample[], thresholdPercent: number): boolean {
    return DegradationMetric.latencyGrowth(samples) <= thresholdPercent;
  }

  public static sample(index: number, latencyMs: number, memoryKb: number, passed: boolean):
    EnduranceSample {
    return {
      cycle: index,
      latencyMs: latencyMs,
      memoryKb: memoryKb,
      passed: passed
    };
  }
}

// Aggregates endurance checks for release gating
class EnduranceReport {
  private checks: string[] = [];
  private failureItems: string[] = [];

  public check(name: string, passed: boolean): void {
    this.checks.push(name);
    if (!passed) {
      this.failureItems.push(name);
    }
  }

  public count(): number {
    return this.checks.length;
  }

  public failures(): string[] {
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

// Simulates page navigation cycles for endurance checks
class CycleSimulator {
  public static navigationFlow(index: number): EnduranceSample {
    const latency = 100 + (index % 5) * 5;
    const memory = 1000 + (index % 3) * 10;
    return DegradationMetric.sample(index, latency, memory, true);
  }

  public static degradingFlow(index: number): EnduranceSample {
    return DegradationMetric.sample(index, 100 + index * 10, 1000 + index * 100, index % 10 !== 0);
  }

  public static failingFlow(index: number): EnduranceSample {
    return DegradationMetric.sample(index, 100, 1000, false);
  }
}

export default function enduranceTestingTest() {
  describe('EnduranceTesting_Test', () => {

    it('runner_should_complete_all_cycles', 0, () => {
      const runner = new EnduranceRunner(DEFAULT_CYCLES, CHECKPOINT_INTERVAL);
      const failures = runner.run((index: number) => CycleSimulator.navigationFlow(index));
      expect(failures).assertEqual(0);
      expect(runner.getCompleted()).assertEqual(DEFAULT_CYCLES);
      expect(runner.isFinished()).assertTrue();
      expect(runner.getSamples().length).assertEqual(DEFAULT_CYCLES);
      expect(runner.failureRate()).assertEqual(0);
    });

    it('runner_should_count_failures', 0, () => {
      const runner = new EnduranceRunner(20, 5);
      const failures = runner.run((index: number) => CycleSimulator.failingFlow(index));
      expect(failures).assertEqual(20);
      expect(runner.getFailures()).assertEqual(20);
      expect(runner.failureRate()).assertEqual(100);
      expect(runner.isFinished()).assertTrue();
    });

    it('runner_should_reset_state', 0, () => {
      const runner = new EnduranceRunner(10, 2);
      runner.run((index: number) => CycleSimulator.navigationFlow(index));
      expect(runner.getCompleted()).assertEqual(10);
      runner.reset();
      expect(runner.getCompleted()).assertEqual(0);
      expect(runner.getFailures()).assertEqual(0);
      expect(runner.getSamples().length).assertEqual(0);
      expect(runner.isFinished()).assertFalse();
      expect(runner.failureRate()).assertEqual(0);
    });

    it('metric_should_compute_latency_growth', 0, () => {
      const samples: EnduranceSample[] = [
        DegradationMetric.sample(0, 100, 1000, true),
        DegradationMetric.sample(1, 110, 1010, true),
        DegradationMetric.sample(2, 130, 1020, true)
      ];
      expect(DegradationMetric.latencyGrowth(samples)).assertEqual(30);
      expect(DegradationMetric.isLatencyStable(samples, MAX_LATENCY_GROWTH)).assertFalse();
      expect(DegradationMetric.isLatencyStable(samples, 30)).assertTrue();
    });

    it('metric_should_handle_single_sample', 0, () => {
      const samples: EnduranceSample[] = [DegradationMetric.sample(0, 100, 1000, true)];
      expect(DegradationMetric.latencyGrowth(samples)).assertEqual(0);
      expect(DegradationMetric.memoryGrowth(samples)).assertEqual(0);
      expect(DegradationMetric.isLatencyStable(samples, 0)).assertTrue();
      expect(DegradationMetric.isMemoryStable(samples, 0)).assertTrue();
      expect(DegradationMetric.latencyGrowth([])).assertEqual(0);
    });

    it('metric_should_compute_memory_growth', 0, () => {
      const samples: EnduranceSample[] = [
        DegradationMetric.sample(0, 100, 1000, true),
        DegradationMetric.sample(1, 100, 1500, true),
        DegradationMetric.sample(2, 100, 2500, true)
      ];
      expect(DegradationMetric.memoryGrowth(samples)).assertEqual(1500);
      expect(DegradationMetric.isMemoryStable(samples, MAX_MEMORY_GROWTH_KB)).assertFalse();
      expect(DegradationMetric.isMemoryStable(samples, 2000)).assertTrue();
    });

    it('metric_should_compute_latency_statistics', 0, () => {
      const samples: EnduranceSample[] = [
        DegradationMetric.sample(0, 100, 1000, true),
        DegradationMetric.sample(1, 200, 1000, true),
        DegradationMetric.sample(2, 300, 1000, true)
      ];
      expect(DegradationMetric.maxLatency(samples)).assertEqual(300);
      expect(DegradationMetric.averageLatency(samples)).assertEqual(200);
      expect(DegradationMetric.averageLatency([])).assertEqual(0);
      expect(DegradationMetric.maxLatency([])).assertEqual(0);
    });

    it('runner_should_accept_degrading_flow', 0, () => {
      const runner = new EnduranceRunner(20, 5);
      const failures = runner.run((index: number) => CycleSimulator.degradingFlow(index));
      const samples = runner.getSamples();
      expect(failures).assertEqual(2);
      expect(runner.failureRate()).assertEqual(10);
      expect(DegradationMetric.latencyGrowth(samples)).assertLarger(MAX_LATENCY_GROWTH);
      expect(DegradationMetric.isMemoryStable(samples, MAX_MEMORY_GROWTH_KB)).assertFalse();
    });

    it('report_should_aggregate_checks', 0, () => {
      const report = new EnduranceReport();
      report.check('failures', true);
      report.check('latency', true);
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      expect(report.summary()).assertEqual('stable');
      report.check('memory', false);
      expect(report.summary()).assertEqual('unstable');
      expect(report.failures()).assertDeepEquals(['memory']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('endurance_flow_should_pass_stable_session', 0, () => {
      const runner = new EnduranceRunner(DEFAULT_CYCLES, CHECKPOINT_INTERVAL);
      const report = new EnduranceReport();
      runner.run((index: number) => CycleSimulator.navigationFlow(index));
      const samples = runner.getSamples();
      report.check('failureRate', runner.failureRate() <= MAX_FAILURE_RATE);
      report.check('latency', DegradationMetric.isLatencyStable(samples, MAX_LATENCY_GROWTH));
      report.check('memory', DegradationMetric.isMemoryStable(samples, MAX_MEMORY_GROWTH_KB));
      expect(report.isPassed()).assertTrue();
      expect(DegradationMetric.memoryGrowth(samples)).assertLessOrEqual(MAX_MEMORY_GROWTH_KB);
      expect(runner.getCompleted()).assertEqual(DEFAULT_CYCLES);
    });

    it('endurance_flow_should_flag_degradation', 0, () => {
      const runner = new EnduranceRunner(20, 5);
      const report = new EnduranceReport();
      runner.run((index: number) => CycleSimulator.degradingFlow(index));
      const samples = runner.getSamples();
      report.check('failureRate', runner.failureRate() <= MAX_FAILURE_RATE);
      report.check('latency', DegradationMetric.isLatencyStable(samples, MAX_LATENCY_GROWTH));
      report.check('memory', DegradationMetric.isMemoryStable(samples, MAX_MEMORY_GROWTH_KB));
      expect(report.isPassed()).assertFalse();
      expect(report.failures().length).assertEqual(3);
      expect(DegradationMetric.maxLatency(samples)).assertEqual(290);
    });

    it('endurance_constants_should_be_stable', 0, () => {
      expect(DEFAULT_CYCLES).assertEqual(50);
      expect(CHECKPOINT_INTERVAL).assertEqual(10);
      expect(MAX_LATENCY_GROWTH).assertEqual(20);
      expect(MAX_MEMORY_GROWTH_KB).assertEqual(1024);
      expect(MAX_FAILURE_RATE).assertEqual(2);
    });
  });
}

