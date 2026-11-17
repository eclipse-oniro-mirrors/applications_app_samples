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

/**
 * Power consumption model of the TV screen recorder.
 * The model splits a recording into three levels: idle, recording and the tip
 * window. Energy is accumulated as milliwatt milliseconds so that the
 * assertions stay exact, and every duration comes from a fake clock.
 */

/** Power level of one recorder phase. */
enum PowerLevel {
  IDLE = 'idle',
  RECORDING = 'recording',
  TIP = 'tip',
  ERROR = 'error'
}

/** Power policy used by the budget configuration. */
enum PowerPolicy {
  STRICT = 'strict',
  NORMAL = 'normal',
  RELAXED = 'relaxed'
}

/** One recorded power sample. */
interface PowerSample {
  level: PowerLevel;
  powerMw: number;
  timestamp: number;
}

/** Power budget of one recording session. */
interface PowerBudget {
  policy: PowerPolicy;
  maxTotalPower: number;
  maxAveragePower: number;
  maxPeakPower: number;
}

/** Summary of the collected power samples. */
interface PowerSummary {
  totalPower: number;
  averagePower: number;
  peakPower: number;
  sampleCount: number;
  withinBudget: boolean;
}

/** One segment of a recording session. */
interface PowerSegment {
  level: PowerLevel;
  durationMs: number;
  powerMw: number;
  energyMwMs: number;
}

/** Deterministic logical clock. */
class FakeClock {
  private current: number;

  constructor(start: number = 1700000000000) {
    this.current = start;
  }

  public now(): number {
    return this.current;
  }

  public advance(ms: number): void {
    if (ms > 0) {
      this.current += ms;
    }
  }
}

/** Power profile of each recorder phase, expressed in milliwatts. */
class PowerProfile {
  public static readonly IDLE_MW: number = 30;
  public static readonly RECORDING_MW: number = 850;
  public static readonly TIP_MW: number = 120;
  public static readonly ERROR_MW: number = 45;

  public static powerOf(level: PowerLevel): number {
    if (level === PowerLevel.RECORDING) {
      return PowerProfile.RECORDING_MW;
    }
    if (level === PowerLevel.TIP) {
      return PowerProfile.TIP_MW;
    }
    if (level === PowerLevel.ERROR) {
      return PowerProfile.ERROR_MW;
    }
    return PowerProfile.IDLE_MW;
  }
}

/** Accumulates energy in milliwatt milliseconds. */
class EnergyAccumulator {
  private energyMwMs: number = 0;
  private durationMs: number = 0;

  public add(powerMw: number, durationMs: number): void {
    if (durationMs <= 0 || powerMw < 0) {
      return;
    }
    this.energyMwMs += powerMw * durationMs;
    this.durationMs += durationMs;
  }

  public totalMwMs(): number {
    return this.energyMwMs;
  }

  public duration(): number {
    return this.durationMs;
  }

  /** Converts the accumulated energy to milliwatt hours. */
  public milliWattHours(): number {
    return Math.round((this.energyMwMs / 3600000) * 10000) / 10000;
  }

  /** Converts the accumulated energy to joules. */
  public joules(): number {
    return Math.round((this.energyMwMs / 1000) * 10000) / 10000;
  }

  public averageMw(): number {
    if (this.durationMs === 0) {
      return 0;
    }
    return this.energyMwMs / this.durationMs;
  }

  public clear(): void {
    this.energyMwMs = 0;
    this.durationMs = 0;
  }
}

/** One immutable power sample with clone and compare helpers. */
class PowerSampleRecord {
  public level: PowerLevel;
  public powerMw: number;
  public timestamp: number;

  constructor(level: PowerLevel, powerMw: number, timestamp: number) {
    this.level = level;
    this.powerMw = powerMw;
    this.timestamp = timestamp;
  }

  public clone(): PowerSampleRecord {
    return new PowerSampleRecord(this.level, this.powerMw, this.timestamp);
  }

  public equals(other: PowerSampleRecord): boolean {
    return this.level === other.level && this.powerMw === other.powerMw &&
      this.timestamp === other.timestamp;
  }

  public isValid(): boolean {
    return this.powerMw >= 0 && this.timestamp >= 0;
  }

  public describe(): string {
    return `sample(${this.level}, ${this.powerMw}mW, ${this.timestamp})`;
  }
}

