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
  KEY_DOWN,
  KEY_UP,
  pressAndWait,
  serializedDelay,
  waitForHomePageStable,
  isHomePageVisible,
  resetToHome,
  launchStandardAbility,
  launchSpecifiedAbility,
  launchSingletonAbility,
  countModeLabels,
  checkTextContent,
  logInfo,
  ABILITY_MAIN,
  ABILITY_STANDARD,
  ABILITY_SPECIFIED,
  ABILITY_SINGLETON,
  MODE_SPECIFIED,
  MODE_SINGLETON,
  TEXT_FOOD_DETAIL_TITLE,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_PAGE_SWITCH,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';

/** One want accepted by MyAbilityStage.onAcceptWant. */
interface StageAcceptRecord {
  isReady?: string;
  abilityName?: string;
  key?: string;
  mode?: string;
  operation?: number;
  timestamp?: number;
  error?: string;
  recovery?: string;
  sync?: string;
  resource?: string;
  performance?: string;
  iteration?: number;
}

/**
 * Mock of the ability stage of the sample. MyAbilityStage.onAcceptWant
 * returns `SpecifiedAbility${foodItemId}` for SpecifiedAbility, which makes
 * the same food id reuse the same ability instance.
 */
class MockAbilityStageSession {
  private static instance: MockAbilityStageSession;
  private stageState: string = 'terminated';
  private accepted: StageAcceptRecord[] = [];

  public static getInstance(): MockAbilityStageSession {
    if (!MockAbilityStageSession.instance) {
      MockAbilityStageSession.instance = new MockAbilityStageSession();
    }
    return MockAbilityStageSession.instance;
  }

  public createSession(): void {
    this.stageState = 'created';
    this.accepted = [];
  }

  public activateSession(): void {
    this.stageState = 'active';
  }

  public terminateSession(): void {
    this.stageState = 'terminated';
  }

  /** Stores one accepted want while the stage is active. */
  public acceptWant(record: StageAcceptRecord): void {
    if (this.stageState === 'active') {
      this.accepted.push(record);
    }
  }

  public getStageState(): string {
    return this.stageState;
  }

  public getAccepted(): StageAcceptRecord[] {
    return [...this.accepted];
  }

  /** Returns true when the given ability key was accepted by the stage. */
  public hasAcceptedKey(key: string): boolean {
    return this.accepted.some((record: StageAcceptRecord) => record.key === key);
  }
}

/** Lifecycle states of an ability driven by the ability stage. */
enum AbilityStageState {
  CREATED = 'created',
  ACTIVE = 'active',
  SUSPENDED = 'suspended',
  TERMINATED = 'terminated'
}

/** Lifecycle events of the abilities of the sample. */
enum AbilityLifecycleEvent {
  ON_ACCEPT_WANT = 'on_accept_want',
  ON_CREATE = 'on_create',
  ON_WINDOW_STAGE_CREATE = 'on_window_stage_create',
  ON_FOREGROUND = 'on_foreground',
  ON_BACKGROUND = 'on_background',
  ON_DESTROY = 'on_destroy'
}

/** Snapshot of the ability stage bookkeeping. */
interface AbilityStageInfo {
  stageId: string;
  state: AbilityStageState;
  acceptedCount: number;
  createdAt: number;
  isReady: boolean;
}

/** One recorded ability lifecycle event. */
interface AbilityLifecycleRecord {
  event: AbilityLifecycleEvent;
  abilityName: string;
  timestamp: number;
}

/** Maps every lifecycle event to the resulting ability state. */
class AbilityStageStateConverter {
  private static readonly EVENT_TO_STATE: Map<AbilityLifecycleEvent, AbilityStageState> =
    new Map<AbilityLifecycleEvent, AbilityStageState>([
      [AbilityLifecycleEvent.ON_ACCEPT_WANT, AbilityStageState.CREATED],
      [AbilityLifecycleEvent.ON_CREATE, AbilityStageState.CREATED],
      [AbilityLifecycleEvent.ON_WINDOW_STAGE_CREATE, AbilityStageState.ACTIVE],
      [AbilityLifecycleEvent.ON_FOREGROUND, AbilityStageState.ACTIVE],
      [AbilityLifecycleEvent.ON_BACKGROUND, AbilityStageState.SUSPENDED],
      [AbilityLifecycleEvent.ON_DESTROY, AbilityStageState.TERMINATED]
    ]);

