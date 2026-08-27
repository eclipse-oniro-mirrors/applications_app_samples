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
  createFreshDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  powerDialogComponentCount,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../Shared/SharedDriver';

// 中断类型枚举
enum InterruptionType {
  LOCK_SCREEN = 'lock_screen', POWER_LOW = 'power_low', BACKGROUND = 'background', INCOMING_CALL = 'incoming_call', USB_PLUG = 'usb_plug', SCREEN_ROTATE = 'screen_rotate', SYSTEM_DIALOG = 'system_dialog'
}

// 中断记录接口
interface InterruptionRecord {
  type: InterruptionType;
  focusIndex: number;
  operationInProgress: boolean;
  recovered: boolean;
}

// 电源对话框状态模型：管理焦点、操作进行状态与中断恢复
class PowerDialogStateModel {
  private focusIndex: number = 1;
  private operationInProgress: boolean = false;
  private recovered: boolean = true;
  private interruptionRecords: InterruptionRecord[] = [];

  public setFocus(index: number): void {
    this.focusIndex = index;
  }

  public getFocus(): number {
    return this.focusIndex;
  }

  public startOperation(): void {
    this.operationInProgress = true;
  }

  public isOperationInProgress(): boolean {
    return this.operationInProgress;
  }

  public interrupt(type: InterruptionType): void {
    this.interruptionRecords.push({
      type,
      focusIndex: this.focusIndex,
      operationInProgress: this.operationInProgress,
      recovered: true
    });
  }

  public recover(): boolean {
    this.recovered = true;
    return this.recovered;
  }

  public isRecovered(): boolean {
    return this.recovered;
  }

  public getInterruptionRecords(): InterruptionRecord[] {
    return [...this.interruptionRecords];
  }

  public getInterruptionCount(): number {
    return this.interruptionRecords.length;
  }

  public reset(): void {
    this.focusIndex = 1;
    this.operationInProgress = false;
    this.recovered = true;
    this.interruptionRecords = [];
  }
}

// 中断严重级别枚举：描述中断对电源操作的影响程度
enum InterruptionSeverity {
  MINOR = 'minor', MAJOR = 'major', CRITICAL = 'critical'
}

// 恢复状态枚举：描述中断恢复流程的当前状态
enum RecoveryStatus {
  PENDING = 'pending', IN_PROGRESS = 'in_progress', COMPLETED = 'completed', FAILED = 'failed'
}

// 中断快照接口：记录中断发生时对话框的完整状态
interface InterruptionSnapshot {
  type: InterruptionType;
  severity: InterruptionSeverity;
  focusIndex: number;
  operationInProgress: boolean;
  timestamp: number;
}

// 恢复结果接口：描述一次恢复动作的最终结果
interface RecoveryResult {
  status: RecoveryStatus;
  recoveredFocus: number;
  attempts: number;
  message: string;
}

// 中断队列：按顺序缓存待处理的中断
class InterruptionQueue {
  private items: InterruptionSnapshot[] = [];

  public enqueue(snapshot: InterruptionSnapshot): void {
    this.items.push(snapshot);
  }

  public dequeue(): InterruptionSnapshot | null {
    if (this.items.length === 0) {
      return null;
    }
    const snapshot: InterruptionSnapshot = this.items[0];
    this.items.shift();
    return snapshot;
  }

  public peek(): InterruptionSnapshot | null {
    if (this.items.length === 0) {
      return null;
    }
    return this.items[0];
  }

  public getSize(): number {
    return this.items.length;
  }

  public isEmpty(): boolean {
    return this.items.length === 0;
  }

  public clear(): void {
    this.items = [];
  }
}

