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
 * CallbackLoss suite.
 *
 * Fault injection around the onCompleted callback: a completion that never
 * arrives, a progress-only callback, a callback that arrives very late or after
 * a reset, duplicated callbacks and the resulting gate, timer and completion
 * order state.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   79-95    completion handlers write 100 and call checkAndUnlock
 *   119-128  task.onCompleted is the only driver of completion
 *   130-132  task.onProgress only logs
 *   188-196  the interval stops at canRunTaskC or progress 100
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  STATUS_IDLE,
  STATUS_RUNNING,
  STATUS_COMPLETED,
  STATUS_FAILED,
  ERROR_NONE,
  ERROR_NETWORK,
  PROGRESS_TOTAL,
  PROGRESS_INITIAL,
  DownloadTask,
  TaskGraph,
  createTaskGraph,
  NetworkMetrics,
  completionTrace,
  expectedProgressAfter,
  isTerminalStatus,
  textFingerprint
} from '../Shared/SharedDriver';

export default function callbackLossTest(): void {
  describe('CallbackLoss', () => {
    beforeAll(() => {
      logSuite('CallbackLoss', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CallbackLoss', 'end');
    });

    /**
     * @tc.name   missingCompletionCallbackLeavesTaskRunning
     * @tc.desc   A started row whose onCompleted never fires keeps the running status and its partial progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('missingCompletionCallbackLeavesTaskRunning', 0, () => {
      logStep('CallbackLoss', 'drop the completion callback');
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      expect(a.reportProgress(45)).assertEqual(45);
      expect(a.isRunning()).assertTrue();
      expect(a.isComplete()).assertFalse();
      expect(a.progress).assertEqual(45);
      expect(a.finishedAt).assertEqual(0);
      expect(graph.canRunTaskC()).assertFalse();
    });

    /**
     * @tc.name   progressOnlyCallbackNeverFinishes
     * @tc.desc   A progress callback reaching 100 does not complete the row, because only onCompleted writes status.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('progressOnlyCallbackNeverFinishes', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const b: DownloadTask = graph.taskAt(1);
      expect(b.reportProgress(100)).assertEqual(100);
      expect(b.progress).assertEqual(PROGRESS_TOTAL);
      expect(b.status).assertEqual(STATUS_RUNNING);
      expect(b.isComplete()).assertFalse();
      expect(isTerminalStatus(b.status)).assertFalse();
      expect(graph.totalProgress()).assertEqual(100);
      expect(graph.completionOrder.length).assertEqual(0);
    });

    /**
     * @tc.name   progressOnlyAtHundredKeepsGateClosed
     * @tc.desc   A prerequisite showing 100 percent through progress alone still fails the gate predicate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressOnlyAtHundredKeepsGateClosed', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(100);
      graph.taskAt(1).reportProgress(100);
      expect(graph.totalProgress()).assertEqual(200);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.pollTick(1)).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.events.countOf('completed')).assertEqual(0);
    });

    /**
     * @tc.name   progressOnlyOnAKeepsGateClosed
     * @tc.desc   One row completed by a real callback plus one progress-only row is still only half of the gate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressOnlyOnAKeepsGateClosed', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.taskAt(1).reportProgress(100);
      expect(graph.taskAt(0).status).assertEqual(STATUS_COMPLETED);
      expect(graph.taskAt(1).status).assertEqual(STATUS_RUNNING);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.pollTick(2)).assertFalse();
    });

    /**
     * @tc.name   missingCallbackOnBothKeepsTimerArmed
     * @tc.desc   Three polls without a single completion return false and never clear the interval flag.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('missingCallbackOnBothKeepsTimerArmed', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.pollTick(1)).assertFalse();
      expect(graph.pollTick(2)).assertFalse();
      expect(graph.pollTick(3)).assertFalse();
      expect(graph.pollTicks).assertEqual(3);
      expect(graph.timerActive).assertTrue();
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect(graph.taskAt(2).isIdle()).assertTrue();
    });

    /**
     * @tc.name   repeatedPollsWithoutCompletionNeverStartC
     * @tc.desc   Even ten poll rounds cannot start C while both prerequisite completions are missing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedPollsWithoutCompletionNeverStartC', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      for (let round = 0; round < 10; round++) {
        expect(graph.pollTick(round)).assertFalse();
      }
      expect(graph.pollTicks).assertEqual(10);
      expect(graph.lock.acquisitions).assertEqual(2);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   lateCompletionAfterLongDelayOpensGate
     * @tc.desc   A completion arriving long after start still opens the gate and records its late timestamp.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lateCompletionAfterLongDelayOpensGate', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(30);
      graph.taskAt(1).reportProgress(20);
      expect(graph.completeTask(TASK_A, 60000)).assertTrue();
      expect(graph.completeTask(TASK_B, 60001)).assertTrue();
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.taskAt(0).finishedAt).assertEqual(60000);
      expect(graph.taskAt(1).finishedAt).assertEqual(60001);
      expect(graph.taskAt(0).startedAt).assertEqual(0);
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
    });

    /**
     * @tc.name   lateCallbacksArriveInArrivalOrder
     * @tc.desc   When B's late callback lands before A's, the completion order follows arrival, not task order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lateCallbacksArriveInArrivalOrder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B, 5000);
      graph.completeTask(TASK_A, 2);
      expect(completionTrace(graph)).assertEqual('B|A');
      expect(graph.completionOrder[0]).assertEqual(TASK_B);
      expect(graph.completionOrder[1]).assertEqual(TASK_A);
      expect(graph.taskAt(1).finishedAt).assertEqual(5000);
      expect(graph.taskAt(0).finishedAt).assertEqual(2);
      expect(graph.canRunTaskC()).assertTrue();
    });

    /**
     * @tc.name   lateCompletionAfterResetWritesFullProgress
     * @tc.desc   A callback that lands after a reset still completes its row, because only completed status blocks it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('lateCompletionAfterResetWritesFullProgress', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(80);
      graph.reset();
      expect(graph.taskAt(0).isIdle()).assertTrue();
      expect(graph.completeTask(TASK_A, 99)).assertTrue();
      expect(graph.taskAt(0).status).assertEqual(STATUS_COMPLETED);
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(0).finishedAt).assertEqual(99);
      expect(graph.completionOrder.length).assertEqual(1);
    });

    /**
     * @tc.name   resetAfterLateCallbackClearsGhostOrder
     * @tc.desc   A second reset removes the ghost order entry left by the late callback and restores consistency.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetAfterLateCallbackClearsGhostOrder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.reset();
      graph.completeTask(TASK_A, 1);
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(1);
      graph.reset();
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.taskAt(0).isIdle()).assertTrue();
      expect(graph.snapshotText()).assertEqual('A:idle:0|B:idle:0|C:idle:0');
    });

    /**
     * @tc.name   duplicateCompletionCallbackIgnored
     * @tc.desc   A retried delivery of the same onCompleted callback is dropped without touching timestamps.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('duplicateCompletionCallbackIgnored', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.completeTask(TASK_A, 10)).assertTrue();
      expect(graph.completeTask(TASK_A, 20)).assertFalse();
      expect(graph.taskAt(0).finishedAt).assertEqual(10);
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.taskAt(0).attempts).assertEqual(1);
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
    });

    /**
     * @tc.name   completionWithoutStartStillCompletes
     * @tc.desc   The completion handler does not require a start: a callback for an idle row completes it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('completionWithoutStartStillCompletes', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const c: DownloadTask = graph.taskAt(2);
      expect(c.attempts).assertEqual(0);
      expect(graph.completeTask(TASK_C, 7)).assertTrue();
      expect(c.status).assertEqual(STATUS_COMPLETED);
      expect(c.progress).assertEqual(PROGRESS_TOTAL);
      expect(c.attempts).assertEqual(0);
      expect(c.finishedAt).assertEqual(7);
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   resetBeforeCallbackDiscardsRunningState
     * @tc.desc   A reset while the callback is still in flight returns the row to idle at zero progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetBeforeCallbackDiscardsRunningState', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      a.reportProgress(65);
      expect(a.isRunning()).assertTrue();
      graph.reset();
      expect(a.status).assertEqual(STATUS_IDLE);
      expect(a.progress).assertEqual(PROGRESS_INITIAL);
      expect(a.startedAt).assertEqual(0);
      expect(a.isRunning()).assertFalse();
      expect(a.attempts).assertEqual(1);
    });

    /**
     * @tc.name   progressCallbacksOutOfOrderAreClamped
     * @tc.desc   A stale progress callback after a newer one cannot reduce the value that is already displayed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressCallbacksOutOfOrderAreClamped', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const b: DownloadTask = graph.taskAt(1);
      expect(b.reportProgress(70)).assertEqual(70);
      expect(b.reportProgress(40)).assertEqual(70);
      expect(b.reportProgress(69)).assertEqual(70);
      expect(b.progress).assertEqual(70);
      expect(expectedProgressAfter(70, 40)).assertEqual(70);
      expect(expectedProgressAfter(70, 75)).assertEqual(75);
    });

    /**
     * @tc.name   progressAboveHundredClamped
     * @tc.desc   An oversized progress payload is clamped to the total so the label can never exceed 100 percent.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressAboveHundredClamped', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      expect(a.reportProgress(150)).assertEqual(PROGRESS_TOTAL);
      expect(a.reportProgress(999)).assertEqual(PROGRESS_TOTAL);
      expect(a.progress).assertEqual(PROGRESS_TOTAL);
      expect(a.label()).assertEqual('任务A当前进度 100%');
      expect(a.progressRatio()).assertEqual(1);
      expect(expectedProgressAfter(0, 250)).assertEqual(PROGRESS_TOTAL);
    });

    /**
     * @tc.name   negativeProgressClampedToZero
     * @tc.desc   A negative progress payload leaves the row at zero instead of producing a negative label.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('negativeProgressClampedToZero', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const b: DownloadTask = graph.taskAt(1);
      expect(b.reportProgress(-5)).assertEqual(PROGRESS_INITIAL);
      expect(b.progress).assertEqual(PROGRESS_INITIAL);
      expect(b.label()).assertEqual('任务B当前进度 0%');
      expect(b.progressRatio()).assertEqual(0);
      expect(expectedProgressAfter(30, -5)).assertEqual(30);
      expect(b.reportProgress(-1)).assertEqual(0);
    });

    /**
     * @tc.name   progressAfterFailureIsIgnored
     * @tc.desc   A failed row is terminal for progress, so a trailing progress callback cannot revive it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressAfterFailureIsIgnored', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const b: DownloadTask = graph.taskAt(1);
      b.reportProgress(25);
      expect(b.fail(ERROR_NETWORK)).assertTrue();
      expect(b.reportProgress(90)).assertEqual(25);
      expect(b.progress).assertEqual(25);
      expect(b.status).assertEqual(STATUS_FAILED);
      expect(isTerminalStatus(b.status)).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
    });

    /**
     * @tc.name   lateCompletionOverridesFailedState
     * @tc.desc   A completion that lands after a failure still wins, because only completed status blocks completion.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('lateCompletionOverridesFailedState', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      a.fail(ERROR_NETWORK);
      expect(a.isFailed()).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.completeTask(TASK_A, 4)).assertTrue();
      expect(a.status).assertEqual(STATUS_COMPLETED);
      expect(a.progress).assertEqual(PROGRESS_TOTAL);
      expect(a.lastErrorCode).assertEqual(ERROR_NETWORK);
      expect(graph.completionOrder.length).assertEqual(1);
    });

    /**
     * @tc.name   lostCallbackOnCLeavesGraphIncomplete
     * @tc.desc   C starts but its completion is lost, so the graph never reports all rows complete.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lostCallbackOnCLeavesGraphIncomplete', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.taskAt(2).reportProgress(95);
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.taskAt(2).progress).assertEqual(95);
      expect(graph.allCompleted()).assertFalse();
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.runningCount()).assertEqual(1);
      expect(graph.taskAt(2).finishedAt).assertEqual(0);
    });

    /**
     * @tc.name   callbackLossTraceDiffersFromFullRun
     * @tc.desc   The trace of a run with a missing callback is shorter and fingerprints differently from a full run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('callbackLossTraceDiffersFromFullRun', 0, () => {
      const lost: TaskGraph = createTaskGraph();
      const full: TaskGraph = createTaskGraph();
      lost.startAll();
      full.startAll();
      lost.completeTask(TASK_A, 1);
      full.completeTask(TASK_A, 1);
      full.completeTask(TASK_B, 2);
      full.pollTick(3);
      full.completeTaskC(4);
      expect(lost.events.size() < full.events.size()).assertTrue();
      expect(lost.eventTrace() === full.eventTrace()).assertFalse();
      expect(lost.events.fingerprint() === full.events.fingerprint()).assertFalse();
      expect(lost.events.countOf('unlocked')).assertEqual(0);
      expect(full.events.countOf('unlocked')).assertEqual(2);
    });

    /**
     * @tc.name   halfPairWithProgressOnlyKeepsGateHalfOpen
     * @tc.desc   A completed A plus a B that only reports progress leaves the holder counts and the gate unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('halfPairWithProgressOnlyKeepsGateHalfOpen', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.taskAt(1).reportProgress(50);
      expect(graph.lock.hasShared(TASK_A)).assertFalse();
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(1).isComplete()).assertFalse();
      expect(graph.events.countOf('unlocked')).assertEqual(0);
    });

    /**
     * @tc.name   lostCompletionKeepsMetricsPartial
     * @tc.desc   Metrics after a lost callback report only the completion that actually arrived.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lostCompletionKeepsMetricsPartial', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.taskAt(1).reportProgress(40);
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      expect(metrics.completedTasks).assertEqual(1);
      expect(metrics.failedTasks).assertEqual(0);
      expect(metrics.totalProgress).assertEqual(140);
      expect(metrics.successRatio()).assertEqual(1.0 / 3);
      expect(metrics.averageProgress()).assertEqual(140.0 / 3);
      expect(metrics.totalTasks).assertEqual(3);
    });

    /**
     * @tc.name   zeroProgressCallbacksKeepRowsAtZero
     * @tc.desc   Repeating a zero payload leaves progress and labels untouched while the row keeps running.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('zeroProgressCallbacksKeepRowsAtZero', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      expect(a.reportProgress(0)).assertEqual(0);
      expect(a.reportProgress(0)).assertEqual(0);
      expect(a.progress).assertEqual(PROGRESS_INITIAL);
      expect(a.label()).assertEqual('任务A当前进度 0%');
      expect(a.describe()).assertEqual('A:running:0');
      expect(graph.totalProgress()).assertEqual(0);
    });

    /**
     * @tc.name   missedCallbackRecoveryViaManualCompletion
     * @tc.desc   An explicit completion after a lost callback drives the graph to the same end state as a full run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('missedCallbackRecoveryViaManualCompletion', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(60);
      graph.taskAt(1).reportProgress(60);
      expect(graph.canRunTaskC()).assertFalse();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      expect(graph.pollTick(3)).assertTrue();
      graph.completeTaskC(4);
      expect(graph.allCompleted()).assertTrue();
      expect(completionTrace(graph)).assertEqual('A|B|C');
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(1).progress).assertEqual(PROGRESS_TOTAL);
    });

    /**
     * @tc.name   lateCallbackChangesEventFingerprint
     * @tc.desc   The instant a late callback lands the event fingerprint changes, so losses are observable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CallbackLoss scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('lateCallbackChangesEventFingerprint', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const before: number = graph.events.fingerprint();
      graph.completeTask(TASK_A, 30000);
      const after: number = graph.events.fingerprint();
      expect(after === before).assertFalse();
      expect(graph.events.size()).assertEqual(5);
      expect(graph.events.last()).assertEqual('completed:A');
      expect(textFingerprint(graph.eventTrace())).assertEqual(after);
      expect(graph.canRunTaskC()).assertFalse();
    });
  });
}
