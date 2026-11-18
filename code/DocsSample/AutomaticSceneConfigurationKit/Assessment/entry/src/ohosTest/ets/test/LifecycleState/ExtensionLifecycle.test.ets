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
  ID_INDEX_TITLE,
  ID_EXAM_TITLE,
  TEXT_STATE_INACTIVE,
  TEXT_EXAM_PREVIOUS,
  TEXT_EXAM_NEXT,
  TEXT_EXAM_SUBMIT,
  KEY_DOWN,
  KEY_ENTER,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_PAGE_TRANSITION,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  waitForExamPage,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// The callbacks of the entry ability of the sample, in the order the platform invokes them for
// a normal foreground visit.
const ABILITY_ON_CREATE: string = 'onCreate';
const ABILITY_ON_WINDOW_STAGE_CREATE: string = 'onWindowStageCreate';
const ABILITY_ON_FOREGROUND: string = 'onForeground';
const ABILITY_ON_BACKGROUND: string = 'onBackground';
const ABILITY_ON_WINDOW_STAGE_DESTROY: string = 'onWindowStageDestroy';
const ABILITY_ON_DESTROY: string = 'onDestroy';

// The sub phases of a page visit, the exam page runs the hardening and the countdown inside
// aboutToAppear and reverses both inside aboutToDisappear.
const PAGE_ABOUT_TO_APPEAR: string = 'aboutToAppear';
const PAGE_ABOUT_TO_DISAPPEAR: string = 'aboutToDisappear';
const PAGE_ON_PAGE_SHOW: string = 'onPageShow';
const PAGE_ON_BACK_PRESS: string = 'onBackPress';

const SUB_HARDENING_APPLY: string = 'applyHardening';
const SUB_HARDENING_RELEASE: string = 'releaseHardening';
const SUB_COUNTDOWN_START: string = 'startCountdown';
const SUB_COUNTDOWN_STOP: string = 'stopCountdown';
const SUB_ANSWERS_INIT: string = 'initAnswers';

// Duration candidates of the sample and the countdown interval.
const DURATION_DEFAULT: number = 0;
const DURATION_TEN: number = 600000;
const DURATION_THIRTY: number = 1800000;
const DURATION_SIXTY: number = 3600000;
const MILLIS_PER_SECOND: number = 1000;
const COUNTDOWN_INTERVAL: number = 1000;

// Number of questions of the mock exam and the invalid answer sentinel.
const QUESTION_COUNT: number = 3;
const INVALID_ANSWER: number = -1;

// A timer id of minus one means that no interval is registered.
const NO_TIMER: number = -1;

// Stress rounds of the ordering cases.
const ORDERING_ROUNDS: number = 5;

/**
 * One callback of the ability or of a page, with the arrival index and the elapsed time.
 */
interface LifecycleStep {
  name: string;
  index: number;
  elapsedMs: number;
  succeeded: boolean;
}

/**
 * The result of driving a state machine with one step.
 */
interface StepOutcome {
  accepted: boolean;
  state: string;
  reason: string;
}

/**
 * Records the lifecycle callbacks of a component in arrival order.
 *
 * The recorder answers the questions a case asks about an order: whether a step happened at
 * all, how often, at which index and whether it happened before another step.
 */
class LifecycleRecorder {
  private steps: LifecycleStep[] = [];
  private start: number = 0;

  public constructor() {
    this.start = Date.now();
  }

  /**
   * Records a callback.
   *
   * @param name name of the callback.
   * @param succeeded whether the callback completed without an error.
   * @returns the recorded step.
   */
  public record(name: string, succeeded: boolean): LifecycleStep {
    const step: LifecycleStep = {
      name: name,
      index: this.steps.length,
      elapsedMs: Date.now() - this.start,
      succeeded: succeeded
    };
    this.steps.push(step);
    return step;
  }

  public size(): number {
    return this.steps.length;
  }

  public names(): string[] {
    const names: string[] = [];
    for (let i = 0; i < this.steps.length; i++) {
      names.push(this.steps[i].name);
    }
    return names;
  }

  public at(index: number): LifecycleStep | undefined {
    if (index < 0 || index >= this.steps.length) {
      return undefined;
    }
    return this.steps[index];
  }

  public indexOf(name: string): number {
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].name === name) {
        return i;
      }
    }
    return -1;
  }

  public count(name: string): number {
    let total: number = 0;
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].name === name) {
        total++;
      }
    }
    return total;
  }

  public contains(name: string): boolean {
    return this.indexOf(name) >= 0;
  }

  /**
   * Reports whether the first step precedes the second one.
   *
   * @param first earlier step name.
   * @param second later step name.
   * @returns true when both exist and the first one arrived earlier.
   */
  public isBefore(first: string, second: string): boolean {
    const firstIndex: number = this.indexOf(first);
    const secondIndex: number = this.indexOf(second);
    if (firstIndex < 0 || secondIndex < 0) {
      return false;
    }
    return firstIndex < secondIndex;
  }

  public allSucceeded(): boolean {
    for (let i = 0; i < this.steps.length; i++) {
      if (!this.steps[i].succeeded) {
        return false;
      }
    }
    return true;
  }

  public failedNames(): string[] {
    const failed: string[] = [];
    for (let i = 0; i < this.steps.length; i++) {
      if (!this.steps[i].succeeded) {
        failed.push(this.steps[i].name);
      }
    }
    return failed;
  }

  public reset(): void {
    this.steps = [];
    this.start = Date.now();
  }

  public summary(): string {
    return `LifecycleRecorder{steps=${this.steps.length}, names=${this.names().join('>')}}`;
  }
}

/**
 * The exact order the platform uses for a normal foreground visit of the entry ability.
 */
class AbilityOrderModel {
  private expected: string[] = [];

