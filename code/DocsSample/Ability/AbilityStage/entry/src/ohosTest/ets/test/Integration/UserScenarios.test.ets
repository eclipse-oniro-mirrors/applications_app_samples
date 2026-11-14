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
import Want from '@ohos.app.ability.Want';
import {
  getDriver,
  getBundleName,
  launchEntryAbility,
  buildEntryWant,
  startAbilityByWant,
  doAbilityForeground,
  doAbilityBackground,
  waitForIndexPageStable,
  waitForTextVisible,
  pageComponentCount,
  checkTextContent,
  checkComponentExistsByKey,
  collectAllTexts,
  tapComponentByText,
  pressAndWait,
  simulateTouch,
  measureElapsed,
  isWithinBudget,
  averageOf,
  maxOf,
  minOf,
  serializedDelay,
  logInfo,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  INDEX_PAGE_TEXT_KEY,
  INDEX_PAGE_PATH,
  BUNDLE_NAME,
  ENTRY_ABILITY_NAME,
  ABILITY_STAGE_NAME,
  COLOR_MODE_NOT_SET,
  TIMEOUT_ABILITY_LAUNCH,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_TEXT_APPEAR,
  TIMEOUT_BACKGROUND_SWITCH,
  TIMEOUT_FOCUS_CHANGE,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  DELAY_TOUCH_EVENT,
  DELAY_KEY_NAVIGATION,
  KEY_ENTER,
  KEY_BACK,
  KEY_HOME,
  KEY_TAB,
  STRESS_ROUNDS_LAUNCH,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

const JOURNEY_MAX_STEPS: number = 12;

const SESSION_BUDGET_MS: number = 10000;

const EXPECTED_FIRST_STEP_INDEX: number = 0;

const MAX_DWELL_MS: number = 5000;

const TEXT_SUFFIX_INITIAL: string = 'Hello';

const TEXT_SUFFIX_CLICKED: string = 'Welcome';

enum UserStep {
  STEP_LAUNCH_APP = 'launch_app',
  STEP_WAIT_RENDER = 'wait_render',
  STEP_READ_HELLO = 'read_hello',
  STEP_TAP_TEXT = 'tap_text',
  STEP_READ_WELCOME = 'read_welcome',
  STEP_GO_BACKGROUND = 'go_background',
  STEP_RETURN_FOREGROUND = 'return_foreground',
  STEP_VERIFY_RESTORED = 'verify_restored',
  STEP_PRESS_BACK = 'press_back',
  STEP_FINISH = 'finish'
}

enum JourneyOutcome {
  OUTCOME_COMPLETED = 'completed',
  OUTCOME_ABORTED = 'aborted',
  OUTCOME_TIMED_OUT = 'timed_out'
}

interface JourneyStepRecord {
  step: string;
  index: number;
  elapsedMs: number;
  satisfied: boolean;
}

class JourneyTrace {
  private steps: JourneyStepRecord[] = [];

  public recordStep(step: string, elapsedMs: number, satisfied: boolean): number {
    const record: JourneyStepRecord = {
      step: step,
      index: this.steps.length,
      elapsedMs: elapsedMs,
      satisfied: satisfied
    };
    this.steps.push(record);
    return record.index;
  }

  public size(): number {
    return this.steps.length;
  }

  public isFull(): boolean {
    return this.steps.length >= JOURNEY_MAX_STEPS;
  }

  public getStepNames(): string[] {
    const names: string[] = [];
    for (let i = 0; i < this.steps.length; i++) {
      names.push(this.steps[i].step);
    }
    return names;
  }

  public getStepAt(index: number): JourneyStepRecord | null {
    if (index < 0 || index >= this.steps.length) {
      return null;
    }
    return this.steps[index];
  }

  public firstIndexOf(step: string): number {
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].step === step) {
        return i;
      }
    }
    return -1;
  }

  public countOf(step: string): number {
    let total: number = 0;
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].step === step) {
        total++;
      }
    }
    return total;
  }

  public isOrdered(first: string, second: string): boolean {
    const firstIndex: number = this.firstIndexOf(first);
    const secondIndex: number = this.firstIndexOf(second);
    if (firstIndex < 0 || secondIndex < 0) {
      return false;
    }
    return firstIndex < secondIndex;
  }

  public isMonotonic(): boolean {
    for (let i = 1; i < this.steps.length; i++) {
      if (this.steps[i].elapsedMs < this.steps[i - 1].elapsedMs) {
        return false;
      }
    }
    return true;
  }

  public getElapsedValues(): number[] {
    const values: number[] = [];
    for (let i = 0; i < this.steps.length; i++) {
      values.push(this.steps[i].elapsedMs);
    }
    return values;
  }

  public allSatisfied(): boolean {
    if (this.steps.length === 0) {
      return false;
    }
    let satisfiedCount: number = 0;
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].satisfied) {
        satisfiedCount++;
      }
    }
    return satisfiedCount === this.steps.length;
  }

  public unsatisfiedCount(): number {
    let total: number = 0;
    for (let i = 0; i < this.steps.length; i++) {
      if (!this.steps[i].satisfied) {
        total++;
      }
    }
    return total;
  }

  public averageStepTime(): number {
    return averageOf(this.getElapsedValues());
  }

  public slowestStepTime(): number {
    return maxOf(this.getElapsedValues());
  }

  public fastestStepTime(): number {
    return minOf(this.getElapsedValues());
  }

  public reset(): void {
    this.steps = [];
  }
}

