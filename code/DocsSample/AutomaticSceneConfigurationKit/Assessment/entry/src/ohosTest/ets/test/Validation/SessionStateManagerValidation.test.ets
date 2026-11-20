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
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  TEXT_STATE_ACTIVE,
  TEXT_STATE_INACTIVE,
  TIMEOUT_PAGE_TRANSITION,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  collectTexts,
  waitForIndexPage,
  pressAndWait
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Ring buffer capacity of the event log, it matches AssessmentConstants.MAX_EVENT_LOG.
const MAX_EVENT_LOG: number = 20;

// Callback event names published by the controller.
const EVENT_BEGIN: string = 'onBegin';
const EVENT_INTERRUPTED: string = 'onInterrupted';
const EVENT_END: string = 'onEnd';
const EVENT_API_ERROR: string = 'onApiError';

// Error codes of AssessmentErrorCode.
const CODE_OK: number = 0;
const CODE_USER_CANCEL: number = 1;
const CODE_TIMEOUT: number = 2;
const CODE_SYSTEM_ERROR: number = 3;
const CODE_ENV_ANOMALY: number = 4;

// Sentinels.
const INVALID_SEQ: number = -1;

/**
 * Lifecycle phase of an assessment session.
 */
enum SessionPhase {
  INACTIVE = 'inactive',
  PENDING = 'pending',
  ACTIVE = 'active',
  INTERRUPTED = 'interrupted',
  ENDED = 'ended'
}

/**
 * Reason a transition was refused.
 */
enum RejectReason {
  NONE = 'none',
  SAME_PHASE = 'same_phase',
  TERMINAL = 'terminal',
  ILLEGAL_TARGET = 'illegal_target',
  MISSING_SEQ = 'missing_seq'
}

/**
 * Kind of one recorded state change.
 */
enum SessionEventKind {
  BEGIN_REQUEST = 'begin_request',
  BEGIN_CALLBACK = 'begin_callback',
  INTERRUPTED = 'interrupted',
  ENDED = 'ended',
  RESET = 'reset',
  OBSERVED = 'observed'
}

/**
 * Immutable snapshot of the session state machine.
 */
interface SessionSnapshot {
  phase: SessionPhase;
  seq: number;
  beginCount: number;
  endCount: number;
  interruptCount: number;
  lastCode: number;
  lastMessage: string;
}

/**
 * One record of the session journal.
 */
interface SessionEvent {
  kind: SessionEventKind;
  seq: number;
  phase: SessionPhase;
  code: number;
  message: string;
}

/**
 * Outcome of a transition request.
 */
interface TransitionOutcome {
  accepted: boolean;
  from: SessionPhase;
  to: SessionPhase;
  reason: RejectReason;
}

/**
 * Aggregated counters of the journal.
 */
interface SessionStatistics {
  total: number;
  beginEvents: number;
  endEvents: number;
  interruptEvents: number;
  resetEvents: number;
  maxSeq: number;
}

/**
 * Audit report of the journal.
 */
interface JournalAudit {
  contiguous: boolean;
  chronological: boolean;
  capped: boolean;
  duplicates: number;
}

/**
 * Phase transition table.
 *
 * The table encodes which target phase is reachable from a source phase. The sample only
 * publishes the callbacks of the assessment service, so the table is small and explicit.
 */
class TransitionTable {
  public static canMove(from: SessionPhase, to: SessionPhase): boolean {
    if (from === to) {
      return false;
    }
    if (from === SessionPhase.ENDED) {
      return false;
    }
    if (from === SessionPhase.INACTIVE) {
      return to === SessionPhase.PENDING;
    }
    if (from === SessionPhase.PENDING) {
      return to === SessionPhase.ACTIVE || to === SessionPhase.INACTIVE;
    }
    if (from === SessionPhase.ACTIVE) {
      return to === SessionPhase.INTERRUPTED || to === SessionPhase.ENDED;
    }
    if (from === SessionPhase.INTERRUPTED) {
      return to === SessionPhase.ENDED || to === SessionPhase.ACTIVE;
    }
    return false;
  }

  public static isTerminal(phase: SessionPhase): boolean {
    return phase === SessionPhase.ENDED;
  }

  public static isRunning(phase: SessionPhase): boolean {
    return phase === SessionPhase.ACTIVE || phase === SessionPhase.PENDING;
  }

  public static successors(from: SessionPhase): SessionPhase[] {
    const all: SessionPhase[] = [
      SessionPhase.INACTIVE,
      SessionPhase.PENDING,
      SessionPhase.ACTIVE,
      SessionPhase.INTERRUPTED,
      SessionPhase.ENDED
    ];
    const result: SessionPhase[] = [];
    for (let i = 0; i < all.length; i++) {
      if (TransitionTable.canMove(from, all[i])) {
        result.push(all[i]);
      }
    }
    return result;
  }

  public static reasonFor(from: SessionPhase, to: SessionPhase): RejectReason {
    if (from === to) {
      return RejectReason.SAME_PHASE;
    }
    if (TransitionTable.isTerminal(from)) {
      return RejectReason.TERMINAL;
    }
    return RejectReason.ILLEGAL_TARGET;
  }

  public static describe(phase: SessionPhase): string {
    if (phase === SessionPhase.INACTIVE) {
      return 'no session';
    }
    if (phase === SessionPhase.PENDING) {
      return 'awaiting confirmation';
    }
    if (phase === SessionPhase.ACTIVE) {
      return 'assessment running';
    }
    if (phase === SessionPhase.INTERRUPTED) {
      return 'assessment interrupted';
    }
    return 'assessment finished';
  }
}

/**
 * Bounded journal of session events.
 *
 * The journal keeps the newest MAX_EVENT_LOG events, older events are dropped from the head
 * exactly like the sample does when it appends to the event log.
 */
class SessionJournal {
  private events: SessionEvent[] = [];
  private capacity: number;

  public constructor(capacity: number = MAX_EVENT_LOG) {
    this.capacity = capacity > 0 ? capacity : MAX_EVENT_LOG;
  }

  public append(event: SessionEvent): void {
    this.events.push(event);
    while (this.events.length > this.capacity) {
      this.events.shift();
    }
  }

  public size(): number {
    return this.events.length;
  }

  public capacityLimit(): number {
    return this.capacity;
  }

  public isFull(): boolean {
    return this.events.length >= this.capacity;
  }

  public getAll(): SessionEvent[] {
    return this.events.slice();
  }

  public at(index: number): SessionEvent | null {
    if (index < 0 || index >= this.events.length) {
      return null;
    }
    return this.events[index];
  }

  public latest(): SessionEvent | null {
    if (this.events.length === 0) {
      return null;
    }
    return this.events[this.events.length - 1];
  }

  public earliest(): SessionEvent | null {
    if (this.events.length === 0) {
      return null;
    }
    return this.events[0];
  }

  public countOf(kind: SessionEventKind): number {
    let count: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].kind === kind) {
        count++;
      }
    }
    return count;
  }

  public clear(): void {
    this.events = [];
  }

  public maxSeq(): number {
    if (this.events.length === 0) {
      return INVALID_SEQ;
    }
    let max: number = INVALID_SEQ;
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].seq > max) {
        max = this.events[i].seq;
      }
    }
    return max;
  }

  public minSeq(): number {
    if (this.events.length === 0) {
      return INVALID_SEQ;
    }
    let min: number = this.events[0].seq;
    for (let i = 1; i < this.events.length; i++) {
      if (this.events[i].seq < min) {
        min = this.events[i].seq;
      }
    }
    return min;
  }

  public messagesContaining(fragment: string): SessionEvent[] {
    const matches: SessionEvent[] = [];
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].message.includes(fragment)) {
        matches.push(this.events[i]);
      }
    }
    return matches;
  }
}

/**
 * Observer of the session state machine.
 *
 * Controllers of the sample publish AppStorage updates, the observer model records the
 * notifications in order so that the cases can verify the publication contract.
 */
class SessionObserver {
  private phases: SessionPhase[] = [];
  private seqs: number[] = [];

  public onPhaseChanged(phase: SessionPhase, seq: number): void {
    this.phases.push(phase);
    this.seqs.push(seq);
  }

  public count(): number {
    return this.phases.length;
  }

  public getPhases(): SessionPhase[] {
    return this.phases.slice();
  }

  public getSeqs(): number[] {
    return this.seqs.slice();
  }

  public lastPhase(): SessionPhase {
    if (this.phases.length === 0) {
      return SessionPhase.INACTIVE;
    }
    return this.phases[this.phases.length - 1];
  }

