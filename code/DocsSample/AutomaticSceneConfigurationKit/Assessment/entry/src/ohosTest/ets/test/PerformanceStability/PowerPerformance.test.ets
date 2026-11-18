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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  DELAY_KEY_NAVIGATION,
  ID_BEGIN_BUTTON,
  ID_INDEX_TITLE,
  ID_QUERY_CONFIG_BUTTON,
  ID_QUERY_STATE_BUTTON,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  clickIndexButton,
  findById,
  getDriver,
  launchAssessmentApp,
  measureActionMs,
  pressAndWait,
  serializedDelay,
  waitForIndexPage
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Timing constants of the assessment sample.
const COUNTDOWN_INTERVAL: number = 1000;
const SECONDS_PER_MINUTE: number = 60;
const MILLIS_PER_SECOND: number = 1000;
const MILLIS_PER_MINUTE: number = 60000;
const DURATION_TEN_MINUTES: number = 600000;
const DURATION_SIXTY_MINUTES: number = 3600000;

// Rendering constants. The sample runs on a 60 Hz panel, so one frame has a budget of 16.7 ms.
// The thresholds below are intentionally generous: the countdown repaints one text node and one
// ring per second, therefore one tick must cost far less than the frame budget. The assertions
// are paired with a deterministic model so that a slow emulator cannot turn a healthy page into
// a failure.
const FRAME_BUDGET_MS: number = 16.7;
const JANK_THRESHOLD_MS: number = 33.4;
const MAX_RENDER_COST_PER_TICK_MS: number = 8;
const MAX_FRAME_UTILIZATION_PERCENT: number = 60;
const MAX_JANK_RATIO_PERCENT: number = 5;
const MAX_TICK_DRIFT_MS: number = 100;
const MAX_DISPLAY_DRIFT_SECONDS: number = 2;
const MAX_APPSTORAGE_WRITES_PER_MINUTE: number = 30;

// CPU and GPU proxy constants. One tick of the countdown costs a fixed amount of processor time
// and a fixed amount of paint work. The proxy values are relative units, only their ratios are
// asserted.
const CPU_UNITS_PER_TICK: number = 4;
const GPU_UNITS_PER_TICK: number = 6;
const CPU_UNITS_PER_FRAME: number = 2;
const GPU_UNITS_PER_FRAME: number = 5;
const CPU_UNITS_PER_APPSTORAGE_WRITE: number = 3;
const MAX_CPU_BUDGET_UNITS_PER_SECOND: number = 100;
const MAX_GPU_BUDGET_UNITS_PER_SECOND: number = 100;

const MODEL_ITERATIONS: number = 2000;
const MODEL_BUDGET_MS: number = 5000;
const UI_ROUNDS: number = 3;
const UI_ACTION_BUDGET_MS: number = 5000;
// Generous render budgets of the guarded UI case. The measurement wraps the ability launch and
// the first rendered frame, so it is compared with five seconds; a pure page render of the
// sample is far below three seconds on a healthy device.
const BUDGET_PAGE_RENDER_MS: number = 5000;

// Case identifiers, the trailing number is the sequence number of the case inside the suite.
const CASE_001: string = BUNDLE + 'PowerPerformance_001';
const CASE_002: string = BUNDLE + 'PowerPerformance_002';
const CASE_003: string = BUNDLE + 'PowerPerformance_003';
const CASE_004: string = BUNDLE + 'PowerPerformance_004';
const CASE_005: string = BUNDLE + 'PowerPerformance_005';
const CASE_006: string = BUNDLE + 'PowerPerformance_006';
const CASE_007: string = BUNDLE + 'PowerPerformance_007';
const CASE_008: string = BUNDLE + 'PowerPerformance_008';
const CASE_009: string = BUNDLE + 'PowerPerformance_009';
const CASE_010: string = BUNDLE + 'PowerPerformance_010';
const CASE_011: string = BUNDLE + 'PowerPerformance_011';
const CASE_012: string = BUNDLE + 'PowerPerformance_012';
const CASE_013: string = BUNDLE + 'PowerPerformance_013';
const CASE_014: string = BUNDLE + 'PowerPerformance_014';
const CASE_015: string = BUNDLE + 'PowerPerformance_015';
const CASE_016: string = BUNDLE + 'PowerPerformance_016';
const CASE_017: string = BUNDLE + 'PowerPerformance_017';
const CASE_018: string = BUNDLE + 'PowerPerformance_018';
const CASE_019: string = BUNDLE + 'PowerPerformance_019';
const CASE_020: string = BUNDLE + 'PowerPerformance_020';
const CASE_021: string = BUNDLE + 'PowerPerformance_021';
const CASE_022: string = BUNDLE + 'PowerPerformance_022';
const CASE_023: string = BUNDLE + 'PowerPerformance_023';
const CASE_024: string = BUNDLE + 'PowerPerformance_024';
const CASE_025: string = BUNDLE + 'PowerPerformance_025';
const CASE_026: string = BUNDLE + 'PowerPerformance_026';
const CASE_027: string = BUNDLE + 'PowerPerformance_027';
const CASE_028: string = BUNDLE + 'PowerPerformance_028';
const CASE_029: string = BUNDLE + 'PowerPerformance_029';

/**
 * Kind of a measured performance sample.
 */
enum MetricKind {
  COUNTDOWN_TICK = 'countdown_tick',
  FRAME = 'frame',
  APP_STORAGE_WRITE = 'app_storage_write',
  RENDER = 'render',
  QUERY = 'query'
}

/**
 * Performance band of an aggregated sample population.
 */
enum PerformanceBand {
  EXCELLENT = 'excellent',
  GOOD = 'good',
  ACCEPTABLE = 'acceptable',
  POOR = 'poor'
}

/**
 * One measured performance sample.
 */
interface MetricSample {
  kind: MetricKind;
  valueMs: number;
  sequence: number;
}

/**
 * Aggregated statistics of one metric kind.
 */
interface MetricSummary {
  kind: MetricKind;
  count: number;
  averageMs: number;
  peakMs: number;
  p50Ms: number;
  p95Ms: number;
  jankCount: number;
}

/**
 * Result of one countdown accuracy comparison.
 */
interface AccuracyResult {
  expectedSeconds: number;
  displayedSeconds: number;
  driftSeconds: number;
  accurate: boolean;
}

/**
 * Numeric helper shared by the performance models.
 */
