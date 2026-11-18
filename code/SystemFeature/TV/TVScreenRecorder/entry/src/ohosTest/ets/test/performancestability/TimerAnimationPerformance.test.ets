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
 * Animation performance model of the recorder floating windows.
 * The timer page blinks the recording icon with animateTo, PlayMode.Alternate and
 * a duration of 800 ms, and refreshes a TextTimer with the HH:mm:ss pattern once
 * per second. Both animations must stop as soon as the session leaves the
 * Recording state. Every timestamp comes from a logical clock.
 */

/** Recording state of the sample application. */
enum RecordingState {
  IDLE = 0,
  RECORDING = 1,
  STOPPED = 2,
  ERROR = 3
}

/** Play mode of one animation. */
enum PlayMode {
  NORMAL = 'normal',
  ALTERNATE = 'alternate',
  REVERSE = 'reverse'
}

/** Frame rate tier of the rendering pipeline. */
enum FrameRateTier {
  LOW = 'low',
  MEDIUM = 'medium',
  HIGH = 'high',
  ULTRA = 'ultra'
}

/** Bottleneck classification of a frame series. */
enum BottleneckType {
  NONE = 'none',
  CPU_BOUND = 'cpu_bound',
  GPU_BOUND = 'gpu_bound',
  MEMORY_BOUND = 'memory_bound'
}

/** One animation record. */
interface AnimationRecord {
  animationType: string;
  durationMs: number;
  frameCount: number;
  fps: number;
  smooth: boolean;
}

/** One frame time entry. */
interface FrameTimeEntry {
  frameId: number;
  deltaMs: number;
}

/** Aggregated animation snapshot. */
interface AnimationSnapshot {
  snapshotId: number;
  frameCount: number;
  totalDurationMs: number;
  averageFps: number;
  jankCount: number;
  bottleneck: BottleneckType;
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

/** One frame with jank detection and clone helpers. */
class FrameTimeModel {
  public static readonly FRAME_BUDGET_MS: number = 16.67;
  private frameId: number;
  private deltaMs: number;

  constructor(frameId: number, deltaMs: number) {
    this.frameId = frameId;
    this.deltaMs = deltaMs;
  }

  public getFrameId(): number {
    return this.frameId;
  }

  public getDeltaMs(): number {
    return this.deltaMs;
  }

  public isJank(): boolean {
    return this.deltaMs > FrameTimeModel.FRAME_BUDGET_MS * 1.5;
  }

  public getInstantFps(): number {
    if (this.deltaMs === 0) {
      return 0;
    }
    return 1000 / this.deltaMs;
  }

  public clone(): FrameTimeModel {
    return new FrameTimeModel(this.frameId, this.deltaMs);
  }

  public equals(other: FrameTimeModel): boolean {
    return this.frameId === other.frameId && this.deltaMs === other.deltaMs;
  }

  public describe(): string {
    return `frame(${this.frameId}, ${this.deltaMs}ms)`;
  }
}

/** Aggregates frame times of one animation window. */
class FrameSeriesModel {
  private frames: FrameTimeModel[] = [];

  public add(frame: FrameTimeModel): void {
    this.frames.push(frame.clone());
  }

  public addDelta(deltaMs: number): void {
    this.frames.push(new FrameTimeModel(this.frames.length, deltaMs));
  }

  public count(): number {
    return this.frames.length;
  }

  public averageDelta(): number {
    if (this.frames.length === 0) {
      return 0;
    }
    let total = 0;
    for (let index = 0; index < this.frames.length; index++) {
      total += this.frames[index].getDeltaMs();
    }
    return total / this.frames.length;
  }

  public jankCount(): number {
    let count = 0;
    for (let index = 0; index < this.frames.length; index++) {
      if (this.frames[index].isJank()) {
        count++;
      }
    }
    return count;
  }

  public jankRate(): number {
    if (this.frames.length === 0) {
      return 0;
    }
    return this.jankCount() / this.frames.length;
  }

  public averageFps(): number {
    const average = this.averageDelta();
    if (average === 0) {
      return 0;
    }
    return 1000 / average;
  }

  public longestFrame(): number {
    let longest = 0;
    for (let index = 0; index < this.frames.length; index++) {
      if (this.frames[index].getDeltaMs() > longest) {
        longest = this.frames[index].getDeltaMs();
      }
    }
    return longest;
  }

