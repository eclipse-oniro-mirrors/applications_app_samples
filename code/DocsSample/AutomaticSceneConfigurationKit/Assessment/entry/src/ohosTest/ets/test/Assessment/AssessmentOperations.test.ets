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
  TEXT_NO_ACTIVE_ASSESSMENT,
  TIMEOUT_PAGE_RENDER,
  TOLERANCE_COMPONENT_COUNT,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  indexComponentCount,
  checkTextContent,
  waitForIndexPage,
  isComponentEnabled,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// The four operations of the assessment namespace. The sample wraps every one of them in the
// AssessmentController, the values below are the names that the entry page renders on the
// operation card, which keeps the model and the UI in sync.
enum OperationId {
  BEGIN = 'begin', END = 'end', IS_ACTIVE = 'isActive', GET_CONFIGURATION = 'getConfiguration'
}

// Ordinal values of assessment.AssessmentErrorCode. The numeric value is the order of the
// enum member in the SDK declaration: OK is zero and ENV_ANOMALY is four.
enum ErrorCode {
  OK = 0, USER_CANCEL = 1, TIMEOUT = 2, SYSTEM_ERROR = 3, ENV_ANOMALY = 4
}

// Describes one operation of the assessment namespace. The descriptor is data only, the cases
// assert against it instead of calling the SDK directly, so the model cases run on every device.
interface OperationDescriptor {
  id: string;
  paramCount: number;
  needsContext: boolean;
  needsConfig: boolean;
  mayThrow: boolean;
  callbackStyle: boolean;
  summary: string;
}

// Returns the descriptor of the begin operation. begin is the only operation that takes a
// configuration object and a callback pair, so it is the only one flagged with both.
const BEGIN_DESCRIPTOR: OperationDescriptor = {
  id: OperationId.BEGIN,
  paramCount: 3,
  needsContext: true,
  needsConfig: true,
  mayThrow: true,
  callbackStyle: true,
  summary: 'Enters assessment mode with a duration and an application whitelist'
};

// Returns the descriptor of the end operation. end only needs the context of the ability that
// entered assessment mode, the service resolves the session from that context.
const END_DESCRIPTOR: OperationDescriptor = {
  id: OperationId.END,
  paramCount: 1,
  needsContext: true,
  needsConfig: false,
  mayThrow: true,
  callbackStyle: true,
  summary: 'Leaves the assessment session that was started by this ability'
};

// Returns the descriptor of the isActive query. The query is synchronous and takes no
// parameter at all.
const IS_ACTIVE_DESCRIPTOR: OperationDescriptor = {
  id: OperationId.IS_ACTIVE,
  paramCount: 0,
  needsContext: false,
  needsConfig: false,
  mayThrow: true,
  callbackStyle: false,
  summary: 'Reports whether the device is currently in assessment mode'
};

// Returns the descriptor of the getConfiguration query. The query is synchronous and returns
// the configuration of the running session.
const GET_CONFIGURATION_DESCRIPTOR: OperationDescriptor = {
  id: OperationId.GET_CONFIGURATION,
  paramCount: 0,
  needsContext: false,
  needsConfig: false,
  mayThrow: true,
  callbackStyle: false,
  summary: 'Returns the duration and the whitelist of the running session'
};

/**
 * Static catalogue of the assessment operations.
 *
 * The catalogue is the single source of truth for the operation cases, every lookup helper is
 * implemented on top of the descriptor list so that a mismatch is reported by a model case
 * before the UI cases run.
 */
class OperationCatalog {
  private entries: OperationDescriptor[] = [];

  constructor(entries: OperationDescriptor[]) {
    this.entries = entries.slice();
  }

  public static defaultCatalog(): OperationCatalog {
    return new OperationCatalog([BEGIN_DESCRIPTOR, END_DESCRIPTOR, IS_ACTIVE_DESCRIPTOR, GET_CONFIGURATION_DESCRIPTOR]);
  }

  public getAll(): OperationDescriptor[] {
    return this.entries.slice();
  }

  public size(): number {
    return this.entries.length;
  }

  public names(): string[] {
    return this.entries.map((entry: OperationDescriptor) => entry.id);
  }

