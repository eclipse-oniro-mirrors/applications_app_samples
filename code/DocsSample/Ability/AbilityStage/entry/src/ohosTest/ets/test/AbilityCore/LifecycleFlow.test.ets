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
import { Driver, Component } from '@ohos.UiTest';
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
  findComponentsByType,
  serializedDelay,
  measureElapsed,
  isWithinBudget,
  averageOf,
  maxOf,
  minOf,
  logInfo,
  ENTRY_ABILITY_NAME,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  TIMEOUT_ABILITY_LAUNCH,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum FlowPhase {
  PHASE_STAGE_CREATED = 0,
  PHASE_ABILITY_CREATED = 1,
  PHASE_WINDOW_CREATED = 2,
  PHASE_FOREGROUND = 3,
  PHASE_BACKGROUND = 4,
  PHASE_DESTROYED = 5
}

enum FlowStepId {
  STEP_STAGE_CREATE = 0,
  STEP_ABILITY_CREATE = 1,
  STEP_WINDOW_CREATE = 2,
  STEP_FOREGROUND_FIRST = 3,
  STEP_BACKGROUND = 4,
  STEP_FOREGROUND_SECOND = 5,
  STEP_DESTROY = 6
}

enum StepState {
  STATE_PENDING = 0,
  STATE_RUNNING = 1,
  STATE_DONE = 2,
  STATE_FAILED = 3
}

interface FlowStep {
  index: number;
  id: string;
  displayName: string;
  phase: FlowPhase;
  budgetMs: number;
}

interface StepRecord {
  index: number;
  id: string;
  phase: FlowPhase;
  elapsedMs: number;
  outcome: StepState;
}

class LifecycleFlowPlan {
  public static readonly STAGE_CREATE: FlowStep = {
    index: 0,
    id: 'flow_stage_create',
    displayName: 'StageOnCreate',
    phase: FlowPhase.PHASE_STAGE_CREATED,
    budgetMs: 50
  };
  public static readonly ABILITY_CREATE: FlowStep = {
    index: 1,
    id: 'flow_ability_create',
    displayName: 'AbilityOnCreate',
    phase: FlowPhase.PHASE_ABILITY_CREATED,
    budgetMs: 60
  };
  public static readonly WINDOW_CREATE: FlowStep = {
    index: 2,
    id: 'flow_window_create',
    displayName: 'AbilityOnWindowStageCreate',
    phase: FlowPhase.PHASE_WINDOW_CREATED,
    budgetMs: 120
  };
  public static readonly FOREGROUND_FIRST: FlowStep = {
    index: 3,
    id: 'flow_foreground_first',
    displayName: 'AbilityOnForegroundFirst',
    phase: FlowPhase.PHASE_FOREGROUND,
    budgetMs: 30
  };
  public static readonly BACKGROUND: FlowStep = {
    index: 4,
    id: 'flow_background',
    displayName: 'AbilityOnBackground',
    phase: FlowPhase.PHASE_BACKGROUND,
    budgetMs: 30
  };
  public static readonly FOREGROUND_SECOND: FlowStep = {
    index: 5,
    id: 'flow_foreground_second',
    displayName: 'AbilityOnForegroundSecond',
    phase: FlowPhase.PHASE_FOREGROUND,
    budgetMs: 30
  };
  public static readonly DESTROY: FlowStep = {
    index: 6,
    id: 'flow_destroy',
    displayName: 'AbilityOnDestroy',
    phase: FlowPhase.PHASE_DESTROYED,
    budgetMs: 40
  };

  public static defaultSteps(): FlowStep[] {
    return [
      LifecycleFlowPlan.STAGE_CREATE,
      LifecycleFlowPlan.ABILITY_CREATE,
      LifecycleFlowPlan.WINDOW_CREATE,
      LifecycleFlowPlan.FOREGROUND_FIRST,
      LifecycleFlowPlan.BACKGROUND,
      LifecycleFlowPlan.FOREGROUND_SECOND,
      LifecycleFlowPlan.DESTROY
    ];
  }
}

class FlowPlanInspector {
  private steps: FlowStep[] = [];

  constructor(steps: FlowStep[]) {
    this.steps = steps;
  }

  public static createDefault(): FlowPlanInspector {
    return new FlowPlanInspector(LifecycleFlowPlan.defaultSteps());
  }

  public getSteps(): FlowStep[] {
    return this.steps;
  }

  public size(): number {
    return this.steps.length;
  }

  public ids(): string[] {
    return this.steps.map((step: FlowStep) => step.id);
  }

  public names(): string[] {
    return this.steps.map((step: FlowStep) => step.displayName);
  }

  public phases(): FlowPhase[] {
    return this.steps.map((step: FlowStep) => step.phase);
  }

  public getStep(index: number): FlowStep | null {
    if (index < 0 || index >= this.steps.length) {
      return null;
    }
    return this.steps[index];
  }

  public findById(id: string): FlowStep | null {
    const matched: FlowStep | undefined = this.steps.find((step: FlowStep) => step.id === id);
    return matched === undefined ? null : matched;
  }

  public totalBudget(): number {
    let total: number = 0;
    this.steps.forEach((step: FlowStep) => {
      total += step.budgetMs;
    });
    return total;
  }

  public countByPhase(phase: FlowPhase): number {
    return this.steps.filter((step: FlowStep) => step.phase === phase).length;
  }

  public indexOfPhase(phase: FlowPhase): number {
    return this.steps.findIndex((step: FlowStep) => step.phase === phase);
  }
}

class FlowOrderValidator {
  private steps: FlowStep[] = [];

  constructor(steps: FlowStep[]) {
    this.steps = steps;
  }

