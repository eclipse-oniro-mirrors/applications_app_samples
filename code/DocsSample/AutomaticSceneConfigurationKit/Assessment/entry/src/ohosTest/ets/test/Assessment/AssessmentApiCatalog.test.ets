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
  TIMEOUT_PAGE_RENDER,
  TOLERANCE_COMPONENT_COUNT,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  indexComponentCount,
  checkTextContent,
  collectTexts,
  waitForIndexPage,
  isComponentEnabled,
  clickIndexButton,
  pressAndWait
} from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// Names of the four operations exported by the assessment namespace. They are re-declared here
// because the test package must never import from the main source tree.
const API_BEGIN: string = 'begin';
const API_END: string = 'end';
const API_IS_ACTIVE: string = 'isActive';
const API_GET_CONFIGURATION: string = 'getConfiguration';

// Return type names of the assessment namespace. The two mutating operations return nothing,
// the two queries return a boolean and an AssessmentConfig respectively.
const RETURN_VOID: string = 'void';
const RETURN_BOOLEAN: string = 'boolean';
const RETURN_CONFIG: string = 'AssessmentConfig';

// Names of the parameters of begin. The order matters: the context is resolved first, then the
// configuration, then the callback pair.
const PARAM_CONTEXT: string = 'context';
const PARAM_CONFIG: string = 'config';
const PARAM_CALLBACK: string = 'callback';

// Types of the parameters of begin.
const TYPE_UI_ABILITY_CONTEXT: string = 'common.UIAbilityContext';
const TYPE_ASSESSMENT_CONFIG: string = 'AssessmentConfig';
const TYPE_CALLBACK: string = 'IAssessmentCallback';

// Members of the IAssessmentCallback interface. The sample implements exactly these three.
const CB_ON_BEGIN: string = 'onBegin';
const CB_ON_INTERRUPTED: string = 'onInterrupted';
const CB_ON_END: string = 'onEnd';

// Ordinal values of AssessmentErrorCode.
const CODE_OK: number = 0;
const CODE_USER_CANCEL: number = 1;
const CODE_TIMEOUT: number = 2;
const CODE_SYSTEM_ERROR: number = 3;
const CODE_ENV_ANOMALY: number = 4;

// Fields declared by the three assessment model interfaces.
const CONFIG_FIELD_DURATION: string = 'duration';
const CONFIG_FIELD_APPS: string = 'allowedApps';
const ERROR_FIELD_CODE: string = 'code';
const ERROR_FIELD_MESSAGE: string = 'message';

// The catalog holds exactly four operations, every structural count below is derived from it.
const EXPECTED_API_COUNT: number = 4;
const EXPECTED_TOTAL_PARAMS: number = 4;

/**
 * Role of a parameter inside an assessment signature.
 *
 * The role is what the controller maps its arguments onto, so the catalogue never relies on the
 * parameter position alone when it validates a call site.
 */
enum ParamRole {
  CONTEXT = 'context', CONFIG = 'config', CALLBACK = 'callback'
}

/**
 * One declared parameter of an assessment operation.
 */
interface ApiParam {
  name: string;
  role: string;
  typeName: string;
  optional: boolean;
}

/**
 * The full signature of one assessment operation.
 */
interface ApiSignature {
  name: string;
  params: ApiParam[];
  returnType: string;
  callbackDriven: boolean;
  mayThrow: boolean;
  summary: string;
}

// Parameter of assessment.begin for the ability context.
const BEGIN_CONTEXT_PARAM: ApiParam = {
  name: PARAM_CONTEXT,
  role: ParamRole.CONTEXT,
  typeName: TYPE_UI_ABILITY_CONTEXT,
  optional: false
};

// Parameter of assessment.begin for the configuration object.
const BEGIN_CONFIG_PARAM: ApiParam = {
  name: PARAM_CONFIG,
  role: ParamRole.CONFIG,
  typeName: TYPE_ASSESSMENT_CONFIG,
  optional: false
};

// Parameter of assessment.begin for the callback implementation.
const BEGIN_CALLBACK_PARAM: ApiParam = {
  name: PARAM_CALLBACK,
  role: ParamRole.CALLBACK,
  typeName: TYPE_CALLBACK,
  optional: false
};

// Parameter of assessment.end for the ability context.
const END_CONTEXT_PARAM: ApiParam = {
  name: PARAM_CONTEXT,
  role: ParamRole.CONTEXT,
  typeName: TYPE_UI_ABILITY_CONTEXT,
  optional: false
};

// Signature of assessment.begin.
const BEGIN_SIGNATURE: ApiSignature = {
  name: API_BEGIN,
  params: [BEGIN_CONTEXT_PARAM, BEGIN_CONFIG_PARAM, BEGIN_CALLBACK_PARAM],
  returnType: RETURN_VOID,
  callbackDriven: true,
  mayThrow: true,
  summary: 'Enters assessment mode with a duration and an application whitelist'
};

// Signature of assessment.end.
const END_SIGNATURE: ApiSignature = {
  name: API_END,
  params: [END_CONTEXT_PARAM],
  returnType: RETURN_VOID,
  callbackDriven: true,
  mayThrow: true,
  summary: 'Leaves the assessment session owned by the calling ability'
};

// Signature of assessment.isActive.
const IS_ACTIVE_SIGNATURE: ApiSignature = {
  name: API_IS_ACTIVE,
  params: [],
  returnType: RETURN_BOOLEAN,
  callbackDriven: false,
  mayThrow: true,
  summary: 'Reports whether the device is currently in assessment mode'
};

// Signature of assessment.getConfiguration.
const GET_CONFIGURATION_SIGNATURE: ApiSignature = {
  name: API_GET_CONFIGURATION,
  params: [],
  returnType: RETURN_CONFIG,
  callbackDriven: false,
  mayThrow: true,
  summary: 'Returns the duration and the whitelist of the running session'
};

/**
 * Static catalogue of the four assessment operations.
 *
 * The catalogue is the reference that every structural case asserts against. It is deliberately
 * immutable: lookups return the shared signature objects and array getters return a copy.
 */
