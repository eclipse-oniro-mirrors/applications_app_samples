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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  getBundleName,
  launchEntryAbility,
  doAbilityForeground,
  doAbilityBackground,
  isIndexPageVisible,
  waitForIndexPageStable,
  pageComponentCount,
  checkComponentExistsByKey,
  collectAllTexts,
  serializedDelay,
  measureElapsed,
  isWithinBudget,
  logInfo,
  ENTRY_ABILITY_NAME,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  TIMEOUT_ABILITY_LAUNCH,
  TIMEOUT_BACKGROUND_SWITCH,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum StepStatus {
  STATUS_PENDING = 0,
  STATUS_RUNNING = 1,
  STATUS_DONE = 2,
  STATUS_FAILED = 3
}

enum WorkflowBranch {
  BRANCH_NORMAL = 0,
  BRANCH_BACKGROUND_TIMEOUT = 1,
  BRANCH_RECOVERY = 2
}

enum WorkflowState {
  STATE_IDLE = 0,
  STATE_RUNNING = 1,
  STATE_COMPLETED = 2,
  STATE_ABORTED = 3
}

interface WorkflowStep {
  key: string;
  label: string;
  branch: WorkflowBranch;
  requiredBudgetMs: number;
  optional: boolean;
}

interface WorkflowSnapshot {
  state: WorkflowState;
  branch: WorkflowBranch;
  completedKeys: string[];
  failedKeys: string[];
  elapsedMs: number;
}

class WorkflowCatalog {
  public static readonly NORMAL_STEP_CREATE: WorkflowStep = {
    key: 'wf_normal_create',
    label: 'CreateStageContext',
    branch: WorkflowBranch.BRANCH_NORMAL,
    requiredBudgetMs: 50,
    optional: false
  };
  public static readonly NORMAL_STEP_WINDOW: WorkflowStep = {
    key: 'wf_normal_window',
    label: 'AttachWindowStage',
    branch: WorkflowBranch.BRANCH_NORMAL,
    requiredBudgetMs: 120,
    optional: false
  };
  public static readonly NORMAL_STEP_FOREGROUND: WorkflowStep = {
    key: 'wf_normal_foreground',
    label: 'EnterForeground',
    branch: WorkflowBranch.BRANCH_NORMAL,
    requiredBudgetMs: 30,
    optional: false
  };
  public static readonly TIMEOUT_STEP_DETECT: WorkflowStep = {
    key: 'wf_timeout_detect',
    label: 'DetectBackgroundTimeout',
    branch: WorkflowBranch.BRANCH_BACKGROUND_TIMEOUT,
    requiredBudgetMs: 1500,
    optional: false
  };
  public static readonly TIMEOUT_STEP_RELEASE: WorkflowStep = {
    key: 'wf_timeout_release',
    label: 'ReleaseWindowResources',
    branch: WorkflowBranch.BRANCH_BACKGROUND_TIMEOUT,
    requiredBudgetMs: 200,
    optional: false
  };
  public static readonly TIMEOUT_STEP_DESTROY: WorkflowStep = {
    key: 'wf_timeout_destroy',
    label: 'DestroyAbilityInstance',
    branch: WorkflowBranch.BRANCH_BACKGROUND_TIMEOUT,
    requiredBudgetMs: 80,
    optional: false
  };
  public static readonly RECOVERY_STEP_RELOAD: WorkflowStep = {
    key: 'wf_recovery_reload',
    label: 'ReloadIndexPage',
    branch: WorkflowBranch.BRANCH_RECOVERY,
    requiredBudgetMs: 400,
    optional: false
  };
  public static readonly RECOVERY_STEP_RESTORE_FOCUS: WorkflowStep = {
    key: 'wf_recovery_restore_focus',
    label: 'RestoreFocusOrder',
    branch: WorkflowBranch.BRANCH_RECOVERY,
    requiredBudgetMs: 60,
    optional: true
  };

  public static allSteps(): WorkflowStep[] {
    return [
      WorkflowCatalog.NORMAL_STEP_CREATE,
      WorkflowCatalog.NORMAL_STEP_WINDOW,
      WorkflowCatalog.NORMAL_STEP_FOREGROUND,
      WorkflowCatalog.TIMEOUT_STEP_DETECT,
      WorkflowCatalog.TIMEOUT_STEP_RELEASE,
      WorkflowCatalog.TIMEOUT_STEP_DESTROY,
      WorkflowCatalog.RECOVERY_STEP_RELOAD,
      WorkflowCatalog.RECOVERY_STEP_RESTORE_FOCUS
    ];
  }

  public static stepsOfBranch(branch: WorkflowBranch): WorkflowStep[] {
    return WorkflowCatalog.allSteps().filter((step: WorkflowStep) => step.branch === branch);
  }
}

class BranchSelector {
  private backgroundElapsedMs: number = 0;
  private timeoutThresholdMs: number = 0;
  private forceRecovery: boolean = false;

  constructor(backgroundElapsedMs: number, timeoutThresholdMs: number, forceRecovery: boolean) {
    this.backgroundElapsedMs = backgroundElapsedMs;
    this.timeoutThresholdMs = timeoutThresholdMs;
    this.forceRecovery = forceRecovery;
  }

  public isTimeout(): boolean {
    return this.backgroundElapsedMs > this.timeoutThresholdMs;
  }

  public select(): WorkflowBranch {
    if (this.forceRecovery) {
      return WorkflowBranch.BRANCH_RECOVERY;
    }
    if (this.isTimeout()) {
      return WorkflowBranch.BRANCH_BACKGROUND_TIMEOUT;
    }
    return WorkflowBranch.BRANCH_NORMAL;
  }

  public marginMs(): number {
    return this.timeoutThresholdMs - this.backgroundElapsedMs;
  }

  public describeSelection(): string {
    return `branch:${this.select()},margin:${this.marginMs()}`;
  }
}

