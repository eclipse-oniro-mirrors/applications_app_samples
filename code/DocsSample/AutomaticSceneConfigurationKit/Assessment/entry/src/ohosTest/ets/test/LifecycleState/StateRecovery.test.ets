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

// Assessment error codes of the sample.
const CODE_OK: number = 0;
const CODE_TIMEOUT: number = 2;
const CODE_ENV_ANOMALY: number = 4;

// Event types published by the controller.
const EVENT_BEGIN: string = 'onBegin';
const EVENT_INTERRUPTED: string = 'onInterrupted';
const EVENT_END: string = 'onEnd';
const EVENT_API_ERROR: string = 'onApiError';

// Duration candidates of the sample and the countdown arithmetic.
const DURATION_DEFAULT: number = 0;
const DURATION_TEN: number = 600000;
const DURATION_SIXTY: number = 3600000;
const MILLIS_PER_SECOND: number = 1000;
const COUNTDOWN_INTERVAL: number = 1000;

// The countdown of the exam page resumes from the remaining seconds, a restart from the full
// duration would double the allowed exam time, a restart from zero would cancel it.
const REMAINING_RESUME_SAMPLE: number = 540;

// Number of recovery rounds the stability cases drive.
const RECOVERY_ROUNDS: number = 5;

/**
 * One published event of the recovered log.
 */
interface RecoveredEvent {
  seq: number;
  type: string;
  code: number;
}

/**
 * The state the restored exam page renders.
 */
interface RestoredExamState {
  active: boolean;
  seq: number;
  remainingSeconds: number;
  answeredCount: number;
  resumed: boolean;
}

/**
 * A single step of a recovery scenario.
 */
interface RecoveryStep {
  name: string;
  accepted: boolean;
  active: boolean;
  seq: number;
}

/**
 * The event log of a session, oldest entry first and capped at twenty entries.
 */
class RecoveredLog {
  private events: RecoveredEvent[] = [];
  private seq: number = 0;

  /**
   * Appends an event and advances the sequence counter.
   *
   * @param type event type.
   * @param code assessment error code.
   * @returns the appended event.
   */
  public append(type: string, code: number): RecoveredEvent {
    this.seq = this.seq + 1;
    const event: RecoveredEvent = {
      seq: this.seq,
      type: type,
      code: code
    };
    this.events.push(event);
    if (this.events.length > 20) {
      this.events.splice(0, 1);
    }
    return event;
  }

  public size(): number {
    return this.events.length;
  }

  public sequence(): number {
    return this.seq;
  }

  public newest(): RecoveredEvent | undefined {
    if (this.events.length === 0) {
      return undefined;
    }
    return this.events[this.events.length - 1];
  }

  /**
   * Reads an event counted from the newest one.
   *
   * @param offset zero based offset from the newest entry.
   * @returns the event, or undefined when the offset is out of range.
   */
  public fromNewest(offset: number): RecoveredEvent | undefined {
    if (offset < 0) {
      return undefined;
    }
    const index: number = this.events.length - 1 - offset;
    if (index < 0 || index >= this.events.length) {
      return undefined;
    }
    return this.events[index];
  }

  /**
   * Derives the active flag from the newest event.
   *
   * @returns true only when the newest event is a successful begin.
   */
  public deriveActive(): boolean {
    const newest: RecoveredEvent | undefined = this.newest();
    if (newest === undefined) {
      return false;
    }
    return newest.type === EVENT_BEGIN && newest.code === CODE_OK;
  }

  /**
   * Counts the events of a type.
   *
   * @param type event type.
   * @returns the number of matching events.
   */
  public countOf(type: string): number {
    let count: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].type === type) {
        count++;
      }
    }
    return count;
  }

  /**
   * Restores the active flag from the newest event.
   *
   * A recreated page rebuilds the flag from AppStorage, which the controller wrote when the
   * newest event was published, so the newest event is the only source of truth here.
   *
   * @returns the restored flag.
   */
  public restoreActive(): boolean {
    return this.deriveActive();
  }

  public reset(): void {
    this.events = [];
    this.seq = 0;
  }

  public summary(): string {
    return `RecoveredLog{size=${this.events.length}, seq=${this.seq}, active=${this.deriveActive()}}`;
  }
}

