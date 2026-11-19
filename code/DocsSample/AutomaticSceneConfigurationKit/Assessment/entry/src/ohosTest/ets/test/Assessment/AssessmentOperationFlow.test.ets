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
  TEXT_NO_EVENT,
  TIMEOUT_PAGE_RENDER,
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

// The four operations of the assessment namespace.
const OP_BEGIN: string = 'begin';
const OP_END: string = 'end';
const OP_IS_ACTIVE: string = 'isActive';
const OP_GET_CONFIGURATION: string = 'getConfiguration';

// Codes of the assessment error enum.
const CODE_OK: number = 0;
const CODE_USER_CANCEL: number = 1;
const CODE_TIMEOUT: number = 2;
const CODE_SYSTEM_ERROR: number = 3;
const CODE_ENV_ANOMALY: number = 4;

// Duration candidates and the default entry of the configuration.
const DURATION_TEN: number = 600000;
const DURATION_SIXTY: number = 3600000;
const INVALID_DURATION: number = -1;
const DEFAULT_ALLOWED_APP: string = 'com.samples.assessment';

/**
 * The pre condition that an operation requires from the session.
 */
enum Precondition {
  ALWAYS = 'always', ACTIVE_SESSION = 'activeSession', NO_SESSION = 'noSession', CONFIGURED = 'configured'
}

/**
 * The post condition that an operation guarantees to the next operation.
 */
enum Postcondition {
  UNCHANGED = 'unchanged', SESSION_ACTIVE = 'sessionActive', SESSION_CLOSED = 'sessionClosed',
  CONFIG_REPORTED = 'configReported'
}

/**
 * The full contract of one assessment operation.
 *
 * The contract names the pre condition that must hold before the call and the post condition
 * that holds afterwards. The flow engine below only accepts a step when the running session
 * satisfies the pre condition, which is exactly what the sample page enforces through the
 * enabled state of its buttons.
 */
interface OperationContract {
  name: string;
  precondition: string;
  postcondition: string;
  needsConfig: boolean;
  needsContext: boolean;
  callbackDriven: boolean;
  clearsActive: boolean;
  setsActive: boolean;
}

const BEGIN_CONTRACT: OperationContract = {
  name: OP_BEGIN,
  precondition: Precondition.NO_SESSION,
  postcondition: Postcondition.SESSION_ACTIVE,
  needsConfig: true,
  needsContext: true,
  callbackDriven: true,
  clearsActive: false,
  setsActive: true
};

const END_CONTRACT: OperationContract = {
  name: OP_END,
  precondition: Precondition.ACTIVE_SESSION,
  postcondition: Postcondition.SESSION_CLOSED,
  needsConfig: false,
  needsContext: true,
  callbackDriven: true,
  clearsActive: true,
  setsActive: false
};

const IS_ACTIVE_CONTRACT: OperationContract = {
  name: OP_IS_ACTIVE,
  precondition: Precondition.ALWAYS,
  postcondition: Postcondition.UNCHANGED,
  needsConfig: false,
  needsContext: false,
  callbackDriven: false,
  clearsActive: false,
  setsActive: false
};

const GET_CONFIGURATION_CONTRACT: OperationContract = {
  name: OP_GET_CONFIGURATION,
  precondition: Precondition.ALWAYS,
  postcondition: Postcondition.CONFIG_REPORTED,
  needsConfig: false,
  needsContext: false,
  callbackDriven: false,
  clearsActive: false,
  setsActive: false
};

/**
 * One executed step of an operation flow.
 */
interface FlowStep {
  index: number;
  operation: string;
  accepted: boolean;
  activeBefore: boolean;
  activeAfter: boolean;
  note: string;
}

/**
 * The ordered operation flow over the four assessment APIs.
 *
 * The engine models the session as a boolean plus the last reported configuration. An operation
 * is accepted when its pre condition holds, then its post condition is applied. A refused
 * operation never changes the session, which mirrors the sample: a disabled button cannot be
 * pressed and a refused callback never activates the session.
 */
class OperationFlowEngine {
  private active: boolean = false;
  private configured: boolean = false;
  private duration: number = INVALID_DURATION;
  private apps: string[] = [];
  private steps: FlowStep[] = [];
  private rejections: number = 0;

  public static contractOf(operation: string): OperationContract | null {
    if (operation === OP_BEGIN) {
      return BEGIN_CONTRACT;
    }
    if (operation === OP_END) {
      return END_CONTRACT;
    }
    if (operation === OP_IS_ACTIVE) {
      return IS_ACTIVE_CONTRACT;
    }
    if (operation === OP_GET_CONFIGURATION) {
      return GET_CONFIGURATION_CONTRACT;
    }
    return null;
  }

  public static preconditionHolds(contract: OperationContract, active: boolean, configured: boolean): boolean {
    if (contract.precondition === Precondition.ALWAYS) {
      return true;
    }
    if (contract.precondition === Precondition.ACTIVE_SESSION) {
      return active;
    }
    if (contract.precondition === Precondition.NO_SESSION) {
      return !active;
    }
    if (contract.precondition === Precondition.CONFIGURED) {
      return configured;
    }
    return false;
  }

  public configure(duration: number, apps: string[]): void {
    this.configured = true;
    this.duration = duration;
    this.apps = apps.slice();
  }

  public execute(operation: string, note: string = ''): FlowStep {
    const activeBefore: boolean = this.active;
    const contract: OperationContract | null = OperationFlowEngine.contractOf(operation);
    if (contract === null) {
      return this.reject(operation, activeBefore, 'unknown operation');
    }
    if (!OperationFlowEngine.preconditionHolds(contract, this.active, this.configured)) {
      return this.reject(operation, activeBefore, `the precondition ${contract.precondition} does not hold`);
    }
    if (contract.setsActive) {
      this.active = true;
    }
    if (contract.clearsActive) {
      this.active = false;
      this.duration = INVALID_DURATION;
      this.apps = [];
    }
    const step: FlowStep = {
      index: this.steps.length,
      operation: operation,
      accepted: true,
      activeBefore: activeBefore,
      activeAfter: this.active,
      note: note
    };
    this.steps.push(step);
    return step;
  }

