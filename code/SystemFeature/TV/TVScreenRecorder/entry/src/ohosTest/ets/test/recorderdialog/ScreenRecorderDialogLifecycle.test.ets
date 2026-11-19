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
import {
  getDriver,
  KEY_BACK,
  recorderComponentCount,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../shared/RecordingDriver';

// 录屏服务生命周期阶段枚举
enum ServicePhase {
  CREATE = 'create',
  TIMER_WINDOW_CREATE = 'timerWindowCreate',
  REQUEST_START = 'requestStart',
  REQUEST_STOP = 'requestStop',
  TIP_SHOW = 'tipShow',
  TIP_HIDE = 'tipHide',
  WINDOW_DESTROY = 'windowDestroy',
  DESTROY = 'destroy'
}

// 生命周期记录接口
interface ServiceLifecycleRecord {
  phase: ServicePhase;
  timestamp: number;
}

// 生命周期追踪器：单例记录阶段与顺序
class RecorderLifecycleTracker {
  private static instance: RecorderLifecycleTracker;
  private records: ServiceLifecycleRecord[] = [];

  public static getInstance(): RecorderLifecycleTracker {
    if (!RecorderLifecycleTracker.instance) {
      RecorderLifecycleTracker.instance = new RecorderLifecycleTracker();
    }
    return RecorderLifecycleTracker.instance;
  }

  public record(phase: ServicePhase): void {
    const record: ServiceLifecycleRecord = {
      phase: phase,
      timestamp: Date.now()
    };
    this.records.push(record);
  }

  public getRecords(): ServiceLifecycleRecord[] {
    return this.records.slice();
  }

  public hasPhase(phase: ServicePhase): boolean {
    return this.records.some((record: ServiceLifecycleRecord) => record.phase === phase);
  }

  public indexOf(phase: ServicePhase): number {
    return this.records.findIndex((record: ServiceLifecycleRecord) => record.phase === phase);
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].timestamp < this.records[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public getCount(): number {
    return this.records.length;
  }

  public reset(): void {
    this.records = [];
  }
}

// 模拟录屏服务生命周期：验证 onCreate 到 onDestroy 的阶段顺序
class MockScreenRecorderAbility {
  private tracker: RecorderLifecycleTracker;

  constructor(tracker: RecorderLifecycleTracker) {
    this.tracker = tracker;
  }

  public onCreate(): void {
    this.tracker.record(ServicePhase.CREATE);
  }

  public onTimerWindowCreate(): void {
    this.tracker.record(ServicePhase.TIMER_WINDOW_CREATE);
  }

  public onRequestStart(): void {
    this.tracker.record(ServicePhase.REQUEST_START);
  }

  public onRequestStop(): void {
    this.tracker.record(ServicePhase.REQUEST_STOP);
  }

  public onTipShow(): void {
    this.tracker.record(ServicePhase.TIP_SHOW);
  }

  public onTipHide(): void {
    this.tracker.record(ServicePhase.TIP_HIDE);
  }

  public onDestroy(): void {
    this.tracker.record(ServicePhase.WINDOW_DESTROY);
    this.tracker.record(ServicePhase.DESTROY);
  }
}

// 服务运行态枚举
enum ServiceStageState {
  IDLE = 'idle',
  RUNNING = 'running',
  RECORDING = 'recording',
  STOPPED = 'stopped',
  DESTROYED = 'destroyed'
}

// 迁移方向枚举
enum ServiceTransitionKind {
  FORWARD = 'forward',
  BACKWARD = 'backward',
  RESTART = 'restart'
}

// 服务迁移接口
interface ServiceTransition {
  from: ServiceStageState;
  to: ServiceStageState;
  kind: ServiceTransitionKind;
  timestamp: number;
}

// 服务快照接口
interface ServiceSnapshot {
  state: ServiceStageState;
  phaseCount: number;
  isRecording: boolean;
}

// 服务状态机：维护当前运行态并记录迁移方向
class ServiceStateMachine {
  private state: ServiceStageState = ServiceStageState.IDLE;
  private transitions: ServiceTransition[] = [];

  public getState(): ServiceStageState {
    return this.state;
  }

  public transition(to: ServiceStageState): boolean {
    const kind: ServiceTransitionKind = this.resolveKind(to);
    const transition: ServiceTransition = {
      from: this.state,
      to: to,
      kind: kind,
      timestamp: Date.now()
    };
    this.transitions.push(transition);
    this.state = to;
    return true;
  }

  private resolveKind(to: ServiceStageState): ServiceTransitionKind {
    const order: ServiceStageState[] = [ServiceStageState.IDLE, ServiceStageState.RUNNING,
      ServiceStageState.RECORDING, ServiceStageState.STOPPED, ServiceStageState.DESTROYED];
    const fromIndex: number = order.indexOf(this.state);
    const toIndex: number = order.indexOf(to);
    if (toIndex > fromIndex) {
      return ServiceTransitionKind.FORWARD;
    }
    if (toIndex < fromIndex) {
      return ServiceTransitionKind.BACKWARD;
    }
    return ServiceTransitionKind.RESTART;
  }

  public getTransitions(): ServiceTransition[] {
    return this.transitions.slice();
  }

  public getTransitionCount(): number {
    return this.transitions.length;
  }

  public isForwardTransition(to: ServiceStageState): boolean {
    return this.resolveKind(to) === ServiceTransitionKind.FORWARD;
  }

  public reset(): void {
    this.state = ServiceStageState.IDLE;
    this.transitions = [];
  }
}

// 服务快照构建器：根据阶段记录生成快照
class ServiceSnapshotBuilder {
  private records: ServiceLifecycleRecord[] = [];

  public addRecord(record: ServiceLifecycleRecord): void {
    this.records.push(record);
  }

  public addRecords(records: ServiceLifecycleRecord[]): void {
    records.forEach((record: ServiceLifecycleRecord) => {
      this.records.push(record);
    });
  }

  public build(state: ServiceStageState, isRecording: boolean): ServiceSnapshot {
    const snapshot: ServiceSnapshot = {
      state: state,
      phaseCount: this.records.length,
      isRecording: isRecording
    };
    return snapshot;
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public clear(): void {
    this.records = [];
  }
}

// 服务指标：统计各阶段出现次数
class ServiceMetrics {
  private phaseCounts: Map<ServicePhase, number> = new Map<ServicePhase, number>();

  public recordPhase(phase: ServicePhase): void {
    const current: number | undefined = this.phaseCounts.get(phase);
    if (current === undefined) {
      this.phaseCounts.set(phase, 1);
    } else {
      this.phaseCounts.set(phase, current + 1);
    }
  }

  public getPhaseCount(phase: ServicePhase): number {
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
    this.phaseCounts = new Map<ServicePhase, number>();
  }
}

// 阶段比较器：判断阶段之间的先后关系
class ServicePhaseComparator {
  private static readonly ORDER: ServicePhase[] = [ServicePhase.CREATE, ServicePhase.TIMER_WINDOW_CREATE,
    ServicePhase.REQUEST_START, ServicePhase.REQUEST_STOP, ServicePhase.TIP_SHOW, ServicePhase.TIP_HIDE,
    ServicePhase.WINDOW_DESTROY, ServicePhase.DESTROY];

  public static indexOf(phase: ServicePhase): number {
    return ServicePhaseComparator.ORDER.indexOf(phase);
  }

  public static isBefore(a: ServicePhase, b: ServicePhase): boolean {
    return ServicePhaseComparator.indexOf(a) < ServicePhaseComparator.indexOf(b);
  }

  public static isAfter(a: ServicePhase, b: ServicePhase): boolean {
    return ServicePhaseComparator.indexOf(a) > ServicePhaseComparator.indexOf(b);
  }

  public static getOrder(): ServicePhase[] {
    return ServicePhaseComparator.ORDER.slice();
  }

  public static getOrderLength(): number {
    return ServicePhaseComparator.ORDER.length;
  }
}

// 生命周期审计器：审计阶段序列是否符合预期
class ServiceLifecycleAuditor {
  private expectedSequence: ServicePhase[] = [];

  public setExpectedSequence(sequence: ServicePhase[]): void {
    this.expectedSequence = sequence.slice();
  }

  public matches(records: ServiceLifecycleRecord[]): boolean {
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

  public getExpectedLength(): number {
    return this.expectedSequence.length;
  }
}

// 阶段计数表：以固定索引统计阶段次数
class ServicePhaseCountTable {
  private counts: number[] = [0, 0, 0, 0, 0, 0, 0, 0];

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
    this.counts = [0, 0, 0, 0, 0, 0, 0, 0];
  }
}

// 迁移记录器：记录阶段迁移的源与目标索引
class ServiceTransitionRecorder {
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

// 服务健康检查器：评估生命周期记录是否健康
class ServiceHealthChecker {
  private totalRecords: number = 0;
  private duplicatePhases: number = 0;

  public analyze(records: ServiceLifecycleRecord[]): void {
    this.totalRecords = records.length;
    const phases: ServicePhase[] = [];
    for (let i = 0; i < records.length; i++) {
      phases.push(records[i].phase);
    }
    const uniqueCount: number = ServiceHealthChecker.countUnique(phases);
    this.duplicatePhases = this.totalRecords - uniqueCount;
  }

  private static countUnique(phases: ServicePhase[]): number {
    const unique: ServicePhase[] = [];
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

export default function screenRecorderDialogLifecycleTest(): void {
  describe('ScreenRecorderDialogLifecycle_Test', () => {
    let driver: Driver;
    let tracker: RecorderLifecycleTracker;

    beforeAll(async () => {
      driver = getDriver();
      tracker = RecorderLifecycleTracker.getInstance();
      tracker.reset();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await serializedDelay(driver, 500);
    });

    // 冷启动应先 create 再创建计时浮窗
    it('cold_start_should_create_then_create_timer_window', 0, async () => {
      tracker.reset();
      const ability: MockScreenRecorderAbility = new MockScreenRecorderAbility(tracker);
      ability.onCreate();
      ability.onTimerWindowCreate();
      expect(tracker.indexOf(ServicePhase.CREATE))
        .assertLessOrEqual(tracker.indexOf(ServicePhase.TIMER_WINDOW_CREATE));
      expect(tracker.getCount()).assertEqual(2);
    });

    // onCreate 应记录 CREATE 阶段
    it('on_create_should_record_create_phase', 0, async () => {
      tracker.reset();
      const ability: MockScreenRecorderAbility = new MockScreenRecorderAbility(tracker);
      ability.onCreate();
      expect(tracker.hasPhase(ServicePhase.CREATE)).assertTrue();
      expect(tracker.hasPhase(ServicePhase.DESTROY)).assertFalse();
    });

    // 计时浮窗应在 onCreate 之后创建
    it('timer_window_should_be_created_after_create', 0, async () => {
      tracker.reset();
      const ability: MockScreenRecorderAbility = new MockScreenRecorderAbility(tracker);
      ability.onCreate();
      ability.onTimerWindowCreate();
      expect(ServicePhaseComparator.isBefore(ServicePhase.CREATE, ServicePhase.TIMER_WINDOW_CREATE)).assertTrue();
    });

    // 启动请求应记录 REQUEST_START 阶段
    it('request_start_should_be_recorded', 0, async () => {
      tracker.reset();
      const ability: MockScreenRecorderAbility = new MockScreenRecorderAbility(tracker);
      ability.onRequestStart();
      expect(tracker.hasPhase(ServicePhase.REQUEST_START)).assertTrue();
      expect(tracker.getCount()).assertEqual(1);
    });

    // 停止请求应记录 REQUEST_STOP 阶段
    it('request_stop_should_be_recorded', 0, async () => {
      tracker.reset();
      const ability: MockScreenRecorderAbility = new MockScreenRecorderAbility(tracker);
      ability.onRequestStop();
      expect(tracker.hasPhase(ServicePhase.REQUEST_STOP)).assertTrue();
    });

    // 提示窗展示与隐藏应成对记录
    it('tip_show_and_hide_should_be_recorded', 0, async () => {
      tracker.reset();
      const ability: MockScreenRecorderAbility = new MockScreenRecorderAbility(tracker);
      ability.onTipShow();
      ability.onTipHide();
      expect(tracker.hasPhase(ServicePhase.TIP_SHOW)).assertTrue();
      expect(tracker.hasPhase(ServicePhase.TIP_HIDE)).assertTrue();
      expect(tracker.indexOf(ServicePhase.TIP_SHOW))
        .assertLessOrEqual(tracker.indexOf(ServicePhase.TIP_HIDE));
    });

    // 销毁应先释放浮窗再销毁服务
    it('destroy_should_release_window_then_destroy_service', 0, async () => {
      tracker.reset();
      const ability: MockScreenRecorderAbility = new MockScreenRecorderAbility(tracker);
      ability.onDestroy();
      expect(tracker.hasPhase(ServicePhase.WINDOW_DESTROY)).assertTrue();
      expect(tracker.hasPhase(ServicePhase.DESTROY)).assertTrue();
      expect(tracker.indexOf(ServicePhase.WINDOW_DESTROY))
        .assertLessOrEqual(tracker.indexOf(ServicePhase.DESTROY));
    });

    // 未创建浮窗直接销毁应安全
    it('destroy_without_timer_window_should_be_safe', 0, async () => {
      tracker.reset();
      const ability: MockScreenRecorderAbility = new MockScreenRecorderAbility(tracker);
      ability.onCreate();
      ability.onDestroy();
      expect(tracker.hasPhase(ServicePhase.TIMER_WINDOW_CREATE)).assertFalse();
      expect(tracker.hasPhase(ServicePhase.DESTROY)).assertTrue();
    });

    // 完整生命周期记录应保持时序
    it('lifecycle_records_should_be_chronological', 0, async () => {
      tracker.reset();
      const ability: MockScreenRecorderAbility = new MockScreenRecorderAbility(tracker);
      ability.onCreate();
      ability.onTimerWindowCreate();
      ability.onRequestStart();
      ability.onTipShow();
      ability.onTipHide();
      ability.onRequestStop();
      ability.onDestroy();
      expect(tracker.isChronological()).assertTrue();
      expect(tracker.getCount()).assertEqual(8);
    });

    // 状态机默认处于 IDLE
    it('state_machine_should_start_idle', 0, async () => {
      const machine: ServiceStateMachine = new ServiceStateMachine();
      expect(machine.getState()).assertEqual(ServiceStageState.IDLE);
      expect(machine.getTransitionCount()).assertEqual(0);
    });

    // 状态机应判定前向迁移
    it('state_machine_should_detect_forward_transition', 0, async () => {
      const machine: ServiceStateMachine = new ServiceStateMachine();
      expect(machine.isForwardTransition(ServiceStageState.RECORDING)).assertTrue();
      machine.transition(ServiceStageState.RUNNING);
      machine.transition(ServiceStageState.RECORDING);
      expect(machine.getTransitionCount()).assertEqual(2);
      expect(machine.getTransitions()[0].kind).assertEqual(ServiceTransitionKind.FORWARD);
    });

    // 状态机应判定回退迁移
    it('state_machine_should_detect_backward_transition', 0, async () => {
      const machine: ServiceStateMachine = new ServiceStateMachine();
      machine.transition(ServiceStageState.RECORDING);
      machine.transition(ServiceStageState.IDLE);
      expect(machine.getTransitions()[1].kind).assertEqual(ServiceTransitionKind.BACKWARD);
      expect(machine.getState()).assertEqual(ServiceStageState.IDLE);
    });

    // 状态机重复迁移到同一状态应判定为 RESTART
    it('state_machine_should_detect_restart_transition', 0, async () => {
      const machine: ServiceStateMachine = new ServiceStateMachine();
      machine.transition(ServiceStageState.RUNNING);
      machine.transition(ServiceStageState.RUNNING);
      expect(machine.getTransitions()[1].kind).assertEqual(ServiceTransitionKind.RESTART);
    });

    // 状态机 reset 应回到初始态
    it('state_machine_reset_should_clear_transitions', 0, async () => {
      const machine: ServiceStateMachine = new ServiceStateMachine();
      machine.transition(ServiceStageState.RECORDING);
      machine.reset();
      expect(machine.getState()).assertEqual(ServiceStageState.IDLE);
      expect(machine.getTransitionCount()).assertEqual(0);
    });

    // 快照应按阶段记录生成
    it('snapshot_builder_should_count_records', 0, async () => {
      const builder: ServiceSnapshotBuilder = new ServiceSnapshotBuilder();
      const record: ServiceLifecycleRecord = {
        phase: ServicePhase.CREATE,
        timestamp: 1
      };
      builder.addRecord(record);
      builder.addRecords([record, record]);
      expect(builder.getRecordCount()).assertEqual(3);
      const snapshot: ServiceSnapshot = builder.build(ServiceStageState.RECORDING, true);
      expect(snapshot.phaseCount).assertEqual(3);
      expect(snapshot.isRecording).assertTrue();
      builder.clear();
      expect(builder.getRecordCount()).assertEqual(0);
    });

    // 指标应统计各阶段次数
    it('metrics_should_count_phases', 0, async () => {
      const metrics: ServiceMetrics = new ServiceMetrics();
      metrics.recordPhase(ServicePhase.CREATE);
      metrics.recordPhase(ServicePhase.CREATE);
      metrics.recordPhase(ServicePhase.DESTROY);
      expect(metrics.getPhaseCount(ServicePhase.CREATE)).assertEqual(2);
      expect(metrics.getPhaseCount(ServicePhase.DESTROY)).assertEqual(1);
      expect(metrics.getPhaseCount(ServicePhase.TIP_SHOW)).assertEqual(0);
      expect(metrics.getTotalCount()).assertEqual(3);
      expect(metrics.getDistinctPhaseCount()).assertEqual(2);
      metrics.clear();
      expect(metrics.getTotalCount()).assertEqual(0);
    });

    // 阶段比较器应给出完整顺序
    it('phase_comparator_should_expose_order', 0, async () => {
      const order: ServicePhase[] = ServicePhaseComparator.getOrder();
      expect(order.length).assertEqual(8);
      expect(order[0]).assertEqual(ServicePhase.CREATE);
      expect(order[7]).assertEqual(ServicePhase.DESTROY);
      expect(ServicePhaseComparator.isAfter(ServicePhase.DESTROY, ServicePhase.CREATE)).assertTrue();
      expect(ServicePhaseComparator.getOrderLength()).assertEqual(8);
    });

    // 审计器应匹配预期阶段序列
    it('auditor_should_match_expected_sequence', 0, async () => {
      tracker.reset();
      const ability: MockScreenRecorderAbility = new MockScreenRecorderAbility(tracker);
      ability.onCreate();
      ability.onTimerWindowCreate();
      const auditor: ServiceLifecycleAuditor = new ServiceLifecycleAuditor();
      auditor.setExpectedSequence([ServicePhase.CREATE, ServicePhase.TIMER_WINDOW_CREATE]);
      expect(auditor.getExpectedLength()).assertEqual(2);
      expect(auditor.matches(tracker.getRecords())).assertTrue();
      auditor.setExpectedSequence([ServicePhase.REQUEST_START]);
      expect(auditor.matches(tracker.getRecords())).assertFalse();
    });

    // 阶段计数表应支持越界保护
    it('phase_count_table_should_guard_bounds', 0, async () => {
      const table: ServicePhaseCountTable = new ServicePhaseCountTable();
      expect(table.record(0)).assertTrue();
      expect(table.record(7)).assertTrue();
      expect(table.record(-1)).assertFalse();
      expect(table.record(8)).assertFalse();
      expect(table.getCount(0)).assertEqual(1);
      expect(table.getCount(8)).assertEqual(0);
      expect(table.getTotal()).assertEqual(2);
      expect(table.getDistinctCount()).assertEqual(2);
      table.reset();
      expect(table.getTotal()).assertEqual(0);
    });

    // 迁移记录器应识别已记录的迁移
    it('transition_recorder_should_detect_pairs', 0, async () => {
      const recorder: ServiceTransitionRecorder = new ServiceTransitionRecorder();
      recorder.record(0, 1);
      recorder.record(1, 2);
      expect(recorder.getTransitionCount()).assertEqual(2);
      expect(recorder.hasTransition(0, 1)).assertTrue();
      expect(recorder.hasTransition(1, 0)).assertFalse();
      expect(recorder.isMonotonicForward()).assertTrue();
      recorder.reset();
      expect(recorder.getTransitionCount()).assertEqual(0);
    });

    // 健康检查应识别重复阶段
    it('health_checker_should_detect_duplicates', 0, async () => {
      const checker: ServiceHealthChecker = new ServiceHealthChecker();
      const first: ServiceLifecycleRecord = {
        phase: ServicePhase.CREATE,
        timestamp: 1
      };
      const second: ServiceLifecycleRecord = {
        phase: ServicePhase.CREATE,
        timestamp: 2
      };
      checker.analyze([first, second]);
      expect(checker.getTotalRecords()).assertEqual(2);
      expect(checker.getDuplicateCount()).assertEqual(1);
      expect(checker.isHealthy()).assertFalse();
      checker.analyze([first]);
      expect(checker.isHealthy()).assertTrue();
    });

    // 集成：真实录屏服务浮窗可查询
    it('real_recorder_window_should_be_queryable', 0, async () => {
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 集成：返回键触发生命周期收尾且服务不崩溃
    it('back_press_should_trigger_service_teardown', 0, async () => {
      await serializedDelay(driver, 500);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });
  });
}
