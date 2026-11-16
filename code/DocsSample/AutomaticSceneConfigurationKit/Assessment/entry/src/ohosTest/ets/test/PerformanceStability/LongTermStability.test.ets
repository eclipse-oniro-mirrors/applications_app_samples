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
  ID_INDEX_TITLE,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  findById,
  getDriver,
  indexComponentCount,
  launchAssessmentApp,
  pressAndWait,
  serializedDelay,
  waitForIndexPage
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// The event log of the sample is a bounded ring: the newest entry is unshifted to the front
// and the oldest entry is popped once the ring is full. The ring therefore never grows beyond
// its capacity no matter how many events the assessment service reports.
const MAX_EVENT_LOG: number = 20;
const COUNTDOWN_INTERVAL: number = 1000;
const DURATION_TEN_MINUTES: number = 600000;
const DURATION_THIRTY_MINUTES: number = 1800000;
const DURATION_SIXTY_MINUTES: number = 3600000;

// Long term budget of this suite. The model loops are pure arithmetic and must finish far
// below the budget, the UI rounds use generous thresholds so that a slow emulator cannot
// produce a false failure.
const MODEL_ITERATIONS: number = 2000;
const MODEL_BUDGET_MS: number = 5000;
const VISIT_ROUNDS: number = 4;
const COUNTDOWN_CYCLES: number = 6;
const UI_RENDER_TOLERANCE: number = 3;
// The component count of a List changes when an item scrolls in or out of the viewport and the
// count of the wildcard lookup also covers the transient nodes of the framework. The span of the
// repeated visits is therefore compared with a wide tolerance instead of with equality.
const MAX_COMPONENT_DRIFT: number = 20;

// Case identifiers, the trailing number is the sequence number of the case inside the suite.
const CASE_001: string = BUNDLE + 'LongTermStability_001';
const CASE_002: string = BUNDLE + 'LongTermStability_002';
const CASE_003: string = BUNDLE + 'LongTermStability_003';
const CASE_004: string = BUNDLE + 'LongTermStability_004';
const CASE_005: string = BUNDLE + 'LongTermStability_005';
const CASE_006: string = BUNDLE + 'LongTermStability_006';
const CASE_007: string = BUNDLE + 'LongTermStability_007';
const CASE_008: string = BUNDLE + 'LongTermStability_008';
const CASE_009: string = BUNDLE + 'LongTermStability_009';
const CASE_010: string = BUNDLE + 'LongTermStability_010';
const CASE_011: string = BUNDLE + 'LongTermStability_011';
const CASE_012: string = BUNDLE + 'LongTermStability_012';
const CASE_013: string = BUNDLE + 'LongTermStability_013';
const CASE_014: string = BUNDLE + 'LongTermStability_014';
const CASE_015: string = BUNDLE + 'LongTermStability_015';
const CASE_016: string = BUNDLE + 'LongTermStability_016';
const CASE_017: string = BUNDLE + 'LongTermStability_017';

/**
 * Models the bounded event log ring of the sample.
 *
 * The controller copies the log array, unshifts the newest text and pops the oldest one when
 * the ring is full, so the published array never exceeds MAX_EVENT_LOG entries. The model
 * reproduces that behaviour exactly, including the immutability of the published slice.
 */
class EventJournalRing {
  private entries: string[] = [];
  private readonly capacity: number;
  private dropped: number = 0;

  constructor(capacity: number) {
    this.capacity = capacity > 0 ? capacity : MAX_EVENT_LOG;
  }

  /**
   * Appends a text to the ring.
   *
   * @param text log text to append.
   * @returns true when the text was accepted.
   */
  public append(text: string): boolean {
    if (text.length === 0) {
      return false;
    }
    const next: string[] = this.entries.slice();
    next.unshift(text);
    if (next.length > this.capacity) {
      next.pop();
      this.dropped++;
    }
    this.entries = next;
    return true;
  }

  /**
   * Appends the same text several times.
   *
   * @param text log text to append.
   * @param times number of appends.
   * @returns the number of accepted appends.
   */
  public appendTimes(text: string, times: number): number {
    let accepted: number = 0;
    for (let i = 0; i < times; i++) {
      if (this.append(text + '_' + i)) {
        accepted++;
      }
    }
    return accepted;
  }

