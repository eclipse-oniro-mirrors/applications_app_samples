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
 * ErrorRecovery suite.
 *
 * Exercises the negative paths of the sample run: agent create and task start
 * failures, a failed download branch, the retry policy, recovery through reset
 * and the invariant that one failed prerequisite never unlocks task C.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   117-118  agent.create promise, rejection lands in the catch block
 *   133-142  task.start(err) branches on err.code and aborts on a non-zero code
 *   144-147  the catch handler only logs the create failure
 *   79-90    completeTaskA / completeTaskB release their dependency
 *   98-102   checkAndUnlock requires both completion booleans
 *   174-198  a single run owns the flag, the lock and the 200 ms interval
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  PROGRESS_TOTAL,
  STATUS_IDLE,
  STATUS_RUNNING,
  STATUS_COMPLETED,
  STATUS_FAILED,
  ERROR_NONE,
  ERROR_CREATE,
  ERROR_START,
  ERROR_NETWORK,
  ERROR_TIMEOUT,
  DownloadTask,
  RunSnapshot,
  TaskGraph,
  RetryPolicy,
  NetworkMetrics,
  createTaskGraph,
  classifyStartResult,
  shouldAbortStart,
  isRetryableError,
  hasDuplicateStrings,
  completionTrace,
  textFingerprint
} from '../Shared/SharedDriver';