  public clear(): void {
    this.frames = [];
  }
}

/** Classifies a frame rate into a tier and reports smoothness. */
class FrameRateTierClassifier {
  public classify(fps: number): FrameRateTier {
    if (fps >= 120) {
      return FrameRateTier.ULTRA;
    }
    if (fps >= 60) {
      return FrameRateTier.HIGH;
    }
    if (fps >= 30) {
      return FrameRateTier.MEDIUM;
    }
    return FrameRateTier.LOW;
  }

  public isSmooth(fps: number): boolean {
    const tier = this.classify(fps);
    return tier === FrameRateTier.HIGH || tier === FrameRateTier.ULTRA;
  }
}

/** Infers the bottleneck of a frame series from its jank rate. */
class BottleneckAnalyzer {
  public analyze(series: FrameSeriesModel): BottleneckType {
    if (series.count() === 0) {
      return BottleneckType.NONE;
    }
    const rate = series.jankRate();
    if (rate >= 0.5) {
      return BottleneckType.CPU_BOUND;
    }
    if (rate >= 0.2) {
      return BottleneckType.GPU_BOUND;
    }
    if (rate >= 0.05) {
      return BottleneckType.MEMORY_BOUND;
    }
    return BottleneckType.NONE;
  }

  public isHealthy(bottleneck: BottleneckType): boolean {
    return bottleneck === BottleneckType.NONE;
  }
}

/** Tracks the smoothness of the recorder animations. */
class AnimationTracker {
  private records: AnimationRecord[] = [];
  private smoothCount: number = 0;
  private clock: FakeClock;

  constructor(clock: FakeClock) {
    this.clock = clock;
  }

  public record(animationType: string, durationMs: number, frameCount: number,
    fps: number, smooth: boolean): void {
    const record: AnimationRecord = {
      animationType: animationType,
      durationMs: durationMs,
      frameCount: frameCount,
      fps: fps,
      smooth: smooth
    };
    this.records.push(record);
    if (smooth) {
      this.smoothCount++;
    }
    this.clock.advance(durationMs);
  }

  public count(): number {
    return this.records.length;
  }

  public recordsCopy(): AnimationRecord[] {
    const result: AnimationRecord[] = [];
    for (let index = 0; index < this.records.length; index++) {
      result.push(this.records[index]);
    }
    return result;
  }

  public smoothCountValue(): number {
    return this.smoothCount;
  }

  public smoothnessRate(): number {
    if (this.records.length === 0) {
      return 0;
    }
    return this.smoothCount / this.records.length;
  }

  public averageFps(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let total = 0;
    for (let index = 0; index < this.records.length; index++) {
      total += this.records[index].fps;
    }
    return total / this.records.length;
  }

  public averageDuration(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let total = 0;
    for (let index = 0; index < this.records.length; index++) {
      total += this.records[index].durationMs;
    }
    return total / this.records.length;
  }

  public countByType(animationType: string): number {
    let count = 0;
    for (let index = 0; index < this.records.length; index++) {
      if (this.records[index].animationType === animationType) {
        count++;
      }
    }
    return count;
  }

  public reset(): void {
    this.records = [];
    this.smoothCount = 0;
  }
}

/** Builds an immutable animation snapshot. */
class AnimationSnapshotBuilder {
  private snapshotId: number = 0;
  private frameCount: number = 0;
  private totalDurationMs: number = 0;
  private averageFps: number = 0;
  private jankCount: number = 0;
  private bottleneck: BottleneckType = BottleneckType.NONE;

  public setSnapshotId(snapshotId: number): AnimationSnapshotBuilder {
    this.snapshotId = snapshotId;
    return this;
  }

  public setFrameCount(frameCount: number): AnimationSnapshotBuilder {
    this.frameCount = frameCount;
    return this;
  }

  public setTotalDuration(totalDurationMs: number): AnimationSnapshotBuilder {
    this.totalDurationMs = totalDurationMs;
    return this;
  }

  public setAverageFps(averageFps: number): AnimationSnapshotBuilder {
    this.averageFps = averageFps;
    return this;
  }

  public setJankCount(jankCount: number): AnimationSnapshotBuilder {
    this.jankCount = jankCount;
    return this;
  }

  public setBottleneck(bottleneck: BottleneckType): AnimationSnapshotBuilder {
    this.bottleneck = bottleneck;
    return this;
  }

