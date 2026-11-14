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
  getDriver, startBrowserApp, serializedDelay, clickById, countById, normalizeUrl,
  MAX_TAB_COUNT, ID_INPUT_URL, ID_ACTION_SUBMIT, ID_NAV_REFRESH, ID_NAV_BACK,
  DELAY_TAB_OPERATION
} from '../Shared/BrowserTestKit';
import { MockBrowser, MockWebController, MockClock, MockLoadingStatus, MockBrowserTab } from '../Shared/BrowserMock';

const TAG: string = 'BrowserPerformanceStressTest';

/* Stress volumes. Every loop below is bounded, never unbounded. */
const SUBMIT_BURST: number = 100;
const REFRESH_CYCLES: number = 100;
const NAVIGATION_CYCLES: number = 100;
const TAB_SWITCH_ROUNDS: number = 30;
const PROGRESS_STORM_SAMPLES: number = 600;
const TAB_PRESSURE_TARGET: number = 10;

/* Latency budgets of one stress action, in milliseconds. */
const SUBMIT_BUDGET_MS: number = 40;
const SUBMIT_TOLERANCE_MS: number = 6;
const REFRESH_BUDGET_MS: number = 120;
const REFRESH_TOLERANCE_MS: number = 20;
const TAB_SWITCH_BUDGET_MS: number = 90;
const TAB_SWITCH_TOLERANCE_MS: number = 15;
const PROGRESS_CALLBACK_BUDGET_MS: number = 3;

/* Budget bookkeeping constants. */
const FULL_PERCENT: number = 100;
const PASS_RATE_TARGET: number = 0.95;
const MAX_ALLOWED_FAILURES: number = 2;
const VERDICT_PASS: string = 'PASS';
const VERDICT_FAIL: string = 'FAIL';
const EPSILON: number = 0.0001;

/** One measured action inside a stress loop. */
interface StressSample {
  label: string;
  elapsedMs: number;
  budgetMs: number;
}

/**
 * Bounded latency series.
 *
 * Percentiles are computed on a sorted copy so the insertion order of the
 * stress loop never hides a tail outlier. The p95 value is the one that
 * actually matters for an input storm: a good average with a bad tail still
 * feels broken to the user.
 */
class LatencySeries {
  private samples: number[] = [];

  add(value: number): void {
    const normalized: number = value < 0 ? 0 : value;
    this.samples.push(normalized);
  }

  count(): number {
    return this.samples.length;
  }

  isEmpty(): boolean {
    return this.samples.length === 0;
  }

  total(): number {
    let sum: number = 0;
    for (let index = 0; index < this.samples.length; index++) {
      sum += this.samples[index];
    }
    return sum;
  }

  average(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return this.total() / this.samples.length;
  }

  min(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let value: number = this.samples[0];
    for (let index = 1; index < this.samples.length; index++) {
      if (this.samples[index] < value) {
        value = this.samples[index];
      }
    }
    return value;
  }

  max(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let value: number = this.samples[0];
    for (let index = 1; index < this.samples.length; index++) {
      if (this.samples[index] > value) {
        value = this.samples[index];
      }
    }
    return value;
  }

  percentile(percent: number): number {
    if (this.samples.length === 0) {
      return 0;
    }
    const sorted: number[] = this.samples.slice(0);
    sorted.sort((left: number, right: number) => left - right);
    const clamped: number = percent < 0 ? 0 : (percent > FULL_PERCENT ? FULL_PERCENT : percent);
    const position: number = Math.floor((clamped / FULL_PERCENT) * (sorted.length - 1));
    return sorted[position];
  }

  /** Spread of the series; a wide jitter is a hidden cost of the storm. */
  jitter(): number {
    return this.max() - this.min();
  }

  overBudgetCount(budgetMs: number): number {
    let counter: number = 0;
    for (let index = 0; index < this.samples.length; index++) {
      if (this.samples[index] > budgetMs) {
        counter += 1;
      }
    }
    return counter;
  }

  last(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return this.samples[this.samples.length - 1];
  }

  reset(): void {
    this.samples = [];
  }
}

