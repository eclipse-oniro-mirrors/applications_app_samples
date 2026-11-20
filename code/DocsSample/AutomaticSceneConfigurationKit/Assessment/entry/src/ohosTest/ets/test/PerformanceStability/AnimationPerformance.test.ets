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
  ID_INDEX_TITLE,
  ID_BEGIN_BUTTON,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  indexComponentCount,
  waitForIndexPage,
  clickIndexButton,
  pressAndWait,
  measureActionMs
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Duration candidates rendered by the configuration card of the entry page.
const DURATION_CHIPS: number[] = [0, 600000, 1800000, 3600000];
const DURATION_CHIP_LABELS: string[] = ['Default duration', '10 min', '30 min', '60 min'];

// Animation tuning values of the assessment pages. The countdown ticks once per second, the
// frame budget is the 60 Hz budget of the sample and a frame above the jank threshold is
// counted as a visibly late frame.
const FRAME_BUDGET_MS: number = 16.7;
const COUNTDOWN_INTERVAL: number = 1000;
const JANK_THRESHOLD_MS: number = 33.4;
const CHIP_TRANSITION_FRAMES: number = 12;
const MAX_JANK_RATIO_PERCENT: number = 10;
const MAX_FRAME_UTILIZATION_PERCENT: number = 95;

// Sizes used by the model cases and by the guarded UI cases.
const MODEL_ITERATIONS: number = 1000;
const MODEL_BUDGET_MS: number = 5000;
const UI_ROUNDS: number = 5;
const UI_RENDER_TOLERANCE: number = 3;

// Case identifiers, they are kept in one place so that the log lines of the suite can be
// filtered by the trailing number.
const CASE_001: string = BUNDLE + 'AnimationPerformance_001';
const CASE_002: string = BUNDLE + 'AnimationPerformance_002';
const CASE_003: string = BUNDLE + 'AnimationPerformance_003';
const CASE_004: string = BUNDLE + 'AnimationPerformance_004';
const CASE_005: string = BUNDLE + 'AnimationPerformance_005';
const CASE_006: string = BUNDLE + 'AnimationPerformance_006';
const CASE_007: string = BUNDLE + 'AnimationPerformance_007';
const CASE_008: string = BUNDLE + 'AnimationPerformance_008';
const CASE_009: string = BUNDLE + 'AnimationPerformance_009';
const CASE_010: string = BUNDLE + 'AnimationPerformance_010';
const CASE_011: string = BUNDLE + 'AnimationPerformance_011';
const CASE_012: string = BUNDLE + 'AnimationPerformance_012';
const CASE_013: string = BUNDLE + 'AnimationPerformance_013';
const CASE_014: string = BUNDLE + 'AnimationPerformance_014';
const CASE_015: string = BUNDLE + 'AnimationPerformance_015';
const CASE_016: string = BUNDLE + 'AnimationPerformance_016';
const CASE_017: string = BUNDLE + 'AnimationPerformance_017';
const CASE_018: string = BUNDLE + 'AnimationPerformance_018';
const CASE_019: string = BUNDLE + 'AnimationPerformance_019';
const CASE_020: string = BUNDLE + 'AnimationPerformance_020';
const CASE_021: string = BUNDLE + 'AnimationPerformance_021';
const CASE_022: string = BUNDLE + 'AnimationPerformance_022';
const CASE_023: string = BUNDLE + 'AnimationPerformance_023';
const CASE_024: string = BUNDLE + 'AnimationPerformance_024';
const CASE_025: string = BUNDLE + 'AnimationPerformance_025';
const CASE_026: string = BUNDLE + 'AnimationPerformance_026';
const CASE_027: string = BUNDLE + 'AnimationPerformance_027';
const CASE_028: string = BUNDLE + 'AnimationPerformance_028';
const CASE_029: string = BUNDLE + 'AnimationPerformance_029';
const CASE_030: string = BUNDLE + 'AnimationPerformance_030';
const CASE_031: string = BUNDLE + 'AnimationPerformance_031';
const CASE_032: string = BUNDLE + 'AnimationPerformance_032';
const CASE_033: string = BUNDLE + 'AnimationPerformance_033';
const CASE_034: string = BUNDLE + 'AnimationPerformance_034';
const CASE_035: string = BUNDLE + 'AnimationPerformance_035';
const CASE_036: string = BUNDLE + 'AnimationPerformance_036';
const CASE_037: string = BUNDLE + 'AnimationPerformance_037';
const CASE_038: string = BUNDLE + 'AnimationPerformance_038';
const CASE_039: string = BUNDLE + 'AnimationPerformance_039';
const CASE_040: string = BUNDLE + 'AnimationPerformance_040';
const CASE_041: string = BUNDLE + 'AnimationPerformance_041';
const CASE_042: string = BUNDLE + 'AnimationPerformance_042';
const CASE_043: string = BUNDLE + 'AnimationPerformance_043';
const CASE_044: string = BUNDLE + 'AnimationPerformance_044';
const CASE_045: string = BUNDLE + 'AnimationPerformance_045';
const CASE_046: string = BUNDLE + 'AnimationPerformance_046';

/**
 * Numeric helpers shared by the animation models.
 */
class AnimationMath {
  /**
   * Pads a non negative integer to two characters, the countdown text of the exam page and
   * the option labels are both padded this way.
   *
   * @param value value to pad.
   * @returns the padded text.
   */
  public static padTwo(value: number): string {
    const normalized: number = Math.floor(value < 0 ? 0 : value);
    return normalized < 10 ? '0' + normalized.toString() : normalized.toString();
  }

  /**
   * Clamps a value into the closed interval.
   *
   * @param value value to clamp.
   * @param low lower bound.
   * @param high upper bound.
   * @returns the clamped value.
   */
  public static clamp(value: number, low: number, high: number): number {
    if (value < low) {
      return low;
    }
    if (value > high) {
      return high;
    }
    return value;
  }

  /**
   * Computes a rounded percentage, a zero whole never divides.
   *
   * @param part part of the whole.
   * @param whole reference value.
   * @returns the rounded percentage.
   */
  public static roundPercent(part: number, whole: number): number {
    if (whole <= 0) {
      return 0;
    }
    return Math.round(part * 100 / whole);
  }

  /**
   * Computes an integer ceiling division.
   *
   * @param dividend value to divide.
   * @param divisor divisor, it must be positive.
   * @returns the ceiling of the quotient.
   */
  public static ceilDiv(dividend: number, divisor: number): number {
    if (divisor <= 0) {
      return 0;
    }
    const normalized: number = dividend < 0 ? 0 : dividend;
    return Math.floor((normalized + divisor - 1) / divisor);
  }
}

/**
 * One rendered frame of the countdown animation.
 */
interface FrameSample {
  index: number;
  frameMs: number;
  dropped: boolean;
}

/**
 * Accounts the frames of one animation against the frame budget.
 *
 * The countdown of the assessment page repaints the progress ring on every tick. A frame that
 * takes longer than the budget delays the next repaint, a frame that takes longer than the jank
 * threshold is a visible stall and is counted separately from a dropped frame.
 */
