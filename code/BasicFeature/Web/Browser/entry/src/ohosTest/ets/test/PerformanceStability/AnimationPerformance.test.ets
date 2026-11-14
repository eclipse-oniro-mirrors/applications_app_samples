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
import { Driver } from '@ohos.UiTest';
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, runSerialized, startBrowserApp, serializedDelay, componentByIdExists, waitForId,
  progressVisibleAfter, progressResetAfterComplete, tabCapacityReached, nextTabIndex,
  MAX_TAB_COUNT, ID_INPUT_URL, TIMEOUT_TAB_SWITCH,
  DELAY_TAB_OPERATION, TOLERANCE_PROGRESS, PAD_HOME_PAGE
} from '../Shared/BrowserTestKit';
import {
  MockBrowser, MockWebController, MockLoadingStatus, MockNetwork, MockClock
} from '../Shared/BrowserMock';

const TAG: string = 'BrowserAnimationPerformanceTest';

/*
 * Frame budgets of the Web engine. The title bar and the tab strip animate on
 * the same render thread as the WebView, therefore a tab switch animation has
 * to fit into the display refresh interval. The budgets below mirror 60, 90 and
 * 120 Hz panels and are used as upper bounds, never as exact expectations.
 */
const FRAME_BUDGET_60HZ: number = 16.67;
const FRAME_BUDGET_90HZ: number = 11.11;
const FRAME_BUDGET_120HZ: number = 8.33;

/* Tolerances absorb scheduler jitter of the emulator and of the test host. */
const TOLERANCE_FRAME_TIME: number = 0.5;
const TOLERANCE_AVERAGE_FRAME: number = 2.0;
const TOLERANCE_SWITCH_DURATION: number = 24.0;
const TOLERANCE_DROP_RATE: number = 0.05;
const TOLERANCE_PROGRESS_STEP: number = 1;
const TOLERANCE_SWITCH_JITTER: number = 6.0;

/* Shape of the animations used by the tab strip and the progress bar. */
const TAB_SWITCH_FRAME_COUNT: number = 12;
const PROGRESS_FRAME_COUNT: number = 10;
const SCROLL_FRAME_COUNT: number = 24;
const STABILITY_ROUNDS: number = 40;
const PROGRESS_REFRESH_ROUNDS: number = 30;

/* A sampler keeps history bounded so long suites cannot grow the heap. */
const SAMPLER_CAPACITY: number = 256;

/*
 * One rendered frame. `dropped` means the frame exceeded the refresh budget of
 * the panel, which is exactly the metric the browser team tracks as jank.
 */
interface FrameSample {
  index: number;
  durationMs: number;
  budgetMs: number;
  dropped: boolean;
}

/** Frame statistics used by a single animation run. */
interface FrameSummary {
  frameCount: number;
  averageMs: number;
  maximumMs: number;
  minimumMs: number;
  p90Ms: number;
  droppedFrames: number;
  dropRate: number;
}

/**
 * Deterministic pseudo random source.
 *
 * Every performance assertion needs numbers that are stable between runs of the
 * suite, otherwise a threshold check becomes a coin flip. A small LCG gives the
 * animation simulators a reproducible jitter without depending on Math.random.
 */
class DeterministicJitter {
  private seed: number;
  private initialSeed: number;

  constructor(seed: number = 20260101) {
    this.seed = seed;
    this.initialSeed = seed;
  }

  /** Returns a value in [0, 1). */
  next(): number {
    this.seed = (this.seed * 1103515245 + 12345) % 2147483648;
    if (this.seed < 0) {
      this.seed = this.seed + 2147483648;
    }
    return this.seed / 2147483648;
  }

  /** Returns a value in [min, max). */
  range(min: number, max: number): number {
    return min + (max - min) * this.next();
  }

  /** Returns a value in [-spread, spread]. */
  symmetric(spread: number): number {
    return this.range(-spread, spread);
  }

  reset(): void {
    this.seed = this.initialSeed;
  }
}

/**
 * Rolling frame sampler.
 *
 * The sampler owns three responsibilities:
 *  - decide whether a frame missed the refresh budget,
 *  - keep aggregate statistics for threshold assertions,
 *  - bound its own memory so a 200 round stability loop stays cheap.
 */
class FrameSampler {
  private budgetMs: number;
  private capacity: number;
  private frames: FrameSample[] = [];
  private durations: number[] = [];
  private totalMs: number = 0;
  private maxMs: number = 0;
  private minMs: number = -1;
  private dropped: number = 0;
  private evicted: number = 0;

  constructor(budgetMs: number = FRAME_BUDGET_60HZ, capacity: number = SAMPLER_CAPACITY) {
    this.budgetMs = budgetMs <= 0 ? FRAME_BUDGET_60HZ : budgetMs;
    this.capacity = capacity <= 0 ? 1 : capacity;
  }

  getBudget(): number {
    return this.budgetMs;
  }

  getCapacity(): number {
    return this.capacity;
  }

  /** Records one frame and returns the derived sample. */
  record(durationMs: number): FrameSample {
    const safeDuration: number = durationMs < 0 ? 0 : durationMs;
    const dropped: boolean = safeDuration > this.budgetMs + TOLERANCE_FRAME_TIME;
    const sample: FrameSample = {
      index: this.frames.length,
      durationMs: safeDuration,
      budgetMs: this.budgetMs,
      dropped: dropped
    };
    this.frames.push(sample);
    this.durations.push(safeDuration);
    this.totalMs += safeDuration;
    if (safeDuration > this.maxMs) {
      this.maxMs = safeDuration;
    }
    if (this.minMs < 0 || safeDuration < this.minMs) {
      this.minMs = safeDuration;
    }
    if (dropped) {
      this.dropped += 1;
    }
    if (this.frames.length > this.capacity) {
      const removed: FrameSample = this.frames.shift() as FrameSample;
      this.durations.shift();
      this.totalMs -= removed.durationMs;
      this.evicted += 1;
    }
    return sample;
  }

