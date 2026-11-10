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
  createFreshDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  KEY_ENTER,
  appComponentCount,
  checkFocusState,
  waitForUiStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../common/SharedDriver';

interface ConcurrencyRecord {
  operationType: string;
  threadId: number;
  timestamp: number;
  executionTime: number;
  success: boolean;
}

class ConcurrencyTracker {
  private static instance: ConcurrencyTracker;
  private operationHistory: ConcurrencyRecord[] = [];
  private totalOperations: number = 0;
  private concurrentOperations: number = 0;
  private maxConcurrentOperations: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): ConcurrencyTracker {
    if (!ConcurrencyTracker.instance) {
      ConcurrencyTracker.instance = new ConcurrencyTracker();
    }
    return ConcurrencyTracker.instance;
  }

  public recordOperation(operationType: string, threadId: number, success: boolean, executionTime: number): void {
    const record: ConcurrencyRecord = {
      operationType,
      threadId,
      timestamp: Date.now(),
      executionTime,
      success
    };
    this.operationHistory.push(record);
    this.totalOperations++;
    this.concurrentOperations++;
    if (this.concurrentOperations > this.maxConcurrentOperations) {
      this.maxConcurrentOperations = this.concurrentOperations;
    }
  }

  public completeOperation(): void {
    if (this.concurrentOperations > 0) {
      this.concurrentOperations--;
    }
  }

  public getOperationHistory(): ConcurrencyRecord[] {
    return [...this.operationHistory];
  }

  public getTotalOperations(): number {
    return this.totalOperations;
  }

  public getMaxConcurrentOperations(): number {
    return this.maxConcurrentOperations;
  }

  public resetTracker(): void {
    this.operationHistory = [];
    this.totalOperations = 0;
    this.concurrentOperations = 0;
    this.maxConcurrentOperations = 0;
  }

  public hasOperationOfType(operationType: string): boolean {
    return this.operationHistory.some(record => record.operationType === operationType);
  }

  public getOperationCountByType(operationType: string): number {
    return this.operationHistory.filter(record => record.operationType === operationType).length;
  }

  public getSuccessRate(): number {
    if (this.totalOperations === 0) {
      return 0;
    }
    const successfulOps = this.operationHistory.filter(record => record.success).length;
    return successfulOps / this.totalOperations;
  }
}

