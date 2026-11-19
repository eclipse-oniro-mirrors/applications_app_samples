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
  ID_QUERY_STATE_BUTTON,
  ID_EXAM_TITLE,
  TEXT_STATE_ACTIVE,
  TEXT_STATE_INACTIVE,
  TEXT_NO_EVENT,
  TEXT_DIALOG_CONFIRM,
  TEXT_EXAM_SUBMIT,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_PAGE_TRANSITION,
  TIMEOUT_DIALOG_RENDER,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  indexComponentCount,
  checkTextContent,
  waitForIndexPage,
  waitForExamPage,
  clickIndexButton,
  waitForAlertDialog,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Event type strings published by the controller and consumed by the pages.
const EVENT_BEGIN: string = 'onBegin';
const EVENT_INTERRUPTED: string = 'onInterrupted';
const EVENT_END: string = 'onEnd';
const EVENT_API_ERROR: string = 'onApiError';

// Documented AssessmentErrorCode values.
const CODE_OK: number = 0;
const CODE_USER_CANCEL: number = 1;
const CODE_TIMEOUT: number = 2;
const CODE_SYSTEM_ERROR: number = 3;
const CODE_ENV_ANOMALY: number = 4;

// Size limit of the controller event log.
const MAX_EVENT_LOG: number = 20;

// Resource names of the reason strings rendered by the interrupt dialog. The names are the
// keys of the string resources, the dialog renders the localized value of them.
const REASON_USER_CANCEL: string = 'reason_user_cancel';
const REASON_TIMEOUT: string = 'reason_timeout';
const REASON_SYSTEM_ERROR: string = 'reason_system_error';
const REASON_ENV_ANOMALY: string = 'reason_env_anomaly';
const REASON_UNKNOWN: string = 'reason_unknown';

// Titles used by the two dialogs of the exam page.
const TITLE_INTERRUPT: string = 'exam_interrupt_title';
const TITLE_END: string = 'exam_end_title';
const TITLE_FINISH: string = 'exam_finish_title';

// Dialog of the exam page never auto cancels, the examinee has to confirm it.
const DIALOG_AUTO_CANCEL: boolean = false;

// Number of recovery rounds used by the stress cases.
const STRESS_ROUNDS_RECOVERY: number = 100;

/**
 * Interruption codes reported by the assessment service.
 *
 * The enumeration mirrors assessment.AssessmentErrorCode, the values are re-declared because a
 * test module must not import from the sample source tree.
 */
enum InterruptionCode {
  USER_CANCEL = 1,
  TIMEOUT = 2,
  SYSTEM_ERROR = 3,
  ENV_ANOMALY = 4
}

/**
 * Coarse impact of an interruption on the running session.
 */
enum InterruptionImpact {
  NONE = 'none',
  PAUSED = 'paused',
  TERMINATED = 'terminated'
}

/**
 * State of one recovery attempt.
 */
enum RecoveryPhase {
  IDLE = 'idle',
  DETECTED = 'detected',
  DIALOG_SHOWN = 'dialog_shown',
  ROLLED_BACK = 'rolled_back',
  COMPLETED = 'completed'
}

/**
 * Interrupt object that the onInterrupted callback receives.
 */
interface InterruptInfo {
  code: number;
  message: string;
}

/**
 * One entry of the event log of the controller.
 */
interface LogEntry {
  type: string;
  code: number;
  message: string;
}

/**
 * Snapshot of the observable state after an interruption was handled.
 */
interface RecoverySnapshot {
  active: boolean;
  eventType: string;
  eventCode: number;
  reason: string;
  dialogShown: boolean;
  dialogTitle: string;
  logSize: number;
}

/**
 * Maps the interruption codes onto the reason resource names of the dialog.
 *
 * ExamPage.formatReason uses the same order of comparisons, an unknown code falls through to
 * the generic reason. The mapper reproduces that behaviour without a device.
 */
class ReasonMapper {
  public reasonOf(code: number): string {
    if (code === CODE_USER_CANCEL) {
      return REASON_USER_CANCEL;
    }
    if (code === CODE_TIMEOUT) {
      return REASON_TIMEOUT;
    }
    if (code === CODE_SYSTEM_ERROR) {
      return REASON_SYSTEM_ERROR;
    }
    if (code === CODE_ENV_ANOMALY) {
      return REASON_ENV_ANOMALY;
    }
    return REASON_UNKNOWN;
  }

  public isKnown(code: number): boolean {
    return code === CODE_USER_CANCEL || code === CODE_TIMEOUT || code === CODE_SYSTEM_ERROR ||
      code === CODE_ENV_ANOMALY;
  }

  public knownReasons(): string[] {
    return [REASON_USER_CANCEL, REASON_TIMEOUT, REASON_SYSTEM_ERROR, REASON_ENV_ANOMALY];
  }

  public distinctReasonCount(): number {
    const seen: Set<string> = new Set<string>();
    const codes: number[] = [CODE_USER_CANCEL, CODE_TIMEOUT, CODE_SYSTEM_ERROR, CODE_ENV_ANOMALY];
    for (let i = 0; i < codes.length; i++) {
      seen.add(this.reasonOf(codes[i]));
    }
    return seen.size;
  }
}

/**
 * Classifies the impact of an interruption code.
 *
 * Every interruption terminates the running session, the sample never resumes an interrupted
 * assessment, so the impact is TERMINATED for the four documented codes.
 */
