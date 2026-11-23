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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import { RESULT_CODE, CONNECTION_NUMBER } from '../Shared/SharedDriver';

enum AbilityOperationKind {
  START_ABILITY = 0,
  START_ABILITY_FOR_RESULT = 1,
  START_ABILITY_WITH_ACCOUNT = 2,
  START_SERVICE = 3,
  STOP_SERVICE = 4,
  TERMINATE_SELF = 5,
  TERMINATE_WITH_RESULT = 6,
  CONNECT_SERVICE = 7,
  DISCONNECT_SERVICE = 8,
  REQUEST_PERMISSIONS = 9,
  SET_MISSION_LABEL = 10,
  IS_TERMINATING = 11
}

enum OperationStatus {
  PENDING = 0,
  RUNNING = 1,
  SUCCEEDED = 2,
  FAILED = 3,
  SKIPPED = 4
}

enum WorkflowPhase {
  PREPARE = 0,
  EXECUTE = 1,
  TEARDOWN = 2
}

class WorkflowStep {
  readonly id: number;
  readonly kind: AbilityOperationKind;
  readonly label: string;
  readonly phase: WorkflowPhase;
  readonly requiresConnection: boolean;
  readonly weight: number;
  readonly expectedCode: number;

  constructor(id: number, kind: AbilityOperationKind, label: string, phase: WorkflowPhase,
    requiresConnection: boolean, weight: number, expectedCode: number) {
    this.id = id;
    this.kind = kind;
    this.label = label;
    this.phase = phase;
    this.requiresConnection = requiresConnection;
    this.weight = weight;
    this.expectedCode = expectedCode;
  }

  isServiceRelated(): boolean {
    return this.kind === AbilityOperationKind.START_SERVICE ||
      this.kind === AbilityOperationKind.STOP_SERVICE ||
      this.kind === AbilityOperationKind.CONNECT_SERVICE ||
      this.kind === AbilityOperationKind.DISCONNECT_SERVICE;
  }

  isTerminal(): boolean {
    return this.kind === AbilityOperationKind.TERMINATE_SELF ||
      this.kind === AbilityOperationKind.TERMINATE_WITH_RESULT ||
      this.kind === AbilityOperationKind.IS_TERMINATING;
  }

  describe(): string {
    return `${this.id}:${this.label}`;
  }
}

class StepResult {
  readonly stepId: number;
  readonly kind: AbilityOperationKind;
  readonly status: OperationStatus;
  readonly code: number;

  constructor(stepId: number, kind: AbilityOperationKind, status: OperationStatus, code: number) {
    this.stepId = stepId;
    this.kind = kind;
    this.status = status;
    this.code = code;
  }

  isSuccess(): boolean {
    return this.status === OperationStatus.SUCCEEDED;
  }

  isFailure(): boolean {
    return this.status === OperationStatus.FAILED;
  }
}

class WorkflowPlan {
  private steps: WorkflowStep[] = [];

  add(step: WorkflowStep): WorkflowPlan {
    this.steps.push(step);
    return this;
  }

  size(): number {
    return this.steps.length;
  }

  isEmpty(): boolean {
    return this.steps.length === 0;
  }

  stepAt(index: number): WorkflowStep | null {
    if (index < 0 || index >= this.steps.length) {
      return null;
    }
    return this.steps[index];
  }

  allSteps(): WorkflowStep[] {
    return this.steps;
  }

  totalWeight(): number {
    let total = 0;
    for (const step of this.steps) {
      total += step.weight;
    }
    return total;
  }

  connectionSteps(): number {
    let count = 0;
    for (const step of this.steps) {
      if (step.requiresConnection) {
        count += 1;
      }
    }
    return count;
  }

  serviceSteps(): number {
    let count = 0;
    for (const step of this.steps) {
      if (step.isServiceRelated()) {
        count += 1;
      }
    }
    return count;
  }

