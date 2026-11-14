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
  ID_BUNDLE_INPUT,
  ID_ADD_BUTTON,
  ID_BEGIN_BUTTON,
  ID_END_BUTTON,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  ID_EXAM_TITLE,
  TEXT_STATE_INACTIVE,
  TEXT_NO_ACTIVE_ASSESSMENT,
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

// Assessment error codes, the sample compares the callback code with these values.
const CODE_OK: number = 0;
const CODE_USER_CANCEL: number = 1;
const CODE_TIMEOUT: number = 2;
const CODE_SYSTEM_ERROR: number = 3;
const CODE_ENV_ANOMALY: number = 4;

// Event types of the event log.
const EVENT_BEGIN: string = 'onBegin';
const EVENT_API_ERROR: string = 'onApiError';

// Business error codes. The sample never inspects the numeric value, it forwards the code and
// the message of the thrown BusinessError to the event log unchanged.
const BIZ_CODE_INVALID_PARAM: number = 401;
const BIZ_CODE_NOT_SYSTEM_APP: number = 202;
const BIZ_CODE_SERVICE_UNAVAILABLE: number = 24900001;
const BIZ_CODE_ABILITY_NOT_FOUND: number = 16000001;

// The platform reports service failures in a six digit band, the caller side failures stay below
// it. The normaliser uses the boundary to classify a code obtained from a thrown error.
const SERVICE_BAND_START: number = 16000000;

// Hardening phases of the exam page. Each phase is guarded separately so that one failure does
// not block the next phase.
const HARDEN_WINDOW_LAYOUT: string = 'setWindowLayoutFullScreen';
const HARDEN_PRIVACY_MODE: string = 'setWindowPrivacyMode';
const HARDEN_SIMPLE_KEYBOARD: string = 'setSimpleKeyboardEnabled';
const HARDEN_CLEAR_PASTEBOARD: string = 'clearData';

const HARDEN_PHASE_COUNT: number = 4;

/**
 * The kind of failure that a guarded call can produce.
 */
enum FailureKind {
  THROWN_BUSINESS_ERROR = 'thrown_business_error',
  UNDEFINED_CONTEXT = 'undefined_context',
  NONE = 'none'
}

/**
 * The shape the controller expects from an error object. ArkTS has no structural typing for
 * thrown values, so the model normalises everything into this class before it is published.
 */
class ErrorShape {
  public code: number;
  public message: string;

  public constructor(code: number, message: string) {
    this.code = code;
    this.message = message;
  }

  public isOk(): boolean {
    return this.code === CODE_OK;
  }

  public hasMessage(): boolean {
    return this.message.length > 0;
  }

  /**
   * Renders the shape the way the event log stores it.
   *
   * @returns the rendered text.
   */
  public render(): string {
    return `code=${this.code} message=${this.message}`;
  }

  public equals(other: ErrorShape): boolean {
    return this.code === other.code && this.message === other.message;
  }
}

/**
 * One guarded API call and what happened around it.
 */
interface GuardedCall {
  operation: string;
  failure: FailureKind;
  caught: boolean;
  published: boolean;
  code: number;
  message: string;
}

/**
 * The result of a call that the sample wraps in try/catch.
 */
interface GuardOutcome {
  success: boolean;
  value: boolean;
  shape: ErrorShape | null;
  operation: string;
}

/**
 * The result of one hardening phase.
 */
interface HardeningPhaseResult {
  phase: string;
  success: boolean;
  errorCode: number;
  errorMessage: string;
}

/**
 * One entry of the published event log.
 */
interface PublishedEvent {
  seq: number;
  type: string;
  code: number;
  message: string;
}

/**
 * Normalises any thrown value into the BusinessError shape the sample uses.
 *
 * The controller casts the caught value to BusinessError and reads code and message from it. A
 * thrown plain Error has no code, so the model assigns the service unavailable code, which is
 * the code the platform reports for a broken service.
 */
class ErrorNormalizer {
  private static readonly DEFAULT_CODE: number = BIZ_CODE_SERVICE_UNAVAILABLE;
  private static readonly DEFAULT_MESSAGE: string = 'unknown failure';

  /**
   * Normalises an error shape that was already extracted.
   *
   * @param shape candidate shape, may be null when nothing was thrown.
   * @param fallbackMessage message used when the shape carries no message.
   * @returns the normalised shape.
   */
  public normalize(shape: ErrorShape | null, fallbackMessage: string): ErrorShape {
    if (shape === null) {
      return new ErrorShape(CODE_OK, fallbackMessage);
    }
    const message: string = shape.message.length > 0 ? shape.message : fallbackMessage;
    const code: number = shape.code >= 0 ? shape.code : ErrorNormalizer.DEFAULT_CODE;
    return new ErrorShape(code, message);
  }

  /**
   * Normalises a failure that carried no code at all.
   *
   * @returns the default shape of an unknown failure.
   */
  public unknown(): ErrorShape {
    return new ErrorShape(ErrorNormalizer.DEFAULT_CODE, ErrorNormalizer.DEFAULT_MESSAGE);
  }

  /**
   * Reports whether a code belongs to the caller side band of the platform.
   *
   * The caller side band holds the parameter, permission and ability codes, it ends below the
   * six digit range that the services use for their own failures.
   *
   * @param code business error code.
   * @returns true for a code below the service band.
   */
  public isClientError(code: number): boolean {
    return code > 0 && code < SERVICE_BAND_START;
  }

  /**
   * Reports whether a code belongs to the service side band of the platform.
   *
   * @param code business error code.
   * @returns true for codes inside the service band.
   */
  public isServiceError(code: number): boolean {
    return code >= SERVICE_BAND_START;
  }

  public defaultCode(): number {
    return ErrorNormalizer.DEFAULT_CODE;
  }

  public defaultMessage(): string {
    return ErrorNormalizer.DEFAULT_MESSAGE;
  }
}

/**
 * Records every guarded call of the suite.
 *
 * The recorder is the model of the try/catch scaffolding of the controller: a call is either
 * successful, or it threw and the catch block published an onApiError event.
 */
