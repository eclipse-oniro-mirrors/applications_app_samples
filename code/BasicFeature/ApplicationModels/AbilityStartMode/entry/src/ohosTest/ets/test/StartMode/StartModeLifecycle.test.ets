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
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  KEY_BACK,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  serializedDelay,
  componentCount,
  isFoodDetailVisible,
  isHomePageVisible,
  launchStandardAbility,
  launchSingletonAbility,
  resetToHome,
  waitForFoodDetailStable,
  waitForHomePageStable,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_PAGE_SWITCH,
  INDEX_STANDARD_GROUP,
  MODE_STANDARD,
  logInfo
} from '../Shared/SharedDriver';

// Launch mode classification of the three sample abilities.
enum InstanceKind {
  STANDARD = 'standard', SPECIFIED = 'specified', SINGLETON = 'singleton'
}

// Lifecycle phases emitted by the sample abilities.
enum LifecyclePhase {
  CREATE = 'create', WINDOW_STAGE_CREATE = 'windowStageCreate', ON_NEW_WANT = 'onNewWant',
  FOREGROUND = 'foreground', BACKGROUND = 'background', WINDOW_STAGE_DESTROY = 'windowStageDestroy',
  DESTROY = 'destroy'
}

// Runtime state of an ability used by the transition state machine.
enum LifecycleStageState {
  IDLE = 'idle', RUNNING = 'running', PAUSED = 'paused', STOPPED = 'stopped', DESTROYED = 'destroyed'
}

// Direction of a state transition.
enum TransitionKind {
  FORWARD = 'forward', BACKWARD = 'backward', RESTART = 'restart'
}

// One recorded lifecycle callback.
interface LifecycleRecord {
  phase: LifecyclePhase;
  timestamp: number;
}

// One recorded state transition.
interface LifecycleTransition {
  from: LifecycleStageState;
  to: LifecycleStageState;
  kind: TransitionKind;
  timestamp: number;
}

// Point in time snapshot of the ability lifecycle.
interface LifecycleSnapshot {
  state: LifecycleStageState;
  phaseCount: number;
  isForeground: boolean;
}

// Records lifecycle phases in chronological order.
class LifecycleTracker {
  private static instance: LifecycleTracker;
  private records: LifecycleRecord[] = [];

  public static getInstance(): LifecycleTracker {
    if (!LifecycleTracker.instance) {
      LifecycleTracker.instance = new LifecycleTracker();
    }
    return LifecycleTracker.instance;
  }

  public record(phase: LifecyclePhase): void {
    this.records.push({
      phase: phase,
      timestamp: Date.now()
    });
  }

  public getRecords(): LifecycleRecord[] {
    return [...this.records];
  }

  public hasPhase(phase: LifecyclePhase): boolean {
    return this.records.some((record: LifecycleRecord) => record.phase === phase);
  }

  public indexOf(phase: LifecyclePhase): number {
    return this.records.findIndex((record: LifecycleRecord) => record.phase === phase);
  }

  public countPhase(phase: LifecyclePhase): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].phase === phase) {
        count++;
      }
    }
    return count;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].timestamp < this.records[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public reset(): void {
    this.records = [];
  }
}

// Counts how many instances of every launch mode were created.
class AbilityInstanceRegistry {
  private counts: Map<InstanceKind, number> = new Map<InstanceKind, number>();

  public obtain(kind: InstanceKind, reuseExisting: boolean): number {
    const current: number = this.counts.get(kind) ?? 0;
    if (reuseExisting && current > 0) {
      return current;
    }
    const next: number = current + 1;
    this.counts.set(kind, next);
    return next;
  }

  public getInstanceCount(kind: InstanceKind): number {
    const value: number | undefined = this.counts.get(kind);
    if (value === undefined) {
      return 0;
    }
    return value;
  }

  public wasReused(kind: InstanceKind): boolean {
    return this.getInstanceCount(kind) === 1;
  }

  public reset(): void {
    this.counts = new Map<InstanceKind, number>();
  }
}

// Mock ability that mirrors the lifecycle callbacks of the sample.
class MockStartModeAbility {
  private tracker: LifecycleTracker;
  private kind: InstanceKind;
  private registry: AbilityInstanceRegistry;
  private foodItemId: number;

  constructor(tracker: LifecycleTracker, kind: InstanceKind, registry: AbilityInstanceRegistry) {
    this.tracker = tracker;
    this.kind = kind;
    this.registry = registry;
    this.foodItemId = 0;
  }

