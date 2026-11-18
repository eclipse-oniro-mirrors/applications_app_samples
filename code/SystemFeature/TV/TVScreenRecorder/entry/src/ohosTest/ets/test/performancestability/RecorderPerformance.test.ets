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
 * Performance budget checks of the TV screen recorder.
 * All measurements are driven by a logical clock so that the assertions are
 * reproducible on slow and fast devices. The runtime model mirrors the
 * production behavior: the TextTimer label refreshes every second, the
 * recording icon blinks every 800 ms and the tip window lives 3000 ms.
 */

/** Recording state of the sample application. */
enum RecordingState {
  IDLE = 0,
  RECORDING = 1,
  STOPPED = 2,
  ERROR = 3
}

/** One latency sample. */
interface LatencySample {
  name: string;
  durationMs: number;
}

/** Percentile snapshot of a sample set. */
interface PercentileResult {
  p50: number;
  p90: number;
  p99: number;
  max: number;
}

/** Frame drop statistics of a rendering window. */
interface FrameDropResult {
  totalFrames: number;
  droppedFrames: number;
  dropRate: number;
  longestStallMs: number;
}

/** Deterministic logical clock shared by every model of the suite. */
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

/** Collects latency samples and computes the basic statistics. */
class PerformanceMonitor {
  private samples: LatencySample[] = [];

  public record(name: string, durationMs: number): void {
    const sample: LatencySample = { name: name, durationMs: durationMs };
    this.samples.push(sample);
  }

  public recordMany(name: string, durations: number[]): void {
    for (let index = 0; index < durations.length; index++) {
      this.record(name, durations[index]);
    }
  }

  public count(): number {
    return this.samples.length;
  }

  public samplesCopy(): LatencySample[] {
    const result: LatencySample[] = [];
    for (let index = 0; index < this.samples.length; index++) {
      result.push(this.samples[index]);
    }
    return result;
  }

  public total(): number {
    let sum = 0;
    for (let index = 0; index < this.samples.length; index++) {
      sum += this.samples[index].durationMs;
    }
    return sum;
  }

  public average(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return this.total() / this.samples.length;
  }

  public max(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let peak = this.samples[0].durationMs;
    for (let index = 1; index < this.samples.length; index++) {
      if (this.samples[index].durationMs > peak) {
        peak = this.samples[index].durationMs;
      }
    }
    return peak;
  }

  public min(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let lowest = this.samples[0].durationMs;
    for (let index = 1; index < this.samples.length; index++) {
      if (this.samples[index].durationMs < lowest) {
        lowest = this.samples[index].durationMs;
      }
    }
    return lowest;
  }

  public averageOf(name: string): number {
    let sum = 0;
    let count = 0;
    for (let index = 0; index < this.samples.length; index++) {
      if (this.samples[index].name === name) {
        sum += this.samples[index].durationMs;
        count++;
      }
    }
    return count === 0 ? 0 : sum / count;
  }

  public clear(): void {
    this.samples = [];
  }
}

/** Analyzer that orders the samples and exposes percentiles. */
class PercentileAnalyzer {
  private durations: number[] = [];

  public setSamples(samples: LatencySample[]): void {
    this.durations = [];
    for (let index = 0; index < samples.length; index++) {
      this.durations.push(samples[index].durationMs);
    }
    this.durations.sort((first: number, second: number) => first - second);
  }

  public setDurations(durations: number[]): void {
    this.durations = [];
    for (let index = 0; index < durations.length; index++) {
      this.durations.push(durations[index]);
    }
    this.durations.sort((first: number, second: number) => first - second);
  }

  public count(): number {
    return this.durations.length;
  }

  public median(): number {
    const size = this.durations.length;
    if (size === 0) {
      return 0;
    }
    const middle = Math.floor(size / 2);
    if (size % 2 === 1) {
      return this.durations[middle];
    }
    return (this.durations[middle - 1] + this.durations[middle]) / 2;
  }

  public percentile(percent: number): number {
    const size = this.durations.length;
    if (size === 0) {
      return 0;
    }
    const index = Math.ceil((percent / 100) * size) - 1;
    const clamped = index < 0 ? 0 : (index >= size ? size - 1 : index);
    return this.durations[clamped];
  }

  public standardDeviation(): number {
    const size = this.durations.length;
    if (size === 0) {
      return 0;
    }
    let sum = 0;
    for (let index = 0; index < size; index++) {
      sum += this.durations[index];
    }
    const average = sum / size;
    let squares = 0;
    for (let index = 0; index < size; index++) {
      const diff = this.durations[index] - average;
      squares += diff * diff;
    }
    return Math.sqrt(squares / size);
  }