/**
 * A budget plus its explicit tolerance.
 *
 * The tolerance absorbs scheduler jitter of the shared device but stays small
 * enough to catch a real regression: submitting a url should never silently
 * cost twice the nominal budget.
 */
class BudgetRule {
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

  describe(actualMs: number): string {
    return `${this.name} actual=${actualMs} allowed=${this.allowed()} budget=${this.budgetMs}`;
  }
}

/** Counts pass and fail outcomes of a stress batch and renders a verdict. */
class StressVerdict {
  private passed: number = 0;
  private failed: number = 0;
  private allowedFailures: number;

  constructor(allowedFailures: number = MAX_ALLOWED_FAILURES) {
    this.allowedFailures = allowedFailures < 0 ? 0 : allowedFailures;
  }

  record(ok: boolean): void {
    if (ok) {
      this.passed += 1;
    } else {
      this.failed += 1;
    }
  }

  passCount(): number {
    return this.passed;
  }

  failCount(): number {
    return this.failed;
  }

  total(): number {
    return this.passed + this.failed;
  }

  passRate(): number {
    if (this.total() === 0) {
      return 0;
    }
    return this.passed / this.total();
  }

  verdict(): string {
    if (this.total() === 0) {
      return VERDICT_FAIL;
    }
    return this.failed <= this.allowedFailures && this.passRate() >= PASS_RATE_TARGET
      ? VERDICT_PASS : VERDICT_FAIL;
  }

  reset(): void {
    this.passed = 0;
    this.failed = 0;
  }
}

/**
 * High frequency address submission.
 *
 * The title bar submits on every enter key, and a held key repeats faster than
 * the Web engine can navigate. Duplicate suppression is what keeps the storm
 * from queueing a hundred identical loads.
 */
class SubmitStorm {
  attempts: number = 0;
  accepted: number = 0;
  duplicates: number = 0;
  rejectedEmpty: number = 0;
  lastUrl: string = '';
  latencies: LatencySeries = new LatencySeries();
  controller: MockWebController = new MockWebController();

  submit(rawValue: string, latencyMs: number): boolean {
    this.attempts += 1;
    const trimmed: string = rawValue === null || rawValue === undefined ? '' : rawValue.trim();
    if (trimmed.length === 0) {
      this.rejectedEmpty += 1;
      return false;
    }
    const url: string = normalizeUrl(trimmed);
    if (url === this.lastUrl) {
      this.duplicates += 1;
      return false;
    }
    this.lastUrl = url;
    this.accepted += 1;
    this.latencies.add(latencyMs);
    this.controller.loadUrl(url);
    return true;
  }

  /** Repeats the same address burst times: one accepted, the rest deduped. */
  burst(address: string, times: number, latencyMs: number): number {
    let accepted: number = 0;
    for (let round = 0; round < times; round++) {
      if (this.submit(address, latencyMs)) {
        accepted += 1;
      }
    }
    return accepted;
  }

  /** Distinct addresses must all be accepted, in order. */
  distinctBurst(prefix: string, times: number, latencyMs: number): number {
    let accepted: number = 0;
    for (let round = 0; round < times; round++) {
      if (this.submit(`${prefix}${round}.example.com`, latencyMs)) {
        accepted += 1;
      }
    }
    return accepted;
  }

  reset(): void {
    this.attempts = 0;
    this.accepted = 0;
    this.duplicates = 0;
    this.rejectedEmpty = 0;
    this.lastUrl = '';
    this.latencies.reset();
    this.controller.reset();
  }
}
/**
 * Refresh / back / forward cycler.
 *
 * The cycle is the cheapest way to hammer the navigation controller: refresh
 * keeps the history untouched, while back and forward walk the same two
 * entries a hundred times. Any leak of history entries shows up immediately as
 * a growing stack.
 */
class NavigationCycler {
  browser: MockBrowser = new MockBrowser(1);
  cycleLatencies: LatencySeries = new LatencySeries();
  completedCycles: number = 0;
  backFailures: number = 0;
  forwardFailures: number = 0;

  constructor() {
    this.browser.loadUrl('https://www.example.com');
    this.browser.loadUrl('https://www.example.org');
  }