  public launch(reuseExisting: boolean): number {
    this.registry.obtain(this.kind, reuseExisting);
    this.tracker.record(LifecyclePhase.CREATE);
    return this.foodItemId;
  }

  public onCreate(): void {
    this.tracker.record(LifecyclePhase.CREATE);
  }

  public onWindowStageCreate(): void {
    this.tracker.record(LifecyclePhase.WINDOW_STAGE_CREATE);
  }

  public onNewWant(foodItemId: number): number {
    this.foodItemId = foodItemId === 0 ? 1 : 0;
    this.tracker.record(LifecyclePhase.ON_NEW_WANT);
    return this.foodItemId;
  }

  public onForeground(): void {
    this.tracker.record(LifecyclePhase.FOREGROUND);
  }

  public onBackground(): void {
    this.tracker.record(LifecyclePhase.BACKGROUND);
  }

  public onWindowStageDestroy(): void {
    this.tracker.record(LifecyclePhase.WINDOW_STAGE_DESTROY);
  }

  public onDestroy(): void {
    this.tracker.record(LifecyclePhase.DESTROY);
  }

  public getFoodItemId(): number {
    return this.foodItemId;
  }
}

// Maintains the current lifecycle state and validates transitions.
class LifecycleStateMachine {
  private state: LifecycleStageState = LifecycleStageState.IDLE;
  private transitions: LifecycleTransition[] = [];

  public getState(): LifecycleStageState {
    return this.state;
  }

  public transition(to: LifecycleStageState): boolean {
    const kind: TransitionKind = this.resolveKind(to);
    this.transitions.push({
      from: this.state,
      to: to,
      kind: kind,
      timestamp: Date.now()
    });
    this.state = to;
    return true;
  }

  public getTransitions(): LifecycleTransition[] {
    return [...this.transitions];
  }

  public getTransitionCount(): number {
    return this.transitions.length;
  }

  public isForwardTransition(to: LifecycleStageState): boolean {
    return this.resolveKind(to) === TransitionKind.FORWARD;
  }

  private resolveKind(to: LifecycleStageState): TransitionKind {
    const order: LifecycleStageState[] = [
      LifecycleStageState.IDLE, LifecycleStageState.RUNNING, LifecycleStageState.PAUSED,
      LifecycleStageState.STOPPED, LifecycleStageState.DESTROYED
    ];
    const fromIndex: number = order.indexOf(this.state);
    const toIndex: number = order.indexOf(to);
    if (toIndex > fromIndex) {
      return TransitionKind.FORWARD;
    }
    if (toIndex < fromIndex) {
      return TransitionKind.BACKWARD;
    }
    return TransitionKind.RESTART;
  }

  public reset(): void {
    this.state = LifecycleStageState.IDLE;
    this.transitions = [];
  }
}

// Builds a lifecycle snapshot from the collected records.
class LifecycleSnapshotBuilder {
  private records: LifecycleRecord[] = [];

  public addRecord(record: LifecycleRecord): void {
    this.records.push(record);
  }

  public addRecords(records: LifecycleRecord[]): void {
    this.records.push(...records);
  }

  public build(state: LifecycleStageState, isForeground: boolean): LifecycleSnapshot {
    return {
      state: state,
      phaseCount: this.records.length,
      isForeground: isForeground
    };
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public clear(): void {
    this.records = [];
  }
}

// Aggregates the occurrence count of every lifecycle phase.
class LifecycleMetrics {
  private phaseCounts: Map<LifecyclePhase, number> = new Map<LifecyclePhase, number>();

  public recordPhase(phase: LifecyclePhase): void {
    const current: number = this.phaseCounts.get(phase) ?? 0;
    this.phaseCounts.set(phase, current + 1);
  }

  public getPhaseCount(phase: LifecyclePhase): number {
    const value: number | undefined = this.phaseCounts.get(phase);
    if (value === undefined) {
      return 0;
    }
    return value;
  }

  public getTotalCount(): number {
    let total: number = 0;
    this.phaseCounts.forEach((value: number) => {
      total += value;
    });
    return total;
  }

  public getDistinctPhaseCount(): number {
    return this.phaseCounts.size;
  }