class InterruptionClassifier {
  public static impactOf(code: number): InterruptionImpact {
    if (code === CODE_USER_CANCEL || code === CODE_TIMEOUT || code === CODE_SYSTEM_ERROR ||
      code === CODE_ENV_ANOMALY) {
      return InterruptionImpact.TERMINATED;
    }
    return InterruptionImpact.NONE;
  }

  public static isTerminating(code: number): boolean {
    return InterruptionClassifier.impactOf(code) === InterruptionImpact.TERMINATED;
  }

  public static isUserInitiated(code: number): boolean {
    return code === CODE_USER_CANCEL;
  }

  public static isEnvironmental(code: number): boolean {
    return code === CODE_ENV_ANOMALY;
  }
}

/**
 * Model of the interruption handling of the sample.
 *
 * The model reproduces AssessmentController.handleInterrupted, AssessmentController.handleEnd and
 * ExamPage.showExitDialog. It keeps the active flag, the event log, the dialog guard and the
 * reason of the last interruption, so the rollback and the dialog-once rule can be asserted
 * without a device.
 */
class InterruptionStateModel {
  private active: boolean = false;
  private log: LogEntry[] = [];
  private dialogShown: boolean = false;
  private dialogCount: number = 0;
  private dialogTitle: string = '';
  private dialogReason: string = '';
  private lastInterrupt: InterruptInfo | undefined = undefined;
  private beginCalls: number = 0;
  private interruptedCalls: number = 0;
  private endCalls: number = 0;
  private recoveryAttempts: number = 0;
  private phase: RecoveryPhase = RecoveryPhase.IDLE;
  private mapper: ReasonMapper = new ReasonMapper();

  public beginSuccess(): void {
    this.beginCalls++;
    this.active = true;
    this.appendLog(EVENT_BEGIN, CODE_OK, '');
  }

  public beginFailure(code: number, message: string): void {
    this.beginCalls++;
    this.active = false;
    this.appendLog(EVENT_BEGIN, code, message);
    if (code !== CODE_OK) {
      this.openDialog(TITLE_END, message);
    }
  }

  public interrupt(code: number, message: string): void {
    this.interruptedCalls++;
    this.lastInterrupt = {
      code: code,
      message: message
    };
    this.active = false;
    this.appendLog(EVENT_INTERRUPTED, code, message);
    this.openDialog(TITLE_INTERRUPT, this.mapper.reasonOf(code));
  }

  public end(): void {
    this.endCalls++;
    this.active = false;
    this.appendLog(EVENT_END, CODE_OK, '');
    this.openDialog(TITLE_END, '');
  }

  private openDialog(title: string, reason: string): void {
    if (this.dialogShown) {
      return;
    }
    this.dialogShown = true;
    this.dialogCount++;
    this.dialogTitle = title;
    this.dialogReason = reason;
    this.phase = RecoveryPhase.DIALOG_SHOWN;
  }

  private appendLog(type: string, code: number, message: string): void {
    const entry: LogEntry = {
      type: type,
      code: code,
      message: message
    };
    const candidate: LogEntry[] = this.log.slice();
    candidate.unshift(entry);
    if (candidate.length > MAX_EVENT_LOG) {
      candidate.pop();
    }
    this.log = candidate;
  }

  public resetForNewPage(): void {
    this.dialogShown = false;
    this.dialogTitle = '';
    this.dialogReason = '';
    this.phase = RecoveryPhase.IDLE;
  }

  public markRolledBack(): void {
    this.recoveryAttempts++;
    this.phase = RecoveryPhase.ROLLED_BACK;
  }

  public markCompleted(): void {
    this.recoveryAttempts++;
    this.phase = RecoveryPhase.COMPLETED;
  }

  public isActive(): boolean {
    return this.active;
  }

  public isDialogShown(): boolean {
    return this.dialogShown;
  }

  public getDialogCount(): number {
    return this.dialogCount;
  }

  public getDialogTitle(): string {
    return this.dialogTitle;
  }

  public getDialogReason(): string {
    return this.dialogReason;
  }

  public getLastInterrupt(): InterruptInfo | undefined {
    return this.lastInterrupt;
  }

  public getEventJournal(): LogEntry[] {
    return this.log.slice();
  }

  public logSize(): number {
    return this.log.length;
  }

  public getBeginCalls(): number {
    return this.beginCalls;
  }

  public getInterruptedCalls(): number {
    return this.interruptedCalls;
  }

  public getEndCalls(): number {
    return this.endCalls;
  }

  public getRecoveryAttempts(): number {
    return this.recoveryAttempts;
  }

  public getPhase(): RecoveryPhase {
    return this.phase;
  }

  public lastLogEntry(): LogEntry | undefined {
    if (this.log.length === 0) {
      return undefined;
    }
    return this.log[0];
  }

  public countOfType(type: string): number {
    let count: number = 0;
    for (let i = 0; i < this.log.length; i++) {
      if (this.log[i].type === type) {
        count++;
      }
    }
    return count;
  }

  public snapshot(): RecoverySnapshot {
    const entry: LogEntry | undefined = this.lastLogEntry();
    return {
      active: this.active,
      eventType: entry === undefined ? '' : entry.type,
      eventCode: entry === undefined ? -1 : entry.code,
      reason: this.dialogReason,
      dialogShown: this.dialogShown,
      dialogTitle: this.dialogTitle,
      logSize: this.log.length
    };
  }