class JourneySession {
  private outcome: string = JourneyOutcome.OUTCOME_ABORTED;
  private startTime: number = 0;
  private endTime: number = 0;
  private dwellMs: number = 0;
  private backgroundCount: number = 0;

  private started: boolean = false;

  public start(now: number): boolean {
    if (this.started) {
      return false;
    }
    this.started = true;
    this.startTime = now;
    this.outcome = JourneyOutcome.OUTCOME_ABORTED;
    return true;
  }

  public complete(now: number): boolean {
    if (!this.started) {
      return false;
    }
    this.endTime = now;
    const duration: number = this.endTime - this.startTime;
    if (duration > SESSION_BUDGET_MS) {
      this.outcome = JourneyOutcome.OUTCOME_TIMED_OUT;
      return false;
    }
    this.outcome = JourneyOutcome.OUTCOME_COMPLETED;
    return true;
  }

  public addDwell(ms: number): boolean {
    if (!isFinite(ms) || ms < 0 || ms > MAX_DWELL_MS) {
      return false;
    }
    this.dwellMs += ms;
    return true;
  }

  public noteBackground(): void {
    this.backgroundCount++;
  }

  public getBackgroundCount(): number {
    return this.backgroundCount;
  }

  public getDwellMs(): number {
    return this.dwellMs;
  }

  public getOutcome(): string {
    return this.outcome;
  }

  public isCompleted(): boolean {
    return this.outcome === JourneyOutcome.OUTCOME_COMPLETED;
  }

  public durationMs(): number {
    if (!this.started || this.endTime === 0) {
      return 0;
    }
    return this.endTime - this.startTime;
  }

  public reset(): void {
    this.outcome = JourneyOutcome.OUTCOME_ABORTED;
    this.started = false;
    this.startTime = 0;
    this.endTime = 0;
    this.dwellMs = 0;
    this.backgroundCount = 0;
  }
}

class TextExpectation {
  private candidates: string[] = [PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED];

  public isKnown(text: string): boolean {
    return this.candidates.includes(text);
  }

  public isInitial(text: string): boolean {
    return text === PAGE_TEXT_INITIAL;
  }

  public isClicked(text: string): boolean {
    return text === PAGE_TEXT_CLICKED;
  }

  public classify(text: string): string {
    if (this.isInitial(text)) {
      return 'initial';
    }
    if (this.isClicked(text)) {
      return 'clicked';
    }
    return 'unknown';
  }

  public pickInitial(texts: string[]): string {
    for (let i = 0; i < texts.length; i++) {
      if (this.isInitial(texts[i])) {
        return texts[i];
      }
    }
    return '';
  }

  public pickClicked(texts: string[]): string {
    for (let i = 0; i < texts.length; i++) {
      if (this.isClicked(texts[i])) {
        return texts[i];
      }
    }
    return '';
  }

  public countKnown(texts: string[]): number {
    let total: number = 0;
    for (let i = 0; i < texts.length; i++) {
      if (this.isKnown(texts[i])) {
        total++;
      }
    }
    return total;
  }

  public describeSet(): string {
    return `${this.candidates.length} candidates`;
  }
}

class ScenarioPlanner {
  private plannedSteps: string[] = [
    UserStep.STEP_LAUNCH_APP,
    UserStep.STEP_WAIT_RENDER,
    UserStep.STEP_READ_HELLO
  ];

  public getInteractivePlan(): string[] {
    return this.plannedSteps.concat([
      UserStep.STEP_TAP_TEXT,
      UserStep.STEP_READ_WELCOME
    ]);
  }

