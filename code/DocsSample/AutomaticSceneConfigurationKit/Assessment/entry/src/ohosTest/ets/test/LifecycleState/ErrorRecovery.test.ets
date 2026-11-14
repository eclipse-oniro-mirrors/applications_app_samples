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
  ID_EXAM_TITLE,
  TEXT_NO_ACTIVE_ASSESSMENT,
  TEXT_NO_EVENT,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  waitForIndexPage,
  isAssessmentInactive,
  isComponentEnabled,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Assessment error codes of the sample. The controller compares the code of the onBegin
// callback with OK and treats every other value as a failed session start.
const CODE_OK: number = 0;
const CODE_USER_CANCEL: number = 1;
const CODE_TIMEOUT: number = 2;
const CODE_SYSTEM_ERROR: number = 3;
const CODE_ENV_ANOMALY: number = 4;
const CODE_UNKNOWN: number = 99;

// Event types published by the controller to AppStorage.
const EVENT_BEGIN: string = 'onBegin';
const EVENT_INTERRUPTED: string = 'onInterrupted';
const EVENT_END: string = 'onEnd';
const EVENT_API_ERROR: string = 'onApiError';

// Ring buffer size of the event log and the sequence step of a published event.
const MAX_EVENT_LOG: number = 20;
const SEQ_START: number = 0;
const SEQ_STEP: number = 1;

// Bounded retry parameters. The base delay doubles per attempt and the cap keeps the total
// wait of a session inside a few seconds.
const BACKOFF_BASE_MS: number = 100;
const BACKOFF_MAX_MS: number = 1600;
const BACKOFF_STEPS: number = 5;

// Per code retry budgets. A user cancellation is never retried, a timeout is retried a few
// times, a system error is retried more aggressively and an environment anomaly only twice.
const MAX_ATTEMPTS_USER_CANCEL: number = 0;
const MAX_ATTEMPTS_TIMEOUT: number = 3;
const MAX_ATTEMPTS_SYSTEM_ERROR: number = 5;
const MAX_ATTEMPTS_ENV_ANOMALY: number = 2;

// Number of attempts the model treats as "already spent" in the denial cases.
const ATTEMPTS_EXHAUSTED: number = 9;

// Vertices of the assessment verdict table, they describe what the coordinator does with a
// failed session start.
const PRIORITY_LOW: number = 1;
const PRIORITY_MEDIUM: number = 2;
const PRIORITY_HIGH: number = 3;
const PRIORITY_CRITICAL: number = 4;

/**
 * The action a recovery coordinator takes for one assessment error code.
 */
enum RecoveryVerdict {
  RETRY = 'retry',
  RESET = 'reset',
  ESCALATE = 'escalate',
  ABORT = 'abort'
}

/**
 * The decision of the interruption recovery model.
 */
enum ResumeDecision {
  RESUME_ALLOWED = 'resume_allowed',
  RESUME_BLOCKED = 'resume_blocked',
  FRESH_SESSION = 'fresh_session'
}

/**
 * One row of the verdict table.
 */
interface VerdictEntry {
  code: number;
  verdict: RecoveryVerdict;
  recoverable: boolean;
  priority: number;
  description: string;
}

/**
 * One published event of the assessment event log.
 */
interface LogEntry {
  seq: number;
  type: string;
  code: number;
  message: string;
  rendered: string;
}

/**
 * One transition of the active flag, the ledger keeps the reason so that a rollback can be
 * distinguished from a regular end of the session.
 */
interface ActiveTransition {
  sequence: number;
  from: boolean;
  to: boolean;
  reason: string;
}

/**
 * The outcome of a bounded retry decision.
 */
interface RetryDecision {
  allowed: boolean;
  verdict: RecoveryVerdict;
  attempt: number;
  delayMs: number;
  reason: string;
}

/**
 * Maps every assessment error code to a recovery verdict.
 *
 * The table is the single source of truth of the suite: the coordinator, the retry budget and
 * the interruption model all read from it, so a case that verifies a mapping verifies the
 * behaviour of every consumer at the same time.
 */
class VerdictTable {
  private entries: VerdictEntry[] = [];

  public constructor() {
    const ok: VerdictEntry = {
      code: CODE_OK,
      verdict: RecoveryVerdict.ABORT,
      recoverable: false,
      priority: PRIORITY_LOW,
      description: 'the session started, nothing to recover'
    };
    const cancel: VerdictEntry = {
      code: CODE_USER_CANCEL,
      verdict: RecoveryVerdict.ABORT,
      recoverable: false,
      priority: PRIORITY_MEDIUM,
      description: 'the user rejected the confirmation dialog, retrying would annoy the user'
    };
    const timeout: VerdictEntry = {
      code: CODE_TIMEOUT,
      verdict: RecoveryVerdict.RETRY,
      recoverable: true,
      priority: PRIORITY_HIGH,
      description: 'the confirmation dialog expired, a bounded retry is safe'
    };
    const system: VerdictEntry = {
      code: CODE_SYSTEM_ERROR,
      verdict: RecoveryVerdict.ESCALATE,
      recoverable: true,
      priority: PRIORITY_HIGH,
      description: 'the assessment service failed, escalate after the retry budget'
    };
    const environment: VerdictEntry = {
      code: CODE_ENV_ANOMALY,
      verdict: RecoveryVerdict.RESET,
      recoverable: true,
      priority: PRIORITY_CRITICAL,
      description: 'the environment changed, reset the session and start over'
    };
    this.entries.push(ok);
    this.entries.push(cancel);
    this.entries.push(timeout);
    this.entries.push(system);
    this.entries.push(environment);
  }

  /**
   * Looks up the row of a code.
   *
   * @param code assessment error code.
   * @returns the row, or undefined when the code is not part of the table.
   */
  public find(code: number): VerdictEntry | undefined {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].code === code) {
        return this.entries[i];
      }
    }
    return undefined;
  }

  /**
   * Resolves a code to a verdict. Unknown codes escalate, an unknown failure must never be
   * silently swallowed.
   *
   * @param code assessment error code.
   * @returns the verdict.
   */
  public verdictFor(code: number): RecoveryVerdict {
    const entry: VerdictEntry | undefined = this.find(code);
    if (entry === undefined) {
      return RecoveryVerdict.ESCALATE;
    }
    return entry.verdict;
  }

  /**
   * Reports whether a code may be retried.
   *
   * @param code assessment error code.
   * @returns true when the row is marked recoverable.
   */
  public isRecoverable(code: number): boolean {
    const entry: VerdictEntry | undefined = this.find(code);
    if (entry === undefined) {
      return false;
    }
    return entry.recoverable;
  }

  /**
   * Reports whether the code is a successful begin.
   *
   * @param code assessment error code.
   * @returns true for the OK code.
   */
  public isSuccess(code: number): boolean {
    return code === CODE_OK;
  }

  public size(): number {
    return this.entries.length;
  }

  public codes(): number[] {
    const result: number[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      result.push(this.entries[i].code);
    }
    return result;
  }

  /**
   * Collects the rows that are recoverable.
   *
   * @returns the recoverable rows in table order.
   */
  public recoverableEntries(): VerdictEntry[] {
    const result: VerdictEntry[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].recoverable) {
        result.push(this.entries[i]);
      }
    }
    return result;
  }

  /**
   * Finds the entry with the highest priority.
   *
   * @returns the critical row of the table.
   */
  public highestPriority(): VerdictEntry | undefined {
    if (this.entries.length === 0) {
      return undefined;
    }
    let best: VerdictEntry = this.entries[0];
    for (let i = 1; i < this.entries.length; i++) {
      if (this.entries[i].priority > best.priority) {
        best = this.entries[i];
      }
    }
    return best;
  }

  public summary(): string {
    return `VerdictTable{rows=${this.entries.length}, recoverable=${this.recoverableEntries().length}}`;
  }
}

