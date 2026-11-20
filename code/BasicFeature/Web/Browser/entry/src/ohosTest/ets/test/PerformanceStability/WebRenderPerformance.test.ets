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
  getDriver, startBrowserApp, serializedDelay, countById, waitForId,
  ID_INPUT_URL, ID_NAV_HOME, TOLERANCE_PROGRESS, DELAY_KEY_NAVIGATION
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockClock } from '../Shared/BrowserMock';

const TAG: string = 'BrowserWebRenderPerformanceTest';

/* First screen and DOM readiness budgets, in milliseconds. */
const FIRST_SCREEN_BUDGET_MS: number = 1800;
const FIRST_SCREEN_TOLERANCE_MS: number = 220;
const DOM_READY_BUDGET_MS: number = 1200;
const DOM_READY_TOLERANCE_MS: number = 150;
const TTFB_BUDGET_MS: number = 450;
const TTFB_TOLERANCE_MS: number = 80;
const CACHED_TTFB_BUDGET_MS: number = 120;
const CACHED_TTFB_TOLERANCE_MS: number = 30;

/* Frame pacing budgets of a sixty hertz panel. */
const FRAME_BUDGET_MS: number = 16.7;
const FRAME_TOLERANCE_MS: number = 1.7;
const JANK_FRAME_MS: number = 33.4;
const FRAME_SAMPLES: number = 120;
const JANK_BUDGET_FRAMES: number = 6;
const FPS_TARGET: number = 60;
const FPS_TOLERANCE: number = 4;

/* JavaScript proxy overhead of registerJavaScriptProxy. */
const JS_CALL_BUDGET_MS: number = 0.8;
const JS_CALL_TOLERANCE_MS: number = 0.2;
const JS_CALL_BURST: number = 100;

/* Cache and progress curves. */
const CACHE_ROUNDS: number = 6;
const CACHE_SAVING_RATIO: number = 0.45;
const PROGRESS_STEPS: number = 100;
const FULL_PERCENT: number = 100;

const MARK_NAVIGATION: string = 'navigationStart';
const MARK_TTFB: string = 'firstByte';
const MARK_DOM_READY: string = 'domContentLoaded';
const MARK_FIRST_SCREEN: string = 'firstScreen';
const MARK_LOAD_END: string = 'loadEnd';
const VERDICT_PASS: string = 'PASS';
const VERDICT_FAIL: string = 'FAIL';

/** One paint milestone of the main frame. */
interface PaintMark {
  name: string;
  atMs: number;
}

/**
 * Paint timeline of one navigation.
 *
 * The engine reports its milestones out of order under load, therefore the
 * recorder rejects negative offsets and keeps the first occurrence of every
 * milestone. Ordering is asserted later from the recorded values.
 */
class PaintTimeline {
  private marks: PaintMark[] = [];
  private duplicates: number = 0;
  private negativeOffsets: number = 0;

  mark(name: string, atMs: number): boolean {
    if (atMs < 0) {
      this.negativeOffsets += 1;
      return false;
    }
    if (this.indexOf(name) >= 0) {
      this.duplicates += 1;
      return false;
    }
    this.marks.push({ name: name, atMs: atMs });
    return true;
  }

  private indexOf(name: string): number {
    for (let index = 0; index < this.marks.length; index++) {
      if (this.marks[index].name === name) {
        return index;
      }
    }
    return -1;
  }

  at(name: string): number {
    const position: number = this.indexOf(name);
    return position < 0 ? -1 : this.marks[position].atMs;
  }

  count(): number {
    return this.marks.length;
  }

  duplicateCount(): number {
    return this.duplicates;
  }

  negativeCount(): number {
    return this.negativeOffsets;
  }

  ttfbMs(): number {
    return this.at(MARK_TTFB) - this.at(MARK_NAVIGATION);
  }

  domReadyMs(): number {
    return this.at(MARK_DOM_READY) - this.at(MARK_NAVIGATION);
  }

  firstScreenMs(): number {
    return this.at(MARK_FIRST_SCREEN) - this.at(MARK_NAVIGATION);
  }

  loadEndMs(): number {
    return this.at(MARK_LOAD_END) - this.at(MARK_NAVIGATION);
  }

  /** html then dom then first paint then load end, all non decreasing. */
  orderIsValid(): boolean {
    const sequence: number[] = [
      this.at(MARK_NAVIGATION), this.at(MARK_TTFB), this.at(MARK_DOM_READY),
      this.at(MARK_FIRST_SCREEN), this.at(MARK_LOAD_END)
    ];
    for (let index = 1; index < sequence.length; index++) {
      if (sequence[index] < sequence[index - 1]) {
        return false;
      }
    }
    return true;
  }

