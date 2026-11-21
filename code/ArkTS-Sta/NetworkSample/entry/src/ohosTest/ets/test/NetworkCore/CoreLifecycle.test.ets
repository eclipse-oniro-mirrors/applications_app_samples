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
 * CoreLifecycle suite of the NetworkSample ohosTest module.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   57-65    the four @State cells and the three private completion fields
 *   79-95    completeTaskA / completeTaskB / completeTaskC write 100
 *   174-198  startAllTasks flips isTaskFinished and starts a fresh poll
 *
 * The suite walks each row through idle -> running -> completed, then through
 * failed -> idle after a reset, and re-runs the whole graph to prove the
 * lifecycle is repeatable rather than one-shot.
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
  PROGRESS_TOTAL,
  POLL_INTERVAL_MS,
  ERROR_TIMEOUT,
  DownloadTask,
  TaskGraph,
  NetworkMetrics,
  createTaskGraph,
  isTerminalStatus,
  expectedStepStatus,
  completionTrace,
  joined
} from '../Shared/SharedDriver';

export default function networkCoreLifecycleTest(): void {
  describe('CoreLifecycle', () => {
    beforeAll(() => {
      logSuite('CoreLifecycle', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CoreLifecycle', 'end');
    });

    /**
     * @tc.name   freshTaskIsIdleWithZeroProgress
     * @tc.desc   A newly constructed DownloadTask has no attempts, no timestamps and an empty progress bar.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('freshTaskIsIdleWithZeroProgress', 0, () => {
      const task = new DownloadTask(TASK_A, 'https://example.com/a.png');
      logStep('CoreLifecycle', 'fresh ' + task.describe());
      expect(task.status).assertEqual(STATUS_IDLE);
      expect(task.progress).assertEqual(0);
      expect(task.attempts).assertEqual(0);
      expect(task.startedAt).assertEqual(0);
      expect(task.finishedAt).assertEqual(0);
      expect(task.isIdle()).assertTrue();
      expect(task.isRunning()).assertFalse();
      expect(task.isComplete()).assertFalse();
    });

    /**
     * @tc.name   lifecycleStartMovesIdleToRunning
     * @tc.desc   start() returns true exactly once from idle and moves the status to running.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('lifecycleStartMovesIdleToRunning', 0, () => {
      const task = new DownloadTask(TASK_B, 'https://example.com/b.png');
      const accepted = task.start(10);
      logStep('CoreLifecycle', 'after start ' + task.describe());
      expect(accepted).assertTrue();
      expect(task.status).assertEqual(STATUS_RUNNING);
      expect(task.isRunning()).assertTrue();
      expect(task.isIdle()).assertFalse();
      expect(task.attempts).assertEqual(1);
      expect(task.progress).assertEqual(0);
      expect(task.finishedAt).assertEqual(0);
    });

    /**
     * @tc.name   startTwiceWhileRunningIsRejected
     * @tc.desc   A running task refuses a second start, so the attempt counter stays at one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startTwiceWhileRunningIsRejected', 0, () => {
      const task = new DownloadTask(TASK_C, 'https://example.com/c.png');
      task.start(0);
      const second = task.start(50);
      logStep('CoreLifecycle', 'second start ' + String(second));
      expect(second).assertFalse();
      expect(task.attempts).assertEqual(1);
      expect(task.startedAt).assertEqual(0);
      expect(task.status).assertEqual(STATUS_RUNNING);
      expect(task.isRunning()).assertTrue();
      expect(task.isComplete()).assertFalse();
    });

    /**
     * @tc.name   startStampsStartedAt
     * @tc.desc   The start timestamp is the value passed by the caller, not a clock read inside the task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startStampsStartedAt', 0, () => {
      const task = new DownloadTask(TASK_A, 'https://example.com/a.png');
      task.start(1234);
      logStep('CoreLifecycle', 'startedAt ' + String(task.startedAt));
      expect(task.startedAt).assertEqual(1234);
      expect(task.startedAt).assertLarger(0);
      expect(task.finishedAt).assertEqual(0);
      expect(task.status).assertEqual(STATUS_RUNNING);
      expect(task.label()).assertEqual('任务A当前进度 0%');
      expect(task.attempts).assertEqual(1);
    });

    /**
     * @tc.name   lifecycleCompleteMovesRunningToCompleted
     * @tc.desc   A running task accepts one completion, becomes terminal and reports a full ratio.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('lifecycleCompleteMovesRunningToCompleted', 0, () => {
      const task = new DownloadTask(TASK_A, 'https://example.com/a.png');
      task.start(0);
      const accepted = task.complete(900);
      logStep('CoreLifecycle', 'after complete ' + task.describe());
      expect(accepted).assertTrue();
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.isComplete()).assertTrue();
      expect(task.isRunning()).assertFalse();
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(task.progressRatio()).assertEqual(1);
      expect(task.finishedAt).assertEqual(900);
    });

    /**
     * @tc.name   completeFromIdleIsAllowed
     * @tc.desc   The page's completion callback can beat the start callback, so complete() also works from idle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completeFromIdleIsAllowed', 0, () => {
      const task = new DownloadTask(TASK_B, 'https://example.com/b.png');
      const accepted = task.complete(300);
      logStep('CoreLifecycle', 'idle completion ' + task.describe());
      expect(accepted).assertTrue();
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(task.attempts).assertEqual(0);
      expect(task.startedAt).assertEqual(0);
      expect(task.finishedAt).assertEqual(300);
      expect(task.isComplete()).assertTrue();
    });

    /**
     * @tc.name   completeTwiceIsRejected
     * @tc.desc   The second complete() is refused and cannot move the finish timestamp a second time.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completeTwiceIsRejected', 0, () => {
      const task = new DownloadTask(TASK_C, 'https://example.com/c.png');
      task.start(0);
      const first = task.complete(400);
      const second = task.complete(800);
      logStep('CoreLifecycle', 'finish stamps ' + String(task.finishedAt));
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(task.finishedAt).assertEqual(400);
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(task.isComplete()).assertTrue();
      expect(task.attempts).assertEqual(1);
    });

    /**
     * @tc.name   completeStampsFinishedAt
     * @tc.desc   The finish timestamp records the completion argument and never predates the start stamp in a run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completeStampsFinishedAt', 0, () => {
      const task = new DownloadTask(TASK_A, 'https://example.com/a.png');
      task.start(200);
      task.complete(700);
      logStep('CoreLifecycle', 'stamps ' + String(task.startedAt) + ' -> ' + String(task.finishedAt));
      expect(task.startedAt).assertEqual(200);
      expect(task.finishedAt).assertEqual(700);
      expect(task.finishedAt - task.startedAt).assertEqual(500);
      expect(task.finishedAt).assertLarger(task.startedAt);
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.attempts).assertEqual(1);
    });

    /**
     * @tc.name   completeAlwaysWritesFullProgress
     * @tc.desc   Completion writes 100 in one step regardless of the intermediate value that was reported.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completeAlwaysWritesFullProgress', 0, () => {
      const task = new DownloadTask(TASK_B, 'https://example.com/b.png');
      task.start(0);
      task.reportProgress(63);
      const before = task.progress;
      task.complete(50);
      logStep('CoreLifecycle', 'progress ' + String(before) + ' -> ' + String(task.progress));
      expect(before).assertEqual(63);
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(task.progressRatio()).assertEqual(1);
      expect(task.label()).assertEqual('任务B当前进度 100%');
      expect(task.describe()).assertEqual('B:completed:100');
      expect(task.isComplete()).assertTrue();
    });

    /**
     * @tc.name   resetReturnsCompletedTaskToIdle
     * @tc.desc   A completed row resets to idle with a zero bar, ready for the next run of the page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetReturnsCompletedTaskToIdle', 0, () => {
      const task = new DownloadTask(TASK_A, 'https://example.com/a.png');
      task.start(0);
      task.complete(100);
      task.reset();
      logStep('CoreLifecycle', 'after reset ' + task.describe());
      expect(task.status).assertEqual(STATUS_IDLE);
      expect(task.progress).assertEqual(0);
      expect(task.isIdle()).assertTrue();
      expect(task.isComplete()).assertFalse();
      expect(task.progressRatio()).assertEqual(0);
      expect(task.label()).assertEqual('任务A当前进度 0%');
      expect(task.lastErrorCode).assertEqual(0);
    });

    /**
     * @tc.name   resetReturnsFailedTaskToIdle
     * @tc.desc   The failed branch also returns to idle, so a retry begins from a clean row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetReturnsFailedTaskToIdle', 0, () => {
      const task = new DownloadTask(TASK_B, 'https://example.com/b.png');
      task.start(0);
      task.reportProgress(12);
      task.fail(ERROR_TIMEOUT);
      const failedState = task.status;
      task.reset();
      logStep('CoreLifecycle', 'failed ' + failedState + ' then ' + task.status);
      expect(failedState).assertEqual(STATUS_FAILED);
      expect(task.status).assertEqual(STATUS_IDLE);
      expect(task.isFailed()).assertFalse();
      expect(task.isIdle()).assertTrue();
      expect(task.progress).assertEqual(0);
      expect(task.lastErrorCode).assertEqual(0);
      expect(task.attempts).assertEqual(1);
    });

    /**
     * @tc.name   resetClearsBothTimestamps
     * @tc.desc   reset() zeroes startedAt and finishedAt, which the completion trace of the next run depends on.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetClearsBothTimestamps', 0, () => {
      const task = new DownloadTask(TASK_C, 'https://example.com/c.png');
      task.start(250);
      task.complete(750);
      const beforeStart = task.startedAt;
      const beforeFinish = task.finishedAt;
      task.reset();
      logStep('CoreLifecycle', 'timestamps ' + String(beforeStart) + '/' + String(beforeFinish) + ' -> 0/0');
      expect(beforeStart).assertEqual(250);
      expect(beforeFinish).assertEqual(750);
      expect(task.startedAt).assertEqual(0);
      expect(task.finishedAt).assertEqual(0);
      expect(task.startedAt).assertEqual(task.finishedAt);
      expect(task.status).assertEqual(STATUS_IDLE);
    });

    /**
     * @tc.name   resetKeepsAttemptHistory
     * @tc.desc   Resetting is not a fresh object: the attempt counter survives so the retry count is honest.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetKeepsAttemptHistory', 0, () => {
      const task = new DownloadTask(TASK_A, 'https://example.com/a.png');
      task.start(0);
      task.fail(ERROR_TIMEOUT);
      task.reset();
      const keptAfterReset = task.attempts;
      task.start(100);
      const afterSecondStart = task.attempts;
      logStep('CoreLifecycle', 'attempts ' + String(keptAfterReset) + ' -> ' + String(afterSecondStart));
      expect(keptAfterReset).assertEqual(1);
      expect(afterSecondStart).assertEqual(2);
      expect(task.status).assertEqual(STATUS_RUNNING);
      expect(task.startedAt).assertEqual(100);
      expect(task.isIdle()).assertFalse();
      expect(task.taskNo).assertEqual(TASK_A);
    });

    /**
     * @tc.name   failedTaskIsTerminalForStart
     * @tc.desc   A failed row refuses a start until it is reset, which protects the error code from being lost.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('failedTaskIsTerminalForStart', 0, () => {
      const task = new DownloadTask(TASK_B, 'https://example.com/b.png');
      task.start(0);
      task.fail(ERROR_TIMEOUT);
      const restart = task.start(400);
      logStep('CoreLifecycle', 'restart after failure ' + String(restart));
      expect(restart).assertFalse();
      expect(task.status).assertEqual(STATUS_FAILED);
      expect(task.attempts).assertEqual(1);
      expect(task.startedAt).assertEqual(0);
      expect(isTerminalStatus(task.status)).assertTrue();
      expect(task.isFailed()).assertTrue();
      expect(task.progress).assertEqual(0);
    });

    /**
     * @tc.name   completedTaskIsTerminalForStart
     * @tc.desc   The completed status is terminal for start as well, so a finished row cannot be re-dispatched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completedTaskIsTerminalForStart', 0, () => {
      const task = new DownloadTask(TASK_C, 'https://example.com/c.png');
      task.start(0);
      task.complete(500);
      const restart = task.start(900);
      logStep('CoreLifecycle', 'restart after completion ' + String(restart));
      expect(restart).assertFalse();
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.attempts).assertEqual(1);
      expect(task.startedAt).assertEqual(0);
      expect(task.finishedAt).assertEqual(500);
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(isTerminalStatus(STATUS_COMPLETED)).assertTrue();
    });

    /**
     * @tc.name   terminalCompletedIgnoresProgress
     * @tc.desc   No progress report can move a completed row away from 100, not even a lower replacement value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('terminalCompletedIgnoresProgress', 0, () => {
      const task = new DownloadTask(TASK_A, 'https://example.com/a.png');
      task.start(0);
      task.complete(100);
      const high = task.reportProgress(120);
      const low = task.reportProgress(10);
      logStep('CoreLifecycle', 'terminal reports ' + String(high) + '/' + String(low));
      expect(high).assertEqual(PROGRESS_TOTAL);
      expect(low).assertEqual(PROGRESS_TOTAL);
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.progressRatio()).assertEqual(1);
      expect(task.isComplete()).assertTrue();
      expect(task.finishedAt).assertEqual(100);
    });

    /**
     * @tc.name   terminalFailedIgnoresProgress
     * @tc.desc   A failed row stays frozen at its last value and cannot be lifted toward completion by callbacks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('terminalFailedIgnoresProgress', 0, () => {
      const task = new DownloadTask(TASK_B, 'https://example.com/b.png');
      task.start(0);
      task.reportProgress(45);
      task.fail(ERROR_TIMEOUT);
      const after = task.reportProgress(95);
      logStep('CoreLifecycle', 'failed row stays at ' + String(after));
      expect(after).assertEqual(45);
      expect(task.progress).assertEqual(45);
      expect(task.progressRatio()).assertEqual(0.45);
      expect(task.status).assertEqual(STATUS_FAILED);
      expect(task.isFailed()).assertTrue();
      expect(task.label()).assertEqual('任务B当前进度 45%');
      expect(task.finishedAt).assertEqual(0);
    });

    /**
     * @tc.name   graphStartMovesAAndBToRunning
     * @tc.desc   startAll is the only transition into running, and it moves exactly the two shared tasks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphStartMovesAAndBToRunning', 0, () => {
      const graph = createTaskGraph();
      const before = graph.runningCount();
      graph.startAll();
      logStep('CoreLifecycle', 'running ' + String(before) + ' -> ' + String(graph.runningCount()));
      expect(before).assertEqual(0);
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.taskAt(0).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(1).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(0).startedAt).assertEqual(0);
      expect(graph.taskAt(1).startedAt).assertEqual(0);
    });

    /**
     * @tc.name   graphLifecycleIdleRunningCompletedForC
     * @tc.desc   Task C traverses the same three states in order: idle, running after the poll, completed last.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphLifecycleIdleRunningCompletedForC', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const c = graph.taskByNo(TASK_C) as DownloadTask;
      const stateIdle = c.status;
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      const stateRunning = c.status;
      graph.completeTaskC(POLL_INTERVAL_MS);
      logStep('CoreLifecycle', 'C lifecycle ' + stateIdle + ' -> ' + stateRunning + ' -> ' + c.status);
      expect(stateIdle).assertEqual(STATUS_IDLE);
      expect(stateRunning).assertEqual(STATUS_RUNNING);
      expect(c.status).assertEqual(STATUS_COMPLETED);
      expect(c.attempts).assertEqual(1);
      expect(c.startedAt).assertEqual(POLL_INTERVAL_MS);
      expect(c.finishedAt).assertEqual(POLL_INTERVAL_MS);
      expect(c.progress).assertEqual(PROGRESS_TOTAL);
    });

    /**
     * @tc.name   graphResetClearsCompletionOrderAndPollTicks
     * @tc.desc   reset() empties the completion order, the poll counter and the event recorder together.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphResetClearsCompletionOrderAndPollTicks', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.pollTick(POLL_INTERVAL_MS * 2);
      const ticksBefore = graph.pollTicks;
      const orderBefore = graph.completionOrder.length;
      graph.reset();
      logStep('CoreLifecycle', 'ticks ' + String(ticksBefore) + ' -> ' + String(graph.pollTicks));
      expect(ticksBefore).assertEqual(2);
      expect(orderBefore).assertEqual(2);
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.eventTrace()).assertEqual('');
      expect(graph.snapshotText()).assertEqual('A:idle:0|B:idle:0|C:idle:0');
    });

    /**
     * @tc.name   graphResetRestoresFlagAndTimer
     * @tc.desc   Reset re-enables the start button and drops the timer flag so the next start rebuilds the poll.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphResetRestoresFlagAndTimer', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      const timerBefore = graph.timerActive;
      graph.reset();
      logStep('CoreLifecycle', 'timer ' + String(timerBefore) + ' -> ' + String(graph.timerActive));
      expect(timerBefore).assertFalse();
      expect(graph.timerActive).assertFalse();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.lock.acquisitions).assertEqual(0);
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   graphRerunAfterResetReachesCompletedAgain
     * @tc.desc   The second lifecycle run ends in the same three completed rows as the first, with fresh attempts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphRerunAfterResetReachesCompletedAgain', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      const firstAttempts = graph.taskAt(0).attempts;
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_A);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      logStep('CoreLifecycle', 'rerun attempts ' + String(graph.taskAt(0).attempts));
      expect(firstAttempts).assertEqual(1);
      expect(graph.taskAt(0).attempts).assertEqual(2);
      expect(graph.taskAt(2).attempts).assertEqual(2);
      expect(graph.allCompleted()).assertTrue();
      expect(graph.totalProgress()).assertEqual(300);
      expect(completionTrace(graph)).assertEqual('B|A|C');
    });

    /**
     * @tc.name   lifecycleIsIndependentPerTask
     * @tc.desc   Completing A leaves B running and C idle, so the three rows never share a status field.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('lifecycleIsIndependentPerTask', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      logStep('CoreLifecycle', 'mixed rows ' + graph.snapshotText());
      expect(graph.taskAt(0).status).assertEqual(STATUS_COMPLETED);
      expect(graph.taskAt(1).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.runningCount()).assertEqual(1);
      expect(graph.allCompleted()).assertFalse();
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.taskAt(1).startedAt).assertEqual(0);
    });

    /**
     * @tc.name   secondRunRestampsStartTime
     * @tc.desc   A restarted row takes the new start stamp instead of keeping the first run's timestamp.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('secondRunRestampsStartTime', 0, () => {
      const task = new DownloadTask(TASK_A, 'https://example.com/a.png');
      task.start(100);
      task.complete(300);
      const firstStart = task.startedAt;
      task.reset();
      task.start(900);
      logStep('CoreLifecycle', 'start stamps ' + String(firstStart) + ' -> ' + String(task.startedAt));
      expect(firstStart).assertEqual(100);
      expect(task.startedAt).assertEqual(900);
      expect(task.finishedAt).assertEqual(0);
      expect(task.status).assertEqual(STATUS_RUNNING);
      expect(task.attempts).assertEqual(2);
      expect(task.isRunning()).assertTrue();
      expect(task.progress).assertEqual(0);
    });

    /**
     * @tc.name   expectedStepStatusTracksHalfDoneDependencies
     * @tc.desc   The step oracle reports running until both flags are set, then reports completed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('expectedStepStatusTracksHalfDoneDependencies', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const initial = expectedStepStatus(false, false);
      graph.completeTask(TASK_A);
      const half = expectedStepStatus(true, false);
      graph.completeTask(TASK_B);
      const done = expectedStepStatus(true, true);
      logStep('CoreLifecycle', 'step states ' + initial + '/' + half + '/' + done);
      expect(initial).assertEqual(STATUS_RUNNING);
      expect(half).assertEqual(STATUS_RUNNING);
      expect(done).assertEqual(STATUS_COMPLETED);
      expect(graph.canRunTaskC()).assertTrue();
      expect(done === initial).assertFalse();
      expect(expectedStepStatus(false, true)).assertEqual(STATUS_RUNNING);
    });

    /**
     * @tc.name   isTerminalStatusAgreesWithTaskHelpers
     * @tc.desc   The standalone terminal predicate matches the three per-status helpers of DownloadTask.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('isTerminalStatusAgreesWithTaskHelpers', 0, () => {
      const task = new DownloadTask(TASK_B, 'https://example.com/b.png');
      const idleTerminal = isTerminalStatus(task.status);
      task.start(0);
      const runningTerminal = isTerminalStatus(task.status);
      task.complete(10);
      const completedTerminal = isTerminalStatus(task.status);
      task.reset();
      task.start(20);
      task.fail(ERROR_TIMEOUT);
      const failedTerminal = isTerminalStatus(task.status);
      logStep('CoreLifecycle', 'terminal flags ' + String(idleTerminal) + String(runningTerminal) +
        String(completedTerminal) + String(failedTerminal));
      expect(idleTerminal).assertFalse();
      expect(runningTerminal).assertFalse();
      expect(completedTerminal).assertTrue();
      expect(failedTerminal).assertTrue();
      expect(task.isFailed()).assertTrue();
      expect(task.isRunning()).assertFalse();
      expect(task.attempts).assertEqual(2);
    });

    /**
     * @tc.name   metricsTrackCompletedRowsAfterRerun
     * @tc.desc   After a reset and a finished rerun the metrics see three completed rows and no failures.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsTrackCompletedRowsAfterRerun', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      const firstMetrics = NetworkMetrics.from(graph);
      graph.reset();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      const finalMetrics = NetworkMetrics.from(graph);
      logStep('CoreLifecycle', 'metrics ' + String(firstMetrics.completedTasks) + ' -> ' +
        String(finalMetrics.completedTasks));
      expect(firstMetrics.completedTasks).assertEqual(1);
      expect(firstMetrics.totalProgress).assertEqual(100);
      expect(finalMetrics.completedTasks).assertEqual(3);
      expect(finalMetrics.failedTasks).assertEqual(0);
      expect(finalMetrics.successRatio()).assertEqual(1);
      expect(finalMetrics.totalProgress).assertEqual(300);
      expect(finalMetrics.totalTasks).assertEqual(3);
    });

    /**
     * @tc.name   resetKeepsTaskNumberAndUrl
     * @tc.desc   Reset touches only mutable run state: identity fields of the row survive untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetKeepsTaskNumberAndUrl', 0, () => {
      const url = 'https://gitee.com/samples/raw/main/icon_main_color.png';
      const task = new DownloadTask(TASK_C, url);
      task.start(10);
      task.reportProgress(88);
      task.complete(90);
      task.reset();
      logStep('CoreLifecycle', 'identity ' + task.taskNo + ' ' + task.url);
      expect(task.taskNo).assertEqual(TASK_C);
      expect(task.url).assertEqual(url);
      expect(task.url.endsWith('icon_main_color.png')).assertTrue();
      expect(task.status).assertEqual(STATUS_IDLE);
      expect(task.progress).assertEqual(0);
      expect(task.attempts).assertEqual(1);
      expect(task.describe()).assertEqual('C:idle:0');
    });

    /**
     * @tc.name   timeoutPathMovesRunningToFailed
     * @tc.desc   A started row that times out lands on the failed state without ever reaching 100.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timeoutPathMovesRunningToFailed', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      b.reportProgress(55);
      const failed = b.fail(ERROR_TIMEOUT);
      logStep('CoreLifecycle', 'timeout row ' + b.describe());
      expect(failed).assertTrue();
      expect(b.status).assertEqual(STATUS_FAILED);
      expect(b.progress).assertEqual(55);
      expect(b.lastErrorCode).assertEqual(ERROR_TIMEOUT);
      expect(b.finishedAt).assertEqual(0);
      expect(b.isComplete()).assertFalse();
      expect(graph.runningCount()).assertEqual(1);
    });

    /**
     * @tc.name   attemptsReflectEveryLifecycleStart
     * @tc.desc   Three start/complete/reset rounds leave an attempt count of three on the same row object.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('attemptsReflectEveryLifecycleStart', 0, () => {
      const task = new DownloadTask(TASK_A, 'https://example.com/a.png');
      for (let round = 0; round < 3; round++) {
        task.start(round * 100);
        task.complete(round * 100 + 50);
        task.reset();
      }
      logStep('CoreLifecycle', 'attempts after three rounds ' + String(task.attempts));
      expect(task.attempts).assertEqual(3);
      expect(task.status).assertEqual(STATUS_IDLE);
      expect(task.progress).assertEqual(0);
      expect(task.startedAt).assertEqual(0);
      expect(task.finishedAt).assertEqual(0);
      expect(task.isIdle()).assertTrue();
      expect(task.attempts).assertLarger(1);
    });

    /**
     * @tc.name   lifecycleTraceOfAllThreeRowsMatchesScript
     * @tc.desc   Concatenating the three row descriptions after the journey shows the expected final state per row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('lifecycleTraceOfAllThreeRowsMatchesScript', 0, () => {
      const graph = createTaskGraph();
      const idleRows = joined([graph.taskAt(0).describe(), graph.taskAt(1).describe(),
        graph.taskAt(2).describe()], ' > ');
      graph.startAll();
      const runningRows = joined([graph.taskAt(0).describe(), graph.taskAt(1).describe(),
        graph.taskAt(2).describe()], ' > ');
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(POLL_INTERVAL_MS);
      graph.completeTaskC(POLL_INTERVAL_MS);
      logStep('CoreLifecycle', 'lifecycle trace ' + idleRows + ' / ' + runningRows);
      expect(idleRows).assertEqual('A:idle:0 > B:idle:0 > C:idle:0');
      expect(runningRows).assertEqual('A:running:0 > B:running:0 > C:idle:0');
      expect(graph.snapshotText()).assertEqual('A:completed:100|B:completed:100|C:completed:100');
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.taskAt(0).attempts).assertEqual(1);
    });

    /**
     * @tc.name   graphResetWhileRunningAbandonsTheRun
     * @tc.desc   Resetting mid-run drops both running rows back to idle and clears the poll without waiting for C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphResetWhileRunningAbandonsTheRun', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.pollTick(POLL_INTERVAL_MS);
      graph.reset();
      logStep('CoreLifecycle', 'abandoned run ' + graph.snapshotText());
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.taskAt(0).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(1).status).assertEqual(STATUS_IDLE);
      expect(graph.timerActive).assertFalse();
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
    });

    /**
     * @tc.name   singleTaskResetDoesNotTouchSiblings
     * @tc.desc   Resetting one row directly is local: the other two rows keep their own statuses and percentages.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('singleTaskResetDoesNotTouchSiblings', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      const b = graph.taskByNo(TASK_B) as DownloadTask;
      b.reportProgress(70);
      graph.taskAt(0).reset();
      logStep('CoreLifecycle', 'local reset ' + graph.snapshotText());
      expect(graph.taskAt(0).status).assertEqual(STATUS_IDLE);
      expect(graph.taskAt(0).progress).assertEqual(0);
      expect(graph.taskAt(1).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(1).progress).assertEqual(70);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.totalProgress()).assertEqual(70);
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
    });

    /**
     * @tc.name   freshGraphHasNoTerminalRows
     * @tc.desc   Before any start the graph has three non-terminal rows and the metrics count zero completions.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('freshGraphHasNoTerminalRows', 0, () => {
      const graph = createTaskGraph();
      const metrics = NetworkMetrics.from(graph);
      let terminalRows = 0;
      for (let index = 0; index < graph.tasks.length; index++) {
        if (isTerminalStatus(graph.taskAt(index).status)) {
          terminalRows = terminalRows + 1;
        }
      }
      logStep('CoreLifecycle', 'terminal rows in fresh graph ' + String(terminalRows));
      expect(terminalRows).assertEqual(0);
      expect(metrics.completedTasks).assertEqual(0);
      expect(metrics.failedTasks).assertEqual(0);
      expect(metrics.totalProgress).assertEqual(0);
      expect(metrics.successRatio()).assertEqual(0);
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      expect(expectedStepStatus(false, false)).assertEqual(STATUS_RUNNING);
    });

    /**
     * @tc.name   completionLeavesAttemptCounterAlone
     * @tc.desc   Only start() increments attempts, so a row that is completed without a start still reports zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreLifecycle scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('completionLeavesAttemptCounterAlone', 0, () => {
      const task = new DownloadTask(TASK_C, 'https://example.com/c.png');
      task.complete(60);
      logStep('CoreLifecycle', 'completion without start attempts ' + String(task.attempts));
      expect(task.attempts).assertEqual(0);
      expect(task.status).assertEqual(STATUS_COMPLETED);
      expect(task.startedAt).assertEqual(0);
      expect(task.finishedAt).assertEqual(60);
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(task.isComplete()).assertTrue();
    });
  });
}