/**
 * Exponential backoff schedule of the bounded retry.
 */
class BackoffSchedule {
  private baseMs: number;
  private maxMs: number;

  public constructor(baseMs: number, maxMs: number) {
    this.baseMs = baseMs;
    this.maxMs = maxMs;
  }

  /**
   * Computes the delay before the given attempt.
   *
   * @param attempt zero based attempt index.
   * @returns the delay in milliseconds, capped at the maximum.
   */
  public delayFor(attempt: number): number {
    if (attempt < 0) {
      return 0;
    }
    const raw: number = this.baseMs * Math.pow(2, attempt);
    if (raw > this.maxMs) {
      return this.maxMs;
    }
    return raw;
  }

  /**
   * Builds the complete schedule of a session.
   *
   * @param steps number of delay steps.
   * @returns the delays in attempt order.
   */
  public plan(steps: number): number[] {
    const delays: number[] = [];
    for (let i = 0; i < steps; i++) {
      delays.push(this.delayFor(i));
    }
    return delays;
  }

  /**
   * Sums the delays of a whole schedule, it bounds the total wait of a retried session.
   *
   * @param steps number of delay steps.
   * @returns the total wait in milliseconds.
   */
  public totalDelay(steps: number): number {
    const delays: number[] = this.plan(steps);
    let total: number = 0;
    for (let i = 0; i < delays.length; i++) {
      total += delays[i];
    }
    return total;
  }

  public baseDelay(): number {
    return this.baseMs;
  }

  public maxDelay(): number {
    return this.maxMs;
  }
}

/**
 * Per code retry budget of the coordinator.
 */
class RetryBudget {
  private table: VerdictTable;

  public constructor(table: VerdictTable) {
    this.table = table;
  }

  /**
   * Returns the attempt budget of a code.
   *
   * @param code assessment error code.
   * @returns the maximum number of attempts.
   */
  public maxAttemptsFor(code: number): number {
    if (code === CODE_TIMEOUT) {
      return MAX_ATTEMPTS_TIMEOUT;
    }
    if (code === CODE_SYSTEM_ERROR) {
      return MAX_ATTEMPTS_SYSTEM_ERROR;
    }
    if (code === CODE_ENV_ANOMALY) {
      return MAX_ATTEMPTS_ENV_ANOMALY;
    }
    if (code === CODE_USER_CANCEL) {
      return MAX_ATTEMPTS_USER_CANCEL;
    }
    if (code === CODE_OK) {
      return 0;
    }
    // An unknown failure gets a single probing attempt and is escalated afterwards.
    return 1;
  }

  /**
   * Reports whether the budget of a code is spent.
   *
   * @param code assessment error code.
   * @param attempts number of attempts already performed.
   * @returns true when no further attempt is allowed.
   */
  public isExhausted(code: number, attempts: number): boolean {
    return attempts >= this.maxAttemptsFor(code);
  }

  /**
   * Sums the budgets of every recoverable code, it documents the worst case of a session.
   *
   * @returns the sum of all attempt budgets.
   */
  public totalBudget(): number {
    const codes: number[] = this.table.codes();
    let total: number = 0;
    for (let i = 0; i < codes.length; i++) {
      total += this.maxAttemptsFor(codes[i]);
    }
    return total;
  }
}

/**
 * Bounded retry policy that combines the verdict table, the budget and the backoff schedule.
 */
class BoundedRetryModel {
  private table: VerdictTable;
  private budget: RetryBudget;
  private schedule: BackoffSchedule;

  public constructor(table: VerdictTable) {
    this.table = table;
    this.budget = new RetryBudget(table);
    this.schedule = new BackoffSchedule(BACKOFF_BASE_MS, BACKOFF_MAX_MS);
  }

  /**
   * Decides whether a failed begin may be attempted again.
   *
   * @param code assessment error code of the failure.
   * @param previousFailures number of failures already observed for the same code.
   * @returns the decision, the attempt index and the delay before the next attempt.
   */
  public decide(code: number, previousFailures: number): RetryDecision {
    const verdict: RecoveryVerdict = this.table.verdictFor(code);
    const recoverable: boolean = this.table.isRecoverable(code);
    const attempt: number = previousFailures + 1;
    if (!recoverable) {
      const blocked: RetryDecision = {
        allowed: false,
        verdict: verdict,
        attempt: attempt,
        delayMs: 0,
        reason: 'the code is not recoverable'
      };
      return blocked;
    }
    if (this.budget.isExhausted(code, previousFailures)) {
      const exhausted: RetryDecision = {
        allowed: false,
        verdict: verdict,
        attempt: attempt,
        delayMs: 0,
        reason: 'the retry budget is exhausted'
      };
      return exhausted;
    }
    const allowed: RetryDecision = {
      allowed: true,
      verdict: verdict,
      attempt: attempt,
      delayMs: this.schedule.delayFor(previousFailures),
      reason: 'the retry budget allows one more attempt'
    };
    return allowed;
  }

  public scheduleOf(): BackoffSchedule {
    return this.schedule;
  }

  public budgetOf(): RetryBudget {
    return this.budget;
  }
}

/**
 * Newest first ring buffer of published assessment events.
 *
 * The buffer mirrors the log that the controller keeps in AppStorage: every event is unshifted
 * and the buffer never grows beyond twenty entries.
 */
class EventLogRing {
  private entries: LogEntry[] = [];

  /**
   * Publishes an event.
   *
   * @param type event type.
   * @param code assessment error code.
   * @param message message of the event.
   * @returns the published entry.
   */
  public publish(type: string, code: number, message: string): LogEntry {
    const entry: LogEntry = {
      seq: this.nextSeq(),
      type: type,
      code: code,
      message: message,
      rendered: `${type} code=${code} message=${message}`
    };
    const next: LogEntry[] = [entry];
    for (let i = 0; i < this.entries.length; i++) {
      next.push(this.entries[i]);
    }
    while (next.length > MAX_EVENT_LOG) {
      next.pop();
    }
    this.entries = next;
    return entry;
  }

  /**
   * Computes the sequence of the next event. The ring itself does not own the counter, the
   * sample keeps it in AppStorage, so the counter is derived from the head entry.
   *
   * @returns the sequence of the next event.
   */
  private nextSeq(): number {
    if (this.entries.length === 0) {
      return SEQ_START + SEQ_STEP;
    }
    return this.entries[0].seq + SEQ_STEP;
  }

  public size(): number {
    return this.entries.length;
  }

  public head(): LogEntry | undefined {
    if (this.entries.length === 0) {
      return undefined;
    }
    return this.entries[0];
  }

  public at(index: number): LogEntry | undefined {
    if (index < 0 || index >= this.entries.length) {
      return undefined;
    }
    return this.entries[index];
  }

  public all(): LogEntry[] {
    return this.entries.slice();
  }