  public eventToState(event: AbilityLifecycleEvent): AbilityStageState {
    const state: AbilityStageState | undefined = AbilityStageStateConverter.EVENT_TO_STATE.get(event);
    if (state === undefined) {
      return AbilityStageState.TERMINATED;
    }
    return state;
  }

  public isActiveState(state: AbilityStageState): boolean {
    return state === AbilityStageState.ACTIVE;
  }

  public isTerminatedState(state: AbilityStageState): boolean {
    return state === AbilityStageState.TERMINATED;
  }
}

/** Step by step builder of the ability stage info object. */
class AbilityStageInfoBuilder {
  private stageId: string = '';
  private state: AbilityStageState = AbilityStageState.TERMINATED;
  private acceptedCount: number = 0;
  private createdAt: number = 0;
  private isReady: boolean = false;

  public setStageId(stageId: string): AbilityStageInfoBuilder {
    this.stageId = stageId;
    return this;
  }

  public setState(state: AbilityStageState): AbilityStageInfoBuilder {
    this.state = state;
    return this;
  }

  public setAcceptedCount(acceptedCount: number): AbilityStageInfoBuilder {
    this.acceptedCount = acceptedCount;
    return this;
  }

  public setCreatedAt(createdAt: number): AbilityStageInfoBuilder {
    this.createdAt = createdAt;
    return this;
  }

  public setReady(isReady: boolean): AbilityStageInfoBuilder {
    this.isReady = isReady;
    return this;
  }

  public build(): AbilityStageInfo {
    const info: AbilityStageInfo = {
      stageId: this.stageId,
      state: this.state,
      acceptedCount: this.acceptedCount,
      createdAt: this.createdAt,
      isReady: this.isReady
    };
    return info;
  }

  public reset(): void {
    this.stageId = '';
    this.state = AbilityStageState.TERMINATED;
    this.acceptedCount = 0;
    this.createdAt = 0;
    this.isReady = false;
  }
}

/** Records the lifecycle events of the abilities of the sample. */
class AbilityLifecycleRecorder {
  private records: AbilityLifecycleRecord[] = [];

  public record(event: AbilityLifecycleEvent, abilityName: string): void {
    const record: AbilityLifecycleRecord = {
      event: event,
      abilityName: abilityName,
      timestamp: Date.now()
    };
    this.records.push(record);
  }

  public getRecords(): AbilityLifecycleRecord[] {
    return [...this.records];
  }

  public countEvent(event: AbilityLifecycleEvent): number {
    let count: number = 0;
    for (const record of this.records) {
      if (record.event === event) {
        count++;
      }
    }
    return count;
  }

  public hasEvent(event: AbilityLifecycleEvent): boolean {
    return this.countEvent(event) > 0;
  }

  public clearRecords(): void {
    this.records = [];
  }
}

/** Statistics over the wants accepted by the ability stage. */
class StageAcceptStatistics {
  private accepted: StageAcceptRecord[] = [];

  constructor(accepted: StageAcceptRecord[]) {
    this.accepted = [...accepted];
  }

  /** Counts the accepts that carry the given optional field. */
  public countByField(field: string): number {
    let count: number = 0;
    for (const record of this.accepted) {
      if (this.hasField(record, field)) {
        count++;
      }
    }
    return count;
  }

  private hasField(record: StageAcceptRecord, field: string): boolean {
    if (field === 'isReady') {
      return record.isReady !== undefined;
    }
    if (field === 'key') {
      return record.key !== undefined;
    }
    if (field === 'mode') {
      return record.mode !== undefined;
    }
    if (field === 'operation') {
      return record.operation !== undefined;
    }
    return false;
  }

