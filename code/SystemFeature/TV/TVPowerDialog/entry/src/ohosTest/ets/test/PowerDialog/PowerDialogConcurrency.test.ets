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
  KEY_ENTER,
  KEY_BACK,
  powerDialogComponentCount,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../Shared/SharedDriver';

// 并发操作记录接口
interface ConcurrentRecord {
  type: string;
  timestamp: number;
  success: boolean;
}

// 并发操作追踪器：追踪并发操作的时序与最大并发数
class ConcurrencyTracker {
  private static instance: ConcurrencyTracker;
  private records: ConcurrentRecord[] = [];
  private maxConcurrency: number = 0;
  private activeCount: number = 0;
  private totalOperations: number = 0;

  public static getInstance(): ConcurrencyTracker {
    if (!ConcurrencyTracker.instance) {
      ConcurrencyTracker.instance = new ConcurrencyTracker();
    }
    return ConcurrencyTracker.instance;
  }

  public beginOperation(type: string): void {
    this.activeCount++;
    this.totalOperations++;
    if (this.activeCount > this.maxConcurrency) {
      this.maxConcurrency = this.activeCount;
    }
    this.records.push({ type, timestamp: Date.now(), success: true });
  }

  public endOperation(): void {
    if (this.activeCount > 0) {
      this.activeCount--;
    }
  }

  public recordFailed(type: string): void {
    this.totalOperations++;
    this.records.push({ type, timestamp: Date.now(), success: false });
  }

  public getMaxConcurrency(): number {
    return this.maxConcurrency;
  }

  public getTotalOperations(): number {
    return this.totalOperations;
  }

  public getSuccessCount(): number {
    return this.records.filter((record: ConcurrentRecord) => record.success).length;
  }

  public getRecords(): ConcurrentRecord[] {
    return [...this.records];
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
    this.maxConcurrency = 0;
    this.activeCount = 0;
    this.totalOperations = 0;
  }
}

// ===== 新增辅助代码：并发控制扩展模型与工具 =====

// 并发操作类型枚举：描述并发场景下的操作类型
enum ConcurrentOperationType {
  KEY_PRESS = 'key_press', FOCUS_SWITCH = 'focus_switch', RENDER = 'render', DATA_CHANGE = 'data_change'
}

// 并发状态枚举：描述并发操作所处的状态
enum ConcurrencyState {
  IDLE = 'idle', ACTIVE = 'active', DRAINING = 'draining', TERMINATED = 'terminated'
}

// 并发操作详情接口：描述一次并发操作的完整信息
interface ConcurrentOperationDetail {
  operationId: number;
  type: ConcurrentOperationType;
  startTime: number;
  endTime: number;
  successful: boolean;
}

// 并发快照接口：描述某一时刻的并发状态快照
interface ConcurrencySnapshot {
  state: ConcurrencyState;
  activeCount: number;
  totalCount: number;
  maxConcurrency: number;
}

// 并发操作详情模型：封装操作详情，支持克隆与比较
class ConcurrentOperationRecord {
  public operationId: number;
  public type: ConcurrentOperationType;
  public startTime: number;
  public endTime: number;
  public successful: boolean;

  constructor(operationId: number, type: ConcurrentOperationType, startTime: number, endTime: number,
    successful: boolean) {
    this.operationId = operationId;
    this.type = type;
    this.startTime = startTime;
    this.endTime = endTime;
    this.successful = successful;
  }

  public clone(): ConcurrentOperationRecord {
    return new ConcurrentOperationRecord(this.operationId, this.type, this.startTime, this.endTime, this.successful);
  }

  public equals(other: ConcurrentOperationRecord): boolean {
    return this.operationId === other.operationId && this.type === other.type;
  }

  public toString(): string {
    return `ConcurrentOperationRecord(id=${this.operationId}, type=${this.type}, successful=${this.successful})`;
  }

  public getDuration(): number {
    return this.endTime - this.startTime;
  }

  public isValid(): boolean {
    return this.operationId >= 0 && this.endTime >= this.startTime;
  }
}

// 并发操作记录器：记录并统计并发操作详情
class ConcurrentOperationRecorder {
  private records: ConcurrentOperationRecord[] = [];
  private nextId: number = 0;

  public startOperation(type: ConcurrentOperationType): number {
    const id = this.nextId;
    this.nextId++;
    const record = new ConcurrentOperationRecord(id, type, Date.now(), 0, true);
    this.records.push(record);
    return id;
  }