  public countOf(phase: SessionPhase): number {
    let count: number = 0;
    for (let i = 0; i < this.phases.length; i++) {
      if (this.phases[i] === phase) {
        count++;
      }
    }
    return count;
  }

  public clear(): void {
    this.phases = [];
    this.seqs = [];
  }
}

/**
 * State machine of an assessment session.
 *
 * The machine mirrors the AppStorage publication of AssessmentController: every accepted
 * transition bumps the sequence number and notifies the observer exactly once.
 */
class SessionStateMachine {
  private phase: SessionPhase;
  private seq: number;
  private beginCount: number = 0;
  private endCount: number = 0;
  private interruptCount: number = 0;
  private lastCode: number = CODE_OK;
  private lastMessage: string = '';
  private journal: SessionJournal;
  private observer: SessionObserver | null = null;

  public constructor(journalCapacity: number = MAX_EVENT_LOG) {
    this.phase = SessionPhase.INACTIVE;
    this.seq = 0;
    this.journal = new SessionJournal(journalCapacity);
  }

  public attachObserver(observer: SessionObserver): void {
    this.observer = observer;
  }

  public getPhase(): SessionPhase {
    return this.phase;
  }

  public getSeq(): number {
    return this.seq;
  }

  public getJournal(): SessionJournal {
    return this.journal;
  }

  public isActive(): boolean {
    return this.phase === SessionPhase.ACTIVE;
  }

  public isIdle(): boolean {
    return this.phase === SessionPhase.INACTIVE;
  }

  public isTerminal(): boolean {
    return TransitionTable.isTerminal(this.phase);
  }

  public canAccept(target: SessionPhase): boolean {
    return TransitionTable.canMove(this.phase, target);
  }

  // Requests a begin, the machine first moves into the pending phase because the service
  // shows a confirmation dialog before the session really starts.
  public requestBegin(): TransitionOutcome {
    return this.moveTo(SessionPhase.PENDING, SessionEventKind.BEGIN_REQUEST, CODE_OK, '');
  }

  public confirmBegin(): TransitionOutcome {
    return this.moveTo(SessionPhase.ACTIVE, SessionEventKind.BEGIN_CALLBACK, CODE_OK, 'began');
  }

  public failBegin(code: number, message: string): TransitionOutcome {
    const outcome: TransitionOutcome = this.moveTo(SessionPhase.INACTIVE, SessionEventKind.BEGIN_CALLBACK,
      code, message);
    return outcome;
  }

  public interrupt(code: number, message: string): TransitionOutcome {
    return this.moveTo(SessionPhase.INTERRUPTED, SessionEventKind.INTERRUPTED, code, message);
  }

  public end(): TransitionOutcome {
    return this.moveTo(SessionPhase.ENDED, SessionEventKind.ENDED, CODE_OK, '');
  }

  private moveTo(target: SessionPhase, kind: SessionEventKind, code: number,
    message: string): TransitionOutcome {
    const from: SessionPhase = this.phase;
    if (!TransitionTable.canMove(from, target)) {
      const rejected: TransitionOutcome = {
        accepted: false,
        from: from,
        to: from,
        reason: TransitionTable.reasonFor(from, target)
      };
      return rejected;
    }
    this.phase = target;
    this.seq++;
    if (kind === SessionEventKind.BEGIN_REQUEST || kind === SessionEventKind.BEGIN_CALLBACK) {
      this.beginCount++;
    }
    if (kind === SessionEventKind.ENDED) {
      this.endCount++;
    }
    if (kind === SessionEventKind.INTERRUPTED) {
      this.interruptCount++;
    }
    this.lastCode = code;
    this.lastMessage = message;
    const event: SessionEvent = {
      kind: kind,
      seq: this.seq,
      phase: target,
      code: code,
      message: message
    };
    this.journal.append(event);
    this.notify();
    const accepted: TransitionOutcome = {
      accepted: true,
      from: from,
      to: target,
      reason: RejectReason.NONE
    };
    return accepted;
  }

  // Publishes the phase to the observer, it must happen after every accepted transition and
  // must never happen for a rejected one.
  private notify(): void {
    if (this.observer === null) {
      return;
    }
    this.observer.onPhaseChanged(this.phase, this.seq);
  }

  public reset(): void {
    this.phase = SessionPhase.INACTIVE;
    this.beginCount = 0;
    this.endCount = 0;
    this.interruptCount = 0;
    this.lastCode = CODE_OK;
    this.lastMessage = '';
    this.journal.clear();
    this.seq = 0;
  }

  // A soft reset keeps the journal and the sequence, only the phase returns to inactive.
  public releasePhaseOnly(): void {
    this.phase = SessionPhase.INACTIVE;
    const event: SessionEvent = {
      kind: SessionEventKind.RESET,
      seq: this.seq,
      phase: SessionPhase.INACTIVE,
      code: CODE_OK,
      message: 'phase released'
    };
    this.journal.append(event);
  }

  public snapshot(): SessionSnapshot {
    const snapshot: SessionSnapshot = {
      phase: this.phase,
      seq: this.seq,
      beginCount: this.beginCount,
      endCount: this.endCount,
      interruptCount: this.interruptCount,
      lastCode: this.lastCode,
      lastMessage: this.lastMessage
    };
    return snapshot;
  }

  public statistics(): SessionStatistics {
    const stats: SessionStatistics = {
      total: this.journal.size(),
      beginEvents: this.journal.countOf(SessionEventKind.BEGIN_CALLBACK),
      endEvents: this.journal.countOf(SessionEventKind.ENDED),
      interruptEvents: this.journal.countOf(SessionEventKind.INTERRUPTED),
      resetEvents: this.journal.countOf(SessionEventKind.RESET),
      maxSeq: this.journal.maxSeq()
    };
    return stats;
  }
}

/**
 * State label resolver of the status card.
 *
 * The status card renders one of two exact strings, every other phase resolves to the
 * inactive label because the service reports no active session.
 */
class StateLabelResolver {
  public static labelOf(phase: SessionPhase): string {
    if (phase === SessionPhase.ACTIVE) {
      return 'Assessment state: active';
    }
    return 'Assessment state: inactive';
  }

  public static isActiveLabel(label: string): boolean {
    return label === 'Assessment state: active';
  }

  public static isInactiveLabel(label: string): boolean {
    return label === 'Assessment state: inactive';
  }

  // The status card colours the text with the success colour while the session is active.
  public static colourKeyOf(phase: SessionPhase): string {
    if (phase === SessionPhase.ACTIVE) {
      return 'success';
    }
    return 'secondary_font';
  }

  public static badgeOf(phase: SessionPhase): string {
    if (phase === SessionPhase.ACTIVE) {
      return 'RUNNING';
    }
    if (phase === SessionPhase.PENDING) {
      return 'WAITING';
    }
    if (phase === SessionPhase.INTERRUPTED) {
      return 'INTERRUPTED';
    }
    if (phase === SessionPhase.ENDED) {
      return 'ENDED';
    }
    return 'IDLE';
  }
}

/**
 * Resolves the interrupt reason to the resource key of the dialog message.
 */
class InterruptReasonResolver {
  public static keyOf(code: number): string {
    if (code === CODE_USER_CANCEL) {
      return 'reason_user_cancel';
    }
    if (code === CODE_TIMEOUT) {
      return 'reason_timeout';
    }
    if (code === CODE_SYSTEM_ERROR) {
      return 'reason_system_error';
    }
    if (code === CODE_ENV_ANOMALY) {
      return 'reason_env_anomaly';
    }
    return 'reason_unknown';
  }

  public static textOf(code: number): string {
    if (code === CODE_USER_CANCEL) {
      return 'The user canceled the assessment.';
    }
    if (code === CODE_TIMEOUT) {
      return 'The assessment timed out.';
    }
    if (code === CODE_SYSTEM_ERROR) {
      return 'A system error occurred.';
    }
    if (code === CODE_ENV_ANOMALY) {
      return 'An environment anomaly was detected.';
    }
    return 'The assessment exited.';
  }

  public static isKnown(code: number): boolean {
    return code >= CODE_OK && code <= CODE_ENV_ANOMALY;
  }

  public static isSuccess(code: number): boolean {
    return code === CODE_OK;
  }

  public static isTerminalReason(code: number): boolean {
    return code === CODE_USER_CANCEL || code === CODE_TIMEOUT;
  }
}

/**
 * Audits the journal of a state machine.
 */
class JournalAuditor {
  public isContiguous(journal: SessionJournal): boolean {
    const events: SessionEvent[] = journal.getAll();
    if (events.length <= 1) {
      return true;
    }
    for (let i = 1; i < events.length; i++) {
      if (events[i].seq !== events[i - 1].seq + 1) {
        return false;
      }
    }
    return true;
  }