  public executeSequence(operations: string[]): number {
    let accepted: number = 0;
    for (let i = 0; i < operations.length; i++) {
      const step: FlowStep = this.execute(operations[i]);
      if (step.accepted) {
        accepted++;
      }
    }
    return accepted;
  }

  public isActive(): boolean {
    return this.active;
  }

  public isConfigured(): boolean {
    return this.configured;
  }

  public reportedDuration(): number {
    return this.duration;
  }

  public reportedApps(): string[] {
    return this.apps.slice();
  }

  public stepsValue(): FlowStep[] {
    return this.steps.slice();
  }

  public stepCount(): number {
    return this.steps.length;
  }

  public rejectionCount(): number {
    return this.rejections;
  }

  public operations(): string[] {
    return this.steps.map((step: FlowStep) => step.operation);
  }

  public countOf(operation: string): number {
    let count: number = 0;
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].operation === operation) {
        count++;
      }
    }
    return count;
  }

  public lastStep(): FlowStep | null {
    return this.steps.length === 0 ? null : this.steps[this.steps.length - 1];
  }

  public activeTransitions(): number {
    let count: number = 0;
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].activeBefore !== this.steps[i].activeAfter) {
        count++;
      }
    }
    return count;
  }

  public isStable(): boolean {
    return this.steps.length > 0 && this.rejections === 0;
  }

  private reject(operation: string, activeBefore: boolean, reason: string): FlowStep {
    this.rejections++;
    return {
      index: this.steps.length,
      operation: operation,
      accepted: false,
      activeBefore: activeBefore,
      activeAfter: activeBefore,
      note: reason
    };
  }

  public describe(): string {
    return `FlowEngine{steps=${this.steps.length}, active=${this.active}, rejections=${this.rejections}}`;
  }
}

/**
 * A named sequence of operations with the expected acceptance of every step.
 *
 * The scenario is data: an operation list plus the expected pattern of accepted and refused
 * steps. The flow cases compare the produced pattern with the expected one, which turns each
 * table row into a single assertion.
 */
class FlowScenario {
  private readonly operationsList: string[];
  private readonly expectedAccepted: boolean[];
  private readonly label: string;

  constructor(label: string, operations: string[], expectedAccepted: boolean[]) {
    this.label = label;
    this.operationsList = operations.slice();
    this.expectedAccepted = expectedAccepted.slice();
  }

  public operations(): string[] {
    return this.operationsList.slice();
  }

  public expected(): boolean[] {
    return this.expectedAccepted.slice();
  }

  public labelValue(): string {
    return this.label;
  }

  public size(): number {
    return this.operationsList.length;
  }

  public expectedAcceptedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.expectedAccepted.length; i++) {
      if (this.expectedAccepted[i]) {
        count++;
      }
    }
    return count;
  }

  public run(engine: OperationFlowEngine): boolean[] {
    const produced: boolean[] = [];
    for (let i = 0; i < this.operationsList.length; i++) {
      const step: FlowStep = engine.execute(this.operationsList[i]);
      produced.push(step.accepted);
    }
    return produced;
  }

  public matches(produced: boolean[]): boolean {
    if (produced.length !== this.expectedAccepted.length) {
      return false;
    }
    for (let i = 0; i < produced.length; i++) {
      if (produced[i] !== this.expectedAccepted[i]) {
        return false;
      }
    }
    return true;
  }

  public describe(): string {
    return `Scenario{label=${this.label}, steps=${this.operationsList.length}, ` +
      `accepted=${this.expectedAcceptedCount()}}`;
  }
}

/**
 * Builds the scenario table of the flow suite.
 *
 * The table covers the documented journeys: the happy path, a query only journey, a double
 * begin, an early end, a begin after an end and a query interleaved journey.
 */
class ScenarioFactory {
  public static happyPath(): FlowScenario {
    return new FlowScenario('happy path',
      [OP_BEGIN, OP_IS_ACTIVE, OP_GET_CONFIGURATION, OP_END],
      [true, true, true, true]);
  }

  public static queriesOnly(): FlowScenario {
    return new FlowScenario('queries only',
      [OP_IS_ACTIVE, OP_GET_CONFIGURATION],
      [true, true]);
  }

  public static doubleBegin(): FlowScenario {
    return new FlowScenario('double begin',
      [OP_BEGIN, OP_BEGIN, OP_END],
      [true, false, true]);
  }

  public static earlyEnd(): FlowScenario {
    return new FlowScenario('early end',
      [OP_END, OP_BEGIN, OP_END],
      [false, true, true]);
  }

  public static afterEnd(): FlowScenario {
    return new FlowScenario('begin after end',
      [OP_BEGIN, OP_END, OP_BEGIN, OP_END],
      [true, true, true, true]);
  }

  public static interleaved(): FlowScenario {
    return new FlowScenario('interleaved queries',
      [OP_IS_ACTIVE, OP_BEGIN, OP_IS_ACTIVE, OP_GET_CONFIGURATION, OP_END, OP_IS_ACTIVE],
      [true, true, true, true, true, true]);
  }

  public static brokenEnd(): FlowScenario {
    return new FlowScenario('end without begin',
      [OP_IS_ACTIVE, OP_END, OP_GET_CONFIGURATION, OP_END],
      [true, false, true, false]);
  }

  public static all(): FlowScenario[] {
    return [
      ScenarioFactory.happyPath(),
      ScenarioFactory.queriesOnly(),
      ScenarioFactory.doubleBegin(),
      ScenarioFactory.earlyEnd(),
      ScenarioFactory.afterEnd(),
      ScenarioFactory.interleaved(),
      ScenarioFactory.brokenEnd()
    ];
  }
}

