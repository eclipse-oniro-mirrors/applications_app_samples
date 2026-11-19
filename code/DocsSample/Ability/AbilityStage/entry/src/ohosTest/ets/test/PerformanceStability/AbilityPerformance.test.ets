/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  logInfo,
  serializedDelay,
  resetDriver,
  isQueueBusy,
  launchEntryAbility,
  doAbilityForeground,
  doAbilityBackground,
  waitForIndexPageStable,
  isIndexPageVisible,
  checkTextContent,
  pageComponentCount,
  measureElapsed,
  isWithinBudget,
  averageOf,
  maxOf,
  minOf,
  getBundleName,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  ABILITY_STAGE_NAME,
  ENTRY_ABILITY_NAME,
  COLOR_MODE_NOT_SET,
  TIMEOUT_ABILITY_LAUNCH,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_BACKGROUND_SWITCH,
  DELAY_AFTER_LAUNCH,
  TOLERANCE_COMPONENT_COUNT,
  STRESS_ROUNDS_LAUNCH,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum AbilityPhase {
  ON_CREATE = 'onCreate',
  ON_WINDOW_STAGE_CREATE = 'onWindowStageCreate',
  ON_FOREGROUND = 'onForeground',
  ON_BACKGROUND = 'onBackground',
  ON_WINDOW_STAGE_DESTROY = 'onWindowStageDestroy',
  ON_DESTROY = 'onDestroy'
}

interface PhaseMeasurement {
  phase: AbilityPhase;
  elapsedMs: number;
  round: number;
}

class PhaseBudgetModel {
  private onCreateBudget: number;
  private windowStageBudget: number;
  private foregroundBudget: number;

  constructor(onCreateBudget: number, windowStageBudget: number, foregroundBudget: number) {
    this.onCreateBudget = onCreateBudget;
    this.windowStageBudget = windowStageBudget;
    this.foregroundBudget = foregroundBudget;
  }

  public getBudget(phase: AbilityPhase): number {
    if (phase === AbilityPhase.ON_CREATE) {
      return this.onCreateBudget;
    }
    if (phase === AbilityPhase.ON_WINDOW_STAGE_CREATE) {
      return this.windowStageBudget;
    }
    if (phase === AbilityPhase.ON_FOREGROUND) {
      return this.foregroundBudget;
    }
    return this.foregroundBudget;
  }

  public isWithinBudget(phase: AbilityPhase, elapsedMs: number): boolean {
    return elapsedMs <= this.getBudget(phase);
  }

  public getOverrun(phase: AbilityPhase, elapsedMs: number): number {
    const overrun: number = elapsedMs - this.getBudget(phase);
    if (overrun <= 0) {
      return 0;
    }
    return overrun;
  }

  public getTotalBudget(): number {
    return this.onCreateBudget + this.windowStageBudget + this.foregroundBudget;
  }

  public getPhaseLabel(phase: AbilityPhase): string {
    if (phase === AbilityPhase.ON_CREATE) {
      return 'onCreate';
    }
    if (phase === AbilityPhase.ON_WINDOW_STAGE_CREATE) {
      return 'onWindowStageCreate';
    }
    if (phase === AbilityPhase.ON_FOREGROUND) {
      return 'onForeground';
    }
    if (phase === AbilityPhase.ON_BACKGROUND) {
      return 'onBackground';
    }
    if (phase === AbilityPhase.ON_WINDOW_STAGE_DESTROY) {
      return 'onWindowStageDestroy';
    }
    return 'onDestroy';
  }

  public countWithinBudget(measurements: PhaseMeasurement[]): number {
    let count: number = 0;
    for (let i = 0; i < measurements.length; i++) {
      if (this.isWithinBudget(measurements[i].phase, measurements[i].elapsedMs)) {
        count++;
      }
    }
    return count;
  }

  public getOverrunFlags(measurements: PhaseMeasurement[]): number {
    return measurements.length - this.countWithinBudget(measurements);
  }
}

class PhaseShareAnalyzer {
  private measurements: PhaseMeasurement[] = [];

  public add(measurement: PhaseMeasurement): void {
    this.measurements.push(measurement);
  }

  public clear(): void {
    this.measurements = [];
  }

  public getCount(): number {
    return this.measurements.length;
  }

  public getTotalElapsed(): number {
    let total: number = 0;
    for (let i = 0; i < this.measurements.length; i++) {
      total += this.measurements[i].elapsedMs;
    }
    return total;
  }

