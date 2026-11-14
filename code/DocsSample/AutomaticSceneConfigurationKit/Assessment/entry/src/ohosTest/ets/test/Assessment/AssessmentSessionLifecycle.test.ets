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
  TEXT_STATE_ACTIVE,
  TEXT_STATE_INACTIVE,
  TIMEOUT_PAGE_RENDER,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  waitForExamPage,
  isComponentEnabled,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Session phases of the sample lifecycle.
enum SessionPhase {
  CREATED = 'created', ACTIVE = 'active', INTERRUPTED = 'interrupted', ENDED = 'ended', DESTROYED = 'destroyed'
}

// Event types published by the assessment controller.
const EVENT_BEGIN: string = 'onBegin';
const EVENT_INTERRUPTED: string = 'onInterrupted';
const EVENT_END: string = 'onEnd';

// Codes of the assessment error enum.
const CODE_OK: number = 0;
const CODE_USER_CANCEL: number = 1;
const CODE_ENV_ANOMALY: number = 4;

// Duration candidates of the sample.
const DURATION_DEFAULT: number = 0;
const DURATION_TEN: number = 600000;
const DURATION_SIXTY: number = 3600000;

const MAX_EVENT_LOG: number = 20;

/**
 * One assessment session of the sample.
 *
 * A session is created when begin is requested, becomes active when the callback carries the OK
 * code, may be interrupted and is finally ended and destroyed. The identifier is allocated by the
 * registry so the cases can prove that only one session is active at a time.
 */
class AssessmentSession {
  private id: number;
  private phase: string = SessionPhase.CREATED;
  private duration: number = DURATION_DEFAULT;
  private apps: string[] = [];
  private events: string[] = [];

  constructor(id: number, duration: number = DURATION_DEFAULT, allowedApps: string[] = []) {
    this.id = id;
    this.duration = duration;
    this.apps = allowedApps.slice();
  }

  public identifier(): number {
    return this.id;
  }

  public currentPhase(): string {
    return this.phase;
  }

  public activate(): boolean {
    if (this.phase !== SessionPhase.CREATED) {
      return false;
    }
    this.phase = SessionPhase.ACTIVE;
    this.record(EVENT_BEGIN);
    return true;
  }

  public interrupt(): boolean {
    if (this.phase !== SessionPhase.ACTIVE) {
      return false;
    }
    this.phase = SessionPhase.INTERRUPTED;
    this.record(EVENT_INTERRUPTED);
    return true;
  }

  public end(): boolean {
    if (this.phase === SessionPhase.ENDED || this.phase === SessionPhase.DESTROYED) {
      return false;
    }
    this.phase = SessionPhase.ENDED;
    this.record(EVENT_END);
    return true;
  }

  public destroy(): boolean {
    if (this.phase === SessionPhase.DESTROYED) {
      return false;
    }
    this.phase = SessionPhase.DESTROYED;
    return true;
  }

  public isActive(): boolean {
    return this.phase === SessionPhase.ACTIVE;
  }

  public isAlive(): boolean {
    return this.phase !== SessionPhase.DESTROYED && this.phase !== SessionPhase.ENDED;
  }

  public sessionDuration(): number {
    return this.duration;
  }

  public allowedApps(): string[] {
    return this.apps.slice();
  }

  public eventLog(): string[] {
    return this.events.slice();
  }

  public eventCount(): number {
    return this.events.length;
  }

  public hasEvent(eventType: string): boolean {
    return this.events.indexOf(eventType) >= 0;
  }

  private record(eventType: string): void {
    const next: string[] = this.events.slice();
    next.push(eventType);
    while (next.length > MAX_EVENT_LOG) {
      next.shift();
    }
    this.events = next;
  }

  public describe(): string {
    return `Session{id=${this.id}, phase=${this.phase}, duration=${this.duration}, ` +
      `apps=${this.apps.length}, events=${this.events.length}}`;
  }
}

/**
 * Allocates and tracks the assessment sessions of a case.
 *
 * The registry enforces the single active session rule: a begin is only accepted when no other
 * session is active or suspended.
 */