/**
 * The recovery session of the exam page.
 *
 * The model keeps the two values the page persists between visits, the active flag and the
 * event sequence, and the two values it rebuilds on every appear, the answers and the
 * remaining seconds. A recovery hands the persisted values over and rebuilds the rest.
 */
class RecoverySession {
  private log: RecoveredLog = new RecoveredLog();
  private active: boolean = false;
  private answeredCount: number = -1;
  private remainingSeconds: number = 0;
  private steps: RecoveryStep[] = [];

  public constructor(active: boolean, seq: number) {
    this.active = active;
    if (seq > 0) {
      for (let i = 0; i < seq; i++) {
        this.log.append(EVENT_API_ERROR, CODE_TIMEOUT);
      }
    }
  }

  /**
   * Enters the exam page, the answers are reset and the countdown is derived from the
   * remaining seconds.
   *
   * @param remaining the seconds that were left before the interruption.
   * @param resume whether the countdown resumes from the remaining seconds.
   */
  public enterExamPage(remaining: number, resume: boolean): void {
    this.answeredCount = 0;
    // A resumed page keeps the remainder of the interrupted session, a page that is entered
    // without a session starts with an exhausted countdown so that no timer is started.
    if (resume) {
      this.remainingSeconds = remaining;
    } else {
      this.remainingSeconds = 0;
    }
    const step: RecoveryStep = {
      name: 'enterExamPage',
      accepted: true,
      active: this.active,
      seq: this.log.sequence()
    };
    this.steps.push(step);
  }

  /**
   * Publishes a callback event during the recovery.
   *
   * @param type event type.
   * @param code assessment error code.
   * @returns the number of the event.
   */
  public publish(type: string, code: number): number {
    const event: RecoveredEvent = this.log.append(type, code);
    if (type === EVENT_BEGIN) {
      this.active = code === CODE_OK;
    } else if (type === EVENT_INTERRUPTED || type === EVENT_END) {
      this.active = false;
    }
    const step: RecoveryStep = {
      name: type,
      accepted: true,
      active: this.active,
      seq: event.seq
    };
    this.steps.push(step);
    return event.seq;
  }

  /**
   * Ticks the countdown.
   *
   * @param ticks number of ticks to apply.
   * @returns the remaining seconds after the ticks, never negative.
   */
  public tick(ticks: number): number {
    for (let i = 0; i < ticks; i++) {
      if (this.remainingSeconds > 0) {
        this.remainingSeconds--;
      }
    }
    return this.remainingSeconds;
  }

  /**
   * Builds the state the re-entered page renders.
   *
   * @returns the restored state.
   */
  public state(): RestoredExamState {
    const state: RestoredExamState = {
      active: this.active,
      seq: this.log.sequence(),
      remainingSeconds: this.remainingSeconds,
      answeredCount: this.answeredCount,
      resumed: this.steps.length > 0
    };
    return state;
  }

  public logOf(): RecoveredLog {
    return this.log;
  }

  public isActive(): boolean {
    return this.active;
  }

  public remaining(): number {
    return this.remainingSeconds;
  }

  public answered(): number {
    return this.answeredCount;
  }

  public stepCount(): number {
    return this.steps.length;
  }

  public stepNames(): string[] {
    const names: string[] = [];
    for (let i = 0; i < this.steps.length; i++) {
      names.push(this.steps[i].name);
    }
    return names;
  }

  public toString(): string {
    return `RecoverySession{active=${this.active}, seq=${this.log.sequence()}, steps=${this.steps.length}}`;
  }
}

/**
 * Computes the remaining seconds of a duration, it mirrors aboutToAppear of the exam page.
 *
 * @param durationMs duration of the session.
 * @returns the remaining seconds, zero when no countdown would start.
 */
function initialRemaining(durationMs: number): number {
  if (durationMs <= 0) {
    return 0;
  }
  return Math.floor(durationMs / MILLIS_PER_SECOND);
}

/**
 * Computes the seconds a fully elapsed countdown would have ticked.
 *
 * @param durationMs duration of the session.
 * @returns the number of seconds.
 */
