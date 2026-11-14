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
  ID_BEGIN_BUTTON,
  ID_END_BUTTON,
  ID_EXAM_TITLE,
  TEXT_STATE_INACTIVE,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  isComponentEnabled,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Assessment error codes of the sample.
const CODE_OK: number = 0;
const CODE_USER_CANCEL: number = 1;
const CODE_TIMEOUT: number = 2;
const CODE_SYSTEM_ERROR: number = 3;
const CODE_ENV_ANOMALY: number = 4;

// Lifecycle phases of a session, they mirror what the controller publishes.
const PHASE_IDLE: string = 'idle';
const PHASE_ACTIVE: string = 'active';
const PHASE_ENDED: string = 'ended';
const PHASE_REJECTED: string = 'rejected';

// Reasons the session manager rejects a request.
const REASON_DUPLICATE_BEGIN: string = 'a session is already active';
const REASON_NOT_ACTIVE: string = 'no session is active';
const REASON_ACCEPTED: string = 'the request was accepted';

// Number of queued requests the serialization cases drive.
const QUEUE_ROUNDS: number = 5;

/**
 * One transition of the session lifecycle.
 */
interface SessionTransition {
  seq: number;
  from: string;
  to: string;
  reason: string;
  accepted: boolean;
}

/**
 * The result of a begin or an end request.
 */
interface SessionOutcome {
  accepted: boolean;
  sessionId: number;
  phase: string;
  reason: string;
}

/**
 * A queued request, the serialization model runs one request at a time.
 */
interface QueuedRequest {
  order: number;
  operation: string;
  code: number;
}

/**
 * The single session slot of the sample.
 *
 * The assessment service allows one session for an application, so the manager keeps exactly
 * one slot. A begin is accepted only while the slot is idle, an end only while the slot is
 * active. Every accepted or rejected request leaves a transition in the history so that a case
 * can prove the rejection happened before any state change.
 */
class SessionManagerModel {
  private phase: string = PHASE_IDLE;
  private sessionId: number = 0;
  private nextSessionId: number = 1;
  private transitions: SessionTransition[] = [];
  private rejections: number = 0;

  /**
   * Requests the start of a session.
   *
   * @param code assessment error code the callback will report.
   * @returns the outcome of the request.
   */
  public begin(code: number): SessionOutcome {
    if (this.phase === PHASE_ACTIVE) {
      this.rejections++;
      this.record(PHASE_ACTIVE, PHASE_ACTIVE, REASON_DUPLICATE_BEGIN, false);
      return this.outcome(false, this.sessionId, REASON_DUPLICATE_BEGIN);
    }
    const id: number = this.nextSessionId;
    this.nextSessionId++;
    this.sessionId = id;
    if (code === CODE_OK) {
      this.record(this.phase, PHASE_ACTIVE, REASON_ACCEPTED, true);
      this.phase = PHASE_ACTIVE;
      return this.outcome(true, id, REASON_ACCEPTED);
    }
    this.record(this.phase, PHASE_REJECTED, 'the begin callback failed with code ' + code, true);
    this.phase = PHASE_REJECTED;
    return this.outcome(false, id, 'the begin callback failed with code ' + code);
  }

  /**
   * Requests the end of the current session.
   *
   * @returns the outcome of the request.
   */
  public end(): SessionOutcome {
    if (this.phase !== PHASE_ACTIVE) {
      this.rejections++;
      this.record(this.phase, this.phase, REASON_NOT_ACTIVE, false);
      return this.outcome(false, this.sessionId, REASON_NOT_ACTIVE);
    }
    this.record(PHASE_ACTIVE, PHASE_ENDED, REASON_ACCEPTED, true);
    this.phase = PHASE_ENDED;
    return this.outcome(true, this.sessionId, REASON_ACCEPTED);
  }

  /**
   * Handles an interrupt, an interrupted session is no longer active.
   *
   * @param code interrupt code.
   * @returns true when the session was active.
   */
  public interrupt(code: number): boolean {
    if (this.phase !== PHASE_ACTIVE) {
      return false;
    }
    this.record(PHASE_ACTIVE, PHASE_ENDED, 'interrupted with code ' + code, true);
    this.phase = PHASE_ENDED;
    return true;
  }