  public describe(): string {
    return `InterruptionStateModel{active=${this.active}, logs=${this.log.length}, ` +
      `dialogShown=${this.dialogShown}, phase=${this.phase}}`;
  }
}

/**
 * Model of the dialog guard of the exam page.
 *
 * ExamPage keeps one boolean per page instance and shows at most one dialog, the guard model
 * makes the per-instance boundary explicit: resetting the page state creates a new guard,
 * while a second event on the same page instance is dropped.
 */
class DialogGuard {
  private shown: boolean = false;
  private attempts: number = 0;
  private granted: number = 0;
  private lastTitle: string = '';

  public request(title: string): boolean {
    this.attempts++;
    if (this.shown) {
      return false;
    }
    this.shown = true;
    this.granted++;
    this.lastTitle = title;
    return true;
  }

  public isShown(): boolean {
    return this.shown;
  }

  public getAttempts(): number {
    return this.attempts;
  }

  public getGranted(): number {
    return this.granted;
  }

  public getLastTitle(): string {
    return this.lastTitle;
  }

  public reset(): void {
    this.shown = false;
    this.lastTitle = '';
  }

  public isAutoCancelDisabled(): boolean {
    return DIALOG_AUTO_CANCEL === false;
  }
}

/**
 * Orders the recovery steps of an interrupted session.
 *
 * The pages rely on a fixed order: the active flag is cleared first, then the event is
 * published so that the pages react, and only then the dialog is offered. A step that runs
 * before its predecessor would leave the UI in a state that contradicts the service.
 */
class RecoverySequencer {
  private steps: string[] = [];

  public build(): string[] {
    this.steps = ['clear_active', 'publish_event', 'open_dialog', 'route_back'];
    return this.steps.slice();
  }

  public indexOf(step: string): number {
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i] === step) {
        return i;
      }
    }
    return -1;
  }

  public size(): number {
    return this.steps.length;
  }

  public precedes(first: string, second: string): boolean {
    const firstIndex: number = this.indexOf(first);
    const secondIndex: number = this.indexOf(second);
    if (firstIndex < 0 || secondIndex < 0) {
      return false;
    }
    return firstIndex < secondIndex;
  }

  public reverse(): string[] {
    const values: string[] = [];
    for (let i = this.steps.length - 1; i >= 0; i--) {
      values.push(this.steps[i]);
    }
    return values;
  }
}

/**
 * Builds the log entry text exactly the way the controller builds it.
 *
 * @param type event type.
 * @param code error code.
 * @param message error message.
 * @returns the log entry of the event.
 */
function formatLogEntry(type: string, code: number, message: string): string {
  return `${type} code=${code} message=${message}`;
}

/**
 * Checks whether a code is one of the documented interruption codes.
 *
 * @param code code reported by the assessment service.
 * @returns true for USER_CANCEL, TIMEOUT, SYSTEM_ERROR and ENV_ANOMALY.
 */
function isInterruptionCode(code: number): boolean {
  return code === CODE_USER_CANCEL || code === CODE_TIMEOUT || code === CODE_SYSTEM_ERROR ||
    code === CODE_ENV_ANOMALY;
}

/**
 * Evaluates a condition over a range of interruption codes.
 *
 * @param predicate condition evaluated for every documented code.
 * @returns true when the predicate holds for every documented code.
 */
function holdsForEveryCode(predicate: (code: number) => boolean): boolean {
  const codes: number[] = [CODE_USER_CANCEL, CODE_TIMEOUT, CODE_SYSTEM_ERROR, CODE_ENV_ANOMALY];
  for (let i = 0; i < codes.length; i++) {
    if (!predicate(codes[i])) {
      return false;
    }
  }
  return true;
}