class BranchConditionEvaluator {
  private expectedBranch: WorkflowBranch = WorkflowBranch.BRANCH_NORMAL;

  constructor(expectedBranch: WorkflowBranch) {
    this.expectedBranch = expectedBranch;
  }

  public accepts(step: WorkflowStep): boolean {
    return step.branch === this.expectedBranch;
  }

  public filter(steps: WorkflowStep[]): WorkflowStep[] {
    return steps.filter((step: WorkflowStep) => this.accepts(step));
  }

  public isApplicable(step: WorkflowStep, requiredBudgetAvailable: number): boolean {
    if (!this.accepts(step)) {
      return false;
    }
    if (step.optional) {
      return true;
    }
    return requiredBudgetAvailable >= step.requiredBudgetMs;
  }

  public countApplicable(steps: WorkflowStep[], requiredBudgetAvailable: number): number {
    return steps.filter((step: WorkflowStep) => this.isApplicable(step, requiredBudgetAvailable)).length;
  }
}

class WorkflowRunner {
  private steps: WorkflowStep[] = [];
  private branch: WorkflowBranch = WorkflowBranch.BRANCH_NORMAL;
  private state: WorkflowState = WorkflowState.STATE_IDLE;
  private statuses: Map<string, StepStatus> = new Map<string, StepStatus>();
  private completed: string[] = [];
  private failed: string[] = [];
  private locked: boolean = false;

  constructor(steps: WorkflowStep[], branch: WorkflowBranch) {
    this.steps = steps;
    this.branch = branch;
    steps.forEach((step: WorkflowStep) => {
      this.statuses.set(step.key, StepStatus.STATUS_PENDING);
    });
  }

  public getState(): WorkflowState {
    return this.state;
  }

  public getBranch(): WorkflowBranch {
    return this.branch;
  }

  public statusOf(key: string): StepStatus {
    const status: StepStatus | undefined = this.statuses.get(key);
    return status === undefined ? StepStatus.STATUS_PENDING : status;
  }

  public begin(): boolean {
    if (this.state !== WorkflowState.STATE_IDLE) {
      return false;
    }
    if (this.locked) {
      return false;
    }
    this.locked = true;
    this.state = WorkflowState.STATE_RUNNING;
    return true;
  }

  public runStep(key: string, elapsedMs: number, budgetMs: number): StepStatus {
    if (this.state !== WorkflowState.STATE_RUNNING) {
      return StepStatus.STATUS_PENDING;
    }
    if (this.statusOf(key) !== StepStatus.STATUS_PENDING) {
      return this.statusOf(key);
    }
    this.statuses.set(key, StepStatus.STATUS_RUNNING);
    if (elapsedMs > budgetMs) {
      this.statuses.set(key, StepStatus.STATUS_FAILED);
      this.failed.push(key);
      return StepStatus.STATUS_FAILED;
    }
    this.statuses.set(key, StepStatus.STATUS_DONE);
    this.completed.push(key);
    return StepStatus.STATUS_DONE;
  }

  public runAll(elapsedMs: number): void {
    for (let i = 0; i < this.steps.length; i++) {
      this.runStep(this.steps[i].key, elapsedMs, this.steps[i].requiredBudgetMs);
    }
    this.finishLocked();
  }

  public finishLocked(): void {
    this.state = this.failed.length > 0 ? WorkflowState.STATE_ABORTED : WorkflowState.STATE_COMPLETED;
    this.locked = false;
  }

  public abort(): void {
    this.state = WorkflowState.STATE_ABORTED;
    this.locked = false;
  }

  public getCompletedKeys(): string[] {
    return this.completed;
  }

  public getFailedKeys(): string[] {
    return this.failed;
  }

  public countOf(status: StepStatus): number {
    let count: number = 0;
    this.statuses.forEach((value: StepStatus) => {
      if (value === status) {
        count++;
      }
    });
    return count;
  }

  public snapshot(elapsedMs: number): WorkflowSnapshot {
    const snapshot: WorkflowSnapshot = {
      state: this.state,
      branch: this.branch,
      completedKeys: this.completed.slice(),
      failedKeys: this.failed.slice(),
      elapsedMs: elapsedMs
    };
    return snapshot;
  }

  public restore(snapshot: WorkflowSnapshot): void {
    this.branch = snapshot.branch;
    this.state = snapshot.state;
    this.completed = snapshot.completedKeys.slice();
    this.failed = snapshot.failedKeys.slice();
    this.locked = false;
    this.statuses.clear();
    this.steps.forEach((step: WorkflowStep) => {
      if (this.completed.includes(step.key)) {
        this.statuses.set(step.key, StepStatus.STATUS_DONE);
      } else if (this.failed.includes(step.key)) {
        this.statuses.set(step.key, StepStatus.STATUS_FAILED);
      } else {
        this.statuses.set(step.key, StepStatus.STATUS_PENDING);
      }
    });
  }
}

class WorkflowReentrancyGuard {
  private activeKey: string = '';
  private acquisitions: number = 0;
  private rejections: number = 0;

  public acquire(key: string): boolean {
    if (this.activeKey.length > 0) {
      this.rejections++;
      return false;
    }
    this.activeKey = key;
    this.acquisitions++;
    return true;
  }

  public release(key: string): boolean {
    if (this.activeKey !== key) {
      return false;
    }
    this.activeKey = '';
    return true;
  }

  public isBusy(): boolean {
    return this.activeKey.length > 0;
  }

  public getActiveKey(): string {
    return this.activeKey;
  }

  public getAcquisitions(): number {
    return this.acquisitions;
  }

  public getRejections(): number {
    return this.rejections;
  }

  public reset(): void {
    this.activeKey = '';
    this.acquisitions = 0;
    this.rejections = 0;
  }
}

