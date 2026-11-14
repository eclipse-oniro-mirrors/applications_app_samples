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
  TEXT_NO_EVENT,
  TIMEOUT_PAGE_RENDER,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  checkTextContent,
  containsTextFragment,
  waitForIndexPage,
  clickIndexButton,
  pressAndWait,
  KEY_BACK,
  DELAY_KEY_NAVIGATION
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Event type strings that the controller writes into the event log and into AppStorage. They
// are re-declared here because a test module must not import from the sample sources.
const EVENT_BEGIN: string = 'onBegin';
const EVENT_INTERRUPTED: string = 'onInterrupted';
const EVENT_END: string = 'onEnd';
const EVENT_API_ERROR: string = 'onApiError';

// Size limit of the event log of the controller.
const MAX_EVENT_LOG: number = 20;

// Error codes of the assessment kit, they are the only codes that the callbacks may carry.
const CODE_OK: number = 0;
const CODE_USER_CANCEL: number = 1;
const CODE_TIMEOUT: number = 2;
const CODE_SYSTEM_ERROR: number = 3;
const CODE_ENV_ANOMALY: number = 4;

// Capability that gates the assessment APIs of the sample.
const SYSCAP_ASSESSMENT: string = 'SystemCapability.Customization.AssessmentConfiguration';

// Label that the status card renders above the event log, it is used to detect the card.
const TEXT_EVENT_LOG_LABEL: string = 'Event log';

/**
 * Kinds of callback events of the assessment service.
 */
enum CallbackKind {
  BEGIN = 0,
  INTERRUPTED = 1,
  END = 2,
  API_ERROR = 3
}

/**
 * One entry of the event log of the controller.
 */
interface CallbackEvent {
  type: string;
  kind: CallbackKind;
  code: number;
  message: string;
  seq: number;
}

/**
 * Error object that the onBegin callback receives.
 */
interface BeginPayload {
  code: number;
  message: string;
}

/**
 * Interrupt object that the onInterrupted callback receives.
 */
interface InterruptPayload {
  code: number;
  message: string;
}

/**
 * Maps the event type strings to the callback kinds and back.
 *
 * The controller publishes the type string, the pages switch on it, so the mapping has to be
 * exact in both directions.
 */
class EventTypeMapper {
  private forward: Map<string, CallbackKind> = new Map<string, CallbackKind>();

  constructor() {
    this.forward.set(EVENT_BEGIN, CallbackKind.BEGIN);
    this.forward.set(EVENT_INTERRUPTED, CallbackKind.INTERRUPTED);
    this.forward.set(EVENT_END, CallbackKind.END);
    this.forward.set(EVENT_API_ERROR, CallbackKind.API_ERROR);
  }

  public kindOf(type: string): CallbackKind {
    const kind: CallbackKind | undefined = this.forward.get(type);
    return kind === undefined ? CallbackKind.API_ERROR : kind;
  }

  public isKnown(type: string): boolean {
    return this.forward.has(type);
  }

  public typeOf(kind: CallbackKind): string {
    if (kind === CallbackKind.BEGIN) {
      return EVENT_BEGIN;
    }
    if (kind === CallbackKind.INTERRUPTED) {
      return EVENT_INTERRUPTED;
    }
    if (kind === CallbackKind.END) {
      return EVENT_END;
    }
    return EVENT_API_ERROR;
  }

  public knownTypes(): string[] {
    const values: string[] = [];
    this.forward.forEach((kind: CallbackKind, type: string) => {
      values.push(type);
    });
    return values;
  }

  public size(): number {
    return this.forward.size;
  }

  public isTerminal(type: string): boolean {
    const kind: CallbackKind = this.kindOf(type);
    return kind === CallbackKind.INTERRUPTED || kind === CallbackKind.END;
  }
}

/**
 * Event sink that mirrors AssessmentController.publishEvent.
 *
 * The controller prepends every event to the log, trims the log to twenty entries and raises a
 * monotonic sequence number. The sink reproduces that behaviour so that the cap and the
 * monotonicity can be asserted without a device.
 */