  public build(): AnimationSnapshot {
    const snapshot: AnimationSnapshot = {
      snapshotId: this.snapshotId,
      frameCount: this.frameCount,
      totalDurationMs: this.totalDurationMs,
      averageFps: this.averageFps,
      jankCount: this.jankCount,
      bottleneck: this.bottleneck
    };
    return snapshot;
  }
}

/** Records periodic animation samples. */
class AnimationSampler {
  private frameCounts: number[] = [];
  private jankCounts: number[] = [];
  private modes: string[] = [];

  public record(mode: string, frameCount: number, jankCount: number): void {
    this.modes.push(mode);
    this.frameCounts.push(frameCount);
    this.jankCounts.push(jankCount);
  }

  public count(): number {
    return this.jankCounts.length;
  }

  public countByMode(mode: string): number {
    let count = 0;
    for (let index = 0; index < this.modes.length; index++) {
      if (this.modes[index] === mode) {
        count++;
      }
    }
    return count;
  }

  public averageJank(): number {
    if (this.jankCounts.length === 0) {
      return 0;
    }
    let total = 0;
    for (let index = 0; index < this.jankCounts.length; index++) {
      total += this.jankCounts[index];
    }
    return total / this.jankCounts.length;
  }

  public totalFrames(): number {
    let total = 0;
    for (let index = 0; index < this.frameCounts.length; index++) {
      total += this.frameCounts[index];
    }
    return total;
  }

  public isHealthy(maxAverageJank: number): boolean {
    return this.averageJank() <= maxAverageJank;
  }

  public clear(): void {
    this.frameCounts = [];
    this.jankCounts = [];
    this.modes = [];
  }
}

/** Frame budget of one animation. */
class FrameBudgetModel {
  private budgetMs: number;
  private toleranceMs: number;

  constructor(budgetMs: number, toleranceMs: number) {
    this.budgetMs = budgetMs;
    this.toleranceMs = toleranceMs;
  }

  public getBudgetMs(): number {
    return this.budgetMs;
  }

  public getToleranceMs(): number {
    return this.toleranceMs;
  }

  public isWithinBudget(actualMs: number): boolean {
    return actualMs <= this.budgetMs + this.toleranceMs;
  }

  public overrun(actualMs: number): number {
    const limit = this.budgetMs + this.toleranceMs;
    return actualMs > limit ? actualMs - limit : 0;
  }
}

/**
 * Blink animation model of the recording icon.
 * The production page uses animateTo with PlayMode.Alternate and 800 ms, so the
 * animation owns exactly two keyframes and alternates between them.
 */
class BlinkAnimationModel {
  public static readonly DURATION_MS: number = 800;
  public static readonly PLAY_MODE: PlayMode = PlayMode.ALTERNATE;
  private running: boolean = false;
  private startedAt: number = 0;
  private iterations: number = 0;
  private clock: FakeClock;

  constructor(clock: FakeClock) {
    this.clock = clock;
  }

  public start(): void {
    this.running = true;
    this.startedAt = this.clock.now();
  }

  public getRunning(): boolean {
    return this.running;
  }

  public getPlayMode(): PlayMode {
    return BlinkAnimationModel.PLAY_MODE;
  }

  public getDuration(): number {
    return BlinkAnimationModel.DURATION_MS;
  }

  public elapsed(): number {
    if (!this.running && this.startedAt === 0) {
      return 0;
    }
    return this.clock.now() - this.startedAt;
  }

  public opacityAt(): number {
    const phase = Math.floor(this.elapsed() / BlinkAnimationModel.DURATION_MS) % 2;
    return phase === 0 ? 1 : 0;
  }

  public advance(ms: number): void {
    if (!this.running) {
      return;
    }
    this.clock.advance(ms);
    const completed = Math.floor(this.elapsed() / BlinkAnimationModel.DURATION_MS);
    if (completed > this.iterations) {
      this.iterations = completed;
    }
  }

  public getIterations(): number {
    return this.iterations;
  }

  public stop(): void {
    this.running = false;
  }

  public reset(): void {
    this.running = false;
    this.startedAt = 0;
    this.iterations = 0;
  }
}

/**
 * TextTimer model with the HH:mm:ss pattern.
 * The label never rewinds and never repeats a value once per second.
 */
class TextTimerModel {
  private elapsedMs: number = 0;
  private labels: string[] = [];

