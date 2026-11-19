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
  logError,
  serializedDelay,
  resetDriver,
  isQueueBusy,
  buildEntryWant,
  startAbilityByWant,
  launchEntryAbility,
  doAbilityForeground,
  doAbilityBackground,
  waitForIndexPageStable,
  isIndexPageVisible,
  checkTextContent,
  checkComponentExistsByKey,
  pageComponentCount,
  collectAllTexts,
  measureElapsed,
  isWithinBudget,
  averageOf,
  maxOf,
  minOf,
  getBundleName,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  INDEX_PAGE_TEXT_KEY,
  ENTRY_ABILITY_NAME,
  INDEX_PAGE_PATH,
  TIMEOUT_ABILITY_LAUNCH,
  TIMEOUT_PAGE_RENDER,
  DELAY_AFTER_LAUNCH,
  STRESS_ROUNDS_LAUNCH,
  TOLERANCE_COMPONENT_COUNT,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';
import Want from '@ohos.app.ability.Want';

class LaunchSample {
  private sequence: number;
  private startMs: number;
  private renderMs: number;
  private withinBudget: boolean;

  constructor(sequence: number, startMs: number, renderMs: number) {
    this.sequence = sequence;
    this.startMs = startMs;
    this.renderMs = renderMs;
    this.withinBudget = isWithinBudget(startMs, TIMEOUT_ABILITY_LAUNCH);
  }

  public getSequence(): number {
    return this.sequence;
  }

  public getStartMs(): number {
    return this.startMs;
  }

  public getRenderMs(): number {
    return this.renderMs;
  }

  public getTotalMs(): number {
    return this.startMs + this.renderMs;
  }

  public isWithinBudget(): boolean {
    return this.withinBudget;
  }

  public isFullyWithinBudget(): boolean {
    return isWithinBudget(this.getTotalMs(), TIMEOUT_ABILITY_LAUNCH + TIMEOUT_PAGE_RENDER);
  }
}

class LaunchSampleSet {
  private samples: LaunchSample[] = [];

  public add(sample: LaunchSample): void {
    this.samples.push(sample);
  }

  public clear(): void {
    this.samples = [];
  }

  public getCount(): number {
    return this.samples.length;
  }

  public getSamples(): LaunchSample[] {
    const result: LaunchSample[] = [];
    for (let i = 0; i < this.samples.length; i++) {
      result.push(this.samples[i]);
    }
    return result;
  }

  public getStartTimes(): number[] {
    const values: number[] = [];
    for (let i = 0; i < this.samples.length; i++) {
      values.push(this.samples[i].getStartMs());
    }
    return values;
  }

  public getRenderTimes(): number[] {
    const values: number[] = [];
    for (let i = 0; i < this.samples.length; i++) {
      values.push(this.samples[i].getRenderMs());
    }
    return values;
  }

  public getTotalTimes(): number[] {
    const values: number[] = [];
    for (let i = 0; i < this.samples.length; i++) {
      values.push(this.samples[i].getTotalMs());
    }
    return values;
  }

  public getAverageStart(): number {
    return averageOf(this.getStartTimes());
  }

  public getAverageTotal(): number {
    return averageOf(this.getTotalTimes());
  }

  public getMaxTotal(): number {
    return maxOf(this.getTotalTimes());
  }

  public getMinTotal(): number {
    return minOf(this.getTotalTimes());
  }

  public getWithinBudgetCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].isFullyWithinBudget()) {
        count++;
      }
    }
    return count;
  }

  public isAllWithinBudget(): boolean {
    return this.samples.length > 0 && this.getWithinBudgetCount() === this.samples.length;
  }

  public getSpread(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return this.getMaxTotal() - this.getMinTotal();
  }

  public getStartSpread(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return maxOf(this.getStartTimes()) - minOf(this.getStartTimes());
  }
}

class LaunchCounter {
  private launchAttempts: number = 0;
  private successfulLaunches: number = 0;
  private failedLaunches: number = 0;

  public recordAttempt(): number {
    this.launchAttempts++;
    return this.launchAttempts;
  }

  public recordSuccess(): void {
    this.successfulLaunches++;
  }

  public recordFailure(): void {
    this.failedLaunches++;
  }

  public getAttempts(): number {
    return this.launchAttempts;
  }

  public getSuccessful(): number {
    return this.successfulLaunches;
  }

  public getFailed(): number {
    return this.failedLaunches;
  }

  public getSuccessRate(): number {
    if (this.launchAttempts === 0) {
      return 0;
    }
    return this.successfulLaunches / this.launchAttempts;
  }