class EventSink {
  private log: string[] = [];
  private seq: number = 0;
  private counters: Map<string, number> = new Map<string, number>();
  private lastType: string = '';
  private lastCode: number = -1;
  private lastMessage: string = '';

  public publish(type: string, code: number, message: string): CallbackEvent {
    this.seq++;
    const entry: string = `${type} code=${code} message=${message}`;
    const candidate: string[] = this.log.slice();
    candidate.unshift(entry);
    if (candidate.length > MAX_EVENT_LOG) {
      candidate.pop();
    }
    this.log = candidate;
    const current: number = this.counters.get(type) ?? 0;
    this.counters.set(type, current + 1);
    this.lastType = type;
    this.lastCode = code;
    this.lastMessage = message;
    return {
      type: type,
      kind: CallbackKind.API_ERROR,
      code: code,
      message: message,
      seq: this.seq
    };
  }

  public publishBegin(code: number, message: string): CallbackEvent {
    return this.publish(EVENT_BEGIN, code, message);
  }

  public publishInterrupted(code: number, message: string): CallbackEvent {
    return this.publish(EVENT_INTERRUPTED, code, message);
  }

  public publishEnd(message: string): CallbackEvent {
    return this.publish(EVENT_END, CODE_OK, message);
  }

  public publishApiError(code: number, message: string): CallbackEvent {
    return this.publish(EVENT_API_ERROR, code, message);
  }

  public getSeq(): number {
    return this.seq;
  }

  public getLog(): string[] {
    return this.log.slice();
  }

  public logSize(): number {
    return this.log.length;
  }

  public countOf(type: string): number {
    return this.counters.get(type) ?? 0;
  }

  public getLastType(): string {
    return this.lastType;
  }

  public getLastCode(): number {
    return this.lastCode;
  }

  public getLastMessage(): string {
    return this.lastMessage;
  }

  public reset(): void {
    this.log = [];
    this.seq = 0;
    this.counters = new Map<string, number>();
    this.lastType = '';
    this.lastCode = -1;
    this.lastMessage = '';
  }

  public summary(): string {
    return `EventSink{seq=${this.seq}, log=${this.log.length}}`;
  }
}

/**
 * Validates the ordering and the uniqueness of a callback event sequence.
 */
class CallbackContractValidator {
  private events: CallbackEvent[] = [];

  public record(event: CallbackEvent): void {
    this.events.push(event);
  }

  public reset(): void {
    this.events = [];
  }

  public size(): number {
    return this.events.length;
  }

  public types(): string[] {
    const values: string[] = [];
    for (let i = 0; i < this.events.length; i++) {
      values.push(this.events[i].type);
    }
    return values;
  }

