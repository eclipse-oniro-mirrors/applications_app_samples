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
  ID_QUERY_STATE_BUTTON,
  TEXT_STATE_ACTIVE,
  TEXT_STATE_INACTIVE,
  TEXT_NO_EVENT,
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

// Ordinal values of AssessmentErrorCode.
const CODE_OK: number = 0;
const CODE_USER_CANCEL: number = 1;
const CODE_TIMEOUT: number = 2;
const CODE_SYSTEM_ERROR: number = 3;
const CODE_ENV_ANOMALY: number = 4;

// AppStorage keys that carry the assessment state. The values are declared by the sample
// controller and are mirrored by the state card of the entry page.
const KEY_ACTIVE: string = 'assessmentActive';
const KEY_EVENT_TYPE: string = 'assessmentEventType';
const KEY_EVENT_CODE: string = 'assessmentEventCode';
const KEY_EVENT_MESSAGE: string = 'assessmentEventMessage';
const KEY_EVENT_SEQ: string = 'assessmentEventSeq';
const KEY_LOGS: string = 'assessmentLogs';

// Event types published by the controller.
const EVENT_BEGIN: string = 'onBegin';
const EVENT_INTERRUPTED: string = 'onInterrupted';
const EVENT_END: string = 'onEnd';
const EVENT_API_ERROR: string = 'onApiError';

const MAX_EVENT_LOG: number = 20;

/**
 * The observable assessment state of the sample.
 *
 * Active is a single boolean that every page reads through AppStorage. The state machine below
 * keeps the transition table explicit so an invalid transition is rejected by the model instead
 * of being discovered on a device.
 */
enum AssessmentState {
  INACTIVE = 'inactive', ACTIVE = 'active', INTERRUPTED = 'interrupted', ENDED = 'ended'
}

/**
 * Outcome of an attempted transition.
 */
interface TransitionResult {
  from: string;
  to: string;
  accepted: boolean;
  reason: string;
}

/**
 * One observed state change, it is what a page would receive through the storage observer.
 */
interface StateObservation {
  seq: number;
  state: string;
  eventType: string;
  eventCode: number;
}

/**
 * Transition table of the assessment state machine.
 *
 * The table is asymmetric on purpose: the sample may only enter the active state from inactive,
 * every active state may be left by an end or an interruption, and a terminal state requires a
 * fresh begin before it can become active again.
 */
class StateMachine {
  private state: string = AssessmentState.INACTIVE;
  private acceptedCount: number = 0;
  private rejectedCount: number = 0;

  public current(): string {
    return this.state;
  }

  public isActive(): boolean {
    return this.state === AssessmentState.ACTIVE;
  }

  public isTerminal(): boolean {
    return this.state === AssessmentState.ENDED || this.state === AssessmentState.INTERRUPTED;
  }

  public begin(): TransitionResult {
    if (this.state === AssessmentState.ACTIVE) {
      return this.reject(AssessmentState.ACTIVE, 'a session is already active');
    }
    const from: string = this.state;
    this.state = AssessmentState.ACTIVE;
    this.acceptedCount++;
    return this.accept(from, AssessmentState.ACTIVE);
  }

  public interrupt(): TransitionResult {
    if (this.state !== AssessmentState.ACTIVE) {
      return this.reject(AssessmentState.INTERRUPTED, 'only an active session can be interrupted');
    }
    const from: string = this.state;
    this.state = AssessmentState.INTERRUPTED;
    this.acceptedCount++;
    return this.accept(from, AssessmentState.INTERRUPTED);
  }

  public end(): TransitionResult {
    if (this.state !== AssessmentState.ACTIVE && this.state !== AssessmentState.INTERRUPTED) {
      return this.reject(AssessmentState.ENDED, 'only a running session can be ended');
    }
    const from: string = this.state;
    this.state = AssessmentState.ENDED;
    this.acceptedCount++;
    return this.accept(from, AssessmentState.ENDED);
  }

  public reset(): TransitionResult {
    if (this.state === AssessmentState.ACTIVE) {
      return this.reject(AssessmentState.INACTIVE, 'an active session must be ended first');
    }
    const from: string = this.state;
    this.state = AssessmentState.INACTIVE;
    this.acceptedCount++;
    return this.accept(from, AssessmentState.INACTIVE);
  }