  countByPhase(phase: WorkflowPhase): number {
    let count = 0;
    for (const step of this.steps) {
      if (step.phase === phase) {
        count += 1;
      }
    }
    return count;
  }

  findById(id: number): WorkflowStep | null {
    for (const step of this.steps) {
      if (step.id === id) {
        return step;
      }
    }
    return null;
  }

  labels(): string[] {
    const result: string[] = [];
    for (const step of this.steps) {
      result.push(step.label);
    }
    return result;
  }
}

class WorkflowEngine {
  private plan: WorkflowPlan;
  private results: StepResult[] = [];

  constructor(plan: WorkflowPlan) {
    this.plan = plan;
  }

  runAll(): StepResult[] {
    this.results = [];
    for (const step of this.plan.allSteps()) {
      this.results.push(new StepResult(step.id, step.kind, OperationStatus.SUCCEEDED, step.expectedCode));
    }
    return this.results;
  }

  runUntil(id: number): StepResult[] {
    this.results = [];
    for (const step of this.plan.allSteps()) {
      this.results.push(new StepResult(step.id, step.kind, OperationStatus.SUCCEEDED, step.expectedCode));
      if (step.id === id) {
        break;
      }
    }
    return this.results;
  }

  resultsView(): StepResult[] {
    return this.results;
  }

  successCount(): number {
    let count = 0;
    for (const result of this.results) {
      if (result.isSuccess()) {
        count += 1;
      }
    }
    return count;
  }

  failureCount(): number {
    let count = 0;
    for (const result of this.results) {
      if (result.isFailure()) {
        count += 1;
      }
    }
    return count;
  }

  allSucceeded(): boolean {
    if (this.results.length === 0) {
      return false;
    }
    for (const result of this.results) {
      if (!result.isSuccess()) {
        return false;
      }
    }
    return true;
  }

  codeFor(id: number): number {
    for (const result of this.results) {
      if (result.stepId === id) {
        return result.code;
      }
    }
    return -1;
  }

  executedIds(): number[] {
    const ids: number[] = [];
    for (const result of this.results) {
      ids.push(result.stepId);
    }
    return ids;
  }
}

class WorkflowReport {
  private engine: WorkflowEngine;
  private plan: WorkflowPlan;

  constructor(plan: WorkflowPlan, engine: WorkflowEngine) {
    this.plan = plan;
    this.engine = engine;
  }

  passRate(): number {
    const total = this.plan.size();
    if (total === 0) {
      return 0;
    }
    return this.engine.successCount() / total;
  }

  completed(): boolean {
    return this.engine.resultsView().length === this.plan.size();
  }

  summary(): string {
    return `${this.engine.successCount()}/${this.plan.size()}`;
  }

  failedLabels(): string[] {
    const failed: string[] = [];
    for (const result of this.engine.resultsView()) {
      if (result.isFailure()) {
        const step = this.plan.findById(result.stepId);
        if (step !== null) {
          failed.push(step.label);
        }
      }
    }
    return failed;
  }
}

function buildStandardPlan(): WorkflowPlan {
  const plan = new WorkflowPlan();
  plan.add(new WorkflowStep(1, AbilityOperationKind.START_ABILITY, 'startAbility',
    WorkflowPhase.EXECUTE, false, 1, RESULT_CODE));
  plan.add(new WorkflowStep(2, AbilityOperationKind.START_ABILITY_FOR_RESULT, 'startAbilityForResult',
    WorkflowPhase.EXECUTE, false, 2, RESULT_CODE));
  plan.add(new WorkflowStep(3, AbilityOperationKind.START_ABILITY_WITH_ACCOUNT, 'startAbilityWithAccount',
    WorkflowPhase.EXECUTE, false, 2, RESULT_CODE));
  plan.add(new WorkflowStep(4, AbilityOperationKind.START_SERVICE, 'startServiceExtensionAbility',
    WorkflowPhase.EXECUTE, false, 3, CONNECTION_NUMBER));
  plan.add(new WorkflowStep(5, AbilityOperationKind.CONNECT_SERVICE, 'connectServiceExtensionAbility',
    WorkflowPhase.EXECUTE, true, 3, CONNECTION_NUMBER));
  plan.add(new WorkflowStep(6, AbilityOperationKind.DISCONNECT_SERVICE, 'disconnectServiceExtensionAbility',
    WorkflowPhase.TEARDOWN, true, 3, CONNECTION_NUMBER));
  plan.add(new WorkflowStep(7, AbilityOperationKind.STOP_SERVICE, 'stopServiceExtensionAbility',
    WorkflowPhase.TEARDOWN, false, 3, CONNECTION_NUMBER));
  plan.add(new WorkflowStep(8, AbilityOperationKind.REQUEST_PERMISSIONS, 'requestPermissionsFromUser',
    WorkflowPhase.EXECUTE, false, 2, RESULT_CODE));
  return plan;
}