  public countDuplicates(journal: SessionJournal): number {
    const seen: number[] = [];
    let duplicates: number = 0;
    const events: SessionEvent[] = journal.getAll();
    for (let i = 0; i < events.length; i++) {
      if (seen.indexOf(events[i].seq) >= 0) {
        duplicates++;
      } else {
        seen.push(events[i].seq);
      }
    }
    return duplicates;
  }

  public isCapped(journal: SessionJournal): boolean {
    return journal.size() === journal.capacityLimit();
  }

  public audit(journal: SessionJournal): JournalAudit {
    const report: JournalAudit = {
      contiguous: this.isContiguous(journal),
      chronological: this.isContiguous(journal),
      capped: this.isCapped(journal),
      duplicates: this.countDuplicates(journal)
    };
    return report;
  }
}

/**
 * Drives a whole session without touching the assessment service.
 *
 * The scenario runner is a small convenience wrapper that the comprehensive case uses so
 * that the expected sequence of callbacks is written down in one place.
 */
class SessionScenarioRunner {
  private machine: SessionStateMachine;
  private observer: SessionObserver;
  private failures: number = 0;

  public constructor() {
    this.machine = new SessionStateMachine();
    this.observer = new SessionObserver();
    this.machine.attachObserver(this.observer);
  }

  public getMachine(): SessionStateMachine {
    return this.machine;
  }

  public getObserver(): SessionObserver {
    return this.observer;
  }

  public getFailures(): number {
    return this.failures;
  }

  public begin(): void {
    const requested: TransitionOutcome = this.machine.requestBegin();
    if (!requested.accepted) {
      this.failures++;
      return;
    }
    const confirmed: TransitionOutcome = this.machine.confirmBegin();
    if (!confirmed.accepted) {
      this.failures++;
    }
  }

  public interrupt(code: number, message: string): void {
    const outcome: TransitionOutcome = this.machine.interrupt(code, message);
    if (!outcome.accepted) {
      this.failures++;
    }
  }

  public end(): void {
    const outcome: TransitionOutcome = this.machine.end();
    if (!outcome.accepted) {
      this.failures++;
    }
  }

  public isConsistent(): boolean {
    return this.failures === 0 && this.observer.count() === this.machine.getSeq();
  }
}

/**
 * Builds session events without going through the state machine.
 */
class SessionEventBuilder {
  public static build(count: number): SessionEvent[] {
    const events: SessionEvent[] = [];
    for (let i = 0; i < count; i++) {
      events.push({
        kind: SessionEventKind.OBSERVED,
        seq: i + 1,
        phase: SessionPhase.ACTIVE,
        code: CODE_OK,
        message: `observed ${i}`
      });
    }
    return events;
  }

  public static buildJournal(count: number): SessionJournal {
    const journal: SessionJournal = new SessionJournal(count > 0 ? count : 1);
    const events: SessionEvent[] = SessionEventBuilder.build(count);
    for (let i = 0; i < events.length; i++) {
      journal.append(events[i]);
    }
    return journal;
  }
}