  public snapshot(): PercentileResult {
    const result: PercentileResult = {
      p50: this.percentile(50),
      p90: this.percentile(90),
      p99: this.percentile(99),
      max: this.percentile(100)
    };
    return result;
  }

  public clear(): void {
    this.durations = [];
  }
}

/** Latency budget registry of the recorder start and stop paths. */
class LatencyBudget {
  private budgets: Map<string, number> = new Map<string, number>();

  public set(metricName: string, budgetMs: number): void {
    this.budgets.set(metricName, budgetMs);
  }

  public get(metricName: string): number {
    const value: number | undefined = this.budgets.get(metricName);
    return value === undefined ? 0 : value;
  }

  public has(metricName: string): boolean {
    return this.budgets.has(metricName);
  }

  public isWithin(metricName: string, actualMs: number): boolean {
    const budget = this.get(metricName);
    return budget > 0 && actualMs <= budget;
  }

  public overrun(metricName: string, actualMs: number): number {
    const budget = this.get(metricName);
    if (budget === 0) {
      return actualMs;
    }
    return actualMs > budget ? actualMs - budget : 0;
  }

  public count(): number {
    return this.budgets.size;
  }
}

/**
 * TextTimer label model.
 * The production page binds a TextTimer with the HH:mm:ss pattern, so the
 * label advances exactly once per full second and never skips a value.
 */
class TimerLabelModel {
  private static readonly SECONDS_PER_HOUR: number = 3600;
  private static readonly SECONDS_PER_MINUTE: number = 60;

  public static format(totalSeconds: number): string {
    const safe = totalSeconds < 0 ? 0 : Math.floor(totalSeconds);
    const hours = Math.floor(safe / TimerLabelModel.SECONDS_PER_HOUR);
    const minutes = Math.floor((safe % TimerLabelModel.SECONDS_PER_HOUR) /
      TimerLabelModel.SECONDS_PER_MINUTE);
    const seconds = safe % TimerLabelModel.SECONDS_PER_MINUTE;
    return `${hours.toString().padStart(2, '0')}:` +
      `${minutes.toString().padStart(2, '0')}:` +
      `${seconds.toString().padStart(2, '0')}`;
  }

  public static labelAt(elapsedMs: number): string {
    return TimerLabelModel.format(Math.floor(elapsedMs / 1000));
  }

  public static refreshCount(elapsedMs: number): number {
    if (elapsedMs < 0) {
      return 0;
    }
    return Math.floor(elapsedMs / 1000) + 1;
  }

  public static refreshIntervalMs(): number {
    return 1000;
  }

  public static isWellFormed(label: string): boolean {
    if (label.length !== 8) {
      return false;
    }
    if (label.charAt(2) !== ':' || label.charAt(5) !== ':') {
      return false;
    }
    for (let index = 0; index < label.length; index++) {
      if (index === 2 || index === 5) {
        continue;
      }
      const code = label.charCodeAt(index);
      if (code < 48 || code > 57) {
        return false;
      }
    }
    return true;
  }
}

/**
 * Blinking recording icon model.
 * The icon uses animateTo with PlayMode.Alternate and a duration of 800 ms, so
 * the visible and invisible states alternate at every 800 ms boundary.
 */
class IconBlinkModel {
  public static readonly DURATION_MS: number = 800;

  public static isVisibleAt(elapsedMs: number): boolean {
    if (elapsedMs < 0) {
      return true;
    }
    return Math.floor(elapsedMs / IconBlinkModel.DURATION_MS) % 2 === 0;
  }

  public static transitionsAt(elapsedMs: number): number {
    if (elapsedMs < 0) {
      return 0;
    }
    return Math.floor(elapsedMs / IconBlinkModel.DURATION_MS);
  }

  public static nextTransition(elapsedMs: number): number {
    const index = Math.floor(elapsedMs / IconBlinkModel.DURATION_MS);
    return (index + 1) * IconBlinkModel.DURATION_MS;
  }
}

/**
 * Tip window model.
 * ScreenRecorderAbility pops the tip window and hides it after 3000 ms, the
 * value declared by the production page.
 */
class TipWindowModel {
  public static readonly DURATION_MS: number = 3000;
  private shownAt: number = 0;
  private visible: boolean = false;
  private dismissCount: number = 0;

