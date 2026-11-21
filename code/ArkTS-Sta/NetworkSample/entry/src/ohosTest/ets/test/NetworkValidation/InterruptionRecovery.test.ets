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
 * InterruptionRecovery suite.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   62-64    lock / taskACompleted / taskBCompleted
 *   79-95    completeTaskA / completeTaskB / completeTaskC
 *   98-102   checkAndUnlock waits for both shared tasks
 *   105-107  canRunTaskC returns !lock
 *   188-196  poll every 200 ms, start C, clear the interval
 *   661-830  TaskGraph, ReferenceGraph and PollClock models
 *   877-907  RetryPolicy: completed guard, attempt bound, delay growth
 *
 * The suite interrupts the dependency flow at every point: before any poll,
 * after a single shared task, between the two completions, after a failure,
 * after the attempt budget is spent and after a hard reset. The reference
 * graph keeps an independent boolean oracle so the comparison cases cannot
 * agree with a broken implementation.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  PROGRESS_TOTAL,
  POLL_INTERVAL_MS,
  STATUS_IDLE,
  STATUS_RUNNING,
  STATUS_COMPLETED,
  STATUS_FAILED,
  ERROR_NONE,
  ERROR_CREATE,
  ERROR_START,
  ERROR_NETWORK,
  ERROR_TIMEOUT,
  TaskGraph,
  ReferenceGraph,
  RetryPolicy,
  PollClock,
  DownloadTask,
  createTaskGraph,
  expectedGateOpen,
  completionTrace,
  isTopologicalCompletion,
  classifyStartResult,
  shouldAbortStart,
  isRetryableError,
  countOf,
  joined
} from '../Shared/SharedDriver';