  public tick(ms: number): string {
    if (ms <= 0) {
      return this.label();
    }
    this.elapsedMs += ms;
    const label = this.label();
    if (!this.labels.includes(label)) {
      this.labels.push(label);
    }
    return label;
  }

  public label(): string {
    const totalSeconds = Math.floor(this.elapsedMs / 1000);
    const hours = Math.floor(totalSeconds / 3600);
    const minutes = Math.floor((totalSeconds % 3600) / 60);
    const seconds = totalSeconds % 60;
    return `${hours.toString().padStart(2, '0')}:` +
      `${minutes.toString().padStart(2, '0')}:` +
      `${seconds.toString().padStart(2, '0')}`;
  }

  public distinctLabels(): number {
    return this.labels.length;
  }

  public elapsed(): number {
    return this.elapsedMs;
  }

  public reset(): void {
    this.elapsedMs = 0;
    this.labels = [];
  }
}

/**
 * Interruption model of the animations.
 * Both the blink animation and the TextTimer refresh belong to the Recording
 * phase, therefore leaving that phase must freeze them in the same callback.
 */
class AnimationInterruptionModel {
  private state: RecordingState = RecordingState.IDLE;
  private blinkRunning: boolean = false;
  private timerRunning: boolean = false;
  private interrupts: number = 0;

  public startRecording(): void {
    if (this.state === RecordingState.RECORDING) {
      return;
    }
    this.state = RecordingState.RECORDING;
    this.blinkRunning = true;
    this.timerRunning = true;
  }

  public stop(reason: RecordingState): void {
    if (reason !== RecordingState.STOPPED && reason !== RecordingState.ERROR) {
      return;
    }
    if (this.blinkRunning || this.timerRunning) {
      this.interrupts++;
    }
    this.state = reason;
    this.blinkRunning = false;
    this.timerRunning = false;
  }

  public getState(): RecordingState {
    return this.state;
  }

  public isBlinkRunning(): boolean {
    return this.blinkRunning;
  }

  public isTimerRunning(): boolean {
    return this.timerRunning;
  }

  public getInterrupts(): number {
    return this.interrupts;
  }