  public types(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      result.push(this.entries[i].type);
    }
    return result;
  }

  public codes(): number[] {
    const result: number[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      result.push(this.entries[i].code);
    }
    return result;
  }

  /**
   * Counts the entries of a type.
   *
   * @param type event type to count.
   * @returns the number of matching entries.
   */
  public countOfType(type: string): number {
    let count: number = 0;
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].type === type) {
        count++;
      }
    }
    return count;
  }

  /**
   * Replays the entries that were published after a sequence number.
   *
   * A recovery uses the replay to rebuild the event card of the entry page without republishing
   * the events themselves.
   *
   * @param seq sequence number that was last observed.
   * @returns the newer entries, newest first.
   */
  public replayAfter(seq: number): LogEntry[] {
    const result: LogEntry[] = [];
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].seq > seq) {
        result.push(this.entries[i]);
      }
    }
    return result;
  }

  /**
   * Replays at most a given number of entries.
   *
   * @param seq sequence number that was last observed.
   * @param limit maximum number of replayed entries.
   * @returns the newer entries, newest first, at most limit of them.
   */
  public replayAfterLimited(seq: number, limit: number): LogEntry[] {
    const all: LogEntry[] = this.replayAfter(seq);
    if (limit <= 0) {
      return [];
    }
    if (all.length <= limit) {
      return all;
    }
    const result: LogEntry[] = [];
    for (let i = 0; i < limit; i++) {
      result.push(all[i]);
    }
    return result;
  }

  public clear(): void {
    this.entries = [];
  }

  public summary(): string {
    return `EventLogRing{size=${this.entries.length}, head=${this.head()?.type ?? 'none'}}`;
  }
}

/**
 * Ledger of the active flag.
 *
 * Every write is recorded with the reason, a rollback is a write back to false that follows a
 * failed session start. The ledger therefore exposes the exact flip count of a scenario.
 */
class ActiveStateLedger {
  private active: boolean = false;
  private transitions: ActiveTransition[] = [];

  /**
   * Writes the active flag.
   *
   * @param value new value.
   * @param reason reason of the write.
   * @returns true when the value changed.
   */
  public setActive(value: boolean, reason: string): boolean {
    const changed: boolean = this.active !== value;
    const transition: ActiveTransition = {
      sequence: this.transitions.length,
      from: this.active,
      to: value,
      reason: reason
    };
    this.transitions.push(transition);
    this.active = value;
    return changed;
  }

  /**
   * Rolls the flag back to false after a failed begin.
   *
   * @param reason reason of the rollback.
   * @returns true when a rollback was actually needed.
   */
  public rollback(reason: string): boolean {
    if (!this.active) {
      const noop: ActiveTransition = {
        sequence: this.transitions.length,
        from: this.active,
        to: this.active,
        reason: reason
      };
      this.transitions.push(noop);
      return false;
    }
    this.setActive(false, reason);
    return true;
  }

  public isActive(): boolean {
    return this.active;
  }

  public size(): number {
    return this.transitions.length;
  }

  public all(): ActiveTransition[] {
    return this.transitions.slice();
  }

  /**
   * Counts the writes that really changed the value.
   *
   * @returns the number of flips.
   */
  public flipCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.transitions.length; i++) {
      if (this.transitions[i].from !== this.transitions[i].to) {
        count++;
      }
    }
    return count;
  }

  /**
   * Counts the writes that carried a reason fragment.
   *
   * @param fragment fragment to look for in the reasons.
   * @returns the number of matching writes.
   */
  public countReason(fragment: string): number {
    let count: number = 0;
    for (let i = 0; i < this.transitions.length; i++) {
      if (this.transitions[i].reason.includes(fragment)) {
        count++;
      }
    }
    return count;
  }

  public lastReason(): string {
    if (this.transitions.length === 0) {
      return '';
    }
    return this.transitions[this.transitions.length - 1].reason;
  }

  public reset(): void {
    this.active = false;
    this.transitions = [];
  }

  public summary(): string {
    return `ActiveStateLedger{active=${this.active}, writes=${this.transitions.length}, flips=${this.flipCount()}}`;
  }
}

/**
 * Coordinates the recovery of a failed assessment session.
 *
 * The coordinator owns the three pieces of state the sample keeps: the active flag of
 * AppStorage, the event ring and the retry budget. Every callback of the assessment service is
 * routed through one method so that the ordering of the state updates stays identical to the
 * controller of the sample.
 */
class RecoveryCoordinator {
  private table: VerdictTable;
  private retry: BoundedRetryModel;
  private log: EventLogRing;
  private ledger: ActiveStateLedger;
  private failuresByCode: Map<number, number> = new Map<number, number>();

  public constructor() {
    this.table = new VerdictTable();
    this.retry = new BoundedRetryModel(this.table);
    this.log = new EventLogRing();
    this.ledger = new ActiveStateLedger();
  }

  /**
   * Handles the onBegin callback.
   *
   * A successful begin activates the flag, a failed begin keeps it false and schedules a
   * bounded retry when the code allows one.
   *
   * @param code assessment error code.
   * @param message message of the callback.
   * @returns the retry decision, it is always denied for the OK code.
   */
  public handleBegin(code: number, message: string): RetryDecision {
    this.log.publish(EVENT_BEGIN, code, message);
    if (this.table.isSuccess(code)) {
      this.ledger.setActive(true, 'begin succeeded');
      const settled: RetryDecision = {
        allowed: false,
        verdict: RecoveryVerdict.ABORT,
        attempt: 0,
        delayMs: 0,
        reason: 'the session is active, no retry is needed'
      };
      return settled;
    }
    this.ledger.rollback('begin failed with code ' + code);
    const previous: number = this.failuresByCode.get(code) ?? 0;
    this.failuresByCode.set(code, previous + 1);
    return this.retry.decide(code, previous);
  }

  /**
   * Handles the onInterrupted callback.
   *
   * @param code interrupt code.
   * @param message interrupt message.
   * @returns true when the active flag was flipped by the interrupt.
   */
  public handleInterrupted(code: number, message: string): boolean {
    this.log.publish(EVENT_INTERRUPTED, code, message);
    return this.ledger.setActive(false, 'interrupted with code ' + code);
  }

  /**
   * Handles the onEnd callback.
   *
   * @returns true when the active flag was flipped by the end.
   */
  public handleEnd(): boolean {
    this.log.publish(EVENT_END, CODE_OK, '');
    return this.ledger.setActive(false, 'session ended');
  }

  /**
   * Handles an API level failure, for example a thrown begin call.
   *
   * @param code error code of the thrown BusinessError.
   * @param message message of the thrown BusinessError.
   */
  public handleApiError(code: number, message: string): void {
    this.log.publish(EVENT_API_ERROR, code, message);
  }

  /**
   * Counts the observed failures of a code.
   *
   * @param code assessment error code.
   * @returns the number of failures.
   */
  public failureCount(code: number): number {
    return this.failuresByCode.get(code) ?? 0;
  }

  public active(): boolean {
    return this.ledger.isActive();
  }

  public logs(): EventLogRing {
    return this.log;
  }

  public state(): ActiveStateLedger {
    return this.ledger;
  }

  public tableOf(): VerdictTable {
    return this.table;
  }

  /**
   * Rebuilds the active flag from a replayed event log.
   *
   * The replay is what a recreated page does: it reads the newest event and derives the flag
   * from its type rather than trusting a stale in-memory value.
   *
   * @returns the derived active flag.
   */
  public deriveActiveFromLog(): boolean {
    const head: LogEntry | undefined = this.log.head();
    if (head === undefined) {
      return false;
    }
    if (head.type === EVENT_BEGIN) {
      return head.code === CODE_OK;
    }
    return false;
  }

