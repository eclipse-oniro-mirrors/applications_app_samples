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
 * CoreErrorRecovery suite of the NetworkSample ohosTest module.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   109-116  download() builds action DOWNLOAD, method GET, overwrite true, saveas './'
 *   117-147  agent.create().then(...).catch(...) and task.start(err => ...)
 *   133-141  start callback returns early when err.code is non-zero
 *   144-147  create failure is logged and the task never exists
 *   174-198  startAllTasks keeps going for the healthy branch
 *
 * The suite exercises the failure behavior of the page: creation errors, start
 * errors, retry classification, and the rule that one broken branch must not
 * complete the A && B gate on behalf of the other branch.
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
  POLL_INTERVAL_MS,
  DownloadTask,
  TaskGraph,
  RetryPolicy,
  NetworkMetrics,
  createTaskGraph,
  classifyStartResult,
  shouldAbortStart,
  isRetryableError,
  expectedProgressAfter,
  isTerminalStatus,
  completionTrace
} from '../Shared/SharedDriver';

export default function networkCoreErrorRecoveryTest(): void {
  describe('CoreErrorRecovery', () => {
    beforeAll(() => {
      logSuite('CoreErrorRecovery', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CoreErrorRecovery', 'end');
    });

    /**
     * @tc.name   classifyStartResultZeroMeansStarted
     * @tc.desc   A zero error code is the only value classified as a started request.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('classifyStartResultZeroMeansStarted', 0, () => {
      const result = classifyStartResult(ERROR_NONE);
      logStep('CoreErrorRecovery', 'zero classified as ' + result);
      expect(result).assertEqual('started');
      expect(result === 'failed').assertFalse();
      expect(classifyStartResult(ERROR_NONE)).assertEqual(result);
      expect(ERROR_NONE).assertEqual(0);
      expect(shouldAbortStart(ERROR_NONE)).assertFalse();
    });

    /**
     * @tc.name   classifyStartResultCreateErrorMeansFailed
     * @tc.desc   The agent.create rejection code is classified as a failed start, never as started.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('classifyStartResultCreateErrorMeansFailed', 0, () => {
      const result = classifyStartResult(ERROR_CREATE);
      logStep('CoreErrorRecovery', 'create error classified as ' + result);
      expect(result).assertEqual('failed');
      expect(result === 'started').assertFalse();
      expect(ERROR_CREATE).assertEqual(13400001);
      expect(shouldAbortStart(ERROR_CREATE)).assertTrue();
      expect(isRetryableError(ERROR_CREATE)).assertFalse();
      expect(classifyStartResult(ERROR_CREATE)).assertEqual(classifyStartResult(ERROR_START));
    });

    /**
     * @tc.name   classifyStartResultStartErrorMeansFailed
     * @tc.desc   A non-zero task.start callback error is failed and asks the page to abort the branch.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('classifyStartResultStartErrorMeansFailed', 0, () => {
      const result = classifyStartResult(ERROR_START);
      logStep('CoreErrorRecovery', 'start error classified as ' + result);
      expect(result).assertEqual('failed');
      expect(shouldAbortStart(ERROR_START)).assertTrue();
      expect(ERROR_START).assertEqual(13400002);
      expect(isRetryableError(ERROR_START)).assertTrue();
      expect(classifyStartResult(ERROR_NONE) === result).assertFalse();
      expect(classifyStartResult(ERROR_START) === classifyStartResult(ERROR_NONE)).assertFalse();
    });

    /**
     * @tc.name   classifyStartResultNetworkErrorMeansFailed
     * @tc.desc   A transport level error code also lands on the failed branch of the start callback.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('classifyStartResultNetworkErrorMeansFailed', 0, () => {
      const result = classifyStartResult(ERROR_NETWORK);
      logStep('CoreErrorRecovery', 'network error classified as ' + result);
      expect(result).assertEqual('failed');
      expect(shouldAbortStart(ERROR_NETWORK)).assertTrue();
      expect(ERROR_NETWORK).assertEqual(13400003);
      expect(isRetryableError(ERROR_NETWORK)).assertTrue();
      expect(result.length).assertEqual(6);
      expect(result.startsWith('fail')).assertTrue();
    });

    /**
     * @tc.name   classifyStartResultTimeoutMeansFailed
     * @tc.desc   A timeout code is failed, abort-worthy and transient, so the caller may retry it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('classifyStartResultTimeoutMeansFailed', 0, () => {
      const result = classifyStartResult(ERROR_TIMEOUT);
      logStep('CoreErrorRecovery', 'timeout classified as ' + result);
      expect(result).assertEqual('failed');
      expect(ERROR_TIMEOUT).assertEqual(13400004);
      expect(shouldAbortStart(ERROR_TIMEOUT)).assertTrue();
      expect(isRetryableError(ERROR_TIMEOUT)).assertTrue();
      expect(classifyStartResult(ERROR_TIMEOUT)).assertEqual(classifyStartResult(ERROR_NETWORK));
      expect(classifyStartResult(ERROR_TIMEOUT) === 'started').assertFalse();
    });

    /**
     * @tc.name   shouldAbortStartOnlyForNonZeroCodes
     * @tc.desc   Aborting is decided by code alone: every non-zero code aborts, zero never does.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('shouldAbortStartOnlyForNonZeroCodes', 0, () => {
      const codes: number[] = [ERROR_NONE, ERROR_CREATE, ERROR_START, ERROR_NETWORK, ERROR_TIMEOUT];
      let aborts = 0;
      for (let index = 0; index < codes.length; index++) {
        if (shouldAbortStart(codes[index])) {
          aborts = aborts + 1;
        }
      }
      logStep('CoreErrorRecovery', 'abort count ' + String(aborts));
      expect(aborts).assertEqual(4);
      expect(shouldAbortStart(ERROR_NONE)).assertFalse();
      expect(shouldAbortStart(1)).assertTrue();
      expect(shouldAbortStart(-1)).assertTrue();
      expect(shouldAbortStart(ERROR_CREATE) === shouldAbortStart(ERROR_NONE)).assertFalse();
    });

    /**
     * @tc.name   failingTaskRecordsErrorCodeAndStatus
     * @tc.desc   fail() stores the code verbatim and moves the row to the failed status without filling progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('failingTaskRecordsErrorCodeAndStatus', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      b.reportProgress(20);
      const accepted = b.fail(ERROR_NETWORK);
      logStep('CoreErrorRecovery', 'failed row ' + b.describe());
      expect(accepted).assertTrue();
      expect(b.status).assertEqual(STATUS_FAILED);
      expect(b.lastErrorCode).assertEqual(ERROR_NETWORK);
      expect(b.isFailed()).assertTrue();
      expect(b.isRunning()).assertFalse();
      expect(b.progress).assertEqual(20);
      expect(b.finishedAt).assertEqual(0);
    });

    /**
     * @tc.name   failedRowKeepsProgressBelowFull
     * @tc.desc   A failed download leaves its bar at the last reported value, so the row is visibly not done.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedRowKeepsProgressBelowFull', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      b.reportProgress(65);
      b.fail(ERROR_TIMEOUT);
      logStep('CoreErrorRecovery', 'progress after failure ' + String(b.progress));
      expect(b.progress).assertEqual(65);
      expect(b.progress).assertLess(PROGRESS_TOTAL);
      expect(b.progressRatio()).assertEqual(0.65);
      expect(b.label()).assertEqual('任务B当前进度 65%');
      expect(b.isComplete()).assertFalse();
      expect(graph.totalProgress()).assertEqual(65);
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   failedTaskIgnoresProgressReports
     * @tc.desc   A late progress callback on a failed row cannot lift the bar or reopen the task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('failedTaskIgnoresProgressReports', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      a.reportProgress(30);
      a.fail(ERROR_CREATE);
      const after = a.reportProgress(90);
      logStep('CoreErrorRecovery', 'late report returns ' + String(after));
      expect(after).assertEqual(30);
      expect(a.progress).assertEqual(30);
      expect(a.status).assertEqual(STATUS_FAILED);
      expect(isTerminalStatus(STATUS_FAILED)).assertTrue();
      expect(a.start(500)).assertFalse();
      expect(a.attempts).assertEqual(1);
      expect(a.startedAt).assertEqual(0);
    });

    /**
     * @tc.name   lateCompletionRepairsFailedTask
     * @tc.desc   The page's onCompleted writes 100 unconditionally, so a late success can repair a failed row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lateCompletionRepairsFailedTask', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      a.fail(ERROR_NETWORK);
      const repaired = a.complete(700);
      logStep('CoreErrorRecovery', 'repair result ' + String(repaired) + ' ' + a.describe());
      expect(repaired).assertTrue();
      expect(a.status).assertEqual(STATUS_COMPLETED);
      expect(a.progress).assertEqual(PROGRESS_TOTAL);
      expect(a.lastErrorCode).assertEqual(ERROR_NETWORK);
      expect(a.finishedAt).assertEqual(700);
      expect(a.isComplete()).assertTrue();
      expect(a.isFailed()).assertFalse();
    });

    /**
     * @tc.name   resetClearsFailureAndErrorCode
     * @tc.desc   reset() wipes the failed status, the stored code and both timestamps back to idle defaults.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetClearsFailureAndErrorCode', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const c = graph.taskByNo(TASK_C) as DownloadTask;
      c.start(100);
      c.reportProgress(15);
      c.fail(ERROR_START);
      c.reset();
      logStep('CoreErrorRecovery', 'reset row ' + c.describe());
      expect(c.status).assertEqual(STATUS_IDLE);
      expect(c.lastErrorCode).assertEqual(ERROR_NONE);
      expect(c.progress).assertEqual(0);
      expect(c.startedAt).assertEqual(0);
      expect(c.finishedAt).assertEqual(0);
      expect(c.isIdle()).assertTrue();
      expect(c.isFailed()).assertFalse();
      expect(c.attempts).assertEqual(1);
    });

    /**
     * @tc.name   failThenResetThenRerunReachesCompletion
     * @tc.desc   A failed row that is reset and started again can finish, and its attempt counter keeps the history.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('failThenResetThenRerunReachesCompletion', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      b.fail(ERROR_NETWORK);
      b.reset();
      const restarted = b.start(120);
      b.reportProgress(50);
      const finished = b.complete(420);
      logStep('CoreErrorRecovery', 'recovered row ' + b.describe());
      expect(restarted).assertTrue();
      expect(finished).assertTrue();
      expect(b.attempts).assertEqual(2);
      expect(b.status).assertEqual(STATUS_COMPLETED);
      expect(b.progress).assertEqual(PROGRESS_TOTAL);
      expect(b.startedAt).assertEqual(120);
      expect(b.finishedAt).assertEqual(420);
      expect(b.lastErrorCode).assertEqual(ERROR_NONE);
    });

    /**
     * @tc.name   retryPolicyRetriesTransientError
     * @tc.desc   Below the attempt ceiling a transient code is retried and the delay grows with each attempt.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('retryPolicyRetriesTransientError', 0, () => {
      const policy = new RetryPolicy(3, 200);
      const first = policy.shouldRetry(0, ERROR_NETWORK, STATUS_FAILED);
      const second = policy.shouldRetry(1, ERROR_TIMEOUT, STATUS_FAILED);
      logStep('CoreErrorRecovery', 'retry decisions ' + String(first) + '/' + String(second));
      expect(first).assertTrue();
      expect(second).assertTrue();
      expect(policy.shouldRetry(2, ERROR_START, STATUS_FAILED)).assertTrue();
      expect(policy.maxAttempts).assertEqual(3);
      expect(policy.baseDelayMs).assertEqual(200);
      expect(policy.delayFor(0)).assertEqual(200);
    });

    /**
     * @tc.name   coreRetryPolicyStopsAtMaxAttempts
     * @tc.desc   Once the attempt number reaches the ceiling the policy refuses further retries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('coreRetryPolicyStopsAtMaxAttempts', 0, () => {
      const policy = new RetryPolicy(3, 200);
      const atCeiling = policy.shouldRetry(3, ERROR_NETWORK, STATUS_FAILED);
      const beyond = policy.shouldRetry(4, ERROR_NETWORK, STATUS_FAILED);
      logStep('CoreErrorRecovery', 'ceiling decisions ' + String(atCeiling) + '/' + String(beyond));
      expect(atCeiling).assertFalse();
      expect(beyond).assertFalse();
      expect(policy.isExhausted(3)).assertTrue();
      expect(policy.isExhausted(2)).assertFalse();
      expect(policy.shouldRetry(2, ERROR_NETWORK, STATUS_FAILED)).assertTrue();
      expect(policy.delayFor(3)).assertEqual(600);
    });

    /**
     * @tc.name   retryPolicyIgnoresCompletedStatus
     * @tc.desc   A completed task is never retried even with a transient code and attempts left.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('retryPolicyIgnoresCompletedStatus', 0, () => {
      const policy = new RetryPolicy(5, 100);
      const completed = policy.shouldRetry(0, ERROR_TIMEOUT, STATUS_COMPLETED);
      const failed = policy.shouldRetry(0, ERROR_TIMEOUT, STATUS_FAILED);
      logStep('CoreErrorRecovery', 'completed retry ' + String(completed));
      expect(completed).assertFalse();
      expect(failed).assertTrue();
      expect(policy.shouldRetry(1, ERROR_NETWORK, STATUS_COMPLETED)).assertFalse();
      expect(policy.isExhausted(1)).assertFalse();
      expect(policy.delayFor(1)).assertEqual(100);
      expect(completed === failed).assertFalse();
    });

    /**
     * @tc.name   retryPolicyIgnoresZeroErrorCode
     * @tc.desc   A zero code means the branch did not error, so the policy declines even on a failed status.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('retryPolicyIgnoresZeroErrorCode', 0, () => {
      const policy = new RetryPolicy(4, 50);
      const zero = policy.shouldRetry(0, ERROR_NONE, STATUS_FAILED);
      const nonzero = policy.shouldRetry(0, ERROR_CREATE, STATUS_FAILED);
      logStep('CoreErrorRecovery', 'zero code retry ' + String(zero));
      expect(zero).assertFalse();
      expect(nonzero).assertTrue();
      expect(policy.shouldRetry(0, ERROR_NONE, STATUS_RUNNING)).assertFalse();
      expect(isRetryableError(ERROR_NONE)).assertFalse();
      expect(policy.isExhausted(0)).assertFalse();
      expect(policy.delayFor(0)).assertEqual(50);
    });

    /**
     * @tc.name   coreRetryDelayGrowsLinearlyWithAttempt
     * @tc.desc   delayFor multiplies the base delay by the attempt index, producing 200, 400 and 600.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('coreRetryDelayGrowsLinearlyWithAttempt', 0, () => {
      const policy = new RetryPolicy(3, 200);
      const zero = policy.delayFor(0);
      const one = policy.delayFor(1);
      const two = policy.delayFor(2);
      logStep('CoreErrorRecovery', 'delays ' + String(zero) + '/' + String(one) + '/' + String(two));
      expect(zero).assertEqual(200);
      expect(one).assertEqual(200);
      expect(two).assertEqual(400);
      expect(one - zero).assertEqual(0);
      expect(two - one).assertEqual(200);
      expect(two).assertLarger(one);
      expect(policy.delayFor(-1)).assertEqual(200);
    });

    /**
     * @tc.name   retryPolicyHonoursSingleAttemptCeiling
     * @tc.desc   A policy configured for one attempt allows only the initial try and reports exhaustion at one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('retryPolicyHonoursSingleAttemptCeiling', 0, () => {
      const policy = new RetryPolicy(1, 25);
      logStep('CoreErrorRecovery', 'single attempt policy ' + String(policy.maxAttempts));
      expect(policy.shouldRetry(0, ERROR_NETWORK, STATUS_FAILED)).assertTrue();
      expect(policy.shouldRetry(1, ERROR_NETWORK, STATUS_FAILED)).assertFalse();
      expect(policy.shouldRetry(1, ERROR_TIMEOUT, STATUS_FAILED)).assertFalse();
      expect(policy.isExhausted(0)).assertFalse();
      expect(policy.isExhausted(1)).assertTrue();
      expect(policy.maxAttempts).assertEqual(1);
      expect(policy.baseDelayMs).assertEqual(25);
      expect(policy.delayFor(1)).assertEqual(25);
    });

    /**
     * @tc.name   createErrorIsOutsideTheRetryableSet
     * @tc.desc   isRetryableError lists only network, timeout and start codes, yet the policy still retries any non-zero code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('createErrorIsOutsideTheRetryableSet', 0, () => {
      const policy = new RetryPolicy(3, 200);
      const classifiedRetryable = isRetryableError(ERROR_CREATE);
      const policyDecision = policy.shouldRetry(0, ERROR_CREATE, STATUS_FAILED);
      logStep('CoreErrorRecovery', 'create retryable ' + String(classifiedRetryable));
      expect(classifiedRetryable).assertFalse();
      expect(policyDecision).assertTrue();
      expect(classifiedRetryable === policyDecision).assertFalse();
      expect(isRetryableError(ERROR_START)).assertTrue();
      expect(isRetryableError(ERROR_TIMEOUT)).assertTrue();
      expect(isRetryableError(ERROR_NETWORK)).assertTrue();
      expect(isRetryableError(0)).assertFalse();
    });

    /**
     * @tc.name   oneFailedTaskDoesNotCompleteTheGraph
     * @tc.desc   A completed, B failed: the graph is not finished, C never starts and the run stays active.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('oneFailedTaskDoesNotCompleteTheGraph', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      b.fail(ERROR_NETWORK);
      const polled = graph.pollTick(POLL_INTERVAL_MS);
      logStep('CoreErrorRecovery', 'graph after B failure ' + graph.snapshotText());
      expect(polled).assertFalse();
      expect(graph.allCompleted()).assertFalse();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.timerActive).assertTrue();
      expect(graph.runningCount()).assertEqual(0);
    });

    /**
     * @tc.name   failedDependencyBlocksUnlockEvent
     * @tc.desc   The unlock marker never appears when one prerequisite fails instead of completing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedDependencyBlocksUnlockEvent', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      b.fail(ERROR_TIMEOUT);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.pollTick(POLL_INTERVAL_MS * 2);
      logStep('CoreErrorRecovery', 'unlock entries ' + String(graph.events.countOf('unlocked')));
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.events.last()).assertEqual('completed:A');
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
    });

    /**
     * @tc.name   recoveryJourneyCompletesAfterSecondAttempt
     * @tc.desc   Reset, restart and complete B, then the gate opens and the whole journey finishes with three rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recoveryJourneyCompletesAfterSecondAttempt', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      b.fail(ERROR_NETWORK);
      b.reset();
      b.start(100);
      const recovered = graph.completeTask(TASK_B, 300);
      const gate = graph.canRunTaskC();
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      logStep('CoreErrorRecovery', 'recovery trace ' + completionTrace(graph));
      expect(recovered).assertTrue();
      expect(gate).assertTrue();
      expect(b.attempts).assertEqual(2);
      expect(b.status).assertEqual(STATUS_COMPLETED);
      expect(graph.allCompleted()).assertTrue();
      expect(completionTrace(graph)).assertEqual('A|B|C');
      expect(graph.lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   errorCodesAreDistinctAndNonZero
     * @tc.desc   The five simulated codes occupy five distinct values, so a branch cannot be confused with another.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('errorCodesAreDistinctAndNonZero', 0, () => {
      const codes: number[] = [ERROR_NONE, ERROR_CREATE, ERROR_START, ERROR_NETWORK, ERROR_TIMEOUT];
      let distinct = 0;
      for (let index = 0; index < codes.length; index++) {
        if (codes.indexOf(codes[index]) === index) {
          distinct = distinct + 1;
        }
      }
      logStep('CoreErrorRecovery', 'distinct codes ' + String(distinct));
      expect(distinct).assertEqual(5);
      expect(ERROR_NONE).assertEqual(0);
      expect(ERROR_CREATE).assertLarger(0);
      expect(ERROR_START).assertLarger(ERROR_CREATE);
      expect(ERROR_NETWORK).assertLarger(ERROR_START);
      expect(ERROR_TIMEOUT).assertLarger(ERROR_NETWORK);
      expect(ERROR_CREATE + ERROR_TIMEOUT).assertEqual(26800005);
    });

    /**
     * @tc.name   failedTaskStaysOutOfTheCompletionTrace
     * @tc.desc   Failure is not completion: the completion order keeps only the successful tasks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedTaskStaysOutOfTheCompletionTrace', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      a.fail(ERROR_START);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      const metrics = NetworkMetrics.from(graph);
      logStep('CoreErrorRecovery', 'order after failure ' + completionTrace(graph));
      expect(completionTrace(graph)).assertEqual('B');
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.completionOrder.indexOf(TASK_A)).assertEqual(-1);
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(metrics.failedTasks).assertEqual(1);
      expect(metrics.completedTasks).assertEqual(1);
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   abortDecisionMatchesStartCallbackBranch
     * @tc.desc   For every simulated code the abort flag equals the failed classification of the start callback.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('abortDecisionMatchesStartCallbackBranch', 0, () => {
      const codes: number[] = [ERROR_NONE, ERROR_CREATE, ERROR_START, ERROR_NETWORK, ERROR_TIMEOUT];
      let mismatches = 0;
      for (let index = 0; index < codes.length; index++) {
        const abort = shouldAbortStart(codes[index]);
        const failed = classifyStartResult(codes[index]) === 'failed';
        if (abort !== failed) {
          mismatches = mismatches + 1;
        }
      }
      logStep('CoreErrorRecovery', 'branch mismatches ' + String(mismatches));
      expect(mismatches).assertEqual(0);
      expect(shouldAbortStart(ERROR_NONE)).assertFalse();
      expect(classifyStartResult(ERROR_NONE)).assertEqual('started');
      expect(codes.length).assertEqual(5);
    });

    /**
     * @tc.name   repeatedFailureOverwritesErrorCode
     * @tc.desc   A second fail() on an already failed row is accepted and replaces the stored code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedFailureOverwritesErrorCode', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const c = graph.taskByNo(TASK_C) as DownloadTask;
      const first = c.fail(ERROR_CREATE);
      const second = c.fail(ERROR_TIMEOUT);
      logStep('CoreErrorRecovery', 'code ' + String(c.lastErrorCode));
      expect(first).assertTrue();
      expect(second).assertTrue();
      expect(c.lastErrorCode).assertEqual(ERROR_TIMEOUT);
      expect(c.status).assertEqual(STATUS_FAILED);
      expect(c.attempts).assertEqual(0);
      expect(c.progress).assertEqual(0);
      expect(isRetryableError(c.lastErrorCode)).assertTrue();
    });

    /**
     * @tc.name   completedTaskCannotFail
     * @tc.desc   Once a row is complete a trailing failure callback is refused and the 100 stays untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completedTaskCannotFail', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      const refused = a.fail(ERROR_NETWORK);
      logStep('CoreErrorRecovery', 'fail after complete ' + String(refused));
      expect(refused).assertFalse();
      expect(a.status).assertEqual(STATUS_COMPLETED);
      expect(a.lastErrorCode).assertEqual(ERROR_NONE);
      expect(a.progress).assertEqual(PROGRESS_TOTAL);
      expect(a.isComplete()).assertTrue();
      expect(graph.totalProgress()).assertEqual(100);
      expect(graph.events.countOf('completed')).assertEqual(1);
    });

    /**
     * @tc.name   createFailureLeavesTheTaskNeverStarted
     * @tc.desc   A create rejection happens before start, so attempts and startedAt stay at their idle values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('createFailureLeavesTheTaskNeverStarted', 0, () => {
      const task = new DownloadTask(TASK_C, 'https://example.com/icon_main_color.png');
      const created = task.fail(ERROR_CREATE);
      logStep('CoreErrorRecovery', 'create failure row ' + task.describe());
      expect(created).assertTrue();
      expect(task.attempts).assertEqual(0);
      expect(task.startedAt).assertEqual(0);
      expect(task.finishedAt).assertEqual(0);
      expect(task.status).assertEqual(STATUS_FAILED);
      expect(task.lastErrorCode).assertEqual(ERROR_CREATE);
      expect(classifyStartResult(ERROR_CREATE)).assertEqual('failed');
      expect(shouldAbortStart(ERROR_CREATE)).assertTrue();
    });

    /**
     * @tc.name   twoFailedRowsAreBothCountedByMetrics
     * @tc.desc   With A complete and B, C failed the metrics report one success and two failures.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoFailedRowsAreBothCountedByMetrics', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      const c = graph.taskByNo(TASK_C) as DownloadTask;
      b.fail(ERROR_NETWORK);
      c.fail(ERROR_TIMEOUT);
      const metrics = NetworkMetrics.from(graph);
      logStep('CoreErrorRecovery', 'completed ' + String(metrics.completedTasks) + ' failed ' +
        String(metrics.failedTasks));
      expect(metrics.completedTasks).assertEqual(1);
      expect(metrics.failedTasks).assertEqual(2);
      expect(metrics.totalTasks).assertEqual(3);
      expect(metrics.totalProgress).assertEqual(100);
      expect(metrics.successRatio()).assertEqual(1.0 / 3);
      expect(graph.allCompleted()).assertFalse();
      expect(c.status).assertEqual(STATUS_FAILED);
    });

    /**
     * @tc.name   retryPolicyWithZeroAttemptsNeverRetries
     * @tc.desc   A ceiling of zero marks every attempt exhausted, including the initial one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('retryPolicyWithZeroAttemptsNeverRetries', 0, () => {
      const policy = new RetryPolicy(0, 10);
      logStep('CoreErrorRecovery', 'zero ceiling exhausted ' + String(policy.isExhausted(0)));
      expect(policy.shouldRetry(0, ERROR_NETWORK, STATUS_FAILED)).assertFalse();
      expect(policy.isExhausted(0)).assertTrue();
      expect(policy.isExhausted(-1)).assertFalse();
      expect(policy.maxAttempts).assertEqual(0);
      expect(policy.delayFor(0)).assertEqual(10);
      expect(isRetryableError(ERROR_NETWORK)).assertTrue();
    });

    /**
     * @tc.name   gateStaysClosedAfterPartialRecovery
     * @tc.desc   Recovering only one dependency is not enough: C waits until the other row also completes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateStaysClosedAfterPartialRecovery', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const a = graph.taskByNo(TASK_A) as DownloadTask;
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      a.fail(ERROR_NETWORK);
      b.fail(ERROR_TIMEOUT);
      a.reset();
      a.start(50);
      const repairedA = a.complete(150);
      const gateAfterRepair = graph.canRunTaskC();
      const polled = graph.pollTick(POLL_INTERVAL_MS);
      logStep('CoreErrorRecovery', 'gate after single repair ' + String(gateAfterRepair));
      expect(repairedA).assertTrue();
      expect(a.isComplete()).assertTrue();
      expect(b.isFailed()).assertTrue();
      expect(gateAfterRepair).assertFalse();
      expect(polled).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.totalProgress()).assertEqual(100);
    });

    /**
     * @tc.name   retryDelayNeverReturnsNegativeTime
     * @tc.desc   Every accepted attempt index yields a non-negative delay, so a timer is never scheduled backwards.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('retryDelayNeverReturnsNegativeTime', 0, () => {
      const policy = new RetryPolicy(6, 150);
      let negatives = 0;
      let maximum: number = 0;
      for (let attempt = -2; attempt <= 6; attempt++) {
        const delay = policy.delayFor(attempt);
        if (delay < 0) {
          negatives = negatives + 1;
        }
        if (delay > maximum) {
          maximum = delay;
        }
      }
      logStep('CoreErrorRecovery', 'max delay ' + String(maximum));
      expect(negatives).assertEqual(0);
      expect(maximum).assertEqual(900);
      expect(policy.delayFor(6)).assertEqual(900);
      expect(policy.isExhausted(6)).assertTrue();
      expect(policy.isExhausted(5)).assertFalse();
      expect(policy.shouldRetry(5, ERROR_NETWORK, STATUS_FAILED)).assertTrue();
    });

    /**
     * @tc.name   abortedStartKeepsProgressAtZero
     * @tc.desc   A branch that aborts on its start error never reports progress, so its row reads idle at zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('abortedStartKeepsProgressAtZero', 0, () => {
      const graph = createTaskGraph();
      const started = graph.startAll();
      const c = graph.taskByNo(TASK_C) as DownloadTask;
      const aborts = shouldAbortStart(ERROR_START);
      const result = classifyStartResult(ERROR_START);
      logStep('CoreErrorRecovery', 'aborted branch ' + result);
      expect(started).assertTrue();
      expect(aborts).assertTrue();
      expect(result).assertEqual('failed');
      expect(c.progress).assertEqual(0);
      expect(c.attempts).assertEqual(0);
      expect(c.label()).assertEqual('任务C当前进度 0%');
      expect(expectedProgressAfter(0, -1)).assertEqual(0);
    });

    /**
     * @tc.name   restartDuringFailedRunIsRejected
     * @tc.desc   After a failure the run is still active, so a second start is refused and only the rejection marker lands.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('restartDuringFailedRunIsRejected', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      b.fail(ERROR_NETWORK);
      graph.pollTick(POLL_INTERVAL_MS);
      const sizeBefore = graph.events.size();
      const restarted = graph.startAll();
      logStep('CoreErrorRecovery', 'restart during failed run ' + String(restarted));
      expect(restarted).assertFalse();
      expect(graph.events.size()).assertEqual(sizeBefore + 1);
      expect(graph.events.last()).assertEqual('start-rejected:1');
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.isTaskFinished).assertFalse();
      const runningA = graph.taskByNo(TASK_A) as DownloadTask;
      expect(runningA.isRunning()).assertTrue();
    });

    /**
     * @tc.name   failureKeepsSharedLockOnTheFailedOwner
     * @tc.desc   A failed peer never released its shared hold, so the exclusive waiter still cannot enter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failureKeepsSharedLockOnTheFailedOwner', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      b.fail(ERROR_START);
      const exclusive = graph.lock.acquireExclusive(TASK_C);
      logStep('CoreErrorRecovery', 'exclusive after failure ' + String(exclusive));
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(exclusive).assertFalse();
      expect(graph.lock.rejections).assertEqual(1);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.runTaskCIfReady(POLL_INTERVAL_MS)).assertFalse();
    });

    /**
     * @tc.name   abortFlagIsFalseOnlyForSuccessCode
     * @tc.desc   The abort helper returns false for the single success code and true for every simulated failure.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreErrorRecovery scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('abortFlagIsFalseOnlyForSuccessCode', 0, () => {
      const failures: number[] = [ERROR_CREATE, ERROR_START, ERROR_NETWORK, ERROR_TIMEOUT];
      let falseCount = 0;
      for (let index = 0; index < failures.length; index++) {
        if (!shouldAbortStart(failures[index])) {
          falseCount = falseCount + 1;
        }
      }
      logStep('CoreErrorRecovery', 'failures that did not abort ' + String(falseCount));
      expect(falseCount).assertEqual(0);
      expect(shouldAbortStart(ERROR_NONE)).assertFalse();
      expect(failures.length).assertEqual(4);
      expect(classifyStartResult(failures[0])).assertEqual('failed');
    });
  });
}