class PerformanceMath {
  public static clamp(value: number, low: number, high: number): number {
    if (value < low) {
      return low;
    }
    if (value > high) {
      return high;
    }
    return value;
  }

  public static percentOf(part: number, whole: number): number {
    if (whole <= 0) {
      return 0;
    }
    return Math.round(part * 100 / whole);
  }

  public static roundTwo(value: number): number {
    return Math.round(value * 100) / 100;
  }

  public static ceilDiv(dividend: number, divisor: number): number {
    if (divisor <= 0) {
      return 0;
    }
    const normalized: number = dividend < 0 ? 0 : dividend;
    return Math.floor((normalized + divisor - 1) / divisor);
  }

  /**
   * Pads a non negative integer to two characters, the countdown text is padded this way.
   *
   * @param value value to pad.
   * @returns the padded text.
   */
  public static padTwo(value: number): string {
    const normalized: number = Math.floor(value < 0 ? 0 : value);
    return normalized < 10 ? '0' + normalized.toString() : normalized.toString();
  }
}

/**
 * Accumulates the performance samples of the countdown and of the page renders.
 *
 * The population keeps the insertion order and the sequence number of every sample, so the
 * percentile computation works on a sorted copy and the original trace can still be replayed.
 */
class MetricCollector {
  private samples: MetricSample[] = [];
  private sequenceSeed: number = 0;

  /**
   * Records one sample.
   *
   * @param kind metric kind.
   * @param valueMs measured value in milliseconds.
   * @returns true when the sample was accepted.
   */
  public record(kind: MetricKind, valueMs: number): boolean {
    if (valueMs < 0) {
      return false;
    }
    this.samples.push({
      kind: kind,
      valueMs: valueMs,
      sequence: this.sequenceSeed
    });
    this.sequenceSeed++;
    return true;
  }

  /**
   * Records the same value several times.
   *
   * @param kind metric kind.
   * @param valueMs measured value in milliseconds.
   * @param times number of samples.
   * @returns the number of accepted samples.
   */
  public recordTimes(kind: MetricKind, valueMs: number, times: number): number {
    let accepted: number = 0;
    for (let i = 0; i < times; i++) {
      if (this.record(kind, valueMs)) {
        accepted++;
      }
    }
    return accepted;
  }

  public count(): number {
    return this.samples.length;
  }

  public countOf(kind: MetricKind): number {
    return this.filterBy(kind).length;
  }

  /**
   * Filters the population by kind.
   *
   * @param kind metric kind.
   * @returns the matching samples, the returned array is an independent copy.
   */
  public filterBy(kind: MetricKind): MetricSample[] {
    const filtered: MetricSample[] = [];
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].kind === kind) {
        filtered.push({
          kind: this.samples[i].kind,
          valueMs: this.samples[i].valueMs,
          sequence: this.samples[i].sequence
        });
      }
    }
    return filtered;
  }

  /**
   * Returns the values of one kind in ascending order.
   *
   * @param kind metric kind.
   * @returns the sorted values.
   */
  private sortedValues(kind: MetricKind): number[] {
    const filtered: MetricSample[] = this.filterBy(kind);
    const values: number[] = [];
    for (let i = 0; i < filtered.length; i++) {
      values.push(filtered[i].valueMs);
    }
    for (let i = 1; i < values.length; i++) {
      const current: number = values[i];
      let j: number = i - 1;
      while (j >= 0 && values[j] > current) {
        values[j + 1] = values[j];
        j--;
      }
      values[j + 1] = current;
    }
    return values;
  }

  public averageOf(kind: MetricKind): number {
    const filtered: MetricSample[] = this.filterBy(kind);
    if (filtered.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < filtered.length; i++) {
      total += filtered[i].valueMs;
    }
    return total / filtered.length;
  }

  public peakOf(kind: MetricKind): number {
    const sorted: number[] = this.sortedValues(kind);
    return sorted.length === 0 ? 0 : sorted[sorted.length - 1];
  }

  /**
   * Computes a nearest rank percentile.
   *
   * @param kind metric kind.
   * @param percent percentile in the closed interval 0..100.
   * @returns the value at the percentile, 0 for an empty population.
   */
  public percentileOf(kind: MetricKind, percent: number): number {
    const sorted: number[] = this.sortedValues(kind);
    if (sorted.length === 0) {
      return 0;
    }
    const bounded: number = PerformanceMath.clamp(percent, 0, 100);
    if (bounded <= 0) {
      return sorted[0];
    }
    if (bounded >= 100) {
      return sorted[sorted.length - 1];
    }
    let index: number = PerformanceMath.ceilDiv(bounded * sorted.length, 100) - 1;
    index = PerformanceMath.clamp(index, 0, sorted.length - 1);
    return sorted[index];
  }

  /**
   * Counts the samples above the jank threshold.
   *
   * @param kind metric kind.
   * @returns the number of janky samples.
   */
  public jankCountOf(kind: MetricKind): number {
    const filtered: MetricSample[] = this.filterBy(kind);
    let count: number = 0;
    for (let i = 0; i < filtered.length; i++) {
      if (filtered[i].valueMs > JANK_THRESHOLD_MS) {
        count++;
      }
    }
    return count;
  }

  /**
   * Builds the aggregated summary of one kind.
   *
   * @param kind metric kind.
   * @returns the summary.
   */
  public summaryOf(kind: MetricKind): MetricSummary {
    return {
      kind: kind,
      count: this.countOf(kind),
      averageMs: PerformanceMath.roundTwo(this.averageOf(kind)),
      peakMs: PerformanceMath.roundTwo(this.peakOf(kind)),
      p50Ms: this.percentileOf(kind, 50),
      p95Ms: this.percentileOf(kind, 95),
      jankCount: this.jankCountOf(kind)
    };
  }

  public kinds(): MetricKind[] {
    const seen: MetricKind[] = [];
    for (let i = 0; i < this.samples.length; i++) {
      if (seen.indexOf(this.samples[i].kind) < 0) {
        seen.push(this.samples[i].kind);
      }
    }
    return seen;
  }

  public reset(): void {
    this.samples = [];
    this.sequenceSeed = 0;
  }

  public toString(): string {
    return `MetricCollector{samples=${this.samples.length}, kinds=${this.kinds().length}}`;
  }
}

