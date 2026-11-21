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
 * RunLifecycle suite.
 *
 * Walks the observable lifecycle of the sample task graph: fresh state,
 * startAll, the two shared downloads, the gate that unlocks C, the exclusive C
 * run, terminal states, reset and rerun.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   57-60    progressValueA / progressValueB / progressValueC / isTaskFinished
 *   62-64    lock, taskACompleted, taskBCompleted
 *   68-76    updateProgress writes 100 for exactly one row
 *   79-95    completeTaskA / completeTaskB / completeTaskC
 *   98-102   checkAndUnlock: A && B && lock -> lock = false
 *   105-107  canRunTaskC returns !lock
 *   174-198  startAllTasks: A/B shared, C exclusive, 200 ms poll, clearInterval
 *   200-265  three progress rows plus the enabled(isTaskFinished) button
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  PROGRESS_INITIAL,
  PROGRESS_TOTAL,
  STATUS_IDLE,
  STATUS_RUNNING,
  STATUS_COMPLETED,
  STATUS_FAILED,
  ERROR_NETWORK,
  DownloadTask,
  TaskGraph,
  createTaskGraph,
  completionTrace,
  isTopologicalCompletion,
  NetworkMetrics,
  textFingerprint,
  expectedProgressAfter
} from '../Shared/SharedDriver';