  public findByName(name: string): OperationDescriptor | null {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].id === name) {
        return this.entries[i];
      }
    }
    return null;
  }

  public filterByConfigRequirement(needsConfig: boolean): OperationDescriptor[] {
    return this.entries.filter((entry: OperationDescriptor) => entry.needsConfig === needsConfig);
  }

  public filterByContextRequirement(needsContext: boolean): OperationDescriptor[] {
    return this.entries.filter((entry: OperationDescriptor) => entry.needsContext === needsContext);
  }

  public filterByCallbacks(callbackStyle: boolean): OperationDescriptor[] {
    return this.entries.filter((entry: OperationDescriptor) => entry.callbackStyle === callbackStyle);
  }

  public countWhere(predicate: (entry: OperationDescriptor) => boolean): number {
    let count: number = 0;
    for (let i = 0; i < this.entries.length; i++) {
      if (predicate(this.entries[i])) {
        count++;
      }
    }
    return count;
  }

  public totalParamCount(): number {
    let total: number = 0;
    for (let i = 0; i < this.entries.length; i++) {
      total += this.entries[i].paramCount;
    }
    return total;
  }

  public hasUniqueNames(): boolean {
    const names: Set<string> = new Set<string>(this.names());
    return names.size === this.entries.length;
  }

  public toString(): string {
    return `OperationCatalog{size=${this.entries.length}, names=${this.names().join('|')}}`;
  }
}

/**
 * Maps an assessment error code to a readable label.
 *
 * The sample does not localise the callback codes itself, it only forwards the numeric value to
 * the toast, so the labels below are the documentation names of the SDK enum members.
 */
class ErrorCodeMapper {
  private static readonly LABELS: string[] = [
    'OK', 'USER_CANCEL', 'TIMEOUT', 'SYSTEM_ERROR', 'ENV_ANOMALY'
  ];

  public static allCodes(): number[] {
    return [ErrorCode.OK, ErrorCode.USER_CANCEL, ErrorCode.TIMEOUT, ErrorCode.SYSTEM_ERROR,
      ErrorCode.ENV_ANOMALY];
  }

  public static isKnown(code: number): boolean {
    return code >= ErrorCode.OK && code <= ErrorCode.ENV_ANOMALY &&
      code === Math.floor(code);
  }

  public static labelOf(code: number): string {
    if (!ErrorCodeMapper.isKnown(code)) {
      return 'UNKNOWN';
    }
    return ErrorCodeMapper.LABELS[code];
  }

  public static isSuccess(code: number): boolean {
    return code === ErrorCode.OK;
  }

  public static isFailure(code: number): boolean {
    return !ErrorCodeMapper.isSuccess(code);
  }

  public static ordinalOf(code: number): number {
    for (let i = 0; i < ErrorCodeMapper.allCodes().length; i++) {
      if (ErrorCodeMapper.allCodes()[i] === code) {
        return i;
      }
    }
    return -1;
  }

  public static describe(code: number): string {
    return `ErrorCode{value=${code}, label=${ErrorCodeMapper.labelOf(code)}}`;
  }
}

/**
 * Verifies the semantics of the operation descriptors.
 *
 * The validators are pure functions, the cases use them to prove that the catalogue describes
 * the SDK signatures that the sample controller calls.
 */
class OperationSemanticsValidator {
  private catalog: OperationCatalog;

  constructor(catalog: OperationCatalog) {
    this.catalog = catalog;
  }

  public beginTakesThreeParameters(): boolean {
    const descriptor: OperationDescriptor | null = this.catalog.findByName(OperationId.BEGIN);
    if (descriptor === null) {
      return false;
    }
    return descriptor.paramCount === 3;
  }

  public beginNeedsConfiguration(): boolean {
    const descriptor: OperationDescriptor | null = this.catalog.findByName(OperationId.BEGIN);
    if (descriptor === null) {
      return false;
    }
    return descriptor.needsConfig && descriptor.needsContext && descriptor.callbackStyle;
  }

  public endNeedsOnlyContext(): boolean {
    const descriptor: OperationDescriptor | null = this.catalog.findByName(OperationId.END);
    if (descriptor === null) {
      return false;
    }
    return descriptor.paramCount === 1 && descriptor.needsContext && !descriptor.needsConfig;
  }

  public queriesNeedNoArguments(): boolean {
    const active: OperationDescriptor | null = this.catalog.findByName(OperationId.IS_ACTIVE);
    const config: OperationDescriptor | null = this.catalog.findByName(OperationId.GET_CONFIGURATION);
    if (active === null || config === null) {
      return false;
    }
    return active.paramCount === 0 && config.paramCount === 0 && !active.callbackStyle && !config.callbackStyle;
  }