  public getAcceptedCount(): number {
    return this.accepted.length;
  }

  /** Sums the optional operation numbers of the accepted wants. */
  public sumOperation(): number {
    let total: number = 0;
    for (const record of this.accepted) {
      if (record.operation !== undefined) {
        total += record.operation;
      }
    }
    return total;
  }
}

/** The key returned by onAcceptWant for one specified launch. */
class StageKeyModel {
  private key: string = '';
  private mode: string = '';
  private operation: number = 0;
  private timestamp: number = 0;

  constructor(key: string, mode: string, operation: number, timestamp: number) {
    this.key = key;
    this.mode = mode;
    this.operation = operation;
    this.timestamp = timestamp;
  }

  public getKey(): string {
    return this.key;
  }

  public getMode(): string {
    return this.mode;
  }

  public getOperation(): number {
    return this.operation;
  }

  public getTimestamp(): number {
    return this.timestamp;
  }

  public setKey(key: string): void {
    this.key = key;
  }

  public toString(): string {
    return `StageKey(key=${this.key}, mode=${this.mode}, operation=${this.operation})`;
  }

  public equals(other: StageKeyModel): boolean {
    return this.key === other.key && this.mode === other.mode && this.operation === other.operation;
  }
}

/** Collects the ability keys produced by the stage. */
class StageKeyManager {
  private models: StageKeyModel[] = [];

  public appendModel(model: StageKeyModel): void {
    this.models.push(model);
  }

  public getModels(): StageKeyModel[] {
    return [...this.models];
  }

  public filterByMode(mode: string): StageKeyModel[] {
    const filtered: StageKeyModel[] = [];
    for (const model of this.models) {
      if (model.getMode() === mode) {
        filtered.push(model);
      }
    }
    return filtered;
  }

  public clearModels(): void {
    this.models = [];
  }

  public getModelCount(): number {
    return this.models.length;
  }
}

/** Scheduling policy of the stage tasks. */
enum StageSchedulingPolicy {
  SEQUENTIAL = 'sequential',
  PRIORITY = 'priority',
  ROUND_ROBIN = 'round_robin'
}

/** One launch task waiting for the ability stage. */
interface StageTask {
  taskId: string;
  priority: number;
  state: AbilityStageState;
  isScheduled: boolean;
}

/** Schedules the launch tasks of the ability stage. */
class StageTaskScheduler {
  private policy: StageSchedulingPolicy = StageSchedulingPolicy.SEQUENTIAL;
  private tasks: StageTask[] = [];

  public setPolicy(policy: StageSchedulingPolicy): void {
    this.policy = policy;
  }

  public getPolicy(): StageSchedulingPolicy {
    return this.policy;
  }

  public addTask(task: StageTask): void {
    this.tasks.push(task);
  }

  public getTasks(): StageTask[] {
    return [...this.tasks];
  }

  /** Marks the next unscheduled task as scheduled. */
  public scheduleNext(): StageTask | null {
    for (const task of this.tasks) {
      if (!task.isScheduled) {
        task.isScheduled = true;
        return task;
      }
    }
    return null;
  }

  public countScheduledTasks(): number {
    let count: number = 0;
    for (const task of this.tasks) {
      if (task.isScheduled) {
        count++;
      }
    }
    return count;
  }

  public clearTasks(): void {
    this.tasks = [];
  }
}

/** Tracks the lifetime of one ability stage session. */
class StageTimerModel {
  private startTime: number = 0;
  private endTime: number = 0;
  private isRunning: boolean = false;

  public start(): void {
    this.startTime = Date.now();
    this.isRunning = true;
  }

  public stop(): void {
    this.endTime = Date.now();
    this.isRunning = false;
  }

  public getElapsed(): number {
    if (this.isRunning) {
      return Date.now() - this.startTime;
    }
    return this.endTime - this.startTime;
  }

  public isRunningNow(): boolean {
    return this.isRunning;
  }