  public reset(): void {
    this.launchAttempts = 0;
    this.successfulLaunches = 0;
    this.failedLaunches = 0;
  }
}

class LaunchStageTimeline {
  private wantBuiltMs: number = 0;
  private startRequestedMs: number = 0;
  private pageStableMs: number = 0;

  public markWantBuilt(elapsed: number): void {
    this.wantBuiltMs = elapsed;
  }

  public markStartRequested(elapsed: number): void {
    this.startRequestedMs = elapsed;
  }

  public markPageStable(elapsed: number): void {
    this.pageStableMs = elapsed;
  }

  public getWantBuiltMs(): number {
    return this.wantBuiltMs;
  }

  public getStartRequestedMs(): number {
    return this.startRequestedMs;
  }

  public getPageStableMs(): number {
    return this.pageStableMs;
  }

  public getRequestPhaseMs(): number {
    return this.startRequestedMs - this.wantBuiltMs;
  }

  public getRenderPhaseMs(): number {
    return this.pageStableMs - this.startRequestedMs;
  }

  public isMonotonic(): boolean {
    return this.wantBuiltMs <= this.startRequestedMs && this.startRequestedMs <= this.pageStableMs;
  }

  public getDominantPhase(): string {
    if (this.getRenderPhaseMs() >= this.getRequestPhaseMs()) {
      return 'render';
    }
    return 'request';
  }
}

async function measureLaunchOnce(driver: Driver, counter: LaunchCounter): Promise<LaunchSample> {
  counter.recordAttempt();
  const startTime: number = Date.now();
  await launchEntryAbility();
  const startElapsed: number = measureElapsed(startTime);
  const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
  const totalElapsed: number = measureElapsed(startTime);
  if (stable) {
    counter.recordSuccess();
  } else {
    counter.recordFailure();
  }
  const renderElapsed: number = totalElapsed - startElapsed;
  return new LaunchSample(counter.getAttempts(), startElapsed, renderElapsed);
}

async function ensureIndexPage(driver: Driver): Promise<boolean> {
  const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
  if (stable) {
    return true;
  }
  await launchEntryAbility();
  return await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
}

