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
  ID_BUNDLE_INPUT,
  ID_END_BUTTON,
  ID_INDEX_TITLE,
  ID_QUERY_CONFIG_BUTTON,
  ID_QUERY_STATE_BUTTON,
  KEY_BACK,
  KEY_DOWN,
  KEY_UP,
  STRESS_ROUNDS_LIFECYCLE,
  STRESS_ROUNDS_NAVIGATION,
  TIMEOUT_PAGE_RENDER,
  addAllowedApp,
  allowedAppRowCount,
  clickIndexButton,
  findById,
  getDriver,
  indexComponentCount,
  launchAssessmentApp,
  measureActionMs,
  pressAndWait,
  removeFirstAllowedApp,
  serializedDelay,
  waitForIndexPage
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Stress sizes. The model loops are pure arithmetic, the UI loops stay well below the shared
// stress rounds so that a slow device still finishes inside the case timeout.
const MAX_EVENT_LOG: number = 20;
const MAX_ALLOWED_APPS: number = 20;
const COUNTDOWN_INTERVAL: number = 1000;
const STRESS_ITERATIONS: number = 5000;
const STRESS_BATCH: number = 100;
const MODEL_BUDGET_MS: number = 5000;
const UI_BATCH_ROUNDS: number = 2;
const UI_RENDER_TOLERANCE: number = 3;
const STRESS_RENDER_TOLERANCE: number = 5;

// Latency budgets of the stress suite. They are deliberately generous: the goal is to catch a
// gross regression, not to benchmark the emulator. Every latency assertion is paired with a
// deterministic model assertion of the same scenario.
const BUDGET_PAGE_RENDER_MS: number = 3000;
const BUDGET_NAVIGATION_MS: number = 5000;
const BUDGET_QUERY_MS: number = 5000;
const BUDGET_BURST_MS: number = 8000;
const BUDGET_WHITELIST_MS: number = 10000;

// Case identifiers, the trailing number is the sequence number of the case inside the suite.
const CASE_001: string = BUNDLE + 'PerformanceStress_001';
const CASE_002: string = BUNDLE + 'PerformanceStress_002';
const CASE_003: string = BUNDLE + 'PerformanceStress_003';
const CASE_004: string = BUNDLE + 'PerformanceStress_004';
const CASE_005: string = BUNDLE + 'PerformanceStress_005';
const CASE_006: string = BUNDLE + 'PerformanceStress_006';
const CASE_007: string = BUNDLE + 'PerformanceStress_007';
const CASE_008: string = BUNDLE + 'PerformanceStress_008';
const CASE_009: string = BUNDLE + 'PerformanceStress_009';
const CASE_010: string = BUNDLE + 'PerformanceStress_010';
const CASE_011: string = BUNDLE + 'PerformanceStress_011';
const CASE_012: string = BUNDLE + 'PerformanceStress_012';
const CASE_013: string = BUNDLE + 'PerformanceStress_013';
const CASE_014: string = BUNDLE + 'PerformanceStress_014';
const CASE_015: string = BUNDLE + 'PerformanceStress_015';
const CASE_016: string = BUNDLE + 'PerformanceStress_016';
const CASE_017: string = BUNDLE + 'PerformanceStress_017';
const CASE_018: string = BUNDLE + 'PerformanceStress_018';
const CASE_019: string = BUNDLE + 'PerformanceStress_019';
const CASE_020: string = BUNDLE + 'PerformanceStress_020';

/**
 * Stress category of a measured operation.
 */
enum StressCategory {
  RENDER = 'render',
  NAVIGATION = 'navigation',
  QUERY = 'query',
  BEGIN_END = 'begin_end',
  WHITELIST = 'whitelist',
  EVENT_BURST = 'event_burst'
}

/**
 * Quality grade of an aggregated latency.
 */
enum StressGrade {
  EXCELLENT = 'excellent',
  GOOD = 'good',
  ACCEPTABLE = 'acceptable',
  POOR = 'poor'
}

/**
 * One measured operation of the stress run.
 */
interface StressSample {
  category: StressCategory;
  durationMs: number;
  round: number;
}