/**
 * Counts the countdown ticks of the exam page and tracks their drift.
 *
 * The countdown is driven by a 1000 ms interval and the page decrements the remaining seconds on
 * every callback. The trace keeps the wall clock timestamp of every tick, so a late tick shows up
 * as a positive drift, a missed tick shows up as a gap and the displayed value can be compared
 * with the value that the wall clock requires.
 */
class CountdownTrace {
  private readonly intervalMs: number;
  private timestamps: number[] = [];
  private secondsLeft: number = 0;
  private lateTicks: number = 0;
  private readonly lateThresholdMs: number;

  constructor(intervalMs: number, lateThresholdMs: number) {
    this.intervalMs = intervalMs > 0 ? intervalMs : COUNTDOWN_INTERVAL;
    this.lateThresholdMs = lateThresholdMs > 0 ? lateThresholdMs : MAX_TICK_DRIFT_MS;
  }

  /**
   * Records one tick.
   *
   * @param timestampMs wall clock timestamp of the tick.
   * @param displayBeforeSeconds remaining seconds before the tick is applied.
   * @returns true when the tick was accepted.
   */
  public tick(timestampMs: number, displayBeforeSeconds: number): boolean {
    if (timestampMs < 0) {
      return false;
    }
    if (this.timestamps.length > 0) {
      const previous: number = this.timestamps[this.timestamps.length - 1];
      if (timestampMs < previous) {
        return false;
      }
      if (timestampMs - previous > this.intervalMs + this.lateThresholdMs) {
        this.lateTicks++;
      }
    }
    this.timestamps.push(timestampMs);
    if (displayBeforeSeconds > 0) {
      this.secondsLeft = displayBeforeSeconds - 1;
    } else {
      this.secondsLeft = 0;
    }
    return true;
  }

  /**
   * Records a run of nominal ticks.
   *
   * @param times number of ticks.
   * @param startMs timestamp of the first tick.
   * @param startSeconds remaining seconds before the first tick.
   * @returns the number of accepted ticks.
   */
  public tickAtInterval(times: number, startMs: number, startSeconds: number): number {
    let accepted: number = 0;
    let display: number = startSeconds;
    for (let i = 0; i < times; i++) {
      if (this.tick(startMs + i * this.intervalMs, display)) {
        accepted++;
      }
      display = display > 0 ? display - 1 : 0;
    }
    return accepted;
  }

  public count(): number {
    return this.timestamps.length;
  }

  public remainingSeconds(): number {
    return this.secondsLeft;
  }

  public getIntervalMs(): number {
    return this.intervalMs;
  }

  public getLateTicks(): number {
    return this.lateTicks;
  }

  /**
   * Computes the accumulated drift against the nominal cadence.
   *
   * @returns the drift in milliseconds, zero for fewer than two ticks.
   */
  public driftMs(): number {
    const size: number = this.timestamps.length;
    if (size < 2) {
      return 0;
    }
    const expected: number = (size - 1) * this.intervalMs;
    return (this.timestamps[size - 1] - this.timestamps[0]) - expected;
  }

  public averageIntervalMs(): number {
    const size: number = this.timestamps.length;
    if (size < 2) {
      return 0;
    }
    const span: number = this.timestamps[size - 1] - this.timestamps[0];
    return PerformanceMath.ceilDiv(span, size - 1);
  }

  /**
   * Compares the displayed countdown with the value the wall clock requires.
   *
   * @param elapsedMs wall clock time since the countdown was started.
   * @param initialSeconds remaining seconds when the countdown was started.
   * @returns the accuracy comparison.
   */
  public compareWithWallClock(elapsedMs: number, initialSeconds: number): AccuracyResult {
    const elapsedSeconds: number = Math.floor(elapsedMs / this.intervalMs);
    const expected: number = initialSeconds > elapsedSeconds ? initialSeconds - elapsedSeconds : 0;
    const displayed: number = this.secondsLeft;
    const drift: number = Math.abs(expected - displayed);
    return {
      expectedSeconds: expected,
      displayedSeconds: displayed,
      driftSeconds: drift,
      accurate: drift <= MAX_DISPLAY_DRIFT_SECONDS
    };
  }

  /**
   * Formats the remaining seconds as MM:SS, the same way the exam page does.
   *
   * @returns the formatted text.
   */
  public formatMmSs(): string {
    const minutes: number = Math.floor(this.secondsLeft / SECONDS_PER_MINUTE);
    const seconds: number = this.secondsLeft % SECONDS_PER_MINUTE;
    return PerformanceMath.padTwo(minutes) + ':' + PerformanceMath.padTwo(seconds);
  }

  public reset(): void {
    this.timestamps = [];
    this.secondsLeft = 0;
    this.lateTicks = 0;
  }

  public toString(): string {
    return `CountdownTrace{ticks=${this.timestamps.length}, drift=${this.driftMs()}, late=${this.lateTicks}}`;
  }
}

/**
 * Models the frame budget of the countdown repaint.
 *
 * Every tick repaints the countdown text and the progress ring. The frames of one repaint are
 * accounted against the 60 Hz budget; a frame above the budget is a dropped frame and a frame
 * above the jank threshold is a visible stall.
 */
class RenderCostModel {
  private readonly budgetMs: number;
  private frames: number[] = [];
  private repaints: number = 0;

  constructor(budgetMs: number) {
    this.budgetMs = budgetMs > 0 ? budgetMs : FRAME_BUDGET_MS;
  }

  /**
   * Accounts one repaint that took the given time.
   *
   * @param costMs duration of the repaint in milliseconds.
   * @returns true when the repaint was accepted.
   */
  public repaint(costMs: number): boolean {
    if (costMs <= 0) {
      return false;
    }
    this.repaints++;
    this.frames.push(costMs);
    if (costMs > this.budgetMs) {
      this.frames.push(costMs);
    }
    return true;
  }

  /**
   * Accounts several identical repaints.
   *
   * @param costMs duration of one repaint.
   * @param times number of repaints.
   * @returns the number of accepted repaints.
   */
  public repaintTimes(costMs: number, times: number): number {
    let accepted: number = 0;
    for (let i = 0; i < times; i++) {
      if (this.repaint(costMs)) {
        accepted++;
      }
    }
    return accepted;
  }

  public frameCount(): number {
    return this.frames.length;
  }

  public repaintCount(): number {
    return this.repaints;
  }

  public consumedMs(): number {
    let total: number = 0;
    for (let i = 0; i < this.frames.length; i++) {
      total += this.frames[i];
    }
    return total;
  }