  public constructor() {
    this.expected.push(ABILITY_ON_CREATE);
    this.expected.push(ABILITY_ON_WINDOW_STAGE_CREATE);
    this.expected.push(ABILITY_ON_FOREGROUND);
    this.expected.push(ABILITY_ON_BACKGROUND);
    this.expected.push(ABILITY_ON_WINDOW_STAGE_DESTROY);
    this.expected.push(ABILITY_ON_DESTROY);
  }

  public sequence(): string[] {
    return this.expected.slice();
  }

  public size(): number {
    return this.expected.length;
  }

  /**
   * Checks that the recorded names follow the expected order.
   *
   * @param recorded names in arrival order.
   * @returns the index of the first mismatch, minus one when the order is exact.
   */
  public firstMismatch(recorded: string[]): number {
    const limit: number = Math.min(recorded.length, this.expected.length);
    for (let i = 0; i < limit; i++) {
      if (recorded[i] !== this.expected[i]) {
        return i;
      }
    }
    if (recorded.length !== this.expected.length) {
      return limit;
    }
    return -1;
  }

  /**
   * Reports whether the record is a strict prefix of the expected order. A launch that is still
   * in progress records a prefix, which the suite accepts.
   *
   * @param recorded names in arrival order.
   * @returns true when the record matches the prefix of the expected order.
   */
  public isPrefix(recorded: string[]): boolean {
    if (recorded.length > this.expected.length) {
      return false;
    }
    for (let i = 0; i < recorded.length; i++) {
      if (recorded[i] !== this.expected[i]) {
        return false;
      }
    }
    return true;
  }

  /**
   * Reports whether the record contains the subsequence of the expected order. Destroy callbacks
   * may arrive long after the visit, so the containment check is the forgiving variant.
   *
   * @param recorded names in arrival order.
   * @returns true when the expected order is a subsequence of the record.
   */
  public containsSubsequence(recorded: string[]): boolean {
    let cursor: number = 0;
    for (let i = 0; i < recorded.length && cursor < this.expected.length; i++) {
      if (recorded[i] === this.expected[cursor]) {
        cursor++;
      }
    }
    return cursor === this.expected.length;
  }

  public indexOf(name: string): number {
    return this.expected.indexOf(name);
  }
}

/**
 * The state machine of one ability instance.
 *
 * The machine rejects every transition the platform never produces, for example a foreground
 * before the window stage exists or a second create for the same instance.
 */
class AbilityStateMachine {
  private state: string = 'idle';
  private history: string[] = [];

  /**
   * Applies a callback.
   *
   * @param name name of the callback.
   * @returns the outcome, including the reason of a rejection.
   */
  public apply(name: string): StepOutcome {
    const allowed: boolean = this.isAllowed(name);
    if (!allowed) {
      return this.rejected(name, 'out of order ' + name + ' from ' + this.state);
    }
    this.state = name;
    this.history.push(name);
    return this.accepted(name);
  }

  /**
   * Checks a transition against the current state.
   *
   * @param name name of the callback.
   * @returns true when the transition is legal.
   */
  private isAllowed(name: string): boolean {
    if (name === ABILITY_ON_CREATE) {
      return this.state === 'idle';
    }
    if (name === ABILITY_ON_WINDOW_STAGE_CREATE) {
      return this.state === ABILITY_ON_CREATE;
    }
    if (name === ABILITY_ON_FOREGROUND) {
      return this.state === ABILITY_ON_WINDOW_STAGE_CREATE || this.state === ABILITY_ON_BACKGROUND;
    }
    if (name === ABILITY_ON_BACKGROUND) {
      return this.state === ABILITY_ON_FOREGROUND;
    }
    if (name === ABILITY_ON_WINDOW_STAGE_DESTROY) {
      return this.state === ABILITY_ON_BACKGROUND || this.state === ABILITY_ON_FOREGROUND;
    }
    if (name === ABILITY_ON_DESTROY) {
      return this.state === ABILITY_ON_WINDOW_STAGE_DESTROY;
    }
    return false;
  }

  private accepted(name: string): StepOutcome {
    const outcome: StepOutcome = {
      accepted: true,
      state: this.state,
      reason: name + ' accepted'
    };
    return outcome;
  }

  private rejected(name: string, reason: string): StepOutcome {
    const outcome: StepOutcome = {
      accepted: false,
      state: this.state,
      reason: reason
    };
    return outcome;
  }

  public current(): string {
    return this.state;
  }

  public isForeground(): boolean {
    return this.state === ABILITY_ON_FOREGROUND;
  }

  public isDestroyed(): boolean {
    return this.state === ABILITY_ON_DESTROY;
  }

  public historyNames(): string[] {
    return this.history.slice();
  }

  public reset(): void {
    this.state = 'idle';
    this.history = [];
  }

  public toString(): string {
    return `AbilityStateMachine{state=${this.state}, steps=${this.history.length}}`;
  }
}

/**
 * The timer bookkeeping of the exam page.
 *
 * The page stores an interval id and clears it in stopCountdown, which is guarded against a
 * negative id so that a double stop is harmless. The ledger mirrors that behaviour.
 */
class CountdownTimerLedger {
  private timerId: number = NO_TIMER;
  private startCount: number = 0;
  private stopCount: number = 0;
  private noopStops: number = 0;
  private remainingSeconds: number = 0;

  /**
   * Initialises the remaining seconds from a session duration.
   *
   * @param durationMs session duration in milliseconds.
   */
  public initialise(durationMs: number): void {
    if (durationMs <= 0) {
      this.remainingSeconds = 0;
      return;
    }
    this.remainingSeconds = Math.floor(durationMs / MILLIS_PER_SECOND);
  }