/**
 * Aggregated latency metrics of one category.
 */
interface StressMetrics {
  category: StressCategory;
  count: number;
  totalMs: number;
  averageMs: number;
  peakMs: number;
  minimumMs: number;
  p90Ms: number;
}

/**
 * Deterministic result of one budget evaluation.
 */
interface BudgetResult {
  name: string;
  actualMs: number;
  budgetMs: number;
  withinBudget: boolean;
}

/**
 * Accumulates the latency samples of the stress suite.
 *
 * The suite records one sample per performed operation so that the same numbers can be used for
 * the average, the peak and the nearest rank percentile. The population is kept in insertion
 * order; the percentile computation sorts a copy so that the original order survives.
 */
class StressSampleCollector {
  private samples: StressSample[] = [];

  /**
   * Records one sample.
   *
   * @param category operation category.
   * @param durationMs measured duration in milliseconds.
   * @param round round index the sample belongs to.
   * @returns true when the sample was accepted.
   */
  public record(category: StressCategory, durationMs: number, round: number): boolean {
    if (durationMs < 0 || round < 0) {
      return false;
    }
    this.samples.push({
      category: category,
      durationMs: durationMs,
      round: round
    });
    return true;
  }

  /**
   * Records the same duration several times.
   *
   * @param category operation category.
   * @param durationMs measured duration in milliseconds.
   * @param times number of samples.
   * @param round round index the samples belong to.
   * @returns the number of accepted samples.
   */
  public recordTimes(category: StressCategory, durationMs: number, times: number, round: number): number {
    let accepted: number = 0;
    for (let i = 0; i < times; i++) {
      if (this.record(category, durationMs, round)) {
        accepted++;
      }
    }
    return accepted;
  }

  public count(): number {
    return this.samples.length;
  }

  public countOf(category: StressCategory): number {
    return this.filterBy(category).length;
  }