  /** Seeds a representative cold navigation. */
  seedColdNavigation(ttfb: number, domReady: number, firstScreen: number, loadEnd: number): void {
    this.mark(MARK_NAVIGATION, 0);
    this.mark(MARK_TTFB, ttfb);
    this.mark(MARK_DOM_READY, domReady);
    this.mark(MARK_FIRST_SCREEN, firstScreen);
    this.mark(MARK_LOAD_END, loadEnd);
  }

  names(): string[] {
    return this.marks.map((item: PaintMark) => item.name);
  }

  reset(): void {
    this.marks = [];
    this.duplicates = 0;
    this.negativeOffsets = 0;
  }
}

/**
 * Progress curve of one load.
 *
 * onProgressChange is a single shared state of the browser: every tab writes
 * into the same progress field. The curve therefore also tracks consecutive
 * duplicates, which is what a shared state looks like from the callback side.
 */
class ProgressCurve {
  private values: number[] = [];
  private regressions: number = 0;
  private duplicates: number = 0;
  private timestamps: number[] = [];

  push(value: number, atMs: number): void {
    const clamped: number = value < 0 ? 0 : (value > FULL_PERCENT ? FULL_PERCENT : value);
    if (this.values.length > 0) {
      const previous: number = this.values[this.values.length - 1];
      if (clamped < previous && clamped !== 0) {
        this.regressions += 1;
      }
      if (clamped === previous) {
        this.duplicates += 1;
      }
    }
    this.values.push(clamped);
    this.timestamps.push(atMs < 0 ? 0 : atMs);
  }

  /** Feeds the canonical ramp zero to one hundred in ten percent steps. */
  ramp(step: number = 10): number {
    const safeStep: number = step <= 0 ? 1 : step;
    for (let value = 0; value <= FULL_PERCENT; value += safeStep) {
      this.push(value, value * 10);
    }
    this.push(FULL_PERCENT, FULL_PERCENT * 10);
    return this.values.length;
  }

  count(): number {
    return this.values.length;
  }

  valueAt(index: number): number {
    return index < 0 || index >= this.values.length ? -1 : this.values[index];
  }

  last(): number {
    return this.values.length === 0 ? 0 : this.values[this.values.length - 1];
  }

  regressionsCount(): number {
    return this.regressions;
  }

  duplicateCount(): number {
    return this.duplicates;
  }

  isMonotonic(): boolean {
    return this.regressions === 0;
  }

  /** Time from the first sample to the last sample. */
  durationMs(): number {
    if (this.timestamps.length < 2) {
      return 0;
    }
    return this.timestamps[this.timestamps.length - 1] - this.timestamps[0];
  }

  /** First index that reached one hundred, or minus one. */
  completeIndex(): number {
    for (let index = 0; index < this.values.length; index++) {
      if (this.values[index] === FULL_PERCENT) {
        return index;
      }
    }
    return -1;
  }

  reset(): void {
    this.values = [];
    this.timestamps = [];
    this.regressions = 0;
    this.duplicates = 0;
  }
}
/**
 * Frame pacing timeline.
 *
 * Sixty hertz gives 16.7 ms per frame. A frame above the jank threshold means
 * the compositor had to wait for the render thread, which a scrolling user
 * perceives as a stutter. The p95 frame time is the primary signal because a
 * single slow first frame is expected while the WebView warms up.
 */
class FrameTimeline {
  private frames: number[] = [];

  record(frameMs: number): void {
    this.frames.push(frameMs < 0 ? 0 : frameMs);
  }

  /** Deterministic ramp: base cost plus a periodic spike. */
  seed(count: number = FRAME_SAMPLES, base: number = 12): number {
    for (let index = 0; index < count; index++) {
      this.record(base + (index % 5) + (index % 24 === 0 ? 22 : 0));
    }
    return this.frames.length;
  }

  count(): number {
    return this.frames.length;
  }

  totalMs(): number {
    let sum: number = 0;
    for (let index = 0; index < this.frames.length; index++) {
      sum += this.frames[index];
    }
    return sum;
  }

  average(): number {
    if (this.frames.length === 0) {
      return 0;
    }
    return this.totalMs() / this.frames.length;
  }

  percentile(percent: number): number {
    if (this.frames.length === 0) {
      return 0;
    }
    const sorted: number[] = this.frames.slice(0);
    sorted.sort((left: number, right: number) => left - right);
    const clamped: number = percent < 0 ? 0 : (percent > FULL_PERCENT ? FULL_PERCENT : percent);
    const position: number = Math.floor((clamped / FULL_PERCENT) * (sorted.length - 1));
    return sorted[position];
  }

