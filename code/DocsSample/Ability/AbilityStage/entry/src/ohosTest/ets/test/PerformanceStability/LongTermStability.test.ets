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
  ensureIndexPageInitial,
  logInfo,
  serializedDelay,
  launchEntryAbility,
  doAbilityForeground,
  doAbilityBackground,
  waitForIndexPageStable,
  isIndexPageVisible,
  pageComponentCount,
  checkTextContent,
  tapComponentByText,
  measureElapsed,
  isWithinBudget,
  averageOf,
  maxOf,
  minOf,
  PAGE_TEXT_CLICKED,
  PAGE_TEXT_INITIAL,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_BACKGROUND_SWITCH,
  TIMEOUT_ABILITY_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  STRESS_ROUNDS_LIFECYCLE,
  STABLE_TOLERANCE
} from '../Shared/SharedDriver';

class LifecycleRoundMetric {
  private round: number;
  private foregroundMs: number;
  private backgroundMs: number;
  private componentCount: number;

  constructor(round: number, foregroundMs: number, backgroundMs: number, componentCount: number) {
    this.round = round;
    this.foregroundMs = foregroundMs;
    this.backgroundMs = backgroundMs;
    this.componentCount = componentCount;
  }

  public getRound(): number {
    return this.round;
  }

  public getForegroundMs(): number {
    return this.foregroundMs;
  }

  public getBackgroundMs(): number {
    return this.backgroundMs;
  }

  public getComponentCount(): number {
    return this.componentCount;
  }

  public getTotalMs(): number {
    return this.foregroundMs + this.backgroundMs;
  }
}

class LifecycleDriftAnalyzer {
  private tolerance: number;
  private metrics: LifecycleRoundMetric[] = [];

  constructor(tolerance: number) {
    this.tolerance = tolerance;
  }

  public add(metric: LifecycleRoundMetric): void {
    this.metrics.push(metric);
  }

  public clear(): void {
    this.metrics = [];
  }

  public getRoundCount(): number {
    return this.metrics.length;
  }

  public getTolerance(): number {
    return this.tolerance;
  }

  public getFirst(): LifecycleRoundMetric | null {
    if (this.metrics.length === 0) {
      return null;
    }
    return this.metrics[0];
  }

  public getLast(): LifecycleRoundMetric | null {
    if (this.metrics.length === 0) {
      return null;
    }
    return this.metrics[this.metrics.length - 1];
  }

  public getComponentCounts(): number[] {
    const counts: number[] = [];
    for (let i = 0; i < this.metrics.length; i++) {
      counts.push(this.metrics[i].getComponentCount());
    }
    return counts;
  }

  public getForegroundDurations(): number[] {
    const durations: number[] = [];
    for (let i = 0; i < this.metrics.length; i++) {
      durations.push(this.metrics[i].getForegroundMs());
    }
    return durations;
  }

  public getComponentDrift(): number {
    const first: LifecycleRoundMetric | null = this.getFirst();
    const last: LifecycleRoundMetric | null = this.getLast();
    if (first === null || last === null) {
      return 0;
    }
    return Math.abs(last.getComponentCount() - first.getComponentCount());
  }

  public getDurationDrift(): number {
    const first: LifecycleRoundMetric | null = this.getFirst();
    const last: LifecycleRoundMetric | null = this.getLast();
    if (first === null || last === null) {
      return 0;
    }
    return Math.abs(last.getTotalMs() - first.getTotalMs());
  }

  public isComponentDriftStable(): boolean {
    return this.getComponentDrift() <= this.tolerance;
  }

  public isAverageComponentCountWithinBaseline(baseline: number): boolean {
    const counts: number[] = this.getComponentCounts();
    if (counts.length === 0) {
      return false;
    }
    return Math.abs(averageOf(counts) - baseline) <= this.tolerance;
  }

  public isMonotonicRoundSequence(): boolean {
    for (let i = 0; i < this.metrics.length; i++) {
      if (this.metrics[i].getRound() !== i + 1) {
        return false;
      }
    }
    return this.metrics.length > 0;
  }

  public getForegroundSpread(): number {
    const durations: number[] = this.getForegroundDurations();
    if (durations.length === 0) {
      return 0;
    }
    return maxOf(durations) - minOf(durations);
  }
}