class GuardedCallRecorder {
  private calls: GuardedCall[] = [];

  /**
   * Records a successful call.
   *
   * @param operation name of the operation.
   * @returns the recorded call.
   */
  public recordSuccess(operation: string): GuardedCall {
    const call: GuardedCall = {
      operation: operation,
      failure: FailureKind.NONE,
      caught: false,
      published: false,
      code: CODE_OK,
      message: ''
    };
    this.calls.push(call);
    return call;
  }

  /**
   * Records a call that threw and was caught.
   *
   * @param operation name of the operation.
   * @param failure kind of the failure.
   * @param shape normalised error shape.
   * @returns the recorded call.
   */
  public recordThrown(operation: string, failure: FailureKind, shape: ErrorShape): GuardedCall {
    const call: GuardedCall = {
      operation: operation,
      failure: failure,
      caught: true,
      published: true,
      code: shape.code,
      message: shape.message
    };
    this.calls.push(call);
    return call;
  }

  public size(): number {
    return this.calls.length;
  }

  public all(): GuardedCall[] {
    return this.calls.slice();
  }

  /**
   * Counts the calls of an operation.
   *
   * @param operation operation name.
   * @returns the number of matching calls.
   */
  public countOf(operation: string): number {
    let count: number = 0;
    for (let i = 0; i < this.calls.length; i++) {
      if (this.calls[i].operation === operation) {
        count++;
      }
    }
    return count;
  }

  /**
   * Counts the calls that were caught and published.
   *
   * @returns the number of published failures.
   */
  public publishedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.calls.length; i++) {
      if (this.calls[i].published) {
        count++;
      }
    }
    return count;
  }

  /**
   * Counts the calls that escaped the catch block.
   *
   * A call that was recorded as a failure but not as caught models an unhandled rejection, the
   * suite uses the count to prove that no such call exists.
   *
   * @returns the number of unhandled calls.
   */
  public unhandledCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.calls.length; i++) {
      const isFailure: boolean = this.calls[i].failure !== FailureKind.NONE;
      if (isFailure && !this.calls[i].caught) {
        count++;
      }
    }
    return count;
  }

  /**
   * Finds the last call of an operation.
   *
   * @param operation operation name.
   * @returns the call, or undefined when the operation was never recorded.
   */
  public lastOf(operation: string): GuardedCall | undefined {
    for (let i = this.calls.length - 1; i >= 0; i--) {
      if (this.calls[i].operation === operation) {
        return this.calls[i];
      }
    }
    return undefined;
  }

  public clear(): void {
    this.calls = [];
  }

  public summary(): string {
    return `GuardedCallRecorder{calls=${this.calls.length}, published=${this.publishedCount()}}`;
  }
}

/**
 * The try/catch facade of the assessment controller.
 *
 * The facade reproduces the four guarded controller methods. Every method answers a
 * GuardOutcome instead of throwing, which is exactly the contract the sample guarantees to the
 * pages: a page never has to guard an assessment call itself.
 */
class AssessmentFacade {
  private recorder: GuardedCallRecorder;
  private normalizer: ErrorNormalizer;
  private events: PublishedEvent[] = [];
  private seq: number = 0;
  private active: boolean = false;

  public constructor(recorder: GuardedCallRecorder) {
    this.recorder = recorder;
    this.normalizer = new ErrorNormalizer();
  }

  /**
   * Models begin(context, config, callback).
   *
   * @param hasContext whether a UIAbilityContext was available.
   * @param thrown error shape when the SDK call threw, null when it returned.
   * @returns the guarded outcome.
   */
  public begin(hasContext: boolean, thrown: ErrorShape | null): GuardOutcome {
    if (!hasContext) {
      const shape: ErrorShape = new ErrorShape(BIZ_CODE_INVALID_PARAM, 'the ability context is undefined');
      this.recorder.recordThrown('begin', FailureKind.UNDEFINED_CONTEXT, shape);
      this.publish(EVENT_API_ERROR, shape);
      return this.outcome(false, false, shape, 'begin');
    }
    if (thrown !== null) {
      const shape: ErrorShape = this.normalizer.normalize(thrown, 'begin failed');
      this.recorder.recordThrown('begin', FailureKind.THROWN_BUSINESS_ERROR, shape);
      this.publish(EVENT_API_ERROR, shape);
      return this.outcome(false, false, shape, 'begin');
    }
    this.recorder.recordSuccess('begin');
    return this.outcome(true, true, null, 'begin');
  }

  /**
   * Models end(context).
   *
   * @param hasContext whether a UIAbilityContext was available.
   * @param thrown error shape when the SDK call threw, null when it returned.
   * @returns the guarded outcome.
   */
  public end(hasContext: boolean, thrown: ErrorShape | null): GuardOutcome {
    if (!hasContext) {
      const shape: ErrorShape = new ErrorShape(BIZ_CODE_INVALID_PARAM, 'the ability context is undefined');
      this.recorder.recordThrown('end', FailureKind.UNDEFINED_CONTEXT, shape);
      this.publish(EVENT_API_ERROR, shape);
      return this.outcome(false, false, shape, 'end');
    }
    if (thrown !== null) {
      const shape: ErrorShape = this.normalizer.normalize(thrown, 'end failed');
      this.recorder.recordThrown('end', FailureKind.THROWN_BUSINESS_ERROR, shape);
      this.publish(EVENT_API_ERROR, shape);
      return this.outcome(false, true, shape, 'end');
    }
    this.recorder.recordSuccess('end');
    this.active = false;
    return this.outcome(true, true, null, 'end');
  }

  /**
   * Models isActive().
   *
   * A failing query answers false, it never rethrows, so a page can render the inactive state
   * without an extra guard.
   *
   * @param thrown error shape when the SDK call threw, null when it returned.
   * @returns the guarded outcome.
   */
  public isActive(thrown: ErrorShape | null): GuardOutcome {
    if (thrown !== null) {
      const shape: ErrorShape = this.normalizer.normalize(thrown, 'isActive failed');
      this.recorder.recordThrown('isActive', FailureKind.THROWN_BUSINESS_ERROR, shape);
      this.publish(EVENT_API_ERROR, shape);
      return this.outcome(false, false, shape, 'isActive');
    }
    this.recorder.recordSuccess('isActive');
    return this.outcome(true, this.active, null, 'isActive');
  }

