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
  ID_QUERY_STATE_BUTTON,
  TIMEOUT_PAGE_TRANSITION,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  indexComponentCount,
  waitForIndexPage,
  isComponentEnabled,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Domain limits mirrored from AssessmentConstants and from the documented bundle name rules.
const MAX_ALLOWED_APPS: number = 20;
const MAX_EVENT_LOG: number = 20;
const MAX_BUNDLE_LENGTH: number = 128;
const MIN_BUNDLE_SEGMENTS: number = 2;
const INVALID_DURATION: number = -1;
const DURATION_DEFAULT: number = 0;
const DURATION_TEN_MINUTES: number = 600000;
const DURATION_SIXTY_MINUTES: number = 3600000;

/**
 * Assessment error codes reported by the system service.
 */
enum AssessmentServiceCode {
  OK = 0,
  USER_CANCEL = 1,
  TIMEOUT = 2,
  SYSTEM_ERROR = 3,
  ENV_ANOMALY = 4
}

/**
 * Error types produced by the sample's own validation layer.
 */
enum AssessmentDomainError {
  NONE = 'none',
  INVALID_DURATION = 'invalid_duration',
  INVALID_BUNDLE_NAME = 'invalid_bundle_name',
  WHITELIST_FULL = 'whitelist_full',
  DUPLICATE_BUNDLE = 'duplicate_bundle',
  INVALID_OPTION_INDEX = 'invalid_option_index',
  INVALID_ANSWER = 'invalid_answer',
  EMPTY_LOG = 'empty_log',
  LOG_OVERFLOW = 'log_overflow',
  SESSION_NOT_ACTIVE = 'session_not_active',
  UNAUTHORIZED_CALL = 'unauthorized_call'
}

/**
 * Severity of a domain error.
 */
enum Severity {
  INFO = 'info',
  WARNING = 'warning',
  ERROR = 'error',
  FATAL = 'fatal'
}

/**
 * Recovery strategy of a domain error.
 */
enum Recoverability {
  RETRYABLE = 'retryable',
  USER_ACTION = 'user_action',
  PROGRAMMING = 'programming',
  TERMINAL = 'terminal'
}

/**
 * Static description of one domain error.
 */
interface ErrorDescriptor {
  error: AssessmentDomainError;
  code: number;
  severity: Severity;
  recoverability: Recoverability;
  message: string;
}

/**
 * A single boundary probe: the input value and the error it must trigger.
 */
interface BoundaryProbe {
  label: string;
  error: AssessmentDomainError;
  value: string;
  expectedTriggered: boolean;
}

/**
 * Result of a validation call.
 */
interface ValidationOutcome {
  error: AssessmentDomainError;
  accepted: boolean;
  detail: string;
}

/**
 * Catalogue of the domain errors with their metadata.
 */
class DomainErrorCatalogue {
  private descriptors: ErrorDescriptor[] = [
    {
      error: AssessmentDomainError.NONE,
      code: 0,
      severity: Severity.INFO,
      recoverability: Recoverability.RETRYABLE,
      message: 'No error'
    },
    {
      error: AssessmentDomainError.INVALID_DURATION,
      code: 401,
      severity: Severity.ERROR,
      recoverability: Recoverability.USER_ACTION,
      message: 'The duration is not one of the supported candidates'
    },
    {
      error: AssessmentDomainError.INVALID_BUNDLE_NAME,
      code: 402,
      severity: Severity.ERROR,
      recoverability: Recoverability.USER_ACTION,
      message: 'The bundle name does not match the bundle name pattern'
    },
    {
      error: AssessmentDomainError.WHITELIST_FULL,
      code: 403,
      severity: Severity.WARNING,
      recoverability: Recoverability.USER_ACTION,
      message: 'The whitelist already holds the maximum number of bundle names'
    },
    {
      error: AssessmentDomainError.DUPLICATE_BUNDLE,
      code: 404,
      severity: Severity.WARNING,
      recoverability: Recoverability.USER_ACTION,
      message: 'The bundle name is already in the whitelist'
    },
    {
      error: AssessmentDomainError.INVALID_OPTION_INDEX,
      code: 405,
      severity: Severity.ERROR,
      recoverability: Recoverability.PROGRAMMING,
      message: 'The option index is outside the option range of the question'
    },
    {
      error: AssessmentDomainError.INVALID_ANSWER,
      code: 406,
      severity: Severity.WARNING,
      recoverability: Recoverability.USER_ACTION,
      message: 'The answer has not been selected yet'
    },
    {
      error: AssessmentDomainError.EMPTY_LOG,
      code: 407,
      severity: Severity.INFO,
      recoverability: Recoverability.RETRYABLE,
      message: 'The event log is empty'
    },
    {
      error: AssessmentDomainError.LOG_OVERFLOW,
      code: 408,
      severity: Severity.INFO,
      recoverability: Recoverability.RETRYABLE,
      message: 'The event log dropped its oldest entry'
    },
    {
      error: AssessmentDomainError.SESSION_NOT_ACTIVE,
      code: 409,
      severity: Severity.ERROR,
      recoverability: Recoverability.USER_ACTION,
      message: 'No assessment session is active'
    },
    {
      error: AssessmentDomainError.UNAUTHORIZED_CALL,
      code: 410,
      severity: Severity.FATAL,
      recoverability: Recoverability.TERMINAL,
      message: 'The caller is not allowed to invoke the assessment API'
    }
  ];

  public all(): ErrorDescriptor[] {
    return this.descriptors.slice();
  }