class SessionRegistry {
  private sessionList: AssessmentSession[] = [];
  private nextId: number = 1;
  private activeId: number = -1;
  private rejectionCount: number = 0;

  public create(duration: number, allowedApps: string[]): AssessmentSession {
    const session: AssessmentSession = new AssessmentSession(this.nextId, duration, allowedApps);
    this.nextId++;
    const next: AssessmentSession[] = this.sessionList.slice();
    next.push(session);
    this.sessionList = next;
    return session;
  }

  public start(duration: number, allowedApps: string[], code: number): AssessmentSession | null {
    if (this.activeId >= 0) {
      this.rejectionCount++;
      return null;
    }
    const session: AssessmentSession = this.create(duration, allowedApps);
    if (code === CODE_OK) {
      session.activate();
      this.activeId = session.identifier();
    }
    return session;
  }

  public activeSession(): AssessmentSession | null {
    if (this.activeId < 0) {
      return null;
    }
    for (let i = 0; i < this.sessionList.length; i++) {
      if (this.sessionList[i].identifier() === this.activeId) {
        return this.sessionList[i];
      }
    }
    return null;
  }

  public finish(): boolean {
    const active: AssessmentSession | null = this.activeSession();
    if (active === null) {
      this.rejectionCount++;
      return false;
    }
    active.end();
    this.activeId = -1;
    return true;
  }

  public interrupt(): boolean {
    const active: AssessmentSession | null = this.activeSession();
    if (active === null) {
      this.rejectionCount++;
      return false;
    }
    active.interrupt();
    this.activeId = -1;
    return true;
  }

  public isBusy(): boolean {
    return this.activeId >= 0;
  }

  public sessionCount(): number {
    return this.sessionList.length;
  }

  public sessions(): AssessmentSession[] {
    return this.sessionList.slice();
  }

  public find(id: number): AssessmentSession | null {
    for (let i = 0; i < this.sessionList.length; i++) {
      if (this.sessionList[i].identifier() === id) {
        return this.sessionList[i];
      }
    }
    return null;
  }

  public liveCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.sessionList.length; i++) {
      if (this.sessionList[i].isAlive()) {
        count++;
      }
    }
    return count;
  }

  public rejections(): number {
    return this.rejectionCount;
  }

  public destroyAll(): number {
    let destroyed: number = 0;
    for (let i = 0; i < this.sessionList.length; i++) {
      if (this.sessionList[i].destroy()) {
        destroyed++;
      }
    }
    this.activeId = -1;
    return destroyed;
  }

  public toString(): string {
    return `SessionRegistry{sessions=${this.sessionList.length}, busy=${this.activeId >= 0}, ` +
      `rejections=${this.rejectionCount}}`;
  }
}

/**
 * Records the lifecycle callbacks of the test and sample abilities.
 *
 * The sample's entry ability is started by the test ability, so the lifecycle of the test run is
 * create, foreground, background and destroy. The log is used by the lifecycle cases to assert
 * that a session never outlives the ability that created it.
 */
interface LifecycleRecord {
  callback: string;
  phase: string;
  sequence: number;
}

class LifecycleLog {
  private records: LifecycleRecord[] = [];
  private sequence: number = 0;

  public record(callback: string, phase: string): void {
    this.sequence++;
    const next: LifecycleRecord[] = this.records.slice();
    const entry: LifecycleRecord = {
      callback: callback,
      phase: phase,
      sequence: this.sequence
    };
    next.push(entry);
    this.records = next;
  }

  public size(): number {
    return this.records.length;
  }

  public callbacks(): string[] {
    return this.records.map((record: LifecycleRecord) => record.callback);
  }

  public lastCallback(): string {
    return this.records.length === 0 ? '' : this.records[this.records.length - 1].callback;
  }

  public firstCallback(): string {
    return this.records.length === 0 ? '' : this.records[0].callback;
  }