  public size(): number {
    return this.entries.length;
  }

  public capacityLimit(): number {
    return this.capacity;
  }

  public newest(): string {
    return this.entries.length === 0 ? '' : this.entries[0];
  }

  public oldest(): string {
    return this.entries.length === 0 ? '' : this.entries[this.entries.length - 1];
  }

  public contains(text: string): boolean {
    return this.entries.indexOf(text) >= 0;
  }

  public droppedCount(): number {
    return this.dropped;
  }

  public snapshot(): string[] {
    return this.entries.slice();
  }

  public isBounded(): boolean {
    return this.entries.length <= this.capacity;
  }

  public isEmpty(): boolean {
    return this.entries.length === 0;
  }

  public reset(): void {
    this.entries = [];
    this.dropped = 0;
  }

  public toString(): string {
    return `EventJournalRing{size=${this.entries.length}, capacity=${this.capacity}, dropped=${this.dropped}}`;
  }
}

/**
 * Models repeated countdown cycles of the exam page.
 *
 * Every time the exam page appears the countdown is started from the configured duration and
 * stopped again when the page disappears. A long lived session therefore runs several cycles
 * and the remaining seconds must land exactly on the expected value every time, without any
 * drift between two cycles.
 */
class CountdownCycleModel {
  private readonly durationMs: number;
  private remainingSeconds: number = 0;
  private cycles: number = 0;
  private ticks: number = 0;
  private running: boolean = false;

  constructor(durationMs: number) {
    this.durationMs = durationMs > 0 ? durationMs : DURATION_TEN_MINUTES;
  }

  /**
   * Starts one countdown cycle.
   *
   * @returns true when the cycle was started.
   */
  public start(): boolean {
    if (this.running) {
      return false;
    }
    this.remainingSeconds = Math.floor(this.durationMs / COUNTDOWN_INTERVAL);
    this.cycles++;
    this.running = true;
    return true;
  }

  /**
   * Applies one countdown tick.
   *
   * @returns true when the tick was applied.
   */
  public tick(): boolean {
    if (!this.running || this.remainingSeconds <= 0) {
      return false;
    }
    this.remainingSeconds--;
    this.ticks++;
    return true;
  }

  /**
   * Stops the current cycle, it mirrors aboutToDisappear of the exam page.
   *
   * @returns true when a running cycle was stopped.
   */
  public stop(): boolean {
    if (!this.running) {
      return false;
    }
    this.running = false;
    this.remainingSeconds = 0;
    return true;
  }

  /**
   * Runs a whole cycle of the given tick count.
   *
   * @param ticks number of ticks to apply before the cycle is stopped.
   * @returns the number of applied ticks.
   */
  public runCycle(ticks: number): number {
    if (!this.start()) {
      return 0;
    }
    let applied: number = 0;
    for (let i = 0; i < ticks; i++) {
      if (!this.tick()) {
        break;
      }
      applied++;
    }
    this.stop();
    return applied;
  }

  public getRemainingSeconds(): number {
    return this.remainingSeconds;
  }

  public isRunning(): boolean {
    return this.running;
  }

  public getCycles(): number {
    return this.cycles;
  }

  public getTicks(): number {
    return this.ticks;
  }

  public getDurationMs(): number {
    return this.durationMs;
  }

  public expectedTicks(): number {
    return Math.floor(this.durationMs / COUNTDOWN_INTERVAL);
  }

  public reset(): void {
    this.remainingSeconds = 0;
    this.cycles = 0;
    this.ticks = 0;
    this.running = false;
  }

  public toString(): string {
    return `CountdownCycleModel{cycles=${this.cycles}, ticks=${this.ticks}, running=${this.running}}`;
  }
}

/**
 * Detects drift of a repeated measurement around its baseline.
 *
 * The component count of the entry page is sampled before and after every visit. A stable page
 * returns to the same count within a small tolerance, a leaking page drifts away from the
 * baseline with every visit.
 */
