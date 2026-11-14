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
  TEXT_STATE_INACTIVE,
  TEXT_NO_ACTIVE_ASSESSMENT,
  KEY_BACK,
  TIMEOUT_PAGE_TRANSITION,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  containsTextFragment,
  waitForIndexPage,
  isComponentEnabled,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Event type that triggers the toast of the entry page.
const EVENT_API_ERROR: string = 'onApiError';
const EVENT_BEGIN: string = 'onBegin';
const EVENT_INTERRUPTED: string = 'onInterrupted';
const EVENT_END: string = 'onEnd';

// Toast parameters of Index.showToast.
const TOAST_DURATION: number = 2000;
const TOAST_DEFAULT_DURATION: number = 1500;
const TOAST_PREFIX: string = '[Sample_Assessment] error code: ';

// Documented assessment error codes.
const CODE_OK: number = 0;
const CODE_USER_CANCEL: number = 1;
const CODE_TIMEOUT: number = 2;
const CODE_SYSTEM_ERROR: number = 3;
const CODE_ENV_ANOMALY: number = 4;

// Business error codes that the sample translates into an onApiError event.
const CODE_PERMISSION_DENIED: number = 201;
const CODE_PARAM_INVALID: number = 401;
const CODE_CAPABILITY_NOT_SUPPORT: number = 801;
const CODE_INNER_ERROR: number = 202;

// The controller keeps at most twenty entries in its event log.
const MAX_EVENT_LOG: number = 20;

// Number of repeated failures used by the stress cases.
const STRESS_ROUNDS_TOAST: number = 50;

// Delay that is granted to the prompt action to enqueue the toast.
const TOAST_SETTLE_MS: number = 400;

/**
 * Outcome of a toast request.
 */
enum ToastOutcome {
  SHOWN = 0,
  FAILED = 1,
  SKIPPED = 2
}

/**
 * Kind of event that reaches the watch handler of the entry page.
 */
enum WatchEventKind {
  BEGIN = 'begin',
  INTERRUPTED = 'interrupted',
  END = 'end',
  API_ERROR = 'api_error'
}

/**
 * One toast request recorded by the model.
 */
interface ToastRecord {
  message: string;
  duration: number;
  code: number;
  seq: number;
  outcome: ToastOutcome;
}

/**
 * Result of a single toast evaluation step.
 */
interface ToastDecision {
  shouldShow: boolean;
  message: string;
  duration: number;
  reason: string;
}

/**
 * Event object as the watch handler of the entry page sees it.
 */
interface WatchEvent {
  type: string;
  code: number;
  message: string;
  seq: number;
}

/**
 * Computes the toast message and the duration of a failure code.
 *
 * Index.showToast renders `${AssessmentConstants.TAG} error code: ${code}` with a duration of
 * AssessmentConstants.TOAST_DURATION. The formatter reproduces that string exactly, including
 * the space after the colon and the trailing code digits.
 */
class ToastFormatter {
  private prefix: string;
  private duration: number;

  constructor(prefix: string = TOAST_PREFIX, duration: number = TOAST_DURATION) {
    this.prefix = prefix;
    this.duration = duration;
  }

  public message(code: number): string {
    return `${this.prefix}${code}`;
  }

  public durationOf(): number {
    return this.duration;
  }

  public getPrefix(): string {
    return this.prefix;
  }

  public codeOf(message: string): number {
    if (message.indexOf(this.prefix) !== 0) {
      return -1;
    }
    const tail: string = message.slice(this.prefix.length);
    if (tail.length === 0) {
      return -1;
    }
    for (let i = 0; i < tail.length; i++) {
      const code: number = tail.charCodeAt(i);
      if (code < 48 || code > 57) {
        return -1;
      }
    }
    return Number(tail);
  }

  public isWellFormed(message: string): boolean {
    if (message.indexOf(this.prefix) !== 0) {
      return false;
    }
    const tail: string = message.slice(this.prefix.length);
    if (tail.length === 0) {
      return false;
    }
    for (let i = 0; i < tail.length; i++) {
      const code: number = tail.charCodeAt(i);
      if (code < 48 || code > 57) {
        return false;
      }
    }
    return true;
  }

  public countOccurrences(prefix: string): number {
    let count: number = 0;
    let index: number = this.prefix.indexOf(prefix, 0);
    while (index >= 0) {
      count++;
      index = this.prefix.indexOf(prefix, index + prefix.length);
    }
    return count;
  }
}

/**
 * Decides whether a watch event has to raise a toast.
 *
 * The entry page shows the toast for an onApiError event only. A successful begin pushes the
 * exam page and a failed begin, an interruption and an end open the exam page dialog instead,
 * so no toast is raised for them.
 */
class ToastPolicy {
  public decide(event: WatchEvent): ToastDecision {
    if (event.type === EVENT_API_ERROR) {
      return {
        shouldShow: true,
        message: new ToastFormatter().message(event.code),
        duration: TOAST_DURATION,
        reason: 'the api failed'
      };
    }
    if (event.type === EVENT_BEGIN && event.code === CODE_OK) {
      return {
        shouldShow: false,
        message: '',
        duration: 0,
        reason: 'the assessment began, the exam page is pushed'
      };
    }
    if (event.type === EVENT_BEGIN) {
      return {
        shouldShow: false,
        message: '',
        duration: 0,
        reason: 'the begin failed, the exam page dialog explains it'
      };
    }
    if (event.type === EVENT_INTERRUPTED) {
      return {
        shouldShow: false,
        message: '',
        duration: 0,
        reason: 'the exam page dialog explains the interruption'
      };
    }
    if (event.type === EVENT_END) {
      return {
        shouldShow: false,
        message: '',
        duration: 0,
        reason: 'the exam page dialog explains the end'
      };
    }
    return {
      shouldShow: false,
      message: '',
      duration: 0,
      reason: 'the event type is not handled'
    };
  }

  public isToastEvent(type: string): boolean {
    return type === EVENT_API_ERROR;
  }

  public kindOf(type: string): WatchEventKind {
    if (type === EVENT_BEGIN) {
      return WatchEventKind.BEGIN;
    }
    if (type === EVENT_INTERRUPTED) {
      return WatchEventKind.INTERRUPTED;
    }
    if (type === EVENT_END) {
      return WatchEventKind.END;
    }
    return WatchEventKind.API_ERROR;
  }
}

/**
 * Model of the toast pipeline of the entry page.
 *
 * The model reproduces the @Watch handler of Index: it evaluates the policy, formats the
 * message, keeps the sequence number of the controller and records every request. Repeated
 * failures of the same code are folded so that the prompt action is not flooded.
 */