  /** Records a whole frame series produced by an animation simulator. */
  recordAll(durations: number[]): FrameSample[] {
    const result: FrameSample[] = [];
    for (let index = 0; index < durations.length; index++) {
      result.push(this.record(durations[index]));
    }
    return result;
  }

  size(): number {
    return this.frames.length;
  }

  getSamples(): FrameSample[] {
    return this.frames.slice(0);
  }

  getDurations(): number[] {
    return this.durations.slice(0);
  }

  droppedFrames(): number {
    return this.dropped;
  }

  evictedFrames(): number {
    return this.evicted;
  }

  totalDuration(): number {
    return this.totalMs;
  }

  averageFrameMs(): number {
    if (this.frames.length === 0) {
      return 0;
    }
    return this.totalMs / this.frames.length;
  }

  maximumFrameMs(): number {
    return this.maxMs;
  }

  minimumFrameMs(): number {
    return this.minMs < 0 ? 0 : this.minMs;
  }

  /** Nearest rank percentile, p in (0, 100]. */
  percentile(p: number): number {
    if (this.durations.length === 0) {
      return 0;
    }
    const sorted: number[] = this.durations.slice(0);
    sorted.sort((left: number, right: number) => left - right);
    const clamped: number = p <= 0 ? 1 : (p > 100 ? 100 : p);
    const position: number = Math.ceil(clamped / 100 * sorted.length) - 1;
    const index: number = position < 0 ? 0 : position;
    return sorted[index];
  }

  /** Share of frames that missed the budget, in [0, 1]. */
  dropRate(): number {
    if (this.frames.length === 0) {
      return 0;
    }
    return this.dropped / this.frames.length;
  }

  /** Counts frames slower than an explicit millisecond threshold. */
  framesSlowerThan(thresholdMs: number): number {
    let counter: number = 0;
    for (let index = 0; index < this.durations.length; index++) {
      if (this.durations[index] > thresholdMs) {
        counter += 1;
      }
    }
    return counter;
  }

  /** True when average frame time and drop rate both stay in budget. */
  isSmooth(maxAverageMs: number = 20, maxDropRate: number = TOLERANCE_DROP_RATE): boolean {
    if (this.frames.length === 0) {
      return true;
    }
    return this.averageFrameMs() <= maxAverageMs && this.dropRate() <= maxDropRate;
  }

  /** A 0..100 score where 100 means every frame fit the budget. */
  smoothScore(): number {
    if (this.frames.length === 0) {
      return 100;
    }
    const score: number = 100 - this.dropRate() * 100;
    return score < 0 ? 0 : Math.round(score * 100) / 100;
  }

  summary(): FrameSummary {
    return {
      frameCount: this.frames.length,
      averageMs: this.averageFrameMs(),
      maximumMs: this.maximumFrameMs(),
      minimumMs: this.minimumFrameMs(),
      p90Ms: this.percentile(90),
      droppedFrames: this.dropped,
      dropRate: this.dropRate()
    };
  }

  reset(): void {
    this.frames = [];
    this.durations = [];
    this.totalMs = 0;
    this.maxMs = 0;
    this.minMs = -1;
    this.dropped = 0;
    this.evicted = 0;
  }
}

/** Wall clock bracket of one animation, driven by MockClock for determinism. */
class AnimationTimeline {
  private clock: MockClock;
  private startMs: number = -1;
  private endMs: number = -1;
  private running: boolean = false;

  constructor(clock: MockClock) {
    this.clock = clock;
  }

  begin(): number {
    this.startMs = this.clock.now();
    this.endMs = -1;
    this.running = true;
    return this.startMs;
  }

  finish(): number {
    this.endMs = this.clock.now();
    this.running = false;
    return this.elapsed();
  }

  elapsed(): number {
    if (this.startMs < 0) {
      return 0;
    }
    if (this.endMs < 0) {
      return this.clock.now() - this.startMs;
    }
    return this.endMs - this.startMs;
  }

  isRunning(): boolean {
    return this.running;
  }

  startedAt(): number {
    return this.startMs;
  }

  finishedAt(): number {
    return this.endMs;
  }

  reset(): void {
    this.startMs = -1;
    this.endMs = -1;
    this.running = false;
  }
}
/**
 * Models the tab strip switch animation.
 *
 * A switch is only legal when the target index exists, therefore the simulator
 * delegates the index bookkeeping to MockBrowser and only animates the frames
 * afterwards. Illegal switches are counted, never animated, which mirrors the
 * guard of Tabs.onChange in WebTab.ets.
 */
class TabsSwitchSimulator {
  browser: MockBrowser;
  private jitter: DeterministicJitter;
  private frameBudget: number;
  switchCount: number = 0;
  rejectedSwitches: number = 0;
  durations: number[] = [];
  lastSampler: FrameSampler;
  lastFromIndex: number = -1;
  lastTargetIndex: number = -1;

  constructor(browser: MockBrowser, frameBudget: number = FRAME_BUDGET_60HZ,
    seed: number = 20260101) {
    this.browser = browser;
    this.frameBudget = frameBudget;
    this.jitter = new DeterministicJitter(seed);
    this.lastSampler = new FrameSampler(frameBudget);
  }

  getFrameBudget(): number {
    return this.frameBudget;
  }

  /** Frame durations of one switch: ease-in-out shape plus bounded jitter. */
  private buildFrames(frameCount: number): number[] {
    const result: number[] = [];
    const total: number = frameCount <= 0 ? TAB_SWITCH_FRAME_COUNT : frameCount;
    for (let index = 0; index < total; index++) {
      const ratio: number = total === 1 ? 0.5 : index / (total - 1);
      const eased: number = 1 - Math.abs(2 * ratio - 1);
      const base: number = this.frameBudget * (0.55 + 0.35 * eased);
      const jittered: number = base + this.jitter.symmetric(TOLERANCE_SWITCH_JITTER / 2);
      result.push(jittered < 0.1 ? 0.1 : jittered);
    }
    return result;
  }