class FrameBudgetModel {
  private readonly budgetMs: number;
  private samples: FrameSample[] = [];
  private consumedMs: number = 0;

  constructor(budgetMs: number) {
    this.budgetMs = budgetMs > 0 ? budgetMs : FRAME_BUDGET_MS;
  }

  /**
   * Records the duration of one frame.
   *
   * @param frameMs duration of the frame in milliseconds.
   * @returns true when the sample was accepted.
   */
  public record(frameMs: number): boolean {
    if (frameMs <= 0) {
      return false;
    }
    const dropped: boolean = frameMs > this.budgetMs;
    this.samples.push({
      index: this.samples.length,
      frameMs: frameMs,
      dropped: dropped
    });
    this.consumedMs += frameMs;
    return true;
  }

  /**
   * Records the same frame duration several times.
   *
   * @param frameMs duration of each frame.
   * @param times number of frames.
   * @returns the number of accepted samples.
   */
  public recordFrames(frameMs: number, times: number): number {
    let accepted: number = 0;
    for (let i = 0; i < times; i++) {
      if (this.record(frameMs)) {
        accepted++;
      }
    }
    return accepted;
  }

  public getBudget(): number {
    return this.budgetMs;
  }

  public count(): number {
    return this.samples.length;
  }

  public consumed(): number {
    return this.consumedMs;
  }

  public droppedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].dropped) {
        count++;
      }
    }
    return count;
  }

  public droppedIndexes(): number[] {
    const indexes: number[] = [];
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].dropped) {
        indexes.push(this.samples[i].index);
      }
    }
    return indexes;
  }

  public averageFrameMs(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return this.consumedMs / this.samples.length;
  }

  public utilizationPercent(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return AnimationMath.roundPercent(this.consumedMs, this.samples.length * this.budgetMs);
  }

  public isWithinBudget(): boolean {
    return this.utilizationPercent() <= MAX_FRAME_UTILIZATION_PERCENT;
  }

  public reset(): void {
    this.samples = [];
    this.consumedMs = 0;
  }

  public toString(): string {
    return `FrameBudgetModel{frames=${this.samples.length}, consumed=${this.consumedMs}, dropped=${this.droppedCount()}}`;
  }
}

/**
 * Verifies that the countdown ticks with a constant cadence.
 *
 * The exam page drives its countdown from a 1000 ms interval. The model records the timestamps
 * of the ticks so that drift, missing ticks and a jittery interval can be detected without a
 * device.
 */
class TickCadenceModel {
  private readonly intervalMs: number;
  private timestamps: number[] = [];

  constructor(intervalMs: number) {
    this.intervalMs = intervalMs > 0 ? intervalMs : COUNTDOWN_INTERVAL;
  }

  /**
   * Records a tick timestamp. A timestamp that goes backwards is rejected because the cadence
   * of a monotonic clock can never move backwards.
   *
   * @param timestampMs tick timestamp in milliseconds.
   * @returns true when the tick was accepted.
   */
  public tick(timestampMs: number): boolean {
    if (timestampMs < 0) {
      return false;
    }
    if (this.timestamps.length > 0) {
      const last: number = this.timestamps[this.timestamps.length - 1];
      if (timestampMs < last) {
        return false;
      }
    }
    this.timestamps.push(timestampMs);
    return true;
  }

  /**
   * Records ticks that arrive on the nominal cadence.
   *
   * @param times number of ticks.
   * @param startMs timestamp of the first tick.
   * @returns the number of accepted ticks.
   */
  public tickAtInterval(times: number, startMs: number): number {
    let accepted: number = 0;
    for (let i = 0; i < times; i++) {
      if (this.tick(startMs + i * this.intervalMs)) {
        accepted++;
      }
    }
    return accepted;
  }

  /**
   * Computes the number of ticks that a countdown of the given length needs.
   *
   * @param durationMs duration of the countdown.
   * @returns the expected number of ticks.
   */
  public expectedTicks(durationMs: number): number {
    if (durationMs <= 0) {
      return 0;
    }
    return Math.floor(durationMs / this.intervalMs);
  }

  public count(): number {
    return this.timestamps.length;
  }

  public driftMs(): number {
    const size: number = this.timestamps.length;
    if (size < 2) {
      return 0;
    }
    const expected: number = (size - 1) * this.intervalMs;
    return (this.timestamps[size - 1] - this.timestamps[0]) - expected;
  }

  public missingTicks(spanMs: number): number {
    const expected: number = this.expectedTicks(spanMs);
    const actual: number = this.count();
    return actual >= expected ? 0 : expected - actual;
  }

  public averageIntervalMs(): number {
    const size: number = this.timestamps.length;
    if (size < 2) {
      return 0;
    }
    const span: number = this.timestamps[size - 1] - this.timestamps[0];
    return AnimationMath.ceilDiv(span, size - 1);
  }

  public getIntervalMs(): number {
    return this.intervalMs;
  }

  public reset(): void {
    this.timestamps = [];
  }

  public toString(): string {
    return `TickCadenceModel{ticks=${this.timestamps.length}, interval=${this.intervalMs}, drift=${this.driftMs()}}`;
  }
}

/**
 * Models the progress animation of the countdown.
 *
 * The exam page renders the remaining time as MM:SS plus a progress ring. The model mirrors
 * both so that the percentage and the formatted text can be asserted without the device.
 */
class CountdownProgressModel {
  private readonly totalMs: number;
  private remainingMs: number;

  constructor(totalMs: number) {
    this.totalMs = totalMs > 0 ? totalMs : COUNTDOWN_INTERVAL;
    this.remainingMs = this.totalMs;
  }

  /**
   * Advances the countdown.
   *
   * @param deltaMs elapsed time in milliseconds.
   * @returns true when the countdown was advanced.
   */
  public advance(deltaMs: number): boolean {
    if (deltaMs <= 0) {
      return false;
    }
    this.remainingMs -= deltaMs;
    if (this.remainingMs < 0) {
      this.remainingMs = 0;
    }
    return true;
  }

  /**
   * Advances the countdown by one tick.
   */
  public tick(): void {
    this.advance(COUNTDOWN_INTERVAL);
  }

  /**
   * Advances the countdown by several ticks and stops on the zero boundary.
   *
   * @param times number of ticks.
   * @returns the number of ticks that were actually applied.
   */
  public tickTimes(times: number): number {
    let applied: number = 0;
    for (let i = 0; i < times; i++) {
      if (this.remainingMs <= 0) {
        break;
      }
      this.tick();
      applied++;
    }
    return applied;
  }

  public progressPercent(): number {
    if (this.totalMs <= 0) {
      return 100;
    }
    return AnimationMath.roundPercent(this.totalMs - this.remainingMs, this.totalMs);
  }

  public remainingPercent(): number {
    return 100 - this.progressPercent();
  }

  public remainingSeconds(): number {
    return AnimationMath.ceilDiv(this.remainingMs, 1000);
  }

  public isFinished(): boolean {
    return this.remainingMs <= 0;
  }