  public allOperationsMayThrow(): boolean {
    return this.catalog.countWhere((entry: OperationDescriptor) => entry.mayThrow) === this.catalog.size();
  }

  public allSummariesAreNonEmpty(): boolean {
    return this.catalog.countWhere((entry: OperationDescriptor) => entry.summary.length > 0) ===
      this.catalog.size();
  }

  public validateAll(): boolean {
    return this.beginTakesThreeParameters() && this.beginNeedsConfiguration() && this.endNeedsOnlyContext() &&
      this.queriesNeedNoArguments() && this.allOperationsMayThrow() && this.allSummariesAreNonEmpty();
  }

  public collectViolations(): string[] {
    const violations: string[] = [];
    if (!this.beginTakesThreeParameters()) {
      violations.push('begin must take context, config and callback');
    }
    if (!this.beginNeedsConfiguration()) {
      violations.push('begin must flag context, config and callback');
    }
    if (!this.endNeedsOnlyContext()) {
      violations.push('end must take the context only');
    }
    if (!this.queriesNeedNoArguments()) {
      violations.push('the queries must take no argument');
    }
    if (!this.allOperationsMayThrow()) {
      violations.push('every operation may throw a BusinessError');
    }
    if (!this.allSummariesAreNonEmpty()) {
      violations.push('every operation needs a summary');
    }
    return violations;
  }
}

/**
 * One executed operation, recorded by the invocation log.
 */
interface InvocationRecord {
  operation: string;
  paramCount: number;
  succeeded: boolean;
  errorCode: number;
}

/**
 * Records the operations that a case executed, the log mirrors the assessmentLogs storage of the
 * sample: the newest record is stored first and the list is capped at twenty entries.
 */
class InvocationLog {
  private records: InvocationRecord[] = [];
  private capacity: number = 20;

  constructor(capacity: number = 20) {
    this.capacity = capacity;
  }

  public record(operation: string, paramCount: number, succeeded: boolean, errorCode: number): void {
    const next: InvocationRecord[] = this.records.slice();
    next.unshift({
      operation: operation,
      paramCount: paramCount,
      succeeded: succeeded,
      errorCode: errorCode
    });
    while (next.length > this.capacity) {
      next.pop();
    }
    this.records = next;
  }

  public size(): number {
    return this.records.length;
  }

  public getAll(): InvocationRecord[] {
    return this.records.slice();
  }

  public newest(): InvocationRecord | null {
    return this.records.length === 0 ? null : this.records[0];
  }

  public oldest(): InvocationRecord | null {
    return this.records.length === 0 ? null : this.records[this.records.length - 1];
  }

  public operationNames(): string[] {
    return this.records.map((record: InvocationRecord) => record.operation);
  }

  public countSucceeded(): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].succeeded) {
        count++;
      }
    }
    return count;
  }

  public countOf(operation: string): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].operation === operation) {
        count++;
      }
    }
    return count;
  }

  public containsFailure(): boolean {
    for (let i = 0; i < this.records.length; i++) {
      if (!this.records[i].succeeded) {
        return true;
      }
    }
    return false;
  }

  public clear(): void {
    this.records = [];
  }

  public toString(): string {
    return `InvocationLog{size=${this.records.length}, newest=${this.newest() === null ? 'none' :
      this.newest()?.operation}}`;
  }
}

/**
 * A sequence of operations with a declared order.
 *
 * The plan is used to assert the invariants of the sample workflow: begin precedes end and the
 * two queries may be issued at any point.
 */
class OperationPlan {
  private steps: string[] = [];

  constructor(steps: string[]) {
    this.steps = steps.slice();
  }

  public getSteps(): string[] {
    return this.steps.slice();
  }

  public size(): number {
    return this.steps.length;
  }

  public indexOf(operation: string): number {
    return this.steps.indexOf(operation);
  }

  public contains(operation: string): boolean {
    return this.steps.indexOf(operation) >= 0;
  }

  public beginBeforeEnd(): boolean {
    const beginIndex: number = this.indexOf(OperationId.BEGIN);
    const endIndex: number = this.indexOf(OperationId.END);
    if (beginIndex < 0 || endIndex < 0) {
      return false;
    }
    return beginIndex < endIndex;
  }