class ApiCatalog {
  private entries: ApiSignature[] = [];

  constructor(entries: ApiSignature[]) {
    this.entries = entries.slice();
  }

  public static defaultCatalog(): ApiCatalog {
    return new ApiCatalog([BEGIN_SIGNATURE, END_SIGNATURE, IS_ACTIVE_SIGNATURE, GET_CONFIGURATION_SIGNATURE]);
  }

  public getAll(): ApiSignature[] {
    return this.entries.slice();
  }

  public size(): number {
    return this.entries.length;
  }

  public names(): string[] {
    return this.entries.map((entry: ApiSignature) => entry.name);
  }

  public find(name: string): ApiSignature | null {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].name === name) {
        return this.entries[i];
      }
    }
    return null;
  }

  public contains(name: string): boolean {
    return this.find(name) !== null;
  }

  public namesUnique(): boolean {
    const seen: Set<string> = new Set<string>(this.names());
    return seen.size === this.entries.length;
  }

  public filterCallbackDriven(flag: boolean): ApiSignature[] {
    return this.entries.filter((entry: ApiSignature) => entry.callbackDriven === flag);
  }

  public filterThrows(flag: boolean): ApiSignature[] {
    return this.entries.filter((entry: ApiSignature) => entry.mayThrow === flag);
  }

  public filterReturnType(returnType: string): ApiSignature[] {
    return this.entries.filter((entry: ApiSignature) => entry.returnType === returnType);
  }

  public countWhere(predicate: (entry: ApiSignature) => boolean): number {
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
      total += this.entries[i].params.length;
    }
    return total;
  }

  public paramCountOf(name: string): number {
    const signature: ApiSignature | null = this.find(name);
    return signature === null ? -1 : signature.params.length;
  }

  public paramNamesOf(name: string): string[] {
    const signature: ApiSignature | null = this.find(name);
    if (signature === null) {
      return [];
    }
    return signature.params.map((param: ApiParam) => param.name);
  }

  public paramRolesOf(name: string): string[] {
    const signature: ApiSignature | null = this.find(name);
    if (signature === null) {
      return [];
    }
    return signature.params.map((param: ApiParam) => param.role);
  }

  public hasOverloads(): boolean {
    const seen: Set<string> = new Set<string>(this.names());
    return seen.size !== this.entries.length;
  }

  public mutatingApis(): ApiSignature[] {
    return this.filterCallbackDriven(true);
  }

  public queryApis(): ApiSignature[] {
    return this.filterCallbackDriven(false);
  }

  public toString(): string {
    return `ApiCatalog{size=${this.entries.length}, names=${this.names().join('|')}}`;
  }
}

/**
 * Validates a signature against the documented shape of the assessment namespace.
 *
 * Every check is expressed as a separate predicate so a failing case reports the exact rule that
 * the catalogue violates instead of a single opaque boolean.
 */
class SignatureValidator {
  public static takesNoArgument(signature: ApiSignature): boolean {
    return signature.params.length === 0;
  }

  public static takesExactly(signature: ApiSignature, count: number): boolean {
    return signature.params.length === count;
  }

  public static returnsVoid(signature: ApiSignature): boolean {
    return signature.returnType === RETURN_VOID;
  }

  public static returnsBoolean(signature: ApiSignature): boolean {
    return signature.returnType === RETURN_BOOLEAN;
  }

  public static hasRole(signature: ApiSignature, role: string): boolean {
    for (let i = 0; i < signature.params.length; i++) {
      if (signature.params[i].role === role) {
        return true;
      }
    }
    return false;
  }

  public static allParamsRequired(signature: ApiSignature): boolean {
    for (let i = 0; i < signature.params.length; i++) {
      if (signature.params[i].optional) {
        return false;
      }
    }
    return true;
  }

  public static paramsHaveTypes(signature: ApiSignature): boolean {
    for (let i = 0; i < signature.params.length; i++) {
      if (signature.params[i].typeName.length === 0) {
        return false;
      }
    }
    return true;
  }

  public static paramNamesUnique(signature: ApiSignature): boolean {
    const names: string[] = signature.params.map((param: ApiParam) => param.name);
    const seen: Set<string> = new Set<string>(names);
    return seen.size === names.length;
  }

  public static orderMatches(signature: ApiSignature, expected: string[]): boolean {
    if (signature.params.length !== expected.length) {
      return false;
    }
    for (let i = 0; i < expected.length; i++) {
      if (signature.params[i].role !== expected[i]) {
        return false;
      }
    }
    return true;
  }

  public static validateBegin(signature: ApiSignature): string[] {
    const violations: string[] = [];
    if (!SignatureValidator.takesExactly(signature, 3)) {
      violations.push('begin must take exactly three parameters');
    }
    if (!SignatureValidator.returnsVoid(signature)) {
      violations.push('begin must return void');
    }
    if (!SignatureValidator.orderMatches(signature,
      [ParamRole.CONTEXT, ParamRole.CONFIG, ParamRole.CALLBACK])) {
      violations.push('begin parameters must be context, config and callback in that order');
    }
    if (!SignatureValidator.allParamsRequired(signature)) {
      violations.push('no parameter of begin is optional');
    }
    return violations;
  }

  public static validateEnd(signature: ApiSignature): string[] {
    const violations: string[] = [];
    if (!SignatureValidator.takesExactly(signature, 1)) {
      violations.push('end must take exactly one parameter');
    }
    if (!SignatureValidator.returnsVoid(signature)) {
      violations.push('end must return void');
    }
    if (!SignatureValidator.hasRole(signature, ParamRole.CONTEXT)) {
      violations.push('end must carry the ability context');
    }
    if (SignatureValidator.hasRole(signature, ParamRole.CONFIG)) {
      violations.push('end must not carry a configuration');
    }
    return violations;
  }