class WorkflowSnapshotStore {
  private snapshots: Map<string, WorkflowSnapshot> = new Map<string, WorkflowSnapshot>();
  private order: string[] = [];

  public save(key: string, snapshot: WorkflowSnapshot): void {
    if (!this.snapshots.has(key)) {
      this.order.push(key);
    }
    this.snapshots.set(key, snapshot);
  }

  public load(key: string): WorkflowSnapshot | null {
    const snapshot: WorkflowSnapshot | undefined = this.snapshots.get(key);
    return snapshot === undefined ? null : snapshot;
  }

  public has(key: string): boolean {
    return this.snapshots.has(key);
  }

  public size(): number {
    return this.snapshots.size;
  }

  public keys(): string[] {
    return this.order.slice();
  }

  public latest(): WorkflowSnapshot | null {
    if (this.order.length === 0) {
      return null;
    }
    return this.load(this.order[this.order.length - 1]);
  }

  public drop(key: string): boolean {
    if (!this.snapshots.has(key)) {
      return false;
    }
    this.snapshots.delete(key);
    this.order = this.order.filter((item: string) => item !== key);
    return true;
  }

  public clear(): void {
    this.snapshots.clear();
    this.order = [];
  }
}

class WorkflowBudgetGate {
  private budgetMs: number = 0;
  private consumedMs: number = 0;

  constructor(budgetMs: number) {
    this.budgetMs = budgetMs;
  }

  public getBudget(): number {
    return this.budgetMs;
  }

  public getConsumed(): number {
    return this.consumedMs;
  }

  public remaining(): number {
    const remaining: number = this.budgetMs - this.consumedMs;
    return remaining < 0 ? 0 : remaining;
  }

  public consume(amountMs: number): boolean {
    if (amountMs < 0) {
      return false;
    }
    if (this.consumedMs + amountMs > this.budgetMs) {
      return false;
    }
    this.consumedMs += amountMs;
    return true;
  }

  public isExhausted(): boolean {
    return this.remaining() === 0;
  }

  public resetTo(budgetMs: number): void {
    this.budgetMs = budgetMs;
    this.consumedMs = 0;
  }

  public utilizationPercent(): number {
    if (this.budgetMs === 0) {
      return 0;
    }
    return Math.round(this.consumedMs * 100 / this.budgetMs);
  }
}

class WorkflowAuditTrail {
  private entries: string[] = [];
  private counters: Map<string, number> = new Map<string, number>();

  public record(action: string): void {
    this.entries.push(action);
    const current: number | undefined = this.counters.get(action);
    this.counters.set(action, current === undefined ? 1 : current + 1);
  }

  public size(): number {
    return this.entries.length;
  }

  public getEntries(): string[] {
    return this.entries.slice();
  }

  public countOf(action: string): number {
    const count: number | undefined = this.counters.get(action);
    return count === undefined ? 0 : count;
  }

  public lastAction(): string {
    return this.entries.length === 0 ? '' : this.entries[this.entries.length - 1];
  }

  public firstAction(): string {
    return this.entries.length === 0 ? '' : this.entries[0];
  }

  public hasSequence(first: string, second: string): boolean {
    for (let i = 0; i < this.entries.length - 1; i++) {
      if (this.entries[i] === first && this.entries[i + 1] === second) {
        return true;
      }
    }
    return false;
  }

  public clear(): void {
    this.entries = [];
    this.counters.clear();
  }
}

class WorkflowRecoveryPlanner {
  private selector: BranchSelector;

  constructor(selector: BranchSelector) {
    this.selector = selector;
  }

  public plan(branch: WorkflowBranch): WorkflowStep[] {
    const steps: WorkflowStep[] = WorkflowCatalog.stepsOfBranch(branch);
    if (branch === WorkflowBranch.BRANCH_RECOVERY) {
      return steps.slice();
    }
    return steps.slice();
  }

  public totalBudget(branch: WorkflowBranch): number {
    let total: number = 0;
    WorkflowCatalog.stepsOfBranch(branch).forEach((step: WorkflowStep) => {
      total += step.requiredBudgetMs;
    });
    return total;
  }

  public requiredBudget(branch: WorkflowBranch): number {
    let total: number = 0;
    WorkflowCatalog.stepsOfBranch(branch).forEach((step: WorkflowStep) => {
      if (!step.optional) {
        total += step.requiredBudgetMs;
      }
    });
    return total;
  }

  public recommendedBranch(): WorkflowBranch {
    return this.selector.select();
  }

  public describePlan(): string {
    const branch: WorkflowBranch = this.recommendedBranch();
    return `plan:${branch},steps:${WorkflowCatalog.stepsOfBranch(branch).length},budget:${this.totalBudget(branch)}`;
  }
}

class WorkflowStepIndex {
  private steps: WorkflowStep[] = [];

  constructor(steps: WorkflowStep[]) {
    this.steps = steps;
  }

  public byKey(key: string): WorkflowStep | null {
    const matched: WorkflowStep | undefined = this.steps.find((step: WorkflowStep) => step.key === key);
    return matched === undefined ? null : matched;
  }

  public byLabel(label: string): WorkflowStep | null {
    const matched: WorkflowStep | undefined = this.steps.find((step: WorkflowStep) => step.label === label);
    return matched === undefined ? null : matched;
  }

  public optionalSteps(): WorkflowStep[] {
    return this.steps.filter((step: WorkflowStep) => step.optional);
  }

  public requiredSteps(): WorkflowStep[] {
    return this.steps.filter((step: WorkflowStep) => !step.optional);
  }

  public budgetOf(key: string): number {
    const matched: WorkflowStep | null = this.byKey(key);
    return matched === null ? 0 : matched.requiredBudgetMs;
  }

  public heaviestKey(): string {
    let heaviest: WorkflowStep = this.steps[0];
    for (let i = 1; i < this.steps.length; i++) {
      if (this.steps[i].requiredBudgetMs > heaviest.requiredBudgetMs) {
        heaviest = this.steps[i];
      }
    }
    return heaviest.key;
  }