  public countOf(type: string): number {
    let count: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].type === type) {
        count++;
      }
    }
    return count;
  }

  public indexOfType(type: string): number {
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].type === type) {
        return i;
      }
    }
    return -1;
  }

  /**
   * Checks that the sequence contains exactly one begin event.
   *
   * @returns true when exactly one onBegin is present.
   */
  public hasSingleBegin(): boolean {
    return this.countOf(EVENT_BEGIN) === 1;
  }

  /**
   * Checks that at most one terminal event is present.
   *
   * @returns the number of terminal events.
   */
  public terminalCount(): number {
    return this.countOf(EVENT_INTERRUPTED) + this.countOf(EVENT_END);
  }

  /**
   * Checks that onBegin precedes the first terminal event.
   *
   * @returns true when the ordering holds or when no terminal event is present.
   */
  public beginPrecedesTerminal(): boolean {
    const beginIndex: number = this.indexOfType(EVENT_BEGIN);
    const interruptedIndex: number = this.indexOfType(EVENT_INTERRUPTED);
    const endIndex: number = this.indexOfType(EVENT_END);
    if (beginIndex < 0) {
      return false;
    }
    if (interruptedIndex >= 0 && interruptedIndex < beginIndex) {
      return false;
    }
    if (endIndex >= 0 && endIndex < beginIndex) {
      return false;
    }
    return true;
  }

  /**
   * Checks that the sequence numbers are strictly increasing.
   *
   * @returns true when every sequence number is greater than its predecessor.
   */
  public seqIsMonotonic(): boolean {
    for (let i = 1; i < this.events.length; i++) {
      if (this.events[i].seq <= this.events[i - 1].seq) {
        return false;
      }
    }
    return true;
  }

  /**
   * Collects every violation of the callback contract.
   *
   * @returns the violations, an empty array when the sequence is valid.
   */
  public issues(): string[] {
    const values: string[] = [];
    if (this.countOf(EVENT_BEGIN) !== 1) {
      values.push(`expected one onBegin, found ${this.countOf(EVENT_BEGIN)}`);
    }
    if (this.terminalCount() > 1) {
      values.push(`expected at most one terminal event, found ${this.terminalCount()}`);
    }
    if (!this.beginPrecedesTerminal()) {
      values.push('onBegin does not precede the terminal event');
    }
    if (!this.seqIsMonotonic()) {
      values.push('the sequence numbers are not monotonic');
    }
    return values;
  }

  public describe(): string {
    return `CallbackContractValidator{events=${this.events.length}, terminals=${this.terminalCount()}}`;
  }
}

/**
 * Recorder that reproduces the IAssessmentCallback of the sample.
 *
 * The sample implements the callback with three methods: onBegin receives the error object,
 * onInterrupted receives the interrupt object and onEnd receives no argument at all. The
 * recorder keeps that shape and stores every call into the event sink.
 */
class CallbackRecorder {
  private sink: EventSink;
  private beginCalls: number = 0;
  private interruptedCalls: number = 0;
  private endCalls: number = 0;
  private lastInterrupt: InterruptPayload | undefined = undefined;

  constructor(sink: EventSink) {
    this.sink = sink;
  }

  public onBegin(payload: BeginPayload): void {
    this.beginCalls++;
    const message: string = payload.message;
    const code: number = payload.code;
    this.sink.publishBegin(code, message);
  }

  public onInterrupted(payload: InterruptPayload): void {
    this.interruptedCalls++;
    this.lastInterrupt = {
      code: payload.code,
      message: payload.message
    };
    this.sink.publishInterrupted(payload.code, payload.message);
  }

  public onEnd(): void {
    this.endCalls++;
    this.sink.publishEnd('');
  }

  public getBeginCalls(): number {
    return this.beginCalls;
  }

  /**
   * Clears the call counters so a case observes only its own callbacks.
   * The event sink has its own reset; the recorder must be reset in step.
   */
  public reset(): void {
    this.beginCalls = 0;
    this.interruptedCalls = 0;
    this.endCalls = 0;
    this.lastInterrupt = undefined;
  }

  public getInterruptedCalls(): number {
    return this.interruptedCalls;
  }

  public getEndCalls(): number {
    return this.endCalls;
  }

  public getLastInterrupt(): InterruptPayload | undefined {
    return this.lastInterrupt;
  }

  public totalCalls(): number {
    return this.beginCalls + this.interruptedCalls + this.endCalls;
  }

  public toString(): string {
    return `CallbackRecorder{begin=${this.beginCalls}, interrupted=${this.interruptedCalls}, ` +
      `end=${this.endCalls}}`;
  }
}

/**
 * Checks whether an error code belongs to the documented AssessmentErrorCode values.
 *
 * @param code code reported by the assessment service.
 * @returns true for OK, USER_CANCEL, TIMEOUT, SYSTEM_ERROR and ENV_ANOMALY.
 */