  public reset(): void {
    this.log.clear();
    this.ledger.reset();
    this.failuresByCode = new Map<number, number>();
  }

  public summary(): string {
    return `RecoveryCoordinator{active=${this.ledger.isActive()}, logs=${this.log.size()}}`;
  }
}

/**
 * Decides whether a session may be resumed after an interruption.
 */
class InterruptionRecoveryModel {
  private table: VerdictTable;
  private budget: RetryBudget;

  public constructor() {
    this.table = new VerdictTable();
    this.budget = new RetryBudget(this.table);
  }

  /**
   * Decides how the sample continues after an interrupt.
   *
   * @param code interrupt code.
   * @param activeBefore whether the session was active before the interrupt.
   * @param attemptsSoFar number of begin attempts already performed.
   * @returns the resume decision.
   */
  public decide(code: number, activeBefore: boolean, attemptsSoFar: number): ResumeDecision {
    if (!activeBefore) {
      return ResumeDecision.FRESH_SESSION;
    }
    if (!this.table.isRecoverable(code)) {
      return ResumeDecision.RESUME_BLOCKED;
    }
    if (this.budget.isExhausted(code, attemptsSoFar)) {
      return ResumeDecision.RESUME_BLOCKED;
    }
    return ResumeDecision.RESUME_ALLOWED;
  }

  /**
   * Computes the remaining attempts of a code.
   *
   * @param code assessment error code.
   * @param attemptsSoFar number of attempts already performed.
   * @returns the remaining attempts, never negative.
   */
  public remainingAttempts(code: number, attemptsSoFar: number): number {
    const budget: number = this.budget.maxAttemptsFor(code);
    const remaining: number = budget - attemptsSoFar;
    if (remaining < 0) {
      return 0;
    }
    return remaining;
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

/**
 * Renders the expected text of an event, it is the same text the controller appends to the log.
 *
 * @param type event type.
 * @param code assessment error code.
 * @param message message of the event.
 * @returns the rendered text.
 */
function renderEvent(type: string, code: number, message: string): string {
  return `${type} code=${code} message=${message}`;
}

export default function errorRecoveryTest() {
  describe('ErrorRecovery_Test', () => {
    let driver: Driver;
    let coordinator: RecoveryCoordinator;
    let table: VerdictTable;

    beforeAll(async () => {
      driver = getDriver();
      coordinator = new RecoveryCoordinator();
      table = new VerdictTable();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the verdict of a successful begin is looked up.
     * Expectation: the OK code is not recoverable and maps to the abort verdict.
     */
    it('Assessment_ErrorRecovery_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_001, begin');
      const entry: VerdictEntry | undefined = table.find(CODE_OK);
      expect(entry !== undefined).assertTrue();
      if (entry !== undefined) {
        expect(entry.verdict).assertEqual(RecoveryVerdict.ABORT);
        expect(entry.recoverable).assertFalse();
        expect(entry.priority).assertEqual(PRIORITY_LOW);
      }
      expect(table.isSuccess(CODE_OK)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_001, end');
    });

    /**
     * Scenario: a user cancellation is classified.
     * Expectation: the code is not recoverable, because retrying a rejected dialog is wrong.
     */
    it('Assessment_ErrorRecovery_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_002, begin');
      const entry: VerdictEntry | undefined = table.find(CODE_USER_CANCEL);
      expect(entry !== undefined).assertTrue();
      if (entry !== undefined) {
        expect(entry.verdict).assertEqual(RecoveryVerdict.ABORT);
        expect(entry.recoverable).assertFalse();
      }
      expect(table.verdictFor(CODE_USER_CANCEL)).assertEqual(RecoveryVerdict.ABORT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_002, end');
    });

    /**
     * Scenario: a timeout is classified.
     * Expectation: the code is recoverable and maps to the retry verdict.
     */
    it('Assessment_ErrorRecovery_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_003, begin');
      const entry: VerdictEntry | undefined = table.find(CODE_TIMEOUT);
      expect(entry !== undefined).assertTrue();
      if (entry !== undefined) {
        expect(entry.verdict).assertEqual(RecoveryVerdict.RETRY);
        expect(entry.recoverable).assertTrue();
        expect(entry.priority).assertEqual(PRIORITY_HIGH);
      }
      expect(table.isRecoverable(CODE_TIMEOUT)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_003, end');
    });

    /**
     * Scenario: a system error is classified.
     * Expectation: the code is recoverable and escalates once the budget is spent.
     */
    it('Assessment_ErrorRecovery_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_004, begin');
      const entry: VerdictEntry | undefined = table.find(CODE_SYSTEM_ERROR);
      expect(entry !== undefined).assertTrue();
      if (entry !== undefined) {
        expect(entry.verdict).assertEqual(RecoveryVerdict.ESCALATE);
        expect(entry.recoverable).assertTrue();
      }
      expect(table.verdictFor(CODE_SYSTEM_ERROR)).assertEqual(RecoveryVerdict.ESCALATE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_004, end');
    });

    /**
     * Scenario: an environment anomaly is classified.
     * Expectation: the code is the most severe row and resets the session.
     */
    it('Assessment_ErrorRecovery_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_005, begin');
      const entry: VerdictEntry | undefined = table.find(CODE_ENV_ANOMALY);
      expect(entry !== undefined).assertTrue();
      if (entry !== undefined) {
        expect(entry.verdict).assertEqual(RecoveryVerdict.RESET);
        expect(entry.priority).assertEqual(PRIORITY_CRITICAL);
        expect(entry.recoverable).assertTrue();
      }
      const highest: VerdictEntry | undefined = table.highestPriority();
      expect(highest !== undefined).assertTrue();
      if (highest !== undefined) {
        expect(highest.code).assertEqual(CODE_ENV_ANOMALY);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_005, end');
    });

    /**
     * Scenario: an unknown code is looked up.
     * Expectation: the table falls back to the escalate verdict and reports no row.
     */
    it('Assessment_ErrorRecovery_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_006, begin');
      expect(table.find(CODE_UNKNOWN) === undefined).assertTrue();
      expect(table.verdictFor(CODE_UNKNOWN)).assertEqual(RecoveryVerdict.ESCALATE);
      expect(table.isRecoverable(CODE_UNKNOWN)).assertFalse();
      expect(table.isSuccess(CODE_UNKNOWN)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_006, end');
    });