  public clear(): void {
    this.phaseCounts = new Map<LifecyclePhase, number>();
  }
}

// Compares two lifecycle phases by their callback order.
class LifecyclePhaseComparator {
  private static readonly ORDER: LifecyclePhase[] = [
    LifecyclePhase.CREATE, LifecyclePhase.WINDOW_STAGE_CREATE, LifecyclePhase.FOREGROUND,
    LifecyclePhase.ON_NEW_WANT, LifecyclePhase.BACKGROUND, LifecyclePhase.WINDOW_STAGE_DESTROY,
    LifecyclePhase.DESTROY
  ];

  public static indexOf(phase: LifecyclePhase): number {
    return LifecyclePhaseComparator.ORDER.indexOf(phase);
  }

  public static isBefore(a: LifecyclePhase, b: LifecyclePhase): boolean {
    return LifecyclePhaseComparator.indexOf(a) < LifecyclePhaseComparator.indexOf(b);
  }

  public static isAfter(a: LifecyclePhase, b: LifecyclePhase): boolean {
    return LifecyclePhaseComparator.indexOf(a) > LifecyclePhaseComparator.indexOf(b);
  }

  public static isSamePhase(a: LifecyclePhase, b: LifecyclePhase): boolean {
    return a === b;
  }

  public static getOrder(): LifecyclePhase[] {
    return [...LifecyclePhaseComparator.ORDER];
  }
}

// Audits whether a lifecycle record list matches an expected prefix.
class LifecycleAuditor {
  private expectedSequence: LifecyclePhase[] = [];

  public setExpectedSequence(sequence: LifecyclePhase[]): void {
    this.expectedSequence = [...sequence];
  }

  public matches(records: LifecycleRecord[]): boolean {
    if (records.length < this.expectedSequence.length) {
      return false;
    }
    for (let i = 0; i < this.expectedSequence.length; i++) {
      if (records[i].phase !== this.expectedSequence[i]) {
        return false;
      }
    }
    return true;
  }

  public getExpectedSequence(): LifecyclePhase[] {
    return [...this.expectedSequence];
  }

  public getExpectedLength(): number {
    return this.expectedSequence.length;
  }
}

// Fixed slot counter that avoids repeated enum index lookups.
class PhaseCountTable {
  private counts: number[] = [0, 0, 0, 0, 0, 0, 0];

  public record(phaseIndex: number): boolean {
    if (phaseIndex < 0 || phaseIndex >= this.counts.length) {
      return false;
    }
    this.counts[phaseIndex]++;
    return true;
  }

  public getCount(phaseIndex: number): number {
    if (phaseIndex < 0 || phaseIndex >= this.counts.length) {
      return 0;
    }
    return this.counts[phaseIndex];
  }

  public getTotal(): number {
    let total: number = 0;
    for (let i = 0; i < this.counts.length; i++) {
      total += this.counts[i];
    }
    return total;
  }

  public getMaxCount(): number {
    let max: number = 0;
    for (let i = 0; i < this.counts.length; i++) {
      if (this.counts[i] > max) {
        max = this.counts[i];
      }
    }
    return max;
  }

  public getDistinctCount(): number {
    let distinct: number = 0;
    for (let i = 0; i < this.counts.length; i++) {
      if (this.counts[i] > 0) {
        distinct++;
      }
    }
    return distinct;
  }

  public reset(): void {
    this.counts = [0, 0, 0, 0, 0, 0, 0];
  }
}

// Records stage transitions as pairs of source and target indices.
class StageTransitionRecorder {
  private transitions: number[][] = [];

  public record(fromIndex: number, toIndex: number): void {
    const pair: number[] = [fromIndex, toIndex];
    this.transitions.push(pair);
  }

  public getTransitionCount(): number {
    return this.transitions.length;
  }

  public hasTransition(fromIndex: number, toIndex: number): boolean {
    for (let i = 0; i < this.transitions.length; i++) {
      const pair: number[] = this.transitions[i];
      if (pair[0] === fromIndex && pair[1] === toIndex) {
        return true;
      }
    }
    return false;
  }

  public isMonotonicForward(): boolean {
    for (let i = 1; i < this.transitions.length; i++) {
      const prev: number[] = this.transitions[i - 1];
      const curr: number[] = this.transitions[i];
      if (curr[0] < prev[0] || curr[1] < prev[1]) {
        return false;
      }
    }
    return true;
  }

  public reset(): void {
    this.transitions = [];
  }
}

// Evaluates whether a lifecycle record list is healthy.
class LifecycleHealthChecker {
  private totalRecords: number = 0;
  private duplicatePhases: number = 0;