export default function longTermStabilityTest(): void {
  describe('LongTermStabilityTest', () => {
    let driver: Driver;
    let analyzer: LifecycleDriftAnalyzer;

    beforeAll(async () => {
      driver = getDriver();
      analyzer = new LifecycleDriftAnalyzer(STABLE_TOLERANCE);
      const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      if (!stable) {
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        await ensureIndexPageInitial(driver);
      }
    });

    afterAll(async () => {
      await doAbilityForeground();
      await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
      analyzer.clear();
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LONGTERM_0100
     * @tc.name testAnalyzerToleranceIsSharedConstant
     * @tc.desc Verify drift analyzer tolerance: constructed with the shared tolerance and reports zero rounds, zero component drift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAnalyzerToleranceIsSharedConstant', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const empty: LifecycleDriftAnalyzer = new LifecycleDriftAnalyzer(STABLE_TOLERANCE);
        expect(empty.getTolerance()).assertEqual(3);
        expect(empty.getRoundCount()).assertEqual(0);
        expect(empty.getComponentDrift()).assertEqual(0);
        expect(empty.getFirst()).assertNull();
        expect(empty.getLast()).assertNull();
        expect(empty.isMonotonicRoundSequence()).assertFalse();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LONGTERM_0200
     * @tc.name testMetricTotalDurationSum
     * @tc.desc Verify round metric total: foreground 120 ms plus background 80 ms yields total 200 ms for round 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMetricTotalDurationSum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const metric: LifecycleRoundMetric = new LifecycleRoundMetric(1, 120, 80, 4);
        expect(metric.getRound()).assertEqual(1);
        expect(metric.getForegroundMs()).assertEqual(120);
        expect(metric.getBackgroundMs()).assertEqual(80);
        expect(metric.getComponentCount()).assertEqual(4);
        expect(metric.getTotalMs()).assertEqual(200);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LONGTERM_0300
     * @tc.name testComponentDriftWithinTolerance
     * @tc.desc Verify component drift boundary: counts 4 and 7 give drift 3 which is stable, counts 4 and 8 give drift 4 which is unstable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testComponentDriftWithinTolerance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const atLimit: LifecycleDriftAnalyzer = new LifecycleDriftAnalyzer(STABLE_TOLERANCE);
        atLimit.add(new LifecycleRoundMetric(1, 100, 100, 4));
        atLimit.add(new LifecycleRoundMetric(2, 100, 100, 7));
        expect(atLimit.getComponentDrift()).assertEqual(3);
        expect(atLimit.isComponentDriftStable()).assertTrue();
        const overLimit: LifecycleDriftAnalyzer = new LifecycleDriftAnalyzer(STABLE_TOLERANCE);
        overLimit.add(new LifecycleRoundMetric(1, 100, 100, 4));
        overLimit.add(new LifecycleRoundMetric(2, 100, 100, 8));
        expect(overLimit.getComponentDrift()).assertEqual(4);
        expect(overLimit.isComponentDriftStable()).assertFalse();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LONGTERM_0400
     * @tc.name testRoundSequenceMonotonicCheck
     * @tc.desc Verify round numbering: metrics added with rounds 1 and 2 are monotonic, rounds 1 and 3 are not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRoundSequenceMonotonicCheck', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const sequential: LifecycleDriftAnalyzer = new LifecycleDriftAnalyzer(STABLE_TOLERANCE);
        sequential.add(new LifecycleRoundMetric(1, 50, 50, 2));
        sequential.add(new LifecycleRoundMetric(2, 50, 50, 2));
        expect(sequential.getRoundCount()).assertEqual(2);
        expect(sequential.isMonotonicRoundSequence()).assertTrue();
        const skipped: LifecycleDriftAnalyzer = new LifecycleDriftAnalyzer(STABLE_TOLERANCE);
        skipped.add(new LifecycleRoundMetric(1, 50, 50, 2));
        skipped.add(new LifecycleRoundMetric(3, 50, 50, 2));
        expect(skipped.isMonotonicRoundSequence()).assertFalse();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LONGTERM_0500
     * @tc.name testAverageComponentCountWithinBaseline
     * @tc.desc Verify averaged component count: counts 3, 4 and 5 against baseline 4 are within tolerance, baseline 10 is not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAverageComponentCountWithinBaseline', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const analyzerLocal: LifecycleDriftAnalyzer = new LifecycleDriftAnalyzer(STABLE_TOLERANCE);
        analyzerLocal.add(new LifecycleRoundMetric(1, 10, 10, 3));
        analyzerLocal.add(new LifecycleRoundMetric(2, 10, 10, 4));
        analyzerLocal.add(new LifecycleRoundMetric(3, 10, 10, 5));
        expect(averageOf(analyzerLocal.getComponentCounts())).assertEqual(4);
        expect(analyzerLocal.isAverageComponentCountWithinBaseline(4)).assertTrue();
        expect(analyzerLocal.isAverageComponentCountWithinBaseline(10)).assertFalse();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LONGTERM_0600
     * @tc.name testForegroundSpreadComputation
     * @tc.desc Verify spread of foreground durations 100, 140 and 120 ms: max minus min equals 40 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testForegroundSpreadComputation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const analyzerLocal: LifecycleDriftAnalyzer = new LifecycleDriftAnalyzer(STABLE_TOLERANCE);
        analyzerLocal.add(new LifecycleRoundMetric(1, 100, 10, 2));
        analyzerLocal.add(new LifecycleRoundMetric(2, 140, 10, 2));
        analyzerLocal.add(new LifecycleRoundMetric(3, 120, 10, 2));
        expect(maxOf(analyzerLocal.getForegroundDurations())).assertEqual(140);
        expect(minOf(analyzerLocal.getForegroundDurations())).assertEqual(100);
        expect(analyzerLocal.getForegroundSpread()).assertEqual(40);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LONGTERM_0700
     * @tc.name testClearResetsAnalyzer
     * @tc.desc Verify analyzer reset: two added metrics are cleared, round count returns to zero and drift becomes zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testClearResetsAnalyzer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const analyzerLocal: LifecycleDriftAnalyzer = new LifecycleDriftAnalyzer(STABLE_TOLERANCE);
        analyzerLocal.add(new LifecycleRoundMetric(1, 10, 10, 2));
        analyzerLocal.add(new LifecycleRoundMetric(2, 10, 10, 9));
        expect(analyzerLocal.getRoundCount()).assertEqual(2);
        expect(analyzerLocal.getComponentDrift()).assertEqual(7);
        analyzerLocal.clear();
        expect(analyzerLocal.getRoundCount()).assertEqual(0);
        expect(analyzerLocal.getComponentDrift()).assertEqual(0);
        expect(analyzerLocal.getDurationDrift()).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LONGTERM_0800
     * @tc.name testBackgroundForegroundRoundsStayStable
     * @tc.desc Verify ten real background to foreground rounds: page remains visible each round and first to last component drift stays within tolerance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBackgroundForegroundRoundsStayStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const rounds: number = STRESS_ROUNDS_LIFECYCLE;
        let visibleRounds: number = 0;
        for (let i = 0; i < rounds; i++) {
          const backgroundStart: number = Date.now();
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          const backgroundMs: number = measureElapsed(backgroundStart);
          const foregroundStart: number = Date.now();
          await doAbilityForeground();
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          const foregroundMs: number = measureElapsed(foregroundStart);
          const visible: boolean = await isIndexPageVisible(driver);
          if (stable && visible) {
            visibleRounds++;
          }
          const count: number = await pageComponentCount(driver);
          analyzer.add(new LifecycleRoundMetric(i + 1, foregroundMs, backgroundMs, count));
        }
        logInfo('lifecycle rounds visible: ' + visibleRounds);
        expect(analyzer.getRoundCount()).assertEqual(rounds);
        expect(visibleRounds).assertEqual(rounds);
        expect(analyzer.isMonotonicRoundSequence()).assertTrue();
        expect(analyzer.isComponentDriftStable()).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LONGTERM_0900
     * @tc.name testLifecycleForegroundBudgetPerRound
     * @tc.desc Verify each foreground round completes within the background switch budget and total rounds stay under the launch budget times rounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleForegroundBudgetPerRound', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const rounds: number = STRESS_ROUNDS_LIFECYCLE;
        let withinBudgetRounds: number = 0;
        let totalElapsed: number = 0;
        for (let i = 0; i < rounds; i++) {
          const startTime: number = Date.now();
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          const elapsed: number = measureElapsed(startTime);
          totalElapsed += elapsed;
          if (isWithinBudget(elapsed, TIMEOUT_BACKGROUND_SWITCH + TIMEOUT_PAGE_RENDER)) {
            withinBudgetRounds++;
          }
        }
        logInfo('lifecycle total elapsed: ' + totalElapsed);
        expect(withinBudgetRounds).assertEqual(rounds);
        expect(totalElapsed <= TIMEOUT_ABILITY_LAUNCH * rounds).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LONGTERM_1000
     * @tc.name testPageTextStableAfterLifecycleRounds
     * @tc.desc Verify page text stability across lifecycle rounds: the clicked message remains readable and component count stays above zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPageTextStableAfterLifecycleRounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await doAbilityForeground();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const clickedBefore: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        if (!clickedBefore) {
          await tapComponentByText(driver, PAGE_TEXT_INITIAL);
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
        }
        const roundCount: number = STRESS_ROUNDS_LIFECYCLE;
        for (let i = 0; i < roundCount; i++) {
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        }
        const textVisible: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        const count: number = await pageComponentCount(driver);
        expect(textVisible).assertTrue();
        expect(count >= 1).assertTrue();
      } finally {
        done();
      }
    });
  });
}