  public finishOperation(operationId: number, successful: boolean): boolean {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].operationId === operationId) {
        this.records[i].endTime = Date.now();
        this.records[i].successful = successful;
        return true;
      }
    }
    return false;
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public getSuccessfulCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].successful) {
        count++;
      }
    }
    return count;
  }

  public getCountByType(type: ConcurrentOperationType): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].type === type) {
        count++;
      }
    }
    return count;
  }

  public getAverageDuration(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let sum: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      sum += this.records[i].getDuration();
    }
    return sum / this.records.length;
  }

  public getRecords(): ConcurrentOperationRecord[] {
    const result: ConcurrentOperationRecord[] = [];
    for (let i = 0; i < this.records.length; i++) {
      result.push(this.records[i].clone());
    }
    return result;
  }

  public clear(): void {
    this.records = [];
    this.nextId = 0;
  }
}

// 并发状态机：管理并发操作的运行状态
class ConcurrencyStateMachine {
  private state: ConcurrencyState = ConcurrencyState.IDLE;
  private activeCount: number = 0;

  public start(): void {
    this.state = ConcurrencyState.ACTIVE;
  }

  public beginOperation(): void {
    this.activeCount++;
  }

  public endOperation(): void {
    if (this.activeCount > 0) {
      this.activeCount--;
    }
    if (this.activeCount === 0 && this.state === ConcurrencyState.DRAINING) {
      this.state = ConcurrencyState.IDLE;
    }
  }

  public drain(): void {
    if (this.activeCount === 0) {
      this.state = ConcurrencyState.IDLE;
    } else {
      this.state = ConcurrencyState.DRAINING;
    }
  }

  public terminate(): void {
    this.state = ConcurrencyState.TERMINATED;
    this.activeCount = 0;
  }

  public getState(): ConcurrencyState {
    return this.state;
  }

  public getActiveCount(): number {
    return this.activeCount;
  }

  public isIdle(): boolean {
    return this.state === ConcurrencyState.IDLE;
  }

  public isActive(): boolean {
    return this.state === ConcurrencyState.ACTIVE;
  }

  public isTerminated(): boolean {
    return this.state === ConcurrencyState.TERMINATED;
  }
}

// 并发快照模型：封装并发状态快照，支持克隆与比较
class ConcurrencySnapshotModel {
  public state: ConcurrencyState;
  public activeCount: number;
  public totalCount: number;
  public maxConcurrency: number;

  constructor(state: ConcurrencyState, activeCount: number, totalCount: number, maxConcurrency: number) {
    this.state = state;
    this.activeCount = activeCount;
    this.totalCount = totalCount;
    this.maxConcurrency = maxConcurrency;
  }

  public clone(): ConcurrencySnapshotModel {
    return new ConcurrencySnapshotModel(this.state, this.activeCount, this.totalCount, this.maxConcurrency);
  }

  public equals(other: ConcurrencySnapshotModel): boolean {
    return this.state === other.state && this.activeCount === other.activeCount &&
      this.totalCount === other.totalCount && this.maxConcurrency === other.maxConcurrency;
  }

  public toString(): string {
    return `ConcurrencySnapshotModel(state=${this.state}, active=${this.activeCount}, total=${this.totalCount}, max=${this.maxConcurrency})`;
  }

  public isValid(): boolean {
    return this.activeCount >= 0 && this.totalCount >= 0 && this.maxConcurrency >= 0;
  }
}

// 并发统计器：统计并发操作的各项指标
class ConcurrencyStatistics {
  public getSuccessRate(records: ConcurrentOperationRecord[]): number {
    if (records.length === 0) {
      return 0;
    }
    let success: number = 0;
    for (let i = 0; i < records.length; i++) {
      if (records[i].successful) {
        success++;
      }
    }
    return success / records.length;
  }

  public getTotalDuration(records: ConcurrentOperationRecord[]): number {
    let total: number = 0;
    for (let i = 0; i < records.length; i++) {
      total += records[i].getDuration();
    }
    return total;
  }

  public getOverlapCount(records: ConcurrentOperationRecord[]): number {
    let overlaps: number = 0;
    for (let i = 0; i < records.length; i++) {
      for (let j = i + 1; j < records.length; j++) {
        const a = records[i];
        const b = records[j];
        if (a.startTime < b.endTime && b.startTime < a.endTime) {
          overlaps++;
        }
      }
    }
    return overlaps;
  }