  public phaseOf(): string {
    return this.phase;
  }

  public isActive(): boolean {
    return this.phase === PHASE_ACTIVE;
  }

  public id(): number {
    return this.sessionId;
  }

  public history(): SessionTransition[] {
    return this.transitions.slice();
  }

  public historySize(): number {
    return this.transitions.length;
  }

  public rejectionCount(): number {
    return this.rejections;
  }

  /**
   * Counts the transitions that reached a phase.
   *
   * @param phase target phase.
   * @returns the number of transitions into that phase.
   */
  public countInto(phase: string): number {
    let count: number = 0;
    for (let i = 0; i < this.transitions.length; i++) {
      if (this.transitions[i].to === phase && this.transitions[i].accepted) {
        count++;
      }
    }
    return count;
  }

  /**
   * Counts the accepted transitions.
   *
   * @returns the number of accepted transitions.
   */
  public acceptedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.transitions.length; i++) {
      if (this.transitions[i].accepted) {
        count++;
      }
    }
    return count;
  }

  public lastTransition(): SessionTransition | undefined {
    if (this.transitions.length === 0) {
      return undefined;
    }
    return this.transitions[this.transitions.length - 1];
  }

  public sequenceIsMonotonic(): boolean {
    for (let i = 0; i < this.transitions.length; i++) {
      if (this.transitions[i].seq !== i) {
        return false;
      }
    }
    return true;
  }

  private record(from: string, to: string, reason: string, accepted: boolean): void {
    const transition: SessionTransition = {
      seq: this.transitions.length,
      from: from,
      to: to,
      reason: reason,
      accepted: accepted
    };
    this.transitions.push(transition);
  }

  private outcome(accepted: boolean, sessionId: number, reason: string): SessionOutcome {
    const result: SessionOutcome = {
      accepted: accepted,
      sessionId: sessionId,
      phase: this.phase,
      reason: reason
    };
    return result;
  }

  public reset(): void {
    this.phase = PHASE_IDLE;
    this.sessionId = 0;
    this.nextSessionId = 1;
    this.transitions = [];
    this.rejections = 0;
  }

  public toString(): string {
    return `SessionManagerModel{phase=${this.phase}, id=${this.sessionId}, rejections=${this.rejections}}`;
  }
}

/**
 * Serializes the begin and end requests of the operation card.
 *
 * UiTest and the controller both run one request at a time: a second begin that arrives while
 * the first one is in flight is queued and evaluated against the state the first one left. The
 * serializer reproduces that order and reports every request in arrival order.
 */
class RequestSerializer {
  private queue: QueuedRequest[] = [];
  private processed: QueuedRequest[] = [];
  private busy: boolean = false;
  private dropped: number = 0;

  /**
   * Enqueues a request.
   *
   * @param operation operation name, begin or end.
   * @param code assessment error code for a begin.
   * @returns true when the request was enqueued.
   */
  public enqueue(operation: string, code: number): boolean {
    if (operation !== 'begin' && operation !== 'end') {
      this.dropped++;
      return false;
    }
    const request: QueuedRequest = {
      order: this.queue.length + this.processed.length,
      operation: operation,
      code: code
    };
    this.queue.push(request);
    return true;
  }

  /**
   * Runs one queued request against a manager.
   *
   * @param manager manager that executes the request.
   * @returns the outcome, or undefined when the queue is empty.
   */
  public processNext(manager: SessionManagerModel): SessionOutcome | undefined {
    if (this.queue.length === 0) {
      return undefined;
    }
    const request: QueuedRequest = this.queue[0];
    this.queue.splice(0, 1);
    this.busy = true;
    let outcome: SessionOutcome;
    if (request.operation === 'begin') {
      outcome = manager.begin(request.code);
    } else {
      outcome = manager.end();
    }
    this.busy = false;
    this.processed.push(request);
    return outcome;
  }