export default function sessionStateManagerValidationTest() {
  describe('SessionStateManagerValidation_Test', () => {
    let driver: Driver;
    let auditor: JournalAuditor;

    beforeAll(async () => {
      driver = getDriver();
      auditor = new JournalAuditor();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_TRANSITION);
    });

    afterAll(async () => {
      await pressAndWait(driver, 2, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the transition table answers reachability for every source phase.
     * Expectation: inactive only reaches pending and pending reaches active or inactive.
     */
    it('Assessment_SessionTransitionTableInactive_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionTransitionTableInactive_001, begin');
      expect(TransitionTable.canMove(SessionPhase.INACTIVE, SessionPhase.PENDING)).assertTrue();
      expect(TransitionTable.canMove(SessionPhase.INACTIVE, SessionPhase.ACTIVE)).assertFalse();
      expect(TransitionTable.canMove(SessionPhase.INACTIVE, SessionPhase.INTERRUPTED)).assertFalse();
      expect(TransitionTable.canMove(SessionPhase.INACTIVE, SessionPhase.ENDED)).assertFalse();
      expect(TransitionTable.canMove(SessionPhase.INACTIVE, SessionPhase.INACTIVE)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionTransitionTableInactive_001, end');
    });

    /**
     * Scenario: the reachability of the pending phase.
     * Expectation: a pending session either starts or returns to inactive.
     */
    it('Assessment_SessionTransitionTablePending_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionTransitionTablePending_002, begin');
      expect(TransitionTable.canMove(SessionPhase.PENDING, SessionPhase.ACTIVE)).assertTrue();
      expect(TransitionTable.canMove(SessionPhase.PENDING, SessionPhase.INACTIVE)).assertTrue();
      expect(TransitionTable.canMove(SessionPhase.PENDING, SessionPhase.ENDED)).assertFalse();
      expect(TransitionTable.canMove(SessionPhase.PENDING, SessionPhase.PENDING)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionTransitionTablePending_002, end');
    });

    /**
     * Scenario: the reachability of the active phase.
     * Expectation: an active session is interrupted or ended, it never returns to pending.
     */
    it('Assessment_SessionTransitionTableActive_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionTransitionTableActive_003, begin');
      expect(TransitionTable.canMove(SessionPhase.ACTIVE, SessionPhase.INTERRUPTED)).assertTrue();
      expect(TransitionTable.canMove(SessionPhase.ACTIVE, SessionPhase.ENDED)).assertTrue();
      expect(TransitionTable.canMove(SessionPhase.ACTIVE, SessionPhase.PENDING)).assertFalse();
      expect(TransitionTable.canMove(SessionPhase.ACTIVE, SessionPhase.INACTIVE)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionTransitionTableActive_003, end');
    });

    /**
     * Scenario: the reachability of the interrupted and ended phases.
     * Expectation: interrupted resumes or ends, ended is terminal.
     */
    it('Assessment_SessionTransitionTableTerminal_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionTransitionTableTerminal_004, begin');
      expect(TransitionTable.canMove(SessionPhase.INTERRUPTED, SessionPhase.ENDED)).assertTrue();
      expect(TransitionTable.canMove(SessionPhase.INTERRUPTED, SessionPhase.ACTIVE)).assertTrue();
      expect(TransitionTable.canMove(SessionPhase.INTERRUPTED, SessionPhase.PENDING)).assertFalse();
      expect(TransitionTable.canMove(SessionPhase.ENDED, SessionPhase.ACTIVE)).assertFalse();
      expect(TransitionTable.canMove(SessionPhase.ENDED, SessionPhase.INACTIVE)).assertFalse();
      expect(TransitionTable.isTerminal(SessionPhase.ENDED)).assertTrue();
      expect(TransitionTable.isTerminal(SessionPhase.ACTIVE)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionTransitionTableTerminal_004, end');
    });

    /**
     * Scenario: the successor list of every phase.
     * Expectation: the list matches the documented transition table.
     */
    it('Assessment_SessionTransitionSuccessors_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionTransitionSuccessors_005, begin');
      expect(TransitionTable.successors(SessionPhase.INACTIVE).length).assertEqual(1);
      expect(TransitionTable.successors(SessionPhase.INACTIVE)[0]).assertEqual(SessionPhase.PENDING);
      expect(TransitionTable.successors(SessionPhase.PENDING).length).assertEqual(2);
      expect(TransitionTable.successors(SessionPhase.ACTIVE).length).assertEqual(2);
      expect(TransitionTable.successors(SessionPhase.INTERRUPTED).length).assertEqual(2);
      expect(TransitionTable.successors(SessionPhase.ENDED).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionTransitionSuccessors_005, end');
    });

    /**
     * Scenario: the rejection reasons of the table.
     * Expectation: same phase, terminal and illegal targets are distinguished.
     */
    it('Assessment_SessionTransitionReasons_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionTransitionReasons_006, begin');
      expect(TransitionTable.reasonFor(SessionPhase.ACTIVE, SessionPhase.ACTIVE))
        .assertEqual(RejectReason.SAME_PHASE);
      expect(TransitionTable.reasonFor(SessionPhase.ENDED, SessionPhase.ACTIVE)).assertEqual(RejectReason.TERMINAL);
      expect(TransitionTable.reasonFor(SessionPhase.ACTIVE, SessionPhase.PENDING))
        .assertEqual(RejectReason.ILLEGAL_TARGET);
      expect(TransitionTable.reasonFor(SessionPhase.INACTIVE, SessionPhase.ENDED))
        .assertEqual(RejectReason.ILLEGAL_TARGET);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionTransitionReasons_006, end');
    });

    /**
     * Scenario: the human readable description of every phase.
     * Expectation: each phase answers a distinct non empty description.
     */
    it('Assessment_SessionTransitionDescriptions_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionTransitionDescriptions_007, begin');
      expect(TransitionTable.describe(SessionPhase.INACTIVE)).assertEqual('no session');
      expect(TransitionTable.describe(SessionPhase.PENDING)).assertEqual('awaiting confirmation');
      expect(TransitionTable.describe(SessionPhase.ACTIVE)).assertEqual('assessment running');
      expect(TransitionTable.describe(SessionPhase.INTERRUPTED)).assertEqual('assessment interrupted');
      expect(TransitionTable.describe(SessionPhase.ENDED)).assertEqual('assessment finished');
      expect(TransitionTable.isRunning(SessionPhase.ACTIVE)).assertTrue();
      expect(TransitionTable.isRunning(SessionPhase.PENDING)).assertTrue();
      expect(TransitionTable.isRunning(SessionPhase.ENDED)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionTransitionDescriptions_007, end');
    });

    /**
     * Scenario: a freshly constructed state machine.
     * Expectation: the phase is inactive, the sequence is zero and the journal is empty.
     */
    it('Assessment_SessionMachineInitial_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionMachineInitial_008, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      expect(machine.getPhase()).assertEqual(SessionPhase.INACTIVE);
      expect(machine.getSeq()).assertEqual(0);
      expect(machine.isIdle()).assertTrue();
      expect(machine.isActive()).assertFalse();
      expect(machine.isTerminal()).assertFalse();
      expect(machine.getJournal().size()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionMachineInitial_008, end');
    });

    /**
     * Scenario: the begin request moves the machine into pending.
     * Expectation: the transition is accepted, the sequence becomes one and the observer fires.
     */
    it('Assessment_SessionBeginRequest_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionBeginRequest_009, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      const observer: SessionObserver = new SessionObserver();
      machine.attachObserver(observer);
      const outcome: TransitionOutcome = machine.requestBegin();
      expect(outcome.accepted).assertTrue();
      expect(outcome.from).assertEqual(SessionPhase.INACTIVE);
      expect(outcome.to).assertEqual(SessionPhase.PENDING);
      expect(outcome.reason).assertEqual(RejectReason.NONE);
      expect(machine.getPhase()).assertEqual(SessionPhase.PENDING);
      expect(machine.getSeq()).assertEqual(1);
      expect(observer.count()).assertEqual(1);
      expect(observer.lastPhase()).assertEqual(SessionPhase.PENDING);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionBeginRequest_009, end');
    });

    /**
     * Scenario: the begin callback confirms the pending session.
     * Expectation: the phase becomes active and the journal holds two events.
     */
    it('Assessment_SessionConfirmBegin_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionConfirmBegin_010, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      const outcome: TransitionOutcome = machine.confirmBegin();
      expect(outcome.accepted).assertTrue();
      expect(outcome.to).assertEqual(SessionPhase.ACTIVE);
      expect(machine.isActive()).assertTrue();
      expect(machine.getSeq()).assertEqual(2);
      expect(machine.getJournal().size()).assertEqual(2);
      expect(machine.snapshot().beginCount).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionConfirmBegin_010, end');
    });

    /**
     * Scenario: a begin callback rejects the request.
     * Expectation: the machine returns to inactive with the failure code recorded.
     */
    it('Assessment_SessionBeginFailure_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionBeginFailure_011, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      const outcome: TransitionOutcome = machine.failBegin(CODE_USER_CANCEL, 'user canceled');
      expect(outcome.accepted).assertTrue();
      expect(outcome.to).assertEqual(SessionPhase.INACTIVE);
      expect(machine.getPhase()).assertEqual(SessionPhase.INACTIVE);
      expect(machine.snapshot().lastCode).assertEqual(CODE_USER_CANCEL);
      expect(machine.snapshot().lastMessage).assertEqual('user canceled');
      const latest: SessionEvent | null = machine.getJournal().latest();
      expect(latest !== null).assertTrue();
      if (latest !== null) {
        expect(latest.kind).assertEqual(SessionEventKind.BEGIN_CALLBACK);
        expect(latest.code).assertEqual(CODE_USER_CANCEL);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionBeginFailure_011, end');
    });

    /**
     * Scenario: a begin request while the session is already active.
     * Expectation: the request is refused because active cannot return to pending.
     */
    it('Assessment_SessionBeginWhenActive_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionBeginWhenActive_012, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      machine.confirmBegin();
      const outcome: TransitionOutcome = machine.requestBegin();
      expect(outcome.accepted).assertFalse();
      expect(outcome.from).assertEqual(SessionPhase.ACTIVE);
      expect(outcome.to).assertEqual(SessionPhase.ACTIVE);
      expect(outcome.reason).assertEqual(RejectReason.ILLEGAL_TARGET);
      expect(machine.getSeq()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionBeginWhenActive_012, end');
    });

    /**
     * Scenario: an interrupt notification of a running session.
     * Expectation: the phase becomes interrupted and the code is preserved.
     */
    it('Assessment_SessionInterrupt_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionInterrupt_013, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      machine.confirmBegin();
      const outcome: TransitionOutcome = machine.interrupt(CODE_TIMEOUT, 'timeout');
      expect(outcome.accepted).assertTrue();
      expect(outcome.to).assertEqual(SessionPhase.INTERRUPTED);
      expect(machine.getPhase()).assertEqual(SessionPhase.INTERRUPTED);
      expect(machine.isActive()).assertFalse();
      expect(machine.snapshot().interruptCount).assertEqual(1);
      expect(machine.snapshot().lastCode).assertEqual(CODE_TIMEOUT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionInterrupt_013, end');
    });

    /**
     * Scenario: an interrupt while the session is pending.
     * Expectation: the notification is refused, pending cannot be interrupted directly.
     */
    it('Assessment_SessionInterruptWhenPending_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionInterruptWhenPending_014, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      const outcome: TransitionOutcome = machine.interrupt(CODE_SYSTEM_ERROR, 'error');
      expect(outcome.accepted).assertFalse();
      expect(machine.getPhase()).assertEqual(SessionPhase.PENDING);
      expect(machine.getSeq()).assertEqual(1);
      expect(machine.getJournal().size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionInterruptWhenPending_014, end');
    });

    /**
     * Scenario: the end of an active session.
     * Expectation: the phase becomes ended and the machine reports terminal.
     */
    it('Assessment_SessionEnd_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionEnd_015, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      machine.confirmBegin();
      const outcome: TransitionOutcome = machine.end();
      expect(outcome.accepted).assertTrue();
      expect(outcome.to).assertEqual(SessionPhase.ENDED);
      expect(machine.isTerminal()).assertTrue();
      expect(machine.snapshot().endCount).assertEqual(1);
      expect(machine.snapshot().lastCode).assertEqual(CODE_OK);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionEnd_015, end');
    });

    /**
     * Scenario: the end of an interrupted session.
     * Expectation: the interrupted phase may still finish.
     */
    it('Assessment_SessionEndAfterInterrupt_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionEndAfterInterrupt_016, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      machine.confirmBegin();
      machine.interrupt(CODE_ENV_ANOMALY, 'anomaly');
      const outcome: TransitionOutcome = machine.end();
      expect(outcome.accepted).assertTrue();
      expect(outcome.from).assertEqual(SessionPhase.INTERRUPTED);
      expect(machine.getPhase()).assertEqual(SessionPhase.ENDED);
      expect(machine.snapshot().interruptCount).assertEqual(1);
      expect(machine.snapshot().endCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionEndAfterInterrupt_016, end');
    });

    /**
     * Scenario: an end request of an inactive session.
     * Expectation: the request is refused and the journal is not touched.
     */
    it('Assessment_SessionEndWhenInactive_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionEndWhenInactive_017, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      const outcome: TransitionOutcome = machine.end();
      expect(outcome.accepted).assertFalse();
      expect(outcome.from).assertEqual(SessionPhase.INACTIVE);
      expect(outcome.reason).assertEqual(RejectReason.ILLEGAL_TARGET);
      expect(machine.getJournal().size()).assertEqual(0);
      expect(machine.getSeq()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionEndWhenInactive_017, end');
    });

    /**
     * Scenario: every transition of a finished session.
     * Expectation: the terminal phase refuses to move anywhere.
     */
    it('Assessment_SessionTerminalIsSticky_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionTerminalIsSticky_018, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      machine.confirmBegin();
      machine.end();
      const seqBefore: number = machine.getSeq();
      expect(machine.requestBegin().reason).assertEqual(RejectReason.TERMINAL);
      expect(machine.confirmBegin().reason).assertEqual(RejectReason.TERMINAL);
      expect(machine.interrupt(CODE_TIMEOUT, 'late').reason).assertEqual(RejectReason.TERMINAL);
      expect(machine.end().reason).assertEqual(RejectReason.SAME_PHASE);
      expect(machine.getSeq()).assertEqual(seqBefore);
      expect(machine.getPhase()).assertEqual(SessionPhase.ENDED);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionTerminalIsSticky_018, end');
    });

    /**
     * Scenario: a session that is interrupted and resumed.
     * Expectation: the interrupted phase may return to active when the service resumes.
     */
    it('Assessment_SessionResumeAfterInterrupt_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionResumeAfterInterrupt_019, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      machine.confirmBegin();
      machine.interrupt(CODE_ENV_ANOMALY, 'anomaly');
      const resumed: TransitionOutcome = machine.confirmBegin();
      expect(resumed.accepted).assertTrue();
      expect(resumed.from).assertEqual(SessionPhase.INTERRUPTED);
      expect(machine.getPhase()).assertEqual(SessionPhase.ACTIVE);
      expect(machine.snapshot().interruptCount).assertEqual(1);
      expect(machine.isActive()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionResumeAfterInterrupt_019, end');
    });

    /**
     * Scenario: the canAccept guard of the machine.
     * Expectation: the guard follows the transition table for the current phase.
     */
    it('Assessment_SessionCanAcceptGuard_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionCanAcceptGuard_020, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      expect(machine.canAccept(SessionPhase.PENDING)).assertTrue();
      expect(machine.canAccept(SessionPhase.ACTIVE)).assertFalse();
      machine.requestBegin();
      expect(machine.canAccept(SessionPhase.ACTIVE)).assertTrue();
      expect(machine.canAccept(SessionPhase.INACTIVE)).assertTrue();
      machine.confirmBegin();
      expect(machine.canAccept(SessionPhase.ENDED)).assertTrue();
      expect(machine.canAccept(SessionPhase.INACTIVE)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionCanAcceptGuard_020, end');
    });

    /**
     * Scenario: the sequence counter across a long session.
     * Expectation: the sequence equals the number of accepted transitions.
     */
    it('Assessment_SessionSequenceCounting_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionSequenceCounting_021, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      machine.confirmBegin();
      machine.interrupt(CODE_USER_CANCEL, 'cancel');
      machine.confirmBegin();
      machine.interrupt(CODE_TIMEOUT, 'timeout');
      machine.end();
      expect(machine.getSeq()).assertEqual(6);
      expect(machine.getJournal().size()).assertEqual(6);
      expect(machine.getJournal().maxSeq()).assertEqual(6);
      expect(auditor.isContiguous(machine.getJournal())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionSequenceCounting_021, end');
    });

    /**
     * Scenario: rejected transitions never bump the sequence.
     * Expectation: the sequence stays untouched by every refused request.
     */
    it('Assessment_SessionRejectedDoesNotCount_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionRejectedDoesNotCount_022, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      expect(machine.end().accepted).assertFalse();
      expect(machine.confirmBegin().accepted).assertFalse();
      expect(machine.interrupt(CODE_OK, '').accepted).assertFalse();
      expect(machine.getSeq()).assertEqual(0);
      expect(machine.getJournal().size()).assertEqual(0);
      expect(machine.requestBegin().accepted).assertTrue();
      expect(machine.getSeq()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionRejectedDoesNotCount_022, end');
    });

    /**
     * Scenario: the observer receives one notification per accepted transition.
     * Expectation: the notification count equals the sequence and the phases match.
     */
    it('Assessment_SessionObserverNotifications_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionObserverNotifications_023, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      const observer: SessionObserver = new SessionObserver();
      machine.attachObserver(observer);
      machine.requestBegin();
      machine.confirmBegin();
      machine.end();
      expect(observer.count()).assertEqual(3);
      expect(observer.getPhases()[0]).assertEqual(SessionPhase.PENDING);
      expect(observer.getPhases()[1]).assertEqual(SessionPhase.ACTIVE);
      expect(observer.getPhases()[2]).assertEqual(SessionPhase.ENDED);
      expect(observer.getSeqs()[0]).assertEqual(1);
      expect(observer.getSeqs()[2]).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionObserverNotifications_023, end');
    });

    /**
     * Scenario: the observer is silent for refused transitions.
     * Expectation: a rejected request produces no notification at all.
     */
    it('Assessment_SessionObserverSilentOnReject_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionObserverSilentOnReject_024, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      const observer: SessionObserver = new SessionObserver();
      machine.attachObserver(observer);
      machine.end();
      machine.interrupt(CODE_OK, '');
      expect(observer.count()).assertEqual(0);
      machine.requestBegin();
      expect(observer.count()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionObserverSilentOnReject_024, end');
    });

    /**
     * Scenario: the observer counting helper.
     * Expectation: repeated phases are counted separately per value.
     */
    it('Assessment_SessionObserverCountOf_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionObserverCountOf_025, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      const observer: SessionObserver = new SessionObserver();
      machine.attachObserver(observer);
      machine.requestBegin();
      machine.confirmBegin();
      machine.interrupt(CODE_TIMEOUT, 'a');
      machine.confirmBegin();
      machine.interrupt(CODE_TIMEOUT, 'b');
      expect(observer.countOf(SessionPhase.ACTIVE)).assertEqual(2);
      expect(observer.countOf(SessionPhase.INTERRUPTED)).assertEqual(2);
      expect(observer.countOf(SessionPhase.PENDING)).assertEqual(1);
      expect(observer.getPhases().length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionObserverCountOf_025, end');
    });

    /**
     * Scenario: clearing the observer.
     * Expectation: the recorded phases and sequences are both dropped.
     */
    it('Assessment_SessionObserverClear_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionObserverClear_026, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      const observer: SessionObserver = new SessionObserver();
      machine.attachObserver(observer);
      machine.requestBegin();
      machine.confirmBegin();
      expect(observer.count()).assertEqual(2);
      observer.clear();
      expect(observer.count()).assertEqual(0);
      expect(observer.getSeqs().length).assertEqual(0);
      expect(observer.lastPhase()).assertEqual(SessionPhase.INACTIVE);
      machine.interrupt(CODE_TIMEOUT, 'x');
      expect(observer.count()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionObserverClear_026, end');
    });

    /**
     * Scenario: a machine running without an observer.
     * Expectation: transitions still work and the sequence is still published internally.
     */
    it('Assessment_SessionWithoutObserver_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionWithoutObserver_027, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      expect(machine.requestBegin().accepted).assertTrue();
      expect(machine.confirmBegin().accepted).assertTrue();
      expect(machine.getSeq()).assertEqual(2);
      expect(machine.isActive()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionWithoutObserver_027, end');
    });

    /**
     * Scenario: the journal is created with the documented capacity.
     * Expectation: the default capacity equals MAX_EVENT_LOG.
     */
    it('Assessment_SessionJournalCapacity_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionJournalCapacity_028, begin');
      const journal: SessionJournal = new SessionJournal();
      expect(journal.capacityLimit()).assertEqual(MAX_EVENT_LOG);
      expect(MAX_EVENT_LOG).assertEqual(20);
      expect(journal.size()).assertEqual(0);
      expect(journal.isFull()).assertFalse();
      const custom: SessionJournal = new SessionJournal(5);
      expect(custom.capacityLimit()).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionJournalCapacity_028, end');
    });

    /**
     * Scenario: the journal keeps at most the documented number of events.
     * Expectation: older events are dropped from the head, the newest ones survive.
     */
    it('Assessment_SessionJournalRingBuffer_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionJournalRingBuffer_029, begin');
      const journal: SessionJournal = new SessionJournal(5);
      for (let i = 1; i <= 12; i++) {
        journal.append({
          kind: SessionEventKind.OBSERVED,
          seq: i,
          phase: SessionPhase.ACTIVE,
          code: CODE_OK,
          message: `event ${i}`
        });
      }
      expect(journal.size()).assertEqual(5);
      expect(journal.isFull()).assertTrue();
      expect(journal.maxSeq()).assertEqual(12);
      expect(journal.minSeq()).assertEqual(8);
      const earliest: SessionEvent | null = journal.earliest();
      expect(earliest !== null).assertTrue();
      if (earliest !== null) {
        expect(earliest.message).assertEqual('event 8');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionJournalRingBuffer_029, end');
    });

    /**
     * Scenario: the journal accessors over an empty buffer.
     * Expectation: every accessor answers the sentinel instead of throwing.
     */
    it('Assessment_SessionJournalEmptyAccess_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionJournalEmptyAccess_030, begin');
      const journal: SessionJournal = new SessionJournal();
      expect(journal.latest() === null).assertTrue();
      expect(journal.earliest() === null).assertTrue();
      expect(journal.at(0) === null).assertTrue();
      expect(journal.at(-1) === null).assertTrue();
      expect(journal.maxSeq()).assertEqual(INVALID_SEQ);
      expect(journal.minSeq()).assertEqual(INVALID_SEQ);
      expect(journal.countOf(SessionEventKind.ENDED)).assertEqual(0);
      expect(journal.messagesContaining('x').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionJournalEmptyAccess_030, end');
    });

    /**
     * Scenario: the journal accessors over a populated buffer.
     * Expectation: index, latest and earliest address the same records.
     */
    it('Assessment_SessionJournalPopulatedAccess_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionJournalPopulatedAccess_031, begin');
      const journal: SessionJournal = SessionEventBuilder.buildJournal(4);
      expect(journal.size()).assertEqual(4);
      const earliest: SessionEvent | null = journal.earliest();
      const latest: SessionEvent | null = journal.latest();
      expect(earliest !== null).assertTrue();
      expect(latest !== null).assertTrue();
      if (earliest !== null && latest !== null) {
        expect(earliest.seq).assertEqual(1);
        expect(latest.seq).assertEqual(4);
        expect(journal.at(0)?.seq).assertEqual(earliest.seq);
      }
      expect(journal.at(4) === null).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionJournalPopulatedAccess_031, end');
    });

    /**
     * Scenario: the journal getter returns an independent copy.
     * Expectation: mutating the copy leaves the journal untouched.
     */
    it('Assessment_SessionJournalDefensiveCopy_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionJournalDefensiveCopy_032, begin');
      const journal: SessionJournal = SessionEventBuilder.buildJournal(3);
      const copy: SessionEvent[] = journal.getAll();
      copy.push({
        kind: SessionEventKind.RESET,
        seq: 99,
        phase: SessionPhase.INACTIVE,
        code: CODE_OK,
        message: 'injected'
      });
      expect(journal.size()).assertEqual(3);
      expect(journal.getAll().length).assertEqual(3);
      expect(journal.messagesContaining('injected').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionJournalDefensiveCopy_032, end');
    });

    /**
     * Scenario: message search inside the journal.
     * Expectation: the search is a case sensitive substring match.
     */
    it('Assessment_SessionJournalSearch_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionJournalSearch_033, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      machine.confirmBegin();
      machine.interrupt(CODE_TIMEOUT, 'the assessment timed out');
      machine.end();
      const journal: SessionJournal = machine.getJournal();
      expect(journal.messagesContaining('timed out').length).assertEqual(1);
      expect(journal.messagesContaining('TIMED OUT').length).assertEqual(0);
      expect(journal.messagesContaining('').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionJournalSearch_033, end');
    });

    /**
     * Scenario: the counters of the state machine snapshot.
     * Expectation: the counters follow the callbacks that were delivered.
     */
    it('Assessment_SessionSnapshotCounters_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionSnapshotCounters_034, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      machine.confirmBegin();
      machine.interrupt(CODE_SYSTEM_ERROR, 'system');
      machine.confirmBegin();
      machine.end();
      const snapshot: SessionSnapshot = machine.snapshot();
      expect(snapshot.phase).assertEqual(SessionPhase.ENDED);
      expect(snapshot.seq).assertEqual(5);
      expect(snapshot.beginCount).assertEqual(3);
      expect(snapshot.interruptCount).assertEqual(1);
      expect(snapshot.endCount).assertEqual(1);
      expect(snapshot.lastCode).assertEqual(CODE_OK);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionSnapshotCounters_034, end');
    });

    /**
     * Scenario: the statistics view of the journal.
     * Expectation: the per kind counters and the highest sequence agree with the journal.
     */
    it('Assessment_SessionStatistics_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStatistics_035, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      machine.confirmBegin();
      machine.interrupt(CODE_USER_CANCEL, 'cancel');
      machine.end();
      const stats: SessionStatistics = machine.statistics();
      expect(stats.total).assertEqual(4);
      expect(stats.beginEvents).assertEqual(1);
      expect(stats.interruptEvents).assertEqual(1);
      expect(stats.endEvents).assertEqual(1);
      expect(stats.resetEvents).assertEqual(0);
      expect(stats.maxSeq).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStatistics_035, end');
    });

    /**
     * Scenario: statistics of an idle machine.
     * Expectation: every counter is zero and the highest sequence answers the sentinel.
     */
    it('Assessment_SessionStatisticsIdle_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStatisticsIdle_036, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      const stats: SessionStatistics = machine.statistics();
      expect(stats.total).assertEqual(0);
      expect(stats.beginEvents).assertEqual(0);
      expect(stats.endEvents).assertEqual(0);
      expect(stats.interruptEvents).assertEqual(0);
      expect(stats.resetEvents).assertEqual(0);
      expect(stats.maxSeq).assertEqual(INVALID_SEQ);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionStatisticsIdle_036, end');
    });

    /**
     * Scenario: the full reset of the machine.
     * Expectation: phase, sequence, counters and journal all return to the initial values.
     */
    it('Assessment_SessionReset_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionReset_037, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      machine.confirmBegin();
      machine.interrupt(CODE_TIMEOUT, 'timeout');
      expect(machine.getJournal().size()).assertEqual(3);
      machine.reset();
      expect(machine.getPhase()).assertEqual(SessionPhase.INACTIVE);
      expect(machine.getSeq()).assertEqual(0);
      expect(machine.getJournal().size()).assertEqual(0);
      expect(machine.snapshot().lastCode).assertEqual(CODE_OK);
      expect(machine.snapshot().interruptCount).assertEqual(0);
      expect(machine.requestBegin().accepted).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionReset_037, end');
    });

    /**
     * Scenario: the soft release of the phase.
     * Expectation: the journal and the sequence survive while the phase returns to inactive.
     */
    it('Assessment_SessionReleasePhaseOnly_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionReleasePhaseOnly_038, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      machine.confirmBegin();
      machine.end();
      const seqBefore: number = machine.getSeq();
      machine.releasePhaseOnly();
      expect(machine.getPhase()).assertEqual(SessionPhase.INACTIVE);
      expect(machine.getSeq()).assertEqual(seqBefore);
      expect(machine.getJournal().size()).assertEqual(4);
      expect(machine.getJournal().countOf(SessionEventKind.RESET)).assertEqual(1);
      expect(machine.isTerminal()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionReleasePhaseOnly_038, end');
    });

    /**
     * Scenario: a reset followed by a new session.
     * Expectation: the machine is reusable after a reset and counts again from zero.
     */
    it('Assessment_SessionReuseAfterReset_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionReuseAfterReset_039, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      machine.confirmBegin();
      machine.end();
      machine.reset();
      machine.requestBegin();
      machine.confirmBegin();
      expect(machine.getPhase()).assertEqual(SessionPhase.ACTIVE);
      expect(machine.getSeq()).assertEqual(2);
      expect(machine.getJournal().size()).assertEqual(2);
      expect(machine.getJournal().minSeq()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionReuseAfterReset_039, end');
    });

    /**
     * Scenario: a session that outlives the journal capacity.
     * Expectation: the journal stays bounded while the sequence keeps growing.
     */
    it('Assessment_SessionJournalBoundedOverflow_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionJournalBoundedOverflow_040, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      machine.confirmBegin();
      for (let i = 0; i < 12; i++) {
        machine.interrupt(CODE_ENV_ANOMALY, `anomaly ${i}`);
        machine.confirmBegin();
      }
      expect(machine.getJournal().size()).assertEqual(MAX_EVENT_LOG);
      expect(machine.getJournal().isFull()).assertTrue();
      expect(machine.getSeq()).assertEqual(2 + 24);
      expect(machine.getJournal().maxSeq()).assertEqual(machine.getSeq());
      expect(machine.getJournal().countOf(SessionEventKind.INTERRUPTED)).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionJournalBoundedOverflow_040, end');
    });

    /**
     * Scenario: the journal auditor over a healthy journal.
     * Expectation: the sequence is contiguous and holds no duplicates.
     */
    it('Assessment_SessionJournalAuditHealthy_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionJournalAuditHealthy_041, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      machine.confirmBegin();
      machine.interrupt(CODE_TIMEOUT, 'timeout');
      machine.end();
      const report: JournalAudit = auditor.audit(machine.getJournal());
      expect(report.contiguous).assertTrue();
      expect(report.chronological).assertTrue();
      expect(report.duplicates).assertEqual(0);
      expect(report.capped).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionJournalAuditHealthy_041, end');
    });

    /**
     * Scenario: the auditor detects duplicated sequences.
     * Expectation: a synthetic journal with a repeated sequence is flagged.
     */
    it('Assessment_SessionJournalAuditDetectsDuplicate_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionJournalAuditDetectsDuplicate_042, begin');
      const journal: SessionJournal = new SessionJournal(10);
      journal.append({
        kind: SessionEventKind.OBSERVED, seq: 1, phase: SessionPhase.ACTIVE, code: CODE_OK, message: 'a'
      });
      journal.append({
        kind: SessionEventKind.OBSERVED, seq: 1, phase: SessionPhase.ACTIVE, code: CODE_OK, message: 'b'
      });
      journal.append({
        kind: SessionEventKind.OBSERVED, seq: 3, phase: SessionPhase.ACTIVE, code: CODE_OK, message: 'c'
      });
      expect(auditor.countDuplicates(journal)).assertEqual(1);
      expect(auditor.isContiguous(journal)).assertFalse();
      const report: JournalAudit = auditor.audit(journal);
      expect(report.duplicates).assertEqual(1);
      expect(report.contiguous).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionJournalAuditDetectsDuplicate_042, end');
    });

    /**
     * Scenario: the auditor of a single event journal.
     * Expectation: a single record is trivially contiguous and holds no duplicate.
     */
    it('Assessment_SessionJournalAuditSingle_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionJournalAuditSingle_043, begin');
      const journal: SessionJournal = SessionEventBuilder.buildJournal(1);
      expect(auditor.isContiguous(journal)).assertTrue();
      expect(auditor.countDuplicates(journal)).assertEqual(0);
      expect(auditor.isCapped(journal)).assertTrue();
      expect(journal.size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionJournalAuditSingle_043, end');
    });

    /**
     * Scenario: the state label resolver for every phase.
     * Expectation: only the active phase resolves to the active label.
     */
    it('Assessment_SessionLabelResolver_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionLabelResolver_044, begin');
      expect(StateLabelResolver.labelOf(SessionPhase.ACTIVE)).assertEqual(TEXT_STATE_ACTIVE);
      expect(StateLabelResolver.labelOf(SessionPhase.INACTIVE)).assertEqual(TEXT_STATE_INACTIVE);
      expect(StateLabelResolver.labelOf(SessionPhase.PENDING)).assertEqual(TEXT_STATE_INACTIVE);
      expect(StateLabelResolver.labelOf(SessionPhase.INTERRUPTED)).assertEqual(TEXT_STATE_INACTIVE);
      expect(StateLabelResolver.labelOf(SessionPhase.ENDED)).assertEqual(TEXT_STATE_INACTIVE);
      expect(StateLabelResolver.isActiveLabel('Assessment state: active')).assertTrue();
      expect(StateLabelResolver.isInactiveLabel(TEXT_STATE_INACTIVE)).assertTrue();
      expect(StateLabelResolver.isActiveLabel(TEXT_STATE_INACTIVE)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionLabelResolver_044, end');
    });

    /**
     * Scenario: the colour key of the status card per phase.
     * Expectation: the active phase uses the success colour and the others the secondary one.
     */
    it('Assessment_SessionLabelColour_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionLabelColour_045, begin');
      expect(StateLabelResolver.colourKeyOf(SessionPhase.ACTIVE)).assertEqual('success');
      expect(StateLabelResolver.colourKeyOf(SessionPhase.INACTIVE)).assertEqual('secondary_font');
      expect(StateLabelResolver.colourKeyOf(SessionPhase.PENDING)).assertEqual('secondary_font');
      expect(StateLabelResolver.colourKeyOf(SessionPhase.INTERRUPTED)).assertEqual('secondary_font');
      expect(StateLabelResolver.colourKeyOf(SessionPhase.ENDED)).assertEqual('secondary_font');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionLabelColour_045, end');
    });

    /**
     * Scenario: the badges of the status card.
     * Expectation: every phase answers a distinct upper case badge token.
     */
    it('Assessment_SessionLabelBadges_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionLabelBadges_046, begin');
      expect(StateLabelResolver.badgeOf(SessionPhase.INACTIVE)).assertEqual('IDLE');
      expect(StateLabelResolver.badgeOf(SessionPhase.PENDING)).assertEqual('WAITING');
      expect(StateLabelResolver.badgeOf(SessionPhase.ACTIVE)).assertEqual('RUNNING');
      expect(StateLabelResolver.badgeOf(SessionPhase.INTERRUPTED)).assertEqual('INTERRUPTED');
      expect(StateLabelResolver.badgeOf(SessionPhase.ENDED)).assertEqual('ENDED');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionLabelBadges_046, end');
    });

    /**
     * Scenario: the interrupt reason resolver for the documented codes.
     * Expectation: every documented code maps to its resource key and text.
     */
    it('Assessment_SessionReasonResolver_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionReasonResolver_047, begin');
      expect(InterruptReasonResolver.keyOf(CODE_USER_CANCEL)).assertEqual('reason_user_cancel');
      expect(InterruptReasonResolver.keyOf(CODE_TIMEOUT)).assertEqual('reason_timeout');
      expect(InterruptReasonResolver.keyOf(CODE_SYSTEM_ERROR)).assertEqual('reason_system_error');
      expect(InterruptReasonResolver.keyOf(CODE_ENV_ANOMALY)).assertEqual('reason_env_anomaly');
      expect(InterruptReasonResolver.keyOf(CODE_OK)).assertEqual('reason_unknown');
      expect(InterruptReasonResolver.keyOf(99)).assertEqual('reason_unknown');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionReasonResolver_047, end');
    });

    /**
     * Scenario: the interrupt reason texts.
     * Expectation: each documented code answers the resource text of the dialog.
     */
    it('Assessment_SessionReasonTexts_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionReasonTexts_048, begin');
      expect(InterruptReasonResolver.textOf(CODE_USER_CANCEL)).assertEqual('The user canceled the assessment.');
      expect(InterruptReasonResolver.textOf(CODE_TIMEOUT)).assertEqual('The assessment timed out.');
      expect(InterruptReasonResolver.textOf(CODE_SYSTEM_ERROR)).assertEqual('A system error occurred.');
      expect(InterruptReasonResolver.textOf(CODE_ENV_ANOMALY))
        .assertEqual('An environment anomaly was detected.');
      expect(InterruptReasonResolver.textOf(CODE_OK)).assertEqual('The assessment exited.');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionReasonTexts_048, end');
    });

    /**
     * Scenario: the classification helpers of the reason resolver.
     * Expectation: only documented codes are known and only zero is a success.
     */
    it('Assessment_SessionReasonClassification_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionReasonClassification_049, begin');
      expect(InterruptReasonResolver.isKnown(CODE_OK)).assertTrue();
      expect(InterruptReasonResolver.isKnown(CODE_ENV_ANOMALY)).assertTrue();
      expect(InterruptReasonResolver.isKnown(5)).assertFalse();
      expect(InterruptReasonResolver.isKnown(-1)).assertFalse();
      expect(InterruptReasonResolver.isSuccess(CODE_OK)).assertTrue();
      expect(InterruptReasonResolver.isSuccess(CODE_USER_CANCEL)).assertFalse();
      expect(InterruptReasonResolver.isTerminalReason(CODE_USER_CANCEL)).assertTrue();
      expect(InterruptReasonResolver.isTerminalReason(CODE_TIMEOUT)).assertTrue();
      expect(InterruptReasonResolver.isTerminalReason(CODE_SYSTEM_ERROR)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionReasonClassification_049, end');
    });

    /**
     * Scenario: a begin failure with a user cancel code.
     * Expectation: the machine returns to inactive and the journal names the cancel callback.
     */
    it('Assessment_SessionBeginCancelFlow_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionBeginCancelFlow_050, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      const outcome: TransitionOutcome = machine.failBegin(CODE_USER_CANCEL, 'user canceled');
      expect(outcome.accepted).assertTrue();
      expect(machine.getPhase()).assertEqual(SessionPhase.INACTIVE);
      expect(machine.getJournal().countOf(SessionEventKind.BEGIN_CALLBACK)).assertEqual(1);
      expect(machine.getJournal().messagesContaining('user canceled').length).assertEqual(1);
      expect(InterruptReasonResolver.keyOf(machine.snapshot().lastCode)).assertEqual('reason_user_cancel');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionBeginCancelFlow_050, end');
    });

    /**
     * Scenario: a begin failure with a system error code.
     * Expectation: the failure remains retriable, a second begin may succeed.
     */
    it('Assessment_SessionBeginRetryAfterFailure_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionBeginRetryAfterFailure_051, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      expect(machine.failBegin(CODE_SYSTEM_ERROR, 'system').accepted).assertTrue();
      expect(machine.getPhase()).assertEqual(SessionPhase.INACTIVE);
      expect(machine.requestBegin().accepted).assertTrue();
      expect(machine.confirmBegin().accepted).assertTrue();
      expect(machine.isActive()).assertTrue();
      expect(machine.getSeq()).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionBeginRetryAfterFailure_051, end');
    });

    /**
     * Scenario: the scenario runner drives a complete healthy session.
     * Expectation: the runner reports no failure and the observer matches the sequence.
     */
    it('Assessment_SessionScenarioHealthy_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionScenarioHealthy_052, begin');
      const runner: SessionScenarioRunner = new SessionScenarioRunner();
      runner.begin();
      runner.interrupt(CODE_TIMEOUT, 'timeout');
      runner.end();
      expect(runner.getFailures()).assertEqual(0);
      expect(runner.isConsistent()).assertTrue();
      expect(runner.getMachine().getPhase()).assertEqual(SessionPhase.ENDED);
      expect(runner.getObserver().count()).assertEqual(4);
      expect(runner.getMachine().getSeq()).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionScenarioHealthy_052, end');
    });

    /**
     * Scenario: the scenario runner over an illegal sequence.
     * Expectation: the runner counts the refused callbacks and reports inconsistency.
     */
    it('Assessment_SessionScenarioIllegal_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionScenarioIllegal_053, begin');
      const runner: SessionScenarioRunner = new SessionScenarioRunner();
      runner.interrupt(CODE_TIMEOUT, 'too early');
      runner.end();
      expect(runner.getFailures()).assertEqual(2);
      expect(runner.isConsistent()).assertFalse();
      expect(runner.getMachine().getPhase()).assertEqual(SessionPhase.INACTIVE);
      expect(runner.getObserver().count()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionScenarioIllegal_053, end');
    });

    /**
     * Scenario: two independent machines do not share state.
     * Expectation: each machine keeps its own phase, sequence and journal.
     */
    it('Assessment_SessionMachineIsolation_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionMachineIsolation_054, begin');
      const first: SessionStateMachine = new SessionStateMachine();
      const second: SessionStateMachine = new SessionStateMachine();
      first.requestBegin();
      first.confirmBegin();
      expect(first.getPhase()).assertEqual(SessionPhase.ACTIVE);
      expect(second.getPhase()).assertEqual(SessionPhase.INACTIVE);
      expect(first.getSeq()).assertEqual(2);
      expect(second.getSeq()).assertEqual(0);
      expect(second.getJournal().size()).assertEqual(0);
      second.requestBegin();
      expect(second.getSeq()).assertEqual(1);
      expect(first.getSeq()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionMachineIsolation_054, end');
    });

    /**
     * Scenario: repeated interrupt and resume cycles.
     * Expectation: the counters and the journal stay consistent over many cycles.
     */
    it('Assessment_SessionInterruptResumeCycles_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionInterruptResumeCycles_055, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      machine.confirmBegin();
      for (let i = 0; i < 8; i++) {
        expect(machine.interrupt(CODE_ENV_ANOMALY, `cycle ${i}`).accepted).assertTrue();
        expect(machine.confirmBegin().accepted).assertTrue();
      }
      const snapshot: SessionSnapshot = machine.snapshot();
      expect(snapshot.interruptCount).assertEqual(8);
      expect(snapshot.phase).assertEqual(SessionPhase.ACTIVE);
      expect(machine.getSeq()).assertEqual(18);
      expect(auditor.isContiguous(machine.getJournal())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionInterruptResumeCycles_055, end');
    });

    /**
     * Scenario: an end to end session scenario.
     * Expectation: begin, interrupt, resume and end leave a consistent machine and journal.
     */
    it('Assessment_SessionComprehensive_058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionComprehensive_058, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      const observer: SessionObserver = new SessionObserver();
      machine.attachObserver(observer);
      expect(machine.requestBegin().accepted).assertTrue();
      expect(machine.confirmBegin().accepted).assertTrue();
      expect(machine.isActive()).assertTrue();
      expect(machine.interrupt(CODE_ENV_ANOMALY, 'anomaly').accepted).assertTrue();
      expect(machine.getPhase()).assertEqual(SessionPhase.INTERRUPTED);
      expect(machine.confirmBegin().accepted).assertTrue();
      expect(machine.end().accepted).assertTrue();
      expect(machine.isTerminal()).assertTrue();
      expect(observer.count()).assertEqual(5);
      expect(machine.getSeq()).assertEqual(5);
      expect(auditor.isContiguous(machine.getJournal())).assertTrue();
      expect(machine.statistics().interruptEvents).assertEqual(1);
      expect(machine.snapshot().endCount).assertEqual(1);
      expect(StateLabelResolver.labelOf(machine.getPhase())).assertEqual(TEXT_STATE_INACTIVE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionComprehensive_058, end');
    });

    /**
     * Scenario: a session that is reset in the middle of a running assessment.
     * Expectation: the reset wins, the phase returns to inactive and the journal is empty.
     */
    it('Assessment_SessionResetDuringActive_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionResetDuringActive_059, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      machine.confirmBegin();
      expect(machine.isActive()).assertTrue();
      machine.reset();
      expect(machine.getPhase()).assertEqual(SessionPhase.INACTIVE);
      expect(machine.getJournal().size()).assertEqual(0);
      expect(machine.getSeq()).assertEqual(0);
      expect(TransitionTable.isRunning(machine.getPhase())).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionResetDuringActive_059, end');
    });

    /**
     * Scenario: the last event of a failed begin is the begin callback.
     * Expectation: the journal keeps the failure as the newest entry and its code.
     */
    it('Assessment_SessionLastEventIsFailure_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionLastEventIsFailure_060, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      machine.requestBegin();
      machine.failBegin(CODE_ENV_ANOMALY, 'anomaly detected');
      const latest: SessionEvent | null = machine.getJournal().latest();
      expect(latest !== null).assertTrue();
      if (latest !== null) {
        expect(latest.kind).assertEqual(SessionEventKind.BEGIN_CALLBACK);
        expect(latest.code).assertEqual(CODE_ENV_ANOMALY);
        expect(latest.message).assertEqual('anomaly detected');
        expect(latest.phase).assertEqual(SessionPhase.INACTIVE);
        expect(latest.seq).assertEqual(2);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionLastEventIsFailure_060, end');
    });

    /**
     * Scenario: the idle machine is classified as not running.
     * Expectation: a freshly created machine answers false to every running check.
     */
    it('Assessment_SessionIdleNotRunning_061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionIdleNotRunning_061, begin');
      const machine: SessionStateMachine = new SessionStateMachine();
      expect(TransitionTable.isRunning(machine.getPhase())).assertFalse();
      expect(machine.isActive()).assertFalse();
      expect(machine.isTerminal()).assertFalse();
      expect(machine.isIdle()).assertTrue();
      expect(machine.canAccept(SessionPhase.ENDED)).assertFalse();
      expect(machine.canAccept(SessionPhase.INTERRUPTED)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionIdleNotRunning_061, end');
    });

    /**
     * Scenario: the callback names recorded by the controller.
     * Expectation: the four documented callback names are distinct and stable.
     */
    it('Assessment_SessionCallbackNames_067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionCallbackNames_067, begin');
      expect(EVENT_BEGIN).assertEqual('onBegin');
      expect(EVENT_INTERRUPTED).assertEqual('onInterrupted');
      expect(EVENT_END).assertEqual('onEnd');
      expect(EVENT_API_ERROR).assertEqual('onApiError');
      const names: string[] = [EVENT_BEGIN, EVENT_INTERRUPTED, EVENT_END, EVENT_API_ERROR];
      let distinct: number = 0;
      for (let i = 0; i < names.length; i++) {
        if (names.indexOf(names[i]) === i) {
          distinct++;
        }
      }
      expect(distinct).assertEqual(4);
      expect(names[0] !== names[1]).assertTrue();
      expect(names[2] !== names[3]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SessionCallbackNames_067, end');
    });
  });
}