  public indexesAreConsecutive(): boolean {
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].index !== i) {
        return false;
      }
    }
    return true;
  }

  public phaseOrderMatches(): boolean {
    const expected: FlowPhase[] = [
      FlowPhase.PHASE_STAGE_CREATED,
      FlowPhase.PHASE_ABILITY_CREATED,
      FlowPhase.PHASE_WINDOW_CREATED,
      FlowPhase.PHASE_FOREGROUND,
      FlowPhase.PHASE_BACKGROUND,
      FlowPhase.PHASE_FOREGROUND,
      FlowPhase.PHASE_DESTROYED
    ];
    if (this.steps.length !== expected.length) {
      return false;
    }
    for (let i = 0; i < expected.length; i++) {
      if (this.steps[i].phase !== expected[i]) {
        return false;
      }
    }
    return true;
  }

  public defaultSequenceIsComplete(): boolean {
    return this.steps.length === 7 && this.indexesAreConsecutive();
  }

  public foregroundOccursTwice(): boolean {
    return this.steps.filter((step: FlowStep) => step.phase === FlowPhase.PHASE_FOREGROUND).length === 2;
  }

  public backgroundBetweenForegrounds(): boolean {
    let firstForeground: number = -1;
    let background: number = -1;
    let secondForeground: number = -1;
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].phase === FlowPhase.PHASE_FOREGROUND) {
        if (firstForeground < 0) {
          firstForeground = i;
        } else if (secondForeground < 0) {
          secondForeground = i;
        }
      }
      if (this.steps[i].phase === FlowPhase.PHASE_BACKGROUND) {
        background = i;
      }
    }
    return firstForeground >= 0 && background > firstForeground && secondForeground > background;
  }

  public destroyIsLast(): boolean {
    return this.steps.length > 0 && this.steps[this.steps.length - 1].phase === FlowPhase.PHASE_DESTROYED;
  }
}

class FlowExecutor {
  private steps: FlowStep[] = [];
  private cursor: number = 0;
  private states: Map<number, StepState> = new Map<number, StepState>();
  private records: StepRecord[] = [];

  constructor(steps: FlowStep[]) {
    this.steps = steps;
    steps.forEach((step: FlowStep) => {
      this.states.set(step.index, StepState.STATE_PENDING);
    });
  }

  public getCursor(): number {
    return this.cursor;
  }

  public stateOf(index: number): StepState {
    const state: StepState | undefined = this.states.get(index);
    return state === undefined ? StepState.STATE_PENDING : state;
  }

  public isComplete(): boolean {
    return this.cursor >= this.steps.length;
  }

  public peek(): FlowStep | null {
    if (this.cursor >= this.steps.length) {
      return null;
    }
    return this.steps[this.cursor];
  }

  public executeNext(elapsedMs: number): StepRecord | null {
    const step: FlowStep | null = this.peek();
    if (step === null) {
      return null;
    }
    this.states.set(step.index, StepState.STATE_RUNNING);
    const record: StepRecord = {
      index: step.index,
      id: step.id,
      phase: step.phase,
      elapsedMs: elapsedMs,
      outcome: StepState.STATE_DONE
    };
    this.records.push(record);
    this.states.set(step.index, StepState.STATE_DONE);
    this.cursor++;
    return record;
  }

  public executeAll(elapsedPerStep: number): StepRecord[] {
    const collected: StepRecord[] = [];
    while (!this.isComplete()) {
      const record: StepRecord | null = this.executeNext(elapsedPerStep);
      if (record === null) {
        break;
      }
      collected.push(record);
    }
    return collected;
  }

  public failCurrent(): void {
    if (this.cursor < this.steps.length) {
      this.states.set(this.cursor, StepState.STATE_FAILED);
    }
  }

  public getRecords(): StepRecord[] {
    return this.records;
  }

  public getExecutedIds(): string[] {
    return this.records.map((record: StepRecord) => record.id);
  }

  public getDoneCount(): number {
    return this.records.length;
  }

  public reset(): void {
    this.cursor = 0;
    this.records = [];
    this.steps.forEach((step: FlowStep) => {
      this.states.set(step.index, StepState.STATE_PENDING);
    });
  }
}

class FlowJumpGuard {
  private steps: FlowStep[] = [];

  constructor(steps: FlowStep[]) {
    this.steps = steps;
  }

  public isForwardJumpAllowed(fromIndex: number, toIndex: number): boolean {
    return fromIndex >= 0 && toIndex === fromIndex + 1 && toIndex >= 0 && toIndex < this.steps.length;
  }

  public isSkipAllowed(fromIndex: number, toIndex: number): boolean {
    return toIndex > fromIndex + 1 && toIndex < this.steps.length;
  }

  public isBackwardAllowed(fromIndex: number, toIndex: number): boolean {
    return toIndex >= 0 && toIndex < fromIndex;
  }

  public decide(fromIndex: number, toIndex: number): string {
    if (toIndex < 0 || toIndex >= this.steps.length) {
      return 'out-of-range';
    }
    if (toIndex === fromIndex + 1) {
      return 'advance';
    }
    if (toIndex === fromIndex) {
      return 'repeat';
    }
    if (toIndex > fromIndex + 1) {
      return 'skip-rejected';
    }
    return 'rollback';
  }

  public countReachableFrom(fromIndex: number): number {
    let reachable: number = 0;
    for (let i = 0; i < this.steps.length; i++) {
      if (this.isForwardJumpAllowed(fromIndex, i)) {
        reachable++;
      }
    }
    return reachable;
  }
}

class FlowRollbackTracker {
  private steps: FlowStep[] = [];
  private history: StepRecord[] = [];
  private rolledBack: string[] = [];

  constructor(steps: FlowStep[]) {
    this.steps = steps;
  }

  public push(record: StepRecord): void {
    this.history.push(record);
  }

  public getDepth(): number {
    return this.history.length;
  }

  public rollbackLast(): StepRecord | null {
    if (this.history.length === 0) {
      return null;
    }
    const lastIndex: number = this.history.length - 1;
    const record: StepRecord = this.history[lastIndex];
    this.history.splice(lastIndex, 1);    this.rolledBack.push(record.id);
    return record;
  }

  public rollbackTo(depth: number): number {
    let count: number = 0;
    while (this.history.length > depth) {
      const record: StepRecord | null = this.rollbackLast();
      if (record === null) {
        break;
      }
      count++;
    }
    return count;
  }

  public getRolledBackIds(): string[] {
    return this.rolledBack;
  }

  public getCurrentPhase(): FlowPhase | null {
    if (this.history.length === 0) {
      return null;
    }
    return this.history[this.history.length - 1].phase;
  }