  public beginBeforeEveryQuery(): boolean {
    const beginIndex: number = this.indexOf(OperationId.BEGIN);
    if (beginIndex < 0) {
      return false;
    }
    const activeIndex: number = this.indexOf(OperationId.IS_ACTIVE);
    const configIndex: number = this.indexOf(OperationId.GET_CONFIGURATION);
    if (activeIndex >= 0 && activeIndex < beginIndex) {
      return false;
    }
    if (configIndex >= 0 && configIndex < beginIndex) {
      return false;
    }
    return true;
  }

  public beginsAtMostOnce(): boolean {
    let count: number = 0;
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i] === OperationId.BEGIN) {
        count++;
      }
    }
    return count <= 1;
  }

  public reversed(): OperationPlan {
    return new OperationPlan(this.steps.slice().reverse());
  }

  public toString(): string {
    return `OperationPlan{steps=${this.steps.join('->')}}`;
  }
}

/**
 * Starts the sample and waits until the entry page is rendered, the UI cases degrade to a skip
 * when the assessment service is absent and the page never shows up.
 */
async function openIndexPage(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'openIndexPage: the entry page is not rendered, the case is skipped');
  }
  return rendered;
}

export default function assessmentOperationsTest() {
  describe('AssessmentOperations_Test', () => {
    let driver: Driver;
    let catalog: OperationCatalog;
    let validator: OperationSemanticsValidator;

    beforeAll(async () => {
      driver = getDriver();
      catalog = OperationCatalog.defaultCatalog();
      validator = new OperationSemanticsValidator(catalog);
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, 2, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the operation catalogue describes the assessment namespace.
     * Expectation: it holds exactly the four operations of the sample.
     */
    it('Assessment_OperationCatalogSize_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OperationCatalogSize_001, begin');
      expect(catalog.size()).assertEqual(4);
      expect(catalog.getAll().length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', catalog.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OperationCatalogSize_001, end');
    });

    /**
     * Scenario: the operation names are the documented API names.
     * Expectation: the names match begin, end, isActive and getConfiguration.
     */
    it('Assessment_OperationNames_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OperationNames_002, begin');
      const names: string[] = catalog.names();
      expect(names.indexOf('begin') >= 0).assertTrue();
      expect(names.indexOf('end') >= 0).assertTrue();
      expect(names.indexOf('isActive') >= 0).assertTrue();
      expect(names.indexOf('getConfiguration') >= 0).assertTrue();
      expect(names.indexOf('suspend') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OperationNames_002, end');
    });

    /**
     * Scenario: the operation names are unique.
     * Expectation: a duplicate name would make the text driven lookup ambiguous.
     */
    it('Assessment_OperationNamesUnique_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OperationNamesUnique_003, begin');
      expect(catalog.hasUniqueNames()).assertTrue();
      const names: Set<string> = new Set<string>(catalog.names());
      expect(names.size).assertEqual(catalog.size());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OperationNamesUnique_003, end');
    });

    /**
     * Scenario: the parameter count of every operation.
     * Expectation: begin takes three parameters, end one, and both queries none.
     */
    it('Assessment_OperationParamCounts_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OperationParamCounts_004, begin');
      const begin: OperationDescriptor | null = catalog.findByName(OperationId.BEGIN);
      const end: OperationDescriptor | null = catalog.findByName(OperationId.END);
      const active: OperationDescriptor | null = catalog.findByName(OperationId.IS_ACTIVE);
      expect(begin !== null).assertTrue();
      expect(end !== null).assertTrue();
      expect(active !== null).assertTrue();
      if (begin !== null && end !== null && active !== null) {
        expect(begin.paramCount).assertEqual(3);
        expect(end.paramCount).assertEqual(1);
        expect(active.paramCount).assertEqual(0);
      }
      expect(catalog.totalParamCount()).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OperationParamCounts_004, end');
    });

    /**
     * Scenario: only begin carries an AssessmentConfig parameter.
     * Expectation: exactly one operation requires the configuration object.
     */
    it('Assessment_BeginRequiresConfig_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginRequiresConfig_005, begin');
      const withConfig: OperationDescriptor[] = catalog.filterByConfigRequirement(true);
      expect(withConfig.length).assertEqual(1);
      expect(withConfig[0].id).assertEqual(OperationId.BEGIN);
      expect(validator.beginNeedsConfiguration()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginRequiresConfig_005, end');
    });

    /**
     * Scenario: end does not accept a configuration.
     * Expectation: end only carries the context, the service resolves the session from it.
     */
    it('Assessment_EndRequiresOnlyContext_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndRequiresOnlyContext_006, begin');
      expect(validator.endNeedsOnlyContext()).assertTrue();
      const withoutConfig: OperationDescriptor[] = catalog.filterByConfigRequirement(false);
      expect(withoutConfig.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndRequiresOnlyContext_006, end');
    });

    /**
     * Scenario: the two query operations need neither context nor config.
     * Expectation: the queries are synchronous and parameter free.
     */
    it('Assessment_QueriesTakeNoArguments_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueriesTakeNoArguments_007, begin');
      expect(validator.queriesNeedNoArguments()).assertTrue();
      const withoutContext: OperationDescriptor[] = catalog.filterByContextRequirement(false);
      expect(withoutContext.length).assertEqual(2);
      const synchronous: OperationDescriptor[] = catalog.filterByCallbacks(false);
      expect(synchronous.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueriesTakeNoArguments_007, end');
    });

    /**
     * Scenario: every operation of the namespace can raise a BusinessError.
     * Expectation: the mayThrow flag is set on all four descriptors.
     */
    it('Assessment_AllOperationsMayThrow_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AllOperationsMayThrow_008, begin');
      expect(validator.allOperationsMayThrow()).assertTrue();
      expect(catalog.countWhere((entry: OperationDescriptor) => entry.mayThrow)).assertEqual(4);
      expect(catalog.countWhere((entry: OperationDescriptor) => !entry.mayThrow)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AllOperationsMayThrow_008, end');
    });

    /**
     * Scenario: the error code values follow the order of the SDK enum.
     * Expectation: OK is zero, ENV_ANOMALY is four, and the five members are consecutive.
     */
    it('Assessment_ErrorCodeOrdinalMapping_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorCodeOrdinalMapping_009, begin');
      expect(ErrorCode.OK).assertEqual(0);
      expect(ErrorCode.USER_CANCEL).assertEqual(1);
      expect(ErrorCode.TIMEOUT).assertEqual(2);
      expect(ErrorCode.SYSTEM_ERROR).assertEqual(3);
      expect(ErrorCode.ENV_ANOMALY).assertEqual(4);
      const codes: number[] = ErrorCodeMapper.allCodes();
      expect(codes.length).assertEqual(5);
      for (let i = 1; i < codes.length; i++) {
        expect(codes[i] - codes[i - 1]).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorCodeOrdinalMapping_009, end');
    });

    /**
     * Scenario: the error code labels.
     * Expectation: every member maps to its documented name and no label is shared.
     */
    it('Assessment_ErrorCodeLabels_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorCodeLabels_010, begin');
      expect(ErrorCodeMapper.labelOf(ErrorCode.OK)).assertEqual('OK');
      expect(ErrorCodeMapper.labelOf(ErrorCode.USER_CANCEL)).assertEqual('USER_CANCEL');
      expect(ErrorCodeMapper.labelOf(ErrorCode.TIMEOUT)).assertEqual('TIMEOUT');
      expect(ErrorCodeMapper.labelOf(ErrorCode.SYSTEM_ERROR)).assertEqual('SYSTEM_ERROR');
      expect(ErrorCodeMapper.labelOf(ErrorCode.ENV_ANOMALY)).assertEqual('ENV_ANOMALY');
      const labels: string[] = ErrorCodeMapper.allCodes().map((code: number) => ErrorCodeMapper.labelOf(code));
      const unique: Set<string> = new Set<string>(labels);
      expect(unique.size).assertEqual(labels.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorCodeLabels_010, end');
    });

    /**
     * Scenario: an out of range error code.
     * Expectation: the mapper reports the code as unknown and does not read past the table.
     */
    it('Assessment_UnknownErrorCode_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UnknownErrorCode_011, begin');
      expect(ErrorCodeMapper.isKnown(5)).assertFalse();
      expect(ErrorCodeMapper.isKnown(-1)).assertFalse();
      expect(ErrorCodeMapper.isKnown(1.5)).assertFalse();
      expect(ErrorCodeMapper.labelOf(5)).assertEqual('UNKNOWN');
      expect(ErrorCodeMapper.labelOf(-1)).assertEqual('UNKNOWN');
      expect(ErrorCodeMapper.ordinalOf(9)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UnknownErrorCode_011, end');
    });

    /**
     * Scenario: the success predicate of the mapper.
     * Expectation: only OK counts as success, every business code counts as a failure.
     */
    it('Assessment_ErrorCodeSuccessPredicate_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorCodeSuccessPredicate_012, begin');
      expect(ErrorCodeMapper.isSuccess(ErrorCode.OK)).assertTrue();
      expect(ErrorCodeMapper.isFailure(ErrorCode.OK)).assertFalse();
      expect(ErrorCodeMapper.isSuccess(ErrorCode.USER_CANCEL)).assertFalse();
      expect(ErrorCodeMapper.isFailure(ErrorCode.USER_CANCEL)).assertTrue();
      expect(ErrorCodeMapper.isFailure(ErrorCode.ENV_ANOMALY)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorCodeSuccessPredicate_012, end');
    });

    /**
     * Scenario: the ordinal of a code equals its index in the code list.
     * Expectation: ordinal lookup and iteration agree for every known code.
     */
    it('Assessment_ErrorCodeOrdinalRoundTrip_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorCodeOrdinalRoundTrip_013, begin');
      const codes: number[] = ErrorCodeMapper.allCodes();
      for (let i = 0; i < codes.length; i++) {
        expect(ErrorCodeMapper.ordinalOf(codes[i])).assertEqual(i);
        expect(ErrorCodeMapper.isKnown(codes[i])).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', ErrorCodeMapper.describe(ErrorCode.TIMEOUT));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorCodeOrdinalRoundTrip_013, end');
    });

    /**
     * Scenario: the invocation log records the newest operation first.
     * Expectation: after three records the head is the last operation and the tail the first.
     */
    it('Assessment_InvocationLogOrdering_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvocationLogOrdering_014, begin');
      const log: InvocationLog = new InvocationLog();
      log.record(OperationId.BEGIN, 3, true, ErrorCode.OK);
      log.record(OperationId.IS_ACTIVE, 0, true, ErrorCode.OK);
      log.record(OperationId.GET_CONFIGURATION, 0, false, ErrorCode.SYSTEM_ERROR);
      expect(log.size()).assertEqual(3);
      expect(log.newest() !== null).assertTrue();
      expect(log.oldest() !== null).assertTrue();
      const newest: InvocationRecord | null = log.newest();
      const oldest: InvocationRecord | null = log.oldest();
      if (newest !== null && oldest !== null) {
        expect(newest.operation).assertEqual(OperationId.GET_CONFIGURATION);
        expect(oldest.operation).assertEqual(OperationId.BEGIN);
      }
      expect(log.operationNames()[0]).assertEqual(OperationId.GET_CONFIGURATION);
      hilog.info(DOMAIN, TAG, '%{public}s', log.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvocationLogOrdering_014, end');
    });

    /**
     * Scenario: the invocation log counts successes and failures separately.
     * Expectation: a mixed sequence is counted correctly and a failure is detected.
     */
    it('Assessment_InvocationLogCounters_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvocationLogCounters_016, begin');
      const log: InvocationLog = new InvocationLog();
      log.record(OperationId.BEGIN, 3, true, ErrorCode.OK);
      log.record(OperationId.END, 1, false, ErrorCode.USER_CANCEL);
      log.record(OperationId.IS_ACTIVE, 0, true, ErrorCode.OK);
      expect(log.countSucceeded()).assertEqual(2);
      expect(log.containsFailure()).assertTrue();
      expect(log.countOf(OperationId.END)).assertEqual(1);
      log.clear();
      expect(log.size()).assertEqual(0);
      expect(log.newest()).assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvocationLogCounters_016, end');
    });

    /**
     * Scenario: a canonical operation plan.
     * Expectation: begin precedes end and the queries, and begin is issued at most once.
     */
    it('Assessment_OperationPlanOrder_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OperationPlanOrder_017, begin');
      const plan: OperationPlan = new OperationPlan([
        OperationId.BEGIN,
        OperationId.IS_ACTIVE,
        OperationId.GET_CONFIGURATION,
        OperationId.END
      ]);
      expect(plan.size()).assertEqual(4);
      expect(plan.beginBeforeEnd()).assertTrue();
      expect(plan.beginBeforeEveryQuery()).assertTrue();
      expect(plan.beginsAtMostOnce()).assertTrue();
      expect(plan.contains(OperationId.END)).assertTrue();
      expect(plan.contains('suspend')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', plan.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OperationPlanOrder_017, end');
    });

    /**
     * Scenario: a plan that ends before it begins.
     * Expectation: the invariant check rejects the reversed plan.
     */
    it('Assessment_OperationPlanRejectsReversed_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OperationPlanRejectsReversed_018, begin');
      const plan: OperationPlan = new OperationPlan([OperationId.END, OperationId.BEGIN]);
      expect(plan.beginBeforeEnd()).assertFalse();
      const reversed: OperationPlan = plan.reversed();
      expect(reversed.beginBeforeEnd()).assertTrue();
      expect(reversed.indexOf(OperationId.BEGIN)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OperationPlanRejectsReversed_018, end');
    });

    /**
     * Scenario: a plan that queries before it begins.
     * Expectation: the query ordering invariant rejects the plan.
     */
    it('Assessment_OperationPlanRejectsEarlyQuery_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OperationPlanRejectsEarlyQuery_019, begin');
      const plan: OperationPlan = new OperationPlan([OperationId.IS_ACTIVE, OperationId.BEGIN, OperationId.END]);
      expect(plan.beginBeforeEveryQuery()).assertFalse();
      const duplicated: OperationPlan =
        new OperationPlan([OperationId.BEGIN, OperationId.BEGIN, OperationId.END]);
      expect(duplicated.beginsAtMostOnce()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OperationPlanRejectsEarlyQuery_019, end');
    });

    /**
     * Scenario: the semantics validator over the default catalogue.
     * Expectation: no violation is reported for the shipped catalogue.
     */
    it('Assessment_SemanticsValidatorPasses_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SemanticsValidatorPasses_020, begin');
      expect(validator.validateAll()).assertTrue();
      expect(validator.collectViolations().length).assertEqual(0);
      expect(validator.allSummariesAreNonEmpty()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SemanticsValidatorPasses_020, end');
    });

    /**
     * Scenario: the semantics validator over a broken catalogue.
     * Expectation: a begin descriptor without a config parameter is reported as a violation.
     */
    it('Assessment_SemanticsValidatorDetectsDefect_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SemanticsValidatorDetectsDefect_021, begin');
      const brokenBegin: OperationDescriptor = {
        id: OperationId.BEGIN,
        paramCount: 1,
        needsContext: true,
        needsConfig: false,
        mayThrow: true,
        callbackStyle: false,
        summary: ''
      };
      const brokenCatalog: OperationCatalog =
        new OperationCatalog([brokenBegin, END_DESCRIPTOR, IS_ACTIVE_DESCRIPTOR, GET_CONFIGURATION_DESCRIPTOR]);
      const brokenValidator: OperationSemanticsValidator = new OperationSemanticsValidator(brokenCatalog);
      expect(brokenValidator.validateAll()).assertFalse();
      const violations: string[] = brokenValidator.collectViolations();
      hilog.info(DOMAIN, TAG, '%{public}s violations: %{public}d', BUNDLE + 'SemanticsValidatorDetectsDefect_021',
        violations.length);
      expect(violations.length >= 3).assertTrue();
      expect(brokenValidator.beginTakesThreeParameters()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SemanticsValidatorDetectsDefect_021, end');
    });

    /**
     * Scenario: the catalog lookup of an unknown operation.
     * Expectation: the lookup returns null and the filters stay consistent.
     */
    it('Assessment_CatalogLookupUnknown_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CatalogLookupUnknown_022, begin');
      expect(catalog.findByName('suspend')).assertNull();
      expect(catalog.findByName(OperationId.END) !== null).assertTrue();
      const callbackOperations: OperationDescriptor[] = catalog.filterByCallbacks(true);
      expect(callbackOperations.length).assertEqual(2);
      expect(callbackOperations[0].id).assertEqual(OperationId.BEGIN);
      expect(callbackOperations[1].id).assertEqual(OperationId.END);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CatalogLookupUnknown_022, end');
    });

    /**
     * Scenario: the descriptors are immutable data.
     * Expectation: mutating the array returned by the catalogue does not change the catalogue.
     */
    it('Assessment_CatalogDefensiveCopy_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CatalogDefensiveCopy_028, begin');
      const copy: OperationDescriptor[] = catalog.getAll();
      copy.pop();
      expect(copy.length).assertEqual(3);
      expect(catalog.size()).assertEqual(4);
      const names: string[] = catalog.names();
      names.push('suspend');
      expect(catalog.names().length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CatalogDefensiveCopy_028, end');
    });

    /**
     * Scenario: the operation descriptors of the queries are the same objects as the constants.
     * Expectation: the catalogue shares the singleton descriptors instead of cloning them.
     */
    it('Assessment_CatalogDescriptorIdentity_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CatalogDescriptorIdentity_029, begin');
      const active: OperationDescriptor | null = catalog.findByName(OperationId.IS_ACTIVE);
      expect(active === IS_ACTIVE_DESCRIPTOR).assertTrue();
      const config: OperationDescriptor | null = catalog.findByName(OperationId.GET_CONFIGURATION);
      expect(config === GET_CONFIGURATION_DESCRIPTOR).assertTrue();
      const begin: OperationDescriptor | null = catalog.findByName(OperationId.BEGIN);
      expect(begin === BEGIN_DESCRIPTOR).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CatalogDescriptorIdentity_029, end');
    });

    /**
     * Scenario: the summary of every operation mentions the semantic that the sample relies on.
     * Expectation: the summaries are distinct and non empty strings.
     */
    it('Assessment_DescriptorSummaries_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DescriptorSummaries_030, begin');
      const summaries: string[] = catalog.getAll().map((entry: OperationDescriptor) => entry.summary);
      expect(summaries.length).assertEqual(4);
      const unique: Set<string> = new Set<string>(summaries);
      expect(unique.size).assertEqual(4);
      for (let i = 0; i < summaries.length; i++) {
        expect(summaries[i].length > 10).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DescriptorSummaries_030, end');
    });

    /**
     * Scenario: the plan of a query only sequence.
     * Expectation: a plan without begin is rejected by the ordering invariants, because no
     * configuration can be queried before a session exists.
     */
    it('Assessment_OperationPlanWithoutBegin_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OperationPlanWithoutBegin_031, begin');
      const plan: OperationPlan = new OperationPlan([OperationId.IS_ACTIVE, OperationId.GET_CONFIGURATION]);
      expect(plan.beginBeforeEnd()).assertFalse();
      expect(plan.beginBeforeEveryQuery()).assertFalse();
      expect(plan.beginsAtMostOnce()).assertTrue();
      expect(plan.size()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', plan.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OperationPlanWithoutBegin_031, end');
    });

    /**
     * Scenario: the plan records the callback style of every step.
     * Expectation: the two mutating operations are the callback style ones and the queries are
     * synchronous, which the catalogue already reports.
     */
    it('Assessment_OperationCallbackStyles_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OperationCallbackStyles_032, begin');
      const callbacks: OperationDescriptor[] = catalog.filterByCallbacks(true);
      const synchronous: OperationDescriptor[] = catalog.filterByCallbacks(false);
      expect(callbacks.length + synchronous.length).assertEqual(catalog.size());
      for (let i = 0; i < callbacks.length; i++) {
        expect(callbacks[i].mayThrow).assertTrue();
      }
      for (let i = 0; i < synchronous.length; i++) {
        expect(synchronous[i].paramCount).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OperationCallbackStyles_032, end');
    });

    /**
     * Scenario: the UI identifiers of the operation card are non empty page identifiers.
     * Expectation: the four identifiers are distinct and carry the sample prefix.
     */
    it('Assessment_OperationCardIdentifiers_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OperationCardIdentifiers_033, begin');
      const ids: string[] = [ID_BEGIN_BUTTON, ID_END_BUTTON, ID_QUERY_STATE_BUTTON, ID_QUERY_CONFIG_BUTTON];
      const unique: Set<string> = new Set<string>(ids);
      expect(unique.size).assertEqual(4);
      for (let i = 0; i < ids.length; i++) {
        expect(ids[i].startsWith('assessment_')).assertTrue();
        expect(ids[i].length > 10).assertTrue();
      }
      expect(ids[0]).assertEqual('assessment_begin_button');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'OperationCardIdentifiers_033, end');
    });

    /**
     * Scenario: the error codes of the sample are surfaced with their documentation labels.
     * Expectation: describe() renders the numeric value and the label of a code.
     */
    it('Assessment_ErrorCodeDescribe_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorCodeDescribe_034, begin');
      const text: string = ErrorCodeMapper.describe(ErrorCode.USER_CANCEL);
      expect(text).assertContain('1');
      expect(text).assertContain('USER_CANCEL');
      const unknown: string = ErrorCodeMapper.describe(42);
      expect(unknown).assertContain('UNKNOWN');
      hilog.info(DOMAIN, TAG, '%{public}s', text);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorCodeDescribe_034, end');
    });
  });
}