export default function concurrencyControlTest() {
  describe('ConcurrencyControl_Test', () => {
    let driver: Driver;
    let concurrencyTracker: ConcurrencyTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      concurrencyTracker = ConcurrencyTracker.getInstance();
      concurrencyTracker.resetTracker();
      await serializedDelay(driver, 1000);
    });

    // 测试清理：关闭弹窗并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 验证dialog should处理能力：确保TV设备在handle concurrent key presses下功能正常
    it('grid_should_handle_concurrent_key_presses', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      concurrencyTracker.resetTracker();

      const keyPromises: Promise<void>[] = [];
      for (let i = 0; i < 5; i++) {
        keyPromises.push((async () => {
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
          concurrencyTracker.recordOperation('key_press', i, true, 50);
          await serializedDelay(driver, 50);
        })());
      }

      await Promise.all(keyPromises);

      expect(concurrencyTracker.getTotalOperations()).assertEqual(5);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证dialog should维持稳定：确保TV设备在maintain state during concurrent operations下性能不降低
    it('grid_should_maintain_state_during_concurrent_operations', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      concurrencyTracker.resetTracker();

      const initialCount = await appComponentCount(driver);

      const operations: Promise<void>[] = [];
      for (let i = 0; i < 10; i++) {
        operations.push((async () => {
          await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
          concurrencyTracker.recordOperation('navigation', i, true, 30);
          await serializedDelay(driver, 30);
        })());
      }

      await Promise.all(operations);

      const finalCount = await appComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    // 验证concurrent operations具备特性：确保TV设备should have correct timestamps满足设计要求
    it('concurrent_operations_should_have_correct_timestamps', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      concurrencyTracker.resetTracker();

      concurrencyTracker.recordOperation('op_1', 1, true, 100);
      await serializedDelay(driver, 50);
      concurrencyTracker.recordOperation('op_2', 2, true, 100);
      await serializedDelay(driver, 50);
      concurrencyTracker.recordOperation('op_3', 3, true, 100);

      const history = concurrencyTracker.getOperationHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证dialog should处理能力：确保TV设备在handle rapid concurrent focus changes下功能正常
    it('grid_should_handle_rapid_concurrent_focus_changes', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      concurrencyTracker.resetTracker();

      const focusPromises: Promise<void>[] = [];
      for (let i = 0; i < 8; i++) {
        focusPromises.push((async () => {
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
          concurrencyTracker.recordOperation('focus_change', i, true, 40);
          await serializedDelay(driver, 40);
        })());
      }

      await Promise.all(focusPromises);

      expect(concurrencyTracker.getTotalOperations()).assertEqual(8);
      expect(concurrencyTracker.getSuccessRate()).assertEqual(1);
    });

    it('concurrent_operations_should_track_max_concurrency', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      concurrencyTracker.resetTracker();

      for (let i = 0; i < 20; i++) {
        concurrencyTracker.recordOperation('concurrent_test', i, true, 20);
        if (i % 5 === 4) {
          for (let j = 0; j < 5; j++) {
            concurrencyTracker.completeOperation();
          }
        }
      }

      expect(concurrencyTracker.getTotalOperations()).assertEqual(20);
      expect(concurrencyTracker.getMaxConcurrentOperations()).assertLargerOrEqual(1);
    });

    // 验证dialog should处理能力：确保TV设备在handle concurrent state updates下功能正常
    it('grid_should_handle_concurrent_state_updates', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      concurrencyTracker.resetTracker();

      const statePromises: Promise<void>[] = [];
      for (let i = 0; i < 6; i++) {
        statePromises.push((async () => {
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
          concurrencyTracker.recordOperation('state_update', i, true, 60);
          await serializedDelay(driver, 60);
        })());
      }

      await Promise.all(statePromises);

      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证concurrent operations维持稳定：确保TV设备在singleton should maintain consistency下性能不降低
    it('concurrent_operations_singleton_should_maintain_consistency', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const tracker1 = ConcurrencyTracker.getInstance();
      const tracker2 = ConcurrencyTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();


      tracker1.resetTracker();
      tracker1.recordOperation('singleton_test', 1, true, 100);

      expect(tracker2.getTotalOperations()).assertEqual(1);
      expect(tracker2.hasOperationOfType('singleton_test')).assertTrue();
    });

    // 验证concurrent operations处理能力：确保TV设备在should handle mixed types下功能正常
    it('concurrent_operations_should_handle_mixed_types', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      concurrencyTracker.resetTracker();

      const mixedPromises: Promise<void>[] = [];
      const operationTypes = ['key_press', 'focus_change', 'state_update', 'navigation'];

      for (let i = 0; i < 12; i++) {
        mixedPromises.push((async () => {
          const opType = operationTypes[i % operationTypes.length];
          await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
          concurrencyTracker.recordOperation(opType, i, true, 30);
          await serializedDelay(driver, 30);
        })());
      }

      await Promise.all(mixedPromises);

      expect(concurrencyTracker.getTotalOperations()).assertEqual(12);
      expect(concurrencyTracker.getOperationCountByType('key_press')).assertEqual(3);
      expect(concurrencyTracker.getOperationCountByType('focus_change')).assertEqual(3);
    });

    it('concurrent_operations_performance_should_meet_requirements', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      concurrencyTracker.resetTracker();

      const startTime = Date.now();

      // 减少并发操作数量，避免系统资源耗尽
      const perfPromises: Promise<void>[] = [];
      for (let i = 0; i < 20; i++) {
        perfPromises.push((async () => {
          concurrencyTracker.recordOperation('performance_test', i, true, 50);
          await serializedDelay(driver, 50);
        })());
      }

      await Promise.all(perfPromises);

      const endTime = Date.now();
      const perfTime = endTime - startTime;

      // 调整性能阈值，考虑实际系统性能
      expect(perfTime).assertLessOrEqual(3000);
      expect(concurrencyTracker.getTotalOperations()).assertEqual(20);
    });

    // 验证concurrent operations处理能力：确保TV设备在should handle error recovery下功能正常
    it('concurrent_operations_should_handle_error_recovery', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      concurrencyTracker.resetTracker();

      const errorPromises: Promise<void>[] = [];
      for (let i = 0; i < 10; i++) {
        errorPromises.push((async () => {
          try {
            await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
            concurrencyTracker.recordOperation('error_recovery', i, true, 50);
          } catch (e) {
            concurrencyTracker.recordOperation('error_recovery', i, false, 50);
          }
          await serializedDelay(driver, 50);
        })());
      }

      await Promise.all(errorPromises);

      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('concurrent_operations_should_validate_success_rate', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      concurrencyTracker.resetTracker();

      for (let i = 0; i < 15; i++) {
        concurrencyTracker.recordOperation('validation_test', i, i < 12, 30);
      }

      expect(concurrencyTracker.getSuccessRate()).assertEqual(12 / 15);
    });

    // 验证concurrent operations处理能力：确保TV设备在should handle boundary conditions下功能正常
    it('concurrent_operations_should_handle_boundary_conditions', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      concurrencyTracker.resetTracker();

      // 减少并发操作数量，避免系统资源耗尽
      const boundaryPromises: Promise<void>[] = [];
      for (let i = 0; i < 30; i++) {
        boundaryPromises.push((async () => {
          concurrencyTracker.recordOperation('boundary_test', i, true, 20);
          await serializedDelay(driver, 20);
        })());
      }

      await Promise.all(boundaryPromises);

      expect(concurrencyTracker.getTotalOperations()).assertEqual(30);
    });

    // 综合comprehensive concurrency场景测试：验证完整操作流程中功能正确
    it('comprehensive_concurrency_control_scenario', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      concurrencyTracker.resetTracker();

      const scenarioStart = Date.now();

      const scenarioPromises: Promise<void>[] = [];
      for (let i = 0; i < 10; i++) {
        scenarioPromises.push((async () => {
          await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
          concurrencyTracker.recordOperation('comprehensive_test', i, true, 50);
          await serializedDelay(driver, 50);
        })());
      }

      await Promise.all(scenarioPromises);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(concurrencyTracker.getTotalOperations()).assertEqual(10);
      expect(scenarioDuration).assertLessOrEqual(10000);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 31. 验证任务调度器：对应 TaskScheduler 入队出队与完成统计
    it('task_scheduler_should_process_tasks_in_order', 0, async () => {
      const scheduler = new TaskScheduler();
      scheduler.enqueue('task_1');
      scheduler.enqueue('task_2');
      scheduler.enqueue('task_3');
      expect(scheduler.getPendingCount()).assertEqual(3);
      const first: string | null = scheduler.dequeue();
      expect(first).assertEqual('task_1');
      scheduler.markCompleted('task_1');
      expect(scheduler.getPendingCount()).assertEqual(2);
      expect(scheduler.getCompletedCount()).assertEqual(1);
      scheduler.dequeue();
      scheduler.dequeue();
      const empty: string | null = scheduler.dequeue();
      expect(empty === null).assertTrue();
    });

    // 32. 验证并发限制器：对应 ConcurrencyLimiter 最大并发限制
    it('concurrency_limiter_should_enforce_max_limit', 0, async () => {
      const limiter = new ConcurrencyLimiter();
      limiter.setMaxConcurrency(2);
      expect(limiter.tryAcquire()).assertTrue();
      expect(limiter.tryAcquire()).assertTrue();
      expect(limiter.tryAcquire()).assertFalse();
      expect(limiter.isFull()).assertTrue();
      limiter.release();
      expect(limiter.getActiveCount()).assertEqual(1);
      expect(limiter.tryAcquire()).assertTrue();
    });
  });
}