  public getElapsedForPhase(phase: AbilityPhase): number {
    let total: number = 0;
    for (let i = 0; i < this.measurements.length; i++) {
      if (this.measurements[i].phase === phase) {
        total += this.measurements[i].elapsedMs;
      }
    }
    return total;
  }

  public getShare(phase: AbilityPhase): number {
    const total: number = this.getTotalElapsed();
    if (total <= 0) {
      return 0;
    }
    return this.getElapsedForPhase(phase) / total;
  }

  public getDominantPhase(): AbilityPhase {
    const phases: AbilityPhase[] = [
      AbilityPhase.ON_CREATE,
      AbilityPhase.ON_WINDOW_STAGE_CREATE,
      AbilityPhase.ON_FOREGROUND
    ];
    let dominant: AbilityPhase = AbilityPhase.ON_CREATE;
    let maxElapsed: number = -1;
    for (let i = 0; i < phases.length; i++) {
      const elapsed: number = this.getElapsedForPhase(phases[i]);
      if (elapsed > maxElapsed) {
        maxElapsed = elapsed;
        dominant = phases[i];
      }
    }
    return dominant;
  }

  public getSharesSum(): number {
    const phases: AbilityPhase[] = [
      AbilityPhase.ON_CREATE,
      AbilityPhase.ON_WINDOW_STAGE_CREATE,
      AbilityPhase.ON_FOREGROUND
    ];
    let sum: number = 0;
    for (let i = 0; i < phases.length; i++) {
      sum += this.getShare(phases[i]);
    }
    return sum;
  }
}

class PercentileCalculator {
  public sortAscending(values: number[]): number[] {
    const sorted: number[] = [];
    for (let i = 0; i < values.length; i++) {
      sorted.push(values[i]);
    }
    for (let i = 0; i < sorted.length; i++) {
      for (let j = i + 1; j < sorted.length; j++) {
        if (sorted[j] < sorted[i]) {
          const temp: number = sorted[i];
          sorted[i] = sorted[j];
          sorted[j] = temp;
        }
      }
    }
    return sorted;
  }

  public percentile(values: number[], percentileRank: number): number {
    if (values.length === 0) {
      return 0;
    }
    const sorted: number[] = this.sortAscending(values);
    if (sorted.length === 1) {
      return sorted[0];
    }
    const boundedRank: number = percentileRank < 0 ? 0 : (percentileRank > 100 ? 100 : percentileRank);
    const rank: number = (boundedRank / 100) * (sorted.length - 1);
    const lowerIndex: number = Math.floor(rank);
    const upperIndex: number = Math.ceil(rank);
    if (lowerIndex === upperIndex) {
      return sorted[lowerIndex];
    }
    const weight: number = rank - lowerIndex;
    return sorted[lowerIndex] * (1 - weight) + sorted[upperIndex] * weight;
  }

  public median(values: number[]): number {
    return this.percentile(values, 50);
  }

  public p95(values: number[]): number {
    return this.percentile(values, 95);
  }

  public interquartileRange(values: number[]): number {
    return this.percentile(values, 75) - this.percentile(values, 25);
  }
}

class PhaseSampleCollector {
  private measurements: PhaseMeasurement[] = [];
  private calculator: PercentileCalculator;

  constructor(calculator: PercentileCalculator) {
    this.calculator = calculator;
  }

  public add(phase: AbilityPhase, elapsedMs: number, round: number): void {
    const measurement: PhaseMeasurement = {
      phase: phase,
      elapsedMs: elapsedMs,
      round: round
    };
    this.measurements.push(measurement);
  }

  public clear(): void {
    this.measurements = [];
  }

  public getCount(): number {
    return this.measurements.length;
  }

  public getElapsedValues(phase: AbilityPhase): number[] {
    const values: number[] = [];
    for (let i = 0; i < this.measurements.length; i++) {
      if (this.measurements[i].phase === phase) {
        values.push(this.measurements[i].elapsedMs);
      }
    }
    return values;
  }

  public getMeasurements(): PhaseMeasurement[] {
    const result: PhaseMeasurement[] = [];
    for (let i = 0; i < this.measurements.length; i++) {
      const source: PhaseMeasurement = this.measurements[i];
      const copied: PhaseMeasurement = {
        phase: source.phase,
        elapsedMs: source.elapsedMs,
        round: source.round
      };
      result.push(copied);
    }
    return result;
  }

  public getP50(phase: AbilityPhase): number {
    return this.calculator.percentile(this.getElapsedValues(phase), 50);
  }

  public getP95(phase: AbilityPhase): number {
    return this.calculator.percentile(this.getElapsedValues(phase), 95);
  }