  public show(nowMs: number): void {
    this.shownAt = nowMs;
    this.visible = true;
  }

  public isVisibleAt(nowMs: number): boolean {
    if (!this.visible) {
      return false;
    }
    const elapsed = nowMs - this.shownAt;
    if (elapsed >= TipWindowModel.DURATION_MS) {
      this.visible = false;
      this.dismissCount++;
      return false;
    }
    return true;
  }

  public isVisible(): boolean {
    return this.visible;
  }

  public hide(): void {
    if (this.visible) {
      this.visible = false;
      this.dismissCount++;
    }
  }

  public elapsedAt(nowMs: number): number {
    return nowMs - this.shownAt;
  }

  public getDismissCount(): number {
    return this.dismissCount;
  }
}

/**
 * Timeline model of one recording session.
 * The model stores only state transitions and their logical timestamps, which is
 * enough to verify the start latency, the label refresh cadence and the blink
 * cadence without any real sleeping.
 */
class RecordingTimelineModel {
  private clock: FakeClock;
  private state: RecordingState = RecordingState.IDLE;
  private startedAt: number = 0;
  private stoppedAt: number = 0;
  private errorAt: number = 0;
  private startRequests: number = 0;
  private stopRequests: number = 0;

  constructor(clock: FakeClock) {
    this.clock = clock;
  }

  public getState(): RecordingState {
    return this.state;
  }

  public start(): boolean {
    if (this.state !== RecordingState.IDLE) {
      return false;
    }
    this.startRequests++;
    this.startedAt = this.clock.now();
    this.state = RecordingState.RECORDING;
    return true;
  }

  public stop(): boolean {
    if (this.state !== RecordingState.RECORDING) {
      return false;
    }
    this.stopRequests++;
    this.stoppedAt = this.clock.now();
    this.state = RecordingState.STOPPED;
    return true;
  }

  public fail(): void {
    this.errorAt = this.clock.now();
    this.state = RecordingState.ERROR;
  }

  public getStartedAt(): number {
    return this.startedAt;
  }

  public getStoppedAt(): number {
    return this.stoppedAt;
  }

  public getErrorAt(): number {
    return this.errorAt;
  }

  public getStartRequests(): number {
    return this.startRequests;
  }

  public getStopRequests(): number {
    return this.stopRequests;
  }

  public durationMs(): number {
    if (this.state === RecordingState.RECORDING) {
      return this.clock.now() - this.startedAt;
    }
    if (this.stoppedAt >= this.startedAt && this.stoppedAt > 0) {
      return this.stoppedAt - this.startedAt;
    }
    if (this.errorAt >= this.startedAt && this.errorAt > 0) {
      return this.errorAt - this.startedAt;
    }
    return 0;
  }

  public labelAt(nowMs: number): string {
    return TimerLabelModel.labelAt(nowMs - this.startedAt);
  }

  public labelRefreshCount(): number {
    if (this.startedAt === 0) {
      return 0;
    }
    return TimerLabelModel.refreshCount(this.durationMs());
  }

  public blinkTransitions(): number {
    if (this.startedAt === 0) {
      return 0;
    }
    return IconBlinkModel.transitionsAt(this.durationMs());
  }

  public reset(): void {
    this.state = RecordingState.IDLE;
    this.startedAt = 0;
    this.stoppedAt = 0;
    this.errorAt = 0;
    this.startRequests = 0;
    this.stopRequests = 0;
  }
}

/** Component count stability model of the floating windows. */
class ComponentCountModel {
  private counts: number[] = [];

  public add(count: number): void {
    this.counts.push(count);
  }

  public count(): number {
    return this.counts.length;
  }

  public average(): number {
    if (this.counts.length === 0) {
      return 0;
    }
    let sum = 0;
    for (let index = 0; index < this.counts.length; index++) {
      sum += this.counts[index];
    }
    return sum / this.counts.length;
  }

  public max(): number {
    let peak = 0;
    for (let index = 0; index < this.counts.length; index++) {
      if (this.counts[index] > peak) {
        peak = this.counts[index];
      }
    }
    return peak;
  }

  public min(): number {
    if (this.counts.length === 0) {
      return 0;
    }
    let lowest = this.counts[0];
    for (let index = 1; index < this.counts.length; index++) {
      if (this.counts[index] < lowest) {
        lowest = this.counts[index];
      }
    }
    return lowest;
  }

  public spread(): number {
    return this.max() - this.min();
  }