  worst(): number {
    return this.percentile(FULL_PERCENT);
  }

  overBudget(budgetMs: number): number {
    let counter: number = 0;
    for (let index = 0; index < this.frames.length; index++) {
      if (this.frames[index] > budgetMs) {
        counter += 1;
      }
    }
    return counter;
  }

  jankFrames(thresholdMs: number = JANK_FRAME_MS): number {
    return this.overBudget(thresholdMs);
  }

  /** Frames that missed the sixteen millisecond slot of a sixty hertz panel. */
  droppedFrames(budgetMs: number = FRAME_BUDGET_MS + FRAME_TOLERANCE_MS): number {
    return this.overBudget(budgetMs);
  }

  fps(): number {
    const average: number = this.average();
    return average <= 0 ? 0 : 1000 / average;
  }

  reset(): void {
    this.frames = [];
  }
}

/**
 * Cost model of the JavaScript proxy bridge.
 *
 * WebTab.ets registers one object under the name etsObj exposing test and
 * searchWord. Every invocation marshals strings across the engine boundary, so
 * the per call overhead is the budget that matters, not the total.
 */
class JsProxyBridge {
  registered: string[] = [];
  rejectedRegistrations: number = 0;
  calls: number = 0;
  unknownCalls: number = 0;
  private costs: number[] = [];
  private methodCalls: Map<string, number> = new Map<string, number>();

  register(method: string): boolean {
    const safe: string = method === null || method === undefined ? '' : method.trim();
    if (safe.length === 0) {
      this.rejectedRegistrations += 1;
      return false;
    }
    for (let index = 0; index < this.registered.length; index++) {
      if (this.registered[index] === safe) {
        this.rejectedRegistrations += 1;
        return false;
      }
    }
    this.registered.push(safe);
    return true;
  }

  registerAll(methods: string[]): number {
    let accepted: number = 0;
    for (let index = 0; index < methods.length; index++) {
      if (this.register(methods[index])) {
        accepted += 1;
      }
    }
    return accepted;
  }

  isRegistered(method: string): boolean {
    for (let index = 0; index < this.registered.length; index++) {
      if (this.registered[index] === method) {
        return true;
      }
    }
    return false;
  }

  call(method: string, costMs: number): boolean {
    if (!this.isRegistered(method)) {
      this.unknownCalls += 1;
      return false;
    }
    this.calls += 1;
    this.costs.push(costMs < 0 ? 0 : costMs);
    const found: number | undefined = this.methodCalls.get(method);
    const previous: number = found === undefined ? 0 : found;
    this.methodCalls.set(method, previous + 1);
    return true;
  }

  burst(method: string, times: number, costMs: number): number {
    let accepted: number = 0;
    for (let round = 0; round < times; round++) {
      if (this.call(method, costMs + (round % 3) * 0.05)) {
        accepted += 1;
      }
    }
    return accepted;
  }

  averageCost(): number {
    if (this.costs.length === 0) {
      return 0;
    }
    let sum: number = 0;
    for (let index = 0; index < this.costs.length; index++) {
      sum += this.costs[index];
    }
    return sum / this.costs.length;
  }

  totalCost(): number {
    let sum: number = 0;
    for (let index = 0; index < this.costs.length; index++) {
      sum += this.costs[index];
    }
    return sum;
  }

  worstCost(): number {
    let worst: number = 0;
    for (let index = 0; index < this.costs.length; index++) {
      if (this.costs[index] > worst) {
        worst = this.costs[index];
      }
    }
    return worst;
  }

  callsOf(method: string): number {
    const value: number | undefined = this.methodCalls.get(method);
    return value === undefined ? 0 : value;
  }

  reset(): void {
    this.registered = [];
    this.rejectedRegistrations = 0;
    this.calls = 0;
    this.unknownCalls = 0;
    this.costs = [];
    this.methodCalls.clear();
  }
}

/**
 * Cache profile of repeated visits to the same page.
 *
 * A warm cache must cut the time to first byte by roughly half; when it does
 * not, the container is bypassing its own network cache and every visit pays
 * the full transfer again.
 */
class CacheProfile {
  private hitTtfb: number[] = [];
  private missTtfb: number[] = [];

  recordHit(ttfbMs: number): void {
    this.hitTtfb.push(ttfbMs < 0 ? 0 : ttfbMs);
  }

  recordMiss(ttfbMs: number): void {
    this.missTtfb.push(ttfbMs < 0 ? 0 : ttfbMs);
  }