  /**
   * Formats the remaining time as MM:SS.
   *
   * @returns the formatted countdown text.
   */
  public formatMmSs(): string {
    const totalSeconds: number = this.remainingSeconds();
    const minutes: number = Math.floor(totalSeconds / 60);
    const seconds: number = totalSeconds % 60;
    return AnimationMath.padTwo(minutes) + ':' + AnimationMath.padTwo(seconds);
  }

  public getRemainingMs(): number {
    return this.remainingMs;
  }

  public getTotalMs(): number {
    return this.totalMs;
  }

  public reset(): void {
    this.remainingMs = this.totalMs;
  }

  public toString(): string {
    return `CountdownProgressModel{remaining=${this.remainingMs}, progress=${this.progressPercent()}}`;
  }
}

/**
 * A duration chip of the configuration card.
 */
interface ChipState {
  index: number;
  valueMs: number;
  label: string;
}

/**
 * Models the selection transition of the duration chips.
 *
 * Selecting a chip starts a short transition, the value of the countdown ring is interpolated
 * from the previously selected duration to the new one while the transition runs.
 */
class ChipTransitionModel {
  private readonly candidates: number[];
  private readonly labels: string[];
  private readonly frames: number;
  private selectedIndex: number = 0;
  private fromValue: number = 0;
  private progressFrames: number = 0;
  private transitioning: boolean = false;

  constructor(candidates: number[], labels: string[], frames: number) {
    this.candidates = candidates.slice();
    this.labels = labels.slice();
    this.frames = frames > 0 ? frames : CHIP_TRANSITION_FRAMES;
    this.fromValue = this.candidates.length > 0 ? this.candidates[0] : 0;
  }

  /**
   * Selects a chip and starts the transition.
   *
   * @param index index of the chip.
   * @returns true when the selection changed.
   */
  public select(index: number): boolean {
    if (index < 0 || index >= this.candidates.length) {
      return false;
    }
    if (index === this.selectedIndex && !this.transitioning) {
      return false;
    }
    this.fromValue = this.getSelectedValue();
    this.selectedIndex = index;
    this.progressFrames = 0;
    this.transitioning = true;
    return true;
  }

  /**
   * Advances the transition by one frame.
   *
   * @returns true when the transition finished with this frame.
   */
  public advanceFrame(): boolean {
    if (!this.transitioning) {
      return false;
    }
    this.progressFrames++;
    if (this.progressFrames >= this.frames) {
      this.progressFrames = this.frames;
      this.transitioning = false;
      return true;
    }
    return false;
  }

  /**
   * Advances the transition until it finishes.
   *
   * @returns the number of frames the transition took.
   */
  public runTransition(): number {
    let applied: number = 0;
    while (this.transitioning && applied < this.frames + 1) {
      this.advanceFrame();
      applied++;
    }
    return applied;
  }

  public finishTransition(): void {
    this.progressFrames = this.frames;
    this.transitioning = false;
  }

  public isTransitioning(): boolean {
    return this.transitioning;
  }

  public transitionProgressPercent(): number {
    return AnimationMath.roundPercent(this.progressFrames, this.frames);
  }

  public getSelectedIndex(): number {
    return this.selectedIndex;
  }

  public getSelectedValue(): number {
    if (this.candidates.length === 0) {
      return 0;
    }
    return this.candidates[this.selectedIndex];
  }

  public getFromValue(): number {
    return this.fromValue;
  }

  /**
   * Returns the interpolated duration that the ring displays while the transition runs.
   *
   * @returns the interpolated value in milliseconds.
   */
  public interpolatedValue(): number {
    const progress: number = this.transitioning ? this.progressFrames / this.frames : 1;
    const delta: number = this.getSelectedValue() - this.fromValue;
    return Math.round(this.fromValue + delta * progress);
  }

  public candidateCount(): number {
    return this.candidates.length;
  }

  public candidateAt(index: number): number {
    if (index < 0 || index >= this.candidates.length) {
      return -1;
    }
    return this.candidates[index];
  }

  public stateOf(index: number): ChipState {
    const value: number = this.candidateAt(index);
    const label: string = index >= 0 && index < this.labels.length ? this.labels[index] : '';
    return {
      index: index,
      valueMs: value,
      label: label
    };
  }

  public reset(): void {
    this.selectedIndex = 0;
    this.fromValue = this.candidates.length > 0 ? this.candidates[0] : 0;
    this.progressFrames = 0;
    this.transitioning = false;
  }

  public toString(): string {
    return `ChipTransitionModel{selected=${this.selectedIndex}, value=${this.getSelectedValue()}, transitioning=${this.transitioning}}`;
  }
}

/**
 * Detects jank in a stream of frame durations.
 */
class JankDetector {
  private readonly budgetMs: number;
  private readonly jankThresholdMs: number;
  private frames: number[] = [];

  constructor(budgetMs: number, jankThresholdMs: number) {
    this.budgetMs = budgetMs > 0 ? budgetMs : FRAME_BUDGET_MS;
    this.jankThresholdMs = jankThresholdMs > 0 ? jankThresholdMs : JANK_THRESHOLD_MS;
  }

  public add(frameMs: number): boolean {
    if (frameMs <= 0) {
      return false;
    }
    this.frames.push(frameMs);
    return true;
  }

  public addAll(values: number[]): number {
    let accepted: number = 0;
    for (let i = 0; i < values.length; i++) {
      if (this.add(values[i])) {
        accepted++;
      }
    }
    return accepted;
  }

  public count(): number {
    return this.frames.length;
  }

  public jankCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.frames.length; i++) {
      if (this.frames[i] > this.jankThresholdMs) {
        count++;
      }
    }
    return count;
  }

  public droppedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.frames.length; i++) {
      if (this.frames[i] > this.budgetMs) {
        count++;
      }
    }
    return count;
  }

  public jankRatioPercent(): number {
    return AnimationMath.roundPercent(this.jankCount(), this.frames.length);
  }

  public worstFrameMs(): number {
    let worst: number = 0;
    for (let i = 0; i < this.frames.length; i++) {
      if (this.frames[i] > worst) {
        worst = this.frames[i];
      }
    }
    return worst;
  }

  public bestFrameMs(): number {
    if (this.frames.length === 0) {
      return 0;
    }
    let best: number = this.frames[0];
    for (let i = 1; i < this.frames.length; i++) {
      if (this.frames[i] < best) {
        best = this.frames[i];
      }
    }
    return best;
  }

  public totalMs(): number {
    let total: number = 0;
    for (let i = 0; i < this.frames.length; i++) {
      total += this.frames[i];
    }
    return total;
  }

  public isHealthy(maxRatioPercent: number): boolean {
    if (this.frames.length === 0) {
      return true;
    }
    return this.jankRatioPercent() <= maxRatioPercent;
  }

  public getBudget(): number {
    return this.budgetMs;
  }

  public getJankThreshold(): number {
    return this.jankThresholdMs;
  }

  public reset(): void {
    this.frames = [];
  }

  public toString(): string {
    return `JankDetector{frames=${this.frames.length}, jank=${this.jankCount()}, ratio=${this.jankRatioPercent()}%}`;
  }
}