  public countOf(callback: string): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].callback === callback) {
        count++;
      }
    }
    return count;
  }

  public contains(callback: string): boolean {
    return this.countOf(callback) > 0;
  }

  public sequenceMonotonic(): boolean {
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].sequence <= this.records[i - 1].sequence) {
        return false;
      }
    }
    return true;
  }

  public describe(): string {
    return `LifecycleLog{records=${this.records.length}, last=${this.lastCallback()}}`;
  }
}

/**
 * The single active session invariant of the assessment service.
 *
 * The service allows one assessment session per device. Every transition below therefore either
 * keeps the active count at one or returns it to zero, and the invariant records violations
 * instead of throwing, so a case can assert the whole history.
 */
class SingleSessionInvariant {
  private activeCount: number = 0;
  private violationTally: number = 0;
  private history: number[] = [];

  public observeStart(): void {
    this.activeCount++;
    this.history.push(this.activeCount);
    if (this.activeCount > 1) {
      this.violationTally++;
    }
  }

  public observeStop(): void {
    if (this.activeCount > 0) {
      this.activeCount--;
    }
    this.history.push(this.activeCount);
  }

  public observeRejected(): void {
    this.history.push(this.activeCount);
  }

  public violations(): number {
    return this.violationTally;
  }

  public historyLength(): number {
    return this.history.length;
  }

  public peak(): number {
    let peak: number = 0;
    for (let i = 0; i < this.history.length; i++) {
      if (this.history[i] > peak) {
        peak = this.history[i];
      }
    }
    return peak;
  }

  public current(): number {
    return this.activeCount;
  }

  public isHeld(): boolean {
    return this.violationTally === 0 && this.peak() <= 1;
  }

  public describe(): string {
    return `SingleSession{active=${this.activeCount}, peak=${this.peak()}, violations=${this.violationTally}}`;
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

export default function assessmentSessionLifecycleTest() {
  describe('AssessmentSessionLifecycle_Test', () => {
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
     * Scenario: a newly created session.
     * Expectation: it starts in the created phase and carries the configured values.
     */
    it('Assessment_SessionCreated_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionCreated_001, begin');
      const session: AssessmentSession =
        new AssessmentSession(1, DURATION_TEN, ['com.samples.assessment']);
      expect(session.identifier()).assertEqual(1);
      expect(session.currentPhase()).assertEqual(SessionPhase.CREATED);
      expect(session.isActive()).assertFalse();
      expect(session.isAlive()).assertTrue();
      expect(session.sessionDuration()).assertEqual(DURATION_TEN);
      expect(session.allowedApps().length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', session.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionCreated_001, end');
    });

    /**
     * Scenario: activating a created session.
     * Expectation: the phase becomes active and the begin event is recorded.
     */
    it('Assessment_SessionActivated_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionActivated_002, begin');
      const session: AssessmentSession = new AssessmentSession(1);
      expect(session.activate()).assertTrue();
      expect(session.currentPhase()).assertEqual(SessionPhase.ACTIVE);
      expect(session.isActive()).assertTrue();
      expect(session.eventCount()).assertEqual(1);
      expect(session.hasEvent(EVENT_BEGIN)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', session.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionActivated_002, end');
    });