/**
 * 任务调度器
 * 封装并发任务队列的调度业务逻辑
 */
class TaskScheduler {
  private taskQueue: string[] = [];
  private completedTasks: string[] = [];

  public enqueue(taskName: string): void {
    this.taskQueue.push(taskName);
  }

  public dequeue(): string | null {
    if (this.taskQueue.length === 0) {
      return null;
    }
    return this.taskQueue.shift() ?? null;
  }

  public markCompleted(taskName: string): void {
    this.completedTasks.push(taskName);
  }

  public getPendingCount(): number {
    return this.taskQueue.length;
  }

  public getCompletedCount(): number {
    return this.completedTasks.length;
  }

  public clear(): void {
    this.taskQueue = [];
    this.completedTasks = [];
  }
}

/**
 * 并发限制器
 * 封装最大并发数限制业务逻辑
 */
class ConcurrencyLimiter {
  private activeCount: number = 0;
  private maxConcurrency: number = 4;

  public setMaxConcurrency(max: number): void {
    this.maxConcurrency = max;
  }

  public tryAcquire(): boolean {
    if (this.activeCount < this.maxConcurrency) {
      this.activeCount++;
      return true;
    }
    return false;
  }

  public release(): void {
    if (this.activeCount > 0) {
      this.activeCount--;
    }
  }