export default function abilityOperationWorkflowTest(): void {
  describe('AbilityOperationWorkflowSuite', () => {
    let plan: WorkflowPlan = buildStandardPlan();

    beforeAll(() => {
      plan = buildStandardPlan();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'workflow suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'workflow suite end');
    });

    it('AbilityOperationWorkflow_001', 0, async (done: Function) => {
      expect(plan.size()).assertEqual(8);
      expect(plan.isEmpty()).assertFalse();
      done();
    });

    it('AbilityOperationWorkflow_002', 0, async (done: Function) => {
      const first = plan.stepAt(0);
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(first.kind).assertEqual(AbilityOperationKind.START_ABILITY);
        expect(first.label).assertEqual('startAbility');
        expect(first.phase).assertEqual(WorkflowPhase.EXECUTE);
      }
      done();
    });

    it('AbilityOperationWorkflow_003', 0, async (done: Function) => {
      expect(plan.stepAt(-1)).assertNull();
      expect(plan.stepAt(8)).assertNull();
      expect(plan.stepAt(9)).assertNull();
      done();
    });

    it('AbilityOperationWorkflow_004', 0, async (done: Function) => {
      expect(plan.totalWeight()).assertEqual(19);
      expect(plan.connectionSteps()).assertEqual(2);
      expect(plan.serviceSteps()).assertEqual(4);
      done();
    });

    it('AbilityOperationWorkflow_005', 0, async (done: Function) => {
      expect(plan.countByPhase(WorkflowPhase.EXECUTE)).assertEqual(6);
      expect(plan.countByPhase(WorkflowPhase.TEARDOWN)).assertEqual(2);
      expect(plan.countByPhase(WorkflowPhase.PREPARE)).assertEqual(0);
      done();
    });

    it('AbilityOperationWorkflow_006', 0, async (done: Function) => {
      const found = plan.findById(4);
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.isServiceRelated()).assertTrue();
        expect(found.requiresConnection).assertFalse();
        expect(found.expectedCode).assertEqual(CONNECTION_NUMBER);
      }
      expect(plan.findById(99)).assertNull();
      done();
    });

    it('AbilityOperationWorkflow_007', 0, async (done: Function) => {
      const labels = plan.labels();
      expect(labels.length).assertEqual(8);
      expect(labels[0]).assertEqual('startAbility');
      expect(labels[7]).assertEqual('requestPermissionsFromUser');
      done();
    });

    it('AbilityOperationWorkflow_008', 0, async (done: Function) => {
      const step = plan.stepAt(5);
      expect(step !== null).assertTrue();
      if (step !== null) {
        expect(step.isTerminal()).assertFalse();
        expect(step.isServiceRelated()).assertTrue();
        expect(step.requiresConnection).assertTrue();
        expect(step.describe()).assertEqual('6:disconnectServiceExtensionAbility');
      }
      done();
    });

    it('AbilityOperationWorkflow_009', 0, async (done: Function) => {
      const engine = new WorkflowEngine(plan);
      const results = engine.runAll();
      expect(results.length).assertEqual(8);
      expect(engine.successCount()).assertEqual(8);
      expect(engine.failureCount()).assertEqual(0);
      expect(engine.allSucceeded()).assertTrue();
      done();
    });

    it('AbilityOperationWorkflow_010', 0, async (done: Function) => {
      const engine = new WorkflowEngine(plan);
      engine.runAll();
      expect(engine.codeFor(1)).assertEqual(RESULT_CODE);
      expect(engine.codeFor(4)).assertEqual(CONNECTION_NUMBER);
      expect(engine.codeFor(42)).assertEqual(-1);
      done();
    });

    it('AbilityOperationWorkflow_011', 0, async (done: Function) => {
      const engine = new WorkflowEngine(plan);
      const results = engine.runUntil(3);
      expect(results.length).assertEqual(3);
      expect(engine.executedIds().length).assertEqual(3);
      expect(engine.executedIds()[2]).assertEqual(3);
      done();
    });

    it('AbilityOperationWorkflow_012', 0, async (done: Function) => {
      const engine = new WorkflowEngine(plan);
      engine.runUntil(1);
      expect(engine.successCount()).assertEqual(1);
      expect(engine.resultsView().length).assertEqual(1);
      expect(engine.resultsView()[0].status).assertEqual(OperationStatus.SUCCEEDED);
      done();
    });

    it('AbilityOperationWorkflow_013', 0, async (done: Function) => {
      const report = new WorkflowReport(plan, new WorkflowEngine(plan));
      const engine = new WorkflowEngine(plan);
      const freshReport = new WorkflowReport(plan, engine);
      expect(freshReport.completed()).assertFalse();
      expect(freshReport.passRate()).assertEqual(0);
      engine.runAll();
      const fullReport = new WorkflowReport(plan, engine);
      expect(fullReport.completed()).assertTrue();
      expect(report.passRate()).assertEqual(0);
      done();
    });

    it('AbilityOperationWorkflow_014', 0, async (done: Function) => {
      const engine = new WorkflowEngine(plan);
      engine.runAll();
      const report = new WorkflowReport(plan, engine);
      expect(report.summary()).assertEqual('8/8');
      expect(report.passRate()).assertEqual(1);
      expect(report.failedLabels().length).assertEqual(0);
      done();
    });

    it('AbilityOperationWorkflow_015', 0, async (done: Function) => {
      const empty = new WorkflowPlan();
      expect(empty.size()).assertEqual(0);
      expect(empty.isEmpty()).assertTrue();
      expect(empty.totalWeight()).assertEqual(0);
      expect(empty.connectionSteps()).assertEqual(0);
      done();
    });

    it('AbilityOperationWorkflow_016', 0, async (done: Function) => {
      const local = new WorkflowPlan();
      const step = new WorkflowStep(10, AbilityOperationKind.TERMINATE_SELF, 'terminateSelf',
        WorkflowPhase.TEARDOWN, false, 1, RESULT_CODE);
      local.add(step);
      expect(local.size()).assertEqual(1);
      expect(step.isTerminal()).assertTrue();
      expect(step.isServiceRelated()).assertFalse();
      expect(local.countByPhase(WorkflowPhase.TEARDOWN)).assertEqual(1);
      done();
    });

    it('AbilityOperationWorkflow_017', 0, async (done: Function) => {
      const local = new WorkflowPlan();
      local.add(new WorkflowStep(11, AbilityOperationKind.TERMINATE_WITH_RESULT, 'terminateSelfWithResult',
        WorkflowPhase.TEARDOWN, false, 1, RESULT_CODE));
      local.add(new WorkflowStep(12, AbilityOperationKind.IS_TERMINATING, 'isTerminating',
        WorkflowPhase.TEARDOWN, false, 1, 0));
      const first = local.stepAt(0);
      const second = local.stepAt(1);
      expect(local.size()).assertEqual(2);
      expect(first !== null && first.isTerminal()).assertTrue();
      expect(second !== null && second.isTerminal()).assertTrue();
      done();
    });

    it('AbilityOperationWorkflow_018', 0, async (done: Function) => {
      const local = new WorkflowPlan();
      local.add(new WorkflowStep(20, AbilityOperationKind.SET_MISSION_LABEL, 'setMissionLabel',
        WorkflowPhase.PREPARE, false, 1, 0));
      const missionStep = local.stepAt(0);
      expect(missionStep !== null).assertTrue();
      if (missionStep !== null) {
        expect(missionStep.kind).assertEqual(AbilityOperationKind.SET_MISSION_LABEL);
        expect(missionStep.phase).assertEqual(WorkflowPhase.PREPARE);
      }
      done();
    });

    it('AbilityOperationWorkflow_019', 0, async (done: Function) => {
      const engine = new WorkflowEngine(plan);
      engine.runAll();
      const ids = engine.executedIds();
      expect(ids.length).assertEqual(8);
      expect(ids[0]).assertEqual(1);
      expect(ids[7]).assertEqual(8);
      done();
    });

    it('AbilityOperationWorkflow_020', 0, async (done: Function) => {
      const results: StepResult[] = [
        new StepResult(1, AbilityOperationKind.START_ABILITY, OperationStatus.SUCCEEDED, RESULT_CODE),
        new StepResult(2, AbilityOperationKind.START_SERVICE, OperationStatus.FAILED, -1),
        new StepResult(3, AbilityOperationKind.STOP_SERVICE, OperationStatus.SKIPPED, 0)
      ];
      let success = 0;
      let failure = 0;
      for (const r of results) {
        if (r.isSuccess()) {
          success += 1;
        }
        if (r.isFailure()) {
          failure += 1;
        }
      }
      expect(success).assertEqual(1);
      expect(failure).assertEqual(1);
      expect(results[0].code).assertEqual(RESULT_CODE);
      done();
    });

    it('AbilityOperationWorkflow_021', 0, async (done: Function) => {
      const result = new StepResult(7, AbilityOperationKind.STOP_SERVICE, OperationStatus.SKIPPED, 0);
      expect(result.isSuccess()).assertFalse();
      expect(result.isFailure()).assertFalse();
      expect(result.status).assertEqual(OperationStatus.SKIPPED);
      expect(result.stepId).assertEqual(7);
      done();
    });

    it('AbilityOperationWorkflow_022', 0, async (done: Function) => {
      const serviceKinds: AbilityOperationKind[] = [
        AbilityOperationKind.START_SERVICE,
        AbilityOperationKind.STOP_SERVICE,
        AbilityOperationKind.CONNECT_SERVICE,
        AbilityOperationKind.DISCONNECT_SERVICE
      ];
      let serviceRelated = 0;
      for (const kind of serviceKinds) {
        const step = new WorkflowStep(1, kind, 'svc', WorkflowPhase.EXECUTE, false, 1, 0);
        if (step.isServiceRelated()) {
          serviceRelated += 1;
        }
      }
      expect(serviceRelated).assertEqual(4);
      done();
    });

    it('AbilityOperationWorkflow_023', 0, async (done: Function) => {
      const nonServiceKinds: AbilityOperationKind[] = [
        AbilityOperationKind.START_ABILITY,
        AbilityOperationKind.REQUEST_PERMISSIONS,
        AbilityOperationKind.SET_MISSION_LABEL
      ];
      let serviceRelated = 0;
      for (const kind of nonServiceKinds) {
        const step = new WorkflowStep(1, kind, 'plain', WorkflowPhase.EXECUTE, false, 1, 0);
        if (step.isServiceRelated()) {
          serviceRelated += 1;
        }
      }
      expect(serviceRelated).assertEqual(0);
      done();
    });

    it('AbilityOperationWorkflow_024', 0, async (done: Function) => {
      const terminalKinds: AbilityOperationKind[] = [
        AbilityOperationKind.TERMINATE_SELF,
        AbilityOperationKind.TERMINATE_WITH_RESULT,
        AbilityOperationKind.IS_TERMINATING
      ];
      let terminal = 0;
      for (const kind of terminalKinds) {
        const step = new WorkflowStep(1, kind, 'end', WorkflowPhase.TEARDOWN, false, 1, 0);
        if (step.isTerminal()) {
          terminal += 1;
        }
      }
      expect(terminal).assertEqual(3);
      done();
    });

    it('AbilityOperationWorkflow_025', 0, async (done: Function) => {
      const step = new WorkflowStep(4, AbilityOperationKind.START_SERVICE, 'startServiceExtensionAbility',
        WorkflowPhase.EXECUTE, false, 3, CONNECTION_NUMBER);
      expect(step.describe()).assertEqual('4:startServiceExtensionAbility');
      expect(step.weight).assertEqual(3);
      expect(step.expectedCode).assertEqual(CONNECTION_NUMBER);
      done();
    });

    it('AbilityOperationWorkflow_026', 0, async (done: Function) => {
      const labels = plan.labels();
      let unique = true;
      for (let i = 0; i < labels.length; i++) {
        for (let j = i + 1; j < labels.length; j++) {
          if (labels[i] === labels[j]) {
            unique = false;
          }
        }
      }
      expect(unique).assertTrue();
      done();
    });

    it('AbilityOperationWorkflow_027', 0, async (done: Function) => {
      let executeWeight = 0;
      let teardownWeight = 0;
      for (const step of plan.allSteps()) {
        if (step.phase === WorkflowPhase.EXECUTE) {
          executeWeight += step.weight;
        }
        if (step.phase === WorkflowPhase.TEARDOWN) {
          teardownWeight += step.weight;
        }
      }
      expect(executeWeight).assertEqual(13);
      expect(teardownWeight).assertEqual(6);
      expect(executeWeight + teardownWeight).assertEqual(plan.totalWeight());
      done();
    });

    it('AbilityOperationWorkflow_028', 0, async (done: Function) => {
      const engine = new WorkflowEngine(plan);
      engine.runUntil(5);
      expect(engine.executedIds().length).assertEqual(5);
      expect(engine.codeFor(5)).assertEqual(CONNECTION_NUMBER);
      expect(engine.codeFor(6)).assertEqual(-1);
      done();
    });

    it('AbilityOperationWorkflow_029', 0, async (done: Function) => {
      const engine = new WorkflowEngine(plan);
      engine.runAll();
      const report = new WorkflowReport(plan, engine);
      expect(report.summary()).assertEqual('8/8');
      expect(report.failedLabels().length).assertEqual(0);
      expect(report.completed()).assertTrue();
      done();
    });

    it('AbilityOperationWorkflow_030', 0, async (done: Function) => {
      let sumIds = 0;
      for (const step of plan.allSteps()) {
        sumIds += step.id;
      }
      expect(sumIds).assertEqual(36);
      expect(plan.findById(1) !== null).assertTrue();
      expect(plan.findById(8) !== null).assertTrue();
      done();
    });

    it('AbilityOperationWorkflow_031', 0, async (done: Function) => {
      const engine = new WorkflowEngine(plan);
      expect(engine.allSucceeded()).assertFalse();
      engine.runAll();
      expect(engine.allSucceeded()).assertTrue();
      expect(engine.resultsView().length).assertEqual(plan.size());
      done();
    });

    it('AbilityOperationWorkflow_032', 0, async (done: Function) => {
      const engine = new WorkflowEngine(plan);
      engine.runAll();
      let succeeded = 0;
      for (const result of engine.resultsView()) {
        if (result.status === OperationStatus.SUCCEEDED) {
          succeeded += 1;
        }
      }
      expect(succeeded).assertEqual(plan.size());
      expect(engine.failureCount()).assertEqual(0);
      done();
    });
  });
}