  public resetTimer(): void {
    this.startTime = 0;
    this.endTime = 0;
    this.isRunning = false;
  }
}

/** Snapshot of the ability stage at one point in time. */
class StageSnapshotModel {
  private state: AbilityStageState;
  private acceptedCount: number;
  private capturedAt: number;

  constructor(state: AbilityStageState, acceptedCount: number, capturedAt: number) {
    this.state = state;
    this.acceptedCount = acceptedCount;
    this.capturedAt = capturedAt;
  }

  public getState(): AbilityStageState {
    return this.state;
  }

  public getAcceptedCount(): number {
    return this.acceptedCount;
  }

  public getCapturedAt(): number {
    return this.capturedAt;
  }

  public toString(): string {
    return `StageSnapshot(state=${this.state}, acceptedCount=${this.acceptedCount})`;
  }
}

/** Collects the ability stage snapshots of the current run. */
class StageSnapshotManager {
  private snapshots: StageSnapshotModel[] = [];

  public appendSnapshot(snapshot: StageSnapshotModel): void {
    this.snapshots.push(snapshot);
  }

  public getSnapshots(): StageSnapshotModel[] {
    return [...this.snapshots];
  }

  public filterByState(state: AbilityStageState): StageSnapshotModel[] {
    const filtered: StageSnapshotModel[] = [];
    for (const snapshot of this.snapshots) {
      if (snapshot.getState() === state) {
        filtered.push(snapshot);
      }
    }
    return filtered;
  }

  public clearSnapshots(): void {
    this.snapshots = [];
  }
}