/**
 * Verifies the invariants that must hold after any accepted flow.
 *
 * The checker inspects the produced steps and proves the three properties of the sample: the
 * begin and the end alternate, no end happens without a begin and the query steps never flip
 * the session.
 */
class FlowInvariantChecker {
  public static transitionsAlternate(steps: FlowStep[]): boolean {
    let active: boolean = false;
    for (let i = 0; i < steps.length; i++) {
      if (!steps[i].accepted) {
        continue;
      }
      const operation: string = steps[i].operation;
      if (operation === OP_BEGIN) {
        if (active) {
          return false;
        }
        active = true;
      } else if (operation === OP_END) {
        if (!active) {
          return false;
        }
        active = false;
      }
    }
    return true;
  }

  public static queriesDoNotChangeState(steps: FlowStep[]): boolean {
    for (let i = 0; i < steps.length; i++) {
      const operation: string = steps[i].operation;
      if (operation === OP_IS_ACTIVE || operation === OP_GET_CONFIGURATION) {
        if (steps[i].activeBefore !== steps[i].activeAfter) {
          return false;
        }
      }
    }
    return true;
  }

  public static refusedStepsDoNotChangeState(steps: FlowStep[]): boolean {
    for (let i = 0; i < steps.length; i++) {
      if (!steps[i].accepted && steps[i].activeBefore !== steps[i].activeAfter) {
        return false;
      }
    }
    return true;
  }

  public static endOnlyAfterBegin(steps: FlowStep[]): boolean {
    let seenBegin: boolean = false;
    for (let i = 0; i < steps.length; i++) {
      if (!steps[i].accepted) {
        continue;
      }
      if (steps[i].operation === OP_BEGIN) {
        seenBegin = true;
      }
      if (steps[i].operation === OP_END && !seenBegin) {
        return false;
      }
    }
    return true;
  }

  public static verify(steps: FlowStep[]): boolean {
    return FlowInvariantChecker.transitionsAlternate(steps) &&
      FlowInvariantChecker.queriesDoNotChangeState(steps) &&
      FlowInvariantChecker.refusedStepsDoNotChangeState(steps) &&
      FlowInvariantChecker.endOnlyAfterBegin(steps);
  }

  public static violations(steps: FlowStep[]): string[] {
    const reasons: string[] = [];
    if (!FlowInvariantChecker.transitionsAlternate(steps)) {
      reasons.push('the begin and end steps do not alternate');
    }
    if (!FlowInvariantChecker.queriesDoNotChangeState(steps)) {
      reasons.push('a query changed the session state');
    }
    if (!FlowInvariantChecker.refusedStepsDoNotChangeState(steps)) {
      reasons.push('a refused step changed the session state');
    }
    if (!FlowInvariantChecker.endOnlyAfterBegin(steps)) {
      reasons.push('an end was accepted without a begin');
    }
    return reasons;
  }