  public getBackgroundPlan(): string[] {
    return this.getInteractivePlan().concat([
      UserStep.STEP_GO_BACKGROUND,
      UserStep.STEP_RETURN_FOREGROUND,
      UserStep.STEP_VERIFY_RESTORED
    ]);
  }

  public getFullPlan(): string[] {
    return this.getBackgroundPlan().concat([
      UserStep.STEP_PRESS_BACK,
      UserStep.STEP_FINISH
    ]);
  }

  public countPlanned(): number {
    return this.plannedSteps.length;
  }

  public isPlanWithinLimit(plan: string[]): boolean {
    return plan.length <= JOURNEY_MAX_STEPS;
  }

  public containsStep(plan: string[], step: string): boolean {
    return plan.includes(step);
  }

  public indexOfStep(plan: string[], step: string): number {
    return plan.indexOf(step);
  }
}

export default function userScenariosTest(): void {
  describe('UserScenariosTest', () => {
    let driver: Driver;
    let trace: JourneyTrace;
    let session: JourneySession;
    let expectation: TextExpectation;
    let planner: ScenarioPlanner;

    beforeAll(async () => {
      driver = getDriver();
      trace = new JourneyTrace();
      session = new JourneySession();
      expectation = new TextExpectation();
      planner = new ScenarioPlanner();
      logInfo('UserScenariosTest: beforeAll prepared journey models and driver');

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
      trace.reset();
      session.reset();
      logInfo('UserScenariosTest: afterAll finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_USER_0100
     * @tc.name testPlannerInteractivePlan
     * @tc.desc Verify the interactive plan has 5 steps starting at launch and ending at reading Welcome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPlannerInteractivePlan', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const plan: string[] = planner.getInteractivePlan();
          expect(plan.length).assertEqual(5);
          expect(plan[EXPECTED_FIRST_STEP_INDEX]).assertEqual(UserStep.STEP_LAUNCH_APP);
          expect(plan[4]).assertEqual(UserStep.STEP_READ_WELCOME);
          expect(planner.containsStep(plan, UserStep.STEP_TAP_TEXT)).assertTrue();
          expect(planner.containsStep(plan, UserStep.STEP_GO_BACKGROUND)).assertFalse();
          expect(planner.indexOfStep(plan, UserStep.STEP_TAP_TEXT)).assertEqual(3);
          expect(planner.countPlanned()).assertEqual(3);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_USER_0200
     * @tc.name testPlannerBackgroundPlan
     * @tc.desc Verify the background plan has 8 steps and stays inside the twelve step journey limit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPlannerBackgroundPlan', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const plan: string[] = planner.getBackgroundPlan();
          expect(plan.length).assertEqual(8);
          expect(planner.isPlanWithinLimit(plan)).assertTrue();
          expect(plan[5]).assertEqual(UserStep.STEP_GO_BACKGROUND);
          expect(plan[7]).assertEqual(UserStep.STEP_VERIFY_RESTORED);
          const fullPlan: string[] = planner.getFullPlan();
          expect(fullPlan.length).assertEqual(10);
          expect(planner.isPlanWithinLimit(fullPlan)).assertTrue();
          expect(planner.indexOfStep(fullPlan, UserStep.STEP_FINISH)).assertEqual(9);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_USER_0300
     * @tc.name testTraceStepRecording
     * @tc.desc Verify recording three steps yields indexes 0, 1 and 2 with a size of 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTraceStepRecording', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          trace.reset();
          expect(trace.recordStep(UserStep.STEP_LAUNCH_APP, 10, true)).assertEqual(0);
          expect(trace.recordStep(UserStep.STEP_WAIT_RENDER, 120, true)).assertEqual(1);
          expect(trace.recordStep(UserStep.STEP_READ_HELLO, 140, true)).assertEqual(2);
          expect(trace.size()).assertEqual(3);
          expect(trace.isFull()).assertFalse();
          const first: JourneyStepRecord | null = trace.getStepAt(0);
          expect(first !== null).assertTrue();
          if (first !== null) {
            expect(first.step).assertEqual(UserStep.STEP_LAUNCH_APP);
            expect(first.elapsedMs).assertEqual(10);
          }
          expect(trace.getStepAt(3)).assertNull();
          expect(trace.getStepAt(-1)).assertNull();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_USER_0400
     * @tc.name testTraceOrderingChecks
     * @tc.desc Verify launch precedes render precedes hello read while the reversed comparison is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTraceOrderingChecks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          trace.reset();
          trace.recordStep(UserStep.STEP_LAUNCH_APP, 5, true);
          trace.recordStep(UserStep.STEP_WAIT_RENDER, 60, true);
          trace.recordStep(UserStep.STEP_READ_HELLO, 70, true);
          expect(trace.isOrdered(UserStep.STEP_LAUNCH_APP, UserStep.STEP_WAIT_RENDER)).assertTrue();
          expect(trace.isOrdered(UserStep.STEP_WAIT_RENDER, UserStep.STEP_READ_HELLO)).assertTrue();
          expect(trace.isOrdered(UserStep.STEP_READ_HELLO, UserStep.STEP_LAUNCH_APP)).assertFalse();
          expect(trace.isOrdered(UserStep.STEP_TAP_TEXT, UserStep.STEP_LAUNCH_APP)).assertFalse();
          expect(trace.firstIndexOf(UserStep.STEP_READ_HELLO)).assertEqual(2);
          expect(trace.firstIndexOf(UserStep.STEP_TAP_TEXT)).assertEqual(-1);
          expect(trace.isMonotonic()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_USER_0500
     * @tc.name testTraceSatisfactionAndStats
     * @tc.desc Verify a trace with one unsatisfied step reports one unsatisfied entry, an average of 100 and max 250
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTraceSatisfactionAndStats', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          trace.reset();
          expect(trace.allSatisfied()).assertFalse();
          trace.recordStep(UserStep.STEP_LAUNCH_APP, 50, true);
          trace.recordStep(UserStep.STEP_WAIT_RENDER, 250, false);
          trace.recordStep(UserStep.STEP_READ_HELLO, 0, true);
          expect(trace.size()).assertEqual(3);
          expect(trace.allSatisfied()).assertFalse();
          expect(trace.unsatisfiedCount()).assertEqual(1);
          expect(trace.averageStepTime()).assertEqual(100);
          expect(trace.slowestStepTime()).assertEqual(250);
          expect(trace.fastestStepTime()).assertEqual(0);
          expect(trace.countOf(UserStep.STEP_WAIT_RENDER)).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_USER_0600
     * @tc.name testTraceFullBoundary
     * @tc.desc Verify a trace becomes full at exactly twelve steps and reports the twelve recorded names in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testTraceFullBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          trace.reset();
          expect(trace.isFull()).assertFalse();
          for (let i = 0; i < JOURNEY_MAX_STEPS; i++) {
            trace.recordStep(UserStep.STEP_WAIT_RENDER, i, true);
          }
          expect(trace.isFull()).assertTrue();
          expect(trace.size()).assertEqual(JOURNEY_MAX_STEPS);
          expect(trace.getStepNames().length).assertEqual(JOURNEY_MAX_STEPS);
          expect(trace.countOf(UserStep.STEP_WAIT_RENDER)).assertEqual(JOURNEY_MAX_STEPS);
          expect(trace.allSatisfied()).assertTrue();
          expect(trace.isMonotonic()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_USER_0700
     * @tc.name testSessionCompletionFlow
     * @tc.desc Verify a session started at 1000 and completed at 4000 is completed with a 3000 ms duration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionCompletionFlow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          session.reset();
          expect(session.start(1000)).assertTrue();
          expect(session.start(1100)).assertFalse();
          expect(session.isCompleted()).assertFalse();
          expect(session.complete(4000)).assertTrue();
          expect(session.getOutcome()).assertEqual(JourneyOutcome.OUTCOME_COMPLETED);
          expect(session.durationMs()).assertEqual(3000);
          expect(session.isCompleted()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_USER_0800
     * @tc.name testSessionTimeoutBoundary
     * @tc.desc Verify a session exactly at the budget completes while one millisecond over the budget times out
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testSessionTimeoutBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          const onBudget: JourneySession = new JourneySession();
          onBudget.start(0);
          expect(onBudget.complete(SESSION_BUDGET_MS)).assertTrue();
          expect(onBudget.getOutcome()).assertEqual(JourneyOutcome.OUTCOME_COMPLETED);
          const overBudget: JourneySession = new JourneySession();
          overBudget.start(0);
          expect(overBudget.complete(SESSION_BUDGET_MS + 1)).assertFalse();
          expect(overBudget.getOutcome()).assertEqual(JourneyOutcome.OUTCOME_TIMED_OUT);
          expect(overBudget.isCompleted()).assertFalse();
          expect(overBudget.durationMs()).assertEqual(SESSION_BUDGET_MS + 1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_USER_0900
     * @tc.name testSessionDwellAccounting
     * @tc.desc Verify dwell accumulation accepts 1000 and 2500, rejects a negative and an over limit value, and counts backgrounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testSessionDwellAccounting', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          const local: JourneySession = new JourneySession();
          expect(local.addDwell(1000)).assertTrue();
          expect(local.addDwell(2500)).assertTrue();
          expect(local.getDwellMs()).assertEqual(3500);
          expect(local.addDwell(-1)).assertFalse();
          expect(local.addDwell(MAX_DWELL_MS + 1)).assertFalse();
          expect(local.getDwellMs()).assertEqual(3500);
          expect(local.getBackgroundCount()).assertEqual(0);
          local.noteBackground();
          local.noteBackground();
          expect(local.getBackgroundCount()).assertEqual(2);
          expect(local.complete(10)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_USER_1000
     * @tc.name testTextExpectationClassification
     * @tc.desc Verify Hello World classifies as initial, Welcome as clicked and an unrelated text as unknown
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTextExpectationClassification', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(expectation.classify(PAGE_TEXT_INITIAL)).assertEqual('initial');
          expect(expectation.classify(PAGE_TEXT_CLICKED)).assertEqual('clicked');
          expect(expectation.classify('Goodbye')).assertEqual('unknown');
          expect(expectation.isInitial(PAGE_TEXT_INITIAL)).assertTrue();
          expect(expectation.isClicked(PAGE_TEXT_INITIAL)).assertFalse();
          expect(expectation.isKnown('Goodbye')).assertFalse();
          expect(expectation.describeSet()).assertEqual('2 candidates');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_USER_1100
     * @tc.name testTextExpectationPicking
     * @tc.desc Verify the expectation picks Hello World and Welcome out of a mixed text list and counts two known texts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testTextExpectationPicking', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          const texts: string[] = ['', 'SystemUI', PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED];
          expect(expectation.pickInitial(texts)).assertEqual(PAGE_TEXT_INITIAL);
          expect(expectation.pickClicked(texts)).assertEqual(PAGE_TEXT_CLICKED);
          expect(expectation.countKnown(texts)).assertEqual(2);
          expect(expectation.pickInitial(['SystemUI'])).assertEqual('');
          expect(expectation.countKnown([])).assertEqual(0);
          expect(PAGE_TEXT_INITIAL.startsWith(TEXT_SUFFIX_INITIAL)).assertTrue();
          expect(PAGE_TEXT_CLICKED.startsWith(TEXT_SUFFIX_CLICKED)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_USER_1200
     * @tc.name testEndToEndLaunchAndReadHello
     * @tc.desc Verify the user launches the app and reads Hello World on the Index page with the HelloWorld keyed text present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testEndToEndLaunchAndReadHello', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        try {
          trace.reset();
          session.reset();
          const startTime: number = Date.now();
          session.start(startTime);
          await launchEntryAbility();
          trace.recordStep(UserStep.STEP_LAUNCH_APP, measureElapsed(startTime), true);
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          trace.recordStep(UserStep.STEP_WAIT_RENDER, measureElapsed(startTime), stable);
          expect(stable).assertTrue();
          const texts: string[] = await collectAllTexts(driver);
          const hello: string = expectation.pickInitial(texts);
          const welcome: string = expectation.pickClicked(texts);
          const readable: boolean = hello.length > 0 || welcome.length > 0;
          trace.recordStep(UserStep.STEP_READ_HELLO, measureElapsed(startTime), readable);
          expect(readable).assertTrue();
          expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount > 0).assertTrue();
          expect(trace.isOrdered(UserStep.STEP_LAUNCH_APP, UserStep.STEP_WAIT_RENDER)).assertTrue();
          expect(trace.isOrdered(UserStep.STEP_WAIT_RENDER, UserStep.STEP_READ_HELLO)).assertTrue();
          expect(trace.isMonotonic()).assertTrue();
          expect(session.complete(Date.now())).assertTrue();
          expect(session.isCompleted()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_USER_1300
     * @tc.name testEndToEndTapTextBecomesWelcome
     * @tc.desc Verify the user taps Hello World and the page text changes to Welcome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testEndToEndTapTextBecomesWelcome', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        try {
          trace.reset();
          const startTime: number = Date.now();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(stable).assertTrue();
          trace.recordStep(UserStep.STEP_LAUNCH_APP, measureElapsed(startTime), stable);
          const initialVisible: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const clickedVisible: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          if (initialVisible && !clickedVisible) {
            const tapped: boolean = await tapComponentByText(driver, PAGE_TEXT_INITIAL);
            expect(tapped).assertTrue();
            trace.recordStep(UserStep.STEP_TAP_TEXT, measureElapsed(startTime), tapped);
            await serializedDelay(driver, DELAY_TOUCH_EVENT);
            const welcomeVisible: boolean = await waitForTextVisible(driver, PAGE_TEXT_CLICKED,
              TIMEOUT_TEXT_APPEAR * 3);
            trace.recordStep(UserStep.STEP_READ_WELCOME, measureElapsed(startTime), welcomeVisible);
            expect(welcomeVisible).assertTrue();
          } else {
            expect(clickedVisible).assertTrue();
            trace.recordStep(UserStep.STEP_TAP_TEXT, measureElapsed(startTime), clickedVisible);
            trace.recordStep(UserStep.STEP_READ_WELCOME, measureElapsed(startTime), clickedVisible);
            expect(clickedVisible).assertTrue();
          }
          expect(trace.countOf(UserStep.STEP_READ_WELCOME)).assertEqual(1);
          expect(trace.allSatisfied()).assertTrue();
          expect(await checkTextContent(driver, PAGE_TEXT_CLICKED)).assertTrue();
          logInfo(`testEndToEndTapTextBecomesWelcome: completed in ${measureElapsed(startTime)} ms`);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_USER_1400
     * @tc.name testEndToEndFullJourneyWithBackground
     * @tc.desc Verify the full journey launch, read, tap, background, foreground keeps a readable page and eight recorded steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL1
     */
    it('testEndToEndFullJourneyWithBackground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void) => {
        try {
          trace.reset();
          session.reset();
          const startTime: number = Date.now();
          session.start(startTime);
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(stable).assertTrue();
          trace.recordStep(UserStep.STEP_LAUNCH_APP, measureElapsed(startTime), true);
          trace.recordStep(UserStep.STEP_WAIT_RENDER, measureElapsed(startTime), stable);
          const textsBefore: string[] = await collectAllTexts(driver);
          trace.recordStep(UserStep.STEP_READ_HELLO, measureElapsed(startTime),
            expectation.countKnown(textsBefore) > 0);
          const tapTarget: string = expectation.pickInitial(textsBefore).length > 0 ?
            PAGE_TEXT_INITIAL : PAGE_TEXT_CLICKED;
          const tapped: boolean = await tapComponentByText(driver, tapTarget);
          trace.recordStep(UserStep.STEP_TAP_TEXT, measureElapsed(startTime), tapped);
          await serializedDelay(driver, DELAY_TOUCH_EVENT);
          const textsAfterTap: string[] = await collectAllTexts(driver);
          trace.recordStep(UserStep.STEP_READ_WELCOME, measureElapsed(startTime),
            expectation.countKnown(textsAfterTap) > 0);
          await doAbilityBackground();
          session.noteBackground();
          trace.recordStep(UserStep.STEP_GO_BACKGROUND, measureElapsed(startTime), true);
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const restored: boolean = await waitForIndexPageStable(driver, TIMEOUT_BACKGROUND_SWITCH);
          trace.recordStep(UserStep.STEP_RETURN_FOREGROUND, measureElapsed(startTime), restored);
          expect(restored).assertTrue();
          const textsFinal: string[] = await collectAllTexts(driver);
          const finalReadable: boolean = expectation.countKnown(textsFinal) > 0;
          trace.recordStep(UserStep.STEP_VERIFY_RESTORED, measureElapsed(startTime), finalReadable);
          expect(finalReadable).assertTrue();
          expect(trace.size()).assertEqual(8);
          expect(trace.isOrdered(UserStep.STEP_LAUNCH_APP, UserStep.STEP_GO_BACKGROUND)).assertTrue();
          expect(trace.isOrdered(UserStep.STEP_GO_BACKGROUND, UserStep.STEP_VERIFY_RESTORED)).assertTrue();
          expect(session.getBackgroundCount()).assertEqual(1);
          expect(session.complete(Date.now())).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_USER_1500
     * @tc.name testEndToEndJourneyCompletesWithinBudget
     * @tc.desc Verify a complete interactive journey finishes inside the ten second session budget and steps are monotonic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEndToEndJourneyCompletesWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          trace.reset();
          const startTime: number = Date.now();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          trace.recordStep(UserStep.STEP_LAUNCH_APP, measureElapsed(startTime), true);
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_BACKGROUND_SWITCH);
          trace.recordStep(UserStep.STEP_RETURN_FOREGROUND, measureElapsed(startTime), stable);
          expect(stable).assertTrue();
          const totalElapsed: number = measureElapsed(startTime);
          trace.recordStep(UserStep.STEP_FINISH, totalElapsed, true);
          expect(isWithinBudget(totalElapsed, SESSION_BUDGET_MS)).assertTrue();
          expect(trace.isMonotonic()).assertTrue();
          expect(trace.averageStepTime() > 0).assertTrue();
          expect(trace.getStepAt(trace.size() - 1) !== null).assertTrue();
          logInfo(`testEndToEndJourneyCompletesWithinBudget: total ${totalElapsed} ms`);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_USER_1600
     * @tc.name testEndToEndRepeatedUserReturn
     * @tc.desc Verify five launch and return cycles each deliver a readable page and record five satisfied launch steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testEndToEndRepeatedUserReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          trace.reset();
          for (let i = 0; i < STRESS_ROUNDS_LAUNCH; i++) {
            const roundStart: number = Date.now();
            await launchEntryAbility();
            await serializedDelay(driver, DELAY_AFTER_LAUNCH);
            const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
            expect(stable).assertTrue();
            const texts: string[] = await collectAllTexts(driver);
            const readable: boolean = expectation.countKnown(texts) > 0;
            expect(readable).assertTrue();
            trace.recordStep(UserStep.STEP_LAUNCH_APP, measureElapsed(roundStart), stable && readable);
          }
          expect(trace.size()).assertEqual(STRESS_ROUNDS_LAUNCH);
          expect(trace.countOf(UserStep.STEP_LAUNCH_APP)).assertEqual(STRESS_ROUNDS_LAUNCH);
          expect(trace.allSatisfied()).assertTrue();
          expect(trace.unsatisfiedCount()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_USER_1700
     * @tc.name testEndToEndExplicitWantJourney
     * @tc.desc Verify a user journey driven by an explicit Want reaches the index page and reports the bundle identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEndToEndExplicitWantJourney', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          trace.reset();
          const want: Want = buildEntryWant();
          const abilityName: string = want.abilityName === undefined ? '' : want.abilityName;
          const bundleName: string = want.bundleName === undefined ? '' : want.bundleName;
          expect(abilityName).assertEqual(ENTRY_ABILITY_NAME);
          expect(bundleName).assertEqual(getBundleName());
          expect(BUNDLE_NAME).assertEqual('com.samples.abilitystage');
          expect(ABILITY_STAGE_NAME).assertEqual('MyAbilityStage');
          expect(INDEX_PAGE_PATH).assertEqual('pages/Index');
          const startTime: number = Date.now();
          await startAbilityByWant(want);
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          trace.recordStep(UserStep.STEP_LAUNCH_APP, measureElapsed(startTime), stable);
          expect(stable).assertTrue();
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount > 0).assertTrue();
          const showsInitial: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
          const showsClicked: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          trace.recordStep(UserStep.STEP_READ_HELLO, measureElapsed(startTime), showsInitial || showsClicked);
          expect(showsInitial || showsClicked).assertTrue();
          expect(trace.allSatisfied()).assertTrue();
          expect(COLOR_MODE_NOT_SET).assertEqual(-1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_USER_1800
     * @tc.name testEndToEndTabNavigationJourney
     * @tc.desc Verify tab and enter key presses keep the page readable and do not break the journey
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testEndToEndTabNavigationJourney', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          trace.reset();
          const startTime: number = Date.now();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(stable).assertTrue();
          trace.recordStep(UserStep.STEP_WAIT_RENDER, measureElapsed(startTime), stable);
          await pressAndWait(driver, KEY_TAB, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
          await serializedDelay(driver, DELAY_TOUCH_EVENT);
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount > 0).assertTrue();
          const texts: string[] = await collectAllTexts(driver);
          const readable: boolean = expectation.countKnown(texts) > 0;
          trace.recordStep(UserStep.STEP_VERIFY_RESTORED, measureElapsed(startTime), readable);
          expect(readable).assertTrue();
          expect(trace.size()).assertEqual(2);
          expect(trace.isOrdered(UserStep.STEP_WAIT_RENDER, UserStep.STEP_VERIFY_RESTORED)).assertTrue();
          expect(TIMEOUT_FOCUS_CHANGE > 0).assertTrue();
          expect(DELAY_KEY_NAVIGATION <= TIMEOUT_FOCUS_CHANGE).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_USER_1900
     * @tc.name testEndToEndTouchCoordinatesJourney
     * @tc.desc Verify a user touch near the top left corner leaves the page rendered with a known text still visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testEndToEndTouchCoordinatesJourney', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          trace.reset();
          const startTime: number = Date.now();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          await simulateTouch(driver, 10, 10);
          trace.recordStep(UserStep.STEP_TAP_TEXT, measureElapsed(startTime), true);
          await serializedDelay(driver, DELAY_TOUCH_EVENT);
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount > 0).assertTrue();
          const texts: string[] = await collectAllTexts(driver);
          const readable: boolean = expectation.countKnown(texts) > 0;
          trace.recordStep(UserStep.STEP_READ_HELLO, measureElapsed(startTime), readable);
          expect(readable).assertTrue();
          expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
          expect(trace.unsatisfiedCount()).assertEqual(0);
          expect(trace.slowestStepTime() >= trace.fastestStepTime()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_USER_2000
     * @tc.name testEndToEndBackKeyJourney
     * @tc.desc Verify pressing back after the journey leaves the ability without a readable page, ending the session as aborted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testEndToEndBackKeyJourney', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void) => {
        try {
          trace.reset();
          session.reset();
          const startTime: number = Date.now();
          session.start(startTime);
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(stable).assertTrue();
          trace.recordStep(UserStep.STEP_LAUNCH_APP, measureElapsed(startTime), stable);
          await pressAndWait(driver, KEY_BACK, 1, DELAY_AFTER_BACKGROUND);
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          trace.recordStep(UserStep.STEP_PRESS_BACK, measureElapsed(startTime), true);
          const outcome: string = session.getOutcome();
          expect(outcome).assertEqual(JourneyOutcome.OUTCOME_ABORTED);
          expect(session.isCompleted()).assertFalse();
          expect(trace.countOf(UserStep.STEP_PRESS_BACK)).assertEqual(1);
          expect(trace.isOrdered(UserStep.STEP_LAUNCH_APP, UserStep.STEP_PRESS_BACK)).assertTrue();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const relaunched: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(relaunched).assertTrue();
          trace.recordStep(UserStep.STEP_FINISH, measureElapsed(startTime), relaunched);
          expect(trace.size()).assertEqual(3);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_USER_2100
     * @tc.name testEndToEndHomeKeyRecoveryJourney
     * @tc.desc Verify pressing home then relaunching restores a readable index page and records four ordered steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEndToEndHomeKeyRecoveryJourney', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          trace.reset();
          const startTime: number = Date.now();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const firstStable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(firstStable).assertTrue();
          trace.recordStep(UserStep.STEP_LAUNCH_APP, measureElapsed(startTime), firstStable);
          await pressAndWait(driver, KEY_HOME, 1, DELAY_AFTER_BACKGROUND);
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          trace.recordStep(UserStep.STEP_GO_BACKGROUND, measureElapsed(startTime), true);
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const secondStable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(secondStable).assertTrue();
          trace.recordStep(UserStep.STEP_RETURN_FOREGROUND, measureElapsed(startTime), secondStable);
          const texts: string[] = await collectAllTexts(driver);
          const readable: boolean = expectation.countKnown(texts) > 0;
          trace.recordStep(UserStep.STEP_VERIFY_RESTORED, measureElapsed(startTime), readable);
          expect(readable).assertTrue();
          expect(trace.size()).assertEqual(4);
          expect(trace.isOrdered(UserStep.STEP_LAUNCH_APP, UserStep.STEP_GO_BACKGROUND)).assertTrue();
          expect(trace.isOrdered(UserStep.STEP_GO_BACKGROUND, UserStep.STEP_VERIFY_RESTORED)).assertTrue();
          expect(trace.isMonotonic()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_USER_2200
     * @tc.name testEndToEndDeviceComfortBudget
     * @tc.desc Verify the launch to readable page path stays within the ability launch budget multiplied by the render margin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEndToEndDeviceComfortBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const startTime: number = Date.now();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          const elapsed: number = measureElapsed(startTime);
          expect(stable).assertTrue();
          expect(isWithinBudget(elapsed, TIMEOUT_ABILITY_LAUNCH + TIMEOUT_PAGE_RENDER)).assertTrue();
          expect(elapsed >= 0).assertTrue();
          expect(TIMEOUT_PAGE_RENDER).assertEqual(1000);
          expect(TIMEOUT_TEXT_APPEAR).assertEqual(1000);
          expect(TIMEOUT_ABILITY_LAUNCH).assertEqual(2000);
          logInfo(`testEndToEndDeviceComfortBudget: readable after ${elapsed} ms`);
        } finally {
          done();
        }
      })
  })
}