  /**
   * Filters the population by category, the returned array is an independent copy.
   *
   * @param category operation category.
   * @returns the matching samples.
   */
  public filterBy(category: StressCategory): StressSample[] {
    const filtered: StressSample[] = [];
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].category === category) {
        filtered.push({
          category: this.samples[i].category,
          durationMs: this.samples[i].durationMs,
          round: this.samples[i].round
        });
      }
    }
    return filtered;
  }

  /**
   * Sorts the durations of one category in ascending order.
   *
   * @param category operation category.
   * @returns the sorted durations.
   */
  private sortedDurations(category: StressCategory): number[] {
    const filtered: StressSample[] = this.filterBy(category);
    const values: number[] = [];
    for (let i = 0; i < filtered.length; i++) {
      values.push(filtered[i].durationMs);
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

  public totalOf(category: StressCategory): number {
    const filtered: StressSample[] = this.filterBy(category);
    let total: number = 0;
    for (let i = 0; i < filtered.length; i++) {
      total += filtered[i].durationMs;
    }
    return total;
  }

  public averageOf(category: StressCategory): number {
    const filtered: StressSample[] = this.filterBy(category);
    if (filtered.length === 0) {
      return 0;
    }
    return this.totalOf(category) / filtered.length;
  }

  public peakOf(category: StressCategory): number {
    const sorted: number[] = this.sortedDurations(category);
    return sorted.length === 0 ? 0 : sorted[sorted.length - 1];
  }

  public minimumOf(category: StressCategory): number {
    const sorted: number[] = this.sortedDurations(category);
    return sorted.length === 0 ? 0 : sorted[0];
  }

  /**
   * Computes the nearest rank percentile of one category.
   *
   * @param category operation category.
   * @param percent percentile in the closed interval 0..100.
   * @returns the sample at the percentile, 0 for an empty population.
   */
  public percentileOf(category: StressCategory, percent: number): number {
    const sorted: number[] = this.sortedDurations(category);
    if (sorted.length === 0) {
      return 0;
    }
    const bounded: number = percent < 0 ? 0 : (percent > 100 ? 100 : percent);
    if (bounded <= 0) {
      return sorted[0];
    }
    if (bounded >= 100) {
      return sorted[sorted.length - 1];
    }
    let index: number = Math.ceil(bounded * sorted.length / 100) - 1;
    if (index < 0) {
      index = 0;
    }
    if (index > sorted.length - 1) {
      index = sorted.length - 1;
    }
    return sorted[index];
  }

  /**
   * Builds the aggregated metrics of one category.
   *
   * @param category operation category.
   * @returns the aggregated metrics.
   */
  public metricsOf(category: StressCategory): StressMetrics {
    return {
      category: category,
      count: this.countOf(category),
      totalMs: this.totalOf(category),
      averageMs: this.averageOf(category),
      peakMs: this.peakOf(category),
      minimumMs: this.minimumOf(category),
      p90Ms: this.percentileOf(category, 90)
    };
  }

  public categories(): StressCategory[] {
    const seen: StressCategory[] = [];
    for (let i = 0; i < this.samples.length; i++) {
      if (seen.indexOf(this.samples[i].category) < 0) {
        seen.push(this.samples[i].category);
      }
    }
    return seen;
  }

  public reset(): void {
    this.samples = [];
  }

  public toString(): string {
    return `StressSampleCollector{samples=${this.samples.length}, categories=${this.categories().length}}`;
  }
}

/**
 * Models the bounded event log under an event burst.
 *
 * The assessment service may report several callback events in a row, for example an
 * onInterrupted followed by an onEnd. Each event is unshifted to the front of the ring and the
 * oldest event is popped once the bound is reached, so a burst of events costs a constant
 * amount of memory.
 */
class EventBurstModel {
  private entries: string[] = [];
  private readonly capacity: number;
  private dropped: number = 0;
  private bursts: number = 0;

  constructor(capacity: number) {
    this.capacity = capacity > 0 ? capacity : MAX_EVENT_LOG;
  }

  /**
   * Replays a burst of events.
   *
   * @param events events to append in arrival order.
   * @returns the number of events that entered the ring.
   */
  public burst(events: string[]): number {
    if (events.length === 0) {
      return 0;
    }
    this.bursts++;
    let accepted: number = 0;
    for (let i = 0; i < events.length; i++) {
      const next: string[] = this.entries.slice();
      next.unshift(events[i]);
      if (next.length > this.capacity) {
        next.pop();
        this.dropped++;
      }
      this.entries = next;
      accepted++;
    }
    return accepted;
  }

  /**
   * Replays a synthetic burst that mirrors an interrupted session.
   *
   * @param times number of repeated bursts.
   * @returns the number of events that entered the ring.
   */
  public replayInterruptedSession(times: number): number {
    let accepted: number = 0;
    for (let i = 0; i < times; i++) {
      accepted += this.burst(['onInterrupted code=4 message=env', 'onEnd code=0 message=']);
    }
    return accepted;
  }

  public size(): number {
    return this.entries.length;
  }

  public capacityLimit(): number {
    return this.capacity;
  }

  public droppedCount(): number {
    return this.dropped;
  }

  public burstCount(): number {
    return this.bursts;
  }

  public newest(): string {
    return this.entries.length === 0 ? '' : this.entries[0];
  }

  public isBounded(): boolean {
    return this.entries.length <= this.capacity;
  }

  public reset(): void {
    this.entries = [];
    this.dropped = 0;
    this.bursts = 0;
  }

  public toString(): string {
    return `EventBurstModel{size=${this.entries.length}, dropped=${this.dropped}, bursts=${this.bursts}}`;
  }
}

/**
 * Models the whitelist churn of the entry page.
 *
 * The stress suite adds and removes bundle names as fast as the page accepts them. The model
 * keeps the observable contract: the list never exceeds twenty entries and a name is never
 * stored twice, so the churn cannot make the rendered list grow without bound.
 */
class WhitelistChurnModel {
  private apps: string[] = [];
  private additions: number = 0;
  private removals: number = 0;
  private rejected: number = 0;

  /**
   * Adds a bundle name.
   *
   * @param bundleName bundle name to add.
   * @returns true when the name was accepted.
   */
  public add(bundleName: string): boolean {
    if (bundleName.length === 0 || this.apps.indexOf(bundleName) >= 0) {
      this.rejected++;
      return false;
    }
    if (this.apps.length >= MAX_ALLOWED_APPS) {
      this.rejected++;
      return false;
    }
    const next: string[] = this.apps.slice();
    next.push(bundleName);
    this.apps = next;
    this.additions++;
    return true;
  }

  /**
   * Removes the first entry of the list.
   *
   * @returns the removed name, or an empty string when the list is empty.
   */
  public removeFirst(): string {
    if (this.apps.length === 0) {
      this.rejected++;
      return '';
    }
    const removed: string = this.apps[0];
    const next: string[] = this.apps.slice();
    next.splice(0, 1);
    this.apps = next;
    this.removals++;
    return removed;
  }

  /**
   * Runs one add and remove pair.
   *
   * @param bundleName bundle name to add before it is removed again.
   * @returns true when the pair was applied.
   */
  public churn(bundleName: string): boolean {
    if (!this.add(bundleName)) {
      return false;
    }
    return this.removeFirst().length > 0;
  }

  public size(): number {
    return this.apps.length;
  }

  public getAdditions(): number {
    return this.additions;
  }

  public getRemovals(): number {
    return this.removals;
  }

  public getRejected(): number {
    return this.rejected;
  }

  public isWithinLimit(): boolean {
    return this.apps.length <= MAX_ALLOWED_APPS;
  }

  public snapshot(): string[] {
    return this.apps.slice();
  }

  public reset(): void {
    this.apps = [];
    this.additions = 0;
    this.removals = 0;
    this.rejected = 0;
  }

  public toString(): string {
    return `WhitelistChurnModel{size=${this.apps.length}, additions=${this.additions}, removals=${this.removals}}`;
  }
}

/**
 * Evaluates latency values against the documented budgets.
 *
 * The budgets of this suite are intentionally wide because the assertion runs on emulators and
 * on low performance devices. A value that exceeds the budget by any amount is reported as a
 * failure, so a real regression is still caught.
 */
class LatencyBudgetChecker {
  private readonly budgets: Map<string, number> = new Map<string, number>();

  constructor() {
    this.budgets.set(StressCategory.RENDER, BUDGET_PAGE_RENDER_MS);
    this.budgets.set(StressCategory.NAVIGATION, BUDGET_NAVIGATION_MS);
    this.budgets.set(StressCategory.QUERY, BUDGET_QUERY_MS);
    this.budgets.set(StressCategory.BEGIN_END, BUDGET_NAVIGATION_MS);
    this.budgets.set(StressCategory.WHITELIST, BUDGET_WHITELIST_MS);
    this.budgets.set(StressCategory.EVENT_BURST, BUDGET_BURST_MS);
  }

  /**
   * Reads the budget of a category.
   *
   * @param category operation category.
   * @returns the budget in milliseconds, zero when the category has no budget.
   */
  public budgetOf(category: StressCategory): number {
    const budget: number | undefined = this.budgets.get(category);
    return budget === undefined ? 0 : budget;
  }

  /**
   * Evaluates a measured value against the budget of its category.
   *
   * @param category operation category.
   * @param actualMs measured duration.
   * @param name name of the evaluation, it is carried into the result.
   * @returns the evaluation result.
   */
  public evaluate(category: StressCategory, actualMs: number, name: string): BudgetResult {
    const budget: number = this.budgetOf(category);
    return {
      name: name,
      actualMs: actualMs,
      budgetMs: budget,
      withinBudget: budget > 0 && actualMs <= budget
    };
  }

  public setBudget(category: StressCategory, budgetMs: number): boolean {
    if (budgetMs <= 0) {
      return false;
    }
    this.budgets.set(category, budgetMs);
    return true;
  }

  public budgetCount(): number {
    return this.budgets.size;
  }

  public toString(): string {
    return `LatencyBudgetChecker{budgets=${this.budgets.size}}`;
  }
}

/**
 * Aggregates the pass and fail outcomes of one stress run.
 */
class StressReport {
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

  public checkBudget(result: BudgetResult): boolean {
    return this.check(result.name, result.withinBudget);
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
    return this.isPassed() ? 'stress-pass' : 'stress-fail';
  }

  public reset(): void {
    this.checks = [];
    this.failures = [];
  }

  public toString(): string {
    return `StressReport{checks=${this.checks.length}, failures=${this.failures.length}}`;
  }
}

/**
 * Grades an aggregated latency.
 *
 * The grade is only informative: the assertions of this suite use the explicit budgets so that
 * the pass criteria do not change when the grade boundaries are tuned.
 */
class StressGrader {
  /**
   * Grades an average and a peak latency.
   *
   * @param averageMs average latency.
   * @param peakMs peak latency.
   * @returns the grade.
   */
  public static grade(averageMs: number, peakMs: number): StressGrade {
    if (averageMs <= 100 && peakMs <= 300) {
      return StressGrade.EXCELLENT;
    }
    if (averageMs <= 500 && peakMs <= 1500) {
      return StressGrade.GOOD;
    }
    if (averageMs <= 1500 && peakMs <= 3000) {
      return StressGrade.ACCEPTABLE;
    }
    return StressGrade.POOR;
  }

  /**
   * Returns the English label of a grade.
   *
   * @param grade grade to label.
   * @returns the label.
   */
  public static labelOf(grade: StressGrade): string {
    if (grade === StressGrade.EXCELLENT) {
      return 'excellent';
    }
    if (grade === StressGrade.GOOD) {
      return 'good';
    }
    if (grade === StressGrade.ACCEPTABLE) {
      return 'acceptable';
    }
    return 'poor';
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
 * Builds a synthetic event burst of the given size.
 *
 * @param size number of events.
 * @returns the event texts.
 */
function buildEventBurst(size: number): string[] {
  const events: string[] = [];
  for (let i = 0; i < size; i++) {
    events.push('event_' + i);
  }
  return events;
}

export default function performanceStressTest() {
  describe('PerformanceStress_Test', () => {
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
     * Scenario: a fresh stress sample collector is created.
     * Expectation: the population is empty and every aggregate answers zero.
     */
    it('Assessment_PerformanceStress_001', 0, () => {
      logBegin(CASE_001);
      const collector: StressSampleCollector = new StressSampleCollector();
      expect(collector.count()).assertEqual(0);
      expect(collector.countOf(StressCategory.RENDER)).assertEqual(0);
      expect(collector.averageOf(StressCategory.RENDER)).assertEqual(0);
      expect(collector.peakOf(StressCategory.RENDER)).assertEqual(0);
      expect(collector.minimumOf(StressCategory.RENDER)).assertEqual(0);
      expect(collector.percentileOf(StressCategory.RENDER, 90)).assertEqual(0);
      expect(collector.categories().length).assertEqual(0);
      logEnd(CASE_001);
    });

    /**
     * Scenario: one sample is recorded and inspected.
     * Expectation: the count, the total and every aggregate equal the single sample.
     */
    it('Assessment_PerformanceStress_002', 0, () => {
      logBegin(CASE_002);
      const collector: StressSampleCollector = new StressSampleCollector();
      expect(collector.record(StressCategory.RENDER, 120, 0)).assertTrue();
      expect(collector.count()).assertEqual(1);
      expect(collector.countOf(StressCategory.RENDER)).assertEqual(1);
      expect(collector.totalOf(StressCategory.RENDER)).assertEqual(120);
      expect(collector.averageOf(StressCategory.RENDER)).assertEqual(120);
      expect(collector.peakOf(StressCategory.RENDER)).assertEqual(120);
      expect(collector.minimumOf(StressCategory.RENDER)).assertEqual(120);
      expect(collector.categories().length).assertEqual(1);
      logEnd(CASE_002);
    });

    /**
     * Scenario: invalid samples are handed to the collector.
     * Expectation: a negative duration and a negative round are rejected and the population is
     * unchanged.
     */
    it('Assessment_PerformanceStress_003', 0, () => {
      logBegin(CASE_003);
      const collector: StressSampleCollector = new StressSampleCollector();
      expect(collector.record(StressCategory.QUERY, -1, 0)).assertFalse();
      expect(collector.record(StressCategory.QUERY, 10, -1)).assertFalse();
      expect(collector.count()).assertEqual(0);
      expect(collector.recordTimes(StressCategory.QUERY, 50, 4, 0)).assertEqual(4);
      expect(collector.count()).assertEqual(4);
      logEnd(CASE_003);
    });

    /**
     * Scenario: samples of two categories are recorded.
     * Expectation: the filter separates the categories and the aggregates of one category never
     * include a sample of the other one.
     */
    it('Assessment_PerformanceStress_004', 0, () => {
      logBegin(CASE_004);
      const collector: StressSampleCollector = new StressSampleCollector();
      collector.record(StressCategory.RENDER, 100, 0);
      collector.record(StressCategory.NAVIGATION, 400, 0);
      collector.record(StressCategory.RENDER, 200, 1);
      expect(collector.count()).assertEqual(3);
      expect(collector.countOf(StressCategory.RENDER)).assertEqual(2);
      expect(collector.countOf(StressCategory.NAVIGATION)).assertEqual(1);
      expect(collector.totalOf(StressCategory.RENDER)).assertEqual(300);
      expect(collector.averageOf(StressCategory.RENDER)).assertEqual(150);
      expect(collector.peakOf(StressCategory.RENDER)).assertEqual(200);
      expect(collector.minimumOf(StressCategory.RENDER)).assertEqual(100);
      expect(collector.categories().length).assertEqual(2);
      logEnd(CASE_004);
    });

    /**
     * Scenario: the nearest rank percentile of a hundred quadratically growing samples is
     * computed.
     * Expectation: p50, p90 and p99 return the documented nearest rank values and the
     * boundaries return the minimum and the maximum.
     */
    it('Assessment_PerformanceStress_005', 0, () => {
      logBegin(CASE_005);
      const collector: StressSampleCollector = new StressSampleCollector();
      for (let i = 1; i <= 100; i++) {
        collector.record(StressCategory.RENDER, i, i - 1);
      }
      expect(collector.percentileOf(StressCategory.RENDER, 50)).assertEqual(50);
      expect(collector.percentileOf(StressCategory.RENDER, 90)).assertEqual(90);
      expect(collector.percentileOf(StressCategory.RENDER, 99)).assertEqual(99);
      expect(collector.percentileOf(StressCategory.RENDER, 0)).assertEqual(1);
      expect(collector.percentileOf(StressCategory.RENDER, 100)).assertEqual(100);
      expect(collector.percentileOf(StressCategory.RENDER, -10)).assertEqual(1);
      logEnd(CASE_005);
    });

    /**
     * Scenario: the aggregated metrics of a category are built.
     * Expectation: the metrics carry the category name, the count, the total, the average, the
     * peak, the minimum and the p90 value of the population.
     */
    it('Assessment_PerformanceStress_006', 0, () => {
      logBegin(CASE_006);
      const collector: StressSampleCollector = new StressSampleCollector();
      collector.recordTimes(StressCategory.QUERY, 40, 10, 0);
      const metrics: StressMetrics = collector.metricsOf(StressCategory.QUERY);
      expect(metrics.category).assertEqual(StressCategory.QUERY);
      expect(metrics.count).assertEqual(10);
      expect(metrics.totalMs).assertEqual(400);
      expect(metrics.averageMs).assertEqual(40);
      expect(metrics.peakMs).assertEqual(40);
      expect(metrics.minimumMs).assertEqual(40);
      expect(metrics.p90Ms).assertEqual(40);
      logEnd(CASE_006);
    });

    /**
     * Scenario: the collector is reset after a run.
     * Expectation: the population and the category list are empty again.
     */
    it('Assessment_PerformanceStress_008', 0, () => {
      logBegin(CASE_008);
      const collector: StressSampleCollector = new StressSampleCollector();
      collector.recordTimes(StressCategory.BEGIN_END, 250, STRESS_BATCH, 0);
      expect(collector.count()).assertEqual(STRESS_BATCH);
      collector.reset();
      expect(collector.count()).assertEqual(0);
      expect(collector.categories().length).assertEqual(0);
      expect(collector.peakOf(StressCategory.BEGIN_END)).assertEqual(0);
      logEnd(CASE_008);
    });

    /**
     * Scenario: the burst model receives exactly one full ring of events.
     * Expectation: the ring is full but nothing was dropped and the newest event sits at the
     * front.
     */
    it('Assessment_PerformanceStress_009', 0, () => {
      logBegin(CASE_009);
      const burst: EventBurstModel = new EventBurstModel(MAX_EVENT_LOG);
      expect(burst.burst(buildEventBurst(MAX_EVENT_LOG))).assertEqual(MAX_EVENT_LOG);
      expect(burst.size()).assertEqual(MAX_EVENT_LOG);
      expect(burst.droppedCount()).assertEqual(0);
      expect(burst.newest()).assertEqual('event_' + (MAX_EVENT_LOG - 1));
      expect(burst.burstCount()).assertEqual(1);
      expect(burst.isBounded()).assertTrue();
      logEnd(CASE_009);
    });

    /**
     * Scenario: a hundred event burst fires at once.
     * Expectation: the ring stays at its capacity and every surplus event is counted as
     * dropped, which proves that an event storm does not grow the log.
     */
    it('Assessment_PerformanceStress_010', 0, () => {
      logBegin(CASE_010);
      const burst: EventBurstModel = new EventBurstModel(MAX_EVENT_LOG);
      expect(burst.burst(buildEventBurst(STRESS_BATCH))).assertEqual(STRESS_BATCH);
      expect(burst.size()).assertEqual(MAX_EVENT_LOG);
      expect(burst.droppedCount()).assertEqual(STRESS_BATCH - MAX_EVENT_LOG);
      expect(burst.newest()).assertEqual('event_' + (STRESS_BATCH - 1));
      expect(burst.isBounded()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', burst.toString());
      logEnd(CASE_010);
    });

    /**
     * Scenario: an empty burst is replayed.
     * Expectation: nothing is accepted and the burst counter is unchanged, while the interrupted
     * session replay appends both of its events per burst.
     */
    it('Assessment_PerformanceStress_011', 0, () => {
      logBegin(CASE_011);
      const burst: EventBurstModel = new EventBurstModel(MAX_EVENT_LOG);
      expect(burst.burst([])).assertEqual(0);
      expect(burst.burstCount()).assertEqual(0);
      expect(burst.size()).assertEqual(0);
      expect(burst.newest()).assertEqual('');
      expect(burst.replayInterruptedSession(3)).assertEqual(6);
      expect(burst.size()).assertEqual(6);
      expect(burst.burstCount()).assertEqual(3);
      expect(COUNTDOWN_INTERVAL).assertEqual(1000);
      logEnd(CASE_011);
    });

    /**
     * Scenario: the whitelist churn adds a bundle name up to the limit.
     * Expectation: the twenty first unique name is accepted, the overflow names are rejected and
     * the list never exceeds the limit.
     */
    it('Assessment_PerformanceStress_013', 0, () => {
      logBegin(CASE_013);
      const churn: WhitelistChurnModel = new WhitelistChurnModel();
      for (let i = 0; i < MAX_ALLOWED_APPS; i++) {
        expect(churn.add('com.samples.app' + i)).assertTrue();
      }
      expect(churn.size()).assertEqual(MAX_ALLOWED_APPS);
      expect(churn.add('com.samples.overflow')).assertFalse();
      expect(churn.add('com.samples.app0')).assertFalse();
      expect(churn.getRejected()).assertEqual(2);
      expect(churn.isWithinLimit()).assertTrue();
      logEnd(CASE_013);
    });

    /**
     * Scenario: the first entry of a seeded whitelist is removed.
     * Expectation: the removed name is returned and the list shrinks by one entry.
     */
    it('Assessment_PerformanceStress_014', 0, () => {
      logBegin(CASE_014);
      const churn: WhitelistChurnModel = new WhitelistChurnModel();
      churn.add('com.samples.assessment');
      churn.add('com.samples.dictionary');
      expect(churn.removeFirst()).assertEqual('com.samples.assessment');
      expect(churn.size()).assertEqual(1);
      expect(churn.getRemovals()).assertEqual(1);
      expect(churn.removeFirst()).assertEqual('com.samples.dictionary');
      expect(churn.removeFirst()).assertEqual('');
      expect(churn.getRejected()).assertEqual(1);
      logEnd(CASE_014);
    });

    /**
     * Scenario: the whitelist snapshot is modified by a reader.
     * Expectation: the modification never reaches the model, so a rendered list can never
     * corrupt the state that drives it.
     */
    it('Assessment_PerformanceStress_016', 0, () => {
      logBegin(CASE_016);
      const churn: WhitelistChurnModel = new WhitelistChurnModel();
      churn.add('com.samples.assessment');
      const snapshot: string[] = churn.snapshot();
      snapshot.push('com.samples.injected');
      expect(snapshot.length).assertEqual(2);
      expect(churn.size()).assertEqual(1);
      expect(churn.snapshot().length).assertEqual(1);
      expect(churn.churn('com.samples.reader')).assertTrue();
      expect(churn.size()).assertEqual(1);
      logEnd(CASE_016);
    });

    /**
     * Scenario: the budget checker evaluates one measured value of every category.
     * Expectation: a value inside the budget passes, a value above the budget fails and the
     * budget of an unknown category evaluates to a failure instead of throwing.
     */
    it('Assessment_PerformanceStress_017', 0, () => {
      logBegin(CASE_017);
      const checker: LatencyBudgetChecker = new LatencyBudgetChecker();
      expect(checker.budgetCount()).assertEqual(6);
      expect(checker.budgetOf(StressCategory.RENDER)).assertEqual(BUDGET_PAGE_RENDER_MS);
      const inside: BudgetResult = checker.evaluate(StressCategory.RENDER, 900, 'render');
      expect(inside.withinBudget).assertTrue();
      expect(inside.budgetMs).assertEqual(BUDGET_PAGE_RENDER_MS);
      const outside: BudgetResult = checker.evaluate(StressCategory.RENDER, 9000, 'render-slow');
      expect(outside.withinBudget).assertFalse();
      expect(checker.setBudget(StressCategory.RENDER, 0)).assertFalse();
      expect(checker.setBudget(StressCategory.RENDER, 3500)).assertTrue();
      expect(checker.budgetOf(StressCategory.RENDER)).assertEqual(3500);
      hilog.info(DOMAIN, TAG, '%{public}s', checker.toString());
      logEnd(CASE_017);
    });

    /**
     * Scenario: one stress population is graded and reported.
     * Expectation: the grader maps the average and the peak to the documented grade and the
     * report passes when every budget result is inside its budget.
     */
    it('Assessment_PerformanceStress_018', 0, () => {
      logBegin(CASE_018);
      const collector: StressSampleCollector = new StressSampleCollector();
      const checker: LatencyBudgetChecker = new LatencyBudgetChecker();
      const report: StressReport = new StressReport();
      for (let i = 0; i < STRESS_BATCH; i++) {
        collector.record(StressCategory.NAVIGATION, 120 + (i % 40), i % 10);
      }
      const metrics: StressMetrics = collector.metricsOf(StressCategory.NAVIGATION);
      report.checkBudget(checker.evaluate(StressCategory.NAVIGATION, metrics.averageMs, 'nav-average'));
      report.checkBudget(checker.evaluate(StressCategory.NAVIGATION, metrics.peakMs, 'nav-peak'));
      report.checkUpperBound('nav-p90', metrics.p90Ms, BUDGET_NAVIGATION_MS);
      report.check('nav-count', metrics.count === STRESS_BATCH);
      expect(report.isPassed()).assertTrue();
      expect(report.summary()).assertEqual('stress-pass');
      const grade: StressGrade = StressGrader.grade(metrics.averageMs, metrics.peakMs);
      expect(StressGrader.labelOf(grade)).assertEqual('good');
      expect(StressGrader.labelOf(StressGrader.grade(9000, 9000))).assertEqual('poor');
      expect(StressGrader.labelOf(StressGrader.grade(10, 20))).assertEqual('excellent');
      expect(report.check('forced', false)).assertFalse();
      expect(report.summary()).assertEqual('stress-fail');
      logEnd(CASE_018);
    });
  });
}