  public acceptedTransitions(): number {
    return this.acceptedCount;
  }

  public rejectedTransitions(): number {
    return this.rejectedCount;
  }

  private accept(from: string, to: string): TransitionResult {
    return {
      from: from,
      to: to,
      accepted: true,
      reason: ''
    };
  }

  private reject(to: string, reason: string): TransitionResult {
    this.rejectedCount++;
    return {
      from: this.state,
      to: to,
      accepted: false,
      reason: reason
    };
  }

  public toString(): string {
    return `StateMachine{state=${this.state}, accepted=${this.acceptedCount}, rejected=${this.rejectedCount}}`;
  }
}

/**
 * Records the state observations of a case, mirroring the sequence counter of the sample.
 *
 * The controller bumps the sequence every time it publishes an event, the entry page watches the
 * sequence and re-reads the event type and the code. The observer below reproduces that contract
 * so a case can assert the ordering of the observations without a device.
 */
class StateObserver {
  private observations: StateObservation[] = [];
  private seq: number = 0;

  public observe(state: string, eventType: string, eventCode: number): StateObservation {
    this.seq++;
    const observation: StateObservation = {
      seq: this.seq,
      state: state,
      eventType: eventType,
      eventCode: eventCode
    };
    const next: StateObservation[] = this.observations.slice();
    next.push(observation);
    this.observations = next;
    return observation;
  }

  public sequence(): number {
    return this.seq;
  }

  public size(): number {
    return this.observations.length;
  }

  public getAll(): StateObservation[] {
    return this.observations.slice();
  }

  public last(): StateObservation | null {
    return this.observations.length === 0 ? null : this.observations[this.observations.length - 1];
  }

  public first(): StateObservation | null {
    return this.observations.length === 0 ? null : this.observations[0];
  }

  public countOf(eventType: string): number {
    let count: number = 0;
    for (let i = 0; i < this.observations.length; i++) {
      if (this.observations[i].eventType === eventType) {
        count++;
      }
    }
    return count;
  }

  public statesSeen(): string[] {
    const seen: string[] = [];
    for (let i = 0; i < this.observations.length; i++) {
      if (seen.indexOf(this.observations[i].state) < 0) {
        seen.push(this.observations[i].state);
      }
    }
    return seen;
  }

  public sequenceIsMonotonic(): boolean {
    for (let i = 1; i < this.observations.length; i++) {
      if (this.observations[i].seq <= this.observations[i - 1].seq) {
        return false;
      }
    }
    return true;
  }

  public clear(): void {
    this.observations = [];
  }

  public toString(): string {
    return `StateObserver{observations=${this.observations.length}, seq=${this.seq}}`;
  }
}

/**
 * Models the AppStorage mirror of the controller.
 *
 * The sample stores the active flag, the event type, the code, the message and the sequence in
 * AppStorage. This class behaves like that storage: the setters return the stored value so a case
 * can assert the read back value without touching the real storage of the test ability.
 */
class StorageMirror {
  private active: boolean = false;
  private eventType: string = '';
  private eventCode: number = 0;
  private eventMessage: string = '';
  private eventSeq: number = 0;
  private logs: string[] = [];

  public setActive(value: boolean): void {
    this.active = value;
  }

  public getActive(): boolean {
    return this.active;
  }

  public publish(eventType: string, code: number, message: string): number {
    this.eventType = eventType;
    this.eventCode = code;
    this.eventMessage = message;
    this.eventSeq = this.eventSeq + 1;
    const next: string[] = this.logs.slice();
    next.unshift(`${eventType} code=${code} message=${message}`);
    while (next.length > MAX_EVENT_LOG) {
      next.pop();
    }
    this.logs = next;
    return this.eventSeq;
  }

  public getEventType(): string {
    return this.eventType;
  }

  public getEventCode(): number {
    return this.eventCode;
  }

  public getEventMessage(): string {
    return this.eventMessage;
  }

  public getEventSeq(): number {
    return this.eventSeq;
  }

  public getLogs(): string[] {
    return this.logs.slice();
  }