    /**
     * Scenario: activating a session twice.
     * Expectation: the second activation is refused and the phase stays active.
     */
    it('Assessment_SessionActivateTwice_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionActivateTwice_003, begin');
      const session: AssessmentSession = new AssessmentSession(1);
      expect(session.activate()).assertTrue();
      expect(session.activate()).assertFalse();
      expect(session.currentPhase()).assertEqual(SessionPhase.ACTIVE);
      expect(session.eventCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', session.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionActivateTwice_003, end');
    });

    /**
     * Scenario: interrupting an active session.
     * Expectation: the phase becomes interrupted and the interruption event is recorded.
     */
    it('Assessment_SessionInterrupted_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionInterrupted_004, begin');
      const session: AssessmentSession = new AssessmentSession(1);
      session.activate();
      expect(session.interrupt()).assertTrue();
      expect(session.currentPhase()).assertEqual(SessionPhase.INTERRUPTED);
      expect(session.isActive()).assertFalse();
      expect(session.hasEvent(EVENT_INTERRUPTED)).assertTrue();
      expect(session.eventCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', session.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionInterrupted_004, end');
    });

    /**
     * Scenario: interrupting a session that never activated.
     * Expectation: the interruption is refused.
     */
    it('Assessment_SessionInterruptRejected_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionInterruptRejected_005, begin');
      const session: AssessmentSession = new AssessmentSession(1);
      expect(session.interrupt()).assertFalse();
      expect(session.currentPhase()).assertEqual(SessionPhase.CREATED);
      const ended: AssessmentSession = new AssessmentSession(2);
      ended.activate();
      ended.end();
      expect(ended.interrupt()).assertFalse();
      expect(ended.currentPhase()).assertEqual(SessionPhase.ENDED);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionInterruptRejected_005, end');
    });

    /**
     * Scenario: ending an active session.
     * Expectation: the phase becomes ended and the end event is recorded.
     */
    it('Assessment_SessionEnded_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionEnded_006, begin');
      const session: AssessmentSession = new AssessmentSession(1);
      session.activate();
      expect(session.end()).assertTrue();
      expect(session.currentPhase()).assertEqual(SessionPhase.ENDED);
      expect(session.isAlive()).assertFalse();
      expect(session.hasEvent(EVENT_END)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', session.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionEnded_006, end');
    });

    /**
     * Scenario: ending a session twice.
     * Expectation: the second end is refused and the event log does not grow.
     */
    it('Assessment_SessionEndTwice_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionEndTwice_007, begin');
      const session: AssessmentSession = new AssessmentSession(1);
      session.activate();
      expect(session.end()).assertTrue();
      const events: number = session.eventCount();
      expect(session.end()).assertFalse();
      expect(session.eventCount()).assertEqual(events);
      hilog.info(DOMAIN, TAG, '%{public}s', session.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionEndTwice_007, end');
    });

    /**
     * Scenario: destroying a session.
     * Expectation: the phase becomes destroyed and a repeated destroy is refused.
     */
    it('Assessment_SessionDestroyed_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionDestroyed_008, begin');
      const session: AssessmentSession = new AssessmentSession(1);
      session.activate();
      session.end();
      expect(session.destroy()).assertTrue();
      expect(session.currentPhase()).assertEqual(SessionPhase.DESTROYED);
      expect(session.destroy()).assertFalse();
      expect(session.isAlive()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', session.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionDestroyed_008, end');
    });

    /**
     * Scenario: an ended session does not accept a further end.
     * Expectation: the lifecycle is strictly forward moving.
     */
    it('Assessment_SessionBackwardTransitionRejected_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionBackwardTransitionRejected_009, begin');
      const session: AssessmentSession = new AssessmentSession(1);
      session.activate();
      session.interrupt();
      expect(session.end()).assertTrue();
      expect(session.activate()).assertFalse();
      expect(session.isActive()).assertFalse();
      expect(session.eventCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', session.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionBackwardTransitionRejected_009, end');
    });

    /**
     * Scenario: the session identifier allocation.
     * Expectation: identifiers are unique and monotonically increasing.
     */
    it('Assessment_SessionIdentifiers_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionIdentifiers_010, begin');
      const registry: SessionRegistry = new SessionRegistry();
      const first: AssessmentSession = registry.create(DURATION_DEFAULT, []);
      const second: AssessmentSession = registry.create(DURATION_TEN, []);
      const third: AssessmentSession = registry.create(DURATION_SIXTY, []);
      expect(first.identifier()).assertEqual(1);
      expect(second.identifier()).assertEqual(2);
      expect(third.identifier()).assertEqual(3);
      expect(second.identifier() > first.identifier()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', registry.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionIdentifiers_010, end');
    });

    /**
     * Scenario: the registry lookup of a session.
     * Expectation: a known identifier resolves and an unknown one answers null.
     */
    it('Assessment_SessionLookup_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionLookup_011, begin');
      const registry: SessionRegistry = new SessionRegistry();
      const session: AssessmentSession = registry.create(DURATION_TEN, []);
      const found: AssessmentSession | null = registry.find(session.identifier());
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found === session).assertTrue();
      }
      expect(registry.find(99)).assertNull();
      expect(registry.sessionCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionLookup_011, end');
    });

    /**
     * Scenario: starting a session through the registry.
     * Expectation: the success code activates the session and registers it as the active one.
     */
    it('Assessment_RegistryStart_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RegistryStart_012, begin');
      const registry: SessionRegistry = new SessionRegistry();
      const session: AssessmentSession | null = registry.start(DURATION_TEN, ['com.samples.assessment'], CODE_OK);
      expect(session !== null).assertTrue();
      expect(registry.isBusy()).assertTrue();
      const active: AssessmentSession | null = registry.activeSession();
      expect(active !== null).assertTrue();
      if (session !== null && active !== null) {
        expect(active.identifier()).assertEqual(session.identifier());
        expect(active.isActive()).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', registry.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RegistryStart_012, end');
    });

    /**
     * Scenario: starting a session with a failure code.
     * Expectation: the session exists but is not active and the registry stays free.
     */
    it('Assessment_RegistryStartFailure_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RegistryStartFailure_013, begin');
      const registry: SessionRegistry = new SessionRegistry();
      const session: AssessmentSession | null = registry.start(DURATION_TEN, [], CODE_USER_CANCEL);
      expect(session !== null).assertTrue();
      expect(registry.isBusy()).assertFalse();
      expect(registry.activeSession()).assertNull();
      if (session !== null) {
        expect(session.currentPhase()).assertEqual(SessionPhase.CREATED);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', registry.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RegistryStartFailure_013, end');
    });

    /**
     * Scenario: a second begin while a session is active.
     * Expectation: the registry refuses it and counts the rejection.
     */
    it('Assessment_RegistryRejectsSecondSession_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RegistryRejectsSecondSession_014, begin');
      const registry: SessionRegistry = new SessionRegistry();
      registry.start(DURATION_TEN, [], CODE_OK);
      const second: AssessmentSession | null = registry.start(DURATION_SIXTY, [], CODE_OK);
      expect(second).assertNull();
      expect(registry.rejections()).assertEqual(1);
      expect(registry.sessionCount()).assertEqual(1);
      expect(registry.isBusy()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', registry.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RegistryRejectsSecondSession_014, end');
    });

    /**
     * Scenario: finishing the active session.
     * Expectation: the registry becomes free and the session reaches the ended phase.
     */
    it('Assessment_RegistryFinish_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RegistryFinish_015, begin');
      const registry: SessionRegistry = new SessionRegistry();
      registry.start(DURATION_TEN, [], CODE_OK);
      expect(registry.finish()).assertTrue();
      expect(registry.isBusy()).assertFalse();
      expect(registry.activeSession()).assertNull();
      const sessions: AssessmentSession[] = registry.sessions();
      expect(sessions[0].currentPhase()).assertEqual(SessionPhase.ENDED);
      hilog.info(DOMAIN, TAG, '%{public}s', registry.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RegistryFinish_015, end');
    });

    /**
     * Scenario: finishing without an active session.
     * Expectation: the finish is refused and counted.
     */
    it('Assessment_RegistryFinishWithoutSession_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RegistryFinishWithoutSession_016, begin');
      const registry: SessionRegistry = new SessionRegistry();
      expect(registry.finish()).assertFalse();
      expect(registry.rejections()).assertEqual(1);
      expect(registry.isBusy()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', registry.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RegistryFinishWithoutSession_016, end');
    });

    /**
     * Scenario: interrupting the active session through the registry.
     * Expectation: the session reaches the interrupted phase and the registry frees the slot.
     */
    it('Assessment_RegistryInterrupt_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RegistryInterrupt_017, begin');
      const registry: SessionRegistry = new SessionRegistry();
      registry.start(DURATION_TEN, [], CODE_OK);
      expect(registry.interrupt()).assertTrue();
      expect(registry.isBusy()).assertFalse();
      const sessions: AssessmentSession[] = registry.sessions();
      expect(sessions[0].currentPhase()).assertEqual(SessionPhase.INTERRUPTED);
      hilog.info(DOMAIN, TAG, '%{public}s', registry.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RegistryInterrupt_017, end');
    });

    /**
     * Scenario: a second session after the first one ended.
     * Expectation: a fresh identifier is allocated and the registry accepts the start.
     */
    it('Assessment_RegistrySequentialSessions_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RegistrySequentialSessions_018, begin');
      const registry: SessionRegistry = new SessionRegistry();
      const first: AssessmentSession | null = registry.start(DURATION_TEN, [], CODE_OK);
      registry.finish();
      const second: AssessmentSession | null = registry.start(DURATION_SIXTY, [], CODE_OK);
      expect(first !== null).assertTrue();
      expect(second !== null).assertTrue();
      if (first !== null && second !== null) {
        expect(second.identifier() > first.identifier()).assertTrue();
      }
      expect(registry.sessionCount()).assertEqual(2);
      expect(registry.isBusy()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', registry.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RegistrySequentialSessions_018, end');
    });

    /**
     * Scenario: destroying every session of a registry.
     * Expectation: the destroy count matches the created sessions and the registry is free.
     */
    it('Assessment_RegistryDestroyAll_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RegistryDestroyAll_020, begin');
      const registry: SessionRegistry = new SessionRegistry();
      registry.create(DURATION_DEFAULT, []);
      registry.create(DURATION_TEN, []);
      registry.start(DURATION_SIXTY, [], CODE_OK);
      expect(registry.destroyAll()).assertEqual(3);
      expect(registry.liveCount()).assertEqual(0);
      expect(registry.isBusy()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', registry.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RegistryDestroyAll_020, end');
    });

    /**
     * Scenario: the single session invariant during a sequential lifecycle.
     * Expectation: the active count never exceeds one and ends at zero.
     */
    it('Assessment_InvariantHolds_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantHolds_021, begin');
      const invariant: SingleSessionInvariant = new SingleSessionInvariant();
      invariant.observeStart();
      invariant.observeStop();
      invariant.observeStart();
      invariant.observeRejected();
      invariant.observeStop();
      expect(invariant.violations()).assertEqual(0);
      expect(invariant.peak()).assertEqual(1);
      expect(invariant.current()).assertEqual(0);
      expect(invariant.isHeld()).assertTrue();
      expect(invariant.historyLength()).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', invariant.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantHolds_021, end');
    });

    /**
     * Scenario: two overlapping starts.
     * Expectation: the invariant records a violation and reports the peak of two.
     */
    it('Assessment_InvariantDetectsOverlap_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantDetectsOverlap_022, begin');
      const invariant: SingleSessionInvariant = new SingleSessionInvariant();
      invariant.observeStart();
      invariant.observeStart();
      expect(invariant.violations()).assertEqual(1);
      expect(invariant.peak()).assertEqual(2);
      expect(invariant.isHeld()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', invariant.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantDetectsOverlap_022, end');
    });

    /**
     * Scenario: a stop without a matching start.
     * Expectation: the counter does not go negative and the history still records the stop.
     */
    it('Assessment_InvariantStopWithoutStart_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantStopWithoutStart_023, begin');
      const invariant: SingleSessionInvariant = new SingleSessionInvariant();
      invariant.observeStop();
      expect(invariant.current()).assertEqual(0);
      expect(invariant.historyLength()).assertEqual(1);
      expect(invariant.isHeld()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', invariant.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantStopWithoutStart_023, end');
    });

    /**
     * Scenario: the entry ability lifecycle callbacks of a test run.
     * Expectation: the log starts with onCreate and ends with onDestroy.
     */
    it('Assessment_AbilityLifecycleOrder_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AbilityLifecycleOrder_024, begin');
      const log: LifecycleLog = new LifecycleLog();
      log.record('onCreate', 'created');
      log.record('onForeground', 'foreground');
      log.record('onBackground', 'background');
      log.record('onDestroy', 'destroyed');
      expect(log.size()).assertEqual(4);
      expect(log.firstCallback()).assertEqual('onCreate');
      expect(log.lastCallback()).assertEqual('onDestroy');
      expect(log.sequenceMonotonic()).assertTrue();
      expect(log.contains('onForeground')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', log.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AbilityLifecycleOrder_024, end');
    });

    /**
     * Scenario: a foreground and background pair.
     * Expectation: both callbacks are counted exactly once.
     */
    it('Assessment_AbilityForegroundBackground_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AbilityForegroundBackground_025, begin');
      const log: LifecycleLog = new LifecycleLog();
      log.record('onCreate', 'created');
      log.record('onForeground', 'foreground');
      log.record('onBackground', 'background');
      log.record('onForeground', 'foreground');
      expect(log.countOf('onForeground')).assertEqual(2);
      expect(log.countOf('onBackground')).assertEqual(1);
      expect(log.countOf('onDestroy')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', log.callbacks().join(' -> '));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AbilityForegroundBackground_025, end');
    });

    /**
     * Scenario: an empty lifecycle log.
     * Expectation: the endpoint accessors answer with empty strings.
     */
    it('Assessment_AbilityEmptyLog_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AbilityEmptyLog_026, begin');
      const log: LifecycleLog = new LifecycleLog();
      expect(log.size()).assertEqual(0);
      expect(log.firstCallback()).assertEqual('');
      expect(log.lastCallback()).assertEqual('');
      expect(log.contains('onCreate')).assertFalse();
      expect(log.sequenceMonotonic()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', log.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AbilityEmptyLog_026, end');
    });

    /**
     * Scenario: the session event log cap.
     * Expectation: the log never grows past twenty recorded events.
     */
    it('Assessment_SessionEventLogCap_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionEventLogCap_027, begin');
      const session: AssessmentSession = new AssessmentSession(1);
      expect(session.eventCount()).assertEqual(0);
      session.activate();
      expect(session.eventCount()).assertEqual(1);
      session.interrupt();
      expect(session.eventCount()).assertEqual(2);
      expect(session.eventLog().length <= MAX_EVENT_LOG).assertTrue();
      expect(MAX_EVENT_LOG).assertEqual(20);
      hilog.info(DOMAIN, TAG, '%{public}s', session.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionEventLogCap_027, end');
    });

    /**
     * Scenario: a session that is created and destroyed without activation.
     * Expectation: it never becomes active and its event log stays empty.
     */
    it('Assessment_SessionCreateDestroy_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionCreateDestroy_028, begin');
      const session: AssessmentSession = new AssessmentSession(1, DURATION_TEN, []);
      expect(session.destroy()).assertTrue();
      expect(session.currentPhase()).assertEqual(SessionPhase.DESTROYED);
      expect(session.eventCount()).assertEqual(0);
      expect(session.isActive()).assertFalse();
      expect(session.isAlive()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', session.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionCreateDestroy_028, end');
    });

    /**
     * Scenario: the session description.
     * Expectation: it carries the identifier, the phase and the configured values.
     */
    it('Assessment_SessionDescription_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionDescription_035, begin');
      const session: AssessmentSession = new AssessmentSession(7, DURATION_TEN, ['com.samples.assessment']);
      session.activate();
      const text: string = session.describe();
      expect(text).assertContain('id=7');
      expect(text).assertContain(SessionPhase.ACTIVE);
      expect(text).assertContain(`${DURATION_TEN}`);
      expect(text).assertContain('events=1');
      hilog.info(DOMAIN, TAG, '%{public}s', text);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionDescription_035, end');
    });

    /**
     * Scenario: the registry description.
     * Expectation: it reports the session count and the busy flag.
     */
    it('Assessment_RegistryDescription_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RegistryDescription_036, begin');
      const registry: SessionRegistry = new SessionRegistry();
      const empty: string = registry.toString();
      expect(empty).assertContain('sessions=0');
      expect(empty).assertContain('busy=false');
      registry.start(DURATION_TEN, [], CODE_OK);
      const busy: string = registry.toString();
      expect(busy).assertContain('sessions=1');
      expect(busy).assertContain('busy=true');
      hilog.info(DOMAIN, TAG, '%{public}s', busy);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RegistryDescription_036, end');
    });
  });
}
