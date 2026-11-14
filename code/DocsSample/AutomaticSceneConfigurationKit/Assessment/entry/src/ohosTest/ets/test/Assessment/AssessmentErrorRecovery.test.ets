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
  ID_QUERY_CONFIG_BUTTON,
  TEXT_STATE_ACTIVE,
  TEXT_STATE_INACTIVE,
  TEXT_NO_EVENT,
  TEXT_DIALOG_CONFIRM,
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

// Codes of the assessment error enum.
const CODE_OK: number = 0;
const CODE_USER_CANCEL: number = 1;
const CODE_TIMEOUT: number = 2;
const CODE_SYSTEM_ERROR: number = 3;
const CODE_ENV_ANOMALY: number = 4;

// Event types published by the controller.
const EVENT_BEGIN: string = 'onBegin';
const EVENT_INTERRUPTED: string = 'onInterrupted';
const EVENT_END: string = 'onEnd';
const EVENT_API_ERROR: string = 'onApiError';

// Synchronous BusinessError codes that a call site can observe on a refusal.
const ERROR_CODE_PERMISSION_DENIED: number = 201;
const ERROR_CODE_PARAM_INVALID: number = 401;
const ERROR_CODE_NOT_SUPPORTED: number = 801;

// Default retry policy of the recovery cases.
const MAX_ATTEMPTS: number = 3;
const BACKOFF_BASE_MS: number = 100;

/**
 * The recovery action that the sample takes for a given failure.
 */
enum RecoveryAction {
  NONE = 'none', RETRY = 'retry', ABORT = 'abort', RESET = 'reset'
}

/**
 * Decision record of the recovery policy.
 */
interface RecoveryDecision {
  code: number;
  action: string;
  rollbackActive: boolean;
  retryable: boolean;
  reason: string;
}

/**
 * The recovery policy of the sample.
 *
 * A terminal failure aborts the session and rolls the active flag back, a recoverable failure
 * may be retried with a bounded backoff, and a synchronous refusal never activates the session
 * in the first place. The policy is pure so a case can assert it for every documented code.
 */
class RecoveryPolicy {
  public static decide(code: number, attempts: number = 0): RecoveryDecision {
    if (code === CODE_OK) {
      return {
        code: code,
        action: RecoveryAction.NONE,
        rollbackActive: false,
        retryable: false,
        reason: 'the operation succeeded'
      };
    }
    if (code === CODE_USER_CANCEL || code === CODE_TIMEOUT) {
      return {
        code: code,
        action: RecoveryAction.ABORT,
        rollbackActive: true,
        retryable: false,
        reason: 'a terminal failure ends the session'
      };
    }
    if (code === CODE_SYSTEM_ERROR || code === CODE_ENV_ANOMALY) {
      const canRetry: boolean = attempts < MAX_ATTEMPTS;
      return {
        code: code,
        action: canRetry ? RecoveryAction.RETRY : RecoveryAction.ABORT,
        rollbackActive: true,
        retryable: canRetry,
        reason: canRetry ? 'a transient failure may be retried' : 'the retry budget is exhausted'
      };
    }
    if (code === ERROR_CODE_PARAM_INVALID || code === ERROR_CODE_PERMISSION_DENIED) {
      return {
        code: code,
        action: RecoveryAction.RESET,
        rollbackActive: true,
        retryable: false,
        reason: 'a synchronous refusal needs a corrected configuration'
      };
    }
    return {
      code: code,
      action: RecoveryAction.ABORT,
      rollbackActive: true,
      retryable: false,
      reason: 'an unknown failure is treated as terminal'
    };
  }

  public static retryDelay(attempt: number): number {
    if (attempt <= 0) {
      return BACKOFF_BASE_MS;
    }
    return BACKOFF_BASE_MS * attempt;
  }

  public static isDocumented(code: number): boolean {
    return code >= CODE_OK && code <= CODE_ENV_ANOMALY;
  }

  public static describe(decision: RecoveryDecision): string {
    return `Recovery{code=${decision.code}, action=${decision.action}, rollback=${decision.rollbackActive}}`;
  }
}

/**
 * The state of a controller after a failed call.
 *
 * The class replays the try/catch blocks of AssessmentController: begin writes the duration, calls
 * the service and publishes either the callback result or the synchronous error. The model keeps
 * the active flag, the event log and the sequence so a recovery case can assert the rollback.
 */