  public count(): number {
    return this.descriptors.length;
  }

  public find(error: AssessmentDomainError): ErrorDescriptor | undefined {
    for (let i = 0; i < this.descriptors.length; i++) {
      if (this.descriptors[i].error === error) {
        return this.descriptors[i];
      }
    }
    return undefined;
  }

  public codeOf(error: AssessmentDomainError): number {
    const descriptor: ErrorDescriptor | undefined = this.find(error);
    return descriptor === undefined ? -1 : descriptor.code;
  }

  public messageOf(error: AssessmentDomainError): string {
    const descriptor: ErrorDescriptor | undefined = this.find(error);
    return descriptor === undefined ? '' : descriptor.message;
  }

  public bySeverity(severity: Severity): ErrorDescriptor[] {
    const result: ErrorDescriptor[] = [];
    for (let i = 0; i < this.descriptors.length; i++) {
      if (this.descriptors[i].severity === severity) {
        result.push(this.descriptors[i]);
      }
    }
    return result;
  }

  public byRecoverability(recoverability: Recoverability): ErrorDescriptor[] {
    const result: ErrorDescriptor[] = [];
    for (let i = 0; i < this.descriptors.length; i++) {
      if (this.descriptors[i].recoverability === recoverability) {
        result.push(this.descriptors[i]);
      }
    }
    return result;
  }

  // Every catalogue entry must carry a unique error type and a unique non zero code except
  // for the neutral entry that represents success.
  public hasUniqueCodes(): boolean {
    const seen: Set<number> = new Set<number>();
    for (let i = 0; i < this.descriptors.length; i++) {
      const code: number = this.descriptors[i].code;
      if (seen.has(code)) {
        return false;
      }
      seen.add(code);
    }
    return true;
  }

  public hasUniqueTypes(): boolean {
    const seen: Set<string> = new Set<string>();
    for (let i = 0; i < this.descriptors.length; i++) {
      const type: string = this.descriptors[i].error;
      if (seen.has(type)) {
        return false;
      }
      seen.add(type);
    }
    return true;
  }

  public everyDescriptorComplete(): boolean {
    for (let i = 0; i < this.descriptors.length; i++) {
      const descriptor: ErrorDescriptor = this.descriptors[i];
      if (descriptor.message.length === 0) {
        return false;
      }
      if (descriptor.code < 0) {
        return false;
      }
    }
    return true;
  }

  public nonNeutralCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.descriptors.length; i++) {
      if (this.descriptors[i].error !== AssessmentDomainError.NONE) {
        count++;
      }
    }
    return count;
  }
}

/**
 * Validator of AssessmentConfig values at the domain boundary.
 */
class AssessmentConfigValidator {
  private catalogue: DomainErrorCatalogue;

  public constructor(catalogue: DomainErrorCatalogue) {
    this.catalogue = catalogue;
  }

  // AssessmentConfig accepts 0, 600000, 1800000 and 3600000 milliseconds.
  public validateDuration(duration: number): ValidationOutcome {
    if (duration < 0) {
      return this.reject(AssessmentDomainError.INVALID_DURATION, `duration ${duration} is negative`);
    }
    if (duration === DURATION_DEFAULT) {
      return this.accept('duration uses the default value');
    }
    if (duration === DURATION_TEN_MINUTES || duration === 1800000 || duration === DURATION_SIXTY_MINUTES) {
      return this.accept(`duration ${duration} is a candidate`);
    }
    return this.reject(AssessmentDomainError.INVALID_DURATION, `duration ${duration} is not a candidate`);
  }

  public validateBundleName(bundleName: string): ValidationOutcome {
    const trimmed: string = bundleName.trim();
    if (trimmed.length === 0) {
      return this.reject(AssessmentDomainError.INVALID_BUNDLE_NAME, 'the bundle name is empty');
    }
    if (trimmed.length > MAX_BUNDLE_LENGTH) {
      return this.reject(AssessmentDomainError.INVALID_BUNDLE_NAME, 'the bundle name is too long');
    }
    const segments: string[] = trimmed.split('.');
    if (segments.length < MIN_BUNDLE_SEGMENTS) {
      return this.reject(AssessmentDomainError.INVALID_BUNDLE_NAME, 'the bundle name has one segment only');
    }
    for (let i = 0; i < segments.length; i++) {
      const segment: string = segments[i];
      if (segment.length === 0) {
        return this.reject(AssessmentDomainError.INVALID_BUNDLE_NAME, 'the bundle name has an empty segment');
      }
      if (!this.isSegmentCharValid(segment)) {
        return this.reject(AssessmentDomainError.INVALID_BUNDLE_NAME, `segment ${segment} carries a bad character`);
      }
      if (this.startsWithDigit(segment)) {
        return this.reject(AssessmentDomainError.INVALID_BUNDLE_NAME, `segment ${segment} starts with a digit`);
      }
    }
    return this.accept('the bundle name matches the pattern');
  }

  private isSegmentCharValid(segment: string): boolean {
    for (let i = 0; i < segment.length; i++) {
      const code: number = segment.charCodeAt(i);
      const isDigit: boolean = code >= 48 && code <= 57;
      const isUpper: boolean = code >= 65 && code <= 90;
      const isLower: boolean = code >= 97 && code <= 122;
      const isUnderscore: boolean = code === 95;
      if (!isDigit && !isUpper && !isLower && !isUnderscore) {
        return false;
      }
    }
    return true;
  }