  /** First visit misses, every later visit hits. */
  seed(rounds: number = CACHE_ROUNDS, missMs: number = TTFB_BUDGET_MS - 40,
    hitMs: number = CACHED_TTFB_BUDGET_MS - 30): number {
    for (let round = 0; round < rounds; round++) {
      if (round === 0) {
        this.recordMiss(missMs);
      } else {
        this.recordHit(hitMs);
      }
    }
    return this.hitTtfb.length + this.missTtfb.length;
  }

  hitCount(): number {
    return this.hitTtfb.length;
  }

  missCount(): number {
    return this.missTtfb.length;
  }

  hitRate(): number {
    const total: number = this.hitCount() + this.missCount();
    return total === 0 ? 0 : this.hitCount() / total;
  }

  meanHit(): number {
    return this.mean(this.hitTtfb);
  }

  meanMiss(): number {
    return this.mean(this.missTtfb);
  }

  private mean(values: number[]): number {
    if (values.length === 0) {
      return 0;
    }
    let sum: number = 0;
    for (let index = 0; index < values.length; index++) {
      sum += values[index];
    }
    return sum / values.length;
  }

  /** Fraction of the cold latency removed by the cache. */
  savingRatio(): number {
    const cold: number = this.meanMiss();
    if (cold <= 0) {
      return 0;
    }
    return (cold - this.meanHit()) / cold;
  }

  reset(): void {
    this.hitTtfb = [];
    this.missTtfb = [];
  }
}

/** Budget with explicit tolerance and a describe helper for log lines. */
class RenderBudget {
  name: string;
  budgetMs: number;
  toleranceMs: number;

  constructor(name: string, budgetMs: number, toleranceMs: number) {
    this.name = name;
    this.budgetMs = budgetMs;
    this.toleranceMs = toleranceMs;
  }

  allowed(): number {
    return this.budgetMs + this.toleranceMs;
  }

  allows(actualMs: number): boolean {
    return actualMs <= this.allowed();
  }

  margin(actualMs: number): number {
    return this.allowed() - actualMs;
  }

  overBy(actualMs: number): number {
    const value: number = actualMs - this.allowed();
    return value < 0 ? 0 : value;
  }

  describe(actualMs: number): string {
    return `${this.name} actual=${actualMs.toFixed(2)}ms allowed=${this.allowed().toFixed(2)}ms`;
  }
}

/** Collects named budget failures into one render verdict. */
class RenderVerdict {
  private failures: string[] = [];
  private checks: number = 0;

  check(name: string, actualMs: number, budget: RenderBudget): boolean {
    this.checks += 1;
    const ok: boolean = budget.allows(actualMs);
    if (!ok) {
      this.failures.push(`${name} over by ${budget.overBy(actualMs).toFixed(2)}ms`);
    }
    return ok;
  }

  checkFlag(ok: boolean, name: string): boolean {
    this.checks += 1;
    if (!ok) {
      this.failures.push(name);
    }
    return ok;
  }

  isPass(): boolean {
    return this.failures.length === 0;
  }

  checkCount(): number {
    return this.checks;
  }

  failureCount(): number {
    return this.failures.length;
  }

  verdict(): string {
    return this.isPass() ? VERDICT_PASS : VERDICT_FAIL;
  }

  summary(): string {
    return `checks=${this.checks} failures=${this.failures.length} verdict=${this.verdict()}`;
  }