  public rollbackToPhase(phase: FlowPhase): boolean {
    while (this.history.length > 0) {
      const current: FlowPhase | null = this.getCurrentPhase();
      if (current === phase) {
        return true;
      }
      this.rollbackLast();
    }
    return false;
  }
}

class FlowDurationLedger {
  private durations: number[] = [];

  public record(duration: number): void {
    this.durations.push(duration);
  }

  public getCount(): number {
    return this.durations.length;
  }

  public cumulative(): number {
    let total: number = 0;
    this.durations.forEach((duration: number) => {
      total += duration;
    });
    return total;
  }

  public average(): number {
    if (this.durations.length === 0) {
      return 0;
    }
    return this.cumulative() / this.durations.length;
  }

  public peak(): number {
    let max: number = 0;
    this.durations.forEach((duration: number) => {
      if (duration > max) {
        max = duration;
      }
    });
    return max;
  }

  public trough(): number {
    if (this.durations.length === 0) {
      return 0;
    }
    let min: number = this.durations[0];
    this.durations.forEach((duration: number) => {
      if (duration < min) {
        min = duration;
      }
    });
    return min;
  }

  public withinAggregateBudget(budget: number): boolean {
    return this.cumulative() <= budget;
  }

  public getDurations(): number[] {
    return this.durations;
  }

  public clear(): void {
    this.durations = [];
  }
}

class FlowTranscript {
  private entries: string[] = [];

  public append(message: string): void {
    this.entries.push(message);
  }

  public getEntries(): string[] {
    return this.entries;
  }

  public getSize(): number {
    return this.entries.length;
  }

  public contains(fragment: string): boolean {
    return this.entries.some((entry: string) => entry.includes(fragment));
  }

  public firstEntry(): string {
    return this.entries.length === 0 ? '' : this.entries[0];
  }

  public lastEntry(): string {
    return this.entries.length === 0 ? '' : this.entries[this.entries.length - 1];
  }

  public clear(): void {
    this.entries = [];
  }
}

class FlowRetryPolicy {
  private maxAttempts: number = 0;

  constructor(maxAttempts: number) {
    this.maxAttempts = maxAttempts;
  }

  public getMaxAttempts(): number {
    return this.maxAttempts;
  }

  public shouldRetry(attempt: number): boolean {
    return attempt < this.maxAttempts;
  }

  public attemptForFailureCount(failures: number): number {
    return failures + 1 > this.maxAttempts ? this.maxAttempts : failures + 1;
  }

  public isExhausted(failures: number): boolean {
    return failures >= this.maxAttempts;
  }

  public nextDelayMs(baseDelay: number, attempt: number): number {
    if (attempt <= 0) {
      return baseDelay;
    }
    return baseDelay * attempt;
  }
}

class FlowStepStateMachine {
  private states: Map<number, StepState> = new Map<number, StepState>();
  private stepCount: number = 0;

  constructor(stepCount: number) {
    this.stepCount = stepCount;
    for (let i = 0; i < stepCount; i++) {
      this.states.set(i, StepState.STATE_PENDING);
    }
  }

  public getState(index: number): StepState {
    const state: StepState | undefined = this.states.get(index);
    return state === undefined ? StepState.STATE_PENDING : state;
  }

  public canStart(index: number): boolean {
    return this.inRange(index) && this.getState(index) === StepState.STATE_PENDING;
  }

  public inRange(index: number): boolean {
    return index >= 0 && index < this.stepCount;
  }

  public start(index: number): boolean {
    if (!this.canStart(index)) {
      return false;
    }
    this.states.set(index, StepState.STATE_RUNNING);
    return true;
  }

  public finish(index: number): boolean {
    if (this.getState(index) !== StepState.STATE_RUNNING) {
      return false;
    }
    this.states.set(index, StepState.STATE_DONE);
    return true;
  }

  public fail(index: number): boolean {
    if (this.getState(index) !== StepState.STATE_RUNNING) {
      return false;
    }
    this.states.set(index, StepState.STATE_FAILED);
    return true;
  }

  public reset(index: number): void {
    if (this.states.has(index)) {
      this.states.set(index, StepState.STATE_PENDING);
    }
  }

  public countOf(state: StepState): number {
    let count: number = 0;
    this.states.forEach((value: StepState) => {
      if (value === state) {
        count++;
      }
    });
    return count;
  }

  public getStepCount(): number {
    return this.stepCount;
  }
}

class FlowPhaseTimeline {
  private steps: FlowStep[] = [];

  constructor(steps: FlowStep[]) {
    this.steps = steps;
  }

  public phaseAt(index: number): FlowPhase | null {
    if (index < 0 || index >= this.steps.length) {
      return null;
    }
    return this.steps[index].phase;
  }

  public transitions(): string[] {
    const result: string[] = [];
    for (let i = 1; i < this.steps.length; i++) {
      result.push(`${this.steps[i - 1].phase}->${this.steps[i].phase}`);
    }
    return result;
  }

  public countTransitionsTo(phase: FlowPhase): number {
    let count: number = 0;
    for (let i = 1; i < this.steps.length; i++) {
      if (this.steps[i].phase === phase) {
        count++;
      }
    }
    return count;
  }

  public hasSelfTransition(): boolean {
    for (let i = 1; i < this.steps.length; i++) {
      if (this.steps[i].phase === this.steps[i - 1].phase) {
        return true;
      }
    }
    return false;
  }

  public maxPhaseGap(): number {
    let maxGap: number = 0;
    for (let i = 1; i < this.steps.length; i++) {
      const gap: number = this.steps[i].index - this.steps[i - 1].index;
      if (gap > maxGap) {
        maxGap = gap;
      }
    }
    return maxGap;
  }
}

class FlowStepBudgetTracker {
  private steps: FlowStep[] = [];

  constructor(steps: FlowStep[]) {
    this.steps = steps;
  }

  public budgetOf(index: number): number {
    if (index < 0 || index >= this.steps.length) {
      return 0;
    }
    return this.steps[index].budgetMs;
  }

  public cumulativeBudgetUpTo(index: number): number {
    let total: number = 0;
    for (let i = 0; i <= index && i < this.steps.length; i++) {
      total += this.steps[i].budgetMs;
    }
    return total;
  }