class RecoveryModel {
  private active: boolean = false;
  private eventType: string = '';
  private eventCode: number = CODE_OK;
  private eventMessage: string = '';
  private seq: number = 0;
  private logLines: string[] = [];
  private attempts: number = 0;
  private duration: number = 0;

  public beginCallback(code: number, message: string = ''): void {
    this.attempts++;
    this.active = code === CODE_OK;
    this.publish(EVENT_BEGIN, code, message);
  }

  public beginThrow(code: number, message: string): void {
    this.attempts++;
    this.publish(EVENT_API_ERROR, code, message);
  }

  public interrupt(code: number, message: string = ''): void {
    this.active = false;
    this.publish(EVENT_INTERRUPTED, code, message);
  }

  public endCallback(): void {
    this.active = false;
    this.publish(EVENT_END, CODE_OK, '');
  }

  public endThrow(code: number, message: string): void {
    this.publish(EVENT_API_ERROR, code, message);
  }

  public queryThrow(code: number, message: string): boolean {
    this.publish(EVENT_API_ERROR, code, message);
    return false;
  }

  public isActive(): boolean {
    return this.active;
  }

  public rollback(): void {
    this.active = false;
  }

  public eventTypeValue(): string {
    return this.eventType;
  }

  public eventCodeValue(): number {
    return this.eventCode;
  }

  public eventMessageValue(): string {
    return this.eventMessage;
  }

  public sequence(): number {
    return this.seq;
  }

  public attemptCount(): number {
    return this.attempts;
  }

  public logCount(): number {
    return this.logLines.length;
  }

  public logs(): string[] {
    return this.logLines.slice();
  }

  public setDuration(duration: number): void {
    this.duration = duration;
  }

  public durationValue(): number {
    return this.duration;
  }

  private publish(eventType: string, code: number, message: string): void {
    this.eventType = eventType;
    this.eventCode = code;
    this.eventMessage = message;
    this.seq++;
    const next: string[] = this.logLines.slice();
    next.unshift(`${eventType} code=${code} message=${message}`);
    while (next.length > 20) {
      next.pop();
    }
    this.logLines = next;
  }

  public describe(): string {
    return `RecoveryModel{active=${this.active}, type=${this.eventType}, code=${this.eventCode}, ` +
      `attempts=${this.attempts}, seq=${this.seq}}`;
  }
}

/**
 * Drives a bounded retry loop against a recovery model.
 *
 * The runner is the model counterpart of a controller retry: it stops on a success, stops on a
 * non retryable failure and stops when the attempt budget is exhausted. It records the outcome of
 * every attempt so the case can assert the whole history.
 */
class RetryRunner {
  private model: RecoveryModel;
  private outcomes: number[] = [];
  private waitTimes: number[] = [];

  constructor(model: RecoveryModel) {
    this.model = model;
  }

  public run(codes: number[]): number {
    for (let i = 0; i < codes.length; i++) {
      this.outcomes.push(codes[i]);
      const decision: RecoveryDecision = RecoveryPolicy.decide(codes[i], this.outcomes.length);
      this.model.beginCallback(codes[i], 'attempt ' + i);
      if (!decision.retryable) {
        return this.outcomes.length;
      }
      this.waitTimes.push(RecoveryPolicy.retryDelay(this.outcomes.length));
    }
    return this.outcomes.length;
  }

  public attempts(): number {
    return this.outcomes.length;
  }

  public codes(): number[] {
    return this.outcomes.slice();
  }

  public delays(): number[] {
    return this.waitTimes.slice();
  }

  public succeeded(): boolean {
    return this.outcomes.length > 0 && this.outcomes[this.outcomes.length - 1] === CODE_OK;
  }

  public totalDelay(): number {
    let total: number = 0;
    for (let i = 0; i < this.waitTimes.length; i++) {
      total += this.waitTimes[i];
    }
    return total;
  }

  public describe(): string {
    return `RetryRunner{attempts=${this.outcomes.length}, codes=${this.outcomes.join(',')}}`;
  }
}

/**
 * Checks the post condition of a failed call.
 *
 * A failed begin must leave the active flag off, a failed end must leave the event log untouched
 * by a success event and a failed query must never activate the session.
 */