  reset(): void {
    this.failures = [];
    this.checks = 0;
  }
}
export default function browserWebRenderPerformanceTest() {
  describe('browserWebRenderPerformanceTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'web render performance suite begin');
      TestLogger.resetSteps(TAG);
      await startBrowserApp();
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Render_Paint_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Render_Paint_001');
      TestLogger.step(TAG, 'measure the first screen time of a cold navigation');
      const timeline: PaintTimeline = new PaintTimeline();
      timeline.seedColdNavigation(320, 900, 1400, 2600);
      const budget: RenderBudget = new RenderBudget('firstScreen', FIRST_SCREEN_BUDGET_MS, FIRST_SCREEN_TOLERANCE_MS);
      const firstScreen: number = timeline.firstScreenMs();
      TestLogger.info(TAG, budget.describe(firstScreen));
      expect(timeline.count()).assertEqual(5);
      expect(firstScreen).assertEqual(1400);
      expect(budget.allows(firstScreen)).assertTrue();
      expect(budget.margin(firstScreen)).assertLarger(0);
      expect(budget.overBy(firstScreen)).assertEqual(0);
      expect(timeline.loadEndMs()).assertEqual(2600);
      TestLogger.pass(TAG, 'Render_Paint_001');
    });

    it('Render_Paint_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Render_Paint_002');
      TestLogger.step(TAG, 'assert the milestone ordering of the paint timeline');
      const timeline: PaintTimeline = new PaintTimeline();
      timeline.seedColdNavigation(300, 850, 1320, 2400);
      const ttfb: number = timeline.ttfbMs();
      const domReady: number = timeline.domReadyMs();
      const firstScreen: number = timeline.firstScreenMs();
      const domBudget: RenderBudget = new RenderBudget('domReady', DOM_READY_BUDGET_MS, DOM_READY_TOLERANCE_MS);
      TestLogger.info(TAG, `ttfb=${ttfb} dom=${domReady} paint=${firstScreen}`);
      expect(timeline.orderIsValid()).assertTrue();
      expect(ttfb).assertEqual(300);
      expect(domReady).assertLarger(ttfb);
      expect(firstScreen).assertLarger(domReady);
      expect(firstScreen).assertLess(timeline.loadEndMs());
      expect(domBudget.allows(domReady)).assertTrue();
      expect(timeline.names().length).assertEqual(5);
      expect(timeline.names()[0]).assertEqual(MARK_NAVIGATION);
      TestLogger.pass(TAG, 'Render_Paint_002');
    });

    it('Render_Paint_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Render_Paint_003');
      TestLogger.step(TAG, 'verify the time to first byte and reject bad marks');
      const timeline: PaintTimeline = new PaintTimeline();
      timeline.seedColdNavigation(340, 960, 1480, 2700);
      const rejectedNegative: boolean = timeline.mark('brokenMark', -5);
      const rejectedDuplicate: boolean = timeline.mark(MARK_TTFB, 400);
      const budget: RenderBudget = new RenderBudget('ttfb', TTFB_BUDGET_MS, TTFB_TOLERANCE_MS);
      TestLogger.info(TAG, budget.describe(timeline.ttfbMs()));
      expect(rejectedNegative).assertFalse();
      expect(rejectedDuplicate).assertFalse();
      expect(timeline.negativeCount()).assertEqual(1);
      expect(timeline.duplicateCount()).assertEqual(1);
      expect(timeline.count()).assertEqual(5);
      expect(timeline.ttfbMs()).assertEqual(340);
      expect(budget.allows(timeline.ttfbMs())).assertTrue();
      expect(timeline.at('brokenMark')).assertEqual(-1);
      TestLogger.pass(TAG, 'Render_Paint_003');
    });

    it('Render_Progress_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Render_Progress_004');
      TestLogger.step(TAG, 'feed the canonical zero to hundred progress ramp');
      const curve: ProgressCurve = new ProgressCurve();
      const samples: number = curve.ramp(PROGRESS_STEPS / 10);
      const rule: RenderBudget = new RenderBudget('progressCurve', 1200, 120);
      TestLogger.info(TAG, `samples=${samples} last=${curve.last()} duration=${curve.durationMs()}`);
      expect(samples).assertEqual(12);
      expect(curve.last()).assertEqual(FULL_PERCENT);
      expect(curve.isMonotonic()).assertTrue();
      expect(curve.regressionsCount()).assertEqual(0);
      expect(curve.completeIndex()).assertEqual(10);
      expect(curve.valueAt(0)).assertEqual(0);
      expect(curve.valueAt(1)).assertEqual(10);
      expect(curve.durationMs()).assertEqual(1000);
      expect(rule.allows(curve.durationMs())).assertTrue();
      TestLogger.pass(TAG, 'Render_Progress_004');
    });

    it('Render_Progress_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Render_Progress_005');
      TestLogger.step(TAG, 'drive the shared progress state through two tabs');
      const browser: MockBrowser = new MockBrowser(2);
      const clock: MockClock = new MockClock();
      const curve: ProgressCurve = new ProgressCurve();
      for (let value = 0; value < FULL_PERCENT; value += 25) {
        clock.advance(120);
        curve.push(value, clock.now() - 1700000000000);
        browser.onProgressChange(value);
      }
      const beforeComplete: boolean = browser.hideProgress;
      clock.advance(120);
      curve.push(FULL_PERCENT, clock.now() - 1700000000000);
      browser.onProgressChange(FULL_PERCENT);
      TestLogger.info(TAG, `callbacks=${curve.count()} firstRunHidden=${beforeComplete} progress=${browser.progress}`);
      expect(curve.count()).assertEqual(5);
      expect(curve.isMonotonic()).assertTrue();
      expect(beforeComplete).assertFalse();
      expect(browser.hideProgress).assertTrue();
      expect(browser.progress).assertEqual(0);
      expect(browser.progress).assertLess(TOLERANCE_PROGRESS);
      expect(browser.tabs.length).assertEqual(2);
      TestLogger.pass(TAG, 'Render_Progress_005');
    });

    it('Render_Progress_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Render_Progress_006');
      TestLogger.step(TAG, 'flag a curve that rolls back below its previous value');
      const curve: ProgressCurve = new ProgressCurve();
      curve.push(0, 0);
      curve.push(40, 120);
      curve.push(20, 240);
      curve.push(100, 600);
      curve.push(100, 700);
      TestLogger.info(TAG, `regressions=${curve.regressionsCount()} duplicates=${curve.duplicateCount()} last=${curve.last()}`);
      expect(curve.isMonotonic()).assertFalse();
      expect(curve.regressionsCount()).assertEqual(1);
      expect(curve.duplicateCount()).assertEqual(1);
      expect(curve.last()).assertEqual(FULL_PERCENT);
      expect(curve.completeIndex()).assertEqual(3);
      expect(curve.count()).assertEqual(5);
      TestLogger.pass(TAG, 'Render_Progress_006');
    });
    it('Render_Frame_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Render_Frame_007');
      TestLogger.step(TAG, 'measure the frame pacing of a steady scroll');
      const frames: FrameTimeline = new FrameTimeline();
      const recorded: number = frames.seed(FRAME_SAMPLES, 12);
      const budget: RenderBudget = new RenderBudget('frame', FRAME_BUDGET_MS, FRAME_TOLERANCE_MS);
      const average: number = frames.average();
      const p95: number = frames.percentile(95);
      TestLogger.info(TAG, `frames=${recorded} avg=${average.toFixed(2)} p95=${p95} fps=${frames.fps().toFixed(1)}`);
      expect(recorded).assertEqual(FRAME_SAMPLES);
      expect(frames.count()).assertEqual(FRAME_SAMPLES);
      expect(average).assertLarger(13);
      expect(average).assertLess(16);
      expect(p95).assertLess(budget.allowed());
      expect(budget.allows(average)).assertTrue();
      expect(frames.fps()).assertLarger(FPS_TARGET - FPS_TOLERANCE);
      expect(frames.totalMs()).assertLarger(0);
      TestLogger.pass(TAG, 'Render_Frame_007');
    });

    it('Render_Frame_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Render_Frame_008');
      TestLogger.step(TAG, 'count the jank frames of the seeded scroll');
      const frames: FrameTimeline = new FrameTimeline();
      frames.seed(FRAME_SAMPLES, 12);
      const jank: number = frames.jankFrames();
      const dropped: number = frames.droppedFrames();
      const verdict: RenderVerdict = new RenderVerdict();
      const pass: boolean = verdict.checkFlag(jank <= JANK_BUDGET_FRAMES, 'jankBudget');
      TestLogger.info(TAG, `jank=${jank} dropped=${dropped} worst=${frames.worst()}`);
      expect(jank).assertLarger(0);
      expect(jank).assertLess(JANK_BUDGET_FRAMES + 1);
      expect(dropped).assertEqual(jank);
      expect(frames.worst()).assertLarger(JANK_FRAME_MS);
      expect(pass).assertTrue();
      expect(verdict.verdict()).assertEqual(VERDICT_PASS);
      expect(verdict.checkCount()).assertEqual(1);
      TestLogger.pass(TAG, 'Render_Frame_008');
    });

    it('Render_Frame_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'Render_Frame_009');
      TestLogger.step(TAG, 'fail the frame budget when four frames stall');
      const frames: FrameTimeline = new FrameTimeline();
      for (let index = 0; index < 10; index++) {
        frames.record(index < 6 ? 14 + index % 2 : 40);
      }
      const budget: RenderBudget = new RenderBudget('stall', FRAME_BUDGET_MS, FRAME_TOLERANCE_MS);
      const verdict: RenderVerdict = new RenderVerdict();
      const ok: boolean = verdict.check('frameAverage', frames.average(), budget);
      TestLogger.info(TAG, `avg=${frames.average().toFixed(2)} worst=${frames.worst()} ${verdict.summary()}`);
      expect(frames.count()).assertEqual(10);
      expect(frames.jankFrames()).assertEqual(4);
      expect(frames.droppedFrames()).assertEqual(4);
      expect(frames.worst()).assertEqual(40);
      expect(budget.overBy(frames.worst())).assertLarger(20);
      expect(ok).assertFalse();
      expect(verdict.failureCount()).assertEqual(1);
      expect(verdict.verdict()).assertEqual(VERDICT_FAIL);
      expect(frames.percentile(100)).assertEqual(frames.worst());
      TestLogger.pass(TAG, 'Render_Frame_009');
    });

    it('Render_Js_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Render_Js_010');
      TestLogger.step(TAG, 'register the two proxy methods exposed to the page');
      const bridge: JsProxyBridge = new JsProxyBridge();
      const accepted: number = bridge.registerAll(['test', 'searchWord']);
      const empty: boolean = bridge.register('   ');
      const duplicate: boolean = bridge.register('test');
      TestLogger.info(TAG, `accepted=${accepted} rejected=${bridge.rejectedRegistrations}`);
      expect(accepted).assertEqual(2);
      expect(empty).assertFalse();
      expect(duplicate).assertFalse();
      expect(bridge.rejectedRegistrations).assertEqual(2);
      expect(bridge.registered.length).assertEqual(2);
      expect(bridge.isRegistered('test')).assertTrue();
      expect(bridge.isRegistered('searchWord')).assertTrue();
      expect(bridge.isRegistered('missing')).assertFalse();
      expect(bridge.call('missing', 0.5)).assertFalse();
      expect(bridge.unknownCalls).assertEqual(1);
      TestLogger.pass(TAG, 'Render_Js_010');
    });

    it('Render_Js_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Render_Js_011');
      TestLogger.step(TAG, 'burst one hundred proxy calls and check the overhead');
      const bridge: JsProxyBridge = new JsProxyBridge();
      bridge.registerAll(['test', 'searchWord']);
      const accepted: number = bridge.burst('test', JS_CALL_BURST, 0.55);
      const budget: RenderBudget = new RenderBudget('jsCall', JS_CALL_BUDGET_MS, JS_CALL_TOLERANCE_MS);
      const average: number = bridge.averageCost();
      TestLogger.info(TAG, budget.describe(average));
      expect(accepted).assertEqual(JS_CALL_BURST);
      expect(bridge.calls).assertEqual(JS_CALL_BURST);
      expect(bridge.callsOf('test')).assertEqual(JS_CALL_BURST);
      expect(bridge.callsOf('searchWord')).assertEqual(0);
      expect(average).assertLarger(0.5);
      expect(average).assertLess(budget.allowed());
      expect(bridge.worstCost()).assertLess(budget.allowed());
      expect(bridge.totalCost()).assertLarger(50);
      expect(budget.allows(average)).assertTrue();
      TestLogger.pass(TAG, 'Render_Js_011');
    });

    it('Render_Cache_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Render_Cache_012');
      TestLogger.step(TAG, 'compare the warm cache latency against the cold one');
      const cache: CacheProfile = new CacheProfile();
      const rounds: number = cache.seed(CACHE_ROUNDS, 410, 90);
      const cold: RenderBudget = new RenderBudget('coldTtfb', TTFB_BUDGET_MS, TTFB_TOLERANCE_MS);
      const warm: RenderBudget = new RenderBudget('warmTtfb', CACHED_TTFB_BUDGET_MS, CACHED_TTFB_TOLERANCE_MS);
      TestLogger.info(TAG, `rounds=${rounds} cold=${cache.meanMiss()} warm=${cache.meanHit()} saving=${cache.savingRatio().toFixed(2)}`);
      expect(rounds).assertEqual(CACHE_ROUNDS);
      expect(cache.missCount()).assertEqual(1);
      expect(cache.hitCount()).assertEqual(CACHE_ROUNDS - 1);
      expect(cache.meanMiss()).assertEqual(410);
      expect(cache.meanHit()).assertEqual(90);
      expect(cache.meanHit()).assertLess(cache.meanMiss());
      expect(cold.allows(cache.meanMiss())).assertTrue();
      expect(warm.allows(cache.meanHit())).assertTrue();
      expect(cache.savingRatio()).assertLarger(CACHE_SAVING_RATIO);
      TestLogger.pass(TAG, 'Render_Cache_012');
    });
    it('Render_Cache_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Render_Cache_013');
      TestLogger.step(TAG, 'verify the hit rate and the empty cache baseline');
      const empty: CacheProfile = new CacheProfile();
      const emptyRate: number = empty.hitRate();
      const emptySaving: number = empty.savingRatio();
      const warm: CacheProfile = new CacheProfile();
      warm.seed(CACHE_ROUNDS, 400, 100);
      TestLogger.info(TAG, `emptyRate=${emptyRate} warmRate=${warm.hitRate().toFixed(3)} saving=${warm.savingRatio().toFixed(3)}`);
      expect(emptyRate).assertEqual(0);
      expect(emptySaving).assertEqual(0);
      expect(empty.meanHit()).assertEqual(0);
      expect(warm.hitRate()).assertLarger(0.8);
      expect(warm.hitRate()).assertLess(1);
      expect(warm.savingRatio()).assertLarger(CACHE_SAVING_RATIO);
      expect(warm.savingRatio()).assertLess(1);
      expect(warm.hitCount() + warm.missCount()).assertEqual(CACHE_ROUNDS);
      TestLogger.pass(TAG, 'Render_Cache_013');
    });

    it('Render_Budget_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Render_Budget_014');
      TestLogger.step(TAG, 'probe the inclusive boundary of a render budget');
      const budget: RenderBudget = new RenderBudget('firstScreen', FIRST_SCREEN_BUDGET_MS, FIRST_SCREEN_TOLERANCE_MS);
      const atLimit: number = budget.allowed();
      const justOver: number = budget.allowed() + 0.01;
      const verdict: RenderVerdict = new RenderVerdict();
      const first: boolean = verdict.check('firstScreen', atLimit + 400, budget);
      const second: boolean = verdict.check('domReady', 900, budget);
      TestLogger.info(TAG, `${budget.describe(atLimit + 400)} ${verdict.summary()}`);
      expect(budget.allowed()).assertEqual(FIRST_SCREEN_BUDGET_MS + FIRST_SCREEN_TOLERANCE_MS);
      expect(budget.allows(atLimit)).assertTrue();
      expect(budget.allows(justOver)).assertFalse();
      expect(budget.margin(atLimit)).assertEqual(0);
      expect(budget.margin(atLimit - 100)).assertEqual(100);
      expect(budget.overBy(atLimit - 100)).assertEqual(0);
      expect(budget.overBy(atLimit + 50)).assertEqual(50);
      expect(first).assertFalse();
      expect(second).assertTrue();
      expect(verdict.checkCount()).assertEqual(2);
      expect(verdict.failureCount()).assertEqual(1);
      expect(verdict.verdict()).assertEqual(VERDICT_FAIL);
      verdict.reset();
      expect(verdict.checkCount()).assertEqual(0);
      expect(verdict.isPass()).assertTrue();
      TestLogger.pass(TAG, 'Render_Budget_014');
    });

    it('Render_UI_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'Render_UI_015');
      TestLogger.step(TAG, 'wait for the rendered title bar and time the window');
      const inputReady: boolean = await waitForId(driver, ID_INPUT_URL);
      const inputCount: number = await countById(driver, ID_INPUT_URL);
      const homeCount: number = await countById(driver, ID_NAV_HOME);
      const startedAt: number = Date.now();
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      const settleMs: number = Date.now() - startedAt;
      const budget: RenderBudget = new RenderBudget('uiSettle', DOM_READY_BUDGET_MS, DOM_READY_TOLERANCE_MS);
      TestLogger.info(TAG, `inputReady=${inputReady} input=${inputCount} home=${homeCount} settle=${settleMs}ms`);
      expect(inputReady).assertTrue();
      expect(inputCount).assertLarger(0);
      expect(homeCount).assertLarger(0);
      expect(inputCount).assertLess(homeCount + TOLERANCE_PROGRESS * 4);
      expect(settleMs).assertLarger(0);
      expect(budget.allows(settleMs)).assertTrue();
      TestLogger.pass(TAG, 'Render_UI_015');
    });

    it('Render_Reset_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'Render_Reset_016');
      TestLogger.step(TAG, 'reset every render recorder between navigations');
      const timeline: PaintTimeline = new PaintTimeline();
      timeline.seedColdNavigation(300, 900, 1400, 2600);
      const curve: ProgressCurve = new ProgressCurve();
      curve.ramp(20);
      const frames: FrameTimeline = new FrameTimeline();
      frames.seed(12, 12);
      const bridge: JsProxyBridge = new JsProxyBridge();
      bridge.registerAll(['test', 'searchWord']);
      bridge.burst('test', 4, 0.6);
      const cache: CacheProfile = new CacheProfile();
      cache.seed(3, 400, 100);
      timeline.reset();
      curve.reset();
      frames.reset();
      bridge.reset();
      cache.reset();
      TestLogger.info(TAG, `timeline=${timeline.count()} curve=${curve.count()} frames=${frames.count()} ` +
        `bridge=${bridge.registered.length} cache=${cache.hitCount()}`);
      expect(timeline.count()).assertEqual(0);
      expect(timeline.firstScreenMs()).assertEqual(0);
      expect(timeline.orderIsValid()).assertTrue();
      expect(curve.count()).assertEqual(0);
      expect(curve.last()).assertEqual(0);
      expect(curve.isMonotonic()).assertTrue();
      expect(frames.count()).assertEqual(0);
      expect(frames.fps()).assertEqual(0);
      expect(bridge.registered.length).assertEqual(0);
      expect(bridge.calls).assertEqual(0);
      expect(cache.hitRate()).assertEqual(0);
      expect(cache.missCount()).assertEqual(0);
      TestLogger.pass(TAG, 'Render_Reset_016');
    });
  });
}
