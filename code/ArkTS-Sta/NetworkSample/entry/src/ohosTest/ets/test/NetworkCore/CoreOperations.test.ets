'use static';
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

/**
 * CoreOperations suite.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   57-64    the three progress values, isTaskFinished, lock, A/B flags
 *   79-95    completeTaskA / completeTaskB / completeTaskC
 *   105-107  canRunTaskC returns !lock
 *   188-193  the 200 ms interval that calls runTaskC and then clearInterval
 *
 * Each case isolates a single operation of the observable model and checks its
 * return value plus the state delta, so a failure points at one operation
 * instead of at a whole flow.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TaskGraph,
  DownloadTask,
  DownloadConfig,
  RunSnapshot,
  SnapshotLog,
  NetworkMetrics,
  createTaskGraph,
  TASK_A,
  TASK_B,
  TASK_C,
  URL_TASK_A,
  URL_TASK_B,
  URL_TASK_C,
  PROGRESS_TOTAL,
  POLL_INTERVAL_MS,
  ERROR_CREATE,
  ERROR_START,
  countOf,
  joined
} from '../Shared/SharedDriver';

export default function networkCoreOperationsTest(): void {
  describe('CoreOperations', () => {
    beforeAll(() => {
      logSuite('CoreOperations', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CoreOperations', 'end');
    });

    /**
     * @tc.name   taskByNoResolvesEachSeededTask
     * @tc.desc   The lookup returns the three tasks with their own URL literals.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskByNoResolvesEachSeededTask', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect((graph.taskByNo(TASK_A) as DownloadTask).url).assertEqual(URL_TASK_A);
      expect((graph.taskByNo(TASK_B) as DownloadTask).url).assertEqual(URL_TASK_B);
      expect((graph.taskByNo(TASK_C) as DownloadTask).url).assertEqual(URL_TASK_C);
      expect((graph.taskByNo(TASK_A) as DownloadTask).taskNo).assertEqual(TASK_A);
    });

    /**
     * @tc.name   taskByNoReturnsUndefinedForAnUnknownTask
     * @tc.desc   A number outside the seed set has no task instead of a synthetic one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskByNoReturnsUndefinedForAnUnknownTask', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.taskByNo('Z')).assertUndefined();
      expect(graph.taskByNo('a')).assertUndefined();
      expect(graph.taskByNo('')).assertUndefined();
      expect(graph.taskByNo('AB')).assertUndefined();
      expect(graph.tasks.length).assertEqual(3);
    });

    /**
     * @tc.name   taskAtClampsBothEndsOfTheRange
     * @tc.desc   An index below zero maps to A and an index above two maps to C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskAtClampsBothEndsOfTheRange', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.taskAt(-1).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(-100).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(3).taskNo).assertEqual(TASK_C);
      expect(graph.taskAt(50).taskNo).assertEqual(TASK_C);
      expect(graph.taskAt(1).taskNo).assertEqual(TASK_B);
    });

    /**
     * @tc.name   taskAtNeverReturnsAFreshObject
     * @tc.desc   The accessor hands out the stored instance, so mutations are visible.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('taskAtNeverReturnsAFreshObject', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const first: DownloadTask = graph.taskAt(0);
      first.reportProgress(30);
      expect(graph.taskAt(0).progress).assertEqual(30);
      expect((graph.taskByNo(TASK_A) as DownloadTask).progress).assertEqual(30);
      expect(first === graph.taskAt(0)).assertTrue();
      expect(graph.totalProgress()).assertEqual(30);
    });

    /**
     * @tc.name   completeTaskOnAnUnknownNumberReturnsFalse
     * @tc.desc   The unknown branch exits before any state or event change.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completeTaskOnAnUnknownNumberReturnsFalse', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const size: number = graph.events.size();
      expect(graph.completeTask('Z')).assertFalse();
      expect(graph.events.size()).assertEqual(size);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(2);
    });

    /**
     * @tc.name   completeTaskOnAnIdleTaskStillCompletes
     * @tc.desc   The operation does not require a running status, matching the callback branch.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completeTaskOnAnIdleTaskStillCompletes', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.completeTask(TASK_B, 12)).assertTrue();
      const task: DownloadTask = graph.taskByNo(TASK_B) as DownloadTask;
      expect(task.isComplete()).assertTrue();
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(task.finishedAt).assertEqual(12);
      expect(task.attempts).assertEqual(0);
    });
    /**
     * @tc.name   completeTaskRejectsASecondCallForTheSameTask
     * @tc.desc   The completion clock of the first call is preserved on the refused second call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completeTaskRejectsASecondCallForTheSameTask', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.completeTask(TASK_C, 100);
      expect(graph.completeTask(TASK_C, 200)).assertFalse();
      const task: DownloadTask = graph.taskByNo(TASK_C) as DownloadTask;
      expect(task.finishedAt).assertEqual(100);
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(1);
    });

    /**
     * @tc.name   completeTaskReleasesOnlySharedTasks
     * @tc.desc   Completing C never releases a shared slot because C is the exclusive role.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('completeTaskReleasesOnlySharedTasks', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_C);
      expect(graph.lock.sharedHolders.length).assertEqual(2);
      expect(graph.lock.hasShared(TASK_A)).assertTrue();
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(2);
    });

    /**
     * @tc.name   runTaskCIfReadyNeedsBothDependencies
     * @tc.desc   Only the A-then-B pair opens the gate; neither task alone does.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runTaskCIfReadyNeedsBothDependencies', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.runTaskCIfReady(1)).assertFalse();
      graph.completeTask(TASK_A);
      expect(graph.runTaskCIfReady(2)).assertFalse();
      graph.completeTask(TASK_B);
      expect(graph.runTaskCIfReady(3)).assertTrue();
      expect((graph.taskByNo(TASK_C) as DownloadTask).isRunning()).assertTrue();
    });

    /**
     * @tc.name   runTaskCIfReadyRefusesACompletedC
     * @tc.desc   When C is already complete the idle precondition fails and no lock is taken.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('runTaskCIfReadyRefusesACompletedC', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.completeTaskC(10);
      const acquisitions: number = graph.lock.acquisitions;
      expect(graph.runTaskCIfReady(20)).assertFalse();
      expect(graph.lock.acquisitions).assertEqual(acquisitions);
      expect((graph.taskByNo(TASK_C) as DownloadTask).attempts).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(3);
    });

    /**
     * @tc.name   runTaskCIfReadyFailsWhenTheLockIsBusy
     * @tc.desc   A foreign exclusive owner blocks C even with both dependencies complete.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('runTaskCIfReadyFailsWhenTheLockIsBusy', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.lock.acquireExclusive('D');
      expect(graph.runTaskCIfReady(5)).assertFalse();
      expect((graph.taskByNo(TASK_C) as DownloadTask).isIdle()).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('D');
      expect(graph.lock.rejections).assertEqual(1);
    });

    /**
     * @tc.name   runTaskCIfReadyStopsTheTimer
     * @tc.desc   A direct start sets timerActive false, which is the clearInterval effect.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runTaskCIfReadyStopsTheTimer', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.timerActive).assertTrue();
      graph.runTaskCIfReady(200);
      expect(graph.timerActive).assertFalse();
      expect(graph.events.last()).assertEqual('started:C');
      expect(graph.pollTicks).assertEqual(0);
    });

    /**
     * @tc.name   pollTickOnAnInactiveTimerCountsOneTick
     * @tc.desc   The counter advances before the timerActive guard, so an inactive poll is visible.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollTickOnAnInactiveTimerCountsOneTick', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.pollTick(200)).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.timerActive).assertFalse();
      expect(graph.events.size()).assertEqual(0);
      expect(graph.runningCount()).assertEqual(0);
    });

    /**
     * @tc.name   pollTickDoesNotStartCWithoutTheGate
     * @tc.desc   An armed timer is not enough; the two dependencies must be complete.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollTickDoesNotStartCWithoutTheGate', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.timerActive).assertTrue();
      expect(graph.pollTick(200)).assertFalse();
      expect((graph.taskByNo(TASK_C) as DownloadTask).isIdle()).assertTrue();
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   pollTickStartsCWhenTheGateIsOpen
     * @tc.desc   A single tick with both dependencies done returns true and records the clear.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pollTickStartsCWhenTheGateIsOpen', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.pollTick(200)).assertTrue();
      expect((graph.taskByNo(TASK_C) as DownloadTask).startedAt).assertEqual(200);
      expect(graph.events.last()).assertEqual('timer-cleared:C');
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.runningCount()).assertEqual(1);
    });

    /**
     * @tc.name   pollTickAfterTheClearCannotStartAgain
     * @tc.desc   The second tick returns false because timerActive was set false by the first.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollTickAfterTheClearCannotStartAgain', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      expect(graph.pollTick(400)).assertFalse();
      expect(graph.pollTicks).assertEqual(2);
      expect((graph.taskByNo(TASK_C) as DownloadTask).attempts).assertEqual(1);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
    });

    /**
     * @tc.name   completeTaskCReleasesTheExclusiveOwner
     * @tc.desc   After C completes the lock has no exclusive owner and is fully unlocked.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completeTaskCReleasesTheExclusiveOwner', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.runTaskCIfReady(1);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.completeTaskC(2)).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   completeTaskCFailsWithoutStartingC
     * @tc.desc   The release helper is still called, but the completion itself is already done.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('completeTaskCFailsWithoutStartingC', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.completeTaskC(5);
      expect(graph.completeTaskC(6)).assertFalse();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect((graph.taskByNo(TASK_C) as DownloadTask).finishedAt).assertEqual(5);
      expect(graph.events.countOf('completed')).assertEqual(1);
    });

    /**
     * @tc.name   startAllStartsOnlyTheSharedPair
     * @tc.desc   The exclusive task is queued rather than started by the start operation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startAllStartsOnlyTheSharedPair', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect((graph.taskByNo(TASK_A) as DownloadTask).attempts).assertEqual(1);
      expect((graph.taskByNo(TASK_B) as DownloadTask).attempts).assertEqual(1);
      expect((graph.taskByNo(TASK_C) as DownloadTask).attempts).assertEqual(0);
      expect(graph.events.last()).assertEqual('queued:C');
      expect(POLL_INTERVAL_MS).assertEqual(200);
    });

    /**
     * @tc.name   startAllRejectsWhileTheFlagIsDown
     * @tc.desc   The start operation is guarded by isTaskFinished and records the rejection.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startAllRejectsWhileTheFlagIsDown', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.isTaskFinished = false;
      expect(graph.startAll()).assertFalse();
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      expect(graph.events.last()).assertEqual('start-rejected:0');
      expect(graph.lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   taskStartIsRefusedWhileRunning
     * @tc.desc   A running task cannot start twice, so attempts stays at one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskStartIsRefusedWhileRunning', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      expect(task.start(10)).assertTrue();
      expect(task.start(20)).assertFalse();
      expect(task.attempts).assertEqual(1);
      expect(task.startedAt).assertEqual(10);
      expect(task.isRunning()).assertTrue();
    });

    /**
     * @tc.name   taskStartIsRefusedAfterCompletion
     * @tc.desc   A terminal status ends the start path even before any attempt count grows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskStartIsRefusedAfterCompletion', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      task.complete(30);
      expect(task.start(40)).assertFalse();
      expect(task.attempts).assertEqual(0);
      expect(task.startedAt).assertEqual(0);
      expect(task.finishedAt).assertEqual(30);
    });

    /**
     * @tc.name   taskFailRecordsTheErrorCodeOnly
     * @tc.desc   fail() moves the status to failed and keeps progress where it was.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskFailRecordsTheErrorCodeOnly', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      task.start(1);
      task.reportProgress(45);
      expect(task.fail(ERROR_CREATE)).assertTrue();
      expect(task.lastErrorCode).assertEqual(ERROR_CREATE);
      expect(task.progress).assertEqual(45);
      expect(task.isFailed()).assertTrue();
      expect(task.isRunning()).assertFalse();
    });

    /**
     * @tc.name   taskFailIsRefusedAfterCompletion
     * @tc.desc   A completed task never turns into a failed one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskFailIsRefusedAfterCompletion', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      task.complete(2);
      expect(task.fail(ERROR_START)).assertFalse();
      expect(task.lastErrorCode).assertEqual(0);
      expect(task.isComplete()).assertTrue();
      expect(task.isFailed()).assertFalse();
    });

    /**
     * @tc.name   taskResetRestoresTheSeedFieldValues
     * @tc.desc   reset() clears progress, status, error and both timestamps.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskResetRestoresTheSeedFieldValues', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(5);
      task.reportProgress(70);
      task.fail(ERROR_CREATE);
      task.reset();
      expect(task.progress).assertEqual(0);
      expect(task.status).assertEqual('idle');
      expect(task.lastErrorCode).assertEqual(0);
      expect(task.startedAt).assertEqual(0);
      expect(task.finishedAt).assertEqual(0);
      expect(task.attempts).assertEqual(1);
    });

    /**
     * @tc.name   taskResetKeepsTheAttemptHistory
     * @tc.desc   Only the run fields are reset; attempts is a lifetime counter in the model.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('taskResetKeepsTheAttemptHistory', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      task.start(1);
      task.reset();
      task.start(2);
      expect(task.attempts).assertEqual(2);
      expect(task.startedAt).assertEqual(2);
      expect(task.status).assertEqual('running');
      expect(task.progress).assertEqual(0);
    });

    /**
     * @tc.name   taskProgressRatioIsAFractionOfTheTotal
     * @tc.desc   progressRatio() divides by 100 and never exceeds one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('taskProgressRatioIsAFractionOfTheTotal', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      expect(task.progressRatio()).assertEqual(0);
      task.reportProgress(50);
      expect(task.progressRatio()).assertEqual(0.5);
      task.reportProgress(500);
      expect(task.progressRatio()).assertEqual(1);
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
    });

    /**
     * @tc.name   taskLabelMatchesTheRenderedRowText
     * @tc.desc   label() is the same progress text the page renders under each bar.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskLabelMatchesTheRenderedRowText', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      expect(task.label()).assertEqual('任务B当前进度 0%');
      task.reportProgress(35);
      expect(task.label()).assertEqual('任务B当前进度 35%');
      expect(task.label().indexOf('任务B')).assertEqual(0);
    });

    /**
     * @tc.name   taskDescribeIsTheStatusTriple
     * @tc.desc   describe() is taskNo:status:progress and changes with each phase.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskDescribeIsTheStatusTriple', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      expect(task.describe()).assertEqual('C:idle:0');
      task.start(1);
      expect(task.describe()).assertEqual('C:running:0');
      task.reportProgress(60);
      expect(task.describe()).assertEqual('C:running:60');
      task.complete(2);
      expect(task.describe()).assertEqual('C:completed:100');
    });

    /**
     * @tc.name   taskSnapshotCapturesTheMoment
     * @tc.desc   A snapshot taken mid-run does not follow later progress writes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('taskSnapshotCapturesTheMoment', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(1);
      task.reportProgress(40);
      const snapshot: RunSnapshot = task.snapshot();
      task.reportProgress(80);
      expect(snapshot.progress).assertEqual(40);
      expect(snapshot.status).assertEqual('running');
      expect(snapshot.taskNo).assertEqual(TASK_A);
      expect(task.progress).assertEqual(80);
      expect(snapshot.sameAs(task.snapshot())).assertFalse();
    });

    /**
     * @tc.name   snapshotLogKeepsTheLatestPerTask
     * @tc.desc   SnapshotLog.latest returns the last capture for a task and skips unknown numbers.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('snapshotLogKeepsTheLatestPerTask', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      graph.startAll();
      (graph.taskByNo(TASK_A) as DownloadTask).reportProgress(70);
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(6);
      const latest: RunSnapshot = log.latest(TASK_A) as RunSnapshot;
      expect(latest.progress).assertEqual(70);
      expect(latest.status).assertEqual('running');
      expect(log.latest('Z')).assertUndefined();
      expect(log.trace().split('|').length).assertEqual(6);
    });

    /**
     * @tc.name   snapshotLogClearDropsEveryCapture
     * @tc.desc   A cleared log reports zero size and an empty trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotLogClearDropsEveryCapture', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(3);
      log.clear();
      expect(log.size()).assertEqual(0);
      expect(log.trace()).assertEqual('');
      expect(log.latest(TASK_A)).assertUndefined();
    });

    /**
     * @tc.name   configOperationForEachSeededTaskIsValid
     * @tc.desc   The create step of download() always yields a valid config for A, B and C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('configOperationForEachSeededTaskIsValid', 0, () => {
      const numbers: string[] = [TASK_A, TASK_B, TASK_C];
      let valid: number = 0;
      for (let index = 0; index < numbers.length; index++) {
        const config: DownloadConfig = DownloadConfig.forTask(numbers[index]);
        if (config.isValid()) {
          valid = valid + 1;
        }
        expect(config.fileName().endsWith('.png')).assertTrue();
      }
      expect(valid).assertEqual(3);
      expect(countOf(numbers, TASK_C)).assertEqual(1);
    });

    /**
     * @tc.name   configCloneOperationKeepsTheRequestEqual
     * @tc.desc   The clone used by retry paths carries the same request text.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('configCloneOperationKeepsTheRequestEqual', 0, () => {
      const config: DownloadConfig = DownloadConfig.forTask(TASK_C);
      const copy: DownloadConfig = config.clone();
      expect(copy.describe()).assertEqual(config.describe());
      expect(copy.sameAs(config)).assertTrue();
      copy.saveas = './retry';
      expect(copy.isValid()).assertFalse();
      expect(config.isValid()).assertTrue();
    });

    /**
     * @tc.name   networkMetricsAggregatesAnIdleGraph
     * @tc.desc   The metrics helper reports three tasks, no completion and zero progress at seed time.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('networkMetricsAggregatesAnIdleGraph', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      expect(metrics.totalTasks).assertEqual(3);
      expect(metrics.completedTasks).assertEqual(0);
      expect(metrics.failedTasks).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.averageProgress()).assertEqual(0);
    });

    /**
     * @tc.name   networkMetricsAggregatesAFinishedGraph
     * @tc.desc   After a full run the metrics report a success ratio of one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('networkMetricsAggregatesAFinishedGraph', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.completeTaskC();
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      expect(metrics.totalTasks).assertEqual(3);
      expect(metrics.completedTasks).assertEqual(3);
      expect(metrics.totalProgress).assertEqual(300);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.fingerprint()).assertLarger(0);
    });

    /**
     * @tc.name   graphRunningCountTracksEveryTransition
     * @tc.desc   runningCount goes 0 -> 2 -> 1 -> 0 across the shared phase.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphRunningCountTracksEveryTransition', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.runningCount()).assertEqual(0);
      graph.startAll();
      expect(graph.runningCount()).assertEqual(2);
      graph.completeTask(TASK_A);
      expect(graph.runningCount()).assertEqual(1);
      graph.completeTask(TASK_B);
      expect(graph.runningCount()).assertEqual(0);
      graph.runTaskCIfReady(1);
      expect(graph.runningCount()).assertEqual(1);
    });

    /**
     * @tc.name   graphTotalProgressSumsTheThreeBars
     * @tc.desc   totalProgress is the arithmetic sum and averageProgress divides it by three.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphTotalProgressSumsTheThreeBars', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      (graph.taskAt(0) as DownloadTask).reportProgress(30);
      (graph.taskAt(1) as DownloadTask).reportProgress(60);
      (graph.taskAt(2) as DownloadTask).reportProgress(90);
      expect(graph.totalProgress()).assertEqual(180);
      expect(graph.averageProgress()).assertEqual(60);
      graph.completeTask(TASK_C);
      expect(graph.totalProgress()).assertEqual(190);
      expect(graph.averageProgress()).assertEqual(190.0 / 3);
    });

    /**
     * @tc.name   taskAtHandlesBoundaryIndexesWithoutThrowing
     * @tc.desc   The clamped accessor answers for every index near the array bounds.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('taskAtHandlesBoundaryIndexesWithoutThrowing', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const indexes: number[] = [-7, -1, 0, 1, 2, 3, 9];
      const names: string[] = [];
      for (let index = 0; index < indexes.length; index++) {
        names.push(graph.taskAt(indexes[index]).taskNo);
      }
      expect(joined(names, ',')).assertEqual('A,A,A,B,C,C,C');
      expect(names.length).assertEqual(7);
      expect(graph.taskAt(2) === graph.taskAt(9)).assertTrue();
    });

    /**
     * @tc.name   completeTaskUnknownLeavesASeededRunUntouched
     * @tc.desc   Even mid-run, the unknown branch preserves running flags, progress and holders.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('completeTaskUnknownLeavesASeededRunUntouched', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      (graph.taskByNo(TASK_A) as DownloadTask).reportProgress(25);
      const snapshot: string = graph.snapshotText();
      expect(graph.completeTask('Q', 10)).assertFalse();
      expect(graph.snapshotText()).assertEqual(snapshot);
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(graph.completionOrder.length).assertEqual(0);
    });

    /**
     * @tc.name   completeTaskCOnAnIdleGraphRecordsTheCompletion
     * @tc.desc   The isolated C completion does not require a running C nor a poll.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('completeTaskCOnAnIdleGraphRecordsTheCompletion', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.completeTaskC(77)).assertTrue();
      const task: DownloadTask = graph.taskByNo(TASK_C) as DownloadTask;
      expect(task.finishedAt).assertEqual(77);
      expect(task.progress).assertEqual(100);
      expect(graph.completionOrder[0]).assertEqual(TASK_C);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      logStep('CoreOperations', graph.eventTrace());
    });

    /**
     * @tc.name   pollTickUsesTheSuppliedClockForStartedAt
     * @tc.desc   The start timestamp of C equals the tick value passed by the caller.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('pollTickUsesTheSuppliedClockForStartedAt', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 100);
      graph.completeTask(TASK_B, 150);
      expect(graph.pollTick(350)).assertTrue();
      const c: DownloadTask = graph.taskByNo(TASK_C) as DownloadTask;
      expect(c.startedAt).assertEqual(350);
      expect(c.attempts).assertEqual(1);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.totalProgress()).assertEqual(200);
    });

    /**
     * @tc.name   startAllIsTheOnlyOperationThatClearsTheFinishFlag
     * @tc.desc   A manual completion never flips isTaskFinished, and startAll cannot resurrect a finished task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('startAllIsTheOnlyOperationThatClearsTheFinishFlag', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.completeTaskC();
      expect(graph.isTaskFinished).assertTrue();
      graph.startAll();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.allCompleted()).assertTrue();
    });
    /**
     * @tc.name   eventRecorderDetailKeepsTheTaskNumber
     * @tc.desc   A completion entry is kind:taskNo, so the audit trail names the task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventRecorderDetailKeepsTheTaskNumber', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.completeTask(TASK_B, 1);
      graph.completeTask(TASK_A, 2);
      expect(graph.events.entries[0]).assertEqual('completed:B');
      expect(graph.events.entries[1]).assertEqual('completed:A');
      expect(graph.events.countOf('completed')).assertEqual(2);
      expect(graph.events.last()).assertEqual('unlocked:C');
    });

    /**
     * @tc.name   idleTaskReportKeepsZeroAndAcceptsTheFirstValue
     * @tc.desc   An idle task can report progress before start without changing status.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('idleTaskReportKeepsZeroAndAcceptsTheFirstValue', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      expect(task.reportProgress(0)).assertEqual(0);
      expect(task.reportProgress(15)).assertEqual(15);
      expect(task.status).assertEqual('idle');
      expect(task.isIdle()).assertTrue();
      expect(task.attempts).assertEqual(0);
    });

    /**
     * @tc.name   graphTaskAtExposesTheSameInstanceAsTaskByNo
     * @tc.desc   Both accessors share one array, so a mutation through either is visible.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('graphTaskAtExposesTheSameInstanceAsTaskByNo', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const byIndex: DownloadTask = graph.taskAt(1);
      const byNumber: DownloadTask = graph.taskByNo(TASK_B) as DownloadTask;
      expect(byIndex === byNumber).assertTrue();
      byIndex.reportProgress(55);
      expect(byNumber.progress).assertEqual(55);
      expect(graph.taskAt(1).progress).assertEqual(55);
    });
    /**
     * @tc.name   pollIntervalConstantMatchesTheTimerArm
     * @tc.desc   The only poll interval used by the operations is 200 ms.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreOperations scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pollIntervalConstantMatchesTheTimerArm', 0, () => {
      expect(POLL_INTERVAL_MS).assertEqual(200);
      expect(POLL_INTERVAL_MS > 0).assertTrue();
      expect(POLL_INTERVAL_MS % 20).assertEqual(0);
    });
  });
}