class ToastPipeline {
  private formatter: ToastFormatter;
  private policy: ToastPolicy;
  private records: ToastRecord[] = [];
  private seq: number = 0;
  private shown: number = 0;
  private failed: number = 0;
  private skipped: number = 0;
  private failNext: boolean = false;
  private dedupeEnabled: boolean = true;
  private lastShownCode: number = -1;
  private lastMessage: string = '';
  private lastDuration: number = 0;

  constructor() {
    this.formatter = new ToastFormatter();
    this.policy = new ToastPolicy();
  }

  public dispatch(event: WatchEvent): ToastOutcome {
    this.seq = event.seq > 0 ? event.seq : this.seq + 1;
    const decision: ToastDecision = this.policy.decide(event);
    if (!decision.shouldShow) {
      this.skipped++;
      return ToastOutcome.SKIPPED;
    }
    if (this.dedupeEnabled && event.code === this.lastShownCode) {
      this.skipped++;
      hilog.info(DOMAIN, TAG, 'ToastPipeline: code %{public}d folded', event.code);
      return ToastOutcome.SKIPPED;
    }
    if (this.failNext) {
      this.failNext = false;
      this.failed++;
      this.records.push({
        message: decision.message,
        duration: decision.duration,
        code: event.code,
        seq: this.seq,
        outcome: ToastOutcome.FAILED
      });
      hilog.warn(DOMAIN, TAG, 'ToastPipeline: showToast failed for code %{public}d', event.code);
      return ToastOutcome.FAILED;
    }
    this.shown++;
    this.lastShownCode = event.code;
    this.lastMessage = decision.message;
    this.lastDuration = decision.duration;
    this.records.push({
      message: decision.message,
      duration: decision.duration,
      code: event.code,
      seq: this.seq,
      outcome: ToastOutcome.SHOWN
    });
    return ToastOutcome.SHOWN;
  }

  public dispatchApiError(code: number, message: string): ToastOutcome {
    return this.dispatch({
      type: EVENT_API_ERROR,
      code: code,
      message: message,
      seq: 0
    });
  }

  public failNextRequest(): void {
    this.failNext = true;
  }

  public setDedupeEnabled(enabled: boolean): void {
    this.dedupeEnabled = enabled;
  }

  public isDedupeEnabled(): boolean {
    return this.dedupeEnabled;
  }

  public reset(): void {
    this.records = [];
    this.seq = 0;
    this.shown = 0;
    this.failed = 0;
    this.skipped = 0;
    this.failNext = false;
    this.lastShownCode = -1;
    this.lastMessage = '';
    this.lastDuration = 0;
  }

  public getRecords(): ToastRecord[] {
    return this.records.slice();
  }

  public recordCount(): number {
    return this.records.length;
  }

  public getShown(): number {
    return this.shown;
  }

  public getFailed(): number {
    return this.failed;
  }

  public getSkipped(): number {
    return this.skipped;
  }

  public getSeq(): number {
    return this.seq;
  }

  public getLastMessage(): string {
    return this.lastMessage;
  }

  public getLastDuration(): number {
    return this.lastDuration;
  }

  public getLastCode(): number {
    return this.lastShownCode;
  }

  public countByCode(code: number): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].code === code) {
        count++;
      }
    }
    return count;
  }

  public countByOutcome(outcome: ToastOutcome): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].outcome === outcome) {
        count++;
      }
    }
    return count;
  }

  public everyRecordWellFormed(): boolean {
    const formatter: ToastFormatter = this.formatter;
    for (let i = 0; i < this.records.length; i++) {
      if (!formatter.isWellFormed(this.records[i].message)) {
        return false;
      }
      if (this.records[i].duration !== TOAST_DURATION) {
        return false;
      }
    }
    return true;
  }

  public everyRecordNonEmpty(): boolean {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].message.length === 0) {
        return false;
      }
    }
    return true;
  }

  public describe(): string {
    return `ToastPipeline{shown=${this.shown}, failed=${this.failed}, skipped=${this.skipped}, ` +
      `seq=${this.seq}}`;
  }
}

/**
 * Models the lifecycle of one toast on screen.
 *
 * The prompt action removes the toast after the duration has elapsed. The model keeps the
 * visibility and the remaining time so the overlap of two toasts and the replacement rule can
 * be asserted without a device.
 */
class ToastLifecycle {
  private visible: boolean = false;
  private remainingMs: number = 0;
  private replacements: number = 0;
  private currentMessage: string = '';

  public show(message: string, duration: number): void {
    if (this.visible) {
      this.replacements++;
    }
    this.visible = true;
    this.remainingMs = duration;
    this.currentMessage = message;
  }

  public advance(ms: number): void {
    if (!this.visible) {
      return;
    }
    this.remainingMs -= ms;
    if (this.remainingMs <= 0) {
      this.remainingMs = 0;
      this.visible = false;
      this.currentMessage = '';
    }
  }

  public isVisible(): boolean {
    return this.visible;
  }

  public getRemainingMs(): number {
    return this.remainingMs;
  }

  public getReplacements(): number {
    return this.replacements;
  }

  public getCurrentMessage(): string {
    return this.currentMessage;
  }

  public reset(): void {
    this.visible = false;
    this.remainingMs = 0;
    this.replacements = 0;
    this.currentMessage = '';
  }
}

/**
 * Counts how often the same failure reaches the page.
 *
 * A repeated identical failure code is the most common source of toast flooding: the exam page
 * buttons stay enabled after a failure, so the user can retrigger the same call. The counter
 * folds consecutive equal codes and only reports a change.
 */
class FailureDeduplicator {
  private lastCode: number = -1;
  private consecutive: number = 0;
  private total: number = 0;
  private folds: number = 0;
  private distinctCodes: Set<number> = new Set<number>();

  public observe(code: number): boolean {
    this.total++;
    this.distinctCodes.add(code);
    if (code === this.lastCode) {
      this.consecutive++;
      this.folds++;
      return false;
    }
    this.lastCode = code;
    this.consecutive = 1;
    return true;
  }

  public getLastCode(): number {
    return this.lastCode;
  }

  public getConsecutive(): number {
    return this.consecutive;
  }

  public getTotal(): number {
    return this.total;
  }

  public getFolds(): number {
    return this.folds;
  }

  public getDistinctCount(): number {
    return this.distinctCodes.size;
  }

  public reset(): void {
    this.lastCode = -1;
    this.consecutive = 0;
    this.total = 0;
    this.folds = 0;
    this.distinctCodes = new Set<number>();
  }
}

/**
 * Validates the toast text against the leak rules.
 *
 * The message of an api error must not carry a bundle name, a stack trace or a path. The
 * validator lists the patterns that must not appear so that a leak is reported with the exact
 * offending pattern.
 */
class ToastLeakValidator {
  private forbidden: string[] = ['com.', 'com/', '/data/', 'at ', 'Error:', 'Exception', 'token'];