  public getMax(phase: AbilityPhase): number {
    return maxOf(this.getElapsedValues(phase));
  }

  public getMin(phase: AbilityPhase): number {
    return minOf(this.getElapsedValues(phase));
  }

  public getAverage(phase: AbilityPhase): number {
    return averageOf(this.getElapsedValues(phase));
  }

  public getRounds(): number[] {
    const rounds: number[] = [];
    for (let i = 0; i < this.measurements.length; i++) {
      rounds.push(this.measurements[i].round);
    }
    return rounds;
  }
}

async function ensureIndexPage(driver: Driver): Promise<boolean> {
  const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
  if (stable) {
    return true;
  }
  await launchEntryAbility();
  return await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
}

async function measureCreatePhase(driver: Driver): Promise<number> {
  const startTime: number = Date.now();
  await launchEntryAbility();
  const elapsed: number = measureElapsed(startTime);
  return elapsed;
}

async function measureWindowStagePhase(driver: Driver): Promise<number> {
  const startTime: number = Date.now();
  const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
  const elapsed: number = measureElapsed(startTime);
  expect(stable).assertTrue();
  return elapsed;
}

async function measureForegroundPhase(driver: Driver): Promise<number> {
  const startTime: number = Date.now();
  await doAbilityForeground();
  const elapsed: number = measureElapsed(startTime);
  return elapsed;
}