  public averageCostMs(): number {
    if (this.frames.length === 0) {
      return 0;
    }
    return PerformanceMath.roundTwo(this.consumedMs() / this.frames.length);
  }

  public peakCostMs(): number {
    if (this.frames.length === 0) {
      return 0;
    }
    let peak: number = this.frames[0];
    for (let i = 1; i < this.frames.length; i++) {
      if (this.frames[i] > peak) {
        peak = this.frames[i];
      }
    }
    return peak;
  }

  public jankCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.frames.length; i++) {
      if (this.frames[i] > JANK_THRESHOLD_MS) {
        count++;
      }
    }
    return count;
  }

  /**
   * Computes how much of the frame budget the repaints consume.
   *
   * @returns the utilization in percent.
   */
  public utilizationPercent(): number {
    if (this.frames.length === 0) {
      return 0;
    }
    return PerformanceMath.percentOf(this.consumedMs(), this.frames.length * this.budgetMs);
  }

  public isWithinBudget(): boolean {
    return this.utilizationPercent() <= MAX_FRAME_UTILIZATION_PERCENT;
  }

  public getBudget(): number {
    return this.budgetMs;
  }

  public reset(): void {
    this.frames = [];
    this.repaints = 0;
  }

  public toString(): string {
    return `RenderCostModel{frames=${this.frames.length}, avg=${this.averageCostMs()}, utilization=${this.utilizationPercent()}%}`;
  }
}

/**
 * Counts the AppStorage writes of a session.
 *
 * The controller publishes the assessment state, the event type, the event code, the event
 * message, the event sequence and the event log on every callback. The countdown itself never
 * writes to AppStorage, so the write frequency must stay proportional to the number of
 * assessment events, not to the number of ticks.
 */
class AppStorageWriteCounter {
  private writes: number = 0;
  private readonly perEvent: number;
  private events: number = 0;

  constructor(perEvent: number) {
    this.perEvent = perEvent > 0 ? perEvent : 6;
  }

  /**
   * Accounts the writes of one assessment event.
   *
   * @returns the number of accounted writes.
   */
  public eventArrived(): number {
    this.events++;
    this.writes += this.perEvent;
    return this.perEvent;
  }

  /**
   * Accounts the writes of several assessment events.
   *
   * @param times number of events.
   * @returns the number of accounted writes.
   */
  public eventsArrived(times: number): number {
    let accounted: number = 0;
    for (let i = 0; i < times; i++) {
      accounted += this.eventArrived();
    }
    return accounted;
  }

  public count(): number {
    return this.writes;
  }

  public eventCount(): number {
    return this.events;
  }

  public valueOf(): number {
    return this.writes;
  }

  public perEventCount(): number {
    return this.perEvent;
  }

  /**
   * Computes the write frequency of a session.
   *
   * @param durationMs duration of the session.
   * @returns the number of writes per minute.
   */
  public writesPerMinute(durationMs: number): number {
    if (durationMs <= 0) {
      return 0;
    }
    return PerformanceMath.ceilDiv(this.writes * MILLIS_PER_MINUTE, durationMs);
  }

  public isWithinFrequencyBudget(durationMs: number): boolean {
    return this.writesPerMinute(durationMs) <= MAX_APPSTORAGE_WRITES_PER_MINUTE;
  }

  public reset(): void {
    this.writes = 0;
    this.events = 0;
  }

  public toString(): string {
    return `AppStorageWriteCounter{writes=${this.writes}, events=${this.events}}`;
  }
}

/**
 * Models the processor and the graphics load of the assessment pages.
 *
 * The sample has no access to the real counters of the processor, so both loads are expressed in
 * relative units: one tick of the countdown, one rendered frame and one AppStorage write each
 * cost a fixed number of units. The budget is expressed per second, which makes the load of a
 * countdown directly comparable with the load of a continuously animating page.
 */
class CpuGpuProxyModel {
  private cpuUnits: number = 0;
  private gpuUnits: number = 0;
  private seconds: number = 0;

  /**
   * Accounts the work of one countdown tick.
   *
   * @param times number of ticks.
   * @returns the accounted processor units.
   */
  public addTicks(times: number): number {
    if (times <= 0) {
      return 0;
    }
    const units: number = CPU_UNITS_PER_TICK * times;
    this.cpuUnits += units;
    this.gpuUnits += GPU_UNITS_PER_TICK * times;
    return units;
  }

  /**
   * Accounts the work of rendered frames.
   *
   * @param times number of frames.
   * @returns the accounted processor units.
   */
  public addFrames(times: number): number {
    if (times <= 0) {
      return 0;
    }
    const units: number = CPU_UNITS_PER_FRAME * times;
    this.cpuUnits += units;
    this.gpuUnits += GPU_UNITS_PER_FRAME * times;
    return units;
  }

  /**
   * Accounts the work of AppStorage writes.
   *
   * @param times number of writes.
   * @returns the accounted processor units.
   */
  public addAppStorageWrites(times: number): number {
    if (times <= 0) {
      return 0;
    }
    const units: number = CPU_UNITS_PER_APPSTORAGE_WRITE * times;
    this.cpuUnits += units;
    return units;
  }

  /**
   * Sets the wall clock span that the accounted work belongs to.
   *
   * @param durationMs duration of the session.
   * @returns true when the duration was accepted.
   */
  public setDuration(durationMs: number): boolean {
    if (durationMs <= 0) {
      return false;
    }
    this.seconds = durationMs / MILLIS_PER_SECOND;
    return true;
  }

  public cpu(): number {
    return this.cpuUnits;
  }

  public gpu(): number {
    return this.gpuUnits;
  }

  public durationSeconds(): number {
    return this.seconds;
  }

  /**
   * Computes the processor load per second.
   *
   * @returns the processor units per second, zero when no duration was set.
   */
  public cpuPerSecond(): number {
    if (this.seconds <= 0) {
      return 0;
    }
    return PerformanceMath.roundTwo(this.cpuUnits / this.seconds);
  }

  /**
   * Computes the graphics load per second.
   *
   * @returns the graphics units per second, zero when no duration was set.
   */
  public gpuPerSecond(): number {
    if (this.seconds <= 0) {
      return 0;
    }
    return PerformanceMath.roundTwo(this.gpuUnits / this.seconds);
  }

  public isWithinCpuBudget(): boolean {
    return this.cpuPerSecond() <= MAX_CPU_BUDGET_UNITS_PER_SECOND;
  }