  public violations(message: string): string[] {
    const found: string[] = [];
    for (let i = 0; i < this.forbidden.length; i++) {
      if (message.indexOf(this.forbidden[i]) >= 0) {
        found.push(this.forbidden[i]);
      }
    }
    return found;
  }

  public isClean(message: string): boolean {
    return this.violations(message).length === 0;
  }

  public forbiddenCount(): number {
    return this.forbidden.length;
  }
}

/**
 * Builds the event object that the watch handler receives.
 *
 * @param type event type string of the controller.
 * @param code error code of the event.
 * @param message error message of the event.
 * @param seq sequence number of the controller.
 * @returns the event object.
 */
function buildEvent(type: string, code: number, message: string, seq: number): WatchEvent {
  return {
    type: type,
    code: code,
    message: message,
    seq: seq
  };
}

/**
 * Checks whether a duration is the documented toast duration.
 *
 * @param duration duration in milliseconds.
 * @returns true for the two thousand milliseconds of the sample.
 */
function isDocumentedToastDuration(duration: number): boolean {
  return duration === TOAST_DURATION;
}

/**
 * Builds a long text of a fixed length.
 *
 * @param length number of characters of the returned text.
 * @returns a text of the requested length.
 */
function buildLongText(length: number): string {
  let text: string = '';
  for (let i = 0; i < length; i++) {
    text += 'x';
  }
  return text;
}

/**
 * Evaluates a predicate over the documented error codes.
 *
 * @param predicate condition to evaluate.
 * @returns true when the predicate holds for all five documented codes.
 */
function holdsForEveryErrorCode(predicate: (code: number) => boolean): boolean {
  const codes: number[] = [CODE_OK, CODE_USER_CANCEL, CODE_TIMEOUT, CODE_SYSTEM_ERROR, CODE_ENV_ANOMALY];
  for (let i = 0; i < codes.length; i++) {
    if (!predicate(codes[i])) {
      return false;
    }
  }
  return true;
}