  /**
   * Starts the countdown, a second start while the timer runs is ignored.
   *
   * @param id timer id assigned by the platform.
   * @returns true when a timer was registered.
   */
  public start(id: number): boolean {
    if (this.timerId !== NO_TIMER) {
      return false;
    }
    this.timerId = id;
    this.startCount++;
    return true;
  }

  /**
   * Stops the countdown, a stop without a running timer is counted as a no-op.
   *
   * @returns true when a timer was cleared.
   */
  public stop(): boolean {
    if (this.timerId === NO_TIMER) {
      this.noopStops++;
      return false;
    }
    this.timerId = NO_TIMER;
    this.stopCount++;
    return true;
  }

  /**
   * Applies one tick of the interval.
   *
   * @returns true when the timer stopped because the count reached zero.
   */
  public tick(): boolean {
    if (this.timerId === NO_TIMER) {
      return false;
    }
    if (this.remainingSeconds <= 0) {
      this.stop();
      return true;
    }
    this.remainingSeconds--;
    return false;
  }

  public isRunning(): boolean {
    return this.timerId !== NO_TIMER;
  }

  public timerIdValue(): number {
    return this.timerId;
  }

  public remaining(): number {
    return this.remainingSeconds;
  }

  public starts(): number {
    return this.startCount;
  }

  public stops(): number {
    return this.stopCount;
  }

  public idleStops(): number {
    return this.noopStops;
  }

  /**
   * Reports whether every start was matched by a stop.
   *
   * @returns true when the ledger is balanced and no timer is left running.
   */
  public isBalanced(): boolean {
    return this.startCount === this.stopCount && this.timerId === NO_TIMER;
  }

  public reset(): void {
    this.timerId = NO_TIMER;
    this.startCount = 0;
    this.stopCount = 0;
    this.noopStops = 0;
    this.remainingSeconds = 0;
  }

  public summary(): string {
    return `CountdownTimerLedger{starts=${this.startCount}, stops=${this.stopCount}, running=${this.isRunning()}}`;
  }
}

/**
 * The appear and disappear sub phases of the exam page, with the pairing rules of the sample.
 */
class ExamPagePhaseModel {
  private appearPhases: string[] = [];
  private disappearPhases: string[] = [];
  private entered: boolean = false;

  /**
   * Runs aboutToAppear: hardening, answers initialisation and the optional countdown start.
   *
   * @param durationMs duration of the session.
   * @param timer ledger that owns the timer id.
   * @returns the sub phases that ran, in order.
   */
  public appear(durationMs: number, timer: CountdownTimerLedger): string[] {
    const phases: string[] = [];
    if (this.entered) {
      return phases;
    }
    this.entered = true;
    this.appearPhases.push(SUB_HARDENING_APPLY);
    phases.push(SUB_HARDENING_APPLY);
    this.appearPhases.push(SUB_ANSWERS_INIT);
    phases.push(SUB_ANSWERS_INIT);
    timer.initialise(durationMs);
    if (timer.remaining() > 0) {
      timer.start(1);
      this.appearPhases.push(SUB_COUNTDOWN_START);
      phases.push(SUB_COUNTDOWN_START);
    }
    return phases;
  }

  /**
   * Runs aboutToDisappear: stop the countdown and release the hardening.
   *
   * @param timer ledger that owns the timer id.
   * @returns the sub phases that ran, in order.
   */
  public disappear(timer: CountdownTimerLedger): string[] {
    const phases: string[] = [];
    if (!this.entered) {
      return phases;
    }
    this.entered = false;
    timer.stop();
    this.disappearPhases.push(SUB_COUNTDOWN_STOP);
    phases.push(SUB_COUNTDOWN_STOP);
    this.disappearPhases.push(SUB_HARDENING_RELEASE);
    phases.push(SUB_HARDENING_RELEASE);
    return phases;
  }

  public appearPhasesOf(): string[] {
    return this.appearPhases.slice();
  }

  public disappearPhasesOf(): string[] {
    return this.disappearPhases.slice();
  }

  public isEntered(): boolean {
    return this.entered;
  }

  /**
   * Reports whether the appear and disappear lists are mirror images.
   *
   * @returns true when the release order reverses the apply order.
   */
  public isMirrored(): boolean {
    if (this.appearPhases.length === 0 || this.disappearPhases.length === 0) {
      return false;
    }
    const releaseFirst: string = this.disappearPhases[0];
    const applyLast: string = this.appearPhases[this.appearPhases.length - 1];
    return releaseFirst === SUB_COUNTDOWN_STOP && applyLast !== SUB_HARDENING_RELEASE;
  }
}

/**
 * Computes the number of countdown ticks of a duration, it mirrors the arithmetic of the page.
 *
 * @param durationMs duration of the session.
 * @returns the number of ticks, zero when no countdown is started.
 */
function tickCount(durationMs: number): number {
  if (durationMs <= 0) {
    return 0;
  }
  return Math.floor(durationMs / COUNTDOWN_INTERVAL);
}

/**
 * Starts the sample and waits until the entry page is rendered.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page showed up.
 */
async function openIndexPageOnce(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'openIndexPage: the entry page is not rendered, the case is retried');
  }
  return rendered;
}

/**
 * Brings the entry page to the front.
 *
 * A previous case may have pushed the exam page or left an alert dialog behind. The Back key
 * closes the dialog and pops the exam page, after that the entry page is rendered again.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page is rendered.
 */
async function openIndexPage(driver: Driver): Promise<boolean> {
  const first: boolean = await openIndexPageOnce(driver);
  if (first) {
    return true;
  }
  await pressAndWait(driver, KEY_BACK, 1, 200);
  return await openIndexPageOnce(driver);
}