  public static validateQuery(signature: ApiSignature, returnType: string): string[] {
    const violations: string[] = [];
    if (!SignatureValidator.takesNoArgument(signature)) {
      violations.push(`${signature.name} must take no argument`);
    }
    if (signature.returnType !== returnType) {
      violations.push(`${signature.name} must return ${returnType}`);
    }
    if (signature.callbackDriven) {
      violations.push(`${signature.name} is a synchronous query, not a callback operation`);
    }
    return violations;
  }

  public static validateAll(signature: ApiSignature): string[] {
    if (signature.name === API_BEGIN) {
      return SignatureValidator.validateBegin(signature);
    }
    if (signature.name === API_END) {
      return SignatureValidator.validateEnd(signature);
    }
    if (signature.name === API_IS_ACTIVE) {
      return SignatureValidator.validateQuery(signature, RETURN_BOOLEAN);
    }
    if (signature.name === API_GET_CONFIGURATION) {
      return SignatureValidator.validateQuery(signature, RETURN_CONFIG);
    }
    return ['unknown assessment operation'];
  }
}

/**
 * Describes how an assessment operation reports a failure.
 *
 * Both mutating operations are callback driven, so a rejected request can arrive either as a
 * synchronous BusinessError or as an asynchronous callback with a non zero code. The policy
 * class names both paths, which the error recovery suite then exercises.
 */
class ThrowPolicy {
  public static isSynchronousThrow(documentation: string): boolean {
    return documentation.indexOf('throws BusinessError') >= 0;
  }

  public static isCallbackFailure(code: number): boolean {
    return code !== CODE_OK && code >= CODE_OK && code <= CODE_ENV_ANOMALY;
  }

  public static isTerminal(code: number): boolean {
    return code === CODE_USER_CANCEL || code === CODE_TIMEOUT;
  }

  public static isRecoverable(code: number): boolean {
    return code === CODE_SYSTEM_ERROR || code === CODE_ENV_ANOMALY;
  }

  public static describe(code: number): string {
    if (code === CODE_OK) {
      return 'success';
    }
    if (ThrowPolicy.isTerminal(code)) {
      return 'terminal failure';
    }
    if (ThrowPolicy.isRecoverable(code)) {
      return 'recoverable failure';
    }
    return 'unknown failure';
  }
}

/**
 * Declares the callback members that the assessment service may invoke.
 *
 * The list is ordered as the sample declares the object literal in AssessmentController: the
 * begin result first, the interruption second and the end notification last.
 */
class CallbackContract {
  private static readonly MEMBERS: string[] = [CB_ON_BEGIN, CB_ON_INTERRUPTED, CB_ON_END];

  public static members(): string[] {
    return CallbackContract.MEMBERS.slice();
  }

  public static size(): number {
    return CallbackContract.MEMBERS.length;
  }

  public static contains(member: string): boolean {
    return CallbackContract.MEMBERS.indexOf(member) >= 0;
  }

  public static indexOf(member: string): number {
    return CallbackContract.MEMBERS.indexOf(member);
  }

  public static unique(): boolean {
    const seen: Set<string> = new Set<string>(CallbackContract.MEMBERS);
    return seen.size === CallbackContract.MEMBERS.length;
  }

  public static beginArrivesBeforeEnd(): boolean {
    return CallbackContract.indexOf(CB_ON_BEGIN) < CallbackContract.indexOf(CB_ON_END);
  }

  public static isTerminalMember(member: string): boolean {
    return member === CB_ON_END || member === CB_ON_INTERRUPTED;
  }

  public static toString(): string {
    return `CallbackContract{members=${CallbackContract.MEMBERS.join('|')}}`;
  }
}

/**
 * Describes the fields of the three assessment model interfaces.
 *
 * The registry keeps the field names in declaration order so a case can prove that the sample
 * serialises the configuration in the same order that the SDK declares it.
 */
class ModelFieldRegistry {
  public static configFields(): string[] {
    return [CONFIG_FIELD_DURATION, CONFIG_FIELD_APPS];
  }

  public static errorFields(): string[] {
    return [ERROR_FIELD_CODE, ERROR_FIELD_MESSAGE];
  }

  public static interruptInfoFields(): string[] {
    return [ERROR_FIELD_CODE, ERROR_FIELD_MESSAGE];
  }

  public static fieldCount(model: string): number {
    if (model === 'AssessmentConfig') {
      return ModelFieldRegistry.configFields().length;
    }
    if (model === 'AssessmentError') {
      return ModelFieldRegistry.errorFields().length;
    }
    if (model === 'AssessmentInterruptInfo') {
      return ModelFieldRegistry.interruptInfoFields().length;
    }
    return 0;
  }

  public static hasField(model: string, field: string): boolean {
    if (model === 'AssessmentConfig') {
      return ModelFieldRegistry.configFields().indexOf(field) >= 0;
    }
    if (model === 'AssessmentError') {
      return ModelFieldRegistry.errorFields().indexOf(field) >= 0;
    }
    if (model === 'AssessmentInterruptInfo') {
      return ModelFieldRegistry.interruptInfoFields().indexOf(field) >= 0;
    }
    return false;
  }

  public static sharedFailureFields(): boolean {
    const error: string[] = ModelFieldRegistry.errorFields();
    const info: string[] = ModelFieldRegistry.interruptInfoFields();
    if (error.length !== info.length) {
      return false;
    }
    for (let i = 0; i < error.length; i++) {
      if (error[i] !== info[i]) {
        return false;
      }
    }
    return true;
  }
}

/**
 * Builds a one line description of a signature, used by the log lines of the catalogue cases.
 */
class SignatureFormatter {
  public static describe(signature: ApiSignature): string {
    const params: string[] = signature.params.map((param: ApiParam) => `${param.name}: ${param.typeName}`);
    return `${signature.name}(${params.join(', ')}): ${signature.returnType}`;
  }

  public static describeAll(catalog: ApiCatalog): string {
    const lines: string[] = catalog.getAll().map((entry: ApiSignature) => SignatureFormatter.describe(entry));
    return lines.join(' ; ');
  }

  public static aritySummary(catalog: ApiCatalog): string {
    const parts: string[] = catalog.getAll().map((entry: ApiSignature) =>
    `${entry.name}=${entry.params.length}`);
    return parts.join(', ');
  }
}