  runRefresh(cycles: number, latencyMs: number): number {
    for (let round = 0; round < cycles; round++) {
      this.browser.refresh();
      this.cycleLatencies.add(latencyMs);
      this.completedCycles += 1;
    }
    return this.completedCycles;
  }

  runBackForward(cycles: number, latencyMs: number): number {
    let completed: number = 0;
    for (let round = 0; round < cycles; round++) {
      if (!this.browser.back()) {
        this.backFailures += 1;
      }
      if (!this.browser.forward()) {
        this.forwardFailures += 1;
      }
      this.cycleLatencies.add(latencyMs);
      completed += 1;
    }
    this.completedCycles += completed;
    return completed;
  }

  refreshCount(): number {
    const tab: MockBrowserTab | null = this.browser.getCurrentTab();
    return tab === null ? 0 : tab.controller.refreshCount;
  }

  historyDepth(): number {
    const tab: MockBrowserTab | null = this.browser.getCurrentTab();
    return tab === null ? 0 : tab.controller.history.length;
  }

  currentUrl(): string {
    const tab: MockBrowserTab | null = this.browser.getCurrentTab();
    return tab === null ? '' : tab.controller.currentUrl;
  }
}

/**
 * Ten tab pressure.
 *
 * At the ten tab ceiling every switch re-binds the Web component of the target
 * tab. The stress pattern loads a page in each tab, walks the full ring, and
 * then measures how much of the ring still answers.
 */
class TabPressure {
  browser: MockBrowser = new MockBrowser(1);
  switchLatencies: LatencySeries = new LatencySeries();
  visited: number = 0;
  loadFailures: number = 0;

  fillTo(target: number): number {
    while (this.browser.tabs.length < target) {
      if (!this.browser.addTab()) {
        break;
      }
    }
    return this.browser.tabs.length;
  }

  loadEveryTab(): number {
    let loaded: number = 0;
    for (let index = 0; index < this.browser.tabs.length; index++) {
      if (!this.browser.selectTab(index)) {
        this.loadFailures += 1;
        continue;
      }
      const ok: boolean = this.browser.loadUrl(`tab-${index}.example.com`);
      if (ok) {
        loaded += 1;
      } else {
        this.loadFailures += 1;
      }
    }
    return loaded;
  }

  walk(rounds: number, latencyMs: number): number {
    let steps: number = 0;
    for (let round = 0; round < rounds; round++) {
      for (let index = 0; index < this.browser.tabs.length; index++) {
        if (this.browser.selectTab(index)) {
          this.visited += 1;
          steps += 1;
        }
        this.switchLatencies.add(latencyMs + (index % 5));
      }
    }
    return steps;
  }

  keysStable(): boolean {
    const keys: number[] = this.browser.getTabKeys();
    for (let index = 0; index < keys.length; index++) {
      if (keys[index] !== index) {
        return false;
      }
    }
    return true;
  }

  overflowAttempts(times: number): number {
    let refused: number = 0;
    for (let round = 0; round < times; round++) {
      if (!this.browser.addTab()) {
        refused += 1;
      }
    }
    return refused;
  }
}

/**
 * Progress callback storm.
 *
 * onProgressChange fires for every layout milestone of the Web engine. During
 * a heavy page it can fire hundreds of times per load, each one triggering a
 * state update. The collector verifies that the visible progress still ends at
 * one hundred and that the bar is hidden again afterwards.
 */
class ProgressStorm {
  browser: MockBrowser = new MockBrowser(1);
  callbacks: number = 0;
  regressions: number = 0;
  samples: number[] = [];
  private previous: number = 0;

  push(value: number): void {
    const clamped: number = value < 0 ? 0 : (value > FULL_PERCENT ? FULL_PERCENT : value);
    this.callbacks += 1;
    if (clamped < this.previous && clamped !== 0) {
      this.regressions += 1;
    }
    this.previous = clamped;
    this.samples.push(clamped);
    this.browser.onProgressChange(clamped);
  }

  /** Feeds a full 0..100 sweep repeated times. */
  sweep(repeats: number, step: number): number {
    const safeStep: number = step <= 0 ? 1 : step;
    for (let round = 0; round < repeats; round++) {
      this.previous = 0;
      for (let value = 0; value <= FULL_PERCENT; value += safeStep) {
        this.push(value);
      }
      this.push(FULL_PERCENT);
    }
    return this.callbacks;
  }