  public isWithinGpuBudget(): boolean {
    return this.gpuPerSecond() <= MAX_GPU_BUDGET_UNITS_PER_SECOND;
  }

  public reset(): void {
    this.cpuUnits = 0;
    this.gpuUnits = 0;
    this.seconds = 0;
  }

  public toString(): string {
    return `CpuGpuProxyModel{cpu=${this.cpuUnits}, gpu=${this.gpuUnits}, seconds=${this.seconds}}`;
  }
}

/**
 * Grades an aggregated sample population.
 */
class PerformanceBandEvaluator {
  /**
   * Grades a summary.
   *
   * @param summary summary of one metric kind.
   * @returns the performance band.
   */
  public static bandOf(summary: MetricSummary): PerformanceBand {
    if (summary.averageMs <= 50 && summary.peakMs <= 200) {
      return PerformanceBand.EXCELLENT;
    }
    if (summary.averageMs <= 200 && summary.peakMs <= 800) {
      return PerformanceBand.GOOD;
    }
    if (summary.averageMs <= 800 && summary.peakMs <= 2000) {
      return PerformanceBand.ACCEPTABLE;
    }
    return PerformanceBand.POOR;
  }

  /**
   * Returns the English label of a band.
   *
   * @param band performance band.
   * @returns the label.
   */
  public static labelOf(band: PerformanceBand): string {
    if (band === PerformanceBand.EXCELLENT) {
      return 'excellent';
    }
    if (band === PerformanceBand.GOOD) {
      return 'good';
    }
    if (band === PerformanceBand.ACCEPTABLE) {
      return 'acceptable';
    }
    return 'poor';
  }
}

/**
 * Aggregates the pass and fail outcomes of one performance run.
 */
class PerformanceReport {
  private checks: string[] = [];
  private failures: string[] = [];

  public check(name: string, passed: boolean): boolean {
    this.checks.push(name);
    if (!passed) {
      this.failures.push(name);
    }
    return passed;
  }

  public checkUpperBound(name: string, value: number, threshold: number): boolean {
    return this.check(name, value <= threshold);
  }

  public checkLowerBound(name: string, value: number, threshold: number): boolean {
    return this.check(name, value >= threshold);
  }

  public count(): number {
    return this.checks.length;
  }

  public passedCount(): number {
    return this.checks.length - this.failures.length;
  }

  public failureCount(): number {
    return this.failures.length;
  }

  public isPassed(): boolean {
    return this.checks.length > 0 && this.failures.length === 0;
  }

  public failureNames(): string[] {
    return this.failures.slice();
  }

  public summary(): string {
    return this.isPassed() ? 'power-performance-pass' : 'power-performance-fail';
  }

  public reset(): void {
    this.checks = [];
    this.failures = [];
  }

  public toString(): string {
    return `PerformanceReport{checks=${this.checks.length}, failures=${this.failures.length}}`;
  }
}

/**
 * Logs the begin marker of a case.
 *
 * @param caseName name of the case.
 */
function logBegin(caseName: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', caseName + ', begin');
}

/**
 * Logs the end marker of a case.
 *
 * @param caseName name of the case.
 */
function logEnd(caseName: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', caseName + ', end');
}

/**
 * Launches the sample and waits until the entry page is rendered.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page is available.
 */
async function openIndexPage(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  return await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
}

/**
 * Builds the per tick rendering cost of the countdown.
 *
 * @param costMs rendering cost of one tick.
 * @param ticks number of ticks.
 * @returns the frame values of the repaints.
 */
function buildTickFrames(costMs: number, ticks: number): number[] {
  const frames: number[] = [];
  for (let i = 0; i < ticks; i++) {
    frames.push(costMs);
  }
  return frames;
}

