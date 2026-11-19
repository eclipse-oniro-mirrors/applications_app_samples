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

import { describe, it, expect, beforeAll, beforeEach, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  logInfo,
  serializedDelay,
  resetDriver,
  isQueueBusy,
  launchEntryAbility,
  isIndexPageRendered,
  doAbilityForeground,
  doAbilityBackground,
  waitForIndexPageStable,
  isIndexPageVisible,
  checkTextContent,
  collectAllTexts,
  pageComponentCount,
  pressAndWait,
  pressBackAndWait,
  tapComponentByText,
  simulateTouch,
  triggerSerializedKey,
  measureElapsed,
  isWithinBudget,
  averageOf,
  maxOf,
  minOf,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_ENTER,
  KEY_TAB,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_ABILITY_LAUNCH,
  TIMEOUT_BACKGROUND_SWITCH,
  DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT,
  DELAY_AFTER_BACKGROUND,
  STRESS_ROUNDS_NAVIGATION,
  TOLERANCE_COMPONENT_COUNT,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

class StressStep {
  private round: number;
  private actionName: string;
  private elapsedMs: number;
  private success: boolean;

  constructor(round: number, actionName: string, elapsedMs: number, success: boolean) {
    this.round = round;
    this.actionName = actionName;
    this.elapsedMs = elapsedMs;
    this.success = success;
  }

  public getRound(): number {
    return this.round;
  }

  public getActionName(): string {
    return this.actionName;
  }

  public getElapsedMs(): number {
    return this.elapsedMs;
  }

  public isSuccess(): boolean {
    return this.success;
  }
}

class StressSession {
  private steps: StressStep[] = [];
  private failures: number = 0;

  public add(step: StressStep): void {
    this.steps.push(step);
    if (!step.isSuccess()) {
      this.failures++;
    }
  }

  public getStepCount(): number {
    return this.steps.length;
  }

  public getFailureCount(): number {
    return this.failures;
  }

  public clear(): void {
    this.steps = [];
    this.failures = 0;
  }

  public getDurations(): number[] {
    const durations: number[] = [];
    for (let i = 0; i < this.steps.length; i++) {
      durations.push(this.steps[i].getElapsedMs());
    }
    return durations;
  }

  public getTotalElapsed(): number {
    let total: number = 0;
    for (let i = 0; i < this.steps.length; i++) {
      total += this.steps[i].getElapsedMs();
    }
    return total;
  }

  public getAverageElapsed(): number {
    return averageOf(this.getDurations());
  }

  public getSlowestStep(): StressStep | null {
    if (this.steps.length === 0) {
      return null;
    }
    let slowest: StressStep = this.steps[0];
    for (let i = 1; i < this.steps.length; i++) {
      if (this.steps[i].getElapsedMs() > slowest.getElapsedMs()) {
        slowest = this.steps[i];
      }
    }
    return slowest;
  }

  public getStepsByRound(round: number): number {
    let count: number = 0;
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].getRound() === round) {
        count++;
      }
    }
    return count;
  }

  public isAllSuccessful(): boolean {
    return this.steps.length > 0 && this.failures === 0;
  }
}

class StressBudgetChecker {
  private budgetMs: number;

  constructor(budgetMs: number) {
    this.budgetMs = budgetMs;
  }

  public getBudgetMs(): number {
    return this.budgetMs;
  }

  public check(elapsedMs: number): boolean {
    return isWithinBudget(elapsedMs, this.budgetMs);
  }

  public countWithinBudget(session: StressSession): number {
    const durations: number[] = session.getDurations();
    let count: number = 0;
    for (let i = 0; i < durations.length; i++) {
      if (this.check(durations[i])) {
        count++;
      }
    }
    return count;
  }

  public getViolationCount(session: StressSession): number {
    return session.getStepCount() - this.countWithinBudget(session);
  }