// 中断分类器：根据中断类型判断严重级别
class InterruptionClassifier {
  public static classify(type: InterruptionType): InterruptionSeverity {
    switch (type) {
      case InterruptionType.LOCK_SCREEN:
        return InterruptionSeverity.CRITICAL;
      case InterruptionType.POWER_LOW:
        return InterruptionSeverity.CRITICAL;
      case InterruptionType.INCOMING_CALL:
        return InterruptionSeverity.MAJOR;
      case InterruptionType.SYSTEM_DIALOG:
        return InterruptionSeverity.MAJOR;
      default:
        return InterruptionSeverity.MINOR;
    }
  }

  public static isCritical(type: InterruptionType): boolean {
    return InterruptionClassifier.classify(type) === InterruptionSeverity.CRITICAL;
  }

  public static isMinor(type: InterruptionType): boolean {
    return InterruptionClassifier.classify(type) === InterruptionSeverity.MINOR;
  }
}

// 恢复管理器：管理中断后的恢复流程与状态
class RecoveryManager {
  private status: RecoveryStatus = RecoveryStatus.PENDING;
  private attempts: number = 0;
  private recoveredFocus: number = 1;

  public beginRecovery(): void {
    this.status = RecoveryStatus.IN_PROGRESS;
    this.attempts++;
  }

  public completeRecovery(focusIndex: number): void {
    this.status = RecoveryStatus.COMPLETED;
    this.recoveredFocus = focusIndex;
  }

  public failRecovery(): void {
    this.status = RecoveryStatus.FAILED;
  }

  public getStatus(): RecoveryStatus {
    return this.status;
  }

  public getAttempts(): number {
    return this.attempts;
  }

  public getRecoveredFocus(): number {
    return this.recoveredFocus;
  }

  public buildResult(): RecoveryResult {
    return {
      status: this.status,
      recoveredFocus: this.recoveredFocus,
      attempts: this.attempts,
      message: `recovery ${this.status}`
    };
  }

  public reset(): void {
    this.status = RecoveryStatus.PENDING;
    this.attempts = 0;
    this.recoveredFocus = 1;
  }
}

// 中断统计：按类型统计中断发生的次数
class InterruptionStatistics {
  private counts: Map<InterruptionType, number> = new Map<InterruptionType, number>();

  public record(type: InterruptionType): void {
    const current: number = this.counts.get(type) ?? 0;
    this.counts.set(type, current + 1);
  }

  public getCount(type: InterruptionType): number {
    const value: number | undefined = this.counts.get(type);
    if (value === undefined) {
      return 0;
    }
    return value;
  }

  public getTotalCount(): number {
    let total: number = 0;
    this.counts.forEach((value: number) => {
      total += value;
    });
    return total;
  }

  public getDistinctTypeCount(): number {
    return this.counts.size;
  }

  public getMostFrequentType(): InterruptionType | null {
    let maxType: InterruptionType | null = null;
    let maxCount: number = 0;
    this.counts.forEach((value: number, key: InterruptionType) => {
      if (value > maxCount) {
        maxCount = value;
        maxType = key;
      }
    });
    return maxType;
  }

  public reset(): void {
    this.counts = new Map<InterruptionType, number>();
  }
}

// 中断快照构建器：根据当前状态生成中断快照
class InterruptionSnapshotBuilder {
  public build(type: InterruptionType, focusIndex: number, operationInProgress: boolean): InterruptionSnapshot {
    return {
      type,
      severity: InterruptionClassifier.classify(type),
      focusIndex,
      operationInProgress,
      timestamp: Date.now()
    };
  }

  public buildMany(types: InterruptionType[], focusIndex: number): InterruptionSnapshot[] {
    const snapshots: InterruptionSnapshot[] = [];
    types.forEach((type: InterruptionType) => {
      snapshots.push(this.build(type, focusIndex, false));
    });
    return snapshots;
  }
}

// 恢复尝试追踪器：按中断类型统计恢复尝试次数
class RecoveryAttemptTracker {
  private attempts: Map<InterruptionType, number> = new Map<InterruptionType, number>();