  public isFrozen(): boolean {
    return !this.blinkRunning && !this.timerRunning;
  }
}

export default function timerAnimationPerformanceTest(): void {
  describe('TimerAnimationPerformance_Test', () => {
    it('frame_time_should_detect_jank', 0, () => {
      const jank = new FrameTimeModel(0, 33);
      expect(jank.getFrameId()).assertEqual(0);
      expect(jank.getDeltaMs()).assertEqual(33);
      expect(jank.isJank()).assertTrue();
      const smooth = new FrameTimeModel(1, 16);
      expect(smooth.isJank()).assertFalse();
      expect(smooth.getInstantFps()).assertEqual(1000 / 16);
      expect(new FrameTimeModel(2, 0).getInstantFps()).assertEqual(0);
    });

    it('frame_time_should_support_clone_and_equals', 0, () => {
      const frame = new FrameTimeModel(3, 16);
      const cloned = frame.clone();
      expect(frame.equals(cloned)).assertTrue();
      expect(frame === cloned).assertFalse();
      expect(cloned.getDeltaMs()).assertEqual(16);
      expect(frame.describe()).assertContain('frame(3');
      expect(new FrameTimeModel(4, 25).isJank()).assertFalse();
      expect(new FrameTimeModel(5, 26).isJank()).assertTrue();
    });

    it('frame_series_should_aggregate_statistics', 0, () => {
      const series = new FrameSeriesModel();
      series.addDelta(16);
      series.addDelta(16);
      series.addDelta(40);
      expect(series.count()).assertEqual(3);
      expect(series.averageDelta()).assertEqual(24);
      expect(series.jankCount()).assertEqual(1);
      expect(series.jankRate()).assertEqual(1 / 3);
      expect(series.averageFps()).assertEqual(1000 / 24);
      expect(series.longestFrame()).assertEqual(40);
      series.clear();
      expect(series.count()).assertEqual(0);
    });

    it('empty_frame_series_should_report_zero', 0, () => {
      const series = new FrameSeriesModel();
      expect(series.count()).assertEqual(0);
      expect(series.averageDelta()).assertEqual(0);
      expect(series.averageFps()).assertEqual(0);
      expect(series.jankCount()).assertEqual(0);
      expect(series.jankRate()).assertEqual(0);
      expect(series.longestFrame()).assertEqual(0);
    });

    it('frame_series_should_clone_added_frames', 0, () => {
      const series = new FrameSeriesModel();
      const frame = new FrameTimeModel(0, 16);
      series.add(frame);
      const mutated = new FrameTimeModel(0, 100);
      expect(mutated.getDeltaMs()).assertEqual(100);
      expect(series.count()).assertEqual(1);
      expect(series.longestFrame()).assertEqual(16);
    });

    it('frame_rate_tier_should_classify_boundaries', 0, () => {
      const classifier = new FrameRateTierClassifier();
      expect(classifier.classify(120)).assertEqual(FrameRateTier.ULTRA);
      expect(classifier.classify(60)).assertEqual(FrameRateTier.HIGH);
      expect(classifier.classify(59)).assertEqual(FrameRateTier.MEDIUM);
      expect(classifier.classify(30)).assertEqual(FrameRateTier.MEDIUM);
      expect(classifier.classify(29)).assertEqual(FrameRateTier.LOW);
      expect(classifier.classify(0)).assertEqual(FrameRateTier.LOW);
    });

    it('frame_rate_tier_should_report_smoothness', 0, () => {
      const classifier = new FrameRateTierClassifier();
      expect(classifier.isSmooth(60)).assertTrue();
      expect(classifier.isSmooth(120)).assertTrue();
      expect(classifier.isSmooth(30)).assertFalse();
      expect(classifier.isSmooth(15)).assertFalse();
    });

    it('bottleneck_analyzer_should_detect_cpu_bound', 0, () => {
      const series = new FrameSeriesModel();
      series.addDelta(40);
      series.addDelta(16);
      series.addDelta(40);
      series.addDelta(16);
      const analyzer = new BottleneckAnalyzer();
      expect(analyzer.analyze(series)).assertEqual(BottleneckType.CPU_BOUND);
      expect(analyzer.isHealthy(BottleneckType.CPU_BOUND)).assertFalse();
    });

    it('bottleneck_analyzer_should_detect_gpu_bound', 0, () => {
      const series = new FrameSeriesModel();
      series.addDelta(40);
      series.addDelta(16);
      series.addDelta(16);
      series.addDelta(16);
      series.addDelta(16);
      const analyzer = new BottleneckAnalyzer();
      expect(series.jankRate()).assertEqual(0.2);
      expect(analyzer.analyze(series)).assertEqual(BottleneckType.GPU_BOUND);
    });

    it('bottleneck_analyzer_should_detect_healthy_series', 0, () => {
      const series = new FrameSeriesModel();
      series.addDelta(16);
      series.addDelta(16);
      series.addDelta(16);
      const analyzer = new BottleneckAnalyzer();
      expect(analyzer.analyze(series)).assertEqual(BottleneckType.NONE);
      expect(analyzer.isHealthy(BottleneckType.NONE)).assertTrue();
      expect(analyzer.analyze(new FrameSeriesModel())).assertEqual(BottleneckType.NONE);
    });

    it('blink_animation_should_use_alternate_play_mode', 0, () => {
      const clock = new FakeClock();
      const blink = new BlinkAnimationModel(clock);
      expect(blink.getDuration()).assertEqual(800);
      expect(blink.getPlayMode()).assertEqual(PlayMode.ALTERNATE);
      expect(blink.getRunning()).assertFalse();
      expect(blink.opacityAt()).assertEqual(1);
    });

    it('blink_animation_should_alternate_each_800ms', 0, () => {
      const clock = new FakeClock();
      const blink = new BlinkAnimationModel(clock);
      blink.start();
      expect(blink.opacityAt()).assertEqual(1);
      blink.advance(799);
      expect(blink.opacityAt()).assertEqual(1);
      blink.advance(1);
      expect(blink.opacityAt()).assertEqual(0);
      expect(blink.getIterations()).assertEqual(1);
      blink.advance(800);
      expect(blink.opacityAt()).assertEqual(1);
      expect(blink.getIterations()).assertEqual(2);
    });

    it('blink_animation_should_stop_on_request', 0, () => {
      const clock = new FakeClock();
      const blink = new BlinkAnimationModel(clock);
      blink.start();
      blink.advance(1600);
      blink.stop();
      expect(blink.getRunning()).assertFalse();
      blink.advance(1600);
      expect(blink.getIterations()).assertEqual(2);
      blink.reset();
      expect(blink.getRunning()).assertFalse();
      expect(blink.getIterations()).assertEqual(0);
    });

    it('blink_animation_should_not_advance_before_start', 0, () => {
      const clock = new FakeClock();
      const blink = new BlinkAnimationModel(clock);
      blink.advance(5000);
      expect(blink.elapsed()).assertEqual(0);
      expect(blink.getIterations()).assertEqual(0);
      expect(clock.now()).assertEqual(1700000000000);
    });

    it('text_timer_should_format_hh_mm_ss', 0, () => {
      const timer = new TextTimerModel();
      expect(timer.label()).assertEqual('00:00:00');
      timer.tick(1000);
      expect(timer.label()).assertEqual('00:00:01');
      timer.tick(59000);
      expect(timer.label()).assertEqual('00:01:00');
      expect(timer.elapsed()).assertEqual(60000);
      expect(timer.distinctLabels()).assertEqual(2);
    });

    it('text_timer_should_not_repeat_labels', 0, () => {
      const timer = new TextTimerModel();
      timer.tick(1000);
      timer.tick(500);
      expect(timer.label()).assertEqual('00:00:01');
      timer.tick(500);
      expect(timer.label()).assertEqual('00:00:02');
      expect(timer.distinctLabels()).assertEqual(2);
      timer.tick(0);
      timer.tick(-100);
      expect(timer.elapsed()).assertEqual(2000);
    });

    it('text_timer_should_handle_hour_boundary', 0, () => {
      const timer = new TextTimerModel();
      timer.tick(3600000);
      expect(timer.label()).assertEqual('01:00:00');
      timer.tick(1000);
      expect(timer.label()).assertEqual('01:00:01');
      timer.reset();
      expect(timer.elapsed()).assertEqual(0);
      expect(timer.label()).assertEqual('00:00:00');
      expect(timer.distinctLabels()).assertEqual(0);
    });

    it('animations_should_stop_when_recording_stops', 0, () => {
      const model = new AnimationInterruptionModel();
      model.startRecording();
      expect(model.isBlinkRunning()).assertTrue();
      expect(model.isTimerRunning()).assertTrue();
      model.stop(RecordingState.STOPPED);
      expect(model.getState()).assertEqual(RecordingState.STOPPED);
      expect(model.isFrozen()).assertTrue();
      expect(model.getInterrupts()).assertEqual(1);
    });

    it('animations_should_stop_on_error', 0, () => {
      const model = new AnimationInterruptionModel();
      model.startRecording();
      model.stop(RecordingState.ERROR);
      expect(model.getState()).assertEqual(RecordingState.ERROR);
      expect(model.isBlinkRunning()).assertFalse();
      expect(model.isTimerRunning()).assertFalse();
      expect(model.getInterrupts()).assertEqual(1);
    });

    it('interruption_should_ignore_non_terminal_reason', 0, () => {
      const model = new AnimationInterruptionModel();
      model.startRecording();
      model.stop(RecordingState.IDLE);
      expect(model.getState()).assertEqual(RecordingState.RECORDING);
      expect(model.isBlinkRunning()).assertTrue();
      expect(model.getInterrupts()).assertEqual(0);
    });

    it('repeated_stop_should_not_double_interrupt', 0, () => {
      const model = new AnimationInterruptionModel();
      model.startRecording();
      model.stop(RecordingState.STOPPED);
      model.stop(RecordingState.STOPPED);
      expect(model.getInterrupts()).assertEqual(1);
      expect(model.isFrozen()).assertTrue();
      model.startRecording();
      expect(model.isBlinkRunning()).assertTrue();
    });

    it('animation_tracker_should_compute_smoothness', 0, () => {
      const clock = new FakeClock();
      const tracker = new AnimationTracker(clock);
      tracker.record('icon_blink', 800, 48, 60, true);
      tracker.record('timer_refresh', 1000, 30, 30, false);
      tracker.record('focus_transition', 200, 12, 60, true);
      expect(tracker.count()).assertEqual(3);
      expect(tracker.smoothCountValue()).assertEqual(2);
      expect(tracker.smoothnessRate()).assertEqual(2 / 3);
      expect(tracker.averageFps()).assertEqual(50);
      expect(tracker.averageDuration()).assertEqual(2000 / 3);
      expect(tracker.countByType('icon_blink')).assertEqual(1);
    });

    it('animation_tracker_reset_should_clear_records', 0, () => {
      const clock = new FakeClock();
      const tracker = new AnimationTracker(clock);
      tracker.record('icon_blink', 800, 48, 60, true);
      tracker.reset();
      expect(tracker.count()).assertEqual(0);
      expect(tracker.smoothnessRate()).assertEqual(0);
      expect(tracker.averageFps()).assertEqual(0);
      expect(tracker.averageDuration()).assertEqual(0);
      expect(tracker.countByType('icon_blink')).assertEqual(0);
    });

    it('animation_snapshot_builder_should_build', 0, () => {
      const snapshot: AnimationSnapshot = new AnimationSnapshotBuilder()
        .setSnapshotId(9)
        .setFrameCount(48)
        .setTotalDuration(800)
        .setAverageFps(60)
        .setJankCount(1)
        .setBottleneck(BottleneckType.NONE)
        .build();
      expect(snapshot.snapshotId).assertEqual(9);
      expect(snapshot.frameCount).assertEqual(48);
      expect(snapshot.totalDurationMs).assertEqual(800);
      expect(snapshot.averageFps).assertEqual(60);
      expect(snapshot.jankCount).assertEqual(1);
      expect(snapshot.bottleneck).assertEqual(BottleneckType.NONE);
    });

    it('animation_sampler_should_aggregate', 0, () => {
      const sampler = new AnimationSampler();
      sampler.record('periodic', 48, 2);
      sampler.record('periodic', 48, 4);
      sampler.record('manual', 24, 6);
      expect(sampler.count()).assertEqual(3);
      expect(sampler.countByMode('periodic')).assertEqual(2);
      expect(sampler.countByMode('manual')).assertEqual(1);
      expect(sampler.averageJank()).assertEqual(4);
      expect(sampler.totalFrames()).assertEqual(120);
      expect(sampler.isHealthy(4)).assertTrue();
      expect(sampler.isHealthy(3)).assertFalse();
      sampler.clear();
      expect(sampler.count()).assertEqual(0);
    });

    it('frame_budget_should_check_overrun', 0, () => {
      const budget = new FrameBudgetModel(16, 8);
      expect(budget.getBudgetMs()).assertEqual(16);
      expect(budget.getToleranceMs()).assertEqual(8);
      expect(budget.isWithinBudget(24)).assertTrue();
      expect(budget.isWithinBudget(25)).assertFalse();
      expect(budget.overrun(30)).assertEqual(6);
      expect(budget.overrun(10)).assertEqual(0);
    });

    it('sixty_second_timer_should_keep_cadence', 0, () => {
      const clock = new FakeClock();
      const blink = new BlinkAnimationModel(clock);
      const timer = new TextTimerModel();
      blink.start();
      for (let second = 0; second < 60; second++) {
        blink.advance(1000);
        timer.tick(1000);
      }
      expect(timer.label()).assertEqual('00:01:00');
      expect(timer.elapsed()).assertEqual(60000);
      expect(blink.getIterations()).assertEqual(75);
      expect(blink.getRunning()).assertTrue();
      expect(blink.opacityAt()).assertEqual(0);
    });

    it('comprehensive_animation_scenario_should_pass', 0, () => {
      const clock = new FakeClock();
      const tracker = new AnimationTracker(clock);
      const blink = new BlinkAnimationModel(clock);
      const timer = new TextTimerModel();
      const model = new AnimationInterruptionModel();
      const series = new FrameSeriesModel();
      model.startRecording();
      blink.start();
      for (let frame = 0; frame < 48; frame++) {
        series.addDelta(16);
      }
      timer.tick(800);
      blink.advance(800);
      tracker.record('icon_blink', 800, 48, 60, true);
      expect(series.jankRate()).assertEqual(0);
      expect(new BottleneckAnalyzer().analyze(series)).assertEqual(BottleneckType.NONE);
      model.stop(RecordingState.STOPPED);
      expect(model.isFrozen()).assertTrue();
      expect(timer.label()).assertEqual('00:00:00');
      expect(tracker.smoothnessRate()).assertEqual(1);
      expect(new FrameRateTierClassifier().isSmooth(60)).assertTrue();
      expect(blink.getIterations()).assertEqual(1);
    });
  });
}