class RecoveryAssertion {
  public static beginFailureLeavesInactive(model: RecoveryModel): boolean {
    return !model.isActive();
  }

  public static failureIsPublished(model: RecoveryModel): boolean {
    return model.eventTypeValue() !== '' && model.eventCodeValue() !== CODE_OK;
  }

  public static queryFailureKeepsInactive(model: RecoveryModel): boolean {
    return !model.isActive();
  }

  public static sequenceAdvanced(model: RecoveryModel, previous: number): boolean {
    return model.sequence() === previous + 1;
  }

  public static attemptedExactlyOnce(model: RecoveryModel): boolean {
    return model.attemptCount() === 1;
  }

  public static describe(model: RecoveryModel): string {
    return `Recovery{active=${model.isActive()}, type=${model.eventTypeValue()}, ` +
      `code=${model.eventCodeValue()}}`;
  }
}

/**
 * Selects the user facing reason of a failure code.
 *
 * The exam page maps the four documented codes to a resource string and falls back to an unknown
 * reason for anything else, the selector mirrors that mapping.
 */
class FailureReasonCatalog {
  public static reasonOf(code: number): string {
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

  public static documentedReasons(): string[] {
    return [
      FailureReasonCatalog.reasonOf(CODE_USER_CANCEL),
      FailureReasonCatalog.reasonOf(CODE_TIMEOUT),
      FailureReasonCatalog.reasonOf(CODE_SYSTEM_ERROR),
      FailureReasonCatalog.reasonOf(CODE_ENV_ANOMALY)
    ];
  }

  public static isDocumentedReason(reason: string): boolean {
    return FailureReasonCatalog.documentedReasons().indexOf(reason) >= 0;
  }

  public static uniqueReasons(): boolean {
    const reasons: string[] = FailureReasonCatalog.documentedReasons();
    return new Set<string>(reasons).size === reasons.length;
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

export default function assessmentErrorRecoveryTest() {
  describe('AssessmentErrorRecovery_Test', () => {
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
     * Scenario: the recovery decision for a successful call.
     * Expectation: no action, no rollback and no retry.
     */
    it('Assessment_DecisionSuccess_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DecisionSuccess_001, begin');
      const decision: RecoveryDecision = RecoveryPolicy.decide(CODE_OK);
      expect(decision.action).assertEqual(RecoveryAction.NONE);
      expect(decision.rollbackActive).assertFalse();
      expect(decision.retryable).assertFalse();
      expect(decision.reason).assertContain('succeeded');
      hilog.info(DOMAIN, TAG, '%{public}s', RecoveryPolicy.describe(decision));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DecisionSuccess_001, end');
    });

    /**
     * Scenario: the recovery decision for a user cancel.
     * Expectation: the session is aborted and the active flag is rolled back, no retry.
     */
    it('Assessment_DecisionUserCancel_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DecisionUserCancel_002, begin');
      const decision: RecoveryDecision = RecoveryPolicy.decide(CODE_USER_CANCEL);
      expect(decision.action).assertEqual(RecoveryAction.ABORT);
      expect(decision.rollbackActive).assertTrue();
      expect(decision.retryable).assertFalse();
      expect(decision.reason).assertContain('terminal');
      hilog.info(DOMAIN, TAG, '%{public}s', RecoveryPolicy.describe(decision));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DecisionUserCancel_002, end');
    });

    /**
     * Scenario: the recovery decision for a timeout.
     * Expectation: a timeout is terminal, the session cannot be resumed.
     */
    it('Assessment_DecisionTimeout_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DecisionTimeout_003, begin');
      const decision: RecoveryDecision = RecoveryPolicy.decide(CODE_TIMEOUT);
      expect(decision.action).assertEqual(RecoveryAction.ABORT);
      expect(decision.rollbackActive).assertTrue();
      expect(decision.retryable).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', RecoveryPolicy.describe(decision));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DecisionTimeout_003, end');
    });

    /**
     * Scenario: the recovery decision for a system error.
     * Expectation: the failure is retryable until the attempt budget is exhausted.
     */
    it('Assessment_DecisionSystemError_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DecisionSystemError_004, begin');
      const first: RecoveryDecision = RecoveryPolicy.decide(CODE_SYSTEM_ERROR, 0);
      expect(first.action).assertEqual(RecoveryAction.RETRY);
      expect(first.retryable).assertTrue();
      expect(first.rollbackActive).assertTrue();
      const last: RecoveryDecision = RecoveryPolicy.decide(CODE_SYSTEM_ERROR, MAX_ATTEMPTS);
      expect(last.action).assertEqual(RecoveryAction.ABORT);
      expect(last.retryable).assertFalse();
      expect(last.reason).assertContain('exhausted');
      hilog.info(DOMAIN, TAG, '%{public}s', RecoveryPolicy.describe(last));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DecisionSystemError_004, end');
    });

    /**
     * Scenario: the recovery decision for an environment anomaly.
     * Expectation: it behaves like a system error, the anomaly may clear on its own.
     */
    it('Assessment_DecisionEnvAnomaly_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DecisionEnvAnomaly_005, begin');
      const decision: RecoveryDecision = RecoveryPolicy.decide(CODE_ENV_ANOMALY, 1);
      expect(decision.action).assertEqual(RecoveryAction.RETRY);
      expect(decision.retryable).assertTrue();
      expect(decision.rollbackActive).assertTrue();
      expect(decision.reason).assertContain('transient');
      hilog.info(DOMAIN, TAG, '%{public}s', RecoveryPolicy.describe(decision));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DecisionEnvAnomaly_005, end');
    });

    /**
     * Scenario: the recovery decision for a synchronous parameter refusal.
     * Expectation: the call is reset, the caller has to correct the configuration.
     */
    it('Assessment_DecisionParamInvalid_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DecisionParamInvalid_006, begin');
      const decision: RecoveryDecision = RecoveryPolicy.decide(ERROR_CODE_PARAM_INVALID);
      expect(decision.action).assertEqual(RecoveryAction.RESET);
      expect(decision.retryable).assertFalse();
      expect(decision.reason).assertContain('corrected');
      const denied: RecoveryDecision = RecoveryPolicy.decide(ERROR_CODE_PERMISSION_DENIED);
      expect(denied.action).assertEqual(RecoveryAction.RESET);
      expect(denied.code).assertEqual(ERROR_CODE_PERMISSION_DENIED);
      hilog.info(DOMAIN, TAG, '%{public}s', RecoveryPolicy.describe(decision));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DecisionParamInvalid_006, end');
    });

    /**
     * Scenario: the recovery decision for an unknown code.
     * Expectation: the unknown failure is treated as terminal.
     */
    it('Assessment_DecisionUnknown_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DecisionUnknown_007, begin');
      const decision: RecoveryDecision = RecoveryPolicy.decide(ERROR_CODE_NOT_SUPPORTED);
      expect(decision.action).assertEqual(RecoveryAction.ABORT);
      expect(decision.retryable).assertFalse();
      expect(decision.reason).assertContain('terminal');
      expect(RecoveryPolicy.isDocumented(ERROR_CODE_NOT_SUPPORTED)).assertFalse();
      expect(RecoveryPolicy.isDocumented(CODE_TIMEOUT)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', RecoveryPolicy.describe(decision));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DecisionUnknown_007, end');
    });

    /**
     * Scenario: the backoff schedule of the retry policy.
     * Expectation: the delay grows linearly with the attempt number and starts at the base value.
     */
    it('Assessment_BackoffSchedule_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BackoffSchedule_008, begin');
      expect(RecoveryPolicy.retryDelay(0)).assertEqual(BACKOFF_BASE_MS);
      expect(RecoveryPolicy.retryDelay(1)).assertEqual(BACKOFF_BASE_MS);
      expect(RecoveryPolicy.retryDelay(2)).assertEqual(BACKOFF_BASE_MS * 2);
      expect(RecoveryPolicy.retryDelay(3)).assertEqual(BACKOFF_BASE_MS * 3);
      for (let i = 1; i <= 3; i++) {
        expect(RecoveryPolicy.retryDelay(i) >= RecoveryPolicy.retryDelay(i - 1)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BackoffSchedule_008, end');
    });

    /**
     * Scenario: a successful begin callback.
     * Expectation: the model activates and records the begin event with the OK code.
     */
    it('Assessment_BeginCallbackSuccess_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginCallbackSuccess_009, begin');
      const model: RecoveryModel = new RecoveryModel();
      model.beginCallback(CODE_OK);
      expect(model.isActive()).assertTrue();
      expect(model.eventTypeValue()).assertEqual(EVENT_BEGIN);
      expect(model.eventCodeValue()).assertEqual(CODE_OK);
      expect(model.attemptCount()).assertEqual(1);
      expect(model.sequence()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', model.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginCallbackSuccess_009, end');
    });

    /**
     * Scenario: a refused begin callback.
     * Expectation: the active flag rolls back and the failure is published.
     */
    it('Assessment_BeginCallbackFailure_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginCallbackFailure_010, begin');
      const model: RecoveryModel = new RecoveryModel();
      model.beginCallback(CODE_USER_CANCEL, 'the user declined');
      expect(model.isActive()).assertFalse();
      expect(RecoveryAssertion.beginFailureLeavesInactive(model)).assertTrue();
      expect(RecoveryAssertion.failureIsPublished(model)).assertTrue();
      expect(model.eventMessageValue()).assertEqual('the user declined');
      hilog.info(DOMAIN, TAG, '%{public}s', model.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginCallbackFailure_010, end');
    });

    /**
     * Scenario: a synchronous throw of begin.
     * Expectation: the call is published as an API error and the session stays inactive.
     */
    it('Assessment_BeginThrow_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginThrow_011, begin');
      const model: RecoveryModel = new RecoveryModel();
      model.setDuration(600000);
      model.beginThrow(ERROR_CODE_PARAM_INVALID, 'the duration is not a candidate');
      expect(model.isActive()).assertFalse();
      expect(model.eventTypeValue()).assertEqual(EVENT_API_ERROR);
      expect(model.eventCodeValue()).assertEqual(ERROR_CODE_PARAM_INVALID);
      expect(model.logCount()).assertEqual(1);
      expect(RecoveryAssertion.attemptedExactlyOnce(model)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', model.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginThrow_011, end');
    });

    /**
     * Scenario: a synchronous throw of end.
     * Expectation: the error is published and the previously active session is not silently kept.
     */
    it('Assessment_EndThrow_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndThrow_012, begin');
      const model: RecoveryModel = new RecoveryModel();
      model.beginCallback(CODE_OK);
      expect(model.isActive()).assertTrue();
      model.endThrow(ERROR_CODE_PERMISSION_DENIED, 'the ability does not own the session');
      expect(model.eventTypeValue()).assertEqual(EVENT_API_ERROR);
      expect(model.eventCodeValue()).assertEqual(ERROR_CODE_PERMISSION_DENIED);
      expect(model.sequence()).assertEqual(2);
      model.rollback();
      expect(model.isActive()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', model.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndThrow_012, end');
    });

    /**
     * Scenario: a synchronous throw of a query.
     * Expectation: the query answers false and never activates the session.
     */
    it('Assessment_QueryThrow_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueryThrow_013, begin');
      const model: RecoveryModel = new RecoveryModel();
      const answer: boolean = model.queryThrow(ERROR_CODE_NOT_SUPPORTED, 'the service is unavailable');
      expect(answer).assertFalse();
      expect(model.isActive()).assertFalse();
      expect(RecoveryAssertion.queryFailureKeepsInactive(model)).assertTrue();
      expect(model.eventTypeValue()).assertEqual(EVENT_API_ERROR);
      hilog.info(DOMAIN, TAG, '%{public}s', model.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueryThrow_013, end');
    });

    /**
     * Scenario: a successful recovery after one transient failure.
     * Expectation: the second attempt succeeds and the active flag turns on.
     */
    it('Assessment_RetrySucceeds_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RetrySucceeds_014, begin');
      const model: RecoveryModel = new RecoveryModel();
      const runner: RetryRunner = new RetryRunner(model);
      const attempts: number = runner.run([CODE_SYSTEM_ERROR, CODE_OK]);
      expect(attempts).assertEqual(2);
      expect(runner.succeeded()).assertTrue();
      expect(model.isActive()).assertTrue();
      expect(runner.delays().length).assertEqual(1);
      expect(runner.delays()[0]).assertEqual(BACKOFF_BASE_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', runner.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RetrySucceeds_014, end');
    });

    /**
     * Scenario: an exhausted retry budget.
     * Expectation: the runner stops after the budget and the session stays inactive.
     */
    it('Assessment_RetryBudgetExhausted_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RetryBudgetExhausted_015, begin');
      const model: RecoveryModel = new RecoveryModel();
      const runner: RetryRunner = new RetryRunner(model);
      const attempts: number = runner.run([CODE_SYSTEM_ERROR, CODE_SYSTEM_ERROR, CODE_SYSTEM_ERROR,
        CODE_SYSTEM_ERROR, CODE_OK]);
      expect(attempts).assertEqual(MAX_ATTEMPTS);
      expect(runner.succeeded()).assertFalse();
      expect(model.isActive()).assertFalse();
      expect(model.sequence()).assertEqual(MAX_ATTEMPTS);
      hilog.info(DOMAIN, TAG, '%{public}s', runner.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RetryBudgetExhausted_015, end');
    });

    /**
     * Scenario: a terminal failure inside a retry loop.
     * Expectation: the loop stops immediately, a cancel is never retried.
     */
    it('Assessment_TerminalStopsLoop_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TerminalStopsLoop_016, begin');
      const model: RecoveryModel = new RecoveryModel();
      const runner: RetryRunner = new RetryRunner(model);
      const attempts: number = runner.run([CODE_USER_CANCEL, CODE_OK]);
      expect(attempts).assertEqual(1);
      expect(runner.succeeded()).assertFalse();
      expect(runner.delays().length).assertEqual(0);
      expect(model.isActive()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', runner.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TerminalStopsLoop_016, end');
    });

    /**
     * Scenario: the total backoff of a three attempt loop.
     * Expectation: the sum equals the base delay times one plus two.
     */
    it('Assessment_RetryTotalDelay_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RetryTotalDelay_017, begin');
      const model: RecoveryModel = new RecoveryModel();
      const runner: RetryRunner = new RetryRunner(model);
      runner.run([CODE_ENV_ANOMALY, CODE_ENV_ANOMALY, CODE_ENV_ANOMALY]);
      expect(runner.attempts()).assertEqual(3);
      expect(runner.delays().length).assertEqual(2);
      expect(runner.totalDelay()).assertEqual(BACKOFF_BASE_MS + BACKOFF_BASE_MS * 2);
      hilog.info(DOMAIN, TAG, '%{public}s total delay: %{public}d', BUNDLE + 'RetryTotalDelay_017',
        runner.totalDelay());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RetryTotalDelay_017, end');
    });

    /**
     * Scenario: a recovery after an interruption.
     * Expectation: the interrupted session clears the flag and a fresh begin is accepted.
     */
    it('Assessment_RecoverAfterInterrupt_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RecoverAfterInterrupt_018, begin');
      const model: RecoveryModel = new RecoveryModel();
      model.beginCallback(CODE_OK);
      expect(model.isActive()).assertTrue();
      model.interrupt(CODE_TIMEOUT, 'the countdown expired');
      expect(model.isActive()).assertFalse();
      expect(model.eventTypeValue()).assertEqual(EVENT_INTERRUPTED);
      model.beginCallback(CODE_OK);
      expect(model.isActive()).assertTrue();
      expect(model.attemptCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', model.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RecoverAfterInterrupt_018, end');
    });

    /**
     * Scenario: a recovery after a clean end.
     * Expectation: a fresh begin after the end reactivates the model.
     */
    it('Assessment_RecoverAfterEnd_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RecoverAfterEnd_019, begin');
      const model: RecoveryModel = new RecoveryModel();
      model.beginCallback(CODE_OK);
      model.endCallback();
      expect(model.isActive()).assertFalse();
      expect(model.eventTypeValue()).assertEqual(EVENT_END);
      expect(model.eventCodeValue()).assertEqual(CODE_OK);
      model.beginCallback(CODE_OK);
      expect(model.isActive()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', model.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RecoverAfterEnd_019, end');
    });

    /**
     * Scenario: the rollback method of the model.
     * Expectation: it clears the flag without publishing an event.
     */
    it('Assessment_RollbackDoesNotPublish_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RollbackDoesNotPublish_020, begin');
      const model: RecoveryModel = new RecoveryModel();
      model.beginCallback(CODE_OK);
      const seq: number = model.sequence();
      const logs: number = model.logCount();
      model.rollback();
      expect(model.isActive()).assertFalse();
      expect(model.sequence()).assertEqual(seq);
      expect(model.logCount()).assertEqual(logs);
      hilog.info(DOMAIN, TAG, '%{public}s', model.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RollbackDoesNotPublish_020, end');
    });

    /**
     * Scenario: the sequence advanced exactly once per published event.
     * Expectation: a mixed history of successes and failures keeps the counter exact.
     */
    it('Assessment_SequencePerEvent_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SequencePerEvent_021, begin');
      const model: RecoveryModel = new RecoveryModel();
      const start: number = model.sequence();
      model.beginCallback(CODE_ENV_ANOMALY, '');
      expect(RecoveryAssertion.sequenceAdvanced(model, start)).assertTrue();
      model.beginThrow(ERROR_CODE_PARAM_INVALID, 'bad');
      expect(model.sequence()).assertEqual(start + 2);
      model.beginCallback(CODE_OK);
      expect(model.sequence()).assertEqual(start + 3);
      hilog.info(DOMAIN, TAG, '%{public}s', model.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SequencePerEvent_021, end');
    });

    /**
     * Scenario: the failure reason catalogue.
     * Expectation: the four documented codes map to four distinct resource names.
     */
    it('Assessment_ReasonCatalog_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReasonCatalog_022, begin');
      expect(FailureReasonCatalog.reasonOf(CODE_USER_CANCEL)).assertEqual('reason_user_cancel');
      expect(FailureReasonCatalog.reasonOf(CODE_TIMEOUT)).assertEqual('reason_timeout');
      expect(FailureReasonCatalog.reasonOf(CODE_SYSTEM_ERROR)).assertEqual('reason_system_error');
      expect(FailureReasonCatalog.reasonOf(CODE_ENV_ANOMALY)).assertEqual('reason_env_anomaly');
      expect(FailureReasonCatalog.reasonOf(CODE_OK)).assertEqual('reason_unknown');
      expect(FailureReasonCatalog.documentedReasons().length).assertEqual(4);
      expect(FailureReasonCatalog.uniqueReasons()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', FailureReasonCatalog.documentedReasons().join(','));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReasonCatalog_022, end');
    });

    /**
     * Scenario: the documented reason predicate.
     * Expectation: only the four mapped names count as documented.
     */
    it('Assessment_ReasonPredicate_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReasonPredicate_023, begin');
      expect(FailureReasonCatalog.isDocumentedReason('reason_timeout')).assertTrue();
      expect(FailureReasonCatalog.isDocumentedReason('reason_unknown')).assertFalse();
      expect(FailureReasonCatalog.isDocumentedReason('')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReasonPredicate_023, end');
    });

    /**
     * Scenario: the model survives a full failure and recovery history.
     * Expectation: the final state is active and every intermediate failure rolled back.
     */
    it('Assessment_FullHistoryRecovery_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FullHistoryRecovery_031, begin');
      const model: RecoveryModel = new RecoveryModel();
      model.beginThrow(ERROR_CODE_PARAM_INVALID, 'bad config');
      expect(model.isActive()).assertFalse();
      model.beginCallback(CODE_SYSTEM_ERROR, 'transient');
      expect(model.isActive()).assertFalse();
      model.beginCallback(CODE_ENV_ANOMALY, 'environment');
      expect(model.isActive()).assertFalse();
      model.beginCallback(CODE_OK);
      expect(model.isActive()).assertTrue();
      expect(model.attemptCount()).assertEqual(4);
      expect(model.sequence()).assertEqual(4);
      expect(model.logCount()).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', model.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FullHistoryRecovery_031, end');
    });

    /**
     * Scenario: the recovery decision description.
     * Expectation: it carries the code, the action and the rollback flag.
     */
    it('Assessment_DecisionDescription_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DecisionDescription_032, begin');
      const text: string = RecoveryPolicy.describe(RecoveryPolicy.decide(CODE_TIMEOUT));
      expect(text).assertContain(`${CODE_TIMEOUT}`);
      expect(text).assertContain(RecoveryAction.ABORT);
      expect(text).assertContain('rollback=true');
      hilog.info(DOMAIN, TAG, '%{public}s', text);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DecisionDescription_032, end');
    });
  });
}
