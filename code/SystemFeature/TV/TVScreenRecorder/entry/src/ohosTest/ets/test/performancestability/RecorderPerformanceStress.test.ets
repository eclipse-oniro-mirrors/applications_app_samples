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
 * Stress model of the TV screen recorder.
 * The suite drives repeated start / stop cycles, state callback storms, window
 * churn and a sustained 60 s run. Nothing sleeps: every duration is advanced on
 * a logical clock so that the stress result is reproducible.
 */

/** Recording state of the sample application. */
enum RecordingState {
  IDLE = 0,
  RECORDING = 1,
  STOPPED = 2,
  ERROR = 3
}

/** Operation category tracked by the stress collector. */
enum StressCategory {
  START = 'start',
  STOP = 'stop',
  CALLBACK = 'callback',
  WINDOW = 'window',
  RECOVERY = 'recovery'
}

/** One stress sample. */
interface StressSample {
  category: StressCategory;
  durationMs: number;
  timestamp: number;
}

/** Threshold entry of one stress metric. */
interface StressThreshold {
  metricName: string;
  maxAverageMs: number;
  maxPeakMs: number;
}

/** Result of one benchmark round. */
interface StressBenchmark {
  category: StressCategory;
  operations: number;
  averageMs: number;
  peakMs: number;
  passed: boolean;
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

/** Repeats start and stop cycles on one recorder session. */
class StartStopCycleModel {
  private clock: FakeClock;
  private state: RecordingState = RecordingState.IDLE;
  private startCount: number = 0;
  private stopCount: number = 0;
  private rejectedStarts: number = 0;
  private rejectedStops: number = 0;
  private lastCycleDuration: number = 0;

  constructor(clock: FakeClock) {
    this.clock = clock;
  }

  public start(): boolean {
    if (this.state !== RecordingState.IDLE && this.state !== RecordingState.STOPPED) {
      this.rejectedStarts++;
      return false;
    }
    this.startCount++;
    this.lastCycleDuration = this.clock.now();
    this.state = RecordingState.RECORDING;
    return true;
  }

  public stop(): boolean {
    if (this.state !== RecordingState.RECORDING) {
      this.rejectedStops++;
      return false;
    }
    this.stopCount++;
    this.state = RecordingState.STOPPED;
    return true;
  }

  public getState(): RecordingState {
    return this.state;
  }

  public getStartCount(): number {
    return this.startCount;
  }

  public getStopCount(): number {
    return this.stopCount;
  }

  public getRejectedStarts(): number {
    return this.rejectedStarts;
  }

  public getRejectedStops(): number {
    return this.rejectedStops;
  }

  public isBalanced(): boolean {
    return this.startCount === this.stopCount;
  }

  public getLastCycleDuration(): number {
    return this.lastCycleDuration;
  }
}

/** Collects stress samples and aggregates them per category. */
class StressSampleCollector {
  private samples: StressSample[] = [];
  private clock: FakeClock;

  constructor(clock: FakeClock) {
    this.clock = clock;
  }

  public add(category: StressCategory, durationMs: number): void {
    const sample: StressSample = {
      category: category,
      durationMs: durationMs,
      timestamp: this.clock.now()
    };
    this.samples.push(sample);
  }

  public count(): number {
    return this.samples.length;
  }

  public samplesCopy(): StressSample[] {
    const result: StressSample[] = [];
    for (let index = 0; index < this.samples.length; index++) {
      result.push(this.samples[index]);
    }
    return result;
  }

  public countOf(category: StressCategory): number {
    let count = 0;
    for (let index = 0; index < this.samples.length; index++) {
      if (this.samples[index].category === category) {
        count++;
      }
    }
    return count;
  }

  public averageOf(category: StressCategory): number {
    let sum = 0;
    let count = 0;
    for (let index = 0; index < this.samples.length; index++) {
      if (this.samples[index].category === category) {
        sum += this.samples[index].durationMs;
        count++;
      }
    }
    return count === 0 ? 0 : sum / count;
  }