export default function interruptionRecoveryTest(): void {
  describe('InterruptionRecovery', () => {
    let graph: TaskGraph = createTaskGraph();

    beforeAll(() => {
      logSuite('InterruptionRecovery', 'begin');
    });
    beforeEach(async () => {
      graph = createTaskGraph();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('InterruptionRecovery', 'end');
    });

    /**
     * @tc.name   freshGraphPollsWithoutUnlocking
     * @tc.desc   Three poll rounds before any completion leave all gate flags closed and task C idle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('freshGraphPollsWithoutUnlocking', 0, () => {
      expect(graph.startAll()).assertTrue();
      expect(graph.timerActive).assertTrue();
      let started: number = 0;
      for (let round = 0; round < 3; round++) {
        if (graph.pollTick(round * POLL_INTERVAL_MS)) {
          started = started + 1;
        }
      }
      logStep('freshGraphPollsWithoutUnlocking', String(graph.pollTicks));
      expect(started).assertEqual(0);
      expect(graph.pollTicks).assertEqual(3);
      expect(graph.taskByNo(TASK_C) !== undefined).assertTrue();
      expect((graph.taskByNo(TASK_C) as DownloadTask).isIdle()).assertTrue();
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.canRunTaskC()).assertFalse();
    });

    /**
     * @tc.name   pollAfterOnlyABeforeBKeepsGateClosed
     * @tc.desc   Completing only A leaves B running, so the poll cannot start C and keeps the timer.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pollAfterOnlyABeforeBKeepsGateClosed', 0, () => {
      graph.startAll();
      expect(graph.completeTask(TASK_A)).assertTrue();
      expect(graph.pollTick(POLL_INTERVAL_MS)).assertFalse();
      logStep('pollAfterOnlyABeforeBKeepsGateClosed', graph.eventTrace());
      expect(graph.taskAt(0).isComplete()).assertTrue();
      expect(graph.taskAt(1).isRunning()).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.timerActive).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
    });

    /**
     * @tc.name   pollAfterOnlyBBeforeAKeepsGateClosed
     * @tc.desc   Completing only B mirrors the A case: A still holds the shared lock and C stays queued.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pollAfterOnlyBBeforeAKeepsGateClosed', 0, () => {
      graph.startAll();
      expect(graph.completeTask(TASK_B)).assertTrue();
      expect(graph.pollTick(POLL_INTERVAL_MS)).assertFalse();
      logStep('pollAfterOnlyBBeforeAKeepsGateClosed', completionTrace(graph));
      expect(graph.taskAt(1).isComplete()).assertTrue();
      expect(graph.taskAt(0).isRunning()).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(completionTrace(graph)).assertEqual(TASK_B);
      expect(graph.lock.hasShared(TASK_A)).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.canRunTaskC()).assertFalse();
    });

    /**
     * @tc.name   completingBothThenPollStartsTaskC
     * @tc.desc   After A and B complete, the next poll acquires the exclusive lock and starts C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completingBothThenPollStartsTaskC', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.pollTick(POLL_INTERVAL_MS)).assertTrue();
      logStep('completingBothThenPollStartsTaskC', graph.taskAt(2).describe());
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.lock.isUnlocked()).assertFalse();
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(2);
      expect(graph.events.countOf('started')).assertEqual(3);
    });

    /**
     * @tc.name   pollTickStopsTimerAfterStartingC
     * @tc.desc   The poll clears the interval when C starts, so later ticks are inert.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pollTickStopsTimerAfterStartingC', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.pollTick()).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTick()).assertFalse();
      logStep('pollTickStopsTimerAfterStartingC', String(graph.events.countOf('timer-cleared')));
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.taskAt(2).status).assertEqual(STATUS_RUNNING);
    });

    /**
     * @tc.name   pollWithoutStartDoesNothing
     * @tc.desc   Polling before startAll finds no active timer and leaves every task idle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollWithoutStartDoesNothing', 0, () => {
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTick()).assertFalse();
      logStep('pollWithoutStartDoesNothing', String(graph.pollTicks));
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.allCompleted()).assertFalse();
      expect(graph.events.size()).assertEqual(0);
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.isTaskFinished).assertTrue();
    });

    /**
     * @tc.name   partialCompletionOnlyARecordsOneEntry
     * @tc.desc   An interrupted run that finishes A only records one completion and keeps B's lock.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('partialCompletionOnlyARecordsOneEntry', 0, () => {
      graph.startAll();
      expect(graph.completeTask(TASK_A)).assertTrue();
      logStep('partialCompletionOnlyARecordsOneEntry', completionTrace(graph));
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.completionOrder[0]).assertEqual(TASK_A);
      expect(completionTrace(graph)).assertEqual('A');
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(0).isComplete()).assertTrue();
      expect(graph.lock.hasShared(TASK_A)).assertFalse();
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(graph.events.countOf('completed')).assertEqual(1);
    });

    /**
     * @tc.name   partialCompletionOnlyBRecordsOneEntry
     * @tc.desc   An interrupted run that finishes B only records B and leaves A holding its share.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('partialCompletionOnlyBRecordsOneEntry', 0, () => {
      graph.startAll();
      expect(graph.completeTask(TASK_B)).assertTrue();
      logStep('partialCompletionOnlyBRecordsOneEntry', completionTrace(graph));
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.completionOrder[0]).assertEqual(TASK_B);
      expect(completionTrace(graph)).assertEqual('B');
      expect(graph.taskAt(1).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(1).isComplete()).assertTrue();
      expect(graph.taskAt(0).isRunning()).assertTrue();
      expect(graph.lock.hasShared(TASK_A)).assertTrue();
      expect(graph.lock.hasShared(TASK_B)).assertFalse();
      expect(graph.canRunTaskC()).assertFalse();
    });

    /**
     * @tc.name   resumeByCompletingBAfterAPoll
     * @tc.desc   After an interrupted poll with only A done, finishing B opens the gate on the next tick.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resumeByCompletingBAfterAPoll', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.pollTick()).assertFalse();
      expect(graph.completeTask(TASK_B)).assertTrue();
      expect(graph.pollTick()).assertTrue();
      logStep('resumeByCompletingBAfterAPoll', completionTrace(graph));
      expect(completionTrace(graph)).assertEqual('A|B');
      expect(isTopologicalCompletion(graph.completionOrder)).assertFalse();
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.timerActive).assertFalse();
    });

    /**
     * @tc.name   resumeByCompletingAAfterB
     * @tc.desc   The same recovery works in the opposite order: B first, then A, then the gate opens.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resumeByCompletingAAfterB', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_B);
      expect(graph.pollTick()).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.completeTask(TASK_A)).assertTrue();
      expect(graph.pollTick()).assertTrue();
      logStep('resumeByCompletingAAfterB', completionTrace(graph));
      expect(completionTrace(graph)).assertEqual('B|A');
      expect(graph.taskAt(0).isComplete()).assertTrue();
      expect(graph.taskAt(1).isComplete()).assertTrue();
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.taskAt(2).attempts).assertEqual(1);
    });

    /**
     * @tc.name   completingTaskATwiceIsRejected
     * @tc.desc   A duplicate onCompleted callback for A is ignored and does not duplicate the trace entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completingTaskATwiceIsRejected', 0, () => {
      graph.startAll();
      expect(graph.completeTask(TASK_A)).assertTrue();
      expect(graph.completeTask(TASK_A)).assertFalse();
      logStep('completingTaskATwiceIsRejected', String(graph.events.countOf('completed')));
      expect(graph.completionOrder.length).assertEqual(1);
      expect(countOf(graph.completionOrder, TASK_A)).assertEqual(1);
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.taskAt(0).isComplete()).assertTrue();
      expect(graph.lock.hasShared(TASK_A)).assertFalse();
      expect(graph.isTaskFinished).assertFalse();
    });

    /**
     * @tc.name   completingTaskCBeforeGateStaysIdle
     * @tc.desc   C cannot be run directly while A and B are still live, so the exclusive lock is untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completingTaskCBeforeGateStaysIdle', 0, () => {
      graph.startAll();
      expect(graph.runTaskCIfReady()).assertFalse();
      logStep('completingTaskCBeforeGateStaysIdle', graph.taskAt(2).status);
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(2).attempts).assertEqual(0);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   runTaskCIfReadyRequiresGateOpen
     * @tc.desc   With both dependencies done, a direct readiness call starts C and stops the interval.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runTaskCIfReadyRequiresGateOpen', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.runTaskCIfReady(500)).assertTrue();
      logStep('runTaskCIfReadyRequiresGateOpen', graph.taskAt(2).describe());
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.taskAt(2).startedAt).assertEqual(500);
      expect(graph.timerActive).assertFalse();
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.runTaskCIfReady()).assertFalse();
      expect(graph.taskAt(2).attempts).assertEqual(1);
    });

    /**
     * @tc.name   completedTaskCReleasesExclusiveLock
     * @tc.desc   Completing C releases the exclusive owner, closes every lock and finishes the trace A|B|C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completedTaskCReleasesExclusiveLock', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick();
      expect(graph.completeTaskC(900)).assertTrue();
      logStep('completedTaskCReleasesExclusiveLock', completionTrace(graph));
      expect(graph.taskAt(2).isComplete()).assertTrue();
      expect(graph.taskAt(2).finishedAt).assertEqual(900);
      expect(graph.taskAt(2).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(completionTrace(graph)).assertEqual('A|B|C');
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
    });

    /**
     * @tc.name   failedTaskCanBeRetriedAfterReset
     * @tc.desc   A network failure is terminal until reset(), after which the task can start a second attempt.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('failedTaskCanBeRetriedAfterReset', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, 'https://gitee.com/a/favor_list_tea.png');
      expect(task.start(10)).assertTrue();
      expect(task.fail(ERROR_NETWORK)).assertTrue();
      expect(task.start(20)).assertFalse();
      task.reset();
      logStep('failedTaskCanBeRetriedAfterReset', task.describe());
      expect(task.lastErrorCode).assertEqual(ERROR_NONE);
      expect(task.progress).assertEqual(0);
      expect(task.isIdle()).assertTrue();
      expect(task.start(30)).assertTrue();
      expect(task.attempts).assertEqual(2);
      expect(task.startedAt).assertEqual(30);
      expect(task.isRunning()).assertTrue();
    });

    /**
     * @tc.name   failureDoesNotBlockCompletion
     * @tc.desc   A late onCompleted callback may still complete a failed task; completion overwrites the failure.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failureDoesNotBlockCompletion', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, 'https://gitee.com/a/after_cache.png');
      task.start();
      task.fail(ERROR_TIMEOUT);
      expect(task.isFailed()).assertTrue();
      expect(task.complete(700)).assertTrue();
      logStep('failureDoesNotBlockCompletion', task.describe());
      expect(task.isComplete()).assertTrue();
      expect(task.isFailed()).assertFalse();
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(task.finishedAt).assertEqual(700);
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.lastErrorCode).assertEqual(ERROR_TIMEOUT);
    });

    /**
     * @tc.name   completedTaskRejectsFurtherProgress
     * @tc.desc   Once complete, progress callbacks are ignored and a failure cannot downgrade the status.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completedTaskRejectsFurtherProgress', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, 'https://gitee.com/a/icon_main_color.png');
      task.start();
      expect(task.reportProgress(40)).assertEqual(40);
      expect(task.complete()).assertTrue();
      expect(task.reportProgress(80)).assertEqual(PROGRESS_TOTAL);
      logStep('completedTaskRejectsFurtherProgress', task.describe());
      expect(task.reportProgress(10)).assertEqual(100);
      expect(task.fail(ERROR_START)).assertFalse();
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.progress).assertEqual(100);
      expect(task.progressRatio()).assertEqual(1);
    });

    /**
     * @tc.name   retryPolicyRetriesTransientErrorBelowLimit
     * @tc.desc   A transient network error is retried while the attempt counter is below the budget.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('retryPolicyRetriesTransientErrorBelowLimit', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(3, POLL_INTERVAL_MS);
      logStep('retryPolicyRetriesTransientErrorBelowLimit', String(policy.maxAttempts));
      expect(policy.shouldRetry(0, ERROR_NETWORK, STATUS_RUNNING)).assertTrue();
      expect(policy.shouldRetry(1, ERROR_NETWORK, STATUS_FAILED)).assertTrue();
      expect(policy.shouldRetry(2, ERROR_TIMEOUT, STATUS_FAILED)).assertTrue();
      expect(policy.shouldRetry(3, ERROR_NETWORK, STATUS_FAILED)).assertFalse();
      expect(policy.maxAttempts).assertEqual(3);
      expect(policy.baseDelayMs).assertEqual(200);
      expect(policy.isExhausted(2)).assertFalse();
      expect(policy.isExhausted(3)).assertTrue();
    });

    /**
     * @tc.name   retryPolicyStopsAtMaxAttempts
     * @tc.desc   The attempt budget is inclusive: at maxAttempts the policy refuses further retries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('retryPolicyStopsAtMaxAttempts', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(2, 100);
      logStep('retryPolicyStopsAtMaxAttempts', String(policy.shouldRetry(2, ERROR_NETWORK, STATUS_FAILED)));
      expect(policy.shouldRetry(1, ERROR_NETWORK, STATUS_FAILED)).assertTrue();
      expect(policy.shouldRetry(2, ERROR_NETWORK, STATUS_FAILED)).assertFalse();
      expect(policy.shouldRetry(5, ERROR_NETWORK, STATUS_FAILED)).assertFalse();
      expect(policy.isExhausted(2)).assertTrue();
      expect(policy.isExhausted(9)).assertTrue();
      expect(policy.isExhausted(1)).assertFalse();
      expect(policy.maxAttempts).assertEqual(2);
      expect(policy.baseDelayMs).assertEqual(100);
    });

    /**
     * @tc.name   retryPolicyNeverRetriesCompletedTask
     * @tc.desc   The completed guard fires before the error code is inspected, so completion always wins.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('retryPolicyNeverRetriesCompletedTask', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(5, 200);
      logStep('retryPolicyNeverRetriesCompletedTask', STATUS_COMPLETED);
      expect(policy.shouldRetry(0, ERROR_NETWORK, STATUS_COMPLETED)).assertFalse();
      expect(policy.shouldRetry(0, ERROR_NONE, STATUS_COMPLETED)).assertFalse();
      expect(policy.shouldRetry(4, ERROR_TIMEOUT, STATUS_COMPLETED)).assertFalse();
      expect(policy.shouldRetry(0, ERROR_NETWORK, STATUS_FAILED)).assertTrue();
      expect(policy.shouldRetry(0, ERROR_NETWORK, STATUS_COMPLETED) ===
        policy.shouldRetry(0, ERROR_NONE, STATUS_COMPLETED)).assertTrue();
      expect(policy.maxAttempts).assertEqual(5);
      expect(policy.isExhausted(0)).assertFalse();
      expect(policy.delayFor(0)).assertEqual(200);
    });

    /**
     * @tc.name   retryPolicySkipsZeroErrorCode
     * @tc.desc   A zero error code means success, so the policy refuses to retry it in any live status.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('retryPolicySkipsZeroErrorCode', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(4, 200);
      logStep('retryPolicySkipsZeroErrorCode', String(ERROR_NONE));
      expect(policy.shouldRetry(0, ERROR_NONE, STATUS_RUNNING)).assertFalse();
      expect(policy.shouldRetry(0, ERROR_NONE, STATUS_FAILED)).assertFalse();
      expect(policy.shouldRetry(1, ERROR_NONE, STATUS_IDLE)).assertFalse();
      expect(policy.shouldRetry(1, ERROR_START, STATUS_FAILED)).assertTrue();
      expect(policy.shouldRetry(0, ERROR_NONE, STATUS_RUNNING) === true).assertFalse();
      expect(ERROR_NONE).assertEqual(0);
      expect(policy.shouldRetry(0, ERROR_NONE, STATUS_RUNNING)).assertEqual(false);
    });

    /**
     * @tc.name   retryDelayGrowsLinearly
     * @tc.desc   The delay is baseDelayMs multiplied by the attempt number for every positive attempt.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('retryDelayGrowsLinearly', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(5, 200);
      logStep('retryDelayGrowsLinearly', String(policy.delayFor(3)));
      expect(policy.delayFor(1)).assertEqual(200);
      expect(policy.delayFor(2)).assertEqual(400);
      expect(policy.delayFor(3)).assertEqual(600);
      expect(policy.delayFor(4)).assertEqual(800);
      expect(policy.delayFor(3) > policy.delayFor(2)).assertTrue();
      expect(policy.delayFor(2) - policy.delayFor(1)).assertEqual(policy.baseDelayMs);
      expect(policy.delayFor(4) === 700).assertFalse();
      expect(policy.delayFor(5)).assertEqual(1000);
    });

    /**
     * @tc.name   retryDelayForZeroAttemptUsesBase
     * @tc.desc   Attempt zero and any negative attempt fall back to exactly one base delay.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('retryDelayForZeroAttemptUsesBase', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(3, 250);
      logStep('retryDelayForZeroAttemptUsesBase', String(policy.delayFor(0)));
      expect(policy.delayFor(0)).assertEqual(250);
      expect(policy.delayFor(-1)).assertEqual(250);
      expect(policy.delayFor(0)).assertEqual(policy.delayFor(-7));
      expect(policy.delayFor(0)).assertEqual(policy.baseDelayMs);
      expect(policy.delayFor(1)).assertEqual(policy.delayFor(0));
      expect(policy.delayFor(0) === 0).assertFalse();
      expect(policy.delayFor(0) > 0).assertTrue();
      expect(policy.baseDelayMs).assertEqual(250);
    });

    /**
     * @tc.name   retryableErrorCodesMatchPolicy
     * @tc.desc   Network, timeout and start failures are classified as retryable; a clean code is not.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('retryableErrorCodesMatchPolicy', 0, () => {
      logStep('retryableErrorCodesMatchPolicy', String(ERROR_NETWORK));
      expect(isRetryableError(ERROR_NETWORK)).assertTrue();
      expect(isRetryableError(ERROR_TIMEOUT)).assertTrue();
      expect(isRetryableError(ERROR_START)).assertTrue();
      expect(isRetryableError(ERROR_NONE)).assertFalse();
      expect(isRetryableError(ERROR_CREATE)).assertFalse();
      expect(ERROR_NETWORK).assertEqual(13400003);
      expect(ERROR_TIMEOUT).assertEqual(13400004);
      expect(isRetryableError(ERROR_NETWORK) === isRetryableError(ERROR_CREATE)).assertFalse();
    });

    /**
     * @tc.name   nonRetryableCreateErrorIsRejected
     * @tc.desc   A create failure is not retryable, even though the raw policy only checks for a non-zero code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('nonRetryableCreateErrorIsRejected', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(3, 200);
      logStep('nonRetryableCreateErrorIsRejected', String(ERROR_CREATE));
      expect(isRetryableError(ERROR_CREATE)).assertFalse();
      expect(policy.shouldRetry(0, ERROR_CREATE, STATUS_FAILED)).assertTrue();
      expect(isRetryableError(ERROR_CREATE) === policy.shouldRetry(0, ERROR_CREATE, STATUS_FAILED)).assertFalse();
      expect(ERROR_CREATE).assertEqual(13400001);
      expect(isRetryableError(0)).assertFalse();
      expect(policy.isExhausted(3)).assertTrue();
      expect(policy.delayFor(1)).assertEqual(200);
      expect(ERROR_CREATE < ERROR_START).assertTrue();
    });

    /**
     * @tc.name   graphResetRestoresGateAndIdleTasks
     * @tc.desc   A hard reset returns every task to idle, clears the locks and re-arms the start button.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphResetRestoresGateAndIdleTasks', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick();
      graph.reset();
      logStep('graphResetRestoresGateAndIdleTasks', graph.snapshotText());
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.allCompleted()).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.snapshotText()).assertEqual('A:idle:0|B:idle:0|C:idle:0');
    });

    /**
     * @tc.name   graphResetClearsEventsAndPollCounter
     * @tc.desc   Reset wipes the event recorder, the poll counter and the completion trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphResetClearsEventsAndPollCounter', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.pollTick();
      expect(graph.events.size() > 0).assertTrue();
      expect(graph.pollTicks).assertEqual(1);
      graph.reset();
      logStep('graphResetClearsEventsAndPollCounter', graph.eventTrace());
      expect(graph.events.size()).assertEqual(0);
      expect(graph.eventTrace()).assertEqual('');
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(completionTrace(graph)).assertEqual('');
      expect(graph.events.last()).assertEqual('');
      expect(graph.events.fingerprint()).assertEqual(graph.events.fingerprint());
    });

    /**
     * @tc.name   graphResetAllowsStartAgain
     * @tc.desc   After a completed run and a reset, the start button opens a fresh session successfully.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphResetAllowsStartAgain', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick();
      graph.completeTaskC();
      expect(graph.allCompleted()).assertTrue();
      graph.reset();
      expect(graph.startAll()).assertTrue();
      logStep('graphResetAllowsStartAgain', graph.eventTrace());
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.taskAt(0).isRunning()).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.pollTicks).assertEqual(0);
    });

    /**
     * @tc.name   graphResetAfterPartialCompletionClearsLocks
     * @tc.desc   A reset in the middle of a run releases the surviving shared lock and lowers progress to zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphResetAfterPartialCompletionClearsLocks', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      graph.reset();
      logStep('graphResetAfterPartialCompletionClearsLocks', String(graph.lock.holderCount()));
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.lock.hasShared(TASK_A)).assertFalse();
      expect(graph.lock.hasShared(TASK_B)).assertFalse();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.taskAt(0).progress).assertEqual(0);
      expect(graph.taskAt(0).isIdle()).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.events.countOf('started')).assertEqual(0);
    });

    /**
     * @tc.name   referenceGraphMatchesTaskGraphGate
     * @tc.desc   The independent boolean oracle opens in the same order and on the same round as the graph.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('referenceGraphMatchesTaskGraphGate', 0, () => {
      const reference: ReferenceGraph = new ReferenceGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      reference.markComplete(TASK_A);
      expect(graph.pollTick()).assertFalse();
      expect(reference.poll()).assertFalse();
      graph.completeTask(TASK_B);
      reference.markComplete(TASK_B);
      expect(graph.pollTick()).assertTrue();
      expect(reference.poll()).assertTrue();
      logStep('referenceGraphMatchesTaskGraphGate', reference.trace());
      expect(reference.unlocked()).assertTrue();
      expect(reference.cStarted).assertTrue();
      expect(reference.rounds).assertEqual(2);
      expect(reference.trace()).assertEqual('true,true,true,false');
      expect(expectedGateOpen(reference.aDone, reference.bDone)).assertTrue();
      expect(reference.rounds).assertEqual(graph.pollTicks);
    });

    /**
     * @tc.name   pollClockTicksAccumulateInterval
     * @tc.desc   Each clock tick advances the elapsed time by exactly one 200 ms interval.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pollClockTicksAccumulateInterval', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      expect(clock.tick()).assertEqual(200);
      expect(clock.tick()).assertEqual(400);
      expect(clock.tick()).assertEqual(600);
      logStep('pollClockTicksAccumulateInterval', String(clock.elapsedMs));
      expect(clock.ticks).assertEqual(3);
      expect(clock.elapsedMs).assertEqual(600);
      expect(clock.intervalMs).assertEqual(POLL_INTERVAL_MS);
      expect(clock.isDueAfter(3)).assertTrue();
      expect(clock.isDueAfter(4)).assertFalse();
      expect(clock.active).assertTrue();
    });

    /**
     * @tc.name   pollClockStoppedDoesNotAdvance
     * @tc.desc   After stop() a tick returns the frozen elapsed time and does not increase the tick count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollClockStoppedDoesNotAdvance', 0, () => {
      const clock: PollClock = new PollClock(100);
      clock.start();
      clock.tick();
      clock.tick();
      clock.stop();
      const frozen: number = clock.tick();
      logStep('pollClockStoppedDoesNotAdvance', String(frozen));
      expect(clock.active).assertFalse();
      expect(frozen).assertEqual(200);
      expect(clock.ticks).assertEqual(2);
      expect(clock.elapsedMs).assertEqual(200);
      expect(clock.isDueAfter(2)).assertTrue();
      expect(clock.isDueAfter(3)).assertFalse();
      expect(clock.intervalMs).assertEqual(100);
      expect(clock.tick()).assertEqual(frozen);
    });

    /**
     * @tc.name   classificationOfStartResultCodes
     * @tc.desc   A zero start code maps to started, every non-zero code maps to failed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('classificationOfStartResultCodes', 0, () => {
      logStep('classificationOfStartResultCodes', classifyStartResult(ERROR_NONE));
      expect(classifyStartResult(ERROR_NONE)).assertEqual('started');
      expect(classifyStartResult(ERROR_CREATE)).assertEqual('failed');
      expect(classifyStartResult(ERROR_START)).assertEqual('failed');
      expect(classifyStartResult(ERROR_NETWORK)).assertEqual('failed');
      expect(classifyStartResult(ERROR_TIMEOUT)).assertEqual('failed');
      expect(classifyStartResult(ERROR_NONE) === 'failed').assertFalse();
      expect(classifyStartResult(ERROR_START) === 'started').assertFalse();
      expect(classifyStartResult(ERROR_CREATE)).assertEqual(classifyStartResult(ERROR_TIMEOUT));
    });

    /**
     * @tc.name   shouldAbortStartOnlyOnNonZeroCode
     * @tc.desc   The page aborts the start callback only when the business error code is non-zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('shouldAbortStartOnlyOnNonZeroCode', 0, () => {
      logStep('shouldAbortStartOnlyOnNonZeroCode', String(shouldAbortStart(ERROR_NONE)));
      expect(shouldAbortStart(ERROR_NONE)).assertFalse();
      expect(shouldAbortStart(ERROR_CREATE)).assertTrue();
      expect(shouldAbortStart(ERROR_START)).assertTrue();
      expect(shouldAbortStart(-1)).assertTrue();
      expect(shouldAbortStart(ERROR_NONE) === true).assertFalse();
      expect(shouldAbortStart(ERROR_NONE)).assertEqual(!shouldAbortStart(ERROR_START));
      expect(shouldAbortStart(1)).assertEqual(shouldAbortStart(ERROR_CREATE));
      expect(ERROR_NONE).assertEqual(0);
    });

    /**
     * @tc.name   attemptCountIncreasesOnlyOnSuccessfulStart
     * @tc.desc   A refused second start leaves the attempt counter and the start timestamp unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('attemptCountIncreasesOnlyOnSuccessfulStart', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, 'https://gitee.com/a/icon_main_color.png');
      expect(task.start(120)).assertTrue();
      expect(task.start(240)).assertFalse();
      logStep('attemptCountIncreasesOnlyOnSuccessfulStart', String(task.attempts));
      expect(task.attempts).assertEqual(1);
      expect(task.startedAt).assertEqual(120);
      expect(task.isRunning()).assertTrue();
      task.fail(ERROR_START);
      expect(task.start(360)).assertFalse();
      expect(task.attempts).assertEqual(1);
      task.reset();
      expect(task.start(480)).assertTrue();
      expect(task.startedAt).assertEqual(480);
      expect(task.attempts).assertEqual(2);
    });

    /**
     * @tc.name   restartWhileRunningIsRejected
     * @tc.desc   A second startAll during a live run is recorded as start-rejected and changes nothing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('restartWhileRunningIsRejected', 0, () => {
      expect(graph.startAll()).assertTrue();
      expect(graph.startAll()).assertFalse();
      logStep('restartWhileRunningIsRejected', graph.eventTrace());
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.taskAt(0).attempts).assertEqual(1);
      expect(graph.taskAt(1).attempts).assertEqual(1);
      expect(graph.isTaskFinished).assertFalse();
      graph.reset();
      expect(graph.startAll()).assertTrue();
      expect(graph.events.countOf('start-all')).assertEqual(1);
    });

    /**
     * @tc.name   interruptThenResetThenFullRun
     * @tc.desc   An interrupted session that is reset can complete from scratch with C last in the trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InterruptionRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('interruptThenResetThenFullRun', 0, () => {
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.pollTick()).assertTrue();
      expect(graph.completeTaskC()).assertTrue();
      logStep('interruptThenResetThenFullRun', completionTrace(graph));
      expect(completionTrace(graph)).assertEqual('A|B|C');
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
      expect(graph.allCompleted()).assertTrue();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(300);
      expect(graph.averageProgress()).assertEqual(100);
    });
  });
}