export default function launchPerformanceTest(): void {
  describe('LaunchPerformanceTest', () => {
    let driver: Driver;
    let sampleSet: LaunchSampleSet;
    let counter: LaunchCounter;

    beforeAll(async () => {
      driver = getDriver();
      sampleSet = new LaunchSampleSet();
      counter = new LaunchCounter();
      resetDriver();
      const ready: boolean = await ensureIndexPage(driver);
      logInfo('launch performance warm up ready: ' + ready);
      expect(ready).assertTrue();

      await ensureIndexPageInitial(driver);
    });

    afterAll(async () => {
      sampleSet.clear();
      counter.reset();
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_0100
     * @tc.name testLaunchCounterInitialState
     * @tc.desc Verify launch counter initial state: zero attempts, zero successes, zero failures and zero success rate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLaunchCounterInitialState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: LaunchCounter = new LaunchCounter();
        expect(local.getAttempts()).assertEqual(0);
        expect(local.getSuccessful()).assertEqual(0);
        expect(local.getFailed()).assertEqual(0);
        expect(local.getSuccessRate()).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_0200
     * @tc.name testLaunchCounterIncrements
     * @tc.desc Verify attempt counting: three recorded attempts with two successes yield attempts 3, successes 2 and success rate two thirds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLaunchCounterIncrements', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: LaunchCounter = new LaunchCounter();
        expect(local.recordAttempt()).assertEqual(1);
        expect(local.recordAttempt()).assertEqual(2);
        expect(local.recordAttempt()).assertEqual(3);
        local.recordSuccess();
        local.recordSuccess();
        local.recordFailure();
        expect(local.getAttempts()).assertEqual(3);
        expect(local.getSuccessful()).assertEqual(2);
        expect(local.getFailed()).assertEqual(1);
        expect(Math.abs(local.getSuccessRate() - 2 / 3) <= 0.0001).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_0300
     * @tc.name testLaunchCounterReset
     * @tc.desc Verify counter reset: after two attempts and one success a reset returns every counter to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLaunchCounterReset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: LaunchCounter = new LaunchCounter();
        local.recordAttempt();
        local.recordSuccess();
        local.recordAttempt();
        local.reset();
        expect(local.getAttempts()).assertEqual(0);
        expect(local.getSuccessful()).assertEqual(0);
        expect(local.getSuccessRate()).assertEqual(0);
        expect(local.recordAttempt()).assertEqual(1);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_0400
     * @tc.name testSampleBudgetClassification
     * @tc.desc Verify sample budget classification at the launch budget boundary: start 2000 ms passes and 2001 ms fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSampleBudgetClassification', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const atLimit: LaunchSample = new LaunchSample(1, 2000, 100);
        const overLimit: LaunchSample = new LaunchSample(2, 2001, 100);
        expect(atLimit.isWithinBudget()).assertTrue();
        expect(overLimit.isWithinBudget()).assertFalse();
        expect(atLimit.getTotalMs()).assertEqual(2100);
        expect(atLimit.getSequence()).assertEqual(1);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_0500
     * @tc.name testSampleTotalBudgetCombinesPhases
     * @tc.desc Verify combined phase budget: start 1500 ms plus render 1500 ms exceeds the launch budget but stays within the launch plus render budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSampleTotalBudgetCombinesPhases', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const sample: LaunchSample = new LaunchSample(1, 1500, 1500);
        expect(sample.getTotalMs()).assertEqual(3000);
        expect(sample.isWithinBudget()).assertTrue();
        expect(isWithinBudget(sample.getTotalMs(), TIMEOUT_ABILITY_LAUNCH)).assertFalse();
        expect(sample.isFullyWithinBudget()).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_0600
     * @tc.name testSampleSetStatistics
     * @tc.desc Verify sample set statistics over two samples: average total 900 ms, max 1000, min 800 and spread 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSampleSetStatistics', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: LaunchSampleSet = new LaunchSampleSet();
        local.add(new LaunchSample(1, 500, 300));
        local.add(new LaunchSample(2, 600, 400));
        expect(local.getCount()).assertEqual(2);
        expect(local.getAverageTotal()).assertEqual(900);
        expect(local.getMaxTotal()).assertEqual(1000);
        expect(local.getMinTotal()).assertEqual(800);
        expect(local.getSpread()).assertEqual(200);
        expect(local.getAverageStart()).assertEqual(550);
        expect(local.getRenderTimes()[0]).assertEqual(300);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_0700
     * @tc.name testEmptySampleSetDefaults
     * @tc.desc Verify empty sample set defaults: zero samples report zero averages, zero spread and a false all within budget flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEmptySampleSetDefaults', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: LaunchSampleSet = new LaunchSampleSet();
        expect(local.getCount()).assertEqual(0);
        expect(local.getAverageTotal()).assertEqual(0);
        expect(local.getMaxTotal()).assertEqual(0);
        expect(local.getMinTotal()).assertEqual(0);
        expect(local.getSpread()).assertEqual(0);
        expect(local.isAllWithinBudget()).assertFalse();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_0800
     * @tc.name testSampleSetWithinBudgetCount
     * @tc.desc Verify within budget counting: two of three samples within the combined budget and the set is not fully within budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSampleSetWithinBudgetCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: LaunchSampleSet = new LaunchSampleSet();
        local.add(new LaunchSample(1, 1000, 500));
        local.add(new LaunchSample(2, 1800, 1000));
        local.add(new LaunchSample(3, 5000, 100));
        expect(local.getWithinBudgetCount()).assertEqual(2);
        expect(local.isAllWithinBudget()).assertFalse();
        expect(local.getSamples().length).assertEqual(3);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_0900
     * @tc.name testTimelinePhaseComputation
     * @tc.desc Verify timeline phases: marks at 10, 60 and 460 ms give a request phase of 50 ms, a render phase of 400 ms and render dominance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTimelinePhaseComputation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const timeline: LaunchStageTimeline = new LaunchStageTimeline();
        timeline.markWantBuilt(10);
        timeline.markStartRequested(60);
        timeline.markPageStable(460);
        expect(timeline.getWantBuiltMs()).assertEqual(10);
        expect(timeline.getStartRequestedMs()).assertEqual(60);
        expect(timeline.getPageStableMs()).assertEqual(460);
        expect(timeline.getRequestPhaseMs()).assertEqual(50);
        expect(timeline.getRenderPhaseMs()).assertEqual(400);
        expect(timeline.isMonotonic()).assertTrue();
        expect(timeline.getDominantPhase()).assertEqual('render');
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_1000
     * @tc.name testTimelineRequestDominates
     * @tc.desc Verify request phase dominance: marks at 0, 900 and 1000 ms make the request phase dominant and keep the timeline monotonic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTimelineRequestDominates', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const timeline: LaunchStageTimeline = new LaunchStageTimeline();
        timeline.markWantBuilt(0);
        timeline.markStartRequested(900);
        timeline.markPageStable(1000);
        expect(timeline.getRequestPhaseMs()).assertEqual(900);
        expect(timeline.getRenderPhaseMs()).assertEqual(100);
        expect(timeline.getDominantPhase()).assertEqual('request');
        expect(timeline.isMonotonic()).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_1100
     * @tc.name testTimelineNonMonotonicDetection
     * @tc.desc Verify non monotonic timeline detection: a page stable mark earlier than the request mark is reported as non monotonic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTimelineNonMonotonicDetection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const timeline: LaunchStageTimeline = new LaunchStageTimeline();
        timeline.markWantBuilt(100);
        timeline.markStartRequested(50);
        timeline.markPageStable(10);
        expect(timeline.isMonotonic()).assertFalse();
        expect(timeline.getRequestPhaseMs()).assertEqual(-50);
        expect(timeline.getRenderPhaseMs()).assertEqual(-40);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_1200
     * @tc.name testEntryWantFields
     * @tc.desc Verify the launch want: built want carries the resolved bundle name and the EntryAbility ability name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEntryWantFields', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const want: Want = buildEntryWant();
        expect(want.bundleName).assertEqual(getBundleName());
        expect(want.abilityName).assertEqual(ENTRY_ABILITY_NAME);
        expect(want.abilityName).assertEqual('EntryAbility');
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_1300
     * @tc.name testBundleNameConstant
     * @tc.desc Verify the resolved bundle name is non empty and matches the AbilityStage sample package
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBundleNameConstant', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const bundleName: string = getBundleName();
        expect(bundleName.length > 0).assertTrue();
        expect(bundleName).assertEqual('com.samples.abilitystage');
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_1400
     * @tc.name testSingleColdLaunchWithinBudget
     * @tc.desc Verify one real cold launch: the Index page becomes stable within the launch plus render budget and the counter increments to one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSingleColdLaunchWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const localCounter: LaunchCounter = new LaunchCounter();
        const sample: LaunchSample = await measureLaunchOnce(driver, localCounter);
        logInfo('cold launch total: ' + sample.getTotalMs());
        expect(sample.getSequence()).assertEqual(1);
        expect(localCounter.getAttempts()).assertEqual(1);
        expect(localCounter.getSuccessful()).assertEqual(1);
        expect(sample.isFullyWithinBudget()).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_1500
     * @tc.name testLaunchByWantReachesIndexPage
     * @tc.desc Verify launch through an explicit want: the Index page text and HelloWorld key are observable right after startup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLaunchByWantReachesIndexPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const startTime: number = Date.now();
        await startAbilityByWant(buildEntryWant());
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const elapsed: number = measureElapsed(startTime);
        expect(stable).assertTrue();
        expect(isWithinBudget(elapsed, TIMEOUT_ABILITY_LAUNCH + TIMEOUT_PAGE_RENDER)).assertTrue();
        const keyExists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        expect(keyExists).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_1600
     * @tc.name testLaunchPageTextMatchesExpected
     * @tc.desc Verify the launched page text: the collected texts contain either the initial or clicked message after startup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLaunchPageTextMatchesExpected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const ready: boolean = await ensureIndexPage(driver);
        expect(ready).assertTrue();
        const texts: string[] = await collectAllTexts(driver);
        let matchesExpected: boolean = false;
        for (let i = 0; i < texts.length; i++) {
          if (texts[i] === PAGE_TEXT_INITIAL || texts[i] === PAGE_TEXT_CLICKED) {
            matchesExpected = true;
          }
        }
        expect(texts.length >= 1).assertTrue();
        expect(matchesExpected).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_1700
     * @tc.name testMultiRoundLaunchAverage
     * @tc.desc Verify multi round launch sampling: five real launches record five samples, a positive average and an all within budget verdict
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMultiRoundLaunchAverage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        sampleSet.clear();
        counter.reset();
        const rounds: number = STRESS_ROUNDS_LAUNCH;
        for (let i = 0; i < rounds; i++) {
          const sample: LaunchSample = await measureLaunchOnce(driver, counter);
          sampleSet.add(sample);
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
        }
        const averageTotal: number = sampleSet.getAverageTotal();
        logInfo('launch average total: ' + averageTotal);
        expect(sampleSet.getCount()).assertEqual(rounds);
        expect(counter.getAttempts()).assertEqual(rounds);
        expect(counter.getSuccessful()).assertEqual(rounds);
        expect(averageTotal > 0).assertTrue();
        expect(averageTotal <= TIMEOUT_ABILITY_LAUNCH + TIMEOUT_PAGE_RENDER).assertTrue();
        expect(sampleSet.isAllWithinBudget()).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_1800
     * @tc.name testRepeatedLaunchCountIncrements
     * @tc.desc Verify launch count increments monotonically: three consecutive real launches report sequences one, two and three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeatedLaunchCountIncrements', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const localCounter: LaunchCounter = new LaunchCounter();
        const first: LaunchSample = await measureLaunchOnce(driver, localCounter);
        const second: LaunchSample = await measureLaunchOnce(driver, localCounter);
        const third: LaunchSample = await measureLaunchOnce(driver, localCounter);
        expect(first.getSequence()).assertEqual(1);
        expect(second.getSequence()).assertEqual(2);
        expect(third.getSequence()).assertEqual(3);
        expect(localCounter.getAttempts()).assertEqual(3);
        expect(localCounter.getSuccessful()).assertEqual(3);
        expect(localCounter.getSuccessRate()).assertEqual(1);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_1900
     * @tc.name testLaunchRenderPhasePositive
     * @tc.desc Verify the render phase of a real launch: the render duration is non negative and within the page render budget while start and total times are positive and ordered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLaunchRenderPhasePositive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const localCounter: LaunchCounter = new LaunchCounter();
        const sample: LaunchSample = await measureLaunchOnce(driver, localCounter);
        expect(sample.getRenderMs() >= 0).assertTrue();
        expect(isWithinBudget(sample.getRenderMs(), TIMEOUT_PAGE_RENDER)).assertTrue();
        expect(sample.getStartMs() > 0).assertTrue();
        expect(sample.getTotalMs() >= sample.getStartMs()).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_2000
     * @tc.name testWarmLaunchAfterBackground
     * @tc.desc Verify warm relaunch after a background round: the page returns within the launch budget and stays readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWarmLaunchAfterBackground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await doAbilityBackground();
        await serializedDelay(driver, DELAY_AFTER_LAUNCH);
        const startTime: number = Date.now();
        await doAbilityForeground();
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const elapsed: number = measureElapsed(startTime);
        expect(stable).assertTrue();
        expect(isWithinBudget(elapsed, TIMEOUT_ABILITY_LAUNCH + TIMEOUT_PAGE_RENDER)).assertTrue();
        const clickedVisible: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        const initialVisible: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        expect(clickedVisible || initialVisible).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_2100
     * @tc.name testLaunchSampleSpreadBounded
     * @tc.desc Verify launch timing consistency: the spread of three real launch totals is non negative and stays within twice the launch budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLaunchSampleSpreadBounded', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: LaunchSampleSet = new LaunchSampleSet();
        const localCounter: LaunchCounter = new LaunchCounter();
        for (let i = 0; i < 3; i++) {
          local.add(await measureLaunchOnce(driver, localCounter));
        }
        const spread: number = local.getSpread();
        const minTotal: number = local.getMinTotal();
        logInfo('launch spread ' + spread + ' min ' + minTotal);
        expect(local.getCount()).assertEqual(3);
        expect(spread >= 0).assertTrue();
        expect(spread).assertEqual(local.getMaxTotal() - minTotal);
        expect(spread <= TIMEOUT_ABILITY_LAUNCH * 2).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_2200
     * @tc.name testLaunchComponentCountBounded
     * @tc.desc Verify component count after a real launch: at least one component is present and the count differs from the pre launch baseline within tolerance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLaunchComponentCountBounded', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const ready: boolean = await ensureIndexPage(driver);
        expect(ready).assertTrue();
        const baselineCount: number = await pageComponentCount(driver);
        expect(baselineCount >= 1).assertTrue();
        await launchEntryAbility();
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const afterCount: number = await pageComponentCount(driver);
        expect(Math.abs(afterCount - baselineCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_2300
     * @tc.name testLaunchIndexPathConstant
     * @tc.desc Verify the configured index page path constant equals pages Index and the launch returns to that page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLaunchIndexPathConstant', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(INDEX_PAGE_PATH).assertEqual('pages/Index');
        const ready: boolean = await ensureIndexPage(driver);
        expect(ready).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
        expect(isQueueBusy()).assertFalse();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_2400
     * @tc.name testLaunchAverageBelowMaxBudget
     * @tc.desc Verify averaged launch samples stay below the maximum budget: two real launches yield an average no greater than the launch plus render budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLaunchAverageBelowMaxBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: LaunchSampleSet = new LaunchSampleSet();
        const localCounter: LaunchCounter = new LaunchCounter();
        local.add(await measureLaunchOnce(driver, localCounter));
        local.add(await measureLaunchOnce(driver, localCounter));
        const startAverage: number = local.getAverageStart();
        const averageTotal: number = local.getAverageTotal();
        logInfo('start average ' + startAverage + ' total average ' + averageTotal);
        expect(local.getCount()).assertEqual(2);
        expect(startAverage > 0).assertTrue();
        expect(isWithinBudget(averageTotal, TIMEOUT_ABILITY_LAUNCH + TIMEOUT_PAGE_RENDER)).assertTrue();
        expect(averageTotal >= startAverage).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_2500
     * @tc.name testLaunchFailureAccounting
     * @tc.desc Verify failed launch accounting: a counter with two successes and one failure reports a success rate of two thirds and one failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLaunchFailureAccounting', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: LaunchCounter = new LaunchCounter();
        local.recordAttempt();
        local.recordSuccess();
        local.recordAttempt();
        local.recordSuccess();
        local.recordAttempt();
        local.recordFailure();
        expect(local.getFailed()).assertEqual(1);
        expect(local.getSuccessRate()).assertEqual(2 / 3);
        expect(local.getSuccessful() + local.getFailed()).assertEqual(local.getAttempts());
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_2600
     * @tc.name testLaunchThenBackgroundThenIndexPage
     * @tc.desc Verify page availability across a full launch and background cycle: the page is stable after relaunch and readable after returning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLaunchThenBackgroundThenIndexPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        const stableAfterLaunch: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        await doAbilityBackground();
        await serializedDelay(driver, DELAY_AFTER_LAUNCH);
        await doAbilityForeground();
        const stableAfterReturn: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stableAfterLaunch).assertTrue();
        expect(stableAfterReturn).assertTrue();
        const count: number = await pageComponentCount(driver);
        expect(count >= 1).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_2700
     * @tc.name testLaunchSampleSetClearResets
     * @tc.desc Verify sample set reset: after two samples a clear returns the count to zero and all aggregates to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLaunchSampleSetClearResets', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: LaunchSampleSet = new LaunchSampleSet();
        local.add(new LaunchSample(1, 400, 300));
        local.add(new LaunchSample(2, 500, 400));
        expect(local.getCount()).assertEqual(2);
        local.clear();
        expect(local.getCount()).assertEqual(0);
        expect(local.getAverageTotal()).assertEqual(0);
        expect(local.getStartSpread()).assertEqual(0);
        expect(local.isAllWithinBudget()).assertFalse();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_2800
     * @tc.name testLaunchStartSpreadBounded
     * @tc.desc Verify start phase consistency after three real launches: the start spread is non negative and does not exceed three times the launch budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLaunchStartSpreadBounded', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: LaunchSampleSet = new LaunchSampleSet();
        const localCounter: LaunchCounter = new LaunchCounter();
        for (let i = 0; i < 3; i++) {
          local.add(await measureLaunchOnce(driver, localCounter));
        }
        const startSpread: number = local.getStartSpread();
        logInfo('launch start spread: ' + startSpread);
        expect(local.getCount()).assertEqual(3);
        expect(startSpread >= 0).assertTrue();
        expect(startSpread <= TIMEOUT_ABILITY_LAUNCH * 3).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_LAUNCHPERF_2900
     * @tc.name testColdWarmLaunchBothStable
     * @tc.desc Verify cold then warm launch: both launches bring the Index page to a stable state and log errors are not required for success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testColdWarmLaunchBothStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const localCounter: LaunchCounter = new LaunchCounter();
        const coldSample: LaunchSample = await measureLaunchOnce(driver, localCounter);
        await doAbilityBackground();
        await serializedDelay(driver, DELAY_AFTER_LAUNCH);
        const warmStart: number = Date.now();
        await doAbilityForeground();
        const warmStable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const warmElapsed: number = measureElapsed(warmStart);
        if (!warmStable) {
          logError('warm launch did not reach a stable index page');
        }
        expect(coldSample.isFullyWithinBudget()).assertTrue();
        expect(warmStable).assertTrue();
        expect(isWithinBudget(warmElapsed, TIMEOUT_ABILITY_LAUNCH + TIMEOUT_PAGE_RENDER)).assertTrue();
        expect(localCounter.getSuccessRate()).assertEqual(1);
      } finally {
        done();
      }
    });
  });
}