  public peakOf(category: StressCategory): number {
    let peak = 0;
    for (let index = 0; index < this.samples.length; index++) {
      if (this.samples[index].category === category && this.samples[index].durationMs > peak) {
        peak = this.samples[index].durationMs;
      }
    }
    return peak;
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

/** Counts a state callback storm without any asynchronous work. */
class CallbackStormModel {
  private delivered: number = 0;
  private dropped: number = 0;
  private readonly capacity: number;

  constructor(capacity: number = 1000) {
    this.capacity = capacity;
  }

  public emit(count: number): void {
    for (let index = 0; index < count; index++) {
      if (this.delivered < this.capacity) {
        this.delivered++;
      } else {
        this.dropped++;
      }
    }
  }

  public getDelivered(): number {
    return this.delivered;
  }

  public getDropped(): number {
    return this.dropped;
  }

  public getCapacity(): number {
    return this.capacity;
  }

  public isSaturated(): boolean {
    return this.delivered >= this.capacity;
  }

  public reset(): void {
    this.delivered = 0;
    this.dropped = 0;
  }
}

/** Window churn model of the timer and tip floating windows. */
class WindowChurnModel {
  private live: string[] = [];
  private created: number = 0;
  private released: number = 0;

  public create(windowName: string): boolean {
    if (this.live.includes(windowName)) {
      return false;
    }
    this.live.push(windowName);
    this.created++;
    return true;
  }

  public release(windowName: string): boolean {
    const index = this.live.indexOf(windowName);
    if (index < 0) {
      return false;
    }
    this.live.splice(index, 1);
    this.released++;
    return true;
  }

  public releaseAll(): number {
    const count = this.live.length;
    this.live = [];
    this.released += count;
    return count;
  }

  public liveCount(): number {
    return this.live.length;
  }

  public isLive(windowName: string): boolean {
    return this.live.includes(windowName);
  }

  public getCreated(): number {
    return this.created;
  }

  public getReleased(): number {
    return this.released;
  }

  public isBalanced(): boolean {
    return this.created === this.released && this.live.length === 0;
  }
}

/** Threshold registry of the stress metrics. */
class StressThresholdRegistry {
  private thresholds: Map<string, StressThreshold> = new Map<string, StressThreshold>();

  constructor() {
    const start: StressThreshold = { metricName: 'start_recording', maxAverageMs: 800, maxPeakMs: 2000 };
    const stop: StressThreshold = { metricName: 'stop_recording', maxAverageMs: 1200, maxPeakMs: 3000 };
    const callback: StressThreshold = { metricName: 'state_callback', maxAverageMs: 20, maxPeakMs: 80 };
    const window: StressThreshold = { metricName: 'window_churn', maxAverageMs: 50, maxPeakMs: 200 };
    this.thresholds.set(start.metricName, start);
    this.thresholds.set(stop.metricName, stop);
    this.thresholds.set(callback.metricName, callback);
    this.thresholds.set(window.metricName, window);
  }

  public register(threshold: StressThreshold): void {
    this.thresholds.set(threshold.metricName, threshold);
  }

  public get(metricName: string): StressThreshold | null {
    const value: StressThreshold | undefined = this.thresholds.get(metricName);
    return value === undefined ? null : value;
  }

  public count(): number {
    return this.thresholds.size;
  }

  public contains(metricName: string): boolean {
    return this.thresholds.has(metricName);
  }

  public unregister(metricName: string): void {
    this.thresholds.delete(metricName);
  }
}

/** Evaluates a category against the registered threshold. */
class StressAnalyzer {
  private registry: StressThresholdRegistry;
  private collector: StressSampleCollector;

  constructor(registry: StressThresholdRegistry, collector: StressSampleCollector) {
    this.registry = registry;
    this.collector = collector;
  }

  public analyze(metricName: string, category: StressCategory): StressBenchmark {
    const average = this.collector.averageOf(category);
    const peak = this.collector.peakOf(category);
    const threshold = this.registry.get(metricName);
    const passed = threshold === null ? true :
      (average <= threshold.maxAverageMs && peak <= threshold.maxPeakMs);
    const result: StressBenchmark = {
      category: category,
      operations: this.collector.countOf(category),
      averageMs: average,
      peakMs: peak,
      passed: passed
    };
    return result;
  }

  public grade(averageMs: number, peakMs: number): string {
    if (averageMs <= 100 && peakMs <= 200) {
      return 'excellent';
    }
    if (averageMs <= 500 && peakMs <= 1000) {
      return 'good';
    }
    if (averageMs <= 1000 && peakMs <= 2000) {
      return 'acceptable';
    }
    return 'poor';
  }

  public describeGrade(grade: string): string {
    if (grade === 'excellent') {
      return '优秀';
    }
    if (grade === 'good') {
      return '良好';
    }
    if (grade === 'acceptable') {
      return '可接受';
    }
    return '较差';
  }
}

/**
 * Sustained run model.
 * The model simulates a 60 s recording by advancing the clock in fixed steps
 * and counts the timer refreshes and the icon blink transitions.
 */
class SustainedRunModel {
  public static readonly RUN_MS: number = 60000;
  public static readonly STEP_MS: number = 100;
  private clock: FakeClock;
  private state: RecordingState = RecordingState.IDLE;
  private steps: number = 0;
  private refreshCount: number = 0;
  private blinkCount: number = 0;
  private errorCount: number = 0;

  constructor(clock: FakeClock) {
    this.clock = clock;
  }

  public start(): void {
    this.state = RecordingState.RECORDING;
  }

  public step(): void {
    if (this.state !== RecordingState.RECORDING) {
      return;
    }
    const before = this.steps;
    this.steps++;
    if (Math.floor((before + 1) * SustainedRunModel.STEP_MS / 1000) >
      Math.floor(before * SustainedRunModel.STEP_MS / 1000)) {
      this.refreshCount++;
    }
    if (Math.floor((before + 1) * SustainedRunModel.STEP_MS / 800) >
      Math.floor(before * SustainedRunModel.STEP_MS / 800)) {
      this.blinkCount++;
    }
    this.clock.advance(SustainedRunModel.STEP_MS);
  }

  public run(): void {
    const totalSteps = SustainedRunModel.RUN_MS / SustainedRunModel.STEP_MS;
    for (let index = 0; index < totalSteps; index++) {
      this.step();
    }
  }

  public getState(): RecordingState {
    return this.state;
  }

  public getSteps(): number {
    return this.steps;
  }

  public getRefreshCount(): number {
    return this.refreshCount;
  }

  public getBlinkCount(): number {
    return this.blinkCount;
  }

  public getErrorCount(): number {
    return this.errorCount;
  }

  public recordError(): void {
    this.errorCount++;
  }

  public stop(): void {
    this.state = RecordingState.STOPPED;
  }

  public elapsedMs(): number {
    return this.steps * SustainedRunModel.STEP_MS;
  }
}

/** Snapshot of one stress round, kept immutable for comparison. */
class StressSnapshot {
  public round: number;
  public operations: number;
  public averageMs: number;
  public peakMs: number;

  constructor(round: number, operations: number, averageMs: number, peakMs: number) {
    this.round = round;
    this.operations = operations;
    this.averageMs = averageMs;
    this.peakMs = peakMs;
  }

  public clone(): StressSnapshot {
    return new StressSnapshot(this.round, this.operations, this.averageMs, this.peakMs);
  }

  public equals(other: StressSnapshot): boolean {
    return this.round === other.round && this.operations === other.operations &&
      this.averageMs === other.averageMs && this.peakMs === other.peakMs;
  }

  public isValid(): boolean {
    return this.round >= 0 && this.operations >= 0 && this.averageMs >= 0 && this.peakMs >= 0;
  }

  public describe(): string {
    return `round=${this.round}, operations=${this.operations}, ` +
      `average=${this.averageMs}, peak=${this.peakMs}`;
  }
}

export default function recorderPerformanceStressTest(): void {
  describe('RecorderPerformanceStress_Test', () => {
    it('repeated_start_stop_cycles_should_stay_balanced', 0, () => {
      const clock = new FakeClock();
      const model = new StartStopCycleModel(clock);
      for (let round = 0; round < 100; round++) {
        expect(model.start()).assertTrue();
        clock.advance(500);
        expect(model.stop()).assertTrue();
        clock.advance(200);
      }
      expect(model.getStartCount()).assertEqual(100);
      expect(model.getStopCount()).assertEqual(100);
      expect(model.isBalanced()).assertTrue();
      expect(model.getState()).assertEqual(RecordingState.STOPPED);
    });

    it('start_without_stop_should_reject_second_start', 0, () => {
      const clock = new FakeClock();
      const model = new StartStopCycleModel(clock);
      expect(model.start()).assertTrue();
      expect(model.start()).assertFalse();
      expect(model.getRejectedStarts()).assertEqual(1);
      expect(model.getStartCount()).assertEqual(1);
      expect(model.getState()).assertEqual(RecordingState.RECORDING);
    });

    it('stop_without_start_should_be_rejected', 0, () => {
      const clock = new FakeClock();
      const model = new StartStopCycleModel(clock);
      expect(model.stop()).assertFalse();
      expect(model.getRejectedStops()).assertEqual(1);
      expect(model.getStopCount()).assertEqual(0);
      expect(model.getState()).assertEqual(RecordingState.IDLE);
    });

    it('restart_after_stop_should_be_allowed', 0, () => {
      const clock = new FakeClock();
      const model = new StartStopCycleModel(clock);
      model.start();
      model.stop();
      expect(model.start()).assertTrue();
      expect(model.getStartCount()).assertEqual(2);
      expect(model.getStopCount()).assertEqual(1);
      expect(model.isBalanced()).assertFalse();
    });

    it('cycle_duration_should_use_logical_clock', 0, () => {
      const clock = new FakeClock();
      const model = new StartStopCycleModel(clock);
      clock.advance(4000);
      model.start();
      expect(model.getLastCycleDuration()).assertEqual(1700000004000);
      clock.advance(1000);
      expect(clock.now()).assertEqual(1700000005000);
    });

    it('callback_storm_should_respect_capacity', 0, () => {
      const model = new CallbackStormModel(1000);
      model.emit(1500);
      expect(model.getCapacity()).assertEqual(1000);
      expect(model.getDelivered()).assertEqual(1000);
      expect(model.getDropped()).assertEqual(500);
      expect(model.isSaturated()).assertTrue();
    });

    it('callback_storm_should_handle_small_bursts', 0, () => {
      const model = new CallbackStormModel(100);
      model.emit(20);
      model.emit(30);
      expect(model.getDelivered()).assertEqual(50);
      expect(model.getDropped()).assertEqual(0);
      expect(model.isSaturated()).assertFalse();
      model.reset();
      expect(model.getDelivered()).assertEqual(0);
      expect(model.isSaturated()).assertFalse();
    });

    it('callback_storm_should_drop_only_excess_events', 0, () => {
      const model = new CallbackStormModel(10);
      model.emit(9);
      model.emit(5);
      expect(model.getDelivered()).assertEqual(10);
      expect(model.getDropped()).assertEqual(4);
      expect(model.getDelivered() + model.getDropped()).assertEqual(14);
    });

    it('window_churn_should_release_every_window', 0, () => {
      const model = new WindowChurnModel();
      for (let round = 0; round < 100; round++) {
        expect(model.create('timer')).assertTrue();
        expect(model.create('tip')).assertTrue();
        expect(model.liveCount()).assertEqual(2);
        expect(model.release('timer')).assertTrue();
        expect(model.release('tip')).assertTrue();
      }
      expect(model.getCreated()).assertEqual(200);
      expect(model.getReleased()).assertEqual(200);
      expect(model.isBalanced()).assertTrue();
      expect(model.liveCount()).assertEqual(0);
    });

    it('window_churn_should_reject_duplicate_create', 0, () => {
      const model = new WindowChurnModel();
      expect(model.create('timer')).assertTrue();
      expect(model.create('timer')).assertFalse();
      expect(model.getCreated()).assertEqual(1);
      expect(model.isLive('timer')).assertTrue();
      expect(model.liveCount()).assertEqual(1);
    });

    it('window_churn_should_reject_unknown_release', 0, () => {
      const model = new WindowChurnModel();
      expect(model.release('timer')).assertFalse();
      model.create('tip');
      expect(model.releaseAll()).assertEqual(1);
      expect(model.getReleased()).assertEqual(1);
      expect(model.isBalanced()).assertTrue();
    });

    it('window_churn_should_survive_mixed_order', 0, () => {
      const model = new WindowChurnModel();
      model.create('timer');
      model.create('tip');
      model.release('timer');
      model.create('timer');
      expect(model.liveCount()).assertEqual(2);
      expect(model.getCreated()).assertEqual(3);
      expect(model.getReleased()).assertEqual(1);
      model.releaseAll();
      expect(model.isBalanced()).assertTrue();
      expect(model.getReleased()).assertEqual(3);
    });

    it('sustained_sixty_second_run_should_stay_consistent', 0, () => {
      const clock = new FakeClock();
      const model = new SustainedRunModel(clock);
      model.start();
      model.run();
      expect(model.getSteps()).assertEqual(600);
      expect(model.elapsedMs()).assertEqual(60000);
      expect(model.getRefreshCount()).assertEqual(60);
      expect(model.getBlinkCount()).assertEqual(75);
      expect(model.getErrorCount()).assertEqual(0);
      expect(clock.now()).assertEqual(1700000060000);
    });

    it('sustained_run_should_ignore_steps_before_start', 0, () => {
      const clock = new FakeClock();
      const model = new SustainedRunModel(clock);
      model.step();
      model.step();
      expect(model.getSteps()).assertEqual(0);
      expect(model.getRefreshCount()).assertEqual(0);
      model.start();
      model.run();
      model.stop();
      model.step();
      expect(model.getSteps()).assertEqual(600);
      expect(model.getState()).assertEqual(RecordingState.STOPPED);
    });

    it('stress_collector_should_aggregate_categories', 0, () => {
      const clock = new FakeClock();
      const collector = new StressSampleCollector(clock);
      collector.add(StressCategory.START, 120);
      collector.add(StressCategory.START, 180);
      collector.add(StressCategory.STOP, 240);
      expect(collector.count()).assertEqual(3);
      expect(collector.countOf(StressCategory.START)).assertEqual(2);
      expect(collector.averageOf(StressCategory.START)).assertEqual(150);
      expect(collector.peakOf(StressCategory.START)).assertEqual(180);
      expect(collector.averageOf(StressCategory.RECOVERY)).assertEqual(0);
      expect(collector.isChronological()).assertTrue();
    });

    it('stress_collector_clear_should_reset_samples', 0, () => {
      const clock = new FakeClock();
      const collector = new StressSampleCollector(clock);
      collector.add(StressCategory.WINDOW, 10);
      collector.clear();
      expect(collector.count()).assertEqual(0);
      expect(collector.countOf(StressCategory.WINDOW)).assertEqual(0);
      expect(collector.samplesCopy().length).assertEqual(0);
    });

    it('threshold_registry_should_expose_defaults', 0, () => {
      const registry = new StressThresholdRegistry();
      expect(registry.count()).assertEqual(4);
      expect(registry.contains('start_recording')).assertTrue();
      expect(registry.contains('stop_recording')).assertTrue();
      const start = registry.get('start_recording');
      expect(start === null).assertFalse();
      if (start !== null) {
        expect(start.maxAverageMs).assertEqual(800);
        expect(start.maxPeakMs).assertEqual(2000);
      }
      expect(registry.get('missing')).assertNull();
    });

    it('threshold_registry_should_register_and_remove', 0, () => {
      const registry = new StressThresholdRegistry();
      const custom: StressThreshold = {
        metricName: 'recorder_restart', maxAverageMs: 300, maxPeakMs: 900
      };
      registry.register(custom);
      expect(registry.count()).assertEqual(5);
      const fetched = registry.get('recorder_restart');
      expect(fetched === null).assertFalse();
      if (fetched !== null) {
        expect(fetched.maxAverageMs).assertEqual(300);
      }
      registry.unregister('recorder_restart');
      expect(registry.contains('recorder_restart')).assertFalse();
      expect(registry.count()).assertEqual(4);
    });

    it('analyzer_should_pass_metrics_within_threshold', 0, () => {
      const clock = new FakeClock();
      const collector = new StressSampleCollector(clock);
      collector.add(StressCategory.START, 200);
      collector.add(StressCategory.START, 400);
      const registry = new StressThresholdRegistry();
      const analyzer = new StressAnalyzer(registry, collector);
      const result: StressBenchmark = analyzer.analyze('start_recording', StressCategory.START);
      expect(result.operations).assertEqual(2);
      expect(result.averageMs).assertEqual(300);
      expect(result.peakMs).assertEqual(400);
      expect(result.passed).assertTrue();
    });

    it('analyzer_should_fail_metrics_above_threshold', 0, () => {
      const clock = new FakeClock();
      const collector = new StressSampleCollector(clock);
      collector.add(StressCategory.STOP, 5000);
      const registry = new StressThresholdRegistry();
      const analyzer = new StressAnalyzer(registry, collector);
      const result: StressBenchmark = analyzer.analyze('stop_recording', StressCategory.STOP);
      expect(result.averageMs).assertEqual(5000);
      expect(result.peakMs).assertEqual(5000);
      expect(result.passed).assertFalse();
    });

    it('analyzer_should_grade_latency', 0, () => {
      const clock = new FakeClock();
      const collector = new StressSampleCollector(clock);
      const analyzer = new StressAnalyzer(new StressThresholdRegistry(), collector);
      expect(analyzer.grade(50, 100)).assertEqual('excellent');
      expect(analyzer.grade(400, 900)).assertEqual('good');
      expect(analyzer.grade(900, 1500)).assertEqual('acceptable');
      expect(analyzer.grade(2000, 5000)).assertEqual('poor');
      expect(analyzer.describeGrade('excellent')).assertEqual('优秀');
      expect(analyzer.describeGrade('poor')).assertEqual('较差');
    });

    it('stress_snapshot_should_support_clone_and_equals', 0, () => {
      const snapshot = new StressSnapshot(1, 100, 250, 800);
      expect(snapshot.isValid()).assertTrue();
      const cloned = snapshot.clone();
      expect(snapshot.equals(cloned)).assertTrue();
      expect(snapshot === cloned).assertFalse();
      expect(snapshot.describe()).assertContain('operations=100');
      const invalid = new StressSnapshot(-1, 0, 0, 0);
      expect(invalid.isValid()).assertFalse();
    });

    it('stress_rounds_should_produce_identical_snapshots', 0, () => {
      const clock = new FakeClock();
      const first = new StressSnapshot(0, 100, 300, 300);
      const collector = new StressSampleCollector(clock);
      for (let index = 0; index < 100; index++) {
        collector.add(StressCategory.CALLBACK, 300);
      }
      const average = collector.averageOf(StressCategory.CALLBACK);
      const peak = collector.peakOf(StressCategory.CALLBACK);
      const second = new StressSnapshot(0, collector.count(), average, peak);
      expect(first.equals(second)).assertTrue();
    });

    it('mixed_stress_scenario_should_stay_bounded', 0, () => {
      const clock = new FakeClock();
      const cycles = new StartStopCycleModel(clock);
      const churn = new WindowChurnModel();
      const storm = new CallbackStormModel(500);
      const collector = new StressSampleCollector(clock);
      const sustained = new SustainedRunModel(clock);
      for (let round = 0; round < 50; round++) {
        cycles.start();
        churn.create('timer');
        const begin = clock.now();
        storm.emit(4);
        collector.add(StressCategory.CALLBACK, clock.now() - begin);
        sustained.start();
        sustained.step();
        sustained.stop();
        churn.releaseAll();
        cycles.stop();
      }
      expect(cycles.getStartCount()).assertEqual(50);
      expect(cycles.isBalanced()).assertTrue();
      expect(churn.isBalanced()).assertTrue();
      expect(storm.getDelivered()).assertEqual(200);
      expect(collector.count()).assertEqual(50);
      expect(collector.averageOf(StressCategory.CALLBACK)).assertEqual(0);
    });

    it('callback_burst_should_not_grow_without_bound', 0, () => {
      const storm = new CallbackStormModel(200);
      for (let round = 0; round < 20; round++) {
        storm.emit(25);
      }
      expect(storm.getDelivered()).assertEqual(200);
      expect(storm.getDropped()).assertEqual(300);
      expect(storm.isSaturated()).assertTrue();
    });
  });
}