export default function powerPerformanceTest() {
  describe('PowerPerformance_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: a fresh metric collector is created.
     * Expectation: the population is empty and every aggregate answers zero.
     */
    it('Assessment_PowerPerformance_001', 0, () => {
      logBegin(CASE_001);
      const collector: MetricCollector = new MetricCollector();
      expect(collector.count()).assertEqual(0);
      expect(collector.countOf(MetricKind.COUNTDOWN_TICK)).assertEqual(0);
      expect(collector.averageOf(MetricKind.COUNTDOWN_TICK)).assertEqual(0);
      expect(collector.peakOf(MetricKind.COUNTDOWN_TICK)).assertEqual(0);
      expect(collector.percentileOf(MetricKind.COUNTDOWN_TICK, 95)).assertEqual(0);
      expect(collector.jankCountOf(MetricKind.COUNTDOWN_TICK)).assertEqual(0);
      expect(collector.kinds().length).assertEqual(0);
      logEnd(CASE_001);
    });

    /**
     * Scenario: one sample is recorded and inspected.
     * Expectation: every aggregate equals the single sample and the summary carries the kind.
     */
    it('Assessment_PowerPerformance_002', 0, () => {
      logBegin(CASE_002);
      const collector: MetricCollector = new MetricCollector();
      expect(collector.record(MetricKind.COUNTDOWN_TICK, 4)).assertTrue();
      const summary: MetricSummary = collector.summaryOf(MetricKind.COUNTDOWN_TICK);
      expect(summary.kind).assertEqual(MetricKind.COUNTDOWN_TICK);
      expect(summary.count).assertEqual(1);
      expect(summary.averageMs).assertEqual(4);
      expect(summary.peakMs).assertEqual(4);
      expect(summary.p50Ms).assertEqual(4);
      expect(summary.p95Ms).assertEqual(4);
      expect(summary.jankCount).assertEqual(0);
      logEnd(CASE_002);
    });

    /**
     * Scenario: invalid samples are handed to the collector.
     * Expectation: a negative value is rejected and the population is unchanged.
     */
    it('Assessment_PowerPerformance_003', 0, () => {
      logBegin(CASE_003);
      const collector: MetricCollector = new MetricCollector();
      expect(collector.record(MetricKind.FRAME, -1)).assertFalse();
      expect(collector.count()).assertEqual(0);
      expect(collector.recordTimes(MetricKind.FRAME, 20, 5)).assertEqual(5);
      expect(collector.count()).assertEqual(5);
      expect(collector.averageOf(MetricKind.FRAME)).assertEqual(20);
      logEnd(CASE_003);
    });

    /**
     * Scenario: the percentile of a hundred linear samples is computed.
     * Expectation: p50, p95 and the boundaries return the documented nearest rank values.
     */
    it('Assessment_PowerPerformance_004', 0, () => {
      logBegin(CASE_004);
      const collector: MetricCollector = new MetricCollector();
      for (let i = 1; i <= 100; i++) {
        collector.record(MetricKind.RENDER, i);
      }
      expect(collector.percentileOf(MetricKind.RENDER, 50)).assertEqual(50);
      expect(collector.percentileOf(MetricKind.RENDER, 95)).assertEqual(95);
      expect(collector.percentileOf(MetricKind.RENDER, 0)).assertEqual(1);
      expect(collector.percentileOf(MetricKind.RENDER, 100)).assertEqual(100);
      expect(collector.percentileOf(MetricKind.RENDER, -5)).assertEqual(1);
      logEnd(CASE_004);
    });

    /**
     * Scenario: janky frames are recorded next to healthy frames.
     * Expectation: the jank counter only counts the frames above the jank threshold and the peak
     * reflects the worst frame.
     */
    it('Assessment_PowerPerformance_005', 0, () => {
      logBegin(CASE_005);
      const collector: MetricCollector = new MetricCollector();
      collector.record(MetricKind.FRAME, 10);
      collector.record(MetricKind.FRAME, 20);
      collector.record(MetricKind.FRAME, 40);
      collector.record(MetricKind.FRAME, 120);
      expect(collector.jankCountOf(MetricKind.FRAME)).assertEqual(2);
      expect(collector.peakOf(MetricKind.FRAME)).assertEqual(120);
      expect(collector.averageOf(MetricKind.FRAME)).assertEqual(47.5);
      expect(collector.countOf(MetricKind.FRAME)).assertEqual(4);
      logEnd(CASE_005);
    });

    /**
     * Scenario: two metric kinds are recorded.
     * Expectation: the filter never mixes the kinds and the kinds list keeps the insertion order.
     */
    it('Assessment_PowerPerformance_006', 0, () => {
      logBegin(CASE_006);
      const collector: MetricCollector = new MetricCollector();
      collector.record(MetricKind.COUNTDOWN_TICK, 3);
      collector.record(MetricKind.QUERY, 300);
      collector.record(MetricKind.COUNTDOWN_TICK, 5);
      expect(collector.count()).assertEqual(3);
      expect(collector.countOf(MetricKind.COUNTDOWN_TICK)).assertEqual(2);
      expect(collector.countOf(MetricKind.QUERY)).assertEqual(1);
      expect(collector.averageOf(MetricKind.COUNTDOWN_TICK)).assertEqual(4);
      expect(collector.kinds().length).assertEqual(2);
      expect(collector.kinds()[0]).assertEqual(MetricKind.COUNTDOWN_TICK);
      expect(collector.kinds()[1]).assertEqual(MetricKind.QUERY);
      logEnd(CASE_006);
    });

    /**
     * Scenario: the collector is reset after a run.
     * Expectation: the population and the kinds list are empty again.
     */
    it('Assessment_PowerPerformance_008', 0, () => {
      logBegin(CASE_008);
      const collector: MetricCollector = new MetricCollector();
      collector.recordTimes(MetricKind.APP_STORAGE_WRITE, 2, 50);
      expect(collector.count()).assertEqual(50);
      collector.reset();
      expect(collector.count()).assertEqual(0);
      expect(collector.kinds().length).assertEqual(0);
      expect(collector.summaryOf(MetricKind.APP_STORAGE_WRITE).count).assertEqual(0);
      logEnd(CASE_008);
    });

    /**
     * Scenario: a fresh countdown trace is created.
     * Expectation: no tick has been recorded and the remaining seconds are zero.
     */
    it('Assessment_PowerPerformance_009', 0, () => {
      logBegin(CASE_009);
      const trace: CountdownTrace = new CountdownTrace(COUNTDOWN_INTERVAL, MAX_TICK_DRIFT_MS);
      expect(trace.count()).assertEqual(0);
      expect(trace.remainingSeconds()).assertEqual(0);
      expect(trace.driftMs()).assertEqual(0);
      expect(trace.averageIntervalMs()).assertEqual(0);
      expect(trace.getLateTicks()).assertEqual(0);
      expect(trace.getIntervalMs()).assertEqual(1000);
      logEnd(CASE_009);
    });

    /**
     * Scenario: ten nominal ticks are recorded.
     * Expectation: the trace has no drift, the average interval equals the nominal interval and
     * the remaining seconds are decremented once per tick.
     */
    it('Assessment_PowerPerformance_010', 0, () => {
      logBegin(CASE_010);
      const trace: CountdownTrace = new CountdownTrace(COUNTDOWN_INTERVAL, MAX_TICK_DRIFT_MS);
      expect(trace.tickAtInterval(10, 0, 600)).assertEqual(10);
      expect(trace.count()).assertEqual(10);
      expect(trace.remainingSeconds()).assertEqual(590);
      expect(trace.driftMs()).assertEqual(0);
      expect(trace.averageIntervalMs()).assertEqual(1000);
      expect(trace.getLateTicks()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', trace.toString());
      logEnd(CASE_010);
    });

    /**
     * Scenario: late ticks are recorded.
     * Expectation: a tick that is late by more than the tolerance is counted as a late tick while
     * the accumulated drift equals the total lateness.
     */
    it('Assessment_PowerPerformance_011', 0, () => {
      logBegin(CASE_011);
      const trace: CountdownTrace = new CountdownTrace(COUNTDOWN_INTERVAL, MAX_TICK_DRIFT_MS);
      expect(trace.tick(0, 600)).assertTrue();
      expect(trace.tick(1000, 599)).assertTrue();
      expect(trace.tick(2050, 598)).assertTrue();
      expect(trace.tick(3100, 597)).assertTrue();
      expect(trace.count()).assertEqual(4);
      expect(trace.getLateTicks()).assertEqual(0);
      expect(trace.driftMs()).assertEqual(100);
      trace.tick(4600, 596);
      expect(trace.getLateTicks()).assertEqual(1);
      expect(trace.driftMs()).assertEqual(600);
      logEnd(CASE_011);
    });

    /**
     * Scenario: a tick timestamp moves backwards.
     * Expectation: the out of order tick is rejected so that the drift can never turn negative
     * because of a clock jump.
     */
    it('Assessment_PowerPerformance_012', 0, () => {
      logBegin(CASE_012);
      const trace: CountdownTrace = new CountdownTrace(COUNTDOWN_INTERVAL, MAX_TICK_DRIFT_MS);
      expect(trace.tick(5000, 600)).assertTrue();
      expect(trace.tick(4000, 599)).assertFalse();
      expect(trace.tick(-1, 599)).assertFalse();
      expect(trace.count()).assertEqual(1);
      expect(trace.driftMs()).assertEqual(0);
      logEnd(CASE_012);
    });

    /**
     * Scenario: the displayed countdown is compared with the wall clock.
     * Expectation: a trace that decremented once per elapsed second is accurate and a trace that
     * lost seconds is reported with the exact drift.
     */
    it('Assessment_PowerPerformance_013', 0, () => {
      logBegin(CASE_013);
      const trace: CountdownTrace = new CountdownTrace(COUNTDOWN_INTERVAL, MAX_TICK_DRIFT_MS);
      trace.tickAtInterval(30, 0, 600);
      const accurate: AccuracyResult = trace.compareWithWallClock(30000, 600);
      expect(accurate.accurate).assertTrue();
      expect(accurate.driftSeconds).assertEqual(0);
      expect(accurate.expectedSeconds).assertEqual(570);
      expect(accurate.displayedSeconds).assertEqual(570);
      const late: AccuracyResult = trace.compareWithWallClock(60000, 600);
      expect(late.accurate).assertFalse();
      expect(late.driftSeconds).assertEqual(30);
      logEnd(CASE_013);
    });

    /**
     * Scenario: the remaining seconds are formatted as MM:SS.
     * Expectation: the trace reproduces the formatRemaining of the exam page including the zero
     * padding of both fields.
     */
    it('Assessment_PowerPerformance_014', 0, () => {
      logBegin(CASE_014);
      const trace: CountdownTrace = new CountdownTrace(COUNTDOWN_INTERVAL, MAX_TICK_DRIFT_MS);
      trace.tickAtInterval(1, 0, 600);
      expect(trace.formatMmSs()).assertEqual('09:59');
      trace.tickAtInterval(59, 1000, 599);
      expect(trace.remainingSeconds()).assertEqual(540);
      expect(trace.formatMmSs()).assertEqual('09:00');
      const shortTrace: CountdownTrace = new CountdownTrace(COUNTDOWN_INTERVAL, MAX_TICK_DRIFT_MS);
      shortTrace.tickAtInterval(60, 0, 60);
      expect(shortTrace.formatMmSs()).assertEqual('00:00');
      logEnd(CASE_014);
    });

    /**
     * Scenario: the trace is reset between two sessions.
     * Expectation: the ticks, the remaining seconds and the counters return to zero.
     */
    it('Assessment_PowerPerformance_016', 0, () => {
      logBegin(CASE_016);
      const trace: CountdownTrace = new CountdownTrace(COUNTDOWN_INTERVAL, MAX_TICK_DRIFT_MS);
      trace.tickAtInterval(30, 0, 600);
      expect(trace.count()).assertEqual(30);
      trace.reset();
      expect(trace.count()).assertEqual(0);
      expect(trace.remainingSeconds()).assertEqual(0);
      expect(trace.driftMs()).assertEqual(0);
      expect(trace.getLateTicks()).assertEqual(0);
      logEnd(CASE_016);
    });

    /**
     * Scenario: a fresh render cost model is created.
     * Expectation: no frame has been accounted and the model reports the frame budget it was
     * built with.
     */
    it('Assessment_PowerPerformance_017', 0, () => {
      logBegin(CASE_017);
      const render: RenderCostModel = new RenderCostModel(FRAME_BUDGET_MS);
      expect(render.getBudget()).assertEqual(16.7);
      expect(render.frameCount()).assertEqual(0);
      expect(render.repaintCount()).assertEqual(0);
      expect(render.averageCostMs()).assertEqual(0);
      expect(render.peakCostMs()).assertEqual(0);
      expect(render.utilizationPercent()).assertEqual(0);
      expect(render.isWithinBudget()).assertTrue();
      logEnd(CASE_017);
    });

    /**
     * Scenario: one countdown repaint is accounted.
     * Expectation: a repaint inside the budget creates one frame, consumes the repaint time and
     * never lands in the jank bucket.
     */
    it('Assessment_PowerPerformance_018', 0, () => {
      logBegin(CASE_018);
      const render: RenderCostModel = new RenderCostModel(FRAME_BUDGET_MS);
      expect(render.repaint(4)).assertTrue();
      expect(render.frameCount()).assertEqual(1);
      expect(render.repaintCount()).assertEqual(1);
      expect(render.consumedMs()).assertEqual(4);
      expect(render.averageCostMs()).assertEqual(4);
      expect(render.jankCount()).assertEqual(0);
      expect(render.utilizationPercent()).assertEqual(24);
      expect(render.repaint(0)).assertFalse();
      logEnd(CASE_018);
    });

    /**
     * Scenario: a repaint that exceeds the frame budget is accounted.
     * Expectation: the slow repaint is recorded twice, which is how the model expresses a
     * repaint that needs a second frame, and it is counted as a janky frame once it crosses the
     * jank threshold.
     */
    it('Assessment_PowerPerformance_019', 0, () => {
      logBegin(CASE_019);
      const render: RenderCostModel = new RenderCostModel(FRAME_BUDGET_MS);
      render.repaint(20);
      expect(render.repaintCount()).assertEqual(1);
      expect(render.frameCount()).assertEqual(2);
      expect(render.jankCount()).assertEqual(0);
      render.repaint(40);
      expect(render.repaintCount()).assertEqual(2);
      expect(render.frameCount()).assertEqual(4);
      expect(render.jankCount()).assertEqual(2);
      expect(render.peakCostMs()).assertEqual(40);
      logEnd(CASE_019);
    });

    /**
     * Scenario: the per tick render cost is asserted against its own budget.
     * Expectation: the average repaint cost of the countdown stays below the generous per tick
     * cost budget, the jank ratio stays below its bound and the deterministic frame stream keeps
     * the model within its frame budget.
     */
    it('Assessment_PowerPerformance_021', 0, () => {
      logBegin(CASE_021);
      const render: RenderCostModel = new RenderCostModel(FRAME_BUDGET_MS);
      const frames: number[] = buildTickFrames(2, 120);
      for (let i = 0; i < frames.length; i++) {
        render.repaint(frames[i]);
      }
      const report: PerformanceReport = new PerformanceReport();
      report.checkUpperBound('tick-cost', render.averageCostMs(), MAX_RENDER_COST_PER_TICK_MS);
      report.checkUpperBound('utilization', render.utilizationPercent(), MAX_FRAME_UTILIZATION_PERCENT);
      report.checkUpperBound('jank-ratio',
        PerformanceMath.percentOf(render.jankCount(), render.frameCount()), MAX_JANK_RATIO_PERCENT);
      report.check('frame-count', render.frameCount() === 120);
      expect(report.isPassed()).assertTrue();
      expect(render.peakCostMs()).assertEqual(2);
      logEnd(CASE_021);
    });

    /**
     * Scenario: the render cost model is reset after a run.
     * Expectation: the frames, the repaint counter and every aggregate return to zero.
     */
    it('Assessment_PowerPerformance_022', 0, () => {
      logBegin(CASE_022);
      const render: RenderCostModel = new RenderCostModel(FRAME_BUDGET_MS);
      render.repaintTimes(40, 3);
      expect(render.repaintCount()).assertEqual(3);
      render.reset();
      expect(render.repaintCount()).assertEqual(0);
      expect(render.frameCount()).assertEqual(0);
      expect(render.consumedMs()).assertEqual(0);
      expect(render.getBudget()).assertEqual(16.7);
      logEnd(CASE_022);
    });

    /**
     * Scenario: the AppStorage writes of the assessment events are counted.
     * Expectation: every event publishes six values and the counter tracks them exactly.
     */
    it('Assessment_PowerPerformance_023', 0, () => {
      logBegin(CASE_023);
      const writes: AppStorageWriteCounter = new AppStorageWriteCounter(6);
      expect(writes.count()).assertEqual(0);
      expect(writes.perEventCount()).assertEqual(6);
      expect(writes.eventArrived()).assertEqual(6);
      expect(writes.count()).assertEqual(6);
      expect(writes.eventCount()).assertEqual(1);
      expect(writes.eventsArrived(3)).assertEqual(18);
      expect(writes.count()).assertEqual(24);
      expect(writes.eventCount()).assertEqual(4);
      logEnd(CASE_023);
    });

    /**
     * Scenario: the write frequency of a session is computed.
     * Expectation: the frequency of a session with few events stays inside the write budget while
     * a session that wrote on every event lands above it.
     */
    it('Assessment_PowerPerformance_024', 0, () => {
      logBegin(CASE_024);
      const writes: AppStorageWriteCounter = new AppStorageWriteCounter(6);
      writes.eventsArrived(4);
      expect(writes.writesPerMinute(DURATION_TEN_MINUTES)).assertEqual(3);
      expect(writes.isWithinFrequencyBudget(DURATION_TEN_MINUTES)).assertTrue();
      const frequent: AppStorageWriteCounter = new AppStorageWriteCounter(6);
      frequent.eventsArrived(100);
      expect(frequent.writesPerMinute(60000)).assertEqual(600);
      expect(frequent.isWithinFrequencyBudget(60000)).assertFalse();
      expect(writes.writesPerMinute(0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', writes.toString());
      logEnd(CASE_024);
    });

    /**
     * Scenario: the writes of a countdown are counted.
     * Expectation: a countdown that never touches AppStorage keeps the counter at zero, which is
     * the property that keeps the tick cheap.
     */
    it('Assessment_PowerPerformance_025', 0, () => {
      logBegin(CASE_025);
      const writes: AppStorageWriteCounter = new AppStorageWriteCounter(6);
      const trace: CountdownTrace = new CountdownTrace(COUNTDOWN_INTERVAL, MAX_TICK_DRIFT_MS);
      trace.tickAtInterval(600, 0, 600);
      expect(trace.count()).assertEqual(600);
      expect(writes.count()).assertEqual(0);
      expect(writes.writesPerMinute(DURATION_TEN_MINUTES)).assertEqual(0);
      expect(writes.isWithinFrequencyBudget(DURATION_TEN_MINUTES)).assertTrue();
      writes.reset();
      expect(writes.count()).assertEqual(0);
      expect(writes.eventCount()).assertEqual(0);
      logEnd(CASE_025);
    });

    /**
     * Scenario: a whole assessment hour is evaluated by the report.
     * Expectation: the tick trace, the render cost, the write frequency and the proxy budgets
     * all pass, the population is graded and the failing branch of the report flips the summary.
     */
    it('Assessment_PowerPerformance_028', 0, () => {
      logBegin(CASE_028);
      const trace: CountdownTrace = new CountdownTrace(COUNTDOWN_INTERVAL, MAX_TICK_DRIFT_MS);
      trace.tickAtInterval(3600, 0, 3600);
      const render: RenderCostModel = new RenderCostModel(FRAME_BUDGET_MS);
      render.repaintTimes(1, 3600);
      const writes: AppStorageWriteCounter = new AppStorageWriteCounter(6);
      writes.eventsArrived(12);
      const proxy: CpuGpuProxyModel = new CpuGpuProxyModel();
      proxy.addTicks(3600);
      proxy.addFrames(24);
      proxy.setDuration(DURATION_SIXTY_MINUTES);
      const collector: MetricCollector = new MetricCollector();
      collector.recordTimes(MetricKind.COUNTDOWN_TICK, render.averageCostMs(), 100);
      const summary: MetricSummary = collector.summaryOf(MetricKind.COUNTDOWN_TICK);
      const report: PerformanceReport = new PerformanceReport();
      report.check('ticks', trace.count() === 3600);
      report.check('drift', trace.driftMs() === 0);
      report.checkUpperBound('render', render.averageCostMs(), MAX_RENDER_COST_PER_TICK_MS);
      report.checkUpperBound('writes', writes.writesPerMinute(DURATION_SIXTY_MINUTES),
        MAX_APPSTORAGE_WRITES_PER_MINUTE);
      report.check('cpu', proxy.isWithinCpuBudget());
      report.check('gpu', proxy.isWithinGpuBudget());
      expect(report.isPassed()).assertTrue();
      expect(summary.count).assertEqual(100);
      expect(PerformanceBandEvaluator.labelOf(PerformanceBandEvaluator.bandOf(summary)))
        .assertEqual('excellent');
      expect(report.check('forced', false)).assertFalse();
      expect(report.summary()).assertEqual('power-performance-fail');
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', report.toString(), trace.toString());
      logEnd(CASE_028);
    });
  });
}