  public heaviestIndex(): number {
    let heaviest: number = 0;
    for (let i = 1; i < this.steps.length; i++) {
      if (this.steps[i].budgetMs > this.steps[heaviest].budgetMs) {
        heaviest = i;
      }
    }
    return heaviest;
  }

  public averageBudget(): number {
    if (this.steps.length === 0) {
      return 0;
    }
    let total: number = 0;
    this.steps.forEach((step: FlowStep) => {
      total += step.budgetMs;
    });
    return total / this.steps.length;
  }

  public isMonotonic(): boolean {
    for (let i = 1; i < this.steps.length; i++) {
      if (this.steps[i].budgetMs > this.steps[i - 1].budgetMs) {
        return false;
      }
    }
    return true;
  }
}

export default function lifecycleFlowTest(): void {
  describe('LifecycleFlowTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
      logInfo('LifecycleFlowTest: beforeAll completed');

      await ensureIndexPageInitial(driver);
    });

    afterAll(async () => {
      await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
      logInfo('LifecycleFlowTest: afterAll completed');
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_0100
     * @tc.name testPlanHasSevenSteps
     * @tc.desc Verify flow plan size: the default start to destroy flow contains exactly 7 steps with consecutive
     * indexes 0 through 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPlanHasSevenSteps', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const inspector: FlowPlanInspector = FlowPlanInspector.createDefault();
        const validator: FlowOrderValidator = new FlowOrderValidator(inspector.getSteps());
        expect(inspector.size()).assertEqual(7);
        expect(validator.indexesAreConsecutive()).assertTrue();
        expect(validator.defaultSequenceIsComplete()).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_0200
     * @tc.name testPlanPhaseOrder
     * @tc.desc Verify flow phase order: stage create, ability create, window create, foreground, background,
     * foreground again, destroy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPlanPhaseOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const inspector: FlowPlanInspector = FlowPlanInspector.createDefault();
        const validator: FlowOrderValidator = new FlowOrderValidator(inspector.getSteps());
        const phases: FlowPhase[] = inspector.phases();
        expect(validator.phaseOrderMatches()).assertTrue();
        expect(phases[0]).assertEqual(FlowPhase.PHASE_STAGE_CREATED);
        expect(phases[5]).assertEqual(FlowPhase.PHASE_FOREGROUND);
        expect(phases[6]).assertEqual(FlowPhase.PHASE_DESTROYED);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_0300
     * @tc.name testPlanForegroundRevisited
     * @tc.desc Verify round trip structure: foreground appears twice and background sits between the two foreground
     * steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPlanForegroundRevisited', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const inspector: FlowPlanInspector = FlowPlanInspector.createDefault();
        const validator: FlowOrderValidator = new FlowOrderValidator(inspector.getSteps());
        expect(validator.foregroundOccursTwice()).assertTrue();
        expect(validator.backgroundBetweenForegrounds()).assertTrue();
        expect(inspector.countByPhase(FlowPhase.PHASE_FOREGROUND)).assertEqual(2);
        expect(inspector.countByPhase(FlowPhase.PHASE_BACKGROUND)).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_0400
     * @tc.name testPlanDestroyIsLast
     * @tc.desc Verify flow termination: the destroy step is the last entry and no step follows index 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPlanDestroyIsLast', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const inspector: FlowPlanInspector = FlowPlanInspector.createDefault();
        const validator: FlowOrderValidator = new FlowOrderValidator(inspector.getSteps());
        expect(validator.destroyIsLast()).assertTrue();
        const lastStep: FlowStep | null = inspector.getStep(6);
        expect(lastStep === null).assertFalse();
        if (lastStep !== null) {
          expect(lastStep.id).assertEqual('flow_destroy');
        }
        expect(inspector.getStep(7) === null).assertTrue();
        expect(inspector.getStep(-1) === null).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_0500
     * @tc.name testPlanBudgetSum
     * @tc.desc Verify flow budget: the seven step budgets total 360 ms and the window create step costs 120 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPlanBudgetSum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const inspector: FlowPlanInspector = FlowPlanInspector.createDefault();
        const budgetTracker: FlowStepBudgetTracker = new FlowStepBudgetTracker(inspector.getSteps());
        expect(inspector.totalBudget()).assertEqual(360);
        expect(budgetTracker.budgetOf(2)).assertEqual(120);
        expect(budgetTracker.cumulativeBudgetUpTo(6)).assertEqual(360);
        expect(budgetTracker.budgetOf(99)).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_0600
     * @tc.name testBudgetHeaviestAndAverage
     * @tc.desc Verify budget statistics: the heaviest step is index 2 and the average step budget lies between
     * 51 and 52 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBudgetHeaviestAndAverage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const inspector: FlowPlanInspector = FlowPlanInspector.createDefault();
        const budgetTracker: FlowStepBudgetTracker = new FlowStepBudgetTracker(inspector.getSteps());
        const average: number = budgetTracker.averageBudget();
        expect(budgetTracker.heaviestIndex()).assertEqual(2);
        expect(average > 51 && average < 52).assertTrue();
        expect(budgetTracker.isMonotonic()).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_0700
     * @tc.name testExecutorRunsAllSteps
     * @tc.desc Verify sequential execution: executing all seven steps marks the executor complete with 7 done records
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExecutorRunsAllSteps', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const steps: FlowStep[] = LifecycleFlowPlan.defaultSteps();
        const executor: FlowExecutor = new FlowExecutor(steps);
        const records: StepRecord[] = executor.executeAll(10);
        expect(records.length).assertEqual(7);
        expect(executor.getDoneCount()).assertEqual(7);
        expect(executor.isComplete()).assertTrue();
        expect(executor.peek() === null).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_0800
     * @tc.name testExecutorPreservesOrder
     * @tc.desc Verify execution order: the executed id sequence follows the plan index order exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExecutorPreservesOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const steps: FlowStep[] = LifecycleFlowPlan.defaultSteps();
        const executor: FlowExecutor = new FlowExecutor(steps);
        executor.executeAll(5);
        const executed: string[] = executor.getExecutedIds();
        const expected: string[] = steps.map((step: FlowStep) => step.id);
        expect(executed.length).assertEqual(expected.length);
        for (let i = 0; i < expected.length; i++) {
          expect(executed[i]).assertEqual(expected[i]);
        }
        expect(executed[0]).assertEqual('flow_stage_create');
        expect(executed[6]).assertEqual('flow_destroy');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_0900
     * @tc.name testExecutorStateTransitions
     * @tc.desc Verify step states: after two executions the first two steps are DONE and the third stays PENDING
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExecutorStateTransitions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const steps: FlowStep[] = LifecycleFlowPlan.defaultSteps();
        const executor: FlowExecutor = new FlowExecutor(steps);
        executor.executeNext(12);
        executor.executeNext(14);
        expect(executor.getCursor()).assertEqual(2);
        expect(executor.stateOf(0)).assertEqual(StepState.STATE_DONE);
        expect(executor.stateOf(1)).assertEqual(StepState.STATE_DONE);
        expect(executor.stateOf(2)).assertEqual(StepState.STATE_PENDING);
        const current: FlowStep | null = executor.peek();
        expect(current === null).assertFalse();
        if (current !== null) {
          expect(current.id).assertEqual('flow_window_create');
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_1000
     * @tc.name testExecutorFailureAndReset
     * @tc.desc Verify failure and reset: failing the current step marks it FAILED and reset returns the cursor to 0
     * with all records cleared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExecutorFailureAndReset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const steps: FlowStep[] = LifecycleFlowPlan.defaultSteps();
        const executor: FlowExecutor = new FlowExecutor(steps);
        executor.executeNext(10);
        executor.failCurrent();
        expect(executor.stateOf(1)).assertEqual(StepState.STATE_FAILED);
        executor.reset();
        expect(executor.getCursor()).assertEqual(0);
        expect(executor.getDoneCount()).assertEqual(0);
        expect(executor.stateOf(1)).assertEqual(StepState.STATE_PENDING);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_1100
     * @tc.name testExecutorEmptyAfterCompletion
     * @tc.desc Verify completion boundary: a fully executed plan refuses further execution and reports no current step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExecutorEmptyAfterCompletion', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const steps: FlowStep[] = LifecycleFlowPlan.defaultSteps();
        const executor: FlowExecutor = new FlowExecutor(steps);
        executor.executeAll(1);
        const extra: StepRecord | null = executor.executeNext(1);
        expect(extra === null).assertTrue();
        expect(executor.getDoneCount()).assertEqual(7);
        expect(executor.isComplete()).assertTrue();
        expect(executor.getRecords().length).assertEqual(7);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_1200
     * @tc.name testJumpGuardRejectsSkip
     * @tc.desc Verify skip rejection: advancing from step 0 to step 2 is rejected while 0 to 1 is allowed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJumpGuardRejectsSkip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const guard: FlowJumpGuard = new FlowJumpGuard(LifecycleFlowPlan.defaultSteps());
        expect(guard.isForwardJumpAllowed(0, 1)).assertTrue();
        expect(guard.isForwardJumpAllowed(0, 2)).assertFalse();
        expect(guard.isSkipAllowed(0, 2)).assertTrue();
        expect(guard.decide(0, 2)).assertEqual('skip-rejected');
        expect(guard.decide(0, 1)).assertEqual('advance');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_1300
     * @tc.name testJumpGuardBoundaries
     * @tc.desc Verify jump boundaries: repeating the same step is detected, moving beyond the last index is
     * out-of-range, and moving backwards is classified as rollback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJumpGuardBoundaries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const guard: FlowJumpGuard = new FlowJumpGuard(LifecycleFlowPlan.defaultSteps());
        expect(guard.decide(3, 3)).assertEqual('repeat');
        expect(guard.decide(6, 7)).assertEqual('out-of-range');
        expect(guard.decide(4, 1)).assertEqual('rollback');
        expect(guard.isBackwardAllowed(4, 1)).assertTrue();
        expect(guard.isBackwardAllowed(1, 4)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_1400
     * @tc.name testJumpGuardReachableCount
     * @tc.desc Verify reachable set: any step only reaches its direct successor, so each source reaches 1 step and
     * the last step reaches none
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJumpGuardReachableCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const guard: FlowJumpGuard = new FlowJumpGuard(LifecycleFlowPlan.defaultSteps());
        expect(guard.countReachableFrom(0)).assertEqual(1);
        expect(guard.countReachableFrom(3)).assertEqual(1);
        expect(guard.countReachableFrom(6)).assertEqual(0);
        expect(guard.isForwardJumpAllowed(-1, 0)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_1500
     * @tc.name testRollbackSingleStep
     * @tc.desc Verify rollback: pushing three step records then rolling back once leaves depth 2 and reports the
     * rolled back id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRollbackSingleStep', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const steps: FlowStep[] = LifecycleFlowPlan.defaultSteps();
        const executor: FlowExecutor = new FlowExecutor(steps);
        const tracker: FlowRollbackTracker = new FlowRollbackTracker(steps);
        for (let i = 0; i < 3; i++) {
          const pushed: StepRecord | null = executor.executeNext(10 + i);
          if (pushed !== null) {
            tracker.push(pushed);
          }
        }
        expect(tracker.getDepth()).assertEqual(3);
        expect(tracker.getCurrentPhase()).assertEqual(FlowPhase.PHASE_WINDOW_CREATED);
        const rolled: StepRecord | null = tracker.rollbackLast();
        expect(rolled === null).assertFalse();
        expect(tracker.getDepth()).assertEqual(2);
        expect(tracker.getRolledBackIds().length).assertEqual(1);
        expect(tracker.getRolledBackIds()[0]).assertEqual('flow_window_create');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_1600
     * @tc.name testRollbackToDepth
     * @tc.desc Verify multi-step rollback: rolling back to depth 1 removes two records and returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRollbackToDepth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const steps: FlowStep[] = LifecycleFlowPlan.defaultSteps();
        const executor: FlowExecutor = new FlowExecutor(steps);
        const tracker: FlowRollbackTracker = new FlowRollbackTracker(steps);
        executor.executeNext(10);
        executor.executeNext(10);
        executor.executeNext(10);
        const records: StepRecord[] = executor.getRecords();
        records.forEach((record: StepRecord) => tracker.push(record));
        const removed: number = tracker.rollbackTo(1);
        expect(removed).assertEqual(2);
        expect(tracker.getDepth()).assertEqual(1);
        expect(tracker.getCurrentPhase()).assertEqual(FlowPhase.PHASE_STAGE_CREATED);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_1700
     * @tc.name testRollbackEmptyHistory
     * @tc.desc Verify rollback boundary: rolling back an empty history returns null and leaves depth 0 with no
     * current phase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRollbackEmptyHistory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const tracker: FlowRollbackTracker = new FlowRollbackTracker(LifecycleFlowPlan.defaultSteps());
        expect(tracker.rollbackLast() === null).assertTrue();
        expect(tracker.getDepth()).assertEqual(0);
        expect(tracker.getCurrentPhase() === null).assertTrue();
        expect(tracker.rollbackTo(3)).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_1800
     * @tc.name testRollbackToPhase
     * @tc.desc Verify phase rollback: rolling back to the foreground phase succeeds after four steps and rolling back
     * to the stage phase stops at the first record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRollbackToPhase', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const steps: FlowStep[] = LifecycleFlowPlan.defaultSteps();
        const executor: FlowExecutor = new FlowExecutor(steps);
        const tracker: FlowRollbackTracker = new FlowRollbackTracker(steps);
        executor.executeAll(10);
        executor.getRecords().forEach((record: StepRecord) => tracker.push(record));
        const reachedForeground: boolean = tracker.rollbackToPhase(FlowPhase.PHASE_FOREGROUND);
        expect(reachedForeground).assertTrue();
        expect(tracker.getCurrentPhase()).assertEqual(FlowPhase.PHASE_FOREGROUND);
        const reachedStage: boolean = tracker.rollbackToPhase(FlowPhase.PHASE_STAGE_CREATED);
        expect(reachedStage).assertTrue();
        expect(tracker.getDepth()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_1900
     * @tc.name testDurationLedgerAccumulation
     * @tc.desc Verify duration ledger: five recorded steps accumulate 55 ms with an average of 11 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDurationLedgerAccumulation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const ledger: FlowDurationLedger = new FlowDurationLedger();
        ledger.record(10);
        ledger.record(12);
        ledger.record(11);
        ledger.record(9);
        ledger.record(13);
        expect(ledger.getCount()).assertEqual(5);
        expect(ledger.cumulative()).assertEqual(55);
        expect(ledger.average()).assertEqual(11);
        expect(ledger.peak()).assertEqual(13);
        expect(ledger.trough()).assertEqual(9);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_2000
     * @tc.name testDurationLedgerBudget
     * @tc.desc Verify cumulative budget check: 55 ms fits a 60 ms aggregate budget but not a 50 ms one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDurationLedgerBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const ledger: FlowDurationLedger = new FlowDurationLedger();
        ledger.record(20);
        ledger.record(20);
        ledger.record(15);
        expect(ledger.withinAggregateBudget(60)).assertTrue();
        expect(ledger.withinAggregateBudget(50)).assertFalse();
        expect(ledger.withinAggregateBudget(55)).assertTrue();
        ledger.clear();
        expect(ledger.getCount()).assertEqual(0);
        expect(ledger.cumulative()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_2100
     * @tc.name testDurationEmptyLedger
     * @tc.desc Verify empty ledger: count, sum, average, peak and trough are all zero and any budget is satisfied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDurationEmptyLedger', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const ledger: FlowDurationLedger = new FlowDurationLedger();
        expect(ledger.getCount()).assertEqual(0);
        expect(ledger.average()).assertEqual(0);
        expect(ledger.peak()).assertEqual(0);
        expect(ledger.trough()).assertEqual(0);
        expect(ledger.withinAggregateBudget(0)).assertTrue();
        expect(ledger.getDurations().length).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_2200
     * @tc.name testExecutorDurationSum
     * @tc.desc Verify execution duration sum: seven steps of 9 ms accumulate 63 ms in the ledger
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExecutorDurationSum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const steps: FlowStep[] = LifecycleFlowPlan.defaultSteps();
        const executor: FlowExecutor = new FlowExecutor(steps);
        const ledger: FlowDurationLedger = new FlowDurationLedger();
        const records: StepRecord[] = executor.executeAll(9);
        records.forEach((record: StepRecord) => ledger.record(record.elapsedMs));
        expect(ledger.getCount()).assertEqual(7);
        expect(ledger.cumulative()).assertEqual(63);
        expect(ledger.average()).assertEqual(9);
        expect(ledger.peak()).assertEqual(9);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_2300
     * @tc.name testStepStateMachineLifecycle
     * @tc.desc Verify step state machine: a step moves pending to running to done and cannot restart afterwards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStepStateMachineLifecycle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const machine: FlowStepStateMachine = new FlowStepStateMachine(7);
        expect(machine.getState(0)).assertEqual(StepState.STATE_PENDING);
        expect(machine.start(0)).assertTrue();
        expect(machine.getState(0)).assertEqual(StepState.STATE_RUNNING);
        expect(machine.finish(0)).assertTrue();
        expect(machine.getState(0)).assertEqual(StepState.STATE_DONE);
        expect(machine.start(0)).assertFalse();
        expect(machine.countOf(StepState.STATE_DONE)).assertEqual(1);
        expect(machine.countOf(StepState.STATE_PENDING)).assertEqual(6);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_2400
     * @tc.name testStepStateMachineFailure
     * @tc.desc Verify failure transition: only a running step can fail, a pending step cannot, and reset restores
     * pending state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStepStateMachineFailure', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const machine: FlowStepStateMachine = new FlowStepStateMachine(4);
        expect(machine.fail(1)).assertFalse();
        machine.start(1);
        expect(machine.fail(1)).assertTrue();
        expect(machine.getState(1)).assertEqual(StepState.STATE_FAILED);
        expect(machine.countOf(StepState.STATE_FAILED)).assertEqual(1);
        machine.reset(1);
        expect(machine.getState(1)).assertEqual(StepState.STATE_PENDING);
        expect(machine.countOf(StepState.STATE_FAILED)).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_2500
     * @tc.name testStepStateMachineBounds
     * @tc.desc Verify state machine bounds: an out-of-range index reports pending and start on index 7 is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStepStateMachineBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const machine: FlowStepStateMachine = new FlowStepStateMachine(7);
        expect(machine.getStepCount()).assertEqual(7);
        expect(machine.inRange(6)).assertTrue();
        expect(machine.inRange(7)).assertFalse();
        expect(machine.start(7)).assertFalse();
        expect(machine.start(-1)).assertFalse();
        expect(machine.getState(6)).assertEqual(StepState.STATE_PENDING);
        expect(machine.countOf(StepState.STATE_RUNNING)).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_2600
     * @tc.name testPhaseTimelineTransitions
     * @tc.desc Verify phase timeline: six transitions are produced and no self transition occurs in the default plan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPhaseTimelineTransitions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const timeline: FlowPhaseTimeline = new FlowPhaseTimeline(LifecycleFlowPlan.defaultSteps());
        const transitions: string[] = timeline.transitions();
        expect(transitions.length).assertEqual(6);
        expect(timeline.hasSelfTransition()).assertFalse();
        expect(timeline.phaseAt(0)).assertEqual(FlowPhase.PHASE_STAGE_CREATED);
        expect(timeline.phaseAt(99) === null).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_2700
     * @tc.name testPhaseTimelineCounts
     * @tc.desc Verify transition counting: the timeline enters foreground twice, background once, and the maximum
     * index gap between neighbours is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPhaseTimelineCounts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const timeline: FlowPhaseTimeline = new FlowPhaseTimeline(LifecycleFlowPlan.defaultSteps());
        expect(timeline.countTransitionsTo(FlowPhase.PHASE_FOREGROUND)).assertEqual(2);
        expect(timeline.countTransitionsTo(FlowPhase.PHASE_BACKGROUND)).assertEqual(1);
        expect(timeline.countTransitionsTo(FlowPhase.PHASE_DESTROYED)).assertEqual(1);
        expect(timeline.maxPhaseGap()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_2800
     * @tc.name testTranscriptRecording
     * @tc.desc Verify transcript audit: three appended entries are retained in order and first and last entries match
     * the expected step names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTranscriptRecording', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const transcript: FlowTranscript = new FlowTranscript();
        transcript.append('step:stage_create');
        transcript.append('step:ability_create');
        transcript.append('step:window_create');
        expect(transcript.getSize()).assertEqual(3);
        expect(transcript.firstEntry()).assertEqual('step:stage_create');
        expect(transcript.lastEntry()).assertEqual('step:window_create');
        expect(transcript.contains('ability_create')).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_2900
     * @tc.name testTranscriptClearAndMiss
     * @tc.desc Verify transcript reset: an empty transcript returns empty strings, reports size 0 and does not
     * contain any fragment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTranscriptClearAndMiss', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const transcript: FlowTranscript = new FlowTranscript();
        transcript.append('step:stage_create');
        transcript.clear();
        expect(transcript.getSize()).assertEqual(0);
        expect(transcript.firstEntry()).assertEqual('');
        expect(transcript.lastEntry()).assertEqual('');
        expect(transcript.contains('stage')).assertFalse();
        expect(transcript.getEntries().length).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_3000
     * @tc.name testRetryPolicyAttempts
     * @tc.desc Verify retry policy: with a maximum of 3 attempts, attempts 0 and 2 retry while attempt 3 is exhausted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRetryPolicyAttempts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const policy: FlowRetryPolicy = new FlowRetryPolicy(3);
        expect(policy.getMaxAttempts()).assertEqual(3);
        expect(policy.shouldRetry(0)).assertTrue();
        expect(policy.shouldRetry(2)).assertTrue();
        expect(policy.shouldRetry(3)).assertFalse();
        expect(policy.isExhausted(3)).assertTrue();
        expect(policy.isExhausted(2)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_3100
     * @tc.name testRetryPolicyBackoff
     * @tc.desc Verify retry backoff: the first delay equals the base delay, the second doubles it, and the attempt
     * number is clamped to the maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRetryPolicyBackoff', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const policy: FlowRetryPolicy = new FlowRetryPolicy(4);
        expect(policy.nextDelayMs(100, 0)).assertEqual(100);
        expect(policy.nextDelayMs(100, 1)).assertEqual(100);
        expect(policy.nextDelayMs(100, 2)).assertEqual(200);
        expect(policy.attemptForFailureCount(0)).assertEqual(1);
        expect(policy.attemptForFailureCount(9)).assertEqual(4);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_3200
     * @tc.name testPlanLookupById
     * @tc.desc Verify plan lookup: a known step id resolves to index 4 and an unknown id resolves to null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPlanLookupById', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const inspector: FlowPlanInspector = FlowPlanInspector.createDefault();
        const background: FlowStep | null = inspector.findById('flow_background');
        expect(background === null).assertFalse();
        if (background !== null) {
          expect(background.index).assertEqual(4);
          expect(background.phase).assertEqual(FlowPhase.PHASE_BACKGROUND);
        }
        expect(inspector.findById('flow_unknown') === null).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_3300
     * @tc.name testPlanIndexesOfPhases
     * @tc.desc Verify phase indexing: the background phase sits at index 4, the first foreground at index 3 and the
     * destroyed phase at index 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPlanIndexesOfPhases', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const inspector: FlowPlanInspector = FlowPlanInspector.createDefault();
        expect(inspector.indexOfPhase(FlowPhase.PHASE_BACKGROUND)).assertEqual(4);
        expect(inspector.indexOfPhase(FlowPhase.PHASE_FOREGROUND)).assertEqual(3);
        expect(inspector.indexOfPhase(FlowPhase.PHASE_DESTROYED)).assertEqual(6);
        expect(inspector.indexOfPhase(FlowPhase.PHASE_STAGE_CREATED)).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_3400
     * @tc.name testPlanNamesAndIds
     * @tc.desc Verify plan metadata: seven ids and names are exposed, both lists are unique and the window step name
     * is AbilityOnWindowStageCreate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPlanNamesAndIds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const inspector: FlowPlanInspector = FlowPlanInspector.createDefault();
        const ids: string[] = inspector.ids();
        const names: string[] = inspector.names();
        const uniqueIds: Set<string> = new Set<string>(ids);
        expect(ids.length).assertEqual(7);
        expect(names.length).assertEqual(7);
        expect(uniqueIds.size).assertEqual(7);
        expect(names[2]).assertEqual('AbilityOnWindowStageCreate');
        expect(names[6]).assertEqual('AbilityOnDestroy');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_3500
     * @tc.name testRealFlowLaunchForegroundBackground
     * @tc.desc Verify real flow orchestration: launch EntryAbility, move to background, return to foreground and
     * confirm the index page is visible with at least one component
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealFlowLaunchForegroundBackground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await serializedDelay(driver, DELAY_AFTER_LAUNCH);
        await doAbilityBackground();
        await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
        await doAbilityForeground();
        await serializedDelay(driver, DELAY_AFTER_LAUNCH);
        const visible: boolean = await isIndexPageVisible(driver);
        const count: number = await pageComponentCount(driver);
        expect(visible).assertTrue();
        expect(count >= 1).assertTrue();
        expect(ENTRY_ABILITY_NAME).assertEqual('EntryAbility');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_3600
     * @tc.name testRealFlowKeepsKeyComponent
     * @tc.desc Verify the key component survives a background and foreground round trip through the delegator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealFlowKeepsKeyComponent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await waitForIndexPageStable(driver);
        const beforeBackground: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        await doAbilityBackground();
        await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
        await doAbilityForeground();
        await serializedDelay(driver, DELAY_AFTER_LAUNCH);
        const afterForeground: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        expect(beforeBackground).assertTrue();
        expect(afterForeground).assertTrue();
        expect(INDEX_PAGE_TEXT_KEY).assertEqual('HelloWorld');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_3700
     * @tc.name testRealFlowElapsedBudget
     * @tc.desc Verify real flow timing: a foreground cycle completes within five times the ability launch timeout and
     * the measured duration is not negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealFlowElapsedBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await doAbilityForeground();
        const startTime: number = Date.now();
        await doAbilityBackground();
        await doAbilityForeground();
        const elapsed: number = measureElapsed(startTime);
        const budget: number = TIMEOUT_ABILITY_LAUNCH * 5;
        expect(elapsed >= 0).assertTrue();
        expect(isWithinBudget(elapsed, budget)).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_3800
     * @tc.name testRepeatedForegroundCycles
     * @tc.desc Verify repeated cycles: three background and foreground round trips keep the page visible and the step
     * state machine records three completed foreground steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRepeatedForegroundCycles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const machine: FlowStepStateMachine = new FlowStepStateMachine(3);
        for (let round = 0; round < 3; round++) {
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          machine.start(round);
          machine.finish(round);
        }
        expect(machine.countOf(StepState.STATE_DONE)).assertEqual(3);
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_3900
     * @tc.name testRealFlowComponentQueries
     * @tc.desc Verify UI queries after the flow: text components exist and the collected text list contains the
     * initial or clicked page text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRealFlowComponentQueries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await waitForIndexPageStable(driver);
        const textComponents: Component[] = await findComponentsByType(driver, 'Text');
        const texts: string[] = await collectAllTexts(driver);
        const matchInitial: boolean = texts.includes(PAGE_TEXT_INITIAL);
        const matchClicked: boolean = texts.includes(PAGE_TEXT_CLICKED);
        expect(textComponents.length >= 1).assertTrue();
        expect(matchInitial || matchClicked).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_4000
     * @tc.name testDelegatorBundleConsistency
     * @tc.desc Verify delegator environment: the delegator resolves a non-empty bundle name and the running ability
     * name constant matches the entry ability
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDelegatorBundleConsistency', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const bundleName: string = getBundleName();
        expect(bundleName.length > 0).assertTrue();
        expect(bundleName.includes('abilitystage')).assertTrue();
        expect(ENTRY_ABILITY_NAME).assertEqual('EntryAbility');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_4100
     * @tc.name testFlowSampleStatisticsHelpers
     * @tc.desc Verify aggregate helpers on a six sample duration series: average 10, max 15 and min 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFlowSampleStatisticsHelpers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const samples: number[] = [5, 7, 9, 11, 13, 15];
        expect(averageOf(samples)).assertEqual(10);
        expect(maxOf(samples)).assertEqual(15);
        expect(minOf(samples)).assertEqual(5);
        const emptySamples: number[] = [];
        expect(averageOf(emptySamples)).assertEqual(0);
        expect(maxOf(emptySamples)).assertEqual(0);
        expect(minOf(emptySamples)).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_4200
     * @tc.name testLaunchAndWindowRender
     * @tc.desc Verify the launch to window create prefix of the flow produces a stable index page with at least one
     * component
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLaunchAndWindowRender', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const steps: FlowStep[] = LifecycleFlowPlan.defaultSteps();
        const executor: FlowExecutor = new FlowExecutor(steps);
        executor.executeNext(5);
        executor.executeNext(5);
        executor.executeNext(5);
        await launchEntryAbility();
        const stable: boolean = await waitForIndexPageStable(driver);
        const count: number = await pageComponentCount(driver);
        expect(executor.getCursor()).assertEqual(3);
        expect(stable).assertTrue();
        expect(count >= 1).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FLOW_4300
     * @tc.name testFullModelDrivenFlow
     * @tc.desc Verify the complete model driven flow: all seven steps execute, the transcript holds seven entries and
     * the ledger total equals 84 ms for uniform 12 ms steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFullModelDrivenFlow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const steps: FlowStep[] = LifecycleFlowPlan.defaultSteps();
        const executor: FlowExecutor = new FlowExecutor(steps);
        const transcript: FlowTranscript = new FlowTranscript();
        const ledger: FlowDurationLedger = new FlowDurationLedger();
        while (!executor.isComplete()) {
          const record: StepRecord | null = executor.executeNext(12);
          if (record === null) {
            break;
          }
          transcript.append(record.id);
          ledger.record(record.elapsedMs);
        }
        expect(transcript.getSize()).assertEqual(7);
        expect(ledger.cumulative()).assertEqual(84);
        expect(transcript.firstEntry()).assertEqual('flow_stage_create');
        expect(transcript.lastEntry()).assertEqual('flow_destroy');
      } finally {
        done();
      }
    })
  })
}