  public getBudgetUtilization(session: StressSession): number {
    if (session.getStepCount() === 0 || this.budgetMs <= 0) {
      return 0;
    }
    return session.getAverageElapsed() / this.budgetMs;
  }
}

class MixedWorkloadPlanner {
  private rounds: number;

  constructor(rounds: number) {
    this.rounds = rounds;
  }

  public getRounds(): number {
    return this.rounds;
  }

  public planKeySequence(round: number): number {
    const keys: number[] = [KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN, KEY_TAB, KEY_ENTER];
    return keys[round % keys.length];
  }

  public planTouchPoint(round: number): number[] {
    const x: number = 120 + (round % 5) * 40;
    const y: number = 200 + (round % 3) * 60;
    return [x, y];
  }

  public shouldRelaunch(round: number): boolean {
    return round > 0 && round % 5 === 0;
  }

  public countPlannedSteps(): number {
    let count: number = 0;
    for (let i = 0; i < this.rounds; i++) {
      count += 3;
      if (this.shouldRelaunch(i)) {
        count++;
      }
    }
    return count;
  }

  public getLaunchRoundCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.rounds; i++) {
      if (this.shouldRelaunch(i)) {
        count++;
      }
    }
    return count;
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

export default function performanceStressTest(): void {
  describe('PerformanceStressTest', () => {
    let driver: Driver;
    let session: StressSession;

    beforeAll(async () => {
      driver = getDriver();
      session = new StressSession();
      resetDriver();
      const ready: boolean = await ensureIndexPage(driver);
      expect(ready).assertTrue();

      await ensureIndexPageInitial(driver);
    });

    beforeEach(async () => {
      const rendered: boolean = await isIndexPageRendered(driver);
      if (!rendered) {
        logInfo('beforeEach: index page absent, relaunching the entry ability');
        await launchEntryAbility();
      }
    })

    afterAll(async () => {
      session.clear();
      await doAbilityForeground();
      await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_PERFSTRESS_0100
     * @tc.name testEmptySessionStatistics
     * @tc.desc Verify empty stress session: zero steps, zero failures, zero total elapsed and no slowest step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEmptySessionStatistics', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: StressSession = new StressSession();
        expect(local.getStepCount()).assertEqual(0);
        expect(local.getFailureCount()).assertEqual(0);
        expect(local.getTotalElapsed()).assertEqual(0);
        expect(local.getAverageElapsed()).assertEqual(0);
        expect(local.getSlowestStep()).assertNull();
        expect(local.isAllSuccessful()).assertFalse();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_PERFSTRESS_0200
     * @tc.name testSessionRecordsFailures
     * @tc.desc Verify failure accounting: three recorded steps with one failed step produce failure count one and a false all successful flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionRecordsFailures', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: StressSession = new StressSession();
        local.add(new StressStep(1, 'key', 50, true));
        local.add(new StressStep(1, 'touch', 80, false));
        local.add(new StressStep(2, 'launch', 300, true));
        expect(local.getStepCount()).assertEqual(3);
        expect(local.getFailureCount()).assertEqual(1);
        expect(local.isAllSuccessful()).assertFalse();
        expect(local.getTotalElapsed()).assertEqual(430);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_PERFSTRESS_0300
     * @tc.name testSessionSlowestStepSelection
     * @tc.desc Verify slowest step selection: durations 50, 400 and 120 ms identify round two launch as the slowest step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionSlowestStepSelection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: StressSession = new StressSession();
        local.add(new StressStep(1, 'key', 50, true));
        local.add(new StressStep(2, 'launch', 400, true));
        local.add(new StressStep(2, 'touch', 120, true));
        const slowest: StressStep | null = local.getSlowestStep();
        expect(slowest !== null).assertTrue();
        if (slowest !== null) {
          expect(slowest.getActionName()).assertEqual('launch');
          expect(slowest.getElapsedMs()).assertEqual(400);
          expect(slowest.getRound()).assertEqual(2);
        }
        expect(local.getAverageElapsed()).assertEqual(190);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_PERFSTRESS_0400
     * @tc.name testSessionStepCountPerRound
     * @tc.desc Verify per round counting: two steps recorded for round one and one for round two are counted independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionStepCountPerRound', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: StressSession = new StressSession();
        local.add(new StressStep(1, 'key', 10, true));
        local.add(new StressStep(1, 'touch', 10, true));
        local.add(new StressStep(2, 'launch', 10, true));
        expect(local.getStepsByRound(1)).assertEqual(2);
        expect(local.getStepsByRound(2)).assertEqual(1);
        expect(local.getStepsByRound(3)).assertEqual(0);
        expect(local.isAllSuccessful()).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_PERFSTRESS_0500
     * @tc.name testBudgetCheckerBoundaries
     * @tc.desc Verify budget checker boundaries: elapsed equal to the 2000 ms budget passes and 2001 ms fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBudgetCheckerBoundaries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const checker: StressBudgetChecker = new StressBudgetChecker(TIMEOUT_ABILITY_LAUNCH);
        expect(checker.getBudgetMs()).assertEqual(2000);
        expect(checker.check(2000)).assertTrue();
        expect(checker.check(2001)).assertFalse();
        expect(checker.check(0)).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_PERFSTRESS_0600
     * @tc.name testBudgetCheckerCountsViolations
     * @tc.desc Verify budget violation counting: steps of 100, 2500 and 300 ms yield one violation and two within budget steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBudgetCheckerCountsViolations', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: StressSession = new StressSession();
        local.add(new StressStep(1, 'key', 100, true));
        local.add(new StressStep(1, 'launch', 2500, true));
        local.add(new StressStep(2, 'touch', 300, true));
        const checker: StressBudgetChecker = new StressBudgetChecker(TIMEOUT_ABILITY_LAUNCH);
        expect(checker.countWithinBudget(local)).assertEqual(2);
        expect(checker.getViolationCount(local)).assertEqual(1);
        expect(Math.abs(checker.getBudgetUtilization(local) - 2900 / 3 / 2000) <= 0.0001).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_PERFSTRESS_0700
     * @tc.name testBudgetCheckerEmptySession
     * @tc.desc Verify budget utilization on an empty session: no steps report zero utilization and zero violations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBudgetCheckerEmptySession', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: StressSession = new StressSession();
        const checker: StressBudgetChecker = new StressBudgetChecker(TIMEOUT_ABILITY_LAUNCH);
        expect(checker.getBudgetUtilization(local)).assertEqual(0);
        expect(checker.countWithinBudget(local)).assertEqual(0);
        expect(checker.getViolationCount(local)).assertEqual(0);
        const zeroChecker: StressBudgetChecker = new StressBudgetChecker(0);
        expect(zeroChecker.getBudgetUtilization(local)).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_PERFSTRESS_0800
     * @tc.name testPlannerKeySequenceCycles
     * @tc.desc Verify planned key sequence: consecutive rounds alternate left, right and up keys and wrap after six rounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPlannerKeySequenceCycles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const planner: MixedWorkloadPlanner = new MixedWorkloadPlanner(STRESS_ROUNDS_NAVIGATION);
        expect(planner.getRounds()).assertEqual(20);
        expect(planner.planKeySequence(0)).assertEqual(KEY_LEFT);
        expect(planner.planKeySequence(1)).assertEqual(KEY_RIGHT);
        expect(planner.planKeySequence(2)).assertEqual(KEY_UP);
        expect(planner.planKeySequence(3)).assertEqual(KEY_DOWN);
        expect(planner.planKeySequence(6)).assertEqual(KEY_LEFT);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_PERFSTRESS_0900
     * @tc.name testPlannerTouchPoints
     * @tc.desc Verify planned touch points: round zero maps to 120 by 200 and round one to 160 by 260
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPlannerTouchPoints', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const planner: MixedWorkloadPlanner = new MixedWorkloadPlanner(STRESS_ROUNDS_NAVIGATION);
        const firstPoint: number[] = planner.planTouchPoint(0);
        const secondPoint: number[] = planner.planTouchPoint(1);
        expect(firstPoint[0]).assertEqual(120);
        expect(firstPoint[1]).assertEqual(200);
        expect(secondPoint[0]).assertEqual(160);
        expect(secondPoint[1]).assertEqual(260);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_PERFSTRESS_1000
     * @tc.name testPlannerRelaunchSchedule
     * @tc.desc Verify relaunch schedule over twenty rounds: rounds five, ten and fifteen trigger a relaunch for three launches total
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPlannerRelaunchSchedule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const planner: MixedWorkloadPlanner = new MixedWorkloadPlanner(STRESS_ROUNDS_NAVIGATION);
        expect(planner.shouldRelaunch(0)).assertFalse();
        expect(planner.shouldRelaunch(5)).assertTrue();
        expect(planner.shouldRelaunch(10)).assertTrue();
        expect(planner.shouldRelaunch(19)).assertFalse();
        expect(planner.getLaunchRoundCount()).assertEqual(3);
        expect(planner.countPlannedSteps()).assertEqual(63);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_PERFSTRESS_1100
     * @tc.name testPlannerZeroRounds
     * @tc.desc Verify zero round planner: no planned steps and no launch rounds for an empty workload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPlannerZeroRounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const planner: MixedWorkloadPlanner = new MixedWorkloadPlanner(0);
        expect(planner.countPlannedSteps()).assertEqual(0);
        expect(planner.getLaunchRoundCount()).assertEqual(0);
        expect(planner.shouldRelaunch(0)).assertFalse();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_PERFSTRESS_1200
     * @tc.name testSingleKeyNavigationStaysResponsive
     * @tc.desc Verify a real key press on the Index page: the page remains visible and the round stays within the background switch budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSingleKeyNavigationStaysResponsive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const ready: boolean = await ensureIndexPage(driver);
        expect(ready).assertTrue();
        const startTime: number = Date.now();
        await triggerSerializedKey(driver, KEY_RIGHT);
        await serializedDelay(driver, DELAY_KEY_NAVIGATION);
        const elapsed: number = measureElapsed(startTime);
        session.add(new StressStep(1, 'single-key', elapsed, true));
        expect(isWithinBudget(elapsed, TIMEOUT_BACKGROUND_SWITCH)).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_PERFSTRESS_1300
     * @tc.name testTouchThenKeyKeepsPageReadable
     * @tc.desc Verify a touch plus key sequence: the touch event completes, the page text stays readable and no failure is recorded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTouchThenKeyKeepsPageReadable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const ready: boolean = await ensureIndexPage(driver);
        expect(ready).assertTrue();
        const touchStart: number = Date.now();
        await simulateTouch(driver, 160, 260);
        const touchElapsed: number = measureElapsed(touchStart);
        session.add(new StressStep(2, 'touch', touchElapsed, true));
        const keyStart: number = Date.now();
        await pressAndWait(driver, KEY_TAB, 1, DELAY_KEY_NAVIGATION);
        const keyElapsed: number = measureElapsed(keyStart);
        session.add(new StressStep(2, 'key', keyElapsed, true));
        expect(touchElapsed >= 0).assertTrue();
        expect(isWithinBudget(keyElapsed, TIMEOUT_BACKGROUND_SWITCH)).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_PERFSTRESS_1400
     * @tc.name testMixedNavigationStressRounds
     * @tc.desc Verify twenty mixed stress rounds of key, touch and text checks: every round records three successful steps and the page stays readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMixedNavigationStressRounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const ready: boolean = await ensureIndexPage(driver);
        expect(ready).assertTrue();
        session.clear();
        const planner: MixedWorkloadPlanner = new MixedWorkloadPlanner(STRESS_ROUNDS_NAVIGATION);
        let readableRounds: number = 0;
        for (let round = 0; round < planner.getRounds(); round++) {
          const keyStart: number = Date.now();
          await pressAndWait(driver, planner.planKeySequence(round), 1, DELAY_KEY_NAVIGATION);
          session.add(new StressStep(round + 1, 'key', measureElapsed(keyStart), true));
          const point: number[] = planner.planTouchPoint(round);
          const touchStart: number = Date.now();
          await simulateTouch(driver, point[0], point[1]);
          session.add(new StressStep(round + 1, 'touch', measureElapsed(touchStart), true));
          const checkStart: number = Date.now();
          const readable: boolean = await isIndexPageVisible(driver);
          session.add(new StressStep(round + 1, 'check', measureElapsed(checkStart), readable));
          if (readable) {
            readableRounds++;
          }
        }
        logInfo('mixed stress rounds readable: ' + readableRounds);
        expect(session.getStepCount()).assertEqual(planner.getRounds() * 3);
        expect(readableRounds).assertEqual(planner.getRounds());
        expect(session.isAllSuccessful()).assertTrue();
        expect(session.getAverageElapsed() <= TIMEOUT_ABILITY_LAUNCH).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_PERFSTRESS_1500
     * @tc.name testMixedStressWithRelaunchAlternation
     * @tc.desc Verify alternating navigation and relaunch rounds: configured relaunch rounds execute the launch and the page becomes stable afterwards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMixedStressWithRelaunchAlternation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const planner: MixedWorkloadPlanner = new MixedWorkloadPlanner(STRESS_ROUNDS_NAVIGATION);
        let launches: number = 0;
        let stableAfterLaunch: number = 0;
        for (let round = 0; round < planner.getRounds(); round++) {
          await pressAndWait(driver, planner.planKeySequence(round), 1, DELAY_KEY_NAVIGATION);
          if (planner.shouldRelaunch(round)) {
            const launchStart: number = Date.now();
            await launchEntryAbility();
            const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
            const launchElapsed: number = measureElapsed(launchStart);
            session.add(new StressStep(round + 1, 'launch', launchElapsed, stable));
            launches++;
            if (stable) {
              stableAfterLaunch++;
            }
            expect(isWithinBudget(launchElapsed, TIMEOUT_ABILITY_LAUNCH + TIMEOUT_PAGE_RENDER)).assertTrue();
          }
        }
        expect(launches).assertEqual(planner.getLaunchRoundCount());
        expect(stableAfterLaunch).assertEqual(launches);
        expect(session.getFailureCount()).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_PERFSTRESS_1600
     * @tc.name testStressRoundDurationsStayBounded
     * @tc.desc Verify bounded round durations: twenty key rounds each stay within the launch budget and the maximum does not exceed five times the average
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStressRoundDurationsStayBounded', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const local: StressSession = new StressSession();
        const planner: MixedWorkloadPlanner = new MixedWorkloadPlanner(STRESS_ROUNDS_NAVIGATION);
        for (let round = 0; round < 10; round++) {
          const startTime: number = Date.now();
          await pressAndWait(driver, planner.planKeySequence(round), 1, DELAY_KEY_NAVIGATION);
          const elapsed: number = measureElapsed(startTime);
          local.add(new StressStep(round + 1, 'key', elapsed, isWithinBudget(elapsed, TIMEOUT_ABILITY_LAUNCH)));
        }
        const durations: number[] = local.getDurations();
        logInfo('stress durations average: ' + local.getAverageElapsed());
        expect(local.getStepCount()).assertEqual(10);
        expect(maxOf(durations) <= TIMEOUT_ABILITY_LAUNCH).assertTrue();
        expect(minOf(durations) >= 0).assertTrue();
        expect(maxOf(durations) <= local.getAverageElapsed() * 5).assertTrue();
        expect(local.getFailureCount()).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_PERFSTRESS_1700
     * @tc.name testPageComponentCountStableUnderStress
     * @tc.desc Verify component count stability under ten key stress rounds: the final count stays within the shared tolerance of the baseline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPageComponentCountStableUnderStress', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const ready: boolean = await ensureIndexPage(driver);
        expect(ready).assertTrue();
        const baselineCount: number = await pageComponentCount(driver);
        expect(baselineCount >= 1).assertTrue();
        for (let round = 0; round < 10; round++) {
          await pressAndWait(driver, round % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
          await serializedDelay(driver, DELAY_TOUCH_EVENT);
        }
        const finalCount: number = await pageComponentCount(driver);
        logInfo('stress component baseline ' + baselineCount + ' final ' + finalCount);
        expect(Math.abs(finalCount - baselineCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_PERFSTRESS_1800
     * @tc.name testTextCollectionStableUnderStress
     * @tc.desc Verify text collection under stress: five rounds of text reads return a non empty list containing the initial or clicked message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTextCollectionStableUnderStress', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        let roundsWithText: number = 0;
        for (let round = 0; round < 5; round++) {
          await pressAndWait(driver, KEY_TAB, 1, DELAY_KEY_NAVIGATION);
          const texts: string[] = await collectAllTexts(driver);
          let matched: boolean = false;
          for (let i = 0; i < texts.length; i++) {
            if (texts[i] === PAGE_TEXT_INITIAL || texts[i] === PAGE_TEXT_CLICKED) {
              matched = true;
            }
          }
          if (matched) {
            roundsWithText++;
          }
        }
        expect(roundsWithText).assertEqual(5);
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_PERFSTRESS_1900
     * @tc.name testBackAndForegroundStressKeepsPage
     * @tc.desc Verify five background to foreground stress cycles: the page is stable each cycle and total elapsed stays within the switch budget times cycles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBackAndForegroundStressKeepsPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const cycles: number = 5;
        let stableCycles: number = 0;
        const cycleStart: number = Date.now();
        for (let i = 0; i < cycles; i++) {
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          if (stable) {
            stableCycles++;
          }
        }
        const totalElapsed: number = measureElapsed(cycleStart);
        logInfo('stress lifecycle total elapsed: ' + totalElapsed);
        expect(stableCycles).assertEqual(cycles);
        expect(totalElapsed <= TIMEOUT_ABILITY_LAUNCH * 2 * cycles).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_PERFSTRESS_2000
     * @tc.name testTapTextComponentUnderStress
     * @tc.desc Verify tapping the page text: tapping whichever message is visible succeeds and the clicked welcome message is visible afterwards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTapTextComponentUnderStress', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const ready: boolean = await ensureIndexPage(driver);
        expect(ready).assertTrue();
        const initialVisible: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
        const targetText: string = initialVisible ? PAGE_TEXT_INITIAL : PAGE_TEXT_CLICKED;
        const tapped: boolean = await tapComponentByText(driver, targetText);
        expect(tapped).assertTrue();
        const afterTap: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(afterTap).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_PERFSTRESS_2100
     * @tc.name testQueueIdleAfterStressRounds
     * @tc.desc Verify the serialized queue is idle after a stress burst: busy flag stays false once the submitted operations settle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testQueueIdleAfterStressRounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        for (let i = 0; i < 5; i++) {
          await triggerSerializedKey(driver, KEY_LEFT);
        }
        await serializedDelay(driver, DELAY_TOUCH_EVENT);
        expect(isQueueBusy()).assertFalse();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_PERFSTRESS_2200
     * @tc.name testBackKeyDoesNotCorruptQueue
     * @tc.desc Verify a back key burst keeps the queue consistent: the submission queue settles and the page remains queryable afterwards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBackKeyDoesNotCorruptQueue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await pressBackAndWait(driver);
        await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const count: number = await pageComponentCount(driver);
        expect(count >= 1).assertTrue();
        expect(isQueueBusy()).assertFalse();
      } finally {
        done();
      }
    });
  });
}