export default function runLifecycleTest(): void {
  describe('RunLifecycle', () => {
    beforeAll(() => {
      logSuite('RunLifecycle', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('RunLifecycle', 'end');
    });

    /**
     * @tc.name   freshGraphHoldsThreeIdleRows
     * @tc.desc   A new graph owns the three page rows and every row is idle at zero progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('freshGraphHoldsThreeIdleRows', 0, () => {
      logStep('RunLifecycle', 'inspect fresh graph');
      const graph: TaskGraph = createTaskGraph();
      const a: DownloadTask = graph.taskAt(0);
      const b: DownloadTask = graph.taskAt(1);
      const c: DownloadTask = graph.taskAt(2);
      expect(graph.tasks.length).assertEqual(3);
      expect(a.taskNo).assertEqual(TASK_A);
      expect(b.taskNo).assertEqual(TASK_B);
      expect(c.taskNo).assertEqual(TASK_C);
      expect(a.status).assertEqual(STATUS_IDLE);
      expect(c.progress).assertEqual(PROGRESS_INITIAL);
    });

    /**
     * @tc.name   freshGraphKeepsGateClosedAndTimerIdle
     * @tc.desc   Before the run starts the C gate is closed, the lock is free and no timer is armed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('freshGraphKeepsGateClosedAndTimerIdle', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.lock.waitingExclusive).assertFalse();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.completionOrder.length).assertEqual(0);
    });

    /**
     * @tc.name   startAllMarksBothSharedRowsRunning
     * @tc.desc   startAll returns true, flips the finished flag and leaves exactly A and B running.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startAllMarksBothSharedRowsRunning', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const started: boolean = graph.startAll();
      expect(started).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.taskAt(0).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(1).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.runningCount()).assertEqual(2);
    });

    /**
     * @tc.name   startAllArmsPollTimerAndQueuesTaskC
     * @tc.desc   The poll timer becomes active and the exclusive request for C is recorded as queued.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startAllArmsPollTimerAndQueuesTaskC', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.timerActive).assertTrue();
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.events.countOf('queued')).assertEqual(1);
      expect(graph.events.last()).assertEqual('queued:C');
    });

    /**
     * @tc.name   startAllTakesSharedOwnershipOfAAndB
     * @tc.desc   The dependency lock is held twice in shared mode and by nobody exclusively.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startAllTakesSharedOwnershipOfAAndB', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.lock.hasShared(TASK_A)).assertTrue();
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(graph.lock.acquisitions).assertEqual(2);
      expect(graph.lock.rejections).assertEqual(0);
    });

    /**
     * @tc.name   secondStartWhileRunningIsRejected
     * @tc.desc   startAll is single-shot: a second call returns false and records a rejection event.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('secondStartWhileRunningIsRejected', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const first: boolean = graph.startAll();
      const second: boolean = graph.startAll();
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
      expect(graph.events.last()).assertEqual('start-rejected:0');
    });

    /**
     * @tc.name   completingTaskARecordsTimestampAndFullProgress
     * @tc.desc   Completing A stamps finishedAt, writes exactly 100 and leaves the row completed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completingTaskARecordsTimestampAndFullProgress', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      const done: boolean = graph.completeTask(TASK_A, 1500);
      expect(done).assertTrue();
      expect(a.status).assertEqual(STATUS_COMPLETED);
      expect(a.progress).assertEqual(PROGRESS_TOTAL);
      expect(a.finishedAt).assertEqual(1500);
      expect(a.isComplete()).assertTrue();
      expect(a.isRunning()).assertFalse();
    });

    /**
     * @tc.name   taskACompletionKeepsGateClosedAndBHeld
     * @tc.desc   One finished prerequisite is not enough: C stays locked while B still owns a shared slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('taskACompletionKeepsGateClosedAndBHeld', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 400);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.lock.hasShared(TASK_A)).assertFalse();
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.events.countOf('unlocked')).assertEqual(0);
    });

    /**
     * @tc.name   completingTaskBReleasesTheLastSharedHolder
     * @tc.desc   After both prerequisites finish the shared list is empty and the gate predicate holds.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completingTaskBReleasesTheLastSharedHolder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 300);
      graph.completeTask(TASK_B, 600);
      expect(graph.lock.sharedHolders.length).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.completionOrder.length).assertEqual(2);
    });

    /**
     * @tc.name   gateOpensOnSecondCompletionWithoutTimerTick
     * @tc.desc   The gate predicate is computed from task states, so no poll is needed for it to be true.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateOpensOnSecondCompletionWithoutTimerTick', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B, 100);
      graph.completeTask(TASK_A, 200);
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.timerActive).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.events.last()).assertEqual('unlocked:C');
    });

    /**
     * @tc.name   pollTickStartsTaskCAndStopsTimer
     * @tc.desc   A 200 ms poll with an open gate starts C once and clears the interval flag.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pollTickStartsTaskCAndStopsTimer', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 100);
      graph.completeTask(TASK_B, 200);
      const started: boolean = graph.pollTick(400);
      expect(started).assertTrue();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.timerActive).assertFalse();
      expect(graph.taskAt(2).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(2).startedAt).assertEqual(400);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
    });

    /**
     * @tc.name   taskCTakesExclusiveOwnershipAfterUnlock
     * @tc.desc   The queued exclusive request finally enters the lock and holds the only slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskCTakesExclusiveOwnershipAfterUnlock', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      graph.pollTick(30);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.lock.sharedHolders.length).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.lock.waitingExclusive).assertFalse();
      expect(graph.lock.acquisitions).assertEqual(3);
      expect(graph.runningCount()).assertEqual(1);
    });

    /**
     * @tc.name   pollTickAfterGateOpenRunsOnlyOnce
     * @tc.desc   The interval is cleared by the first successful poll, so later ticks only count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollTickAfterGateOpenRunsOnlyOnce', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      const first: boolean = graph.pollTick(3);
      const second: boolean = graph.pollTick(4);
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.taskAt(2).startedAt).assertEqual(3);
    });

    /**
     * @tc.name   completingTaskCReleasesExclusiveAndFinishesGraph
     * @tc.desc   The final completion frees the exclusive owner, writes 100 and closes the whole run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completingTaskCReleasesExclusiveAndFinishesGraph', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      graph.pollTick(30);
      const done: boolean = graph.completeTaskC(900);
      expect(done).assertTrue();
      expect(graph.taskAt(2).status).assertEqual(STATUS_COMPLETED);
      expect(graph.taskAt(2).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(2).finishedAt).assertEqual(900);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.allCompleted()).assertTrue();
    });

    /**
     * @tc.name   allCompletedTurnsTrueOnlyAfterTaskC
     * @tc.desc   The aggregate flag ignores A and B alone and flips exactly when C reaches the terminal state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('allCompletedTurnsTrueOnlyAfterTaskC', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      expect(graph.allCompleted()).assertFalse();
      graph.completeTask(TASK_B, 2);
      expect(graph.allCompleted()).assertFalse();
      graph.pollTick(3);
      expect(graph.allCompleted()).assertFalse();
      graph.completeTaskC(4);
      expect(graph.allCompleted()).assertTrue();
      expect(graph.runningCount()).assertEqual(0);
    });

    /**
     * @tc.name   totalProgressWalksFromZeroToThreeHundred
     * @tc.desc   Each completion adds one full row, so the sum steps through 0, 100, 200 and 300.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('totalProgressWalksFromZeroToThreeHundred', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const emptyTotal: number = graph.totalProgress();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      const afterA: number = graph.totalProgress();
      graph.completeTask(TASK_B, 2);
      const afterB: number = graph.totalProgress();
      graph.pollTick(3);
      graph.completeTaskC(4);
      expect(emptyTotal).assertEqual(0);
      expect(afterA).assertEqual(100);
      expect(afterB).assertEqual(200);
      expect(graph.totalProgress()).assertEqual(300);
      expect(graph.averageProgress()).assertEqual(100);
    });

    /**
     * @tc.name   timestampsStayIndependentPerRow
     * @tc.desc   Every row keeps its own start and finish stamps even when all three complete in one run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timestampsStayIndependentPerRow', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 111);
      graph.completeTask(TASK_B, 222);
      graph.pollTick(333);
      graph.completeTaskC(444);
      expect(graph.taskAt(0).finishedAt).assertEqual(111);
      expect(graph.taskAt(1).finishedAt).assertEqual(222);
      expect(graph.taskAt(2).startedAt).assertEqual(333);
      expect(graph.taskAt(2).finishedAt).assertEqual(444);
      expect(graph.taskAt(2).finishedAt > graph.taskAt(1).finishedAt).assertTrue();
      expect(graph.taskAt(0).startedAt).assertEqual(0);
    });

    /**
     * @tc.name   resetReturnsEveryRowToIdle
     * @tc.desc   Reset clears progress, status and both timestamps of every row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetReturnsEveryRowToIdle', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      graph.pollTick(30);
      graph.completeTaskC(40);
      graph.reset();
      expect(graph.taskAt(0).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(1).progress).assertEqual(PROGRESS_INITIAL);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(2).startedAt).assertEqual(0);
      expect(graph.taskAt(2).finishedAt).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
    });

    /**
     * @tc.name   resetClearsEventTraceAndCounters
     * @tc.desc   Reset empties the recorder, the completion order and the poll counter in one step.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetClearsEventTraceAndCounters', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 5);
      graph.completeTask(TASK_B, 6);
      const before: number = graph.events.size();
      graph.reset();
      expect(before > 0).assertTrue();
      expect(graph.events.size()).assertEqual(0);
      expect(graph.events.trace()).assertEqual('');
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.eventTrace()).assertEqual('');
    });

    /**
     * @tc.name   resetKeepsGraphCoherentForRerun
     * @tc.desc   After reset the graph is indistinguishable from a fresh one: flag set, lock free, timer off.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetKeepsGraphCoherentForRerun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.pollTick(1);
      graph.reset();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.lock.waitingExclusive).assertFalse();
      expect(graph.lock.acquisitions).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.snapshotText()).assertEqual('A:idle:0|B:idle:0|C:idle:0');
    });

    /**
     * @tc.name   rerunAfterResetRepeatsEventTrace
     * @tc.desc   The same scripted run twice produces the same event trace and the same fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('rerunAfterResetRepeatsEventTrace', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      const firstTrace: string = graph.eventTrace();
      const firstPrint: number = textFingerprint(firstTrace);
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A, 11);
      graph.completeTask(TASK_B, 12);
      graph.pollTick(13);
      graph.completeTaskC(14);
      expect(graph.eventTrace()).assertEqual(firstTrace);
      expect(textFingerprint(graph.eventTrace())).assertEqual(firstPrint);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(graph.allCompleted()).assertTrue();
    });

    /**
     * @tc.name   rerunWithReversedPrerequisiteOrderStaysLegal
     * @tc.desc   Completing B before A still opens the gate and C remains last in the completion order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('rerunWithReversedPrerequisiteOrderStaysLegal', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B, 7);
      graph.completeTask(TASK_A, 8);
      graph.pollTick(9);
      graph.completeTaskC(10);
      expect(completionTrace(graph)).assertEqual('B|A|C');
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(2);
      expect(graph.allCompleted()).assertTrue();
    });

    /**
     * @tc.name   topologicalOracleAcceptsBothLegalOrders
     * @tc.desc   The independent ordering oracle accepts A/B in either order and rejects C anywhere but last.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('topologicalOracleAcceptsBothLegalOrders', 0, () => {
      expect(isTopologicalCompletion([TASK_A, TASK_B, TASK_C])).assertTrue();
      expect(isTopologicalCompletion([TASK_B, TASK_A, TASK_C])).assertTrue();
      expect(isTopologicalCompletion([TASK_C, TASK_A, TASK_B])).assertFalse();
      expect(isTopologicalCompletion([TASK_A, TASK_C, TASK_B])).assertFalse();
      expect(isTopologicalCompletion([TASK_A, TASK_B])).assertFalse();
      expect(isTopologicalCompletion([])).assertFalse();
    });

    /**
     * @tc.name   completedRowRejectsRestartAndProgress
     * @tc.desc   Once a row reaches completed it refuses start, refuses a lower progress and keeps 100.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completedRowRejectsRestartAndProgress', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 50);
      const a: DownloadTask = graph.taskAt(0);
      const restarted: boolean = a.start(60);
      const reported: number = a.reportProgress(20);
      expect(restarted).assertFalse();
      expect(a.attempts).assertEqual(1);
      expect(reported).assertEqual(PROGRESS_TOTAL);
      expect(a.progress).assertEqual(PROGRESS_TOTAL);
      expect(a.finishedAt).assertEqual(50);
      expect(a.status).assertEqual(STATUS_COMPLETED);
    });

    /**
     * @tc.name   failedRowIsTerminalButDriverCanCompleteIt
     * @tc.desc   A failed prerequisite freezes its progress and stays terminal, yet the graph completion path
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            still releases its shared slot because only the completed status blocks DownloadTask.complete.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failedRowIsTerminalButDriverCanCompleteIt', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const b: DownloadTask = graph.taskAt(1);
      b.reportProgress(40);
      const failed: boolean = b.fail(ERROR_NETWORK);
      const frozen: number = b.reportProgress(90);
      expect(b.status).assertEqual(STATUS_FAILED);
      const completed: boolean = graph.completeTask(TASK_B, 70);
      expect(failed).assertTrue();
      expect(frozen).assertEqual(40);
      expect(completed).assertTrue();
      expect(b.status).assertEqual(STATUS_COMPLETED);
      expect(graph.lock.hasShared(TASK_B)).assertFalse();
    });

    /**
     * @tc.name   lifecycleFingerprintDiffersPerPhase
     * @tc.desc   Every phase of the run leaves a distinct trace fingerprint, so the lifecycle is observable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lifecycleFingerprintDiffersPerPhase', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const prints: number[] = [];
      prints.push(graph.events.fingerprint());
      graph.startAll();
      prints.push(graph.events.fingerprint());
      graph.completeTask(TASK_A, 1);
      prints.push(graph.events.fingerprint());
      graph.completeTask(TASK_B, 2);
      prints.push(graph.events.fingerprint());
      graph.pollTick(3);
      prints.push(graph.events.fingerprint());
      graph.completeTaskC(4);
      prints.push(graph.events.fingerprint());
      expect(prints.length).assertEqual(6);
      expect(prints[0] === prints[1]).assertFalse();
      expect(prints[2] === prints[3]).assertFalse();
      expect(prints[4] === prints[5]).assertFalse();
      expect(textFingerprint('')).assertEqual(prints[0]);
    });

    /**
     * @tc.name   snapshotTextReflectsLifecyclePhases
     * @tc.desc   The pipe separated snapshot string matches idle, one-done and fully-done phases.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotTextReflectsLifecyclePhases', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const idle: string = graph.snapshotText();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      const afterA: string = graph.snapshotText();
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      expect(idle).assertEqual('A:idle:0|B:idle:0|C:idle:0');
      expect(afterA).assertEqual('A:completed:100|B:running:0|C:idle:0');
      expect(graph.snapshotText()).assertEqual('A:completed:100|B:completed:100|C:completed:100');
      expect(afterA.indexOf('running')).assertLarger(0);
      expect(graph.snapshotText().split('|').length).assertEqual(3);
    });

    /**
     * @tc.name   metricsAtCompletionReportFullSuccess
     * @tc.desc   Aggregated metrics after the run report three completed rows, no failures and full progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsAtCompletionReportFullSuccess', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      expect(metrics.totalTasks).assertEqual(3);
      expect(metrics.completedTasks).assertEqual(3);
      expect(metrics.failedTasks).assertEqual(0);
      expect(metrics.totalProgress).assertEqual(300);
      expect(metrics.averageProgress()).assertEqual(100);
      expect(metrics.successRatio()).assertEqual(1);
    });

    /**
     * @tc.name   intermediateProgressStaysMonotoneDuringRun
     * @tc.desc   Repeated progress callbacks raise the value but a stale lower callback never rolls it back.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('intermediateProgressStaysMonotoneDuringRun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      expect(a.reportProgress(30)).assertEqual(30);
      expect(a.reportProgress(70)).assertEqual(70);
      expect(a.reportProgress(45)).assertEqual(70);
      expect(a.reportProgress(120)).assertEqual(100);
      expect(a.reportProgress(10)).assertEqual(100);
      expect(expectedProgressAfter(100, 5)).assertEqual(100);
    });

    /**
     * @tc.name   runLifecycleEndsWithTerminalRowsAndFreeLock
     * @tc.desc   The loop closes: three terminal rows, an empty lock, a stopped timer and the button re-enabled
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            only after reset.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runLifecycleEndsWithTerminalRowsAndFreeLock', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      expect(graph.taskAt(0).isComplete()).assertTrue();
      expect(graph.taskAt(1).isComplete()).assertTrue();
      expect(graph.taskAt(2).isComplete()).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      expect(graph.isTaskFinished).assertFalse();
      graph.reset();
      expect(graph.isTaskFinished).assertTrue();
    });

    /**
     * @tc.name   twoGraphsRunIndependently
     * @tc.desc   Two graphs built by the factory share no state: finishing one leaves the other untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('twoGraphsRunIndependently', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      first.startAll();
      first.completeTask(TASK_A, 1);
      first.completeTask(TASK_B, 2);
      first.pollTick(3);
      first.completeTaskC(4);
      expect(first.allCompleted()).assertTrue();
      expect(second.allCompleted()).assertFalse();
      expect(second.isTaskFinished).assertTrue();
      expect(second.events.size()).assertEqual(0);
      expect(second.lock.holderCount()).assertEqual(0);
      expect(second.totalProgress()).assertEqual(0);
    });

    /**
     * @tc.name   resetPreservesTaskIdentityAndUrls
     * @tc.desc   Reset only clears mutable run state, so task numbers and the three download URLs survive.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetPreservesTaskIdentityAndUrls', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const urlBefore: string = graph.taskAt(0).url;
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      graph.reset();
      expect(graph.taskAt(0).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(1).taskNo).assertEqual(TASK_B);
      expect(graph.taskAt(2).taskNo).assertEqual(TASK_C);
      expect(graph.taskAt(0).url).assertEqual(urlBefore);
      expect(graph.taskAt(0).url.endsWith('.png')).assertTrue();
      expect(graph.tasks.length).assertEqual(3);
    });

    /**
     * @tc.name   unlockEventRecordedTwiceAcrossGateAndCompletion
     * @tc.desc   The graph announces the open gate once when B finishes and again when C itself completes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('unlockEventRecordedTwiceAcrossGateAndCompletion', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      graph.completeTask(TASK_B, 2);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      graph.pollTick(3);
      graph.completeTaskC(4);
      const trace: string = graph.eventTrace();
      expect(graph.events.countOf('unlocked')).assertEqual(2);
      expect(trace.endsWith('unlocked:C')).assertTrue();
      expect(trace.indexOf('completed:C')).assertLarger(0);
    });

    /**
     * @tc.name   timerFlagClearsBeforeTaskCFinishes
     * @tc.desc   The timer stops the moment C starts, which is well before C reaches a terminal state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timerFlagClearsBeforeTaskCFinishes', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      expect(graph.timerActive).assertFalse();
      expect(graph.taskAt(2).status).assertEqual(STATUS_RUNNING);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.taskAt(2).isComplete()).assertFalse();
      graph.completeTaskC(4);
      expect(graph.taskAt(2).isComplete()).assertTrue();
    });

    /**
     * @tc.name   unpolledGraphLeavesTaskCQueued
     * @tc.desc   Without a poll iteration a ready C never starts, which mirrors a starving interval callback.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unpolledGraphLeavesTaskCQueued', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.timerActive).assertTrue();
      expect(graph.allCompleted()).assertFalse();
      expect(graph.lock.holderCount()).assertEqual(0);
      const started: boolean = graph.pollTick(3);
      expect(started).assertTrue();
      expect(graph.taskAt(2).isRunning()).assertTrue();
    });

    /**
     * @tc.name   labelsAndDescriptionsTrackLifecycle
     * @tc.desc   The rendered row label and the debug description both follow the row through the run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('labelsAndDescriptionsTrackLifecycle', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const c: DownloadTask = graph.taskAt(2);
      expect(c.label()).assertEqual('任务C当前进度 0%');
      expect(c.describe()).assertEqual('C:idle:0');
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      expect(c.status).assertEqual(STATUS_RUNNING);
      expect(c.describe()).assertEqual('C:running:0');
      graph.completeTaskC(4);
      expect(c.label()).assertEqual('任务C当前进度 100%');
      expect(c.describe()).assertEqual('C:completed:100');
    });

    /**
     * @tc.name   gateOpenWindowKeepsRowsStableUntilPoll
     * @tc.desc   While C waits for a poll, repeated snapshots of the two finished prerequisites do not drift.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateOpenWindowKeepsRowsStableUntilPoll', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      const firstRead: string = graph.snapshotText();
      const secondRead: string = graph.snapshotText();
      expect(firstRead).assertEqual(secondRead);
      expect(firstRead).assertEqual('A:completed:100|B:completed:100|C:idle:0');
      expect(graph.taskAt(0).finishedAt).assertEqual(1);
      expect(graph.taskAt(1).finishedAt).assertEqual(2);
      expect(graph.completionOrder.length).assertEqual(2);
    });

    /**
     * @tc.name   partialProgressBeforeCompletionIsResetToo
     * @tc.desc   Intermediate callback values live on the row until the run is reset, then start again from zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RunLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('partialProgressBeforeCompletionIsResetToo', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(35);
      graph.taskAt(1).reportProgress(65);
      expect(graph.totalProgress()).assertEqual(100);
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      expect(graph.totalProgress()).assertEqual(200);
      graph.reset();
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_INITIAL);
      expect(graph.taskAt(1).progress).assertEqual(PROGRESS_INITIAL);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.averageProgress()).assertEqual(0);
    });
  });
}