/**
 * Accumulates numeric animation statistics.
 */
class AnimationStats {
  private values: number[] = [];

  public add(value: number): boolean {
    if (value !== value) {
      return false;
    }
    this.values.push(value);
    return true;
  }

  public addAll(values: number[]): number {
    let accepted: number = 0;
    for (let i = 0; i < values.length; i++) {
      if (this.add(values[i])) {
        accepted++;
      }
    }
    return accepted;
  }

  public count(): number {
    return this.values.length;
  }

  public total(): number {
    let sum: number = 0;
    for (let i = 0; i < this.values.length; i++) {
      sum += this.values[i];
    }
    return sum;
  }

  public average(): number {
    if (this.values.length === 0) {
      return 0;
    }
    return this.total() / this.values.length;
  }

  public min(): number {
    if (this.values.length === 0) {
      return 0;
    }
    let low: number = this.values[0];
    for (let i = 1; i < this.values.length; i++) {
      if (this.values[i] < low) {
        low = this.values[i];
      }
    }
    return low;
  }

  public max(): number {
    if (this.values.length === 0) {
      return 0;
    }
    let high: number = this.values[0];
    for (let i = 1; i < this.values.length; i++) {
      if (this.values[i] > high) {
        high = this.values[i];
      }
    }
    return high;
  }

  /**
   * Returns a sorted copy of the samples, the source order is preserved.
   *
   * @returns the sorted copy.
   */
  public sortedCopy(): number[] {
    const copy: number[] = this.values.slice();
    for (let i = 1; i < copy.length; i++) {
      const current: number = copy[i];
      let j: number = i - 1;
      while (j >= 0 && copy[j] > current) {
        copy[j + 1] = copy[j];
        j--;
      }
      copy[j + 1] = current;
    }
    return copy;
  }

  /**
   * Computes the nearest rank percentile.
   *
   * @param percent percentile in the closed interval 0..100.
   * @returns the sample at the percentile, 0 for an empty population.
   */
  public percentile(percent: number): number {
    if (this.values.length === 0) {
      return 0;
    }
    const bounded: number = AnimationMath.clamp(percent, 0, 100);
    const sorted: number[] = this.sortedCopy();
    if (bounded <= 0) {
      return sorted[0];
    }
    if (bounded >= 100) {
      return sorted[sorted.length - 1];
    }
    let index: number = AnimationMath.ceilDiv(bounded * sorted.length, 100) - 1;
    index = AnimationMath.clamp(index, 0, sorted.length - 1);
    return sorted[index];
  }

  public reset(): void {
    this.values = [];
  }

  public toString(): string {
    return `AnimationStats{count=${this.values.length}, avg=${this.average()}, max=${this.max()}}`;
  }
}

/**
 * Aggregates the pass and fail outcomes of one animation run.
 */
class AnimationReport {
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
    return this.isPassed() ? 'animation-pass' : 'animation-fail';
  }

  public reset(): void {
    this.checks = [];
    this.failures = [];
  }

  public toString(): string {
    return `AnimationReport{checks=${this.checks.length}, failures=${this.failures.length}}`;
  }
}

/**
 * Builds a frame stream that stays inside the budget.
 *
 * @param count number of frames.
 * @returns the frame durations.
 */
function buildSmoothFrames(count: number): number[] {
  const frames: number[] = [];
  for (let i = 0; i < count; i++) {
    frames.push(i % 3 === 0 ? 8.3 : 16.7);
  }
  return frames;
}

/**
 * Builds a frame stream with periodic spikes.
 *
 * @param count number of frames.
 * @param spikeMs duration of a spike frame.
 * @param every distance between two spikes.
 * @returns the frame durations.
 */