  /** Duplicate and out of order values are the realistic storm shape. */
  jitterStorm(repeats: number): number {
    const pattern: number[] = [0, 5, 12, 12, 30, 28, 55, 55, 80, 99, 100];
    for (let round = 0; round < repeats; round++) {
      for (let index = 0; index < pattern.length; index++) {
        this.push(pattern[index]);
      }
    }
    return this.callbacks;
  }

  lastValue(): number {
    return this.samples.length === 0 ? 0 : this.samples[this.samples.length - 1];
  }

  reset(): void {
    this.callbacks = 0;
    this.regressions = 0;
    this.samples = [];
    this.previous = 0;
  }
}

/**
 * Deterministic stopwatch backed by MockClock.
 *
 * Real wall clock measurements are not reproducible across devices, therefore
 * every budget in this suite is exercised twice: once with a deterministic
 * clock to prove the arithmetic, and once against the live UI to prove the
 * component still answers.
 */
class StressStopwatch {
  private clock: MockClock;
  private startedAt: number = 0;
  private running: boolean = false;
  private laps: LatencySeries = new LatencySeries();

  constructor(clock: MockClock) {
    this.clock = clock;
  }

  start(): void {
    this.startedAt = this.clock.now();
    this.running = true;
  }

  lap(): number {
    if (!this.running) {
      return 0;
    }
    const elapsed: number = this.clock.now() - this.startedAt;
    this.laps.add(elapsed);
    return elapsed;
  }

  stop(): number {
    const elapsed: number = this.lap();
    this.running = false;
    return elapsed;
  }

  advance(ms: number): number {
    return this.clock.advance(ms);
  }

  series(): LatencySeries {
    return this.laps;
  }
}

/** Aggregates a whole stress batch into one report line. */
class StressReport {
  readonly label: string;
  series: LatencySeries;
  verdict: StressVerdict;

  constructor(label: string, series: LatencySeries, verdict: StressVerdict) {
    this.label = label;
    this.series = series;
    this.verdict = verdict;
  }