  /**
   * Models getConfiguration().
   *
   * @param thrown error shape when the SDK call threw, null when it returned.
   * @returns the guarded outcome, the value is true when a configuration was returned.
   */
  public getConfiguration(thrown: ErrorShape | null): GuardOutcome {
    if (thrown !== null) {
      const shape: ErrorShape = this.normalizer.normalize(thrown, 'getConfiguration failed');
      this.recorder.recordThrown('getConfiguration', FailureKind.THROWN_BUSINESS_ERROR, shape);
      this.publish(EVENT_API_ERROR, shape);
      return this.outcome(false, false, shape, 'getConfiguration');
    }
    this.recorder.recordSuccess('getConfiguration');
    return this.outcome(true, this.active, null, 'getConfiguration');
  }

  /**
   * Marks the modelled session as active, the callback path of the sample sets the flag.
   *
   * @param value new active value.
   */
  public setActive(value: boolean): void {
    this.active = value;
  }

  public isModelledActive(): boolean {
    return this.active;
  }

  public publishedEvents(): PublishedEvent[] {
    return this.events.slice();
  }

  public lastEvent(): PublishedEvent | undefined {
    if (this.events.length === 0) {
      return undefined;
    }
    return this.events[this.events.length - 1];
  }

  /**
   * Publishes a callback style event, it mirrors the controller publishEvent helper.
   *
   * @param type event type.
   * @param shape error shape of the event.
   */
  public publishCallback(type: string, shape: ErrorShape): PublishedEvent {
    return this.publish(type, shape);
  }

  private publish(type: string, shape: ErrorShape): PublishedEvent {
    this.seq = this.seq + 1;
    const event: PublishedEvent = {
      seq: this.seq,
      type: type,
      code: shape.code,
      message: shape.message
    };
    this.events.push(event);
    return event;
  }

  private outcome(success: boolean, value: boolean, shape: ErrorShape | null, operation: string): GuardOutcome {
    const result: GuardOutcome = {
      success: success,
      value: value,
      shape: shape,
      operation: operation
    };
    return result;
  }

  public reset(): void {
    this.events = [];
    this.seq = 0;
    this.active = false;
  }

  public summary(): string {
    return `AssessmentFacade{events=${this.events.length}, active=${this.active}}`;
  }
}

/**
 * Applies the hardening phases with per phase isolation.
 *
 * The util of the sample guards every measure separately, so a failing pasteboard clear does
 * not leave the window in the full screen layout and vice versa. The model reproduces that
 * contract and reports which phases made it through.
 */
class HardeningIsolationModel {
  private plan: string[] = [];

  public constructor() {
    this.plan.push(HARDEN_WINDOW_LAYOUT);
    this.plan.push(HARDEN_PRIVACY_MODE);
    this.plan.push(HARDEN_SIMPLE_KEYBOARD);
    this.plan.push(HARDEN_CLEAR_PASTEBOARD);
  }

  /**
   * Runs the hardening plan.
   *
   * @param failingPhase phase that throws, empty when every phase succeeds.
   * @param hasContext whether a context was available, a missing context skips the window phases.
   * @returns one result per phase, in plan order.
   */
  public apply(failingPhase: string, hasContext: boolean): HardeningPhaseResult[] {
    const results: HardeningPhaseResult[] = [];
    for (let i = 0; i < this.plan.length; i++) {
      const phase: string = this.plan[i];
      const needsContext: boolean = phase === HARDEN_WINDOW_LAYOUT || phase === HARDEN_PRIVACY_MODE;
      if (needsContext && !hasContext) {
        const skipped: HardeningPhaseResult = {
          phase: phase,
          success: false,
          errorCode: BIZ_CODE_INVALID_PARAM,
          errorMessage: 'the ability context is undefined'
        };
        results.push(skipped);
        continue;
      }
      if (phase === failingPhase) {
        const failed: HardeningPhaseResult = {
          phase: phase,
          success: false,
          errorCode: BIZ_CODE_SERVICE_UNAVAILABLE,
          errorMessage: phase + ' is not supported on this device'
        };
        results.push(failed);
        continue;
      }
      const ok: HardeningPhaseResult = {
        phase: phase,
        success: true,
        errorCode: CODE_OK,
        errorMessage: ''
      };
      results.push(ok);
    }
    return results;
  }

  /**
   * Counts the successful phases.
   *
   * @param results results of a run.
   * @returns the number of phases that succeeded.
   */
  public successCount(results: HardeningPhaseResult[]): number {
    let count: number = 0;
    for (let i = 0; i < results.length; i++) {
      if (results[i].success) {
        count++;
      }
    }
    return count;
  }

  /**
   * Collects the phases that failed.
   *
   * @param results results of a run.
   * @returns the names of the failed phases.
   */
  public failedPhases(results: HardeningPhaseResult[]): string[] {
    const failed: string[] = [];
    for (let i = 0; i < results.length; i++) {
      if (!results[i].success) {
        failed.push(results[i].phase);
      }
    }
    return failed;
  }

  /**
   * Reports whether a phase was attempted.
   *
   * @param results results of a run.
   * @param phase phase name.
   * @returns true when the phase appears in the results.
   */
  public contains(results: HardeningPhaseResult[], phase: string): boolean {
    for (let i = 0; i < results.length; i++) {
      if (results[i].phase === phase) {
        return true;
      }
    }
    return false;
  }

  public planOf(): string[] {
    return this.plan.slice();
  }

  public planSize(): number {
    return this.plan.length;
  }
}

/**
 * Wraps asynchronous work so that a rejection is always observed.
 *
 * The controller never leaves a promise chain unobserved: the hardening helper attaches a catch
 * handler right after the call. The model counts the observed rejections so that a case can
 * assert that no rejection escapes.
 */