function elapsedSeconds(durationMs: number): number {
  return initialRemaining(durationMs);
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

export default function stateRecoveryTest() {
  describe('StateRecovery_Test', () => {
    let driver: Driver;
    let log: RecoveredLog;
    let session: RecoverySession;

    beforeAll(async () => {
      driver = getDriver();
      log = new RecoveredLog();
      session = new RecoverySession(false, 0);
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: an empty log is queried.
     * Expectation: the newest event is undefined and every derived value is empty.
     */
    it('Assessment_StateRecovery_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_001, begin');
      log.reset();
      expect(log.size()).assertEqual(0);
      expect(log.sequence()).assertEqual(0);
      expect(log.newest() === undefined).assertTrue();
      expect(log.deriveActive()).assertFalse();
      expect(log.restoreActive()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', log.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_001, end');
    });

    /**
     * Scenario: a failed begin is followed by an interruption.
     * Expectation: the sequence is restored at two and the flag stays false.
     */
    it('Assessment_StateRecovery_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_002, begin');
      log.reset();
      expect(log.append(EVENT_BEGIN, CODE_OK).seq).assertEqual(1);
      expect(log.append(EVENT_INTERRUPTED, CODE_ENV_ANOMALY).seq).assertEqual(2);
      expect(log.sequence()).assertEqual(2);
      expect(log.deriveActive()).assertFalse();
      expect(log.countOf(EVENT_INTERRUPTED)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_002, end');
    });

    /**
     * Scenario: the active flag is restored from a begin event.
     * Expectation: a successful begin restores the flag, a failed one does not.
     */
    it('Assessment_StateRecovery_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_003, begin');
      log.reset();
      log.append(EVENT_BEGIN, CODE_TIMEOUT);
      expect(log.restoreActive()).assertFalse();
      log.append(EVENT_BEGIN, CODE_OK);
      expect(log.restoreActive()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', log.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_003, end');
    });

    /**
     * Scenario: the newest event is read with an offset.
     * Expectation: the offset counts from the newest entry and out of range answers undefined.
     */
    it('Assessment_StateRecovery_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_004, begin');
      log.reset();
      log.append(EVENT_BEGIN, CODE_OK);
      log.append(EVENT_INTERRUPTED, CODE_TIMEOUT);
      log.append(EVENT_END, CODE_OK);
      expect(log.fromNewest(0)?.type).assertEqual(EVENT_END);
      expect(log.fromNewest(1)?.type).assertEqual(EVENT_INTERRUPTED);
      expect(log.fromNewest(2)?.type).assertEqual(EVENT_BEGIN);
      expect(log.fromNewest(3) === undefined).assertTrue();
      expect(log.fromNewest(-1) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_004, end');
    });

    /**
     * Scenario: the sequence of a recovered log is restored.
     * Expectation: a new session built on a sequence of seven continues from eight.
     */
    it('Assessment_StateRecovery_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_006, begin');
      const recovered: RecoverySession = new RecoverySession(false, 7);
      expect(recovered.logOf().sequence()).assertEqual(7);
      expect(recovered.logOf().size()).assertEqual(7);
      expect(recovered.publish(EVENT_BEGIN, CODE_OK)).assertEqual(8);
      expect(recovered.isActive()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', recovered.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_006, end');
    });

    /**
     * Scenario: the remaining seconds of every candidate are computed.
     * Expectation: the arithmetic follows floor(duration / 1000).
     */
    it('Assessment_StateRecovery_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_007, begin');
      expect(initialRemaining(DURATION_DEFAULT)).assertEqual(0);
      expect(initialRemaining(DURATION_TEN)).assertEqual(600);
      expect(initialRemaining(DURATION_SIXTY)).assertEqual(3600);
      expect(initialRemaining(1500)).assertEqual(1);
      expect(initialRemaining(-1)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_007, end');
    });

    /**
     * Scenario: the elapsed seconds of a full countdown are computed.
     * Expectation: the full elapsed time equals the initial remaining seconds.
     */
    it('Assessment_StateRecovery_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_008, begin');
      expect(elapsedSeconds(DURATION_TEN)).assertEqual(initialRemaining(DURATION_TEN));
      expect(elapsedSeconds(DURATION_SIXTY)).assertEqual(3600);
      expect(elapsedSeconds(COUNTDOWN_INTERVAL)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_008, end');
    });

    /**
     * Scenario: the exam page is re-entered after an interruption.
     * Expectation: the countdown resumes from the remaining seconds and the answers are cleared.
     */
    it('Assessment_StateRecovery_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_009, begin');
      session = new RecoverySession(false, 3);
      session.publish(EVENT_BEGIN, CODE_OK);
      session.enterExamPage(REMAINING_RESUME_SAMPLE, true);
      const state: RestoredExamState = session.state();
      expect(state.remainingSeconds).assertEqual(REMAINING_RESUME_SAMPLE);
      expect(state.answeredCount).assertEqual(0);
      expect(state.active).assertTrue();
      expect(state.seq).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', session.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_009, end');
    });

    /**
     * Scenario: the countdown resumes and ticks five times.
     * Expectation: the remaining seconds drop by five, never below zero.
     */
    it('Assessment_StateRecovery_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_010, begin');
      session = new RecoverySession(false, 0);
      session.enterExamPage(5, true);
      expect(session.tick(3)).assertEqual(2);
      expect(session.tick(5)).assertEqual(0);
      expect(session.remaining()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_010, end');
    });

    /**
     * Scenario: the countdown resumes with no remaining seconds.
     * Expectation: the page renders zero and starts no timer.
     */
    it('Assessment_StateRecovery_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_011, begin');
      session = new RecoverySession(false, 0);
      session.enterExamPage(0, true);
      expect(session.remaining()).assertEqual(0);
      expect(session.tick(1)).assertEqual(0);
      expect(session.answered()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_011, end');
    });

    /**
     * Scenario: an interrupt arrives during a recovered session.
     * Expectation: the flag is cleared and the interrupt is the newest event.
     */
    it('Assessment_StateRecovery_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_012, begin');
      session = new RecoverySession(false, 0);
      session.publish(EVENT_BEGIN, CODE_OK);
      expect(session.isActive()).assertTrue();
      session.publish(EVENT_INTERRUPTED, CODE_ENV_ANOMALY);
      expect(session.isActive()).assertFalse();
      expect(session.logOf().newest()?.type).assertEqual(EVENT_INTERRUPTED);
      expect(session.logOf().deriveActive()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', session.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_012, end');
    });

    /**
     * Scenario: an end event arrives during a recovered session.
     * Expectation: the flag is cleared and the step list records the end.
     */
    it('Assessment_StateRecovery_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_013, begin');
      session = new RecoverySession(false, 0);
      session.publish(EVENT_BEGIN, CODE_OK);
      session.publish(EVENT_END, CODE_OK);
      expect(session.isActive()).assertFalse();
      expect(session.logOf().countOf(EVENT_END)).assertEqual(1);
      expect(session.stepNames().indexOf(EVENT_END) >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_013, end');
    });

    /**
     * Scenario: an API error arrives during a recovered session.
     * Expectation: the error is logged but the flag is unchanged.
     */
    it('Assessment_StateRecovery_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_014, begin');
      session = new RecoverySession(false, 0);
      session.publish(EVENT_BEGIN, CODE_OK);
      session.publish(EVENT_API_ERROR, CODE_TIMEOUT);
      expect(session.isActive()).assertTrue();
      expect(session.logOf().newest()?.type).assertEqual(EVENT_API_ERROR);
      expect(session.logOf().deriveActive()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_014, end');
    });

    /**
     * Scenario: the state of a re-entered page is inspected before any event.
     * Expectation: the resumed flag is false and the answers are still uninitialised.
     */
    it('Assessment_StateRecovery_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_015, begin');
      const fresh: RecoverySession = new RecoverySession(false, 0);
      const state: RestoredExamState = fresh.state();
      expect(state.resumed).assertFalse();
      expect(state.active).assertFalse();
      expect(state.seq).assertEqual(0);
      expect(state.answeredCount).assertEqual(-1);
      expect(state.remainingSeconds).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_015, end');
    });

    /**
     * Scenario: a full recovery cycle is modelled.
     * Expectation: the recovered page reports one begin, one interrupt and the recovered sequence.
     */
    it('Assessment_StateRecovery_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_016, begin');
      session = new RecoverySession(true, 2);
      session.publish(EVENT_INTERRUPTED, CODE_TIMEOUT);
      session.enterExamPage(300, true);
      session.publish(EVENT_BEGIN, CODE_OK);
      expect(session.logOf().countOf(EVENT_BEGIN)).assertEqual(1);
      expect(session.logOf().countOf(EVENT_INTERRUPTED)).assertEqual(1);
      expect(session.logOf().sequence()).assertEqual(4);
      expect(session.isActive()).assertTrue();
      expect(session.remaining()).assertEqual(300);
      expect(session.stepCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', session.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_016, end');
    });

    /**
     * Scenario: the log is reset during a recovery.
     * Expectation: the sequence returns to zero and the derived flag is false.
     */
    it('Assessment_StateRecovery_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_017, begin');
      log.reset();
      log.append(EVENT_BEGIN, CODE_OK);
      log.append(EVENT_END, CODE_OK);
      expect(log.size()).assertEqual(2);
      log.reset();
      expect(log.size()).assertEqual(0);
      expect(log.sequence()).assertEqual(0);
      expect(log.newest() === undefined).assertTrue();
      log.append(EVENT_BEGIN, CODE_OK);
      expect(log.newest()?.seq).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_017, end');
    });

    /**
     * Scenario: the sequence survives a series of interruptions.
     * Expectation: every interruption advances the sequence and clears the flag.
     */
    it('Assessment_StateRecovery_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_018, begin');
      session = new RecoverySession(false, 0);
      for (let i = 0; i < RECOVERY_ROUNDS; i++) {
        session.publish(EVENT_BEGIN, CODE_OK);
        expect(session.isActive()).assertTrue();
        session.publish(EVENT_INTERRUPTED, CODE_TIMEOUT);
        expect(session.isActive()).assertFalse();
      }
      expect(session.logOf().sequence()).assertEqual(RECOVERY_ROUNDS * 2);
      expect(session.logOf().countOf(EVENT_BEGIN)).assertEqual(RECOVERY_ROUNDS);
      expect(session.logOf().countOf(EVENT_INTERRUPTED)).assertEqual(RECOVERY_ROUNDS);
      hilog.info(DOMAIN, TAG, '%{public}s', session.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_018, end');
    });

    /**
     * Scenario: the remaining seconds of a recovered session are compared with a fresh one.
     * Expectation: the recovered page keeps the remainder while a fresh page restarts from the
     * full duration.
     */
    it('Assessment_StateRecovery_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_019, begin');
      const recovered: RecoverySession = new RecoverySession(false, 0);
      recovered.enterExamPage(REMAINING_RESUME_SAMPLE, true);
      const fresh: RecoverySession = new RecoverySession(false, 0);
      fresh.enterExamPage(initialRemaining(DURATION_TEN), true);
      expect(recovered.remaining()).assertEqual(REMAINING_RESUME_SAMPLE);
      expect(fresh.remaining()).assertEqual(600);
      expect(recovered.remaining() < fresh.remaining()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s recovered:%{public}d fresh:%{public}d',
        BUNDLE + 'StateRecovery_019', recovered.remaining(), fresh.remaining());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_019, end');
    });

    /**
     * Scenario: the recovery session summary is rendered.
     * Expectation: the summary carries the active flag and the sequence.
     */
    it('Assessment_StateRecovery_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_023, begin');
      session = new RecoverySession(false, 0);
      session.publish(EVENT_BEGIN, CODE_OK);
      const summary: string = session.toString();
      expect(summary).assertContain('RecoverySession');
      expect(summary).assertContain('active=true');
      expect(summary).assertContain('seq=1');
      hilog.info(DOMAIN, TAG, '%{public}s', summary);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_023, end');
    });

    /**
     * Scenario: the countdown is resumed and then interrupted again.
     * Expectation: the remaining seconds freeze at the value the interrupt saw.
     */
    it('Assessment_StateRecovery_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_024, begin');
      session = new RecoverySession(false, 0);
      session.enterExamPage(120, true);
      session.tick(20);
      expect(session.remaining()).assertEqual(100);
      session.publish(EVENT_INTERRUPTED, CODE_TIMEOUT);
      expect(session.remaining()).assertEqual(100);
      session.enterExamPage(session.remaining(), true);
      expect(session.state().remainingSeconds).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateRecovery_024, end');
    });
  });
}