  private startsWithDigit(segment: string): boolean {
    if (segment.length === 0) {
      return false;
    }
    const code: number = segment.charCodeAt(0);
    return code >= 48 && code <= 57;
  }

  public validateWhitelist(apps: string[]): ValidationOutcome {
    if (apps.length > MAX_ALLOWED_APPS) {
      return this.reject(AssessmentDomainError.WHITELIST_FULL, `the whitelist holds ${apps.length} entries`);
    }
    const seen: Set<string> = new Set<string>();
    for (let i = 0; i < apps.length; i++) {
      if (seen.has(apps[i])) {
        return this.reject(AssessmentDomainError.DUPLICATE_BUNDLE, `duplicate entry ${apps[i]}`);
      }
      seen.add(apps[i]);
    }
    return this.accept('the whitelist is consistent');
  }

  public validateOptionIndex(index: number, optionCount: number): ValidationOutcome {
    if (index < 0) {
      return this.reject(AssessmentDomainError.INVALID_OPTION_INDEX, `option index ${index} is negative`);
    }
    if (index >= optionCount) {
      return this.reject(AssessmentDomainError.INVALID_OPTION_INDEX,
        `option index ${index} exceeds ${optionCount - 1}`);
    }
    return this.accept(`option index ${index} is in range`);
  }

  public validateAnswer(answer: number): ValidationOutcome {
    if (answer === -1) {
      return this.reject(AssessmentDomainError.INVALID_ANSWER, 'the answer has not been selected');
    }
    return this.accept(`answer ${answer} is selected`);
  }

  public validateLogLength(length: number): ValidationOutcome {
    if (length === 0) {
      return this.reject(AssessmentDomainError.EMPTY_LOG, 'the log is empty');
    }
    if (length > MAX_EVENT_LOG) {
      return this.reject(AssessmentDomainError.LOG_OVERFLOW, `the log holds ${length} entries`);
    }
    return this.accept(`the log holds ${length} entries`);
  }

  public validateSessionActive(active: boolean): ValidationOutcome {
    if (!active) {
      return this.reject(AssessmentDomainError.SESSION_NOT_ACTIVE, 'isActive answered false');
    }
    return this.accept('the session is active');
  }

  public validateAuthorization(allowed: boolean): ValidationOutcome {
    if (!allowed) {
      return this.reject(AssessmentDomainError.UNAUTHORIZED_CALL, 'the caller is not authorized');
    }
    return this.accept('the caller is authorized');
  }

  public accept(detail: string): ValidationOutcome {
    return {
      error: AssessmentDomainError.NONE,
      accepted: true,
      detail: detail
    };
  }

  public reject(error: AssessmentDomainError, detail: string): ValidationOutcome {
    return {
      error: error,
      accepted: false,
      detail: detail
    };
  }

  public describe(outcome: ValidationOutcome): string {
    return `ValidationOutcome{error=${outcome.error}, accepted=${outcome.accepted}, ` +
      `code=${this.catalogue.codeOf(outcome.error)}}`;
  }
}

/**
 * Boundary suite: iterates a table of probes and verifies every trigger.
 */
class BoundarySuite {
  private validator: AssessmentConfigValidator;
  private probes: BoundaryProbe[] = [];

  public constructor(validator: AssessmentConfigValidator) {
    this.validator = validator;
  }

  public register(probe: BoundaryProbe): void {
    this.probes.push(probe);
  }

  public getProbes(): BoundaryProbe[] {
    return this.probes.slice();
  }

  public count(): number {
    return this.probes.length;
  }

  public runAll(): ValidationOutcome[] {
    const outcomes: ValidationOutcome[] = [];
    for (let i = 0; i < this.probes.length; i++) {
      outcomes.push(this.run(this.probes[i]));
    }
    return outcomes;
  }

  public run(probe: BoundaryProbe): ValidationOutcome {
    const error: AssessmentDomainError = probe.error;
    if (error === AssessmentDomainError.INVALID_DURATION) {
      const value: number = probe.value.length === 0 ? 0 : Number(probe.value);
      return this.validator.validateDuration(value);
    }
    if (error === AssessmentDomainError.INVALID_BUNDLE_NAME) {
      return this.validator.validateBundleName(probe.value);
    }
    if (error === AssessmentDomainError.INVALID_OPTION_INDEX) {
      const value: number = probe.value.length === 0 ? 0 : Number(probe.value);
      return this.validator.validateOptionIndex(value, 3);
    }
    if (error === AssessmentDomainError.INVALID_ANSWER) {
      const value: number = probe.value.length === 0 ? 0 : Number(probe.value);
      return this.validator.validateAnswer(value);
    }
    if (error === AssessmentDomainError.EMPTY_LOG) {
      return this.validator.validateLogLength(probe.value.length);
    }
    if (error === AssessmentDomainError.LOG_OVERFLOW) {
      return this.validator.validateLogLength(Number(probe.value));
    }
    if (error === AssessmentDomainError.SESSION_NOT_ACTIVE) {
      return this.validator.validateSessionActive(probe.value === 'true');
    }
    if (error === AssessmentDomainError.UNAUTHORIZED_CALL) {
      return this.validator.validateAuthorization(probe.value === 'true');
    }
    if (error === AssessmentDomainError.WHITELIST_FULL) {
      const entries: string[] = this.buildEntries(Number(probe.value));
      return this.validator.validateWhitelist(entries);
    }
    if (error === AssessmentDomainError.DUPLICATE_BUNDLE) {
      return this.validator.validateWhitelist(['com.samples.assessment', 'com.samples.assessment']);
    }
    return this.validator.accept('the probe carries the neutral error');
  }

