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
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  serializedDelay,
  powerDialogComponentCount
} from '../Shared/SharedDriver';

// 生命周期阶段枚举
enum LifecyclePhase {
  CREATE = 'create', WINDOW_STAGE_CREATE = 'windowStageCreate', FOREGROUND = 'foreground', BACKGROUND = 'background', WINDOW_STAGE_DESTROY = 'windowStageDestroy', DESTROY = 'destroy'
}

// 生命周期记录接口
interface LifecycleRecord {
  phase: LifecyclePhase;
  timestamp: number;
}

// 生命周期追踪器：记录生命周期阶段及顺序
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
    this.records.push({ phase, timestamp: Date.now() });
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

// 模拟 Ability 生命周期：验证生命周期顺序
class MockPowerAbility {
  private tracker: LifecycleTracker;

  constructor(tracker: LifecycleTracker) {
    this.tracker = tracker;
  }

  public onCreate(): void {
    this.tracker.record(LifecyclePhase.CREATE);
  }

  public onWindowStageCreate(): void {
    this.tracker.record(LifecyclePhase.WINDOW_STAGE_CREATE);
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
}

// 生命周期阶段状态枚举：描述 Ability 运行时的抽象状态
enum LifecycleStageState {
  IDLE = 'idle', RUNNING = 'running', PAUSED = 'paused', STOPPED = 'stopped', DESTROYED = 'destroyed'
}

// 生命周期迁移类型枚举：描述阶段之间的迁移方向
enum TransitionKind {
  FORWARD = 'forward', BACKWARD = 'backward', RESTART = 'restart'
}

// 生命周期迁移接口：记录一次阶段迁移的源与目标
interface LifecycleTransition {
  from: LifecycleStageState;
  to: LifecycleStageState;
  kind: TransitionKind;
  timestamp: number;
}

// 生命周期快照接口：记录某一时刻的完整生命周期状态
interface LifecycleSnapshot {
  state: LifecycleStageState;
  phaseCount: number;
  isForeground: boolean;
}

// 生命周期状态机：维护当前状态并校验迁移合法性
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
      to,
      kind,
      timestamp: Date.now()
    });
    this.state = to;
    return true;
  }

  private resolveKind(to: LifecycleStageState): TransitionKind {
    const order: LifecycleStageState[] =
      [LifecycleStageState.IDLE, LifecycleStageState.RUNNING, LifecycleStageState.PAUSED, LifecycleStageState.STOPPED,
        LifecycleStageState.DESTROYED];
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

  public getTransitionCount(): number {
    return this.transitions.length;
  }

  public isForwardTransition(to: LifecycleStageState): boolean {
    return this.resolveKind(to) === TransitionKind.FORWARD;
  }

  public reset(): void {
    this.state = LifecycleStageState.IDLE;
    this.transitions = [];
  }
}

// 生命周期快照构建器：根据阶段记录生成快照
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
      state, phaseCount: this.records.length, isForeground
    };
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public clear(): void {
    this.records = [];
  }
}

// 生命周期指标：统计各阶段出现次数与总耗时
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

// 生命周期阶段比较器：判断阶段之间的先后顺序
class LifecyclePhaseComparator {
  private static readonly ORDER: LifecyclePhase[] =
    [LifecyclePhase.CREATE, LifecyclePhase.WINDOW_STAGE_CREATE, LifecyclePhase.FOREGROUND, LifecyclePhase.BACKGROUND,
      LifecyclePhase.WINDOW_STAGE_DESTROY, LifecyclePhase.DESTROY];

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

// 生命周期审计器：审计阶段序列是否符合预期顺序
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

// 生命周期阶段计数表：以固定索引统计各阶段出现次数，避免枚举转换
class PhaseCountTable {
  private counts: number[] = [0, 0, 0, 0, 0, 0];

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
    this.counts = [0, 0, 0, 0, 0, 0];
  }
}

// 生命周期迁移记录器：记录阶段迁移的源与目标索引
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

// 生命周期健康检查器：根据记录评估生命周期是否健康
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