export default function toastNotificationTest() {
  describe('ToastNotification_Test', () => {
    let driver: Driver;
    let formatter: ToastFormatter;
    let policy: ToastPolicy;
    let pipeline: ToastPipeline;
    let lifecycle: ToastLifecycle;
    let deduplicator: FailureDeduplicator;
    let leakValidator: ToastLeakValidator;

    beforeAll(async () => {
      driver = getDriver();
      formatter = new ToastFormatter();
      policy = new ToastPolicy();
      pipeline = new ToastPipeline();
      lifecycle = new ToastLifecycle();
      deduplicator = new FailureDeduplicator();
      leakValidator = new ToastLeakValidator();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_TRANSITION);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the toast constants of the sample.
     * Expectation: the toast duration is two thousand milliseconds, the default duration is a
     * different value and the prefix carries the sample tag.
     */
    it('Assessment_ToastConstants_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastConstants_001, begin');
      expect(TOAST_DURATION).assertEqual(2000);
      expect(TOAST_DEFAULT_DURATION).assertEqual(1500);
      expect(isDocumentedToastDuration(TOAST_DURATION)).assertTrue();
      expect(isDocumentedToastDuration(TOAST_DEFAULT_DURATION)).assertFalse();
      expect(TOAST_PREFIX).assertEqual('[Sample_Assessment] error code: ');
      expect(TOAST_PREFIX).assertContain(TAG);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastConstants_001, end');
    });

    /**
     * Scenario: format the toast message for the documented error codes.
     * Expectation: the message is the tag, the fixed label and the decimal code, with a single
     * space after the colon.
     */
    it('Assessment_ToastMessageFormat_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastMessageFormat_002, begin');
      expect(formatter.message(CODE_USER_CANCEL)).assertEqual('[Sample_Assessment] error code: 1');
      expect(formatter.message(CODE_TIMEOUT)).assertEqual('[Sample_Assessment] error code: 2');
      expect(formatter.message(CODE_SYSTEM_ERROR)).assertEqual('[Sample_Assessment] error code: 3');
      expect(formatter.message(CODE_ENV_ANOMALY)).assertEqual('[Sample_Assessment] error code: 4');
      expect(formatter.message(CODE_PERMISSION_DENIED)).assertEqual('[Sample_Assessment] error code: 201');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastMessageFormat_002, end');
    });

    /**
     * Scenario: the formatted message keeps the exact single space separator.
     * Expectation: the message never carries a double space and never omits the space.
     */
    it('Assessment_ToastMessageSeparator_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastMessageSeparator_003, begin');
      const message: string = formatter.message(CODE_SYSTEM_ERROR);
      expect(message.indexOf('code: 3')).assertLargerOrEqual(0);
      expect(message.indexOf('code:3')).assertEqual(-1);
      expect(message.indexOf('code:  3')).assertEqual(-1);
      expect(message.length).assertEqual(TOAST_PREFIX.length + 1);
      expect(message.endsWith('3')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastMessageSeparator_003, end');
    });

    /**
     * Scenario: format the toast message for a negative and a large code.
     * Expectation: the code is rendered as a decimal integer, the prefix stays untouched.
     */
    it('Assessment_ToastMessageNumericCodes_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastMessageNumericCodes_004, begin');
      expect(formatter.message(0)).assertEqual('[Sample_Assessment] error code: 0');
      expect(formatter.message(-1)).assertEqual('[Sample_Assessment] error code: -1');
      expect(formatter.message(999999)).assertEqual('[Sample_Assessment] error code: 999999');
      expect(formatter.isWellFormed(formatter.message(999999))).assertTrue();
      expect(formatter.isWellFormed(formatter.message(-1))).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastMessageNumericCodes_004, end');
    });

    /**
     * Scenario: parse the code back out of a toast message.
     * Expectation: a well formed message yields the original code, a malformed message yields
     * the sentinel minus one.
     */
    it('Assessment_ToastMessageRoundTrip_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastMessageRoundTrip_005, begin');
      expect(formatter.codeOf(formatter.message(CODE_ENV_ANOMALY))).assertEqual(CODE_ENV_ANOMALY);
      expect(formatter.codeOf(formatter.message(CODE_PERMISSION_DENIED))).assertEqual(CODE_PERMISSION_DENIED);
      expect(formatter.codeOf('garbage')).assertEqual(-1);
      expect(formatter.codeOf('')).assertEqual(-1);
      expect(formatter.codeOf(TOAST_PREFIX)).assertEqual(-1);
      expect(formatter.codeOf(`${TOAST_PREFIX}abc`)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastMessageRoundTrip_005, end');
    });

    /**
     * Scenario: verify the well formedness predicate on hand written messages.
     * Expectation: only a prefix followed by digits is accepted.
     */
    it('Assessment_ToastMessageWellFormed_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastMessageWellFormed_006, begin');
      expect(formatter.isWellFormed('[Sample_Assessment] error code: 7')).assertTrue();
      expect(formatter.isWellFormed('[Sample_Assessment] error code: ')).assertFalse();
      expect(formatter.isWellFormed('[Sample_Assessment] error code: 7a')).assertFalse();
      expect(formatter.isWellFormed('[Other] error code: 7')).assertFalse();
      expect(formatter.isWellFormed('')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastMessageWellFormed_006, end');
    });

    /**
     * Scenario: the duration of a toast request.
     * Expectation: every request carries the documented two thousand milliseconds.
     */
    it('Assessment_ToastDuration_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastDuration_007, begin');
      expect(formatter.durationOf()).assertEqual(TOAST_DURATION);
      const local: ToastPipeline = new ToastPipeline();
      local.dispatchApiError(CODE_SYSTEM_ERROR, 'failed');
      expect(local.getLastDuration()).assertEqual(2000);
      const records: ToastRecord[] = local.getRecords();
      expect(records.length).assertEqual(1);
      expect(records[0].duration).assertEqual(TOAST_DURATION);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastDuration_007, end');
    });

    /**
     * Scenario: a custom formatter with a different prefix and duration.
     * Expectation: the formatter is parameter driven, the sample uses the default one.
     */
    it('Assessment_ToastFormatterCustomisation_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastFormatterCustomisation_008, begin');
      const custom: ToastFormatter = new ToastFormatter('[Alt] code=', 1000);
      expect(custom.message(5)).assertEqual('[Alt] code=5');
      expect(custom.durationOf()).assertEqual(1000);
      expect(custom.getPrefix()).assertEqual('[Alt] code=');
      expect(custom.isWellFormed('[Alt] code=5')).assertTrue();
      expect(formatter.getPrefix()).assertEqual(TOAST_PREFIX);
      expect(formatter.countOccurrences('[')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastFormatterCustomisation_008, end');
    });

    /**
     * Scenario: an onApiError event reaches the watch handler.
     * Expectation: the policy asks for a toast with the formatted message and the documented
     * duration.
     */
    it('Assessment_ToastOnApiError_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastOnApiError_009, begin');
      const decision: ToastDecision = policy.decide(buildEvent(EVENT_API_ERROR, CODE_PERMISSION_DENIED, 'denied', 4));
      expect(decision.shouldShow).assertTrue();
      expect(decision.message).assertEqual('[Sample_Assessment] error code: 201');
      expect(decision.duration).assertEqual(TOAST_DURATION);
      expect(decision.reason).assertContain('failed');
      expect(policy.isToastEvent(EVENT_API_ERROR)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastOnApiError_009, end');
    });

    /**
     * Scenario: a successful begin event reaches the watch handler.
     * Expectation: no toast is raised because the entry page pushes the exam page instead.
     */
    it('Assessment_NoToastOnSuccessfulBegin_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NoToastOnSuccessfulBegin_010, begin');
      const decision: ToastDecision = policy.decide(buildEvent(EVENT_BEGIN, CODE_OK, '', 1));
      expect(decision.shouldShow).assertFalse();
      expect(decision.message).assertEqual('');
      expect(decision.duration).assertEqual(0);
      expect(decision.reason).assertContain('pushed');
      expect(policy.isToastEvent(EVENT_BEGIN)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NoToastOnSuccessfulBegin_010, end');
    });

    /**
     * Scenario: a failed begin event reaches the watch handler.
     * Expectation: no toast is raised, the exam page dialog explains the failure.
     */
    it('Assessment_NoToastOnFailedBegin_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NoToastOnFailedBegin_011, begin');
      const canceled: ToastDecision = policy.decide(buildEvent(EVENT_BEGIN, CODE_USER_CANCEL, 'canceled', 2));
      const expired: ToastDecision = policy.decide(buildEvent(EVENT_BEGIN, CODE_TIMEOUT, 'expired', 3));
      expect(canceled.shouldShow).assertFalse();
      expect(expired.shouldShow).assertFalse();
      expect(canceled.reason).assertContain('dialog');
      expect(expired.reason).assertContain('dialog');
      expect(policy.isToastEvent(EVENT_BEGIN)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NoToastOnFailedBegin_011, end');
    });

    /**
     * Scenario: an interruption and an end event reach the watch handler.
     * Expectation: neither raises a toast, the dialog of the exam page carries the reason.
     */
    it('Assessment_NoToastOnInterruptAndEnd_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NoToastOnInterruptAndEnd_012, begin');
      const interrupted: ToastDecision = policy.decide(
        buildEvent(EVENT_INTERRUPTED, CODE_ENV_ANOMALY, 'anomaly', 4));
      const ended: ToastDecision = policy.decide(buildEvent(EVENT_END, CODE_OK, '', 5));
      expect(interrupted.shouldShow).assertFalse();
      expect(ended.shouldShow).assertFalse();
      expect(interrupted.reason).assertContain('interruption');
      expect(ended.reason).assertContain('end');
      expect(policy.isToastEvent(EVENT_INTERRUPTED)).assertFalse();
      expect(policy.isToastEvent(EVENT_END)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NoToastOnInterruptAndEnd_012, end');
    });

    /**
     * Scenario: an unknown event type reaches the watch handler.
     * Expectation: no toast is raised and the reason names the unhandled type.
     */
    it('Assessment_NoToastOnUnknownType_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NoToastOnUnknownType_013, begin');
      const decision: ToastDecision = policy.decide(buildEvent('onResume', CODE_SYSTEM_ERROR, 'x', 6));
      expect(decision.shouldShow).assertFalse();
      expect(decision.reason).assertContain('not handled');
      const empty: ToastDecision = policy.decide(buildEvent('', 0, '', 7));
      expect(empty.shouldShow).assertFalse();
      expect(policy.isToastEvent('onResume')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NoToastOnUnknownType_013, end');
    });

    /**
     * Scenario: classify the watch event types.
     * Expectation: the four documented strings map onto their own kind.
     */
    it('Assessment_WatchEventClassification_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WatchEventClassification_014, begin');
      expect(policy.kindOf(EVENT_BEGIN)).assertEqual(WatchEventKind.BEGIN);
      expect(policy.kindOf(EVENT_INTERRUPTED)).assertEqual(WatchEventKind.INTERRUPTED);
      expect(policy.kindOf(EVENT_END)).assertEqual(WatchEventKind.END);
      expect(policy.kindOf(EVENT_API_ERROR)).assertEqual(WatchEventKind.API_ERROR);
      expect(policy.kindOf('onResume')).assertEqual(WatchEventKind.API_ERROR);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'WatchEventClassification_014, end');
    });

    /**
     * Scenario: a single api error is dispatched through the pipeline.
     * Expectation: one toast is shown, the sequence number is taken from the event and the
     * message carries the code.
     */
    it('Assessment_PipelineSingleToast_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineSingleToast_015, begin');
      pipeline.reset();
      const outcome: ToastOutcome = pipeline.dispatch(buildEvent(EVENT_API_ERROR, CODE_SYSTEM_ERROR, 'failed', 9));
      expect(outcome).assertEqual(ToastOutcome.SHOWN);
      expect(pipeline.getShown()).assertEqual(1);
      expect(pipeline.getFailed()).assertEqual(0);
      expect(pipeline.getSkipped()).assertEqual(0);
      expect(pipeline.getSeq()).assertEqual(9);
      expect(pipeline.getLastMessage()).assertEqual('[Sample_Assessment] error code: 3');
      hilog.info(DOMAIN, TAG, '%{public}s', pipeline.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineSingleToast_015, end');
    });

    /**
     * Scenario: a non toast event is dispatched through the pipeline.
     * Expectation: the request is skipped and no record is created.
     */
    it('Assessment_PipelineSkipsSuccess_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineSkipsSuccess_016, begin');
      pipeline.reset();
      expect(pipeline.dispatch(buildEvent(EVENT_BEGIN, CODE_OK, '', 1))).assertEqual(ToastOutcome.SKIPPED);
      expect(pipeline.dispatch(buildEvent(EVENT_END, CODE_OK, '', 2))).assertEqual(ToastOutcome.SKIPPED);
      expect(pipeline.getShown()).assertEqual(0);
      expect(pipeline.getSkipped()).assertEqual(2);
      expect(pipeline.recordCount()).assertEqual(0);
      expect(pipeline.getLastMessage()).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineSkipsSuccess_016, end');
    });

    /**
     * Scenario: the same failure code is delivered twice in a row.
     * Expectation: the second request is folded, so the user sees one toast instead of two
     * identical ones.
     */
    it('Assessment_PipelineDeduplicatesCode_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineDeduplicatesCode_017, begin');
      pipeline.reset();
      expect(pipeline.dispatchApiError(CODE_SYSTEM_ERROR, 'failed')).assertEqual(ToastOutcome.SHOWN);
      expect(pipeline.dispatchApiError(CODE_SYSTEM_ERROR, 'failed')).assertEqual(ToastOutcome.SKIPPED);
      expect(pipeline.dispatchApiError(CODE_SYSTEM_ERROR, 'failed')).assertEqual(ToastOutcome.SKIPPED);
      expect(pipeline.getShown()).assertEqual(1);
      expect(pipeline.getSkipped()).assertEqual(2);
      expect(pipeline.recordCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineDeduplicatesCode_017, end');
    });

    /**
     * Scenario: two different failure codes are delivered in a row.
     * Expectation: both raise a toast, the folding only applies to consecutive equal codes.
     */
    it('Assessment_PipelineDistinctCodes_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineDistinctCodes_018, begin');
      pipeline.reset();
      expect(pipeline.dispatchApiError(CODE_PERMISSION_DENIED, 'denied')).assertEqual(ToastOutcome.SHOWN);
      expect(pipeline.dispatchApiError(CODE_SYSTEM_ERROR, 'failed')).assertEqual(ToastOutcome.SHOWN);
      expect(pipeline.dispatchApiError(CODE_PERMISSION_DENIED, 'denied')).assertEqual(ToastOutcome.SHOWN);
      expect(pipeline.getShown()).assertEqual(3);
      expect(pipeline.countByCode(CODE_PERMISSION_DENIED)).assertEqual(2);
      expect(pipeline.countByCode(CODE_SYSTEM_ERROR)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineDistinctCodes_018, end');
    });

    /**
     * Scenario: the folding is disabled.
     * Expectation: every api error raises a toast, which is the raw behaviour without the
     * de-duplication guard.
     */
    it('Assessment_PipelineDedupeDisabled_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineDedupeDisabled_019, begin');
      const local: ToastPipeline = new ToastPipeline();
      local.setDedupeEnabled(false);
      for (let i = 0; i < 5; i++) {
        expect(local.dispatchApiError(CODE_TIMEOUT, 'expired')).assertEqual(ToastOutcome.SHOWN);
      }
      expect(local.getShown()).assertEqual(5);
      expect(local.getSkipped()).assertEqual(0);
      expect(local.isDedupeEnabled()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineDedupeDisabled_019, end');
    });

    /**
     * Scenario: the folding is re-enabled after it was switched off.
     * Expectation: the next repeated code is folded again.
     */
    it('Assessment_PipelineDedupeToggled_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineDedupeToggled_020, begin');
      const local: ToastPipeline = new ToastPipeline();
      local.setDedupeEnabled(false);
      local.dispatchApiError(CODE_ENV_ANOMALY, 'anomaly');
      local.dispatchApiError(CODE_ENV_ANOMALY, 'anomaly');
      expect(local.getShown()).assertEqual(2);
      local.setDedupeEnabled(true);
      expect(local.dispatchApiError(CODE_ENV_ANOMALY, 'anomaly')).assertEqual(ToastOutcome.SKIPPED);
      expect(local.getShown()).assertEqual(2);
      expect(local.getSkipped()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineDedupeToggled_020, end');
    });

    /**
     * Scenario: the prompt action rejects the toast request.
     * Expectation: the pipeline counts the failure, no message is stored and the application
     * keeps running.
     */
    it('Assessment_PipelineShowFailure_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineShowFailure_021, begin');
      const local: ToastPipeline = new ToastPipeline();
      local.failNextRequest();
      expect(local.dispatchApiError(CODE_SYSTEM_ERROR, 'failed')).assertEqual(ToastOutcome.FAILED);
      expect(local.getFailed()).assertEqual(1);
      expect(local.getShown()).assertEqual(0);
      expect(local.getLastMessage()).assertEqual('');
      expect(local.recordCount()).assertEqual(1);
      expect(local.countByOutcome(ToastOutcome.FAILED)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', local.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineShowFailure_021, end');
    });

    /**
     * Scenario: a failure of the toast request is followed by a successful one.
     * Expectation: the failure does not latch, the next request is shown normally.
     */
    it('Assessment_PipelineRecoversAfterFailure_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineRecoversAfterFailure_022, begin');
      const local: ToastPipeline = new ToastPipeline();
      local.failNextRequest();
      local.dispatchApiError(CODE_INNER_ERROR, 'inner');
      expect(local.getFailed()).assertEqual(1);
      local.dispatchApiError(CODE_CAPABILITY_NOT_SUPPORT, 'unsupported');
      expect(local.getShown()).assertEqual(1);
      expect(local.getLastMessage()).assertEqual('[Sample_Assessment] error code: 801');
      expect(local.countByOutcome(ToastOutcome.SHOWN)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineRecoversAfterFailure_022, end');
    });

    /**
     * Scenario: every recorded toast is well formed.
     * Expectation: all records carry the sample prefix, a decimal code and the documented
     * duration after a mixed failure sequence.
     */
    it('Assessment_PipelineRecordsWellFormed_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineRecordsWellFormed_023, begin');
      const local: ToastPipeline = new ToastPipeline();
      local.dispatchApiError(CODE_PERMISSION_DENIED, 'denied');
      local.dispatchApiError(CODE_SYSTEM_ERROR, 'failed');
      local.dispatchApiError(CODE_PARAM_INVALID, 'invalid');
      local.dispatchApiError(CODE_ENV_ANOMALY, 'anomaly');
      expect(local.recordCount()).assertEqual(4);
      expect(local.everyRecordWellFormed()).assertTrue();
      expect(local.everyRecordNonEmpty()).assertTrue();
      expect(local.countByOutcome(ToastOutcome.SHOWN)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineRecordsWellFormed_023, end');
    });

    /**
     * Scenario: the sequence number of the pipeline.
     * Expectation: an event with a sequence number keeps it, an event without one raises the
     * counter of the pipeline.
     */
    it('Assessment_PipelineSequence_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineSequence_024, begin');
      const local: ToastPipeline = new ToastPipeline();
      local.dispatch(buildEvent(EVENT_API_ERROR, CODE_SYSTEM_ERROR, 'a', 42));
      expect(local.getSeq()).assertEqual(42);
      local.dispatchApiError(CODE_TIMEOUT, 'b');
      expect(local.getSeq()).assertEqual(43);
      local.dispatchApiError(CODE_TIMEOUT, 'c');
      expect(local.getSeq()).assertEqual(44);
      const records: ToastRecord[] = local.getRecords();
      expect(records[0].seq).assertEqual(42);
      expect(records[1].seq).assertEqual(43);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineSequence_024, end');
    });

    /**
     * Scenario: the pipeline is reset between two sessions.
     * Expectation: the counters, the records and the last message are dropped.
     */
    it('Assessment_PipelineReset_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineReset_025, begin');
      const local: ToastPipeline = new ToastPipeline();
      local.dispatchApiError(CODE_SYSTEM_ERROR, 'failed');
      local.dispatchApiError(CODE_TIMEOUT, 'expired');
      expect(local.getShown()).assertEqual(2);
      local.reset();
      expect(local.getShown()).assertEqual(0);
      expect(local.getFailed()).assertEqual(0);
      expect(local.getSkipped()).assertEqual(0);
      expect(local.recordCount()).assertEqual(0);
      expect(local.getSeq()).assertEqual(0);
      expect(local.getLastMessage()).assertEqual('');
      expect(local.getLastCode()).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', local.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineReset_025, end');
    });

    /**
     * Scenario: the lifecycle of a single toast.
     * Expectation: the toast stays visible for the full duration and disappears afterwards.
     */
    it('Assessment_LifecycleSingleToast_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LifecycleSingleToast_026, begin');
      lifecycle.reset();
      lifecycle.show('[Sample_Assessment] error code: 3', TOAST_DURATION);
      expect(lifecycle.isVisible()).assertTrue();
      expect(lifecycle.getRemainingMs()).assertEqual(TOAST_DURATION);
      lifecycle.advance(TOAST_DURATION - 1);
      expect(lifecycle.isVisible()).assertTrue();
      expect(lifecycle.getRemainingMs()).assertEqual(1);
      lifecycle.advance(1);
      expect(lifecycle.isVisible()).assertFalse();
      expect(lifecycle.getRemainingMs()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LifecycleSingleToast_026, end');
    });

    /**
     * Scenario: a second toast arrives while the first one is visible.
     * Expectation: the new toast replaces the old one and the replacement is counted.
     */
    it('Assessment_LifecycleReplacement_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LifecycleReplacement_027, begin');
      lifecycle.reset();
      lifecycle.show('[Sample_Assessment] error code: 3', TOAST_DURATION);
      lifecycle.advance(500);
      lifecycle.show('[Sample_Assessment] error code: 4', TOAST_DURATION);
      expect(lifecycle.getReplacements()).assertEqual(1);
      expect(lifecycle.getCurrentMessage()).assertEqual('[Sample_Assessment] error code: 4');
      expect(lifecycle.getRemainingMs()).assertEqual(TOAST_DURATION);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LifecycleReplacement_027, end');
    });

    /**
     * Scenario: advancing the clock while no toast is visible.
     * Expectation: the lifecycle ignores the advance and never goes negative.
     */
    it('Assessment_LifecycleIdleAdvance_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LifecycleIdleAdvance_028, begin');
      lifecycle.reset();
      lifecycle.advance(TOAST_DURATION);
      expect(lifecycle.isVisible()).assertFalse();
      expect(lifecycle.getRemainingMs()).assertEqual(0);
      expect(lifecycle.getCurrentMessage()).assertEqual('');
      expect(lifecycle.getReplacements()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LifecycleIdleAdvance_028, end');
    });

    /**
     * Scenario: the failure de-duplicator with a repeated code.
     * Expectation: only the first observation is reported as a change, the rest are folded.
     */
    it('Assessment_DeduplicatorRepeatedCode_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DeduplicatorRepeatedCode_029, begin');
      deduplicator.reset();
      expect(deduplicator.observe(CODE_SYSTEM_ERROR)).assertTrue();
      expect(deduplicator.observe(CODE_SYSTEM_ERROR)).assertFalse();
      expect(deduplicator.observe(CODE_SYSTEM_ERROR)).assertFalse();
      expect(deduplicator.getConsecutive()).assertEqual(3);
      expect(deduplicator.getFolds()).assertEqual(2);
      expect(deduplicator.getDistinctCount()).assertEqual(1);
      expect(deduplicator.getTotal()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DeduplicatorRepeatedCode_029, end');
    });

    /**
     * Scenario: the failure de-duplicator with alternating codes.
     * Expectation: every change is reported, the fold counter stays at zero.
     */
    it('Assessment_DeduplicatorAlternating_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DeduplicatorAlternating_030, begin');
      deduplicator.reset();
      expect(deduplicator.observe(CODE_USER_CANCEL)).assertTrue();
      expect(deduplicator.observe(CODE_TIMEOUT)).assertTrue();
      expect(deduplicator.observe(CODE_USER_CANCEL)).assertTrue();
      expect(deduplicator.getFolds()).assertEqual(0);
      expect(deduplicator.getDistinctCount()).assertEqual(2);
      expect(deduplicator.getTotal()).assertEqual(3);
      expect(deduplicator.getLastCode()).assertEqual(CODE_USER_CANCEL);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DeduplicatorAlternating_030, end');
    });

    /**
     * Scenario: a burst of repeated failures.
     * Expectation: exactly one change is reported and the remaining requests are folded.
     */
    it('Assessment_DeduplicatorBurst_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DeduplicatorBurst_031, begin');
      deduplicator.reset();
      let changes: number = 0;
      for (let i = 0; i < STRESS_ROUNDS_TOAST; i++) {
        if (deduplicator.observe(CODE_PERMISSION_DENIED)) {
          changes++;
        }
      }
      expect(changes).assertEqual(1);
      expect(deduplicator.getFolds()).assertEqual(STRESS_ROUNDS_TOAST - 1);
      expect(deduplicator.getTotal()).assertEqual(STRESS_ROUNDS_TOAST);
      expect(deduplicator.getConsecutive()).assertEqual(STRESS_ROUNDS_TOAST);
      hilog.info(DOMAIN, TAG, '%{public}s burst of %{public}d failures folded into %{public}d toast',
        BUNDLE + 'DeduplicatorBurst_031', deduplicator.getTotal(), changes);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DeduplicatorBurst_031, end');
    });

    /**
     * Scenario: the de-duplicator is reset between two sessions.
     * Expectation: the first observation after the reset is reported as a change.
     */
    it('Assessment_DeduplicatorReset_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DeduplicatorReset_032, begin');
      deduplicator.reset();
      deduplicator.observe(CODE_ENV_ANOMALY);
      deduplicator.observe(CODE_ENV_ANOMALY);
      expect(deduplicator.observe(CODE_ENV_ANOMALY)).assertFalse();
      deduplicator.reset();
      expect(deduplicator.getTotal()).assertEqual(0);
      expect(deduplicator.getFolds()).assertEqual(0);
      expect(deduplicator.getLastCode()).assertEqual(-1);
      expect(deduplicator.observe(CODE_ENV_ANOMALY)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DeduplicatorReset_032, end');
    });

    /**
     * Scenario: the toast text of a permission denial.
     * Expectation: the message is clean, it carries neither a bundle name nor a path.
     */
    it('Assessment_LeakPermissionDenied_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LeakPermissionDenied_033, begin');
      const message: string = formatter.message(CODE_PERMISSION_DENIED);
      expect(leakValidator.isClean(message)).assertTrue();
      expect(leakValidator.violations(message).length).assertEqual(0);
      expect(message.indexOf('com.')).assertEqual(-1);
      expect(message.indexOf('/data/')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LeakPermissionDenied_033, end');
    });

    /**
     * Scenario: the leak validator on a message that carries internals.
     * Expectation: the validator reports every offending pattern that is present.
     */
    it('Assessment_LeakDetected_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LeakDetected_034, begin');
      const dirty: string = 'failed for com.samples.dictionary at /data/app/token';
      expect(leakValidator.isClean(dirty)).assertFalse();
      const found: string[] = leakValidator.violations(dirty);
      expect(found.length).assertLargerOrEqual(3);
      expect(found.indexOf('com.') >= 0).assertTrue();
      expect(found.indexOf('/data/') >= 0).assertTrue();
      expect(found.indexOf('token') >= 0).assertTrue();
      expect(leakValidator.forbiddenCount()).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LeakDetected_034, end');
    });

    /**
     * Scenario: the toast of every documented error code.
     * Expectation: all five messages are clean and well formed, so no code path leaks internals.
     */
    it('Assessment_LeakEveryDocumentedCode_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LeakEveryDocumentedCode_035, begin');
      expect(holdsForEveryErrorCode((code: number) => leakValidator.isClean(formatter.message(code))))
        .assertTrue();
      expect(holdsForEveryErrorCode((code: number) => formatter.isWellFormed(formatter.message(code))))
        .assertTrue();
      expect(holdsForEveryErrorCode((code: number) => formatter.message(code).indexOf(TAG) === 0))
        .assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LeakEveryDocumentedCode_035, end');
    });

    /**
     * Scenario: the message of the service is not rendered even when it is empty.
     * Expectation: an api error without a message still produces a readable toast.
     */
    it('Assessment_EmptyMessageStillFormatted_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EmptyMessageStillFormatted_037, begin');
      const decision: ToastDecision = policy.decide(buildEvent(EVENT_API_ERROR, CODE_INNER_ERROR, '', 1));
      expect(decision.shouldShow).assertTrue();
      expect(decision.message).assertEqual('[Sample_Assessment] error code: 202');
      expect(decision.message.length).assertLarger(0);
      const local: ToastPipeline = new ToastPipeline();
      local.dispatchApiError(CODE_INNER_ERROR, '');
      expect(local.getLastMessage()).assertEqual('[Sample_Assessment] error code: 202');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EmptyMessageStillFormatted_037, end');
    });

    /**
     * Scenario: the toast is raised for a begin failure that reaches the page as an api error.
     * Expectation: the controller publishes an api error when begin throws, so the page shows
     * the toast with the business error code of the exception.
     */
    it('Assessment_ToastOnBeginException_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastOnBeginException_038, begin');
      const local: ToastPipeline = new ToastPipeline();
      local.dispatch(buildEvent(EVENT_API_ERROR, CODE_PARAM_INVALID, 'shortage of memory', 3));
      expect(local.getShown()).assertEqual(1);
      expect(local.getLastMessage()).assertEqual('[Sample_Assessment] error code: 401');
      expect(leakValidator.isClean(local.getLastMessage())).assertTrue();
      expect(local.getLastCode()).assertEqual(CODE_PARAM_INVALID);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastOnBeginException_038, end');
    });

    /**
     * Scenario: the toast is raised for an end failure.
     * Expectation: when assessment.end throws, the controller publishes an api error and the
     * page raises the toast with the code of the exception.
     */
    it('Assessment_ToastOnEndException_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastOnEndException_039, begin');
      const local: ToastPipeline = new ToastPipeline();
      local.dispatch(buildEvent(EVENT_API_ERROR, CODE_SYSTEM_ERROR, 'the service is unavailable', 4));
      expect(local.getShown()).assertEqual(1);
      expect(local.getLastMessage()).assertEqual('[Sample_Assessment] error code: 3');
      const decision: ToastDecision = policy.decide(
        buildEvent(EVENT_API_ERROR, CODE_SYSTEM_ERROR, 'the service is unavailable', 4));
      expect(decision.shouldShow).assertTrue();
      expect(decision.duration).assertEqual(TOAST_DURATION);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastOnEndException_039, end');
    });

    /**
     * Scenario: a query failure raises the toast as well.
     * Expectation: isActive and getConfiguration are guarded, a failure there produces an api
     * error event and therefore a toast.
     */
    it('Assessment_ToastOnQueryFailure_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastOnQueryFailure_040, begin');
      const local: ToastPipeline = new ToastPipeline();
      local.dispatch(buildEvent(EVENT_API_ERROR, CODE_CAPABILITY_NOT_SUPPORT, 'not supported', 5));
      expect(local.getShown()).assertEqual(1);
      expect(local.getLastMessage()).assertEqual('[Sample_Assessment] error code: 801');
      const second: ToastOutcome = local.dispatch(
        buildEvent(EVENT_API_ERROR, CODE_INNER_ERROR, 'inner', 6));
      expect(second).assertEqual(ToastOutcome.SHOWN);
      expect(local.getShown()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastOnQueryFailure_040, end');
    });

    /**
     * Scenario: a mixed session with successes and failures.
     * Expectation: only the failures raise a toast, the successes are skipped without noise.
     */
    it('Assessment_MixedSession_041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MixedSession_041, begin');
      const local: ToastPipeline = new ToastPipeline();
      const events: WatchEvent[] = [
        buildEvent(EVENT_BEGIN, CODE_OK, '', 1),
        buildEvent(EVENT_API_ERROR, CODE_SYSTEM_ERROR, 'failed', 2),
        buildEvent(EVENT_INTERRUPTED, CODE_TIMEOUT, 'expired', 3),
        buildEvent(EVENT_API_ERROR, CODE_PERMISSION_DENIED, 'denied', 4),
        buildEvent(EVENT_END, CODE_OK, '', 5)
      ];
      for (let i = 0; i < events.length; i++) {
        local.dispatch(events[i]);
      }
      expect(local.getShown()).assertEqual(2);
      expect(local.getSkipped()).assertEqual(3);
      expect(local.recordCount()).assertEqual(2);
      expect(local.countByCode(CODE_SYSTEM_ERROR)).assertEqual(1);
      expect(local.countByCode(CODE_PERMISSION_DENIED)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', local.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MixedSession_041, end');
    });

    /**
     * Scenario: the description of the pipeline used by the failure diagnosis.
     * Expectation: the description names the shown, failed and skipped counters and the
     * sequence number.
     */
    it('Assessment_PipelineDescription_043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineDescription_043, begin');
      const local: ToastPipeline = new ToastPipeline();
      local.dispatchApiError(CODE_SYSTEM_ERROR, 'failed');
      local.failNextRequest();
      local.dispatchApiError(CODE_TIMEOUT, 'expired');
      const text: string = local.describe();
      expect(text).assertContain('shown=1');
      expect(text).assertContain('failed=1');
      expect(text).assertContain('skipped=0');
      expect(text).assertContain('seq=');
      hilog.info(DOMAIN, TAG, '%{public}s', text);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PipelineDescription_043, end');
    });

    /**
     * Scenario: the sequence numbers of the controller stay strictly increasing.
     * Expectation: every api error carries a larger sequence number than its predecessor, so the
     * watch handler fires once per event.
     */
    it('Assessment_SequenceMonotonic_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SequenceMonotonic_044, begin');
      const local: ToastPipeline = new ToastPipeline();
      let previous: number = 0;
      let monotonic: boolean = true;
      for (let i = 0; i < 10; i++) {
        local.dispatchApiError(CODE_SYSTEM_ERROR + (i % 2), 'failed');
        const current: number = local.getSeq();
        if (current <= previous) {
          monotonic = false;
        }
        previous = current;
      }
      expect(monotonic).assertTrue();
      expect(local.getSeq()).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SequenceMonotonic_044, end');
    });

    /**
     * Scenario: the event log of the controller under a toast storm.
     * Expectation: the log keeps its twenty entry cap while every failure still reaches the
     * watch handler.
     */
    it('Assessment_EventLogCapUnderStorm_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventLogCapUnderStorm_045, begin');
      const entries: string[] = [];
      for (let i = 0; i < MAX_EVENT_LOG + 10; i++) {
        entries.unshift(`${EVENT_API_ERROR} code=3 message=failed ${i}`);
        if (entries.length > MAX_EVENT_LOG) {
          entries.pop();
        }
      }
      expect(entries.length).assertEqual(MAX_EVENT_LOG);
      expect(entries[0]).assertContain(`${MAX_EVENT_LOG + 9}`);
      const local: ToastPipeline = new ToastPipeline();
      local.dispatchApiError(CODE_SYSTEM_ERROR, 'failed');
      expect(local.getShown()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s log capped at %{public}d entries',
        BUNDLE + 'EventLogCapUnderStorm_045', entries.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventLogCapUnderStorm_045, end');
    });

    /**
     * Scenario: the tag of every toast message is the sample tag.
     * Expectation: a toast from another module would break the filtering of the log, so the tag
     * is asserted on every documented code.
     */
    it('Assessment_ToastTagConsistency_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastTagConsistency_051, begin');
      expect(holdsForEveryErrorCode((code: number) => formatter.message(code).indexOf(TAG) === 0))
        .assertTrue();
      expect(formatter.message(CODE_OK).indexOf(TAG)).assertEqual(0);
      expect(TAG).assertEqual('[Sample_Assessment]');
      expect(BUNDLE).assertEqual('Assessment_');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastTagConsistency_051, end');
    });

    /**
     * Scenario: the message of two consecutive toasts never repeats within the fold window.
     * Expectation: after a code change the pipeline shows the new message, so the user always
     * sees the cause of the latest failure.
     */
    it('Assessment_ToastMessageFollowsCode_052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastMessageFollowsCode_052, begin');
      const local: ToastPipeline = new ToastPipeline();
      local.dispatchApiError(CODE_PERMISSION_DENIED, 'denied');
      const first: string = local.getLastMessage();
      local.dispatchApiError(CODE_ENV_ANOMALY, 'anomaly');
      const second: string = local.getLastMessage();
      expect(first === second).assertFalse();
      expect(first).assertEqual('[Sample_Assessment] error code: 201');
      expect(second).assertEqual('[Sample_Assessment] error code: 4');
      expect(local.getLastCode()).assertEqual(CODE_ENV_ANOMALY);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastMessageFollowsCode_052, end');
    });

    /**
     * Scenario: the toast decision of the four documented event types.
     * Expectation: only the api error event produces a toast, the other three never do.
     */
    it('Assessment_ToastEventMatrix_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastEventMatrix_053, begin');
      const types: string[] = [EVENT_BEGIN, EVENT_INTERRUPTED, EVENT_END, EVENT_API_ERROR];
      let toastTypes: number = 0;
      for (let i = 0; i < types.length; i++) {
        const decision: ToastDecision = policy.decide(buildEvent(types[i], CODE_SYSTEM_ERROR, 'x', i + 1));
        if (decision.shouldShow) {
          toastTypes++;
        }
      }
      expect(toastTypes).assertEqual(1);
      expect(policy.decide(buildEvent(EVENT_API_ERROR, CODE_SYSTEM_ERROR, 'x', 1)).shouldShow).assertTrue();
      expect(policy.decide(buildEvent(EVENT_API_ERROR, CODE_OK, 'x', 1)).shouldShow).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ToastEventMatrix_053, end');
    });
  });
}