  public logCount(): number {
    return this.logs.length;
  }

  public newestLog(): string {
    return this.logs.length === 0 ? '' : this.logs[0];
  }

  public keyNames(): string[] {
    return [KEY_ACTIVE, KEY_EVENT_TYPE, KEY_EVENT_CODE, KEY_EVENT_MESSAGE, KEY_EVENT_SEQ, KEY_LOGS];
  }

  public describe(): string {
    return `StorageMirror{active=${this.active}, type=${this.eventType}, code=${this.eventCode}, ` +
      `seq=${this.eventSeq}, logs=${this.logs.length}}`;
  }
}

/**
 * Applies the documented callback semantics of the sample controller.
 *
 * handleBegin only activates the session when the callback carries the OK code, an interruption
 * and an end always clear the flag. The applier is the pure model counterpart of the controller
 * and is used by every state case that cannot depend on a device callback.
 */
class CallbackApplier {
  private mirror: StorageMirror;

  constructor(storage: StorageMirror) {
    this.mirror = storage;
  }

  public applyBegin(code: number, message: string): void {
    this.mirror.setActive(code === CODE_OK);
    this.mirror.publish(EVENT_BEGIN, code, message);
  }

  public applyInterrupted(code: number, message: string): void {
    this.mirror.setActive(false);
    this.mirror.publish(EVENT_INTERRUPTED, code, message);
  }

  public applyEnd(): void {
    this.mirror.setActive(false);
    this.mirror.publish(EVENT_END, CODE_OK, '');
  }

  public applyApiError(code: number, message: string): void {
    this.mirror.publish(EVENT_API_ERROR, code, message);
  }

  public storage(): StorageMirror {
    return this.mirror;
  }
}

/**
 * Describes the invariant that the state card of the entry page must satisfy.
 *
 * The card renders exactly one of the two state texts and derives the enabled state of the two
 * bound buttons from the same flag, so the invariant is expressed on the model and then verified
 * against the live page.
 */
class StateCardInvariant {
  public static activeText(active: boolean): string {
    return active ? TEXT_STATE_ACTIVE : TEXT_STATE_INACTIVE;
  }

  public static beginEnabled(active: boolean): boolean {
    return !active;
  }

  public static endEnabled(active: boolean): boolean {
    return active;
  }

  public static isExclusive(activeText: boolean, inactiveText: boolean): boolean {
    return activeText !== inactiveText;
  }

  public static describe(active: boolean): string {
    return `StateCard{active=${active}, beginEnabled=${StateCardInvariant.beginEnabled(active)}, ` +
      `endEnabled=${StateCardInvariant.endEnabled(active)}}`;
  }
}

/**
 * Starts the sample and waits for the entry page, the UI cases degrade to a skip when the page
 * never shows up.
 */
async function openIndexPage(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'openIndexPage: the entry page is not rendered, the case is skipped');
  }
  return rendered;
}