  switchTo(index: number, frameCount: number = TAB_SWITCH_FRAME_COUNT): boolean {
    const fromIndex: number = this.browser.getTabArrayIndex();
    if (!this.browser.selectTab(index)) {
      this.rejectedSwitches += 1;
      TestLogger.warn(TAG, `switch rejected from ${fromIndex} to ${index}`);
      return false;
    }
    const sampler: FrameSampler = new FrameSampler(this.frameBudget);
    const frames: number[] = this.buildFrames(frameCount);
    sampler.recordAll(frames);
    this.lastSampler = sampler;
    this.lastFromIndex = fromIndex;
    this.lastTargetIndex = index;
    this.switchCount += 1;
    this.durations.push(sampler.totalDuration());
    return true;
  }

  /** Switch back to the previously active tab. */
  switchBack(): boolean {
    if (this.lastFromIndex < 0) {
      return false;
    }
    return this.switchTo(this.lastFromIndex);
  }

  averageSwitchDuration(): number {
    if (this.durations.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let index = 0; index < this.durations.length; index++) {
      total += this.durations[index];
    }
    return total / this.durations.length;
  }

  maximumSwitchDuration(): number {
    let result: number = 0;
    for (let index = 0; index < this.durations.length; index++) {
      if (this.durations[index] > result) {
        result = this.durations[index];
      }
    }
    return result;
  }

  minimumSwitchDuration(): number {
    if (this.durations.length === 0) {
      return 0;
    }
    let result: number = this.durations[0];
    for (let index = 1; index < this.durations.length; index++) {
      if (this.durations[index] < result) {
        result = this.durations[index];
      }
    }
    return result;
  }

  /**
   * Drift between the first and the second half of the recorded switches.
   * A positive value means the later switches became slower, which is the
   * classic symptom of a leaking per tab animation object.
   */
  durationDrift(): number {
    if (this.durations.length < 4) {
      return 0;
    }
    const half: number = Math.floor(this.durations.length / 2);
    let firstTotal: number = 0;
    let secondTotal: number = 0;
    for (let index = 0; index < half; index++) {
      firstTotal += this.durations[index];
    }
    for (let index = half; index < this.durations.length; index++) {
      secondTotal += this.durations[index];
    }
    const firstAverage: number = firstTotal / half;
    const secondAverage: number = secondTotal / (this.durations.length - half);
    return secondAverage - firstAverage;
  }

  /** Deterministic round robin over every tab, used by the stability suites. */
  roundRobin(rounds: number): number {
    let executed: number = 0;
    const tabCount: number = this.browser.tabs.length;
    for (let round = 0; round < rounds; round++) {
      const target: number = round % tabCount;
      if (this.switchTo(target)) {
        executed += 1;
      }
    }
    return executed;
  }

  reset(): void {
    this.switchCount = 0;
    this.rejectedSwitches = 0;
    this.durations = [];
    this.lastSampler = new FrameSampler(this.frameBudget);
    this.lastFromIndex = -1;
    this.lastTargetIndex = -1;
    this.jitter.reset();
  }
}

/**
 * Models the thin progress bar of the Web component.
 *
 * WebTab.ets forwards onProgressChange directly into Browser.progress and hides
 * the bar once 100 is reached. The animator keeps the raw event stream so the
 * suite can assert monotonic growth and the reset to zero.
 */
class ProgressBarAnimator {
  browser: MockBrowser;
  events: number[] = [];
  visibleFrames: number = 0;
  hiddenFrames: number = 0;
  regressions: number = 0;
  completedCount: number = 0;
  private previous: number = -1;

  constructor(browser: MockBrowser) {
    this.browser = browser;
  }

  /** Feeds one progress event, exactly like Web.onProgressChange does. */
  feed(progress: number): void {
    const clamped: number = progress < 0 ? 0 : (progress > 100 ? 100 : progress);
    if (this.previous >= 0 && clamped < this.previous) {
      this.regressions += 1;
    }
    this.previous = clamped;
    this.events.push(clamped);
    this.browser.onProgressChange(clamped);
    if (progressVisibleAfter(clamped)) {
      this.visibleFrames += 1;
    } else {
      this.hiddenFrames += 1;
      this.completedCount += 1;
    }
  }

  feedSequence(values: number[]): void {
    for (let index = 0; index < values.length; index++) {
      this.feed(values[index]);
    }
  }

  /** Feeds a realistic 0..100 sweep with a fixed step. */
  feedSweep(step: number = PROGRESS_FRAME_COUNT): void {
    const safeStep: number = step <= 0 ? 1 : step;
    for (let value = 0; value <= 100; value += safeStep) {
      this.feed(value > 100 ? 100 : value);
    }
    if (this.events.length === 0 || this.events[this.events.length - 1] !== 100) {
      this.feed(100);
    }
  }

  eventCount(): number {
    return this.events.length;
  }

  isMonotonic(): boolean {
    return this.regressions === 0;
  }

  /** Largest gap between two consecutive events, used for jitter checks. */
  maximumGap(): number {
    let result: number = 0;
    for (let index = 1; index < this.events.length; index++) {
      const gap: number = this.events[index] - this.events[index - 1];
      if (gap > result) {
        result = gap;
      }
    }
    return result;
  }

  /** Number of events whose delta exceeds the allowed step plus tolerance. */
  gapsBeyond(step: number): number {
    let counter: number = 0;
    for (let index = 1; index < this.events.length; index++) {
      const gap: number = this.events[index] - this.events[index - 1];
      if (gap > step + TOLERANCE_PROGRESS_STEP) {
        counter += 1;
      }
    }
    return counter;
  }

  resetCompleted(): boolean {
    return this.browser.progress === progressResetAfterComplete(100);
  }

  reset(): void {
    this.events = [];
    this.visibleFrames = 0;
    this.hiddenFrames = 0;
    this.regressions = 0;
    this.completedCount = 0;
    this.previous = -1;
  }
}

/**
 * Frame source whose pacing depends on the simulated network state.
 *
 * When the network double reports an offline state the Web engine still has to
 * paint the cached page, yet every navigation hint costs an extra slice of the
 * frame budget. The source makes that cost measurable and deterministic.
 */