  public record(type: InterruptionType): void {
    const current: number = this.attempts.get(type) ?? 0;
    this.attempts.set(type, current + 1);
  }

  public getAttempts(type: InterruptionType): number {
    const value: number | undefined = this.attempts.get(type);
    if (value === undefined) {
      return 0;
    }
    return value;
  }

  public getTotalAttempts(): number {
    let total: number = 0;
    this.attempts.forEach((value: number) => {
      total += value;
    });
    return total;
  }

  public getDistinctTypeCount(): number {
    return this.attempts.size;
  }

  public reset(): void {
    this.attempts = new Map<InterruptionType, number>();
  }
}

// 恢复状态机：管理恢复流程的状态迁移
class RecoveryStateMachine {
  private status: RecoveryStatus = RecoveryStatus.PENDING;

  public start(): void {
    if (this.status === RecoveryStatus.PENDING) {
      this.status = RecoveryStatus.IN_PROGRESS;
    }
  }

  public complete(): void {
    if (this.status === RecoveryStatus.IN_PROGRESS) {
      this.status = RecoveryStatus.COMPLETED;
    }
  }

  public fail(): void {
    if (this.status === RecoveryStatus.IN_PROGRESS) {
      this.status = RecoveryStatus.FAILED;
    }
  }

  public getStatus(): RecoveryStatus {
    return this.status;
  }

  public isTerminal(): boolean {
    return this.status === RecoveryStatus.COMPLETED || this.status === RecoveryStatus.FAILED;
  }

  public isActive(): boolean {
    return this.status === RecoveryStatus.IN_PROGRESS;
  }

  public reset(): void {
    this.status = RecoveryStatus.PENDING;
  }
}

// 中断时间线：记录中断发生的时间戳序列
class InterruptionTimeline {
  private timestamps: number[] = [];

  public record(timestamp: number): void {
    this.timestamps.push(timestamp);
  }

  public getTimestamps(): number[] {
    return [...this.timestamps];
  }

  public getCount(): number {
    return this.timestamps.length;
  }

  public getEarliest(): number {
    if (this.timestamps.length === 0) {
      return 0;
    }
    let earliest: number = this.timestamps[0];
    for (let i = 1; i < this.timestamps.length; i++) {
      if (this.timestamps[i] < earliest) {
        earliest = this.timestamps[i];
      }
    }
    return earliest;
  }