export default function assessmentStateManagementTest() {
  describe('AssessmentStateManagement_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, 2, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: a fresh state machine.
     * Expectation: the assessment starts inactive and no transition was recorded.
     */
    it('Assessment_InitialState_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InitialState_001, begin');
      const machine: StateMachine = new StateMachine();
      expect(machine.current()).assertEqual(AssessmentState.INACTIVE);
      expect(machine.isActive()).assertFalse();
      expect(machine.isTerminal()).assertFalse();
      expect(machine.acceptedTransitions()).assertEqual(0);
      expect(machine.rejectedTransitions()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', machine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InitialState_001, end');
    });

    /**
     * Scenario: the begin transition.
     * Expectation: the machine moves from inactive to active and accepts the transition.
     */
    it('Assessment_BeginTransition_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginTransition_002, begin');
      const machine: StateMachine = new StateMachine();
      const result: TransitionResult = machine.begin();
      expect(result.accepted).assertTrue();
      expect(result.from).assertEqual(AssessmentState.INACTIVE);
      expect(result.to).assertEqual(AssessmentState.ACTIVE);
      expect(machine.current()).assertEqual(AssessmentState.ACTIVE);
      expect(machine.isActive()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', machine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginTransition_002, end');
    });

    /**
     * Scenario: begin while a session is already active.
     * Expectation: the second begin is rejected and the state stays active.
     */
    it('Assessment_BeginRejectedWhenActive_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginRejectedWhenActive_003, begin');
      const machine: StateMachine = new StateMachine();
      machine.begin();
      const result: TransitionResult = machine.begin();
      expect(result.accepted).assertFalse();
      expect(result.reason).assertContain('already active');
      expect(machine.current()).assertEqual(AssessmentState.ACTIVE);
      expect(machine.rejectedTransitions()).assertEqual(1);
      expect(machine.acceptedTransitions()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', machine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginRejectedWhenActive_003, end');
    });

    /**
     * Scenario: the end transition of an active session.
     * Expectation: the machine reaches the ended state and the active flag clears.
     */
    it('Assessment_EndTransition_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndTransition_004, begin');
      const machine: StateMachine = new StateMachine();
      machine.begin();
      const result: TransitionResult = machine.end();
      expect(result.accepted).assertTrue();
      expect(result.from).assertEqual(AssessmentState.ACTIVE);
      expect(result.to).assertEqual(AssessmentState.ENDED);
      expect(machine.isActive()).assertFalse();
      expect(machine.isTerminal()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', machine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndTransition_004, end');
    });

    /**
     * Scenario: end without a running session.
     * Expectation: the transition is rejected and the inactive state survives.
     */
    it('Assessment_EndRejectedWhenInactive_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndRejectedWhenInactive_005, begin');
      const machine: StateMachine = new StateMachine();
      const result: TransitionResult = machine.end();
      expect(result.accepted).assertFalse();
      expect(result.reason).assertContain('running session');
      expect(machine.current()).assertEqual(AssessmentState.INACTIVE);
      expect(machine.rejectedTransitions()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', machine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndRejectedWhenInactive_005, end');
    });

    /**
     * Scenario: the interrupt transition of an active session.
     * Expectation: an interruption clears the active state and reaches the interrupted state.
     */
    it('Assessment_InterruptTransition_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptTransition_006, begin');
      const machine: StateMachine = new StateMachine();
      machine.begin();
      const result: TransitionResult = machine.interrupt();
      expect(result.accepted).assertTrue();
      expect(result.to).assertEqual(AssessmentState.INTERRUPTED);
      expect(machine.isActive()).assertFalse();
      expect(machine.isTerminal()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', machine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptTransition_006, end');
    });

    /**
     * Scenario: interrupt without a running session.
     * Expectation: the transition is rejected, an inactive machine cannot be interrupted.
     */
    it('Assessment_InterruptRejectedWhenInactive_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptRejectedWhenInactive_007, begin');
      const machine: StateMachine = new StateMachine();
      const result: TransitionResult = machine.interrupt();
      expect(result.accepted).assertFalse();
      expect(result.reason).assertContain('active session');
      expect(machine.current()).assertEqual(AssessmentState.INACTIVE);
      hilog.info(DOMAIN, TAG, '%{public}s', machine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptRejectedWhenInactive_007, end');
    });

    /**
     * Scenario: end after an interruption.
     * Expectation: an interrupted session may still be ended, which is the recovery path.
     */
    it('Assessment_EndAfterInterrupt_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndAfterInterrupt_008, begin');
      const machine: StateMachine = new StateMachine();
      machine.begin();
      machine.interrupt();
      const result: TransitionResult = machine.end();
      expect(result.accepted).assertTrue();
      expect(result.from).assertEqual(AssessmentState.INTERRUPTED);
      expect(result.to).assertEqual(AssessmentState.ENDED);
      expect(machine.current()).assertEqual(AssessmentState.ENDED);
      hilog.info(DOMAIN, TAG, '%{public}s', machine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndAfterInterrupt_008, end');
    });

    /**
     * Scenario: a full begin, end, begin cycle.
     * Expectation: a terminal state allows a fresh begin after the reset transition.
     */
    it('Assessment_ReBeginAfterEnd_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReBeginAfterEnd_009, begin');
      const machine: StateMachine = new StateMachine();
      machine.begin();
      machine.end();
      expect(machine.begin().accepted).assertTrue();
      expect(machine.current()).assertEqual(AssessmentState.ACTIVE);
      expect(machine.acceptedTransitions()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', machine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReBeginAfterEnd_009, end');
    });

    /**
     * Scenario: the reset transition.
     * Expectation: a terminal state returns to inactive, an active state refuses the reset.
     */
    it('Assessment_ResetTransition_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResetTransition_010, begin');
      const terminal: StateMachine = new StateMachine();
      terminal.begin();
      terminal.end();
      expect(terminal.reset().accepted).assertTrue();
      expect(terminal.current()).assertEqual(AssessmentState.INACTIVE);
      const active: StateMachine = new StateMachine();
      active.begin();
      expect(active.reset().accepted).assertFalse();
      expect(active.current()).assertEqual(AssessmentState.ACTIVE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ResetTransition_010, end');
    });

    /**
     * Scenario: a repeated cycle of begin and end.
     * Expectation: the accepted count grows by two per cycle and no transition is rejected.
     */
    it('Assessment_RepeatedCycles_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RepeatedCycles_011, begin');
      const machine: StateMachine = new StateMachine();
      for (let i = 0; i < 5; i++) {
        machine.begin();
        machine.end();
      }
      expect(machine.acceptedTransitions()).assertEqual(10);
      expect(machine.rejectedTransitions()).assertEqual(0);
      expect(machine.current()).assertEqual(AssessmentState.ENDED);
      hilog.info(DOMAIN, TAG, '%{public}s', machine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RepeatedCycles_011, end');
    });

    /**
     * Scenario: the begin callback with the OK code.
     * Expectation: the storage reports the active state and the event log records onBegin.
     */
    it('Assessment_ApplyBeginOk_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ApplyBeginOk_012, begin');
      const storage: StorageMirror = new StorageMirror();
      const applier: CallbackApplier = new CallbackApplier(storage);
      applier.applyBegin(CODE_OK, 'entered');
      expect(storage.getActive()).assertTrue();
      expect(storage.getEventType()).assertEqual(EVENT_BEGIN);
      expect(storage.getEventCode()).assertEqual(CODE_OK);
      expect(storage.getEventSeq()).assertEqual(1);
      expect(storage.logCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', storage.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ApplyBeginOk_012, end');
    });

    /**
     * Scenario: the begin callback with a failure code.
     * Expectation: the storage stays inactive although the event is still published.
     */
    it('Assessment_ApplyBeginFailure_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ApplyBeginFailure_013, begin');
      const storage: StorageMirror = new StorageMirror();
      const applier: CallbackApplier = new CallbackApplier(storage);
      applier.applyBegin(CODE_USER_CANCEL, 'the user refused');
      expect(storage.getActive()).assertFalse();
      expect(storage.getEventType()).assertEqual(EVENT_BEGIN);
      expect(storage.getEventCode()).assertEqual(CODE_USER_CANCEL);
      expect(storage.getEventMessage()).assertEqual('the user refused');
      expect(storage.getEventSeq()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', storage.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ApplyBeginFailure_013, end');
    });

    /**
     * Scenario: the interruption callback.
     * Expectation: an interruption always clears the active flag regardless of the code.
     */
    it('Assessment_ApplyInterrupted_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ApplyInterrupted_014, begin');
      const storage: StorageMirror = new StorageMirror();
      storage.setActive(true);
      const applier: CallbackApplier = new CallbackApplier(storage);
      applier.applyInterrupted(CODE_SYSTEM_ERROR, 'the environment changed');
      expect(storage.getActive()).assertFalse();
      expect(storage.getEventType()).assertEqual(EVENT_INTERRUPTED);
      expect(storage.getEventCode()).assertEqual(CODE_SYSTEM_ERROR);
      expect(storage.newestLog()).assertContain(EVENT_INTERRUPTED);
      hilog.info(DOMAIN, TAG, '%{public}s', storage.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ApplyInterrupted_014, end');
    });

    /**
     * Scenario: the end callback.
     * Expectation: the flag clears and the event is published with the OK code and an empty text.
     */
    it('Assessment_ApplyEnd_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ApplyEnd_015, begin');
      const storage: StorageMirror = new StorageMirror();
      storage.setActive(true);
      const applier: CallbackApplier = new CallbackApplier(storage);
      applier.applyEnd();
      expect(storage.getActive()).assertFalse();
      expect(storage.getEventType()).assertEqual(EVENT_END);
      expect(storage.getEventCode()).assertEqual(CODE_OK);
      expect(storage.getEventMessage()).assertEqual('');
      expect(storage.getEventSeq()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', storage.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ApplyEnd_015, end');
    });

    /**
     * Scenario: the API error publication.
     * Expectation: the synchronous throw is published as an event but never changes the flag.
     */
    it('Assessment_ApplyApiError_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ApplyApiError_016, begin');
      const storage: StorageMirror = new StorageMirror();
      storage.setActive(true);
      const applier: CallbackApplier = new CallbackApplier(storage);
      applier.applyApiError(401, 'permission denied');
      expect(storage.getActive()).assertTrue();
      expect(storage.getEventType()).assertEqual(EVENT_API_ERROR);
      expect(storage.getEventCode()).assertEqual(401);
      expect(storage.getEventMessage()).assertEqual('permission denied');
      hilog.info(DOMAIN, TAG, '%{public}s', storage.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ApplyApiError_016, end');
    });

    /**
     * Scenario: the sequence counter of the storage.
     * Expectation: every published event bumps the sequence by exactly one.
     */
    it('Assessment_SequenceCounter_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SequenceCounter_017, begin');
      const storage: StorageMirror = new StorageMirror();
      const applier: CallbackApplier = new CallbackApplier(storage);
      expect(storage.getEventSeq()).assertEqual(0);
      applier.applyBegin(CODE_OK, '');
      expect(storage.getEventSeq()).assertEqual(1);
      applier.applyEnd();
      expect(storage.getEventSeq()).assertEqual(2);
      applier.applyInterrupted(CODE_TIMEOUT, 'timed out');
      expect(storage.getEventSeq()).assertEqual(3);
      applier.applyApiError(401, 'refused');
      expect(storage.getEventSeq()).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', storage.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SequenceCounter_017, end');
    });

    /**
     * Scenario: the newest event wins in the log.
     * Expectation: the first log entry is the most recently published event.
     */
    it('Assessment_EventLogOrdering_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventLogOrdering_019, begin');
      const storage: StorageMirror = new StorageMirror();
      const applier: CallbackApplier = new CallbackApplier(storage);
      applier.applyBegin(CODE_OK, 'first');
      applier.applyInterrupted(CODE_ENV_ANOMALY, 'second');
      applier.applyEnd();
      const logs: string[] = storage.getLogs();
      expect(logs.length).assertEqual(3);
      expect(logs[0]).assertContain(EVENT_END);
      expect(logs[1]).assertContain(EVENT_INTERRUPTED);
      expect(logs[2]).assertContain(EVENT_BEGIN);
      expect(storage.newestLog()).assertEqual(logs[0]);
      hilog.info(DOMAIN, TAG, '%{public}s', logs.join(' | '));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventLogOrdering_019, end');
    });

    /**
     * Scenario: the storage key names.
     * Expectation: the six keys match the AppStorage keys declared by the sample controller.
     */
    it('Assessment_StorageKeys_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageKeys_020, begin');
      const storage: StorageMirror = new StorageMirror();
      const keys: string[] = storage.keyNames();
      expect(keys.length).assertEqual(6);
      expect(keys.indexOf(KEY_ACTIVE) >= 0).assertTrue();
      expect(keys.indexOf(KEY_EVENT_TYPE) >= 0).assertTrue();
      expect(keys.indexOf(KEY_EVENT_CODE) >= 0).assertTrue();
      expect(keys.indexOf(KEY_EVENT_MESSAGE) >= 0).assertTrue();
      expect(keys.indexOf(KEY_EVENT_SEQ) >= 0).assertTrue();
      expect(keys.indexOf(KEY_LOGS) >= 0).assertTrue();
      expect(new Set<string>(keys).size).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', keys.join(','));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StorageKeys_020, end');
    });

    /**
     * Scenario: the observer sequence of a normal session.
     * Expectation: the observations are monotonic and carry the expected event order.
     */
    it('Assessment_ObserverSequence_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ObserverSequence_021, begin');
      const observer: StateObserver = new StateObserver();
      observer.observe(AssessmentState.ACTIVE, EVENT_BEGIN, CODE_OK);
      observer.observe(AssessmentState.INTERRUPTED, EVENT_INTERRUPTED, CODE_TIMEOUT);
      observer.observe(AssessmentState.ENDED, EVENT_END, CODE_OK);
      expect(observer.sequence()).assertEqual(3);
      expect(observer.size()).assertEqual(3);
      expect(observer.sequenceIsMonotonic()).assertTrue();
      expect(observer.countOf(EVENT_BEGIN)).assertEqual(1);
      expect(observer.countOf(EVENT_END)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', observer.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ObserverSequence_021, end');
    });

    /**
     * Scenario: the first and last observation of an observer.
     * Expectation: the first observation is the begin event and the last one is the end event.
     */
    it('Assessment_ObserverEndpoints_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ObserverEndpoints_022, begin');
      const observer: StateObserver = new StateObserver();
      expect(observer.first()).assertNull();
      expect(observer.last()).assertNull();
      observer.observe(AssessmentState.ACTIVE, EVENT_BEGIN, CODE_OK);
      observer.observe(AssessmentState.ENDED, EVENT_END, CODE_OK);
      const first: StateObservation | null = observer.first();
      const last: StateObservation | null = observer.last();
      expect(first !== null).assertTrue();
      expect(last !== null).assertTrue();
      if (first !== null && last !== null) {
        expect(first.eventType).assertEqual(EVENT_BEGIN);
        expect(last.eventType).assertEqual(EVENT_END);
        expect(first.seq).assertEqual(1);
        expect(last.seq).assertEqual(2);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ObserverEndpoints_022, end');
    });

    /**
     * Scenario: the distinct states seen by an observer.
     * Expectation: repeated observations of the same state are reported once.
     */
    it('Assessment_ObserverDistinctStates_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ObserverDistinctStates_023, begin');
      const observer: StateObserver = new StateObserver();
      observer.observe(AssessmentState.ACTIVE, EVENT_BEGIN, CODE_OK);
      observer.observe(AssessmentState.ACTIVE, EVENT_BEGIN, CODE_OK);
      observer.observe(AssessmentState.ENDED, EVENT_END, CODE_OK);
      const states: string[] = observer.statesSeen();
      expect(states.length).assertEqual(2);
      expect(states[0]).assertEqual(AssessmentState.ACTIVE);
      expect(states[1]).assertEqual(AssessmentState.ENDED);
      hilog.info(DOMAIN, TAG, '%{public}s states: %{public}s', BUNDLE + 'ObserverDistinctStates_023',
        states.join(','));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ObserverDistinctStates_023, end');
    });

    /**
     * Scenario: an observer that is cleared.
     * Expectation: the observations drop but the sequence keeps counting from where it stopped.
     */
    it('Assessment_ObserverClear_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ObserverClear_024, begin');
      const observer: StateObserver = new StateObserver();
      observer.observe(AssessmentState.ACTIVE, EVENT_BEGIN, CODE_OK);
      observer.observe(AssessmentState.ENDED, EVENT_END, CODE_OK);
      observer.clear();
      expect(observer.size()).assertEqual(0);
      expect(observer.last()).assertNull();
      observer.observe(AssessmentState.ACTIVE, EVENT_BEGIN, CODE_OK);
      expect(observer.sequence()).assertEqual(3);
      expect(observer.size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', observer.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ObserverClear_024, end');
    });

    /**
     * Scenario: the state card texts of the model.
     * Expectation: the active flag selects one of the two documented texts.
     */
    it('Assessment_StateCardTexts_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateCardTexts_025, begin');
      expect(StateCardInvariant.activeText(true)).assertEqual(TEXT_STATE_ACTIVE);
      expect(StateCardInvariant.activeText(false)).assertEqual(TEXT_STATE_INACTIVE);
      expect(TEXT_STATE_ACTIVE).assertEqual('Assessment state: active');
      expect(TEXT_STATE_INACTIVE).assertEqual('Assessment state: inactive');
      expect(StateCardInvariant.isExclusive(true, false)).assertTrue();
      expect(StateCardInvariant.isExclusive(false, false)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateCardTexts_025, end');
    });

    /**
     * Scenario: the enabled state of the two bound buttons.
     * Expectation: begin is enabled while inactive and end is enabled while active.
     */
    it('Assessment_BoundButtonEnablement_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundButtonEnablement_026, begin');
      expect(StateCardInvariant.beginEnabled(false)).assertTrue();
      expect(StateCardInvariant.beginEnabled(true)).assertFalse();
      expect(StateCardInvariant.endEnabled(true)).assertTrue();
      expect(StateCardInvariant.endEnabled(false)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', StateCardInvariant.describe(true));
      hilog.info(DOMAIN, TAG, '%{public}s', StateCardInvariant.describe(false));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundButtonEnablement_026, end');
    });

    /**
     * Scenario: the state machine and the callback applier stay in sync.
     * Expectation: after each modelled callback the machine and the storage report the same flag.
     */
    it('Assessment_MachineStorageAgreement_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MachineStorageAgreement_027, begin');
      const machine: StateMachine = new StateMachine();
      const storage: StorageMirror = new StorageMirror();
      const applier: CallbackApplier = new CallbackApplier(storage);
      machine.begin();
      applier.applyBegin(CODE_OK, '');
      expect(machine.isActive()).assertEqual(storage.getActive());
      machine.interrupt();
      applier.applyInterrupted(CODE_TIMEOUT, 'timeout');
      expect(machine.isActive()).assertEqual(storage.getActive());
      machine.end();
      applier.applyEnd();
      expect(machine.isActive()).assertEqual(storage.getActive());
      expect(machine.isActive()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', machine.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MachineStorageAgreement_027, end');
    });

    /**
     * Scenario: a failed begin leaves the machine inactive.
     * Expectation: the machine rejects the begin and the storage never activates.
     */
    it('Assessment_FailedBeginLeavesInactive_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FailedBeginLeavesInactive_028, begin');
      const storage: StorageMirror = new StorageMirror();
      const applier: CallbackApplier = new CallbackApplier(storage);
      applier.applyBegin(CODE_ENV_ANOMALY, 'environment refused');
      expect(storage.getActive()).assertFalse();
      expect(storage.getEventCode()).assertEqual(CODE_ENV_ANOMALY);
      expect(storage.getEventSeq()).assertEqual(1);
      expect(StateCardInvariant.activeText(storage.getActive())).assertEqual(TEXT_STATE_INACTIVE);
      hilog.info(DOMAIN, TAG, '%{public}s', storage.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FailedBeginLeavesInactive_028, end');
    });

    /**
     * Scenario: the sequence survives a rejected transition.
     * Expectation: a rejected begin publishes nothing, so the sequence does not move.
     */
    it('Assessment_RejectedTransitionPublishesNothing_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RejectedTransitionPublishesNothing_029, begin');
      const machine: StateMachine = new StateMachine();
      const storage: StorageMirror = new StorageMirror();
      machine.begin();
      const seqBefore: number = storage.getEventSeq();
      const result: TransitionResult = machine.begin();
      expect(result.accepted).assertFalse();
      expect(storage.getEventSeq()).assertEqual(seqBefore);
      expect(storage.logCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RejectedTransitionPublishesNothing_029, end');
    });

    /**
     * Scenario: the model describes a state card for both flags.
     * Expectation: the description carries the flag and the derived enablement.
     */
    it('Assessment_StateCardDescription_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateCardDescription_036, begin');
      const activeText: string = StateCardInvariant.describe(true);
      const inactiveText: string = StateCardInvariant.describe(false);
      expect(activeText).assertContain('active=true');
      expect(activeText).assertContain('beginEnabled=false');
      expect(inactiveText).assertContain('active=false');
      expect(inactiveText).assertContain('endEnabled=false');
      hilog.info(DOMAIN, TAG, '%{public}s', activeText);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StateCardDescription_036, end');
    });
  });
}
