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
 * ExceptionHandling suite.
 *
 * Feeds the shared model the malformed sequences a device can produce: an
 * unknown task number, a duplicated completion callback, a start while tasks
 * already run, a poll after the interval was cleared and a C completion before
 * the gate opened. Every call must return a defined value and leave the graph
 * coherent, which is what the page relies on when callbacks race.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   68-76    updateProgress ignores any task literal other than A, B or C
 *   79-95    the three completion entry points are independent callbacks
 *   98-107   checkAndUnlock and canRunTaskC read only the two booleans
 *   119-128  onCompleted can fire twice for one request in a retry storm
 *   188-196  the interval body may run after clearInterval has been issued
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  PROGRESS_TOTAL,
  STATUS_IDLE,
  STATUS_COMPLETED,
  STATUS_FAILED,
  ERROR_NETWORK,
  DownloadTask,
  RunSnapshot,
  SnapshotLog,
  DependencyLock,
  TaskGraph,
  createTaskGraph,
  completionTrace
} from '../Shared/SharedDriver';

export default function exceptionHandlingTest(): void {
  describe('ExceptionHandling', () => {
    beforeAll(() => {
      logSuite('ExceptionHandling', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('ExceptionHandling', 'end');
    });

    /**
     * @tc.name   unknownTaskCompletionReturnsFalse
     * @tc.desc   Completing a task number the graph does not own reports failure instead of throwing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('unknownTaskCompletionReturnsFalse', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const result: boolean = graph.completeTask('Z', 10);
      expect(result).assertFalse();
      expect(result === false).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(graph.completionOrder.length).assertEqual(0);
    });

    /**
     * @tc.name   unknownTaskCompletionLeavesHistoryEmpty
     * @tc.desc   A rejected unknown completion writes no event, no order entry and no progress change.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('unknownTaskCompletionLeavesHistoryEmpty', 0, () => {
      logStep('ExceptionHandling', 'unknown task completion');
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const sizeBefore: number = graph.events.size();
      graph.completeTask('D', 5);
      expect(graph.events.size()).assertEqual(sizeBefore);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(completionTrace(graph)).assertEqual('');
      expect(graph.taskAt(0).progress).assertEqual(0);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
    });

    /**
     * @tc.name   taskLookupOfUnknownNumberIsUndefined
     * @tc.desc   taskByNo returns undefined for an unknown number so callers can branch instead of crashing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskLookupOfUnknownNumberIsUndefined', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const missing: DownloadTask | undefined = graph.taskByNo('X');
      const known: DownloadTask | undefined = graph.taskByNo(TASK_C);
      expect(missing === undefined).assertTrue();
      expect(known !== undefined).assertTrue();
      if (known !== undefined) {
        expect(known.taskNo).assertEqual(TASK_C);
      }
      expect(graph.tasks.length).assertEqual(3);
    });

    /**
     * @tc.name   taskAtClampsOutOfRangeIndexes
     * @tc.desc   taskAt bounds its index, so a negative or oversized index still yields a real row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskAtClampsOutOfRangeIndexes', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const low: DownloadTask = graph.taskAt(-4);
      const high: DownloadTask = graph.taskAt(99);
      expect(low.taskNo).assertEqual(TASK_A);
      expect(high.taskNo).assertEqual(TASK_C);
      expect(graph.taskAt(1).taskNo).assertEqual(TASK_B);
      expect(graph.taskAt(3).taskNo).assertEqual(TASK_C);
    });

    /**
     * @tc.name   duplicateCompletionOfTaskAIsRejected
     * @tc.desc   The second completion of A returns false and records no second completed event.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('duplicateCompletionOfTaskAIsRejected', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const first: boolean = graph.completeTask(TASK_A, 10);
      const second: boolean = graph.completeTask(TASK_A, 20);
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.taskAt(0).finishedAt).assertEqual(10);
    });

    /**
     * @tc.name   duplicateCompletionOfTaskCDoesNotReleaseTwice
     * @tc.desc   A repeated C callback cannot free a lock the row no longer owns.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateCompletionOfTaskCDoesNotReleaseTwice', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      const first: boolean = graph.completeTaskC(4);
      const second: boolean = graph.completeTaskC(5);
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.taskAt(2).finishedAt).assertEqual(4);
    });

    /**
     * @tc.name   startWhileRunningIsRefusedWithoutMutation
     * @tc.desc   A start issued from a second tap is rejected and changes neither the rows nor the lock.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startWhileRunningIsRefusedWithoutMutation', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const accepted: boolean = graph.startAll();
      const refused: boolean = graph.startAll();
      expect(accepted).assertTrue();
      expect(refused).assertFalse();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.lock.acquisitions).assertEqual(2);
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
    });

    /**
     * @tc.name   startRefusedAfterRunFinished
     * @tc.desc   Even when all rows are complete the flag keeps the button disabled, so start stays refused.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startRefusedAfterRunFinished', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      const refused: boolean = graph.startAll();
      expect(refused).assertFalse();
      expect(graph.allCompleted()).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
    });

    /**
     * @tc.name   completedRowRestartIsRejected
     * @tc.desc   start() on a completed row returns false and does not bump the attempt counter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completedRowRestartIsRejected', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B, 10);
      const b: DownloadTask = graph.taskAt(1);
      const restarted: boolean = b.start(20);
      expect(restarted).assertFalse();
      expect(b.attempts).assertEqual(1);
      expect(b.status).assertEqual(STATUS_COMPLETED);
      expect(b.startedAt).assertEqual(0);
      expect(b.finishedAt).assertEqual(10);
    });

    /**
     * @tc.name   failedRowRestartIsRejected
     * @tc.desc   A failed row is terminal for start(), which keeps the retry decision in the policy layer.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedRowRestartIsRejected', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      a.fail(ERROR_NETWORK);
      const restarted: boolean = a.start(30);
      expect(restarted).assertFalse();
      expect(a.status).assertEqual(STATUS_FAILED);
      expect(a.attempts).assertEqual(1);
      expect(a.lastErrorCode).assertEqual(ERROR_NETWORK);
      expect(graph.runningCount()).assertEqual(1);
    });

    /**
     * @tc.name   pollWhileInactiveReturnsFalseButAdvancesCounter
     * @tc.desc   A poll fired with no running interval is harmless: it reports false yet counts the call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollWhileInactiveReturnsFalseButAdvancesCounter', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const first: boolean = graph.pollTick(200);
      const second: boolean = graph.pollTick(400);
      expect(first).assertFalse();
      expect(second).assertFalse();
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.timerActive).assertFalse();
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.events.size()).assertEqual(0);
    });

    /**
     * @tc.name   pollBeforeStartNeverStartsTaskC
     * @tc.desc   Polling a graph that was never started leaves all three rows idle and the gate closed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pollBeforeStartNeverStartsTaskC', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      for (let round = 0; round < 5; round++) {
        expect(graph.pollTick(round * 200)).assertFalse();
      }
      expect(graph.pollTicks).assertEqual(5);
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.events.countOf('started')).assertEqual(0);
    });

    /**
     * @tc.name   pollAfterTimerClearedDoesNotStartSecondTaskC
     * @tc.desc   A stale interval callback after clearInterval cannot start a second exclusive C run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollAfterTimerClearedDoesNotStartSecondTaskC', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      expect(graph.pollTick(3)).assertTrue();
      const stale: boolean = graph.pollTick(203);
      expect(stale).assertFalse();
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.taskAt(2).startedAt).assertEqual(3);
      expect(graph.lock.acquisitions).assertEqual(3);
    });

    /**
     * @tc.name   taskCCompletedBeforeUnlockKeepsItsRowFinished
     * @tc.desc   An early C callback writes the row and the order entry even though the gate was still shut.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskCCompletedBeforeUnlockKeepsItsRowFinished', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const early: boolean = graph.completeTaskC(50);
      expect(early).assertTrue();
      expect(graph.taskAt(2).status).assertEqual(STATUS_COMPLETED);
      expect(graph.taskAt(2).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(2).finishedAt).assertEqual(50);
      expect(completionTrace(graph)).assertEqual('C');
    });

    /**
     * @tc.name   taskCCompletedBeforeUnlockLeavesGateClosed
     * @tc.desc   Finishing C early does not satisfy the A and B predicate, so the gate stays closed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskCCompletedBeforeUnlockLeavesGateClosed', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTaskC(50);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   earlyTaskCCompletionSurvivesGateOpeningWithoutRestart
     * @tc.desc   Once C is finished the poll cannot start it again, so the interval keeps ticking harmlessly.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('earlyTaskCCompletionSurvivesGateOpeningWithoutRestart', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTaskC(50);
      graph.completeTask(TASK_A, 60);
      graph.completeTask(TASK_B, 70);
      const started: boolean = graph.pollTick(270);
      expect(started).assertFalse();
      expect(graph.taskAt(2).startedAt).assertEqual(0);
      expect(graph.taskAt(2).finishedAt).assertEqual(50);
      expect(graph.timerActive).assertTrue();
      expect(graph.allCompleted()).assertTrue();
    });

    /**
     * @tc.name   exclusiveStartBeforeGateReturnsFalse
     * @tc.desc   The direct C entry point refuses to run while the shared prerequisites still hold the lock.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('exclusiveStartBeforeGateReturnsFalse', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.runTaskCIfReady(10)).assertFalse();
      graph.completeTask(TASK_A, 20);
      expect(graph.runTaskCIfReady(30)).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   exclusiveStartTwiceRunsTaskCOnlyOnce
     * @tc.desc   The second direct start finds C already running and returns false without a second acquisition.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('exclusiveStartTwiceRunsTaskCOnlyOnce', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      const first: boolean = graph.runTaskCIfReady(3);
      const second: boolean = graph.runTaskCIfReady(4);
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.lock.acquisitions).assertEqual(3);
      expect(graph.taskAt(2).startedAt).assertEqual(3);
      expect(graph.timerActive).assertFalse();
    });

    /**
     * @tc.name   secondExclusiveOwnerIsRejectedByTheLock
     * @tc.desc   While C owns the exclusive slot another exclusive request is refused and counted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('secondExclusiveOwnerIsRejectedByTheLock', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      const foreign: boolean = lock.acquireExclusive(TASK_A);
      expect(foreign).assertFalse();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.rejections).assertEqual(1);
      expect(lock.waitingExclusive).assertTrue();
      expect(lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   sharedAcquireAfterExclusiveReleaseSucceeds
     * @tc.desc   A shared request recovers only after the exclusive owner releases, mirroring the retry path.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sharedAcquireAfterExclusiveReleaseSucceeds', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      expect(lock.acquireShared(TASK_A)).assertFalse();
      expect(lock.releaseExclusive(TASK_C)).assertTrue();
      expect(lock.acquireShared(TASK_A)).assertTrue();
      expect(lock.hasShared(TASK_A)).assertTrue();
      expect(lock.rejections).assertEqual(1);
      expect(lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   releaseExclusiveOnFreeLockReturnsFalse
     * @tc.desc   Releasing an exclusive slot that was never taken reports false and keeps the lock free.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('releaseExclusiveOnFreeLockReturnsFalse', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      const released: boolean = lock.releaseExclusive(TASK_C);
      expect(released).assertFalse();
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.isUnlocked()).assertTrue();
      expect(lock.holderCount()).assertEqual(0);
      expect(lock.acquisitions).assertEqual(0);
    });

    /**
     * @tc.name   repeatedResetIsIdempotent
     * @tc.desc   Calling reset three times leaves exactly the state of a single reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedResetIsIdempotent', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.reset();
      graph.reset();
      graph.reset();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.snapshotText()).assertEqual('A:idle:0|B:idle:0|C:idle:0');
    });

    /**
     * @tc.name   startAfterResetIsAcceptedAgain
     * @tc.desc   Reset re-enables the start path, so the next startAll returns true and reacquires two slots.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startAfterResetIsAcceptedAgain', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.startAll()).assertFalse();
      graph.reset();
      const accepted: boolean = graph.startAll();
      expect(accepted).assertTrue();
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.lock.acquisitions).assertEqual(2);
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(graph.events.countOf('start-all')).assertEqual(1);
    });

    /**
     * @tc.name   completionFromIdleRowIsAccepted
     * @tc.desc   A completion callback that beats the start callback still finishes the row without throwing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('completionFromIdleRowIsAccepted', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const a: DownloadTask = graph.taskAt(0);
      const done: boolean = graph.completeTask(TASK_A, 33);
      expect(done).assertTrue();
      expect(a.status).assertEqual(STATUS_COMPLETED);
      expect(a.progress).assertEqual(PROGRESS_TOTAL);
      expect(a.finishedAt).assertEqual(33);
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.canRunTaskC()).assertFalse();
    });

    /**
     * @tc.name   progressReportOnIdleRowIsAccepted
     * @tc.desc   An idle row is not terminal, so an early progress callback is stored and bounded normally.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressReportOnIdleRowIsAccepted', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const b: DownloadTask = graph.taskAt(1);
      expect(b.isIdle()).assertTrue();
      expect(b.reportProgress(45)).assertEqual(45);
      expect(b.reportProgress(500)).assertEqual(PROGRESS_TOTAL);
      expect(b.reportProgress(3)).assertEqual(PROGRESS_TOTAL);
      expect(b.progress).assertEqual(100);
      expect(b.status).assertEqual(STATUS_IDLE);
    });

    /**
     * @tc.name   unknownSnapshotLookupIsUndefined
     * @tc.desc   A snapshot log queried for an unknown row returns undefined rather than a fabricated entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unknownSnapshotLookupIsUndefined', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      const missing: RunSnapshot | undefined = log.latest('Q');
      expect(missing === undefined).assertTrue();
      expect(log.size()).assertEqual(3);
      expect(log.latest(TASK_A) !== undefined).assertTrue();
      expect(log.trace().split('|').length).assertEqual(3);
    });

    /**
     * @tc.name   guardedCallsReturnDefinedFlags
     * @tc.desc   A mixed batch of invalid operations each returns a defined boolean and never leaves a half state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('guardedCallsReturnDefinedFlags', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const results: boolean[] = [];
      results.push(graph.completeTask('nope', 1));
      results.push(graph.pollTick(2));
      results.push(graph.runTaskCIfReady(3));
      results.push(graph.startAll());
      results.push(graph.startAll());
      expect(results.length).assertEqual(5);
      expect(results[0]).assertFalse();
      expect(results[1]).assertFalse();
      expect(results[2]).assertFalse();
      expect(results[3]).assertTrue();
      expect(results[4]).assertFalse();
    });

    /**
     * @tc.name   repeatedResetKeepsTraceEmpty
     * @tc.desc   Reset is safe to call on an already clean graph and never resurrects old entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedResetKeepsTraceEmpty', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.reset();
      const afterFirst: string = graph.eventTrace();
      graph.reset();
      expect(afterFirst).assertEqual('');
      expect(graph.eventTrace()).assertEqual('');
      expect(graph.events.countOf('completed')).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(completionTrace(graph)).assertEqual('');
    });

    /**
     * @tc.name   snapshotAfterResetShowsIdleRows
     * @tc.desc   A capture taken after reset stores three idle entries with zero progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotAfterResetShowsIdleRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.reset();
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(3);
      expect(log.trace()).assertEqual('A/idle/0|B/idle/0|C/idle/0');
      const c: RunSnapshot | undefined = log.latest(TASK_C);
      expect(c !== undefined).assertTrue();
      if (c !== undefined) {
        expect(c.status).assertEqual(STATUS_IDLE);
      }
    });

    /**
     * @tc.name   completionOrderIgnoresRejectedCallbacks
     * @tc.desc   Only accepted completions enter the order, so duplicates and unknown numbers leave no trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completionOrderIgnoresRejectedCallbacks', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.completeTask(TASK_A, 1)).assertTrue();
      expect(graph.completeTask(TASK_A, 2)).assertFalse();
      expect(graph.completeTask('?', 3)).assertFalse();
      expect(graph.completeTask(TASK_B, 4)).assertTrue();
      graph.pollTick(5);
      expect(graph.completeTaskC(6)).assertTrue();
      expect(completionTrace(graph)).assertEqual('A|B|C');
      expect(graph.completionOrder.length).assertEqual(3);
    });

    /**
     * @tc.name   taskNumbersAreUniqueAndStable
     * @tc.desc   The graph owns exactly A, B and C once each, so a callback can never be ambiguous.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskNumbersAreUniqueAndStable', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const numbers: string[] = [];
      for (let index = 0; index < graph.tasks.length; index++) {
        numbers.push(graph.taskAt(index).taskNo);
      }
      expect(numbers.length).assertEqual(3);
      expect(numbers[0] === numbers[1]).assertFalse();
      expect(numbers[1] === numbers[2]).assertFalse();
      expect(numbers[0] === numbers[2]).assertFalse();
      expect(numbers[0]).assertEqual(TASK_A);
      expect(numbers[2]).assertEqual(TASK_C);
    });

    /**
     * @tc.name   pollTicksSurviveCompletionUntilReset
     * @tc.desc   Completing the run does not clear the poll counter; only reset returns it to zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollTicksSurviveCompletionUntilReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      graph.pollTick(5);
      expect(graph.pollTicks).assertEqual(2);
      graph.reset();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.timerActive).assertFalse();
    });

    /**
     * @tc.name   progressAfterResetRestartsFromZero
     * @tc.desc   A report of 60 before reset leaves no residue: the next report of 20 stores 20.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressAfterResetRestartsFromZero', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(60);
      graph.reset();
      expect(graph.taskAt(0).progress).assertEqual(0);
      const fresh: number = graph.taskAt(0).reportProgress(20);
      expect(fresh).assertEqual(20);
      expect(graph.taskAt(0).progress).assertEqual(20);
      expect(graph.taskAt(0).isIdle()).assertTrue();
      expect(graph.totalProgress()).assertEqual(20);
    });

    /**
     * @tc.name   duplicateCompletionKeepsFirstFinishTimestamp
     * @tc.desc   A repeated callback is rejected before it can overwrite the timestamp of the first completion.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateCompletionKeepsFirstFinishTimestamp', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B, 111);
      graph.completeTask(TASK_B, 999);
      expect(graph.taskAt(1).finishedAt).assertEqual(111);
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.taskAt(1).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.isTaskFinished).assertFalse();
    });

    /**
     * @tc.name   allCompletedFalseWhenOnlyTaskCIsDone
     * @tc.desc   An early finished C alone cannot satisfy the three-row aggregate flag.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('allCompletedFalseWhenOnlyTaskCIsDone', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTaskC(10);
      expect(graph.taskAt(2).isComplete()).assertTrue();
      expect(graph.allCompleted()).assertFalse();
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.taskAt(0).isComplete()).assertFalse();
      expect(graph.taskAt(1).isComplete()).assertFalse();
    });

    /**
     * @tc.name   timestampDefaultsRemainZeroForUntouchedRows
     * @tc.desc   Rows that never started keep both timestamps at zero while a sibling finishes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('timestampDefaultsRemainZeroForUntouchedRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.completeTask(TASK_A, 500);
      expect(graph.taskAt(0).finishedAt).assertEqual(500);
      expect(graph.taskAt(0).startedAt).assertEqual(0);
      expect(graph.taskAt(1).finishedAt).assertEqual(0);
      expect(graph.taskAt(2).startedAt).assertEqual(0);
      expect(graph.taskAt(2).finishedAt).assertEqual(0);
    });

    /**
     * @tc.name   unknownTaskCompletionAfterRunIsStillRejected
     * @tc.desc   Even on a finished graph an unknown task number cannot add an order entry or event.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unknownTaskCompletionAfterRunIsStillRejected', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      const sizeBefore: number = graph.events.size();
      const rejected: boolean = graph.completeTask('dup', 5);
      expect(rejected).assertFalse();
      expect(graph.events.size()).assertEqual(sizeBefore);
      expect(completionTrace(graph)).assertEqual('A|B|C');
      expect(graph.allCompleted()).assertTrue();
    });

    /**
     * @tc.name   doubleCompletionOfTaskBKeepsSingleUnlock
     * @tc.desc   Repeating B after the gate opened cannot announce the unlock a second time.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('doubleCompletionOfTaskBKeepsSingleUnlock', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      const duplicate: boolean = graph.completeTask(TASK_B, 3);
      expect(duplicate).assertFalse();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   pollAfterResetDoesNotRestartTheOldRun
     * @tc.desc   A tick that arrives after reset sees an inactive timer and leaves every row idle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollAfterResetDoesNotRestartTheOldRun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.reset();
      const stale: boolean = graph.pollTick(700);
      expect(stale).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.events.size()).assertEqual(0);
    });

    /**
     * @tc.name   failedRowLabelKeepsFrozenProgress
     * @tc.desc   The rendered label of a failed row reports the value frozen at failure, not zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedRowLabelKeepsFrozenProgress', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      a.reportProgress(40);
      a.fail(ERROR_NETWORK);
      expect(a.label()).assertEqual('任务A当前进度 40%');
      expect(a.describe()).assertEqual('A:failed:40');
      expect(a.progressRatio()).assertEqual(0.4);
      expect(a.status).assertEqual(STATUS_FAILED);
    });

    /**
     * @tc.name   failedQueuedTaskCBlocksItsOwnStart
     * @tc.desc   A C row that failed while queued is no longer idle, so the poll keeps the run unfinished.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failedQueuedTaskCBlocksItsOwnStart', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(2).fail(ERROR_NETWORK);
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      const started: boolean = graph.pollTick(3);
      expect(started).assertFalse();
      expect(graph.taskAt(2).status).assertEqual(STATUS_FAILED);
      expect(graph.timerActive).assertTrue();
      expect(graph.allCompleted()).assertFalse();
      expect(graph.events.countOf('started')).assertEqual(2);
    });

    /**
     * @tc.name   resetClearsFinishedTimestampsOfAllRows
     * @tc.desc   Reset erases both stamps on every row, including the prerequisite that finished first.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetClearsFinishedTimestampsOfAllRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 11);
      graph.completeTask(TASK_B, 22);
      graph.pollTick(33);
      graph.completeTaskC(44);
      graph.reset();
      expect(graph.taskAt(0).finishedAt).assertEqual(0);
      expect(graph.taskAt(1).finishedAt).assertEqual(0);
      expect(graph.taskAt(2).startedAt).assertEqual(0);
      expect(graph.taskAt(2).finishedAt).assertEqual(0);
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   taskLookupIsCaseSensitive
     * @tc.desc   Only the upper case literals A, B and C resolve; a lower case variant is an unknown task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskLookupIsCaseSensitive', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const lower: DownloadTask | undefined = graph.taskByNo('a');
      const upper: DownloadTask | undefined = graph.taskByNo('A');
      expect(lower === undefined).assertTrue();
      expect(upper !== undefined).assertTrue();
      expect(graph.completeTask('a', 10)).assertFalse();
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   captureOfAnEmptyTaskListStoresNothing
     * @tc.desc   Capturing an empty row list is a defined no-op that leaves the log empty and usable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('captureOfAnEmptyTaskListStoresNothing', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      const empty: DownloadTask[] = [];
      log.capture(empty);
      expect(log.size()).assertEqual(0);
      expect(log.trace()).assertEqual('');
      expect(log.latest(TASK_A) === undefined).assertTrue();
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(3);
      expect(log.snapshots.length).assertEqual(3);
    });

    /**
     * @tc.name   duplicateSharedReleaseIsRejected
     * @tc.desc   Releasing the same shared slot twice frees it once and refuses the second call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateSharedReleaseIsRejected', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_B);
      const first: boolean = lock.releaseShared(TASK_B);
      const second: boolean = lock.releaseShared(TASK_B);
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(lock.holderCount()).assertEqual(0);
      expect(lock.acquisitions).assertEqual(1);
      expect(lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   pollsBeforeStartSurviveIntoTheNextRun
     * @tc.desc   Ticks collected while the graph was idle are kept, so a later rejected press quotes them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ExceptionHandling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('pollsBeforeStartSurviveIntoTheNextRun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      for (let round = 0; round < 3; round++) {
        expect(graph.pollTick(round * 200)).assertFalse();
      }
      expect(graph.pollTicks).assertEqual(3);
      expect(graph.startAll()).assertTrue();
      expect(graph.pollTicks).assertEqual(3);
      expect(graph.startAll()).assertFalse();
      expect(graph.events.last()).assertEqual('start-rejected:3');
    });
  });
}