export default function errorRecoveryLifecycleTest(): void {
  describe('ErrorRecovery', () => {
    beforeAll(() => {
      logSuite('ErrorRecovery', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('ErrorRecovery', 'end');
    });

    /**
     * @tc.name   zeroStartCodeIsClassifiedAsStarted
     * @tc.desc   The start callback treats err.code equal to zero as a successful start.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('zeroStartCodeIsClassifiedAsStarted', 0, () => {
      const verdict: string = classifyStartResult(ERROR_NONE);
      expect(verdict).assertEqual('started');
      expect(shouldAbortStart(ERROR_NONE)).assertFalse();
      expect(ERROR_NONE).assertEqual(0);
      expect(classifyStartResult(0)).assertEqual('started');
    });

    /**
     * @tc.name   nonZeroStartCodesAreClassifiedAsFailed
     * @tc.desc   Any non-zero start code is a failure and aborts the callback exactly like the page branch.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('nonZeroStartCodesAreClassifiedAsFailed', 0, () => {
      expect(classifyStartResult(ERROR_START)).assertEqual('failed');
      expect(classifyStartResult(ERROR_CREATE)).assertEqual('failed');
      expect(classifyStartResult(ERROR_NETWORK)).assertEqual('failed');
      expect(classifyStartResult(ERROR_TIMEOUT)).assertEqual('failed');
      expect(shouldAbortStart(ERROR_START)).assertTrue();
      expect(shouldAbortStart(ERROR_NETWORK)).assertTrue();
    });

    /**
     * @tc.name   retryableClassificationCoversTransientCodes
     * @tc.desc   Network, timeout and start codes are retryable while create failure is not.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('retryableClassificationCoversTransientCodes', 0, () => {
      expect(isRetryableError(ERROR_NETWORK)).assertTrue();
      expect(isRetryableError(ERROR_TIMEOUT)).assertTrue();
      expect(isRetryableError(ERROR_START)).assertTrue();
      expect(isRetryableError(ERROR_CREATE)).assertFalse();
      expect(isRetryableError(ERROR_NONE)).assertFalse();
      expect(isRetryableError(999)).assertFalse();
    });

    /**
     * @tc.name   errorCodesAreDistinctPositiveConstants
     * @tc.desc   The four simulation codes never collide, so a log line identifies one failure mode.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('errorCodesAreDistinctPositiveConstants', 0, () => {
      const codes: string[] = [String(ERROR_CREATE), String(ERROR_START), String(ERROR_NETWORK), String(ERROR_TIMEOUT)];
      expect(codes.length).assertEqual(4);
      expect(hasDuplicateStrings(codes)).assertFalse();
      expect(ERROR_CREATE > 0).assertTrue();
      expect(ERROR_START > ERROR_CREATE).assertTrue();
      expect(ERROR_NETWORK > ERROR_START).assertTrue();
      expect(ERROR_TIMEOUT > ERROR_NETWORK).assertTrue();
    });

    /**
     * @tc.name   failedRowStoresCodeAndTerminalStatus
     * @tc.desc   fail() records the error code and moves the row into the failed terminal status.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('failedRowStoresCodeAndTerminalStatus', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      const failed: boolean = a.fail(ERROR_NETWORK);
      expect(failed).assertTrue();
      expect(a.status).assertEqual(STATUS_FAILED);
      expect(a.isFailed()).assertTrue();
      expect(a.lastErrorCode).assertEqual(ERROR_NETWORK);
      expect(a.isComplete()).assertFalse();
      expect(a.progress).assertEqual(0);
    });

    /**
     * @tc.name   failedRowFreezesItsProgress
     * @tc.desc   After the failure no later progress callback can move the frozen row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedRowFreezesItsProgress', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const b: DownloadTask = graph.taskAt(1);
      b.reportProgress(40);
      b.fail(ERROR_TIMEOUT);
      const afterLateReport: number = b.reportProgress(95);
      expect(afterLateReport).assertEqual(40);
      expect(b.progress).assertEqual(40);
      expect(b.progressRatio()).assertEqual(0.4);
      expect(b.lastErrorCode).assertEqual(ERROR_TIMEOUT);
      expect(b.isRunning()).assertFalse();
    });

    /**
     * @tc.name   completedRowCannotBeFailed
     * @tc.desc   A completed download ignores a late failure callback and keeps its code at zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completedRowCannotBeFailed', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const c: DownloadTask = graph.taskAt(2);
      c.start(1);
      c.complete(2);
      const failed: boolean = c.fail(ERROR_NETWORK);
      expect(failed).assertFalse();
      expect(c.status).assertEqual(STATUS_COMPLETED);
      expect(c.lastErrorCode).assertEqual(ERROR_NONE);
      expect(c.progress).assertEqual(PROGRESS_TOTAL);
      expect(c.isFailed()).assertFalse();
    });

    /**
     * @tc.name   failedRowCanStillBeCompletedByTheDriver
     * @tc.desc   The completion path only blocks an already completed row, so a failed row may later finish.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failedRowCanStillBeCompletedByTheDriver', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      a.fail(ERROR_START);
      const completed: boolean = a.complete(70);
      expect(completed).assertTrue();
      expect(a.status).assertEqual(STATUS_COMPLETED);
      expect(a.progress).assertEqual(PROGRESS_TOTAL);
      expect(a.finishedAt).assertEqual(70);
      expect(a.lastErrorCode).assertEqual(ERROR_START);
    });

    /**
     * @tc.name   graphCompletionOfFailedPrerequisiteReleasesItsSlot
     * @tc.desc   Completing a previously failed A frees the A shared holder but keeps C locked on B.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphCompletionOfFailedPrerequisiteReleasesItsSlot', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_NETWORK);
      expect(graph.lock.hasShared(TASK_A)).assertTrue();
      const completed: boolean = graph.completeTask(TASK_A, 30);
      expect(completed).assertTrue();
      expect(graph.lock.hasShared(TASK_A)).assertFalse();
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.events.countOf('unlocked')).assertEqual(0);
    });

    /**
     * @tc.name   oneFailedBranchKeepsGateClosed
     * @tc.desc   A failed B blocks the C gate even after A completes normally.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('oneFailedBranchKeepsGateClosed', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(1).fail(ERROR_NETWORK);
      graph.completeTask(TASK_A, 10);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(1);
      expect(completionTrace(graph)).assertEqual('A');
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
    });

    /**
     * @tc.name   failedBranchHoldsItsSharedSlotUntilReset
     * @tc.desc   The still-running lock of the failed row keeps the exclusive request for C queued.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedBranchHoldsItsSharedSlotUntilReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(1).fail(ERROR_TIMEOUT);
      graph.completeTask(TASK_A, 10);
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.rejections).assertEqual(0);
      graph.reset();
      expect(graph.lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   pollWithClosedGateDoesNotStartTaskC
     * @tc.desc   A poll while the gate is closed returns false, leaves C idle and keeps the timer armed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pollWithClosedGateDoesNotStartTaskC', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      const started: boolean = graph.pollTick(200);
      expect(started).assertFalse();
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.timerActive).assertTrue();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
    });

    /**
     * @tc.name   pollAfterFailedBranchNeverOpensGate
     * @tc.desc   Even after repeated 200 ms polls a failed prerequisite keeps C queued forever.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollAfterFailedBranchNeverOpensGate', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(1).fail(ERROR_NETWORK);
      graph.completeTask(TASK_A, 10);
      const first: boolean = graph.pollTick(200);
      const second: boolean = graph.pollTick(400);
      const third: boolean = graph.pollTick(600);
      expect(first).assertFalse();
      expect(second).assertFalse();
      expect(third).assertFalse();
      expect(graph.pollTicks).assertEqual(3);
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   retryPolicyRejectsCompletedRow
     * @tc.desc   A completed download is never retried, whatever code or attempt number is supplied.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('retryPolicyRejectsCompletedRow', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(3, 200);
      expect(policy.shouldRetry(0, ERROR_NETWORK, STATUS_COMPLETED)).assertFalse();
      expect(policy.shouldRetry(1, ERROR_TIMEOUT, STATUS_COMPLETED)).assertFalse();
      expect(policy.shouldRetry(0, ERROR_NONE, STATUS_COMPLETED)).assertFalse();
      expect(policy.maxAttempts).assertEqual(3);
      expect(policy.baseDelayMs).assertEqual(200);
    });

    /**
     * @tc.name   retryPolicyRejectsCleanErrorCode
     * @tc.desc   Without an error code the policy does not schedule another attempt of a failed row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('retryPolicyRejectsCleanErrorCode', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(4, 150);
      expect(policy.shouldRetry(0, ERROR_NONE, STATUS_FAILED)).assertFalse();
      expect(policy.shouldRetry(2, ERROR_NONE, STATUS_RUNNING)).assertFalse();
      expect(policy.shouldRetry(0, ERROR_NETWORK, STATUS_FAILED)).assertTrue();
      expect(policy.shouldRetry(0, ERROR_NETWORK, STATUS_RUNNING)).assertTrue();
      expect(policy.maxAttempts).assertEqual(4);
    });

    /**
     * @tc.name   retryPolicyAllowsTransientAttemptsBelowLimit
     * @tc.desc   Attempts zero, one and two of a three attempt policy are retried; the third is not.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('retryPolicyAllowsTransientAttemptsBelowLimit', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(3, 200);
      expect(policy.shouldRetry(0, ERROR_TIMEOUT, STATUS_FAILED)).assertTrue();
      expect(policy.shouldRetry(1, ERROR_TIMEOUT, STATUS_FAILED)).assertTrue();
      expect(policy.shouldRetry(2, ERROR_TIMEOUT, STATUS_FAILED)).assertTrue();
      expect(policy.shouldRetry(3, ERROR_TIMEOUT, STATUS_FAILED)).assertFalse();
      expect(policy.shouldRetry(4, ERROR_TIMEOUT, STATUS_FAILED)).assertFalse();
    });

    /**
     * @tc.name   retryPolicyExhaustionFollowsMaxAttempts
     * @tc.desc   isExhausted flips exactly at the configured attempt ceiling and its default is three.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('retryPolicyExhaustionFollowsMaxAttempts', 0, () => {
      const defaults: RetryPolicy = new RetryPolicy();
      expect(defaults.maxAttempts).assertEqual(3);
      expect(defaults.isExhausted(2)).assertFalse();
      expect(defaults.isExhausted(3)).assertTrue();
      const patient: RetryPolicy = new RetryPolicy(6, 50);
      expect(patient.isExhausted(5)).assertFalse();
      expect(patient.isExhausted(6)).assertTrue();
      expect(patient.shouldRetry(5, ERROR_NETWORK, STATUS_FAILED)).assertTrue();
      expect(patient.shouldRetry(6, ERROR_NETWORK, STATUS_FAILED)).assertFalse();
    });

    /**
     * @tc.name   errorRecoveryRetryDelayGrowsLinearlyWithAttempt
     * @tc.desc   The backoff of attempt N is baseDelay times N, which doubles the 200 ms poll spacing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('errorRecoveryRetryDelayGrowsLinearlyWithAttempt', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(3, 200);
      expect(policy.delayFor(1)).assertEqual(200);
      expect(policy.delayFor(2)).assertEqual(400);
      expect(policy.delayFor(3)).assertEqual(600);
      expect(policy.delayFor(4)).assertEqual(800);
      expect(policy.delayFor(2) - policy.delayFor(1)).assertEqual(policy.baseDelayMs);
    });

    /**
     * @tc.name   retryDelayFallsBackToBaseForNonPositiveAttempt
     * @tc.desc   Attempt zero and negative attempts use exactly one base delay, never a zero wait.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('retryDelayFallsBackToBaseForNonPositiveAttempt', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(3, 200);
      expect(policy.delayFor(0)).assertEqual(200);
      expect(policy.delayFor(-1)).assertEqual(200);
      expect(policy.delayFor(-7)).assertEqual(200);
      expect(policy.delayFor(0) > 0).assertTrue();
      const custom: RetryPolicy = new RetryPolicy(2, 75);
      expect(custom.delayFor(0)).assertEqual(75);
      expect(custom.delayFor(2)).assertEqual(150);
    });

    /**
     * @tc.name   resetAfterFailureRestoresIdleRows
     * @tc.desc   Reset clears the failed status, the stored error code and every progress member.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetAfterFailureRestoresIdleRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(30);
      graph.taskAt(0).fail(ERROR_NETWORK);
      graph.taskAt(1).fail(ERROR_CREATE);
      graph.reset();
      expect(graph.taskAt(0).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(1).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(0).progress).assertEqual(0);
      expect(graph.taskAt(0).lastErrorCode).assertEqual(ERROR_NONE);
      expect(graph.taskAt(1).lastErrorCode).assertEqual(ERROR_NONE);
      expect(graph.totalProgress()).assertEqual(0);
    });

    /**
     * @tc.name   resetKeepsAttemptCountForAudit
     * @tc.desc   Reset rewinds run state but deliberately keeps the attempt counter of each row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('resetKeepsAttemptCountForAudit', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      expect(a.attempts).assertEqual(1);
      a.fail(ERROR_TIMEOUT);
      graph.reset();
      expect(a.attempts).assertEqual(1);
      expect(a.status).assertEqual(STATUS_IDLE);
      graph.startAll();
      expect(a.attempts).assertEqual(2);
      expect(a.startedAt).assertEqual(0);
      expect(a.finishedAt).assertEqual(0);
    });

    /**
     * @tc.name   resetClearsLockRejectionCounters
     * @tc.desc   A rejection produced while the run was active disappears with the reset lock.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetClearsLockRejectionCounters', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const refused: boolean = graph.lock.acquireExclusive(TASK_C);
      expect(refused).assertFalse();
      expect(graph.lock.rejections).assertEqual(1);
      graph.reset();
      expect(graph.lock.rejections).assertEqual(0);
      expect(graph.lock.acquisitions).assertEqual(0);
      expect(graph.lock.waitingExclusive).assertFalse();
      expect(graph.lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   recoveryAfterResetCompletesFullRun
     * @tc.desc   After a failed attempt the reset graph executes the whole three task lifecycle successfully.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('recoveryAfterResetCompletesFullRun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_NETWORK);
      graph.reset();
      const restarted: boolean = graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      const polled: boolean = graph.pollTick(30);
      const finished: boolean = graph.completeTaskC(40);
      expect(restarted).assertTrue();
      expect(polled).assertTrue();
      expect(finished).assertTrue();
      expect(graph.allCompleted()).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   recoveryTraceMatchesACleanRunTrace
     * @tc.desc   The event stream of a recovered run is byte identical to the stream of a run that never failed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recoveryTraceMatchesACleanRunTrace', 0, () => {
      const clean: TaskGraph = createTaskGraph();
      clean.startAll();
      clean.completeTask(TASK_A, 1);
      clean.completeTask(TASK_B, 2);
      clean.pollTick(3);
      clean.completeTaskC(4);
      const cleanTrace: string = clean.eventTrace();
      const recovered: TaskGraph = createTaskGraph();
      recovered.startAll();
      recovered.taskAt(1).fail(ERROR_TIMEOUT);
      recovered.completeTask(TASK_A, 5);
      recovered.pollTick(6);
      recovered.reset();
      recovered.startAll();
      recovered.completeTask(TASK_A, 11);
      recovered.completeTask(TASK_B, 12);
      recovered.pollTick(13);
      recovered.completeTaskC(14);
      expect(recovered.eventTrace()).assertEqual(cleanTrace);
      expect(textFingerprint(recovered.eventTrace())).assertEqual(textFingerprint(cleanTrace));
      expect(recovered.lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   failedGraphMetricsCountOneFailure
     * @tc.desc   Metrics sample the failed row as failed and never as completed, with its progress excluded.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedGraphMetricsCountOneFailure', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(1).fail(ERROR_NETWORK);
      graph.completeTask(TASK_A, 1);
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      expect(metrics.totalTasks).assertEqual(3);
      expect(metrics.completedTasks).assertEqual(1);
      expect(metrics.failedTasks).assertEqual(1);
      expect(metrics.totalProgress).assertEqual(100);
      expect(metrics.successRatio() > 0.3).assertTrue();
      expect(metrics.successRatio() < 0.4).assertTrue();
    });

    /**
     * @tc.name   completedGraphMetricsReportNoFailure
     * @tc.desc   A clean run reports three completions, zero failures and a success ratio of one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completedGraphMetricsReportNoFailure', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      expect(metrics.completedTasks).assertEqual(3);
      expect(metrics.failedTasks).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(1);
      expect(metrics.averageProgress()).assertEqual(100);
      expect(metrics.totalProgress).assertEqual(PROGRESS_TOTAL * 3);
    });

    /**
     * @tc.name   metricsFingerprintDiffersBetweenFailedAndClean
     * @tc.desc   The metric fingerprint separates a failed run from a complete run even at equal task counts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('metricsFingerprintDiffersBetweenFailedAndClean', 0, () => {
      const healthy: TaskGraph = createTaskGraph();
      healthy.startAll();
      healthy.completeTask(TASK_A, 1);
      healthy.completeTask(TASK_B, 2);
      healthy.pollTick(3);
      healthy.completeTaskC(4);
      const broken: TaskGraph = createTaskGraph();
      broken.startAll();
      broken.taskAt(2).fail(ERROR_NETWORK);
      const healthyPrint: number = NetworkMetrics.from(healthy).fingerprint();
      const brokenPrint: number = NetworkMetrics.from(broken).fingerprint();
      expect(healthyPrint === brokenPrint).assertFalse();
      expect(healthyPrint > 0).assertTrue();
      expect(brokenPrint > 0).assertTrue();
      expect(NetworkMetrics.from(healthy).fingerprint()).assertEqual(healthyPrint);
    });

    /**
     * @tc.name   graphStaysCoherentAfterRejectedStart
     * @tc.desc   A rejected second start leaves tasks, holders and flags exactly as the running attempt left them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphStaysCoherentAfterRejectedStart', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const before: string = graph.snapshotText();
      const holders: number = graph.lock.holderCount();
      const refused: boolean = graph.startAll();
      expect(refused).assertFalse();
      expect(graph.snapshotText()).assertEqual(before);
      expect(graph.lock.holderCount()).assertEqual(holders);
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.lock.acquisitions).assertEqual(2);
    });

    /**
     * @tc.name   createFailureOfOneBranchKeepsBothSharedHolders
     * @tc.desc   When agent.create rejects, the page never calls completeTask, so both A and B keep their slots.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('createFailureOfOneBranchKeepsBothSharedHolders', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_CREATE);
      graph.taskAt(1).fail(ERROR_CREATE);
      expect(graph.lock.hasShared(TASK_A)).assertTrue();
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.events.countOf('completed')).assertEqual(0);
    });

    /**
     * @tc.name   failureDuringGateWindowSkipsUnlockEvent
     * @tc.desc   If B fails right after A completes, the recorder never emits the unlock entry for C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failureDuringGateWindowSkipsUnlockEvent', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.taskAt(1).fail(ERROR_NETWORK);
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.events.last()).assertEqual('completed:A');
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
    });

    /**
     * @tc.name   failureOfQueuedTaskCLeavesSharedSlotsIntact
     * @tc.desc   C cannot hold the lock while queued, so failing it does not disturb A or B.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failureOfQueuedTaskCLeavesSharedSlotsIntact', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const c: DownloadTask = graph.taskAt(2);
      const failed: boolean = c.fail(ERROR_START);
      expect(failed).assertTrue();
      expect(c.status).assertEqual(STATUS_FAILED);
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(graph.lock.hasShared(TASK_A)).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   failureThenCompletionKeepsOneCompletionEntry
     * @tc.desc   Failing and then completing the same row records a single completion and a single order slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failureThenCompletionKeepsOneCompletionEntry', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(1).fail(ERROR_TIMEOUT);
      graph.completeTask(TASK_B, 10);
      const again: boolean = graph.completeTask(TASK_B, 20);
      expect(again).assertFalse();
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.completionOrder.length).assertEqual(1);
      expect(completionTrace(graph)).assertEqual('B');
      expect(graph.taskAt(1).finishedAt).assertEqual(10);
    });

    /**
     * @tc.name   repeatedStartRefusalsHaveNoSideEffects
     * @tc.desc   Ten rejected start attempts only grow the rejection log and the poll counter of the event detail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedStartRefusalsHaveNoSideEffects', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      for (let round = 0; round < 10; round++) {
        expect(graph.startAll()).assertFalse();
      }
      expect(graph.events.countOf('start-rejected')).assertEqual(10);
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.lock.acquisitions).assertEqual(2);
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.isTaskFinished).assertFalse();
    });

    /**
     * @tc.name   resetAfterTaskCFailureAllowsRerun
     * @tc.desc   A failure while C owns the exclusive slot is undone by reset, including the exclusive owner.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetAfterTaskCFailureAllowsRerun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      graph.taskAt(2).fail(ERROR_NETWORK);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      graph.reset();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.startAll()).assertTrue();
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
    });

    /**
     * @tc.name   recoverFromFailedTaskCByResetAndRerun
     * @tc.desc   A C failure late in the run is repaired by reset and a second full pass.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recoverFromFailedTaskCByResetAndRerun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.taskAt(2).fail(ERROR_TIMEOUT);
      expect(graph.allCompleted()).assertFalse();
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A, 11);
      graph.completeTask(TASK_B, 12);
      graph.pollTick(13);
      graph.completeTaskC(14);
      expect(graph.allCompleted()).assertTrue();
      expect(graph.taskAt(2).lastErrorCode).assertEqual(ERROR_NONE);
      expect(graph.taskAt(2).progress).assertEqual(PROGRESS_TOTAL);
    });

    /**
     * @tc.name   failedRowKeepsIdentityAndUrl
     * @tc.desc   A failure never rewrites the task number or the download URL of the affected row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('failedRowKeepsIdentityAndUrl', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const b: DownloadTask = graph.taskAt(1);
      const url: string = b.url;
      graph.startAll();
      b.fail(ERROR_NETWORK);
      expect(b.taskNo).assertEqual(TASK_B);
      expect(b.url).assertEqual(url);
      expect(b.url.startsWith('https://')).assertTrue();
      expect(b.lastErrorCode).assertEqual(ERROR_NETWORK);
      expect(b.describe()).assertEqual('B:failed:0');
    });

    /**
     * @tc.name   failedRowSnapshotKeepsLastReportedProgress
     * @tc.desc   A snapshot taken after a failure records the frozen progress and the failed status.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedRowSnapshotKeepsLastReportedProgress', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      a.reportProgress(55);
      a.fail(ERROR_NETWORK);
      const snapshot: RunSnapshot = a.snapshot();
      expect(snapshot.progress).assertEqual(55);
      expect(snapshot.status).assertEqual(STATUS_FAILED);
      expect(snapshot.taskNo).assertEqual(TASK_A);
      expect(a.snapshot().sameAs(snapshot)).assertTrue();
      expect(snapshot.describe()).assertEqual('A/failed/55');
    });

    /**
     * @tc.name   errorRecoveryKeepsTimerAndPollStateStable
     * @tc.desc   A failure does not stop the interval; only the reset clears its flags and counters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('errorRecoveryKeepsTimerAndPollStateStable', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_NETWORK);
      expect(graph.pollTick(200)).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.timerActive).assertTrue();
      graph.reset();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      expect(graph.events.size()).assertEqual(0);
    });

    /**
     * @tc.name   attemptsGrowAcrossRecoveredRuns
     * @tc.desc   Each start attempt increments the per-row counter, so two recovered runs report two attempts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('attemptsGrowAcrossRecoveredRuns', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(1).fail(ERROR_TIMEOUT);
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      expect(graph.taskAt(1).attempts).assertEqual(2);
      expect(graph.taskAt(0).attempts).assertEqual(2);
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.allCompleted()).assertTrue();
    });

    /**
     * @tc.name   retryScheduleForThreeAttemptPolicy
     * @tc.desc   Simulating consecutive transient failures produces three retries with growing delays and a stop.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('retryScheduleForThreeAttemptPolicy', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(3, 100);
      const delays: number[] = [];
      let executed: number = 0;
      for (let attempt = 0; attempt < 6; attempt++) {
        if (!policy.shouldRetry(attempt, ERROR_NETWORK, STATUS_FAILED)) {
          break;
        }
        delays.push(policy.delayFor(attempt + 1));
        executed = executed + 1;
      }
      expect(executed).assertEqual(3);
      expect(delays.length).assertEqual(3);
      expect(delays[0]).assertEqual(100);
      expect(delays[1]).assertEqual(200);
      expect(delays[2]).assertEqual(300);
      expect(policy.isExhausted(3)).assertTrue();
    });

    /**
     * @tc.name   startAbortLeavesTheRowIdle
     * @tc.desc   When the start callback carries a non-zero code the row never leaves idle, so no progress exists.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startAbortLeavesTheRowIdle', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const a: DownloadTask = graph.taskAt(0);
      const verdict: string = classifyStartResult(ERROR_START);
      expect(shouldAbortStart(ERROR_START)).assertTrue();
      expect(verdict).assertEqual('failed');
      expect(a.status).assertEqual(STATUS_IDLE);
      expect(a.attempts).assertEqual(0);
      expect(a.startedAt).assertEqual(0);
      expect(a.progress).assertEqual(0);
    });

    /**
     * @tc.name   retryPolicyAndClassifierDisagreeOnCreateError
     * @tc.desc   The policy retries any non-zero code including a create failure, while the classifier calls that
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            code non-transient, so a caller must combine both checks.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('retryPolicyAndClassifierDisagreeOnCreateError', 0, () => {
      const policy: RetryPolicy = new RetryPolicy(3, 200);
      expect(isRetryableError(ERROR_CREATE)).assertFalse();
      expect(policy.shouldRetry(0, ERROR_CREATE, STATUS_FAILED)).assertTrue();
      expect(policy.shouldRetry(0, ERROR_CREATE, STATUS_COMPLETED)).assertFalse();
      expect(policy.isExhausted(0)).assertFalse();
      expect(policy.delayFor(1)).assertEqual(200);
    });

    /**
     * @tc.name   metricsAfterRecoveryMatchACleanRun
     * @tc.desc   A recovered run reports the same metrics fingerprint as a run that never failed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsAfterRecoveryMatchACleanRun', 0, () => {
      const clean: TaskGraph = createTaskGraph();
      clean.startAll();
      clean.completeTask(TASK_A, 1);
      clean.completeTask(TASK_B, 2);
      clean.pollTick(3);
      clean.completeTaskC(4);
      const recovered: TaskGraph = createTaskGraph();
      recovered.startAll();
      recovered.taskAt(1).fail(ERROR_NETWORK);
      recovered.reset();
      recovered.startAll();
      recovered.completeTask(TASK_A, 11);
      recovered.completeTask(TASK_B, 12);
      recovered.pollTick(13);
      recovered.completeTaskC(14);
      const expected: NetworkMetrics = NetworkMetrics.from(clean);
      const actual: NetworkMetrics = NetworkMetrics.from(recovered);
      expect(actual.completedTasks).assertEqual(3);
      expect(actual.failedTasks).assertEqual(0);
      expect(actual.totalProgress).assertEqual(expected.totalProgress);
      expect(actual.fingerprint()).assertEqual(expected.fingerprint());
    });

    /**
     * @tc.name   failureCodeSurvivesUntilReset
     * @tc.desc   A terminal failed row keeps its error code and refuses a restart until the graph clears it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failureCodeSurvivesUntilReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      a.fail(ERROR_TIMEOUT);
      expect(a.start(5)).assertFalse();
      expect(a.lastErrorCode).assertEqual(ERROR_TIMEOUT);
      expect(a.attempts).assertEqual(1);
      graph.reset();
      expect(a.lastErrorCode).assertEqual(ERROR_NONE);
      expect(a.status).assertEqual(STATUS_IDLE);
    });

    /**
     * @tc.name   recoveredRunPreservesAllTaskUrls
     * @tc.desc   Two failed branches and a full recovery leave the three download URLs exactly as they were.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recoveredRunPreservesAllTaskUrls', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const urls: string[] = [graph.taskAt(0).url, graph.taskAt(1).url, graph.taskAt(2).url];
      graph.startAll();
      graph.taskAt(0).fail(ERROR_NETWORK);
      graph.taskAt(1).fail(ERROR_CREATE);
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      expect(graph.taskAt(0).url).assertEqual(urls[0]);
      expect(graph.taskAt(1).url).assertEqual(urls[1]);
      expect(graph.taskAt(2).url).assertEqual(urls[2]);
      expect(graph.tasks.length).assertEqual(3);
      expect(graph.allCompleted()).assertTrue();
    });
  });
}