    /**
     * Scenario: the table is enumerated.
     * Expectation: it holds the five assessment codes and three of them are recoverable.
     */
    it('Assessment_ErrorRecovery_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_007, begin');
      expect(table.size()).assertEqual(5);
      const codes: number[] = table.codes();
      expect(codes.length).assertEqual(5);
      expect(codes.indexOf(CODE_OK) >= 0).assertTrue();
      expect(codes.indexOf(CODE_TIMEOUT) >= 0).assertTrue();
      expect(codes.indexOf(CODE_ENV_ANOMALY) >= 0).assertTrue();
      expect(table.recoverableEntries().length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', table.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_007, end');
    });

    /**
     * Scenario: priorities of the recoverable rows are compared.
     * Expectation: the environment anomaly ranks above the timeout and the system error.
     */
    it('Assessment_ErrorRecovery_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_008, begin');
      const environment: VerdictEntry | undefined = table.find(CODE_ENV_ANOMALY);
      const timeout: VerdictEntry | undefined = table.find(CODE_TIMEOUT);
      expect(environment !== undefined).assertTrue();
      expect(timeout !== undefined).assertTrue();
      if (environment !== undefined && timeout !== undefined) {
        expect(environment.priority).assertLarger(timeout.priority);
        expect(timeout.priority).assertLargerOrEqual(PRIORITY_HIGH);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_008, end');
    });

    /**
     * Scenario: the backoff schedule is generated.
     * Expectation: the delay doubles per attempt and the whole plan is ordered.
     */
    it('Assessment_ErrorRecovery_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_009, begin');
      const schedule: BackoffSchedule = new BackoffSchedule(BACKOFF_BASE_MS, BACKOFF_MAX_MS);
      expect(schedule.delayFor(0)).assertEqual(BACKOFF_BASE_MS);
      expect(schedule.delayFor(1)).assertEqual(BACKOFF_BASE_MS * 2);
      expect(schedule.delayFor(2)).assertEqual(BACKOFF_BASE_MS * 4);
      const plan: number[] = schedule.plan(BACKOFF_STEPS);
      expect(plan.length).assertEqual(BACKOFF_STEPS);
      for (let i = 1; i < plan.length; i++) {
        expect(plan[i] > plan[i - 1]).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_009, end');
    });

    /**
     * Scenario: the backoff schedule reaches its cap.
     * Expectation: delays beyond the cap stay at the maximum instead of growing forever.
     */
    it('Assessment_ErrorRecovery_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_010, begin');
      const schedule: BackoffSchedule = new BackoffSchedule(BACKOFF_BASE_MS, BACKOFF_MAX_MS);
      expect(schedule.delayFor(4)).assertEqual(BACKOFF_MAX_MS);
      expect(schedule.delayFor(20)).assertEqual(BACKOFF_MAX_MS);
      expect(schedule.maxDelay()).assertEqual(BACKOFF_MAX_MS);
      const total: number = schedule.totalDelay(10);
      expect(total).assertLargerOrEqual(BACKOFF_MAX_MS);
      hilog.info(DOMAIN, TAG, '%{public}s total backoff: %{public}d', BUNDLE + 'ErrorRecovery_010', total);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_010, end');
    });

    /**
     * Scenario: a negative attempt index is handed to the schedule.
     * Expectation: the schedule answers zero rather than a negative delay.
     */
    it('Assessment_ErrorRecovery_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_011, begin');
      const schedule: BackoffSchedule = new BackoffSchedule(BACKOFF_BASE_MS, BACKOFF_MAX_MS);
      expect(schedule.delayFor(-1)).assertEqual(0);
      expect(schedule.delayFor(-100)).assertEqual(0);
      expect(schedule.baseDelay()).assertEqual(BACKOFF_BASE_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_011, end');
    });

    /**
     * Scenario: the retry budget of every code is read.
     * Expectation: the cancel code gets no attempt and the system error gets the largest one.
     */
    it('Assessment_ErrorRecovery_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_012, begin');
      const budget: RetryBudget = new RetryBudget(table);
      expect(budget.maxAttemptsFor(CODE_USER_CANCEL)).assertEqual(MAX_ATTEMPTS_USER_CANCEL);
      expect(budget.maxAttemptsFor(CODE_TIMEOUT)).assertEqual(MAX_ATTEMPTS_TIMEOUT);
      expect(budget.maxAttemptsFor(CODE_SYSTEM_ERROR)).assertEqual(MAX_ATTEMPTS_SYSTEM_ERROR);
      expect(budget.maxAttemptsFor(CODE_ENV_ANOMALY)).assertEqual(MAX_ATTEMPTS_ENV_ANOMALY);
      expect(budget.maxAttemptsFor(CODE_SYSTEM_ERROR) > budget.maxAttemptsFor(CODE_ENV_ANOMALY)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_012, end');
    });

    /**
     * Scenario: the budgets of every code are summed.
     * Expectation: the total equals the sum of the individual budgets.
     */
    it('Assessment_ErrorRecovery_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_013, begin');
      const budget: RetryBudget = new RetryBudget(table);
      const expected: number = MAX_ATTEMPTS_USER_CANCEL + MAX_ATTEMPTS_TIMEOUT +
      MAX_ATTEMPTS_SYSTEM_ERROR + MAX_ATTEMPTS_ENV_ANOMALY;
      expect(budget.totalBudget()).assertEqual(expected);
      expect(budget.isExhausted(CODE_TIMEOUT, MAX_ATTEMPTS_TIMEOUT)).assertTrue();
      expect(budget.isExhausted(CODE_TIMEOUT, MAX_ATTEMPTS_TIMEOUT - 1)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_013, end');
    });

    /**
     * Scenario: the first timeout failure asks for a retry.
     * Expectation: the decision allows an attempt and carries the base backoff delay.
     */
    it('Assessment_ErrorRecovery_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_014, begin');
      const model: BoundedRetryModel = new BoundedRetryModel(table);
      const decision: RetryDecision = model.decide(CODE_TIMEOUT, 0);
      expect(decision.allowed).assertTrue();
      expect(decision.attempt).assertEqual(1);
      expect(decision.delayMs).assertEqual(BACKOFF_BASE_MS);
      expect(decision.verdict).assertEqual(RecoveryVerdict.RETRY);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ErrorRecovery_014', decision.reason);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_014, end');
    });

    /**
     * Scenario: a timeout exhausted its retry budget.
     * Expectation: the decision denies the attempt and reports the exhausted budget.
     */
    it('Assessment_ErrorRecovery_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_015, begin');
      const model: BoundedRetryModel = new BoundedRetryModel(table);
      const decision: RetryDecision = model.decide(CODE_TIMEOUT, MAX_ATTEMPTS_TIMEOUT);
      expect(decision.allowed).assertFalse();
      expect(decision.delayMs).assertEqual(0);
      expect(decision.reason).assertEqual('the retry budget is exhausted');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_015, end');
    });

    /**
     * Scenario: a user cancellation is handed to the retry model.
     * Expectation: no attempt is allowed even when none was made before.
     */
    it('Assessment_ErrorRecovery_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_016, begin');
      const model: BoundedRetryModel = new BoundedRetryModel(table);
      const decision: RetryDecision = model.decide(CODE_USER_CANCEL, 0);
      expect(decision.allowed).assertFalse();
      expect(decision.reason).assertEqual('the code is not recoverable');
      expect(decision.verdict).assertEqual(RecoveryVerdict.ABORT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_016, end');
    });

    /**
     * Scenario: a system error is retried until its larger budget is spent.
     * Expectation: every attempt below the budget is allowed and the last one is denied.
     */
    it('Assessment_ErrorRecovery_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_017, begin');
      const model: BoundedRetryModel = new BoundedRetryModel(table);
      let allowed: number = 0;
      for (let i = 0; i < MAX_ATTEMPTS_SYSTEM_ERROR; i++) {
        if (model.decide(CODE_SYSTEM_ERROR, i).allowed) {
          allowed++;
        }
      }
      expect(allowed).assertEqual(MAX_ATTEMPTS_SYSTEM_ERROR);
      expect(model.decide(CODE_SYSTEM_ERROR, MAX_ATTEMPTS_SYSTEM_ERROR).allowed).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_017, end');
    });

    /**
     * Scenario: an unknown code reaches the retry model.
     * Expectation: it is not recoverable, so the model denies the attempt.
     */
    it('Assessment_ErrorRecovery_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_018, begin');
      const model: BoundedRetryModel = new BoundedRetryModel(table);
      const decision: RetryDecision = model.decide(CODE_UNKNOWN, 0);
      expect(decision.allowed).assertFalse();
      expect(decision.verdict).assertEqual(RecoveryVerdict.ESCALATE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_018, end');
    });

    /**
     * Scenario: the retry model exposes its collaborators.
     * Expectation: the schedule and the budget answer the configured boundaries.
     */
    it('Assessment_ErrorRecovery_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_019, begin');
      const model: BoundedRetryModel = new BoundedRetryModel(table);
      expect(model.scheduleOf().baseDelay()).assertEqual(BACKOFF_BASE_MS);
      expect(model.scheduleOf().maxDelay()).assertEqual(BACKOFF_MAX_MS);
      expect(model.budgetOf().maxAttemptsFor(CODE_TIMEOUT)).assertEqual(MAX_ATTEMPTS_TIMEOUT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_019, end');
    });

    /**
     * Scenario: a successful begin is published to the coordinator.
     * Expectation: the active flag turns true and the log carries one begin event.
     */
    it('Assessment_ErrorRecovery_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_020, begin');
      coordinator.reset();
      const decision: RetryDecision = coordinator.handleBegin(CODE_OK, '');
      expect(coordinator.active()).assertTrue();
      expect(decision.allowed).assertFalse();
      expect(coordinator.logs().size()).assertEqual(1);
      expect(coordinator.logs().head()?.type).assertEqual(EVENT_BEGIN);
      expect(coordinator.logs().head()?.code).assertEqual(CODE_OK);
      hilog.info(DOMAIN, TAG, '%{public}s', coordinator.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_020, end');
    });

    /**
     * Scenario: a begin fails with the user cancel code.
     * Expectation: the active flag stays false and no retry is scheduled.
     */
    it('Assessment_ErrorRecovery_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_021, begin');
      coordinator.reset();
      const decision: RetryDecision = coordinator.handleBegin(CODE_USER_CANCEL, 'user cancelled');
      expect(coordinator.active()).assertFalse();
      expect(decision.allowed).assertFalse();
      expect(coordinator.failureCount(CODE_USER_CANCEL)).assertEqual(1);
      expect(coordinator.state().lastReason()).assertContain('begin failed');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_021, end');
    });

    /**
     * Scenario: a begin fails with the timeout code.
     * Expectation: the coordinator schedules a retry and records the failure count.
     */
    it('Assessment_ErrorRecovery_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_022, begin');
      coordinator.reset();
      const decision: RetryDecision = coordinator.handleBegin(CODE_TIMEOUT, 'dialog expired');
      expect(decision.allowed).assertTrue();
      expect(decision.delayMs).assertEqual(BACKOFF_BASE_MS);
      expect(coordinator.failureCount(CODE_TIMEOUT)).assertEqual(1);
      const second: RetryDecision = coordinator.handleBegin(CODE_TIMEOUT, 'dialog expired again');
      expect(second.attempt).assertEqual(2);
      expect(coordinator.failureCount(CODE_TIMEOUT)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_022, end');
    });

    /**
     * Scenario: the begin succeeds after two failures.
     * Expectation: the active flag turns true and the failure counter stays at two.
     */
    it('Assessment_ErrorRecovery_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_023, begin');
      coordinator.reset();
      coordinator.handleBegin(CODE_TIMEOUT, 'first');
      coordinator.handleBegin(CODE_TIMEOUT, 'second');
      coordinator.handleBegin(CODE_OK, '');
      expect(coordinator.active()).assertTrue();
      expect(coordinator.failureCount(CODE_TIMEOUT)).assertEqual(2);
      expect(coordinator.logs().size()).assertEqual(3);
      expect(coordinator.logs().head()?.code).assertEqual(CODE_OK);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_023, end');
    });

    /**
     * Scenario: a failed begin follows an active session.
     * Expectation: the coordinator rolls the flag back and the ledger records the rollback.
     */
    it('Assessment_ErrorRecovery_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_024, begin');
      coordinator.reset();
      coordinator.handleBegin(CODE_OK, '');
      expect(coordinator.active()).assertTrue();
      coordinator.handleBegin(CODE_SYSTEM_ERROR, 'service unavailable');
      expect(coordinator.active()).assertFalse();
      expect(coordinator.state().flipCount()).assertEqual(2);
      expect(coordinator.state().countReason('failed with code')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', coordinator.state().summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_024, end');
    });

    /**
     * Scenario: a rollback is requested while the flag is already false.
     * Expectation: the rollback reports that nothing changed and the value stays false.
     */
    it('Assessment_ErrorRecovery_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_025, begin');
      const ledger: ActiveStateLedger = new ActiveStateLedger();
      expect(ledger.rollback('nothing to roll back')).assertFalse();
      expect(ledger.isActive()).assertFalse();
      expect(ledger.flipCount()).assertEqual(0);
      expect(ledger.size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_025, end');
    });

    /**
     * Scenario: a rollback is issued twice.
     * Expectation: only the first one flips the flag, the second one is idle.
     */
    it('Assessment_ErrorRecovery_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_026, begin');
      const ledger: ActiveStateLedger = new ActiveStateLedger();
      ledger.setActive(true, 'begin succeeded');
      expect(ledger.rollback('first rollback')).assertTrue();
      expect(ledger.rollback('second rollback')).assertFalse();
      expect(ledger.flipCount()).assertEqual(2);
      expect(ledger.size()).assertEqual(3);
      expect(ledger.lastReason()).assertEqual('second rollback');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_026, end');
    });

    /**
     * Scenario: the same value is written twice.
     * Expectation: the write is recorded but the flip count does not grow.
     */
    it('Assessment_ErrorRecovery_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_027, begin');
      const ledger: ActiveStateLedger = new ActiveStateLedger();
      expect(ledger.setActive(true, 'begin succeeded')).assertTrue();
      expect(ledger.setActive(true, 'query confirmed')).assertFalse();
      expect(ledger.flipCount()).assertEqual(1);
      expect(ledger.size()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', ledger.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_027, end');
    });

    /**
     * Scenario: the ledger is reset.
     * Expectation: the flag and the transition history return to the empty state.
     */
    it('Assessment_ErrorRecovery_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_028, begin');
      const ledger: ActiveStateLedger = new ActiveStateLedger();
      ledger.setActive(true, 'begin succeeded');
      ledger.rollback('begin failed');
      ledger.reset();
      expect(ledger.isActive()).assertFalse();
      expect(ledger.size()).assertEqual(0);
      expect(ledger.flipCount()).assertEqual(0);
      expect(ledger.lastReason()).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_028, end');
    });

    /**
     * Scenario: events are published to the ring buffer.
     * Expectation: the newest event is first and the rendered text matches the contract.
     */
    it('Assessment_ErrorRecovery_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_029, begin');
      const ring: EventLogRing = new EventLogRing();
      ring.publish(EVENT_BEGIN, CODE_OK, '');
      const entry: LogEntry = ring.publish(EVENT_END, CODE_OK, '');
      expect(ring.size()).assertEqual(2);
      expect(ring.head()?.type).assertEqual(EVENT_END);
      expect(entry.rendered).assertEqual(renderEvent(EVENT_END, CODE_OK, ''));
      expect(ring.at(1)?.type).assertEqual(EVENT_BEGIN);
      hilog.info(DOMAIN, TAG, '%{public}s', ring.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_029, end');
    });

    /**
     * Scenario: the sequence counter of the ring grows.
     * Expectation: every published event carries a strictly larger sequence.
     */
    it('Assessment_ErrorRecovery_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_031, begin');
      const ring: EventLogRing = new EventLogRing();
      const first: LogEntry = ring.publish(EVENT_BEGIN, CODE_OK, '');
      const second: LogEntry = ring.publish(EVENT_INTERRUPTED, CODE_ENV_ANOMALY, 'environment changed');
      expect(first.seq).assertEqual(1);
      expect(second.seq).assertEqual(2);
      expect(second.seq > first.seq).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_031, end');
    });

    /**
     * Scenario: the event log is replayed after a failure.
     * Expectation: only the entries newer than the observed sequence are returned.
     */
    it('Assessment_ErrorRecovery_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_032, begin');
      const ring: EventLogRing = new EventLogRing();
      ring.publish(EVENT_BEGIN, CODE_OK, '');
      ring.publish(EVENT_API_ERROR, CODE_SYSTEM_ERROR, 'begin threw');
      ring.publish(EVENT_END, CODE_OK, '');
      const replayed: LogEntry[] = ring.replayAfter(1);
      expect(replayed.length).assertEqual(2);
      expect(replayed[0].type).assertEqual(EVENT_END);
      expect(replayed[1].type).assertEqual(EVENT_API_ERROR);
      hilog.info(DOMAIN, TAG, '%{public}s replay count: %{public}d',
        BUNDLE + 'ErrorRecovery_032', replayed.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_032, end');
    });

    /**
     * Scenario: the log is replayed without any newer entry.
     * Expectation: the replay answers an empty list rather than the observed entry.
     */
    it('Assessment_ErrorRecovery_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_033, begin');
      const ring: EventLogRing = new EventLogRing();
      ring.publish(EVENT_BEGIN, CODE_OK, '');
      expect(ring.replayAfter(1).length).assertEqual(0);
      expect(ring.replayAfter(5).length).assertEqual(0);
      expect(ring.replayAfter(0).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_033, end');
    });

    /**
     * Scenario: an empty ring is replayed.
     * Expectation: both replay helpers answer an empty list.
     */
    it('Assessment_ErrorRecovery_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_034, begin');
      const ring: EventLogRing = new EventLogRing();
      expect(ring.size()).assertEqual(0);
      expect(ring.head() === undefined).assertTrue();
      expect(ring.replayAfter(0).length).assertEqual(0);
      expect(ring.replayAfterLimited(0, 5).length).assertEqual(0);
      expect(ring.at(0) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_034, end');
    });

    /**
     * Scenario: a replay is limited to a fixed number of entries.
     * Expectation: the helper never returns more entries than the limit.
     */
    it('Assessment_ErrorRecovery_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_035, begin');
      const ring: EventLogRing = new EventLogRing();
      for (let i = 0; i < 6; i++) {
        ring.publish(EVENT_API_ERROR, CODE_TIMEOUT, `timeout ${i}`);
      }
      expect(ring.replayAfterLimited(0, 2).length).assertEqual(2);
      expect(ring.replayAfterLimited(0, 100).length).assertEqual(6);
      expect(ring.replayAfterLimited(0, 0).length).assertEqual(0);
      expect(ring.replayAfterLimited(0, -3).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_035, end');
    });

    /**
     * Scenario: events of different types are counted.
     * Expectation: the type counter only counts the matching entries.
     */
    it('Assessment_ErrorRecovery_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_036, begin');
      const ring: EventLogRing = new EventLogRing();
      ring.publish(EVENT_API_ERROR, CODE_SYSTEM_ERROR, 'a');
      ring.publish(EVENT_API_ERROR, CODE_TIMEOUT, 'b');
      ring.publish(EVENT_BEGIN, CODE_OK, '');
      expect(ring.countOfType(EVENT_API_ERROR)).assertEqual(2);
      expect(ring.countOfType(EVENT_BEGIN)).assertEqual(1);
      expect(ring.countOfType(EVENT_END)).assertEqual(0);
      expect(ring.types().length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_036, end');
    });

    /**
     * Scenario: the ring is cleared.
     * Expectation: the entry count returns to zero and the head is undefined.
     */
    it('Assessment_ErrorRecovery_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_037, begin');
      const ring: EventLogRing = new EventLogRing();
      ring.publish(EVENT_BEGIN, CODE_OK, '');
      ring.clear();
      expect(ring.size()).assertEqual(0);
      expect(ring.head() === undefined).assertTrue();
      expect(ring.all().length).assertEqual(0);
      const after: LogEntry = ring.publish(EVENT_END, CODE_OK, '');
      expect(after.seq).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_037, end');
    });

    /**
     * Scenario: an API error is published.
     * Expectation: the code is preserved and the active flag is untouched.
     */
    it('Assessment_ErrorRecovery_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_038, begin');
      coordinator.reset();
      coordinator.handleBegin(CODE_OK, '');
      coordinator.handleApiError(CODE_SYSTEM_ERROR, 'begin threw');
      expect(coordinator.active()).assertTrue();
      expect(coordinator.logs().head()?.type).assertEqual(EVENT_API_ERROR);
      expect(coordinator.logs().head()?.code).assertEqual(CODE_SYSTEM_ERROR);
      expect(coordinator.logs().head()?.message).assertEqual('begin threw');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_038, end');
    });

    /**
     * Scenario: an interrupt arrives during an active session.
     * Expectation: the active flag turns false and the interrupt is logged.
     */
    it('Assessment_ErrorRecovery_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_039, begin');
      coordinator.reset();
      coordinator.handleBegin(CODE_OK, '');
      const flipped: boolean = coordinator.handleInterrupted(CODE_ENV_ANOMALY, 'environment changed');
      expect(flipped).assertTrue();
      expect(coordinator.active()).assertFalse();
      expect(coordinator.logs().head()?.type).assertEqual(EVENT_INTERRUPTED);
      expect(coordinator.logs().head()?.code).assertEqual(CODE_ENV_ANOMALY);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_039, end');
    });

    /**
     * Scenario: an interrupt arrives while no session is active.
     * Expectation: the flag does not flip and the event is still logged.
     */
    it('Assessment_ErrorRecovery_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_040, begin');
      coordinator.reset();
      const flipped: boolean = coordinator.handleInterrupted(CODE_TIMEOUT, 'dialog expired');
      expect(flipped).assertFalse();
      expect(coordinator.active()).assertFalse();
      expect(coordinator.logs().size()).assertEqual(1);
      expect(coordinator.state().flipCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_040, end');
    });

    /**
     * Scenario: the session ends normally.
     * Expectation: the flag turns false and the end event carries the OK code.
     */
    it('Assessment_ErrorRecovery_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_041, begin');
      coordinator.reset();
      coordinator.handleBegin(CODE_OK, '');
      const flipped: boolean = coordinator.handleEnd();
      expect(flipped).assertTrue();
      expect(coordinator.active()).assertFalse();
      expect(coordinator.logs().head()?.type).assertEqual(EVENT_END);
      expect(coordinator.logs().head()?.code).assertEqual(CODE_OK);
      expect(coordinator.logs().head()?.message).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_041, end');
    });

    /**
     * Scenario: the active flag is derived from the replayed log.
     * Expectation: a begin with the OK code derives true, every other head derives false.
     */
    it('Assessment_ErrorRecovery_042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_042, begin');
      coordinator.reset();
      expect(coordinator.deriveActiveFromLog()).assertFalse();
      coordinator.handleBegin(CODE_OK, '');
      expect(coordinator.deriveActiveFromLog()).assertTrue();
      coordinator.handleInterrupted(CODE_TIMEOUT, 'expired');
      expect(coordinator.deriveActiveFromLog()).assertFalse();
      coordinator.handleBegin(CODE_USER_CANCEL, 'cancelled');
      expect(coordinator.deriveActiveFromLog()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_042, end');
    });

    /**
     * Scenario: an interruption is evaluated for resume.
     * Expectation: a user cancellation blocks the resume.
     */
    it('Assessment_ErrorRecovery_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_043, begin');
      const model: InterruptionRecoveryModel = new InterruptionRecoveryModel();
      expect(model.decide(CODE_USER_CANCEL, true, 0)).assertEqual(ResumeDecision.RESUME_BLOCKED);
      expect(model.remainingAttempts(CODE_USER_CANCEL, 0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_043, end');
    });

    /**
     * Scenario: a timeout interrupt is evaluated for resume.
     * Expectation: the resume is allowed while the budget has remaining attempts.
     */
    it('Assessment_ErrorRecovery_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_044, begin');
      const model: InterruptionRecoveryModel = new InterruptionRecoveryModel();
      expect(model.decide(CODE_TIMEOUT, true, 0)).assertEqual(ResumeDecision.RESUME_ALLOWED);
      expect(model.remainingAttempts(CODE_TIMEOUT, 1)).assertEqual(MAX_ATTEMPTS_TIMEOUT - 1);
      expect(model.decide(CODE_TIMEOUT, true, ATTEMPTS_EXHAUSTED)).assertEqual(ResumeDecision.RESUME_BLOCKED);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_044, end');
    });

    /**
     * Scenario: an environment anomaly interrupt is evaluated for resume.
     * Expectation: the resume is denied once the small budget is spent.
     */
    it('Assessment_ErrorRecovery_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_045, begin');
      const model: InterruptionRecoveryModel = new InterruptionRecoveryModel();
      expect(model.decide(CODE_ENV_ANOMALY, true, 0)).assertEqual(ResumeDecision.RESUME_ALLOWED);
      expect(model.decide(CODE_ENV_ANOMALY, true, MAX_ATTEMPTS_ENV_ANOMALY))
        .assertEqual(ResumeDecision.RESUME_BLOCKED);
      expect(model.remainingAttempts(CODE_ENV_ANOMALY, 5)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_045, end');
    });

    /**
     * Scenario: an interrupt arrives for a session that was never active.
     * Expectation: a fresh session is required regardless of the code.
     */
    it('Assessment_ErrorRecovery_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_046, begin');
      const model: InterruptionRecoveryModel = new InterruptionRecoveryModel();
      expect(model.decide(CODE_TIMEOUT, false, 0)).assertEqual(ResumeDecision.FRESH_SESSION);
      expect(model.decide(CODE_ENV_ANOMALY, false, 0)).assertEqual(ResumeDecision.FRESH_SESSION);
      expect(model.decide(CODE_UNKNOWN, false, 0)).assertEqual(ResumeDecision.FRESH_SESSION);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_046, end');
    });

    /**
     * Scenario: a sequence of begin, interrupt and retry runs through the coordinator.
     * Expectation: the log holds the three events in reverse order and the flag is false.
     */
    it('Assessment_ErrorRecovery_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_047, begin');
      coordinator.reset();
      coordinator.handleBegin(CODE_OK, '');
      coordinator.handleInterrupted(CODE_TIMEOUT, 'dialog expired');
      const decision: RetryDecision = coordinator.handleBegin(CODE_TIMEOUT, 'retry attempt');
      expect(decision.allowed).assertTrue();
      expect(coordinator.logs().size()).assertEqual(3);
      expect(coordinator.logs().types()[0]).assertEqual(EVENT_BEGIN);
      expect(coordinator.logs().types()[1]).assertEqual(EVENT_INTERRUPTED);
      expect(coordinator.logs().types()[2]).assertEqual(EVENT_BEGIN);
      expect(coordinator.active()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', coordinator.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_047, end');
    });

    /**
     * Scenario: the coordinator is reset in the middle of a session.
     * Expectation: the active flag, the log and the failure counters are cleared.
     */
    it('Assessment_ErrorRecovery_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_048, begin');
      coordinator.reset();
      coordinator.handleBegin(CODE_TIMEOUT, 'failed');
      coordinator.handleBegin(CODE_OK, '');
      coordinator.reset();
      expect(coordinator.active()).assertFalse();
      expect(coordinator.logs().size()).assertEqual(0);
      expect(coordinator.failureCount(CODE_TIMEOUT)).assertEqual(0);
      expect(coordinator.state().size()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_048, end');
    });

    /**
     * Scenario: a complete failure and recovery cycle is modelled.
     * Expectation: the coordinator ends the cycle inactive with a fully populated log.
     */
    it('Assessment_ErrorRecovery_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_056, begin');
      coordinator.reset();
      coordinator.handleBegin(CODE_TIMEOUT, 'dialog expired');
      coordinator.handleBegin(CODE_SYSTEM_ERROR, 'service unavailable');
      coordinator.handleBegin(CODE_OK, '');
      expect(coordinator.active()).assertTrue();
      coordinator.handleInterrupted(CODE_ENV_ANOMALY, 'environment changed');
      expect(coordinator.active()).assertFalse();
      expect(coordinator.logs().size()).assertEqual(4);
      expect(coordinator.logs().countOfType(EVENT_BEGIN)).assertEqual(3);
      expect(coordinator.logs().countOfType(EVENT_INTERRUPTED)).assertEqual(1);
      expect(coordinator.state().flipCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', coordinator.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_056, end');
    });

    /**
     * Scenario: the verdict table summary is rendered.
     * Expectation: the summary reports five rows and three recoverable ones.
     */
    it('Assessment_ErrorRecovery_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_057, begin');
      const summary: string = table.summary();
      expect(summary).assertContain('rows=5');
      expect(summary).assertContain('recoverable=3');
      const coordinatorSummary: string = coordinator.summary();
      expect(coordinatorSummary).assertContain('RecoveryCoordinator');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_057, end');
    });

    /**
     * Scenario: the rendered text of an event is compared with the controller contract.
     * Expectation: the text carries the type, the code and the message in that order.
     */
    it('Assessment_ErrorRecovery_059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_059, begin');
      const rendered: string = renderEvent(EVENT_INTERRUPTED, CODE_ENV_ANOMALY, 'environment changed');
      expect(rendered).assertEqual('onInterrupted code=4 message=environment changed');
      expect(rendered.indexOf(EVENT_INTERRUPTED)).assertEqual(0);
      expect(rendered).assertContain('code=4');
      const emptyMessage: string = renderEvent(EVENT_END, CODE_OK, '');
      expect(emptyMessage).assertEqual('onEnd code=0 message=');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_059, end');
    });

    /**
     * Scenario: a failure counter is observed across mixed codes.
     * Expectation: every code keeps its own counter and the totals add up.
     */
    it('Assessment_ErrorRecovery_060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_060, begin');
      coordinator.reset();
      coordinator.handleBegin(CODE_TIMEOUT, 'a');
      coordinator.handleBegin(CODE_TIMEOUT, 'b');
      coordinator.handleBegin(CODE_ENV_ANOMALY, 'c');
      expect(coordinator.failureCount(CODE_TIMEOUT)).assertEqual(2);
      expect(coordinator.failureCount(CODE_ENV_ANOMALY)).assertEqual(1);
      expect(coordinator.failureCount(CODE_OK)).assertEqual(0);
      expect(coordinator.failureCount(CODE_USER_CANCEL)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorRecovery_060, end');
    });
  });
}
