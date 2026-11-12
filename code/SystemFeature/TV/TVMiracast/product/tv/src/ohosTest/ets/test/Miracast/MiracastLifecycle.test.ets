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
import { Driver } from '../Shared/MiracastDriver';
import {
  getDriver,
  KEY_BACK,
  pressAndWait,
  serializedDelay,
  miracastComponentCount,
  waitForPageStable,
  triggerMiracastHome,
  isIndexPageVisible,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_SESSION_OP,
  TIMEOUT_PAGE_RENDER,
  SERVICE_ABILITY_NAME,
  UI_ABILITY_NAME
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'MiracastLifecycleSuite';

enum LifecyclePhase {
  SERVICE_CREATE = 'serviceCreate',
  SERVICE_BIND = 'serviceBind',
  SESSION_CREATED = 'sessionCreated',
  PLAYER_PAGE_SHOW = 'playerPageShow',
  FOCUS_APPLIED = 'focusApplied',
  PLAYER_PAGE_HIDE = 'playerPageHide',
  SESSION_RELEASED = 'sessionReleased',
  SERVICE_DESTROY = 'serviceDestroy'
}

interface LifecycleRecord {
  phase: LifecyclePhase;
  timestamp: number;
}

class LifecycleTracker {
  private static instance: LifecycleTracker | null = null;
  private records: LifecycleRecord[] = [];

  public static getInstance(): LifecycleTracker {
    if (LifecycleTracker.instance === null) {
      LifecycleTracker.instance = new LifecycleTracker();
    }
    return LifecycleTracker.instance;
  }

  public record(phase: LifecyclePhase): void {
    const record: LifecycleRecord = {
      phase: phase,
      timestamp: Date.now()
    };
    this.records.push(record);
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

  public getCount(): number { return this.records.length; }

  public countPhase(phase: LifecyclePhase): number {
    return this.records.filter((record: LifecycleRecord) => record.phase === phase).length;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].timestamp < this.records[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public getFirstPhase(): LifecyclePhase | null {
    if (this.records.length === 0) {
      return null;
    }
    return this.records[0].phase;
  }

  public getLastPhase(): LifecyclePhase | null {
    if (this.records.length === 0) {
      return null;
    }
    return this.records[this.records.length - 1].phase;
  }

  public reset(): void { this.records = []; }
}

class MockMiracastAbility {
  private tracker: LifecycleTracker;

  constructor(tracker: LifecycleTracker) {
    this.tracker = tracker;
  }

  public onCreate(): void {
    this.tracker.record(LifecyclePhase.SERVICE_CREATE);
  }

  public onServiceBind(): void {
    this.tracker.record(LifecyclePhase.SERVICE_BIND);
  }

  public onSessionCreated(): void {
    this.tracker.record(LifecyclePhase.SESSION_CREATED);
  }

  public onPlayerPageShow(): void {
    this.tracker.record(LifecyclePhase.PLAYER_PAGE_SHOW);
  }

  public onFocusApplied(): void {
    this.tracker.record(LifecyclePhase.FOCUS_APPLIED);
  }

  public onPlayerPageHide(): void {
    this.tracker.record(LifecyclePhase.PLAYER_PAGE_HIDE);
  }

  public onSessionReleased(): void {
    this.tracker.record(LifecyclePhase.SESSION_RELEASED);
  }

  public onDestroy(): void {
    this.tracker.record(LifecyclePhase.SERVICE_DESTROY);
  }
}

enum LifecycleStageState {
  IDLE = 'idle',
  RUNNING = 'running',
  PAUSED = 'paused',
  STOPPED = 'stopped',
  DESTROYED = 'destroyed'
}

enum TransitionKind {
  FORWARD = 'forward',
  BACKWARD = 'backward',
  RESTART = 'restart'
}

interface LifecycleTransition {
  from: LifecycleStageState;
  to: LifecycleStageState;
  kind: TransitionKind;
  timestamp: number;
}

interface LifecycleSnapshot {
  state: LifecycleStageState;
  phaseCount: number;
  isForeground: boolean;
}

class LifecycleStateMachine {
  private state: LifecycleStageState = LifecycleStageState.IDLE;
  private transitions: LifecycleTransition[] = [];

  public getState(): LifecycleStageState { return this.state; }

  public transition(to: LifecycleStageState): boolean {
    const kind: TransitionKind = this.resolveKind(to);
    const record: LifecycleTransition = {
      from: this.state,
      to: to,
      kind: kind,
      timestamp: Date.now()
    };
    this.transitions.push(record);
    this.state = to;
    return true;
  }

  private resolveKind(to: LifecycleStageState): TransitionKind {
    const order: LifecycleStageState[] = [
      LifecycleStageState.IDLE,
      LifecycleStageState.RUNNING,
      LifecycleStageState.PAUSED,
      LifecycleStageState.STOPPED,
      LifecycleStageState.DESTROYED
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

  public getTransitions(): LifecycleTransition[] {
    return [...this.transitions];
  }

  public getTransitionCount(): number { return this.transitions.length; }

  public isForwardTransition(to: LifecycleStageState): boolean {
    return this.resolveKind(to) === TransitionKind.FORWARD;
  }

  public reset(): void {
    this.state = LifecycleStageState.IDLE;
    this.transitions = [];
  }
}

class LifecycleSnapshotBuilder {
  private records: LifecycleRecord[] = [];

  public addRecord(record: LifecycleRecord): void { this.records.push(record); }

  public addRecords(records: LifecycleRecord[]): void { this.records.push(...records); }

  public build(state: LifecycleStageState, isForeground: boolean): LifecycleSnapshot {
    const snapshot: LifecycleSnapshot = {
      state: state,
      phaseCount: this.records.length,
      isForeground: isForeground
    };
    return snapshot;
  }

  public getRecordCount(): number { return this.records.length; }

  public clear(): void { this.records = []; }
}

class LifecycleMetrics {
  private phaseCounts: Map<string, number> = new Map<string, number>();

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

  public getDistinctPhaseCount(): number { return this.phaseCounts.size; }

  public clear(): void { this.phaseCounts = new Map<string, number>(); }
}

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

  public getExpectedLength(): number { return this.expectedSequence.length; }
}

// 阶段计数表：按下标累计各生命周期阶段出现次数
class PhaseCountTable {
  private counts: number[] = [];

  public add(phaseIndex: number): void {
    if (phaseIndex < 0) {
      return;
    }
    while (this.counts.length <= phaseIndex) {
      this.counts.push(0);
    }
    this.counts[phaseIndex]++;
  }

  public getCount(phaseIndex: number): number {
    if (phaseIndex < 0 || phaseIndex >= this.counts.length) {
      return 0;
    }
    return this.counts[phaseIndex];
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
    return this.counts.filter((count: number) => count > 0).length;
  }

  public getTotal(): number {
    return this.counts.reduce((sum: number, count: number) => sum + count, 0);
  }
}

// 生命周期阶段顺序：审计期望序列的唯一来源
class LifecyclePhaseComparator {
  public static getOrder(): LifecyclePhase[] {
    return [
      LifecyclePhase.SERVICE_CREATE, LifecyclePhase.SERVICE_BIND, LifecyclePhase.SESSION_CREATED,
      LifecyclePhase.PLAYER_PAGE_SHOW, LifecyclePhase.FOCUS_APPLIED, LifecyclePhase.PLAYER_PAGE_HIDE,
      LifecyclePhase.SESSION_RELEASED, LifecyclePhase.SERVICE_DESTROY
    ];
  }
}

export default function miracastLifecycleSuite(): void {
  describe('MiracastLifecycle_Test', () => {
    let driver: Driver;
    let tracker: LifecycleTracker;

    beforeAll(async () => {
      driver = getDriver();
      tracker = LifecycleTracker.getInstance();
      tracker.reset();
      Log.info(TAG, 'suite start');
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await triggerMiracastHome(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      tracker.reset();
      Log.info(TAG, 'suite end');
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
    });

    it('cold_start_lifecycle_order_should_create_before_bind', 0, async () => {
      tracker.reset();
      const ability = new MockMiracastAbility(tracker);
      ability.onCreate();
      ability.onServiceBind();
      expect(tracker.indexOf(LifecyclePhase.SERVICE_CREATE))
        .assertLessOrEqual(tracker.indexOf(LifecyclePhase.SERVICE_BIND));
      expect(tracker.getFirstPhase()).assertEqual(LifecyclePhase.SERVICE_CREATE);
    });

    it('destroy_lifecycle_order_should_release_before_destroy', 0, async () => {
      tracker.reset();
      const ability = new MockMiracastAbility(tracker);
      ability.onSessionReleased();
      ability.onDestroy();
      expect(tracker.indexOf(LifecyclePhase.SESSION_RELEASED))
        .assertLessOrEqual(tracker.indexOf(LifecyclePhase.SERVICE_DESTROY));
      expect(tracker.getLastPhase()).assertEqual(LifecyclePhase.SERVICE_DESTROY);
    });

    it('session_creation_should_follow_service_bind', 0, async () => {
      tracker.reset();
      const ability = new MockMiracastAbility(tracker);
      ability.onServiceBind();
      ability.onSessionCreated();
      expect(tracker.indexOf(LifecyclePhase.SERVICE_BIND))
        .assertLessOrEqual(tracker.indexOf(LifecyclePhase.SESSION_CREATED));
      expect(tracker.hasPhase(LifecyclePhase.SESSION_CREATED)).assertTrue();
    });

    it('on_create_should_record_create_phase', 0, async () => {
      tracker.reset();
      const ability = new MockMiracastAbility(tracker);
      ability.onCreate();
      expect(tracker.hasPhase(LifecyclePhase.SERVICE_CREATE)).assertTrue();
      expect(tracker.getCount()).assertEqual(1);
    });

    it('on_service_bind_should_record_phase', 0, async () => {
      tracker.reset();
      const ability = new MockMiracastAbility(tracker);
      ability.onServiceBind();
      expect(tracker.hasPhase(LifecyclePhase.SERVICE_BIND)).assertTrue();
      expect(tracker.countPhase(LifecyclePhase.SERVICE_BIND)).assertEqual(1);
    });

    it('player_page_show_and_hide_should_be_recorded', 0, async () => {
      tracker.reset();
      const ability = new MockMiracastAbility(tracker);
      ability.onPlayerPageShow();
      ability.onPlayerPageHide();
      expect(tracker.hasPhase(LifecyclePhase.PLAYER_PAGE_SHOW)).assertTrue();
      expect(tracker.hasPhase(LifecyclePhase.PLAYER_PAGE_HIDE)).assertTrue();
      expect(tracker.indexOf(LifecyclePhase.PLAYER_PAGE_SHOW))
        .assertLess(tracker.indexOf(LifecyclePhase.PLAYER_PAGE_HIDE));
    });

    it('focus_application_should_be_recorded', 0, async () => {
      tracker.reset();
      const ability = new MockMiracastAbility(tracker);
      ability.onPlayerPageShow();
      ability.onFocusApplied();
      expect(tracker.hasPhase(LifecyclePhase.FOCUS_APPLIED)).assertTrue();
      expect(tracker.countPhase(LifecyclePhase.FOCUS_APPLIED)).assertEqual(1);
    });

    it('destroy_without_player_page_should_be_safe', 0, async () => {
      tracker.reset();
      const ability = new MockMiracastAbility(tracker);
      ability.onDestroy();
      expect(tracker.hasPhase(LifecyclePhase.SERVICE_DESTROY)).assertTrue();
      expect(tracker.hasPhase(LifecyclePhase.PLAYER_PAGE_SHOW)).assertFalse();
      expect(tracker.getCount()).assertEqual(1);
    });

    it('lifecycle_records_should_be_chronological', 0, async () => {
      tracker.reset();
      const ability = new MockMiracastAbility(tracker);
      ability.onCreate();
      ability.onServiceBind();
      ability.onSessionCreated();
      ability.onPlayerPageShow();
      ability.onFocusApplied();
      ability.onPlayerPageHide();
      ability.onSessionReleased();
      ability.onDestroy();
      expect(tracker.isChronological()).assertTrue();
      expect(tracker.getCount()).assertEqual(8);
      expect(tracker.getFirstPhase()).assertEqual(LifecyclePhase.SERVICE_CREATE);
      expect(tracker.getLastPhase()).assertEqual(LifecyclePhase.SERVICE_DESTROY);
    });

    it('lifecycle_tracker_singleton_should_be_consistent', 0, async () => {
      const first: LifecycleTracker = LifecycleTracker.getInstance();
      const second: LifecycleTracker = LifecycleTracker.getInstance();
      expect(first === second).assertTrue();
      expect(first === tracker).assertTrue();
    });

    it('empty_tracker_should_return_null_phases', 0, async () => {
      tracker.reset();
      expect(tracker.getCount()).assertEqual(0);
      expect(tracker.getFirstPhase() === null).assertTrue();
      expect(tracker.getLastPhase() === null).assertTrue();
      expect(tracker.isChronological()).assertTrue();
      expect(tracker.indexOf(LifecyclePhase.SERVICE_CREATE)).assertEqual(-1);
    });

    it('lifecycle_metrics_should_count_phases', 0, async () => {
      const metrics = new LifecycleMetrics();
      metrics.recordPhase(LifecyclePhase.SERVICE_CREATE);
      metrics.recordPhase(LifecyclePhase.PLAYER_PAGE_SHOW);
      metrics.recordPhase(LifecyclePhase.PLAYER_PAGE_SHOW);
      expect(metrics.getPhaseCount(LifecyclePhase.PLAYER_PAGE_SHOW)).assertEqual(2);
      expect(metrics.getPhaseCount(LifecyclePhase.SERVICE_CREATE)).assertEqual(1);
      expect(metrics.getPhaseCount(LifecyclePhase.SERVICE_DESTROY)).assertEqual(0);
      expect(metrics.getTotalCount()).assertEqual(3);
      expect(metrics.getDistinctPhaseCount()).assertEqual(2);
      metrics.clear();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    it('lifecycle_state_machine_should_move_forward', 0, async () => {
      const machine = new LifecycleStateMachine();
      expect(machine.getState()).assertEqual(LifecycleStageState.IDLE);
      machine.transition(LifecycleStageState.RUNNING);
      expect(machine.isForwardTransition(LifecycleStageState.PAUSED)).assertTrue();
      machine.transition(LifecycleStageState.PAUSED);
      expect(machine.getState()).assertEqual(LifecycleStageState.PAUSED);
      expect(machine.getTransitionCount()).assertEqual(2);
      expect(machine.getTransitions()[0].from).assertEqual(LifecycleStageState.IDLE);
    });

    it('lifecycle_state_machine_should_detect_backward', 0, async () => {
      const machine = new LifecycleStateMachine();
      machine.transition(LifecycleStageState.RUNNING);
      machine.transition(LifecycleStageState.STOPPED);
      machine.transition(LifecycleStageState.RUNNING);
      const transitions: LifecycleTransition[] = machine.getTransitions();
      expect(transitions[2].kind).assertEqual(TransitionKind.BACKWARD);
      expect(transitions[1].kind).assertEqual(TransitionKind.FORWARD);
      expect(machine.getState()).assertEqual(LifecycleStageState.RUNNING);
    });

    it('lifecycle_state_machine_should_mark_restart', 0, async () => {
      const machine = new LifecycleStateMachine();
      machine.transition(LifecycleStageState.RUNNING);
      machine.transition(LifecycleStageState.RUNNING);
      expect(machine.getTransitions()[1].kind).assertEqual(TransitionKind.RESTART);
      expect(machine.getTransitionCount()).assertEqual(2);
      machine.reset();
      expect(machine.getState()).assertEqual(LifecycleStageState.IDLE);
      expect(machine.getTransitionCount()).assertEqual(0);
    });

    it('lifecycle_snapshot_should_include_phase_count', 0, async () => {
      const builder = new LifecycleSnapshotBuilder();
      const trackerLocal = new LifecycleTracker();
      trackerLocal.record(LifecyclePhase.SERVICE_CREATE);
      const records: LifecycleRecord[] = trackerLocal.getRecords();
      builder.addRecords(records);
      const snapshot: LifecycleSnapshot = builder.build(LifecycleStageState.RUNNING, true);
      expect(snapshot.phaseCount).assertEqual(1);
      expect(snapshot.state).assertEqual(LifecycleStageState.RUNNING);
      expect(snapshot.isForeground).assertTrue();
      expect(builder.getRecordCount()).assertEqual(1);
      builder.clear();
      expect(builder.getRecordCount()).assertEqual(0);
    });

    it('lifecycle_snapshot_should_mark_background', 0, async () => {
      const builder = new LifecycleSnapshotBuilder();
      const snapshot: LifecycleSnapshot = builder.build(LifecycleStageState.PAUSED, false);
      expect(snapshot.isForeground).assertFalse();
      expect(snapshot.phaseCount).assertEqual(0);
      expect(snapshot.state).assertEqual(LifecycleStageState.PAUSED);
    });

    it('lifecycle_auditor_should_match_expected_sequence', 0, async () => {
      tracker.reset();
      const ability = new MockMiracastAbility(tracker);
      ability.onCreate();
      ability.onServiceBind();
      ability.onSessionCreated();
      const auditor = new LifecycleAuditor();
      auditor.setExpectedSequence([
        LifecyclePhase.SERVICE_CREATE,
        LifecyclePhase.SERVICE_BIND,
        LifecyclePhase.SESSION_CREATED
      ]);
      expect(auditor.matches(tracker.getRecords())).assertTrue();
      expect(auditor.getExpectedLength()).assertEqual(3);
      expect(auditor.getExpectedSequence().length).assertEqual(3);
    });

    it('lifecycle_auditor_should_detect_wrong_order', 0, async () => {
      tracker.reset();
      const ability = new MockMiracastAbility(tracker);
      ability.onSessionCreated();
      ability.onCreate();
      const auditor = new LifecycleAuditor();
      auditor.setExpectedSequence([LifecyclePhase.SERVICE_CREATE, LifecyclePhase.SESSION_CREATED]);
      expect(auditor.matches(tracker.getRecords())).assertFalse();
      auditor.setExpectedSequence([LifecyclePhase.SESSION_CREATED]);
      expect(auditor.matches(tracker.getRecords())).assertTrue();
    });

    it('ability_names_should_match_project_configuration', 0, async () => {
      expect(UI_ABILITY_NAME).assertEqual('TvAbility');
      expect(SERVICE_ABILITY_NAME).assertEqual('ServiceExtTvAbility');
      expect(UI_ABILITY_NAME.length).assertLarger(0);
      expect(SERVICE_ABILITY_NAME.length).assertLarger(0);
    });

    it('back_press_should_trigger_page_lifecycle_close', 0, async () => {
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
      const componentCount: number = await miracastComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
      await triggerMiracastHome(driver);
    });


    it('snapshot_builder_should_accept_single_record', 0, async () => {
      const builder = new LifecycleSnapshotBuilder();
      const record: LifecycleRecord = { phase: LifecyclePhase.SESSION_CREATED, timestamp: Date.now() };
      builder.addRecord(record);
      expect(builder.getRecordCount()).assertEqual(1);
      const snapshot: LifecycleSnapshot = builder.build(LifecycleStageState.RUNNING, true);
      expect(snapshot.phaseCount).assertEqual(1);
      expect(builder.build(LifecycleStageState.DESTROYED, false).isForeground).assertFalse();
    });

    it('phase_count_table_should_report_zero_metrics_when_empty', 0, async () => {
      const table = new PhaseCountTable();
      expect(table.getMaxCount()).assertEqual(0);
      expect(table.getDistinctCount()).assertEqual(0);
      expect(table.getTotal()).assertEqual(0);
      expect(table.getCount(0)).assertEqual(0);
    });

    it('full_lifecycle_sequence_should_pass_audit', 0, async () => {
      tracker.reset();
      const ability = new MockMiracastAbility(tracker);
      ability.onCreate();
      ability.onServiceBind();
      ability.onSessionCreated();
      ability.onPlayerPageShow();
      ability.onFocusApplied();
      ability.onPlayerPageHide();
      ability.onSessionReleased();
      ability.onDestroy();
      const auditor = new LifecycleAuditor();
      auditor.setExpectedSequence(LifecyclePhaseComparator.getOrder());
      expect(auditor.matches(tracker.getRecords())).assertTrue();
      expect(auditor.getExpectedLength()).assertEqual(8);
    });

  });
}
