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
 * RestartAndRetry suite.
 *
 * Covers the second run of the page after a reset, the retry policy that guards
 * transient transport errors, the rule that a completed row is never retried and
 * that a failed row can be retried through a reset without losing its attempt
 * history.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   79-95    completeTaskA / completeTaskB / completeTaskC
 *   133-141  start callback early return on a non-zero err.code
 *   174-198  startAllTasks guarded by isTaskFinished
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
  ERROR_CREATE,
  ERROR_START,
  ERROR_NETWORK,
  ERROR_TIMEOUT,
  PROGRESS_TOTAL,
  PROGRESS_INITIAL,
  DownloadTask,
  TaskGraph,
  createTaskGraph,
  RetryPolicy,
  NetworkMetrics,
  completionTrace,
  isRetryableError,
  isTerminalStatus,
  classifyStartResult
} from '../Shared/SharedDriver';

export default function restartAndRetryTest(): void {
  describe('RestartAndRetry', () => {
    beforeAll(() => {
      logSuite('RestartAndRetry', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('RestartAndRetry', 'end');
    });

    /**
     * @tc.name   restartAfterResetRunsAgainFromIdle
     * @tc.desc   After a completed run is reset, startAll is accepted again and both shared rows return to running.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('restartAfterResetRunsAgainFromIdle', 0, () => {
      logStep('RestartAndRetry', 'restart a finished run');
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      expect(graph.allCompleted()).assertTrue();
      graph.reset();
      expect(graph.startAll()).assertTrue();
      expect(graph.taskAt(0).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(1).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.isTaskFinished).assertFalse();
    });

    /**
     * @tc.name   restartRepeatsCompletionOrder
     * @tc.desc   The same scripted second run yields the same completion order as the first run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('restartRepeatsCompletionOrder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      const first: string = completionTrace(graph);
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A, 11);
      graph.completeTask(TASK_B, 12);
      graph.pollTick(13);
      graph.completeTaskC(14);
      expect(completionTrace(graph)).assertEqual(first);
      expect(first).assertEqual('A|B|C');
      expect(graph.completionOrder.length).assertEqual(3);
      expect(graph.events.countOf('completed')).assertEqual(3);
    });

    /**
     * @tc.name   resetBeforeAnyStartIsHarmless
     * @tc.desc   Resetting a graph that never started leaves it byte-identical to a fresh graph.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetBeforeAnyStartIsHarmless', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const fresh: string = graph.snapshotText();
      graph.reset();
      expect(graph.snapshotText()).assertEqual(fresh);
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.events.size()).assertEqual(0);
      expect(graph.startAll()).assertTrue();
    });

    /**
     * @tc.name   doubleResetKeepsGraphCoherent
     * @tc.desc   Two resets in a row neither corrupt the lock counters nor duplicate any event.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('doubleResetKeepsGraphCoherent', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.reset();
      graph.reset();
      expect(graph.lock.acquisitions).assertEqual(0);
      expect(graph.lock.rejections).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.taskAt(0).attempts).assertEqual(1);
    });

    /**
     * @tc.name   retryPolicyRetriesTransientNetworkError
     * @tc.desc   A failed row with a transport error is retryable while the attempt budget lasts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('retryPolicyRetriesTransientNetworkError', 0, () => {
      const policy: RetryPolicy = new RetryPolicy();
      expect(policy.shouldRetry(1, ERROR_NETWORK, STATUS_FAILED)).assertTrue();
      expect(policy.shouldRetry(2, ERROR_NETWORK, STATUS_FAILED)).assertTrue();
      expect(policy.shouldRetry(3, ERROR_NETWORK, STATUS_FAILED)).assertFalse();
      expect(isRetryableError(ERROR_NETWORK)).assertTrue();
      expect(policy.maxAttempts).assertEqual(3);
      expect(policy.baseDelayMs).assertEqual(200);
    });

    /**
     * @tc.name   retryPolicyRefusesCompletedTask
     * @tc.desc   A completed row is never retried even when the supplied code is non-zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('retryPolicyRefusesCompletedTask', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(5, 100);
      expect(policy.shouldRetry(1, ERROR_NETWORK, STATUS_COMPLETED)).assertFalse();
      expect(policy.shouldRetry(4, ERROR_TIMEOUT, STATUS_COMPLETED)).assertFalse();
      expect(policy.shouldRetry(1, ERROR_NETWORK, STATUS_FAILED)).assertTrue();
      expect(isTerminalStatus(STATUS_COMPLETED)).assertTrue();
      expect(isTerminalStatus(STATUS_FAILED)).assertTrue();
    });

    /**
     * @tc.name   retryPolicyRefusesAtMaxAttempts
     * @tc.desc   The attempt budget is exclusive: reaching maxAttempts blocks every further retry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('retryPolicyRefusesAtMaxAttempts', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(2, 200);
      expect(policy.shouldRetry(0, ERROR_NETWORK, STATUS_FAILED)).assertTrue();
      expect(policy.shouldRetry(1, ERROR_NETWORK, STATUS_FAILED)).assertTrue();
      expect(policy.shouldRetry(2, ERROR_NETWORK, STATUS_FAILED)).assertFalse();
      expect(policy.isExhausted(1)).assertFalse();
      expect(policy.isExhausted(2)).assertTrue();
      expect(policy.isExhausted(9)).assertTrue();
    });

    /**
     * @tc.name   retryPolicyRefusesZeroErrorCode
     * @tc.desc   A zero code means the start succeeded, so the policy never schedules a retry from it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('retryPolicyRefusesZeroErrorCode', 0, () => {
      const policy: RetryPolicy = new RetryPolicy();
      expect(policy.shouldRetry(0, ERROR_NONE, STATUS_FAILED)).assertFalse();
      expect(policy.shouldRetry(1, ERROR_NONE, STATUS_RUNNING)).assertFalse();
      expect(policy.shouldRetry(1, ERROR_START, STATUS_RUNNING)).assertTrue();
      expect(classifyStartResult(ERROR_NONE)).assertEqual('started');
      expect(classifyStartResult(ERROR_START)).assertEqual('failed');
    });

    /**
     * @tc.name   retryDelayGrowsLinearlyWithAttempt
     * @tc.desc   The backoff is baseDelay times the attempt number, so the gaps grow by one base each time.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('retryDelayGrowsLinearlyWithAttempt', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(4, 250);
      const first: number = policy.delayFor(1);
      const second: number = policy.delayFor(2);
      const third: number = policy.delayFor(3);
      expect(first).assertEqual(250);
      expect(second).assertEqual(500);
      expect(third).assertEqual(750);
      expect(second - first).assertEqual(first);
      expect(third - second).assertEqual(first);
      expect(third > second).assertTrue();
    });

    /**
     * @tc.name   retryDelayAtZeroAttemptUsesBase
     * @tc.desc   A non-positive attempt number falls back to the base delay instead of collapsing to zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('retryDelayAtZeroAttemptUsesBase', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(3, 120);
      expect(policy.delayFor(0)).assertEqual(120);
      expect(policy.delayFor(-1)).assertEqual(120);
      expect(policy.delayFor(1)).assertEqual(120);
      expect(policy.delayFor(-1)).assertEqual(policy.delayFor(0));
      expect(policy.delayFor(2)).assertEqual(240);
    });

    /**
     * @tc.name   failedTaskRetriedSucceedsOnNextAttempt
     * @tc.desc   After a failure and a reset the same row starts again, increments attempts and can complete.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('failedTaskRetriedSucceedsOnNextAttempt', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      expect(a.fail(ERROR_NETWORK)).assertTrue();
      expect(a.attempts).assertEqual(1);
      expect(a.isFailed()).assertTrue();
      a.reset();
      expect(a.isIdle()).assertTrue();
      expect(a.start(50)).assertTrue();
      expect(a.attempts).assertEqual(2);
      expect(a.complete(60)).assertTrue();
      expect(a.progress).assertEqual(PROGRESS_TOTAL);
    });

    /**
     * @tc.name   failedTaskResetKeepsAttemptCount
     * @tc.desc   Reset clears progress and status but deliberately preserves the attempt counter for auditing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedTaskResetKeepsAttemptCount', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const b: DownloadTask = graph.taskAt(1);
      b.reportProgress(70);
      b.fail(ERROR_TIMEOUT);
      b.reset();
      expect(b.progress).assertEqual(PROGRESS_INITIAL);
      expect(b.status).assertEqual(STATUS_IDLE);
      expect(b.lastErrorCode).assertEqual(ERROR_NONE);
      expect(b.attempts).assertEqual(1);
      expect(b.startedAt).assertEqual(0);
      expect(b.finishedAt).assertEqual(0);
    });

    /**
     * @tc.name   noDuplicateCompletionAcrossRetries
     * @tc.desc   Repeated completion callbacks for one row in a single run add exactly one order entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('noDuplicateCompletionAcrossRetries', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.completeTask(TASK_A, 1)).assertTrue();
      expect(graph.completeTask(TASK_A, 2)).assertFalse();
      expect(graph.completeTask(TASK_A, 3)).assertFalse();
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.taskAt(0).attempts).assertEqual(1);
    });

    /**
     * @tc.name   restartKeepsLockAcquisitionCountFresh
     * @tc.desc   Reset zeroes the acquisition counter, so the second startAll acquires exactly two shared slots.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('restartKeepsLockAcquisitionCountFresh', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      expect(graph.lock.acquisitions).assertEqual(3);
      graph.reset();
      graph.startAll();
      expect(graph.lock.acquisitions).assertEqual(2);
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(graph.lock.rejections).assertEqual(0);
    });

    /**
     * @tc.name   restartClearsErrorCodeOfFailedRow
     * @tc.desc   A failed row that is reset reports no error code on the retry, so a stale code cannot leak.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('restartClearsErrorCodeOfFailedRow', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const c: DownloadTask = graph.taskAt(2);
      c.start(1);
      c.fail(ERROR_NETWORK);
      expect(c.lastErrorCode).assertEqual(ERROR_NETWORK);
      c.reset();
      expect(c.lastErrorCode).assertEqual(ERROR_NONE);
      expect(c.start(2)).assertTrue();
      expect(c.lastErrorCode).assertEqual(ERROR_NONE);
      expect(c.isRunning()).assertTrue();
      expect(c.attempts).assertEqual(2);
    });

    /**
     * @tc.name   retryExhaustionLeavesRowFailed
     * @tc.desc   With a budget of one attempt the first failure exhausts the policy and the row stays failed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('retryExhaustionLeavesRowFailed', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(1, 200);
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const b: DownloadTask = graph.taskAt(1);
      b.fail(ERROR_TIMEOUT);
      expect(policy.isExhausted(b.attempts)).assertTrue();
      expect(policy.shouldRetry(b.attempts, ERROR_TIMEOUT, b.status)).assertFalse();
      expect(b.isFailed()).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
      expect(NetworkMetrics.from(graph).failedTasks).assertEqual(1);
    });

    /**
     * @tc.name   transientClassifierCoversNetworkTimeoutAndStart
     * @tc.desc   Exactly the three transient codes are retryable; create and no-error codes are not.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('transientClassifierCoversNetworkTimeoutAndStart', 0, () => {
      expect(isRetryableError(ERROR_NETWORK)).assertTrue();
      expect(isRetryableError(ERROR_TIMEOUT)).assertTrue();
      expect(isRetryableError(ERROR_START)).assertTrue();
      expect(isRetryableError(ERROR_CREATE)).assertFalse();
      expect(isRetryableError(ERROR_NONE)).assertFalse();
      expect(isRetryableError(ERROR_START)).assertEqual(isRetryableError(ERROR_TIMEOUT));
    });

    /**
     * @tc.name   restartAfterFailedRunClearsFailureMetrics
     * @tc.desc   Metrics taken after reset report no failures and no progress, then the retried run reports success.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('restartAfterFailedRunClearsFailureMetrics', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(1).fail(ERROR_NETWORK);
      const failed: NetworkMetrics = NetworkMetrics.from(graph);
      expect(failed.failedTasks).assertEqual(1);
      expect(failed.completedTasks).assertEqual(0);
      graph.reset();
      const cleared: NetworkMetrics = NetworkMetrics.from(graph);
      expect(cleared.failedTasks).assertEqual(0);
      expect(cleared.totalProgress).assertEqual(0);
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      expect(NetworkMetrics.from(graph).completedTasks).assertEqual(2);
    });

    /**
     * @tc.name   restartWhileRunningRejectedUntilReset
     * @tc.desc   The finished flag only re-arms startAll after a reset; a running graph rejects every retry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('restartWhileRunningRejectedUntilReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.startAll()).assertTrue();
      expect(graph.startAll()).assertFalse();
      expect(graph.startAll()).assertFalse();
      expect(graph.events.countOf('start-rejected')).assertEqual(2);
      graph.reset();
      expect(graph.startAll()).assertTrue();
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.runningCount()).assertEqual(2);
    });

    /**
     * @tc.name   pollingRestartedAfterResetStartsCOnce
     * @tc.desc   The second run polls from zero ticks and still starts C exactly once when the gate opens.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollingRestartedAfterResetStartsCOnce', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A, 11);
      graph.completeTask(TASK_B, 12);
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.pollTick(13)).assertTrue();
      expect(graph.pollTick(14)).assertFalse();
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.taskAt(2).startedAt).assertEqual(13);
    });

    /**
     * @tc.name   failedPrerequisiteBlocksGateUntilRetried
     * @tc.desc   A failed B keeps the gate closed after A completes; retrying B through a row reset opens it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failedPrerequisiteBlocksGateUntilRetried', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      const b: DownloadTask = graph.taskAt(1);
      b.fail(ERROR_NETWORK);
      expect(graph.canRunTaskC()).assertFalse();
      b.reset();
      expect(b.start(2)).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.completeTask(TASK_B, 3)).assertTrue();
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   attemptsIncrementOncePerAcceptedStart
     * @tc.desc   Only an accepted start increments attempts, so rejected repeats do not inflate the audit counter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('attemptsIncrementOncePerAcceptedStart', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      expect(a.start(5)).assertFalse();
      expect(a.start(6)).assertFalse();
      expect(a.attempts).assertEqual(1);
      graph.completeTask(TASK_A, 7);
      expect(a.start(8)).assertFalse();
      expect(a.attempts).assertEqual(1);
      a.reset();
      expect(a.start(9)).assertTrue();
      expect(a.attempts).assertEqual(2);
    });

    /**
     * @tc.name   restartKeepsTaskNumbersAndUrls
     * @tc.desc   A retried run keeps the original row identity, URLs and row count untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('restartKeepsTaskNumbersAndUrls', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const firstUrl: string = graph.taskAt(0).url;
      const thirdUrl: string = graph.taskAt(2).url;
      for (let run = 0; run < 2; run++) {
        graph.startAll();
        graph.completeTask(TASK_A, run * 10 + 1);
        graph.completeTask(TASK_B, run * 10 + 2);
        graph.pollTick(run * 10 + 3);
        graph.reset();
      }
      expect(graph.taskAt(0).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(1).taskNo).assertEqual(TASK_B);
      expect(graph.taskAt(2).taskNo).assertEqual(TASK_C);
      expect(graph.taskAt(0).url).assertEqual(firstUrl);
      expect(graph.taskAt(2).url).assertEqual(thirdUrl);
      expect(graph.tasks.length).assertEqual(3);
    });

    /**
     * @tc.name   retryAfterCompletionRefusedByPolicyAndRow
     * @tc.desc   Both the row guard and the policy reject a retry of an already completed download.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('retryAfterCompletionRefusedByPolicyAndRow', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(3, 200);
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick();
      graph.completeTask(TASK_C, 1);
      const c: DownloadTask = graph.taskAt(2);
      expect(policy.shouldRetry(0, ERROR_NETWORK, c.status)).assertFalse();
      expect(c.start(2)).assertFalse();
      expect(c.reportProgress(5)).assertEqual(PROGRESS_TOTAL);
      expect(c.attempts).assertEqual(1);
      expect(c.isComplete()).assertTrue();
    });

    /**
     * @tc.name   retryBudgetBoundariesStayExclusive
     * @tc.desc   For every budget from one to four the last accepted attempt is maxAttempts minus one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('retryBudgetBoundariesStayExclusive', 0, () => {
      for (let budget = 1; budget <= 4; budget++) {
        const policy: RetryPolicy = new RetryPolicy(budget, 200);
        let accepted: number = 0;
        for (let attempt = 0; attempt <= budget; attempt++) {
          if (policy.shouldRetry(attempt, ERROR_NETWORK, STATUS_FAILED)) {
            accepted = accepted + 1;
          }
        }
        expect(accepted).assertEqual(budget);
        expect(policy.isExhausted(budget - 1)).assertFalse();
        expect(policy.isExhausted(budget)).assertTrue();
      }
    });

    /**
     * @tc.name   secondRunTraceFingerprintMatchesFirst
     * @tc.desc   The event fingerprint of a retried run equals the fingerprint of the original identical run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('secondRunTraceFingerprintMatchesFirst', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      const firstPrint: number = graph.events.fingerprint();
      const firstTrace: string = graph.eventTrace();
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A, 101);
      graph.completeTask(TASK_B, 102);
      graph.pollTick(103);
      graph.completeTaskC(104);
      expect(graph.eventTrace()).assertEqual(firstTrace);
      expect(graph.events.fingerprint()).assertEqual(firstPrint);
      expect(graph.events.size()).assertEqual(11);
      expect(graph.allCompleted()).assertTrue();
    });

    /**
     * @tc.name   retryRestoresProgressOnlyOnCompletion
     * @tc.desc   A retried row restarts at zero progress and reaches 100 only when its completion path runs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('retryRestoresProgressOnlyOnCompletion', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      a.reportProgress(65);
      a.fail(ERROR_TIMEOUT);
      a.reset();
      a.start(20);
      expect(a.progress).assertEqual(PROGRESS_INITIAL);
      expect(a.reportProgress(20)).assertEqual(20);
      expect(a.progress).assertEqual(20);
      expect(graph.completeTask(TASK_A, 21)).assertTrue();
      expect(a.progress).assertEqual(PROGRESS_TOTAL);
      expect(a.status).assertEqual(STATUS_COMPLETED);
    });

    /**
     * @tc.name   resetPreservesAttemptHistoryAcrossThreeRuns
     * @tc.desc   Three failed and reset attempts leave the row with an attempt count of three while idle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetPreservesAttemptHistoryAcrossThreeRuns', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const b: DownloadTask = graph.taskAt(1);
      b.fail(ERROR_NETWORK);
      b.reset();
      b.start(10);
      b.fail(ERROR_TIMEOUT);
      b.reset();
      b.start(20);
      b.fail(ERROR_START);
      b.reset();
      expect(b.attempts).assertEqual(3);
      expect(b.status).assertEqual(STATUS_IDLE);
      expect(b.progress).assertEqual(PROGRESS_INITIAL);
      expect(b.lastErrorCode).assertEqual(ERROR_NONE);
      expect(b.isRunning()).assertFalse();
    });

    /**
     * @tc.name   retryDelayIgnoresErrorCode
     * @tc.desc   Backoff depends only on the attempt index, so every transient code yields the same delay.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the RestartAndRetry scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('retryDelayIgnoresErrorCode', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(5, 150);
      const networkDelay: number = policy.delayFor(3);
      expect(networkDelay).assertEqual(450);
      expect(policy.delayFor(3)).assertEqual(networkDelay);
      expect(policy.shouldRetry(2, ERROR_NETWORK, STATUS_FAILED)).assertTrue();
      expect(policy.shouldRetry(2, ERROR_TIMEOUT, STATUS_FAILED)).assertTrue();
      expect(policy.shouldRetry(2, ERROR_START, STATUS_FAILED)).assertTrue();
      expect(policy.delayFor(4)).assertEqual(600);
    });
  });
}