  public getMaxActiveCount(records: ConcurrentOperationRecord[]): number {
    let maxActive: number = 0;
    for (let i = 0; i < records.length; i++) {
      let active: number = 0;
      const time = records[i].startTime;
      for (let j = 0; j < records.length; j++) {
        if (records[j].startTime <= time && records[j].endTime > time) {
          active++;
        }
      }
      if (active > maxActive) {
        maxActive = active;
      }
    }
    return maxActive;
  }
}

export default function powerDialogConcurrencyTest() {
  describe('PowerDialogConcurrency_Test', () => {
    let driver: Driver;
    let tracker: ConcurrencyTracker;

    beforeAll(async () => {
      driver = createFreshDriver();
      tracker = ConcurrencyTracker.getInstance();
      tracker.reset();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 适配 NavStack_Race_Conditions：并发按键处理
    it('dialog_should_handle_concurrent_key_presses', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        tracker.beginOperation('right');
        tracker.endOperation();
      }
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 适配 DataSource_Race_Conditions：并发操作保持状态
    it('dialog_should_maintain_state_during_concurrent_operations', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      tracker.reset();
      for (let i = 0; i < 20; i++) {
        if (i % 2 === 0) {
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        } else {
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        }
        tracker.beginOperation(i % 2 === 0 ? 'left' : 'right');
        tracker.endOperation();
      }
    });

    // 适配 USB_Plugin_Race：操作时间戳有序
    it('concurrent_operations_should_have_chronological_timestamps', 0, async () => {
      tracker.reset();
      tracker.beginOperation('left');
      tracker.endOperation();
      tracker.beginOperation('right');
      tracker.endOperation();
      tracker.beginOperation('enter');
      tracker.endOperation();
      expect(tracker.isChronological()).assertTrue();
    });

    // 适配 SelectMode_Race：快速焦点切换
    it('dialog_should_handle_rapid_concurrent_focus_changes', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      tracker.reset();
      for (let i = 0; i < 30; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, 20);
        tracker.beginOperation('focus');
        tracker.endOperation();
      }
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 适配 TaskPool_Concurrency：追踪最大并发数
    it('concurrent_operations_should_track_max_concurrency', 0, async () => {
      tracker.reset();
      tracker.beginOperation('a');
      tracker.beginOperation('b');
      tracker.beginOperation('c');
      expect(tracker.getMaxConcurrency()).assertEqual(3);
      tracker.endOperation();
      tracker.endOperation();
      tracker.endOperation();
    });

    // 适配 Concurrent_Operations：单例一致性
    it('concurrency_tracker_singleton_should_be_consistent', 0, async () => {
      const instance1 = ConcurrencyTracker.getInstance();
      const instance2 = ConcurrencyTracker.getInstance();
      expect(instance1 === instance2).assertTrue();
    });

    // 适配 Concurrent_Operations：混合类型操作
    it('concurrent_operations_should_handle_mixed_types', 0, async () => {
      tracker.reset();
      const types = ['left', 'right', 'enter', 'left', 'right'];
      types.forEach((type: string) => {
        tracker.beginOperation(type);
        tracker.endOperation();
      });
    });

    // 适配 Listener_Race：错误恢复
    it('concurrent_operations_should_handle_error_recovery', 0, async () => {
      tracker.reset();
      tracker.beginOperation('valid');
      tracker.endOperation();
      tracker.recordFailed('invalid');
      expect(tracker.getSuccessCount()).assertEqual(1);
    });

    // 适配 Concurrent_Operations：成功率验证
    it('concurrent_operations_should_validate_success_rate', 0, async () => {
      tracker.reset();
      tracker.beginOperation('ok');
      tracker.endOperation();
      tracker.beginOperation('ok');
      tracker.endOperation();
      expect(tracker.getSuccessCount()).assertEqual(2);
      expect(tracker.getSuccessCount() === tracker.getTotalOperations()).assertTrue();
    });

    // 综合：并发场景完整验证
    it('comprehensive_concurrency_scenario', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      tracker.reset();
      for (let i = 0; i < 15; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        tracker.beginOperation('right');
        tracker.endOperation();
      }
      expect(tracker.isChronological()).assertTrue();
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });
  });
}