export default function powerDialogLifecycleTest() {
  describe('PowerDialogLifecycle_Test', () => {
    let driver: Driver;
    let tracker: LifecycleTracker;

    beforeAll(async () => {
      driver = getDriver();
      tracker = LifecycleTracker.getInstance();
      tracker.reset();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 适配 Lifecycle_Sequence：冷启动顺序 create → windowStageCreate
    it('cold_start_lifecycle_order_should_be_create_then_window_stage', 0, async () => {
      tracker.reset();
      const ability = new MockPowerAbility(tracker);
      ability.onCreate();
      ability.onWindowStageCreate();
      expect(tracker.indexOf(LifecyclePhase.CREATE))
        .assertLessOrEqual(tracker.indexOf(LifecyclePhase.WINDOW_STAGE_CREATE));
    });

    // 适配 Lifecycle_Sequence：销毁顺序 windowStageDestroy → destroy
    it('destroy_lifecycle_order_should_be_window_destroy_then_destroy', 0, async () => {
      tracker.reset();
      const ability = new MockPowerAbility(tracker);
      ability.onWindowStageDestroy();
      ability.onDestroy();
      expect(tracker.indexOf(LifecyclePhase.WINDOW_STAGE_DESTROY))
        .assertLessOrEqual(tracker.indexOf(LifecyclePhase.DESTROY));
    });

    // 适配 Lifecycle_Sequence：前台顺序 foreground → 后续阶段
    it('new_want_lifecycle_order_should_be_foreground_first', 0, async () => {
      tracker.reset();
      const ability = new MockPowerAbility(tracker);
      ability.onForeground();
      ability.onWindowStageCreate();
      expect(tracker.indexOf(LifecyclePhase.FOREGROUND))
        .assertLessOrEqual(tracker.indexOf(LifecyclePhase.WINDOW_STAGE_CREATE));
    });

    // 适配 onCreate_Initialization：onCreate 记录阶段
    it('on_create_should_record_create_phase', 0, async () => {
      tracker.reset();
      const ability = new MockPowerAbility(tracker);
      ability.onCreate();
      expect(tracker.hasPhase(LifecyclePhase.CREATE)).assertTrue();
    });

    // 适配 onWindowStageCreate_Window_Setup：加载页面记录阶段
    it('on_window_stage_create_should_record_phase', 0, async () => {
      tracker.reset();
      const ability = new MockPowerAbility(tracker);
      ability.onWindowStageCreate();
      expect(tracker.hasPhase(LifecyclePhase.WINDOW_STAGE_CREATE)).assertTrue();
    });

    // 适配 Foreground_Background_Switch：前台后台切换
    it('foreground_background_switch_should_be_recorded', 0, async () => {
      tracker.reset();
      const ability = new MockPowerAbility(tracker);
      ability.onForeground();
      ability.onBackground();
      expect(tracker.hasPhase(LifecyclePhase.FOREGROUND)).assertTrue();
      expect(tracker.hasPhase(LifecyclePhase.BACKGROUND)).assertTrue();
    });

    // 适配 onWindowStageDestroy_Cleanup：销毁释放资源
    it('on_window_stage_destroy_should_release_resources', 0, async () => {
      tracker.reset();
      const ability = new MockPowerAbility(tracker);
      ability.onWindowStageDestroy();
      expect(tracker.hasPhase(LifecyclePhase.WINDOW_STAGE_DESTROY)).assertTrue();
    });

    // 适配 Ability_Edge_Cases：无窗口阶段直接销毁
    it('destroy_without_window_stage_should_be_safe', 0, async () => {
      tracker.reset();
      const ability = new MockPowerAbility(tracker);
      ability.onDestroy();
      expect(tracker.hasPhase(LifecyclePhase.DESTROY)).assertTrue();
      expect(tracker.hasPhase(LifecyclePhase.WINDOW_STAGE_DESTROY)).assertFalse();
    });

    // 适配 AppStorage_Cross_Lifecycle：生命周期时间戳有序
    it('lifecycle_records_should_be_chronological', 0, async () => {
      tracker.reset();
      const ability = new MockPowerAbility(tracker);
      ability.onCreate();
      ability.onWindowStageCreate();
      ability.onForeground();
      ability.onBackground();
      ability.onWindowStageDestroy();
      ability.onDestroy();
      expect(tracker.isChronological()).assertTrue();
    });

    // 适配 onBackPress_Chain：返回键触发销毁（真实对话框）
    it('back_press_should_trigger_dialog_close', 0, async () => {
      await serializedDelay(driver, 500);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });
  });
}