class RejectionGuard {
  private observed: number = 0;
  private escaped: number = 0;
  private logged: string[] = [];

  /**
   * Runs a modelled operation.
   *
   * @param operation name of the operation.
   * @param rejects whether the operation rejects.
   * @param handlerAttached whether the caller attached a catch handler.
   * @returns true when the rejection was observed.
   */
  public run(operation: string, rejects: boolean, handlerAttached: boolean): boolean {
    if (!rejects) {
      return false;
    }
    if (handlerAttached) {
      this.observed++;
      this.logged.push(operation);
      return true;
    }
    this.escaped++;
    return false;
  }

  public observedCount(): number {
    return this.observed;
  }

  public escapedCount(): number {
    return this.escaped;
  }

  public loggedOperations(): string[] {
    return this.logged.slice();
  }

  public reset(): void {
    this.observed = 0;
    this.escaped = 0;
    this.logged = [];
  }

  public summary(): string {
    return `RejectionGuard{observed=${this.observed}, escaped=${this.escaped}}`;
  }
}

/**
 * Collects the BusinessError shapes the suite verifies.
 */
class ErrorCatalog {
  private shapes: ErrorShape[] = [];

  public constructor() {
    this.shapes.push(new ErrorShape(BIZ_CODE_INVALID_PARAM, 'Parameter error'));
    this.shapes.push(new ErrorShape(BIZ_CODE_NOT_SYSTEM_APP, 'Permission denied'));
    this.shapes.push(new ErrorShape(BIZ_CODE_SERVICE_UNAVAILABLE, 'The service is unavailable'));
    this.shapes.push(new ErrorShape(BIZ_CODE_ABILITY_NOT_FOUND, 'The ability does not exist'));
  }

  public all(): ErrorShape[] {
    return this.shapes.slice();
  }

  public size(): number {
    return this.shapes.length;
  }

  /**
   * Looks up the shape of a code.
   *
   * @param code business error code.
   * @returns the shape, or undefined when the code is not catalogued.
   */
  public find(code: number): ErrorShape | undefined {
    for (let i = 0; i < this.shapes.length; i++) {
      if (this.shapes[i].code === code) {
        return this.shapes[i];
      }
    }
    return undefined;
  }

  /**
   * Counts the shapes with a non empty message.
   *
   * @returns the number of shapes carrying a message.
   */
  public withMessageCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.shapes.length; i++) {
      if (this.shapes[i].hasMessage()) {
        count++;
      }
    }
    return count;
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
 * Returns the log friendly name of an operation outcome.
 *
 * @param outcome guarded outcome of a facade call.
 * @returns the name of the outcome.
 */
function outcomeName(outcome: GuardOutcome): string {
  if (outcome.success) {
    return 'success';
  }
  if (outcome.shape === null) {
    return 'failure-without-shape';
  }
  return 'failure';
}