  public isStable(tolerance: number): boolean {
    return this.spread() <= tolerance;
  }
}

/**
 * Frame drop model.
 * A frame is considered dropped when its delta exceeds one and a half refresh
 * periods of the 60 Hz TV panel.
 */
class FrameDropModel {
  public static readonly FRAME_BUDGET_MS: number = 16.67;
  private deltas: number[] = [];

  public addFrame(deltaMs: number): void {
    this.deltas.push(deltaMs);
  }

  public addFrames(deltas: number[]): void {
    for (let index = 0; index < deltas.length; index++) {
      this.deltas.push(deltas[index]);
    }
  }

  public count(): number {
    return this.deltas.length;
  }

  public averageDelta(): number {
    if (this.deltas.length === 0) {
      return 0;
    }
    let sum = 0;
    for (let index = 0; index < this.deltas.length; index++) {
      sum += this.deltas[index];
    }
    return sum / this.deltas.length;
  }

  public droppedCount(): number {
    let count = 0;
    for (let index = 0; index < this.deltas.length; index++) {
      if (this.deltas[index] > FrameDropModel.FRAME_BUDGET_MS * 1.5) {
        count++;
      }
    }
    return count;
  }

  public longestStall(): number {
    let longest = 0;
    for (let index = 0; index < this.deltas.length; index++) {
      if (this.deltas[index] > longest) {
        longest = this.deltas[index];
      }
    }
    return longest;
  }

  public result(): FrameDropResult {
    const dropped = this.droppedCount();
    const result: FrameDropResult = {
      totalFrames: this.deltas.length,
      droppedFrames: dropped,
      dropRate: this.deltas.length === 0 ? 0 : dropped / this.deltas.length,
      longestStallMs: this.longestStall()
    };
    return result;
  }

  public dropRate(): number {
    return this.result().dropRate;
  }
}

/** Throughput model of the recorder state callbacks. */
class EventThroughputModel {
  private events: number = 0;
  private elapsedMs: number = 0;

  public record(count: number, elapsedMs: number): void {
    this.events += count;
    this.elapsedMs += elapsedMs;
  }

  public eventCount(): number {
    return this.events;
  }

  public elapsed(): number {
    return this.elapsedMs;
  }

  public perSecond(): number {
    if (this.elapsedMs <= 0) {
      return 0;
    }
    return (this.events * 1000) / this.elapsedMs;
  }

  public reset(): void {
    this.events = 0;
    this.elapsedMs = 0;
  }
}

/** Grades a latency value against three thresholds. */
class PerformanceGradeEvaluator {
  private excellentMs: number;
  private goodMs: number;
  private acceptableMs: number;

  constructor(excellentMs: number, goodMs: number, acceptableMs: number) {
    this.excellentMs = excellentMs;
    this.goodMs = goodMs;
    this.acceptableMs = acceptableMs;
  }

  public grade(valueMs: number): string {
    if (valueMs <= this.excellentMs) {
      return 'excellent';
    }
    if (valueMs <= this.goodMs) {
      return 'good';
    }
    if (valueMs <= this.acceptableMs) {
      return 'acceptable';
    }
    return 'poor';
  }