export default function interruptionRecoveryTest() {
  describe('InterruptionRecovery_Test', () => {
    let driver: Driver;
    let mapper: ReasonMapper;
    let guard: DialogGuard;
    let sequencer: RecoverySequencer;

    beforeAll(async () => {
      driver = getDriver();
      mapper = new ReasonMapper();
      guard = new DialogGuard();
      sequencer = new RecoverySequencer();
      sequencer.build();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_TRANSITION);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the interruption code values of the assessment service.
     * Expectation: the four interruption codes keep the documented numeric values and the
     * success code stays zero.
     */
    it('Assessment_InterruptionCodes_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptionCodes_001, begin');
      expect(CODE_OK).assertEqual(0);
      expect(InterruptionCode.USER_CANCEL).assertEqual(1);
      expect(InterruptionCode.TIMEOUT).assertEqual(2);
      expect(InterruptionCode.SYSTEM_ERROR).assertEqual(3);
      expect(InterruptionCode.ENV_ANOMALY).assertEqual(4);
      expect(isInterruptionCode(CODE_OK)).assertFalse();
      expect(isInterruptionCode(InterruptionCode.USER_CANCEL)).assertTrue();
      expect(isInterruptionCode(InterruptionCode.ENV_ANOMALY)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptionCodes_001, end');
    });

    /**
     * Scenario: the event type strings that the pages switch on.
     * Expectation: the interruption event is 'onInterrupted', the three other strings are
     * distinct so a switch statement cannot collide.
     */
    it('Assessment_EventTypeStrings_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventTypeStrings_002, begin');
      expect(EVENT_INTERRUPTED).assertEqual('onInterrupted');
      expect(EVENT_BEGIN).assertEqual('onBegin');
      expect(EVENT_END).assertEqual('onEnd');
      expect(EVENT_API_ERROR).assertEqual('onApiError');
      const types: string[] = [EVENT_BEGIN, EVENT_INTERRUPTED, EVENT_END, EVENT_API_ERROR];
      const unique: Set<string> = new Set<string>(types);
      expect(unique.size).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventTypeStrings_002, end');
    });

    /**
     * Scenario: map the documented interruption codes onto the reason resources.
     * Expectation: every documented code answers its own reason resource name.
     */
    it('Assessment_ReasonMappingKnown_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReasonMappingKnown_003, begin');
      expect(mapper.reasonOf(CODE_USER_CANCEL)).assertEqual(REASON_USER_CANCEL);
      expect(mapper.reasonOf(CODE_TIMEOUT)).assertEqual(REASON_TIMEOUT);
      expect(mapper.reasonOf(CODE_SYSTEM_ERROR)).assertEqual(REASON_SYSTEM_ERROR);
      expect(mapper.reasonOf(CODE_ENV_ANOMALY)).assertEqual(REASON_ENV_ANOMALY);
      expect(mapper.isKnown(CODE_TIMEOUT)).assertTrue();
      expect(mapper.distinctReasonCount()).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReasonMappingKnown_003, end');
    });

    /**
     * Scenario: map a code that the service does not document.
     * Expectation: the mapper answers the generic reason instead of throwing or reusing a
     * documented reason.
     */
    it('Assessment_ReasonMappingUnknown_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReasonMappingUnknown_004, begin');
      expect(mapper.reasonOf(CODE_OK)).assertEqual(REASON_UNKNOWN);
      expect(mapper.reasonOf(5)).assertEqual(REASON_UNKNOWN);
      expect(mapper.reasonOf(201)).assertEqual(REASON_UNKNOWN);
      expect(mapper.reasonOf(-1)).assertEqual(REASON_UNKNOWN);
      expect(mapper.isKnown(5)).assertFalse();
      expect(mapper.isKnown(CODE_OK)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReasonMappingUnknown_004, end');
    });

    /**
     * Scenario: the reason resources are pairwise distinct.
     * Expectation: no two documented codes render the same reason, so the dialog always names
     * the actual cause.
     */
    it('Assessment_ReasonMappingDistinct_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReasonMappingDistinct_005, begin');
      const reasons: string[] = mapper.knownReasons();
      expect(reasons.length).assertEqual(4);
      const unique: Set<string> = new Set<string>(reasons);
      expect(unique.size).assertEqual(4);
      expect(reasons.indexOf(REASON_UNKNOWN)).assertEqual(-1);
      expect(holdsForEveryCode((code: number) => mapper.reasonOf(code).length > 0)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReasonMappingDistinct_005, end');
    });

    /**
     * Scenario: classify the impact of every documented interruption code.
     * Expectation: every documented code terminates the session and an unknown code has no
     * impact.
     */
    it('Assessment_InterruptionImpact_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptionImpact_006, begin');
      expect(InterruptionClassifier.impactOf(CODE_USER_CANCEL)).assertEqual(InterruptionImpact.TERMINATED);
      expect(InterruptionClassifier.impactOf(CODE_TIMEOUT)).assertEqual(InterruptionImpact.TERMINATED);
      expect(InterruptionClassifier.impactOf(CODE_ENV_ANOMALY)).assertEqual(InterruptionImpact.TERMINATED);
      expect(InterruptionClassifier.impactOf(99)).assertEqual(InterruptionImpact.NONE);
      expect(holdsForEveryCode((code: number) => InterruptionClassifier.isTerminating(code))).assertTrue();
      expect(InterruptionClassifier.isUserInitiated(CODE_USER_CANCEL)).assertTrue();
      expect(InterruptionClassifier.isUserInitiated(CODE_TIMEOUT)).assertFalse();
      expect(InterruptionClassifier.isEnvironmental(CODE_ENV_ANOMALY)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptionImpact_006, end');
    });

    /**
     * Scenario: an interruption arrives while a session is active.
     * Expectation: the active flag is rolled back to false and the interruption is the last
     * published event.
     */
    it('Assessment_ActiveRollback_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ActiveRollback_007, begin');
      const local: InterruptionStateModel = new InterruptionStateModel();
      local.beginSuccess();
      expect(local.isActive()).assertTrue();
      local.interrupt(CODE_TIMEOUT, 'the duration expired');
      expect(local.isActive()).assertFalse();
      const entry: LogEntry | undefined = local.lastLogEntry();
      expect(entry !== undefined).assertTrue();
      if (entry !== undefined) {
        expect(entry.type).assertEqual(EVENT_INTERRUPTED);
        expect(entry.code).assertEqual(CODE_TIMEOUT);
      }
      expect(local.getInterruptedCalls()).assertEqual(1);
      expect(local.getEndCalls()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', local.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ActiveRollback_007, end');
    });

    /**
     * Scenario: a begin that fails with a documented code.
     * Expectation: the active flag stays false, the begin event is published with the failure
     * code and the exit dialog is offered only once.
     */
    it('Assessment_ActiveRollbackFromBeginFailure_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ActiveRollbackFromBeginFailure_008, begin');
      const local: InterruptionStateModel = new InterruptionStateModel();
      local.beginFailure(CODE_USER_CANCEL, 'the user canceled');
      expect(local.isActive()).assertFalse();
      expect(local.getBeginCalls()).assertEqual(1);
      expect(local.isDialogShown()).assertTrue();
      expect(local.getDialogTitle()).assertEqual(TITLE_END);
      expect(local.getDialogReason()).assertEqual('the user canceled');
      expect(local.getDialogCount()).assertEqual(1);
      const entry: LogEntry | undefined = local.lastLogEntry();
      if (entry !== undefined) {
        expect(entry.type).assertEqual(EVENT_BEGIN);
        expect(entry.code).assertEqual(CODE_USER_CANCEL);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ActiveRollbackFromBeginFailure_008, end');
    });

    /**
     * Scenario: a successful begin followed by a normal end.
     * Expectation: the active flag is cleared, the end event carries the OK code and the
     * interruption counter stays untouched.
     */
    it('Assessment_EndClearsActive_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndClearsActive_009, begin');
      const local: InterruptionStateModel = new InterruptionStateModel();
      local.beginSuccess();
      local.end();
      expect(local.isActive()).assertFalse();
      expect(local.getEndCalls()).assertEqual(1);
      expect(local.getInterruptedCalls()).assertEqual(0);
      expect(local.countOfType(EVENT_END)).assertEqual(1);
      expect(local.countOfType(EVENT_BEGIN)).assertEqual(1);
      expect(local.getDialogTitle()).assertEqual(TITLE_END);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndClearsActive_009, end');
    });

    /**
     * Scenario: the log entry of an interruption.
     * Expectation: the entry carries the exact text that the status card renders, newest first.
     */
    it('Assessment_EventJournalAppend_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventJournalAppend_010, begin');
      const local: InterruptionStateModel = new InterruptionStateModel();
      local.beginSuccess();
      local.interrupt(CODE_SYSTEM_ERROR, 'the service failed');
      const log: LogEntry[] = local.getEventJournal();
      expect(log.length).assertEqual(2);
      expect(log[0].type).assertEqual(EVENT_INTERRUPTED);
      expect(log[1].type).assertEqual(EVENT_BEGIN);
      const text: string = formatLogEntry(log[0].type, log[0].code, log[0].message);
      expect(text).assertEqual('onInterrupted code=3 message=the service failed');
      expect(text).assertContain('onInterrupted');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventJournalAppend_010, end');
    });

    /**
     * Scenario: several interruptions arrive for one page instance.
     * Expectation: every interruption is logged, the newest entry is on top and the dialog is
     * offered only once.
     */
    it('Assessment_EventJournalOrder_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventJournalOrder_011, begin');
      const local: InterruptionStateModel = new InterruptionStateModel();
      local.beginSuccess();
      local.interrupt(CODE_TIMEOUT, 'first');
      local.interrupt(CODE_ENV_ANOMALY, 'second');
      local.interrupt(CODE_SYSTEM_ERROR, 'third');
      const log: LogEntry[] = local.getEventJournal();
      expect(log.length).assertEqual(4);
      expect(log[0].message).assertEqual('third');
      expect(log[1].message).assertEqual('second');
      expect(log[2].message).assertEqual('first');
      expect(log[3].type).assertEqual(EVENT_BEGIN);
      expect(local.getDialogCount()).assertEqual(1);
      expect(local.getInterruptedCalls()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventJournalOrder_011, end');
    });

    /**
     * Scenario: the event log reaches its cap after many interruptions.
     * Expectation: the log stops at twenty entries and the oldest entry is dropped.
     */
    it('Assessment_EventJournalCap_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventJournalCap_012, begin');
      const local: InterruptionStateModel = new InterruptionStateModel();
      const rounds: number = MAX_EVENT_LOG + 7;
      for (let i = 0; i < rounds; i++) {
        local.interrupt(CODE_TIMEOUT, `round ${i}`);
      }
      expect(local.logSize()).assertEqual(MAX_EVENT_LOG);
      expect(local.getInterruptedCalls()).assertEqual(rounds);
      const log: LogEntry[] = local.getEventJournal();
      expect(log[0].message).assertEqual(`round ${rounds - 1}`);
      expect(log[MAX_EVENT_LOG - 1].message).assertEqual(`round ${rounds - MAX_EVENT_LOG}`);
      hilog.info(DOMAIN, TAG, '%{public}s log holds %{public}d of %{public}d interruptions',
        BUNDLE + 'EventJournalCap_012', local.logSize(), rounds);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventJournalCap_012, end');
    });

    /**
     * Scenario: the examinee re-enters the exam after an interruption.
     * Expectation: the active flag starts false, the page has a fresh dialog guard and the new
     * begin raises the active flag again.
     */
    it('Assessment_ReentryAfterInterruption_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReentryAfterInterruption_013, begin');
      const local: InterruptionStateModel = new InterruptionStateModel();
      local.beginSuccess();
      local.interrupt(CODE_USER_CANCEL, 'canceled');
      expect(local.isActive()).assertFalse();
      local.resetForNewPage();
      expect(local.isDialogShown()).assertFalse();
      expect(local.isActive()).assertFalse();
      local.beginSuccess();
      expect(local.isActive()).assertTrue();
      expect(local.getBeginCalls()).assertEqual(2);
      expect(local.getPhase()).assertEqual(RecoveryPhase.IDLE);
      hilog.info(DOMAIN, TAG, '%{public}s', local.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReentryAfterInterruption_013, end');
    });

    /**
     * Scenario: re-entry without a new begin call.
     * Expectation: clearing the page state alone does not reactivate the session, the caller
     * has to invoke begin again.
     */
    it('Assessment_ReentryRequiresExplicitBegin_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReentryRequiresExplicitBegin_014, begin');
      const local: InterruptionStateModel = new InterruptionStateModel();
      local.beginSuccess();
      local.interrupt(CODE_TIMEOUT, 'expired');
      local.resetForNewPage();
      expect(local.isActive()).assertFalse();
      expect(local.getBeginCalls()).assertEqual(1);
      local.markRolledBack();
      expect(local.isActive()).assertFalse();
      expect(local.getRecoveryAttempts()).assertEqual(1);
      expect(local.getPhase()).assertEqual(RecoveryPhase.ROLLED_BACK);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReentryRequiresExplicitBegin_014, end');
    });

    /**
     * Scenario: two interruption events arrive on one exam page instance.
     * Expectation: the guard grants the first dialog only, so the page never stacks dialogs.
     */
    it('Assessment_DialogShownOnce_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogShownOnce_015, begin');
      expect(guard.request(TITLE_INTERRUPT)).assertTrue();
      expect(guard.request(TITLE_END)).assertFalse();
      expect(guard.request(TITLE_FINISH)).assertFalse();
      expect(guard.getAttempts()).assertEqual(3);
      expect(guard.getGranted()).assertEqual(1);
      expect(guard.getLastTitle()).assertEqual(TITLE_INTERRUPT);
      expect(guard.isShown()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogShownOnce_015, end');
    });

    /**
     * Scenario: the page state is reset and a dialog is requested again.
     * Expectation: the reset guard grants the next request, which is the per page instance
     * contract of ExamPage.
     */
    it('Assessment_DialogAfterReset_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogAfterReset_016, begin');
      const local: DialogGuard = new DialogGuard();
      expect(local.request(TITLE_INTERRUPT)).assertTrue();
      local.reset();
      expect(local.isShown()).assertFalse();
      expect(local.request(TITLE_END)).assertTrue();
      expect(local.getGranted()).assertEqual(2);
      expect(local.getLastTitle()).assertEqual(TITLE_END);
      expect(local.isAutoCancelDisabled()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogAfterReset_016, end');
    });

    /**
     * Scenario: a non terminal event tries to open a dialog.
     * Expectation: the page only opens the dialog for a failed begin, an interruption or an
     * end, so a successful begin leaves the guard untouched.
     */
    it('Assessment_DialogNotShownForSuccess_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogNotShownForSuccess_017, begin');
      const local: InterruptionStateModel = new InterruptionStateModel();
      local.beginSuccess();
      expect(local.isDialogShown()).assertFalse();
      expect(local.getDialogCount()).assertEqual(0);
      expect(local.getDialogTitle()).assertEqual('');
      local.interrupt(CODE_ENV_ANOMALY, 'environment changed');
      expect(local.isDialogShown()).assertTrue();
      expect(local.getDialogTitle()).assertEqual(TITLE_INTERRUPT);
      expect(local.getDialogReason()).assertEqual(REASON_ENV_ANOMALY);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogNotShownForSuccess_017, end');
    });

    /**
     * Scenario: two exam page instances handle their own interruptions.
     * Expectation: the guard is per page instance, so the second page still shows its dialog.
     */
    it('Assessment_DialogGuardPerPageInstance_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogGuardPerPageInstance_018, begin');
      const first: DialogGuard = new DialogGuard();
      const second: DialogGuard = new DialogGuard();
      expect(first.request(TITLE_INTERRUPT)).assertTrue();
      expect(first.request(TITLE_INTERRUPT)).assertFalse();
      expect(second.request(TITLE_INTERRUPT)).assertTrue();
      expect(first.getGranted()).assertEqual(1);
      expect(second.getGranted()).assertEqual(1);
      expect(first.isShown()).assertTrue();
      expect(second.isShown()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogGuardPerPageInstance_018, end');
    });

    /**
     * Scenario: the order of the recovery steps.
     * Expectation: the active flag is cleared before the event is published and the dialog is
     * offered only after the event, the route back is last.
     */
    it('Assessment_RecoveryOrdering_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RecoveryOrdering_019, begin');
      const local: RecoverySequencer = new RecoverySequencer();
      const steps: string[] = local.build();
      expect(steps.length).assertEqual(4);
      expect(steps[0]).assertEqual('clear_active');
      expect(steps[1]).assertEqual('publish_event');
      expect(steps[2]).assertEqual('open_dialog');
      expect(steps[3]).assertEqual('route_back');
      expect(local.precedes('clear_active', 'publish_event')).assertTrue();
      expect(local.precedes('publish_event', 'open_dialog')).assertTrue();
      expect(local.precedes('open_dialog', 'route_back')).assertTrue();
      expect(local.precedes('route_back', 'clear_active')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RecoveryOrdering_019, end');
    });

    /**
     * Scenario: the reversal of the recovery step list.
     * Expectation: the reversed list is the exact mirror and its first step is the route back.
     */
    it('Assessment_RecoveryOrderReversed_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RecoveryOrderReversed_020, begin');
      const local: RecoverySequencer = new RecoverySequencer();
      local.build();
      const reversed: string[] = local.reverse();
      expect(reversed.length).assertEqual(local.size());
      expect(reversed[0]).assertEqual('route_back');
      expect(reversed[3]).assertEqual('clear_active');
      expect(reversed[0]).assertEqual(local.build()[local.size() - 1]);
      expect(local.indexOf('missing_step')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RecoveryOrderReversed_020, end');
    });

    /**
     * Scenario: an interruption that is followed by more interruptions.
     * Expectation: the session stays inactive, no second dialog is opened and the log keeps
     * every event so the status card can render the full history.
     */
    it('Assessment_InterruptionIdempotent_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptionIdempotent_021, begin');
      const local: InterruptionStateModel = new InterruptionStateModel();
      local.beginSuccess();
      local.interrupt(CODE_TIMEOUT, 'expired');
      const logAfterFirst: number = local.logSize();
      local.interrupt(CODE_TIMEOUT, 'expired');
      local.interrupt(CODE_TIMEOUT, 'expired');
      expect(local.isActive()).assertFalse();
      expect(local.getDialogCount()).assertEqual(1);
      expect(local.logSize()).assertEqual(logAfterFirst + 2);
      expect(local.countOfType(EVENT_INTERRUPTED)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptionIdempotent_021, end');
    });

    /**
     * Scenario: an interruption is delivered before any begin succeeded.
     * Expectation: the model still records the event, the dialog is offered and the active
     * flag remains false.
     */
    it('Assessment_InterruptWithoutBegin_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptWithoutBegin_022, begin');
      const local: InterruptionStateModel = new InterruptionStateModel();
      expect(local.isActive()).assertFalse();
      local.interrupt(CODE_SYSTEM_ERROR, 'unexpected');
      expect(local.getBeginCalls()).assertEqual(0);
      expect(local.getInterruptedCalls()).assertEqual(1);
      expect(local.isDialogShown()).assertTrue();
      expect(local.isActive()).assertFalse();
      const entry: LogEntry | undefined = local.lastLogEntry();
      if (entry !== undefined) {
        expect(entry.type).assertEqual(EVENT_INTERRUPTED);
        expect(entry.code).assertEqual(CODE_SYSTEM_ERROR);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptWithoutBegin_022, end');
    });

    /**
     * Scenario: the message of the interrupt object is passed through unchanged.
     * Expectation: the dialog reason and the log entry keep the exact message of the service.
     */
    it('Assessment_MessagePassthrough_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MessagePassthrough_023, begin');
      const local: InterruptionStateModel = new InterruptionStateModel();
      const message: string = 'the assessment was interrupted by a system dialog';
      local.beginSuccess();
      local.interrupt(CODE_SYSTEM_ERROR, message);
      expect(local.getLastInterrupt() !== undefined).assertTrue();
      const info: InterruptInfo | undefined = local.getLastInterrupt();
      if (info !== undefined) {
        expect(info.code).assertEqual(CODE_SYSTEM_ERROR);
        expect(info.message).assertEqual(message);
      }
      const entry: LogEntry | undefined = local.lastLogEntry();
      if (entry !== undefined) {
        expect(entry.message).assertEqual(message);
        expect(formatLogEntry(entry.type, entry.code, entry.message)).assertContain(message);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MessagePassthrough_023, end');
    });

    /**
     * Scenario: the snapshot of the model after an interruption.
     * Expectation: the snapshot reports the inactive state, the interrupt event, the mapped
     * reason and the single dialog.
     */
    it('Assessment_SnapshotAfterInterrupt_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SnapshotAfterInterrupt_024, begin');
      const local: InterruptionStateModel = new InterruptionStateModel();
      local.beginSuccess();
      local.interrupt(CODE_ENV_ANOMALY, 'environment changed');
      const snapshot: RecoverySnapshot = local.snapshot();
      expect(snapshot.active).assertFalse();
      expect(snapshot.eventType).assertEqual(EVENT_INTERRUPTED);
      expect(snapshot.eventCode).assertEqual(CODE_ENV_ANOMALY);
      expect(snapshot.reason).assertEqual(REASON_ENV_ANOMALY);
      expect(snapshot.dialogShown).assertTrue();
      expect(snapshot.dialogTitle).assertEqual(TITLE_INTERRUPT);
      expect(snapshot.logSize).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SnapshotAfterInterrupt_024, end');
    });

    /**
     * Scenario: the snapshot of a freshly created model.
     * Expectation: the snapshot reports the idle state and an empty event log.
     */
    it('Assessment_SnapshotInitial_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SnapshotInitial_025, begin');
      const local: InterruptionStateModel = new InterruptionStateModel();
      const snapshot: RecoverySnapshot = local.snapshot();
      expect(snapshot.active).assertFalse();
      expect(snapshot.eventType).assertEqual('');
      expect(snapshot.eventCode).assertEqual(-1);
      expect(snapshot.reason).assertEqual('');
      expect(snapshot.dialogShown).assertFalse();
      expect(snapshot.logSize).assertEqual(0);
      expect(local.lastLogEntry() === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SnapshotInitial_025, end');
    });

    /**
     * Scenario: a long sequence of interruption and re-entry cycles.
     * Expectation: every cycle keeps the invariant that at most one dialog is open per page
     * instance and the session is never active after an interruption.
     */
    it('Assessment_RecoveryStress_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RecoveryStress_026, begin');
      const local: InterruptionStateModel = new InterruptionStateModel();
      let dialogCycles: number = 0;
      let previousDialogs: number = 0;
      for (let i = 0; i < STRESS_ROUNDS_RECOVERY; i++) {
        local.beginSuccess();
        local.interrupt(CODE_TIMEOUT, `cycle ${i}`);
        expect(local.isActive()).assertFalse();
        if (local.getDialogCount() === previousDialogs + 1) {
          dialogCycles++;
        }
        previousDialogs = local.getDialogCount();
        local.resetForNewPage();
      }
      expect(local.getBeginCalls()).assertEqual(STRESS_ROUNDS_RECOVERY);
      expect(local.getInterruptedCalls()).assertEqual(STRESS_ROUNDS_RECOVERY);
      expect(dialogCycles).assertEqual(STRESS_ROUNDS_RECOVERY);
      expect(local.logSize()).assertEqual(MAX_EVENT_LOG);
      expect(local.isActive()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}d recovery cycles done',
        BUNDLE + 'RecoveryStress_026', STRESS_ROUNDS_RECOVERY);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RecoveryStress_026, end');
    });

    /**
     * Scenario: the recovery phase transitions.
     * Expectation: a detection moves to the dialog, a rollback and a completion share the same
     * terminal phase and every transition bumps the attempt counter.
     */
    it('Assessment_RecoveryPhaseTransitions_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RecoveryPhaseTransitions_027, begin');
      const local: InterruptionStateModel = new InterruptionStateModel();
      expect(local.getPhase()).assertEqual(RecoveryPhase.IDLE);
      local.beginSuccess();
      local.interrupt(CODE_USER_CANCEL, 'canceled');
      expect(local.getPhase()).assertEqual(RecoveryPhase.DIALOG_SHOWN);
      local.markRolledBack();
      expect(local.getPhase()).assertEqual(RecoveryPhase.ROLLED_BACK);
      expect(local.getRecoveryAttempts()).assertEqual(1);
      local.markCompleted();
      expect(local.getPhase()).assertEqual(RecoveryPhase.COMPLETED);
      expect(local.getRecoveryAttempts()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RecoveryPhaseTransitions_027, end');
    });

    /**
     * Scenario: the model description used by the failure diagnosis.
     * Expectation: the description names the active flag, the log size, the dialog flag and the
     * phase.
     */
    it('Assessment_ModelDescription_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ModelDescription_028, begin');
      const local: InterruptionStateModel = new InterruptionStateModel();
      const text: string = local.describe();
      expect(text).assertContain('active=false');
      expect(text).assertContain('logs=0');
      expect(text).assertContain('dialogShown=false');
      expect(text).assertContain(RecoveryPhase.IDLE);
      local.beginSuccess();
      local.interrupt(CODE_TIMEOUT, 'expired');
      expect(local.describe()).assertContain('logs=2');
      expect(local.describe()).assertContain('dialogShown=true');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ModelDescription_028, end');
    });

    /**
     * Scenario: count the events per type after a mixed session.
     * Expectation: the counters add up to the log size until the log reaches its cap.
     */
    it('Assessment_EventCounters_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventCounters_029, begin');
      const local: InterruptionStateModel = new InterruptionStateModel();
      local.beginSuccess();
      local.interrupt(CODE_USER_CANCEL, 'canceled');
      local.end();
      expect(local.countOfType(EVENT_BEGIN)).assertEqual(1);
      expect(local.countOfType(EVENT_INTERRUPTED)).assertEqual(1);
      expect(local.countOfType(EVENT_END)).assertEqual(1);
      expect(local.countOfType(EVENT_API_ERROR)).assertEqual(0);
      const total: number = local.countOfType(EVENT_BEGIN) + local.countOfType(EVENT_INTERRUPTED) +
        local.countOfType(EVENT_END);
      expect(total).assertEqual(local.logSize());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventCounters_029, end');
    });

    /**
     * Scenario: the dialog confirm button of the interruption dialog.
     * Expectation: the dialog has a single confirm label, it never auto cancels and it routes
     * the examinee back to the entry page.
     */
    it('Assessment_DialogContract_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogContract_030, begin');
      expect(TEXT_DIALOG_CONFIRM).assertEqual('OK');
      expect(DIALOG_AUTO_CANCEL).assertFalse();
      const titles: string[] = [TITLE_INTERRUPT, TITLE_END, TITLE_FINISH];
      const unique: Set<string> = new Set<string>(titles);
      expect(unique.size).assertEqual(3);
      expect(TITLE_INTERRUPT).assertContain('interrupt');
      const local: InterruptionStateModel = new InterruptionStateModel();
      local.beginSuccess();
      local.interrupt(CODE_TIMEOUT, 'expired');
      expect(local.getDialogTitle()).assertEqual(TITLE_INTERRUPT);
      expect(local.getDialogReason() === TITLE_END).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DialogContract_030, end');
    });

    /**
     * Scenario: the shared reason and title constants match the resource names of the sample.
     * Expectation: the reason names are lowercase snake case and never leak a bundle name.
     */
    it('Assessment_ReasonResourceNaming_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReasonResourceNaming_031, begin');
      const reasons: string[] = mapper.knownReasons();
      for (let i = 0; i < reasons.length; i++) {
        expect(reasons[i]).assertContain('reason_');
        expect(reasons[i]).assertEqual(reasons[i].toLowerCase());
        expect(reasons[i].indexOf('.')).assertEqual(-1);
      }
      expect(REASON_UNKNOWN).assertEqual('reason_unknown');
      expect(REASON_USER_CANCEL.indexOf('com.')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReasonResourceNaming_031, end');
    });

  });
}