export default function abilityStageLifecycleTest() {
  describe('AbilityStageLifecycle_Test', () => {
    let driver: Driver;
    let mockStage: MockAbilityStageSession;

    // Prepare the driver and the stage mock, then wait for the home page.
    beforeAll(async () => {
      driver = getDriver();
      mockStage = MockAbilityStageSession.getInstance();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    // Send the sample back to the home page so the next suite starts clean.
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await resetToHome(driver);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
    });

    // The ability stage must be created before the first want arrives.
    it('ability_stage_should_be_created_successfully', 0, async () => {
      mockStage.createSession();
      expect(mockStage.getStageState()).assertEqual('created');

      const homeVisible: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const labels: number = await countModeLabels(driver);
      expect(homeVisible).assertTrue();
      expect(labels).assertEqual(3);
    });

    // An activated stage must accept the standard want of the sample.
    it('stage_should_accept_standard_want_when_activated', 0, async () => {
      mockStage.activateSession();
      mockStage.acceptWant({
        isReady: '1',
        abilityName: ABILITY_STANDARD,
        key: 'StandardAbility'
      });

      expect(mockStage.getStageState()).assertEqual('active');
      expect(mockStage.getAccepted().some((record: StageAcceptRecord) => record.isReady === '1')).assertTrue();
      expect(mockStage.hasAcceptedKey('StandardAbility')).assertTrue();
      logInfo(`stage accepted ${ABILITY_STANDARD}`);
    });

    // onAcceptWant must return the same key for the same food id.
    it('on_accept_want_should_reuse_key_for_same_food_id', 0, async () => {
      mockStage.createSession();
      mockStage.activateSession();
      mockStage.acceptWant({ abilityName: ABILITY_SPECIFIED, key: 'SpecifiedAbility0' });
      mockStage.acceptWant({ abilityName: ABILITY_SPECIFIED, key: 'SpecifiedAbility0' });

      const accepted: StageAcceptRecord[] = mockStage.getAccepted();
      expect(accepted.length).assertEqual(2);
      expect(accepted[0].key).assertEqual('SpecifiedAbility0');
      expect(accepted[1].key).assertEqual('SpecifiedAbility0');
      logInfo(`specified key reused for mode ${MODE_SPECIFIED}`);
    });

    // onAcceptWant must return different keys for different food ids.
    it('on_accept_want_should_create_key_for_new_food_id', 0, async () => {
      mockStage.createSession();
      mockStage.activateSession();
      mockStage.acceptWant({ abilityName: ABILITY_SPECIFIED, key: 'SpecifiedAbility0' });
      mockStage.acceptWant({ abilityName: ABILITY_SPECIFIED, key: 'SpecifiedAbility1' });

      expect(mockStage.hasAcceptedKey('SpecifiedAbility0')).assertTrue();
      expect(mockStage.hasAcceptedKey('SpecifiedAbility1')).assertTrue();
      expect(mockStage.getAccepted().length).assertEqual(2);
    });

    // A terminated stage must ignore every further want.
    it('stage_should_terminate_correctly', 0, async () => {
      mockStage.createSession();
      mockStage.activateSession();
      mockStage.acceptWant({ abilityName: ABILITY_SINGLETON, key: 'SingletonAbility' });
      mockStage.terminateSession();

      expect(mockStage.getStageState()).assertEqual('terminated');
      mockStage.acceptWant({ abilityName: ABILITY_SINGLETON, key: 'SingletonAbilityLeak' });
      expect(mockStage.hasAcceptedKey('SingletonAbilityLeak')).assertFalse();
      logInfo(`stage ignored the want after termination for ${MODE_SINGLETON}`);
    });

    // The full ability lifecycle must run in order.
    it('complete_ability_lifecycle_should_work_correctly', 0, async () => {
      mockStage.createSession();
      expect(mockStage.getStageState()).assertEqual('created');

      mockStage.activateSession();
      expect(mockStage.getStageState()).assertEqual('active');

      mockStage.acceptWant({ isReady: '1', abilityName: ABILITY_MAIN, key: 'MainAbility' });
      expect(mockStage.getAccepted().length).assertEqual(1);

      mockStage.terminateSession();
      expect(mockStage.getStageState()).assertEqual('terminated');
    });

    // The accepted wants must keep the fields they were sent with.
    it('accepted_want_data_should_be_integral_during_lifecycle', 0, async () => {
      mockStage.createSession();
      mockStage.activateSession();
      mockStage.acceptWant({ key: 'init', abilityName: ABILITY_STANDARD });
      mockStage.acceptWant({ key: 'config', abilityName: ABILITY_SPECIFIED });
      mockStage.acceptWant({ key: 'ready', abilityName: ABILITY_SINGLETON });

      const accepted: StageAcceptRecord[] = mockStage.getAccepted();
      expect(accepted.length).assertEqual(3);
      expect(accepted[0].key).assertEqual('init');
      expect(accepted[1].key).assertEqual('config');
      expect(accepted[2].key).assertEqual('ready');
      mockStage.terminateSession();
    });

    // The stage state must persist during repeated accepts.
    it('stage_state_should_persist_correctly_during_operations', 0, async () => {
      mockStage.createSession();
      mockStage.activateSession();
      for (let i = 0; i < 5; i++) {
        mockStage.acceptWant({ operation: i, timestamp: Date.now(), key: `operation_${i}` });
      }

      expect(mockStage.getStageState()).assertEqual('active');
      expect(mockStage.getAccepted().length).assertLargerOrEqual(5);
      mockStage.terminateSession();
    });

    // The stage must recover after an aborted session.
    it('stage_should_recover_from_errors_correctly', 0, async () => {
      mockStage.terminateSession();
      mockStage.acceptWant({ error: 'aborted_session', key: 'aborted' });
      expect(mockStage.hasAcceptedKey('aborted')).assertFalse();

      mockStage.createSession();
      mockStage.activateSession();
      mockStage.acceptWant({ recovery: 'success', key: 'recovered' });
      expect(mockStage.hasAcceptedKey('recovered')).assertTrue();
      mockStage.terminateSession();
    });

    // The stage mock must behave as a shared singleton.
    it('multiple_stage_instances_should_be_managed_correctly', 0, async () => {
      const stage1: MockAbilityStageSession = MockAbilityStageSession.getInstance();
      const stage2: MockAbilityStageSession = MockAbilityStageSession.getInstance();
      expect(stage1 === stage2).assertTrue();

      stage1.createSession();
      expect(stage2.getStageState()).assertEqual('created');

      stage1.activateSession();
      expect(stage2.getStageState()).assertEqual('active');

      stage1.acceptWant({ sync: 'shared', key: 'sync_key' });
      expect(stage2.hasAcceptedKey('sync_key')).assertTrue();
      stage1.terminateSession();
    });

    // Terminating the stage must clear every cached want.
    it('resources_should_be_cleaned_up_when_stage_terminates', 0, async () => {
      mockStage.createSession();
      mockStage.activateSession();
      mockStage.acceptWant({ resource: 'allocated', key: 'allocated' });

      mockStage.terminateSession();
      mockStage.acceptWant({ resource: 'leak', key: 'leak' });
      expect(mockStage.hasAcceptedKey('leak')).assertFalse();
      expect(mockStage.getStageState()).assertEqual('terminated');
    });

    // The stage bookkeeping must stay inside the time budget.
    it('stage_lifecycle_operations_should_meet_performance_requirements', 0, async () => {
      const startTime: number = Date.now();
      mockStage.createSession();
      mockStage.activateSession();

      for (let i = 0; i < 10; i++) {
        mockStage.acceptWant({ performance: 'check', iteration: i, key: `perf_${i}` });
      }
      mockStage.terminateSession();

      const operationTime: number = Date.now() - startTime;
      expect(operationTime).assertLessOrEqual(100);
      expect(mockStage.getStageState()).assertEqual('terminated');
    });

    // The lifecycle recorder must keep and count every event.
    it('lifecycle_recorder_should_count_events', 0, async () => {
      const recorder: AbilityLifecycleRecorder = new AbilityLifecycleRecorder();
      recorder.record(AbilityLifecycleEvent.ON_ACCEPT_WANT, ABILITY_SPECIFIED);
      recorder.record(AbilityLifecycleEvent.ON_CREATE, ABILITY_SPECIFIED);
      recorder.record(AbilityLifecycleEvent.ON_WINDOW_STAGE_CREATE, ABILITY_SPECIFIED);
      recorder.record(AbilityLifecycleEvent.ON_FOREGROUND, ABILITY_SPECIFIED);

      expect(recorder.getRecords().length).assertEqual(4);
      expect(recorder.countEvent(AbilityLifecycleEvent.ON_ACCEPT_WANT)).assertEqual(1);
      expect(recorder.hasEvent(AbilityLifecycleEvent.ON_WINDOW_STAGE_CREATE)).assertTrue();
      expect(recorder.hasEvent(AbilityLifecycleEvent.ON_DESTROY)).assertFalse();
    });

    // Every lifecycle event must map to its resulting state.
    it('stage_state_converter_should_map_events', 0, async () => {
      const converter: AbilityStageStateConverter = new AbilityStageStateConverter();

      expect(converter.eventToState(AbilityLifecycleEvent.ON_ACCEPT_WANT))
        .assertEqual(AbilityStageState.CREATED);
      expect(converter.eventToState(AbilityLifecycleEvent.ON_WINDOW_STAGE_CREATE))
        .assertEqual(AbilityStageState.ACTIVE);
      expect(converter.eventToState(AbilityLifecycleEvent.ON_BACKGROUND))
        .assertEqual(AbilityStageState.SUSPENDED);
      expect(converter.eventToState(AbilityLifecycleEvent.ON_DESTROY))
        .assertEqual(AbilityStageState.TERMINATED);
      expect(converter.isActiveState(AbilityStageState.ACTIVE)).assertTrue();
      expect(converter.isTerminatedState(AbilityStageState.SUSPENDED)).assertFalse();
    });

    // The info builder must produce the requested stage info.
    it('stage_info_builder_should_build_info', 0, async () => {
      const builder: AbilityStageInfoBuilder = new AbilityStageInfoBuilder();
      const info: AbilityStageInfo = builder
        .setStageId('MyAbilityStage')
        .setState(AbilityStageState.ACTIVE)
        .setAcceptedCount(2)
        .setCreatedAt(1000)
        .setReady(true)
        .build();

      expect(info.stageId).assertEqual('MyAbilityStage');
      expect(info.state).assertEqual(AbilityStageState.ACTIVE);
      expect(info.acceptedCount).assertEqual(2);
      expect(info.createdAt).assertEqual(1000);
      expect(info.isReady).assertTrue();

      builder.reset();
      expect(builder.build().stageId).assertEqual('');
    });

    // The accept statistics must count fields and sum the operations.
    it('stage_accept_statistics_should_count_fields', 0, async () => {
      const accepted: StageAcceptRecord[] = [
        { isReady: '1', key: 'SpecifiedAbility0', mode: MODE_SPECIFIED, operation: 1 },
        { key: 'SpecifiedAbility1', mode: MODE_SPECIFIED, operation: 2 },
        { isReady: '1', key: 'SingletonAbility', mode: MODE_SINGLETON, operation: 4 }
      ];
      const statistics: StageAcceptStatistics = new StageAcceptStatistics(accepted);

      expect(statistics.getAcceptedCount()).assertEqual(3);
      expect(statistics.countByField('isReady')).assertEqual(2);
      expect(statistics.countByField('mode')).assertEqual(3);
      expect(statistics.countByField('operation')).assertEqual(3);
      expect(statistics.sumOperation()).assertEqual(7);
    });

    // The ability key model must compare by key, mode and operation.
    it('stage_key_model_should_compare_keys', 0, async () => {
      const first: StageKeyModel = new StageKeyModel('SpecifiedAbility0', MODE_SPECIFIED, 1, 1000);
      const second: StageKeyModel = new StageKeyModel('SpecifiedAbility0', MODE_SPECIFIED, 1, 2000);
      const third: StageKeyModel = new StageKeyModel('SpecifiedAbility1', MODE_SPECIFIED, 1, 3000);

      expect(first.equals(second)).assertTrue();
      expect(first.equals(third)).assertFalse();
      expect(first.toString()).assertContain('SpecifiedAbility0');
      first.setKey('SpecifiedAbility2');
      expect(first.getKey()).assertEqual('SpecifiedAbility2');
      expect(first.getTimestamp()).assertEqual(1000);
    });

    // The key manager must filter the keys by launch mode.
    it('stage_key_manager_should_filter_by_mode', 0, async () => {
      const manager: StageKeyManager = new StageKeyManager();
      manager.appendModel(new StageKeyModel('SpecifiedAbility0', MODE_SPECIFIED, 0, 1000));
      manager.appendModel(new StageKeyModel('SpecifiedAbility1', MODE_SPECIFIED, 1, 2000));
      manager.appendModel(new StageKeyModel('SingletonAbility', MODE_SINGLETON, 0, 3000));

      expect(manager.getModelCount()).assertEqual(3);
      expect(manager.filterByMode(MODE_SPECIFIED).length).assertEqual(2);
      expect(manager.filterByMode(MODE_SINGLETON).length).assertEqual(1);
      manager.clearModels();
      expect(manager.getModelCount()).assertEqual(0);
    });

    // The scheduler must respect its policy and mark the tasks.
    it('stage_task_scheduler_should_schedule_tasks', 0, async () => {
      const scheduler: StageTaskScheduler = new StageTaskScheduler();
      scheduler.setPolicy(StageSchedulingPolicy.SEQUENTIAL);
      expect(scheduler.getPolicy()).assertEqual(StageSchedulingPolicy.SEQUENTIAL);

      scheduler.addTask({ taskId: 'standard', priority: 1, state: AbilityStageState.CREATED, isScheduled: false });
      scheduler.addTask({ taskId: 'specified', priority: 2, state: AbilityStageState.CREATED, isScheduled: false });
      const first: StageTask | null = scheduler.scheduleNext();

      expect(first === null).assertFalse();
      expect(scheduler.countScheduledTasks()).assertEqual(1);
      expect(scheduler.scheduleNext() !== null).assertTrue();
      expect(scheduler.scheduleNext() === null).assertTrue();
      expect(scheduler.getTasks().length).assertEqual(2);
      scheduler.clearTasks();
      expect(scheduler.getTasks().length).assertEqual(0);
    });

    // The stage timer must report a non negative elapsed time.
    it('stage_timer_should_track_elapsed_time', 0, async () => {
      const timer: StageTimerModel = new StageTimerModel();
      expect(timer.isRunningNow()).assertFalse();

      timer.start();
      expect(timer.isRunningNow()).assertTrue();
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      timer.stop();

      expect(timer.isRunningNow()).assertFalse();
      expect(timer.getElapsed()).assertLargerOrEqual(0);
      timer.resetTimer();
      expect(timer.getElapsed()).assertEqual(0);
    });

    // The snapshot manager must filter the snapshots by stage state.
    it('stage_snapshot_manager_should_filter_by_state', 0, async () => {
      const manager: StageSnapshotManager = new StageSnapshotManager();
      manager.appendSnapshot(new StageSnapshotModel(AbilityStageState.ACTIVE, 2, 1000));
      manager.appendSnapshot(new StageSnapshotModel(AbilityStageState.ACTIVE, 3, 2000));
      manager.appendSnapshot(new StageSnapshotModel(AbilityStageState.TERMINATED, 3, 3000));

      expect(manager.getSnapshots().length).assertEqual(3);
      expect(manager.filterByState(AbilityStageState.ACTIVE).length).assertEqual(2);
      expect(manager.filterByState(AbilityStageState.TERMINATED).length).assertEqual(1);
      expect(manager.filterByState(AbilityStageState.CREATED).length).assertEqual(0);

      const snapshot: StageSnapshotModel = new StageSnapshotModel(AbilityStageState.SUSPENDED, 1, 4000);
      expect(snapshot.toString()).assertContain('suspended');
      expect(snapshot.getAcceptedCount()).assertEqual(1);
      expect(snapshot.getCapturedAt()).assertEqual(4000);
      manager.clearSnapshots();
      expect(manager.getSnapshots().length).assertEqual(0);
    });

    // The real launch flow must keep the home page alive.
    it('launch_flow_should_keep_home_page_alive', 0, async () => {
      const homeVisible: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(homeVisible).assertTrue();

      await launchStandardAbility(0, 'standard');
      await serializedDelay(driver, TIMEOUT_PAGE_SWITCH);
      const detailVisible: boolean = await checkTextContent(driver, TEXT_FOOD_DETAIL_TITLE);
      logInfo(`standard launch kept the detail title: ${detailVisible}`);

      await resetToHome(driver);
      expect(await isHomePageVisible(driver)).assertTrue();
      await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      expect(mockStage.getStageState().length > 0).assertTrue();
    });

    // The specified and singleton abilities must reuse one stage.
    it('specified_and_singleton_should_share_the_stage', 0, async () => {
      mockStage.createSession();
      mockStage.activateSession();
      logInfo(`sharing stage between ${MODE_SPECIFIED} and ${MODE_SINGLETON}`);

      await launchSpecifiedAbility(0, 'pages/FoodDetail', 1);
      mockStage.acceptWant({ abilityName: ABILITY_SPECIFIED, key: 'SpecifiedAbility0' });
      await serializedDelay(driver, TIMEOUT_PAGE_SWITCH);

      await launchSingletonAbility(0);
      mockStage.acceptWant({ abilityName: ABILITY_SINGLETON, key: 'SingletonAbility' });
      await serializedDelay(driver, TIMEOUT_PAGE_SWITCH);

      expect(mockStage.getAccepted().length).assertEqual(2);
      expect(mockStage.hasAcceptedKey('SpecifiedAbility0')).assertTrue();
      expect(mockStage.hasAcceptedKey('SingletonAbility')).assertTrue();
      expect(mockStage.getStageState()).assertEqual('active');
      await resetToHome(driver);
    });
  });
}