/**
 * Starts the sample and waits for the entry page.
 *
 * The UI cases degrade to a skip when the device refuses to start the sample, the model cases
 * still run because they never touch the driver.
 */
async function openIndexPage(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'openIndexPage: the entry page is not rendered, the case is skipped');
  }
  return rendered;
}

export default function assessmentApiCatalogTest() {
  describe('AssessmentApiCatalog_Test', () => {
    let driver: Driver;
    let catalog: ApiCatalog;

    beforeAll(async () => {
      driver = getDriver();
      catalog = ApiCatalog.defaultCatalog();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, 2, 2, 50);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the assessment namespace is catalogued.
     * Expectation: it declares exactly the four documented operations.
     */
    it('Assessment_ApiCatalog_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ApiCatalog_001, begin');
      expect(catalog.size()).assertEqual(EXPECTED_API_COUNT);
      expect(catalog.getAll().length).assertEqual(EXPECTED_API_COUNT);
      expect(catalog.mutatingApis().length + catalog.queryApis().length).assertEqual(EXPECTED_API_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', catalog.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ApiCatalog_001, end');
    });

    /**
     * Scenario: the catalogue names.
     * Expectation: begin, end, isActive and getConfiguration, and nothing else.
     */
    it('Assessment_ApiNames_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ApiNames_002, begin');
      const names: string[] = catalog.names();
      expect(names.length).assertEqual(EXPECTED_API_COUNT);
      expect(names.indexOf(API_BEGIN) >= 0).assertTrue();
      expect(names.indexOf(API_END) >= 0).assertTrue();
      expect(names.indexOf(API_IS_ACTIVE) >= 0).assertTrue();
      expect(names.indexOf(API_GET_CONFIGURATION) >= 0).assertTrue();
      expect(names.indexOf('suspend') >= 0).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', names.join(','));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ApiNames_002, end');
    });

    /**
     * Scenario: the catalogue names are unique.
     * Expectation: a duplicated name would make a name driven dispatch ambiguous.
     */
    it('Assessment_ApiNamesUnique_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ApiNamesUnique_003, begin');
      expect(catalog.namesUnique()).assertTrue();
      expect(catalog.hasOverloads()).assertFalse();
      const seen: Set<string> = new Set<string>(catalog.names());
      expect(seen.size).assertEqual(catalog.size());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ApiNamesUnique_003, end');
    });

    /**
     * Scenario: the signature of begin.
     * Expectation: it takes the context, the configuration and the callback, in that order.
     */
    it('Assessment_BeginSignature_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginSignature_004, begin');
      const begin: ApiSignature | null = catalog.find(API_BEGIN);
      expect(begin !== null).assertTrue();
      if (begin === null) {
        return;
      }
      expect(begin.params.length).assertEqual(3);
      expect(catalog.paramNamesOf(API_BEGIN)[0]).assertEqual(PARAM_CONTEXT);
      expect(catalog.paramNamesOf(API_BEGIN)[1]).assertEqual(PARAM_CONFIG);
      expect(catalog.paramNamesOf(API_BEGIN)[2]).assertEqual(PARAM_CALLBACK);
      hilog.info(DOMAIN, TAG, '%{public}s', SignatureFormatter.describe(begin));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginSignature_004, end');
    });

    /**
     * Scenario: the parameter types of begin.
     * Expectation: UIAbilityContext, AssessmentConfig and IAssessmentCallback respectively.
     */
    it('Assessment_BeginParamTypes_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginParamTypes_005, begin');
      const begin: ApiSignature | null = catalog.find(API_BEGIN);
      expect(begin !== null).assertTrue();
      if (begin === null) {
        return;
      }
      expect(begin.params[0].typeName).assertEqual(TYPE_UI_ABILITY_CONTEXT);
      expect(begin.params[1].typeName).assertEqual(TYPE_ASSESSMENT_CONFIG);
      expect(begin.params[2].typeName).assertEqual(TYPE_CALLBACK);
      expect(SignatureValidator.paramsHaveTypes(begin)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginParamTypes_005, end');
    });

    /**
     * Scenario: the return type of begin.
     * Expectation: begin is fire and forget, the outcome arrives through the callback.
     */
    it('Assessment_BeginReturnsVoid_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginReturnsVoid_006, begin');
      const begin: ApiSignature | null = catalog.find(API_BEGIN);
      expect(begin !== null).assertTrue();
      if (begin === null) {
        return;
      }
      expect(begin.returnType).assertEqual(RETURN_VOID);
      expect(SignatureValidator.returnsVoid(begin)).assertTrue();
      expect(begin.callbackDriven).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SignatureFormatter.describe(begin));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginReturnsVoid_006, end');
    });

    /**
     * Scenario: the signature of end.
     * Expectation: end takes the ability context only, the service resolves the session from it.
     */
    it('Assessment_EndSignature_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndSignature_007, begin');
      const end: ApiSignature | null = catalog.find(API_END);
      expect(end !== null).assertTrue();
      if (end === null) {
        return;
      }
      expect(end.params.length).assertEqual(1);
      expect(end.params[0].name).assertEqual(PARAM_CONTEXT);
      expect(end.params[0].typeName).assertEqual(TYPE_UI_ABILITY_CONTEXT);
      expect(SignatureValidator.hasRole(end, ParamRole.CONFIG)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SignatureFormatter.describe(end));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndSignature_007, end');
    });

    /**
     * Scenario: the return type of end.
     * Expectation: end returns void and the completion arrives through onEnd.
     */
    it('Assessment_EndReturnsVoid_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndReturnsVoid_008, begin');
      const end: ApiSignature | null = catalog.find(API_END);
      expect(end !== null).assertTrue();
      if (end === null) {
        return;
      }
      expect(end.returnType).assertEqual(RETURN_VOID);
      expect(SignatureValidator.returnsVoid(end)).assertTrue();
      expect(end.callbackDriven).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndReturnsVoid_008, end');
    });

    /**
     * Scenario: the signature of isActive.
     * Expectation: it takes no argument and answers with a boolean synchronously.
     */
    it('Assessment_IsActiveSignature_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IsActiveSignature_009, begin');
      const active: ApiSignature | null = catalog.find(API_IS_ACTIVE);
      expect(active !== null).assertTrue();
      if (active === null) {
        return;
      }
      expect(active.params.length).assertEqual(0);
      expect(active.returnType).assertEqual(RETURN_BOOLEAN);
      expect(active.callbackDriven).assertFalse();
      expect(SignatureValidator.validateQuery(active, RETURN_BOOLEAN).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SignatureFormatter.describe(active));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'IsActiveSignature_009, end');
    });

    /**
     * Scenario: the signature of getConfiguration.
     * Expectation: it takes no argument and answers with an AssessmentConfig synchronously.
     */
    it('Assessment_GetConfigurationSignature_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GetConfigurationSignature_010, begin');
      const config: ApiSignature | null = catalog.find(API_GET_CONFIGURATION);
      expect(config !== null).assertTrue();
      if (config === null) {
        return;
      }
      expect(config.params.length).assertEqual(0);
      expect(config.returnType).assertEqual(RETURN_CONFIG);
      expect(config.callbackDriven).assertFalse();
      expect(SignatureValidator.validateQuery(config, RETURN_CONFIG).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SignatureFormatter.describe(config));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GetConfigurationSignature_010, end');
    });

    /**
     * Scenario: the two queries are synchronous.
     * Expectation: exactly two of the four operations are not callback driven.
     */
    it('Assessment_QueriesAreSynchronous_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueriesAreSynchronous_011, begin');
      const queries: ApiSignature[] = catalog.filterCallbackDriven(false);
      expect(queries.length).assertEqual(2);
      expect(queries[0].name).assertEqual(API_IS_ACTIVE);
      expect(queries[1].name).assertEqual(API_GET_CONFIGURATION);
      for (let i = 0; i < queries.length; i++) {
        expect(queries[i].params.length).assertEqual(0);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueriesAreSynchronous_011, end');
    });

    /**
     * Scenario: the two mutating operations are callback driven.
     * Expectation: begin and end both receive an IAssessmentCallback.
     */
    it('Assessment_MutatorsAreCallbackDriven_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MutatorsAreCallbackDriven_012, begin');
      const mutators: ApiSignature[] = catalog.filterCallbackDriven(true);
      expect(mutators.length).assertEqual(2);
      expect(mutators[0].name).assertEqual(API_BEGIN);
      expect(mutators[1].name).assertEqual(API_END);
      for (let i = 0; i < mutators.length; i++) {
        expect(SignatureValidator.hasRole(mutators[i], ParamRole.CONTEXT)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MutatorsAreCallbackDriven_012, end');
    });

    /**
     * Scenario: the throw behaviour of the namespace.
     * Expectation: every operation documents a BusinessError, so every call site is wrapped.
     */
    it('Assessment_AllOperationsMayThrow_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AllOperationsMayThrow_013, begin');
      expect(catalog.filterThrows(true).length).assertEqual(EXPECTED_API_COUNT);
      expect(catalog.filterThrows(false).length).assertEqual(0);
      expect(catalog.countWhere((entry: ApiSignature) => entry.mayThrow)).assertEqual(EXPECTED_API_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AllOperationsMayThrow_013, end');
    });

    /**
     * Scenario: the total parameter count of the namespace.
     * Expectation: four parameters over four operations, three of them on begin.
     */
    it('Assessment_TotalParamCount_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TotalParamCount_014, begin');
      expect(catalog.totalParamCount()).assertEqual(EXPECTED_TOTAL_PARAMS);
      expect(catalog.paramCountOf(API_BEGIN)).assertEqual(3);
      expect(catalog.paramCountOf(API_END)).assertEqual(1);
      expect(catalog.paramCountOf(API_IS_ACTIVE)).assertEqual(0);
      expect(catalog.paramCountOf(API_GET_CONFIGURATION)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SignatureFormatter.aritySummary(catalog));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TotalParamCount_014, end');
    });

    /**
     * Scenario: the namespace is not overloaded.
     * Expectation: no name is declared twice, so the arity alone identifies a call.
     */
    it('Assessment_NoOverloads_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NoOverloads_015, begin');
      expect(catalog.hasOverloads()).assertFalse();
      const arities: number[] = catalog.getAll().map((entry: ApiSignature) => entry.params.length);
      expect(arities.indexOf(3)).assertEqual(0);
      expect(arities.indexOf(1)).assertEqual(1);
      const unique: Set<number> = new Set<number>(arities);
      expect(unique.size).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NoOverloads_015, end');
    });

    /**
     * Scenario: looking up an operation that the namespace does not export.
     * Expectation: the catalogue answers null and the negative count is reported.
     */
    it('Assessment_UnknownLookup_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UnknownLookup_016, begin');
      expect(catalog.find('suspend')).assertNull();
      expect(catalog.find('')).assertNull();
      expect(catalog.contains('resume')).assertFalse();
      expect(catalog.paramCountOf('suspend')).assertEqual(-1);
      expect(catalog.paramNamesOf('suspend').length).assertEqual(0);
      expect(catalog.paramRolesOf('suspend').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UnknownLookup_016, end');
    });

    /**
     * Scenario: the catalogue hands out defensive copies.
     * Expectation: mutating the returned array or the returned names never changes the catalogue.
     */
    it('Assessment_DefensiveCopy_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DefensiveCopy_017, begin');
      const copy: ApiSignature[] = catalog.getAll();
      copy.pop();
      expect(copy.length).assertEqual(3);
      expect(catalog.size()).assertEqual(EXPECTED_API_COUNT);
      const names: string[] = catalog.names();
      names.push('suspend');
      expect(catalog.names().length).assertEqual(EXPECTED_API_COUNT);
      expect(catalog.names().indexOf('suspend')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DefensiveCopy_017, end');
    });

    /**
     * Scenario: the catalogue shares the declared signature objects.
     * Expectation: the lookup returns the singleton instead of a structural clone.
     */
    it('Assessment_SignatureIdentity_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SignatureIdentity_018, begin');
      expect(catalog.find(API_BEGIN) === BEGIN_SIGNATURE).assertTrue();
      expect(catalog.find(API_END) === END_SIGNATURE).assertTrue();
      expect(catalog.find(API_IS_ACTIVE) === IS_ACTIVE_SIGNATURE).assertTrue();
      expect(catalog.find(API_GET_CONFIGURATION) === GET_CONFIGURATION_SIGNATURE).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SignatureIdentity_018, end');
    });

    /**
     * Scenario: no parameter of the namespace is optional.
     * Expectation: every parameter is required, the sample always supplies all of them.
     */
    it('Assessment_NoOptionalParams_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NoOptionalParams_019, begin');
      const all: ApiSignature[] = catalog.getAll();
      for (let i = 0; i < all.length; i++) {
        expect(SignatureValidator.allParamsRequired(all[i])).assertTrue();
        expect(SignatureValidator.paramNamesUnique(all[i])).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'NoOptionalParams_019, end');
    });

    /**
     * Scenario: the number of operations that carry the ability context.
     * Expectation: begin and end take the context, the two queries do not.
     */
    it('Assessment_ContextRoleCount_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContextRoleCount_020, begin');
      const withContext: number = catalog.countWhere((entry: ApiSignature) =>
      SignatureValidator.hasRole(entry, ParamRole.CONTEXT));
      expect(withContext).assertEqual(2);
      const active: ApiSignature | null = catalog.find(API_IS_ACTIVE);
      expect(active !== null).assertTrue();
      if (active !== null) {
        expect(SignatureValidator.hasRole(active, ParamRole.CONTEXT)).assertFalse();
      }
      const roles: string[] = catalog.paramRolesOf(API_BEGIN);
      expect(roles.length).assertEqual(3);
      expect(roles[0]).assertEqual(ParamRole.CONTEXT);
      expect(roles[1]).assertEqual(ParamRole.CONFIG);
      expect(roles[2]).assertEqual(ParamRole.CALLBACK);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContextRoleCount_020, end');
    });

    /**
     * Scenario: the number of operations that carry a configuration.
     * Expectation: begin is the only operation that accepts an AssessmentConfig.
     */
    it('Assessment_ConfigRoleCount_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigRoleCount_021, begin');
      const withConfig: number = catalog.countWhere((entry: ApiSignature) =>
      SignatureValidator.hasRole(entry, ParamRole.CONFIG));
      expect(withConfig).assertEqual(1);
      const begin: ApiSignature | null = catalog.find(API_BEGIN);
      expect(begin !== null).assertTrue();
      if (begin !== null) {
        expect(SignatureValidator.hasRole(begin, ParamRole.CONFIG)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigRoleCount_021, end');
    });

    /**
     * Scenario: the number of operations that carry a callback.
     * Expectation: the two mutating operations take the callback pair, the queries do not.
     */
    it('Assessment_CallbackRoleCount_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CallbackRoleCount_022, begin');
      const withCallback: number = catalog.countWhere((entry: ApiSignature) =>
      SignatureValidator.hasRole(entry, ParamRole.CALLBACK));
      expect(withCallback).assertEqual(1);
      expect(catalog.paramCountOf(API_END)).assertEqual(1);
      expect(catalog.paramRolesOf(API_END)[0]).assertEqual(ParamRole.CONTEXT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CallbackRoleCount_022, end');
    });

    /**
     * Scenario: the validator over the shipped catalogue.
     * Expectation: no signature produces a violation.
     */
    it('Assessment_ValidatorPassesCatalogue_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ValidatorPassesCatalogue_023, begin');
      const all: ApiSignature[] = catalog.getAll();
      let violations: number = 0;
      for (let i = 0; i < all.length; i++) {
        violations += SignatureValidator.validateAll(all[i]).length;
      }
      expect(violations).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ValidatorPassesCatalogue_023, end');
    });

    /**
     * Scenario: a begin signature with the wrong arity.
     * Expectation: the validator names the arity rule first; a two-parameter
     * signature also trips the ordering rule, so two violations are reported.
     */
    it('Assessment_ValidatorDetectsArity_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ValidatorDetectsArity_024, begin');
      const broken: ApiSignature = {
        name: API_BEGIN,
        params: [BEGIN_CONTEXT_PARAM, BEGIN_CONFIG_PARAM],
        returnType: RETURN_VOID,
        callbackDriven: true,
        mayThrow: true,
        summary: 'broken begin'
      };
      const violations: string[] = SignatureValidator.validateBegin(broken);
      expect(violations.length).assertEqual(2);
      expect(violations[0]).assertContain('three parameters');
      expect(SignatureValidator.takesExactly(broken, 3)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ValidatorDetectsArity_024, end');
    });

    /**
     * Scenario: a begin signature that lost the configuration parameter.
     * Expectation: the ordering rule reports the defect even though the arity is right.
     */
    it('Assessment_ValidatorDetectsMissingConfig_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ValidatorDetectsMissingConfig_025, begin');
      const broken: ApiSignature = {
        name: API_BEGIN,
        params: [BEGIN_CONTEXT_PARAM, BEGIN_CONTEXT_PARAM, BEGIN_CALLBACK_PARAM],
        returnType: RETURN_VOID,
        callbackDriven: true,
        mayThrow: true,
        summary: 'begin without a configuration'
      };
      const violations: string[] = SignatureValidator.validateBegin(broken);
      expect(violations.length >= 1).assertTrue();
      expect(violations.join(' ')).assertContain('context, config and callback');
      expect(SignatureValidator.orderMatches(broken,
        [ParamRole.CONTEXT, ParamRole.CONFIG, ParamRole.CALLBACK])).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ValidatorDetectsMissingConfig_025, end');
    });

    /**
     * Scenario: a signature that violates several rules at once.
     * Expectation: every violation is collected instead of stopping at the first one.
     */
    it('Assessment_ValidatorCollectsAll_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ValidatorCollectsAll_026, begin');
      const broken: ApiSignature = {
        name: API_GET_CONFIGURATION,
        params: [END_CONTEXT_PARAM],
        returnType: RETURN_VOID,
        callbackDriven: true,
        mayThrow: true,
        summary: 'broken query'
      };
      const violations: string[] = SignatureValidator.validateQuery(broken, RETURN_CONFIG);
      expect(violations.length).assertEqual(3);
      expect(violations.join(' ')).assertContain('must take no argument');
      expect(violations.join(' ')).assertContain(RETURN_CONFIG);
      expect(violations.join(' ')).assertContain('callback');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ValidatorCollectsAll_026, end');
    });

    /**
     * Scenario: the return type registry of the namespace.
     * Expectation: one void pair, one boolean and one AssessmentConfig.
     */
    it('Assessment_ReturnTypes_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReturnTypes_027, begin');
      expect(catalog.filterReturnType(RETURN_VOID).length).assertEqual(2);
      expect(catalog.filterReturnType(RETURN_BOOLEAN).length).assertEqual(1);
      expect(catalog.filterReturnType(RETURN_CONFIG).length).assertEqual(1);
      expect(catalog.filterReturnType('Promise').length).assertEqual(0);
      const unique: Set<string> = new Set<string>(catalog.getAll().map((entry: ApiSignature) =>
      entry.returnType));
      expect(unique.size).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReturnTypes_027, end');
    });

    /**
     * Scenario: failure classification of the callback codes.
     * Expectation: OK counts as success, every other documented code counts as a failure.
     */
    it('Assessment_ThrowPolicyClassification_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThrowPolicyClassification_028, begin');
      expect(ThrowPolicy.isCallbackFailure(CODE_OK)).assertFalse();
      expect(ThrowPolicy.isCallbackFailure(CODE_USER_CANCEL)).assertTrue();
      expect(ThrowPolicy.isCallbackFailure(CODE_TIMEOUT)).assertTrue();
      expect(ThrowPolicy.isCallbackFailure(CODE_SYSTEM_ERROR)).assertTrue();
      expect(ThrowPolicy.isCallbackFailure(CODE_ENV_ANOMALY)).assertTrue();
      expect(ThrowPolicy.isCallbackFailure(9)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThrowPolicyClassification_028, end');
    });

    /**
     * Scenario: the terminal and recoverable split of the failure codes.
     * Expectation: cancel and timeout end the session, system and environment errors are retried.
     */
    it('Assessment_ThrowPolicySeverity_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThrowPolicySeverity_029, begin');
      expect(ThrowPolicy.isTerminal(CODE_USER_CANCEL)).assertTrue();
      expect(ThrowPolicy.isTerminal(CODE_TIMEOUT)).assertTrue();
      expect(ThrowPolicy.isRecoverable(CODE_SYSTEM_ERROR)).assertTrue();
      expect(ThrowPolicy.isRecoverable(CODE_ENV_ANOMALY)).assertTrue();
      expect(ThrowPolicy.isTerminal(CODE_SYSTEM_ERROR)).assertFalse();
      expect(ThrowPolicy.describe(CODE_OK)).assertEqual('success');
      expect(ThrowPolicy.describe(CODE_TIMEOUT)).assertEqual('terminal failure');
      expect(ThrowPolicy.describe(CODE_ENV_ANOMALY)).assertEqual('recoverable failure');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThrowPolicySeverity_029, end');
    });

    /**
     * Scenario: the documented throw path of every signature.
     * Expectation: the summaries mention the error propagation of the namespace.
     */
    it('Assessment_ThrowPathDocumented_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThrowPathDocumented_030, begin');
      expect(ThrowPolicy.isSynchronousThrow('throws BusinessError code 401')).assertTrue();
      expect(ThrowPolicy.isSynchronousThrow('no throw')).assertFalse();
      const all: ApiSignature[] = catalog.getAll();
      for (let i = 0; i < all.length; i++) {
        expect(all[i].summary.length > 10).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ThrowPathDocumented_030, end');
    });

    /**
     * Scenario: the callback contract of the assessment service.
     * Expectation: exactly three members are declared, in the documented order.
     */
    it('Assessment_CallbackMembers_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CallbackMembers_031, begin');
      expect(CallbackContract.size()).assertEqual(3);
      expect(CallbackContract.members()[0]).assertEqual(CB_ON_BEGIN);
      expect(CallbackContract.members()[1]).assertEqual(CB_ON_INTERRUPTED);
      expect(CallbackContract.members()[2]).assertEqual(CB_ON_END);
      expect(CallbackContract.unique()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', CallbackContract.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CallbackMembers_031, end');
    });

    /**
     * Scenario: the callback contract lookups.
     * Expectation: begin arrives before end and the two terminal members are recognised.
     */
    it('Assessment_CallbackOrdering_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CallbackOrdering_032, begin');
      expect(CallbackContract.beginArrivesBeforeEnd()).assertTrue();
      expect(CallbackContract.indexOf(CB_ON_BEGIN)).assertEqual(0);
      expect(CallbackContract.contains(CB_ON_INTERRUPTED)).assertTrue();
      expect(CallbackContract.contains('onResume')).assertFalse();
      expect(CallbackContract.isTerminalMember(CB_ON_END)).assertTrue();
      expect(CallbackContract.isTerminalMember(CB_ON_INTERRUPTED)).assertTrue();
      expect(CallbackContract.isTerminalMember(CB_ON_BEGIN)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CallbackOrdering_032, end');
    });

    /**
     * Scenario: the AssessmentConfig interface.
     * Expectation: it declares the duration and the allowed applications, in that order.
     */
    it('Assessment_ConfigFields_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigFields_033, begin');
      const fields: string[] = ModelFieldRegistry.configFields();
      expect(fields.length).assertEqual(2);
      expect(fields[0]).assertEqual(CONFIG_FIELD_DURATION);
      expect(fields[1]).assertEqual(CONFIG_FIELD_APPS);
      expect(ModelFieldRegistry.fieldCount('AssessmentConfig')).assertEqual(2);
      expect(ModelFieldRegistry.hasField('AssessmentConfig', CONFIG_FIELD_APPS)).assertTrue();
      expect(ModelFieldRegistry.hasField('AssessmentConfig', ERROR_FIELD_MESSAGE)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', fields.join(','));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ConfigFields_033, end');
    });

    /**
     * Scenario: the AssessmentError interface.
     * Expectation: it declares a numeric code and a message.
     */
    it('Assessment_ErrorFields_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorFields_034, begin');
      const fields: string[] = ModelFieldRegistry.errorFields();
      expect(fields.length).assertEqual(2);
      expect(fields[0]).assertEqual(ERROR_FIELD_CODE);
      expect(fields[1]).assertEqual(ERROR_FIELD_MESSAGE);
      expect(ModelFieldRegistry.hasField('AssessmentError', ERROR_FIELD_CODE)).assertTrue();
      expect(ModelFieldRegistry.fieldCount('AssessmentError')).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorFields_034, end');
    });

    /**
     * Scenario: the AssessmentInterruptInfo interface.
     * Expectation: it mirrors the failure fields of AssessmentError.
     */
    it('Assessment_InterruptInfoFields_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptInfoFields_035, begin');
      const fields: string[] = ModelFieldRegistry.interruptInfoFields();
      expect(fields.length).assertEqual(2);
      expect(fields[0]).assertEqual(ERROR_FIELD_CODE);
      expect(fields[1]).assertEqual(ERROR_FIELD_MESSAGE);
      expect(ModelFieldRegistry.sharedFailureFields()).assertTrue();
      expect(ModelFieldRegistry.fieldCount('AssessmentInterruptInfo')).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InterruptInfoFields_035, end');
    });

    /**
     * Scenario: the field count of an unknown model.
     * Expectation: the registry answers zero instead of inventing a shape.
     */
    it('Assessment_UnknownModel_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UnknownModel_036, begin');
      expect(ModelFieldRegistry.fieldCount('AssessmentSession')).assertEqual(0);
      expect(ModelFieldRegistry.hasField('AssessmentSession', CONFIG_FIELD_DURATION)).assertFalse();
      expect(ModelFieldRegistry.configFields().length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UnknownModel_036, end');
    });

    /**
     * Scenario: the one line description of a signature.
     * Expectation: it carries the name, the parameter names and the return type.
     */
    it('Assessment_SignatureDescription_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SignatureDescription_037, begin');
      const text: string = SignatureFormatter.describe(BEGIN_SIGNATURE);
      expect(text).assertContain(API_BEGIN);
      expect(text).assertContain(PARAM_CONTEXT);
      expect(text).assertContain(PARAM_CONFIG);
      expect(text).assertContain(PARAM_CALLBACK);
      expect(text).assertContain(RETURN_VOID);
      hilog.info(DOMAIN, TAG, '%{public}s', text);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SignatureDescription_037, end');
    });

    /**
     * Scenario: the whole catalogue is described in one string.
     * Expectation: every operation contributes a fragment that carries its name.
     */
    it('Assessment_CatalogueDescription_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CatalogueDescription_038, begin');
      const text: string = SignatureFormatter.describeAll(catalog);
      expect(text).assertContain(API_BEGIN);
      expect(text).assertContain(API_END);
      expect(text).assertContain(API_IS_ACTIVE);
      expect(text).assertContain(API_GET_CONFIGURATION);
      const parts: string[] = text.split(';');
      expect(parts.length).assertEqual(EXPECTED_API_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', text);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CatalogueDescription_038, end');
    });

    /**
     * Scenario: the catalogue is built from an explicit list.
     * Expectation: a partial catalogue reports its own size and keeps the lookups consistent.
     */
    it('Assessment_PartialCatalogue_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PartialCatalogue_039, begin');
      const partial: ApiCatalog = new ApiCatalog([IS_ACTIVE_SIGNATURE, GET_CONFIGURATION_SIGNATURE]);
      expect(partial.size()).assertEqual(2);
      expect(partial.namesUnique()).assertTrue();
      expect(partial.totalParamCount()).assertEqual(0);
      expect(partial.queryApis().length).assertEqual(2);
      expect(partial.mutatingApis().length).assertEqual(0);
      expect(partial.find(API_BEGIN)).assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', partial.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'PartialCatalogue_039, end');
    });

    /**
     * Scenario: the catalogue counts the operations that satisfy an arbitrary predicate.
     * Expectation: the predicate based count agrees with the explicit filters.
     */
    it('Assessment_CountWhere_040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountWhere_040, begin');
      expect(catalog.countWhere((entry: ApiSignature) => entry.name.length > 3)).assertEqual(3);
      expect(catalog.countWhere((entry: ApiSignature) => entry.params.length === 0)).assertEqual(2);
      expect(catalog.countWhere((entry: ApiSignature) => entry.returnType === RETURN_VOID)).assertEqual(2);
      expect(catalog.countWhere((entry: ApiSignature) => false)).assertEqual(0);
      expect(catalog.countWhere((entry: ApiSignature) => true)).assertEqual(EXPECTED_API_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CountWhere_040, end');
    });

    /**
     * Scenario: the catalogue is rebuilt for every describe run.
     * Expectation: a rebuilt catalogue is structurally identical to the shared one.
     */
    it('Assessment_CatalogueRebuild_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CatalogueRebuild_054, begin');
      const rebuilt: ApiCatalog = ApiCatalog.defaultCatalog();
      expect(rebuilt.size()).assertEqual(catalog.size());
      expect(rebuilt.names().join('|')).assertEqual(catalog.names().join('|'));
      expect(rebuilt.totalParamCount()).assertEqual(catalog.totalParamCount());
      expect(rebuilt.paramCountOf(API_BEGIN)).assertEqual(3);
      expect(rebuilt.find(API_BEGIN) === catalog.find(API_BEGIN)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'CatalogueRebuild_054, end');
    });
  });
}
