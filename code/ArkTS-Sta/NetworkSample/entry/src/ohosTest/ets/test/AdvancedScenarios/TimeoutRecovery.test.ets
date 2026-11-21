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
 * TimeoutRecovery suite.
 *
 * Models the timeout surface of the download branch: the dedicated error code,
 * the retry backoff that grows per attempt, exhaustion of the attempt budget,
 * the reset and retry that follow, poll behaviour while a branch is timed out
 * and the metrics reported at that moment.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   98-107   checkAndUnlock / canRunTaskC, both keyed on completion only
 *   117-147  agent.create and task.start callbacks that log err.code
 *   174-198  200 ms poll that starts C when the gate opens
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
  POLL_INTERVAL_MS,
  DownloadTask,
  TaskGraph,
  createTaskGraph,
  RetryPolicy,
  PollClock,
  NetworkMetrics,
  completionTrace,
  isRetryableError,
  isTerminalStatus
} from '../Shared/SharedDriver';

export default function timeoutRecoveryTest(): void {
  describe('TimeoutRecovery', () => {
    beforeAll(() => {
      logSuite('TimeoutRecovery', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('TimeoutRecovery', 'end');
    });

    /**
     * @tc.name   timeoutErrorCodeHasDedicatedValue
     * @tc.desc   The timeout code is its own number and is not shared with any other error constant.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('timeoutErrorCodeHasDedicatedValue', 0, () => {
      logStep('TimeoutRecovery', 'inspect timeout code');
      expect(ERROR_TIMEOUT).assertEqual(13400004);
      expect(ERROR_TIMEOUT === ERROR_NETWORK).assertFalse();
      expect(ERROR_TIMEOUT === ERROR_START).assertFalse();
      expect(ERROR_TIMEOUT === ERROR_CREATE).assertFalse();
      expect(ERROR_TIMEOUT > ERROR_NETWORK).assertTrue();
      expect(ERROR_TIMEOUT !== ERROR_NONE).assertTrue();
    });

    /**
     * @tc.name   timeoutCodeIsRetryable
     * @tc.desc   A timeout is classified as transient, so the retry path is allowed to schedule another attempt.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('timeoutCodeIsRetryable', 0, () => {
      expect(isRetryableError(ERROR_TIMEOUT)).assertTrue();
      expect(isRetryableError(ERROR_TIMEOUT)).assertEqual(isRetryableError(ERROR_NETWORK));
      expect(isRetryableError(ERROR_CREATE)).assertFalse();
      const policy: RetryPolicy = new RetryPolicy();
      expect(policy.shouldRetry(1, ERROR_TIMEOUT, STATUS_FAILED)).assertTrue();
      expect(policy.shouldRetry(3, ERROR_TIMEOUT, STATUS_FAILED)).assertFalse();
    });

    /**
     * @tc.name   timeoutFailFreezesProgress
     * @tc.desc   A timeout turns the row terminal, so later progress callbacks cannot move its value again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('timeoutFailFreezesProgress', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      a.reportProgress(35);
      expect(a.fail(ERROR_TIMEOUT)).assertTrue();
      expect(a.progress).assertEqual(35);
      expect(a.reportProgress(90)).assertEqual(35);
      expect(a.progress).assertEqual(35);
      expect(a.lastErrorCode).assertEqual(ERROR_TIMEOUT);
    });

    /**
     * @tc.name   timeoutStatusIsTerminal
     * @tc.desc   The failed status produced by a timeout is terminal and blocks a fresh start on the same row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timeoutStatusIsTerminal', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const b: DownloadTask = graph.taskAt(1);
      b.fail(ERROR_TIMEOUT);
      expect(b.status).assertEqual(STATUS_FAILED);
      expect(isTerminalStatus(b.status)).assertTrue();
      expect(b.isFailed()).assertTrue();
      expect(b.isRunning()).assertFalse();
      expect(b.start(5)).assertFalse();
      expect(b.attempts).assertEqual(1);
    });

    /**
     * @tc.name   timeoutDelayGrowsPerAttempt
     * @tc.desc   The timeout backoff multiplies the base delay by the attempt index, so waits keep increasing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('timeoutDelayGrowsPerAttempt', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(4, 300);
      const delays: number[] = [];
      for (let attempt = 1; attempt <= 3; attempt++) {
        delays.push(policy.delayFor(attempt));
      }
      expect(delays[0]).assertEqual(300);
      expect(delays[1]).assertEqual(600);
      expect(delays[2]).assertEqual(900);
      expect(delays[2] - delays[1]).assertEqual(delays[1] - delays[0]);
      expect(delays[2] > delays[0]).assertTrue();
    });

    /**
     * @tc.name   timeoutExhaustionAfterAttemptBudget
     * @tc.desc   Repeated timeouts consumed the whole budget, so the policy refuses every further retry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timeoutExhaustionAfterAttemptBudget', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(3, 200);
      let attempt: number = 0;
      let scheduled: number = 0;
      while (policy.shouldRetry(attempt, ERROR_TIMEOUT, STATUS_FAILED)) {
        scheduled = scheduled + 1;
        attempt = attempt + 1;
      }
      expect(scheduled).assertEqual(3);
      expect(attempt).assertEqual(3);
      expect(policy.isExhausted(attempt)).assertTrue();
      expect(policy.shouldRetry(3, ERROR_TIMEOUT, STATUS_FAILED)).assertFalse();
      expect(policy.shouldRetry(4, ERROR_TIMEOUT, STATUS_FAILED)).assertFalse();
    });

    /**
     * @tc.name   timeoutResetRestoresIdleRow
     * @tc.desc   A reset after a timeout clears progress, status and the error code while keeping attempts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('timeoutResetRestoresIdleRow', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      a.reportProgress(55);
      a.fail(ERROR_TIMEOUT);
      a.reset();
      expect(a.status).assertEqual(STATUS_IDLE);
      expect(a.progress).assertEqual(PROGRESS_INITIAL);
      expect(a.lastErrorCode).assertEqual(ERROR_NONE);
      expect(a.attempts).assertEqual(1);
      expect(a.isIdle()).assertTrue();
      expect(a.start(9)).assertTrue();
    });

    /**
     * @tc.name   retryAfterTimeoutCompletesRow
     * @tc.desc   The retried row starts again, reports progress and completes with a full value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('retryAfterTimeoutCompletesRow', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const b: DownloadTask = graph.taskAt(1);
      b.fail(ERROR_TIMEOUT);
      b.reset();
      b.start(30);
      expect(b.reportProgress(40)).assertEqual(40);
      expect(graph.completeTask(TASK_B, 31)).assertTrue();
      expect(b.status).assertEqual(STATUS_COMPLETED);
      expect(b.progress).assertEqual(PROGRESS_TOTAL);
      expect(b.attempts).assertEqual(2);
      expect(b.finishedAt).assertEqual(31);
    });

    /**
     * @tc.name   timeoutOnBLeavesACompletedUntilReset
     * @tc.desc   One timed out prerequisite does not roll back the healthy prerequisite that already finished.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timeoutOnBLeavesACompletedUntilReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.taskAt(1).fail(ERROR_TIMEOUT);
      expect(graph.taskAt(0).isComplete()).assertTrue();
      expect(graph.taskAt(0).progress).assertEqual(PROGRESS_TOTAL);
      expect(graph.taskAt(1).isFailed()).assertTrue();
      expect(graph.allCompleted()).assertFalse();
      expect(graph.lock.hasShared(TASK_A)).assertFalse();
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
    });

    /**
     * @tc.name   timeoutOnBLeavesGateClosed
     * @tc.desc   A failed branch never satisfies the completion-only gate, so C stays queued.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('timeoutOnBLeavesGateClosed', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.taskAt(1).fail(ERROR_TIMEOUT);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.taskAt(0).status).assertEqual(STATUS_COMPLETED);
      expect(graph.taskAt(1).status).assertEqual(STATUS_FAILED);
    });

    /**
     * @tc.name   pollAfterTimeoutOnBranchDoesNotStartC
     * @tc.desc   Polling once a branch is timed out spends a tick, returns false and leaves the timer armed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollAfterTimeoutOnBranchDoesNotStartC', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.taskAt(1).fail(ERROR_TIMEOUT);
      expect(graph.pollTick(2)).assertFalse();
      expect(graph.pollTick(3)).assertFalse();
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.timerActive).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.taskAt(2).startedAt).assertEqual(0);
    });

    /**
     * @tc.name   timeoutRecoveryKeepsAttemptHistory
     * @tc.desc   Retrying a timed out row preserves its attempt count, so the audit trail spans both attempts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timeoutRecoveryKeepsAttemptHistory', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      a.fail(ERROR_TIMEOUT);
      a.reset();
      a.start(11);
      expect(a.attempts).assertEqual(2);
      a.fail(ERROR_TIMEOUT);
      a.reset();
      a.start(12);
      expect(a.attempts).assertEqual(3);
      expect(graph.completeTask(TASK_A, 13)).assertTrue();
      expect(a.attempts).assertEqual(3);
      expect(a.isComplete()).assertTrue();
    });

    /**
     * @tc.name   timeoutThenSuccessOpensGate
     * @tc.desc   Recovering both prerequisites after one timeout opens the gate and lets the poll start C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timeoutThenSuccessOpensGate', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      const b: DownloadTask = graph.taskAt(1);
      b.fail(ERROR_TIMEOUT);
      expect(graph.canRunTaskC()).assertFalse();
      b.reset();
      b.start(2);
      graph.completeTask(TASK_B, 3);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.pollTick(4)).assertTrue();
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(completionTrace(graph)).assertEqual('A|B');
    });

    /**
     * @tc.name   pollClockMeasuresTimeoutWindows
     * @tc.desc   Each poll tick advances the clock by the production 200 ms interval and measures whole windows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pollClockMeasuresTimeoutWindows', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      expect(clock.intervalMs).assertEqual(POLL_INTERVAL_MS);
      expect(clock.tick()).assertEqual(200);
      expect(clock.tick()).assertEqual(400);
      expect(clock.tick()).assertEqual(600);
      expect(clock.ticks).assertEqual(3);
      expect(clock.isDueAfter(3)).assertTrue();
      expect(clock.isDueAfter(4)).assertFalse();
    });

    /**
     * @tc.name   pollClockStopsOnRecovery
     * @tc.desc   Once the recovery poll stops the clock, further ticks leave the elapsed time unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollClockStopsOnRecovery', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      clock.tick();
      clock.tick();
      const elapsed: number = clock.elapsedMs;
      clock.stop();
      expect(clock.active).assertFalse();
      expect(clock.tick()).assertEqual(elapsed);
      expect(clock.tick()).assertEqual(elapsed);
      expect(clock.elapsedMs).assertEqual(400);
      expect(clock.ticks).assertEqual(2);
    });

    /**
     * @tc.name   pollClockRestartResetsCounters
     * @tc.desc   Restarting the clock after a timeout recovery begins again from zero ticks and zero elapsed time.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollClockRestartResetsCounters', 0, () => {
      const clock: PollClock = new PollClock(200);
      clock.start();
      clock.tick();
      clock.tick();
      clock.tick();
      expect(clock.elapsedMs).assertEqual(600);
      clock.stop();
      clock.start();
      expect(clock.ticks).assertEqual(0);
      expect(clock.elapsedMs).assertEqual(0);
      expect(clock.active).assertTrue();
      expect(clock.tick()).assertEqual(200);
    });

    /**
     * @tc.name   timeoutMetricsReportFailure
     * @tc.desc   Metrics during a timed out run count the failure, not a completion, and expose partial progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timeoutMetricsReportFailure', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(50);
      graph.completeTask(TASK_A, 1);
      graph.taskAt(1).fail(ERROR_TIMEOUT);
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      expect(metrics.totalTasks).assertEqual(3);
      expect(metrics.completedTasks).assertEqual(1);
      expect(metrics.failedTasks).assertEqual(1);
      expect(metrics.totalProgress).assertEqual(100);
      expect(metrics.successRatio()).assertEqual(1.0 / 3);
      expect(metrics.averageProgress()).assertEqual(100.0 / 3);
    });

    /**
     * @tc.name   timeoutSequenceExhaustsThenRecovers
     * @tc.desc   Three timeouts exhaust the budget, then a reset and a fourth attempt completes the row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('timeoutSequenceExhaustsThenRecovers', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(3, 200);
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      for (let attempt = 0; attempt < 3; attempt++) {
        expect(policy.shouldRetry(attempt, ERROR_TIMEOUT, STATUS_FAILED)).assertTrue();
        a.fail(ERROR_TIMEOUT);
        a.reset();
        a.start(attempt + 1);
      }
      expect(a.attempts).assertEqual(4);
      expect(policy.isExhausted(a.attempts)).assertTrue();
      expect(policy.shouldRetry(3, ERROR_TIMEOUT, STATUS_FAILED)).assertFalse();
      expect(graph.completeTask(TASK_A, 20)).assertTrue();
      expect(a.isComplete()).assertTrue();
      expect(a.finishedAt).assertEqual(20);
    });

    /**
     * @tc.name   timeoutDoesNotCompleteGraph
     * @tc.desc   A timed out branch never lets the aggregate completion flag flip, even after every poll.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timeoutDoesNotCompleteGraph', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.taskAt(1).fail(ERROR_TIMEOUT);
      graph.pollTick(2);
      graph.pollTick(3);
      expect(graph.allCompleted()).assertFalse();
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      expect(NetworkMetrics.from(graph).completedTasks).assertEqual(1);
    });

    /**
     * @tc.name   timeoutProgressPreservedUntilReset
     * @tc.desc   The partial value of a timed out row survives until reset, then the row restarts from zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timeoutProgressPreservedUntilReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const b: DownloadTask = graph.taskAt(1);
      b.reportProgress(80);
      b.fail(ERROR_TIMEOUT);
      expect(b.progress).assertEqual(80);
      expect(graph.totalProgress()).assertEqual(80);
      b.reset();
      expect(b.progress).assertEqual(PROGRESS_INITIAL);
      expect(graph.totalProgress()).assertEqual(0);
      expect(b.label()).assertEqual('任务B当前进度 0%');
    });

    /**
     * @tc.name   timeoutErrorDistinctFromNetworkError
     * @tc.desc   Timeout and network failures are separate codes yet share the transient classification.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timeoutErrorDistinctFromNetworkError', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_TIMEOUT);
      graph.taskAt(1).fail(ERROR_NETWORK);
      expect(graph.taskAt(0).lastErrorCode === graph.taskAt(1).lastErrorCode).assertFalse();
      expect(graph.taskAt(0).lastErrorCode).assertEqual(ERROR_TIMEOUT);
      expect(graph.taskAt(1).lastErrorCode).assertEqual(ERROR_NETWORK);
      expect(isRetryableError(graph.taskAt(0).lastErrorCode)).assertTrue();
      expect(isRetryableError(graph.taskAt(1).lastErrorCode)).assertTrue();
      expect(NetworkMetrics.from(graph).failedTasks).assertEqual(2);
    });

    /**
     * @tc.name   completedRowNeverSchedulesTimeoutRetry
     * @tc.desc   Once completed, a row is not retried even if the caller supposes a timeout code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completedRowNeverSchedulesTimeoutRetry', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(5, 200);
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      const a: DownloadTask = graph.taskAt(0);
      expect(policy.shouldRetry(1, ERROR_TIMEOUT, a.status)).assertFalse();
      expect(isTerminalStatus(a.status)).assertTrue();
      expect(a.reportProgress(10)).assertEqual(PROGRESS_TOTAL);
      expect(a.start(2)).assertFalse();
      expect(a.progress).assertEqual(PROGRESS_TOTAL);
    });

    /**
     * @tc.name   timeoutOnCRetainsPrerequisitesUntilReset
     * @tc.desc   When C itself times out, the finished prerequisites stay completed until the whole graph resets.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('timeoutOnCRetainsPrerequisitesUntilReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      const c: DownloadTask = graph.taskAt(2);
      c.reportProgress(45);
      c.fail(ERROR_TIMEOUT);
      expect(c.progress).assertEqual(45);
      expect(graph.taskAt(0).isComplete()).assertTrue();
      expect(graph.taskAt(1).isComplete()).assertTrue();
      expect(graph.allCompleted()).assertFalse();
      graph.reset();
      expect(graph.totalProgress()).assertEqual(0);
      expect(c.lastErrorCode).assertEqual(ERROR_NONE);
    });

    /**
     * @tc.name   timeoutRecoveryTraceAddsOnlyCompletion
     * @tc.desc   The retry path writes no graph event, so recovery changes the trace only through the completion.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('timeoutRecoveryTraceAddsOnlyCompletion', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      const afterFirst: number = graph.events.size();
      graph.taskAt(1).fail(ERROR_TIMEOUT);
      expect(graph.events.size()).assertEqual(afterFirst);
      graph.taskAt(1).reset();
      graph.taskAt(1).start(2);
      expect(graph.events.size()).assertEqual(afterFirst);
      graph.completeTask(TASK_B, 3);
      expect(graph.events.size()).assertEqual(afterFirst + 2);
      expect(graph.events.last()).assertEqual('unlocked:C');
    });

    /**
     * @tc.name   timeoutRetryRespectsCustomBaseDelay
     * @tc.desc   A shorter base delay scales the timeout backoff without changing how many attempts are allowed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timeoutRetryRespectsCustomBaseDelay', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(2, 50);
      expect(policy.delayFor(1)).assertEqual(50);
      expect(policy.delayFor(2)).assertEqual(100);
      expect(policy.maxAttempts).assertEqual(2);
      expect(policy.shouldRetry(1, ERROR_TIMEOUT, STATUS_FAILED)).assertTrue();
      expect(policy.shouldRetry(2, ERROR_TIMEOUT, STATUS_FAILED)).assertFalse();
      expect(policy.delayFor(2) < 200).assertTrue();
    });

    /**
     * @tc.name   timeoutAcrossTwoRowsBothRecover
     * @tc.desc   A and B can both time out and both recover through resets before the gate finally opens.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('timeoutAcrossTwoRowsBothRecover', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      const b: DownloadTask = graph.taskAt(1);
      a.fail(ERROR_TIMEOUT);
      b.fail(ERROR_TIMEOUT);
      expect(NetworkMetrics.from(graph).failedTasks).assertEqual(2);
      a.reset();
      b.reset();
      a.start(1);
      b.start(2);
      expect(a.attempts).assertEqual(2);
      expect(b.attempts).assertEqual(2);
      graph.completeTask(TASK_A, 3);
      graph.completeTask(TASK_B, 4);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.runningCount()).assertEqual(0);
    });

    /**
     * @tc.name   timeoutResetRestartsPollWindow
     * @tc.desc   Resetting after a timed out run rewinds the poll counter so the next run measures its own window.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TimeoutRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timeoutResetRestartsPollWindow', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_TIMEOUT);
      graph.pollTick(1);
      graph.pollTick(2);
      expect(graph.pollTicks).assertEqual(2);
      graph.reset();
      expect(graph.pollTicks).assertEqual(0);
      graph.startAll();
      expect(graph.pollTick(3)).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.timerActive).assertTrue();
    });
  });
}