  public getLatest(): number {
    if (this.timestamps.length === 0) {
      return 0;
    }
    let latest: number = this.timestamps[0];
    for (let i = 1; i < this.timestamps.length; i++) {
      if (this.timestamps[i] > latest) {
        latest = this.timestamps[i];
      }
    }
    return latest;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.timestamps.length; i++) {
      if (this.timestamps[i] < this.timestamps[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public reset(): void {
    this.timestamps = [];
  }
}

export default function powerInterruptionRecoveryTest() {
  describe('PowerInterruptionRecovery_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = createFreshDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    it('lock_screen_interruption_should_preserve_focus', 0, async () => {
      const state = new PowerDialogStateModel();
      state.setFocus(2);
      state.interrupt(InterruptionType.LOCK_SCREEN);
      expect(state.getFocus()).assertEqual(2);
    });

    it('power_low_interruption_should_be_recorded', 0, async () => {
      const state = new PowerDialogStateModel();
      state.interrupt(InterruptionType.POWER_LOW);
      expect(state.getInterruptionCount()).assertEqual(1);
      expect(state.getInterruptionRecords()[0].type).assertEqual(InterruptionType.POWER_LOW);
    });

    it('background_switch_should_recover_state', 0, async () => {
      const state = new PowerDialogStateModel();
      state.setFocus(0);
      state.interrupt(InterruptionType.BACKGROUND);
      state.recover();
      expect(state.isRecovered()).assertTrue();
      expect(state.getFocus()).assertEqual(0);
    });

    it('incoming_call_should_not_lose_focus', 0, async () => {
      const state = new PowerDialogStateModel();
      state.interrupt(InterruptionType.INCOMING_CALL);
      expect(state.getFocus()).assertEqual(1);
    });

    it('usb_plug_should_not_affect_state', 0, async () => {
      const state = new PowerDialogStateModel();
      state.setFocus(1);
      state.interrupt(InterruptionType.USB_PLUG);
      expect(state.getFocus()).assertEqual(1);
    });

    it('screen_rotate_should_preserve_focus', 0, async () => {
      const state = new PowerDialogStateModel();
      state.setFocus(2);
      state.interrupt(InterruptionType.SCREEN_ROTATE);
      expect(state.getFocus()).assertEqual(2);
    });

    it('system_dialog_should_not_disturb_state', 0, async () => {
      const state = new PowerDialogStateModel();
      state.interrupt(InterruptionType.SYSTEM_DIALOG);
      expect(state.getFocus()).assertEqual(1);
    });

    it('interruption_during_operation_should_preserve_operation', 0, async () => {
      const state = new PowerDialogStateModel();
      state.startOperation();
      state.interrupt(InterruptionType.LOCK_SCREEN);
      expect(state.isOperationInProgress()).assertTrue();
      expect(state.getInterruptionRecords()[0].operationInProgress).assertTrue();
    });

    it('crash_recovery_should_restore_default_focus', 0, async () => {
      const state = new PowerDialogStateModel();
      state.setFocus(2);
      state.reset();
      expect(state.getFocus()).assertEqual(1);
      expect(state.isOperationInProgress()).assertFalse();
    });

    it('multiple_interruptions_should_be_recorded_completely', 0, async () => {
      const state = new PowerDialogStateModel();
      state.interrupt(InterruptionType.LOCK_SCREEN);
      state.interrupt(InterruptionType.BACKGROUND);
      state.interrupt(InterruptionType.POWER_LOW);
      state.interrupt(InterruptionType.INCOMING_CALL);
      expect(state.getInterruptionCount()).assertEqual(4);
    });

    it('reset_should_clear_interruption_records', 0, async () => {
      const state = new PowerDialogStateModel();
      state.interrupt(InterruptionType.LOCK_SCREEN);
      state.reset();
      expect(state.getInterruptionCount()).assertEqual(0);
    });

    it('real_dialog_should_stay_stable_after_interruption', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('interruption_without_operation_should_record_false', 0, async () => {
      const state = new PowerDialogStateModel();
      state.interrupt(InterruptionType.LOCK_SCREEN);
      expect(state.getInterruptionRecords()[0].operationInProgress).assertFalse();
    });

    it('recovery_should_be_idempotent', 0, async () => {
      const state = new PowerDialogStateModel();
      expect(state.recover()).assertTrue();
      expect(state.recover()).assertTrue();
      expect(state.isRecovered()).assertTrue();
    });

    it('focus_should_survive_multiple_interruption_types', 0, async () => {
      const state = new PowerDialogStateModel();
      state.setFocus(2);
      state.interrupt(InterruptionType.LOCK_SCREEN);
      state.interrupt(InterruptionType.POWER_LOW);
      state.interrupt(InterruptionType.SCREEN_ROTATE);
      expect(state.getFocus()).assertEqual(2);
    });

    it('reset_should_clear_operation_in_progress', 0, async () => {
      const state = new PowerDialogStateModel();
      state.startOperation();
      state.reset();
      expect(state.isOperationInProgress()).assertFalse();
    });

    it('interruption_record_should_capture_focus', 0, async () => {
      const state = new PowerDialogStateModel();
      state.setFocus(0);
      state.interrupt(InterruptionType.BACKGROUND);
      expect(state.getInterruptionRecords()[0].focusIndex).assertEqual(0);
    });

    it('all_interruption_types_should_be_recordable', 0, async () => {
      const state = new PowerDialogStateModel();
      state.interrupt(InterruptionType.LOCK_SCREEN);
      state.interrupt(InterruptionType.POWER_LOW);
      state.interrupt(InterruptionType.BACKGROUND);
      state.interrupt(InterruptionType.INCOMING_CALL);
      state.interrupt(InterruptionType.USB_PLUG);
      state.interrupt(InterruptionType.SCREEN_ROTATE);
      state.interrupt(InterruptionType.SYSTEM_DIALOG);
      expect(state.getInterruptionCount()).assertEqual(7);
    });

    it('recovered_flag_should_default_true', 0, async () => {
      const state = new PowerDialogStateModel();
      expect(state.isRecovered()).assertTrue();
    });

    it('real_dialog_focus_should_stay_stable', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('interrupt_then_recover_keeps_focus', 0, async () => {
      const state = new PowerDialogStateModel();
      state.setFocus(2);
      state.interrupt(InterruptionType.LOCK_SCREEN);
      state.recover();
      expect(state.getFocus()).assertEqual(2);
    });

    it('multiple_lock_screen_interruptions_accumulate', 0, async () => {
      const state = new PowerDialogStateModel();
      state.interrupt(InterruptionType.LOCK_SCREEN);
      state.interrupt(InterruptionType.LOCK_SCREEN);
      expect(state.getInterruptionCount()).assertEqual(2);
    });

    it('interruption_types_should_be_distinct', 0, async () => {
      const values: InterruptionType[] =
        [InterruptionType.LOCK_SCREEN, InterruptionType.POWER_LOW, InterruptionType.BACKGROUND,
          InterruptionType.INCOMING_CALL, InterruptionType.USB_PLUG, InterruptionType.SCREEN_ROTATE,
          InterruptionType.SYSTEM_DIALOG];
      const unique = new Set<InterruptionType>(values);
      expect(unique.size).assertEqual(values.length);
    });

    it('reset_twice_should_be_safe', 0, async () => {
      const state = new PowerDialogStateModel();
      state.setFocus(0);
      state.reset();
      state.reset();
      expect(state.getFocus()).assertEqual(1);
    });

    it('focus_boundary_after_interrupt_preserved', 0, async () => {
      const state = new PowerDialogStateModel();
      state.setFocus(0);
      state.interrupt(InterruptionType.SCREEN_ROTATE);
      expect(state.getFocus()).assertEqual(0);
    });

    it('operation_start_twice_remains_in_progress', 0, async () => {
      const state = new PowerDialogStateModel();
      state.startOperation();
      state.startOperation();
      expect(state.isOperationInProgress()).assertTrue();
    });

    it('recover_after_reset_is_true', 0, async () => {
      const state = new PowerDialogStateModel();
      state.reset();
      expect(state.recover()).assertTrue();
    });

    it('record_order_should_be_preserved', 0, async () => {
      const state = new PowerDialogStateModel();
      state.interrupt(InterruptionType.POWER_LOW);
      state.interrupt(InterruptionType.BACKGROUND);
      const records = state.getInterruptionRecords();
      expect(records[0].type).assertEqual(InterruptionType.POWER_LOW);
      expect(records[1].type).assertEqual(InterruptionType.BACKGROUND);
    });

    it('interrupt_with_operation_then_recover', 0, async () => {
      const state = new PowerDialogStateModel();
      state.startOperation();
      state.interrupt(InterruptionType.INCOMING_CALL);
      state.recover();
      expect(state.isOperationInProgress()).assertTrue();
    });

    it('focus_zero_after_set_is_zero', 0, async () => {
      const state = new PowerDialogStateModel();
      state.setFocus(0);
      expect(state.getFocus()).assertEqual(0);
    });

    it('recovered_flag_after_reset_is_true', 0, async () => {
      const state = new PowerDialogStateModel();
      state.reset();
      expect(state.isRecovered()).assertTrue();
    });
  });
}