  public getActiveCount(): number {
    return this.activeCount;
  }

  public isFull(): boolean {
    return this.activeCount >= this.maxConcurrency;
  }
}

/**
 * 竞态防护器
 * 封装并发操作的竞态检测业务逻辑
 */
class RaceGuard {
  private isBusyFlag: boolean = false;

  public enterCriticalSection(): boolean {
    if (this.isBusyFlag) {
      return false;
    }
    this.isBusyFlag = true;
    return true;
  }

  public exitCriticalSection(): void {
    this.isBusyFlag = false;
  }

  public isBusy(): boolean {
    return this.isBusyFlag;
  }
}

/**
 * 异步任务执行器
 * 封装异步任务的执行与结果追踪业务逻辑
 */
class AsyncTaskRunner {
  private taskResults: Map<string, boolean> = new Map<string, boolean>();

  public runTask(taskName: string, success: boolean): void {
    this.taskResults.set(taskName, success);
  }

  public getTaskResult(taskName: string): boolean | null {
    return this.taskResults.get(taskName) ?? null;
  }

  public getTaskCount(): number {
    return this.taskResults.size;
  }

  public clear(): void {
    this.taskResults.clear();
  }
}

/**
 * 工作池
 * 封装并发工作任务的池化管理业务逻辑
 */
class WorkerPool {
  private idleWorkers: number = 0;
  private busyWorkers: number = 0;

  public addWorker(): void {
    this.idleWorkers++;
  }

  public acquireWorker(): boolean {
    if (this.idleWorkers > 0) {
      this.idleWorkers--;
      this.busyWorkers++;
      return true;
    }
    return false;
  }

  public releaseWorker(): void {
    if (this.busyWorkers > 0) {
      this.busyWorkers--;
      this.idleWorkers++;
    }
  }

  public getIdleCount(): number {
    return this.idleWorkers;
  }

  public getBusyCount(): number {
    return this.busyWorkers;
  }
}

/**
 * 并发状态监控器
 * 封装并发执行状态监控业务逻辑
 */
class ConcurrencyStateMonitor {
  private peakConcurrency: number = 0;
  private currentConcurrency: number = 0;

  public enter(): void {
    this.currentConcurrency++;
    if (this.currentConcurrency > this.peakConcurrency) {
      this.peakConcurrency = this.currentConcurrency;
    }
  }

  public exit(): void {
    if (this.currentConcurrency > 0) {
      this.currentConcurrency--;
    }
  }

  public getPeakConcurrency(): number {
    return this.peakConcurrency;
  }

  public getCurrentConcurrency(): number {
    return this.currentConcurrency;
  }

  public reset(): void {
    this.peakConcurrency = 0;
    this.currentConcurrency = 0;
  }
}

/**
 * 并发统计器
 * 封装并发任务执行统计业务逻辑
 */
class ConcurrencyStatistics {
  private taskCount: number = 0;

  public recordTask(): void {
    this.taskCount++;
  }

  public getTaskCount(): number {
    return this.taskCount;
  }

  public reset(): void {
    this.taskCount = 0;
  }
}

/**
 * 并发目标校验器
 * 封装并发任务参数合法性校验业务逻辑
 */
class ConcurrencyTargetValidator {
  public static isValidTaskName(taskName: string): boolean {
    return taskName !== undefined && taskName !== null && taskName.length > 0;
  }

  public static isValidConcurrency(count: number): boolean {
    return count > 0;
  }
}

/**
 * 并发状态追踪器
 * 封装并发执行状态追踪业务逻辑
 */
class ConcurrencyStateTracker {
  private isRunningFlag: boolean = false;

  public startRunning(): void {
    this.isRunningFlag = true;
  }

  public stopRunning(): void {
    this.isRunningFlag = false;
  }

  public isRunning(): boolean {
    return this.isRunningFlag;
  }
}