function isDocumentedErrorCode(code: number): boolean {
  return code === CODE_OK || code === CODE_USER_CANCEL || code === CODE_TIMEOUT ||
    code === CODE_SYSTEM_ERROR || code === CODE_ENV_ANOMALY;
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
 * Reports whether the running image declares the assessment capability.
 *
 * @returns true when the SysCap is present.
 */
function isAssessmentSupported(): boolean {
  const supported: boolean = canIUse(SYSCAP_ASSESSMENT);
  if (!supported) {
    hilog.warn(DOMAIN, TAG, '%{public}s is absent on this image', SYSCAP_ASSESSMENT);
  }
  return supported;
}

export default function callbackEventValidationTest() {
  describe('CallbackEventValidation_Test', () => {
    let driver: Driver;
    let mapper: EventTypeMapper;
    let sink: EventSink;
    let validator: CallbackContractValidator;
    let recorder: CallbackRecorder;

    beforeAll(async () => {
      driver = getDriver();
      mapper = new EventTypeMapper();
      sink = new EventSink();
      validator = new CallbackContractValidator();
      recorder = new CallbackRecorder(sink);
      await serializedDelay(driver, 500);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: map the four event type strings of the sample.
     * Expectation: the mapper knows all four strings and maps them onto the callback kinds.
     */
    it('Assessment_EventTypeMapping_001', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventTypeMapping_001, begin');
      expect(mapper.size()).assertEqual(4);
      expect(mapper.isKnown(EVENT_BEGIN)).assertTrue();
      expect(mapper.isKnown(EVENT_INTERRUPTED)).assertTrue();
      expect(mapper.isKnown(EVENT_END)).assertTrue();
      expect(mapper.isKnown(EVENT_API_ERROR)).assertTrue();
      expect(mapper.kindOf(EVENT_BEGIN)).assertEqual(CallbackKind.BEGIN);
      expect(mapper.kindOf(EVENT_INTERRUPTED)).assertEqual(CallbackKind.INTERRUPTED);
      expect(mapper.kindOf(EVENT_END)).assertEqual(CallbackKind.END);
      expect(mapper.kindOf(EVENT_API_ERROR)).assertEqual(CallbackKind.API_ERROR);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventTypeMapping_001, end');
    });

    /**
     * Scenario: map the callback kinds back onto the event type strings.
     * Expectation: the reverse mapping restores the exact string constants.
     */
    it('Assessment_EventTypeReverseMapping_002', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventTypeReverseMapping_002, begin');
      expect(mapper.typeOf(CallbackKind.BEGIN)).assertEqual('onBegin');
      expect(mapper.typeOf(CallbackKind.INTERRUPTED)).assertEqual('onInterrupted');
      expect(mapper.typeOf(CallbackKind.END)).assertEqual('onEnd');
      expect(mapper.typeOf(CallbackKind.API_ERROR)).assertEqual('onApiError');
      expect(mapper.knownTypes().length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventTypeReverseMapping_002, end');
    });

    /**
     * Scenario: map an unknown event type string.
     * Expectation: the mapper reports the type as unknown instead of inventing a callback,
     * and the terminal query stays false.
     */
    it('Assessment_EventTypeUnknown_003', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventTypeUnknown_003, begin');
      expect(mapper.isKnown('onResume')).assertFalse();
      expect(mapper.isKnown('')).assertFalse();
      expect(mapper.kindOf('onResume')).assertEqual(CallbackKind.API_ERROR);
      expect(mapper.isTerminal('onResume')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventTypeUnknown_003, end');
    });

    /**
     * Scenario: classify the terminal events.
     * Expectation: onInterrupted and onEnd are terminal, onBegin and onApiError are not.
     */
    it('Assessment_EventTypeTerminal_004', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventTypeTerminal_004, begin');
      expect(mapper.isTerminal(EVENT_INTERRUPTED)).assertTrue();
      expect(mapper.isTerminal(EVENT_END)).assertTrue();
      expect(mapper.isTerminal(EVENT_BEGIN)).assertFalse();
      expect(mapper.isTerminal(EVENT_API_ERROR)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventTypeTerminal_004, end');
    });

    /**
     * Scenario: a successful begin publishes a single onBegin event.
     * Expectation: the sink records one begin entry, the sequence starts at one and the log
     * carries the formatted entry of the controller.
     */
    it('Assessment_BeginEventSingle_005', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginEventSingle_005, begin');
      sink.reset();
      recorder.reset();
      recorder.onBegin({ code: CODE_OK, message: '' });
      expect(recorder.getBeginCalls()).assertEqual(1);
      expect(sink.getSeq()).assertEqual(1);
      expect(sink.countOf(EVENT_BEGIN)).assertEqual(1);
      expect(sink.getLog()[0]).assertEqual(formatLogEntry(EVENT_BEGIN, CODE_OK, ''));
      expect(sink.getLastType()).assertEqual(EVENT_BEGIN);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginEventSingle_005, end');
    });

    /**
     * Scenario: a begin that the user cancels in the confirmation dialog.
     * Expectation: onBegin still fires exactly once and carries the cancel code together
     * with the message of the service.
     */
    it('Assessment_BeginEventCancel_006', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginEventCancel_006, begin');
      sink.reset();
      recorder.reset();
      recorder.onBegin({ code: CODE_USER_CANCEL, message: 'the user canceled' });
      expect(recorder.getBeginCalls()).assertEqual(1);
      expect(sink.getLastCode()).assertEqual(CODE_USER_CANCEL);
      expect(sink.getLastMessage()).assertEqual('the user canceled');
      expect(isDocumentedErrorCode(sink.getLastCode())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginEventCancel_006, end');
    });

    /**
     * Scenario: onInterrupted carries the interrupt object.
     * Expectation: the recorder stores the code and the message of the interrupt, the sink
     * publishes a single onInterrupted entry.
     */
    it('Assessment_InterruptedPayload_007', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptedPayload_007, begin');
      sink.reset();
      recorder.reset();
      recorder.onInterrupted({ code: CODE_TIMEOUT, message: 'the duration expired' });
      expect(recorder.getInterruptedCalls()).assertEqual(1);
      const payload: InterruptPayload | undefined = recorder.getLastInterrupt();
      expect(payload !== undefined).assertTrue();
      if (payload !== undefined) {
        expect(payload.code).assertEqual(CODE_TIMEOUT);
        expect(payload.message).assertEqual('the duration expired');
      }
      expect(sink.countOf(EVENT_INTERRUPTED)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptedPayload_007, end');
    });

    /**
     * Scenario: onEnd is called without an argument.
     * Expectation: the recorder counts the call, the sink publishes the end code OK and an
     * empty message, exactly like the controller does.
     */
    it('Assessment_EndWithoutArgument_008', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndWithoutArgument_008, begin');
      sink.reset();
      recorder.reset();
      recorder.onEnd();
      expect(recorder.getEndCalls()).assertEqual(1);
      expect(sink.countOf(EVENT_END)).assertEqual(1);
      expect(sink.getLastCode()).assertEqual(CODE_OK);
      expect(sink.getLastMessage()).assertEqual('');
      expect(sink.getLog()[0]).assertEqual(formatLogEntry(EVENT_END, CODE_OK, ''));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndWithoutArgument_008, end');
    });

    /**
     * Scenario: a full begin then end sequence.
     * Expectation: onBegin precedes onEnd, the sequence holds exactly one begin and one
     * terminal event and the validator reports no issue.
     */
    it('Assessment_BeginThenEndOrdering_009', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginThenEndOrdering_009, begin');
      sink.reset();
      recorder.reset();
      validator.reset();
      validator.record(sink.publishBegin(CODE_OK, ''));
      validator.record(sink.publishEnd(''));
      expect(validator.size()).assertEqual(2);
      expect(validator.types()[0]).assertEqual(EVENT_BEGIN);
      expect(validator.types()[1]).assertEqual(EVENT_END);
      expect(validator.hasSingleBegin()).assertTrue();
      expect(validator.terminalCount()).assertEqual(1);
      expect(validator.beginPrecedesTerminal()).assertTrue();
      expect(validator.seqIsMonotonic()).assertTrue();
      const issues: string[] = validator.issues();
      expect(issues.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', validator.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginThenEndOrdering_009, end');
    });

    /**
     * Scenario: a begin followed by an interruption.
     * Expectation: onInterrupted is the terminal event, the ordering holds and the issue list
     * stays empty.
     */
    it('Assessment_BeginThenInterruptedOrdering_010', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginThenInterruptedOrdering_010, begin');
      sink.reset();
      recorder.reset();
      validator.reset();
      validator.record(sink.publishBegin(CODE_OK, ''));
      validator.record(sink.publishInterrupted(CODE_ENV_ANOMALY, 'environment changed'));
      expect(validator.terminalCount()).assertEqual(1);
      expect(validator.indexOfType(EVENT_INTERRUPTED)).assertEqual(1);
      expect(validator.beginPrecedesTerminal()).assertTrue();
      expect(validator.issues().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginThenInterruptedOrdering_010, end');
    });

    /**
     * Scenario: an interruption is reported before the begin.
     * Expectation: the validator flags the inverted order because the pages rely on onBegin
     * to decide whether the exam page is pushed.
     */
    it('Assessment_InterruptBeforeBegin_011', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptBeforeBegin_011, begin');
      validator.reset();
      validator.record({
        type: EVENT_INTERRUPTED,
        kind: CallbackKind.INTERRUPTED,
        code: CODE_SYSTEM_ERROR,
        message: 'system error',
        seq: 1
      });
      validator.record({
        type: EVENT_BEGIN,
        kind: CallbackKind.BEGIN,
        code: CODE_OK,
        message: '',
        seq: 2
      });
      expect(validator.beginPrecedesTerminal()).assertFalse();
      const issues: string[] = validator.issues();
      expect(issues.length >= 1).assertTrue();
      let orderingIssue: boolean = false;
      for (let i = 0; i < issues.length; i++) {
        if (issues[i].indexOf('precede') >= 0) {
          orderingIssue = true;
        }
      }
      expect(orderingIssue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptBeforeBegin_011, end');
    });

    /**
     * Scenario: two begin events are delivered for one begin call.
     * Expectation: the validator reports the duplicated begin and the terminal counter is
     * unaffected.
     */
    it('Assessment_DuplicateBegin_012', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DuplicateBegin_012, begin');
      validator.reset();
      validator.record({
        type: EVENT_BEGIN,
        kind: CallbackKind.BEGIN,
        code: CODE_OK,
        message: '',
        seq: 1
      });
      validator.record({
        type: EVENT_BEGIN,
        kind: CallbackKind.BEGIN,
        code: CODE_OK,
        message: '',
        seq: 2
      });
      expect(validator.countOf(EVENT_BEGIN)).assertEqual(2);
      expect(validator.hasSingleBegin()).assertFalse();
      const issues: string[] = validator.issues();
      expect(issues.length >= 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DuplicateBegin_012, end');
    });

    /**
     * Scenario: both onInterrupted and onEnd are delivered for one session.
     * Expectation: the validator reports two terminal events and the second one is a defect
     * of the service, not an expected sequence.
     */
    it('Assessment_DuplicateTerminal_013', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DuplicateTerminal_013, begin');
      validator.reset();
      validator.record({
        type: EVENT_BEGIN,
        kind: CallbackKind.BEGIN,
        code: CODE_OK,
        message: '',
        seq: 1
      });
      validator.record({
        type: EVENT_INTERRUPTED,
        kind: CallbackKind.INTERRUPTED,
        code: CODE_TIMEOUT,
        message: 'timeout',
        seq: 2
      });
      validator.record({
        type: EVENT_END,
        kind: CallbackKind.END,
        code: CODE_OK,
        message: '',
        seq: 3
      });
      expect(validator.terminalCount()).assertEqual(2);
      const issues: string[] = validator.issues();
      let terminalIssue: boolean = false;
      for (let i = 0; i < issues.length; i++) {
        if (issues[i].indexOf('terminal') >= 0) {
          terminalIssue = true;
        }
      }
      expect(terminalIssue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DuplicateTerminal_013, end');
    });

    /**
     * Scenario: the sequence numbers of a long event stream.
     * Expectation: the numbers increase strictly, so the pages can use them as a change
     * trigger of the watch decorator.
     */
    it('Assessment_SequenceMonotonic_014', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SequenceMonotonic_014, begin');
      sink.reset();
      recorder.reset();
      validator.reset();
      const rounds: number = 10;
      for (let i = 0; i < rounds; i++) {
        validator.record(sink.publishApiError(CODE_SYSTEM_ERROR, `failure ${i}`));
      }
      expect(validator.size()).assertEqual(rounds);
      expect(sink.getSeq()).assertEqual(rounds);
      expect(validator.seqIsMonotonic()).assertTrue();
      expect(validator.seqIsMonotonic()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SequenceMonotonic_014, end');
    });

    /**
     * Scenario: an out of order sequence is recorded.
     * Expectation: the validator detects the decreasing sequence number.
     */
    it('Assessment_SequenceBroken_015', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SequenceBroken_015, begin');
      validator.reset();
      validator.record({
        type: EVENT_BEGIN,
        kind: CallbackKind.BEGIN,
        code: CODE_OK,
        message: '',
        seq: 5
      });
      validator.record({
        type: EVENT_END,
        kind: CallbackKind.END,
        code: CODE_OK,
        message: '',
        seq: 4
      });
      expect(validator.seqIsMonotonic()).assertFalse();
      const issues: string[] = validator.issues();
      let sequenceIssue: boolean = false;
      for (let i = 0; i < issues.length; i++) {
        if (issues[i].indexOf('monotonic') >= 0) {
          sequenceIssue = true;
        }
      }
      expect(sequenceIssue).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SequenceBroken_015, end');
    });

    /**
     * Scenario: publish more events than the log can hold.
     * Expectation: the log stops at twenty entries, the newest entry is the first one and the
     * sequence number keeps growing.
     */
    it('Assessment_LogCapAtTwenty_016', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LogCapAtTwenty_016, begin');
      sink.reset();
      recorder.reset();
      const rounds: number = MAX_EVENT_LOG + 5;
      for (let i = 0; i < rounds; i++) {
        sink.publishApiError(CODE_SYSTEM_ERROR, `failure ${i}`);
      }
      expect(sink.logSize()).assertEqual(MAX_EVENT_LOG);
      expect(sink.getSeq()).assertEqual(rounds);
      expect(sink.getLog()[0]).assertContain(`failure ${rounds - 1}`);
      expect(sink.getLog()[0]).assertContain(EVENT_API_ERROR);
      hilog.info(DOMAIN, TAG, '%{public}s log %{public}d of %{public}d events',
        BUNDLE + 'LogCapAtTwenty_016', sink.logSize(), rounds);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LogCapAtTwenty_016, end');
    });

    /**
     * Scenario: the log keeps the newest event on top.
     * Expectation: every new entry is prepended, so the status card shows the latest event
     * first without scrolling.
     */
    it('Assessment_LogPrependOrder_017', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LogPrependOrder_017, begin');
      sink.reset();
      recorder.reset();
      sink.publishBegin(CODE_OK, 'first');
      sink.publishInterrupted(CODE_TIMEOUT, 'second');
      sink.publishEnd('third');
      const log: string[] = sink.getLog();
      expect(log.length).assertEqual(3);
      expect(log[0]).assertContain('third');
      expect(log[1]).assertContain('second');
      expect(log[2]).assertContain('first');
      expect(log[0].indexOf(EVENT_END)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LogPrependOrder_017, end');
    });

    /**
     * Scenario: count the events per type.
     * Expectation: the sink reports one counter per published type and zero for an unseen
     * type.
     */
    it('Assessment_EventCounters_018', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventCounters_018, begin');
      sink.reset();
      recorder.reset();
      sink.publishBegin(CODE_OK, '');
      sink.publishInterrupted(CODE_USER_CANCEL, 'cancel');
      sink.publishApiError(CODE_SYSTEM_ERROR, 'oops');
      expect(sink.countOf(EVENT_BEGIN)).assertEqual(1);
      expect(sink.countOf(EVENT_INTERRUPTED)).assertEqual(1);
      expect(sink.countOf(EVENT_API_ERROR)).assertEqual(1);
      expect(sink.countOf(EVENT_END)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', sink.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EventCounters_018, end');
    });

    /**
     * Scenario: recalculate the log entry text of the controller.
     * Expectation: the format is the exact one that the status card renders.
     */
    it('Assessment_LogEntryFormat_019', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LogEntryFormat_019, begin');
      expect(formatLogEntry(EVENT_BEGIN, 0, '')).assertEqual('onBegin code=0 message=');
      expect(formatLogEntry(EVENT_INTERRUPTED, 2, 'expired')).assertEqual('onInterrupted code=2 message=expired');
      expect(formatLogEntry(EVENT_END, 0, '')).assertEqual('onEnd code=0 message=');
      expect(formatLogEntry(EVENT_API_ERROR, 201, 'denied')).assertEqual('onApiError code=201 message=denied');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LogEntryFormat_019, end');
    });

    /**
     * Scenario: classify the documented AssessmentErrorCode values.
     * Expectation: the five enum values are documented, an arbitrary code is not.
     */
    it('Assessment_ErrorCodeDomain_020', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorCodeDomain_020, begin');
      expect(isDocumentedErrorCode(CODE_OK)).assertTrue();
      expect(isDocumentedErrorCode(CODE_USER_CANCEL)).assertTrue();
      expect(isDocumentedErrorCode(CODE_TIMEOUT)).assertTrue();
      expect(isDocumentedErrorCode(CODE_SYSTEM_ERROR)).assertTrue();
      expect(isDocumentedErrorCode(CODE_ENV_ANOMALY)).assertTrue();
      expect(isDocumentedErrorCode(5)).assertFalse();
      expect(isDocumentedErrorCode(201)).assertFalse();
      expect(isDocumentedErrorCode(-1)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorCodeDomain_020, end');
    });

    /**
     * Scenario: the recorder counts every callback independently.
     * Expectation: the total call counter is the sum of the three callback counters.
     */
    it('Assessment_RecorderTotals_022', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RecorderTotals_022, begin');
      sink.reset();
      recorder.reset();
      const localRecorder: CallbackRecorder = new CallbackRecorder(sink);
      expect(localRecorder.totalCalls()).assertEqual(0);
      localRecorder.onBegin({ code: CODE_OK, message: '' });
      localRecorder.onInterrupted({ code: CODE_TIMEOUT, message: 'timeout' });
      localRecorder.onEnd();
      expect(localRecorder.totalCalls()).assertEqual(3);
      expect(localRecorder.getLastInterrupt() !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'RecorderTotals_022, end');
    });

    /**
     * Scenario: reset the event sink between two sessions.
     * Expectation: the sequence, the counters and the log are dropped, so a new session
     * starts from the same state as a fresh launch of the sample.
     */
    it('Assessment_SinkReset_026', 0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SinkReset_026, begin');
      sink.reset();
      recorder.reset();
      sink.publishBegin(CODE_OK, '');
      sink.publishEnd('');
      expect(sink.getSeq()).assertEqual(2);
      expect(sink.logSize()).assertEqual(2);
      sink.reset();
      recorder.reset();
      expect(sink.getSeq()).assertEqual(0);
      expect(sink.logSize()).assertEqual(0);
      expect(sink.countOf(EVENT_BEGIN)).assertEqual(0);
      expect(sink.getLastType()).assertEqual('');
      expect(sink.getLastCode()).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SinkReset_026, end');
    });
  });
}