  private buildEntries(count: number): string[] {
    const entries: string[] = [];
    for (let i = 0; i < count; i++) {
      entries.push(`com.samples.app${i}`);
    }
    return entries;
  }

  public triggeredCount(): number {
    const outcomes: ValidationOutcome[] = this.runAll();
    let count: number = 0;
    for (let i = 0; i < outcomes.length; i++) {
      if (!outcomes[i].accepted) {
        count++;
      }
    }
    return count;
  }

  // Every probe must produce exactly the error it is registered with.
  public matchesExpectation(): boolean {
    const outcomes: ValidationOutcome[] = this.runAll();
    for (let i = 0; i < outcomes.length; i++) {
      const expected: AssessmentDomainError = this.probes[i].error;
      if (this.probes[i].expectedTriggered && outcomes[i].error !== expected) {
        return false;
      }
    }
    return true;
  }
}

/**
 * Builds the standard boundary suite of the assessment domain.
 */
class BoundarySuiteFactory {
  public static create(validator: AssessmentConfigValidator): BoundarySuite {
    const suite: BoundarySuite = new BoundarySuite(validator);
    suite.register({
      label: 'negative duration',
      error: AssessmentDomainError.INVALID_DURATION,
      value: '-1',
      expectedTriggered: true
    });
    suite.register({
      label: 'duration one millisecond below the default',
      error: AssessmentDomainError.INVALID_DURATION,
      value: '-2',
      expectedTriggered: true
    });
    suite.register({
      label: 'duration between candidates',
      error: AssessmentDomainError.INVALID_DURATION,
      value: '1000',
      expectedTriggered: true
    });
    suite.register({
      label: 'single segment bundle name',
      error: AssessmentDomainError.INVALID_BUNDLE_NAME,
      value: 'assessment',
      expectedTriggered: true
    });
    suite.register({
      label: 'empty bundle name',
      error: AssessmentDomainError.INVALID_BUNDLE_NAME,
      value: '   ',
      expectedTriggered: true
    });
    suite.register({
      label: 'bundle name with a bad character',
      error: AssessmentDomainError.INVALID_BUNDLE_NAME,
      value: 'com.samples-assessment',
      expectedTriggered: true
    });
    suite.register({
      label: 'bundle name with a leading digit segment',
      error: AssessmentDomainError.INVALID_BUNDLE_NAME,
      value: 'com.1sample',
      expectedTriggered: true
    });
    suite.register({
      label: 'bundle name with an empty segment',
      error: AssessmentDomainError.INVALID_BUNDLE_NAME,
      value: 'com..assessment',
      expectedTriggered: true
    });
    suite.register({
      label: 'option index beyond the range',
      error: AssessmentDomainError.INVALID_OPTION_INDEX,
      value: '3',
      expectedTriggered: true
    });
    suite.register({
      label: 'negative option index',
      error: AssessmentDomainError.INVALID_OPTION_INDEX,
      value: '-1',
      expectedTriggered: true
    });
    suite.register({
      label: 'answer not selected',
      error: AssessmentDomainError.INVALID_ANSWER,
      value: '-1',
      expectedTriggered: true
    });
    suite.register({
      label: 'empty event log',
      error: AssessmentDomainError.EMPTY_LOG,
      value: '',
      expectedTriggered: true
    });
    suite.register({
      label: 'event log above the cap',
      error: AssessmentDomainError.LOG_OVERFLOW,
      value: '21',
      expectedTriggered: true
    });
    suite.register({
      label: 'inactive session',
      error: AssessmentDomainError.SESSION_NOT_ACTIVE,
      value: 'false',
      expectedTriggered: true
    });
    suite.register({
      label: 'unauthorized caller',
      error: AssessmentDomainError.UNAUTHORIZED_CALL,
      value: 'false',
      expectedTriggered: true
    });
    suite.register({
      label: 'whitelist above the cap',
      error: AssessmentDomainError.WHITELIST_FULL,
      value: '21',
      expectedTriggered: true
    });
    suite.register({
      label: 'duplicate whitelist entry',
      error: AssessmentDomainError.DUPLICATE_BUNDLE,
      value: '2',
      expectedTriggered: true
    });
    return suite;
  }
}