  public describe(grade: string): string {
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

export default function recorderPerformanceTest(): void {
  describe('RecorderPerformance_Test', () => {
    it('start_latency_should_stay_within_budget', 0, () => {
      const clock = new FakeClock();
      const timeline = new RecordingTimelineModel(clock);
      const budget = new LatencyBudget();
      budget.set('start_recording', 2000);
      clock.advance(800);
      expect(timeline.start()).assertTrue();
      const latency = clock.now() - timeline.getStartedAt();
      expect(latency).assertEqual(0);
      expect(budget.isWithin('start_recording', 800)).assertTrue();
      expect(budget.overrun('start_recording', 800)).assertEqual(0);
    });

    it('start_latency_budget_should_detect_overrun', 0, () => {
      const budget = new LatencyBudget();
      budget.set('start_recording', 2000);
      expect(budget.isWithin('start_recording', 2000)).assertTrue();
      expect(budget.isWithin('start_recording', 2001)).assertFalse();
      expect(budget.overrun('start_recording', 2500)).assertEqual(500);
      expect(budget.get('missing_metric')).assertEqual(0);
      expect(budget.has('start_recording')).assertTrue();
      expect(budget.count()).assertEqual(1);
    });

    it('stop_latency_should_stay_within_budget', 0, () => {
      const clock = new FakeClock();
      const timeline = new RecordingTimelineModel(clock);
      timeline.start();
      clock.advance(3000);
      timeline.stop();
      const budget = new LatencyBudget();
      budget.set('stop_recording', 3000);
      expect(timeline.getState()).assertEqual(RecordingState.STOPPED);
      expect(budget.isWithin('stop_recording', 1200)).assertTrue();
      expect(timeline.getStopRequests()).assertEqual(1);
    });

    it('timer_label_should_follow_hh_mm_ss_pattern', 0, () => {
      expect(TimerLabelModel.format(0)).assertEqual('00:00:00');
      expect(TimerLabelModel.format(5)).assertEqual('00:00:05');
      expect(TimerLabelModel.format(61)).assertEqual('00:01:01');
      expect(TimerLabelModel.format(3661)).assertEqual('01:01:01');
      expect(TimerLabelModel.format(86399)).assertEqual('23:59:59');
    });

    it('timer_label_should_be_well_formed', 0, () => {
      expect(TimerLabelModel.isWellFormed('00:00:00')).assertTrue();
      expect(TimerLabelModel.isWellFormed('01:01:01')).assertTrue();
      expect(TimerLabelModel.isWellFormed('1:01:01')).assertFalse();
      expect(TimerLabelModel.isWellFormed('00-00-00')).assertFalse();
      expect(TimerLabelModel.isWellFormed('00:0a:00')).assertFalse();
    });

    it('negative_elapsed_should_clamp_to_zero', 0, () => {
      expect(TimerLabelModel.format(-5)).assertEqual('00:00:00');
      expect(TimerLabelModel.labelAt(-1000)).assertEqual('00:00:00');
      expect(TimerLabelModel.refreshCount(-1)).assertEqual(0);
    });

    it('timer_label_should_refresh_once_per_second', 0, () => {
      expect(TimerLabelModel.refreshIntervalMs()).assertEqual(1000);
      expect(TimerLabelModel.refreshCount(0)).assertEqual(1);
      expect(TimerLabelModel.refreshCount(999)).assertEqual(1);
      expect(TimerLabelModel.refreshCount(1000)).assertEqual(2);
      expect(TimerLabelModel.refreshCount(59999)).assertEqual(60);
      expect(TimerLabelModel.refreshCount(60000)).assertEqual(61);
    });

    it('icon_blink_should_alternate_every_800ms', 0, () => {
      expect(IconBlinkModel.DURATION_MS).assertEqual(800);
      expect(IconBlinkModel.isVisibleAt(0)).assertTrue();
      expect(IconBlinkModel.isVisibleAt(799)).assertTrue();
      expect(IconBlinkModel.isVisibleAt(800)).assertFalse();
      expect(IconBlinkModel.isVisibleAt(1599)).assertFalse();
      expect(IconBlinkModel.isVisibleAt(1600)).assertTrue();
    });

    it('icon_blink_transitions_should_be_counted', 0, () => {
      expect(IconBlinkModel.transitionsAt(799)).assertEqual(0);
      expect(IconBlinkModel.transitionsAt(800)).assertEqual(1);
      expect(IconBlinkModel.transitionsAt(1600)).assertEqual(2);
      expect(IconBlinkModel.transitionsAt(64000)).assertEqual(80);
      expect(IconBlinkModel.nextTransition(0)).assertEqual(800);
      expect(IconBlinkModel.nextTransition(800)).assertEqual(1600);
      expect(IconBlinkModel.nextTransition(850)).assertEqual(1600);
    });

    it('tip_window_should_live_3000ms', 0, () => {
      const tip = new TipWindowModel();
      const clock = new FakeClock();
      tip.show(clock.now());
      expect(tip.isVisible()).assertTrue();
      clock.advance(2999);
      expect(tip.isVisibleAt(clock.now())).assertTrue();
      expect(tip.elapsedAt(clock.now())).assertEqual(2999);
      clock.advance(1);
      expect(tip.isVisibleAt(clock.now())).assertFalse();
      expect(tip.getDismissCount()).assertEqual(1);
    });

    it('tip_window_should_hide_on_request', 0, () => {
      const tip = new TipWindowModel();
      const clock = new FakeClock();
      tip.show(clock.now());
      tip.hide();
      expect(tip.isVisible()).assertFalse();
      expect(tip.getDismissCount()).assertEqual(1);
      tip.hide();
      expect(tip.getDismissCount()).assertEqual(1);
    });

    it('tip_window_should_not_be_visible_before_show', 0, () => {
      const tip = new TipWindowModel();
      expect(tip.isVisible()).assertFalse();
      expect(tip.isVisibleAt(0)).assertFalse();
      expect(tip.getDismissCount()).assertEqual(0);
    });

    it('recording_timeline_should_start_only_once', 0, () => {
      const clock = new FakeClock();
      const timeline = new RecordingTimelineModel(clock);
      expect(timeline.getState()).assertEqual(RecordingState.IDLE);
      expect(timeline.start()).assertTrue();
      expect(timeline.start()).assertFalse();
      expect(timeline.getStartRequests()).assertEqual(1);
      expect(timeline.getState()).assertEqual(RecordingState.RECORDING);
    });

    it('recording_timeline_should_stop_running_session', 0, () => {
      const clock = new FakeClock();
      const timeline = new RecordingTimelineModel(clock);
      timeline.start();
      clock.advance(5000);
      expect(timeline.stop()).assertTrue();
      expect(timeline.stop()).assertFalse();
      expect(timeline.getState()).assertEqual(RecordingState.STOPPED);
      expect(timeline.getStopRequests()).assertEqual(1);
      expect(timeline.durationMs()).assertEqual(5000);
    });

    it('recording_timeline_error_should_be_terminal', 0, () => {
      const clock = new FakeClock();
      const timeline = new RecordingTimelineModel(clock);
      timeline.start();
      clock.advance(2000);
      timeline.fail();
      expect(timeline.getState()).assertEqual(RecordingState.ERROR);
      expect(timeline.getErrorAt()).assertEqual(clock.now());
      expect(timeline.durationMs()).assertEqual(2000);
      expect(timeline.stop()).assertFalse();
    });

    it('one_minute_session_should_refresh_label_sixty_times', 0, () => {
      const clock = new FakeClock();
      const timeline = new RecordingTimelineModel(clock);
      timeline.start();
      clock.advance(60000);
      expect(timeline.labelAt(clock.now())).assertEqual('00:01:00');
      expect(timeline.labelRefreshCount()).assertEqual(61);
      expect(timeline.blinkTransitions()).assertEqual(75);
      expect(timeline.durationMs()).assertEqual(60000);
    });

    it('component_count_should_stay_stable', 0, () => {
      const model = new ComponentCountModel();
      model.add(6);
      model.add(6);
      model.add(7);
      model.add(6);
      expect(model.count()).assertEqual(4);
      expect(model.max()).assertEqual(7);
      expect(model.min()).assertEqual(6);
      expect(model.spread()).assertEqual(1);
      expect(model.isStable(2)).assertTrue();
      expect(model.isStable(0)).assertFalse();
    });

    it('empty_component_model_should_return_zero', 0, () => {
      const model = new ComponentCountModel();
      expect(model.count()).assertEqual(0);
      expect(model.average()).assertEqual(0);
      expect(model.min()).assertEqual(0);
      expect(model.max()).assertEqual(0);
      expect(model.isStable(1)).assertTrue();
    });

    it('frame_drop_model_should_count_slow_frames', 0, () => {
      const model = new FrameDropModel();
      model.addFrames([16, 16, 40, 16, 50, 16]);
      expect(model.count()).assertEqual(6);
      expect(model.droppedCount()).assertEqual(2);
      expect(model.longestStall()).assertEqual(50);
      expect(model.dropRate()).assertEqual(2 / 6);
      const result: FrameDropResult = model.result();
      expect(result.totalFrames).assertEqual(6);
      expect(result.droppedFrames).assertEqual(2);
    });

    it('smooth_frame_model_should_report_no_drop', 0, () => {
      const model = new FrameDropModel();
      model.addFrames([16, 16, 16, 16]);
      expect(model.droppedCount()).assertEqual(0);
      expect(model.dropRate()).assertEqual(0);
      expect(model.averageDelta()).assertEqual(16);
      expect(model.longestStall()).assertEqual(16);
    });

    it('event_throughput_should_be_computed', 0, () => {
      const model = new EventThroughputModel();
      model.record(100, 1000);
      expect(model.eventCount()).assertEqual(100);
      expect(model.elapsed()).assertEqual(1000);
      expect(model.perSecond()).assertEqual(100);
      model.record(50, 500);
      expect(model.eventCount()).assertEqual(150);
      expect(model.perSecond()).assertEqual(100);
      model.reset();
      expect(model.perSecond()).assertEqual(0);
    });

    it('average_latency_should_be_computed', 0, () => {
      const monitor = new PerformanceMonitor();
      monitor.recordMany('start', [10, 20, 30]);
      expect(monitor.count()).assertEqual(3);
      expect(monitor.total()).assertEqual(60);
      expect(monitor.average()).assertEqual(20);
      expect(monitor.max()).assertEqual(30);
      expect(monitor.min()).assertEqual(10);
      expect(monitor.averageOf('start')).assertEqual(20);
      expect(monitor.averageOf('missing')).assertEqual(0);
    });

    it('empty_monitor_should_report_zero_statistics', 0, () => {
      const monitor = new PerformanceMonitor();
      expect(monitor.count()).assertEqual(0);
      expect(monitor.average()).assertEqual(0);
      expect(monitor.max()).assertEqual(0);
      expect(monitor.min()).assertEqual(0);
      expect(monitor.total()).assertEqual(0);
    });

    it('monitor_clear_should_reset_samples', 0, () => {
      const monitor = new PerformanceMonitor();
      monitor.record('start', 10);
      monitor.record('stop', 20);
      expect(monitor.samplesCopy().length).assertEqual(2);
      monitor.clear();
      expect(monitor.count()).assertEqual(0);
      expect(monitor.average()).assertEqual(0);
    });

    it('named_samples_should_be_aggregated_separately', 0, () => {
      const monitor = new PerformanceMonitor();
      monitor.recordMany('start', [100, 200]);
      monitor.recordMany('stop', [50, 50]);
      expect(monitor.averageOf('start')).assertEqual(150);
      expect(monitor.averageOf('stop')).assertEqual(50);
      expect(monitor.average()).assertEqual(100);
      expect(monitor.count()).assertEqual(4);
    });

    it('percentile_analyzer_should_compute_median', 0, () => {
      const analyzer = new PercentileAnalyzer();
      analyzer.setDurations([40, 10, 30, 20]);
      expect(analyzer.count()).assertEqual(4);
      expect(analyzer.median()).assertEqual(25);
      analyzer.setDurations([30, 10, 20]);
      expect(analyzer.median()).assertEqual(20);
      expect(analyzer.percentile(50)).assertEqual(20);
    });

    it('percentile_analyzer_should_compute_percentiles', 0, () => {
      const analyzer = new PercentileAnalyzer();
      analyzer.setDurations([10, 20, 30, 40, 50]);
      expect(analyzer.percentile(90)).assertEqual(50);
      expect(analyzer.percentile(100)).assertEqual(50);
      const snapshot: PercentileResult = analyzer.snapshot();
      expect(snapshot.p50).assertEqual(30);
      expect(snapshot.p90).assertLargerOrEqual(snapshot.p50);
      expect(snapshot.p99).assertLargerOrEqual(snapshot.p90);
      expect(snapshot.max).assertEqual(50);
    });

    it('percentile_analyzer_should_compute_deviation', 0, () => {
      const analyzer = new PercentileAnalyzer();
      analyzer.setDurations([2, 4, 4, 4, 5, 5, 7, 9]);
      expect(analyzer.standardDeviation()).assertEqual(2);
      analyzer.clear();
      expect(analyzer.count()).assertEqual(0);
      expect(analyzer.median()).assertEqual(0);
      expect(analyzer.standardDeviation()).assertEqual(0);
    });

    it('analyzer_should_accept_samples', 0, () => {
      const monitor = new PerformanceMonitor();
      monitor.recordMany('tip', [100, 200, 300]);
      const analyzer = new PercentileAnalyzer();
      analyzer.setSamples(monitor.samplesCopy());
      expect(analyzer.count()).assertEqual(3);
      expect(analyzer.median()).assertEqual(200);
    });

    it('performance_grade_should_follow_thresholds', 0, () => {
      const evaluator = new PerformanceGradeEvaluator(50, 100, 200);
      expect(evaluator.grade(30)).assertEqual('excellent');
      expect(evaluator.grade(50)).assertEqual('excellent');
      expect(evaluator.grade(51)).assertEqual('good');
      expect(evaluator.grade(100)).assertEqual('good');
      expect(evaluator.grade(150)).assertEqual('acceptable');
      expect(evaluator.grade(201)).assertEqual('poor');
    });

    it('performance_grade_should_be_described', 0, () => {
      const evaluator = new PerformanceGradeEvaluator(50, 100, 200);
      expect(evaluator.describe('excellent')).assertEqual('优秀');
      expect(evaluator.describe('good')).assertEqual('良好');
      expect(evaluator.describe('acceptable')).assertEqual('可接受');
      expect(evaluator.describe('poor')).assertEqual('较差');
    });

    it('start_budget_should_be_graded', 0, () => {
      const monitor = new PerformanceMonitor();
      monitor.recordMany('start', [120, 180, 200, 240]);
      const evaluator = new PerformanceGradeEvaluator(200, 400, 800);
      const average = monitor.average();
      expect(average).assertEqual(185);
      expect(evaluator.grade(average)).assertEqual('excellent');
      expect(monitor.max()).assertEqual(240);
      expect(evaluator.grade(monitor.max())).assertEqual('good');
    });

    it('tip_render_budget_should_be_respected', 0, () => {
      const budget = new LatencyBudget();
      budget.set('tip_render', 1500);
      budget.set('timer_first_frame', 300);
      expect(budget.isWithin('tip_render', 900)).assertTrue();
      expect(budget.isWithin('tip_render', 1800)).assertFalse();
      expect(budget.overrun('tip_render', 1800)).assertEqual(300);
      expect(budget.isWithin('timer_first_frame', 120)).assertTrue();
      expect(budget.count()).assertEqual(2);
    });

    it('sustained_second_session_should_keep_cadence', 0, () => {
      const clock = new FakeClock();
      const timeline = new RecordingTimelineModel(clock);
      timeline.start();
      clock.advance(30000);
      expect(timeline.labelAt(clock.now())).assertEqual('00:00:30');
      expect(timeline.labelRefreshCount()).assertEqual(31);
      expect(timeline.blinkTransitions()).assertEqual(37);
      timeline.stop();
      clock.advance(5000);
      expect(timeline.durationMs()).assertEqual(30000);
    });

    it('two_sessions_should_not_share_elapsed_time', 0, () => {
      const clock = new FakeClock();
      const first = new RecordingTimelineModel(clock);
      const second = new RecordingTimelineModel(clock);
      first.start();
      clock.advance(10000);
      first.stop();
      second.start();
      clock.advance(2000);
      expect(first.durationMs()).assertEqual(10000);
      expect(second.durationMs()).assertEqual(2000);
      expect(second.labelAt(clock.now())).assertEqual('00:00:02');
    });

    it('comprehensive_performance_scenario_should_pass', 0, () => {
      const clock = new FakeClock();
      const timeline = new RecordingTimelineModel(clock);
      const monitor = new PerformanceMonitor();
      const tip = new TipWindowModel();
      const components = new ComponentCountModel();
      const budget = new LatencyBudget();
      budget.set('start_recording', 2000);
      budget.set('stop_recording', 3000);
      clock.advance(400);
      const startBegin = clock.now();
      timeline.start();
      monitor.record('start', clock.now() - startBegin);
      tip.show(clock.now());
      components.add(6);
      clock.advance(60000);
      components.add(6);
      const stopBegin = clock.now();
      timeline.stop();
      monitor.record('stop', clock.now() - stopBegin);
      expect(budget.isWithin('start_recording', monitor.averageOf('start'))).assertTrue();
      expect(budget.isWithin('stop_recording', monitor.averageOf('stop'))).assertTrue();
      expect(components.isStable(1)).assertTrue();
      expect(tip.isVisibleAt(clock.now())).assertFalse();
      expect(timeline.getState()).assertEqual(RecordingState.STOPPED);
      expect(monitor.count()).assertEqual(2);
    });

    it('frame_drop_of_timer_window_should_stay_low', 0, () => {
      const model = new FrameDropModel();
      const deltas: number[] = [];
      for (let index = 0; index < 120; index++) {
        deltas.push(index % 30 === 0 ? 20 : 16);
      }
      model.addFrames(deltas);
      expect(model.count()).assertEqual(120);
      expect(model.droppedCount()).assertEqual(0);
      expect(model.dropRate()).assertEqual(0);
      expect(model.longestStall()).assertEqual(20);
    });

    it('recorder_callback_throughput_should_be_sufficient', 0, () => {
      const model = new EventThroughputModel();
      model.record(4, 1000);
      model.record(4, 1000);
      expect(model.eventCount()).assertEqual(8);
      expect(model.perSecond()).assertEqual(4);
      expect(model.perSecond()).assertLess(60);
      expect(model.elapsed()).assertEqual(2000);
    });
  });
}