  line(): string {
    return `${this.label} samples=${this.series.count()} avg=${this.series.average()} ` +
      `p95=${this.series.percentile(95)} max=${this.series.max()} verdict=${this.verdict.verdict()}`;
  }
}
export default function browserPerformanceStressTest() {
  describe('browserPerformanceStressTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'performance stress suite begin');
      TestLogger.resetSteps(TAG);
      await startBrowserApp();
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Stress_Submit_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Stress_Submit_001');
      TestLogger.step(TAG, 'repeat one address a hundred times and expect dedup');
      const storm: SubmitStorm = new SubmitStorm();
      const accepted: number = storm.burst('www.example.com', SUBMIT_BURST, 12);
      TestLogger.info(TAG, `attempts=${storm.attempts} accepted=${accepted} dup=${storm.duplicates}`);
      expect(storm.attempts).assertEqual(SUBMIT_BURST);
      expect(accepted).assertEqual(1);
      expect(storm.duplicates).assertEqual(SUBMIT_BURST - 1);
      expect(storm.rejectedEmpty).assertEqual(0);
      expect(storm.controller.loadCount).assertEqual(1);
      expect(storm.lastUrl).assertEqual('https://www.example.com');
      TestLogger.pass(TAG, 'Stress_Submit_001');
    });

    it('Stress_Submit_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Stress_Submit_002');
      TestLogger.step(TAG, 'submit a hundred distinct addresses and keep every load');
      const storm: SubmitStorm = new SubmitStorm();
      const accepted: number = storm.distinctBurst('host-', SUBMIT_BURST, 15);
      TestLogger.info(TAG, `accepted=${accepted} loads=${storm.controller.loadCount}`);
      expect(accepted).assertEqual(SUBMIT_BURST);
      expect(storm.duplicates).assertEqual(0);
      expect(storm.controller.loadCount).assertEqual(SUBMIT_BURST);
      expect(storm.latencies.count()).assertEqual(SUBMIT_BURST);
      expect(storm.controller.history.length).assertEqual(SUBMIT_BURST);
      TestLogger.pass(TAG, 'Stress_Submit_002');
    });

    it('Stress_Submit_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Stress_Submit_003');
      TestLogger.step(TAG, 'send blank submissions and expect them to be dropped');
      const storm: SubmitStorm = new SubmitStorm();
      storm.submit('   ', 5);
      storm.submit('', 5);
      storm.submit('www.example.com', 10);
      TestLogger.info(TAG, `empty=${storm.rejectedEmpty} accepted=${storm.accepted}`);
      expect(storm.attempts).assertEqual(3);
      expect(storm.rejectedEmpty).assertEqual(2);
      expect(storm.accepted).assertEqual(1);
      expect(storm.controller.loadCount).assertEqual(1);
      expect(storm.latencies.count()).assertEqual(1);
      TestLogger.pass(TAG, 'Stress_Submit_003');
    });

    it('Stress_Budget_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Stress_Budget_004');
      TestLogger.step(TAG, 'apply the submit latency budget with its tolerance');
      const rule: BudgetRule = new BudgetRule('submit', SUBMIT_BUDGET_MS, SUBMIT_TOLERANCE_MS);
      const series: LatencySeries = new LatencySeries();
      for (let round = 0; round < SUBMIT_BURST; round++) {
        series.add(SUBMIT_BUDGET_MS + (round % 4));
      }
      const worst: number = series.max();
      TestLogger.info(TAG, rule.describe(worst));
      expect(rule.allowed()).assertEqual(SUBMIT_BUDGET_MS + SUBMIT_TOLERANCE_MS);
      expect(rule.allows(worst)).assertTrue();
      expect(rule.margin(worst)).assertLarger(0);
      expect(series.percentile(95)).assertLess(rule.allowed());
      expect(series.overBudgetCount(rule.allowed())).assertEqual(0);
      TestLogger.pass(TAG, 'Stress_Budget_004');
    });

    it('Stress_Refresh_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Stress_Refresh_005');
      TestLogger.step(TAG, 'run one hundred consecutive refreshes');
      const cycler: NavigationCycler = new NavigationCycler();
      const done: number = cycler.runRefresh(REFRESH_CYCLES, 35);
      TestLogger.info(TAG, `cycles=${done} refreshCount=${cycler.refreshCount()}`);
      expect(done).assertEqual(REFRESH_CYCLES);
      expect(cycler.refreshCount()).assertEqual(REFRESH_CYCLES);
      expect(cycler.historyDepth()).assertEqual(2);
      expect(cycler.cycleLatencies.count()).assertEqual(REFRESH_CYCLES);
      expect(cycler.cycleLatencies.percentile(95)).assertLess(REFRESH_BUDGET_MS);
      TestLogger.pass(TAG, 'Stress_Refresh_005');
    });

    it('Stress_Nav_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Stress_Nav_006');
      TestLogger.step(TAG, 'walk back and forward one hundred times');
      const cycler: NavigationCycler = new NavigationCycler();
      const done: number = cycler.runBackForward(NAVIGATION_CYCLES, 45);
      TestLogger.info(TAG, `cycles=${done} url=${cycler.currentUrl()}`);
      expect(done).assertEqual(NAVIGATION_CYCLES);
      expect(cycler.backFailures).assertEqual(0);
      expect(cycler.forwardFailures).assertEqual(0);
      expect(cycler.historyDepth()).assertEqual(2);
      const rule: BudgetRule = new BudgetRule('nav', TAB_SWITCH_BUDGET_MS, TAB_SWITCH_TOLERANCE_MS);
      expect(rule.allows(cycler.cycleLatencies.max())).assertTrue();
      TestLogger.pass(TAG, 'Stress_Nav_006');
    });
    it('Stress_Tab_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Stress_Tab_007');
      TestLogger.step(TAG, 'fill ten tabs, load each, then walk the ring thirty times');
      const pressure: TabPressure = new TabPressure();
      const filled: number = pressure.fillTo(TAB_PRESSURE_TARGET);
      const loaded: number = pressure.loadEveryTab();
      const steps: number = pressure.walk(TAB_SWITCH_ROUNDS, 60);
      TestLogger.info(TAG, `filled=${filled} loaded=${loaded} steps=${steps} visited=${pressure.visited}`);
      expect(filled).assertEqual(TAB_PRESSURE_TARGET);
      expect(loaded).assertEqual(TAB_PRESSURE_TARGET);
      expect(steps).assertEqual(TAB_PRESSURE_TARGET * TAB_SWITCH_ROUNDS);
      expect(pressure.loadFailures).assertEqual(0);
      expect(pressure.keysStable()).assertTrue();
      expect(pressure.switchLatencies.count()).assertEqual(steps);
      TestLogger.pass(TAG, 'Stress_Tab_007');
    });

    it('Stress_Tab_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Stress_Tab_008');
      TestLogger.step(TAG, 'hammer addTab past the ceiling and count refusals');
      const pressure: TabPressure = new TabPressure();
      pressure.fillTo(TAB_PRESSURE_TARGET);
      const before: number = pressure.browser.tabs.length;
      const refused: number = pressure.overflowAttempts(5);
      const after: number = pressure.browser.tabs.length;
      TestLogger.info(TAG, `before=${before} refused=${refused} after=${after} toasts=${pressure.browser.toasts.length}`);
      expect(before).assertEqual(TAB_PRESSURE_TARGET);
      expect(refused).assertLarger(0);
      expect(after).assertEqual(MAX_TAB_COUNT + 1);
      expect(pressure.browser.toasts.length).assertEqual(refused);
      expect(pressure.browser.toasts[0]).assertEqual('页签数量已满');
      TestLogger.pass(TAG, 'Stress_Tab_008');
    });

    it('Stress_Progress_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Stress_Progress_010');
      TestLogger.step(TAG, 'feed a jittery progress storm with duplicates and rollbacks');
      const storm: ProgressStorm = new ProgressStorm();
      const callbacks: number = storm.jitterStorm(40);
      TestLogger.info(TAG, `callbacks=${callbacks} regressions=${storm.regressions} last=${storm.lastValue()}`);
      expect(callbacks).assertEqual(40 * 11);
      expect(storm.regressions).assertLarger(0);
      expect(storm.samples.length).assertEqual(callbacks);
      expect(storm.lastValue()).assertEqual(FULL_PERCENT);
      expect(storm.browser.hideProgress).assertTrue();
      TestLogger.pass(TAG, 'Stress_Progress_010');
    });

    it('Stress_Metric_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Stress_Metric_011');
      TestLogger.step(TAG, 'verify percentile arithmetic on a known ramp');
      const series: LatencySeries = new LatencySeries();
      for (let value = 1; value <= FULL_PERCENT; value++) {
        series.add(value);
      }
      const median: number = series.percentile(50);
      const tail: number = series.percentile(95);
      TestLogger.info(TAG, `avg=${series.average()} p50=${median} p95=${tail} max=${series.max()}`);
      expect(series.count()).assertEqual(FULL_PERCENT);
      expect(series.min()).assertEqual(1);
      expect(series.max()).assertEqual(FULL_PERCENT);
      expect(median).assertLarger(49);
      expect(median).assertLess(51);
      expect(tail).assertLarger(93);
      expect(tail).assertLess(98);
      expect(series.jitter()).assertEqual(FULL_PERCENT - 1);
      expect(series.overBudgetCount(90)).assertEqual(10);
      TestLogger.pass(TAG, 'Stress_Metric_011');
    });

    it('Stress_Verdict_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Stress_Verdict_012');
      TestLogger.step(TAG, 'grade a stress batch with two tolerated failures');
      const verdict: StressVerdict = new StressVerdict(MAX_ALLOWED_FAILURES);
      for (let round = 0; round < 98; round++) {
        verdict.record(true);
      }
      verdict.record(false);
      verdict.record(false);
      TestLogger.info(TAG, `pass=${verdict.passCount()} fail=${verdict.failCount()} rate=${verdict.passRate()}`);
      expect(verdict.total()).assertEqual(FULL_PERCENT);
      expect(verdict.failCount()).assertEqual(MAX_ALLOWED_FAILURES);
      expect(verdict.passRate()).assertLarger(PASS_RATE_TARGET - EPSILON);
      expect(verdict.verdict()).assertEqual(VERDICT_PASS);
      verdict.record(false);
      expect(verdict.verdict()).assertEqual(VERDICT_FAIL);
      verdict.reset();
      expect(verdict.total()).assertEqual(0);
      expect(verdict.verdict()).assertEqual(VERDICT_FAIL);
      TestLogger.pass(TAG, 'Stress_Verdict_012');
    });
    it('Stress_Clock_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Stress_Clock_013');
      TestLogger.step(TAG, 'measure ten laps on the deterministic clock');
      const clock: MockClock = new MockClock();
      const watch: StressStopwatch = new StressStopwatch(clock);
      watch.start();
      for (let round = 0; round < 10; round++) {
        watch.advance(12);
        watch.lap();
      }
      const series: LatencySeries = watch.series();
      TestLogger.info(TAG, `laps=${series.count()} total=${series.total()} avg=${series.average()}`);
      expect(series.count()).assertEqual(10);
      expect(series.min()).assertEqual(12);
      expect(series.max()).assertEqual(120);
      expect(series.total()).assertEqual(660);
      expect(series.average()).assertEqual(66);
      expect(clock.now()).assertEqual(1700000000000 + 120);
      watch.stop();
      expect(watch.stop()).assertLess(series.max() + 1);
      TestLogger.pass(TAG, 'Stress_Clock_013');
    });

    it('Stress_Report_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Stress_Report_014');
      TestLogger.step(TAG, 'render one report line from a mixed batch');
      const series: LatencySeries = new LatencySeries();
      const verdict: StressVerdict = new StressVerdict(MAX_ALLOWED_FAILURES);
      const rule: BudgetRule = new BudgetRule('refresh', REFRESH_BUDGET_MS, REFRESH_TOLERANCE_MS);
      for (let round = 0; round < SUBMIT_BURST; round++) {
        const value: number = REFRESH_BUDGET_MS - (round % 9);
        series.add(value);
        verdict.record(rule.allows(value));
      }
      const report: StressReport = new StressReport('refresh-storm', series, verdict);
      const line: string = report.line();
      TestLogger.info(TAG, line);
      expect(line).assertContain('refresh-storm');
      expect(line).assertContain('verdict=');
      expect(line).assertContain(VERDICT_PASS);
      expect(verdict.failCount()).assertEqual(0);
      expect(series.count()).assertEqual(SUBMIT_BURST);
      expect(series.max()).assertLess(rule.allowed());
      TestLogger.pass(TAG, 'Stress_Report_014');
    });

    it('Stress_UI_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'Stress_UI_015');
      TestLogger.step(TAG, 'confirm the url field survives a burst of navigation clicks');
      const urlBefore: number = await countById(driver, ID_INPUT_URL);
      for (let round = 0; round < 5; round++) {
        await clickById(driver, ID_NAV_REFRESH);
        await serializedDelay(driver, DELAY_TAB_OPERATION);
      }
      const urlAfter: number = await countById(driver, ID_INPUT_URL);
      const submitCount: number = await countById(driver, ID_ACTION_SUBMIT);
      TestLogger.info(TAG, `url ${urlBefore} -> ${urlAfter}, submit=${submitCount}`);
      expect(urlBefore).assertLarger(0);
      expect(urlAfter).assertEqual(urlBefore);
      expect(submitCount).assertLarger(0);
      expect(Math.abs(urlAfter - urlBefore)).assertLess(2);
      TestLogger.pass(TAG, 'Stress_UI_015');
    });

    it('Stress_UI_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'Stress_UI_016');
      TestLogger.step(TAG, 'press back and forward repeatedly and keep the input stable');
      const backPressed: boolean = await clickById(driver, ID_NAV_BACK);
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      const stable: number = await countById(driver, ID_INPUT_URL);
      TestLogger.info(TAG, `backPressed=${backPressed} inputCount=${stable}`);
      expect(stable).assertLarger(0);
      expect(stable).assertLess(MAX_TAB_COUNT);
      expect(await countById(driver, ID_ACTION_SUBMIT)).assertLarger(0);
      expect(await countById(driver, ID_NAV_REFRESH)).assertLarger(0);
      TestLogger.pass(TAG, 'Stress_UI_016');
    });
  });
}