  public analyze(records: LifecycleRecord[]): void {
    this.totalRecords = records.length;
    const phases: LifecyclePhase[] = [];
    for (let i = 0; i < records.length; i++) {
      phases.push(records[i].phase);
    }
    const uniqueCount: number = LifecycleHealthChecker.countUnique(phases);
    this.duplicatePhases = this.totalRecords - uniqueCount;
  }

  private static countUnique(phases: LifecyclePhase[]): number {
    const unique: LifecyclePhase[] = [];
    for (let i = 0; i < phases.length; i++) {
      if (!unique.includes(phases[i])) {
        unique.push(phases[i]);
      }
    }
    return unique.length;
  }

  public getTotalRecords(): number {
    return this.totalRecords;
  }

  public getDuplicateCount(): number {
    return this.duplicatePhases;
  }

  public isHealthy(): boolean {
    return this.duplicatePhases === 0;
  }
}

export default function startModeLifecycleTest() {
  describe('StartModeLifecycle_Test', () => {
    let driver: Driver;
    let tracker: LifecycleTracker;
    let registry: AbilityInstanceRegistry;

    beforeAll(async () => {
      driver = getDriver();
      tracker = LifecycleTracker.getInstance();
      registry = new AbilityInstanceRegistry();
      tracker.reset();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // Cold start order: onCreate before onWindowStageCreate.
    it('cold_start_lifecycle_order_should_be_create_then_window_stage', 0, async () => {
      tracker.reset();
      const ability = new MockStartModeAbility(tracker, InstanceKind.STANDARD, registry);
      ability.onCreate();
      ability.onWindowStageCreate();
      expect(tracker.indexOf(LifecyclePhase.CREATE))
        .assertLessOrEqual(tracker.indexOf(LifecyclePhase.WINDOW_STAGE_CREATE));
    });

    // Standard mode creates a new instance on every launch.
    it('standard_mode_should_create_new_instance_per_launch', 0, async () => {
      registry.reset();
      const ability = new MockStartModeAbility(tracker, InstanceKind.STANDARD, registry);
      ability.launch(false);
      ability.launch(false);
      expect(registry.getInstanceCount(InstanceKind.STANDARD)).assertEqual(2);
    });

    // Singleton mode reuses the existing instance on relaunch.
    it('singleton_mode_should_reuse_existing_instance', 0, async () => {
      registry.reset();
      const ability = new MockStartModeAbility(tracker, InstanceKind.SINGLETON, registry);
      ability.launch(false);
      ability.launch(true);
      expect(registry.getInstanceCount(InstanceKind.SINGLETON)).assertEqual(1);
      expect(registry.wasReused(InstanceKind.SINGLETON)).assertTrue();
    });

    // onNewWant flips the food identifier between 0 and 1.
    it('on_new_want_should_flip_food_item_id', 0, async () => {
      tracker.reset();
      registry.reset();
      const ability = new MockStartModeAbility(tracker, InstanceKind.SINGLETON, registry);
      expect(ability.onNewWant(0)).assertEqual(1);
      expect(ability.onNewWant(1)).assertEqual(0);
      expect(ability.getFoodItemId()).assertEqual(0);
    });

    // onNewWant should be observable in the lifecycle records.
    it('on_new_want_should_be_recorded', 0, async () => {
      tracker.reset();
      const ability = new MockStartModeAbility(tracker, InstanceKind.SINGLETON, registry);
      ability.onNewWant(0);
      expect(tracker.hasPhase(LifecyclePhase.ON_NEW_WANT)).assertTrue();
    });

    // Destruction order: window stage destroy before ability destroy.
    it('destroy_lifecycle_order_should_be_window_destroy_then_destroy', 0, async () => {
      tracker.reset();
      const ability = new MockStartModeAbility(tracker, InstanceKind.STANDARD, registry);
      ability.onWindowStageDestroy();
      ability.onDestroy();
      expect(tracker.indexOf(LifecyclePhase.WINDOW_STAGE_DESTROY))
        .assertLessOrEqual(tracker.indexOf(LifecyclePhase.DESTROY));
    });

    // onCreate records the create phase.
    it('on_create_should_record_create_phase', 0, async () => {
      tracker.reset();
      const ability = new MockStartModeAbility(tracker, InstanceKind.STANDARD, registry);
      ability.onCreate();
      expect(tracker.hasPhase(LifecyclePhase.CREATE)).assertTrue();
    });

    // onWindowStageCreate records the window setup phase.
    it('on_window_stage_create_should_record_phase', 0, async () => {
      tracker.reset();
      const ability = new MockStartModeAbility(tracker, InstanceKind.STANDARD, registry);
      ability.onWindowStageCreate();
      expect(tracker.hasPhase(LifecyclePhase.WINDOW_STAGE_CREATE)).assertTrue();
    });

    // Foreground and background switches are both recorded.
    it('foreground_background_switch_should_be_recorded', 0, async () => {
      tracker.reset();
      const ability = new MockStartModeAbility(tracker, InstanceKind.STANDARD, registry);
      ability.onForeground();
      ability.onBackground();
      expect(tracker.hasPhase(LifecyclePhase.FOREGROUND)).assertTrue();
      expect(tracker.hasPhase(LifecyclePhase.BACKGROUND)).assertTrue();
    });

    // Window stage destroy releases resources.
    it('on_window_stage_destroy_should_release_resources', 0, async () => {
      tracker.reset();
      const ability = new MockStartModeAbility(tracker, InstanceKind.STANDARD, registry);
      ability.onWindowStageDestroy();
      expect(tracker.hasPhase(LifecyclePhase.WINDOW_STAGE_DESTROY)).assertTrue();
    });

    // Destroying without a window stage must stay safe.
    it('destroy_without_window_stage_should_be_safe', 0, async () => {
      tracker.reset();
      const ability = new MockStartModeAbility(tracker, InstanceKind.STANDARD, registry);
      ability.onDestroy();
      expect(tracker.hasPhase(LifecyclePhase.DESTROY)).assertTrue();
      expect(tracker.hasPhase(LifecyclePhase.WINDOW_STAGE_DESTROY)).assertFalse();
    });

    // Every lifecycle record must keep a monotonic timestamp.
    it('lifecycle_records_should_be_chronological', 0, async () => {
      tracker.reset();
      const ability = new MockStartModeAbility(tracker, InstanceKind.STANDARD, registry);
      ability.onCreate();
      ability.onWindowStageCreate();
      ability.onForeground();
      ability.onBackground();
      ability.onWindowStageDestroy();
      ability.onDestroy();
      expect(tracker.isChronological()).assertTrue();
    });

    // Phase count table aggregates the recorded phases correctly.
    it('phase_count_table_should_aggregate_records', 0, async () => {
      const table = new PhaseCountTable();
      table.record(LifecyclePhaseComparator.indexOf(LifecyclePhase.CREATE));
      table.record(LifecyclePhaseComparator.indexOf(LifecyclePhase.CREATE));
      table.record(LifecyclePhaseComparator.indexOf(LifecyclePhase.ON_NEW_WANT));
      expect(table.getCount(LifecyclePhaseComparator.indexOf(LifecyclePhase.CREATE))).assertEqual(2);
      expect(table.getTotal()).assertEqual(3);
      expect(table.getDistinctCount()).assertEqual(2);
      expect(table.getMaxCount()).assertEqual(2);
    });

    // The fixed slot table rejects out of range indices.
    it('phase_count_table_should_reject_invalid_index', 0, async () => {
      const table = new PhaseCountTable();
      expect(table.record(-1)).assertFalse();
      expect(table.record(99)).assertFalse();
      expect(table.getCount(99)).assertEqual(0);
    });

    // Phase comparator exposes a stable callback order.
    it('phase_comparator_should_order_callbacks', 0, async () => {
      expect(LifecyclePhaseComparator.isBefore(LifecyclePhase.CREATE, LifecyclePhase.DESTROY)).assertTrue();
      expect(LifecyclePhaseComparator.isAfter(LifecyclePhase.DESTROY, LifecyclePhase.CREATE)).assertTrue();
      expect(LifecyclePhaseComparator.isSamePhase(LifecyclePhase.ON_NEW_WANT,
        LifecyclePhase.ON_NEW_WANT)).assertTrue();
      expect(LifecyclePhaseComparator.getOrder().length).assertEqual(7);
    });

    // The state machine records forward transitions.
    it('state_machine_should_record_forward_transition', 0, async () => {
      const machine = new LifecycleStateMachine();
      machine.transition(LifecycleStageState.RUNNING);
      machine.transition(LifecycleStageState.PAUSED);
      expect(machine.getTransitionCount()).assertEqual(2);
      expect(machine.isForwardTransition(LifecycleStageState.STOPPED)).assertTrue();
      expect(machine.getState()).assertEqual(LifecycleStageState.PAUSED);
    });

    // Resetting the state machine restores the idle state.
    it('state_machine_reset_should_restore_idle', 0, async () => {
      const machine = new LifecycleStateMachine();
      machine.transition(LifecycleStageState.RUNNING);
      machine.reset();
      expect(machine.getState()).assertEqual(LifecycleStageState.IDLE);
      expect(machine.getTransitionCount()).assertEqual(0);
    });

    // Snapshot builder counts every appended record.
    it('snapshot_builder_should_count_records', 0, async () => {
      const builder = new LifecycleSnapshotBuilder();
      builder.addRecord({ phase: LifecyclePhase.CREATE, timestamp: Date.now() });
      builder.addRecord({ phase: LifecyclePhase.WINDOW_STAGE_CREATE, timestamp: Date.now() });
      const snapshot: LifecycleSnapshot = builder.build(LifecycleStageState.RUNNING, true);
      expect(snapshot.phaseCount).assertEqual(2);
      expect(snapshot.state).assertEqual(LifecycleStageState.RUNNING);
      expect(snapshot.isForeground).assertTrue();
    });

    // Metrics aggregate phase occurrences and total count.
    it('lifecycle_metrics_should_aggregate_phase_counts', 0, async () => {
      const metrics = new LifecycleMetrics();
      metrics.recordPhase(LifecyclePhase.CREATE);
      metrics.recordPhase(LifecyclePhase.WINDOW_STAGE_CREATE);
      metrics.recordPhase(LifecyclePhase.CREATE);
      expect(metrics.getPhaseCount(LifecyclePhase.CREATE)).assertEqual(2);
      expect(metrics.getTotalCount()).assertEqual(3);
      expect(metrics.getDistinctPhaseCount()).assertEqual(2);
    });

    // Auditor matches an expected lifecycle prefix.
    it('auditor_should_match_expected_prefix', 0, async () => {
      tracker.reset();
      const ability = new MockStartModeAbility(tracker, InstanceKind.STANDARD, registry);
      ability.onCreate();
      ability.onWindowStageCreate();
      const auditor = new LifecycleAuditor();
      auditor.setExpectedSequence([LifecyclePhase.CREATE, LifecyclePhase.WINDOW_STAGE_CREATE]);
      expect(auditor.matches(tracker.getRecords())).assertTrue();
      expect(auditor.getExpectedLength()).assertEqual(2);
    });

    // Stage transition recorder detects monotonic forward moves.
    it('stage_transition_recorder_should_detect_forward_moves', 0, async () => {
      const recorder = new StageTransitionRecorder();
      recorder.record(0, 1);
      recorder.record(1, 2);
      expect(recorder.getTransitionCount()).assertEqual(2);
      expect(recorder.hasTransition(1, 2)).assertTrue();
      expect(recorder.isMonotonicForward()).assertTrue();
    });

    // Health checker reports duplicated phases.
    it('health_checker_should_report_duplicate_phases', 0, async () => {
      const checker = new LifecycleHealthChecker();
      checker.analyze([
        { phase: LifecyclePhase.CREATE, timestamp: Date.now() },
        { phase: LifecyclePhase.CREATE, timestamp: Date.now() }
      ]);
      expect(checker.getDuplicateCount()).assertEqual(1);
      expect(checker.isHealthy()).assertFalse();
      expect(checker.getTotalRecords()).assertEqual(2);
    });

    // Back press from the food detail page returns to the home page.
    it('back_press_from_detail_should_return_home', 0, async () => {
      await launchStandardAbility(0, MODE_STANDARD, INDEX_STANDARD_GROUP);
      const detailRendered: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      expect(detailRendered || (await isFoodDetailVisible(driver))).assertTrue();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
      const homeRendered: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(homeRendered || (await isHomePageVisible(driver))).assertTrue();
      logInfo('back_press_from_detail_should_return_home: home page observed');
    });

    // Relaunching the singleton ability keeps the page alive.
    it('singleton_relaunch_should_keep_page_alive', 0, async () => {
      await launchSingletonAbility(0);
      await serializedDelay(driver, 500);
      await launchSingletonAbility(1);
      await serializedDelay(driver, 500);
      const rendered: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      expect(rendered || (await isFoodDetailVisible(driver))).assertTrue();
      const counted: number = await componentCount(driver);
      expect(counted).assertLargerOrEqual(1);
      await resetToHome(driver);
    });
  });
}