  public allKeysUnique(): boolean {
    const keys: Set<string> = new Set<string>();
    this.steps.forEach((step: WorkflowStep) => keys.add(step.key));
    return keys.size === this.steps.length;
  }
}

export default function lifecycleWorkflowTest(): void {
  describe('LifecycleWorkflowTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
      logInfo('LifecycleWorkflowTest: beforeAll completed');

      await ensureIndexPageInitial(driver);
    });

    afterAll(async () => {
      await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
      logInfo('LifecycleWorkflowTest: afterAll completed');
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_0100
     * @tc.name testWorkflowStepCatalogueSize
     * @tc.desc Verify workflow catalogue: eight steps in total split as 3 normal, 3 background timeout and 2
     * recovery steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWorkflowStepCatalogueSize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(WorkflowCatalog.allSteps().length).assertEqual(8);
        expect(WorkflowCatalog.stepsOfBranch(WorkflowBranch.BRANCH_NORMAL).length).assertEqual(3);
        expect(WorkflowCatalog.stepsOfBranch(WorkflowBranch.BRANCH_BACKGROUND_TIMEOUT).length).assertEqual(3);
        expect(WorkflowCatalog.stepsOfBranch(WorkflowBranch.BRANCH_RECOVERY).length).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_0200
     * @tc.name testWorkflowStepKeysUnique
     * @tc.desc Verify step identity: the eight step keys are pairwise unique and lookup by key resolves the window
     * step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWorkflowStepKeysUnique', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const index: WorkflowStepIndex = new WorkflowStepIndex(WorkflowCatalog.allSteps());
        const windowStep: WorkflowStep | null = index.byKey('wf_normal_window');
        expect(index.allKeysUnique()).assertTrue();
        expect(windowStep === null).assertFalse();
        if (windowStep !== null) {
          expect(windowStep.requiredBudgetMs).assertEqual(120);
          expect(windowStep.branch).assertEqual(WorkflowBranch.BRANCH_NORMAL);
        }
        expect(index.byKey('wf_missing') === null).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_0300
     * @tc.name testSelectorChoosesNormalBranch
     * @tc.desc Verify branch selection: 400 ms in background under a 1500 ms threshold selects the normal branch with a
     * positive margin of 1100 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSelectorChoosesNormalBranch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const selector: BranchSelector = new BranchSelector(400, 1500, false);
        expect(selector.isTimeout()).assertFalse();
        expect(selector.select()).assertEqual(WorkflowBranch.BRANCH_NORMAL);
        expect(selector.marginMs()).assertEqual(1100);
        expect(selector.describeSelection()).assertEqual('branch:0,margin:1100');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_0400
     * @tc.name testSelectorChoosesTimeoutBranch
     * @tc.desc Verify timeout branch: exactly 1500 ms is not a timeout while 1501 ms crosses the threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSelectorChoosesTimeoutBranch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const boundary: BranchSelector = new BranchSelector(1500, 1500, false);
        const crossed: BranchSelector = new BranchSelector(1501, 1500, false);
        expect(boundary.isTimeout()).assertFalse();
        expect(boundary.select()).assertEqual(WorkflowBranch.BRANCH_NORMAL);
        expect(crossed.isTimeout()).assertTrue();
        expect(crossed.select()).assertEqual(WorkflowBranch.BRANCH_BACKGROUND_TIMEOUT);
        expect(crossed.marginMs()).assertEqual(-1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_0500
     * @tc.name testSelectorForcedRecovery
     * @tc.desc Verify recovery precedence: a forced recovery request overrides both the normal and timeout branch,
     * including a 2000 ms background stay
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSelectorForcedRecovery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const forced: BranchSelector = new BranchSelector(2000, 1500, true);
        const forcedShort: BranchSelector = new BranchSelector(10, 1500, true);
        expect(forced.select()).assertEqual(WorkflowBranch.BRANCH_RECOVERY);
        expect(forcedShort.select()).assertEqual(WorkflowBranch.BRANCH_RECOVERY);
        expect(forced.isTimeout()).assertTrue();
        expect(forcedShort.isTimeout()).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_0600
     * @tc.name testConditionEvaluatorFilters
     * @tc.desc Verify branch conditions: the normal evaluator keeps 3 of 8 steps and rejects timeout and recovery
     * steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConditionEvaluatorFilters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const evaluator: BranchConditionEvaluator =
          new BranchConditionEvaluator(WorkflowBranch.BRANCH_NORMAL);
        const filtered: WorkflowStep[] = evaluator.filter(WorkflowCatalog.allSteps());
        expect(filtered.length).assertEqual(3);
        expect(evaluator.accepts(WorkflowCatalog.TIMEOUT_STEP_DETECT)).assertFalse();
        expect(evaluator.accepts(WorkflowCatalog.RECOVERY_STEP_RELOAD)).assertFalse();
        expect(evaluator.accepts(WorkflowCatalog.NORMAL_STEP_CREATE)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_0700
     * @tc.name testConditionBudgetApplicability
     * @tc.desc Verify budget conditions: with 100 ms available only the optional recovery step is applicable, and the
     * recovery reload step needs 400 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConditionBudgetApplicability', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const evaluator: BranchConditionEvaluator =
          new BranchConditionEvaluator(WorkflowBranch.BRANCH_RECOVERY);
        const steps: WorkflowStep[] = WorkflowCatalog.stepsOfBranch(WorkflowBranch.BRANCH_RECOVERY);
        expect(evaluator.countApplicable(steps, 100)).assertEqual(1);
        expect(evaluator.countApplicable(steps, 400)).assertEqual(2);
        expect(evaluator.isApplicable(WorkflowCatalog.RECOVERY_STEP_RELOAD, 399)).assertFalse();
        expect(evaluator.isApplicable(WorkflowCatalog.RECOVERY_STEP_RESTORE_FOCUS, 0)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_0800
     * @tc.name testConditionEvaluatorOtherBranches
     * @tc.desc Verify timeout branch conditions: the timeout evaluator keeps 3 steps and the heaviest one costs 1500 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConditionEvaluatorOtherBranches', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const evaluator: BranchConditionEvaluator =
          new BranchConditionEvaluator(WorkflowBranch.BRANCH_BACKGROUND_TIMEOUT);
        const filtered: WorkflowStep[] = evaluator.filter(WorkflowCatalog.allSteps());
        const index: WorkflowStepIndex = new WorkflowStepIndex(WorkflowCatalog.allSteps());
        expect(filtered.length).assertEqual(3);
        expect(filtered[0].key).assertEqual('wf_timeout_detect');
        expect(index.budgetOf('wf_timeout_detect')).assertEqual(1500);
        expect(index.heaviestKey()).assertEqual('wf_timeout_detect');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_0900
     * @tc.name testRunnerFullNormalPath
     * @tc.desc Verify the normal path: begin succeeds once, all three normal steps complete and the workflow state
     * becomes COMPLETED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRunnerFullNormalPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const steps: WorkflowStep[] = WorkflowCatalog.stepsOfBranch(WorkflowBranch.BRANCH_NORMAL);
        const runner: WorkflowRunner = new WorkflowRunner(steps, WorkflowBranch.BRANCH_NORMAL);
        expect(runner.begin()).assertTrue();
        expect(runner.getState()).assertEqual(WorkflowState.STATE_RUNNING);
        runner.runAll(10);
        expect(runner.getState()).assertEqual(WorkflowState.STATE_COMPLETED);
        expect(runner.getCompletedKeys().length).assertEqual(3);
        expect(runner.countOf(StepStatus.STATUS_DONE)).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_1000
     * @tc.name testRunnerStepOrder
     * @tc.desc Verify completion order: the normal branch completes create, window and foreground in that exact order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRunnerStepOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const steps: WorkflowStep[] = WorkflowCatalog.stepsOfBranch(WorkflowBranch.BRANCH_NORMAL);
        const runner: WorkflowRunner = new WorkflowRunner(steps, WorkflowBranch.BRANCH_NORMAL);
        runner.begin();
        runner.runAll(5);
        const completed: string[] = runner.getCompletedKeys();
        expect(completed[0]).assertEqual('wf_normal_create');
        expect(completed[1]).assertEqual('wf_normal_window');
        expect(completed[2]).assertEqual('wf_normal_foreground');
        expect(runner.getFailedKeys().length).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_1100
     * @tc.name testRunnerTimeoutPath
     * @tc.desc Verify the timeout path: a step exceeding its 1500 ms budget fails and aborts the workflow with 1
     * failed key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRunnerTimeoutPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const steps: WorkflowStep[] = WorkflowCatalog.stepsOfBranch(WorkflowBranch.BRANCH_BACKGROUND_TIMEOUT);
        const runner: WorkflowRunner = new WorkflowRunner(steps, WorkflowBranch.BRANCH_BACKGROUND_TIMEOUT);
        runner.begin();
        expect(runner.runStep('wf_timeout_detect', 1501, 1500)).assertEqual(StepStatus.STATUS_FAILED);
        expect(runner.statusOf('wf_timeout_detect')).assertEqual(StepStatus.STATUS_FAILED);
        expect(runner.getFailedKeys().length).assertEqual(1);
        runner.finishLocked();
        expect(runner.getState()).assertEqual(WorkflowState.STATE_ABORTED);
        expect(runner.countOf(StepStatus.STATUS_PENDING)).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_1200
     * @tc.name testRunnerBudgetBoundary
     * @tc.desc Verify the timeout boundary: spending exactly the 200 ms release budget passes while one extra
     * millisecond fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRunnerBudgetBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const steps: WorkflowStep[] = WorkflowCatalog.stepsOfBranch(WorkflowBranch.BRANCH_BACKGROUND_TIMEOUT);
        const runner: WorkflowRunner = new WorkflowRunner(steps, WorkflowBranch.BRANCH_BACKGROUND_TIMEOUT);
        runner.begin();
        expect(runner.runStep('wf_timeout_release', 200, 200)).assertEqual(StepStatus.STATUS_DONE);
        expect(runner.runStep('wf_timeout_destroy', 81, 80)).assertEqual(StepStatus.STATUS_FAILED);
        expect(runner.statusOf('wf_timeout_release')).assertEqual(StepStatus.STATUS_DONE);
        expect(runner.countOf(StepStatus.STATUS_FAILED)).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_1300
     * @tc.name testRunnerRejectsBeforeBegin
     * @tc.desc Verify state gating: running a step before begin leaves it pending, and a second begin after the first
     * is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRunnerRejectsBeforeBegin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const steps: WorkflowStep[] = WorkflowCatalog.stepsOfBranch(WorkflowBranch.BRANCH_NORMAL);
        const runner: WorkflowRunner = new WorkflowRunner(steps, WorkflowBranch.BRANCH_NORMAL);
        expect(runner.runStep('wf_normal_create', 1, 50)).assertEqual(StepStatus.STATUS_PENDING);
        expect(runner.begin()).assertTrue();
        expect(runner.begin()).assertFalse();
        expect(runner.getState()).assertEqual(WorkflowState.STATE_RUNNING);
        expect(runner.countOf(StepStatus.STATUS_PENDING)).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_1400
     * @tc.name testRunnerIdempotentStep
     * @tc.desc Verify step idempotency: re-running an already completed step keeps it DONE and does not append a second
     * completed key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRunnerIdempotentStep', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const steps: WorkflowStep[] = WorkflowCatalog.stepsOfBranch(WorkflowBranch.BRANCH_NORMAL);
        const runner: WorkflowRunner = new WorkflowRunner(steps, WorkflowBranch.BRANCH_NORMAL);
        runner.begin();
        runner.runStep('wf_normal_create', 5, 50);
        const second: StepStatus = runner.runStep('wf_normal_create', 5, 50);
        expect(second).assertEqual(StepStatus.STATUS_DONE);
        expect(runner.getCompletedKeys().length).assertEqual(1);
        expect(runner.countOf(StepStatus.STATUS_DONE)).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_1500
     * @tc.name testRunnerAbort
     * @tc.desc Verify explicit abort: an aborted workflow reports ABORTED and refuses further step execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRunnerAbort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const steps: WorkflowStep[] = WorkflowCatalog.stepsOfBranch(WorkflowBranch.BRANCH_NORMAL);
        const runner: WorkflowRunner = new WorkflowRunner(steps, WorkflowBranch.BRANCH_NORMAL);
        runner.begin();
        runner.abort();
        expect(runner.getState()).assertEqual(WorkflowState.STATE_ABORTED);
        expect(runner.runStep('wf_normal_create', 1, 50)).assertEqual(StepStatus.STATUS_PENDING);
        expect(runner.getCompletedKeys().length).assertEqual(0);
        expect(runner.begin()).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_1600
     * @tc.name testSnapshotAndRestore
     * @tc.desc Verify snapshot restore: a snapshot taken after one step restores the branch, state and completed keys
     * into a fresh runner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSnapshotAndRestore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const steps: WorkflowStep[] = WorkflowCatalog.stepsOfBranch(WorkflowBranch.BRANCH_NORMAL);
        const runner: WorkflowRunner = new WorkflowRunner(steps, WorkflowBranch.BRANCH_NORMAL);
        runner.begin();
        runner.runStep('wf_normal_create', 5, 50);
        const snapshot: WorkflowSnapshot = runner.snapshot(5);
        const restored: WorkflowRunner = new WorkflowRunner(steps, WorkflowBranch.BRANCH_RECOVERY);
        restored.restore(snapshot);
        expect(restored.getBranch()).assertEqual(WorkflowBranch.BRANCH_NORMAL);
        expect(restored.getState()).assertEqual(WorkflowState.STATE_RUNNING);
        expect(restored.statusOf('wf_normal_create')).assertEqual(StepStatus.STATUS_DONE);
        expect(restored.statusOf('wf_normal_window')).assertEqual(StepStatus.STATUS_PENDING);
        expect(snapshot.elapsedMs).assertEqual(5);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_1700
     * @tc.name testSnapshotRestoresFailures
     * @tc.desc Verify failure restoration: a snapshot containing one failed key restores that step to FAILED and
     * leaves the remaining steps pending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSnapshotRestoresFailures', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const steps: WorkflowStep[] = WorkflowCatalog.stepsOfBranch(WorkflowBranch.BRANCH_BACKGROUND_TIMEOUT);
        const runner: WorkflowRunner = new WorkflowRunner(steps, WorkflowBranch.BRANCH_BACKGROUND_TIMEOUT);
        runner.begin();
        runner.runStep('wf_timeout_detect', 1501, 1500);
        const snapshot: WorkflowSnapshot = runner.snapshot(1501);
        const restored: WorkflowRunner = new WorkflowRunner(steps, WorkflowBranch.BRANCH_NORMAL);
        restored.restore(snapshot);
        expect(restored.getBranch()).assertEqual(WorkflowBranch.BRANCH_BACKGROUND_TIMEOUT);
        expect(restored.statusOf('wf_timeout_detect')).assertEqual(StepStatus.STATUS_FAILED);
        expect(restored.countOf(StepStatus.STATUS_PENDING)).assertEqual(2);
        expect(snapshot.failedKeys.length).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_1800
     * @tc.name testSnapshotStoreLifecycle
     * @tc.desc Verify the snapshot store: two saved snapshots report size 2, the latest is the second one and dropping
     * a key shrinks the store to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSnapshotStoreLifecycle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: WorkflowSnapshotStore = new WorkflowSnapshotStore();
        const steps: WorkflowStep[] = WorkflowCatalog.stepsOfBranch(WorkflowBranch.BRANCH_NORMAL);
        const first: WorkflowRunner = new WorkflowRunner(steps, WorkflowBranch.BRANCH_NORMAL);
        first.begin();
        first.runStep('wf_normal_create', 4, 50);
        store.save('slot-one', first.snapshot(4));
        first.runStep('wf_normal_window', 400, 120);
        store.save('slot-two', first.snapshot(404));
        expect(store.size()).assertEqual(2);
        expect(store.keys().length).assertEqual(2);
        const latest: WorkflowSnapshot | null = store.latest();
        expect(latest === null).assertFalse();
        if (latest !== null) {
          expect(latest.elapsedMs).assertEqual(404);
          expect(latest.completedKeys.length).assertEqual(1);
        }
        expect(store.drop('slot-one')).assertTrue();
        expect(store.size()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_1900
     * @tc.name testSnapshotStoreMissAndClear
     * @tc.desc Verify the snapshot store boundaries: an unknown key loads null, dropping it returns false and clearing
     * empties the store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSnapshotStoreMissAndClear', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const store: WorkflowSnapshotStore = new WorkflowSnapshotStore();
        expect(store.load('slot-none') === null).assertTrue();
        expect(store.has('slot-none')).assertFalse();
        expect(store.latest() === null).assertTrue();
        expect(store.drop('slot-none')).assertFalse();
        store.clear();
        expect(store.size()).assertEqual(0);
        expect(store.keys().length).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_2000
     * @tc.name testBudgetGateConsumption
     * @tc.desc Verify the budget gate: 500 ms consumed from a 800 ms budget leaves 300 ms and reports 63 percent
     * utilization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBudgetGateConsumption', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const gate: WorkflowBudgetGate = new WorkflowBudgetGate(800);
        expect(gate.consume(200)).assertTrue();
        expect(gate.consume(300)).assertTrue();
        expect(gate.getConsumed()).assertEqual(500);
        expect(gate.remaining()).assertEqual(300);
        expect(gate.utilizationPercent()).assertEqual(63);
        expect(gate.isExhausted()).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_2100
     * @tc.name testBudgetGateRejection
     * @tc.desc Verify budget overflow: a 900 ms request against an 800 ms budget is rejected without consuming, and a
     * negative request is rejected too
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBudgetGateRejection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const gate: WorkflowBudgetGate = new WorkflowBudgetGate(800);
        expect(gate.consume(900)).assertFalse();
        expect(gate.getConsumed()).assertEqual(0);
        expect(gate.consume(-1)).assertFalse();
        expect(gate.consume(800)).assertTrue();
        expect(gate.isExhausted()).assertTrue();
        expect(gate.remaining()).assertEqual(0);
        expect(gate.utilizationPercent()).assertEqual(100);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_2200
     * @tc.name testBudgetGateReset
     * @tc.desc Verify budget reset: resetting to a 1000 ms budget restores the full remainder and zero utilization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBudgetGateReset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const gate: WorkflowBudgetGate = new WorkflowBudgetGate(500);
        gate.consume(500);
        expect(gate.isExhausted()).assertTrue();
        gate.resetTo(1000);
        expect(gate.getBudget()).assertEqual(1000);
        expect(gate.getConsumed()).assertEqual(0);
        expect(gate.remaining()).assertEqual(1000);
        expect(gate.utilizationPercent()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_2300
     * @tc.name testReentrancyGuardExclusion
     * @tc.desc Verify reentrancy protection: a second acquire is rejected while the first is active and release
     * frees the guard for reuse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReentrancyGuardExclusion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const guard: WorkflowReentrancyGuard = new WorkflowReentrancyGuard();
        expect(guard.acquire('workflow-a')).assertTrue();
        expect(guard.isBusy()).assertTrue();
        expect(guard.acquire('workflow-b')).assertFalse();
        expect(guard.getActiveKey()).assertEqual('workflow-a');
        expect(guard.getRejections()).assertEqual(1);
        expect(guard.release('workflow-a')).assertTrue();
        expect(guard.acquire('workflow-b')).assertTrue();
        expect(guard.getAcquisitions()).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_2400
     * @tc.name testReentrancyGuardWrongRelease
     * @tc.desc Verify release ownership: releasing with a mismatched key returns false and keeps the guard busy, and
     * reset clears all counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReentrancyGuardWrongRelease', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const guard: WorkflowReentrancyGuard = new WorkflowReentrancyGuard();
        guard.acquire('workflow-a');
        expect(guard.release('workflow-z')).assertFalse();
        expect(guard.isBusy()).assertTrue();
        guard.reset();
        expect(guard.isBusy()).assertFalse();
        expect(guard.getAcquisitions()).assertEqual(0);
        expect(guard.getRejections()).assertEqual(0);
        expect(guard.getActiveKey()).assertEqual('');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_2500
     * @tc.name testAuditTrailCounts
     * @tc.desc Verify audit counting: three begin records and two complete records are tallied while the first and
     * last actions are reported correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAuditTrailCounts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const trail: WorkflowAuditTrail = new WorkflowAuditTrail();
        trail.record('begin');
        trail.record('complete');
        trail.record('begin');
        trail.record('complete');
        trail.record('begin');
        expect(trail.size()).assertEqual(5);
        expect(trail.countOf('begin')).assertEqual(3);
        expect(trail.countOf('complete')).assertEqual(2);
        expect(trail.countOf('abort')).assertEqual(0);
        expect(trail.firstAction()).assertEqual('begin');
        expect(trail.lastAction()).assertEqual('begin');
        expect(trail.hasSequence('begin', 'complete')).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_2600
     * @tc.name testAuditTrailCleared
     * @tc.desc Verify audit reset: after clearing, size is 0, counters return 0 and actions report empty strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAuditTrailCleared', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const trail: WorkflowAuditTrail = new WorkflowAuditTrail();
        trail.record('abort');
        trail.clear();
        expect(trail.size()).assertEqual(0);
        expect(trail.countOf('abort')).assertEqual(0);
        expect(trail.firstAction()).assertEqual('');
        expect(trail.lastAction()).assertEqual('');
        expect(trail.getEntries().length).assertEqual(0);
        expect(trail.hasSequence('abort', 'abort')).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_2700
     * @tc.name testRecoveryPlannerBudgets
     * @tc.desc Verify branch budgets: normal 200 ms required, timeout 1780 ms and recovery 460 ms in total with 400 ms
     * required
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecoveryPlannerBudgets', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const planner: WorkflowRecoveryPlanner =
          new WorkflowRecoveryPlanner(new BranchSelector(100, 1500, false));
        expect(planner.totalBudget(WorkflowBranch.BRANCH_NORMAL)).assertEqual(200);
        expect(planner.totalBudget(WorkflowBranch.BRANCH_BACKGROUND_TIMEOUT)).assertEqual(1780);
        expect(planner.totalBudget(WorkflowBranch.BRANCH_RECOVERY)).assertEqual(460);
        expect(planner.requiredBudget(WorkflowBranch.BRANCH_RECOVERY)).assertEqual(400);
        expect(planner.requiredBudget(WorkflowBranch.BRANCH_NORMAL)).assertEqual(200);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_2800
     * @tc.name testRecoveryPlannerSelection
     * @tc.desc Verify planner selection: a 1600 ms background stay recommends the timeout branch and the description
     * reports 3 steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecoveryPlannerSelection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const selector: BranchSelector = new BranchSelector(1600, 1500, false);
        const planner: WorkflowRecoveryPlanner = new WorkflowRecoveryPlanner(selector);
        expect(planner.recommendedBranch()).assertEqual(WorkflowBranch.BRANCH_BACKGROUND_TIMEOUT);
        expect(planner.plan(WorkflowBranch.BRANCH_BACKGROUND_TIMEOUT).length).assertEqual(3);
        expect(planner.describePlan()).assertEqual('plan:1,steps:3,budget:1780');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_2900
     * @tc.name testStepIndexOptionalAndRequired
     * @tc.desc Verify optional filtering: 1 of the 8 steps is optional, 7 are required, and label lookup resolves the
     * reload step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStepIndexOptionalAndRequired', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const index: WorkflowStepIndex = new WorkflowStepIndex(WorkflowCatalog.allSteps());
        const optional: WorkflowStep[] = index.optionalSteps();
        expect(optional.length).assertEqual(1);
        expect(optional[0].key).assertEqual('wf_recovery_restore_focus');
        expect(index.requiredSteps().length).assertEqual(7);
        const reload: WorkflowStep | null = index.byLabel('ReloadIndexPage');
        expect(reload === null).assertFalse();
        if (reload !== null) {
          expect(reload.requiredBudgetMs).assertEqual(400);
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_3000
     * @tc.name testRealNormalRuntimeBranch
     * @tc.desc Verify the runtime normal branch: with a foreground and background cycle well under the timeout
     * threshold the selector keeps the normal branch and the page stays visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealNormalRuntimeBranch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await serializedDelay(driver, DELAY_AFTER_LAUNCH);
        const startTime: number = Date.now();
        await doAbilityBackground();
        await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
        await doAbilityForeground();
        const backgroundElapsed: number = measureElapsed(startTime);
        const selector: BranchSelector = new BranchSelector(backgroundElapsed, TIMEOUT_BACKGROUND_SWITCH, false);
        expect(selector.select()).assertEqual(WorkflowBranch.BRANCH_NORMAL);
        expect(await isIndexPageVisible(driver)).assertTrue();
        expect(isWithinBudget(backgroundElapsed, TIMEOUT_ABILITY_LAUNCH * 3)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_3100
     * @tc.name testRealTimeoutBranchSelection
     * @tc.desc Verify timeout branch by simulation: a synthetic background duration of ten times the threshold
     * selects the timeout branch and yields 3 executable steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealTimeoutBranchSelection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const syntheticElapsed: number = TIMEOUT_BACKGROUND_SWITCH * 10;
        const selector: BranchSelector = new BranchSelector(syntheticElapsed, TIMEOUT_BACKGROUND_SWITCH, false);
        const planner: WorkflowRecoveryPlanner = new WorkflowRecoveryPlanner(selector);
        const steps: WorkflowStep[] = planner.plan(selector.select());
        expect(selector.select()).assertEqual(WorkflowBranch.BRANCH_BACKGROUND_TIMEOUT);
        expect(steps.length).assertEqual(3);
        expect(steps[2].key).assertEqual('wf_timeout_destroy');
        expect(await waitForIndexPageStable(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_3200
     * @tc.name testRealRecoveryPathRestoresPage
     * @tc.desc Verify the recovery path: a forced recovery branch reloads the index page and the HelloWorld component
     * exists again after a background and foreground cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealRecoveryPathRestoresPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const selector: BranchSelector = new BranchSelector(120, TIMEOUT_BACKGROUND_SWITCH, true);
        const planner: WorkflowRecoveryPlanner = new WorkflowRecoveryPlanner(selector);
        expect(planner.recommendedBranch()).assertEqual(WorkflowBranch.BRANCH_RECOVERY);
        await doAbilityBackground();
        await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
        await doAbilityForeground();
        await serializedDelay(driver, DELAY_AFTER_LAUNCH);
        expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
        expect(await waitForIndexPageStable(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_3300
     * @tc.name testRealRecoveryRunnerCompletion
     * @tc.desc Verify the recovery runner: both recovery steps complete at 5 ms each and the workflow finishes as
     * COMPLETED with 2 completed keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealRecoveryRunnerCompletion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const steps: WorkflowStep[] = WorkflowCatalog.stepsOfBranch(WorkflowBranch.BRANCH_RECOVERY);
        const runner: WorkflowRunner = new WorkflowRunner(steps, WorkflowBranch.BRANCH_RECOVERY);
        runner.begin();
        runner.runAll(5);
        expect(runner.getState()).assertEqual(WorkflowState.STATE_COMPLETED);
        expect(runner.getCompletedKeys().length).assertEqual(2);
        const componentCount: number = await pageComponentCount(driver);
        expect(componentCount >= 1).assertTrue();
        expect(ENTRY_ABILITY_NAME).assertEqual('EntryAbility');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_3400
     * @tc.name testRealPageTextsAfterWorkflow
     * @tc.desc Verify page texts after workflow execution: the collected text list contains the initial or clicked
     * page text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealPageTextsAfterWorkflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await waitForIndexPageStable(driver);
        const texts: string[] = await collectAllTexts(driver);
        const hasInitial: boolean = texts.includes(PAGE_TEXT_INITIAL);
        const hasClicked: boolean = texts.includes(PAGE_TEXT_CLICKED);
        expect(texts.length >= 1).assertTrue();
        expect(hasInitial || hasClicked).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_WORKFLOW_3500
     * @tc.name testRealDelegatorBundleName
     * @tc.desc Verify the delegator environment used by the workflows: a delegator exists and reports a bundle name
     * containing abilitystage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealDelegatorBundleName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const bundleName: string = getBundleName();
        expect(bundleName.includes('abilitystage')).assertTrue();
        expect(bundleName.length > 0).assertTrue();
      } finally {
        done();
      }
    })
  })
}