class PacedFrameSource {
  private network: MockNetwork;
  private jitter: DeterministicJitter;

  constructor(network: MockNetwork, seed: number = 424242) {
    this.network = network;
    this.jitter = new DeterministicJitter(seed);
  }

  nextFrameDuration(baseMs: number): number {
    const latencyPenalty: number = this.network.online ? 0 : this.network.latencyMs * 0.15;
    const jittered: number = baseMs + latencyPenalty + this.jitter.symmetric(0.6);
    return jittered < 0.1 ? 0.1 : jittered;
  }

  /** Produces a full frame series for one navigation animation. */
  buildSeries(baseMs: number, frameCount: number): number[] {
    const result: number[] = [];
    for (let index = 0; index < frameCount; index++) {
      result.push(this.nextFrameDuration(baseMs));
    }
    return result;
  }
}

/** Models the inertial scroll of a long article inside the WebView. */
class ScrollAnimationSimulator {
  private jitter: DeterministicJitter;
  private frameBudget: number;
  offsetPx: number = 0;
  private stepPx: number;

  constructor(frameBudget: number = FRAME_BUDGET_60HZ, stepPx: number = 48,
    seed: number = 777001) {
    this.frameBudget = frameBudget;
    this.stepPx = stepPx <= 0 ? 1 : stepPx;
    this.jitter = new DeterministicJitter(seed);
  }

  /** A fling decelerates, therefore later frames are cheaper to paint. */
  private frameDuration(index: number, total: number): number {
    const ratio: number = total <= 1 ? 0 : index / (total - 1);
    const decay: number = 1 - 0.45 * ratio;
    const base: number = this.frameBudget * 0.6 * decay;
    return base + this.jitter.symmetric(0.8);
  }

  fling(frameCount: number = SCROLL_FRAME_COUNT): FrameSampler {
    const sampler: FrameSampler = new FrameSampler(this.frameBudget);
    for (let index = 0; index < frameCount; index++) {
      sampler.record(this.frameDuration(index, frameCount));
      this.offsetPx += this.stepPx;
    }
    return sampler;
  }