export default function boundaryErrorTestingTest() {
  describe('BoundaryErrorTesting_Test', () => {
    let driver: Driver;
    let catalogue: DomainErrorCatalogue;
    let validator: AssessmentConfigValidator;
    let suite: BoundarySuite;

    beforeAll(async () => {
      driver = getDriver();
      catalogue = new DomainErrorCatalogue();
      validator = new AssessmentConfigValidator(catalogue);
      suite = BoundarySuiteFactory.create(validator);
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, 2, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the system error codes of the assessment service.
     * Expectation: the code values match the documented AssessmentErrorCode order.
     */
    it('Assessment_BoundaryServiceCodes_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryServiceCodes_001, begin');
      expect(AssessmentServiceCode.OK).assertEqual(0);
      expect(AssessmentServiceCode.USER_CANCEL).assertEqual(1);
      expect(AssessmentServiceCode.TIMEOUT).assertEqual(2);
      expect(AssessmentServiceCode.SYSTEM_ERROR).assertEqual(3);
      expect(AssessmentServiceCode.ENV_ANOMALY).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryServiceCodes_001, end');
    });

    /**
     * Scenario: the domain error enumerations are distinct strings.
     * Expectation: eleven distinct domain error types are declared.
     */
    it('Assessment_BoundaryDomainErrorEnum_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryDomainErrorEnum_002, begin');
      expect(AssessmentDomainError.NONE).assertEqual('none');
      expect(AssessmentDomainError.INVALID_DURATION).assertEqual('invalid_duration');
      expect(AssessmentDomainError.INVALID_BUNDLE_NAME).assertEqual('invalid_bundle_name');
      expect(AssessmentDomainError.WHITELIST_FULL).assertEqual('whitelist_full');
      expect(AssessmentDomainError.DUPLICATE_BUNDLE).assertEqual('duplicate_bundle');
      expect(AssessmentDomainError.INVALID_OPTION_INDEX).assertEqual('invalid_option_index');
      expect(AssessmentDomainError.SESSION_NOT_ACTIVE).assertEqual('session_not_active');
      const types: string[] = [
        AssessmentDomainError.NONE,
        AssessmentDomainError.INVALID_DURATION,
        AssessmentDomainError.INVALID_BUNDLE_NAME,
        AssessmentDomainError.WHITELIST_FULL,
        AssessmentDomainError.DUPLICATE_BUNDLE,
        AssessmentDomainError.INVALID_OPTION_INDEX,
        AssessmentDomainError.INVALID_ANSWER,
        AssessmentDomainError.EMPTY_LOG,
        AssessmentDomainError.LOG_OVERFLOW,
        AssessmentDomainError.SESSION_NOT_ACTIVE,
        AssessmentDomainError.UNAUTHORIZED_CALL
      ];
      const unique: Set<string> = new Set<string>(types);
      expect(unique.size).assertEqual(types.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryDomainErrorEnum_002, end');
    });

    /**
     * Scenario: the severity and recoverability enumerations.
     * Expectation: both enumerations expose the documented labels.
     */
    it('Assessment_BoundarySeverityEnums_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundarySeverityEnums_003, begin');
      expect(Severity.INFO).assertEqual('info');
      expect(Severity.WARNING).assertEqual('warning');
      expect(Severity.ERROR).assertEqual('error');
      expect(Severity.FATAL).assertEqual('fatal');
      expect(Recoverability.RETRYABLE).assertEqual('retryable');
      expect(Recoverability.USER_ACTION).assertEqual('user_action');
      expect(Recoverability.PROGRAMMING).assertEqual('programming');
      expect(Recoverability.TERMINAL).assertEqual('terminal');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundarySeverityEnums_003, end');
    });

    /**
     * Scenario: the catalogue covers every domain error.
     * Expectation: eleven descriptors, ten of them non neutral.
     */
    it('Assessment_BoundaryCatalogueCompleteness_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryCatalogueCompleteness_004, begin');
      expect(catalogue.count()).assertEqual(11);
      expect(catalogue.nonNeutralCount()).assertEqual(10);
      expect(catalogue.hasUniqueCodes()).assertTrue();
      expect(catalogue.hasUniqueTypes()).assertTrue();
      expect(catalogue.everyDescriptorComplete()).assertTrue();
      expect(catalogue.all().length).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryCatalogueCompleteness_004, end');
    });

    /**
     * Scenario: catalogue lookups for known and unknown errors.
     * Expectation: known errors answer their code, unknown errors answer the sentinel.
     */
    it('Assessment_BoundaryCatalogueLookup_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryCatalogueLookup_005, begin');
      expect(catalogue.codeOf(AssessmentDomainError.NONE)).assertEqual(0);
      expect(catalogue.codeOf(AssessmentDomainError.INVALID_DURATION)).assertEqual(401);
      expect(catalogue.codeOf(AssessmentDomainError.UNAUTHORIZED_CALL)).assertEqual(410);
      expect(catalogue.codeOf('missing_error' as AssessmentDomainError)).assertEqual(-1);
      expect(catalogue.messageOf(AssessmentDomainError.INVALID_DURATION).length > 0).assertTrue();
      expect(catalogue.messageOf('missing_error' as AssessmentDomainError)).assertEqual('');
      expect(catalogue.find(AssessmentDomainError.DUPLICATE_BUNDLE) !== undefined).assertTrue();
      expect(catalogue.find('missing_error' as AssessmentDomainError) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryCatalogueLookup_005, end');
    });

    /**
     * Scenario: catalogue filtering by severity.
     * Expectation: each severity bucket holds the descriptors declared with that severity.
     */
    it('Assessment_BoundaryCatalogueBySeverity_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryCatalogueBySeverity_006, begin');
      expect(catalogue.bySeverity(Severity.INFO).length).assertEqual(3);
      expect(catalogue.bySeverity(Severity.WARNING).length).assertEqual(3);
      expect(catalogue.bySeverity(Severity.ERROR).length).assertEqual(4);
      expect(catalogue.bySeverity(Severity.FATAL).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryCatalogueBySeverity_006, end');
    });

    /**
     * Scenario: catalogue filtering by recoverability.
     * Expectation: the buckets add up to the catalogue size.
     */
    it('Assessment_BoundaryCatalogueByRecoverability_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryCatalogueByRecoverability_007, begin');
      const retryable: number = catalogue.byRecoverability(Recoverability.RETRYABLE).length;
      const userAction: number = catalogue.byRecoverability(Recoverability.USER_ACTION).length;
      const programming: number = catalogue.byRecoverability(Recoverability.PROGRAMMING).length;
      const terminal: number = catalogue.byRecoverability(Recoverability.TERMINAL).length;
      expect(retryable).assertEqual(3);
      expect(userAction).assertEqual(6);
      expect(programming).assertEqual(1);
      expect(terminal).assertEqual(1);
      expect(retryable + userAction + programming + terminal).assertEqual(catalogue.count());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryCatalogueByRecoverability_007, end');
    });

    /**
     * Scenario: duration validation on the allowed candidates.
     * Expectation: the two extreme candidates and the default are accepted.
     */
    it('Assessment_BoundaryDurationAccepted_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryDurationAccepted_008, begin');
      expect(validator.validateDuration(DURATION_DEFAULT).accepted).assertTrue();
      expect(validator.validateDuration(DURATION_TEN_MINUTES).accepted).assertTrue();
      expect(validator.validateDuration(1800000).accepted).assertTrue();
      expect(validator.validateDuration(DURATION_SIXTY_MINUTES).accepted).assertTrue();
      expect(validator.validateDuration(DURATION_DEFAULT).error).assertEqual(AssessmentDomainError.NONE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryDurationAccepted_008, end');
    });

    /**
     * Scenario: duration validation on the lower boundary.
     * Expectation: -1 is rejected with the invalid duration error, zero is accepted.
     */
    it('Assessment_BoundaryDurationLowerBound_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryDurationLowerBound_009, begin');
      const rejected: ValidationOutcome = validator.validateDuration(INVALID_DURATION);
      expect(rejected.accepted).assertFalse();
      expect(rejected.error).assertEqual(AssessmentDomainError.INVALID_DURATION);
      expect(rejected.detail.includes('-1')).assertTrue();
      expect(validator.validateDuration(0).accepted).assertTrue();
      expect(validator.validateDuration(-1000).accepted).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryDurationLowerBound_009, end');
    });

    /**
     * Scenario: duration validation between the candidates.
     * Expectation: an arbitrary value such as one second is rejected.
     */
    it('Assessment_BoundaryDurationBetweenCandidates_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryDurationBetweenCandidates_010, begin');
      expect(validator.validateDuration(1000).accepted).assertFalse();
      expect(validator.validateDuration(599999).accepted).assertFalse();
      expect(validator.validateDuration(600001).accepted).assertFalse();
      expect(validator.validateDuration(3599999).accepted).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryDurationBetweenCandidates_010, end');
    });

    /**
     * Scenario: bundle name validation on the valid pattern.
     * Expectation: dotted, underlined and mixed case names are accepted.
     */
    it('Assessment_BoundaryBundleAccepted_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryBundleAccepted_011, begin');
      expect(validator.validateBundleName('com.samples.assessment').accepted).assertTrue();
      expect(validator.validateBundleName('com.samples.app_1').accepted).assertTrue();
      expect(validator.validateBundleName('Com.Samples.Reader').accepted).assertTrue();
      expect(validator.validateBundleName('a.b').accepted).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryBundleAccepted_011, end');
    });

    /**
     * Scenario: bundle name validation rejects a single segment.
     * Expectation: at least two dot separated segments are required.
     */
    it('Assessment_BoundaryBundleSingleSegment_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryBundleSingleSegment_012, begin');
      const outcome: ValidationOutcome = validator.validateBundleName('assessment');
      expect(outcome.accepted).assertFalse();
      expect(outcome.error).assertEqual(AssessmentDomainError.INVALID_BUNDLE_NAME);
      expect(outcome.detail.includes('one segment')).assertTrue();
      expect(validator.validateBundleName('com').accepted).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryBundleSingleSegment_012, end');
    });

    /**
     * Scenario: bundle name validation rejects characters outside the pattern.
     * Expectation: hyphens, spaces and slashes are rejected.
     */
    it('Assessment_BoundaryBundleBadCharacter_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryBundleBadCharacter_013, begin');
      expect(validator.validateBundleName('com.samples-assessment').accepted).assertFalse();
      expect(validator.validateBundleName('com.samples assessment').accepted).assertFalse();
      expect(validator.validateBundleName('com/samples').accepted).assertFalse();
      expect(validator.validateBundleName('com.samples.reader!').accepted).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryBundleBadCharacter_013, end');
    });

    /**
     * Scenario: bundle name validation rejects a segment that starts with a digit.
     * Expectation: the predicate reports the offending segment.
     */
    it('Assessment_BoundaryBundleLeadingDigit_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryBundleLeadingDigit_014, begin');
      const outcome: ValidationOutcome = validator.validateBundleName('com.1sample');
      expect(outcome.accepted).assertFalse();
      expect(outcome.detail.includes('starts with a digit')).assertTrue();
      expect(validator.validateBundleName('com.sample1').accepted).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryBundleLeadingDigit_014, end');
    });

    /**
     * Scenario: bundle name validation rejects empty segments and blank input.
     * Expectation: the empty case reports the appropriate detail.
     */
    it('Assessment_BoundaryBundleEmptySegment_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryBundleEmptySegment_015, begin');
      expect(validator.validateBundleName('com..assessment').accepted).assertFalse();
      expect(validator.validateBundleName('.com.assessment').accepted).assertFalse();
      expect(validator.validateBundleName('com.samples.').accepted).assertFalse();
      const blank: ValidationOutcome = validator.validateBundleName('    ');
      expect(blank.accepted).assertFalse();
      expect(blank.detail.includes('empty')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryBundleEmptySegment_015, end');
    });

    /**
     * Scenario: bundle name length boundary.
     * Expectation: one hundred and twenty eight characters are accepted, one more rejected.
     */
    it('Assessment_BoundaryBundleLength_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryBundleLength_016, begin');
      let long: string = 'com.';
      while (long.length < MAX_BUNDLE_LENGTH - 1) {
        long += 'a';
      }
      expect(long.length).assertEqual(127);
      expect(validator.validateBundleName(long).accepted).assertTrue();
      const longer: string = long + 'a';
      expect(longer.length).assertEqual(128);
      expect(validator.validateBundleName(longer).accepted).assertTrue();
      const tooLong: string = long + 'aa';
      expect(tooLong.length).assertEqual(129);
      const outcome: ValidationOutcome = validator.validateBundleName(tooLong);
      expect(outcome.accepted).assertFalse();
      expect(outcome.detail.includes('too long')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryBundleLength_016, end');
    });

    /**
     * Scenario: bundle name trimming.
     * Expectation: surrounding whitespace is trimmed before the pattern check.
     */
    it('Assessment_BoundaryBundleTrim_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryBundleTrim_017, begin');
      expect(validator.validateBundleName('  com.samples.assessment  ').accepted).assertTrue();
      expect(validator.validateBundleName('\tcom.samples.assessment\n').accepted).assertTrue();
      expect(validator.validateBundleName('  com .samples ').accepted).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryBundleTrim_017, end');
    });

    /**
     * Scenario: whitelist cap boundary.
     * Expectation: twenty entries are accepted, twenty one hit the full error.
     */
    it('Assessment_BoundaryWhitelistCap_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryWhitelistCap_018, begin');
      const full: string[] = [];
      for (let i = 0; i < MAX_ALLOWED_APPS; i++) {
        full.push(`com.samples.app${i}`);
      }
      expect(full.length).assertEqual(20);
      expect(validator.validateWhitelist(full).accepted).assertTrue();
      const overflow: string[] = full.slice();
      overflow.push('com.samples.extra');
      const outcome: ValidationOutcome = validator.validateWhitelist(overflow);
      expect(outcome.accepted).assertFalse();
      expect(outcome.error).assertEqual(AssessmentDomainError.WHITELIST_FULL);
      expect(validator.validateWhitelist([]).accepted).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryWhitelistCap_018, end');
    });

    /**
     * Scenario: duplicate detection inside the whitelist.
     * Expectation: a repeated entry is reported as a duplicate bundle.
     */
    it('Assessment_BoundaryWhitelistDuplicate_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryWhitelistDuplicate_019, begin');
      const duplicated: string[] = ['com.samples.assessment', 'com.samples.assessment'];
      const outcome: ValidationOutcome = validator.validateWhitelist(duplicated);
      expect(outcome.accepted).assertFalse();
      expect(outcome.error).assertEqual(AssessmentDomainError.DUPLICATE_BUNDLE);
      expect(outcome.detail.includes('duplicate')).assertTrue();
      expect(validator.validateWhitelist(['com.samples.assessment', 'com.samples.reader']).accepted)
        .assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryWhitelistDuplicate_019, end');
    });

    /**
     * Scenario: option index boundaries of a three option question.
     * Expectation: the indices zero and two are valid, minus one and three are not.
     */
    it('Assessment_BoundaryOptionIndex_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryOptionIndex_020, begin');
      expect(validator.validateOptionIndex(0, 3).accepted).assertTrue();
      expect(validator.validateOptionIndex(2, 3).accepted).assertTrue();
      expect(validator.validateOptionIndex(-1, 3).accepted).assertFalse();
      const upper: ValidationOutcome = validator.validateOptionIndex(3, 3);
      expect(upper.accepted).assertFalse();
      expect(upper.error).assertEqual(AssessmentDomainError.INVALID_OPTION_INDEX);
      expect(upper.detail.includes('exceeds')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryOptionIndex_020, end');
    });

    /**
     * Scenario: the unselected answer sentinel.
     * Expectation: minus one is reported as an invalid answer, zero is a valid selection.
     */
    it('Assessment_BoundaryAnswerSentinel_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryAnswerSentinel_021, begin');
      const unselected: ValidationOutcome = validator.validateAnswer(-1);
      expect(unselected.accepted).assertFalse();
      expect(unselected.error).assertEqual(AssessmentDomainError.INVALID_ANSWER);
      expect(validator.validateAnswer(0).accepted).assertTrue();
      expect(validator.validateAnswer(2).accepted).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryAnswerSentinel_021, end');
    });

    /**
     * Scenario: the event log length boundary.
     * Expectation: zero is empty, twenty is full but accepted, twenty one overflows.
     */
    it('Assessment_BoundaryLogLength_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryLogLength_022, begin');
      const empty: ValidationOutcome = validator.validateLogLength(0);
      expect(empty.accepted).assertFalse();
      expect(empty.error).assertEqual(AssessmentDomainError.EMPTY_LOG);
      expect(validator.validateLogLength(20).accepted).assertTrue();
      const overflow: ValidationOutcome = validator.validateLogLength(21);
      expect(overflow.accepted).assertFalse();
      expect(overflow.error).assertEqual(AssessmentDomainError.LOG_OVERFLOW);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryLogLength_022, end');
    });

    /**
     * Scenario: session and authorization guards.
     * Expectation: the inactive and unauthorized outcomes carry the right error types.
     */
    it('Assessment_BoundarySessionAndAuthorization_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundarySessionAndAuthorization_023, begin');
      expect(validator.validateSessionActive(false).error).assertEqual(AssessmentDomainError.SESSION_NOT_ACTIVE);
      expect(validator.validateSessionActive(true).accepted).assertTrue();
      expect(validator.validateAuthorization(false).error).assertEqual(AssessmentDomainError.UNAUTHORIZED_CALL);
      expect(validator.validateAuthorization(true).accepted).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundarySessionAndAuthorization_023, end');
    });

    /**
     * Scenario: the boundary suite registers and runs every probe.
     * Expectation: seventeen probes, all of them trigger their own error.
     */
    it('Assessment_BoundarySuiteRun_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundarySuiteRun_024, begin');
      expect(suite.count()).assertEqual(17);
      expect(suite.getProbes().length).assertEqual(17);
      const outcomes: ValidationOutcome[] = suite.runAll();
      expect(outcomes.length).assertEqual(17);
      for (let i = 0; i < outcomes.length; i++) {
        expect(outcomes[i].accepted).assertFalse();
      }
      expect(suite.triggeredCount()).assertEqual(17);
      expect(suite.matchesExpectation()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundarySuiteRun_024, end');
    });

    /**
     * Scenario: a single probe of the suite produces the registered error.
     * Expectation: the negative duration probe answers the invalid duration error.
     */
    it('Assessment_BoundarySuiteSingleProbe_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundarySuiteSingleProbe_025, begin');
      const probes: BoundaryProbe[] = suite.getProbes();
      const outcome: ValidationOutcome = suite.run(probes[0]);
      expect(outcome.error).assertEqual(probes[0].error);
      expect(outcome.accepted).assertFalse();
      expect(outcome.detail.includes('-1')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundarySuiteSingleProbe_025, end');
    });

    /**
     * Scenario: the outcome description of the validator.
     * Expectation: the description names the error type and the catalogue code.
     */
    it('Assessment_BoundaryOutcomeDescription_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryOutcomeDescription_026, begin');
      const rejected: ValidationOutcome = validator.validateDuration(-5);
      const text: string = validator.describe(rejected);
      expect(text.includes('invalid_duration')).assertTrue();
      expect(text.includes('401')).assertTrue();
      expect(text.includes('accepted=false')).assertTrue();
      const accepted: ValidationOutcome = validator.accept('ok');
      expect(validator.describe(accepted).includes('accepted=true')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryOutcomeDescription_026, end');
    });

    /**
     * Scenario: a probe table registered on the fly.
     * Expectation: a custom probe that carries a neutral error is accepted by the suite.
     */
    it('Assessment_BoundaryCustomProbe_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryCustomProbe_027, begin');
      const local: BoundarySuite = new BoundarySuite(validator);
      local.register({
        label: 'neutral probe',
        error: AssessmentDomainError.NONE,
        value: 'anything',
        expectedTriggered: false
      });
      expect(local.count()).assertEqual(1);
      const outcome: ValidationOutcome = local.run(local.getProbes()[0]);
      expect(outcome.accepted).assertTrue();
      expect(outcome.error).assertEqual(AssessmentDomainError.NONE);
      expect(local.matchesExpectation()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryCustomProbe_027, end');
    });

    /**
     * Scenario: the validator stays pure across repeated calls.
     * Expectation: the same input always produces the same outcome.
     */
    it('Assessment_BoundaryValidatorDeterministic_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryValidatorDeterministic_028, begin');
      const first: ValidationOutcome = validator.validateBundleName('com.1sample');
      for (let i = 0; i < 10; i++) {
        const next: ValidationOutcome = validator.validateBundleName('com.1sample');
        expect(next.error).assertEqual(first.error);
        expect(next.accepted).assertEqual(first.accepted);
        expect(next.detail).assertEqual(first.detail);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryValidatorDeterministic_028, end');
    });

    /**
     * Scenario: a comprehensive boundary scenario over a full configuration.
     * Expectation: a mixed configuration produces one error per invalid field and accepts the
     * configuration once the fields are corrected.
     */
    it('Assessment_BoundaryComprehensiveScenario_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryComprehensiveScenario_030, begin');
      const apps: string[] = [];
      for (let i = 0; i < MAX_ALLOWED_APPS + 1; i++) {
        apps.push(`com.samples.app${i}`);
      }
      expect(validator.validateDuration(-1).accepted).assertFalse();
      expect(validator.validateBundleName('bad').accepted).assertFalse();
      expect(validator.validateWhitelist(apps).accepted).assertFalse();
      expect(validator.validateOptionIndex(9, 3).accepted).assertFalse();
      expect(validator.validateAnswer(-1).accepted).assertFalse();
      expect(validator.validateLogLength(0).accepted).assertFalse();
      expect(validator.validateSessionActive(false).accepted).assertFalse();

      expect(validator.validateDuration(DURATION_SIXTY_MINUTES).accepted).assertTrue();
      expect(validator.validateBundleName('com.samples.assessment').accepted).assertTrue();
      expect(validator.validateWhitelist(apps.slice(0, MAX_ALLOWED_APPS)).accepted).assertTrue();
      expect(validator.validateOptionIndex(2, 3).accepted).assertTrue();
      expect(validator.validateAnswer(1).accepted).assertTrue();
      expect(validator.validateLogLength(MAX_EVENT_LOG).accepted).assertTrue();
      expect(validator.validateSessionActive(true).accepted).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BoundaryComprehensiveScenario_030, end');
    });
  });
}