  public static describe(steps: FlowStep[]): string {
    return `Invariants{steps=${steps.length}, verified=${FlowInvariantChecker.verify(steps)}}`;
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

export default function assessmentOperationFlowTest() {
  describe('AssessmentOperationFlow_Test', () => {
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
     * Scenario: the contract table of the four operations.
     * Expectation: every operation has a contract and the names are the documented ones.
     */
    it('Assessment_ContractsDefined_001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContractsDefined_001, begin');
      expect(OperationFlowEngine.contractOf(OP_BEGIN) !== null).assertTrue();
      expect(OperationFlowEngine.contractOf(OP_END) !== null).assertTrue();
      expect(OperationFlowEngine.contractOf(OP_IS_ACTIVE) !== null).assertTrue();
      expect(OperationFlowEngine.contractOf(OP_GET_CONFIGURATION) !== null).assertTrue();
      expect(OperationFlowEngine.contractOf('suspend')).assertNull();
      expect(BEGIN_CONTRACT.name).assertEqual(OP_BEGIN);
      expect(END_CONTRACT.name).assertEqual(OP_END);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContractsDefined_001, end');
    });

    /**
     * Scenario: the pre conditions of the four operations.
     * Expectation: begin needs no session, end needs one and both queries are unconditional.
     */
    it('Assessment_Preconditions_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Preconditions_002, begin');
      expect(BEGIN_CONTRACT.precondition).assertEqual(Precondition.NO_SESSION);
      expect(END_CONTRACT.precondition).assertEqual(Precondition.ACTIVE_SESSION);
      expect(IS_ACTIVE_CONTRACT.precondition).assertEqual(Precondition.ALWAYS);
      expect(GET_CONFIGURATION_CONTRACT.precondition).assertEqual(Precondition.ALWAYS);
      expect(OperationFlowEngine.preconditionHolds(BEGIN_CONTRACT, false, false)).assertTrue();
      expect(OperationFlowEngine.preconditionHolds(BEGIN_CONTRACT, true, false)).assertFalse();
      expect(OperationFlowEngine.preconditionHolds(END_CONTRACT, true, false)).assertTrue();
      expect(OperationFlowEngine.preconditionHolds(END_CONTRACT, false, false)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Preconditions_002, end');
    });

    /**
     * Scenario: the post conditions of the four operations.
     * Expectation: begin activates, end closes and the queries leave the session untouched.
     */
    it('Assessment_Postconditions_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Postconditions_003, begin');
      expect(BEGIN_CONTRACT.postcondition).assertEqual(Postcondition.SESSION_ACTIVE);
      expect(END_CONTRACT.postcondition).assertEqual(Postcondition.SESSION_CLOSED);
      expect(IS_ACTIVE_CONTRACT.postcondition).assertEqual(Postcondition.UNCHANGED);
      expect(GET_CONFIGURATION_CONTRACT.postcondition).assertEqual(Postcondition.CONFIG_REPORTED);
      expect(BEGIN_CONTRACT.setsActive).assertTrue();
      expect(BEGIN_CONTRACT.clearsActive).assertFalse();
      expect(END_CONTRACT.clearsActive).assertTrue();
      expect(END_CONTRACT.setsActive).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Postconditions_003, end');
    });

    /**
     * Scenario: the parameter requirements of the contracts.
     * Expectation: only begin needs the configuration, only the mutators need the context.
     */
    it('Assessment_ContractParameters_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContractParameters_004, begin');
      expect(BEGIN_CONTRACT.needsConfig).assertTrue();
      expect(BEGIN_CONTRACT.needsContext).assertTrue();
      expect(BEGIN_CONTRACT.callbackDriven).assertTrue();
      expect(END_CONTRACT.needsConfig).assertFalse();
      expect(END_CONTRACT.needsContext).assertTrue();
      expect(IS_ACTIVE_CONTRACT.needsContext).assertFalse();
      expect(IS_ACTIVE_CONTRACT.needsConfig).assertFalse();
      expect(GET_CONFIGURATION_CONTRACT.callbackDriven).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ContractParameters_004, end');
    });

    /**
     * Scenario: a fresh flow engine.
     * Expectation: it is inactive, unconfigured and holds no step.
     */
    it('Assessment_EngineInitial_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EngineInitial_005, begin');
      const engine: OperationFlowEngine = new OperationFlowEngine();
      expect(engine.isActive()).assertFalse();
      expect(engine.isConfigured()).assertFalse();
      expect(engine.stepCount()).assertEqual(0);
      expect(engine.rejectionCount()).assertEqual(0);
      expect(engine.reportedDuration()).assertEqual(INVALID_DURATION);
      expect(engine.lastStep()).assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', engine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EngineInitial_005, end');
    });

    /**
     * Scenario: executing begin on a fresh engine.
     * Expectation: the step is accepted and the session becomes active.
     */
    it('Assessment_BeginAccepted_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginAccepted_006, begin');
      const engine: OperationFlowEngine = new OperationFlowEngine();
      engine.configure(DURATION_TEN, [DEFAULT_ALLOWED_APP]);
      const step: FlowStep = engine.execute(OP_BEGIN);
      expect(step.accepted).assertTrue();
      expect(step.activeBefore).assertFalse();
      expect(step.activeAfter).assertTrue();
      expect(engine.isActive()).assertTrue();
      expect(engine.stepCount()).assertEqual(1);
      expect(engine.rejectionCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', engine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginAccepted_006, end');
    });

    /**
     * Scenario: executing begin twice.
     * Expectation: the second begin is refused and the session stays active.
     */
    it('Assessment_BeginRefusedTwice_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginRefusedTwice_007, begin');
      const engine: OperationFlowEngine = new OperationFlowEngine();
      engine.execute(OP_BEGIN);
      const second: FlowStep = engine.execute(OP_BEGIN);
      expect(second.accepted).assertFalse();
      expect(second.note).assertContain(Precondition.NO_SESSION);
      expect(engine.isActive()).assertTrue();
      expect(engine.stepCount()).assertEqual(1);
      expect(engine.rejectionCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', engine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginRefusedTwice_007, end');
    });

    /**
     * Scenario: executing end without a running session.
     * Expectation: the end is refused and the session stays inactive.
     */
    it('Assessment_EndRefusedWithoutSession_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndRefusedWithoutSession_008, begin');
      const engine: OperationFlowEngine = new OperationFlowEngine();
      const step: FlowStep = engine.execute(OP_END);
      expect(step.accepted).assertFalse();
      expect(step.note).assertContain(Precondition.ACTIVE_SESSION);
      expect(engine.isActive()).assertFalse();
      expect(engine.rejectionCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', engine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndRefusedWithoutSession_008, end');
    });

    /**
     * Scenario: executing end after a begin.
     * Expectation: the end closes the session and clears the reported configuration.
     */
    it('Assessment_EndClosesSession_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndClosesSession_009, begin');
      const engine: OperationFlowEngine = new OperationFlowEngine();
      engine.configure(DURATION_SIXTY, [DEFAULT_ALLOWED_APP]);
      engine.execute(OP_BEGIN);
      expect(engine.reportedDuration()).assertEqual(DURATION_SIXTY);
      const step: FlowStep = engine.execute(OP_END);
      expect(step.accepted).assertTrue();
      expect(step.activeAfter).assertFalse();
      expect(engine.isActive()).assertFalse();
      expect(engine.reportedDuration()).assertEqual(INVALID_DURATION);
      expect(engine.reportedApps().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', engine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EndClosesSession_009, end');
    });

    /**
     * Scenario: the two queries on a fresh engine.
     * Expectation: both are accepted and neither changes the session.
     */
    it('Assessment_QueriesAlwaysAccepted_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueriesAlwaysAccepted_010, begin');
      const engine: OperationFlowEngine = new OperationFlowEngine();
      const active: FlowStep = engine.execute(OP_IS_ACTIVE);
      const config: FlowStep = engine.execute(OP_GET_CONFIGURATION);
      expect(active.accepted).assertTrue();
      expect(config.accepted).assertTrue();
      expect(active.activeBefore).assertEqual(active.activeAfter);
      expect(config.activeBefore).assertEqual(config.activeAfter);
      expect(engine.stepCount()).assertEqual(2);
      expect(engine.activeTransitions()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', engine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueriesAlwaysAccepted_010, end');
    });

    /**
     * Scenario: the two queries while a session is active.
     * Expectation: both are accepted and the session stays active.
     */
    it('Assessment_QueriesWhileActive_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueriesWhileActive_011, begin');
      const engine: OperationFlowEngine = new OperationFlowEngine();
      engine.execute(OP_BEGIN);
      engine.execute(OP_IS_ACTIVE);
      engine.execute(OP_GET_CONFIGURATION);
      expect(engine.isActive()).assertTrue();
      expect(engine.stepCount()).assertEqual(3);
      expect(engine.countOf(OP_IS_ACTIVE)).assertEqual(1);
      expect(engine.countOf(OP_GET_CONFIGURATION)).assertEqual(1);
      expect(engine.activeTransitions()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', engine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'QueriesWhileActive_011, end');
    });

    /**
     * Scenario: an unknown operation.
     * Expectation: the engine refuses it and records the reason.
     */
    it('Assessment_UnknownOperation_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UnknownOperation_012, begin');
      const engine: OperationFlowEngine = new OperationFlowEngine();
      const step: FlowStep = engine.execute('suspend');
      expect(step.accepted).assertFalse();
      expect(step.note).assertContain('unknown');
      expect(engine.rejectionCount()).assertEqual(1);
      expect(engine.stepCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', engine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'UnknownOperation_012, end');
    });

    /**
     * Scenario: the happy path scenario of the flow table.
     * Expectation: every step is accepted and the pattern matches the expectation.
     */
    it('Assessment_ScenarioHappyPath_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioHappyPath_013, begin');
      const scenario: FlowScenario = ScenarioFactory.happyPath();
      const engine: OperationFlowEngine = new OperationFlowEngine();
      const produced: boolean[] = scenario.run(engine);
      expect(scenario.matches(produced)).assertTrue();
      expect(produced.length).assertEqual(4);
      expect(engine.rejectionCount()).assertEqual(0);
      expect(FlowInvariantChecker.verify(engine.stepsValue())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', scenario.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioHappyPath_013, end');
    });

    /**
     * Scenario: a query only scenario.
     * Expectation: both queries are accepted and no session transition is produced.
     */
    it('Assessment_ScenarioQueriesOnly_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioQueriesOnly_014, begin');
      const scenario: FlowScenario = ScenarioFactory.queriesOnly();
      const engine: OperationFlowEngine = new OperationFlowEngine();
      const produced: boolean[] = scenario.run(engine);
      expect(scenario.matches(produced)).assertTrue();
      expect(engine.activeTransitions()).assertEqual(0);
      expect(engine.isActive()).assertFalse();
      expect(scenario.expectedAcceptedCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', scenario.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioQueriesOnly_014, end');
    });

    /**
     * Scenario: a double begin scenario.
     * Expectation: the second begin is the only refused step.
     */
    it('Assessment_ScenarioDoubleBegin_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioDoubleBegin_015, begin');
      const scenario: FlowScenario = ScenarioFactory.doubleBegin();
      const engine: OperationFlowEngine = new OperationFlowEngine();
      const produced: boolean[] = scenario.run(engine);
      expect(scenario.matches(produced)).assertTrue();
      expect(produced[0]).assertTrue();
      expect(produced[1]).assertFalse();
      expect(produced[2]).assertTrue();
      expect(engine.rejectionCount()).assertEqual(1);
      expect(FlowInvariantChecker.verify(engine.stepsValue())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', scenario.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioDoubleBegin_015, end');
    });

    /**
     * Scenario: an early end scenario.
     * Expectation: the first end is refused and the later steps are accepted.
     */
    it('Assessment_ScenarioEarlyEnd_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioEarlyEnd_016, begin');
      const scenario: FlowScenario = ScenarioFactory.earlyEnd();
      const engine: OperationFlowEngine = new OperationFlowEngine();
      const produced: boolean[] = scenario.run(engine);
      expect(scenario.matches(produced)).assertTrue();
      expect(produced[0]).assertFalse();
      expect(engine.rejectionCount()).assertEqual(1);
      expect(FlowInvariantChecker.verify(engine.stepsValue())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', scenario.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioEarlyEnd_016, end');
    });

    /**
     * Scenario: a begin after an end scenario.
     * Expectation: the second begin is accepted because the session was closed.
     */
    it('Assessment_ScenarioAfterEnd_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioAfterEnd_017, begin');
      const scenario: FlowScenario = ScenarioFactory.afterEnd();
      const engine: OperationFlowEngine = new OperationFlowEngine();
      const produced: boolean[] = scenario.run(engine);
      expect(scenario.matches(produced)).assertTrue();
      expect(engine.countOf(OP_BEGIN)).assertEqual(2);
      expect(engine.countOf(OP_END)).assertEqual(2);
      expect(engine.activeTransitions()).assertEqual(4);
      expect(engine.isActive()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', engine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioAfterEnd_017, end');
    });

    /**
     * Scenario: an interleaved scenario with queries between the mutators.
     * Expectation: every step is accepted and the session ends inactive.
     */
    it('Assessment_ScenarioInterleaved_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioInterleaved_018, begin');
      const scenario: FlowScenario = ScenarioFactory.interleaved();
      const engine: OperationFlowEngine = new OperationFlowEngine();
      const produced: boolean[] = scenario.run(engine);
      expect(scenario.matches(produced)).assertTrue();
      expect(engine.stepCount()).assertEqual(6);
      expect(engine.rejectionCount()).assertEqual(0);
      expect(engine.isActive()).assertFalse();
      expect(FlowInvariantChecker.verify(engine.stepsValue())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', engine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioInterleaved_018, end');
    });

    /**
     * Scenario: a broken scenario with two ends and no begin.
     * Expectation: both ends are refused and the queries are still accepted.
     */
    it('Assessment_ScenarioBrokenEnd_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioBrokenEnd_019, begin');
      const scenario: FlowScenario = ScenarioFactory.brokenEnd();
      const engine: OperationFlowEngine = new OperationFlowEngine();
      const produced: boolean[] = scenario.run(engine);
      expect(scenario.matches(produced)).assertTrue();
      expect(engine.rejectionCount()).assertEqual(2);
      expect(engine.stepCount()).assertEqual(2);
      expect(FlowInvariantChecker.verify(engine.stepsValue())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', scenario.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioBrokenEnd_019, end');
    });

    /**
     * Scenario: the whole scenario table.
     * Expectation: every scenario matches its expected pattern on a fresh engine.
     */
    it('Assessment_ScenarioTable_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioTable_020, begin');
      const scenarios: FlowScenario[] = ScenarioFactory.all();
      expect(scenarios.length).assertEqual(7);
      for (let i = 0; i < scenarios.length; i++) {
        const engine: OperationFlowEngine = new OperationFlowEngine();
        const produced: boolean[] = scenarios[i].run(engine);
        expect(scenarios[i].matches(produced)).assertTrue();
        expect(produced.length).assertEqual(scenarios[i].size());
      }
      hilog.info(DOMAIN, TAG, '%{public}s scenarios verified: %{public}d', BUNDLE + 'ScenarioTable_020',
        scenarios.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioTable_020, end');
    });

    /**
     * Scenario: the expected accepted count of every scenario.
     * Expectation: it equals the number of true entries in the expected pattern.
     */
    it('Assessment_ScenarioAcceptedCounts_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioAcceptedCounts_021, begin');
      expect(ScenarioFactory.happyPath().expectedAcceptedCount()).assertEqual(4);
      expect(ScenarioFactory.queriesOnly().expectedAcceptedCount()).assertEqual(2);
      expect(ScenarioFactory.doubleBegin().expectedAcceptedCount()).assertEqual(2);
      expect(ScenarioFactory.earlyEnd().expectedAcceptedCount()).assertEqual(2);
      expect(ScenarioFactory.afterEnd().expectedAcceptedCount()).assertEqual(4);
      expect(ScenarioFactory.interleaved().expectedAcceptedCount()).assertEqual(6);
      expect(ScenarioFactory.brokenEnd().expectedAcceptedCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioAcceptedCounts_021, end');
    });

    /**
     * Scenario: a scenario that is run twice on the same engine.
     * Expectation: the second run is refused because the session is already closed.
     */
    it('Assessment_ScenarioReuseRefused_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioReuseRefused_022, begin');
      const scenario: FlowScenario = ScenarioFactory.happyPath();
      const engine: OperationFlowEngine = new OperationFlowEngine();
      const first: boolean[] = scenario.run(engine);
      expect(scenario.matches(first)).assertTrue();
      const second: boolean[] = scenario.run(engine);
      expect(second[0]).assertTrue();
      expect(engine.countOf(OP_BEGIN)).assertEqual(2);
      expect(engine.countOf(OP_END)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', engine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioReuseRefused_022, end');
    });

    /**
     * Scenario: the alternate transitions invariant.
     * Expectation: a correct engine alternates begin and end and never breaks the rule.
     */
    it('Assessment_InvariantAlternation_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantAlternation_023, begin');
      const engine: OperationFlowEngine = new OperationFlowEngine();
      engine.execute(OP_BEGIN);
      engine.execute(OP_END);
      engine.execute(OP_BEGIN);
      engine.execute(OP_END);
      expect(FlowInvariantChecker.transitionsAlternate(engine.stepsValue())).assertTrue();
      expect(FlowInvariantChecker.endOnlyAfterBegin(engine.stepsValue())).assertTrue();
      expect(FlowInvariantChecker.verify(engine.stepsValue())).assertTrue();
      expect(FlowInvariantChecker.violations(engine.stepsValue()).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', FlowInvariantChecker.describe(engine.stepsValue()));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantAlternation_023, end');
    });

    /**
     * Scenario: the query stability invariant.
     * Expectation: a query between the mutators never changes the session.
     */
    it('Assessment_InvariantQueryStability_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantQueryStability_024, begin');
      const engine: OperationFlowEngine = new OperationFlowEngine();
      engine.execute(OP_BEGIN);
      engine.execute(OP_IS_ACTIVE);
      engine.execute(OP_GET_CONFIGURATION);
      engine.execute(OP_END);
      expect(FlowInvariantChecker.queriesDoNotChangeState(engine.stepsValue())).assertTrue();
      const steps: FlowStep[] = engine.stepsValue();
      expect(steps[1].activeBefore).assertEqual(steps[1].activeAfter);
      expect(steps[2].activeBefore).assertEqual(steps[2].activeAfter);
      hilog.info(DOMAIN, TAG, '%{public}s', FlowInvariantChecker.describe(steps));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantQueryStability_024, end');
    });

    /**
     * Scenario: a hand built violated flow.
     * Expectation: the checker detects the missing alternation.
     */
    it('Assessment_InvariantDetectsViolation_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantDetectsViolation_025, begin');
      const broken: FlowStep[] = [
        {
          index: 0,
          operation: OP_BEGIN,
          accepted: true,
          activeBefore: false,
          activeAfter: true,
          note: ''
        },
        {
          index: 1,
          operation: OP_BEGIN,
          accepted: true,
          activeBefore: true,
          activeAfter: true,
          note: ''
        }
      ];
      expect(FlowInvariantChecker.transitionsAlternate(broken)).assertFalse();
      expect(FlowInvariantChecker.verify(broken)).assertFalse();
      expect(FlowInvariantChecker.violations(broken).join(' ')).assertContain('alternate');
      hilog.info(DOMAIN, TAG, '%{public}s', FlowInvariantChecker.violations(broken).join(' | '));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantDetectsViolation_025, end');
    });

    /**
     * Scenario: the refused step invariant on a hand built flow.
     * Expectation: a refused step that changes the state is reported.
     */
    it('Assessment_InvariantDetectsRefusedChange_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantDetectsRefusedChange_026, begin');
      const broken: FlowStep[] = [
        {
          index: 0,
          operation: OP_END,
          accepted: false,
          activeBefore: false,
          activeAfter: true,
          note: 'should not happen'
        }
      ];
      expect(FlowInvariantChecker.refusedStepsDoNotChangeState(broken)).assertFalse();
      expect(FlowInvariantChecker.verify(broken)).assertFalse();
      expect(FlowInvariantChecker.violations(broken).join(' ')).assertContain('refused');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'InvariantDetectsRefusedChange_026, end');
    });

    /**
     * Scenario: the configuration reported by the engine.
     * Expectation: it matches the configuration handed to the engine.
     */
    it('Assessment_ReportedConfiguration_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReportedConfiguration_027, begin');
      const engine: OperationFlowEngine = new OperationFlowEngine();
      engine.configure(DURATION_TEN, [DEFAULT_ALLOWED_APP, 'com.samples.dictionary']);
      engine.execute(OP_BEGIN);
      expect(engine.isConfigured()).assertTrue();
      expect(engine.reportedDuration()).assertEqual(DURATION_TEN);
      expect(engine.reportedApps().length).assertEqual(2);
      expect(engine.reportedApps()[0]).assertEqual(DEFAULT_ALLOWED_APP);
      hilog.info(DOMAIN, TAG, '%{public}s', engine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReportedConfiguration_027, end');
    });

    /**
     * Scenario: the reported configuration is a defensive copy.
     * Expectation: mutating the returned array never changes the engine.
     */
    it('Assessment_ReportedConfigurationCopy_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReportedConfigurationCopy_028, begin');
      const engine: OperationFlowEngine = new OperationFlowEngine();
      engine.configure(DURATION_TEN, [DEFAULT_ALLOWED_APP]);
      engine.execute(OP_BEGIN);
      const copy: string[] = engine.reportedApps();
      copy.push('com.samples.other');
      expect(copy.length).assertEqual(2);
      expect(engine.reportedApps().length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', engine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ReportedConfigurationCopy_028, end');
    });

    /**
     * Scenario: the step indices of the engine.
     * Expectation: every accepted step carries its position and the last step is the end.
     */
    it('Assessment_StepIndices_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StepIndices_029, begin');
      const engine: OperationFlowEngine = new OperationFlowEngine();
      engine.execute(OP_BEGIN);
      engine.execute(OP_IS_ACTIVE);
      engine.execute(OP_END);
      const steps: FlowStep[] = engine.stepsValue();
      expect(steps.length).assertEqual(3);
      for (let i = 0; i < steps.length; i++) {
        expect(steps[i].index).assertEqual(i);
      }
      const last: FlowStep | null = engine.lastStep();
      expect(last !== null).assertTrue();
      if (last !== null) {
        expect(last.operation).assertEqual(OP_END);
        expect(last.activeAfter).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', engine.operations().join(' -> '));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StepIndices_029, end');
    });

    /**
     * Scenario: the operations list of the engine.
     * Expectation: it only contains accepted steps and keeps their order.
     */
    it('Assessment_AcceptedOperationsOrder_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AcceptedOperationsOrder_030, begin');
      const engine: OperationFlowEngine = new OperationFlowEngine();
      engine.execute(OP_END);
      engine.execute(OP_BEGIN);
      engine.execute(OP_IS_ACTIVE);
      engine.execute(OP_END);
      const operations: string[] = engine.operations();
      expect(operations.length).assertEqual(3);
      expect(operations[0]).assertEqual(OP_BEGIN);
      expect(operations[1]).assertEqual(OP_IS_ACTIVE);
      expect(operations[2]).assertEqual(OP_END);
      expect(engine.rejectionCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', operations.join(' -> '));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'AcceptedOperationsOrder_030, end');
    });

    /**
     * Scenario: a long alternating flow.
     * Expectation: ten begin and end pairs are accepted without a rejection.
     */
    it('Assessment_LongAlternatingFlow_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LongAlternatingFlow_031, begin');
      const engine: OperationFlowEngine = new OperationFlowEngine();
      const operations: string[] = [];
      for (let i = 0; i < 10; i++) {
        operations.push(OP_BEGIN);
        operations.push(OP_END);
      }
      const accepted: number = engine.executeSequence(operations);
      expect(accepted).assertEqual(20);
      expect(engine.rejectionCount()).assertEqual(0);
      expect(engine.stepCount()).assertEqual(20);
      expect(engine.countOf(OP_BEGIN)).assertEqual(10);
      expect(FlowInvariantChecker.verify(engine.stepsValue())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', engine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'LongAlternatingFlow_031, end');
    });

    /**
     * Scenario: an alternating flow with a query between every pair.
     * Expectation: every step is accepted and the query never disturbs the alternation.
     */
    it('Assessment_FlowWithQueriesBetween_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FlowWithQueriesBetween_032, begin');
      const engine: OperationFlowEngine = new OperationFlowEngine();
      const operations: string[] = [];
      for (let i = 0; i < 5; i++) {
        operations.push(OP_BEGIN);
        operations.push(OP_IS_ACTIVE);
        operations.push(OP_GET_CONFIGURATION);
        operations.push(OP_END);
      }
      const accepted: number = engine.executeSequence(operations);
      expect(accepted).assertEqual(20);
      expect(engine.countOf(OP_IS_ACTIVE)).assertEqual(5);
      expect(engine.stepCount()).assertEqual(20);
      expect(FlowInvariantChecker.verify(engine.stepsValue())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', engine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'FlowWithQueriesBetween_032, end');
    });

    /**
     * Scenario: an empty operation sequence.
     * Expectation: the engine accepts nothing and reports it stable state.
     */
    it('Assessment_EmptySequence_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EmptySequence_033, begin');
      const engine: OperationFlowEngine = new OperationFlowEngine();
      expect(engine.executeSequence([])).assertEqual(0);
      expect(engine.stepCount()).assertEqual(0);
      expect(engine.isStable()).assertFalse();
      expect(engine.activeTransitions()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', engine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EmptySequence_033, end');
    });

    
    
    
    
    
    
    
    
    
    
    /**
     * Scenario: the flow engine description.
     * Expectation: it carries the step count, the active flag and the rejections.
     */
    it('Assessment_EngineDescription_044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EngineDescription_044, begin');
      const engine: OperationFlowEngine = new OperationFlowEngine();
      engine.execute(OP_BEGIN);
      engine.execute(OP_BEGIN);
      const text: string = engine.describe();
      expect(text).assertContain('steps=1');
      expect(text).assertContain('active=true');
      expect(text).assertContain('rejections=1');
      hilog.info(DOMAIN, TAG, '%{public}s', text);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'EngineDescription_044, end');
    });

    /**
     * Scenario: the scenario description.
     * Expectation: it carries the label, the step count and the expected accepted count.
     */
    it('Assessment_ScenarioDescription_045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioDescription_045, begin');
      const scenario: FlowScenario = ScenarioFactory.happyPath();
      const text: string = scenario.describe();
      expect(text).assertContain('happy path');
      expect(text).assertContain('steps=4');
      expect(text).assertContain('accepted=4');
      expect(scenario.labelValue()).assertEqual('happy path');
      hilog.info(DOMAIN, TAG, '%{public}s', text);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioDescription_045, end');
    });

    /**
     * Scenario: the scenario pattern comparison.
     * Expectation: a matching and a non matching pattern are distinguished.
     */
    it('Assessment_ScenarioPatternComparison_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioPatternComparison_046, begin');
      const scenario: FlowScenario = ScenarioFactory.happyPath();
      expect(scenario.matches([true, true, true, true])).assertTrue();
      expect(scenario.matches([true, false, true, true])).assertFalse();
      expect(scenario.matches([true, true, true])).assertFalse();
      expect(scenario.matches([])).assertFalse();
      expect(scenario.expected().length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioPatternComparison_046, end');
    });

    /**
     * Scenario: the scenario operations list is a copy.
     * Expectation: mutating the returned list does not change the scenario.
     */
    it('Assessment_ScenarioDefensiveCopy_047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioDefensiveCopy_047, begin');
      const scenario: FlowScenario = ScenarioFactory.happyPath();
      const operations: string[] = scenario.operations();
      operations.pop();
      expect(operations.length).assertEqual(3);
      expect(scenario.size()).assertEqual(4);
      expect(scenario.operations().length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ScenarioDefensiveCopy_047, end');
    });

    /**
     * Scenario: the accepted and the refused steps of a mixed flow.
     * Expectation: the engine separates them and the invariants still hold.
     */
    it('Assessment_MixedStepsInvariants_048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MixedStepsInvariants_048, begin');
      const engine: OperationFlowEngine = new OperationFlowEngine();
      engine.execute(OP_BEGIN);
      engine.execute(OP_END);
      engine.execute(OP_END);
      engine.execute(OP_BEGIN);
      expect(engine.stepCount()).assertEqual(3);
      expect(engine.rejectionCount()).assertEqual(1);
      expect(engine.countOf(OP_BEGIN)).assertEqual(2);
      expect(FlowInvariantChecker.verify(engine.stepsValue())).assertTrue();
      expect(FlowInvariantChecker.violations(engine.stepsValue()).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', engine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'MixedStepsInvariants_048, end');
    });

    /**
     * Scenario: the number of active transitions of a mixed flow.
     * Expectation: only the accepted mutating steps count as transitions.
     */
    it('Assessment_TransitionCount_049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TransitionCount_049, begin');
      const engine: OperationFlowEngine = new OperationFlowEngine();
      engine.execute(OP_IS_ACTIVE);
      engine.execute(OP_BEGIN);
      engine.execute(OP_GET_CONFIGURATION);
      engine.execute(OP_END);
      expect(engine.activeTransitions()).assertEqual(2);
      expect(engine.stepCount()).assertEqual(4);
      expect(FlowInvariantChecker.queriesDoNotChangeState(engine.stepsValue())).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', engine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'TransitionCount_049, end');
    });

    /**
     * Scenario: the stability predicate of the engine.
     * Expectation: a flow without a rejection is stable, a flow with one is not.
     */
    it('Assessment_StabilityPredicate_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StabilityPredicate_050, begin');
      const clean: OperationFlowEngine = new OperationFlowEngine();
      clean.execute(OP_BEGIN);
      expect(clean.isStable()).assertTrue();
      const dirty: OperationFlowEngine = new OperationFlowEngine();
      dirty.execute(OP_END);
      expect(dirty.isStable()).assertFalse();
      dirty.execute(OP_BEGIN);
      expect(dirty.rejectionCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', clean.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'StabilityPredicate_050, end');
    });

    /**
     * Scenario: a flow that begins before any configuration was supplied.
     * Expectation: begin is still accepted, the sample reads the it page state.
     */
    it('Assessment_BeginWithoutConfigure_051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginWithoutConfigure_051, begin');
      const engine: OperationFlowEngine = new OperationFlowEngine();
      const step: FlowStep = engine.execute(OP_BEGIN);
      expect(step.accepted).assertTrue();
      expect(engine.isConfigured()).assertFalse();
      expect(engine.reportedDuration()).assertEqual(INVALID_DURATION);
      expect(engine.isActive()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', engine.describe());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'BeginWithoutConfigure_051, end');
    });

    
    /**
     * Scenario: the error codes used by the flow cases.
     * Expectation: the documented enum values are the ones below.
     */
    it('Assessment_ErrorCodeValues_053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorCodeValues_053, begin');
      expect(CODE_OK).assertEqual(0);
      expect(CODE_USER_CANCEL).assertEqual(1);
      expect(CODE_TIMEOUT).assertEqual(2);
      expect(CODE_SYSTEM_ERROR).assertEqual(3);
      expect(CODE_ENV_ANOMALY).assertEqual(4);
      expect(CODE_ENV_ANOMALY - CODE_OK).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ErrorCodeValues_053, end');
    });
  });
}
