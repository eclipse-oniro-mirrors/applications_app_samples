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
 * UserScenario suite.
 *
 * Each case replays one thing a user can actually do on the page: tap start
 * once, tap it twice, wait for both bars, wait on a slow download, retry after
 * a failed download, or leave the page and come back. The expectations are
 * derived from the gate rule (A and B before C) rather than from the mirror
 * class, so the suite describes behaviour a reviewer can check by hand.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   60       isTaskFinished starts true, so the first tap is accepted
 *   62-64    lock, taskACompleted, taskBCompleted
 *   79-102   completeTaskA/B, checkAndUnlock, canRunTaskC
 *   130-142  onProgress and start callback branches
 *   174-198  startAllTasks and the 200 ms interval
 *   250-259  the start button and its enabled(isTaskFinished) binding
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
  ERROR_NETWORK,
  ERROR_TIMEOUT,
  ERROR_CREATE,
  createTaskGraph,
  expectedProgressAfter,
  RetryPolicy,
  NetworkMetrics,
  PollClock,
  completionTrace,
  isTopologicalCompletion,
  progressLabel,
  startButtonEnabled,
  isRetryableError,
  classifyStartResult,
  TaskGraph
} from '../Shared/SharedDriver';

export default function userScenariosTest(): void {
  describe('UserScenarios', () => {
    beforeAll(() => {
      logSuite('UserScenarios', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('UserScenarios', 'end');
    });

    /**
     * @tc.name   quickTapStartsBothDependenciesImmediately
     * @tc.desc   One tap on a fresh page starts A and B at the same time and records both starts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('quickTapStartsBothDependenciesImmediately', 0, () => {
      const graph = createTaskGraph();
      expect(graph.startAll()).assertTrue();
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.taskAt(0).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(1).status).assertEqual(STATUS_RUNNING);
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.taskAt(0).startedAt).assertEqual(0);
      expect(graph.taskAt(1).startedAt).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.taskAt(0).progressRatio()).assertEqual(0);
      expect(graph.taskAt(1).progressRatio()).assertEqual(0);
      expect(graph.lock.hasShared(TASK_A) && graph.lock.hasShared(TASK_B)).assertTrue();
    });

    /**
     * @tc.name   quickTapLeavesExclusiveTaskParked
     * @tc.desc   The third row stays idle at zero percent right after the first tap.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('quickTapLeavesExclusiveTaskParked', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.taskAt(2).attempts).assertEqual(0);
      expect(graph.taskAt(2).label()).assertEqual(progressLabel(TASK_C, 0));
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(graph.timerActive).assertTrue();
      expect(graph.timerActive && graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.events.countOf('queued')).assertEqual(1);
    });

    /**
     * @tc.name   waitForBothDependenciesUnlocksThird
     * @tc.desc   A user who waits until both bars reach 100 percent sees the third download start on the next poll.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('waitForBothDependenciesUnlocksThird', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.taskAt(0).progress).assertEqual(100);
      expect(graph.taskAt(1).progress).assertEqual(100);
      expect(graph.taskAt(0).label()).assertEqual('任务A当前进度 100%');
      expect(graph.taskAt(1).label()).assertEqual('任务B当前进度 100%');
      expect(graph.pollTick(POLL_INTERVAL_MS)).assertTrue();
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.runningCount()).assertEqual(1);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.timerActive).assertFalse();
    });

    /**
     * @tc.name   slowTaskKeepsGateClosedAcrossManyPolls
     * @tc.desc   A dependency that is still downloading keeps the interval alive for many rounds without starting C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('slowTaskKeepsGateClosedAcrossManyPolls', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      for (let round = 0; round < 8; round++) {
        expect(graph.pollTick(POLL_INTERVAL_MS * (round + 1))).assertFalse();
      }
      expect(graph.pollTicks).assertEqual(8);
      expect(graph.timerActive).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.taskAt(2).attempts).assertEqual(0);
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.runningCount()).assertEqual(1);
      expect(graph.canRunTaskC()).assertFalse();
    });

    /**
     * @tc.name   slowTaskReportsIntermediateProgressOnly
     * @tc.desc   Progress callbacks on a slow dependency move its own bar and never touch the other rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('slowTaskReportsIntermediateProgressOnly', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const steps: number[] = [12, 27, 44, 61, 78, 93];
      for (let index = 0; index < steps.length; index++) {
        expect(graph.taskAt(1).reportProgress(steps[index])).assertEqual(steps[index]);
      }
      expect(graph.taskAt(1).progress).assertEqual(93);
      expect(graph.taskAt(0).progress).assertEqual(0);
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.taskAt(1).label()).assertEqual(progressLabel(TASK_B, 93));
      expect(graph.taskAt(1).progressRatio()).assertEqual(0.93);
      expect(graph.taskAt(1).status).assertEqual(STATUS_RUNNING);
      expect(graph.pollTick(POLL_INTERVAL_MS)).assertFalse();
      expect(graph.taskAt(1).label().endsWith('93%')).assertTrue();
      expect(graph.totalProgress()).assertEqual(93);
      expect(graph.taskAt(1).isRunning()).assertTrue();
      expect(graph.taskAt(1).lastErrorCode).assertEqual(ERROR_NONE);
    });

    /**
     * @tc.name   gateOpensExactlyWhenSlowDependencyFinishes
     * @tc.desc   The third task becomes runnable in the same step that the slow dependency completes, not before.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateOpensExactlyWhenSlowDependencyFinishes', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      graph.taskAt(0).reportProgress(99);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.pollTick(POLL_INTERVAL_MS)).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      graph.taskAt(0).reportProgress(100);
      expect(graph.taskAt(0).progress).assertEqual(100);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.completeTask(TASK_A)).assertTrue();
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.pollTick(2 * POLL_INTERVAL_MS)).assertTrue();
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(1);
    });

    /**
     * @tc.name   failureBlocksGateUntilSuccessfulRetry
     * @tc.desc   A failed dependency keeps the gate closed even when the other task completed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('failureBlocksGateUntilSuccessfulRetry', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      expect(graph.taskAt(0).fail(ERROR_NETWORK)).assertTrue();
      expect(graph.taskAt(0).isFailed()).assertTrue();
      expect(graph.taskAt(0).lastErrorCode).assertEqual(ERROR_NETWORK);
      expect(graph.taskAt(0).progress).assertEqual(0);
      expect(graph.completeTask(TASK_B)).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.runTaskCIfReady()).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(isRetryableError(ERROR_NETWORK)).assertTrue();
    });

    /**
     * @tc.name   retryAfterFailureRestartsTask
     * @tc.desc   After the user retries a failed row, the task runs again, counts a second attempt and can complete.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('retryAfterFailureRestartsTask', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_NETWORK);
      expect(graph.taskAt(0).attempts).assertEqual(1);
      expect(graph.taskAt(0).start(100)).assertFalse();
      graph.taskAt(0).reset();
      expect(graph.taskAt(0).isIdle()).assertTrue();
      expect(graph.taskAt(0).lastErrorCode).assertEqual(ERROR_NONE);
      expect(graph.taskAt(0).start(200)).assertTrue();
      expect(graph.taskAt(0).attempts).assertEqual(2);
      expect(graph.taskAt(0).isRunning()).assertTrue();
      expect(graph.completeTask(TASK_A)).assertTrue();
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
      graph.completeTask(TASK_B);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.pollTick(400)).assertTrue();
      expect(graph.taskAt(2).isRunning()).assertTrue();
    });

    /**
     * @tc.name   retryPolicyCapsAttempts
     * @tc.desc   The retry helper stops asking for a new attempt once the configured maximum is used up.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('retryPolicyCapsAttempts', 0, () => {
      const policy = new RetryPolicy(3, POLL_INTERVAL_MS);
      expect(policy.shouldRetry(0, ERROR_NETWORK, STATUS_RUNNING)).assertTrue();
      expect(policy.shouldRetry(1, ERROR_TIMEOUT, STATUS_RUNNING)).assertTrue();
      expect(policy.shouldRetry(2, ERROR_CREATE, STATUS_RUNNING)).assertTrue();
      expect(policy.shouldRetry(3, ERROR_NETWORK, STATUS_RUNNING)).assertFalse();
      expect(policy.shouldRetry(9, ERROR_NETWORK, STATUS_RUNNING)).assertFalse();
      expect(policy.isExhausted(2)).assertFalse();
      expect(policy.isExhausted(3)).assertTrue();
      expect(policy.isExhausted(4)).assertTrue();
      expect(policy.maxAttempts).assertEqual(3);
      expect(policy.baseDelayMs).assertEqual(POLL_INTERVAL_MS);
      const generous = new RetryPolicy(10, 100);
      expect(generous.shouldRetry(9, ERROR_NETWORK, STATUS_RUNNING)).assertTrue();
      expect(generous.shouldRetry(10, ERROR_NETWORK, STATUS_RUNNING)).assertFalse();
      expect(generous.delayFor(3)).assertEqual(300);
    });

    /**
     * @tc.name   completedTaskIsNeverRetried
     * @tc.desc   A successful row is exempt from retry even when a stale non-zero error code is supplied.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completedTaskIsNeverRetried', 0, () => {
      const graph = createTaskGraph();
      const policy = new RetryPolicy();
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.taskAt(0).status).assertEqual(STATUS_COMPLETED);
      expect(policy.shouldRetry(0, ERROR_NETWORK, graph.taskAt(0).status)).assertFalse();
      expect(policy.shouldRetry(1, ERROR_CREATE, graph.taskAt(0).status)).assertFalse();
      expect(policy.shouldRetry(0, ERROR_NONE, STATUS_RUNNING)).assertFalse();
      expect(policy.shouldRetry(0, ERROR_NONE, STATUS_IDLE)).assertFalse();
      expect(policy.shouldRetry(0, ERROR_TIMEOUT, STATUS_FAILED)).assertTrue();
      expect(graph.taskAt(0).start(50)).assertFalse();
      expect(graph.taskAt(0).attempts).assertEqual(1);
      expect(graph.taskAt(0).progress).assertEqual(100);
    });

    /**
     * @tc.name   failedTaskCannotStartWithoutReset
     * @tc.desc   A failed row is terminal: the start guard refuses it until the user resets the row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedTaskCannotStartWithoutReset', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(1).fail(ERROR_TIMEOUT);
      expect(graph.taskAt(1).isFailed()).assertTrue();
      expect(graph.taskAt(1).start(100)).assertFalse();
      expect(graph.taskAt(1).start(200)).assertFalse();
      expect(graph.taskAt(1).attempts).assertEqual(1);
      expect(graph.taskAt(1).startedAt).assertEqual(0);
      expect(graph.taskAt(1).lastErrorCode).assertEqual(ERROR_TIMEOUT);
      graph.taskAt(1).reset();
      expect(graph.taskAt(1).start(300)).assertTrue();
      expect(graph.taskAt(1).attempts).assertEqual(2);
      expect(graph.taskAt(1).startedAt).assertEqual(300);
      expect(graph.taskAt(1).isRunning()).assertTrue();
      expect(graph.taskAt(1).lastErrorCode).assertEqual(ERROR_NONE);
      expect(classifyStartResult(ERROR_TIMEOUT)).assertEqual('failed');
      expect(classifyStartResult(ERROR_NONE)).assertEqual('started');
    });

    /**
     * @tc.name   leavePageResetClearsRunState
     * @tc.desc   Leaving the page mid-run and rebuilding the model clears progress, events, polling and the gate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('leavePageResetClearsRunState', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.taskAt(1).reportProgress(55);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.reset();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.events.size()).assertEqual(0);
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.lock.sharedHolders.length).assertEqual(0);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.totalProgress()).assertEqual(0);
      for (let index = 0; index < graph.tasks.length; index++) {
        expect(graph.taskAt(index).status).assertEqual(STATUS_IDLE);
        expect(graph.taskAt(index).progress).assertEqual(0);
        expect(graph.taskAt(index).label()).assertEqual(progressLabel(graph.taskAt(index).taskNo, 0));
      }
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.allCompleted()).assertFalse();
      expect(graph.taskAt(0).label()).assertEqual(progressLabel(TASK_A, 0));
      expect(graph.taskAt(1).label()).assertEqual(progressLabel(TASK_B, 0));
      expect(graph.events.countOf('started')).assertEqual(0);
    });

    /**
     * @tc.name   returnAfterResetRunsTheWholeFlowAgain
     * @tc.desc   After coming back to the page, a second tap repeats the complete A, B, gate, C flow.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('returnAfterResetRunsTheWholeFlowAgain', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(400);
      expect(graph.allCompleted()).assertTrue();
      graph.reset();
      expect(graph.startAll()).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.runningCount()).assertEqual(2);
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_A);
      expect(graph.pollTick(POLL_INTERVAL_MS)).assertTrue();
      expect(graph.completeTaskC(2 * POLL_INTERVAL_MS)).assertTrue();
      expect(graph.allCompleted()).assertTrue();
      expect(completionTrace(graph)).assertEqual('B|A|C');
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(NetworkMetrics.from(graph).successRatio()).assertEqual(1);
    });

    /**
     * @tc.name   returnAfterResetKeepsTaskOrderStable
     * @tc.desc   Reopening the page keeps the three rows in the same A, B, C order and the same seeded URLs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('returnAfterResetKeepsTaskOrderStable', 0, () => {
      const graph = createTaskGraph();
      const firstOrder: string = graph.taskAt(0).taskNo + graph.taskAt(1).taskNo + graph.taskAt(2).taskNo;
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(300);
      graph.reset();
      const secondOrder: string = graph.taskAt(0).taskNo + graph.taskAt(1).taskNo + graph.taskAt(2).taskNo;
      expect(secondOrder).assertEqual(firstOrder);
      expect(firstOrder).assertEqual('ABC');
      expect(graph.tasks.length).assertEqual(3);
      expect(graph.taskAt(0).url.indexOf('favor_list_tea.png') > 0).assertTrue();
      expect(graph.taskAt(1).url.indexOf('after_cache.png') > 0).assertTrue();
      expect(graph.taskAt(2).url.indexOf('icon_main_color.png') > 0).assertTrue();
      expect(graph.taskAt(0).isIdle()).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
    });

    /**
     * @tc.name   doubleTapIsIgnoredDuringRun
     * @tc.desc   Impatient repeated taps while the first run is active change nothing in the graph.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('doubleTapIsIgnoredDuringRun', 0, () => {
      const graph = createTaskGraph();
      expect(graph.startAll()).assertTrue();
      const attemptsA: number = graph.taskAt(0).attempts;
      const eventsAfterFirst: number = graph.events.size();
      expect(graph.startAll()).assertFalse();
      expect(graph.startAll()).assertFalse();
      expect(graph.startAll()).assertFalse();
      expect(graph.taskAt(0).attempts).assertEqual(attemptsA);
      expect(graph.taskAt(1).attempts).assertEqual(attemptsA);
      expect(graph.events.size()).assertEqual(eventsAfterFirst + 3);
      expect(graph.events.countOf('start-rejected')).assertEqual(3);
      expect(graph.lock.acquisitions).assertEqual(2);
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.timerActive).assertTrue();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   tapAfterCompletionNeedsReset
     * @tc.desc   Once the run finished the flag stays false, so the user must reset before another tap is honoured.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('tapAfterCompletionNeedsReset', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(300);
      expect(graph.allCompleted()).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.startAll()).assertFalse();
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
      graph.reset();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.startAll()).assertTrue();
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.taskAt(0).isRunning()).assertTrue();
      expect(graph.taskAt(1).isRunning()).assertTrue();
      expect(graph.events.countOf('start-rejected')).assertEqual(0);
      expect(graph.pollTicks).assertEqual(0);
    });

    /**
     * @tc.name   partialProgressSurvivesDependencyCompletion
     * @tc.desc   Whatever percentage a dependency reached, its completion callback forces the bar to exactly 100.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('partialProgressSurvivesDependencyCompletion', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      expect(graph.taskAt(0).reportProgress(17)).assertEqual(17);
      expect(graph.taskAt(1).reportProgress(3)).assertEqual(3);
      expect(graph.totalProgress()).assertEqual(20);
      expect(graph.completeTask(TASK_A)).assertTrue();
      expect(graph.taskAt(0).progress).assertEqual(100);
      expect(graph.taskAt(1).progress).assertEqual(3);
      expect(graph.taskAt(1).label().endsWith('3%')).assertTrue();
      expect(graph.completeTask(TASK_B)).assertTrue();
      expect(graph.taskAt(1).progress).assertEqual(100);
      expect(graph.totalProgress()).assertEqual(200);
      expect(graph.canRunTaskC()).assertTrue();
      expect(expectedProgressAfter(100, 3)).assertEqual(100);
      expect(expectedProgressAfter(3, 100)).assertEqual(100);
    });

    /**
     * @tc.name   userWaitOrderDrivesCompletionTrace
     * @tc.desc   The order in which the user observes A and B finishing becomes the completion trace prefix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('userWaitOrderDrivesCompletionTrace', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_A);
      expect(graph.completionOrder[0]).assertEqual(TASK_B);
      expect(graph.completionOrder[1]).assertEqual(TASK_A);
      expect(completionTrace(graph)).assertEqual('B|A');
      expect(isTopologicalCompletion(graph.completionOrder)).assertFalse();
      expect(graph.pollTick(POLL_INTERVAL_MS)).assertTrue();
      graph.completeTaskC(300);
      expect(completionTrace(graph)).assertEqual('B|A|C');
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
      expect(graph.completionOrder.indexOf(TASK_C)).assertEqual(2);
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(NetworkMetrics.from(graph).completedTasks).assertEqual(3);
      expect(graph.events.countOf('unlocked')).assertEqual(2);
      expect(graph.averageProgress()).assertEqual(100);
      expect(graph.taskAt(2).label().endsWith('100%')).assertTrue();
    });

    /**
     * @tc.name   metricsAfterFailedRunCountFailure
     * @tc.desc   A run where one row gave up reports zero successes, one failure and only the surviving bar.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('metricsAfterFailedRunCountFailure', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_NETWORK);
      graph.taskAt(1).reportProgress(48);
      const metrics = NetworkMetrics.from(graph);
      expect(metrics.totalTasks).assertEqual(3);
      expect(metrics.completedTasks).assertEqual(0);
      expect(metrics.failedTasks).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(0);
      expect(metrics.totalProgress).assertEqual(48);
      expect(metrics.averageProgress()).assertEqual(16);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.allCompleted()).assertFalse();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.taskAt(0).progressRatio()).assertEqual(0);
      expect(graph.taskAt(1).progressRatio()).assertEqual(0.48);
      expect(graph.events.countOf('completed')).assertEqual(0);
    });

    /**
     * @tc.name   metricsAfterRecoveryCountCompletedTask
     * @tc.desc   After the failed row is retried and finished, the metrics flip from a failure to a full success.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsAfterRecoveryCountCompletedTask', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_TIMEOUT);
      const failedMetrics = NetworkMetrics.from(graph);
      graph.taskAt(0).reset();
      graph.taskAt(0).start(100);
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(300);
      const recovered = NetworkMetrics.from(graph);
      expect(failedMetrics.failedTasks).assertEqual(1);
      expect(failedMetrics.completedTasks).assertEqual(0);
      expect(recovered.failedTasks).assertEqual(0);
      expect(recovered.completedTasks).assertEqual(3);
      expect(recovered.successRatio()).assertEqual(1);
      expect(recovered.averageProgress()).assertEqual(100);
      expect(failedMetrics.fingerprint() === recovered.fingerprint()).assertFalse();
      expect(graph.taskAt(0).attempts).assertEqual(2);
      expect(graph.taskAt(0).lastErrorCode).assertEqual(ERROR_NONE);
    });

    /**
     * @tc.name   scenarioHappyPathTraceIsStable
     * @tc.desc   The event trace of the ordinary user path is exactly the documented start, unlock, poll and finish chain.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('scenarioHappyPathTraceIsStable', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(2 * POLL_INTERVAL_MS);
      expect(graph.eventTrace()).assertEqual(
        'start-all:begin|started:A|started:B|queued:C|completed:A|completed:B|unlocked:C|started:C|timer-cleared:C|completed:C|unlocked:C');
      expect(graph.events.last()).assertEqual('unlocked:C');
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.events.countOf('start-rejected')).assertEqual(0);
      logStep('UserScenarios', 'happyPathLength=' + String(graph.events.size()));
      expect(graph.events.size()).assertEqual(11);
    });

    /**
     * @tc.name   retryPathLeavesEarlierEventsIntact
     * @tc.desc   Retrying a row directly keeps the original start events and only adds the later completion.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('retryPathLeavesEarlierEventsIntact', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const startEvents: number = graph.events.countOf('started');
      graph.taskAt(0).fail(ERROR_NETWORK);
      expect(graph.events.countOf('started')).assertEqual(startEvents);
      expect(graph.events.countOf('completed')).assertEqual(0);
      graph.taskAt(0).reset();
      graph.taskAt(0).start(100);
      expect(graph.events.countOf('started')).assertEqual(startEvents);
      expect(graph.taskAt(0).attempts).assertEqual(2);
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.events.countOf('completed')).assertEqual(2);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.completionOrder.length).assertEqual(2);
      expect(graph.events.last()).assertEqual('unlocked:C');
      expect(graph.pollTick(200)).assertTrue();
      expect(graph.events.countOf('started')).assertEqual(startEvents + 1);
    });

    /**
     * @tc.name   reloadMidRunDropsTimerAndGate
     * @tc.desc   Rebuilding the model during a run removes the armed interval, so no stray poll can start the third task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('reloadMidRunDropsTimerAndGate', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.timerActive).assertTrue();
      graph.reset();
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTick(POLL_INTERVAL_MS)).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.taskAt(2).attempts).assertEqual(0);
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.startAll()).assertTrue();
      expect(graph.taskAt(0).isRunning()).assertTrue();
    });

    /**
     * @tc.name   secondTapAfterResetIsAcceptedImmediately
     * @tc.desc   The user does not have to wait for a timer after returning: a reset page accepts the tap at once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('secondTapAfterResetIsAcceptedImmediately', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.reset();
      const clock = new PollClock();
      clock.start();
      expect(graph.startAll()).assertTrue();
      expect(clock.active).assertTrue();
      expect(clock.tick()).assertEqual(POLL_INTERVAL_MS);
      expect(graph.timerActive).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.isTaskFinished).assertFalse();
      expect(clock.isDueAfter(1)).assertTrue();
      clock.stop();
      expect(clock.active).assertFalse();
    });

    /**
     * @tc.name   retryDelayGrowsPerAttempt
     * @tc.desc   Each additional retry waits a longer interval, starting from the 200 ms base delay.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('retryDelayGrowsPerAttempt', 0, () => {
      const policy = new RetryPolicy();
      expect(policy.delayFor(0)).assertEqual(200);
      expect(policy.delayFor(-4)).assertEqual(200);
      expect(policy.delayFor(1)).assertEqual(200);
      expect(policy.delayFor(2)).assertEqual(400);
      expect(policy.delayFor(3)).assertEqual(600);
      expect(policy.delayFor(4) > policy.delayFor(3)).assertTrue();
      expect(policy.delayFor(2) === policy.baseDelayMs).assertFalse();
      const slower = new RetryPolicy(5, 450);
      expect(slower.delayFor(1)).assertEqual(450);
      expect(slower.delayFor(2)).assertEqual(900);
      expect(slower.shouldRetry(4, ERROR_NETWORK, STATUS_RUNNING)).assertTrue();
      expect(slower.shouldRetry(5, ERROR_NETWORK, STATUS_RUNNING)).assertFalse();
    });

    /**
     * @tc.name   abandonedRunLeavesRowsRunningUntilReset
     * @tc.desc   If the user stops watching, the two shared rows stay running; only reset returns them to idle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('abandonedRunLeavesRowsRunningUntilReset', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      for (let round = 0; round < 5; round++) {
        graph.pollTick(POLL_INTERVAL_MS * (round + 1));
      }
      expect(graph.pollTicks).assertEqual(5);
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.taskAt(0).isRunning()).assertTrue();
      expect(graph.taskAt(1).isRunning()).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.allCompleted()).assertFalse();
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.taskAt(0).label()).assertEqual(progressLabel(TASK_A, 0));
      graph.reset();
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      for (let index = 0; index < graph.tasks.length; index++) {
        expect(graph.taskAt(index).isIdle()).assertTrue();
        expect(graph.taskAt(index).startedAt).assertEqual(0);
      }
    });

    /**
     * @tc.name   userScenarioEndToEndMatchesReferenceExpectations
     * @tc.desc   The user path agrees with the independent progress, gate and completion oracles at every step.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('userScenarioEndToEndMatchesReferenceExpectations', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(64);
      expect(graph.taskAt(0).progress).assertEqual(expectedProgressAfter(0, 64));
      expect(expectedProgressAfter(64, 20)).assertEqual(64);
      graph.completeTask(TASK_A);
      expect(graph.canRunTaskC()).assertEqual(false);
      graph.completeTask(TASK_B);
      expect(graph.canRunTaskC()).assertEqual(true);
      expect(graph.pollTick(POLL_INTERVAL_MS)).assertEqual(true);
      expect(graph.completeTaskC(POLL_INTERVAL_MS * 2)).assertEqual(true);
      expect(graph.allCompleted()).assertEqual(true);
      expect(isTopologicalCompletion(graph.completionOrder)).assertEqual(true);
      expect(NetworkMetrics.from(graph).successRatio()).assertEqual(1);
      expect(startButtonEnabled(graph.isTaskFinished)).assertEqual(false);
    });

    /**
     * @tc.name   userWatchesThirdRowStayAtZeroUntilGateOpens
     * @tc.desc   While the shared downloads advance, the third label keeps reading zero until the gate opens.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('userWatchesThirdRowStayAtZeroUntilGateOpens', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(46);
      graph.taskAt(1).reportProgress(81);
      expect(graph.taskAt(2).label()).assertEqual(progressLabel(TASK_C, 0));
      expect(graph.taskAt(2).label().indexOf('0%') > 0).assertTrue();
      expect(graph.taskAt(2).progressRatio()).assertEqual(0);
      expect(graph.taskAt(0).label().indexOf('46%') > 0).assertTrue();
      graph.completeTask(TASK_A);
      expect(graph.taskAt(2).label()).assertEqual(progressLabel(TASK_C, 0));
      expect(graph.pollTick(POLL_INTERVAL_MS)).assertFalse();
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
    });

    /**
     * @tc.name   pollsAfterGateOpenNeverStartSecondRequest
     * @tc.desc   Extra timer rounds after the third download started do not create another request or another start event.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollsAfterGateOpenNeverStartSecondRequest', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.pollTick(200)).assertTrue();
      const startedC: number = graph.events.countOf('started');
      expect(graph.pollTick(400)).assertFalse();
      expect(graph.pollTick(600)).assertFalse();
      expect(graph.pollTick(800)).assertFalse();
      expect(graph.events.countOf('started')).assertEqual(startedC);
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.taskAt(2).startedAt).assertEqual(200);
      expect(graph.pollTicks).assertEqual(4);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.lock.acquisitions).assertEqual(3);
    });

    /**
     * @tc.name   failedRunRestartsCleanlyFromScratch
     * @tc.desc   Abandoning a failed run and resetting gives the user a page that behaves exactly like a first visit.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the UserScenarios scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedRunRestartsCleanlyFromScratch', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_NETWORK);
      graph.taskAt(1).fail(ERROR_TIMEOUT);
      graph.taskAt(2).reportProgress(5);
      expect(graph.taskAt(0).isFailed()).assertTrue();
      expect(graph.taskAt(1).isFailed()).assertTrue();
      expect(graph.taskAt(2).progress).assertEqual(5);
      graph.reset();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.startAll()).assertTrue();
      expect(graph.taskAt(0).isRunning()).assertTrue();
      expect(graph.taskAt(1).isRunning()).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.taskAt(0).lastErrorCode).assertEqual(ERROR_NONE);
      expect(graph.totalProgress()).assertEqual(0);
    });

    // End of user scenario suite.
  });
}