  /**
   * Drains the queue.
   *
   * @param manager manager that executes the requests.
   * @returns the outcomes in arrival order.
   */
  public drain(manager: SessionManagerModel): SessionOutcome[] {
    const outcomes: SessionOutcome[] = [];
    while (this.queue.length > 0) {
      const outcome: SessionOutcome | undefined = this.processNext(manager);
      if (outcome !== undefined) {
        outcomes.push(outcome);
      }
    }
    return outcomes;
  }

  public pending(): number {
    return this.queue.length;
  }

  public processedCount(): number {
    return this.processed.length;
  }

  public droppedCount(): number {
    return this.dropped;
  }

  public isBusy(): boolean {
    return this.busy;
  }

  public processedOperations(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.processed.length; i++) {
      result.push(this.processed[i].operation);
    }
    return result;
  }

  public reset(): void {
    this.queue = [];
    this.processed = [];
    this.busy = false;
    this.dropped = 0;
  }

  public toString(): string {
    return `RequestSerializer{processed=${this.processed.length}, pending=${this.queue.length}}`;
  }
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

export default function sessionManagementTest() {
  describe('SessionManagement_Test', () => {
    let driver: Driver;
    let manager: SessionManagerModel;
    let serializer: RequestSerializer;

    beforeAll(async () => {
      driver = getDriver();
      manager = new SessionManagerModel();
      serializer = new RequestSerializer();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: a fresh manager.
     * Expectation: the manager is idle, holds no session and has no history.
     */
    it('Assessment_SessionManagement_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_001, begin');
      manager.reset();
      expect(manager.phaseOf()).assertEqual(PHASE_IDLE);
      expect(manager.isActive()).assertFalse();
      expect(manager.id()).assertEqual(0);
      expect(manager.historySize()).assertEqual(0);
      expect(manager.rejectionCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', manager.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_001, end');
    });

    /**
     * Scenario: a begin with the OK code.
     * Expectation: the session becomes active and carries the first session id.
     */
    it('Assessment_SessionManagement_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_002, begin');
      manager.reset();
      const outcome: SessionOutcome = manager.begin(CODE_OK);
      expect(outcome.accepted).assertTrue();
      expect(outcome.sessionId).assertEqual(1);
      expect(manager.phaseOf()).assertEqual(PHASE_ACTIVE);
      expect(manager.isActive()).assertTrue();
      expect(manager.countInto(PHASE_ACTIVE)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_002, end');
    });

    /**
     * Scenario: a second begin arrives while the session is active.
     * Expectation: the duplicate is rejected and the session id does not change.
     */
    it('Assessment_SessionManagement_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_003, begin');
      manager.reset();
      manager.begin(CODE_OK);
      const firstId: number = manager.id();
      const duplicate: SessionOutcome = manager.begin(CODE_OK);
      expect(duplicate.accepted).assertFalse();
      expect(duplicate.reason).assertEqual(REASON_DUPLICATE_BEGIN);
      expect(manager.id()).assertEqual(firstId);
      expect(manager.rejectionCount()).assertEqual(1);
      expect(manager.isActive()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_003, end');
    });

    /**
     * Scenario: a begin fails with the user cancel code.
     * Expectation: the session is not active and the phase reports the rejection.
     */
    it('Assessment_SessionManagement_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_004, begin');
      manager.reset();
      const outcome: SessionOutcome = manager.begin(CODE_USER_CANCEL);
      expect(outcome.accepted).assertFalse();
      expect(manager.isActive()).assertFalse();
      expect(manager.phaseOf()).assertEqual(PHASE_REJECTED);
      expect(manager.countInto(PHASE_ACTIVE)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_004, end');
    });

    /**
     * Scenario: a begin fails and a second begin follows.
     * Expectation: the second begin is accepted because the slot is not active.
     */
    it('Assessment_SessionManagement_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_005, begin');
      manager.reset();
      manager.begin(CODE_TIMEOUT);
      const retry: SessionOutcome = manager.begin(CODE_OK);
      expect(retry.accepted).assertTrue();
      expect(manager.isActive()).assertTrue();
      expect(retry.sessionId).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_005, end');
    });

    /**
     * Scenario: every failing code is used for a begin.
     * Expectation: none of them activates the session and every one consumes a session id.
     */
    it('Assessment_SessionManagement_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_006, begin');
      manager.reset();
      const codes: number[] = [CODE_USER_CANCEL, CODE_TIMEOUT, CODE_SYSTEM_ERROR, CODE_ENV_ANOMALY];
      for (let i = 0; i < codes.length; i++) {
        const outcome: SessionOutcome = manager.begin(codes[i]);
        expect(outcome.accepted).assertFalse();
        expect(outcome.sessionId).assertEqual(i + 1);
      }
      expect(manager.isActive()).assertFalse();
      expect(manager.id()).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_006, end');
    });

    /**
     * Scenario: an end is requested while the session is active.
     * Expectation: the session ends and the transition is recorded once.
     */
    it('Assessment_SessionManagement_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_007, begin');
      manager.reset();
      manager.begin(CODE_OK);
      const outcome: SessionOutcome = manager.end();
      expect(outcome.accepted).assertTrue();
      expect(manager.phaseOf()).assertEqual(PHASE_ENDED);
      expect(manager.isActive()).assertFalse();
      expect(manager.countInto(PHASE_ENDED)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_007, end');
    });

    /**
     * Scenario: an end is requested while no session is active.
     * Expectation: the request is rejected with the not active reason.
     */
    it('Assessment_SessionManagement_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_008, begin');
      manager.reset();
      const outcome: SessionOutcome = manager.end();
      expect(outcome.accepted).assertFalse();
      expect(outcome.reason).assertEqual(REASON_NOT_ACTIVE);
      expect(manager.rejectionCount()).assertEqual(1);
      expect(manager.historySize()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_008, end');
    });

    /**
     * Scenario: an end is repeated.
     * Expectation: the second request is rejected, the session stays ended.
     */
    it('Assessment_SessionManagement_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_009, begin');
      manager.reset();
      manager.begin(CODE_OK);
      expect(manager.end().accepted).assertTrue();
      expect(manager.end().accepted).assertFalse();
      expect(manager.rejectionCount()).assertEqual(1);
      expect(manager.countInto(PHASE_ENDED)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_009, end');
    });

    /**
     * Scenario: an interrupt arrives during a session.
     * Expectation: the interrupt ends the session and a later end is rejected.
     */
    it('Assessment_SessionManagement_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_010, begin');
      manager.reset();
      manager.begin(CODE_OK);
      expect(manager.interrupt(CODE_ENV_ANOMALY)).assertTrue();
      expect(manager.isActive()).assertFalse();
      const interruptTransition: SessionTransition | undefined = manager.lastTransition();
      expect(interruptTransition !== undefined).assertTrue();
      if (interruptTransition !== undefined) {
        expect(interruptTransition.reason).assertContain('interrupted');
      }
      expect(manager.end().accepted).assertFalse();
      expect(manager.lastTransition()?.reason).assertEqual(REASON_NOT_ACTIVE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_010, end');
    });

    /**
     * Scenario: an interrupt arrives while no session is active.
     * Expectation: the interrupt is ignored and no transition is recorded.
     */
    it('Assessment_SessionManagement_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_011, begin');
      manager.reset();
      expect(manager.interrupt(CODE_TIMEOUT)).assertFalse();
      expect(manager.historySize()).assertEqual(0);
      expect(manager.phaseOf()).assertEqual(PHASE_IDLE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_011, end');
    });

    /**
     * Scenario: a full session cycle is run.
     * Expectation: the history lists begin, end and the ids grow per begin.
     */
    it('Assessment_SessionManagement_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_012, begin');
      manager.reset();
      manager.begin(CODE_OK);
      manager.end();
      manager.begin(CODE_OK);
      manager.end();
      expect(manager.historySize()).assertEqual(4);
      expect(manager.history()[0].to).assertEqual(PHASE_ACTIVE);
      expect(manager.history()[1].to).assertEqual(PHASE_ENDED);
      expect(manager.acceptedCount()).assertEqual(4);
      expect(manager.sequenceIsMonotonic()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_012, end');
    });

    /**
     * Scenario: the session ids of three cycles are compared.
     * Expectation: the ids are strictly increasing and never reused.
     */
    it('Assessment_SessionManagement_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_013, begin');
      manager.reset();
      const ids: number[] = [];
      for (let i = 0; i < 3; i++) {
        ids.push(manager.begin(CODE_OK).sessionId);
        manager.end();
      }
      expect(ids.length).assertEqual(3);
      expect(ids[0]).assertEqual(1);
      expect(ids[1]).assertEqual(2);
      expect(ids[2]).assertEqual(3);
      expect(ids[2] > ids[1]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_013, end');
    });

    /**
     * Scenario: a rejected duplicate is compared with an accepted begin.
     * Expectation: only the accepted request appears in the active count.
     */
    it('Assessment_SessionManagement_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_014, begin');
      manager.reset();
      manager.begin(CODE_OK);
      manager.begin(CODE_OK);
      manager.begin(CODE_OK);
      expect(manager.countInto(PHASE_ACTIVE)).assertEqual(1);
      expect(manager.rejectionCount()).assertEqual(2);
      expect(manager.acceptedCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_014, end');
    });

    /**
     * Scenario: the manager is reset in the middle of a session.
     * Expectation: the phase, the id and the counters return to their defaults.
     */
    it('Assessment_SessionManagement_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_015, begin');
      manager.reset();
      manager.begin(CODE_OK);
      manager.end();
      manager.reset();
      expect(manager.phaseOf()).assertEqual(PHASE_IDLE);
      expect(manager.id()).assertEqual(0);
      expect(manager.historySize()).assertEqual(0);
      expect(manager.rejectionCount()).assertEqual(0);
      expect(manager.lastTransition() === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_015, end');
    });

    /**
     * Scenario: a request is enqueued.
     * Expectation: the queue holds it and nothing was processed yet.
     */
    it('Assessment_SessionManagement_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_016, begin');
      serializer.reset();
      manager.reset();
      expect(serializer.enqueue('begin', CODE_OK)).assertTrue();
      expect(serializer.pending()).assertEqual(1);
      expect(serializer.processedCount()).assertEqual(0);
      expect(serializer.isBusy()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', serializer.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_016, end');
    });

    /**
     * Scenario: an unserializable request is enqueued.
     * Expectation: the request is dropped and the queue stays empty.
     */
    it('Assessment_SessionManagement_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_017, begin');
      serializer.reset();
      expect(serializer.enqueue('query', CODE_OK)).assertFalse();
      expect(serializer.droppedCount()).assertEqual(1);
      expect(serializer.pending()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_017, end');
    });

    /**
     * Scenario: two begins are queued back to back.
     * Expectation: the first one is accepted and the second one is rejected as a duplicate.
     */
    it('Assessment_SessionManagement_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_018, begin');
      serializer.reset();
      manager.reset();
      serializer.enqueue('begin', CODE_OK);
      serializer.enqueue('begin', CODE_OK);
      const outcomes: SessionOutcome[] = serializer.drain(manager);
      expect(outcomes.length).assertEqual(2);
      expect(outcomes[0].accepted).assertTrue();
      expect(outcomes[1].accepted).assertFalse();
      expect(manager.rejectionCount()).assertEqual(1);
      expect(serializer.pending()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_018, end');
    });

    /**
     * Scenario: a begin and an end are queued.
     * Expectation: the requests are processed in arrival order and the session ends active-free.
     */
    it('Assessment_SessionManagement_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_019, begin');
      serializer.reset();
      manager.reset();
      serializer.enqueue('begin', CODE_OK);
      serializer.enqueue('end', CODE_OK);
      const outcomes: SessionOutcome[] = serializer.drain(manager);
      expect(outcomes.length).assertEqual(2);
      expect(outcomes[0].accepted).assertTrue();
      expect(outcomes[1].accepted).assertTrue();
      expect(manager.isActive()).assertFalse();
      expect(serializer.processedOperations()[0]).assertEqual('begin');
      expect(serializer.processedOperations()[1]).assertEqual('end');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_019, end');
    });

    /**
     * Scenario: an end is queued before any begin.
     * Expectation: the end is rejected because the slot is idle.
     */
    it('Assessment_SessionManagement_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_020, begin');
      serializer.reset();
      manager.reset();
      serializer.enqueue('end', CODE_OK);
      const first: SessionOutcome | undefined = serializer.processNext(manager);
      expect(first !== undefined).assertTrue();
      if (first !== undefined) {
        expect(first.accepted).assertFalse();
        expect(first.reason).assertEqual(REASON_NOT_ACTIVE);
      }
      expect(serializer.processNext(manager) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_020, end');
    });

    /**
     * Scenario: a failing begin is queued and a retry follows.
     * Expectation: the retry is accepted because the failed begin left the slot inactive.
     */
    it('Assessment_SessionManagement_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_021, begin');
      serializer.reset();
      manager.reset();
      serializer.enqueue('begin', CODE_TIMEOUT);
      serializer.enqueue('begin', CODE_OK);
      const outcomes: SessionOutcome[] = serializer.drain(manager);
      expect(outcomes[0].accepted).assertFalse();
      expect(outcomes[1].accepted).assertTrue();
      expect(manager.isActive()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_021, end');
    });

    /**
     * Scenario: a long queue is drained.
     * Expectation: every request is processed exactly once in arrival order.
     */
    it('Assessment_SessionManagement_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_022, begin');
      serializer.reset();
      manager.reset();
      for (let i = 0; i < QUEUE_ROUNDS; i++) {
        serializer.enqueue('begin', CODE_OK);
        serializer.enqueue('end', CODE_OK);
      }
      const outcomes: SessionOutcome[] = serializer.drain(manager);
      expect(outcomes.length).assertEqual(QUEUE_ROUNDS * 2);
      expect(serializer.processedCount()).assertEqual(QUEUE_ROUNDS * 2);
      expect(manager.countInto(PHASE_ACTIVE)).assertEqual(QUEUE_ROUNDS);
      expect(manager.countInto(PHASE_ENDED)).assertEqual(QUEUE_ROUNDS);
      expect(manager.isActive()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', serializer.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_022, end');
    });

    /**
     * Scenario: the serializer is reset with a pending queue.
     * Expectation: the pending and processed request counters return to zero.
     */
    it('Assessment_SessionManagement_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_023, begin');
      serializer.reset();
      serializer.enqueue('begin', CODE_OK);
      serializer.enqueue('end', CODE_OK);
      serializer.reset();
      expect(serializer.pending()).assertEqual(0);
      expect(serializer.processedCount()).assertEqual(0);
      expect(serializer.droppedCount()).assertEqual(0);
      expect(serializer.isBusy()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_023, end');
    });

    /**
     * Scenario: a session is modelled through the serializer and validated.
     * Expectation: exactly one active transition survives the whole script.
     */
    it('Assessment_SessionManagement_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_028, begin');
      serializer.reset();
      manager.reset();
      serializer.enqueue('begin', CODE_OK);
      serializer.enqueue('begin', CODE_USER_CANCEL);
      serializer.enqueue('end', CODE_OK);
      serializer.enqueue('end', CODE_OK);
      const outcomes: SessionOutcome[] = serializer.drain(manager);
      expect(outcomes.length).assertEqual(4);
      expect(outcomes[0].accepted).assertTrue();
      expect(outcomes[1].accepted).assertFalse();
      expect(outcomes[2].accepted).assertTrue();
      expect(outcomes[3].accepted).assertFalse();
      expect(manager.countInto(PHASE_ACTIVE)).assertEqual(1);
      expect(manager.rejectionCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', manager.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_028, end');
    });

    /**
     * Scenario: the session manager summary is rendered.
     * Expectation: the summary carries the phase, the id and the rejection counter.
     */
    it('Assessment_SessionManagement_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_029, begin');
      manager.reset();
      manager.begin(CODE_OK);
      manager.begin(CODE_OK);
      const summary: string = manager.toString();
      expect(summary).assertContain('SessionManagerModel');
      expect(summary).assertContain('rejections=1');
      expect(summary).assertContain(PHASE_ACTIVE);
      hilog.info(DOMAIN, TAG, '%{public}s', summary);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionManagement_029, end');
    });
  });
}