export default function exceptionHandlingTest() {
  describe('ExceptionHandling_Test', () => {
    let driver: Driver;
    let recorder: GuardedCallRecorder;
    let facade: AssessmentFacade;
    let normalizer: ErrorNormalizer;
    let hardening: HardeningIsolationModel;
    let guard: RejectionGuard;
    let catalog: ErrorCatalog;

    beforeAll(async () => {
      driver = getDriver();
      recorder = new GuardedCallRecorder();
      facade = new AssessmentFacade(recorder);
      normalizer = new ErrorNormalizer();
      hardening = new HardeningIsolationModel();
      guard = new RejectionGuard();
      catalog = new ErrorCatalog();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: a BusinessError carrying a code and a message is normalised.
     * Expectation: both fields survive the normalisation unchanged.
     */
    it('Assessment_ExceptionHandling_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_001, begin');
      const input: ErrorShape = new ErrorShape(BIZ_CODE_SERVICE_UNAVAILABLE, 'The service is unavailable');
      const output: ErrorShape = normalizer.normalize(input, 'fallback');
      expect(output.code).assertEqual(BIZ_CODE_SERVICE_UNAVAILABLE);
      expect(output.message).assertEqual('The service is unavailable');
      expect(output.equals(input)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ExceptionHandling_001', output.render());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_001, end');
    });

    /**
     * Scenario: a BusinessError carries an empty message.
     * Expectation: the fallback message replaces it so that the log never renders an empty line.
     */
    it('Assessment_ExceptionHandling_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_002, begin');
      const input: ErrorShape = new ErrorShape(BIZ_CODE_NOT_SYSTEM_APP, '');
      const output: ErrorShape = normalizer.normalize(input, 'begin failed');
      expect(output.code).assertEqual(BIZ_CODE_NOT_SYSTEM_APP);
      expect(output.message).assertEqual('begin failed');
      expect(output.hasMessage()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_002, end');
    });

    /**
     * Scenario: a null shape is normalised.
     * Expectation: the result is the OK shape with the fallback message.
     */
    it('Assessment_ExceptionHandling_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_003, begin');
      const output: ErrorShape = normalizer.normalize(null, 'nothing was thrown');
      expect(output.code).assertEqual(CODE_OK);
      expect(output.message).assertEqual('nothing was thrown');
      expect(output.isOk()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_003, end');
    });

    /**
     * Scenario: a negative code is normalised.
     * Expectation: the code is replaced by the service unavailable code.
     */
    it('Assessment_ExceptionHandling_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_004, begin');
      const input: ErrorShape = new ErrorShape(-1, 'negative');
      const output: ErrorShape = normalizer.normalize(input, 'fallback');
      expect(output.code).assertEqual(normalizer.defaultCode());
      expect(output.code).assertEqual(BIZ_CODE_SERVICE_UNAVAILABLE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_004, end');
    });

    /**
     * Scenario: an unknown failure without any field is built.
     * Expectation: the default shape carries the service code and the default message.
     */
    it('Assessment_ExceptionHandling_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_005, begin');
      const shape: ErrorShape = normalizer.unknown();
      expect(shape.code).assertEqual(BIZ_CODE_SERVICE_UNAVAILABLE);
      expect(shape.message).assertEqual('unknown failure');
      expect(shape.message.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_005, end');
    });

    /**
     * Scenario: the code bands of the platform are classified.
     * Expectation: the client band and the service band are distinguished.
     */
    it('Assessment_ExceptionHandling_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_006, begin');
      expect(normalizer.isClientError(BIZ_CODE_INVALID_PARAM)).assertTrue();
      expect(normalizer.isClientError(BIZ_CODE_NOT_SYSTEM_APP)).assertTrue();
      expect(normalizer.isClientError(BIZ_CODE_SERVICE_UNAVAILABLE)).assertFalse();
      expect(normalizer.isServiceError(BIZ_CODE_SERVICE_UNAVAILABLE)).assertTrue();
      expect(normalizer.isServiceError(BIZ_CODE_INVALID_PARAM)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_006, end');
    });

    /**
     * Scenario: the error catalog is enumerated.
     * Expectation: four shapes are catalogued and every one of them carries a message.
     */
    it('Assessment_ExceptionHandling_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_007, begin');
      expect(catalog.size()).assertEqual(4);
      expect(catalog.withMessageCount()).assertEqual(4);
      expect(catalog.find(BIZ_CODE_INVALID_PARAM) !== undefined).assertTrue();
      expect(catalog.find(999) === undefined).assertTrue();
      const all: ErrorShape[] = catalog.all();
      for (let i = 0; i < all.length; i++) {
        expect(all[i].code > 0).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_007, end');
    });

    /**
     * Scenario: two shapes with the same fields are compared.
     * Expectation: the equality check answers true for identical pairs and false otherwise.
     */
    it('Assessment_ExceptionHandling_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_008, begin');
      const left: ErrorShape = new ErrorShape(BIZ_CODE_NOT_SYSTEM_APP, 'Permission denied');
      const right: ErrorShape = new ErrorShape(BIZ_CODE_NOT_SYSTEM_APP, 'Permission denied');
      const other: ErrorShape = new ErrorShape(BIZ_CODE_NOT_SYSTEM_APP, 'other');
      expect(left.equals(right)).assertTrue();
      expect(left.equals(other)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_008, end');
    });

    /**
     * Scenario: a guarded begin returns without throwing.
     * Expectation: the outcome is a success and no failure is recorded.
     */
    it('Assessment_ExceptionHandling_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_009, begin');
      recorder.clear();
      facade.reset();
      const outcome: GuardOutcome = facade.begin(true, null);
      expect(outcome.success).assertTrue();
      expect(outcome.shape === null).assertTrue();
      expect(outcome.operation).assertEqual('begin');
      expect(recorder.publishedCount()).assertEqual(0);
      expect(recorder.unhandledCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ExceptionHandling_009', outcomeName(outcome));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_009, end');
    });

    /**
     * Scenario: begin throws a BusinessError.
     * Expectation: the catch block publishes an onApiError event with the original code.
     */
    it('Assessment_ExceptionHandling_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_010, begin');
      recorder.clear();
      facade.reset();
      const outcome: GuardOutcome = facade.begin(true, new ErrorShape(BIZ_CODE_SERVICE_UNAVAILABLE, 'begin threw'));
      expect(outcome.success).assertFalse();
      expect(recorder.publishedCount()).assertEqual(1);
      const event: PublishedEvent | undefined = facade.lastEvent();
      expect(event !== undefined).assertTrue();
      if (event !== undefined) {
        expect(event.type).assertEqual(EVENT_API_ERROR);
        expect(event.code).assertEqual(BIZ_CODE_SERVICE_UNAVAILABLE);
        expect(event.message).assertEqual('begin threw');
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_010, end');
    });

    /**
     * Scenario: begin is called without an ability context.
     * Expectation: the facade reports the invalid parameter code instead of dereferencing null.
     */
    it('Assessment_ExceptionHandling_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_011, begin');
      recorder.clear();
      facade.reset();
      const outcome: GuardOutcome = facade.begin(false, null);
      expect(outcome.success).assertFalse();
      expect(outcome.shape !== null).assertTrue();
      if (outcome.shape !== null) {
        expect(outcome.shape.code).assertEqual(BIZ_CODE_INVALID_PARAM);
        expect(outcome.shape.message).assertEqual('the ability context is undefined');
      }
      const last: GuardedCall | undefined = recorder.lastOf('begin');
      expect(last !== undefined).assertTrue();
      if (last !== undefined) {
        expect(last.failure).assertEqual(FailureKind.UNDEFINED_CONTEXT);
        expect(last.caught).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_011, end');
    });

    /**
     * Scenario: end throws.
     * Expectation: the failure is published and the modelled session keeps its flag.
     */
    it('Assessment_ExceptionHandling_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_012, begin');
      recorder.clear();
      facade.reset();
      facade.setActive(true);
      const outcome: GuardOutcome = facade.end(true, new ErrorShape(BIZ_CODE_SERVICE_UNAVAILABLE, 'end threw'));
      expect(outcome.success).assertFalse();
      expect(facade.isModelledActive()).assertTrue();
      expect(facade.lastEvent()?.type).assertEqual(EVENT_API_ERROR);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_012, end');
    });

    /**
     * Scenario: end succeeds.
     * Expectation: the modelled session is deactivated and nothing is published.
     */
    it('Assessment_ExceptionHandling_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_013, begin');
      recorder.clear();
      facade.reset();
      facade.setActive(true);
      const outcome: GuardOutcome = facade.end(true, null);
      expect(outcome.success).assertTrue();
      expect(facade.isModelledActive()).assertFalse();
      expect(facade.publishedEvents().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_013, end');
    });

    /**
     * Scenario: end is called without a context.
     * Expectation: the invalid parameter code is published and the flag is untouched.
     */
    it('Assessment_ExceptionHandling_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_014, begin');
      recorder.clear();
      facade.reset();
      facade.setActive(true);
      const outcome: GuardOutcome = facade.end(false, null);
      expect(outcome.success).assertFalse();
      expect(facade.isModelledActive()).assertTrue();
      expect(facade.lastEvent()?.code).assertEqual(BIZ_CODE_INVALID_PARAM);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_014, end');
    });

    /**
     * Scenario: isActive throws.
     * Expectation: the query answers false rather than rethrowing, so a page can still render.
     */
    it('Assessment_ExceptionHandling_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_015, begin');
      recorder.clear();
      facade.reset();
      facade.setActive(true);
      const outcome: GuardOutcome = facade.isActive(new ErrorShape(BIZ_CODE_SERVICE_UNAVAILABLE, 'query threw'));
      expect(outcome.success).assertFalse();
      expect(outcome.value).assertFalse();
      expect(facade.lastEvent()?.type).assertEqual(EVENT_API_ERROR);
      expect(facade.isModelledActive()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_015, end');
    });

    /**
     * Scenario: isActive succeeds while the session is active.
     * Expectation: the outcome carries the true value of the modelled session.
     */
    it('Assessment_ExceptionHandling_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_016, begin');
      recorder.clear();
      facade.reset();
      facade.setActive(true);
      const outcome: GuardOutcome = facade.isActive(null);
      expect(outcome.success).assertTrue();
      expect(outcome.value).assertTrue();
      expect(recorder.publishedCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_016, end');
    });

    /**
     * Scenario: getConfiguration throws.
     * Expectation: the outcome carries no configuration and the failure is published.
     */
    it('Assessment_ExceptionHandling_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_017, begin');
      recorder.clear();
      facade.reset();
      const outcome: GuardOutcome = facade.getConfiguration(new ErrorShape(BIZ_CODE_SERVICE_UNAVAILABLE, 'no config'));
      expect(outcome.success).assertFalse();
      expect(outcome.value).assertFalse();
      expect(outcome.operation).assertEqual('getConfiguration');
      expect(facade.lastEvent()?.message).assertEqual('no config');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_017, end');
    });

    /**
     * Scenario: getConfiguration succeeds.
     * Expectation: the outcome reports success and no event is published.
     */
    it('Assessment_ExceptionHandling_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_018, begin');
      recorder.clear();
      facade.reset();
      facade.setActive(true);
      const outcome: GuardOutcome = facade.getConfiguration(null);
      expect(outcome.success).assertTrue();
      expect(outcome.value).assertTrue();
      expect(facade.publishedEvents().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_018, end');
    });

    /**
     * Scenario: the four guarded methods are called one after another.
     * Expectation: every call is recorded exactly once and none of them is unhandled.
     */
    it('Assessment_ExceptionHandling_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_019, begin');
      recorder.clear();
      facade.reset();
      facade.begin(true, null);
      facade.isActive(null);
      facade.getConfiguration(null);
      facade.end(true, null);
      expect(recorder.size()).assertEqual(4);
      expect(recorder.countOf('begin')).assertEqual(1);
      expect(recorder.countOf('end')).assertEqual(1);
      expect(recorder.countOf('isActive')).assertEqual(1);
      expect(recorder.countOf('getConfiguration')).assertEqual(1);
      expect(recorder.unhandledCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', recorder.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_019, end');
    });

    /**
     * Scenario: all four methods throw.
     * Expectation: four onApiError events are published and every call is marked caught.
     */
    it('Assessment_ExceptionHandling_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_020, begin');
      recorder.clear();
      facade.reset();
      const failure: ErrorShape = new ErrorShape(BIZ_CODE_SERVICE_UNAVAILABLE, 'service down');
      facade.begin(true, failure);
      facade.isActive(failure);
      facade.getConfiguration(failure);
      facade.end(true, failure);
      expect(recorder.publishedCount()).assertEqual(4);
      expect(recorder.unhandledCount()).assertEqual(0);
      expect(facade.publishedEvents().length).assertEqual(4);
      for (let i = 0; i < facade.publishedEvents().length; i++) {
        expect(facade.publishedEvents()[i].type).assertEqual(EVENT_API_ERROR);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', facade.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_020, end');
    });

    /**
     * Scenario: the published events are ordered.
     * Expectation: the sequence grows by one per event and the head is the newest one.
     */
    it('Assessment_ExceptionHandling_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_021, begin');
      recorder.clear();
      facade.reset();
      facade.begin(false, null);
      facade.end(false, null);
      facade.isActive(new ErrorShape(BIZ_CODE_SERVICE_UNAVAILABLE, 'x'));
      const events: PublishedEvent[] = facade.publishedEvents();
      expect(events.length).assertEqual(3);
      expect(events[0].seq).assertEqual(1);
      expect(events[1].seq).assertEqual(2);
      expect(events[2].seq).assertEqual(3);
      expect(facade.lastEvent()?.seq).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_021, end');
    });

    /**
     * Scenario: a callback event is published directly.
     * Expectation: the event carries the type and the shape that the controller would log.
     */
    it('Assessment_ExceptionHandling_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_022, begin');
      recorder.clear();
      facade.reset();
      const shape: ErrorShape = new ErrorShape(CODE_USER_CANCEL, 'user cancelled');
      const event: PublishedEvent = facade.publishCallback(EVENT_BEGIN, shape);
      expect(event.type).assertEqual(EVENT_BEGIN);
      expect(event.code).assertEqual(CODE_USER_CANCEL);
      expect(event.message).assertEqual('user cancelled');
      expect(event.seq).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_022, end');
    });

    /**
     * Scenario: the facade is reset between cases.
     * Expectation: the event list and the sequence counter return to their defaults.
     */
    it('Assessment_ExceptionHandling_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_023, begin');
      recorder.clear();
      facade.reset();
      facade.begin(false, null);
      facade.reset();
      expect(facade.publishedEvents().length).assertEqual(0);
      expect(facade.lastEvent() === undefined).assertTrue();
      expect(facade.isModelledActive()).assertFalse();
      facade.begin(false, null);
      expect(facade.lastEvent()?.seq).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_023, end');
    });

    /**
     * Scenario: the recorder is cleared.
     * Expectation: the call list returns to zero and the counters follow.
     */
    it('Assessment_ExceptionHandling_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_024, begin');
      recorder.clear();
      recorder.recordSuccess('begin');
      recorder.recordThrown('end', FailureKind.THROWN_BUSINESS_ERROR, new ErrorShape(BIZ_CODE_SERVICE_UNAVAILABLE, 'x'));
      expect(recorder.size()).assertEqual(2);
      expect(recorder.publishedCount()).assertEqual(1);
      recorder.clear();
      expect(recorder.size()).assertEqual(0);
      expect(recorder.publishedCount()).assertEqual(0);
      expect(recorder.lastOf('begin') === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_024, end');
    });

    /**
     * Scenario: a successful call is looked up.
     * Expectation: the recorded call carries the none failure kind and no published flag.
     */
    it('Assessment_ExceptionHandling_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_025, begin');
      recorder.clear();
      const call: GuardedCall = recorder.recordSuccess('isActive');
      expect(call.failure).assertEqual(FailureKind.NONE);
      expect(call.caught).assertFalse();
      expect(call.published).assertFalse();
      expect(call.code).assertEqual(CODE_OK);
      expect(recorder.lastOf('isActive') !== undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_025, end');
    });

    /**
     * Scenario: the hardening plan is enumerated.
     * Expectation: the plan holds exactly the four measures of the sample.
     */
    it('Assessment_ExceptionHandling_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_026, begin');
      const plan: string[] = hardening.planOf();
      expect(hardening.planSize()).assertEqual(HARDEN_PHASE_COUNT);
      expect(plan.length).assertEqual(4);
      expect(plan[0]).assertEqual(HARDEN_WINDOW_LAYOUT);
      expect(plan[1]).assertEqual(HARDEN_PRIVACY_MODE);
      expect(plan[2]).assertEqual(HARDEN_SIMPLE_KEYBOARD);
      expect(plan[3]).assertEqual(HARDEN_CLEAR_PASTEBOARD);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_026, end');
    });

    /**
     * Scenario: the hardening plan runs without any failure.
     * Expectation: every phase succeeds and no phase is reported as failed.
     */
    it('Assessment_ExceptionHandling_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_027, begin');
      const results: HardeningPhaseResult[] = hardening.apply('', true);
      expect(results.length).assertEqual(4);
      expect(hardening.successCount(results)).assertEqual(4);
      expect(hardening.failedPhases(results).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_027, end');
    });

    /**
     * Scenario: the pasteboard clear fails while every other phase succeeds.
     * Expectation: the failure stays isolated and the three remaining phases still succeed.
     */
    it('Assessment_ExceptionHandling_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_028, begin');
      const results: HardeningPhaseResult[] = hardening.apply(HARDEN_CLEAR_PASTEBOARD, true);
      expect(hardening.successCount(results)).assertEqual(3);
      const failed: string[] = hardening.failedPhases(results);
      expect(failed.length).assertEqual(1);
      expect(failed[0]).assertEqual(HARDEN_CLEAR_PASTEBOARD);
      expect(hardening.contains(results, HARDEN_WINDOW_LAYOUT)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_028, end');
    });

    /**
     * Scenario: the privacy mode fails.
     * Expectation: the layout and the keyboard phases are unaffected.
     */
    it('Assessment_ExceptionHandling_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_029, begin');
      const results: HardeningPhaseResult[] = hardening.apply(HARDEN_PRIVACY_MODE, true);
      expect(hardening.successCount(results)).assertEqual(3);
      expect(hardening.failedPhases(results)[0]).assertEqual(HARDEN_PRIVACY_MODE);
      expect(hardening.contains(results, HARDEN_CLEAR_PASTEBOARD)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_029, end');
    });

    /**
     * Scenario: the input method phase fails.
     * Expectation: the failure is reported with the service unavailable code.
     */
    it('Assessment_ExceptionHandling_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_030, begin');
      const results: HardeningPhaseResult[] = hardening.apply(HARDEN_SIMPLE_KEYBOARD, true);
      const failed: string[] = hardening.failedPhases(results);
      expect(failed.length).assertEqual(1);
      expect(failed[0]).assertEqual(HARDEN_SIMPLE_KEYBOARD);
      for (let i = 0; i < results.length; i++) {
        if (results[i].phase === HARDEN_SIMPLE_KEYBOARD) {
          expect(results[i].errorCode).assertEqual(BIZ_CODE_SERVICE_UNAVAILABLE);
          expect(results[i].errorMessage.length > 0).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_030, end');
    });

    /**
     * Scenario: the hardening runs without an ability context.
     * Expectation: the two window phases are skipped and the two context free phases succeed.
     */
    it('Assessment_ExceptionHandling_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_031, begin');
      const results: HardeningPhaseResult[] = hardening.apply('', false);
      expect(results.length).assertEqual(4);
      expect(hardening.successCount(results)).assertEqual(2);
      const failed: string[] = hardening.failedPhases(results);
      expect(failed.length).assertEqual(2);
      expect(failed[0]).assertEqual(HARDEN_WINDOW_LAYOUT);
      expect(failed[1]).assertEqual(HARDEN_PRIVACY_MODE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_031, end');
    });

    /**
     * Scenario: two hardening phases fail at once.
     * Expectation: the two remaining phases still succeed, the isolation holds twice.
     */
    it('Assessment_ExceptionHandling_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_032, begin');
      const first: HardeningPhaseResult[] = hardening.apply(HARDEN_WINDOW_LAYOUT, true);
      const second: HardeningPhaseResult[] = hardening.apply(HARDEN_CLEAR_PASTEBOARD, true);
      expect(hardening.successCount(first)).assertEqual(3);
      expect(hardening.successCount(second)).assertEqual(3);
      expect(hardening.failedPhases(first)[0]).assertEqual(HARDEN_WINDOW_LAYOUT);
      expect(hardening.failedPhases(second)[0]).assertEqual(HARDEN_CLEAR_PASTEBOARD);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_032, end');
    });

    /**
     * Scenario: a phase of the plan is queried that was never executed.
     * Expectation: the contains helper answers false.
     */
    it('Assessment_ExceptionHandling_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_033, begin');
      const results: HardeningPhaseResult[] = hardening.apply('', true);
      expect(hardening.contains(results, 'setWindowBrightness')).assertFalse();
      expect(hardening.contains(results, HARDEN_WINDOW_LAYOUT)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_033, end');
    });

    /**
     * Scenario: an operation rejects and the caller attached a catch handler.
     * Expectation: the rejection is observed and logged.
     */
    it('Assessment_ExceptionHandling_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_034, begin');
      guard.reset();
      expect(guard.run('applyHardening', true, true)).assertTrue();
      expect(guard.observedCount()).assertEqual(1);
      expect(guard.escapedCount()).assertEqual(0);
      expect(guard.loggedOperations()[0]).assertEqual('applyHardening');
      hilog.info(DOMAIN, TAG, '%{public}s', guard.summary());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_034, end');
    });

    /**
     * Scenario: an operation resolves.
     * Expectation: nothing is observed and nothing escapes.
     */
    it('Assessment_ExceptionHandling_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_035, begin');
      guard.reset();
      expect(guard.run('applyHardening', false, true)).assertFalse();
      expect(guard.observedCount()).assertEqual(0);
      expect(guard.escapedCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_035, end');
    });

    /**
     * Scenario: an operation rejects without a handler.
     * Expectation: the rejection is counted as escaped, which is the failure mode the suite
     * asserts against.
     */
    it('Assessment_ExceptionHandling_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_036, begin');
      guard.reset();
      expect(guard.run('releaseHardening', true, false)).assertFalse();
      expect(guard.escapedCount()).assertEqual(1);
      expect(guard.observedCount()).assertEqual(0);
      guard.reset();
      expect(guard.escapedCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_036, end');
    });

    /**
     * Scenario: the sample runs six guarded asynchronous operations.
     * Expectation: every rejection is observed because the sample attaches a handler each time.
     */
    it('Assessment_ExceptionHandling_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_037, begin');
      guard.reset();
      const operations: string[] = ['applyHardening', 'releaseHardening', 'clearData', 'setWindowLayoutFullScreen',
        'setWindowPrivacyMode', 'pushUrl'];
      for (let i = 0; i < operations.length; i++) {
        guard.run(operations[i], true, true);
      }
      expect(guard.observedCount()).assertEqual(6);
      expect(guard.escapedCount()).assertEqual(0);
      expect(guard.loggedOperations().length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_037, end');
    });

    /**
     * Scenario: the outcome names of the facade are rendered.
     * Expectation: a success and a failure carry distinct names for the log line.
     */
    it('Assessment_ExceptionHandling_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_038, begin');
      recorder.clear();
      facade.reset();
      const success: GuardOutcome = facade.isActive(null);
      const failure: GuardOutcome = facade.isActive(new ErrorShape(BIZ_CODE_SERVICE_UNAVAILABLE, 'x'));
      expect(outcomeName(success)).assertEqual('success');
      expect(outcomeName(failure)).assertEqual('failure');
      expect(outcomeName(success).length).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_038, end');
    });

    /**
     * Scenario: the summary strings of the models are rendered.
     * Expectation: both summaries carry the model name and the counters.
     */
    it('Assessment_ExceptionHandling_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_039, begin');
      recorder.clear();
      facade.reset();
      facade.begin(false, null);
      const facadeSummary: string = facade.summary();
      expect(facadeSummary).assertContain('AssessmentFacade');
      expect(facadeSummary).assertContain('events=1');
      const recorderSummary: string = recorder.summary();
      expect(recorderSummary).assertContain('GuardedCallRecorder');
      expect(recorderSummary).assertContain('calls=1');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_039, end');
    });

    /**
     * Scenario: a rendered shape is compared with the log text of the controller.
     * Expectation: the render helper uses the same key order as the event log.
     */
    it('Assessment_ExceptionHandling_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_040, begin');
      const shape: ErrorShape = new ErrorShape(BIZ_CODE_INVALID_PARAM, 'Parameter error');
      const rendered: string = shape.render();
      expect(rendered).assertEqual('code=401 message=Parameter error');
      expect(rendered.indexOf('code=')).assertEqual(0);
      expect(rendered).assertContain('message=');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_040, end');
    });

    /**
     * Scenario: a bound code is compared with the assessment codes of the sample.
     * Expectation: the business codes and the assessment codes live in disjoint ranges.
     */
    it('Assessment_ExceptionHandling_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_049, begin');
      const assessmentCodes: number[] = [CODE_OK, CODE_USER_CANCEL, CODE_TIMEOUT, CODE_SYSTEM_ERROR,
        CODE_ENV_ANOMALY];
      const businessCodes: number[] = [BIZ_CODE_INVALID_PARAM, BIZ_CODE_NOT_SYSTEM_APP,
        BIZ_CODE_SERVICE_UNAVAILABLE, BIZ_CODE_ABILITY_NOT_FOUND];
      for (let i = 0; i < assessmentCodes.length; i++) {
        expect(businessCodes.indexOf(assessmentCodes[i]) < 0).assertTrue();
      }
      expect(assessmentCodes.length).assertEqual(5);
      expect(businessCodes.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_049, end');
    });

    /**
     * Scenario: the four service bands are classified.
     * Expectation: only the invalid parameter and the permission codes are client errors.
     */
    it('Assessment_ExceptionHandling_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_050, begin');
      let client: number = 0;
      let service: number = 0;
      const all: ErrorShape[] = catalog.all();
      for (let i = 0; i < all.length; i++) {
        if (normalizer.isClientError(all[i].code)) {
          client++;
        }
        if (normalizer.isServiceError(all[i].code)) {
          service++;
        }
      }
      expect(client).assertEqual(2);
      expect(service).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s bands client=%{public}d service=%{public}d',
        BUNDLE + 'ExceptionHandling_050', client, service);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ExceptionHandling_050, end');
    });
  });
}