class StabilitySampler {
  private values: number[] = [];
  private readonly tolerance: number;

  constructor(tolerance: number) {
    this.tolerance = tolerance >= 0 ? tolerance : UI_RENDER_TOLERANCE;
  }

  public add(value: number): boolean {
    if (value < 0) {
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

  public baseline(): number {
    return this.values.length === 0 ? 0 : this.values[0];
  }

  public latest(): number {
    return this.values.length === 0 ? 0 : this.values[this.values.length - 1];
  }

  public minimum(): number {
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

  public maximum(): number {
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

  public average(): number {
    if (this.values.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.values.length; i++) {
      total += this.values[i];
    }
    return total / this.values.length;
  }

  public drift(): number {
    return Math.abs(this.latest() - this.baseline());
  }

  public span(): number {
    return this.maximum() - this.minimum();
  }

  public isStable(): boolean {
    if (this.values.length < 2) {
      return true;
    }
    return this.span() <= this.tolerance;
  }

  public getTolerance(): number {
    return this.tolerance;
  }

  public reset(): void {
    this.values = [];
  }

  public toString(): string {
    return `StabilitySampler{samples=${this.values.length}, span=${this.span()}, drift=${this.drift()}}`;
  }
}

/**
 * Aggregates the pass and fail outcomes of one long term run.
 */
class StabilityReport {
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
    return this.isPassed() ? 'long-term-pass' : 'long-term-fail';
  }

  public reset(): void {
    this.checks = [];
    this.failures = [];
  }

  public toString(): string {
    return `StabilityReport{checks=${this.checks.length}, failures=${this.failures.length}}`;
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

export default function longTermStabilityTest() {
  describe('LongTermStability_Test', () => {
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
     * Scenario: a fresh event log ring is created.
     * Expectation: the ring is empty, its capacity equals the sample bound and no entry has been
     * dropped yet.
     */
    it('Assessment_LongTermStability_001', 0, () => {
      logBegin(CASE_001);
      const ring: EventJournalRing = new EventJournalRing(MAX_EVENT_LOG);
      expect(ring.size()).assertEqual(0);
      expect(ring.isEmpty()).assertTrue();
      expect(ring.capacityLimit()).assertEqual(20);
      expect(ring.droppedCount()).assertEqual(0);
      expect(ring.newest()).assertEqual('');
      expect(ring.oldest()).assertEqual('');
      expect(ring.isBounded()).assertTrue();
      logEnd(CASE_001);
    });

    /**
     * Scenario: a single event is appended to the ring.
     * Expectation: the entry becomes both the newest and the oldest entry and it can be looked
     * up by its exact text.
     */
    it('Assessment_LongTermStability_002', 0, () => {
      logBegin(CASE_002);
      const ring: EventJournalRing = new EventJournalRing(MAX_EVENT_LOG);
      expect(ring.append('onBegin code=0 message=')).assertTrue();
      expect(ring.size()).assertEqual(1);
      expect(ring.newest()).assertEqual('onBegin code=0 message=');
      expect(ring.oldest()).assertEqual('onBegin code=0 message=');
      expect(ring.contains('onBegin code=0 message=')).assertTrue();
      expect(ring.contains('onEnd')).assertFalse();
      logEnd(CASE_002);
    });

    /**
     * Scenario: an empty text is appended to the ring.
     * Expectation: the append is rejected so that an empty callback message can never create a
     * blank log row.
     */
    it('Assessment_LongTermStability_003', 0, () => {
      logBegin(CASE_003);
      const ring: EventJournalRing = new EventJournalRing(MAX_EVENT_LOG);
      expect(ring.append('')).assertFalse();
      expect(ring.size()).assertEqual(0);
      expect(ring.isEmpty()).assertTrue();
      expect(ring.appendTimes('event', 3)).assertEqual(3);
      expect(ring.size()).assertEqual(3);
      logEnd(CASE_003);
    });

    /**
     * Scenario: exactly twenty events are appended to the ring.
     * Expectation: the ring is full but still inside its bound and nothing has been dropped.
     */
    it('Assessment_LongTermStability_004', 0, () => {
      logBegin(CASE_004);
      const ring: EventJournalRing = new EventJournalRing(MAX_EVENT_LOG);
      expect(ring.appendTimes('event', MAX_EVENT_LOG)).assertEqual(MAX_EVENT_LOG);
      expect(ring.size()).assertEqual(MAX_EVENT_LOG);
      expect(ring.droppedCount()).assertEqual(0);
      expect(ring.newest()).assertEqual('event_' + (MAX_EVENT_LOG - 1));
      expect(ring.oldest()).assertEqual('event_0');
      expect(ring.isBounded()).assertTrue();
      logEnd(CASE_004);
    });

    /**
     * Scenario: twenty one events are appended to the ring.
     * Expectation: the oldest entry is dropped, the size stays at the capacity and the newest
     * entry sits at the front.
     */
    it('Assessment_LongTermStability_005', 0, () => {
      logBegin(CASE_005);
      const ring: EventJournalRing = new EventJournalRing(MAX_EVENT_LOG);
      ring.appendTimes('event', MAX_EVENT_LOG + 1);
      expect(ring.size()).assertEqual(MAX_EVENT_LOG);
      expect(ring.droppedCount()).assertEqual(1);
      expect(ring.contains('event_0')).assertFalse();
      expect(ring.contains('event_1')).assertTrue();
      expect(ring.newest()).assertEqual('event_' + MAX_EVENT_LOG);
      hilog.info(DOMAIN, TAG, '%{public}s', ring.toString());
      logEnd(CASE_005);
    });

    /**
     * Scenario: the published snapshot of the ring is modified by a reader.
     * Expectation: the modification does not reach the ring, the snapshot is an independent
     * slice just like the array the controller publishes through AppStorage.
     */
    it('Assessment_LongTermStability_007', 0, () => {
      logBegin(CASE_007);
      const ring: EventJournalRing = new EventJournalRing(MAX_EVENT_LOG);
      ring.appendTimes('event', 3);
      const snapshot: string[] = ring.snapshot();
      snapshot.push('injected');
      snapshot[0] = 'overwritten';
      expect(snapshot.length).assertEqual(4);
      expect(ring.size()).assertEqual(3);
      expect(ring.newest()).assertEqual('event_2');
      expect(ring.contains('injected')).assertFalse();
      expect(ring.contains('overwritten')).assertFalse();
      logEnd(CASE_007);
    });

    /**
     * Scenario: the ring is reset after a long run.
     * Expectation: the entries and the dropped counter are cleared.
     */
    it('Assessment_LongTermStability_008', 0, () => {
      logBegin(CASE_008);
      const ring: EventJournalRing = new EventJournalRing(MAX_EVENT_LOG);
      ring.appendTimes('event', MAX_EVENT_LOG + 5);
      expect(ring.size()).assertEqual(MAX_EVENT_LOG);
      expect(ring.droppedCount()).assertEqual(5);
      ring.reset();
      expect(ring.size()).assertEqual(0);
      expect(ring.isEmpty()).assertTrue();
      expect(ring.droppedCount()).assertEqual(0);
      expect(ring.newest()).assertEqual('');
      logEnd(CASE_008);
    });

    /**
     * Scenario: a countdown cycle is started for the ten minute duration.
     * Expectation: the remaining seconds equal the full duration and the expected tick count of
     * the cycle matches the duration divided by the interval.
     */
    it('Assessment_LongTermStability_009', 0, () => {
      logBegin(CASE_009);
      const countdown: CountdownCycleModel = new CountdownCycleModel(DURATION_TEN_MINUTES);
      expect(countdown.start()).assertTrue();
      expect(countdown.isRunning()).assertTrue();
      expect(countdown.getRemainingSeconds()).assertEqual(600);
      expect(countdown.expectedTicks()).assertEqual(600);
      expect(countdown.getCycles()).assertEqual(1);
      expect(countdown.getTicks()).assertEqual(0);
      logEnd(CASE_009);
    });

    /**
     * Scenario: a running countdown cycle is started a second time.
     * Expectation: the second start is rejected so that two intervals can never run at once.
     */
    it('Assessment_LongTermStability_010', 0, () => {
      logBegin(CASE_010);
      const countdown: CountdownCycleModel = new CountdownCycleModel(DURATION_TEN_MINUTES);
      expect(countdown.start()).assertTrue();
      expect(countdown.start()).assertFalse();
      expect(countdown.getCycles()).assertEqual(1);
      expect(countdown.stop()).assertTrue();
      expect(countdown.stop()).assertFalse();
      expect(countdown.isRunning()).assertFalse();
      logEnd(CASE_010);
    });

    /**
     * Scenario: six countdown cycles of one hundred ticks each are replayed.
     * Expectation: every cycle starts from the full duration again, so the cycles never drift
     * apart and the cycle counter is exact.
     */
    it('Assessment_LongTermStability_012', 0, () => {
      logBegin(CASE_012);
      const countdown: CountdownCycleModel = new CountdownCycleModel(DURATION_TEN_MINUTES);
      for (let i = 0; i < COUNTDOWN_CYCLES; i++) {
        expect(countdown.runCycle(100)).assertEqual(100);
        expect(countdown.getRemainingSeconds()).assertEqual(0);
      }
      expect(countdown.getCycles()).assertEqual(COUNTDOWN_CYCLES);
      expect(countdown.getTicks()).assertEqual(COUNTDOWN_CYCLES * 100);
      expect(countdown.isRunning()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', countdown.toString());
      logEnd(CASE_012);
    });

    /**
     * Scenario: the countdown model is reset between two long sessions.
     * Expectation: the counters return to zero and the model behaves like a fresh instance.
     */
    it('Assessment_LongTermStability_014', 0, () => {
      logBegin(CASE_014);
      const countdown: CountdownCycleModel = new CountdownCycleModel(DURATION_SIXTY_MINUTES);
      countdown.runCycle(120);
      expect(countdown.getCycles()).assertEqual(1);
      expect(countdown.getTicks()).assertEqual(120);
      countdown.reset();
      expect(countdown.getCycles()).assertEqual(0);
      expect(countdown.getTicks()).assertEqual(0);
      expect(countdown.isRunning()).assertFalse();
      expect(countdown.getRemainingSeconds()).assertEqual(0);
      logEnd(CASE_014);
    });

    /**
     * Scenario: a stability sampler receives a flat series of component counts.
     * Expectation: the series has no drift and no span, so the sampler reports a stable page.
     */
    it('Assessment_LongTermStability_015', 0, () => {
      logBegin(CASE_015);
      const sampler: StabilitySampler = new StabilitySampler(UI_RENDER_TOLERANCE);
      expect(sampler.addAll([42, 42, 42, 42])).assertEqual(4);
      expect(sampler.baseline()).assertEqual(42);
      expect(sampler.latest()).assertEqual(42);
      expect(sampler.drift()).assertEqual(0);
      expect(sampler.span()).assertEqual(0);
      expect(sampler.average()).assertEqual(42);
      expect(sampler.isStable()).assertTrue();
      expect(sampler.getTolerance()).assertEqual(3);
      logEnd(CASE_015);
    });

    /**
     * Scenario: a stability sampler receives a slow drift.
     * Expectation: a span above the tolerance is flagged as unstable while a span inside the
     * tolerance is still accepted, and invalid samples never enter the population.
     */
    it('Assessment_LongTermStability_016', 0, () => {
      logBegin(CASE_016);
      const sampler: StabilitySampler = new StabilitySampler(UI_RENDER_TOLERANCE);
      expect(sampler.add(-1)).assertFalse();
      sampler.addAll([40, 41, 42, 43]);
      expect(sampler.minimum()).assertEqual(40);
      expect(sampler.maximum()).assertEqual(43);
      expect(sampler.span()).assertEqual(3);
      expect(sampler.isStable()).assertTrue();
      sampler.add(48);
      expect(sampler.span()).assertEqual(8);
      expect(sampler.isStable()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', sampler.toString());
      logEnd(CASE_016);
    });
  });
}