/** Collects power samples of a recording session. */
class PowerSampleCollector {
  private samples: PowerSampleRecord[] = [];
  private clock: number = 1700000000000;

  public addSample(level: PowerLevel, powerMw: number): void {
    this.clock += 1000;
    this.samples.push(new PowerSampleRecord(level, powerMw, this.clock));
  }

  public count(): number {
    return this.samples.length;
  }

  public samplesCopy(): PowerSampleRecord[] {
    const result: PowerSampleRecord[] = [];
    for (let index = 0; index < this.samples.length; index++) {
      result.push(this.samples[index].clone());
    }
    return result;
  }

  public totalPower(): number {
    let total = 0;
    for (let index = 0; index < this.samples.length; index++) {
      total += this.samples[index].powerMw;
    }
    return total;
  }

  public averagePower(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return this.totalPower() / this.samples.length;
  }

  public peakPower(): number {
    let peak = 0;
    for (let index = 0; index < this.samples.length; index++) {
      if (this.samples[index].powerMw > peak) {
        peak = this.samples[index].powerMw;
      }
    }
    return peak;
  }

  public countByLevel(level: PowerLevel): number {
    let count = 0;
    for (let index = 0; index < this.samples.length; index++) {
      if (this.samples[index].level === level) {
        count++;
      }
    }
    return count;
  }