export default function abilityPerformanceTest(): void {
  describe('AbilityPerformanceTest', () => {
    let driver: Driver;
    let budget: PhaseBudgetModel;
    let calculator: PercentileCalculator;

    beforeAll(async () => {
      driver = getDriver();
      budget = new PhaseBudgetModel(
        TIMEOUT_ABILITY_LAUNCH,
        TIMEOUT_PAGE_RENDER,
        TIMEOUT_BACKGROUND_SWITCH
      );
      calculator = new PercentileCalculator();
      resetDriver();
      const ready: boolean = await ensureIndexPage(driver);
      logInfo('ability performance warm up ready: ' + ready);
      expect(ready).assertTrue();

      await ensureIndexPageInitial(driver);
    });

    afterAll(async () => {
      await doAbilityForeground();
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_0100
     * @tc.name testPhaseBudgetLookup
     * @tc.desc Verify phase budget lookup: create phase budget is 2000 ms, window stage 1000 ms and foreground 1500 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPhaseBudgetLookup', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(budget.getBudget(AbilityPhase.ON_CREATE)).assertEqual(2000);
        expect(budget.getBudget(AbilityPhase.ON_WINDOW_STAGE_CREATE)).assertEqual(1000);
        expect(budget.getBudget(AbilityPhase.ON_FOREGROUND)).assertEqual(1500);
        expect(budget.getTotalBudget()).assertEqual(4500);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_0200
     * @tc.name testPhaseBudgetBoundary
     * @tc.desc Verify phase budget boundary: exactly at budget passes and one millisecond over the budget is flagged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPhaseBudgetBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(budget.isWithinBudget(AbilityPhase.ON_CREATE, 2000)).assertTrue();
        expect(budget.isWithinBudget(AbilityPhase.ON_CREATE, 2001)).assertFalse();
        expect(budget.isWithinBudget(AbilityPhase.ON_WINDOW_STAGE_CREATE, 1000)).assertTrue();
        expect(budget.isWithinBudget(AbilityPhase.ON_WINDOW_STAGE_CREATE, 1001)).assertFalse();
        expect(budget.isWithinBudget(AbilityPhase.ON_FOREGROUND, 1500)).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_0300
     * @tc.name testPhaseOverrunComputation
     * @tc.desc Verify phase overrun: a 2300 ms create phase overruns the 2000 ms budget by 300 ms and a 1900 ms phase overruns by zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPhaseOverrunComputation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(budget.getOverrun(AbilityPhase.ON_CREATE, 2300)).assertEqual(300);
        expect(budget.getOverrun(AbilityPhase.ON_CREATE, 1900)).assertEqual(0);
        expect(budget.getOverrun(AbilityPhase.ON_WINDOW_STAGE_CREATE, 1200)).assertEqual(200);
        expect(budget.getOverrun(AbilityPhase.ON_FOREGROUND, 1500)).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_0400
     * @tc.name testBudgetCountsOverruns
     * @tc.desc Verify overrun counting over four measurements: three within budget and one over budget are reported separately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBudgetCountsOverruns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const budgetCreateSample: PhaseMeasurement = { phase: AbilityPhase.ON_CREATE, elapsedMs: 800, round: 1 };
        const budgetWindowSample: PhaseMeasurement = { phase: AbilityPhase.ON_WINDOW_STAGE_CREATE, elapsedMs: 400, round: 1 };
        const budgetForegroundSample: PhaseMeasurement = { phase: AbilityPhase.ON_FOREGROUND, elapsedMs: 900, round: 1 };
        const budgetOverrunSample: PhaseMeasurement = { phase: AbilityPhase.ON_CREATE, elapsedMs: 2500, round: 2 };
        const measurements: PhaseMeasurement[] = [budgetCreateSample, budgetWindowSample, budgetForegroundSample, budgetOverrunSample];
        expect(budget.countWithinBudget(measurements)).assertEqual(3);
        expect(budget.getOverrunFlags(measurements)).assertEqual(1);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_0500
     * @tc.name testBudgetEmptyMeasurementSet
     * @tc.desc Verify empty measurement handling: no measurements count as zero within budget and zero overrun flags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBudgetEmptyMeasurementSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const measurements: PhaseMeasurement[] = [];
        expect(budget.countWithinBudget(measurements)).assertEqual(0);
        expect(budget.getOverrunFlags(measurements)).assertEqual(0);
        expect(budget.getOverrun(AbilityPhase.ON_CREATE, -10)).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_0600
     * @tc.name testPhaseShareSumTo100Percent
     * @tc.desc Verify phase share proportions: create 100 ms, window 300 ms and foreground 600 ms produce shares summing to one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPhaseShareSumTo100Percent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const analyzer: PhaseShareAnalyzer = new PhaseShareAnalyzer();
        const shareCreateSample: PhaseMeasurement = { phase: AbilityPhase.ON_CREATE, elapsedMs: 100, round: 1 };
        analyzer.add(shareCreateSample);
        const shareWindowSample: PhaseMeasurement = { phase: AbilityPhase.ON_WINDOW_STAGE_CREATE, elapsedMs: 300, round: 1 };
        analyzer.add(shareWindowSample);
        const shareForegroundSample: PhaseMeasurement = { phase: AbilityPhase.ON_FOREGROUND, elapsedMs: 600, round: 1 };
        analyzer.add(shareForegroundSample);
        expect(analyzer.getTotalElapsed()).assertEqual(1000);
        expect(analyzer.getShare(AbilityPhase.ON_CREATE)).assertEqual(0.1);
        expect(analyzer.getShare(AbilityPhase.ON_WINDOW_STAGE_CREATE)).assertEqual(0.3);
        expect(analyzer.getShare(AbilityPhase.ON_FOREGROUND)).assertEqual(0.6);
        expect(Math.abs(analyzer.getSharesSum() - 1) <= 0.0001).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_0700
     * @tc.name testDominantPhaseSelection
     * @tc.desc Verify dominant phase selection: with foreground 600 ms dominating the analyzer reports foreground as the dominant phase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDominantPhaseSelection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const analyzer: PhaseShareAnalyzer = new PhaseShareAnalyzer();
        const dominantCreateSample: PhaseMeasurement = { phase: AbilityPhase.ON_CREATE, elapsedMs: 200, round: 1 };
        analyzer.add(dominantCreateSample);
        const dominantForegroundSample: PhaseMeasurement = { phase: AbilityPhase.ON_FOREGROUND, elapsedMs: 600, round: 1 };
        analyzer.add(dominantForegroundSample);
        expect(analyzer.getDominantPhase()).assertEqual(AbilityPhase.ON_FOREGROUND);
        const dominantLargeCreateSample: PhaseMeasurement = { phase: AbilityPhase.ON_CREATE, elapsedMs: 2000, round: 2 };
        analyzer.add(dominantLargeCreateSample);
        expect(analyzer.getDominantPhase()).assertEqual(AbilityPhase.ON_CREATE);
        expect(analyzer.getCount()).assertEqual(3);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_0800
     * @tc.name testShareAnalyzerEmptyState
     * @tc.desc Verify empty share analyzer: zero measurements give zero total, zero shares and a create phase default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testShareAnalyzerEmptyState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const analyzer: PhaseShareAnalyzer = new PhaseShareAnalyzer();
        expect(analyzer.getCount()).assertEqual(0);
        expect(analyzer.getTotalElapsed()).assertEqual(0);
        expect(analyzer.getShare(AbilityPhase.ON_CREATE)).assertEqual(0);
        expect(analyzer.getDominantPhase()).assertEqual(AbilityPhase.ON_CREATE);
        const emptyStateCreateSample: PhaseMeasurement = { phase: AbilityPhase.ON_CREATE, elapsedMs: 50, round: 1 };
        analyzer.add(emptyStateCreateSample);
        analyzer.clear();
        expect(analyzer.getCount()).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_0900
     * @tc.name testPercentileExactValues
     * @tc.desc Verify percentile computation over five ordered values: P50 is 30, P95 is 48 and the maximum is 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPercentileExactValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const values: number[] = [10, 20, 30, 40, 50];
        expect(calculator.percentile(values, 50)).assertEqual(30);
        expect(Math.abs(calculator.percentile(values, 95) - 48) <= 0.0001).assertTrue();
        expect(calculator.percentile(values, 100)).assertEqual(50);
        expect(calculator.percentile(values, 0)).assertEqual(10);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_1000
     * @tc.name testPercentileUnsortedInput
     * @tc.desc Verify percentile sorting: unordered values 50, 10, 30, 20 and 40 yield the same P50 of 30 as ordered input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPercentileUnsortedInput', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const unordered: number[] = [50, 10, 30, 20, 40];
        const sorted: number[] = calculator.sortAscending(unordered);
        expect(sorted[0]).assertEqual(10);
        expect(sorted[2]).assertEqual(30);
        expect(sorted[4]).assertEqual(50);
        expect(calculator.median(unordered)).assertEqual(30);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_1100
     * @tc.name testPercentileDegenerateInputs
     * @tc.desc Verify percentile edge inputs: an empty list returns zero and a single value returns itself for both P50 and P95
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPercentileDegenerateInputs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const empty: number[] = [];
        const single: number[] = [77];
        expect(calculator.percentile(empty, 50)).assertEqual(0);
        expect(calculator.p95(empty)).assertEqual(0);
        expect(calculator.percentile(single, 50)).assertEqual(77);
        expect(calculator.p95(single)).assertEqual(77);
        expect(calculator.percentile(single, 200)).assertEqual(77);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_1200
     * @tc.name testPercentileClampingOutOfRange
     * @tc.desc Verify percentile clamping: a negative percentile behaves as the minimum and 150 behaves as the maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPercentileClampingOutOfRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const values: number[] = [5, 15, 25, 35];
        expect(calculator.percentile(values, -20)).assertEqual(5);
        expect(calculator.percentile(values, 150)).assertEqual(35);
        expect(calculator.percentile(values, 0)).assertEqual(5);
        expect(calculator.percentile(values, 100)).assertEqual(35);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_1300
     * @tc.name testInterquartileRangeComputation
     * @tc.desc Verify interquartile range: values 10, 20, 30, 40 and 50 give a P75 of 40, P25 of 20 and range 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterquartileRangeComputation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const values: number[] = [10, 20, 30, 40, 50];
        expect(calculator.percentile(values, 75)).assertEqual(40);
        expect(calculator.percentile(values, 25)).assertEqual(20);
        expect(calculator.interquartileRange(values)).assertEqual(20);
        expect(calculator.median(values)).assertEqual(30);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_1400
     * @tc.name testCollectorPhaseValues
     * @tc.desc Verify phase sample collector: two create samples and one foreground sample are filtered and aggregated per phase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCollectorPhaseValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const collector: PhaseSampleCollector = new PhaseSampleCollector(calculator);
        collector.add(AbilityPhase.ON_CREATE, 100, 1);
        collector.add(AbilityPhase.ON_CREATE, 300, 2);
        collector.add(AbilityPhase.ON_FOREGROUND, 200, 2);
        expect(collector.getCount()).assertEqual(3);
        expect(collector.getElapsedValues(AbilityPhase.ON_CREATE).length).assertEqual(2);
        expect(collector.getAverage(AbilityPhase.ON_CREATE)).assertEqual(200);
        expect(collector.getMin(AbilityPhase.ON_CREATE)).assertEqual(100);
        expect(collector.getMax(AbilityPhase.ON_CREATE)).assertEqual(300);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_1500
     * @tc.name testCollectorMissingPhaseDefaults
     * @tc.desc Verify missing phase handling: a phase with no samples reports zero average, zero P50 and zero P95
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCollectorMissingPhaseDefaults', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const collector: PhaseSampleCollector = new PhaseSampleCollector(calculator);
        collector.add(AbilityPhase.ON_CREATE, 100, 1);
        expect(collector.getAverage(AbilityPhase.ON_WINDOW_STAGE_CREATE)).assertEqual(0);
        expect(collector.getP50(AbilityPhase.ON_WINDOW_STAGE_CREATE)).assertEqual(0);
        expect(collector.getP95(AbilityPhase.ON_WINDOW_STAGE_CREATE)).assertEqual(0);
        expect(collector.getElapsedValues(AbilityPhase.ON_BACKGROUND).length).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_1600
     * @tc.name testCollectorSnapshotIndependence
     * @tc.desc Verify collector snapshot independence: mutating the copied measurement list does not change the collector count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCollectorSnapshotIndependence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const collector: PhaseSampleCollector = new PhaseSampleCollector(calculator);
        collector.add(AbilityPhase.ON_CREATE, 120, 1);
        collector.add(AbilityPhase.ON_FOREGROUND, 90, 1);
        const snapshot: PhaseMeasurement[] = collector.getMeasurements();
        expect(snapshot.length).assertEqual(2);
        const destroyPhaseSample: PhaseMeasurement = { phase: AbilityPhase.ON_DESTROY, elapsedMs: 5, round: 9 };
        snapshot.push(destroyPhaseSample);
        expect(snapshot.length).assertEqual(3);
        expect(collector.getCount()).assertEqual(2);
        expect(collector.getRounds().length).assertEqual(2);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_1700
     * @tc.name testAbilityStageConstantNames
     * @tc.desc Verify the AbilityStage and EntryAbility name constants used by the launch path are the configured sample names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAbilityStageConstantNames', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(ABILITY_STAGE_NAME).assertEqual('MyAbilityStage');
        expect(ENTRY_ABILITY_NAME).assertEqual('EntryAbility');
        expect(COLOR_MODE_NOT_SET).assertEqual(-1);
        expect(getBundleName()).assertEqual('com.samples.abilitystage');
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_1800
     * @tc.name testPhaseLabelMapping
     * @tc.desc Verify lifecycle phase labels: every AbilityPhase maps to its documented callback name string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPhaseLabelMapping', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(budget.getPhaseLabel(AbilityPhase.ON_CREATE)).assertEqual('onCreate');
        expect(budget.getPhaseLabel(AbilityPhase.ON_WINDOW_STAGE_CREATE)).assertEqual('onWindowStageCreate');
        expect(budget.getPhaseLabel(AbilityPhase.ON_FOREGROUND)).assertEqual('onForeground');
        expect(budget.getPhaseLabel(AbilityPhase.ON_BACKGROUND)).assertEqual('onBackground');
        expect(budget.getPhaseLabel(AbilityPhase.ON_DESTROY)).assertEqual('onDestroy');
        expect(budget.getPhaseLabel(AbilityPhase.ON_WINDOW_STAGE_DESTROY)).assertEqual('onWindowStageDestroy');
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_1900
     * @tc.name testRealCreatePhaseWithinBudget
     * @tc.desc Verify a real create phase: launching EntryAbility completes within the create budget and brings the page to a stable state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealCreatePhaseWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const elapsed: number = await measureCreatePhase(driver);
        logInfo('create phase elapsed: ' + elapsed);
        expect(isWithinBudget(elapsed, TIMEOUT_ABILITY_LAUNCH)).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
        expect(budget.getOverrun(AbilityPhase.ON_CREATE, elapsed)).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_2000
     * @tc.name testRealWindowStagePhaseWithinBudget
     * @tc.desc Verify a real window stage phase: waiting for the Index page to stabilize stays within the page render budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealWindowStagePhaseWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const ready: boolean = await ensureIndexPage(driver);
        expect(ready).assertTrue();
        const elapsed: number = await measureWindowStagePhase(driver);
        logInfo('window stage phase elapsed: ' + elapsed);
        expect(isWithinBudget(elapsed, TIMEOUT_PAGE_RENDER)).assertTrue();
        expect(budget.isWithinBudget(AbilityPhase.ON_WINDOW_STAGE_CREATE, elapsed)).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_2100
     * @tc.name testRealForegroundPhaseWithinBudget
     * @tc.desc Verify a real foreground phase: a background then foreground cycle completes within the background switch budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealForegroundPhaseWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await doAbilityBackground();
        await serializedDelay(driver, DELAY_AFTER_LAUNCH);
        const elapsed: number = await measureForegroundPhase(driver);
        logInfo('foreground phase elapsed: ' + elapsed);
        expect(isWithinBudget(elapsed, TIMEOUT_BACKGROUND_SWITCH)).assertTrue();
        expect(budget.getOverrun(AbilityPhase.ON_FOREGROUND, elapsed)).assertEqual(0);
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_2200
     * @tc.name testPhaseSamplesAcrossLaunchRounds
     * @tc.desc Verify sampling across five launch rounds: each round records create, window stage and foreground samples with no budget overruns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPhaseSamplesAcrossLaunchRounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const collector: PhaseSampleCollector = new PhaseSampleCollector(calculator);
        const rounds: number = STRESS_ROUNDS_LAUNCH;
        for (let round = 0; round < rounds; round++) {
          const createElapsed: number = await measureCreatePhase(driver);
          collector.add(AbilityPhase.ON_CREATE, createElapsed, round + 1);
          const windowElapsed: number = await measureWindowStagePhase(driver);
          collector.add(AbilityPhase.ON_WINDOW_STAGE_CREATE, windowElapsed, round + 1);
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const foregroundElapsed: number = await measureForegroundPhase(driver);
          collector.add(AbilityPhase.ON_FOREGROUND, foregroundElapsed, round + 1);
        }
        logInfo('phase sample count: ' + collector.getCount());
        expect(collector.getCount()).assertEqual(rounds * 3);
        expect(collector.getElapsedValues(AbilityPhase.ON_CREATE).length).assertEqual(rounds);
        expect(budget.getOverrunFlags(collector.getMeasurements())).assertEqual(0);
        expect(collector.getMin(AbilityPhase.ON_CREATE) >= 0).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_2300
     * @tc.name testPhaseSharesFromRealSamples
     * @tc.desc Verify real phase shares: create and window stage samples produce shares between zero and one that sum to one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPhaseSharesFromRealSamples', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const analyzer: PhaseShareAnalyzer = new PhaseShareAnalyzer();
        const createElapsed: number = await measureCreatePhase(driver);
        const realShareCreateSample: PhaseMeasurement = { phase: AbilityPhase.ON_CREATE, elapsedMs: createElapsed + 1, round: 1 };
        analyzer.add(realShareCreateSample);
        const windowElapsed: number = await measureWindowStagePhase(driver);
        const realShareWindowSample: PhaseMeasurement = { phase: AbilityPhase.ON_WINDOW_STAGE_CREATE, elapsedMs: windowElapsed + 1, round: 1 };
        analyzer.add(realShareWindowSample);
        const createShare: number = analyzer.getShare(AbilityPhase.ON_CREATE);
        const windowShare: number = analyzer.getShare(AbilityPhase.ON_WINDOW_STAGE_CREATE);
        logInfo('create share ' + createShare + ' window share ' + windowShare);
        expect(createShare > 0).assertTrue();
        expect(windowShare > 0).assertTrue();
        expect(createShare < 1).assertTrue();
        expect(Math.abs(createShare + windowShare - 1) <= 0.0001).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_2400
     * @tc.name testP50P95FromRealCreateSamples
     * @tc.desc Verify percentiles from five real create samples: P50 is no greater than P95 and P95 is no greater than the maximum sample
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testP50P95FromRealCreateSamples', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const collector: PhaseSampleCollector = new PhaseSampleCollector(calculator);
        for (let round = 0; round < 5; round++) {
          const elapsed: number = await measureCreatePhase(driver);
          collector.add(AbilityPhase.ON_CREATE, elapsed, round + 1);
        }
        const p50: number = collector.getP50(AbilityPhase.ON_CREATE);
        const p95: number = collector.getP95(AbilityPhase.ON_CREATE);
        const maxValue: number = collector.getMax(AbilityPhase.ON_CREATE);
        logInfo('create p50 ' + p50 + ' p95 ' + p95 + ' max ' + maxValue);
        expect(collector.getElapsedValues(AbilityPhase.ON_CREATE).length).assertEqual(5);
        expect(p50 >= collector.getMin(AbilityPhase.ON_CREATE)).assertTrue();
        expect(p95 >= p50).assertTrue();
        expect(p95 <= maxValue).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_2500
     * @tc.name testP50P95FromRealForegroundSamples
     * @tc.desc Verify percentiles from three real foreground samples: P50 is bounded by the minimum and maximum and P95 does not exceed the maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testP50P95FromRealForegroundSamples', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const collector: PhaseSampleCollector = new PhaseSampleCollector(calculator);
        for (let round = 0; round < 3; round++) {
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const elapsed: number = await measureForegroundPhase(driver);
          collector.add(AbilityPhase.ON_FOREGROUND, elapsed, round + 1);
        }
        const p50: number = collector.getP50(AbilityPhase.ON_FOREGROUND);
        const p95: number = collector.getP95(AbilityPhase.ON_FOREGROUND);
        const minValue: number = collector.getMin(AbilityPhase.ON_FOREGROUND);
        const maxValue: number = collector.getMax(AbilityPhase.ON_FOREGROUND);
        logInfo('foreground p50 ' + p50 + ' p95 ' + p95);
        expect(collector.getElapsedValues(AbilityPhase.ON_FOREGROUND).length).assertEqual(3);
        expect(p50 >= minValue).assertTrue();
        expect(p50 <= maxValue).assertTrue();
        expect(p95 <= maxValue).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_2600
     * @tc.name testPageContentReadableThroughPhases
     * @tc.desc Verify page readability through the full phase sequence: the initial or clicked message is readable after create, window stage and foreground
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPageContentReadableThroughPhases', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await measureCreatePhase(driver);
        await measureWindowStagePhase(driver);
        await doAbilityBackground();
        await serializedDelay(driver, DELAY_AFTER_LAUNCH);
        await measureForegroundPhase(driver);
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const clickedVisible: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        const initialVisible: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        expect(stable).assertTrue();
        expect(clickedVisible || initialVisible).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_2700
     * @tc.name testComponentCountStableAcrossPhases
     * @tc.desc Verify component count stability across a full phase sequence: the final count stays within tolerance of the initial baseline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testComponentCountStableAcrossPhases', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const ready: boolean = await ensureIndexPage(driver);
        expect(ready).assertTrue();
        const baselineCount: number = await pageComponentCount(driver);
        expect(baselineCount >= 1).assertTrue();
        await measureCreatePhase(driver);
        await measureWindowStagePhase(driver);
        await doAbilityBackground();
        await serializedDelay(driver, DELAY_AFTER_LAUNCH);
        await measureForegroundPhase(driver);
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const finalCount: number = await pageComponentCount(driver);
        expect(Math.abs(finalCount - baselineCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_2800
     * @tc.name testQueueIdleAfterPhaseSequence
     * @tc.desc Verify the serialized queue returns to idle after a full phase sequence and the page remains visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testQueueIdleAfterPhaseSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await measureCreatePhase(driver);
        await measureWindowStagePhase(driver);
        await doAbilityBackground();
        await serializedDelay(driver, DELAY_AFTER_LAUNCH);
        await doAbilityForeground();
        await serializedDelay(driver, DELAY_AFTER_LAUNCH);
        expect(isQueueBusy()).assertFalse();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_2900
     * @tc.name testAveragePhaseDurationBounded
     * @tc.desc Verify averaged phase durations over two rounds: the average create and window stage durations stay within the summed phase budgets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAveragePhaseDurationBounded', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const collector: PhaseSampleCollector = new PhaseSampleCollector(calculator);
        for (let round = 0; round < 2; round++) {
          collector.add(AbilityPhase.ON_CREATE, await measureCreatePhase(driver), round + 1);
          collector.add(AbilityPhase.ON_WINDOW_STAGE_CREATE, await measureWindowStagePhase(driver), round + 1);
        }
        const createAverage: number = collector.getAverage(AbilityPhase.ON_CREATE);
        const windowAverage: number = collector.getAverage(AbilityPhase.ON_WINDOW_STAGE_CREATE);
        logInfo('average create ' + createAverage + ' average window ' + windowAverage);
        expect(collector.getCount()).assertEqual(4);
        expect(averageOf(collector.getElapsedValues(AbilityPhase.ON_CREATE))).assertEqual(createAverage);
        expect(createAverage <= TIMEOUT_ABILITY_LAUNCH).assertTrue();
        expect(createAverage + windowAverage).assertLessOrEqual(budget.getTotalBudget());
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYPERF_3000
     * @tc.name testMinimumPhaseSampleNonNegative
     * @tc.desc Verify minimum phase samples are non negative and maximum not less than minimum across recorded create samples
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMinimumPhaseSampleNonNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const collector: PhaseSampleCollector = new PhaseSampleCollector(calculator);
        for (let round = 0; round < 3; round++) {
          collector.add(AbilityPhase.ON_CREATE, await measureCreatePhase(driver), round + 1);
        }
        const minValue: number = collector.getMin(AbilityPhase.ON_CREATE);
        const maxValue: number = collector.getMax(AbilityPhase.ON_CREATE);
        expect(minValue >= 0).assertTrue();
        expect(maxValue >= minValue).assertTrue();
        expect(maxValue <= TIMEOUT_ABILITY_LAUNCH).assertTrue();
        expect(collector.getRounds().length).assertEqual(3);
      } finally {
        done();
      }
    });
  });
}
