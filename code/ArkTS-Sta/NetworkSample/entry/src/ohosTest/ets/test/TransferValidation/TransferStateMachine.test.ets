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

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  DownloadTask,
  TaskGraph,
  createTaskGraph,
  ReferenceGraph,
  DependencyLock,
  expectedStepStatus,
  expectedGateOpen,
  isTerminalStatus,
  isTopologicalCompletion,
  completionTrace,
  countOf,
  TASK_A,
  TASK_B,
  TASK_C,
  URL_TASK_A,
  URL_TASK_B,
  URL_TASK_C,
  STATUS_IDLE,
  STATUS_RUNNING,
  STATUS_COMPLETED,
  STATUS_FAILED,
  ERROR_NONE,
  ERROR_TIMEOUT
} from '../Shared/SharedDriver';

/**
 * State machine suite for one download task and for the A/B/C dependency graph.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   57-65    the three progress values, isTaskFinished, lock, taskA/B completed flags
 *   68-107   updateProgress, completeTaskA/B/C, checkAndUnlock, canRunTaskC
 *   174-198  startAllTasks with shared A/B, exclusive C and the 200 ms poll
 *
 * The transition table is asserted from the outside: every row names a starting
 * status, one action and the status that must be observed afterwards.
 */
export default function transferStateMachineTest(): void {
  describe('TransferStateMachine', () => {
    beforeAll(() => {
      logSuite('TransferStateMachine', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('TransferStateMachine', 'end');
    });

    /**
     * @tc.name   freshTaskIsIdle
     * @tc.desc   The initial state of a task is idle with no attempt and no error.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('freshTaskIsIdle', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      expect(task.status).assertEqual(STATUS_IDLE);
      expect(task.isIdle()).assertTrue();
      expect(task.isRunning()).assertFalse();
      expect(task.isComplete()).assertFalse();
      expect(task.isFailed()).assertFalse();
      expect(task.attempts).assertEqual(0);
      expect(task.lastErrorCode).assertEqual(ERROR_NONE);
    });

    /**
     * @tc.name   startMovesIdleToRunning
     * @tc.desc   The start transition leaves idle behind and enters running.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startMovesIdleToRunning', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      expect(task.start(0)).assertTrue();
      expect(task.status).assertEqual(STATUS_RUNNING);
      expect(task.isRunning()).assertTrue();
      expect(task.isIdle()).assertFalse();
      expect(isTerminalStatus(task.status)).assertFalse();
      expect(task.attempts).assertEqual(1);
      expect(task.startedAt).assertEqual(0);
    });

    /**
     * @tc.name   startIncrementsAttemptsOnce
     * @tc.desc   One accepted start adds exactly one attempt, and a rejected start adds none.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startIncrementsAttemptsOnce', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      expect(task.start(10)).assertTrue();
      expect(task.attempts).assertEqual(1);
      expect(task.start(20)).assertFalse();
      expect(task.attempts).assertEqual(1);
      expect(task.startedAt).assertEqual(10);
      expect(task.status).assertEqual(STATUS_RUNNING);
      expect(task.finishedAt).assertEqual(0);
    });

    /**
     * @tc.name   runningTaskRejectsSecondStart
     * @tc.desc   A running task is not restartable until it leaves the running state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runningTaskRejectsSecondStart', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(0);
      expect(task.start(1)).assertFalse();
      expect(task.start(2)).assertFalse();
      expect(task.attempts).assertEqual(1);
      expect(task.isRunning()).assertTrue();
      expect(task.status).assertEqual(STATUS_RUNNING);
      expect(task.startedAt).assertEqual(0);
    });

    /**
     * @tc.name   completedTaskRejectsStart
     * @tc.desc   Completion is terminal for start, so a finished task cannot run again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completedTaskRejectsStart', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(0);
      task.complete(5);
      expect(task.start(9)).assertFalse();
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.isComplete()).assertTrue();
      expect(task.attempts).assertEqual(1);
      expect(task.finishedAt).assertEqual(5);
      expect(task.progress).assertEqual(100);
    });

    /**
     * @tc.name   failedTaskRejectsStart
     * @tc.desc   Failure is terminal for start; only a reset can return the task to idle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('failedTaskRejectsStart', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      task.start(0);
      task.fail(ERROR_TIMEOUT);
      expect(task.start(9)).assertFalse();
      expect(task.status).assertEqual(STATUS_FAILED);
      expect(task.isFailed()).assertTrue();
      expect(task.attempts).assertEqual(1);
      expect(task.lastErrorCode).assertEqual(ERROR_TIMEOUT);
      expect(isTerminalStatus(task.status)).assertTrue();
    });

    /**
     * @tc.name   completeMovesRunningToCompleted
     * @tc.desc   The complete transition moves a running task into the completed state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completeMovesRunningToCompleted', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(0);
      expect(task.complete(7)).assertTrue();
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.isComplete()).assertTrue();
      expect(task.isRunning()).assertFalse();
      expect(task.isFailed()).assertFalse();
      expect(isTerminalStatus(task.status)).assertTrue();
      expect(task.finishedAt).assertEqual(7);
    });

    /**
     * @tc.name   completeSetsProgressTotal
     * @tc.desc   Completion always lands on the page total, regardless of the progress before it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completeSetsProgressTotal', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(0);
      task.reportProgress(12);
      expect(task.progress).assertEqual(12);
      task.complete(3);
      expect(task.progress).assertEqual(100);
      expect(task.progressRatio()).assertEqual(1);
      expect(task.isComplete()).assertTrue();
      expect(task.progress > 12).assertTrue();
      expect(task.label()).assertEqual('任务B当前进度 100%');
    });

    /**
     * @tc.name   secondCompleteIsRejected
     * @tc.desc   complete() is idempotent and does not rewrite the completion timestamp.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('secondCompleteIsRejected', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      task.start(0);
      expect(task.complete(4)).assertTrue();
      expect(task.complete(40)).assertFalse();
      expect(task.finishedAt).assertEqual(4);
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.progress).assertEqual(100);
      expect(task.isComplete()).assertTrue();
      expect(task.attempts).assertEqual(1);
    });

    /**
     * @tc.name   failMovesRunningToFailed
     * @tc.desc   The fail transition leaves running behind and enters the failed state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('failMovesRunningToFailed', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(0);
      expect(task.fail(ERROR_TIMEOUT)).assertTrue();
      expect(task.status).assertEqual(STATUS_FAILED);
      expect(task.isFailed()).assertTrue();
      expect(task.isRunning()).assertFalse();
      expect(task.isComplete()).assertFalse();
      expect(isTerminalStatus(task.status)).assertTrue();
      expect(task.lastErrorCode).assertEqual(ERROR_TIMEOUT);
    });

    /**
     * @tc.name   failRecordsErrorCode
     * @tc.desc   The supplied error code is stored verbatim on the failed task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failRecordsErrorCode', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(0);
      task.fail(13400003);
      expect(task.lastErrorCode).assertEqual(13400003);
      expect(task.lastErrorCode !== ERROR_NONE).assertTrue();
      expect(task.lastErrorCode).assertLarger(0);
      expect(task.isFailed()).assertTrue();
      expect(task.status).assertEqual(STATUS_FAILED);
      expect(task.attempts).assertEqual(1);
    });

    /**
     * @tc.name   failFromIdleIsAllowed
     * @tc.desc   An error can arrive before start completes, and the task still becomes failed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failFromIdleIsAllowed', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      expect(task.isIdle()).assertTrue();
      expect(task.fail(ERROR_TIMEOUT)).assertTrue();
      expect(task.status).assertEqual(STATUS_FAILED);
      expect(task.isIdle()).assertFalse();
      expect(task.attempts).assertEqual(0);
      expect(task.startedAt).assertEqual(0);
      expect(task.lastErrorCode).assertEqual(ERROR_TIMEOUT);
    });

    /**
     * @tc.name   failAfterCompleteIsRejected
     * @tc.desc   A late error callback cannot move a completed task into the failed state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('failAfterCompleteIsRejected', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(0);
      task.complete(2);
      expect(task.fail(ERROR_TIMEOUT)).assertFalse();
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.isFailed()).assertFalse();
      expect(task.lastErrorCode).assertEqual(ERROR_NONE);
      expect(task.progress).assertEqual(100);
      expect(task.finishedAt).assertEqual(2);
    });

    /**
     * @tc.name   completeAfterFailMovesToCompleted
     * @tc.desc   The completion callback is accepted after a failure and supersedes the failed status.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completeAfterFailMovesToCompleted', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(0);
      task.fail(ERROR_TIMEOUT);
      expect(task.isFailed()).assertTrue();
      expect(task.complete(8)).assertTrue();
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.isComplete()).assertTrue();
      expect(task.isFailed()).assertFalse();
      expect(task.progress).assertEqual(100);
      expect(task.finishedAt).assertEqual(8);
      expect(task.lastErrorCode).assertEqual(ERROR_TIMEOUT);
    });

    /**
     * @tc.name   resetFromFailedReturnsIdle
     * @tc.desc   A failed task is recoverable: reset moves it back to the idle state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetFromFailedReturnsIdle', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      task.start(0);
      task.fail(ERROR_TIMEOUT);
      task.reset();
      expect(task.status).assertEqual(STATUS_IDLE);
      expect(task.isIdle()).assertTrue();
      expect(task.isFailed()).assertFalse();
      expect(task.isRunning()).assertFalse();
      expect(isTerminalStatus(task.status)).assertFalse();
      expect(task.progress).assertEqual(0);
    });

    /**
     * @tc.name   resetFromCompletedReturnsIdle
     * @tc.desc   A completed task can also be reset, returning the row to the zero boundary.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetFromCompletedReturnsIdle', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(0);
      task.complete(3);
      task.reset();
      expect(task.status).assertEqual(STATUS_IDLE);
      expect(task.progress).assertEqual(0);
      expect(task.isComplete()).assertFalse();
      expect(isTerminalStatus(task.status)).assertFalse();
      expect(task.progressRatio()).assertEqual(0);
      expect(task.label()).assertEqual('任务A当前进度 0%');
    });

    /**
     * @tc.name   resetClearsErrorAndTimestamps
     * @tc.desc   reset() clears the stored error code and both lifecycle timestamps.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetClearsErrorAndTimestamps', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(11);
      task.fail(13400004);
      task.reset();
      expect(task.lastErrorCode).assertEqual(ERROR_NONE);
      expect(task.startedAt).assertEqual(0);
      expect(task.finishedAt).assertEqual(0);
      expect(task.status).assertEqual(STATUS_IDLE);
      expect(task.attempts).assertEqual(1);
      expect(task.taskNo).assertEqual(TASK_B);
      expect(task.url).assertEqual(URL_TASK_B);
    });

    /**
     * @tc.name   resetPreservesAttempts
     * @tc.desc   A reset keeps the attempt counter so retry accounting is not lost.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetPreservesAttempts', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      task.start(0);
      task.fail(ERROR_TIMEOUT);
      expect(task.attempts).assertEqual(1);
      task.reset();
      expect(task.attempts).assertEqual(1);
      expect(task.start(20)).assertTrue();
      expect(task.attempts).assertEqual(2);
      expect(task.startedAt).assertEqual(20);
      expect(task.isRunning()).assertTrue();
    });

    /**
     * @tc.name   statusVocabularyHasFourDistinctValues
     * @tc.desc   The state machine uses exactly four distinct lowercase status literals.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('statusVocabularyHasFourDistinctValues', 0, () => {
      const statuses: string[] = [STATUS_IDLE, STATUS_RUNNING, STATUS_COMPLETED, STATUS_FAILED];
      expect(statuses.length).assertEqual(4);
      expect(countOf(statuses, STATUS_IDLE)).assertEqual(1);
      expect(countOf(statuses, STATUS_RUNNING)).assertEqual(1);
      expect(countOf(statuses, STATUS_COMPLETED)).assertEqual(1);
      expect(countOf(statuses, STATUS_FAILED)).assertEqual(1);
      expect(statuses[0]).assertEqual('idle');
      expect(statuses[1]).assertEqual('running');
      expect(statuses[3]).assertEqual('failed');
    });

    /**
     * @tc.name   predicatesAgreeWithStoredStatus
     * @tc.desc   The four boolean predicates are mutually exclusive and match the stored status.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('predicatesAgreeWithStoredStatus', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      expect(task.isIdle()).assertEqual(task.status === STATUS_IDLE);
      task.start(0);
      expect(task.isRunning()).assertEqual(task.status === STATUS_RUNNING);
      expect(task.isIdle()).assertFalse();
      task.complete(1);
      expect(task.isComplete()).assertEqual(task.status === STATUS_COMPLETED);
      expect(task.isRunning()).assertFalse();
      expect(task.isFailed()).assertFalse();
      expect(task.isIdle()).assertFalse();
    });

    /**
     * @tc.name   transitionTableFromIdle
     * @tc.desc   From idle, start enters running, fail enters failed and complete enters completed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('transitionTableFromIdle', 0, () => {
      const started: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      const failed: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      const completed: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      expect(started.status).assertEqual(STATUS_IDLE);
      expect(started.start(0)).assertTrue();
      expect(started.status).assertEqual(STATUS_RUNNING);
      expect(failed.fail(ERROR_TIMEOUT)).assertTrue();
      expect(failed.status).assertEqual(STATUS_FAILED);
      expect(completed.complete(0)).assertTrue();
      expect(completed.status).assertEqual(STATUS_COMPLETED);
      expect(isTerminalStatus(started.status)).assertFalse();
    });

    /**
     * @tc.name   transitionTableFromRunning
     * @tc.desc   From running, another start is refused while complete and fail are accepted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('transitionTableFromRunning', 0, () => {
      const restarted: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      const completed: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      const failed: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      restarted.start(0);
      completed.start(0);
      failed.start(0);
      expect(restarted.start(1)).assertFalse();
      expect(restarted.status).assertEqual(STATUS_RUNNING);
      expect(completed.complete(1)).assertTrue();
      expect(completed.status).assertEqual(STATUS_COMPLETED);
      expect(failed.fail(ERROR_TIMEOUT)).assertTrue();
      expect(failed.status).assertEqual(STATUS_FAILED);
      expect(completed.progress).assertEqual(100);
    });

    /**
     * @tc.name   transitionTableFromCompleted
     * @tc.desc   The completed state rejects start, complete and fail without changing any field.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('transitionTableFromCompleted', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_A, URL_TASK_A);
      task.start(0);
      task.complete(6);
      expect(task.start(7)).assertFalse();
      expect(task.complete(8)).assertFalse();
      expect(task.fail(ERROR_TIMEOUT)).assertFalse();
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.finishedAt).assertEqual(6);
      expect(task.progress).assertEqual(100);
      expect(task.lastErrorCode).assertEqual(ERROR_NONE);
      expect(task.attempts).assertEqual(1);
    });

    /**
     * @tc.name   transitionTableFromFailed
     * @tc.desc   The failed state rejects start, accepts complete, and returns to idle only after reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('transitionTableFromFailed', 0, () => {
      const task: DownloadTask = new DownloadTask(TASK_B, URL_TASK_B);
      task.start(0);
      task.fail(ERROR_TIMEOUT);
      expect(task.start(1)).assertFalse();
      expect(task.status).assertEqual(STATUS_FAILED);
      const recovered: DownloadTask = new DownloadTask(TASK_C, URL_TASK_C);
      recovered.start(0);
      recovered.fail(ERROR_TIMEOUT);
      expect(recovered.complete(2)).assertTrue();
      expect(recovered.status).assertEqual(STATUS_COMPLETED);
      task.reset();
      expect(task.status).assertEqual(STATUS_IDLE);
      expect(task.isIdle()).assertTrue();
    });

    /**
     * @tc.name   gateClosedForFreshGraph
     * @tc.desc   A fresh graph cannot run C because neither A nor B has completed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateClosedForFreshGraph', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(0).isComplete()).assertFalse();
      expect(graph.taskAt(1).isComplete()).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.runTaskCIfReady()).assertFalse();
      expect(graph.taskAt(2).attempts).assertEqual(0);
      expect(graph.lock.exclusiveOwner).assertEqual('');
    });

    /**
     * @tc.name   gateRequiresTaskA
     * @tc.desc   Completing B alone leaves the gate shut, so C may not start.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateRequiresTaskA', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(0).isComplete()).assertFalse();
      expect(graph.taskAt(1).isComplete()).assertTrue();
      expect(graph.runTaskCIfReady()).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(expectedGateOpen(false, true)).assertFalse();
    });

    /**
     * @tc.name   gateRequiresTaskB
     * @tc.desc   Completing A alone leaves the gate shut, so C may not start.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateRequiresTaskB', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.taskAt(0).isComplete()).assertTrue();
      expect(graph.taskAt(1).isComplete()).assertFalse();
      expect(graph.runTaskCIfReady()).assertFalse();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(expectedGateOpen(true, false)).assertFalse();
    });

    /**
     * @tc.name   gateOpensAfterBoth
     * @tc.desc   The gate predicate becomes true exactly when A and B are both complete.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateOpensAfterBoth', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.taskAt(0).isComplete()).assertTrue();
      expect(graph.taskAt(1).isComplete()).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(expectedGateOpen(true, true)).assertTrue();
      expect(expectedGateOpen(false, false)).assertFalse();
      expect(graph.lock.sharedHolders.length).assertEqual(0);
    });

    /**
     * @tc.name   runTaskCIfReadyFailsBeforeGate
     * @tc.desc   Starting C while the gate is shut is refused without consuming an attempt.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runTaskCIfReadyFailsBeforeGate', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.runTaskCIfReady()).assertFalse();
      expect(graph.taskAt(2).attempts).assertEqual(0);
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.timerActive).assertTrue();
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.events.last()).assertEqual('queued:C');
    });

    /**
     * @tc.name   runTaskCIfReadyStartsAfterGate
     * @tc.desc   Once A and B complete, runTaskCIfReady acquires the exclusive lock and starts C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runTaskCIfReadyStartsAfterGate', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.runTaskCIfReady()).assertTrue();
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.timerActive).assertFalse();
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.events.last()).assertEqual('started:C');
    });

    /**
     * @tc.name   runTaskCIfReadyRejectsSecondInvocation
     * @tc.desc   C starts once; a second ready call is refused because C is no longer idle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('runTaskCIfReadyRejectsSecondInvocation', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.runTaskCIfReady()).assertTrue();
      expect(graph.runTaskCIfReady()).assertFalse();
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
    });

    /**
     * @tc.name   pollTickWithoutTimerIsNoOp
     * @tc.desc   A poll on a stopped timer only advances the tick counter and records no event.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pollTickWithoutTimerIsNoOp', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTick()).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.taskAt(2).attempts).assertEqual(0);
      expect(graph.taskAt(2).isIdle()).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
    });

    /**
     * @tc.name   pollTickStartsCOnlyOnce
     * @tc.desc   After the gate opens, the first poll starts C and the timer stops so no second start occurs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pollTickStartsCOnlyOnce', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.pollTick()).assertTrue();
      expect(graph.pollTick()).assertFalse();
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.timerActive).assertFalse();
    });

    /**
     * @tc.name   completeTaskCReleasesExclusiveOwner
     * @tc.desc   Finishing C hands the exclusive lock back and leaves no holder behind.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completeTaskCReleasesExclusiveOwner', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.runTaskCIfReady();
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      expect(graph.completeTaskC(9)).assertTrue();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.taskAt(2).isComplete()).assertTrue();
      expect(graph.taskAt(2).finishedAt).assertEqual(9);
      expect(graph.lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   lockUnlockedAfterFullRun
     * @tc.desc   The dependency lock reports zero holders once the whole run has completed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lockUnlockedAfterFullRun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.lock.holderCount()).assertEqual(2);
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.lock.isUnlocked()).assertTrue();
      graph.runTaskCIfReady();
      expect(graph.lock.holderCount()).assertEqual(1);
      graph.completeTaskC();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.exclusiveOwner).assertEqual('');
    });

    /**
     * @tc.name   completionOrderIsTopological
     * @tc.desc   The recorded completion order satisfies the A/B before C topological rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completionOrderIsTopological', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.completeTaskC();
      expect(completionTrace(graph)).assertEqual('A|B|C');
      expect(isTopologicalCompletion(graph.completionOrder)).assertTrue();
      expect(graph.completionOrder.length).assertEqual(3);
      expect(graph.completionOrder.indexOf(TASK_C)).assertEqual(2);
      expect(graph.completionOrder.indexOf(TASK_C)).assertLarger(graph.completionOrder.indexOf(TASK_A));
      expect(graph.completionOrder.indexOf(TASK_C)).assertLarger(graph.completionOrder.indexOf(TASK_B));
    });

    /**
     * @tc.name   completionOrderWithoutCIsNotTopological
     * @tc.desc   An order that stops at A and B lacks C and therefore fails the topological check.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completionOrderWithoutCIsNotTopological', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(completionTrace(graph)).assertEqual('A|B');
      expect(isTopologicalCompletion(graph.completionOrder)).assertFalse();
      expect(graph.completionOrder.length).assertEqual(2);
      expect(isTopologicalCompletion(['C', 'A', 'B'])).assertFalse();
      expect(isTopologicalCompletion(['A', 'B', 'C'])).assertTrue();
      expect(isTopologicalCompletion(['A', 'C', 'B'])).assertFalse();
      expect(isTopologicalCompletion(['B', 'C', 'A'])).assertFalse();
    });

    /**
     * @tc.name   resetRestoresIdleRows
     * @tc.desc   Resetting a partially finished graph returns every row to idle with the lock free.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetRestoresIdleRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.reset();
      for (let index = 0; index < graph.tasks.length; index++) {
        expect(graph.taskAt(index).isIdle()).assertTrue();
        expect(graph.taskAt(index).progress).assertEqual(0);
      }
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.lock.sharedHolders.length).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.isTaskFinished).assertTrue();
    });

    /**
     * @tc.name   dependencyLockSharedRejectsExclusive
     * @tc.desc   While A and B hold shared locks, C cannot acquire the exclusive lock.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('dependencyLockSharedRejectsExclusive', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.acquireShared(TASK_A)).assertTrue();
      expect(lock.acquireShared(TASK_B)).assertTrue();
      expect(lock.holderCount()).assertEqual(2);
      expect(lock.acquireExclusive(TASK_C)).assertFalse();
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.rejections).assertEqual(1);
      expect(lock.waitingExclusive).assertTrue();
      expect(lock.isUnlocked()).assertFalse();
    });

    /**
     * @tc.name   dependencyLockExclusiveBlocksShared
     * @tc.desc   An exclusive owner prevents new shared acquisitions until it releases.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('dependencyLockExclusiveBlocksShared', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      expect(lock.acquireShared(TASK_A)).assertFalse();
      expect(lock.rejections).assertEqual(1);
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.hasShared(TASK_A)).assertFalse();
      expect(lock.releaseExclusive(TASK_C)).assertTrue();
      expect(lock.acquireShared(TASK_A)).assertTrue();
      expect(lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   referenceGraphMatchesGraphGate
     * @tc.desc   The independent booleans of ReferenceGraph agree with the class gate at each step.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('referenceGraphMatchesGraphGate', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const reference: ReferenceGraph = new ReferenceGraph();
      expect(reference.unlocked()).assertEqual(graph.canRunTaskC());
      reference.markComplete(TASK_A);
      graph.completeTask(TASK_A);
      expect(reference.unlocked()).assertEqual(graph.canRunTaskC());
      expect(reference.unlocked()).assertFalse();
      reference.markComplete(TASK_B);
      graph.completeTask(TASK_B);
      expect(reference.unlocked()).assertTrue();
      expect(reference.unlocked()).assertEqual(graph.canRunTaskC());
      expect(expectedGateOpen(reference.aDone, reference.bDone)).assertTrue();
    });

    /**
     * @tc.name   referenceGraphPollRunsOnce
     * @tc.desc   The reference poll starts C once and refuses every later round.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('referenceGraphPollRunsOnce', 0, () => {
      const reference: ReferenceGraph = new ReferenceGraph();
      reference.markComplete(TASK_A);
      reference.markComplete(TASK_B);
      expect(reference.poll()).assertTrue();
      expect(reference.poll()).assertFalse();
      expect(reference.cStarted).assertTrue();
      expect(reference.rounds).assertEqual(2);
      expect(reference.cDone).assertFalse();
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick();
      expect(graph.taskAt(2).isRunning()).assertEqual(reference.cStarted);
    });

    /**
     * @tc.name   referenceGraphTraceFormat
     * @tc.desc   The reference trace renders the four booleans in a fixed comma separated order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('referenceGraphTraceFormat', 0, () => {
      const reference: ReferenceGraph = new ReferenceGraph();
      expect(reference.trace()).assertEqual('false,false,false,false');
      reference.markComplete(TASK_A);
      expect(reference.trace()).assertEqual('true,false,false,false');
      reference.markComplete(TASK_B);
      reference.poll();
      expect(reference.trace()).assertEqual('true,true,true,false');
      reference.markComplete(TASK_C);
      expect(reference.trace()).assertEqual('true,true,true,true');
      expect(reference.trace().split(',').length).assertEqual(4);
      expect(countOf(reference.trace().split(','), 'true')).assertEqual(4);
    });

    /**
     * @tc.name   expectedStepStatusMatrix
     * @tc.desc   The step oracle reports completed only when both dependencies are done.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('expectedStepStatusMatrix', 0, () => {
      expect(expectedStepStatus(false, false)).assertEqual(STATUS_RUNNING);
      expect(expectedStepStatus(true, false)).assertEqual(STATUS_RUNNING);
      expect(expectedStepStatus(false, true)).assertEqual(STATUS_RUNNING);
      expect(expectedStepStatus(true, true)).assertEqual(STATUS_COMPLETED);
      expect(expectedStepStatus(true, true) === STATUS_RUNNING).assertFalse();
      expect(expectedStepStatus(false, false)).assertEqual(expectedStepStatus(true, false));
      expect(countOf([expectedStepStatus(true, true)], STATUS_COMPLETED)).assertEqual(1);
    });

    /**
     * @tc.name   fullRunLeavesAllCompleted
     * @tc.desc   The complete A, B, poll, C sequence leaves three completed rows and a stopped timer.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferStateMachine scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fullRunLeavesAllCompleted', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick();
      graph.completeTaskC(12);
      expect(graph.allCompleted()).assertTrue();
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(300);
      expect(graph.timerActive).assertFalse();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(completionTrace(graph)).assertEqual('A|B|C');
      expect(graph.taskAt(2).finishedAt).assertEqual(12);
      expect(graph.isTaskFinished).assertFalse();
    });

  });
}