  reset(): void {
    this.offsetPx = 0;
    this.jitter.reset();
  }
}
export default function browserAnimationPerformanceTest() {
  describe('browserAnimationPerformanceTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'animation performance suite begin');
      TestLogger.resetSteps(TAG);
      await startBrowserApp();
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    /* ---------------------------------------------------------------- */
    /* Frame sampler: the measurement layer of every animation case.     */
    /* ---------------------------------------------------------------- */

    it('Animation_FrameSampler_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_FrameSampler_001');
      TestLogger.step(TAG, 'record one frame inside the 60 Hz budget');
      const sampler: FrameSampler = new FrameSampler(FRAME_BUDGET_60HZ);
      const sample: FrameSample = sampler.record(FRAME_BUDGET_60HZ - 2);
      TestLogger.info(TAG, `recorded frame ${sample.durationMs} ms, dropped=${sample.dropped}`);
      expect(sample.dropped).assertFalse();
      expect(sampler.droppedFrames()).assertEqual(0);
      expect(sampler.size()).assertEqual(1);
      TestLogger.pass(TAG, 'Animation_FrameSampler_001');
    });

    it('Animation_FrameSampler_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_FrameSampler_003');
      TestLogger.step(TAG, 'record a frame exactly on the budget boundary');
      const sampler: FrameSampler = new FrameSampler(FRAME_BUDGET_60HZ);
      const sample: FrameSample = sampler.record(FRAME_BUDGET_60HZ);
      TestLogger.info(TAG, `boundary frame ${sample.durationMs} ms, dropped=${sample.dropped}`);
      expect(sample.dropped).assertFalse();
      expect(sampler.droppedFrames()).assertEqual(0);
      expect(sampler.isSmooth()).assertTrue();
      TestLogger.pass(TAG, 'Animation_FrameSampler_003');
    });

    it('Animation_FrameSampler_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_FrameSampler_004');
      TestLogger.step(TAG, 'verify average frame time and accumulated duration');
      const sampler: FrameSampler = new FrameSampler(FRAME_BUDGET_60HZ);
      sampler.recordAll([10, 12, 14, 16]);
      const average: number = sampler.averageFrameMs();
      TestLogger.info(TAG, `average frame ${average} ms over ${sampler.size()} frames`);
      expect(sampler.size()).assertEqual(4);
      expect(sampler.totalDuration()).assertEqual(52);
      expect(Math.abs(average - 13)).assertLess(TOLERANCE_AVERAGE_FRAME);
      expect(sampler.summary().frameCount).assertEqual(4);
      TestLogger.pass(TAG, 'Animation_FrameSampler_004');
    });

    it('Animation_FrameSampler_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_FrameSampler_005');
      TestLogger.step(TAG, 'verify extreme frame durations');
      const sampler: FrameSampler = new FrameSampler(FRAME_BUDGET_60HZ);
      sampler.recordAll([4, 18, 9, 25]);
      TestLogger.info(TAG, `max=${sampler.maximumFrameMs()} min=${sampler.minimumFrameMs()}`);
      expect(sampler.maximumFrameMs()).assertEqual(25);
      expect(sampler.minimumFrameMs()).assertEqual(4);
      expect(sampler.droppedFrames()).assertEqual(2);
      TestLogger.pass(TAG, 'Animation_FrameSampler_005');
    });

    it('Animation_FrameSampler_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_FrameSampler_006');
      TestLogger.step(TAG, 'compute the p90 frame time of a long sample');
      const sampler: FrameSampler = new FrameSampler(FRAME_BUDGET_60HZ);
      for (let index = 0; index < 100; index++) {
        sampler.record(8 + index % 20);
      }
      const p90: number = sampler.percentile(90);
      TestLogger.info(TAG, `p90 frame time ${p90} ms`);
      expect(p90).assertLarger(0);
      expect(p90).assertLess(sampler.maximumFrameMs() + 1);
      expect(sampler.percentile(50)).assertLess(p90 + 1);
      expect(sampler.percentile(100)).assertEqual(sampler.maximumFrameMs());
      TestLogger.pass(TAG, 'Animation_FrameSampler_006');
    });
    it('Animation_FrameSampler_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_FrameSampler_007');
      TestLogger.step(TAG, 'verify drop rate arithmetic over a mixed series');
      const sampler: FrameSampler = new FrameSampler(FRAME_BUDGET_60HZ);
      sampler.recordAll([10, 40, 12, 10, 30, 11, 13, 12]);
      const rate: number = sampler.dropRate();
      TestLogger.info(TAG, `drop rate ${rate} from ${sampler.droppedFrames()} frames`);
      expect(sampler.droppedFrames()).assertEqual(2);
      expect(sampler.framesSlowerThan(25)).assertEqual(2);
      expect(Math.abs(rate - 0.25)).assertLess(0.001);
      expect(sampler.isSmooth(20, 0.5)).assertTrue();
      expect(sampler.isSmooth(20, 0.1)).assertFalse();
      TestLogger.pass(TAG, 'Animation_FrameSampler_007');
    });

    it('Animation_FrameSampler_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_FrameSampler_008');
      TestLogger.step(TAG, 'verify the smooth score of a jank free animation');
      const clean: FrameSampler = new FrameSampler(FRAME_BUDGET_60HZ);
      clean.recordAll([10, 11, 12, 11, 10]);
      const dirty: FrameSampler = new FrameSampler(FRAME_BUDGET_60HZ);
      dirty.recordAll([10, 45, 12, 50, 10]);
      TestLogger.info(TAG, `clean score ${clean.smoothScore()} dirty score ${dirty.smoothScore()}`);
      expect(clean.smoothScore()).assertEqual(100);
      expect(dirty.smoothScore()).assertLess(100);
      expect(dirty.smoothScore()).assertLarger(0);
      expect(clean.isSmooth()).assertTrue();
      TestLogger.pass(TAG, 'Animation_FrameSampler_008');
    });

    it('Animation_FrameSampler_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_FrameSampler_009');
      TestLogger.step(TAG, 'keep the sample history bounded during a long run');
      const sampler: FrameSampler = new FrameSampler(FRAME_BUDGET_60HZ, 16);
      for (let index = 0; index < 64; index++) {
        sampler.record(FRAME_BUDGET_60HZ - 4);
      }
      TestLogger.info(TAG, `bounded sampler holds ${sampler.size()} frames`);
      expect(sampler.size()).assertEqual(16);
      expect(sampler.getCapacity()).assertEqual(16);
      expect(sampler.evictedFrames()).assertEqual(48);
      expect(sampler.averageFrameMs()).assertLess(FRAME_BUDGET_60HZ);
      TestLogger.pass(TAG, 'Animation_FrameSampler_009');
    });

    it('Animation_FrameSampler_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_FrameSampler_010');
      TestLogger.step(TAG, 'reset the sampler between two animations');
      const sampler: FrameSampler = new FrameSampler(FRAME_BUDGET_90HZ);
      sampler.recordAll([6, 40, 8]);
      sampler.reset();
      TestLogger.info(TAG, `after reset size=${sampler.size()} dropped=${sampler.droppedFrames()}`);
      expect(sampler.size()).assertEqual(0);
      expect(sampler.droppedFrames()).assertEqual(0);
      expect(sampler.averageFrameMs()).assertEqual(0);
      expect(sampler.percentile(90)).assertEqual(0);
      expect(sampler.isSmooth()).assertTrue();
      expect(sampler.getBudget()).assertEqual(FRAME_BUDGET_90HZ);
      TestLogger.pass(TAG, 'Animation_FrameSampler_010');
    });

    /* ---------------------------------------------------------------- */
    /* Tab strip switch animation.                                       */
    /* ---------------------------------------------------------------- */

    it('Animation_TabSwitch_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_TabSwitch_011');
      TestLogger.step(TAG, 'switch to an existing tab and animate the transition');
      const browser: MockBrowser = new MockBrowser(3);
      const simulator: TabsSwitchSimulator = new TabsSwitchSimulator(browser);
      const moved: boolean = simulator.switchTo(2);
      TestLogger.info(TAG, `switch accepted=${moved} index=${browser.getTabArrayIndex()}`);
      expect(moved).assertTrue();
      expect(browser.getTabArrayIndex()).assertEqual(2);
      expect(simulator.lastSampler.size()).assertEqual(TAB_SWITCH_FRAME_COUNT);
      expect(simulator.switchCount).assertEqual(1);
      expect(simulator.rejectedSwitches).assertEqual(0);
      expect(simulator.lastFromIndex).assertEqual(0);
      TestLogger.pass(TAG, 'Animation_TabSwitch_011');
    });

    it('Animation_TabSwitch_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_TabSwitch_012');
      TestLogger.step(TAG, 'reject a switch to an index outside the tab strip');
      const browser: MockBrowser = new MockBrowser(2);
      const simulator: TabsSwitchSimulator = new TabsSwitchSimulator(browser);
      const negative: boolean = simulator.switchTo(-1);
      const overflow: boolean = simulator.switchTo(9);
      TestLogger.info(TAG, `negative=${negative} overflow=${overflow} rejected=${simulator.rejectedSwitches}`);
      expect(negative).assertFalse();
      expect(overflow).assertFalse();
      expect(simulator.rejectedSwitches).assertEqual(2);
      expect(simulator.switchCount).assertEqual(0);
      expect(browser.getTabArrayIndex()).assertEqual(0);
      TestLogger.pass(TAG, 'Animation_TabSwitch_012');
    });
    it('Animation_TabSwitch_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_TabSwitch_013');
      TestLogger.step(TAG, 'compare the switch duration with the frame sum');
      const browser: MockBrowser = new MockBrowser(2);
      const simulator: TabsSwitchSimulator = new TabsSwitchSimulator(browser);
      simulator.switchTo(1);
      const durations: number[] = simulator.lastSampler.getDurations();
      let manualSum: number = 0;
      for (let index = 0; index < durations.length; index++) {
        manualSum += durations[index];
      }
      TestLogger.info(TAG, `manual sum ${manualSum} sampler sum ${simulator.lastSampler.totalDuration()}`);
      expect(Math.abs(manualSum - simulator.lastSampler.totalDuration())).assertLess(0.001);
      expect(simulator.durations.length).assertEqual(1);
      expect(Math.abs(simulator.durations[0] - manualSum)).assertLess(0.001);
      TestLogger.pass(TAG, 'Animation_TabSwitch_013');
    });

    it('Animation_TabSwitch_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_TabSwitch_014');
      TestLogger.step(TAG, 'check that a single switch fits the refresh budget');
      const browser: MockBrowser = new MockBrowser(4);
      const simulator: TabsSwitchSimulator = new TabsSwitchSimulator(browser);
      simulator.switchTo(3);
      const budgetTotal: number = FRAME_BUDGET_60HZ * TAB_SWITCH_FRAME_COUNT;
      const total: number = simulator.averageSwitchDuration();
      TestLogger.info(TAG, `switch animation total ${total} ms against budget ${budgetTotal} ms`);
      expect(total).assertLess(budgetTotal + TOLERANCE_SWITCH_DURATION);
      expect(simulator.lastSampler.averageFrameMs()).assertLess(FRAME_BUDGET_60HZ + TOLERANCE_FRAME_TIME);
      expect(simulator.lastSampler.droppedFrames()).assertEqual(0);
      expect(simulator.maximumSwitchDuration()).assertEqual(total);
      TestLogger.pass(TAG, 'Animation_TabSwitch_014');
    });

    it('Animation_TabSwitch_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_TabSwitch_015');
      TestLogger.step(TAG, 'switch away and back to the original tab');
      const browser: MockBrowser = new MockBrowser(3);
      const simulator: TabsSwitchSimulator = new TabsSwitchSimulator(browser);
      simulator.switchTo(2);
      const back: boolean = simulator.switchBack();
      TestLogger.info(TAG, `switch back accepted=${back} index=${browser.getTabArrayIndex()}`);
      expect(back).assertTrue();
      expect(browser.getTabArrayIndex()).assertEqual(0);
      expect(simulator.switchCount).assertEqual(2);
      expect(simulator.durations.length).assertEqual(2);
      TestLogger.pass(TAG, 'Animation_TabSwitch_015');
    });

    it('Animation_TabSwitch_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_TabSwitch_016');
      TestLogger.step(TAG, 'run forty consecutive tab switch animations');
      const browser: MockBrowser = new MockBrowser(5);
      const simulator: TabsSwitchSimulator = new TabsSwitchSimulator(browser);
      const executed: number = simulator.roundRobin(STABILITY_ROUNDS);
      const index: number = browser.getTabArrayIndex();
      TestLogger.info(TAG, `executed ${executed} switches, final index ${index}`);
      expect(executed).assertEqual(STABILITY_ROUNDS);
      expect(simulator.switchCount).assertEqual(STABILITY_ROUNDS);
      expect(simulator.rejectedSwitches).assertEqual(0);
      expect(index >= 0 && index < browser.tabs.length).assertTrue();
      expect(simulator.maximumSwitchDuration()).assertLess(FRAME_BUDGET_60HZ * TAB_SWITCH_FRAME_COUNT
        + TOLERANCE_SWITCH_DURATION);
      TestLogger.pass(TAG, 'Animation_TabSwitch_016');
    });

    it('Animation_TabSwitch_017', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_TabSwitch_017');
      TestLogger.step(TAG, 'measure the duration drift of repeated switches');
      const browser: MockBrowser = new MockBrowser(4);
      const simulator: TabsSwitchSimulator = new TabsSwitchSimulator(browser);
      simulator.roundRobin(24);
      const drift: number = simulator.durationDrift();
      TestLogger.info(TAG, `duration drift ${drift} ms over ${simulator.durations.length} switches`);
      expect(Math.abs(drift)).assertLess(TOLERANCE_SWITCH_JITTER);
      expect(simulator.averageSwitchDuration()).assertLarger(0);
      expect(simulator.minimumSwitchDuration()).assertLarger(0);
      TestLogger.pass(TAG, 'Animation_TabSwitch_017');
    });

    it('Animation_TabSwitch_018', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_TabSwitch_018');
      TestLogger.step(TAG, 'keep the page history of every tab across a switch');
      const browser: MockBrowser = new MockBrowser(2);
      const simulator: TabsSwitchSimulator = new TabsSwitchSimulator(browser);
      const firstController: MockWebController = browser.tabs[0].controller;
      firstController.loadUrl('https://www.example.com/first');
      firstController.loadUrl('https://www.example.com/second');
      simulator.switchTo(1);
      simulator.switchTo(0);
      TestLogger.info(TAG, `history depth after round trip ${firstController.history.length}`);
      expect(firstController.history.length).assertEqual(2);
      expect(firstController.currentUrl).assertEqual('https://www.example.com/second');
      expect(firstController.accessBackward()).assertTrue();
      expect(browser.tabs[1].controller.history.length).assertEqual(0);
      TestLogger.pass(TAG, 'Animation_TabSwitch_018');
    });
    /* ---------------------------------------------------------------- */
    /* Progress bar refresh animation.                                   */
    /* ---------------------------------------------------------------- */

    it('Animation_ProgressBar_019', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_ProgressBar_019');
      TestLogger.step(TAG, 'feed a full progress sweep and inspect bar visibility');
      const browser: MockBrowser = new MockBrowser();
      const animator: ProgressBarAnimator = new ProgressBarAnimator(browser);
      browser.onPageBegin('https://www.example.com');
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.LOADING);
      animator.feedSweep(PROGRESS_FRAME_COUNT);
      TestLogger.info(TAG, `events=${animator.eventCount()} visible=${animator.visibleFrames} hidden=${animator.hiddenFrames}`);
      expect(animator.eventCount()).assertEqual(PROGRESS_FRAME_COUNT + 1);
      expect(animator.hiddenFrames).assertEqual(1);
      expect(animator.completedCount).assertEqual(1);
      expect(animator.visibleFrames).assertEqual(PROGRESS_FRAME_COUNT);
      expect(browser.hideProgress).assertTrue();
      expect(browser.progress).assertEqual(0);
      TestLogger.pass(TAG, 'Animation_ProgressBar_019');
    });

    it('Animation_ProgressBar_020', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_ProgressBar_020');
      TestLogger.step(TAG, 'verify the progress stream is monotonic during a load');
      const browser: MockBrowser = new MockBrowser();
      const animator: ProgressBarAnimator = new ProgressBarAnimator(browser);
      animator.feedSequence([0, 5, 12, 25, 40, 55, 68, 80, 91, 100]);
      TestLogger.info(TAG, `monotonic=${animator.isMonotonic()} max gap=${animator.maximumGap()}`);
      expect(animator.isMonotonic()).assertTrue();
      expect(animator.regressions).assertEqual(0);
      expect(animator.maximumGap()).assertLarger(TOLERANCE_PROGRESS);
      expect(animator.maximumGap()).assertLess(20);
      expect(animator.gapsBeyond(15)).assertEqual(0);
      TestLogger.pass(TAG, 'Animation_ProgressBar_020');
    });

    it('Animation_ProgressBar_021', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_ProgressBar_021');
      TestLogger.step(TAG, 'reset the bar to zero once the page finished');
      const browser: MockBrowser = new MockBrowser();
      const animator: ProgressBarAnimator = new ProgressBarAnimator(browser);
      animator.feed(60);
      expect(browser.hideProgress).assertFalse();
      expect(Math.abs(browser.progress - 60)).assertLess(TOLERANCE_PROGRESS);
      animator.feed(100);
      TestLogger.info(TAG, `after completion progress=${browser.progress} hidden=${browser.hideProgress}`);
      expect(animator.resetCompleted()).assertTrue();
      expect(progressResetAfterComplete(100)).assertEqual(0);
      expect(progressVisibleAfter(100)).assertFalse();
      expect(browser.progress).assertEqual(0);
      TestLogger.pass(TAG, 'Animation_ProgressBar_021');
    });

    it('Animation_ProgressBar_022', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_ProgressBar_022');
      TestLogger.step(TAG, 'repeat thirty quick progress refreshes without regression');
      const browser: MockBrowser = new MockBrowser();
      const animator: ProgressBarAnimator = new ProgressBarAnimator(browser);
      for (let round = 0; round < PROGRESS_REFRESH_ROUNDS; round++) {
        animator.feed((round * 3) % 100);
      }
      const gapViolations: number = animator.gapsBeyond(3);
      TestLogger.info(TAG, `rounds=${PROGRESS_REFRESH_ROUNDS} events=${animator.eventCount()}`);
      expect(animator.eventCount()).assertEqual(PROGRESS_REFRESH_ROUNDS);
      expect(gapViolations).assertEqual(0);
      expect(browser.hideProgress).assertFalse();
      expect(browser.loadingStatus).assertEqual(MockLoadingStatus.END);
      TestLogger.pass(TAG, 'Animation_ProgressBar_022');
    });
    /* ---------------------------------------------------------------- */
    /* Frame rate of the whole tab strip on high refresh panels.          */
    /* ---------------------------------------------------------------- */

    it('Animation_FrameRate_023', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_FrameRate_023');
      TestLogger.step(TAG, 'animate a tab switch on a 90 Hz panel');
      const browser: MockBrowser = new MockBrowser(3);
      const simulator: TabsSwitchSimulator = new TabsSwitchSimulator(browser, FRAME_BUDGET_90HZ, 9001);
      simulator.switchTo(1);
      const average: number = simulator.lastSampler.averageFrameMs();
      TestLogger.info(TAG, `90 Hz average frame ${average} ms, budget ${FRAME_BUDGET_90HZ} ms`);
      expect(average).assertLess(FRAME_BUDGET_90HZ + TOLERANCE_AVERAGE_FRAME);
      expect(simulator.lastSampler.dropRate()).assertLess(0.5);
      expect(simulator.lastSampler.getBudget()).assertEqual(FRAME_BUDGET_90HZ);
      TestLogger.pass(TAG, 'Animation_FrameRate_023');
    });

    it('Animation_FrameRate_024', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_FrameRate_024');
      TestLogger.step(TAG, 'animate a tab switch on a 120 Hz panel');
      const browser: MockBrowser = new MockBrowser(2);
      const simulator: TabsSwitchSimulator = new TabsSwitchSimulator(browser, FRAME_BUDGET_120HZ, 12001);
      simulator.switchTo(1);
      const summary: FrameSummary = simulator.lastSampler.summary();
      TestLogger.info(TAG, `120 Hz frames=${summary.frameCount} p90=${summary.p90Ms} dropRate=${summary.dropRate}`);
      expect(summary.frameCount).assertEqual(TAB_SWITCH_FRAME_COUNT);
      expect(summary.dropRate).assertLess(0.9);
      expect(summary.p90Ms).assertLarger(0);
      expect(summary.minimumMs).assertLarger(0);
      TestLogger.pass(TAG, 'Animation_FrameRate_024');
    });

    it('Animation_Scroll_025', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Scroll_025');
      TestLogger.step(TAG, 'fling a long web page and sample the scroll frames');
      const scroll: ScrollAnimationSimulator = new ScrollAnimationSimulator(FRAME_BUDGET_60HZ, 48, 5501);
      const sampler: FrameSampler = scroll.fling(SCROLL_FRAME_COUNT);
      TestLogger.info(TAG, `scroll offset=${scroll.offsetPx} frames=${sampler.size()}`);
      expect(scroll.offsetPx).assertEqual(48 * SCROLL_FRAME_COUNT);
      expect(sampler.size()).assertEqual(SCROLL_FRAME_COUNT);
      expect(sampler.averageFrameMs()).assertLess(FRAME_BUDGET_60HZ);
      expect(sampler.dropRate()).assertLess(TOLERANCE_DROP_RATE);
      const second: FrameSampler = scroll.fling(SCROLL_FRAME_COUNT);
      expect(second.averageFrameMs()).assertLess(FRAME_BUDGET_60HZ);
      TestLogger.pass(TAG, 'Animation_Scroll_025');
    });

    it('Animation_Network_026', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Network_026');
      TestLogger.step(TAG, 'compare frame pacing of an online and an offline engine');
      const network: MockNetwork = new MockNetwork();
      network.setLatency(200);
      const source: PacedFrameSource = new PacedFrameSource(network);
      const onlineFrames: number[] = source.buildSeries(8, 10);
      network.setOnline(false);
      const offlineFrames: number[] = source.buildSeries(8, 10);
      let onlineTotal: number = 0;
      let offlineTotal: number = 0;
      for (let index = 0; index < onlineFrames.length; index++) {
        onlineTotal += onlineFrames[index];
      }
      for (let index = 0; index < offlineFrames.length; index++) {
        offlineTotal += offlineFrames[index];
      }
      TestLogger.info(TAG, `online total ${onlineTotal} ms offline total ${offlineTotal} ms`);
      expect(offlineTotal).assertLarger(onlineTotal);
      expect(offlineTotal - onlineTotal).assertLarger(200);
      network.setOnline(true);
      expect(network.fetch('https://www.example.com')).assertTrue();
      expect(network.requestCount()).assertEqual(1);
      TestLogger.pass(TAG, 'Animation_Network_026');
    });

    /* ---------------------------------------------------------------- */
    /* Timeline, UI sanity and tab strip capacity.                        */
    /* ---------------------------------------------------------------- */

    it('Animation_Timeline_027', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Timeline_027');
      TestLogger.step(TAG, 'bracket a tab switch animation with the mock clock');
      const clock: MockClock = new MockClock(1000);
      const timeline: AnimationTimeline = new AnimationTimeline(clock);
      const started: number = timeline.begin();
      expect(timeline.isRunning()).assertTrue();
      clock.advance(180);
      const elapsed: number = timeline.finish();
      TestLogger.info(TAG, `started=${started} elapsed=${elapsed}`);
      expect(started).assertEqual(1000);
      expect(elapsed).assertEqual(180);
      expect(timeline.isRunning()).assertFalse();
      expect(timeline.finishedAt()).assertEqual(1180);
      TestLogger.pass(TAG, 'Animation_Timeline_027');
    });

    it('Animation_Timeline_028', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Timeline_028');
      TestLogger.step(TAG, 'reset the timeline before the next animation');
      const clock: MockClock = new MockClock(5000);
      const timeline: AnimationTimeline = new AnimationTimeline(clock);
      timeline.begin();
      clock.advance(90);
      timeline.reset();
      TestLogger.info(TAG, `elapsed after reset ${timeline.elapsed()}`);
      expect(timeline.elapsed()).assertEqual(0);
      expect(timeline.startedAt()).assertEqual(-1);
      expect(timeline.finishedAt()).assertEqual(-1);
      expect(timeline.isRunning()).assertFalse();
      TestLogger.pass(TAG, 'Animation_Timeline_028');
    });

    it('Animation_UI_029', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_UI_029');
      TestLogger.step(TAG, 'confirm the browser title bar is rendered before animating');
      const visible: boolean = await waitForId(driver, ID_INPUT_URL, TIMEOUT_TAB_SWITCH);
      const present: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `url input visible=${visible} present=${present}`);
      expect(visible).assertTrue();
      expect(present).assertTrue();
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      TestLogger.pass(TAG, 'Animation_UI_029');
    });

    it('Animation_UI_030', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_UI_030');
      TestLogger.step(TAG, 'keep the model consistent right after the home reset');
      const browser: MockBrowser = new MockBrowser(2);
      const simulator: TabsSwitchSimulator = new TabsSwitchSimulator(browser);
      browser.resetToHome(PAD_HOME_PAGE);
      const home: MockWebController = browser.tabs[0].controller;
      expect(home.currentUrl).assertEqual(PAD_HOME_PAGE);
      expect(browser.getInputVal()).assertEqual('');
      simulator.switchTo(1);
      simulator.switchTo(0);
      TestLogger.info(TAG, `home url after switch ${home.currentUrl}`);
      expect(home.currentUrl).assertEqual(PAD_HOME_PAGE);
      expect(home.loadCount).assertEqual(1);
      await runSerialized<void>(async () => {
        await driver.delayMs(DELAY_TAB_OPERATION);
      });
      TestLogger.pass(TAG, 'Animation_UI_030');
    });

    it('Animation_TabStrip_031', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_TabStrip_031');
      TestLogger.step(TAG, 'fill the tab strip up to the ten tab limit');
      const browser: MockBrowser = new MockBrowser(1);
      const simulator: TabsSwitchSimulator = new TabsSwitchSimulator(browser);
      let accepted: number = 0;
      for (let index = 1; index < MAX_TAB_COUNT; index++) {
        if (browser.addTab()) {
          accepted += 1;
        }
      }
      expect(accepted).assertEqual(MAX_TAB_COUNT - 1);
      expect(browser.tabs.length).assertEqual(MAX_TAB_COUNT);
      expect(tabCapacityReached(MAX_TAB_COUNT + 1)).assertTrue();
      expect(nextTabIndex(browser.tabs.length)).assertEqual(MAX_TAB_COUNT);
      const animated: number = simulator.roundRobin(20);
      TestLogger.info(TAG, `ten tab strip animated ${animated} switches`);
      expect(animated).assertEqual(20);
      expect(simulator.rejectedSwitches).assertEqual(0);
      expect(simulator.durationDrift()).assertLess(TOLERANCE_SWITCH_JITTER);
      TestLogger.pass(TAG, 'Animation_TabStrip_031');
    });
  });
}