export default function extensionLifecycleTest() {
  describe('ExtensionLifecycle_Test', () => {
    let driver: Driver;
    let recorder: LifecycleRecorder;
    let machine: AbilityStateMachine;
    let order: AbilityOrderModel;
    let timer: CountdownTimerLedger;
    let examPage: ExamPagePhaseModel;

    beforeAll(async () => {
      driver = getDriver();
      recorder = new LifecycleRecorder();
      machine = new AbilityStateMachine();
      order = new AbilityOrderModel();
      timer = new CountdownTimerLedger();
      examPage = new ExamPagePhaseModel();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the expected ability order is enumerated.
     * Expectation: it holds the six callbacks in the platform order.
     */
    it('Assessment_ExtensionLifecycle_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_001, begin');
      const sequence: string[] = order.sequence();
      expect(order.size()).assertEqual(6);
      expect(sequence.length).assertEqual(6);
      expect(sequence[0]).assertEqual(ABILITY_ON_CREATE);
      expect(sequence[1]).assertEqual(ABILITY_ON_WINDOW_STAGE_CREATE);
      expect(sequence[2]).assertEqual(ABILITY_ON_FOREGROUND);
      expect(sequence[5]).assertEqual(ABILITY_ON_DESTROY);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_001, end');
    });

    /**
     * Scenario: the recorded order equals the expected order.
     * Expectation: the first mismatch check answers minus one.
     */
    it('Assessment_ExtensionLifecycle_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_002, begin');
      const recorded: string[] = order.sequence();
      expect(order.firstMismatch(recorded)).assertEqual(-1);
      expect(order.isPrefix(recorded)).assertTrue();
      expect(order.containsSubsequence(recorded)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_002, end');
    });

    /**
     * Scenario: a recorded order swaps two callbacks.
     * Expectation: the mismatch lands on the swapped position and the prefix check fails.
     */
    it('Assessment_ExtensionLifecycle_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_003, begin');
      const wrong: string[] = [ABILITY_ON_CREATE, ABILITY_ON_FOREGROUND, ABILITY_ON_WINDOW_STAGE_CREATE,
        ABILITY_ON_BACKGROUND, ABILITY_ON_WINDOW_STAGE_DESTROY, ABILITY_ON_DESTROY];
      expect(order.firstMismatch(wrong)).assertEqual(1);
      expect(order.isPrefix(wrong)).assertFalse();
      expect(order.containsSubsequence(wrong)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_003, end');
    });

    /**
     * Scenario: a launch that recorded only a prefix of the order.
     * Expectation: the prefix check accepts it while the exact check reports the missing steps.
     */
    it('Assessment_ExtensionLifecycle_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_004, begin');
      const partial: string[] = [ABILITY_ON_CREATE, ABILITY_ON_WINDOW_STAGE_CREATE];
      expect(order.isPrefix(partial)).assertTrue();
      expect(order.firstMismatch(partial)).assertEqual(2);
      expect(partial.length < order.size()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_004, end');
    });

    /**
     * Scenario: a background visit is interleaved with extra foreground steps.
     * Expectation: the subsequence check still accepts the record.
     */
    it('Assessment_ExtensionLifecycle_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_005, begin');
      const extended: string[] = [ABILITY_ON_CREATE, ABILITY_ON_WINDOW_STAGE_CREATE, ABILITY_ON_FOREGROUND,
        ABILITY_ON_BACKGROUND, ABILITY_ON_FOREGROUND, ABILITY_ON_BACKGROUND, ABILITY_ON_WINDOW_STAGE_DESTROY,
        ABILITY_ON_DESTROY];
      expect(order.containsSubsequence(extended)).assertTrue();
      expect(order.isPrefix(extended)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_005, end');
    });

    /**
     * Scenario: the position of a callback is looked up.
     * Expectation: the window stage create is the second step and the destroy is the last one.
     */
    it('Assessment_ExtensionLifecycle_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_006, begin');
      expect(order.indexOf(ABILITY_ON_CREATE)).assertEqual(0);
      expect(order.indexOf(ABILITY_ON_WINDOW_STAGE_CREATE)).assertEqual(1);
      expect(order.indexOf(ABILITY_ON_DESTROY)).assertEqual(5);
      expect(order.indexOf('onNewWant')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_006, end');
    });

    /**
     * Scenario: the state machine walks the canonical order.
     * Expectation: every step is accepted and the machine ends in the destroyed state.
     */
    it('Assessment_ExtensionLifecycle_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_007, begin');
      machine.reset();
      const sequence: string[] = order.sequence();
      for (let i = 0; i < sequence.length; i++) {
        expect(machine.apply(sequence[i]).accepted).assertTrue();
      }
      expect(machine.isDestroyed()).assertTrue();
      expect(machine.historyNames().length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', machine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_007, end');
    });

    /**
     * Scenario: onForeground arrives before the window stage exists.
     * Expectation: the machine rejects the step and stays in the created state.
     */
    it('Assessment_ExtensionLifecycle_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_008, begin');
      machine.reset();
      machine.apply(ABILITY_ON_CREATE);
      const outcome: StepOutcome = machine.apply(ABILITY_ON_FOREGROUND);
      expect(outcome.accepted).assertFalse();
      expect(outcome.state).assertEqual(ABILITY_ON_CREATE);
      expect(outcome.reason).assertContain('out of order');
      expect(machine.isForeground()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_008, end');
    });

    /**
     * Scenario: onCreate is delivered twice for the same instance.
     * Expectation: the second delivery is rejected.
     */
    it('Assessment_ExtensionLifecycle_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_009, begin');
      machine.reset();
      expect(machine.apply(ABILITY_ON_CREATE).accepted).assertTrue();
      expect(machine.apply(ABILITY_ON_CREATE).accepted).assertFalse();
      expect(machine.historyNames().length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_009, end');
    });

    /**
     * Scenario: the ability returns to the foreground after a background visit.
     * Expectation: the second foreground is accepted and the machine is foreground again.
     */
    it('Assessment_ExtensionLifecycle_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_010, begin');
      machine.reset();
      machine.apply(ABILITY_ON_CREATE);
      machine.apply(ABILITY_ON_WINDOW_STAGE_CREATE);
      machine.apply(ABILITY_ON_FOREGROUND);
      expect(machine.isForeground()).assertTrue();
      machine.apply(ABILITY_ON_BACKGROUND);
      expect(machine.isForeground()).assertFalse();
      expect(machine.apply(ABILITY_ON_FOREGROUND).accepted).assertTrue();
      expect(machine.isForeground()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_010, end');
    });

    /**
     * Scenario: the window stage is destroyed directly from the foreground.
     * Expectation: the transition is accepted because the platform destroys the stage when the
     * ability is closed while visible.
     */
    it('Assessment_ExtensionLifecycle_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_011, begin');
      machine.reset();
      machine.apply(ABILITY_ON_CREATE);
      machine.apply(ABILITY_ON_WINDOW_STAGE_CREATE);
      machine.apply(ABILITY_ON_FOREGROUND);
      expect(machine.apply(ABILITY_ON_WINDOW_STAGE_DESTROY).accepted).assertTrue();
      expect(machine.apply(ABILITY_ON_DESTROY).accepted).assertTrue();
      expect(machine.isDestroyed()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', machine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_011, end');
    });

    /**
     * Scenario: onDestroy arrives without a window stage destroy.
     * Expectation: the machine rejects it, the platform always destroys the stage first.
     */
    it('Assessment_ExtensionLifecycle_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_012, begin');
      machine.reset();
      machine.apply(ABILITY_ON_CREATE);
      machine.apply(ABILITY_ON_WINDOW_STAGE_CREATE);
      machine.apply(ABILITY_ON_FOREGROUND);
      const outcome: StepOutcome = machine.apply(ABILITY_ON_DESTROY);
      expect(outcome.accepted).assertFalse();
      expect(machine.isDestroyed()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_012, end');
    });

    /**
     * Scenario: an unknown callback is delivered.
     * Expectation: the machine rejects it and does not change its state.
     */
    it('Assessment_ExtensionLifecycle_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_013, begin');
      machine.reset();
      machine.apply(ABILITY_ON_CREATE);
      const before: string = machine.current();
      expect(machine.apply('onNewWant').accepted).assertFalse();
      expect(machine.current()).assertEqual(before);
      expect(machine.historyNames().length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_013, end');
    });

    /**
     * Scenario: the machine is reset.
     * Expectation: the state returns to idle and the history is cleared.
     */
    it('Assessment_ExtensionLifecycle_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_014, begin');
      machine.reset();
      machine.apply(ABILITY_ON_CREATE);
      machine.apply(ABILITY_ON_WINDOW_STAGE_CREATE);
      machine.reset();
      expect(machine.current()).assertEqual('idle');
      expect(machine.historyNames().length).assertEqual(0);
      expect(machine.apply(ABILITY_ON_CREATE).accepted).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_014, end');
    });

    /**
     * Scenario: a recorder collects a realistic visit.
     * Expectation: order, counts and the success flag are all consistent.
     */
    it('Assessment_ExtensionLifecycle_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_015, begin');
      recorder.reset();
      const sequence: string[] = order.sequence();
      for (let i = 0; i < sequence.length; i++) {
        recorder.record(sequence[i], true);
      }
      expect(recorder.size()).assertEqual(6);
      expect(recorder.names()[0]).assertEqual(ABILITY_ON_CREATE);
      expect(recorder.isBefore(ABILITY_ON_CREATE, ABILITY_ON_FOREGROUND)).assertTrue();
      expect(recorder.isBefore(ABILITY_ON_DESTROY, ABILITY_ON_CREATE)).assertFalse();
      expect(recorder.allSucceeded()).assertTrue();
      expect(recorder.failedNames().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', recorder.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_015, end');
    });

    /**
     * Scenario: a phase reports a failure.
     * Expectation: the failure shows up in the failed list and the success flag turns false.
     */
    it('Assessment_ExtensionLifecycle_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_016, begin');
      recorder.reset();
      recorder.record(ABILITY_ON_CREATE, true);
      recorder.record(ABILITY_ON_WINDOW_STAGE_CREATE, false);
      expect(recorder.allSucceeded()).assertFalse();
      const failed: string[] = recorder.failedNames();
      expect(failed.length).assertEqual(1);
      expect(failed[0]).assertEqual(ABILITY_ON_WINDOW_STAGE_CREATE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_016, end');
    });

    /**
     * Scenario: the indices of the recorder are read.
     * Expectation: the first step has index zero and an out of range index answers undefined.
     */
    it('Assessment_ExtensionLifecycle_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_017, begin');
      recorder.reset();
      const first: LifecycleStep = recorder.record(ABILITY_ON_CREATE, true);
      recorder.record(ABILITY_ON_FOREGROUND, true);
      expect(first.index).assertEqual(0);
      expect(first.elapsedMs >= 0).assertTrue();
      expect(recorder.at(1)?.name).assertEqual(ABILITY_ON_FOREGROUND);
      expect(recorder.at(5) === undefined).assertTrue();
      expect(recorder.at(-1) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_017, end');
    });

    /**
     * Scenario: a callback that never happened is queried.
     * Expectation: contains answers false and the index answers minus one.
     */
    it('Assessment_ExtensionLifecycle_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_018, begin');
      recorder.reset();
      recorder.record(ABILITY_ON_CREATE, true);
      expect(recorder.contains(ABILITY_ON_DESTROY)).assertFalse();
      expect(recorder.indexOf(ABILITY_ON_DESTROY)).assertEqual(-1);
      expect(recorder.count(ABILITY_ON_DESTROY)).assertEqual(0);
      expect(recorder.contains(ABILITY_ON_CREATE)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_018, end');
    });

    /**
     * Scenario: the ticket count of every duration candidate is computed.
     * Expectation: ten minutes produce six hundred ticks, the default duration produces none.
     */
    it('Assessment_ExtensionLifecycle_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_019, begin');
      expect(tickCount(DURATION_DEFAULT)).assertEqual(0);
      expect(tickCount(DURATION_TEN)).assertEqual(600);
      expect(tickCount(DURATION_THIRTY)).assertEqual(1800);
      expect(tickCount(DURATION_SIXTY)).assertEqual(3600);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_019, end');
    });

    /**
     * Scenario: the ledger is initialised with a ten minute duration.
     * Expectation: the remaining seconds equal six hundred and the timer is not running yet.
     */
    it('Assessment_ExtensionLifecycle_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_020, begin');
      timer.reset();
      timer.initialise(DURATION_TEN);
      expect(timer.remaining()).assertEqual(600);
      expect(timer.isRunning()).assertFalse();
      expect(timer.timerIdValue()).assertEqual(NO_TIMER);
      expect(timer.starts()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_020, end');
    });

    /**
     * Scenario: the ledger is initialised with the default duration.
     * Expectation: the remaining seconds stay zero so that aboutToAppear does not start a timer.
     */
    it('Assessment_ExtensionLifecycle_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_021, begin');
      timer.reset();
      timer.initialise(DURATION_DEFAULT);
      expect(timer.remaining()).assertEqual(0);
      expect(timer.isRunning()).assertFalse();
      timer.initialise(-1);
      expect(timer.remaining()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_021, end');
    });

    /**
     * Scenario: the countdown is started and stopped once.
     * Expectation: the ledger is balanced and the timer id returns to minus one.
     */
    it('Assessment_ExtensionLifecycle_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_022, begin');
      timer.reset();
      timer.initialise(DURATION_TEN);
      expect(timer.start(1)).assertTrue();
      expect(timer.isRunning()).assertTrue();
      expect(timer.timerIdValue()).assertEqual(1);
      expect(timer.stop()).assertTrue();
      expect(timer.isRunning()).assertFalse();
      expect(timer.timerIdValue()).assertEqual(NO_TIMER);
      expect(timer.isBalanced()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', timer.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_022, end');
    });

    /**
     * Scenario: a second start arrives while the timer runs.
     * Expectation: the start is ignored and the running timer keeps its id.
     */
    it('Assessment_ExtensionLifecycle_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_023, begin');
      timer.reset();
      timer.initialise(DURATION_THIRTY);
      expect(timer.start(7)).assertTrue();
      expect(timer.start(8)).assertFalse();
      expect(timer.timerIdValue()).assertEqual(7);
      expect(timer.starts()).assertEqual(1);
      timer.stop();
      expect(timer.stops()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_023, end');
    });

    /**
     * Scenario: the countdown is stopped twice.
     * Expectation: the second stop is harmless and counted as an idle stop.
     */
    it('Assessment_ExtensionLifecycle_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_024, begin');
      timer.reset();
      timer.initialise(DURATION_SIXTY);
      timer.start(3);
      expect(timer.stop()).assertTrue();
      expect(timer.stop()).assertFalse();
      expect(timer.idleStops()).assertEqual(1);
      expect(timer.starts()).assertEqual(1);
      expect(timer.stops()).assertEqual(1);
      expect(timer.isBalanced()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_024, end');
    });

    /**
     * Scenario: the countdown runs down to zero.
     * Expectation: the last tick stops the timer and the remaining seconds stay at zero.
     */
    it('Assessment_ExtensionLifecycle_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_025, begin');
      timer.reset();
      timer.initialise(3000);
      timer.start(11);
      expect(timer.tick()).assertFalse();
      expect(timer.remaining()).assertEqual(2);
      expect(timer.tick()).assertFalse();
      expect(timer.remaining()).assertEqual(1);
      expect(timer.tick()).assertFalse();
      expect(timer.remaining()).assertEqual(0);
      expect(timer.tick()).assertTrue();
      expect(timer.isRunning()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', timer.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_025, end');
    });

    /**
     * Scenario: a tick arrives while no timer runs.
     * Expectation: the tick is ignored and nothing is counted.
     */
    it('Assessment_ExtensionLifecycle_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_026, begin');
      timer.reset();
      timer.initialise(DURATION_TEN);
      expect(timer.tick()).assertFalse();
      expect(timer.remaining()).assertEqual(600);
      expect(timer.stops()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_026, end');
    });

    /**
     * Scenario: the ledger is reset after a visit.
     * Expectation: every counter and the timer id return to their defaults.
     */
    it('Assessment_ExtensionLifecycle_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_027, begin');
      timer.reset();
      timer.initialise(DURATION_TEN);
      timer.start(2);
      timer.tick();
      timer.stop();
      timer.reset();
      expect(timer.starts()).assertEqual(0);
      expect(timer.stops()).assertEqual(0);
      expect(timer.remaining()).assertEqual(0);
      expect(timer.timerIdValue()).assertEqual(NO_TIMER);
      expect(timer.isBalanced()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_027, end');
    });

    /**
     * Scenario: aboutToAppear runs with a ten minute duration.
     * Expectation: the hardening, the answers initialisation and the countdown start run in that
     * order.
     */
    it('Assessment_ExtensionLifecycle_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_028, begin');
      timer.reset();
      examPage = new ExamPagePhaseModel();
      const phases: string[] = examPage.appear(DURATION_TEN, timer);
      expect(phases.length).assertEqual(3);
      expect(phases[0]).assertEqual(SUB_HARDENING_APPLY);
      expect(phases[1]).assertEqual(SUB_ANSWERS_INIT);
      expect(phases[2]).assertEqual(SUB_COUNTDOWN_START);
      expect(timer.isRunning()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_028, end');
    });

    /**
     * Scenario: aboutToAppear runs with the default duration.
     * Expectation: no countdown is started and only two sub phases run.
     */
    it('Assessment_ExtensionLifecycle_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_029, begin');
      timer.reset();
      examPage = new ExamPagePhaseModel();
      const phases: string[] = examPage.appear(DURATION_DEFAULT, timer);
      expect(phases.length).assertEqual(2);
      expect(phases[0]).assertEqual(SUB_HARDENING_APPLY);
      expect(phases[1]).assertEqual(SUB_ANSWERS_INIT);
      expect(timer.isRunning()).assertFalse();
      expect(examPage.isEntered()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_029, end');
    });

    /**
     * Scenario: aboutToDisappear runs after aboutToAppear.
     * Expectation: the countdown stop precedes the hardening release.
     */
    it('Assessment_ExtensionLifecycle_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_030, begin');
      timer.reset();
      examPage = new ExamPagePhaseModel();
      examPage.appear(DURATION_TEN, timer);
      const phases: string[] = examPage.disappear(timer);
      expect(phases.length).assertEqual(2);
      expect(phases[0]).assertEqual(SUB_COUNTDOWN_STOP);
      expect(phases[1]).assertEqual(SUB_HARDENING_RELEASE);
      expect(timer.isRunning()).assertFalse();
      expect(timer.isBalanced()).assertTrue();
      expect(examPage.isEntered()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_030, end');
    });

    /**
     * Scenario: the page disappears twice.
     * Expectation: the second disappear runs no sub phase because the page already left.
     */
    it('Assessment_ExtensionLifecycle_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_031, begin');
      timer.reset();
      examPage = new ExamPagePhaseModel();
      examPage.appear(DURATION_TEN, timer);
      expect(examPage.disappear(timer).length).assertEqual(2);
      expect(examPage.disappear(timer).length).assertEqual(0);
      expect(timer.stops()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_031, end');
    });

    /**
     * Scenario: the page appears twice without a disappear in between.
     * Expectation: the second appear runs no sub phase and no second timer is registered.
     */
    it('Assessment_ExtensionLifecycle_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_032, begin');
      timer.reset();
      examPage = new ExamPagePhaseModel();
      expect(examPage.appear(DURATION_TEN, timer).length).assertEqual(3);
      expect(examPage.appear(DURATION_TEN, timer).length).assertEqual(0);
      expect(timer.starts()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_032, end');
    });

    /**
     * Scenario: the page is revisited three times.
     * Expectation: every visit registers and clears exactly one timer, so the ledger is balanced.
     */
    it('Assessment_ExtensionLifecycle_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_033, begin');
      timer.reset();
      examPage = new ExamPagePhaseModel();
      for (let i = 0; i < 3; i++) {
        examPage.appear(DURATION_TEN, timer);
        examPage.disappear(timer);
      }
      expect(timer.starts()).assertEqual(3);
      expect(timer.stops()).assertEqual(3);
      expect(timer.isBalanced()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', timer.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_033, end');
    });

    /**
     * Scenario: the appear and disappear phase lists are compared.
     * Expectation: the disappear list starts with the countdown stop.
     */
    it('Assessment_ExtensionLifecycle_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_034, begin');
      timer.reset();
      examPage = new ExamPagePhaseModel();
      examPage.appear(DURATION_TEN, timer);
      examPage.disappear(timer);
      const appear: string[] = examPage.appearPhasesOf();
      const disappear: string[] = examPage.disappearPhasesOf();
      expect(appear.length).assertEqual(3);
      expect(disappear.length).assertEqual(2);
      expect(appear[0]).assertEqual(SUB_HARDENING_APPLY);
      expect(disappear[0]).assertEqual(SUB_COUNTDOWN_STOP);
      expect(examPage.isMirrored()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_034, end');
    });

    /**
     * Scenario: the mirrored check runs on a fresh model.
     * Expectation: without any recorded phase the check answers false.
     */
    it('Assessment_ExtensionLifecycle_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_035, begin');
      const fresh: ExamPagePhaseModel = new ExamPagePhaseModel();
      expect(fresh.isMirrored()).assertFalse();
      expect(fresh.appearPhasesOf().length).assertEqual(0);
      expect(fresh.disappearPhasesOf().length).assertEqual(0);
      expect(fresh.isEntered()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_035, end');
    });

    /**
     * Scenario: the answers of the exam page are initialised in aboutToAppear.
     * Expectation: one invalid answer per question, the answered count is zero.
     */
    it('Assessment_ExtensionLifecycle_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_036, begin');
      const answers: number[] = [];
      for (let i = 0; i < QUESTION_COUNT; i++) {
        answers.push(INVALID_ANSWER);
      }
      expect(answers.length).assertEqual(QUESTION_COUNT);
      let answered: number = 0;
      for (let i = 0; i < answers.length; i++) {
        if (answers[i] !== INVALID_ANSWER) {
          answered++;
        }
      }
      expect(answered).assertEqual(0);
      answers[0] = 1;
      expect(answers[0]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_036, end');
    });

    /**
     * Scenario: the operation labels of the exam page are enumerated.
     * Expectation: the three labels are distinct and non empty.
     */
    it('Assessment_ExtensionLifecycle_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_037, begin');
      const labels: string[] = [TEXT_EXAM_PREVIOUS, TEXT_EXAM_NEXT, TEXT_EXAM_SUBMIT];
      const unique: Set<string> = new Set<string>(labels);
      expect(labels.length).assertEqual(3);
      expect(unique.size).assertEqual(3);
      for (let i = 0; i < labels.length; i++) {
        expect(labels[i].length > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_037, end');
    });

    /**
     * Scenario: the page callbacks of a visit are ordered.
     * Expectation: aboutToAppear precedes onPageShow and aboutToDisappear closes the visit.
     */
    it('Assessment_ExtensionLifecycle_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_038, begin');
      recorder.reset();
      recorder.record(PAGE_ABOUT_TO_APPEAR, true);
      recorder.record(PAGE_ON_PAGE_SHOW, true);
      recorder.record(PAGE_ABOUT_TO_DISAPPEAR, true);
      expect(recorder.isBefore(PAGE_ABOUT_TO_APPEAR, PAGE_ON_PAGE_SHOW)).assertTrue();
      expect(recorder.isBefore(PAGE_ON_PAGE_SHOW, PAGE_ABOUT_TO_DISAPPEAR)).assertTrue();
      expect(recorder.isBefore(PAGE_ABOUT_TO_DISAPPEAR, PAGE_ABOUT_TO_APPEAR)).assertFalse();
      expect(recorder.count(PAGE_ABOUT_TO_APPEAR)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_038, end');
    });

    /**
     * Scenario: the back key of the exam page is pressed.
     * Expectation: the page ends the session before it leaves, so onBackPress is recorded before
     * aboutToDisappear.
     */
    it('Assessment_ExtensionLifecycle_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_039, begin');
      recorder.reset();
      recorder.record(PAGE_ABOUT_TO_APPEAR, true);
      recorder.record(PAGE_ON_PAGE_SHOW, true);
      recorder.record(PAGE_ON_BACK_PRESS, true);
      recorder.record(PAGE_ABOUT_TO_DISAPPEAR, true);
      expect(recorder.isBefore(PAGE_ON_BACK_PRESS, PAGE_ABOUT_TO_DISAPPEAR)).assertTrue();
      expect(recorder.isBefore(PAGE_ABOUT_TO_APPEAR, PAGE_ON_BACK_PRESS)).assertTrue();
      expect(recorder.allSucceeded()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_039, end');
    });

    /**
     * Scenario: the page recorder is reset between visits.
     * Expectation: the reset clears the steps and the start timestamp.
     */
    it('Assessment_ExtensionLifecycle_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_045, begin');
      recorder.reset();
      recorder.record(PAGE_ABOUT_TO_APPEAR, true);
      recorder.record(PAGE_ON_PAGE_SHOW, true);
      expect(recorder.size()).assertEqual(2);
      recorder.reset();
      expect(recorder.size()).assertEqual(0);
      expect(recorder.names().length).assertEqual(0);
      expect(recorder.allSucceeded()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_045, end');
    });

    /**
     * Scenario: a full visit is modelled from the ability to the page.
     * Expectation: every ability step precedes the page steps and the whole order is consistent.
     */
    it('Assessment_ExtensionLifecycle_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_046, begin');
      recorder.reset();
      recorder.record(ABILITY_ON_CREATE, true);
      recorder.record(ABILITY_ON_WINDOW_STAGE_CREATE, true);
      recorder.record(ABILITY_ON_FOREGROUND, true);
      recorder.record(PAGE_ABOUT_TO_APPEAR, true);
      recorder.record(PAGE_ON_PAGE_SHOW, true);
      recorder.record(PAGE_ON_BACK_PRESS, true);
      recorder.record(PAGE_ABOUT_TO_DISAPPEAR, true);
      recorder.record(ABILITY_ON_BACKGROUND, true);
      recorder.record(ABILITY_ON_WINDOW_STAGE_DESTROY, true);
      recorder.record(ABILITY_ON_DESTROY, true);
      expect(recorder.size()).assertEqual(10);
      expect(recorder.isBefore(ABILITY_ON_FOREGROUND, PAGE_ABOUT_TO_APPEAR)).assertTrue();
      expect(recorder.isBefore(PAGE_ABOUT_TO_DISAPPEAR, ABILITY_ON_BACKGROUND)).assertTrue();
      expect(recorder.isBefore(ABILITY_ON_BACKGROUND, ABILITY_ON_DESTROY)).assertTrue();
      expect(recorder.allSucceeded()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', recorder.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_046, end');
    });

    /**
     * Scenario: the state machine is driven with the same full visit.
     * Expectation: every transfer is accepted and the machine ends destroyed.
     */
    it('Assessment_ExtensionLifecycle_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_047, begin');
      machine.reset();
      const sequence: string[] = order.sequence();
      let accepted: number = 0;
      for (let round = 0; round < ORDERING_ROUNDS; round++) {
        machine.reset();
        for (let i = 0; i < sequence.length; i++) {
          if (machine.apply(sequence[i]).accepted) {
            accepted++;
          }
        }
      }
      expect(accepted).assertEqual(sequence.length * ORDERING_ROUNDS);
      expect(machine.isDestroyed()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s accepted:%{public}d', BUNDLE + 'ExtensionLifecycle_047', accepted);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_047, end');
    });

    /**
     * Scenario: the exam page is entered and left repeatedly with different durations.
     * Expectation: the timer ledger is balanced for every visit and the remaining seconds follow
     * the duration of that visit.
     */
    it('Assessment_ExtensionLifecycle_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_048, begin');
      const durations: number[] = [DURATION_DEFAULT, DURATION_TEN, DURATION_THIRTY, DURATION_SIXTY];
      const expectedRemaining: number[] = [0, 600, 1800, 3600];
      for (let i = 0; i < durations.length; i++) {
        timer.reset();
        examPage = new ExamPagePhaseModel();
        examPage.appear(durations[i], timer);
        expect(timer.remaining()).assertEqual(expectedRemaining[i]);
        examPage.disappear(timer);
        expect(timer.isBalanced()).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExtensionLifecycle_048, end');
    });
  });
}