function buildSpikyFrames(count: number, spikeMs: number, every: number): number[] {
  const frames: number[] = [];
  const distance: number = every > 0 ? every : 1;
  for (let i = 0; i < count; i++) {
    frames.push(i % distance === 0 ? spikeMs : 16.7);
  }
  return frames;
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

export default function animationPerformanceTest() {
  describe('AnimationPerformance_Test', () => {
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
     * Scenario: the frame budget model is created with the default budget.
     * Expectation: the model reports the budget it was built with and starts empty.
     */
    it('Assessment_AnimationPerformance_001', 0, () => {
      logBegin(CASE_001);
      const model: FrameBudgetModel = new FrameBudgetModel(FRAME_BUDGET_MS);
      expect(model.getBudget()).assertEqual(16.7);
      expect(model.count()).assertEqual(0);
      expect(model.consumed()).assertEqual(0);
      expect(model.averageFrameMs()).assertEqual(0);
      expect(model.utilizationPercent()).assertEqual(0);
      expect(model.droppedCount()).assertEqual(0);
      expect(model.isWithinBudget()).assertTrue();
      logEnd(CASE_001);
    });

    /**
     * Scenario: an invalid frame duration is handed to the model.
     * Expectation: the sample is rejected and the accounting is unchanged.
     */
    it('Assessment_AnimationPerformance_002', 0, () => {
      logBegin(CASE_002);
      const model: FrameBudgetModel = new FrameBudgetModel(FRAME_BUDGET_MS);
      expect(model.record(0)).assertFalse();
      expect(model.record(-4)).assertFalse();
      expect(model.count()).assertEqual(0);
      expect(model.consumed()).assertEqual(0);
      expect(model.record(16.7)).assertTrue();
      expect(model.count()).assertEqual(1);
      logEnd(CASE_002);
    });

    /**
     * Scenario: frames that exceed the 16.7 ms budget are recorded.
     * Expectation: every frame above the budget lands in the dropped bucket together with its
     * absolute frame index, so a later case can locate the stall.
     */
    it('Assessment_AnimationPerformance_003', 0, () => {
      logBegin(CASE_003);
      const model: FrameBudgetModel = new FrameBudgetModel(FRAME_BUDGET_MS);
      model.record(8.3);
      model.record(33.4);
      model.record(16.7);
      model.record(50);
      expect(model.count()).assertEqual(4);
      expect(model.droppedCount()).assertEqual(2);
      expect(model.droppedIndexes().length).assertEqual(2);
      expect(model.droppedIndexes()[0]).assertEqual(1);
      expect(model.droppedIndexes()[1]).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', model.toString());
      logEnd(CASE_003);
    });

    /**
     * Scenario: a burst of frames is recorded through the batch helper.
     * Expectation: the helper accepts every valid frame and the frame count matches the burst.
     */
    it('Assessment_AnimationPerformance_004', 0, () => {
      logBegin(CASE_004);
      const model: FrameBudgetModel = new FrameBudgetModel(FRAME_BUDGET_MS);
      expect(model.recordFrames(16.7, 60)).assertEqual(60);
      expect(model.count()).assertEqual(60);
      expect(model.droppedCount()).assertEqual(0);
      expect(model.recordFrames(0, 5)).assertEqual(0);
      expect(model.count()).assertEqual(60);
      logEnd(CASE_004);
    });

    /**
     * Scenario: the utilization of a smooth animation is computed.
     * Expectation: sixty frames of exactly one budget have a utilization of 100 percent and
     * the model reports them as outside the healthy budget.
     */
    it('Assessment_AnimationPerformance_005', 0, () => {
      logBegin(CASE_005);
      const model: FrameBudgetModel = new FrameBudgetModel(FRAME_BUDGET_MS);
      model.recordFrames(16.7, 60);
      expect(model.utilizationPercent()).assertEqual(100);
      expect(model.isWithinBudget()).assertFalse();
      const half: FrameBudgetModel = new FrameBudgetModel(FRAME_BUDGET_MS);
      half.recordFrames(8.35, 60);
      expect(half.utilizationPercent()).assertEqual(50);
      expect(half.isWithinBudget()).assertTrue();
      logEnd(CASE_005);
    });

    /**
     * Scenario: the average frame duration of a mixed stream.
     * Expectation: the average equals the sum of the samples divided by the frame count.
     */
    it('Assessment_AnimationPerformance_006', 0, () => {
      logBegin(CASE_006);
      const model: FrameBudgetModel = new FrameBudgetModel(FRAME_BUDGET_MS);
      model.record(10);
      model.record(20);
      model.record(30);
      expect(model.count()).assertEqual(3);
      expect(model.consumed()).assertEqual(60);
      expect(model.averageFrameMs()).assertEqual(20);
      logEnd(CASE_006);
    });

    /**
     * Scenario: the reset of the frame budget model.
     * Expectation: after the reset the count, the consumed time and the dropped frames are all
     * cleared while the budget itself is preserved.
     */
    it('Assessment_AnimationPerformance_007', 0, () => {
      logBegin(CASE_007);
      const model: FrameBudgetModel = new FrameBudgetModel(FRAME_BUDGET_MS);
      model.recordFrames(16.7, 10);
      model.record(99);
      expect(model.count()).assertEqual(11);
      model.reset();
      expect(model.count()).assertEqual(0);
      expect(model.consumed()).assertEqual(0);
      expect(model.droppedCount()).assertEqual(0);
      expect(model.droppedIndexes().length).assertEqual(0);
      expect(model.getBudget()).assertEqual(16.7);
      logEnd(CASE_007);
    });

    /**
     * Scenario: a custom budget is used to model a slow 30 Hz panel.
     * Expectation: a frame of 20 ms fits the slow panel but is dropped on the 60 Hz panel.
     */
    it('Assessment_AnimationPerformance_008', 0, () => {
      logBegin(CASE_008);
      const fast: FrameBudgetModel = new FrameBudgetModel(16.7);
      const slow: FrameBudgetModel = new FrameBudgetModel(33.3);
      fast.record(20);
      slow.record(20);
      expect(fast.droppedCount()).assertEqual(1);
      expect(slow.droppedCount()).assertEqual(0);
      expect(fast.getBudget()).assertEqual(16.7);
      expect(slow.getBudget()).assertEqual(33.3);
      logEnd(CASE_008);
    });

    /**
     * Scenario: the countdown ticks on its nominal 1000 ms cadence.
     * Expectation: every tick is accepted and the measured interval equals the interval of the
     * countdown controller of the sample.
     */
    it('Assessment_AnimationPerformance_010', 0, () => {
      logBegin(CASE_010);
      const cadence: TickCadenceModel = new TickCadenceModel(COUNTDOWN_INTERVAL);
      expect(cadence.tickAtInterval(10, 0)).assertEqual(10);
      expect(cadence.count()).assertEqual(10);
      expect(cadence.averageIntervalMs()).assertEqual(1000);
      expect(cadence.driftMs()).assertEqual(0);
      expect(cadence.getIntervalMs()).assertEqual(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', cadence.toString());
      logEnd(CASE_010);
    });

    /**
     * Scenario: the number of ticks of every duration candidate is computed.
     * Expectation: ten, thirty and sixty minutes map to six hundred, eighteen hundred and
     * thirty six hundred ticks, the default candidate needs no explicit tick count.
     */
    it('Assessment_AnimationPerformance_011', 0, () => {
      logBegin(CASE_011);
      const cadence: TickCadenceModel = new TickCadenceModel(COUNTDOWN_INTERVAL);
      expect(cadence.expectedTicks(DURATION_CHIPS[0])).assertEqual(0);
      expect(cadence.expectedTicks(DURATION_CHIPS[1])).assertEqual(600);
      expect(cadence.expectedTicks(DURATION_CHIPS[2])).assertEqual(1800);
      expect(cadence.expectedTicks(DURATION_CHIPS[3])).assertEqual(3600);
      expect(cadence.expectedTicks(-1)).assertEqual(0);
      logEnd(CASE_011);
    });

    /**
     * Scenario: a tick timestamp moves backwards.
     * Expectation: the out of order tick is rejected so that the drift computation cannot turn
     * negative because of a clock jump.
     */
    it('Assessment_AnimationPerformance_012', 0, () => {
      logBegin(CASE_012);
      const cadence: TickCadenceModel = new TickCadenceModel(COUNTDOWN_INTERVAL);
      expect(cadence.tick(5000)).assertTrue();
      expect(cadence.tick(6000)).assertTrue();
      expect(cadence.tick(5500)).assertFalse();
      expect(cadence.tick(-1)).assertFalse();
      expect(cadence.count()).assertEqual(2);
      expect(cadence.driftMs()).assertEqual(0);
      logEnd(CASE_012);
    });

    /**
     * Scenario: the countdown ticks arrive late.
     * Expectation: the drift equals the total lateness and remains positive, which is the
     * signal the exam page uses to realign the countdown with the wall clock.
     */
    it('Assessment_AnimationPerformance_013', 0, () => {
      logBegin(CASE_013);
      const cadence: TickCadenceModel = new TickCadenceModel(COUNTDOWN_INTERVAL);
      cadence.tick(0);
      cadence.tick(1005);
      cadence.tick(2015);
      cadence.tick(3025);
      expect(cadence.count()).assertEqual(4);
      expect(cadence.driftMs()).assertEqual(25);
      expect(cadence.averageIntervalMs()).assertEqual(1009);
      logEnd(CASE_013);
    });

    /**
     * Scenario: a countdown span misses ticks.
     * Expectation: the missing tick computation reports the exact shortfall of a span that was
     * partially covered by recorded ticks.
     */
    it('Assessment_AnimationPerformance_014', 0, () => {
      logBegin(CASE_014);
      const cadence: TickCadenceModel = new TickCadenceModel(COUNTDOWN_INTERVAL);
      cadence.tickAtInterval(8, 0);
      expect(cadence.missingTicks(10000)).assertEqual(2);
      expect(cadence.missingTicks(5000)).assertEqual(0);
      cadence.reset();
      expect(cadence.count()).assertEqual(0);
      expect(cadence.missingTicks(3000)).assertEqual(3);
      logEnd(CASE_014);
    });

    /**
     * Scenario: the progress animation of a fresh countdown.
     * Expectation: the countdown starts full, reports zero progress and renders the total
     * duration in the MM:SS format.
     */
    it('Assessment_AnimationPerformance_016', 0, () => {
      logBegin(CASE_016);
      const progress: CountdownProgressModel = new CountdownProgressModel(DURATION_CHIPS[1]);
      expect(progress.getTotalMs()).assertEqual(600000);
      expect(progress.getRemainingMs()).assertEqual(600000);
      expect(progress.progressPercent()).assertEqual(0);
      expect(progress.remainingPercent()).assertEqual(100);
      expect(progress.isFinished()).assertFalse();
      expect(progress.formatMmSs()).assertEqual('10:00');
      logEnd(CASE_016);
    });

    /**
     * Scenario: one tick of the countdown animation.
     * Expectation: the remaining time drops by the interval and the formatted text counts down
     * by exactly one second.
     */
    it('Assessment_AnimationPerformance_017', 0, () => {
      logBegin(CASE_017);
      const progress: CountdownProgressModel = new CountdownProgressModel(DURATION_CHIPS[1]);
      progress.tick();
      expect(progress.getRemainingMs()).assertEqual(599000);
      expect(progress.remainingSeconds()).assertEqual(599);
      expect(progress.formatMmSs()).assertEqual('09:59');
      progress.tick();
      progress.tick();
      expect(progress.formatMmSs()).assertEqual('09:57');
      logEnd(CASE_017);
    });

    /**
     * Scenario: the countdown ring progress after a quarter of the duration.
     * Expectation: the progress percent and the remaining percent are complementary.
     */
    it('Assessment_AnimationPerformance_018', 0, () => {
      logBegin(CASE_018);
      const progress: CountdownProgressModel = new CountdownProgressModel(600000);
      progress.advance(150000);
      expect(progress.getRemainingMs()).assertEqual(450000);
      expect(progress.progressPercent()).assertEqual(25);
      expect(progress.remainingPercent()).assertEqual(75);
      expect(progress.formatMmSs()).assertEqual('07:30');
      logEnd(CASE_018);
    });

    /**
     * Scenario: the countdown is advanced beyond its end.
     * Expectation: the remaining time is clamped at zero instead of turning negative, and the
     * model reports the finished state.
     */
    it('Assessment_AnimationPerformance_019', 0, () => {
      logBegin(CASE_019);
      const progress: CountdownProgressModel = new CountdownProgressModel(3000);
      progress.advance(9000);
      expect(progress.getRemainingMs()).assertEqual(0);
      expect(progress.progressPercent()).assertEqual(100);
      expect(progress.remainingPercent()).assertEqual(0);
      expect(progress.isFinished()).assertTrue();
      expect(progress.formatMmSs()).assertEqual('00:00');
      logEnd(CASE_019);
    });

    /**
     * Scenario: the countdown receives an invalid delta.
     * Expectation: a zero or negative delta is rejected and the remaining time is unchanged.
     */
    it('Assessment_AnimationPerformance_020', 0, () => {
      logBegin(CASE_020);
      const progress: CountdownProgressModel = new CountdownProgressModel(3000);
      expect(progress.advance(0)).assertFalse();
      expect(progress.advance(-1000)).assertFalse();
      expect(progress.getRemainingMs()).assertEqual(3000);
      logEnd(CASE_020);
    });

    /**
     * Scenario: the tick helper drives a short countdown to its end.
     * Expectation: the helper stops on the zero boundary and never advances beyond it.
     */
    it('Assessment_AnimationPerformance_021', 0, () => {
      logBegin(CASE_021);
      const progress: CountdownProgressModel = new CountdownProgressModel(3000);
      expect(progress.tickTimes(10)).assertEqual(3);
      expect(progress.isFinished()).assertTrue();
      expect(progress.getRemainingMs()).assertEqual(0);
      expect(progress.tickTimes(5)).assertEqual(0);
      logEnd(CASE_021);
    });

    /**
     * Scenario: the reset of the progress animation.
     * Expectation: the countdown returns to its full duration and the ring is full again.
     */
    it('Assessment_AnimationPerformance_022', 0, () => {
      logBegin(CASE_022);
      const progress: CountdownProgressModel = new CountdownProgressModel(60000);
      progress.advance(30000);
      expect(progress.progressPercent()).assertEqual(50);
      progress.reset();
      expect(progress.getRemainingMs()).assertEqual(60000);
      expect(progress.progressPercent()).assertEqual(0);
      expect(progress.formatMmSs()).assertEqual('01:00');
      logEnd(CASE_022);
    });

    /**
     * Scenario: a ten minute countdown is ticked sixty times.
     * Expectation: every tick consumes exactly one second of the progress animation, which
     * proves that the ring and the MM:SS text stay in sync.
     */
    it('Assessment_AnimationPerformance_023', 0, () => {
      logBegin(CASE_023);
      const progress: CountdownProgressModel = new CountdownProgressModel(DURATION_CHIPS[1]);
      expect(progress.tickTimes(60)).assertEqual(60);
      expect(progress.getRemainingMs()).assertEqual(540000);
      expect(progress.formatMmSs()).assertEqual('09:00');
      expect(progress.progressPercent()).assertEqual(10);
      logEnd(CASE_023);
    });

    /**
     * Scenario: the initial chip selection of the configuration card.
     * Expectation: the default duration is selected and no transition is running.
     */
    it('Assessment_AnimationPerformance_025', 0, () => {
      logBegin(CASE_025);
      const chips: ChipTransitionModel = new ChipTransitionModel(DURATION_CHIPS, DURATION_CHIP_LABELS,
        CHIP_TRANSITION_FRAMES);
      expect(chips.candidateCount()).assertEqual(4);
      expect(chips.getSelectedIndex()).assertEqual(0);
      expect(chips.getSelectedValue()).assertEqual(0);
      expect(chips.isTransitioning()).assertFalse();
      expect(chips.transitionProgressPercent()).assertEqual(0);
      logEnd(CASE_025);
    });

    /**
     * Scenario: a valid chip is selected.
     * Expectation: the selection changes, the transition starts, and the value of the chip is
     * exposed through the accessor.
     */
    it('Assessment_AnimationPerformance_026', 0, () => {
      logBegin(CASE_026);
      const chips: ChipTransitionModel = new ChipTransitionModel(DURATION_CHIPS, DURATION_CHIP_LABELS,
        CHIP_TRANSITION_FRAMES);
      expect(chips.select(2)).assertTrue();
      expect(chips.getSelectedIndex()).assertEqual(2);
      expect(chips.getSelectedValue()).assertEqual(1800000);
      expect(chips.isTransitioning()).assertTrue();
      expect(chips.transitionProgressPercent()).assertEqual(0);
      logEnd(CASE_026);
    });

    /**
     * Scenario: an out of range chip index is selected.
     * Expectation: the selection is rejected and the current selection is untouched.
     */
    it('Assessment_AnimationPerformance_027', 0, () => {
      logBegin(CASE_027);
      const chips: ChipTransitionModel = new ChipTransitionModel(DURATION_CHIPS, DURATION_CHIP_LABELS,
        CHIP_TRANSITION_FRAMES);
      expect(chips.select(-1)).assertFalse();
      expect(chips.select(4)).assertFalse();
      expect(chips.select(99)).assertFalse();
      expect(chips.getSelectedIndex()).assertEqual(0);
      expect(chips.isTransitioning()).assertFalse();
      logEnd(CASE_027);
    });

    /**
     * Scenario: the already selected chip is selected again.
     * Expectation: the model reports no change so that the page does not restart the
     * transition for a redundant tap.
     */
    it('Assessment_AnimationPerformance_028', 0, () => {
      logBegin(CASE_028);
      const chips: ChipTransitionModel = new ChipTransitionModel(DURATION_CHIPS, DURATION_CHIP_LABELS,
        CHIP_TRANSITION_FRAMES);
      expect(chips.select(0)).assertFalse();
      chips.finishTransition();
      expect(chips.select(0)).assertFalse();
      expect(chips.isTransitioning()).assertFalse();
      logEnd(CASE_028);
    });

    /**
     * Scenario: the selection transition runs frame by frame.
     * Expectation: the transition only finishes on the twelfth frame and reports its completion
     * exactly once.
     */
    it('Assessment_AnimationPerformance_029', 0, () => {
      logBegin(CASE_029);
      const chips: ChipTransitionModel = new ChipTransitionModel(DURATION_CHIPS, DURATION_CHIP_LABELS,
        CHIP_TRANSITION_FRAMES);
      chips.select(3);
      let finished: boolean = false;
      for (let i = 0; i < CHIP_TRANSITION_FRAMES - 1; i++) {
        expect(chips.advanceFrame()).assertFalse();
      }
      expect(chips.isTransitioning()).assertTrue();
      finished = chips.advanceFrame();
      expect(finished).assertTrue();
      expect(chips.isTransitioning()).assertFalse();
      expect(chips.transitionProgressPercent()).assertEqual(100);
      logEnd(CASE_029);
    });

    /**
     * Scenario: the interpolated value of the chip transition.
     * Expectation: the value starts at the previous duration and lands exactly on the newly
     * selected duration.
     */
    it('Assessment_AnimationPerformance_030', 0, () => {
      logBegin(CASE_030);
      const chips: ChipTransitionModel = new ChipTransitionModel(DURATION_CHIPS, DURATION_CHIP_LABELS, 10);
      expect(chips.interpolatedValue()).assertEqual(0);
      expect(chips.select(1)).assertTrue();
      expect(chips.interpolatedValue()).assertEqual(0);
      for (let i = 0; i < 5; i++) {
        chips.advanceFrame();
      }
      expect(chips.transitionProgressPercent()).assertEqual(50);
      expect(chips.interpolatedValue()).assertEqual(300000);
      chips.runTransition();
      expect(chips.interpolatedValue()).assertEqual(600000);
      logEnd(CASE_030);
    });

    /**
     * Scenario: the transition is run to completion through the bulk helper.
     * Expectation: the helper consumes exactly the configured number of frames.
     */
    it('Assessment_AnimationPerformance_031', 0, () => {
      logBegin(CASE_031);
      const chips: ChipTransitionModel = new ChipTransitionModel(DURATION_CHIPS, DURATION_CHIP_LABELS, 8);
      chips.select(2);
      expect(chips.runTransition()).assertEqual(8);
      expect(chips.isTransitioning()).assertFalse();
      expect(chips.runTransition()).assertEqual(0);
      logEnd(CASE_031);
    });

    /**
     * Scenario: the chip state of every candidate is queried.
     * Expectation: the state carries the index, the value and the label of the candidate, and
     * an out of range query returns an empty label with the invalid value marker.
     */
    it('Assessment_AnimationPerformance_032', 0, () => {
      logBegin(CASE_032);
      const chips: ChipTransitionModel = new ChipTransitionModel(DURATION_CHIPS, DURATION_CHIP_LABELS,
        CHIP_TRANSITION_FRAMES);
      const state: ChipState = chips.stateOf(3);
      expect(state.index).assertEqual(3);
      expect(state.valueMs).assertEqual(3600000);
      expect(state.label).assertEqual('60 min');
      const invalid: ChipState = chips.stateOf(9);
      expect(invalid.valueMs).assertEqual(-1);
      expect(invalid.label).assertEqual('');
      logEnd(CASE_032);
    });

    /**
     * Scenario: the chip transition model is reset.
     * Expectation: the selection returns to the default chip and the transition state is
     * cleared.
     */
    it('Assessment_AnimationPerformance_033', 0, () => {
      logBegin(CASE_033);
      const chips: ChipTransitionModel = new ChipTransitionModel(DURATION_CHIPS, DURATION_CHIP_LABELS,
        CHIP_TRANSITION_FRAMES);
      chips.select(2);
      chips.advanceFrame();
      chips.reset();
      expect(chips.getSelectedIndex()).assertEqual(0);
      expect(chips.getSelectedValue()).assertEqual(0);
      expect(chips.isTransitioning()).assertFalse();
      expect(chips.transitionProgressPercent()).assertEqual(0);
      logEnd(CASE_033);
    });

    /**
     * Scenario: a jank detector receives a smooth frame stream.
     * Expectation: no frame crosses the jank threshold and the stream is healthy.
     */
    it('Assessment_AnimationPerformance_035', 0, () => {
      logBegin(CASE_035);
      const detector: JankDetector = new JankDetector(FRAME_BUDGET_MS, JANK_THRESHOLD_MS);
      expect(detector.addAll(buildSmoothFrames(120))).assertEqual(120);
      expect(detector.count()).assertEqual(120);
      expect(detector.jankCount()).assertEqual(0);
      expect(detector.jankRatioPercent()).assertEqual(0);
      expect(detector.isHealthy(MAX_JANK_RATIO_PERCENT)).assertTrue();
      expect(detector.getBudget()).assertEqual(16.7);
      expect(detector.getJankThreshold()).assertEqual(33.4);
      logEnd(CASE_035);
    });

    /**
     * Scenario: a jank detector receives a spiky frame stream.
     * Expectation: the ratio of the janky frames is computed and the detector flags the stream
     * as unhealthy once the ratio exceeds the threshold.
     */
    it('Assessment_AnimationPerformance_036', 0, () => {
      logBegin(CASE_036);
      const detector: JankDetector = new JankDetector(FRAME_BUDGET_MS, JANK_THRESHOLD_MS);
      detector.addAll(buildSpikyFrames(100, 60, 5));
      expect(detector.count()).assertEqual(100);
      expect(detector.jankCount()).assertEqual(20);
      expect(detector.jankRatioPercent()).assertEqual(20);
      expect(detector.isHealthy(MAX_JANK_RATIO_PERCENT)).assertFalse();
      expect(detector.isHealthy(25)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', detector.toString());
      logEnd(CASE_036);
    });

    /**
     * Scenario: the worst and best frames of a stream are looked up.
     * Expectation: the extremes match the injected spike and baseline frames.
     */
    it('Assessment_AnimationPerformance_037', 0, () => {
      logBegin(CASE_037);
      const detector: JankDetector = new JankDetector(FRAME_BUDGET_MS, JANK_THRESHOLD_MS);
      detector.add(8.3);
      detector.add(120);
      detector.add(16.7);
      expect(detector.bestFrameMs()).assertEqual(8.3);
      expect(detector.worstFrameMs()).assertEqual(120);
      expect(detector.droppedCount()).assertEqual(1);
      expect(detector.totalMs()).assertEqual(145);
      logEnd(CASE_037);
    });

    /**
     * Scenario: the detector rejects invalid frames and can be reset.
     * Expectation: invalid frames never enter the population and the reset clears the stream.
     */
    it('Assessment_AnimationPerformance_038', 0, () => {
      logBegin(CASE_038);
      const detector: JankDetector = new JankDetector(FRAME_BUDGET_MS, JANK_THRESHOLD_MS);
      expect(detector.add(0)).assertFalse();
      expect(detector.add(-16)).assertFalse();
      expect(detector.count()).assertEqual(0);
      detector.addAll(buildSmoothFrames(10));
      expect(detector.count()).assertEqual(10);
      detector.reset();
      expect(detector.count()).assertEqual(0);
      expect(detector.jankCount()).assertEqual(0);
      expect(detector.bestFrameMs()).assertEqual(0);
      expect(detector.worstFrameMs()).assertEqual(0);
      logEnd(CASE_038);
    });

    /**
     * Scenario: the statistics of a frame stream are aggregated.
     * Expectation: the count, the total, the average, the minimum and the maximum match the
     * sample values.
     */
    it('Assessment_AnimationPerformance_039', 0, () => {
      logBegin(CASE_039);
      const stats: AnimationStats = new AnimationStats();
      expect(stats.addAll([10, 20, 30, 40])).assertEqual(4);
      expect(stats.count()).assertEqual(4);
      expect(stats.total()).assertEqual(100);
      expect(stats.average()).assertEqual(25);
      expect(stats.min()).assertEqual(10);
      expect(stats.max()).assertEqual(40);
      hilog.info(DOMAIN, TAG, '%{public}s', stats.toString());
      logEnd(CASE_039);
    });

    /**
     * Scenario: the percentile computation of the frame statistics.
     * Expectation: the nearest rank percentile of a hundred samples returns the documented
     * p50, p90 and p99 values.
     */
    it('Assessment_AnimationPerformance_040', 0, () => {
      logBegin(CASE_040);
      const stats: AnimationStats = new AnimationStats();
      for (let i = 1; i <= 100; i++) {
        stats.add(i);
      }
      expect(stats.percentile(50)).assertEqual(50);
      expect(stats.percentile(90)).assertEqual(90);
      expect(stats.percentile(99)).assertEqual(99);
      expect(stats.percentile(0)).assertEqual(1);
      expect(stats.percentile(100)).assertEqual(100);
      logEnd(CASE_040);
    });

    /**
     * Scenario: the percentiles of an empty statistics population.
     * Expectation: every aggregate answers zero instead of throwing.
     */
    it('Assessment_AnimationPerformance_041', 0, () => {
      logBegin(CASE_041);
      const stats: AnimationStats = new AnimationStats();
      expect(stats.count()).assertEqual(0);
      expect(stats.total()).assertEqual(0);
      expect(stats.average()).assertEqual(0);
      expect(stats.min()).assertEqual(0);
      expect(stats.max()).assertEqual(0);
      expect(stats.percentile(50)).assertEqual(0);
      expect(stats.sortedCopy().length).assertEqual(0);
      logEnd(CASE_041);
    });

    /**
     * Scenario: the sorted copy of the statistics.
     * Expectation: the copy is ordered while the insertion order of the source is preserved.
     */
    it('Assessment_AnimationPerformance_042', 0, () => {
      logBegin(CASE_042);
      const stats: AnimationStats = new AnimationStats();
      stats.addAll([30, 10, 20]);
      const sorted: number[] = stats.sortedCopy();
      expect(sorted.length).assertEqual(3);
      expect(sorted[0]).assertEqual(10);
      expect(sorted[1]).assertEqual(20);
      expect(sorted[2]).assertEqual(30);
      expect(stats.min()).assertEqual(10);
      expect(stats.max()).assertEqual(30);
      logEnd(CASE_042);
    });

    /**
     * Scenario: the animation report aggregates passing checks.
     * Expectation: a report without a failing check is passed and the summary reflects it.
     */
    it('Assessment_AnimationPerformance_043', 0, () => {
      logBegin(CASE_043);
      const report: AnimationReport = new AnimationReport();
      expect(report.check('budget', true)).assertTrue();
      expect(report.checkUpperBound('jank', 5, 10)).assertTrue();
      expect(report.checkLowerBound('frames', 60, 30)).assertTrue();
      expect(report.count()).assertEqual(3);
      expect(report.passedCount()).assertEqual(3);
      expect(report.failureCount()).assertEqual(0);
      expect(report.isPassed()).assertTrue();
      expect(report.summary()).assertEqual('animation-pass');
      logEnd(CASE_043);
    });

    /**
     * Scenario: the animation report records a failing check.
     * Expectation: the failing check is retained by name and the summary turns into the
     * failure marker.
     */
    it('Assessment_AnimationPerformance_044', 0, () => {
      logBegin(CASE_044);
      const report: AnimationReport = new AnimationReport();
      report.check('budget', true);
      expect(report.checkUpperBound('jank', 25, 10)).assertFalse();
      expect(report.failureCount()).assertEqual(1);
      expect(report.isPassed()).assertFalse();
      expect(report.summary()).assertEqual('animation-fail');
      expect(report.failureNames().length).assertEqual(1);
      expect(report.failureNames()[0]).assertEqual('jank');
      report.reset();
      expect(report.count()).assertEqual(0);
      expect(report.isPassed()).assertFalse();
      logEnd(CASE_044);
    });

    /**
     * Scenario: the whole animation pipeline is evaluated for the ten minute countdown.
     * Expectation: the tick cadence, the frame budget, the jank detector and the report all
     * agree that a countdown with one repaint per tick fits the budget.
     */
    it('Assessment_AnimationPerformance_045', 0, () => {
      logBegin(CASE_045);
      const cadence: TickCadenceModel = new TickCadenceModel(COUNTDOWN_INTERVAL);
      cadence.tickAtInterval(600, 0);
      const frames: FrameBudgetModel = new FrameBudgetModel(FRAME_BUDGET_MS);
      frames.recordFrames(8.3, 600);
      const detector: JankDetector = new JankDetector(FRAME_BUDGET_MS, JANK_THRESHOLD_MS);
      detector.addAll(buildSmoothFrames(600));
      const report: AnimationReport = new AnimationReport();
      report.check('ticks', cadence.count() === 600);
      report.check('drift', cadence.driftMs() === 0);
      report.checkUpperBound('utilization', frames.utilizationPercent(), MAX_FRAME_UTILIZATION_PERCENT);
      report.check('healthy', detector.isHealthy(MAX_JANK_RATIO_PERCENT));
      expect(report.isPassed()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', report.toString());
      logEnd(CASE_045);
    });
  });
}