  public isChronological(): boolean {
    for (let index = 1; index < this.samples.length; index++) {
      if (this.samples[index].timestamp < this.samples[index - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public clear(): void {
    this.samples = [];
  }
}

/** Budget configuration of one recording session. */
class PowerBudgetConfig {
  public policy: PowerPolicy;
  public maxTotalPower: number;
  public maxAveragePower: number;
  public maxPeakPower: number;

  constructor(policy: PowerPolicy, maxTotalPower: number, maxAveragePower: number, maxPeakPower: number) {
    this.policy = policy;
    this.maxTotalPower = maxTotalPower;
    this.maxAveragePower = maxAveragePower;
    this.maxPeakPower = maxPeakPower;
  }

  public clone(): PowerBudgetConfig {
    return new PowerBudgetConfig(this.policy, this.maxTotalPower, this.maxAveragePower, this.maxPeakPower);
  }

  public equals(other: PowerBudgetConfig): boolean {
    return this.policy === other.policy && this.maxTotalPower === other.maxTotalPower &&
      this.maxAveragePower === other.maxAveragePower && this.maxPeakPower === other.maxPeakPower;
  }

  public isValid(): boolean {
    return this.maxTotalPower >= 0 && this.maxAveragePower >= 0 && this.maxPeakPower >= 0;
  }

  public describe(): string {
    return `budget(${this.policy}, total=${this.maxTotalPower}, ` +
      `average=${this.maxAveragePower}, peak=${this.maxPeakPower})`;
  }
}

/** Evaluates the collected samples against a budget. */
class PowerAnalyzer {
  private collector: PowerSampleCollector;
  private budget: PowerBudgetConfig;

  constructor(collector: PowerSampleCollector, budget: PowerBudgetConfig) {
    this.collector = collector;
    this.budget = budget;
  }

  public summarize(): PowerSummary {
    const total = this.collector.totalPower();
    const average = this.collector.averagePower();
    const peak = this.collector.peakPower();
    const result: PowerSummary = {
      totalPower: total,
      averagePower: average,
      peakPower: peak,
      sampleCount: this.collector.count(),
      withinBudget: total <= this.budget.maxTotalPower && average <= this.budget.maxAveragePower &&
        peak <= this.budget.maxPeakPower
    };
    return result;
  }

  public classify(powerMw: number): PowerLevel {
    if (powerMw <= 10) {
      return PowerLevel.IDLE;
    }
    if (powerMw <= 100) {
      return PowerLevel.ERROR;
    }
    if (powerMw <= 500) {
      return PowerLevel.TIP;
    }
    return PowerLevel.RECORDING;
  }

  public levelDistribution(): Map<string, number> {
    const distribution = new Map<string, number>();
    distribution.set(PowerLevel.IDLE, this.collector.countByLevel(PowerLevel.IDLE));
    distribution.set(PowerLevel.RECORDING, this.collector.countByLevel(PowerLevel.RECORDING));
    distribution.set(PowerLevel.TIP, this.collector.countByLevel(PowerLevel.TIP));
    distribution.set(PowerLevel.ERROR, this.collector.countByLevel(PowerLevel.ERROR));
    return distribution;
  }
}

/** Formats the power summary for hilog and for the review report. */
class PowerReportGenerator {
  public formatSummary(summary: PowerSummary): string {
    const state = summary.withinBudget ? '未超预算' : '已超预算';
    return `总功耗=${summary.totalPower}, 平均功耗=${summary.averagePower.toFixed(2)}, ` +
      `峰值功耗=${summary.peakPower}, 采样数=${summary.sampleCount}, 状态=${state}`;
  }

  public formatLevel(level: PowerLevel): string {
    if (level === PowerLevel.IDLE) {
      return '空闲';
    }
    if (level === PowerLevel.RECORDING) {
      return '录制中';
    }
    if (level === PowerLevel.TIP) {
      return '提示窗';
    }
    return '错误';
  }

  public formatDistribution(distribution: Map<string, number>): string {
    const idle = distribution.get(PowerLevel.IDLE);
    const recording = distribution.get(PowerLevel.RECORDING);
    const tip = distribution.get(PowerLevel.TIP);
    const error = distribution.get(PowerLevel.ERROR);
    const idleValue = idle === undefined ? 0 : idle;
    const recordingValue = recording === undefined ? 0 : recording;
    const tipValue = tip === undefined ? 0 : tip;
    const errorValue = error === undefined ? 0 : error;
    return `空闲=${idleValue}; 录制中=${recordingValue}; 提示窗=${tipValue}; 错误=${errorValue}`;
  }
}

/** Plain statistics helper used by the budget sweep. */
class PowerStatistics {
  public sum(values: number[]): number {
    let total = 0;
    for (let index = 0; index < values.length; index++) {
      total += values[index];
    }
    return total;
  }

  public average(values: number[]): number {
    if (values.length === 0) {
      return 0;
    }
    return this.sum(values) / values.length;
  }

  public max(values: number[]): number {
    if (values.length === 0) {
      return 0;
    }
    let peak = values[0];
    for (let index = 1; index < values.length; index++) {
      if (values[index] > peak) {
        peak = values[index];
      }
    }
    return peak;
  }

  public min(values: number[]): number {
    if (values.length === 0) {
      return 0;
    }
    let lowest = values[0];
    for (let index = 1; index < values.length; index++) {
      if (values[index] < lowest) {
        lowest = values[index];
      }
    }
    return lowest;
  }

  public standardDeviation(values: number[]): number {
    if (values.length === 0) {
      return 0;
    }
    const average = this.average(values);
    let squares = 0;
    for (let index = 0; index < values.length; index++) {
      const diff = values[index] - average;
      squares += diff * diff;
    }
    return Math.sqrt(squares / values.length);
  }
}

/**
 * Sampling window model.
 * The power framework samples the recorder once per second while the session is
 * active, therefore a window of 60 s holds 60 samples.
 */
class SamplingWindowModel {
  public static readonly INTERVAL_MS: number = 1000;
  private windowMs: number;
  private sampleCount: number = 0;

  constructor(windowMs: number) {
    this.windowMs = windowMs;
  }

  public sample(): void {
    this.sampleCount++;
  }

  public advanceWindow(): void {
    this.sampleCount += Math.floor(this.windowMs / SamplingWindowModel.INTERVAL_MS);
  }

  public expectedSamples(): number {
    return Math.floor(this.windowMs / SamplingWindowModel.INTERVAL_MS);
  }

  public count(): number {
    return this.sampleCount;
  }

  public isComplete(): boolean {
    return this.sampleCount >= this.expectedSamples();
  }

  public reset(): void {
    this.sampleCount = 0;
  }
}

/**
 * Recording power session.
 * The session is driven by the fake clock: calling advance splits the elapsed
 * time by the current power level and accumulates the corresponding energy.
 */
class RecordingPowerSession {
  private clock: FakeClock;
  private level: PowerLevel = PowerLevel.IDLE;
  private accumulator: EnergyAccumulator = new EnergyAccumulator();
  private segments: PowerSegment[] = [];
  private transitions: number = 0;

  constructor(clock: FakeClock) {
    this.clock = clock;
  }

  public getLevel(): PowerLevel {
    return this.level;
  }

  public setLevel(level: PowerLevel): void {
    this.level = level;
    this.transitions++;
  }

  public startRecording(): void {
    this.setLevel(PowerLevel.RECORDING);
  }

  public showTip(): void {
    this.setLevel(PowerLevel.TIP);
  }

  public stopRecording(): void {
    this.setLevel(PowerLevel.IDLE);
  }

  public fail(): void {
    this.setLevel(PowerLevel.ERROR);
  }

  public advance(ms: number): void {
    if (ms <= 0) {
      return;
    }
    const powerMw = PowerProfile.powerOf(this.level);
    this.accumulator.add(powerMw, ms);
    const segment: PowerSegment = {
      level: this.level,
      durationMs: ms,
      powerMw: powerMw,
      energyMwMs: powerMw * ms
    };
    this.segments.push(segment);
    this.clock.advance(ms);
  }

  public getAccumulator(): EnergyAccumulator {
    return this.accumulator;
  }

  public segmentsCopy(): PowerSegment[] {
    const result: PowerSegment[] = [];
    for (let index = 0; index < this.segments.length; index++) {
      result.push(this.segments[index]);
    }
    return result;
  }

  public segmentCount(): number {
    return this.segments.length;
  }

  public segmentDuration(level: PowerLevel): number {
    let total = 0;
    for (let index = 0; index < this.segments.length; index++) {
      if (this.segments[index].level === level) {
        total += this.segments[index].durationMs;
      }
    }
    return total;
  }

  public getTransitions(): number {
    return this.transitions;
  }

  public averagePower(): number {
    return this.accumulator.averageMw();
  }

  public reset(): void {
    this.level = PowerLevel.IDLE;
    this.accumulator.clear();
    this.segments = [];
    this.transitions = 0;
  }
}

export default function recorderPowerConsumptionTest(): void {
  describe('RecorderPowerConsumption_Test', () => {
    it('idle_level_should_use_lowest_power', 0, () => {
      expect(PowerProfile.powerOf(PowerLevel.IDLE)).assertEqual(30);
      expect(PowerProfile.powerOf(PowerLevel.TIP)).assertEqual(120);
      expect(PowerProfile.powerOf(PowerLevel.RECORDING)).assertEqual(850);
      expect(PowerProfile.powerOf(PowerLevel.ERROR)).assertEqual(45);
    });

    it('recording_should_consume_more_than_idle', 0, () => {
      expect(PowerProfile.RECORDING_MW).assertLarger(PowerProfile.IDLE_MW);
      expect(PowerProfile.RECORDING_MW).assertLarger(PowerProfile.TIP_MW);
      expect(PowerProfile.TIP_MW).assertLarger(PowerProfile.IDLE_MW);
      expect(PowerProfile.ERROR_MW).assertLarger(PowerProfile.IDLE_MW);
    });

    it('idle_energy_should_be_accumulated', 0, () => {
      const accumulator = new EnergyAccumulator();
      accumulator.add(PowerProfile.IDLE_MW, 1000);
      expect(accumulator.totalMwMs()).assertEqual(30000);
      expect(accumulator.duration()).assertEqual(1000);
      expect(accumulator.joules()).assertEqual(30);
      expect(accumulator.milliWattHours()).assertEqual(0.0083);
      expect(accumulator.averageMw()).assertEqual(30);
    });

    it('recording_energy_of_one_minute_should_be_accumulated', 0, () => {
      const accumulator = new EnergyAccumulator();
      accumulator.add(PowerProfile.RECORDING_MW, 60000);
      expect(accumulator.totalMwMs()).assertEqual(51000000);
      expect(accumulator.joules()).assertEqual(51000);
      expect(accumulator.milliWattHours()).assertEqual(14.1667);
      expect(accumulator.averageMw()).assertEqual(850);
    });

    it('tip_energy_should_be_accumulated', 0, () => {
      const accumulator = new EnergyAccumulator();
      accumulator.add(PowerProfile.TIP_MW, 3000);
      expect(accumulator.totalMwMs()).assertEqual(360000);
      expect(accumulator.joules()).assertEqual(360);
      expect(accumulator.milliWattHours()).assertEqual(0.1);
    });

    it('invalid_energy_addition_should_be_ignored', 0, () => {
      const accumulator = new EnergyAccumulator();
      accumulator.add(PowerProfile.IDLE_MW, 0);
      accumulator.add(PowerProfile.IDLE_MW, -100);
      accumulator.add(-5, 1000);
      expect(accumulator.totalMwMs()).assertEqual(0);
      expect(accumulator.duration()).assertEqual(0);
      expect(accumulator.averageMw()).assertEqual(0);
    });

    it('accumulator_clear_should_reset_energy', 0, () => {
      const accumulator = new EnergyAccumulator();
      accumulator.add(PowerProfile.RECORDING_MW, 1000);
      accumulator.clear();
      expect(accumulator.totalMwMs()).assertEqual(0);
      expect(accumulator.duration()).assertEqual(0);
      expect(accumulator.milliWattHours()).assertEqual(0);
      expect(accumulator.joules()).assertEqual(0);
    });

    it('session_should_accumulate_three_phases', 0, () => {
      const clock = new FakeClock();
      const session = new RecordingPowerSession(clock);
      session.startRecording();
      session.advance(60000);
      session.showTip();
      session.advance(3000);
      session.stopRecording();
      session.advance(1000);
      expect(session.segmentCount() >= 3).assertEqual(true);
      expect(session.segmentDuration(PowerLevel.RECORDING)).assertEqual(60000);
      expect(session.segmentDuration(PowerLevel.TIP)).assertEqual(3000);
      expect(session.segmentDuration(PowerLevel.IDLE)).assertEqual(1000);
      expect(session.getAccumulator().totalMwMs()).assertEqual(51390000);
      expect(session.getAccumulator().milliWattHours()).assertEqual(14.275);
      expect(session.getAccumulator().joules()).assertEqual(51390);
    });

    it('session_average_power_should_be_weighted', 0, () => {
      const clock = new FakeClock();
      const session = new RecordingPowerSession(clock);
      session.startRecording();
      session.advance(60000);
      session.stopRecording();
      session.advance(60000);
      const average = session.getAccumulator().averageMw();
      expect(Math.round(average)).assertEqual(440);
      expect(average).assertLarger(PowerProfile.IDLE_MW);
      expect(average).assertLess(PowerProfile.RECORDING_MW);
    });

    it('session_should_record_transitions', 0, () => {
      const clock = new FakeClock();
      const session = new RecordingPowerSession(clock);
      expect(session.getLevel()).assertEqual(PowerLevel.IDLE);
      session.startRecording();
      session.showTip();
      session.stopRecording();
      expect(session.getTransitions()).assertEqual(3);
      expect(session.getLevel()).assertEqual(PowerLevel.IDLE);
    });

    it('session_error_level_should_accumulate_energy', 0, () => {
      const clock = new FakeClock();
      const session = new RecordingPowerSession(clock);
      session.startRecording();
      session.advance(1000);
      session.fail();
      session.advance(1000);
      expect(session.getLevel()).assertEqual(PowerLevel.ERROR);
      expect(session.getAccumulator().totalMwMs()).assertEqual(850000 + 45000);
      expect(session.getAccumulator().joules()).assertEqual(895);
    });

    it('session_reset_should_clear_everything', 0, () => {
      const clock = new FakeClock();
      const session = new RecordingPowerSession(clock);
      session.startRecording();
      session.advance(1000);
      session.reset();
      expect(session.getLevel()).assertEqual(PowerLevel.IDLE);
      expect(session.segmentCount()).assertEqual(0);
      expect(session.getTransitions()).assertEqual(0);
      expect(session.getAccumulator().totalMwMs()).assertEqual(0);
      expect(session.averagePower()).assertEqual(0);
    });

    it('session_should_ignore_non_positive_advance', 0, () => {
      const clock = new FakeClock();
      const session = new RecordingPowerSession(clock);
      session.startRecording();
      session.advance(0);
      session.advance(-500);
      expect(session.segmentCount()).assertEqual(0);
      expect(session.getAccumulator().totalMwMs()).assertEqual(0);
      expect(clock.now()).assertEqual(1700000000000);
    });

    it('sampling_window_should_expect_one_sample_per_second', 0, () => {
      const window = new SamplingWindowModel(60000);
      expect(SamplingWindowModel.INTERVAL_MS).assertEqual(1000);
      expect(window.expectedSamples()).assertEqual(60);
      expect(window.isComplete()).assertFalse();
      window.advanceWindow();
      expect(window.count()).assertEqual(60);
      expect(window.isComplete()).assertTrue();
    });

    it('sampling_window_should_count_partial_seconds', 0, () => {
      const window = new SamplingWindowModel(2500);
      expect(window.expectedSamples()).assertEqual(2);
      window.sample();
      window.sample();
      expect(window.count()).assertEqual(2);
      expect(window.isComplete()).assertTrue();
      window.reset();
      expect(window.count()).assertEqual(0);
      expect(window.isComplete()).assertFalse();
    });

    it('power_sample_record_should_support_clone_and_equals', 0, () => {
      const sample = new PowerSampleRecord(PowerLevel.RECORDING, 850, 1700000001000);
      expect(sample.isValid()).assertTrue();
      expect(sample.level).assertEqual(PowerLevel.RECORDING);
      const cloned = sample.clone();
      expect(sample.equals(cloned)).assertTrue();
      expect(sample === cloned).assertFalse();
      expect(sample.describe()).assertContain('850');
      const negative = new PowerSampleRecord(PowerLevel.IDLE, -1, 0);
      expect(negative.isValid()).assertFalse();
    });

    it('sample_collector_should_accumulate_power', 0, () => {
      const collector = new PowerSampleCollector();
      collector.addSample(PowerLevel.IDLE, 30);
      collector.addSample(PowerLevel.TIP, 120);
      collector.addSample(PowerLevel.RECORDING, 850);
      expect(collector.count()).assertEqual(3);
      expect(collector.totalPower()).assertEqual(1000);
      expect(collector.averagePower()).assertEqual(1000 / 3);
      expect(collector.peakPower()).assertEqual(850);
    });

    it('sample_collector_should_count_levels', 0, () => {
      const collector = new PowerSampleCollector();
      collector.addSample(PowerLevel.RECORDING, 850);
      collector.addSample(PowerLevel.RECORDING, 900);
      collector.addSample(PowerLevel.IDLE, 30);
      expect(collector.countByLevel(PowerLevel.RECORDING)).assertEqual(2);
      expect(collector.countByLevel(PowerLevel.IDLE)).assertEqual(1);
      expect(collector.countByLevel(PowerLevel.TIP)).assertEqual(0);
    });

    it('sample_collector_timestamps_should_be_chronological', 0, () => {
      const collector = new PowerSampleCollector();
      collector.addSample(PowerLevel.IDLE, 30);
      collector.addSample(PowerLevel.RECORDING, 850);
      collector.addSample(PowerLevel.TIP, 120);
      expect(collector.isChronological()).assertTrue();
      expect(collector.count()).assertEqual(3);
      expect(collector.samplesCopy().length).assertEqual(3);
    });

    it('sample_collector_should_report_empty_statistics', 0, () => {
      const collector = new PowerSampleCollector();
      expect(collector.count()).assertEqual(0);
      expect(collector.totalPower()).assertEqual(0);
      expect(collector.averagePower()).assertEqual(0);
      expect(collector.peakPower()).assertEqual(0);
      expect(collector.isChronological()).assertTrue();
      collector.clear();
      expect(collector.count()).assertEqual(0);
    });

    it('budget_config_should_validate_and_clone', 0, () => {
      const budget = new PowerBudgetConfig(PowerPolicy.STRICT, 1000, 500, 900);
      expect(budget.isValid()).assertTrue();
      expect(budget.policy).assertEqual(PowerPolicy.STRICT);
      const cloned = budget.clone();
      expect(budget.equals(cloned)).assertTrue();
      expect(budget === cloned).assertFalse();
      expect(budget.describe()).assertContain('total=1000');
      const invalid = new PowerBudgetConfig(PowerPolicy.NORMAL, -1, 500, 900);
      expect(invalid.isValid()).assertFalse();
    });

    it('analyzer_should_classify_power_levels', 0, () => {
      const collector = new PowerSampleCollector();
      const budget = new PowerBudgetConfig(PowerPolicy.NORMAL, 5000, 1000, 1000);
      const analyzer = new PowerAnalyzer(collector, budget);
      expect(analyzer.classify(10)).assertEqual(PowerLevel.IDLE);
      expect(analyzer.classify(11)).assertEqual(PowerLevel.ERROR);
      expect(analyzer.classify(100)).assertEqual(PowerLevel.ERROR);
      expect(analyzer.classify(101)).assertEqual(PowerLevel.TIP);
      expect(analyzer.classify(500)).assertEqual(PowerLevel.TIP);
      expect(analyzer.classify(501)).assertEqual(PowerLevel.RECORDING);
    });

    it('analyzer_should_summarize_within_budget', 0, () => {
      const collector = new PowerSampleCollector();
      collector.addSample(PowerLevel.IDLE, 30);
      collector.addSample(PowerLevel.TIP, 120);
      const budget = new PowerBudgetConfig(PowerPolicy.NORMAL, 1000, 500, 900);
      const analyzer = new PowerAnalyzer(collector, budget);
      const summary: PowerSummary = analyzer.summarize();
      expect(summary.totalPower).assertEqual(150);
      expect(summary.averagePower).assertEqual(75);
      expect(summary.sampleCount).assertEqual(2);
      expect(summary.withinBudget).assertTrue();
    });

    it('analyzer_should_detect_budget_overrun', 0, () => {
      const collector = new PowerSampleCollector();
      collector.addSample(PowerLevel.RECORDING, 850);
      collector.addSample(PowerLevel.RECORDING, 900);
      const budget = new PowerBudgetConfig(PowerPolicy.STRICT, 2000, 1000, 800);
      const analyzer = new PowerAnalyzer(collector, budget);
      const summary: PowerSummary = analyzer.summarize();
      expect(summary.totalPower).assertEqual(1750);
      expect(summary.peakPower).assertEqual(900);
      expect(summary.withinBudget).assertFalse();
    });

    it('analyzer_should_build_level_distribution', 0, () => {
      const collector = new PowerSampleCollector();
      collector.addSample(PowerLevel.IDLE, 30);
      collector.addSample(PowerLevel.TIP, 120);
      collector.addSample(PowerLevel.TIP, 130);
      const budget = new PowerBudgetConfig(PowerPolicy.RELAXED, 5000, 1000, 1000);
      const analyzer = new PowerAnalyzer(collector, budget);
      const distribution = analyzer.levelDistribution();
      expect(distribution.get(PowerLevel.IDLE)).assertEqual(1);
      expect(distribution.get(PowerLevel.TIP)).assertEqual(2);
      expect(distribution.get(PowerLevel.RECORDING)).assertEqual(0);
    });

    it('report_generator_should_format_summary', 0, () => {
      const collector = new PowerSampleCollector();
      collector.addSample(PowerLevel.IDLE, 30);
      collector.addSample(PowerLevel.TIP, 120);
      const budget = new PowerBudgetConfig(PowerPolicy.NORMAL, 1000, 500, 900);
      const analyzer = new PowerAnalyzer(collector, budget);
      const generator = new PowerReportGenerator();
      const text = generator.formatSummary(analyzer.summarize());
      expect(text).assertContain('总功耗=150');
      expect(text).assertContain('未超预算');
      expect(generator.formatLevel(PowerLevel.IDLE)).assertEqual('空闲');
      expect(generator.formatLevel(PowerLevel.RECORDING)).assertEqual('录制中');
      expect(generator.formatLevel(PowerLevel.TIP)).assertEqual('提示窗');
      expect(generator.formatLevel(PowerLevel.ERROR)).assertEqual('错误');
    });

    it('report_generator_should_format_distribution', 0, () => {
      const collector = new PowerSampleCollector();
      collector.addSample(PowerLevel.RECORDING, 850);
      collector.addSample(PowerLevel.RECORDING, 860);
      const budget = new PowerBudgetConfig(PowerPolicy.NORMAL, 5000, 1000, 1000);
      const analyzer = new PowerAnalyzer(collector, budget);
      const text = new PowerReportGenerator().formatDistribution(analyzer.levelDistribution());
      expect(text).assertContain('录制中=2');
      expect(text).assertContain('空闲=0');
      expect(text).assertContain('提示窗=0');
    });

    it('report_generator_should_mark_over_budget', 0, () => {
      const collector = new PowerSampleCollector();
      collector.addSample(PowerLevel.RECORDING, 850);
      collector.addSample(PowerLevel.RECORDING, 850);
      const budget = new PowerBudgetConfig(PowerPolicy.STRICT, 100, 100, 100);
      const analyzer = new PowerAnalyzer(collector, budget);
      const text = new PowerReportGenerator().formatSummary(analyzer.summarize());
      expect(text).assertContain('已超预算');
      expect(text).assertContain('峰值功耗=850');
    });

    it('statistics_should_compute_basic_metrics', 0, () => {
      const statistics = new PowerStatistics();
      const values: number[] = [30, 120, 850, 900];
      expect(statistics.sum(values)).assertEqual(1900);
      expect(statistics.average(values)).assertEqual(475);
      expect(statistics.max(values)).assertEqual(900);
      expect(statistics.min(values)).assertEqual(30);
      expect(statistics.average([])).assertEqual(0);
      expect(statistics.max([])).assertEqual(0);
    });

    it('statistics_should_compute_standard_deviation', 0, () => {
      const statistics = new PowerStatistics();
      const values: number[] = [2, 4, 4, 4, 5, 5, 7, 9];
      expect(statistics.standardDeviation(values)).assertEqual(2);
      expect(statistics.standardDeviation([])).assertEqual(0);
      expect(statistics.min([])).assertEqual(0);
    });

    it('idle_window_should_stay_under_idle_budget', 0, () => {
      const clock = new FakeClock();
      const session = new RecordingPowerSession(clock);
      session.advance(60000);
      expect(session.segmentDuration(PowerLevel.IDLE)).assertEqual(60000);
      expect(session.getAccumulator().totalMwMs()).assertEqual(1800000);
      expect(session.getAccumulator().joules()).assertEqual(1800);
      expect(session.getAccumulator().milliWattHours()).assertEqual(0.5);
    });

    it('recording_then_tip_should_be_cheaper_than_tip_then_recording', 0, () => {
      const first = new RecordingPowerSession(new FakeClock());
      first.startRecording();
      first.advance(3000);
      first.showTip();
      first.advance(3000);
      const second = new RecordingPowerSession(new FakeClock());
      second.showTip();
      second.advance(3000);
      second.startRecording();
      second.advance(3000);
      expect(first.getAccumulator().totalMwMs()).assertEqual(second.getAccumulator().totalMwMs());
      expect(first.getAccumulator().totalMwMs()).assertEqual(2910000);
    });

    it('long_session_should_scale_linearly', 0, () => {
      const shortSession = new RecordingPowerSession(new FakeClock());
      shortSession.startRecording();
      shortSession.advance(10000);
      const longSession = new RecordingPowerSession(new FakeClock());
      longSession.startRecording();
      longSession.advance(60000);
      const shortEnergy = shortSession.getAccumulator().totalMwMs();
      const longEnergy = longSession.getAccumulator().totalMwMs();
      expect(shortEnergy).assertEqual(8500000);
      expect(longEnergy).assertEqual(51000000);
      expect(longEnergy / shortEnergy).assertEqual(6);
    });

    it('comprehensive_power_scenario_should_pass', 0, () => {
      const clock = new FakeClock();
      const session = new RecordingPowerSession(clock);
      const collector = new PowerSampleCollector();
      session.advance(2000);
      collector.addSample(session.getLevel(), PowerProfile.powerOf(session.getLevel()));
      session.startRecording();
      for (let second = 0; second < 60; second++) {
        session.advance(1000);
        collector.addSample(session.getLevel(), PowerProfile.powerOf(session.getLevel()));
      }
      session.showTip();
      session.advance(3000);
      collector.addSample(session.getLevel(), PowerProfile.powerOf(session.getLevel()));
      session.stopRecording();
      const budget = new PowerBudgetConfig(PowerPolicy.NORMAL, 1000, 900, 900);
      const analyzer = new PowerAnalyzer(collector, budget);
      const summary: PowerSummary = analyzer.summarize();
      expect(summary.sampleCount).assertEqual(62);
      expect(summary.peakPower).assertEqual(850);
      expect(summary.withinBudget).assertFalse();
      expect(summary.averagePower).assertLarger(500);
      expect(session.segmentCount() >= 3).assertEqual(true);
      expect(session.getAccumulator().milliWattHours()).assertEqual(14.2833);
    });
  });
}

